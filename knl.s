
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
  800194:	b8 ba 11 80 00       	mov    eax,0x8011ba
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
  800217:	b8 97 63 80 00       	mov    eax,0x806397
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 60 51 80 00       	mov    eax,0x805160
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 a0 72 80 00       	mov    eax,0x8072a0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 90 5b 80 00       	mov    eax,0x805b90
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
  800291:	e8 3a 4c 00 00       	call   804ed0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 2b 4c 00 00       	call   804ed0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 1c 4c 00 00       	call   804ed0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 0d 4c 00 00       	call   804ed0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 fe 4b 00 00       	call   804ed0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 ef 4b 00 00       	call   804ed0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 e0 4b 00 00       	call   804ed0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 d1 4b 00 00       	call   804ed0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 01 4c 00 00       	call   804f0a <turn_on_int>

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
  800327:	48 8b 15 12 a1 00 00 	mov    rdx,QWORD PTR [rip+0xa112]        # 80a440 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ee a0 00 00 	mov    rcx,QWORD PTR [rip+0xa0ee]        # 80a440 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 ce a0 00 00 	mov    rdx,QWORD PTR [rip+0xa0ce]        # 80a440 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 b6 a0 00 00 	mov    rdx,QWORD PTR [rip+0xa0b6]        # 80a440 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 9c a0 00 00 	mov    rdx,QWORD PTR [rip+0xa09c]        # 80a440 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 82 a0 00 00 	mov    rdx,QWORD PTR [rip+0xa082]        # 80a440 <idt>
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
  8003e1:	e8 18 4b 00 00       	call   804efe <eoi>
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
  8003fb:	e8 fe 4a 00 00       	call   804efe <eoi>
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
  800415:	e8 e4 4a 00 00       	call   804efe <eoi>
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
  80042f:	e8 ca 4a 00 00       	call   804efe <eoi>
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
  800449:	e8 b0 4a 00 00       	call   804efe <eoi>
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
  800463:	e8 96 4a 00 00       	call   804efe <eoi>
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
  80047c:	e8 7d 4a 00 00       	call   804efe <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 9f 4a 00 00       	call   804f2a <report_back_trace_of_err>
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
  8004a1:	e8 58 4a 00 00       	call   804efe <eoi>
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
  8004bb:	e8 3e 4a 00 00       	call   804efe <eoi>
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
  8004d4:	e8 25 4a 00 00       	call   804efe <eoi>
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
  8004ed:	e8 0c 4a 00 00       	call   804efe <eoi>
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
  800507:	e8 f2 49 00 00       	call   804efe <eoi>
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
  800521:	e8 d8 49 00 00       	call   804efe <eoi>
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
  800545:	e8 b4 49 00 00       	call   804efe <eoi>
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
  800562:	e8 97 49 00 00       	call   804efe <eoi>
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
  80059b:	48 8b 04 c5 a0 1a 81 	mov    rax,QWORD PTR [rax*8+0x811aa0]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 8c 25 00 00       	call   802b3f <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 dc 2f 00 00       	call   80359e <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 53 28 00 00       	call   802e27 <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 56 30 00 00       	call   80363c <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 45 2d 00 00       	call   803347 <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 fc 10 00 00       	call   801715 <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 fe 0e 00 00       	call   801529 <free_page>
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
  800648:	e8 6e 42 00 00       	call   8048bb <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 31 40 00 00       	call   80468d <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 83 11 00 00       	call   8017ee <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 52 15 00 00       	call   801bd2 <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 0c 1a 00 00       	call   80209b <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 05 1b 00 00       	call   8021b1 <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 57 1a 00 00       	call   802120 <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 62 1b 00 00       	call   802242 <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 9a 1b 00 00       	call   802289 <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 bc 13 00 00       	call   801ac7 <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 8c 13 00 00       	call   801aab <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 82 4a 00 00       	call   8051b3 <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 5d 41 00 00       	call   80489a <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 62 4b 00 00       	call   8052ae <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 f4 11 00 00       	call   80194c <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 f2 42 00 00       	call   804a56 <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 8d 44 00 00       	call   804bfd <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 2f 5d 00 00       	call   8064ab <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 e9 27 00 00       	call   802f77 <sys_find_dev>
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
  8007a8:	e8 5c 28 00 00       	call   803009 <sys_operate_dev>
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
  800803:	e8 68 03 00 00       	call   800b70 <init_logging>
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
  800834:	48 8b 04 c5 08 1e 81 	mov    rax,QWORD PTR [rax*8+0x811e08]
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
  800848:	e8 d5 07 00 00       	call   801022 <set_high_mem_base>
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
  80087e:	e8 b6 07 00 00       	call   801039 <set_mem_area>
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
  8008d8:	e8 78 54 00 00       	call   805d55 <set_framebuffer>
  8008dd:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008e1:	b8 00 00 00 00       	mov    eax,0x0
  8008e6:	e8 b5 52 00 00       	call   805ba0 <init_framebuffer>
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
  800aaf:	e8 ab 51 00 00       	call   805c5f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ab4:	bf c8 1d 81 00       	mov    edi,0x811dc8
  800ab9:	e8 53 56 00 00       	call   806111 <print>
    init_int();
  800abe:	b8 00 00 00 00       	mov    eax,0x0
  800ac3:	e8 38 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800ac8:	bf e5 1d 81 00       	mov    edi,0x811de5
  800acd:	e8 3f 56 00 00       	call   806111 <print>
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
  800b06:	e8 0c 43 00 00       	call   804e17 <set_tss>
  800b0b:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800b0f:	b8 00 00 00 00       	mov    eax,0x0
  800b14:	e8 d7 07 00 00       	call   8012f0 <init_memory>
    init_com(PORT_COM1);
  800b19:	bf f8 03 00 00       	mov    edi,0x3f8
  800b1e:	e8 b6 8d 00 00       	call   8098d9 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b23:	be f8 03 00 00       	mov    esi,0x3f8
  800b28:	bf f2 1d 81 00       	mov    edi,0x811df2
  800b2d:	e8 f3 8e 00 00       	call   809a25 <com_puts>
	init_paging();
  800b32:	b8 00 00 00 00       	mov    eax,0x0
  800b37:	e8 db 04 00 00       	call   801017 <init_paging>
 	init_gdt();
  800b3c:	b8 00 00 00 00       	mov    eax,0x0
  800b41:	e8 08 44 00 00       	call   804f4e <init_gdt>
    init_drvdev_man();
  800b46:	b8 00 00 00 00       	mov    eax,0x0
  800b4b:	e8 d5 1f 00 00       	call   802b25 <init_drvdev_man>
    init_proc();
  800b50:	b8 00 00 00 00       	mov    eax,0x0
  800b55:	e8 b6 2e 00 00       	call   803a10 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b5a:	b8 00 00 00 00       	mov    eax,0x0
  800b5f:	e8 14 58 00 00       	call   806378 <init_kb>
    manage_proc_lock=0;
  800b64:	c7 05 da 98 00 00 00 	mov    DWORD PTR [rip+0x98da],0x0        # 80a448 <manage_proc_lock>
  800b6b:	00 00 00 
    while (1);
  800b6e:	eb fe                	jmp    800b6e <main+0x393>

0000000000800b70 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b70:	f3 0f 1e fa          	endbr64 
  800b74:	55                   	push   rbp
  800b75:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b78:	48 c7 05 7d f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff47d],0xb8000        # 400000 <video>
  800b7f:	00 80 0b 00 
    xpos=0;
  800b83:	c7 05 7b f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff47b],0x0        # 400008 <xpos>
  800b8a:	00 00 00 
    ypos=0;
  800b8d:	c7 05 75 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff475],0x0        # 40000c <ypos>
  800b94:	00 00 00 
}
  800b97:	90                   	nop
  800b98:	5d                   	pop    rbp
  800b99:	c3                   	ret    

0000000000800b9a <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b9a:	f3 0f 1e fa          	endbr64 
  800b9e:	55                   	push   rbp
  800b9f:	48 89 e5             	mov    rbp,rsp
  800ba2:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800ba6:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800ba9:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bac:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bb0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bb4:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bb7:	48 98                	cdqe   
  800bb9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bbd:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bc4:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bc8:	75 27                	jne    800bf1 <itoa+0x57>
  800bca:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800bce:	79 21                	jns    800bf1 <itoa+0x57>
    {
        *p++ = '-';
  800bd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bd4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bd8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bdc:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800bdf:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800be4:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800be7:	f7 d8                	neg    eax
  800be9:	48 98                	cdqe   
  800beb:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bef:	eb 0d                	jmp    800bfe <itoa+0x64>
    }
    else if (base == 'x')
  800bf1:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bf5:	75 07                	jne    800bfe <itoa+0x64>
        divisor = 16;
  800bf7:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bfe:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c01:	48 63 c8             	movsxd rcx,eax
  800c04:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c08:	ba 00 00 00 00       	mov    edx,0x0
  800c0d:	48 f7 f1             	div    rcx
  800c10:	48 89 d0             	mov    rax,rdx
  800c13:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c16:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c1a:	7f 0a                	jg     800c26 <itoa+0x8c>
  800c1c:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c1f:	83 c0 30             	add    eax,0x30
  800c22:	89 c1                	mov    ecx,eax
  800c24:	eb 08                	jmp    800c2e <itoa+0x94>
  800c26:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c29:	83 c0 57             	add    eax,0x57
  800c2c:	89 c1                	mov    ecx,eax
  800c2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c32:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c36:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c3a:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c3c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c3f:	48 63 f0             	movsxd rsi,eax
  800c42:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c46:	ba 00 00 00 00       	mov    edx,0x0
  800c4b:	48 f7 f6             	div    rsi
  800c4e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c52:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c57:	75 a5                	jne    800bfe <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c5d:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c60:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c64:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c6c:	48 83 e8 01          	sub    rax,0x1
  800c70:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c74:	eb 2b                	jmp    800ca1 <itoa+0x107>
    {
        char tmp = *p1;
  800c76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c7a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c7d:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c84:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c87:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c8b:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c8d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c91:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c95:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c97:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c9c:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800ca1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ca5:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800ca9:	72 cb                	jb     800c76 <itoa+0xdc>
    }
}
  800cab:	90                   	nop
  800cac:	90                   	nop
  800cad:	5d                   	pop    rbp
  800cae:	c3                   	ret    

0000000000800caf <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800caf:	f3 0f 1e fa          	endbr64 
  800cb3:	55                   	push   rbp
  800cb4:	48 89 e5             	mov    rbp,rsp
  800cb7:	48 83 ec 20          	sub    rsp,0x20
  800cbb:	89 f8                	mov    eax,edi
  800cbd:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cc0:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800cc4:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800cc7:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800ccb:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800ccf:	48 89 c7             	mov    rdi,rax
  800cd2:	e8 3a 54 00 00       	call   806111 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800cd7:	c9                   	leave  
  800cd8:	c3                   	ret    

0000000000800cd9 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800cd9:	f3 0f 1e fa          	endbr64 
  800cdd:	55                   	push   rbp
  800cde:	48 89 e5             	mov    rbp,rsp
  800ce1:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800ce8:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800cef:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800cf6:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800cfd:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d04:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d0b:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d12:	84 c0                	test   al,al
  800d14:	74 20                	je     800d36 <printf+0x5d>
  800d16:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d1a:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d1e:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d22:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d26:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d2a:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d2e:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d32:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d36:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d3d:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d44:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d4b:	08 
 
    while ((c = *format++) != 0)
  800d4c:	e9 29 01 00 00       	jmp    800e7a <printf+0x1a1>
    {
        if (c != '%')
  800d51:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d58:	74 13                	je     800d6d <printf+0x94>
            putchar (c);
  800d5a:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d61:	89 c7                	mov    edi,eax
  800d63:	e8 47 ff ff ff       	call   800caf <putchar>
  800d68:	e9 0d 01 00 00       	jmp    800e7a <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d6d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d74:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d78:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d82:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d88:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d8f:	83 f8 78             	cmp    eax,0x78
  800d92:	74 26                	je     800dba <printf+0xe1>
  800d94:	83 f8 78             	cmp    eax,0x78
  800d97:	0f 8f be 00 00 00    	jg     800e5b <printf+0x182>
  800d9d:	83 f8 75             	cmp    eax,0x75
  800da0:	74 18                	je     800dba <printf+0xe1>
  800da2:	83 f8 75             	cmp    eax,0x75
  800da5:	0f 8f b0 00 00 00    	jg     800e5b <printf+0x182>
  800dab:	83 f8 64             	cmp    eax,0x64
  800dae:	74 0a                	je     800dba <printf+0xe1>
  800db0:	83 f8 73             	cmp    eax,0x73
  800db3:	74 41                	je     800df6 <printf+0x11d>
  800db5:	e9 a1 00 00 00       	jmp    800e5b <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800dba:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dc1:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dc5:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dcc:	8b 10                	mov    edx,DWORD PTR [rax]
  800dce:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800dd5:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800ddc:	89 ce                	mov    esi,ecx
  800dde:	48 89 c7             	mov    rdi,rax
  800de1:	e8 b4 fd ff ff       	call   800b9a <itoa>
                p = buf;
  800de6:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800ded:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800df4:	eb 34                	jmp    800e2a <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800df6:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dfd:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e01:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e08:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e0b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e12:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e19:	00 
  800e1a:	75 0d                	jne    800e29 <printf+0x150>
                    p = "(null)";
  800e1c:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811e50
  800e23:	50 1e 81 00 
  800e27:	eb 22                	jmp    800e4b <printf+0x172>
 
string:
  800e29:	90                   	nop
                while (*p)
  800e2a:	eb 1f                	jmp    800e4b <printf+0x172>
                    putchar (*p++);
  800e2c:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e33:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e37:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e41:	0f be c0             	movsx  eax,al
  800e44:	89 c7                	mov    edi,eax
  800e46:	e8 64 fe ff ff       	call   800caf <putchar>
                while (*p)
  800e4b:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e52:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e55:	84 c0                	test   al,al
  800e57:	75 d3                	jne    800e2c <printf+0x153>
                break;
  800e59:	eb 1f                	jmp    800e7a <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e5b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e62:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e66:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e6d:	8b 00                	mov    eax,DWORD PTR [rax]
  800e6f:	0f be c0             	movsx  eax,al
  800e72:	89 c7                	mov    edi,eax
  800e74:	e8 36 fe ff ff       	call   800caf <putchar>
                break;
  800e79:	90                   	nop
    while ((c = *format++) != 0)
  800e7a:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e81:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e85:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e8f:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e95:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800e9c:	0f 85 af fe ff ff    	jne    800d51 <printf+0x78>
            }
        }
    }
}
  800ea2:	90                   	nop
  800ea3:	90                   	nop
  800ea4:	c9                   	leave  
  800ea5:	c3                   	ret    

0000000000800ea6 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ea6:	f3 0f 1e fa          	endbr64 
  800eaa:	55                   	push   rbp
  800eab:	48 89 e5             	mov    rbp,rsp
  800eae:	48 83 ec 40          	sub    rsp,0x40
  800eb2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800eb6:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800eba:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ebd:	48 8b 15 9c 95 00 00 	mov    rdx,QWORD PTR [rip+0x959c]        # 80a460 <pml4>
  800ec4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ec8:	48 c1 e8 27          	shr    rax,0x27
  800ecc:	48 c1 e0 03          	shl    rax,0x3
  800ed0:	48 01 d0             	add    rax,rdx
  800ed3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ed6:	b0 00                	mov    al,0x0
  800ed8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800edc:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800ee3:	00 00 00 
  800ee6:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800eea:	48 c1 e8 1e          	shr    rax,0x1e
  800eee:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ef1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ef4:	48 98                	cdqe   
  800ef6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800efd:	00 
  800efe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f02:	48 01 d0             	add    rax,rdx
  800f05:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f08:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f10:	83 e0 01             	and    eax,0x1
  800f13:	48 85 c0             	test   rax,rax
  800f16:	75 2f                	jne    800f47 <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800f18:	b8 00 00 00 00       	mov    eax,0x0
  800f1d:	e8 a3 01 00 00       	call   8010c5 <vmalloc>
  800f22:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f26:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f29:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f2d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f30:	48 98                	cdqe   
  800f32:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f39:	00 
  800f3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f3e:	48 01 f0             	add    rax,rsi
  800f41:	48 09 ca             	or     rdx,rcx
  800f44:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f4b:	b0 00                	mov    al,0x0
  800f4d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f51:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f55:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f5a:	48 c1 e8 15          	shr    rax,0x15
  800f5e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f65:	00 
  800f66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f6a:	48 01 d0             	add    rax,rdx
  800f6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f70:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f78:	83 e0 01             	and    eax,0x1
  800f7b:	48 85 c0             	test   rax,rax
  800f7e:	75 37                	jne    800fb7 <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f80:	b8 00 00 00 00       	mov    eax,0x0
  800f85:	e8 3b 01 00 00       	call   8010c5 <vmalloc>
  800f8a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f8e:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f91:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f95:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f99:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f9e:	48 c1 e8 15          	shr    rax,0x15
  800fa2:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fa9:	00 
  800faa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fae:	48 01 f0             	add    rax,rsi
  800fb1:	48 09 ca             	or     rdx,rcx
  800fb4:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fb7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fbb:	b0 00                	mov    al,0x0
  800fbd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800fc1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fc4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800fc8:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800fce:	48 c1 ea 0c          	shr    rdx,0xc
  800fd2:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fd9:	00 
  800fda:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fde:	48 01 ca             	add    rdx,rcx
  800fe1:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fe5:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800fe8:	b8 00 00 00 00       	mov    eax,0x0
}
  800fed:	c9                   	leave  
  800fee:	c3                   	ret    

0000000000800fef <mdemap>:

stat_t mdemap(addr_t la)
{
  800fef:	f3 0f 1e fa          	endbr64 
  800ff3:	55                   	push   rbp
  800ff4:	48 89 e5             	mov    rbp,rsp
  800ff7:	48 83 ec 10          	sub    rsp,0x10
  800ffb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800fff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801003:	ba 00 00 00 00       	mov    edx,0x0
  801008:	48 89 c6             	mov    rsi,rax
  80100b:	bf 00 00 00 00       	mov    edi,0x0
  801010:	e8 91 fe ff ff       	call   800ea6 <mmap>
}
  801015:	c9                   	leave  
  801016:	c3                   	ret    

0000000000801017 <init_paging>:
int init_paging()
{
  801017:	f3 0f 1e fa          	endbr64 
  80101b:	55                   	push   rbp
  80101c:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80101f:	90                   	nop
  801020:	5d                   	pop    rbp
  801021:	c3                   	ret    

0000000000801022 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801022:	f3 0f 1e fa          	endbr64 
  801026:	55                   	push   rbp
  801027:	48 89 e5             	mov    rbp,rsp
  80102a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  80102d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801030:	89 05 42 94 00 00    	mov    DWORD PTR [rip+0x9442],eax        # 80a478 <high_mem_base>
}
  801036:	90                   	nop
  801037:	5d                   	pop    rbp
  801038:	c3                   	ret    

0000000000801039 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  801039:	f3 0f 1e fa          	endbr64 
  80103d:	55                   	push   rbp
  80103e:	48 89 e5             	mov    rbp,rsp
  801041:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801045:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  801049:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  80104d:	8b 05 cd f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1cd]        # 400220 <mmap_t_i>
  801053:	48 63 d0             	movsxd rdx,eax
  801056:	48 89 d0             	mov    rax,rdx
  801059:	48 01 c0             	add    rax,rax
  80105c:	48 01 d0             	add    rax,rdx
  80105f:	48 c1 e0 03          	shl    rax,0x3
  801063:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80106a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80106e:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801071:	8b 05 a9 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1a9]        # 400220 <mmap_t_i>
  801077:	48 63 d0             	movsxd rdx,eax
  80107a:	48 89 d0             	mov    rax,rdx
  80107d:	48 01 c0             	add    rax,rax
  801080:	48 01 d0             	add    rax,rdx
  801083:	48 c1 e0 03          	shl    rax,0x3
  801087:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  80108e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801092:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801095:	8b 05 85 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff185]        # 400220 <mmap_t_i>
  80109b:	8d 50 01             	lea    edx,[rax+0x1]
  80109e:	89 15 7c f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff17c],edx        # 400220 <mmap_t_i>
  8010a4:	48 63 d0             	movsxd rdx,eax
  8010a7:	48 89 d0             	mov    rax,rdx
  8010aa:	48 01 c0             	add    rax,rax
  8010ad:	48 01 d0             	add    rax,rdx
  8010b0:	48 c1 e0 03          	shl    rax,0x3
  8010b4:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8010bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010bf:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8010c2:	90                   	nop
  8010c3:	5d                   	pop    rbp
  8010c4:	c3                   	ret    

00000000008010c5 <vmalloc>:
addr_t vmalloc()
{
  8010c5:	f3 0f 1e fa          	endbr64 
  8010c9:	55                   	push   rbp
  8010ca:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010cd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8010d4:	eb 76                	jmp    80114c <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8010d6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8010dd:	eb 63                	jmp    801142 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8010df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010e2:	48 98                	cdqe   
  8010e4:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8010eb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010ee:	be 01 00 00 00       	mov    esi,0x1
  8010f3:	89 c1                	mov    ecx,eax
  8010f5:	d3 e6                	shl    esi,cl
  8010f7:	89 f0                	mov    eax,esi
  8010f9:	21 d0                	and    eax,edx
  8010fb:	85 c0                	test   eax,eax
  8010fd:	75 3f                	jne    80113e <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8010ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801102:	48 98                	cdqe   
  801104:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80110b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80110e:	be 01 00 00 00       	mov    esi,0x1
  801113:	89 c1                	mov    ecx,eax
  801115:	d3 e6                	shl    esi,cl
  801117:	89 f0                	mov    eax,esi
  801119:	09 c2                	or     edx,eax
  80111b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80111e:	48 98                	cdqe   
  801120:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801127:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80112a:	c1 e0 05             	shl    eax,0x5
  80112d:	89 c2                	mov    edx,eax
  80112f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801132:	01 d0                	add    eax,edx
  801134:	83 c0 20             	add    eax,0x20
  801137:	c1 e0 0c             	shl    eax,0xc
  80113a:	48 98                	cdqe   
  80113c:	eb 14                	jmp    801152 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  80113e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801142:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801146:	7e 97                	jle    8010df <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801148:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80114c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801150:	7e 84                	jle    8010d6 <vmalloc+0x11>
            }
        }
    }
}
  801152:	5d                   	pop    rbp
  801153:	c3                   	ret    

0000000000801154 <vmfree>:

int vmfree(addr_t ptr)
{
  801154:	f3 0f 1e fa          	endbr64 
  801158:	55                   	push   rbp
  801159:	48 89 e5             	mov    rbp,rsp
  80115c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801160:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801164:	48 c1 e8 0c          	shr    rax,0xc
  801168:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80116b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80116e:	8d 50 1f             	lea    edx,[rax+0x1f]
  801171:	85 c0                	test   eax,eax
  801173:	0f 48 c2             	cmovs  eax,edx
  801176:	c1 f8 05             	sar    eax,0x5
  801179:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80117c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80117f:	99                   	cdq    
  801180:	c1 ea 1b             	shr    edx,0x1b
  801183:	01 d0                	add    eax,edx
  801185:	83 e0 1f             	and    eax,0x1f
  801188:	29 d0                	sub    eax,edx
  80118a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  80118d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801190:	48 98                	cdqe   
  801192:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801199:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80119c:	be 01 00 00 00       	mov    esi,0x1
  8011a1:	89 c1                	mov    ecx,eax
  8011a3:	d3 e6                	shl    esi,cl
  8011a5:	89 f0                	mov    eax,esi
  8011a7:	f7 d0                	not    eax
  8011a9:	21 c2                	and    edx,eax
  8011ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011ae:	48 98                	cdqe   
  8011b0:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8011b7:	90                   	nop
  8011b8:	5d                   	pop    rbp
  8011b9:	c3                   	ret    

00000000008011ba <page_err>:
void page_err(){
  8011ba:	f3 0f 1e fa          	endbr64 
  8011be:	55                   	push   rbp
  8011bf:	48 89 e5             	mov    rbp,rsp
  8011c2:	53                   	push   rbx
  8011c3:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  8011c7:	fa                   	cli    
    print("page err\n");
  8011c8:	bf 58 1e 81 00       	mov    edi,0x811e58
  8011cd:	e8 3f 4f 00 00       	call   806111 <print>
    unsigned long err_code=0,l_addr=0;
  8011d2:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8011d9:	00 
  8011da:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8011e1:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8011e2:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8011e6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8011ea:	0f 20 d0             	mov    rax,cr2
  8011ed:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8011f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011f5:	83 e0 01             	and    eax,0x1
  8011f8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8011fb:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011ff:	75 27                	jne    801228 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801201:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801205:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80120b:	48 89 c3             	mov    rbx,rax
  80120e:	b8 00 00 00 00       	mov    eax,0x0
  801213:	e8 ad fe ff ff       	call   8010c5 <vmalloc>
  801218:	ba 07 00 00 00       	mov    edx,0x7
  80121d:	48 89 de             	mov    rsi,rbx
  801220:	48 89 c7             	mov    rdi,rax
  801223:	e8 7e fc ff ff       	call   800ea6 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801228:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80122c:	83 e0 02             	and    eax,0x2
  80122f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801232:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801236:	74 0c                	je     801244 <page_err+0x8a>
  801238:	bf 62 1e 81 00       	mov    edi,0x811e62
  80123d:	e8 cf 4e 00 00       	call   806111 <print>
  801242:	eb 0a                	jmp    80124e <page_err+0x94>
    p=err_code&4;
  801244:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801248:	83 e0 04             	and    eax,0x4
  80124b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80124e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801252:	75 0c                	jne    801260 <page_err+0xa6>
  801254:	bf 70 1e 81 00       	mov    edi,0x811e70
  801259:	e8 b3 4e 00 00       	call   806111 <print>
  80125e:	eb 0a                	jmp    80126a <page_err+0xb0>
    p=err_code&16;
  801260:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801264:	83 e0 10             	and    eax,0x10
  801267:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80126a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80126e:	74 0a                	je     80127a <page_err+0xc0>
  801270:	bf 88 1e 81 00       	mov    edi,0x811e88
  801275:	e8 97 4e 00 00       	call   806111 <print>
    unsigned int addr=0;
  80127a:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  801281:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  801285:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801288:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80128c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80128f:	89 c6                	mov    esi,eax
  801291:	bf a8 1e 81 00       	mov    edi,0x811ea8
  801296:	b8 00 00 00 00       	mov    eax,0x0
  80129b:	e8 39 fa ff ff       	call   800cd9 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012a0:	48 8b 0d f9 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc071f9]        # 4084a0 <task>
  8012a7:	8b 05 5f 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1325f]        # 41450c <cur_proc>
  8012ad:	48 63 d0             	movsxd rdx,eax
  8012b0:	48 89 d0             	mov    rax,rdx
  8012b3:	48 01 c0             	add    rax,rax
  8012b6:	48 01 d0             	add    rax,rdx
  8012b9:	48 c1 e0 08          	shl    rax,0x8
  8012bd:	48 01 c8             	add    rax,rcx
  8012c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8012c2:	83 f8 01             	cmp    eax,0x1
  8012c5:	75 11                	jne    8012d8 <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  8012c7:	bf ca 1e 81 00       	mov    edi,0x811eca
  8012cc:	b8 00 00 00 00       	mov    eax,0x0
  8012d1:	e8 03 fa ff ff       	call   800cd9 <printf>
        asm volatile("jmp .");
  8012d6:	eb fe                	jmp    8012d6 <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8012d8:	b8 00 00 00 00       	mov    eax,0x0
  8012dd:	e8 1c 3c 00 00       	call   804efe <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  8012e2:	fb                   	sti    
  8012e3:	c9                   	leave  
  8012e4:	83 c4 08             	add    esp,0x8
  8012e7:	48 cf                	iretq  
}
  8012e9:	90                   	nop
  8012ea:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8012ee:	c9                   	leave  
  8012ef:	c3                   	ret    

00000000008012f0 <init_memory>:
void init_memory()
{
  8012f0:	f3 0f 1e fa          	endbr64 
  8012f4:	55                   	push   rbp
  8012f5:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  8012f8:	8b 05 22 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef22]        # 400220 <mmap_t_i>
  8012fe:	83 e8 01             	sub    eax,0x1
  801301:	48 63 d0             	movsxd rdx,eax
  801304:	48 89 d0             	mov    rax,rdx
  801307:	48 01 c0             	add    rax,rax
  80130a:	48 01 d0             	add    rax,rdx
  80130d:	48 c1 e0 03          	shl    rax,0x3
  801311:	48 05 40 00 40 00    	add    rax,0x400040
  801317:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80131a:	8b 05 00 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef00]        # 400220 <mmap_t_i>
  801320:	83 e8 01             	sub    eax,0x1
  801323:	48 63 d0             	movsxd rdx,eax
  801326:	48 89 d0             	mov    rax,rdx
  801329:	48 01 c0             	add    rax,rax
  80132c:	48 01 d0             	add    rax,rdx
  80132f:	48 c1 e0 03          	shl    rax,0x3
  801333:	48 05 48 00 40 00    	add    rax,0x400048
  801339:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80133c:	48 01 c8             	add    rax,rcx
  80133f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801343:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801347:	48 c1 e8 0c          	shr    rax,0xc
  80134b:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  80134e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801351:	8d 50 1f             	lea    edx,[rax+0x1f]
  801354:	85 c0                	test   eax,eax
  801356:	0f 48 c2             	cmovs  eax,edx
  801359:	c1 f8 05             	sar    eax,0x5
  80135c:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  80135f:	48 c7 05 b6 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfecb6],0xc00000        # 400020 <page_map>
  801366:	00 00 c0 00 
    int* p=page_map;
  80136a:	48 8b 05 af ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfecaf]        # 400020 <page_map>
  801371:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801375:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80137c:	00 
    for(int i=0;i<mmap_t_i;i++){
  80137d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801384:	e9 91 00 00 00       	jmp    80141a <init_memory+0x12a>
        int cont=0;
  801389:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801390:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801393:	48 63 d0             	movsxd rdx,eax
  801396:	48 89 d0             	mov    rax,rdx
  801399:	48 01 c0             	add    rax,rax
  80139c:	48 01 d0             	add    rax,rdx
  80139f:	48 c1 e0 03          	shl    rax,0x3
  8013a3:	48 05 50 00 40 00    	add    rax,0x400050
  8013a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013ac:	48 83 f8 01          	cmp    rax,0x1
  8013b0:	74 07                	je     8013b9 <init_memory+0xc9>
            cont=-1;
  8013b2:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013b9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8013c0:	eb 15                	jmp    8013d7 <init_memory+0xe7>
            *(p++)=cont;
  8013c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8013c6:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8013ca:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8013ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8013d1:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013d3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8013d7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8013da:	48 63 c8             	movsxd rcx,eax
  8013dd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013e0:	48 63 d0             	movsxd rdx,eax
  8013e3:	48 89 d0             	mov    rax,rdx
  8013e6:	48 01 c0             	add    rax,rax
  8013e9:	48 01 d0             	add    rax,rdx
  8013ec:	48 c1 e0 03          	shl    rax,0x3
  8013f0:	48 05 48 00 40 00    	add    rax,0x400048
  8013f6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013f9:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801400:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801407:	ff 00 00 
  80140a:	48 21 d0             	and    rax,rdx
  80140d:	48 c1 e8 11          	shr    rax,0x11
  801411:	48 39 c1             	cmp    rcx,rax
  801414:	72 ac                	jb     8013c2 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  801416:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80141a:	8b 05 00 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee00]        # 400220 <mmap_t_i>
  801420:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801423:	0f 8c 60 ff ff ff    	jl     801389 <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  801429:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801430:	eb 1d                	jmp    80144f <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801432:	48 8b 15 e7 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebe7]        # 400020 <page_map>
  801439:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80143c:	48 98                	cdqe   
  80143e:	48 c1 e0 02          	shl    rax,0x2
  801442:	48 01 d0             	add    rax,rdx
  801445:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80144b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80144f:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801453:	7e dd                	jle    801432 <init_memory+0x142>
    }
}
  801455:	90                   	nop
  801456:	90                   	nop
  801457:	5d                   	pop    rbp
  801458:	c3                   	ret    

0000000000801459 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801459:	f3 0f 1e fa          	endbr64 
  80145d:	55                   	push   rbp
  80145e:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801461:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801468:	e9 b0 00 00 00       	jmp    80151d <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  80146d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801474:	e9 96 00 00 00       	jmp    80150f <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801479:	48 8b 15 a0 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeba0]        # 400020 <page_map>
  801480:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801483:	48 98                	cdqe   
  801485:	48 c1 e0 02          	shl    rax,0x2
  801489:	48 01 d0             	add    rax,rdx
  80148c:	8b 10                	mov    edx,DWORD PTR [rax]
  80148e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801491:	be 01 00 00 00       	mov    esi,0x1
  801496:	89 c1                	mov    ecx,eax
  801498:	d3 e6                	shl    esi,cl
  80149a:	89 f0                	mov    eax,esi
  80149c:	21 d0                	and    eax,edx
  80149e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8014a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014a4:	c1 e0 05             	shl    eax,0x5
  8014a7:	89 c2                	mov    edx,eax
  8014a9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014ac:	01 d0                	add    eax,edx
  8014ae:	c1 e0 0c             	shl    eax,0xc
  8014b1:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8014b6:	7e 53                	jle    80150b <req_a_page+0xb2>
  8014b8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8014bc:	75 4d                	jne    80150b <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8014be:	48 8b 15 5b eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb5b]        # 400020 <page_map>
  8014c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014c8:	48 98                	cdqe   
  8014ca:	48 c1 e0 02          	shl    rax,0x2
  8014ce:	48 01 d0             	add    rax,rdx
  8014d1:	8b 10                	mov    edx,DWORD PTR [rax]
  8014d3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014d6:	be 01 00 00 00       	mov    esi,0x1
  8014db:	89 c1                	mov    ecx,eax
  8014dd:	d3 e6                	shl    esi,cl
  8014df:	89 f0                	mov    eax,esi
  8014e1:	89 c6                	mov    esi,eax
  8014e3:	48 8b 0d 36 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb36]        # 400020 <page_map>
  8014ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014ed:	48 98                	cdqe   
  8014ef:	48 c1 e0 02          	shl    rax,0x2
  8014f3:	48 01 c8             	add    rax,rcx
  8014f6:	09 f2                	or     edx,esi
  8014f8:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  8014fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014fd:	c1 e0 05             	shl    eax,0x5
  801500:	89 c2                	mov    edx,eax
  801502:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801505:	01 d0                	add    eax,edx
  801507:	48 98                	cdqe   
  801509:	eb 1c                	jmp    801527 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80150b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80150f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801513:	0f 8e 60 ff ff ff    	jle    801479 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801519:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80151d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801521:	0f 8e 46 ff ff ff    	jle    80146d <req_a_page+0x14>

            }
        }
    }
}
  801527:	5d                   	pop    rbp
  801528:	c3                   	ret    

0000000000801529 <free_page>:

int free_page(char *paddr){
  801529:	f3 0f 1e fa          	endbr64 
  80152d:	55                   	push   rbp
  80152e:	48 89 e5             	mov    rbp,rsp
  801531:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801535:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801539:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80153f:	85 c0                	test   eax,eax
  801541:	0f 48 c2             	cmovs  eax,edx
  801544:	c1 f8 0c             	sar    eax,0xc
  801547:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80154a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80154d:	8d 50 1f             	lea    edx,[rax+0x1f]
  801550:	85 c0                	test   eax,eax
  801552:	0f 48 c2             	cmovs  eax,edx
  801555:	c1 f8 05             	sar    eax,0x5
  801558:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80155b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80155e:	99                   	cdq    
  80155f:	c1 ea 1b             	shr    edx,0x1b
  801562:	01 d0                	add    eax,edx
  801564:	83 e0 1f             	and    eax,0x1f
  801567:	29 d0                	sub    eax,edx
  801569:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  80156c:	48 8b 15 ad ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeaad]        # 400020 <page_map>
  801573:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801576:	48 98                	cdqe   
  801578:	48 c1 e0 02          	shl    rax,0x2
  80157c:	48 01 d0             	add    rax,rdx
  80157f:	8b 10                	mov    edx,DWORD PTR [rax]
  801581:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801584:	be 01 00 00 00       	mov    esi,0x1
  801589:	89 c1                	mov    ecx,eax
  80158b:	d3 e6                	shl    esi,cl
  80158d:	89 f0                	mov    eax,esi
  80158f:	f7 d0                	not    eax
  801591:	89 c6                	mov    esi,eax
  801593:	48 8b 0d 86 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea86]        # 400020 <page_map>
  80159a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80159d:	48 98                	cdqe   
  80159f:	48 c1 e0 02          	shl    rax,0x2
  8015a3:	48 01 c8             	add    rax,rcx
  8015a6:	21 f2                	and    edx,esi
  8015a8:	89 10                	mov    DWORD PTR [rax],edx
}
  8015aa:	90                   	nop
  8015ab:	5d                   	pop    rbp
  8015ac:	c3                   	ret    

00000000008015ad <check_page>:
int check_page(int num){
  8015ad:	f3 0f 1e fa          	endbr64 
  8015b1:	55                   	push   rbp
  8015b2:	48 89 e5             	mov    rbp,rsp
  8015b5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8015b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015bb:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015be:	85 c0                	test   eax,eax
  8015c0:	0f 48 c2             	cmovs  eax,edx
  8015c3:	c1 f8 05             	sar    eax,0x5
  8015c6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8015c9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015cc:	99                   	cdq    
  8015cd:	c1 ea 1b             	shr    edx,0x1b
  8015d0:	01 d0                	add    eax,edx
  8015d2:	83 e0 1f             	and    eax,0x1f
  8015d5:	29 d0                	sub    eax,edx
  8015d7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8015da:	48 8b 15 3f ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea3f]        # 400020 <page_map>
  8015e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015e4:	48 98                	cdqe   
  8015e6:	48 c1 e0 02          	shl    rax,0x2
  8015ea:	48 01 d0             	add    rax,rdx
  8015ed:	8b 10                	mov    edx,DWORD PTR [rax]
  8015ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015f2:	be 01 00 00 00       	mov    esi,0x1
  8015f7:	89 c1                	mov    ecx,eax
  8015f9:	d3 e6                	shl    esi,cl
  8015fb:	89 f0                	mov    eax,esi
  8015fd:	21 d0                	and    eax,edx
  8015ff:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801602:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801605:	5d                   	pop    rbp
  801606:	c3                   	ret    

0000000000801607 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801607:	f3 0f 1e fa          	endbr64 
  80160b:	55                   	push   rbp
  80160c:	48 89 e5             	mov    rbp,rsp
  80160f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801612:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801615:	c1 e0 0c             	shl    eax,0xc
}
  801618:	5d                   	pop    rbp
  801619:	c3                   	ret    

000000000080161a <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80161a:	f3 0f 1e fa          	endbr64 
  80161e:	55                   	push   rbp
  80161f:	48 89 e5             	mov    rbp,rsp
  801622:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801626:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801629:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80162c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801630:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801637:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80163b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80163e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801641:	89 c0                	mov    eax,eax
  801643:	25 00 f0 ff ff       	and    eax,0xfffff000
  801648:	48 09 c2             	or     rdx,rax
  80164b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80164f:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801656:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801659:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80165c:	48 98                	cdqe   
  80165e:	48 09 c2             	or     rdx,rax
  801661:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801665:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801668:	90                   	nop
  801669:	5d                   	pop    rbp
  80166a:	c3                   	ret    

000000000080166b <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80166b:	f3 0f 1e fa          	endbr64 
  80166f:	55                   	push   rbp
  801670:	48 89 e5             	mov    rbp,rsp
  801673:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801677:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80167a:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  80167d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801681:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80168c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80168f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801692:	0c 81                	or     al,0x81
  801694:	89 c0                	mov    eax,eax
  801696:	48 09 c2             	or     rdx,rax
  801699:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80169d:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016a0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016a3:	25 00 00 00 c0       	and    eax,0xc0000000
  8016a8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8016ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016af:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016b5:	48 09 c2             	or     rdx,rax
  8016b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016bc:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016bf:	90                   	nop
  8016c0:	5d                   	pop    rbp
  8016c1:	c3                   	ret    

00000000008016c2 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  8016c2:	f3 0f 1e fa          	endbr64 
  8016c6:	55                   	push   rbp
  8016c7:	48 89 e5             	mov    rbp,rsp
  8016ca:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016ce:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  8016d1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  8016dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8016e3:	48 0d 81 10 00 00    	or     rax,0x1081
  8016e9:	48 89 c2             	mov    rdx,rax
  8016ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016f0:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8016f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016f6:	25 00 00 c0 ff       	and    eax,0xffc00000
  8016fb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8016fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801702:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801705:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801708:	48 09 c2             	or     rdx,rax
  80170b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80170f:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801712:	90                   	nop
  801713:	5d                   	pop    rbp
  801714:	c3                   	ret    

0000000000801715 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801715:	f3 0f 1e fa          	endbr64 
  801719:	55                   	push   rbp
  80171a:	48 89 e5             	mov    rbp,rsp
  80171d:	48 83 ec 20          	sub    rsp,0x20
  801721:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801725:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801728:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80172d:	75 18                	jne    801747 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80172f:	b8 00 00 00 00       	mov    eax,0x0
  801734:	e8 20 fd ff ff       	call   801459 <req_a_page>
  801739:	89 c7                	mov    edi,eax
  80173b:	e8 c7 fe ff ff       	call   801607 <get_phyaddr>
  801740:	48 98                	cdqe   
  801742:	e9 a5 00 00 00       	jmp    8017ec <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801747:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80174b:	89 c2                	mov    edx,eax
  80174d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801750:	89 c6                	mov    esi,eax
  801752:	89 d7                	mov    edi,edx
  801754:	e8 52 01 00 00       	call   8018ab <is_pgs_ava>
  801759:	85 c0                	test   eax,eax
  80175b:	75 0c                	jne    801769 <req_page_at+0x54>
  80175d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801764:	e9 83 00 00 00       	jmp    8017ec <req_page_at+0xd7>
    int pgni=base/4096;
  801769:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80176d:	48 c1 e8 0c          	shr    rax,0xc
  801771:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801774:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801777:	8d 50 1f             	lea    edx,[rax+0x1f]
  80177a:	85 c0                	test   eax,eax
  80177c:	0f 48 c2             	cmovs  eax,edx
  80177f:	c1 f8 05             	sar    eax,0x5
  801782:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801785:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801788:	99                   	cdq    
  801789:	c1 ea 1b             	shr    edx,0x1b
  80178c:	01 d0                	add    eax,edx
  80178e:	83 e0 1f             	and    eax,0x1f
  801791:	29 d0                	sub    eax,edx
  801793:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801796:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80179d:	eb 40                	jmp    8017df <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80179f:	48 8b 15 7a e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe87a]        # 400020 <page_map>
  8017a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017a9:	48 98                	cdqe   
  8017ab:	48 c1 e0 02          	shl    rax,0x2
  8017af:	48 01 d0             	add    rax,rdx
  8017b2:	8b 10                	mov    edx,DWORD PTR [rax]
  8017b4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8017b7:	be 01 00 00 00       	mov    esi,0x1
  8017bc:	89 c1                	mov    ecx,eax
  8017be:	d3 e6                	shl    esi,cl
  8017c0:	89 f0                	mov    eax,esi
  8017c2:	89 c6                	mov    esi,eax
  8017c4:	48 8b 0d 55 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe855]        # 400020 <page_map>
  8017cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017ce:	48 98                	cdqe   
  8017d0:	48 c1 e0 02          	shl    rax,0x2
  8017d4:	48 01 c8             	add    rax,rcx
  8017d7:	09 f2                	or     edx,esi
  8017d9:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8017db:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017e2:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8017e5:	7c b8                	jl     80179f <req_page_at+0x8a>
    }
    return 0;
  8017e7:	b8 00 00 00 00       	mov    eax,0x0

}
  8017ec:	c9                   	leave  
  8017ed:	c3                   	ret    

00000000008017ee <chk_vm>:
int chk_vm(int base, int pgn)
{
  8017ee:	f3 0f 1e fa          	endbr64 
  8017f2:	55                   	push   rbp
  8017f3:	48 89 e5             	mov    rbp,rsp
  8017f6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8017f9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8017fc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801803:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801804:	0f 20 d8             	mov    rax,cr3
  801807:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  80180b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80180e:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801814:	85 c0                	test   eax,eax
  801816:	0f 48 c2             	cmovs  eax,edx
  801819:	c1 f8 16             	sar    eax,0x16
  80181c:	48 98                	cdqe   
  80181e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801825:	00 
  801826:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80182a:	48 01 d0             	add    rax,rdx
  80182d:	8b 00                	mov    eax,DWORD PTR [rax]
  80182f:	89 c0                	mov    eax,eax
  801831:	25 00 f0 ff ff       	and    eax,0xfffff000
  801836:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  80183a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80183d:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801843:	85 c0                	test   eax,eax
  801845:	0f 48 c2             	cmovs  eax,edx
  801848:	c1 f8 16             	sar    eax,0x16
  80184b:	48 98                	cdqe   
  80184d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801854:	00 
  801855:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801859:	48 01 d0             	add    rax,rdx
  80185c:	8b 00                	mov    eax,DWORD PTR [rax]
  80185e:	83 e0 01             	and    eax,0x1
  801861:	85 c0                	test   eax,eax
  801863:	74 38                	je     80189d <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801865:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801868:	99                   	cdq    
  801869:	c1 ea 0a             	shr    edx,0xa
  80186c:	01 d0                	add    eax,edx
  80186e:	25 ff ff 3f 00       	and    eax,0x3fffff
  801873:	29 d0                	sub    eax,edx
  801875:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80187b:	85 c0                	test   eax,eax
  80187d:	0f 48 c2             	cmovs  eax,edx
  801880:	c1 f8 0c             	sar    eax,0xc
  801883:	48 98                	cdqe   
  801885:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80188c:	00 
  80188d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801891:	48 01 d0             	add    rax,rdx
  801894:	8b 00                	mov    eax,DWORD PTR [rax]
  801896:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801899:	85 c0                	test   eax,eax
  80189b:	75 07                	jne    8018a4 <chk_vm+0xb6>
    {
        return -1;
  80189d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018a2:	eb 05                	jmp    8018a9 <chk_vm+0xbb>
    }
    return 0;
  8018a4:	b8 00 00 00 00       	mov    eax,0x0
}
  8018a9:	5d                   	pop    rbp
  8018aa:	c3                   	ret    

00000000008018ab <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8018ab:	f3 0f 1e fa          	endbr64 
  8018af:	55                   	push   rbp
  8018b0:	48 89 e5             	mov    rbp,rsp
  8018b3:	48 83 ec 18          	sub    rsp,0x18
  8018b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018ba:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8018bd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018c0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018c6:	85 c0                	test   eax,eax
  8018c8:	0f 48 c2             	cmovs  eax,edx
  8018cb:	c1 f8 0c             	sar    eax,0xc
  8018ce:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8018d1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018d8:	eb 1e                	jmp    8018f8 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  8018da:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8018dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018e0:	01 d0                	add    eax,edx
  8018e2:	89 c7                	mov    edi,eax
  8018e4:	e8 c4 fc ff ff       	call   8015ad <check_page>
  8018e9:	85 c0                	test   eax,eax
  8018eb:	74 07                	je     8018f4 <is_pgs_ava+0x49>
  8018ed:	b8 00 00 00 00       	mov    eax,0x0
  8018f2:	eb 11                	jmp    801905 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  8018f4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8018f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018fb:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8018fe:	7c da                	jl     8018da <is_pgs_ava+0x2f>
    }
    return 1;
  801900:	b8 01 00 00 00       	mov    eax,0x1

}
  801905:	c9                   	leave  
  801906:	c3                   	ret    

0000000000801907 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801907:	f3 0f 1e fa          	endbr64 
  80190b:	55                   	push   rbp
  80190c:	48 89 e5             	mov    rbp,rsp
  80190f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801913:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801917:	c6 05 22 e9 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe922],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80191e:	c6 05 1c e9 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe91c],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801925:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801929:	48 89 05 18 e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe918],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801930:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801934:	48 89 05 15 e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe915],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  80193b:	c7 05 1b e9 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe91b],0x1        # 400260 <vols+0x20>
  801942:	00 00 00 
    return 0;
  801945:	b8 00 00 00 00       	mov    eax,0x0
}
  80194a:	5d                   	pop    rbp
  80194b:	c3                   	ret    

000000000080194c <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  80194c:	f3 0f 1e fa          	endbr64 
  801950:	55                   	push   rbp
  801951:	48 89 e5             	mov    rbp,rsp
  801954:	48 83 ec 20          	sub    rsp,0x20
  801958:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  80195b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801962:	eb 38                	jmp    80199c <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801964:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801967:	48 98                	cdqe   
  801969:	48 c1 e0 04          	shl    rax,0x4
  80196d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801973:	8b 00                	mov    eax,DWORD PTR [rax]
  801975:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801978:	75 1e                	jne    801998 <sys_mkfifo+0x4c>
  80197a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80197d:	48 98                	cdqe   
  80197f:	48 c1 e0 04          	shl    rax,0x4
  801983:	48 05 68 1e 40 00    	add    rax,0x401e68
  801989:	8b 00                	mov    eax,DWORD PTR [rax]
  80198b:	83 f8 01             	cmp    eax,0x1
  80198e:	75 08                	jne    801998 <sys_mkfifo+0x4c>
            return i;
  801990:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801993:	e9 a6 00 00 00       	jmp    801a3e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801998:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80199c:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019a0:	7e c2                	jle    801964 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019a2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8019a9:	e9 81 00 00 00       	jmp    801a2f <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8019ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019b1:	48 98                	cdqe   
  8019b3:	48 c1 e0 04          	shl    rax,0x4
  8019b7:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019bd:	8b 00                	mov    eax,DWORD PTR [rax]
  8019bf:	85 c0                	test   eax,eax
  8019c1:	75 68                	jne    801a2b <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8019c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019c6:	48 98                	cdqe   
  8019c8:	48 c1 e0 04          	shl    rax,0x4
  8019cc:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019d2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  8019d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019db:	48 98                	cdqe   
  8019dd:	48 c1 e0 04          	shl    rax,0x4
  8019e1:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  8019e8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019eb:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  8019ed:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019f0:	48 98                	cdqe   
  8019f2:	48 c1 e0 04          	shl    rax,0x4
  8019f6:	48 05 64 1e 40 00    	add    rax,0x401e64
  8019fc:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a02:	b8 00 00 00 00       	mov    eax,0x0
  801a07:	e8 4d fa ff ff       	call   801459 <req_a_page>
  801a0c:	89 c7                	mov    edi,eax
  801a0e:	e8 f4 fb ff ff       	call   801607 <get_phyaddr>
  801a13:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a16:	48 63 d2             	movsxd rdx,edx
  801a19:	48 c1 e2 04          	shl    rdx,0x4
  801a1d:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a24:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a26:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a29:	eb 13                	jmp    801a3e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a2b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a2f:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a33:	0f 8e 75 ff ff ff    	jle    8019ae <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a39:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a3e:	c9                   	leave  
  801a3f:	c3                   	ret    

0000000000801a40 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a40:	f3 0f 1e fa          	endbr64 
  801a44:	55                   	push   rbp
  801a45:	48 89 e5             	mov    rbp,rsp
  801a48:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a52:	eb 4a                	jmp    801a9e <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a57:	48 98                	cdqe   
  801a59:	48 c1 e0 04          	shl    rax,0x4
  801a5d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a63:	8b 00                	mov    eax,DWORD PTR [rax]
  801a65:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a68:	75 30                	jne    801a9a <sys_rmfifo+0x5a>
  801a6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a6d:	48 98                	cdqe   
  801a6f:	48 c1 e0 04          	shl    rax,0x4
  801a73:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a79:	8b 00                	mov    eax,DWORD PTR [rax]
  801a7b:	83 f8 01             	cmp    eax,0x1
  801a7e:	75 1a                	jne    801a9a <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801a80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a83:	48 98                	cdqe   
  801a85:	48 c1 e0 04          	shl    rax,0x4
  801a89:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a8f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801a95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a98:	eb 0f                	jmp    801aa9 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801a9a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a9e:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801aa2:	7e b0                	jle    801a54 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801aa4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801aa9:	5d                   	pop    rbp
  801aaa:	c3                   	ret    

0000000000801aab <free_vol>:
int free_vol(int voli)
{
  801aab:	f3 0f 1e fa          	endbr64 
  801aaf:	55                   	push   rbp
  801ab0:	48 89 e5             	mov    rbp,rsp
  801ab3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801ab6:	c7 05 a0 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe7a0],0x0        # 400260 <vols+0x20>
  801abd:	00 00 00 
    return 0;
  801ac0:	b8 00 00 00 00       	mov    eax,0x0
}
  801ac5:	5d                   	pop    rbp
  801ac6:	c3                   	ret    

0000000000801ac7 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801ac7:	f3 0f 1e fa          	endbr64 
  801acb:	55                   	push   rbp
  801acc:	48 89 e5             	mov    rbp,rsp
  801acf:	48 83 ec 20          	sub    rsp,0x20
  801ad3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ad6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801ad9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801add:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ae4:	e9 d8 00 00 00       	jmp    801bc1 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801ae9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aec:	48 63 d0             	movsxd rdx,eax
  801aef:	48 89 d0             	mov    rax,rdx
  801af2:	48 c1 e0 02          	shl    rax,0x2
  801af6:	48 01 d0             	add    rax,rdx
  801af9:	48 c1 e0 03          	shl    rax,0x3
  801afd:	48 05 60 02 40 00    	add    rax,0x400260
  801b03:	8b 00                	mov    eax,DWORD PTR [rax]
  801b05:	85 c0                	test   eax,eax
  801b07:	0f 85 b0 00 00 00    	jne    801bbd <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b10:	48 63 d0             	movsxd rdx,eax
  801b13:	48 89 d0             	mov    rax,rdx
  801b16:	48 c1 e0 02          	shl    rax,0x2
  801b1a:	48 01 d0             	add    rax,rdx
  801b1d:	48 c1 e0 03          	shl    rax,0x3
  801b21:	48 05 60 02 40 00    	add    rax,0x400260
  801b27:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b2d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b30:	48 63 d0             	movsxd rdx,eax
  801b33:	48 89 d0             	mov    rax,rdx
  801b36:	48 01 c0             	add    rax,rax
  801b39:	48 01 d0             	add    rax,rdx
  801b3c:	48 c1 e0 03          	shl    rax,0x3
  801b40:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b4a:	48 63 d0             	movsxd rdx,eax
  801b4d:	48 89 d0             	mov    rax,rdx
  801b50:	48 c1 e0 02          	shl    rax,0x2
  801b54:	48 01 d0             	add    rax,rdx
  801b57:	48 c1 e0 03          	shl    rax,0x3
  801b5b:	48 05 58 02 40 00    	add    rax,0x400258
  801b61:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b64:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b67:	89 c7                	mov    edi,eax
  801b69:	e8 0b 1b 00 00       	call   803679 <get_drv>
  801b6e:	48 89 c2             	mov    rdx,rax
  801b71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b74:	48 63 c8             	movsxd rcx,eax
  801b77:	48 89 c8             	mov    rax,rcx
  801b7a:	48 c1 e0 02          	shl    rax,0x2
  801b7e:	48 01 c8             	add    rax,rcx
  801b81:	48 c1 e0 03          	shl    rax,0x3
  801b85:	48 05 48 02 40 00    	add    rax,0x400248
  801b8b:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801b8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b91:	48 63 d0             	movsxd rdx,eax
  801b94:	48 89 d0             	mov    rax,rdx
  801b97:	48 c1 e0 02          	shl    rax,0x2
  801b9b:	48 01 d0             	add    rax,rdx
  801b9e:	48 c1 e0 03          	shl    rax,0x3
  801ba2:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801ba9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801bad:	48 89 c6             	mov    rsi,rax
  801bb0:	48 89 d7             	mov    rdi,rdx
  801bb3:	e8 ac 7f 00 00       	call   809b64 <strcpy>
            return i;
  801bb8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bbb:	eb 13                	jmp    801bd0 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801bbd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bc1:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801bc5:	0f 8e 1e ff ff ff    	jle    801ae9 <reg_vol+0x22>
        }
    }
    return -1;
  801bcb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801bd0:	c9                   	leave  
  801bd1:	c3                   	ret    

0000000000801bd2 <sys_open>:
int sys_open(char *path, int mode)
{
  801bd2:	f3 0f 1e fa          	endbr64 
  801bd6:	55                   	push   rbp
  801bd7:	48 89 e5             	mov    rbp,rsp
  801bda:	53                   	push   rbx
  801bdb:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801be2:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801be9:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801bef:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801bf6:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801bfd:	eb 20                	jmp    801c1f <sys_open+0x4d>
        volname[i]=path[i];
  801bff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c02:	48 63 d0             	movsxd rdx,eax
  801c05:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c0c:	48 01 d0             	add    rax,rdx
  801c0f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c12:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c15:	48 98                	cdqe   
  801c17:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c1b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c1f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c22:	48 63 d0             	movsxd rdx,eax
  801c25:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c2c:	48 01 d0             	add    rax,rdx
  801c2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c32:	3c 2f                	cmp    al,0x2f
  801c34:	74 06                	je     801c3c <sys_open+0x6a>
  801c36:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c3a:	7e c3                	jle    801bff <sys_open+0x2d>
    volname[i]='\0';
  801c3c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c3f:	48 98                	cdqe   
  801c41:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801c46:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c49:	48 98                	cdqe   
  801c4b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c4f:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c56:	48 01 d0             	add    rax,rdx
  801c59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c5c:	84 c0                	test   al,al
  801c5e:	75 0a                	jne    801c6a <sys_open+0x98>
        return -2;//是根目录
  801c60:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801c65:	e9 2b 04 00 00       	jmp    802095 <sys_open+0x4c3>
    rec=i;
  801c6a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c6d:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801c70:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c77:	eb 52                	jmp    801ccb <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c79:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c7c:	48 63 d0             	movsxd rdx,eax
  801c7f:	48 89 d0             	mov    rax,rdx
  801c82:	48 c1 e0 02          	shl    rax,0x2
  801c86:	48 01 d0             	add    rax,rdx
  801c89:	48 c1 e0 03          	shl    rax,0x3
  801c8d:	48 05 60 02 40 00    	add    rax,0x400260
  801c93:	8b 00                	mov    eax,DWORD PTR [rax]
  801c95:	85 c0                	test   eax,eax
  801c97:	74 2e                	je     801cc7 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801c99:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c9c:	48 63 d0             	movsxd rdx,eax
  801c9f:	48 89 d0             	mov    rax,rdx
  801ca2:	48 c1 e0 02          	shl    rax,0x2
  801ca6:	48 01 d0             	add    rax,rdx
  801ca9:	48 c1 e0 03          	shl    rax,0x3
  801cad:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801cb4:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801cb8:	48 89 c6             	mov    rsi,rax
  801cbb:	48 89 d7             	mov    rdi,rdx
  801cbe:	e8 41 80 00 00       	call   809d04 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801cc3:	85 c0                	test   eax,eax
  801cc5:	74 0c                	je     801cd3 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801cc7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801ccb:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801ccf:	7e a8                	jle    801c79 <sys_open+0xa7>
  801cd1:	eb 01                	jmp    801cd4 <sys_open+0x102>
            break;
  801cd3:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801cd4:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801cd8:	75 0a                	jne    801ce4 <sys_open+0x112>
  801cda:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801cdf:	e9 b1 03 00 00       	jmp    802095 <sys_open+0x4c3>
    driver_args arg={
  801ce4:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801ceb:	b8 00 00 00 00       	mov    eax,0x0
  801cf0:	b9 17 00 00 00       	mov    ecx,0x17
  801cf5:	48 89 d7             	mov    rdi,rdx
  801cf8:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801cfb:	48 89 fa             	mov    rdx,rdi
  801cfe:	89 02                	mov    DWORD PTR [rdx],eax
  801d00:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d04:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d07:	48 98                	cdqe   
  801d09:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d0d:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d14:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d17:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d1e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d21:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801d24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d27:	48 63 d0             	movsxd rdx,eax
  801d2a:	48 89 d0             	mov    rax,rdx
  801d2d:	48 c1 e0 02          	shl    rax,0x2
  801d31:	48 01 d0             	add    rax,rdx
  801d34:	48 c1 e0 03          	shl    rax,0x3
  801d38:	48 05 58 02 40 00    	add    rax,0x400258
  801d3e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d41:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801d45:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d48:	48 98                	cdqe   
  801d4a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801d4e:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d55:	48 01 c1             	add    rcx,rax
  801d58:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801d5f:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801d65:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801d6b:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801d71:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801d77:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801d7d:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801d83:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801d89:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801d8f:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801d95:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801d9b:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801da1:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801da7:	48 89 c6             	mov    rsi,rax
  801daa:	48 89 cf             	mov    rdi,rcx
  801dad:	ff d2                	call   rdx
  801daf:	48 83 c4 60          	add    rsp,0x60
  801db3:	83 f8 ff             	cmp    eax,0xffffffff
  801db6:	75 49                	jne    801e01 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801db8:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801dbe:	83 e0 02             	and    eax,0x2
  801dc1:	85 c0                	test   eax,eax
  801dc3:	74 32                	je     801df7 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801dc5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dc8:	48 63 d0             	movsxd rdx,eax
  801dcb:	48 89 d0             	mov    rax,rdx
  801dce:	48 c1 e0 02          	shl    rax,0x2
  801dd2:	48 01 d0             	add    rax,rdx
  801dd5:	48 c1 e0 03          	shl    rax,0x3
  801dd9:	48 05 50 02 40 00    	add    rax,0x400250
  801ddf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801de2:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801de6:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801ded:	48 89 c7             	mov    rdi,rax
  801df0:	ff d2                	call   rdx
  801df2:	e9 9e 02 00 00       	jmp    802095 <sys_open+0x4c3>
        }else
            return -1;
  801df7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801dfc:	e9 94 02 00 00       	jmp    802095 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e01:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e08:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e0f:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e16:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e1d:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801e24:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e2b:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e32:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e39:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e40:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801e47:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801e4e:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801e55:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801e5c:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801e63:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801e6a:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801e71:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801e78:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801e7f:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801e86:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801e8d:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801e94:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801e9b:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801ea2:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801ea9:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801eb0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801eb7:	eb 5c                	jmp    801f15 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801eb9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ebc:	48 63 d0             	movsxd rdx,eax
  801ebf:	48 89 d0             	mov    rax,rdx
  801ec2:	48 01 c0             	add    rax,rax
  801ec5:	48 01 d0             	add    rax,rdx
  801ec8:	48 c1 e0 05          	shl    rax,0x5
  801ecc:	48 05 68 06 40 00    	add    rax,0x400668
  801ed2:	8b 00                	mov    eax,DWORD PTR [rax]
  801ed4:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801ed7:	75 38                	jne    801f11 <sys_open+0x33f>
  801ed9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801edc:	48 63 d0             	movsxd rdx,eax
  801edf:	48 89 d0             	mov    rax,rdx
  801ee2:	48 01 c0             	add    rax,rax
  801ee5:	48 01 d0             	add    rax,rdx
  801ee8:	48 c1 e0 05          	shl    rax,0x5
  801eec:	48 05 74 06 40 00    	add    rax,0x400674
  801ef2:	8b 10                	mov    edx,DWORD PTR [rax]
  801ef4:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801efa:	39 c2                	cmp    edx,eax
  801efc:	75 13                	jne    801f11 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801efe:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f05:	75 0a                	jne    801f11 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f07:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f0c:	e9 84 01 00 00       	jmp    802095 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f11:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f15:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f19:	7e 9e                	jle    801eb9 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f1b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f22:	eb 2b                	jmp    801f4f <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801f24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f27:	48 63 d0             	movsxd rdx,eax
  801f2a:	48 89 d0             	mov    rax,rdx
  801f2d:	48 01 c0             	add    rax,rax
  801f30:	48 01 d0             	add    rax,rdx
  801f33:	48 c1 e0 05          	shl    rax,0x5
  801f37:	48 05 64 06 40 00    	add    rax,0x400664
  801f3d:	8b 00                	mov    eax,DWORD PTR [rax]
  801f3f:	85 c0                	test   eax,eax
  801f41:	75 08                	jne    801f4b <sys_open+0x379>
            j = i;
  801f43:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f46:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801f49:	eb 0a                	jmp    801f55 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f4b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f4f:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f53:	7e cf                	jle    801f24 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801f55:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801f59:	75 0a                	jne    801f65 <sys_open+0x393>
  801f5b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f60:	e9 30 01 00 00       	jmp    802095 <sys_open+0x4c3>
    opened[j]=entry;
  801f65:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f68:	48 63 d0             	movsxd rdx,eax
  801f6b:	48 89 d0             	mov    rax,rdx
  801f6e:	48 01 c0             	add    rax,rax
  801f71:	48 01 d0             	add    rax,rdx
  801f74:	48 c1 e0 05          	shl    rax,0x5
  801f78:	48 05 60 06 40 00    	add    rax,0x400660
  801f7e:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801f85:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801f8c:	48 89 08             	mov    QWORD PTR [rax],rcx
  801f8f:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801f93:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801f9a:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801fa1:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801fa5:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801fa9:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801fb0:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801fb7:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801fbb:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801fbf:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801fc6:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801fcd:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801fd1:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801fd5:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801fdc:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801fe3:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801fe7:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801feb:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801ff2:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801ff9:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801ffd:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  802001:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802004:	48 63 d0             	movsxd rdx,eax
  802007:	48 89 d0             	mov    rax,rdx
  80200a:	48 01 c0             	add    rax,rax
  80200d:	48 01 d0             	add    rax,rdx
  802010:	48 c1 e0 05          	shl    rax,0x5
  802014:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  80201b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80201e:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  802020:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802023:	48 63 d0             	movsxd rdx,eax
  802026:	48 89 d0             	mov    rax,rdx
  802029:	48 01 c0             	add    rax,rax
  80202c:	48 01 d0             	add    rax,rdx
  80202f:	48 c1 e0 05          	shl    rax,0x5
  802033:	48 05 6c 06 40 00    	add    rax,0x40066c
  802039:	8b 00                	mov    eax,DWORD PTR [rax]
  80203b:	8d 48 01             	lea    ecx,[rax+0x1]
  80203e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802041:	48 63 d0             	movsxd rdx,eax
  802044:	48 89 d0             	mov    rax,rdx
  802047:	48 01 c0             	add    rax,rax
  80204a:	48 01 d0             	add    rax,rdx
  80204d:	48 c1 e0 05          	shl    rax,0x5
  802051:	48 05 6c 06 40 00    	add    rax,0x40066c
  802057:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  802059:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80205c:	48 63 d0             	movsxd rdx,eax
  80205f:	48 89 d0             	mov    rax,rdx
  802062:	48 01 c0             	add    rax,rax
  802065:	48 01 d0             	add    rax,rdx
  802068:	48 c1 e0 05          	shl    rax,0x5
  80206c:	48 05 60 06 40 00    	add    rax,0x400660
  802072:	48 89 c7             	mov    rdi,rax
  802075:	e8 94 27 00 00       	call   80480e <add_proc_openf>
    return opened[j].fno;
  80207a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80207d:	48 63 d0             	movsxd rdx,eax
  802080:	48 89 d0             	mov    rax,rdx
  802083:	48 01 c0             	add    rax,rax
  802086:	48 01 d0             	add    rax,rdx
  802089:	48 c1 e0 05          	shl    rax,0x5
  80208d:	48 05 60 06 40 00    	add    rax,0x400660
  802093:	8b 00                	mov    eax,DWORD PTR [rax]
}
  802095:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802099:	c9                   	leave  
  80209a:	c3                   	ret    

000000000080209b <sys_close>:
int sys_close(int fno)
{
  80209b:	f3 0f 1e fa          	endbr64 
  80209f:	55                   	push   rbp
  8020a0:	48 89 e5             	mov    rbp,rsp
  8020a3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020a6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020ad:	eb 64                	jmp    802113 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  8020af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020b2:	48 63 d0             	movsxd rdx,eax
  8020b5:	48 89 d0             	mov    rax,rdx
  8020b8:	48 01 c0             	add    rax,rax
  8020bb:	48 01 d0             	add    rax,rdx
  8020be:	48 c1 e0 05          	shl    rax,0x5
  8020c2:	48 05 60 06 40 00    	add    rax,0x400660
  8020c8:	8b 00                	mov    eax,DWORD PTR [rax]
  8020ca:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020cd:	75 40                	jne    80210f <sys_close+0x74>
        {
            opened[i].link_c--;
  8020cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020d2:	48 63 d0             	movsxd rdx,eax
  8020d5:	48 89 d0             	mov    rax,rdx
  8020d8:	48 01 c0             	add    rax,rax
  8020db:	48 01 d0             	add    rax,rdx
  8020de:	48 c1 e0 05          	shl    rax,0x5
  8020e2:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8020ea:	8d 48 ff             	lea    ecx,[rax-0x1]
  8020ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020f0:	48 63 d0             	movsxd rdx,eax
  8020f3:	48 89 d0             	mov    rax,rdx
  8020f6:	48 01 c0             	add    rax,rax
  8020f9:	48 01 d0             	add    rax,rdx
  8020fc:	48 c1 e0 05          	shl    rax,0x5
  802100:	48 05 6c 06 40 00    	add    rax,0x40066c
  802106:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  802108:	b8 00 00 00 00       	mov    eax,0x0
  80210d:	eb 0f                	jmp    80211e <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80210f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802113:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802117:	7e 96                	jle    8020af <sys_close+0x14>
        }
    }
    return -1;
  802119:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80211e:	5d                   	pop    rbp
  80211f:	c3                   	ret    

0000000000802120 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  802120:	f3 0f 1e fa          	endbr64 
  802124:	55                   	push   rbp
  802125:	48 89 e5             	mov    rbp,rsp
  802128:	48 83 ec 20          	sub    rsp,0x20
  80212c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80212f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802133:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802136:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802139:	89 c7                	mov    edi,eax
  80213b:	e8 7d 01 00 00       	call   8022bd <get_vfs_entry>
  802140:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802144:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802149:	75 07                	jne    802152 <sys_write+0x32>
  80214b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802150:	eb 5d                	jmp    8021af <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  802152:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802156:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802159:	85 c0                	test   eax,eax
  80215b:	75 18                	jne    802175 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  80215d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802160:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802164:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802168:	48 89 ce             	mov    rsi,rcx
  80216b:	48 89 c7             	mov    rdi,rax
  80216e:	e8 67 03 00 00       	call   8024da <vfs_write_file>
  802173:	eb 3a                	jmp    8021af <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802175:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802179:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80217c:	83 f8 01             	cmp    eax,0x1
  80217f:	75 29                	jne    8021aa <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  802181:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802185:	48 89 c7             	mov    rdi,rax
  802188:	e8 5b 04 00 00       	call   8025e8 <get_according_bnr>
  80218d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  802190:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802194:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802197:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80219a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80219e:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021a1:	89 c7                	mov    edi,eax
  8021a3:	e8 24 08 00 00       	call   8029cc <write_block>
  8021a8:	eb 05                	jmp    8021af <sys_write+0x8f>
    }
    return -1;
  8021aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  8021af:	c9                   	leave  
  8021b0:	c3                   	ret    

00000000008021b1 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  8021b1:	f3 0f 1e fa          	endbr64 
  8021b5:	55                   	push   rbp
  8021b6:	48 89 e5             	mov    rbp,rsp
  8021b9:	48 83 ec 20          	sub    rsp,0x20
  8021bd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021c0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8021c4:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021c7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021ca:	89 c7                	mov    edi,eax
  8021cc:	e8 ec 00 00 00       	call   8022bd <get_vfs_entry>
  8021d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021d5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021da:	75 07                	jne    8021e3 <sys_read+0x32>
  8021dc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021e1:	eb 5d                	jmp    802240 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  8021e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021e7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021ea:	85 c0                	test   eax,eax
  8021ec:	75 18                	jne    802206 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  8021ee:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8021f1:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8021f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021f9:	48 89 ce             	mov    rsi,rcx
  8021fc:	48 89 c7             	mov    rdi,rax
  8021ff:	e8 37 02 00 00       	call   80243b <vfs_read_file>
  802204:	eb 3a                	jmp    802240 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802206:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80220a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80220d:	83 f8 01             	cmp    eax,0x1
  802210:	75 29                	jne    80223b <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  802212:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802216:	48 89 c7             	mov    rdi,rax
  802219:	e8 ca 03 00 00       	call   8025e8 <get_according_bnr>
  80221e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  802221:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802225:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802228:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80222b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80222f:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802232:	89 c7                	mov    edi,eax
  802234:	e8 10 08 00 00       	call   802a49 <read_block>
  802239:	eb 05                	jmp    802240 <sys_read+0x8f>
    }
    return -1;
  80223b:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802240:	c9                   	leave  
  802241:	c3                   	ret    

0000000000802242 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802242:	f3 0f 1e fa          	endbr64 
  802246:	55                   	push   rbp
  802247:	48 89 e5             	mov    rbp,rsp
  80224a:	48 83 ec 20          	sub    rsp,0x20
  80224e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802251:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802254:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802257:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80225a:	89 c7                	mov    edi,eax
  80225c:	e8 5c 00 00 00       	call   8022bd <get_vfs_entry>
  802261:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802265:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80226a:	75 07                	jne    802273 <sys_seek+0x31>
  80226c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802271:	eb 14                	jmp    802287 <sys_seek+0x45>
    f->ptr=offset+origin;
  802273:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802276:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802279:	01 c2                	add    edx,eax
  80227b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80227f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  802282:	b8 00 00 00 00       	mov    eax,0x0
}
  802287:	c9                   	leave  
  802288:	c3                   	ret    

0000000000802289 <sys_tell>:
int sys_tell(int fno)
{
  802289:	f3 0f 1e fa          	endbr64 
  80228d:	55                   	push   rbp
  80228e:	48 89 e5             	mov    rbp,rsp
  802291:	48 83 ec 20          	sub    rsp,0x20
  802295:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  802298:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80229b:	89 c7                	mov    edi,eax
  80229d:	e8 1b 00 00 00       	call   8022bd <get_vfs_entry>
  8022a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022a6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022ab:	75 07                	jne    8022b4 <sys_tell+0x2b>
  8022ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022b2:	eb 07                	jmp    8022bb <sys_tell+0x32>
    return f->ptr;
  8022b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022b8:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8022bb:	c9                   	leave  
  8022bc:	c3                   	ret    

00000000008022bd <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  8022bd:	f3 0f 1e fa          	endbr64 
  8022c1:	55                   	push   rbp
  8022c2:	48 89 e5             	mov    rbp,rsp
  8022c5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8022c8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8022cf:	eb 3f                	jmp    802310 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8022d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022d4:	48 63 d0             	movsxd rdx,eax
  8022d7:	48 89 d0             	mov    rax,rdx
  8022da:	48 01 c0             	add    rax,rax
  8022dd:	48 01 d0             	add    rax,rdx
  8022e0:	48 c1 e0 05          	shl    rax,0x5
  8022e4:	48 05 60 06 40 00    	add    rax,0x400660
  8022ea:	8b 00                	mov    eax,DWORD PTR [rax]
  8022ec:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8022ef:	75 1b                	jne    80230c <get_vfs_entry+0x4f>
        {
            return &opened[i];
  8022f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022f4:	48 63 d0             	movsxd rdx,eax
  8022f7:	48 89 d0             	mov    rax,rdx
  8022fa:	48 01 c0             	add    rax,rax
  8022fd:	48 01 d0             	add    rax,rdx
  802300:	48 c1 e0 05          	shl    rax,0x5
  802304:	48 05 60 06 40 00    	add    rax,0x400660
  80230a:	eb 0f                	jmp    80231b <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80230c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802310:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802314:	7e bb                	jle    8022d1 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  802316:	b8 00 00 00 00       	mov    eax,0x0
}
  80231b:	5d                   	pop    rbp
  80231c:	c3                   	ret    

000000000080231d <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  80231d:	f3 0f 1e fa          	endbr64 
  802321:	55                   	push   rbp
  802322:	48 89 e5             	mov    rbp,rsp
  802325:	48 83 ec 10          	sub    rsp,0x10
  802329:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  80232d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802331:	48 89 c7             	mov    rdi,rax
  802334:	e8 a0 04 00 00       	call   8027d9 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802339:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80233d:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802341:	84 c0                	test   al,al
  802343:	75 07                	jne    80234c <brelse+0x2f>
  802345:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80234a:	eb 32                	jmp    80237e <brelse+0x61>
    bh->b_count--;
  80234c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802350:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802354:	8d 50 ff             	lea    edx,[rax-0x1]
  802357:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80235b:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  80235e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802362:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802366:	84 c0                	test   al,al
  802368:	75 0f                	jne    802379 <brelse+0x5c>
        vmfree(bh->b_data);
  80236a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80236e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802371:	48 89 c7             	mov    rdi,rax
  802374:	e8 db ed ff ff       	call   801154 <vmfree>
    return 0;
  802379:	b8 00 00 00 00       	mov    eax,0x0
}
  80237e:	c9                   	leave  
  80237f:	c3                   	ret    

0000000000802380 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  802380:	f3 0f 1e fa          	endbr64 
  802384:	55                   	push   rbp
  802385:	48 89 e5             	mov    rbp,rsp
  802388:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  80238f:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  802395:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  80239b:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8023a1:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023a7:	89 d6                	mov    esi,edx
  8023a9:	89 c7                	mov    edi,eax
  8023ab:	e8 78 02 00 00       	call   802628 <get_buf>
  8023b0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8023b4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8023b9:	75 09                	jne    8023c4 <bread+0x44>
  8023bb:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8023c2:	eb 75                	jmp    802439 <bread+0xb9>
    if(!bh->b_uptodate)
  8023c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023c8:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8023cc:	84 c0                	test   al,al
  8023ce:	75 65                	jne    802435 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8023d0:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023d6:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  8023d9:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  8023e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023e7:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  8023ed:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  8023f4:	02 00 00 
        arg.lba=bh->b_blocknr;
  8023f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023fb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023ff:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  802405:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  80240c:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  80240f:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  802416:	48 89 c7             	mov    rdi,rax
  802419:	e8 82 12 00 00       	call   8036a0 <make_request>
  80241e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  802421:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802424:	89 c7                	mov    edi,eax
  802426:	e8 88 15 00 00       	call   8039b3 <wait_on_req>
        clear_req(reqi);
  80242b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80242e:	89 c7                	mov    edi,eax
  802430:	e8 ae 15 00 00       	call   8039e3 <clear_req>
    }
    return bh;
  802435:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802439:	c9                   	leave  
  80243a:	c3                   	ret    

000000000080243b <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  80243b:	f3 0f 1e fa          	endbr64 
  80243f:	55                   	push   rbp
  802440:	48 89 e5             	mov    rbp,rsp
  802443:	48 83 ec 40          	sub    rsp,0x40
  802447:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80244b:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80244f:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802452:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802456:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802459:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80245c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802460:	48 89 c7             	mov    rdi,rax
  802463:	e8 80 01 00 00       	call   8025e8 <get_according_bnr>
  802468:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  80246b:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80246e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802471:	89 d6                	mov    esi,edx
  802473:	89 c7                	mov    edi,eax
  802475:	e8 06 ff ff ff       	call   802380 <bread>
  80247a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80247e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802481:	ba 00 02 00 00       	mov    edx,0x200
  802486:	39 d0                	cmp    eax,edx
  802488:	0f 4f c2             	cmovg  eax,edx
  80248b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80248e:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802491:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802495:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802498:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80249c:	48 89 ce             	mov    rsi,rcx
  80249f:	48 89 c7             	mov    rdi,rax
  8024a2:	e8 bf 75 00 00       	call   809a66 <memcpy>
        len-=BLOCK_SIZE;
  8024a7:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024b2:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024b5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024b8:	01 c2                	add    edx,eax
  8024ba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024be:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  8024c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024c5:	48 89 c7             	mov    rdi,rax
  8024c8:	e8 50 fe ff ff       	call   80231d <brelse>
    }while(len>0);
  8024cd:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8024d1:	7f 89                	jg     80245c <vfs_read_file+0x21>
    return 0;
  8024d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8024d8:	c9                   	leave  
  8024d9:	c3                   	ret    

00000000008024da <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  8024da:	f3 0f 1e fa          	endbr64 
  8024de:	55                   	push   rbp
  8024df:	48 89 e5             	mov    rbp,rsp
  8024e2:	48 83 ec 40          	sub    rsp,0x40
  8024e6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8024ea:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8024ee:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8024f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024f5:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8024f8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8024fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024ff:	48 89 c7             	mov    rdi,rax
  802502:	e8 e1 00 00 00       	call   8025e8 <get_according_bnr>
  802507:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  80250a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80250d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802510:	89 d6                	mov    esi,edx
  802512:	89 c7                	mov    edi,eax
  802514:	e8 0f 01 00 00       	call   802628 <get_buf>
  802519:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80251d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802520:	ba 00 02 00 00       	mov    edx,0x200
  802525:	39 d0                	cmp    eax,edx
  802527:	0f 4f c2             	cmovg  eax,edx
  80252a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  80252d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802530:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802534:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802537:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80253b:	48 89 ce             	mov    rsi,rcx
  80253e:	48 89 c7             	mov    rdi,rax
  802541:	e8 20 75 00 00       	call   809a66 <memcpy>
        len-=BLOCK_SIZE;
  802546:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80254d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802551:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802554:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802557:	01 c2                	add    edx,eax
  802559:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80255d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802560:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802564:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802568:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80256c:	48 89 c7             	mov    rdi,rax
  80256f:	e8 a9 fd ff ff       	call   80231d <brelse>
    }while(len>0);
  802574:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802578:	7f 81                	jg     8024fb <vfs_write_file+0x21>
    return 0;
  80257a:	b8 00 00 00 00       	mov    eax,0x0
}
  80257f:	c9                   	leave  
  802580:	c3                   	ret    

0000000000802581 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802581:	f3 0f 1e fa          	endbr64 
  802585:	55                   	push   rbp
  802586:	48 89 e5             	mov    rbp,rsp
  802589:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80258d:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802590:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802593:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802597:	74 20                	je     8025b9 <vfs_seek_file+0x38>
  802599:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80259d:	7f 3f                	jg     8025de <vfs_seek_file+0x5d>
  80259f:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8025a3:	74 08                	je     8025ad <vfs_seek_file+0x2c>
  8025a5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8025a9:	74 23                	je     8025ce <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8025ab:	eb 31                	jmp    8025de <vfs_seek_file+0x5d>
        f->ptr=offset;
  8025ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025b1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8025b4:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025b7:	eb 26                	jmp    8025df <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8025b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025bd:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8025c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025c3:	01 c2                	add    edx,eax
  8025c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025c9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025cc:	eb 11                	jmp    8025df <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8025ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025d2:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8025d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025d9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025dc:	eb 01                	jmp    8025df <vfs_seek_file+0x5e>
        break;
  8025de:	90                   	nop
    }
    return f->ptr;
  8025df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025e3:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8025e6:	5d                   	pop    rbp
  8025e7:	c3                   	ret    

00000000008025e8 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  8025e8:	f3 0f 1e fa          	endbr64 
  8025ec:	55                   	push   rbp
  8025ed:	48 89 e5             	mov    rbp,rsp
  8025f0:	48 83 ec 10          	sub    rsp,0x10
  8025f4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8025f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025fc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8025ff:	48 63 d0             	movsxd rdx,eax
  802602:	48 89 d0             	mov    rax,rdx
  802605:	48 c1 e0 02          	shl    rax,0x2
  802609:	48 01 d0             	add    rax,rdx
  80260c:	48 c1 e0 03          	shl    rax,0x3
  802610:	48 05 58 02 40 00    	add    rax,0x400258
  802616:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802619:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80261d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802621:	48 89 c7             	mov    rdi,rax
  802624:	ff d2                	call   rdx

}
  802626:	c9                   	leave  
  802627:	c3                   	ret    

0000000000802628 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802628:	f3 0f 1e fa          	endbr64 
  80262c:	55                   	push   rbp
  80262d:	48 89 e5             	mov    rbp,rsp
  802630:	48 83 ec 20          	sub    rsp,0x20
  802634:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802637:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80263a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802641:	e9 b9 00 00 00       	jmp    8026ff <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802646:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802649:	48 98                	cdqe   
  80264b:	48 c1 e0 06          	shl    rax,0x6
  80264f:	48 05 90 26 40 00    	add    rax,0x402690
  802655:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802658:	0f b7 c0             	movzx  eax,ax
  80265b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80265e:	0f 85 97 00 00 00    	jne    8026fb <get_buf+0xd3>
  802664:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802667:	48 98                	cdqe   
  802669:	48 c1 e0 06          	shl    rax,0x6
  80266d:	48 05 88 26 40 00    	add    rax,0x402688
  802673:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802676:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802679:	48 98                	cdqe   
  80267b:	48 39 c2             	cmp    rdx,rax
  80267e:	75 7b                	jne    8026fb <get_buf+0xd3>
        {
            repeat:
  802680:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802681:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802684:	48 98                	cdqe   
  802686:	48 c1 e0 06          	shl    rax,0x6
  80268a:	48 05 80 26 40 00    	add    rax,0x402680
  802690:	48 89 c7             	mov    rdi,rax
  802693:	e8 41 01 00 00       	call   8027d9 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802698:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80269b:	48 98                	cdqe   
  80269d:	48 c1 e0 06          	shl    rax,0x6
  8026a1:	48 05 94 26 40 00    	add    rax,0x402694
  8026a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026aa:	84 c0                	test   al,al
  8026ac:	74 02                	je     8026b0 <get_buf+0x88>
                goto repeat;
  8026ae:	eb d1                	jmp    802681 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8026b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026b3:	48 98                	cdqe   
  8026b5:	48 c1 e0 06          	shl    rax,0x6
  8026b9:	48 05 90 26 40 00    	add    rax,0x402690
  8026bf:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026c2:	0f b7 c0             	movzx  eax,ax
  8026c5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026c8:	75 30                	jne    8026fa <get_buf+0xd2>
  8026ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026cd:	48 98                	cdqe   
  8026cf:	48 c1 e0 06          	shl    rax,0x6
  8026d3:	48 05 88 26 40 00    	add    rax,0x402688
  8026d9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026dc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026df:	48 98                	cdqe   
  8026e1:	48 39 c2             	cmp    rdx,rax
  8026e4:	75 14                	jne    8026fa <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  8026e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026e9:	48 98                	cdqe   
  8026eb:	48 c1 e0 06          	shl    rax,0x6
  8026ef:	48 05 80 26 40 00    	add    rax,0x402680
  8026f5:	e9 dd 00 00 00       	jmp    8027d7 <get_buf+0x1af>
                continue;
  8026fa:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8026fb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8026ff:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802703:	0f 8e 3d ff ff ff    	jle    802646 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802709:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802710:	e9 b8 00 00 00       	jmp    8027cd <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802715:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802718:	48 98                	cdqe   
  80271a:	48 c1 e0 06          	shl    rax,0x6
  80271e:	48 05 94 26 40 00    	add    rax,0x402694
  802724:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802727:	84 c0                	test   al,al
  802729:	0f 85 9a 00 00 00    	jne    8027c9 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  80272f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802732:	48 98                	cdqe   
  802734:	48 c1 e0 06          	shl    rax,0x6
  802738:	48 05 93 26 40 00    	add    rax,0x402693
  80273e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802741:	84 c0                	test   al,al
  802743:	74 2e                	je     802773 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802745:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802748:	48 98                	cdqe   
  80274a:	48 c1 e0 06          	shl    rax,0x6
  80274e:	48 05 80 26 40 00    	add    rax,0x402680
  802754:	48 89 c7             	mov    rdi,rax
  802757:	e8 2c 02 00 00       	call   802988 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80275c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80275f:	48 98                	cdqe   
  802761:	48 c1 e0 06          	shl    rax,0x6
  802765:	48 05 80 26 40 00    	add    rax,0x402680
  80276b:	48 89 c7             	mov    rdi,rax
  80276e:	e8 66 00 00 00       	call   8027d9 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802773:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802776:	48 98                	cdqe   
  802778:	48 c1 e0 06          	shl    rax,0x6
  80277c:	48 05 94 26 40 00    	add    rax,0x402694
  802782:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802785:	8d 50 01             	lea    edx,[rax+0x1]
  802788:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80278b:	48 98                	cdqe   
  80278d:	48 c1 e0 06          	shl    rax,0x6
  802791:	48 05 94 26 40 00    	add    rax,0x402694
  802797:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802799:	b8 00 00 00 00       	mov    eax,0x0
  80279e:	e8 22 e9 ff ff       	call   8010c5 <vmalloc>
  8027a3:	48 89 c2             	mov    rdx,rax
  8027a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027a9:	48 98                	cdqe   
  8027ab:	48 c1 e0 06          	shl    rax,0x6
  8027af:	48 05 80 26 40 00    	add    rax,0x402680
  8027b5:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8027b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027bb:	48 98                	cdqe   
  8027bd:	48 c1 e0 06          	shl    rax,0x6
  8027c1:	48 05 80 26 40 00    	add    rax,0x402680
  8027c7:	eb 0e                	jmp    8027d7 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8027c9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8027cd:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8027d1:	0f 8e 3e ff ff ff    	jle    802715 <get_buf+0xed>
        }
    }
}
  8027d7:	c9                   	leave  
  8027d8:	c3                   	ret    

00000000008027d9 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8027d9:	f3 0f 1e fa          	endbr64 
  8027dd:	55                   	push   rbp
  8027de:	48 89 e5             	mov    rbp,rsp
  8027e1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  8027e5:	90                   	nop
  8027e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027ea:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  8027ee:	84 c0                	test   al,al
  8027f0:	75 f4                	jne    8027e6 <wait_on_buf+0xd>
    
}
  8027f2:	90                   	nop
  8027f3:	90                   	nop
  8027f4:	5d                   	pop    rbp
  8027f5:	c3                   	ret    

00000000008027f6 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8027f6:	f3 0f 1e fa          	endbr64 
  8027fa:	55                   	push   rbp
  8027fb:	48 89 e5             	mov    rbp,rsp
  8027fe:	48 83 ec 40          	sub    rsp,0x40
  802802:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  802805:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802808:	89 c7                	mov    edi,eax
  80280a:	e8 3c 0e 00 00       	call   80364b <get_dev>
  80280f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  802813:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802816:	be 00 00 00 00       	mov    esi,0x0
  80281b:	89 c7                	mov    edi,eax
  80281d:	e8 5e fb ff ff       	call   802380 <bread>
  802822:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  802826:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  80282b:	75 0a                	jne    802837 <scan_dev+0x41>
  80282d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802832:	e9 4f 01 00 00       	jmp    802986 <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  802837:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80283b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80283e:	48 05 be 01 00 00    	add    rax,0x1be
  802844:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802848:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80284f:	e9 17 01 00 00       	jmp    80296b <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  802854:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802858:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80285b:	0f b6 d0             	movzx  edx,al
  80285e:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802862:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802865:	48 63 c8             	movsxd rcx,eax
  802868:	48 89 c8             	mov    rax,rcx
  80286b:	48 01 c0             	add    rax,rax
  80286e:	48 01 c8             	add    rax,rcx
  802871:	48 c1 e0 02          	shl    rax,0x2
  802875:	48 01 f0             	add    rax,rsi
  802878:	48 83 c0 40          	add    rax,0x40
  80287c:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  80287f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802883:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802886:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  802889:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80288d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802890:	48 63 d0             	movsxd rdx,eax
  802893:	48 89 d0             	mov    rax,rdx
  802896:	48 01 c0             	add    rax,rax
  802899:	48 01 d0             	add    rax,rdx
  80289c:	48 c1 e0 02          	shl    rax,0x2
  8028a0:	48 01 c8             	add    rax,rcx
  8028a3:	48 8d 50 40          	lea    rdx,[rax+0x40]
  8028a7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8028aa:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  8028ac:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8028b3:	eb 68                	jmp    80291d <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  8028b5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8028b8:	48 63 d0             	movsxd rdx,eax
  8028bb:	48 89 d0             	mov    rax,rdx
  8028be:	48 01 c0             	add    rax,rax
  8028c1:	48 01 d0             	add    rax,rdx
  8028c4:	48 c1 e0 03          	shl    rax,0x3
  8028c8:	48 05 80 23 40 00    	add    rax,0x402380
  8028ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8028d1:	48 85 c0             	test   rax,rax
  8028d4:	74 43                	je     802919 <scan_dev+0x123>
  8028d6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8028d9:	48 63 d0             	movsxd rdx,eax
  8028dc:	48 89 d0             	mov    rax,rdx
  8028df:	48 01 c0             	add    rax,rax
  8028e2:	48 01 d0             	add    rax,rdx
  8028e5:	48 c1 e0 03          	shl    rax,0x3
  8028e9:	48 05 80 23 40 00    	add    rax,0x402380
  8028ef:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8028f2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8028f5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8028f8:	89 d6                	mov    esi,edx
  8028fa:	89 c7                	mov    edi,eax
  8028fc:	ff d1                	call   rcx
  8028fe:	85 c0                	test   eax,eax
  802900:	75 17                	jne    802919 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  802902:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802906:	48 8d 50 14          	lea    rdx,[rax+0x14]
  80290a:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  80290d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802910:	89 ce                	mov    esi,ecx
  802912:	89 c7                	mov    edi,eax
  802914:	e8 ae f1 ff ff       	call   801ac7 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  802919:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80291d:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  802921:	7e 92                	jle    8028b5 <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  802923:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  802927:	75 0f                	jne    802938 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  802929:	bf e8 1e 81 00       	mov    edi,0x811ee8
  80292e:	b8 00 00 00 00       	mov    eax,0x0
  802933:	e8 a1 e3 ff ff       	call   800cd9 <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  802938:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80293c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80293f:	89 c1                	mov    ecx,eax
  802941:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802945:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802948:	48 63 d0             	movsxd rdx,eax
  80294b:	48 89 d0             	mov    rax,rdx
  80294e:	48 01 c0             	add    rax,rax
  802951:	48 01 d0             	add    rax,rdx
  802954:	48 c1 e0 02          	shl    rax,0x2
  802958:	48 01 f0             	add    rax,rsi
  80295b:	48 83 c0 40          	add    rax,0x40
  80295f:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  802962:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802967:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80296b:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80296f:	0f 8e df fe ff ff    	jle    802854 <scan_dev+0x5e>
    }
    brelse(bh);
  802975:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802979:	48 89 c7             	mov    rdi,rax
  80297c:	e8 9c f9 ff ff       	call   80231d <brelse>
    return 0;
  802981:	b8 00 00 00 00       	mov    eax,0x0
}
  802986:	c9                   	leave  
  802987:	c3                   	ret    

0000000000802988 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802988:	f3 0f 1e fa          	endbr64 
  80298c:	55                   	push   rbp
  80298d:	48 89 e5             	mov    rbp,rsp
  802990:	48 83 ec 20          	sub    rsp,0x20
  802994:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802998:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80299c:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8029a0:	0f b7 c0             	movzx  eax,ax
  8029a3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8029a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8029aa:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8029ae:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8029b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8029b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8029b8:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8029bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029be:	b9 00 02 00 00       	mov    ecx,0x200
  8029c3:	89 c7                	mov    edi,eax
  8029c5:	e8 02 00 00 00       	call   8029cc <write_block>

}
  8029ca:	c9                   	leave  
  8029cb:	c3                   	ret    

00000000008029cc <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8029cc:	f3 0f 1e fa          	endbr64 
  8029d0:	55                   	push   rbp
  8029d1:	48 89 e5             	mov    rbp,rsp
  8029d4:	48 83 ec 30          	sub    rsp,0x30
  8029d8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029db:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029de:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029e2:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8029e5:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8029e8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8029eb:	89 d6                	mov    esi,edx
  8029ed:	89 c7                	mov    edi,eax
  8029ef:	e8 34 fc ff ff       	call   802628 <get_buf>
  8029f4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8029f8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8029fb:	ba 00 02 00 00       	mov    edx,0x200
  802a00:	39 d0                	cmp    eax,edx
  802a02:	0f 4f c2             	cmovg  eax,edx
  802a05:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802a08:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a0f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a12:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802a16:	48 89 ce             	mov    rsi,rcx
  802a19:	48 89 c7             	mov    rdi,rax
  802a1c:	e8 45 70 00 00       	call   809a66 <memcpy>
        len-=BLOCK_SIZE;
  802a21:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802a28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a2c:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802a30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a34:	48 89 c7             	mov    rdi,rax
  802a37:	e8 e1 f8 ff ff       	call   80231d <brelse>
    }while(len>0);
  802a3c:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a40:	7f a3                	jg     8029e5 <write_block+0x19>
    return 0;
  802a42:	b8 00 00 00 00       	mov    eax,0x0
}
  802a47:	c9                   	leave  
  802a48:	c3                   	ret    

0000000000802a49 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802a49:	f3 0f 1e fa          	endbr64 
  802a4d:	55                   	push   rbp
  802a4e:	48 89 e5             	mov    rbp,rsp
  802a51:	48 83 ec 30          	sub    rsp,0x30
  802a55:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802a58:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802a5b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802a5f:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802a62:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802a65:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802a68:	89 d6                	mov    esi,edx
  802a6a:	89 c7                	mov    edi,eax
  802a6c:	e8 0f f9 ff ff       	call   802380 <bread>
  802a71:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802a75:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802a78:	ba 00 02 00 00       	mov    edx,0x200
  802a7d:	39 d0                	cmp    eax,edx
  802a7f:	0f 4f c2             	cmovg  eax,edx
  802a82:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802a85:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a8c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a8f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802a93:	48 89 ce             	mov    rsi,rcx
  802a96:	48 89 c7             	mov    rdi,rax
  802a99:	e8 c8 6f 00 00       	call   809a66 <memcpy>
        len-=BLOCK_SIZE;
  802a9e:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802aa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802aa9:	48 89 c7             	mov    rdi,rax
  802aac:	e8 6c f8 ff ff       	call   80231d <brelse>
    }while(len>0);
  802ab1:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802ab5:	7f ab                	jg     802a62 <read_block+0x19>
    return 0;
  802ab7:	b8 00 00 00 00       	mov    eax,0x0
}
  802abc:	c9                   	leave  
  802abd:	c3                   	ret    

0000000000802abe <init_vfs>:

int init_vfs()
{
  802abe:	f3 0f 1e fa          	endbr64 
  802ac2:	55                   	push   rbp
  802ac3:	48 89 e5             	mov    rbp,rsp
  802ac6:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802aca:	48 8b 05 af 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059af]        # 408480 <dev_tree>
  802ad1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802ad5:	eb 40                	jmp    802b17 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802ad7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802adb:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802ae1:	48 c1 f8 02          	sar    rax,0x2
  802ae5:	48 89 c2             	mov    rdx,rax
  802ae8:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802aef:	18 9c 8f 
  802af2:	48 0f af c2          	imul   rax,rdx
  802af6:	89 c7                	mov    edi,eax
  802af8:	e8 f9 fc ff ff       	call   8027f6 <scan_dev>
  802afd:	85 c0                	test   eax,eax
  802aff:	74 07                	je     802b08 <init_vfs+0x4a>
  802b01:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b06:	eb 1b                	jmp    802b23 <init_vfs+0x65>
    for(;p;p=p->next)
  802b08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b0c:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b13:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802b17:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802b1c:	75 b9                	jne    802ad7 <init_vfs+0x19>
    }
    return 0;
  802b1e:	b8 00 00 00 00       	mov    eax,0x0
  802b23:	c9                   	leave  
  802b24:	c3                   	ret    

0000000000802b25 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802b25:	f3 0f 1e fa          	endbr64 
  802b29:	55                   	push   rbp
  802b2a:	48 89 e5             	mov    rbp,rsp
}
  802b2d:	90                   	nop
  802b2e:	5d                   	pop    rbp
  802b2f:	c3                   	ret    

0000000000802b30 <load_driver>:
int load_driver(char *path)
{
  802b30:	f3 0f 1e fa          	endbr64 
  802b34:	55                   	push   rbp
  802b35:	48 89 e5             	mov    rbp,rsp
  802b38:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802b3c:	90                   	nop
  802b3d:	5d                   	pop    rbp
  802b3e:	c3                   	ret    

0000000000802b3f <reg_device>:

int reg_device(device* dev)
{
  802b3f:	f3 0f 1e fa          	endbr64 
  802b43:	55                   	push   rbp
  802b44:	48 89 e5             	mov    rbp,rsp
  802b47:	53                   	push   rbx
  802b48:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802b4c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802b53:	e9 42 01 00 00       	jmp    802c9a <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802b58:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b5b:	48 63 d0             	movsxd rdx,eax
  802b5e:	48 89 d0             	mov    rax,rdx
  802b61:	48 c1 e0 02          	shl    rax,0x2
  802b65:	48 01 d0             	add    rax,rdx
  802b68:	48 c1 e0 02          	shl    rax,0x2
  802b6c:	48 01 d0             	add    rax,rdx
  802b6f:	48 c1 e0 03          	shl    rax,0x3
  802b73:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b79:	8b 00                	mov    eax,DWORD PTR [rax]
  802b7b:	85 c0                	test   eax,eax
  802b7d:	0f 85 13 01 00 00    	jne    802c96 <reg_device+0x157>
        {
            devs[i]=*dev;
  802b83:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b86:	48 63 d0             	movsxd rdx,eax
  802b89:	48 89 d0             	mov    rax,rdx
  802b8c:	48 c1 e0 02          	shl    rax,0x2
  802b90:	48 01 d0             	add    rax,rdx
  802b93:	48 c1 e0 02          	shl    rax,0x2
  802b97:	48 01 d0             	add    rax,rdx
  802b9a:	48 c1 e0 03          	shl    rax,0x3
  802b9e:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802ba5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802ba9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802bac:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802bb0:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802bb3:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802bb7:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802bbb:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802bbf:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802bc3:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802bc7:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802bcb:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802bcf:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802bd3:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802bd7:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802bdb:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802bdf:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802be3:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802be7:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802beb:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802bef:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802bf3:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802bf7:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802bfb:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802bff:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802c03:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802c07:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802c0b:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802c0f:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802c13:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802c17:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802c1b:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802c1f:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802c23:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802c27:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802c2e:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802c35:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802c3c:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802c43:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802c4a:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802c51:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802c58:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802c5f:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802c66:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802c6d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c70:	48 63 d0             	movsxd rdx,eax
  802c73:	48 89 d0             	mov    rax,rdx
  802c76:	48 c1 e0 02          	shl    rax,0x2
  802c7a:	48 01 d0             	add    rax,rdx
  802c7d:	48 c1 e0 02          	shl    rax,0x2
  802c81:	48 01 d0             	add    rax,rdx
  802c84:	48 c1 e0 03          	shl    rax,0x3
  802c88:	48 05 90 2e 40 00    	add    rax,0x402e90
  802c8e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802c94:	eb 0e                	jmp    802ca4 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802c96:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802c9a:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802c9e:	0f 8e b4 fe ff ff    	jle    802b58 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802ca4:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802ca8:	75 0a                	jne    802cb4 <reg_device+0x175>
        return -1;
  802caa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802caf:	e9 6d 01 00 00       	jmp    802e21 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802cb4:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802cbb:	00 
  802cbc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802cbf:	48 63 d0             	movsxd rdx,eax
  802cc2:	48 89 d0             	mov    rax,rdx
  802cc5:	48 c1 e0 02          	shl    rax,0x2
  802cc9:	48 01 d0             	add    rax,rdx
  802ccc:	48 c1 e0 02          	shl    rax,0x2
  802cd0:	48 01 d0             	add    rax,rdx
  802cd3:	48 c1 e0 03          	shl    rax,0x3
  802cd7:	48 05 80 2e 40 00    	add    rax,0x402e80
  802cdd:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802ce1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802ce5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802ce8:	83 f8 03             	cmp    eax,0x3
  802ceb:	74 3b                	je     802d28 <reg_device+0x1e9>
  802ced:	83 f8 03             	cmp    eax,0x3
  802cf0:	7f 4b                	jg     802d3d <reg_device+0x1fe>
  802cf2:	83 f8 01             	cmp    eax,0x1
  802cf5:	74 07                	je     802cfe <reg_device+0x1bf>
  802cf7:	83 f8 02             	cmp    eax,0x2
  802cfa:	74 17                	je     802d13 <reg_device+0x1d4>
  802cfc:	eb 3f                	jmp    802d3d <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802cfe:	48 8b 05 7b 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0577b]        # 408480 <dev_tree>
  802d05:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d09:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802d10:	00 
        break;
  802d11:	eb 34                	jmp    802d47 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802d13:	48 8b 05 6e 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0576e]        # 408488 <dev_tree+0x8>
  802d1a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d1e:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802d25:	00 
        break;
  802d26:	eb 1f                	jmp    802d47 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802d28:	48 8b 05 61 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05761]        # 408490 <dev_tree+0x10>
  802d2f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d33:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802d3a:	00 
        break;
  802d3b:	eb 0a                	jmp    802d47 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802d3d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802d42:	e9 da 00 00 00       	jmp    802e21 <reg_device+0x2e2>
    }
    if(!p){
  802d47:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802d4c:	75 2b                	jne    802d79 <reg_device+0x23a>
        *pp=neo;
  802d4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d52:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d56:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802d59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d5d:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802d64:	00 00 00 00 
  802d68:	eb 3d                	jmp    802da7 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802d6a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d6e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d75:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d7d:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d84:	48 85 c0             	test   rax,rax
  802d87:	75 e1                	jne    802d6a <reg_device+0x22b>
        p->next=neo;
  802d89:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d8d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d91:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802d98:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d9c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802da0:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802da7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dab:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802db2:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802db6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dba:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802dbd:	83 f8 04             	cmp    eax,0x4
  802dc0:	74 3b                	je     802dfd <reg_device+0x2be>
  802dc2:	83 f8 04             	cmp    eax,0x4
  802dc5:	7f 56                	jg     802e1d <reg_device+0x2de>
  802dc7:	83 f8 03             	cmp    eax,0x3
  802dca:	74 21                	je     802ded <reg_device+0x2ae>
  802dcc:	83 f8 03             	cmp    eax,0x3
  802dcf:	7f 4c                	jg     802e1d <reg_device+0x2de>
  802dd1:	83 f8 01             	cmp    eax,0x1
  802dd4:	74 07                	je     802ddd <reg_device+0x29e>
  802dd6:	83 f8 02             	cmp    eax,0x2
  802dd9:	74 32                	je     802e0d <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802ddb:	eb 40                	jmp    802e1d <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802ddd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802de1:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802de8:	00 00 00 
        break;
  802deb:	eb 31                	jmp    802e1e <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802ded:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802df1:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802df8:	00 00 00 
        break;
  802dfb:	eb 21                	jmp    802e1e <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802dfd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e01:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802e08:	00 00 00 
        break;
  802e0b:	eb 11                	jmp    802e1e <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802e0d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e11:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802e18:	00 00 00 
        break;
  802e1b:	eb 01                	jmp    802e1e <reg_device+0x2df>
        break;
  802e1d:	90                   	nop
    }
    return i;
  802e1e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802e21:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802e25:	c9                   	leave  
  802e26:	c3                   	ret    

0000000000802e27 <reg_driver>:


int reg_driver(driver *drv)
{
  802e27:	f3 0f 1e fa          	endbr64 
  802e2b:	55                   	push   rbp
  802e2c:	48 89 e5             	mov    rbp,rsp
  802e2f:	53                   	push   rbx
  802e30:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802e34:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802e3b:	e9 22 01 00 00       	jmp    802f62 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802e40:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e43:	48 63 d0             	movsxd rdx,eax
  802e46:	48 89 d0             	mov    rax,rdx
  802e49:	48 c1 e0 02          	shl    rax,0x2
  802e4d:	48 01 d0             	add    rax,rdx
  802e50:	48 c1 e0 05          	shl    rax,0x5
  802e54:	48 05 80 58 40 00    	add    rax,0x405880
  802e5a:	8b 00                	mov    eax,DWORD PTR [rax]
  802e5c:	85 c0                	test   eax,eax
  802e5e:	0f 85 fa 00 00 00    	jne    802f5e <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802e64:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e67:	48 63 d0             	movsxd rdx,eax
  802e6a:	48 89 d0             	mov    rax,rdx
  802e6d:	48 c1 e0 02          	shl    rax,0x2
  802e71:	48 01 d0             	add    rax,rdx
  802e74:	48 c1 e0 05          	shl    rax,0x5
  802e78:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802e7f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802e83:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802e86:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802e8a:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802e8d:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802e91:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802e95:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802e99:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802e9d:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802ea1:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802ea5:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802ea9:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802ead:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802eb1:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802eb5:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802eb9:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802ebd:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802ec1:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802ec5:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802ec9:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802ecd:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802ed1:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802ed5:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802ed9:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802edd:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802ee1:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ee5:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802ee9:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802eed:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802ef1:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802ef5:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802ef9:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802efd:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802f01:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802f08:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802f0f:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802f16:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802f1d:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802f24:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802f2b:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802f32:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802f39:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f3c:	48 63 d0             	movsxd rdx,eax
  802f3f:	48 89 d0             	mov    rax,rdx
  802f42:	48 c1 e0 02          	shl    rax,0x2
  802f46:	48 01 d0             	add    rax,rdx
  802f49:	48 c1 e0 05          	shl    rax,0x5
  802f4d:	48 05 80 58 40 00    	add    rax,0x405880
  802f53:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802f59:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f5c:	eb 13                	jmp    802f71 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802f5e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802f62:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802f66:	0f 8e d4 fe ff ff    	jle    802e40 <reg_driver+0x19>
        }
    }
    return -1;
  802f6c:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f71:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802f75:	c9                   	leave  
  802f76:	c3                   	ret    

0000000000802f77 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802f77:	f3 0f 1e fa          	endbr64 
  802f7b:	55                   	push   rbp
  802f7c:	48 89 e5             	mov    rbp,rsp
  802f7f:	48 83 ec 20          	sub    rsp,0x20
  802f83:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802f87:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802f8e:	eb 6c                	jmp    802ffc <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f93:	48 63 d0             	movsxd rdx,eax
  802f96:	48 89 d0             	mov    rax,rdx
  802f99:	48 c1 e0 02          	shl    rax,0x2
  802f9d:	48 01 d0             	add    rax,rdx
  802fa0:	48 c1 e0 02          	shl    rax,0x2
  802fa4:	48 01 d0             	add    rax,rdx
  802fa7:	48 c1 e0 03          	shl    rax,0x3
  802fab:	48 05 90 2e 40 00    	add    rax,0x402e90
  802fb1:	8b 00                	mov    eax,DWORD PTR [rax]
  802fb3:	85 c0                	test   eax,eax
  802fb5:	74 41                	je     802ff8 <sys_find_dev+0x81>
  802fb7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fba:	48 63 d0             	movsxd rdx,eax
  802fbd:	48 89 d0             	mov    rax,rdx
  802fc0:	48 c1 e0 02          	shl    rax,0x2
  802fc4:	48 01 d0             	add    rax,rdx
  802fc7:	48 c1 e0 02          	shl    rax,0x2
  802fcb:	48 01 d0             	add    rax,rdx
  802fce:	48 c1 e0 03          	shl    rax,0x3
  802fd2:	48 83 c0 10          	add    rax,0x10
  802fd6:	48 05 80 2e 40 00    	add    rax,0x402e80
  802fdc:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802fe0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802fe4:	48 89 d6             	mov    rsi,rdx
  802fe7:	48 89 c7             	mov    rdi,rax
  802fea:	e8 15 6d 00 00       	call   809d04 <strcmp>
  802fef:	85 c0                	test   eax,eax
  802ff1:	75 05                	jne    802ff8 <sys_find_dev+0x81>
            return i;
  802ff3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ff6:	eb 0f                	jmp    803007 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802ff8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802ffc:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803000:	7e 8e                	jle    802f90 <sys_find_dev+0x19>
    }
    return -1;
  803002:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803007:	c9                   	leave  
  803008:	c3                   	ret    

0000000000803009 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  803009:	f3 0f 1e fa          	endbr64 
  80300d:	55                   	push   rbp
  80300e:	48 89 e5             	mov    rbp,rsp
  803011:	48 83 ec 30          	sub    rsp,0x30
  803015:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803019:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80301c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803020:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  803027:	eb 67                	jmp    803090 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803029:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80302c:	48 63 d0             	movsxd rdx,eax
  80302f:	48 89 d0             	mov    rax,rdx
  803032:	48 c1 e0 02          	shl    rax,0x2
  803036:	48 01 d0             	add    rax,rdx
  803039:	48 c1 e0 02          	shl    rax,0x2
  80303d:	48 01 d0             	add    rax,rdx
  803040:	48 c1 e0 03          	shl    rax,0x3
  803044:	48 05 90 2e 40 00    	add    rax,0x402e90
  80304a:	8b 00                	mov    eax,DWORD PTR [rax]
  80304c:	85 c0                	test   eax,eax
  80304e:	74 3c                	je     80308c <sys_operate_dev+0x83>
  803050:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803053:	48 63 d0             	movsxd rdx,eax
  803056:	48 89 d0             	mov    rax,rdx
  803059:	48 c1 e0 02          	shl    rax,0x2
  80305d:	48 01 d0             	add    rax,rdx
  803060:	48 c1 e0 02          	shl    rax,0x2
  803064:	48 01 d0             	add    rax,rdx
  803067:	48 c1 e0 03          	shl    rax,0x3
  80306b:	48 83 c0 10          	add    rax,0x10
  80306f:	48 05 80 2e 40 00    	add    rax,0x402e80
  803075:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803079:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80307d:	48 89 d6             	mov    rsi,rdx
  803080:	48 89 c7             	mov    rdi,rax
  803083:	e8 7c 6c 00 00       	call   809d04 <strcmp>
  803088:	85 c0                	test   eax,eax
  80308a:	74 0c                	je     803098 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  80308c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803090:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803094:	7e 93                	jle    803029 <sys_operate_dev+0x20>
  803096:	eb 01                	jmp    803099 <sys_operate_dev+0x90>
            break;
  803098:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  803099:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80309d:	75 0a                	jne    8030a9 <sys_operate_dev+0xa0>
  80309f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8030a4:	e9 9c 02 00 00       	jmp    803345 <sys_operate_dev+0x33c>
    switch (func) {
  8030a9:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  8030ad:	0f 87 8d 02 00 00    	ja     803340 <sys_operate_dev+0x337>
  8030b3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8030b6:	48 8b 04 c5 08 1f 81 	mov    rax,QWORD PTR [rax*8+0x811f08]
  8030bd:	00 
  8030be:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  8030c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030c4:	48 63 d0             	movsxd rdx,eax
  8030c7:	48 89 d0             	mov    rax,rdx
  8030ca:	48 c1 e0 02          	shl    rax,0x2
  8030ce:	48 01 d0             	add    rax,rdx
  8030d1:	48 c1 e0 02          	shl    rax,0x2
  8030d5:	48 01 d0             	add    rax,rdx
  8030d8:	48 c1 e0 03          	shl    rax,0x3
  8030dc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030e5:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8030e9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030ed:	48 89 c7             	mov    rdi,rax
  8030f0:	ff d2                	call   rdx
  8030f2:	e9 4e 02 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  8030f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030fa:	48 63 d0             	movsxd rdx,eax
  8030fd:	48 89 d0             	mov    rax,rdx
  803100:	48 c1 e0 02          	shl    rax,0x2
  803104:	48 01 d0             	add    rax,rdx
  803107:	48 c1 e0 02          	shl    rax,0x2
  80310b:	48 01 d0             	add    rax,rdx
  80310e:	48 c1 e0 03          	shl    rax,0x3
  803112:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803118:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80311b:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80311f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803123:	48 89 c7             	mov    rdi,rax
  803126:	ff d2                	call   rdx
  803128:	e9 18 02 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  80312d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803130:	48 63 d0             	movsxd rdx,eax
  803133:	48 89 d0             	mov    rax,rdx
  803136:	48 c1 e0 02          	shl    rax,0x2
  80313a:	48 01 d0             	add    rax,rdx
  80313d:	48 c1 e0 02          	shl    rax,0x2
  803141:	48 01 d0             	add    rax,rdx
  803144:	48 c1 e0 03          	shl    rax,0x3
  803148:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80314e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803151:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  803155:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803159:	48 89 c7             	mov    rdi,rax
  80315c:	ff d2                	call   rdx
  80315e:	e9 e2 01 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  803163:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803166:	48 63 d0             	movsxd rdx,eax
  803169:	48 89 d0             	mov    rax,rdx
  80316c:	48 c1 e0 02          	shl    rax,0x2
  803170:	48 01 d0             	add    rax,rdx
  803173:	48 c1 e0 02          	shl    rax,0x2
  803177:	48 01 d0             	add    rax,rdx
  80317a:	48 c1 e0 03          	shl    rax,0x3
  80317e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803184:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803187:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80318b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80318f:	48 89 c7             	mov    rdi,rax
  803192:	ff d2                	call   rdx
  803194:	e9 ac 01 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803199:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80319c:	48 63 d0             	movsxd rdx,eax
  80319f:	48 89 d0             	mov    rax,rdx
  8031a2:	48 c1 e0 02          	shl    rax,0x2
  8031a6:	48 01 d0             	add    rax,rdx
  8031a9:	48 c1 e0 02          	shl    rax,0x2
  8031ad:	48 01 d0             	add    rax,rdx
  8031b0:	48 c1 e0 03          	shl    rax,0x3
  8031b4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031bd:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8031c1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031c5:	48 89 c7             	mov    rdi,rax
  8031c8:	ff d2                	call   rdx
  8031ca:	e9 76 01 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8031cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031d2:	48 63 d0             	movsxd rdx,eax
  8031d5:	48 89 d0             	mov    rax,rdx
  8031d8:	48 c1 e0 02          	shl    rax,0x2
  8031dc:	48 01 d0             	add    rax,rdx
  8031df:	48 c1 e0 02          	shl    rax,0x2
  8031e3:	48 01 d0             	add    rax,rdx
  8031e6:	48 c1 e0 03          	shl    rax,0x3
  8031ea:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031f3:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  8031f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031fb:	48 89 c7             	mov    rdi,rax
  8031fe:	ff d2                	call   rdx
  803200:	e9 40 01 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803205:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803208:	48 63 d0             	movsxd rdx,eax
  80320b:	48 89 d0             	mov    rax,rdx
  80320e:	48 c1 e0 02          	shl    rax,0x2
  803212:	48 01 d0             	add    rax,rdx
  803215:	48 c1 e0 02          	shl    rax,0x2
  803219:	48 01 d0             	add    rax,rdx
  80321c:	48 c1 e0 03          	shl    rax,0x3
  803220:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803226:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803229:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  80322d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803231:	48 89 c7             	mov    rdi,rax
  803234:	ff d2                	call   rdx
  803236:	e9 0a 01 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  80323b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80323e:	48 63 d0             	movsxd rdx,eax
  803241:	48 89 d0             	mov    rax,rdx
  803244:	48 c1 e0 02          	shl    rax,0x2
  803248:	48 01 d0             	add    rax,rdx
  80324b:	48 c1 e0 02          	shl    rax,0x2
  80324f:	48 01 d0             	add    rax,rdx
  803252:	48 c1 e0 03          	shl    rax,0x3
  803256:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80325c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80325f:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803263:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803267:	48 89 c7             	mov    rdi,rax
  80326a:	ff d2                	call   rdx
  80326c:	e9 d4 00 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803271:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803274:	48 63 d0             	movsxd rdx,eax
  803277:	48 89 d0             	mov    rax,rdx
  80327a:	48 c1 e0 02          	shl    rax,0x2
  80327e:	48 01 d0             	add    rax,rdx
  803281:	48 c1 e0 02          	shl    rax,0x2
  803285:	48 01 d0             	add    rax,rdx
  803288:	48 c1 e0 03          	shl    rax,0x3
  80328c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803292:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803295:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803299:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80329d:	48 89 c7             	mov    rdi,rax
  8032a0:	ff d2                	call   rdx
  8032a2:	e9 9e 00 00 00       	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8032a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032aa:	48 63 d0             	movsxd rdx,eax
  8032ad:	48 89 d0             	mov    rax,rdx
  8032b0:	48 c1 e0 02          	shl    rax,0x2
  8032b4:	48 01 d0             	add    rax,rdx
  8032b7:	48 c1 e0 02          	shl    rax,0x2
  8032bb:	48 01 d0             	add    rax,rdx
  8032be:	48 c1 e0 03          	shl    rax,0x3
  8032c2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032cb:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8032cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032d3:	48 89 c7             	mov    rdi,rax
  8032d6:	ff d2                	call   rdx
  8032d8:	eb 6b                	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8032da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032dd:	48 63 d0             	movsxd rdx,eax
  8032e0:	48 89 d0             	mov    rax,rdx
  8032e3:	48 c1 e0 02          	shl    rax,0x2
  8032e7:	48 01 d0             	add    rax,rdx
  8032ea:	48 c1 e0 02          	shl    rax,0x2
  8032ee:	48 01 d0             	add    rax,rdx
  8032f1:	48 c1 e0 03          	shl    rax,0x3
  8032f5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032fe:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803302:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803306:	48 89 c7             	mov    rdi,rax
  803309:	ff d2                	call   rdx
  80330b:	eb 38                	jmp    803345 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  80330d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803310:	48 63 d0             	movsxd rdx,eax
  803313:	48 89 d0             	mov    rax,rdx
  803316:	48 c1 e0 02          	shl    rax,0x2
  80331a:	48 01 d0             	add    rax,rdx
  80331d:	48 c1 e0 02          	shl    rax,0x2
  803321:	48 01 d0             	add    rax,rdx
  803324:	48 c1 e0 03          	shl    rax,0x3
  803328:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80332e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803331:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  803335:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803339:	48 89 c7             	mov    rdi,rax
  80333c:	ff d2                	call   rdx
  80333e:	eb 05                	jmp    803345 <sys_operate_dev+0x33c>
    }
    return -1;
  803340:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803345:	c9                   	leave  
  803346:	c3                   	ret    

0000000000803347 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803347:	f3 0f 1e fa          	endbr64 
  80334b:	55                   	push   rbp
  80334c:	48 89 e5             	mov    rbp,rsp
  80334f:	48 83 ec 10          	sub    rsp,0x10
  803353:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  803356:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803359:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  80335d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803360:	48 63 d0             	movsxd rdx,eax
  803363:	48 89 d0             	mov    rax,rdx
  803366:	48 c1 e0 02          	shl    rax,0x2
  80336a:	48 01 d0             	add    rax,rdx
  80336d:	48 c1 e0 05          	shl    rax,0x5
  803371:	48 05 80 58 40 00    	add    rax,0x405880
  803377:	8b 00                	mov    eax,DWORD PTR [rax]
  803379:	85 c0                	test   eax,eax
  80337b:	75 0a                	jne    803387 <call_drv_func+0x40>
  80337d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803382:	e9 15 02 00 00       	jmp    80359c <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803387:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  80338b:	0f 87 06 02 00 00    	ja     803597 <call_drv_func+0x250>
  803391:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803394:	48 8b 04 c5 68 1f 81 	mov    rax,QWORD PTR [rax*8+0x811f68]
  80339b:	00 
  80339c:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  80339f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a2:	48 63 d0             	movsxd rdx,eax
  8033a5:	48 89 d0             	mov    rax,rdx
  8033a8:	48 c1 e0 02          	shl    rax,0x2
  8033ac:	48 01 d0             	add    rax,rdx
  8033af:	48 c1 e0 05          	shl    rax,0x5
  8033b3:	48 05 88 58 40 00    	add    rax,0x405888
  8033b9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c0:	48 89 c7             	mov    rdi,rax
  8033c3:	ff d2                	call   rdx
  8033c5:	e9 d2 01 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8033ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033cd:	48 63 d0             	movsxd rdx,eax
  8033d0:	48 89 d0             	mov    rax,rdx
  8033d3:	48 c1 e0 02          	shl    rax,0x2
  8033d7:	48 01 d0             	add    rax,rdx
  8033da:	48 c1 e0 05          	shl    rax,0x5
  8033de:	48 05 90 58 40 00    	add    rax,0x405890
  8033e4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033eb:	48 89 c7             	mov    rdi,rax
  8033ee:	ff d2                	call   rdx
  8033f0:	e9 a7 01 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8033f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f8:	48 63 d0             	movsxd rdx,eax
  8033fb:	48 89 d0             	mov    rax,rdx
  8033fe:	48 c1 e0 02          	shl    rax,0x2
  803402:	48 01 d0             	add    rax,rdx
  803405:	48 c1 e0 05          	shl    rax,0x5
  803409:	48 05 98 58 40 00    	add    rax,0x405898
  80340f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803412:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803416:	48 89 c7             	mov    rdi,rax
  803419:	ff d2                	call   rdx
  80341b:	e9 7c 01 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803420:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803423:	48 63 d0             	movsxd rdx,eax
  803426:	48 89 d0             	mov    rax,rdx
  803429:	48 c1 e0 02          	shl    rax,0x2
  80342d:	48 01 d0             	add    rax,rdx
  803430:	48 c1 e0 05          	shl    rax,0x5
  803434:	48 05 a0 58 40 00    	add    rax,0x4058a0
  80343a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80343d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803441:	48 89 c7             	mov    rdi,rax
  803444:	ff d2                	call   rdx
  803446:	e9 51 01 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  80344b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80344e:	48 63 d0             	movsxd rdx,eax
  803451:	48 89 d0             	mov    rax,rdx
  803454:	48 c1 e0 02          	shl    rax,0x2
  803458:	48 01 d0             	add    rax,rdx
  80345b:	48 c1 e0 05          	shl    rax,0x5
  80345f:	48 05 a8 58 40 00    	add    rax,0x4058a8
  803465:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803468:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80346c:	48 89 c7             	mov    rdi,rax
  80346f:	ff d2                	call   rdx
  803471:	e9 26 01 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  803476:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803479:	48 63 d0             	movsxd rdx,eax
  80347c:	48 89 d0             	mov    rax,rdx
  80347f:	48 c1 e0 02          	shl    rax,0x2
  803483:	48 01 d0             	add    rax,rdx
  803486:	48 c1 e0 05          	shl    rax,0x5
  80348a:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803490:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803493:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803497:	48 89 c7             	mov    rdi,rax
  80349a:	ff d2                	call   rdx
  80349c:	e9 fb 00 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8034a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034a4:	48 63 d0             	movsxd rdx,eax
  8034a7:	48 89 d0             	mov    rax,rdx
  8034aa:	48 c1 e0 02          	shl    rax,0x2
  8034ae:	48 01 d0             	add    rax,rdx
  8034b1:	48 c1 e0 05          	shl    rax,0x5
  8034b5:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8034bb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034c2:	48 89 c7             	mov    rdi,rax
  8034c5:	ff d2                	call   rdx
  8034c7:	e9 d0 00 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8034cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034cf:	48 63 d0             	movsxd rdx,eax
  8034d2:	48 89 d0             	mov    rax,rdx
  8034d5:	48 c1 e0 02          	shl    rax,0x2
  8034d9:	48 01 d0             	add    rax,rdx
  8034dc:	48 c1 e0 05          	shl    rax,0x5
  8034e0:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8034e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ed:	48 89 c7             	mov    rdi,rax
  8034f0:	ff d2                	call   rdx
  8034f2:	e9 a5 00 00 00       	jmp    80359c <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8034f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034fa:	48 63 d0             	movsxd rdx,eax
  8034fd:	48 89 d0             	mov    rax,rdx
  803500:	48 c1 e0 02          	shl    rax,0x2
  803504:	48 01 d0             	add    rax,rdx
  803507:	48 c1 e0 05          	shl    rax,0x5
  80350b:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803511:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803514:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803518:	48 89 c7             	mov    rdi,rax
  80351b:	ff d2                	call   rdx
  80351d:	eb 7d                	jmp    80359c <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  80351f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803522:	48 63 d0             	movsxd rdx,eax
  803525:	48 89 d0             	mov    rax,rdx
  803528:	48 c1 e0 02          	shl    rax,0x2
  80352c:	48 01 d0             	add    rax,rdx
  80352f:	48 c1 e0 05          	shl    rax,0x5
  803533:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803539:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80353c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803540:	48 89 c7             	mov    rdi,rax
  803543:	ff d2                	call   rdx
  803545:	eb 55                	jmp    80359c <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803547:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80354a:	48 63 d0             	movsxd rdx,eax
  80354d:	48 89 d0             	mov    rax,rdx
  803550:	48 c1 e0 02          	shl    rax,0x2
  803554:	48 01 d0             	add    rax,rdx
  803557:	48 c1 e0 05          	shl    rax,0x5
  80355b:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803561:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803564:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803568:	48 89 c7             	mov    rdi,rax
  80356b:	ff d2                	call   rdx
  80356d:	eb 2d                	jmp    80359c <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  80356f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803572:	48 63 d0             	movsxd rdx,eax
  803575:	48 89 d0             	mov    rax,rdx
  803578:	48 c1 e0 02          	shl    rax,0x2
  80357c:	48 01 d0             	add    rax,rdx
  80357f:	48 c1 e0 05          	shl    rax,0x5
  803583:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803589:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80358c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803590:	48 89 c7             	mov    rdi,rax
  803593:	ff d2                	call   rdx
  803595:	eb 05                	jmp    80359c <call_drv_func+0x255>
    }
    return -1;
  803597:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80359c:	c9                   	leave  
  80359d:	c3                   	ret    

000000000080359e <dispose_device>:
int dispose_device(int dev){
  80359e:	f3 0f 1e fa          	endbr64 
  8035a2:	55                   	push   rbp
  8035a3:	48 89 e5             	mov    rbp,rsp
  8035a6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8035a9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8035ac:	48 63 d0             	movsxd rdx,eax
  8035af:	48 89 d0             	mov    rax,rdx
  8035b2:	48 c1 e0 02          	shl    rax,0x2
  8035b6:	48 01 d0             	add    rax,rdx
  8035b9:	48 c1 e0 02          	shl    rax,0x2
  8035bd:	48 01 d0             	add    rax,rdx
  8035c0:	48 c1 e0 03          	shl    rax,0x3
  8035c4:	48 05 90 2e 40 00    	add    rax,0x402e90
  8035ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8035cc:	83 f8 01             	cmp    eax,0x1
  8035cf:	74 07                	je     8035d8 <dispose_device+0x3a>
  8035d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035d6:	eb 62                	jmp    80363a <dispose_device+0x9c>
    device* p=&devs[dev];
  8035d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8035db:	48 63 d0             	movsxd rdx,eax
  8035de:	48 89 d0             	mov    rax,rdx
  8035e1:	48 c1 e0 02          	shl    rax,0x2
  8035e5:	48 01 d0             	add    rax,rdx
  8035e8:	48 c1 e0 02          	shl    rax,0x2
  8035ec:	48 01 d0             	add    rax,rdx
  8035ef:	48 c1 e0 03          	shl    rax,0x3
  8035f3:	48 05 80 2e 40 00    	add    rax,0x402e80
  8035f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8035fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803601:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803608:	48 85 c0             	test   rax,rax
  80360b:	74 1d                	je     80362a <dispose_device+0x8c>
  80360d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803611:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803618:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80361c:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803623:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  80362a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80362e:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803635:	b8 00 00 00 00       	mov    eax,0x0
}
  80363a:	5d                   	pop    rbp
  80363b:	c3                   	ret    

000000000080363c <dispose_driver>:
int dispose_driver(driver *drv){
  80363c:	f3 0f 1e fa          	endbr64 
  803640:	55                   	push   rbp
  803641:	48 89 e5             	mov    rbp,rsp
  803644:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803648:	90                   	nop
  803649:	5d                   	pop    rbp
  80364a:	c3                   	ret    

000000000080364b <get_dev>:

device *get_dev(int devi)
{
  80364b:	f3 0f 1e fa          	endbr64 
  80364f:	55                   	push   rbp
  803650:	48 89 e5             	mov    rbp,rsp
  803653:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803656:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803659:	48 63 d0             	movsxd rdx,eax
  80365c:	48 89 d0             	mov    rax,rdx
  80365f:	48 c1 e0 02          	shl    rax,0x2
  803663:	48 01 d0             	add    rax,rdx
  803666:	48 c1 e0 02          	shl    rax,0x2
  80366a:	48 01 d0             	add    rax,rdx
  80366d:	48 c1 e0 03          	shl    rax,0x3
  803671:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803677:	5d                   	pop    rbp
  803678:	c3                   	ret    

0000000000803679 <get_drv>:
driver *get_drv(int drvi)
{
  803679:	f3 0f 1e fa          	endbr64 
  80367d:	55                   	push   rbp
  80367e:	48 89 e5             	mov    rbp,rsp
  803681:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803684:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803687:	48 63 d0             	movsxd rdx,eax
  80368a:	48 89 d0             	mov    rax,rdx
  80368d:	48 c1 e0 02          	shl    rax,0x2
  803691:	48 01 d0             	add    rax,rdx
  803694:	48 c1 e0 05          	shl    rax,0x5
  803698:	48 05 80 58 40 00    	add    rax,0x405880
}
  80369e:	5d                   	pop    rbp
  80369f:	c3                   	ret    

00000000008036a0 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8036a0:	f3 0f 1e fa          	endbr64 
  8036a4:	55                   	push   rbp
  8036a5:	48 89 e5             	mov    rbp,rsp
  8036a8:	53                   	push   rbx
  8036a9:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8036ad:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8036b4:	eb 23                	jmp    8036d9 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8036b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036b9:	48 63 d0             	movsxd rdx,eax
  8036bc:	48 89 d0             	mov    rax,rdx
  8036bf:	48 01 c0             	add    rax,rax
  8036c2:	48 01 d0             	add    rax,rdx
  8036c5:	48 c1 e0 06          	shl    rax,0x6
  8036c9:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8036cf:	8b 00                	mov    eax,DWORD PTR [rax]
  8036d1:	85 c0                	test   eax,eax
  8036d3:	74 0c                	je     8036e1 <make_request+0x41>
    for(;i<NR_REQS;i++)
  8036d5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8036d9:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8036dd:	7e d7                	jle    8036b6 <make_request+0x16>
  8036df:	eb 01                	jmp    8036e2 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8036e1:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  8036e2:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  8036e6:	75 0a                	jne    8036f2 <make_request+0x52>
  8036e8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8036ed:	e9 e7 01 00 00       	jmp    8038d9 <make_request+0x239>
    reqs[i]=*args;//放入数组
  8036f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036f5:	48 63 d0             	movsxd rdx,eax
  8036f8:	48 89 d0             	mov    rax,rdx
  8036fb:	48 01 c0             	add    rax,rax
  8036fe:	48 01 d0             	add    rax,rdx
  803701:	48 c1 e0 06          	shl    rax,0x6
  803705:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80370c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803710:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803713:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803717:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80371a:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80371e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803722:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803726:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80372a:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80372e:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803732:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803736:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80373a:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80373e:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803742:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803746:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80374a:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80374e:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803752:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803756:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80375a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80375e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803762:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803766:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80376a:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80376e:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803772:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803776:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80377a:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80377e:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803782:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803786:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80378a:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80378e:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803795:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80379c:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8037a3:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8037aa:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8037b1:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8037b8:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8037bf:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8037c6:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8037cd:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8037d4:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  8037db:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  8037e2:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  8037e9:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  8037f0:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  8037f7:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  8037fe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803802:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803808:	48 63 d0             	movsxd rdx,eax
  80380b:	48 89 d0             	mov    rax,rdx
  80380e:	48 c1 e0 02          	shl    rax,0x2
  803812:	48 01 d0             	add    rax,rdx
  803815:	48 c1 e0 02          	shl    rax,0x2
  803819:	48 01 d0             	add    rax,rdx
  80381c:	48 c1 e0 03          	shl    rax,0x3
  803820:	48 05 80 2e 40 00    	add    rax,0x402e80
  803826:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  80382a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80382e:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803835:	48 85 c0             	test   rax,rax
  803838:	75 27                	jne    803861 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  80383a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80383d:	48 63 d0             	movsxd rdx,eax
  803840:	48 89 d0             	mov    rax,rdx
  803843:	48 01 c0             	add    rax,rax
  803846:	48 01 d0             	add    rax,rdx
  803849:	48 c1 e0 06          	shl    rax,0x6
  80384d:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803854:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803858:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  80385f:	eb 75                	jmp    8038d6 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803861:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803865:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80386c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803870:	eb 0f                	jmp    803881 <make_request+0x1e1>
  803872:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803876:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80387d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803881:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803885:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80388c:	48 85 c0             	test   rax,rax
  80388f:	75 e1                	jne    803872 <make_request+0x1d2>
        p->next=&reqs[i];
  803891:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803894:	48 63 d0             	movsxd rdx,eax
  803897:	48 89 d0             	mov    rax,rdx
  80389a:	48 01 c0             	add    rax,rax
  80389d:	48 01 d0             	add    rax,rdx
  8038a0:	48 c1 e0 06          	shl    rax,0x6
  8038a4:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8038ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8038af:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8038b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8038b9:	48 63 d0             	movsxd rdx,eax
  8038bc:	48 89 d0             	mov    rax,rdx
  8038bf:	48 01 c0             	add    rax,rax
  8038c2:	48 01 d0             	add    rax,rdx
  8038c5:	48 c1 e0 06          	shl    rax,0x6
  8038c9:	48 05 38 6d 40 00    	add    rax,0x406d38
  8038cf:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8038d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8038d9:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8038dd:	c9                   	leave  
  8038de:	c3                   	ret    

00000000008038df <do_req>:
//取出一个申请并且执行
int do_req()
{
  8038df:	f3 0f 1e fa          	endbr64 
  8038e3:	55                   	push   rbp
  8038e4:	48 89 e5             	mov    rbp,rsp
  8038e7:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  8038eb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8038f2:	e9 ab 00 00 00       	jmp    8039a2 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  8038f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038fa:	48 98                	cdqe   
  8038fc:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803903:	00 
  803904:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803908:	e9 86 00 00 00       	jmp    803993 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80390d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803911:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803918:	48 85 c0             	test   rax,rax
  80391b:	75 67                	jne    803984 <do_req+0xa5>
  80391d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803921:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803928:	48 85 c0             	test   rax,rax
  80392b:	74 57                	je     803984 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  80392d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803931:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803938:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80393c:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803943:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803947:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80394e:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803955:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803959:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803960:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803964:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  80396a:	48 98                	cdqe   
  80396c:	48 8b 14 c5 80 a4 80 	mov    rdx,QWORD PTR [rax*8+0x80a480]
  803973:	00 
  803974:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803978:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80397f:	48 89 c7             	mov    rdi,rax
  803982:	ff d2                	call   rdx
        for(;p;p=p->next)
  803984:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803988:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80398f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803993:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803998:	0f 85 6f ff ff ff    	jne    80390d <do_req+0x2e>
    for(int i=0;i<3;i++)
  80399e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039a2:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8039a6:	0f 8e 4b ff ff ff    	jle    8038f7 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8039ac:	b8 00 00 00 00       	mov    eax,0x0
}
  8039b1:	c9                   	leave  
  8039b2:	c3                   	ret    

00000000008039b3 <wait_on_req>:


void wait_on_req(int reqi)
{
  8039b3:	f3 0f 1e fa          	endbr64 
  8039b7:	55                   	push   rbp
  8039b8:	48 89 e5             	mov    rbp,rsp
  8039bb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8039be:	90                   	nop
  8039bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039c2:	48 63 d0             	movsxd rdx,eax
  8039c5:	48 89 d0             	mov    rax,rdx
  8039c8:	48 01 c0             	add    rax,rax
  8039cb:	48 01 d0             	add    rax,rdx
  8039ce:	48 c1 e0 06          	shl    rax,0x6
  8039d2:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8039d8:	8b 00                	mov    eax,DWORD PTR [rax]
  8039da:	83 f8 03             	cmp    eax,0x3
  8039dd:	75 e0                	jne    8039bf <wait_on_req+0xc>
}
  8039df:	90                   	nop
  8039e0:	90                   	nop
  8039e1:	5d                   	pop    rbp
  8039e2:	c3                   	ret    

00000000008039e3 <clear_req>:
void clear_req(int reqi)
{
  8039e3:	f3 0f 1e fa          	endbr64 
  8039e7:	55                   	push   rbp
  8039e8:	48 89 e5             	mov    rbp,rsp
  8039eb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  8039ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039f1:	48 63 d0             	movsxd rdx,eax
  8039f4:	48 89 d0             	mov    rax,rdx
  8039f7:	48 01 c0             	add    rax,rax
  8039fa:	48 01 d0             	add    rax,rdx
  8039fd:	48 c1 e0 06          	shl    rax,0x6
  803a01:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803a07:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803a0d:	90                   	nop
  803a0e:	5d                   	pop    rbp
  803a0f:	c3                   	ret    

0000000000803a10 <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803a10:	f3 0f 1e fa          	endbr64 
  803a14:	55                   	push   rbp
  803a15:	48 89 e5             	mov    rbp,rsp
  803a18:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803a1c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803a23:	eb 61                	jmp    803a86 <init_proc+0x76>
        task[i].pid=-1;
  803a25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a28:	48 63 d0             	movsxd rdx,eax
  803a2b:	48 89 d0             	mov    rax,rdx
  803a2e:	48 01 c0             	add    rax,rax
  803a31:	48 01 d0             	add    rax,rdx
  803a34:	48 c1 e0 08          	shl    rax,0x8
  803a38:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a3e:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803a44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a47:	48 63 d0             	movsxd rdx,eax
  803a4a:	48 89 d0             	mov    rax,rdx
  803a4d:	48 01 c0             	add    rax,rax
  803a50:	48 01 d0             	add    rax,rdx
  803a53:	48 c1 e0 08          	shl    rax,0x8
  803a57:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a5d:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803a63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a66:	48 63 d0             	movsxd rdx,eax
  803a69:	48 89 d0             	mov    rax,rdx
  803a6c:	48 01 c0             	add    rax,rax
  803a6f:	48 01 d0             	add    rax,rdx
  803a72:	48 c1 e0 08          	shl    rax,0x8
  803a76:	48 05 28 85 40 00    	add    rax,0x408528
  803a7c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803a82:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803a86:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a8a:	7e 99                	jle    803a25 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803a8c:	c7 05 76 0a c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10a76],0x0        # 41450c <cur_proc>
  803a93:	00 00 00 
    pidd=1;
  803a96:	c7 05 70 0a c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10a70],0x1        # 414510 <pidd>
  803a9d:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803aa0:	b8 00 00 00 00       	mov    eax,0x0
  803aa5:	e8 30 02 00 00       	call   803cda <create_proc>
  803aaa:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803aad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803ab0:	48 63 d0             	movsxd rdx,eax
  803ab3:	48 89 d0             	mov    rax,rdx
  803ab6:	48 01 c0             	add    rax,rax
  803ab9:	48 01 d0             	add    rax,rdx
  803abc:	48 c1 e0 08          	shl    rax,0x8
  803ac0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ac6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803acc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803acf:	83 c0 03             	add    eax,0x3
  803ad2:	c1 e0 04             	shl    eax,0x4
  803ad5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803ad8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803adb:	01 c0                	add    eax,eax
  803add:	83 c0 05             	add    eax,0x5
  803ae0:	c1 e0 03             	shl    eax,0x3
  803ae3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换
    wrmsr(0x174,0x8);
  803ae6:	be 08 00 00 00       	mov    esi,0x8
  803aeb:	bf 74 01 00 00       	mov    edi,0x174
  803af0:	e8 bc cc ff ff       	call   8007b1 <wrmsr>
    //创建一个测试进程
    create_test_proc();
  803af5:	b8 00 00 00 00       	mov    eax,0x0
  803afa:	e8 03 00 00 00       	call   803b02 <create_test_proc>
}
  803aff:	90                   	nop
  803b00:	c9                   	leave  
  803b01:	c3                   	ret    

0000000000803b02 <create_test_proc>:
void create_test_proc(){
  803b02:	f3 0f 1e fa          	endbr64 
  803b06:	55                   	push   rbp
  803b07:	48 89 e5             	mov    rbp,rsp
  803b0a:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803b0e:	b8 00 00 00 00       	mov    eax,0x0
  803b13:	e8 45 02 00 00       	call   803d5d <req_proc>
  803b18:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803b1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b1e:	48 63 d0             	movsxd rdx,eax
  803b21:	48 89 d0             	mov    rax,rdx
  803b24:	48 01 c0             	add    rax,rax
  803b27:	48 01 d0             	add    rax,rdx
  803b2a:	48 c1 e0 08          	shl    rax,0x8
  803b2e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b34:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803b3a:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803b41:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803b45:	ba e2 a3 80 00       	mov    edx,0x80a3e2
  803b4a:	48 83 ec 08          	sub    rsp,0x8
  803b4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b51:	50                   	push   rax
  803b52:	6a 00                	push   0x0
  803b54:	52                   	push   rdx
  803b55:	6a 00                	push   0x0
  803b57:	6a 00                	push   0x0
  803b59:	6a 00                	push   0x0
  803b5b:	68 58 7d 00 00       	push   0x7d58
  803b60:	6a 10                	push   0x10
  803b62:	6a 10                	push   0x10
  803b64:	6a 10                	push   0x10
  803b66:	6a 10                	push   0x10
  803b68:	41 b9 08 00 00 00    	mov    r9d,0x8
  803b6e:	41 b8 10 00 00 00    	mov    r8d,0x10
  803b74:	b9 00 00 00 00       	mov    ecx,0x0
  803b79:	ba 00 00 00 00       	mov    edx,0x0
  803b7e:	be 00 00 00 00       	mov    esi,0x0
  803b83:	bf 00 00 00 00       	mov    edi,0x0
  803b88:	e8 c9 02 00 00       	call   803e56 <set_proc>
  803b8d:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803b91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b94:	48 63 d0             	movsxd rdx,eax
  803b97:	48 89 d0             	mov    rax,rdx
  803b9a:	48 01 c0             	add    rax,rax
  803b9d:	48 01 d0             	add    rax,rdx
  803ba0:	48 c1 e0 08          	shl    rax,0x8
  803ba4:	48 05 68 86 40 00    	add    rax,0x408668
  803baa:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803bb1:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803bb8:	00 
    str->rax=0;
  803bb9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bbd:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803bc4:	00 
    str->rbx=0;
  803bc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc9:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803bd0:	00 
    str->rcx=0x1400000;//sysexit采用的栈顶
  803bd1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd5:	48 c7 40 68 00 00 40 	mov    QWORD PTR [rax+0x68],0x1400000
  803bdc:	01 
    str->rdx=0x1400000;//sysexit采用的返回地址
  803bdd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be1:	48 c7 40 60 00 00 40 	mov    QWORD PTR [rax+0x60],0x1400000
  803be8:	01 
    str->rsi=0;
  803be9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bed:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803bf4:	00 
    str->rdi=0;
  803bf5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bf9:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803c00:	00 
    str->r15=0;
  803c01:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c05:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803c0c:	00 
    str->r14=0;
  803c0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c11:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803c18:	00 
    str->r13=0;
  803c19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c1d:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803c24:	00 
    str->r12=0;
  803c25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c29:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803c30:	00 
    str->r11=0;
  803c31:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c35:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803c3c:	00 
    str->r10=0;
  803c3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c41:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803c48:	00 
    str->r9=0;
  803c49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c4d:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803c54:	00 
    str->r8=0;
  803c55:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c59:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803c60:	00 
    str->rip=0x1400000;
  803c61:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c65:	48 c7 80 80 00 00 00 	mov    QWORD PTR [rax+0x80],0x1400000
  803c6c:	00 00 40 01 
    str->cs=0x8;
  803c70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c74:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803c7b:	08 00 00 00 
    str->rflags=0x00200006;
  803c7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c83:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803c8a:	06 00 20 00 
    str->rsp=0x7e00;
  803c8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c92:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803c99:	00 7e 00 00 
    str->ss=0x10;
  803c9d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ca1:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x10
  803ca8:	10 00 00 00 
    str->ds=0x10;
  803cac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cb0:	48 c7 00 10 00 00 00 	mov    QWORD PTR [rax],0x10
    str->es=0x10;
  803cb7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cbb:	48 c7 40 08 10 00 00 	mov    QWORD PTR [rax+0x8],0x10
  803cc2:	00 
    memcpy(0x1400000,proc_zero,1024);
  803cc3:	ba 00 04 00 00       	mov    edx,0x400
  803cc8:	be c2 3f 80 00       	mov    esi,0x803fc2
  803ccd:	bf 00 00 40 01       	mov    edi,0x1400000
  803cd2:	e8 8f 5d 00 00       	call   809a66 <memcpy>

}
  803cd7:	90                   	nop
  803cd8:	c9                   	leave  
  803cd9:	c3                   	ret    

0000000000803cda <create_proc>:
int create_proc()
{
  803cda:	f3 0f 1e fa          	endbr64 
  803cde:	55                   	push   rbp
  803cdf:	48 89 e5             	mov    rbp,rsp
  803ce2:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803ce6:	b8 00 00 00 00       	mov    eax,0x0
  803ceb:	e8 6d 00 00 00       	call   803d5d <req_proc>
  803cf0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803cf3:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803cf7:	75 07                	jne    803d00 <create_proc+0x26>
  803cf9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803cfe:	eb 5b                	jmp    803d5b <create_proc+0x81>
    int currsp=0x9fc00-1;
  803d00:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803d07:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803d0b:	b9 c2 3f 80 00       	mov    ecx,0x803fc2
  803d10:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803d13:	48 98                	cdqe   
  803d15:	48 83 ec 08          	sub    rsp,0x8
  803d19:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803d1c:	52                   	push   rdx
  803d1d:	6a 00                	push   0x0
  803d1f:	51                   	push   rcx
  803d20:	6a 00                	push   0x0
  803d22:	6a 00                	push   0x0
  803d24:	6a 00                	push   0x0
  803d26:	50                   	push   rax
  803d27:	6a 10                	push   0x10
  803d29:	6a 10                	push   0x10
  803d2b:	6a 10                	push   0x10
  803d2d:	6a 10                	push   0x10
  803d2f:	41 b9 08 00 00 00    	mov    r9d,0x8
  803d35:	41 b8 10 00 00 00    	mov    r8d,0x10
  803d3b:	b9 00 00 00 00       	mov    ecx,0x0
  803d40:	ba 00 00 00 00       	mov    edx,0x0
  803d45:	be 00 00 00 00       	mov    esi,0x0
  803d4a:	bf 00 00 00 00       	mov    edi,0x0
  803d4f:	e8 02 01 00 00       	call   803e56 <set_proc>
  803d54:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803d58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803d5b:	c9                   	leave  
  803d5c:	c3                   	ret    

0000000000803d5d <req_proc>:
int req_proc(){
  803d5d:	f3 0f 1e fa          	endbr64 
  803d61:	55                   	push   rbp
  803d62:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803d65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d6c:	eb 04                	jmp    803d72 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803d6e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d75:	48 63 d0             	movsxd rdx,eax
  803d78:	48 89 d0             	mov    rax,rdx
  803d7b:	48 01 c0             	add    rax,rax
  803d7e:	48 01 d0             	add    rax,rdx
  803d81:	48 c1 e0 08          	shl    rax,0x8
  803d85:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d8b:	8b 00                	mov    eax,DWORD PTR [rax]
  803d8d:	83 f8 ff             	cmp    eax,0xffffffff
  803d90:	74 26                	je     803db8 <req_proc+0x5b>
  803d92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d95:	48 63 d0             	movsxd rdx,eax
  803d98:	48 89 d0             	mov    rax,rdx
  803d9b:	48 01 c0             	add    rax,rax
  803d9e:	48 01 d0             	add    rax,rdx
  803da1:	48 c1 e0 08          	shl    rax,0x8
  803da5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803dab:	8b 00                	mov    eax,DWORD PTR [rax]
  803dad:	83 f8 03             	cmp    eax,0x3
  803db0:	74 06                	je     803db8 <req_proc+0x5b>
  803db2:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803db6:	7e b6                	jle    803d6e <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803db8:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803dbc:	7e 0a                	jle    803dc8 <req_proc+0x6b>
        return -1;
  803dbe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803dc3:	e9 8c 00 00 00       	jmp    803e54 <req_proc+0xf7>
    task[num].pid=pidd++;
  803dc8:	8b 05 42 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10742]        # 414510 <pidd>
  803dce:	8d 50 01             	lea    edx,[rax+0x1]
  803dd1:	89 15 39 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10739],edx        # 414510 <pidd>
  803dd7:	89 c1                	mov    ecx,eax
  803dd9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ddc:	48 63 d0             	movsxd rdx,eax
  803ddf:	48 89 d0             	mov    rax,rdx
  803de2:	48 01 c0             	add    rax,rax
  803de5:	48 01 d0             	add    rax,rdx
  803de8:	48 c1 e0 08          	shl    rax,0x8
  803dec:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803df2:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803df4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803df7:	48 63 d0             	movsxd rdx,eax
  803dfa:	48 89 d0             	mov    rax,rdx
  803dfd:	48 01 c0             	add    rax,rax
  803e00:	48 01 d0             	add    rax,rdx
  803e03:	48 c1 e0 08          	shl    rax,0x8
  803e07:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803e0d:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803e13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e16:	48 63 d0             	movsxd rdx,eax
  803e19:	48 89 d0             	mov    rax,rdx
  803e1c:	48 01 c0             	add    rax,rax
  803e1f:	48 01 d0             	add    rax,rdx
  803e22:	48 c1 e0 08          	shl    rax,0x8
  803e26:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803e2c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803e32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e35:	48 63 d0             	movsxd rdx,eax
  803e38:	48 89 d0             	mov    rax,rdx
  803e3b:	48 01 c0             	add    rax,rax
  803e3e:	48 01 d0             	add    rax,rdx
  803e41:	48 c1 e0 08          	shl    rax,0x8
  803e45:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803e4b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803e51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803e54:	5d                   	pop    rbp
  803e55:	c3                   	ret    

0000000000803e56 <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803e56:	f3 0f 1e fa          	endbr64 
  803e5a:	55                   	push   rbp
  803e5b:	48 89 e5             	mov    rbp,rsp
  803e5e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803e62:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803e66:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803e6a:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803e6e:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803e72:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803e76:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803e79:	48 63 d0             	movsxd rdx,eax
  803e7c:	48 89 d0             	mov    rax,rdx
  803e7f:	48 01 c0             	add    rax,rax
  803e82:	48 01 d0             	add    rax,rdx
  803e85:	48 c1 e0 08          	shl    rax,0x8
  803e89:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803e93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e97:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803e9b:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803ea2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ea6:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803eaa:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803eb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803eb9:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803ec0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ec4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803ec8:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803ecf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ed3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ed7:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803ede:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ee2:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803ee6:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803eed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ef1:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803ef5:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803efc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f00:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f04:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803f0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0f:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803f13:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f1e:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803f22:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803f29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f2d:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803f31:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803f38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f3c:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803f40:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803f47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f4b:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803f4f:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803f56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f5a:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803f5e:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803f65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f69:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803f70:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803f74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f78:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803f7c:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803f83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f87:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803f8b:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803f92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f96:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f9a:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803fa1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fa5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803fa9:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803fb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb4:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803fbb:	00 10 10 00 


}
  803fbf:	90                   	nop
  803fc0:	5d                   	pop    rbp
  803fc1:	c3                   	ret    

0000000000803fc2 <proc_zero>:
void proc_zero()
{
  803fc2:	f3 0f 1e fa          	endbr64 
  803fc6:	55                   	push   rbp
  803fc7:	48 89 e5             	mov    rbp,rsp
    asm volatile("leave\n"
  803fca:	c9                   	leave  
  803fcb:	58                   	pop    rax
  803fcc:	8e d8                	mov    ds,eax
  803fce:	58                   	pop    rax
  803fcf:	8e c0                	mov    es,eax
  803fd1:	41 5f                	pop    r15
  803fd3:	41 5e                	pop    r14
  803fd5:	41 5d                	pop    r13
  803fd7:	41 5c                	pop    r12
  803fd9:	41 5b                	pop    r11
  803fdb:	41 5a                	pop    r10
  803fdd:	41 59                	pop    r9
  803fdf:	41 58                	pop    r8
  803fe1:	5e                   	pop    rsi
  803fe2:	5f                   	pop    rdi
  803fe3:	5a                   	pop    rdx
  803fe4:	59                   	pop    rcx
  803fe5:	5b                   	pop    rbx
  803fe6:	58                   	pop    rax
  803fe7:	e8 12 0f 00 00       	call   804efe <eoi>
  803fec:	48 cf                	iretq  

0000000000803fee <dd>:
  803fee:	90                   	nop
                 "popq %rax\n"
                 "callq eoi\n"
                 "iretq\n"
                 "dd:\n"
                 "nop\n");
    while(1);
  803fef:	eb fe                	jmp    803fef <dd+0x1>

0000000000803ff1 <manage_proc>:
}
void manage_proc(){
  803ff1:	f3 0f 1e fa          	endbr64 
  803ff5:	55                   	push   rbp
  803ff6:	48 89 e5             	mov    rbp,rsp
  803ff9:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803ffd:	8b 05 09 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10509]        # 41450c <cur_proc>
  804003:	83 f8 ff             	cmp    eax,0xffffffff
  804006:	74 39                	je     804041 <manage_proc+0x50>
        task[cur_proc].utime++;
  804008:	8b 15 fe 04 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc104fe]        # 41450c <cur_proc>
  80400e:	48 63 ca             	movsxd rcx,edx
  804011:	48 89 c8             	mov    rax,rcx
  804014:	48 01 c0             	add    rax,rax
  804017:	48 01 c8             	add    rax,rcx
  80401a:	48 c1 e0 08          	shl    rax,0x8
  80401e:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804024:	8b 00                	mov    eax,DWORD PTR [rax]
  804026:	8d 48 01             	lea    ecx,[rax+0x1]
  804029:	48 63 d2             	movsxd rdx,edx
  80402c:	48 89 d0             	mov    rax,rdx
  80402f:	48 01 c0             	add    rax,rax
  804032:	48 01 d0             	add    rax,rdx
  804035:	48 c1 e0 08          	shl    rax,0x8
  804039:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80403f:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804041:	8b 05 c5 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104c5]        # 41450c <cur_proc>
  804047:	83 f8 ff             	cmp    eax,0xffffffff
  80404a:	74 4a                	je     804096 <manage_proc+0xa5>
  80404c:	8b 05 ba 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104ba]        # 41450c <cur_proc>
  804052:	48 63 d0             	movsxd rdx,eax
  804055:	48 89 d0             	mov    rax,rdx
  804058:	48 01 c0             	add    rax,rax
  80405b:	48 01 d0             	add    rax,rdx
  80405e:	48 c1 e0 08          	shl    rax,0x8
  804062:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804068:	8b 00                	mov    eax,DWORD PTR [rax]
  80406a:	83 f8 01             	cmp    eax,0x1
  80406d:	77 27                	ja     804096 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  80406f:	8b 05 97 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10497]        # 41450c <cur_proc>
  804075:	48 63 d0             	movsxd rdx,eax
  804078:	48 89 d0             	mov    rax,rdx
  80407b:	48 01 c0             	add    rax,rax
  80407e:	48 01 d0             	add    rax,rdx
  804081:	48 c1 e0 08          	shl    rax,0x8
  804085:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80408b:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80408d:	83 f8 01             	cmp    eax,0x1
  804090:	0f 84 21 01 00 00    	je     8041b7 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  804096:	8b 05 70 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10470]        # 41450c <cur_proc>
  80409c:	83 f8 ff             	cmp    eax,0xffffffff
  80409f:	74 22                	je     8040c3 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  8040a1:	8b 05 65 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10465]        # 41450c <cur_proc>
  8040a7:	48 63 d0             	movsxd rdx,eax
  8040aa:	48 89 d0             	mov    rax,rdx
  8040ad:	48 01 c0             	add    rax,rax
  8040b0:	48 01 d0             	add    rax,rdx
  8040b3:	48 c1 e0 08          	shl    rax,0x8
  8040b7:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8040bd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  8040c3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  8040ca:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8040d1:	eb 4f                	jmp    804122 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  8040d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040d6:	48 63 d0             	movsxd rdx,eax
  8040d9:	48 89 d0             	mov    rax,rdx
  8040dc:	48 01 c0             	add    rax,rax
  8040df:	48 01 d0             	add    rax,rdx
  8040e2:	48 c1 e0 08          	shl    rax,0x8
  8040e6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8040ee:	83 f8 ff             	cmp    eax,0xffffffff
  8040f1:	74 2b                	je     80411e <manage_proc+0x12d>
  8040f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040f6:	48 63 d0             	movsxd rdx,eax
  8040f9:	48 89 d0             	mov    rax,rdx
  8040fc:	48 01 c0             	add    rax,rax
  8040ff:	48 01 d0             	add    rax,rdx
  804102:	48 c1 e0 08          	shl    rax,0x8
  804106:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80410c:	8b 00                	mov    eax,DWORD PTR [rax]
  80410e:	83 f8 01             	cmp    eax,0x1
  804111:	75 0b                	jne    80411e <manage_proc+0x12d>
  804113:	8b 05 f3 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103f3]        # 41450c <cur_proc>
  804119:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80411c:	75 0c                	jne    80412a <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  80411e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804122:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804126:	7e ab                	jle    8040d3 <manage_proc+0xe2>
  804128:	eb 01                	jmp    80412b <manage_proc+0x13a>
                break;
  80412a:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  80412b:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80412f:	0f 8f 85 00 00 00    	jg     8041ba <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  804135:	8b 05 d1 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103d1]        # 41450c <cur_proc>
  80413b:	48 63 d0             	movsxd rdx,eax
  80413e:	48 89 d0             	mov    rax,rdx
  804141:	48 01 c0             	add    rax,rax
  804144:	48 01 d0             	add    rax,rdx
  804147:	48 c1 e0 08          	shl    rax,0x8
  80414b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804151:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804157:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80415a:	48 63 d0             	movsxd rdx,eax
  80415d:	48 89 d0             	mov    rax,rdx
  804160:	48 01 c0             	add    rax,rax
  804163:	48 01 d0             	add    rax,rdx
  804166:	48 c1 e0 08          	shl    rax,0x8
  80416a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804170:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  804176:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804179:	48 63 d0             	movsxd rdx,eax
  80417c:	48 89 d0             	mov    rax,rdx
  80417f:	48 01 c0             	add    rax,rax
  804182:	48 01 d0             	add    rax,rdx
  804185:	48 c1 e0 08          	shl    rax,0x8
  804189:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804190:	8b 05 76 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10376]        # 41450c <cur_proc>
  804196:	48 63 c8             	movsxd rcx,eax
  804199:	48 89 c8             	mov    rax,rcx
  80419c:	48 01 c0             	add    rax,rax
  80419f:	48 01 c8             	add    rax,rcx
  8041a2:	48 c1 e0 08          	shl    rax,0x8
  8041a6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041ac:	48 89 d6             	mov    rsi,rdx
  8041af:	48 89 c7             	mov    rdi,rax
  8041b2:	e8 fd 0a 00 00       	call   804cb4 <switch_to>
    }
    return;
  8041b7:	90                   	nop
  8041b8:	eb 01                	jmp    8041bb <manage_proc+0x1ca>
            return;
  8041ba:	90                   	nop
}
  8041bb:	c9                   	leave  
  8041bc:	c3                   	ret    

00000000008041bd <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  8041bd:	f3 0f 1e fa          	endbr64 
  8041c1:	55                   	push   rbp
  8041c2:	48 89 e5             	mov    rbp,rsp
  8041c5:	48 83 ec 20          	sub    rsp,0x20
  8041c9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  8041cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8041cf:	01 c0                	add    eax,eax
  8041d1:	83 c0 05             	add    eax,0x5
  8041d4:	c1 e0 03             	shl    eax,0x3
  8041d7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  8041da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8041dd:	89 05 29 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10329],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  8041e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8041e6:	89 c7                	mov    edi,eax
  8041e8:	e8 0d 61 00 00       	call   80a2fa <switch_proc_asm>
}
  8041ed:	90                   	nop
  8041ee:	c9                   	leave  
  8041ef:	c3                   	ret    

00000000008041f0 <switch_proc>:
void switch_proc(int pnr){
  8041f0:	f3 0f 1e fa          	endbr64 
  8041f4:	55                   	push   rbp
  8041f5:	48 89 e5             	mov    rbp,rsp
  8041f8:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  8041ff:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  804205:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80420b:	48 63 d0             	movsxd rdx,eax
  80420e:	48 89 d0             	mov    rax,rdx
  804211:	48 01 c0             	add    rax,rax
  804214:	48 01 d0             	add    rax,rdx
  804217:	48 c1 e0 08          	shl    rax,0x8
  80421b:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804222:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  804229:	48 89 d6             	mov    rsi,rdx
  80422c:	ba 60 00 00 00       	mov    edx,0x60
  804231:	48 89 c7             	mov    rdi,rax
  804234:	48 89 d1             	mov    rcx,rdx
  804237:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  80423a:	8b 05 cc 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc102cc]        # 41450c <cur_proc>
  804240:	48 63 d0             	movsxd rdx,eax
  804243:	48 89 d0             	mov    rax,rdx
  804246:	48 01 c0             	add    rax,rax
  804249:	48 01 d0             	add    rax,rdx
  80424c:	48 c1 e0 08          	shl    rax,0x8
  804250:	48 05 c0 01 00 00    	add    rax,0x1c0
  804256:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80425c:	48 83 c0 04          	add    rax,0x4
  804260:	48 89 c7             	mov    rdi,rax
  804263:	e8 53 00 00 00       	call   8042bb <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804268:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80426e:	89 05 98 02 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10298],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804274:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80427a:	01 c0                	add    eax,eax
  80427c:	83 c0 05             	add    eax,0x5
  80427f:	c1 e0 03             	shl    eax,0x3
  804282:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804285:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80428b:	48 63 d0             	movsxd rdx,eax
  80428e:	48 89 d0             	mov    rax,rdx
  804291:	48 01 c0             	add    rax,rax
  804294:	48 01 d0             	add    rax,rdx
  804297:	48 c1 e0 08          	shl    rax,0x8
  80429b:	48 05 c0 01 00 00    	add    rax,0x1c0
  8042a1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8042a7:	48 83 c0 04          	add    rax,0x4
  8042ab:	48 89 c6             	mov    rsi,rax
  8042ae:	bf 00 00 00 00       	mov    edi,0x0
  8042b3:	e8 fc 09 00 00       	call   804cb4 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  8042b8:	90                   	nop
  8042b9:	c9                   	leave  
  8042ba:	c3                   	ret    

00000000008042bb <save_context>:
void save_context(TSS *tss)
{
  8042bb:	f3 0f 1e fa          	endbr64 
  8042bf:	55                   	push   rbp
  8042c0:	48 89 e5             	mov    rbp,rsp
  8042c3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  8042c7:	90                   	nop
  8042c8:	5d                   	pop    rbp
  8042c9:	c3                   	ret    

00000000008042ca <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  8042ca:	f3 0f 1e fa          	endbr64 
  8042ce:	55                   	push   rbp
  8042cf:	48 89 e5             	mov    rbp,rsp
  8042d2:	48 83 ec 60          	sub    rsp,0x60
  8042d6:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8042d9:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  8042dc:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8042df:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8042e5:	85 c0                	test   eax,eax
  8042e7:	0f 48 c2             	cmovs  eax,edx
  8042ea:	c1 f8 0c             	sar    eax,0xc
  8042ed:	89 c1                	mov    ecx,eax
  8042ef:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8042f2:	99                   	cdq    
  8042f3:	c1 ea 14             	shr    edx,0x14
  8042f6:	01 d0                	add    eax,edx
  8042f8:	25 ff 0f 00 00       	and    eax,0xfff
  8042fd:	29 d0                	sub    eax,edx
  8042ff:	01 c8                	add    eax,ecx
  804301:	85 c0                	test   eax,eax
  804303:	0f 95 c0             	setne  al
  804306:	0f b6 c0             	movzx  eax,al
  804309:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  80430c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804313:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80431a:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  80431b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  804322:	00 
    pgind++;
  804323:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804328:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  80432f:	e9 76 02 00 00       	jmp    8045aa <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  804334:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804338:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80433b:	25 00 f0 ff ff       	and    eax,0xfffff000
  804340:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  804344:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80434b:	e9 44 02 00 00       	jmp    804594 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  804350:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804354:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804357:	83 e0 01             	and    eax,0x1
  80435a:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  80435d:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804361:	0f 85 24 02 00 00    	jne    80458b <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  804367:	b8 00 00 00 00       	mov    eax,0x0
  80436c:	e8 e8 d0 ff ff       	call   801459 <req_a_page>
  804371:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  804374:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  804378:	0f 85 dc 00 00 00    	jne    80445a <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80437e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804381:	48 63 d0             	movsxd rdx,eax
  804384:	48 89 d0             	mov    rax,rdx
  804387:	48 01 c0             	add    rax,rax
  80438a:	48 01 d0             	add    rax,rdx
  80438d:	48 c1 e0 08          	shl    rax,0x8
  804391:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804397:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80439a:	0f b7 c0             	movzx  eax,ax
  80439d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8043a0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043a3:	48 63 d0             	movsxd rdx,eax
  8043a6:	48 89 d0             	mov    rax,rdx
  8043a9:	48 01 c0             	add    rax,rax
  8043ac:	48 01 d0             	add    rax,rdx
  8043af:	48 c1 e0 08          	shl    rax,0x8
  8043b3:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8043b9:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8043bd:	0f b7 c0             	movzx  eax,ax
  8043c0:	c1 e0 10             	shl    eax,0x10
  8043c3:	25 00 00 0f 00       	and    eax,0xf0000
  8043c8:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  8043cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8043ce:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8043d1:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8043d4:	89 c1                	mov    ecx,eax
  8043d6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043d9:	48 63 d0             	movsxd rdx,eax
  8043dc:	48 89 d0             	mov    rax,rdx
  8043df:	48 01 c0             	add    rax,rax
  8043e2:	48 01 d0             	add    rax,rdx
  8043e5:	48 c1 e0 08          	shl    rax,0x8
  8043e9:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8043ef:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8043f2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043f5:	48 63 d0             	movsxd rdx,eax
  8043f8:	48 89 d0             	mov    rax,rdx
  8043fb:	48 01 c0             	add    rax,rax
  8043fe:	48 01 d0             	add    rax,rdx
  804401:	48 c1 e0 08          	shl    rax,0x8
  804405:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80440b:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80440f:	0f b7 c0             	movzx  eax,ax
  804412:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  804415:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80441c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80441f:	c1 e8 10             	shr    eax,0x10
  804422:	83 e0 0f             	and    eax,0xf
  804425:	89 c2                	mov    edx,eax
  804427:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80442a:	01 d0                	add    eax,edx
  80442c:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80442f:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804432:	89 c1                	mov    ecx,eax
  804434:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804437:	48 63 d0             	movsxd rdx,eax
  80443a:	48 89 d0             	mov    rax,rdx
  80443d:	48 01 c0             	add    rax,rax
  804440:	48 01 d0             	add    rax,rdx
  804443:	48 c1 e0 08          	shl    rax,0x8
  804447:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80444d:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804451:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804455:	e9 62 01 00 00       	jmp    8045bc <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  80445a:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  80445d:	89 c7                	mov    edi,eax
  80445f:	e8 a3 d1 ff ff       	call   801607 <get_phyaddr>
  804464:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804467:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  80446a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80446e:	ba 07 00 00 00       	mov    edx,0x7
  804473:	89 ce                	mov    esi,ecx
  804475:	48 89 c7             	mov    rdi,rax
  804478:	e8 9d d1 ff ff       	call   80161a <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  80447d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804480:	c1 e0 0a             	shl    eax,0xa
  804483:	89 c2                	mov    edx,eax
  804485:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804488:	01 d0                	add    eax,edx
  80448a:	c1 e0 0c             	shl    eax,0xc
  80448d:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804490:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804495:	75 09                	jne    8044a0 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804497:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80449a:	89 05 74 00 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10074],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8044a0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8044a4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8044a8:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8044ac:	0f 85 d9 00 00 00    	jne    80458b <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8044b2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044b5:	48 63 d0             	movsxd rdx,eax
  8044b8:	48 89 d0             	mov    rax,rdx
  8044bb:	48 01 c0             	add    rax,rax
  8044be:	48 01 d0             	add    rax,rdx
  8044c1:	48 c1 e0 08          	shl    rax,0x8
  8044c5:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8044cb:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8044ce:	0f b7 c0             	movzx  eax,ax
  8044d1:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8044d4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044d7:	48 63 d0             	movsxd rdx,eax
  8044da:	48 89 d0             	mov    rax,rdx
  8044dd:	48 01 c0             	add    rax,rax
  8044e0:	48 01 d0             	add    rax,rdx
  8044e3:	48 c1 e0 08          	shl    rax,0x8
  8044e7:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044ed:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8044f1:	0f b7 c0             	movzx  eax,ax
  8044f4:	c1 e0 10             	shl    eax,0x10
  8044f7:	25 00 00 0f 00       	and    eax,0xf0000
  8044fc:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  8044ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804502:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804505:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804508:	89 c1                	mov    ecx,eax
  80450a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80450d:	48 63 d0             	movsxd rdx,eax
  804510:	48 89 d0             	mov    rax,rdx
  804513:	48 01 c0             	add    rax,rax
  804516:	48 01 d0             	add    rax,rdx
  804519:	48 c1 e0 08          	shl    rax,0x8
  80451d:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804523:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804526:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804529:	48 63 d0             	movsxd rdx,eax
  80452c:	48 89 d0             	mov    rax,rdx
  80452f:	48 01 c0             	add    rax,rax
  804532:	48 01 d0             	add    rax,rdx
  804535:	48 c1 e0 08          	shl    rax,0x8
  804539:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80453f:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804543:	0f b7 c0             	movzx  eax,ax
  804546:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804549:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804550:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804553:	c1 e8 10             	shr    eax,0x10
  804556:	83 e0 0f             	and    eax,0xf
  804559:	89 c2                	mov    edx,eax
  80455b:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80455e:	01 d0                	add    eax,edx
  804560:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804563:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804566:	89 c1                	mov    ecx,eax
  804568:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80456b:	48 63 d0             	movsxd rdx,eax
  80456e:	48 89 d0             	mov    rax,rdx
  804571:	48 01 c0             	add    rax,rax
  804574:	48 01 d0             	add    rax,rdx
  804577:	48 c1 e0 08          	shl    rax,0x8
  80457b:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804581:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  804585:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804589:	eb 31                	jmp    8045bc <palloc+0x2f2>
                }
            }
            tblp++;
  80458b:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804590:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804594:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  80459b:	0f 8e af fd ff ff    	jle    804350 <palloc+0x86>
        }
        pgind++;
  8045a1:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8045a6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8045aa:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8045b1:	0f 8e 7d fd ff ff    	jle    804334 <palloc+0x6a>
    }
    return NULL;
  8045b7:	b8 00 00 00 00       	mov    eax,0x0
}
  8045bc:	c9                   	leave  
  8045bd:	c3                   	ret    

00000000008045be <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8045be:	f3 0f 1e fa          	endbr64 
  8045c2:	55                   	push   rbp
  8045c3:	48 89 e5             	mov    rbp,rsp
  8045c6:	48 83 ec 10          	sub    rsp,0x10
  8045ca:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8045cd:	8b 05 39 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff39]        # 41450c <cur_proc>
  8045d3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8045d6:	89 d6                	mov    esi,edx
  8045d8:	89 c7                	mov    edi,eax
  8045da:	e8 eb fc ff ff       	call   8042ca <palloc>
}
  8045df:	c9                   	leave  
  8045e0:	c3                   	ret    

00000000008045e1 <proc_end>:
void proc_end()
{
  8045e1:	f3 0f 1e fa          	endbr64 
  8045e5:	55                   	push   rbp
  8045e6:	48 89 e5             	mov    rbp,rsp
  8045e9:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8045ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  8045f0:	8b 05 16 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff16]        # 41450c <cur_proc>
  8045f6:	89 c7                	mov    edi,eax
  8045f8:	e8 90 00 00 00       	call   80468d <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8045fd:	8b 05 09 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff09]        # 41450c <cur_proc>
  804603:	48 63 d0             	movsxd rdx,eax
  804606:	48 89 d0             	mov    rax,rdx
  804609:	48 01 c0             	add    rax,rax
  80460c:	48 01 d0             	add    rax,rdx
  80460f:	48 c1 e0 08          	shl    rax,0x8
  804613:	48 05 28 85 40 00    	add    rax,0x408528
  804619:	8b 00                	mov    eax,DWORD PTR [rax]
  80461b:	83 f8 ff             	cmp    eax,0xffffffff
  80461e:	74 60                	je     804680 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  804620:	8b 05 e6 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fee6]        # 41450c <cur_proc>
  804626:	48 63 d0             	movsxd rdx,eax
  804629:	48 89 d0             	mov    rax,rdx
  80462c:	48 01 c0             	add    rax,rax
  80462f:	48 01 d0             	add    rax,rdx
  804632:	48 c1 e0 08          	shl    rax,0x8
  804636:	48 05 28 85 40 00    	add    rax,0x408528
  80463c:	8b 00                	mov    eax,DWORD PTR [rax]
  80463e:	89 c2                	mov    edx,eax
  804640:	48 89 d0             	mov    rax,rdx
  804643:	48 01 c0             	add    rax,rax
  804646:	48 01 d0             	add    rax,rdx
  804649:	48 c1 e0 08          	shl    rax,0x8
  80464d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804653:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804659:	8b 05 ad fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fead]        # 41450c <cur_proc>
  80465f:	48 63 d0             	movsxd rdx,eax
  804662:	48 89 d0             	mov    rax,rdx
  804665:	48 01 c0             	add    rax,rax
  804668:	48 01 d0             	add    rax,rdx
  80466b:	48 c1 e0 08          	shl    rax,0x8
  80466f:	48 05 28 85 40 00    	add    rax,0x408528
  804675:	8b 00                	mov    eax,DWORD PTR [rax]
  804677:	89 c7                	mov    edi,eax
  804679:	e8 3f fb ff ff       	call   8041bd <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  80467e:	eb 0a                	jmp    80468a <proc_end+0xa9>
        switch_proc_tss(0);
  804680:	bf 00 00 00 00       	mov    edi,0x0
  804685:	e8 33 fb ff ff       	call   8041bd <switch_proc_tss>
}
  80468a:	90                   	nop
  80468b:	c9                   	leave  
  80468c:	c3                   	ret    

000000000080468d <del_proc>:
void del_proc(int pnr)
{
  80468d:	f3 0f 1e fa          	endbr64 
  804691:	55                   	push   rbp
  804692:	48 89 e5             	mov    rbp,rsp
  804695:	48 83 ec 30          	sub    rsp,0x30
  804699:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  80469c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80469f:	48 63 d0             	movsxd rdx,eax
  8046a2:	48 89 d0             	mov    rax,rdx
  8046a5:	48 01 c0             	add    rax,rax
  8046a8:	48 01 d0             	add    rax,rdx
  8046ab:	48 c1 e0 08          	shl    rax,0x8
  8046af:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8046b5:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8046bb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8046be:	48 63 d0             	movsxd rdx,eax
  8046c1:	48 89 d0             	mov    rax,rdx
  8046c4:	48 01 c0             	add    rax,rax
  8046c7:	48 01 d0             	add    rax,rdx
  8046ca:	48 c1 e0 08          	shl    rax,0x8
  8046ce:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046d4:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  8046da:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8046df:	eb 63                	jmp    804744 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  8046e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046e8:	25 00 f0 ff ff       	and    eax,0xfffff000
  8046ed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8046f1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8046f8:	eb 30                	jmp    80472a <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8046fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804701:	83 e0 01             	and    eax,0x1
  804704:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804707:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  80470b:	74 14                	je     804721 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  80470d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804711:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804714:	25 00 f0 ff ff       	and    eax,0xfffff000
  804719:	48 89 c7             	mov    rdi,rax
  80471c:	e8 08 ce ff ff       	call   801529 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804721:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804726:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80472a:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804731:	7e c7                	jle    8046fa <del_proc+0x6d>
        }
        vmfree(tp);
  804733:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804737:	48 89 c7             	mov    rdi,rax
  80473a:	e8 15 ca ff ff       	call   801154 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80473f:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804744:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804748:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80474b:	83 e0 01             	and    eax,0x1
  80474e:	48 85 c0             	test   rax,rax
  804751:	75 8e                	jne    8046e1 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804753:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804757:	48 89 c7             	mov    rdi,rax
  80475a:	e8 f5 c9 ff ff       	call   801154 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80475f:	90                   	nop
  804760:	c9                   	leave  
  804761:	c3                   	ret    

0000000000804762 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804762:	f3 0f 1e fa          	endbr64 
  804766:	55                   	push   rbp
  804767:	48 89 e5             	mov    rbp,rsp
  80476a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80476d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804770:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804774:	75 0a                	jne    804780 <set_proc_stat+0x1e>
  804776:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80477b:	e9 8c 00 00 00       	jmp    80480c <set_proc_stat+0xaa>
    int i=0;
  804780:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804787:	eb 04                	jmp    80478d <set_proc_stat+0x2b>
  804789:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80478d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804790:	48 63 d0             	movsxd rdx,eax
  804793:	48 89 d0             	mov    rax,rdx
  804796:	48 01 c0             	add    rax,rax
  804799:	48 01 d0             	add    rax,rdx
  80479c:	48 c1 e0 08          	shl    rax,0x8
  8047a0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8047a6:	8b 10                	mov    edx,DWORD PTR [rax]
  8047a8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047ab:	39 c2                	cmp    edx,eax
  8047ad:	75 da                	jne    804789 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  8047af:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8047b3:	75 07                	jne    8047bc <set_proc_stat+0x5a>
  8047b5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8047ba:	eb 50                	jmp    80480c <set_proc_stat+0xaa>
    task[i].stat=stat;
  8047bc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8047bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047c2:	48 63 c8             	movsxd rcx,eax
  8047c5:	48 89 c8             	mov    rax,rcx
  8047c8:	48 01 c0             	add    rax,rax
  8047cb:	48 01 c8             	add    rax,rcx
  8047ce:	48 c1 e0 08          	shl    rax,0x8
  8047d2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8047d8:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8047da:	8b 05 2c fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd2c]        # 41450c <cur_proc>
  8047e0:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8047e3:	75 22                	jne    804807 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  8047e5:	8b 05 21 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd21]        # 41450c <cur_proc>
  8047eb:	48 63 d0             	movsxd rdx,eax
  8047ee:	48 89 d0             	mov    rax,rdx
  8047f1:	48 01 c0             	add    rax,rax
  8047f4:	48 01 d0             	add    rax,rdx
  8047f7:	48 c1 e0 08          	shl    rax,0x8
  8047fb:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804801:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804807:	b8 00 00 00 00       	mov    eax,0x0
}
  80480c:	5d                   	pop    rbp
  80480d:	c3                   	ret    

000000000080480e <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  80480e:	f3 0f 1e fa          	endbr64 
  804812:	55                   	push   rbp
  804813:	48 89 e5             	mov    rbp,rsp
  804816:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80481a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804821:	eb 6a                	jmp    80488d <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  804823:	8b 05 e3 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fce3]        # 41450c <cur_proc>
  804829:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80482c:	48 63 ca             	movsxd rcx,edx
  80482f:	48 63 d0             	movsxd rdx,eax
  804832:	48 89 d0             	mov    rax,rdx
  804835:	48 01 c0             	add    rax,rax
  804838:	48 01 d0             	add    rax,rdx
  80483b:	48 c1 e0 05          	shl    rax,0x5
  80483f:	48 01 c8             	add    rax,rcx
  804842:	48 83 c0 18          	add    rax,0x18
  804846:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  80484d:	00 
  80484e:	48 85 c0             	test   rax,rax
  804851:	75 36                	jne    804889 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804853:	8b 05 b3 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fcb3]        # 41450c <cur_proc>
  804859:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80485c:	48 63 ca             	movsxd rcx,edx
  80485f:	48 63 d0             	movsxd rdx,eax
  804862:	48 89 d0             	mov    rax,rdx
  804865:	48 01 c0             	add    rax,rax
  804868:	48 01 d0             	add    rax,rdx
  80486b:	48 c1 e0 05          	shl    rax,0x5
  80486f:	48 01 c8             	add    rax,rcx
  804872:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804876:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80487a:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804881:	00 
            return 0;
  804882:	b8 00 00 00 00       	mov    eax,0x0
  804887:	eb 0f                	jmp    804898 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804889:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80488d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804891:	7e 90                	jle    804823 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804893:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804898:	5d                   	pop    rbp
  804899:	c3                   	ret    

000000000080489a <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  80489a:	f3 0f 1e fa          	endbr64 
  80489e:	55                   	push   rbp
  80489f:	48 89 e5             	mov    rbp,rsp
  8048a2:	48 83 ec 10          	sub    rsp,0x10
  8048a6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8048a9:	8b 05 5d fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc5d]        # 41450c <cur_proc>
  8048af:	89 c7                	mov    edi,eax
  8048b1:	e8 d7 fd ff ff       	call   80468d <del_proc>
    return code;
  8048b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8048b9:	c9                   	leave  
  8048ba:	c3                   	ret    

00000000008048bb <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8048bb:	f3 0f 1e fa          	endbr64 
  8048bf:	55                   	push   rbp
  8048c0:	48 89 e5             	mov    rbp,rsp
  8048c3:	48 83 ec 40          	sub    rsp,0x40
  8048c7:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8048ca:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8048ce:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  8048d2:	b8 00 00 00 00       	mov    eax,0x0
  8048d7:	e8 81 f4 ff ff       	call   803d5d <req_proc>
  8048dc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  8048df:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8048e3:	75 0a                	jne    8048ef <reg_proc+0x34>
  8048e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8048ea:	e9 65 01 00 00       	jmp    804a54 <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  8048ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048f2:	50                   	push   rax
  8048f3:	6a 00                	push   0x0
  8048f5:	6a 00                	push   0x0
  8048f7:	6a 00                	push   0x0
  8048f9:	6a 00                	push   0x0
  8048fb:	6a 00                	push   0x0
  8048fd:	68 fc ff bf 01       	push   0x1bffffc
  804902:	6a 10                	push   0x10
  804904:	6a 10                	push   0x10
  804906:	6a 10                	push   0x10
  804908:	6a 10                	push   0x10
  80490a:	41 b9 08 00 00 00    	mov    r9d,0x8
  804910:	41 b8 10 00 00 00    	mov    r8d,0x10
  804916:	b9 00 00 00 00       	mov    ecx,0x0
  80491b:	ba 00 00 00 00       	mov    edx,0x0
  804920:	be 00 00 00 00       	mov    esi,0x0
  804925:	bf 00 00 00 00       	mov    edi,0x0
  80492a:	e8 27 f5 ff ff       	call   803e56 <set_proc>
  80492f:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  804933:	b8 00 00 00 00       	mov    eax,0x0
  804938:	e8 88 c7 ff ff       	call   8010c5 <vmalloc>
  80493d:	48 89 c1             	mov    rcx,rax
  804940:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804943:	48 63 d0             	movsxd rdx,eax
  804946:	48 89 d0             	mov    rax,rdx
  804949:	48 01 c0             	add    rax,rax
  80494c:	48 01 d0             	add    rax,rdx
  80494f:	48 c1 e0 08          	shl    rax,0x8
  804953:	48 05 40 85 40 00    	add    rax,0x408540
  804959:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  80495d:	b8 00 00 00 00       	mov    eax,0x0
  804962:	e8 5e c7 ff ff       	call   8010c5 <vmalloc>
  804967:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80496b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80496e:	48 63 d0             	movsxd rdx,eax
  804971:	48 89 d0             	mov    rax,rdx
  804974:	48 01 c0             	add    rax,rax
  804977:	48 01 d0             	add    rax,rdx
  80497a:	48 c1 e0 08          	shl    rax,0x8
  80497e:	48 05 40 85 40 00    	add    rax,0x408540
  804984:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804988:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  80498f:	b8 00 00 00 00       	mov    eax,0x0
  804994:	e8 2c c7 ff ff       	call   8010c5 <vmalloc>
  804999:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80499d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8049a1:	83 c8 07             	or     eax,0x7
  8049a4:	89 c1                	mov    ecx,eax
  8049a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049a9:	48 63 d0             	movsxd rdx,eax
  8049ac:	48 89 d0             	mov    rax,rdx
  8049af:	48 01 c0             	add    rax,rax
  8049b2:	48 01 d0             	add    rax,rdx
  8049b5:	48 c1 e0 08          	shl    rax,0x8
  8049b9:	48 05 40 85 40 00    	add    rax,0x408540
  8049bf:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8049c3:	48 8d 50 30          	lea    rdx,[rax+0x30]
  8049c7:	48 63 c1             	movsxd rax,ecx
  8049ca:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8049cd:	b8 00 00 00 00       	mov    eax,0x0
  8049d2:	e8 82 ca ff ff       	call   801459 <req_a_page>
  8049d7:	89 c7                	mov    edi,eax
  8049d9:	e8 29 cc ff ff       	call   801607 <get_phyaddr>
  8049de:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8049e2:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  8049e9:	83 c8 07             	or     eax,0x7
  8049ec:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  8049ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049f1:	48 63 d0             	movsxd rdx,eax
  8049f4:	48 89 d0             	mov    rax,rdx
  8049f7:	48 01 c0             	add    rax,rax
  8049fa:	48 01 d0             	add    rax,rdx
  8049fd:	48 c1 e0 08          	shl    rax,0x8
  804a01:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804a07:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804a0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a10:	48 63 d0             	movsxd rdx,eax
  804a13:	48 89 d0             	mov    rax,rdx
  804a16:	48 01 c0             	add    rax,rax
  804a19:	48 01 d0             	add    rax,rdx
  804a1c:	48 c1 e0 08          	shl    rax,0x8
  804a20:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804a27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a2b:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804a2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a32:	48 63 d0             	movsxd rdx,eax
  804a35:	48 89 d0             	mov    rax,rdx
  804a38:	48 01 c0             	add    rax,rax
  804a3b:	48 01 d0             	add    rax,rdx
  804a3e:	48 c1 e0 08          	shl    rax,0x8
  804a42:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804a49:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804a4d:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804a51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804a54:	c9                   	leave  
  804a55:	c3                   	ret    

0000000000804a56 <sys_malloc>:

void * sys_malloc(int size)
{
  804a56:	f3 0f 1e fa          	endbr64 
  804a5a:	55                   	push   rbp
  804a5b:	48 89 e5             	mov    rbp,rsp
  804a5e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804a61:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a64:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804a6a:	85 c0                	test   eax,eax
  804a6c:	0f 48 c2             	cmovs  eax,edx
  804a6f:	c1 f8 0c             	sar    eax,0xc
  804a72:	89 c1                	mov    ecx,eax
  804a74:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a77:	99                   	cdq    
  804a78:	c1 ea 14             	shr    edx,0x14
  804a7b:	01 d0                	add    eax,edx
  804a7d:	25 ff 0f 00 00       	and    eax,0xfff
  804a82:	29 d0                	sub    eax,edx
  804a84:	01 c8                	add    eax,ecx
  804a86:	85 c0                	test   eax,eax
  804a88:	0f 95 c0             	setne  al
  804a8b:	0f b6 c0             	movzx  eax,al
  804a8e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804a91:	8b 05 75 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa75]        # 41450c <cur_proc>
  804a97:	48 63 d0             	movsxd rdx,eax
  804a9a:	48 89 d0             	mov    rax,rdx
  804a9d:	48 01 c0             	add    rax,rax
  804aa0:	48 01 d0             	add    rax,rdx
  804aa3:	48 c1 e0 08          	shl    rax,0x8
  804aa7:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804aad:	8b 00                	mov    eax,DWORD PTR [rax]
  804aaf:	48 98                	cdqe   
  804ab1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804ab5:	eb 0c                	jmp    804ac3 <sys_malloc+0x6d>
        hp=hp->next;
  804ab7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804abb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804abf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804ac3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ac7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804acb:	48 85 c0             	test   rax,rax
  804ace:	74 16                	je     804ae6 <sys_malloc+0x90>
  804ad0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ad4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804ad7:	85 c0                	test   eax,eax
  804ad9:	75 0b                	jne    804ae6 <sys_malloc+0x90>
  804adb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804adf:	8b 00                	mov    eax,DWORD PTR [rax]
  804ae1:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ae4:	7e d1                	jle    804ab7 <sys_malloc+0x61>
    if(hp->pgn<n)
  804ae6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aea:	8b 00                	mov    eax,DWORD PTR [rax]
  804aec:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804aef:	0f 8e 8d 00 00 00    	jle    804b82 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804af5:	8b 05 11 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa11]        # 41450c <cur_proc>
  804afb:	48 63 d0             	movsxd rdx,eax
  804afe:	48 89 d0             	mov    rax,rdx
  804b01:	48 01 c0             	add    rax,rax
  804b04:	48 01 d0             	add    rax,rdx
  804b07:	48 c1 e0 08          	shl    rax,0x8
  804b0b:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804b11:	8b 10                	mov    edx,DWORD PTR [rax]
  804b13:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b16:	c1 e0 0c             	shl    eax,0xc
  804b19:	01 d0                	add    eax,edx
  804b1b:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804b20:	7e 0a                	jle    804b2c <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804b22:	b8 00 00 00 00       	mov    eax,0x0
  804b27:	e9 cf 00 00 00       	jmp    804bfb <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804b2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b30:	8b 10                	mov    edx,DWORD PTR [rax]
  804b32:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b35:	29 d0                	sub    eax,edx
  804b37:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804b3a:	8b 05 cc f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f9cc]        # 41450c <cur_proc>
  804b40:	48 63 d0             	movsxd rdx,eax
  804b43:	48 89 d0             	mov    rax,rdx
  804b46:	48 01 c0             	add    rax,rax
  804b49:	48 01 d0             	add    rax,rdx
  804b4c:	48 c1 e0 08          	shl    rax,0x8
  804b50:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804b56:	8b 00                	mov    eax,DWORD PTR [rax]
  804b58:	48 98                	cdqe   
  804b5a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b5e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804b65:	eb 13                	jmp    804b7a <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804b67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b6b:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804b6e:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804b75:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b76:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b7a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b7d:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804b80:	7c e5                	jl     804b67 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804b82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b86:	8b 00                	mov    eax,DWORD PTR [rax]
  804b88:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804b8b:	7d 59                	jge    804be6 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804b8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b91:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804b95:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b98:	83 c0 01             	add    eax,0x1
  804b9b:	c1 e0 0c             	shl    eax,0xc
  804b9e:	48 98                	cdqe   
  804ba0:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804ba4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ba8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804bac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bb0:	8b 00                	mov    eax,DWORD PTR [rax]
  804bb2:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804bb5:	8d 50 ff             	lea    edx,[rax-0x1]
  804bb8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804bbc:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804bbe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bc2:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804bc6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804bca:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804bce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804bd2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804bd6:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804bda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bde:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804be2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804be6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bea:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804bf1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bf5:	48 05 00 10 00 00    	add    rax,0x1000
}
  804bfb:	5d                   	pop    rbp
  804bfc:	c3                   	ret    

0000000000804bfd <sys_free>:
int sys_free(int ptr)
{
  804bfd:	f3 0f 1e fa          	endbr64 
  804c01:	55                   	push   rbp
  804c02:	48 89 e5             	mov    rbp,rsp
  804c05:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804c08:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c0b:	2d 00 10 00 00       	sub    eax,0x1000
  804c10:	48 98                	cdqe   
  804c12:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804c16:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c1a:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804c21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c25:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804c29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c2d:	eb 2e                	jmp    804c5d <sys_free+0x60>
    {
        if(p->alloc==0)
  804c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c33:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c36:	85 c0                	test   eax,eax
  804c38:	75 2c                	jne    804c66 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c3e:	8b 10                	mov    edx,DWORD PTR [rax]
  804c40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c44:	8b 00                	mov    eax,DWORD PTR [rax]
  804c46:	83 c0 01             	add    eax,0x1
  804c49:	01 c2                	add    edx,eax
  804c4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c4f:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804c51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c55:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804c59:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c5d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804c62:	75 cb                	jne    804c2f <sys_free+0x32>
  804c64:	eb 01                	jmp    804c67 <sys_free+0x6a>
            break;
  804c66:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804c67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c6b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804c6f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c73:	eb 2e                	jmp    804ca3 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804c75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c79:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c7c:	85 c0                	test   eax,eax
  804c7e:	75 2c                	jne    804cac <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804c80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c84:	8b 10                	mov    edx,DWORD PTR [rax]
  804c86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c8a:	8b 00                	mov    eax,DWORD PTR [rax]
  804c8c:	83 c0 01             	add    eax,0x1
  804c8f:	01 c2                	add    edx,eax
  804c91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c95:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804c97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c9b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804c9f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804ca3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804ca8:	75 cb                	jne    804c75 <sys_free+0x78>
  804caa:	eb 01                	jmp    804cad <sys_free+0xb0>
            break;
  804cac:	90                   	nop
    }
    //合并完成
    return 0;
  804cad:	b8 00 00 00 00       	mov    eax,0x0
}
  804cb2:	5d                   	pop    rbp
  804cb3:	c3                   	ret    

0000000000804cb4 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804cb4:	f3 0f 1e fa          	endbr64 
  804cb8:	55                   	push   rbp
  804cb9:	48 89 e5             	mov    rbp,rsp
  804cbc:	53                   	push   rbx
  804cbd:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804cc1:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804cc5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cc9:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804ccf:	48 c1 f8 08          	sar    rax,0x8
  804cd3:	48 89 c2             	mov    rdx,rax
  804cd6:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804cdd:	aa aa aa 
  804ce0:	48 0f af c2          	imul   rax,rdx
  804ce4:	89 05 22 f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f822],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804cea:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804cee:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804cf2:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804cf6:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804cfa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cfe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d02:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d06:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804d0a:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804d0e:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804d12:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804d19:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804d44 <done>
  804d20:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804d27:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804d2e:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804d34:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804d3b:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804d42:	eb 08                	jmp    804d4c <__switch_to>

0000000000804d44 <done>:
  804d44:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804d45:	90                   	nop
  804d46:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d4a:	c9                   	leave  
  804d4b:	c3                   	ret    

0000000000804d4c <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804d4c:	f3 0f 1e fa          	endbr64 
  804d50:	55                   	push   rbp
  804d51:	48 89 e5             	mov    rbp,rsp
  804d54:	53                   	push   rbx
  804d55:	48 83 ec 18          	sub    rsp,0x18
  804d59:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804d5d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d61:	48 8b 05 38 57 00 00 	mov    rax,QWORD PTR [rip+0x5738]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d68:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d6c:	48 8b 05 2d 57 00 00 	mov    rax,QWORD PTR [rip+0x572d]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d73:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d77:	48 8b 05 22 57 00 00 	mov    rax,QWORD PTR [rip+0x5722]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d7e:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d82:	48 8b 05 17 57 00 00 	mov    rax,QWORD PTR [rip+0x5717]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d89:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d8d:	48 8b 05 0c 57 00 00 	mov    rax,QWORD PTR [rip+0x570c]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d94:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804d98:	48 8b 05 01 57 00 00 	mov    rax,QWORD PTR [rip+0x5701]        # 80a4a0 <tss>
  804d9f:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804da3:	48 8b 05 f6 56 00 00 	mov    rax,QWORD PTR [rip+0x56f6]        # 80a4a0 <tss>
  804daa:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804dae:	48 8b 05 eb 56 00 00 	mov    rax,QWORD PTR [rip+0x56eb]        # 80a4a0 <tss>
  804db5:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804db9:	48 8b 05 e0 56 00 00 	mov    rax,QWORD PTR [rip+0x56e0]        # 80a4a0 <tss>
  804dc0:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804dc4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804dc8:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804dcf:	41 52                	push   r10
  804dd1:	41 51                	push   r9
  804dd3:	41 50                	push   r8
  804dd5:	57                   	push   rdi
  804dd6:	49 89 d9             	mov    r9,rbx
  804dd9:	4d 89 d8             	mov    r8,r11
  804ddc:	48 89 c7             	mov    rdi,rax
  804ddf:	e8 33 00 00 00       	call   804e17 <set_tss>
  804de4:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804de8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804dec:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804df0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804df4:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804df8:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804dfe:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804e04:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804e0a:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804e10:	90                   	nop
  804e11:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804e15:	c9                   	leave  
  804e16:	c3                   	ret    

0000000000804e17 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804e17:	f3 0f 1e fa          	endbr64 
  804e1b:	55                   	push   rbp
  804e1c:	48 89 e5             	mov    rbp,rsp
  804e1f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804e23:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804e27:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804e2b:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804e2f:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804e33:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804e37:	48 8b 05 62 56 00 00 	mov    rax,QWORD PTR [rip+0x5662]        # 80a4a0 <tss>
  804e3e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804e42:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804e46:	48 8b 05 53 56 00 00 	mov    rax,QWORD PTR [rip+0x5653]        # 80a4a0 <tss>
  804e4d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804e51:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804e55:	48 8b 05 44 56 00 00 	mov    rax,QWORD PTR [rip+0x5644]        # 80a4a0 <tss>
  804e5c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804e60:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804e64:	48 8b 05 35 56 00 00 	mov    rax,QWORD PTR [rip+0x5635]        # 80a4a0 <tss>
  804e6b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804e6f:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804e73:	48 8b 05 26 56 00 00 	mov    rax,QWORD PTR [rip+0x5626]        # 80a4a0 <tss>
  804e7a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804e7e:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804e82:	48 8b 05 17 56 00 00 	mov    rax,QWORD PTR [rip+0x5617]        # 80a4a0 <tss>
  804e89:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804e8d:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804e91:	48 8b 05 08 56 00 00 	mov    rax,QWORD PTR [rip+0x5608]        # 80a4a0 <tss>
  804e98:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804e9c:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804ea0:	48 8b 05 f9 55 00 00 	mov    rax,QWORD PTR [rip+0x55f9]        # 80a4a0 <tss>
  804ea7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804eab:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804eaf:	48 8b 05 ea 55 00 00 	mov    rax,QWORD PTR [rip+0x55ea]        # 80a4a0 <tss>
  804eb6:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804eba:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804ebe:	48 8b 05 db 55 00 00 	mov    rax,QWORD PTR [rip+0x55db]        # 80a4a0 <tss>
  804ec5:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804ec9:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804ecd:	90                   	nop
  804ece:	5d                   	pop    rbp
  804ecf:	c3                   	ret    

0000000000804ed0 <outb>:
  804ed0:	66 89 fa             	mov    dx,di
  804ed3:	66 89 f0             	mov    ax,si
  804ed6:	ee                   	out    dx,al
  804ed7:	e8 29 00 00 00       	call   804f05 <io_delay>
  804edc:	c3                   	ret    

0000000000804edd <outw>:
  804edd:	66 89 fa             	mov    dx,di
  804ee0:	66 89 f0             	mov    ax,si
  804ee3:	66 ef                	out    dx,ax
  804ee5:	90                   	nop
  804ee6:	90                   	nop
  804ee7:	90                   	nop
  804ee8:	c3                   	ret    

0000000000804ee9 <inb>:
  804ee9:	31 c0                	xor    eax,eax
  804eeb:	66 89 fa             	mov    dx,di
  804eee:	ec                   	in     al,dx
  804eef:	90                   	nop
  804ef0:	90                   	nop
  804ef1:	90                   	nop
  804ef2:	c3                   	ret    

0000000000804ef3 <inw>:
  804ef3:	31 c0                	xor    eax,eax
  804ef5:	66 89 fa             	mov    dx,di
  804ef8:	66 ed                	in     ax,dx
  804efa:	90                   	nop
  804efb:	90                   	nop
  804efc:	90                   	nop
  804efd:	c3                   	ret    

0000000000804efe <eoi>:
  804efe:	b0 20                	mov    al,0x20
  804f00:	e6 a0                	out    0xa0,al
  804f02:	e6 20                	out    0x20,al
  804f04:	c3                   	ret    

0000000000804f05 <io_delay>:
  804f05:	90                   	nop
  804f06:	90                   	nop
  804f07:	90                   	nop
  804f08:	90                   	nop
  804f09:	c3                   	ret    

0000000000804f0a <turn_on_int>:
  804f0a:	b0 f8                	mov    al,0xf8
  804f0c:	e6 21                	out    0x21,al
  804f0e:	e8 f2 ff ff ff       	call   804f05 <io_delay>
  804f13:	b0 af                	mov    al,0xaf
  804f15:	e6 a1                	out    0xa1,al
  804f17:	e8 e9 ff ff ff       	call   804f05 <io_delay>
  804f1c:	b8 00 70 10 00       	mov    eax,0x107000
  804f21:	0f 01 18             	lidt   [rax]
  804f24:	90                   	nop
  804f25:	90                   	nop
  804f26:	90                   	nop
  804f27:	90                   	nop
  804f28:	fb                   	sti    
  804f29:	c3                   	ret    

0000000000804f2a <report_back_trace_of_err>:
  804f2a:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804f2f:	50                   	push   rax
  804f30:	68 39 4f 80 00       	push   0x804f39
  804f35:	83 c4 08             	add    esp,0x8
  804f38:	c3                   	ret    

0000000000804f39 <bt_msg>:
  804f39:	65 72 72             	gs jb  804fae <fill_desc+0x4e>
  804f3c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804f3d:	72 20                	jb     804f5f <init_gdt+0x11>
  804f3f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804f40:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804f43:	72 73                	jb     804fb8 <fill_desc+0x58>
  804f45:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804f48:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeabc6 <_knl_end+0x2eabc6>

0000000000804f4e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804f4e:	f3 0f 1e fa          	endbr64 
  804f52:	55                   	push   rbp
  804f53:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804f56:	66 b8 48 00          	mov    ax,0x48
  804f5a:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  804f5d:	90                   	nop
  804f5e:	5d                   	pop    rbp
  804f5f:	c3                   	ret    

0000000000804f60 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804f60:	f3 0f 1e fa          	endbr64 
  804f64:	55                   	push   rbp
  804f65:	48 89 e5             	mov    rbp,rsp
  804f68:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804f6c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804f70:	89 d0                	mov    eax,edx
  804f72:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804f75:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804f79:	48 8b 15 28 55 00 00 	mov    rdx,QWORD PTR [rip+0x5528]        # 80a4a8 <gdt>
  804f80:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f83:	48 c1 e0 04          	shl    rax,0x4
  804f87:	48 01 d0             	add    rax,rdx
  804f8a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804f8e:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804f92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f96:	48 c1 e8 10          	shr    rax,0x10
  804f9a:	48 89 c1             	mov    rcx,rax
  804f9d:	48 8b 15 04 55 00 00 	mov    rdx,QWORD PTR [rip+0x5504]        # 80a4a8 <gdt>
  804fa4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fa7:	48 c1 e0 04          	shl    rax,0x4
  804fab:	48 01 d0             	add    rax,rdx
  804fae:	89 ca                	mov    edx,ecx
  804fb0:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804fb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fb7:	48 c1 e8 18          	shr    rax,0x18
  804fbb:	48 89 c1             	mov    rcx,rax
  804fbe:	48 8b 15 e3 54 00 00 	mov    rdx,QWORD PTR [rip+0x54e3]        # 80a4a8 <gdt>
  804fc5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fc8:	48 c1 e0 04          	shl    rax,0x4
  804fcc:	48 01 d0             	add    rax,rdx
  804fcf:	89 ca                	mov    edx,ecx
  804fd1:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804fd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fd8:	48 c1 e8 20          	shr    rax,0x20
  804fdc:	48 89 c2             	mov    rdx,rax
  804fdf:	48 8b 0d c2 54 00 00 	mov    rcx,QWORD PTR [rip+0x54c2]        # 80a4a8 <gdt>
  804fe6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fe9:	48 c1 e0 04          	shl    rax,0x4
  804fed:	48 01 c8             	add    rax,rcx
  804ff0:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804ff3:	48 8b 15 ae 54 00 00 	mov    rdx,QWORD PTR [rip+0x54ae]        # 80a4a8 <gdt>
  804ffa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ffd:	48 c1 e0 04          	shl    rax,0x4
  805001:	48 01 d0             	add    rax,rdx
  805004:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805008:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80500b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80500f:	48 c1 e8 08          	shr    rax,0x8
  805013:	66 25 f0 00          	and    ax,0xf0
  805017:	48 8b 0d 8a 54 00 00 	mov    rcx,QWORD PTR [rip+0x548a]        # 80a4a8 <gdt>
  80501e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805021:	48 c1 e2 04          	shl    rdx,0x4
  805025:	48 01 ca             	add    rdx,rcx
  805028:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80502c:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805030:	90                   	nop
  805031:	5d                   	pop    rbp
  805032:	c3                   	ret    

0000000000805033 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805033:	f3 0f 1e fa          	endbr64 
  805037:	55                   	push   rbp
  805038:	48 89 e5             	mov    rbp,rsp
  80503b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80503e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805041:	89 c8                	mov    eax,ecx
  805043:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805047:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80504b:	48 8b 05 56 54 00 00 	mov    rax,QWORD PTR [rip+0x5456]        # 80a4a8 <gdt>
  805052:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805056:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805059:	48 c1 e0 04          	shl    rax,0x4
  80505d:	48 89 c2             	mov    rdx,rax
  805060:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805064:	48 01 d0             	add    rax,rdx
  805067:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80506a:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80506d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805070:	48 c1 e0 04          	shl    rax,0x4
  805074:	48 89 c2             	mov    rdx,rax
  805077:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80507b:	48 01 d0             	add    rax,rdx
  80507e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805081:	c1 ea 10             	shr    edx,0x10
  805084:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805087:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80508a:	48 c1 e0 04          	shl    rax,0x4
  80508e:	48 89 c2             	mov    rdx,rax
  805091:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805095:	48 01 c2             	add    rdx,rax
  805098:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80509c:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8050a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8050a3:	48 c1 e0 04          	shl    rax,0x4
  8050a7:	48 89 c2             	mov    rdx,rax
  8050aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050ae:	48 01 c2             	add    rdx,rax
  8050b1:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8050b5:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8050b9:	90                   	nop
  8050ba:	5d                   	pop    rbp
  8050bb:	c3                   	ret    

00000000008050bc <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8050bc:	f3 0f 1e fa          	endbr64 
  8050c0:	55                   	push   rbp
  8050c1:	48 89 e5             	mov    rbp,rsp
  8050c4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8050c7:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8050ca:	89 d0                	mov    eax,edx
  8050cc:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8050d0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8050d4:	90                   	nop
  8050d5:	5d                   	pop    rbp
  8050d6:	c3                   	ret    
  8050d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  8050de:	00 00 

00000000008050e0 <fill_desc>:
  8050e0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8050e5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8050ea:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8050ef:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8050f4:	be 00 60 00 00       	mov    esi,0x6000
  8050f9:	c1 e2 03             	shl    edx,0x3
  8050fc:	01 d6                	add    esi,edx
  8050fe:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805102:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805107:	c1 e8 10             	shr    eax,0x10
  80510a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80510e:	c1 eb 10             	shr    ebx,0x10
  805111:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805115:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805119:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80511d:	c3                   	ret    

000000000080511e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80511e:	f3 0f 1e fa          	endbr64 
  805122:	55                   	push   rbp
  805123:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805126:	b8 00 00 00 00       	mov    eax,0x0
  80512b:	e8 3c 17 00 00       	call   80686c <execute_request>
    do_req();
  805130:	b8 00 00 00 00       	mov    eax,0x0
  805135:	e8 a5 e7 ff ff       	call   8038df <do_req>
    if(!manage_proc_lock)
  80513a:	8b 05 08 53 00 00    	mov    eax,DWORD PTR [rip+0x5308]        # 80a448 <manage_proc_lock>
  805140:	85 c0                	test   eax,eax
  805142:	75 0a                	jne    80514e <clock_c+0x30>
    {
        manage_proc();
  805144:	b8 00 00 00 00       	mov    eax,0x0
  805149:	e8 a3 ee ff ff       	call   803ff1 <manage_proc>
    }
    //puts("1 disk req executed.");
  80514e:	90                   	nop
  80514f:	5d                   	pop    rbp
  805150:	c3                   	ret    
  805151:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805158:	00 00 00 
  80515b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805160 <clock>:
  805160:	50                   	push   rax
  805161:	53                   	push   rbx
  805162:	51                   	push   rcx
  805163:	52                   	push   rdx
  805164:	57                   	push   rdi
  805165:	56                   	push   rsi
  805166:	41 50                	push   r8
  805168:	41 51                	push   r9
  80516a:	41 52                	push   r10
  80516c:	41 53                	push   r11
  80516e:	41 54                	push   r12
  805170:	41 55                	push   r13
  805172:	41 56                	push   r14
  805174:	41 57                	push   r15
  805176:	66 8c c0             	mov    ax,es
  805179:	66 50                	push   ax
  80517b:	66 8c d8             	mov    ax,ds
  80517e:	66 50                	push   ax
  805180:	66 b8 10 00          	mov    ax,0x10
  805184:	8e c0                	mov    es,eax
  805186:	8e d8                	mov    ds,eax

0000000000805188 <clock.normal_part>:
  805188:	b0 20                	mov    al,0x20
  80518a:	e6 a0                	out    0xa0,al
  80518c:	e6 20                	out    0x20,al
  80518e:	e8 8b ff ff ff       	call   80511e <clock_c>
  805193:	66 58                	pop    ax
  805195:	8e d8                	mov    ds,eax
  805197:	66 58                	pop    ax
  805199:	8e c0                	mov    es,eax
  80519b:	41 5f                	pop    r15
  80519d:	41 5e                	pop    r14
  80519f:	41 5d                	pop    r13
  8051a1:	41 5c                	pop    r12
  8051a3:	41 5b                	pop    r11
  8051a5:	41 5a                	pop    r10
  8051a7:	41 59                	pop    r9
  8051a9:	41 58                	pop    r8
  8051ab:	5e                   	pop    rsi
  8051ac:	5f                   	pop    rdi
  8051ad:	5a                   	pop    rdx
  8051ae:	59                   	pop    rcx
  8051af:	5b                   	pop    rbx
  8051b0:	58                   	pop    rax
  8051b1:	48 cf                	iretq  

00000000008051b3 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  8051b3:	f3 0f 1e fa          	endbr64 
  8051b7:	55                   	push   rbp
  8051b8:	48 89 e5             	mov    rbp,rsp
  8051bb:	48 83 ec 30          	sub    rsp,0x30
  8051bf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  8051c3:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  8051ca:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  8051d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051d5:	be 01 00 00 00       	mov    esi,0x1
  8051da:	48 89 c7             	mov    rdi,rax
  8051dd:	e8 f0 c9 ff ff       	call   801bd2 <sys_open>
  8051e2:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  8051e5:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8051e9:	75 0a                	jne    8051f5 <execute+0x42>
  8051eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8051f0:	e9 b7 00 00 00       	jmp    8052ac <execute+0xf9>
    //
    char *p=path;
  8051f5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051f9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  8051fd:	eb 05                	jmp    805204 <execute+0x51>
  8051ff:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805204:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805208:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80520b:	84 c0                	test   al,al
  80520d:	75 f0                	jne    8051ff <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  80520f:	eb 05                	jmp    805216 <execute+0x63>
  805211:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805216:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80521a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80521d:	3c 2f                	cmp    al,0x2f
  80521f:	74 0a                	je     80522b <execute+0x78>
  805221:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805225:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805229:	77 e6                	ja     805211 <execute+0x5e>
    if(p>path)
  80522b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80522f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805233:	76 2f                	jbe    805264 <execute+0xb1>
    {
        *p='\0';
  805235:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805239:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  80523c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805240:	be 01 00 00 00       	mov    esi,0x1
  805245:	48 89 c7             	mov    rdi,rax
  805248:	e8 85 c9 ff ff       	call   801bd2 <sys_open>
  80524d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805250:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805254:	75 07                	jne    80525d <execute+0xaa>
  805256:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80525b:	eb 4f                	jmp    8052ac <execute+0xf9>
        *p='/';
  80525d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805261:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805264:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805267:	48 63 d0             	movsxd rdx,eax
  80526a:	48 89 d0             	mov    rax,rdx
  80526d:	48 01 c0             	add    rax,rax
  805270:	48 01 d0             	add    rax,rdx
  805273:	48 c1 e0 05          	shl    rax,0x5
  805277:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  80527e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805281:	48 63 c8             	movsxd rcx,eax
  805284:	48 89 c8             	mov    rax,rcx
  805287:	48 01 c0             	add    rax,rax
  80528a:	48 01 c8             	add    rax,rcx
  80528d:	48 c1 e0 05          	shl    rax,0x5
  805291:	48 05 60 06 40 00    	add    rax,0x400660
  805297:	b9 24 53 80 00       	mov    ecx,0x805324
  80529c:	48 89 c6             	mov    rsi,rax
  80529f:	89 cf                	mov    edi,ecx
  8052a1:	e8 15 f6 ff ff       	call   8048bb <reg_proc>
  8052a6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  8052a9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  8052ac:	c9                   	leave  
  8052ad:	c3                   	ret    

00000000008052ae <exec_call>:

int exec_call(char *path)
{
  8052ae:	f3 0f 1e fa          	endbr64 
  8052b2:	55                   	push   rbp
  8052b3:	48 89 e5             	mov    rbp,rsp
  8052b6:	48 83 ec 20          	sub    rsp,0x20
  8052ba:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  8052be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8052c2:	48 89 c7             	mov    rdi,rax
  8052c5:	e8 e9 fe ff ff       	call   8051b3 <execute>
  8052ca:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  8052cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052d0:	01 c0                	add    eax,eax
  8052d2:	83 c0 05             	add    eax,0x5
  8052d5:	c1 e0 03             	shl    eax,0x3
  8052d8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  8052db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052de:	89 c7                	mov    edi,eax
  8052e0:	e8 d8 ee ff ff       	call   8041bd <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  8052e5:	90                   	nop
  8052e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052e9:	48 63 d0             	movsxd rdx,eax
  8052ec:	48 89 d0             	mov    rax,rdx
  8052ef:	48 01 c0             	add    rax,rax
  8052f2:	48 01 d0             	add    rax,rdx
  8052f5:	48 c1 e0 08          	shl    rax,0x8
  8052f9:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8052ff:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805302:	83 f8 03             	cmp    eax,0x3
  805305:	75 df                	jne    8052e6 <exec_call+0x38>
    return task[pi].exit_code;
  805307:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80530a:	48 63 d0             	movsxd rdx,eax
  80530d:	48 89 d0             	mov    rax,rdx
  805310:	48 01 c0             	add    rax,rax
  805313:	48 01 d0             	add    rax,rdx
  805316:	48 c1 e0 08          	shl    rax,0x8
  80531a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805320:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805322:	c9                   	leave  
  805323:	c3                   	ret    

0000000000805324 <proc_start>:
int proc_start()
{
  805324:	f3 0f 1e fa          	endbr64 
  805328:	55                   	push   rbp
  805329:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  80532c:	8b 05 da f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1da]        # 41450c <cur_proc>
  805332:	48 63 d0             	movsxd rdx,eax
  805335:	48 89 d0             	mov    rax,rdx
  805338:	48 01 c0             	add    rax,rax
  80533b:	48 01 d0             	add    rax,rdx
  80533e:	48 c1 e0 08          	shl    rax,0x8
  805342:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805348:	48 89 c7             	mov    rdi,rax
  80534b:	e8 1a 00 00 00       	call   80536a <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  805350:	8b 05 b6 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1b6]        # 41450c <cur_proc>
  805356:	89 c7                	mov    edi,eax
  805358:	e8 30 f3 ff ff       	call   80468d <del_proc>
    switch_proc_tss(0);
  80535d:	bf 00 00 00 00       	mov    edi,0x0
  805362:	e8 56 ee ff ff       	call   8041bd <switch_proc_tss>
}
  805367:	90                   	nop
  805368:	5d                   	pop    rbp
  805369:	c3                   	ret    

000000000080536a <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  80536a:	f3 0f 1e fa          	endbr64 
  80536e:	55                   	push   rbp
  80536f:	48 89 e5             	mov    rbp,rsp
  805372:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805379:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  805380:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805387:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  80538e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  805392:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805396:	8b 00                	mov    eax,DWORD PTR [rax]
  805398:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  80539b:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8053a2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053a5:	ba 44 00 00 00       	mov    edx,0x44
  8053aa:	48 89 ce             	mov    rsi,rcx
  8053ad:	89 c7                	mov    edi,eax
  8053af:	e8 fd cd ff ff       	call   8021b1 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  8053b4:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  8053bb:	89 c1                	mov    ecx,eax
  8053bd:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053c0:	ba 00 00 00 00       	mov    edx,0x0
  8053c5:	89 ce                	mov    esi,ecx
  8053c7:	89 c7                	mov    edi,eax
  8053c9:	e8 74 ce ff ff       	call   802242 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  8053ce:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  8053d5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053d8:	ba f8 00 00 00       	mov    edx,0xf8
  8053dd:	48 89 ce             	mov    rsi,rcx
  8053e0:	89 c7                	mov    edi,eax
  8053e2:	e8 ca cd ff ff       	call   8021b1 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  8053e7:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  8053ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  8053f0:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  8053f6:	c1 e8 0c             	shr    eax,0xc
  8053f9:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  8053fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053ff:	c1 e8 16             	shr    eax,0x16
  805402:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  805405:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805408:	25 ff ff 3f 00       	and    eax,0x3fffff
  80540d:	c1 e8 0c             	shr    eax,0xc
  805410:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  805413:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80541a:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  805421:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805424:	48 98                	cdqe   
  805426:	48 c1 e0 03          	shl    rax,0x3
  80542a:	48 01 d0             	add    rax,rdx
  80542d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805430:	25 00 f0 ff ff       	and    eax,0xfffff000
  805435:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805439:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805440:	eb 48                	jmp    80548a <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805442:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805445:	99                   	cdq    
  805446:	c1 ea 16             	shr    edx,0x16
  805449:	01 d0                	add    eax,edx
  80544b:	25 ff 03 00 00       	and    eax,0x3ff
  805450:	29 d0                	sub    eax,edx
  805452:	89 c2                	mov    edx,eax
  805454:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805457:	01 d0                	add    eax,edx
  805459:	48 98                	cdqe   
  80545b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805462:	00 
  805463:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805467:	48 01 d0             	add    rax,rdx
  80546a:	8b 00                	mov    eax,DWORD PTR [rax]
  80546c:	83 e0 01             	and    eax,0x1
  80546f:	85 c0                	test   eax,eax
  805471:	74 13                	je     805486 <load_pe+0x11c>
  805473:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  805478:	74 0c                	je     805486 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  80547a:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  805481:	e9 76 ff ff ff       	jmp    8053fc <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  805486:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80548a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80548d:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  805490:	7c b0                	jl     805442 <load_pe+0xd8>
            }
        }
        break;
  805492:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  805493:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805496:	ba 00 00 00 00       	mov    edx,0x0
  80549b:	be 00 00 00 00       	mov    esi,0x0
  8054a0:	89 c7                	mov    edi,eax
  8054a2:	e8 9b cd ff ff       	call   802242 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8054a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054aa:	48 89 c1             	mov    rcx,rax
  8054ad:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8054b0:	ba 00 10 00 00       	mov    edx,0x1000
  8054b5:	48 89 ce             	mov    rsi,rcx
  8054b8:	89 c7                	mov    edi,eax
  8054ba:	e8 f2 cc ff ff       	call   8021b1 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8054bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054c2:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  8054c9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8054cc:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8054d3:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8054d7:	48 01 d0             	add    rax,rdx
  8054da:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8054e1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054e8:	48 83 c0 04          	add    rax,0x4
  8054ec:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8054f3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054fa:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8054fd:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  805503:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805509:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80550f:	85 c0                	test   eax,eax
  805511:	0f 48 c2             	cmovs  eax,edx
  805514:	c1 f8 0c             	sar    eax,0xc
  805517:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80551d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805524:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805527:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80552a:	01 d0                	add    eax,edx
  80552c:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805532:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805538:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  80553e:	85 c0                	test   eax,eax
  805540:	0f 48 c2             	cmovs  eax,edx
  805543:	c1 f8 0a             	sar    eax,0xa
  805546:	89 c1                	mov    ecx,eax
  805548:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80554e:	99                   	cdq    
  80554f:	c1 ea 16             	shr    edx,0x16
  805552:	01 d0                	add    eax,edx
  805554:	25 ff 03 00 00       	and    eax,0x3ff
  805559:	29 d0                	sub    eax,edx
  80555b:	01 c8                	add    eax,ecx
  80555d:	85 c0                	test   eax,eax
  80555f:	0f 95 c0             	setne  al
  805562:	0f b6 c0             	movzx  eax,al
  805565:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80556b:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805571:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  805577:	85 c0                	test   eax,eax
  805579:	0f 48 c2             	cmovs  eax,edx
  80557c:	c1 f8 16             	sar    eax,0x16
  80557f:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  805585:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80558c:	89 c0                	mov    eax,eax
  80558e:	48 05 f8 00 00 00    	add    rax,0xf8
  805594:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805598:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80559f:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8055a3:	0f b7 d0             	movzx  edx,ax
  8055a6:	89 d0                	mov    eax,edx
  8055a8:	c1 e0 02             	shl    eax,0x2
  8055ab:	01 d0                	add    eax,edx
  8055ad:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8055b0:	05 3c 01 00 00       	add    eax,0x13c
  8055b5:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8055bb:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055c2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8055c5:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8055cb:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055d1:	99                   	cdq    
  8055d2:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8055d8:	89 d0                	mov    eax,edx
  8055da:	85 c0                	test   eax,eax
  8055dc:	74 23                	je     805601 <load_pe+0x297>
  8055de:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055e4:	99                   	cdq    
  8055e5:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8055eb:	89 d1                	mov    ecx,edx
  8055ed:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055f3:	29 c8                	sub    eax,ecx
  8055f5:	89 c2                	mov    edx,eax
  8055f7:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  8055fd:	01 d0                	add    eax,edx
  8055ff:	eb 06                	jmp    805607 <load_pe+0x29d>
  805601:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805607:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80560d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805614:	eb 68                	jmp    80567e <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805616:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80561a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80561d:	25 00 00 00 02       	and    eax,0x2000000
  805622:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805628:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80562f:	75 43                	jne    805674 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805631:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805635:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805638:	89 c1                	mov    ecx,eax
  80563a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80563d:	ba 00 00 00 00       	mov    edx,0x0
  805642:	89 ce                	mov    esi,ecx
  805644:	89 c7                	mov    edi,eax
  805646:	e8 f7 cb ff ff       	call   802242 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80564b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80564f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805652:	89 c2                	mov    edx,eax
  805654:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805658:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80565b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80565e:	01 c8                	add    eax,ecx
  805660:	89 c0                	mov    eax,eax
  805662:	48 89 c1             	mov    rcx,rax
  805665:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805668:	48 89 ce             	mov    rsi,rcx
  80566b:	89 c7                	mov    edi,eax
  80566d:	e8 3f cb ff ff       	call   8021b1 <sys_read>
  805672:	eb 01                	jmp    805675 <load_pe+0x30b>
            continue;
  805674:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805675:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805679:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80567e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805685:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805689:	0f b7 c0             	movzx  eax,ax
  80568c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80568f:	7c 85                	jl     805616 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805691:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805698:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  80569c:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8056a3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8056aa:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8056ad:	85 c0                	test   eax,eax
  8056af:	0f 84 71 02 00 00    	je     805926 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8056b5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8056bc:	8b 10                	mov    edx,DWORD PTR [rax]
  8056be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056c1:	01 d0                	add    eax,edx
  8056c3:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8056c9:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8056cf:	48 98                	cdqe   
  8056d1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8056d5:	e9 3e 02 00 00       	jmp    805918 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8056da:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8056de:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  8056e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056e4:	01 d0                	add    eax,edx
  8056e6:	89 c0                	mov    eax,eax
  8056e8:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8056ef:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  8056f6:	be c8 1f 81 00       	mov    esi,0x811fc8
  8056fb:	48 89 c7             	mov    rdi,rax
  8056fe:	e8 01 46 00 00       	call   809d04 <strcmp>
  805703:	85 c0                	test   eax,eax
  805705:	75 09                	jne    805710 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  805707:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80570e:	eb 25                	jmp    805735 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805710:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805717:	48 89 c7             	mov    rdi,rax
  80571a:	e8 4b fc ff ff       	call   80536a <load_pe>
  80571f:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805725:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80572b:	89 c7                	mov    edi,eax
  80572d:	e8 e4 03 00 00       	call   805b16 <get_module_addr>
  805732:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805735:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805738:	48 98                	cdqe   
  80573a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805741:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805744:	48 63 d0             	movsxd rdx,eax
  805747:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80574e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805752:	48 01 d0             	add    rax,rdx
  805755:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80575c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805763:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805766:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805769:	01 d0                	add    eax,edx
  80576b:	89 c0                	mov    eax,eax
  80576d:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  805774:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80577b:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80577e:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805784:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80578b:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  80578e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805791:	01 d0                	add    eax,edx
  805793:	89 c0                	mov    eax,eax
  805795:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  80579c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057a3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8057a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057a9:	01 d0                	add    eax,edx
  8057ab:	89 c0                	mov    eax,eax
  8057ad:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8057b4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057bb:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8057be:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057c1:	01 d0                	add    eax,edx
  8057c3:	89 c0                	mov    eax,eax
  8057c5:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8057cc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057d3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8057d6:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8057dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057e0:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8057e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057e6:	01 d0                	add    eax,edx
  8057e8:	89 c0                	mov    eax,eax
  8057ea:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8057ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057f2:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8057f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057f8:	01 d0                	add    eax,edx
  8057fa:	89 c0                	mov    eax,eax
  8057fc:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805800:	e9 00 01 00 00       	jmp    805905 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805805:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805809:	8b 00                	mov    eax,DWORD PTR [rax]
  80580b:	85 c0                	test   eax,eax
  80580d:	79 43                	jns    805852 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80580f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805813:	8b 00                	mov    eax,DWORD PTR [rax]
  805815:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80581a:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805820:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805826:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80582c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805833:	00 
  805834:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80583b:	48 01 d0             	add    rax,rdx
  80583e:	8b 10                	mov    edx,DWORD PTR [rax]
  805840:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805843:	01 d0                	add    eax,edx
  805845:	89 c2                	mov    edx,eax
  805847:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80584b:	89 10                	mov    DWORD PTR [rax],edx
  80584d:	e9 a9 00 00 00       	jmp    8058fb <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805852:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805856:	8b 00                	mov    eax,DWORD PTR [rax]
  805858:	89 c0                	mov    eax,eax
  80585a:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805861:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805868:	02 
                    int i=0;
  805869:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805870:	eb 7a                	jmp    8058ec <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805872:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805875:	48 98                	cdqe   
  805877:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80587e:	00 
  80587f:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805886:	48 01 d0             	add    rax,rdx
  805889:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80588c:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805893:	48 89 d6             	mov    rsi,rdx
  805896:	48 89 c7             	mov    rdi,rax
  805899:	e8 66 44 00 00       	call   809d04 <strcmp>
  80589e:	85 c0                	test   eax,eax
  8058a0:	75 46                	jne    8058e8 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  8058a2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8058a5:	48 98                	cdqe   
  8058a7:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8058ab:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8058b2:	48 01 d0             	add    rax,rdx
  8058b5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058b8:	98                   	cwde   
  8058b9:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8058bf:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8058c5:	48 98                	cdqe   
  8058c7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8058ce:	00 
  8058cf:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8058d6:	48 01 d0             	add    rax,rdx
  8058d9:	8b 10                	mov    edx,DWORD PTR [rax]
  8058db:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8058de:	01 d0                	add    eax,edx
  8058e0:	89 c2                	mov    edx,eax
  8058e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058e6:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8058e8:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8058ec:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8058ef:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  8058f5:	0f 8c 77 ff ff ff    	jl     805872 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  8058fb:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805900:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805905:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805909:	8b 00                	mov    eax,DWORD PTR [rax]
  80590b:	85 c0                	test   eax,eax
  80590d:	0f 85 f2 fe ff ff    	jne    805805 <load_pe+0x49b>
            }
            impdes++;
  805913:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805918:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80591c:	8b 00                	mov    eax,DWORD PTR [rax]
  80591e:	85 c0                	test   eax,eax
  805920:	0f 85 b4 fd ff ff    	jne    8056da <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805926:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80592d:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80592e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805935:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80593b:	85 c0                	test   eax,eax
  80593d:	0f 84 e8 00 00 00    	je     805a2b <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805943:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80594a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805953:	01 d0                	add    eax,edx
  805955:	89 c0                	mov    eax,eax
  805957:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80595b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80595f:	48 83 c0 40          	add    rax,0x40
  805963:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805967:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80596b:	48 83 c0 02          	add    rax,0x2
  80596f:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805973:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80597a:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  80597d:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805983:	e9 95 00 00 00       	jmp    805a1d <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  805988:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80598c:	8b 10                	mov    edx,DWORD PTR [rax]
  80598e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805991:	01 d0                	add    eax,edx
  805993:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805999:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8059a0:	eb 59                	jmp    8059fb <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8059a2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8059a6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8059a9:	66 85 c0             	test   ax,ax
  8059ac:	74 48                	je     8059f6 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8059ae:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8059b2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8059b5:	0f b7 d0             	movzx  edx,ax
  8059b8:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8059be:	01 d0                	add    eax,edx
  8059c0:	48 98                	cdqe   
  8059c2:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8059c9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8059d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8059d2:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  8059d8:	89 c2                	mov    edx,eax
  8059da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059dd:	01 d0                	add    eax,edx
  8059df:	89 c2                	mov    edx,eax
  8059e1:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8059e8:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8059ea:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8059ef:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8059f4:	eb 01                	jmp    8059f7 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8059f6:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8059f7:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8059fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8059ff:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805a02:	c1 e8 02             	shr    eax,0x2
  805a05:	89 c2                	mov    edx,eax
  805a07:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805a0a:	39 c2                	cmp    edx,eax
  805a0c:	77 94                	ja     8059a2 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  805a0e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805a12:	05 00 10 00 00       	add    eax,0x1000
  805a17:	48 98                	cdqe   
  805a19:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805a1d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805a21:	8b 00                	mov    eax,DWORD PTR [rax]
  805a23:	85 c0                	test   eax,eax
  805a25:	0f 85 5d ff ff ff    	jne    805988 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805a2b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805a32:	00 00 00 
  805a35:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805a3c:	00 00 00 
  805a3f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805a46:	00 00 00 00 
  805a4a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805a51:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805a55:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805a5c:	ba 18 00 00 00       	mov    edx,0x18
  805a61:	48 89 c6             	mov    rsi,rax
  805a64:	bf 00 00 00 01       	mov    edi,0x1000000
  805a69:	e8 f8 3f 00 00       	call   809a66 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805a6e:	8b 05 98 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea98]        # 41450c <cur_proc>
  805a74:	48 63 d0             	movsxd rdx,eax
  805a77:	48 89 d0             	mov    rax,rdx
  805a7a:	48 01 c0             	add    rax,rax
  805a7d:	48 01 d0             	add    rax,rdx
  805a80:	48 c1 e0 08          	shl    rax,0x8
  805a84:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a8a:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805a91:	8b 05 75 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea75]        # 41450c <cur_proc>
  805a97:	48 63 d0             	movsxd rdx,eax
  805a9a:	48 89 d0             	mov    rax,rdx
  805a9d:	48 01 c0             	add    rax,rax
  805aa0:	48 01 d0             	add    rax,rdx
  805aa3:	48 c1 e0 08          	shl    rax,0x8
  805aa7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805aad:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805ab4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805aba:	48 98                	cdqe   
  805abc:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805ac3:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805aca:	be 00 00 00 00       	mov    esi,0x0
  805acf:	bf 00 00 00 00       	mov    edi,0x0
  805ad4:	ff d0                	call   rax
  805ad6:	8b 15 30 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ea30]        # 41450c <cur_proc>
  805adc:	89 c1                	mov    ecx,eax
  805ade:	48 63 d2             	movsxd rdx,edx
  805ae1:	48 89 d0             	mov    rax,rdx
  805ae4:	48 01 c0             	add    rax,rax
  805ae7:	48 01 d0             	add    rax,rdx
  805aea:	48 c1 e0 08          	shl    rax,0x8
  805aee:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805af4:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805af6:	8b 05 10 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea10]        # 41450c <cur_proc>
  805afc:	48 63 d0             	movsxd rdx,eax
  805aff:	48 89 d0             	mov    rax,rdx
  805b02:	48 01 c0             	add    rax,rax
  805b05:	48 01 d0             	add    rax,rdx
  805b08:	48 c1 e0 08          	shl    rax,0x8
  805b0c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805b12:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805b14:	c9                   	leave  
  805b15:	c3                   	ret    

0000000000805b16 <get_module_addr>:

int get_module_addr(int mi)
{
  805b16:	f3 0f 1e fa          	endbr64 
  805b1a:	55                   	push   rbp
  805b1b:	48 89 e5             	mov    rbp,rsp
  805b1e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805b21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b24:	48 98                	cdqe   
  805b26:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805b2d:	5d                   	pop    rbp
  805b2e:	c3                   	ret    

0000000000805b2f <dispose_library>:
int dispose_library(int dlln)
{
  805b2f:	f3 0f 1e fa          	endbr64 
  805b33:	55                   	push   rbp
  805b34:	48 89 e5             	mov    rbp,rsp
  805b37:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805b3a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805b3e:	78 09                	js     805b49 <dispose_library+0x1a>
  805b40:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805b47:	7e 07                	jle    805b50 <dispose_library+0x21>
  805b49:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805b4e:	eb 1d                	jmp    805b6d <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805b50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b53:	48 98                	cdqe   
  805b55:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805b5c:	48 05 28 45 41 00    	add    rax,0x414528
  805b62:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805b68:	b8 00 00 00 00       	mov    eax,0x0
}
  805b6d:	5d                   	pop    rbp
  805b6e:	c3                   	ret    

0000000000805b6f <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805b6f:	f3 0f 1e fa          	endbr64 
  805b73:	55                   	push   rbp
  805b74:	48 89 e5             	mov    rbp,rsp
  805b77:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805b7b:	90                   	nop
  805b7c:	5d                   	pop    rbp
  805b7d:	c3                   	ret    

0000000000805b7e <sys_rmmod>:
int sys_rmmod(char *name)
{
  805b7e:	f3 0f 1e fa          	endbr64 
  805b82:	55                   	push   rbp
  805b83:	48 89 e5             	mov    rbp,rsp
  805b86:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805b8a:	90                   	nop
  805b8b:	5d                   	pop    rbp
  805b8c:	c3                   	ret    
  805b8d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805b90 <_syscall>:
  805b90:	57                   	push   rdi
  805b91:	56                   	push   rsi
  805b92:	52                   	push   rdx
  805b93:	51                   	push   rcx
  805b94:	53                   	push   rbx
  805b95:	50                   	push   rax
  805b96:	e8 d3 a9 ff ff       	call   80056e <syscall>
  805b9b:	48 83 c4 18          	add    rsp,0x18
  805b9f:	cf                   	iret   

0000000000805ba0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805ba0:	f3 0f 1e fa          	endbr64 
  805ba4:	55                   	push   rbp
  805ba5:	48 89 e5             	mov    rbp,rsp
  805ba8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805bac:	8b 05 82 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21982]        # 427534 <framebuffer+0x14>
  805bb2:	89 c0                	mov    eax,eax
  805bb4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805bb8:	8b 05 7a 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2197a]        # 427538 <framebuffer+0x18>
  805bbe:	89 c0                	mov    eax,eax
  805bc0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805bc4:	0f b6 05 71 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21971]        # 42753c <framebuffer+0x1c>
  805bcb:	c0 e8 03             	shr    al,0x3
  805bce:	0f b6 c0             	movzx  eax,al
  805bd1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805bd5:	8b 05 55 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21955]        # 427530 <framebuffer+0x10>
  805bdb:	89 c0                	mov    eax,eax
  805bdd:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805be1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805be5:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805bea:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805bee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805bf2:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805bf7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805bfb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805bff:	48 c1 e8 0c          	shr    rax,0xc
  805c03:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805c06:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805c0d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805c0e:	48 8b 05 13 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21913]        # 427528 <framebuffer+0x8>
  805c15:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805c19:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805c20:	00 
  805c21:	eb 2d                	jmp    805c50 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805c23:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805c27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c2b:	ba 07 00 00 00       	mov    edx,0x7
  805c30:	48 89 ce             	mov    rsi,rcx
  805c33:	48 89 c7             	mov    rdi,rax
  805c36:	e8 6b b2 ff ff       	call   800ea6 <mmap>
        pp+=PAGE_SIZE;
  805c3b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805c42:	00 
        p+=PAGE_SIZE;
  805c43:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805c4a:	00 
    for (size_t i = 0; i < pgc; i++)
  805c4b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805c50:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805c53:	48 98                	cdqe   
  805c55:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805c59:	72 c8                	jb     805c23 <init_framebuffer+0x83>
    }
    
    
}
  805c5b:	90                   	nop
  805c5c:	90                   	nop
  805c5d:	c9                   	leave  
  805c5e:	c3                   	ret    

0000000000805c5f <init_font>:
void init_font(){
  805c5f:	f3 0f 1e fa          	endbr64 
  805c63:	55                   	push   rbp
  805c64:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805c67:	48 c7 05 ee 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218ee],0x80a668        # 427560 <boot_font>
  805c6e:	68 a6 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805c72:	48 8b 05 e7 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218e7]        # 427560 <boot_font>
  805c79:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805c7c:	83 c0 07             	add    eax,0x7
  805c7f:	c1 e8 03             	shr    eax,0x3
  805c82:	89 05 e8 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218e8],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805c88:	8b 05 e2 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218e2]        # 427570 <font_width_bytes>
  805c8e:	c1 e0 03             	shl    eax,0x3
  805c91:	89 05 d1 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218d1],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805c97:	48 8b 05 c2 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218c2]        # 427560 <boot_font>
  805c9e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805ca1:	89 05 c5 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218c5],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805ca7:	48 8b 05 b2 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218b2]        # 427560 <boot_font>
  805cae:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805cb1:	89 c0                	mov    eax,eax
  805cb3:	48 05 68 a6 80 00    	add    rax,0x80a668
  805cb9:	48 89 05 b8 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218b8],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805cc0:	48 8b 05 99 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21899]        # 427560 <boot_font>
  805cc7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805cca:	89 05 b4 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218b4],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805cd0:	48 8b 05 89 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21889]        # 427560 <boot_font>
  805cd7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805cda:	89 05 a0 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218a0],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805ce0:	c7 05 66 18 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21866],0x0        # 427550 <fb_cursor_y>
  805ce7:	00 00 00 
  805cea:	8b 05 60 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21860]        # 427550 <fb_cursor_y>
  805cf0:	89 05 56 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21856],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805cf6:	8b 15 38 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21838]        # 427534 <framebuffer+0x14>
  805cfc:	0f b6 05 39 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21839]        # 42753c <framebuffer+0x1c>
  805d03:	0f b6 c0             	movzx  eax,al
  805d06:	0f af c2             	imul   eax,edx
  805d09:	c1 e8 03             	shr    eax,0x3
  805d0c:	8b 0d 56 18 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21856]        # 427568 <font_width>
  805d12:	ba 00 00 00 00       	mov    edx,0x0
  805d17:	f7 f1                	div    ecx
  805d19:	89 05 35 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21835],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805d1f:	8b 15 13 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21813]        # 427538 <framebuffer+0x18>
  805d25:	0f b6 05 10 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21810]        # 42753c <framebuffer+0x1c>
  805d2c:	0f b6 c0             	movzx  eax,al
  805d2f:	0f af c2             	imul   eax,edx
  805d32:	c1 e8 03             	shr    eax,0x3
  805d35:	8b 35 31 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21831]        # 42756c <font_height>
  805d3b:	ba 00 00 00 00       	mov    edx,0x0
  805d40:	f7 f6                	div    esi
  805d42:	89 05 10 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21810],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805d48:	c7 05 5e 47 00 00 01 	mov    DWORD PTR [rip+0x475e],0x1        # 80a4b0 <font_size>
  805d4f:	00 00 00 
}
  805d52:	90                   	nop
  805d53:	5d                   	pop    rbp
  805d54:	c3                   	ret    

0000000000805d55 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805d55:	f3 0f 1e fa          	endbr64 
  805d59:	55                   	push   rbp
  805d5a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805d5d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805d61:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805d65:	48 89 05 b4 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217b4],rax        # 427520 <framebuffer>
  805d6c:	48 89 15 b5 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217b5],rdx        # 427528 <framebuffer+0x8>
  805d73:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805d77:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805d7b:	48 89 05 ae 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217ae],rax        # 427530 <framebuffer+0x10>
  805d82:	48 89 15 af 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217af],rdx        # 427538 <framebuffer+0x18>
  805d89:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805d8d:	48 89 05 ac 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217ac],rax        # 427540 <framebuffer+0x20>
}
  805d94:	90                   	nop
  805d95:	5d                   	pop    rbp
  805d96:	c3                   	ret    

0000000000805d97 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805d97:	f3 0f 1e fa          	endbr64 
  805d9b:	55                   	push   rbp
  805d9c:	48 89 e5             	mov    rbp,rsp
  805d9f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805da2:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805da5:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805da8:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805dab:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805daf:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805db6:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805db7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805dba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805dbd:	eb 64                	jmp    805e23 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  805dbf:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805dc2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805dc5:	eb 4b                	jmp    805e12 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805dc7:	8b 15 63 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21763]        # 427530 <framebuffer+0x10>
  805dcd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dd0:	0f af c2             	imul   eax,edx
  805dd3:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805dd5:	0f b6 05 60 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21760]        # 42753c <framebuffer+0x1c>
  805ddc:	0f b6 c0             	movzx  eax,al
  805ddf:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805de3:	8d 50 07             	lea    edx,[rax+0x7]
  805de6:	85 c0                	test   eax,eax
  805de8:	0f 48 c2             	cmovs  eax,edx
  805deb:	c1 f8 03             	sar    eax,0x3
  805dee:	48 98                	cdqe   
  805df0:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805df3:	48 05 00 00 00 40    	add    rax,0x40000000
  805df9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805dfd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e01:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805e05:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e09:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805e0c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805e0e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805e12:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805e15:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805e18:	01 d0                	add    eax,edx
  805e1a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805e1d:	7c a8                	jl     805dc7 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  805e1f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805e23:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805e26:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805e29:	01 d0                	add    eax,edx
  805e2b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805e2e:	7c 8f                	jl     805dbf <fill_rect+0x28>
        }
    }
}
  805e30:	90                   	nop
  805e31:	90                   	nop
  805e32:	5d                   	pop    rbp
  805e33:	c3                   	ret    

0000000000805e34 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805e34:	f3 0f 1e fa          	endbr64 
  805e38:	55                   	push   rbp
  805e39:	48 89 e5             	mov    rbp,rsp
  805e3c:	48 83 ec 30          	sub    rsp,0x30
  805e40:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805e43:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805e46:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805e49:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805e4d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e50:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805e53:	eb 5a                	jmp    805eaf <draw_text+0x7b>
    {
        if(*str=='\n')
  805e55:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e5c:	3c 0a                	cmp    al,0xa
  805e5e:	75 1c                	jne    805e7c <draw_text+0x48>
        {
            y+=font_height*size;
  805e60:	8b 15 06 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21706]        # 42756c <font_height>
  805e66:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805e69:	0f af d0             	imul   edx,eax
  805e6c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805e6f:	01 d0                	add    eax,edx
  805e71:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805e74:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e77:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e7a:	eb 2e                	jmp    805eaa <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805e7c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e83:	0f be c8             	movsx  ecx,al
  805e86:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805e89:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805e8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e8f:	89 c7                	mov    edi,eax
  805e91:	e8 28 00 00 00       	call   805ebe <draw_letter>
            tx+=size*font_width;
  805e96:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805e99:	8b 05 c9 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc216c9]        # 427568 <font_width>
  805e9f:	0f af d0             	imul   edx,eax
  805ea2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ea5:	01 d0                	add    eax,edx
  805ea7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805eaa:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805eaf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805eb3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805eb6:	84 c0                	test   al,al
  805eb8:	75 9b                	jne    805e55 <draw_text+0x21>
    }
}
  805eba:	90                   	nop
  805ebb:	90                   	nop
  805ebc:	c9                   	leave  
  805ebd:	c3                   	ret    

0000000000805ebe <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805ebe:	f3 0f 1e fa          	endbr64 
  805ec2:	55                   	push   rbp
  805ec3:	48 89 e5             	mov    rbp,rsp
  805ec6:	48 83 ec 30          	sub    rsp,0x30
  805eca:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805ecd:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805ed0:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805ed3:	89 c8                	mov    eax,ecx
  805ed5:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805ed8:	48 8b 05 99 16 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21699]        # 427578 <glyph_table>
  805edf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805ee3:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805ee7:	8b 05 97 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21697]        # 427584 <glyph_nr>
  805eed:	39 c2                	cmp    edx,eax
  805eef:	73 13                	jae    805f04 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805ef1:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805ef5:	8b 05 85 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21685]        # 427580 <bytes_per_glyph>
  805efb:	0f af c2             	imul   eax,edx
  805efe:	89 c0                	mov    eax,eax
  805f00:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f04:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805f0b:	e9 c9 00 00 00       	jmp    805fd9 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805f10:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805f14:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805f1b:	e9 9a 00 00 00       	jmp    805fba <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805f20:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805f23:	c1 e8 03             	shr    eax,0x3
  805f26:	89 c2                	mov    edx,eax
  805f28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f2c:	48 01 d0             	add    rax,rdx
  805f2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805f32:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805f35:	84 c0                	test   al,al
  805f37:	74 37                	je     805f70 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805f39:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f3c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f40:	89 c2                	mov    edx,eax
  805f42:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f45:	01 d0                	add    eax,edx
  805f47:	89 c6                	mov    esi,eax
  805f49:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f4c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805f50:	89 c2                	mov    edx,eax
  805f52:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805f55:	01 d0                	add    eax,edx
  805f57:	89 c7                	mov    edi,eax
  805f59:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805f5c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f5f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805f65:	89 d1                	mov    ecx,edx
  805f67:	89 c2                	mov    edx,eax
  805f69:	e8 29 fe ff ff       	call   805d97 <fill_rect>
  805f6e:	eb 35                	jmp    805fa5 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805f70:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f73:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f77:	89 c2                	mov    edx,eax
  805f79:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f7c:	01 d0                	add    eax,edx
  805f7e:	89 c6                	mov    esi,eax
  805f80:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f83:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805f87:	89 c2                	mov    edx,eax
  805f89:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805f8c:	01 d0                	add    eax,edx
  805f8e:	89 c7                	mov    edi,eax
  805f90:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805f93:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f96:	41 b8 00 00 00 00    	mov    r8d,0x0
  805f9c:	89 d1                	mov    ecx,edx
  805f9e:	89 c2                	mov    edx,eax
  805fa0:	e8 f2 fd ff ff       	call   805d97 <fill_rect>
            }

            mask >>= 1;
  805fa5:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805fa8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805fab:	83 e0 07             	and    eax,0x7
  805fae:	85 c0                	test   eax,eax
  805fb0:	75 04                	jne    805fb6 <draw_letter+0xf8>
                mask = 1 << 7;
  805fb2:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805fb6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805fba:	8b 05 a8 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215a8]        # 427568 <font_width>
  805fc0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805fc3:	0f 82 57 ff ff ff    	jb     805f20 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805fc9:	8b 05 a1 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215a1]        # 427570 <font_width_bytes>
  805fcf:	89 c0                	mov    eax,eax
  805fd1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805fd5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805fd9:	8b 05 8d 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2158d]        # 42756c <font_height>
  805fdf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805fe2:	0f 82 28 ff ff ff    	jb     805f10 <draw_letter+0x52>
    }
}
  805fe8:	90                   	nop
  805fe9:	90                   	nop
  805fea:	c9                   	leave  
  805feb:	c3                   	ret    

0000000000805fec <scr_up>:
//向上滚动一个像素
void scr_up(){
  805fec:	f3 0f 1e fa          	endbr64 
  805ff0:	55                   	push   rbp
  805ff1:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805ff4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805ffb:	eb 6c                	jmp    806069 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805ffd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806004:	eb 52                	jmp    806058 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806006:	8b 15 24 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21524]        # 427530 <framebuffer+0x10>
  80600c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80600f:	0f af c2             	imul   eax,edx
  806012:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806014:	0f b6 05 21 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21521]        # 42753c <framebuffer+0x1c>
  80601b:	0f b6 c0             	movzx  eax,al
  80601e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806022:	8d 50 07             	lea    edx,[rax+0x7]
  806025:	85 c0                	test   eax,eax
  806027:	0f 48 c2             	cmovs  eax,edx
  80602a:	c1 f8 03             	sar    eax,0x3
  80602d:	48 98                	cdqe   
  80602f:	48 01 c8             	add    rax,rcx
  806032:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806038:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  80603c:	8b 05 ee 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214ee]        # 427530 <framebuffer+0x10>
  806042:	89 c2                	mov    edx,eax
  806044:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806048:	48 01 d0             	add    rax,rdx
  80604b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80604e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806052:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806054:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806058:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80605b:	8b 05 f3 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214f3]        # 427554 <max_ch_nr_x>
  806061:	39 c2                	cmp    edx,eax
  806063:	72 a1                	jb     806006 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  806065:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806069:	8b 05 e9 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214e9]        # 427558 <max_ch_nr_y>
  80606f:	8d 50 ff             	lea    edx,[rax-0x1]
  806072:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806075:	39 c2                	cmp    edx,eax
  806077:	77 84                	ja     805ffd <scr_up+0x11>
        }

    }
}
  806079:	90                   	nop
  80607a:	90                   	nop
  80607b:	5d                   	pop    rbp
  80607c:	c3                   	ret    

000000000080607d <scr_down>:
void scr_down(){
  80607d:	f3 0f 1e fa          	endbr64 
  806081:	55                   	push   rbp
  806082:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806085:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  80608c:	eb 72                	jmp    806100 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80608e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806095:	eb 58                	jmp    8060ef <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806097:	8b 15 93 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21493]        # 427530 <framebuffer+0x10>
  80609d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060a0:	0f af c2             	imul   eax,edx
  8060a3:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8060a5:	0f b6 05 90 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21490]        # 42753c <framebuffer+0x1c>
  8060ac:	0f b6 c0             	movzx  eax,al
  8060af:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8060b3:	8d 50 07             	lea    edx,[rax+0x7]
  8060b6:	85 c0                	test   eax,eax
  8060b8:	0f 48 c2             	cmovs  eax,edx
  8060bb:	c1 f8 03             	sar    eax,0x3
  8060be:	48 98                	cdqe   
  8060c0:	48 01 c8             	add    rax,rcx
  8060c3:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8060c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  8060cd:	8b 05 5d 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2145d]        # 427530 <framebuffer+0x10>
  8060d3:	89 c0                	mov    eax,eax
  8060d5:	48 f7 d8             	neg    rax
  8060d8:	48 89 c2             	mov    rdx,rax
  8060db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8060df:	48 01 d0             	add    rax,rdx
  8060e2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8060e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8060e9:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8060eb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8060ef:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8060f2:	8b 05 5c 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2145c]        # 427554 <max_ch_nr_x>
  8060f8:	39 c2                	cmp    edx,eax
  8060fa:	72 9b                	jb     806097 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8060fc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806100:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806103:	8b 05 4f 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2144f]        # 427558 <max_ch_nr_y>
  806109:	39 c2                	cmp    edx,eax
  80610b:	72 81                	jb     80608e <scr_down+0x11>
        }

    }
}
  80610d:	90                   	nop
  80610e:	90                   	nop
  80610f:	5d                   	pop    rbp
  806110:	c3                   	ret    

0000000000806111 <print>:
void print(char* s){
  806111:	f3 0f 1e fa          	endbr64 
  806115:	55                   	push   rbp
  806116:	48 89 e5             	mov    rbp,rsp
  806119:	48 83 ec 18          	sub    rsp,0x18
  80611d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  806121:	e9 f7 00 00 00       	jmp    80621d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806126:	8b 15 20 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21420]        # 42754c <fb_cursor_x>
  80612c:	8b 05 22 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21422]        # 427554 <max_ch_nr_x>
  806132:	39 c2                	cmp    edx,eax
  806134:	77 0b                	ja     806141 <print+0x30>
  806136:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80613a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80613d:	3c 0a                	cmp    al,0xa
  80613f:	75 19                	jne    80615a <print+0x49>
        {
            fb_cursor_y+=1;
  806141:	8b 05 09 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21409]        # 427550 <fb_cursor_y>
  806147:	83 c0 01             	add    eax,0x1
  80614a:	89 05 00 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21400],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  806150:	c7 05 f2 13 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc213f2],0x0        # 42754c <fb_cursor_x>
  806157:	00 00 00 
        }
        if(*s=='\n')continue;
  80615a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80615e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806161:	3c 0a                	cmp    al,0xa
  806163:	0f 84 ae 00 00 00    	je     806217 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  806169:	8b 15 e1 13 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc213e1]        # 427550 <fb_cursor_y>
  80616f:	8b 05 e3 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213e3]        # 427558 <max_ch_nr_y>
  806175:	39 c2                	cmp    edx,eax
  806177:	72 3c                	jb     8061b5 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  806179:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806180:	eb 0e                	jmp    806190 <print+0x7f>
                scr_up();
  806182:	b8 00 00 00 00       	mov    eax,0x0
  806187:	e8 60 fe ff ff       	call   805fec <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  80618c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806190:	8b 05 d6 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213d6]        # 42756c <font_height>
  806196:	8b 15 14 43 00 00    	mov    edx,DWORD PTR [rip+0x4314]        # 80a4b0 <font_size>
  80619c:	0f af d0             	imul   edx,eax
  80619f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061a2:	39 c2                	cmp    edx,eax
  8061a4:	77 dc                	ja     806182 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  8061a6:	8b 05 ac 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213ac]        # 427558 <max_ch_nr_y>
  8061ac:	83 e8 01             	sub    eax,0x1
  8061af:	89 05 9b 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2139b],eax        # 427550 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8061b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8061b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061bc:	0f be d0             	movsx  edx,al
  8061bf:	8b 05 eb 42 00 00    	mov    eax,DWORD PTR [rip+0x42eb]        # 80a4b0 <font_size>
  8061c5:	8b 35 85 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21385]        # 427550 <fb_cursor_y>
  8061cb:	8b 0d 9b 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2139b]        # 42756c <font_height>
  8061d1:	0f af ce             	imul   ecx,esi
  8061d4:	8b 35 d6 42 00 00    	mov    esi,DWORD PTR [rip+0x42d6]        # 80a4b0 <font_size>
  8061da:	0f af ce             	imul   ecx,esi
  8061dd:	41 89 c8             	mov    r8d,ecx
  8061e0:	8b 35 66 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21366]        # 42754c <fb_cursor_x>
  8061e6:	8b 0d 7c 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2137c]        # 427568 <font_width>
  8061ec:	0f af ce             	imul   ecx,esi
  8061ef:	8b 35 bb 42 00 00    	mov    esi,DWORD PTR [rip+0x42bb]        # 80a4b0 <font_size>
  8061f5:	0f af ce             	imul   ecx,esi
  8061f8:	89 cf                	mov    edi,ecx
  8061fa:	89 d1                	mov    ecx,edx
  8061fc:	89 c2                	mov    edx,eax
  8061fe:	44 89 c6             	mov    esi,r8d
  806201:	e8 b8 fc ff ff       	call   805ebe <draw_letter>
        fb_cursor_x+=1;
  806206:	8b 05 40 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21340]        # 42754c <fb_cursor_x>
  80620c:	83 c0 01             	add    eax,0x1
  80620f:	89 05 37 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21337],eax        # 42754c <fb_cursor_x>
  806215:	eb 01                	jmp    806218 <print+0x107>
        if(*s=='\n')continue;
  806217:	90                   	nop
    for(;*s;s++){
  806218:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80621d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806221:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806224:	84 c0                	test   al,al
  806226:	0f 85 fa fe ff ff    	jne    806126 <print+0x15>
    }
}
  80622c:	90                   	nop
  80622d:	90                   	nop
  80622e:	c9                   	leave  
  80622f:	c3                   	ret    

0000000000806230 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  806230:	f3 0f 1e fa          	endbr64 
  806234:	55                   	push   rbp
  806235:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  806238:	0f b6 05 6e 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2156e]        # 4277ad <k_shift>
  80623f:	84 c0                	test   al,al
  806241:	0f 94 c0             	sete   al
  806244:	88 05 63 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21563],al        # 4277ad <k_shift>
}
  80624a:	90                   	nop
  80624b:	5d                   	pop    rbp
  80624c:	c3                   	ret    

000000000080624d <ctrl>:
void ctrl()
{
  80624d:	f3 0f 1e fa          	endbr64 
  806251:	55                   	push   rbp
  806252:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  806255:	0f b6 05 52 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21552]        # 4277ae <k_ctrl>
  80625c:	84 c0                	test   al,al
  80625e:	0f 94 c0             	sete   al
  806261:	88 05 47 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21547],al        # 4277ae <k_ctrl>
}
  806267:	90                   	nop
  806268:	5d                   	pop    rbp
  806269:	c3                   	ret    

000000000080626a <capslock>:
void capslock()
{
  80626a:	f3 0f 1e fa          	endbr64 
  80626e:	55                   	push   rbp
  80626f:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  806272:	0f b6 05 36 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21536]        # 4277af <k_capslock>
  806279:	84 c0                	test   al,al
  80627b:	0f 94 c0             	sete   al
  80627e:	88 05 2b 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2152b],al        # 4277af <k_capslock>
}
  806284:	90                   	nop
  806285:	5d                   	pop    rbp
  806286:	c3                   	ret    

0000000000806287 <to_ascii>:
char to_ascii(char scan_code)
{
  806287:	f3 0f 1e fa          	endbr64 
  80628b:	55                   	push   rbp
  80628c:	48 89 e5             	mov    rbp,rsp
  80628f:	89 f8                	mov    eax,edi
  806291:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806294:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80629b:	e9 c7 00 00 00       	jmp    806367 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8062a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062a3:	48 63 d0             	movsxd rdx,eax
  8062a6:	48 89 d0             	mov    rax,rdx
  8062a9:	48 c1 e0 02          	shl    rax,0x2
  8062ad:	48 01 d0             	add    rax,rdx
  8062b0:	48 05 42 21 81 00    	add    rax,0x812142
  8062b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062b9:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8062bc:	0f 85 a1 00 00 00    	jne    806363 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  8062c2:	0f b6 05 e6 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214e6]        # 4277af <k_capslock>
  8062c9:	84 c0                	test   al,al
  8062cb:	74 55                	je     806322 <to_ascii+0x9b>
  8062cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062d0:	48 63 d0             	movsxd rdx,eax
  8062d3:	48 89 d0             	mov    rax,rdx
  8062d6:	48 c1 e0 02          	shl    rax,0x2
  8062da:	48 01 d0             	add    rax,rdx
  8062dd:	48 05 40 21 81 00    	add    rax,0x812140
  8062e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062e6:	3c 60                	cmp    al,0x60
  8062e8:	7e 38                	jle    806322 <to_ascii+0x9b>
  8062ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062ed:	48 63 d0             	movsxd rdx,eax
  8062f0:	48 89 d0             	mov    rax,rdx
  8062f3:	48 c1 e0 02          	shl    rax,0x2
  8062f7:	48 01 d0             	add    rax,rdx
  8062fa:	48 05 40 21 81 00    	add    rax,0x812140
  806300:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806303:	3c 7a                	cmp    al,0x7a
  806305:	7f 1b                	jg     806322 <to_ascii+0x9b>
  806307:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80630a:	48 63 d0             	movsxd rdx,eax
  80630d:	48 89 d0             	mov    rax,rdx
  806310:	48 c1 e0 02          	shl    rax,0x2
  806314:	48 01 d0             	add    rax,rdx
  806317:	48 05 41 21 81 00    	add    rax,0x812141
  80631d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806320:	eb 54                	jmp    806376 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  806322:	0f b6 05 84 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21484]        # 4277ad <k_shift>
  806329:	84 c0                	test   al,al
  80632b:	74 1b                	je     806348 <to_ascii+0xc1>
  80632d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806330:	48 63 d0             	movsxd rdx,eax
  806333:	48 89 d0             	mov    rax,rdx
  806336:	48 c1 e0 02          	shl    rax,0x2
  80633a:	48 01 d0             	add    rax,rdx
  80633d:	48 05 41 21 81 00    	add    rax,0x812141
  806343:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806346:	eb 2e                	jmp    806376 <to_ascii+0xef>
            else return key_map[i].ascii;
  806348:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80634b:	48 63 d0             	movsxd rdx,eax
  80634e:	48 89 d0             	mov    rax,rdx
  806351:	48 c1 e0 02          	shl    rax,0x2
  806355:	48 01 d0             	add    rax,rdx
  806358:	48 05 40 21 81 00    	add    rax,0x812140
  80635e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806361:	eb 13                	jmp    806376 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806363:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806367:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  80636b:	0f 8e 2f ff ff ff    	jle    8062a0 <to_ascii+0x19>
        }

    return '\0';
  806371:	b8 00 00 00 00       	mov    eax,0x0
}
  806376:	5d                   	pop    rbp
  806377:	c3                   	ret    

0000000000806378 <init_kb>:
int init_kb()
{
  806378:	f3 0f 1e fa          	endbr64 
  80637c:	55                   	push   rbp
  80637d:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  806380:	bf 80 20 81 00       	mov    edi,0x812080
  806385:	e8 b5 c7 ff ff       	call   802b3f <reg_device>
    reg_driver(&drv_keyboard);
  80638a:	bf e0 1f 81 00       	mov    edi,0x811fe0
  80638f:	e8 93 ca ff ff       	call   802e27 <reg_driver>
}
  806394:	90                   	nop
  806395:	5d                   	pop    rbp
  806396:	c3                   	ret    

0000000000806397 <key_proc>:
int key_proc()
{
  806397:	f3 0f 1e fa          	endbr64 
  80639b:	55                   	push   rbp
  80639c:	48 89 e5             	mov    rbp,rsp
  80639f:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8063a3:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8063a7:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8063ab:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8063af:	bf 60 00 00 00       	mov    edi,0x60
  8063b4:	e8 30 eb ff ff       	call   804ee9 <inb>
  8063b9:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8063bc:	8b 05 0a 41 00 00    	mov    eax,DWORD PTR [rip+0x410a]        # 80a4cc <key_bufq+0xc>
  8063c2:	83 c0 01             	add    eax,0x1
  8063c5:	8b 0d 05 41 00 00    	mov    ecx,DWORD PTR [rip+0x4105]        # 80a4d0 <key_bufq+0x10>
  8063cb:	99                   	cdq    
  8063cc:	f7 f9                	idiv   ecx
  8063ce:	8b 05 f4 40 00 00    	mov    eax,DWORD PTR [rip+0x40f4]        # 80a4c8 <key_bufq+0x8>
  8063d4:	39 c2                	cmp    edx,eax
  8063d6:	74 32                	je     80640a <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8063d8:	48 8b 15 e1 40 00 00 	mov    rdx,QWORD PTR [rip+0x40e1]        # 80a4c0 <key_bufq>
  8063df:	8b 05 e7 40 00 00    	mov    eax,DWORD PTR [rip+0x40e7]        # 80a4cc <key_bufq+0xc>
  8063e5:	48 98                	cdqe   
  8063e7:	48 01 c2             	add    rdx,rax
  8063ea:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8063ee:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8063f0:	8b 05 d6 40 00 00    	mov    eax,DWORD PTR [rip+0x40d6]        # 80a4cc <key_bufq+0xc>
  8063f6:	83 c0 01             	add    eax,0x1
  8063f9:	8b 0d d1 40 00 00    	mov    ecx,DWORD PTR [rip+0x40d1]        # 80a4d0 <key_bufq+0x10>
  8063ff:	99                   	cdq    
  806400:	f7 f9                	idiv   ecx
  806402:	89 d0                	mov    eax,edx
  806404:	89 05 c2 40 00 00    	mov    DWORD PTR [rip+0x40c2],eax        # 80a4cc <key_bufq+0xc>
    }

    if(scan1==0x48)
  80640a:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  80640e:	75 0a                	jne    80641a <key_proc+0x83>
        scr_up();
  806410:	b8 00 00 00 00       	mov    eax,0x0
  806415:	e8 d2 fb ff ff       	call   805fec <scr_up>
    if(scan1==0x50)
  80641a:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  80641e:	75 0a                	jne    80642a <key_proc+0x93>
        scr_down();
  806420:	b8 00 00 00 00       	mov    eax,0x0
  806425:	e8 53 fc ff ff       	call   80607d <scr_down>
    switch (scan1)
  80642a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80642e:	3d b6 00 00 00       	cmp    eax,0xb6
  806433:	74 41                	je     806476 <key_proc+0xdf>
  806435:	3d b6 00 00 00       	cmp    eax,0xb6
  80643a:	7f 5e                	jg     80649a <key_proc+0x103>
  80643c:	3d aa 00 00 00       	cmp    eax,0xaa
  806441:	74 33                	je     806476 <key_proc+0xdf>
  806443:	3d aa 00 00 00       	cmp    eax,0xaa
  806448:	7f 50                	jg     80649a <key_proc+0x103>
  80644a:	3d 9d 00 00 00       	cmp    eax,0x9d
  80644f:	74 31                	je     806482 <key_proc+0xeb>
  806451:	3d 9d 00 00 00       	cmp    eax,0x9d
  806456:	7f 42                	jg     80649a <key_proc+0x103>
  806458:	83 f8 3a             	cmp    eax,0x3a
  80645b:	74 31                	je     80648e <key_proc+0xf7>
  80645d:	83 f8 3a             	cmp    eax,0x3a
  806460:	7f 38                	jg     80649a <key_proc+0x103>
  806462:	83 f8 36             	cmp    eax,0x36
  806465:	74 0f                	je     806476 <key_proc+0xdf>
  806467:	83 f8 36             	cmp    eax,0x36
  80646a:	7f 2e                	jg     80649a <key_proc+0x103>
  80646c:	83 f8 1d             	cmp    eax,0x1d
  80646f:	74 11                	je     806482 <key_proc+0xeb>
  806471:	83 f8 2a             	cmp    eax,0x2a
  806474:	75 24                	jne    80649a <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  806476:	b8 00 00 00 00       	mov    eax,0x0
  80647b:	e8 b0 fd ff ff       	call   806230 <shift>
            break;
  806480:	eb 19                	jmp    80649b <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  806482:	b8 00 00 00 00       	mov    eax,0x0
  806487:	e8 c1 fd ff ff       	call   80624d <ctrl>
            break;
  80648c:	eb 0d                	jmp    80649b <key_proc+0x104>
        case 0x3a:
            capslock();
  80648e:	b8 00 00 00 00       	mov    eax,0x0
  806493:	e8 d2 fd ff ff       	call   80626a <capslock>
            break;
  806498:	eb 01                	jmp    80649b <key_proc+0x104>
        default:
            break;
  80649a:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  80649b:	b8 00 00 00 00       	mov    eax,0x0
  8064a0:	e8 59 ea ff ff       	call   804efe <eoi>
    asm volatile("leave \r\n iretq");
  8064a5:	c9                   	leave  
  8064a6:	48 cf                	iretq  
}
  8064a8:	90                   	nop
  8064a9:	c9                   	leave  
  8064aa:	c3                   	ret    

00000000008064ab <sys_getkbc>:

char sys_getkbc()
{
  8064ab:	f3 0f 1e fa          	endbr64 
  8064af:	55                   	push   rbp
  8064b0:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  8064b3:	8b 15 13 40 00 00    	mov    edx,DWORD PTR [rip+0x4013]        # 80a4cc <key_bufq+0xc>
  8064b9:	8b 05 09 40 00 00    	mov    eax,DWORD PTR [rip+0x4009]        # 80a4c8 <key_bufq+0x8>
  8064bf:	39 c2                	cmp    edx,eax
  8064c1:	75 07                	jne    8064ca <sys_getkbc+0x1f>
  8064c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8064c8:	eb 30                	jmp    8064fa <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  8064ca:	8b 05 fc 3f 00 00    	mov    eax,DWORD PTR [rip+0x3ffc]        # 80a4cc <key_bufq+0xc>
  8064d0:	48 98                	cdqe   
  8064d2:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  8064d9:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  8064dc:	8b 05 ea 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fea]        # 80a4cc <key_bufq+0xc>
  8064e2:	83 c0 01             	add    eax,0x1
  8064e5:	8b 0d e5 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3fe5]        # 80a4d0 <key_bufq+0x10>
  8064eb:	99                   	cdq    
  8064ec:	f7 f9                	idiv   ecx
  8064ee:	89 d0                	mov    eax,edx
  8064f0:	89 05 d6 3f 00 00    	mov    DWORD PTR [rip+0x3fd6],eax        # 80a4cc <key_bufq+0xc>
    return c;
  8064f6:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8064fa:	5d                   	pop    rbp
  8064fb:	c3                   	ret    

00000000008064fc <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8064fc:	f3 0f 1e fa          	endbr64 
  806500:	55                   	push   rbp
  806501:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806504:	b8 00 00 00 00       	mov    eax,0x0
  806509:	e8 8d 09 00 00       	call   806e9b <hd_iterate>
    return 0;
  80650e:	b8 00 00 00 00       	mov    eax,0x0
}
  806513:	5d                   	pop    rbp
  806514:	c3                   	ret    

0000000000806515 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806515:	f3 0f 1e fa          	endbr64 
  806519:	55                   	push   rbp
  80651a:	48 89 e5             	mov    rbp,rsp
  80651d:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806521:	48 8b 05 98 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f98]        # 42a4c0 <running_req>
  806528:	48 85 c0             	test   rax,rax
  80652b:	75 0a                	jne    806537 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80652d:	b8 01 00 00 00       	mov    eax,0x1
  806532:	e9 a3 01 00 00       	jmp    8066da <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806537:	48 8b 05 82 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f82]        # 42a4c0 <running_req>
  80653e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806542:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806546:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80654d:	48 8b 05 6c 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f6c]        # 42a4c0 <running_req>
  806554:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806557:	83 f8 02             	cmp    eax,0x2
  80655a:	74 0f                	je     80656b <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  80655c:	48 8b 05 5d 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f5d]        # 42a4c0 <running_req>
  806563:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806566:	83 f8 03             	cmp    eax,0x3
  806569:	75 07                	jne    806572 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  80656b:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806572:	48 8b 05 47 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f47]        # 42a4c0 <running_req>
  806579:	8b 00                	mov    eax,DWORD PTR [rax]
  80657b:	85 c0                	test   eax,eax
  80657d:	75 42                	jne    8065c1 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  80657f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806586:	eb 22                	jmp    8065aa <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  806588:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80658b:	0f b7 c0             	movzx  eax,ax
  80658e:	89 c7                	mov    edi,eax
  806590:	e8 5e e9 ff ff       	call   804ef3 <inw>
  806595:	89 c2                	mov    edx,eax
  806597:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80659b:	48 8d 48 02          	lea    rcx,[rax+0x2]
  80659f:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8065a3:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8065a6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8065aa:	48 8b 05 0f 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f0f]        # 42a4c0 <running_req>
  8065b1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8065b4:	c1 e0 08             	shl    eax,0x8
  8065b7:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8065ba:	7c cc                	jl     806588 <disk_int_handler_c+0x73>
  8065bc:	e9 ca 00 00 00       	jmp    80668b <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8065c1:	48 8b 05 f8 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ef8]        # 42a4c0 <running_req>
  8065c8:	8b 00                	mov    eax,DWORD PTR [rax]
  8065ca:	83 f8 01             	cmp    eax,0x1
  8065cd:	75 42                	jne    806611 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8065cf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8065d6:	eb 25                	jmp    8065fd <disk_int_handler_c+0xe8>
            outw(port,*p++);
  8065d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065dc:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8065e0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8065e4:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065e7:	0f b7 d0             	movzx  edx,ax
  8065ea:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065ed:	0f b7 c0             	movzx  eax,ax
  8065f0:	89 d6                	mov    esi,edx
  8065f2:	89 c7                	mov    edi,eax
  8065f4:	e8 e4 e8 ff ff       	call   804edd <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8065f9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8065fd:	48 8b 05 bc 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ebc]        # 42a4c0 <running_req>
  806604:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806607:	c1 e0 08             	shl    eax,0x8
  80660a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80660d:	7c c9                	jl     8065d8 <disk_int_handler_c+0xc3>
  80660f:	eb 7a                	jmp    80668b <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806611:	48 8b 05 a8 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ea8]        # 42a4c0 <running_req>
  806618:	8b 00                	mov    eax,DWORD PTR [rax]
  80661a:	83 f8 02             	cmp    eax,0x2
  80661d:	75 34                	jne    806653 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  80661f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806622:	83 c0 07             	add    eax,0x7
  806625:	0f b6 c0             	movzx  eax,al
  806628:	89 c7                	mov    edi,eax
  80662a:	e8 ba e8 ff ff       	call   804ee9 <inb>
  80662f:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806632:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806635:	0f b7 c0             	movzx  eax,ax
  806638:	89 c7                	mov    edi,eax
  80663a:	e8 b4 e8 ff ff       	call   804ef3 <inw>
  80663f:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806643:	48 8b 05 76 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e76]        # 42a4c0 <running_req>
  80664a:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806651:	eb 38                	jmp    80668b <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806653:	48 8b 05 66 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e66]        # 42a4c0 <running_req>
  80665a:	8b 00                	mov    eax,DWORD PTR [rax]
  80665c:	83 f8 03             	cmp    eax,0x3
  80665f:	75 2a                	jne    80668b <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806661:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806664:	83 c0 07             	add    eax,0x7
  806667:	0f b6 c0             	movzx  eax,al
  80666a:	89 c7                	mov    edi,eax
  80666c:	e8 78 e8 ff ff       	call   804ee9 <inb>
  806671:	0f b6 c0             	movzx  eax,al
  806674:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806677:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80667a:	89 c6                	mov    esi,eax
  80667c:	bf 16 23 81 00       	mov    edi,0x812316
  806681:	b8 00 00 00 00       	mov    eax,0x0
  806686:	e8 4e a6 ff ff       	call   800cd9 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  80668b:	48 8b 05 2e 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e2e]        # 42a4c0 <running_req>
  806692:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806699:	48 8b 05 20 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e20]        # 42a4c0 <running_req>
  8066a0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8066a4:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8066ab:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8066ae:	48 8b 05 13 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e13]        # 42a4c8 <running_devman_req>
  8066b5:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8066bc:	00 00 00 
    running_devman_req=NULL;
  8066bf:	48 c7 05 fe 3d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23dfe],0x0        # 42a4c8 <running_devman_req>
  8066c6:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8066ca:	48 c7 05 eb 3d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23deb],0x0        # 42a4c0 <running_req>
  8066d1:	00 00 00 00 
    return 0;
  8066d5:	b8 00 00 00 00       	mov    eax,0x0
}
  8066da:	c9                   	leave  
  8066db:	c3                   	ret    

00000000008066dc <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8066dc:	f3 0f 1e fa          	endbr64 
  8066e0:	55                   	push   rbp
  8066e1:	48 89 e5             	mov    rbp,rsp
  8066e4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8066e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066ea:	48 63 d0             	movsxd rdx,eax
  8066ed:	48 89 d0             	mov    rax,rdx
  8066f0:	48 01 c0             	add    rax,rax
  8066f3:	48 01 d0             	add    rax,rdx
  8066f6:	48 c1 e0 04          	shl    rax,0x4
  8066fa:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806700:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806702:	5d                   	pop    rbp
  806703:	c3                   	ret    

0000000000806704 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806704:	f3 0f 1e fa          	endbr64 
  806708:	55                   	push   rbp
  806709:	48 89 e5             	mov    rbp,rsp
  80670c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80670f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806712:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806715:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806718:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  80671c:	8b 05 d2 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23dd2]        # 42a4f4 <tail>
  806722:	83 c0 01             	add    eax,0x1
  806725:	48 63 d0             	movsxd rdx,eax
  806728:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  80672f:	48 c1 ea 20          	shr    rdx,0x20
  806733:	01 c2                	add    edx,eax
  806735:	c1 fa 07             	sar    edx,0x7
  806738:	89 c1                	mov    ecx,eax
  80673a:	c1 f9 1f             	sar    ecx,0x1f
  80673d:	29 ca                	sub    edx,ecx
  80673f:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806745:	29 c8                	sub    eax,ecx
  806747:	89 c2                	mov    edx,eax
  806749:	8b 05 a1 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23da1]        # 42a4f0 <head>
  80674f:	39 c2                	cmp    edx,eax
  806751:	75 0a                	jne    80675d <request+0x59>
    {
        return -1;
  806753:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806758:	e9 0d 01 00 00       	jmp    80686a <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  80675d:	8b 05 91 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d91]        # 42a4f4 <tail>
  806763:	48 63 d0             	movsxd rdx,eax
  806766:	48 89 d0             	mov    rax,rdx
  806769:	48 01 c0             	add    rax,rax
  80676c:	48 01 d0             	add    rax,rdx
  80676f:	48 c1 e0 04          	shl    rax,0x4
  806773:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  80677a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80677d:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  80677f:	8b 05 6f 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d6f]        # 42a4f4 <tail>
  806785:	48 63 d0             	movsxd rdx,eax
  806788:	48 89 d0             	mov    rax,rdx
  80678b:	48 01 c0             	add    rax,rax
  80678e:	48 01 d0             	add    rax,rdx
  806791:	48 c1 e0 04          	shl    rax,0x4
  806795:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  80679c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80679f:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8067a1:	8b 05 4d 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d4d]        # 42a4f4 <tail>
  8067a7:	48 63 d0             	movsxd rdx,eax
  8067aa:	48 89 d0             	mov    rax,rdx
  8067ad:	48 01 c0             	add    rax,rax
  8067b0:	48 01 d0             	add    rax,rdx
  8067b3:	48 c1 e0 04          	shl    rax,0x4
  8067b7:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  8067be:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8067c1:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8067c3:	8b 05 2b 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d2b]        # 42a4f4 <tail>
  8067c9:	48 63 d0             	movsxd rdx,eax
  8067cc:	48 89 d0             	mov    rax,rdx
  8067cf:	48 01 c0             	add    rax,rax
  8067d2:	48 01 d0             	add    rax,rdx
  8067d5:	48 c1 e0 04          	shl    rax,0x4
  8067d9:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  8067e0:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8067e3:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8067e5:	8b 05 09 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d09]        # 42a4f4 <tail>
  8067eb:	48 63 d0             	movsxd rdx,eax
  8067ee:	48 89 d0             	mov    rax,rdx
  8067f1:	48 01 c0             	add    rax,rax
  8067f4:	48 01 d0             	add    rax,rdx
  8067f7:	48 c1 e0 04          	shl    rax,0x4
  8067fb:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806801:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806807:	8b 05 e7 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23ce7]        # 42a4f4 <tail>
  80680d:	48 63 d0             	movsxd rdx,eax
  806810:	48 89 d0             	mov    rax,rdx
  806813:	48 01 c0             	add    rax,rax
  806816:	48 01 d0             	add    rax,rdx
  806819:	48 c1 e0 04          	shl    rax,0x4
  80681d:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  806824:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806828:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  80682b:	8b 05 c3 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23cc3]        # 42a4f4 <tail>
  806831:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806834:	8b 05 ba 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23cba]        # 42a4f4 <tail>
  80683a:	8d 50 01             	lea    edx,[rax+0x1]
  80683d:	48 63 c2             	movsxd rax,edx
  806840:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806847:	48 c1 e8 20          	shr    rax,0x20
  80684b:	01 d0                	add    eax,edx
  80684d:	c1 f8 07             	sar    eax,0x7
  806850:	89 d1                	mov    ecx,edx
  806852:	c1 f9 1f             	sar    ecx,0x1f
  806855:	29 c8                	sub    eax,ecx
  806857:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80685d:	89 d0                	mov    eax,edx
  80685f:	29 c8                	sub    eax,ecx
  806861:	89 05 8d 3c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23c8d],eax        # 42a4f4 <tail>
    return r;
  806867:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80686a:	5d                   	pop    rbp
  80686b:	c3                   	ret    

000000000080686c <execute_request>:
int execute_request(){
  80686c:	f3 0f 1e fa          	endbr64 
  806870:	55                   	push   rbp
  806871:	48 89 e5             	mov    rbp,rsp
  806874:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806878:	48 8b 05 41 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c41]        # 42a4c0 <running_req>
  80687f:	48 85 c0             	test   rax,rax
  806882:	74 6a                	je     8068ee <execute_request+0x82>
    {
        running_req->time++;
  806884:	48 8b 05 35 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c35]        # 42a4c0 <running_req>
  80688b:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80688e:	83 c2 01             	add    edx,0x1
  806891:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806894:	48 8b 05 25 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c25]        # 42a4c0 <running_req>
  80689b:	8b 00                	mov    eax,DWORD PTR [rax]
  80689d:	83 f8 02             	cmp    eax,0x2
  8068a0:	74 0a                	je     8068ac <execute_request+0x40>
            return 2;
  8068a2:	b8 02 00 00 00       	mov    eax,0x2
  8068a7:	e9 b4 01 00 00       	jmp    806a60 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8068ac:	48 8b 05 0d 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c0d]        # 42a4c0 <running_req>
  8068b3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8068b6:	83 f8 0a             	cmp    eax,0xa
  8068b9:	7e 29                	jle    8068e4 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  8068bb:	48 8b 05 fe 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bfe]        # 42a4c0 <running_req>
  8068c2:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8068c9:	48 8b 05 f0 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bf0]        # 42a4c0 <running_req>
  8068d0:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8068d7:	48 c7 05 de 3b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23bde],0x0        # 42a4c0 <running_req>
  8068de:	00 00 00 00 
  8068e2:	eb 0a                	jmp    8068ee <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8068e4:	b8 02 00 00 00       	mov    eax,0x2
  8068e9:	e9 72 01 00 00       	jmp    806a60 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8068ee:	8b 15 fc 3b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc23bfc]        # 42a4f0 <head>
  8068f4:	8b 05 fa 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23bfa]        # 42a4f4 <tail>
  8068fa:	39 c2                	cmp    edx,eax
  8068fc:	75 0a                	jne    806908 <execute_request+0x9c>
  8068fe:	b8 01 00 00 00       	mov    eax,0x1
  806903:	e9 58 01 00 00       	jmp    806a60 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806908:	8b 05 e2 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23be2]        # 42a4f0 <head>
  80690e:	48 63 d0             	movsxd rdx,eax
  806911:	48 89 d0             	mov    rax,rdx
  806914:	48 01 c0             	add    rax,rax
  806917:	48 01 d0             	add    rax,rdx
  80691a:	48 c1 e0 04          	shl    rax,0x4
  80691e:	48 05 c0 77 42 00    	add    rax,0x4277c0
  806924:	48 89 05 95 3b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23b95],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80692b:	8b 05 bf 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23bbf]        # 42a4f0 <head>
  806931:	8d 50 01             	lea    edx,[rax+0x1]
  806934:	48 63 c2             	movsxd rax,edx
  806937:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80693e:	48 c1 e8 20          	shr    rax,0x20
  806942:	01 d0                	add    eax,edx
  806944:	c1 f8 07             	sar    eax,0x7
  806947:	89 d1                	mov    ecx,edx
  806949:	c1 f9 1f             	sar    ecx,0x1f
  80694c:	29 c8                	sub    eax,ecx
  80694e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806954:	89 d0                	mov    eax,edx
  806956:	29 c8                	sub    eax,ecx
  806958:	89 05 92 3b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23b92],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  80695e:	48 8b 05 5b 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b5b]        # 42a4c0 <running_req>
  806965:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  80696c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806973:	48 8b 05 46 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b46]        # 42a4c0 <running_req>
  80697a:	8b 00                	mov    eax,DWORD PTR [rax]
  80697c:	83 f8 03             	cmp    eax,0x3
  80697f:	0f 84 ad 00 00 00    	je     806a32 <execute_request+0x1c6>
  806985:	83 f8 03             	cmp    eax,0x3
  806988:	0f 8f bf 00 00 00    	jg     806a4d <execute_request+0x1e1>
  80698e:	83 f8 02             	cmp    eax,0x2
  806991:	0f 84 85 00 00 00    	je     806a1c <execute_request+0x1b0>
  806997:	83 f8 02             	cmp    eax,0x2
  80699a:	0f 8f ad 00 00 00    	jg     806a4d <execute_request+0x1e1>
  8069a0:	85 c0                	test   eax,eax
  8069a2:	74 0a                	je     8069ae <execute_request+0x142>
  8069a4:	83 f8 01             	cmp    eax,0x1
  8069a7:	74 3c                	je     8069e5 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8069a9:	e9 9f 00 00 00       	jmp    806a4d <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  8069ae:	48 8b 05 0b 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b0b]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  8069b5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  8069b9:	48 8b 05 00 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b00]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  8069c0:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  8069c3:	48 8b 05 f6 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23af6]        # 42a4c0 <running_req>
  8069ca:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8069cd:	89 c6                	mov    esi,eax
  8069cf:	48 8b 05 ea 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aea]        # 42a4c0 <running_req>
  8069d6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8069d9:	89 c7                	mov    edi,eax
  8069db:	e8 a7 00 00 00       	call   806a87 <async_read_disk>
  8069e0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8069e3:	eb 69                	jmp    806a4e <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  8069e5:	48 8b 05 d4 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ad4]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8069ec:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8069f0:	48 8b 05 c9 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ac9]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8069f7:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  8069fa:	48 8b 05 bf 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23abf]        # 42a4c0 <running_req>
  806a01:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806a04:	89 c6                	mov    esi,eax
  806a06:	48 8b 05 b3 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ab3]        # 42a4c0 <running_req>
  806a0d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a10:	89 c7                	mov    edi,eax
  806a12:	e8 88 01 00 00       	call   806b9f <async_write_disk>
  806a17:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a1a:	eb 32                	jmp    806a4e <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806a1c:	48 8b 05 9d 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a9d]        # 42a4c0 <running_req>
  806a23:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a26:	89 c7                	mov    edi,eax
  806a28:	e8 8f 06 00 00       	call   8070bc <async_check_disk>
  806a2d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a30:	eb 1c                	jmp    806a4e <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806a32:	48 8b 05 87 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a87]        # 42a4c0 <running_req>
  806a39:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a3c:	89 c7                	mov    edi,eax
  806a3e:	b8 00 00 00 00       	mov    eax,0x0
  806a43:	e8 1a 00 00 00       	call   806a62 <async_reset_disk>
  806a48:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a4b:	eb 01                	jmp    806a4e <execute_request+0x1e2>
        break;
  806a4d:	90                   	nop
    }
    if(r==-1)return -1;
  806a4e:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806a52:	75 07                	jne    806a5b <execute_request+0x1ef>
  806a54:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a59:	eb 05                	jmp    806a60 <execute_request+0x1f4>
    return 0;
  806a5b:	b8 00 00 00 00       	mov    eax,0x0
}
  806a60:	c9                   	leave  
  806a61:	c3                   	ret    

0000000000806a62 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806a62:	f3 0f 1e fa          	endbr64 
  806a66:	55                   	push   rbp
  806a67:	48 89 e5             	mov    rbp,rsp
  806a6a:	48 83 ec 10          	sub    rsp,0x10
  806a6e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806a71:	be 0c 00 00 00       	mov    esi,0xc
  806a76:	bf f6 03 00 00       	mov    edi,0x3f6
  806a7b:	e8 50 e4 ff ff       	call   804ed0 <outb>
    return 0;
  806a80:	b8 00 00 00 00       	mov    eax,0x0
}
  806a85:	c9                   	leave  
  806a86:	c3                   	ret    

0000000000806a87 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806a87:	f3 0f 1e fa          	endbr64 
  806a8b:	55                   	push   rbp
  806a8c:	48 89 e5             	mov    rbp,rsp
  806a8f:	48 83 ec 30          	sub    rsp,0x30
  806a93:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a96:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a99:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806a9c:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806aa0:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806aa6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806aad:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806ab1:	74 06                	je     806ab9 <async_read_disk+0x32>
  806ab3:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806ab7:	75 06                	jne    806abf <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806ab9:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806abf:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806ac3:	74 06                	je     806acb <async_read_disk+0x44>
  806ac5:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806ac9:	75 07                	jne    806ad2 <async_read_disk+0x4b>
        slave_disk=1;
  806acb:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806ad2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806ad5:	0f b6 d0             	movzx  edx,al
  806ad8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806adc:	83 c0 02             	add    eax,0x2
  806adf:	0f b7 c0             	movzx  eax,ax
  806ae2:	89 d6                	mov    esi,edx
  806ae4:	89 c7                	mov    edi,eax
  806ae6:	e8 e5 e3 ff ff       	call   804ed0 <outb>
    outb(port+3,lba&0xff);
  806aeb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806aee:	0f b6 d0             	movzx  edx,al
  806af1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806af5:	83 c0 03             	add    eax,0x3
  806af8:	0f b7 c0             	movzx  eax,ax
  806afb:	89 d6                	mov    esi,edx
  806afd:	89 c7                	mov    edi,eax
  806aff:	e8 cc e3 ff ff       	call   804ed0 <outb>
    outb(port+4,(lba>>8)&0xff);
  806b04:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b07:	c1 e8 08             	shr    eax,0x8
  806b0a:	0f b6 d0             	movzx  edx,al
  806b0d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b11:	83 c0 04             	add    eax,0x4
  806b14:	0f b7 c0             	movzx  eax,ax
  806b17:	89 d6                	mov    esi,edx
  806b19:	89 c7                	mov    edi,eax
  806b1b:	e8 b0 e3 ff ff       	call   804ed0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806b20:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b23:	c1 e8 10             	shr    eax,0x10
  806b26:	0f b6 d0             	movzx  edx,al
  806b29:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b2d:	83 c0 05             	add    eax,0x5
  806b30:	0f b7 c0             	movzx  eax,ax
  806b33:	89 d6                	mov    esi,edx
  806b35:	89 c7                	mov    edi,eax
  806b37:	e8 94 e3 ff ff       	call   804ed0 <outb>
    char drv=slave_disk?0x10:0;
  806b3c:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806b40:	74 07                	je     806b49 <async_read_disk+0xc2>
  806b42:	b8 10 00 00 00       	mov    eax,0x10
  806b47:	eb 05                	jmp    806b4e <async_read_disk+0xc7>
  806b49:	b8 00 00 00 00       	mov    eax,0x0
  806b4e:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806b51:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b54:	c1 e8 18             	shr    eax,0x18
  806b57:	83 e0 0f             	and    eax,0xf
  806b5a:	89 c2                	mov    edx,eax
  806b5c:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806b60:	09 d0                	or     eax,edx
  806b62:	83 c8 e0             	or     eax,0xffffffe0
  806b65:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806b68:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806b6c:	0f b6 d0             	movzx  edx,al
  806b6f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b73:	83 c0 06             	add    eax,0x6
  806b76:	0f b7 c0             	movzx  eax,ax
  806b79:	89 d6                	mov    esi,edx
  806b7b:	89 c7                	mov    edi,eax
  806b7d:	e8 4e e3 ff ff       	call   804ed0 <outb>
    outb(port+7,DISK_CMD_READ);
  806b82:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b86:	83 c0 07             	add    eax,0x7
  806b89:	0f b7 c0             	movzx  eax,ax
  806b8c:	be 20 00 00 00       	mov    esi,0x20
  806b91:	89 c7                	mov    edi,eax
  806b93:	e8 38 e3 ff ff       	call   804ed0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806b98:	b8 00 00 00 00       	mov    eax,0x0
}
  806b9d:	c9                   	leave  
  806b9e:	c3                   	ret    

0000000000806b9f <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806b9f:	f3 0f 1e fa          	endbr64 
  806ba3:	55                   	push   rbp
  806ba4:	48 89 e5             	mov    rbp,rsp
  806ba7:	48 83 ec 30          	sub    rsp,0x30
  806bab:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806bae:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806bb1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806bb4:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806bb8:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806bbe:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806bc5:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806bc9:	74 06                	je     806bd1 <async_write_disk+0x32>
  806bcb:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bcf:	75 06                	jne    806bd7 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806bd1:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806bd7:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bdb:	74 06                	je     806be3 <async_write_disk+0x44>
  806bdd:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806be1:	75 07                	jne    806bea <async_write_disk+0x4b>
        slave_disk=1;
  806be3:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806bea:	bf f7 00 00 00       	mov    edi,0xf7
  806bef:	e8 f5 e2 ff ff       	call   804ee9 <inb>
  806bf4:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806bf7:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806bfb:	83 e0 01             	and    eax,0x1
  806bfe:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806c01:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806c05:	74 0a                	je     806c11 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806c07:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806c0c:	e9 d5 00 00 00       	jmp    806ce6 <async_write_disk+0x147>
        }
        t&=0x88;
  806c11:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806c15:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806c19:	74 02                	je     806c1d <async_write_disk+0x7e>
    {
  806c1b:	eb cd                	jmp    806bea <async_write_disk+0x4b>
        if(t==0x8)break;
  806c1d:	90                   	nop
    }
    outb(port+2,sec_n);
  806c1e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806c21:	0f b6 d0             	movzx  edx,al
  806c24:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c28:	83 c0 02             	add    eax,0x2
  806c2b:	0f b7 c0             	movzx  eax,ax
  806c2e:	89 d6                	mov    esi,edx
  806c30:	89 c7                	mov    edi,eax
  806c32:	e8 99 e2 ff ff       	call   804ed0 <outb>
    outb(port+3,lba&0xff);
  806c37:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c3a:	0f b6 d0             	movzx  edx,al
  806c3d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c41:	83 c0 03             	add    eax,0x3
  806c44:	0f b7 c0             	movzx  eax,ax
  806c47:	89 d6                	mov    esi,edx
  806c49:	89 c7                	mov    edi,eax
  806c4b:	e8 80 e2 ff ff       	call   804ed0 <outb>
    outb(port+4,(lba>>8)&0xff);
  806c50:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c53:	c1 e8 08             	shr    eax,0x8
  806c56:	0f b6 d0             	movzx  edx,al
  806c59:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c5d:	83 c0 04             	add    eax,0x4
  806c60:	0f b7 c0             	movzx  eax,ax
  806c63:	89 d6                	mov    esi,edx
  806c65:	89 c7                	mov    edi,eax
  806c67:	e8 64 e2 ff ff       	call   804ed0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806c6c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c6f:	c1 e8 10             	shr    eax,0x10
  806c72:	0f b6 d0             	movzx  edx,al
  806c75:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c79:	83 c0 05             	add    eax,0x5
  806c7c:	0f b7 c0             	movzx  eax,ax
  806c7f:	89 d6                	mov    esi,edx
  806c81:	89 c7                	mov    edi,eax
  806c83:	e8 48 e2 ff ff       	call   804ed0 <outb>
    char drv=slave_disk?0x10:0;
  806c88:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806c8c:	74 07                	je     806c95 <async_write_disk+0xf6>
  806c8e:	b8 10 00 00 00       	mov    eax,0x10
  806c93:	eb 05                	jmp    806c9a <async_write_disk+0xfb>
  806c95:	b8 00 00 00 00       	mov    eax,0x0
  806c9a:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806c9d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ca0:	c1 e8 18             	shr    eax,0x18
  806ca3:	83 e0 0f             	and    eax,0xf
  806ca6:	89 c2                	mov    edx,eax
  806ca8:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806cac:	09 d0                	or     eax,edx
  806cae:	83 c8 e0             	or     eax,0xffffffe0
  806cb1:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806cb4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806cb8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806cbc:	83 c0 06             	add    eax,0x6
  806cbf:	0f b7 c0             	movzx  eax,ax
  806cc2:	89 d6                	mov    esi,edx
  806cc4:	89 c7                	mov    edi,eax
  806cc6:	e8 05 e2 ff ff       	call   804ed0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806ccb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ccf:	83 c0 07             	add    eax,0x7
  806cd2:	0f b7 c0             	movzx  eax,ax
  806cd5:	be 30 00 00 00       	mov    esi,0x30
  806cda:	89 c7                	mov    edi,eax
  806cdc:	e8 ef e1 ff ff       	call   804ed0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806ce1:	b8 00 00 00 00       	mov    eax,0x0
}
  806ce6:	c9                   	leave  
  806ce7:	c3                   	ret    

0000000000806ce8 <read_disk>:
int read_disk(driver_args* args)
{
  806ce8:	f3 0f 1e fa          	endbr64 
  806cec:	55                   	push   rbp
  806ced:	48 89 e5             	mov    rbp,rsp
  806cf0:	48 83 ec 20          	sub    rsp,0x20
  806cf4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806cf8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cfc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806cff:	48 98                	cdqe   
  806d01:	48 89 c2             	mov    rdx,rax
  806d04:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d08:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d0f:	8b 00                	mov    eax,DWORD PTR [rax]
  806d11:	89 ce                	mov    esi,ecx
  806d13:	89 c7                	mov    edi,eax
  806d15:	e8 92 05 00 00       	call   8072ac <read_disk_asm>
  806d1a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806d1d:	48 8b 05 9c 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2379c]        # 42a4c0 <running_req>
  806d24:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806d2b:	48 8b 05 8e 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2378e]        # 42a4c0 <running_req>
  806d32:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806d36:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806d3d:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806d40:	48 c7 05 75 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23775],0x0        # 42a4c0 <running_req>
  806d47:	00 00 00 00 
    return ret;
  806d4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806d4e:	c9                   	leave  
  806d4f:	c3                   	ret    

0000000000806d50 <write_disk>:
int write_disk(driver_args* args)
{
  806d50:	f3 0f 1e fa          	endbr64 
  806d54:	55                   	push   rbp
  806d55:	48 89 e5             	mov    rbp,rsp
  806d58:	48 83 ec 20          	sub    rsp,0x20
  806d5c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  806d60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d64:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d67:	48 98                	cdqe   
  806d69:	48 89 c2             	mov    rdx,rax
  806d6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d70:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d77:	8b 00                	mov    eax,DWORD PTR [rax]
  806d79:	89 ce                	mov    esi,ecx
  806d7b:	89 c7                	mov    edi,eax
  806d7d:	e8 aa 05 00 00       	call   80732c <write_disk_asm>
  806d82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806d85:	48 8b 05 34 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23734]        # 42a4c0 <running_req>
  806d8c:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806d93:	48 8b 05 26 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23726]        # 42a4c0 <running_req>
  806d9a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806d9e:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806da5:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806da8:	48 c7 05 0d 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2370d],0x0        # 42a4c0 <running_req>
  806daf:	00 00 00 00 
    return ret;
  806db3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806db6:	c9                   	leave  
  806db7:	c3                   	ret    

0000000000806db8 <chk_result>:
int chk_result(int r)
{
  806db8:	f3 0f 1e fa          	endbr64 
  806dbc:	55                   	push   rbp
  806dbd:	48 89 e5             	mov    rbp,rsp
  806dc0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806dc3:	90                   	nop
  806dc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806dc7:	48 63 d0             	movsxd rdx,eax
  806dca:	48 89 d0             	mov    rax,rdx
  806dcd:	48 01 c0             	add    rax,rax
  806dd0:	48 01 d0             	add    rax,rdx
  806dd3:	48 c1 e0 04          	shl    rax,0x4
  806dd7:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806ddd:	8b 00                	mov    eax,DWORD PTR [rax]
  806ddf:	83 f8 03             	cmp    eax,0x3
  806de2:	75 e0                	jne    806dc4 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806de4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806de7:	48 63 d0             	movsxd rdx,eax
  806dea:	48 89 d0             	mov    rax,rdx
  806ded:	48 01 c0             	add    rax,rax
  806df0:	48 01 d0             	add    rax,rdx
  806df3:	48 c1 e0 04          	shl    rax,0x4
  806df7:	48 05 e0 77 42 00    	add    rax,0x4277e0
  806dfd:	8b 00                	mov    eax,DWORD PTR [rax]
  806dff:	83 f8 01             	cmp    eax,0x1
  806e02:	0f 94 c0             	sete   al
  806e05:	0f b6 c0             	movzx  eax,al
}
  806e08:	5d                   	pop    rbp
  806e09:	c3                   	ret    

0000000000806e0a <disk_existent>:
int disk_existent(int disk)
{
  806e0a:	f3 0f 1e fa          	endbr64 
  806e0e:	55                   	push   rbp
  806e0f:	48 89 e5             	mov    rbp,rsp
  806e12:	48 83 ec 10          	sub    rsp,0x10
  806e16:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806e19:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806e1d:	74 5f                	je     806e7e <disk_existent+0x74>
  806e1f:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806e23:	7f 6e                	jg     806e93 <disk_existent+0x89>
  806e25:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806e29:	74 3e                	je     806e69 <disk_existent+0x5f>
  806e2b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806e2f:	7f 62                	jg     806e93 <disk_existent+0x89>
  806e31:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806e35:	74 08                	je     806e3f <disk_existent+0x35>
  806e37:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806e3b:	74 17                	je     806e54 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806e3d:	eb 54                	jmp    806e93 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806e3f:	bf 34 23 81 00       	mov    edi,0x812334
  806e44:	e8 2e c1 ff ff       	call   802f77 <sys_find_dev>
  806e49:	83 f8 ff             	cmp    eax,0xffffffff
  806e4c:	0f 95 c0             	setne  al
  806e4f:	0f b6 c0             	movzx  eax,al
  806e52:	eb 45                	jmp    806e99 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  806e54:	bf 38 23 81 00       	mov    edi,0x812338
  806e59:	e8 19 c1 ff ff       	call   802f77 <sys_find_dev>
  806e5e:	83 f8 ff             	cmp    eax,0xffffffff
  806e61:	0f 95 c0             	setne  al
  806e64:	0f b6 c0             	movzx  eax,al
  806e67:	eb 30                	jmp    806e99 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  806e69:	bf 3c 23 81 00       	mov    edi,0x81233c
  806e6e:	e8 04 c1 ff ff       	call   802f77 <sys_find_dev>
  806e73:	83 f8 ff             	cmp    eax,0xffffffff
  806e76:	0f 95 c0             	setne  al
  806e79:	0f b6 c0             	movzx  eax,al
  806e7c:	eb 1b                	jmp    806e99 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806e7e:	bf 40 23 81 00       	mov    edi,0x812340
  806e83:	e8 ef c0 ff ff       	call   802f77 <sys_find_dev>
  806e88:	83 f8 ff             	cmp    eax,0xffffffff
  806e8b:	0f 95 c0             	setne  al
  806e8e:	0f b6 c0             	movzx  eax,al
  806e91:	eb 06                	jmp    806e99 <disk_existent+0x8f>
        break;
  806e93:	90                   	nop
    }
    return 0;
  806e94:	b8 00 00 00 00       	mov    eax,0x0
}
  806e99:	c9                   	leave  
  806e9a:	c3                   	ret    

0000000000806e9b <hd_iterate>:
int hd_iterate()
{
  806e9b:	f3 0f 1e fa          	endbr64 
  806e9f:	55                   	push   rbp
  806ea0:	48 89 e5             	mov    rbp,rsp
  806ea3:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806eaa:	41 b8 00 00 00 00    	mov    r8d,0x0
  806eb0:	b9 01 00 00 00       	mov    ecx,0x1
  806eb5:	ba 00 00 00 00       	mov    edx,0x0
  806eba:	be 02 00 00 00       	mov    esi,0x2
  806ebf:	bf 00 00 00 00       	mov    edi,0x0
  806ec4:	e8 3b f8 ff ff       	call   806704 <request>
  806ec9:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806ecc:	41 b8 00 00 00 00    	mov    r8d,0x0
  806ed2:	b9 01 00 00 00       	mov    ecx,0x1
  806ed7:	ba 00 00 00 00       	mov    edx,0x0
  806edc:	be 02 00 00 00       	mov    esi,0x2
  806ee1:	bf 01 00 00 00       	mov    edi,0x1
  806ee6:	e8 19 f8 ff ff       	call   806704 <request>
  806eeb:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806eee:	41 b8 00 00 00 00    	mov    r8d,0x0
  806ef4:	b9 01 00 00 00       	mov    ecx,0x1
  806ef9:	ba 00 00 00 00       	mov    edx,0x0
  806efe:	be 02 00 00 00       	mov    esi,0x2
  806f03:	bf 02 00 00 00       	mov    edi,0x2
  806f08:	e8 f7 f7 ff ff       	call   806704 <request>
  806f0d:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806f10:	41 b8 00 00 00 00    	mov    r8d,0x0
  806f16:	b9 01 00 00 00       	mov    ecx,0x1
  806f1b:	ba 00 00 00 00       	mov    edx,0x0
  806f20:	be 02 00 00 00       	mov    esi,0x2
  806f25:	bf 03 00 00 00       	mov    edi,0x3
  806f2a:	e8 d5 f7 ff ff       	call   806704 <request>
  806f2f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806f32:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806f39:	e9 72 01 00 00       	jmp    8070b0 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806f3e:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f42:	74 3b                	je     806f7f <hd_iterate+0xe4>
  806f44:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f48:	7f 3e                	jg     806f88 <hd_iterate+0xed>
  806f4a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f4e:	74 26                	je     806f76 <hd_iterate+0xdb>
  806f50:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f54:	7f 32                	jg     806f88 <hd_iterate+0xed>
  806f56:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806f5a:	74 08                	je     806f64 <hd_iterate+0xc9>
  806f5c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806f60:	74 0b                	je     806f6d <hd_iterate+0xd2>
  806f62:	eb 24                	jmp    806f88 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806f64:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806f6b:	eb 25                	jmp    806f92 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806f6d:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806f74:	eb 1c                	jmp    806f92 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806f76:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806f7d:	eb 13                	jmp    806f92 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806f7f:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806f86:	eb 0a                	jmp    806f92 <hd_iterate+0xf7>
        default:
            return -1;
  806f88:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806f8d:	e9 28 01 00 00       	jmp    8070ba <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806f92:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806f95:	48 98                	cdqe   
  806f97:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806f9b:	89 c7                	mov    edi,eax
  806f9d:	e8 16 fe ff ff       	call   806db8 <chk_result>
  806fa2:	85 c0                	test   eax,eax
  806fa4:	0f 84 81 00 00 00    	je     80702b <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806faa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fad:	89 c6                	mov    esi,eax
  806faf:	bf 44 23 81 00       	mov    edi,0x812344
  806fb4:	b8 00 00 00 00       	mov    eax,0x0
  806fb9:	e8 1b 9d ff ff       	call   800cd9 <printf>
            //新硬盘
            device hd={
  806fbe:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806fc5:	b8 00 00 00 00       	mov    eax,0x0
  806fca:	b9 15 00 00 00       	mov    ecx,0x15
  806fcf:	48 89 d7             	mov    rdi,rdx
  806fd2:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806fd5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806fd8:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806fde:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806fe5:	00 00 00 
  806fe8:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806fef:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806ff2:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806ff6:	7f 07                	jg     806fff <hd_iterate+0x164>
  806ff8:	b8 f0 01 00 00       	mov    eax,0x1f0
  806ffd:	eb 05                	jmp    807004 <hd_iterate+0x169>
  806fff:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  807004:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80700a:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  807011:	48 89 c7             	mov    rdi,rax
  807014:	e8 26 bb ff ff       	call   802b3f <reg_device>
  807019:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80701c:	48 63 d2             	movsxd rdx,edx
  80701f:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  807026:	e9 81 00 00 00       	jmp    8070ac <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80702b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80702e:	48 98                	cdqe   
  807030:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807034:	89 c7                	mov    edi,eax
  807036:	e8 7d fd ff ff       	call   806db8 <chk_result>
  80703b:	85 c0                	test   eax,eax
  80703d:	75 6d                	jne    8070ac <hd_iterate+0x211>
        {
            switch (i)
  80703f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807043:	74 3e                	je     807083 <hd_iterate+0x1e8>
  807045:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807049:	7f 41                	jg     80708c <hd_iterate+0x1f1>
  80704b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80704f:	74 28                	je     807079 <hd_iterate+0x1de>
  807051:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807055:	7f 35                	jg     80708c <hd_iterate+0x1f1>
  807057:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80705b:	74 08                	je     807065 <hd_iterate+0x1ca>
  80705d:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807061:	74 0c                	je     80706f <hd_iterate+0x1d4>
  807063:	eb 27                	jmp    80708c <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  807065:	48 c7 45 f8 34 23 81 	mov    QWORD PTR [rbp-0x8],0x812334
  80706c:	00 
  80706d:	eb 1d                	jmp    80708c <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80706f:	48 c7 45 f8 38 23 81 	mov    QWORD PTR [rbp-0x8],0x812338
  807076:	00 
  807077:	eb 13                	jmp    80708c <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  807079:	48 c7 45 f8 3c 23 81 	mov    QWORD PTR [rbp-0x8],0x81233c
  807080:	00 
  807081:	eb 09                	jmp    80708c <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  807083:	48 c7 45 f8 40 23 81 	mov    QWORD PTR [rbp-0x8],0x812340
  80708a:	00 
  80708b:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80708c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807090:	48 89 c7             	mov    rdi,rax
  807093:	e8 df be ff ff       	call   802f77 <sys_find_dev>
  807098:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80709b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80709e:	89 c7                	mov    edi,eax
  8070a0:	e8 a6 c5 ff ff       	call   80364b <get_dev>
  8070a5:	89 c7                	mov    edi,eax
  8070a7:	e8 f2 c4 ff ff       	call   80359e <dispose_device>
    for(int i=0;i<4;i++)
  8070ac:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8070b0:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8070b4:	0f 8e 84 fe ff ff    	jle    806f3e <hd_iterate+0xa3>
        }

    }
}
  8070ba:	c9                   	leave  
  8070bb:	c3                   	ret    

00000000008070bc <async_check_disk>:

int async_check_disk(int disk)
{
  8070bc:	f3 0f 1e fa          	endbr64 
  8070c0:	55                   	push   rbp
  8070c1:	48 89 e5             	mov    rbp,rsp
  8070c4:	48 83 ec 20          	sub    rsp,0x20
  8070c8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8070cb:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8070d1:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8070d7:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8070db:	74 06                	je     8070e3 <async_check_disk+0x27>
  8070dd:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070e1:	75 06                	jne    8070e9 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  8070e3:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  8070e9:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8070ed:	74 06                	je     8070f5 <async_check_disk+0x39>
  8070ef:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070f3:	75 06                	jne    8070fb <async_check_disk+0x3f>
        chkcmd=0xf0;
  8070f5:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  8070fb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070ff:	83 c0 02             	add    eax,0x2
  807102:	0f b7 c0             	movzx  eax,ax
  807105:	be 01 00 00 00       	mov    esi,0x1
  80710a:	89 c7                	mov    edi,eax
  80710c:	e8 bf dd ff ff       	call   804ed0 <outb>
    outb(disknr+3,0);
  807111:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807115:	83 c0 03             	add    eax,0x3
  807118:	0f b7 c0             	movzx  eax,ax
  80711b:	be 00 00 00 00       	mov    esi,0x0
  807120:	89 c7                	mov    edi,eax
  807122:	e8 a9 dd ff ff       	call   804ed0 <outb>
    outb(disknr+4,0);
  807127:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80712b:	83 c0 04             	add    eax,0x4
  80712e:	0f b7 c0             	movzx  eax,ax
  807131:	be 00 00 00 00       	mov    esi,0x0
  807136:	89 c7                	mov    edi,eax
  807138:	e8 93 dd ff ff       	call   804ed0 <outb>
    outb(disknr+5,0);
  80713d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807141:	83 c0 05             	add    eax,0x5
  807144:	0f b7 c0             	movzx  eax,ax
  807147:	be 00 00 00 00       	mov    esi,0x0
  80714c:	89 c7                	mov    edi,eax
  80714e:	e8 7d dd ff ff       	call   804ed0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  807153:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  807157:	0f b6 d0             	movzx  edx,al
  80715a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80715e:	83 c0 06             	add    eax,0x6
  807161:	0f b7 c0             	movzx  eax,ax
  807164:	89 d6                	mov    esi,edx
  807166:	89 c7                	mov    edi,eax
  807168:	e8 63 dd ff ff       	call   804ed0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80716d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807171:	83 c0 07             	add    eax,0x7
  807174:	0f b7 c0             	movzx  eax,ax
  807177:	be 90 00 00 00       	mov    esi,0x90
  80717c:	89 c7                	mov    edi,eax
  80717e:	e8 4d dd ff ff       	call   804ed0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  807183:	b8 00 00 00 00       	mov    eax,0x0
}
  807188:	c9                   	leave  
  807189:	c3                   	ret    

000000000080718a <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80718a:	f3 0f 1e fa          	endbr64 
  80718e:	55                   	push   rbp
  80718f:	48 89 e5             	mov    rbp,rsp
  807192:	48 83 ec 18          	sub    rsp,0x18
  807196:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80719a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8071a1:	eb 04                	jmp    8071a7 <hd_do_req+0x1d>
  8071a3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8071a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071aa:	48 98                	cdqe   
  8071ac:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  8071b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071b7:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8071bd:	39 c2                	cmp    edx,eax
  8071bf:	75 e2                	jne    8071a3 <hd_do_req+0x19>
    switch (args->cmd)
  8071c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071c5:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8071cb:	83 f8 04             	cmp    eax,0x4
  8071ce:	74 72                	je     807242 <hd_do_req+0xb8>
  8071d0:	83 f8 04             	cmp    eax,0x4
  8071d3:	0f 8f 96 00 00 00    	jg     80726f <hd_do_req+0xe5>
  8071d9:	83 f8 02             	cmp    eax,0x2
  8071dc:	74 0a                	je     8071e8 <hd_do_req+0x5e>
  8071de:	83 f8 03             	cmp    eax,0x3
  8071e1:	74 32                	je     807215 <hd_do_req+0x8b>
  8071e3:	e9 87 00 00 00       	jmp    80726f <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  8071e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071ec:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8071ef:	48 98                	cdqe   
  8071f1:	48 89 c6             	mov    rsi,rax
  8071f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071f8:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8071fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071ff:	8b 10                	mov    edx,DWORD PTR [rax]
  807201:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807204:	49 89 f0             	mov    r8,rsi
  807207:	be 00 00 00 00       	mov    esi,0x0
  80720c:	89 c7                	mov    edi,eax
  80720e:	e8 f1 f4 ff ff       	call   806704 <request>
        break;
  807213:	eb 61                	jmp    807276 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  807215:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807219:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80721c:	48 98                	cdqe   
  80721e:	48 89 c6             	mov    rsi,rax
  807221:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807225:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807228:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80722c:	8b 10                	mov    edx,DWORD PTR [rax]
  80722e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807231:	49 89 f0             	mov    r8,rsi
  807234:	be 01 00 00 00       	mov    esi,0x1
  807239:	89 c7                	mov    edi,eax
  80723b:	e8 c4 f4 ff ff       	call   806704 <request>
        break;
  807240:	eb 34                	jmp    807276 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807242:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807246:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807249:	48 98                	cdqe   
  80724b:	48 89 c6             	mov    rsi,rax
  80724e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807252:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807255:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807259:	8b 10                	mov    edx,DWORD PTR [rax]
  80725b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80725e:	49 89 f0             	mov    r8,rsi
  807261:	be 02 00 00 00       	mov    esi,0x2
  807266:	89 c7                	mov    edi,eax
  807268:	e8 97 f4 ff ff       	call   806704 <request>
        break;
  80726d:	eb 07                	jmp    807276 <hd_do_req+0xec>
    default:return -1;
  80726f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807274:	eb 1e                	jmp    807294 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  807276:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80727a:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  807281:	00 00 00 
    running_devman_req=args;
  807284:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807288:	48 89 05 39 32 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23239],rax        # 42a4c8 <running_devman_req>
    return 0;
  80728f:	b8 00 00 00 00       	mov    eax,0x0
  807294:	c9                   	leave  
  807295:	c3                   	ret    
  807296:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80729d:	00 00 00 

00000000008072a0 <disk_int_handler>:
  8072a0:	e8 59 dc ff ff       	call   804efe <eoi>
  8072a5:	e8 6b f2 ff ff       	call   806515 <disk_int_handler_c>
  8072aa:	48 cf                	iretq  

00000000008072ac <read_disk_asm>:
  8072ac:	55                   	push   rbp
  8072ad:	89 e5                	mov    ebp,esp
  8072af:	66 ba f7 01          	mov    dx,0x1f7
  8072b3:	31 c9                	xor    ecx,ecx
  8072b5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8072ba:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8072bf:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8072c4:	89 c6                	mov    esi,eax
  8072c6:	66 ba f2 01          	mov    dx,0x1f2
  8072ca:	88 c8                	mov    al,cl
  8072cc:	ee                   	out    dx,al
  8072cd:	66 ba f3 01          	mov    dx,0x1f3
  8072d1:	89 f0                	mov    eax,esi
  8072d3:	ee                   	out    dx,al
  8072d4:	66 ff c2             	inc    dx
  8072d7:	c1 e8 08             	shr    eax,0x8
  8072da:	ee                   	out    dx,al
  8072db:	66 ff c2             	inc    dx
  8072de:	c1 e8 08             	shr    eax,0x8
  8072e1:	ee                   	out    dx,al
  8072e2:	66 ff c2             	inc    dx
  8072e5:	66 c1 e8 08          	shr    ax,0x8
  8072e9:	24 0f                	and    al,0xf
  8072eb:	0c e0                	or     al,0xe0
  8072ed:	ee                   	out    dx,al
  8072ee:	66 ff c2             	inc    dx
  8072f1:	b0 20                	mov    al,0x20
  8072f3:	ee                   	out    dx,al

00000000008072f4 <read_disk_asm.wait>:
  8072f4:	90                   	nop
  8072f5:	ec                   	in     al,dx
  8072f6:	24 88                	and    al,0x88
  8072f8:	3c 08                	cmp    al,0x8
  8072fa:	75 f8                	jne    8072f4 <read_disk_asm.wait>
  8072fc:	66 89 d7             	mov    di,dx
  8072ff:	89 c8                	mov    eax,ecx
  807301:	66 b9 00 01          	mov    cx,0x100
  807305:	66 f7 e1             	mul    cx
  807308:	89 c1                	mov    ecx,eax
  80730a:	66 ba f0 01          	mov    dx,0x1f0

000000000080730e <read_disk_asm.read>:
  80730e:	66 ed                	in     ax,dx
  807310:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807314:	83 c3 02             	add    ebx,0x2
  807317:	e2 f5                	loop   80730e <read_disk_asm.read>
  807319:	c9                   	leave  
  80731a:	b8 00 00 00 00       	mov    eax,0x0
  80731f:	c3                   	ret    

0000000000807320 <read_disk_asm.err_disk_reading>:
  807320:	66 ba f1 01          	mov    dx,0x1f1
  807324:	31 c0                	xor    eax,eax
  807326:	66 ed                	in     ax,dx
  807328:	89 ec                	mov    esp,ebp
  80732a:	5d                   	pop    rbp
  80732b:	c3                   	ret    

000000000080732c <write_disk_asm>:
  80732c:	55                   	push   rbp
  80732d:	89 e5                	mov    ebp,esp
  80732f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807334:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807339:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80733e:	50                   	push   rax
  80733f:	66 ba f2 01          	mov    dx,0x1f2
  807343:	88 c8                	mov    al,cl
  807345:	ee                   	out    dx,al
  807346:	58                   	pop    rax
  807347:	66 ba f3 01          	mov    dx,0x1f3
  80734b:	ee                   	out    dx,al
  80734c:	c1 e8 08             	shr    eax,0x8
  80734f:	66 ba f4 01          	mov    dx,0x1f4
  807353:	ee                   	out    dx,al
  807354:	c1 e8 08             	shr    eax,0x8
  807357:	66 ba f5 01          	mov    dx,0x1f5
  80735b:	ee                   	out    dx,al
  80735c:	c1 e8 08             	shr    eax,0x8
  80735f:	24 0f                	and    al,0xf
  807361:	0c e0                	or     al,0xe0
  807363:	66 ba f6 01          	mov    dx,0x1f6
  807367:	ee                   	out    dx,al
  807368:	66 ba f7 01          	mov    dx,0x1f7
  80736c:	b0 30                	mov    al,0x30
  80736e:	ee                   	out    dx,al

000000000080736f <write_disk_asm.not_ready2>:
  80736f:	90                   	nop
  807370:	ec                   	in     al,dx
  807371:	24 88                	and    al,0x88
  807373:	3c 08                	cmp    al,0x8
  807375:	75 f8                	jne    80736f <write_disk_asm.not_ready2>
  807377:	89 c8                	mov    eax,ecx
  807379:	66 b9 00 01          	mov    cx,0x100
  80737d:	66 f7 e1             	mul    cx
  807380:	89 c1                	mov    ecx,eax
  807382:	66 ba f0 01          	mov    dx,0x1f0

0000000000807386 <write_disk_asm.go_on_write>:
  807386:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80738a:	66 ef                	out    dx,ax
  80738c:	83 c3 02             	add    ebx,0x2
  80738f:	e2 f5                	loop   807386 <write_disk_asm.go_on_write>
  807391:	89 ec                	mov    esp,ebp
  807393:	5d                   	pop    rbp
  807394:	c3                   	ret    

0000000000807395 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  807395:	f3 0f 1e fa          	endbr64 
  807399:	55                   	push   rbp
  80739a:	48 89 e5             	mov    rbp,rsp
  80739d:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  8073a4:	bf 00 24 81 00       	mov    edi,0x812400
  8073a9:	e8 91 b7 ff ff       	call   802b3f <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  8073ae:	bf 60 23 81 00       	mov    edi,0x812360
  8073b3:	e8 6f ba ff ff       	call   802e27 <reg_driver>
  8073b8:	89 05 a6 b3 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2b3a6],eax        # 432764 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  8073be:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8073c5:	48 89 c7             	mov    rdi,rax
  8073c8:	e8 26 00 00 00       	call   8073f3 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  8073cd:	8b 0d 91 b3 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2b391]        # 432764 <fat16_drvi>
  8073d3:	8b 05 f7 30 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc230f7]        # 42a4d0 <disk_drvi>
  8073d9:	ba a8 24 81 00       	mov    edx,0x8124a8
  8073de:	89 ce                	mov    esi,ecx
  8073e0:	89 c7                	mov    edi,eax
  8073e2:	b8 00 00 00 00       	mov    eax,0x0
  8073e7:	e8 db a6 ff ff       	call   801ac7 <reg_vol>
    return 0;
  8073ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8073f1:	c9                   	leave  
  8073f2:	c3                   	ret    

00000000008073f3 <load>:
int load(driver_args *args)
{
  8073f3:	f3 0f 1e fa          	endbr64 
  8073f7:	55                   	push   rbp
  8073f8:	48 89 e5             	mov    rbp,rsp
  8073fb:	48 83 ec 20          	sub    rsp,0x20
  8073ff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  807403:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  80740a:	ba 01 00 00 00       	mov    edx,0x1
  80740f:	be 00 00 00 00       	mov    esi,0x0
  807414:	bf 00 a5 42 00       	mov    edi,0x42a500
  807419:	e8 61 0b 00 00       	call   807f7f <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  80741e:	0f b7 05 f1 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230f1]        # 42a516 <superblock+0x16>
  807425:	0f b7 d0             	movzx  edx,ax
  807428:	0f b7 05 df 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230df]        # 42a50e <superblock+0xe>
  80742f:	0f b7 c0             	movzx  eax,ax
  807432:	89 c6                	mov    esi,eax
  807434:	bf 60 e7 42 00       	mov    edi,0x42e760
  807439:	e8 41 0b 00 00       	call   807f7f <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80743e:	0f b7 05 c9 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230c9]        # 42a50e <superblock+0xe>
  807445:	0f b7 c8             	movzx  ecx,ax
  807448:	0f b7 05 c7 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230c7]        # 42a516 <superblock+0x16>
  80744f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  807452:	0f b6 05 b7 30 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc230b7]        # 42a510 <superblock+0x10>
  807459:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80745c:	0f af c2             	imul   eax,edx
  80745f:	01 c8                	add    eax,ecx
  807461:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  807464:	0f b7 05 a6 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230a6]        # 42a511 <superblock+0x11>
  80746b:	0f b7 c0             	movzx  eax,ax
  80746e:	48 c1 e0 05          	shl    rax,0x5
  807472:	0f b7 15 92 30 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc23092]        # 42a50b <superblock+0xb>
  807479:	0f b7 ca             	movzx  ecx,dx
  80747c:	ba 00 00 00 00       	mov    edx,0x0
  807481:	48 f7 f1             	div    rcx
  807484:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  807487:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80748a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80748d:	89 c6                	mov    esi,eax
  80748f:	bf 40 a5 42 00       	mov    edi,0x42a540
  807494:	e8 e6 0a 00 00       	call   807f7f <read_sec>

    cur_dir.fistCluNum=0;
  807499:	66 c7 05 b8 70 c2 ff 	mov    WORD PTR [rip+0xffffffffffc270b8],0x0        # 42e55a <cur_dir+0x1a>
  8074a0:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  8074a2:	0f b7 05 65 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23065]        # 42a50e <superblock+0xe>
  8074a9:	0f b7 c0             	movzx  eax,ax
  8074ac:	83 c0 3e             	add    eax,0x3e
  8074af:	89 05 8b 31 00 00    	mov    DWORD PTR [rip+0x318b],eax        # 80a640 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  8074b5:	c7 05 a1 b2 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2b2a1],0x0        # 432760 <dir_depth>
  8074bc:	00 00 00 
    return 0;
  8074bf:	b8 00 00 00 00       	mov    eax,0x0

}
  8074c4:	c9                   	leave  
  8074c5:	c3                   	ret    

00000000008074c6 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  8074c6:	f3 0f 1e fa          	endbr64 
  8074ca:	55                   	push   rbp
  8074cb:	48 89 e5             	mov    rbp,rsp
  8074ce:	48 83 ec 70          	sub    rsp,0x70
  8074d2:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  8074d6:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  8074dd:	66 67 68 
  8074e0:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  8074e7:	6e 6f 70 
  8074ea:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8074ee:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8074f2:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  8074f9:	76 77 78 
  8074fc:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  807503:	44 45 46 
  807506:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  80750a:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80750e:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  807515:	4c 4d 4e 
  807518:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  80751f:	54 55 56 
  807522:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  807526:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80752a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  807531:	31 32 33 
  807534:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  80753b:	39 2c 2f 
  80753e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807542:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807546:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80754d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  807553:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807557:	48 89 c7             	mov    rdi,rax
  80755a:	e8 24 28 00 00       	call   809d83 <strlen>
  80755f:	83 f8 0b             	cmp    eax,0xb
  807562:	7f 10                	jg     807574 <verify_name+0xae>
  807564:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807568:	48 89 c7             	mov    rdi,rax
  80756b:	e8 13 28 00 00       	call   809d83 <strlen>
  807570:	85 c0                	test   eax,eax
  807572:	75 0a                	jne    80757e <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  807574:	b8 00 00 00 00       	mov    eax,0x0
  807579:	e9 b3 01 00 00       	jmp    807731 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  80757e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807585:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80758c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807593:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  80759a:	eb 6b                	jmp    807607 <verify_name+0x141>
    {
        int j=0;
  80759c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  8075a3:	eb 22                	jmp    8075c7 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  8075a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075a8:	48 63 d0             	movsxd rdx,eax
  8075ab:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075af:	48 01 d0             	add    rax,rdx
  8075b2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8075b5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075b8:	48 98                	cdqe   
  8075ba:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8075bf:	38 c2                	cmp    dl,al
  8075c1:	74 0e                	je     8075d1 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  8075c3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8075c7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075ca:	83 f8 45             	cmp    eax,0x45
  8075cd:	76 d6                	jbe    8075a5 <verify_name+0xdf>
  8075cf:	eb 01                	jmp    8075d2 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  8075d1:	90                   	nop
        if(j>=sizeof(valid_ch))
  8075d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075d5:	83 f8 45             	cmp    eax,0x45
  8075d8:	76 0a                	jbe    8075e4 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  8075da:	b8 00 00 00 00       	mov    eax,0x0
  8075df:	e9 4d 01 00 00       	jmp    807731 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8075e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075e7:	48 63 d0             	movsxd rdx,eax
  8075ea:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075ee:	48 01 d0             	add    rax,rdx
  8075f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075f4:	3c 20                	cmp    al,0x20
  8075f6:	74 07                	je     8075ff <verify_name+0x139>
  8075f8:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  8075ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  807603:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80760a:	48 63 d0             	movsxd rdx,eax
  80760d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807611:	48 01 d0             	add    rax,rdx
  807614:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807617:	3c 2e                	cmp    al,0x2e
  807619:	74 18                	je     807633 <verify_name+0x16d>
  80761b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80761e:	48 63 d0             	movsxd rdx,eax
  807621:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807625:	48 01 d0             	add    rax,rdx
  807628:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80762b:	84 c0                	test   al,al
  80762d:	0f 85 69 ff ff ff    	jne    80759c <verify_name+0xd6>
    }
    if(c>8||flag==0){
  807633:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  807637:	7f 06                	jg     80763f <verify_name+0x179>
  807639:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80763d:	75 0a                	jne    807649 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  80763f:	b8 00 00 00 00       	mov    eax,0x0
  807644:	e9 e8 00 00 00       	jmp    807731 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807649:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80764c:	48 63 d0             	movsxd rdx,eax
  80764f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807653:	48 01 d0             	add    rax,rdx
  807656:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807659:	84 c0                	test   al,al
  80765b:	75 0a                	jne    807667 <verify_name+0x1a1>
        return 1;
  80765d:	b8 01 00 00 00       	mov    eax,0x1
  807662:	e9 ca 00 00 00       	jmp    807731 <verify_name+0x26b>
    c=0;
  807667:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  80766e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  807675:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807679:	e9 83 00 00 00       	jmp    807701 <verify_name+0x23b>
    {
        int j=0;
  80767e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  807685:	eb 22                	jmp    8076a9 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  807687:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80768a:	48 63 d0             	movsxd rdx,eax
  80768d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807691:	48 01 d0             	add    rax,rdx
  807694:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807697:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80769a:	48 98                	cdqe   
  80769c:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8076a1:	38 c2                	cmp    dl,al
  8076a3:	74 0e                	je     8076b3 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  8076a5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8076a9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076ac:	83 f8 45             	cmp    eax,0x45
  8076af:	76 d6                	jbe    807687 <verify_name+0x1c1>
  8076b1:	eb 01                	jmp    8076b4 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  8076b3:	90                   	nop
        if(j>=sizeof(valid_ch)){
  8076b4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076b7:	83 f8 45             	cmp    eax,0x45
  8076ba:	76 07                	jbe    8076c3 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  8076bc:	b8 00 00 00 00       	mov    eax,0x0
  8076c1:	eb 6e                	jmp    807731 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8076c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076c6:	48 63 d0             	movsxd rdx,eax
  8076c9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076cd:	48 01 d0             	add    rax,rdx
  8076d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076d3:	3c 20                	cmp    al,0x20
  8076d5:	74 07                	je     8076de <verify_name+0x218>
  8076d7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  8076de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076e1:	48 63 d0             	movsxd rdx,eax
  8076e4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076e8:	48 01 d0             	add    rax,rdx
  8076eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076ee:	3c 2e                	cmp    al,0x2e
  8076f0:	75 07                	jne    8076f9 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  8076f2:	b8 00 00 00 00       	mov    eax,0x0
  8076f7:	eb 38                	jmp    807731 <verify_name+0x26b>
        }
        c++;
  8076f9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  8076fd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807701:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807704:	48 63 d0             	movsxd rdx,eax
  807707:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80770b:	48 01 d0             	add    rax,rdx
  80770e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807711:	84 c0                	test   al,al
  807713:	0f 85 65 ff ff ff    	jne    80767e <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807719:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80771d:	7f 06                	jg     807725 <verify_name+0x25f>
  80771f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807723:	75 07                	jne    80772c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807725:	b8 00 00 00 00       	mov    eax,0x0
  80772a:	eb 05                	jmp    807731 <verify_name+0x26b>
    }
    return 1;
  80772c:	b8 01 00 00 00       	mov    eax,0x1
}
  807731:	c9                   	leave  
  807732:	c3                   	ret    

0000000000807733 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807733:	f3 0f 1e fa          	endbr64 
  807737:	55                   	push   rbp
  807738:	48 89 e5             	mov    rbp,rsp
  80773b:	48 83 ec 30          	sub    rsp,0x30
  80773f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807743:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80774a:	20 20 20 
  80774d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807751:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807758:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80775f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  807766:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80776d:	e9 9b 00 00 00       	jmp    80780d <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  807772:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807775:	48 63 d0             	movsxd rdx,eax
  807778:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80777c:	48 01 d0             	add    rax,rdx
  80777f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807782:	3c 60                	cmp    al,0x60
  807784:	7e 3e                	jle    8077c4 <format_name+0x91>
  807786:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807789:	48 63 d0             	movsxd rdx,eax
  80778c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807790:	48 01 d0             	add    rax,rdx
  807793:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807796:	3c 7a                	cmp    al,0x7a
  807798:	7f 2a                	jg     8077c4 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  80779a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80779d:	48 63 d0             	movsxd rdx,eax
  8077a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077a4:	48 01 d0             	add    rax,rdx
  8077a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077aa:	8d 48 e0             	lea    ecx,[rax-0x20]
  8077ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077b0:	8d 50 01             	lea    edx,[rax+0x1]
  8077b3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8077b6:	89 ca                	mov    edx,ecx
  8077b8:	48 98                	cdqe   
  8077ba:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8077be:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077c2:	eb 45                	jmp    807809 <format_name+0xd6>
        }
        else if(str[i]=='.')
  8077c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077c7:	48 63 d0             	movsxd rdx,eax
  8077ca:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077ce:	48 01 d0             	add    rax,rdx
  8077d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077d4:	3c 2e                	cmp    al,0x2e
  8077d6:	75 0d                	jne    8077e5 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  8077d8:	b8 08 00 00 00       	mov    eax,0x8
  8077dd:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  8077e0:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  8077e3:	eb 24                	jmp    807809 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  8077e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077e8:	48 63 d0             	movsxd rdx,eax
  8077eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077ef:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8077f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077f6:	8d 50 01             	lea    edx,[rax+0x1]
  8077f9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8077fc:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  8077ff:	48 98                	cdqe   
  807801:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807805:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807809:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80780d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807810:	48 63 d0             	movsxd rdx,eax
  807813:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807817:	48 01 d0             	add    rax,rdx
  80781a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80781d:	84 c0                	test   al,al
  80781f:	0f 85 4d ff ff ff    	jne    807772 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807825:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807829:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80782d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807831:	48 89 d6             	mov    rsi,rdx
  807834:	48 89 c7             	mov    rdi,rax
  807837:	e8 28 23 00 00       	call   809b64 <strcpy>
}
  80783c:	90                   	nop
  80783d:	c9                   	leave  
  80783e:	c3                   	ret    

000000000080783f <req_cluster>:
int req_cluster()
{
  80783f:	f3 0f 1e fa          	endbr64 
  807843:	55                   	push   rbp
  807844:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807847:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80784e:	eb 2a                	jmp    80787a <req_cluster+0x3b>
    {
        if(fat[i]==0)
  807850:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807853:	48 98                	cdqe   
  807855:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80785c:	00 
  80785d:	66 85 c0             	test   ax,ax
  807860:	75 14                	jne    807876 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  807862:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807865:	48 98                	cdqe   
  807867:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0xffff
  80786e:	00 ff ff 
            return i;
  807871:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807874:	eb 13                	jmp    807889 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807876:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80787a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80787d:	3d ff 1f 00 00       	cmp    eax,0x1fff
  807882:	76 cc                	jbe    807850 <req_cluster+0x11>
        }
    }
    return -1;
  807884:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807889:	5d                   	pop    rbp
  80788a:	c3                   	ret    

000000000080788b <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  80788b:	f3 0f 1e fa          	endbr64 
  80788f:	55                   	push   rbp
  807890:	48 89 e5             	mov    rbp,rsp
  807893:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  80789a:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8078a1:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8078a7:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8078ad:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  8078b4:	b8 00 00 00 00       	mov    eax,0x0
  8078b9:	b9 18 00 00 00       	mov    ecx,0x18
  8078be:	48 89 d7             	mov    rdi,rdx
  8078c1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8078c4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8078cb:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  8078d1:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8078d7:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  8078dd:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  8078e3:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  8078e9:	48 8b 15 c8 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2cc8]        # 80a5b8 <drv_disk+0x18>
  8078f0:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8078f7:	48 89 c7             	mov    rdi,rax
  8078fa:	ff d2                	call   rdx
}
  8078fc:	c9                   	leave  
  8078fd:	c3                   	ret    

00000000008078fe <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  8078fe:	f3 0f 1e fa          	endbr64 
  807902:	55                   	push   rbp
  807903:	48 89 e5             	mov    rbp,rsp
  807906:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80790a:	89 f0                	mov    eax,esi
  80790c:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80790f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807913:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807917:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80791a:	89 c2                	mov    edx,eax
  80791c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807920:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807923:	90                   	nop
  807924:	5d                   	pop    rbp
  807925:	c3                   	ret    

0000000000807926 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807926:	f3 0f 1e fa          	endbr64 
  80792a:	55                   	push   rbp
  80792b:	48 89 e5             	mov    rbp,rsp
  80792e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807932:	0f b7 05 d5 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22bd5]        # 42a50e <superblock+0xe>
  807939:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80793c:	0f b7 05 d3 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22bd3]        # 42a516 <superblock+0x16>
  807943:	0f b7 d0             	movzx  edx,ax
  807946:	0f b6 05 c3 2b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22bc3]        # 42a510 <superblock+0x10>
  80794d:	0f b6 c0             	movzx  eax,al
  807950:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807953:	01 c8                	add    eax,ecx
  807955:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807958:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80795b:	ba 00 40 00 00       	mov    edx,0x4000
  807960:	89 c6                	mov    esi,eax
  807962:	bf 40 a5 42 00       	mov    edi,0x42a540
  807967:	e8 1f ff ff ff       	call   80788b <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80796c:	0f b7 05 9b 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22b9b]        # 42a50e <superblock+0xe>
  807973:	0f b7 c0             	movzx  eax,ax
  807976:	ba 00 40 00 00       	mov    edx,0x4000
  80797b:	89 c6                	mov    esi,eax
  80797d:	bf 60 e7 42 00       	mov    edi,0x42e760
  807982:	e8 04 ff ff ff       	call   80788b <write_sec>
    //printf("updated fat\n");

}
  807987:	90                   	nop
  807988:	c9                   	leave  
  807989:	c3                   	ret    

000000000080798a <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  80798a:	f3 0f 1e fa          	endbr64 
  80798e:	55                   	push   rbp
  80798f:	48 89 e5             	mov    rbp,rsp
  807992:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807996:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  80799a:	0f b7 c0             	movzx  eax,ax
  80799d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8079a0:	0f b6 05 66 2b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22b66]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8079a7:	0f b6 c0             	movzx  eax,al
  8079aa:	8b 0d 90 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c90]        # 80a640 <clu_sec_balance>
  8079b0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8079b3:	01 d1                	add    ecx,edx
  8079b5:	89 c2                	mov    edx,eax
  8079b7:	89 ce                	mov    esi,ecx
  8079b9:	bf 60 e5 42 00       	mov    edi,0x42e560
  8079be:	e8 bc 05 00 00       	call   807f7f <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  8079c3:	be aa 24 81 00       	mov    esi,0x8124aa
  8079c8:	bf 60 e5 42 00       	mov    edi,0x42e560
  8079cd:	e8 92 21 00 00       	call   809b64 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  8079d2:	be b3 24 81 00       	mov    esi,0x8124b3
  8079d7:	bf 68 e5 42 00       	mov    edi,0x42e568
  8079dc:	e8 83 21 00 00       	call   809b64 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  8079e1:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8079e5:	66 89 05 8e 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26b8e],ax        # 42e57a <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  8079ec:	c7 05 86 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26b86],0x0        # 42e57c <a_clu_of_dir+0x1c>
  8079f3:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  8079f6:	be 10 00 00 00       	mov    esi,0x10
  8079fb:	bf 60 e5 42 00       	mov    edi,0x42e560
  807a00:	e8 f9 fe ff ff       	call   8078fe <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807a05:	be b7 24 81 00       	mov    esi,0x8124b7
  807a0a:	bf 80 e5 42 00       	mov    edi,0x42e580
  807a0f:	e8 50 21 00 00       	call   809b64 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807a14:	be b3 24 81 00       	mov    esi,0x8124b3
  807a19:	bf 88 e5 42 00       	mov    edi,0x42e588
  807a1e:	e8 41 21 00 00       	call   809b64 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807a23:	0f b7 05 30 6b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26b30]        # 42e55a <cur_dir+0x1a>
  807a2a:	66 89 05 69 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26b69],ax        # 42e59a <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807a31:	c7 05 61 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26b61],0x0        # 42e59c <a_clu_of_dir+0x3c>
  807a38:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  807a3b:	be 10 00 00 00       	mov    esi,0x10
  807a40:	bf 80 e5 42 00       	mov    edi,0x42e580
  807a45:	e8 b4 fe ff ff       	call   8078fe <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  807a4a:	8b 15 f0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bf0]        # 80a640 <clu_sec_balance>
  807a50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a53:	01 d0                	add    eax,edx
  807a55:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807a58:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a5b:	ba 00 02 00 00       	mov    edx,0x200
  807a60:	89 c6                	mov    esi,eax
  807a62:	bf 60 e5 42 00       	mov    edi,0x42e560
  807a67:	e8 1f fe ff ff       	call   80788b <write_sec>
    //no need to update fat and root
}
  807a6c:	90                   	nop
  807a6d:	c9                   	leave  
  807a6e:	c3                   	ret    

0000000000807a6f <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  807a6f:	f3 0f 1e fa          	endbr64 
  807a73:	55                   	push   rbp
  807a74:	48 89 e5             	mov    rbp,rsp
  807a77:	89 f8                	mov    eax,edi
  807a79:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807a7d:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  807a80:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a84:	83 e0 01             	and    eax,0x1
  807a87:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  807a8a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807a8e:	74 0b                	je     807a9b <translate_attr+0x2c>
        attr_s[1]='-';
  807a90:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a94:	48 83 c0 01          	add    rax,0x1
  807a98:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  807a9b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a9f:	83 e0 02             	and    eax,0x2
  807aa2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807aa5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807aa9:	74 0b                	je     807ab6 <translate_attr+0x47>
        attr_s[2]='h';
  807aab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807aaf:	48 83 c0 02          	add    rax,0x2
  807ab3:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807ab6:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807aba:	83 e0 04             	and    eax,0x4
  807abd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807ac0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807ac4:	74 0b                	je     807ad1 <translate_attr+0x62>
        attr_s[4]='s';
  807ac6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807aca:	48 83 c0 04          	add    rax,0x4
  807ace:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807ad1:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807ad5:	83 e0 08             	and    eax,0x8
  807ad8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  807adb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807adf:	74 0b                	je     807aec <translate_attr+0x7d>
        attr_s[3]='v';
  807ae1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ae5:	48 83 c0 03          	add    rax,0x3
  807ae9:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  807aec:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807af0:	83 e0 10             	and    eax,0x10
  807af3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807af6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807afa:	74 0b                	je     807b07 <translate_attr+0x98>
        attr_s[3]='d';
  807afc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b00:	48 83 c0 03          	add    rax,0x3
  807b04:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807b07:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b0b:	48 83 c0 05          	add    rax,0x5
  807b0f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807b12:	90                   	nop
  807b13:	5d                   	pop    rbp
  807b14:	c3                   	ret    

0000000000807b15 <extend_cluster>:
int extend_cluster(short cluster)
{
  807b15:	f3 0f 1e fa          	endbr64 
  807b19:	55                   	push   rbp
  807b1a:	48 89 e5             	mov    rbp,rsp
  807b1d:	48 83 ec 18          	sub    rsp,0x18
  807b21:	89 f8                	mov    eax,edi
  807b23:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807b27:	b8 00 00 00 00       	mov    eax,0x0
  807b2c:	e8 0e fd ff ff       	call   80783f <req_cluster>
  807b31:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807b34:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807b38:	75 07                	jne    807b41 <extend_cluster+0x2c>
        return -1;
  807b3a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b3f:	eb 16                	jmp    807b57 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807b41:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807b45:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807b48:	48 98                	cdqe   
  807b4a:	66 89 94 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],dx
  807b51:	00 
    return 0;
  807b52:	b8 00 00 00 00       	mov    eax,0x0
}
  807b57:	c9                   	leave  
  807b58:	c3                   	ret    

0000000000807b59 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807b59:	f3 0f 1e fa          	endbr64 
  807b5d:	55                   	push   rbp
  807b5e:	48 89 e5             	mov    rbp,rsp
  807b61:	48 83 ec 60          	sub    rsp,0x60
  807b65:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  807b69:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b6d:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807b71:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807b75:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b79:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807b7c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  807b80:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  807b87:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  807b8e:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807b8f:	0f b6 05 77 29 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22977]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807b96:	0f b6 c0             	movzx  eax,al
  807b99:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  807b9d:	0f b7 ca             	movzx  ecx,dx
  807ba0:	8b 15 9a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a9a]        # 80a640 <clu_sec_balance>
  807ba6:	01 d1                	add    ecx,edx
  807ba8:	89 c2                	mov    edx,eax
  807baa:	89 ce                	mov    esi,ecx
  807bac:	bf 60 e5 42 00       	mov    edi,0x42e560
  807bb1:	e8 c9 03 00 00       	call   807f7f <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807bb6:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  807bba:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  807bbe:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807bc5:	e9 2e 01 00 00       	jmp    807cf8 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807bca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807bcd:	48 98                	cdqe   
  807bcf:	48 c1 e0 05          	shl    rax,0x5
  807bd3:	48 89 c2             	mov    rdx,rax
  807bd6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bda:	48 01 d0             	add    rax,rdx
  807bdd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807be0:	3c e5                	cmp    al,0xe5
  807be2:	74 1e                	je     807c02 <touch+0xa9>
            dir_table[i].name[0]==0)
  807be4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807be7:	48 98                	cdqe   
  807be9:	48 c1 e0 05          	shl    rax,0x5
  807bed:	48 89 c2             	mov    rdx,rax
  807bf0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bf4:	48 01 d0             	add    rax,rdx
  807bf7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807bfa:	84 c0                	test   al,al
  807bfc:	0f 85 f2 00 00 00    	jne    807cf4 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807c02:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c06:	48 89 c7             	mov    rdi,rax
  807c09:	e8 25 fb ff ff       	call   807733 <format_name>
                memcpy(dir_table[i].name,name,11);
  807c0e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c11:	48 98                	cdqe   
  807c13:	48 c1 e0 05          	shl    rax,0x5
  807c17:	48 89 c2             	mov    rdx,rax
  807c1a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c1e:	48 01 d0             	add    rax,rdx
  807c21:	48 89 c1             	mov    rcx,rax
  807c24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c28:	ba 0b 00 00 00       	mov    edx,0xb
  807c2d:	48 89 c6             	mov    rsi,rax
  807c30:	48 89 cf             	mov    rdi,rcx
  807c33:	e8 2e 1e 00 00       	call   809a66 <memcpy>
                int clu=req_cluster();
  807c38:	b8 00 00 00 00       	mov    eax,0x0
  807c3d:	e8 fd fb ff ff       	call   80783f <req_cluster>
  807c42:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807c45:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807c49:	75 0a                	jne    807c55 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  807c4b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c50:	e9 fc 00 00 00       	jmp    807d51 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807c55:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c58:	48 98                	cdqe   
  807c5a:	48 c1 e0 05          	shl    rax,0x5
  807c5e:	48 89 c2             	mov    rdx,rax
  807c61:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c65:	48 01 d0             	add    rax,rdx
  807c68:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  807c6b:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  807c6f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c72:	48 98                	cdqe   
  807c74:	48 c1 e0 05          	shl    rax,0x5
  807c78:	48 89 c2             	mov    rdx,rax
  807c7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c7f:	48 01 d0             	add    rax,rdx
  807c82:	be 20 00 00 00       	mov    esi,0x20
  807c87:	48 89 c7             	mov    rdi,rax
  807c8a:	e8 6f fc ff ff       	call   8078fe <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  807c8f:	0f b7 05 75 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22875]        # 42a50b <superblock+0xb>
  807c96:	0f b7 d0             	movzx  edx,ax
  807c99:	0f b6 05 6d 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2286d]        # 42a50d <superblock+0xd>
  807ca0:	0f b6 c0             	movzx  eax,al
  807ca3:	0f af d0             	imul   edx,eax
  807ca6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ca9:	48 98                	cdqe   
  807cab:	48 c1 e0 05          	shl    rax,0x5
  807caf:	48 89 c1             	mov    rcx,rax
  807cb2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807cb6:	48 01 c8             	add    rax,rcx
  807cb9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  807cbc:	0f b7 05 48 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22848]        # 42a50b <superblock+0xb>
  807cc3:	0f b7 d0             	movzx  edx,ax
  807cc6:	0f b6 05 40 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22840]        # 42a50d <superblock+0xd>
  807ccd:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807cd0:	0f af d0             	imul   edx,eax
  807cd3:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807cd7:	8b 05 63 29 00 00    	mov    eax,DWORD PTR [rip+0x2963]        # 80a640 <clu_sec_balance>
  807cdd:	01 c1                	add    ecx,eax
  807cdf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ce3:	89 ce                	mov    esi,ecx
  807ce5:	48 89 c7             	mov    rdi,rax
  807ce8:	e8 9e fb ff ff       	call   80788b <write_sec>
                return -1;
  807ced:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807cf2:	eb 5d                	jmp    807d51 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807cf4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807cf8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807cfb:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  807cfe:	0f 8c c6 fe ff ff    	jl     807bca <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807d04:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807d09:	77 36                	ja     807d41 <touch+0x1e8>
        {
            cluster=fat[cluster];
  807d0b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807d0f:	48 98                	cdqe   
  807d11:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807d18:	00 
  807d19:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807d1d:	0f b6 05 e9 27 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc227e9]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807d24:	0f b6 d0             	movzx  edx,al
  807d27:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d2b:	8b 05 0f 29 00 00    	mov    eax,DWORD PTR [rip+0x290f]        # 80a640 <clu_sec_balance>
  807d31:	01 c1                	add    ecx,eax
  807d33:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d37:	89 ce                	mov    esi,ecx
  807d39:	48 89 c7             	mov    rdi,rax
  807d3c:	e8 3e 02 00 00       	call   807f7f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807d41:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807d46:	0f 86 72 fe ff ff    	jbe    807bbe <touch+0x65>
    return 0;
  807d4c:	b8 00 00 00 00       	mov    eax,0x0
}
  807d51:	c9                   	leave  
  807d52:	c3                   	ret    

0000000000807d53 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807d53:	f3 0f 1e fa          	endbr64 
  807d57:	55                   	push   rbp
  807d58:	48 89 e5             	mov    rbp,rsp
  807d5b:	48 83 ec 50          	sub    rsp,0x50
  807d5f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807d63:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d67:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807d6b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807d6f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d73:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807d76:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  807d7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d7e:	48 89 c7             	mov    rdi,rax
  807d81:	e8 ad f9 ff ff       	call   807733 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  807d86:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807d8a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807d8e:	0f b6 05 78 27 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22778]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807d95:	0f b6 c0             	movzx  eax,al
  807d98:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d9c:	8b 15 9e 28 00 00    	mov    edx,DWORD PTR [rip+0x289e]        # 80a640 <clu_sec_balance>
  807da2:	01 d1                	add    ecx,edx
  807da4:	89 c2                	mov    edx,eax
  807da6:	89 ce                	mov    esi,ecx
  807da8:	bf 60 e5 42 00       	mov    edi,0x42e560
  807dad:	e8 cd 01 00 00       	call   807f7f <read_sec>
        for (int i = 0; i < 16; i++)
  807db2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807db9:	e9 8c 01 00 00       	jmp    807f4a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  807dbe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807dc1:	48 98                	cdqe   
  807dc3:	48 c1 e0 05          	shl    rax,0x5
  807dc7:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807dcd:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807dd0:	66 85 c0             	test   ax,ax
  807dd3:	74 30                	je     807e05 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807dd5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807dd8:	48 98                	cdqe   
  807dda:	48 c1 e0 05          	shl    rax,0x5
  807dde:	48 05 40 a5 42 00    	add    rax,0x42a540
  807de4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807de7:	3c e5                	cmp    al,0xe5
  807de9:	74 1a                	je     807e05 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  807deb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807dee:	48 98                	cdqe   
  807df0:	48 c1 e0 05          	shl    rax,0x5
  807df4:	48 05 40 a5 42 00    	add    rax,0x42a540
  807dfa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807dfd:	84 c0                	test   al,al
  807dff:	0f 85 41 01 00 00    	jne    807f46 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807e05:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e08:	48 98                	cdqe   
  807e0a:	48 c1 e0 05          	shl    rax,0x5
  807e0e:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e14:	ba 20 00 00 00       	mov    edx,0x20
  807e19:	be 00 00 00 00       	mov    esi,0x0
  807e1e:	48 89 c7             	mov    rdi,rax
  807e21:	e8 ef 1c 00 00       	call   809b15 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807e26:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e29:	48 98                	cdqe   
  807e2b:	48 c1 e0 05          	shl    rax,0x5
  807e2f:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e35:	ba 0b 00 00 00       	mov    edx,0xb
  807e3a:	be 20 00 00 00       	mov    esi,0x20
  807e3f:	48 89 c7             	mov    rdi,rax
  807e42:	e8 ce 1c 00 00       	call   809b15 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807e47:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e4a:	48 98                	cdqe   
  807e4c:	48 c1 e0 05          	shl    rax,0x5
  807e50:	48 8d 90 60 e5 42 00 	lea    rdx,[rax+0x42e560]
  807e57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e5b:	48 89 c6             	mov    rsi,rax
  807e5e:	48 89 d7             	mov    rdi,rdx
  807e61:	e8 fe 1c 00 00       	call   809b64 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807e66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e6a:	48 89 c7             	mov    rdi,rax
  807e6d:	e8 11 1f 00 00       	call   809d83 <strlen>
  807e72:	48 63 d0             	movsxd rdx,eax
  807e75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e78:	48 98                	cdqe   
  807e7a:	48 c1 e0 05          	shl    rax,0x5
  807e7e:	48 01 d0             	add    rax,rdx
  807e81:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e87:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  807e8a:	b8 00 00 00 00       	mov    eax,0x0
  807e8f:	e8 ab f9 ff ff       	call   80783f <req_cluster>
  807e94:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807e97:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  807e9b:	75 0a                	jne    807ea7 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  807e9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ea2:	e9 d6 00 00 00       	jmp    807f7d <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807ea7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807eaa:	89 c2                	mov    edx,eax
  807eac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807eaf:	48 98                	cdqe   
  807eb1:	48 c1 e0 05          	shl    rax,0x5
  807eb5:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807ebb:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  807ebe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ec1:	48 98                	cdqe   
  807ec3:	48 c1 e0 05          	shl    rax,0x5
  807ec7:	48 05 60 e5 42 00    	add    rax,0x42e560
  807ecd:	be 10 00 00 00       	mov    esi,0x10
  807ed2:	48 89 c7             	mov    rdi,rax
  807ed5:	e8 24 fa ff ff       	call   8078fe <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807eda:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807edd:	48 98                	cdqe   
  807edf:	48 c1 e0 05          	shl    rax,0x5
  807ee3:	48 05 7c e5 42 00    	add    rax,0x42e57c
  807ee9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807eef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ef2:	48 98                	cdqe   
  807ef4:	48 c1 e0 05          	shl    rax,0x5
  807ef8:	48 05 60 e5 42 00    	add    rax,0x42e560
  807efe:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807f01:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807f04:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807f07:	ff 30                	push   QWORD PTR [rax]
  807f09:	e8 7c fa ff ff       	call   80798a <add_dot_and_ddot_dir>
  807f0e:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807f12:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807f16:	8b 05 24 27 00 00    	mov    eax,DWORD PTR [rip+0x2724]        # 80a640 <clu_sec_balance>
  807f1c:	01 d0                	add    eax,edx
  807f1e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807f21:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f24:	ba 00 02 00 00       	mov    edx,0x200
  807f29:	89 c6                	mov    esi,eax
  807f2b:	bf 60 e5 42 00       	mov    edi,0x42e560
  807f30:	e8 56 f9 ff ff       	call   80788b <write_sec>
                update_fat_and_root();
  807f35:	b8 00 00 00 00       	mov    eax,0x0
  807f3a:	e8 e7 f9 ff ff       	call   807926 <update_fat_and_root>
                return 0;
  807f3f:	b8 00 00 00 00       	mov    eax,0x0
  807f44:	eb 37                	jmp    807f7d <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807f46:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807f4a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807f4e:	0f 8e 6a fe ff ff    	jle    807dbe <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807f54:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f59:	77 12                	ja     807f6d <mkdir+0x21a>
            cluster=fat[cluster];
  807f5b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f5f:	48 98                	cdqe   
  807f61:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807f68:	00 
  807f69:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807f6d:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f72:	0f 86 16 fe ff ff    	jbe    807d8e <mkdir+0x3b>
    return -1;
  807f78:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807f7d:	c9                   	leave  
  807f7e:	c3                   	ret    

0000000000807f7f <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807f7f:	f3 0f 1e fa          	endbr64 
  807f83:	55                   	push   rbp
  807f84:	48 89 e5             	mov    rbp,rsp
  807f87:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807f8e:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807f95:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807f9b:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807fa1:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807fa8:	b8 00 00 00 00       	mov    eax,0x0
  807fad:	b9 18 00 00 00       	mov    ecx,0x18
  807fb2:	48 89 d7             	mov    rdi,rdx
  807fb5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807fb8:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807fbe:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807fc4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807fcb:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807fd1:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807fd8:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807fdb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807fe2:	eb 3e                	jmp    808022 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807fe4:	48 8b 15 cd 25 00 00 	mov    rdx,QWORD PTR [rip+0x25cd]        # 80a5b8 <drv_disk+0x18>
  807feb:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807ff2:	48 89 c7             	mov    rdi,rax
  807ff5:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807ff7:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807ffd:	0f b7 05 07 25 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22507]        # 42a50b <superblock+0xb>
  808004:	0f b7 c0             	movzx  eax,ax
  808007:	01 d0                	add    eax,edx
  808009:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  80800f:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  808015:	83 c0 01             	add    eax,0x1
  808018:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  80801e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808022:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808025:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80802b:	7c b7                	jl     807fe4 <read_sec+0x65>
    }
    return 0;
  80802d:	b8 00 00 00 00       	mov    eax,0x0
}
  808032:	c9                   	leave  
  808033:	c3                   	ret    

0000000000808034 <rm>:

int rm(driver_args* args)
{
  808034:	f3 0f 1e fa          	endbr64 
  808038:	55                   	push   rbp
  808039:	48 89 e5             	mov    rbp,rsp
  80803c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  808043:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  80804a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808051:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808055:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  808059:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  808060:	b8 00 00 00 00       	mov    eax,0x0
  808065:	b9 18 00 00 00       	mov    ecx,0x18
  80806a:	48 89 d7             	mov    rdi,rdx
  80806d:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  808070:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808077:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  80807e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  808085:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  80808c:	48 89 c7             	mov    rdi,rax
  80808f:	e8 07 0a 00 00       	call   808a9b <get_entry>
  808094:	83 f8 ff             	cmp    eax,0xffffffff
  808097:	75 0a                	jne    8080a3 <rm+0x6f>
  808099:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80809e:	e9 a8 01 00 00       	jmp    80824b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  8080a3:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8080a9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  8080ad:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  8080b4:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  8080b5:	0f b6 05 51 24 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22451]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8080bc:	0f b6 c0             	movzx  eax,al
  8080bf:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  8080c3:	0f b7 ca             	movzx  ecx,dx
  8080c6:	8b 15 74 25 00 00    	mov    edx,DWORD PTR [rip+0x2574]        # 80a640 <clu_sec_balance>
  8080cc:	01 d1                	add    ecx,edx
  8080ce:	89 c2                	mov    edx,eax
  8080d0:	89 ce                	mov    esi,ecx
  8080d2:	bf 60 e5 42 00       	mov    edi,0x42e560
  8080d7:	e8 a3 fe ff ff       	call   807f7f <read_sec>
    dir_table=a_clu_of_dir;
  8080dc:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  8080e3:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  8080e4:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8080e8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  8080ec:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  8080f3:	e9 89 00 00 00       	jmp    808181 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8080f8:	0f b6 05 0e 24 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2240e]        # 42a50d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  8080ff:	0f b6 d0             	movzx  edx,al
  808102:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  808106:	8b 05 34 25 00 00    	mov    eax,DWORD PTR [rip+0x2534]        # 80a640 <clu_sec_balance>
  80810c:	01 c1                	add    ecx,eax
  80810e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808112:	89 ce                	mov    esi,ecx
  808114:	48 89 c7             	mov    rdi,rax
  808117:	e8 63 fe ff ff       	call   807f7f <read_sec>
        for(;i<16;i++)
  80811c:	eb 44                	jmp    808162 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  80811e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808121:	48 98                	cdqe   
  808123:	48 c1 e0 05          	shl    rax,0x5
  808127:	48 89 c2             	mov    rdx,rax
  80812a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80812e:	48 01 d0             	add    rax,rdx
  808131:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  808135:	0f b7 d0             	movzx  edx,ax
  808138:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80813f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808142:	39 c2                	cmp    edx,eax
  808144:	75 18                	jne    80815e <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  808146:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808149:	48 98                	cdqe   
  80814b:	48 c1 e0 05          	shl    rax,0x5
  80814f:	48 89 c2             	mov    rdx,rax
  808152:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808156:	48 01 d0             	add    rax,rdx
  808159:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  80815c:	eb 2f                	jmp    80818d <rm+0x159>
        for(;i<16;i++)
  80815e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808162:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  808166:	7e b6                	jle    80811e <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  808168:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80816d:	77 12                	ja     808181 <rm+0x14d>
        {
            cluster=fat[cluster];
  80816f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808173:	48 98                	cdqe   
  808175:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80817c:	00 
  80817d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  808181:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  808186:	0f 86 6c ff ff ff    	jbe    8080f8 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  80818c:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  80818d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808190:	48 98                	cdqe   
  808192:	48 c1 e0 05          	shl    rax,0x5
  808196:	48 89 c2             	mov    rdx,rax
  808199:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80819d:	48 01 d0             	add    rax,rdx
  8081a0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8081a4:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  8081a8:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  8081ad:	77 10                	ja     8081bf <rm+0x18b>
  8081af:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081b3:	48 98                	cdqe   
  8081b5:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8081bc:	00 
  8081bd:	eb 05                	jmp    8081c4 <rm+0x190>
  8081bf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8081c4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  8081c8:	eb 2a                	jmp    8081f4 <rm+0x1c0>
    {
        fat[del_clu]=0;
  8081ca:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081ce:	48 98                	cdqe   
  8081d0:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  8081d7:	00 00 00 
        del_clu=pion;
  8081da:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  8081de:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  8081e2:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  8081e6:	48 98                	cdqe   
  8081e8:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8081ef:	00 
  8081f0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  8081f4:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  8081f9:	76 cf                	jbe    8081ca <rm+0x196>
    }
    fat[del_clu]=0;
  8081fb:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081ff:	48 98                	cdqe   
  808201:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  808208:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  80820b:	0f b6 05 fb 22 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc222fb]        # 42a50d <superblock+0xd>
  808212:	0f b6 d0             	movzx  edx,al
  808215:	0f b7 05 ef 22 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc222ef]        # 42a50b <superblock+0xb>
  80821c:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  80821f:	0f af d0             	imul   edx,eax
  808222:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  808226:	8b 05 14 24 00 00    	mov    eax,DWORD PTR [rip+0x2414]        # 80a640 <clu_sec_balance>
  80822c:	01 c1                	add    ecx,eax
  80822e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808232:	89 ce                	mov    esi,ecx
  808234:	48 89 c7             	mov    rdi,rax
  808237:	e8 4f f6 ff ff       	call   80788b <write_sec>
    update_fat_and_root();
  80823c:	b8 00 00 00 00       	mov    eax,0x0
  808241:	e8 e0 f6 ff ff       	call   807926 <update_fat_and_root>
    return 0;
  808246:	b8 00 00 00 00       	mov    eax,0x0
}
  80824b:	c9                   	leave  
  80824c:	c3                   	ret    

000000000080824d <find>:
int find_f=0;
int find(char *name)
{
  80824d:	f3 0f 1e fa          	endbr64 
  808251:	55                   	push   rbp
  808252:	48 89 e5             	mov    rbp,rsp
  808255:	48 83 ec 30          	sub    rsp,0x30
  808259:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  80825d:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  808264:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  80826b:	48 c7 45 f0 60 e5 42 	mov    QWORD PTR [rbp-0x10],0x42e560
  808272:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808273:	0f b7 05 e0 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc262e0]        # 42e55a <cur_dir+0x1a>
  80827a:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  80827e:	0f b7 05 d5 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc262d5]        # 42e55a <cur_dir+0x1a>
  808285:	66 85 c0             	test   ax,ax
  808288:	75 0a                	jne    808294 <find+0x47>
        dir_table=root_dir;
  80828a:	48 c7 45 f0 40 a5 42 	mov    QWORD PTR [rbp-0x10],0x42a540
  808291:	00 
  808292:	eb 2b                	jmp    8082bf <find+0x72>
    else {
        max_files=16;
  808294:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  80829b:	0f b6 05 6b 22 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2226b]        # 42a50d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  8082a2:	0f b6 d0             	movzx  edx,al
  8082a5:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  8082a9:	8b 05 91 23 00 00    	mov    eax,DWORD PTR [rip+0x2391]        # 80a640 <clu_sec_balance>
  8082af:	01 c1                	add    ecx,eax
  8082b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082b5:	89 ce                	mov    esi,ecx
  8082b7:	48 89 c7             	mov    rdi,rax
  8082ba:	e8 c0 fc ff ff       	call   807f7f <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  8082bf:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8082c6:	eb 57                	jmp    80831f <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  8082c8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082cb:	48 98                	cdqe   
  8082cd:	48 c1 e0 05          	shl    rax,0x5
  8082d1:	48 89 c2             	mov    rdx,rax
  8082d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082d8:	48 01 d0             	add    rax,rdx
  8082db:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8082de:	84 c0                	test   al,al
  8082e0:	74 38                	je     80831a <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  8082e2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082e5:	48 98                	cdqe   
  8082e7:	48 c1 e0 05          	shl    rax,0x5
  8082eb:	48 89 c2             	mov    rdx,rax
  8082ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082f2:	48 01 d0             	add    rax,rdx
  8082f5:	48 89 c1             	mov    rcx,rax
  8082f8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082fc:	ba 0b 00 00 00       	mov    edx,0xb
  808301:	48 89 c6             	mov    rsi,rax
  808304:	48 89 cf             	mov    rdi,rcx
  808307:	e8 a4 17 00 00       	call   809ab0 <memcmp>
  80830c:	85 c0                	test   eax,eax
  80830e:	75 0b                	jne    80831b <find+0xce>
            {
                return index+i;
  808310:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  808313:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808316:	01 d0                	add    eax,edx
  808318:	eb 71                	jmp    80838b <find+0x13e>
                continue;
  80831a:	90                   	nop
        for(int i=0;i<max_files;i++)
  80831b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80831f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808322:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  808325:	7c a1                	jl     8082c8 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  808327:	0f b7 05 2c 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2622c]        # 42e55a <cur_dir+0x1a>
  80832e:	66 85 c0             	test   ax,ax
  808331:	75 07                	jne    80833a <find+0xed>
            return -1;
  808333:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808338:	eb 51                	jmp    80838b <find+0x13e>
        else if(cluster<FAT_EOF)
  80833a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  80833f:	77 3a                	ja     80837b <find+0x12e>
        {
            index+=16;
  808341:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  808345:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  808349:	48 98                	cdqe   
  80834b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808352:	00 
  808353:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808357:	0f b6 05 af 21 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc221af]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80835e:	0f b6 d0             	movzx  edx,al
  808361:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  808365:	8b 05 d5 22 00 00    	mov    eax,DWORD PTR [rip+0x22d5]        # 80a640 <clu_sec_balance>
  80836b:	01 c1                	add    ecx,eax
  80836d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808371:	89 ce                	mov    esi,ecx
  808373:	48 89 c7             	mov    rdi,rax
  808376:	e8 04 fc ff ff       	call   807f7f <read_sec>
        }
    }while(cluster<FAT_EOF);
  80837b:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  808380:	0f 86 39 ff ff ff    	jbe    8082bf <find+0x72>
    return -1;
  808386:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  80838b:	c9                   	leave  
  80838c:	c3                   	ret    

000000000080838d <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  80838d:	f3 0f 1e fa          	endbr64 
  808391:	55                   	push   rbp
  808392:	48 89 e5             	mov    rbp,rsp
  808395:	41 57                	push   r15
  808397:	41 56                	push   r14
  808399:	41 55                	push   r13
  80839b:	41 54                	push   r12
  80839d:	53                   	push   rbx
  80839e:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8083a5:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8083ac:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  8083b3:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  8083b9:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  8083bf:	48 89 e0             	mov    rax,rsp
  8083c2:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  8083c5:	bf 00 00 00 00       	mov    edi,0x0
  8083ca:	e8 7e fe ff ff       	call   80824d <find>
  8083cf:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  8083d2:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8083d6:	74 09                	je     8083e1 <read_file_byname+0x54>
  8083d8:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8083df:	79 0a                	jns    8083eb <read_file_byname+0x5e>
        return -1;
  8083e1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083e6:	e9 ea 02 00 00       	jmp    8086d5 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  8083eb:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  8083f2:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  8083f9:	00 
    int in_root=1;
  8083fa:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  808401:	0f b7 05 52 61 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26152]        # 42e55a <cur_dir+0x1a>
  808408:	66 85 c0             	test   ax,ax
  80840b:	74 40                	je     80844d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  80840d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  808414:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  80841b:	0f b6 05 eb 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc220eb]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  808422:	0f b6 c0             	movzx  eax,al
  808425:	0f b7 15 2e 61 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2612e]        # 42e55a <cur_dir+0x1a>
  80842c:	0f b7 ca             	movzx  ecx,dx
  80842f:	8b 15 0b 22 00 00    	mov    edx,DWORD PTR [rip+0x220b]        # 80a640 <clu_sec_balance>
  808435:	01 d1                	add    ecx,edx
  808437:	89 c2                	mov    edx,eax
  808439:	89 ce                	mov    esi,ecx
  80843b:	bf 60 e5 42 00       	mov    edi,0x42e560
  808440:	e8 3a fb ff ff       	call   807f7f <read_sec>
        dir_table=a_clu_of_dir;
  808445:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  80844c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  80844d:	0f b7 05 06 61 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26106]        # 42e55a <cur_dir+0x1a>
  808454:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808458:	eb 41                	jmp    80849b <read_file_byname+0x10e>
        index-=16;
  80845a:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  80845e:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808463:	77 36                	ja     80849b <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  808465:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808469:	48 98                	cdqe   
  80846b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808472:	00 
  808473:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808477:	0f b6 05 8f 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2208f]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80847e:	0f b6 d0             	movzx  edx,al
  808481:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  808485:	8b 05 b5 21 00 00    	mov    eax,DWORD PTR [rip+0x21b5]        # 80a640 <clu_sec_balance>
  80848b:	01 c1                	add    ecx,eax
  80848d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808491:	89 ce                	mov    esi,ecx
  808493:	48 89 c7             	mov    rdi,rax
  808496:	e8 e4 fa ff ff       	call   807f7f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  80849b:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  80849f:	75 0d                	jne    8084ae <read_file_byname+0x121>
  8084a1:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8084a5:	7e 07                	jle    8084ae <read_file_byname+0x121>
  8084a7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8084ac:	76 ac                	jbe    80845a <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  8084ae:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8084b1:	48 98                	cdqe   
  8084b3:	48 c1 e0 05          	shl    rax,0x5
  8084b7:	48 89 c2             	mov    rdx,rax
  8084ba:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8084be:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8084c2:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8084c5:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8084c9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  8084d0:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8084d7:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8084db:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8084df:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  8084e3:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  8084e7:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  8084eb:	0f b7 c0             	movzx  eax,ax
  8084ee:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  8084f1:	0f b7 05 13 20 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22013]        # 42a50b <superblock+0xb>
  8084f8:	0f b7 d0             	movzx  edx,ax
  8084fb:	0f b6 05 0b 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2200b]        # 42a50d <superblock+0xd>
  808502:	0f b6 c0             	movzx  eax,al
  808505:	0f af c2             	imul   eax,edx
  808508:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80850b:	eb 25                	jmp    808532 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  80850d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808510:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  808516:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808519:	48 98                	cdqe   
  80851b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808522:	00 
  808523:	98                   	cwde   
  808524:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  808527:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80852d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808530:	7c 0d                	jl     80853f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808532:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808538:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80853b:	7d d0                	jge    80850d <read_file_byname+0x180>
  80853d:	eb 01                	jmp    808540 <read_file_byname+0x1b3>
            break;
  80853f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808540:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808547:	7e 15                	jle    80855e <read_file_byname+0x1d1>
  808549:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80854f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808552:	7c 0a                	jl     80855e <read_file_byname+0x1d1>
        return -1;//pos out of range
  808554:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808559:	e9 77 01 00 00       	jmp    8086d5 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  80855e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808561:	48 63 d0             	movsxd rdx,eax
  808564:	48 83 ea 01          	sub    rdx,0x1
  808568:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  80856c:	48 63 d0             	movsxd rdx,eax
  80856f:	49 89 d6             	mov    r14,rdx
  808572:	41 bf 00 00 00 00    	mov    r15d,0x0
  808578:	48 63 d0             	movsxd rdx,eax
  80857b:	49 89 d4             	mov    r12,rdx
  80857e:	41 bd 00 00 00 00    	mov    r13d,0x0
  808584:	48 98                	cdqe   
  808586:	ba 10 00 00 00       	mov    edx,0x10
  80858b:	48 83 ea 01          	sub    rdx,0x1
  80858f:	48 01 d0             	add    rax,rdx
  808592:	be 10 00 00 00       	mov    esi,0x10
  808597:	ba 00 00 00 00       	mov    edx,0x0
  80859c:	48 f7 f6             	div    rsi
  80859f:	48 6b c0 10          	imul   rax,rax,0x10
  8085a3:	48 89 c1             	mov    rcx,rax
  8085a6:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8085ad:	48 89 e2             	mov    rdx,rsp
  8085b0:	48 29 ca             	sub    rdx,rcx
  8085b3:	48 39 d4             	cmp    rsp,rdx
  8085b6:	74 12                	je     8085ca <read_file_byname+0x23d>
  8085b8:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  8085bf:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  8085c6:	00 00 
  8085c8:	eb e9                	jmp    8085b3 <read_file_byname+0x226>
  8085ca:	48 89 c2             	mov    rdx,rax
  8085cd:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8085d3:	48 29 d4             	sub    rsp,rdx
  8085d6:	48 89 c2             	mov    rdx,rax
  8085d9:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8085df:	48 85 d2             	test   rdx,rdx
  8085e2:	74 10                	je     8085f4 <read_file_byname+0x267>
  8085e4:	25 ff 0f 00 00       	and    eax,0xfff
  8085e9:	48 83 e8 08          	sub    rax,0x8
  8085ed:	48 01 e0             	add    rax,rsp
  8085f0:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8085f4:	48 89 e0             	mov    rax,rsp
  8085f7:	48 83 c0 00          	add    rax,0x0
  8085fb:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  8085ff:	0f b6 05 07 1f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21f07]        # 42a50d <superblock+0xd>
  808606:	0f b6 d0             	movzx  edx,al
  808609:	8b 0d 31 20 00 00    	mov    ecx,DWORD PTR [rip+0x2031]        # 80a640 <clu_sec_balance>
  80860f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808612:	01 c1                	add    ecx,eax
  808614:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808618:	89 ce                	mov    esi,ecx
  80861a:	48 89 c7             	mov    rdi,rax
  80861d:	e8 5d f9 ff ff       	call   807f7f <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808622:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808625:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80862b:	89 c2                	mov    edx,eax
  80862d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808633:	48 63 c8             	movsxd rcx,eax
  808636:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80863a:	48 01 c1             	add    rcx,rax
  80863d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808644:	48 89 ce             	mov    rsi,rcx
  808647:	48 89 c7             	mov    rdi,rax
  80864a:	e8 17 14 00 00       	call   809a66 <memcpy>
    dist+=cluster_size-pos;
  80864f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808652:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  808658:	48 98                	cdqe   
  80865a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  808661:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808664:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80866a:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808670:	eb 4c                	jmp    8086be <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  808672:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808675:	48 98                	cdqe   
  808677:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80867e:	00 
  80867f:	98                   	cwde   
  808680:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  808683:	0f b6 05 83 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21e83]        # 42a50d <superblock+0xd>
  80868a:	0f b6 d0             	movzx  edx,al
  80868d:	8b 0d ad 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1fad]        # 80a640 <clu_sec_balance>
  808693:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808696:	01 c1                	add    ecx,eax
  808698:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80869f:	89 ce                	mov    esi,ecx
  8086a1:	48 89 c7             	mov    rdi,rax
  8086a4:	e8 d6 f8 ff ff       	call   807f7f <read_sec>
        dist+=cluster_size;
  8086a9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8086ac:	48 98                	cdqe   
  8086ae:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8086b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8086b8:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  8086be:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8086c5:	7f 09                	jg     8086d0 <read_file_byname+0x343>
  8086c7:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  8086ce:	7f a2                	jg     808672 <read_file_byname+0x2e5>
    }
    return 0;
  8086d0:	b8 00 00 00 00       	mov    eax,0x0
  8086d5:	48 89 dc             	mov    rsp,rbx
    
}
  8086d8:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8086dc:	5b                   	pop    rbx
  8086dd:	41 5c                	pop    r12
  8086df:	41 5d                	pop    r13
  8086e1:	41 5e                	pop    r14
  8086e3:	41 5f                	pop    r15
  8086e5:	5d                   	pop    rbp
  8086e6:	c3                   	ret    

00000000008086e7 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  8086e7:	f3 0f 1e fa          	endbr64 
  8086eb:	55                   	push   rbp
  8086ec:	48 89 e5             	mov    rbp,rsp
  8086ef:	41 57                	push   r15
  8086f1:	41 56                	push   r14
  8086f3:	41 55                	push   r13
  8086f5:	41 54                	push   r12
  8086f7:	53                   	push   rbx
  8086f8:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8086ff:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808706:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80870d:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808713:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808719:	48 89 e0             	mov    rax,rsp
  80871c:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80871f:	bf 00 00 00 00       	mov    edi,0x0
  808724:	e8 24 fb ff ff       	call   80824d <find>
  808729:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80872c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808730:	74 09                	je     80873b <write_file_byname+0x54>
  808732:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808739:	79 0a                	jns    808745 <write_file_byname+0x5e>
        return -1;
  80873b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808740:	e9 1e 03 00 00       	jmp    808a63 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808745:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80874c:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  808753:	00 
    int in_root=1;
  808754:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80875b:	0f b7 05 f8 5d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25df8]        # 42e55a <cur_dir+0x1a>
  808762:	66 85 c0             	test   ax,ax
  808765:	74 40                	je     8087a7 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  808767:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  80876e:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  808775:	0f b6 05 91 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d91]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  80877c:	0f b6 c0             	movzx  eax,al
  80877f:	0f b7 15 d4 5d c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc25dd4]        # 42e55a <cur_dir+0x1a>
  808786:	0f b7 ca             	movzx  ecx,dx
  808789:	8b 15 b1 1e 00 00    	mov    edx,DWORD PTR [rip+0x1eb1]        # 80a640 <clu_sec_balance>
  80878f:	01 d1                	add    ecx,edx
  808791:	89 c2                	mov    edx,eax
  808793:	89 ce                	mov    esi,ecx
  808795:	bf 60 e5 42 00       	mov    edi,0x42e560
  80879a:	e8 e0 f7 ff ff       	call   807f7f <read_sec>
        dir_table=a_clu_of_dir;
  80879f:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  8087a6:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8087a7:	0f b7 05 ac 5d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25dac]        # 42e55a <cur_dir+0x1a>
  8087ae:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8087b2:	eb 41                	jmp    8087f5 <write_file_byname+0x10e>
        index-=16;
  8087b4:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  8087b8:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8087bd:	77 36                	ja     8087f5 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  8087bf:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  8087c3:	48 98                	cdqe   
  8087c5:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8087cc:	00 
  8087cd:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8087d1:	0f b6 05 35 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d35]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  8087d8:	0f b6 d0             	movzx  edx,al
  8087db:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8087df:	8b 05 5b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e5b]        # 80a640 <clu_sec_balance>
  8087e5:	01 c1                	add    ecx,eax
  8087e7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8087eb:	89 ce                	mov    esi,ecx
  8087ed:	48 89 c7             	mov    rdi,rax
  8087f0:	e8 8a f7 ff ff       	call   807f7f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8087f5:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8087f9:	75 0d                	jne    808808 <write_file_byname+0x121>
  8087fb:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8087ff:	7e 07                	jle    808808 <write_file_byname+0x121>
  808801:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808806:	76 ac                	jbe    8087b4 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808808:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80880b:	48 98                	cdqe   
  80880d:	48 c1 e0 05          	shl    rax,0x5
  808811:	48 89 c2             	mov    rdx,rax
  808814:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808818:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80881c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80881f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808823:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80882a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808831:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808835:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808839:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80883d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808841:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808845:	0f b7 c0             	movzx  eax,ax
  808848:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80884b:	0f b7 05 b9 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21cb9]        # 42a50b <superblock+0xb>
  808852:	0f b7 d0             	movzx  edx,ax
  808855:	0f b6 05 b1 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21cb1]        # 42a50d <superblock+0xd>
  80885c:	0f b6 c0             	movzx  eax,al
  80885f:	0f af c2             	imul   eax,edx
  808862:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808865:	eb 25                	jmp    80888c <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  808867:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80886a:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  808870:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808876:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808879:	7c 1e                	jl     808899 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  80887b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80887e:	48 98                	cdqe   
  808880:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808887:	00 
  808888:	98                   	cwde   
  808889:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80888c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808892:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808895:	7d d0                	jge    808867 <write_file_byname+0x180>
  808897:	eb 01                	jmp    80889a <write_file_byname+0x1b3>
            break;
  808899:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  80889a:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8088a1:	7e 15                	jle    8088b8 <write_file_byname+0x1d1>
  8088a3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8088a9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8088ac:	7c 0a                	jl     8088b8 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8088ae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8088b3:	e9 ab 01 00 00       	jmp    808a63 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  8088b8:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8088bb:	48 63 d0             	movsxd rdx,eax
  8088be:	48 83 ea 01          	sub    rdx,0x1
  8088c2:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  8088c6:	48 63 d0             	movsxd rdx,eax
  8088c9:	49 89 d6             	mov    r14,rdx
  8088cc:	41 bf 00 00 00 00    	mov    r15d,0x0
  8088d2:	48 63 d0             	movsxd rdx,eax
  8088d5:	49 89 d4             	mov    r12,rdx
  8088d8:	41 bd 00 00 00 00    	mov    r13d,0x0
  8088de:	48 98                	cdqe   
  8088e0:	ba 10 00 00 00       	mov    edx,0x10
  8088e5:	48 83 ea 01          	sub    rdx,0x1
  8088e9:	48 01 d0             	add    rax,rdx
  8088ec:	be 10 00 00 00       	mov    esi,0x10
  8088f1:	ba 00 00 00 00       	mov    edx,0x0
  8088f6:	48 f7 f6             	div    rsi
  8088f9:	48 6b c0 10          	imul   rax,rax,0x10
  8088fd:	48 89 c1             	mov    rcx,rax
  808900:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808907:	48 89 e2             	mov    rdx,rsp
  80890a:	48 29 ca             	sub    rdx,rcx
  80890d:	48 39 d4             	cmp    rsp,rdx
  808910:	74 12                	je     808924 <write_file_byname+0x23d>
  808912:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808919:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808920:	00 00 
  808922:	eb e9                	jmp    80890d <write_file_byname+0x226>
  808924:	48 89 c2             	mov    rdx,rax
  808927:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80892d:	48 29 d4             	sub    rsp,rdx
  808930:	48 89 c2             	mov    rdx,rax
  808933:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808939:	48 85 d2             	test   rdx,rdx
  80893c:	74 10                	je     80894e <write_file_byname+0x267>
  80893e:	25 ff 0f 00 00       	and    eax,0xfff
  808943:	48 83 e8 08          	sub    rax,0x8
  808947:	48 01 e0             	add    rax,rsp
  80894a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80894e:	48 89 e0             	mov    rax,rsp
  808951:	48 83 c0 00          	add    rax,0x0
  808955:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808959:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808960:	0f 8e a2 00 00 00    	jle    808a08 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808966:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808969:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80896f:	89 c2                	mov    edx,eax
  808971:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808977:	48 63 c8             	movsxd rcx,eax
  80897a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80897e:	48 01 c1             	add    rcx,rax
  808981:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808988:	48 89 c6             	mov    rsi,rax
  80898b:	48 89 cf             	mov    rdi,rcx
  80898e:	e8 d3 10 00 00       	call   809a66 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808993:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808996:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80899c:	89 c2                	mov    edx,eax
  80899e:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8089a1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8089a5:	89 ce                	mov    esi,ecx
  8089a7:	48 89 c7             	mov    rdi,rax
  8089aa:	e8 dc ee ff ff       	call   80788b <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8089af:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089b2:	48 98                	cdqe   
  8089b4:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8089bb:	00 
  8089bc:	98                   	cwde   
  8089bd:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8089c0:	eb 46                	jmp    808a08 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  8089c2:	8b 15 78 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c78]        # 80a640 <clu_sec_balance>
  8089c8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089cb:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8089ce:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8089d1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8089d8:	89 ce                	mov    esi,ecx
  8089da:	48 89 c7             	mov    rdi,rax
  8089dd:	e8 a9 ee ff ff       	call   80788b <write_sec>
        src+=cluster_size;
  8089e2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8089e5:	48 98                	cdqe   
  8089e7:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8089ee:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8089f1:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8089f7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089fa:	48 98                	cdqe   
  8089fc:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808a03:	00 
  808a04:	98                   	cwde   
  808a05:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808a08:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808a0f:	7f 0b                	jg     808a1c <write_file_byname+0x335>
  808a11:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808a17:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808a1a:	7d a6                	jge    8089c2 <write_file_byname+0x2db>
    }
    if(len>0)
  808a1c:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808a23:	7e 39                	jle    808a5e <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808a25:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  808a2b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808a32:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a36:	48 89 ce             	mov    rsi,rcx
  808a39:	48 89 c7             	mov    rdi,rax
  808a3c:	e8 25 10 00 00       	call   809a66 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808a41:	8b 15 f9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bf9]        # 80a640 <clu_sec_balance>
  808a47:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808a4a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808a4d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808a50:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a54:	89 ce                	mov    esi,ecx
  808a56:	48 89 c7             	mov    rdi,rax
  808a59:	e8 2d ee ff ff       	call   80788b <write_sec>
    }
    return 0;
  808a5e:	b8 00 00 00 00       	mov    eax,0x0
  808a63:	48 89 dc             	mov    rsp,rbx

}
  808a66:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  808a6a:	5b                   	pop    rbx
  808a6b:	41 5c                	pop    r12
  808a6d:	41 5d                	pop    r13
  808a6f:	41 5e                	pop    r14
  808a71:	41 5f                	pop    r15
  808a73:	5d                   	pop    rbp
  808a74:	c3                   	ret    

0000000000808a75 <file_exist>:


int file_exist(dir_entry entry)
{
  808a75:	f3 0f 1e fa          	endbr64 
  808a79:	55                   	push   rbp
  808a7a:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  808a7d:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  808a81:	3c e5                	cmp    al,0xe5
  808a83:	74 08                	je     808a8d <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  808a85:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  808a89:	84 c0                	test   al,al
  808a8b:	75 07                	jne    808a94 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  808a8d:	b8 00 00 00 00       	mov    eax,0x0
  808a92:	eb 05                	jmp    808a99 <file_exist+0x24>

    }
    return 1;
  808a94:	b8 01 00 00 00       	mov    eax,0x1
}
  808a99:	5d                   	pop    rbp
  808a9a:	c3                   	ret    

0000000000808a9b <get_entry>:
int get_entry(driver_args* args)
{
  808a9b:	f3 0f 1e fa          	endbr64 
  808a9f:	55                   	push   rbp
  808aa0:	48 89 e5             	mov    rbp,rsp
  808aa3:	53                   	push   rbx
  808aa4:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  808aab:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808ab2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808ab9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808abd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808ac1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808ac8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  808acf:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808ad2:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808ad6:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  808ada:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ade:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808ae2:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808ae9:	e9 2c 01 00 00       	jmp    808c1a <get_entry+0x17f>
    {
        if(*name=='/')
  808aee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808af2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808af5:	3c 2f                	cmp    al,0x2f
  808af7:	0f 85 18 01 00 00    	jne    808c15 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  808afd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b01:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808b05:	48 83 f8 0b          	cmp    rax,0xb
  808b09:	7e 0a                	jle    808b15 <get_entry+0x7a>
  808b0b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b10:	e9 50 02 00 00       	jmp    808d65 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808b15:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b19:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808b1d:	89 c2                	mov    edx,eax
  808b1f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808b23:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b2a:	48 89 ce             	mov    rsi,rcx
  808b2d:	48 89 c7             	mov    rdi,rax
  808b30:	e8 31 0f 00 00       	call   809a66 <memcpy>
            cur_dir=dir;
  808b35:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808b39:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808b3d:	48 89 05 fc 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259fc],rax        # 42e540 <cur_dir>
  808b44:	48 89 15 fd 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259fd],rdx        # 42e548 <cur_dir+0x8>
  808b4b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808b4f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b53:	48 89 05 f6 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259f6],rax        # 42e550 <cur_dir+0x10>
  808b5a:	48 89 15 f7 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259f7],rdx        # 42e558 <cur_dir+0x18>
            format_name(nametmp);
  808b61:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b68:	48 89 c7             	mov    rdi,rax
  808b6b:	e8 c3 eb ff ff       	call   807733 <format_name>
            index= find(nametmp);
  808b70:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b77:	48 89 c7             	mov    rdi,rax
  808b7a:	e8 ce f6 ff ff       	call   80824d <find>
  808b7f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  808b82:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808b86:	75 0a                	jne    808b92 <get_entry+0xf7>
  808b88:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b8d:	e9 d3 01 00 00       	jmp    808d65 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808b92:	0f b7 05 c1 59 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc259c1]        # 42e55a <cur_dir+0x1a>
  808b99:	66 85 c0             	test   ax,ax
  808b9c:	75 31                	jne    808bcf <get_entry+0x134>
                dir=root_dir[index];
  808b9e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808ba1:	48 98                	cdqe   
  808ba3:	48 c1 e0 05          	shl    rax,0x5
  808ba7:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808bae:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808bb1:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808bb5:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808bb9:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808bbd:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808bc1:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808bc5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808bc9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  808bcd:	eb 3a                	jmp    808c09 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  808bcf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808bd2:	99                   	cdq    
  808bd3:	c1 ea 1c             	shr    edx,0x1c
  808bd6:	01 d0                	add    eax,edx
  808bd8:	83 e0 0f             	and    eax,0xf
  808bdb:	29 d0                	sub    eax,edx
  808bdd:	48 98                	cdqe   
  808bdf:	48 c1 e0 05          	shl    rax,0x5
  808be3:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808bea:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808bed:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808bf1:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808bf5:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808bf9:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808bfd:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808c01:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808c05:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808c09:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c0d:	48 83 c0 01          	add    rax,0x1
  808c11:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808c15:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  808c1a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c1e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c21:	84 c0                	test   al,al
  808c23:	0f 85 c5 fe ff ff    	jne    808aee <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808c29:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808c2d:	48 89 c7             	mov    rdi,rax
  808c30:	e8 fe ea ff ff       	call   807733 <format_name>
    index= find(p);
  808c35:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808c39:	48 89 c7             	mov    rdi,rax
  808c3c:	e8 0c f6 ff ff       	call   80824d <find>
  808c41:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808c44:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808c48:	75 0a                	jne    808c54 <get_entry+0x1b9>
  808c4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808c4f:	e9 11 01 00 00       	jmp    808d65 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808c54:	0f b7 05 ff 58 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc258ff]        # 42e55a <cur_dir+0x1a>
  808c5b:	66 85 c0             	test   ax,ax
  808c5e:	75 31                	jne    808c91 <get_entry+0x1f6>
        entry=root_dir[index];
  808c60:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808c63:	48 98                	cdqe   
  808c65:	48 c1 e0 05          	shl    rax,0x5
  808c69:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808c70:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808c73:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808c77:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808c7b:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808c7f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808c83:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808c87:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808c8b:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  808c8f:	eb 3a                	jmp    808ccb <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808c91:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808c94:	99                   	cdq    
  808c95:	c1 ea 1c             	shr    edx,0x1c
  808c98:	01 d0                	add    eax,edx
  808c9a:	83 e0 0f             	and    eax,0xf
  808c9d:	29 d0                	sub    eax,edx
  808c9f:	48 98                	cdqe   
  808ca1:	48 c1 e0 05          	shl    rax,0x5
  808ca5:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808cac:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808caf:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808cb3:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808cb7:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808cbb:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808cbf:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808cc3:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808cc7:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  808ccb:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  808ccf:	0f b7 c0             	movzx  eax,ax
  808cd2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808cd8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808cdf:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808ce6:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  808ced:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808cf1:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808cf5:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  808cfc:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808d03:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808d07:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  808d0b:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808d12:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808d19:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  808d1d:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808d21:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808d28:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  808d2f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808d33:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808d37:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  808d3e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808d45:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808d49:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  808d4d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808d51:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808d55:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808d59:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808d60:	b8 00 00 00 00       	mov    eax,0x0
}
  808d65:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  808d69:	c9                   	leave  
  808d6a:	c3                   	ret    

0000000000808d6b <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  808d6b:	f3 0f 1e fa          	endbr64 
  808d6f:	55                   	push   rbp
  808d70:	48 89 e5             	mov    rbp,rsp
  808d73:	48 83 ec 20          	sub    rsp,0x20
  808d77:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808d7b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  808d7f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d83:	be 2f 00 00 00       	mov    esi,0x2f
  808d88:	48 89 c7             	mov    rdi,rax
  808d8b:	e8 18 0e 00 00       	call   809ba8 <strtok>
  808d90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808d94:	eb 1b                	jmp    808db1 <get_fname+0x46>
    {
        prev=ptr;
  808d96:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d9a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  808d9e:	be 2f 00 00 00       	mov    esi,0x2f
  808da3:	bf 00 00 00 00       	mov    edi,0x0
  808da8:	e8 fb 0d 00 00       	call   809ba8 <strtok>
  808dad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808db1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808db6:	75 de                	jne    808d96 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808db8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808dbc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808dc0:	48 89 d6             	mov    rsi,rdx
  808dc3:	48 89 c7             	mov    rdi,rax
  808dc6:	e8 99 0d 00 00       	call   809b64 <strcpy>
}
  808dcb:	90                   	nop
  808dcc:	c9                   	leave  
  808dcd:	c3                   	ret    

0000000000808dce <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808dce:	f3 0f 1e fa          	endbr64 
  808dd2:	55                   	push   rbp
  808dd3:	48 89 e5             	mov    rbp,rsp
  808dd6:	48 83 ec 60          	sub    rsp,0x60
  808dda:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808dde:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808de2:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808de5:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808de8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808dec:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808def:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808df2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808df6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808df9:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808dfd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808e01:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e04:	48 98                	cdqe   
  808e06:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808e0a:	0f b7 05 fa 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216fa]        # 42a50b <superblock+0xb>
  808e11:	0f b7 f0             	movzx  esi,ax
  808e14:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808e17:	99                   	cdq    
  808e18:	f7 fe                	idiv   esi
  808e1a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808e1d:	0f b7 05 e7 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216e7]        # 42a50b <superblock+0xb>
  808e24:	0f b7 c8             	movzx  ecx,ax
  808e27:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808e2a:	99                   	cdq    
  808e2b:	f7 f9                	idiv   ecx
  808e2d:	89 d0                	mov    eax,edx
  808e2f:	85 c0                	test   eax,eax
  808e31:	0f 95 c0             	setne  al
  808e34:	0f b6 c0             	movzx  eax,al
  808e37:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  808e3a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808e41:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808e45:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808e49:	0f b7 05 bb 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216bb]        # 42a50b <superblock+0xb>
  808e50:	0f b7 f8             	movzx  edi,ax
  808e53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e56:	99                   	cdq    
  808e57:	f7 ff                	idiv   edi
  808e59:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e5c:	eb 16                	jmp    808e74 <read_file+0xa6>
    {
         clu=fat[clu];
  808e5e:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808e62:	48 98                	cdqe   
  808e64:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808e6b:	00 
  808e6c:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e70:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808e74:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808e79:	77 06                	ja     808e81 <read_file+0xb3>
  808e7b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808e7f:	7f dd                	jg     808e5e <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808e81:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808e85:	7e 0a                	jle    808e91 <read_file+0xc3>
  808e87:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808e8c:	e9 cd 00 00 00       	jmp    808f5e <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808e91:	0f b7 05 73 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21673]        # 42a50b <superblock+0xb>
  808e98:	0f b7 c8             	movzx  ecx,ax
  808e9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e9e:	99                   	cdq    
  808e9f:	f7 f9                	idiv   ecx
  808ea1:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808ea4:	0f b6 05 62 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21662]        # 42a50d <superblock+0xd>
  808eab:	0f b6 d0             	movzx  edx,al
  808eae:	0f b7 05 56 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21656]        # 42a50b <superblock+0xb>
  808eb5:	0f b7 c0             	movzx  eax,ax
  808eb8:	0f af c2             	imul   eax,edx
  808ebb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  808ebe:	e9 89 00 00 00       	jmp    808f4c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808ec3:	0f b6 05 43 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21643]        # 42a50d <superblock+0xd>
  808eca:	0f b6 c0             	movzx  eax,al
  808ecd:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808ed1:	8b 15 69 17 00 00    	mov    edx,DWORD PTR [rip+0x1769]        # 80a640 <clu_sec_balance>
  808ed7:	01 d1                	add    ecx,edx
  808ed9:	89 c2                	mov    edx,eax
  808edb:	89 ce                	mov    esi,ecx
  808edd:	bf 80 27 43 00       	mov    edi,0x432780
  808ee2:	e8 98 f0 ff ff       	call   807f7f <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808ee7:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808eea:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808eed:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808ef0:	39 c2                	cmp    edx,eax
  808ef2:	0f 4e c2             	cmovle eax,edx
  808ef5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808ef8:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  808efb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808efe:	48 98                	cdqe   
  808f00:	48 8d 88 80 27 43 00 	lea    rcx,[rax+0x432780]
  808f07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808f0b:	48 89 ce             	mov    rsi,rcx
  808f0e:	48 89 c7             	mov    rdi,rax
  808f11:	e8 50 0b 00 00       	call   809a66 <memcpy>
        n++;
  808f16:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808f1a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808f1d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808f20:	48 98                	cdqe   
  808f22:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808f26:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808f2a:	7e 07                	jle    808f33 <read_file+0x165>
  808f2c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808f33:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808f37:	48 98                	cdqe   
  808f39:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808f40:	00 
  808f41:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808f45:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808f4a:	77 0e                	ja     808f5a <read_file+0x18c>
    while(n<c)
  808f4c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f4f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808f52:	0f 8c 6b ff ff ff    	jl     808ec3 <read_file+0xf5>
  808f58:	eb 01                	jmp    808f5b <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808f5a:	90                   	nop
    }
    return n;
  808f5b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808f5e:	c9                   	leave  
  808f5f:	c3                   	ret    

0000000000808f60 <write_file>:
int write_file(driver_args* args)
{
  808f60:	f3 0f 1e fa          	endbr64 
  808f64:	55                   	push   rbp
  808f65:	48 89 e5             	mov    rbp,rsp
  808f68:	48 83 ec 50          	sub    rsp,0x50
  808f6c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808f70:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f74:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f77:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808f7a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f7e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808f81:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808f84:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f88:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808f8b:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808f8f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f93:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808f96:	48 98                	cdqe   
  808f98:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808f9c:	0f b7 05 68 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21568]        # 42a50b <superblock+0xb>
  808fa3:	0f b7 f0             	movzx  esi,ax
  808fa6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808fa9:	99                   	cdq    
  808faa:	f7 fe                	idiv   esi
  808fac:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808faf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808fb2:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808fb8:	85 c0                	test   eax,eax
  808fba:	0f 48 c2             	cmovs  eax,edx
  808fbd:	c1 f8 09             	sar    eax,0x9
  808fc0:	89 c1                	mov    ecx,eax
  808fc2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808fc5:	99                   	cdq    
  808fc6:	c1 ea 17             	shr    edx,0x17
  808fc9:	01 d0                	add    eax,edx
  808fcb:	25 ff 01 00 00       	and    eax,0x1ff
  808fd0:	29 d0                	sub    eax,edx
  808fd2:	01 c8                	add    eax,ecx
  808fd4:	85 c0                	test   eax,eax
  808fd6:	0f 95 c0             	setne  al
  808fd9:	0f b6 c0             	movzx  eax,al
  808fdc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808fdf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808fe6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808fea:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808fee:	eb 16                	jmp    809006 <write_file+0xa6>
  808ff0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808ff4:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ff8:	48 98                	cdqe   
  808ffa:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  809001:	00 
  809002:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  809006:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80900b:	77 06                	ja     809013 <write_file+0xb3>
  80900d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809011:	7f dd                	jg     808ff0 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  809013:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809017:	7e 52                	jle    80906b <write_file+0x10b>
  809019:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80901e:	eb 59                	jmp    809079 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  809020:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  809024:	8b 05 16 16 00 00    	mov    eax,DWORD PTR [rip+0x1616]        # 80a640 <clu_sec_balance>
  80902a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80902d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809031:	ba 01 00 00 00       	mov    edx,0x1
  809036:	89 ce                	mov    esi,ecx
  809038:	48 89 c7             	mov    rdi,rax
  80903b:	e8 4b e8 ff ff       	call   80788b <write_sec>
        n++;
  809040:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  809044:	0f b7 05 c0 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc214c0]        # 42a50b <superblock+0xb>
  80904b:	0f b7 c0             	movzx  eax,ax
  80904e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  809052:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  809056:	48 98                	cdqe   
  809058:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80905f:	00 
  809060:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  809064:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  809069:	77 0a                	ja     809075 <write_file+0x115>
    while(n<c)
  80906b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80906e:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809071:	7c ad                	jl     809020 <write_file+0xc0>
  809073:	eb 01                	jmp    809076 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  809075:	90                   	nop
    }
    return n;
  809076:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  809079:	c9                   	leave  
  80907a:	c3                   	ret    

000000000080907b <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80907b:	f3 0f 1e fa          	endbr64 
  80907f:	55                   	push   rbp
  809080:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809083:	48 8b 05 06 9b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29b06]        # 432b90 <vpage_base>
  80908a:	48 05 a0 00 00 00    	add    rax,0xa0
  809090:	48 89 05 f9 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29af9],rax        # 432b90 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809097:	8b 05 fb 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29afb]        # 432b98 <page_boffset>
  80909d:	05 a0 00 00 00       	add    eax,0xa0
  8090a2:	89 05 f0 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29af0],eax        # 432b98 <page_boffset>
    if(vpage_base>=video_end)
  8090a8:	48 8b 15 e1 9a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc29ae1]        # 432b90 <vpage_base>
  8090af:	48 8b 05 d2 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29ad2]        # 432b88 <video_end>
  8090b6:	48 39 c2             	cmp    rdx,rax
  8090b9:	72 0e                	jb     8090c9 <scrdown+0x4e>
        vpage_base=video_base;
  8090bb:	48 8b 05 be 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29abe]        # 432b80 <video_base>
  8090c2:	48 89 05 c7 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29ac7],rax        # 432b90 <vpage_base>
    set_origin();
  8090c9:	b8 00 00 00 00       	mov    eax,0x0
  8090ce:	e8 6a 00 00 00       	call   80913d <set_origin>
}
  8090d3:	90                   	nop
  8090d4:	5d                   	pop    rbp
  8090d5:	c3                   	ret    

00000000008090d6 <scrup>:
void scrup()
{
  8090d6:	f3 0f 1e fa          	endbr64 
  8090da:	55                   	push   rbp
  8090db:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  8090de:	8b 05 b4 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29ab4]        # 432b98 <page_boffset>
  8090e4:	85 c0                	test   eax,eax
  8090e6:	75 24                	jne    80910c <scrup+0x36>
    {
        page_boffset=0;
  8090e8:	c7 05 a6 9a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29aa6],0x0        # 432b98 <page_boffset>
  8090ef:	00 00 00 
        vpage_base=video_base;
  8090f2:	48 8b 05 87 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29a87]        # 432b80 <video_base>
  8090f9:	48 89 05 90 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29a90],rax        # 432b90 <vpage_base>
        set_origin();
  809100:	b8 00 00 00 00       	mov    eax,0x0
  809105:	e8 33 00 00 00       	call   80913d <set_origin>
        return;
  80910a:	eb 2f                	jmp    80913b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80910c:	48 8b 05 7d 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29a7d]        # 432b90 <vpage_base>
  809113:	48 2d a0 00 00 00    	sub    rax,0xa0
  809119:	48 89 05 70 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29a70],rax        # 432b90 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809120:	8b 05 72 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a72]        # 432b98 <page_boffset>
  809126:	2d a0 00 00 00       	sub    eax,0xa0
  80912b:	89 05 67 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29a67],eax        # 432b98 <page_boffset>
    set_origin();
  809131:	b8 00 00 00 00       	mov    eax,0x0
  809136:	e8 02 00 00 00       	call   80913d <set_origin>
}
  80913b:	5d                   	pop    rbp
  80913c:	c3                   	ret    

000000000080913d <set_origin>:
void set_origin(void)
{
  80913d:	f3 0f 1e fa          	endbr64 
  809141:	55                   	push   rbp
  809142:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809145:	fa                   	cli    
    outb(port_reg_index,12);
  809146:	8b 05 5c 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a5c]        # 432ba8 <port_reg_index>
  80914c:	0f b7 c0             	movzx  eax,ax
  80914f:	be 0c 00 00 00       	mov    esi,0xc
  809154:	89 c7                	mov    edi,eax
  809156:	e8 75 bd ff ff       	call   804ed0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80915b:	8b 05 37 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a37]        # 432b98 <page_boffset>
  809161:	c1 e8 09             	shr    eax,0x9
  809164:	0f b6 d0             	movzx  edx,al
  809167:	8b 05 3f 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a3f]        # 432bac <port_reg_v>
  80916d:	0f b7 c0             	movzx  eax,ax
  809170:	89 d6                	mov    esi,edx
  809172:	89 c7                	mov    edi,eax
  809174:	e8 57 bd ff ff       	call   804ed0 <outb>
    outb(port_reg_index,13);
  809179:	8b 05 29 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a29]        # 432ba8 <port_reg_index>
  80917f:	0f b7 c0             	movzx  eax,ax
  809182:	be 0d 00 00 00       	mov    esi,0xd
  809187:	89 c7                	mov    edi,eax
  809189:	e8 42 bd ff ff       	call   804ed0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80918e:	8b 05 04 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a04]        # 432b98 <page_boffset>
  809194:	d1 e8                	shr    eax,1
  809196:	0f b6 d0             	movzx  edx,al
  809199:	8b 05 0d 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a0d]        # 432bac <port_reg_v>
  80919f:	0f b7 c0             	movzx  eax,ax
  8091a2:	89 d6                	mov    esi,edx
  8091a4:	89 c7                	mov    edi,eax
  8091a6:	e8 25 bd ff ff       	call   804ed0 <outb>
    asm volatile("sti");
  8091ab:	fb                   	sti    

}
  8091ac:	90                   	nop
  8091ad:	5d                   	pop    rbp
  8091ae:	c3                   	ret    

00000000008091af <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  8091af:	f3 0f 1e fa          	endbr64 
  8091b3:	55                   	push   rbp
  8091b4:	48 89 e5             	mov    rbp,rsp
  8091b7:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  8091bb:	be c8 26 81 00       	mov    esi,0x8126c8
  8091c0:	bf 74 25 81 00       	mov    edi,0x812574
  8091c5:	e8 9a 09 00 00       	call   809b64 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  8091ca:	be cd 26 81 00       	mov    esi,0x8126cd
  8091cf:	bf 34 26 81 00       	mov    edi,0x812634
  8091d4:	e8 8b 09 00 00       	call   809b64 <strcpy>
    reg_driver(&drv_tty);
  8091d9:	bf c0 24 81 00       	mov    edi,0x8124c0
  8091de:	e8 44 9c ff ff       	call   802e27 <reg_driver>
    reg_device(&dev_tty);
  8091e3:	bf 60 25 81 00       	mov    edi,0x812560
  8091e8:	e8 52 99 ff ff       	call   802b3f <reg_device>
    reg_device(&dev_stdout);
  8091ed:	bf 20 26 81 00       	mov    edi,0x812620
  8091f2:	e8 48 99 ff ff       	call   802b3f <reg_device>
    unsigned char *vp=0x20000;
  8091f7:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  8091fe:	00 
    if(*vp==0x7)
  8091ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809203:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809206:	3c 07                	cmp    al,0x7
  809208:	75 36                	jne    809240 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80920a:	c7 05 88 99 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29988],0x0        # 432b9c <video_mode>
  809211:	00 00 00 
        video_base=0xb0000;
  809214:	48 c7 05 61 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29961],0xb0000        # 432b80 <video_base>
  80921b:	00 00 0b 00 
        video_end=0xb8000-1;
  80921f:	48 c7 05 5e 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2995e],0xb7fff        # 432b88 <video_end>
  809226:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80922a:	c7 05 74 99 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc29974],0x3b4        # 432ba8 <port_reg_index>
  809231:	03 00 00 
        port_reg_v=0x3b5;
  809234:	c7 05 6e 99 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2996e],0x3b5        # 432bac <port_reg_v>
  80923b:	03 00 00 
  80923e:	eb 61                	jmp    8092a1 <init_tty+0xf2>
    }else if(*vp<=0x3)
  809240:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809244:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809247:	3c 03                	cmp    al,0x3
  809249:	77 36                	ja     809281 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80924b:	c7 05 47 99 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc29947],0x1        # 432b9c <video_mode>
  809252:	00 00 00 
        video_base=0xb8000;
  809255:	48 c7 05 20 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29920],0xb8000        # 432b80 <video_base>
  80925c:	00 80 0b 00 
        video_end=0xc0000-1;
  809260:	48 c7 05 1d 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2991d],0xbffff        # 432b88 <video_end>
  809267:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80926b:	c7 05 33 99 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc29933],0x3d4        # 432ba8 <port_reg_index>
  809272:	03 00 00 
        port_reg_v=0x3d5;
  809275:	c7 05 2d 99 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2992d],0x3d5        # 432bac <port_reg_v>
  80927c:	03 00 00 
  80927f:	eb 20                	jmp    8092a1 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809281:	c7 05 11 99 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc29911],0x2        # 432b9c <video_mode>
  809288:	00 00 00 
        video_base=0xa0000;
  80928b:	48 c7 05 ea 98 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc298ea],0xa0000        # 432b80 <video_base>
  809292:	00 00 0a 00 
        video_end=0xb0000-1;
  809296:	48 c7 05 e7 98 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc298e7],0xaffff        # 432b88 <video_end>
  80929d:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  8092a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092a8:	3c 01                	cmp    al,0x1
  8092aa:	77 0f                	ja     8092bb <init_tty+0x10c>
  8092ac:	c7 05 ee 98 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc298ee],0x28        # 432ba4 <line_chs>
  8092b3:	00 00 00 
  8092b6:	e9 91 00 00 00       	jmp    80934c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  8092bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092c2:	3c 03                	cmp    al,0x3
  8092c4:	76 0b                	jbe    8092d1 <init_tty+0x122>
  8092c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092cd:	3c 07                	cmp    al,0x7
  8092cf:	75 0c                	jne    8092dd <init_tty+0x12e>
  8092d1:	c7 05 c9 98 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc298c9],0x50        # 432ba4 <line_chs>
  8092d8:	00 00 00 
  8092db:	eb 6f                	jmp    80934c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  8092dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092e4:	3c 05                	cmp    al,0x5
  8092e6:	76 16                	jbe    8092fe <init_tty+0x14f>
  8092e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ef:	3c 09                	cmp    al,0x9
  8092f1:	74 0b                	je     8092fe <init_tty+0x14f>
  8092f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092fa:	3c 0d                	cmp    al,0xd
  8092fc:	75 0c                	jne    80930a <init_tty+0x15b>
  8092fe:	c7 05 9c 98 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc2989c],0x140        # 432ba4 <line_chs>
  809305:	01 00 00 
  809308:	eb 42                	jmp    80934c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80930a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80930e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809311:	3c 06                	cmp    al,0x6
  809313:	74 16                	je     80932b <init_tty+0x17c>
  809315:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809319:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80931c:	3c 0a                	cmp    al,0xa
  80931e:	74 0b                	je     80932b <init_tty+0x17c>
  809320:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809324:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809327:	3c 0d                	cmp    al,0xd
  809329:	76 0c                	jbe    809337 <init_tty+0x188>
  80932b:	c7 05 6f 98 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2986f],0x280        # 432ba4 <line_chs>
  809332:	02 00 00 
  809335:	eb 15                	jmp    80934c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  809337:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80933b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80933e:	3c 08                	cmp    al,0x8
  809340:	75 0a                	jne    80934c <init_tty+0x19d>
  809342:	c7 05 58 98 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc29858],0xa0        # 432ba4 <line_chs>
  809349:	00 00 00 
    switch (*vp)
  80934c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809350:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809353:	0f b6 c0             	movzx  eax,al
  809356:	83 f8 14             	cmp    eax,0x14
  809359:	77 61                	ja     8093bc <init_tty+0x20d>
  80935b:	89 c0                	mov    eax,eax
  80935d:	48 8b 04 c5 d8 26 81 	mov    rax,QWORD PTR [rax*8+0x8126d8]
  809364:	00 
  809365:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809368:	c7 05 3e 98 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2983e],0x3e8        # 432bb0 <vpage_size>
  80936f:	03 00 00 
  809372:	eb 49                	jmp    8093bd <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809374:	c7 05 32 98 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc29832],0x7d0        # 432bb0 <vpage_size>
  80937b:	07 00 00 
  80937e:	eb 3d                	jmp    8093bd <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  809380:	c7 05 26 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29826],0xfa00        # 432bb0 <vpage_size>
  809387:	fa 00 00 
  80938a:	eb 31                	jmp    8093bd <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80938c:	c7 05 1a 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2981a],0x1f400        # 432bb0 <vpage_size>
  809393:	f4 01 00 
  809396:	eb 25                	jmp    8093bd <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  809398:	c7 05 0e 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2980e],0x7d00        # 432bb0 <vpage_size>
  80939f:	7d 00 00 
  8093a2:	eb 19                	jmp    8093bd <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  8093a4:	c7 05 02 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29802],0x36b00        # 432bb0 <vpage_size>
  8093ab:	6b 03 00 
  8093ae:	eb 0d                	jmp    8093bd <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  8093b0:	c7 05 f6 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297f6],0x4b000        # 432bb0 <vpage_size>
  8093b7:	b0 04 00 
  8093ba:	eb 01                	jmp    8093bd <init_tty+0x20e>
    default:
        break;
  8093bc:	90                   	nop
    }
    m_ptr=video_base;
  8093bd:	48 8b 05 bc 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc297bc]        # 432b80 <video_base>
  8093c4:	48 89 05 7d 12 00 00 	mov    QWORD PTR [rip+0x127d],rax        # 80a648 <m_ptr>
    page_boffset=0;
  8093cb:	c7 05 c3 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297c3],0x0        # 432b98 <page_boffset>
  8093d2:	00 00 00 
    vpage_base=video_base;
  8093d5:	48 8b 05 a4 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc297a4]        # 432b80 <video_base>
  8093dc:	48 89 05 ad 97 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc297ad],rax        # 432b90 <vpage_base>
    vp++;
  8093e3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  8093e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093ef:	0f b6 c0             	movzx  eax,al
  8093f2:	89 05 a8 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297a8],eax        # 432ba0 <vpage>
    vp++;
  8093f8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  8093fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809401:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809405:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809409:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80940c:	0f b6 c0             	movzx  eax,al
  80940f:	89 05 a7 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297a7],eax        # 432bbc <stline>
    endline=*vp++;
  809415:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809419:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80941d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809421:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809424:	0f b6 c0             	movzx  eax,al
  809427:	89 05 93 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29793],eax        # 432bc0 <endline>
    videoy=*vp++;
  80942d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809431:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809435:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809439:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80943c:	0f b6 c0             	movzx  eax,al
  80943f:	89 05 73 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29773],eax        # 432bb8 <videoy>
    videox=*vp;
  809445:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809449:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80944c:	0f b6 c0             	movzx  eax,al
  80944f:	89 05 5f 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2975f],eax        # 432bb4 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809455:	90                   	nop
  809456:	c9                   	leave  
  809457:	c3                   	ret    

0000000000809458 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809458:	f3 0f 1e fa          	endbr64 
  80945c:	55                   	push   rbp
  80945d:	48 89 e5             	mov    rbp,rsp
  809460:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809464:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809468:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80946b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80946e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809471:	05 00 c0 05 00       	add    eax,0x5c000
  809476:	01 c0                	add    eax,eax
  809478:	48 98                	cdqe   
  80947a:	48 89 05 c7 11 00 00 	mov    QWORD PTR [rip+0x11c7],rax        # 80a648 <m_ptr>
}
  809481:	90                   	nop
  809482:	5d                   	pop    rbp
  809483:	c3                   	ret    

0000000000809484 <tell_monitor>:
int tell_monitor()
{
  809484:	f3 0f 1e fa          	endbr64 
  809488:	55                   	push   rbp
  809489:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80948c:	48 8b 05 b5 11 00 00 	mov    rax,QWORD PTR [rip+0x11b5]        # 80a648 <m_ptr>
  809493:	48 8b 15 e6 96 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc296e6]        # 432b80 <video_base>
  80949a:	48 29 d0             	sub    rax,rdx
  80949d:	48 89 c2             	mov    rdx,rax
  8094a0:	48 c1 ea 3f          	shr    rdx,0x3f
  8094a4:	48 01 d0             	add    rax,rdx
  8094a7:	48 d1 f8             	sar    rax,1
}
  8094aa:	5d                   	pop    rbp
  8094ab:	c3                   	ret    

00000000008094ac <del_ch>:
void del_ch()
{
  8094ac:	f3 0f 1e fa          	endbr64 
  8094b0:	55                   	push   rbp
  8094b1:	48 89 e5             	mov    rbp,rsp
  8094b4:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  8094bb:	48 8b 05 86 11 00 00 	mov    rax,QWORD PTR [rip+0x1186]        # 80a648 <m_ptr>
  8094c2:	48 83 e8 02          	sub    rax,0x2
  8094c6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  8094ca:	b8 00 00 00 00       	mov    eax,0x0
  8094cf:	e8 b0 ff ff ff       	call   809484 <tell_monitor>
  8094d4:	89 c2                	mov    edx,eax
  8094d6:	48 63 c2             	movsxd rax,edx
  8094d9:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  8094e0:	48 c1 e8 20          	shr    rax,0x20
  8094e4:	c1 f8 05             	sar    eax,0x5
  8094e7:	89 d1                	mov    ecx,edx
  8094e9:	c1 f9 1f             	sar    ecx,0x1f
  8094ec:	29 c8                	sub    eax,ecx
  8094ee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  8094f1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8094f4:	89 c8                	mov    eax,ecx
  8094f6:	c1 e0 02             	shl    eax,0x2
  8094f9:	01 c8                	add    eax,ecx
  8094fb:	c1 e0 04             	shl    eax,0x4
  8094fe:	29 c2                	sub    edx,eax
  809500:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809503:	eb 17                	jmp    80951c <del_ch+0x70>
    {
        *p=*(p+2);
  809505:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809509:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80950d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809511:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809513:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809518:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80951c:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809520:	7e e3                	jle    809505 <del_ch+0x59>
    }
    driver_args args= {
  809522:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809529:	b8 00 00 00 00       	mov    eax,0x0
  80952e:	b9 18 00 00 00       	mov    ecx,0x18
  809533:	48 89 d7             	mov    rdi,rdx
  809536:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809539:	b8 00 00 00 00       	mov    eax,0x0
  80953e:	e8 41 ff ff ff       	call   809484 <tell_monitor>
  809543:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809546:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80954c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809553:	48 89 c7             	mov    rdi,rax
  809556:	e8 fd fe ff ff       	call   809458 <seek_tty>
    set_cur();
  80955b:	b8 00 00 00 00       	mov    eax,0x0
  809560:	e8 03 00 00 00       	call   809568 <set_cur>
}
  809565:	90                   	nop
  809566:	c9                   	leave  
  809567:	c3                   	ret    

0000000000809568 <set_cur>:
void set_cur()
{
  809568:	f3 0f 1e fa          	endbr64 
  80956c:	55                   	push   rbp
  80956d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809570:	fa                   	cli    
    outb(port_reg_index,14);
  809571:	8b 05 31 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29631]        # 432ba8 <port_reg_index>
  809577:	0f b7 c0             	movzx  eax,ax
  80957a:	be 0e 00 00 00       	mov    esi,0xe
  80957f:	89 c7                	mov    edi,eax
  809581:	e8 4a b9 ff ff       	call   804ed0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809586:	48 8b 05 bb 10 00 00 	mov    rax,QWORD PTR [rip+0x10bb]        # 80a648 <m_ptr>
  80958d:	48 8b 15 ec 95 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc295ec]        # 432b80 <video_base>
  809594:	48 29 d0             	sub    rax,rdx
  809597:	48 c1 f8 09          	sar    rax,0x9
  80959b:	0f b6 d0             	movzx  edx,al
  80959e:	8b 05 08 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29608]        # 432bac <port_reg_v>
  8095a4:	0f b7 c0             	movzx  eax,ax
  8095a7:	89 d6                	mov    esi,edx
  8095a9:	89 c7                	mov    edi,eax
  8095ab:	e8 20 b9 ff ff       	call   804ed0 <outb>
    outb(port_reg_index,15);
  8095b0:	8b 05 f2 95 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc295f2]        # 432ba8 <port_reg_index>
  8095b6:	0f b7 c0             	movzx  eax,ax
  8095b9:	be 0f 00 00 00       	mov    esi,0xf
  8095be:	89 c7                	mov    edi,eax
  8095c0:	e8 0b b9 ff ff       	call   804ed0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  8095c5:	48 8b 05 7c 10 00 00 	mov    rax,QWORD PTR [rip+0x107c]        # 80a648 <m_ptr>
  8095cc:	48 8b 15 ad 95 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc295ad]        # 432b80 <video_base>
  8095d3:	48 29 d0             	sub    rax,rdx
  8095d6:	48 d1 f8             	sar    rax,1
  8095d9:	0f b6 d0             	movzx  edx,al
  8095dc:	8b 05 ca 95 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc295ca]        # 432bac <port_reg_v>
  8095e2:	0f b7 c0             	movzx  eax,ax
  8095e5:	89 d6                	mov    esi,edx
  8095e7:	89 c7                	mov    edi,eax
  8095e9:	e8 e2 b8 ff ff       	call   804ed0 <outb>
    asm volatile("sti");
  8095ee:	fb                   	sti    
}
  8095ef:	90                   	nop
  8095f0:	5d                   	pop    rbp
  8095f1:	c3                   	ret    

00000000008095f2 <read_tty>:

int read_tty(driver_args *args)
{
  8095f2:	f3 0f 1e fa          	endbr64 
  8095f6:	55                   	push   rbp
  8095f7:	48 89 e5             	mov    rbp,rsp
  8095fa:	48 83 ec 20          	sub    rsp,0x20
  8095fe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  809602:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809606:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809609:	48 98                	cdqe   
  80960b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80960f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809613:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809616:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  809619:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809620:	eb 4a                	jmp    80966c <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809622:	48 8b 15 1f 10 00 00 	mov    rdx,QWORD PTR [rip+0x101f]        # 80a648 <m_ptr>
  809629:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80962d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809631:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809635:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809638:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80963a:	48 8b 05 07 10 00 00 	mov    rax,QWORD PTR [rip+0x1007]        # 80a648 <m_ptr>
  809641:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809647:	75 0d                	jne    809656 <read_tty+0x64>
  809649:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80964d:	7e 07                	jle    809656 <read_tty+0x64>
        {
            return 1;//读到尾了
  80964f:	b8 01 00 00 00       	mov    eax,0x1
  809654:	eb 2d                	jmp    809683 <read_tty+0x91>
        }
        m_ptr+=2;
  809656:	48 8b 05 eb 0f 00 00 	mov    rax,QWORD PTR [rip+0xfeb]        # 80a648 <m_ptr>
  80965d:	48 83 c0 02          	add    rax,0x2
  809661:	48 89 05 e0 0f 00 00 	mov    QWORD PTR [rip+0xfe0],rax        # 80a648 <m_ptr>
    for(int i=0;i<len;i++)
  809668:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80966c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80966f:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809672:	7c ae                	jl     809622 <read_tty+0x30>
    }
    set_cur();
  809674:	b8 00 00 00 00       	mov    eax,0x0
  809679:	e8 ea fe ff ff       	call   809568 <set_cur>
    return 0;
  80967e:	b8 00 00 00 00       	mov    eax,0x0
}
  809683:	c9                   	leave  
  809684:	c3                   	ret    

0000000000809685 <write_tty>:
int write_tty(driver_args *args)
{
  809685:	f3 0f 1e fa          	endbr64 
  809689:	55                   	push   rbp
  80968a:	48 89 e5             	mov    rbp,rsp
  80968d:	48 83 ec 30          	sub    rsp,0x30
  809691:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809695:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809699:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80969c:	48 98                	cdqe   
  80969e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8096a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8096a6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8096a9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8096ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8096b3:	e9 0b 01 00 00       	jmp    8097c3 <write_tty+0x13e>
    {
        if(*src=='\n')
  8096b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096bf:	3c 0a                	cmp    al,0xa
  8096c1:	75 50                	jne    809713 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  8096c3:	48 8b 05 7e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf7e]        # 80a648 <m_ptr>
  8096ca:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  8096d0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  8096d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096d6:	89 c2                	mov    edx,eax
  8096d8:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  8096dd:	48 0f af c2          	imul   rax,rdx
  8096e1:	48 c1 e8 20          	shr    rax,0x20
  8096e5:	c1 e8 07             	shr    eax,0x7
  8096e8:	8d 50 01             	lea    edx,[rax+0x1]
  8096eb:	89 d0                	mov    eax,edx
  8096ed:	c1 e0 02             	shl    eax,0x2
  8096f0:	01 d0                	add    eax,edx
  8096f2:	c1 e0 05             	shl    eax,0x5
  8096f5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  8096f8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096fb:	05 00 80 0b 00       	add    eax,0xb8000
  809700:	89 c0                	mov    eax,eax
  809702:	48 89 05 3f 0f 00 00 	mov    QWORD PTR [rip+0xf3f],rax        # 80a648 <m_ptr>
            src++;
  809709:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80970e:	e9 ac 00 00 00       	jmp    8097bf <write_tty+0x13a>
        }else if(*src=='\0')
  809713:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809717:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80971a:	84 c0                	test   al,al
  80971c:	0f 84 af 00 00 00    	je     8097d1 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809722:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809726:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809729:	3c 08                	cmp    al,0x8
  80972b:	75 1e                	jne    80974b <write_tty+0xc6>
        {
            m_ptr-=2;
  80972d:	48 8b 05 14 0f 00 00 	mov    rax,QWORD PTR [rip+0xf14]        # 80a648 <m_ptr>
  809734:	48 83 e8 02          	sub    rax,0x2
  809738:	48 89 05 09 0f 00 00 	mov    QWORD PTR [rip+0xf09],rax        # 80a648 <m_ptr>
            *m_ptr=0;
  80973f:	48 8b 05 02 0f 00 00 	mov    rax,QWORD PTR [rip+0xf02]        # 80a648 <m_ptr>
  809746:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809749:	eb 3e                	jmp    809789 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80974b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80974f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809753:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809757:	48 8b 05 ea 0e 00 00 	mov    rax,QWORD PTR [rip+0xeea]        # 80a648 <m_ptr>
  80975e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809762:	48 89 0d df 0e 00 00 	mov    QWORD PTR [rip+0xedf],rcx        # 80a648 <m_ptr>
  809769:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80976c:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80976e:	48 8b 05 d3 0e 00 00 	mov    rax,QWORD PTR [rip+0xed3]        # 80a648 <m_ptr>
  809775:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809779:	48 89 15 c8 0e 00 00 	mov    QWORD PTR [rip+0xec8],rdx        # 80a648 <m_ptr>
  809780:	0f b6 15 c9 0e 00 00 	movzx  edx,BYTE PTR [rip+0xec9]        # 80a650 <m_color>
  809787:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  809789:	48 8b 05 b8 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb8]        # 80a648 <m_ptr>
  809790:	48 8b 0d f9 93 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc293f9]        # 432b90 <vpage_base>
  809797:	48 29 c8             	sub    rax,rcx
  80979a:	48 89 c2             	mov    rdx,rax
  80979d:	8b 05 0d 94 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2940d]        # 432bb0 <vpage_size>
  8097a3:	8b 0d fb 93 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc293fb]        # 432ba4 <line_chs>
  8097a9:	29 c8                	sub    eax,ecx
  8097ab:	01 c0                	add    eax,eax
  8097ad:	48 98                	cdqe   
  8097af:	48 39 c2             	cmp    rdx,rax
  8097b2:	7c 0b                	jl     8097bf <write_tty+0x13a>
  8097b4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8097b8:	7e 05                	jle    8097bf <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  8097ba:	e8 bc f8 ff ff       	call   80907b <scrdown>
    for(int i=0;i<len;i++)
  8097bf:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8097c3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8097c6:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8097c9:	0f 8c e9 fe ff ff    	jl     8096b8 <write_tty+0x33>
  8097cf:	eb 01                	jmp    8097d2 <write_tty+0x14d>
            break;
  8097d1:	90                   	nop
        }
    }
    set_cur();
  8097d2:	b8 00 00 00 00       	mov    eax,0x0
  8097d7:	e8 8c fd ff ff       	call   809568 <set_cur>
    return 0;
  8097dc:	b8 00 00 00 00       	mov    eax,0x0
}
  8097e1:	c9                   	leave  
  8097e2:	c3                   	ret    

00000000008097e3 <cls>:

void cls(driver_args *args)
{
  8097e3:	f3 0f 1e fa          	endbr64 
  8097e7:	55                   	push   rbp
  8097e8:	48 89 e5             	mov    rbp,rsp
  8097eb:	48 83 ec 20          	sub    rsp,0x20
  8097ef:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  8097f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8097fa:	eb 16                	jmp    809812 <cls+0x2f>
    {
        vpage_base[i]=0;
  8097fc:	48 8b 15 8d 93 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2938d]        # 432b90 <vpage_base>
  809803:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809806:	48 98                	cdqe   
  809808:	48 01 d0             	add    rax,rdx
  80980b:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80980e:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809812:	8b 05 98 93 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29398]        # 432bb0 <vpage_size>
  809818:	01 c0                	add    eax,eax
  80981a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80981d:	7c dd                	jl     8097fc <cls+0x19>
    }
    m_ptr=vpage_base;
  80981f:	48 8b 05 6a 93 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2936a]        # 432b90 <vpage_base>
  809826:	48 89 05 1b 0e 00 00 	mov    QWORD PTR [rip+0xe1b],rax        # 80a648 <m_ptr>
    set_cur();
  80982d:	b8 00 00 00 00       	mov    eax,0x0
  809832:	e8 31 fd ff ff       	call   809568 <set_cur>
}
  809837:	90                   	nop
  809838:	c9                   	leave  
  809839:	c3                   	ret    

000000000080983a <set_color>:

void set_color(char color)
{
  80983a:	f3 0f 1e fa          	endbr64 
  80983e:	55                   	push   rbp
  80983f:	48 89 e5             	mov    rbp,rsp
  809842:	89 f8                	mov    eax,edi
  809844:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809847:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80984b:	88 05 ff 0d 00 00    	mov    BYTE PTR [rip+0xdff],al        # 80a650 <m_color>
}
  809851:	90                   	nop
  809852:	5d                   	pop    rbp
  809853:	c3                   	ret    

0000000000809854 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809854:	f3 0f 1e fa          	endbr64 
  809858:	55                   	push   rbp
  809859:	48 89 e5             	mov    rbp,rsp
  80985c:	48 83 ec 10          	sub    rsp,0x10
  809860:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  809864:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809868:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80986e:	83 f8 0d             	cmp    eax,0xd
  809871:	74 45                	je     8098b8 <tty_do_req+0x64>
  809873:	83 f8 0d             	cmp    eax,0xd
  809876:	7f 53                	jg     8098cb <tty_do_req+0x77>
  809878:	83 f8 0c             	cmp    eax,0xc
  80987b:	74 2d                	je     8098aa <tty_do_req+0x56>
  80987d:	83 f8 0c             	cmp    eax,0xc
  809880:	7f 49                	jg     8098cb <tty_do_req+0x77>
  809882:	83 f8 02             	cmp    eax,0x2
  809885:	74 07                	je     80988e <tty_do_req+0x3a>
  809887:	83 f8 03             	cmp    eax,0x3
  80988a:	74 10                	je     80989c <tty_do_req+0x48>
  80988c:	eb 3d                	jmp    8098cb <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80988e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809892:	48 89 c7             	mov    rdi,rax
  809895:	e8 58 fd ff ff       	call   8095f2 <read_tty>
        break;
  80989a:	eb 36                	jmp    8098d2 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80989c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098a0:	48 89 c7             	mov    rdi,rax
  8098a3:	e8 dd fd ff ff       	call   809685 <write_tty>
        break;
  8098a8:	eb 28                	jmp    8098d2 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8098aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098ae:	48 89 c7             	mov    rdi,rax
  8098b1:	e8 a2 fb ff ff       	call   809458 <seek_tty>
        break;
  8098b6:	eb 1a                	jmp    8098d2 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  8098b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098bc:	48 89 c7             	mov    rdi,rax
  8098bf:	b8 00 00 00 00       	mov    eax,0x0
  8098c4:	e8 bb fb ff ff       	call   809484 <tell_monitor>
        break;
  8098c9:	eb 07                	jmp    8098d2 <tty_do_req+0x7e>
    default:return -1;
  8098cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8098d0:	eb 05                	jmp    8098d7 <tty_do_req+0x83>
    }
    return 0;
  8098d2:	b8 00 00 00 00       	mov    eax,0x0
}
  8098d7:	c9                   	leave  
  8098d8:	c3                   	ret    

00000000008098d9 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  8098d9:	f3 0f 1e fa          	endbr64 
  8098dd:	55                   	push   rbp
  8098de:	48 89 e5             	mov    rbp,rsp
  8098e1:	48 83 ec 10          	sub    rsp,0x10
  8098e5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  8098e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098eb:	83 c0 01             	add    eax,0x1
  8098ee:	0f b7 c0             	movzx  eax,ax
  8098f1:	be 00 00 00 00       	mov    esi,0x0
  8098f6:	89 c7                	mov    edi,eax
  8098f8:	e8 d3 b5 ff ff       	call   804ed0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  8098fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809900:	83 c0 03             	add    eax,0x3
  809903:	0f b7 c0             	movzx  eax,ax
  809906:	be 80 00 00 00       	mov    esi,0x80
  80990b:	89 c7                	mov    edi,eax
  80990d:	e8 be b5 ff ff       	call   804ed0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809912:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809915:	0f b7 c0             	movzx  eax,ax
  809918:	be 03 00 00 00       	mov    esi,0x3
  80991d:	89 c7                	mov    edi,eax
  80991f:	e8 ac b5 ff ff       	call   804ed0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809924:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809927:	83 c0 01             	add    eax,0x1
  80992a:	0f b7 c0             	movzx  eax,ax
  80992d:	be 00 00 00 00       	mov    esi,0x0
  809932:	89 c7                	mov    edi,eax
  809934:	e8 97 b5 ff ff       	call   804ed0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809939:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80993c:	83 c0 03             	add    eax,0x3
  80993f:	0f b7 c0             	movzx  eax,ax
  809942:	be 03 00 00 00       	mov    esi,0x3
  809947:	89 c7                	mov    edi,eax
  809949:	e8 82 b5 ff ff       	call   804ed0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80994e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809951:	83 c0 02             	add    eax,0x2
  809954:	0f b7 c0             	movzx  eax,ax
  809957:	be c7 00 00 00       	mov    esi,0xc7
  80995c:	89 c7                	mov    edi,eax
  80995e:	e8 6d b5 ff ff       	call   804ed0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  809963:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809966:	83 c0 04             	add    eax,0x4
  809969:	0f b7 c0             	movzx  eax,ax
  80996c:	be 0b 00 00 00       	mov    esi,0xb
  809971:	89 c7                	mov    edi,eax
  809973:	e8 58 b5 ff ff       	call   804ed0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  809978:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80997b:	83 c0 04             	add    eax,0x4
  80997e:	0f b7 c0             	movzx  eax,ax
  809981:	be 1e 00 00 00       	mov    esi,0x1e
  809986:	89 c7                	mov    edi,eax
  809988:	e8 43 b5 ff ff       	call   804ed0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80998d:	b8 61 00 00 00       	mov    eax,0x61
  809992:	0f b6 d0             	movzx  edx,al
  809995:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809998:	0f b7 c0             	movzx  eax,ax
  80999b:	89 d6                	mov    esi,edx
  80999d:	89 c7                	mov    edi,eax
  80999f:	e8 2c b5 ff ff       	call   804ed0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8099a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099a7:	0f b6 c0             	movzx  eax,al
  8099aa:	89 c7                	mov    edi,eax
  8099ac:	e8 38 b5 ff ff       	call   804ee9 <inb>
  8099b1:	0f b6 d0             	movzx  edx,al
  8099b4:	b8 61 00 00 00       	mov    eax,0x61
  8099b9:	0f be c0             	movsx  eax,al
  8099bc:	39 c2                	cmp    edx,eax
  8099be:	75 17                	jne    8099d7 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  8099c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099c3:	83 c0 04             	add    eax,0x4
  8099c6:	0f b7 c0             	movzx  eax,ax
  8099c9:	be 0f 00 00 00       	mov    esi,0xf
  8099ce:	89 c7                	mov    edi,eax
  8099d0:	e8 fb b4 ff ff       	call   804ed0 <outb>
  8099d5:	eb 01                	jmp    8099d8 <init_com+0xff>
        return;
  8099d7:	90                   	nop
}
  8099d8:	c9                   	leave  
  8099d9:	c3                   	ret    

00000000008099da <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  8099da:	f3 0f 1e fa          	endbr64 
  8099de:	55                   	push   rbp
  8099df:	48 89 e5             	mov    rbp,rsp
  8099e2:	48 83 ec 20          	sub    rsp,0x20
  8099e6:	89 f8                	mov    eax,edi
  8099e8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8099eb:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  8099ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8099f2:	83 c0 05             	add    eax,0x5
  8099f5:	0f b6 c0             	movzx  eax,al
  8099f8:	89 c7                	mov    edi,eax
  8099fa:	e8 ea b4 ff ff       	call   804ee9 <inb>
  8099ff:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809a02:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809a06:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809a0a:	74 e3                	je     8099ef <com_putchar+0x15>
    outb(com_base, ch);
  809a0c:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809a10:	0f b6 d0             	movzx  edx,al
  809a13:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809a16:	0f b7 c0             	movzx  eax,ax
  809a19:	89 d6                	mov    esi,edx
  809a1b:	89 c7                	mov    edi,eax
  809a1d:	e8 ae b4 ff ff       	call   804ed0 <outb>
}
  809a22:	90                   	nop
  809a23:	c9                   	leave  
  809a24:	c3                   	ret    

0000000000809a25 <com_puts>:

void com_puts(char* s,int com_port){
  809a25:	f3 0f 1e fa          	endbr64 
  809a29:	55                   	push   rbp
  809a2a:	48 89 e5             	mov    rbp,rsp
  809a2d:	48 83 ec 10          	sub    rsp,0x10
  809a31:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a35:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809a38:	eb 1d                	jmp    809a57 <com_puts+0x32>
        com_putchar(*s,com_port);
  809a3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a41:	66 98                	cbw    
  809a43:	0f b7 c0             	movzx  eax,ax
  809a46:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809a49:	89 d6                	mov    esi,edx
  809a4b:	89 c7                	mov    edi,eax
  809a4d:	e8 88 ff ff ff       	call   8099da <com_putchar>
    for(;*s;s++){
  809a52:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809a57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a5e:	84 c0                	test   al,al
  809a60:	75 d8                	jne    809a3a <com_puts+0x15>
    }
  809a62:	90                   	nop
  809a63:	90                   	nop
  809a64:	c9                   	leave  
  809a65:	c3                   	ret    

0000000000809a66 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  809a66:	f3 0f 1e fa          	endbr64 
  809a6a:	55                   	push   rbp
  809a6b:	48 89 e5             	mov    rbp,rsp
  809a6e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809a72:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809a76:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  809a79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a7d:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809a80:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809a87:	eb 1b                	jmp    809aa4 <memcpy+0x3e>
        *(dest)=*(src);
  809a89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a8d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809a90:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a94:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809a96:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  809a9b:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809aa0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809aa4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809aa7:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  809aaa:	77 dd                	ja     809a89 <memcpy+0x23>
    }
}
  809aac:	90                   	nop
  809aad:	90                   	nop
  809aae:	5d                   	pop    rbp
  809aaf:	c3                   	ret    

0000000000809ab0 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809ab0:	f3 0f 1e fa          	endbr64 
  809ab4:	55                   	push   rbp
  809ab5:	48 89 e5             	mov    rbp,rsp
  809ab8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809abc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809ac0:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809ac3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809aca:	eb 3a                	jmp    809b06 <memcmp+0x56>
    {
        if(*a!=*b)
  809acc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ad0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809ad3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809ad7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ada:	38 c2                	cmp    dl,al
  809adc:	74 1a                	je     809af8 <memcmp+0x48>
            return *a-*b;
  809ade:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ae2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ae5:	0f b6 d0             	movzx  edx,al
  809ae8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809aec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809aef:	0f b6 c8             	movzx  ecx,al
  809af2:	89 d0                	mov    eax,edx
  809af4:	29 c8                	sub    eax,ecx
  809af6:	eb 1b                	jmp    809b13 <memcmp+0x63>
        a++;
  809af8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  809afd:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809b02:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809b06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b09:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  809b0c:	7c be                	jl     809acc <memcmp+0x1c>
    }
    return 0;
  809b0e:	b8 00 00 00 00       	mov    eax,0x0
}
  809b13:	5d                   	pop    rbp
  809b14:	c3                   	ret    

0000000000809b15 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809b15:	f3 0f 1e fa          	endbr64 
  809b19:	55                   	push   rbp
  809b1a:	48 89 e5             	mov    rbp,rsp
  809b1d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809b21:	89 f0                	mov    eax,esi
  809b23:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809b26:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809b29:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809b30:	eb 16                	jmp    809b48 <memset+0x33>
        *(buf++)=value;
  809b32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b36:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809b3a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809b3e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809b42:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809b44:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809b48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b4b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809b4e:	72 e2                	jb     809b32 <memset+0x1d>
    }
}
  809b50:	90                   	nop
  809b51:	90                   	nop
  809b52:	5d                   	pop    rbp
  809b53:	c3                   	ret    

0000000000809b54 <get_mem_size>:

u32 get_mem_size(){
  809b54:	f3 0f 1e fa          	endbr64 
  809b58:	55                   	push   rbp
  809b59:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  809b5c:	8b 05 62 90 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29062]        # 432bc4 <mem_end>
}
  809b62:	5d                   	pop    rbp
  809b63:	c3                   	ret    

0000000000809b64 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  809b64:	f3 0f 1e fa          	endbr64 
  809b68:	55                   	push   rbp
  809b69:	48 89 e5             	mov    rbp,rsp
  809b6c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809b70:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  809b74:	eb 1d                	jmp    809b93 <strcpy+0x2f>
        *(dest++)=*(buf++);
  809b76:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  809b7a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809b7e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809b82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b86:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809b8a:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809b8e:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809b91:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809b93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809b97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b9a:	84 c0                	test   al,al
  809b9c:	75 d8                	jne    809b76 <strcpy+0x12>
    }
    *dest='\0';
  809b9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ba2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809ba5:	90                   	nop
  809ba6:	5d                   	pop    rbp
  809ba7:	c3                   	ret    

0000000000809ba8 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  809ba8:	f3 0f 1e fa          	endbr64 
  809bac:	55                   	push   rbp
  809bad:	48 89 e5             	mov    rbp,rsp
  809bb0:	48 83 ec 30          	sub    rsp,0x30
  809bb4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809bb8:	89 f0                	mov    eax,esi
  809bba:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  809bbd:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809bc2:	0f 84 9c 00 00 00    	je     809c64 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809bc8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809bcc:	48 89 c6             	mov    rsi,rax
  809bcf:	bf e0 2b 43 00       	mov    edi,0x432be0
  809bd4:	e8 8b ff ff ff       	call   809b64 <strcpy>
        char* ptr=strtokkee;
  809bd9:	48 c7 45 e8 e0 2b 43 	mov    QWORD PTR [rbp-0x18],0x432be0
  809be0:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809be1:	c7 05 f5 91 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc291f5],0x0        # 432de0 <tokptr>
  809be8:	00 00 00 
  809beb:	eb 1c                	jmp    809c09 <strtok+0x61>
  809bed:	8b 05 ed 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291ed]        # 432de0 <tokptr>
  809bf3:	83 c0 01             	add    eax,0x1
  809bf6:	99                   	cdq    
  809bf7:	c1 ea 17             	shr    edx,0x17
  809bfa:	01 d0                	add    eax,edx
  809bfc:	25 ff 01 00 00       	and    eax,0x1ff
  809c01:	29 d0                	sub    eax,edx
  809c03:	89 05 d7 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc291d7],eax        # 432de0 <tokptr>
  809c09:	8b 05 d1 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291d1]        # 432de0 <tokptr>
  809c0f:	48 98                	cdqe   
  809c11:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c18:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809c1b:	74 13                	je     809c30 <strtok+0x88>
  809c1d:	8b 05 bd 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291bd]        # 432de0 <tokptr>
  809c23:	48 98                	cdqe   
  809c25:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c2c:	84 c0                	test   al,al
  809c2e:	75 bd                	jne    809bed <strtok+0x45>
        strtokkee[tokptr]='\0';
  809c30:	8b 05 aa 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291aa]        # 432de0 <tokptr>
  809c36:	48 98                	cdqe   
  809c38:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
        tokptr=(tokptr+1)%512;
  809c3f:	8b 05 9b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2919b]        # 432de0 <tokptr>
  809c45:	83 c0 01             	add    eax,0x1
  809c48:	99                   	cdq    
  809c49:	c1 ea 17             	shr    edx,0x17
  809c4c:	01 d0                	add    eax,edx
  809c4e:	25 ff 01 00 00       	and    eax,0x1ff
  809c53:	29 d0                	sub    eax,edx
  809c55:	89 05 85 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29185],eax        # 432de0 <tokptr>
        return ptr;
  809c5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809c5f:	e9 9e 00 00 00       	jmp    809d02 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  809c64:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  809c6b:	8b 05 6f 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2916f]        # 432de0 <tokptr>
  809c71:	48 98                	cdqe   
  809c73:	48 05 e0 2b 43 00    	add    rax,0x432be0
  809c79:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  809c7d:	eb 20                	jmp    809c9f <strtok+0xf7>
  809c7f:	8b 05 5b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2915b]        # 432de0 <tokptr>
  809c85:	83 c0 01             	add    eax,0x1
  809c88:	99                   	cdq    
  809c89:	c1 ea 17             	shr    edx,0x17
  809c8c:	01 d0                	add    eax,edx
  809c8e:	25 ff 01 00 00       	and    eax,0x1ff
  809c93:	29 d0                	sub    eax,edx
  809c95:	89 05 45 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29145],eax        # 432de0 <tokptr>
  809c9b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809c9f:	8b 05 3b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2913b]        # 432de0 <tokptr>
  809ca5:	48 98                	cdqe   
  809ca7:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809cae:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809cb1:	74 13                	je     809cc6 <strtok+0x11e>
  809cb3:	8b 05 27 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29127]        # 432de0 <tokptr>
  809cb9:	48 98                	cdqe   
  809cbb:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809cc2:	84 c0                	test   al,al
  809cc4:	75 b9                	jne    809c7f <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809cc6:	8b 05 14 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29114]        # 432de0 <tokptr>
  809ccc:	48 98                	cdqe   
  809cce:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
    tokptr=(tokptr+1)%512;
  809cd5:	8b 05 05 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29105]        # 432de0 <tokptr>
  809cdb:	83 c0 01             	add    eax,0x1
  809cde:	99                   	cdq    
  809cdf:	c1 ea 17             	shr    edx,0x17
  809ce2:	01 d0                	add    eax,edx
  809ce4:	25 ff 01 00 00       	and    eax,0x1ff
  809ce9:	29 d0                	sub    eax,edx
  809ceb:	89 05 ef 90 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc290ef],eax        # 432de0 <tokptr>
    if(c)
  809cf1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809cf5:	74 06                	je     809cfd <strtok+0x155>
        return ptr;
  809cf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cfb:	eb 05                	jmp    809d02 <strtok+0x15a>
    else
        return (void*)0;
  809cfd:	b8 00 00 00 00       	mov    eax,0x0
}
  809d02:	c9                   	leave  
  809d03:	c3                   	ret    

0000000000809d04 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809d04:	f3 0f 1e fa          	endbr64 
  809d08:	55                   	push   rbp
  809d09:	48 89 e5             	mov    rbp,rsp
  809d0c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809d10:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809d14:	eb 3c                	jmp    809d52 <strcmp+0x4e>
		if(*s1>*s2)
  809d16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d1a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d24:	38 c2                	cmp    dl,al
  809d26:	7e 07                	jle    809d2f <strcmp+0x2b>
			return 1;
  809d28:	b8 01 00 00 00       	mov    eax,0x1
  809d2d:	eb 52                	jmp    809d81 <strcmp+0x7d>
		else if(*s1<*s2)
  809d2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d33:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d3d:	38 c2                	cmp    dl,al
  809d3f:	7d 07                	jge    809d48 <strcmp+0x44>
			return -1;
  809d41:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809d46:	eb 39                	jmp    809d81 <strcmp+0x7d>
		s1++;
  809d48:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  809d4d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809d52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d56:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d59:	84 c0                	test   al,al
  809d5b:	74 0b                	je     809d68 <strcmp+0x64>
  809d5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d64:	84 c0                	test   al,al
  809d66:	75 ae                	jne    809d16 <strcmp+0x12>
	}
	if(*s1==*s2)
  809d68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d6c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d6f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d73:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d76:	38 c2                	cmp    dl,al
  809d78:	75 07                	jne    809d81 <strcmp+0x7d>
		return 0;
  809d7a:	b8 00 00 00 00       	mov    eax,0x0
  809d7f:	eb 00                	jmp    809d81 <strcmp+0x7d>
}
  809d81:	5d                   	pop    rbp
  809d82:	c3                   	ret    

0000000000809d83 <strlen>:

int strlen(char *str)
{
  809d83:	f3 0f 1e fa          	endbr64 
  809d87:	55                   	push   rbp
  809d88:	48 89 e5             	mov    rbp,rsp
  809d8b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  809d8f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809d96:	eb 09                	jmp    809da1 <strlen+0x1e>
  809d98:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  809d9d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809da1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809da5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809da8:	84 c0                	test   al,al
  809daa:	75 ec                	jne    809d98 <strlen+0x15>
    return l;
  809dac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809daf:	5d                   	pop    rbp
  809db0:	c3                   	ret    

0000000000809db1 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809db1:	f3 0f 1e fa          	endbr64 
  809db5:	55                   	push   rbp
  809db6:	48 89 e5             	mov    rbp,rsp
  809db9:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809dc0:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809dc7:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809dce:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809dd5:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  809ddc:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809de3:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809dea:	84 c0                	test   al,al
  809dec:	74 20                	je     809e0e <sprintf+0x5d>
  809dee:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809df2:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809df6:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809dfa:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  809dfe:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809e02:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809e06:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809e0a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  809e0e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809e15:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  809e1c:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809e23:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809e2a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809e31:	00 00 00 
    while (*pstr!='\n')
  809e34:	eb 39                	jmp    809e6f <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809e36:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e40:	3c 25                	cmp    al,0x25
  809e42:	75 15                	jne    809e59 <sprintf+0xa8>
  809e44:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  809e4b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e4e:	3c 25                	cmp    al,0x25
  809e50:	74 07                	je     809e59 <sprintf+0xa8>
            argnum++;
  809e52:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809e59:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e60:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809e67:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809e6e:	01 
    while (*pstr!='\n')
  809e6f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e79:	3c 0a                	cmp    al,0xa
  809e7b:	75 b9                	jne    809e36 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  809e7d:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809e84:	00 00 00 
  809e87:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809e8e:	00 00 00 
  809e91:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809e95:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  809e9c:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809ea3:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809eaa:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809eb1:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809eb8:	e9 e2 01 00 00       	jmp    80a09f <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809ebd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ec4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ec7:	3c 25                	cmp    al,0x25
  809ec9:	0f 85 aa 01 00 00    	jne    80a079 <sprintf+0x2c8>
  809ecf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ed6:	48 83 c0 01          	add    rax,0x1
  809eda:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809edd:	84 c0                	test   al,al
  809edf:	0f 84 94 01 00 00    	je     80a079 <sprintf+0x2c8>
            pstr++;
  809ee5:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809eec:	01 
            if(*pstr=='x'){
  809eed:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ef4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ef7:	3c 78                	cmp    al,0x78
  809ef9:	75 64                	jne    809f5f <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  809efb:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809f01:	83 f8 2f             	cmp    eax,0x2f
  809f04:	77 23                	ja     809f29 <sprintf+0x178>
  809f06:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809f0d:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f13:	89 d2                	mov    edx,edx
  809f15:	48 01 d0             	add    rax,rdx
  809f18:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f1e:	83 c2 08             	add    edx,0x8
  809f21:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809f27:	eb 12                	jmp    809f3b <sprintf+0x18a>
  809f29:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809f30:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809f34:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809f3b:	8b 00                	mov    eax,DWORD PTR [rax]
  809f3d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809f43:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809f49:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809f50:	89 d6                	mov    esi,edx
  809f52:	48 89 c7             	mov    rdi,rax
  809f55:	e8 4e 02 00 00       	call   80a1a8 <sprint_hex>
            if(*pstr=='x'){
  809f5a:	e9 38 01 00 00       	jmp    80a097 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809f5f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809f66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f69:	3c 73                	cmp    al,0x73
  809f6b:	75 68                	jne    809fd5 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809f6d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809f73:	83 f8 2f             	cmp    eax,0x2f
  809f76:	77 23                	ja     809f9b <sprintf+0x1ea>
  809f78:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809f7f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f85:	89 d2                	mov    edx,edx
  809f87:	48 01 d0             	add    rax,rdx
  809f8a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f90:	83 c2 08             	add    edx,0x8
  809f93:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809f99:	eb 12                	jmp    809fad <sprintf+0x1fc>
  809f9b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809fa2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809fa6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809fad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809fb0:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809fb7:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809fbe:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809fc5:	48 89 d6             	mov    rsi,rdx
  809fc8:	48 89 c7             	mov    rdi,rax
  809fcb:	e8 5a 02 00 00       	call   80a22a <sprintn>
            if(*pstr=='x'){
  809fd0:	e9 c2 00 00 00       	jmp    80a097 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809fd5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809fdc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fdf:	3c 64                	cmp    al,0x64
  809fe1:	75 66                	jne    80a049 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809fe3:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809fe9:	83 f8 2f             	cmp    eax,0x2f
  809fec:	77 23                	ja     80a011 <sprintf+0x260>
  809fee:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809ff5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809ffb:	89 d2                	mov    edx,edx
  809ffd:	48 01 d0             	add    rax,rdx
  80a000:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a006:	83 c2 08             	add    edx,0x8
  80a009:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a00f:	eb 12                	jmp    80a023 <sprintf+0x272>
  80a011:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a018:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a01c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a023:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a026:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80a02d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80a034:	89 c2                	mov    edx,eax
  80a036:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a03d:	89 d6                	mov    esi,edx
  80a03f:	48 89 c7             	mov    rdi,rax
  80a042:	e8 ad 00 00 00       	call   80a0f4 <sprint_decimal>
            if(*pstr=='x'){
  80a047:	eb 4e                	jmp    80a097 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80a049:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a050:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a053:	3c 63                	cmp    al,0x63
  80a055:	75 02                	jne    80a059 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80a057:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80a059:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a060:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a063:	0f be d0             	movsx  edx,al
  80a066:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a06d:	89 d6                	mov    esi,edx
  80a06f:	48 89 c7             	mov    rdi,rax
  80a072:	e8 3e 00 00 00       	call   80a0b5 <sprintchar>
            if(*pstr=='x'){
  80a077:	eb 1e                	jmp    80a097 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80a079:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a080:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a083:	0f be d0             	movsx  edx,al
  80a086:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a08d:	89 d6                	mov    esi,edx
  80a08f:	48 89 c7             	mov    rdi,rax
  80a092:	e8 1e 00 00 00       	call   80a0b5 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80a097:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a09e:	01 
  80a09f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a0a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0a9:	84 c0                	test   al,al
  80a0ab:	0f 85 0c fe ff ff    	jne    809ebd <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80a0b1:	90                   	nop
  80a0b2:	90                   	nop
  80a0b3:	c9                   	leave  
  80a0b4:	c3                   	ret    

000000000080a0b5 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80a0b5:	f3 0f 1e fa          	endbr64 
  80a0b9:	55                   	push   rbp
  80a0ba:	48 89 e5             	mov    rbp,rsp
  80a0bd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a0c1:	89 f0                	mov    eax,esi
  80a0c3:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80a0c6:	eb 05                	jmp    80a0cd <sprintchar+0x18>
        dist++;
  80a0c8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80a0cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0d4:	84 c0                	test   al,al
  80a0d6:	75 f0                	jne    80a0c8 <sprintchar+0x13>
    *dist++=c;
  80a0d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0dc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a0e0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a0e4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80a0e8:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80a0ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0ee:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a0f1:	90                   	nop
  80a0f2:	5d                   	pop    rbp
  80a0f3:	c3                   	ret    

000000000080a0f4 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80a0f4:	f3 0f 1e fa          	endbr64 
  80a0f8:	55                   	push   rbp
  80a0f9:	48 89 e5             	mov    rbp,rsp
  80a0fc:	48 83 ec 30          	sub    rsp,0x30
  80a100:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a104:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80a107:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80a10e:	eb 65                	jmp    80a175 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80a110:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80a113:	48 63 c2             	movsxd rax,edx
  80a116:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80a11d:	48 c1 e8 20          	shr    rax,0x20
  80a121:	c1 f8 02             	sar    eax,0x2
  80a124:	89 d6                	mov    esi,edx
  80a126:	c1 fe 1f             	sar    esi,0x1f
  80a129:	29 f0                	sub    eax,esi
  80a12b:	89 c1                	mov    ecx,eax
  80a12d:	89 c8                	mov    eax,ecx
  80a12f:	c1 e0 02             	shl    eax,0x2
  80a132:	01 c8                	add    eax,ecx
  80a134:	01 c0                	add    eax,eax
  80a136:	89 d1                	mov    ecx,edx
  80a138:	29 c1                	sub    ecx,eax
  80a13a:	89 c8                	mov    eax,ecx
  80a13c:	83 c0 30             	add    eax,0x30
  80a13f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80a142:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a145:	8d 50 01             	lea    edx,[rax+0x1]
  80a148:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a14b:	48 98                	cdqe   
  80a14d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a151:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80a155:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a158:	48 63 d0             	movsxd rdx,eax
  80a15b:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80a162:	48 c1 ea 20          	shr    rdx,0x20
  80a166:	c1 fa 02             	sar    edx,0x2
  80a169:	c1 f8 1f             	sar    eax,0x1f
  80a16c:	89 c1                	mov    ecx,eax
  80a16e:	89 d0                	mov    eax,edx
  80a170:	29 c8                	sub    eax,ecx
  80a172:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80a175:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a178:	83 f8 0f             	cmp    eax,0xf
  80a17b:	76 93                	jbe    80a110 <sprint_decimal+0x1c>
    }
    while(p>0)
  80a17d:	eb 1f                	jmp    80a19e <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80a17f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a183:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a186:	48 98                	cdqe   
  80a188:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80a18d:	0f be d0             	movsx  edx,al
  80a190:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a194:	89 d6                	mov    esi,edx
  80a196:	48 89 c7             	mov    rdi,rax
  80a199:	e8 17 ff ff ff       	call   80a0b5 <sprintchar>
    while(p>0)
  80a19e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a1a2:	7f db                	jg     80a17f <sprint_decimal+0x8b>
    }
}
  80a1a4:	90                   	nop
  80a1a5:	90                   	nop
  80a1a6:	c9                   	leave  
  80a1a7:	c3                   	ret    

000000000080a1a8 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80a1a8:	f3 0f 1e fa          	endbr64 
  80a1ac:	55                   	push   rbp
  80a1ad:	48 89 e5             	mov    rbp,rsp
  80a1b0:	48 83 ec 20          	sub    rsp,0x20
  80a1b4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a1b8:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80a1bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80a1c2:	eb 35                	jmp    80a1f9 <sprint_hex+0x51>
        unsigned char a=c%16;
  80a1c4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a1c7:	83 e0 0f             	and    eax,0xf
  80a1ca:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80a1cd:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80a1d1:	76 06                	jbe    80a1d9 <sprint_hex+0x31>
  80a1d3:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80a1d7:	eb 04                	jmp    80a1dd <sprint_hex+0x35>
        else a+='0';
  80a1d9:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80a1dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1e0:	8d 50 01             	lea    edx,[rax+0x1]
  80a1e3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a1e6:	48 98                	cdqe   
  80a1e8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a1ec:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80a1f0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a1f3:	c1 e8 04             	shr    eax,0x4
  80a1f6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80a1f9:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80a1fd:	7e c5                	jle    80a1c4 <sprint_hex+0x1c>
    }
    while(p>0)
  80a1ff:	eb 1f                	jmp    80a220 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80a201:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a205:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a208:	48 98                	cdqe   
  80a20a:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80a20f:	0f be d0             	movsx  edx,al
  80a212:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a216:	89 d6                	mov    esi,edx
  80a218:	48 89 c7             	mov    rdi,rax
  80a21b:	e8 95 fe ff ff       	call   80a0b5 <sprintchar>
    while(p>0)
  80a220:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a224:	7f db                	jg     80a201 <sprint_hex+0x59>
    }
}
  80a226:	90                   	nop
  80a227:	90                   	nop
  80a228:	c9                   	leave  
  80a229:	c3                   	ret    

000000000080a22a <sprintn>:
void sprintn(char *dist,char *str)
{
  80a22a:	f3 0f 1e fa          	endbr64 
  80a22e:	55                   	push   rbp
  80a22f:	48 89 e5             	mov    rbp,rsp
  80a232:	48 83 ec 10          	sub    rsp,0x10
  80a236:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a23a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80a23e:	eb 20                	jmp    80a260 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80a240:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a244:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a248:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80a24c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a24f:	0f be d0             	movsx  edx,al
  80a252:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a256:	89 d6                	mov    esi,edx
  80a258:	48 89 c7             	mov    rdi,rax
  80a25b:	e8 55 fe ff ff       	call   80a0b5 <sprintchar>
    while(*str!='\0')
  80a260:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a264:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a267:	84 c0                	test   al,al
  80a269:	75 d5                	jne    80a240 <sprintn+0x16>
    }
  80a26b:	90                   	nop
  80a26c:	90                   	nop
  80a26d:	c9                   	leave  
  80a26e:	c3                   	ret    
  80a26f:	90                   	nop

000000000080a270 <create_zero>:
  80a270:	e8 e8 9a ff ff       	call   803d5d <req_proc>
  80a275:	83 f8 ff             	cmp    eax,0xffffffff
  80a278:	74 0c                	je     80a286 <create_zero.retu>
  80a27a:	e8 d7 9b ff ff       	call   803e56 <set_proc>
  80a27f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80a283:	83 c4 40             	add    esp,0x40

000000000080a286 <create_zero.retu>:
  80a286:	c3                   	ret    

000000000080a287 <fill_desc>:
  80a287:	55                   	push   rbp
  80a288:	48 89 e5             	mov    rbp,rsp
  80a28b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80a28f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80a293:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80a297:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80a29b:	be da a3 80 00       	mov    esi,0x80a3da
  80a2a0:	c7 04 25 da a3 80 00 	mov    DWORD PTR ds:0x80a3da,0x0
  80a2a7:	00 00 00 00 
  80a2ab:	c7 04 25 de a3 80 00 	mov    DWORD PTR ds:0x80a3de,0x0
  80a2b2:	00 00 00 00 
  80a2b6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80a2ba:	c1 e9 10             	shr    ecx,0x10
  80a2bd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80a2c2:	c1 ea 10             	shr    edx,0x10
  80a2c5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80a2c9:	66 c1 ea 08          	shr    dx,0x8
  80a2cd:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80a2d1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80a2d6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80a2da:	c1 e1 08             	shl    ecx,0x8
  80a2dd:	09 cf                	or     edi,ecx
  80a2df:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80a2e3:	8b 14 25 da a3 80 00 	mov    edx,DWORD PTR ds:0x80a3da
  80a2ea:	67 89 10             	mov    DWORD PTR [eax],edx
  80a2ed:	8b 14 25 de a3 80 00 	mov    edx,DWORD PTR ds:0x80a3de
  80a2f4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80a2f8:	c9                   	leave  
  80a2f9:	c3                   	ret    

000000000080a2fa <switch_proc_asm>:
  80a2fa:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80a300:	66 89 04 25 18 a3 80 	mov    WORD PTR ds:0x80a318,ax
  80a307:	00 
  80a308:	c7 04 25 14 a3 80 00 	mov    DWORD PTR ds:0x80a314,0x0
  80a30f:	00 00 00 00 

000000000080a313 <switch_proc_asm.ljmp>:
  80a313:	ea                   	(bad)  
  80a314:	00 00                	add    BYTE PTR [rax],al
  80a316:	00 00                	add    BYTE PTR [rax],al
  80a318:	00 00                	add    BYTE PTR [rax],al
  80a31a:	c3                   	ret    

000000000080a31b <switch_to_old>:
  80a31b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80a320:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80a324:	bf 8c a3 80 00       	mov    edi,0x80a38c
  80a329:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80a32d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80a331:	89 c1                	mov    ecx,eax
  80a333:	83 e9 04             	sub    ecx,0x4
  80a336:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80a339:	50                   	push   rax
  80a33a:	89 f5                	mov    ebp,esi
  80a33c:	83 c5 28             	add    ebp,0x28
  80a33f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a343:	50                   	push   rax
  80a344:	83 c5 04             	add    ebp,0x4
  80a347:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a34b:	50                   	push   rax
  80a34c:	83 c5 04             	add    ebp,0x4
  80a34f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a353:	50                   	push   rax
  80a354:	83 c5 04             	add    ebp,0x4
  80a357:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a35b:	50                   	push   rax
  80a35c:	83 c5 04             	add    ebp,0x4
  80a35f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a363:	50                   	push   rax
  80a364:	83 c5 04             	add    ebp,0x4
  80a367:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a36b:	50                   	push   rax
  80a36c:	83 c5 04             	add    ebp,0x4
  80a36f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a373:	50                   	push   rax
  80a374:	83 c5 04             	add    ebp,0x4
  80a377:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a37b:	50                   	push   rax
  80a37c:	83 c5 04             	add    ebp,0x4
  80a37f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80a383:	0f 22 d8             	mov    cr3,rax
  80a386:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80a38a:	50                   	push   rax
  80a38b:	5c                   	pop    rsp

000000000080a38c <switch_to_old.leap>:
  80a38c:	ea                   	(bad)  
  80a38d:	00 00                	add    BYTE PTR [rax],al
  80a38f:	00 00                	add    BYTE PTR [rax],al
  80a391:	08 00                	or     BYTE PTR [rax],al

000000000080a393 <save_context>:
  80a393:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80a398:	83 c0 44             	add    eax,0x44
  80a39b:	b9 08 00 00 00       	mov    ecx,0x8
  80a3a0:	89 e7                	mov    edi,esp

000000000080a3a2 <save_context.loops>:
  80a3a2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80a3a5:	67 89 10             	mov    DWORD PTR [eax],edx
  80a3a8:	83 c7 04             	add    edi,0x4
  80a3ab:	83 e8 04             	sub    eax,0x4
  80a3ae:	e2 f2                	loop   80a3a2 <save_context.loops>
  80a3b0:	5b                   	pop    rbx
  80a3b1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80a3b6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80a3ba:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80a3bf:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80a3c3:	c3                   	ret    

000000000080a3c4 <move_to_user_mode>:
  80a3c4:	66 b8 20 00          	mov    ax,0x20
  80a3c8:	8e d8                	mov    ds,eax
  80a3ca:	8e c0                	mov    es,eax
  80a3cc:	8e e8                	mov    gs,eax
  80a3ce:	6a 20                	push   0x20
  80a3d0:	54                   	push   rsp
  80a3d1:	6a 18                	push   0x18
  80a3d3:	68 d9 a3 80 00       	push   0x80a3d9
  80a3d8:	cf                   	iret   

000000000080a3d9 <move_to_user_mode.done>:
  80a3d9:	c3                   	ret    

000000000080a3da <desc>:
	...

000000000080a3e2 <ret_sys_call>:
  80a3e2:	58                   	pop    rax
  80a3e3:	8e d8                	mov    ds,eax
  80a3e5:	58                   	pop    rax
  80a3e6:	8e c0                	mov    es,eax
  80a3e8:	41 5f                	pop    r15
  80a3ea:	41 5e                	pop    r14
  80a3ec:	41 5d                	pop    r13
  80a3ee:	41 5c                	pop    r12
  80a3f0:	41 5b                	pop    r11
  80a3f2:	41 5a                	pop    r10
  80a3f4:	41 59                	pop    r9
  80a3f6:	41 58                	pop    r8
  80a3f8:	5e                   	pop    rsi
  80a3f9:	5f                   	pop    rdi
  80a3fa:	5a                   	pop    rdx
  80a3fb:	59                   	pop    rcx
  80a3fc:	5b                   	pop    rbx
  80a3fd:	58                   	pop    rax
  80a3fe:	48 b8 2f a4 80 00 00 	movabs rax,0x80a42f
  80a405:	00 00 00 
  80a408:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  80a40c:	50                   	push   rax
  80a40d:	51                   	push   rcx
  80a40e:	52                   	push   rdx
  80a40f:	b9 81 00 00 c0       	mov    ecx,0xc0000081
  80a414:	0f 32                	rdmsr  
  80a416:	48 31 c0             	xor    rax,rax
  80a419:	ba 00 00 20 00       	mov    edx,0x200000
  80a41e:	0f 30                	wrmsr  
  80a420:	66 b8 2b 00          	mov    ax,0x2b
  80a424:	8e d8                	mov    ds,eax
  80a426:	8e c0                	mov    es,eax
  80a428:	8e e0                	mov    fs,eax
  80a42a:	8e e8                	mov    gs,eax
  80a42c:	5a                   	pop    rdx
  80a42d:	59                   	pop    rcx
  80a42e:	58                   	pop    rax

000000000080a42f <tmp>:
  80a42f:	48 0f 07             	sysretq 
