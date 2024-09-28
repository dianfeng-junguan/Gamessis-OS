
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .entry:

0000000000103000 <init32>:
  103000:	fa                   	cli    
  103001:	89 de                	mov    esi,ebx
  103003:	89 c7                	mov    edi,eax
  103005:	b8 00 50 10 00       	mov    eax,0x105000
  10300a:	83 c0 02             	add    eax,0x2
  10300d:	c7 00 00 40 10 00    	mov    DWORD PTR [rax],0x104000
  103013:	b8 00 50 10 00       	mov    eax,0x105000
  103018:	66 0f 01 10          	data16 lgdt [rax]

000000000010301c <set_paging>:
  10301c:	66 b8 10 00          	mov    ax,0x10
  103020:	8e d8                	mov    ds,eax
  103022:	8e d0                	mov    ss,eax
  103024:	8e c0                	mov    es,eax
  103026:	8e e8                	mov    gs,eax
  103028:	8e e0                	mov    fs,eax
  10302a:	0f 20 e0             	mov    rax,cr4
  10302d:	0f ba e8 05          	bts    eax,0x5
  103031:	0f 22 e0             	mov    cr4,rax
  103034:	0f 20 c0             	mov    rax,cr0
  103037:	bb 00 00 00 80       	mov    ebx,0x80000000
  10303c:	f7 d3                	not    ebx
  10303e:	21 d8                	and    eax,ebx
  103040:	0f 22 c0             	mov    cr0,rax
  103043:	b8 00 00 10 00       	mov    eax,0x100000
  103048:	c7 00 07 10 10 00    	mov    DWORD PTR [rax],0x101007
  10304e:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  103055:	c7 80 00 10 00 00 83 	mov    DWORD PTR [rax+0x1000],0x83
  10305c:	00 00 00 
  10305f:	c7 80 04 10 00 00 00 	mov    DWORD PTR [rax+0x1004],0x0
  103066:	00 00 00 
  103069:	b8 00 00 10 00       	mov    eax,0x100000
  10306e:	0f 22 d8             	mov    cr3,rax

0000000000103071 <switch_cs>:
  103071:	bc 00 00 40 00       	mov    esp,0x400000
  103076:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  10307b:	0f 32                	rdmsr  
  10307d:	0f ba e8 08          	bts    eax,0x8
  103081:	0f 30                	wrmsr  
  103083:	0f 20 c0             	mov    rax,cr0
  103086:	0f ba e8 00          	bts    eax,0x0
  10308a:	0f ba e8 1f          	bts    eax,0x1f
  10308e:	0f 22 c0             	mov    cr0,rax
  103091:	b8 b8 07 80 00       	mov    eax,0x8007b8
  103096:	ea                   	(bad)  
  103097:	b8 07 80 00 08       	mov    eax,0x8008007
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
    set_gate(0,(addr_t)divide_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80000c:	b8 d1 03 80 00       	mov    eax,0x8003d1
  800011:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 e4 02 00 00       	call   80030c <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800028:	b8 eb 03 80 00       	mov    eax,0x8003eb
  80002d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 c8 02 00 00       	call   80030c <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800044:	b8 05 04 80 00       	mov    eax,0x800405
  800049:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 ac 02 00 00       	call   80030c <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800060:	b8 1f 04 80 00       	mov    eax,0x80041f
  800065:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 90 02 00 00       	call   80030c <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80007c:	b8 39 04 80 00       	mov    eax,0x800439
  800081:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 74 02 00 00       	call   80030c <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800098:	b8 53 04 80 00       	mov    eax,0x800453
  80009d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 58 02 00 00       	call   80030c <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8000b4:	b8 6d 04 80 00       	mov    eax,0x80046d
  8000b9:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 3c 02 00 00       	call   80030c <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8000d0:	b8 91 04 80 00       	mov    eax,0x800491
  8000d5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 20 02 00 00       	call   80030c <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//double_ints
  8000ec:	b8 ab 04 80 00       	mov    eax,0x8004ab
  8000f1:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 04 02 00 00       	call   80030c <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800108:	b8 c5 04 80 00       	mov    eax,0x8004c5
  80010d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 e8 01 00 00       	call   80030c <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800124:	b8 dd 04 80 00       	mov    eax,0x8004dd
  800129:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 cc 01 00 00       	call   80030c <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800140:	b8 f7 04 80 00       	mov    eax,0x8004f7
  800145:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 b0 01 00 00       	call   80030c <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80015c:	b8 11 05 80 00       	mov    eax,0x800511
  800161:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 94 01 00 00       	call   80030c <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800178:	b8 2b 05 80 00       	mov    eax,0x80052b
  80017d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 78 01 00 00       	call   80030c <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800194:	b8 46 12 80 00       	mov    eax,0x801246
  800199:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 5c 01 00 00       	call   80030c <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001b0:	b8 05 04 80 00       	mov    eax,0x800405
  8001b5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 40 01 00 00       	call   80030c <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001cc:	b8 5b 05 80 00       	mov    eax,0x80055b
  8001d1:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 24 01 00 00       	call   80030c <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be 05 04 80 00       	mov    esi,0x800405
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
  800217:	b8 50 5d 80 00       	mov    eax,0x805d50
  80021c:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 10 4c 80 00       	mov    eax,0x804c10
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 10 6c 80 00       	mov    eax,0x806c10
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80026b:	b8 d0 55 80 00       	mov    eax,0x8055d0
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
  800291:	e8 8a 46 00 00       	call   804920 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 7b 46 00 00       	call   804920 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 6c 46 00 00       	call   804920 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 5d 46 00 00       	call   804920 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 4e 46 00 00       	call   804920 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 3f 46 00 00       	call   804920 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 30 46 00 00       	call   804920 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 21 46 00 00       	call   804920 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 62 46 00 00       	call   80496b <turn_on_int>

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
  800327:	48 8b 15 32 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9a32]        # 809d60 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d 0e 9a 00 00 	mov    rcx,QWORD PTR [rip+0x9a0e]        # 809d60 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0xffffffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	48 89 c2             	mov    rdx,rax
  80036c:	48 8b 0d ed 99 00 00 	mov    rcx,QWORD PTR [rip+0x99ed]        # 809d60 <idt>
  800373:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800377:	48 c1 e0 04          	shl    rax,0x4
  80037b:	48 01 c8             	add    rax,rcx
  80037e:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    idt[index].attr=attr;
  800381:	48 8b 15 d8 99 00 00 	mov    rdx,QWORD PTR [rip+0x99d8]        # 809d60 <idt>
  800388:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038c:	48 c1 e0 04          	shl    rax,0x4
  800390:	48 01 c2             	add    rdx,rax
  800393:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800397:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039b:	48 8b 15 be 99 00 00 	mov    rdx,QWORD PTR [rip+0x99be]        # 809d60 <idt>
  8003a2:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a6:	48 c1 e0 04          	shl    rax,0x4
  8003aa:	48 01 c2             	add    rdx,rax
  8003ad:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b1:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b5:	48 8b 15 a4 99 00 00 	mov    rdx,QWORD PTR [rip+0x99a4]        # 809d60 <idt>
  8003bc:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003c0:	48 c1 e0 04          	shl    rax,0x4
  8003c4:	48 01 d0             	add    rax,rdx
  8003c7:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
#endif
}
  8003ce:	90                   	nop
  8003cf:	5d                   	pop    rbp
  8003d0:	c3                   	ret    

00000000008003d1 <divide_err>:

void divide_err(){
  8003d1:	f3 0f 1e fa          	endbr64 
  8003d5:	55                   	push   rbp
  8003d6:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003d9:	fa                   	cli    
    //puts("divide err");
    eoi();
  8003da:	b8 00 00 00 00       	mov    eax,0x0
  8003df:	e8 7b 45 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8003e4:	fb                   	sti    
  8003e5:	c9                   	leave  
  8003e6:	48 cf                	iretq  
}
  8003e8:	90                   	nop
  8003e9:	5d                   	pop    rbp
  8003ea:	c3                   	ret    

00000000008003eb <debug>:

void debug(){
  8003eb:	f3 0f 1e fa          	endbr64 
  8003ef:	55                   	push   rbp
  8003f0:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003f3:	fa                   	cli    
    //puts("debug");
    eoi();
  8003f4:	b8 00 00 00 00       	mov    eax,0x0
  8003f9:	e8 61 45 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8003fe:	fb                   	sti    
  8003ff:	c9                   	leave  
  800400:	48 cf                	iretq  
}
  800402:	90                   	nop
  800403:	5d                   	pop    rbp
  800404:	c3                   	ret    

0000000000800405 <default_int_proc>:
void default_int_proc(){
  800405:	f3 0f 1e fa          	endbr64 
  800409:	55                   	push   rbp
  80040a:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80040d:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  80040e:	b8 00 00 00 00       	mov    eax,0x0
  800413:	e8 47 45 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800418:	fb                   	sti    
  800419:	c9                   	leave  
  80041a:	48 cf                	iretq  
}
  80041c:	90                   	nop
  80041d:	5d                   	pop    rbp
  80041e:	c3                   	ret    

000000000080041f <breakpoint>:
void breakpoint(){
  80041f:	f3 0f 1e fa          	endbr64 
  800423:	55                   	push   rbp
  800424:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800427:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  800428:	b8 00 00 00 00       	mov    eax,0x0
  80042d:	e8 2d 45 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800432:	fb                   	sti    
  800433:	c9                   	leave  
  800434:	48 cf                	iretq  
}
  800436:	90                   	nop
  800437:	5d                   	pop    rbp
  800438:	c3                   	ret    

0000000000800439 <overflow>:
void overflow(){
  800439:	f3 0f 1e fa          	endbr64 
  80043d:	55                   	push   rbp
  80043e:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800441:	fa                   	cli    
    //puts("overflow");
    eoi();
  800442:	b8 00 00 00 00       	mov    eax,0x0
  800447:	e8 13 45 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80044c:	fb                   	sti    
  80044d:	c9                   	leave  
  80044e:	48 cf                	iretq  
}
  800450:	90                   	nop
  800451:	5d                   	pop    rbp
  800452:	c3                   	ret    

0000000000800453 <bounds>:
void bounds(){
  800453:	f3 0f 1e fa          	endbr64 
  800457:	55                   	push   rbp
  800458:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80045b:	fa                   	cli    
    //puts("bounds");
    eoi();
  80045c:	b8 00 00 00 00       	mov    eax,0x0
  800461:	e8 f9 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800466:	fb                   	sti    
  800467:	c9                   	leave  
  800468:	48 cf                	iretq  
}
  80046a:	90                   	nop
  80046b:	5d                   	pop    rbp
  80046c:	c3                   	ret    

000000000080046d <undefined_operator>:
void undefined_operator(){
  80046d:	f3 0f 1e fa          	endbr64 
  800471:	55                   	push   rbp
  800472:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  800475:	b8 00 00 00 00       	mov    eax,0x0
  80047a:	e8 e0 44 00 00       	call   80495f <eoi>
    report_back_trace_of_err();
  80047f:	b8 00 00 00 00       	mov    eax,0x0
  800484:	e8 02 45 00 00       	call   80498b <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  800489:	eb fe                	jmp    800489 <undefined_operator+0x1c>
  80048b:	c9                   	leave  
  80048c:	48 cf                	iretq  
}
  80048e:	90                   	nop
  80048f:	5d                   	pop    rbp
  800490:	c3                   	ret    

0000000000800491 <coprocessor_notexist>:
void coprocessor_notexist(){
  800491:	f3 0f 1e fa          	endbr64 
  800495:	55                   	push   rbp
  800496:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800499:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  80049a:	b8 00 00 00 00       	mov    eax,0x0
  80049f:	e8 bb 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004a4:	fb                   	sti    
  8004a5:	c9                   	leave  
  8004a6:	48 cf                	iretq  
}
  8004a8:	90                   	nop
  8004a9:	5d                   	pop    rbp
  8004aa:	c3                   	ret    

00000000008004ab <double_ints>:
void double_ints(){
  8004ab:	f3 0f 1e fa          	endbr64 
  8004af:	55                   	push   rbp
  8004b0:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004b3:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  8004b4:	b8 00 00 00 00       	mov    eax,0x0
  8004b9:	e8 a1 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004be:	fb                   	sti    
  8004bf:	c9                   	leave  
  8004c0:	48 cf                	iretq  
}
  8004c2:	90                   	nop
  8004c3:	5d                   	pop    rbp
  8004c4:	c3                   	ret    

00000000008004c5 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  8004c5:	f3 0f 1e fa          	endbr64 
  8004c9:	55                   	push   rbp
  8004ca:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  8004cd:	b8 00 00 00 00       	mov    eax,0x0
  8004d2:	e8 88 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("leave \r\n iretq");
  8004d7:	c9                   	leave  
  8004d8:	48 cf                	iretq  
}
  8004da:	90                   	nop
  8004db:	5d                   	pop    rbp
  8004dc:	c3                   	ret    

00000000008004dd <invalid_tss>:
void invalid_tss(){
  8004dd:	f3 0f 1e fa          	endbr64 
  8004e1:	55                   	push   rbp
  8004e2:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004e5:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  8004e6:	b8 00 00 00 00       	mov    eax,0x0
  8004eb:	e8 6f 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004f0:	fb                   	sti    
  8004f1:	c9                   	leave  
  8004f2:	48 cf                	iretq  
}
  8004f4:	90                   	nop
  8004f5:	5d                   	pop    rbp
  8004f6:	c3                   	ret    

00000000008004f7 <segment_notexist>:
void segment_notexist(){
  8004f7:	f3 0f 1e fa          	endbr64 
  8004fb:	55                   	push   rbp
  8004fc:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004ff:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  800500:	b8 00 00 00 00       	mov    eax,0x0
  800505:	e8 55 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80050a:	fb                   	sti    
  80050b:	c9                   	leave  
  80050c:	48 cf                	iretq  
}
  80050e:	90                   	nop
  80050f:	5d                   	pop    rbp
  800510:	c3                   	ret    

0000000000800511 <stackseg_overbound>:
void stackseg_overbound(){
  800511:	f3 0f 1e fa          	endbr64 
  800515:	55                   	push   rbp
  800516:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800519:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  80051a:	b8 00 00 00 00       	mov    eax,0x0
  80051f:	e8 3b 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800524:	fb                   	sti    
  800525:	c9                   	leave  
  800526:	48 cf                	iretq  
}
  800528:	90                   	nop
  800529:	5d                   	pop    rbp
  80052a:	c3                   	ret    

000000000080052b <general_protect>:
void general_protect(){
  80052b:	f3 0f 1e fa          	endbr64 
  80052f:	55                   	push   rbp
  800530:	48 89 e5             	mov    rbp,rsp
  800533:	48 83 ec 10          	sub    rsp,0x10
    asm("cli");
  800537:	fa                   	cli    
    print("general protect.");
  800538:	bf c0 13 81 00       	mov    edi,0x8113c0
  80053d:	e8 93 55 00 00       	call   805ad5 <print>
    int err_code=0;
  800542:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  800549:	b8 00 00 00 00       	mov    eax,0x0
  80054e:	e8 0c 44 00 00       	call   80495f <eoi>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  800553:	eb fe                	jmp    800553 <general_protect+0x28>
  800555:	c9                   	leave  
  800556:	48 cf                	iretq  
}
  800558:	90                   	nop
  800559:	c9                   	leave  
  80055a:	c3                   	ret    

000000000080055b <coprocessor_err>:

void coprocessor_err(){
  80055b:	f3 0f 1e fa          	endbr64 
  80055f:	55                   	push   rbp
  800560:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800563:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  800564:	b8 00 00 00 00       	mov    eax,0x0
  800569:	e8 f1 43 00 00       	call   80495f <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80056e:	fb                   	sti    
  80056f:	c9                   	leave  
  800570:	48 cf                	iretq  
}
  800572:	90                   	nop
  800573:	5d                   	pop    rbp
  800574:	c3                   	ret    

0000000000800575 <syscall>:
int syscall(int func,int b,int c,int d,int e,int f)
{
  800575:	f3 0f 1e fa          	endbr64 
  800579:	55                   	push   rbp
  80057a:	48 89 e5             	mov    rbp,rsp
  80057d:	48 83 ec 20          	sub    rsp,0x20
  800581:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  800584:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  800587:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80058a:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  80058d:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  800591:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
    switch (func)
  800595:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  800599:	0f 87 17 02 00 00    	ja     8007b6 <syscall+0x241>
  80059f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8005a2:	48 8b 04 c5 d8 13 81 	mov    rax,QWORD PTR [rax*8+0x8113d8]
  8005a9:	00 
  8005aa:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005b0:	48 98                	cdqe   
  8005b2:	48 89 c7             	mov    rdi,rax
  8005b5:	e8 5e 23 00 00       	call   802918 <reg_device>
  8005ba:	e9 f7 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 1:return dispose_device(b);
  8005bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005c2:	89 c7                	mov    edi,eax
  8005c4:	e8 ae 2d 00 00       	call   803377 <dispose_device>
  8005c9:	e9 e8 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 2:return reg_driver(b);
  8005ce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d1:	48 98                	cdqe   
  8005d3:	48 89 c7             	mov    rdi,rax
  8005d6:	e8 25 26 00 00       	call   802c00 <reg_driver>
  8005db:	e9 d6 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 3:return dispose_driver(b);
  8005e0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005e3:	48 98                	cdqe   
  8005e5:	48 89 c7             	mov    rdi,rax
  8005e8:	e8 28 2e 00 00       	call   803415 <dispose_driver>
  8005ed:	e9 c4 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005f2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005f5:	48 98                	cdqe   
  8005f7:	48 89 c2             	mov    rdx,rax
  8005fa:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800600:	89 ce                	mov    esi,ecx
  800602:	89 c7                	mov    edi,eax
  800604:	e8 17 2b 00 00       	call   803120 <call_drv_func>
  800609:	e9 a8 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 5:return req_page_at(b,c);
  80060e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800611:	48 98                	cdqe   
  800613:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800616:	89 d6                	mov    esi,edx
  800618:	48 89 c7             	mov    rdi,rax
  80061b:	e8 e5 0e 00 00       	call   801505 <req_page_at>
  800620:	e9 91 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 6:return free_page(b);
  800625:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800628:	48 98                	cdqe   
  80062a:	48 89 c7             	mov    rdi,rax
  80062d:	e8 04 0d 00 00       	call   801336 <free_page>
  800632:	e9 7f 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 7:return reg_proc(b, c, d);
  800637:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80063a:	48 98                	cdqe   
  80063c:	48 89 c2             	mov    rdx,rax
  80063f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800642:	48 98                	cdqe   
  800644:	48 89 c1             	mov    rcx,rax
  800647:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80064a:	48 89 ce             	mov    rsi,rcx
  80064d:	89 c7                	mov    edi,eax
  80064f:	e8 c2 3e 00 00       	call   804516 <reg_proc>
  800654:	e9 5d 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 8:del_proc(b);
  800659:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80065c:	89 c7                	mov    edi,eax
  80065e:	e8 90 3c 00 00       	call   8042f3 <del_proc>
        case 10:chk_vm(b,c);
  800663:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800666:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800669:	89 d6                	mov    esi,edx
  80066b:	89 c7                	mov    edi,eax
  80066d:	e8 55 0f 00 00       	call   8015c7 <chk_vm>
        case 11:return sys_open(b,c);
  800672:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800675:	48 98                	cdqe   
  800677:	48 89 c2             	mov    rdx,rax
  80067a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80067d:	89 c6                	mov    esi,eax
  80067f:	48 89 d7             	mov    rdi,rdx
  800682:	e8 24 13 00 00       	call   8019ab <sys_open>
  800687:	e9 2a 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 12:return sys_close(b);
  80068c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 de 17 00 00       	call   801e74 <sys_close>
  800696:	e9 1b 01 00 00       	jmp    8007b6 <syscall+0x241>
        case 13:return sys_read(b,c,d);
  80069b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80069e:	48 98                	cdqe   
  8006a0:	48 89 c1             	mov    rcx,rax
  8006a3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a9:	48 89 ce             	mov    rsi,rcx
  8006ac:	89 c7                	mov    edi,eax
  8006ae:	e8 d7 18 00 00       	call   801f8a <sys_read>
  8006b3:	e9 fe 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006bb:	48 98                	cdqe   
  8006bd:	48 89 c1             	mov    rcx,rax
  8006c0:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006c6:	48 89 ce             	mov    rsi,rcx
  8006c9:	89 c7                	mov    edi,eax
  8006cb:	e8 29 18 00 00       	call   801ef9 <sys_write>
  8006d0:	e9 e1 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006d5:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d8:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006de:	89 ce                	mov    esi,ecx
  8006e0:	89 c7                	mov    edi,eax
  8006e2:	e8 34 19 00 00       	call   80201b <sys_seek>
  8006e7:	e9 ca 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 16:return sys_tell(b);
  8006ec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006ef:	89 c7                	mov    edi,eax
  8006f1:	e8 6c 19 00 00       	call   802062 <sys_tell>
  8006f6:	e9 bb 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006fb:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006fe:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800701:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800704:	89 ce                	mov    esi,ecx
  800706:	89 c7                	mov    edi,eax
  800708:	b8 00 00 00 00       	mov    eax,0x0
  80070d:	e8 8e 11 00 00       	call   8018a0 <reg_vol>
  800712:	e9 9f 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 18:return free_vol(b);
  800717:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80071a:	89 c7                	mov    edi,eax
  80071c:	b8 00 00 00 00       	mov    eax,0x0
  800721:	e8 5e 11 00 00       	call   801884 <free_vol>
  800726:	e9 8b 00 00 00       	jmp    8007b6 <syscall+0x241>
        case 19:return execute(b);
  80072b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80072e:	48 98                	cdqe   
  800730:	48 89 c7             	mov    rdi,rax
  800733:	e8 e0 44 00 00       	call   804c18 <execute>
  800738:	eb 7c                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  80073a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80073d:	89 c7                	mov    edi,eax
  80073f:	e8 b1 3d 00 00       	call   8044f5 <sys_exit>
  800744:	eb 70                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  800746:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800749:	48 98                	cdqe   
  80074b:	48 89 c7             	mov    rdi,rax
  80074e:	e8 c0 45 00 00       	call   804d13 <exec_call>
  800753:	eb 61                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800755:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800758:	89 c7                	mov    edi,eax
  80075a:	e8 c6 0f 00 00       	call   801725 <sys_mkfifo>
  80075f:	eb 55                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  800761:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800764:	89 c7                	mov    edi,eax
  800766:	e8 61 3f 00 00       	call   8046cc <sys_malloc>
  80076b:	eb 49                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  80076d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800770:	89 c7                	mov    edi,eax
  800772:	e8 e3 40 00 00       	call   80485a <sys_free>
  800777:	eb 3d                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800779:	b8 00 00 00 00       	mov    eax,0x0
  80077e:	e8 a4 56 00 00       	call   805e27 <sys_getkbc>
  800783:	0f be c0             	movsx  eax,al
  800786:	eb 2e                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800788:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80078b:	48 98                	cdqe   
  80078d:	48 89 c7             	mov    rdi,rax
  800790:	e8 bb 25 00 00       	call   802d50 <sys_find_dev>
  800795:	eb 1f                	jmp    8007b6 <syscall+0x241>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  800797:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80079a:	48 98                	cdqe   
  80079c:	48 89 c2             	mov    rdx,rax
  80079f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007a2:	48 98                	cdqe   
  8007a4:	48 89 c1             	mov    rcx,rax
  8007a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8007aa:	89 c6                	mov    esi,eax
  8007ac:	48 89 cf             	mov    rdi,rcx
  8007af:	e8 2e 26 00 00       	call   802de2 <sys_operate_dev>
  8007b4:	eb 00                	jmp    8007b6 <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
  8007b6:	c9                   	leave  
  8007b7:	c3                   	ret    

00000000008007b8 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  8007b8:	f3 0f 1e fa          	endbr64 
  8007bc:	55                   	push   rbp
  8007bd:	48 89 e5             	mov    rbp,rsp
  8007c0:	48 83 ec 60          	sub    rsp,0x60
  8007c4:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8007c7:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  8007cb:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8007d2:	00 
    mbi=(struct multiboot_header*)addr;
  8007d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007d7:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  8007db:	b8 00 00 00 00       	mov    eax,0x0
  8007e0:	e8 51 03 00 00       	call   800b36 <init_logging>
        
    }
    //获取tags
    struct multiboot_tag *tag;
	unsigned size;
    size = *(unsigned long*)addr;
  8007e5:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007e9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8007ec:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  8007ef:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007f3:	48 83 c0 08          	add    rax,0x8
  8007f7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8007fb:	e9 90 02 00 00       	jmp    800a90 <main+0x2d8>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800800:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800804:	8b 00                	mov    eax,DWORD PTR [rax]
  800806:	83 f8 08             	cmp    eax,0x8
  800809:	0f 87 6e 02 00 00    	ja     800a7d <main+0x2c5>
  80080f:	89 c0                	mov    eax,eax
  800811:	48 8b 04 c5 30 17 81 	mov    rax,QWORD PTR [rax*8+0x811730]
  800818:	00 
  800819:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  80081c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800820:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800823:	89 c7                	mov    edi,eax
  800825:	e8 8d 08 00 00       	call   8010b7 <set_high_mem_base>
			break;
  80082a:	e9 4e 02 00 00       	jmp    800a7d <main+0x2c5>
		{
			multiboot_memory_map_t *mmap;

			//printf("mmap\n");

			for (mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  80082f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800833:	48 83 c0 10          	add    rax,0x10
  800837:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80083b:	eb 66                	jmp    8008a3 <main+0xeb>
//					   (unsigned)(mmap->addr >> 32),
//					   (unsigned)(mmap->addr & 0xffffffff),
//					   (unsigned)(mmap->len >> 32),
//					   (unsigned)(mmap->len & 0xffffffff),
//					   (unsigned)mmap->type);
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  80083d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800841:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
					   " length = 0x%x%x, type = 0x%x,",
  800844:	89 c2                	mov    edx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  800846:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80084a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
					   " length = 0x%x%x, type = 0x%x,",
  80084e:	89 c1                	mov    ecx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  800850:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800854:	48 8b 00             	mov    rax,QWORD PTR [rax]
					   " length = 0x%x%x, type = 0x%x,",
  800857:	89 ce                	mov    esi,ecx
  800859:	89 c7                	mov    edi,eax
  80085b:	e8 6e 08 00 00       	call   8010ce <set_mem_area>
					switch (mmap->type)
  800860:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800864:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800867:	83 f8 05             	cmp    eax,0x5
  80086a:	74 19                	je     800885 <main+0xcd>
  80086c:	83 f8 05             	cmp    eax,0x5
  80086f:	77 17                	ja     800888 <main+0xd0>
  800871:	83 f8 04             	cmp    eax,0x4
  800874:	74 15                	je     80088b <main+0xd3>
  800876:	83 f8 04             	cmp    eax,0x4
  800879:	77 0d                	ja     800888 <main+0xd0>
  80087b:	83 f8 01             	cmp    eax,0x1
  80087e:	74 0e                	je     80088e <main+0xd6>
  800880:	83 f8 03             	cmp    eax,0x3
						//printf("available RAM\n");
						break;
					
					case 3:
						//printf("ACPI info\n");
						break;
  800883:	eb 0a                	jmp    80088f <main+0xd7>
					case 4:
						//printf("reserved mem needed to preserve on hibernation\n");
						break;
					case 5:
						//printf("defected mem\n");
						break;
  800885:	90                   	nop
  800886:	eb 07                	jmp    80088f <main+0xd7>
					default:
						//printf("reserved mem\n");
						break;
  800888:	90                   	nop
  800889:	eb 04                	jmp    80088f <main+0xd7>
						break;
  80088b:	90                   	nop
  80088c:	eb 01                	jmp    80088f <main+0xd7>
						break;
  80088e:	90                   	nop
				 mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  80088f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800893:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800896:	89 c2                	mov    edx,eax
  800898:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80089c:	48 01 d0             	add    rax,rdx
  80089f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
				 (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008a7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008aa:	89 c2                	mov    edx,eax
  8008ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008b0:	48 01 d0             	add    rax,rdx
  8008b3:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008b7:	72 84                	jb     80083d <main+0x85>
					}

				}
		}
		break;
  8008b9:	e9 bf 01 00 00       	jmp    800a7d <main+0x2c5>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008c2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008c6:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  8008cd:	00 00 00 
  8008d0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			set_framebuffer(*tagfb);
  8008d4:	48 83 ec 08          	sub    rsp,0x8
  8008d8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008dc:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008df:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008e2:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008e5:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008e8:	ff 30                	push   QWORD PTR [rax]
  8008ea:	e8 ac 4e 00 00       	call   80579b <set_framebuffer>
  8008ef:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008f3:	b8 00 00 00 00       	mov    eax,0x0
  8008f8:	e8 e3 4c 00 00       	call   8055e0 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008fd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800901:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800905:	0f b6 c0             	movzx  eax,al
  800908:	83 f8 02             	cmp    eax,0x2
  80090b:	0f 84 5a 01 00 00    	je     800a6b <main+0x2b3>
  800911:	83 f8 02             	cmp    eax,0x2
  800914:	0f 8f 5a 01 00 00    	jg     800a74 <main+0x2bc>
  80091a:	85 c0                	test   eax,eax
  80091c:	74 0e                	je     80092c <main+0x174>
  80091e:	83 f8 01             	cmp    eax,0x1
  800921:	0f 84 15 01 00 00    	je     800a3c <main+0x284>
  800927:	e9 48 01 00 00       	jmp    800a74 <main+0x2bc>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  80092c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800930:	48 83 c0 22          	add    rax,0x22
  800934:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800938:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  80093f:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800946:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80094d:	e9 d4 00 00 00       	jmp    800a26 <main+0x26e>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800952:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800955:	48 89 d0             	mov    rax,rdx
  800958:	48 01 c0             	add    rax,rax
  80095b:	48 01 c2             	add    rdx,rax
  80095e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800962:	48 01 d0             	add    rax,rdx
  800965:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800969:	0f b6 c0             	movzx  eax,al
  80096c:	ba ff 00 00 00       	mov    edx,0xff
  800971:	89 d1                	mov    ecx,edx
  800973:	29 c1                	sub    ecx,eax
  800975:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800978:	48 89 d0             	mov    rax,rdx
  80097b:	48 01 c0             	add    rax,rax
  80097e:	48 01 c2             	add    rdx,rax
  800981:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800985:	48 01 d0             	add    rax,rdx
  800988:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80098c:	0f b6 d0             	movzx  edx,al
  80098f:	b8 ff 00 00 00       	mov    eax,0xff
  800994:	29 d0                	sub    eax,edx
  800996:	89 ce                	mov    esi,ecx
  800998:	0f af f0             	imul   esi,eax
  80099b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80099e:	48 89 d0             	mov    rax,rdx
  8009a1:	48 01 c0             	add    rax,rax
  8009a4:	48 01 c2             	add    rdx,rax
  8009a7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ab:	48 01 d0             	add    rax,rdx
  8009ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009b1:	0f b6 c8             	movzx  ecx,al
  8009b4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b7:	48 89 d0             	mov    rax,rdx
  8009ba:	48 01 c0             	add    rax,rax
  8009bd:	48 01 c2             	add    rdx,rax
  8009c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c4:	48 01 d0             	add    rax,rdx
  8009c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009ca:	0f b6 c0             	movzx  eax,al
  8009cd:	0f af c1             	imul   eax,ecx
  8009d0:	01 c6                	add    esi,eax
  8009d2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009d5:	48 89 d0             	mov    rax,rdx
  8009d8:	48 01 c0             	add    rax,rax
  8009db:	48 01 c2             	add    rdx,rax
  8009de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009e2:	48 01 d0             	add    rax,rdx
  8009e5:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009e9:	0f b6 c8             	movzx  ecx,al
  8009ec:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ef:	48 89 d0             	mov    rax,rdx
  8009f2:	48 01 c0             	add    rax,rax
  8009f5:	48 01 c2             	add    rdx,rax
  8009f8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009fc:	48 01 d0             	add    rax,rdx
  8009ff:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a03:	0f b6 c0             	movzx  eax,al
  800a06:	0f af c1             	imul   eax,ecx
  800a09:	01 f0                	add    eax,esi
  800a0b:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a0e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a11:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a14:	73 0c                	jae    800a22 <main+0x26a>
					{
						color = i;
  800a16:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a19:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a1c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a1f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a22:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a26:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a2a:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a2e:	0f b7 c0             	movzx  eax,ax
  800a31:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a34:	0f 82 18 ff ff ff    	jb     800952 <main+0x19a>
					}
				}
			}
			break;
  800a3a:	eb 40                	jmp    800a7c <main+0x2c4>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a3c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a40:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a44:	0f b6 c0             	movzx  eax,al
  800a47:	ba 01 00 00 00       	mov    edx,0x1
  800a4c:	89 c1                	mov    ecx,eax
  800a4e:	d3 e2                	shl    edx,cl
  800a50:	89 d0                	mov    eax,edx
  800a52:	8d 50 ff             	lea    edx,[rax-0x1]
  800a55:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a59:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a5d:	0f b6 c0             	movzx  eax,al
  800a60:	89 c1                	mov    ecx,eax
  800a62:	d3 e2                	shl    edx,cl
  800a64:	89 d0                	mov    eax,edx
  800a66:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a69:	eb 11                	jmp    800a7c <main+0x2c4>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a6b:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a72:	eb 08                	jmp    800a7c <main+0x2c4>

			default:
				color = 0xffffffff;
  800a74:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a7b:	90                   	nop
			}

			break;
  800a7c:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a81:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a84:	83 c0 07             	add    eax,0x7
  800a87:	89 c0                	mov    eax,eax
  800a89:	83 e0 f8             	and    eax,0xfffffff8
  800a8c:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800a90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a94:	8b 00                	mov    eax,DWORD PTR [rax]
  800a96:	85 c0                	test   eax,eax
  800a98:	0f 85 62 fd ff ff    	jne    800800 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800a9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800aa2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800aa5:	83 c0 07             	add    eax,0x7
  800aa8:	89 c0                	mov    eax,eax
  800aaa:	83 e0 f8             	and    eax,0xfffffff8
  800aad:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800ab1:	b8 75 04 00 00       	mov    eax,0x475
  800ab6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ab9:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800abc:	b8 00 00 00 00       	mov    eax,0x0
  800ac1:	e8 df 4b 00 00       	call   8056a5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ac6:	bf 00 17 81 00       	mov    edi,0x811700
  800acb:	e8 05 50 00 00       	call   805ad5 <print>
//    init_com(PORT_COM1);
//    com_puts("gamessis os loaded.",PORT_COM1);
	init_paging();
  800ad0:	b8 00 00 00 00       	mov    eax,0x0
  800ad5:	e8 b9 05 00 00       	call   801093 <init_paging>
// 	init_gdt();
	init_int();
  800ada:	b8 00 00 00 00       	mov    eax,0x0
  800adf:	e8 1c f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800ae4:	bf 1d 17 81 00       	mov    edi,0x81171d
  800ae9:	e8 e7 4f 00 00       	call   805ad5 <print>
	init_memory();
  800aee:	b8 00 00 00 00       	mov    eax,0x0
  800af3:	e8 63 07 00 00       	call   80125b <init_memory>
	init_drvdev_man();
  800af8:	b8 00 00 00 00       	mov    eax,0x0
  800afd:	e8 fc 1d 00 00       	call   8028fe <init_drvdev_man>
	init_proc();
  800b02:	b8 00 00 00 00       	mov    eax,0x0
  800b07:	e8 dd 2c 00 00       	call   8037e9 <init_proc>
    //自带驱动
    init_tty();
  800b0c:	b8 00 00 00 00       	mov    eax,0x0
  800b11:	e8 08 80 00 00       	call   808b1e <init_tty>
    init_kb();
  800b16:	b8 00 00 00 00       	mov    eax,0x0
  800b1b:	e8 11 52 00 00       	call   805d31 <init_kb>
    init_disk();
  800b20:	b8 00 00 00 00       	mov    eax,0x0
  800b25:	e8 61 53 00 00       	call   805e8b <init_disk>

	//init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800b2a:	c7 05 34 92 00 00 00 	mov    DWORD PTR [rip+0x9234],0x0        # 809d68 <manage_proc_lock>
  800b31:	00 00 00 
    while (1);
  800b34:	eb fe                	jmp    800b34 <main+0x37c>

0000000000800b36 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b36:	f3 0f 1e fa          	endbr64 
  800b3a:	55                   	push   rbp
  800b3b:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b3e:	48 c7 05 b7 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4b7],0xb8000        # 400000 <video>
  800b45:	00 80 0b 00 
    xpos=0;
  800b49:	c7 05 b5 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4b5],0x0        # 400008 <xpos>
  800b50:	00 00 00 
    ypos=0;
  800b53:	c7 05 af f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4af],0x0        # 40000c <ypos>
  800b5a:	00 00 00 
}
  800b5d:	90                   	nop
  800b5e:	5d                   	pop    rbp
  800b5f:	c3                   	ret    

0000000000800b60 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b60:	f3 0f 1e fa          	endbr64 
  800b64:	55                   	push   rbp
  800b65:	48 89 e5             	mov    rbp,rsp
  800b68:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b6c:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b6f:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b72:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b76:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b7a:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b7d:	48 98                	cdqe   
  800b7f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b83:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b8a:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b8e:	75 27                	jne    800bb7 <itoa+0x57>
  800b90:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b94:	79 21                	jns    800bb7 <itoa+0x57>
    {
        *p++ = '-';
  800b96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b9a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800b9e:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800ba2:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800ba5:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800baa:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bad:	f7 d8                	neg    eax
  800baf:	48 98                	cdqe   
  800bb1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bb5:	eb 0d                	jmp    800bc4 <itoa+0x64>
    }
    else if (base == 'x')
  800bb7:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bbb:	75 07                	jne    800bc4 <itoa+0x64>
        divisor = 16;
  800bbd:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bc4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bc7:	48 63 c8             	movsxd rcx,eax
  800bca:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bce:	ba 00 00 00 00       	mov    edx,0x0
  800bd3:	48 f7 f1             	div    rcx
  800bd6:	48 89 d0             	mov    rax,rdx
  800bd9:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800bdc:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800be0:	7f 0a                	jg     800bec <itoa+0x8c>
  800be2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800be5:	83 c0 30             	add    eax,0x30
  800be8:	89 c1                	mov    ecx,eax
  800bea:	eb 08                	jmp    800bf4 <itoa+0x94>
  800bec:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bef:	83 c0 57             	add    eax,0x57
  800bf2:	89 c1                	mov    ecx,eax
  800bf4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bf8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bfc:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c00:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c02:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c05:	48 63 f0             	movsxd rsi,eax
  800c08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c0c:	ba 00 00 00 00       	mov    edx,0x0
  800c11:	48 f7 f6             	div    rsi
  800c14:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c18:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c1d:	75 a5                	jne    800bc4 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c23:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c26:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c2a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c32:	48 83 e8 01          	sub    rax,0x1
  800c36:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c3a:	eb 2b                	jmp    800c67 <itoa+0x107>
    {
        char tmp = *p1;
  800c3c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c43:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c46:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c4a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c4d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c51:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c57:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c5b:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c5d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c62:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c6b:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c6f:	72 cb                	jb     800c3c <itoa+0xdc>
    }
}
  800c71:	90                   	nop
  800c72:	90                   	nop
  800c73:	5d                   	pop    rbp
  800c74:	c3                   	ret    

0000000000800c75 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (int c)
{
  800c75:	f3 0f 1e fa          	endbr64 
  800c79:	55                   	push   rbp
  800c7a:	48 89 e5             	mov    rbp,rsp
  800c7d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if (c == '\n' || c == '\r')
  800c80:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  800c84:	74 06                	je     800c8c <putchar+0x17>
  800c86:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  800c8a:	75 38                	jne    800cc4 <putchar+0x4f>
    {
newline:
  800c8c:	90                   	nop
  800c8d:	eb 01                	jmp    800c90 <putchar+0x1b>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
  800c8f:	90                   	nop
        xpos = 0;
  800c90:	c7 05 6e f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff36e],0x0        # 400008 <xpos>
  800c97:	00 00 00 
        ypos++;
  800c9a:	8b 05 6c f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff36c]        # 40000c <ypos>
  800ca0:	83 c0 01             	add    eax,0x1
  800ca3:	89 05 63 f3 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff363],eax        # 40000c <ypos>
        if (ypos >= LINES)
  800ca9:	8b 05 5d f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff35d]        # 40000c <ypos>
  800caf:	83 f8 17             	cmp    eax,0x17
  800cb2:	0f 8e 88 00 00 00    	jle    800d40 <putchar+0xcb>
            ypos = 0;
  800cb8:	c7 05 4a f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff34a],0x0        # 40000c <ypos>
  800cbf:	00 00 00 
        return;
  800cc2:	eb 7c                	jmp    800d40 <putchar+0xcb>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
  800cc4:	48 8b 0d 35 f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff335]        # 400000 <video>
  800ccb:	8b 15 3b f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff33b]        # 40000c <ypos>
  800cd1:	89 d0                	mov    eax,edx
  800cd3:	c1 e0 02             	shl    eax,0x2
  800cd6:	01 d0                	add    eax,edx
  800cd8:	c1 e0 04             	shl    eax,0x4
  800cdb:	89 c2                	mov    edx,eax
  800cdd:	8b 05 25 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff325]        # 400008 <xpos>
  800ce3:	01 d0                	add    eax,edx
  800ce5:	01 c0                	add    eax,eax
  800ce7:	48 98                	cdqe   
  800ce9:	48 01 c8             	add    rax,rcx
  800cec:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  800cef:	88 10                	mov    BYTE PTR [rax],dl
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
  800cf1:	48 8b 0d 08 f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff308]        # 400000 <video>
  800cf8:	8b 15 0e f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff30e]        # 40000c <ypos>
  800cfe:	89 d0                	mov    eax,edx
  800d00:	c1 e0 02             	shl    eax,0x2
  800d03:	01 d0                	add    eax,edx
  800d05:	c1 e0 04             	shl    eax,0x4
  800d08:	89 c2                	mov    edx,eax
  800d0a:	8b 05 f8 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2f8]        # 400008 <xpos>
  800d10:	01 d0                	add    eax,edx
  800d12:	01 c0                	add    eax,eax
  800d14:	48 98                	cdqe   
  800d16:	48 83 c0 01          	add    rax,0x1
  800d1a:	48 01 c8             	add    rax,rcx
  800d1d:	c6 00 07             	mov    BYTE PTR [rax],0x7
    xpos++;
  800d20:	8b 05 e2 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2e2]        # 400008 <xpos>
  800d26:	83 c0 01             	add    eax,0x1
  800d29:	89 05 d9 f2 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff2d9],eax        # 400008 <xpos>
    if (xpos >= COLUMNS)
  800d2f:	8b 05 d3 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2d3]        # 400008 <xpos>
  800d35:	83 f8 4f             	cmp    eax,0x4f
  800d38:	0f 8f 51 ff ff ff    	jg     800c8f <putchar+0x1a>
  800d3e:	eb 01                	jmp    800d41 <putchar+0xcc>
        return;
  800d40:	90                   	nop
}
  800d41:	5d                   	pop    rbp
  800d42:	c3                   	ret    

0000000000800d43 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d43:	f3 0f 1e fa          	endbr64 
  800d47:	55                   	push   rbp
  800d48:	48 89 e5             	mov    rbp,rsp
  800d4b:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d52:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d59:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d60:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d67:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d6e:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d75:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d7c:	84 c0                	test   al,al
  800d7e:	74 20                	je     800da0 <printf+0x5d>
  800d80:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d84:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d88:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d8c:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d90:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d94:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d98:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d9c:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800da0:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800da7:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800dae:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800db5:	08 
 
    while ((c = *format++) != 0)
  800db6:	e9 38 01 00 00       	jmp    800ef3 <printf+0x1b0>
    {
        if (c != '%')
  800dbb:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800dc2:	74 12                	je     800dd6 <printf+0x93>
            putchar (c);
  800dc4:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800dca:	89 c7                	mov    edi,eax
  800dcc:	e8 a4 fe ff ff       	call   800c75 <putchar>
  800dd1:	e9 1d 01 00 00       	jmp    800ef3 <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800dd6:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ddd:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800de1:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800de8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800deb:	0f be c0             	movsx  eax,al
  800dee:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800df4:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800dfb:	74 3a                	je     800e37 <printf+0xf4>
  800dfd:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800e04:	0f 8f cd 00 00 00    	jg     800ed7 <printf+0x194>
  800e0a:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800e11:	74 24                	je     800e37 <printf+0xf4>
  800e13:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800e1a:	0f 8f b7 00 00 00    	jg     800ed7 <printf+0x194>
  800e20:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800e27:	74 0e                	je     800e37 <printf+0xf4>
  800e29:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800e30:	74 40                	je     800e72 <printf+0x12f>
  800e32:	e9 a0 00 00 00       	jmp    800ed7 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800e37:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e3e:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e42:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e49:	8b 10                	mov    edx,DWORD PTR [rax]
  800e4b:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800e51:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e58:	89 ce                	mov    esi,ecx
  800e5a:	48 89 c7             	mov    rdi,rax
  800e5d:	e8 fe fc ff ff       	call   800b60 <itoa>
                p = buf;
  800e62:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e69:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e70:	eb 34                	jmp    800ea6 <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800e72:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e79:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e7d:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e84:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e87:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e8e:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e95:	00 
  800e96:	75 0d                	jne    800ea5 <printf+0x162>
                    p = "(null)";
  800e98:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811778
  800e9f:	78 17 81 00 
  800ea3:	eb 22                	jmp    800ec7 <printf+0x184>
 
string:
  800ea5:	90                   	nop
                while (*p)
  800ea6:	eb 1f                	jmp    800ec7 <printf+0x184>
                    putchar (*p++);
  800ea8:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800eaf:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800eb3:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800eba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ebd:	0f be c0             	movsx  eax,al
  800ec0:	89 c7                	mov    edi,eax
  800ec2:	e8 ae fd ff ff       	call   800c75 <putchar>
                while (*p)
  800ec7:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800ece:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ed1:	84 c0                	test   al,al
  800ed3:	75 d3                	jne    800ea8 <printf+0x165>
                break;
  800ed5:	eb 1c                	jmp    800ef3 <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800ed7:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800ede:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800ee2:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ee9:	8b 00                	mov    eax,DWORD PTR [rax]
  800eeb:	89 c7                	mov    edi,eax
  800eed:	e8 83 fd ff ff       	call   800c75 <putchar>
                break;
  800ef2:	90                   	nop
    while ((c = *format++) != 0)
  800ef3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800efa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800efe:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800f05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800f08:	0f be c0             	movsx  eax,al
  800f0b:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800f11:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  800f18:	0f 85 9d fe ff ff    	jne    800dbb <printf+0x78>
            }
        }
    }
}
  800f1e:	90                   	nop
  800f1f:	90                   	nop
  800f20:	c9                   	leave  
  800f21:	c3                   	ret    

0000000000800f22 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800f22:	f3 0f 1e fa          	endbr64 
  800f26:	55                   	push   rbp
  800f27:	48 89 e5             	mov    rbp,rsp
  800f2a:	48 83 ec 40          	sub    rsp,0x40
  800f2e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800f32:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800f36:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800f39:	48 8b 15 40 8e 00 00 	mov    rdx,QWORD PTR [rip+0x8e40]        # 809d80 <pml4>
  800f40:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f44:	48 c1 e8 27          	shr    rax,0x27
  800f48:	48 c1 e0 03          	shl    rax,0x3
  800f4c:	48 01 d0             	add    rax,rdx
  800f4f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f52:	b0 00                	mov    al,0x0
  800f54:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f58:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f5f:	00 00 00 
  800f62:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f66:	48 c1 e8 1e          	shr    rax,0x1e
  800f6a:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f6d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f70:	48 98                	cdqe   
  800f72:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f79:	00 
  800f7a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f7e:	48 01 d0             	add    rax,rdx
  800f81:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f84:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f8c:	83 e0 01             	and    eax,0x1
  800f8f:	48 85 c0             	test   rax,rax
  800f92:	75 2f                	jne    800fc3 <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800f94:	b8 00 00 00 00       	mov    eax,0x0
  800f99:	e8 b3 01 00 00       	call   801151 <vmalloc>
  800f9e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800fa2:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fa5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800fa9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800fac:	48 98                	cdqe   
  800fae:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fb5:	00 
  800fb6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800fba:	48 01 f0             	add    rax,rsi
  800fbd:	48 09 ca             	or     rdx,rcx
  800fc0:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800fc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fc7:	b0 00                	mov    al,0x0
  800fc9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fcd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fd1:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fd6:	48 c1 e8 15          	shr    rax,0x15
  800fda:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fe1:	00 
  800fe2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fe6:	48 01 d0             	add    rax,rdx
  800fe9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800ff0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ff4:	83 e0 01             	and    eax,0x1
  800ff7:	48 85 c0             	test   rax,rax
  800ffa:	75 37                	jne    801033 <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800ffc:	b8 00 00 00 00       	mov    eax,0x0
  801001:	e8 4b 01 00 00       	call   801151 <vmalloc>
  801006:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  80100a:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80100d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801011:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801015:	25 ff ff ff 3f       	and    eax,0x3fffffff
  80101a:	48 c1 e8 15          	shr    rax,0x15
  80101e:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801025:	00 
  801026:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80102a:	48 01 f0             	add    rax,rsi
  80102d:	48 09 ca             	or     rdx,rcx
  801030:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801033:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801037:	b0 00                	mov    al,0x0
  801039:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80103d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801040:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801044:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  80104a:	48 c1 ea 0c          	shr    rdx,0xc
  80104e:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801055:	00 
  801056:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80105a:	48 01 ca             	add    rdx,rcx
  80105d:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801061:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801064:	b8 00 00 00 00       	mov    eax,0x0
}
  801069:	c9                   	leave  
  80106a:	c3                   	ret    

000000000080106b <mdemap>:

stat_t mdemap(addr_t la)
{
  80106b:	f3 0f 1e fa          	endbr64 
  80106f:	55                   	push   rbp
  801070:	48 89 e5             	mov    rbp,rsp
  801073:	48 83 ec 10          	sub    rsp,0x10
  801077:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80107b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80107f:	ba 00 00 00 00       	mov    edx,0x0
  801084:	48 89 c6             	mov    rsi,rax
  801087:	bf 00 00 00 00       	mov    edi,0x0
  80108c:	e8 91 fe ff ff       	call   800f22 <mmap>
}
  801091:	c9                   	leave  
  801092:	c3                   	ret    

0000000000801093 <init_paging>:
int init_paging()
{
  801093:	f3 0f 1e fa          	endbr64 
  801097:	55                   	push   rbp
  801098:	48 89 e5             	mov    rbp,rsp
                    "mov %%rax,%%cr0":"=m"(page_index));
    #else
    //设置PML4
//    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //设置第一项pdpte，也就是内核空间
    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
  80109b:	48 8b 05 e6 8c 00 00 	mov    rax,QWORD PTR [rip+0x8ce6]        # 809d88 <pdpt>
  8010a2:	ba 02 00 00 00       	mov    edx,0x2
  8010a7:	be 00 00 00 00       	mov    esi,0x0
  8010ac:	48 89 c7             	mov    rdi,rax
  8010af:	e8 a7 03 00 00       	call   80145b <set_1gb_pdpt>
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  8010b4:	90                   	nop
  8010b5:	5d                   	pop    rbp
  8010b6:	c3                   	ret    

00000000008010b7 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  8010b7:	f3 0f 1e fa          	endbr64 
  8010bb:	55                   	push   rbp
  8010bc:	48 89 e5             	mov    rbp,rsp
  8010bf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  8010c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010c5:	89 05 cd 8c 00 00    	mov    DWORD PTR [rip+0x8ccd],eax        # 809d98 <high_mem_base>
}
  8010cb:	90                   	nop
  8010cc:	5d                   	pop    rbp
  8010cd:	c3                   	ret    

00000000008010ce <set_mem_area>:
void set_mem_area(int base,int len,int type)
{
  8010ce:	f3 0f 1e fa          	endbr64 
  8010d2:	55                   	push   rbp
  8010d3:	48 89 e5             	mov    rbp,rsp
  8010d6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8010d9:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8010dc:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    mmap_struct[mmap_t_i].base=base;
  8010df:	8b 05 4b f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff14b]        # 400230 <mmap_t_i>
  8010e5:	48 63 d0             	movsxd rdx,eax
  8010e8:	48 89 d0             	mov    rax,rdx
  8010eb:	48 01 c0             	add    rax,rax
  8010ee:	48 01 d0             	add    rax,rdx
  8010f1:	48 c1 e0 02          	shl    rax,0x2
  8010f5:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  8010fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010ff:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i].len=len;
  801101:	8b 05 29 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff129]        # 400230 <mmap_t_i>
  801107:	48 63 d0             	movsxd rdx,eax
  80110a:	48 89 d0             	mov    rax,rdx
  80110d:	48 01 c0             	add    rax,rax
  801110:	48 01 d0             	add    rax,rdx
  801113:	48 c1 e0 02          	shl    rax,0x2
  801117:	48 8d 90 44 01 40 00 	lea    rdx,[rax+0x400144]
  80111e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801121:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i++].type=type;
  801123:	8b 05 07 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff107]        # 400230 <mmap_t_i>
  801129:	8d 50 01             	lea    edx,[rax+0x1]
  80112c:	89 15 fe f0 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff0fe],edx        # 400230 <mmap_t_i>
  801132:	48 63 d0             	movsxd rdx,eax
  801135:	48 89 d0             	mov    rax,rdx
  801138:	48 01 c0             	add    rax,rax
  80113b:	48 01 d0             	add    rax,rdx
  80113e:	48 c1 e0 02          	shl    rax,0x2
  801142:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  801149:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80114c:	89 02                	mov    DWORD PTR [rdx],eax
}
  80114e:	90                   	nop
  80114f:	5d                   	pop    rbp
  801150:	c3                   	ret    

0000000000801151 <vmalloc>:
addr_t vmalloc()
{
  801151:	f3 0f 1e fa          	endbr64 
  801155:	55                   	push   rbp
  801156:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801159:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801160:	eb 76                	jmp    8011d8 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801162:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801169:	eb 63                	jmp    8011ce <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80116b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80116e:	48 98                	cdqe   
  801170:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801177:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80117a:	be 01 00 00 00       	mov    esi,0x1
  80117f:	89 c1                	mov    ecx,eax
  801181:	d3 e6                	shl    esi,cl
  801183:	89 f0                	mov    eax,esi
  801185:	21 d0                	and    eax,edx
  801187:	85 c0                	test   eax,eax
  801189:	75 3f                	jne    8011ca <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  80118b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80118e:	48 98                	cdqe   
  801190:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801197:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80119a:	be 01 00 00 00       	mov    esi,0x1
  80119f:	89 c1                	mov    ecx,eax
  8011a1:	d3 e6                	shl    esi,cl
  8011a3:	89 f0                	mov    eax,esi
  8011a5:	09 c2                	or     edx,eax
  8011a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011aa:	48 98                	cdqe   
  8011ac:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8011b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011b6:	c1 e0 05             	shl    eax,0x5
  8011b9:	89 c2                	mov    edx,eax
  8011bb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011be:	01 d0                	add    eax,edx
  8011c0:	83 c0 20             	add    eax,0x20
  8011c3:	c1 e0 0c             	shl    eax,0xc
  8011c6:	48 98                	cdqe   
  8011c8:	eb 14                	jmp    8011de <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8011ca:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8011ce:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8011d2:	7e 97                	jle    80116b <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8011d4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011d8:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011dc:	7e 84                	jle    801162 <vmalloc+0x11>
            }
        }
    }
}
  8011de:	5d                   	pop    rbp
  8011df:	c3                   	ret    

00000000008011e0 <vmfree>:

int vmfree(addr_t ptr)
{
  8011e0:	f3 0f 1e fa          	endbr64 
  8011e4:	55                   	push   rbp
  8011e5:	48 89 e5             	mov    rbp,rsp
  8011e8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011f0:	48 c1 e8 0c          	shr    rax,0xc
  8011f4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011fa:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011fd:	85 c0                	test   eax,eax
  8011ff:	0f 48 c2             	cmovs  eax,edx
  801202:	c1 f8 05             	sar    eax,0x5
  801205:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801208:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80120b:	99                   	cdq    
  80120c:	c1 ea 1b             	shr    edx,0x1b
  80120f:	01 d0                	add    eax,edx
  801211:	83 e0 1f             	and    eax,0x1f
  801214:	29 d0                	sub    eax,edx
  801216:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801219:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80121c:	48 98                	cdqe   
  80121e:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801225:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801228:	be 01 00 00 00       	mov    esi,0x1
  80122d:	89 c1                	mov    ecx,eax
  80122f:	d3 e6                	shl    esi,cl
  801231:	89 f0                	mov    eax,esi
  801233:	f7 d0                	not    eax
  801235:	21 c2                	and    edx,eax
  801237:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80123a:	48 98                	cdqe   
  80123c:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  801243:	90                   	nop
  801244:	5d                   	pop    rbp
  801245:	c3                   	ret    

0000000000801246 <page_err>:
void page_err(){
  801246:	f3 0f 1e fa          	endbr64 
  80124a:	55                   	push   rbp
  80124b:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80124e:	fa                   	cli    
    print("page err");
  80124f:	bf 7f 17 81 00       	mov    edi,0x81177f
  801254:	e8 7c 48 00 00       	call   805ad5 <print>
    while(1);
  801259:	eb fe                	jmp    801259 <page_err+0x13>

000000000080125b <init_memory>:
    eoi();
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $4,%esp \r\n iret");
}
void init_memory()
{
  80125b:	f3 0f 1e fa          	endbr64 
  80125f:	55                   	push   rbp
  801260:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<8;i++){
  801263:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80126a:	eb 14                	jmp    801280 <init_memory+0x25>
        page_map[i]=0xffffffff;
  80126c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80126f:	48 98                	cdqe   
  801271:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  801278:	ff ff ff ff 
    for(int i=0;i<8;i++){
  80127c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801280:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  801284:	7e e6                	jle    80126c <init_memory+0x11>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  801286:	90                   	nop
  801287:	90                   	nop
  801288:	5d                   	pop    rbp
  801289:	c3                   	ret    

000000000080128a <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80128a:	f3 0f 1e fa          	endbr64 
  80128e:	55                   	push   rbp
  80128f:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801292:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801299:	e9 8c 00 00 00       	jmp    80132a <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  80129e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012a5:	eb 79                	jmp    801320 <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  8012a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012aa:	48 98                	cdqe   
  8012ac:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8012b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012b6:	be 01 00 00 00       	mov    esi,0x1
  8012bb:	89 c1                	mov    ecx,eax
  8012bd:	d3 e6                	shl    esi,cl
  8012bf:	89 f0                	mov    eax,esi
  8012c1:	21 d0                	and    eax,edx
  8012c3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8012c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012c9:	c1 e0 05             	shl    eax,0x5
  8012cc:	89 c2                	mov    edx,eax
  8012ce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012d1:	01 d0                	add    eax,edx
  8012d3:	c1 e0 0c             	shl    eax,0xc
  8012d6:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8012db:	7e 3f                	jle    80131c <req_a_page+0x92>
  8012dd:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8012e1:	75 39                	jne    80131c <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  8012e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012e6:	48 98                	cdqe   
  8012e8:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8012ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012f2:	be 01 00 00 00       	mov    esi,0x1
  8012f7:	89 c1                	mov    ecx,eax
  8012f9:	d3 e6                	shl    esi,cl
  8012fb:	89 f0                	mov    eax,esi
  8012fd:	09 c2                	or     edx,eax
  8012ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801302:	48 98                	cdqe   
  801304:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  80130b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80130e:	c1 e0 05             	shl    eax,0x5
  801311:	89 c2                	mov    edx,eax
  801313:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801316:	01 d0                	add    eax,edx
  801318:	48 98                	cdqe   
  80131a:	eb 18                	jmp    801334 <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  80131c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801320:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801324:	7e 81                	jle    8012a7 <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801326:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80132a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80132e:	0f 8e 6a ff ff ff    	jle    80129e <req_a_page+0x14>

            }
        }
    }
}
  801334:	5d                   	pop    rbp
  801335:	c3                   	ret    

0000000000801336 <free_page>:

int free_page(char *paddr){
  801336:	f3 0f 1e fa          	endbr64 
  80133a:	55                   	push   rbp
  80133b:	48 89 e5             	mov    rbp,rsp
  80133e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801342:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801346:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80134c:	85 c0                	test   eax,eax
  80134e:	0f 48 c2             	cmovs  eax,edx
  801351:	c1 f8 0c             	sar    eax,0xc
  801354:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801357:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80135a:	8d 50 1f             	lea    edx,[rax+0x1f]
  80135d:	85 c0                	test   eax,eax
  80135f:	0f 48 c2             	cmovs  eax,edx
  801362:	c1 f8 05             	sar    eax,0x5
  801365:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801368:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80136b:	99                   	cdq    
  80136c:	c1 ea 1b             	shr    edx,0x1b
  80136f:	01 d0                	add    eax,edx
  801371:	83 e0 1f             	and    eax,0x1f
  801374:	29 d0                	sub    eax,edx
  801376:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801379:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80137c:	48 98                	cdqe   
  80137e:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801385:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801388:	be 01 00 00 00       	mov    esi,0x1
  80138d:	89 c1                	mov    ecx,eax
  80138f:	d3 e6                	shl    esi,cl
  801391:	89 f0                	mov    eax,esi
  801393:	f7 d0                	not    eax
  801395:	21 c2                	and    edx,eax
  801397:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80139a:	48 98                	cdqe   
  80139c:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  8013a3:	90                   	nop
  8013a4:	5d                   	pop    rbp
  8013a5:	c3                   	ret    

00000000008013a6 <check_page>:
int check_page(int num){
  8013a6:	f3 0f 1e fa          	endbr64 
  8013aa:	55                   	push   rbp
  8013ab:	48 89 e5             	mov    rbp,rsp
  8013ae:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8013b1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8013b4:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013b7:	85 c0                	test   eax,eax
  8013b9:	0f 48 c2             	cmovs  eax,edx
  8013bc:	c1 f8 05             	sar    eax,0x5
  8013bf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8013c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8013c5:	99                   	cdq    
  8013c6:	c1 ea 1b             	shr    edx,0x1b
  8013c9:	01 d0                	add    eax,edx
  8013cb:	83 e0 1f             	and    eax,0x1f
  8013ce:	29 d0                	sub    eax,edx
  8013d0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8013d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013d6:	48 98                	cdqe   
  8013d8:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8013df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013e2:	be 01 00 00 00       	mov    esi,0x1
  8013e7:	89 c1                	mov    ecx,eax
  8013e9:	d3 e6                	shl    esi,cl
  8013eb:	89 f0                	mov    eax,esi
  8013ed:	21 d0                	and    eax,edx
  8013ef:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8013f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8013f5:	5d                   	pop    rbp
  8013f6:	c3                   	ret    

00000000008013f7 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8013f7:	f3 0f 1e fa          	endbr64 
  8013fb:	55                   	push   rbp
  8013fc:	48 89 e5             	mov    rbp,rsp
  8013ff:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801402:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801405:	c1 e0 0c             	shl    eax,0xc
}
  801408:	5d                   	pop    rbp
  801409:	c3                   	ret    

000000000080140a <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80140a:	f3 0f 1e fa          	endbr64 
  80140e:	55                   	push   rbp
  80140f:	48 89 e5             	mov    rbp,rsp
  801412:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801416:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801419:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80141c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801420:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801427:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80142b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80142e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801431:	89 c0                	mov    eax,eax
  801433:	25 00 f0 ff ff       	and    eax,0xfffff000
  801438:	48 09 c2             	or     rdx,rax
  80143b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80143f:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801442:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801446:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801449:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80144c:	48 98                	cdqe   
  80144e:	48 09 c2             	or     rdx,rax
  801451:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801455:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801458:	90                   	nop
  801459:	5d                   	pop    rbp
  80145a:	c3                   	ret    

000000000080145b <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80145b:	f3 0f 1e fa          	endbr64 
  80145f:	55                   	push   rbp
  801460:	48 89 e5             	mov    rbp,rsp
  801463:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801467:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80146a:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  80146d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801471:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801478:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80147c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80147f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801482:	0c 81                	or     al,0x81
  801484:	89 c0                	mov    eax,eax
  801486:	48 09 c2             	or     rdx,rax
  801489:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80148d:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801490:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801493:	25 00 00 00 c0       	and    eax,0xc0000000
  801498:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  80149b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80149f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014a5:	48 09 c2             	or     rdx,rax
  8014a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014ac:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8014af:	90                   	nop
  8014b0:	5d                   	pop    rbp
  8014b1:	c3                   	ret    

00000000008014b2 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  8014b2:	f3 0f 1e fa          	endbr64 
  8014b6:	55                   	push   rbp
  8014b7:	48 89 e5             	mov    rbp,rsp
  8014ba:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8014be:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  8014c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014c5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  8014cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014d0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8014d3:	48 0d 81 10 00 00    	or     rax,0x1081
  8014d9:	48 89 c2             	mov    rdx,rax
  8014dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014e0:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8014e3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8014e6:	25 00 00 c0 ff       	and    eax,0xffc00000
  8014eb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
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

0000000000801505 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801505:	f3 0f 1e fa          	endbr64 
  801509:	55                   	push   rbp
  80150a:	48 89 e5             	mov    rbp,rsp
  80150d:	48 83 ec 20          	sub    rsp,0x20
  801511:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801515:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801518:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80151d:	75 18                	jne    801537 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80151f:	b8 00 00 00 00       	mov    eax,0x0
  801524:	e8 61 fd ff ff       	call   80128a <req_a_page>
  801529:	89 c7                	mov    edi,eax
  80152b:	e8 c7 fe ff ff       	call   8013f7 <get_phyaddr>
  801530:	48 98                	cdqe   
  801532:	e9 8e 00 00 00       	jmp    8015c5 <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801537:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80153b:	89 c2                	mov    edx,eax
  80153d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801540:	89 c6                	mov    esi,eax
  801542:	89 d7                	mov    edi,edx
  801544:	e8 3b 01 00 00       	call   801684 <is_pgs_ava>
  801549:	85 c0                	test   eax,eax
  80154b:	75 09                	jne    801556 <req_page_at+0x51>
  80154d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801554:	eb 6f                	jmp    8015c5 <req_page_at+0xc0>
    int pgni=base/4096;
  801556:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80155a:	48 c1 e8 0c          	shr    rax,0xc
  80155e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801561:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801564:	8d 50 1f             	lea    edx,[rax+0x1f]
  801567:	85 c0                	test   eax,eax
  801569:	0f 48 c2             	cmovs  eax,edx
  80156c:	c1 f8 05             	sar    eax,0x5
  80156f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801572:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801575:	99                   	cdq    
  801576:	c1 ea 1b             	shr    edx,0x1b
  801579:	01 d0                	add    eax,edx
  80157b:	83 e0 1f             	and    eax,0x1f
  80157e:	29 d0                	sub    eax,edx
  801580:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801583:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80158a:	eb 2c                	jmp    8015b8 <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  80158c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80158f:	48 98                	cdqe   
  801591:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801598:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80159b:	be 01 00 00 00       	mov    esi,0x1
  8015a0:	89 c1                	mov    ecx,eax
  8015a2:	d3 e6                	shl    esi,cl
  8015a4:	89 f0                	mov    eax,esi
  8015a6:	09 c2                	or     edx,eax
  8015a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015ab:	48 98                	cdqe   
  8015ad:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  8015b4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8015b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015bb:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8015be:	7c cc                	jl     80158c <req_page_at+0x87>
    }
    return 0;
  8015c0:	b8 00 00 00 00       	mov    eax,0x0

}
  8015c5:	c9                   	leave  
  8015c6:	c3                   	ret    

00000000008015c7 <chk_vm>:
int chk_vm(int base, int pgn)
{
  8015c7:	f3 0f 1e fa          	endbr64 
  8015cb:	55                   	push   rbp
  8015cc:	48 89 e5             	mov    rbp,rsp
  8015cf:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8015d2:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8015d5:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8015dc:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8015dd:	0f 20 d8             	mov    rax,cr3
  8015e0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8015e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015e7:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8015ed:	85 c0                	test   eax,eax
  8015ef:	0f 48 c2             	cmovs  eax,edx
  8015f2:	c1 f8 16             	sar    eax,0x16
  8015f5:	48 98                	cdqe   
  8015f7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8015fe:	00 
  8015ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801603:	48 01 d0             	add    rax,rdx
  801606:	8b 00                	mov    eax,DWORD PTR [rax]
  801608:	89 c0                	mov    eax,eax
  80160a:	25 00 f0 ff ff       	and    eax,0xfffff000
  80160f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801613:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801616:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80161c:	85 c0                	test   eax,eax
  80161e:	0f 48 c2             	cmovs  eax,edx
  801621:	c1 f8 16             	sar    eax,0x16
  801624:	48 98                	cdqe   
  801626:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80162d:	00 
  80162e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801632:	48 01 d0             	add    rax,rdx
  801635:	8b 00                	mov    eax,DWORD PTR [rax]
  801637:	83 e0 01             	and    eax,0x1
  80163a:	85 c0                	test   eax,eax
  80163c:	74 38                	je     801676 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80163e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801641:	99                   	cdq    
  801642:	c1 ea 0a             	shr    edx,0xa
  801645:	01 d0                	add    eax,edx
  801647:	25 ff ff 3f 00       	and    eax,0x3fffff
  80164c:	29 d0                	sub    eax,edx
  80164e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801654:	85 c0                	test   eax,eax
  801656:	0f 48 c2             	cmovs  eax,edx
  801659:	c1 f8 0c             	sar    eax,0xc
  80165c:	48 98                	cdqe   
  80165e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801665:	00 
  801666:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80166a:	48 01 d0             	add    rax,rdx
  80166d:	8b 00                	mov    eax,DWORD PTR [rax]
  80166f:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801672:	85 c0                	test   eax,eax
  801674:	75 07                	jne    80167d <chk_vm+0xb6>
    {
        return -1;
  801676:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80167b:	eb 05                	jmp    801682 <chk_vm+0xbb>
    }
    return 0;
  80167d:	b8 00 00 00 00       	mov    eax,0x0
}
  801682:	5d                   	pop    rbp
  801683:	c3                   	ret    

0000000000801684 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801684:	f3 0f 1e fa          	endbr64 
  801688:	55                   	push   rbp
  801689:	48 89 e5             	mov    rbp,rsp
  80168c:	48 83 ec 18          	sub    rsp,0x18
  801690:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801693:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801696:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801699:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80169f:	85 c0                	test   eax,eax
  8016a1:	0f 48 c2             	cmovs  eax,edx
  8016a4:	c1 f8 0c             	sar    eax,0xc
  8016a7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8016aa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8016b1:	eb 1e                	jmp    8016d1 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  8016b3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8016b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016b9:	01 d0                	add    eax,edx
  8016bb:	89 c7                	mov    edi,eax
  8016bd:	e8 e4 fc ff ff       	call   8013a6 <check_page>
  8016c2:	85 c0                	test   eax,eax
  8016c4:	74 07                	je     8016cd <is_pgs_ava+0x49>
  8016c6:	b8 00 00 00 00       	mov    eax,0x0
  8016cb:	eb 11                	jmp    8016de <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  8016cd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8016d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016d4:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8016d7:	7c da                	jl     8016b3 <is_pgs_ava+0x2f>
    }
    return 1;
  8016d9:	b8 01 00 00 00       	mov    eax,0x1

}
  8016de:	c9                   	leave  
  8016df:	c3                   	ret    

00000000008016e0 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8016e0:	f3 0f 1e fa          	endbr64 
  8016e4:	55                   	push   rbp
  8016e5:	48 89 e5             	mov    rbp,rsp
  8016e8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8016ec:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8016f0:	c6 05 49 eb bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfeb49],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8016f7:	c6 05 43 eb bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfeb43],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8016fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801702:	48 89 05 3f eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb3f],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801709:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80170d:	48 89 05 3c eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb3c],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801714:	c7 05 42 eb bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfeb42],0x1        # 400260 <vols+0x20>
  80171b:	00 00 00 
    return 0;
  80171e:	b8 00 00 00 00       	mov    eax,0x0
}
  801723:	5d                   	pop    rbp
  801724:	c3                   	ret    

0000000000801725 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801725:	f3 0f 1e fa          	endbr64 
  801729:	55                   	push   rbp
  80172a:	48 89 e5             	mov    rbp,rsp
  80172d:	48 83 ec 20          	sub    rsp,0x20
  801731:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801734:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80173b:	eb 38                	jmp    801775 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80173d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801740:	48 98                	cdqe   
  801742:	48 c1 e0 04          	shl    rax,0x4
  801746:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80174c:	8b 00                	mov    eax,DWORD PTR [rax]
  80174e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801751:	75 1e                	jne    801771 <sys_mkfifo+0x4c>
  801753:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801756:	48 98                	cdqe   
  801758:	48 c1 e0 04          	shl    rax,0x4
  80175c:	48 05 68 1e 40 00    	add    rax,0x401e68
  801762:	8b 00                	mov    eax,DWORD PTR [rax]
  801764:	83 f8 01             	cmp    eax,0x1
  801767:	75 08                	jne    801771 <sys_mkfifo+0x4c>
            return i;
  801769:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80176c:	e9 a6 00 00 00       	jmp    801817 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801771:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801775:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801779:	7e c2                	jle    80173d <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  80177b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801782:	e9 81 00 00 00       	jmp    801808 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801787:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80178a:	48 98                	cdqe   
  80178c:	48 c1 e0 04          	shl    rax,0x4
  801790:	48 05 68 1e 40 00    	add    rax,0x401e68
  801796:	8b 00                	mov    eax,DWORD PTR [rax]
  801798:	85 c0                	test   eax,eax
  80179a:	75 68                	jne    801804 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  80179c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80179f:	48 98                	cdqe   
  8017a1:	48 c1 e0 04          	shl    rax,0x4
  8017a5:	48 05 68 1e 40 00    	add    rax,0x401e68
  8017ab:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  8017b1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017b4:	48 98                	cdqe   
  8017b6:	48 c1 e0 04          	shl    rax,0x4
  8017ba:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  8017c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017c4:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  8017c6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017c9:	48 98                	cdqe   
  8017cb:	48 c1 e0 04          	shl    rax,0x4
  8017cf:	48 05 64 1e 40 00    	add    rax,0x401e64
  8017d5:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  8017db:	b8 00 00 00 00       	mov    eax,0x0
  8017e0:	e8 a5 fa ff ff       	call   80128a <req_a_page>
  8017e5:	89 c7                	mov    edi,eax
  8017e7:	e8 0b fc ff ff       	call   8013f7 <get_phyaddr>
  8017ec:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8017ef:	48 63 d2             	movsxd rdx,edx
  8017f2:	48 c1 e2 04          	shl    rdx,0x4
  8017f6:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8017fd:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8017ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801802:	eb 13                	jmp    801817 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801804:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801808:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  80180c:	0f 8e 75 ff ff ff    	jle    801787 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801812:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801817:	c9                   	leave  
  801818:	c3                   	ret    

0000000000801819 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801819:	f3 0f 1e fa          	endbr64 
  80181d:	55                   	push   rbp
  80181e:	48 89 e5             	mov    rbp,rsp
  801821:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801824:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80182b:	eb 4a                	jmp    801877 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80182d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801830:	48 98                	cdqe   
  801832:	48 c1 e0 04          	shl    rax,0x4
  801836:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80183c:	8b 00                	mov    eax,DWORD PTR [rax]
  80183e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801841:	75 30                	jne    801873 <sys_rmfifo+0x5a>
  801843:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801846:	48 98                	cdqe   
  801848:	48 c1 e0 04          	shl    rax,0x4
  80184c:	48 05 68 1e 40 00    	add    rax,0x401e68
  801852:	8b 00                	mov    eax,DWORD PTR [rax]
  801854:	83 f8 01             	cmp    eax,0x1
  801857:	75 1a                	jne    801873 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801859:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80185c:	48 98                	cdqe   
  80185e:	48 c1 e0 04          	shl    rax,0x4
  801862:	48 05 68 1e 40 00    	add    rax,0x401e68
  801868:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  80186e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801871:	eb 0f                	jmp    801882 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801873:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801877:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  80187b:	7e b0                	jle    80182d <sys_rmfifo+0x14>
        }
    }
    return -1;
  80187d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801882:	5d                   	pop    rbp
  801883:	c3                   	ret    

0000000000801884 <free_vol>:
int free_vol(int voli)
{
  801884:	f3 0f 1e fa          	endbr64 
  801888:	55                   	push   rbp
  801889:	48 89 e5             	mov    rbp,rsp
  80188c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  80188f:	c7 05 c7 e9 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe9c7],0x0        # 400260 <vols+0x20>
  801896:	00 00 00 
    return 0;
  801899:	b8 00 00 00 00       	mov    eax,0x0
}
  80189e:	5d                   	pop    rbp
  80189f:	c3                   	ret    

00000000008018a0 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  8018a0:	f3 0f 1e fa          	endbr64 
  8018a4:	55                   	push   rbp
  8018a5:	48 89 e5             	mov    rbp,rsp
  8018a8:	48 83 ec 20          	sub    rsp,0x20
  8018ac:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018af:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8018b2:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  8018b6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018bd:	e9 d8 00 00 00       	jmp    80199a <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  8018c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018c5:	48 63 d0             	movsxd rdx,eax
  8018c8:	48 89 d0             	mov    rax,rdx
  8018cb:	48 c1 e0 02          	shl    rax,0x2
  8018cf:	48 01 d0             	add    rax,rdx
  8018d2:	48 c1 e0 03          	shl    rax,0x3
  8018d6:	48 05 60 02 40 00    	add    rax,0x400260
  8018dc:	8b 00                	mov    eax,DWORD PTR [rax]
  8018de:	85 c0                	test   eax,eax
  8018e0:	0f 85 b0 00 00 00    	jne    801996 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  8018e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018e9:	48 63 d0             	movsxd rdx,eax
  8018ec:	48 89 d0             	mov    rax,rdx
  8018ef:	48 c1 e0 02          	shl    rax,0x2
  8018f3:	48 01 d0             	add    rax,rdx
  8018f6:	48 c1 e0 03          	shl    rax,0x3
  8018fa:	48 05 60 02 40 00    	add    rax,0x400260
  801900:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801906:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801909:	48 63 d0             	movsxd rdx,eax
  80190c:	48 89 d0             	mov    rax,rdx
  80190f:	48 01 c0             	add    rax,rax
  801912:	48 01 d0             	add    rax,rdx
  801915:	48 c1 e0 03          	shl    rax,0x3
  801919:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801920:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801923:	48 63 d0             	movsxd rdx,eax
  801926:	48 89 d0             	mov    rax,rdx
  801929:	48 c1 e0 02          	shl    rax,0x2
  80192d:	48 01 d0             	add    rax,rdx
  801930:	48 c1 e0 03          	shl    rax,0x3
  801934:	48 05 58 02 40 00    	add    rax,0x400258
  80193a:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  80193d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801940:	89 c7                	mov    edi,eax
  801942:	e8 0b 1b 00 00       	call   803452 <get_drv>
  801947:	48 89 c2             	mov    rdx,rax
  80194a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80194d:	48 63 c8             	movsxd rcx,eax
  801950:	48 89 c8             	mov    rax,rcx
  801953:	48 c1 e0 02          	shl    rax,0x2
  801957:	48 01 c8             	add    rax,rcx
  80195a:	48 c1 e0 03          	shl    rax,0x3
  80195e:	48 05 48 02 40 00    	add    rax,0x400248
  801964:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801967:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80196a:	48 63 d0             	movsxd rdx,eax
  80196d:	48 89 d0             	mov    rax,rdx
  801970:	48 c1 e0 02          	shl    rax,0x2
  801974:	48 01 d0             	add    rax,rdx
  801977:	48 c1 e0 03          	shl    rax,0x3
  80197b:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801982:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801986:	48 89 c6             	mov    rsi,rax
  801989:	48 89 d7             	mov    rdi,rdx
  80198c:	e8 42 7b 00 00       	call   8094d3 <strcpy>
            return i;
  801991:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801994:	eb 13                	jmp    8019a9 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801996:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80199a:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  80199e:	0f 8e 1e ff ff ff    	jle    8018c2 <reg_vol+0x22>
        }
    }
    return -1;
  8019a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8019a9:	c9                   	leave  
  8019aa:	c3                   	ret    

00000000008019ab <sys_open>:
int sys_open(char *path, int mode)
{
  8019ab:	f3 0f 1e fa          	endbr64 
  8019af:	55                   	push   rbp
  8019b0:	48 89 e5             	mov    rbp,rsp
  8019b3:	53                   	push   rbx
  8019b4:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  8019bb:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  8019c2:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  8019c8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8019cf:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  8019d6:	eb 20                	jmp    8019f8 <sys_open+0x4d>
        volname[i]=path[i];
  8019d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019db:	48 63 d0             	movsxd rdx,eax
  8019de:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8019e5:	48 01 d0             	add    rax,rdx
  8019e8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8019eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019ee:	48 98                	cdqe   
  8019f0:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  8019f4:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8019f8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019fb:	48 63 d0             	movsxd rdx,eax
  8019fe:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a05:	48 01 d0             	add    rax,rdx
  801a08:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a0b:	3c 2f                	cmp    al,0x2f
  801a0d:	74 06                	je     801a15 <sys_open+0x6a>
  801a0f:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801a13:	7e c3                	jle    8019d8 <sys_open+0x2d>
    volname[i]='\0';
  801a15:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a18:	48 98                	cdqe   
  801a1a:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801a1f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a22:	48 98                	cdqe   
  801a24:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801a28:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a2f:	48 01 d0             	add    rax,rdx
  801a32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a35:	84 c0                	test   al,al
  801a37:	75 0a                	jne    801a43 <sys_open+0x98>
        return -2;//是根目录
  801a39:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801a3e:	e9 2b 04 00 00       	jmp    801e6e <sys_open+0x4c3>
    rec=i;
  801a43:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a46:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801a49:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a50:	eb 52                	jmp    801aa4 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801a52:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a55:	48 63 d0             	movsxd rdx,eax
  801a58:	48 89 d0             	mov    rax,rdx
  801a5b:	48 c1 e0 02          	shl    rax,0x2
  801a5f:	48 01 d0             	add    rax,rdx
  801a62:	48 c1 e0 03          	shl    rax,0x3
  801a66:	48 05 60 02 40 00    	add    rax,0x400260
  801a6c:	8b 00                	mov    eax,DWORD PTR [rax]
  801a6e:	85 c0                	test   eax,eax
  801a70:	74 2e                	je     801aa0 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801a72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a75:	48 63 d0             	movsxd rdx,eax
  801a78:	48 89 d0             	mov    rax,rdx
  801a7b:	48 c1 e0 02          	shl    rax,0x2
  801a7f:	48 01 d0             	add    rax,rdx
  801a82:	48 c1 e0 03          	shl    rax,0x3
  801a86:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801a8d:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801a91:	48 89 c6             	mov    rsi,rax
  801a94:	48 89 d7             	mov    rdi,rdx
  801a97:	e8 d7 7b 00 00       	call   809673 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801a9c:	85 c0                	test   eax,eax
  801a9e:	74 0c                	je     801aac <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801aa0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801aa4:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801aa8:	7e a8                	jle    801a52 <sys_open+0xa7>
  801aaa:	eb 01                	jmp    801aad <sys_open+0x102>
            break;
  801aac:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801aad:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801ab1:	75 0a                	jne    801abd <sys_open+0x112>
  801ab3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ab8:	e9 b1 03 00 00       	jmp    801e6e <sys_open+0x4c3>
    driver_args arg={
  801abd:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801ac4:	b8 00 00 00 00       	mov    eax,0x0
  801ac9:	b9 17 00 00 00       	mov    ecx,0x17
  801ace:	48 89 d7             	mov    rdi,rdx
  801ad1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801ad4:	48 89 fa             	mov    rdx,rdi
  801ad7:	89 02                	mov    DWORD PTR [rdx],eax
  801ad9:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801add:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801ae0:	48 98                	cdqe   
  801ae2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801ae6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801aed:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801af0:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801af7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801afa:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801afd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b00:	48 63 d0             	movsxd rdx,eax
  801b03:	48 89 d0             	mov    rax,rdx
  801b06:	48 c1 e0 02          	shl    rax,0x2
  801b0a:	48 01 d0             	add    rax,rdx
  801b0d:	48 c1 e0 03          	shl    rax,0x3
  801b11:	48 05 58 02 40 00    	add    rax,0x400258
  801b17:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801b1a:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801b1e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b21:	48 98                	cdqe   
  801b23:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801b27:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b2e:	48 01 c1             	add    rcx,rax
  801b31:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801b38:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801b3e:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801b44:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801b4a:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801b50:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801b56:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801b5c:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801b62:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801b68:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801b6e:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801b74:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801b7a:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801b80:	48 89 c6             	mov    rsi,rax
  801b83:	48 89 cf             	mov    rdi,rcx
  801b86:	ff d2                	call   rdx
  801b88:	48 83 c4 60          	add    rsp,0x60
  801b8c:	83 f8 ff             	cmp    eax,0xffffffff
  801b8f:	75 49                	jne    801bda <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801b91:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801b97:	83 e0 02             	and    eax,0x2
  801b9a:	85 c0                	test   eax,eax
  801b9c:	74 32                	je     801bd0 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801b9e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ba1:	48 63 d0             	movsxd rdx,eax
  801ba4:	48 89 d0             	mov    rax,rdx
  801ba7:	48 c1 e0 02          	shl    rax,0x2
  801bab:	48 01 d0             	add    rax,rdx
  801bae:	48 c1 e0 03          	shl    rax,0x3
  801bb2:	48 05 50 02 40 00    	add    rax,0x400250
  801bb8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801bbb:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801bbf:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801bc6:	48 89 c7             	mov    rdi,rax
  801bc9:	ff d2                	call   rdx
  801bcb:	e9 9e 02 00 00       	jmp    801e6e <sys_open+0x4c3>
        }else
            return -1;
  801bd0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801bd5:	e9 94 02 00 00       	jmp    801e6e <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801bda:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801be1:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801be8:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801bef:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801bf6:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801bfd:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801c04:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801c0b:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801c12:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801c19:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801c20:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801c27:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801c2e:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801c35:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801c3c:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801c43:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801c4a:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801c51:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801c58:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801c5f:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801c66:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801c6d:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801c74:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801c7b:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801c82:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801c89:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c90:	eb 5c                	jmp    801cee <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801c92:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c95:	48 63 d0             	movsxd rdx,eax
  801c98:	48 89 d0             	mov    rax,rdx
  801c9b:	48 01 c0             	add    rax,rax
  801c9e:	48 01 d0             	add    rax,rdx
  801ca1:	48 c1 e0 05          	shl    rax,0x5
  801ca5:	48 05 68 06 40 00    	add    rax,0x400668
  801cab:	8b 00                	mov    eax,DWORD PTR [rax]
  801cad:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801cb0:	75 38                	jne    801cea <sys_open+0x33f>
  801cb2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cb5:	48 63 d0             	movsxd rdx,eax
  801cb8:	48 89 d0             	mov    rax,rdx
  801cbb:	48 01 c0             	add    rax,rax
  801cbe:	48 01 d0             	add    rax,rdx
  801cc1:	48 c1 e0 05          	shl    rax,0x5
  801cc5:	48 05 74 06 40 00    	add    rax,0x400674
  801ccb:	8b 10                	mov    edx,DWORD PTR [rax]
  801ccd:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801cd3:	39 c2                	cmp    edx,eax
  801cd5:	75 13                	jne    801cea <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801cd7:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801cde:	75 0a                	jne    801cea <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801ce0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ce5:	e9 84 01 00 00       	jmp    801e6e <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cea:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801cee:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801cf2:	7e 9e                	jle    801c92 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cf4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cfb:	eb 2b                	jmp    801d28 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801cfd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d00:	48 63 d0             	movsxd rdx,eax
  801d03:	48 89 d0             	mov    rax,rdx
  801d06:	48 01 c0             	add    rax,rax
  801d09:	48 01 d0             	add    rax,rdx
  801d0c:	48 c1 e0 05          	shl    rax,0x5
  801d10:	48 05 64 06 40 00    	add    rax,0x400664
  801d16:	8b 00                	mov    eax,DWORD PTR [rax]
  801d18:	85 c0                	test   eax,eax
  801d1a:	75 08                	jne    801d24 <sys_open+0x379>
            j = i;
  801d1c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d1f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801d22:	eb 0a                	jmp    801d2e <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d24:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d28:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d2c:	7e cf                	jle    801cfd <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801d2e:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801d32:	75 0a                	jne    801d3e <sys_open+0x393>
  801d34:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d39:	e9 30 01 00 00       	jmp    801e6e <sys_open+0x4c3>
    opened[j]=entry;
  801d3e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d41:	48 63 d0             	movsxd rdx,eax
  801d44:	48 89 d0             	mov    rax,rdx
  801d47:	48 01 c0             	add    rax,rax
  801d4a:	48 01 d0             	add    rax,rdx
  801d4d:	48 c1 e0 05          	shl    rax,0x5
  801d51:	48 05 60 06 40 00    	add    rax,0x400660
  801d57:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801d5e:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801d65:	48 89 08             	mov    QWORD PTR [rax],rcx
  801d68:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801d6c:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801d73:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801d7a:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801d7e:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801d82:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801d89:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801d90:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801d94:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801d98:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801d9f:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801da6:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801daa:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801dae:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801db5:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801dbc:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801dc0:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801dc4:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801dcb:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801dd2:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801dd6:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801dda:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ddd:	48 63 d0             	movsxd rdx,eax
  801de0:	48 89 d0             	mov    rax,rdx
  801de3:	48 01 c0             	add    rax,rax
  801de6:	48 01 d0             	add    rax,rdx
  801de9:	48 c1 e0 05          	shl    rax,0x5
  801ded:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801df4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801df7:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801df9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801dfc:	48 63 d0             	movsxd rdx,eax
  801dff:	48 89 d0             	mov    rax,rdx
  801e02:	48 01 c0             	add    rax,rax
  801e05:	48 01 d0             	add    rax,rdx
  801e08:	48 c1 e0 05          	shl    rax,0x5
  801e0c:	48 05 6c 06 40 00    	add    rax,0x40066c
  801e12:	8b 00                	mov    eax,DWORD PTR [rax]
  801e14:	8d 48 01             	lea    ecx,[rax+0x1]
  801e17:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e1a:	48 63 d0             	movsxd rdx,eax
  801e1d:	48 89 d0             	mov    rax,rdx
  801e20:	48 01 c0             	add    rax,rax
  801e23:	48 01 d0             	add    rax,rdx
  801e26:	48 c1 e0 05          	shl    rax,0x5
  801e2a:	48 05 6c 06 40 00    	add    rax,0x40066c
  801e30:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801e32:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e35:	48 63 d0             	movsxd rdx,eax
  801e38:	48 89 d0             	mov    rax,rdx
  801e3b:	48 01 c0             	add    rax,rax
  801e3e:	48 01 d0             	add    rax,rdx
  801e41:	48 c1 e0 05          	shl    rax,0x5
  801e45:	48 05 60 06 40 00    	add    rax,0x400660
  801e4b:	48 89 c7             	mov    rdi,rax
  801e4e:	e8 17 26 00 00       	call   80446a <add_proc_openf>
    return opened[j].fno;
  801e53:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e56:	48 63 d0             	movsxd rdx,eax
  801e59:	48 89 d0             	mov    rax,rdx
  801e5c:	48 01 c0             	add    rax,rax
  801e5f:	48 01 d0             	add    rax,rdx
  801e62:	48 c1 e0 05          	shl    rax,0x5
  801e66:	48 05 60 06 40 00    	add    rax,0x400660
  801e6c:	8b 00                	mov    eax,DWORD PTR [rax]
}
  801e6e:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801e72:	c9                   	leave  
  801e73:	c3                   	ret    

0000000000801e74 <sys_close>:
int sys_close(int fno)
{
  801e74:	f3 0f 1e fa          	endbr64 
  801e78:	55                   	push   rbp
  801e79:	48 89 e5             	mov    rbp,rsp
  801e7c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e7f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e86:	eb 64                	jmp    801eec <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  801e88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e8b:	48 63 d0             	movsxd rdx,eax
  801e8e:	48 89 d0             	mov    rax,rdx
  801e91:	48 01 c0             	add    rax,rax
  801e94:	48 01 d0             	add    rax,rdx
  801e97:	48 c1 e0 05          	shl    rax,0x5
  801e9b:	48 05 60 06 40 00    	add    rax,0x400660
  801ea1:	8b 00                	mov    eax,DWORD PTR [rax]
  801ea3:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ea6:	75 40                	jne    801ee8 <sys_close+0x74>
        {
            opened[i].link_c--;
  801ea8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801eab:	48 63 d0             	movsxd rdx,eax
  801eae:	48 89 d0             	mov    rax,rdx
  801eb1:	48 01 c0             	add    rax,rax
  801eb4:	48 01 d0             	add    rax,rdx
  801eb7:	48 c1 e0 05          	shl    rax,0x5
  801ebb:	48 05 6c 06 40 00    	add    rax,0x40066c
  801ec1:	8b 00                	mov    eax,DWORD PTR [rax]
  801ec3:	8d 48 ff             	lea    ecx,[rax-0x1]
  801ec6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ec9:	48 63 d0             	movsxd rdx,eax
  801ecc:	48 89 d0             	mov    rax,rdx
  801ecf:	48 01 c0             	add    rax,rax
  801ed2:	48 01 d0             	add    rax,rdx
  801ed5:	48 c1 e0 05          	shl    rax,0x5
  801ed9:	48 05 6c 06 40 00    	add    rax,0x40066c
  801edf:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  801ee1:	b8 00 00 00 00       	mov    eax,0x0
  801ee6:	eb 0f                	jmp    801ef7 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ee8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801eec:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801ef0:	7e 96                	jle    801e88 <sys_close+0x14>
        }
    }
    return -1;
  801ef2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ef7:	5d                   	pop    rbp
  801ef8:	c3                   	ret    

0000000000801ef9 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  801ef9:	f3 0f 1e fa          	endbr64 
  801efd:	55                   	push   rbp
  801efe:	48 89 e5             	mov    rbp,rsp
  801f01:	48 83 ec 20          	sub    rsp,0x20
  801f05:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801f08:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801f0c:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801f0f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f12:	89 c7                	mov    edi,eax
  801f14:	e8 7d 01 00 00       	call   802096 <get_vfs_entry>
  801f19:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801f1d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f22:	75 07                	jne    801f2b <sys_write+0x32>
  801f24:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f29:	eb 5d                	jmp    801f88 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  801f2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f2f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f32:	85 c0                	test   eax,eax
  801f34:	75 18                	jne    801f4e <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  801f36:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801f39:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801f3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f41:	48 89 ce             	mov    rsi,rcx
  801f44:	48 89 c7             	mov    rdi,rax
  801f47:	e8 67 03 00 00       	call   8022b3 <vfs_write_file>
  801f4c:	eb 3a                	jmp    801f88 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801f4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f52:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f55:	83 f8 01             	cmp    eax,0x1
  801f58:	75 29                	jne    801f83 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  801f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f5e:	48 89 c7             	mov    rdi,rax
  801f61:	e8 5b 04 00 00       	call   8023c1 <get_according_bnr>
  801f66:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  801f69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f6d:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f70:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  801f73:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  801f77:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  801f7a:	89 c7                	mov    edi,eax
  801f7c:	e8 24 08 00 00       	call   8027a5 <write_block>
  801f81:	eb 05                	jmp    801f88 <sys_write+0x8f>
    }
    return -1;
  801f83:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  801f88:	c9                   	leave  
  801f89:	c3                   	ret    

0000000000801f8a <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  801f8a:	f3 0f 1e fa          	endbr64 
  801f8e:	55                   	push   rbp
  801f8f:	48 89 e5             	mov    rbp,rsp
  801f92:	48 83 ec 20          	sub    rsp,0x20
  801f96:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801f99:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801f9d:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801fa0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fa3:	89 c7                	mov    edi,eax
  801fa5:	e8 ec 00 00 00       	call   802096 <get_vfs_entry>
  801faa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801fae:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801fb3:	75 07                	jne    801fbc <sys_read+0x32>
  801fb5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801fba:	eb 5d                	jmp    802019 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  801fbc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fc0:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fc3:	85 c0                	test   eax,eax
  801fc5:	75 18                	jne    801fdf <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  801fc7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801fca:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801fce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fd2:	48 89 ce             	mov    rsi,rcx
  801fd5:	48 89 c7             	mov    rdi,rax
  801fd8:	e8 37 02 00 00       	call   802214 <vfs_read_file>
  801fdd:	eb 3a                	jmp    802019 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801fdf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fe3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fe6:	83 f8 01             	cmp    eax,0x1
  801fe9:	75 29                	jne    802014 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  801feb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fef:	48 89 c7             	mov    rdi,rax
  801ff2:	e8 ca 03 00 00       	call   8023c1 <get_according_bnr>
  801ff7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  801ffa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ffe:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802001:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802004:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802008:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80200b:	89 c7                	mov    edi,eax
  80200d:	e8 10 08 00 00       	call   802822 <read_block>
  802012:	eb 05                	jmp    802019 <sys_read+0x8f>
    }
    return -1;
  802014:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802019:	c9                   	leave  
  80201a:	c3                   	ret    

000000000080201b <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  80201b:	f3 0f 1e fa          	endbr64 
  80201f:	55                   	push   rbp
  802020:	48 89 e5             	mov    rbp,rsp
  802023:	48 83 ec 20          	sub    rsp,0x20
  802027:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80202a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80202d:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802030:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802033:	89 c7                	mov    edi,eax
  802035:	e8 5c 00 00 00       	call   802096 <get_vfs_entry>
  80203a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80203e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802043:	75 07                	jne    80204c <sys_seek+0x31>
  802045:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80204a:	eb 14                	jmp    802060 <sys_seek+0x45>
    f->ptr=offset+origin;
  80204c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80204f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802052:	01 c2                	add    edx,eax
  802054:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802058:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  80205b:	b8 00 00 00 00       	mov    eax,0x0
}
  802060:	c9                   	leave  
  802061:	c3                   	ret    

0000000000802062 <sys_tell>:
int sys_tell(int fno)
{
  802062:	f3 0f 1e fa          	endbr64 
  802066:	55                   	push   rbp
  802067:	48 89 e5             	mov    rbp,rsp
  80206a:	48 83 ec 20          	sub    rsp,0x20
  80206e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  802071:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802074:	89 c7                	mov    edi,eax
  802076:	e8 1b 00 00 00       	call   802096 <get_vfs_entry>
  80207b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80207f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802084:	75 07                	jne    80208d <sys_tell+0x2b>
  802086:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80208b:	eb 07                	jmp    802094 <sys_tell+0x32>
    return f->ptr;
  80208d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802091:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802094:	c9                   	leave  
  802095:	c3                   	ret    

0000000000802096 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  802096:	f3 0f 1e fa          	endbr64 
  80209a:	55                   	push   rbp
  80209b:	48 89 e5             	mov    rbp,rsp
  80209e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020a1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020a8:	eb 3f                	jmp    8020e9 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8020aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020ad:	48 63 d0             	movsxd rdx,eax
  8020b0:	48 89 d0             	mov    rax,rdx
  8020b3:	48 01 c0             	add    rax,rax
  8020b6:	48 01 d0             	add    rax,rdx
  8020b9:	48 c1 e0 05          	shl    rax,0x5
  8020bd:	48 05 60 06 40 00    	add    rax,0x400660
  8020c3:	8b 00                	mov    eax,DWORD PTR [rax]
  8020c5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020c8:	75 1b                	jne    8020e5 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  8020ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020cd:	48 63 d0             	movsxd rdx,eax
  8020d0:	48 89 d0             	mov    rax,rdx
  8020d3:	48 01 c0             	add    rax,rax
  8020d6:	48 01 d0             	add    rax,rdx
  8020d9:	48 c1 e0 05          	shl    rax,0x5
  8020dd:	48 05 60 06 40 00    	add    rax,0x400660
  8020e3:	eb 0f                	jmp    8020f4 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020e5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8020e9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8020ed:	7e bb                	jle    8020aa <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8020ef:	b8 00 00 00 00       	mov    eax,0x0
}
  8020f4:	5d                   	pop    rbp
  8020f5:	c3                   	ret    

00000000008020f6 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8020f6:	f3 0f 1e fa          	endbr64 
  8020fa:	55                   	push   rbp
  8020fb:	48 89 e5             	mov    rbp,rsp
  8020fe:	48 83 ec 10          	sub    rsp,0x10
  802102:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802106:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80210a:	48 89 c7             	mov    rdi,rax
  80210d:	e8 a0 04 00 00       	call   8025b2 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802112:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802116:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80211a:	84 c0                	test   al,al
  80211c:	75 07                	jne    802125 <brelse+0x2f>
  80211e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802123:	eb 32                	jmp    802157 <brelse+0x61>
    bh->b_count--;
  802125:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802129:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80212d:	8d 50 ff             	lea    edx,[rax-0x1]
  802130:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802134:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802137:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80213b:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80213f:	84 c0                	test   al,al
  802141:	75 0f                	jne    802152 <brelse+0x5c>
        vmfree(bh->b_data);
  802143:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802147:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80214a:	48 89 c7             	mov    rdi,rax
  80214d:	e8 8e f0 ff ff       	call   8011e0 <vmfree>
    return 0;
  802152:	b8 00 00 00 00       	mov    eax,0x0
}
  802157:	c9                   	leave  
  802158:	c3                   	ret    

0000000000802159 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  802159:	f3 0f 1e fa          	endbr64 
  80215d:	55                   	push   rbp
  80215e:	48 89 e5             	mov    rbp,rsp
  802161:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  802168:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  80216e:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802174:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  80217a:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802180:	89 d6                	mov    esi,edx
  802182:	89 c7                	mov    edi,eax
  802184:	e8 78 02 00 00       	call   802401 <get_buf>
  802189:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  80218d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802192:	75 09                	jne    80219d <bread+0x44>
  802194:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80219b:	eb 75                	jmp    802212 <bread+0xb9>
    if(!bh->b_uptodate)
  80219d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021a1:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8021a5:	84 c0                	test   al,al
  8021a7:	75 65                	jne    80220e <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8021a9:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8021af:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  8021b2:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  8021b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8021c0:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  8021c6:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  8021cd:	02 00 00 
        arg.lba=bh->b_blocknr;
  8021d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021d4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8021d8:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  8021de:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  8021e5:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  8021e8:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8021ef:	48 89 c7             	mov    rdi,rax
  8021f2:	e8 82 12 00 00       	call   803479 <make_request>
  8021f7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8021fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8021fd:	89 c7                	mov    edi,eax
  8021ff:	e8 88 15 00 00       	call   80378c <wait_on_req>
        clear_req(reqi);
  802204:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802207:	89 c7                	mov    edi,eax
  802209:	e8 ae 15 00 00       	call   8037bc <clear_req>
    }
    return bh;
  80220e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802212:	c9                   	leave  
  802213:	c3                   	ret    

0000000000802214 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802214:	f3 0f 1e fa          	endbr64 
  802218:	55                   	push   rbp
  802219:	48 89 e5             	mov    rbp,rsp
  80221c:	48 83 ec 40          	sub    rsp,0x40
  802220:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802224:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802228:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80222b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80222f:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802232:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802235:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802239:	48 89 c7             	mov    rdi,rax
  80223c:	e8 80 01 00 00       	call   8023c1 <get_according_bnr>
  802241:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802244:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80224a:	89 d6                	mov    esi,edx
  80224c:	89 c7                	mov    edi,eax
  80224e:	e8 06 ff ff ff       	call   802159 <bread>
  802253:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802257:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80225a:	ba 00 02 00 00       	mov    edx,0x200
  80225f:	39 d0                	cmp    eax,edx
  802261:	0f 4f c2             	cmovg  eax,edx
  802264:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  802267:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80226a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80226e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802271:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802275:	48 89 ce             	mov    rsi,rcx
  802278:	48 89 c7             	mov    rdi,rax
  80227b:	e8 55 71 00 00       	call   8093d5 <memcpy>
        len-=BLOCK_SIZE;
  802280:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802287:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80228b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80228e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802291:	01 c2                	add    edx,eax
  802293:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802297:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80229a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80229e:	48 89 c7             	mov    rdi,rax
  8022a1:	e8 50 fe ff ff       	call   8020f6 <brelse>
    }while(len>0);
  8022a6:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8022aa:	7f 89                	jg     802235 <vfs_read_file+0x21>
    return 0;
  8022ac:	b8 00 00 00 00       	mov    eax,0x0
}
  8022b1:	c9                   	leave  
  8022b2:	c3                   	ret    

00000000008022b3 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  8022b3:	f3 0f 1e fa          	endbr64 
  8022b7:	55                   	push   rbp
  8022b8:	48 89 e5             	mov    rbp,rsp
  8022bb:	48 83 ec 40          	sub    rsp,0x40
  8022bf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8022c3:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8022c7:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8022ca:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022ce:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8022d1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8022d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022d8:	48 89 c7             	mov    rdi,rax
  8022db:	e8 e1 00 00 00       	call   8023c1 <get_according_bnr>
  8022e0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8022e3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8022e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022e9:	89 d6                	mov    esi,edx
  8022eb:	89 c7                	mov    edi,eax
  8022ed:	e8 0f 01 00 00       	call   802401 <get_buf>
  8022f2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8022f6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8022f9:	ba 00 02 00 00       	mov    edx,0x200
  8022fe:	39 d0                	cmp    eax,edx
  802300:	0f 4f c2             	cmovg  eax,edx
  802303:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802306:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802309:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80230d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802310:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802314:	48 89 ce             	mov    rsi,rcx
  802317:	48 89 c7             	mov    rdi,rax
  80231a:	e8 b6 70 00 00       	call   8093d5 <memcpy>
        len-=BLOCK_SIZE;
  80231f:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802326:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80232a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80232d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802330:	01 c2                	add    edx,eax
  802332:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802336:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802339:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80233d:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802341:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802345:	48 89 c7             	mov    rdi,rax
  802348:	e8 a9 fd ff ff       	call   8020f6 <brelse>
    }while(len>0);
  80234d:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802351:	7f 81                	jg     8022d4 <vfs_write_file+0x21>
    return 0;
  802353:	b8 00 00 00 00       	mov    eax,0x0
}
  802358:	c9                   	leave  
  802359:	c3                   	ret    

000000000080235a <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  80235a:	f3 0f 1e fa          	endbr64 
  80235e:	55                   	push   rbp
  80235f:	48 89 e5             	mov    rbp,rsp
  802362:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802366:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802369:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  80236c:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802370:	74 20                	je     802392 <vfs_seek_file+0x38>
  802372:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802376:	7f 3f                	jg     8023b7 <vfs_seek_file+0x5d>
  802378:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  80237c:	74 08                	je     802386 <vfs_seek_file+0x2c>
  80237e:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802382:	74 23                	je     8023a7 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802384:	eb 31                	jmp    8023b7 <vfs_seek_file+0x5d>
        f->ptr=offset;
  802386:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80238a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80238d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802390:	eb 26                	jmp    8023b8 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802392:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802396:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802399:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80239c:	01 c2                	add    edx,eax
  80239e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023a2:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023a5:	eb 11                	jmp    8023b8 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8023a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ab:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8023ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023b2:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023b5:	eb 01                	jmp    8023b8 <vfs_seek_file+0x5e>
        break;
  8023b7:	90                   	nop
    }
    return f->ptr;
  8023b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023bc:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8023bf:	5d                   	pop    rbp
  8023c0:	c3                   	ret    

00000000008023c1 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  8023c1:	f3 0f 1e fa          	endbr64 
  8023c5:	55                   	push   rbp
  8023c6:	48 89 e5             	mov    rbp,rsp
  8023c9:	48 83 ec 10          	sub    rsp,0x10
  8023cd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8023d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023d5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023d8:	48 63 d0             	movsxd rdx,eax
  8023db:	48 89 d0             	mov    rax,rdx
  8023de:	48 c1 e0 02          	shl    rax,0x2
  8023e2:	48 01 d0             	add    rax,rdx
  8023e5:	48 c1 e0 03          	shl    rax,0x3
  8023e9:	48 05 58 02 40 00    	add    rax,0x400258
  8023ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023f2:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8023f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023fa:	48 89 c7             	mov    rdi,rax
  8023fd:	ff d2                	call   rdx

}
  8023ff:	c9                   	leave  
  802400:	c3                   	ret    

0000000000802401 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802401:	f3 0f 1e fa          	endbr64 
  802405:	55                   	push   rbp
  802406:	48 89 e5             	mov    rbp,rsp
  802409:	48 83 ec 20          	sub    rsp,0x20
  80240d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802410:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802413:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80241a:	e9 b9 00 00 00       	jmp    8024d8 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80241f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802422:	48 98                	cdqe   
  802424:	48 c1 e0 06          	shl    rax,0x6
  802428:	48 05 90 26 40 00    	add    rax,0x402690
  80242e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802431:	0f b7 c0             	movzx  eax,ax
  802434:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802437:	0f 85 97 00 00 00    	jne    8024d4 <get_buf+0xd3>
  80243d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802440:	48 98                	cdqe   
  802442:	48 c1 e0 06          	shl    rax,0x6
  802446:	48 05 88 26 40 00    	add    rax,0x402688
  80244c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80244f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802452:	48 98                	cdqe   
  802454:	48 39 c2             	cmp    rdx,rax
  802457:	75 7b                	jne    8024d4 <get_buf+0xd3>
        {
            repeat:
  802459:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  80245a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80245d:	48 98                	cdqe   
  80245f:	48 c1 e0 06          	shl    rax,0x6
  802463:	48 05 80 26 40 00    	add    rax,0x402680
  802469:	48 89 c7             	mov    rdi,rax
  80246c:	e8 41 01 00 00       	call   8025b2 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802471:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802474:	48 98                	cdqe   
  802476:	48 c1 e0 06          	shl    rax,0x6
  80247a:	48 05 94 26 40 00    	add    rax,0x402694
  802480:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802483:	84 c0                	test   al,al
  802485:	74 02                	je     802489 <get_buf+0x88>
                goto repeat;
  802487:	eb d1                	jmp    80245a <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802489:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80248c:	48 98                	cdqe   
  80248e:	48 c1 e0 06          	shl    rax,0x6
  802492:	48 05 90 26 40 00    	add    rax,0x402690
  802498:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80249b:	0f b7 c0             	movzx  eax,ax
  80249e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8024a1:	75 30                	jne    8024d3 <get_buf+0xd2>
  8024a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024a6:	48 98                	cdqe   
  8024a8:	48 c1 e0 06          	shl    rax,0x6
  8024ac:	48 05 88 26 40 00    	add    rax,0x402688
  8024b2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8024b5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8024b8:	48 98                	cdqe   
  8024ba:	48 39 c2             	cmp    rdx,rax
  8024bd:	75 14                	jne    8024d3 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  8024bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024c2:	48 98                	cdqe   
  8024c4:	48 c1 e0 06          	shl    rax,0x6
  8024c8:	48 05 80 26 40 00    	add    rax,0x402680
  8024ce:	e9 dd 00 00 00       	jmp    8025b0 <get_buf+0x1af>
                continue;
  8024d3:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8024d4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8024d8:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8024dc:	0f 8e 3d ff ff ff    	jle    80241f <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8024e2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8024e9:	e9 b8 00 00 00       	jmp    8025a6 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8024ee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8024f1:	48 98                	cdqe   
  8024f3:	48 c1 e0 06          	shl    rax,0x6
  8024f7:	48 05 94 26 40 00    	add    rax,0x402694
  8024fd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802500:	84 c0                	test   al,al
  802502:	0f 85 9a 00 00 00    	jne    8025a2 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802508:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80250b:	48 98                	cdqe   
  80250d:	48 c1 e0 06          	shl    rax,0x6
  802511:	48 05 93 26 40 00    	add    rax,0x402693
  802517:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80251a:	84 c0                	test   al,al
  80251c:	74 2e                	je     80254c <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80251e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802521:	48 98                	cdqe   
  802523:	48 c1 e0 06          	shl    rax,0x6
  802527:	48 05 80 26 40 00    	add    rax,0x402680
  80252d:	48 89 c7             	mov    rdi,rax
  802530:	e8 2c 02 00 00       	call   802761 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802535:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802538:	48 98                	cdqe   
  80253a:	48 c1 e0 06          	shl    rax,0x6
  80253e:	48 05 80 26 40 00    	add    rax,0x402680
  802544:	48 89 c7             	mov    rdi,rax
  802547:	e8 66 00 00 00       	call   8025b2 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80254c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80254f:	48 98                	cdqe   
  802551:	48 c1 e0 06          	shl    rax,0x6
  802555:	48 05 94 26 40 00    	add    rax,0x402694
  80255b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80255e:	8d 50 01             	lea    edx,[rax+0x1]
  802561:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802564:	48 98                	cdqe   
  802566:	48 c1 e0 06          	shl    rax,0x6
  80256a:	48 05 94 26 40 00    	add    rax,0x402694
  802570:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802572:	b8 00 00 00 00       	mov    eax,0x0
  802577:	e8 d5 eb ff ff       	call   801151 <vmalloc>
  80257c:	48 89 c2             	mov    rdx,rax
  80257f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802582:	48 98                	cdqe   
  802584:	48 c1 e0 06          	shl    rax,0x6
  802588:	48 05 80 26 40 00    	add    rax,0x402680
  80258e:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802591:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802594:	48 98                	cdqe   
  802596:	48 c1 e0 06          	shl    rax,0x6
  80259a:	48 05 80 26 40 00    	add    rax,0x402680
  8025a0:	eb 0e                	jmp    8025b0 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025a2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8025a6:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8025aa:	0f 8e 3e ff ff ff    	jle    8024ee <get_buf+0xed>
        }
    }
}
  8025b0:	c9                   	leave  
  8025b1:	c3                   	ret    

00000000008025b2 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8025b2:	f3 0f 1e fa          	endbr64 
  8025b6:	55                   	push   rbp
  8025b7:	48 89 e5             	mov    rbp,rsp
  8025ba:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  8025be:	90                   	nop
  8025bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025c3:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  8025c7:	84 c0                	test   al,al
  8025c9:	75 f4                	jne    8025bf <wait_on_buf+0xd>
    
}
  8025cb:	90                   	nop
  8025cc:	90                   	nop
  8025cd:	5d                   	pop    rbp
  8025ce:	c3                   	ret    

00000000008025cf <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8025cf:	f3 0f 1e fa          	endbr64 
  8025d3:	55                   	push   rbp
  8025d4:	48 89 e5             	mov    rbp,rsp
  8025d7:	48 83 ec 40          	sub    rsp,0x40
  8025db:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  8025de:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8025e1:	89 c7                	mov    edi,eax
  8025e3:	e8 3c 0e 00 00       	call   803424 <get_dev>
  8025e8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8025ec:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8025ef:	be 00 00 00 00       	mov    esi,0x0
  8025f4:	89 c7                	mov    edi,eax
  8025f6:	e8 5e fb ff ff       	call   802159 <bread>
  8025fb:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8025ff:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  802604:	75 0a                	jne    802610 <scan_dev+0x41>
  802606:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80260b:	e9 4f 01 00 00       	jmp    80275f <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  802610:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802614:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802617:	48 05 be 01 00 00    	add    rax,0x1be
  80261d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802621:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802628:	e9 17 01 00 00       	jmp    802744 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  80262d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802631:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802634:	0f b6 d0             	movzx  edx,al
  802637:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80263b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80263e:	48 63 c8             	movsxd rcx,eax
  802641:	48 89 c8             	mov    rax,rcx
  802644:	48 01 c0             	add    rax,rax
  802647:	48 01 c8             	add    rax,rcx
  80264a:	48 c1 e0 02          	shl    rax,0x2
  80264e:	48 01 f0             	add    rax,rsi
  802651:	48 83 c0 40          	add    rax,0x40
  802655:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  802658:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80265c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80265f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  802662:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  802666:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802669:	48 63 d0             	movsxd rdx,eax
  80266c:	48 89 d0             	mov    rax,rdx
  80266f:	48 01 c0             	add    rax,rax
  802672:	48 01 d0             	add    rax,rdx
  802675:	48 c1 e0 02          	shl    rax,0x2
  802679:	48 01 c8             	add    rax,rcx
  80267c:	48 8d 50 40          	lea    rdx,[rax+0x40]
  802680:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802683:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  802685:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80268c:	eb 68                	jmp    8026f6 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  80268e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802691:	48 63 d0             	movsxd rdx,eax
  802694:	48 89 d0             	mov    rax,rdx
  802697:	48 01 c0             	add    rax,rax
  80269a:	48 01 d0             	add    rax,rdx
  80269d:	48 c1 e0 03          	shl    rax,0x3
  8026a1:	48 05 80 23 40 00    	add    rax,0x402380
  8026a7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8026aa:	48 85 c0             	test   rax,rax
  8026ad:	74 43                	je     8026f2 <scan_dev+0x123>
  8026af:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8026b2:	48 63 d0             	movsxd rdx,eax
  8026b5:	48 89 d0             	mov    rax,rdx
  8026b8:	48 01 c0             	add    rax,rax
  8026bb:	48 01 d0             	add    rax,rdx
  8026be:	48 c1 e0 03          	shl    rax,0x3
  8026c2:	48 05 80 23 40 00    	add    rax,0x402380
  8026c8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8026cb:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8026ce:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026d1:	89 d6                	mov    esi,edx
  8026d3:	89 c7                	mov    edi,eax
  8026d5:	ff d1                	call   rcx
  8026d7:	85 c0                	test   eax,eax
  8026d9:	75 17                	jne    8026f2 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  8026db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8026df:	48 8d 50 14          	lea    rdx,[rax+0x14]
  8026e3:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  8026e6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026e9:	89 ce                	mov    esi,ecx
  8026eb:	89 c7                	mov    edi,eax
  8026ed:	e8 ae f1 ff ff       	call   8018a0 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8026f2:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8026f6:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8026fa:	7e 92                	jle    80268e <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8026fc:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  802700:	75 0f                	jne    802711 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  802702:	bf 88 17 81 00       	mov    edi,0x811788
  802707:	b8 00 00 00 00       	mov    eax,0x0
  80270c:	e8 32 e6 ff ff       	call   800d43 <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  802711:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802715:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802718:	89 c1                	mov    ecx,eax
  80271a:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80271e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802721:	48 63 d0             	movsxd rdx,eax
  802724:	48 89 d0             	mov    rax,rdx
  802727:	48 01 c0             	add    rax,rax
  80272a:	48 01 d0             	add    rax,rdx
  80272d:	48 c1 e0 02          	shl    rax,0x2
  802731:	48 01 f0             	add    rax,rsi
  802734:	48 83 c0 40          	add    rax,0x40
  802738:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  80273b:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802740:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802744:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802748:	0f 8e df fe ff ff    	jle    80262d <scan_dev+0x5e>
    }
    brelse(bh);
  80274e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802752:	48 89 c7             	mov    rdi,rax
  802755:	e8 9c f9 ff ff       	call   8020f6 <brelse>
    return 0;
  80275a:	b8 00 00 00 00       	mov    eax,0x0
}
  80275f:	c9                   	leave  
  802760:	c3                   	ret    

0000000000802761 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802761:	f3 0f 1e fa          	endbr64 
  802765:	55                   	push   rbp
  802766:	48 89 e5             	mov    rbp,rsp
  802769:	48 83 ec 20          	sub    rsp,0x20
  80276d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802771:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802775:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802779:	0f b7 c0             	movzx  eax,ax
  80277c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  80277f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802783:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802787:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80278a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80278e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802791:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802794:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802797:	b9 00 02 00 00       	mov    ecx,0x200
  80279c:	89 c7                	mov    edi,eax
  80279e:	e8 02 00 00 00       	call   8027a5 <write_block>

}
  8027a3:	c9                   	leave  
  8027a4:	c3                   	ret    

00000000008027a5 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8027a5:	f3 0f 1e fa          	endbr64 
  8027a9:	55                   	push   rbp
  8027aa:	48 89 e5             	mov    rbp,rsp
  8027ad:	48 83 ec 30          	sub    rsp,0x30
  8027b1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8027b4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8027b7:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8027bb:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8027be:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8027c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8027c4:	89 d6                	mov    esi,edx
  8027c6:	89 c7                	mov    edi,eax
  8027c8:	e8 34 fc ff ff       	call   802401 <get_buf>
  8027cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8027d1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8027d4:	ba 00 02 00 00       	mov    edx,0x200
  8027d9:	39 d0                	cmp    eax,edx
  8027db:	0f 4f c2             	cmovg  eax,edx
  8027de:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8027e1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8027e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8027eb:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8027ef:	48 89 ce             	mov    rsi,rcx
  8027f2:	48 89 c7             	mov    rdi,rax
  8027f5:	e8 db 6b 00 00       	call   8093d5 <memcpy>
        len-=BLOCK_SIZE;
  8027fa:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802801:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802805:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802809:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80280d:	48 89 c7             	mov    rdi,rax
  802810:	e8 e1 f8 ff ff       	call   8020f6 <brelse>
    }while(len>0);
  802815:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802819:	7f a3                	jg     8027be <write_block+0x19>
    return 0;
  80281b:	b8 00 00 00 00       	mov    eax,0x0
}
  802820:	c9                   	leave  
  802821:	c3                   	ret    

0000000000802822 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802822:	f3 0f 1e fa          	endbr64 
  802826:	55                   	push   rbp
  802827:	48 89 e5             	mov    rbp,rsp
  80282a:	48 83 ec 30          	sub    rsp,0x30
  80282e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802831:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802834:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802838:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  80283b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80283e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802841:	89 d6                	mov    esi,edx
  802843:	89 c7                	mov    edi,eax
  802845:	e8 0f f9 ff ff       	call   802159 <bread>
  80284a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80284e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802851:	ba 00 02 00 00       	mov    edx,0x200
  802856:	39 d0                	cmp    eax,edx
  802858:	0f 4f c2             	cmovg  eax,edx
  80285b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  80285e:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802861:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802865:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802868:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80286c:	48 89 ce             	mov    rsi,rcx
  80286f:	48 89 c7             	mov    rdi,rax
  802872:	e8 5e 6b 00 00       	call   8093d5 <memcpy>
        len-=BLOCK_SIZE;
  802877:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  80287e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802882:	48 89 c7             	mov    rdi,rax
  802885:	e8 6c f8 ff ff       	call   8020f6 <brelse>
    }while(len>0);
  80288a:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80288e:	7f ab                	jg     80283b <read_block+0x19>
    return 0;
  802890:	b8 00 00 00 00       	mov    eax,0x0
}
  802895:	c9                   	leave  
  802896:	c3                   	ret    

0000000000802897 <init_vfs>:

int init_vfs()
{
  802897:	f3 0f 1e fa          	endbr64 
  80289b:	55                   	push   rbp
  80289c:	48 89 e5             	mov    rbp,rsp
  80289f:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8028a3:	48 8b 05 d6 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05bd6]        # 408480 <dev_tree>
  8028aa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8028ae:	eb 40                	jmp    8028f0 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8028b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028b4:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8028ba:	48 c1 f8 02          	sar    rax,0x2
  8028be:	48 89 c2             	mov    rdx,rax
  8028c1:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  8028c8:	18 9c 8f 
  8028cb:	48 0f af c2          	imul   rax,rdx
  8028cf:	89 c7                	mov    edi,eax
  8028d1:	e8 f9 fc ff ff       	call   8025cf <scan_dev>
  8028d6:	85 c0                	test   eax,eax
  8028d8:	74 07                	je     8028e1 <init_vfs+0x4a>
  8028da:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8028df:	eb 1b                	jmp    8028fc <init_vfs+0x65>
    for(;p;p=p->next)
  8028e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028e5:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8028ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8028f0:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8028f5:	75 b9                	jne    8028b0 <init_vfs+0x19>
    }
    return 0;
  8028f7:	b8 00 00 00 00       	mov    eax,0x0
  8028fc:	c9                   	leave  
  8028fd:	c3                   	ret    

00000000008028fe <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8028fe:	f3 0f 1e fa          	endbr64 
  802902:	55                   	push   rbp
  802903:	48 89 e5             	mov    rbp,rsp
}
  802906:	90                   	nop
  802907:	5d                   	pop    rbp
  802908:	c3                   	ret    

0000000000802909 <load_driver>:
int load_driver(char *path)
{
  802909:	f3 0f 1e fa          	endbr64 
  80290d:	55                   	push   rbp
  80290e:	48 89 e5             	mov    rbp,rsp
  802911:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802915:	90                   	nop
  802916:	5d                   	pop    rbp
  802917:	c3                   	ret    

0000000000802918 <reg_device>:

int reg_device(device* dev)
{
  802918:	f3 0f 1e fa          	endbr64 
  80291c:	55                   	push   rbp
  80291d:	48 89 e5             	mov    rbp,rsp
  802920:	53                   	push   rbx
  802921:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802925:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  80292c:	e9 42 01 00 00       	jmp    802a73 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802931:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802934:	48 63 d0             	movsxd rdx,eax
  802937:	48 89 d0             	mov    rax,rdx
  80293a:	48 c1 e0 02          	shl    rax,0x2
  80293e:	48 01 d0             	add    rax,rdx
  802941:	48 c1 e0 02          	shl    rax,0x2
  802945:	48 01 d0             	add    rax,rdx
  802948:	48 c1 e0 03          	shl    rax,0x3
  80294c:	48 05 90 2e 40 00    	add    rax,0x402e90
  802952:	8b 00                	mov    eax,DWORD PTR [rax]
  802954:	85 c0                	test   eax,eax
  802956:	0f 85 13 01 00 00    	jne    802a6f <reg_device+0x157>
        {
            devs[i]=*dev;
  80295c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80295f:	48 63 d0             	movsxd rdx,eax
  802962:	48 89 d0             	mov    rax,rdx
  802965:	48 c1 e0 02          	shl    rax,0x2
  802969:	48 01 d0             	add    rax,rdx
  80296c:	48 c1 e0 02          	shl    rax,0x2
  802970:	48 01 d0             	add    rax,rdx
  802973:	48 c1 e0 03          	shl    rax,0x3
  802977:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  80297e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802982:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802985:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802989:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80298c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802990:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802994:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802998:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80299c:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8029a0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8029a4:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8029a8:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8029ac:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8029b0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8029b4:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8029b8:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8029bc:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8029c0:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8029c4:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8029c8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8029cc:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8029d0:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8029d4:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8029d8:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8029dc:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8029e0:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8029e4:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8029e8:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8029ec:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8029f0:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8029f4:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8029f8:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8029fc:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802a00:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802a07:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802a0e:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802a15:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802a1c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802a23:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802a2a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802a31:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802a38:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802a3f:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802a46:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a49:	48 63 d0             	movsxd rdx,eax
  802a4c:	48 89 d0             	mov    rax,rdx
  802a4f:	48 c1 e0 02          	shl    rax,0x2
  802a53:	48 01 d0             	add    rax,rdx
  802a56:	48 c1 e0 02          	shl    rax,0x2
  802a5a:	48 01 d0             	add    rax,rdx
  802a5d:	48 c1 e0 03          	shl    rax,0x3
  802a61:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a67:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802a6d:	eb 0e                	jmp    802a7d <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802a6f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802a73:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802a77:	0f 8e b4 fe ff ff    	jle    802931 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802a7d:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802a81:	75 0a                	jne    802a8d <reg_device+0x175>
        return -1;
  802a83:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a88:	e9 6d 01 00 00       	jmp    802bfa <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802a8d:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802a94:	00 
  802a95:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a98:	48 63 d0             	movsxd rdx,eax
  802a9b:	48 89 d0             	mov    rax,rdx
  802a9e:	48 c1 e0 02          	shl    rax,0x2
  802aa2:	48 01 d0             	add    rax,rdx
  802aa5:	48 c1 e0 02          	shl    rax,0x2
  802aa9:	48 01 d0             	add    rax,rdx
  802aac:	48 c1 e0 03          	shl    rax,0x3
  802ab0:	48 05 80 2e 40 00    	add    rax,0x402e80
  802ab6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802aba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802abe:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802ac1:	83 f8 03             	cmp    eax,0x3
  802ac4:	74 3b                	je     802b01 <reg_device+0x1e9>
  802ac6:	83 f8 03             	cmp    eax,0x3
  802ac9:	7f 4b                	jg     802b16 <reg_device+0x1fe>
  802acb:	83 f8 01             	cmp    eax,0x1
  802ace:	74 07                	je     802ad7 <reg_device+0x1bf>
  802ad0:	83 f8 02             	cmp    eax,0x2
  802ad3:	74 17                	je     802aec <reg_device+0x1d4>
  802ad5:	eb 3f                	jmp    802b16 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802ad7:	48 8b 05 a2 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059a2]        # 408480 <dev_tree>
  802ade:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ae2:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802ae9:	00 
        break;
  802aea:	eb 34                	jmp    802b20 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802aec:	48 8b 05 95 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05995]        # 408488 <dev_tree+0x8>
  802af3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802af7:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802afe:	00 
        break;
  802aff:	eb 1f                	jmp    802b20 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802b01:	48 8b 05 88 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05988]        # 408490 <dev_tree+0x10>
  802b08:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b0c:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802b13:	00 
        break;
  802b14:	eb 0a                	jmp    802b20 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802b16:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b1b:	e9 da 00 00 00       	jmp    802bfa <reg_device+0x2e2>
    }
    if(!p){
  802b20:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802b25:	75 2b                	jne    802b52 <reg_device+0x23a>
        *pp=neo;
  802b27:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802b2b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b2f:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802b32:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b36:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802b3d:	00 00 00 00 
  802b41:	eb 3d                	jmp    802b80 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802b43:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b47:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b4e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b56:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b5d:	48 85 c0             	test   rax,rax
  802b60:	75 e1                	jne    802b43 <reg_device+0x22b>
        p->next=neo;
  802b62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b66:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b6a:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802b71:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b75:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802b79:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802b80:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b84:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802b8b:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802b8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b93:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802b96:	83 f8 04             	cmp    eax,0x4
  802b99:	74 3b                	je     802bd6 <reg_device+0x2be>
  802b9b:	83 f8 04             	cmp    eax,0x4
  802b9e:	7f 56                	jg     802bf6 <reg_device+0x2de>
  802ba0:	83 f8 03             	cmp    eax,0x3
  802ba3:	74 21                	je     802bc6 <reg_device+0x2ae>
  802ba5:	83 f8 03             	cmp    eax,0x3
  802ba8:	7f 4c                	jg     802bf6 <reg_device+0x2de>
  802baa:	83 f8 01             	cmp    eax,0x1
  802bad:	74 07                	je     802bb6 <reg_device+0x29e>
  802baf:	83 f8 02             	cmp    eax,0x2
  802bb2:	74 32                	je     802be6 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802bb4:	eb 40                	jmp    802bf6 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802bb6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bba:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802bc1:	00 00 00 
        break;
  802bc4:	eb 31                	jmp    802bf7 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802bc6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bca:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802bd1:	00 00 00 
        break;
  802bd4:	eb 21                	jmp    802bf7 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802bd6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bda:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802be1:	00 00 00 
        break;
  802be4:	eb 11                	jmp    802bf7 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802be6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bea:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802bf1:	00 00 00 
        break;
  802bf4:	eb 01                	jmp    802bf7 <reg_device+0x2df>
        break;
  802bf6:	90                   	nop
    }
    return i;
  802bf7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802bfa:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802bfe:	c9                   	leave  
  802bff:	c3                   	ret    

0000000000802c00 <reg_driver>:


int reg_driver(driver *drv)
{
  802c00:	f3 0f 1e fa          	endbr64 
  802c04:	55                   	push   rbp
  802c05:	48 89 e5             	mov    rbp,rsp
  802c08:	53                   	push   rbx
  802c09:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802c0d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802c14:	e9 22 01 00 00       	jmp    802d3b <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802c19:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c1c:	48 63 d0             	movsxd rdx,eax
  802c1f:	48 89 d0             	mov    rax,rdx
  802c22:	48 c1 e0 02          	shl    rax,0x2
  802c26:	48 01 d0             	add    rax,rdx
  802c29:	48 c1 e0 05          	shl    rax,0x5
  802c2d:	48 05 80 58 40 00    	add    rax,0x405880
  802c33:	8b 00                	mov    eax,DWORD PTR [rax]
  802c35:	85 c0                	test   eax,eax
  802c37:	0f 85 fa 00 00 00    	jne    802d37 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802c3d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c40:	48 63 d0             	movsxd rdx,eax
  802c43:	48 89 d0             	mov    rax,rdx
  802c46:	48 c1 e0 02          	shl    rax,0x2
  802c4a:	48 01 d0             	add    rax,rdx
  802c4d:	48 c1 e0 05          	shl    rax,0x5
  802c51:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802c58:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c5c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802c5f:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802c63:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802c66:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802c6a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802c6e:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802c72:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802c76:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802c7a:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802c7e:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802c82:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802c86:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802c8a:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802c8e:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802c92:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802c96:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802c9a:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802c9e:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802ca2:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802ca6:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802caa:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802cae:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802cb2:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802cb6:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802cba:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802cbe:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802cc2:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802cc6:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802cca:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802cce:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802cd2:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802cd6:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802cda:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ce1:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802ce8:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802cef:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802cf6:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802cfd:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802d04:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802d0b:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802d12:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d15:	48 63 d0             	movsxd rdx,eax
  802d18:	48 89 d0             	mov    rax,rdx
  802d1b:	48 c1 e0 02          	shl    rax,0x2
  802d1f:	48 01 d0             	add    rax,rdx
  802d22:	48 c1 e0 05          	shl    rax,0x5
  802d26:	48 05 80 58 40 00    	add    rax,0x405880
  802d2c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802d32:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d35:	eb 13                	jmp    802d4a <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802d37:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802d3b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802d3f:	0f 8e d4 fe ff ff    	jle    802c19 <reg_driver+0x19>
        }
    }
    return -1;
  802d45:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802d4a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d4e:	c9                   	leave  
  802d4f:	c3                   	ret    

0000000000802d50 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802d50:	f3 0f 1e fa          	endbr64 
  802d54:	55                   	push   rbp
  802d55:	48 89 e5             	mov    rbp,rsp
  802d58:	48 83 ec 20          	sub    rsp,0x20
  802d5c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802d60:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802d67:	eb 6c                	jmp    802dd5 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802d69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d6c:	48 63 d0             	movsxd rdx,eax
  802d6f:	48 89 d0             	mov    rax,rdx
  802d72:	48 c1 e0 02          	shl    rax,0x2
  802d76:	48 01 d0             	add    rax,rdx
  802d79:	48 c1 e0 02          	shl    rax,0x2
  802d7d:	48 01 d0             	add    rax,rdx
  802d80:	48 c1 e0 03          	shl    rax,0x3
  802d84:	48 05 90 2e 40 00    	add    rax,0x402e90
  802d8a:	8b 00                	mov    eax,DWORD PTR [rax]
  802d8c:	85 c0                	test   eax,eax
  802d8e:	74 41                	je     802dd1 <sys_find_dev+0x81>
  802d90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d93:	48 63 d0             	movsxd rdx,eax
  802d96:	48 89 d0             	mov    rax,rdx
  802d99:	48 c1 e0 02          	shl    rax,0x2
  802d9d:	48 01 d0             	add    rax,rdx
  802da0:	48 c1 e0 02          	shl    rax,0x2
  802da4:	48 01 d0             	add    rax,rdx
  802da7:	48 c1 e0 03          	shl    rax,0x3
  802dab:	48 83 c0 10          	add    rax,0x10
  802daf:	48 05 80 2e 40 00    	add    rax,0x402e80
  802db5:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802db9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802dbd:	48 89 d6             	mov    rsi,rdx
  802dc0:	48 89 c7             	mov    rdi,rax
  802dc3:	e8 ab 68 00 00       	call   809673 <strcmp>
  802dc8:	85 c0                	test   eax,eax
  802dca:	75 05                	jne    802dd1 <sys_find_dev+0x81>
            return i;
  802dcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dcf:	eb 0f                	jmp    802de0 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802dd1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802dd5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802dd9:	7e 8e                	jle    802d69 <sys_find_dev+0x19>
    }
    return -1;
  802ddb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802de0:	c9                   	leave  
  802de1:	c3                   	ret    

0000000000802de2 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802de2:	f3 0f 1e fa          	endbr64 
  802de6:	55                   	push   rbp
  802de7:	48 89 e5             	mov    rbp,rsp
  802dea:	48 83 ec 30          	sub    rsp,0x30
  802dee:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802df2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802df5:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802df9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802e00:	eb 67                	jmp    802e69 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802e02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e05:	48 63 d0             	movsxd rdx,eax
  802e08:	48 89 d0             	mov    rax,rdx
  802e0b:	48 c1 e0 02          	shl    rax,0x2
  802e0f:	48 01 d0             	add    rax,rdx
  802e12:	48 c1 e0 02          	shl    rax,0x2
  802e16:	48 01 d0             	add    rax,rdx
  802e19:	48 c1 e0 03          	shl    rax,0x3
  802e1d:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e23:	8b 00                	mov    eax,DWORD PTR [rax]
  802e25:	85 c0                	test   eax,eax
  802e27:	74 3c                	je     802e65 <sys_operate_dev+0x83>
  802e29:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e2c:	48 63 d0             	movsxd rdx,eax
  802e2f:	48 89 d0             	mov    rax,rdx
  802e32:	48 c1 e0 02          	shl    rax,0x2
  802e36:	48 01 d0             	add    rax,rdx
  802e39:	48 c1 e0 02          	shl    rax,0x2
  802e3d:	48 01 d0             	add    rax,rdx
  802e40:	48 c1 e0 03          	shl    rax,0x3
  802e44:	48 83 c0 10          	add    rax,0x10
  802e48:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e4e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e56:	48 89 d6             	mov    rsi,rdx
  802e59:	48 89 c7             	mov    rdi,rax
  802e5c:	e8 12 68 00 00       	call   809673 <strcmp>
  802e61:	85 c0                	test   eax,eax
  802e63:	74 0c                	je     802e71 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802e65:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802e69:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802e6d:	7e 93                	jle    802e02 <sys_operate_dev+0x20>
  802e6f:	eb 01                	jmp    802e72 <sys_operate_dev+0x90>
            break;
  802e71:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802e72:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802e76:	75 0a                	jne    802e82 <sys_operate_dev+0xa0>
  802e78:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e7d:	e9 9c 02 00 00       	jmp    80311e <sys_operate_dev+0x33c>
    switch (func) {
  802e82:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802e86:	0f 87 8d 02 00 00    	ja     803119 <sys_operate_dev+0x337>
  802e8c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802e8f:	48 8b 04 c5 a8 17 81 	mov    rax,QWORD PTR [rax*8+0x8117a8]
  802e96:	00 
  802e97:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802e9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e9d:	48 63 d0             	movsxd rdx,eax
  802ea0:	48 89 d0             	mov    rax,rdx
  802ea3:	48 c1 e0 02          	shl    rax,0x2
  802ea7:	48 01 d0             	add    rax,rdx
  802eaa:	48 c1 e0 02          	shl    rax,0x2
  802eae:	48 01 d0             	add    rax,rdx
  802eb1:	48 c1 e0 03          	shl    rax,0x3
  802eb5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ebb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ebe:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802ec2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ec6:	48 89 c7             	mov    rdi,rax
  802ec9:	ff d2                	call   rdx
  802ecb:	e9 4e 02 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802ed0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ed3:	48 63 d0             	movsxd rdx,eax
  802ed6:	48 89 d0             	mov    rax,rdx
  802ed9:	48 c1 e0 02          	shl    rax,0x2
  802edd:	48 01 d0             	add    rax,rdx
  802ee0:	48 c1 e0 02          	shl    rax,0x2
  802ee4:	48 01 d0             	add    rax,rdx
  802ee7:	48 c1 e0 03          	shl    rax,0x3
  802eeb:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ef1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ef4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802ef8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802efc:	48 89 c7             	mov    rdi,rax
  802eff:	ff d2                	call   rdx
  802f01:	e9 18 02 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802f06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f09:	48 63 d0             	movsxd rdx,eax
  802f0c:	48 89 d0             	mov    rax,rdx
  802f0f:	48 c1 e0 02          	shl    rax,0x2
  802f13:	48 01 d0             	add    rax,rdx
  802f16:	48 c1 e0 02          	shl    rax,0x2
  802f1a:	48 01 d0             	add    rax,rdx
  802f1d:	48 c1 e0 03          	shl    rax,0x3
  802f21:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f27:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f2a:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802f2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f32:	48 89 c7             	mov    rdi,rax
  802f35:	ff d2                	call   rdx
  802f37:	e9 e2 01 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802f3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f3f:	48 63 d0             	movsxd rdx,eax
  802f42:	48 89 d0             	mov    rax,rdx
  802f45:	48 c1 e0 02          	shl    rax,0x2
  802f49:	48 01 d0             	add    rax,rdx
  802f4c:	48 c1 e0 02          	shl    rax,0x2
  802f50:	48 01 d0             	add    rax,rdx
  802f53:	48 c1 e0 03          	shl    rax,0x3
  802f57:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f5d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f60:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802f64:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f68:	48 89 c7             	mov    rdi,rax
  802f6b:	ff d2                	call   rdx
  802f6d:	e9 ac 01 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802f72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f75:	48 63 d0             	movsxd rdx,eax
  802f78:	48 89 d0             	mov    rax,rdx
  802f7b:	48 c1 e0 02          	shl    rax,0x2
  802f7f:	48 01 d0             	add    rax,rdx
  802f82:	48 c1 e0 02          	shl    rax,0x2
  802f86:	48 01 d0             	add    rax,rdx
  802f89:	48 c1 e0 03          	shl    rax,0x3
  802f8d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f93:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f96:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802f9a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f9e:	48 89 c7             	mov    rdi,rax
  802fa1:	ff d2                	call   rdx
  802fa3:	e9 76 01 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802fa8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fab:	48 63 d0             	movsxd rdx,eax
  802fae:	48 89 d0             	mov    rax,rdx
  802fb1:	48 c1 e0 02          	shl    rax,0x2
  802fb5:	48 01 d0             	add    rax,rdx
  802fb8:	48 c1 e0 02          	shl    rax,0x2
  802fbc:	48 01 d0             	add    rax,rdx
  802fbf:	48 c1 e0 03          	shl    rax,0x3
  802fc3:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fc9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fcc:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802fd0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fd4:	48 89 c7             	mov    rdi,rax
  802fd7:	ff d2                	call   rdx
  802fd9:	e9 40 01 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802fde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fe1:	48 63 d0             	movsxd rdx,eax
  802fe4:	48 89 d0             	mov    rax,rdx
  802fe7:	48 c1 e0 02          	shl    rax,0x2
  802feb:	48 01 d0             	add    rax,rdx
  802fee:	48 c1 e0 02          	shl    rax,0x2
  802ff2:	48 01 d0             	add    rax,rdx
  802ff5:	48 c1 e0 03          	shl    rax,0x3
  802ff9:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803002:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803006:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80300a:	48 89 c7             	mov    rdi,rax
  80300d:	ff d2                	call   rdx
  80300f:	e9 0a 01 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803014:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803017:	48 63 d0             	movsxd rdx,eax
  80301a:	48 89 d0             	mov    rax,rdx
  80301d:	48 c1 e0 02          	shl    rax,0x2
  803021:	48 01 d0             	add    rax,rdx
  803024:	48 c1 e0 02          	shl    rax,0x2
  803028:	48 01 d0             	add    rax,rdx
  80302b:	48 c1 e0 03          	shl    rax,0x3
  80302f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803035:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803038:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80303c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803040:	48 89 c7             	mov    rdi,rax
  803043:	ff d2                	call   rdx
  803045:	e9 d4 00 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  80304a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80304d:	48 63 d0             	movsxd rdx,eax
  803050:	48 89 d0             	mov    rax,rdx
  803053:	48 c1 e0 02          	shl    rax,0x2
  803057:	48 01 d0             	add    rax,rdx
  80305a:	48 c1 e0 02          	shl    rax,0x2
  80305e:	48 01 d0             	add    rax,rdx
  803061:	48 c1 e0 03          	shl    rax,0x3
  803065:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80306b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80306e:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803072:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803076:	48 89 c7             	mov    rdi,rax
  803079:	ff d2                	call   rdx
  80307b:	e9 9e 00 00 00       	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803080:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803083:	48 63 d0             	movsxd rdx,eax
  803086:	48 89 d0             	mov    rax,rdx
  803089:	48 c1 e0 02          	shl    rax,0x2
  80308d:	48 01 d0             	add    rax,rdx
  803090:	48 c1 e0 02          	shl    rax,0x2
  803094:	48 01 d0             	add    rax,rdx
  803097:	48 c1 e0 03          	shl    rax,0x3
  80309b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030a4:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8030a8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030ac:	48 89 c7             	mov    rdi,rax
  8030af:	ff d2                	call   rdx
  8030b1:	eb 6b                	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8030b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030b6:	48 63 d0             	movsxd rdx,eax
  8030b9:	48 89 d0             	mov    rax,rdx
  8030bc:	48 c1 e0 02          	shl    rax,0x2
  8030c0:	48 01 d0             	add    rax,rdx
  8030c3:	48 c1 e0 02          	shl    rax,0x2
  8030c7:	48 01 d0             	add    rax,rdx
  8030ca:	48 c1 e0 03          	shl    rax,0x3
  8030ce:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030d7:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8030db:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030df:	48 89 c7             	mov    rdi,rax
  8030e2:	ff d2                	call   rdx
  8030e4:	eb 38                	jmp    80311e <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8030e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030e9:	48 63 d0             	movsxd rdx,eax
  8030ec:	48 89 d0             	mov    rax,rdx
  8030ef:	48 c1 e0 02          	shl    rax,0x2
  8030f3:	48 01 d0             	add    rax,rdx
  8030f6:	48 c1 e0 02          	shl    rax,0x2
  8030fa:	48 01 d0             	add    rax,rdx
  8030fd:	48 c1 e0 03          	shl    rax,0x3
  803101:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803107:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80310a:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80310e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803112:	48 89 c7             	mov    rdi,rax
  803115:	ff d2                	call   rdx
  803117:	eb 05                	jmp    80311e <sys_operate_dev+0x33c>
    }
    return -1;
  803119:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80311e:	c9                   	leave  
  80311f:	c3                   	ret    

0000000000803120 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803120:	f3 0f 1e fa          	endbr64 
  803124:	55                   	push   rbp
  803125:	48 89 e5             	mov    rbp,rsp
  803128:	48 83 ec 10          	sub    rsp,0x10
  80312c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80312f:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803132:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803136:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803139:	48 63 d0             	movsxd rdx,eax
  80313c:	48 89 d0             	mov    rax,rdx
  80313f:	48 c1 e0 02          	shl    rax,0x2
  803143:	48 01 d0             	add    rax,rdx
  803146:	48 c1 e0 05          	shl    rax,0x5
  80314a:	48 05 80 58 40 00    	add    rax,0x405880
  803150:	8b 00                	mov    eax,DWORD PTR [rax]
  803152:	85 c0                	test   eax,eax
  803154:	75 0a                	jne    803160 <call_drv_func+0x40>
  803156:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80315b:	e9 15 02 00 00       	jmp    803375 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803160:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803164:	0f 87 06 02 00 00    	ja     803370 <call_drv_func+0x250>
  80316a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80316d:	48 8b 04 c5 08 18 81 	mov    rax,QWORD PTR [rax*8+0x811808]
  803174:	00 
  803175:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803178:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80317b:	48 63 d0             	movsxd rdx,eax
  80317e:	48 89 d0             	mov    rax,rdx
  803181:	48 c1 e0 02          	shl    rax,0x2
  803185:	48 01 d0             	add    rax,rdx
  803188:	48 c1 e0 05          	shl    rax,0x5
  80318c:	48 05 88 58 40 00    	add    rax,0x405888
  803192:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803195:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803199:	48 89 c7             	mov    rdi,rax
  80319c:	ff d2                	call   rdx
  80319e:	e9 d2 01 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8031a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031a6:	48 63 d0             	movsxd rdx,eax
  8031a9:	48 89 d0             	mov    rax,rdx
  8031ac:	48 c1 e0 02          	shl    rax,0x2
  8031b0:	48 01 d0             	add    rax,rdx
  8031b3:	48 c1 e0 05          	shl    rax,0x5
  8031b7:	48 05 90 58 40 00    	add    rax,0x405890
  8031bd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031c4:	48 89 c7             	mov    rdi,rax
  8031c7:	ff d2                	call   rdx
  8031c9:	e9 a7 01 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8031ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031d1:	48 63 d0             	movsxd rdx,eax
  8031d4:	48 89 d0             	mov    rax,rdx
  8031d7:	48 c1 e0 02          	shl    rax,0x2
  8031db:	48 01 d0             	add    rax,rdx
  8031de:	48 c1 e0 05          	shl    rax,0x5
  8031e2:	48 05 98 58 40 00    	add    rax,0x405898
  8031e8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031ef:	48 89 c7             	mov    rdi,rax
  8031f2:	ff d2                	call   rdx
  8031f4:	e9 7c 01 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8031f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031fc:	48 63 d0             	movsxd rdx,eax
  8031ff:	48 89 d0             	mov    rax,rdx
  803202:	48 c1 e0 02          	shl    rax,0x2
  803206:	48 01 d0             	add    rax,rdx
  803209:	48 c1 e0 05          	shl    rax,0x5
  80320d:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803213:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803216:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80321a:	48 89 c7             	mov    rdi,rax
  80321d:	ff d2                	call   rdx
  80321f:	e9 51 01 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803224:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803227:	48 63 d0             	movsxd rdx,eax
  80322a:	48 89 d0             	mov    rax,rdx
  80322d:	48 c1 e0 02          	shl    rax,0x2
  803231:	48 01 d0             	add    rax,rdx
  803234:	48 c1 e0 05          	shl    rax,0x5
  803238:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80323e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803241:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803245:	48 89 c7             	mov    rdi,rax
  803248:	ff d2                	call   rdx
  80324a:	e9 26 01 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80324f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803252:	48 63 d0             	movsxd rdx,eax
  803255:	48 89 d0             	mov    rax,rdx
  803258:	48 c1 e0 02          	shl    rax,0x2
  80325c:	48 01 d0             	add    rax,rdx
  80325f:	48 c1 e0 05          	shl    rax,0x5
  803263:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803269:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80326c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803270:	48 89 c7             	mov    rdi,rax
  803273:	ff d2                	call   rdx
  803275:	e9 fb 00 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  80327a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80327d:	48 63 d0             	movsxd rdx,eax
  803280:	48 89 d0             	mov    rax,rdx
  803283:	48 c1 e0 02          	shl    rax,0x2
  803287:	48 01 d0             	add    rax,rdx
  80328a:	48 c1 e0 05          	shl    rax,0x5
  80328e:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803294:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803297:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80329b:	48 89 c7             	mov    rdi,rax
  80329e:	ff d2                	call   rdx
  8032a0:	e9 d0 00 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8032a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032a8:	48 63 d0             	movsxd rdx,eax
  8032ab:	48 89 d0             	mov    rax,rdx
  8032ae:	48 c1 e0 02          	shl    rax,0x2
  8032b2:	48 01 d0             	add    rax,rdx
  8032b5:	48 c1 e0 05          	shl    rax,0x5
  8032b9:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8032bf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032c6:	48 89 c7             	mov    rdi,rax
  8032c9:	ff d2                	call   rdx
  8032cb:	e9 a5 00 00 00       	jmp    803375 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8032d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032d3:	48 63 d0             	movsxd rdx,eax
  8032d6:	48 89 d0             	mov    rax,rdx
  8032d9:	48 c1 e0 02          	shl    rax,0x2
  8032dd:	48 01 d0             	add    rax,rdx
  8032e0:	48 c1 e0 05          	shl    rax,0x5
  8032e4:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8032ea:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032f1:	48 89 c7             	mov    rdi,rax
  8032f4:	ff d2                	call   rdx
  8032f6:	eb 7d                	jmp    803375 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8032f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032fb:	48 63 d0             	movsxd rdx,eax
  8032fe:	48 89 d0             	mov    rax,rdx
  803301:	48 c1 e0 02          	shl    rax,0x2
  803305:	48 01 d0             	add    rax,rdx
  803308:	48 c1 e0 05          	shl    rax,0x5
  80330c:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803312:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803315:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803319:	48 89 c7             	mov    rdi,rax
  80331c:	ff d2                	call   rdx
  80331e:	eb 55                	jmp    803375 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803320:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803323:	48 63 d0             	movsxd rdx,eax
  803326:	48 89 d0             	mov    rax,rdx
  803329:	48 c1 e0 02          	shl    rax,0x2
  80332d:	48 01 d0             	add    rax,rdx
  803330:	48 c1 e0 05          	shl    rax,0x5
  803334:	48 05 d8 58 40 00    	add    rax,0x4058d8
  80333a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80333d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803341:	48 89 c7             	mov    rdi,rax
  803344:	ff d2                	call   rdx
  803346:	eb 2d                	jmp    803375 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803348:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80334b:	48 63 d0             	movsxd rdx,eax
  80334e:	48 89 d0             	mov    rax,rdx
  803351:	48 c1 e0 02          	shl    rax,0x2
  803355:	48 01 d0             	add    rax,rdx
  803358:	48 c1 e0 05          	shl    rax,0x5
  80335c:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803362:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803365:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803369:	48 89 c7             	mov    rdi,rax
  80336c:	ff d2                	call   rdx
  80336e:	eb 05                	jmp    803375 <call_drv_func+0x255>
    }
    return -1;
  803370:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803375:	c9                   	leave  
  803376:	c3                   	ret    

0000000000803377 <dispose_device>:
int dispose_device(int dev){
  803377:	f3 0f 1e fa          	endbr64 
  80337b:	55                   	push   rbp
  80337c:	48 89 e5             	mov    rbp,rsp
  80337f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803382:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803385:	48 63 d0             	movsxd rdx,eax
  803388:	48 89 d0             	mov    rax,rdx
  80338b:	48 c1 e0 02          	shl    rax,0x2
  80338f:	48 01 d0             	add    rax,rdx
  803392:	48 c1 e0 02          	shl    rax,0x2
  803396:	48 01 d0             	add    rax,rdx
  803399:	48 c1 e0 03          	shl    rax,0x3
  80339d:	48 05 90 2e 40 00    	add    rax,0x402e90
  8033a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8033a5:	83 f8 01             	cmp    eax,0x1
  8033a8:	74 07                	je     8033b1 <dispose_device+0x3a>
  8033aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8033af:	eb 62                	jmp    803413 <dispose_device+0x9c>
    device* p=&devs[dev];
  8033b1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8033b4:	48 63 d0             	movsxd rdx,eax
  8033b7:	48 89 d0             	mov    rax,rdx
  8033ba:	48 c1 e0 02          	shl    rax,0x2
  8033be:	48 01 d0             	add    rax,rdx
  8033c1:	48 c1 e0 02          	shl    rax,0x2
  8033c5:	48 01 d0             	add    rax,rdx
  8033c8:	48 c1 e0 03          	shl    rax,0x3
  8033cc:	48 05 80 2e 40 00    	add    rax,0x402e80
  8033d2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8033d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8033da:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8033e1:	48 85 c0             	test   rax,rax
  8033e4:	74 1d                	je     803403 <dispose_device+0x8c>
  8033e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8033ea:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8033f1:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8033f5:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8033fc:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803403:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803407:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80340e:	b8 00 00 00 00       	mov    eax,0x0
}
  803413:	5d                   	pop    rbp
  803414:	c3                   	ret    

0000000000803415 <dispose_driver>:
int dispose_driver(driver *drv){
  803415:	f3 0f 1e fa          	endbr64 
  803419:	55                   	push   rbp
  80341a:	48 89 e5             	mov    rbp,rsp
  80341d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803421:	90                   	nop
  803422:	5d                   	pop    rbp
  803423:	c3                   	ret    

0000000000803424 <get_dev>:

device *get_dev(int devi)
{
  803424:	f3 0f 1e fa          	endbr64 
  803428:	55                   	push   rbp
  803429:	48 89 e5             	mov    rbp,rsp
  80342c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80342f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803432:	48 63 d0             	movsxd rdx,eax
  803435:	48 89 d0             	mov    rax,rdx
  803438:	48 c1 e0 02          	shl    rax,0x2
  80343c:	48 01 d0             	add    rax,rdx
  80343f:	48 c1 e0 02          	shl    rax,0x2
  803443:	48 01 d0             	add    rax,rdx
  803446:	48 c1 e0 03          	shl    rax,0x3
  80344a:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803450:	5d                   	pop    rbp
  803451:	c3                   	ret    

0000000000803452 <get_drv>:
driver *get_drv(int drvi)
{
  803452:	f3 0f 1e fa          	endbr64 
  803456:	55                   	push   rbp
  803457:	48 89 e5             	mov    rbp,rsp
  80345a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  80345d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803460:	48 63 d0             	movsxd rdx,eax
  803463:	48 89 d0             	mov    rax,rdx
  803466:	48 c1 e0 02          	shl    rax,0x2
  80346a:	48 01 d0             	add    rax,rdx
  80346d:	48 c1 e0 05          	shl    rax,0x5
  803471:	48 05 80 58 40 00    	add    rax,0x405880
}
  803477:	5d                   	pop    rbp
  803478:	c3                   	ret    

0000000000803479 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803479:	f3 0f 1e fa          	endbr64 
  80347d:	55                   	push   rbp
  80347e:	48 89 e5             	mov    rbp,rsp
  803481:	53                   	push   rbx
  803482:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803486:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  80348d:	eb 23                	jmp    8034b2 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80348f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803492:	48 63 d0             	movsxd rdx,eax
  803495:	48 89 d0             	mov    rax,rdx
  803498:	48 01 c0             	add    rax,rax
  80349b:	48 01 d0             	add    rax,rdx
  80349e:	48 c1 e0 06          	shl    rax,0x6
  8034a2:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8034a8:	8b 00                	mov    eax,DWORD PTR [rax]
  8034aa:	85 c0                	test   eax,eax
  8034ac:	74 0c                	je     8034ba <make_request+0x41>
    for(;i<NR_REQS;i++)
  8034ae:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8034b2:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8034b6:	7e d7                	jle    80348f <make_request+0x16>
  8034b8:	eb 01                	jmp    8034bb <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8034ba:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  8034bb:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  8034bf:	75 0a                	jne    8034cb <make_request+0x52>
  8034c1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8034c6:	e9 e7 01 00 00       	jmp    8036b2 <make_request+0x239>
    reqs[i]=*args;//放入数组
  8034cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8034ce:	48 63 d0             	movsxd rdx,eax
  8034d1:	48 89 d0             	mov    rax,rdx
  8034d4:	48 01 c0             	add    rax,rax
  8034d7:	48 01 d0             	add    rax,rdx
  8034da:	48 c1 e0 06          	shl    rax,0x6
  8034de:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8034e5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8034e9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8034ec:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8034f0:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8034f3:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8034f7:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8034fb:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8034ff:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803503:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803507:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80350b:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80350f:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803513:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803517:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80351b:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80351f:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803523:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803527:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80352b:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80352f:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803533:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803537:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80353b:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80353f:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803543:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803547:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80354b:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80354f:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803553:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803557:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80355b:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80355f:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803563:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803567:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80356e:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803575:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80357c:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803583:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80358a:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803591:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803598:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80359f:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8035a6:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8035ad:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  8035b4:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  8035bb:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  8035c2:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  8035c9:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  8035d0:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  8035d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8035db:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8035e1:	48 63 d0             	movsxd rdx,eax
  8035e4:	48 89 d0             	mov    rax,rdx
  8035e7:	48 c1 e0 02          	shl    rax,0x2
  8035eb:	48 01 d0             	add    rax,rdx
  8035ee:	48 c1 e0 02          	shl    rax,0x2
  8035f2:	48 01 d0             	add    rax,rdx
  8035f5:	48 c1 e0 03          	shl    rax,0x3
  8035f9:	48 05 80 2e 40 00    	add    rax,0x402e80
  8035ff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803603:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803607:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80360e:	48 85 c0             	test   rax,rax
  803611:	75 27                	jne    80363a <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803613:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803616:	48 63 d0             	movsxd rdx,eax
  803619:	48 89 d0             	mov    rax,rdx
  80361c:	48 01 c0             	add    rax,rax
  80361f:	48 01 d0             	add    rax,rdx
  803622:	48 c1 e0 06          	shl    rax,0x6
  803626:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80362d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803631:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803638:	eb 75                	jmp    8036af <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  80363a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80363e:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803645:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803649:	eb 0f                	jmp    80365a <make_request+0x1e1>
  80364b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80364f:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803656:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80365a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80365e:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803665:	48 85 c0             	test   rax,rax
  803668:	75 e1                	jne    80364b <make_request+0x1d2>
        p->next=&reqs[i];
  80366a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80366d:	48 63 d0             	movsxd rdx,eax
  803670:	48 89 d0             	mov    rax,rdx
  803673:	48 01 c0             	add    rax,rax
  803676:	48 01 d0             	add    rax,rdx
  803679:	48 c1 e0 06          	shl    rax,0x6
  80367d:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803684:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803688:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  80368f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803692:	48 63 d0             	movsxd rdx,eax
  803695:	48 89 d0             	mov    rax,rdx
  803698:	48 01 c0             	add    rax,rax
  80369b:	48 01 d0             	add    rax,rdx
  80369e:	48 c1 e0 06          	shl    rax,0x6
  8036a2:	48 05 38 6d 40 00    	add    rax,0x406d38
  8036a8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8036af:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8036b2:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8036b6:	c9                   	leave  
  8036b7:	c3                   	ret    

00000000008036b8 <do_req>:
//取出一个申请并且执行
int do_req()
{
  8036b8:	f3 0f 1e fa          	endbr64 
  8036bc:	55                   	push   rbp
  8036bd:	48 89 e5             	mov    rbp,rsp
  8036c0:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  8036c4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8036cb:	e9 ab 00 00 00       	jmp    80377b <do_req+0xc3>
    {
        device* p=dev_tree[i];
  8036d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d3:	48 98                	cdqe   
  8036d5:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  8036dc:	00 
  8036dd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8036e1:	e9 86 00 00 00       	jmp    80376c <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8036e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036ea:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8036f1:	48 85 c0             	test   rax,rax
  8036f4:	75 67                	jne    80375d <do_req+0xa5>
  8036f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036fa:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803701:	48 85 c0             	test   rax,rax
  803704:	74 57                	je     80375d <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803706:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80370a:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803711:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803715:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  80371c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803720:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803727:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80372e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803732:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803739:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80373d:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803743:	48 98                	cdqe   
  803745:	48 8b 14 c5 a0 9d 80 	mov    rdx,QWORD PTR [rax*8+0x809da0]
  80374c:	00 
  80374d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803751:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803758:	48 89 c7             	mov    rdi,rax
  80375b:	ff d2                	call   rdx
        for(;p;p=p->next)
  80375d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803761:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803768:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80376c:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803771:	0f 85 6f ff ff ff    	jne    8036e6 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803777:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80377b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80377f:	0f 8e 4b ff ff ff    	jle    8036d0 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803785:	b8 00 00 00 00       	mov    eax,0x0
}
  80378a:	c9                   	leave  
  80378b:	c3                   	ret    

000000000080378c <wait_on_req>:


void wait_on_req(int reqi)
{
  80378c:	f3 0f 1e fa          	endbr64 
  803790:	55                   	push   rbp
  803791:	48 89 e5             	mov    rbp,rsp
  803794:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803797:	90                   	nop
  803798:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80379b:	48 63 d0             	movsxd rdx,eax
  80379e:	48 89 d0             	mov    rax,rdx
  8037a1:	48 01 c0             	add    rax,rax
  8037a4:	48 01 d0             	add    rax,rdx
  8037a7:	48 c1 e0 06          	shl    rax,0x6
  8037ab:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8037b1:	8b 00                	mov    eax,DWORD PTR [rax]
  8037b3:	83 f8 03             	cmp    eax,0x3
  8037b6:	75 e0                	jne    803798 <wait_on_req+0xc>
}
  8037b8:	90                   	nop
  8037b9:	90                   	nop
  8037ba:	5d                   	pop    rbp
  8037bb:	c3                   	ret    

00000000008037bc <clear_req>:
void clear_req(int reqi)
{
  8037bc:	f3 0f 1e fa          	endbr64 
  8037c0:	55                   	push   rbp
  8037c1:	48 89 e5             	mov    rbp,rsp
  8037c4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  8037c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037ca:	48 63 d0             	movsxd rdx,eax
  8037cd:	48 89 d0             	mov    rax,rdx
  8037d0:	48 01 c0             	add    rax,rax
  8037d3:	48 01 d0             	add    rax,rdx
  8037d6:	48 c1 e0 06          	shl    rax,0x6
  8037da:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8037e0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8037e6:	90                   	nop
  8037e7:	5d                   	pop    rbp
  8037e8:	c3                   	ret    

00000000008037e9 <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8037e9:	f3 0f 1e fa          	endbr64 
  8037ed:	55                   	push   rbp
  8037ee:	48 89 e5             	mov    rbp,rsp
  8037f1:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8037f5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8037fc:	eb 4c                	jmp    80384a <init_proc+0x61>
        task[i].pid=-1;
  8037fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803801:	48 98                	cdqe   
  803803:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80380a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803810:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803816:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803819:	48 98                	cdqe   
  80381b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803822:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803828:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  80382e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803831:	48 98                	cdqe   
  803833:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80383a:	48 05 00 85 40 00    	add    rax,0x408500
  803840:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803846:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80384a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80384e:	7e ae                	jle    8037fe <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803850:	c7 05 16 e8 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e816],0x0        # 412070 <cur_proc>
  803857:	00 00 00 
    pidd=1;
  80385a:	c7 05 10 e8 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e810],0x1        # 412074 <pidd>
  803861:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803864:	b8 00 00 00 00       	mov    eax,0x0
  803869:	e8 38 00 00 00       	call   8038a6 <create_proc>
  80386e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803871:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803874:	48 98                	cdqe   
  803876:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80387d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803883:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803889:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80388c:	83 c0 03             	add    eax,0x3
  80388f:	c1 e0 04             	shl    eax,0x4
  803892:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803895:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803898:	01 c0                	add    eax,eax
  80389a:	83 c0 05             	add    eax,0x5
  80389d:	c1 e0 03             	shl    eax,0x3
  8038a0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  8038a3:	90                   	nop
  8038a4:	c9                   	leave  
  8038a5:	c3                   	ret    

00000000008038a6 <create_proc>:

int create_proc()
{
  8038a6:	f3 0f 1e fa          	endbr64 
  8038aa:	55                   	push   rbp
  8038ab:	48 89 e5             	mov    rbp,rsp
  8038ae:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  8038b2:	b8 00 00 00 00       	mov    eax,0x0
  8038b7:	e8 7d 00 00 00       	call   803939 <req_proc>
  8038bc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  8038bf:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8038c3:	75 07                	jne    8038cc <create_proc+0x26>
  8038c5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038ca:	eb 6b                	jmp    803937 <create_proc+0x91>
    int curesp=0x9fc00-1;
  8038cc:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  8038d3:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  8038d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038d9:	48 98                	cdqe   
  8038db:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8038de:	52                   	push   rdx
  8038df:	6a 00                	push   0x0
  8038e1:	6a 00                	push   0x0
  8038e3:	6a 00                	push   0x0
  8038e5:	6a 00                	push   0x0
  8038e7:	50                   	push   rax
  8038e8:	6a 17                	push   0x17
  8038ea:	6a 17                	push   0x17
  8038ec:	6a 17                	push   0x17
  8038ee:	6a 17                	push   0x17
  8038f0:	41 b9 0f 00 00 00    	mov    r9d,0xf
  8038f6:	41 b8 17 00 00 00    	mov    r8d,0x17
  8038fc:	b9 00 00 00 00       	mov    ecx,0x0
  803901:	ba 00 00 00 00       	mov    edx,0x0
  803906:	be 00 00 00 00       	mov    esi,0x0
  80390b:	bf 00 00 00 00       	mov    edi,0x0
  803910:	e8 f0 00 00 00       	call   803a05 <set_proc>
  803915:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  803919:	ba 89 3c 80 00       	mov    edx,0x803c89
  80391e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803921:	48 98                	cdqe   
  803923:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80392a:	48 05 70 86 40 00    	add    rax,0x408670
  803930:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803934:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803937:	c9                   	leave  
  803938:	c3                   	ret    

0000000000803939 <req_proc>:
int req_proc(){
  803939:	f3 0f 1e fa          	endbr64 
  80393d:	55                   	push   rbp
  80393e:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803941:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803948:	eb 04                	jmp    80394e <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  80394a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80394e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803951:	48 98                	cdqe   
  803953:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80395a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803960:	8b 00                	mov    eax,DWORD PTR [rax]
  803962:	83 f8 ff             	cmp    eax,0xffffffff
  803965:	74 1f                	je     803986 <req_proc+0x4d>
  803967:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80396a:	48 98                	cdqe   
  80396c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803973:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803979:	8b 00                	mov    eax,DWORD PTR [rax]
  80397b:	83 f8 03             	cmp    eax,0x3
  80397e:	74 06                	je     803986 <req_proc+0x4d>
  803980:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803984:	7e c4                	jle    80394a <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803986:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80398a:	7e 07                	jle    803993 <req_proc+0x5a>
        return -1;
  80398c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803991:	eb 70                	jmp    803a03 <req_proc+0xca>
    task[num].pid=pidd++;
  803993:	8b 05 db e6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e6db]        # 412074 <pidd>
  803999:	8d 50 01             	lea    edx,[rax+0x1]
  80399c:	89 15 d2 e6 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e6d2],edx        # 412074 <pidd>
  8039a2:	89 c2                	mov    edx,eax
  8039a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039a7:	48 98                	cdqe   
  8039a9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039b0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039b6:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  8039b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039bb:	48 98                	cdqe   
  8039bd:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039c4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039ca:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  8039d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039d3:	48 98                	cdqe   
  8039d5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039dc:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8039e2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8039e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039eb:	48 98                	cdqe   
  8039ed:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039f4:	48 05 ac 84 40 00    	add    rax,0x4084ac
  8039fa:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803a00:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803a03:	5d                   	pop    rbp
  803a04:	c3                   	ret    

0000000000803a05 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803a05:	f3 0f 1e fa          	endbr64 
  803a09:	55                   	push   rbp
  803a0a:	48 89 e5             	mov    rbp,rsp
  803a0d:	48 83 ec 40          	sub    rsp,0x40
  803a11:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803a15:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803a19:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803a1d:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803a21:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803a25:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803a29:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803a2c:	48 98                	cdqe   
  803a2e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a35:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a3b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803a3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a43:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a47:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803a4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a52:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803a56:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803a5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a61:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803a65:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803a6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a70:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803a74:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803a7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a7f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803a83:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803a8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a8e:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a92:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803a99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a9d:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803aa1:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803aa8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aac:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803ab0:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803ab7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803abb:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803abf:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803ac6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aca:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803ace:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803ad5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad9:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803add:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803ae4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ae8:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803aec:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803af3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803af7:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803afb:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803b02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b06:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b0a:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803b11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b15:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b19:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803b20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b24:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b28:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803b2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b33:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b37:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803b3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b42:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803b46:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803b4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b51:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803b55:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803b5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b60:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803b64:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803b6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b6f:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803b76:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803b7a:	ba 89 3c 80 00       	mov    edx,0x803c89
  803b7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b83:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803b8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b8e:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803b92:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803b99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b9d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803ba1:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803ba8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bac:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803bb0:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803bb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bbb:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803bc2:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803bc6:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803bc9:	83 c0 03             	add    eax,0x3
  803bcc:	c1 e0 04             	shl    eax,0x4
  803bcf:	48 63 d0             	movsxd rdx,eax
  803bd2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bd6:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803bdd:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803be0:	01 c0                	add    eax,eax
  803be2:	83 c0 05             	add    eax,0x5
  803be5:	89 c2                	mov    edx,eax
  803be7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803beb:	48 05 9c 01 00 00    	add    rax,0x19c
  803bf1:	89 d1                	mov    ecx,edx
  803bf3:	ba 89 00 00 00       	mov    edx,0x89
  803bf8:	be ff ff 00 00       	mov    esi,0xffff
  803bfd:	89 c7                	mov    edi,eax
  803bff:	e8 ef 0d 00 00       	call   8049f3 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803c04:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c07:	83 c0 03             	add    eax,0x3
  803c0a:	01 c0                	add    eax,eax
  803c0c:	89 c2                	mov    edx,eax
  803c0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c12:	48 83 c0 34          	add    rax,0x34
  803c16:	89 d1                	mov    ecx,edx
  803c18:	ba 82 00 00 00       	mov    edx,0x82
  803c1d:	be 28 00 00 00       	mov    esi,0x28
  803c22:	89 c7                	mov    edi,eax
  803c24:	e8 ca 0d 00 00       	call   8049f3 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803c29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c2d:	48 83 c0 34          	add    rax,0x34
  803c31:	48 89 c1             	mov    rcx,rax
  803c34:	ba fe cf 00 00       	mov    edx,0xcffe
  803c39:	be ff ff ff ff       	mov    esi,0xffffffff
  803c3e:	bf 00 00 00 00       	mov    edi,0x0
  803c43:	e8 d2 0e 00 00       	call   804b1a <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803c48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c4c:	48 83 c0 3c          	add    rax,0x3c
  803c50:	48 89 c1             	mov    rcx,rax
  803c53:	ba f2 cf 00 00       	mov    edx,0xcff2
  803c58:	be ff ff ff ff       	mov    esi,0xffffffff
  803c5d:	bf 00 00 00 00       	mov    edi,0x0
  803c62:	e8 b3 0e 00 00       	call   804b1a <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803c67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c6b:	48 83 c0 44          	add    rax,0x44
  803c6f:	48 89 c1             	mov    rcx,rax
  803c72:	ba f6 00 00 00       	mov    edx,0xf6
  803c77:	be 00 10 00 00       	mov    esi,0x1000
  803c7c:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803c81:	e8 94 0e 00 00       	call   804b1a <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803c86:	90                   	nop
  803c87:	c9                   	leave  
  803c88:	c3                   	ret    

0000000000803c89 <proc_zero>:
void proc_zero()
{
  803c89:	f3 0f 1e fa          	endbr64 
  803c8d:	55                   	push   rbp
  803c8e:	48 89 e5             	mov    rbp,rsp

    while(1);
  803c91:	eb fe                	jmp    803c91 <proc_zero+0x8>

0000000000803c93 <manage_proc>:
}
void manage_proc(){
  803c93:	f3 0f 1e fa          	endbr64 
  803c97:	55                   	push   rbp
  803c98:	48 89 e5             	mov    rbp,rsp
  803c9b:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803c9f:	8b 05 cb e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3cb]        # 412070 <cur_proc>
  803ca5:	83 f8 ff             	cmp    eax,0xffffffff
  803ca8:	74 2d                	je     803cd7 <manage_proc+0x44>
        task[cur_proc].utime++;
  803caa:	8b 05 c0 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3c0]        # 412070 <cur_proc>
  803cb0:	48 63 d0             	movsxd rdx,eax
  803cb3:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803cba:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803cc1:	8b 12                	mov    edx,DWORD PTR [rdx]
  803cc3:	83 c2 01             	add    edx,0x1
  803cc6:	48 98                	cdqe   
  803cc8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ccf:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803cd5:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803cd7:	8b 05 93 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e393]        # 412070 <cur_proc>
  803cdd:	83 f8 ff             	cmp    eax,0xffffffff
  803ce0:	74 3c                	je     803d1e <manage_proc+0x8b>
  803ce2:	8b 05 88 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e388]        # 412070 <cur_proc>
  803ce8:	48 98                	cdqe   
  803cea:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803cf1:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803cf7:	8b 00                	mov    eax,DWORD PTR [rax]
  803cf9:	83 f8 01             	cmp    eax,0x1
  803cfc:	77 20                	ja     803d1e <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803cfe:	8b 05 6c e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e36c]        # 412070 <cur_proc>
  803d04:	48 98                	cdqe   
  803d06:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d0d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d13:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803d15:	83 f8 01             	cmp    eax,0x1
  803d18:	0f 84 90 00 00 00    	je     803dae <manage_proc+0x11b>
        if(cur_proc!=-1)
  803d1e:	8b 05 4c e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e34c]        # 412070 <cur_proc>
  803d24:	83 f8 ff             	cmp    eax,0xffffffff
  803d27:	74 1b                	je     803d44 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803d29:	8b 05 41 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e341]        # 412070 <cur_proc>
  803d2f:	48 98                	cdqe   
  803d31:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d38:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d3e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803d44:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803d52:	eb 41                	jmp    803d95 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803d54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d57:	48 98                	cdqe   
  803d59:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d60:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d66:	8b 00                	mov    eax,DWORD PTR [rax]
  803d68:	83 f8 ff             	cmp    eax,0xffffffff
  803d6b:	74 24                	je     803d91 <manage_proc+0xfe>
  803d6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d70:	48 98                	cdqe   
  803d72:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d79:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d7f:	8b 00                	mov    eax,DWORD PTR [rax]
  803d81:	83 f8 01             	cmp    eax,0x1
  803d84:	75 0b                	jne    803d91 <manage_proc+0xfe>
  803d86:	8b 05 e4 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2e4]        # 412070 <cur_proc>
  803d8c:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803d8f:	75 0c                	jne    803d9d <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d91:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803d95:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d99:	7e b9                	jle    803d54 <manage_proc+0xc1>
  803d9b:	eb 01                	jmp    803d9e <manage_proc+0x10b>
                break;
  803d9d:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803d9e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803da2:	7f 0d                	jg     803db1 <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803da4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803da7:	89 c7                	mov    edi,eax
  803da9:	e8 06 00 00 00       	call   803db4 <switch_proc_tss>
    }
    return;
  803dae:	90                   	nop
  803daf:	eb 01                	jmp    803db2 <manage_proc+0x11f>
            return;
  803db1:	90                   	nop
}
  803db2:	c9                   	leave  
  803db3:	c3                   	ret    

0000000000803db4 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803db4:	f3 0f 1e fa          	endbr64 
  803db8:	55                   	push   rbp
  803db9:	48 89 e5             	mov    rbp,rsp
  803dbc:	48 83 ec 20          	sub    rsp,0x20
  803dc0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803dc3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803dc6:	01 c0                	add    eax,eax
  803dc8:	83 c0 05             	add    eax,0x5
  803dcb:	c1 e0 03             	shl    eax,0x3
  803dce:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803dd1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803dd4:	89 05 96 e2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e296],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  803dda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ddd:	89 c7                	mov    edi,eax
  803ddf:	e8 86 5e 00 00       	call   809c6a <switch_proc_asm>
}
  803de4:	90                   	nop
  803de5:	c9                   	leave  
  803de6:	c3                   	ret    

0000000000803de7 <switch_proc>:
void switch_proc(int pnr){
  803de7:	f3 0f 1e fa          	endbr64 
  803deb:	55                   	push   rbp
  803dec:	48 89 e5             	mov    rbp,rsp
  803def:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803df6:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803dfc:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e02:	48 98                	cdqe   
  803e04:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e0b:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803e12:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803e19:	b9 4d 00 00 00       	mov    ecx,0x4d
  803e1e:	48 89 c7             	mov    rdi,rax
  803e21:	48 89 d6             	mov    rsi,rdx
  803e24:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803e27:	48 89 f2             	mov    rdx,rsi
  803e2a:	48 89 f8             	mov    rax,rdi
  803e2d:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803e2f:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803e31:	8b 05 39 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e239]        # 412070 <cur_proc>
  803e37:	48 98                	cdqe   
  803e39:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e40:	48 05 90 01 00 00    	add    rax,0x190
  803e46:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e4c:	48 83 c0 0c          	add    rax,0xc
  803e50:	48 89 c7             	mov    rdi,rax
  803e53:	e8 69 00 00 00       	call   803ec1 <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  803e58:	b8 89 3c 80 00       	mov    eax,0x803c89
  803e5d:	48 89 05 18 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04818],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  803e64:	48 c7 05 05 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04805],0x1000        # 408674 <task+0x1d4>
  803e6b:	00 10 00 00 
    task[0].tss.eflags=0x202;
  803e6f:	48 c7 05 0a 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0480a],0x202        # 408684 <task+0x1e4>
  803e76:	02 02 00 00 
    cur_proc=pnr;
  803e7a:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e80:	89 05 ea e1 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e1ea],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803e86:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e8c:	01 c0                	add    eax,eax
  803e8e:	83 c0 05             	add    eax,0x5
  803e91:	c1 e0 03             	shl    eax,0x3
  803e94:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803e97:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e9d:	48 98                	cdqe   
  803e9f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ea6:	48 05 90 01 00 00    	add    rax,0x190
  803eac:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803eb2:	48 83 c0 0c          	add    rax,0xc
  803eb6:	48 89 c7             	mov    rdi,rax
  803eb9:	e8 cd 5d 00 00       	call   809c8b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803ebe:	90                   	nop
  803ebf:	c9                   	leave  
  803ec0:	c3                   	ret    

0000000000803ec1 <save_context>:
void save_context(TSS *tss)
{
  803ec1:	f3 0f 1e fa          	endbr64 
  803ec5:	55                   	push   rbp
  803ec6:	48 89 e5             	mov    rbp,rsp
  803ec9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  803ecd:	48 8b 15 0c e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e10c]        # 411fe0 <scene_saver+0x40>
  803ed4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ed8:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  803edc:	48 8b 15 0d e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e10d]        # 411ff0 <scene_saver+0x50>
  803ee3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ee7:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  803eeb:	48 8b 15 16 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e116]        # 412008 <scene_saver+0x68>
  803ef2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ef6:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  803efa:	48 8b 15 f7 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0f7]        # 411ff8 <scene_saver+0x58>
  803f01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f05:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  803f09:	48 8b 15 f0 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0f0]        # 412000 <scene_saver+0x60>
  803f10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f14:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  803f18:	48 8b 15 01 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e101]        # 412020 <scene_saver+0x80>
  803f1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f23:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  803f2a:	48 8b 15 f7 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0f7]        # 412028 <scene_saver+0x88>
  803f31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f35:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  803f3c:	48 8b 15 a5 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0a5]        # 411fe8 <scene_saver+0x48>
  803f43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f47:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  803f4b:	48 8b 15 be e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0be]        # 412010 <scene_saver+0x70>
  803f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f56:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  803f5a:	48 8b 15 b7 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0b7]        # 412018 <scene_saver+0x78>
  803f61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f65:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  803f69:	90                   	nop
  803f6a:	5d                   	pop    rbp
  803f6b:	c3                   	ret    

0000000000803f6c <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803f6c:	f3 0f 1e fa          	endbr64 
  803f70:	55                   	push   rbp
  803f71:	48 89 e5             	mov    rbp,rsp
  803f74:	48 83 ec 60          	sub    rsp,0x60
  803f78:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803f7b:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803f7e:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803f81:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803f87:	85 c0                	test   eax,eax
  803f89:	0f 48 c2             	cmovs  eax,edx
  803f8c:	c1 f8 0c             	sar    eax,0xc
  803f8f:	89 c1                	mov    ecx,eax
  803f91:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803f94:	99                   	cdq    
  803f95:	c1 ea 14             	shr    edx,0x14
  803f98:	01 d0                	add    eax,edx
  803f9a:	25 ff 0f 00 00       	and    eax,0xfff
  803f9f:	29 d0                	sub    eax,edx
  803fa1:	01 c8                	add    eax,ecx
  803fa3:	85 c0                	test   eax,eax
  803fa5:	0f 95 c0             	setne  al
  803fa8:	0f b6 c0             	movzx  eax,al
  803fab:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803fae:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803fb5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803fbc:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  803fbd:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fc0:	48 98                	cdqe   
  803fc2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fc9:	48 05 60 86 40 00    	add    rax,0x408660
  803fcf:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  803fd3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  803fd7:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  803fdc:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  803fe3:	e9 39 02 00 00       	jmp    804221 <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  803fe8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803fec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fef:	25 00 f0 ff ff       	and    eax,0xfffff000
  803ff4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  803ff8:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  803fff:	e9 07 02 00 00       	jmp    80420b <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  804004:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804008:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80400b:	83 e0 01             	and    eax,0x1
  80400e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  804011:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  804015:	0f 85 e7 01 00 00    	jne    804202 <palloc+0x296>
            {
                int new_pg=req_a_page();
  80401b:	b8 00 00 00 00       	mov    eax,0x0
  804020:	e8 65 d2 ff ff       	call   80128a <req_a_page>
  804025:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  804028:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80402c:	0f 85 b9 00 00 00    	jne    8040eb <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804032:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804035:	48 98                	cdqe   
  804037:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80403e:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804044:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804047:	0f b7 c0             	movzx  eax,ax
  80404a:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80404d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804050:	48 98                	cdqe   
  804052:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804059:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80405f:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804063:	0f b7 c0             	movzx  eax,ax
  804066:	c1 e0 10             	shl    eax,0x10
  804069:	25 00 00 0f 00       	and    eax,0xf0000
  80406e:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  804071:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804074:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804077:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80407a:	89 c2                	mov    edx,eax
  80407c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80407f:	48 98                	cdqe   
  804081:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804088:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80408e:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804091:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804094:	48 98                	cdqe   
  804096:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80409d:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8040a3:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040a7:	0f b7 c0             	movzx  eax,ax
  8040aa:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  8040ad:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8040b4:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040b7:	c1 e8 10             	shr    eax,0x10
  8040ba:	83 e0 0f             	and    eax,0xf
  8040bd:	89 c2                	mov    edx,eax
  8040bf:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8040c2:	01 d0                	add    eax,edx
  8040c4:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8040c7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8040ca:	89 c2                	mov    edx,eax
  8040cc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040cf:	48 98                	cdqe   
  8040d1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040d8:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8040de:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8040e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040e6:	e9 48 01 00 00       	jmp    804233 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  8040eb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8040ee:	89 c7                	mov    edi,eax
  8040f0:	e8 02 d3 ff ff       	call   8013f7 <get_phyaddr>
  8040f5:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8040f8:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  8040fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8040ff:	ba 07 00 00 00       	mov    edx,0x7
  804104:	89 ce                	mov    esi,ecx
  804106:	48 89 c7             	mov    rdi,rax
  804109:	e8 fc d2 ff ff       	call   80140a <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  80410e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  804111:	c1 e0 0a             	shl    eax,0xa
  804114:	89 c2                	mov    edx,eax
  804116:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  804119:	01 d0                	add    eax,edx
  80411b:	c1 e0 0c             	shl    eax,0xc
  80411e:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  804121:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  804126:	75 12                	jne    80413a <palloc+0x1ce>
                {
                    ptr=laddr;
  804128:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80412b:	48 98                	cdqe   
  80412d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  804131:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804134:	89 05 3e df c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0df3e],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  80413a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80413e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804142:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804146:	0f 85 b6 00 00 00    	jne    804202 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80414c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80414f:	48 98                	cdqe   
  804151:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804158:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80415e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804161:	0f b7 c0             	movzx  eax,ax
  804164:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804167:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80416a:	48 98                	cdqe   
  80416c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804173:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804179:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80417d:	0f b7 c0             	movzx  eax,ax
  804180:	c1 e0 10             	shl    eax,0x10
  804183:	25 00 00 0f 00       	and    eax,0xf0000
  804188:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  80418b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80418e:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804191:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804194:	89 c2                	mov    edx,eax
  804196:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804199:	48 98                	cdqe   
  80419b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041a2:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8041a8:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8041ab:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041ae:	48 98                	cdqe   
  8041b0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041b7:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041bd:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8041c1:	0f b7 c0             	movzx  eax,ax
  8041c4:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  8041c7:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8041ce:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  8041d1:	c1 e8 10             	shr    eax,0x10
  8041d4:	83 e0 0f             	and    eax,0xf
  8041d7:	89 c2                	mov    edx,eax
  8041d9:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8041dc:	01 d0                	add    eax,edx
  8041de:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8041e1:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8041e4:	89 c2                	mov    edx,eax
  8041e6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041e9:	48 98                	cdqe   
  8041eb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041f2:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041f8:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  8041fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804200:	eb 31                	jmp    804233 <palloc+0x2c7>
                }
            }
            tblp++;
  804202:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  804207:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  80420b:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  804212:	0f 8e ec fd ff ff    	jle    804004 <palloc+0x98>
        }
        pgind++;
  804218:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80421d:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  804221:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  804228:	0f 8e ba fd ff ff    	jle    803fe8 <palloc+0x7c>
    }
    return NULL;
  80422e:	b8 00 00 00 00       	mov    eax,0x0
}
  804233:	c9                   	leave  
  804234:	c3                   	ret    

0000000000804235 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804235:	f3 0f 1e fa          	endbr64 
  804239:	55                   	push   rbp
  80423a:	48 89 e5             	mov    rbp,rsp
  80423d:	48 83 ec 10          	sub    rsp,0x10
  804241:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804244:	8b 05 26 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de26]        # 412070 <cur_proc>
  80424a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80424d:	89 d6                	mov    esi,edx
  80424f:	89 c7                	mov    edi,eax
  804251:	e8 16 fd ff ff       	call   803f6c <palloc>
}
  804256:	c9                   	leave  
  804257:	c3                   	ret    

0000000000804258 <proc_end>:
void proc_end()
{
  804258:	f3 0f 1e fa          	endbr64 
  80425c:	55                   	push   rbp
  80425d:	48 89 e5             	mov    rbp,rsp
  804260:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804264:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  804267:	48 8b 05 3e 44 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0443e]        # 4086ac <task+0x20c>
  80426e:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  804271:	8b 05 f9 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddf9]        # 412070 <cur_proc>
  804277:	89 c7                	mov    edi,eax
  804279:	e8 75 00 00 00       	call   8042f3 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  80427e:	8b 05 ec dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddec]        # 412070 <cur_proc>
  804284:	48 98                	cdqe   
  804286:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80428d:	48 05 00 85 40 00    	add    rax,0x408500
  804293:	8b 00                	mov    eax,DWORD PTR [rax]
  804295:	83 f8 ff             	cmp    eax,0xffffffff
  804298:	74 4c                	je     8042e6 <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  80429a:	8b 05 d0 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddd0]        # 412070 <cur_proc>
  8042a0:	48 98                	cdqe   
  8042a2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042a9:	48 05 00 85 40 00    	add    rax,0x408500
  8042af:	8b 00                	mov    eax,DWORD PTR [rax]
  8042b1:	89 c0                	mov    eax,eax
  8042b3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042ba:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8042c0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8042c6:	8b 05 a4 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dda4]        # 412070 <cur_proc>
  8042cc:	48 98                	cdqe   
  8042ce:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042d5:	48 05 00 85 40 00    	add    rax,0x408500
  8042db:	8b 00                	mov    eax,DWORD PTR [rax]
  8042dd:	89 c7                	mov    edi,eax
  8042df:	e8 d0 fa ff ff       	call   803db4 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8042e4:	eb 0a                	jmp    8042f0 <proc_end+0x98>
        switch_proc_tss(0);
  8042e6:	bf 00 00 00 00       	mov    edi,0x0
  8042eb:	e8 c4 fa ff ff       	call   803db4 <switch_proc_tss>
}
  8042f0:	90                   	nop
  8042f1:	c9                   	leave  
  8042f2:	c3                   	ret    

00000000008042f3 <del_proc>:
void del_proc(int pnr)
{
  8042f3:	f3 0f 1e fa          	endbr64 
  8042f7:	55                   	push   rbp
  8042f8:	48 89 e5             	mov    rbp,rsp
  8042fb:	48 83 ec 30          	sub    rsp,0x30
  8042ff:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804302:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804305:	48 98                	cdqe   
  804307:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80430e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804314:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80431a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80431d:	48 98                	cdqe   
  80431f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804326:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80432c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  804332:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804335:	48 98                	cdqe   
  804337:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80433e:	48 05 60 86 40 00    	add    rax,0x408660
  804344:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804348:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  80434c:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804351:	eb 63                	jmp    8043b6 <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  804353:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804357:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80435a:	25 00 f0 ff ff       	and    eax,0xfffff000
  80435f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804363:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80436a:	eb 30                	jmp    80439c <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  80436c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804370:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804373:	83 e0 01             	and    eax,0x1
  804376:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804379:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  80437d:	74 14                	je     804393 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  80437f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804383:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804386:	25 00 f0 ff ff       	and    eax,0xfffff000
  80438b:	48 89 c7             	mov    rdi,rax
  80438e:	e8 a3 cf ff ff       	call   801336 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804393:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804398:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80439c:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8043a3:	7e c7                	jle    80436c <del_proc+0x79>
        }
        vmfree(tp);
  8043a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043a9:	48 89 c7             	mov    rdi,rax
  8043ac:	e8 2f ce ff ff       	call   8011e0 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8043b1:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8043b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043bd:	83 e0 01             	and    eax,0x1
  8043c0:	48 85 c0             	test   rax,rax
  8043c3:	75 8e                	jne    804353 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  8043c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043c9:	48 89 c7             	mov    rdi,rax
  8043cc:	e8 0f ce ff ff       	call   8011e0 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8043d1:	90                   	nop
  8043d2:	c9                   	leave  
  8043d3:	c3                   	ret    

00000000008043d4 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8043d4:	f3 0f 1e fa          	endbr64 
  8043d8:	55                   	push   rbp
  8043d9:	48 89 e5             	mov    rbp,rsp
  8043dc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8043df:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8043e2:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8043e6:	75 07                	jne    8043ef <set_proc_stat+0x1b>
  8043e8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8043ed:	eb 79                	jmp    804468 <set_proc_stat+0x94>
    int i=0;
  8043ef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8043f6:	eb 04                	jmp    8043fc <set_proc_stat+0x28>
  8043f8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8043fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043ff:	48 98                	cdqe   
  804401:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804408:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80440e:	8b 10                	mov    edx,DWORD PTR [rax]
  804410:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804413:	39 c2                	cmp    edx,eax
  804415:	75 e1                	jne    8043f8 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804417:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80441b:	75 07                	jne    804424 <set_proc_stat+0x50>
  80441d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804422:	eb 44                	jmp    804468 <set_proc_stat+0x94>
    task[i].stat=stat;
  804424:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804427:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80442a:	48 63 d2             	movsxd rdx,edx
  80442d:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  804434:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  80443b:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  80443d:	8b 05 2d dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc2d]        # 412070 <cur_proc>
  804443:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804446:	75 1b                	jne    804463 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804448:	8b 05 22 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc22]        # 412070 <cur_proc>
  80444e:	48 98                	cdqe   
  804450:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804457:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80445d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804463:	b8 00 00 00 00       	mov    eax,0x0
}
  804468:	5d                   	pop    rbp
  804469:	c3                   	ret    

000000000080446a <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  80446a:	f3 0f 1e fa          	endbr64 
  80446e:	55                   	push   rbp
  80446f:	48 89 e5             	mov    rbp,rsp
  804472:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804476:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80447d:	eb 69                	jmp    8044e8 <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  80447f:	8b 05 eb db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbeb]        # 412070 <cur_proc>
  804485:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804488:	48 63 d2             	movsxd rdx,edx
  80448b:	48 83 c2 12          	add    rdx,0x12
  80448f:	48 98                	cdqe   
  804491:	48 c1 e2 03          	shl    rdx,0x3
  804495:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80449c:	48 01 d0             	add    rax,rdx
  80449f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8044a5:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8044a9:	48 85 c0             	test   rax,rax
  8044ac:	75 36                	jne    8044e4 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  8044ae:	8b 05 bc db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbbc]        # 412070 <cur_proc>
  8044b4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044b7:	48 63 d2             	movsxd rdx,edx
  8044ba:	48 83 c2 12          	add    rdx,0x12
  8044be:	48 98                	cdqe   
  8044c0:	48 c1 e2 03          	shl    rdx,0x3
  8044c4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044cb:	48 01 d0             	add    rax,rdx
  8044ce:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8044d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8044d9:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  8044dd:	b8 00 00 00 00       	mov    eax,0x0
  8044e2:	eb 0f                	jmp    8044f3 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8044e4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8044e8:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8044ec:	7e 91                	jle    80447f <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8044ee:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8044f3:	5d                   	pop    rbp
  8044f4:	c3                   	ret    

00000000008044f5 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8044f5:	f3 0f 1e fa          	endbr64 
  8044f9:	55                   	push   rbp
  8044fa:	48 89 e5             	mov    rbp,rsp
  8044fd:	48 83 ec 10          	sub    rsp,0x10
  804501:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804504:	8b 05 66 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db66]        # 412070 <cur_proc>
  80450a:	89 c7                	mov    edi,eax
  80450c:	e8 e2 fd ff ff       	call   8042f3 <del_proc>
    return code;
  804511:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804514:	c9                   	leave  
  804515:	c3                   	ret    

0000000000804516 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804516:	f3 0f 1e fa          	endbr64 
  80451a:	55                   	push   rbp
  80451b:	48 89 e5             	mov    rbp,rsp
  80451e:	48 83 ec 40          	sub    rsp,0x40
  804522:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804525:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804529:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  80452d:	b8 00 00 00 00       	mov    eax,0x0
  804532:	e8 02 f4 ff ff       	call   803939 <req_proc>
  804537:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  80453a:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80453e:	75 0a                	jne    80454a <reg_proc+0x34>
  804540:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804545:	e9 80 01 00 00       	jmp    8046ca <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  80454a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80454d:	50                   	push   rax
  80454e:	6a 00                	push   0x0
  804550:	6a 00                	push   0x0
  804552:	6a 00                	push   0x0
  804554:	6a 00                	push   0x0
  804556:	68 fc ff bf 01       	push   0x1bffffc
  80455b:	6a 10                	push   0x10
  80455d:	6a 10                	push   0x10
  80455f:	6a 10                	push   0x10
  804561:	6a 10                	push   0x10
  804563:	41 b9 08 00 00 00    	mov    r9d,0x8
  804569:	41 b8 10 00 00 00    	mov    r8d,0x10
  80456f:	b9 00 00 00 00       	mov    ecx,0x0
  804574:	ba 00 00 00 00       	mov    edx,0x0
  804579:	be 00 00 00 00       	mov    esi,0x0
  80457e:	bf 00 00 00 00       	mov    edi,0x0
  804583:	e8 7d f4 ff ff       	call   803a05 <set_proc>
  804588:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  80458c:	b8 00 00 00 00       	mov    eax,0x0
  804591:	e8 bb cb ff ff       	call   801151 <vmalloc>
  804596:	48 89 c2             	mov    rdx,rax
  804599:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80459c:	48 98                	cdqe   
  80459e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045a5:	48 05 20 85 40 00    	add    rax,0x408520
  8045ab:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  8045af:	b8 00 00 00 00       	mov    eax,0x0
  8045b4:	e8 98 cb ff ff       	call   801151 <vmalloc>
  8045b9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8045bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045c0:	48 98                	cdqe   
  8045c2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045c9:	48 05 20 85 40 00    	add    rax,0x408520
  8045cf:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8045d3:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8045d9:	b8 00 00 00 00       	mov    eax,0x0
  8045de:	e8 6e cb ff ff       	call   801151 <vmalloc>
  8045e3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8045e7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8045eb:	83 c8 07             	or     eax,0x7
  8045ee:	89 c2                	mov    edx,eax
  8045f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045f3:	48 98                	cdqe   
  8045f5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045fc:	48 05 20 85 40 00    	add    rax,0x408520
  804602:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804606:	48 83 c0 18          	add    rax,0x18
  80460a:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80460c:	b8 00 00 00 00       	mov    eax,0x0
  804611:	e8 74 cc ff ff       	call   80128a <req_a_page>
  804616:	89 c7                	mov    edi,eax
  804618:	e8 da cd ff ff       	call   8013f7 <get_phyaddr>
  80461d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804621:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804628:	83 c8 07             	or     eax,0x7
  80462b:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  80462d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804630:	48 98                	cdqe   
  804632:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804639:	48 05 20 85 40 00    	add    rax,0x408520
  80463f:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804643:	48 89 c2             	mov    rdx,rax
  804646:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804649:	48 98                	cdqe   
  80464b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804652:	48 05 60 86 40 00    	add    rax,0x408660
  804658:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  80465c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80465f:	48 98                	cdqe   
  804661:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804668:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80466e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804674:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804677:	48 98                	cdqe   
  804679:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804680:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  804687:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80468b:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  80468f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804692:	48 98                	cdqe   
  804694:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80469b:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  8046a2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8046a6:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  8046aa:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8046ad:	48 98                	cdqe   
  8046af:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8046b2:	48 63 d2             	movsxd rdx,edx
  8046b5:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  8046bc:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  8046c3:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  8046c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8046ca:	c9                   	leave  
  8046cb:	c3                   	ret    

00000000008046cc <sys_malloc>:

void * sys_malloc(int size)
{
  8046cc:	f3 0f 1e fa          	endbr64 
  8046d0:	55                   	push   rbp
  8046d1:	48 89 e5             	mov    rbp,rsp
  8046d4:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8046d7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046da:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8046e0:	85 c0                	test   eax,eax
  8046e2:	0f 48 c2             	cmovs  eax,edx
  8046e5:	c1 f8 0c             	sar    eax,0xc
  8046e8:	89 c1                	mov    ecx,eax
  8046ea:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046ed:	99                   	cdq    
  8046ee:	c1 ea 14             	shr    edx,0x14
  8046f1:	01 d0                	add    eax,edx
  8046f3:	25 ff 0f 00 00       	and    eax,0xfff
  8046f8:	29 d0                	sub    eax,edx
  8046fa:	01 c8                	add    eax,ecx
  8046fc:	85 c0                	test   eax,eax
  8046fe:	0f 95 c0             	setne  al
  804701:	0f b6 c0             	movzx  eax,al
  804704:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804707:	8b 05 63 d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d963]        # 412070 <cur_proc>
  80470d:	48 98                	cdqe   
  80470f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804716:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80471c:	8b 00                	mov    eax,DWORD PTR [rax]
  80471e:	48 98                	cdqe   
  804720:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804724:	eb 0c                	jmp    804732 <sys_malloc+0x66>
        hp=hp->next;
  804726:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80472a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80472e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804732:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804736:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80473a:	48 85 c0             	test   rax,rax
  80473d:	74 16                	je     804755 <sys_malloc+0x89>
  80473f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804743:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804746:	85 c0                	test   eax,eax
  804748:	75 0b                	jne    804755 <sys_malloc+0x89>
  80474a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80474e:	8b 00                	mov    eax,DWORD PTR [rax]
  804750:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804753:	7e d1                	jle    804726 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804755:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804759:	8b 00                	mov    eax,DWORD PTR [rax]
  80475b:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80475e:	7e 7f                	jle    8047df <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804760:	8b 05 0a d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d90a]        # 412070 <cur_proc>
  804766:	48 98                	cdqe   
  804768:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80476f:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804775:	8b 10                	mov    edx,DWORD PTR [rax]
  804777:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80477a:	c1 e0 0c             	shl    eax,0xc
  80477d:	01 d0                	add    eax,edx
  80477f:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804784:	7e 0a                	jle    804790 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  804786:	b8 00 00 00 00       	mov    eax,0x0
  80478b:	e9 c8 00 00 00       	jmp    804858 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804790:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804794:	8b 10                	mov    edx,DWORD PTR [rax]
  804796:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804799:	29 d0                	sub    eax,edx
  80479b:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  80479e:	8b 05 cc d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d8cc]        # 412070 <cur_proc>
  8047a4:	48 98                	cdqe   
  8047a6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047ad:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8047b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8047b5:	48 98                	cdqe   
  8047b7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047bb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8047c2:	eb 13                	jmp    8047d7 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  8047c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047c8:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8047cb:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8047d2:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047d3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8047d7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047da:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8047dd:	7c e5                	jl     8047c4 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8047df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8047e5:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047e8:	7d 59                	jge    804843 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  8047ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047ee:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8047f2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047f5:	83 c0 01             	add    eax,0x1
  8047f8:	c1 e0 0c             	shl    eax,0xc
  8047fb:	48 98                	cdqe   
  8047fd:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804801:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804805:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804809:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80480d:	8b 00                	mov    eax,DWORD PTR [rax]
  80480f:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804812:	8d 50 ff             	lea    edx,[rax-0x1]
  804815:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804819:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80481b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80481f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804823:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804827:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80482b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80482f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804833:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804837:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80483f:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804843:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804847:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80484e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804852:	48 05 00 10 00 00    	add    rax,0x1000
}
  804858:	5d                   	pop    rbp
  804859:	c3                   	ret    

000000000080485a <sys_free>:
int sys_free(int ptr)
{
  80485a:	f3 0f 1e fa          	endbr64 
  80485e:	55                   	push   rbp
  80485f:	48 89 e5             	mov    rbp,rsp
  804862:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804865:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804868:	2d 00 10 00 00       	sub    eax,0x1000
  80486d:	48 98                	cdqe   
  80486f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804873:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804877:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  80487e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804882:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804886:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80488a:	eb 2e                	jmp    8048ba <sys_free+0x60>
    {
        if(p->alloc==0)
  80488c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804890:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804893:	85 c0                	test   eax,eax
  804895:	75 2c                	jne    8048c3 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804897:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80489b:	8b 10                	mov    edx,DWORD PTR [rax]
  80489d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8048a3:	83 c0 01             	add    eax,0x1
  8048a6:	01 c2                	add    edx,eax
  8048a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048ac:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8048ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048b2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048b6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048ba:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048bf:	75 cb                	jne    80488c <sys_free+0x32>
  8048c1:	eb 01                	jmp    8048c4 <sys_free+0x6a>
            break;
  8048c3:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8048c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048cc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048d0:	eb 2e                	jmp    804900 <sys_free+0xa6>
    {
        if(p->alloc==0)
  8048d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048d6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048d9:	85 c0                	test   eax,eax
  8048db:	75 2c                	jne    804909 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8048dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048e1:	8b 10                	mov    edx,DWORD PTR [rax]
  8048e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048e7:	8b 00                	mov    eax,DWORD PTR [rax]
  8048e9:	83 c0 01             	add    eax,0x1
  8048ec:	01 c2                	add    edx,eax
  8048ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048f2:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8048f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804900:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804905:	75 cb                	jne    8048d2 <sys_free+0x78>
  804907:	eb 01                	jmp    80490a <sys_free+0xb0>
            break;
  804909:	90                   	nop
    }
    //合并完成
    return 0;
  80490a:	b8 00 00 00 00       	mov    eax,0x0
  80490f:	5d                   	pop    rbp
  804910:	c3                   	ret    
  804911:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804918:	00 00 00 
  80491b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804920 <outb>:
  804920:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804926:	67 8a 44 24 08       	mov    al,BYTE PTR [esp+0x8]
  80492b:	ee                   	out    dx,al
  80492c:	e8 35 00 00 00       	call   804966 <io_delay>
  804931:	c3                   	ret    

0000000000804932 <outw>:
  804932:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804938:	66 67 8b 44 24 08    	mov    ax,WORD PTR [esp+0x8]
  80493e:	66 ef                	out    dx,ax
  804940:	90                   	nop
  804941:	90                   	nop
  804942:	90                   	nop
  804943:	c3                   	ret    

0000000000804944 <inb>:
  804944:	31 c0                	xor    eax,eax
  804946:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  80494c:	ec                   	in     al,dx
  80494d:	90                   	nop
  80494e:	90                   	nop
  80494f:	90                   	nop
  804950:	c3                   	ret    

0000000000804951 <inw>:
  804951:	31 c0                	xor    eax,eax
  804953:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804959:	66 ed                	in     ax,dx
  80495b:	90                   	nop
  80495c:	90                   	nop
  80495d:	90                   	nop
  80495e:	c3                   	ret    

000000000080495f <eoi>:
  80495f:	b0 20                	mov    al,0x20
  804961:	e6 a0                	out    0xa0,al
  804963:	e6 20                	out    0x20,al
  804965:	c3                   	ret    

0000000000804966 <io_delay>:
  804966:	90                   	nop
  804967:	90                   	nop
  804968:	90                   	nop
  804969:	90                   	nop
  80496a:	c3                   	ret    

000000000080496b <turn_on_int>:
  80496b:	b0 f8                	mov    al,0xf8
  80496d:	e6 21                	out    0x21,al
  80496f:	e8 f2 ff ff ff       	call   804966 <io_delay>
  804974:	b0 af                	mov    al,0xaf
  804976:	e6 a1                	out    0xa1,al
  804978:	e8 e9 ff ff ff       	call   804966 <io_delay>
  80497d:	0f 01 1c 25 00 70 10 	lidt   ds:0x107000
  804984:	00 
  804985:	90                   	nop
  804986:	90                   	nop
  804987:	90                   	nop
  804988:	90                   	nop
  804989:	fb                   	sti    
  80498a:	c3                   	ret    

000000000080498b <report_back_trace_of_err>:
  80498b:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804990:	50                   	push   rax
  804991:	68 9a 49 80 00       	push   0x80499a
  804996:	83 c4 08             	add    esp,0x8
  804999:	c3                   	ret    

000000000080499a <bt_msg>:
  80499a:	65 72 72             	gs jb  804a0f <fill_desc+0x1c>
  80499d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80499e:	72 20                	jb     8049c0 <init_gdt+0x11>
  8049a0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8049a1:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8049a4:	72 73                	jb     804a19 <fill_desc+0x26>
  8049a6:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8049a9:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea627 <dev_stdout+0x6d8767>

00000000008049af <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8049af:	f3 0f 1e fa          	endbr64 
  8049b3:	55                   	push   rbp
  8049b4:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  8049b7:	b9 01 00 00 00       	mov    ecx,0x1
  8049bc:	ba 9e cf 00 00       	mov    edx,0xcf9e
  8049c1:	be ff ff ff ff       	mov    esi,0xffffffff
  8049c6:	bf 00 00 00 00       	mov    edi,0x0
  8049cb:	e8 23 00 00 00       	call   8049f3 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  8049d0:	b9 02 00 00 00       	mov    ecx,0x2
  8049d5:	ba 92 cf 00 00       	mov    edx,0xcf92
  8049da:	be ff ff ff ff       	mov    esi,0xffffffff
  8049df:	bf 00 00 00 00       	mov    edi,0x0
  8049e4:	e8 0a 00 00 00       	call   8049f3 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  8049e9:	0f 01 15 10 06 90 ff 	lgdt   [rip+0xffffffffff900610]        # 105000 <gdtptr>

}
  8049f0:	90                   	nop
  8049f1:	5d                   	pop    rbp
  8049f2:	c3                   	ret    

00000000008049f3 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  8049f3:	f3 0f 1e fa          	endbr64 
  8049f7:	55                   	push   rbp
  8049f8:	48 89 e5             	mov    rbp,rsp
  8049fb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8049fe:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804a01:	89 d0                	mov    eax,edx
  804a03:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804a06:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804a0a:	48 8b 15 af 53 00 00 	mov    rdx,QWORD PTR [rip+0x53af]        # 809dc0 <gdt>
  804a11:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a14:	48 c1 e0 03          	shl    rax,0x3
  804a18:	48 01 d0             	add    rax,rdx
  804a1b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804a1e:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804a22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a25:	c1 e8 10             	shr    eax,0x10
  804a28:	89 c1                	mov    ecx,eax
  804a2a:	48 8b 15 8f 53 00 00 	mov    rdx,QWORD PTR [rip+0x538f]        # 809dc0 <gdt>
  804a31:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a34:	48 c1 e0 03          	shl    rax,0x3
  804a38:	48 01 d0             	add    rax,rdx
  804a3b:	89 ca                	mov    edx,ecx
  804a3d:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804a40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a43:	c1 e8 18             	shr    eax,0x18
  804a46:	89 c1                	mov    ecx,eax
  804a48:	48 8b 15 71 53 00 00 	mov    rdx,QWORD PTR [rip+0x5371]        # 809dc0 <gdt>
  804a4f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a52:	48 c1 e0 03          	shl    rax,0x3
  804a56:	48 01 d0             	add    rax,rdx
  804a59:	89 ca                	mov    edx,ecx
  804a5b:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804a5e:	48 8b 15 5b 53 00 00 	mov    rdx,QWORD PTR [rip+0x535b]        # 809dc0 <gdt>
  804a65:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a68:	48 c1 e0 03          	shl    rax,0x3
  804a6c:	48 01 d0             	add    rax,rdx
  804a6f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804a72:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804a75:	48 8b 15 44 53 00 00 	mov    rdx,QWORD PTR [rip+0x5344]        # 809dc0 <gdt>
  804a7c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a7f:	48 c1 e0 03          	shl    rax,0x3
  804a83:	48 01 c2             	add    rdx,rax
  804a86:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804a8a:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804a8e:	90                   	nop
  804a8f:	5d                   	pop    rbp
  804a90:	c3                   	ret    

0000000000804a91 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804a91:	f3 0f 1e fa          	endbr64 
  804a95:	55                   	push   rbp
  804a96:	48 89 e5             	mov    rbp,rsp
  804a99:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804a9c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804a9f:	89 c8                	mov    eax,ecx
  804aa1:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804aa5:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804aa9:	48 8b 05 10 53 00 00 	mov    rax,QWORD PTR [rip+0x5310]        # 809dc0 <gdt>
  804ab0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804ab4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ab7:	48 c1 e0 04          	shl    rax,0x4
  804abb:	48 89 c2             	mov    rdx,rax
  804abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ac2:	48 01 d0             	add    rax,rdx
  804ac5:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804ac8:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804acb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ace:	48 c1 e0 04          	shl    rax,0x4
  804ad2:	48 89 c2             	mov    rdx,rax
  804ad5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ad9:	48 01 d0             	add    rax,rdx
  804adc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804adf:	c1 ea 10             	shr    edx,0x10
  804ae2:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804ae5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ae8:	48 c1 e0 04          	shl    rax,0x4
  804aec:	48 89 c2             	mov    rdx,rax
  804aef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af3:	48 01 c2             	add    rdx,rax
  804af6:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804afa:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804afe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b01:	48 c1 e0 04          	shl    rax,0x4
  804b05:	48 89 c2             	mov    rdx,rax
  804b08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b0c:	48 01 c2             	add    rdx,rax
  804b0f:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804b13:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804b17:	90                   	nop
  804b18:	5d                   	pop    rbp
  804b19:	c3                   	ret    

0000000000804b1a <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804b1a:	f3 0f 1e fa          	endbr64 
  804b1e:	55                   	push   rbp
  804b1f:	48 89 e5             	mov    rbp,rsp
  804b22:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804b25:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804b28:	89 d0                	mov    eax,edx
  804b2a:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804b2e:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804b32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b35:	89 c2                	mov    edx,eax
  804b37:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b3b:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804b3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b42:	c1 e8 10             	shr    eax,0x10
  804b45:	89 c2                	mov    edx,eax
  804b47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b4b:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804b4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b51:	c1 e8 18             	shr    eax,0x18
  804b54:	89 c2                	mov    edx,eax
  804b56:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b5a:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804b5d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b60:	89 c2                	mov    edx,eax
  804b62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b66:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804b69:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b6c:	c1 e8 10             	shr    eax,0x10
  804b6f:	c1 e0 08             	shl    eax,0x8
  804b72:	66 25 00 0f          	and    ax,0xf00
  804b76:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804b7a:	89 c2                	mov    edx,eax
  804b7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b80:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804b84:	90                   	nop
  804b85:	5d                   	pop    rbp
  804b86:	c3                   	ret    
  804b87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  804b8e:	00 00 

0000000000804b90 <fill_desc>:
  804b90:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804b95:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804b9a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804b9f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804ba4:	be 00 60 00 00       	mov    esi,0x6000
  804ba9:	c1 e2 03             	shl    edx,0x3
  804bac:	01 d6                	add    esi,edx
  804bae:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804bb2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804bb7:	c1 e8 10             	shr    eax,0x10
  804bba:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804bbe:	c1 eb 10             	shr    ebx,0x10
  804bc1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804bc5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804bc9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804bcd:	c3                   	ret    

0000000000804bce <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804bce:	f3 0f 1e fa          	endbr64 
  804bd2:	55                   	push   rbp
  804bd3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804bd6:	b8 00 00 00 00       	mov    eax,0x0
  804bdb:	e8 1b 16 00 00       	call   8061fb <execute_request>
    do_req();
  804be0:	b8 00 00 00 00       	mov    eax,0x0
  804be5:	e8 ce ea ff ff       	call   8036b8 <do_req>
    if(!manage_proc_lock)
  804bea:	8b 05 78 51 00 00    	mov    eax,DWORD PTR [rip+0x5178]        # 809d68 <manage_proc_lock>
  804bf0:	85 c0                	test   eax,eax
  804bf2:	75 0a                	jne    804bfe <clock_c+0x30>
    {
        manage_proc();
  804bf4:	b8 00 00 00 00       	mov    eax,0x0
  804bf9:	e8 95 f0 ff ff       	call   803c93 <manage_proc>
    }
    //puts("1 disk req executed.");
  804bfe:	90                   	nop
  804bff:	5d                   	pop    rbp
  804c00:	c3                   	ret    
  804c01:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804c08:	00 00 00 
  804c0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804c10 <clock>:
  804c10:	b0 20                	mov    al,0x20
  804c12:	e6 a0                	out    0xa0,al
  804c14:	e6 20                	out    0x20,al
  804c16:	48 cf                	iretq  

0000000000804c18 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804c18:	f3 0f 1e fa          	endbr64 
  804c1c:	55                   	push   rbp
  804c1d:	48 89 e5             	mov    rbp,rsp
  804c20:	48 83 ec 30          	sub    rsp,0x30
  804c24:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804c28:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804c2f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804c36:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c3a:	be 01 00 00 00       	mov    esi,0x1
  804c3f:	48 89 c7             	mov    rdi,rax
  804c42:	e8 64 cd ff ff       	call   8019ab <sys_open>
  804c47:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804c4a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804c4e:	75 0a                	jne    804c5a <execute+0x42>
  804c50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c55:	e9 b7 00 00 00       	jmp    804d11 <execute+0xf9>
    //
    char *p=path;
  804c5a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c5e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804c62:	eb 05                	jmp    804c69 <execute+0x51>
  804c64:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804c69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c6d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804c70:	84 c0                	test   al,al
  804c72:	75 f0                	jne    804c64 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804c74:	eb 05                	jmp    804c7b <execute+0x63>
  804c76:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804c7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804c82:	3c 2f                	cmp    al,0x2f
  804c84:	74 0a                	je     804c90 <execute+0x78>
  804c86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c8a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804c8e:	77 e6                	ja     804c76 <execute+0x5e>
    if(p>path)
  804c90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c94:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804c98:	76 2f                	jbe    804cc9 <execute+0xb1>
    {
        *p='\0';
  804c9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c9e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804ca1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ca5:	be 01 00 00 00       	mov    esi,0x1
  804caa:	48 89 c7             	mov    rdi,rax
  804cad:	e8 f9 cc ff ff       	call   8019ab <sys_open>
  804cb2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804cb5:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804cb9:	75 07                	jne    804cc2 <execute+0xaa>
  804cbb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804cc0:	eb 4f                	jmp    804d11 <execute+0xf9>
        *p='/';
  804cc2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cc6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804cc9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ccc:	48 63 d0             	movsxd rdx,eax
  804ccf:	48 89 d0             	mov    rax,rdx
  804cd2:	48 01 c0             	add    rax,rax
  804cd5:	48 01 d0             	add    rax,rdx
  804cd8:	48 c1 e0 05          	shl    rax,0x5
  804cdc:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804ce3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ce6:	48 63 c8             	movsxd rcx,eax
  804ce9:	48 89 c8             	mov    rax,rcx
  804cec:	48 01 c0             	add    rax,rax
  804cef:	48 01 c8             	add    rax,rcx
  804cf2:	48 c1 e0 05          	shl    rax,0x5
  804cf6:	48 05 60 06 40 00    	add    rax,0x400660
  804cfc:	b9 7b 4d 80 00       	mov    ecx,0x804d7b
  804d01:	48 89 c6             	mov    rsi,rax
  804d04:	89 cf                	mov    edi,ecx
  804d06:	e8 0b f8 ff ff       	call   804516 <reg_proc>
  804d0b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804d0e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804d11:	c9                   	leave  
  804d12:	c3                   	ret    

0000000000804d13 <exec_call>:

int exec_call(char *path)
{
  804d13:	f3 0f 1e fa          	endbr64 
  804d17:	55                   	push   rbp
  804d18:	48 89 e5             	mov    rbp,rsp
  804d1b:	48 83 ec 20          	sub    rsp,0x20
  804d1f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804d23:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d27:	48 89 c7             	mov    rdi,rax
  804d2a:	e8 e9 fe ff ff       	call   804c18 <execute>
  804d2f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804d32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d35:	01 c0                	add    eax,eax
  804d37:	83 c0 05             	add    eax,0x5
  804d3a:	c1 e0 03             	shl    eax,0x3
  804d3d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804d40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d43:	89 c7                	mov    edi,eax
  804d45:	e8 6a f0 ff ff       	call   803db4 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804d4a:	90                   	nop
  804d4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d4e:	48 98                	cdqe   
  804d50:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d57:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804d5d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804d60:	83 f8 03             	cmp    eax,0x3
  804d63:	75 e6                	jne    804d4b <exec_call+0x38>
    return task[pi].exit_code;
  804d65:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d68:	48 98                	cdqe   
  804d6a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d71:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804d77:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804d79:	c9                   	leave  
  804d7a:	c3                   	ret    

0000000000804d7b <proc_start>:
int proc_start()
{
  804d7b:	f3 0f 1e fa          	endbr64 
  804d7f:	55                   	push   rbp
  804d80:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804d83:	8b 05 e7 d2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d2e7]        # 412070 <cur_proc>
  804d89:	48 98                	cdqe   
  804d8b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d92:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804d98:	48 89 c7             	mov    rdi,rax
  804d9b:	e8 1a 00 00 00       	call   804dba <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804da0:	8b 05 ca d2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d2ca]        # 412070 <cur_proc>
  804da6:	89 c7                	mov    edi,eax
  804da8:	e8 46 f5 ff ff       	call   8042f3 <del_proc>
    switch_proc_tss(0);
  804dad:	bf 00 00 00 00       	mov    edi,0x0
  804db2:	e8 fd ef ff ff       	call   803db4 <switch_proc_tss>
}
  804db7:	90                   	nop
  804db8:	5d                   	pop    rbp
  804db9:	c3                   	ret    

0000000000804dba <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804dba:	f3 0f 1e fa          	endbr64 
  804dbe:	55                   	push   rbp
  804dbf:	48 89 e5             	mov    rbp,rsp
  804dc2:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804dc9:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804dd0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804dd7:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804dde:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804de2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804de6:	8b 00                	mov    eax,DWORD PTR [rax]
  804de8:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804deb:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804df2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804df5:	ba 44 00 00 00       	mov    edx,0x44
  804dfa:	48 89 ce             	mov    rsi,rcx
  804dfd:	89 c7                	mov    edi,eax
  804dff:	e8 86 d1 ff ff       	call   801f8a <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804e04:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804e0b:	89 c1                	mov    ecx,eax
  804e0d:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e10:	ba 00 00 00 00       	mov    edx,0x0
  804e15:	89 ce                	mov    esi,ecx
  804e17:	89 c7                	mov    edi,eax
  804e19:	e8 fd d1 ff ff       	call   80201b <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804e1e:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804e25:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e28:	ba f8 00 00 00       	mov    edx,0xf8
  804e2d:	48 89 ce             	mov    rsi,rcx
  804e30:	89 c7                	mov    edi,eax
  804e32:	e8 53 d1 ff ff       	call   801f8a <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804e37:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804e3d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804e40:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804e46:	c1 e8 0c             	shr    eax,0xc
  804e49:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804e4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e4f:	c1 e8 16             	shr    eax,0x16
  804e52:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804e55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e58:	25 ff ff 3f 00       	and    eax,0x3fffff
  804e5d:	c1 e8 0c             	shr    eax,0xc
  804e60:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  804e63:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804e6a:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  804e71:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804e74:	48 98                	cdqe   
  804e76:	48 c1 e0 02          	shl    rax,0x2
  804e7a:	48 01 d0             	add    rax,rdx
  804e7d:	8b 00                	mov    eax,DWORD PTR [rax]
  804e7f:	89 c0                	mov    eax,eax
  804e81:	25 00 f0 ff ff       	and    eax,0xfffff000
  804e86:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804e8a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804e91:	eb 48                	jmp    804edb <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804e93:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804e96:	99                   	cdq    
  804e97:	c1 ea 16             	shr    edx,0x16
  804e9a:	01 d0                	add    eax,edx
  804e9c:	25 ff 03 00 00       	and    eax,0x3ff
  804ea1:	29 d0                	sub    eax,edx
  804ea3:	89 c2                	mov    edx,eax
  804ea5:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804ea8:	01 d0                	add    eax,edx
  804eaa:	48 98                	cdqe   
  804eac:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804eb3:	00 
  804eb4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804eb8:	48 01 d0             	add    rax,rdx
  804ebb:	8b 00                	mov    eax,DWORD PTR [rax]
  804ebd:	83 e0 01             	and    eax,0x1
  804ec0:	85 c0                	test   eax,eax
  804ec2:	74 13                	je     804ed7 <load_pe+0x11d>
  804ec4:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804ec9:	74 0c                	je     804ed7 <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  804ecb:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804ed2:	e9 75 ff ff ff       	jmp    804e4c <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804ed7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804edb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804ede:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804ee1:	7c b0                	jl     804e93 <load_pe+0xd9>
            }
        }
        break;
  804ee3:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804ee4:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804ee7:	ba 00 00 00 00       	mov    edx,0x0
  804eec:	be 00 00 00 00       	mov    esi,0x0
  804ef1:	89 c7                	mov    edi,eax
  804ef3:	e8 23 d1 ff ff       	call   80201b <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804ef8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804efb:	48 89 c1             	mov    rcx,rax
  804efe:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f01:	ba 00 10 00 00       	mov    edx,0x1000
  804f06:	48 89 ce             	mov    rsi,rcx
  804f09:	89 c7                	mov    edi,eax
  804f0b:	e8 7a d0 ff ff       	call   801f8a <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804f10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f13:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804f1a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804f1d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804f24:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804f28:	48 01 d0             	add    rax,rdx
  804f2b:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804f32:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f39:	48 83 c0 04          	add    rax,0x4
  804f3d:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804f44:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f4b:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804f4e:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804f54:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804f5a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804f60:	85 c0                	test   eax,eax
  804f62:	0f 48 c2             	cmovs  eax,edx
  804f65:	c1 f8 0c             	sar    eax,0xc
  804f68:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804f6e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f75:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804f78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f7b:	01 d0                	add    eax,edx
  804f7d:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804f83:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804f89:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804f8f:	85 c0                	test   eax,eax
  804f91:	0f 48 c2             	cmovs  eax,edx
  804f94:	c1 f8 0a             	sar    eax,0xa
  804f97:	89 c1                	mov    ecx,eax
  804f99:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804f9f:	99                   	cdq    
  804fa0:	c1 ea 16             	shr    edx,0x16
  804fa3:	01 d0                	add    eax,edx
  804fa5:	25 ff 03 00 00       	and    eax,0x3ff
  804faa:	29 d0                	sub    eax,edx
  804fac:	01 c8                	add    eax,ecx
  804fae:	85 c0                	test   eax,eax
  804fb0:	0f 95 c0             	setne  al
  804fb3:	0f b6 c0             	movzx  eax,al
  804fb6:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804fbc:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  804fc2:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  804fc8:	85 c0                	test   eax,eax
  804fca:	0f 48 c2             	cmovs  eax,edx
  804fcd:	c1 f8 16             	sar    eax,0x16
  804fd0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  804fd6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804fdd:	89 c0                	mov    eax,eax
  804fdf:	48 05 f8 00 00 00    	add    rax,0xf8
  804fe5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  804fe9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804ff0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804ff4:	0f b7 d0             	movzx  edx,ax
  804ff7:	89 d0                	mov    eax,edx
  804ff9:	c1 e0 02             	shl    eax,0x2
  804ffc:	01 d0                	add    eax,edx
  804ffe:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805001:	05 3c 01 00 00       	add    eax,0x13c
  805006:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  80500c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805013:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805016:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  80501c:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805022:	99                   	cdq    
  805023:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805029:	89 d0                	mov    eax,edx
  80502b:	85 c0                	test   eax,eax
  80502d:	74 23                	je     805052 <load_pe+0x298>
  80502f:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805035:	99                   	cdq    
  805036:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80503c:	89 d1                	mov    ecx,edx
  80503e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805044:	29 c8                	sub    eax,ecx
  805046:	89 c2                	mov    edx,eax
  805048:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  80504e:	01 d0                	add    eax,edx
  805050:	eb 06                	jmp    805058 <load_pe+0x29e>
  805052:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805058:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80505e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805065:	eb 68                	jmp    8050cf <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805067:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80506b:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80506e:	25 00 00 00 02       	and    eax,0x2000000
  805073:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805079:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  805080:	75 43                	jne    8050c5 <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805082:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805086:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805089:	89 c1                	mov    ecx,eax
  80508b:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80508e:	ba 00 00 00 00       	mov    edx,0x0
  805093:	89 ce                	mov    esi,ecx
  805095:	89 c7                	mov    edi,eax
  805097:	e8 7f cf ff ff       	call   80201b <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80509c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050a0:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050a3:	89 c2                	mov    edx,eax
  8050a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050a9:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  8050ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050af:	01 c8                	add    eax,ecx
  8050b1:	89 c0                	mov    eax,eax
  8050b3:	48 89 c1             	mov    rcx,rax
  8050b6:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050b9:	48 89 ce             	mov    rsi,rcx
  8050bc:	89 c7                	mov    edi,eax
  8050be:	e8 c7 ce ff ff       	call   801f8a <sys_read>
  8050c3:	eb 01                	jmp    8050c6 <load_pe+0x30c>
            continue;
  8050c5:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8050c6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8050ca:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8050cf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050d6:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8050da:	0f b7 c0             	movzx  eax,ax
  8050dd:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8050e0:	7c 85                	jl     805067 <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8050e2:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050e9:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8050ed:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8050f4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8050fb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8050fe:	85 c0                	test   eax,eax
  805100:	0f 84 71 02 00 00    	je     805377 <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805106:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80510d:	8b 10                	mov    edx,DWORD PTR [rax]
  80510f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805112:	01 d0                	add    eax,edx
  805114:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  80511a:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  805120:	48 98                	cdqe   
  805122:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805126:	e9 3e 02 00 00       	jmp    805369 <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  80512b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80512f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805132:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805135:	01 d0                	add    eax,edx
  805137:	89 c0                	mov    eax,eax
  805139:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805140:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805147:	be 68 18 81 00       	mov    esi,0x811868
  80514c:	48 89 c7             	mov    rdi,rax
  80514f:	e8 1f 45 00 00       	call   809673 <strcmp>
  805154:	85 c0                	test   eax,eax
  805156:	75 09                	jne    805161 <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  805158:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80515f:	eb 25                	jmp    805186 <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805161:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805168:	48 89 c7             	mov    rdi,rax
  80516b:	e8 4a fc ff ff       	call   804dba <load_pe>
  805170:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805176:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80517c:	89 c7                	mov    edi,eax
  80517e:	e8 c9 03 00 00       	call   80554c <get_module_addr>
  805183:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805186:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805189:	48 98                	cdqe   
  80518b:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805192:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805195:	48 63 d0             	movsxd rdx,eax
  805198:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80519f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8051a3:	48 01 d0             	add    rax,rdx
  8051a6:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  8051ad:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8051b4:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8051b7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051ba:	01 d0                	add    eax,edx
  8051bc:	89 c0                	mov    eax,eax
  8051be:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8051c5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051cc:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8051cf:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8051d5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051dc:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8051df:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051e2:	01 d0                	add    eax,edx
  8051e4:	89 c0                	mov    eax,eax
  8051e6:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8051ed:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051f4:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8051f7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051fa:	01 d0                	add    eax,edx
  8051fc:	89 c0                	mov    eax,eax
  8051fe:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805205:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80520c:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80520f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805212:	01 d0                	add    eax,edx
  805214:	89 c0                	mov    eax,eax
  805216:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  80521d:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805224:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805227:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  80522d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805231:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805234:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805237:	01 d0                	add    eax,edx
  805239:	89 c0                	mov    eax,eax
  80523b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80523f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805243:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805246:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805249:	01 d0                	add    eax,edx
  80524b:	89 c0                	mov    eax,eax
  80524d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805251:	e9 00 01 00 00       	jmp    805356 <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805256:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80525a:	8b 00                	mov    eax,DWORD PTR [rax]
  80525c:	85 c0                	test   eax,eax
  80525e:	79 43                	jns    8052a3 <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805260:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805264:	8b 00                	mov    eax,DWORD PTR [rax]
  805266:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80526b:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805271:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805277:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80527d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805284:	00 
  805285:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80528c:	48 01 d0             	add    rax,rdx
  80528f:	8b 10                	mov    edx,DWORD PTR [rax]
  805291:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805294:	01 d0                	add    eax,edx
  805296:	89 c2                	mov    edx,eax
  805298:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80529c:	89 10                	mov    DWORD PTR [rax],edx
  80529e:	e9 a9 00 00 00       	jmp    80534c <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8052a3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052a7:	8b 00                	mov    eax,DWORD PTR [rax]
  8052a9:	89 c0                	mov    eax,eax
  8052ab:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8052b2:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8052b9:	02 
                    int i=0;
  8052ba:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8052c1:	eb 7a                	jmp    80533d <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8052c3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8052c6:	48 98                	cdqe   
  8052c8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052cf:	00 
  8052d0:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8052d7:	48 01 d0             	add    rax,rdx
  8052da:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8052dd:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8052e4:	48 89 d6             	mov    rsi,rdx
  8052e7:	48 89 c7             	mov    rdi,rax
  8052ea:	e8 84 43 00 00       	call   809673 <strcmp>
  8052ef:	85 c0                	test   eax,eax
  8052f1:	75 46                	jne    805339 <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  8052f3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8052f6:	48 98                	cdqe   
  8052f8:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8052fc:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805303:	48 01 d0             	add    rax,rdx
  805306:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805309:	98                   	cwde   
  80530a:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  805310:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805316:	48 98                	cdqe   
  805318:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80531f:	00 
  805320:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805327:	48 01 d0             	add    rax,rdx
  80532a:	8b 10                	mov    edx,DWORD PTR [rax]
  80532c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80532f:	01 d0                	add    eax,edx
  805331:	89 c2                	mov    edx,eax
  805333:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805337:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805339:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  80533d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805340:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805346:	0f 8c 77 ff ff ff    	jl     8052c3 <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  80534c:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805351:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805356:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80535a:	8b 00                	mov    eax,DWORD PTR [rax]
  80535c:	85 c0                	test   eax,eax
  80535e:	0f 85 f2 fe ff ff    	jne    805256 <load_pe+0x49c>
            }
            impdes++;
  805364:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805369:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80536d:	8b 00                	mov    eax,DWORD PTR [rax]
  80536f:	85 c0                	test   eax,eax
  805371:	0f 85 b4 fd ff ff    	jne    80512b <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805377:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80537e:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80537f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805386:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80538c:	85 c0                	test   eax,eax
  80538e:	0f 84 e8 00 00 00    	je     80547c <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805394:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80539b:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8053a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053a4:	01 d0                	add    eax,edx
  8053a6:	89 c0                	mov    eax,eax
  8053a8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8053ac:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053b0:	48 83 c0 40          	add    rax,0x40
  8053b4:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8053b8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8053bc:	48 83 c0 02          	add    rax,0x2
  8053c0:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8053c4:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053cb:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8053ce:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8053d4:	e9 95 00 00 00       	jmp    80546e <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  8053d9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053dd:	8b 10                	mov    edx,DWORD PTR [rax]
  8053df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053e2:	01 d0                	add    eax,edx
  8053e4:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8053ea:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8053f1:	eb 59                	jmp    80544c <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8053f3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8053f7:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8053fa:	66 85 c0             	test   ax,ax
  8053fd:	74 48                	je     805447 <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8053ff:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805403:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805406:	0f b7 d0             	movzx  edx,ax
  805409:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  80540f:	01 d0                	add    eax,edx
  805411:	48 98                	cdqe   
  805413:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  80541a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805421:	8b 00                	mov    eax,DWORD PTR [rax]
  805423:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805429:	89 c2                	mov    edx,eax
  80542b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80542e:	01 d0                	add    eax,edx
  805430:	89 c2                	mov    edx,eax
  805432:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805439:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80543b:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805440:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805445:	eb 01                	jmp    805448 <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805447:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805448:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  80544c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805450:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805453:	c1 e8 02             	shr    eax,0x2
  805456:	89 c2                	mov    edx,eax
  805458:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80545b:	39 c2                	cmp    edx,eax
  80545d:	77 94                	ja     8053f3 <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  80545f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805463:	05 00 10 00 00       	add    eax,0x1000
  805468:	48 98                	cdqe   
  80546a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80546e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805472:	8b 00                	mov    eax,DWORD PTR [rax]
  805474:	85 c0                	test   eax,eax
  805476:	0f 85 5d ff ff ff    	jne    8053d9 <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80547c:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805483:	00 00 00 
  805486:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80548d:	00 00 00 
  805490:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805497:	00 00 00 00 
  80549b:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8054a2:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8054a6:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8054ad:	ba 18 00 00 00       	mov    edx,0x18
  8054b2:	48 89 c6             	mov    rsi,rax
  8054b5:	bf 00 00 00 01       	mov    edi,0x1000000
  8054ba:	e8 16 3f 00 00       	call   8093d5 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8054bf:	8b 05 ab cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cbab]        # 412070 <cur_proc>
  8054c5:	48 98                	cdqe   
  8054c7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8054ce:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8054d4:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8054db:	8b 05 8f cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb8f]        # 412070 <cur_proc>
  8054e1:	48 98                	cdqe   
  8054e3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8054ea:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8054f0:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8054f7:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8054fd:	48 98                	cdqe   
  8054ff:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805506:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  80550d:	be 00 00 00 00       	mov    esi,0x0
  805512:	bf 00 00 00 00       	mov    edi,0x0
  805517:	ff d0                	call   rax
  805519:	8b 15 51 cb c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0cb51]        # 412070 <cur_proc>
  80551f:	89 c1                	mov    ecx,eax
  805521:	48 63 c2             	movsxd rax,edx
  805524:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80552b:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805531:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805533:	8b 05 37 cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb37]        # 412070 <cur_proc>
  805539:	48 98                	cdqe   
  80553b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805542:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805548:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80554a:	c9                   	leave  
  80554b:	c3                   	ret    

000000000080554c <get_module_addr>:

int get_module_addr(int mi)
{
  80554c:	f3 0f 1e fa          	endbr64 
  805550:	55                   	push   rbp
  805551:	48 89 e5             	mov    rbp,rsp
  805554:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805557:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80555a:	48 98                	cdqe   
  80555c:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  805563:	5d                   	pop    rbp
  805564:	c3                   	ret    

0000000000805565 <dispose_library>:
int dispose_library(int dlln)
{
  805565:	f3 0f 1e fa          	endbr64 
  805569:	55                   	push   rbp
  80556a:	48 89 e5             	mov    rbp,rsp
  80556d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805570:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805574:	78 09                	js     80557f <dispose_library+0x1a>
  805576:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  80557d:	7e 07                	jle    805586 <dispose_library+0x21>
  80557f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805584:	eb 1d                	jmp    8055a3 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805586:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805589:	48 98                	cdqe   
  80558b:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805592:	48 05 88 20 41 00    	add    rax,0x412088
  805598:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  80559e:	b8 00 00 00 00       	mov    eax,0x0
}
  8055a3:	5d                   	pop    rbp
  8055a4:	c3                   	ret    

00000000008055a5 <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8055a5:	f3 0f 1e fa          	endbr64 
  8055a9:	55                   	push   rbp
  8055aa:	48 89 e5             	mov    rbp,rsp
  8055ad:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8055b1:	90                   	nop
  8055b2:	5d                   	pop    rbp
  8055b3:	c3                   	ret    

00000000008055b4 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8055b4:	f3 0f 1e fa          	endbr64 
  8055b8:	55                   	push   rbp
  8055b9:	48 89 e5             	mov    rbp,rsp
  8055bc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8055c0:	90                   	nop
  8055c1:	5d                   	pop    rbp
  8055c2:	c3                   	ret    
  8055c3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8055ca:	00 00 00 
  8055cd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008055d0 <_syscall>:
  8055d0:	57                   	push   rdi
  8055d1:	56                   	push   rsi
  8055d2:	52                   	push   rdx
  8055d3:	51                   	push   rcx
  8055d4:	53                   	push   rbx
  8055d5:	50                   	push   rax
  8055d6:	e8 9a af ff ff       	call   800575 <syscall>
  8055db:	48 83 c4 18          	add    rsp,0x18
  8055df:	cf                   	iret   

00000000008055e0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8055e0:	f3 0f 1e fa          	endbr64 
  8055e4:	55                   	push   rbp
  8055e5:	48 89 e5             	mov    rbp,rsp
  8055e8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8055ec:	8b 05 a2 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1faa2]        # 425094 <framebuffer+0x14>
  8055f2:	89 c0                	mov    eax,eax
  8055f4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8055f8:	8b 05 9a fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa9a]        # 425098 <framebuffer+0x18>
  8055fe:	89 c0                	mov    eax,eax
  805600:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805604:	0f b6 05 91 fa c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fa91]        # 42509c <framebuffer+0x1c>
  80560b:	c0 e8 03             	shr    al,0x3
  80560e:	0f b6 c0             	movzx  eax,al
  805611:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805615:	8b 05 75 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa75]        # 425090 <framebuffer+0x10>
  80561b:	89 c0                	mov    eax,eax
  80561d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805621:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805625:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  80562a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80562e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805632:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805637:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80563b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80563f:	48 c1 e8 0c          	shr    rax,0xc
  805643:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805646:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  80564d:	00 00 00 
  805650:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t pp=framebuffer.common.framebuffer_addr;
  805654:	48 8b 05 2d fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa2d]        # 425088 <framebuffer+0x8>
  80565b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80565f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805666:	00 
  805667:	eb 2d                	jmp    805696 <init_framebuffer+0xb6>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805669:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80566d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805671:	ba 07 00 00 00       	mov    edx,0x7
  805676:	48 89 ce             	mov    rsi,rcx
  805679:	48 89 c7             	mov    rdi,rax
  80567c:	e8 a1 b8 ff ff       	call   800f22 <mmap>
        pp+=PAGE_SIZE;
  805681:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805688:	00 
        p+=PAGE_SIZE;
  805689:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805690:	00 
    for (size_t i = 0; i < pgc; i++)
  805691:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805696:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805699:	48 98                	cdqe   
  80569b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80569f:	72 c8                	jb     805669 <init_framebuffer+0x89>
    }
    
    
}
  8056a1:	90                   	nop
  8056a2:	90                   	nop
  8056a3:	c9                   	leave  
  8056a4:	c3                   	ret    

00000000008056a5 <init_font>:
void init_font(){
  8056a5:	f3 0f 1e fa          	endbr64 
  8056a9:	55                   	push   rbp
  8056aa:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8056ad:	48 c7 05 08 fa c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1fa08],0x809f88        # 4250c0 <boot_font>
  8056b4:	88 9f 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8056b8:	48 8b 05 01 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa01]        # 4250c0 <boot_font>
  8056bf:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8056c2:	83 c0 07             	add    eax,0x7
  8056c5:	c1 e8 03             	shr    eax,0x3
  8056c8:	89 05 02 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa02],eax        # 4250d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8056ce:	8b 05 fc f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f9fc]        # 4250d0 <font_width_bytes>
  8056d4:	c1 e0 03             	shl    eax,0x3
  8056d7:	89 05 eb f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9eb],eax        # 4250c8 <font_width>
    font_height = boot_font->height;
  8056dd:	48 8b 05 dc f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9dc]        # 4250c0 <boot_font>
  8056e4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8056e7:	89 05 df f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9df],eax        # 4250cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8056ed:	48 8b 05 cc f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9cc]        # 4250c0 <boot_font>
  8056f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8056f7:	89 c0                	mov    eax,eax
  8056f9:	48 05 88 9f 80 00    	add    rax,0x809f88
  8056ff:	48 89 05 d2 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f9d2],rax        # 4250d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805706:	48 8b 05 b3 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9b3]        # 4250c0 <boot_font>
  80570d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805710:	89 05 ce f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9ce],eax        # 4250e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805716:	48 8b 05 a3 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9a3]        # 4250c0 <boot_font>
  80571d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805720:	89 05 ba f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9ba],eax        # 4250e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805726:	c7 05 80 f9 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f980],0x0        # 4250b0 <fb_cursor_y>
  80572d:	00 00 00 
  805730:	8b 05 7a f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f97a]        # 4250b0 <fb_cursor_y>
  805736:	89 05 70 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f970],eax        # 4250ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  80573c:	8b 15 52 f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f952]        # 425094 <framebuffer+0x14>
  805742:	0f b6 05 53 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f953]        # 42509c <framebuffer+0x1c>
  805749:	0f b6 c0             	movzx  eax,al
  80574c:	0f af c2             	imul   eax,edx
  80574f:	c1 e8 03             	shr    eax,0x3
  805752:	8b 0d 70 f9 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f970]        # 4250c8 <font_width>
  805758:	ba 00 00 00 00       	mov    edx,0x0
  80575d:	f7 f1                	div    ecx
  80575f:	89 05 4f f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f94f],eax        # 4250b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805765:	8b 15 2d f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f92d]        # 425098 <framebuffer+0x18>
  80576b:	0f b6 05 2a f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f92a]        # 42509c <framebuffer+0x1c>
  805772:	0f b6 c0             	movzx  eax,al
  805775:	0f af c2             	imul   eax,edx
  805778:	c1 e8 03             	shr    eax,0x3
  80577b:	8b 35 4b f9 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f94b]        # 4250cc <font_height>
  805781:	ba 00 00 00 00       	mov    edx,0x0
  805786:	f7 f6                	div    esi
  805788:	89 05 2a f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f92a],eax        # 4250b8 <max_ch_nr_y>
    font_size=1;
  80578e:	c7 05 30 46 00 00 01 	mov    DWORD PTR [rip+0x4630],0x1        # 809dc8 <font_size>
  805795:	00 00 00 
}
  805798:	90                   	nop
  805799:	5d                   	pop    rbp
  80579a:	c3                   	ret    

000000000080579b <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  80579b:	f3 0f 1e fa          	endbr64 
  80579f:	55                   	push   rbp
  8057a0:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8057a3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8057a7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8057ab:	48 89 05 ce f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8ce],rax        # 425080 <framebuffer>
  8057b2:	48 89 15 cf f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8cf],rdx        # 425088 <framebuffer+0x8>
  8057b9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8057bd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8057c1:	48 89 05 c8 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8c8],rax        # 425090 <framebuffer+0x10>
  8057c8:	48 89 15 c9 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8c9],rdx        # 425098 <framebuffer+0x18>
  8057cf:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8057d3:	48 89 05 c6 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8c6],rax        # 4250a0 <framebuffer+0x20>
}
  8057da:	90                   	nop
  8057db:	5d                   	pop    rbp
  8057dc:	c3                   	ret    

00000000008057dd <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8057dd:	f3 0f 1e fa          	endbr64 
  8057e1:	55                   	push   rbp
  8057e2:	48 89 e5             	mov    rbp,rsp
  8057e5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8057e8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8057eb:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8057ee:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8057f1:	44 89 45 dc          	mov    DWORD PTR [rbp-0x24],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8057f5:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  8057fc:	00 00 00 
  8057ff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805803:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805806:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805809:	eb 64                	jmp    80586f <fill_rect+0x92>
        for(int px=y;px<w+y;px++){
  80580b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80580e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805811:	eb 4b                	jmp    80585e <fill_rect+0x81>
            fb=(unsigned int*)(FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805813:	8b 15 77 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f877]        # 425090 <framebuffer+0x10>
  805819:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80581c:	0f af c2             	imul   eax,edx
  80581f:	89 c1                	mov    ecx,eax
                    +px*framebuffer.common.framebuffer_bpp/8);
  805821:	0f b6 05 74 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f874]        # 42509c <framebuffer+0x1c>
  805828:	0f b6 c0             	movzx  eax,al
  80582b:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  80582f:	8d 50 07             	lea    edx,[rax+0x7]
  805832:	85 c0                	test   eax,eax
  805834:	0f 48 c2             	cmovs  eax,edx
  805837:	c1 f8 03             	sar    eax,0x3
  80583a:	48 98                	cdqe   
  80583c:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  805840:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  805847:	00 00 00 
  80584a:	48 01 d0             	add    rax,rdx
            fb=(unsigned int*)(FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80584d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805851:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805855:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  805858:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80585a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80585e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805861:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805864:	01 d0                	add    eax,edx
  805866:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805869:	7c a8                	jl     805813 <fill_rect+0x36>
    for(int py=x;py<h+x;py++){
  80586b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80586f:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  805872:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805875:	01 d0                	add    eax,edx
  805877:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80587a:	7c 8f                	jl     80580b <fill_rect+0x2e>
        }
    }
}
  80587c:	90                   	nop
  80587d:	90                   	nop
  80587e:	5d                   	pop    rbp
  80587f:	c3                   	ret    

0000000000805880 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805880:	f3 0f 1e fa          	endbr64 
  805884:	55                   	push   rbp
  805885:	48 89 e5             	mov    rbp,rsp
  805888:	48 83 ec 30          	sub    rsp,0x30
  80588c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80588f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805892:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805895:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805899:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80589c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  80589f:	eb 5a                	jmp    8058fb <draw_text+0x7b>
    {
        if(*str=='\n')
  8058a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058a8:	3c 0a                	cmp    al,0xa
  8058aa:	75 1c                	jne    8058c8 <draw_text+0x48>
        {
            y+=font_height*size;
  8058ac:	8b 15 1a f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f81a]        # 4250cc <font_height>
  8058b2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8058b5:	0f af d0             	imul   edx,eax
  8058b8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8058bb:	01 d0                	add    eax,edx
  8058bd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8058c0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058c3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8058c6:	eb 2e                	jmp    8058f6 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8058c8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058cf:	0f be c8             	movsx  ecx,al
  8058d2:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8058d5:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8058d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058db:	89 c7                	mov    edi,eax
  8058dd:	e8 28 00 00 00       	call   80590a <draw_letter>
            tx+=size*font_width;
  8058e2:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8058e5:	8b 05 dd f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7dd]        # 4250c8 <font_width>
  8058eb:	0f af d0             	imul   edx,eax
  8058ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058f1:	01 d0                	add    eax,edx
  8058f3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8058f6:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8058fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805902:	84 c0                	test   al,al
  805904:	75 9b                	jne    8058a1 <draw_text+0x21>
    }
}
  805906:	90                   	nop
  805907:	90                   	nop
  805908:	c9                   	leave  
  805909:	c3                   	ret    

000000000080590a <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  80590a:	f3 0f 1e fa          	endbr64 
  80590e:	55                   	push   rbp
  80590f:	48 89 e5             	mov    rbp,rsp
  805912:	48 83 ec 30          	sub    rsp,0x30
  805916:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805919:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  80591c:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  80591f:	89 c8                	mov    eax,ecx
  805921:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805924:	48 8b 05 ad f7 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f7ad]        # 4250d8 <glyph_table>
  80592b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  80592f:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805933:	8b 05 ab f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7ab]        # 4250e4 <glyph_nr>
  805939:	39 c2                	cmp    edx,eax
  80593b:	73 13                	jae    805950 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  80593d:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805941:	8b 05 99 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f799]        # 4250e0 <bytes_per_glyph>
  805947:	0f af c2             	imul   eax,edx
  80594a:	89 c0                	mov    eax,eax
  80594c:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805950:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805957:	e9 c9 00 00 00       	jmp    805a25 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  80595c:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805960:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805967:	e9 9a 00 00 00       	jmp    805a06 <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  80596c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80596f:	c1 e8 03             	shr    eax,0x3
  805972:	89 c2                	mov    edx,eax
  805974:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805978:	48 01 d0             	add    rax,rdx
  80597b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80597e:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805981:	84 c0                	test   al,al
  805983:	74 37                	je     8059bc <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805985:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805988:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  80598c:	89 c2                	mov    edx,eax
  80598e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805991:	01 d0                	add    eax,edx
  805993:	89 c6                	mov    esi,eax
  805995:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805998:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  80599c:	89 c2                	mov    edx,eax
  80599e:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059a1:	01 d0                	add    eax,edx
  8059a3:	89 c7                	mov    edi,eax
  8059a5:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059a8:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059ab:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  8059b1:	89 d1                	mov    ecx,edx
  8059b3:	89 c2                	mov    edx,eax
  8059b5:	e8 23 fe ff ff       	call   8057dd <fill_rect>
  8059ba:	eb 35                	jmp    8059f1 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  8059bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059bf:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8059c3:	89 c2                	mov    edx,eax
  8059c5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8059c8:	01 d0                	add    eax,edx
  8059ca:	89 c6                	mov    esi,eax
  8059cc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059cf:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8059d3:	89 c2                	mov    edx,eax
  8059d5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059d8:	01 d0                	add    eax,edx
  8059da:	89 c7                	mov    edi,eax
  8059dc:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059df:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059e2:	41 b8 00 00 00 00    	mov    r8d,0x0
  8059e8:	89 d1                	mov    ecx,edx
  8059ea:	89 c2                	mov    edx,eax
  8059ec:	e8 ec fd ff ff       	call   8057dd <fill_rect>
            }

            mask >>= 1;
  8059f1:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8059f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059f7:	83 e0 07             	and    eax,0x7
  8059fa:	85 c0                	test   eax,eax
  8059fc:	75 04                	jne    805a02 <draw_letter+0xf8>
                mask = 1 << 7;
  8059fe:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805a02:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805a06:	8b 05 bc f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6bc]        # 4250c8 <font_width>
  805a0c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805a0f:	0f 82 57 ff ff ff    	jb     80596c <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805a15:	8b 05 b5 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6b5]        # 4250d0 <font_width_bytes>
  805a1b:	89 c0                	mov    eax,eax
  805a1d:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805a21:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805a25:	8b 05 a1 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6a1]        # 4250cc <font_height>
  805a2b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805a2e:	0f 82 28 ff ff ff    	jb     80595c <draw_letter+0x52>
    }
}
  805a34:	90                   	nop
  805a35:	90                   	nop
  805a36:	c9                   	leave  
  805a37:	c3                   	ret    

0000000000805a38 <scr_up>:
//向上滚动一个像素
void scr_up(){
  805a38:	f3 0f 1e fa          	endbr64 
  805a3c:	55                   	push   rbp
  805a3d:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805a40:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805a47:	eb 74                	jmp    805abd <scr_up+0x85>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a49:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805a50:	eb 5a                	jmp    805aac <scr_up+0x74>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a52:	8b 15 38 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f638]        # 425090 <framebuffer+0x10>
  805a58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a5b:	0f af c2             	imul   eax,edx
  805a5e:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805a60:	0f b6 05 35 f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f635]        # 42509c <framebuffer+0x1c>
  805a67:	0f b6 c0             	movzx  eax,al
  805a6a:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805a6e:	8d 50 07             	lea    edx,[rax+0x7]
  805a71:	85 c0                	test   eax,eax
  805a73:	0f 48 c2             	cmovs  eax,edx
  805a76:	c1 f8 03             	sar    eax,0x3
  805a79:	48 98                	cdqe   
  805a7b:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  805a7f:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  805a86:	00 00 00 
  805a89:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a8c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805a90:	8b 05 fa f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5fa]        # 425090 <framebuffer+0x10>
  805a96:	89 c2                	mov    edx,eax
  805a98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a9c:	48 01 d0             	add    rax,rdx
  805a9f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805aa2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805aa6:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805aa8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805aac:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805aaf:	8b 05 ff f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5ff]        # 4250b4 <max_ch_nr_x>
  805ab5:	39 c2                	cmp    edx,eax
  805ab7:	72 99                	jb     805a52 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805ab9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805abd:	8b 05 f5 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5f5]        # 4250b8 <max_ch_nr_y>
  805ac3:	8d 50 ff             	lea    edx,[rax-0x1]
  805ac6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ac9:	39 c2                	cmp    edx,eax
  805acb:	0f 87 78 ff ff ff    	ja     805a49 <scr_up+0x11>
        }

    }
}
  805ad1:	90                   	nop
  805ad2:	90                   	nop
  805ad3:	5d                   	pop    rbp
  805ad4:	c3                   	ret    

0000000000805ad5 <print>:
void print(char* s){
  805ad5:	f3 0f 1e fa          	endbr64 
  805ad9:	55                   	push   rbp
  805ada:	48 89 e5             	mov    rbp,rsp
  805add:	48 83 ec 18          	sub    rsp,0x18
  805ae1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805ae5:	e9 ec 00 00 00       	jmp    805bd6 <print+0x101>
        if(fb_cursor_x>max_ch_nr_x)
  805aea:	8b 15 bc f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f5bc]        # 4250ac <fb_cursor_x>
  805af0:	8b 05 be f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5be]        # 4250b4 <max_ch_nr_x>
  805af6:	39 c2                	cmp    edx,eax
  805af8:	76 19                	jbe    805b13 <print+0x3e>
        {
            fb_cursor_y+=1;
  805afa:	8b 05 b0 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5b0]        # 4250b0 <fb_cursor_y>
  805b00:	83 c0 01             	add    eax,0x1
  805b03:	89 05 a7 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5a7],eax        # 4250b0 <fb_cursor_y>
            fb_cursor_x=0;
  805b09:	c7 05 99 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f599],0x0        # 4250ac <fb_cursor_x>
  805b10:	00 00 00 
        }
        if(*s=='\n')continue;
  805b13:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805b17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b1a:	3c 0a                	cmp    al,0xa
  805b1c:	0f 84 ae 00 00 00    	je     805bd0 <print+0xfb>
        if(fb_cursor_y>=max_ch_nr_y){
  805b22:	8b 15 88 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f588]        # 4250b0 <fb_cursor_y>
  805b28:	8b 05 8a f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f58a]        # 4250b8 <max_ch_nr_y>
  805b2e:	39 c2                	cmp    edx,eax
  805b30:	72 3c                	jb     805b6e <print+0x99>
            for(int i=0;i<font_height*font_size;i++)
  805b32:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805b39:	eb 0e                	jmp    805b49 <print+0x74>
                scr_up();
  805b3b:	b8 00 00 00 00       	mov    eax,0x0
  805b40:	e8 f3 fe ff ff       	call   805a38 <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805b45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805b49:	8b 05 7d f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f57d]        # 4250cc <font_height>
  805b4f:	8b 15 73 42 00 00    	mov    edx,DWORD PTR [rip+0x4273]        # 809dc8 <font_size>
  805b55:	0f af d0             	imul   edx,eax
  805b58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b5b:	39 c2                	cmp    edx,eax
  805b5d:	77 dc                	ja     805b3b <print+0x66>
            fb_cursor_y=max_ch_nr_y-1;
  805b5f:	8b 05 53 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f553]        # 4250b8 <max_ch_nr_y>
  805b65:	83 e8 01             	sub    eax,0x1
  805b68:	89 05 42 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f542],eax        # 4250b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805b6e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805b72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b75:	0f be d0             	movsx  edx,al
  805b78:	8b 05 4a 42 00 00    	mov    eax,DWORD PTR [rip+0x424a]        # 809dc8 <font_size>
  805b7e:	8b 35 2c f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f52c]        # 4250b0 <fb_cursor_y>
  805b84:	8b 0d 42 f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f542]        # 4250cc <font_height>
  805b8a:	0f af ce             	imul   ecx,esi
  805b8d:	8b 35 35 42 00 00    	mov    esi,DWORD PTR [rip+0x4235]        # 809dc8 <font_size>
  805b93:	0f af ce             	imul   ecx,esi
  805b96:	41 89 c8             	mov    r8d,ecx
  805b99:	8b 35 0d f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f50d]        # 4250ac <fb_cursor_x>
  805b9f:	8b 0d 23 f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f523]        # 4250c8 <font_width>
  805ba5:	0f af ce             	imul   ecx,esi
  805ba8:	8b 35 1a 42 00 00    	mov    esi,DWORD PTR [rip+0x421a]        # 809dc8 <font_size>
  805bae:	0f af ce             	imul   ecx,esi
  805bb1:	89 cf                	mov    edi,ecx
  805bb3:	89 d1                	mov    ecx,edx
  805bb5:	89 c2                	mov    edx,eax
  805bb7:	44 89 c6             	mov    esi,r8d
  805bba:	e8 4b fd ff ff       	call   80590a <draw_letter>
        fb_cursor_x+=1;
  805bbf:	8b 05 e7 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4e7]        # 4250ac <fb_cursor_x>
  805bc5:	83 c0 01             	add    eax,0x1
  805bc8:	89 05 de f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f4de],eax        # 4250ac <fb_cursor_x>
  805bce:	eb 01                	jmp    805bd1 <print+0xfc>
        if(*s=='\n')continue;
  805bd0:	90                   	nop
    for(;*s;s++){
  805bd1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805bd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805bda:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805bdd:	84 c0                	test   al,al
  805bdf:	0f 85 05 ff ff ff    	jne    805aea <print+0x15>
    }
}
  805be5:	90                   	nop
  805be6:	90                   	nop
  805be7:	c9                   	leave  
  805be8:	c3                   	ret    

0000000000805be9 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805be9:	f3 0f 1e fa          	endbr64 
  805bed:	55                   	push   rbp
  805bee:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805bf1:	0f b6 05 15 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff15]        # 425b0d <k_shift>
  805bf8:	84 c0                	test   al,al
  805bfa:	0f 94 c0             	sete   al
  805bfd:	88 05 0a ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff0a],al        # 425b0d <k_shift>
}
  805c03:	90                   	nop
  805c04:	5d                   	pop    rbp
  805c05:	c3                   	ret    

0000000000805c06 <ctrl>:
void ctrl()
{
  805c06:	f3 0f 1e fa          	endbr64 
  805c0a:	55                   	push   rbp
  805c0b:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805c0e:	0f b6 05 f9 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fef9]        # 425b0e <k_ctrl>
  805c15:	84 c0                	test   al,al
  805c17:	0f 94 c0             	sete   al
  805c1a:	88 05 ee fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1feee],al        # 425b0e <k_ctrl>
}
  805c20:	90                   	nop
  805c21:	5d                   	pop    rbp
  805c22:	c3                   	ret    

0000000000805c23 <capslock>:
void capslock()
{
  805c23:	f3 0f 1e fa          	endbr64 
  805c27:	55                   	push   rbp
  805c28:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805c2b:	0f b6 05 dd fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fedd]        # 425b0f <k_capslock>
  805c32:	84 c0                	test   al,al
  805c34:	0f 94 c0             	sete   al
  805c37:	88 05 d2 fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fed2],al        # 425b0f <k_capslock>
}
  805c3d:	90                   	nop
  805c3e:	5d                   	pop    rbp
  805c3f:	c3                   	ret    

0000000000805c40 <to_ascii>:
char to_ascii(char scan_code)
{
  805c40:	f3 0f 1e fa          	endbr64 
  805c44:	55                   	push   rbp
  805c45:	48 89 e5             	mov    rbp,rsp
  805c48:	89 f8                	mov    eax,edi
  805c4a:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805c4d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805c54:	e9 c7 00 00 00       	jmp    805d20 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805c59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c5c:	48 63 d0             	movsxd rdx,eax
  805c5f:	48 89 d0             	mov    rax,rdx
  805c62:	48 c1 e0 02          	shl    rax,0x2
  805c66:	48 01 d0             	add    rax,rdx
  805c69:	48 05 e2 19 81 00    	add    rax,0x8119e2
  805c6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c72:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805c75:	0f 85 a1 00 00 00    	jne    805d1c <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805c7b:	0f b6 05 8d fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe8d]        # 425b0f <k_capslock>
  805c82:	84 c0                	test   al,al
  805c84:	74 55                	je     805cdb <to_ascii+0x9b>
  805c86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c89:	48 63 d0             	movsxd rdx,eax
  805c8c:	48 89 d0             	mov    rax,rdx
  805c8f:	48 c1 e0 02          	shl    rax,0x2
  805c93:	48 01 d0             	add    rax,rdx
  805c96:	48 05 e0 19 81 00    	add    rax,0x8119e0
  805c9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c9f:	3c 60                	cmp    al,0x60
  805ca1:	7e 38                	jle    805cdb <to_ascii+0x9b>
  805ca3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ca6:	48 63 d0             	movsxd rdx,eax
  805ca9:	48 89 d0             	mov    rax,rdx
  805cac:	48 c1 e0 02          	shl    rax,0x2
  805cb0:	48 01 d0             	add    rax,rdx
  805cb3:	48 05 e0 19 81 00    	add    rax,0x8119e0
  805cb9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805cbc:	3c 7a                	cmp    al,0x7a
  805cbe:	7f 1b                	jg     805cdb <to_ascii+0x9b>
  805cc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cc3:	48 63 d0             	movsxd rdx,eax
  805cc6:	48 89 d0             	mov    rax,rdx
  805cc9:	48 c1 e0 02          	shl    rax,0x2
  805ccd:	48 01 d0             	add    rax,rdx
  805cd0:	48 05 e1 19 81 00    	add    rax,0x8119e1
  805cd6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805cd9:	eb 54                	jmp    805d2f <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805cdb:	0f b6 05 2b fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe2b]        # 425b0d <k_shift>
  805ce2:	84 c0                	test   al,al
  805ce4:	74 1b                	je     805d01 <to_ascii+0xc1>
  805ce6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ce9:	48 63 d0             	movsxd rdx,eax
  805cec:	48 89 d0             	mov    rax,rdx
  805cef:	48 c1 e0 02          	shl    rax,0x2
  805cf3:	48 01 d0             	add    rax,rdx
  805cf6:	48 05 e1 19 81 00    	add    rax,0x8119e1
  805cfc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805cff:	eb 2e                	jmp    805d2f <to_ascii+0xef>
            else return key_map[i].ascii;
  805d01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d04:	48 63 d0             	movsxd rdx,eax
  805d07:	48 89 d0             	mov    rax,rdx
  805d0a:	48 c1 e0 02          	shl    rax,0x2
  805d0e:	48 01 d0             	add    rax,rdx
  805d11:	48 05 e0 19 81 00    	add    rax,0x8119e0
  805d17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d1a:	eb 13                	jmp    805d2f <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805d1c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d20:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805d24:	0f 8e 2f ff ff ff    	jle    805c59 <to_ascii+0x19>
        }

    return '\0';
  805d2a:	b8 00 00 00 00       	mov    eax,0x0
}
  805d2f:	5d                   	pop    rbp
  805d30:	c3                   	ret    

0000000000805d31 <init_kb>:
int init_kb()
{
  805d31:	f3 0f 1e fa          	endbr64 
  805d35:	55                   	push   rbp
  805d36:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805d39:	bf 20 19 81 00       	mov    edi,0x811920
  805d3e:	e8 d5 cb ff ff       	call   802918 <reg_device>
    reg_driver(&drv_keyboard);
  805d43:	bf 80 18 81 00       	mov    edi,0x811880
  805d48:	e8 b3 ce ff ff       	call   802c00 <reg_driver>
}
  805d4d:	90                   	nop
  805d4e:	5d                   	pop    rbp
  805d4f:	c3                   	ret    

0000000000805d50 <key_proc>:
int key_proc()
{
  805d50:	f3 0f 1e fa          	endbr64 
  805d54:	55                   	push   rbp
  805d55:	48 89 e5             	mov    rbp,rsp
  805d58:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805d5c:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  805d60:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805d64:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805d68:	bf 60 00 00 00       	mov    edi,0x60
  805d6d:	e8 d2 eb ff ff       	call   804944 <inb>
  805d72:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    ch= to_ascii(scan1);
  805d75:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805d79:	0f be c0             	movsx  eax,al
  805d7c:	89 c7                	mov    edi,eax
  805d7e:	e8 bd fe ff ff       	call   805c40 <to_ascii>
  805d83:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805d86:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  805d8a:	74 06                	je     805d92 <key_proc+0x42>
  805d8c:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  805d90:	75 1e                	jne    805db0 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805d92:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805d96:	0f be c0             	movsx  eax,al
  805d99:	89 c7                	mov    edi,eax
  805d9b:	e8 a0 fe ff ff       	call   805c40 <to_ascii>
  805da0:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
        scan2=inb(0x60);
  805da3:	bf 60 00 00 00       	mov    edi,0x60
  805da8:	e8 97 eb ff ff       	call   804944 <inb>
  805dad:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805db0:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805db4:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805db7:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805dbb:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805dbe:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805dc2:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
  805dc5:	8b 15 11 40 00 00    	mov    edx,DWORD PTR [rip+0x4011]        # 809ddc <key_bufq+0xc>
  805dcb:	8b 05 07 40 00 00    	mov    eax,DWORD PTR [rip+0x4007]        # 809dd8 <key_bufq+0x8>
  805dd1:	39 c2                	cmp    edx,eax
  805dd3:	74 43                	je     805e18 <key_proc+0xc8>
    {
        ENQUEUE(key_bufq,tmpc)
  805dd5:	48 8b 0d f4 3f 00 00 	mov    rcx,QWORD PTR [rip+0x3ff4]        # 809dd0 <key_bufq>
  805ddc:	8b 05 fa 3f 00 00    	mov    eax,DWORD PTR [rip+0x3ffa]        # 809ddc <key_bufq+0xc>
  805de2:	48 63 d0             	movsxd rdx,eax
  805de5:	48 89 d0             	mov    rax,rdx
  805de8:	48 c1 e0 02          	shl    rax,0x2
  805dec:	48 01 d0             	add    rax,rdx
  805def:	48 01 c8             	add    rax,rcx
  805df2:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805df5:	89 10                	mov    DWORD PTR [rax],edx
  805df7:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805dfb:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805dfe:	8b 05 d8 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fd8]        # 809ddc <key_bufq+0xc>
  805e04:	83 c0 01             	add    eax,0x1
  805e07:	8b 0d d3 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3fd3]        # 809de0 <key_bufq+0x10>
  805e0d:	99                   	cdq    
  805e0e:	f7 f9                	idiv   ecx
  805e10:	89 d0                	mov    eax,edx
  805e12:	89 05 c4 3f 00 00    	mov    DWORD PTR [rip+0x3fc4],eax        # 809ddc <key_bufq+0xc>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);
    }*/
    eoi();
  805e18:	b8 00 00 00 00       	mov    eax,0x0
  805e1d:	e8 3d eb ff ff       	call   80495f <eoi>
    asm volatile("leave \r\n iret");
  805e22:	c9                   	leave  
  805e23:	cf                   	iret   
}
  805e24:	90                   	nop
  805e25:	c9                   	leave  
  805e26:	c3                   	ret    

0000000000805e27 <sys_getkbc>:

char sys_getkbc()
{
  805e27:	f3 0f 1e fa          	endbr64 
  805e2b:	55                   	push   rbp
  805e2c:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805e2f:	8b 15 a7 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fa7]        # 809ddc <key_bufq+0xc>
  805e35:	8b 05 9d 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f9d]        # 809dd8 <key_bufq+0x8>
  805e3b:	39 c2                	cmp    edx,eax
  805e3d:	75 07                	jne    805e46 <sys_getkbc+0x1f>
  805e3f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805e44:	eb 43                	jmp    805e89 <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805e46:	8b 05 90 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f90]        # 809ddc <key_bufq+0xc>
  805e4c:	48 63 d0             	movsxd rdx,eax
  805e4f:	48 89 d0             	mov    rax,rdx
  805e52:	48 c1 e0 02          	shl    rax,0x2
  805e56:	48 01 d0             	add    rax,rdx
  805e59:	48 05 00 51 42 00    	add    rax,0x425100
  805e5f:	8b 10                	mov    edx,DWORD PTR [rax]
  805e61:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805e64:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805e68:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805e6b:	8b 05 6b 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f6b]        # 809ddc <key_bufq+0xc>
  805e71:	83 c0 01             	add    eax,0x1
  805e74:	8b 0d 66 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f66]        # 809de0 <key_bufq+0x10>
  805e7a:	99                   	cdq    
  805e7b:	f7 f9                	idiv   ecx
  805e7d:	89 d0                	mov    eax,edx
  805e7f:	89 05 57 3f 00 00    	mov    DWORD PTR [rip+0x3f57],eax        # 809ddc <key_bufq+0xc>
    return c.ascii;
  805e85:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  805e89:	5d                   	pop    rbp
  805e8a:	c3                   	ret    

0000000000805e8b <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805e8b:	f3 0f 1e fa          	endbr64 
  805e8f:	55                   	push   rbp
  805e90:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805e93:	b8 00 00 00 00       	mov    eax,0x0
  805e98:	e8 8d 09 00 00       	call   80682a <hd_iterate>
    return 0;
  805e9d:	b8 00 00 00 00       	mov    eax,0x0
}
  805ea2:	5d                   	pop    rbp
  805ea3:	c3                   	ret    

0000000000805ea4 <disk_int_handler_c>:

int disk_int_handler_c()
{
  805ea4:	f3 0f 1e fa          	endbr64 
  805ea8:	55                   	push   rbp
  805ea9:	48 89 e5             	mov    rbp,rsp
  805eac:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  805eb0:	48 8b 05 69 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22969]        # 428820 <running_req>
  805eb7:	48 85 c0             	test   rax,rax
  805eba:	75 0a                	jne    805ec6 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  805ebc:	b8 01 00 00 00       	mov    eax,0x1
  805ec1:	e9 a3 01 00 00       	jmp    806069 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  805ec6:	48 8b 05 53 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22953]        # 428820 <running_req>
  805ecd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805ed1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  805ed5:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805edc:	48 8b 05 3d 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2293d]        # 428820 <running_req>
  805ee3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805ee6:	83 f8 02             	cmp    eax,0x2
  805ee9:	74 0f                	je     805efa <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  805eeb:	48 8b 05 2e 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2292e]        # 428820 <running_req>
  805ef2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805ef5:	83 f8 03             	cmp    eax,0x3
  805ef8:	75 07                	jne    805f01 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  805efa:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  805f01:	48 8b 05 18 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22918]        # 428820 <running_req>
  805f08:	8b 00                	mov    eax,DWORD PTR [rax]
  805f0a:	85 c0                	test   eax,eax
  805f0c:	75 42                	jne    805f50 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  805f0e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805f15:	eb 22                	jmp    805f39 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  805f17:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f1a:	0f b7 c0             	movzx  eax,ax
  805f1d:	89 c7                	mov    edi,eax
  805f1f:	e8 2d ea ff ff       	call   804951 <inw>
  805f24:	89 c2                	mov    edx,eax
  805f26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f2a:	48 8d 48 02          	lea    rcx,[rax+0x2]
  805f2e:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  805f32:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  805f35:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805f39:	48 8b 05 e0 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228e0]        # 428820 <running_req>
  805f40:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805f43:	c1 e0 08             	shl    eax,0x8
  805f46:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  805f49:	7c cc                	jl     805f17 <disk_int_handler_c+0x73>
  805f4b:	e9 ca 00 00 00       	jmp    80601a <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  805f50:	48 8b 05 c9 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228c9]        # 428820 <running_req>
  805f57:	8b 00                	mov    eax,DWORD PTR [rax]
  805f59:	83 f8 01             	cmp    eax,0x1
  805f5c:	75 42                	jne    805fa0 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  805f5e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805f65:	eb 25                	jmp    805f8c <disk_int_handler_c+0xe8>
            outw(port,*p++);
  805f67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f6b:	48 8d 50 02          	lea    rdx,[rax+0x2]
  805f6f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  805f73:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805f76:	0f b7 d0             	movzx  edx,ax
  805f79:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f7c:	0f b7 c0             	movzx  eax,ax
  805f7f:	89 d6                	mov    esi,edx
  805f81:	89 c7                	mov    edi,eax
  805f83:	e8 aa e9 ff ff       	call   804932 <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  805f88:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805f8c:	48 8b 05 8d 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2288d]        # 428820 <running_req>
  805f93:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805f96:	c1 e0 08             	shl    eax,0x8
  805f99:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f9c:	7c c9                	jl     805f67 <disk_int_handler_c+0xc3>
  805f9e:	eb 7a                	jmp    80601a <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  805fa0:	48 8b 05 79 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22879]        # 428820 <running_req>
  805fa7:	8b 00                	mov    eax,DWORD PTR [rax]
  805fa9:	83 f8 02             	cmp    eax,0x2
  805fac:	75 34                	jne    805fe2 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  805fae:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fb1:	83 c0 07             	add    eax,0x7
  805fb4:	0f b6 c0             	movzx  eax,al
  805fb7:	89 c7                	mov    edi,eax
  805fb9:	e8 86 e9 ff ff       	call   804944 <inb>
  805fbe:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  805fc1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fc4:	0f b7 c0             	movzx  eax,ax
  805fc7:	89 c7                	mov    edi,eax
  805fc9:	e8 83 e9 ff ff       	call   804951 <inw>
  805fce:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  805fd2:	48 8b 05 47 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22847]        # 428820 <running_req>
  805fd9:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  805fe0:	eb 38                	jmp    80601a <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  805fe2:	48 8b 05 37 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22837]        # 428820 <running_req>
  805fe9:	8b 00                	mov    eax,DWORD PTR [rax]
  805feb:	83 f8 03             	cmp    eax,0x3
  805fee:	75 2a                	jne    80601a <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  805ff0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805ff3:	83 c0 07             	add    eax,0x7
  805ff6:	0f b6 c0             	movzx  eax,al
  805ff9:	89 c7                	mov    edi,eax
  805ffb:	e8 44 e9 ff ff       	call   804944 <inb>
  806000:	0f b6 c0             	movzx  eax,al
  806003:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806006:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806009:	89 c6                	mov    esi,eax
  80600b:	bf b6 1b 81 00       	mov    edi,0x811bb6
  806010:	b8 00 00 00 00       	mov    eax,0x0
  806015:	e8 29 ad ff ff       	call   800d43 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  80601a:	48 8b 05 ff 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227ff]        # 428820 <running_req>
  806021:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806028:	48 8b 05 f1 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227f1]        # 428820 <running_req>
  80602f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806033:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80603a:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  80603d:	48 8b 05 e4 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227e4]        # 428828 <running_devman_req>
  806044:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  80604b:	00 00 00 
    running_devman_req=NULL;
  80604e:	48 c7 05 cf 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc227cf],0x0        # 428828 <running_devman_req>
  806055:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806059:	48 c7 05 bc 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc227bc],0x0        # 428820 <running_req>
  806060:	00 00 00 00 
    return 0;
  806064:	b8 00 00 00 00       	mov    eax,0x0
}
  806069:	c9                   	leave  
  80606a:	c3                   	ret    

000000000080606b <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  80606b:	f3 0f 1e fa          	endbr64 
  80606f:	55                   	push   rbp
  806070:	48 89 e5             	mov    rbp,rsp
  806073:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806076:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806079:	48 63 d0             	movsxd rdx,eax
  80607c:	48 89 d0             	mov    rax,rdx
  80607f:	48 01 c0             	add    rax,rax
  806082:	48 01 d0             	add    rax,rdx
  806085:	48 c1 e0 04          	shl    rax,0x4
  806089:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  80608f:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806091:	5d                   	pop    rbp
  806092:	c3                   	ret    

0000000000806093 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806093:	f3 0f 1e fa          	endbr64 
  806097:	55                   	push   rbp
  806098:	48 89 e5             	mov    rbp,rsp
  80609b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80609e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8060a1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8060a4:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8060a7:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8060ab:	8b 05 a3 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227a3]        # 428854 <tail>
  8060b1:	83 c0 01             	add    eax,0x1
  8060b4:	48 63 d0             	movsxd rdx,eax
  8060b7:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8060be:	48 c1 ea 20          	shr    rdx,0x20
  8060c2:	01 c2                	add    edx,eax
  8060c4:	c1 fa 07             	sar    edx,0x7
  8060c7:	89 c1                	mov    ecx,eax
  8060c9:	c1 f9 1f             	sar    ecx,0x1f
  8060cc:	29 ca                	sub    edx,ecx
  8060ce:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8060d4:	29 c8                	sub    eax,ecx
  8060d6:	89 c2                	mov    edx,eax
  8060d8:	8b 05 72 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22772]        # 428850 <head>
  8060de:	39 c2                	cmp    edx,eax
  8060e0:	75 0a                	jne    8060ec <request+0x59>
    {
        return -1;
  8060e2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8060e7:	e9 0d 01 00 00       	jmp    8061f9 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8060ec:	8b 05 62 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22762]        # 428854 <tail>
  8060f2:	48 63 d0             	movsxd rdx,eax
  8060f5:	48 89 d0             	mov    rax,rdx
  8060f8:	48 01 c0             	add    rax,rax
  8060fb:	48 01 d0             	add    rax,rdx
  8060fe:	48 c1 e0 04          	shl    rax,0x4
  806102:	48 8d 90 24 5b 42 00 	lea    rdx,[rax+0x425b24]
  806109:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80610c:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  80610e:	8b 05 40 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22740]        # 428854 <tail>
  806114:	48 63 d0             	movsxd rdx,eax
  806117:	48 89 d0             	mov    rax,rdx
  80611a:	48 01 c0             	add    rax,rax
  80611d:	48 01 d0             	add    rax,rdx
  806120:	48 c1 e0 04          	shl    rax,0x4
  806124:	48 8d 90 20 5b 42 00 	lea    rdx,[rax+0x425b20]
  80612b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80612e:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806130:	8b 05 1e 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2271e]        # 428854 <tail>
  806136:	48 63 d0             	movsxd rdx,eax
  806139:	48 89 d0             	mov    rax,rdx
  80613c:	48 01 c0             	add    rax,rax
  80613f:	48 01 d0             	add    rax,rdx
  806142:	48 c1 e0 04          	shl    rax,0x4
  806146:	48 8d 90 28 5b 42 00 	lea    rdx,[rax+0x425b28]
  80614d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806150:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806152:	8b 05 fc 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226fc]        # 428854 <tail>
  806158:	48 63 d0             	movsxd rdx,eax
  80615b:	48 89 d0             	mov    rax,rdx
  80615e:	48 01 c0             	add    rax,rax
  806161:	48 01 d0             	add    rax,rdx
  806164:	48 c1 e0 04          	shl    rax,0x4
  806168:	48 8d 90 2c 5b 42 00 	lea    rdx,[rax+0x425b2c]
  80616f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806172:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806174:	8b 05 da 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226da]        # 428854 <tail>
  80617a:	48 63 d0             	movsxd rdx,eax
  80617d:	48 89 d0             	mov    rax,rdx
  806180:	48 01 c0             	add    rax,rax
  806183:	48 01 d0             	add    rax,rdx
  806186:	48 c1 e0 04          	shl    rax,0x4
  80618a:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806190:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806196:	8b 05 b8 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226b8]        # 428854 <tail>
  80619c:	48 63 d0             	movsxd rdx,eax
  80619f:	48 89 d0             	mov    rax,rdx
  8061a2:	48 01 c0             	add    rax,rax
  8061a5:	48 01 d0             	add    rax,rdx
  8061a8:	48 c1 e0 04          	shl    rax,0x4
  8061ac:	48 8d 90 30 5b 42 00 	lea    rdx,[rax+0x425b30]
  8061b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8061b7:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8061ba:	8b 05 94 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22694]        # 428854 <tail>
  8061c0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8061c3:	8b 05 8b 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2268b]        # 428854 <tail>
  8061c9:	8d 50 01             	lea    edx,[rax+0x1]
  8061cc:	48 63 c2             	movsxd rax,edx
  8061cf:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8061d6:	48 c1 e8 20          	shr    rax,0x20
  8061da:	01 d0                	add    eax,edx
  8061dc:	c1 f8 07             	sar    eax,0x7
  8061df:	89 d1                	mov    ecx,edx
  8061e1:	c1 f9 1f             	sar    ecx,0x1f
  8061e4:	29 c8                	sub    eax,ecx
  8061e6:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8061ec:	89 d0                	mov    eax,edx
  8061ee:	29 c8                	sub    eax,ecx
  8061f0:	89 05 5e 26 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2265e],eax        # 428854 <tail>
    return r;
  8061f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8061f9:	5d                   	pop    rbp
  8061fa:	c3                   	ret    

00000000008061fb <execute_request>:
int execute_request(){
  8061fb:	f3 0f 1e fa          	endbr64 
  8061ff:	55                   	push   rbp
  806200:	48 89 e5             	mov    rbp,rsp
  806203:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806207:	48 8b 05 12 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22612]        # 428820 <running_req>
  80620e:	48 85 c0             	test   rax,rax
  806211:	74 6a                	je     80627d <execute_request+0x82>
    {
        running_req->time++;
  806213:	48 8b 05 06 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22606]        # 428820 <running_req>
  80621a:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80621d:	83 c2 01             	add    edx,0x1
  806220:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806223:	48 8b 05 f6 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225f6]        # 428820 <running_req>
  80622a:	8b 00                	mov    eax,DWORD PTR [rax]
  80622c:	83 f8 02             	cmp    eax,0x2
  80622f:	74 0a                	je     80623b <execute_request+0x40>
            return 2;
  806231:	b8 02 00 00 00       	mov    eax,0x2
  806236:	e9 b4 01 00 00       	jmp    8063ef <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  80623b:	48 8b 05 de 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225de]        # 428820 <running_req>
  806242:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806245:	83 f8 0a             	cmp    eax,0xa
  806248:	7e 29                	jle    806273 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80624a:	48 8b 05 cf 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225cf]        # 428820 <running_req>
  806251:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806258:	48 8b 05 c1 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225c1]        # 428820 <running_req>
  80625f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806266:	48 c7 05 af 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc225af],0x0        # 428820 <running_req>
  80626d:	00 00 00 00 
  806271:	eb 0a                	jmp    80627d <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806273:	b8 02 00 00 00       	mov    eax,0x2
  806278:	e9 72 01 00 00       	jmp    8063ef <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  80627d:	8b 15 cd 25 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc225cd]        # 428850 <head>
  806283:	8b 05 cb 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225cb]        # 428854 <tail>
  806289:	39 c2                	cmp    edx,eax
  80628b:	75 0a                	jne    806297 <execute_request+0x9c>
  80628d:	b8 01 00 00 00       	mov    eax,0x1
  806292:	e9 58 01 00 00       	jmp    8063ef <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806297:	8b 05 b3 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225b3]        # 428850 <head>
  80629d:	48 63 d0             	movsxd rdx,eax
  8062a0:	48 89 d0             	mov    rax,rdx
  8062a3:	48 01 c0             	add    rax,rax
  8062a6:	48 01 d0             	add    rax,rdx
  8062a9:	48 c1 e0 04          	shl    rax,0x4
  8062ad:	48 05 20 5b 42 00    	add    rax,0x425b20
  8062b3:	48 89 05 66 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22566],rax        # 428820 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8062ba:	8b 05 90 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22590]        # 428850 <head>
  8062c0:	8d 50 01             	lea    edx,[rax+0x1]
  8062c3:	48 63 c2             	movsxd rax,edx
  8062c6:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8062cd:	48 c1 e8 20          	shr    rax,0x20
  8062d1:	01 d0                	add    eax,edx
  8062d3:	c1 f8 07             	sar    eax,0x7
  8062d6:	89 d1                	mov    ecx,edx
  8062d8:	c1 f9 1f             	sar    ecx,0x1f
  8062db:	29 c8                	sub    eax,ecx
  8062dd:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8062e3:	89 d0                	mov    eax,edx
  8062e5:	29 c8                	sub    eax,ecx
  8062e7:	89 05 63 25 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22563],eax        # 428850 <head>
    running_req->stat=REQ_STAT_WORKING;
  8062ed:	48 8b 05 2c 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2252c]        # 428820 <running_req>
  8062f4:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8062fb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806302:	48 8b 05 17 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22517]        # 428820 <running_req>
  806309:	8b 00                	mov    eax,DWORD PTR [rax]
  80630b:	83 f8 03             	cmp    eax,0x3
  80630e:	0f 84 ad 00 00 00    	je     8063c1 <execute_request+0x1c6>
  806314:	83 f8 03             	cmp    eax,0x3
  806317:	0f 8f bf 00 00 00    	jg     8063dc <execute_request+0x1e1>
  80631d:	83 f8 02             	cmp    eax,0x2
  806320:	0f 84 85 00 00 00    	je     8063ab <execute_request+0x1b0>
  806326:	83 f8 02             	cmp    eax,0x2
  806329:	0f 8f ad 00 00 00    	jg     8063dc <execute_request+0x1e1>
  80632f:	85 c0                	test   eax,eax
  806331:	74 0a                	je     80633d <execute_request+0x142>
  806333:	83 f8 01             	cmp    eax,0x1
  806336:	74 3c                	je     806374 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806338:	e9 9f 00 00 00       	jmp    8063dc <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  80633d:	48 8b 05 dc 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224dc]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  806344:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806348:	48 8b 05 d1 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224d1]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  80634f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806352:	48 8b 05 c7 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c7]        # 428820 <running_req>
  806359:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80635c:	89 c6                	mov    esi,eax
  80635e:	48 8b 05 bb 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224bb]        # 428820 <running_req>
  806365:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806368:	89 c7                	mov    edi,eax
  80636a:	e8 a7 00 00 00       	call   806416 <async_read_disk>
  80636f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806372:	eb 69                	jmp    8063dd <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806374:	48 8b 05 a5 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224a5]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  80637b:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  80637f:	48 8b 05 9a 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2249a]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  806386:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806389:	48 8b 05 90 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22490]        # 428820 <running_req>
  806390:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806393:	89 c6                	mov    esi,eax
  806395:	48 8b 05 84 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22484]        # 428820 <running_req>
  80639c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80639f:	89 c7                	mov    edi,eax
  8063a1:	e8 88 01 00 00       	call   80652e <async_write_disk>
  8063a6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8063a9:	eb 32                	jmp    8063dd <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8063ab:	48 8b 05 6e 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2246e]        # 428820 <running_req>
  8063b2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8063b5:	89 c7                	mov    edi,eax
  8063b7:	e8 77 06 00 00       	call   806a33 <async_check_disk>
  8063bc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8063bf:	eb 1c                	jmp    8063dd <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8063c1:	48 8b 05 58 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22458]        # 428820 <running_req>
  8063c8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8063cb:	89 c7                	mov    edi,eax
  8063cd:	b8 00 00 00 00       	mov    eax,0x0
  8063d2:	e8 1a 00 00 00       	call   8063f1 <async_reset_disk>
  8063d7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8063da:	eb 01                	jmp    8063dd <execute_request+0x1e2>
        break;
  8063dc:	90                   	nop
    }
    if(r==-1)return -1;
  8063dd:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8063e1:	75 07                	jne    8063ea <execute_request+0x1ef>
  8063e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8063e8:	eb 05                	jmp    8063ef <execute_request+0x1f4>
    return 0;
  8063ea:	b8 00 00 00 00       	mov    eax,0x0
}
  8063ef:	c9                   	leave  
  8063f0:	c3                   	ret    

00000000008063f1 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8063f1:	f3 0f 1e fa          	endbr64 
  8063f5:	55                   	push   rbp
  8063f6:	48 89 e5             	mov    rbp,rsp
  8063f9:	48 83 ec 10          	sub    rsp,0x10
  8063fd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806400:	be 0c 00 00 00       	mov    esi,0xc
  806405:	bf f6 03 00 00       	mov    edi,0x3f6
  80640a:	e8 11 e5 ff ff       	call   804920 <outb>
    return 0;
  80640f:	b8 00 00 00 00       	mov    eax,0x0
}
  806414:	c9                   	leave  
  806415:	c3                   	ret    

0000000000806416 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806416:	f3 0f 1e fa          	endbr64 
  80641a:	55                   	push   rbp
  80641b:	48 89 e5             	mov    rbp,rsp
  80641e:	48 83 ec 30          	sub    rsp,0x30
  806422:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806425:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806428:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80642b:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80642f:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806435:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80643c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806440:	74 06                	je     806448 <async_read_disk+0x32>
  806442:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806446:	75 06                	jne    80644e <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806448:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80644e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806452:	74 06                	je     80645a <async_read_disk+0x44>
  806454:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806458:	75 07                	jne    806461 <async_read_disk+0x4b>
        slave_disk=1;
  80645a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806461:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806464:	0f b6 d0             	movzx  edx,al
  806467:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80646b:	83 c0 02             	add    eax,0x2
  80646e:	0f b7 c0             	movzx  eax,ax
  806471:	89 d6                	mov    esi,edx
  806473:	89 c7                	mov    edi,eax
  806475:	e8 a6 e4 ff ff       	call   804920 <outb>
    outb(port+3,lba&0xff);
  80647a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80647d:	0f b6 d0             	movzx  edx,al
  806480:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806484:	83 c0 03             	add    eax,0x3
  806487:	0f b7 c0             	movzx  eax,ax
  80648a:	89 d6                	mov    esi,edx
  80648c:	89 c7                	mov    edi,eax
  80648e:	e8 8d e4 ff ff       	call   804920 <outb>
    outb(port+4,(lba>>8)&0xff);
  806493:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806496:	c1 e8 08             	shr    eax,0x8
  806499:	0f b6 d0             	movzx  edx,al
  80649c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064a0:	83 c0 04             	add    eax,0x4
  8064a3:	0f b7 c0             	movzx  eax,ax
  8064a6:	89 d6                	mov    esi,edx
  8064a8:	89 c7                	mov    edi,eax
  8064aa:	e8 71 e4 ff ff       	call   804920 <outb>
    outb(port+5,(lba>>16)&0xff);
  8064af:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064b2:	c1 e8 10             	shr    eax,0x10
  8064b5:	0f b6 d0             	movzx  edx,al
  8064b8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064bc:	83 c0 05             	add    eax,0x5
  8064bf:	0f b7 c0             	movzx  eax,ax
  8064c2:	89 d6                	mov    esi,edx
  8064c4:	89 c7                	mov    edi,eax
  8064c6:	e8 55 e4 ff ff       	call   804920 <outb>
    char drv=slave_disk?0x10:0;
  8064cb:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8064cf:	74 07                	je     8064d8 <async_read_disk+0xc2>
  8064d1:	b8 10 00 00 00       	mov    eax,0x10
  8064d6:	eb 05                	jmp    8064dd <async_read_disk+0xc7>
  8064d8:	b8 00 00 00 00       	mov    eax,0x0
  8064dd:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8064e0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064e3:	c1 e8 18             	shr    eax,0x18
  8064e6:	83 e0 0f             	and    eax,0xf
  8064e9:	89 c2                	mov    edx,eax
  8064eb:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8064ef:	09 d0                	or     eax,edx
  8064f1:	83 c8 e0             	or     eax,0xffffffe0
  8064f4:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8064f7:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8064fb:	0f b6 d0             	movzx  edx,al
  8064fe:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806502:	83 c0 06             	add    eax,0x6
  806505:	0f b7 c0             	movzx  eax,ax
  806508:	89 d6                	mov    esi,edx
  80650a:	89 c7                	mov    edi,eax
  80650c:	e8 0f e4 ff ff       	call   804920 <outb>
    outb(port+7,DISK_CMD_READ);
  806511:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806515:	83 c0 07             	add    eax,0x7
  806518:	0f b7 c0             	movzx  eax,ax
  80651b:	be 20 00 00 00       	mov    esi,0x20
  806520:	89 c7                	mov    edi,eax
  806522:	e8 f9 e3 ff ff       	call   804920 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806527:	b8 00 00 00 00       	mov    eax,0x0
}
  80652c:	c9                   	leave  
  80652d:	c3                   	ret    

000000000080652e <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  80652e:	f3 0f 1e fa          	endbr64 
  806532:	55                   	push   rbp
  806533:	48 89 e5             	mov    rbp,rsp
  806536:	48 83 ec 30          	sub    rsp,0x30
  80653a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80653d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806540:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806543:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806547:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80654d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806554:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806558:	74 06                	je     806560 <async_write_disk+0x32>
  80655a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80655e:	75 06                	jne    806566 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806560:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806566:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80656a:	74 06                	je     806572 <async_write_disk+0x44>
  80656c:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806570:	75 07                	jne    806579 <async_write_disk+0x4b>
        slave_disk=1;
  806572:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806579:	bf f7 00 00 00       	mov    edi,0xf7
  80657e:	e8 c1 e3 ff ff       	call   804944 <inb>
  806583:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806586:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80658a:	83 e0 01             	and    eax,0x1
  80658d:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806590:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806594:	74 0a                	je     8065a0 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806596:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80659b:	e9 d5 00 00 00       	jmp    806675 <async_write_disk+0x147>
        }
        t&=0x88;
  8065a0:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8065a4:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8065a8:	74 02                	je     8065ac <async_write_disk+0x7e>
    {
  8065aa:	eb cd                	jmp    806579 <async_write_disk+0x4b>
        if(t==0x8)break;
  8065ac:	90                   	nop
    }
    outb(port+2,sec_n);
  8065ad:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8065b0:	0f b6 d0             	movzx  edx,al
  8065b3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065b7:	83 c0 02             	add    eax,0x2
  8065ba:	0f b7 c0             	movzx  eax,ax
  8065bd:	89 d6                	mov    esi,edx
  8065bf:	89 c7                	mov    edi,eax
  8065c1:	e8 5a e3 ff ff       	call   804920 <outb>
    outb(port+3,lba&0xff);
  8065c6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065c9:	0f b6 d0             	movzx  edx,al
  8065cc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065d0:	83 c0 03             	add    eax,0x3
  8065d3:	0f b7 c0             	movzx  eax,ax
  8065d6:	89 d6                	mov    esi,edx
  8065d8:	89 c7                	mov    edi,eax
  8065da:	e8 41 e3 ff ff       	call   804920 <outb>
    outb(port+4,(lba>>8)&0xff);
  8065df:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065e2:	c1 e8 08             	shr    eax,0x8
  8065e5:	0f b6 d0             	movzx  edx,al
  8065e8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065ec:	83 c0 04             	add    eax,0x4
  8065ef:	0f b7 c0             	movzx  eax,ax
  8065f2:	89 d6                	mov    esi,edx
  8065f4:	89 c7                	mov    edi,eax
  8065f6:	e8 25 e3 ff ff       	call   804920 <outb>
    outb(port+5,(lba>>16)&0xff);
  8065fb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065fe:	c1 e8 10             	shr    eax,0x10
  806601:	0f b6 d0             	movzx  edx,al
  806604:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806608:	83 c0 05             	add    eax,0x5
  80660b:	0f b7 c0             	movzx  eax,ax
  80660e:	89 d6                	mov    esi,edx
  806610:	89 c7                	mov    edi,eax
  806612:	e8 09 e3 ff ff       	call   804920 <outb>
    char drv=slave_disk?0x10:0;
  806617:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  80661b:	74 07                	je     806624 <async_write_disk+0xf6>
  80661d:	b8 10 00 00 00       	mov    eax,0x10
  806622:	eb 05                	jmp    806629 <async_write_disk+0xfb>
  806624:	b8 00 00 00 00       	mov    eax,0x0
  806629:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80662c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80662f:	c1 e8 18             	shr    eax,0x18
  806632:	83 e0 0f             	and    eax,0xf
  806635:	89 c2                	mov    edx,eax
  806637:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  80663b:	09 d0                	or     eax,edx
  80663d:	83 c8 e0             	or     eax,0xffffffe0
  806640:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806643:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806647:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80664b:	83 c0 06             	add    eax,0x6
  80664e:	0f b7 c0             	movzx  eax,ax
  806651:	89 d6                	mov    esi,edx
  806653:	89 c7                	mov    edi,eax
  806655:	e8 c6 e2 ff ff       	call   804920 <outb>
    outb(port+7,DISK_CMD_WRITE);
  80665a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80665e:	83 c0 07             	add    eax,0x7
  806661:	0f b7 c0             	movzx  eax,ax
  806664:	be 30 00 00 00       	mov    esi,0x30
  806669:	89 c7                	mov    edi,eax
  80666b:	e8 b0 e2 ff ff       	call   804920 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806670:	b8 00 00 00 00       	mov    eax,0x0
}
  806675:	c9                   	leave  
  806676:	c3                   	ret    

0000000000806677 <read_disk>:
int read_disk(driver_args* args)
{
  806677:	f3 0f 1e fa          	endbr64 
  80667b:	55                   	push   rbp
  80667c:	48 89 e5             	mov    rbp,rsp
  80667f:	48 83 ec 20          	sub    rsp,0x20
  806683:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806687:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80668b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80668e:	48 98                	cdqe   
  806690:	48 89 c2             	mov    rdx,rax
  806693:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806697:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80669a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80669e:	8b 00                	mov    eax,DWORD PTR [rax]
  8066a0:	89 ce                	mov    esi,ecx
  8066a2:	89 c7                	mov    edi,eax
  8066a4:	e8 72 05 00 00       	call   806c1b <read_disk_asm>
  8066a9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8066ac:	48 8b 05 6d 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2216d]        # 428820 <running_req>
  8066b3:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8066ba:	48 8b 05 5f 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2215f]        # 428820 <running_req>
  8066c1:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8066c5:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8066cc:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8066cf:	48 c7 05 46 21 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22146],0x0        # 428820 <running_req>
  8066d6:	00 00 00 00 
    return ret;
  8066da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8066dd:	c9                   	leave  
  8066de:	c3                   	ret    

00000000008066df <write_disk>:
int write_disk(driver_args* args)
{
  8066df:	f3 0f 1e fa          	endbr64 
  8066e3:	55                   	push   rbp
  8066e4:	48 89 e5             	mov    rbp,rsp
  8066e7:	48 83 ec 20          	sub    rsp,0x20
  8066eb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8066ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8066f3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8066f6:	48 98                	cdqe   
  8066f8:	48 89 c2             	mov    rdx,rax
  8066fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8066ff:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806702:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806706:	8b 00                	mov    eax,DWORD PTR [rax]
  806708:	89 ce                	mov    esi,ecx
  80670a:	89 c7                	mov    edi,eax
  80670c:	e8 8a 05 00 00       	call   806c9b <write_disk_asm>
  806711:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806714:	48 8b 05 05 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22105]        # 428820 <running_req>
  80671b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806722:	48 8b 05 f7 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220f7]        # 428820 <running_req>
  806729:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80672d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806734:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806737:	48 c7 05 de 20 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc220de],0x0        # 428820 <running_req>
  80673e:	00 00 00 00 
    return ret;
  806742:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806745:	c9                   	leave  
  806746:	c3                   	ret    

0000000000806747 <chk_result>:
int chk_result(int r)
{
  806747:	f3 0f 1e fa          	endbr64 
  80674b:	55                   	push   rbp
  80674c:	48 89 e5             	mov    rbp,rsp
  80674f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806752:	90                   	nop
  806753:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806756:	48 63 d0             	movsxd rdx,eax
  806759:	48 89 d0             	mov    rax,rdx
  80675c:	48 01 c0             	add    rax,rax
  80675f:	48 01 d0             	add    rax,rdx
  806762:	48 c1 e0 04          	shl    rax,0x4
  806766:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  80676c:	8b 00                	mov    eax,DWORD PTR [rax]
  80676e:	83 f8 03             	cmp    eax,0x3
  806771:	75 e0                	jne    806753 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806773:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806776:	48 63 d0             	movsxd rdx,eax
  806779:	48 89 d0             	mov    rax,rdx
  80677c:	48 01 c0             	add    rax,rax
  80677f:	48 01 d0             	add    rax,rdx
  806782:	48 c1 e0 04          	shl    rax,0x4
  806786:	48 05 40 5b 42 00    	add    rax,0x425b40
  80678c:	8b 00                	mov    eax,DWORD PTR [rax]
  80678e:	83 f8 01             	cmp    eax,0x1
  806791:	0f 94 c0             	sete   al
  806794:	0f b6 c0             	movzx  eax,al
}
  806797:	5d                   	pop    rbp
  806798:	c3                   	ret    

0000000000806799 <disk_existent>:
int disk_existent(int disk)
{
  806799:	f3 0f 1e fa          	endbr64 
  80679d:	55                   	push   rbp
  80679e:	48 89 e5             	mov    rbp,rsp
  8067a1:	48 83 ec 10          	sub    rsp,0x10
  8067a5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8067a8:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8067ac:	74 5f                	je     80680d <disk_existent+0x74>
  8067ae:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8067b2:	7f 6e                	jg     806822 <disk_existent+0x89>
  8067b4:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8067b8:	74 3e                	je     8067f8 <disk_existent+0x5f>
  8067ba:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8067be:	7f 62                	jg     806822 <disk_existent+0x89>
  8067c0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8067c4:	74 08                	je     8067ce <disk_existent+0x35>
  8067c6:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8067ca:	74 17                	je     8067e3 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8067cc:	eb 54                	jmp    806822 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8067ce:	bf d4 1b 81 00       	mov    edi,0x811bd4
  8067d3:	e8 78 c5 ff ff       	call   802d50 <sys_find_dev>
  8067d8:	83 f8 ff             	cmp    eax,0xffffffff
  8067db:	0f 95 c0             	setne  al
  8067de:	0f b6 c0             	movzx  eax,al
  8067e1:	eb 45                	jmp    806828 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8067e3:	bf d8 1b 81 00       	mov    edi,0x811bd8
  8067e8:	e8 63 c5 ff ff       	call   802d50 <sys_find_dev>
  8067ed:	83 f8 ff             	cmp    eax,0xffffffff
  8067f0:	0f 95 c0             	setne  al
  8067f3:	0f b6 c0             	movzx  eax,al
  8067f6:	eb 30                	jmp    806828 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8067f8:	bf dc 1b 81 00       	mov    edi,0x811bdc
  8067fd:	e8 4e c5 ff ff       	call   802d50 <sys_find_dev>
  806802:	83 f8 ff             	cmp    eax,0xffffffff
  806805:	0f 95 c0             	setne  al
  806808:	0f b6 c0             	movzx  eax,al
  80680b:	eb 1b                	jmp    806828 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  80680d:	bf e0 1b 81 00       	mov    edi,0x811be0
  806812:	e8 39 c5 ff ff       	call   802d50 <sys_find_dev>
  806817:	83 f8 ff             	cmp    eax,0xffffffff
  80681a:	0f 95 c0             	setne  al
  80681d:	0f b6 c0             	movzx  eax,al
  806820:	eb 06                	jmp    806828 <disk_existent+0x8f>
        break;
  806822:	90                   	nop
    }
    return 0;
  806823:	b8 00 00 00 00       	mov    eax,0x0
}
  806828:	c9                   	leave  
  806829:	c3                   	ret    

000000000080682a <hd_iterate>:
int hd_iterate()
{
  80682a:	f3 0f 1e fa          	endbr64 
  80682e:	55                   	push   rbp
  80682f:	48 89 e5             	mov    rbp,rsp
  806832:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806839:	41 b8 00 00 00 00    	mov    r8d,0x0
  80683f:	b9 01 00 00 00       	mov    ecx,0x1
  806844:	ba 00 00 00 00       	mov    edx,0x0
  806849:	be 02 00 00 00       	mov    esi,0x2
  80684e:	bf 00 00 00 00       	mov    edi,0x0
  806853:	e8 3b f8 ff ff       	call   806093 <request>
  806858:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  80685b:	41 b8 00 00 00 00    	mov    r8d,0x0
  806861:	b9 01 00 00 00       	mov    ecx,0x1
  806866:	ba 00 00 00 00       	mov    edx,0x0
  80686b:	be 02 00 00 00       	mov    esi,0x2
  806870:	bf 01 00 00 00       	mov    edi,0x1
  806875:	e8 19 f8 ff ff       	call   806093 <request>
  80687a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80687d:	41 b8 00 00 00 00    	mov    r8d,0x0
  806883:	b9 01 00 00 00       	mov    ecx,0x1
  806888:	ba 00 00 00 00       	mov    edx,0x0
  80688d:	be 02 00 00 00       	mov    esi,0x2
  806892:	bf 02 00 00 00       	mov    edi,0x2
  806897:	e8 f7 f7 ff ff       	call   806093 <request>
  80689c:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80689f:	41 b8 00 00 00 00    	mov    r8d,0x0
  8068a5:	b9 01 00 00 00       	mov    ecx,0x1
  8068aa:	ba 00 00 00 00       	mov    edx,0x0
  8068af:	be 02 00 00 00       	mov    esi,0x2
  8068b4:	bf 03 00 00 00       	mov    edi,0x3
  8068b9:	e8 d5 f7 ff ff       	call   806093 <request>
  8068be:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  8068c1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8068c8:	e9 5a 01 00 00       	jmp    806a27 <hd_iterate+0x1fd>
    {
        int disk;
        switch (i)
  8068cd:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8068d1:	74 3b                	je     80690e <hd_iterate+0xe4>
  8068d3:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8068d7:	7f 3e                	jg     806917 <hd_iterate+0xed>
  8068d9:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8068dd:	74 26                	je     806905 <hd_iterate+0xdb>
  8068df:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8068e3:	7f 32                	jg     806917 <hd_iterate+0xed>
  8068e5:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8068e9:	74 08                	je     8068f3 <hd_iterate+0xc9>
  8068eb:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8068ef:	74 0b                	je     8068fc <hd_iterate+0xd2>
  8068f1:	eb 24                	jmp    806917 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8068f3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8068fa:	eb 25                	jmp    806921 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8068fc:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806903:	eb 1c                	jmp    806921 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806905:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  80690c:	eb 13                	jmp    806921 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  80690e:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806915:	eb 0a                	jmp    806921 <hd_iterate+0xf7>
        default:
            return -1;
  806917:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80691c:	e9 10 01 00 00       	jmp    806a31 <hd_iterate+0x207>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806921:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806924:	48 98                	cdqe   
  806926:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80692a:	89 c7                	mov    edi,eax
  80692c:	e8 16 fe ff ff       	call   806747 <chk_result>
  806931:	85 c0                	test   eax,eax
  806933:	74 6d                	je     8069a2 <hd_iterate+0x178>
        {
            //新硬盘
            device hd={
  806935:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80693c:	b8 00 00 00 00       	mov    eax,0x0
  806941:	b9 15 00 00 00       	mov    ecx,0x15
  806946:	48 89 d7             	mov    rdi,rdx
  806949:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  80694c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80694f:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806955:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80695c:	00 00 00 
  80695f:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806966:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806969:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80696d:	7f 07                	jg     806976 <hd_iterate+0x14c>
  80696f:	b8 f0 01 00 00       	mov    eax,0x1f0
  806974:	eb 05                	jmp    80697b <hd_iterate+0x151>
  806976:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80697b:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806981:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806988:	48 89 c7             	mov    rdi,rax
  80698b:	e8 88 bf ff ff       	call   802918 <reg_device>
  806990:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806993:	48 63 d2             	movsxd rdx,edx
  806996:	89 04 95 40 88 42 00 	mov    DWORD PTR [rdx*4+0x428840],eax
  80699d:	e9 81 00 00 00       	jmp    806a23 <hd_iterate+0x1f9>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  8069a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8069a5:	48 98                	cdqe   
  8069a7:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8069ab:	89 c7                	mov    edi,eax
  8069ad:	e8 95 fd ff ff       	call   806747 <chk_result>
  8069b2:	85 c0                	test   eax,eax
  8069b4:	75 6d                	jne    806a23 <hd_iterate+0x1f9>
        {
            switch (i)
  8069b6:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8069ba:	74 3e                	je     8069fa <hd_iterate+0x1d0>
  8069bc:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8069c0:	7f 41                	jg     806a03 <hd_iterate+0x1d9>
  8069c2:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8069c6:	74 28                	je     8069f0 <hd_iterate+0x1c6>
  8069c8:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8069cc:	7f 35                	jg     806a03 <hd_iterate+0x1d9>
  8069ce:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8069d2:	74 08                	je     8069dc <hd_iterate+0x1b2>
  8069d4:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8069d8:	74 0c                	je     8069e6 <hd_iterate+0x1bc>
  8069da:	eb 27                	jmp    806a03 <hd_iterate+0x1d9>
            {
            case 0:name="hd0";break;
  8069dc:	48 c7 45 f8 d4 1b 81 	mov    QWORD PTR [rbp-0x8],0x811bd4
  8069e3:	00 
  8069e4:	eb 1d                	jmp    806a03 <hd_iterate+0x1d9>
            case 1:name="hd1";break;
  8069e6:	48 c7 45 f8 d8 1b 81 	mov    QWORD PTR [rbp-0x8],0x811bd8
  8069ed:	00 
  8069ee:	eb 13                	jmp    806a03 <hd_iterate+0x1d9>
            case 2:name="hd2";break;
  8069f0:	48 c7 45 f8 dc 1b 81 	mov    QWORD PTR [rbp-0x8],0x811bdc
  8069f7:	00 
  8069f8:	eb 09                	jmp    806a03 <hd_iterate+0x1d9>
            case 3:name="hd3";break;
  8069fa:	48 c7 45 f8 e0 1b 81 	mov    QWORD PTR [rbp-0x8],0x811be0
  806a01:	00 
  806a02:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  806a03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a07:	48 89 c7             	mov    rdi,rax
  806a0a:	e8 41 c3 ff ff       	call   802d50 <sys_find_dev>
  806a0f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  806a12:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a15:	89 c7                	mov    edi,eax
  806a17:	e8 08 ca ff ff       	call   803424 <get_dev>
  806a1c:	89 c7                	mov    edi,eax
  806a1e:	e8 54 c9 ff ff       	call   803377 <dispose_device>
    for(int i=0;i<4;i++)
  806a23:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806a27:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806a2b:	0f 8e 9c fe ff ff    	jle    8068cd <hd_iterate+0xa3>
        }

    }
}
  806a31:	c9                   	leave  
  806a32:	c3                   	ret    

0000000000806a33 <async_check_disk>:

int async_check_disk(int disk)
{
  806a33:	f3 0f 1e fa          	endbr64 
  806a37:	55                   	push   rbp
  806a38:	48 89 e5             	mov    rbp,rsp
  806a3b:	48 83 ec 20          	sub    rsp,0x20
  806a3f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806a42:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806a48:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806a4e:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806a52:	74 06                	je     806a5a <async_check_disk+0x27>
  806a54:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a58:	75 06                	jne    806a60 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806a5a:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806a60:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806a64:	74 06                	je     806a6c <async_check_disk+0x39>
  806a66:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a6a:	75 06                	jne    806a72 <async_check_disk+0x3f>
        chkcmd=0xf0;
  806a6c:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806a72:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a76:	83 c0 02             	add    eax,0x2
  806a79:	0f b7 c0             	movzx  eax,ax
  806a7c:	be 01 00 00 00       	mov    esi,0x1
  806a81:	89 c7                	mov    edi,eax
  806a83:	e8 98 de ff ff       	call   804920 <outb>
    outb(disknr+3,0);
  806a88:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a8c:	83 c0 03             	add    eax,0x3
  806a8f:	0f b7 c0             	movzx  eax,ax
  806a92:	be 00 00 00 00       	mov    esi,0x0
  806a97:	89 c7                	mov    edi,eax
  806a99:	e8 82 de ff ff       	call   804920 <outb>
    outb(disknr+4,0);
  806a9e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806aa2:	83 c0 04             	add    eax,0x4
  806aa5:	0f b7 c0             	movzx  eax,ax
  806aa8:	be 00 00 00 00       	mov    esi,0x0
  806aad:	89 c7                	mov    edi,eax
  806aaf:	e8 6c de ff ff       	call   804920 <outb>
    outb(disknr+5,0);
  806ab4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ab8:	83 c0 05             	add    eax,0x5
  806abb:	0f b7 c0             	movzx  eax,ax
  806abe:	be 00 00 00 00       	mov    esi,0x0
  806ac3:	89 c7                	mov    edi,eax
  806ac5:	e8 56 de ff ff       	call   804920 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806aca:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806ace:	0f b6 d0             	movzx  edx,al
  806ad1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ad5:	83 c0 06             	add    eax,0x6
  806ad8:	0f b7 c0             	movzx  eax,ax
  806adb:	89 d6                	mov    esi,edx
  806add:	89 c7                	mov    edi,eax
  806adf:	e8 3c de ff ff       	call   804920 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806ae4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ae8:	83 c0 07             	add    eax,0x7
  806aeb:	0f b7 c0             	movzx  eax,ax
  806aee:	be 90 00 00 00       	mov    esi,0x90
  806af3:	89 c7                	mov    edi,eax
  806af5:	e8 26 de ff ff       	call   804920 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806afa:	b8 00 00 00 00       	mov    eax,0x0
}
  806aff:	c9                   	leave  
  806b00:	c3                   	ret    

0000000000806b01 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806b01:	f3 0f 1e fa          	endbr64 
  806b05:	55                   	push   rbp
  806b06:	48 89 e5             	mov    rbp,rsp
  806b09:	48 83 ec 18          	sub    rsp,0x18
  806b0d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806b11:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806b18:	eb 04                	jmp    806b1e <hd_do_req+0x1d>
  806b1a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806b1e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b21:	48 98                	cdqe   
  806b23:	8b 14 85 40 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428840]
  806b2a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b2e:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806b34:	39 c2                	cmp    edx,eax
  806b36:	75 e2                	jne    806b1a <hd_do_req+0x19>
    switch (args->cmd)
  806b38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b3c:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806b42:	83 f8 04             	cmp    eax,0x4
  806b45:	74 72                	je     806bb9 <hd_do_req+0xb8>
  806b47:	83 f8 04             	cmp    eax,0x4
  806b4a:	0f 8f 96 00 00 00    	jg     806be6 <hd_do_req+0xe5>
  806b50:	83 f8 02             	cmp    eax,0x2
  806b53:	74 0a                	je     806b5f <hd_do_req+0x5e>
  806b55:	83 f8 03             	cmp    eax,0x3
  806b58:	74 32                	je     806b8c <hd_do_req+0x8b>
  806b5a:	e9 87 00 00 00       	jmp    806be6 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806b5f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b63:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806b66:	48 98                	cdqe   
  806b68:	48 89 c6             	mov    rsi,rax
  806b6b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b6f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806b72:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b76:	8b 10                	mov    edx,DWORD PTR [rax]
  806b78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b7b:	49 89 f0             	mov    r8,rsi
  806b7e:	be 00 00 00 00       	mov    esi,0x0
  806b83:	89 c7                	mov    edi,eax
  806b85:	e8 09 f5 ff ff       	call   806093 <request>
        break;
  806b8a:	eb 61                	jmp    806bed <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806b8c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b90:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806b93:	48 98                	cdqe   
  806b95:	48 89 c6             	mov    rsi,rax
  806b98:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b9c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806b9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ba3:	8b 10                	mov    edx,DWORD PTR [rax]
  806ba5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ba8:	49 89 f0             	mov    r8,rsi
  806bab:	be 01 00 00 00       	mov    esi,0x1
  806bb0:	89 c7                	mov    edi,eax
  806bb2:	e8 dc f4 ff ff       	call   806093 <request>
        break;
  806bb7:	eb 34                	jmp    806bed <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806bb9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bbd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806bc0:	48 98                	cdqe   
  806bc2:	48 89 c6             	mov    rsi,rax
  806bc5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bc9:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806bcc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bd0:	8b 10                	mov    edx,DWORD PTR [rax]
  806bd2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bd5:	49 89 f0             	mov    r8,rsi
  806bd8:	be 02 00 00 00       	mov    esi,0x2
  806bdd:	89 c7                	mov    edi,eax
  806bdf:	e8 af f4 ff ff       	call   806093 <request>
        break;
  806be4:	eb 07                	jmp    806bed <hd_do_req+0xec>
    default:return -1;
  806be6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806beb:	eb 1e                	jmp    806c0b <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806bed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bf1:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806bf8:	00 00 00 
    running_devman_req=args;
  806bfb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bff:	48 89 05 22 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c22],rax        # 428828 <running_devman_req>
    return 0;
  806c06:	b8 00 00 00 00       	mov    eax,0x0
  806c0b:	c9                   	leave  
  806c0c:	c3                   	ret    
  806c0d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000806c10 <disk_int_handler>:
  806c10:	e8 4a dd ff ff       	call   80495f <eoi>
  806c15:	e8 8a f2 ff ff       	call   805ea4 <disk_int_handler_c>
  806c1a:	cf                   	iret   

0000000000806c1b <read_disk_asm>:
  806c1b:	55                   	push   rbp
  806c1c:	89 e5                	mov    ebp,esp
  806c1e:	66 ba f7 01          	mov    dx,0x1f7
  806c22:	31 c9                	xor    ecx,ecx
  806c24:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806c29:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806c2e:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806c33:	89 c6                	mov    esi,eax
  806c35:	66 ba f2 01          	mov    dx,0x1f2
  806c39:	88 c8                	mov    al,cl
  806c3b:	ee                   	out    dx,al
  806c3c:	66 ba f3 01          	mov    dx,0x1f3
  806c40:	89 f0                	mov    eax,esi
  806c42:	ee                   	out    dx,al
  806c43:	66 ff c2             	inc    dx
  806c46:	c1 e8 08             	shr    eax,0x8
  806c49:	ee                   	out    dx,al
  806c4a:	66 ff c2             	inc    dx
  806c4d:	c1 e8 08             	shr    eax,0x8
  806c50:	ee                   	out    dx,al
  806c51:	66 ff c2             	inc    dx
  806c54:	66 c1 e8 08          	shr    ax,0x8
  806c58:	24 0f                	and    al,0xf
  806c5a:	0c e0                	or     al,0xe0
  806c5c:	ee                   	out    dx,al
  806c5d:	66 ff c2             	inc    dx
  806c60:	b0 20                	mov    al,0x20
  806c62:	ee                   	out    dx,al

0000000000806c63 <read_disk_asm.wait>:
  806c63:	90                   	nop
  806c64:	ec                   	in     al,dx
  806c65:	24 88                	and    al,0x88
  806c67:	3c 08                	cmp    al,0x8
  806c69:	75 f8                	jne    806c63 <read_disk_asm.wait>
  806c6b:	66 89 d7             	mov    di,dx
  806c6e:	89 c8                	mov    eax,ecx
  806c70:	66 b9 00 01          	mov    cx,0x100
  806c74:	66 f7 e1             	mul    cx
  806c77:	89 c1                	mov    ecx,eax
  806c79:	66 ba f0 01          	mov    dx,0x1f0

0000000000806c7d <read_disk_asm.read>:
  806c7d:	66 ed                	in     ax,dx
  806c7f:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806c83:	83 c3 02             	add    ebx,0x2
  806c86:	e2 f5                	loop   806c7d <read_disk_asm.read>
  806c88:	c9                   	leave  
  806c89:	b8 00 00 00 00       	mov    eax,0x0
  806c8e:	c3                   	ret    

0000000000806c8f <read_disk_asm.err_disk_reading>:
  806c8f:	66 ba f1 01          	mov    dx,0x1f1
  806c93:	31 c0                	xor    eax,eax
  806c95:	66 ed                	in     ax,dx
  806c97:	89 ec                	mov    esp,ebp
  806c99:	5d                   	pop    rbp
  806c9a:	c3                   	ret    

0000000000806c9b <write_disk_asm>:
  806c9b:	55                   	push   rbp
  806c9c:	89 e5                	mov    ebp,esp
  806c9e:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806ca3:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806ca8:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806cad:	50                   	push   rax
  806cae:	66 ba f2 01          	mov    dx,0x1f2
  806cb2:	88 c8                	mov    al,cl
  806cb4:	ee                   	out    dx,al
  806cb5:	58                   	pop    rax
  806cb6:	66 ba f3 01          	mov    dx,0x1f3
  806cba:	ee                   	out    dx,al
  806cbb:	c1 e8 08             	shr    eax,0x8
  806cbe:	66 ba f4 01          	mov    dx,0x1f4
  806cc2:	ee                   	out    dx,al
  806cc3:	c1 e8 08             	shr    eax,0x8
  806cc6:	66 ba f5 01          	mov    dx,0x1f5
  806cca:	ee                   	out    dx,al
  806ccb:	c1 e8 08             	shr    eax,0x8
  806cce:	24 0f                	and    al,0xf
  806cd0:	0c e0                	or     al,0xe0
  806cd2:	66 ba f6 01          	mov    dx,0x1f6
  806cd6:	ee                   	out    dx,al
  806cd7:	66 ba f7 01          	mov    dx,0x1f7
  806cdb:	b0 30                	mov    al,0x30
  806cdd:	ee                   	out    dx,al

0000000000806cde <write_disk_asm.not_ready2>:
  806cde:	90                   	nop
  806cdf:	ec                   	in     al,dx
  806ce0:	24 88                	and    al,0x88
  806ce2:	3c 08                	cmp    al,0x8
  806ce4:	75 f8                	jne    806cde <write_disk_asm.not_ready2>
  806ce6:	89 c8                	mov    eax,ecx
  806ce8:	66 b9 00 01          	mov    cx,0x100
  806cec:	66 f7 e1             	mul    cx
  806cef:	89 c1                	mov    ecx,eax
  806cf1:	66 ba f0 01          	mov    dx,0x1f0

0000000000806cf5 <write_disk_asm.go_on_write>:
  806cf5:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806cf9:	66 ef                	out    dx,ax
  806cfb:	83 c3 02             	add    ebx,0x2
  806cfe:	e2 f5                	loop   806cf5 <write_disk_asm.go_on_write>
  806d00:	89 ec                	mov    esp,ebp
  806d02:	5d                   	pop    rbp
  806d03:	c3                   	ret    

0000000000806d04 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806d04:	f3 0f 1e fa          	endbr64 
  806d08:	55                   	push   rbp
  806d09:	48 89 e5             	mov    rbp,rsp
  806d0c:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806d13:	bf a0 1c 81 00       	mov    edi,0x811ca0
  806d18:	e8 fb bb ff ff       	call   802918 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806d1d:	bf 00 1c 81 00       	mov    edi,0x811c00
  806d22:	e8 d9 be ff ff       	call   802c00 <reg_driver>
  806d27:	89 05 97 9d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29d97],eax        # 430ac4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806d2d:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806d34:	48 89 c7             	mov    rdi,rax
  806d37:	e8 26 00 00 00       	call   806d62 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806d3c:	8b 0d 82 9d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29d82]        # 430ac4 <fat16_drvi>
  806d42:	8b 05 e8 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ae8]        # 428830 <disk_drvi>
  806d48:	ba 48 1d 81 00       	mov    edx,0x811d48
  806d4d:	89 ce                	mov    esi,ecx
  806d4f:	89 c7                	mov    edi,eax
  806d51:	b8 00 00 00 00       	mov    eax,0x0
  806d56:	e8 45 ab ff ff       	call   8018a0 <reg_vol>
    return 0;
  806d5b:	b8 00 00 00 00       	mov    eax,0x0
}
  806d60:	c9                   	leave  
  806d61:	c3                   	ret    

0000000000806d62 <load>:
int load(driver_args *args)
{
  806d62:	f3 0f 1e fa          	endbr64 
  806d66:	55                   	push   rbp
  806d67:	48 89 e5             	mov    rbp,rsp
  806d6a:	48 83 ec 20          	sub    rsp,0x20
  806d6e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806d72:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806d79:	ba 01 00 00 00       	mov    edx,0x1
  806d7e:	be 00 00 00 00       	mov    esi,0x0
  806d83:	bf 60 88 42 00       	mov    edi,0x428860
  806d88:	e8 61 0b 00 00       	call   8078ee <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806d8d:	0f b7 05 e2 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ae2]        # 428876 <superblock+0x16>
  806d94:	0f b7 d0             	movzx  edx,ax
  806d97:	0f b7 05 d0 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ad0]        # 42886e <superblock+0xe>
  806d9e:	0f b7 c0             	movzx  eax,ax
  806da1:	89 c6                	mov    esi,eax
  806da3:	bf c0 ca 42 00       	mov    edi,0x42cac0
  806da8:	e8 41 0b 00 00       	call   8078ee <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806dad:	0f b7 05 ba 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21aba]        # 42886e <superblock+0xe>
  806db4:	0f b7 c8             	movzx  ecx,ax
  806db7:	0f b7 05 b8 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ab8]        # 428876 <superblock+0x16>
  806dbe:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806dc1:	0f b6 05 a8 1a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21aa8]        # 428870 <superblock+0x10>
  806dc8:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806dcb:	0f af c2             	imul   eax,edx
  806dce:	01 c8                	add    eax,ecx
  806dd0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806dd3:	0f b7 05 97 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a97]        # 428871 <superblock+0x11>
  806dda:	0f b7 c0             	movzx  eax,ax
  806ddd:	48 c1 e0 05          	shl    rax,0x5
  806de1:	0f b7 15 83 1a c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc21a83]        # 42886b <superblock+0xb>
  806de8:	0f b7 ca             	movzx  ecx,dx
  806deb:	ba 00 00 00 00       	mov    edx,0x0
  806df0:	48 f7 f1             	div    rcx
  806df3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806df6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806df9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806dfc:	89 c6                	mov    esi,eax
  806dfe:	bf a0 88 42 00       	mov    edi,0x4288a0
  806e03:	e8 e6 0a 00 00       	call   8078ee <read_sec>

    cur_dir.fistCluNum=0;
  806e08:	66 c7 05 a9 5a c2 ff 	mov    WORD PTR [rip+0xffffffffffc25aa9],0x0        # 42c8ba <cur_dir+0x1a>
  806e0f:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806e11:	0f b7 05 56 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a56]        # 42886e <superblock+0xe>
  806e18:	0f b7 c0             	movzx  eax,ax
  806e1b:	83 c0 3e             	add    eax,0x3e
  806e1e:	89 05 3c 31 00 00    	mov    DWORD PTR [rip+0x313c],eax        # 809f60 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806e24:	c7 05 92 9c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29c92],0x0        # 430ac0 <dir_depth>
  806e2b:	00 00 00 
    return 0;
  806e2e:	b8 00 00 00 00       	mov    eax,0x0

}
  806e33:	c9                   	leave  
  806e34:	c3                   	ret    

0000000000806e35 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806e35:	f3 0f 1e fa          	endbr64 
  806e39:	55                   	push   rbp
  806e3a:	48 89 e5             	mov    rbp,rsp
  806e3d:	48 83 ec 70          	sub    rsp,0x70
  806e41:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806e45:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806e4c:	66 67 68 
  806e4f:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806e56:	6e 6f 70 
  806e59:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806e5d:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806e61:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806e68:	76 77 78 
  806e6b:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806e72:	44 45 46 
  806e75:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806e79:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806e7d:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806e84:	4c 4d 4e 
  806e87:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806e8e:	54 55 56 
  806e91:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  806e95:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806e99:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  806ea0:	31 32 33 
  806ea3:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  806eaa:	39 2c 2f 
  806ead:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  806eb1:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806eb5:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  806ebc:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  806ec2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ec6:	48 89 c7             	mov    rdi,rax
  806ec9:	e8 24 28 00 00       	call   8096f2 <strlen>
  806ece:	83 f8 0b             	cmp    eax,0xb
  806ed1:	7f 10                	jg     806ee3 <verify_name+0xae>
  806ed3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ed7:	48 89 c7             	mov    rdi,rax
  806eda:	e8 13 28 00 00       	call   8096f2 <strlen>
  806edf:	85 c0                	test   eax,eax
  806ee1:	75 0a                	jne    806eed <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  806ee3:	b8 00 00 00 00       	mov    eax,0x0
  806ee8:	e9 b3 01 00 00       	jmp    8070a0 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  806eed:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806ef4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806efb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806f02:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806f09:	eb 6b                	jmp    806f76 <verify_name+0x141>
    {
        int j=0;
  806f0b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  806f12:	eb 22                	jmp    806f36 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  806f14:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f17:	48 63 d0             	movsxd rdx,eax
  806f1a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f1e:	48 01 d0             	add    rax,rdx
  806f21:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806f24:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f27:	48 98                	cdqe   
  806f29:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806f2e:	38 c2                	cmp    dl,al
  806f30:	74 0e                	je     806f40 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  806f32:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806f36:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f39:	83 f8 45             	cmp    eax,0x45
  806f3c:	76 d6                	jbe    806f14 <verify_name+0xdf>
  806f3e:	eb 01                	jmp    806f41 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  806f40:	90                   	nop
        if(j>=sizeof(valid_ch))
  806f41:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f44:	83 f8 45             	cmp    eax,0x45
  806f47:	76 0a                	jbe    806f53 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  806f49:	b8 00 00 00 00       	mov    eax,0x0
  806f4e:	e9 4d 01 00 00       	jmp    8070a0 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806f53:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f56:	48 63 d0             	movsxd rdx,eax
  806f59:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f5d:	48 01 d0             	add    rax,rdx
  806f60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f63:	3c 20                	cmp    al,0x20
  806f65:	74 07                	je     806f6e <verify_name+0x139>
  806f67:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  806f6e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806f72:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806f76:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f79:	48 63 d0             	movsxd rdx,eax
  806f7c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f80:	48 01 d0             	add    rax,rdx
  806f83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f86:	3c 2e                	cmp    al,0x2e
  806f88:	74 18                	je     806fa2 <verify_name+0x16d>
  806f8a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f8d:	48 63 d0             	movsxd rdx,eax
  806f90:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f94:	48 01 d0             	add    rax,rdx
  806f97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f9a:	84 c0                	test   al,al
  806f9c:	0f 85 69 ff ff ff    	jne    806f0b <verify_name+0xd6>
    }
    if(c>8||flag==0){
  806fa2:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  806fa6:	7f 06                	jg     806fae <verify_name+0x179>
  806fa8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806fac:	75 0a                	jne    806fb8 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806fae:	b8 00 00 00 00       	mov    eax,0x0
  806fb3:	e9 e8 00 00 00       	jmp    8070a0 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  806fb8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806fbb:	48 63 d0             	movsxd rdx,eax
  806fbe:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806fc2:	48 01 d0             	add    rax,rdx
  806fc5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806fc8:	84 c0                	test   al,al
  806fca:	75 0a                	jne    806fd6 <verify_name+0x1a1>
        return 1;
  806fcc:	b8 01 00 00 00       	mov    eax,0x1
  806fd1:	e9 ca 00 00 00       	jmp    8070a0 <verify_name+0x26b>
    c=0;
  806fd6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  806fdd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  806fe4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806fe8:	e9 83 00 00 00       	jmp    807070 <verify_name+0x23b>
    {
        int j=0;
  806fed:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  806ff4:	eb 22                	jmp    807018 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  806ff6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806ff9:	48 63 d0             	movsxd rdx,eax
  806ffc:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807000:	48 01 d0             	add    rax,rdx
  807003:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807006:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807009:	48 98                	cdqe   
  80700b:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  807010:	38 c2                	cmp    dl,al
  807012:	74 0e                	je     807022 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  807014:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807018:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80701b:	83 f8 45             	cmp    eax,0x45
  80701e:	76 d6                	jbe    806ff6 <verify_name+0x1c1>
  807020:	eb 01                	jmp    807023 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  807022:	90                   	nop
        if(j>=sizeof(valid_ch)){
  807023:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807026:	83 f8 45             	cmp    eax,0x45
  807029:	76 07                	jbe    807032 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  80702b:	b8 00 00 00 00       	mov    eax,0x0
  807030:	eb 6e                	jmp    8070a0 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807032:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807035:	48 63 d0             	movsxd rdx,eax
  807038:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80703c:	48 01 d0             	add    rax,rdx
  80703f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807042:	3c 20                	cmp    al,0x20
  807044:	74 07                	je     80704d <verify_name+0x218>
  807046:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  80704d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807050:	48 63 d0             	movsxd rdx,eax
  807053:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807057:	48 01 d0             	add    rax,rdx
  80705a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80705d:	3c 2e                	cmp    al,0x2e
  80705f:	75 07                	jne    807068 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  807061:	b8 00 00 00 00       	mov    eax,0x0
  807066:	eb 38                	jmp    8070a0 <verify_name+0x26b>
        }
        c++;
  807068:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  80706c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807070:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807073:	48 63 d0             	movsxd rdx,eax
  807076:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80707a:	48 01 d0             	add    rax,rdx
  80707d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807080:	84 c0                	test   al,al
  807082:	0f 85 65 ff ff ff    	jne    806fed <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807088:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80708c:	7f 06                	jg     807094 <verify_name+0x25f>
  80708e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807092:	75 07                	jne    80709b <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807094:	b8 00 00 00 00       	mov    eax,0x0
  807099:	eb 05                	jmp    8070a0 <verify_name+0x26b>
    }
    return 1;
  80709b:	b8 01 00 00 00       	mov    eax,0x1
}
  8070a0:	c9                   	leave  
  8070a1:	c3                   	ret    

00000000008070a2 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  8070a2:	f3 0f 1e fa          	endbr64 
  8070a6:	55                   	push   rbp
  8070a7:	48 89 e5             	mov    rbp,rsp
  8070aa:	48 83 ec 30          	sub    rsp,0x30
  8070ae:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  8070b2:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  8070b9:	20 20 20 
  8070bc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8070c0:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  8070c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  8070ce:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  8070d5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8070dc:	e9 9b 00 00 00       	jmp    80717c <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  8070e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070e4:	48 63 d0             	movsxd rdx,eax
  8070e7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070eb:	48 01 d0             	add    rax,rdx
  8070ee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070f1:	3c 60                	cmp    al,0x60
  8070f3:	7e 3e                	jle    807133 <format_name+0x91>
  8070f5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070f8:	48 63 d0             	movsxd rdx,eax
  8070fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070ff:	48 01 d0             	add    rax,rdx
  807102:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807105:	3c 7a                	cmp    al,0x7a
  807107:	7f 2a                	jg     807133 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  807109:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80710c:	48 63 d0             	movsxd rdx,eax
  80710f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807113:	48 01 d0             	add    rax,rdx
  807116:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807119:	8d 48 e0             	lea    ecx,[rax-0x20]
  80711c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80711f:	8d 50 01             	lea    edx,[rax+0x1]
  807122:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807125:	89 ca                	mov    edx,ecx
  807127:	48 98                	cdqe   
  807129:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  80712d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807131:	eb 45                	jmp    807178 <format_name+0xd6>
        }
        else if(str[i]=='.')
  807133:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807136:	48 63 d0             	movsxd rdx,eax
  807139:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80713d:	48 01 d0             	add    rax,rdx
  807140:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807143:	3c 2e                	cmp    al,0x2e
  807145:	75 0d                	jne    807154 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  807147:	b8 08 00 00 00       	mov    eax,0x8
  80714c:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  80714f:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807152:	eb 24                	jmp    807178 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807154:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807157:	48 63 d0             	movsxd rdx,eax
  80715a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80715e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807162:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807165:	8d 50 01             	lea    edx,[rax+0x1]
  807168:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80716b:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  80716e:	48 98                	cdqe   
  807170:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807174:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807178:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80717c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80717f:	48 63 d0             	movsxd rdx,eax
  807182:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807186:	48 01 d0             	add    rax,rdx
  807189:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80718c:	84 c0                	test   al,al
  80718e:	0f 85 4d ff ff ff    	jne    8070e1 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807194:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807198:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80719c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8071a0:	48 89 d6             	mov    rsi,rdx
  8071a3:	48 89 c7             	mov    rdi,rax
  8071a6:	e8 28 23 00 00       	call   8094d3 <strcpy>
}
  8071ab:	90                   	nop
  8071ac:	c9                   	leave  
  8071ad:	c3                   	ret    

00000000008071ae <req_cluster>:
int req_cluster()
{
  8071ae:	f3 0f 1e fa          	endbr64 
  8071b2:	55                   	push   rbp
  8071b3:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8071b6:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  8071bd:	eb 2a                	jmp    8071e9 <req_cluster+0x3b>
    {
        if(fat[i]==0)
  8071bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071c2:	48 98                	cdqe   
  8071c4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8071cb:	00 
  8071cc:	66 85 c0             	test   ax,ax
  8071cf:	75 14                	jne    8071e5 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  8071d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071d4:	48 98                	cdqe   
  8071d6:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0xffff
  8071dd:	00 ff ff 
            return i;
  8071e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071e3:	eb 13                	jmp    8071f8 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8071e5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8071e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071ec:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8071f1:	76 cc                	jbe    8071bf <req_cluster+0x11>
        }
    }
    return -1;
  8071f3:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8071f8:	5d                   	pop    rbp
  8071f9:	c3                   	ret    

00000000008071fa <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8071fa:	f3 0f 1e fa          	endbr64 
  8071fe:	55                   	push   rbp
  8071ff:	48 89 e5             	mov    rbp,rsp
  807202:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  807209:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  807210:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  807216:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  80721c:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807223:	b8 00 00 00 00       	mov    eax,0x0
  807228:	b9 18 00 00 00       	mov    ecx,0x18
  80722d:	48 89 d7             	mov    rdi,rdx
  807230:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807233:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80723a:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807240:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  807246:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  80724c:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807252:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  807258:	48 8b 15 79 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c79]        # 809ed8 <drv_disk+0x18>
  80725f:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807266:	48 89 c7             	mov    rdi,rax
  807269:	ff d2                	call   rdx
}
  80726b:	c9                   	leave  
  80726c:	c3                   	ret    

000000000080726d <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  80726d:	f3 0f 1e fa          	endbr64 
  807271:	55                   	push   rbp
  807272:	48 89 e5             	mov    rbp,rsp
  807275:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807279:	89 f0                	mov    eax,esi
  80727b:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80727e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807282:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807286:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  807289:	89 c2                	mov    edx,eax
  80728b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80728f:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807292:	90                   	nop
  807293:	5d                   	pop    rbp
  807294:	c3                   	ret    

0000000000807295 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807295:	f3 0f 1e fa          	endbr64 
  807299:	55                   	push   rbp
  80729a:	48 89 e5             	mov    rbp,rsp
  80729d:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  8072a1:	0f b7 05 c6 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215c6]        # 42886e <superblock+0xe>
  8072a8:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  8072ab:	0f b7 05 c4 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215c4]        # 428876 <superblock+0x16>
  8072b2:	0f b7 d0             	movzx  edx,ax
  8072b5:	0f b6 05 b4 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215b4]        # 428870 <superblock+0x10>
  8072bc:	0f b6 c0             	movzx  eax,al
  8072bf:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  8072c2:	01 c8                	add    eax,ecx
  8072c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  8072c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072ca:	ba 00 40 00 00       	mov    edx,0x4000
  8072cf:	89 c6                	mov    esi,eax
  8072d1:	bf a0 88 42 00       	mov    edi,0x4288a0
  8072d6:	e8 1f ff ff ff       	call   8071fa <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  8072db:	0f b7 05 8c 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2158c]        # 42886e <superblock+0xe>
  8072e2:	0f b7 c0             	movzx  eax,ax
  8072e5:	ba 00 40 00 00       	mov    edx,0x4000
  8072ea:	89 c6                	mov    esi,eax
  8072ec:	bf c0 ca 42 00       	mov    edi,0x42cac0
  8072f1:	e8 04 ff ff ff       	call   8071fa <write_sec>
    //printf("updated fat\n");

}
  8072f6:	90                   	nop
  8072f7:	c9                   	leave  
  8072f8:	c3                   	ret    

00000000008072f9 <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8072f9:	f3 0f 1e fa          	endbr64 
  8072fd:	55                   	push   rbp
  8072fe:	48 89 e5             	mov    rbp,rsp
  807301:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807305:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807309:	0f b7 c0             	movzx  eax,ax
  80730c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  80730f:	0f b6 05 57 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21557]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807316:	0f b6 c0             	movzx  eax,al
  807319:	8b 0d 41 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c41]        # 809f60 <clu_sec_balance>
  80731f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807322:	01 d1                	add    ecx,edx
  807324:	89 c2                	mov    edx,eax
  807326:	89 ce                	mov    esi,ecx
  807328:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80732d:	e8 bc 05 00 00       	call   8078ee <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807332:	be 4a 1d 81 00       	mov    esi,0x811d4a
  807337:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80733c:	e8 92 21 00 00       	call   8094d3 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807341:	be 53 1d 81 00       	mov    esi,0x811d53
  807346:	bf c8 c8 42 00       	mov    edi,0x42c8c8
  80734b:	e8 83 21 00 00       	call   8094d3 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807350:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807354:	66 89 05 7f 55 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2557f],ax        # 42c8da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80735b:	c7 05 77 55 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25577],0x0        # 42c8dc <a_clu_of_dir+0x1c>
  807362:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807365:	be 10 00 00 00       	mov    esi,0x10
  80736a:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80736f:	e8 f9 fe ff ff       	call   80726d <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807374:	be 57 1d 81 00       	mov    esi,0x811d57
  807379:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  80737e:	e8 50 21 00 00       	call   8094d3 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807383:	be 53 1d 81 00       	mov    esi,0x811d53
  807388:	bf e8 c8 42 00       	mov    edi,0x42c8e8
  80738d:	e8 41 21 00 00       	call   8094d3 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807392:	0f b7 05 21 55 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25521]        # 42c8ba <cur_dir+0x1a>
  807399:	66 89 05 5a 55 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2555a],ax        # 42c8fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  8073a0:	c7 05 52 55 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25552],0x0        # 42c8fc <a_clu_of_dir+0x3c>
  8073a7:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  8073aa:	be 10 00 00 00       	mov    esi,0x10
  8073af:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  8073b4:	e8 b4 fe ff ff       	call   80726d <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  8073b9:	8b 15 a1 2b 00 00    	mov    edx,DWORD PTR [rip+0x2ba1]        # 809f60 <clu_sec_balance>
  8073bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8073c2:	01 d0                	add    eax,edx
  8073c4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  8073c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8073ca:	ba 00 02 00 00       	mov    edx,0x200
  8073cf:	89 c6                	mov    esi,eax
  8073d1:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8073d6:	e8 1f fe ff ff       	call   8071fa <write_sec>
    //no need to update fat and root
}
  8073db:	90                   	nop
  8073dc:	c9                   	leave  
  8073dd:	c3                   	ret    

00000000008073de <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8073de:	f3 0f 1e fa          	endbr64 
  8073e2:	55                   	push   rbp
  8073e3:	48 89 e5             	mov    rbp,rsp
  8073e6:	89 f8                	mov    eax,edi
  8073e8:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8073ec:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8073ef:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8073f3:	83 e0 01             	and    eax,0x1
  8073f6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8073f9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8073fd:	74 0b                	je     80740a <translate_attr+0x2c>
        attr_s[1]='-';
  8073ff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807403:	48 83 c0 01          	add    rax,0x1
  807407:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  80740a:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80740e:	83 e0 02             	and    eax,0x2
  807411:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807414:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807418:	74 0b                	je     807425 <translate_attr+0x47>
        attr_s[2]='h';
  80741a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80741e:	48 83 c0 02          	add    rax,0x2
  807422:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807425:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807429:	83 e0 04             	and    eax,0x4
  80742c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  80742f:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807433:	74 0b                	je     807440 <translate_attr+0x62>
        attr_s[4]='s';
  807435:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807439:	48 83 c0 04          	add    rax,0x4
  80743d:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807440:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807444:	83 e0 08             	and    eax,0x8
  807447:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80744a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80744e:	74 0b                	je     80745b <translate_attr+0x7d>
        attr_s[3]='v';
  807450:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807454:	48 83 c0 03          	add    rax,0x3
  807458:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80745b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80745f:	83 e0 10             	and    eax,0x10
  807462:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807465:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807469:	74 0b                	je     807476 <translate_attr+0x98>
        attr_s[3]='d';
  80746b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80746f:	48 83 c0 03          	add    rax,0x3
  807473:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807476:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80747a:	48 83 c0 05          	add    rax,0x5
  80747e:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807481:	90                   	nop
  807482:	5d                   	pop    rbp
  807483:	c3                   	ret    

0000000000807484 <extend_cluster>:
int extend_cluster(short cluster)
{
  807484:	f3 0f 1e fa          	endbr64 
  807488:	55                   	push   rbp
  807489:	48 89 e5             	mov    rbp,rsp
  80748c:	48 83 ec 18          	sub    rsp,0x18
  807490:	89 f8                	mov    eax,edi
  807492:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807496:	b8 00 00 00 00       	mov    eax,0x0
  80749b:	e8 0e fd ff ff       	call   8071ae <req_cluster>
  8074a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  8074a3:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8074a7:	75 07                	jne    8074b0 <extend_cluster+0x2c>
        return -1;
  8074a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8074ae:	eb 16                	jmp    8074c6 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  8074b0:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  8074b4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8074b7:	48 98                	cdqe   
  8074b9:	66 89 94 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],dx
  8074c0:	00 
    return 0;
  8074c1:	b8 00 00 00 00       	mov    eax,0x0
}
  8074c6:	c9                   	leave  
  8074c7:	c3                   	ret    

00000000008074c8 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  8074c8:	f3 0f 1e fa          	endbr64 
  8074cc:	55                   	push   rbp
  8074cd:	48 89 e5             	mov    rbp,rsp
  8074d0:	48 83 ec 60          	sub    rsp,0x60
  8074d4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  8074d8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8074dc:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8074e0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8074e4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8074e8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8074eb:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8074ef:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8074f6:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  8074fd:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8074fe:	0f b6 05 68 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21368]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807505:	0f b6 c0             	movzx  eax,al
  807508:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  80750c:	0f b7 ca             	movzx  ecx,dx
  80750f:	8b 15 4b 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a4b]        # 809f60 <clu_sec_balance>
  807515:	01 d1                	add    ecx,edx
  807517:	89 c2                	mov    edx,eax
  807519:	89 ce                	mov    esi,ecx
  80751b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807520:	e8 c9 03 00 00       	call   8078ee <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807525:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  807529:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  80752d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807534:	e9 2e 01 00 00       	jmp    807667 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807539:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80753c:	48 98                	cdqe   
  80753e:	48 c1 e0 05          	shl    rax,0x5
  807542:	48 89 c2             	mov    rdx,rax
  807545:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807549:	48 01 d0             	add    rax,rdx
  80754c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80754f:	3c e5                	cmp    al,0xe5
  807551:	74 1e                	je     807571 <touch+0xa9>
            dir_table[i].name[0]==0)
  807553:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807556:	48 98                	cdqe   
  807558:	48 c1 e0 05          	shl    rax,0x5
  80755c:	48 89 c2             	mov    rdx,rax
  80755f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807563:	48 01 d0             	add    rax,rdx
  807566:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807569:	84 c0                	test   al,al
  80756b:	0f 85 f2 00 00 00    	jne    807663 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807571:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807575:	48 89 c7             	mov    rdi,rax
  807578:	e8 25 fb ff ff       	call   8070a2 <format_name>
                memcpy(dir_table[i].name,name,11);
  80757d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807580:	48 98                	cdqe   
  807582:	48 c1 e0 05          	shl    rax,0x5
  807586:	48 89 c2             	mov    rdx,rax
  807589:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80758d:	48 01 d0             	add    rax,rdx
  807590:	48 89 c1             	mov    rcx,rax
  807593:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807597:	ba 0b 00 00 00       	mov    edx,0xb
  80759c:	48 89 c6             	mov    rsi,rax
  80759f:	48 89 cf             	mov    rdi,rcx
  8075a2:	e8 2e 1e 00 00       	call   8093d5 <memcpy>
                int clu=req_cluster();
  8075a7:	b8 00 00 00 00       	mov    eax,0x0
  8075ac:	e8 fd fb ff ff       	call   8071ae <req_cluster>
  8075b1:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  8075b4:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8075b8:	75 0a                	jne    8075c4 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  8075ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8075bf:	e9 fc 00 00 00       	jmp    8076c0 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  8075c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075c7:	48 98                	cdqe   
  8075c9:	48 c1 e0 05          	shl    rax,0x5
  8075cd:	48 89 c2             	mov    rdx,rax
  8075d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075d4:	48 01 d0             	add    rax,rdx
  8075d7:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8075da:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8075de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075e1:	48 98                	cdqe   
  8075e3:	48 c1 e0 05          	shl    rax,0x5
  8075e7:	48 89 c2             	mov    rdx,rax
  8075ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075ee:	48 01 d0             	add    rax,rdx
  8075f1:	be 20 00 00 00       	mov    esi,0x20
  8075f6:	48 89 c7             	mov    rdi,rax
  8075f9:	e8 6f fc ff ff       	call   80726d <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  8075fe:	0f b7 05 66 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21266]        # 42886b <superblock+0xb>
  807605:	0f b7 d0             	movzx  edx,ax
  807608:	0f b6 05 5e 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2125e]        # 42886d <superblock+0xd>
  80760f:	0f b6 c0             	movzx  eax,al
  807612:	0f af d0             	imul   edx,eax
  807615:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807618:	48 98                	cdqe   
  80761a:	48 c1 e0 05          	shl    rax,0x5
  80761e:	48 89 c1             	mov    rcx,rax
  807621:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807625:	48 01 c8             	add    rax,rcx
  807628:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  80762b:	0f b7 05 39 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21239]        # 42886b <superblock+0xb>
  807632:	0f b7 d0             	movzx  edx,ax
  807635:	0f b6 05 31 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21231]        # 42886d <superblock+0xd>
  80763c:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  80763f:	0f af d0             	imul   edx,eax
  807642:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807646:	8b 05 14 29 00 00    	mov    eax,DWORD PTR [rip+0x2914]        # 809f60 <clu_sec_balance>
  80764c:	01 c1                	add    ecx,eax
  80764e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807652:	89 ce                	mov    esi,ecx
  807654:	48 89 c7             	mov    rdi,rax
  807657:	e8 9e fb ff ff       	call   8071fa <write_sec>
                return -1;
  80765c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807661:	eb 5d                	jmp    8076c0 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807663:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807667:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80766a:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  80766d:	0f 8c c6 fe ff ff    	jl     807539 <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807673:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807678:	77 36                	ja     8076b0 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80767a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80767e:	48 98                	cdqe   
  807680:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807687:	00 
  807688:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80768c:	0f b6 05 da 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211da]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807693:	0f b6 d0             	movzx  edx,al
  807696:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80769a:	8b 05 c0 28 00 00    	mov    eax,DWORD PTR [rip+0x28c0]        # 809f60 <clu_sec_balance>
  8076a0:	01 c1                	add    ecx,eax
  8076a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076a6:	89 ce                	mov    esi,ecx
  8076a8:	48 89 c7             	mov    rdi,rax
  8076ab:	e8 3e 02 00 00       	call   8078ee <read_sec>
        }
    }while(cluster<FAT_EOF);
  8076b0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8076b5:	0f 86 72 fe ff ff    	jbe    80752d <touch+0x65>
    return 0;
  8076bb:	b8 00 00 00 00       	mov    eax,0x0
}
  8076c0:	c9                   	leave  
  8076c1:	c3                   	ret    

00000000008076c2 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  8076c2:	f3 0f 1e fa          	endbr64 
  8076c6:	55                   	push   rbp
  8076c7:	48 89 e5             	mov    rbp,rsp
  8076ca:	48 83 ec 50          	sub    rsp,0x50
  8076ce:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  8076d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8076d6:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8076da:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8076de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8076e2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8076e5:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8076e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076ed:	48 89 c7             	mov    rdi,rax
  8076f0:	e8 ad f9 ff ff       	call   8070a2 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8076f5:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8076f9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8076fd:	0f b6 05 69 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21169]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807704:	0f b6 c0             	movzx  eax,al
  807707:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80770b:	8b 15 4f 28 00 00    	mov    edx,DWORD PTR [rip+0x284f]        # 809f60 <clu_sec_balance>
  807711:	01 d1                	add    ecx,edx
  807713:	89 c2                	mov    edx,eax
  807715:	89 ce                	mov    esi,ecx
  807717:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80771c:	e8 cd 01 00 00       	call   8078ee <read_sec>
        for (int i = 0; i < 16; i++)
  807721:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807728:	e9 8c 01 00 00       	jmp    8078b9 <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  80772d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807730:	48 98                	cdqe   
  807732:	48 c1 e0 05          	shl    rax,0x5
  807736:	48 05 da c8 42 00    	add    rax,0x42c8da
  80773c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80773f:	66 85 c0             	test   ax,ax
  807742:	74 30                	je     807774 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807744:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807747:	48 98                	cdqe   
  807749:	48 c1 e0 05          	shl    rax,0x5
  80774d:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807753:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807756:	3c e5                	cmp    al,0xe5
  807758:	74 1a                	je     807774 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  80775a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80775d:	48 98                	cdqe   
  80775f:	48 c1 e0 05          	shl    rax,0x5
  807763:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807769:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  80776c:	84 c0                	test   al,al
  80776e:	0f 85 41 01 00 00    	jne    8078b5 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807774:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807777:	48 98                	cdqe   
  807779:	48 c1 e0 05          	shl    rax,0x5
  80777d:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807783:	ba 20 00 00 00       	mov    edx,0x20
  807788:	be 00 00 00 00       	mov    esi,0x0
  80778d:	48 89 c7             	mov    rdi,rax
  807790:	e8 ef 1c 00 00       	call   809484 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807795:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807798:	48 98                	cdqe   
  80779a:	48 c1 e0 05          	shl    rax,0x5
  80779e:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8077a4:	ba 0b 00 00 00       	mov    edx,0xb
  8077a9:	be 20 00 00 00       	mov    esi,0x20
  8077ae:	48 89 c7             	mov    rdi,rax
  8077b1:	e8 ce 1c 00 00       	call   809484 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  8077b6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077b9:	48 98                	cdqe   
  8077bb:	48 c1 e0 05          	shl    rax,0x5
  8077bf:	48 8d 90 c0 c8 42 00 	lea    rdx,[rax+0x42c8c0]
  8077c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077ca:	48 89 c6             	mov    rsi,rax
  8077cd:	48 89 d7             	mov    rdi,rdx
  8077d0:	e8 fe 1c 00 00       	call   8094d3 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  8077d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077d9:	48 89 c7             	mov    rdi,rax
  8077dc:	e8 11 1f 00 00       	call   8096f2 <strlen>
  8077e1:	48 63 d0             	movsxd rdx,eax
  8077e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077e7:	48 98                	cdqe   
  8077e9:	48 c1 e0 05          	shl    rax,0x5
  8077ed:	48 01 d0             	add    rax,rdx
  8077f0:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8077f6:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  8077f9:	b8 00 00 00 00       	mov    eax,0x0
  8077fe:	e8 ab f9 ff ff       	call   8071ae <req_cluster>
  807803:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807806:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80780a:	75 0a                	jne    807816 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  80780c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807811:	e9 d6 00 00 00       	jmp    8078ec <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807816:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807819:	89 c2                	mov    edx,eax
  80781b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80781e:	48 98                	cdqe   
  807820:	48 c1 e0 05          	shl    rax,0x5
  807824:	48 05 da c8 42 00    	add    rax,0x42c8da
  80782a:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  80782d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807830:	48 98                	cdqe   
  807832:	48 c1 e0 05          	shl    rax,0x5
  807836:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  80783c:	be 10 00 00 00       	mov    esi,0x10
  807841:	48 89 c7             	mov    rdi,rax
  807844:	e8 24 fa ff ff       	call   80726d <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807849:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80784c:	48 98                	cdqe   
  80784e:	48 c1 e0 05          	shl    rax,0x5
  807852:	48 05 dc c8 42 00    	add    rax,0x42c8dc
  807858:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  80785e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807861:	48 98                	cdqe   
  807863:	48 c1 e0 05          	shl    rax,0x5
  807867:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  80786d:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807870:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807873:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807876:	ff 30                	push   QWORD PTR [rax]
  807878:	e8 7c fa ff ff       	call   8072f9 <add_dot_and_ddot_dir>
  80787d:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807881:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807885:	8b 05 d5 26 00 00    	mov    eax,DWORD PTR [rip+0x26d5]        # 809f60 <clu_sec_balance>
  80788b:	01 d0                	add    eax,edx
  80788d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807890:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807893:	ba 00 02 00 00       	mov    edx,0x200
  807898:	89 c6                	mov    esi,eax
  80789a:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80789f:	e8 56 f9 ff ff       	call   8071fa <write_sec>
                update_fat_and_root();
  8078a4:	b8 00 00 00 00       	mov    eax,0x0
  8078a9:	e8 e7 f9 ff ff       	call   807295 <update_fat_and_root>
                return 0;
  8078ae:	b8 00 00 00 00       	mov    eax,0x0
  8078b3:	eb 37                	jmp    8078ec <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  8078b5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8078b9:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8078bd:	0f 8e 6a fe ff ff    	jle    80772d <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  8078c3:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8078c8:	77 12                	ja     8078dc <mkdir+0x21a>
            cluster=fat[cluster];
  8078ca:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8078ce:	48 98                	cdqe   
  8078d0:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8078d7:	00 
  8078d8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  8078dc:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8078e1:	0f 86 16 fe ff ff    	jbe    8076fd <mkdir+0x3b>
    return -1;
  8078e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8078ec:	c9                   	leave  
  8078ed:	c3                   	ret    

00000000008078ee <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  8078ee:	f3 0f 1e fa          	endbr64 
  8078f2:	55                   	push   rbp
  8078f3:	48 89 e5             	mov    rbp,rsp
  8078f6:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8078fd:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807904:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  80790a:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807910:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807917:	b8 00 00 00 00       	mov    eax,0x0
  80791c:	b9 18 00 00 00       	mov    ecx,0x18
  807921:	48 89 d7             	mov    rdi,rdx
  807924:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807927:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  80792d:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807933:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80793a:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807940:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807947:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  80794a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807951:	eb 3e                	jmp    807991 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807953:	48 8b 15 7e 25 00 00 	mov    rdx,QWORD PTR [rip+0x257e]        # 809ed8 <drv_disk+0x18>
  80795a:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807961:	48 89 c7             	mov    rdi,rax
  807964:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807966:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  80796c:	0f b7 05 f8 0e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20ef8]        # 42886b <superblock+0xb>
  807973:	0f b7 c0             	movzx  eax,ax
  807976:	01 d0                	add    eax,edx
  807978:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  80797e:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807984:	83 c0 01             	add    eax,0x1
  807987:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  80798d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807991:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807994:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80799a:	7c b7                	jl     807953 <read_sec+0x65>
    }
    return 0;
  80799c:	b8 00 00 00 00       	mov    eax,0x0
}
  8079a1:	c9                   	leave  
  8079a2:	c3                   	ret    

00000000008079a3 <rm>:

int rm(driver_args* args)
{
  8079a3:	f3 0f 1e fa          	endbr64 
  8079a7:	55                   	push   rbp
  8079a8:	48 89 e5             	mov    rbp,rsp
  8079ab:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  8079b2:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  8079b9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8079c0:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8079c4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  8079c8:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  8079cf:	b8 00 00 00 00       	mov    eax,0x0
  8079d4:	b9 18 00 00 00       	mov    ecx,0x18
  8079d9:	48 89 d7             	mov    rdi,rdx
  8079dc:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  8079df:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8079e6:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  8079ed:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  8079f4:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  8079fb:	48 89 c7             	mov    rdi,rax
  8079fe:	e8 07 0a 00 00       	call   80840a <get_entry>
  807a03:	83 f8 ff             	cmp    eax,0xffffffff
  807a06:	75 0a                	jne    807a12 <rm+0x6f>
  807a08:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807a0d:	e9 a8 01 00 00       	jmp    807bba <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  807a12:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  807a18:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  807a1c:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807a23:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807a24:	0f b6 05 42 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e42]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807a2b:	0f b6 c0             	movzx  eax,al
  807a2e:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807a32:	0f b7 ca             	movzx  ecx,dx
  807a35:	8b 15 25 25 00 00    	mov    edx,DWORD PTR [rip+0x2525]        # 809f60 <clu_sec_balance>
  807a3b:	01 d1                	add    ecx,edx
  807a3d:	89 c2                	mov    edx,eax
  807a3f:	89 ce                	mov    esi,ecx
  807a41:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807a46:	e8 a3 fe ff ff       	call   8078ee <read_sec>
    dir_table=a_clu_of_dir;
  807a4b:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807a52:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807a53:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807a57:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807a5b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807a62:	e9 89 00 00 00       	jmp    807af0 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807a67:	0f b6 05 ff 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20dff]        # 42886d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807a6e:	0f b6 d0             	movzx  edx,al
  807a71:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807a75:	8b 05 e5 24 00 00    	mov    eax,DWORD PTR [rip+0x24e5]        # 809f60 <clu_sec_balance>
  807a7b:	01 c1                	add    ecx,eax
  807a7d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a81:	89 ce                	mov    esi,ecx
  807a83:	48 89 c7             	mov    rdi,rax
  807a86:	e8 63 fe ff ff       	call   8078ee <read_sec>
        for(;i<16;i++)
  807a8b:	eb 44                	jmp    807ad1 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807a8d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a90:	48 98                	cdqe   
  807a92:	48 c1 e0 05          	shl    rax,0x5
  807a96:	48 89 c2             	mov    rdx,rax
  807a99:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a9d:	48 01 d0             	add    rax,rdx
  807aa0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807aa4:	0f b7 d0             	movzx  edx,ax
  807aa7:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807aae:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807ab1:	39 c2                	cmp    edx,eax
  807ab3:	75 18                	jne    807acd <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807ab5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ab8:	48 98                	cdqe   
  807aba:	48 c1 e0 05          	shl    rax,0x5
  807abe:	48 89 c2             	mov    rdx,rax
  807ac1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ac5:	48 01 d0             	add    rax,rdx
  807ac8:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807acb:	eb 2f                	jmp    807afc <rm+0x159>
        for(;i<16;i++)
  807acd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807ad1:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807ad5:	7e b6                	jle    807a8d <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807ad7:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807adc:	77 12                	ja     807af0 <rm+0x14d>
        {
            cluster=fat[cluster];
  807ade:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807ae2:	48 98                	cdqe   
  807ae4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807aeb:	00 
  807aec:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807af0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807af5:	0f 86 6c ff ff ff    	jbe    807a67 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807afb:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807afc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807aff:	48 98                	cdqe   
  807b01:	48 c1 e0 05          	shl    rax,0x5
  807b05:	48 89 c2             	mov    rdx,rax
  807b08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b0c:	48 01 d0             	add    rax,rdx
  807b0f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807b13:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807b17:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807b1c:	77 10                	ja     807b2e <rm+0x18b>
  807b1e:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807b22:	48 98                	cdqe   
  807b24:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807b2b:	00 
  807b2c:	eb 05                	jmp    807b33 <rm+0x190>
  807b2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b33:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807b37:	eb 2a                	jmp    807b63 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807b39:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807b3d:	48 98                	cdqe   
  807b3f:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807b46:	00 00 00 
        del_clu=pion;
  807b49:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807b4d:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807b51:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807b55:	48 98                	cdqe   
  807b57:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807b5e:	00 
  807b5f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807b63:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807b68:	76 cf                	jbe    807b39 <rm+0x196>
    }
    fat[del_clu]=0;
  807b6a:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807b6e:	48 98                	cdqe   
  807b70:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807b77:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807b7a:	0f b6 05 ec 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20cec]        # 42886d <superblock+0xd>
  807b81:	0f b6 d0             	movzx  edx,al
  807b84:	0f b7 05 e0 0c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20ce0]        # 42886b <superblock+0xb>
  807b8b:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807b8e:	0f af d0             	imul   edx,eax
  807b91:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807b95:	8b 05 c5 23 00 00    	mov    eax,DWORD PTR [rip+0x23c5]        # 809f60 <clu_sec_balance>
  807b9b:	01 c1                	add    ecx,eax
  807b9d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ba1:	89 ce                	mov    esi,ecx
  807ba3:	48 89 c7             	mov    rdi,rax
  807ba6:	e8 4f f6 ff ff       	call   8071fa <write_sec>
    update_fat_and_root();
  807bab:	b8 00 00 00 00       	mov    eax,0x0
  807bb0:	e8 e0 f6 ff ff       	call   807295 <update_fat_and_root>
    return 0;
  807bb5:	b8 00 00 00 00       	mov    eax,0x0
}
  807bba:	c9                   	leave  
  807bbb:	c3                   	ret    

0000000000807bbc <find>:
int find_f=0;
int find(char *name)
{
  807bbc:	f3 0f 1e fa          	endbr64 
  807bc0:	55                   	push   rbp
  807bc1:	48 89 e5             	mov    rbp,rsp
  807bc4:	48 83 ec 30          	sub    rsp,0x30
  807bc8:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807bcc:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807bd3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807bda:	48 c7 45 f0 c0 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c8c0
  807be1:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807be2:	0f b7 05 d1 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24cd1]        # 42c8ba <cur_dir+0x1a>
  807be9:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807bed:	0f b7 05 c6 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24cc6]        # 42c8ba <cur_dir+0x1a>
  807bf4:	66 85 c0             	test   ax,ax
  807bf7:	75 0a                	jne    807c03 <find+0x47>
        dir_table=root_dir;
  807bf9:	48 c7 45 f0 a0 88 42 	mov    QWORD PTR [rbp-0x10],0x4288a0
  807c00:	00 
  807c01:	eb 2b                	jmp    807c2e <find+0x72>
    else {
        max_files=16;
  807c03:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807c0a:	0f b6 05 5c 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c5c]        # 42886d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807c11:	0f b6 d0             	movzx  edx,al
  807c14:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807c18:	8b 05 42 23 00 00    	mov    eax,DWORD PTR [rip+0x2342]        # 809f60 <clu_sec_balance>
  807c1e:	01 c1                	add    ecx,eax
  807c20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c24:	89 ce                	mov    esi,ecx
  807c26:	48 89 c7             	mov    rdi,rax
  807c29:	e8 c0 fc ff ff       	call   8078ee <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807c2e:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807c35:	eb 57                	jmp    807c8e <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807c37:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c3a:	48 98                	cdqe   
  807c3c:	48 c1 e0 05          	shl    rax,0x5
  807c40:	48 89 c2             	mov    rdx,rax
  807c43:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c47:	48 01 d0             	add    rax,rdx
  807c4a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c4d:	84 c0                	test   al,al
  807c4f:	74 38                	je     807c89 <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807c51:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c54:	48 98                	cdqe   
  807c56:	48 c1 e0 05          	shl    rax,0x5
  807c5a:	48 89 c2             	mov    rdx,rax
  807c5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c61:	48 01 d0             	add    rax,rdx
  807c64:	48 89 c1             	mov    rcx,rax
  807c67:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c6b:	ba 0b 00 00 00       	mov    edx,0xb
  807c70:	48 89 c6             	mov    rsi,rax
  807c73:	48 89 cf             	mov    rdi,rcx
  807c76:	e8 a4 17 00 00       	call   80941f <memcmp>
  807c7b:	85 c0                	test   eax,eax
  807c7d:	75 0b                	jne    807c8a <find+0xce>
            {
                return index+i;
  807c7f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807c82:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c85:	01 d0                	add    eax,edx
  807c87:	eb 71                	jmp    807cfa <find+0x13e>
                continue;
  807c89:	90                   	nop
        for(int i=0;i<max_files;i++)
  807c8a:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807c8e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c91:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807c94:	7c a1                	jl     807c37 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807c96:	0f b7 05 1d 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24c1d]        # 42c8ba <cur_dir+0x1a>
  807c9d:	66 85 c0             	test   ax,ax
  807ca0:	75 07                	jne    807ca9 <find+0xed>
            return -1;
  807ca2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ca7:	eb 51                	jmp    807cfa <find+0x13e>
        else if(cluster<FAT_EOF)
  807ca9:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807cae:	77 3a                	ja     807cea <find+0x12e>
        {
            index+=16;
  807cb0:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807cb4:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807cb8:	48 98                	cdqe   
  807cba:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807cc1:	00 
  807cc2:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807cc6:	0f b6 05 a0 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ba0]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807ccd:	0f b6 d0             	movzx  edx,al
  807cd0:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807cd4:	8b 05 86 22 00 00    	mov    eax,DWORD PTR [rip+0x2286]        # 809f60 <clu_sec_balance>
  807cda:	01 c1                	add    ecx,eax
  807cdc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ce0:	89 ce                	mov    esi,ecx
  807ce2:	48 89 c7             	mov    rdi,rax
  807ce5:	e8 04 fc ff ff       	call   8078ee <read_sec>
        }
    }while(cluster<FAT_EOF);
  807cea:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807cef:	0f 86 39 ff ff ff    	jbe    807c2e <find+0x72>
    return -1;
  807cf5:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807cfa:	c9                   	leave  
  807cfb:	c3                   	ret    

0000000000807cfc <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807cfc:	f3 0f 1e fa          	endbr64 
  807d00:	55                   	push   rbp
  807d01:	48 89 e5             	mov    rbp,rsp
  807d04:	41 57                	push   r15
  807d06:	41 56                	push   r14
  807d08:	41 55                	push   r13
  807d0a:	41 54                	push   r12
  807d0c:	53                   	push   rbx
  807d0d:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807d14:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807d1b:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807d22:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807d28:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807d2e:	48 89 e0             	mov    rax,rsp
  807d31:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807d34:	bf 00 00 00 00       	mov    edi,0x0
  807d39:	e8 7e fe ff ff       	call   807bbc <find>
  807d3e:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807d41:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807d45:	74 09                	je     807d50 <read_file_byname+0x54>
  807d47:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807d4e:	79 0a                	jns    807d5a <read_file_byname+0x5e>
        return -1;
  807d50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807d55:	e9 ea 02 00 00       	jmp    808044 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807d5a:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807d61:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  807d68:	00 
    int in_root=1;
  807d69:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807d70:	0f b7 05 43 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b43]        # 42c8ba <cur_dir+0x1a>
  807d77:	66 85 c0             	test   ax,ax
  807d7a:	74 40                	je     807dbc <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807d7c:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807d83:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807d8a:	0f b6 05 dc 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20adc]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807d91:	0f b6 c0             	movzx  eax,al
  807d94:	0f b7 15 1f 4b c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24b1f]        # 42c8ba <cur_dir+0x1a>
  807d9b:	0f b7 ca             	movzx  ecx,dx
  807d9e:	8b 15 bc 21 00 00    	mov    edx,DWORD PTR [rip+0x21bc]        # 809f60 <clu_sec_balance>
  807da4:	01 d1                	add    ecx,edx
  807da6:	89 c2                	mov    edx,eax
  807da8:	89 ce                	mov    esi,ecx
  807daa:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807daf:	e8 3a fb ff ff       	call   8078ee <read_sec>
        dir_table=a_clu_of_dir;
  807db4:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  807dbb:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807dbc:	0f b7 05 f7 4a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24af7]        # 42c8ba <cur_dir+0x1a>
  807dc3:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807dc7:	eb 41                	jmp    807e0a <read_file_byname+0x10e>
        index-=16;
  807dc9:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807dcd:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807dd2:	77 36                	ja     807e0a <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807dd4:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807dd8:	48 98                	cdqe   
  807dda:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807de1:	00 
  807de2:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807de6:	0f b6 05 80 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a80]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807ded:	0f b6 d0             	movzx  edx,al
  807df0:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807df4:	8b 05 66 21 00 00    	mov    eax,DWORD PTR [rip+0x2166]        # 809f60 <clu_sec_balance>
  807dfa:	01 c1                	add    ecx,eax
  807dfc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807e00:	89 ce                	mov    esi,ecx
  807e02:	48 89 c7             	mov    rdi,rax
  807e05:	e8 e4 fa ff ff       	call   8078ee <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807e0a:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807e0e:	75 0d                	jne    807e1d <read_file_byname+0x121>
  807e10:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807e14:	7e 07                	jle    807e1d <read_file_byname+0x121>
  807e16:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807e1b:	76 ac                	jbe    807dc9 <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807e1d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807e20:	48 98                	cdqe   
  807e22:	48 c1 e0 05          	shl    rax,0x5
  807e26:	48 89 c2             	mov    rdx,rax
  807e29:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807e2d:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807e31:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807e34:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807e38:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807e3f:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807e46:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807e4a:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807e4e:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807e52:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807e56:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807e5a:	0f b7 c0             	movzx  eax,ax
  807e5d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807e60:	0f b7 05 04 0a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20a04]        # 42886b <superblock+0xb>
  807e67:	0f b7 d0             	movzx  edx,ax
  807e6a:	0f b6 05 fc 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc209fc]        # 42886d <superblock+0xd>
  807e71:	0f b6 c0             	movzx  eax,al
  807e74:	0f af c2             	imul   eax,edx
  807e77:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807e7a:	eb 25                	jmp    807ea1 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807e7c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807e7f:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807e85:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807e88:	48 98                	cdqe   
  807e8a:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807e91:	00 
  807e92:	98                   	cwde   
  807e93:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  807e96:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807e9c:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807e9f:	7c 0d                	jl     807eae <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807ea1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807ea7:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807eaa:	7d d0                	jge    807e7c <read_file_byname+0x180>
  807eac:	eb 01                	jmp    807eaf <read_file_byname+0x1b3>
            break;
  807eae:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807eaf:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807eb6:	7e 15                	jle    807ecd <read_file_byname+0x1d1>
  807eb8:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807ebe:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807ec1:	7c 0a                	jl     807ecd <read_file_byname+0x1d1>
        return -1;//pos out of range
  807ec3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ec8:	e9 77 01 00 00       	jmp    808044 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  807ecd:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ed0:	48 63 d0             	movsxd rdx,eax
  807ed3:	48 83 ea 01          	sub    rdx,0x1
  807ed7:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807edb:	48 63 d0             	movsxd rdx,eax
  807ede:	49 89 d6             	mov    r14,rdx
  807ee1:	41 bf 00 00 00 00    	mov    r15d,0x0
  807ee7:	48 63 d0             	movsxd rdx,eax
  807eea:	49 89 d4             	mov    r12,rdx
  807eed:	41 bd 00 00 00 00    	mov    r13d,0x0
  807ef3:	48 98                	cdqe   
  807ef5:	ba 10 00 00 00       	mov    edx,0x10
  807efa:	48 83 ea 01          	sub    rdx,0x1
  807efe:	48 01 d0             	add    rax,rdx
  807f01:	be 10 00 00 00       	mov    esi,0x10
  807f06:	ba 00 00 00 00       	mov    edx,0x0
  807f0b:	48 f7 f6             	div    rsi
  807f0e:	48 6b c0 10          	imul   rax,rax,0x10
  807f12:	48 89 c1             	mov    rcx,rax
  807f15:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  807f1c:	48 89 e2             	mov    rdx,rsp
  807f1f:	48 29 ca             	sub    rdx,rcx
  807f22:	48 39 d4             	cmp    rsp,rdx
  807f25:	74 12                	je     807f39 <read_file_byname+0x23d>
  807f27:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  807f2e:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  807f35:	00 00 
  807f37:	eb e9                	jmp    807f22 <read_file_byname+0x226>
  807f39:	48 89 c2             	mov    rdx,rax
  807f3c:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807f42:	48 29 d4             	sub    rsp,rdx
  807f45:	48 89 c2             	mov    rdx,rax
  807f48:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807f4e:	48 85 d2             	test   rdx,rdx
  807f51:	74 10                	je     807f63 <read_file_byname+0x267>
  807f53:	25 ff 0f 00 00       	and    eax,0xfff
  807f58:	48 83 e8 08          	sub    rax,0x8
  807f5c:	48 01 e0             	add    rax,rsp
  807f5f:	48 83 08 00          	or     QWORD PTR [rax],0x0
  807f63:	48 89 e0             	mov    rax,rsp
  807f66:	48 83 c0 00          	add    rax,0x0
  807f6a:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  807f6e:	0f b6 05 f8 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208f8]        # 42886d <superblock+0xd>
  807f75:	0f b6 d0             	movzx  edx,al
  807f78:	8b 0d e2 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1fe2]        # 809f60 <clu_sec_balance>
  807f7e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807f81:	01 c1                	add    ecx,eax
  807f83:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807f87:	89 ce                	mov    esi,ecx
  807f89:	48 89 c7             	mov    rdi,rax
  807f8c:	e8 5d f9 ff ff       	call   8078ee <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  807f91:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f94:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807f9a:	89 c2                	mov    edx,eax
  807f9c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fa2:	48 63 c8             	movsxd rcx,eax
  807fa5:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807fa9:	48 01 c1             	add    rcx,rax
  807fac:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807fb3:	48 89 ce             	mov    rsi,rcx
  807fb6:	48 89 c7             	mov    rdi,rax
  807fb9:	e8 17 14 00 00       	call   8093d5 <memcpy>
    dist+=cluster_size-pos;
  807fbe:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fc1:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807fc7:	48 98                	cdqe   
  807fc9:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  807fd0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fd3:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807fd9:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807fdf:	eb 4c                	jmp    80802d <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  807fe1:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807fe4:	48 98                	cdqe   
  807fe6:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807fed:	00 
  807fee:	98                   	cwde   
  807fef:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  807ff2:	0f b6 05 74 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20874]        # 42886d <superblock+0xd>
  807ff9:	0f b6 d0             	movzx  edx,al
  807ffc:	8b 0d 5e 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f5e]        # 809f60 <clu_sec_balance>
  808002:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808005:	01 c1                	add    ecx,eax
  808007:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80800e:	89 ce                	mov    esi,ecx
  808010:	48 89 c7             	mov    rdi,rax
  808013:	e8 d6 f8 ff ff       	call   8078ee <read_sec>
        dist+=cluster_size;
  808018:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80801b:	48 98                	cdqe   
  80801d:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808024:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808027:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  80802d:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808034:	7f 09                	jg     80803f <read_file_byname+0x343>
  808036:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  80803d:	7f a2                	jg     807fe1 <read_file_byname+0x2e5>
    }
    return 0;
  80803f:	b8 00 00 00 00       	mov    eax,0x0
  808044:	48 89 dc             	mov    rsp,rbx
    
}
  808047:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80804b:	5b                   	pop    rbx
  80804c:	41 5c                	pop    r12
  80804e:	41 5d                	pop    r13
  808050:	41 5e                	pop    r14
  808052:	41 5f                	pop    r15
  808054:	5d                   	pop    rbp
  808055:	c3                   	ret    

0000000000808056 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  808056:	f3 0f 1e fa          	endbr64 
  80805a:	55                   	push   rbp
  80805b:	48 89 e5             	mov    rbp,rsp
  80805e:	41 57                	push   r15
  808060:	41 56                	push   r14
  808062:	41 55                	push   r13
  808064:	41 54                	push   r12
  808066:	53                   	push   rbx
  808067:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  80806e:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808075:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80807c:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808082:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808088:	48 89 e0             	mov    rax,rsp
  80808b:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80808e:	bf 00 00 00 00       	mov    edi,0x0
  808093:	e8 24 fb ff ff       	call   807bbc <find>
  808098:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80809b:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80809f:	74 09                	je     8080aa <write_file_byname+0x54>
  8080a1:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8080a8:	79 0a                	jns    8080b4 <write_file_byname+0x5e>
        return -1;
  8080aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8080af:	e9 1e 03 00 00       	jmp    8083d2 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  8080b4:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  8080bb:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  8080c2:	00 
    int in_root=1;
  8080c3:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  8080ca:	0f b7 05 e9 47 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc247e9]        # 42c8ba <cur_dir+0x1a>
  8080d1:	66 85 c0             	test   ax,ax
  8080d4:	74 40                	je     808116 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  8080d6:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  8080dd:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8080e4:	0f b6 05 82 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20782]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  8080eb:	0f b6 c0             	movzx  eax,al
  8080ee:	0f b7 15 c5 47 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc247c5]        # 42c8ba <cur_dir+0x1a>
  8080f5:	0f b7 ca             	movzx  ecx,dx
  8080f8:	8b 15 62 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e62]        # 809f60 <clu_sec_balance>
  8080fe:	01 d1                	add    ecx,edx
  808100:	89 c2                	mov    edx,eax
  808102:	89 ce                	mov    esi,ecx
  808104:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  808109:	e8 e0 f7 ff ff       	call   8078ee <read_sec>
        dir_table=a_clu_of_dir;
  80810e:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  808115:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808116:	0f b7 05 9d 47 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2479d]        # 42c8ba <cur_dir+0x1a>
  80811d:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808121:	eb 41                	jmp    808164 <write_file_byname+0x10e>
        index-=16;
  808123:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  808127:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80812c:	77 36                	ja     808164 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  80812e:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808132:	48 98                	cdqe   
  808134:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80813b:	00 
  80813c:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808140:	0f b6 05 26 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20726]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  808147:	0f b6 d0             	movzx  edx,al
  80814a:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  80814e:	8b 05 0c 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e0c]        # 809f60 <clu_sec_balance>
  808154:	01 c1                	add    ecx,eax
  808156:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80815a:	89 ce                	mov    esi,ecx
  80815c:	48 89 c7             	mov    rdi,rax
  80815f:	e8 8a f7 ff ff       	call   8078ee <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808164:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808168:	75 0d                	jne    808177 <write_file_byname+0x121>
  80816a:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  80816e:	7e 07                	jle    808177 <write_file_byname+0x121>
  808170:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808175:	76 ac                	jbe    808123 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808177:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80817a:	48 98                	cdqe   
  80817c:	48 c1 e0 05          	shl    rax,0x5
  808180:	48 89 c2             	mov    rdx,rax
  808183:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808187:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80818b:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80818e:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808192:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  808199:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8081a0:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8081a4:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8081a8:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  8081ac:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  8081b0:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  8081b4:	0f b7 c0             	movzx  eax,ax
  8081b7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  8081ba:	0f b7 05 aa 06 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc206aa]        # 42886b <superblock+0xb>
  8081c1:	0f b7 d0             	movzx  edx,ax
  8081c4:	0f b6 05 a2 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc206a2]        # 42886d <superblock+0xd>
  8081cb:	0f b6 c0             	movzx  eax,al
  8081ce:	0f af c2             	imul   eax,edx
  8081d1:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8081d4:	eb 25                	jmp    8081fb <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8081d6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081d9:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  8081df:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8081e5:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8081e8:	7c 1e                	jl     808208 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  8081ea:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8081ed:	48 98                	cdqe   
  8081ef:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8081f6:	00 
  8081f7:	98                   	cwde   
  8081f8:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8081fb:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808201:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808204:	7d d0                	jge    8081d6 <write_file_byname+0x180>
  808206:	eb 01                	jmp    808209 <write_file_byname+0x1b3>
            break;
  808208:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808209:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808210:	7e 15                	jle    808227 <write_file_byname+0x1d1>
  808212:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808218:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80821b:	7c 0a                	jl     808227 <write_file_byname+0x1d1>
        return -1;//pos out of range
  80821d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808222:	e9 ab 01 00 00       	jmp    8083d2 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  808227:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80822a:	48 63 d0             	movsxd rdx,eax
  80822d:	48 83 ea 01          	sub    rdx,0x1
  808231:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808235:	48 63 d0             	movsxd rdx,eax
  808238:	49 89 d6             	mov    r14,rdx
  80823b:	41 bf 00 00 00 00    	mov    r15d,0x0
  808241:	48 63 d0             	movsxd rdx,eax
  808244:	49 89 d4             	mov    r12,rdx
  808247:	41 bd 00 00 00 00    	mov    r13d,0x0
  80824d:	48 98                	cdqe   
  80824f:	ba 10 00 00 00       	mov    edx,0x10
  808254:	48 83 ea 01          	sub    rdx,0x1
  808258:	48 01 d0             	add    rax,rdx
  80825b:	be 10 00 00 00       	mov    esi,0x10
  808260:	ba 00 00 00 00       	mov    edx,0x0
  808265:	48 f7 f6             	div    rsi
  808268:	48 6b c0 10          	imul   rax,rax,0x10
  80826c:	48 89 c1             	mov    rcx,rax
  80826f:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808276:	48 89 e2             	mov    rdx,rsp
  808279:	48 29 ca             	sub    rdx,rcx
  80827c:	48 39 d4             	cmp    rsp,rdx
  80827f:	74 12                	je     808293 <write_file_byname+0x23d>
  808281:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808288:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  80828f:	00 00 
  808291:	eb e9                	jmp    80827c <write_file_byname+0x226>
  808293:	48 89 c2             	mov    rdx,rax
  808296:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80829c:	48 29 d4             	sub    rsp,rdx
  80829f:	48 89 c2             	mov    rdx,rax
  8082a2:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8082a8:	48 85 d2             	test   rdx,rdx
  8082ab:	74 10                	je     8082bd <write_file_byname+0x267>
  8082ad:	25 ff 0f 00 00       	and    eax,0xfff
  8082b2:	48 83 e8 08          	sub    rax,0x8
  8082b6:	48 01 e0             	add    rax,rsp
  8082b9:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8082bd:	48 89 e0             	mov    rax,rsp
  8082c0:	48 83 c0 00          	add    rax,0x0
  8082c4:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  8082c8:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8082cf:	0f 8e a2 00 00 00    	jle    808377 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  8082d5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082d8:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8082de:	89 c2                	mov    edx,eax
  8082e0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8082e6:	48 63 c8             	movsxd rcx,eax
  8082e9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082ed:	48 01 c1             	add    rcx,rax
  8082f0:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8082f7:	48 89 c6             	mov    rsi,rax
  8082fa:	48 89 cf             	mov    rdi,rcx
  8082fd:	e8 d3 10 00 00       	call   8093d5 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808302:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808305:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80830b:	89 c2                	mov    edx,eax
  80830d:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  808310:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808314:	89 ce                	mov    esi,ecx
  808316:	48 89 c7             	mov    rdi,rax
  808319:	e8 dc ee ff ff       	call   8071fa <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  80831e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808321:	48 98                	cdqe   
  808323:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80832a:	00 
  80832b:	98                   	cwde   
  80832c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  80832f:	eb 46                	jmp    808377 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808331:	8b 15 29 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c29]        # 809f60 <clu_sec_balance>
  808337:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80833a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80833d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808340:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808347:	89 ce                	mov    esi,ecx
  808349:	48 89 c7             	mov    rdi,rax
  80834c:	e8 a9 ee ff ff       	call   8071fa <write_sec>
        src+=cluster_size;
  808351:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808354:	48 98                	cdqe   
  808356:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  80835d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808360:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808366:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808369:	48 98                	cdqe   
  80836b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808372:	00 
  808373:	98                   	cwde   
  808374:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808377:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  80837e:	7f 0b                	jg     80838b <write_file_byname+0x335>
  808380:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808386:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808389:	7d a6                	jge    808331 <write_file_byname+0x2db>
    }
    if(len>0)
  80838b:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808392:	7e 39                	jle    8083cd <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808394:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80839a:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  8083a1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083a5:	48 89 ce             	mov    rsi,rcx
  8083a8:	48 89 c7             	mov    rdi,rax
  8083ab:	e8 25 10 00 00       	call   8093d5 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  8083b0:	8b 15 aa 1b 00 00    	mov    edx,DWORD PTR [rip+0x1baa]        # 809f60 <clu_sec_balance>
  8083b6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8083b9:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8083bc:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8083bf:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083c3:	89 ce                	mov    esi,ecx
  8083c5:	48 89 c7             	mov    rdi,rax
  8083c8:	e8 2d ee ff ff       	call   8071fa <write_sec>
    }
    return 0;
  8083cd:	b8 00 00 00 00       	mov    eax,0x0
  8083d2:	48 89 dc             	mov    rsp,rbx

}
  8083d5:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8083d9:	5b                   	pop    rbx
  8083da:	41 5c                	pop    r12
  8083dc:	41 5d                	pop    r13
  8083de:	41 5e                	pop    r14
  8083e0:	41 5f                	pop    r15
  8083e2:	5d                   	pop    rbp
  8083e3:	c3                   	ret    

00000000008083e4 <file_exist>:


int file_exist(dir_entry entry)
{
  8083e4:	f3 0f 1e fa          	endbr64 
  8083e8:	55                   	push   rbp
  8083e9:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8083ec:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8083f0:	3c e5                	cmp    al,0xe5
  8083f2:	74 08                	je     8083fc <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8083f4:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8083f8:	84 c0                	test   al,al
  8083fa:	75 07                	jne    808403 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  8083fc:	b8 00 00 00 00       	mov    eax,0x0
  808401:	eb 05                	jmp    808408 <file_exist+0x24>

    }
    return 1;
  808403:	b8 01 00 00 00       	mov    eax,0x1
}
  808408:	5d                   	pop    rbp
  808409:	c3                   	ret    

000000000080840a <get_entry>:
int get_entry(driver_args* args)
{
  80840a:	f3 0f 1e fa          	endbr64 
  80840e:	55                   	push   rbp
  80840f:	48 89 e5             	mov    rbp,rsp
  808412:	53                   	push   rbx
  808413:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  80841a:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808421:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808428:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80842c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808430:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808437:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80843e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808441:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808445:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  808449:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80844d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808451:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808458:	e9 2c 01 00 00       	jmp    808589 <get_entry+0x17f>
    {
        if(*name=='/')
  80845d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808461:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808464:	3c 2f                	cmp    al,0x2f
  808466:	0f 85 18 01 00 00    	jne    808584 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  80846c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808470:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808474:	48 83 f8 0b          	cmp    rax,0xb
  808478:	7e 0a                	jle    808484 <get_entry+0x7a>
  80847a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80847f:	e9 50 02 00 00       	jmp    8086d4 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808484:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808488:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  80848c:	89 c2                	mov    edx,eax
  80848e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808492:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808499:	48 89 ce             	mov    rsi,rcx
  80849c:	48 89 c7             	mov    rdi,rax
  80849f:	e8 31 0f 00 00       	call   8093d5 <memcpy>
            cur_dir=dir;
  8084a4:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8084a8:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8084ac:	48 89 05 ed 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc243ed],rax        # 42c8a0 <cur_dir>
  8084b3:	48 89 15 ee 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc243ee],rdx        # 42c8a8 <cur_dir+0x8>
  8084ba:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8084be:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8084c2:	48 89 05 e7 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc243e7],rax        # 42c8b0 <cur_dir+0x10>
  8084c9:	48 89 15 e8 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc243e8],rdx        # 42c8b8 <cur_dir+0x18>
            format_name(nametmp);
  8084d0:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8084d7:	48 89 c7             	mov    rdi,rax
  8084da:	e8 c3 eb ff ff       	call   8070a2 <format_name>
            index= find(nametmp);
  8084df:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8084e6:	48 89 c7             	mov    rdi,rax
  8084e9:	e8 ce f6 ff ff       	call   807bbc <find>
  8084ee:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8084f1:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8084f5:	75 0a                	jne    808501 <get_entry+0xf7>
  8084f7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8084fc:	e9 d3 01 00 00       	jmp    8086d4 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808501:	0f b7 05 b2 43 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc243b2]        # 42c8ba <cur_dir+0x1a>
  808508:	66 85 c0             	test   ax,ax
  80850b:	75 31                	jne    80853e <get_entry+0x134>
                dir=root_dir[index];
  80850d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808510:	48 98                	cdqe   
  808512:	48 c1 e0 05          	shl    rax,0x5
  808516:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  80851d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808520:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808524:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808528:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80852c:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808530:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808534:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808538:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80853c:	eb 3a                	jmp    808578 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  80853e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808541:	99                   	cdq    
  808542:	c1 ea 1c             	shr    edx,0x1c
  808545:	01 d0                	add    eax,edx
  808547:	83 e0 0f             	and    eax,0xf
  80854a:	29 d0                	sub    eax,edx
  80854c:	48 98                	cdqe   
  80854e:	48 c1 e0 05          	shl    rax,0x5
  808552:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  808559:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80855c:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808560:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808564:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808568:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80856c:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808570:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808574:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808578:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80857c:	48 83 c0 01          	add    rax,0x1
  808580:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808584:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  808589:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80858d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808590:	84 c0                	test   al,al
  808592:	0f 85 c5 fe ff ff    	jne    80845d <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808598:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80859c:	48 89 c7             	mov    rdi,rax
  80859f:	e8 fe ea ff ff       	call   8070a2 <format_name>
    index= find(p);
  8085a4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8085a8:	48 89 c7             	mov    rdi,rax
  8085ab:	e8 0c f6 ff ff       	call   807bbc <find>
  8085b0:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  8085b3:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8085b7:	75 0a                	jne    8085c3 <get_entry+0x1b9>
  8085b9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8085be:	e9 11 01 00 00       	jmp    8086d4 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  8085c3:	0f b7 05 f0 42 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc242f0]        # 42c8ba <cur_dir+0x1a>
  8085ca:	66 85 c0             	test   ax,ax
  8085cd:	75 31                	jne    808600 <get_entry+0x1f6>
        entry=root_dir[index];
  8085cf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8085d2:	48 98                	cdqe   
  8085d4:	48 c1 e0 05          	shl    rax,0x5
  8085d8:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8085df:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8085e2:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8085e6:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8085ea:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8085ee:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8085f2:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8085f6:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8085fa:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8085fe:	eb 3a                	jmp    80863a <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808600:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808603:	99                   	cdq    
  808604:	c1 ea 1c             	shr    edx,0x1c
  808607:	01 d0                	add    eax,edx
  808609:	83 e0 0f             	and    eax,0xf
  80860c:	29 d0                	sub    eax,edx
  80860e:	48 98                	cdqe   
  808610:	48 c1 e0 05          	shl    rax,0x5
  808614:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  80861b:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80861e:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808622:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808626:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80862a:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80862e:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808632:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808636:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  80863a:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  80863e:	0f b7 c0             	movzx  eax,ax
  808641:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808647:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80864e:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808655:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  80865c:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808660:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808664:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80866b:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808672:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808676:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80867a:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808681:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808688:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  80868c:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808690:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808697:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80869e:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  8086a2:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  8086a6:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  8086ad:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  8086b4:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  8086b8:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  8086bc:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  8086c0:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  8086c4:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  8086c8:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  8086cf:	b8 00 00 00 00       	mov    eax,0x0
}
  8086d4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8086d8:	c9                   	leave  
  8086d9:	c3                   	ret    

00000000008086da <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  8086da:	f3 0f 1e fa          	endbr64 
  8086de:	55                   	push   rbp
  8086df:	48 89 e5             	mov    rbp,rsp
  8086e2:	48 83 ec 20          	sub    rsp,0x20
  8086e6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8086ea:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8086ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086f2:	be 2f 00 00 00       	mov    esi,0x2f
  8086f7:	48 89 c7             	mov    rdi,rax
  8086fa:	e8 18 0e 00 00       	call   809517 <strtok>
  8086ff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808703:	eb 1b                	jmp    808720 <get_fname+0x46>
    {
        prev=ptr;
  808705:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808709:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  80870d:	be 2f 00 00 00       	mov    esi,0x2f
  808712:	bf 00 00 00 00       	mov    edi,0x0
  808717:	e8 fb 0d 00 00       	call   809517 <strtok>
  80871c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808720:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808725:	75 de                	jne    808705 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808727:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80872b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80872f:	48 89 d6             	mov    rsi,rdx
  808732:	48 89 c7             	mov    rdi,rax
  808735:	e8 99 0d 00 00       	call   8094d3 <strcpy>
}
  80873a:	90                   	nop
  80873b:	c9                   	leave  
  80873c:	c3                   	ret    

000000000080873d <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  80873d:	f3 0f 1e fa          	endbr64 
  808741:	55                   	push   rbp
  808742:	48 89 e5             	mov    rbp,rsp
  808745:	48 83 ec 60          	sub    rsp,0x60
  808749:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  80874d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808751:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808754:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808757:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80875b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80875e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808761:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808765:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808768:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  80876c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808770:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808773:	48 98                	cdqe   
  808775:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808779:	0f b7 05 eb 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc200eb]        # 42886b <superblock+0xb>
  808780:	0f b7 f0             	movzx  esi,ax
  808783:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808786:	99                   	cdq    
  808787:	f7 fe                	idiv   esi
  808789:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  80878c:	0f b7 05 d8 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc200d8]        # 42886b <superblock+0xb>
  808793:	0f b7 c8             	movzx  ecx,ax
  808796:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808799:	99                   	cdq    
  80879a:	f7 f9                	idiv   ecx
  80879c:	89 d0                	mov    eax,edx
  80879e:	85 c0                	test   eax,eax
  8087a0:	0f 95 c0             	setne  al
  8087a3:	0f b6 c0             	movzx  eax,al
  8087a6:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  8087a9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  8087b0:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  8087b4:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  8087b8:	0f b7 05 ac 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc200ac]        # 42886b <superblock+0xb>
  8087bf:	0f b7 f8             	movzx  edi,ax
  8087c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8087c5:	99                   	cdq    
  8087c6:	f7 ff                	idiv   edi
  8087c8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8087cb:	eb 16                	jmp    8087e3 <read_file+0xa6>
    {
         clu=fat[clu];
  8087cd:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8087d1:	48 98                	cdqe   
  8087d3:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8087da:	00 
  8087db:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8087df:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  8087e3:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8087e8:	77 06                	ja     8087f0 <read_file+0xb3>
  8087ea:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8087ee:	7f dd                	jg     8087cd <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  8087f0:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8087f4:	7e 0a                	jle    808800 <read_file+0xc3>
  8087f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8087fb:	e9 cd 00 00 00       	jmp    8088cd <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808800:	0f b7 05 64 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20064]        # 42886b <superblock+0xb>
  808807:	0f b7 c8             	movzx  ecx,ax
  80880a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80880d:	99                   	cdq    
  80880e:	f7 f9                	idiv   ecx
  808810:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808813:	0f b6 05 53 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20053]        # 42886d <superblock+0xd>
  80881a:	0f b6 d0             	movzx  edx,al
  80881d:	0f b7 05 47 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20047]        # 42886b <superblock+0xb>
  808824:	0f b7 c0             	movzx  eax,ax
  808827:	0f af c2             	imul   eax,edx
  80882a:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  80882d:	e9 89 00 00 00       	jmp    8088bb <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808832:	0f b6 05 34 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20034]        # 42886d <superblock+0xd>
  808839:	0f b6 c0             	movzx  eax,al
  80883c:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808840:	8b 15 1a 17 00 00    	mov    edx,DWORD PTR [rip+0x171a]        # 809f60 <clu_sec_balance>
  808846:	01 d1                	add    ecx,edx
  808848:	89 c2                	mov    edx,eax
  80884a:	89 ce                	mov    esi,ecx
  80884c:	bf e0 0a 43 00       	mov    edi,0x430ae0
  808851:	e8 98 f0 ff ff       	call   8078ee <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808856:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808859:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  80885c:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  80885f:	39 c2                	cmp    edx,eax
  808861:	0f 4e c2             	cmovle eax,edx
  808864:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808867:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80886a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80886d:	48 98                	cdqe   
  80886f:	48 8d 88 e0 0a 43 00 	lea    rcx,[rax+0x430ae0]
  808876:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80887a:	48 89 ce             	mov    rsi,rcx
  80887d:	48 89 c7             	mov    rdi,rax
  808880:	e8 50 0b 00 00       	call   8093d5 <memcpy>
        n++;
  808885:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808889:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80888c:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  80888f:	48 98                	cdqe   
  808891:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808895:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808899:	7e 07                	jle    8088a2 <read_file+0x165>
  80889b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  8088a2:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8088a6:	48 98                	cdqe   
  8088a8:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8088af:	00 
  8088b0:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  8088b4:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8088b9:	77 0e                	ja     8088c9 <read_file+0x18c>
    while(n<c)
  8088bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8088be:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  8088c1:	0f 8c 6b ff ff ff    	jl     808832 <read_file+0xf5>
  8088c7:	eb 01                	jmp    8088ca <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  8088c9:	90                   	nop
    }
    return n;
  8088ca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  8088cd:	c9                   	leave  
  8088ce:	c3                   	ret    

00000000008088cf <write_file>:
int write_file(driver_args* args)
{
  8088cf:	f3 0f 1e fa          	endbr64 
  8088d3:	55                   	push   rbp
  8088d4:	48 89 e5             	mov    rbp,rsp
  8088d7:	48 83 ec 50          	sub    rsp,0x50
  8088db:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  8088df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088e3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8088e6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  8088e9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088ed:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8088f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8088f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088f7:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8088fa:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  8088fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808902:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808905:	48 98                	cdqe   
  808907:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  80890b:	0f b7 05 59 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff59]        # 42886b <superblock+0xb>
  808912:	0f b7 f0             	movzx  esi,ax
  808915:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808918:	99                   	cdq    
  808919:	f7 fe                	idiv   esi
  80891b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  80891e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808921:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808927:	85 c0                	test   eax,eax
  808929:	0f 48 c2             	cmovs  eax,edx
  80892c:	c1 f8 09             	sar    eax,0x9
  80892f:	89 c1                	mov    ecx,eax
  808931:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808934:	99                   	cdq    
  808935:	c1 ea 17             	shr    edx,0x17
  808938:	01 d0                	add    eax,edx
  80893a:	25 ff 01 00 00       	and    eax,0x1ff
  80893f:	29 d0                	sub    eax,edx
  808941:	01 c8                	add    eax,ecx
  808943:	85 c0                	test   eax,eax
  808945:	0f 95 c0             	setne  al
  808948:	0f b6 c0             	movzx  eax,al
  80894b:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  80894e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808955:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808959:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  80895d:	eb 16                	jmp    808975 <write_file+0xa6>
  80895f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808963:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808967:	48 98                	cdqe   
  808969:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808970:	00 
  808971:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808975:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80897a:	77 06                	ja     808982 <write_file+0xb3>
  80897c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808980:	7f dd                	jg     80895f <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808982:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808986:	7e 52                	jle    8089da <write_file+0x10b>
  808988:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80898d:	eb 59                	jmp    8089e8 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  80898f:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808993:	8b 05 c7 15 00 00    	mov    eax,DWORD PTR [rip+0x15c7]        # 809f60 <clu_sec_balance>
  808999:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80899c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089a0:	ba 01 00 00 00       	mov    edx,0x1
  8089a5:	89 ce                	mov    esi,ecx
  8089a7:	48 89 c7             	mov    rdi,rax
  8089aa:	e8 4b e8 ff ff       	call   8071fa <write_sec>
        n++;
  8089af:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  8089b3:	0f b7 05 b1 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1feb1]        # 42886b <superblock+0xb>
  8089ba:	0f b7 c0             	movzx  eax,ax
  8089bd:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  8089c1:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8089c5:	48 98                	cdqe   
  8089c7:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8089ce:	00 
  8089cf:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  8089d3:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8089d8:	77 0a                	ja     8089e4 <write_file+0x115>
    while(n<c)
  8089da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8089dd:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8089e0:	7c ad                	jl     80898f <write_file+0xc0>
  8089e2:	eb 01                	jmp    8089e5 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  8089e4:	90                   	nop
    }
    return n;
  8089e5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  8089e8:	c9                   	leave  
  8089e9:	c3                   	ret    

00000000008089ea <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  8089ea:	f3 0f 1e fa          	endbr64 
  8089ee:	55                   	push   rbp
  8089ef:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  8089f2:	48 8b 05 f7 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284f7]        # 430ef0 <vpage_base>
  8089f9:	48 05 a0 00 00 00    	add    rax,0xa0
  8089ff:	48 89 05 ea 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284ea],rax        # 430ef0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  808a06:	8b 05 ec 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc284ec]        # 430ef8 <page_boffset>
  808a0c:	05 a0 00 00 00       	add    eax,0xa0
  808a11:	89 05 e1 84 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc284e1],eax        # 430ef8 <page_boffset>
    if(vpage_base>=video_end)
  808a17:	48 8b 15 d2 84 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc284d2]        # 430ef0 <vpage_base>
  808a1e:	48 8b 05 c3 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284c3]        # 430ee8 <video_end>
  808a25:	48 39 c2             	cmp    rdx,rax
  808a28:	72 0e                	jb     808a38 <scrdown+0x4e>
        vpage_base=video_base;
  808a2a:	48 8b 05 af 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284af]        # 430ee0 <video_base>
  808a31:	48 89 05 b8 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284b8],rax        # 430ef0 <vpage_base>
    set_origin();
  808a38:	b8 00 00 00 00       	mov    eax,0x0
  808a3d:	e8 6a 00 00 00       	call   808aac <set_origin>
}
  808a42:	90                   	nop
  808a43:	5d                   	pop    rbp
  808a44:	c3                   	ret    

0000000000808a45 <scrup>:
void scrup()
{
  808a45:	f3 0f 1e fa          	endbr64 
  808a49:	55                   	push   rbp
  808a4a:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808a4d:	8b 05 a5 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc284a5]        # 430ef8 <page_boffset>
  808a53:	85 c0                	test   eax,eax
  808a55:	75 24                	jne    808a7b <scrup+0x36>
    {
        page_boffset=0;
  808a57:	c7 05 97 84 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28497],0x0        # 430ef8 <page_boffset>
  808a5e:	00 00 00 
        vpage_base=video_base;
  808a61:	48 8b 05 78 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28478]        # 430ee0 <video_base>
  808a68:	48 89 05 81 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28481],rax        # 430ef0 <vpage_base>
        set_origin();
  808a6f:	b8 00 00 00 00       	mov    eax,0x0
  808a74:	e8 33 00 00 00       	call   808aac <set_origin>
        return;
  808a79:	eb 2f                	jmp    808aaa <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808a7b:	48 8b 05 6e 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2846e]        # 430ef0 <vpage_base>
  808a82:	48 2d a0 00 00 00    	sub    rax,0xa0
  808a88:	48 89 05 61 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28461],rax        # 430ef0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808a8f:	8b 05 63 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28463]        # 430ef8 <page_boffset>
  808a95:	2d a0 00 00 00       	sub    eax,0xa0
  808a9a:	89 05 58 84 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28458],eax        # 430ef8 <page_boffset>
    set_origin();
  808aa0:	b8 00 00 00 00       	mov    eax,0x0
  808aa5:	e8 02 00 00 00       	call   808aac <set_origin>
}
  808aaa:	5d                   	pop    rbp
  808aab:	c3                   	ret    

0000000000808aac <set_origin>:
void set_origin(void)
{
  808aac:	f3 0f 1e fa          	endbr64 
  808ab0:	55                   	push   rbp
  808ab1:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808ab4:	fa                   	cli    
    outb(port_reg_index,12);
  808ab5:	8b 05 4d 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2844d]        # 430f08 <port_reg_index>
  808abb:	0f b7 c0             	movzx  eax,ax
  808abe:	be 0c 00 00 00       	mov    esi,0xc
  808ac3:	89 c7                	mov    edi,eax
  808ac5:	e8 56 be ff ff       	call   804920 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808aca:	8b 05 28 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28428]        # 430ef8 <page_boffset>
  808ad0:	c1 e8 09             	shr    eax,0x9
  808ad3:	0f b6 d0             	movzx  edx,al
  808ad6:	8b 05 30 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28430]        # 430f0c <port_reg_v>
  808adc:	0f b7 c0             	movzx  eax,ax
  808adf:	89 d6                	mov    esi,edx
  808ae1:	89 c7                	mov    edi,eax
  808ae3:	e8 38 be ff ff       	call   804920 <outb>
    outb(port_reg_index,13);
  808ae8:	8b 05 1a 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2841a]        # 430f08 <port_reg_index>
  808aee:	0f b7 c0             	movzx  eax,ax
  808af1:	be 0d 00 00 00       	mov    esi,0xd
  808af6:	89 c7                	mov    edi,eax
  808af8:	e8 23 be ff ff       	call   804920 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808afd:	8b 05 f5 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283f5]        # 430ef8 <page_boffset>
  808b03:	d1 e8                	shr    eax,1
  808b05:	0f b6 d0             	movzx  edx,al
  808b08:	8b 05 fe 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283fe]        # 430f0c <port_reg_v>
  808b0e:	0f b7 c0             	movzx  eax,ax
  808b11:	89 d6                	mov    esi,edx
  808b13:	89 c7                	mov    edi,eax
  808b15:	e8 06 be ff ff       	call   804920 <outb>
    asm volatile("sti");
  808b1a:	fb                   	sti    

}
  808b1b:	90                   	nop
  808b1c:	5d                   	pop    rbp
  808b1d:	c3                   	ret    

0000000000808b1e <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808b1e:	f3 0f 1e fa          	endbr64 
  808b22:	55                   	push   rbp
  808b23:	48 89 e5             	mov    rbp,rsp
  808b26:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808b2a:	be 68 1f 81 00       	mov    esi,0x811f68
  808b2f:	bf 14 1e 81 00       	mov    edi,0x811e14
  808b34:	e8 9a 09 00 00       	call   8094d3 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808b39:	be 6d 1f 81 00       	mov    esi,0x811f6d
  808b3e:	bf d4 1e 81 00       	mov    edi,0x811ed4
  808b43:	e8 8b 09 00 00       	call   8094d3 <strcpy>
    reg_driver(&drv_tty);
  808b48:	bf 60 1d 81 00       	mov    edi,0x811d60
  808b4d:	e8 ae a0 ff ff       	call   802c00 <reg_driver>
    reg_device(&dev_tty);
  808b52:	bf 00 1e 81 00       	mov    edi,0x811e00
  808b57:	e8 bc 9d ff ff       	call   802918 <reg_device>
    reg_device(&dev_stdout);
  808b5c:	bf c0 1e 81 00       	mov    edi,0x811ec0
  808b61:	e8 b2 9d ff ff       	call   802918 <reg_device>
    unsigned char *vp=0x20000;
  808b66:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808b6d:	00 
    if(*vp==0x7)
  808b6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b75:	3c 07                	cmp    al,0x7
  808b77:	75 36                	jne    808baf <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808b79:	c7 05 79 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28379],0x0        # 430efc <video_mode>
  808b80:	00 00 00 
        video_base=0xb0000;
  808b83:	48 c7 05 52 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28352],0xb0000        # 430ee0 <video_base>
  808b8a:	00 00 0b 00 
        video_end=0xb8000-1;
  808b8e:	48 c7 05 4f 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2834f],0xb7fff        # 430ee8 <video_end>
  808b95:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808b99:	c7 05 65 83 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc28365],0x3b4        # 430f08 <port_reg_index>
  808ba0:	03 00 00 
        port_reg_v=0x3b5;
  808ba3:	c7 05 5f 83 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2835f],0x3b5        # 430f0c <port_reg_v>
  808baa:	03 00 00 
  808bad:	eb 61                	jmp    808c10 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808baf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808bb3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808bb6:	3c 03                	cmp    al,0x3
  808bb8:	77 36                	ja     808bf0 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808bba:	c7 05 38 83 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc28338],0x1        # 430efc <video_mode>
  808bc1:	00 00 00 
        video_base=0xb8000;
  808bc4:	48 c7 05 11 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28311],0xb8000        # 430ee0 <video_base>
  808bcb:	00 80 0b 00 
        video_end=0xc0000-1;
  808bcf:	48 c7 05 0e 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2830e],0xbffff        # 430ee8 <video_end>
  808bd6:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808bda:	c7 05 24 83 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28324],0x3d4        # 430f08 <port_reg_index>
  808be1:	03 00 00 
        port_reg_v=0x3d5;
  808be4:	c7 05 1e 83 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2831e],0x3d5        # 430f0c <port_reg_v>
  808beb:	03 00 00 
  808bee:	eb 20                	jmp    808c10 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808bf0:	c7 05 02 83 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc28302],0x2        # 430efc <video_mode>
  808bf7:	00 00 00 
        video_base=0xa0000;
  808bfa:	48 c7 05 db 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282db],0xa0000        # 430ee0 <video_base>
  808c01:	00 00 0a 00 
        video_end=0xb0000-1;
  808c05:	48 c7 05 d8 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282d8],0xaffff        # 430ee8 <video_end>
  808c0c:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808c10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c17:	3c 01                	cmp    al,0x1
  808c19:	77 0f                	ja     808c2a <init_tty+0x10c>
  808c1b:	c7 05 df 82 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc282df],0x28        # 430f04 <line_chs>
  808c22:	00 00 00 
  808c25:	e9 91 00 00 00       	jmp    808cbb <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808c2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c2e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c31:	3c 03                	cmp    al,0x3
  808c33:	76 0b                	jbe    808c40 <init_tty+0x122>
  808c35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c39:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c3c:	3c 07                	cmp    al,0x7
  808c3e:	75 0c                	jne    808c4c <init_tty+0x12e>
  808c40:	c7 05 ba 82 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc282ba],0x50        # 430f04 <line_chs>
  808c47:	00 00 00 
  808c4a:	eb 6f                	jmp    808cbb <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808c4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c53:	3c 05                	cmp    al,0x5
  808c55:	76 16                	jbe    808c6d <init_tty+0x14f>
  808c57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c5e:	3c 09                	cmp    al,0x9
  808c60:	74 0b                	je     808c6d <init_tty+0x14f>
  808c62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c69:	3c 0d                	cmp    al,0xd
  808c6b:	75 0c                	jne    808c79 <init_tty+0x15b>
  808c6d:	c7 05 8d 82 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc2828d],0x140        # 430f04 <line_chs>
  808c74:	01 00 00 
  808c77:	eb 42                	jmp    808cbb <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808c79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c80:	3c 06                	cmp    al,0x6
  808c82:	74 16                	je     808c9a <init_tty+0x17c>
  808c84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c88:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c8b:	3c 0a                	cmp    al,0xa
  808c8d:	74 0b                	je     808c9a <init_tty+0x17c>
  808c8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c93:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c96:	3c 0d                	cmp    al,0xd
  808c98:	76 0c                	jbe    808ca6 <init_tty+0x188>
  808c9a:	c7 05 60 82 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc28260],0x280        # 430f04 <line_chs>
  808ca1:	02 00 00 
  808ca4:	eb 15                	jmp    808cbb <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808ca6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808caa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cad:	3c 08                	cmp    al,0x8
  808caf:	75 0a                	jne    808cbb <init_tty+0x19d>
  808cb1:	c7 05 49 82 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc28249],0xa0        # 430f04 <line_chs>
  808cb8:	00 00 00 
    switch (*vp)
  808cbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808cbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cc2:	0f b6 c0             	movzx  eax,al
  808cc5:	83 f8 14             	cmp    eax,0x14
  808cc8:	77 61                	ja     808d2b <init_tty+0x20d>
  808cca:	89 c0                	mov    eax,eax
  808ccc:	48 8b 04 c5 78 1f 81 	mov    rax,QWORD PTR [rax*8+0x811f78]
  808cd3:	00 
  808cd4:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808cd7:	c7 05 2f 82 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2822f],0x3e8        # 430f10 <vpage_size>
  808cde:	03 00 00 
  808ce1:	eb 49                	jmp    808d2c <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808ce3:	c7 05 23 82 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc28223],0x7d0        # 430f10 <vpage_size>
  808cea:	07 00 00 
  808ced:	eb 3d                	jmp    808d2c <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808cef:	c7 05 17 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28217],0xfa00        # 430f10 <vpage_size>
  808cf6:	fa 00 00 
  808cf9:	eb 31                	jmp    808d2c <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808cfb:	c7 05 0b 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2820b],0x1f400        # 430f10 <vpage_size>
  808d02:	f4 01 00 
  808d05:	eb 25                	jmp    808d2c <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808d07:	c7 05 ff 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281ff],0x7d00        # 430f10 <vpage_size>
  808d0e:	7d 00 00 
  808d11:	eb 19                	jmp    808d2c <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808d13:	c7 05 f3 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281f3],0x36b00        # 430f10 <vpage_size>
  808d1a:	6b 03 00 
  808d1d:	eb 0d                	jmp    808d2c <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808d1f:	c7 05 e7 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281e7],0x4b000        # 430f10 <vpage_size>
  808d26:	b0 04 00 
  808d29:	eb 01                	jmp    808d2c <init_tty+0x20e>
    default:
        break;
  808d2b:	90                   	nop
    }
    m_ptr=video_base;
  808d2c:	48 8b 05 ad 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc281ad]        # 430ee0 <video_base>
  808d33:	48 89 05 2e 12 00 00 	mov    QWORD PTR [rip+0x122e],rax        # 809f68 <m_ptr>
    page_boffset=0;
  808d3a:	c7 05 b4 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281b4],0x0        # 430ef8 <page_boffset>
  808d41:	00 00 00 
    vpage_base=video_base;
  808d44:	48 8b 05 95 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28195]        # 430ee0 <video_base>
  808d4b:	48 89 05 9e 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2819e],rax        # 430ef0 <vpage_base>
    vp++;
  808d52:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808d57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d5e:	0f b6 c0             	movzx  eax,al
  808d61:	89 05 99 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28199],eax        # 430f00 <vpage>
    vp++;
  808d67:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808d6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d70:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808d74:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808d78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d7b:	0f b6 c0             	movzx  eax,al
  808d7e:	89 05 98 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28198],eax        # 430f1c <stline>
    endline=*vp++;
  808d84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d88:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808d8c:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808d90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d93:	0f b6 c0             	movzx  eax,al
  808d96:	89 05 84 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28184],eax        # 430f20 <endline>
    videoy=*vp++;
  808d9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808da0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808da4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808da8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dab:	0f b6 c0             	movzx  eax,al
  808dae:	89 05 64 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28164],eax        # 430f18 <videoy>
    videox=*vp;
  808db4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808db8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dbb:	0f b6 c0             	movzx  eax,al
  808dbe:	89 05 50 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28150],eax        # 430f14 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808dc4:	90                   	nop
  808dc5:	c9                   	leave  
  808dc6:	c3                   	ret    

0000000000808dc7 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808dc7:	f3 0f 1e fa          	endbr64 
  808dcb:	55                   	push   rbp
  808dcc:	48 89 e5             	mov    rbp,rsp
  808dcf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808dd3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dd7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808dda:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808ddd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808de0:	05 00 c0 05 00       	add    eax,0x5c000
  808de5:	01 c0                	add    eax,eax
  808de7:	48 98                	cdqe   
  808de9:	48 89 05 78 11 00 00 	mov    QWORD PTR [rip+0x1178],rax        # 809f68 <m_ptr>
}
  808df0:	90                   	nop
  808df1:	5d                   	pop    rbp
  808df2:	c3                   	ret    

0000000000808df3 <tell_monitor>:
int tell_monitor()
{
  808df3:	f3 0f 1e fa          	endbr64 
  808df7:	55                   	push   rbp
  808df8:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808dfb:	48 8b 05 66 11 00 00 	mov    rax,QWORD PTR [rip+0x1166]        # 809f68 <m_ptr>
  808e02:	48 8b 15 d7 80 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc280d7]        # 430ee0 <video_base>
  808e09:	48 29 d0             	sub    rax,rdx
  808e0c:	48 89 c2             	mov    rdx,rax
  808e0f:	48 c1 ea 3f          	shr    rdx,0x3f
  808e13:	48 01 d0             	add    rax,rdx
  808e16:	48 d1 f8             	sar    rax,1
}
  808e19:	5d                   	pop    rbp
  808e1a:	c3                   	ret    

0000000000808e1b <del_ch>:
void del_ch()
{
  808e1b:	f3 0f 1e fa          	endbr64 
  808e1f:	55                   	push   rbp
  808e20:	48 89 e5             	mov    rbp,rsp
  808e23:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808e2a:	48 8b 05 37 11 00 00 	mov    rax,QWORD PTR [rip+0x1137]        # 809f68 <m_ptr>
  808e31:	48 83 e8 02          	sub    rax,0x2
  808e35:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808e39:	b8 00 00 00 00       	mov    eax,0x0
  808e3e:	e8 b0 ff ff ff       	call   808df3 <tell_monitor>
  808e43:	89 c2                	mov    edx,eax
  808e45:	48 63 c2             	movsxd rax,edx
  808e48:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808e4f:	48 c1 e8 20          	shr    rax,0x20
  808e53:	c1 f8 05             	sar    eax,0x5
  808e56:	89 d1                	mov    ecx,edx
  808e58:	c1 f9 1f             	sar    ecx,0x1f
  808e5b:	29 c8                	sub    eax,ecx
  808e5d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808e60:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808e63:	89 c8                	mov    eax,ecx
  808e65:	c1 e0 02             	shl    eax,0x2
  808e68:	01 c8                	add    eax,ecx
  808e6a:	c1 e0 04             	shl    eax,0x4
  808e6d:	29 c2                	sub    edx,eax
  808e6f:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808e72:	eb 17                	jmp    808e8b <del_ch+0x70>
    {
        *p=*(p+2);
  808e74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e78:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808e7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e80:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808e82:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808e87:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808e8b:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  808e8f:	7e e3                	jle    808e74 <del_ch+0x59>
    }
    driver_args args= {
  808e91:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  808e98:	b8 00 00 00 00       	mov    eax,0x0
  808e9d:	b9 18 00 00 00       	mov    ecx,0x18
  808ea2:	48 89 d7             	mov    rdi,rdx
  808ea5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  808ea8:	b8 00 00 00 00       	mov    eax,0x0
  808ead:	e8 41 ff ff ff       	call   808df3 <tell_monitor>
  808eb2:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  808eb5:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  808ebb:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808ec2:	48 89 c7             	mov    rdi,rax
  808ec5:	e8 fd fe ff ff       	call   808dc7 <seek_tty>
    set_cur();
  808eca:	b8 00 00 00 00       	mov    eax,0x0
  808ecf:	e8 03 00 00 00       	call   808ed7 <set_cur>
}
  808ed4:	90                   	nop
  808ed5:	c9                   	leave  
  808ed6:	c3                   	ret    

0000000000808ed7 <set_cur>:
void set_cur()
{
  808ed7:	f3 0f 1e fa          	endbr64 
  808edb:	55                   	push   rbp
  808edc:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808edf:	fa                   	cli    
    outb(port_reg_index,14);
  808ee0:	8b 05 22 80 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28022]        # 430f08 <port_reg_index>
  808ee6:	0f b7 c0             	movzx  eax,ax
  808ee9:	be 0e 00 00 00       	mov    esi,0xe
  808eee:	89 c7                	mov    edi,eax
  808ef0:	e8 2b ba ff ff       	call   804920 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  808ef5:	48 8b 05 6c 10 00 00 	mov    rax,QWORD PTR [rip+0x106c]        # 809f68 <m_ptr>
  808efc:	48 8b 15 dd 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27fdd]        # 430ee0 <video_base>
  808f03:	48 29 d0             	sub    rax,rdx
  808f06:	48 c1 f8 09          	sar    rax,0x9
  808f0a:	0f b6 d0             	movzx  edx,al
  808f0d:	8b 05 f9 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ff9]        # 430f0c <port_reg_v>
  808f13:	0f b7 c0             	movzx  eax,ax
  808f16:	89 d6                	mov    esi,edx
  808f18:	89 c7                	mov    edi,eax
  808f1a:	e8 01 ba ff ff       	call   804920 <outb>
    outb(port_reg_index,15);
  808f1f:	8b 05 e3 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27fe3]        # 430f08 <port_reg_index>
  808f25:	0f b7 c0             	movzx  eax,ax
  808f28:	be 0f 00 00 00       	mov    esi,0xf
  808f2d:	89 c7                	mov    edi,eax
  808f2f:	e8 ec b9 ff ff       	call   804920 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  808f34:	48 8b 05 2d 10 00 00 	mov    rax,QWORD PTR [rip+0x102d]        # 809f68 <m_ptr>
  808f3b:	48 8b 15 9e 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27f9e]        # 430ee0 <video_base>
  808f42:	48 29 d0             	sub    rax,rdx
  808f45:	48 d1 f8             	sar    rax,1
  808f48:	0f b6 d0             	movzx  edx,al
  808f4b:	8b 05 bb 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27fbb]        # 430f0c <port_reg_v>
  808f51:	0f b7 c0             	movzx  eax,ax
  808f54:	89 d6                	mov    esi,edx
  808f56:	89 c7                	mov    edi,eax
  808f58:	e8 c3 b9 ff ff       	call   804920 <outb>
    asm volatile("sti");
  808f5d:	fb                   	sti    
}
  808f5e:	90                   	nop
  808f5f:	5d                   	pop    rbp
  808f60:	c3                   	ret    

0000000000808f61 <read_tty>:

int read_tty(driver_args *args)
{
  808f61:	f3 0f 1e fa          	endbr64 
  808f65:	55                   	push   rbp
  808f66:	48 89 e5             	mov    rbp,rsp
  808f69:	48 83 ec 20          	sub    rsp,0x20
  808f6d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  808f71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f75:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808f78:	48 98                	cdqe   
  808f7a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808f7e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f82:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f85:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808f88:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808f8f:	eb 4a                	jmp    808fdb <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  808f91:	48 8b 15 d0 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfd0]        # 809f68 <m_ptr>
  808f98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f9c:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808fa0:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  808fa4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808fa7:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  808fa9:	48 8b 05 b8 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb8]        # 809f68 <m_ptr>
  808fb0:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  808fb6:	75 0d                	jne    808fc5 <read_tty+0x64>
  808fb8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808fbc:	7e 07                	jle    808fc5 <read_tty+0x64>
        {
            return 1;//读到尾了
  808fbe:	b8 01 00 00 00       	mov    eax,0x1
  808fc3:	eb 2d                	jmp    808ff2 <read_tty+0x91>
        }
        m_ptr+=2;
  808fc5:	48 8b 05 9c 0f 00 00 	mov    rax,QWORD PTR [rip+0xf9c]        # 809f68 <m_ptr>
  808fcc:	48 83 c0 02          	add    rax,0x2
  808fd0:	48 89 05 91 0f 00 00 	mov    QWORD PTR [rip+0xf91],rax        # 809f68 <m_ptr>
    for(int i=0;i<len;i++)
  808fd7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808fdb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fde:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  808fe1:	7c ae                	jl     808f91 <read_tty+0x30>
    }
    set_cur();
  808fe3:	b8 00 00 00 00       	mov    eax,0x0
  808fe8:	e8 ea fe ff ff       	call   808ed7 <set_cur>
    return 0;
  808fed:	b8 00 00 00 00       	mov    eax,0x0
}
  808ff2:	c9                   	leave  
  808ff3:	c3                   	ret    

0000000000808ff4 <write_tty>:
int write_tty(driver_args *args)
{
  808ff4:	f3 0f 1e fa          	endbr64 
  808ff8:	55                   	push   rbp
  808ff9:	48 89 e5             	mov    rbp,rsp
  808ffc:	48 83 ec 30          	sub    rsp,0x30
  809000:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809004:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809008:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80900b:	48 98                	cdqe   
  80900d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  809011:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809015:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809018:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80901b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809022:	e9 0b 01 00 00       	jmp    809132 <write_tty+0x13e>
    {
        if(*src=='\n')
  809027:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80902b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80902e:	3c 0a                	cmp    al,0xa
  809030:	75 50                	jne    809082 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  809032:	48 8b 05 2f 0f 00 00 	mov    rax,QWORD PTR [rip+0xf2f]        # 809f68 <m_ptr>
  809039:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80903f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  809042:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809045:	89 c2                	mov    edx,eax
  809047:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80904c:	48 0f af c2          	imul   rax,rdx
  809050:	48 c1 e8 20          	shr    rax,0x20
  809054:	c1 e8 07             	shr    eax,0x7
  809057:	8d 50 01             	lea    edx,[rax+0x1]
  80905a:	89 d0                	mov    eax,edx
  80905c:	c1 e0 02             	shl    eax,0x2
  80905f:	01 d0                	add    eax,edx
  809061:	c1 e0 05             	shl    eax,0x5
  809064:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  809067:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80906a:	05 00 80 0b 00       	add    eax,0xb8000
  80906f:	89 c0                	mov    eax,eax
  809071:	48 89 05 f0 0e 00 00 	mov    QWORD PTR [rip+0xef0],rax        # 809f68 <m_ptr>
            src++;
  809078:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80907d:	e9 ac 00 00 00       	jmp    80912e <write_tty+0x13a>
        }else if(*src=='\0')
  809082:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809086:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809089:	84 c0                	test   al,al
  80908b:	0f 84 af 00 00 00    	je     809140 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809091:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809095:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809098:	3c 08                	cmp    al,0x8
  80909a:	75 1e                	jne    8090ba <write_tty+0xc6>
        {
            m_ptr-=2;
  80909c:	48 8b 05 c5 0e 00 00 	mov    rax,QWORD PTR [rip+0xec5]        # 809f68 <m_ptr>
  8090a3:	48 83 e8 02          	sub    rax,0x2
  8090a7:	48 89 05 ba 0e 00 00 	mov    QWORD PTR [rip+0xeba],rax        # 809f68 <m_ptr>
            *m_ptr=0;
  8090ae:	48 8b 05 b3 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb3]        # 809f68 <m_ptr>
  8090b5:	c6 00 00             	mov    BYTE PTR [rax],0x0
  8090b8:	eb 3e                	jmp    8090f8 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  8090ba:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8090be:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8090c2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8090c6:	48 8b 05 9b 0e 00 00 	mov    rax,QWORD PTR [rip+0xe9b]        # 809f68 <m_ptr>
  8090cd:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8090d1:	48 89 0d 90 0e 00 00 	mov    QWORD PTR [rip+0xe90],rcx        # 809f68 <m_ptr>
  8090d8:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8090db:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  8090dd:	48 8b 05 84 0e 00 00 	mov    rax,QWORD PTR [rip+0xe84]        # 809f68 <m_ptr>
  8090e4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8090e8:	48 89 15 79 0e 00 00 	mov    QWORD PTR [rip+0xe79],rdx        # 809f68 <m_ptr>
  8090ef:	0f b6 15 7a 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe7a]        # 809f70 <m_color>
  8090f6:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  8090f8:	48 8b 05 69 0e 00 00 	mov    rax,QWORD PTR [rip+0xe69]        # 809f68 <m_ptr>
  8090ff:	48 8b 0d ea 7d c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27dea]        # 430ef0 <vpage_base>
  809106:	48 29 c8             	sub    rax,rcx
  809109:	48 89 c2             	mov    rdx,rax
  80910c:	8b 05 fe 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27dfe]        # 430f10 <vpage_size>
  809112:	8b 0d ec 7d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27dec]        # 430f04 <line_chs>
  809118:	29 c8                	sub    eax,ecx
  80911a:	01 c0                	add    eax,eax
  80911c:	48 98                	cdqe   
  80911e:	48 39 c2             	cmp    rdx,rax
  809121:	7c 0b                	jl     80912e <write_tty+0x13a>
  809123:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809127:	7e 05                	jle    80912e <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  809129:	e8 bc f8 ff ff       	call   8089ea <scrdown>
    for(int i=0;i<len;i++)
  80912e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809132:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809135:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809138:	0f 8c e9 fe ff ff    	jl     809027 <write_tty+0x33>
  80913e:	eb 01                	jmp    809141 <write_tty+0x14d>
            break;
  809140:	90                   	nop
        }
    }
    set_cur();
  809141:	b8 00 00 00 00       	mov    eax,0x0
  809146:	e8 8c fd ff ff       	call   808ed7 <set_cur>
    return 0;
  80914b:	b8 00 00 00 00       	mov    eax,0x0
}
  809150:	c9                   	leave  
  809151:	c3                   	ret    

0000000000809152 <cls>:

void cls(driver_args *args)
{
  809152:	f3 0f 1e fa          	endbr64 
  809156:	55                   	push   rbp
  809157:	48 89 e5             	mov    rbp,rsp
  80915a:	48 83 ec 20          	sub    rsp,0x20
  80915e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809162:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809169:	eb 16                	jmp    809181 <cls+0x2f>
    {
        vpage_base[i]=0;
  80916b:	48 8b 15 7e 7d c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27d7e]        # 430ef0 <vpage_base>
  809172:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809175:	48 98                	cdqe   
  809177:	48 01 d0             	add    rax,rdx
  80917a:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80917d:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809181:	8b 05 89 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d89]        # 430f10 <vpage_size>
  809187:	01 c0                	add    eax,eax
  809189:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80918c:	7c dd                	jl     80916b <cls+0x19>
    }
    m_ptr=vpage_base;
  80918e:	48 8b 05 5b 7d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27d5b]        # 430ef0 <vpage_base>
  809195:	48 89 05 cc 0d 00 00 	mov    QWORD PTR [rip+0xdcc],rax        # 809f68 <m_ptr>
    set_cur();
  80919c:	b8 00 00 00 00       	mov    eax,0x0
  8091a1:	e8 31 fd ff ff       	call   808ed7 <set_cur>
}
  8091a6:	90                   	nop
  8091a7:	c9                   	leave  
  8091a8:	c3                   	ret    

00000000008091a9 <set_color>:

void set_color(char color)
{
  8091a9:	f3 0f 1e fa          	endbr64 
  8091ad:	55                   	push   rbp
  8091ae:	48 89 e5             	mov    rbp,rsp
  8091b1:	89 f8                	mov    eax,edi
  8091b3:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  8091b6:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8091ba:	88 05 b0 0d 00 00    	mov    BYTE PTR [rip+0xdb0],al        # 809f70 <m_color>
}
  8091c0:	90                   	nop
  8091c1:	5d                   	pop    rbp
  8091c2:	c3                   	ret    

00000000008091c3 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  8091c3:	f3 0f 1e fa          	endbr64 
  8091c7:	55                   	push   rbp
  8091c8:	48 89 e5             	mov    rbp,rsp
  8091cb:	48 83 ec 10          	sub    rsp,0x10
  8091cf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  8091d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091d7:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8091dd:	83 f8 0d             	cmp    eax,0xd
  8091e0:	74 45                	je     809227 <tty_do_req+0x64>
  8091e2:	83 f8 0d             	cmp    eax,0xd
  8091e5:	7f 53                	jg     80923a <tty_do_req+0x77>
  8091e7:	83 f8 0c             	cmp    eax,0xc
  8091ea:	74 2d                	je     809219 <tty_do_req+0x56>
  8091ec:	83 f8 0c             	cmp    eax,0xc
  8091ef:	7f 49                	jg     80923a <tty_do_req+0x77>
  8091f1:	83 f8 02             	cmp    eax,0x2
  8091f4:	74 07                	je     8091fd <tty_do_req+0x3a>
  8091f6:	83 f8 03             	cmp    eax,0x3
  8091f9:	74 10                	je     80920b <tty_do_req+0x48>
  8091fb:	eb 3d                	jmp    80923a <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  8091fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809201:	48 89 c7             	mov    rdi,rax
  809204:	e8 58 fd ff ff       	call   808f61 <read_tty>
        break;
  809209:	eb 36                	jmp    809241 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80920b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80920f:	48 89 c7             	mov    rdi,rax
  809212:	e8 dd fd ff ff       	call   808ff4 <write_tty>
        break;
  809217:	eb 28                	jmp    809241 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  809219:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80921d:	48 89 c7             	mov    rdi,rax
  809220:	e8 a2 fb ff ff       	call   808dc7 <seek_tty>
        break;
  809225:	eb 1a                	jmp    809241 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  809227:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80922b:	48 89 c7             	mov    rdi,rax
  80922e:	b8 00 00 00 00       	mov    eax,0x0
  809233:	e8 bb fb ff ff       	call   808df3 <tell_monitor>
        break;
  809238:	eb 07                	jmp    809241 <tty_do_req+0x7e>
    default:return -1;
  80923a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80923f:	eb 05                	jmp    809246 <tty_do_req+0x83>
    }
    return 0;
  809241:	b8 00 00 00 00       	mov    eax,0x0
}
  809246:	c9                   	leave  
  809247:	c3                   	ret    

0000000000809248 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  809248:	f3 0f 1e fa          	endbr64 
  80924c:	55                   	push   rbp
  80924d:	48 89 e5             	mov    rbp,rsp
  809250:	48 83 ec 10          	sub    rsp,0x10
  809254:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  809257:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80925a:	83 c0 01             	add    eax,0x1
  80925d:	0f b7 c0             	movzx  eax,ax
  809260:	be 00 00 00 00       	mov    esi,0x0
  809265:	89 c7                	mov    edi,eax
  809267:	e8 b4 b6 ff ff       	call   804920 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80926c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80926f:	83 c0 03             	add    eax,0x3
  809272:	0f b7 c0             	movzx  eax,ax
  809275:	be 80 00 00 00       	mov    esi,0x80
  80927a:	89 c7                	mov    edi,eax
  80927c:	e8 9f b6 ff ff       	call   804920 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809281:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809284:	0f b7 c0             	movzx  eax,ax
  809287:	be 03 00 00 00       	mov    esi,0x3
  80928c:	89 c7                	mov    edi,eax
  80928e:	e8 8d b6 ff ff       	call   804920 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809293:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809296:	83 c0 01             	add    eax,0x1
  809299:	0f b7 c0             	movzx  eax,ax
  80929c:	be 00 00 00 00       	mov    esi,0x0
  8092a1:	89 c7                	mov    edi,eax
  8092a3:	e8 78 b6 ff ff       	call   804920 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  8092a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092ab:	83 c0 03             	add    eax,0x3
  8092ae:	0f b7 c0             	movzx  eax,ax
  8092b1:	be 03 00 00 00       	mov    esi,0x3
  8092b6:	89 c7                	mov    edi,eax
  8092b8:	e8 63 b6 ff ff       	call   804920 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  8092bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092c0:	83 c0 02             	add    eax,0x2
  8092c3:	0f b7 c0             	movzx  eax,ax
  8092c6:	be c7 00 00 00       	mov    esi,0xc7
  8092cb:	89 c7                	mov    edi,eax
  8092cd:	e8 4e b6 ff ff       	call   804920 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  8092d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092d5:	83 c0 04             	add    eax,0x4
  8092d8:	0f b7 c0             	movzx  eax,ax
  8092db:	be 0b 00 00 00       	mov    esi,0xb
  8092e0:	89 c7                	mov    edi,eax
  8092e2:	e8 39 b6 ff ff       	call   804920 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  8092e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092ea:	83 c0 04             	add    eax,0x4
  8092ed:	0f b7 c0             	movzx  eax,ax
  8092f0:	be 1e 00 00 00       	mov    esi,0x1e
  8092f5:	89 c7                	mov    edi,eax
  8092f7:	e8 24 b6 ff ff       	call   804920 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  8092fc:	b8 61 00 00 00       	mov    eax,0x61
  809301:	0f b6 d0             	movzx  edx,al
  809304:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809307:	0f b7 c0             	movzx  eax,ax
  80930a:	89 d6                	mov    esi,edx
  80930c:	89 c7                	mov    edi,eax
  80930e:	e8 0d b6 ff ff       	call   804920 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  809313:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809316:	0f b6 c0             	movzx  eax,al
  809319:	89 c7                	mov    edi,eax
  80931b:	e8 24 b6 ff ff       	call   804944 <inb>
  809320:	0f b6 d0             	movzx  edx,al
  809323:	b8 61 00 00 00       	mov    eax,0x61
  809328:	0f be c0             	movsx  eax,al
  80932b:	39 c2                	cmp    edx,eax
  80932d:	75 17                	jne    809346 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80932f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809332:	83 c0 04             	add    eax,0x4
  809335:	0f b7 c0             	movzx  eax,ax
  809338:	be 0f 00 00 00       	mov    esi,0xf
  80933d:	89 c7                	mov    edi,eax
  80933f:	e8 dc b5 ff ff       	call   804920 <outb>
  809344:	eb 01                	jmp    809347 <init_com+0xff>
        return;
  809346:	90                   	nop
}
  809347:	c9                   	leave  
  809348:	c3                   	ret    

0000000000809349 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  809349:	f3 0f 1e fa          	endbr64 
  80934d:	55                   	push   rbp
  80934e:	48 89 e5             	mov    rbp,rsp
  809351:	48 83 ec 20          	sub    rsp,0x20
  809355:	89 f8                	mov    eax,edi
  809357:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80935a:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80935e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809361:	83 c0 05             	add    eax,0x5
  809364:	0f b6 c0             	movzx  eax,al
  809367:	89 c7                	mov    edi,eax
  809369:	e8 d6 b5 ff ff       	call   804944 <inb>
  80936e:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809371:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809375:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809379:	74 e3                	je     80935e <com_putchar+0x15>
    outb(com_base, ch);
  80937b:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80937f:	0f b6 d0             	movzx  edx,al
  809382:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809385:	0f b7 c0             	movzx  eax,ax
  809388:	89 d6                	mov    esi,edx
  80938a:	89 c7                	mov    edi,eax
  80938c:	e8 8f b5 ff ff       	call   804920 <outb>
}
  809391:	90                   	nop
  809392:	c9                   	leave  
  809393:	c3                   	ret    

0000000000809394 <com_puts>:

void com_puts(char* s,int com_port){
  809394:	f3 0f 1e fa          	endbr64 
  809398:	55                   	push   rbp
  809399:	48 89 e5             	mov    rbp,rsp
  80939c:	48 83 ec 10          	sub    rsp,0x10
  8093a0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8093a4:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  8093a7:	eb 1d                	jmp    8093c6 <com_puts+0x32>
        com_putchar(*s,com_port);
  8093a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093b0:	66 98                	cbw    
  8093b2:	0f b7 c0             	movzx  eax,ax
  8093b5:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8093b8:	89 d6                	mov    esi,edx
  8093ba:	89 c7                	mov    edi,eax
  8093bc:	e8 88 ff ff ff       	call   809349 <com_putchar>
    for(;*s;s++){
  8093c1:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  8093c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093cd:	84 c0                	test   al,al
  8093cf:	75 d8                	jne    8093a9 <com_puts+0x15>
    }
  8093d1:	90                   	nop
  8093d2:	90                   	nop
  8093d3:	c9                   	leave  
  8093d4:	c3                   	ret    

00000000008093d5 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  8093d5:	f3 0f 1e fa          	endbr64 
  8093d9:	55                   	push   rbp
  8093da:	48 89 e5             	mov    rbp,rsp
  8093dd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8093e1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8093e5:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  8093e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ec:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  8093ef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8093f6:	eb 1b                	jmp    809413 <memcpy+0x3e>
        *(dest)=*(src);
  8093f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8093fc:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8093ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809403:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809405:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80940a:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80940f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809413:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809416:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  809419:	77 dd                	ja     8093f8 <memcpy+0x23>
    }
}
  80941b:	90                   	nop
  80941c:	90                   	nop
  80941d:	5d                   	pop    rbp
  80941e:	c3                   	ret    

000000000080941f <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80941f:	f3 0f 1e fa          	endbr64 
  809423:	55                   	push   rbp
  809424:	48 89 e5             	mov    rbp,rsp
  809427:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80942b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80942f:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809432:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809439:	eb 3a                	jmp    809475 <memcmp+0x56>
    {
        if(*a!=*b)
  80943b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80943f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809442:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809446:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809449:	38 c2                	cmp    dl,al
  80944b:	74 1a                	je     809467 <memcmp+0x48>
            return *a-*b;
  80944d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809451:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809454:	0f b6 d0             	movzx  edx,al
  809457:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80945b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80945e:	0f b6 c8             	movzx  ecx,al
  809461:	89 d0                	mov    eax,edx
  809463:	29 c8                	sub    eax,ecx
  809465:	eb 1b                	jmp    809482 <memcmp+0x63>
        a++;
  809467:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80946c:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809471:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809475:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809478:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80947b:	7c be                	jl     80943b <memcmp+0x1c>
    }
    return 0;
  80947d:	b8 00 00 00 00       	mov    eax,0x0
}
  809482:	5d                   	pop    rbp
  809483:	c3                   	ret    

0000000000809484 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809484:	f3 0f 1e fa          	endbr64 
  809488:	55                   	push   rbp
  809489:	48 89 e5             	mov    rbp,rsp
  80948c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809490:	89 f0                	mov    eax,esi
  809492:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809495:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809498:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80949f:	eb 16                	jmp    8094b7 <memset+0x33>
        *(buf++)=value;
  8094a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094a5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8094a9:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8094ad:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  8094b1:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  8094b3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8094b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094ba:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8094bd:	72 e2                	jb     8094a1 <memset+0x1d>
    }
}
  8094bf:	90                   	nop
  8094c0:	90                   	nop
  8094c1:	5d                   	pop    rbp
  8094c2:	c3                   	ret    

00000000008094c3 <get_mem_size>:

u32 get_mem_size(){
  8094c3:	f3 0f 1e fa          	endbr64 
  8094c7:	55                   	push   rbp
  8094c8:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  8094cb:	8b 05 53 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a53]        # 430f24 <mem_end>
}
  8094d1:	5d                   	pop    rbp
  8094d2:	c3                   	ret    

00000000008094d3 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  8094d3:	f3 0f 1e fa          	endbr64 
  8094d7:	55                   	push   rbp
  8094d8:	48 89 e5             	mov    rbp,rsp
  8094db:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094df:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  8094e3:	eb 1d                	jmp    809502 <strcpy+0x2f>
        *(dest++)=*(buf++);
  8094e5:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8094e9:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8094ed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8094f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094f5:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8094f9:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8094fd:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809500:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809502:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809506:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809509:	84 c0                	test   al,al
  80950b:	75 d8                	jne    8094e5 <strcpy+0x12>
    }
    *dest='\0';
  80950d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809511:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809514:	90                   	nop
  809515:	5d                   	pop    rbp
  809516:	c3                   	ret    

0000000000809517 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  809517:	f3 0f 1e fa          	endbr64 
  80951b:	55                   	push   rbp
  80951c:	48 89 e5             	mov    rbp,rsp
  80951f:	48 83 ec 30          	sub    rsp,0x30
  809523:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809527:	89 f0                	mov    eax,esi
  809529:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80952c:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809531:	0f 84 9c 00 00 00    	je     8095d3 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809537:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80953b:	48 89 c6             	mov    rsi,rax
  80953e:	bf 40 0f 43 00       	mov    edi,0x430f40
  809543:	e8 8b ff ff ff       	call   8094d3 <strcpy>
        char* ptr=strtokkee;
  809548:	48 c7 45 e8 40 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f40
  80954f:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809550:	c7 05 e6 7b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27be6],0x0        # 431140 <tokptr>
  809557:	00 00 00 
  80955a:	eb 1c                	jmp    809578 <strtok+0x61>
  80955c:	8b 05 de 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bde]        # 431140 <tokptr>
  809562:	83 c0 01             	add    eax,0x1
  809565:	99                   	cdq    
  809566:	c1 ea 17             	shr    edx,0x17
  809569:	01 d0                	add    eax,edx
  80956b:	25 ff 01 00 00       	and    eax,0x1ff
  809570:	29 d0                	sub    eax,edx
  809572:	89 05 c8 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27bc8],eax        # 431140 <tokptr>
  809578:	8b 05 c2 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bc2]        # 431140 <tokptr>
  80957e:	48 98                	cdqe   
  809580:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809587:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80958a:	74 13                	je     80959f <strtok+0x88>
  80958c:	8b 05 ae 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bae]        # 431140 <tokptr>
  809592:	48 98                	cdqe   
  809594:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80959b:	84 c0                	test   al,al
  80959d:	75 bd                	jne    80955c <strtok+0x45>
        strtokkee[tokptr]='\0';
  80959f:	8b 05 9b 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b9b]        # 431140 <tokptr>
  8095a5:	48 98                	cdqe   
  8095a7:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
        tokptr=(tokptr+1)%512;
  8095ae:	8b 05 8c 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b8c]        # 431140 <tokptr>
  8095b4:	83 c0 01             	add    eax,0x1
  8095b7:	99                   	cdq    
  8095b8:	c1 ea 17             	shr    edx,0x17
  8095bb:	01 d0                	add    eax,edx
  8095bd:	25 ff 01 00 00       	and    eax,0x1ff
  8095c2:	29 d0                	sub    eax,edx
  8095c4:	89 05 76 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b76],eax        # 431140 <tokptr>
        return ptr;
  8095ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095ce:	e9 9e 00 00 00       	jmp    809671 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  8095d3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  8095da:	8b 05 60 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b60]        # 431140 <tokptr>
  8095e0:	48 98                	cdqe   
  8095e2:	48 05 40 0f 43 00    	add    rax,0x430f40
  8095e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  8095ec:	eb 20                	jmp    80960e <strtok+0xf7>
  8095ee:	8b 05 4c 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b4c]        # 431140 <tokptr>
  8095f4:	83 c0 01             	add    eax,0x1
  8095f7:	99                   	cdq    
  8095f8:	c1 ea 17             	shr    edx,0x17
  8095fb:	01 d0                	add    eax,edx
  8095fd:	25 ff 01 00 00       	and    eax,0x1ff
  809602:	29 d0                	sub    eax,edx
  809604:	89 05 36 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b36],eax        # 431140 <tokptr>
  80960a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80960e:	8b 05 2c 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b2c]        # 431140 <tokptr>
  809614:	48 98                	cdqe   
  809616:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80961d:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809620:	74 13                	je     809635 <strtok+0x11e>
  809622:	8b 05 18 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b18]        # 431140 <tokptr>
  809628:	48 98                	cdqe   
  80962a:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809631:	84 c0                	test   al,al
  809633:	75 b9                	jne    8095ee <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809635:	8b 05 05 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b05]        # 431140 <tokptr>
  80963b:	48 98                	cdqe   
  80963d:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
    tokptr=(tokptr+1)%512;
  809644:	8b 05 f6 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27af6]        # 431140 <tokptr>
  80964a:	83 c0 01             	add    eax,0x1
  80964d:	99                   	cdq    
  80964e:	c1 ea 17             	shr    edx,0x17
  809651:	01 d0                	add    eax,edx
  809653:	25 ff 01 00 00       	and    eax,0x1ff
  809658:	29 d0                	sub    eax,edx
  80965a:	89 05 e0 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ae0],eax        # 431140 <tokptr>
    if(c)
  809660:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809664:	74 06                	je     80966c <strtok+0x155>
        return ptr;
  809666:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80966a:	eb 05                	jmp    809671 <strtok+0x15a>
    else
        return (void*)0;
  80966c:	b8 00 00 00 00       	mov    eax,0x0
}
  809671:	c9                   	leave  
  809672:	c3                   	ret    

0000000000809673 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809673:	f3 0f 1e fa          	endbr64 
  809677:	55                   	push   rbp
  809678:	48 89 e5             	mov    rbp,rsp
  80967b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80967f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809683:	eb 3c                	jmp    8096c1 <strcmp+0x4e>
		if(*s1>*s2)
  809685:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809689:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80968c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809690:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809693:	38 c2                	cmp    dl,al
  809695:	7e 07                	jle    80969e <strcmp+0x2b>
			return 1;
  809697:	b8 01 00 00 00       	mov    eax,0x1
  80969c:	eb 52                	jmp    8096f0 <strcmp+0x7d>
		else if(*s1<*s2)
  80969e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096a2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8096a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096ac:	38 c2                	cmp    dl,al
  8096ae:	7d 07                	jge    8096b7 <strcmp+0x44>
			return -1;
  8096b0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8096b5:	eb 39                	jmp    8096f0 <strcmp+0x7d>
		s1++;
  8096b7:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  8096bc:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  8096c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096c8:	84 c0                	test   al,al
  8096ca:	74 0b                	je     8096d7 <strcmp+0x64>
  8096cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096d3:	84 c0                	test   al,al
  8096d5:	75 ae                	jne    809685 <strcmp+0x12>
	}
	if(*s1==*s2)
  8096d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096db:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8096de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096e5:	38 c2                	cmp    dl,al
  8096e7:	75 07                	jne    8096f0 <strcmp+0x7d>
		return 0;
  8096e9:	b8 00 00 00 00       	mov    eax,0x0
  8096ee:	eb 00                	jmp    8096f0 <strcmp+0x7d>
}
  8096f0:	5d                   	pop    rbp
  8096f1:	c3                   	ret    

00000000008096f2 <strlen>:

int strlen(char *str)
{
  8096f2:	f3 0f 1e fa          	endbr64 
  8096f6:	55                   	push   rbp
  8096f7:	48 89 e5             	mov    rbp,rsp
  8096fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  8096fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809705:	eb 09                	jmp    809710 <strlen+0x1e>
  809707:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80970c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809710:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809714:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809717:	84 c0                	test   al,al
  809719:	75 ec                	jne    809707 <strlen+0x15>
    return l;
  80971b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80971e:	5d                   	pop    rbp
  80971f:	c3                   	ret    

0000000000809720 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809720:	f3 0f 1e fa          	endbr64 
  809724:	55                   	push   rbp
  809725:	48 89 e5             	mov    rbp,rsp
  809728:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80972f:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809736:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80973d:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809744:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80974b:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809752:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809759:	84 c0                	test   al,al
  80975b:	74 20                	je     80977d <sprintf+0x5d>
  80975d:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809761:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809765:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809769:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80976d:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809771:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809775:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809779:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80977d:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809784:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80978b:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809792:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809799:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  8097a0:	00 00 00 
    while (*pstr!='\n')
  8097a3:	eb 39                	jmp    8097de <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  8097a5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8097ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097af:	3c 25                	cmp    al,0x25
  8097b1:	75 15                	jne    8097c8 <sprintf+0xa8>
  8097b3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8097ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097bd:	3c 25                	cmp    al,0x25
  8097bf:	74 07                	je     8097c8 <sprintf+0xa8>
            argnum++;
  8097c1:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  8097c8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8097cf:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  8097d6:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8097dd:	01 
    while (*pstr!='\n')
  8097de:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8097e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097e8:	3c 0a                	cmp    al,0xa
  8097ea:	75 b9                	jne    8097a5 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  8097ec:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  8097f3:	00 00 00 
  8097f6:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  8097fd:	00 00 00 
  809800:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809804:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80980b:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809812:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809819:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809820:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809827:	e9 e2 01 00 00       	jmp    809a0e <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80982c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809833:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809836:	3c 25                	cmp    al,0x25
  809838:	0f 85 aa 01 00 00    	jne    8099e8 <sprintf+0x2c8>
  80983e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809845:	48 83 c0 01          	add    rax,0x1
  809849:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80984c:	84 c0                	test   al,al
  80984e:	0f 84 94 01 00 00    	je     8099e8 <sprintf+0x2c8>
            pstr++;
  809854:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80985b:	01 
            if(*pstr=='x'){
  80985c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809863:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809866:	3c 78                	cmp    al,0x78
  809868:	75 64                	jne    8098ce <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80986a:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809870:	83 f8 2f             	cmp    eax,0x2f
  809873:	77 23                	ja     809898 <sprintf+0x178>
  809875:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80987c:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809882:	89 d2                	mov    edx,edx
  809884:	48 01 d0             	add    rax,rdx
  809887:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80988d:	83 c2 08             	add    edx,0x8
  809890:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809896:	eb 12                	jmp    8098aa <sprintf+0x18a>
  809898:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80989f:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8098a3:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8098aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8098ac:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  8098b2:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  8098b8:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8098bf:	89 d6                	mov    esi,edx
  8098c1:	48 89 c7             	mov    rdi,rax
  8098c4:	e8 4e 02 00 00       	call   809b17 <sprint_hex>
            if(*pstr=='x'){
  8098c9:	e9 38 01 00 00       	jmp    809a06 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  8098ce:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098d5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098d8:	3c 73                	cmp    al,0x73
  8098da:	75 68                	jne    809944 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  8098dc:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8098e2:	83 f8 2f             	cmp    eax,0x2f
  8098e5:	77 23                	ja     80990a <sprintf+0x1ea>
  8098e7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8098ee:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8098f4:	89 d2                	mov    edx,edx
  8098f6:	48 01 d0             	add    rax,rdx
  8098f9:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8098ff:	83 c2 08             	add    edx,0x8
  809902:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809908:	eb 12                	jmp    80991c <sprintf+0x1fc>
  80990a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809911:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809915:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80991c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80991f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809926:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80992d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809934:	48 89 d6             	mov    rsi,rdx
  809937:	48 89 c7             	mov    rdi,rax
  80993a:	e8 5a 02 00 00       	call   809b99 <sprintn>
            if(*pstr=='x'){
  80993f:	e9 c2 00 00 00       	jmp    809a06 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809944:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80994b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80994e:	3c 64                	cmp    al,0x64
  809950:	75 66                	jne    8099b8 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809952:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809958:	83 f8 2f             	cmp    eax,0x2f
  80995b:	77 23                	ja     809980 <sprintf+0x260>
  80995d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809964:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80996a:	89 d2                	mov    edx,edx
  80996c:	48 01 d0             	add    rax,rdx
  80996f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809975:	83 c2 08             	add    edx,0x8
  809978:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80997e:	eb 12                	jmp    809992 <sprintf+0x272>
  809980:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809987:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80998b:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809992:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809995:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80999c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  8099a3:	89 c2                	mov    edx,eax
  8099a5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099ac:	89 d6                	mov    esi,edx
  8099ae:	48 89 c7             	mov    rdi,rax
  8099b1:	e8 ad 00 00 00       	call   809a63 <sprint_decimal>
            if(*pstr=='x'){
  8099b6:	eb 4e                	jmp    809a06 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  8099b8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099c2:	3c 63                	cmp    al,0x63
  8099c4:	75 02                	jne    8099c8 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  8099c6:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  8099c8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099d2:	0f be d0             	movsx  edx,al
  8099d5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099dc:	89 d6                	mov    esi,edx
  8099de:	48 89 c7             	mov    rdi,rax
  8099e1:	e8 3e 00 00 00       	call   809a24 <sprintchar>
            if(*pstr=='x'){
  8099e6:	eb 1e                	jmp    809a06 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  8099e8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099f2:	0f be d0             	movsx  edx,al
  8099f5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099fc:	89 d6                	mov    esi,edx
  8099fe:	48 89 c7             	mov    rdi,rax
  809a01:	e8 1e 00 00 00       	call   809a24 <sprintchar>
    for(;*pstr!='\0';pstr++){
  809a06:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809a0d:	01 
  809a0e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809a15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a18:	84 c0                	test   al,al
  809a1a:	0f 85 0c fe ff ff    	jne    80982c <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809a20:	90                   	nop
  809a21:	90                   	nop
  809a22:	c9                   	leave  
  809a23:	c3                   	ret    

0000000000809a24 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809a24:	f3 0f 1e fa          	endbr64 
  809a28:	55                   	push   rbp
  809a29:	48 89 e5             	mov    rbp,rsp
  809a2c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a30:	89 f0                	mov    eax,esi
  809a32:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809a35:	eb 05                	jmp    809a3c <sprintchar+0x18>
        dist++;
  809a37:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809a3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a43:	84 c0                	test   al,al
  809a45:	75 f0                	jne    809a37 <sprintchar+0x13>
    *dist++=c;
  809a47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a4b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809a4f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809a53:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809a57:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809a59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a5d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809a60:	90                   	nop
  809a61:	5d                   	pop    rbp
  809a62:	c3                   	ret    

0000000000809a63 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809a63:	f3 0f 1e fa          	endbr64 
  809a67:	55                   	push   rbp
  809a68:	48 89 e5             	mov    rbp,rsp
  809a6b:	48 83 ec 30          	sub    rsp,0x30
  809a6f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809a73:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809a76:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809a7d:	eb 65                	jmp    809ae4 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809a7f:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809a82:	48 63 c2             	movsxd rax,edx
  809a85:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809a8c:	48 c1 e8 20          	shr    rax,0x20
  809a90:	c1 f8 02             	sar    eax,0x2
  809a93:	89 d6                	mov    esi,edx
  809a95:	c1 fe 1f             	sar    esi,0x1f
  809a98:	29 f0                	sub    eax,esi
  809a9a:	89 c1                	mov    ecx,eax
  809a9c:	89 c8                	mov    eax,ecx
  809a9e:	c1 e0 02             	shl    eax,0x2
  809aa1:	01 c8                	add    eax,ecx
  809aa3:	01 c0                	add    eax,eax
  809aa5:	89 d1                	mov    ecx,edx
  809aa7:	29 c1                	sub    ecx,eax
  809aa9:	89 c8                	mov    eax,ecx
  809aab:	83 c0 30             	add    eax,0x30
  809aae:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809ab1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ab4:	8d 50 01             	lea    edx,[rax+0x1]
  809ab7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809aba:	48 98                	cdqe   
  809abc:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809ac0:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809ac4:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809ac7:	48 63 d0             	movsxd rdx,eax
  809aca:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809ad1:	48 c1 ea 20          	shr    rdx,0x20
  809ad5:	c1 fa 02             	sar    edx,0x2
  809ad8:	c1 f8 1f             	sar    eax,0x1f
  809adb:	89 c1                	mov    ecx,eax
  809add:	89 d0                	mov    eax,edx
  809adf:	29 c8                	sub    eax,ecx
  809ae1:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809ae4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ae7:	83 f8 0f             	cmp    eax,0xf
  809aea:	76 93                	jbe    809a7f <sprint_decimal+0x1c>
    }
    while(p>0)
  809aec:	eb 1f                	jmp    809b0d <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809aee:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809af2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809af5:	48 98                	cdqe   
  809af7:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809afc:	0f be d0             	movsx  edx,al
  809aff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809b03:	89 d6                	mov    esi,edx
  809b05:	48 89 c7             	mov    rdi,rax
  809b08:	e8 17 ff ff ff       	call   809a24 <sprintchar>
    while(p>0)
  809b0d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809b11:	7f db                	jg     809aee <sprint_decimal+0x8b>
    }
}
  809b13:	90                   	nop
  809b14:	90                   	nop
  809b15:	c9                   	leave  
  809b16:	c3                   	ret    

0000000000809b17 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809b17:	f3 0f 1e fa          	endbr64 
  809b1b:	55                   	push   rbp
  809b1c:	48 89 e5             	mov    rbp,rsp
  809b1f:	48 83 ec 20          	sub    rsp,0x20
  809b23:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809b27:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809b2a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809b31:	eb 35                	jmp    809b68 <sprint_hex+0x51>
        unsigned char a=c%16;
  809b33:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809b36:	83 e0 0f             	and    eax,0xf
  809b39:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809b3c:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809b40:	76 06                	jbe    809b48 <sprint_hex+0x31>
  809b42:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809b46:	eb 04                	jmp    809b4c <sprint_hex+0x35>
        else a+='0';
  809b48:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809b4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b4f:	8d 50 01             	lea    edx,[rax+0x1]
  809b52:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809b55:	48 98                	cdqe   
  809b57:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809b5b:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809b5f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809b62:	c1 e8 04             	shr    eax,0x4
  809b65:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809b68:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809b6c:	7e c5                	jle    809b33 <sprint_hex+0x1c>
    }
    while(p>0)
  809b6e:	eb 1f                	jmp    809b8f <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809b70:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809b74:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b77:	48 98                	cdqe   
  809b79:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809b7e:	0f be d0             	movsx  edx,al
  809b81:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b85:	89 d6                	mov    esi,edx
  809b87:	48 89 c7             	mov    rdi,rax
  809b8a:	e8 95 fe ff ff       	call   809a24 <sprintchar>
    while(p>0)
  809b8f:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809b93:	7f db                	jg     809b70 <sprint_hex+0x59>
    }
}
  809b95:	90                   	nop
  809b96:	90                   	nop
  809b97:	c9                   	leave  
  809b98:	c3                   	ret    

0000000000809b99 <sprintn>:
void sprintn(char *dist,char *str)
{
  809b99:	f3 0f 1e fa          	endbr64 
  809b9d:	55                   	push   rbp
  809b9e:	48 89 e5             	mov    rbp,rsp
  809ba1:	48 83 ec 10          	sub    rsp,0x10
  809ba5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809ba9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809bad:	eb 20                	jmp    809bcf <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809baf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809bb3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809bb7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809bbb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bbe:	0f be d0             	movsx  edx,al
  809bc1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bc5:	89 d6                	mov    esi,edx
  809bc7:	48 89 c7             	mov    rdi,rax
  809bca:	e8 55 fe ff ff       	call   809a24 <sprintchar>
    while(*str!='\0')
  809bcf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809bd3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bd6:	84 c0                	test   al,al
  809bd8:	75 d5                	jne    809baf <sprintn+0x16>
    }
  809bda:	90                   	nop
  809bdb:	90                   	nop
  809bdc:	c9                   	leave  
  809bdd:	c3                   	ret    
  809bde:	66 90                	xchg   ax,ax

0000000000809be0 <create_zero>:
  809be0:	e8 54 9d ff ff       	call   803939 <req_proc>
  809be5:	83 f8 ff             	cmp    eax,0xffffffff
  809be8:	74 0c                	je     809bf6 <create_zero.retu>
  809bea:	e8 16 9e ff ff       	call   803a05 <set_proc>
  809bef:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809bf3:	83 c4 40             	add    esp,0x40

0000000000809bf6 <create_zero.retu>:
  809bf6:	c3                   	ret    

0000000000809bf7 <fill_desc>:
  809bf7:	55                   	push   rbp
  809bf8:	48 89 e5             	mov    rbp,rsp
  809bfb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809bff:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809c03:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809c07:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809c0b:	be 4a 9d 80 00       	mov    esi,0x809d4a
  809c10:	c7 04 25 4a 9d 80 00 	mov    DWORD PTR ds:0x809d4a,0x0
  809c17:	00 00 00 00 
  809c1b:	c7 04 25 4e 9d 80 00 	mov    DWORD PTR ds:0x809d4e,0x0
  809c22:	00 00 00 00 
  809c26:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809c2a:	c1 e9 10             	shr    ecx,0x10
  809c2d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809c32:	c1 ea 10             	shr    edx,0x10
  809c35:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809c39:	66 c1 ea 08          	shr    dx,0x8
  809c3d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809c41:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809c46:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809c4a:	c1 e1 08             	shl    ecx,0x8
  809c4d:	09 cf                	or     edi,ecx
  809c4f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809c53:	8b 14 25 4a 9d 80 00 	mov    edx,DWORD PTR ds:0x809d4a
  809c5a:	67 89 10             	mov    DWORD PTR [eax],edx
  809c5d:	8b 14 25 4e 9d 80 00 	mov    edx,DWORD PTR ds:0x809d4e
  809c64:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809c68:	c9                   	leave  
  809c69:	c3                   	ret    

0000000000809c6a <switch_proc_asm>:
  809c6a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809c70:	66 89 04 25 88 9c 80 	mov    WORD PTR ds:0x809c88,ax
  809c77:	00 
  809c78:	c7 04 25 84 9c 80 00 	mov    DWORD PTR ds:0x809c84,0x0
  809c7f:	00 00 00 00 

0000000000809c83 <switch_proc_asm.ljmp>:
  809c83:	ea                   	(bad)  
  809c84:	00 00                	add    BYTE PTR [rax],al
  809c86:	00 00                	add    BYTE PTR [rax],al
  809c88:	00 00                	add    BYTE PTR [rax],al
  809c8a:	c3                   	ret    

0000000000809c8b <switch_to>:
  809c8b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809c90:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809c94:	bf fc 9c 80 00       	mov    edi,0x809cfc
  809c99:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809c9d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809ca1:	89 c1                	mov    ecx,eax
  809ca3:	83 e9 04             	sub    ecx,0x4
  809ca6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809ca9:	50                   	push   rax
  809caa:	89 f5                	mov    ebp,esi
  809cac:	83 c5 28             	add    ebp,0x28
  809caf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cb3:	50                   	push   rax
  809cb4:	83 c5 04             	add    ebp,0x4
  809cb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cbb:	50                   	push   rax
  809cbc:	83 c5 04             	add    ebp,0x4
  809cbf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cc3:	50                   	push   rax
  809cc4:	83 c5 04             	add    ebp,0x4
  809cc7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809ccb:	50                   	push   rax
  809ccc:	83 c5 04             	add    ebp,0x4
  809ccf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cd3:	50                   	push   rax
  809cd4:	83 c5 04             	add    ebp,0x4
  809cd7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cdb:	50                   	push   rax
  809cdc:	83 c5 04             	add    ebp,0x4
  809cdf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809ce3:	50                   	push   rax
  809ce4:	83 c5 04             	add    ebp,0x4
  809ce7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809ceb:	50                   	push   rax
  809cec:	83 c5 04             	add    ebp,0x4
  809cef:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809cf3:	0f 22 d8             	mov    cr3,rax
  809cf6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809cfa:	50                   	push   rax
  809cfb:	5c                   	pop    rsp

0000000000809cfc <switch_to.leap>:
  809cfc:	ea                   	(bad)  
  809cfd:	00 00                	add    BYTE PTR [rax],al
  809cff:	00 00                	add    BYTE PTR [rax],al
  809d01:	08 00                	or     BYTE PTR [rax],al

0000000000809d03 <save_context>:
  809d03:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809d08:	83 c0 44             	add    eax,0x44
  809d0b:	b9 08 00 00 00       	mov    ecx,0x8
  809d10:	89 e7                	mov    edi,esp

0000000000809d12 <save_context.loops>:
  809d12:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809d15:	67 89 10             	mov    DWORD PTR [eax],edx
  809d18:	83 c7 04             	add    edi,0x4
  809d1b:	83 e8 04             	sub    eax,0x4
  809d1e:	e2 f2                	loop   809d12 <save_context.loops>
  809d20:	5b                   	pop    rbx
  809d21:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  809d26:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  809d2a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  809d2f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  809d33:	c3                   	ret    

0000000000809d34 <move_to_user_mode>:
  809d34:	66 b8 20 00          	mov    ax,0x20
  809d38:	8e d8                	mov    ds,eax
  809d3a:	8e c0                	mov    es,eax
  809d3c:	8e e8                	mov    gs,eax
  809d3e:	6a 20                	push   0x20
  809d40:	54                   	push   rsp
  809d41:	6a 18                	push   0x18
  809d43:	68 49 9d 80 00       	push   0x809d49
  809d48:	cf                   	iret   

0000000000809d49 <move_to_user_mode.done>:
  809d49:	c3                   	ret    

0000000000809d4a <desc>:
	...
