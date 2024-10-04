
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
  800217:	b8 b7 63 80 00       	mov    eax,0x8063b7
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 80 51 80 00       	mov    eax,0x805180
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 c0 72 80 00       	mov    eax,0x8072c0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 b0 5b 80 00       	mov    eax,0x805bb0
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
  800291:	e8 5a 4c 00 00       	call   804ef0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 4b 4c 00 00       	call   804ef0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 3c 4c 00 00       	call   804ef0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 2d 4c 00 00       	call   804ef0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 1e 4c 00 00       	call   804ef0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 0f 4c 00 00       	call   804ef0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 00 4c 00 00       	call   804ef0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 f1 4b 00 00       	call   804ef0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 21 4c 00 00       	call   804f2a <turn_on_int>

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
  8003e1:	e8 38 4b 00 00       	call   804f1e <eoi>
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
  8003fb:	e8 1e 4b 00 00       	call   804f1e <eoi>
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
  800415:	e8 04 4b 00 00       	call   804f1e <eoi>
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
  80042f:	e8 ea 4a 00 00       	call   804f1e <eoi>
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
  800449:	e8 d0 4a 00 00       	call   804f1e <eoi>
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
  800463:	e8 b6 4a 00 00       	call   804f1e <eoi>
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
  80047c:	e8 9d 4a 00 00       	call   804f1e <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 bf 4a 00 00       	call   804f4a <report_back_trace_of_err>
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
  8004a1:	e8 78 4a 00 00       	call   804f1e <eoi>
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
  8004bb:	e8 5e 4a 00 00       	call   804f1e <eoi>
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
  8004d4:	e8 45 4a 00 00       	call   804f1e <eoi>
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
  8004ed:	e8 2c 4a 00 00       	call   804f1e <eoi>
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
  800507:	e8 12 4a 00 00       	call   804f1e <eoi>
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
  800521:	e8 f8 49 00 00       	call   804f1e <eoi>
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
  800545:	e8 d4 49 00 00       	call   804f1e <eoi>
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
  800562:	e8 b7 49 00 00       	call   804f1e <eoi>
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
  800648:	e8 88 42 00 00       	call   8048d5 <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 4b 40 00 00       	call   8046a7 <del_proc>
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
  80072c:	e8 a2 4a 00 00       	call   8051d3 <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 77 41 00 00       	call   8048b4 <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 82 4b 00 00       	call   8052ce <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 f4 11 00 00       	call   80194c <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 0c 43 00 00       	call   804a70 <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 a7 44 00 00       	call   804c17 <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 4f 5d 00 00       	call   8064cb <sys_getkbc>
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
  8008d8:	e8 98 54 00 00       	call   805d75 <set_framebuffer>
  8008dd:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008e1:	b8 00 00 00 00       	mov    eax,0x0
  8008e6:	e8 d5 52 00 00       	call   805bc0 <init_framebuffer>
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
  800aaf:	e8 cb 51 00 00       	call   805c7f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ab4:	bf c8 1d 81 00       	mov    edi,0x811dc8
  800ab9:	e8 73 56 00 00       	call   806131 <print>
    init_int();
  800abe:	b8 00 00 00 00       	mov    eax,0x0
  800ac3:	e8 38 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800ac8:	bf e5 1d 81 00       	mov    edi,0x811de5
  800acd:	e8 5f 56 00 00       	call   806131 <print>
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
  800b06:	e8 26 43 00 00       	call   804e31 <set_tss>
  800b0b:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800b0f:	b8 00 00 00 00       	mov    eax,0x0
  800b14:	e8 d7 07 00 00       	call   8012f0 <init_memory>
    init_com(PORT_COM1);
  800b19:	bf f8 03 00 00       	mov    edi,0x3f8
  800b1e:	e8 d6 8d 00 00       	call   8098f9 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b23:	be f8 03 00 00       	mov    esi,0x3f8
  800b28:	bf f2 1d 81 00       	mov    edi,0x811df2
  800b2d:	e8 13 8f 00 00       	call   809a45 <com_puts>
	init_paging();
  800b32:	b8 00 00 00 00       	mov    eax,0x0
  800b37:	e8 db 04 00 00       	call   801017 <init_paging>
 	init_gdt();
  800b3c:	b8 00 00 00 00       	mov    eax,0x0
  800b41:	e8 28 44 00 00       	call   804f6e <init_gdt>
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
  800b5f:	e8 34 58 00 00       	call   806398 <init_kb>
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
  800cd2:	e8 5a 54 00 00       	call   806131 <print>
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
  8011cd:	e8 5f 4f 00 00       	call   806131 <print>
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
  80123d:	e8 ef 4e 00 00       	call   806131 <print>
  801242:	eb 0a                	jmp    80124e <page_err+0x94>
    p=err_code&4;
  801244:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801248:	83 e0 04             	and    eax,0x4
  80124b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80124e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801252:	75 0c                	jne    801260 <page_err+0xa6>
  801254:	bf 70 1e 81 00       	mov    edi,0x811e70
  801259:	e8 d3 4e 00 00       	call   806131 <print>
  80125e:	eb 0a                	jmp    80126a <page_err+0xb0>
    p=err_code&16;
  801260:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801264:	83 e0 10             	and    eax,0x10
  801267:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80126a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80126e:	74 0a                	je     80127a <page_err+0xc0>
  801270:	bf 88 1e 81 00       	mov    edi,0x811e88
  801275:	e8 b7 4e 00 00       	call   806131 <print>
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
  8012dd:	e8 3c 3c 00 00       	call   804f1e <eoi>
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
  801bb3:	e8 cc 7f 00 00       	call   809b84 <strcpy>
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
  801cbe:	e8 61 80 00 00       	call   809d24 <strcmp>
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
  802075:	e8 ae 27 00 00       	call   804828 <add_proc_openf>
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
  8024a2:	e8 df 75 00 00       	call   809a86 <memcpy>
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
  802541:	e8 40 75 00 00       	call   809a86 <memcpy>
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
  802a1c:	e8 65 70 00 00       	call   809a86 <memcpy>
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
  802a99:	e8 e8 6f 00 00       	call   809a86 <memcpy>
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
  802fea:	e8 35 6d 00 00       	call   809d24 <strcmp>
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
  803083:	e8 9c 6c 00 00       	call   809d24 <strcmp>
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
  803aa5:	e8 4a 02 00 00       	call   803cf4 <create_proc>
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
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803ae6:	be 08 00 00 00       	mov    esi,0x8
  803aeb:	bf 74 01 00 00       	mov    edi,0x174
  803af0:	e8 bc cc ff ff       	call   8007b1 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000000000000ul);
  803af5:	48 b8 00 00 00 00 00 	movabs rax,0x20000000000000
  803afc:	00 20 00 
  803aff:	48 89 c6             	mov    rsi,rax
  803b02:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803b07:	48 89 c7             	mov    rdi,rax
  803b0a:	e8 a2 cc ff ff       	call   8007b1 <wrmsr>
    //创建一个测试进程
    create_test_proc();
  803b0f:	b8 00 00 00 00       	mov    eax,0x0
  803b14:	e8 03 00 00 00       	call   803b1c <create_test_proc>
}
  803b19:	90                   	nop
  803b1a:	c9                   	leave  
  803b1b:	c3                   	ret    

0000000000803b1c <create_test_proc>:
void create_test_proc(){
  803b1c:	f3 0f 1e fa          	endbr64 
  803b20:	55                   	push   rbp
  803b21:	48 89 e5             	mov    rbp,rsp
  803b24:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803b28:	b8 00 00 00 00       	mov    eax,0x0
  803b2d:	e8 45 02 00 00       	call   803d77 <req_proc>
  803b32:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803b35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b38:	48 63 d0             	movsxd rdx,eax
  803b3b:	48 89 d0             	mov    rax,rdx
  803b3e:	48 01 c0             	add    rax,rax
  803b41:	48 01 d0             	add    rax,rdx
  803b44:	48 c1 e0 08          	shl    rax,0x8
  803b48:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b4e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803b54:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803b5b:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803b5f:	ba 02 a4 80 00       	mov    edx,0x80a402
  803b64:	48 83 ec 08          	sub    rsp,0x8
  803b68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b6b:	50                   	push   rax
  803b6c:	6a 00                	push   0x0
  803b6e:	52                   	push   rdx
  803b6f:	6a 00                	push   0x0
  803b71:	6a 00                	push   0x0
  803b73:	6a 00                	push   0x0
  803b75:	68 58 7d 00 00       	push   0x7d58
  803b7a:	6a 10                	push   0x10
  803b7c:	6a 10                	push   0x10
  803b7e:	6a 10                	push   0x10
  803b80:	6a 10                	push   0x10
  803b82:	41 b9 08 00 00 00    	mov    r9d,0x8
  803b88:	41 b8 10 00 00 00    	mov    r8d,0x10
  803b8e:	b9 00 00 00 00       	mov    ecx,0x0
  803b93:	ba 00 00 00 00       	mov    edx,0x0
  803b98:	be 00 00 00 00       	mov    esi,0x0
  803b9d:	bf 00 00 00 00       	mov    edi,0x0
  803ba2:	e8 c9 02 00 00       	call   803e70 <set_proc>
  803ba7:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803bab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bae:	48 63 d0             	movsxd rdx,eax
  803bb1:	48 89 d0             	mov    rax,rdx
  803bb4:	48 01 c0             	add    rax,rax
  803bb7:	48 01 d0             	add    rax,rdx
  803bba:	48 c1 e0 08          	shl    rax,0x8
  803bbe:	48 05 68 86 40 00    	add    rax,0x408668
  803bc4:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803bcb:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803bd2:	00 
    str->rax=0;
  803bd3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd7:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803bde:	00 
    str->rbx=0;
  803bdf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be3:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803bea:	00 
    str->rcx=0;
  803beb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bef:	48 c7 40 68 00 00 00 	mov    QWORD PTR [rax+0x68],0x0
  803bf6:	00 
    str->rdx=0x1400000;//sysret采用的返回地址
  803bf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bfb:	48 c7 40 60 00 00 40 	mov    QWORD PTR [rax+0x60],0x1400000
  803c02:	01 
    str->rsi=0;
  803c03:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c07:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803c0e:	00 
    str->rdi=0;
  803c0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c13:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803c1a:	00 
    str->r15=0;
  803c1b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c1f:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803c26:	00 
    str->r14=0;
  803c27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c2b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803c32:	00 
    str->r13=0;
  803c33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c37:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803c3e:	00 
    str->r12=0;
  803c3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c43:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803c4a:	00 
    str->r11=0;
  803c4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c4f:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803c56:	00 
    str->r10=0;
  803c57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c5b:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803c62:	00 
    str->r9=0;
  803c63:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c67:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803c6e:	00 
    str->r8=0;
  803c6f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c73:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803c7a:	00 
    str->rip=0x1400000;
  803c7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c7f:	48 c7 80 80 00 00 00 	mov    QWORD PTR [rax+0x80],0x1400000
  803c86:	00 00 40 01 
    str->cs=0x8;
  803c8a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c8e:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803c95:	08 00 00 00 
    str->rflags=0x00200006;
  803c99:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c9d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803ca4:	06 00 20 00 
    str->rsp=0x7e00;
  803ca8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cac:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803cb3:	00 7e 00 00 
    str->ss=0x2b;
  803cb7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cbb:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803cc2:	2b 00 00 00 
    str->ds=0x2b;
  803cc6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cca:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803cd1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cd5:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803cdc:	00 
    memcpy(0x1400000,proc_zero,1024);
  803cdd:	ba 00 04 00 00       	mov    edx,0x400
  803ce2:	be dc 3f 80 00       	mov    esi,0x803fdc
  803ce7:	bf 00 00 40 01       	mov    edi,0x1400000
  803cec:	e8 95 5d 00 00       	call   809a86 <memcpy>

}
  803cf1:	90                   	nop
  803cf2:	c9                   	leave  
  803cf3:	c3                   	ret    

0000000000803cf4 <create_proc>:
int create_proc()
{
  803cf4:	f3 0f 1e fa          	endbr64 
  803cf8:	55                   	push   rbp
  803cf9:	48 89 e5             	mov    rbp,rsp
  803cfc:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803d00:	b8 00 00 00 00       	mov    eax,0x0
  803d05:	e8 6d 00 00 00       	call   803d77 <req_proc>
  803d0a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803d0d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803d11:	75 07                	jne    803d1a <create_proc+0x26>
  803d13:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803d18:	eb 5b                	jmp    803d75 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803d1a:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803d21:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803d25:	b9 dc 3f 80 00       	mov    ecx,0x803fdc
  803d2a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803d2d:	48 98                	cdqe   
  803d2f:	48 83 ec 08          	sub    rsp,0x8
  803d33:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803d36:	52                   	push   rdx
  803d37:	6a 00                	push   0x0
  803d39:	51                   	push   rcx
  803d3a:	6a 00                	push   0x0
  803d3c:	6a 00                	push   0x0
  803d3e:	6a 00                	push   0x0
  803d40:	50                   	push   rax
  803d41:	6a 10                	push   0x10
  803d43:	6a 10                	push   0x10
  803d45:	6a 10                	push   0x10
  803d47:	6a 10                	push   0x10
  803d49:	41 b9 08 00 00 00    	mov    r9d,0x8
  803d4f:	41 b8 10 00 00 00    	mov    r8d,0x10
  803d55:	b9 00 00 00 00       	mov    ecx,0x0
  803d5a:	ba 00 00 00 00       	mov    edx,0x0
  803d5f:	be 00 00 00 00       	mov    esi,0x0
  803d64:	bf 00 00 00 00       	mov    edi,0x0
  803d69:	e8 02 01 00 00       	call   803e70 <set_proc>
  803d6e:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803d72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803d75:	c9                   	leave  
  803d76:	c3                   	ret    

0000000000803d77 <req_proc>:
int req_proc(){
  803d77:	f3 0f 1e fa          	endbr64 
  803d7b:	55                   	push   rbp
  803d7c:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803d7f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d86:	eb 04                	jmp    803d8c <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803d88:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d8f:	48 63 d0             	movsxd rdx,eax
  803d92:	48 89 d0             	mov    rax,rdx
  803d95:	48 01 c0             	add    rax,rax
  803d98:	48 01 d0             	add    rax,rdx
  803d9b:	48 c1 e0 08          	shl    rax,0x8
  803d9f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803da5:	8b 00                	mov    eax,DWORD PTR [rax]
  803da7:	83 f8 ff             	cmp    eax,0xffffffff
  803daa:	74 26                	je     803dd2 <req_proc+0x5b>
  803dac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803daf:	48 63 d0             	movsxd rdx,eax
  803db2:	48 89 d0             	mov    rax,rdx
  803db5:	48 01 c0             	add    rax,rax
  803db8:	48 01 d0             	add    rax,rdx
  803dbb:	48 c1 e0 08          	shl    rax,0x8
  803dbf:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803dc5:	8b 00                	mov    eax,DWORD PTR [rax]
  803dc7:	83 f8 03             	cmp    eax,0x3
  803dca:	74 06                	je     803dd2 <req_proc+0x5b>
  803dcc:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803dd0:	7e b6                	jle    803d88 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803dd2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803dd6:	7e 0a                	jle    803de2 <req_proc+0x6b>
        return -1;
  803dd8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803ddd:	e9 8c 00 00 00       	jmp    803e6e <req_proc+0xf7>
    task[num].pid=pidd++;
  803de2:	8b 05 28 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10728]        # 414510 <pidd>
  803de8:	8d 50 01             	lea    edx,[rax+0x1]
  803deb:	89 15 1f 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1071f],edx        # 414510 <pidd>
  803df1:	89 c1                	mov    ecx,eax
  803df3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803df6:	48 63 d0             	movsxd rdx,eax
  803df9:	48 89 d0             	mov    rax,rdx
  803dfc:	48 01 c0             	add    rax,rax
  803dff:	48 01 d0             	add    rax,rdx
  803e02:	48 c1 e0 08          	shl    rax,0x8
  803e06:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e0c:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803e0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e11:	48 63 d0             	movsxd rdx,eax
  803e14:	48 89 d0             	mov    rax,rdx
  803e17:	48 01 c0             	add    rax,rax
  803e1a:	48 01 d0             	add    rax,rdx
  803e1d:	48 c1 e0 08          	shl    rax,0x8
  803e21:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803e27:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803e2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e30:	48 63 d0             	movsxd rdx,eax
  803e33:	48 89 d0             	mov    rax,rdx
  803e36:	48 01 c0             	add    rax,rax
  803e39:	48 01 d0             	add    rax,rdx
  803e3c:	48 c1 e0 08          	shl    rax,0x8
  803e40:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803e46:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803e4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e4f:	48 63 d0             	movsxd rdx,eax
  803e52:	48 89 d0             	mov    rax,rdx
  803e55:	48 01 c0             	add    rax,rax
  803e58:	48 01 d0             	add    rax,rdx
  803e5b:	48 c1 e0 08          	shl    rax,0x8
  803e5f:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803e65:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803e6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803e6e:	5d                   	pop    rbp
  803e6f:	c3                   	ret    

0000000000803e70 <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803e70:	f3 0f 1e fa          	endbr64 
  803e74:	55                   	push   rbp
  803e75:	48 89 e5             	mov    rbp,rsp
  803e78:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803e7c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803e80:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803e84:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803e88:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803e8c:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803e90:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803e93:	48 63 d0             	movsxd rdx,eax
  803e96:	48 89 d0             	mov    rax,rdx
  803e99:	48 01 c0             	add    rax,rax
  803e9c:	48 01 d0             	add    rax,rdx
  803e9f:	48 c1 e0 08          	shl    rax,0x8
  803ea3:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803ea9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803ead:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803eb5:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803ebc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ec0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803ec4:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803ecb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ecf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803ed3:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803eda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ede:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803ee2:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803ee9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eed:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ef1:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803ef8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803efc:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803f00:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803f07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803f0f:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803f16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f1a:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f1e:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803f25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f29:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803f2d:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803f34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f38:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803f3c:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803f43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f47:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803f4b:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f56:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803f5a:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803f61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f65:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803f69:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803f70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f74:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803f78:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803f7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f83:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803f8a:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803f8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f92:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803f96:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803f9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fa1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803fa5:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803fac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb0:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803fb4:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803fbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fbf:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803fc3:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803fca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fce:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803fd5:	00 10 10 00 


}
  803fd9:	90                   	nop
  803fda:	5d                   	pop    rbp
  803fdb:	c3                   	ret    

0000000000803fdc <proc_zero>:
void proc_zero()
{
  803fdc:	f3 0f 1e fa          	endbr64 
  803fe0:	55                   	push   rbp
  803fe1:	48 89 e5             	mov    rbp,rsp
    asm volatile("leave\n"
  803fe4:	c9                   	leave  
  803fe5:	58                   	pop    rax
  803fe6:	8e d8                	mov    ds,eax
  803fe8:	58                   	pop    rax
  803fe9:	8e c0                	mov    es,eax
  803feb:	41 5f                	pop    r15
  803fed:	41 5e                	pop    r14
  803fef:	41 5d                	pop    r13
  803ff1:	41 5c                	pop    r12
  803ff3:	41 5b                	pop    r11
  803ff5:	41 5a                	pop    r10
  803ff7:	41 59                	pop    r9
  803ff9:	41 58                	pop    r8
  803ffb:	5e                   	pop    rsi
  803ffc:	5f                   	pop    rdi
  803ffd:	5a                   	pop    rdx
  803ffe:	59                   	pop    rcx
  803fff:	5b                   	pop    rbx
  804000:	58                   	pop    rax
  804001:	e8 18 0f 00 00       	call   804f1e <eoi>
  804006:	48 cf                	iretq  

0000000000804008 <dd>:
  804008:	90                   	nop
                 "popq %rax\n"
                 "callq eoi\n"
                 "iretq\n"
                 "dd:\n"
                 "nop\n");
    while(1);
  804009:	eb fe                	jmp    804009 <dd+0x1>

000000000080400b <manage_proc>:
}
void manage_proc(){
  80400b:	f3 0f 1e fa          	endbr64 
  80400f:	55                   	push   rbp
  804010:	48 89 e5             	mov    rbp,rsp
  804013:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  804017:	8b 05 ef 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104ef]        # 41450c <cur_proc>
  80401d:	83 f8 ff             	cmp    eax,0xffffffff
  804020:	74 39                	je     80405b <manage_proc+0x50>
        task[cur_proc].utime++;
  804022:	8b 15 e4 04 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc104e4]        # 41450c <cur_proc>
  804028:	48 63 ca             	movsxd rcx,edx
  80402b:	48 89 c8             	mov    rax,rcx
  80402e:	48 01 c0             	add    rax,rax
  804031:	48 01 c8             	add    rax,rcx
  804034:	48 c1 e0 08          	shl    rax,0x8
  804038:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80403e:	8b 00                	mov    eax,DWORD PTR [rax]
  804040:	8d 48 01             	lea    ecx,[rax+0x1]
  804043:	48 63 d2             	movsxd rdx,edx
  804046:	48 89 d0             	mov    rax,rdx
  804049:	48 01 c0             	add    rax,rax
  80404c:	48 01 d0             	add    rax,rdx
  80404f:	48 c1 e0 08          	shl    rax,0x8
  804053:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804059:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80405b:	8b 05 ab 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104ab]        # 41450c <cur_proc>
  804061:	83 f8 ff             	cmp    eax,0xffffffff
  804064:	74 4a                	je     8040b0 <manage_proc+0xa5>
  804066:	8b 05 a0 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104a0]        # 41450c <cur_proc>
  80406c:	48 63 d0             	movsxd rdx,eax
  80406f:	48 89 d0             	mov    rax,rdx
  804072:	48 01 c0             	add    rax,rax
  804075:	48 01 d0             	add    rax,rdx
  804078:	48 c1 e0 08          	shl    rax,0x8
  80407c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804082:	8b 00                	mov    eax,DWORD PTR [rax]
  804084:	83 f8 01             	cmp    eax,0x1
  804087:	77 27                	ja     8040b0 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  804089:	8b 05 7d 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1047d]        # 41450c <cur_proc>
  80408f:	48 63 d0             	movsxd rdx,eax
  804092:	48 89 d0             	mov    rax,rdx
  804095:	48 01 c0             	add    rax,rax
  804098:	48 01 d0             	add    rax,rdx
  80409b:	48 c1 e0 08          	shl    rax,0x8
  80409f:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040a5:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  8040a7:	83 f8 01             	cmp    eax,0x1
  8040aa:	0f 84 21 01 00 00    	je     8041d1 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  8040b0:	8b 05 56 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10456]        # 41450c <cur_proc>
  8040b6:	83 f8 ff             	cmp    eax,0xffffffff
  8040b9:	74 22                	je     8040dd <manage_proc+0xd2>
            task[cur_proc].utime=0;
  8040bb:	8b 05 4b 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1044b]        # 41450c <cur_proc>
  8040c1:	48 63 d0             	movsxd rdx,eax
  8040c4:	48 89 d0             	mov    rax,rdx
  8040c7:	48 01 c0             	add    rax,rax
  8040ca:	48 01 d0             	add    rax,rdx
  8040cd:	48 c1 e0 08          	shl    rax,0x8
  8040d1:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8040d7:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  8040dd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  8040e4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8040eb:	eb 4f                	jmp    80413c <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  8040ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040f0:	48 63 d0             	movsxd rdx,eax
  8040f3:	48 89 d0             	mov    rax,rdx
  8040f6:	48 01 c0             	add    rax,rax
  8040f9:	48 01 d0             	add    rax,rdx
  8040fc:	48 c1 e0 08          	shl    rax,0x8
  804100:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804106:	8b 00                	mov    eax,DWORD PTR [rax]
  804108:	83 f8 ff             	cmp    eax,0xffffffff
  80410b:	74 2b                	je     804138 <manage_proc+0x12d>
  80410d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804110:	48 63 d0             	movsxd rdx,eax
  804113:	48 89 d0             	mov    rax,rdx
  804116:	48 01 c0             	add    rax,rax
  804119:	48 01 d0             	add    rax,rdx
  80411c:	48 c1 e0 08          	shl    rax,0x8
  804120:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804126:	8b 00                	mov    eax,DWORD PTR [rax]
  804128:	83 f8 01             	cmp    eax,0x1
  80412b:	75 0b                	jne    804138 <manage_proc+0x12d>
  80412d:	8b 05 d9 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103d9]        # 41450c <cur_proc>
  804133:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804136:	75 0c                	jne    804144 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804138:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80413c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804140:	7e ab                	jle    8040ed <manage_proc+0xe2>
  804142:	eb 01                	jmp    804145 <manage_proc+0x13a>
                break;
  804144:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  804145:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804149:	0f 8f 85 00 00 00    	jg     8041d4 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  80414f:	8b 05 b7 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103b7]        # 41450c <cur_proc>
  804155:	48 63 d0             	movsxd rdx,eax
  804158:	48 89 d0             	mov    rax,rdx
  80415b:	48 01 c0             	add    rax,rax
  80415e:	48 01 d0             	add    rax,rdx
  804161:	48 c1 e0 08          	shl    rax,0x8
  804165:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80416b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804171:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804174:	48 63 d0             	movsxd rdx,eax
  804177:	48 89 d0             	mov    rax,rdx
  80417a:	48 01 c0             	add    rax,rax
  80417d:	48 01 d0             	add    rax,rdx
  804180:	48 c1 e0 08          	shl    rax,0x8
  804184:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80418a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  804190:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804193:	48 63 d0             	movsxd rdx,eax
  804196:	48 89 d0             	mov    rax,rdx
  804199:	48 01 c0             	add    rax,rax
  80419c:	48 01 d0             	add    rax,rdx
  80419f:	48 c1 e0 08          	shl    rax,0x8
  8041a3:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8041aa:	8b 05 5c 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1035c]        # 41450c <cur_proc>
  8041b0:	48 63 c8             	movsxd rcx,eax
  8041b3:	48 89 c8             	mov    rax,rcx
  8041b6:	48 01 c0             	add    rax,rax
  8041b9:	48 01 c8             	add    rax,rcx
  8041bc:	48 c1 e0 08          	shl    rax,0x8
  8041c0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041c6:	48 89 d6             	mov    rsi,rdx
  8041c9:	48 89 c7             	mov    rdi,rax
  8041cc:	e8 fd 0a 00 00       	call   804cce <switch_to>
    }
    return;
  8041d1:	90                   	nop
  8041d2:	eb 01                	jmp    8041d5 <manage_proc+0x1ca>
            return;
  8041d4:	90                   	nop
}
  8041d5:	c9                   	leave  
  8041d6:	c3                   	ret    

00000000008041d7 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  8041d7:	f3 0f 1e fa          	endbr64 
  8041db:	55                   	push   rbp
  8041dc:	48 89 e5             	mov    rbp,rsp
  8041df:	48 83 ec 20          	sub    rsp,0x20
  8041e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  8041e6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8041e9:	01 c0                	add    eax,eax
  8041eb:	83 c0 05             	add    eax,0x5
  8041ee:	c1 e0 03             	shl    eax,0x3
  8041f1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  8041f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8041f7:	89 05 0f 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1030f],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  8041fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804200:	89 c7                	mov    edi,eax
  804202:	e8 13 61 00 00       	call   80a31a <switch_proc_asm>
}
  804207:	90                   	nop
  804208:	c9                   	leave  
  804209:	c3                   	ret    

000000000080420a <switch_proc>:
void switch_proc(int pnr){
  80420a:	f3 0f 1e fa          	endbr64 
  80420e:	55                   	push   rbp
  80420f:	48 89 e5             	mov    rbp,rsp
  804212:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  804219:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80421f:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804225:	48 63 d0             	movsxd rdx,eax
  804228:	48 89 d0             	mov    rax,rdx
  80422b:	48 01 c0             	add    rax,rax
  80422e:	48 01 d0             	add    rax,rdx
  804231:	48 c1 e0 08          	shl    rax,0x8
  804235:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80423c:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  804243:	48 89 d6             	mov    rsi,rdx
  804246:	ba 60 00 00 00       	mov    edx,0x60
  80424b:	48 89 c7             	mov    rdi,rax
  80424e:	48 89 d1             	mov    rcx,rdx
  804251:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  804254:	8b 05 b2 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc102b2]        # 41450c <cur_proc>
  80425a:	48 63 d0             	movsxd rdx,eax
  80425d:	48 89 d0             	mov    rax,rdx
  804260:	48 01 c0             	add    rax,rax
  804263:	48 01 d0             	add    rax,rdx
  804266:	48 c1 e0 08          	shl    rax,0x8
  80426a:	48 05 c0 01 00 00    	add    rax,0x1c0
  804270:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804276:	48 83 c0 04          	add    rax,0x4
  80427a:	48 89 c7             	mov    rdi,rax
  80427d:	e8 53 00 00 00       	call   8042d5 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804282:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804288:	89 05 7e 02 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1027e],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  80428e:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804294:	01 c0                	add    eax,eax
  804296:	83 c0 05             	add    eax,0x5
  804299:	c1 e0 03             	shl    eax,0x3
  80429c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  80429f:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8042a5:	48 63 d0             	movsxd rdx,eax
  8042a8:	48 89 d0             	mov    rax,rdx
  8042ab:	48 01 c0             	add    rax,rax
  8042ae:	48 01 d0             	add    rax,rdx
  8042b1:	48 c1 e0 08          	shl    rax,0x8
  8042b5:	48 05 c0 01 00 00    	add    rax,0x1c0
  8042bb:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8042c1:	48 83 c0 04          	add    rax,0x4
  8042c5:	48 89 c6             	mov    rsi,rax
  8042c8:	bf 00 00 00 00       	mov    edi,0x0
  8042cd:	e8 fc 09 00 00       	call   804cce <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  8042d2:	90                   	nop
  8042d3:	c9                   	leave  
  8042d4:	c3                   	ret    

00000000008042d5 <save_context>:
void save_context(TSS *tss)
{
  8042d5:	f3 0f 1e fa          	endbr64 
  8042d9:	55                   	push   rbp
  8042da:	48 89 e5             	mov    rbp,rsp
  8042dd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  8042e1:	90                   	nop
  8042e2:	5d                   	pop    rbp
  8042e3:	c3                   	ret    

00000000008042e4 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  8042e4:	f3 0f 1e fa          	endbr64 
  8042e8:	55                   	push   rbp
  8042e9:	48 89 e5             	mov    rbp,rsp
  8042ec:	48 83 ec 60          	sub    rsp,0x60
  8042f0:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8042f3:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  8042f6:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8042f9:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8042ff:	85 c0                	test   eax,eax
  804301:	0f 48 c2             	cmovs  eax,edx
  804304:	c1 f8 0c             	sar    eax,0xc
  804307:	89 c1                	mov    ecx,eax
  804309:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80430c:	99                   	cdq    
  80430d:	c1 ea 14             	shr    edx,0x14
  804310:	01 d0                	add    eax,edx
  804312:	25 ff 0f 00 00       	and    eax,0xfff
  804317:	29 d0                	sub    eax,edx
  804319:	01 c8                	add    eax,ecx
  80431b:	85 c0                	test   eax,eax
  80431d:	0f 95 c0             	setne  al
  804320:	0f b6 c0             	movzx  eax,al
  804323:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804326:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  80432d:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  804334:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804335:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80433c:	00 
    pgind++;
  80433d:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804342:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  804349:	e9 76 02 00 00       	jmp    8045c4 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  80434e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804352:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804355:	25 00 f0 ff ff       	and    eax,0xfffff000
  80435a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80435e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  804365:	e9 44 02 00 00       	jmp    8045ae <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  80436a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80436e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804371:	83 e0 01             	and    eax,0x1
  804374:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804377:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80437b:	0f 85 24 02 00 00    	jne    8045a5 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  804381:	b8 00 00 00 00       	mov    eax,0x0
  804386:	e8 ce d0 ff ff       	call   801459 <req_a_page>
  80438b:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  80438e:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  804392:	0f 85 dc 00 00 00    	jne    804474 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804398:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80439b:	48 63 d0             	movsxd rdx,eax
  80439e:	48 89 d0             	mov    rax,rdx
  8043a1:	48 01 c0             	add    rax,rax
  8043a4:	48 01 d0             	add    rax,rdx
  8043a7:	48 c1 e0 08          	shl    rax,0x8
  8043ab:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8043b1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8043b4:	0f b7 c0             	movzx  eax,ax
  8043b7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8043ba:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043bd:	48 63 d0             	movsxd rdx,eax
  8043c0:	48 89 d0             	mov    rax,rdx
  8043c3:	48 01 c0             	add    rax,rax
  8043c6:	48 01 d0             	add    rax,rdx
  8043c9:	48 c1 e0 08          	shl    rax,0x8
  8043cd:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8043d3:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8043d7:	0f b7 c0             	movzx  eax,ax
  8043da:	c1 e0 10             	shl    eax,0x10
  8043dd:	25 00 00 0f 00       	and    eax,0xf0000
  8043e2:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  8043e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8043e8:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8043eb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8043ee:	89 c1                	mov    ecx,eax
  8043f0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043f3:	48 63 d0             	movsxd rdx,eax
  8043f6:	48 89 d0             	mov    rax,rdx
  8043f9:	48 01 c0             	add    rax,rax
  8043fc:	48 01 d0             	add    rax,rdx
  8043ff:	48 c1 e0 08          	shl    rax,0x8
  804403:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804409:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80440c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80440f:	48 63 d0             	movsxd rdx,eax
  804412:	48 89 d0             	mov    rax,rdx
  804415:	48 01 c0             	add    rax,rax
  804418:	48 01 d0             	add    rax,rdx
  80441b:	48 c1 e0 08          	shl    rax,0x8
  80441f:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804425:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804429:	0f b7 c0             	movzx  eax,ax
  80442c:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  80442f:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804436:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804439:	c1 e8 10             	shr    eax,0x10
  80443c:	83 e0 0f             	and    eax,0xf
  80443f:	89 c2                	mov    edx,eax
  804441:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804444:	01 d0                	add    eax,edx
  804446:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804449:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80444c:	89 c1                	mov    ecx,eax
  80444e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804451:	48 63 d0             	movsxd rdx,eax
  804454:	48 89 d0             	mov    rax,rdx
  804457:	48 01 c0             	add    rax,rax
  80445a:	48 01 d0             	add    rax,rdx
  80445d:	48 c1 e0 08          	shl    rax,0x8
  804461:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804467:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  80446b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80446f:	e9 62 01 00 00       	jmp    8045d6 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  804474:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804477:	89 c7                	mov    edi,eax
  804479:	e8 89 d1 ff ff       	call   801607 <get_phyaddr>
  80447e:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804481:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  804484:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804488:	ba 07 00 00 00       	mov    edx,0x7
  80448d:	89 ce                	mov    esi,ecx
  80448f:	48 89 c7             	mov    rdi,rax
  804492:	e8 83 d1 ff ff       	call   80161a <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804497:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80449a:	c1 e0 0a             	shl    eax,0xa
  80449d:	89 c2                	mov    edx,eax
  80449f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8044a2:	01 d0                	add    eax,edx
  8044a4:	c1 e0 0c             	shl    eax,0xc
  8044a7:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8044aa:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8044af:	75 09                	jne    8044ba <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8044b1:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8044b4:	89 05 5a 00 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1005a],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8044ba:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8044be:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8044c2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8044c6:	0f 85 d9 00 00 00    	jne    8045a5 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8044cc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044cf:	48 63 d0             	movsxd rdx,eax
  8044d2:	48 89 d0             	mov    rax,rdx
  8044d5:	48 01 c0             	add    rax,rax
  8044d8:	48 01 d0             	add    rax,rdx
  8044db:	48 c1 e0 08          	shl    rax,0x8
  8044df:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8044e5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8044e8:	0f b7 c0             	movzx  eax,ax
  8044eb:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8044ee:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044f1:	48 63 d0             	movsxd rdx,eax
  8044f4:	48 89 d0             	mov    rax,rdx
  8044f7:	48 01 c0             	add    rax,rax
  8044fa:	48 01 d0             	add    rax,rdx
  8044fd:	48 c1 e0 08          	shl    rax,0x8
  804501:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804507:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80450b:	0f b7 c0             	movzx  eax,ax
  80450e:	c1 e0 10             	shl    eax,0x10
  804511:	25 00 00 0f 00       	and    eax,0xf0000
  804516:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804519:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80451c:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80451f:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804522:	89 c1                	mov    ecx,eax
  804524:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804527:	48 63 d0             	movsxd rdx,eax
  80452a:	48 89 d0             	mov    rax,rdx
  80452d:	48 01 c0             	add    rax,rax
  804530:	48 01 d0             	add    rax,rdx
  804533:	48 c1 e0 08          	shl    rax,0x8
  804537:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80453d:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804540:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804543:	48 63 d0             	movsxd rdx,eax
  804546:	48 89 d0             	mov    rax,rdx
  804549:	48 01 c0             	add    rax,rax
  80454c:	48 01 d0             	add    rax,rdx
  80454f:	48 c1 e0 08          	shl    rax,0x8
  804553:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804559:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80455d:	0f b7 c0             	movzx  eax,ax
  804560:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804563:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80456a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80456d:	c1 e8 10             	shr    eax,0x10
  804570:	83 e0 0f             	and    eax,0xf
  804573:	89 c2                	mov    edx,eax
  804575:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804578:	01 d0                	add    eax,edx
  80457a:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80457d:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804580:	89 c1                	mov    ecx,eax
  804582:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804585:	48 63 d0             	movsxd rdx,eax
  804588:	48 89 d0             	mov    rax,rdx
  80458b:	48 01 c0             	add    rax,rax
  80458e:	48 01 d0             	add    rax,rdx
  804591:	48 c1 e0 08          	shl    rax,0x8
  804595:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80459b:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  80459f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8045a3:	eb 31                	jmp    8045d6 <palloc+0x2f2>
                }
            }
            tblp++;
  8045a5:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8045aa:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8045ae:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8045b5:	0f 8e af fd ff ff    	jle    80436a <palloc+0x86>
        }
        pgind++;
  8045bb:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8045c0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8045c4:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8045cb:	0f 8e 7d fd ff ff    	jle    80434e <palloc+0x6a>
    }
    return NULL;
  8045d1:	b8 00 00 00 00       	mov    eax,0x0
}
  8045d6:	c9                   	leave  
  8045d7:	c3                   	ret    

00000000008045d8 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8045d8:	f3 0f 1e fa          	endbr64 
  8045dc:	55                   	push   rbp
  8045dd:	48 89 e5             	mov    rbp,rsp
  8045e0:	48 83 ec 10          	sub    rsp,0x10
  8045e4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8045e7:	8b 05 1f ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff1f]        # 41450c <cur_proc>
  8045ed:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8045f0:	89 d6                	mov    esi,edx
  8045f2:	89 c7                	mov    edi,eax
  8045f4:	e8 eb fc ff ff       	call   8042e4 <palloc>
}
  8045f9:	c9                   	leave  
  8045fa:	c3                   	ret    

00000000008045fb <proc_end>:
void proc_end()
{
  8045fb:	f3 0f 1e fa          	endbr64 
  8045ff:	55                   	push   rbp
  804600:	48 89 e5             	mov    rbp,rsp
  804603:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804607:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  80460a:	8b 05 fc fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fefc]        # 41450c <cur_proc>
  804610:	89 c7                	mov    edi,eax
  804612:	e8 90 00 00 00       	call   8046a7 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804617:	8b 05 ef fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0feef]        # 41450c <cur_proc>
  80461d:	48 63 d0             	movsxd rdx,eax
  804620:	48 89 d0             	mov    rax,rdx
  804623:	48 01 c0             	add    rax,rax
  804626:	48 01 d0             	add    rax,rdx
  804629:	48 c1 e0 08          	shl    rax,0x8
  80462d:	48 05 28 85 40 00    	add    rax,0x408528
  804633:	8b 00                	mov    eax,DWORD PTR [rax]
  804635:	83 f8 ff             	cmp    eax,0xffffffff
  804638:	74 60                	je     80469a <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  80463a:	8b 05 cc fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fecc]        # 41450c <cur_proc>
  804640:	48 63 d0             	movsxd rdx,eax
  804643:	48 89 d0             	mov    rax,rdx
  804646:	48 01 c0             	add    rax,rax
  804649:	48 01 d0             	add    rax,rdx
  80464c:	48 c1 e0 08          	shl    rax,0x8
  804650:	48 05 28 85 40 00    	add    rax,0x408528
  804656:	8b 00                	mov    eax,DWORD PTR [rax]
  804658:	89 c2                	mov    edx,eax
  80465a:	48 89 d0             	mov    rax,rdx
  80465d:	48 01 c0             	add    rax,rax
  804660:	48 01 d0             	add    rax,rdx
  804663:	48 c1 e0 08          	shl    rax,0x8
  804667:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80466d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804673:	8b 05 93 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe93]        # 41450c <cur_proc>
  804679:	48 63 d0             	movsxd rdx,eax
  80467c:	48 89 d0             	mov    rax,rdx
  80467f:	48 01 c0             	add    rax,rax
  804682:	48 01 d0             	add    rax,rdx
  804685:	48 c1 e0 08          	shl    rax,0x8
  804689:	48 05 28 85 40 00    	add    rax,0x408528
  80468f:	8b 00                	mov    eax,DWORD PTR [rax]
  804691:	89 c7                	mov    edi,eax
  804693:	e8 3f fb ff ff       	call   8041d7 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804698:	eb 0a                	jmp    8046a4 <proc_end+0xa9>
        switch_proc_tss(0);
  80469a:	bf 00 00 00 00       	mov    edi,0x0
  80469f:	e8 33 fb ff ff       	call   8041d7 <switch_proc_tss>
}
  8046a4:	90                   	nop
  8046a5:	c9                   	leave  
  8046a6:	c3                   	ret    

00000000008046a7 <del_proc>:
void del_proc(int pnr)
{
  8046a7:	f3 0f 1e fa          	endbr64 
  8046ab:	55                   	push   rbp
  8046ac:	48 89 e5             	mov    rbp,rsp
  8046af:	48 83 ec 30          	sub    rsp,0x30
  8046b3:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8046b6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8046b9:	48 63 d0             	movsxd rdx,eax
  8046bc:	48 89 d0             	mov    rax,rdx
  8046bf:	48 01 c0             	add    rax,rax
  8046c2:	48 01 d0             	add    rax,rdx
  8046c5:	48 c1 e0 08          	shl    rax,0x8
  8046c9:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8046cf:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8046d5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8046d8:	48 63 d0             	movsxd rdx,eax
  8046db:	48 89 d0             	mov    rax,rdx
  8046de:	48 01 c0             	add    rax,rax
  8046e1:	48 01 d0             	add    rax,rdx
  8046e4:	48 c1 e0 08          	shl    rax,0x8
  8046e8:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046ee:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  8046f4:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8046f9:	eb 63                	jmp    80475e <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  8046fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804702:	25 00 f0 ff ff       	and    eax,0xfffff000
  804707:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80470b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804712:	eb 30                	jmp    804744 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804714:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804718:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80471b:	83 e0 01             	and    eax,0x1
  80471e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804721:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804725:	74 14                	je     80473b <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804727:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80472b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80472e:	25 00 f0 ff ff       	and    eax,0xfffff000
  804733:	48 89 c7             	mov    rdi,rax
  804736:	e8 ee cd ff ff       	call   801529 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80473b:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804740:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804744:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80474b:	7e c7                	jle    804714 <del_proc+0x6d>
        }
        vmfree(tp);
  80474d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804751:	48 89 c7             	mov    rdi,rax
  804754:	e8 fb c9 ff ff       	call   801154 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804759:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80475e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804762:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804765:	83 e0 01             	and    eax,0x1
  804768:	48 85 c0             	test   rax,rax
  80476b:	75 8e                	jne    8046fb <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  80476d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804771:	48 89 c7             	mov    rdi,rax
  804774:	e8 db c9 ff ff       	call   801154 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804779:	90                   	nop
  80477a:	c9                   	leave  
  80477b:	c3                   	ret    

000000000080477c <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  80477c:	f3 0f 1e fa          	endbr64 
  804780:	55                   	push   rbp
  804781:	48 89 e5             	mov    rbp,rsp
  804784:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804787:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  80478a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80478e:	75 0a                	jne    80479a <set_proc_stat+0x1e>
  804790:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804795:	e9 8c 00 00 00       	jmp    804826 <set_proc_stat+0xaa>
    int i=0;
  80479a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8047a1:	eb 04                	jmp    8047a7 <set_proc_stat+0x2b>
  8047a3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8047a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047aa:	48 63 d0             	movsxd rdx,eax
  8047ad:	48 89 d0             	mov    rax,rdx
  8047b0:	48 01 c0             	add    rax,rax
  8047b3:	48 01 d0             	add    rax,rdx
  8047b6:	48 c1 e0 08          	shl    rax,0x8
  8047ba:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8047c0:	8b 10                	mov    edx,DWORD PTR [rax]
  8047c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047c5:	39 c2                	cmp    edx,eax
  8047c7:	75 da                	jne    8047a3 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  8047c9:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8047cd:	75 07                	jne    8047d6 <set_proc_stat+0x5a>
  8047cf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8047d4:	eb 50                	jmp    804826 <set_proc_stat+0xaa>
    task[i].stat=stat;
  8047d6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8047d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047dc:	48 63 c8             	movsxd rcx,eax
  8047df:	48 89 c8             	mov    rax,rcx
  8047e2:	48 01 c0             	add    rax,rax
  8047e5:	48 01 c8             	add    rax,rcx
  8047e8:	48 c1 e0 08          	shl    rax,0x8
  8047ec:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8047f2:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8047f4:	8b 05 12 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd12]        # 41450c <cur_proc>
  8047fa:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8047fd:	75 22                	jne    804821 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  8047ff:	8b 05 07 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd07]        # 41450c <cur_proc>
  804805:	48 63 d0             	movsxd rdx,eax
  804808:	48 89 d0             	mov    rax,rdx
  80480b:	48 01 c0             	add    rax,rax
  80480e:	48 01 d0             	add    rax,rdx
  804811:	48 c1 e0 08          	shl    rax,0x8
  804815:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80481b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804821:	b8 00 00 00 00       	mov    eax,0x0
}
  804826:	5d                   	pop    rbp
  804827:	c3                   	ret    

0000000000804828 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804828:	f3 0f 1e fa          	endbr64 
  80482c:	55                   	push   rbp
  80482d:	48 89 e5             	mov    rbp,rsp
  804830:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804834:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80483b:	eb 6a                	jmp    8048a7 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  80483d:	8b 05 c9 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fcc9]        # 41450c <cur_proc>
  804843:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804846:	48 63 ca             	movsxd rcx,edx
  804849:	48 63 d0             	movsxd rdx,eax
  80484c:	48 89 d0             	mov    rax,rdx
  80484f:	48 01 c0             	add    rax,rax
  804852:	48 01 d0             	add    rax,rdx
  804855:	48 c1 e0 05          	shl    rax,0x5
  804859:	48 01 c8             	add    rax,rcx
  80485c:	48 83 c0 18          	add    rax,0x18
  804860:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  804867:	00 
  804868:	48 85 c0             	test   rax,rax
  80486b:	75 36                	jne    8048a3 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  80486d:	8b 05 99 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc99]        # 41450c <cur_proc>
  804873:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804876:	48 63 ca             	movsxd rcx,edx
  804879:	48 63 d0             	movsxd rdx,eax
  80487c:	48 89 d0             	mov    rax,rdx
  80487f:	48 01 c0             	add    rax,rax
  804882:	48 01 d0             	add    rax,rdx
  804885:	48 c1 e0 05          	shl    rax,0x5
  804889:	48 01 c8             	add    rax,rcx
  80488c:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804890:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804894:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  80489b:	00 
            return 0;
  80489c:	b8 00 00 00 00       	mov    eax,0x0
  8048a1:	eb 0f                	jmp    8048b2 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8048a3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8048a7:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8048ab:	7e 90                	jle    80483d <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8048ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8048b2:	5d                   	pop    rbp
  8048b3:	c3                   	ret    

00000000008048b4 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8048b4:	f3 0f 1e fa          	endbr64 
  8048b8:	55                   	push   rbp
  8048b9:	48 89 e5             	mov    rbp,rsp
  8048bc:	48 83 ec 10          	sub    rsp,0x10
  8048c0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8048c3:	8b 05 43 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc43]        # 41450c <cur_proc>
  8048c9:	89 c7                	mov    edi,eax
  8048cb:	e8 d7 fd ff ff       	call   8046a7 <del_proc>
    return code;
  8048d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8048d3:	c9                   	leave  
  8048d4:	c3                   	ret    

00000000008048d5 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8048d5:	f3 0f 1e fa          	endbr64 
  8048d9:	55                   	push   rbp
  8048da:	48 89 e5             	mov    rbp,rsp
  8048dd:	48 83 ec 40          	sub    rsp,0x40
  8048e1:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8048e4:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8048e8:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  8048ec:	b8 00 00 00 00       	mov    eax,0x0
  8048f1:	e8 81 f4 ff ff       	call   803d77 <req_proc>
  8048f6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  8048f9:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8048fd:	75 0a                	jne    804909 <reg_proc+0x34>
  8048ff:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804904:	e9 65 01 00 00       	jmp    804a6e <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  804909:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80490c:	50                   	push   rax
  80490d:	6a 00                	push   0x0
  80490f:	6a 00                	push   0x0
  804911:	6a 00                	push   0x0
  804913:	6a 00                	push   0x0
  804915:	6a 00                	push   0x0
  804917:	68 fc ff bf 01       	push   0x1bffffc
  80491c:	6a 10                	push   0x10
  80491e:	6a 10                	push   0x10
  804920:	6a 10                	push   0x10
  804922:	6a 10                	push   0x10
  804924:	41 b9 08 00 00 00    	mov    r9d,0x8
  80492a:	41 b8 10 00 00 00    	mov    r8d,0x10
  804930:	b9 00 00 00 00       	mov    ecx,0x0
  804935:	ba 00 00 00 00       	mov    edx,0x0
  80493a:	be 00 00 00 00       	mov    esi,0x0
  80493f:	bf 00 00 00 00       	mov    edi,0x0
  804944:	e8 27 f5 ff ff       	call   803e70 <set_proc>
  804949:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  80494d:	b8 00 00 00 00       	mov    eax,0x0
  804952:	e8 6e c7 ff ff       	call   8010c5 <vmalloc>
  804957:	48 89 c1             	mov    rcx,rax
  80495a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80495d:	48 63 d0             	movsxd rdx,eax
  804960:	48 89 d0             	mov    rax,rdx
  804963:	48 01 c0             	add    rax,rax
  804966:	48 01 d0             	add    rax,rdx
  804969:	48 c1 e0 08          	shl    rax,0x8
  80496d:	48 05 40 85 40 00    	add    rax,0x408540
  804973:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  804977:	b8 00 00 00 00       	mov    eax,0x0
  80497c:	e8 44 c7 ff ff       	call   8010c5 <vmalloc>
  804981:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  804985:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804988:	48 63 d0             	movsxd rdx,eax
  80498b:	48 89 d0             	mov    rax,rdx
  80498e:	48 01 c0             	add    rax,rax
  804991:	48 01 d0             	add    rax,rdx
  804994:	48 c1 e0 08          	shl    rax,0x8
  804998:	48 05 40 85 40 00    	add    rax,0x408540
  80499e:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8049a2:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8049a9:	b8 00 00 00 00       	mov    eax,0x0
  8049ae:	e8 12 c7 ff ff       	call   8010c5 <vmalloc>
  8049b3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8049b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8049bb:	83 c8 07             	or     eax,0x7
  8049be:	89 c1                	mov    ecx,eax
  8049c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049c3:	48 63 d0             	movsxd rdx,eax
  8049c6:	48 89 d0             	mov    rax,rdx
  8049c9:	48 01 c0             	add    rax,rax
  8049cc:	48 01 d0             	add    rax,rdx
  8049cf:	48 c1 e0 08          	shl    rax,0x8
  8049d3:	48 05 40 85 40 00    	add    rax,0x408540
  8049d9:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8049dd:	48 8d 50 30          	lea    rdx,[rax+0x30]
  8049e1:	48 63 c1             	movsxd rax,ecx
  8049e4:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8049e7:	b8 00 00 00 00       	mov    eax,0x0
  8049ec:	e8 68 ca ff ff       	call   801459 <req_a_page>
  8049f1:	89 c7                	mov    edi,eax
  8049f3:	e8 0f cc ff ff       	call   801607 <get_phyaddr>
  8049f8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8049fc:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804a03:	83 c8 07             	or     eax,0x7
  804a06:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  804a08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a0b:	48 63 d0             	movsxd rdx,eax
  804a0e:	48 89 d0             	mov    rax,rdx
  804a11:	48 01 c0             	add    rax,rax
  804a14:	48 01 d0             	add    rax,rdx
  804a17:	48 c1 e0 08          	shl    rax,0x8
  804a1b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804a21:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804a27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a2a:	48 63 d0             	movsxd rdx,eax
  804a2d:	48 89 d0             	mov    rax,rdx
  804a30:	48 01 c0             	add    rax,rax
  804a33:	48 01 d0             	add    rax,rdx
  804a36:	48 c1 e0 08          	shl    rax,0x8
  804a3a:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804a41:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a45:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804a49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a4c:	48 63 d0             	movsxd rdx,eax
  804a4f:	48 89 d0             	mov    rax,rdx
  804a52:	48 01 c0             	add    rax,rax
  804a55:	48 01 d0             	add    rax,rdx
  804a58:	48 c1 e0 08          	shl    rax,0x8
  804a5c:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804a63:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804a67:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804a6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804a6e:	c9                   	leave  
  804a6f:	c3                   	ret    

0000000000804a70 <sys_malloc>:

void * sys_malloc(int size)
{
  804a70:	f3 0f 1e fa          	endbr64 
  804a74:	55                   	push   rbp
  804a75:	48 89 e5             	mov    rbp,rsp
  804a78:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804a7b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a7e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804a84:	85 c0                	test   eax,eax
  804a86:	0f 48 c2             	cmovs  eax,edx
  804a89:	c1 f8 0c             	sar    eax,0xc
  804a8c:	89 c1                	mov    ecx,eax
  804a8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a91:	99                   	cdq    
  804a92:	c1 ea 14             	shr    edx,0x14
  804a95:	01 d0                	add    eax,edx
  804a97:	25 ff 0f 00 00       	and    eax,0xfff
  804a9c:	29 d0                	sub    eax,edx
  804a9e:	01 c8                	add    eax,ecx
  804aa0:	85 c0                	test   eax,eax
  804aa2:	0f 95 c0             	setne  al
  804aa5:	0f b6 c0             	movzx  eax,al
  804aa8:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804aab:	8b 05 5b fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa5b]        # 41450c <cur_proc>
  804ab1:	48 63 d0             	movsxd rdx,eax
  804ab4:	48 89 d0             	mov    rax,rdx
  804ab7:	48 01 c0             	add    rax,rax
  804aba:	48 01 d0             	add    rax,rdx
  804abd:	48 c1 e0 08          	shl    rax,0x8
  804ac1:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804ac7:	8b 00                	mov    eax,DWORD PTR [rax]
  804ac9:	48 98                	cdqe   
  804acb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804acf:	eb 0c                	jmp    804add <sys_malloc+0x6d>
        hp=hp->next;
  804ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ad5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ad9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804add:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ae1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ae5:	48 85 c0             	test   rax,rax
  804ae8:	74 16                	je     804b00 <sys_malloc+0x90>
  804aea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aee:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804af1:	85 c0                	test   eax,eax
  804af3:	75 0b                	jne    804b00 <sys_malloc+0x90>
  804af5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af9:	8b 00                	mov    eax,DWORD PTR [rax]
  804afb:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804afe:	7e d1                	jle    804ad1 <sys_malloc+0x61>
    if(hp->pgn<n)
  804b00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b04:	8b 00                	mov    eax,DWORD PTR [rax]
  804b06:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804b09:	0f 8e 8d 00 00 00    	jle    804b9c <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804b0f:	8b 05 f7 f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f9f7]        # 41450c <cur_proc>
  804b15:	48 63 d0             	movsxd rdx,eax
  804b18:	48 89 d0             	mov    rax,rdx
  804b1b:	48 01 c0             	add    rax,rax
  804b1e:	48 01 d0             	add    rax,rdx
  804b21:	48 c1 e0 08          	shl    rax,0x8
  804b25:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804b2b:	8b 10                	mov    edx,DWORD PTR [rax]
  804b2d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b30:	c1 e0 0c             	shl    eax,0xc
  804b33:	01 d0                	add    eax,edx
  804b35:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804b3a:	7e 0a                	jle    804b46 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804b3c:	b8 00 00 00 00       	mov    eax,0x0
  804b41:	e9 cf 00 00 00       	jmp    804c15 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804b46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b4a:	8b 10                	mov    edx,DWORD PTR [rax]
  804b4c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b4f:	29 d0                	sub    eax,edx
  804b51:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804b54:	8b 05 b2 f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f9b2]        # 41450c <cur_proc>
  804b5a:	48 63 d0             	movsxd rdx,eax
  804b5d:	48 89 d0             	mov    rax,rdx
  804b60:	48 01 c0             	add    rax,rax
  804b63:	48 01 d0             	add    rax,rdx
  804b66:	48 c1 e0 08          	shl    rax,0x8
  804b6a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804b70:	8b 00                	mov    eax,DWORD PTR [rax]
  804b72:	48 98                	cdqe   
  804b74:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b78:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804b7f:	eb 13                	jmp    804b94 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804b81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b85:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804b88:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804b8f:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b90:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b94:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b97:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804b9a:	7c e5                	jl     804b81 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804b9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ba0:	8b 00                	mov    eax,DWORD PTR [rax]
  804ba2:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ba5:	7d 59                	jge    804c00 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804ba7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bab:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804baf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804bb2:	83 c0 01             	add    eax,0x1
  804bb5:	c1 e0 0c             	shl    eax,0xc
  804bb8:	48 98                	cdqe   
  804bba:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804bbe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804bc2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804bc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bca:	8b 00                	mov    eax,DWORD PTR [rax]
  804bcc:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804bcf:	8d 50 ff             	lea    edx,[rax-0x1]
  804bd2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804bd6:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804bd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bdc:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804be0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804be4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804be8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804bec:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804bf0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804bf4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bf8:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804bfc:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804c00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c04:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804c0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c0f:	48 05 00 10 00 00    	add    rax,0x1000
}
  804c15:	5d                   	pop    rbp
  804c16:	c3                   	ret    

0000000000804c17 <sys_free>:
int sys_free(int ptr)
{
  804c17:	f3 0f 1e fa          	endbr64 
  804c1b:	55                   	push   rbp
  804c1c:	48 89 e5             	mov    rbp,rsp
  804c1f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804c22:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c25:	2d 00 10 00 00       	sub    eax,0x1000
  804c2a:	48 98                	cdqe   
  804c2c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804c30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c34:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804c3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c3f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804c43:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c47:	eb 2e                	jmp    804c77 <sys_free+0x60>
    {
        if(p->alloc==0)
  804c49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c4d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c50:	85 c0                	test   eax,eax
  804c52:	75 2c                	jne    804c80 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804c54:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c58:	8b 10                	mov    edx,DWORD PTR [rax]
  804c5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c5e:	8b 00                	mov    eax,DWORD PTR [rax]
  804c60:	83 c0 01             	add    eax,0x1
  804c63:	01 c2                	add    edx,eax
  804c65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c69:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804c6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c6f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804c73:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c77:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804c7c:	75 cb                	jne    804c49 <sys_free+0x32>
  804c7e:	eb 01                	jmp    804c81 <sys_free+0x6a>
            break;
  804c80:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804c81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c85:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804c89:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c8d:	eb 2e                	jmp    804cbd <sys_free+0xa6>
    {
        if(p->alloc==0)
  804c8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c93:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c96:	85 c0                	test   eax,eax
  804c98:	75 2c                	jne    804cc6 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804c9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c9e:	8b 10                	mov    edx,DWORD PTR [rax]
  804ca0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ca4:	8b 00                	mov    eax,DWORD PTR [rax]
  804ca6:	83 c0 01             	add    eax,0x1
  804ca9:	01 c2                	add    edx,eax
  804cab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804caf:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804cb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804cb5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804cb9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804cbd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804cc2:	75 cb                	jne    804c8f <sys_free+0x78>
  804cc4:	eb 01                	jmp    804cc7 <sys_free+0xb0>
            break;
  804cc6:	90                   	nop
    }
    //合并完成
    return 0;
  804cc7:	b8 00 00 00 00       	mov    eax,0x0
}
  804ccc:	5d                   	pop    rbp
  804ccd:	c3                   	ret    

0000000000804cce <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804cce:	f3 0f 1e fa          	endbr64 
  804cd2:	55                   	push   rbp
  804cd3:	48 89 e5             	mov    rbp,rsp
  804cd6:	53                   	push   rbx
  804cd7:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804cdb:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804cdf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ce3:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804ce9:	48 c1 f8 08          	sar    rax,0x8
  804ced:	48 89 c2             	mov    rdx,rax
  804cf0:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804cf7:	aa aa aa 
  804cfa:	48 0f af c2          	imul   rax,rdx
  804cfe:	89 05 08 f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f808],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804d04:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804d08:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804d0c:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804d10:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804d14:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d18:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d1c:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d20:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804d24:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804d28:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804d2c:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804d33:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804d5e <done>
  804d3a:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804d41:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804d48:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804d4e:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804d55:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804d5c:	eb 08                	jmp    804d66 <__switch_to>

0000000000804d5e <done>:
  804d5e:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804d5f:	90                   	nop
  804d60:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d64:	c9                   	leave  
  804d65:	c3                   	ret    

0000000000804d66 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804d66:	f3 0f 1e fa          	endbr64 
  804d6a:	55                   	push   rbp
  804d6b:	48 89 e5             	mov    rbp,rsp
  804d6e:	53                   	push   rbx
  804d6f:	48 83 ec 18          	sub    rsp,0x18
  804d73:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804d77:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d7b:	48 8b 05 1e 57 00 00 	mov    rax,QWORD PTR [rip+0x571e]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d82:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d86:	48 8b 05 13 57 00 00 	mov    rax,QWORD PTR [rip+0x5713]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d8d:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d91:	48 8b 05 08 57 00 00 	mov    rax,QWORD PTR [rip+0x5708]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d98:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d9c:	48 8b 05 fd 56 00 00 	mov    rax,QWORD PTR [rip+0x56fd]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804da3:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804da7:	48 8b 05 f2 56 00 00 	mov    rax,QWORD PTR [rip+0x56f2]        # 80a4a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804dae:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804db2:	48 8b 05 e7 56 00 00 	mov    rax,QWORD PTR [rip+0x56e7]        # 80a4a0 <tss>
  804db9:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804dbd:	48 8b 05 dc 56 00 00 	mov    rax,QWORD PTR [rip+0x56dc]        # 80a4a0 <tss>
  804dc4:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804dc8:	48 8b 05 d1 56 00 00 	mov    rax,QWORD PTR [rip+0x56d1]        # 80a4a0 <tss>
  804dcf:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804dd3:	48 8b 05 c6 56 00 00 	mov    rax,QWORD PTR [rip+0x56c6]        # 80a4a0 <tss>
  804dda:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804dde:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804de2:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804de9:	41 52                	push   r10
  804deb:	41 51                	push   r9
  804ded:	41 50                	push   r8
  804def:	57                   	push   rdi
  804df0:	49 89 d9             	mov    r9,rbx
  804df3:	4d 89 d8             	mov    r8,r11
  804df6:	48 89 c7             	mov    rdi,rax
  804df9:	e8 33 00 00 00       	call   804e31 <set_tss>
  804dfe:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804e02:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804e06:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804e0a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804e0e:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804e12:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804e18:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804e1e:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804e24:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804e2a:	90                   	nop
  804e2b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804e2f:	c9                   	leave  
  804e30:	c3                   	ret    

0000000000804e31 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804e31:	f3 0f 1e fa          	endbr64 
  804e35:	55                   	push   rbp
  804e36:	48 89 e5             	mov    rbp,rsp
  804e39:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804e3d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804e41:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804e45:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804e49:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804e4d:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804e51:	48 8b 05 48 56 00 00 	mov    rax,QWORD PTR [rip+0x5648]        # 80a4a0 <tss>
  804e58:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804e5c:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804e60:	48 8b 05 39 56 00 00 	mov    rax,QWORD PTR [rip+0x5639]        # 80a4a0 <tss>
  804e67:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804e6b:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804e6f:	48 8b 05 2a 56 00 00 	mov    rax,QWORD PTR [rip+0x562a]        # 80a4a0 <tss>
  804e76:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804e7a:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804e7e:	48 8b 05 1b 56 00 00 	mov    rax,QWORD PTR [rip+0x561b]        # 80a4a0 <tss>
  804e85:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804e89:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804e8d:	48 8b 05 0c 56 00 00 	mov    rax,QWORD PTR [rip+0x560c]        # 80a4a0 <tss>
  804e94:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804e98:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804e9c:	48 8b 05 fd 55 00 00 	mov    rax,QWORD PTR [rip+0x55fd]        # 80a4a0 <tss>
  804ea3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804ea7:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804eab:	48 8b 05 ee 55 00 00 	mov    rax,QWORD PTR [rip+0x55ee]        # 80a4a0 <tss>
  804eb2:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804eb6:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804eba:	48 8b 05 df 55 00 00 	mov    rax,QWORD PTR [rip+0x55df]        # 80a4a0 <tss>
  804ec1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804ec5:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804ec9:	48 8b 05 d0 55 00 00 	mov    rax,QWORD PTR [rip+0x55d0]        # 80a4a0 <tss>
  804ed0:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804ed4:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804ed8:	48 8b 05 c1 55 00 00 	mov    rax,QWORD PTR [rip+0x55c1]        # 80a4a0 <tss>
  804edf:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804ee3:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804ee7:	90                   	nop
  804ee8:	5d                   	pop    rbp
  804ee9:	c3                   	ret    
  804eea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000804ef0 <outb>:
  804ef0:	66 89 fa             	mov    dx,di
  804ef3:	66 89 f0             	mov    ax,si
  804ef6:	ee                   	out    dx,al
  804ef7:	e8 29 00 00 00       	call   804f25 <io_delay>
  804efc:	c3                   	ret    

0000000000804efd <outw>:
  804efd:	66 89 fa             	mov    dx,di
  804f00:	66 89 f0             	mov    ax,si
  804f03:	66 ef                	out    dx,ax
  804f05:	90                   	nop
  804f06:	90                   	nop
  804f07:	90                   	nop
  804f08:	c3                   	ret    

0000000000804f09 <inb>:
  804f09:	31 c0                	xor    eax,eax
  804f0b:	66 89 fa             	mov    dx,di
  804f0e:	ec                   	in     al,dx
  804f0f:	90                   	nop
  804f10:	90                   	nop
  804f11:	90                   	nop
  804f12:	c3                   	ret    

0000000000804f13 <inw>:
  804f13:	31 c0                	xor    eax,eax
  804f15:	66 89 fa             	mov    dx,di
  804f18:	66 ed                	in     ax,dx
  804f1a:	90                   	nop
  804f1b:	90                   	nop
  804f1c:	90                   	nop
  804f1d:	c3                   	ret    

0000000000804f1e <eoi>:
  804f1e:	b0 20                	mov    al,0x20
  804f20:	e6 a0                	out    0xa0,al
  804f22:	e6 20                	out    0x20,al
  804f24:	c3                   	ret    

0000000000804f25 <io_delay>:
  804f25:	90                   	nop
  804f26:	90                   	nop
  804f27:	90                   	nop
  804f28:	90                   	nop
  804f29:	c3                   	ret    

0000000000804f2a <turn_on_int>:
  804f2a:	b0 f8                	mov    al,0xf8
  804f2c:	e6 21                	out    0x21,al
  804f2e:	e8 f2 ff ff ff       	call   804f25 <io_delay>
  804f33:	b0 af                	mov    al,0xaf
  804f35:	e6 a1                	out    0xa1,al
  804f37:	e8 e9 ff ff ff       	call   804f25 <io_delay>
  804f3c:	b8 00 70 10 00       	mov    eax,0x107000
  804f41:	0f 01 18             	lidt   [rax]
  804f44:	90                   	nop
  804f45:	90                   	nop
  804f46:	90                   	nop
  804f47:	90                   	nop
  804f48:	fb                   	sti    
  804f49:	c3                   	ret    

0000000000804f4a <report_back_trace_of_err>:
  804f4a:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804f4f:	50                   	push   rax
  804f50:	68 59 4f 80 00       	push   0x804f59
  804f55:	83 c4 08             	add    esp,0x8
  804f58:	c3                   	ret    

0000000000804f59 <bt_msg>:
  804f59:	65 72 72             	gs jb  804fce <fill_desc+0x4e>
  804f5c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804f5d:	72 20                	jb     804f7f <init_gdt+0x11>
  804f5f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804f60:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804f63:	72 73                	jb     804fd8 <fill_desc+0x58>
  804f65:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804f68:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeabe6 <_knl_end+0x2eabe6>

0000000000804f6e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804f6e:	f3 0f 1e fa          	endbr64 
  804f72:	55                   	push   rbp
  804f73:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804f76:	66 b8 48 00          	mov    ax,0x48
  804f7a:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  804f7d:	90                   	nop
  804f7e:	5d                   	pop    rbp
  804f7f:	c3                   	ret    

0000000000804f80 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804f80:	f3 0f 1e fa          	endbr64 
  804f84:	55                   	push   rbp
  804f85:	48 89 e5             	mov    rbp,rsp
  804f88:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804f8c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804f90:	89 d0                	mov    eax,edx
  804f92:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804f95:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804f99:	48 8b 15 08 55 00 00 	mov    rdx,QWORD PTR [rip+0x5508]        # 80a4a8 <gdt>
  804fa0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fa3:	48 c1 e0 04          	shl    rax,0x4
  804fa7:	48 01 d0             	add    rax,rdx
  804faa:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804fae:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804fb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fb6:	48 c1 e8 10          	shr    rax,0x10
  804fba:	48 89 c1             	mov    rcx,rax
  804fbd:	48 8b 15 e4 54 00 00 	mov    rdx,QWORD PTR [rip+0x54e4]        # 80a4a8 <gdt>
  804fc4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fc7:	48 c1 e0 04          	shl    rax,0x4
  804fcb:	48 01 d0             	add    rax,rdx
  804fce:	89 ca                	mov    edx,ecx
  804fd0:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804fd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fd7:	48 c1 e8 18          	shr    rax,0x18
  804fdb:	48 89 c1             	mov    rcx,rax
  804fde:	48 8b 15 c3 54 00 00 	mov    rdx,QWORD PTR [rip+0x54c3]        # 80a4a8 <gdt>
  804fe5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fe8:	48 c1 e0 04          	shl    rax,0x4
  804fec:	48 01 d0             	add    rax,rdx
  804fef:	89 ca                	mov    edx,ecx
  804ff1:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804ff4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ff8:	48 c1 e8 20          	shr    rax,0x20
  804ffc:	48 89 c2             	mov    rdx,rax
  804fff:	48 8b 0d a2 54 00 00 	mov    rcx,QWORD PTR [rip+0x54a2]        # 80a4a8 <gdt>
  805006:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805009:	48 c1 e0 04          	shl    rax,0x4
  80500d:	48 01 c8             	add    rax,rcx
  805010:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805013:	48 8b 15 8e 54 00 00 	mov    rdx,QWORD PTR [rip+0x548e]        # 80a4a8 <gdt>
  80501a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80501d:	48 c1 e0 04          	shl    rax,0x4
  805021:	48 01 d0             	add    rax,rdx
  805024:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805028:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80502b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80502f:	48 c1 e8 08          	shr    rax,0x8
  805033:	66 25 f0 00          	and    ax,0xf0
  805037:	48 8b 0d 6a 54 00 00 	mov    rcx,QWORD PTR [rip+0x546a]        # 80a4a8 <gdt>
  80503e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805041:	48 c1 e2 04          	shl    rdx,0x4
  805045:	48 01 ca             	add    rdx,rcx
  805048:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80504c:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805050:	90                   	nop
  805051:	5d                   	pop    rbp
  805052:	c3                   	ret    

0000000000805053 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805053:	f3 0f 1e fa          	endbr64 
  805057:	55                   	push   rbp
  805058:	48 89 e5             	mov    rbp,rsp
  80505b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80505e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805061:	89 c8                	mov    eax,ecx
  805063:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805067:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80506b:	48 8b 05 36 54 00 00 	mov    rax,QWORD PTR [rip+0x5436]        # 80a4a8 <gdt>
  805072:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805076:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805079:	48 c1 e0 04          	shl    rax,0x4
  80507d:	48 89 c2             	mov    rdx,rax
  805080:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805084:	48 01 d0             	add    rax,rdx
  805087:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80508a:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80508d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805090:	48 c1 e0 04          	shl    rax,0x4
  805094:	48 89 c2             	mov    rdx,rax
  805097:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80509b:	48 01 d0             	add    rax,rdx
  80509e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8050a1:	c1 ea 10             	shr    edx,0x10
  8050a4:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  8050a7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8050aa:	48 c1 e0 04          	shl    rax,0x4
  8050ae:	48 89 c2             	mov    rdx,rax
  8050b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050b5:	48 01 c2             	add    rdx,rax
  8050b8:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  8050bc:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8050c0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8050c3:	48 c1 e0 04          	shl    rax,0x4
  8050c7:	48 89 c2             	mov    rdx,rax
  8050ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050ce:	48 01 c2             	add    rdx,rax
  8050d1:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8050d5:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8050d9:	90                   	nop
  8050da:	5d                   	pop    rbp
  8050db:	c3                   	ret    

00000000008050dc <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8050dc:	f3 0f 1e fa          	endbr64 
  8050e0:	55                   	push   rbp
  8050e1:	48 89 e5             	mov    rbp,rsp
  8050e4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8050e7:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8050ea:	89 d0                	mov    eax,edx
  8050ec:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8050f0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8050f4:	90                   	nop
  8050f5:	5d                   	pop    rbp
  8050f6:	c3                   	ret    
  8050f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  8050fe:	00 00 

0000000000805100 <fill_desc>:
  805100:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805105:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80510a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80510f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805114:	be 00 60 00 00       	mov    esi,0x6000
  805119:	c1 e2 03             	shl    edx,0x3
  80511c:	01 d6                	add    esi,edx
  80511e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805122:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805127:	c1 e8 10             	shr    eax,0x10
  80512a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80512e:	c1 eb 10             	shr    ebx,0x10
  805131:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805135:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805139:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80513d:	c3                   	ret    

000000000080513e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80513e:	f3 0f 1e fa          	endbr64 
  805142:	55                   	push   rbp
  805143:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805146:	b8 00 00 00 00       	mov    eax,0x0
  80514b:	e8 3c 17 00 00       	call   80688c <execute_request>
    do_req();
  805150:	b8 00 00 00 00       	mov    eax,0x0
  805155:	e8 85 e7 ff ff       	call   8038df <do_req>
    if(!manage_proc_lock)
  80515a:	8b 05 e8 52 00 00    	mov    eax,DWORD PTR [rip+0x52e8]        # 80a448 <manage_proc_lock>
  805160:	85 c0                	test   eax,eax
  805162:	75 0a                	jne    80516e <clock_c+0x30>
    {
        manage_proc();
  805164:	b8 00 00 00 00       	mov    eax,0x0
  805169:	e8 9d ee ff ff       	call   80400b <manage_proc>
    }
    //puts("1 disk req executed.");
  80516e:	90                   	nop
  80516f:	5d                   	pop    rbp
  805170:	c3                   	ret    
  805171:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805178:	00 00 00 
  80517b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805180 <clock>:
  805180:	50                   	push   rax
  805181:	53                   	push   rbx
  805182:	51                   	push   rcx
  805183:	52                   	push   rdx
  805184:	57                   	push   rdi
  805185:	56                   	push   rsi
  805186:	41 50                	push   r8
  805188:	41 51                	push   r9
  80518a:	41 52                	push   r10
  80518c:	41 53                	push   r11
  80518e:	41 54                	push   r12
  805190:	41 55                	push   r13
  805192:	41 56                	push   r14
  805194:	41 57                	push   r15
  805196:	66 8c c0             	mov    ax,es
  805199:	66 50                	push   ax
  80519b:	66 8c d8             	mov    ax,ds
  80519e:	66 50                	push   ax
  8051a0:	66 b8 10 00          	mov    ax,0x10
  8051a4:	8e c0                	mov    es,eax
  8051a6:	8e d8                	mov    ds,eax

00000000008051a8 <clock.normal_part>:
  8051a8:	b0 20                	mov    al,0x20
  8051aa:	e6 a0                	out    0xa0,al
  8051ac:	e6 20                	out    0x20,al
  8051ae:	e8 8b ff ff ff       	call   80513e <clock_c>
  8051b3:	66 58                	pop    ax
  8051b5:	8e d8                	mov    ds,eax
  8051b7:	66 58                	pop    ax
  8051b9:	8e c0                	mov    es,eax
  8051bb:	41 5f                	pop    r15
  8051bd:	41 5e                	pop    r14
  8051bf:	41 5d                	pop    r13
  8051c1:	41 5c                	pop    r12
  8051c3:	41 5b                	pop    r11
  8051c5:	41 5a                	pop    r10
  8051c7:	41 59                	pop    r9
  8051c9:	41 58                	pop    r8
  8051cb:	5e                   	pop    rsi
  8051cc:	5f                   	pop    rdi
  8051cd:	5a                   	pop    rdx
  8051ce:	59                   	pop    rcx
  8051cf:	5b                   	pop    rbx
  8051d0:	58                   	pop    rax
  8051d1:	48 cf                	iretq  

00000000008051d3 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  8051d3:	f3 0f 1e fa          	endbr64 
  8051d7:	55                   	push   rbp
  8051d8:	48 89 e5             	mov    rbp,rsp
  8051db:	48 83 ec 30          	sub    rsp,0x30
  8051df:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  8051e3:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  8051ea:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  8051f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051f5:	be 01 00 00 00       	mov    esi,0x1
  8051fa:	48 89 c7             	mov    rdi,rax
  8051fd:	e8 d0 c9 ff ff       	call   801bd2 <sys_open>
  805202:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805205:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  805209:	75 0a                	jne    805215 <execute+0x42>
  80520b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805210:	e9 b7 00 00 00       	jmp    8052cc <execute+0xf9>
    //
    char *p=path;
  805215:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805219:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  80521d:	eb 05                	jmp    805224 <execute+0x51>
  80521f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805224:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805228:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80522b:	84 c0                	test   al,al
  80522d:	75 f0                	jne    80521f <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  80522f:	eb 05                	jmp    805236 <execute+0x63>
  805231:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805236:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80523a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80523d:	3c 2f                	cmp    al,0x2f
  80523f:	74 0a                	je     80524b <execute+0x78>
  805241:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805245:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805249:	77 e6                	ja     805231 <execute+0x5e>
    if(p>path)
  80524b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80524f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805253:	76 2f                	jbe    805284 <execute+0xb1>
    {
        *p='\0';
  805255:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805259:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  80525c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805260:	be 01 00 00 00       	mov    esi,0x1
  805265:	48 89 c7             	mov    rdi,rax
  805268:	e8 65 c9 ff ff       	call   801bd2 <sys_open>
  80526d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805270:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805274:	75 07                	jne    80527d <execute+0xaa>
  805276:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80527b:	eb 4f                	jmp    8052cc <execute+0xf9>
        *p='/';
  80527d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805281:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805284:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805287:	48 63 d0             	movsxd rdx,eax
  80528a:	48 89 d0             	mov    rax,rdx
  80528d:	48 01 c0             	add    rax,rax
  805290:	48 01 d0             	add    rax,rdx
  805293:	48 c1 e0 05          	shl    rax,0x5
  805297:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  80529e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052a1:	48 63 c8             	movsxd rcx,eax
  8052a4:	48 89 c8             	mov    rax,rcx
  8052a7:	48 01 c0             	add    rax,rax
  8052aa:	48 01 c8             	add    rax,rcx
  8052ad:	48 c1 e0 05          	shl    rax,0x5
  8052b1:	48 05 60 06 40 00    	add    rax,0x400660
  8052b7:	b9 44 53 80 00       	mov    ecx,0x805344
  8052bc:	48 89 c6             	mov    rsi,rax
  8052bf:	89 cf                	mov    edi,ecx
  8052c1:	e8 0f f6 ff ff       	call   8048d5 <reg_proc>
  8052c6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  8052c9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  8052cc:	c9                   	leave  
  8052cd:	c3                   	ret    

00000000008052ce <exec_call>:

int exec_call(char *path)
{
  8052ce:	f3 0f 1e fa          	endbr64 
  8052d2:	55                   	push   rbp
  8052d3:	48 89 e5             	mov    rbp,rsp
  8052d6:	48 83 ec 20          	sub    rsp,0x20
  8052da:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  8052de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8052e2:	48 89 c7             	mov    rdi,rax
  8052e5:	e8 e9 fe ff ff       	call   8051d3 <execute>
  8052ea:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  8052ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052f0:	01 c0                	add    eax,eax
  8052f2:	83 c0 05             	add    eax,0x5
  8052f5:	c1 e0 03             	shl    eax,0x3
  8052f8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  8052fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052fe:	89 c7                	mov    edi,eax
  805300:	e8 d2 ee ff ff       	call   8041d7 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805305:	90                   	nop
  805306:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805309:	48 63 d0             	movsxd rdx,eax
  80530c:	48 89 d0             	mov    rax,rdx
  80530f:	48 01 c0             	add    rax,rax
  805312:	48 01 d0             	add    rax,rdx
  805315:	48 c1 e0 08          	shl    rax,0x8
  805319:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80531f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805322:	83 f8 03             	cmp    eax,0x3
  805325:	75 df                	jne    805306 <exec_call+0x38>
    return task[pi].exit_code;
  805327:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80532a:	48 63 d0             	movsxd rdx,eax
  80532d:	48 89 d0             	mov    rax,rdx
  805330:	48 01 c0             	add    rax,rax
  805333:	48 01 d0             	add    rax,rdx
  805336:	48 c1 e0 08          	shl    rax,0x8
  80533a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805340:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805342:	c9                   	leave  
  805343:	c3                   	ret    

0000000000805344 <proc_start>:
int proc_start()
{
  805344:	f3 0f 1e fa          	endbr64 
  805348:	55                   	push   rbp
  805349:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  80534c:	8b 05 ba f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1ba]        # 41450c <cur_proc>
  805352:	48 63 d0             	movsxd rdx,eax
  805355:	48 89 d0             	mov    rax,rdx
  805358:	48 01 c0             	add    rax,rax
  80535b:	48 01 d0             	add    rax,rdx
  80535e:	48 c1 e0 08          	shl    rax,0x8
  805362:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805368:	48 89 c7             	mov    rdi,rax
  80536b:	e8 1a 00 00 00       	call   80538a <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  805370:	8b 05 96 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f196]        # 41450c <cur_proc>
  805376:	89 c7                	mov    edi,eax
  805378:	e8 2a f3 ff ff       	call   8046a7 <del_proc>
    switch_proc_tss(0);
  80537d:	bf 00 00 00 00       	mov    edi,0x0
  805382:	e8 50 ee ff ff       	call   8041d7 <switch_proc_tss>
}
  805387:	90                   	nop
  805388:	5d                   	pop    rbp
  805389:	c3                   	ret    

000000000080538a <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  80538a:	f3 0f 1e fa          	endbr64 
  80538e:	55                   	push   rbp
  80538f:	48 89 e5             	mov    rbp,rsp
  805392:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805399:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  8053a0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8053a7:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  8053ae:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  8053b2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8053b6:	8b 00                	mov    eax,DWORD PTR [rax]
  8053b8:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8053bb:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8053c2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053c5:	ba 44 00 00 00       	mov    edx,0x44
  8053ca:	48 89 ce             	mov    rsi,rcx
  8053cd:	89 c7                	mov    edi,eax
  8053cf:	e8 dd cd ff ff       	call   8021b1 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  8053d4:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  8053db:	89 c1                	mov    ecx,eax
  8053dd:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053e0:	ba 00 00 00 00       	mov    edx,0x0
  8053e5:	89 ce                	mov    esi,ecx
  8053e7:	89 c7                	mov    edi,eax
  8053e9:	e8 54 ce ff ff       	call   802242 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  8053ee:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  8053f5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053f8:	ba f8 00 00 00       	mov    edx,0xf8
  8053fd:	48 89 ce             	mov    rsi,rcx
  805400:	89 c7                	mov    edi,eax
  805402:	e8 aa cd ff ff       	call   8021b1 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  805407:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  80540d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805410:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  805416:	c1 e8 0c             	shr    eax,0xc
  805419:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  80541c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80541f:	c1 e8 16             	shr    eax,0x16
  805422:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  805425:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805428:	25 ff ff 3f 00       	and    eax,0x3fffff
  80542d:	c1 e8 0c             	shr    eax,0xc
  805430:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  805433:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80543a:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  805441:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805444:	48 98                	cdqe   
  805446:	48 c1 e0 03          	shl    rax,0x3
  80544a:	48 01 d0             	add    rax,rdx
  80544d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805450:	25 00 f0 ff ff       	and    eax,0xfffff000
  805455:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805459:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805460:	eb 48                	jmp    8054aa <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805462:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805465:	99                   	cdq    
  805466:	c1 ea 16             	shr    edx,0x16
  805469:	01 d0                	add    eax,edx
  80546b:	25 ff 03 00 00       	and    eax,0x3ff
  805470:	29 d0                	sub    eax,edx
  805472:	89 c2                	mov    edx,eax
  805474:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805477:	01 d0                	add    eax,edx
  805479:	48 98                	cdqe   
  80547b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805482:	00 
  805483:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805487:	48 01 d0             	add    rax,rdx
  80548a:	8b 00                	mov    eax,DWORD PTR [rax]
  80548c:	83 e0 01             	and    eax,0x1
  80548f:	85 c0                	test   eax,eax
  805491:	74 13                	je     8054a6 <load_pe+0x11c>
  805493:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  805498:	74 0c                	je     8054a6 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  80549a:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  8054a1:	e9 76 ff ff ff       	jmp    80541c <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  8054a6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8054aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054ad:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  8054b0:	7c b0                	jl     805462 <load_pe+0xd8>
            }
        }
        break;
  8054b2:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  8054b3:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8054b6:	ba 00 00 00 00       	mov    edx,0x0
  8054bb:	be 00 00 00 00       	mov    esi,0x0
  8054c0:	89 c7                	mov    edi,eax
  8054c2:	e8 7b cd ff ff       	call   802242 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8054c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054ca:	48 89 c1             	mov    rcx,rax
  8054cd:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8054d0:	ba 00 10 00 00       	mov    edx,0x1000
  8054d5:	48 89 ce             	mov    rsi,rcx
  8054d8:	89 c7                	mov    edi,eax
  8054da:	e8 d2 cc ff ff       	call   8021b1 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8054df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054e2:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  8054e9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8054ec:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8054f3:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8054f7:	48 01 d0             	add    rax,rdx
  8054fa:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805501:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805508:	48 83 c0 04          	add    rax,0x4
  80550c:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805513:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80551a:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  80551d:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  805523:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805529:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80552f:	85 c0                	test   eax,eax
  805531:	0f 48 c2             	cmovs  eax,edx
  805534:	c1 f8 0c             	sar    eax,0xc
  805537:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80553d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805544:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805547:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80554a:	01 d0                	add    eax,edx
  80554c:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805552:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805558:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  80555e:	85 c0                	test   eax,eax
  805560:	0f 48 c2             	cmovs  eax,edx
  805563:	c1 f8 0a             	sar    eax,0xa
  805566:	89 c1                	mov    ecx,eax
  805568:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80556e:	99                   	cdq    
  80556f:	c1 ea 16             	shr    edx,0x16
  805572:	01 d0                	add    eax,edx
  805574:	25 ff 03 00 00       	and    eax,0x3ff
  805579:	29 d0                	sub    eax,edx
  80557b:	01 c8                	add    eax,ecx
  80557d:	85 c0                	test   eax,eax
  80557f:	0f 95 c0             	setne  al
  805582:	0f b6 c0             	movzx  eax,al
  805585:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80558b:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805591:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  805597:	85 c0                	test   eax,eax
  805599:	0f 48 c2             	cmovs  eax,edx
  80559c:	c1 f8 16             	sar    eax,0x16
  80559f:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8055a5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055ac:	89 c0                	mov    eax,eax
  8055ae:	48 05 f8 00 00 00    	add    rax,0xf8
  8055b4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8055b8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055bf:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8055c3:	0f b7 d0             	movzx  edx,ax
  8055c6:	89 d0                	mov    eax,edx
  8055c8:	c1 e0 02             	shl    eax,0x2
  8055cb:	01 d0                	add    eax,edx
  8055cd:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8055d0:	05 3c 01 00 00       	add    eax,0x13c
  8055d5:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8055db:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055e2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8055e5:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8055eb:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055f1:	99                   	cdq    
  8055f2:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8055f8:	89 d0                	mov    eax,edx
  8055fa:	85 c0                	test   eax,eax
  8055fc:	74 23                	je     805621 <load_pe+0x297>
  8055fe:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805604:	99                   	cdq    
  805605:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80560b:	89 d1                	mov    ecx,edx
  80560d:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805613:	29 c8                	sub    eax,ecx
  805615:	89 c2                	mov    edx,eax
  805617:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  80561d:	01 d0                	add    eax,edx
  80561f:	eb 06                	jmp    805627 <load_pe+0x29d>
  805621:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805627:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80562d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805634:	eb 68                	jmp    80569e <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805636:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80563a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80563d:	25 00 00 00 02       	and    eax,0x2000000
  805642:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805648:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80564f:	75 43                	jne    805694 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805651:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805655:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805658:	89 c1                	mov    ecx,eax
  80565a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80565d:	ba 00 00 00 00       	mov    edx,0x0
  805662:	89 ce                	mov    esi,ecx
  805664:	89 c7                	mov    edi,eax
  805666:	e8 d7 cb ff ff       	call   802242 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80566b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80566f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805672:	89 c2                	mov    edx,eax
  805674:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805678:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80567b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80567e:	01 c8                	add    eax,ecx
  805680:	89 c0                	mov    eax,eax
  805682:	48 89 c1             	mov    rcx,rax
  805685:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805688:	48 89 ce             	mov    rsi,rcx
  80568b:	89 c7                	mov    edi,eax
  80568d:	e8 1f cb ff ff       	call   8021b1 <sys_read>
  805692:	eb 01                	jmp    805695 <load_pe+0x30b>
            continue;
  805694:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805695:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805699:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80569e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8056a5:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8056a9:	0f b7 c0             	movzx  eax,ax
  8056ac:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8056af:	7c 85                	jl     805636 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8056b1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8056b8:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8056bc:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8056c3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8056ca:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8056cd:	85 c0                	test   eax,eax
  8056cf:	0f 84 71 02 00 00    	je     805946 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8056d5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8056dc:	8b 10                	mov    edx,DWORD PTR [rax]
  8056de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056e1:	01 d0                	add    eax,edx
  8056e3:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8056e9:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8056ef:	48 98                	cdqe   
  8056f1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8056f5:	e9 3e 02 00 00       	jmp    805938 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8056fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8056fe:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805701:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805704:	01 d0                	add    eax,edx
  805706:	89 c0                	mov    eax,eax
  805708:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80570f:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805716:	be c8 1f 81 00       	mov    esi,0x811fc8
  80571b:	48 89 c7             	mov    rdi,rax
  80571e:	e8 01 46 00 00       	call   809d24 <strcmp>
  805723:	85 c0                	test   eax,eax
  805725:	75 09                	jne    805730 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  805727:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80572e:	eb 25                	jmp    805755 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805730:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805737:	48 89 c7             	mov    rdi,rax
  80573a:	e8 4b fc ff ff       	call   80538a <load_pe>
  80573f:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805745:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80574b:	89 c7                	mov    edi,eax
  80574d:	e8 e4 03 00 00       	call   805b36 <get_module_addr>
  805752:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805755:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805758:	48 98                	cdqe   
  80575a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805761:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805764:	48 63 d0             	movsxd rdx,eax
  805767:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80576e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805772:	48 01 d0             	add    rax,rdx
  805775:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80577c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805783:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805786:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805789:	01 d0                	add    eax,edx
  80578b:	89 c0                	mov    eax,eax
  80578d:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  805794:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80579b:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80579e:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8057a4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057ab:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8057ae:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057b1:	01 d0                	add    eax,edx
  8057b3:	89 c0                	mov    eax,eax
  8057b5:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8057bc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057c3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8057c6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057c9:	01 d0                	add    eax,edx
  8057cb:	89 c0                	mov    eax,eax
  8057cd:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8057d4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057db:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8057de:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057e1:	01 d0                	add    eax,edx
  8057e3:	89 c0                	mov    eax,eax
  8057e5:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8057ec:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8057f3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8057f6:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8057fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805800:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805803:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805806:	01 d0                	add    eax,edx
  805808:	89 c0                	mov    eax,eax
  80580a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80580e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805812:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805815:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805818:	01 d0                	add    eax,edx
  80581a:	89 c0                	mov    eax,eax
  80581c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805820:	e9 00 01 00 00       	jmp    805925 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805825:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805829:	8b 00                	mov    eax,DWORD PTR [rax]
  80582b:	85 c0                	test   eax,eax
  80582d:	79 43                	jns    805872 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80582f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805833:	8b 00                	mov    eax,DWORD PTR [rax]
  805835:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80583a:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805840:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805846:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80584c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805853:	00 
  805854:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80585b:	48 01 d0             	add    rax,rdx
  80585e:	8b 10                	mov    edx,DWORD PTR [rax]
  805860:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805863:	01 d0                	add    eax,edx
  805865:	89 c2                	mov    edx,eax
  805867:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80586b:	89 10                	mov    DWORD PTR [rax],edx
  80586d:	e9 a9 00 00 00       	jmp    80591b <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805872:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805876:	8b 00                	mov    eax,DWORD PTR [rax]
  805878:	89 c0                	mov    eax,eax
  80587a:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805881:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805888:	02 
                    int i=0;
  805889:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805890:	eb 7a                	jmp    80590c <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805892:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805895:	48 98                	cdqe   
  805897:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80589e:	00 
  80589f:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8058a6:	48 01 d0             	add    rax,rdx
  8058a9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8058ac:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8058b3:	48 89 d6             	mov    rsi,rdx
  8058b6:	48 89 c7             	mov    rdi,rax
  8058b9:	e8 66 44 00 00       	call   809d24 <strcmp>
  8058be:	85 c0                	test   eax,eax
  8058c0:	75 46                	jne    805908 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  8058c2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8058c5:	48 98                	cdqe   
  8058c7:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8058cb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8058d2:	48 01 d0             	add    rax,rdx
  8058d5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058d8:	98                   	cwde   
  8058d9:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8058df:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8058e5:	48 98                	cdqe   
  8058e7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8058ee:	00 
  8058ef:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8058f6:	48 01 d0             	add    rax,rdx
  8058f9:	8b 10                	mov    edx,DWORD PTR [rax]
  8058fb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8058fe:	01 d0                	add    eax,edx
  805900:	89 c2                	mov    edx,eax
  805902:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805906:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805908:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  80590c:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80590f:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805915:	0f 8c 77 ff ff ff    	jl     805892 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  80591b:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805920:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805925:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805929:	8b 00                	mov    eax,DWORD PTR [rax]
  80592b:	85 c0                	test   eax,eax
  80592d:	0f 85 f2 fe ff ff    	jne    805825 <load_pe+0x49b>
            }
            impdes++;
  805933:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805938:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80593c:	8b 00                	mov    eax,DWORD PTR [rax]
  80593e:	85 c0                	test   eax,eax
  805940:	0f 85 b4 fd ff ff    	jne    8056fa <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805946:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80594d:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80594e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805955:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80595b:	85 c0                	test   eax,eax
  80595d:	0f 84 e8 00 00 00    	je     805a4b <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805963:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80596a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805970:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805973:	01 d0                	add    eax,edx
  805975:	89 c0                	mov    eax,eax
  805977:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80597b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80597f:	48 83 c0 40          	add    rax,0x40
  805983:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805987:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80598b:	48 83 c0 02          	add    rax,0x2
  80598f:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805993:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80599a:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  80599d:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8059a3:	e9 95 00 00 00       	jmp    805a3d <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  8059a8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8059ac:	8b 10                	mov    edx,DWORD PTR [rax]
  8059ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059b1:	01 d0                	add    eax,edx
  8059b3:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8059b9:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8059c0:	eb 59                	jmp    805a1b <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8059c2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8059c6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8059c9:	66 85 c0             	test   ax,ax
  8059cc:	74 48                	je     805a16 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8059ce:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8059d2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8059d5:	0f b7 d0             	movzx  edx,ax
  8059d8:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8059de:	01 d0                	add    eax,edx
  8059e0:	48 98                	cdqe   
  8059e2:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8059e9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8059f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8059f2:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  8059f8:	89 c2                	mov    edx,eax
  8059fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059fd:	01 d0                	add    eax,edx
  8059ff:	89 c2                	mov    edx,eax
  805a01:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805a08:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805a0a:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805a0f:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805a14:	eb 01                	jmp    805a17 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805a16:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805a17:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805a1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805a1f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805a22:	c1 e8 02             	shr    eax,0x2
  805a25:	89 c2                	mov    edx,eax
  805a27:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805a2a:	39 c2                	cmp    edx,eax
  805a2c:	77 94                	ja     8059c2 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  805a2e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805a32:	05 00 10 00 00       	add    eax,0x1000
  805a37:	48 98                	cdqe   
  805a39:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805a3d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805a41:	8b 00                	mov    eax,DWORD PTR [rax]
  805a43:	85 c0                	test   eax,eax
  805a45:	0f 85 5d ff ff ff    	jne    8059a8 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805a4b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805a52:	00 00 00 
  805a55:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805a5c:	00 00 00 
  805a5f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805a66:	00 00 00 00 
  805a6a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805a71:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805a75:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805a7c:	ba 18 00 00 00       	mov    edx,0x18
  805a81:	48 89 c6             	mov    rsi,rax
  805a84:	bf 00 00 00 01       	mov    edi,0x1000000
  805a89:	e8 f8 3f 00 00       	call   809a86 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805a8e:	8b 05 78 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea78]        # 41450c <cur_proc>
  805a94:	48 63 d0             	movsxd rdx,eax
  805a97:	48 89 d0             	mov    rax,rdx
  805a9a:	48 01 c0             	add    rax,rax
  805a9d:	48 01 d0             	add    rax,rdx
  805aa0:	48 c1 e0 08          	shl    rax,0x8
  805aa4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805aaa:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805ab1:	8b 05 55 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea55]        # 41450c <cur_proc>
  805ab7:	48 63 d0             	movsxd rdx,eax
  805aba:	48 89 d0             	mov    rax,rdx
  805abd:	48 01 c0             	add    rax,rax
  805ac0:	48 01 d0             	add    rax,rdx
  805ac3:	48 c1 e0 08          	shl    rax,0x8
  805ac7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805acd:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805ad4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805ada:	48 98                	cdqe   
  805adc:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805ae3:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805aea:	be 00 00 00 00       	mov    esi,0x0
  805aef:	bf 00 00 00 00       	mov    edi,0x0
  805af4:	ff d0                	call   rax
  805af6:	8b 15 10 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ea10]        # 41450c <cur_proc>
  805afc:	89 c1                	mov    ecx,eax
  805afe:	48 63 d2             	movsxd rdx,edx
  805b01:	48 89 d0             	mov    rax,rdx
  805b04:	48 01 c0             	add    rax,rax
  805b07:	48 01 d0             	add    rax,rdx
  805b0a:	48 c1 e0 08          	shl    rax,0x8
  805b0e:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805b14:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805b16:	8b 05 f0 e9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e9f0]        # 41450c <cur_proc>
  805b1c:	48 63 d0             	movsxd rdx,eax
  805b1f:	48 89 d0             	mov    rax,rdx
  805b22:	48 01 c0             	add    rax,rax
  805b25:	48 01 d0             	add    rax,rdx
  805b28:	48 c1 e0 08          	shl    rax,0x8
  805b2c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805b32:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805b34:	c9                   	leave  
  805b35:	c3                   	ret    

0000000000805b36 <get_module_addr>:

int get_module_addr(int mi)
{
  805b36:	f3 0f 1e fa          	endbr64 
  805b3a:	55                   	push   rbp
  805b3b:	48 89 e5             	mov    rbp,rsp
  805b3e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805b41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b44:	48 98                	cdqe   
  805b46:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805b4d:	5d                   	pop    rbp
  805b4e:	c3                   	ret    

0000000000805b4f <dispose_library>:
int dispose_library(int dlln)
{
  805b4f:	f3 0f 1e fa          	endbr64 
  805b53:	55                   	push   rbp
  805b54:	48 89 e5             	mov    rbp,rsp
  805b57:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805b5a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805b5e:	78 09                	js     805b69 <dispose_library+0x1a>
  805b60:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805b67:	7e 07                	jle    805b70 <dispose_library+0x21>
  805b69:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805b6e:	eb 1d                	jmp    805b8d <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805b70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b73:	48 98                	cdqe   
  805b75:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805b7c:	48 05 28 45 41 00    	add    rax,0x414528
  805b82:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805b88:	b8 00 00 00 00       	mov    eax,0x0
}
  805b8d:	5d                   	pop    rbp
  805b8e:	c3                   	ret    

0000000000805b8f <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805b8f:	f3 0f 1e fa          	endbr64 
  805b93:	55                   	push   rbp
  805b94:	48 89 e5             	mov    rbp,rsp
  805b97:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805b9b:	90                   	nop
  805b9c:	5d                   	pop    rbp
  805b9d:	c3                   	ret    

0000000000805b9e <sys_rmmod>:
int sys_rmmod(char *name)
{
  805b9e:	f3 0f 1e fa          	endbr64 
  805ba2:	55                   	push   rbp
  805ba3:	48 89 e5             	mov    rbp,rsp
  805ba6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805baa:	90                   	nop
  805bab:	5d                   	pop    rbp
  805bac:	c3                   	ret    
  805bad:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805bb0 <_syscall>:
  805bb0:	57                   	push   rdi
  805bb1:	56                   	push   rsi
  805bb2:	52                   	push   rdx
  805bb3:	51                   	push   rcx
  805bb4:	53                   	push   rbx
  805bb5:	50                   	push   rax
  805bb6:	e8 b3 a9 ff ff       	call   80056e <syscall>
  805bbb:	48 83 c4 18          	add    rsp,0x18
  805bbf:	cf                   	iret   

0000000000805bc0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805bc0:	f3 0f 1e fa          	endbr64 
  805bc4:	55                   	push   rbp
  805bc5:	48 89 e5             	mov    rbp,rsp
  805bc8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805bcc:	8b 05 62 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21962]        # 427534 <framebuffer+0x14>
  805bd2:	89 c0                	mov    eax,eax
  805bd4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805bd8:	8b 05 5a 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2195a]        # 427538 <framebuffer+0x18>
  805bde:	89 c0                	mov    eax,eax
  805be0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805be4:	0f b6 05 51 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21951]        # 42753c <framebuffer+0x1c>
  805beb:	c0 e8 03             	shr    al,0x3
  805bee:	0f b6 c0             	movzx  eax,al
  805bf1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805bf5:	8b 05 35 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21935]        # 427530 <framebuffer+0x10>
  805bfb:	89 c0                	mov    eax,eax
  805bfd:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805c01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c05:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805c0a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805c0e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805c12:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805c17:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805c1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805c1f:	48 c1 e8 0c          	shr    rax,0xc
  805c23:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805c26:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805c2d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805c2e:	48 8b 05 f3 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218f3]        # 427528 <framebuffer+0x8>
  805c35:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805c39:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805c40:	00 
  805c41:	eb 2d                	jmp    805c70 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805c43:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805c47:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c4b:	ba 07 00 00 00       	mov    edx,0x7
  805c50:	48 89 ce             	mov    rsi,rcx
  805c53:	48 89 c7             	mov    rdi,rax
  805c56:	e8 4b b2 ff ff       	call   800ea6 <mmap>
        pp+=PAGE_SIZE;
  805c5b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805c62:	00 
        p+=PAGE_SIZE;
  805c63:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805c6a:	00 
    for (size_t i = 0; i < pgc; i++)
  805c6b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805c70:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805c73:	48 98                	cdqe   
  805c75:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805c79:	72 c8                	jb     805c43 <init_framebuffer+0x83>
    }
    
    
}
  805c7b:	90                   	nop
  805c7c:	90                   	nop
  805c7d:	c9                   	leave  
  805c7e:	c3                   	ret    

0000000000805c7f <init_font>:
void init_font(){
  805c7f:	f3 0f 1e fa          	endbr64 
  805c83:	55                   	push   rbp
  805c84:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805c87:	48 c7 05 ce 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218ce],0x80a668        # 427560 <boot_font>
  805c8e:	68 a6 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805c92:	48 8b 05 c7 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218c7]        # 427560 <boot_font>
  805c99:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805c9c:	83 c0 07             	add    eax,0x7
  805c9f:	c1 e8 03             	shr    eax,0x3
  805ca2:	89 05 c8 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218c8],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805ca8:	8b 05 c2 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218c2]        # 427570 <font_width_bytes>
  805cae:	c1 e0 03             	shl    eax,0x3
  805cb1:	89 05 b1 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218b1],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805cb7:	48 8b 05 a2 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218a2]        # 427560 <boot_font>
  805cbe:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805cc1:	89 05 a5 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218a5],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805cc7:	48 8b 05 92 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21892]        # 427560 <boot_font>
  805cce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805cd1:	89 c0                	mov    eax,eax
  805cd3:	48 05 68 a6 80 00    	add    rax,0x80a668
  805cd9:	48 89 05 98 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21898],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805ce0:	48 8b 05 79 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21879]        # 427560 <boot_font>
  805ce7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805cea:	89 05 94 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21894],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805cf0:	48 8b 05 69 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21869]        # 427560 <boot_font>
  805cf7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805cfa:	89 05 80 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21880],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805d00:	c7 05 46 18 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21846],0x0        # 427550 <fb_cursor_y>
  805d07:	00 00 00 
  805d0a:	8b 05 40 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21840]        # 427550 <fb_cursor_y>
  805d10:	89 05 36 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21836],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805d16:	8b 15 18 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21818]        # 427534 <framebuffer+0x14>
  805d1c:	0f b6 05 19 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21819]        # 42753c <framebuffer+0x1c>
  805d23:	0f b6 c0             	movzx  eax,al
  805d26:	0f af c2             	imul   eax,edx
  805d29:	c1 e8 03             	shr    eax,0x3
  805d2c:	8b 0d 36 18 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21836]        # 427568 <font_width>
  805d32:	ba 00 00 00 00       	mov    edx,0x0
  805d37:	f7 f1                	div    ecx
  805d39:	89 05 15 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21815],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805d3f:	8b 15 f3 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc217f3]        # 427538 <framebuffer+0x18>
  805d45:	0f b6 05 f0 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc217f0]        # 42753c <framebuffer+0x1c>
  805d4c:	0f b6 c0             	movzx  eax,al
  805d4f:	0f af c2             	imul   eax,edx
  805d52:	c1 e8 03             	shr    eax,0x3
  805d55:	8b 35 11 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21811]        # 42756c <font_height>
  805d5b:	ba 00 00 00 00       	mov    edx,0x0
  805d60:	f7 f6                	div    esi
  805d62:	89 05 f0 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc217f0],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805d68:	c7 05 3e 47 00 00 01 	mov    DWORD PTR [rip+0x473e],0x1        # 80a4b0 <font_size>
  805d6f:	00 00 00 
}
  805d72:	90                   	nop
  805d73:	5d                   	pop    rbp
  805d74:	c3                   	ret    

0000000000805d75 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805d75:	f3 0f 1e fa          	endbr64 
  805d79:	55                   	push   rbp
  805d7a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805d7d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805d81:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805d85:	48 89 05 94 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21794],rax        # 427520 <framebuffer>
  805d8c:	48 89 15 95 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21795],rdx        # 427528 <framebuffer+0x8>
  805d93:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805d97:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805d9b:	48 89 05 8e 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2178e],rax        # 427530 <framebuffer+0x10>
  805da2:	48 89 15 8f 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2178f],rdx        # 427538 <framebuffer+0x18>
  805da9:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805dad:	48 89 05 8c 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2178c],rax        # 427540 <framebuffer+0x20>
}
  805db4:	90                   	nop
  805db5:	5d                   	pop    rbp
  805db6:	c3                   	ret    

0000000000805db7 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805db7:	f3 0f 1e fa          	endbr64 
  805dbb:	55                   	push   rbp
  805dbc:	48 89 e5             	mov    rbp,rsp
  805dbf:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805dc2:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805dc5:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805dc8:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805dcb:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805dcf:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805dd6:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805dd7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805dda:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805ddd:	eb 64                	jmp    805e43 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  805ddf:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805de2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805de5:	eb 4b                	jmp    805e32 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805de7:	8b 15 43 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21743]        # 427530 <framebuffer+0x10>
  805ded:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805df0:	0f af c2             	imul   eax,edx
  805df3:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805df5:	0f b6 05 40 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21740]        # 42753c <framebuffer+0x1c>
  805dfc:	0f b6 c0             	movzx  eax,al
  805dff:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805e03:	8d 50 07             	lea    edx,[rax+0x7]
  805e06:	85 c0                	test   eax,eax
  805e08:	0f 48 c2             	cmovs  eax,edx
  805e0b:	c1 f8 03             	sar    eax,0x3
  805e0e:	48 98                	cdqe   
  805e10:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805e13:	48 05 00 00 00 40    	add    rax,0x40000000
  805e19:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805e1d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e21:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805e25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e29:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805e2c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805e2e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805e32:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805e35:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805e38:	01 d0                	add    eax,edx
  805e3a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805e3d:	7c a8                	jl     805de7 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  805e3f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805e43:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805e46:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805e49:	01 d0                	add    eax,edx
  805e4b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805e4e:	7c 8f                	jl     805ddf <fill_rect+0x28>
        }
    }
}
  805e50:	90                   	nop
  805e51:	90                   	nop
  805e52:	5d                   	pop    rbp
  805e53:	c3                   	ret    

0000000000805e54 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805e54:	f3 0f 1e fa          	endbr64 
  805e58:	55                   	push   rbp
  805e59:	48 89 e5             	mov    rbp,rsp
  805e5c:	48 83 ec 30          	sub    rsp,0x30
  805e60:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805e63:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805e66:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805e69:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805e6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e70:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805e73:	eb 5a                	jmp    805ecf <draw_text+0x7b>
    {
        if(*str=='\n')
  805e75:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e7c:	3c 0a                	cmp    al,0xa
  805e7e:	75 1c                	jne    805e9c <draw_text+0x48>
        {
            y+=font_height*size;
  805e80:	8b 15 e6 16 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc216e6]        # 42756c <font_height>
  805e86:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805e89:	0f af d0             	imul   edx,eax
  805e8c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805e8f:	01 d0                	add    eax,edx
  805e91:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805e94:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e97:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e9a:	eb 2e                	jmp    805eca <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805e9c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ea0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ea3:	0f be c8             	movsx  ecx,al
  805ea6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805ea9:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805eac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eaf:	89 c7                	mov    edi,eax
  805eb1:	e8 28 00 00 00       	call   805ede <draw_letter>
            tx+=size*font_width;
  805eb6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805eb9:	8b 05 a9 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc216a9]        # 427568 <font_width>
  805ebf:	0f af d0             	imul   edx,eax
  805ec2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ec5:	01 d0                	add    eax,edx
  805ec7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805eca:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805ecf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ed3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ed6:	84 c0                	test   al,al
  805ed8:	75 9b                	jne    805e75 <draw_text+0x21>
    }
}
  805eda:	90                   	nop
  805edb:	90                   	nop
  805edc:	c9                   	leave  
  805edd:	c3                   	ret    

0000000000805ede <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805ede:	f3 0f 1e fa          	endbr64 
  805ee2:	55                   	push   rbp
  805ee3:	48 89 e5             	mov    rbp,rsp
  805ee6:	48 83 ec 30          	sub    rsp,0x30
  805eea:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805eed:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805ef0:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805ef3:	89 c8                	mov    eax,ecx
  805ef5:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805ef8:	48 8b 05 79 16 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21679]        # 427578 <glyph_table>
  805eff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805f03:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805f07:	8b 05 77 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21677]        # 427584 <glyph_nr>
  805f0d:	39 c2                	cmp    edx,eax
  805f0f:	73 13                	jae    805f24 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805f11:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805f15:	8b 05 65 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21665]        # 427580 <bytes_per_glyph>
  805f1b:	0f af c2             	imul   eax,edx
  805f1e:	89 c0                	mov    eax,eax
  805f20:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f24:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805f2b:	e9 c9 00 00 00       	jmp    805ff9 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805f30:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805f34:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805f3b:	e9 9a 00 00 00       	jmp    805fda <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805f40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805f43:	c1 e8 03             	shr    eax,0x3
  805f46:	89 c2                	mov    edx,eax
  805f48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f4c:	48 01 d0             	add    rax,rdx
  805f4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805f52:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805f55:	84 c0                	test   al,al
  805f57:	74 37                	je     805f90 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805f59:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f5c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f60:	89 c2                	mov    edx,eax
  805f62:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f65:	01 d0                	add    eax,edx
  805f67:	89 c6                	mov    esi,eax
  805f69:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f6c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805f70:	89 c2                	mov    edx,eax
  805f72:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805f75:	01 d0                	add    eax,edx
  805f77:	89 c7                	mov    edi,eax
  805f79:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805f7c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f7f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805f85:	89 d1                	mov    ecx,edx
  805f87:	89 c2                	mov    edx,eax
  805f89:	e8 29 fe ff ff       	call   805db7 <fill_rect>
  805f8e:	eb 35                	jmp    805fc5 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805f90:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f93:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f97:	89 c2                	mov    edx,eax
  805f99:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f9c:	01 d0                	add    eax,edx
  805f9e:	89 c6                	mov    esi,eax
  805fa0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805fa3:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805fa7:	89 c2                	mov    edx,eax
  805fa9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805fac:	01 d0                	add    eax,edx
  805fae:	89 c7                	mov    edi,eax
  805fb0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805fb3:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805fb6:	41 b8 00 00 00 00    	mov    r8d,0x0
  805fbc:	89 d1                	mov    ecx,edx
  805fbe:	89 c2                	mov    edx,eax
  805fc0:	e8 f2 fd ff ff       	call   805db7 <fill_rect>
            }

            mask >>= 1;
  805fc5:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805fc8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805fcb:	83 e0 07             	and    eax,0x7
  805fce:	85 c0                	test   eax,eax
  805fd0:	75 04                	jne    805fd6 <draw_letter+0xf8>
                mask = 1 << 7;
  805fd2:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805fd6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805fda:	8b 05 88 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21588]        # 427568 <font_width>
  805fe0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805fe3:	0f 82 57 ff ff ff    	jb     805f40 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805fe9:	8b 05 81 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21581]        # 427570 <font_width_bytes>
  805fef:	89 c0                	mov    eax,eax
  805ff1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805ff5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805ff9:	8b 05 6d 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2156d]        # 42756c <font_height>
  805fff:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806002:	0f 82 28 ff ff ff    	jb     805f30 <draw_letter+0x52>
    }
}
  806008:	90                   	nop
  806009:	90                   	nop
  80600a:	c9                   	leave  
  80600b:	c3                   	ret    

000000000080600c <scr_up>:
//向上滚动一个像素
void scr_up(){
  80600c:	f3 0f 1e fa          	endbr64 
  806010:	55                   	push   rbp
  806011:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  806014:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80601b:	eb 6c                	jmp    806089 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80601d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806024:	eb 52                	jmp    806078 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806026:	8b 15 04 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21504]        # 427530 <framebuffer+0x10>
  80602c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80602f:	0f af c2             	imul   eax,edx
  806032:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806034:	0f b6 05 01 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21501]        # 42753c <framebuffer+0x1c>
  80603b:	0f b6 c0             	movzx  eax,al
  80603e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806042:	8d 50 07             	lea    edx,[rax+0x7]
  806045:	85 c0                	test   eax,eax
  806047:	0f 48 c2             	cmovs  eax,edx
  80604a:	c1 f8 03             	sar    eax,0x3
  80604d:	48 98                	cdqe   
  80604f:	48 01 c8             	add    rax,rcx
  806052:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806058:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  80605c:	8b 05 ce 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214ce]        # 427530 <framebuffer+0x10>
  806062:	89 c2                	mov    edx,eax
  806064:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806068:	48 01 d0             	add    rax,rdx
  80606b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80606e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806072:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806074:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806078:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80607b:	8b 05 d3 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214d3]        # 427554 <max_ch_nr_x>
  806081:	39 c2                	cmp    edx,eax
  806083:	72 a1                	jb     806026 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  806085:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806089:	8b 05 c9 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214c9]        # 427558 <max_ch_nr_y>
  80608f:	8d 50 ff             	lea    edx,[rax-0x1]
  806092:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806095:	39 c2                	cmp    edx,eax
  806097:	77 84                	ja     80601d <scr_up+0x11>
        }

    }
}
  806099:	90                   	nop
  80609a:	90                   	nop
  80609b:	5d                   	pop    rbp
  80609c:	c3                   	ret    

000000000080609d <scr_down>:
void scr_down(){
  80609d:	f3 0f 1e fa          	endbr64 
  8060a1:	55                   	push   rbp
  8060a2:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8060a5:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  8060ac:	eb 72                	jmp    806120 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8060ae:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8060b5:	eb 58                	jmp    80610f <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8060b7:	8b 15 73 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21473]        # 427530 <framebuffer+0x10>
  8060bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060c0:	0f af c2             	imul   eax,edx
  8060c3:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8060c5:	0f b6 05 70 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21470]        # 42753c <framebuffer+0x1c>
  8060cc:	0f b6 c0             	movzx  eax,al
  8060cf:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8060d3:	8d 50 07             	lea    edx,[rax+0x7]
  8060d6:	85 c0                	test   eax,eax
  8060d8:	0f 48 c2             	cmovs  eax,edx
  8060db:	c1 f8 03             	sar    eax,0x3
  8060de:	48 98                	cdqe   
  8060e0:	48 01 c8             	add    rax,rcx
  8060e3:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8060e9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  8060ed:	8b 05 3d 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2143d]        # 427530 <framebuffer+0x10>
  8060f3:	89 c0                	mov    eax,eax
  8060f5:	48 f7 d8             	neg    rax
  8060f8:	48 89 c2             	mov    rdx,rax
  8060fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8060ff:	48 01 d0             	add    rax,rdx
  806102:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806105:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806109:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80610b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80610f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806112:	8b 05 3c 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2143c]        # 427554 <max_ch_nr_x>
  806118:	39 c2                	cmp    edx,eax
  80611a:	72 9b                	jb     8060b7 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  80611c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806120:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806123:	8b 05 2f 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2142f]        # 427558 <max_ch_nr_y>
  806129:	39 c2                	cmp    edx,eax
  80612b:	72 81                	jb     8060ae <scr_down+0x11>
        }

    }
}
  80612d:	90                   	nop
  80612e:	90                   	nop
  80612f:	5d                   	pop    rbp
  806130:	c3                   	ret    

0000000000806131 <print>:
void print(char* s){
  806131:	f3 0f 1e fa          	endbr64 
  806135:	55                   	push   rbp
  806136:	48 89 e5             	mov    rbp,rsp
  806139:	48 83 ec 18          	sub    rsp,0x18
  80613d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  806141:	e9 f7 00 00 00       	jmp    80623d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806146:	8b 15 00 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21400]        # 42754c <fb_cursor_x>
  80614c:	8b 05 02 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21402]        # 427554 <max_ch_nr_x>
  806152:	39 c2                	cmp    edx,eax
  806154:	77 0b                	ja     806161 <print+0x30>
  806156:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80615a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80615d:	3c 0a                	cmp    al,0xa
  80615f:	75 19                	jne    80617a <print+0x49>
        {
            fb_cursor_y+=1;
  806161:	8b 05 e9 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213e9]        # 427550 <fb_cursor_y>
  806167:	83 c0 01             	add    eax,0x1
  80616a:	89 05 e0 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc213e0],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  806170:	c7 05 d2 13 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc213d2],0x0        # 42754c <fb_cursor_x>
  806177:	00 00 00 
        }
        if(*s=='\n')continue;
  80617a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80617e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806181:	3c 0a                	cmp    al,0xa
  806183:	0f 84 ae 00 00 00    	je     806237 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  806189:	8b 15 c1 13 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc213c1]        # 427550 <fb_cursor_y>
  80618f:	8b 05 c3 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213c3]        # 427558 <max_ch_nr_y>
  806195:	39 c2                	cmp    edx,eax
  806197:	72 3c                	jb     8061d5 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  806199:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8061a0:	eb 0e                	jmp    8061b0 <print+0x7f>
                scr_up();
  8061a2:	b8 00 00 00 00       	mov    eax,0x0
  8061a7:	e8 60 fe ff ff       	call   80600c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  8061ac:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8061b0:	8b 05 b6 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213b6]        # 42756c <font_height>
  8061b6:	8b 15 f4 42 00 00    	mov    edx,DWORD PTR [rip+0x42f4]        # 80a4b0 <font_size>
  8061bc:	0f af d0             	imul   edx,eax
  8061bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061c2:	39 c2                	cmp    edx,eax
  8061c4:	77 dc                	ja     8061a2 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  8061c6:	8b 05 8c 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2138c]        # 427558 <max_ch_nr_y>
  8061cc:	83 e8 01             	sub    eax,0x1
  8061cf:	89 05 7b 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2137b],eax        # 427550 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8061d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8061d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061dc:	0f be d0             	movsx  edx,al
  8061df:	8b 05 cb 42 00 00    	mov    eax,DWORD PTR [rip+0x42cb]        # 80a4b0 <font_size>
  8061e5:	8b 35 65 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21365]        # 427550 <fb_cursor_y>
  8061eb:	8b 0d 7b 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2137b]        # 42756c <font_height>
  8061f1:	0f af ce             	imul   ecx,esi
  8061f4:	8b 35 b6 42 00 00    	mov    esi,DWORD PTR [rip+0x42b6]        # 80a4b0 <font_size>
  8061fa:	0f af ce             	imul   ecx,esi
  8061fd:	41 89 c8             	mov    r8d,ecx
  806200:	8b 35 46 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21346]        # 42754c <fb_cursor_x>
  806206:	8b 0d 5c 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2135c]        # 427568 <font_width>
  80620c:	0f af ce             	imul   ecx,esi
  80620f:	8b 35 9b 42 00 00    	mov    esi,DWORD PTR [rip+0x429b]        # 80a4b0 <font_size>
  806215:	0f af ce             	imul   ecx,esi
  806218:	89 cf                	mov    edi,ecx
  80621a:	89 d1                	mov    ecx,edx
  80621c:	89 c2                	mov    edx,eax
  80621e:	44 89 c6             	mov    esi,r8d
  806221:	e8 b8 fc ff ff       	call   805ede <draw_letter>
        fb_cursor_x+=1;
  806226:	8b 05 20 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21320]        # 42754c <fb_cursor_x>
  80622c:	83 c0 01             	add    eax,0x1
  80622f:	89 05 17 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21317],eax        # 42754c <fb_cursor_x>
  806235:	eb 01                	jmp    806238 <print+0x107>
        if(*s=='\n')continue;
  806237:	90                   	nop
    for(;*s;s++){
  806238:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80623d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806241:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806244:	84 c0                	test   al,al
  806246:	0f 85 fa fe ff ff    	jne    806146 <print+0x15>
    }
}
  80624c:	90                   	nop
  80624d:	90                   	nop
  80624e:	c9                   	leave  
  80624f:	c3                   	ret    

0000000000806250 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  806250:	f3 0f 1e fa          	endbr64 
  806254:	55                   	push   rbp
  806255:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  806258:	0f b6 05 4e 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2154e]        # 4277ad <k_shift>
  80625f:	84 c0                	test   al,al
  806261:	0f 94 c0             	sete   al
  806264:	88 05 43 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21543],al        # 4277ad <k_shift>
}
  80626a:	90                   	nop
  80626b:	5d                   	pop    rbp
  80626c:	c3                   	ret    

000000000080626d <ctrl>:
void ctrl()
{
  80626d:	f3 0f 1e fa          	endbr64 
  806271:	55                   	push   rbp
  806272:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  806275:	0f b6 05 32 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21532]        # 4277ae <k_ctrl>
  80627c:	84 c0                	test   al,al
  80627e:	0f 94 c0             	sete   al
  806281:	88 05 27 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21527],al        # 4277ae <k_ctrl>
}
  806287:	90                   	nop
  806288:	5d                   	pop    rbp
  806289:	c3                   	ret    

000000000080628a <capslock>:
void capslock()
{
  80628a:	f3 0f 1e fa          	endbr64 
  80628e:	55                   	push   rbp
  80628f:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  806292:	0f b6 05 16 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21516]        # 4277af <k_capslock>
  806299:	84 c0                	test   al,al
  80629b:	0f 94 c0             	sete   al
  80629e:	88 05 0b 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2150b],al        # 4277af <k_capslock>
}
  8062a4:	90                   	nop
  8062a5:	5d                   	pop    rbp
  8062a6:	c3                   	ret    

00000000008062a7 <to_ascii>:
char to_ascii(char scan_code)
{
  8062a7:	f3 0f 1e fa          	endbr64 
  8062ab:	55                   	push   rbp
  8062ac:	48 89 e5             	mov    rbp,rsp
  8062af:	89 f8                	mov    eax,edi
  8062b1:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8062b4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8062bb:	e9 c7 00 00 00       	jmp    806387 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8062c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062c3:	48 63 d0             	movsxd rdx,eax
  8062c6:	48 89 d0             	mov    rax,rdx
  8062c9:	48 c1 e0 02          	shl    rax,0x2
  8062cd:	48 01 d0             	add    rax,rdx
  8062d0:	48 05 42 21 81 00    	add    rax,0x812142
  8062d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062d9:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8062dc:	0f 85 a1 00 00 00    	jne    806383 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  8062e2:	0f b6 05 c6 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214c6]        # 4277af <k_capslock>
  8062e9:	84 c0                	test   al,al
  8062eb:	74 55                	je     806342 <to_ascii+0x9b>
  8062ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062f0:	48 63 d0             	movsxd rdx,eax
  8062f3:	48 89 d0             	mov    rax,rdx
  8062f6:	48 c1 e0 02          	shl    rax,0x2
  8062fa:	48 01 d0             	add    rax,rdx
  8062fd:	48 05 40 21 81 00    	add    rax,0x812140
  806303:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806306:	3c 60                	cmp    al,0x60
  806308:	7e 38                	jle    806342 <to_ascii+0x9b>
  80630a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80630d:	48 63 d0             	movsxd rdx,eax
  806310:	48 89 d0             	mov    rax,rdx
  806313:	48 c1 e0 02          	shl    rax,0x2
  806317:	48 01 d0             	add    rax,rdx
  80631a:	48 05 40 21 81 00    	add    rax,0x812140
  806320:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806323:	3c 7a                	cmp    al,0x7a
  806325:	7f 1b                	jg     806342 <to_ascii+0x9b>
  806327:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80632a:	48 63 d0             	movsxd rdx,eax
  80632d:	48 89 d0             	mov    rax,rdx
  806330:	48 c1 e0 02          	shl    rax,0x2
  806334:	48 01 d0             	add    rax,rdx
  806337:	48 05 41 21 81 00    	add    rax,0x812141
  80633d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806340:	eb 54                	jmp    806396 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  806342:	0f b6 05 64 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21464]        # 4277ad <k_shift>
  806349:	84 c0                	test   al,al
  80634b:	74 1b                	je     806368 <to_ascii+0xc1>
  80634d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806350:	48 63 d0             	movsxd rdx,eax
  806353:	48 89 d0             	mov    rax,rdx
  806356:	48 c1 e0 02          	shl    rax,0x2
  80635a:	48 01 d0             	add    rax,rdx
  80635d:	48 05 41 21 81 00    	add    rax,0x812141
  806363:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806366:	eb 2e                	jmp    806396 <to_ascii+0xef>
            else return key_map[i].ascii;
  806368:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80636b:	48 63 d0             	movsxd rdx,eax
  80636e:	48 89 d0             	mov    rax,rdx
  806371:	48 c1 e0 02          	shl    rax,0x2
  806375:	48 01 d0             	add    rax,rdx
  806378:	48 05 40 21 81 00    	add    rax,0x812140
  80637e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806381:	eb 13                	jmp    806396 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806383:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806387:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  80638b:	0f 8e 2f ff ff ff    	jle    8062c0 <to_ascii+0x19>
        }

    return '\0';
  806391:	b8 00 00 00 00       	mov    eax,0x0
}
  806396:	5d                   	pop    rbp
  806397:	c3                   	ret    

0000000000806398 <init_kb>:
int init_kb()
{
  806398:	f3 0f 1e fa          	endbr64 
  80639c:	55                   	push   rbp
  80639d:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  8063a0:	bf 80 20 81 00       	mov    edi,0x812080
  8063a5:	e8 95 c7 ff ff       	call   802b3f <reg_device>
    reg_driver(&drv_keyboard);
  8063aa:	bf e0 1f 81 00       	mov    edi,0x811fe0
  8063af:	e8 73 ca ff ff       	call   802e27 <reg_driver>
}
  8063b4:	90                   	nop
  8063b5:	5d                   	pop    rbp
  8063b6:	c3                   	ret    

00000000008063b7 <key_proc>:
int key_proc()
{
  8063b7:	f3 0f 1e fa          	endbr64 
  8063bb:	55                   	push   rbp
  8063bc:	48 89 e5             	mov    rbp,rsp
  8063bf:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8063c3:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8063c7:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8063cb:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8063cf:	bf 60 00 00 00       	mov    edi,0x60
  8063d4:	e8 30 eb ff ff       	call   804f09 <inb>
  8063d9:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8063dc:	8b 05 ea 40 00 00    	mov    eax,DWORD PTR [rip+0x40ea]        # 80a4cc <key_bufq+0xc>
  8063e2:	83 c0 01             	add    eax,0x1
  8063e5:	8b 0d e5 40 00 00    	mov    ecx,DWORD PTR [rip+0x40e5]        # 80a4d0 <key_bufq+0x10>
  8063eb:	99                   	cdq    
  8063ec:	f7 f9                	idiv   ecx
  8063ee:	8b 05 d4 40 00 00    	mov    eax,DWORD PTR [rip+0x40d4]        # 80a4c8 <key_bufq+0x8>
  8063f4:	39 c2                	cmp    edx,eax
  8063f6:	74 32                	je     80642a <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8063f8:	48 8b 15 c1 40 00 00 	mov    rdx,QWORD PTR [rip+0x40c1]        # 80a4c0 <key_bufq>
  8063ff:	8b 05 c7 40 00 00    	mov    eax,DWORD PTR [rip+0x40c7]        # 80a4cc <key_bufq+0xc>
  806405:	48 98                	cdqe   
  806407:	48 01 c2             	add    rdx,rax
  80640a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80640e:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  806410:	8b 05 b6 40 00 00    	mov    eax,DWORD PTR [rip+0x40b6]        # 80a4cc <key_bufq+0xc>
  806416:	83 c0 01             	add    eax,0x1
  806419:	8b 0d b1 40 00 00    	mov    ecx,DWORD PTR [rip+0x40b1]        # 80a4d0 <key_bufq+0x10>
  80641f:	99                   	cdq    
  806420:	f7 f9                	idiv   ecx
  806422:	89 d0                	mov    eax,edx
  806424:	89 05 a2 40 00 00    	mov    DWORD PTR [rip+0x40a2],eax        # 80a4cc <key_bufq+0xc>
    }

    if(scan1==0x48)
  80642a:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  80642e:	75 0a                	jne    80643a <key_proc+0x83>
        scr_up();
  806430:	b8 00 00 00 00       	mov    eax,0x0
  806435:	e8 d2 fb ff ff       	call   80600c <scr_up>
    if(scan1==0x50)
  80643a:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  80643e:	75 0a                	jne    80644a <key_proc+0x93>
        scr_down();
  806440:	b8 00 00 00 00       	mov    eax,0x0
  806445:	e8 53 fc ff ff       	call   80609d <scr_down>
    switch (scan1)
  80644a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80644e:	3d b6 00 00 00       	cmp    eax,0xb6
  806453:	74 41                	je     806496 <key_proc+0xdf>
  806455:	3d b6 00 00 00       	cmp    eax,0xb6
  80645a:	7f 5e                	jg     8064ba <key_proc+0x103>
  80645c:	3d aa 00 00 00       	cmp    eax,0xaa
  806461:	74 33                	je     806496 <key_proc+0xdf>
  806463:	3d aa 00 00 00       	cmp    eax,0xaa
  806468:	7f 50                	jg     8064ba <key_proc+0x103>
  80646a:	3d 9d 00 00 00       	cmp    eax,0x9d
  80646f:	74 31                	je     8064a2 <key_proc+0xeb>
  806471:	3d 9d 00 00 00       	cmp    eax,0x9d
  806476:	7f 42                	jg     8064ba <key_proc+0x103>
  806478:	83 f8 3a             	cmp    eax,0x3a
  80647b:	74 31                	je     8064ae <key_proc+0xf7>
  80647d:	83 f8 3a             	cmp    eax,0x3a
  806480:	7f 38                	jg     8064ba <key_proc+0x103>
  806482:	83 f8 36             	cmp    eax,0x36
  806485:	74 0f                	je     806496 <key_proc+0xdf>
  806487:	83 f8 36             	cmp    eax,0x36
  80648a:	7f 2e                	jg     8064ba <key_proc+0x103>
  80648c:	83 f8 1d             	cmp    eax,0x1d
  80648f:	74 11                	je     8064a2 <key_proc+0xeb>
  806491:	83 f8 2a             	cmp    eax,0x2a
  806494:	75 24                	jne    8064ba <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  806496:	b8 00 00 00 00       	mov    eax,0x0
  80649b:	e8 b0 fd ff ff       	call   806250 <shift>
            break;
  8064a0:	eb 19                	jmp    8064bb <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  8064a2:	b8 00 00 00 00       	mov    eax,0x0
  8064a7:	e8 c1 fd ff ff       	call   80626d <ctrl>
            break;
  8064ac:	eb 0d                	jmp    8064bb <key_proc+0x104>
        case 0x3a:
            capslock();
  8064ae:	b8 00 00 00 00       	mov    eax,0x0
  8064b3:	e8 d2 fd ff ff       	call   80628a <capslock>
            break;
  8064b8:	eb 01                	jmp    8064bb <key_proc+0x104>
        default:
            break;
  8064ba:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8064bb:	b8 00 00 00 00       	mov    eax,0x0
  8064c0:	e8 59 ea ff ff       	call   804f1e <eoi>
    asm volatile("leave \r\n iretq");
  8064c5:	c9                   	leave  
  8064c6:	48 cf                	iretq  
}
  8064c8:	90                   	nop
  8064c9:	c9                   	leave  
  8064ca:	c3                   	ret    

00000000008064cb <sys_getkbc>:

char sys_getkbc()
{
  8064cb:	f3 0f 1e fa          	endbr64 
  8064cf:	55                   	push   rbp
  8064d0:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  8064d3:	8b 15 f3 3f 00 00    	mov    edx,DWORD PTR [rip+0x3ff3]        # 80a4cc <key_bufq+0xc>
  8064d9:	8b 05 e9 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fe9]        # 80a4c8 <key_bufq+0x8>
  8064df:	39 c2                	cmp    edx,eax
  8064e1:	75 07                	jne    8064ea <sys_getkbc+0x1f>
  8064e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8064e8:	eb 30                	jmp    80651a <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  8064ea:	8b 05 dc 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fdc]        # 80a4cc <key_bufq+0xc>
  8064f0:	48 98                	cdqe   
  8064f2:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  8064f9:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  8064fc:	8b 05 ca 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fca]        # 80a4cc <key_bufq+0xc>
  806502:	83 c0 01             	add    eax,0x1
  806505:	8b 0d c5 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3fc5]        # 80a4d0 <key_bufq+0x10>
  80650b:	99                   	cdq    
  80650c:	f7 f9                	idiv   ecx
  80650e:	89 d0                	mov    eax,edx
  806510:	89 05 b6 3f 00 00    	mov    DWORD PTR [rip+0x3fb6],eax        # 80a4cc <key_bufq+0xc>
    return c;
  806516:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80651a:	5d                   	pop    rbp
  80651b:	c3                   	ret    

000000000080651c <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  80651c:	f3 0f 1e fa          	endbr64 
  806520:	55                   	push   rbp
  806521:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806524:	b8 00 00 00 00       	mov    eax,0x0
  806529:	e8 8d 09 00 00       	call   806ebb <hd_iterate>
    return 0;
  80652e:	b8 00 00 00 00       	mov    eax,0x0
}
  806533:	5d                   	pop    rbp
  806534:	c3                   	ret    

0000000000806535 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806535:	f3 0f 1e fa          	endbr64 
  806539:	55                   	push   rbp
  80653a:	48 89 e5             	mov    rbp,rsp
  80653d:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806541:	48 8b 05 78 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f78]        # 42a4c0 <running_req>
  806548:	48 85 c0             	test   rax,rax
  80654b:	75 0a                	jne    806557 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80654d:	b8 01 00 00 00       	mov    eax,0x1
  806552:	e9 a3 01 00 00       	jmp    8066fa <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806557:	48 8b 05 62 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f62]        # 42a4c0 <running_req>
  80655e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806562:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806566:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80656d:	48 8b 05 4c 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f4c]        # 42a4c0 <running_req>
  806574:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806577:	83 f8 02             	cmp    eax,0x2
  80657a:	74 0f                	je     80658b <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  80657c:	48 8b 05 3d 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f3d]        # 42a4c0 <running_req>
  806583:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806586:	83 f8 03             	cmp    eax,0x3
  806589:	75 07                	jne    806592 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  80658b:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806592:	48 8b 05 27 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f27]        # 42a4c0 <running_req>
  806599:	8b 00                	mov    eax,DWORD PTR [rax]
  80659b:	85 c0                	test   eax,eax
  80659d:	75 42                	jne    8065e1 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  80659f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8065a6:	eb 22                	jmp    8065ca <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8065a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065ab:	0f b7 c0             	movzx  eax,ax
  8065ae:	89 c7                	mov    edi,eax
  8065b0:	e8 5e e9 ff ff       	call   804f13 <inw>
  8065b5:	89 c2                	mov    edx,eax
  8065b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065bb:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8065bf:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8065c3:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8065c6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8065ca:	48 8b 05 ef 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23eef]        # 42a4c0 <running_req>
  8065d1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8065d4:	c1 e0 08             	shl    eax,0x8
  8065d7:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8065da:	7c cc                	jl     8065a8 <disk_int_handler_c+0x73>
  8065dc:	e9 ca 00 00 00       	jmp    8066ab <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8065e1:	48 8b 05 d8 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ed8]        # 42a4c0 <running_req>
  8065e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8065ea:	83 f8 01             	cmp    eax,0x1
  8065ed:	75 42                	jne    806631 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8065ef:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8065f6:	eb 25                	jmp    80661d <disk_int_handler_c+0xe8>
            outw(port,*p++);
  8065f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065fc:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806600:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806604:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806607:	0f b7 d0             	movzx  edx,ax
  80660a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80660d:	0f b7 c0             	movzx  eax,ax
  806610:	89 d6                	mov    esi,edx
  806612:	89 c7                	mov    edi,eax
  806614:	e8 e4 e8 ff ff       	call   804efd <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806619:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80661d:	48 8b 05 9c 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e9c]        # 42a4c0 <running_req>
  806624:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806627:	c1 e0 08             	shl    eax,0x8
  80662a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80662d:	7c c9                	jl     8065f8 <disk_int_handler_c+0xc3>
  80662f:	eb 7a                	jmp    8066ab <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806631:	48 8b 05 88 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e88]        # 42a4c0 <running_req>
  806638:	8b 00                	mov    eax,DWORD PTR [rax]
  80663a:	83 f8 02             	cmp    eax,0x2
  80663d:	75 34                	jne    806673 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  80663f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806642:	83 c0 07             	add    eax,0x7
  806645:	0f b6 c0             	movzx  eax,al
  806648:	89 c7                	mov    edi,eax
  80664a:	e8 ba e8 ff ff       	call   804f09 <inb>
  80664f:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806652:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806655:	0f b7 c0             	movzx  eax,ax
  806658:	89 c7                	mov    edi,eax
  80665a:	e8 b4 e8 ff ff       	call   804f13 <inw>
  80665f:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806663:	48 8b 05 56 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e56]        # 42a4c0 <running_req>
  80666a:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806671:	eb 38                	jmp    8066ab <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806673:	48 8b 05 46 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e46]        # 42a4c0 <running_req>
  80667a:	8b 00                	mov    eax,DWORD PTR [rax]
  80667c:	83 f8 03             	cmp    eax,0x3
  80667f:	75 2a                	jne    8066ab <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806681:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806684:	83 c0 07             	add    eax,0x7
  806687:	0f b6 c0             	movzx  eax,al
  80668a:	89 c7                	mov    edi,eax
  80668c:	e8 78 e8 ff ff       	call   804f09 <inb>
  806691:	0f b6 c0             	movzx  eax,al
  806694:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806697:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80669a:	89 c6                	mov    esi,eax
  80669c:	bf 16 23 81 00       	mov    edi,0x812316
  8066a1:	b8 00 00 00 00       	mov    eax,0x0
  8066a6:	e8 2e a6 ff ff       	call   800cd9 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8066ab:	48 8b 05 0e 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e0e]        # 42a4c0 <running_req>
  8066b2:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8066b9:	48 8b 05 00 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e00]        # 42a4c0 <running_req>
  8066c0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8066c4:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8066cb:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8066ce:	48 8b 05 f3 3d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23df3]        # 42a4c8 <running_devman_req>
  8066d5:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8066dc:	00 00 00 
    running_devman_req=NULL;
  8066df:	48 c7 05 de 3d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23dde],0x0        # 42a4c8 <running_devman_req>
  8066e6:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8066ea:	48 c7 05 cb 3d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23dcb],0x0        # 42a4c0 <running_req>
  8066f1:	00 00 00 00 
    return 0;
  8066f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8066fa:	c9                   	leave  
  8066fb:	c3                   	ret    

00000000008066fc <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8066fc:	f3 0f 1e fa          	endbr64 
  806700:	55                   	push   rbp
  806701:	48 89 e5             	mov    rbp,rsp
  806704:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806707:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80670a:	48 63 d0             	movsxd rdx,eax
  80670d:	48 89 d0             	mov    rax,rdx
  806710:	48 01 c0             	add    rax,rax
  806713:	48 01 d0             	add    rax,rdx
  806716:	48 c1 e0 04          	shl    rax,0x4
  80671a:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806720:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806722:	5d                   	pop    rbp
  806723:	c3                   	ret    

0000000000806724 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806724:	f3 0f 1e fa          	endbr64 
  806728:	55                   	push   rbp
  806729:	48 89 e5             	mov    rbp,rsp
  80672c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80672f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806732:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806735:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806738:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  80673c:	8b 05 b2 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23db2]        # 42a4f4 <tail>
  806742:	83 c0 01             	add    eax,0x1
  806745:	48 63 d0             	movsxd rdx,eax
  806748:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  80674f:	48 c1 ea 20          	shr    rdx,0x20
  806753:	01 c2                	add    edx,eax
  806755:	c1 fa 07             	sar    edx,0x7
  806758:	89 c1                	mov    ecx,eax
  80675a:	c1 f9 1f             	sar    ecx,0x1f
  80675d:	29 ca                	sub    edx,ecx
  80675f:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806765:	29 c8                	sub    eax,ecx
  806767:	89 c2                	mov    edx,eax
  806769:	8b 05 81 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d81]        # 42a4f0 <head>
  80676f:	39 c2                	cmp    edx,eax
  806771:	75 0a                	jne    80677d <request+0x59>
    {
        return -1;
  806773:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806778:	e9 0d 01 00 00       	jmp    80688a <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  80677d:	8b 05 71 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d71]        # 42a4f4 <tail>
  806783:	48 63 d0             	movsxd rdx,eax
  806786:	48 89 d0             	mov    rax,rdx
  806789:	48 01 c0             	add    rax,rax
  80678c:	48 01 d0             	add    rax,rdx
  80678f:	48 c1 e0 04          	shl    rax,0x4
  806793:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  80679a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80679d:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  80679f:	8b 05 4f 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d4f]        # 42a4f4 <tail>
  8067a5:	48 63 d0             	movsxd rdx,eax
  8067a8:	48 89 d0             	mov    rax,rdx
  8067ab:	48 01 c0             	add    rax,rax
  8067ae:	48 01 d0             	add    rax,rdx
  8067b1:	48 c1 e0 04          	shl    rax,0x4
  8067b5:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  8067bc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067bf:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8067c1:	8b 05 2d 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d2d]        # 42a4f4 <tail>
  8067c7:	48 63 d0             	movsxd rdx,eax
  8067ca:	48 89 d0             	mov    rax,rdx
  8067cd:	48 01 c0             	add    rax,rax
  8067d0:	48 01 d0             	add    rax,rdx
  8067d3:	48 c1 e0 04          	shl    rax,0x4
  8067d7:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  8067de:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8067e1:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8067e3:	8b 05 0b 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d0b]        # 42a4f4 <tail>
  8067e9:	48 63 d0             	movsxd rdx,eax
  8067ec:	48 89 d0             	mov    rax,rdx
  8067ef:	48 01 c0             	add    rax,rax
  8067f2:	48 01 d0             	add    rax,rdx
  8067f5:	48 c1 e0 04          	shl    rax,0x4
  8067f9:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  806800:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806803:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806805:	8b 05 e9 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23ce9]        # 42a4f4 <tail>
  80680b:	48 63 d0             	movsxd rdx,eax
  80680e:	48 89 d0             	mov    rax,rdx
  806811:	48 01 c0             	add    rax,rax
  806814:	48 01 d0             	add    rax,rdx
  806817:	48 c1 e0 04          	shl    rax,0x4
  80681b:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806821:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806827:	8b 05 c7 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23cc7]        # 42a4f4 <tail>
  80682d:	48 63 d0             	movsxd rdx,eax
  806830:	48 89 d0             	mov    rax,rdx
  806833:	48 01 c0             	add    rax,rax
  806836:	48 01 d0             	add    rax,rdx
  806839:	48 c1 e0 04          	shl    rax,0x4
  80683d:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  806844:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806848:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  80684b:	8b 05 a3 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23ca3]        # 42a4f4 <tail>
  806851:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806854:	8b 05 9a 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23c9a]        # 42a4f4 <tail>
  80685a:	8d 50 01             	lea    edx,[rax+0x1]
  80685d:	48 63 c2             	movsxd rax,edx
  806860:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806867:	48 c1 e8 20          	shr    rax,0x20
  80686b:	01 d0                	add    eax,edx
  80686d:	c1 f8 07             	sar    eax,0x7
  806870:	89 d1                	mov    ecx,edx
  806872:	c1 f9 1f             	sar    ecx,0x1f
  806875:	29 c8                	sub    eax,ecx
  806877:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80687d:	89 d0                	mov    eax,edx
  80687f:	29 c8                	sub    eax,ecx
  806881:	89 05 6d 3c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23c6d],eax        # 42a4f4 <tail>
    return r;
  806887:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80688a:	5d                   	pop    rbp
  80688b:	c3                   	ret    

000000000080688c <execute_request>:
int execute_request(){
  80688c:	f3 0f 1e fa          	endbr64 
  806890:	55                   	push   rbp
  806891:	48 89 e5             	mov    rbp,rsp
  806894:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806898:	48 8b 05 21 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c21]        # 42a4c0 <running_req>
  80689f:	48 85 c0             	test   rax,rax
  8068a2:	74 6a                	je     80690e <execute_request+0x82>
    {
        running_req->time++;
  8068a4:	48 8b 05 15 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c15]        # 42a4c0 <running_req>
  8068ab:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8068ae:	83 c2 01             	add    edx,0x1
  8068b1:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8068b4:	48 8b 05 05 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c05]        # 42a4c0 <running_req>
  8068bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8068bd:	83 f8 02             	cmp    eax,0x2
  8068c0:	74 0a                	je     8068cc <execute_request+0x40>
            return 2;
  8068c2:	b8 02 00 00 00       	mov    eax,0x2
  8068c7:	e9 b4 01 00 00       	jmp    806a80 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8068cc:	48 8b 05 ed 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bed]        # 42a4c0 <running_req>
  8068d3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8068d6:	83 f8 0a             	cmp    eax,0xa
  8068d9:	7e 29                	jle    806904 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  8068db:	48 8b 05 de 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bde]        # 42a4c0 <running_req>
  8068e2:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8068e9:	48 8b 05 d0 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bd0]        # 42a4c0 <running_req>
  8068f0:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8068f7:	48 c7 05 be 3b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23bbe],0x0        # 42a4c0 <running_req>
  8068fe:	00 00 00 00 
  806902:	eb 0a                	jmp    80690e <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806904:	b8 02 00 00 00       	mov    eax,0x2
  806909:	e9 72 01 00 00       	jmp    806a80 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  80690e:	8b 15 dc 3b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc23bdc]        # 42a4f0 <head>
  806914:	8b 05 da 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23bda]        # 42a4f4 <tail>
  80691a:	39 c2                	cmp    edx,eax
  80691c:	75 0a                	jne    806928 <execute_request+0x9c>
  80691e:	b8 01 00 00 00       	mov    eax,0x1
  806923:	e9 58 01 00 00       	jmp    806a80 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806928:	8b 05 c2 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23bc2]        # 42a4f0 <head>
  80692e:	48 63 d0             	movsxd rdx,eax
  806931:	48 89 d0             	mov    rax,rdx
  806934:	48 01 c0             	add    rax,rax
  806937:	48 01 d0             	add    rax,rdx
  80693a:	48 c1 e0 04          	shl    rax,0x4
  80693e:	48 05 c0 77 42 00    	add    rax,0x4277c0
  806944:	48 89 05 75 3b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23b75],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80694b:	8b 05 9f 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23b9f]        # 42a4f0 <head>
  806951:	8d 50 01             	lea    edx,[rax+0x1]
  806954:	48 63 c2             	movsxd rax,edx
  806957:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80695e:	48 c1 e8 20          	shr    rax,0x20
  806962:	01 d0                	add    eax,edx
  806964:	c1 f8 07             	sar    eax,0x7
  806967:	89 d1                	mov    ecx,edx
  806969:	c1 f9 1f             	sar    ecx,0x1f
  80696c:	29 c8                	sub    eax,ecx
  80696e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806974:	89 d0                	mov    eax,edx
  806976:	29 c8                	sub    eax,ecx
  806978:	89 05 72 3b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23b72],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  80697e:	48 8b 05 3b 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b3b]        # 42a4c0 <running_req>
  806985:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  80698c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806993:	48 8b 05 26 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b26]        # 42a4c0 <running_req>
  80699a:	8b 00                	mov    eax,DWORD PTR [rax]
  80699c:	83 f8 03             	cmp    eax,0x3
  80699f:	0f 84 ad 00 00 00    	je     806a52 <execute_request+0x1c6>
  8069a5:	83 f8 03             	cmp    eax,0x3
  8069a8:	0f 8f bf 00 00 00    	jg     806a6d <execute_request+0x1e1>
  8069ae:	83 f8 02             	cmp    eax,0x2
  8069b1:	0f 84 85 00 00 00    	je     806a3c <execute_request+0x1b0>
  8069b7:	83 f8 02             	cmp    eax,0x2
  8069ba:	0f 8f ad 00 00 00    	jg     806a6d <execute_request+0x1e1>
  8069c0:	85 c0                	test   eax,eax
  8069c2:	74 0a                	je     8069ce <execute_request+0x142>
  8069c4:	83 f8 01             	cmp    eax,0x1
  8069c7:	74 3c                	je     806a05 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8069c9:	e9 9f 00 00 00       	jmp    806a6d <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  8069ce:	48 8b 05 eb 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aeb]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  8069d5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  8069d9:	48 8b 05 e0 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ae0]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  8069e0:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  8069e3:	48 8b 05 d6 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ad6]        # 42a4c0 <running_req>
  8069ea:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8069ed:	89 c6                	mov    esi,eax
  8069ef:	48 8b 05 ca 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aca]        # 42a4c0 <running_req>
  8069f6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8069f9:	89 c7                	mov    edi,eax
  8069fb:	e8 a7 00 00 00       	call   806aa7 <async_read_disk>
  806a00:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a03:	eb 69                	jmp    806a6e <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806a05:	48 8b 05 b4 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ab4]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806a0c:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806a10:	48 8b 05 a9 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aa9]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806a17:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806a1a:	48 8b 05 9f 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a9f]        # 42a4c0 <running_req>
  806a21:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806a24:	89 c6                	mov    esi,eax
  806a26:	48 8b 05 93 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a93]        # 42a4c0 <running_req>
  806a2d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a30:	89 c7                	mov    edi,eax
  806a32:	e8 88 01 00 00       	call   806bbf <async_write_disk>
  806a37:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a3a:	eb 32                	jmp    806a6e <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806a3c:	48 8b 05 7d 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a7d]        # 42a4c0 <running_req>
  806a43:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a46:	89 c7                	mov    edi,eax
  806a48:	e8 8f 06 00 00       	call   8070dc <async_check_disk>
  806a4d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a50:	eb 1c                	jmp    806a6e <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806a52:	48 8b 05 67 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23a67]        # 42a4c0 <running_req>
  806a59:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a5c:	89 c7                	mov    edi,eax
  806a5e:	b8 00 00 00 00       	mov    eax,0x0
  806a63:	e8 1a 00 00 00       	call   806a82 <async_reset_disk>
  806a68:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a6b:	eb 01                	jmp    806a6e <execute_request+0x1e2>
        break;
  806a6d:	90                   	nop
    }
    if(r==-1)return -1;
  806a6e:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806a72:	75 07                	jne    806a7b <execute_request+0x1ef>
  806a74:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a79:	eb 05                	jmp    806a80 <execute_request+0x1f4>
    return 0;
  806a7b:	b8 00 00 00 00       	mov    eax,0x0
}
  806a80:	c9                   	leave  
  806a81:	c3                   	ret    

0000000000806a82 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806a82:	f3 0f 1e fa          	endbr64 
  806a86:	55                   	push   rbp
  806a87:	48 89 e5             	mov    rbp,rsp
  806a8a:	48 83 ec 10          	sub    rsp,0x10
  806a8e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806a91:	be 0c 00 00 00       	mov    esi,0xc
  806a96:	bf f6 03 00 00       	mov    edi,0x3f6
  806a9b:	e8 50 e4 ff ff       	call   804ef0 <outb>
    return 0;
  806aa0:	b8 00 00 00 00       	mov    eax,0x0
}
  806aa5:	c9                   	leave  
  806aa6:	c3                   	ret    

0000000000806aa7 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806aa7:	f3 0f 1e fa          	endbr64 
  806aab:	55                   	push   rbp
  806aac:	48 89 e5             	mov    rbp,rsp
  806aaf:	48 83 ec 30          	sub    rsp,0x30
  806ab3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806ab6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806ab9:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806abc:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806ac0:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806ac6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806acd:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806ad1:	74 06                	je     806ad9 <async_read_disk+0x32>
  806ad3:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806ad7:	75 06                	jne    806adf <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806ad9:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806adf:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806ae3:	74 06                	je     806aeb <async_read_disk+0x44>
  806ae5:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806ae9:	75 07                	jne    806af2 <async_read_disk+0x4b>
        slave_disk=1;
  806aeb:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806af2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806af5:	0f b6 d0             	movzx  edx,al
  806af8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806afc:	83 c0 02             	add    eax,0x2
  806aff:	0f b7 c0             	movzx  eax,ax
  806b02:	89 d6                	mov    esi,edx
  806b04:	89 c7                	mov    edi,eax
  806b06:	e8 e5 e3 ff ff       	call   804ef0 <outb>
    outb(port+3,lba&0xff);
  806b0b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b0e:	0f b6 d0             	movzx  edx,al
  806b11:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b15:	83 c0 03             	add    eax,0x3
  806b18:	0f b7 c0             	movzx  eax,ax
  806b1b:	89 d6                	mov    esi,edx
  806b1d:	89 c7                	mov    edi,eax
  806b1f:	e8 cc e3 ff ff       	call   804ef0 <outb>
    outb(port+4,(lba>>8)&0xff);
  806b24:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b27:	c1 e8 08             	shr    eax,0x8
  806b2a:	0f b6 d0             	movzx  edx,al
  806b2d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b31:	83 c0 04             	add    eax,0x4
  806b34:	0f b7 c0             	movzx  eax,ax
  806b37:	89 d6                	mov    esi,edx
  806b39:	89 c7                	mov    edi,eax
  806b3b:	e8 b0 e3 ff ff       	call   804ef0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806b40:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b43:	c1 e8 10             	shr    eax,0x10
  806b46:	0f b6 d0             	movzx  edx,al
  806b49:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b4d:	83 c0 05             	add    eax,0x5
  806b50:	0f b7 c0             	movzx  eax,ax
  806b53:	89 d6                	mov    esi,edx
  806b55:	89 c7                	mov    edi,eax
  806b57:	e8 94 e3 ff ff       	call   804ef0 <outb>
    char drv=slave_disk?0x10:0;
  806b5c:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806b60:	74 07                	je     806b69 <async_read_disk+0xc2>
  806b62:	b8 10 00 00 00       	mov    eax,0x10
  806b67:	eb 05                	jmp    806b6e <async_read_disk+0xc7>
  806b69:	b8 00 00 00 00       	mov    eax,0x0
  806b6e:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806b71:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b74:	c1 e8 18             	shr    eax,0x18
  806b77:	83 e0 0f             	and    eax,0xf
  806b7a:	89 c2                	mov    edx,eax
  806b7c:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806b80:	09 d0                	or     eax,edx
  806b82:	83 c8 e0             	or     eax,0xffffffe0
  806b85:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806b88:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806b8c:	0f b6 d0             	movzx  edx,al
  806b8f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b93:	83 c0 06             	add    eax,0x6
  806b96:	0f b7 c0             	movzx  eax,ax
  806b99:	89 d6                	mov    esi,edx
  806b9b:	89 c7                	mov    edi,eax
  806b9d:	e8 4e e3 ff ff       	call   804ef0 <outb>
    outb(port+7,DISK_CMD_READ);
  806ba2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ba6:	83 c0 07             	add    eax,0x7
  806ba9:	0f b7 c0             	movzx  eax,ax
  806bac:	be 20 00 00 00       	mov    esi,0x20
  806bb1:	89 c7                	mov    edi,eax
  806bb3:	e8 38 e3 ff ff       	call   804ef0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806bb8:	b8 00 00 00 00       	mov    eax,0x0
}
  806bbd:	c9                   	leave  
  806bbe:	c3                   	ret    

0000000000806bbf <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806bbf:	f3 0f 1e fa          	endbr64 
  806bc3:	55                   	push   rbp
  806bc4:	48 89 e5             	mov    rbp,rsp
  806bc7:	48 83 ec 30          	sub    rsp,0x30
  806bcb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806bce:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806bd1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806bd4:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806bd8:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806bde:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806be5:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806be9:	74 06                	je     806bf1 <async_write_disk+0x32>
  806beb:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bef:	75 06                	jne    806bf7 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806bf1:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806bf7:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bfb:	74 06                	je     806c03 <async_write_disk+0x44>
  806bfd:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806c01:	75 07                	jne    806c0a <async_write_disk+0x4b>
        slave_disk=1;
  806c03:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806c0a:	bf f7 00 00 00       	mov    edi,0xf7
  806c0f:	e8 f5 e2 ff ff       	call   804f09 <inb>
  806c14:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806c17:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806c1b:	83 e0 01             	and    eax,0x1
  806c1e:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806c21:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806c25:	74 0a                	je     806c31 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806c27:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806c2c:	e9 d5 00 00 00       	jmp    806d06 <async_write_disk+0x147>
        }
        t&=0x88;
  806c31:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806c35:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806c39:	74 02                	je     806c3d <async_write_disk+0x7e>
    {
  806c3b:	eb cd                	jmp    806c0a <async_write_disk+0x4b>
        if(t==0x8)break;
  806c3d:	90                   	nop
    }
    outb(port+2,sec_n);
  806c3e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806c41:	0f b6 d0             	movzx  edx,al
  806c44:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c48:	83 c0 02             	add    eax,0x2
  806c4b:	0f b7 c0             	movzx  eax,ax
  806c4e:	89 d6                	mov    esi,edx
  806c50:	89 c7                	mov    edi,eax
  806c52:	e8 99 e2 ff ff       	call   804ef0 <outb>
    outb(port+3,lba&0xff);
  806c57:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c5a:	0f b6 d0             	movzx  edx,al
  806c5d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c61:	83 c0 03             	add    eax,0x3
  806c64:	0f b7 c0             	movzx  eax,ax
  806c67:	89 d6                	mov    esi,edx
  806c69:	89 c7                	mov    edi,eax
  806c6b:	e8 80 e2 ff ff       	call   804ef0 <outb>
    outb(port+4,(lba>>8)&0xff);
  806c70:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c73:	c1 e8 08             	shr    eax,0x8
  806c76:	0f b6 d0             	movzx  edx,al
  806c79:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c7d:	83 c0 04             	add    eax,0x4
  806c80:	0f b7 c0             	movzx  eax,ax
  806c83:	89 d6                	mov    esi,edx
  806c85:	89 c7                	mov    edi,eax
  806c87:	e8 64 e2 ff ff       	call   804ef0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806c8c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c8f:	c1 e8 10             	shr    eax,0x10
  806c92:	0f b6 d0             	movzx  edx,al
  806c95:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c99:	83 c0 05             	add    eax,0x5
  806c9c:	0f b7 c0             	movzx  eax,ax
  806c9f:	89 d6                	mov    esi,edx
  806ca1:	89 c7                	mov    edi,eax
  806ca3:	e8 48 e2 ff ff       	call   804ef0 <outb>
    char drv=slave_disk?0x10:0;
  806ca8:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806cac:	74 07                	je     806cb5 <async_write_disk+0xf6>
  806cae:	b8 10 00 00 00       	mov    eax,0x10
  806cb3:	eb 05                	jmp    806cba <async_write_disk+0xfb>
  806cb5:	b8 00 00 00 00       	mov    eax,0x0
  806cba:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806cbd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806cc0:	c1 e8 18             	shr    eax,0x18
  806cc3:	83 e0 0f             	and    eax,0xf
  806cc6:	89 c2                	mov    edx,eax
  806cc8:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806ccc:	09 d0                	or     eax,edx
  806cce:	83 c8 e0             	or     eax,0xffffffe0
  806cd1:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806cd4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806cd8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806cdc:	83 c0 06             	add    eax,0x6
  806cdf:	0f b7 c0             	movzx  eax,ax
  806ce2:	89 d6                	mov    esi,edx
  806ce4:	89 c7                	mov    edi,eax
  806ce6:	e8 05 e2 ff ff       	call   804ef0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806ceb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806cef:	83 c0 07             	add    eax,0x7
  806cf2:	0f b7 c0             	movzx  eax,ax
  806cf5:	be 30 00 00 00       	mov    esi,0x30
  806cfa:	89 c7                	mov    edi,eax
  806cfc:	e8 ef e1 ff ff       	call   804ef0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806d01:	b8 00 00 00 00       	mov    eax,0x0
}
  806d06:	c9                   	leave  
  806d07:	c3                   	ret    

0000000000806d08 <read_disk>:
int read_disk(driver_args* args)
{
  806d08:	f3 0f 1e fa          	endbr64 
  806d0c:	55                   	push   rbp
  806d0d:	48 89 e5             	mov    rbp,rsp
  806d10:	48 83 ec 20          	sub    rsp,0x20
  806d14:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806d18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d1c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d1f:	48 98                	cdqe   
  806d21:	48 89 c2             	mov    rdx,rax
  806d24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d28:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d2f:	8b 00                	mov    eax,DWORD PTR [rax]
  806d31:	89 ce                	mov    esi,ecx
  806d33:	89 c7                	mov    edi,eax
  806d35:	e8 92 05 00 00       	call   8072cc <read_disk_asm>
  806d3a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806d3d:	48 8b 05 7c 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2377c]        # 42a4c0 <running_req>
  806d44:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806d4b:	48 8b 05 6e 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2376e]        # 42a4c0 <running_req>
  806d52:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806d56:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806d5d:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806d60:	48 c7 05 55 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23755],0x0        # 42a4c0 <running_req>
  806d67:	00 00 00 00 
    return ret;
  806d6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806d6e:	c9                   	leave  
  806d6f:	c3                   	ret    

0000000000806d70 <write_disk>:
int write_disk(driver_args* args)
{
  806d70:	f3 0f 1e fa          	endbr64 
  806d74:	55                   	push   rbp
  806d75:	48 89 e5             	mov    rbp,rsp
  806d78:	48 83 ec 20          	sub    rsp,0x20
  806d7c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  806d80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d84:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d87:	48 98                	cdqe   
  806d89:	48 89 c2             	mov    rdx,rax
  806d8c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d90:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d93:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d97:	8b 00                	mov    eax,DWORD PTR [rax]
  806d99:	89 ce                	mov    esi,ecx
  806d9b:	89 c7                	mov    edi,eax
  806d9d:	e8 aa 05 00 00       	call   80734c <write_disk_asm>
  806da2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806da5:	48 8b 05 14 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23714]        # 42a4c0 <running_req>
  806dac:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806db3:	48 8b 05 06 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23706]        # 42a4c0 <running_req>
  806dba:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806dbe:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806dc5:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806dc8:	48 c7 05 ed 36 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc236ed],0x0        # 42a4c0 <running_req>
  806dcf:	00 00 00 00 
    return ret;
  806dd3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806dd6:	c9                   	leave  
  806dd7:	c3                   	ret    

0000000000806dd8 <chk_result>:
int chk_result(int r)
{
  806dd8:	f3 0f 1e fa          	endbr64 
  806ddc:	55                   	push   rbp
  806ddd:	48 89 e5             	mov    rbp,rsp
  806de0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806de3:	90                   	nop
  806de4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806de7:	48 63 d0             	movsxd rdx,eax
  806dea:	48 89 d0             	mov    rax,rdx
  806ded:	48 01 c0             	add    rax,rax
  806df0:	48 01 d0             	add    rax,rdx
  806df3:	48 c1 e0 04          	shl    rax,0x4
  806df7:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806dfd:	8b 00                	mov    eax,DWORD PTR [rax]
  806dff:	83 f8 03             	cmp    eax,0x3
  806e02:	75 e0                	jne    806de4 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806e04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e07:	48 63 d0             	movsxd rdx,eax
  806e0a:	48 89 d0             	mov    rax,rdx
  806e0d:	48 01 c0             	add    rax,rax
  806e10:	48 01 d0             	add    rax,rdx
  806e13:	48 c1 e0 04          	shl    rax,0x4
  806e17:	48 05 e0 77 42 00    	add    rax,0x4277e0
  806e1d:	8b 00                	mov    eax,DWORD PTR [rax]
  806e1f:	83 f8 01             	cmp    eax,0x1
  806e22:	0f 94 c0             	sete   al
  806e25:	0f b6 c0             	movzx  eax,al
}
  806e28:	5d                   	pop    rbp
  806e29:	c3                   	ret    

0000000000806e2a <disk_existent>:
int disk_existent(int disk)
{
  806e2a:	f3 0f 1e fa          	endbr64 
  806e2e:	55                   	push   rbp
  806e2f:	48 89 e5             	mov    rbp,rsp
  806e32:	48 83 ec 10          	sub    rsp,0x10
  806e36:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806e39:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806e3d:	74 5f                	je     806e9e <disk_existent+0x74>
  806e3f:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806e43:	7f 6e                	jg     806eb3 <disk_existent+0x89>
  806e45:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806e49:	74 3e                	je     806e89 <disk_existent+0x5f>
  806e4b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806e4f:	7f 62                	jg     806eb3 <disk_existent+0x89>
  806e51:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806e55:	74 08                	je     806e5f <disk_existent+0x35>
  806e57:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806e5b:	74 17                	je     806e74 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806e5d:	eb 54                	jmp    806eb3 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806e5f:	bf 34 23 81 00       	mov    edi,0x812334
  806e64:	e8 0e c1 ff ff       	call   802f77 <sys_find_dev>
  806e69:	83 f8 ff             	cmp    eax,0xffffffff
  806e6c:	0f 95 c0             	setne  al
  806e6f:	0f b6 c0             	movzx  eax,al
  806e72:	eb 45                	jmp    806eb9 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  806e74:	bf 38 23 81 00       	mov    edi,0x812338
  806e79:	e8 f9 c0 ff ff       	call   802f77 <sys_find_dev>
  806e7e:	83 f8 ff             	cmp    eax,0xffffffff
  806e81:	0f 95 c0             	setne  al
  806e84:	0f b6 c0             	movzx  eax,al
  806e87:	eb 30                	jmp    806eb9 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  806e89:	bf 3c 23 81 00       	mov    edi,0x81233c
  806e8e:	e8 e4 c0 ff ff       	call   802f77 <sys_find_dev>
  806e93:	83 f8 ff             	cmp    eax,0xffffffff
  806e96:	0f 95 c0             	setne  al
  806e99:	0f b6 c0             	movzx  eax,al
  806e9c:	eb 1b                	jmp    806eb9 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806e9e:	bf 40 23 81 00       	mov    edi,0x812340
  806ea3:	e8 cf c0 ff ff       	call   802f77 <sys_find_dev>
  806ea8:	83 f8 ff             	cmp    eax,0xffffffff
  806eab:	0f 95 c0             	setne  al
  806eae:	0f b6 c0             	movzx  eax,al
  806eb1:	eb 06                	jmp    806eb9 <disk_existent+0x8f>
        break;
  806eb3:	90                   	nop
    }
    return 0;
  806eb4:	b8 00 00 00 00       	mov    eax,0x0
}
  806eb9:	c9                   	leave  
  806eba:	c3                   	ret    

0000000000806ebb <hd_iterate>:
int hd_iterate()
{
  806ebb:	f3 0f 1e fa          	endbr64 
  806ebf:	55                   	push   rbp
  806ec0:	48 89 e5             	mov    rbp,rsp
  806ec3:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806eca:	41 b8 00 00 00 00    	mov    r8d,0x0
  806ed0:	b9 01 00 00 00       	mov    ecx,0x1
  806ed5:	ba 00 00 00 00       	mov    edx,0x0
  806eda:	be 02 00 00 00       	mov    esi,0x2
  806edf:	bf 00 00 00 00       	mov    edi,0x0
  806ee4:	e8 3b f8 ff ff       	call   806724 <request>
  806ee9:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806eec:	41 b8 00 00 00 00    	mov    r8d,0x0
  806ef2:	b9 01 00 00 00       	mov    ecx,0x1
  806ef7:	ba 00 00 00 00       	mov    edx,0x0
  806efc:	be 02 00 00 00       	mov    esi,0x2
  806f01:	bf 01 00 00 00       	mov    edi,0x1
  806f06:	e8 19 f8 ff ff       	call   806724 <request>
  806f0b:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806f0e:	41 b8 00 00 00 00    	mov    r8d,0x0
  806f14:	b9 01 00 00 00       	mov    ecx,0x1
  806f19:	ba 00 00 00 00       	mov    edx,0x0
  806f1e:	be 02 00 00 00       	mov    esi,0x2
  806f23:	bf 02 00 00 00       	mov    edi,0x2
  806f28:	e8 f7 f7 ff ff       	call   806724 <request>
  806f2d:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806f30:	41 b8 00 00 00 00    	mov    r8d,0x0
  806f36:	b9 01 00 00 00       	mov    ecx,0x1
  806f3b:	ba 00 00 00 00       	mov    edx,0x0
  806f40:	be 02 00 00 00       	mov    esi,0x2
  806f45:	bf 03 00 00 00       	mov    edi,0x3
  806f4a:	e8 d5 f7 ff ff       	call   806724 <request>
  806f4f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806f52:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806f59:	e9 72 01 00 00       	jmp    8070d0 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806f5e:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f62:	74 3b                	je     806f9f <hd_iterate+0xe4>
  806f64:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f68:	7f 3e                	jg     806fa8 <hd_iterate+0xed>
  806f6a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f6e:	74 26                	je     806f96 <hd_iterate+0xdb>
  806f70:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f74:	7f 32                	jg     806fa8 <hd_iterate+0xed>
  806f76:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806f7a:	74 08                	je     806f84 <hd_iterate+0xc9>
  806f7c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806f80:	74 0b                	je     806f8d <hd_iterate+0xd2>
  806f82:	eb 24                	jmp    806fa8 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806f84:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806f8b:	eb 25                	jmp    806fb2 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806f8d:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806f94:	eb 1c                	jmp    806fb2 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806f96:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806f9d:	eb 13                	jmp    806fb2 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806f9f:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806fa6:	eb 0a                	jmp    806fb2 <hd_iterate+0xf7>
        default:
            return -1;
  806fa8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806fad:	e9 28 01 00 00       	jmp    8070da <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806fb2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fb5:	48 98                	cdqe   
  806fb7:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806fbb:	89 c7                	mov    edi,eax
  806fbd:	e8 16 fe ff ff       	call   806dd8 <chk_result>
  806fc2:	85 c0                	test   eax,eax
  806fc4:	0f 84 81 00 00 00    	je     80704b <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806fca:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fcd:	89 c6                	mov    esi,eax
  806fcf:	bf 44 23 81 00       	mov    edi,0x812344
  806fd4:	b8 00 00 00 00       	mov    eax,0x0
  806fd9:	e8 fb 9c ff ff       	call   800cd9 <printf>
            //新硬盘
            device hd={
  806fde:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806fe5:	b8 00 00 00 00       	mov    eax,0x0
  806fea:	b9 15 00 00 00       	mov    ecx,0x15
  806fef:	48 89 d7             	mov    rdi,rdx
  806ff2:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806ff5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806ff8:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806ffe:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  807005:	00 00 00 
  807008:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80700f:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  807012:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807016:	7f 07                	jg     80701f <hd_iterate+0x164>
  807018:	b8 f0 01 00 00       	mov    eax,0x1f0
  80701d:	eb 05                	jmp    807024 <hd_iterate+0x169>
  80701f:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  807024:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80702a:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  807031:	48 89 c7             	mov    rdi,rax
  807034:	e8 06 bb ff ff       	call   802b3f <reg_device>
  807039:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80703c:	48 63 d2             	movsxd rdx,edx
  80703f:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  807046:	e9 81 00 00 00       	jmp    8070cc <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80704b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80704e:	48 98                	cdqe   
  807050:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807054:	89 c7                	mov    edi,eax
  807056:	e8 7d fd ff ff       	call   806dd8 <chk_result>
  80705b:	85 c0                	test   eax,eax
  80705d:	75 6d                	jne    8070cc <hd_iterate+0x211>
        {
            switch (i)
  80705f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807063:	74 3e                	je     8070a3 <hd_iterate+0x1e8>
  807065:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807069:	7f 41                	jg     8070ac <hd_iterate+0x1f1>
  80706b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80706f:	74 28                	je     807099 <hd_iterate+0x1de>
  807071:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807075:	7f 35                	jg     8070ac <hd_iterate+0x1f1>
  807077:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80707b:	74 08                	je     807085 <hd_iterate+0x1ca>
  80707d:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807081:	74 0c                	je     80708f <hd_iterate+0x1d4>
  807083:	eb 27                	jmp    8070ac <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  807085:	48 c7 45 f8 34 23 81 	mov    QWORD PTR [rbp-0x8],0x812334
  80708c:	00 
  80708d:	eb 1d                	jmp    8070ac <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80708f:	48 c7 45 f8 38 23 81 	mov    QWORD PTR [rbp-0x8],0x812338
  807096:	00 
  807097:	eb 13                	jmp    8070ac <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  807099:	48 c7 45 f8 3c 23 81 	mov    QWORD PTR [rbp-0x8],0x81233c
  8070a0:	00 
  8070a1:	eb 09                	jmp    8070ac <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8070a3:	48 c7 45 f8 40 23 81 	mov    QWORD PTR [rbp-0x8],0x812340
  8070aa:	00 
  8070ab:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8070ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8070b0:	48 89 c7             	mov    rdi,rax
  8070b3:	e8 bf be ff ff       	call   802f77 <sys_find_dev>
  8070b8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8070bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8070be:	89 c7                	mov    edi,eax
  8070c0:	e8 86 c5 ff ff       	call   80364b <get_dev>
  8070c5:	89 c7                	mov    edi,eax
  8070c7:	e8 d2 c4 ff ff       	call   80359e <dispose_device>
    for(int i=0;i<4;i++)
  8070cc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8070d0:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8070d4:	0f 8e 84 fe ff ff    	jle    806f5e <hd_iterate+0xa3>
        }

    }
}
  8070da:	c9                   	leave  
  8070db:	c3                   	ret    

00000000008070dc <async_check_disk>:

int async_check_disk(int disk)
{
  8070dc:	f3 0f 1e fa          	endbr64 
  8070e0:	55                   	push   rbp
  8070e1:	48 89 e5             	mov    rbp,rsp
  8070e4:	48 83 ec 20          	sub    rsp,0x20
  8070e8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8070eb:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8070f1:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8070f7:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8070fb:	74 06                	je     807103 <async_check_disk+0x27>
  8070fd:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807101:	75 06                	jne    807109 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  807103:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  807109:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80710d:	74 06                	je     807115 <async_check_disk+0x39>
  80710f:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807113:	75 06                	jne    80711b <async_check_disk+0x3f>
        chkcmd=0xf0;
  807115:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80711b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80711f:	83 c0 02             	add    eax,0x2
  807122:	0f b7 c0             	movzx  eax,ax
  807125:	be 01 00 00 00       	mov    esi,0x1
  80712a:	89 c7                	mov    edi,eax
  80712c:	e8 bf dd ff ff       	call   804ef0 <outb>
    outb(disknr+3,0);
  807131:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807135:	83 c0 03             	add    eax,0x3
  807138:	0f b7 c0             	movzx  eax,ax
  80713b:	be 00 00 00 00       	mov    esi,0x0
  807140:	89 c7                	mov    edi,eax
  807142:	e8 a9 dd ff ff       	call   804ef0 <outb>
    outb(disknr+4,0);
  807147:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80714b:	83 c0 04             	add    eax,0x4
  80714e:	0f b7 c0             	movzx  eax,ax
  807151:	be 00 00 00 00       	mov    esi,0x0
  807156:	89 c7                	mov    edi,eax
  807158:	e8 93 dd ff ff       	call   804ef0 <outb>
    outb(disknr+5,0);
  80715d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807161:	83 c0 05             	add    eax,0x5
  807164:	0f b7 c0             	movzx  eax,ax
  807167:	be 00 00 00 00       	mov    esi,0x0
  80716c:	89 c7                	mov    edi,eax
  80716e:	e8 7d dd ff ff       	call   804ef0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  807173:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  807177:	0f b6 d0             	movzx  edx,al
  80717a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80717e:	83 c0 06             	add    eax,0x6
  807181:	0f b7 c0             	movzx  eax,ax
  807184:	89 d6                	mov    esi,edx
  807186:	89 c7                	mov    edi,eax
  807188:	e8 63 dd ff ff       	call   804ef0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80718d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807191:	83 c0 07             	add    eax,0x7
  807194:	0f b7 c0             	movzx  eax,ax
  807197:	be 90 00 00 00       	mov    esi,0x90
  80719c:	89 c7                	mov    edi,eax
  80719e:	e8 4d dd ff ff       	call   804ef0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8071a3:	b8 00 00 00 00       	mov    eax,0x0
}
  8071a8:	c9                   	leave  
  8071a9:	c3                   	ret    

00000000008071aa <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8071aa:	f3 0f 1e fa          	endbr64 
  8071ae:	55                   	push   rbp
  8071af:	48 89 e5             	mov    rbp,rsp
  8071b2:	48 83 ec 18          	sub    rsp,0x18
  8071b6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8071ba:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8071c1:	eb 04                	jmp    8071c7 <hd_do_req+0x1d>
  8071c3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8071c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071ca:	48 98                	cdqe   
  8071cc:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  8071d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071d7:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8071dd:	39 c2                	cmp    edx,eax
  8071df:	75 e2                	jne    8071c3 <hd_do_req+0x19>
    switch (args->cmd)
  8071e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071e5:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8071eb:	83 f8 04             	cmp    eax,0x4
  8071ee:	74 72                	je     807262 <hd_do_req+0xb8>
  8071f0:	83 f8 04             	cmp    eax,0x4
  8071f3:	0f 8f 96 00 00 00    	jg     80728f <hd_do_req+0xe5>
  8071f9:	83 f8 02             	cmp    eax,0x2
  8071fc:	74 0a                	je     807208 <hd_do_req+0x5e>
  8071fe:	83 f8 03             	cmp    eax,0x3
  807201:	74 32                	je     807235 <hd_do_req+0x8b>
  807203:	e9 87 00 00 00       	jmp    80728f <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  807208:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80720c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80720f:	48 98                	cdqe   
  807211:	48 89 c6             	mov    rsi,rax
  807214:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807218:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80721b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80721f:	8b 10                	mov    edx,DWORD PTR [rax]
  807221:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807224:	49 89 f0             	mov    r8,rsi
  807227:	be 00 00 00 00       	mov    esi,0x0
  80722c:	89 c7                	mov    edi,eax
  80722e:	e8 f1 f4 ff ff       	call   806724 <request>
        break;
  807233:	eb 61                	jmp    807296 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  807235:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807239:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80723c:	48 98                	cdqe   
  80723e:	48 89 c6             	mov    rsi,rax
  807241:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807245:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807248:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80724c:	8b 10                	mov    edx,DWORD PTR [rax]
  80724e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807251:	49 89 f0             	mov    r8,rsi
  807254:	be 01 00 00 00       	mov    esi,0x1
  807259:	89 c7                	mov    edi,eax
  80725b:	e8 c4 f4 ff ff       	call   806724 <request>
        break;
  807260:	eb 34                	jmp    807296 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807262:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807266:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807269:	48 98                	cdqe   
  80726b:	48 89 c6             	mov    rsi,rax
  80726e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807272:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807275:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807279:	8b 10                	mov    edx,DWORD PTR [rax]
  80727b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80727e:	49 89 f0             	mov    r8,rsi
  807281:	be 02 00 00 00       	mov    esi,0x2
  807286:	89 c7                	mov    edi,eax
  807288:	e8 97 f4 ff ff       	call   806724 <request>
        break;
  80728d:	eb 07                	jmp    807296 <hd_do_req+0xec>
    default:return -1;
  80728f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807294:	eb 1e                	jmp    8072b4 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  807296:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80729a:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8072a1:	00 00 00 
    running_devman_req=args;
  8072a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8072a8:	48 89 05 19 32 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23219],rax        # 42a4c8 <running_devman_req>
    return 0;
  8072af:	b8 00 00 00 00       	mov    eax,0x0
  8072b4:	c9                   	leave  
  8072b5:	c3                   	ret    
  8072b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8072bd:	00 00 00 

00000000008072c0 <disk_int_handler>:
  8072c0:	e8 59 dc ff ff       	call   804f1e <eoi>
  8072c5:	e8 6b f2 ff ff       	call   806535 <disk_int_handler_c>
  8072ca:	48 cf                	iretq  

00000000008072cc <read_disk_asm>:
  8072cc:	55                   	push   rbp
  8072cd:	89 e5                	mov    ebp,esp
  8072cf:	66 ba f7 01          	mov    dx,0x1f7
  8072d3:	31 c9                	xor    ecx,ecx
  8072d5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8072da:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8072df:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8072e4:	89 c6                	mov    esi,eax
  8072e6:	66 ba f2 01          	mov    dx,0x1f2
  8072ea:	88 c8                	mov    al,cl
  8072ec:	ee                   	out    dx,al
  8072ed:	66 ba f3 01          	mov    dx,0x1f3
  8072f1:	89 f0                	mov    eax,esi
  8072f3:	ee                   	out    dx,al
  8072f4:	66 ff c2             	inc    dx
  8072f7:	c1 e8 08             	shr    eax,0x8
  8072fa:	ee                   	out    dx,al
  8072fb:	66 ff c2             	inc    dx
  8072fe:	c1 e8 08             	shr    eax,0x8
  807301:	ee                   	out    dx,al
  807302:	66 ff c2             	inc    dx
  807305:	66 c1 e8 08          	shr    ax,0x8
  807309:	24 0f                	and    al,0xf
  80730b:	0c e0                	or     al,0xe0
  80730d:	ee                   	out    dx,al
  80730e:	66 ff c2             	inc    dx
  807311:	b0 20                	mov    al,0x20
  807313:	ee                   	out    dx,al

0000000000807314 <read_disk_asm.wait>:
  807314:	90                   	nop
  807315:	ec                   	in     al,dx
  807316:	24 88                	and    al,0x88
  807318:	3c 08                	cmp    al,0x8
  80731a:	75 f8                	jne    807314 <read_disk_asm.wait>
  80731c:	66 89 d7             	mov    di,dx
  80731f:	89 c8                	mov    eax,ecx
  807321:	66 b9 00 01          	mov    cx,0x100
  807325:	66 f7 e1             	mul    cx
  807328:	89 c1                	mov    ecx,eax
  80732a:	66 ba f0 01          	mov    dx,0x1f0

000000000080732e <read_disk_asm.read>:
  80732e:	66 ed                	in     ax,dx
  807330:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807334:	83 c3 02             	add    ebx,0x2
  807337:	e2 f5                	loop   80732e <read_disk_asm.read>
  807339:	c9                   	leave  
  80733a:	b8 00 00 00 00       	mov    eax,0x0
  80733f:	c3                   	ret    

0000000000807340 <read_disk_asm.err_disk_reading>:
  807340:	66 ba f1 01          	mov    dx,0x1f1
  807344:	31 c0                	xor    eax,eax
  807346:	66 ed                	in     ax,dx
  807348:	89 ec                	mov    esp,ebp
  80734a:	5d                   	pop    rbp
  80734b:	c3                   	ret    

000000000080734c <write_disk_asm>:
  80734c:	55                   	push   rbp
  80734d:	89 e5                	mov    ebp,esp
  80734f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807354:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807359:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80735e:	50                   	push   rax
  80735f:	66 ba f2 01          	mov    dx,0x1f2
  807363:	88 c8                	mov    al,cl
  807365:	ee                   	out    dx,al
  807366:	58                   	pop    rax
  807367:	66 ba f3 01          	mov    dx,0x1f3
  80736b:	ee                   	out    dx,al
  80736c:	c1 e8 08             	shr    eax,0x8
  80736f:	66 ba f4 01          	mov    dx,0x1f4
  807373:	ee                   	out    dx,al
  807374:	c1 e8 08             	shr    eax,0x8
  807377:	66 ba f5 01          	mov    dx,0x1f5
  80737b:	ee                   	out    dx,al
  80737c:	c1 e8 08             	shr    eax,0x8
  80737f:	24 0f                	and    al,0xf
  807381:	0c e0                	or     al,0xe0
  807383:	66 ba f6 01          	mov    dx,0x1f6
  807387:	ee                   	out    dx,al
  807388:	66 ba f7 01          	mov    dx,0x1f7
  80738c:	b0 30                	mov    al,0x30
  80738e:	ee                   	out    dx,al

000000000080738f <write_disk_asm.not_ready2>:
  80738f:	90                   	nop
  807390:	ec                   	in     al,dx
  807391:	24 88                	and    al,0x88
  807393:	3c 08                	cmp    al,0x8
  807395:	75 f8                	jne    80738f <write_disk_asm.not_ready2>
  807397:	89 c8                	mov    eax,ecx
  807399:	66 b9 00 01          	mov    cx,0x100
  80739d:	66 f7 e1             	mul    cx
  8073a0:	89 c1                	mov    ecx,eax
  8073a2:	66 ba f0 01          	mov    dx,0x1f0

00000000008073a6 <write_disk_asm.go_on_write>:
  8073a6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8073aa:	66 ef                	out    dx,ax
  8073ac:	83 c3 02             	add    ebx,0x2
  8073af:	e2 f5                	loop   8073a6 <write_disk_asm.go_on_write>
  8073b1:	89 ec                	mov    esp,ebp
  8073b3:	5d                   	pop    rbp
  8073b4:	c3                   	ret    

00000000008073b5 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  8073b5:	f3 0f 1e fa          	endbr64 
  8073b9:	55                   	push   rbp
  8073ba:	48 89 e5             	mov    rbp,rsp
  8073bd:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  8073c4:	bf 00 24 81 00       	mov    edi,0x812400
  8073c9:	e8 71 b7 ff ff       	call   802b3f <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  8073ce:	bf 60 23 81 00       	mov    edi,0x812360
  8073d3:	e8 4f ba ff ff       	call   802e27 <reg_driver>
  8073d8:	89 05 86 b3 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2b386],eax        # 432764 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  8073de:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8073e5:	48 89 c7             	mov    rdi,rax
  8073e8:	e8 26 00 00 00       	call   807413 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  8073ed:	8b 0d 71 b3 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2b371]        # 432764 <fat16_drvi>
  8073f3:	8b 05 d7 30 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc230d7]        # 42a4d0 <disk_drvi>
  8073f9:	ba a8 24 81 00       	mov    edx,0x8124a8
  8073fe:	89 ce                	mov    esi,ecx
  807400:	89 c7                	mov    edi,eax
  807402:	b8 00 00 00 00       	mov    eax,0x0
  807407:	e8 bb a6 ff ff       	call   801ac7 <reg_vol>
    return 0;
  80740c:	b8 00 00 00 00       	mov    eax,0x0
}
  807411:	c9                   	leave  
  807412:	c3                   	ret    

0000000000807413 <load>:
int load(driver_args *args)
{
  807413:	f3 0f 1e fa          	endbr64 
  807417:	55                   	push   rbp
  807418:	48 89 e5             	mov    rbp,rsp
  80741b:	48 83 ec 20          	sub    rsp,0x20
  80741f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  807423:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  80742a:	ba 01 00 00 00       	mov    edx,0x1
  80742f:	be 00 00 00 00       	mov    esi,0x0
  807434:	bf 00 a5 42 00       	mov    edi,0x42a500
  807439:	e8 61 0b 00 00       	call   807f9f <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  80743e:	0f b7 05 d1 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230d1]        # 42a516 <superblock+0x16>
  807445:	0f b7 d0             	movzx  edx,ax
  807448:	0f b7 05 bf 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230bf]        # 42a50e <superblock+0xe>
  80744f:	0f b7 c0             	movzx  eax,ax
  807452:	89 c6                	mov    esi,eax
  807454:	bf 60 e7 42 00       	mov    edi,0x42e760
  807459:	e8 41 0b 00 00       	call   807f9f <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80745e:	0f b7 05 a9 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230a9]        # 42a50e <superblock+0xe>
  807465:	0f b7 c8             	movzx  ecx,ax
  807468:	0f b7 05 a7 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230a7]        # 42a516 <superblock+0x16>
  80746f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  807472:	0f b6 05 97 30 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc23097]        # 42a510 <superblock+0x10>
  807479:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80747c:	0f af c2             	imul   eax,edx
  80747f:	01 c8                	add    eax,ecx
  807481:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  807484:	0f b7 05 86 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23086]        # 42a511 <superblock+0x11>
  80748b:	0f b7 c0             	movzx  eax,ax
  80748e:	48 c1 e0 05          	shl    rax,0x5
  807492:	0f b7 15 72 30 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc23072]        # 42a50b <superblock+0xb>
  807499:	0f b7 ca             	movzx  ecx,dx
  80749c:	ba 00 00 00 00       	mov    edx,0x0
  8074a1:	48 f7 f1             	div    rcx
  8074a4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  8074a7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8074aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074ad:	89 c6                	mov    esi,eax
  8074af:	bf 40 a5 42 00       	mov    edi,0x42a540
  8074b4:	e8 e6 0a 00 00       	call   807f9f <read_sec>

    cur_dir.fistCluNum=0;
  8074b9:	66 c7 05 98 70 c2 ff 	mov    WORD PTR [rip+0xffffffffffc27098],0x0        # 42e55a <cur_dir+0x1a>
  8074c0:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  8074c2:	0f b7 05 45 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23045]        # 42a50e <superblock+0xe>
  8074c9:	0f b7 c0             	movzx  eax,ax
  8074cc:	83 c0 3e             	add    eax,0x3e
  8074cf:	89 05 6b 31 00 00    	mov    DWORD PTR [rip+0x316b],eax        # 80a640 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  8074d5:	c7 05 81 b2 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2b281],0x0        # 432760 <dir_depth>
  8074dc:	00 00 00 
    return 0;
  8074df:	b8 00 00 00 00       	mov    eax,0x0

}
  8074e4:	c9                   	leave  
  8074e5:	c3                   	ret    

00000000008074e6 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  8074e6:	f3 0f 1e fa          	endbr64 
  8074ea:	55                   	push   rbp
  8074eb:	48 89 e5             	mov    rbp,rsp
  8074ee:	48 83 ec 70          	sub    rsp,0x70
  8074f2:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  8074f6:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  8074fd:	66 67 68 
  807500:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  807507:	6e 6f 70 
  80750a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80750e:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  807512:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  807519:	76 77 78 
  80751c:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  807523:	44 45 46 
  807526:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  80752a:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80752e:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  807535:	4c 4d 4e 
  807538:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  80753f:	54 55 56 
  807542:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  807546:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80754a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  807551:	31 32 33 
  807554:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  80755b:	39 2c 2f 
  80755e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807562:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807566:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80756d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  807573:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807577:	48 89 c7             	mov    rdi,rax
  80757a:	e8 24 28 00 00       	call   809da3 <strlen>
  80757f:	83 f8 0b             	cmp    eax,0xb
  807582:	7f 10                	jg     807594 <verify_name+0xae>
  807584:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807588:	48 89 c7             	mov    rdi,rax
  80758b:	e8 13 28 00 00       	call   809da3 <strlen>
  807590:	85 c0                	test   eax,eax
  807592:	75 0a                	jne    80759e <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  807594:	b8 00 00 00 00       	mov    eax,0x0
  807599:	e9 b3 01 00 00       	jmp    807751 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  80759e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8075a5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8075ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8075b3:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  8075ba:	eb 6b                	jmp    807627 <verify_name+0x141>
    {
        int j=0;
  8075bc:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  8075c3:	eb 22                	jmp    8075e7 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  8075c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075c8:	48 63 d0             	movsxd rdx,eax
  8075cb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075cf:	48 01 d0             	add    rax,rdx
  8075d2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8075d5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075d8:	48 98                	cdqe   
  8075da:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8075df:	38 c2                	cmp    dl,al
  8075e1:	74 0e                	je     8075f1 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  8075e3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8075e7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075ea:	83 f8 45             	cmp    eax,0x45
  8075ed:	76 d6                	jbe    8075c5 <verify_name+0xdf>
  8075ef:	eb 01                	jmp    8075f2 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  8075f1:	90                   	nop
        if(j>=sizeof(valid_ch))
  8075f2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075f5:	83 f8 45             	cmp    eax,0x45
  8075f8:	76 0a                	jbe    807604 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  8075fa:	b8 00 00 00 00       	mov    eax,0x0
  8075ff:	e9 4d 01 00 00       	jmp    807751 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807604:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807607:	48 63 d0             	movsxd rdx,eax
  80760a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80760e:	48 01 d0             	add    rax,rdx
  807611:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807614:	3c 20                	cmp    al,0x20
  807616:	74 07                	je     80761f <verify_name+0x139>
  807618:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  80761f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  807623:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807627:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80762a:	48 63 d0             	movsxd rdx,eax
  80762d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807631:	48 01 d0             	add    rax,rdx
  807634:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807637:	3c 2e                	cmp    al,0x2e
  807639:	74 18                	je     807653 <verify_name+0x16d>
  80763b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80763e:	48 63 d0             	movsxd rdx,eax
  807641:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807645:	48 01 d0             	add    rax,rdx
  807648:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80764b:	84 c0                	test   al,al
  80764d:	0f 85 69 ff ff ff    	jne    8075bc <verify_name+0xd6>
    }
    if(c>8||flag==0){
  807653:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  807657:	7f 06                	jg     80765f <verify_name+0x179>
  807659:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80765d:	75 0a                	jne    807669 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  80765f:	b8 00 00 00 00       	mov    eax,0x0
  807664:	e9 e8 00 00 00       	jmp    807751 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807669:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80766c:	48 63 d0             	movsxd rdx,eax
  80766f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807673:	48 01 d0             	add    rax,rdx
  807676:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807679:	84 c0                	test   al,al
  80767b:	75 0a                	jne    807687 <verify_name+0x1a1>
        return 1;
  80767d:	b8 01 00 00 00       	mov    eax,0x1
  807682:	e9 ca 00 00 00       	jmp    807751 <verify_name+0x26b>
    c=0;
  807687:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  80768e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  807695:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807699:	e9 83 00 00 00       	jmp    807721 <verify_name+0x23b>
    {
        int j=0;
  80769e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  8076a5:	eb 22                	jmp    8076c9 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  8076a7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076aa:	48 63 d0             	movsxd rdx,eax
  8076ad:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076b1:	48 01 d0             	add    rax,rdx
  8076b4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8076b7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076ba:	48 98                	cdqe   
  8076bc:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8076c1:	38 c2                	cmp    dl,al
  8076c3:	74 0e                	je     8076d3 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  8076c5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8076c9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076cc:	83 f8 45             	cmp    eax,0x45
  8076cf:	76 d6                	jbe    8076a7 <verify_name+0x1c1>
  8076d1:	eb 01                	jmp    8076d4 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  8076d3:	90                   	nop
        if(j>=sizeof(valid_ch)){
  8076d4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076d7:	83 f8 45             	cmp    eax,0x45
  8076da:	76 07                	jbe    8076e3 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  8076dc:	b8 00 00 00 00       	mov    eax,0x0
  8076e1:	eb 6e                	jmp    807751 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8076e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076e6:	48 63 d0             	movsxd rdx,eax
  8076e9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076ed:	48 01 d0             	add    rax,rdx
  8076f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076f3:	3c 20                	cmp    al,0x20
  8076f5:	74 07                	je     8076fe <verify_name+0x218>
  8076f7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  8076fe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807701:	48 63 d0             	movsxd rdx,eax
  807704:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807708:	48 01 d0             	add    rax,rdx
  80770b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80770e:	3c 2e                	cmp    al,0x2e
  807710:	75 07                	jne    807719 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  807712:	b8 00 00 00 00       	mov    eax,0x0
  807717:	eb 38                	jmp    807751 <verify_name+0x26b>
        }
        c++;
  807719:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  80771d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807721:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807724:	48 63 d0             	movsxd rdx,eax
  807727:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80772b:	48 01 d0             	add    rax,rdx
  80772e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807731:	84 c0                	test   al,al
  807733:	0f 85 65 ff ff ff    	jne    80769e <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807739:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80773d:	7f 06                	jg     807745 <verify_name+0x25f>
  80773f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807743:	75 07                	jne    80774c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807745:	b8 00 00 00 00       	mov    eax,0x0
  80774a:	eb 05                	jmp    807751 <verify_name+0x26b>
    }
    return 1;
  80774c:	b8 01 00 00 00       	mov    eax,0x1
}
  807751:	c9                   	leave  
  807752:	c3                   	ret    

0000000000807753 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807753:	f3 0f 1e fa          	endbr64 
  807757:	55                   	push   rbp
  807758:	48 89 e5             	mov    rbp,rsp
  80775b:	48 83 ec 30          	sub    rsp,0x30
  80775f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807763:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80776a:	20 20 20 
  80776d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807771:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807778:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80777f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  807786:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80778d:	e9 9b 00 00 00       	jmp    80782d <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  807792:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807795:	48 63 d0             	movsxd rdx,eax
  807798:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80779c:	48 01 d0             	add    rax,rdx
  80779f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077a2:	3c 60                	cmp    al,0x60
  8077a4:	7e 3e                	jle    8077e4 <format_name+0x91>
  8077a6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077a9:	48 63 d0             	movsxd rdx,eax
  8077ac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077b0:	48 01 d0             	add    rax,rdx
  8077b3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077b6:	3c 7a                	cmp    al,0x7a
  8077b8:	7f 2a                	jg     8077e4 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  8077ba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077bd:	48 63 d0             	movsxd rdx,eax
  8077c0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077c4:	48 01 d0             	add    rax,rdx
  8077c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077ca:	8d 48 e0             	lea    ecx,[rax-0x20]
  8077cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077d0:	8d 50 01             	lea    edx,[rax+0x1]
  8077d3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8077d6:	89 ca                	mov    edx,ecx
  8077d8:	48 98                	cdqe   
  8077da:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8077de:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077e2:	eb 45                	jmp    807829 <format_name+0xd6>
        }
        else if(str[i]=='.')
  8077e4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077e7:	48 63 d0             	movsxd rdx,eax
  8077ea:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077ee:	48 01 d0             	add    rax,rdx
  8077f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077f4:	3c 2e                	cmp    al,0x2e
  8077f6:	75 0d                	jne    807805 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  8077f8:	b8 08 00 00 00       	mov    eax,0x8
  8077fd:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  807800:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807803:	eb 24                	jmp    807829 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807805:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807808:	48 63 d0             	movsxd rdx,eax
  80780b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80780f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807813:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807816:	8d 50 01             	lea    edx,[rax+0x1]
  807819:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80781c:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  80781f:	48 98                	cdqe   
  807821:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807825:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807829:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80782d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807830:	48 63 d0             	movsxd rdx,eax
  807833:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807837:	48 01 d0             	add    rax,rdx
  80783a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80783d:	84 c0                	test   al,al
  80783f:	0f 85 4d ff ff ff    	jne    807792 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807845:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807849:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80784d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807851:	48 89 d6             	mov    rsi,rdx
  807854:	48 89 c7             	mov    rdi,rax
  807857:	e8 28 23 00 00       	call   809b84 <strcpy>
}
  80785c:	90                   	nop
  80785d:	c9                   	leave  
  80785e:	c3                   	ret    

000000000080785f <req_cluster>:
int req_cluster()
{
  80785f:	f3 0f 1e fa          	endbr64 
  807863:	55                   	push   rbp
  807864:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807867:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80786e:	eb 2a                	jmp    80789a <req_cluster+0x3b>
    {
        if(fat[i]==0)
  807870:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807873:	48 98                	cdqe   
  807875:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80787c:	00 
  80787d:	66 85 c0             	test   ax,ax
  807880:	75 14                	jne    807896 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  807882:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807885:	48 98                	cdqe   
  807887:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0xffff
  80788e:	00 ff ff 
            return i;
  807891:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807894:	eb 13                	jmp    8078a9 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807896:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80789a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80789d:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8078a2:	76 cc                	jbe    807870 <req_cluster+0x11>
        }
    }
    return -1;
  8078a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8078a9:	5d                   	pop    rbp
  8078aa:	c3                   	ret    

00000000008078ab <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8078ab:	f3 0f 1e fa          	endbr64 
  8078af:	55                   	push   rbp
  8078b0:	48 89 e5             	mov    rbp,rsp
  8078b3:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  8078ba:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8078c1:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8078c7:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8078cd:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  8078d4:	b8 00 00 00 00       	mov    eax,0x0
  8078d9:	b9 18 00 00 00       	mov    ecx,0x18
  8078de:	48 89 d7             	mov    rdi,rdx
  8078e1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8078e4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8078eb:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  8078f1:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8078f7:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  8078fd:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807903:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  807909:	48 8b 15 a8 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2ca8]        # 80a5b8 <drv_disk+0x18>
  807910:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807917:	48 89 c7             	mov    rdi,rax
  80791a:	ff d2                	call   rdx
}
  80791c:	c9                   	leave  
  80791d:	c3                   	ret    

000000000080791e <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  80791e:	f3 0f 1e fa          	endbr64 
  807922:	55                   	push   rbp
  807923:	48 89 e5             	mov    rbp,rsp
  807926:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80792a:	89 f0                	mov    eax,esi
  80792c:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80792f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807933:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807937:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80793a:	89 c2                	mov    edx,eax
  80793c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807940:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807943:	90                   	nop
  807944:	5d                   	pop    rbp
  807945:	c3                   	ret    

0000000000807946 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807946:	f3 0f 1e fa          	endbr64 
  80794a:	55                   	push   rbp
  80794b:	48 89 e5             	mov    rbp,rsp
  80794e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807952:	0f b7 05 b5 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22bb5]        # 42a50e <superblock+0xe>
  807959:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80795c:	0f b7 05 b3 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22bb3]        # 42a516 <superblock+0x16>
  807963:	0f b7 d0             	movzx  edx,ax
  807966:	0f b6 05 a3 2b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22ba3]        # 42a510 <superblock+0x10>
  80796d:	0f b6 c0             	movzx  eax,al
  807970:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807973:	01 c8                	add    eax,ecx
  807975:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807978:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80797b:	ba 00 40 00 00       	mov    edx,0x4000
  807980:	89 c6                	mov    esi,eax
  807982:	bf 40 a5 42 00       	mov    edi,0x42a540
  807987:	e8 1f ff ff ff       	call   8078ab <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80798c:	0f b7 05 7b 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22b7b]        # 42a50e <superblock+0xe>
  807993:	0f b7 c0             	movzx  eax,ax
  807996:	ba 00 40 00 00       	mov    edx,0x4000
  80799b:	89 c6                	mov    esi,eax
  80799d:	bf 60 e7 42 00       	mov    edi,0x42e760
  8079a2:	e8 04 ff ff ff       	call   8078ab <write_sec>
    //printf("updated fat\n");

}
  8079a7:	90                   	nop
  8079a8:	c9                   	leave  
  8079a9:	c3                   	ret    

00000000008079aa <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8079aa:	f3 0f 1e fa          	endbr64 
  8079ae:	55                   	push   rbp
  8079af:	48 89 e5             	mov    rbp,rsp
  8079b2:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  8079b6:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8079ba:	0f b7 c0             	movzx  eax,ax
  8079bd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8079c0:	0f b6 05 46 2b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22b46]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8079c7:	0f b6 c0             	movzx  eax,al
  8079ca:	8b 0d 70 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c70]        # 80a640 <clu_sec_balance>
  8079d0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8079d3:	01 d1                	add    ecx,edx
  8079d5:	89 c2                	mov    edx,eax
  8079d7:	89 ce                	mov    esi,ecx
  8079d9:	bf 60 e5 42 00       	mov    edi,0x42e560
  8079de:	e8 bc 05 00 00       	call   807f9f <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  8079e3:	be aa 24 81 00       	mov    esi,0x8124aa
  8079e8:	bf 60 e5 42 00       	mov    edi,0x42e560
  8079ed:	e8 92 21 00 00       	call   809b84 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  8079f2:	be b3 24 81 00       	mov    esi,0x8124b3
  8079f7:	bf 68 e5 42 00       	mov    edi,0x42e568
  8079fc:	e8 83 21 00 00       	call   809b84 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807a01:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807a05:	66 89 05 6e 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26b6e],ax        # 42e57a <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  807a0c:	c7 05 66 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26b66],0x0        # 42e57c <a_clu_of_dir+0x1c>
  807a13:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807a16:	be 10 00 00 00       	mov    esi,0x10
  807a1b:	bf 60 e5 42 00       	mov    edi,0x42e560
  807a20:	e8 f9 fe ff ff       	call   80791e <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807a25:	be b7 24 81 00       	mov    esi,0x8124b7
  807a2a:	bf 80 e5 42 00       	mov    edi,0x42e580
  807a2f:	e8 50 21 00 00       	call   809b84 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807a34:	be b3 24 81 00       	mov    esi,0x8124b3
  807a39:	bf 88 e5 42 00       	mov    edi,0x42e588
  807a3e:	e8 41 21 00 00       	call   809b84 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807a43:	0f b7 05 10 6b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26b10]        # 42e55a <cur_dir+0x1a>
  807a4a:	66 89 05 49 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26b49],ax        # 42e59a <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807a51:	c7 05 41 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26b41],0x0        # 42e59c <a_clu_of_dir+0x3c>
  807a58:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  807a5b:	be 10 00 00 00       	mov    esi,0x10
  807a60:	bf 80 e5 42 00       	mov    edi,0x42e580
  807a65:	e8 b4 fe ff ff       	call   80791e <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  807a6a:	8b 15 d0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bd0]        # 80a640 <clu_sec_balance>
  807a70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a73:	01 d0                	add    eax,edx
  807a75:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807a78:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a7b:	ba 00 02 00 00       	mov    edx,0x200
  807a80:	89 c6                	mov    esi,eax
  807a82:	bf 60 e5 42 00       	mov    edi,0x42e560
  807a87:	e8 1f fe ff ff       	call   8078ab <write_sec>
    //no need to update fat and root
}
  807a8c:	90                   	nop
  807a8d:	c9                   	leave  
  807a8e:	c3                   	ret    

0000000000807a8f <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  807a8f:	f3 0f 1e fa          	endbr64 
  807a93:	55                   	push   rbp
  807a94:	48 89 e5             	mov    rbp,rsp
  807a97:	89 f8                	mov    eax,edi
  807a99:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807a9d:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  807aa0:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807aa4:	83 e0 01             	and    eax,0x1
  807aa7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  807aaa:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807aae:	74 0b                	je     807abb <translate_attr+0x2c>
        attr_s[1]='-';
  807ab0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ab4:	48 83 c0 01          	add    rax,0x1
  807ab8:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  807abb:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807abf:	83 e0 02             	and    eax,0x2
  807ac2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807ac5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807ac9:	74 0b                	je     807ad6 <translate_attr+0x47>
        attr_s[2]='h';
  807acb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807acf:	48 83 c0 02          	add    rax,0x2
  807ad3:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807ad6:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807ada:	83 e0 04             	and    eax,0x4
  807add:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807ae0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807ae4:	74 0b                	je     807af1 <translate_attr+0x62>
        attr_s[4]='s';
  807ae6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807aea:	48 83 c0 04          	add    rax,0x4
  807aee:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807af1:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807af5:	83 e0 08             	and    eax,0x8
  807af8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  807afb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807aff:	74 0b                	je     807b0c <translate_attr+0x7d>
        attr_s[3]='v';
  807b01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b05:	48 83 c0 03          	add    rax,0x3
  807b09:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  807b0c:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807b10:	83 e0 10             	and    eax,0x10
  807b13:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807b16:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807b1a:	74 0b                	je     807b27 <translate_attr+0x98>
        attr_s[3]='d';
  807b1c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b20:	48 83 c0 03          	add    rax,0x3
  807b24:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807b27:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b2b:	48 83 c0 05          	add    rax,0x5
  807b2f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807b32:	90                   	nop
  807b33:	5d                   	pop    rbp
  807b34:	c3                   	ret    

0000000000807b35 <extend_cluster>:
int extend_cluster(short cluster)
{
  807b35:	f3 0f 1e fa          	endbr64 
  807b39:	55                   	push   rbp
  807b3a:	48 89 e5             	mov    rbp,rsp
  807b3d:	48 83 ec 18          	sub    rsp,0x18
  807b41:	89 f8                	mov    eax,edi
  807b43:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807b47:	b8 00 00 00 00       	mov    eax,0x0
  807b4c:	e8 0e fd ff ff       	call   80785f <req_cluster>
  807b51:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807b54:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807b58:	75 07                	jne    807b61 <extend_cluster+0x2c>
        return -1;
  807b5a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b5f:	eb 16                	jmp    807b77 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807b61:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807b65:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807b68:	48 98                	cdqe   
  807b6a:	66 89 94 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],dx
  807b71:	00 
    return 0;
  807b72:	b8 00 00 00 00       	mov    eax,0x0
}
  807b77:	c9                   	leave  
  807b78:	c3                   	ret    

0000000000807b79 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807b79:	f3 0f 1e fa          	endbr64 
  807b7d:	55                   	push   rbp
  807b7e:	48 89 e5             	mov    rbp,rsp
  807b81:	48 83 ec 60          	sub    rsp,0x60
  807b85:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  807b89:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b8d:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807b91:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807b95:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b99:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807b9c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  807ba0:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  807ba7:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  807bae:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807baf:	0f b6 05 57 29 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22957]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807bb6:	0f b6 c0             	movzx  eax,al
  807bb9:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  807bbd:	0f b7 ca             	movzx  ecx,dx
  807bc0:	8b 15 7a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a7a]        # 80a640 <clu_sec_balance>
  807bc6:	01 d1                	add    ecx,edx
  807bc8:	89 c2                	mov    edx,eax
  807bca:	89 ce                	mov    esi,ecx
  807bcc:	bf 60 e5 42 00       	mov    edi,0x42e560
  807bd1:	e8 c9 03 00 00       	call   807f9f <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807bd6:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  807bda:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  807bde:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807be5:	e9 2e 01 00 00       	jmp    807d18 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807bea:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807bed:	48 98                	cdqe   
  807bef:	48 c1 e0 05          	shl    rax,0x5
  807bf3:	48 89 c2             	mov    rdx,rax
  807bf6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bfa:	48 01 d0             	add    rax,rdx
  807bfd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c00:	3c e5                	cmp    al,0xe5
  807c02:	74 1e                	je     807c22 <touch+0xa9>
            dir_table[i].name[0]==0)
  807c04:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c07:	48 98                	cdqe   
  807c09:	48 c1 e0 05          	shl    rax,0x5
  807c0d:	48 89 c2             	mov    rdx,rax
  807c10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c14:	48 01 d0             	add    rax,rdx
  807c17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807c1a:	84 c0                	test   al,al
  807c1c:	0f 85 f2 00 00 00    	jne    807d14 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807c22:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c26:	48 89 c7             	mov    rdi,rax
  807c29:	e8 25 fb ff ff       	call   807753 <format_name>
                memcpy(dir_table[i].name,name,11);
  807c2e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c31:	48 98                	cdqe   
  807c33:	48 c1 e0 05          	shl    rax,0x5
  807c37:	48 89 c2             	mov    rdx,rax
  807c3a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c3e:	48 01 d0             	add    rax,rdx
  807c41:	48 89 c1             	mov    rcx,rax
  807c44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c48:	ba 0b 00 00 00       	mov    edx,0xb
  807c4d:	48 89 c6             	mov    rsi,rax
  807c50:	48 89 cf             	mov    rdi,rcx
  807c53:	e8 2e 1e 00 00       	call   809a86 <memcpy>
                int clu=req_cluster();
  807c58:	b8 00 00 00 00       	mov    eax,0x0
  807c5d:	e8 fd fb ff ff       	call   80785f <req_cluster>
  807c62:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807c65:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807c69:	75 0a                	jne    807c75 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  807c6b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c70:	e9 fc 00 00 00       	jmp    807d71 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807c75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c78:	48 98                	cdqe   
  807c7a:	48 c1 e0 05          	shl    rax,0x5
  807c7e:	48 89 c2             	mov    rdx,rax
  807c81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c85:	48 01 d0             	add    rax,rdx
  807c88:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  807c8b:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  807c8f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c92:	48 98                	cdqe   
  807c94:	48 c1 e0 05          	shl    rax,0x5
  807c98:	48 89 c2             	mov    rdx,rax
  807c9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c9f:	48 01 d0             	add    rax,rdx
  807ca2:	be 20 00 00 00       	mov    esi,0x20
  807ca7:	48 89 c7             	mov    rdi,rax
  807caa:	e8 6f fc ff ff       	call   80791e <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  807caf:	0f b7 05 55 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22855]        # 42a50b <superblock+0xb>
  807cb6:	0f b7 d0             	movzx  edx,ax
  807cb9:	0f b6 05 4d 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2284d]        # 42a50d <superblock+0xd>
  807cc0:	0f b6 c0             	movzx  eax,al
  807cc3:	0f af d0             	imul   edx,eax
  807cc6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807cc9:	48 98                	cdqe   
  807ccb:	48 c1 e0 05          	shl    rax,0x5
  807ccf:	48 89 c1             	mov    rcx,rax
  807cd2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807cd6:	48 01 c8             	add    rax,rcx
  807cd9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  807cdc:	0f b7 05 28 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22828]        # 42a50b <superblock+0xb>
  807ce3:	0f b7 d0             	movzx  edx,ax
  807ce6:	0f b6 05 20 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22820]        # 42a50d <superblock+0xd>
  807ced:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807cf0:	0f af d0             	imul   edx,eax
  807cf3:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807cf7:	8b 05 43 29 00 00    	mov    eax,DWORD PTR [rip+0x2943]        # 80a640 <clu_sec_balance>
  807cfd:	01 c1                	add    ecx,eax
  807cff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d03:	89 ce                	mov    esi,ecx
  807d05:	48 89 c7             	mov    rdi,rax
  807d08:	e8 9e fb ff ff       	call   8078ab <write_sec>
                return -1;
  807d0d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807d12:	eb 5d                	jmp    807d71 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807d14:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807d18:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807d1b:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  807d1e:	0f 8c c6 fe ff ff    	jl     807bea <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807d24:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807d29:	77 36                	ja     807d61 <touch+0x1e8>
        {
            cluster=fat[cluster];
  807d2b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807d2f:	48 98                	cdqe   
  807d31:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807d38:	00 
  807d39:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807d3d:	0f b6 05 c9 27 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc227c9]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807d44:	0f b6 d0             	movzx  edx,al
  807d47:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d4b:	8b 05 ef 28 00 00    	mov    eax,DWORD PTR [rip+0x28ef]        # 80a640 <clu_sec_balance>
  807d51:	01 c1                	add    ecx,eax
  807d53:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d57:	89 ce                	mov    esi,ecx
  807d59:	48 89 c7             	mov    rdi,rax
  807d5c:	e8 3e 02 00 00       	call   807f9f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807d61:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807d66:	0f 86 72 fe ff ff    	jbe    807bde <touch+0x65>
    return 0;
  807d6c:	b8 00 00 00 00       	mov    eax,0x0
}
  807d71:	c9                   	leave  
  807d72:	c3                   	ret    

0000000000807d73 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807d73:	f3 0f 1e fa          	endbr64 
  807d77:	55                   	push   rbp
  807d78:	48 89 e5             	mov    rbp,rsp
  807d7b:	48 83 ec 50          	sub    rsp,0x50
  807d7f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807d83:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d87:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807d8b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807d8f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d93:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807d96:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  807d9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d9e:	48 89 c7             	mov    rdi,rax
  807da1:	e8 ad f9 ff ff       	call   807753 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  807da6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807daa:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807dae:	0f b6 05 58 27 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22758]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807db5:	0f b6 c0             	movzx  eax,al
  807db8:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807dbc:	8b 15 7e 28 00 00    	mov    edx,DWORD PTR [rip+0x287e]        # 80a640 <clu_sec_balance>
  807dc2:	01 d1                	add    ecx,edx
  807dc4:	89 c2                	mov    edx,eax
  807dc6:	89 ce                	mov    esi,ecx
  807dc8:	bf 60 e5 42 00       	mov    edi,0x42e560
  807dcd:	e8 cd 01 00 00       	call   807f9f <read_sec>
        for (int i = 0; i < 16; i++)
  807dd2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807dd9:	e9 8c 01 00 00       	jmp    807f6a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  807dde:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807de1:	48 98                	cdqe   
  807de3:	48 c1 e0 05          	shl    rax,0x5
  807de7:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807ded:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807df0:	66 85 c0             	test   ax,ax
  807df3:	74 30                	je     807e25 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807df5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807df8:	48 98                	cdqe   
  807dfa:	48 c1 e0 05          	shl    rax,0x5
  807dfe:	48 05 40 a5 42 00    	add    rax,0x42a540
  807e04:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807e07:	3c e5                	cmp    al,0xe5
  807e09:	74 1a                	je     807e25 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  807e0b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e0e:	48 98                	cdqe   
  807e10:	48 c1 e0 05          	shl    rax,0x5
  807e14:	48 05 40 a5 42 00    	add    rax,0x42a540
  807e1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807e1d:	84 c0                	test   al,al
  807e1f:	0f 85 41 01 00 00    	jne    807f66 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807e25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e28:	48 98                	cdqe   
  807e2a:	48 c1 e0 05          	shl    rax,0x5
  807e2e:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e34:	ba 20 00 00 00       	mov    edx,0x20
  807e39:	be 00 00 00 00       	mov    esi,0x0
  807e3e:	48 89 c7             	mov    rdi,rax
  807e41:	e8 ef 1c 00 00       	call   809b35 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807e46:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e49:	48 98                	cdqe   
  807e4b:	48 c1 e0 05          	shl    rax,0x5
  807e4f:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e55:	ba 0b 00 00 00       	mov    edx,0xb
  807e5a:	be 20 00 00 00       	mov    esi,0x20
  807e5f:	48 89 c7             	mov    rdi,rax
  807e62:	e8 ce 1c 00 00       	call   809b35 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807e67:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e6a:	48 98                	cdqe   
  807e6c:	48 c1 e0 05          	shl    rax,0x5
  807e70:	48 8d 90 60 e5 42 00 	lea    rdx,[rax+0x42e560]
  807e77:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e7b:	48 89 c6             	mov    rsi,rax
  807e7e:	48 89 d7             	mov    rdi,rdx
  807e81:	e8 fe 1c 00 00       	call   809b84 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807e86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e8a:	48 89 c7             	mov    rdi,rax
  807e8d:	e8 11 1f 00 00       	call   809da3 <strlen>
  807e92:	48 63 d0             	movsxd rdx,eax
  807e95:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e98:	48 98                	cdqe   
  807e9a:	48 c1 e0 05          	shl    rax,0x5
  807e9e:	48 01 d0             	add    rax,rdx
  807ea1:	48 05 60 e5 42 00    	add    rax,0x42e560
  807ea7:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  807eaa:	b8 00 00 00 00       	mov    eax,0x0
  807eaf:	e8 ab f9 ff ff       	call   80785f <req_cluster>
  807eb4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807eb7:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  807ebb:	75 0a                	jne    807ec7 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  807ebd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ec2:	e9 d6 00 00 00       	jmp    807f9d <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807ec7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807eca:	89 c2                	mov    edx,eax
  807ecc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ecf:	48 98                	cdqe   
  807ed1:	48 c1 e0 05          	shl    rax,0x5
  807ed5:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807edb:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  807ede:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ee1:	48 98                	cdqe   
  807ee3:	48 c1 e0 05          	shl    rax,0x5
  807ee7:	48 05 60 e5 42 00    	add    rax,0x42e560
  807eed:	be 10 00 00 00       	mov    esi,0x10
  807ef2:	48 89 c7             	mov    rdi,rax
  807ef5:	e8 24 fa ff ff       	call   80791e <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807efa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807efd:	48 98                	cdqe   
  807eff:	48 c1 e0 05          	shl    rax,0x5
  807f03:	48 05 7c e5 42 00    	add    rax,0x42e57c
  807f09:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807f0f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807f12:	48 98                	cdqe   
  807f14:	48 c1 e0 05          	shl    rax,0x5
  807f18:	48 05 60 e5 42 00    	add    rax,0x42e560
  807f1e:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807f21:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807f24:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807f27:	ff 30                	push   QWORD PTR [rax]
  807f29:	e8 7c fa ff ff       	call   8079aa <add_dot_and_ddot_dir>
  807f2e:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807f32:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807f36:	8b 05 04 27 00 00    	mov    eax,DWORD PTR [rip+0x2704]        # 80a640 <clu_sec_balance>
  807f3c:	01 d0                	add    eax,edx
  807f3e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807f41:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f44:	ba 00 02 00 00       	mov    edx,0x200
  807f49:	89 c6                	mov    esi,eax
  807f4b:	bf 60 e5 42 00       	mov    edi,0x42e560
  807f50:	e8 56 f9 ff ff       	call   8078ab <write_sec>
                update_fat_and_root();
  807f55:	b8 00 00 00 00       	mov    eax,0x0
  807f5a:	e8 e7 f9 ff ff       	call   807946 <update_fat_and_root>
                return 0;
  807f5f:	b8 00 00 00 00       	mov    eax,0x0
  807f64:	eb 37                	jmp    807f9d <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807f66:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807f6a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807f6e:	0f 8e 6a fe ff ff    	jle    807dde <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807f74:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f79:	77 12                	ja     807f8d <mkdir+0x21a>
            cluster=fat[cluster];
  807f7b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f7f:	48 98                	cdqe   
  807f81:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807f88:	00 
  807f89:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807f8d:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f92:	0f 86 16 fe ff ff    	jbe    807dae <mkdir+0x3b>
    return -1;
  807f98:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807f9d:	c9                   	leave  
  807f9e:	c3                   	ret    

0000000000807f9f <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807f9f:	f3 0f 1e fa          	endbr64 
  807fa3:	55                   	push   rbp
  807fa4:	48 89 e5             	mov    rbp,rsp
  807fa7:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807fae:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807fb5:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807fbb:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807fc1:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807fc8:	b8 00 00 00 00       	mov    eax,0x0
  807fcd:	b9 18 00 00 00       	mov    ecx,0x18
  807fd2:	48 89 d7             	mov    rdi,rdx
  807fd5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807fd8:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807fde:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807fe4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807feb:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807ff1:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807ff8:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807ffb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808002:	eb 3e                	jmp    808042 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  808004:	48 8b 15 ad 25 00 00 	mov    rdx,QWORD PTR [rip+0x25ad]        # 80a5b8 <drv_disk+0x18>
  80800b:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808012:	48 89 c7             	mov    rdi,rax
  808015:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  808017:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  80801d:	0f b7 05 e7 24 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc224e7]        # 42a50b <superblock+0xb>
  808024:	0f b7 c0             	movzx  eax,ax
  808027:	01 d0                	add    eax,edx
  808029:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  80802f:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  808035:	83 c0 01             	add    eax,0x1
  808038:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  80803e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808042:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808045:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80804b:	7c b7                	jl     808004 <read_sec+0x65>
    }
    return 0;
  80804d:	b8 00 00 00 00       	mov    eax,0x0
}
  808052:	c9                   	leave  
  808053:	c3                   	ret    

0000000000808054 <rm>:

int rm(driver_args* args)
{
  808054:	f3 0f 1e fa          	endbr64 
  808058:	55                   	push   rbp
  808059:	48 89 e5             	mov    rbp,rsp
  80805c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  808063:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  80806a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808071:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808075:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  808079:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  808080:	b8 00 00 00 00       	mov    eax,0x0
  808085:	b9 18 00 00 00       	mov    ecx,0x18
  80808a:	48 89 d7             	mov    rdi,rdx
  80808d:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  808090:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808097:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  80809e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  8080a5:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  8080ac:	48 89 c7             	mov    rdi,rax
  8080af:	e8 07 0a 00 00       	call   808abb <get_entry>
  8080b4:	83 f8 ff             	cmp    eax,0xffffffff
  8080b7:	75 0a                	jne    8080c3 <rm+0x6f>
  8080b9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8080be:	e9 a8 01 00 00       	jmp    80826b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  8080c3:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8080c9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  8080cd:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  8080d4:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  8080d5:	0f b6 05 31 24 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22431]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8080dc:	0f b6 c0             	movzx  eax,al
  8080df:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  8080e3:	0f b7 ca             	movzx  ecx,dx
  8080e6:	8b 15 54 25 00 00    	mov    edx,DWORD PTR [rip+0x2554]        # 80a640 <clu_sec_balance>
  8080ec:	01 d1                	add    ecx,edx
  8080ee:	89 c2                	mov    edx,eax
  8080f0:	89 ce                	mov    esi,ecx
  8080f2:	bf 60 e5 42 00       	mov    edi,0x42e560
  8080f7:	e8 a3 fe ff ff       	call   807f9f <read_sec>
    dir_table=a_clu_of_dir;
  8080fc:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  808103:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  808104:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808108:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  80810c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  808113:	e9 89 00 00 00       	jmp    8081a1 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808118:	0f b6 05 ee 23 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc223ee]        # 42a50d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  80811f:	0f b6 d0             	movzx  edx,al
  808122:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  808126:	8b 05 14 25 00 00    	mov    eax,DWORD PTR [rip+0x2514]        # 80a640 <clu_sec_balance>
  80812c:	01 c1                	add    ecx,eax
  80812e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808132:	89 ce                	mov    esi,ecx
  808134:	48 89 c7             	mov    rdi,rax
  808137:	e8 63 fe ff ff       	call   807f9f <read_sec>
        for(;i<16;i++)
  80813c:	eb 44                	jmp    808182 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  80813e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808141:	48 98                	cdqe   
  808143:	48 c1 e0 05          	shl    rax,0x5
  808147:	48 89 c2             	mov    rdx,rax
  80814a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80814e:	48 01 d0             	add    rax,rdx
  808151:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  808155:	0f b7 d0             	movzx  edx,ax
  808158:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80815f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808162:	39 c2                	cmp    edx,eax
  808164:	75 18                	jne    80817e <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  808166:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808169:	48 98                	cdqe   
  80816b:	48 c1 e0 05          	shl    rax,0x5
  80816f:	48 89 c2             	mov    rdx,rax
  808172:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808176:	48 01 d0             	add    rax,rdx
  808179:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  80817c:	eb 2f                	jmp    8081ad <rm+0x159>
        for(;i<16;i++)
  80817e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808182:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  808186:	7e b6                	jle    80813e <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  808188:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80818d:	77 12                	ja     8081a1 <rm+0x14d>
        {
            cluster=fat[cluster];
  80818f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808193:	48 98                	cdqe   
  808195:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80819c:	00 
  80819d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  8081a1:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8081a6:	0f 86 6c ff ff ff    	jbe    808118 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  8081ac:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  8081ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8081b0:	48 98                	cdqe   
  8081b2:	48 c1 e0 05          	shl    rax,0x5
  8081b6:	48 89 c2             	mov    rdx,rax
  8081b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8081bd:	48 01 d0             	add    rax,rdx
  8081c0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8081c4:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  8081c8:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  8081cd:	77 10                	ja     8081df <rm+0x18b>
  8081cf:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081d3:	48 98                	cdqe   
  8081d5:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8081dc:	00 
  8081dd:	eb 05                	jmp    8081e4 <rm+0x190>
  8081df:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8081e4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  8081e8:	eb 2a                	jmp    808214 <rm+0x1c0>
    {
        fat[del_clu]=0;
  8081ea:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081ee:	48 98                	cdqe   
  8081f0:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  8081f7:	00 00 00 
        del_clu=pion;
  8081fa:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  8081fe:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  808202:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  808206:	48 98                	cdqe   
  808208:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80820f:	00 
  808210:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  808214:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  808219:	76 cf                	jbe    8081ea <rm+0x196>
    }
    fat[del_clu]=0;
  80821b:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  80821f:	48 98                	cdqe   
  808221:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  808228:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  80822b:	0f b6 05 db 22 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc222db]        # 42a50d <superblock+0xd>
  808232:	0f b6 d0             	movzx  edx,al
  808235:	0f b7 05 cf 22 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc222cf]        # 42a50b <superblock+0xb>
  80823c:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  80823f:	0f af d0             	imul   edx,eax
  808242:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  808246:	8b 05 f4 23 00 00    	mov    eax,DWORD PTR [rip+0x23f4]        # 80a640 <clu_sec_balance>
  80824c:	01 c1                	add    ecx,eax
  80824e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808252:	89 ce                	mov    esi,ecx
  808254:	48 89 c7             	mov    rdi,rax
  808257:	e8 4f f6 ff ff       	call   8078ab <write_sec>
    update_fat_and_root();
  80825c:	b8 00 00 00 00       	mov    eax,0x0
  808261:	e8 e0 f6 ff ff       	call   807946 <update_fat_and_root>
    return 0;
  808266:	b8 00 00 00 00       	mov    eax,0x0
}
  80826b:	c9                   	leave  
  80826c:	c3                   	ret    

000000000080826d <find>:
int find_f=0;
int find(char *name)
{
  80826d:	f3 0f 1e fa          	endbr64 
  808271:	55                   	push   rbp
  808272:	48 89 e5             	mov    rbp,rsp
  808275:	48 83 ec 30          	sub    rsp,0x30
  808279:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  80827d:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  808284:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  80828b:	48 c7 45 f0 60 e5 42 	mov    QWORD PTR [rbp-0x10],0x42e560
  808292:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808293:	0f b7 05 c0 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc262c0]        # 42e55a <cur_dir+0x1a>
  80829a:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  80829e:	0f b7 05 b5 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc262b5]        # 42e55a <cur_dir+0x1a>
  8082a5:	66 85 c0             	test   ax,ax
  8082a8:	75 0a                	jne    8082b4 <find+0x47>
        dir_table=root_dir;
  8082aa:	48 c7 45 f0 40 a5 42 	mov    QWORD PTR [rbp-0x10],0x42a540
  8082b1:	00 
  8082b2:	eb 2b                	jmp    8082df <find+0x72>
    else {
        max_files=16;
  8082b4:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  8082bb:	0f b6 05 4b 22 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2224b]        # 42a50d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  8082c2:	0f b6 d0             	movzx  edx,al
  8082c5:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  8082c9:	8b 05 71 23 00 00    	mov    eax,DWORD PTR [rip+0x2371]        # 80a640 <clu_sec_balance>
  8082cf:	01 c1                	add    ecx,eax
  8082d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082d5:	89 ce                	mov    esi,ecx
  8082d7:	48 89 c7             	mov    rdi,rax
  8082da:	e8 c0 fc ff ff       	call   807f9f <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  8082df:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8082e6:	eb 57                	jmp    80833f <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  8082e8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082eb:	48 98                	cdqe   
  8082ed:	48 c1 e0 05          	shl    rax,0x5
  8082f1:	48 89 c2             	mov    rdx,rax
  8082f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082f8:	48 01 d0             	add    rax,rdx
  8082fb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8082fe:	84 c0                	test   al,al
  808300:	74 38                	je     80833a <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  808302:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808305:	48 98                	cdqe   
  808307:	48 c1 e0 05          	shl    rax,0x5
  80830b:	48 89 c2             	mov    rdx,rax
  80830e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808312:	48 01 d0             	add    rax,rdx
  808315:	48 89 c1             	mov    rcx,rax
  808318:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80831c:	ba 0b 00 00 00       	mov    edx,0xb
  808321:	48 89 c6             	mov    rsi,rax
  808324:	48 89 cf             	mov    rdi,rcx
  808327:	e8 a4 17 00 00       	call   809ad0 <memcmp>
  80832c:	85 c0                	test   eax,eax
  80832e:	75 0b                	jne    80833b <find+0xce>
            {
                return index+i;
  808330:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  808333:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808336:	01 d0                	add    eax,edx
  808338:	eb 71                	jmp    8083ab <find+0x13e>
                continue;
  80833a:	90                   	nop
        for(int i=0;i<max_files;i++)
  80833b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80833f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808342:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  808345:	7c a1                	jl     8082e8 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  808347:	0f b7 05 0c 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2620c]        # 42e55a <cur_dir+0x1a>
  80834e:	66 85 c0             	test   ax,ax
  808351:	75 07                	jne    80835a <find+0xed>
            return -1;
  808353:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808358:	eb 51                	jmp    8083ab <find+0x13e>
        else if(cluster<FAT_EOF)
  80835a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  80835f:	77 3a                	ja     80839b <find+0x12e>
        {
            index+=16;
  808361:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  808365:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  808369:	48 98                	cdqe   
  80836b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808372:	00 
  808373:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808377:	0f b6 05 8f 21 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2218f]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80837e:	0f b6 d0             	movzx  edx,al
  808381:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  808385:	8b 05 b5 22 00 00    	mov    eax,DWORD PTR [rip+0x22b5]        # 80a640 <clu_sec_balance>
  80838b:	01 c1                	add    ecx,eax
  80838d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808391:	89 ce                	mov    esi,ecx
  808393:	48 89 c7             	mov    rdi,rax
  808396:	e8 04 fc ff ff       	call   807f9f <read_sec>
        }
    }while(cluster<FAT_EOF);
  80839b:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  8083a0:	0f 86 39 ff ff ff    	jbe    8082df <find+0x72>
    return -1;
  8083a6:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  8083ab:	c9                   	leave  
  8083ac:	c3                   	ret    

00000000008083ad <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  8083ad:	f3 0f 1e fa          	endbr64 
  8083b1:	55                   	push   rbp
  8083b2:	48 89 e5             	mov    rbp,rsp
  8083b5:	41 57                	push   r15
  8083b7:	41 56                	push   r14
  8083b9:	41 55                	push   r13
  8083bb:	41 54                	push   r12
  8083bd:	53                   	push   rbx
  8083be:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8083c5:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8083cc:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  8083d3:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  8083d9:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  8083df:	48 89 e0             	mov    rax,rsp
  8083e2:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  8083e5:	bf 00 00 00 00       	mov    edi,0x0
  8083ea:	e8 7e fe ff ff       	call   80826d <find>
  8083ef:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  8083f2:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8083f6:	74 09                	je     808401 <read_file_byname+0x54>
  8083f8:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8083ff:	79 0a                	jns    80840b <read_file_byname+0x5e>
        return -1;
  808401:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808406:	e9 ea 02 00 00       	jmp    8086f5 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  80840b:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  808412:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  808419:	00 
    int in_root=1;
  80841a:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  808421:	0f b7 05 32 61 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26132]        # 42e55a <cur_dir+0x1a>
  808428:	66 85 c0             	test   ax,ax
  80842b:	74 40                	je     80846d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  80842d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  808434:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  80843b:	0f b6 05 cb 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc220cb]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  808442:	0f b6 c0             	movzx  eax,al
  808445:	0f b7 15 0e 61 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2610e]        # 42e55a <cur_dir+0x1a>
  80844c:	0f b7 ca             	movzx  ecx,dx
  80844f:	8b 15 eb 21 00 00    	mov    edx,DWORD PTR [rip+0x21eb]        # 80a640 <clu_sec_balance>
  808455:	01 d1                	add    ecx,edx
  808457:	89 c2                	mov    edx,eax
  808459:	89 ce                	mov    esi,ecx
  80845b:	bf 60 e5 42 00       	mov    edi,0x42e560
  808460:	e8 3a fb ff ff       	call   807f9f <read_sec>
        dir_table=a_clu_of_dir;
  808465:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  80846c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  80846d:	0f b7 05 e6 60 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc260e6]        # 42e55a <cur_dir+0x1a>
  808474:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808478:	eb 41                	jmp    8084bb <read_file_byname+0x10e>
        index-=16;
  80847a:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  80847e:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808483:	77 36                	ja     8084bb <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  808485:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808489:	48 98                	cdqe   
  80848b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808492:	00 
  808493:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808497:	0f b6 05 6f 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2206f]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80849e:	0f b6 d0             	movzx  edx,al
  8084a1:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8084a5:	8b 05 95 21 00 00    	mov    eax,DWORD PTR [rip+0x2195]        # 80a640 <clu_sec_balance>
  8084ab:	01 c1                	add    ecx,eax
  8084ad:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8084b1:	89 ce                	mov    esi,ecx
  8084b3:	48 89 c7             	mov    rdi,rax
  8084b6:	e8 e4 fa ff ff       	call   807f9f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8084bb:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8084bf:	75 0d                	jne    8084ce <read_file_byname+0x121>
  8084c1:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8084c5:	7e 07                	jle    8084ce <read_file_byname+0x121>
  8084c7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8084cc:	76 ac                	jbe    80847a <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  8084ce:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8084d1:	48 98                	cdqe   
  8084d3:	48 c1 e0 05          	shl    rax,0x5
  8084d7:	48 89 c2             	mov    rdx,rax
  8084da:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8084de:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8084e2:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8084e5:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8084e9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  8084f0:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8084f7:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8084fb:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8084ff:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  808503:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808507:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  80850b:	0f b7 c0             	movzx  eax,ax
  80850e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  808511:	0f b7 05 f3 1f c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ff3]        # 42a50b <superblock+0xb>
  808518:	0f b7 d0             	movzx  edx,ax
  80851b:	0f b6 05 eb 1f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21feb]        # 42a50d <superblock+0xd>
  808522:	0f b6 c0             	movzx  eax,al
  808525:	0f af c2             	imul   eax,edx
  808528:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80852b:	eb 25                	jmp    808552 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  80852d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808530:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  808536:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808539:	48 98                	cdqe   
  80853b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808542:	00 
  808543:	98                   	cwde   
  808544:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  808547:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80854d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808550:	7c 0d                	jl     80855f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808552:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808558:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80855b:	7d d0                	jge    80852d <read_file_byname+0x180>
  80855d:	eb 01                	jmp    808560 <read_file_byname+0x1b3>
            break;
  80855f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808560:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808567:	7e 15                	jle    80857e <read_file_byname+0x1d1>
  808569:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80856f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808572:	7c 0a                	jl     80857e <read_file_byname+0x1d1>
        return -1;//pos out of range
  808574:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808579:	e9 77 01 00 00       	jmp    8086f5 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  80857e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808581:	48 63 d0             	movsxd rdx,eax
  808584:	48 83 ea 01          	sub    rdx,0x1
  808588:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  80858c:	48 63 d0             	movsxd rdx,eax
  80858f:	49 89 d6             	mov    r14,rdx
  808592:	41 bf 00 00 00 00    	mov    r15d,0x0
  808598:	48 63 d0             	movsxd rdx,eax
  80859b:	49 89 d4             	mov    r12,rdx
  80859e:	41 bd 00 00 00 00    	mov    r13d,0x0
  8085a4:	48 98                	cdqe   
  8085a6:	ba 10 00 00 00       	mov    edx,0x10
  8085ab:	48 83 ea 01          	sub    rdx,0x1
  8085af:	48 01 d0             	add    rax,rdx
  8085b2:	be 10 00 00 00       	mov    esi,0x10
  8085b7:	ba 00 00 00 00       	mov    edx,0x0
  8085bc:	48 f7 f6             	div    rsi
  8085bf:	48 6b c0 10          	imul   rax,rax,0x10
  8085c3:	48 89 c1             	mov    rcx,rax
  8085c6:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8085cd:	48 89 e2             	mov    rdx,rsp
  8085d0:	48 29 ca             	sub    rdx,rcx
  8085d3:	48 39 d4             	cmp    rsp,rdx
  8085d6:	74 12                	je     8085ea <read_file_byname+0x23d>
  8085d8:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  8085df:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  8085e6:	00 00 
  8085e8:	eb e9                	jmp    8085d3 <read_file_byname+0x226>
  8085ea:	48 89 c2             	mov    rdx,rax
  8085ed:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8085f3:	48 29 d4             	sub    rsp,rdx
  8085f6:	48 89 c2             	mov    rdx,rax
  8085f9:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8085ff:	48 85 d2             	test   rdx,rdx
  808602:	74 10                	je     808614 <read_file_byname+0x267>
  808604:	25 ff 0f 00 00       	and    eax,0xfff
  808609:	48 83 e8 08          	sub    rax,0x8
  80860d:	48 01 e0             	add    rax,rsp
  808610:	48 83 08 00          	or     QWORD PTR [rax],0x0
  808614:	48 89 e0             	mov    rax,rsp
  808617:	48 83 c0 00          	add    rax,0x0
  80861b:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  80861f:	0f b6 05 e7 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ee7]        # 42a50d <superblock+0xd>
  808626:	0f b6 d0             	movzx  edx,al
  808629:	8b 0d 11 20 00 00    	mov    ecx,DWORD PTR [rip+0x2011]        # 80a640 <clu_sec_balance>
  80862f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808632:	01 c1                	add    ecx,eax
  808634:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808638:	89 ce                	mov    esi,ecx
  80863a:	48 89 c7             	mov    rdi,rax
  80863d:	e8 5d f9 ff ff       	call   807f9f <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808642:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808645:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80864b:	89 c2                	mov    edx,eax
  80864d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808653:	48 63 c8             	movsxd rcx,eax
  808656:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80865a:	48 01 c1             	add    rcx,rax
  80865d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808664:	48 89 ce             	mov    rsi,rcx
  808667:	48 89 c7             	mov    rdi,rax
  80866a:	e8 17 14 00 00       	call   809a86 <memcpy>
    dist+=cluster_size-pos;
  80866f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808672:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  808678:	48 98                	cdqe   
  80867a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  808681:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808684:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80868a:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808690:	eb 4c                	jmp    8086de <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  808692:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808695:	48 98                	cdqe   
  808697:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80869e:	00 
  80869f:	98                   	cwde   
  8086a0:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  8086a3:	0f b6 05 63 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21e63]        # 42a50d <superblock+0xd>
  8086aa:	0f b6 d0             	movzx  edx,al
  8086ad:	8b 0d 8d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f8d]        # 80a640 <clu_sec_balance>
  8086b3:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8086b6:	01 c1                	add    ecx,eax
  8086b8:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8086bf:	89 ce                	mov    esi,ecx
  8086c1:	48 89 c7             	mov    rdi,rax
  8086c4:	e8 d6 f8 ff ff       	call   807f9f <read_sec>
        dist+=cluster_size;
  8086c9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8086cc:	48 98                	cdqe   
  8086ce:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8086d5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8086d8:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  8086de:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8086e5:	7f 09                	jg     8086f0 <read_file_byname+0x343>
  8086e7:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  8086ee:	7f a2                	jg     808692 <read_file_byname+0x2e5>
    }
    return 0;
  8086f0:	b8 00 00 00 00       	mov    eax,0x0
  8086f5:	48 89 dc             	mov    rsp,rbx
    
}
  8086f8:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8086fc:	5b                   	pop    rbx
  8086fd:	41 5c                	pop    r12
  8086ff:	41 5d                	pop    r13
  808701:	41 5e                	pop    r14
  808703:	41 5f                	pop    r15
  808705:	5d                   	pop    rbp
  808706:	c3                   	ret    

0000000000808707 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  808707:	f3 0f 1e fa          	endbr64 
  80870b:	55                   	push   rbp
  80870c:	48 89 e5             	mov    rbp,rsp
  80870f:	41 57                	push   r15
  808711:	41 56                	push   r14
  808713:	41 55                	push   r13
  808715:	41 54                	push   r12
  808717:	53                   	push   rbx
  808718:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  80871f:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808726:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80872d:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808733:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808739:	48 89 e0             	mov    rax,rsp
  80873c:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80873f:	bf 00 00 00 00       	mov    edi,0x0
  808744:	e8 24 fb ff ff       	call   80826d <find>
  808749:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80874c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808750:	74 09                	je     80875b <write_file_byname+0x54>
  808752:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808759:	79 0a                	jns    808765 <write_file_byname+0x5e>
        return -1;
  80875b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808760:	e9 1e 03 00 00       	jmp    808a83 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808765:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80876c:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  808773:	00 
    int in_root=1;
  808774:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80877b:	0f b7 05 d8 5d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25dd8]        # 42e55a <cur_dir+0x1a>
  808782:	66 85 c0             	test   ax,ax
  808785:	74 40                	je     8087c7 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  808787:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  80878e:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  808795:	0f b6 05 71 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d71]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  80879c:	0f b6 c0             	movzx  eax,al
  80879f:	0f b7 15 b4 5d c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc25db4]        # 42e55a <cur_dir+0x1a>
  8087a6:	0f b7 ca             	movzx  ecx,dx
  8087a9:	8b 15 91 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e91]        # 80a640 <clu_sec_balance>
  8087af:	01 d1                	add    ecx,edx
  8087b1:	89 c2                	mov    edx,eax
  8087b3:	89 ce                	mov    esi,ecx
  8087b5:	bf 60 e5 42 00       	mov    edi,0x42e560
  8087ba:	e8 e0 f7 ff ff       	call   807f9f <read_sec>
        dir_table=a_clu_of_dir;
  8087bf:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  8087c6:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8087c7:	0f b7 05 8c 5d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25d8c]        # 42e55a <cur_dir+0x1a>
  8087ce:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8087d2:	eb 41                	jmp    808815 <write_file_byname+0x10e>
        index-=16;
  8087d4:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  8087d8:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8087dd:	77 36                	ja     808815 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  8087df:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  8087e3:	48 98                	cdqe   
  8087e5:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8087ec:	00 
  8087ed:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8087f1:	0f b6 05 15 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d15]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  8087f8:	0f b6 d0             	movzx  edx,al
  8087fb:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8087ff:	8b 05 3b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e3b]        # 80a640 <clu_sec_balance>
  808805:	01 c1                	add    ecx,eax
  808807:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80880b:	89 ce                	mov    esi,ecx
  80880d:	48 89 c7             	mov    rdi,rax
  808810:	e8 8a f7 ff ff       	call   807f9f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808815:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808819:	75 0d                	jne    808828 <write_file_byname+0x121>
  80881b:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  80881f:	7e 07                	jle    808828 <write_file_byname+0x121>
  808821:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808826:	76 ac                	jbe    8087d4 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808828:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80882b:	48 98                	cdqe   
  80882d:	48 c1 e0 05          	shl    rax,0x5
  808831:	48 89 c2             	mov    rdx,rax
  808834:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808838:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80883c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80883f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808843:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80884a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808851:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808855:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808859:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80885d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808861:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808865:	0f b7 c0             	movzx  eax,ax
  808868:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80886b:	0f b7 05 99 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21c99]        # 42a50b <superblock+0xb>
  808872:	0f b7 d0             	movzx  edx,ax
  808875:	0f b6 05 91 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21c91]        # 42a50d <superblock+0xd>
  80887c:	0f b6 c0             	movzx  eax,al
  80887f:	0f af c2             	imul   eax,edx
  808882:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808885:	eb 25                	jmp    8088ac <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  808887:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80888a:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  808890:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808896:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808899:	7c 1e                	jl     8088b9 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  80889b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80889e:	48 98                	cdqe   
  8088a0:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8088a7:	00 
  8088a8:	98                   	cwde   
  8088a9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8088ac:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8088b2:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8088b5:	7d d0                	jge    808887 <write_file_byname+0x180>
  8088b7:	eb 01                	jmp    8088ba <write_file_byname+0x1b3>
            break;
  8088b9:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  8088ba:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8088c1:	7e 15                	jle    8088d8 <write_file_byname+0x1d1>
  8088c3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8088c9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8088cc:	7c 0a                	jl     8088d8 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8088ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8088d3:	e9 ab 01 00 00       	jmp    808a83 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  8088d8:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8088db:	48 63 d0             	movsxd rdx,eax
  8088de:	48 83 ea 01          	sub    rdx,0x1
  8088e2:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  8088e6:	48 63 d0             	movsxd rdx,eax
  8088e9:	49 89 d6             	mov    r14,rdx
  8088ec:	41 bf 00 00 00 00    	mov    r15d,0x0
  8088f2:	48 63 d0             	movsxd rdx,eax
  8088f5:	49 89 d4             	mov    r12,rdx
  8088f8:	41 bd 00 00 00 00    	mov    r13d,0x0
  8088fe:	48 98                	cdqe   
  808900:	ba 10 00 00 00       	mov    edx,0x10
  808905:	48 83 ea 01          	sub    rdx,0x1
  808909:	48 01 d0             	add    rax,rdx
  80890c:	be 10 00 00 00       	mov    esi,0x10
  808911:	ba 00 00 00 00       	mov    edx,0x0
  808916:	48 f7 f6             	div    rsi
  808919:	48 6b c0 10          	imul   rax,rax,0x10
  80891d:	48 89 c1             	mov    rcx,rax
  808920:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808927:	48 89 e2             	mov    rdx,rsp
  80892a:	48 29 ca             	sub    rdx,rcx
  80892d:	48 39 d4             	cmp    rsp,rdx
  808930:	74 12                	je     808944 <write_file_byname+0x23d>
  808932:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808939:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808940:	00 00 
  808942:	eb e9                	jmp    80892d <write_file_byname+0x226>
  808944:	48 89 c2             	mov    rdx,rax
  808947:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80894d:	48 29 d4             	sub    rsp,rdx
  808950:	48 89 c2             	mov    rdx,rax
  808953:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808959:	48 85 d2             	test   rdx,rdx
  80895c:	74 10                	je     80896e <write_file_byname+0x267>
  80895e:	25 ff 0f 00 00       	and    eax,0xfff
  808963:	48 83 e8 08          	sub    rax,0x8
  808967:	48 01 e0             	add    rax,rsp
  80896a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80896e:	48 89 e0             	mov    rax,rsp
  808971:	48 83 c0 00          	add    rax,0x0
  808975:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808979:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808980:	0f 8e a2 00 00 00    	jle    808a28 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808986:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808989:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80898f:	89 c2                	mov    edx,eax
  808991:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808997:	48 63 c8             	movsxd rcx,eax
  80899a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80899e:	48 01 c1             	add    rcx,rax
  8089a1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8089a8:	48 89 c6             	mov    rsi,rax
  8089ab:	48 89 cf             	mov    rdi,rcx
  8089ae:	e8 d3 10 00 00       	call   809a86 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  8089b3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8089b6:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8089bc:	89 c2                	mov    edx,eax
  8089be:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8089c1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8089c5:	89 ce                	mov    esi,ecx
  8089c7:	48 89 c7             	mov    rdi,rax
  8089ca:	e8 dc ee ff ff       	call   8078ab <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8089cf:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089d2:	48 98                	cdqe   
  8089d4:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8089db:	00 
  8089dc:	98                   	cwde   
  8089dd:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8089e0:	eb 46                	jmp    808a28 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  8089e2:	8b 15 58 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c58]        # 80a640 <clu_sec_balance>
  8089e8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089eb:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8089ee:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8089f1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8089f8:	89 ce                	mov    esi,ecx
  8089fa:	48 89 c7             	mov    rdi,rax
  8089fd:	e8 a9 ee ff ff       	call   8078ab <write_sec>
        src+=cluster_size;
  808a02:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808a05:	48 98                	cdqe   
  808a07:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808a0e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808a11:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808a17:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808a1a:	48 98                	cdqe   
  808a1c:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808a23:	00 
  808a24:	98                   	cwde   
  808a25:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808a28:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808a2f:	7f 0b                	jg     808a3c <write_file_byname+0x335>
  808a31:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808a37:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808a3a:	7d a6                	jge    8089e2 <write_file_byname+0x2db>
    }
    if(len>0)
  808a3c:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808a43:	7e 39                	jle    808a7e <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808a45:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  808a4b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808a52:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a56:	48 89 ce             	mov    rsi,rcx
  808a59:	48 89 c7             	mov    rdi,rax
  808a5c:	e8 25 10 00 00       	call   809a86 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808a61:	8b 15 d9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bd9]        # 80a640 <clu_sec_balance>
  808a67:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808a6a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808a6d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808a70:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a74:	89 ce                	mov    esi,ecx
  808a76:	48 89 c7             	mov    rdi,rax
  808a79:	e8 2d ee ff ff       	call   8078ab <write_sec>
    }
    return 0;
  808a7e:	b8 00 00 00 00       	mov    eax,0x0
  808a83:	48 89 dc             	mov    rsp,rbx

}
  808a86:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  808a8a:	5b                   	pop    rbx
  808a8b:	41 5c                	pop    r12
  808a8d:	41 5d                	pop    r13
  808a8f:	41 5e                	pop    r14
  808a91:	41 5f                	pop    r15
  808a93:	5d                   	pop    rbp
  808a94:	c3                   	ret    

0000000000808a95 <file_exist>:


int file_exist(dir_entry entry)
{
  808a95:	f3 0f 1e fa          	endbr64 
  808a99:	55                   	push   rbp
  808a9a:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  808a9d:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  808aa1:	3c e5                	cmp    al,0xe5
  808aa3:	74 08                	je     808aad <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  808aa5:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  808aa9:	84 c0                	test   al,al
  808aab:	75 07                	jne    808ab4 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  808aad:	b8 00 00 00 00       	mov    eax,0x0
  808ab2:	eb 05                	jmp    808ab9 <file_exist+0x24>

    }
    return 1;
  808ab4:	b8 01 00 00 00       	mov    eax,0x1
}
  808ab9:	5d                   	pop    rbp
  808aba:	c3                   	ret    

0000000000808abb <get_entry>:
int get_entry(driver_args* args)
{
  808abb:	f3 0f 1e fa          	endbr64 
  808abf:	55                   	push   rbp
  808ac0:	48 89 e5             	mov    rbp,rsp
  808ac3:	53                   	push   rbx
  808ac4:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  808acb:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808ad2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808ad9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808add:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808ae1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808ae8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  808aef:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808af2:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808af6:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  808afa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808afe:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808b02:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808b09:	e9 2c 01 00 00       	jmp    808c3a <get_entry+0x17f>
    {
        if(*name=='/')
  808b0e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b15:	3c 2f                	cmp    al,0x2f
  808b17:	0f 85 18 01 00 00    	jne    808c35 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  808b1d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b21:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808b25:	48 83 f8 0b          	cmp    rax,0xb
  808b29:	7e 0a                	jle    808b35 <get_entry+0x7a>
  808b2b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b30:	e9 50 02 00 00       	jmp    808d85 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808b35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b39:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808b3d:	89 c2                	mov    edx,eax
  808b3f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808b43:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b4a:	48 89 ce             	mov    rsi,rcx
  808b4d:	48 89 c7             	mov    rdi,rax
  808b50:	e8 31 0f 00 00       	call   809a86 <memcpy>
            cur_dir=dir;
  808b55:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808b59:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808b5d:	48 89 05 dc 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259dc],rax        # 42e540 <cur_dir>
  808b64:	48 89 15 dd 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259dd],rdx        # 42e548 <cur_dir+0x8>
  808b6b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808b6f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b73:	48 89 05 d6 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259d6],rax        # 42e550 <cur_dir+0x10>
  808b7a:	48 89 15 d7 59 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc259d7],rdx        # 42e558 <cur_dir+0x18>
            format_name(nametmp);
  808b81:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b88:	48 89 c7             	mov    rdi,rax
  808b8b:	e8 c3 eb ff ff       	call   807753 <format_name>
            index= find(nametmp);
  808b90:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b97:	48 89 c7             	mov    rdi,rax
  808b9a:	e8 ce f6 ff ff       	call   80826d <find>
  808b9f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  808ba2:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808ba6:	75 0a                	jne    808bb2 <get_entry+0xf7>
  808ba8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808bad:	e9 d3 01 00 00       	jmp    808d85 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808bb2:	0f b7 05 a1 59 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc259a1]        # 42e55a <cur_dir+0x1a>
  808bb9:	66 85 c0             	test   ax,ax
  808bbc:	75 31                	jne    808bef <get_entry+0x134>
                dir=root_dir[index];
  808bbe:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808bc1:	48 98                	cdqe   
  808bc3:	48 c1 e0 05          	shl    rax,0x5
  808bc7:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808bce:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808bd1:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808bd5:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808bd9:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808bdd:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808be1:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808be5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808be9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  808bed:	eb 3a                	jmp    808c29 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  808bef:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808bf2:	99                   	cdq    
  808bf3:	c1 ea 1c             	shr    edx,0x1c
  808bf6:	01 d0                	add    eax,edx
  808bf8:	83 e0 0f             	and    eax,0xf
  808bfb:	29 d0                	sub    eax,edx
  808bfd:	48 98                	cdqe   
  808bff:	48 c1 e0 05          	shl    rax,0x5
  808c03:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808c0a:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808c0d:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808c11:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808c15:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808c19:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808c1d:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808c21:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808c25:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808c29:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c2d:	48 83 c0 01          	add    rax,0x1
  808c31:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808c35:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  808c3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c41:	84 c0                	test   al,al
  808c43:	0f 85 c5 fe ff ff    	jne    808b0e <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808c49:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808c4d:	48 89 c7             	mov    rdi,rax
  808c50:	e8 fe ea ff ff       	call   807753 <format_name>
    index= find(p);
  808c55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808c59:	48 89 c7             	mov    rdi,rax
  808c5c:	e8 0c f6 ff ff       	call   80826d <find>
  808c61:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808c64:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808c68:	75 0a                	jne    808c74 <get_entry+0x1b9>
  808c6a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808c6f:	e9 11 01 00 00       	jmp    808d85 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808c74:	0f b7 05 df 58 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc258df]        # 42e55a <cur_dir+0x1a>
  808c7b:	66 85 c0             	test   ax,ax
  808c7e:	75 31                	jne    808cb1 <get_entry+0x1f6>
        entry=root_dir[index];
  808c80:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808c83:	48 98                	cdqe   
  808c85:	48 c1 e0 05          	shl    rax,0x5
  808c89:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808c90:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808c93:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808c97:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808c9b:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808c9f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808ca3:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808ca7:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808cab:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  808caf:	eb 3a                	jmp    808ceb <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808cb1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808cb4:	99                   	cdq    
  808cb5:	c1 ea 1c             	shr    edx,0x1c
  808cb8:	01 d0                	add    eax,edx
  808cba:	83 e0 0f             	and    eax,0xf
  808cbd:	29 d0                	sub    eax,edx
  808cbf:	48 98                	cdqe   
  808cc1:	48 c1 e0 05          	shl    rax,0x5
  808cc5:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808ccc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808ccf:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808cd3:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808cd7:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808cdb:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808cdf:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808ce3:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808ce7:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  808ceb:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  808cef:	0f b7 c0             	movzx  eax,ax
  808cf2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808cf8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808cff:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808d06:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  808d0d:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808d11:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808d15:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  808d1c:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808d23:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808d27:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  808d2b:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808d32:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808d39:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  808d3d:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808d41:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808d48:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  808d4f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808d53:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808d57:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  808d5e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808d65:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808d69:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  808d6d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808d71:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808d75:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808d79:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808d80:	b8 00 00 00 00       	mov    eax,0x0
}
  808d85:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  808d89:	c9                   	leave  
  808d8a:	c3                   	ret    

0000000000808d8b <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  808d8b:	f3 0f 1e fa          	endbr64 
  808d8f:	55                   	push   rbp
  808d90:	48 89 e5             	mov    rbp,rsp
  808d93:	48 83 ec 20          	sub    rsp,0x20
  808d97:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808d9b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  808d9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808da3:	be 2f 00 00 00       	mov    esi,0x2f
  808da8:	48 89 c7             	mov    rdi,rax
  808dab:	e8 18 0e 00 00       	call   809bc8 <strtok>
  808db0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808db4:	eb 1b                	jmp    808dd1 <get_fname+0x46>
    {
        prev=ptr;
  808db6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808dba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  808dbe:	be 2f 00 00 00       	mov    esi,0x2f
  808dc3:	bf 00 00 00 00       	mov    edi,0x0
  808dc8:	e8 fb 0d 00 00       	call   809bc8 <strtok>
  808dcd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808dd1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808dd6:	75 de                	jne    808db6 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808dd8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808ddc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808de0:	48 89 d6             	mov    rsi,rdx
  808de3:	48 89 c7             	mov    rdi,rax
  808de6:	e8 99 0d 00 00       	call   809b84 <strcpy>
}
  808deb:	90                   	nop
  808dec:	c9                   	leave  
  808ded:	c3                   	ret    

0000000000808dee <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808dee:	f3 0f 1e fa          	endbr64 
  808df2:	55                   	push   rbp
  808df3:	48 89 e5             	mov    rbp,rsp
  808df6:	48 83 ec 60          	sub    rsp,0x60
  808dfa:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808dfe:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808e02:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808e05:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808e08:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808e0c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808e0f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808e12:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808e16:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808e19:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808e1d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808e21:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e24:	48 98                	cdqe   
  808e26:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808e2a:	0f b7 05 da 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216da]        # 42a50b <superblock+0xb>
  808e31:	0f b7 f0             	movzx  esi,ax
  808e34:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808e37:	99                   	cdq    
  808e38:	f7 fe                	idiv   esi
  808e3a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808e3d:	0f b7 05 c7 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216c7]        # 42a50b <superblock+0xb>
  808e44:	0f b7 c8             	movzx  ecx,ax
  808e47:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808e4a:	99                   	cdq    
  808e4b:	f7 f9                	idiv   ecx
  808e4d:	89 d0                	mov    eax,edx
  808e4f:	85 c0                	test   eax,eax
  808e51:	0f 95 c0             	setne  al
  808e54:	0f b6 c0             	movzx  eax,al
  808e57:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  808e5a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808e61:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808e65:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808e69:	0f b7 05 9b 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2169b]        # 42a50b <superblock+0xb>
  808e70:	0f b7 f8             	movzx  edi,ax
  808e73:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e76:	99                   	cdq    
  808e77:	f7 ff                	idiv   edi
  808e79:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e7c:	eb 16                	jmp    808e94 <read_file+0xa6>
    {
         clu=fat[clu];
  808e7e:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808e82:	48 98                	cdqe   
  808e84:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808e8b:	00 
  808e8c:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e90:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808e94:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808e99:	77 06                	ja     808ea1 <read_file+0xb3>
  808e9b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808e9f:	7f dd                	jg     808e7e <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808ea1:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808ea5:	7e 0a                	jle    808eb1 <read_file+0xc3>
  808ea7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808eac:	e9 cd 00 00 00       	jmp    808f7e <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808eb1:	0f b7 05 53 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21653]        # 42a50b <superblock+0xb>
  808eb8:	0f b7 c8             	movzx  ecx,ax
  808ebb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ebe:	99                   	cdq    
  808ebf:	f7 f9                	idiv   ecx
  808ec1:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808ec4:	0f b6 05 42 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21642]        # 42a50d <superblock+0xd>
  808ecb:	0f b6 d0             	movzx  edx,al
  808ece:	0f b7 05 36 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21636]        # 42a50b <superblock+0xb>
  808ed5:	0f b7 c0             	movzx  eax,ax
  808ed8:	0f af c2             	imul   eax,edx
  808edb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  808ede:	e9 89 00 00 00       	jmp    808f6c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808ee3:	0f b6 05 23 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21623]        # 42a50d <superblock+0xd>
  808eea:	0f b6 c0             	movzx  eax,al
  808eed:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808ef1:	8b 15 49 17 00 00    	mov    edx,DWORD PTR [rip+0x1749]        # 80a640 <clu_sec_balance>
  808ef7:	01 d1                	add    ecx,edx
  808ef9:	89 c2                	mov    edx,eax
  808efb:	89 ce                	mov    esi,ecx
  808efd:	bf 80 27 43 00       	mov    edi,0x432780
  808f02:	e8 98 f0 ff ff       	call   807f9f <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808f07:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808f0a:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808f0d:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808f10:	39 c2                	cmp    edx,eax
  808f12:	0f 4e c2             	cmovle eax,edx
  808f15:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808f18:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  808f1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f1e:	48 98                	cdqe   
  808f20:	48 8d 88 80 27 43 00 	lea    rcx,[rax+0x432780]
  808f27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808f2b:	48 89 ce             	mov    rsi,rcx
  808f2e:	48 89 c7             	mov    rdi,rax
  808f31:	e8 50 0b 00 00       	call   809a86 <memcpy>
        n++;
  808f36:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808f3a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808f3d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808f40:	48 98                	cdqe   
  808f42:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808f46:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808f4a:	7e 07                	jle    808f53 <read_file+0x165>
  808f4c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808f53:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808f57:	48 98                	cdqe   
  808f59:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808f60:	00 
  808f61:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808f65:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808f6a:	77 0e                	ja     808f7a <read_file+0x18c>
    while(n<c)
  808f6c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f6f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808f72:	0f 8c 6b ff ff ff    	jl     808ee3 <read_file+0xf5>
  808f78:	eb 01                	jmp    808f7b <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808f7a:	90                   	nop
    }
    return n;
  808f7b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808f7e:	c9                   	leave  
  808f7f:	c3                   	ret    

0000000000808f80 <write_file>:
int write_file(driver_args* args)
{
  808f80:	f3 0f 1e fa          	endbr64 
  808f84:	55                   	push   rbp
  808f85:	48 89 e5             	mov    rbp,rsp
  808f88:	48 83 ec 50          	sub    rsp,0x50
  808f8c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808f90:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f94:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f97:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808f9a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f9e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808fa1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808fa4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fa8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808fab:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808faf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fb3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808fb6:	48 98                	cdqe   
  808fb8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808fbc:	0f b7 05 48 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21548]        # 42a50b <superblock+0xb>
  808fc3:	0f b7 f0             	movzx  esi,ax
  808fc6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808fc9:	99                   	cdq    
  808fca:	f7 fe                	idiv   esi
  808fcc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808fcf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808fd2:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808fd8:	85 c0                	test   eax,eax
  808fda:	0f 48 c2             	cmovs  eax,edx
  808fdd:	c1 f8 09             	sar    eax,0x9
  808fe0:	89 c1                	mov    ecx,eax
  808fe2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808fe5:	99                   	cdq    
  808fe6:	c1 ea 17             	shr    edx,0x17
  808fe9:	01 d0                	add    eax,edx
  808feb:	25 ff 01 00 00       	and    eax,0x1ff
  808ff0:	29 d0                	sub    eax,edx
  808ff2:	01 c8                	add    eax,ecx
  808ff4:	85 c0                	test   eax,eax
  808ff6:	0f 95 c0             	setne  al
  808ff9:	0f b6 c0             	movzx  eax,al
  808ffc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808fff:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  809006:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80900a:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  80900e:	eb 16                	jmp    809026 <write_file+0xa6>
  809010:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809014:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  809018:	48 98                	cdqe   
  80901a:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  809021:	00 
  809022:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  809026:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80902b:	77 06                	ja     809033 <write_file+0xb3>
  80902d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809031:	7f dd                	jg     809010 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  809033:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809037:	7e 52                	jle    80908b <write_file+0x10b>
  809039:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80903e:	eb 59                	jmp    809099 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  809040:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  809044:	8b 05 f6 15 00 00    	mov    eax,DWORD PTR [rip+0x15f6]        # 80a640 <clu_sec_balance>
  80904a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80904d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809051:	ba 01 00 00 00       	mov    edx,0x1
  809056:	89 ce                	mov    esi,ecx
  809058:	48 89 c7             	mov    rdi,rax
  80905b:	e8 4b e8 ff ff       	call   8078ab <write_sec>
        n++;
  809060:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  809064:	0f b7 05 a0 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc214a0]        # 42a50b <superblock+0xb>
  80906b:	0f b7 c0             	movzx  eax,ax
  80906e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  809072:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  809076:	48 98                	cdqe   
  809078:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80907f:	00 
  809080:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  809084:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  809089:	77 0a                	ja     809095 <write_file+0x115>
    while(n<c)
  80908b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80908e:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809091:	7c ad                	jl     809040 <write_file+0xc0>
  809093:	eb 01                	jmp    809096 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  809095:	90                   	nop
    }
    return n;
  809096:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  809099:	c9                   	leave  
  80909a:	c3                   	ret    

000000000080909b <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80909b:	f3 0f 1e fa          	endbr64 
  80909f:	55                   	push   rbp
  8090a0:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  8090a3:	48 8b 05 e6 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29ae6]        # 432b90 <vpage_base>
  8090aa:	48 05 a0 00 00 00    	add    rax,0xa0
  8090b0:	48 89 05 d9 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29ad9],rax        # 432b90 <vpage_base>
    page_boffset+=SCREEN_W*2;
  8090b7:	8b 05 db 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29adb]        # 432b98 <page_boffset>
  8090bd:	05 a0 00 00 00       	add    eax,0xa0
  8090c2:	89 05 d0 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29ad0],eax        # 432b98 <page_boffset>
    if(vpage_base>=video_end)
  8090c8:	48 8b 15 c1 9a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc29ac1]        # 432b90 <vpage_base>
  8090cf:	48 8b 05 b2 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29ab2]        # 432b88 <video_end>
  8090d6:	48 39 c2             	cmp    rdx,rax
  8090d9:	72 0e                	jb     8090e9 <scrdown+0x4e>
        vpage_base=video_base;
  8090db:	48 8b 05 9e 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29a9e]        # 432b80 <video_base>
  8090e2:	48 89 05 a7 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29aa7],rax        # 432b90 <vpage_base>
    set_origin();
  8090e9:	b8 00 00 00 00       	mov    eax,0x0
  8090ee:	e8 6a 00 00 00       	call   80915d <set_origin>
}
  8090f3:	90                   	nop
  8090f4:	5d                   	pop    rbp
  8090f5:	c3                   	ret    

00000000008090f6 <scrup>:
void scrup()
{
  8090f6:	f3 0f 1e fa          	endbr64 
  8090fa:	55                   	push   rbp
  8090fb:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  8090fe:	8b 05 94 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a94]        # 432b98 <page_boffset>
  809104:	85 c0                	test   eax,eax
  809106:	75 24                	jne    80912c <scrup+0x36>
    {
        page_boffset=0;
  809108:	c7 05 86 9a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29a86],0x0        # 432b98 <page_boffset>
  80910f:	00 00 00 
        vpage_base=video_base;
  809112:	48 8b 05 67 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29a67]        # 432b80 <video_base>
  809119:	48 89 05 70 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29a70],rax        # 432b90 <vpage_base>
        set_origin();
  809120:	b8 00 00 00 00       	mov    eax,0x0
  809125:	e8 33 00 00 00       	call   80915d <set_origin>
        return;
  80912a:	eb 2f                	jmp    80915b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80912c:	48 8b 05 5d 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29a5d]        # 432b90 <vpage_base>
  809133:	48 2d a0 00 00 00    	sub    rax,0xa0
  809139:	48 89 05 50 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29a50],rax        # 432b90 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809140:	8b 05 52 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a52]        # 432b98 <page_boffset>
  809146:	2d a0 00 00 00       	sub    eax,0xa0
  80914b:	89 05 47 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29a47],eax        # 432b98 <page_boffset>
    set_origin();
  809151:	b8 00 00 00 00       	mov    eax,0x0
  809156:	e8 02 00 00 00       	call   80915d <set_origin>
}
  80915b:	5d                   	pop    rbp
  80915c:	c3                   	ret    

000000000080915d <set_origin>:
void set_origin(void)
{
  80915d:	f3 0f 1e fa          	endbr64 
  809161:	55                   	push   rbp
  809162:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809165:	fa                   	cli    
    outb(port_reg_index,12);
  809166:	8b 05 3c 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a3c]        # 432ba8 <port_reg_index>
  80916c:	0f b7 c0             	movzx  eax,ax
  80916f:	be 0c 00 00 00       	mov    esi,0xc
  809174:	89 c7                	mov    edi,eax
  809176:	e8 75 bd ff ff       	call   804ef0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80917b:	8b 05 17 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a17]        # 432b98 <page_boffset>
  809181:	c1 e8 09             	shr    eax,0x9
  809184:	0f b6 d0             	movzx  edx,al
  809187:	8b 05 1f 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a1f]        # 432bac <port_reg_v>
  80918d:	0f b7 c0             	movzx  eax,ax
  809190:	89 d6                	mov    esi,edx
  809192:	89 c7                	mov    edi,eax
  809194:	e8 57 bd ff ff       	call   804ef0 <outb>
    outb(port_reg_index,13);
  809199:	8b 05 09 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a09]        # 432ba8 <port_reg_index>
  80919f:	0f b7 c0             	movzx  eax,ax
  8091a2:	be 0d 00 00 00       	mov    esi,0xd
  8091a7:	89 c7                	mov    edi,eax
  8091a9:	e8 42 bd ff ff       	call   804ef0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  8091ae:	8b 05 e4 99 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc299e4]        # 432b98 <page_boffset>
  8091b4:	d1 e8                	shr    eax,1
  8091b6:	0f b6 d0             	movzx  edx,al
  8091b9:	8b 05 ed 99 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc299ed]        # 432bac <port_reg_v>
  8091bf:	0f b7 c0             	movzx  eax,ax
  8091c2:	89 d6                	mov    esi,edx
  8091c4:	89 c7                	mov    edi,eax
  8091c6:	e8 25 bd ff ff       	call   804ef0 <outb>
    asm volatile("sti");
  8091cb:	fb                   	sti    

}
  8091cc:	90                   	nop
  8091cd:	5d                   	pop    rbp
  8091ce:	c3                   	ret    

00000000008091cf <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  8091cf:	f3 0f 1e fa          	endbr64 
  8091d3:	55                   	push   rbp
  8091d4:	48 89 e5             	mov    rbp,rsp
  8091d7:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  8091db:	be c8 26 81 00       	mov    esi,0x8126c8
  8091e0:	bf 74 25 81 00       	mov    edi,0x812574
  8091e5:	e8 9a 09 00 00       	call   809b84 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  8091ea:	be cd 26 81 00       	mov    esi,0x8126cd
  8091ef:	bf 34 26 81 00       	mov    edi,0x812634
  8091f4:	e8 8b 09 00 00       	call   809b84 <strcpy>
    reg_driver(&drv_tty);
  8091f9:	bf c0 24 81 00       	mov    edi,0x8124c0
  8091fe:	e8 24 9c ff ff       	call   802e27 <reg_driver>
    reg_device(&dev_tty);
  809203:	bf 60 25 81 00       	mov    edi,0x812560
  809208:	e8 32 99 ff ff       	call   802b3f <reg_device>
    reg_device(&dev_stdout);
  80920d:	bf 20 26 81 00       	mov    edi,0x812620
  809212:	e8 28 99 ff ff       	call   802b3f <reg_device>
    unsigned char *vp=0x20000;
  809217:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80921e:	00 
    if(*vp==0x7)
  80921f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809223:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809226:	3c 07                	cmp    al,0x7
  809228:	75 36                	jne    809260 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80922a:	c7 05 68 99 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29968],0x0        # 432b9c <video_mode>
  809231:	00 00 00 
        video_base=0xb0000;
  809234:	48 c7 05 41 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29941],0xb0000        # 432b80 <video_base>
  80923b:	00 00 0b 00 
        video_end=0xb8000-1;
  80923f:	48 c7 05 3e 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2993e],0xb7fff        # 432b88 <video_end>
  809246:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80924a:	c7 05 54 99 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc29954],0x3b4        # 432ba8 <port_reg_index>
  809251:	03 00 00 
        port_reg_v=0x3b5;
  809254:	c7 05 4e 99 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2994e],0x3b5        # 432bac <port_reg_v>
  80925b:	03 00 00 
  80925e:	eb 61                	jmp    8092c1 <init_tty+0xf2>
    }else if(*vp<=0x3)
  809260:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809264:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809267:	3c 03                	cmp    al,0x3
  809269:	77 36                	ja     8092a1 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80926b:	c7 05 27 99 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc29927],0x1        # 432b9c <video_mode>
  809272:	00 00 00 
        video_base=0xb8000;
  809275:	48 c7 05 00 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29900],0xb8000        # 432b80 <video_base>
  80927c:	00 80 0b 00 
        video_end=0xc0000-1;
  809280:	48 c7 05 fd 98 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc298fd],0xbffff        # 432b88 <video_end>
  809287:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80928b:	c7 05 13 99 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc29913],0x3d4        # 432ba8 <port_reg_index>
  809292:	03 00 00 
        port_reg_v=0x3d5;
  809295:	c7 05 0d 99 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2990d],0x3d5        # 432bac <port_reg_v>
  80929c:	03 00 00 
  80929f:	eb 20                	jmp    8092c1 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  8092a1:	c7 05 f1 98 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc298f1],0x2        # 432b9c <video_mode>
  8092a8:	00 00 00 
        video_base=0xa0000;
  8092ab:	48 c7 05 ca 98 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc298ca],0xa0000        # 432b80 <video_base>
  8092b2:	00 00 0a 00 
        video_end=0xb0000-1;
  8092b6:	48 c7 05 c7 98 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc298c7],0xaffff        # 432b88 <video_end>
  8092bd:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  8092c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092c8:	3c 01                	cmp    al,0x1
  8092ca:	77 0f                	ja     8092db <init_tty+0x10c>
  8092cc:	c7 05 ce 98 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc298ce],0x28        # 432ba4 <line_chs>
  8092d3:	00 00 00 
  8092d6:	e9 91 00 00 00       	jmp    80936c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  8092db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092e2:	3c 03                	cmp    al,0x3
  8092e4:	76 0b                	jbe    8092f1 <init_tty+0x122>
  8092e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ed:	3c 07                	cmp    al,0x7
  8092ef:	75 0c                	jne    8092fd <init_tty+0x12e>
  8092f1:	c7 05 a9 98 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc298a9],0x50        # 432ba4 <line_chs>
  8092f8:	00 00 00 
  8092fb:	eb 6f                	jmp    80936c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  8092fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809301:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809304:	3c 05                	cmp    al,0x5
  809306:	76 16                	jbe    80931e <init_tty+0x14f>
  809308:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80930c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80930f:	3c 09                	cmp    al,0x9
  809311:	74 0b                	je     80931e <init_tty+0x14f>
  809313:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809317:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80931a:	3c 0d                	cmp    al,0xd
  80931c:	75 0c                	jne    80932a <init_tty+0x15b>
  80931e:	c7 05 7c 98 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc2987c],0x140        # 432ba4 <line_chs>
  809325:	01 00 00 
  809328:	eb 42                	jmp    80936c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80932a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80932e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809331:	3c 06                	cmp    al,0x6
  809333:	74 16                	je     80934b <init_tty+0x17c>
  809335:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809339:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80933c:	3c 0a                	cmp    al,0xa
  80933e:	74 0b                	je     80934b <init_tty+0x17c>
  809340:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809344:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809347:	3c 0d                	cmp    al,0xd
  809349:	76 0c                	jbe    809357 <init_tty+0x188>
  80934b:	c7 05 4f 98 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2984f],0x280        # 432ba4 <line_chs>
  809352:	02 00 00 
  809355:	eb 15                	jmp    80936c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  809357:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80935b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80935e:	3c 08                	cmp    al,0x8
  809360:	75 0a                	jne    80936c <init_tty+0x19d>
  809362:	c7 05 38 98 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc29838],0xa0        # 432ba4 <line_chs>
  809369:	00 00 00 
    switch (*vp)
  80936c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809370:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809373:	0f b6 c0             	movzx  eax,al
  809376:	83 f8 14             	cmp    eax,0x14
  809379:	77 61                	ja     8093dc <init_tty+0x20d>
  80937b:	89 c0                	mov    eax,eax
  80937d:	48 8b 04 c5 d8 26 81 	mov    rax,QWORD PTR [rax*8+0x8126d8]
  809384:	00 
  809385:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809388:	c7 05 1e 98 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2981e],0x3e8        # 432bb0 <vpage_size>
  80938f:	03 00 00 
  809392:	eb 49                	jmp    8093dd <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809394:	c7 05 12 98 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc29812],0x7d0        # 432bb0 <vpage_size>
  80939b:	07 00 00 
  80939e:	eb 3d                	jmp    8093dd <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  8093a0:	c7 05 06 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29806],0xfa00        # 432bb0 <vpage_size>
  8093a7:	fa 00 00 
  8093aa:	eb 31                	jmp    8093dd <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  8093ac:	c7 05 fa 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297fa],0x1f400        # 432bb0 <vpage_size>
  8093b3:	f4 01 00 
  8093b6:	eb 25                	jmp    8093dd <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  8093b8:	c7 05 ee 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297ee],0x7d00        # 432bb0 <vpage_size>
  8093bf:	7d 00 00 
  8093c2:	eb 19                	jmp    8093dd <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  8093c4:	c7 05 e2 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297e2],0x36b00        # 432bb0 <vpage_size>
  8093cb:	6b 03 00 
  8093ce:	eb 0d                	jmp    8093dd <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  8093d0:	c7 05 d6 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297d6],0x4b000        # 432bb0 <vpage_size>
  8093d7:	b0 04 00 
  8093da:	eb 01                	jmp    8093dd <init_tty+0x20e>
    default:
        break;
  8093dc:	90                   	nop
    }
    m_ptr=video_base;
  8093dd:	48 8b 05 9c 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2979c]        # 432b80 <video_base>
  8093e4:	48 89 05 5d 12 00 00 	mov    QWORD PTR [rip+0x125d],rax        # 80a648 <m_ptr>
    page_boffset=0;
  8093eb:	c7 05 a3 97 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc297a3],0x0        # 432b98 <page_boffset>
  8093f2:	00 00 00 
    vpage_base=video_base;
  8093f5:	48 8b 05 84 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29784]        # 432b80 <video_base>
  8093fc:	48 89 05 8d 97 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2978d],rax        # 432b90 <vpage_base>
    vp++;
  809403:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  809408:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80940c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80940f:	0f b6 c0             	movzx  eax,al
  809412:	89 05 88 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29788],eax        # 432ba0 <vpage>
    vp++;
  809418:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80941d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809421:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809425:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809429:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80942c:	0f b6 c0             	movzx  eax,al
  80942f:	89 05 87 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29787],eax        # 432bbc <stline>
    endline=*vp++;
  809435:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809439:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80943d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809441:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809444:	0f b6 c0             	movzx  eax,al
  809447:	89 05 73 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29773],eax        # 432bc0 <endline>
    videoy=*vp++;
  80944d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809451:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809455:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809459:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80945c:	0f b6 c0             	movzx  eax,al
  80945f:	89 05 53 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29753],eax        # 432bb8 <videoy>
    videox=*vp;
  809465:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809469:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80946c:	0f b6 c0             	movzx  eax,al
  80946f:	89 05 3f 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2973f],eax        # 432bb4 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809475:	90                   	nop
  809476:	c9                   	leave  
  809477:	c3                   	ret    

0000000000809478 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809478:	f3 0f 1e fa          	endbr64 
  80947c:	55                   	push   rbp
  80947d:	48 89 e5             	mov    rbp,rsp
  809480:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809484:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809488:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80948b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80948e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809491:	05 00 c0 05 00       	add    eax,0x5c000
  809496:	01 c0                	add    eax,eax
  809498:	48 98                	cdqe   
  80949a:	48 89 05 a7 11 00 00 	mov    QWORD PTR [rip+0x11a7],rax        # 80a648 <m_ptr>
}
  8094a1:	90                   	nop
  8094a2:	5d                   	pop    rbp
  8094a3:	c3                   	ret    

00000000008094a4 <tell_monitor>:
int tell_monitor()
{
  8094a4:	f3 0f 1e fa          	endbr64 
  8094a8:	55                   	push   rbp
  8094a9:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  8094ac:	48 8b 05 95 11 00 00 	mov    rax,QWORD PTR [rip+0x1195]        # 80a648 <m_ptr>
  8094b3:	48 8b 15 c6 96 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc296c6]        # 432b80 <video_base>
  8094ba:	48 29 d0             	sub    rax,rdx
  8094bd:	48 89 c2             	mov    rdx,rax
  8094c0:	48 c1 ea 3f          	shr    rdx,0x3f
  8094c4:	48 01 d0             	add    rax,rdx
  8094c7:	48 d1 f8             	sar    rax,1
}
  8094ca:	5d                   	pop    rbp
  8094cb:	c3                   	ret    

00000000008094cc <del_ch>:
void del_ch()
{
  8094cc:	f3 0f 1e fa          	endbr64 
  8094d0:	55                   	push   rbp
  8094d1:	48 89 e5             	mov    rbp,rsp
  8094d4:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  8094db:	48 8b 05 66 11 00 00 	mov    rax,QWORD PTR [rip+0x1166]        # 80a648 <m_ptr>
  8094e2:	48 83 e8 02          	sub    rax,0x2
  8094e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  8094ea:	b8 00 00 00 00       	mov    eax,0x0
  8094ef:	e8 b0 ff ff ff       	call   8094a4 <tell_monitor>
  8094f4:	89 c2                	mov    edx,eax
  8094f6:	48 63 c2             	movsxd rax,edx
  8094f9:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809500:	48 c1 e8 20          	shr    rax,0x20
  809504:	c1 f8 05             	sar    eax,0x5
  809507:	89 d1                	mov    ecx,edx
  809509:	c1 f9 1f             	sar    ecx,0x1f
  80950c:	29 c8                	sub    eax,ecx
  80950e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  809511:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  809514:	89 c8                	mov    eax,ecx
  809516:	c1 e0 02             	shl    eax,0x2
  809519:	01 c8                	add    eax,ecx
  80951b:	c1 e0 04             	shl    eax,0x4
  80951e:	29 c2                	sub    edx,eax
  809520:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809523:	eb 17                	jmp    80953c <del_ch+0x70>
    {
        *p=*(p+2);
  809525:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809529:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80952d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809531:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809533:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809538:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80953c:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809540:	7e e3                	jle    809525 <del_ch+0x59>
    }
    driver_args args= {
  809542:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809549:	b8 00 00 00 00       	mov    eax,0x0
  80954e:	b9 18 00 00 00       	mov    ecx,0x18
  809553:	48 89 d7             	mov    rdi,rdx
  809556:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809559:	b8 00 00 00 00       	mov    eax,0x0
  80955e:	e8 41 ff ff ff       	call   8094a4 <tell_monitor>
  809563:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809566:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80956c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809573:	48 89 c7             	mov    rdi,rax
  809576:	e8 fd fe ff ff       	call   809478 <seek_tty>
    set_cur();
  80957b:	b8 00 00 00 00       	mov    eax,0x0
  809580:	e8 03 00 00 00       	call   809588 <set_cur>
}
  809585:	90                   	nop
  809586:	c9                   	leave  
  809587:	c3                   	ret    

0000000000809588 <set_cur>:
void set_cur()
{
  809588:	f3 0f 1e fa          	endbr64 
  80958c:	55                   	push   rbp
  80958d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809590:	fa                   	cli    
    outb(port_reg_index,14);
  809591:	8b 05 11 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29611]        # 432ba8 <port_reg_index>
  809597:	0f b7 c0             	movzx  eax,ax
  80959a:	be 0e 00 00 00       	mov    esi,0xe
  80959f:	89 c7                	mov    edi,eax
  8095a1:	e8 4a b9 ff ff       	call   804ef0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  8095a6:	48 8b 05 9b 10 00 00 	mov    rax,QWORD PTR [rip+0x109b]        # 80a648 <m_ptr>
  8095ad:	48 8b 15 cc 95 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc295cc]        # 432b80 <video_base>
  8095b4:	48 29 d0             	sub    rax,rdx
  8095b7:	48 c1 f8 09          	sar    rax,0x9
  8095bb:	0f b6 d0             	movzx  edx,al
  8095be:	8b 05 e8 95 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc295e8]        # 432bac <port_reg_v>
  8095c4:	0f b7 c0             	movzx  eax,ax
  8095c7:	89 d6                	mov    esi,edx
  8095c9:	89 c7                	mov    edi,eax
  8095cb:	e8 20 b9 ff ff       	call   804ef0 <outb>
    outb(port_reg_index,15);
  8095d0:	8b 05 d2 95 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc295d2]        # 432ba8 <port_reg_index>
  8095d6:	0f b7 c0             	movzx  eax,ax
  8095d9:	be 0f 00 00 00       	mov    esi,0xf
  8095de:	89 c7                	mov    edi,eax
  8095e0:	e8 0b b9 ff ff       	call   804ef0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  8095e5:	48 8b 05 5c 10 00 00 	mov    rax,QWORD PTR [rip+0x105c]        # 80a648 <m_ptr>
  8095ec:	48 8b 15 8d 95 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2958d]        # 432b80 <video_base>
  8095f3:	48 29 d0             	sub    rax,rdx
  8095f6:	48 d1 f8             	sar    rax,1
  8095f9:	0f b6 d0             	movzx  edx,al
  8095fc:	8b 05 aa 95 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc295aa]        # 432bac <port_reg_v>
  809602:	0f b7 c0             	movzx  eax,ax
  809605:	89 d6                	mov    esi,edx
  809607:	89 c7                	mov    edi,eax
  809609:	e8 e2 b8 ff ff       	call   804ef0 <outb>
    asm volatile("sti");
  80960e:	fb                   	sti    
}
  80960f:	90                   	nop
  809610:	5d                   	pop    rbp
  809611:	c3                   	ret    

0000000000809612 <read_tty>:

int read_tty(driver_args *args)
{
  809612:	f3 0f 1e fa          	endbr64 
  809616:	55                   	push   rbp
  809617:	48 89 e5             	mov    rbp,rsp
  80961a:	48 83 ec 20          	sub    rsp,0x20
  80961e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  809622:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809626:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809629:	48 98                	cdqe   
  80962b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80962f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809633:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809636:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  809639:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809640:	eb 4a                	jmp    80968c <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809642:	48 8b 15 ff 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfff]        # 80a648 <m_ptr>
  809649:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80964d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809651:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809655:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809658:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80965a:	48 8b 05 e7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfe7]        # 80a648 <m_ptr>
  809661:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809667:	75 0d                	jne    809676 <read_tty+0x64>
  809669:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80966d:	7e 07                	jle    809676 <read_tty+0x64>
        {
            return 1;//读到尾了
  80966f:	b8 01 00 00 00       	mov    eax,0x1
  809674:	eb 2d                	jmp    8096a3 <read_tty+0x91>
        }
        m_ptr+=2;
  809676:	48 8b 05 cb 0f 00 00 	mov    rax,QWORD PTR [rip+0xfcb]        # 80a648 <m_ptr>
  80967d:	48 83 c0 02          	add    rax,0x2
  809681:	48 89 05 c0 0f 00 00 	mov    QWORD PTR [rip+0xfc0],rax        # 80a648 <m_ptr>
    for(int i=0;i<len;i++)
  809688:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80968c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80968f:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809692:	7c ae                	jl     809642 <read_tty+0x30>
    }
    set_cur();
  809694:	b8 00 00 00 00       	mov    eax,0x0
  809699:	e8 ea fe ff ff       	call   809588 <set_cur>
    return 0;
  80969e:	b8 00 00 00 00       	mov    eax,0x0
}
  8096a3:	c9                   	leave  
  8096a4:	c3                   	ret    

00000000008096a5 <write_tty>:
int write_tty(driver_args *args)
{
  8096a5:	f3 0f 1e fa          	endbr64 
  8096a9:	55                   	push   rbp
  8096aa:	48 89 e5             	mov    rbp,rsp
  8096ad:	48 83 ec 30          	sub    rsp,0x30
  8096b1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  8096b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8096b9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8096bc:	48 98                	cdqe   
  8096be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8096c2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8096c6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8096c9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8096cc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8096d3:	e9 0b 01 00 00       	jmp    8097e3 <write_tty+0x13e>
    {
        if(*src=='\n')
  8096d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096df:	3c 0a                	cmp    al,0xa
  8096e1:	75 50                	jne    809733 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  8096e3:	48 8b 05 5e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf5e]        # 80a648 <m_ptr>
  8096ea:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  8096f0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  8096f3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096f6:	89 c2                	mov    edx,eax
  8096f8:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  8096fd:	48 0f af c2          	imul   rax,rdx
  809701:	48 c1 e8 20          	shr    rax,0x20
  809705:	c1 e8 07             	shr    eax,0x7
  809708:	8d 50 01             	lea    edx,[rax+0x1]
  80970b:	89 d0                	mov    eax,edx
  80970d:	c1 e0 02             	shl    eax,0x2
  809710:	01 d0                	add    eax,edx
  809712:	c1 e0 05             	shl    eax,0x5
  809715:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  809718:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80971b:	05 00 80 0b 00       	add    eax,0xb8000
  809720:	89 c0                	mov    eax,eax
  809722:	48 89 05 1f 0f 00 00 	mov    QWORD PTR [rip+0xf1f],rax        # 80a648 <m_ptr>
            src++;
  809729:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80972e:	e9 ac 00 00 00       	jmp    8097df <write_tty+0x13a>
        }else if(*src=='\0')
  809733:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809737:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80973a:	84 c0                	test   al,al
  80973c:	0f 84 af 00 00 00    	je     8097f1 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809742:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809746:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809749:	3c 08                	cmp    al,0x8
  80974b:	75 1e                	jne    80976b <write_tty+0xc6>
        {
            m_ptr-=2;
  80974d:	48 8b 05 f4 0e 00 00 	mov    rax,QWORD PTR [rip+0xef4]        # 80a648 <m_ptr>
  809754:	48 83 e8 02          	sub    rax,0x2
  809758:	48 89 05 e9 0e 00 00 	mov    QWORD PTR [rip+0xee9],rax        # 80a648 <m_ptr>
            *m_ptr=0;
  80975f:	48 8b 05 e2 0e 00 00 	mov    rax,QWORD PTR [rip+0xee2]        # 80a648 <m_ptr>
  809766:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809769:	eb 3e                	jmp    8097a9 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80976b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80976f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809773:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809777:	48 8b 05 ca 0e 00 00 	mov    rax,QWORD PTR [rip+0xeca]        # 80a648 <m_ptr>
  80977e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809782:	48 89 0d bf 0e 00 00 	mov    QWORD PTR [rip+0xebf],rcx        # 80a648 <m_ptr>
  809789:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80978c:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80978e:	48 8b 05 b3 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb3]        # 80a648 <m_ptr>
  809795:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809799:	48 89 15 a8 0e 00 00 	mov    QWORD PTR [rip+0xea8],rdx        # 80a648 <m_ptr>
  8097a0:	0f b6 15 a9 0e 00 00 	movzx  edx,BYTE PTR [rip+0xea9]        # 80a650 <m_color>
  8097a7:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  8097a9:	48 8b 05 98 0e 00 00 	mov    rax,QWORD PTR [rip+0xe98]        # 80a648 <m_ptr>
  8097b0:	48 8b 0d d9 93 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc293d9]        # 432b90 <vpage_base>
  8097b7:	48 29 c8             	sub    rax,rcx
  8097ba:	48 89 c2             	mov    rdx,rax
  8097bd:	8b 05 ed 93 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc293ed]        # 432bb0 <vpage_size>
  8097c3:	8b 0d db 93 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc293db]        # 432ba4 <line_chs>
  8097c9:	29 c8                	sub    eax,ecx
  8097cb:	01 c0                	add    eax,eax
  8097cd:	48 98                	cdqe   
  8097cf:	48 39 c2             	cmp    rdx,rax
  8097d2:	7c 0b                	jl     8097df <write_tty+0x13a>
  8097d4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8097d8:	7e 05                	jle    8097df <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  8097da:	e8 bc f8 ff ff       	call   80909b <scrdown>
    for(int i=0;i<len;i++)
  8097df:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8097e3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8097e6:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8097e9:	0f 8c e9 fe ff ff    	jl     8096d8 <write_tty+0x33>
  8097ef:	eb 01                	jmp    8097f2 <write_tty+0x14d>
            break;
  8097f1:	90                   	nop
        }
    }
    set_cur();
  8097f2:	b8 00 00 00 00       	mov    eax,0x0
  8097f7:	e8 8c fd ff ff       	call   809588 <set_cur>
    return 0;
  8097fc:	b8 00 00 00 00       	mov    eax,0x0
}
  809801:	c9                   	leave  
  809802:	c3                   	ret    

0000000000809803 <cls>:

void cls(driver_args *args)
{
  809803:	f3 0f 1e fa          	endbr64 
  809807:	55                   	push   rbp
  809808:	48 89 e5             	mov    rbp,rsp
  80980b:	48 83 ec 20          	sub    rsp,0x20
  80980f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809813:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80981a:	eb 16                	jmp    809832 <cls+0x2f>
    {
        vpage_base[i]=0;
  80981c:	48 8b 15 6d 93 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2936d]        # 432b90 <vpage_base>
  809823:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809826:	48 98                	cdqe   
  809828:	48 01 d0             	add    rax,rdx
  80982b:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80982e:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809832:	8b 05 78 93 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29378]        # 432bb0 <vpage_size>
  809838:	01 c0                	add    eax,eax
  80983a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80983d:	7c dd                	jl     80981c <cls+0x19>
    }
    m_ptr=vpage_base;
  80983f:	48 8b 05 4a 93 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2934a]        # 432b90 <vpage_base>
  809846:	48 89 05 fb 0d 00 00 	mov    QWORD PTR [rip+0xdfb],rax        # 80a648 <m_ptr>
    set_cur();
  80984d:	b8 00 00 00 00       	mov    eax,0x0
  809852:	e8 31 fd ff ff       	call   809588 <set_cur>
}
  809857:	90                   	nop
  809858:	c9                   	leave  
  809859:	c3                   	ret    

000000000080985a <set_color>:

void set_color(char color)
{
  80985a:	f3 0f 1e fa          	endbr64 
  80985e:	55                   	push   rbp
  80985f:	48 89 e5             	mov    rbp,rsp
  809862:	89 f8                	mov    eax,edi
  809864:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809867:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80986b:	88 05 df 0d 00 00    	mov    BYTE PTR [rip+0xddf],al        # 80a650 <m_color>
}
  809871:	90                   	nop
  809872:	5d                   	pop    rbp
  809873:	c3                   	ret    

0000000000809874 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809874:	f3 0f 1e fa          	endbr64 
  809878:	55                   	push   rbp
  809879:	48 89 e5             	mov    rbp,rsp
  80987c:	48 83 ec 10          	sub    rsp,0x10
  809880:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  809884:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809888:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80988e:	83 f8 0d             	cmp    eax,0xd
  809891:	74 45                	je     8098d8 <tty_do_req+0x64>
  809893:	83 f8 0d             	cmp    eax,0xd
  809896:	7f 53                	jg     8098eb <tty_do_req+0x77>
  809898:	83 f8 0c             	cmp    eax,0xc
  80989b:	74 2d                	je     8098ca <tty_do_req+0x56>
  80989d:	83 f8 0c             	cmp    eax,0xc
  8098a0:	7f 49                	jg     8098eb <tty_do_req+0x77>
  8098a2:	83 f8 02             	cmp    eax,0x2
  8098a5:	74 07                	je     8098ae <tty_do_req+0x3a>
  8098a7:	83 f8 03             	cmp    eax,0x3
  8098aa:	74 10                	je     8098bc <tty_do_req+0x48>
  8098ac:	eb 3d                	jmp    8098eb <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  8098ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098b2:	48 89 c7             	mov    rdi,rax
  8098b5:	e8 58 fd ff ff       	call   809612 <read_tty>
        break;
  8098ba:	eb 36                	jmp    8098f2 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  8098bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098c0:	48 89 c7             	mov    rdi,rax
  8098c3:	e8 dd fd ff ff       	call   8096a5 <write_tty>
        break;
  8098c8:	eb 28                	jmp    8098f2 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8098ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098ce:	48 89 c7             	mov    rdi,rax
  8098d1:	e8 a2 fb ff ff       	call   809478 <seek_tty>
        break;
  8098d6:	eb 1a                	jmp    8098f2 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  8098d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098dc:	48 89 c7             	mov    rdi,rax
  8098df:	b8 00 00 00 00       	mov    eax,0x0
  8098e4:	e8 bb fb ff ff       	call   8094a4 <tell_monitor>
        break;
  8098e9:	eb 07                	jmp    8098f2 <tty_do_req+0x7e>
    default:return -1;
  8098eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8098f0:	eb 05                	jmp    8098f7 <tty_do_req+0x83>
    }
    return 0;
  8098f2:	b8 00 00 00 00       	mov    eax,0x0
}
  8098f7:	c9                   	leave  
  8098f8:	c3                   	ret    

00000000008098f9 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  8098f9:	f3 0f 1e fa          	endbr64 
  8098fd:	55                   	push   rbp
  8098fe:	48 89 e5             	mov    rbp,rsp
  809901:	48 83 ec 10          	sub    rsp,0x10
  809905:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  809908:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80990b:	83 c0 01             	add    eax,0x1
  80990e:	0f b7 c0             	movzx  eax,ax
  809911:	be 00 00 00 00       	mov    esi,0x0
  809916:	89 c7                	mov    edi,eax
  809918:	e8 d3 b5 ff ff       	call   804ef0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80991d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809920:	83 c0 03             	add    eax,0x3
  809923:	0f b7 c0             	movzx  eax,ax
  809926:	be 80 00 00 00       	mov    esi,0x80
  80992b:	89 c7                	mov    edi,eax
  80992d:	e8 be b5 ff ff       	call   804ef0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809932:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809935:	0f b7 c0             	movzx  eax,ax
  809938:	be 03 00 00 00       	mov    esi,0x3
  80993d:	89 c7                	mov    edi,eax
  80993f:	e8 ac b5 ff ff       	call   804ef0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809944:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809947:	83 c0 01             	add    eax,0x1
  80994a:	0f b7 c0             	movzx  eax,ax
  80994d:	be 00 00 00 00       	mov    esi,0x0
  809952:	89 c7                	mov    edi,eax
  809954:	e8 97 b5 ff ff       	call   804ef0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80995c:	83 c0 03             	add    eax,0x3
  80995f:	0f b7 c0             	movzx  eax,ax
  809962:	be 03 00 00 00       	mov    esi,0x3
  809967:	89 c7                	mov    edi,eax
  809969:	e8 82 b5 ff ff       	call   804ef0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80996e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809971:	83 c0 02             	add    eax,0x2
  809974:	0f b7 c0             	movzx  eax,ax
  809977:	be c7 00 00 00       	mov    esi,0xc7
  80997c:	89 c7                	mov    edi,eax
  80997e:	e8 6d b5 ff ff       	call   804ef0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  809983:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809986:	83 c0 04             	add    eax,0x4
  809989:	0f b7 c0             	movzx  eax,ax
  80998c:	be 0b 00 00 00       	mov    esi,0xb
  809991:	89 c7                	mov    edi,eax
  809993:	e8 58 b5 ff ff       	call   804ef0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  809998:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80999b:	83 c0 04             	add    eax,0x4
  80999e:	0f b7 c0             	movzx  eax,ax
  8099a1:	be 1e 00 00 00       	mov    esi,0x1e
  8099a6:	89 c7                	mov    edi,eax
  8099a8:	e8 43 b5 ff ff       	call   804ef0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  8099ad:	b8 61 00 00 00       	mov    eax,0x61
  8099b2:	0f b6 d0             	movzx  edx,al
  8099b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099b8:	0f b7 c0             	movzx  eax,ax
  8099bb:	89 d6                	mov    esi,edx
  8099bd:	89 c7                	mov    edi,eax
  8099bf:	e8 2c b5 ff ff       	call   804ef0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8099c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099c7:	0f b6 c0             	movzx  eax,al
  8099ca:	89 c7                	mov    edi,eax
  8099cc:	e8 38 b5 ff ff       	call   804f09 <inb>
  8099d1:	0f b6 d0             	movzx  edx,al
  8099d4:	b8 61 00 00 00       	mov    eax,0x61
  8099d9:	0f be c0             	movsx  eax,al
  8099dc:	39 c2                	cmp    edx,eax
  8099de:	75 17                	jne    8099f7 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  8099e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099e3:	83 c0 04             	add    eax,0x4
  8099e6:	0f b7 c0             	movzx  eax,ax
  8099e9:	be 0f 00 00 00       	mov    esi,0xf
  8099ee:	89 c7                	mov    edi,eax
  8099f0:	e8 fb b4 ff ff       	call   804ef0 <outb>
  8099f5:	eb 01                	jmp    8099f8 <init_com+0xff>
        return;
  8099f7:	90                   	nop
}
  8099f8:	c9                   	leave  
  8099f9:	c3                   	ret    

00000000008099fa <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  8099fa:	f3 0f 1e fa          	endbr64 
  8099fe:	55                   	push   rbp
  8099ff:	48 89 e5             	mov    rbp,rsp
  809a02:	48 83 ec 20          	sub    rsp,0x20
  809a06:	89 f8                	mov    eax,edi
  809a08:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809a0b:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  809a0f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809a12:	83 c0 05             	add    eax,0x5
  809a15:	0f b6 c0             	movzx  eax,al
  809a18:	89 c7                	mov    edi,eax
  809a1a:	e8 ea b4 ff ff       	call   804f09 <inb>
  809a1f:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809a22:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809a26:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809a2a:	74 e3                	je     809a0f <com_putchar+0x15>
    outb(com_base, ch);
  809a2c:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809a30:	0f b6 d0             	movzx  edx,al
  809a33:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809a36:	0f b7 c0             	movzx  eax,ax
  809a39:	89 d6                	mov    esi,edx
  809a3b:	89 c7                	mov    edi,eax
  809a3d:	e8 ae b4 ff ff       	call   804ef0 <outb>
}
  809a42:	90                   	nop
  809a43:	c9                   	leave  
  809a44:	c3                   	ret    

0000000000809a45 <com_puts>:

void com_puts(char* s,int com_port){
  809a45:	f3 0f 1e fa          	endbr64 
  809a49:	55                   	push   rbp
  809a4a:	48 89 e5             	mov    rbp,rsp
  809a4d:	48 83 ec 10          	sub    rsp,0x10
  809a51:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a55:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809a58:	eb 1d                	jmp    809a77 <com_puts+0x32>
        com_putchar(*s,com_port);
  809a5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a61:	66 98                	cbw    
  809a63:	0f b7 c0             	movzx  eax,ax
  809a66:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809a69:	89 d6                	mov    esi,edx
  809a6b:	89 c7                	mov    edi,eax
  809a6d:	e8 88 ff ff ff       	call   8099fa <com_putchar>
    for(;*s;s++){
  809a72:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809a77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a7e:	84 c0                	test   al,al
  809a80:	75 d8                	jne    809a5a <com_puts+0x15>
    }
  809a82:	90                   	nop
  809a83:	90                   	nop
  809a84:	c9                   	leave  
  809a85:	c3                   	ret    

0000000000809a86 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  809a86:	f3 0f 1e fa          	endbr64 
  809a8a:	55                   	push   rbp
  809a8b:	48 89 e5             	mov    rbp,rsp
  809a8e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809a92:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809a96:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  809a99:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a9d:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809aa0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809aa7:	eb 1b                	jmp    809ac4 <memcpy+0x3e>
        *(dest)=*(src);
  809aa9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809aad:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809ab0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ab4:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809ab6:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  809abb:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809ac0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809ac4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ac7:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  809aca:	77 dd                	ja     809aa9 <memcpy+0x23>
    }
}
  809acc:	90                   	nop
  809acd:	90                   	nop
  809ace:	5d                   	pop    rbp
  809acf:	c3                   	ret    

0000000000809ad0 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809ad0:	f3 0f 1e fa          	endbr64 
  809ad4:	55                   	push   rbp
  809ad5:	48 89 e5             	mov    rbp,rsp
  809ad8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809adc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809ae0:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809ae3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809aea:	eb 3a                	jmp    809b26 <memcmp+0x56>
    {
        if(*a!=*b)
  809aec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809af0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809af3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809af7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809afa:	38 c2                	cmp    dl,al
  809afc:	74 1a                	je     809b18 <memcmp+0x48>
            return *a-*b;
  809afe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b02:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b05:	0f b6 d0             	movzx  edx,al
  809b08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809b0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b0f:	0f b6 c8             	movzx  ecx,al
  809b12:	89 d0                	mov    eax,edx
  809b14:	29 c8                	sub    eax,ecx
  809b16:	eb 1b                	jmp    809b33 <memcmp+0x63>
        a++;
  809b18:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  809b1d:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809b22:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809b26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b29:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  809b2c:	7c be                	jl     809aec <memcmp+0x1c>
    }
    return 0;
  809b2e:	b8 00 00 00 00       	mov    eax,0x0
}
  809b33:	5d                   	pop    rbp
  809b34:	c3                   	ret    

0000000000809b35 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809b35:	f3 0f 1e fa          	endbr64 
  809b39:	55                   	push   rbp
  809b3a:	48 89 e5             	mov    rbp,rsp
  809b3d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809b41:	89 f0                	mov    eax,esi
  809b43:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809b46:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809b49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809b50:	eb 16                	jmp    809b68 <memset+0x33>
        *(buf++)=value;
  809b52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b56:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809b5a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809b5e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809b62:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809b64:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809b68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b6b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809b6e:	72 e2                	jb     809b52 <memset+0x1d>
    }
}
  809b70:	90                   	nop
  809b71:	90                   	nop
  809b72:	5d                   	pop    rbp
  809b73:	c3                   	ret    

0000000000809b74 <get_mem_size>:

u32 get_mem_size(){
  809b74:	f3 0f 1e fa          	endbr64 
  809b78:	55                   	push   rbp
  809b79:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  809b7c:	8b 05 42 90 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29042]        # 432bc4 <mem_end>
}
  809b82:	5d                   	pop    rbp
  809b83:	c3                   	ret    

0000000000809b84 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  809b84:	f3 0f 1e fa          	endbr64 
  809b88:	55                   	push   rbp
  809b89:	48 89 e5             	mov    rbp,rsp
  809b8c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809b90:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  809b94:	eb 1d                	jmp    809bb3 <strcpy+0x2f>
        *(dest++)=*(buf++);
  809b96:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  809b9a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809b9e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809ba2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ba6:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809baa:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809bae:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809bb1:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809bb3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809bb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bba:	84 c0                	test   al,al
  809bbc:	75 d8                	jne    809b96 <strcpy+0x12>
    }
    *dest='\0';
  809bbe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bc2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809bc5:	90                   	nop
  809bc6:	5d                   	pop    rbp
  809bc7:	c3                   	ret    

0000000000809bc8 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  809bc8:	f3 0f 1e fa          	endbr64 
  809bcc:	55                   	push   rbp
  809bcd:	48 89 e5             	mov    rbp,rsp
  809bd0:	48 83 ec 30          	sub    rsp,0x30
  809bd4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809bd8:	89 f0                	mov    eax,esi
  809bda:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  809bdd:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809be2:	0f 84 9c 00 00 00    	je     809c84 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809be8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809bec:	48 89 c6             	mov    rsi,rax
  809bef:	bf e0 2b 43 00       	mov    edi,0x432be0
  809bf4:	e8 8b ff ff ff       	call   809b84 <strcpy>
        char* ptr=strtokkee;
  809bf9:	48 c7 45 e8 e0 2b 43 	mov    QWORD PTR [rbp-0x18],0x432be0
  809c00:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809c01:	c7 05 d5 91 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc291d5],0x0        # 432de0 <tokptr>
  809c08:	00 00 00 
  809c0b:	eb 1c                	jmp    809c29 <strtok+0x61>
  809c0d:	8b 05 cd 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291cd]        # 432de0 <tokptr>
  809c13:	83 c0 01             	add    eax,0x1
  809c16:	99                   	cdq    
  809c17:	c1 ea 17             	shr    edx,0x17
  809c1a:	01 d0                	add    eax,edx
  809c1c:	25 ff 01 00 00       	and    eax,0x1ff
  809c21:	29 d0                	sub    eax,edx
  809c23:	89 05 b7 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc291b7],eax        # 432de0 <tokptr>
  809c29:	8b 05 b1 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291b1]        # 432de0 <tokptr>
  809c2f:	48 98                	cdqe   
  809c31:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c38:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809c3b:	74 13                	je     809c50 <strtok+0x88>
  809c3d:	8b 05 9d 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2919d]        # 432de0 <tokptr>
  809c43:	48 98                	cdqe   
  809c45:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c4c:	84 c0                	test   al,al
  809c4e:	75 bd                	jne    809c0d <strtok+0x45>
        strtokkee[tokptr]='\0';
  809c50:	8b 05 8a 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2918a]        # 432de0 <tokptr>
  809c56:	48 98                	cdqe   
  809c58:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
        tokptr=(tokptr+1)%512;
  809c5f:	8b 05 7b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2917b]        # 432de0 <tokptr>
  809c65:	83 c0 01             	add    eax,0x1
  809c68:	99                   	cdq    
  809c69:	c1 ea 17             	shr    edx,0x17
  809c6c:	01 d0                	add    eax,edx
  809c6e:	25 ff 01 00 00       	and    eax,0x1ff
  809c73:	29 d0                	sub    eax,edx
  809c75:	89 05 65 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29165],eax        # 432de0 <tokptr>
        return ptr;
  809c7b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809c7f:	e9 9e 00 00 00       	jmp    809d22 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  809c84:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  809c8b:	8b 05 4f 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2914f]        # 432de0 <tokptr>
  809c91:	48 98                	cdqe   
  809c93:	48 05 e0 2b 43 00    	add    rax,0x432be0
  809c99:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  809c9d:	eb 20                	jmp    809cbf <strtok+0xf7>
  809c9f:	8b 05 3b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2913b]        # 432de0 <tokptr>
  809ca5:	83 c0 01             	add    eax,0x1
  809ca8:	99                   	cdq    
  809ca9:	c1 ea 17             	shr    edx,0x17
  809cac:	01 d0                	add    eax,edx
  809cae:	25 ff 01 00 00       	and    eax,0x1ff
  809cb3:	29 d0                	sub    eax,edx
  809cb5:	89 05 25 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29125],eax        # 432de0 <tokptr>
  809cbb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809cbf:	8b 05 1b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2911b]        # 432de0 <tokptr>
  809cc5:	48 98                	cdqe   
  809cc7:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809cce:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809cd1:	74 13                	je     809ce6 <strtok+0x11e>
  809cd3:	8b 05 07 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29107]        # 432de0 <tokptr>
  809cd9:	48 98                	cdqe   
  809cdb:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809ce2:	84 c0                	test   al,al
  809ce4:	75 b9                	jne    809c9f <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809ce6:	8b 05 f4 90 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc290f4]        # 432de0 <tokptr>
  809cec:	48 98                	cdqe   
  809cee:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
    tokptr=(tokptr+1)%512;
  809cf5:	8b 05 e5 90 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc290e5]        # 432de0 <tokptr>
  809cfb:	83 c0 01             	add    eax,0x1
  809cfe:	99                   	cdq    
  809cff:	c1 ea 17             	shr    edx,0x17
  809d02:	01 d0                	add    eax,edx
  809d04:	25 ff 01 00 00       	and    eax,0x1ff
  809d09:	29 d0                	sub    eax,edx
  809d0b:	89 05 cf 90 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc290cf],eax        # 432de0 <tokptr>
    if(c)
  809d11:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809d15:	74 06                	je     809d1d <strtok+0x155>
        return ptr;
  809d17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d1b:	eb 05                	jmp    809d22 <strtok+0x15a>
    else
        return (void*)0;
  809d1d:	b8 00 00 00 00       	mov    eax,0x0
}
  809d22:	c9                   	leave  
  809d23:	c3                   	ret    

0000000000809d24 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809d24:	f3 0f 1e fa          	endbr64 
  809d28:	55                   	push   rbp
  809d29:	48 89 e5             	mov    rbp,rsp
  809d2c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809d30:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809d34:	eb 3c                	jmp    809d72 <strcmp+0x4e>
		if(*s1>*s2)
  809d36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d3a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d44:	38 c2                	cmp    dl,al
  809d46:	7e 07                	jle    809d4f <strcmp+0x2b>
			return 1;
  809d48:	b8 01 00 00 00       	mov    eax,0x1
  809d4d:	eb 52                	jmp    809da1 <strcmp+0x7d>
		else if(*s1<*s2)
  809d4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d53:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d5d:	38 c2                	cmp    dl,al
  809d5f:	7d 07                	jge    809d68 <strcmp+0x44>
			return -1;
  809d61:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809d66:	eb 39                	jmp    809da1 <strcmp+0x7d>
		s1++;
  809d68:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  809d6d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809d72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d79:	84 c0                	test   al,al
  809d7b:	74 0b                	je     809d88 <strcmp+0x64>
  809d7d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d84:	84 c0                	test   al,al
  809d86:	75 ae                	jne    809d36 <strcmp+0x12>
	}
	if(*s1==*s2)
  809d88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d8c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d8f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d93:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d96:	38 c2                	cmp    dl,al
  809d98:	75 07                	jne    809da1 <strcmp+0x7d>
		return 0;
  809d9a:	b8 00 00 00 00       	mov    eax,0x0
  809d9f:	eb 00                	jmp    809da1 <strcmp+0x7d>
}
  809da1:	5d                   	pop    rbp
  809da2:	c3                   	ret    

0000000000809da3 <strlen>:

int strlen(char *str)
{
  809da3:	f3 0f 1e fa          	endbr64 
  809da7:	55                   	push   rbp
  809da8:	48 89 e5             	mov    rbp,rsp
  809dab:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  809daf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809db6:	eb 09                	jmp    809dc1 <strlen+0x1e>
  809db8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  809dbd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809dc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dc5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809dc8:	84 c0                	test   al,al
  809dca:	75 ec                	jne    809db8 <strlen+0x15>
    return l;
  809dcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809dcf:	5d                   	pop    rbp
  809dd0:	c3                   	ret    

0000000000809dd1 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809dd1:	f3 0f 1e fa          	endbr64 
  809dd5:	55                   	push   rbp
  809dd6:	48 89 e5             	mov    rbp,rsp
  809dd9:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809de0:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809de7:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809dee:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809df5:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  809dfc:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809e03:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809e0a:	84 c0                	test   al,al
  809e0c:	74 20                	je     809e2e <sprintf+0x5d>
  809e0e:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809e12:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809e16:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809e1a:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  809e1e:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809e22:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809e26:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809e2a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  809e2e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809e35:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  809e3c:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809e43:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809e4a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809e51:	00 00 00 
    while (*pstr!='\n')
  809e54:	eb 39                	jmp    809e8f <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809e56:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e5d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e60:	3c 25                	cmp    al,0x25
  809e62:	75 15                	jne    809e79 <sprintf+0xa8>
  809e64:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  809e6b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e6e:	3c 25                	cmp    al,0x25
  809e70:	74 07                	je     809e79 <sprintf+0xa8>
            argnum++;
  809e72:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809e79:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e80:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809e87:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809e8e:	01 
    while (*pstr!='\n')
  809e8f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e99:	3c 0a                	cmp    al,0xa
  809e9b:	75 b9                	jne    809e56 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  809e9d:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809ea4:	00 00 00 
  809ea7:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809eae:	00 00 00 
  809eb1:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809eb5:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  809ebc:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809ec3:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809eca:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809ed1:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809ed8:	e9 e2 01 00 00       	jmp    80a0bf <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809edd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ee4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ee7:	3c 25                	cmp    al,0x25
  809ee9:	0f 85 aa 01 00 00    	jne    80a099 <sprintf+0x2c8>
  809eef:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ef6:	48 83 c0 01          	add    rax,0x1
  809efa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809efd:	84 c0                	test   al,al
  809eff:	0f 84 94 01 00 00    	je     80a099 <sprintf+0x2c8>
            pstr++;
  809f05:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809f0c:	01 
            if(*pstr=='x'){
  809f0d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809f14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f17:	3c 78                	cmp    al,0x78
  809f19:	75 64                	jne    809f7f <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  809f1b:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809f21:	83 f8 2f             	cmp    eax,0x2f
  809f24:	77 23                	ja     809f49 <sprintf+0x178>
  809f26:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809f2d:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f33:	89 d2                	mov    edx,edx
  809f35:	48 01 d0             	add    rax,rdx
  809f38:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f3e:	83 c2 08             	add    edx,0x8
  809f41:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809f47:	eb 12                	jmp    809f5b <sprintf+0x18a>
  809f49:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809f50:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809f54:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809f5b:	8b 00                	mov    eax,DWORD PTR [rax]
  809f5d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809f63:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809f69:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809f70:	89 d6                	mov    esi,edx
  809f72:	48 89 c7             	mov    rdi,rax
  809f75:	e8 4e 02 00 00       	call   80a1c8 <sprint_hex>
            if(*pstr=='x'){
  809f7a:	e9 38 01 00 00       	jmp    80a0b7 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809f7f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809f86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f89:	3c 73                	cmp    al,0x73
  809f8b:	75 68                	jne    809ff5 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809f8d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809f93:	83 f8 2f             	cmp    eax,0x2f
  809f96:	77 23                	ja     809fbb <sprintf+0x1ea>
  809f98:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809f9f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809fa5:	89 d2                	mov    edx,edx
  809fa7:	48 01 d0             	add    rax,rdx
  809faa:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809fb0:	83 c2 08             	add    edx,0x8
  809fb3:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809fb9:	eb 12                	jmp    809fcd <sprintf+0x1fc>
  809fbb:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809fc2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809fc6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809fcd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809fd0:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809fd7:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809fde:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809fe5:	48 89 d6             	mov    rsi,rdx
  809fe8:	48 89 c7             	mov    rdi,rax
  809feb:	e8 5a 02 00 00       	call   80a24a <sprintn>
            if(*pstr=='x'){
  809ff0:	e9 c2 00 00 00       	jmp    80a0b7 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809ff5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ffc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fff:	3c 64                	cmp    al,0x64
  80a001:	75 66                	jne    80a069 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80a003:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a009:	83 f8 2f             	cmp    eax,0x2f
  80a00c:	77 23                	ja     80a031 <sprintf+0x260>
  80a00e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a015:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a01b:	89 d2                	mov    edx,edx
  80a01d:	48 01 d0             	add    rax,rdx
  80a020:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a026:	83 c2 08             	add    edx,0x8
  80a029:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a02f:	eb 12                	jmp    80a043 <sprintf+0x272>
  80a031:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a038:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a03c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a043:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a046:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80a04d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80a054:	89 c2                	mov    edx,eax
  80a056:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a05d:	89 d6                	mov    esi,edx
  80a05f:	48 89 c7             	mov    rdi,rax
  80a062:	e8 ad 00 00 00       	call   80a114 <sprint_decimal>
            if(*pstr=='x'){
  80a067:	eb 4e                	jmp    80a0b7 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80a069:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a070:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a073:	3c 63                	cmp    al,0x63
  80a075:	75 02                	jne    80a079 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80a077:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80a079:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a080:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a083:	0f be d0             	movsx  edx,al
  80a086:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a08d:	89 d6                	mov    esi,edx
  80a08f:	48 89 c7             	mov    rdi,rax
  80a092:	e8 3e 00 00 00       	call   80a0d5 <sprintchar>
            if(*pstr=='x'){
  80a097:	eb 1e                	jmp    80a0b7 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80a099:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a0a0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0a3:	0f be d0             	movsx  edx,al
  80a0a6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a0ad:	89 d6                	mov    esi,edx
  80a0af:	48 89 c7             	mov    rdi,rax
  80a0b2:	e8 1e 00 00 00       	call   80a0d5 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80a0b7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a0be:	01 
  80a0bf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a0c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0c9:	84 c0                	test   al,al
  80a0cb:	0f 85 0c fe ff ff    	jne    809edd <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80a0d1:	90                   	nop
  80a0d2:	90                   	nop
  80a0d3:	c9                   	leave  
  80a0d4:	c3                   	ret    

000000000080a0d5 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80a0d5:	f3 0f 1e fa          	endbr64 
  80a0d9:	55                   	push   rbp
  80a0da:	48 89 e5             	mov    rbp,rsp
  80a0dd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a0e1:	89 f0                	mov    eax,esi
  80a0e3:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80a0e6:	eb 05                	jmp    80a0ed <sprintchar+0x18>
        dist++;
  80a0e8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80a0ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0f4:	84 c0                	test   al,al
  80a0f6:	75 f0                	jne    80a0e8 <sprintchar+0x13>
    *dist++=c;
  80a0f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0fc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a100:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a104:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80a108:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80a10a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a10e:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a111:	90                   	nop
  80a112:	5d                   	pop    rbp
  80a113:	c3                   	ret    

000000000080a114 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80a114:	f3 0f 1e fa          	endbr64 
  80a118:	55                   	push   rbp
  80a119:	48 89 e5             	mov    rbp,rsp
  80a11c:	48 83 ec 30          	sub    rsp,0x30
  80a120:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a124:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80a127:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80a12e:	eb 65                	jmp    80a195 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80a130:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80a133:	48 63 c2             	movsxd rax,edx
  80a136:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80a13d:	48 c1 e8 20          	shr    rax,0x20
  80a141:	c1 f8 02             	sar    eax,0x2
  80a144:	89 d6                	mov    esi,edx
  80a146:	c1 fe 1f             	sar    esi,0x1f
  80a149:	29 f0                	sub    eax,esi
  80a14b:	89 c1                	mov    ecx,eax
  80a14d:	89 c8                	mov    eax,ecx
  80a14f:	c1 e0 02             	shl    eax,0x2
  80a152:	01 c8                	add    eax,ecx
  80a154:	01 c0                	add    eax,eax
  80a156:	89 d1                	mov    ecx,edx
  80a158:	29 c1                	sub    ecx,eax
  80a15a:	89 c8                	mov    eax,ecx
  80a15c:	83 c0 30             	add    eax,0x30
  80a15f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80a162:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a165:	8d 50 01             	lea    edx,[rax+0x1]
  80a168:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a16b:	48 98                	cdqe   
  80a16d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a171:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80a175:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a178:	48 63 d0             	movsxd rdx,eax
  80a17b:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80a182:	48 c1 ea 20          	shr    rdx,0x20
  80a186:	c1 fa 02             	sar    edx,0x2
  80a189:	c1 f8 1f             	sar    eax,0x1f
  80a18c:	89 c1                	mov    ecx,eax
  80a18e:	89 d0                	mov    eax,edx
  80a190:	29 c8                	sub    eax,ecx
  80a192:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80a195:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a198:	83 f8 0f             	cmp    eax,0xf
  80a19b:	76 93                	jbe    80a130 <sprint_decimal+0x1c>
    }
    while(p>0)
  80a19d:	eb 1f                	jmp    80a1be <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80a19f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a1a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1a6:	48 98                	cdqe   
  80a1a8:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80a1ad:	0f be d0             	movsx  edx,al
  80a1b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a1b4:	89 d6                	mov    esi,edx
  80a1b6:	48 89 c7             	mov    rdi,rax
  80a1b9:	e8 17 ff ff ff       	call   80a0d5 <sprintchar>
    while(p>0)
  80a1be:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a1c2:	7f db                	jg     80a19f <sprint_decimal+0x8b>
    }
}
  80a1c4:	90                   	nop
  80a1c5:	90                   	nop
  80a1c6:	c9                   	leave  
  80a1c7:	c3                   	ret    

000000000080a1c8 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80a1c8:	f3 0f 1e fa          	endbr64 
  80a1cc:	55                   	push   rbp
  80a1cd:	48 89 e5             	mov    rbp,rsp
  80a1d0:	48 83 ec 20          	sub    rsp,0x20
  80a1d4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a1d8:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80a1db:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80a1e2:	eb 35                	jmp    80a219 <sprint_hex+0x51>
        unsigned char a=c%16;
  80a1e4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a1e7:	83 e0 0f             	and    eax,0xf
  80a1ea:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80a1ed:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80a1f1:	76 06                	jbe    80a1f9 <sprint_hex+0x31>
  80a1f3:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80a1f7:	eb 04                	jmp    80a1fd <sprint_hex+0x35>
        else a+='0';
  80a1f9:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80a1fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a200:	8d 50 01             	lea    edx,[rax+0x1]
  80a203:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a206:	48 98                	cdqe   
  80a208:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a20c:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80a210:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a213:	c1 e8 04             	shr    eax,0x4
  80a216:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80a219:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80a21d:	7e c5                	jle    80a1e4 <sprint_hex+0x1c>
    }
    while(p>0)
  80a21f:	eb 1f                	jmp    80a240 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80a221:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a225:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a228:	48 98                	cdqe   
  80a22a:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80a22f:	0f be d0             	movsx  edx,al
  80a232:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a236:	89 d6                	mov    esi,edx
  80a238:	48 89 c7             	mov    rdi,rax
  80a23b:	e8 95 fe ff ff       	call   80a0d5 <sprintchar>
    while(p>0)
  80a240:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a244:	7f db                	jg     80a221 <sprint_hex+0x59>
    }
}
  80a246:	90                   	nop
  80a247:	90                   	nop
  80a248:	c9                   	leave  
  80a249:	c3                   	ret    

000000000080a24a <sprintn>:
void sprintn(char *dist,char *str)
{
  80a24a:	f3 0f 1e fa          	endbr64 
  80a24e:	55                   	push   rbp
  80a24f:	48 89 e5             	mov    rbp,rsp
  80a252:	48 83 ec 10          	sub    rsp,0x10
  80a256:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a25a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80a25e:	eb 20                	jmp    80a280 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80a260:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a264:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a268:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80a26c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a26f:	0f be d0             	movsx  edx,al
  80a272:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a276:	89 d6                	mov    esi,edx
  80a278:	48 89 c7             	mov    rdi,rax
  80a27b:	e8 55 fe ff ff       	call   80a0d5 <sprintchar>
    while(*str!='\0')
  80a280:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a284:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a287:	84 c0                	test   al,al
  80a289:	75 d5                	jne    80a260 <sprintn+0x16>
    }
  80a28b:	90                   	nop
  80a28c:	90                   	nop
  80a28d:	c9                   	leave  
  80a28e:	c3                   	ret    
  80a28f:	90                   	nop

000000000080a290 <create_zero>:
  80a290:	e8 e2 9a ff ff       	call   803d77 <req_proc>
  80a295:	83 f8 ff             	cmp    eax,0xffffffff
  80a298:	74 0c                	je     80a2a6 <create_zero.retu>
  80a29a:	e8 d1 9b ff ff       	call   803e70 <set_proc>
  80a29f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80a2a3:	83 c4 40             	add    esp,0x40

000000000080a2a6 <create_zero.retu>:
  80a2a6:	c3                   	ret    

000000000080a2a7 <fill_desc>:
  80a2a7:	55                   	push   rbp
  80a2a8:	48 89 e5             	mov    rbp,rsp
  80a2ab:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80a2af:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80a2b3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80a2b7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80a2bb:	be fa a3 80 00       	mov    esi,0x80a3fa
  80a2c0:	c7 04 25 fa a3 80 00 	mov    DWORD PTR ds:0x80a3fa,0x0
  80a2c7:	00 00 00 00 
  80a2cb:	c7 04 25 fe a3 80 00 	mov    DWORD PTR ds:0x80a3fe,0x0
  80a2d2:	00 00 00 00 
  80a2d6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80a2da:	c1 e9 10             	shr    ecx,0x10
  80a2dd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80a2e2:	c1 ea 10             	shr    edx,0x10
  80a2e5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80a2e9:	66 c1 ea 08          	shr    dx,0x8
  80a2ed:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80a2f1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80a2f6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80a2fa:	c1 e1 08             	shl    ecx,0x8
  80a2fd:	09 cf                	or     edi,ecx
  80a2ff:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80a303:	8b 14 25 fa a3 80 00 	mov    edx,DWORD PTR ds:0x80a3fa
  80a30a:	67 89 10             	mov    DWORD PTR [eax],edx
  80a30d:	8b 14 25 fe a3 80 00 	mov    edx,DWORD PTR ds:0x80a3fe
  80a314:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80a318:	c9                   	leave  
  80a319:	c3                   	ret    

000000000080a31a <switch_proc_asm>:
  80a31a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80a320:	66 89 04 25 38 a3 80 	mov    WORD PTR ds:0x80a338,ax
  80a327:	00 
  80a328:	c7 04 25 34 a3 80 00 	mov    DWORD PTR ds:0x80a334,0x0
  80a32f:	00 00 00 00 

000000000080a333 <switch_proc_asm.ljmp>:
  80a333:	ea                   	(bad)  
  80a334:	00 00                	add    BYTE PTR [rax],al
  80a336:	00 00                	add    BYTE PTR [rax],al
  80a338:	00 00                	add    BYTE PTR [rax],al
  80a33a:	c3                   	ret    

000000000080a33b <switch_to_old>:
  80a33b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80a340:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80a344:	bf ac a3 80 00       	mov    edi,0x80a3ac
  80a349:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80a34d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80a351:	89 c1                	mov    ecx,eax
  80a353:	83 e9 04             	sub    ecx,0x4
  80a356:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80a359:	50                   	push   rax
  80a35a:	89 f5                	mov    ebp,esi
  80a35c:	83 c5 28             	add    ebp,0x28
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
  80a37f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a383:	50                   	push   rax
  80a384:	83 c5 04             	add    ebp,0x4
  80a387:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a38b:	50                   	push   rax
  80a38c:	83 c5 04             	add    ebp,0x4
  80a38f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a393:	50                   	push   rax
  80a394:	83 c5 04             	add    ebp,0x4
  80a397:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a39b:	50                   	push   rax
  80a39c:	83 c5 04             	add    ebp,0x4
  80a39f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80a3a3:	0f 22 d8             	mov    cr3,rax
  80a3a6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80a3aa:	50                   	push   rax
  80a3ab:	5c                   	pop    rsp

000000000080a3ac <switch_to_old.leap>:
  80a3ac:	ea                   	(bad)  
  80a3ad:	00 00                	add    BYTE PTR [rax],al
  80a3af:	00 00                	add    BYTE PTR [rax],al
  80a3b1:	08 00                	or     BYTE PTR [rax],al

000000000080a3b3 <save_context>:
  80a3b3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80a3b8:	83 c0 44             	add    eax,0x44
  80a3bb:	b9 08 00 00 00       	mov    ecx,0x8
  80a3c0:	89 e7                	mov    edi,esp

000000000080a3c2 <save_context.loops>:
  80a3c2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80a3c5:	67 89 10             	mov    DWORD PTR [eax],edx
  80a3c8:	83 c7 04             	add    edi,0x4
  80a3cb:	83 e8 04             	sub    eax,0x4
  80a3ce:	e2 f2                	loop   80a3c2 <save_context.loops>
  80a3d0:	5b                   	pop    rbx
  80a3d1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80a3d6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80a3da:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80a3df:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80a3e3:	c3                   	ret    

000000000080a3e4 <move_to_user_mode>:
  80a3e4:	66 b8 20 00          	mov    ax,0x20
  80a3e8:	8e d8                	mov    ds,eax
  80a3ea:	8e c0                	mov    es,eax
  80a3ec:	8e e8                	mov    gs,eax
  80a3ee:	6a 20                	push   0x20
  80a3f0:	54                   	push   rsp
  80a3f1:	6a 18                	push   0x18
  80a3f3:	68 f9 a3 80 00       	push   0x80a3f9
  80a3f8:	cf                   	iret   

000000000080a3f9 <move_to_user_mode.done>:
  80a3f9:	c3                   	ret    

000000000080a3fa <desc>:
	...

000000000080a402 <ret_sys_call>:
  80a402:	58                   	pop    rax
  80a403:	8e d8                	mov    ds,eax
  80a405:	58                   	pop    rax
  80a406:	8e c0                	mov    es,eax
  80a408:	41 5f                	pop    r15
  80a40a:	41 5e                	pop    r14
  80a40c:	41 5d                	pop    r13
  80a40e:	41 5c                	pop    r12
  80a410:	41 5b                	pop    r11
  80a412:	41 5a                	pop    r10
  80a414:	41 59                	pop    r9
  80a416:	41 58                	pop    r8
  80a418:	5e                   	pop    rsi
  80a419:	5f                   	pop    rdi
  80a41a:	5a                   	pop    rdx
  80a41b:	59                   	pop    rcx
  80a41c:	5b                   	pop    rbx
  80a41d:	58                   	pop    rax

000000000080a41e <tmp>:
  80a41e:	48 0f 07             	sysretq 
