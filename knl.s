
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
  100055:	b8 00 18 10 00       	mov    eax,0x101800
  10005a:	c7 00 07 20 10 00    	mov    DWORD PTR [rax],0x102007
  100060:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  100067:	b8 00 20 10 00       	mov    eax,0x102000
  10006c:	c7 00 87 01 00 00    	mov    DWORD PTR [rax],0x187
  100072:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  100079:	b8 00 10 10 00       	mov    eax,0x101000
  10007e:	0f 22 d8             	mov    cr3,rax

0000000000100081 <switch_cs>:
  100081:	bc 00 00 40 00       	mov    esp,0x400000
  100086:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  10008b:	0f 32                	rdmsr  
  10008d:	0f ba e8 08          	bts    eax,0x8
  100091:	0f ba e8 00          	bts    eax,0x0
  100095:	0f 30                	wrmsr  
  100097:	0f 20 c0             	mov    rax,cr0
  10009a:	0f ba e8 00          	bts    eax,0x0
  10009e:	0f ba e8 1f          	bts    eax,0x1f
  1000a2:	0f 22 c0             	mov    cr0,rax
  1000a5:	b8 e0 90 80 00       	mov    eax,0x8090e0
  1000aa:	ea                   	(bad)  
  1000ab:	e0 90                	loopne 10003d <set_paging+0x21>
  1000ad:	80 00 08             	add    BYTE PTR [rax],0x8
	...

bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000800000 <init_int>:
#include "kb.h"
#include "framebuffer.h"

gate *idt= (gate *) KNL_BASE+IDT_ADDR;
extern int disk_int_handler();
void init_int(){
  800000:	f3 0f 1e fa          	endbr64 
  800004:	55                   	push   rbp
  800005:	48 89 e5             	mov    rbp,rsp
  800008:	48 83 ec 10          	sub    rsp,0x10
    //asm volatile("sidt %0"::"m"(idt));
    set_gate(0,(addr_t)divide_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80000c:	b8 04 04 80 00       	mov    eax,0x800404
  800011:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 12 03 00 00       	call   80033a <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800028:	b8 1e 04 80 00       	mov    eax,0x80041e
  80002d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 f6 02 00 00       	call   80033a <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800044:	b8 38 04 80 00       	mov    eax,0x800438
  800049:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 da 02 00 00       	call   80033a <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800060:	b8 52 04 80 00       	mov    eax,0x800452
  800065:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 be 02 00 00       	call   80033a <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80007c:	b8 6c 04 80 00       	mov    eax,0x80046c
  800081:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 a2 02 00 00       	call   80033a <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800098:	b8 86 04 80 00       	mov    eax,0x800486
  80009d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 86 02 00 00       	call   80033a <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000b4:	b8 a0 04 80 00       	mov    eax,0x8004a0
  8000b9:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 6a 02 00 00       	call   80033a <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000d0:	b8 c4 04 80 00       	mov    eax,0x8004c4
  8000d5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 4e 02 00 00       	call   80033a <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//double_ints
  8000ec:	b8 de 04 80 00       	mov    eax,0x8004de
  8000f1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 32 02 00 00       	call   80033a <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800108:	b8 f8 04 80 00       	mov    eax,0x8004f8
  80010d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 16 02 00 00       	call   80033a <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800124:	b8 10 05 80 00       	mov    eax,0x800510
  800129:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 fa 01 00 00       	call   80033a <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800140:	b8 2a 05 80 00       	mov    eax,0x80052a
  800145:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 de 01 00 00       	call   80033a <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80015c:	b8 44 05 80 00       	mov    eax,0x800544
  800161:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 c2 01 00 00       	call   80033a <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800178:	b8 5e 05 80 00       	mov    eax,0x80055e
  80017d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 a6 01 00 00       	call   80033a <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800194:	b8 18 12 80 00       	mov    eax,0x801218
  800199:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 8a 01 00 00       	call   80033a <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001b0:	b8 38 04 80 00       	mov    eax,0x800438
  8001b5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 6e 01 00 00       	call   80033a <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001cc:	b8 85 05 80 00       	mov    eax,0x800585
  8001d1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 52 01 00 00       	call   80033a <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be 38 04 80 00       	mov    esi,0x800438
  8001f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8001f9:	0f b6 c0             	movzx  eax,al
  8001fc:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800201:	ba 08 00 00 00       	mov    edx,0x8
  800206:	89 c7                	mov    edi,eax
  800208:	e8 2d 01 00 00       	call   80033a <set_gate>
    for (int i=17;i<48;i++)
  80020d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  800211:	83 7d fc 2f          	cmp    DWORD PTR [rbp-0x4],0x2f
  800215:	7e da                	jle    8001f1 <init_int+0x1f1>
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800217:	b8 5e 92 80 00       	mov    eax,0x80925e
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 07 01 00 00       	call   80033a <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 80 69 80 00       	mov    eax,0x806980
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 eb 00 00 00       	call   80033a <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 90 a2 80 00       	mov    eax,0x80a290
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 cf 00 00 00       	call   80033a <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 a0 74 80 00       	mov    eax,0x8074a0
  800270:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800275:	ba 08 00 00 00       	mov    edx,0x8
  80027a:	48 89 c6             	mov    rsi,rax
  80027d:	bf 80 00 00 00       	mov    edi,0x80
  800282:	e8 b3 00 00 00       	call   80033a <set_gate>
    //set_gate(0x2c,mouse_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    //启动8259A
    
	//ICW1
	outb(0x20,0x11);
  800287:	be 11 00 00 00       	mov    esi,0x11
  80028c:	bf 20 00 00 00       	mov    edi,0x20
  800291:	e8 5a 64 00 00       	call   8066f0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 4b 64 00 00       	call   8066f0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 3c 64 00 00       	call   8066f0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 2d 64 00 00       	call   8066f0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 1e 64 00 00       	call   8066f0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 0f 64 00 00       	call   8066f0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 00 64 00 00       	call   8066f0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 f1 63 00 00       	call   8066f0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 21 64 00 00       	call   80672a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall+KNL_BASE);
  800309:	48 b8 a0 74 80 00 00 	movabs rax,0xffff8000008074a0
  800310:	80 ff ff 
  800313:	48 89 c6             	mov    rsi,rax
  800316:	b8 82 00 00 c0       	mov    eax,0xc0000082
  80031b:	48 89 c7             	mov    rdi,rax
  80031e:	e8 26 05 00 00       	call   800849 <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  800323:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  80032a:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032f:	48 89 c7             	mov    rdi,rax
  800332:	e8 12 05 00 00       	call   800849 <wrmsr>
}
  800337:	90                   	nop
  800338:	c9                   	leave  
  800339:	c3                   	ret    

000000000080033a <set_gate>:
void set_gate(u8 index,addr_t offset,u16 selector,u16 attr)
{
  80033a:	f3 0f 1e fa          	endbr64 
  80033e:	55                   	push   rbp
  80033f:	48 89 e5             	mov    rbp,rsp
  800342:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800346:	89 c8                	mov    eax,ecx
  800348:	89 f9                	mov    ecx,edi
  80034a:	88 4d fc             	mov    BYTE PTR [rbp-0x4],cl
  80034d:	66 89 55 f8          	mov    WORD PTR [rbp-0x8],dx
  800351:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    idt[index].offset_low=offset&0xffffu;
    idt[index].offset_high=(offset>>16)&0xffffu;
    idt[index].attr=attr;
    idt[index].selector=selector;
#else
    idt[index].offset_low=offset&0xffff;
  800355:	48 8b 15 a4 d4 00 00 	mov    rdx,QWORD PTR [rip+0xd4a4]        # 80d800 <idt>
  80035c:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800360:	48 c1 e0 04          	shl    rax,0x4
  800364:	48 01 d0             	add    rax,rdx
  800367:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80036b:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  80036e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800372:	48 c1 e8 10          	shr    rax,0x10
  800376:	48 89 c2             	mov    rdx,rax
  800379:	48 8b 0d 80 d4 00 00 	mov    rcx,QWORD PTR [rip+0xd480]        # 80d800 <idt>
  800380:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800384:	48 c1 e0 04          	shl    rax,0x4
  800388:	48 01 c8             	add    rax,rcx
  80038b:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800393:	48 c1 e8 20          	shr    rax,0x20
  800397:	89 c1                	mov    ecx,eax
  800399:	48 8b 15 60 d4 00 00 	mov    rdx,QWORD PTR [rip+0xd460]        # 80d800 <idt>
  8003a0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a4:	48 c1 e0 04          	shl    rax,0x4
  8003a8:	48 01 c2             	add    rdx,rax
  8003ab:	0f b7 c1             	movzx  eax,cx
  8003ae:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003b1:	48 8b 15 48 d4 00 00 	mov    rdx,QWORD PTR [rip+0xd448]        # 80d800 <idt>
  8003b8:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003bc:	48 c1 e0 04          	shl    rax,0x4
  8003c0:	48 01 d0             	add    rax,rdx
  8003c3:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c7:	83 ca 01             	or     edx,0x1
  8003ca:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003ce:	48 8b 15 2b d4 00 00 	mov    rdx,QWORD PTR [rip+0xd42b]        # 80d800 <idt>
  8003d5:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d9:	48 c1 e0 04          	shl    rax,0x4
  8003dd:	48 01 c2             	add    rdx,rax
  8003e0:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003e4:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e8:	48 8b 15 11 d4 00 00 	mov    rdx,QWORD PTR [rip+0xd411]        # 80d800 <idt>
  8003ef:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003f3:	48 c1 e0 04          	shl    rax,0x4
  8003f7:	48 01 d0             	add    rax,rdx
  8003fa:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
#endif
}
  800401:	90                   	nop
  800402:	5d                   	pop    rbp
  800403:	c3                   	ret    

0000000000800404 <divide_err>:

void divide_err(){
  800404:	f3 0f 1e fa          	endbr64 
  800408:	55                   	push   rbp
  800409:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80040c:	fa                   	cli    
    //puts("divide err");
    eoi();
  80040d:	b8 00 00 00 00       	mov    eax,0x0
  800412:	e8 07 63 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800417:	fb                   	sti    
  800418:	c9                   	leave  
  800419:	48 cf                	iretq  
}
  80041b:	90                   	nop
  80041c:	5d                   	pop    rbp
  80041d:	c3                   	ret    

000000000080041e <debug>:

void debug(){
  80041e:	f3 0f 1e fa          	endbr64 
  800422:	55                   	push   rbp
  800423:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800426:	fa                   	cli    
    //puts("debug");
    eoi();
  800427:	b8 00 00 00 00       	mov    eax,0x0
  80042c:	e8 ed 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800431:	fb                   	sti    
  800432:	c9                   	leave  
  800433:	48 cf                	iretq  
}
  800435:	90                   	nop
  800436:	5d                   	pop    rbp
  800437:	c3                   	ret    

0000000000800438 <default_int_proc>:
void default_int_proc(){
  800438:	f3 0f 1e fa          	endbr64 
  80043c:	55                   	push   rbp
  80043d:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800440:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  800441:	b8 00 00 00 00       	mov    eax,0x0
  800446:	e8 d3 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80044b:	fb                   	sti    
  80044c:	c9                   	leave  
  80044d:	48 cf                	iretq  
}
  80044f:	90                   	nop
  800450:	5d                   	pop    rbp
  800451:	c3                   	ret    

0000000000800452 <breakpoint>:
void breakpoint(){
  800452:	f3 0f 1e fa          	endbr64 
  800456:	55                   	push   rbp
  800457:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80045a:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  80045b:	b8 00 00 00 00       	mov    eax,0x0
  800460:	e8 b9 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800465:	fb                   	sti    
  800466:	c9                   	leave  
  800467:	48 cf                	iretq  
}
  800469:	90                   	nop
  80046a:	5d                   	pop    rbp
  80046b:	c3                   	ret    

000000000080046c <overflow>:
void overflow(){
  80046c:	f3 0f 1e fa          	endbr64 
  800470:	55                   	push   rbp
  800471:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800474:	fa                   	cli    
    //puts("overflow");
    eoi();
  800475:	b8 00 00 00 00       	mov    eax,0x0
  80047a:	e8 9f 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80047f:	fb                   	sti    
  800480:	c9                   	leave  
  800481:	48 cf                	iretq  
}
  800483:	90                   	nop
  800484:	5d                   	pop    rbp
  800485:	c3                   	ret    

0000000000800486 <bounds>:
void bounds(){
  800486:	f3 0f 1e fa          	endbr64 
  80048a:	55                   	push   rbp
  80048b:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80048e:	fa                   	cli    
    //puts("bounds");
    eoi();
  80048f:	b8 00 00 00 00       	mov    eax,0x0
  800494:	e8 85 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800499:	fb                   	sti    
  80049a:	c9                   	leave  
  80049b:	48 cf                	iretq  
}
  80049d:	90                   	nop
  80049e:	5d                   	pop    rbp
  80049f:	c3                   	ret    

00000000008004a0 <undefined_operator>:
void undefined_operator(){
  8004a0:	f3 0f 1e fa          	endbr64 
  8004a4:	55                   	push   rbp
  8004a5:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  8004a8:	b8 00 00 00 00       	mov    eax,0x0
  8004ad:	e8 6c 62 00 00       	call   80671e <eoi>
    report_back_trace_of_err();
  8004b2:	b8 00 00 00 00       	mov    eax,0x0
  8004b7:	e8 8d 62 00 00       	call   806749 <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  8004bc:	eb fe                	jmp    8004bc <undefined_operator+0x1c>
  8004be:	c9                   	leave  
  8004bf:	48 cf                	iretq  
}
  8004c1:	90                   	nop
  8004c2:	5d                   	pop    rbp
  8004c3:	c3                   	ret    

00000000008004c4 <coprocessor_notexist>:
void coprocessor_notexist(){
  8004c4:	f3 0f 1e fa          	endbr64 
  8004c8:	55                   	push   rbp
  8004c9:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004cc:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  8004cd:	b8 00 00 00 00       	mov    eax,0x0
  8004d2:	e8 47 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004d7:	fb                   	sti    
  8004d8:	c9                   	leave  
  8004d9:	48 cf                	iretq  
}
  8004db:	90                   	nop
  8004dc:	5d                   	pop    rbp
  8004dd:	c3                   	ret    

00000000008004de <double_ints>:
void double_ints(){
  8004de:	f3 0f 1e fa          	endbr64 
  8004e2:	55                   	push   rbp
  8004e3:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004e6:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  8004e7:	b8 00 00 00 00       	mov    eax,0x0
  8004ec:	e8 2d 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004f1:	fb                   	sti    
  8004f2:	c9                   	leave  
  8004f3:	48 cf                	iretq  
}
  8004f5:	90                   	nop
  8004f6:	5d                   	pop    rbp
  8004f7:	c3                   	ret    

00000000008004f8 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  8004f8:	f3 0f 1e fa          	endbr64 
  8004fc:	55                   	push   rbp
  8004fd:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  800500:	b8 00 00 00 00       	mov    eax,0x0
  800505:	e8 14 62 00 00       	call   80671e <eoi>
    __asm__ volatile ("leave \r\n iretq");
  80050a:	c9                   	leave  
  80050b:	48 cf                	iretq  
}
  80050d:	90                   	nop
  80050e:	5d                   	pop    rbp
  80050f:	c3                   	ret    

0000000000800510 <invalid_tss>:
void invalid_tss(){
  800510:	f3 0f 1e fa          	endbr64 
  800514:	55                   	push   rbp
  800515:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800518:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  800519:	b8 00 00 00 00       	mov    eax,0x0
  80051e:	e8 fb 61 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800523:	fb                   	sti    
  800524:	c9                   	leave  
  800525:	48 cf                	iretq  
}
  800527:	90                   	nop
  800528:	5d                   	pop    rbp
  800529:	c3                   	ret    

000000000080052a <segment_notexist>:
void segment_notexist(){
  80052a:	f3 0f 1e fa          	endbr64 
  80052e:	55                   	push   rbp
  80052f:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800532:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  800533:	b8 00 00 00 00       	mov    eax,0x0
  800538:	e8 e1 61 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80053d:	fb                   	sti    
  80053e:	c9                   	leave  
  80053f:	48 cf                	iretq  
}
  800541:	90                   	nop
  800542:	5d                   	pop    rbp
  800543:	c3                   	ret    

0000000000800544 <stackseg_overbound>:
void stackseg_overbound(){
  800544:	f3 0f 1e fa          	endbr64 
  800548:	55                   	push   rbp
  800549:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80054c:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  80054d:	b8 00 00 00 00       	mov    eax,0x0
  800552:	e8 c7 61 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800557:	fb                   	sti    
  800558:	c9                   	leave  
  800559:	48 cf                	iretq  
}
  80055b:	90                   	nop
  80055c:	5d                   	pop    rbp
  80055d:	c3                   	ret    

000000000080055e <general_protect>:
void general_protect(){
  80055e:	f3 0f 1e fa          	endbr64 
  800562:	55                   	push   rbp
  800563:	48 89 e5             	mov    rbp,rsp
  800566:	48 83 ec 10          	sub    rsp,0x10
    //print("general protect.");
    int err_code=0;
  80056a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  800571:	b8 00 00 00 00       	mov    eax,0x0
  800576:	e8 a3 61 00 00       	call   80671e <eoi>
    __asm__ volatile ("leave\r\n add $8,%rsp \r\n iretq");
  80057b:	c9                   	leave  
  80057c:	48 83 c4 08          	add    rsp,0x8
  800580:	48 cf                	iretq  
}
  800582:	90                   	nop
  800583:	c9                   	leave  
  800584:	c3                   	ret    

0000000000800585 <coprocessor_err>:

void coprocessor_err(){
  800585:	f3 0f 1e fa          	endbr64 
  800589:	55                   	push   rbp
  80058a:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80058d:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  80058e:	b8 00 00 00 00       	mov    eax,0x0
  800593:	e8 86 61 00 00       	call   80671e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800598:	fb                   	sti    
  800599:	c9                   	leave  
  80059a:	48 cf                	iretq  
}
  80059c:	90                   	nop
  80059d:	5d                   	pop    rbp
  80059e:	c3                   	ret    

000000000080059f <syscall>:

xchg rcx to r10

*/
int syscall(int a, int b, int c, int d, int e, int f)
{
  80059f:	f3 0f 1e fa          	endbr64 
  8005a3:	55                   	push   rbp
  8005a4:	48 89 e5             	mov    rbp,rsp
  8005a7:	48 83 ec 30          	sub    rsp,0x30
  8005ab:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8005ae:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8005b1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8005b4:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8005b7:	44 89 45 dc          	mov    DWORD PTR [rbp-0x24],r8d
  8005bb:	44 89 4d d8          	mov    DWORD PTR [rbp-0x28],r9d
    unsigned long num;
    asm volatile("":"=a"(num));//这样rax中存的参数就到这了
  8005bf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    switch (num)
  8005c3:	48 83 7d f8 64       	cmp    QWORD PTR [rbp-0x8],0x64
  8005c8:	0f 87 79 02 00 00    	ja     800847 <syscall+0x2a8>
  8005ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8005d2:	48 c1 e0 03          	shl    rax,0x3
  8005d6:	48 05 80 50 81 00    	add    rax,0x815080
  8005dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005df:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005e2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e5:	48 98                	cdqe   
  8005e7:	48 89 c7             	mov    rdi,rax
  8005ea:	e8 39 29 00 00       	call   802f28 <reg_device>
  8005ef:	e9 53 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 1:return dispose_device(a);
  8005f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f7:	89 c7                	mov    edi,eax
  8005f9:	e8 89 33 00 00       	call   803987 <dispose_device>
  8005fe:	e9 44 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 2:return reg_driver(a);
  800603:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800606:	48 98                	cdqe   
  800608:	48 89 c7             	mov    rdi,rax
  80060b:	e8 00 2c 00 00       	call   803210 <reg_driver>
  800610:	e9 32 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 3:return dispose_driver(a);
  800615:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800618:	48 98                	cdqe   
  80061a:	48 89 c7             	mov    rdi,rax
  80061d:	e8 03 34 00 00       	call   803a25 <dispose_driver>
  800622:	e9 20 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 4:return call_drv_func(a,b,c);
  800627:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80062a:	48 98                	cdqe   
  80062c:	48 89 c2             	mov    rdx,rax
  80062f:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800632:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800635:	89 ce                	mov    esi,ecx
  800637:	89 c7                	mov    edi,eax
  800639:	e8 f2 30 00 00       	call   803730 <call_drv_func>
  80063e:	e9 04 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 5:return req_page_at(a,b);
  800643:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800646:	48 98                	cdqe   
  800648:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80064b:	89 d6                	mov    esi,edx
  80064d:	48 89 c7             	mov    rdi,rax
  800650:	e8 a0 11 00 00       	call   8017f5 <req_page_at>
  800655:	e9 ed 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 6:return free_page(a);
  80065a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80065d:	48 98                	cdqe   
  80065f:	48 89 c7             	mov    rdi,rax
  800662:	e8 5a 0f 00 00       	call   8015c1 <free_page>
  800667:	e9 db 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 7:return reg_proc(a, b, c);
  80066c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80066f:	48 98                	cdqe   
  800671:	48 89 c2             	mov    rdx,rax
  800674:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800677:	48 98                	cdqe   
  800679:	48 89 c1             	mov    rcx,rax
  80067c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80067f:	48 98                	cdqe   
  800681:	48 89 ce             	mov    rsi,rcx
  800684:	48 89 c7             	mov    rdi,rax
  800687:	e8 0d 46 00 00       	call   804c99 <reg_proc>
  80068c:	e9 b6 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 8:del_proc(a);
  800691:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800694:	89 c7                	mov    edi,eax
  800696:	e8 1a 44 00 00       	call   804ab5 <del_proc>
        case 10:chk_vm(a,b);
  80069b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80069e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a1:	89 d6                	mov    esi,edx
  8006a3:	89 c7                	mov    edi,eax
  8006a5:	e8 24 12 00 00       	call   8018ce <chk_vm>
        case 11:return sys_open(a,b);
  8006aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006ad:	48 98                	cdqe   
  8006af:	48 89 c2             	mov    rdx,rax
  8006b2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b5:	89 c6                	mov    esi,eax
  8006b7:	48 89 d7             	mov    rdi,rdx
  8006ba:	e8 2e 7d 00 00       	call   8083ed <sys_open>
  8006bf:	e9 83 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 12:return sys_close(a);
  8006c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c7:	89 c7                	mov    edi,eax
  8006c9:	e8 b6 82 00 00       	call   808984 <sys_close>
  8006ce:	e9 74 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 13:return sys_read(a,b,c);
  8006d3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006d6:	48 63 d0             	movsxd rdx,eax
  8006d9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006dc:	48 98                	cdqe   
  8006de:	48 89 c1             	mov    rcx,rax
  8006e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006e4:	48 89 ce             	mov    rsi,rcx
  8006e7:	89 c7                	mov    edi,eax
  8006e9:	e8 4e 83 00 00       	call   808a3c <sys_read>
  8006ee:	e9 54 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 14:return sys_write(a,b,c);
  8006f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006f6:	48 63 d0             	movsxd rdx,eax
  8006f9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006fc:	48 98                	cdqe   
  8006fe:	48 89 c1             	mov    rcx,rax
  800701:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800704:	48 89 ce             	mov    rsi,rcx
  800707:	89 c7                	mov    edi,eax
  800709:	e8 de 83 00 00       	call   808aec <sys_write>
  80070e:	e9 34 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 15:return sys_lseek(a,b,c);
  800713:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800716:	48 63 c8             	movsxd rcx,eax
  800719:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80071c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071f:	48 89 ce             	mov    rsi,rcx
  800722:	89 c7                	mov    edi,eax
  800724:	e8 73 84 00 00       	call   808b9c <sys_lseek>
  800729:	e9 19 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 16:return sys_tell(a);
  80072e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800731:	89 c7                	mov    edi,eax
  800733:	e8 7a 15 00 00       	call   801cb2 <sys_tell>
  800738:	e9 0a 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 17:return reg_vol(a,b,c);
  80073d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800740:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800743:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800746:	89 ce                	mov    esi,ecx
  800748:	89 c7                	mov    edi,eax
  80074a:	b8 00 00 00 00       	mov    eax,0x0
  80074f:	e8 53 14 00 00       	call   801ba7 <reg_vol>
  800754:	e9 ee 00 00 00       	jmp    800847 <syscall+0x2a8>
        case 18:return free_vol(a);
  800759:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80075c:	89 c7                	mov    edi,eax
  80075e:	b8 00 00 00 00       	mov    eax,0x0
  800763:	e8 23 14 00 00       	call   801b8b <free_vol>
  800768:	e9 da 00 00 00       	jmp    800847 <syscall+0x2a8>
        case 19:return execute(a, NULL);
  80076d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800770:	48 98                	cdqe   
  800772:	be 00 00 00 00       	mov    esi,0x0
  800777:	48 89 c7             	mov    rdi,rax
  80077a:	e8 55 62 00 00       	call   8069d4 <execute>
  80077f:	e9 c3 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_EXIT:return sys_exit(a);
  800784:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800787:	89 c7                	mov    edi,eax
  800789:	e8 d6 44 00 00       	call   804c64 <sys_exit>
  80078e:	e9 b4 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_CALL:return exec_call(a);
  800793:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800796:	48 98                	cdqe   
  800798:	48 89 c7             	mov    rdi,rax
  80079b:	e8 2b 64 00 00       	call   806bcb <exec_call>
  8007a0:	e9 a2 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a8:	89 c7                	mov    edi,eax
  8007aa:	e8 7d 12 00 00       	call   801a2c <sys_mkfifo>
  8007af:	e9 93 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007b4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b7:	89 c7                	mov    edi,eax
  8007b9:	e8 a3 46 00 00       	call   804e61 <sys_malloc>
  8007be:	e9 84 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FREE:return sys_free(a);
  8007c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007c6:	89 c7                	mov    edi,eax
  8007c8:	e8 22 48 00 00       	call   804fef <sys_free>
  8007cd:	eb 78                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007cf:	b8 00 00 00 00       	mov    eax,0x0
  8007d4:	e8 d9 8b 00 00       	call   8093b2 <sys_analyse_key>
  8007d9:	0f be c0             	movsx  eax,al
  8007dc:	eb 69                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007e1:	48 98                	cdqe   
  8007e3:	48 89 c7             	mov    rdi,rax
  8007e6:	e8 75 2b 00 00       	call   803360 <sys_find_dev>
  8007eb:	eb 5a                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FORK:return sys_fork();
  8007ed:	e8 0a 4b 00 00       	call   8052fc <sys_fork>
  8007f2:	eb 53                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007f7:	48 98                	cdqe   
  8007f9:	48 89 c2             	mov    rdx,rax
  8007fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007ff:	48 98                	cdqe   
  800801:	48 89 d6             	mov    rsi,rdx
  800804:	48 89 c7             	mov    rdi,rax
  800807:	e8 ca 62 00 00       	call   806ad6 <sys_execve>
  80080c:	eb 39                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(a,b,c);
  80080e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800811:	48 98                	cdqe   
  800813:	48 89 c2             	mov    rdx,rax
  800816:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800819:	48 98                	cdqe   
  80081b:	48 89 c1             	mov    rcx,rax
  80081e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800821:	89 c6                	mov    esi,eax
  800823:	48 89 cf             	mov    rdi,rcx
  800826:	e8 c7 2b 00 00       	call   8033f2 <sys_operate_dev>
  80082b:	eb 1a                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_WAIT:return sys_wait(a,b,c);
  80082d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800830:	48 98                	cdqe   
  800832:	48 89 c1             	mov    rcx,rax
  800835:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800838:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80083b:	48 89 ce             	mov    rsi,rcx
  80083e:	89 c7                	mov    edi,eax
  800840:	e8 42 84 00 00       	call   808c87 <sys_wait>
  800845:	eb 00                	jmp    800847 <syscall+0x2a8>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");

}
  800847:	c9                   	leave  
  800848:	c3                   	ret    

0000000000800849 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  800849:	f3 0f 1e fa          	endbr64 
  80084d:	55                   	push   rbp
  80084e:	48 89 e5             	mov    rbp,rsp
  800851:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800855:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  800859:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80085d:	48 c1 e8 20          	shr    rax,0x20
  800861:	48 89 c2             	mov    rdx,rax
  800864:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800868:	89 c0                	mov    eax,eax
  80086a:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80086e:	0f 30                	wrmsr  
  800870:	90                   	nop
  800871:	5d                   	pop    rbp
  800872:	c3                   	ret    

0000000000800873 <main>:
#include "syscall.h"
#include "fcntl.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800873:	f3 0f 1e fa          	endbr64 
  800877:	55                   	push   rbp
  800878:	48 89 e5             	mov    rbp,rsp
  80087b:	48 83 ec 60          	sub    rsp,0x60
  80087f:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800882:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800886:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80088d:	00 
    mbi=(struct multiboot_header*)addr;
  80088e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800892:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800896:	b8 00 00 00 00       	mov    eax,0x0
  80089b:	e8 6e 03 00 00       	call   800c0e <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  8008a0:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8008a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008a7:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  8008aa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8008ae:	48 83 c0 08          	add    rax,0x8
  8008b2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8008b6:	e9 61 02 00 00       	jmp    800b1c <main+0x2a9>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8008bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008bf:	8b 00                	mov    eax,DWORD PTR [rax]
  8008c1:	83 f8 08             	cmp    eax,0x8
  8008c4:	0f 87 3f 02 00 00    	ja     800b09 <main+0x296>
  8008ca:	89 c0                	mov    eax,eax
  8008cc:	48 8b 04 c5 f0 53 81 	mov    rax,QWORD PTR [rax*8+0x8153f0]
  8008d3:	00 
  8008d4:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  8008d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008db:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008de:	89 c7                	mov    edi,eax
  8008e0:	e8 8a 07 00 00       	call   80106f <set_high_mem_base>
			break;
  8008e5:	e9 1f 02 00 00       	jmp    800b09 <main+0x296>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  8008ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008ee:	48 83 c0 10          	add    rax,0x10
  8008f2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8008f6:	eb 37                	jmp    80092f <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  8008f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008fc:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8008ff:	89 c2                	mov    edx,eax
  800901:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800905:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  800909:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80090d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800910:	48 89 ce             	mov    rsi,rcx
  800913:	48 89 c7             	mov    rdi,rax
  800916:	e8 6b 07 00 00       	call   801086 <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  80091b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80091f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800922:	89 c2                	mov    edx,eax
  800924:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800928:	48 01 d0             	add    rax,rdx
  80092b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  80092f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800933:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800936:	89 c2                	mov    edx,eax
  800938:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80093c:	48 01 d0             	add    rax,rdx
  80093f:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  800943:	72 b3                	jb     8008f8 <main+0x85>
            }

		}
		break;
  800945:	e9 bf 01 00 00       	jmp    800b09 <main+0x296>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  80094a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80094e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  800952:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  800959:	80 ff ff 
  80095c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			set_framebuffer(*tagfb);
  800960:	48 83 ec 08          	sub    rsp,0x8
  800964:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800968:	ff 70 20             	push   QWORD PTR [rax+0x20]
  80096b:	ff 70 18             	push   QWORD PTR [rax+0x18]
  80096e:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800971:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800974:	ff 30                	push   QWORD PTR [rax]
  800976:	e8 63 6d 00 00       	call   8076de <set_framebuffer>
  80097b:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80097f:	b8 00 00 00 00       	mov    eax,0x0
  800984:	e8 8f 6b 00 00       	call   807518 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800989:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80098d:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800991:	0f b6 c0             	movzx  eax,al
  800994:	83 f8 02             	cmp    eax,0x2
  800997:	0f 84 5a 01 00 00    	je     800af7 <main+0x284>
  80099d:	83 f8 02             	cmp    eax,0x2
  8009a0:	0f 8f 5a 01 00 00    	jg     800b00 <main+0x28d>
  8009a6:	85 c0                	test   eax,eax
  8009a8:	74 0e                	je     8009b8 <main+0x145>
  8009aa:	83 f8 01             	cmp    eax,0x1
  8009ad:	0f 84 15 01 00 00    	je     800ac8 <main+0x255>
  8009b3:	e9 48 01 00 00       	jmp    800b00 <main+0x28d>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  8009b8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8009bc:	48 83 c0 22          	add    rax,0x22
  8009c0:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  8009c4:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  8009cb:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009d2:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8009d9:	e9 d4 00 00 00       	jmp    800ab2 <main+0x23f>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  8009de:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009e1:	48 89 d0             	mov    rax,rdx
  8009e4:	48 01 c0             	add    rax,rax
  8009e7:	48 01 c2             	add    rdx,rax
  8009ea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ee:	48 01 d0             	add    rax,rdx
  8009f1:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009f5:	0f b6 c0             	movzx  eax,al
  8009f8:	ba ff 00 00 00       	mov    edx,0xff
  8009fd:	89 d1                	mov    ecx,edx
  8009ff:	29 c1                	sub    ecx,eax
  800a01:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a04:	48 89 d0             	mov    rax,rdx
  800a07:	48 01 c0             	add    rax,rax
  800a0a:	48 01 c2             	add    rdx,rax
  800a0d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a11:	48 01 d0             	add    rax,rdx
  800a14:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800a18:	0f b6 d0             	movzx  edx,al
  800a1b:	b8 ff 00 00 00       	mov    eax,0xff
  800a20:	29 d0                	sub    eax,edx
  800a22:	89 ce                	mov    esi,ecx
  800a24:	0f af f0             	imul   esi,eax
  800a27:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a2a:	48 89 d0             	mov    rax,rdx
  800a2d:	48 01 c0             	add    rax,rax
  800a30:	48 01 c2             	add    rdx,rax
  800a33:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a37:	48 01 d0             	add    rax,rdx
  800a3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a3d:	0f b6 c8             	movzx  ecx,al
  800a40:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a43:	48 89 d0             	mov    rax,rdx
  800a46:	48 01 c0             	add    rax,rax
  800a49:	48 01 c2             	add    rdx,rax
  800a4c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a50:	48 01 d0             	add    rax,rdx
  800a53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a56:	0f b6 c0             	movzx  eax,al
  800a59:	0f af c1             	imul   eax,ecx
  800a5c:	01 c6                	add    esi,eax
  800a5e:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a61:	48 89 d0             	mov    rax,rdx
  800a64:	48 01 c0             	add    rax,rax
  800a67:	48 01 c2             	add    rdx,rax
  800a6a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a6e:	48 01 d0             	add    rax,rdx
  800a71:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a75:	0f b6 c8             	movzx  ecx,al
  800a78:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a7b:	48 89 d0             	mov    rax,rdx
  800a7e:	48 01 c0             	add    rax,rax
  800a81:	48 01 c2             	add    rdx,rax
  800a84:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a88:	48 01 d0             	add    rax,rdx
  800a8b:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a8f:	0f b6 c0             	movzx  eax,al
  800a92:	0f af c1             	imul   eax,ecx
  800a95:	01 f0                	add    eax,esi
  800a97:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a9a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a9d:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800aa0:	73 0c                	jae    800aae <main+0x23b>
					{
						color = i;
  800aa2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800aa5:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800aa8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800aab:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800aae:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800ab2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ab6:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800aba:	0f b7 c0             	movzx  eax,ax
  800abd:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800ac0:	0f 82 18 ff ff ff    	jb     8009de <main+0x16b>
					}
				}
			}
			break;
  800ac6:	eb 40                	jmp    800b08 <main+0x295>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800ac8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800acc:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800ad0:	0f b6 c0             	movzx  eax,al
  800ad3:	ba 01 00 00 00       	mov    edx,0x1
  800ad8:	89 c1                	mov    ecx,eax
  800ada:	d3 e2                	shl    edx,cl
  800adc:	89 d0                	mov    eax,edx
  800ade:	8d 50 ff             	lea    edx,[rax-0x1]
  800ae1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ae5:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800ae9:	0f b6 c0             	movzx  eax,al
  800aec:	89 c1                	mov    ecx,eax
  800aee:	d3 e2                	shl    edx,cl
  800af0:	89 d0                	mov    eax,edx
  800af2:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800af5:	eb 11                	jmp    800b08 <main+0x295>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800af7:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800afe:	eb 08                	jmp    800b08 <main+0x295>

			default:
				color = 0xffffffff;
  800b00:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800b07:	90                   	nop
			}

			break;
  800b08:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800b09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b0d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b10:	83 c0 07             	add    eax,0x7
  800b13:	89 c0                	mov    eax,eax
  800b15:	83 e0 f8             	and    eax,0xfffffff8
  800b18:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800b1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b20:	8b 00                	mov    eax,DWORD PTR [rax]
  800b22:	85 c0                	test   eax,eax
  800b24:	0f 85 91 fd ff ff    	jne    8008bb <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800b2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b2e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b31:	83 c0 07             	add    eax,0x7
  800b34:	89 c0                	mov    eax,eax
  800b36:	83 e0 f8             	and    eax,0xfffffff8
  800b39:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800b3d:	b8 75 04 00 00       	mov    eax,0x475
  800b42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800b45:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800b48:	b8 00 00 00 00       	mov    eax,0x0
  800b4d:	e8 a3 6a 00 00       	call   8075f5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b52:	bf a8 53 81 00       	mov    edi,0x8153a8
  800b57:	e8 6f 6f 00 00       	call   807acb <print>
    init_int();
  800b5c:	b8 00 00 00 00       	mov    eax,0x0
  800b61:	e8 9a f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b66:	bf c5 53 81 00       	mov    edi,0x8153c5
  800b6b:	e8 5b 6f 00 00       	call   807acb <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b70:	b8 00 00 00 00       	mov    eax,0x0
  800b75:	e8 00 08 00 00       	call   80137a <init_memory>
    init_com(PORT_COM1);
  800b7a:	bf f8 03 00 00       	mov    edi,0x3f8
  800b7f:	e8 00 c1 00 00       	call   80cc84 <init_com>
    comprintf("\rgamessis os loaded.\r\n");
  800b84:	bf d2 53 81 00       	mov    edi,0x8153d2
  800b89:	b8 00 00 00 00       	mov    eax,0x0
  800b8e:	e8 34 c2 00 00       	call   80cdc7 <comprintf>
	init_paging();
  800b93:	b8 00 00 00 00       	mov    eax,0x0
  800b98:	e8 c7 04 00 00       	call   801064 <init_paging>
 	init_gdt();
  800b9d:	b8 00 00 00 00       	mov    eax,0x0
  800ba2:	e8 c6 5b 00 00       	call   80676d <init_gdt>
    mount_rootfs();
  800ba7:	b8 00 00 00 00       	mov    eax,0x0
  800bac:	e8 b0 76 00 00       	call   808261 <mount_rootfs>
    init_devman();
  800bb1:	b8 00 00 00 00       	mov    eax,0x0
  800bb6:	e8 46 1c 00 00       	call   802801 <init_devman>
    init_proc();
  800bbb:	b8 00 00 00 00       	mov    eax,0x0
  800bc0:	e8 34 32 00 00       	call   803df9 <init_proc>
    sti();
  800bc5:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800bc6:	b8 00 00 00 00       	mov    eax,0x0
  800bcb:	e8 7a ba 00 00       	call   80c64a <DISK1_FAT32_FS_init>

    //自带驱动
    //init_tty();
    init_kb();
  800bd0:	b8 00 00 00 00       	mov    eax,0x0
  800bd5:	e8 65 86 00 00       	call   80923f <init_kb>
//    init_disk();


    manage_proc_lock=0;
  800bda:	c7 05 24 cc 00 00 00 	mov    DWORD PTR [rip+0xcc24],0x0        # 80d808 <manage_proc_lock>
  800be1:	00 00 00 
//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());
    while (1)
    {
        char c=-1;
  800be4:	c6 45 b3 ff          	mov    BYTE PTR [rbp-0x4d],0xff
        sys_read(0,&c,1);
  800be8:	48 8d 45 b3          	lea    rax,[rbp-0x4d]
  800bec:	ba 01 00 00 00       	mov    edx,0x1
  800bf1:	48 89 c6             	mov    rsi,rax
  800bf4:	bf 00 00 00 00       	mov    edi,0x0
  800bf9:	e8 3e 7e 00 00       	call   808a3c <sys_read>
        putchar(c);
  800bfe:	0f b6 45 b3          	movzx  eax,BYTE PTR [rbp-0x4d]
  800c02:	0f be c0             	movsx  eax,al
  800c05:	89 c7                	mov    edi,eax
  800c07:	e8 41 01 00 00       	call   800d4d <putchar>
    {
  800c0c:	eb d6                	jmp    800be4 <main+0x371>

0000000000800c0e <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800c0e:	f3 0f 1e fa          	endbr64 
  800c12:	55                   	push   rbp
  800c13:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800c16:	48 c7 05 df f3 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff3df],0xb8000        # 400000 <video>
  800c1d:	00 80 0b 00 
    xpos=0;
  800c21:	c7 05 dd f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3dd],0x0        # 400008 <xpos>
  800c28:	00 00 00 
    ypos=0;
  800c2b:	c7 05 d7 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3d7],0x0        # 40000c <ypos>
  800c32:	00 00 00 
}
  800c35:	90                   	nop
  800c36:	5d                   	pop    rbp
  800c37:	c3                   	ret    

0000000000800c38 <itoa>:

void itoa (char *buf, int base, int d)
{
  800c38:	f3 0f 1e fa          	endbr64 
  800c3c:	55                   	push   rbp
  800c3d:	48 89 e5             	mov    rbp,rsp
  800c40:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800c44:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800c47:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800c4a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c52:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c55:	48 98                	cdqe   
  800c57:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c5b:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c62:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c66:	75 27                	jne    800c8f <itoa+0x57>
  800c68:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c6c:	79 21                	jns    800c8f <itoa+0x57>
    {
        *p++ = '-';
  800c6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c72:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c76:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c7a:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c7d:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c82:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c85:	f7 d8                	neg    eax
  800c87:	48 98                	cdqe   
  800c89:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c8d:	eb 0d                	jmp    800c9c <itoa+0x64>
    }
    else if (base == 'x')
  800c8f:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c93:	75 07                	jne    800c9c <itoa+0x64>
        divisor = 16;
  800c95:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c9c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c9f:	48 63 c8             	movsxd rcx,eax
  800ca2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800ca6:	ba 00 00 00 00       	mov    edx,0x0
  800cab:	48 f7 f1             	div    rcx
  800cae:	48 89 d0             	mov    rax,rdx
  800cb1:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800cb4:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800cb8:	7f 0a                	jg     800cc4 <itoa+0x8c>
  800cba:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cbd:	83 c0 30             	add    eax,0x30
  800cc0:	89 c1                	mov    ecx,eax
  800cc2:	eb 08                	jmp    800ccc <itoa+0x94>
  800cc4:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cc7:	83 c0 57             	add    eax,0x57
  800cca:	89 c1                	mov    ecx,eax
  800ccc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cd0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800cd4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800cd8:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800cda:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800cdd:	48 63 f0             	movsxd rsi,eax
  800ce0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800ce4:	ba 00 00 00 00       	mov    edx,0x0
  800ce9:	48 f7 f6             	div    rsi
  800cec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800cf0:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800cf5:	75 a5                	jne    800c9c <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800cf7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cfb:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800cfe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800d02:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800d06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800d0a:	48 83 e8 01          	sub    rax,0x1
  800d0e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800d12:	eb 2b                	jmp    800d3f <itoa+0x107>
    {
        char tmp = *p1;
  800d14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d1b:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800d1e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d22:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800d25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d29:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800d2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d2f:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800d33:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800d35:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800d3a:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800d3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d43:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800d47:	72 cb                	jb     800d14 <itoa+0xdc>
    }
}
  800d49:	90                   	nop
  800d4a:	90                   	nop
  800d4b:	5d                   	pop    rbp
  800d4c:	c3                   	ret    

0000000000800d4d <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800d4d:	f3 0f 1e fa          	endbr64 
  800d51:	55                   	push   rbp
  800d52:	48 89 e5             	mov    rbp,rsp
  800d55:	48 83 ec 20          	sub    rsp,0x20
  800d59:	89 f8                	mov    eax,edi
  800d5b:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d5e:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d62:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d65:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d69:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d6d:	48 89 c7             	mov    rdi,rax
  800d70:	e8 56 6d 00 00       	call   807acb <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d75:	c9                   	leave  
  800d76:	c3                   	ret    

0000000000800d77 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format,...)
{
  800d77:	f3 0f 1e fa          	endbr64 
  800d7b:	55                   	push   rbp
  800d7c:	48 89 e5             	mov    rbp,rsp
  800d7f:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  800d86:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  800d8d:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d94:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d9b:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800da2:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800da9:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800db0:	84 c0                	test   al,al
  800db2:	74 20                	je     800dd4 <printf+0x5d>
  800db4:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800db8:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800dbc:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800dc0:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800dc4:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800dc8:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800dcc:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800dd0:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    if(strlen(format)>=1024)
  800dd4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  800ddb:	48 89 c7             	mov    rdi,rax
  800dde:	e8 74 c3 00 00       	call   80d157 <strlen>
  800de3:	3d ff 03 00 00       	cmp    eax,0x3ff
  800de8:	0f 8f 97 00 00 00    	jg     800e85 <printf+0x10e>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  800dee:	b8 00 00 00 00       	mov    eax,0x0
  800df3:	e8 1a 03 00 00       	call   801112 <vmalloc>
  800df8:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    va_list vargs;
    va_start(vargs,format);
  800dff:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
  800e06:	00 00 00 
  800e09:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
  800e10:	00 00 00 
  800e13:	48 8d 45 10          	lea    rax,[rbp+0x10]
  800e17:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
  800e1e:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  800e25:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    sprintf(tmp,format,vargs);
  800e2c:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  800e33:	48 8b 8d 28 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd8]
  800e3a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e41:	48 89 ce             	mov    rsi,rcx
  800e44:	48 89 c7             	mov    rdi,rax
  800e47:	b8 00 00 00 00       	mov    eax,0x0
  800e4c:	e8 34 c3 00 00       	call   80d185 <sprintf>
    va_end(vargs);
    print(tmp);
  800e51:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e58:	48 89 c7             	mov    rdi,rax
  800e5b:	e8 6b 6c 00 00       	call   807acb <print>
    comprintf(tmp);
  800e60:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e67:	48 89 c7             	mov    rdi,rax
  800e6a:	b8 00 00 00 00       	mov    eax,0x0
  800e6f:	e8 53 bf 00 00       	call   80cdc7 <comprintf>
    vmfree(tmp);
  800e74:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e7b:	48 89 c7             	mov    rdi,rax
  800e7e:	e8 2f 03 00 00       	call   8011b2 <vmfree>
  800e83:	eb 01                	jmp    800e86 <printf+0x10f>
        return;//一次性输出不了太长
  800e85:	90                   	nop
//                putchar (*((int *) arg++));
//                break;
//            }
//        }
//    }
}
  800e86:	c9                   	leave  
  800e87:	c3                   	ret    

0000000000800e88 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e88:	f3 0f 1e fa          	endbr64 
  800e8c:	55                   	push   rbp
  800e8d:	48 89 e5             	mov    rbp,rsp
  800e90:	48 83 ec 20          	sub    rsp,0x20
  800e94:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800e98:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800e9c:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
    return smmap(pa,la,attr,current->pml4);
  800e9f:	48 8b 05 9a 43 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1439a]        # 415240 <current>
  800ea6:	48 8b 88 c0 00 00 00 	mov    rcx,QWORD PTR [rax+0xc0]
  800ead:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800eb0:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  800eb4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800eb8:	48 89 c7             	mov    rdi,rax
  800ebb:	e8 02 00 00 00       	call   800ec2 <smmap>
    pt=(page_item*)((addr_t)pt & ~0xff);

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
    return NORMAL;*/
}
  800ec0:	c9                   	leave  
  800ec1:	c3                   	ret    

0000000000800ec2 <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  800ec2:	f3 0f 1e fa          	endbr64 
  800ec6:	55                   	push   rbp
  800ec7:	48 89 e5             	mov    rbp,rsp
  800eca:	48 83 ec 40          	sub    rsp,0x40
  800ece:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ed2:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ed6:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  800ed9:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800edd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ee1:	48 c1 e8 27          	shr    rax,0x27
  800ee5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800eec:	00 
  800eed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800ef1:	48 01 d0             	add    rax,rdx
  800ef4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ef7:	b0 00                	mov    al,0x0
  800ef9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800efd:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f04:	00 00 00 
  800f07:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f0b:	48 c1 e8 1e          	shr    rax,0x1e
  800f0f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f12:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f15:	48 98                	cdqe   
  800f17:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f1e:	00 
  800f1f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f23:	48 01 d0             	add    rax,rdx
  800f26:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f31:	83 e0 01             	and    eax,0x1
  800f34:	48 85 c0             	test   rax,rax
  800f37:	75 45                	jne    800f7e <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  800f39:	b8 00 00 00 00       	mov    eax,0x0
  800f3e:	e8 cf 01 00 00       	call   801112 <vmalloc>
  800f43:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f4b:	ba 00 10 00 00       	mov    edx,0x1000
  800f50:	be 00 00 00 00       	mov    esi,0x0
  800f55:	48 89 c7             	mov    rdi,rax
  800f58:	e8 8c bf 00 00       	call   80cee9 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f5d:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f60:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f64:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f67:	48 98                	cdqe   
  800f69:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f70:	00 
  800f71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f75:	48 01 f0             	add    rax,rsi
  800f78:	48 09 ca             	or     rdx,rcx
  800f7b:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f82:	b0 00                	mov    al,0x0
  800f84:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f88:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f8c:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f91:	48 c1 e8 15          	shr    rax,0x15
  800f95:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f9c:	00 
  800f9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fa1:	48 01 d0             	add    rax,rdx
  800fa4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fa7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800faf:	83 e0 01             	and    eax,0x1
  800fb2:	48 85 c0             	test   rax,rax
  800fb5:	75 4d                	jne    801004 <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  800fb7:	b8 00 00 00 00       	mov    eax,0x0
  800fbc:	e8 51 01 00 00       	call   801112 <vmalloc>
  800fc1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fc9:	ba 00 10 00 00       	mov    edx,0x1000
  800fce:	be 00 00 00 00       	mov    esi,0x0
  800fd3:	48 89 c7             	mov    rdi,rax
  800fd6:	e8 0e bf 00 00       	call   80cee9 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fdb:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fde:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fe2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fe6:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800feb:	48 c1 e8 15          	shr    rax,0x15
  800fef:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800ff6:	00 
  800ff7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ffb:	48 01 f0             	add    rax,rsi
  800ffe:	48 09 ca             	or     rdx,rcx
  801001:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801004:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801008:	b0 00                	mov    al,0x0
  80100a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80100e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801011:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801015:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  80101b:	48 c1 ea 0c          	shr    rdx,0xc
  80101f:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801026:	00 
  801027:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80102b:	48 01 ca             	add    rdx,rcx
  80102e:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801032:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801035:	b8 00 00 00 00       	mov    eax,0x0
}
  80103a:	c9                   	leave  
  80103b:	c3                   	ret    

000000000080103c <mdemap>:

stat_t mdemap(addr_t la)
{
  80103c:	f3 0f 1e fa          	endbr64 
  801040:	55                   	push   rbp
  801041:	48 89 e5             	mov    rbp,rsp
  801044:	48 83 ec 10          	sub    rsp,0x10
  801048:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80104c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801050:	ba 00 00 00 00       	mov    edx,0x0
  801055:	48 89 c6             	mov    rsi,rax
  801058:	bf 00 00 00 00       	mov    edi,0x0
  80105d:	e8 26 fe ff ff       	call   800e88 <mmap>
}
  801062:	c9                   	leave  
  801063:	c3                   	ret    

0000000000801064 <init_paging>:
int init_paging()
{
  801064:	f3 0f 1e fa          	endbr64 
  801068:	55                   	push   rbp
  801069:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80106c:	90                   	nop
  80106d:	5d                   	pop    rbp
  80106e:	c3                   	ret    

000000000080106f <set_high_mem_base>:
void set_high_mem_base(int base)
{
  80106f:	f3 0f 1e fa          	endbr64 
  801073:	55                   	push   rbp
  801074:	48 89 e5             	mov    rbp,rsp
  801077:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  80107a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80107d:	89 05 b5 c7 00 00    	mov    DWORD PTR [rip+0xc7b5],eax        # 80d838 <high_mem_base>
}
  801083:	90                   	nop
  801084:	5d                   	pop    rbp
  801085:	c3                   	ret    

0000000000801086 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  801086:	f3 0f 1e fa          	endbr64 
  80108a:	55                   	push   rbp
  80108b:	48 89 e5             	mov    rbp,rsp
  80108e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801092:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  801096:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  80109a:	8b 05 80 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff180]        # 400220 <mmap_t_i>
  8010a0:	48 63 d0             	movsxd rdx,eax
  8010a3:	48 89 d0             	mov    rax,rdx
  8010a6:	48 01 c0             	add    rax,rax
  8010a9:	48 01 d0             	add    rax,rdx
  8010ac:	48 c1 e0 03          	shl    rax,0x3
  8010b0:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8010b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010bb:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010be:	8b 05 5c f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff15c]        # 400220 <mmap_t_i>
  8010c4:	48 63 d0             	movsxd rdx,eax
  8010c7:	48 89 d0             	mov    rax,rdx
  8010ca:	48 01 c0             	add    rax,rax
  8010cd:	48 01 d0             	add    rax,rdx
  8010d0:	48 c1 e0 03          	shl    rax,0x3
  8010d4:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010df:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010e2:	8b 05 38 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff138]        # 400220 <mmap_t_i>
  8010e8:	8d 50 01             	lea    edx,[rax+0x1]
  8010eb:	89 15 2f f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff12f],edx        # 400220 <mmap_t_i>
  8010f1:	48 63 d0             	movsxd rdx,eax
  8010f4:	48 89 d0             	mov    rax,rdx
  8010f7:	48 01 c0             	add    rax,rax
  8010fa:	48 01 d0             	add    rax,rdx
  8010fd:	48 c1 e0 03          	shl    rax,0x3
  801101:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801108:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80110c:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80110f:	90                   	nop
  801110:	5d                   	pop    rbp
  801111:	c3                   	ret    

0000000000801112 <vmalloc>:
addr_t vmalloc()
{
  801112:	f3 0f 1e fa          	endbr64 
  801116:	55                   	push   rbp
  801117:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80111a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801121:	e9 80 00 00 00       	jmp    8011a6 <vmalloc+0x94>
    {
        for(int j=0;j<32;j++)
  801126:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80112d:	eb 6d                	jmp    80119c <vmalloc+0x8a>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80112f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801132:	48 98                	cdqe   
  801134:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80113b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80113e:	be 01 00 00 00       	mov    esi,0x1
  801143:	89 c1                	mov    ecx,eax
  801145:	d3 e6                	shl    esi,cl
  801147:	89 f0                	mov    eax,esi
  801149:	21 d0                	and    eax,edx
  80114b:	85 c0                	test   eax,eax
  80114d:	75 49                	jne    801198 <vmalloc+0x86>
            {
                vmalloc_map[i]|=(1<<j);
  80114f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801152:	48 98                	cdqe   
  801154:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80115b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80115e:	be 01 00 00 00       	mov    esi,0x1
  801163:	89 c1                	mov    ecx,eax
  801165:	d3 e6                	shl    esi,cl
  801167:	89 f0                	mov    eax,esi
  801169:	09 c2                	or     edx,eax
  80116b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80116e:	48 98                	cdqe   
  801170:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801177:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80117a:	c1 e0 05             	shl    eax,0x5
  80117d:	89 c2                	mov    edx,eax
  80117f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801182:	01 d0                	add    eax,edx
  801184:	c1 e0 0c             	shl    eax,0xc
  801187:	48 98                	cdqe   
  801189:	48 ba 00 00 02 00 00 	movabs rdx,0xffff800000020000
  801190:	80 ff ff 
  801193:	48 01 d0             	add    rax,rdx
  801196:	eb 18                	jmp    8011b0 <vmalloc+0x9e>
        for(int j=0;j<32;j++)
  801198:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80119c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8011a0:	7e 8d                	jle    80112f <vmalloc+0x1d>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8011a2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011a6:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011aa:	0f 8e 76 ff ff ff    	jle    801126 <vmalloc+0x14>
            }
        }
    }
}
  8011b0:	5d                   	pop    rbp
  8011b1:	c3                   	ret    

00000000008011b2 <vmfree>:

int vmfree(addr_t ptr)
{
  8011b2:	f3 0f 1e fa          	endbr64 
  8011b6:	55                   	push   rbp
  8011b7:	48 89 e5             	mov    rbp,rsp
  8011ba:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011c2:	48 c1 e8 0c          	shr    rax,0xc
  8011c6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011cc:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011cf:	85 c0                	test   eax,eax
  8011d1:	0f 48 c2             	cmovs  eax,edx
  8011d4:	c1 f8 05             	sar    eax,0x5
  8011d7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011dd:	99                   	cdq    
  8011de:	c1 ea 1b             	shr    edx,0x1b
  8011e1:	01 d0                	add    eax,edx
  8011e3:	83 e0 1f             	and    eax,0x1f
  8011e6:	29 d0                	sub    eax,edx
  8011e8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011eb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011ee:	48 98                	cdqe   
  8011f0:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011f7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011fa:	be 01 00 00 00       	mov    esi,0x1
  8011ff:	89 c1                	mov    ecx,eax
  801201:	d3 e6                	shl    esi,cl
  801203:	89 f0                	mov    eax,esi
  801205:	f7 d0                	not    eax
  801207:	21 c2                	and    edx,eax
  801209:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80120c:	48 98                	cdqe   
  80120e:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801215:	90                   	nop
  801216:	5d                   	pop    rbp
  801217:	c3                   	ret    

0000000000801218 <page_err>:
void page_err(){
  801218:	f3 0f 1e fa          	endbr64 
  80121c:	55                   	push   rbp
  80121d:	48 89 e5             	mov    rbp,rsp
  801220:	41 54                	push   r12
  801222:	53                   	push   rbx
  801223:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  801227:	fa                   	cli    
    printf("page err\n");
  801228:	bf 38 54 81 00       	mov    edi,0x815438
  80122d:	b8 00 00 00 00       	mov    eax,0x0
  801232:	e8 40 fb ff ff       	call   800d77 <printf>
    unsigned long err_code=0,l_addr=0;
  801237:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80123e:	00 
  80123f:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801246:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801247:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80124b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80124f:	0f 20 d0             	mov    rax,cr2
  801252:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801256:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80125a:	83 e0 01             	and    eax,0x1
  80125d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801260:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801264:	75 41                	jne    8012a7 <page_err+0x8f>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  801266:	48 8b 05 d3 3f c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13fd3]        # 415240 <current>
  80126d:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  801274:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801278:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80127e:	49 89 c4             	mov    r12,rax
  801281:	b8 00 00 00 00       	mov    eax,0x0
  801286:	e8 66 02 00 00       	call   8014f1 <req_a_page>
  80128b:	89 c7                	mov    edi,eax
  80128d:	e8 4e 04 00 00       	call   8016e0 <get_phyaddr>
  801292:	48 98                	cdqe   
  801294:	48 89 d9             	mov    rcx,rbx
  801297:	ba 07 00 00 00       	mov    edx,0x7
  80129c:	4c 89 e6             	mov    rsi,r12
  80129f:	48 89 c7             	mov    rdi,rax
  8012a2:	e8 1b fc ff ff       	call   800ec2 <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8012a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012ab:	83 e0 02             	and    eax,0x2
  8012ae:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("when writing\n");else //puts("when reading");
  8012b1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012b5:	74 11                	je     8012c8 <page_err+0xb0>
  8012b7:	bf 42 54 81 00       	mov    edi,0x815442
  8012bc:	b8 00 00 00 00       	mov    eax,0x0
  8012c1:	e8 b1 fa ff ff       	call   800d77 <printf>
  8012c6:	eb 0a                	jmp    8012d2 <page_err+0xba>
    p=err_code&4;
  8012c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012cc:	83 e0 04             	and    eax,0x4
  8012cf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)printf("supervisor mode\n");else //puts("user mode");
  8012d2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012d6:	75 11                	jne    8012e9 <page_err+0xd1>
  8012d8:	bf 50 54 81 00       	mov    edi,0x815450
  8012dd:	b8 00 00 00 00       	mov    eax,0x0
  8012e2:	e8 90 fa ff ff       	call   800d77 <printf>
  8012e7:	eb 0a                	jmp    8012f3 <page_err+0xdb>
    p=err_code&16;
  8012e9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012ed:	83 e0 10             	and    eax,0x10
  8012f0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("an instruction tries to fetch\n");
  8012f3:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012f7:	74 0f                	je     801308 <page_err+0xf0>
  8012f9:	bf 68 54 81 00       	mov    edi,0x815468
  8012fe:	b8 00 00 00 00       	mov    eax,0x0
  801303:	e8 6f fa ff ff       	call   800d77 <printf>
    unsigned int addr=0;
  801308:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  80130f:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801312:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801315:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801319:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80131c:	89 c6                	mov    esi,eax
  80131e:	bf 88 54 81 00       	mov    edi,0x815488
  801323:	b8 00 00 00 00       	mov    eax,0x0
  801328:	e8 4a fa ff ff       	call   800d77 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  80132d:	48 8b 15 0c 72 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0720c]        # 408540 <task>
  801334:	8b 05 92 3f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13f92]        # 4152cc <cur_proc>
  80133a:	48 98                	cdqe   
  80133c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  801343:	48 01 d0             	add    rax,rdx
  801346:	8b 00                	mov    eax,DWORD PTR [rax]
  801348:	83 f8 01             	cmp    eax,0x1
  80134b:	75 11                	jne    80135e <page_err+0x146>
    {
        printf("sys died. please reboot.\n");
  80134d:	bf aa 54 81 00       	mov    edi,0x8154aa
  801352:	b8 00 00 00 00       	mov    eax,0x0
  801357:	e8 1b fa ff ff       	call   800d77 <printf>
        asm volatile("jmp .");
  80135c:	eb fe                	jmp    80135c <page_err+0x144>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80135e:	b8 00 00 00 00       	mov    eax,0x0
  801363:	e8 b6 53 00 00       	call   80671e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  801368:	fb                   	sti    
  801369:	c9                   	leave  
  80136a:	48 83 c4 08          	add    rsp,0x8
  80136e:	48 cf                	iretq  
}
  801370:	90                   	nop
  801371:	48 83 c4 20          	add    rsp,0x20
  801375:	5b                   	pop    rbx
  801376:	41 5c                	pop    r12
  801378:	5d                   	pop    rbp
  801379:	c3                   	ret    

000000000080137a <init_memory>:
void init_memory()
{
  80137a:	f3 0f 1e fa          	endbr64 
  80137e:	55                   	push   rbp
  80137f:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801382:	8b 05 98 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee98]        # 400220 <mmap_t_i>
  801388:	83 e8 01             	sub    eax,0x1
  80138b:	48 63 d0             	movsxd rdx,eax
  80138e:	48 89 d0             	mov    rax,rdx
  801391:	48 01 c0             	add    rax,rax
  801394:	48 01 d0             	add    rax,rdx
  801397:	48 c1 e0 03          	shl    rax,0x3
  80139b:	48 05 40 00 40 00    	add    rax,0x400040
  8013a1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8013a4:	8b 05 76 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee76]        # 400220 <mmap_t_i>
  8013aa:	83 e8 01             	sub    eax,0x1
  8013ad:	48 63 d0             	movsxd rdx,eax
  8013b0:	48 89 d0             	mov    rax,rdx
  8013b3:	48 01 c0             	add    rax,rax
  8013b6:	48 01 d0             	add    rax,rdx
  8013b9:	48 c1 e0 03          	shl    rax,0x3
  8013bd:	48 05 48 00 40 00    	add    rax,0x400048
  8013c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013c6:	48 01 c8             	add    rax,rcx
  8013c9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8013cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013d1:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8013d8:	48 85 c0             	test   rax,rax
  8013db:	48 0f 48 c2          	cmovs  rax,rdx
  8013df:	48 c1 f8 0c          	sar    rax,0xc
  8013e3:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8013e6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8013e9:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013ec:	85 c0                	test   eax,eax
  8013ee:	0f 48 c2             	cmovs  eax,edx
  8013f1:	c1 f8 05             	sar    eax,0x5
  8013f4:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8013f7:	48 c7 05 1e ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec1e],0xc00000        # 400020 <page_map>
  8013fe:	00 00 c0 00 
    int* p=page_map;
  801402:	48 8b 05 17 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec17]        # 400020 <page_map>
  801409:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80140d:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801414:	00 
    for(int i=0;i<mmap_t_i;i++){
  801415:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80141c:	e9 91 00 00 00       	jmp    8014b2 <init_memory+0x138>
        int cont=0;
  801421:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801428:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80142b:	48 63 d0             	movsxd rdx,eax
  80142e:	48 89 d0             	mov    rax,rdx
  801431:	48 01 c0             	add    rax,rax
  801434:	48 01 d0             	add    rax,rdx
  801437:	48 c1 e0 03          	shl    rax,0x3
  80143b:	48 05 50 00 40 00    	add    rax,0x400050
  801441:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801444:	48 83 f8 01          	cmp    rax,0x1
  801448:	74 07                	je     801451 <init_memory+0xd7>
            cont=-1;
  80144a:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801451:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801458:	eb 15                	jmp    80146f <init_memory+0xf5>
            *(p++)=cont;
  80145a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80145e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801462:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  801466:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801469:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80146b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80146f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801472:	48 63 c8             	movsxd rcx,eax
  801475:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801478:	48 63 d0             	movsxd rdx,eax
  80147b:	48 89 d0             	mov    rax,rdx
  80147e:	48 01 c0             	add    rax,rax
  801481:	48 01 d0             	add    rax,rdx
  801484:	48 c1 e0 03          	shl    rax,0x3
  801488:	48 05 48 00 40 00    	add    rax,0x400048
  80148e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801491:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801498:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80149f:	ff 00 00 
  8014a2:	48 21 d0             	and    rax,rdx
  8014a5:	48 c1 e8 11          	shr    rax,0x11
  8014a9:	48 39 c1             	cmp    rcx,rax
  8014ac:	72 ac                	jb     80145a <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  8014ae:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8014b2:	8b 05 68 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed68]        # 400220 <mmap_t_i>
  8014b8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8014bb:	0f 8c 60 ff ff ff    	jl     801421 <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8014c1:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8014c8:	eb 1d                	jmp    8014e7 <init_memory+0x16d>
        page_map[i]=0xffffffff;
  8014ca:	48 8b 15 4f eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb4f]        # 400020 <page_map>
  8014d1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8014d4:	48 98                	cdqe   
  8014d6:	48 c1 e0 02          	shl    rax,0x2
  8014da:	48 01 d0             	add    rax,rdx
  8014dd:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8014e3:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8014e7:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8014eb:	7e dd                	jle    8014ca <init_memory+0x150>
    }
}
  8014ed:	90                   	nop
  8014ee:	90                   	nop
  8014ef:	5d                   	pop    rbp
  8014f0:	c3                   	ret    

00000000008014f1 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8014f1:	f3 0f 1e fa          	endbr64 
  8014f5:	55                   	push   rbp
  8014f6:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014f9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801500:	e9 b0 00 00 00       	jmp    8015b5 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801505:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80150c:	e9 96 00 00 00       	jmp    8015a7 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801511:	48 8b 15 08 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb08]        # 400020 <page_map>
  801518:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80151b:	48 98                	cdqe   
  80151d:	48 c1 e0 02          	shl    rax,0x2
  801521:	48 01 d0             	add    rax,rdx
  801524:	8b 10                	mov    edx,DWORD PTR [rax]
  801526:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801529:	be 01 00 00 00       	mov    esi,0x1
  80152e:	89 c1                	mov    ecx,eax
  801530:	d3 e6                	shl    esi,cl
  801532:	89 f0                	mov    eax,esi
  801534:	21 d0                	and    eax,edx
  801536:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801539:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80153c:	c1 e0 05             	shl    eax,0x5
  80153f:	89 c2                	mov    edx,eax
  801541:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801544:	01 d0                	add    eax,edx
  801546:	c1 e0 0c             	shl    eax,0xc
  801549:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80154e:	7e 53                	jle    8015a3 <req_a_page+0xb2>
  801550:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801554:	75 4d                	jne    8015a3 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801556:	48 8b 15 c3 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeac3]        # 400020 <page_map>
  80155d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801560:	48 98                	cdqe   
  801562:	48 c1 e0 02          	shl    rax,0x2
  801566:	48 01 d0             	add    rax,rdx
  801569:	8b 10                	mov    edx,DWORD PTR [rax]
  80156b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80156e:	be 01 00 00 00       	mov    esi,0x1
  801573:	89 c1                	mov    ecx,eax
  801575:	d3 e6                	shl    esi,cl
  801577:	89 f0                	mov    eax,esi
  801579:	89 c6                	mov    esi,eax
  80157b:	48 8b 0d 9e ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea9e]        # 400020 <page_map>
  801582:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801585:	48 98                	cdqe   
  801587:	48 c1 e0 02          	shl    rax,0x2
  80158b:	48 01 c8             	add    rax,rcx
  80158e:	09 f2                	or     edx,esi
  801590:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801592:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801595:	c1 e0 05             	shl    eax,0x5
  801598:	89 c2                	mov    edx,eax
  80159a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80159d:	01 d0                	add    eax,edx
  80159f:	48 98                	cdqe   
  8015a1:	eb 1c                	jmp    8015bf <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8015a3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8015a7:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8015ab:	0f 8e 60 ff ff ff    	jle    801511 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8015b1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8015b5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8015b9:	0f 8e 46 ff ff ff    	jle    801505 <req_a_page+0x14>

            }
        }
    }
}
  8015bf:	5d                   	pop    rbp
  8015c0:	c3                   	ret    

00000000008015c1 <free_page>:

int free_page(char *paddr){
  8015c1:	f3 0f 1e fa          	endbr64 
  8015c5:	55                   	push   rbp
  8015c6:	48 89 e5             	mov    rbp,rsp
  8015c9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8015cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015d1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8015d7:	85 c0                	test   eax,eax
  8015d9:	0f 48 c2             	cmovs  eax,edx
  8015dc:	c1 f8 0c             	sar    eax,0xc
  8015df:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8015e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015e5:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015e8:	85 c0                	test   eax,eax
  8015ea:	0f 48 c2             	cmovs  eax,edx
  8015ed:	c1 f8 05             	sar    eax,0x5
  8015f0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8015f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015f6:	99                   	cdq    
  8015f7:	c1 ea 1b             	shr    edx,0x1b
  8015fa:	01 d0                	add    eax,edx
  8015fc:	83 e0 1f             	and    eax,0x1f
  8015ff:	29 d0                	sub    eax,edx
  801601:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801604:	48 8b 15 15 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea15]        # 400020 <page_map>
  80160b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80160e:	48 98                	cdqe   
  801610:	48 c1 e0 02          	shl    rax,0x2
  801614:	48 01 d0             	add    rax,rdx
  801617:	8b 10                	mov    edx,DWORD PTR [rax]
  801619:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80161c:	be 01 00 00 00       	mov    esi,0x1
  801621:	89 c1                	mov    ecx,eax
  801623:	d3 e6                	shl    esi,cl
  801625:	89 f0                	mov    eax,esi
  801627:	f7 d0                	not    eax
  801629:	89 c6                	mov    esi,eax
  80162b:	48 8b 0d ee e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe9ee]        # 400020 <page_map>
  801632:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801635:	48 98                	cdqe   
  801637:	48 c1 e0 02          	shl    rax,0x2
  80163b:	48 01 c8             	add    rax,rcx
  80163e:	21 f2                	and    edx,esi
  801640:	89 10                	mov    DWORD PTR [rax],edx
}
  801642:	90                   	nop
  801643:	5d                   	pop    rbp
  801644:	c3                   	ret    

0000000000801645 <free_pages_at>:

int free_pages_at(int base,int pgn){
  801645:	f3 0f 1e fa          	endbr64 
  801649:	55                   	push   rbp
  80164a:	48 89 e5             	mov    rbp,rsp
  80164d:	48 83 ec 18          	sub    rsp,0x18
  801651:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801654:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  801657:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80165e:	eb 1b                	jmp    80167b <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  801660:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801663:	c1 e0 0c             	shl    eax,0xc
  801666:	89 c2                	mov    edx,eax
  801668:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80166b:	01 d0                	add    eax,edx
  80166d:	48 98                	cdqe   
  80166f:	48 89 c7             	mov    rdi,rax
  801672:	e8 4a ff ff ff       	call   8015c1 <free_page>
    for(int i=0;i<pgn;i++){
  801677:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80167b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80167e:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801681:	7c dd                	jl     801660 <free_pages_at+0x1b>
    }
}
  801683:	90                   	nop
  801684:	c9                   	leave  
  801685:	c3                   	ret    

0000000000801686 <check_page>:
int check_page(int num){
  801686:	f3 0f 1e fa          	endbr64 
  80168a:	55                   	push   rbp
  80168b:	48 89 e5             	mov    rbp,rsp
  80168e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801691:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801694:	8d 50 1f             	lea    edx,[rax+0x1f]
  801697:	85 c0                	test   eax,eax
  801699:	0f 48 c2             	cmovs  eax,edx
  80169c:	c1 f8 05             	sar    eax,0x5
  80169f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8016a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8016a5:	99                   	cdq    
  8016a6:	c1 ea 1b             	shr    edx,0x1b
  8016a9:	01 d0                	add    eax,edx
  8016ab:	83 e0 1f             	and    eax,0x1f
  8016ae:	29 d0                	sub    eax,edx
  8016b0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8016b3:	48 8b 15 66 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe966]        # 400020 <page_map>
  8016ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016bd:	48 98                	cdqe   
  8016bf:	48 c1 e0 02          	shl    rax,0x2
  8016c3:	48 01 d0             	add    rax,rdx
  8016c6:	8b 10                	mov    edx,DWORD PTR [rax]
  8016c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016cb:	be 01 00 00 00       	mov    esi,0x1
  8016d0:	89 c1                	mov    ecx,eax
  8016d2:	d3 e6                	shl    esi,cl
  8016d4:	89 f0                	mov    eax,esi
  8016d6:	21 d0                	and    eax,edx
  8016d8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8016db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8016de:	5d                   	pop    rbp
  8016df:	c3                   	ret    

00000000008016e0 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8016e0:	f3 0f 1e fa          	endbr64 
  8016e4:	55                   	push   rbp
  8016e5:	48 89 e5             	mov    rbp,rsp
  8016e8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8016eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016ee:	c1 e0 0c             	shl    eax,0xc
}
  8016f1:	5d                   	pop    rbp
  8016f2:	c3                   	ret    

00000000008016f3 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8016f3:	f3 0f 1e fa          	endbr64 
  8016f7:	55                   	push   rbp
  8016f8:	48 89 e5             	mov    rbp,rsp
  8016fb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8016ff:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801702:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801705:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801709:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801710:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801714:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801717:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80171a:	89 c0                	mov    eax,eax
  80171c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801721:	48 09 c2             	or     rdx,rax
  801724:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801728:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  80172b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80172f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801732:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801735:	48 98                	cdqe   
  801737:	48 09 c2             	or     rdx,rax
  80173a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80173e:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801741:	90                   	nop
  801742:	5d                   	pop    rbp
  801743:	c3                   	ret    

0000000000801744 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801744:	f3 0f 1e fa          	endbr64 
  801748:	55                   	push   rbp
  801749:	48 89 e5             	mov    rbp,rsp
  80174c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801750:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801753:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801756:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80175a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801761:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801765:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801768:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80176b:	0c 81                	or     al,0x81
  80176d:	89 c0                	mov    eax,eax
  80176f:	48 09 c2             	or     rdx,rax
  801772:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801776:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801779:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80177c:	25 00 00 00 c0       	and    eax,0xc0000000
  801781:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801784:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801788:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80178b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80178e:	48 09 c2             	or     rdx,rax
  801791:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801795:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801798:	90                   	nop
  801799:	5d                   	pop    rbp
  80179a:	c3                   	ret    

000000000080179b <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  80179b:	f3 0f 1e fa          	endbr64 
  80179f:	55                   	push   rbp
  8017a0:	48 89 e5             	mov    rbp,rsp
  8017a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8017a7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8017aa:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  8017ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017b1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  8017b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8017bf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8017c2:	0d 81 10 00 00       	or     eax,0x1081
  8017c7:	48 98                	cdqe   
  8017c9:	48 09 c2             	or     rdx,rax
  8017cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017d0:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8017d3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8017d6:	25 00 00 c0 ff       	and    eax,0xffc00000
  8017db:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8017de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017e2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8017e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017e8:	48 09 c2             	or     rdx,rax
  8017eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017ef:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8017f2:	90                   	nop
  8017f3:	5d                   	pop    rbp
  8017f4:	c3                   	ret    

00000000008017f5 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8017f5:	f3 0f 1e fa          	endbr64 
  8017f9:	55                   	push   rbp
  8017fa:	48 89 e5             	mov    rbp,rsp
  8017fd:	48 83 ec 20          	sub    rsp,0x20
  801801:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801805:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801808:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80180d:	75 18                	jne    801827 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80180f:	b8 00 00 00 00       	mov    eax,0x0
  801814:	e8 d8 fc ff ff       	call   8014f1 <req_a_page>
  801819:	89 c7                	mov    edi,eax
  80181b:	e8 c0 fe ff ff       	call   8016e0 <get_phyaddr>
  801820:	48 98                	cdqe   
  801822:	e9 a5 00 00 00       	jmp    8018cc <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801827:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80182b:	89 c2                	mov    edx,eax
  80182d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801830:	89 c6                	mov    esi,eax
  801832:	89 d7                	mov    edi,edx
  801834:	e8 52 01 00 00       	call   80198b <is_pgs_ava>
  801839:	85 c0                	test   eax,eax
  80183b:	75 0c                	jne    801849 <req_page_at+0x54>
  80183d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801844:	e9 83 00 00 00       	jmp    8018cc <req_page_at+0xd7>
    int pgni=base/4096;
  801849:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80184d:	48 c1 e8 0c          	shr    rax,0xc
  801851:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801854:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801857:	8d 50 1f             	lea    edx,[rax+0x1f]
  80185a:	85 c0                	test   eax,eax
  80185c:	0f 48 c2             	cmovs  eax,edx
  80185f:	c1 f8 05             	sar    eax,0x5
  801862:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801865:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801868:	99                   	cdq    
  801869:	c1 ea 1b             	shr    edx,0x1b
  80186c:	01 d0                	add    eax,edx
  80186e:	83 e0 1f             	and    eax,0x1f
  801871:	29 d0                	sub    eax,edx
  801873:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801876:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80187d:	eb 40                	jmp    8018bf <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80187f:	48 8b 15 9a e7 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe79a]        # 400020 <page_map>
  801886:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801889:	48 98                	cdqe   
  80188b:	48 c1 e0 02          	shl    rax,0x2
  80188f:	48 01 d0             	add    rax,rdx
  801892:	8b 10                	mov    edx,DWORD PTR [rax]
  801894:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801897:	be 01 00 00 00       	mov    esi,0x1
  80189c:	89 c1                	mov    ecx,eax
  80189e:	d3 e6                	shl    esi,cl
  8018a0:	89 f0                	mov    eax,esi
  8018a2:	89 c6                	mov    esi,eax
  8018a4:	48 8b 0d 75 e7 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe775]        # 400020 <page_map>
  8018ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018ae:	48 98                	cdqe   
  8018b0:	48 c1 e0 02          	shl    rax,0x2
  8018b4:	48 01 c8             	add    rax,rcx
  8018b7:	09 f2                	or     edx,esi
  8018b9:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8018bb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8018bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018c2:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8018c5:	7c b8                	jl     80187f <req_page_at+0x8a>
    }
    return 0;
  8018c7:	b8 00 00 00 00       	mov    eax,0x0

}
  8018cc:	c9                   	leave  
  8018cd:	c3                   	ret    

00000000008018ce <chk_vm>:
int chk_vm(int base, int pgn)
{
  8018ce:	f3 0f 1e fa          	endbr64 
  8018d2:	55                   	push   rbp
  8018d3:	48 89 e5             	mov    rbp,rsp
  8018d6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018d9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8018dc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8018e3:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8018e4:	0f 20 d8             	mov    rax,cr3
  8018e7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8018eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018ee:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  8018f4:	85 c0                	test   eax,eax
  8018f6:	0f 48 c2             	cmovs  eax,edx
  8018f9:	c1 f8 15             	sar    eax,0x15
  8018fc:	48 98                	cdqe   
  8018fe:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801905:	00 
  801906:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80190a:	48 01 d0             	add    rax,rdx
  80190d:	8b 00                	mov    eax,DWORD PTR [rax]
  80190f:	89 c0                	mov    eax,eax
  801911:	25 00 f0 ff ff       	and    eax,0xfffff000
  801916:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  80191a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80191d:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801923:	85 c0                	test   eax,eax
  801925:	0f 48 c2             	cmovs  eax,edx
  801928:	c1 f8 15             	sar    eax,0x15
  80192b:	48 98                	cdqe   
  80192d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801934:	00 
  801935:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801939:	48 01 d0             	add    rax,rdx
  80193c:	8b 00                	mov    eax,DWORD PTR [rax]
  80193e:	83 e0 01             	and    eax,0x1
  801941:	85 c0                	test   eax,eax
  801943:	74 38                	je     80197d <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801945:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801948:	99                   	cdq    
  801949:	c1 ea 0b             	shr    edx,0xb
  80194c:	01 d0                	add    eax,edx
  80194e:	25 ff ff 1f 00       	and    eax,0x1fffff
  801953:	29 d0                	sub    eax,edx
  801955:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80195b:	85 c0                	test   eax,eax
  80195d:	0f 48 c2             	cmovs  eax,edx
  801960:	c1 f8 0c             	sar    eax,0xc
  801963:	48 98                	cdqe   
  801965:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80196c:	00 
  80196d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801971:	48 01 d0             	add    rax,rdx
  801974:	8b 00                	mov    eax,DWORD PTR [rax]
  801976:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801979:	85 c0                	test   eax,eax
  80197b:	75 07                	jne    801984 <chk_vm+0xb6>
    {
        return -1;
  80197d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801982:	eb 05                	jmp    801989 <chk_vm+0xbb>
    }
    return 0;
  801984:	b8 00 00 00 00       	mov    eax,0x0
}
  801989:	5d                   	pop    rbp
  80198a:	c3                   	ret    

000000000080198b <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  80198b:	f3 0f 1e fa          	endbr64 
  80198f:	55                   	push   rbp
  801990:	48 89 e5             	mov    rbp,rsp
  801993:	48 83 ec 18          	sub    rsp,0x18
  801997:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80199a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  80199d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019a0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8019a6:	85 c0                	test   eax,eax
  8019a8:	0f 48 c2             	cmovs  eax,edx
  8019ab:	c1 f8 0c             	sar    eax,0xc
  8019ae:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8019b1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019b8:	eb 1e                	jmp    8019d8 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  8019ba:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8019bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c0:	01 d0                	add    eax,edx
  8019c2:	89 c7                	mov    edi,eax
  8019c4:	e8 bd fc ff ff       	call   801686 <check_page>
  8019c9:	85 c0                	test   eax,eax
  8019cb:	74 07                	je     8019d4 <is_pgs_ava+0x49>
  8019cd:	b8 00 00 00 00       	mov    eax,0x0
  8019d2:	eb 11                	jmp    8019e5 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  8019d4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019db:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8019de:	7c da                	jl     8019ba <is_pgs_ava+0x2f>
    }
    return 1;
  8019e0:	b8 01 00 00 00       	mov    eax,0x1

}
  8019e5:	c9                   	leave  
  8019e6:	c3                   	ret    

00000000008019e7 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8019e7:	f3 0f 1e fa          	endbr64 
  8019eb:	55                   	push   rbp
  8019ec:	48 89 e5             	mov    rbp,rsp
  8019ef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8019f3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8019f7:	c6 05 42 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe842],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8019fe:	c6 05 3c e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe83c],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801a05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a09:	48 89 05 38 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe838],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801a10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801a14:	48 89 05 35 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe835],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801a1b:	c7 05 3b e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe83b],0x1        # 400260 <vols+0x20>
  801a22:	00 00 00 
    return 0;
  801a25:	b8 00 00 00 00       	mov    eax,0x0
}
  801a2a:	5d                   	pop    rbp
  801a2b:	c3                   	ret    

0000000000801a2c <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801a2c:	f3 0f 1e fa          	endbr64 
  801a30:	55                   	push   rbp
  801a31:	48 89 e5             	mov    rbp,rsp
  801a34:	48 83 ec 20          	sub    rsp,0x20
  801a38:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801a3b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a42:	eb 38                	jmp    801a7c <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a47:	48 98                	cdqe   
  801a49:	48 c1 e0 04          	shl    rax,0x4
  801a4d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a53:	8b 00                	mov    eax,DWORD PTR [rax]
  801a55:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a58:	75 1e                	jne    801a78 <sys_mkfifo+0x4c>
  801a5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a5d:	48 98                	cdqe   
  801a5f:	48 c1 e0 04          	shl    rax,0x4
  801a63:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a69:	8b 00                	mov    eax,DWORD PTR [rax]
  801a6b:	83 f8 01             	cmp    eax,0x1
  801a6e:	75 08                	jne    801a78 <sys_mkfifo+0x4c>
            return i;
  801a70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a73:	e9 a6 00 00 00       	jmp    801b1e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a78:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a7c:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801a80:	7e c2                	jle    801a44 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801a82:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801a89:	e9 81 00 00 00       	jmp    801b0f <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801a8e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a91:	48 98                	cdqe   
  801a93:	48 c1 e0 04          	shl    rax,0x4
  801a97:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a9d:	8b 00                	mov    eax,DWORD PTR [rax]
  801a9f:	85 c0                	test   eax,eax
  801aa1:	75 68                	jne    801b0b <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801aa3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801aa6:	48 98                	cdqe   
  801aa8:	48 c1 e0 04          	shl    rax,0x4
  801aac:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ab2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801ab8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801abb:	48 98                	cdqe   
  801abd:	48 c1 e0 04          	shl    rax,0x4
  801ac1:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801ac8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801acb:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801acd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801ad0:	48 98                	cdqe   
  801ad2:	48 c1 e0 04          	shl    rax,0x4
  801ad6:	48 05 64 1e 40 00    	add    rax,0x401e64
  801adc:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801ae2:	b8 00 00 00 00       	mov    eax,0x0
  801ae7:	e8 05 fa ff ff       	call   8014f1 <req_a_page>
  801aec:	89 c7                	mov    edi,eax
  801aee:	e8 ed fb ff ff       	call   8016e0 <get_phyaddr>
  801af3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801af6:	48 63 d2             	movsxd rdx,edx
  801af9:	48 c1 e2 04          	shl    rdx,0x4
  801afd:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801b04:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801b06:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b09:	eb 13                	jmp    801b1e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801b0b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801b0f:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801b13:	0f 8e 75 ff ff ff    	jle    801a8e <sys_mkfifo+0x62>
        }
    }
    return -1;
  801b19:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b1e:	c9                   	leave  
  801b1f:	c3                   	ret    

0000000000801b20 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801b20:	f3 0f 1e fa          	endbr64 
  801b24:	55                   	push   rbp
  801b25:	48 89 e5             	mov    rbp,rsp
  801b28:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801b2b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b32:	eb 4a                	jmp    801b7e <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b37:	48 98                	cdqe   
  801b39:	48 c1 e0 04          	shl    rax,0x4
  801b3d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b43:	8b 00                	mov    eax,DWORD PTR [rax]
  801b45:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b48:	75 30                	jne    801b7a <sys_rmfifo+0x5a>
  801b4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b4d:	48 98                	cdqe   
  801b4f:	48 c1 e0 04          	shl    rax,0x4
  801b53:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b59:	8b 00                	mov    eax,DWORD PTR [rax]
  801b5b:	83 f8 01             	cmp    eax,0x1
  801b5e:	75 1a                	jne    801b7a <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801b60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b63:	48 98                	cdqe   
  801b65:	48 c1 e0 04          	shl    rax,0x4
  801b69:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b6f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801b75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b78:	eb 0f                	jmp    801b89 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801b7a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b7e:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b82:	7e b0                	jle    801b34 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801b84:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b89:	5d                   	pop    rbp
  801b8a:	c3                   	ret    

0000000000801b8b <free_vol>:
int free_vol(int voli)
{
  801b8b:	f3 0f 1e fa          	endbr64 
  801b8f:	55                   	push   rbp
  801b90:	48 89 e5             	mov    rbp,rsp
  801b93:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801b96:	c7 05 c0 e6 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe6c0],0x0        # 400260 <vols+0x20>
  801b9d:	00 00 00 
    return 0;
  801ba0:	b8 00 00 00 00       	mov    eax,0x0
}
  801ba5:	5d                   	pop    rbp
  801ba6:	c3                   	ret    

0000000000801ba7 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801ba7:	f3 0f 1e fa          	endbr64 
  801bab:	55                   	push   rbp
  801bac:	48 89 e5             	mov    rbp,rsp
  801baf:	48 83 ec 20          	sub    rsp,0x20
  801bb3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801bb6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801bb9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801bbd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801bc4:	e9 d8 00 00 00       	jmp    801ca1 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801bc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bcc:	48 63 d0             	movsxd rdx,eax
  801bcf:	48 89 d0             	mov    rax,rdx
  801bd2:	48 c1 e0 02          	shl    rax,0x2
  801bd6:	48 01 d0             	add    rax,rdx
  801bd9:	48 c1 e0 03          	shl    rax,0x3
  801bdd:	48 05 60 02 40 00    	add    rax,0x400260
  801be3:	8b 00                	mov    eax,DWORD PTR [rax]
  801be5:	85 c0                	test   eax,eax
  801be7:	0f 85 b0 00 00 00    	jne    801c9d <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801bed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bf0:	48 63 d0             	movsxd rdx,eax
  801bf3:	48 89 d0             	mov    rax,rdx
  801bf6:	48 c1 e0 02          	shl    rax,0x2
  801bfa:	48 01 d0             	add    rax,rdx
  801bfd:	48 c1 e0 03          	shl    rax,0x3
  801c01:	48 05 60 02 40 00    	add    rax,0x400260
  801c07:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801c0d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801c10:	48 63 d0             	movsxd rdx,eax
  801c13:	48 89 d0             	mov    rax,rdx
  801c16:	48 01 c0             	add    rax,rax
  801c19:	48 01 d0             	add    rax,rdx
  801c1c:	48 c1 e0 03          	shl    rax,0x3
  801c20:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801c27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c2a:	48 63 d0             	movsxd rdx,eax
  801c2d:	48 89 d0             	mov    rax,rdx
  801c30:	48 c1 e0 02          	shl    rax,0x2
  801c34:	48 01 d0             	add    rax,rdx
  801c37:	48 c1 e0 03          	shl    rax,0x3
  801c3b:	48 05 58 02 40 00    	add    rax,0x400258
  801c41:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801c44:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c47:	89 c7                	mov    edi,eax
  801c49:	e8 14 1e 00 00       	call   803a62 <get_drv>
  801c4e:	48 89 c2             	mov    rdx,rax
  801c51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c54:	48 63 c8             	movsxd rcx,eax
  801c57:	48 89 c8             	mov    rax,rcx
  801c5a:	48 c1 e0 02          	shl    rax,0x2
  801c5e:	48 01 c8             	add    rax,rcx
  801c61:	48 c1 e0 03          	shl    rax,0x3
  801c65:	48 05 48 02 40 00    	add    rax,0x400248
  801c6b:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801c6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c71:	48 63 d0             	movsxd rdx,eax
  801c74:	48 89 d0             	mov    rax,rdx
  801c77:	48 c1 e0 02          	shl    rax,0x2
  801c7b:	48 01 d0             	add    rax,rdx
  801c7e:	48 c1 e0 03          	shl    rax,0x3
  801c82:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801c8d:	48 89 c6             	mov    rsi,rax
  801c90:	48 89 d7             	mov    rdi,rdx
  801c93:	e8 a0 b2 00 00       	call   80cf38 <strcpy>
            return i;
  801c98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c9b:	eb 13                	jmp    801cb0 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801c9d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ca1:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801ca5:	0f 8e 1e ff ff ff    	jle    801bc9 <reg_vol+0x22>
        }
    }
    return -1;
  801cab:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801cb0:	c9                   	leave  
  801cb1:	c3                   	ret    

0000000000801cb2 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801cb2:	f3 0f 1e fa          	endbr64 
  801cb6:	55                   	push   rbp
  801cb7:	48 89 e5             	mov    rbp,rsp
  801cba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801cbd:	48 8b 05 7c 35 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1357c]        # 415240 <current>
  801cc4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801cc7:	48 63 d2             	movsxd rdx,edx
  801cca:	48 83 c2 1a          	add    rdx,0x1a
  801cce:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801cd3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801cd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cdb:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801cde:	5d                   	pop    rbp
  801cdf:	c3                   	ret    

0000000000801ce0 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801ce0:	f3 0f 1e fa          	endbr64 
  801ce4:	55                   	push   rbp
  801ce5:	48 89 e5             	mov    rbp,rsp
  801ce8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ceb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cf2:	eb 3f                	jmp    801d33 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801cf4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cf7:	48 63 d0             	movsxd rdx,eax
  801cfa:	48 89 d0             	mov    rax,rdx
  801cfd:	48 01 c0             	add    rax,rax
  801d00:	48 01 d0             	add    rax,rdx
  801d03:	48 c1 e0 05          	shl    rax,0x5
  801d07:	48 05 60 06 40 00    	add    rax,0x400660
  801d0d:	8b 00                	mov    eax,DWORD PTR [rax]
  801d0f:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801d12:	75 1b                	jne    801d2f <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801d14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d17:	48 63 d0             	movsxd rdx,eax
  801d1a:	48 89 d0             	mov    rax,rdx
  801d1d:	48 01 c0             	add    rax,rax
  801d20:	48 01 d0             	add    rax,rdx
  801d23:	48 c1 e0 05          	shl    rax,0x5
  801d27:	48 05 60 06 40 00    	add    rax,0x400660
  801d2d:	eb 0f                	jmp    801d3e <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801d2f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801d33:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801d37:	7e bb                	jle    801cf4 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801d39:	b8 00 00 00 00       	mov    eax,0x0
}
  801d3e:	5d                   	pop    rbp
  801d3f:	c3                   	ret    

0000000000801d40 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801d40:	f3 0f 1e fa          	endbr64 
  801d44:	55                   	push   rbp
  801d45:	48 89 e5             	mov    rbp,rsp
  801d48:	48 83 ec 10          	sub    rsp,0x10
  801d4c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801d50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d54:	48 89 c7             	mov    rdi,rax
  801d57:	e8 a0 04 00 00       	call   8021fc <wait_on_buf>
    if(bh->b_count==0)return -1;
  801d5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d60:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801d64:	84 c0                	test   al,al
  801d66:	75 07                	jne    801d6f <brelse+0x2f>
  801d68:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d6d:	eb 32                	jmp    801da1 <brelse+0x61>
    bh->b_count--;
  801d6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d73:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801d77:	8d 50 ff             	lea    edx,[rax-0x1]
  801d7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d7e:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d85:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801d89:	84 c0                	test   al,al
  801d8b:	75 0f                	jne    801d9c <brelse+0x5c>
        vmfree(bh->b_data);
  801d8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d94:	48 89 c7             	mov    rdi,rax
  801d97:	e8 16 f4 ff ff       	call   8011b2 <vmfree>
    return 0;
  801d9c:	b8 00 00 00 00       	mov    eax,0x0
}
  801da1:	c9                   	leave  
  801da2:	c3                   	ret    

0000000000801da3 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801da3:	f3 0f 1e fa          	endbr64 
  801da7:	55                   	push   rbp
  801da8:	48 89 e5             	mov    rbp,rsp
  801dab:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801db2:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801db8:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801dbe:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801dc4:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801dca:	89 d6                	mov    esi,edx
  801dcc:	89 c7                	mov    edi,eax
  801dce:	e8 78 02 00 00       	call   80204b <get_buf>
  801dd3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801dd7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801ddc:	75 09                	jne    801de7 <bread+0x44>
  801dde:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801de5:	eb 75                	jmp    801e5c <bread+0xb9>
    if(!bh->b_uptodate)
  801de7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801deb:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801def:	84 c0                	test   al,al
  801df1:	75 65                	jne    801e58 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801df3:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801df9:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801dfc:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801e03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e07:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e0a:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801e10:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801e17:	02 00 00 
        arg.lba=bh->b_blocknr;
  801e1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e1e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801e22:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801e28:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801e2f:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801e32:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801e39:	48 89 c7             	mov    rdi,rax
  801e3c:	e8 48 1c 00 00       	call   803a89 <make_request>
  801e41:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801e44:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801e47:	89 c7                	mov    edi,eax
  801e49:	e8 4e 1f 00 00       	call   803d9c <wait_on_req>
        clear_req(reqi);
  801e4e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801e51:	89 c7                	mov    edi,eax
  801e53:	e8 74 1f 00 00       	call   803dcc <clear_req>
    }
    return bh;
  801e58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801e5c:	c9                   	leave  
  801e5d:	c3                   	ret    

0000000000801e5e <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801e5e:	f3 0f 1e fa          	endbr64 
  801e62:	55                   	push   rbp
  801e63:	48 89 e5             	mov    rbp,rsp
  801e66:	48 83 ec 40          	sub    rsp,0x40
  801e6a:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801e6e:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801e72:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801e75:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e79:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801e7c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801e7f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e83:	48 89 c7             	mov    rdi,rax
  801e86:	e8 80 01 00 00       	call   80200b <get_according_bnr>
  801e8b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801e8e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801e91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e94:	89 d6                	mov    esi,edx
  801e96:	89 c7                	mov    edi,eax
  801e98:	e8 06 ff ff ff       	call   801da3 <bread>
  801e9d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801ea1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801ea4:	ba 00 02 00 00       	mov    edx,0x200
  801ea9:	39 d0                	cmp    eax,edx
  801eab:	0f 4f c2             	cmovg  eax,edx
  801eae:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801eb1:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801eb4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801eb8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801ebb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801ebf:	48 89 ce             	mov    rsi,rcx
  801ec2:	48 89 c7             	mov    rdi,rax
  801ec5:	e8 70 af 00 00       	call   80ce3a <memcpy>
        len-=BLOCK_SIZE;
  801eca:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801ed1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ed5:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801ed8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801edb:	01 c2                	add    edx,eax
  801edd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ee1:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  801ee4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ee8:	48 89 c7             	mov    rdi,rax
  801eeb:	e8 50 fe ff ff       	call   801d40 <brelse>
    }while(len>0);
  801ef0:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801ef4:	7f 89                	jg     801e7f <vfs_read_file+0x21>
    return 0;
  801ef6:	b8 00 00 00 00       	mov    eax,0x0
}
  801efb:	c9                   	leave  
  801efc:	c3                   	ret    

0000000000801efd <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  801efd:	f3 0f 1e fa          	endbr64 
  801f01:	55                   	push   rbp
  801f02:	48 89 e5             	mov    rbp,rsp
  801f05:	48 83 ec 40          	sub    rsp,0x40
  801f09:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801f0d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801f11:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801f14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f18:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f1b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801f1e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f22:	48 89 c7             	mov    rdi,rax
  801f25:	e8 e1 00 00 00       	call   80200b <get_according_bnr>
  801f2a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  801f2d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801f30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f33:	89 d6                	mov    esi,edx
  801f35:	89 c7                	mov    edi,eax
  801f37:	e8 0f 01 00 00       	call   80204b <get_buf>
  801f3c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801f40:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801f43:	ba 00 02 00 00       	mov    edx,0x200
  801f48:	39 d0                	cmp    eax,edx
  801f4a:	0f 4f c2             	cmovg  eax,edx
  801f4d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  801f50:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801f53:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f5a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  801f5e:	48 89 ce             	mov    rsi,rcx
  801f61:	48 89 c7             	mov    rdi,rax
  801f64:	e8 d1 ae 00 00       	call   80ce3a <memcpy>
        len-=BLOCK_SIZE;
  801f69:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801f70:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f74:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801f77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f7a:	01 c2                	add    edx,eax
  801f7c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f80:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  801f83:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f87:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  801f8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f8f:	48 89 c7             	mov    rdi,rax
  801f92:	e8 a9 fd ff ff       	call   801d40 <brelse>
    }while(len>0);
  801f97:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801f9b:	7f 81                	jg     801f1e <vfs_write_file+0x21>
    return 0;
  801f9d:	b8 00 00 00 00       	mov    eax,0x0
}
  801fa2:	c9                   	leave  
  801fa3:	c3                   	ret    

0000000000801fa4 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  801fa4:	f3 0f 1e fa          	endbr64 
  801fa8:	55                   	push   rbp
  801fa9:	48 89 e5             	mov    rbp,rsp
  801fac:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801fb0:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801fb3:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  801fb6:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801fba:	74 35                	je     801ff1 <vfs_seek_file+0x4d>
  801fbc:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801fc0:	7f 3f                	jg     802001 <vfs_seek_file+0x5d>
  801fc2:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  801fc6:	74 08                	je     801fd0 <vfs_seek_file+0x2c>
  801fc8:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  801fcc:	74 0e                	je     801fdc <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  801fce:	eb 31                	jmp    802001 <vfs_seek_file+0x5d>
        f->ptr=offset;
  801fd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fd4:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  801fd7:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801fda:	eb 26                	jmp    802002 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  801fdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fe0:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801fe3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fe6:	01 c2                	add    edx,eax
  801fe8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fec:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801fef:	eb 11                	jmp    802002 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  801ff1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ff5:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  801ff8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ffc:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801fff:	eb 01                	jmp    802002 <vfs_seek_file+0x5e>
        break;
  802001:	90                   	nop
    }
    return f->ptr;
  802002:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802006:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802009:	5d                   	pop    rbp
  80200a:	c3                   	ret    

000000000080200b <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80200b:	f3 0f 1e fa          	endbr64 
  80200f:	55                   	push   rbp
  802010:	48 89 e5             	mov    rbp,rsp
  802013:	48 83 ec 10          	sub    rsp,0x10
  802017:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80201b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80201f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802022:	48 63 d0             	movsxd rdx,eax
  802025:	48 89 d0             	mov    rax,rdx
  802028:	48 c1 e0 02          	shl    rax,0x2
  80202c:	48 01 d0             	add    rax,rdx
  80202f:	48 c1 e0 03          	shl    rax,0x3
  802033:	48 05 58 02 40 00    	add    rax,0x400258
  802039:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80203c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802040:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802044:	48 89 c7             	mov    rdi,rax
  802047:	ff d2                	call   rdx

}
  802049:	c9                   	leave  
  80204a:	c3                   	ret    

000000000080204b <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80204b:	f3 0f 1e fa          	endbr64 
  80204f:	55                   	push   rbp
  802050:	48 89 e5             	mov    rbp,rsp
  802053:	48 83 ec 20          	sub    rsp,0x20
  802057:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80205a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80205d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802064:	e9 b9 00 00 00       	jmp    802122 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802069:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80206c:	48 98                	cdqe   
  80206e:	48 c1 e0 06          	shl    rax,0x6
  802072:	48 05 90 26 40 00    	add    rax,0x402690
  802078:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80207b:	0f b7 c0             	movzx  eax,ax
  80207e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802081:	0f 85 97 00 00 00    	jne    80211e <get_buf+0xd3>
  802087:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80208a:	48 98                	cdqe   
  80208c:	48 c1 e0 06          	shl    rax,0x6
  802090:	48 05 88 26 40 00    	add    rax,0x402688
  802096:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802099:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80209c:	48 98                	cdqe   
  80209e:	48 39 c2             	cmp    rdx,rax
  8020a1:	75 7b                	jne    80211e <get_buf+0xd3>
        {
            repeat:
  8020a3:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8020a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020a7:	48 98                	cdqe   
  8020a9:	48 c1 e0 06          	shl    rax,0x6
  8020ad:	48 05 80 26 40 00    	add    rax,0x402680
  8020b3:	48 89 c7             	mov    rdi,rax
  8020b6:	e8 41 01 00 00       	call   8021fc <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8020bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020be:	48 98                	cdqe   
  8020c0:	48 c1 e0 06          	shl    rax,0x6
  8020c4:	48 05 94 26 40 00    	add    rax,0x402694
  8020ca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8020cd:	84 c0                	test   al,al
  8020cf:	74 02                	je     8020d3 <get_buf+0x88>
                goto repeat;
  8020d1:	eb d1                	jmp    8020a4 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8020d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020d6:	48 98                	cdqe   
  8020d8:	48 c1 e0 06          	shl    rax,0x6
  8020dc:	48 05 90 26 40 00    	add    rax,0x402690
  8020e2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8020e5:	0f b7 c0             	movzx  eax,ax
  8020e8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020eb:	75 30                	jne    80211d <get_buf+0xd2>
  8020ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020f0:	48 98                	cdqe   
  8020f2:	48 c1 e0 06          	shl    rax,0x6
  8020f6:	48 05 88 26 40 00    	add    rax,0x402688
  8020fc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8020ff:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802102:	48 98                	cdqe   
  802104:	48 39 c2             	cmp    rdx,rax
  802107:	75 14                	jne    80211d <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802109:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80210c:	48 98                	cdqe   
  80210e:	48 c1 e0 06          	shl    rax,0x6
  802112:	48 05 80 26 40 00    	add    rax,0x402680
  802118:	e9 dd 00 00 00       	jmp    8021fa <get_buf+0x1af>
                continue;
  80211d:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80211e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802122:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802126:	0f 8e 3d ff ff ff    	jle    802069 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80212c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802133:	e9 b8 00 00 00       	jmp    8021f0 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802138:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80213b:	48 98                	cdqe   
  80213d:	48 c1 e0 06          	shl    rax,0x6
  802141:	48 05 94 26 40 00    	add    rax,0x402694
  802147:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80214a:	84 c0                	test   al,al
  80214c:	0f 85 9a 00 00 00    	jne    8021ec <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802152:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802155:	48 98                	cdqe   
  802157:	48 c1 e0 06          	shl    rax,0x6
  80215b:	48 05 93 26 40 00    	add    rax,0x402693
  802161:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802164:	84 c0                	test   al,al
  802166:	74 2e                	je     802196 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802168:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80216b:	48 98                	cdqe   
  80216d:	48 c1 e0 06          	shl    rax,0x6
  802171:	48 05 80 26 40 00    	add    rax,0x402680
  802177:	48 89 c7             	mov    rdi,rax
  80217a:	e8 1b 01 00 00       	call   80229a <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80217f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802182:	48 98                	cdqe   
  802184:	48 c1 e0 06          	shl    rax,0x6
  802188:	48 05 80 26 40 00    	add    rax,0x402680
  80218e:	48 89 c7             	mov    rdi,rax
  802191:	e8 66 00 00 00       	call   8021fc <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802196:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802199:	48 98                	cdqe   
  80219b:	48 c1 e0 06          	shl    rax,0x6
  80219f:	48 05 94 26 40 00    	add    rax,0x402694
  8021a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8021a8:	8d 50 01             	lea    edx,[rax+0x1]
  8021ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8021ae:	48 98                	cdqe   
  8021b0:	48 c1 e0 06          	shl    rax,0x6
  8021b4:	48 05 94 26 40 00    	add    rax,0x402694
  8021ba:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8021bc:	b8 00 00 00 00       	mov    eax,0x0
  8021c1:	e8 4c ef ff ff       	call   801112 <vmalloc>
  8021c6:	48 89 c2             	mov    rdx,rax
  8021c9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8021cc:	48 98                	cdqe   
  8021ce:	48 c1 e0 06          	shl    rax,0x6
  8021d2:	48 05 80 26 40 00    	add    rax,0x402680
  8021d8:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8021db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8021de:	48 98                	cdqe   
  8021e0:	48 c1 e0 06          	shl    rax,0x6
  8021e4:	48 05 80 26 40 00    	add    rax,0x402680
  8021ea:	eb 0e                	jmp    8021fa <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021ec:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8021f0:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8021f4:	0f 8e 3e ff ff ff    	jle    802138 <get_buf+0xed>
        }
    }
}
  8021fa:	c9                   	leave  
  8021fb:	c3                   	ret    

00000000008021fc <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8021fc:	f3 0f 1e fa          	endbr64 
  802200:	55                   	push   rbp
  802201:	48 89 e5             	mov    rbp,rsp
  802204:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802208:	90                   	nop
  802209:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80220d:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802211:	84 c0                	test   al,al
  802213:	75 f4                	jne    802209 <wait_on_buf+0xd>
    
}
  802215:	90                   	nop
  802216:	90                   	nop
  802217:	5d                   	pop    rbp
  802218:	c3                   	ret    

0000000000802219 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802219:	f3 0f 1e fa          	endbr64 
  80221d:	55                   	push   rbp
  80221e:	48 89 e5             	mov    rbp,rsp
  802221:	48 83 ec 30          	sub    rsp,0x30
  802225:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802228:	b8 00 00 00 00       	mov    eax,0x0
  80222d:	e8 e0 ee ff ff       	call   801112 <vmalloc>
  802232:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802236:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80223a:	49 89 c0             	mov    r8,rax
  80223d:	b9 01 00 00 00       	mov    ecx,0x1
  802242:	ba 00 00 00 00       	mov    edx,0x0
  802247:	be 20 00 00 00       	mov    esi,0x20
  80224c:	bf 00 00 00 00       	mov    edi,0x0
  802251:	e8 87 74 00 00       	call   8096dd <request>
  802256:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802259:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80225c:	89 c7                	mov    edi,eax
  80225e:	e8 2e 7b 00 00       	call   809d91 <chk_result>

    dpt_t* dpte=buf+0x1be;
  802263:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802267:	48 05 be 01 00 00    	add    rax,0x1be
  80226d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802271:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802278:	eb 13                	jmp    80228d <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  80227a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80227e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802281:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802284:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802289:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80228d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802291:	7e e7                	jle    80227a <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  802293:	b8 00 00 00 00       	mov    eax,0x0
}
  802298:	c9                   	leave  
  802299:	c3                   	ret    

000000000080229a <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80229a:	f3 0f 1e fa          	endbr64 
  80229e:	55                   	push   rbp
  80229f:	48 89 e5             	mov    rbp,rsp
  8022a2:	48 83 ec 20          	sub    rsp,0x20
  8022a6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8022aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8022ae:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8022b2:	0f b7 c0             	movzx  eax,ax
  8022b5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8022b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8022bc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8022c0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8022c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8022c7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8022ca:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8022cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022d0:	b9 00 02 00 00       	mov    ecx,0x200
  8022d5:	89 c7                	mov    edi,eax
  8022d7:	e8 02 00 00 00       	call   8022de <write_block>

}
  8022dc:	c9                   	leave  
  8022dd:	c3                   	ret    

00000000008022de <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8022de:	f3 0f 1e fa          	endbr64 
  8022e2:	55                   	push   rbp
  8022e3:	48 89 e5             	mov    rbp,rsp
  8022e6:	48 83 ec 30          	sub    rsp,0x30
  8022ea:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8022ed:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8022f0:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8022f4:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8022f7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022fa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022fd:	89 d6                	mov    esi,edx
  8022ff:	89 c7                	mov    edi,eax
  802301:	e8 45 fd ff ff       	call   80204b <get_buf>
  802306:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80230a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80230d:	ba 00 02 00 00       	mov    edx,0x200
  802312:	39 d0                	cmp    eax,edx
  802314:	0f 4f c2             	cmovg  eax,edx
  802317:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80231a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80231d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802321:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802324:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802328:	48 89 ce             	mov    rsi,rcx
  80232b:	48 89 c7             	mov    rdi,rax
  80232e:	e8 07 ab 00 00       	call   80ce3a <memcpy>
        len-=BLOCK_SIZE;
  802333:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80233a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80233e:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802342:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802346:	48 89 c7             	mov    rdi,rax
  802349:	e8 f2 f9 ff ff       	call   801d40 <brelse>
    }while(len>0);
  80234e:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802352:	7f a3                	jg     8022f7 <write_block+0x19>
    return 0;
  802354:	b8 00 00 00 00       	mov    eax,0x0
}
  802359:	c9                   	leave  
  80235a:	c3                   	ret    

000000000080235b <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80235b:	f3 0f 1e fa          	endbr64 
  80235f:	55                   	push   rbp
  802360:	48 89 e5             	mov    rbp,rsp
  802363:	48 83 ec 30          	sub    rsp,0x30
  802367:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80236a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80236d:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802371:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802374:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802377:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80237a:	89 d6                	mov    esi,edx
  80237c:	89 c7                	mov    edi,eax
  80237e:	e8 20 fa ff ff       	call   801da3 <bread>
  802383:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802387:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80238a:	ba 00 02 00 00       	mov    edx,0x200
  80238f:	39 d0                	cmp    eax,edx
  802391:	0f 4f c2             	cmovg  eax,edx
  802394:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802397:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80239a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8023a1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8023a5:	48 89 ce             	mov    rsi,rcx
  8023a8:	48 89 c7             	mov    rdi,rax
  8023ab:	e8 8a aa 00 00       	call   80ce3a <memcpy>
        len-=BLOCK_SIZE;
  8023b0:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8023b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023bb:	48 89 c7             	mov    rdi,rax
  8023be:	e8 7d f9 ff ff       	call   801d40 <brelse>
    }while(len>0);
  8023c3:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8023c7:	7f ab                	jg     802374 <read_block+0x19>
    return 0;
  8023c9:	b8 00 00 00 00       	mov    eax,0x0
}
  8023ce:	c9                   	leave  
  8023cf:	c3                   	ret    

00000000008023d0 <init_vfs>:

int init_vfs()
{
  8023d0:	f3 0f 1e fa          	endbr64 
  8023d4:	55                   	push   rbp
  8023d5:	48 89 e5             	mov    rbp,rsp
  8023d8:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8023dc:	48 8b 05 9d 60 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0609d]        # 408480 <dev_tree>
  8023e3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8023e7:	eb 40                	jmp    802429 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8023e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ed:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8023f3:	48 c1 f8 02          	sar    rax,0x2
  8023f7:	48 89 c2             	mov    rdx,rax
  8023fa:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802401:	18 9c 8f 
  802404:	48 0f af c2          	imul   rax,rdx
  802408:	89 c7                	mov    edi,eax
  80240a:	e8 0a fe ff ff       	call   802219 <scan_dev>
  80240f:	85 c0                	test   eax,eax
  802411:	74 07                	je     80241a <init_vfs+0x4a>
  802413:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802418:	eb 1b                	jmp    802435 <init_vfs+0x65>
    for(;p;p=p->next)
  80241a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80241e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802425:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802429:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80242e:	75 b9                	jne    8023e9 <init_vfs+0x19>
    }

    return 0;
  802430:	b8 00 00 00 00       	mov    eax,0x0
}
  802435:	c9                   	leave  
  802436:	c3                   	ret    

0000000000802437 <make_dentry>:
};
struct dir_entry_operations dev_dir_dops={

};
static int devd_fd=-1;
void make_dentry(struct dir_entry* d,char* name,int namelen,struct dir_entry* parent,struct dir_entry_operations* dops){
  802437:	f3 0f 1e fa          	endbr64 
  80243b:	55                   	push   rbp
  80243c:	48 89 e5             	mov    rbp,rsp
  80243f:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  802443:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802447:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80244b:	89 55 9c             	mov    DWORD PTR [rbp-0x64],edx
  80244e:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802452:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    strcpy(d->name,name);
  802456:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80245a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80245d:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  802461:	48 89 d6             	mov    rsi,rdx
  802464:	48 89 c7             	mov    rdi,rax
  802467:	e8 cc aa 00 00       	call   80cf38 <strcpy>
    d->name_length=namelen;
  80246c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802470:	8b 55 9c             	mov    edx,DWORD PTR [rbp-0x64]
  802473:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops=dops;
  802476:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80247a:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  80247e:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    list_init(&d->subdirs_list);
  802482:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802486:	48 83 c0 28          	add    rax,0x28
  80248a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = NULL;
  80248e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  802492:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  802499:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80249d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8024a4:	00 
}
  8024a5:	90                   	nop
    list_init(&d->child_node);
  8024a6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8024aa:	48 83 c0 10          	add    rax,0x10
  8024ae:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    list->prev = NULL;
  8024b2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8024b6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8024bd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8024c1:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8024c8:	00 
}
  8024c9:	90                   	nop
    d->child_node.data=d;
  8024ca:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8024ce:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  8024d2:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    d->parent=parent;
  8024d6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8024da:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8024de:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_add(&parent->subdirs_list,&d->child_node);
  8024e2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8024e6:	48 83 c0 10          	add    rax,0x10
  8024ea:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8024ee:	48 83 c2 28          	add    rdx,0x28
  8024f2:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8024f6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        new->next->prev = new;
    entry->next = new;
}
__attribute__((always_inline)) inline void list_add(struct List * entry,struct List * new)	////add to the tail of the link
{
    if(entry->next==NULL)
  8024fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024fe:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802502:	48 85 c0             	test   rax,rax
  802505:	75 58                	jne    80255f <make_dentry+0x128>
  802507:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80250b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80250f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802513:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    new->next = entry->next;
  802517:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80251b:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80251f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802523:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802527:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80252b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80252f:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802532:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802536:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80253a:	48 85 c0             	test   rax,rax
  80253d:	74 0f                	je     80254e <make_dentry+0x117>
        new->next->prev = new;
  80253f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802543:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802547:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80254b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80254e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802552:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802556:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80255a:	e9 9c 00 00 00       	jmp    8025fb <make_dentry+0x1c4>
        list_add_to_behind(entry,new);
    else{
        struct List* p=entry;
  80255f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802563:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(;p->next&&p->next!=p;p=p->next){
  802567:	eb 21                	jmp    80258a <make_dentry+0x153>
            if(p->data==new->data)
  802569:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80256d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802571:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802575:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802579:	48 39 c2             	cmp    rdx,rax
  80257c:	74 7c                	je     8025fa <make_dentry+0x1c3>
        for(;p->next&&p->next!=p;p=p->next){
  80257e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802582:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802586:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  80258a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80258e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802592:	48 85 c0             	test   rax,rax
  802595:	74 0e                	je     8025a5 <make_dentry+0x16e>
  802597:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80259b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80259f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  8025a3:	75 c4                	jne    802569 <make_dentry+0x132>
  8025a5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025a9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  8025ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025b1:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    new->next = entry->next;
  8025b5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8025b9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8025bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8025c1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8025c5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8025c9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8025cd:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8025d0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8025d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8025d8:	48 85 c0             	test   rax,rax
  8025db:	74 0f                	je     8025ec <make_dentry+0x1b5>
        new->next->prev = new;
  8025dd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8025e1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8025e5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8025e9:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8025ec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8025f0:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8025f4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8025f8:	eb 01                	jmp    8025fb <make_dentry+0x1c4>
                return;
  8025fa:	90                   	nop
}
  8025fb:	90                   	nop
  8025fc:	c9                   	leave  
  8025fd:	c3                   	ret    

00000000008025fe <make_inode>:
void make_inode(struct index_node* i,struct index_node_operations* iops,struct file_operations* fops,unsigned long attr,super_block* sb){
  8025fe:	f3 0f 1e fa          	endbr64 
  802602:	55                   	push   rbp
  802603:	48 89 e5             	mov    rbp,rsp
  802606:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80260a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80260e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  802612:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  802616:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    i->f_ops=fops;
  80261a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80261e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802622:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    i->attribute=attr;
  802626:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80262a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80262e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    i->sb=sb;
  802632:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802636:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80263a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    i->file_size=0;
  80263e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802642:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    i->inode_ops=iops;
  802649:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80264d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802651:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
}
  802655:	90                   	nop
  802656:	5d                   	pop    rbp
  802657:	c3                   	ret    

0000000000802658 <make_devf>:
void make_devf(struct dir_entry* d,struct index_node* i,char* name,struct dir_entry* ddev,struct file_operations* fops){
  802658:	f3 0f 1e fa          	endbr64 
  80265c:	55                   	push   rbp
  80265d:	48 89 e5             	mov    rbp,rsp
  802660:	53                   	push   rbx
  802661:	48 83 ec 78          	sub    rsp,0x78
  802665:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802669:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80266d:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  802671:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802675:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    make_dentry(d,name, strlen(name),root_sb->root,&dev_dir_dops);
  802679:	48 8b 05 c8 5c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25cc8]        # 428348 <root_sb>
  802680:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  802683:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  802687:	48 89 c7             	mov    rdi,rax
  80268a:	e8 c8 aa 00 00       	call   80d157 <strlen>
  80268f:	89 c2                	mov    edx,eax
  802691:	48 8b 75 98          	mov    rsi,QWORD PTR [rbp-0x68]
  802695:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802699:	41 b8 a0 84 40 00    	mov    r8d,0x4084a0
  80269f:	48 89 d9             	mov    rcx,rbx
  8026a2:	48 89 c7             	mov    rdi,rax
  8026a5:	e8 8d fd ff ff       	call   802437 <make_dentry>
    d->dir_inode=i;
  8026aa:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8026ae:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8026b2:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(i,ddev->dir_inode->inode_ops,fops,FS_ATTR_DEVICE,root_sb);
  8026b6:	48 8b 0d 8b 5c c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25c8b]        # 428348 <root_sb>
  8026bd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8026c1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8026c5:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8026c9:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  8026cd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8026d1:	49 89 c8             	mov    r8,rcx
  8026d4:	b9 04 00 00 00       	mov    ecx,0x4
  8026d9:	48 89 c7             	mov    rdi,rax
  8026dc:	e8 1d ff ff ff       	call   8025fe <make_inode>
    list_add(&ddev->subdirs_list,&d->child_node);//添加到/dev下
  8026e1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8026e5:	48 83 c0 10          	add    rax,0x10
  8026e9:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8026ed:	48 83 c2 28          	add    rdx,0x28
  8026f1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8026f5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(entry->next==NULL)
  8026f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8026fd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802701:	48 85 c0             	test   rax,rax
  802704:	75 58                	jne    80275e <make_devf+0x106>
  802706:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80270a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  80270e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802712:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    new->next = entry->next;
  802716:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80271a:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80271e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802722:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802726:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80272a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80272e:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802731:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802735:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802739:	48 85 c0             	test   rax,rax
  80273c:	74 0f                	je     80274d <make_devf+0xf5>
        new->next->prev = new;
  80273e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802742:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802746:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80274a:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80274d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802751:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802755:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802759:	e9 9c 00 00 00       	jmp    8027fa <make_devf+0x1a2>
        struct List* p=entry;
  80275e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802762:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
        for(;p->next&&p->next!=p;p=p->next){
  802766:	eb 21                	jmp    802789 <make_devf+0x131>
            if(p->data==new->data)
  802768:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80276c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802770:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802774:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802778:	48 39 c2             	cmp    rdx,rax
  80277b:	74 7c                	je     8027f9 <make_devf+0x1a1>
        for(;p->next&&p->next!=p;p=p->next){
  80277d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  802781:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802785:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  802789:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80278d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802791:	48 85 c0             	test   rax,rax
  802794:	74 0e                	je     8027a4 <make_devf+0x14c>
  802796:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80279a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80279e:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  8027a2:	75 c4                	jne    802768 <make_devf+0x110>
  8027a4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8027a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8027ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027b0:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    new->next = entry->next;
  8027b4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8027b8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8027bc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8027c0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8027c4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8027c8:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8027cc:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8027cf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8027d3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8027d7:	48 85 c0             	test   rax,rax
  8027da:	74 0f                	je     8027eb <make_devf+0x193>
        new->next->prev = new;
  8027dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8027e0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8027e4:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8027e8:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8027eb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8027ef:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8027f3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8027f7:	eb 01                	jmp    8027fa <make_devf+0x1a2>
                return;
  8027f9:	90                   	nop
}
  8027fa:	90                   	nop
  8027fb:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8027ff:	c9                   	leave  
  802800:	c3                   	ret    

0000000000802801 <init_devman>:
 * 这个/dev文件夹的dentry和inode等数据由devman管理，根文件系统切换时，这个文件夹会跟着挂载到新文件系统的根目录下。
 * */
struct dir_entry* ddev=NULL,*dmnt,*dconsole,*dhd0,*dtty;
struct file ftty;
int init_devman()
{
  802801:	f3 0f 1e fa          	endbr64 
  802805:	55                   	push   rbp
  802806:	48 89 e5             	mov    rbp,rsp
  802809:	48 83 ec 30          	sub    rsp,0x30
    //创建dev文件夹
    ddev=(struct dir_entry*)vmalloc();
  80280d:	b8 00 00 00 00       	mov    eax,0x0
  802812:	e8 fb e8 ff ff       	call   801112 <vmalloc>
  802817:	48 89 05 a2 5c c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05ca2],rax        # 4084c0 <ddev>
    struct index_node* idev=ddev+1;
  80281e:	48 8b 05 9b 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05c9b]        # 4084c0 <ddev>
  802825:	48 83 c0 58          	add    rax,0x58
  802829:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ddev->name=idev+1;
  80282d:	48 8b 05 8c 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05c8c]        # 4084c0 <ddev>
  802834:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802838:	48 83 c2 38          	add    rdx,0x38
  80283c:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(ddev,"dev",3,root_sb->root,root_sb->root->dir_ops);
  80283f:	48 8b 05 02 5b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25b02]        # 428348 <root_sb>
  802846:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802849:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80284d:	48 8b 05 f4 5a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25af4]        # 428348 <root_sb>
  802854:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802857:	48 8b 05 62 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05c62]        # 4084c0 <ddev>
  80285e:	49 89 c8             	mov    r8,rcx
  802861:	48 89 d1             	mov    rcx,rdx
  802864:	ba 03 00 00 00       	mov    edx,0x3
  802869:	be c8 54 81 00       	mov    esi,0x8154c8
  80286e:	48 89 c7             	mov    rdi,rax
  802871:	e8 c1 fb ff ff       	call   802437 <make_dentry>
    ddev->dir_inode=idev;
  802876:	48 8b 05 43 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05c43]        # 4084c0 <ddev>
  80287d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802881:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(idev,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  802885:	48 8b 0d bc 5a c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25abc]        # 428348 <root_sb>
  80288c:	48 8b 05 b5 5a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25ab5]        # 428348 <root_sb>
  802893:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802896:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80289a:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80289e:	48 8b 05 a3 5a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25aa3]        # 428348 <root_sb>
  8028a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8028a8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8028ac:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8028b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028b4:	49 89 c8             	mov    r8,rcx
  8028b7:	b9 02 00 00 00       	mov    ecx,0x2
  8028bc:	48 89 c7             	mov    rdi,rax
  8028bf:	e8 3a fd ff ff       	call   8025fe <make_inode>
    idev->private_index_info=ddev;
  8028c4:	48 8b 15 f5 5b c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05bf5]        # 4084c0 <ddev>
  8028cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028cf:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    //创建mnt文件夹
    dmnt=(struct dir_entry*)vmalloc();
  8028d3:	b8 00 00 00 00       	mov    eax,0x0
  8028d8:	e8 35 e8 ff ff       	call   801112 <vmalloc>
  8028dd:	48 89 05 e4 5b c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05be4],rax        # 4084c8 <dmnt>
    struct index_node* imnt=dmnt+1;
  8028e4:	48 8b 05 dd 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05bdd]        # 4084c8 <dmnt>
  8028eb:	48 83 c0 58          	add    rax,0x58
  8028ef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dmnt->name=imnt+1;
  8028f3:	48 8b 05 ce 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05bce]        # 4084c8 <dmnt>
  8028fa:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8028fe:	48 83 c2 38          	add    rdx,0x38
  802902:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(dmnt,"mnt",3,root_sb->root,root_sb->root->dir_ops);
  802905:	48 8b 05 3c 5a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25a3c]        # 428348 <root_sb>
  80290c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80290f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802913:	48 8b 05 2e 5a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25a2e]        # 428348 <root_sb>
  80291a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80291d:	48 8b 05 a4 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ba4]        # 4084c8 <dmnt>
  802924:	49 89 c8             	mov    r8,rcx
  802927:	48 89 d1             	mov    rcx,rdx
  80292a:	ba 03 00 00 00       	mov    edx,0x3
  80292f:	be cc 54 81 00       	mov    esi,0x8154cc
  802934:	48 89 c7             	mov    rdi,rax
  802937:	e8 fb fa ff ff       	call   802437 <make_dentry>
    dmnt->dir_inode=imnt;
  80293c:	48 8b 05 85 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b85]        # 4084c8 <dmnt>
  802943:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802947:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(imnt,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  80294b:	48 8b 0d f6 59 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc259f6]        # 428348 <root_sb>
  802952:	48 8b 05 ef 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259ef]        # 428348 <root_sb>
  802959:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80295c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802960:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802964:	48 8b 05 dd 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259dd]        # 428348 <root_sb>
  80296b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80296e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802972:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  802976:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80297a:	49 89 c8             	mov    r8,rcx
  80297d:	b9 02 00 00 00       	mov    ecx,0x2
  802982:	48 89 c7             	mov    rdi,rax
  802985:	e8 74 fc ff ff       	call   8025fe <make_inode>
    imnt->private_index_info=dmnt;
  80298a:	48 8b 15 37 5b c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05b37]        # 4084c8 <dmnt>
  802991:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802995:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx


    //创建几个设备文件
    //console-framebuffer.c
    dconsole= (struct dir_entry *) vmalloc();
  802999:	b8 00 00 00 00       	mov    eax,0x0
  80299e:	e8 6f e7 ff ff       	call   801112 <vmalloc>
  8029a3:	48 89 05 26 5b c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05b26],rax        # 4084d0 <dconsole>
    struct index_node* iconsole=dconsole+1;
  8029aa:	48 8b 05 1f 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b1f]        # 4084d0 <dconsole>
  8029b1:	48 83 c0 58          	add    rax,0x58
  8029b5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dconsole->name=iconsole+1;
  8029b9:	48 8b 05 10 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b10]        # 4084d0 <dconsole>
  8029c0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8029c4:	48 83 c2 38          	add    rdx,0x38
  8029c8:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dconsole,iconsole,"console",ddev,&framebuffer_fops);
  8029cb:	48 8b 15 ee 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05aee]        # 4084c0 <ddev>
  8029d2:	48 8b 05 f7 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05af7]        # 4084d0 <dconsole>
  8029d9:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8029dd:	41 b8 00 d9 80 00    	mov    r8d,0x80d900
  8029e3:	48 89 d1             	mov    rcx,rdx
  8029e6:	ba d0 54 81 00       	mov    edx,0x8154d0
  8029eb:	48 89 c7             	mov    rdi,rax
  8029ee:	e8 65 fc ff ff       	call   802658 <make_devf>
    //hd0-disk.c
    dhd0= (struct dir_entry *) vmalloc();
  8029f3:	b8 00 00 00 00       	mov    eax,0x0
  8029f8:	e8 15 e7 ff ff       	call   801112 <vmalloc>
  8029fd:	48 89 05 d4 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05ad4],rax        # 4084d8 <dhd0>
    struct index_node* ihd0=dhd0+1;
  802a04:	48 8b 05 cd 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05acd]        # 4084d8 <dhd0>
  802a0b:	48 83 c0 58          	add    rax,0x58
  802a0f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    dhd0->name=ihd0+1;
  802a13:	48 8b 05 be 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05abe]        # 4084d8 <dhd0>
  802a1a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802a1e:	48 83 c2 38          	add    rdx,0x38
  802a22:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dhd0,ihd0,"hd0",ddev,&hd_fops);
  802a25:	48 8b 15 94 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05a94]        # 4084c0 <ddev>
  802a2c:	48 8b 05 a5 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05aa5]        # 4084d8 <dhd0>
  802a33:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802a37:	41 b8 80 85 42 00    	mov    r8d,0x428580
  802a3d:	48 89 d1             	mov    rcx,rdx
  802a40:	ba d8 54 81 00       	mov    edx,0x8154d8
  802a45:	48 89 c7             	mov    rdi,rax
  802a48:	e8 0b fc ff ff       	call   802658 <make_devf>
    //tty-tty.c
    dtty= (struct dir_entry *) vmalloc();
  802a4d:	b8 00 00 00 00       	mov    eax,0x0
  802a52:	e8 bb e6 ff ff       	call   801112 <vmalloc>
  802a57:	48 89 05 82 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05a82],rax        # 4084e0 <dtty>
    struct index_node* itty=dtty+1;
  802a5e:	48 8b 05 7b 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a7b]        # 4084e0 <dtty>
  802a65:	48 83 c0 58          	add    rax,0x58
  802a69:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    dtty->name=itty+1;
  802a6d:	48 8b 05 6c 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a6c]        # 4084e0 <dtty>
  802a74:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802a78:	48 83 c2 38          	add    rdx,0x38
  802a7c:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dtty,itty,"tty",ddev,&tty_fops);
  802a7f:	48 8b 15 3a 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05a3a]        # 4084c0 <ddev>
  802a86:	48 8b 05 53 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a53]        # 4084e0 <dtty>
  802a8d:	48 8b 75 d8          	mov    rsi,QWORD PTR [rbp-0x28]
  802a91:	41 b8 00 dc 80 00    	mov    r8d,0x80dc00
  802a97:	48 89 d1             	mov    rcx,rdx
  802a9a:	ba dc 54 81 00       	mov    edx,0x8154dc
  802a9f:	48 89 c7             	mov    rdi,rax
  802aa2:	e8 b1 fb ff ff       	call   802658 <make_devf>
    //初始化一下
    tty_fops.open(itty,&ftty);
  802aa7:	48 8b 15 52 b1 00 00 	mov    rdx,QWORD PTR [rip+0xb152]        # 80dc00 <tty_fops>
  802aae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ab2:	be 00 85 40 00       	mov    esi,0x408500
  802ab7:	48 89 c7             	mov    rdi,rax
  802aba:	ff d2                	call   rdx

}
  802abc:	90                   	nop
  802abd:	c9                   	leave  
  802abe:	c3                   	ret    

0000000000802abf <open_dev>:
//
long open_dev(struct index_node * inode,struct file * filp){
  802abf:	f3 0f 1e fa          	endbr64 
  802ac3:	55                   	push   rbp
  802ac4:	48 89 e5             	mov    rbp,rsp
  802ac7:	48 83 ec 20          	sub    rsp,0x20
  802acb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802acf:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802ad3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ad7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802adb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ade:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802ae2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ae6:	48 89 c7             	mov    rdi,rax
  802ae9:	e8 69 a6 00 00       	call   80d157 <strlen>
  802aee:	48 98                	cdqe   
  802af0:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802af4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802af8:	48 01 d0             	add    rax,rdx
  802afb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802aff:	eb 05                	jmp    802b06 <open_dev+0x47>
  802b01:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802b06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b0a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802b0d:	3c 2f                	cmp    al,0x2f
  802b0f:	74 0a                	je     802b1b <open_dev+0x5c>
  802b11:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b15:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802b19:	73 e6                	jae    802b01 <open_dev+0x42>
    if(p>=name)
  802b1b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b1f:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802b23:	72 0c                	jb     802b31 <open_dev+0x72>
        name=p+1;
  802b25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b29:	48 83 c0 01          	add    rax,0x1
  802b2d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802b31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b35:	ba 03 00 00 00       	mov    edx,0x3
  802b3a:	be dc 54 81 00       	mov    esi,0x8154dc
  802b3f:	48 89 c7             	mov    rdi,rax
  802b42:	e8 3d a3 00 00       	call   80ce84 <memcmp>
  802b47:	85 c0                	test   eax,eax
  802b49:	75 15                	jne    802b60 <open_dev+0xa1>
        return init_tty(inode,filp);
  802b4b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802b4f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b53:	48 89 d6             	mov    rsi,rdx
  802b56:	48 89 c7             	mov    rdi,rax
  802b59:	e8 ae 9c 00 00       	call   80c80c <init_tty>
  802b5e:	eb 31                	jmp    802b91 <open_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802b60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b64:	be d0 54 81 00       	mov    esi,0x8154d0
  802b69:	48 89 c7             	mov    rdi,rax
  802b6c:	e8 67 a5 00 00       	call   80d0d8 <strcmp>
  802b71:	85 c0                	test   eax,eax
  802b73:	75 15                	jne    802b8a <open_dev+0xcb>
        return open_framebuffer(inode,filp);
  802b75:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802b79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b7d:	48 89 d6             	mov    rsi,rdx
  802b80:	48 89 c7             	mov    rdi,rax
  802b83:	e8 2f 50 00 00       	call   807bb7 <open_framebuffer>
  802b88:	eb 07                	jmp    802b91 <open_dev+0xd2>
    }
    return -1;
  802b8a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
}
  802b91:	c9                   	leave  
  802b92:	c3                   	ret    

0000000000802b93 <close_dev>:
long close_dev(struct index_node * inode,struct file * filp){
  802b93:	f3 0f 1e fa          	endbr64 
  802b97:	55                   	push   rbp
  802b98:	48 89 e5             	mov    rbp,rsp
  802b9b:	48 83 ec 20          	sub    rsp,0x20
  802b9f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802ba3:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802ba7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802bab:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802baf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bb2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802bb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802bba:	48 89 c7             	mov    rdi,rax
  802bbd:	e8 95 a5 00 00       	call   80d157 <strlen>
  802bc2:	48 98                	cdqe   
  802bc4:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802bc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802bcc:	48 01 d0             	add    rax,rdx
  802bcf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802bd3:	eb 05                	jmp    802bda <close_dev+0x47>
  802bd5:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802bda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802bde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802be1:	3c 2f                	cmp    al,0x2f
  802be3:	74 0a                	je     802bef <close_dev+0x5c>
  802be5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802be9:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802bed:	73 e6                	jae    802bd5 <close_dev+0x42>
    if(p>=name)
  802bef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802bf3:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802bf7:	72 0c                	jb     802c05 <close_dev+0x72>
        name=p+1;
  802bf9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802bfd:	48 83 c0 01          	add    rax,0x1
  802c01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802c05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c09:	ba 03 00 00 00       	mov    edx,0x3
  802c0e:	be dc 54 81 00       	mov    esi,0x8154dc
  802c13:	48 89 c7             	mov    rdi,rax
  802c16:	e8 69 a2 00 00       	call   80ce84 <memcmp>
  802c1b:	85 c0                	test   eax,eax
  802c1d:	75 15                	jne    802c34 <close_dev+0xa1>
        return close_tty(inode,filp);
  802c1f:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c23:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c27:	48 89 d6             	mov    rsi,rdx
  802c2a:	48 89 c7             	mov    rdi,rax
  802c2d:	e8 5f 9b 00 00       	call   80c791 <close_tty>
  802c32:	eb 31                	jmp    802c65 <close_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802c34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c38:	be d0 54 81 00       	mov    esi,0x8154d0
  802c3d:	48 89 c7             	mov    rdi,rax
  802c40:	e8 93 a4 00 00       	call   80d0d8 <strcmp>
  802c45:	85 c0                	test   eax,eax
  802c47:	75 15                	jne    802c5e <close_dev+0xcb>
        return close_framebuffer(inode,filp);
  802c49:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c51:	48 89 d6             	mov    rsi,rdx
  802c54:	48 89 c7             	mov    rdi,rax
  802c57:	e8 8a 4f 00 00       	call   807be6 <close_framebuffer>
  802c5c:	eb 07                	jmp    802c65 <close_dev+0xd2>
    }
    return -1;
  802c5e:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802c65:	c9                   	leave  
  802c66:	c3                   	ret    

0000000000802c67 <read_dev>:
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802c67:	f3 0f 1e fa          	endbr64 
  802c6b:	55                   	push   rbp
  802c6c:	48 89 e5             	mov    rbp,rsp
  802c6f:	48 83 ec 30          	sub    rsp,0x30
  802c73:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802c77:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802c7b:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802c7f:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802c83:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c87:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802c8b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802c92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c96:	48 89 c7             	mov    rdi,rax
  802c99:	e8 b9 a4 00 00       	call   80d157 <strlen>
  802c9e:	48 98                	cdqe   
  802ca0:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ca4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ca8:	48 01 d0             	add    rax,rdx
  802cab:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802caf:	eb 05                	jmp    802cb6 <read_dev+0x4f>
  802cb1:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802cb6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802cbd:	3c 2f                	cmp    al,0x2f
  802cbf:	74 0a                	je     802ccb <read_dev+0x64>
  802cc1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cc5:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802cc9:	73 e6                	jae    802cb1 <read_dev+0x4a>
    if(p>=name)
  802ccb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ccf:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802cd3:	72 0c                	jb     802ce1 <read_dev+0x7a>
        name=p+1;
  802cd5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cd9:	48 83 c0 01          	add    rax,0x1
  802cdd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802ce1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ce5:	ba 03 00 00 00       	mov    edx,0x3
  802cea:	be dc 54 81 00       	mov    esi,0x8154dc
  802cef:	48 89 c7             	mov    rdi,rax
  802cf2:	e8 8d a1 00 00       	call   80ce84 <memcmp>
  802cf7:	85 c0                	test   eax,eax
  802cf9:	75 1a                	jne    802d15 <read_dev+0xae>
        return read_tty(filp,buf,count,position);
  802cfb:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802cff:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d03:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802d07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d0b:	48 89 c7             	mov    rdi,rax
  802d0e:	e8 e7 9b 00 00       	call   80c8fa <read_tty>
  802d13:	eb 36                	jmp    802d4b <read_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802d15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d19:	be d0 54 81 00       	mov    esi,0x8154d0
  802d1e:	48 89 c7             	mov    rdi,rax
  802d21:	e8 b2 a3 00 00       	call   80d0d8 <strcmp>
  802d26:	85 c0                	test   eax,eax
  802d28:	75 1a                	jne    802d44 <read_dev+0xdd>
        return read_framebuffer(filp,buf,count,position);
  802d2a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802d2e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d32:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802d36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d3a:	48 89 c7             	mov    rdi,rax
  802d3d:	e8 b7 4e 00 00       	call   807bf9 <read_framebuffer>
  802d42:	eb 07                	jmp    802d4b <read_dev+0xe4>
    }
    return -1;
  802d44:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802d4b:	c9                   	leave  
  802d4c:	c3                   	ret    

0000000000802d4d <write_dev>:
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802d4d:	f3 0f 1e fa          	endbr64 
  802d51:	55                   	push   rbp
  802d52:	48 89 e5             	mov    rbp,rsp
  802d55:	48 83 ec 30          	sub    rsp,0x30
  802d59:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802d5d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802d61:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802d65:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802d69:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d6d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802d71:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d74:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802d78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d7c:	48 89 c7             	mov    rdi,rax
  802d7f:	e8 d3 a3 00 00       	call   80d157 <strlen>
  802d84:	48 98                	cdqe   
  802d86:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802d8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d8e:	48 01 d0             	add    rax,rdx
  802d91:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802d95:	eb 05                	jmp    802d9c <write_dev+0x4f>
  802d97:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802d9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802da0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802da3:	3c 2f                	cmp    al,0x2f
  802da5:	74 0a                	je     802db1 <write_dev+0x64>
  802da7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dab:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802daf:	73 e6                	jae    802d97 <write_dev+0x4a>
    if(p>=name)
  802db1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802db5:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802db9:	72 0c                	jb     802dc7 <write_dev+0x7a>
        name=p+1;
  802dbb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dbf:	48 83 c0 01          	add    rax,0x1
  802dc3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802dc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802dcb:	ba 03 00 00 00       	mov    edx,0x3
  802dd0:	be dc 54 81 00       	mov    esi,0x8154dc
  802dd5:	48 89 c7             	mov    rdi,rax
  802dd8:	e8 a7 a0 00 00       	call   80ce84 <memcmp>
  802ddd:	85 c0                	test   eax,eax
  802ddf:	75 1a                	jne    802dfb <write_dev+0xae>
        return write_tty(filp,buf,count,position);
  802de1:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802de5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802de9:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802ded:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802df1:	48 89 c7             	mov    rdi,rax
  802df4:	e8 ae 9b 00 00       	call   80c9a7 <write_tty>
  802df9:	eb 36                	jmp    802e31 <write_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802dfb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802dff:	be d0 54 81 00       	mov    esi,0x8154d0
  802e04:	48 89 c7             	mov    rdi,rax
  802e07:	e8 cc a2 00 00       	call   80d0d8 <strcmp>
  802e0c:	85 c0                	test   eax,eax
  802e0e:	75 1a                	jne    802e2a <write_dev+0xdd>
        return write_framebuffer(filp,buf,count,position);
  802e10:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e14:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e18:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e20:	48 89 c7             	mov    rdi,rax
  802e23:	e8 ec 4d 00 00       	call   807c14 <write_framebuffer>
  802e28:	eb 07                	jmp    802e31 <write_dev+0xe4>
    }
    return -1;
  802e2a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802e31:	c9                   	leave  
  802e32:	c3                   	ret    

0000000000802e33 <ioctl_dev>:
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  802e33:	f3 0f 1e fa          	endbr64 
  802e37:	55                   	push   rbp
  802e38:	48 89 e5             	mov    rbp,rsp
  802e3b:	48 83 ec 30          	sub    rsp,0x30
  802e3f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e43:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802e47:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802e4b:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802e4f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802e53:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802e57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802e5a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802e5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e62:	48 89 c7             	mov    rdi,rax
  802e65:	e8 ed a2 00 00       	call   80d157 <strlen>
  802e6a:	48 98                	cdqe   
  802e6c:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802e70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e74:	48 01 d0             	add    rax,rdx
  802e77:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802e7b:	eb 05                	jmp    802e82 <ioctl_dev+0x4f>
  802e7d:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802e82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802e89:	3c 2f                	cmp    al,0x2f
  802e8b:	74 0a                	je     802e97 <ioctl_dev+0x64>
  802e8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e91:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e95:	73 e6                	jae    802e7d <ioctl_dev+0x4a>
    if(p>=name)
  802e97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e9b:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e9f:	72 0c                	jb     802ead <ioctl_dev+0x7a>
        name=p+1;
  802ea1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ea5:	48 83 c0 01          	add    rax,0x1
  802ea9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802ead:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802eb1:	ba 03 00 00 00       	mov    edx,0x3
  802eb6:	be dc 54 81 00       	mov    esi,0x8154dc
  802ebb:	48 89 c7             	mov    rdi,rax
  802ebe:	e8 c1 9f 00 00       	call   80ce84 <memcmp>
  802ec3:	85 c0                	test   eax,eax
  802ec5:	75 1a                	jne    802ee1 <ioctl_dev+0xae>
        return ioctl_tty(inode, filp, cmd, arg);
  802ec7:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802ecb:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802ecf:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802ed3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ed7:	48 89 c7             	mov    rdi,rax
  802eda:	e8 90 9b 00 00       	call   80ca6f <ioctl_tty>
  802edf:	eb 36                	jmp    802f17 <ioctl_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802ee1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ee5:	be d0 54 81 00       	mov    esi,0x8154d0
  802eea:	48 89 c7             	mov    rdi,rax
  802eed:	e8 e6 a1 00 00       	call   80d0d8 <strcmp>
  802ef2:	85 c0                	test   eax,eax
  802ef4:	75 1a                	jne    802f10 <ioctl_dev+0xdd>
        return ioctl_framebuffer(inode,filp,cmd,arg);
  802ef6:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802efa:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802efe:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f02:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f06:	48 89 c7             	mov    rdi,rax
  802f09:	e8 d5 4d 00 00       	call   807ce3 <ioctl_framebuffer>
  802f0e:	eb 07                	jmp    802f17 <ioctl_dev+0xe4>
    }
    return -1;
  802f10:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802f17:	c9                   	leave  
  802f18:	c3                   	ret    

0000000000802f19 <load_driver>:
int load_driver(char *path)
{
  802f19:	f3 0f 1e fa          	endbr64 
  802f1d:	55                   	push   rbp
  802f1e:	48 89 e5             	mov    rbp,rsp
  802f21:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802f25:	90                   	nop
  802f26:	5d                   	pop    rbp
  802f27:	c3                   	ret    

0000000000802f28 <reg_device>:

int reg_device(device* dev)
{
  802f28:	f3 0f 1e fa          	endbr64 
  802f2c:	55                   	push   rbp
  802f2d:	48 89 e5             	mov    rbp,rsp
  802f30:	53                   	push   rbx
  802f31:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802f35:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802f3c:	e9 42 01 00 00       	jmp    803083 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802f41:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f44:	48 63 d0             	movsxd rdx,eax
  802f47:	48 89 d0             	mov    rax,rdx
  802f4a:	48 c1 e0 02          	shl    rax,0x2
  802f4e:	48 01 d0             	add    rax,rdx
  802f51:	48 c1 e0 02          	shl    rax,0x2
  802f55:	48 01 d0             	add    rax,rdx
  802f58:	48 c1 e0 03          	shl    rax,0x3
  802f5c:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f62:	8b 00                	mov    eax,DWORD PTR [rax]
  802f64:	85 c0                	test   eax,eax
  802f66:	0f 85 13 01 00 00    	jne    80307f <reg_device+0x157>
        {
            devs[i]=*dev;
  802f6c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f6f:	48 63 d0             	movsxd rdx,eax
  802f72:	48 89 d0             	mov    rax,rdx
  802f75:	48 c1 e0 02          	shl    rax,0x2
  802f79:	48 01 d0             	add    rax,rdx
  802f7c:	48 c1 e0 02          	shl    rax,0x2
  802f80:	48 01 d0             	add    rax,rdx
  802f83:	48 c1 e0 03          	shl    rax,0x3
  802f87:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802f8e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802f92:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802f95:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802f99:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802f9c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802fa0:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802fa4:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802fa8:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802fac:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802fb0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802fb4:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802fb8:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802fbc:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802fc0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802fc4:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802fc8:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802fcc:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802fd0:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802fd4:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802fd8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802fdc:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802fe0:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802fe4:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802fe8:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802fec:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802ff0:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ff4:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802ff8:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802ffc:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803000:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803004:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803008:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80300c:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803010:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803017:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80301e:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803025:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80302c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803033:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80303a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803041:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803048:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  80304f:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  803056:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803059:	48 63 d0             	movsxd rdx,eax
  80305c:	48 89 d0             	mov    rax,rdx
  80305f:	48 c1 e0 02          	shl    rax,0x2
  803063:	48 01 d0             	add    rax,rdx
  803066:	48 c1 e0 02          	shl    rax,0x2
  80306a:	48 01 d0             	add    rax,rdx
  80306d:	48 c1 e0 03          	shl    rax,0x3
  803071:	48 05 90 2e 40 00    	add    rax,0x402e90
  803077:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  80307d:	eb 0e                	jmp    80308d <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  80307f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803083:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  803087:	0f 8e b4 fe ff ff    	jle    802f41 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  80308d:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  803091:	75 0a                	jne    80309d <reg_device+0x175>
        return -1;
  803093:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803098:	e9 6d 01 00 00       	jmp    80320a <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  80309d:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8030a4:	00 
  8030a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030a8:	48 63 d0             	movsxd rdx,eax
  8030ab:	48 89 d0             	mov    rax,rdx
  8030ae:	48 c1 e0 02          	shl    rax,0x2
  8030b2:	48 01 d0             	add    rax,rdx
  8030b5:	48 c1 e0 02          	shl    rax,0x2
  8030b9:	48 01 d0             	add    rax,rdx
  8030bc:	48 c1 e0 03          	shl    rax,0x3
  8030c0:	48 05 80 2e 40 00    	add    rax,0x402e80
  8030c6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  8030ca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8030ce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8030d1:	83 f8 03             	cmp    eax,0x3
  8030d4:	74 3b                	je     803111 <reg_device+0x1e9>
  8030d6:	83 f8 03             	cmp    eax,0x3
  8030d9:	7f 4b                	jg     803126 <reg_device+0x1fe>
  8030db:	83 f8 01             	cmp    eax,0x1
  8030de:	74 07                	je     8030e7 <reg_device+0x1bf>
  8030e0:	83 f8 02             	cmp    eax,0x2
  8030e3:	74 17                	je     8030fc <reg_device+0x1d4>
  8030e5:	eb 3f                	jmp    803126 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  8030e7:	48 8b 05 92 53 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05392]        # 408480 <dev_tree>
  8030ee:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8030f2:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  8030f9:	00 
        break;
  8030fa:	eb 34                	jmp    803130 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  8030fc:	48 8b 05 85 53 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05385]        # 408488 <dev_tree+0x8>
  803103:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803107:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  80310e:	00 
        break;
  80310f:	eb 1f                	jmp    803130 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  803111:	48 8b 05 78 53 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05378]        # 408490 <dev_tree+0x10>
  803118:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80311c:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  803123:	00 
        break;
  803124:	eb 0a                	jmp    803130 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  803126:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80312b:	e9 da 00 00 00       	jmp    80320a <reg_device+0x2e2>
    }
    if(!p){
  803130:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  803135:	75 2b                	jne    803162 <reg_device+0x23a>
        *pp=neo;
  803137:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80313b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80313f:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  803142:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803146:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  80314d:	00 00 00 00 
  803151:	eb 3d                	jmp    803190 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  803153:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803157:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80315e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803162:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803166:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80316d:	48 85 c0             	test   rax,rax
  803170:	75 e1                	jne    803153 <reg_device+0x22b>
        p->next=neo;
  803172:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803176:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80317a:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  803181:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803185:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803189:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  803190:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803194:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  80319b:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  80319f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031a3:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8031a6:	83 f8 04             	cmp    eax,0x4
  8031a9:	74 3b                	je     8031e6 <reg_device+0x2be>
  8031ab:	83 f8 04             	cmp    eax,0x4
  8031ae:	7f 56                	jg     803206 <reg_device+0x2de>
  8031b0:	83 f8 03             	cmp    eax,0x3
  8031b3:	74 21                	je     8031d6 <reg_device+0x2ae>
  8031b5:	83 f8 03             	cmp    eax,0x3
  8031b8:	7f 4c                	jg     803206 <reg_device+0x2de>
  8031ba:	83 f8 01             	cmp    eax,0x1
  8031bd:	74 07                	je     8031c6 <reg_device+0x29e>
  8031bf:	83 f8 02             	cmp    eax,0x2
  8031c2:	74 32                	je     8031f6 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  8031c4:	eb 40                	jmp    803206 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  8031c6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031ca:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  8031d1:	00 00 00 
        break;
  8031d4:	eb 31                	jmp    803207 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  8031d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031da:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  8031e1:	00 00 00 
        break;
  8031e4:	eb 21                	jmp    803207 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  8031e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031ea:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  8031f1:	00 00 00 
        break;
  8031f4:	eb 11                	jmp    803207 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  8031f6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031fa:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  803201:	00 00 00 
        break;
  803204:	eb 01                	jmp    803207 <reg_device+0x2df>
        break;
  803206:	90                   	nop
    }
    return i;
  803207:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80320a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80320e:	c9                   	leave  
  80320f:	c3                   	ret    

0000000000803210 <reg_driver>:


int reg_driver(driver *drv)
{
  803210:	f3 0f 1e fa          	endbr64 
  803214:	55                   	push   rbp
  803215:	48 89 e5             	mov    rbp,rsp
  803218:	53                   	push   rbx
  803219:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  80321d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  803224:	e9 22 01 00 00       	jmp    80334b <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  803229:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80322c:	48 63 d0             	movsxd rdx,eax
  80322f:	48 89 d0             	mov    rax,rdx
  803232:	48 c1 e0 02          	shl    rax,0x2
  803236:	48 01 d0             	add    rax,rdx
  803239:	48 c1 e0 05          	shl    rax,0x5
  80323d:	48 05 80 58 40 00    	add    rax,0x405880
  803243:	8b 00                	mov    eax,DWORD PTR [rax]
  803245:	85 c0                	test   eax,eax
  803247:	0f 85 fa 00 00 00    	jne    803347 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  80324d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803250:	48 63 d0             	movsxd rdx,eax
  803253:	48 89 d0             	mov    rax,rdx
  803256:	48 c1 e0 02          	shl    rax,0x2
  80325a:	48 01 d0             	add    rax,rdx
  80325d:	48 c1 e0 05          	shl    rax,0x5
  803261:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  803268:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80326c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80326f:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803273:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803276:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80327a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80327e:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803282:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803286:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80328a:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80328e:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803292:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803296:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80329a:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80329e:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8032a2:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8032a6:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8032aa:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8032ae:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8032b2:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8032b6:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8032ba:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8032be:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8032c2:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8032c6:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8032ca:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8032ce:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8032d2:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8032d6:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8032da:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8032de:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8032e2:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8032e6:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8032ea:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8032f1:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8032f8:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8032ff:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803306:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80330d:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803314:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80331b:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  803322:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803325:	48 63 d0             	movsxd rdx,eax
  803328:	48 89 d0             	mov    rax,rdx
  80332b:	48 c1 e0 02          	shl    rax,0x2
  80332f:	48 01 d0             	add    rax,rdx
  803332:	48 c1 e0 05          	shl    rax,0x5
  803336:	48 05 80 58 40 00    	add    rax,0x405880
  80333c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  803342:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803345:	eb 13                	jmp    80335a <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  803347:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80334b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80334f:	0f 8e d4 fe ff ff    	jle    803229 <reg_driver+0x19>
        }
    }
    return -1;
  803355:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80335a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80335e:	c9                   	leave  
  80335f:	c3                   	ret    

0000000000803360 <sys_find_dev>:

int sys_find_dev(char *name)
{
  803360:	f3 0f 1e fa          	endbr64 
  803364:	55                   	push   rbp
  803365:	48 89 e5             	mov    rbp,rsp
  803368:	48 83 ec 20          	sub    rsp,0x20
  80336c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  803370:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803377:	eb 6c                	jmp    8033e5 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803379:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80337c:	48 63 d0             	movsxd rdx,eax
  80337f:	48 89 d0             	mov    rax,rdx
  803382:	48 c1 e0 02          	shl    rax,0x2
  803386:	48 01 d0             	add    rax,rdx
  803389:	48 c1 e0 02          	shl    rax,0x2
  80338d:	48 01 d0             	add    rax,rdx
  803390:	48 c1 e0 03          	shl    rax,0x3
  803394:	48 05 90 2e 40 00    	add    rax,0x402e90
  80339a:	8b 00                	mov    eax,DWORD PTR [rax]
  80339c:	85 c0                	test   eax,eax
  80339e:	74 41                	je     8033e1 <sys_find_dev+0x81>
  8033a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a3:	48 63 d0             	movsxd rdx,eax
  8033a6:	48 89 d0             	mov    rax,rdx
  8033a9:	48 c1 e0 02          	shl    rax,0x2
  8033ad:	48 01 d0             	add    rax,rdx
  8033b0:	48 c1 e0 02          	shl    rax,0x2
  8033b4:	48 01 d0             	add    rax,rdx
  8033b7:	48 c1 e0 03          	shl    rax,0x3
  8033bb:	48 83 c0 10          	add    rax,0x10
  8033bf:	48 05 80 2e 40 00    	add    rax,0x402e80
  8033c5:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8033c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8033cd:	48 89 d6             	mov    rsi,rdx
  8033d0:	48 89 c7             	mov    rdi,rax
  8033d3:	e8 00 9d 00 00       	call   80d0d8 <strcmp>
  8033d8:	85 c0                	test   eax,eax
  8033da:	75 05                	jne    8033e1 <sys_find_dev+0x81>
            return i;
  8033dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033df:	eb 0f                	jmp    8033f0 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  8033e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8033e5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8033e9:	7e 8e                	jle    803379 <sys_find_dev+0x19>
    }
    return -1;
  8033eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8033f0:	c9                   	leave  
  8033f1:	c3                   	ret    

00000000008033f2 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  8033f2:	f3 0f 1e fa          	endbr64 
  8033f6:	55                   	push   rbp
  8033f7:	48 89 e5             	mov    rbp,rsp
  8033fa:	48 83 ec 30          	sub    rsp,0x30
  8033fe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803402:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  803405:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803409:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  803410:	eb 67                	jmp    803479 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803412:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803415:	48 63 d0             	movsxd rdx,eax
  803418:	48 89 d0             	mov    rax,rdx
  80341b:	48 c1 e0 02          	shl    rax,0x2
  80341f:	48 01 d0             	add    rax,rdx
  803422:	48 c1 e0 02          	shl    rax,0x2
  803426:	48 01 d0             	add    rax,rdx
  803429:	48 c1 e0 03          	shl    rax,0x3
  80342d:	48 05 90 2e 40 00    	add    rax,0x402e90
  803433:	8b 00                	mov    eax,DWORD PTR [rax]
  803435:	85 c0                	test   eax,eax
  803437:	74 3c                	je     803475 <sys_operate_dev+0x83>
  803439:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80343c:	48 63 d0             	movsxd rdx,eax
  80343f:	48 89 d0             	mov    rax,rdx
  803442:	48 c1 e0 02          	shl    rax,0x2
  803446:	48 01 d0             	add    rax,rdx
  803449:	48 c1 e0 02          	shl    rax,0x2
  80344d:	48 01 d0             	add    rax,rdx
  803450:	48 c1 e0 03          	shl    rax,0x3
  803454:	48 83 c0 10          	add    rax,0x10
  803458:	48 05 80 2e 40 00    	add    rax,0x402e80
  80345e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803462:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803466:	48 89 d6             	mov    rsi,rdx
  803469:	48 89 c7             	mov    rdi,rax
  80346c:	e8 67 9c 00 00       	call   80d0d8 <strcmp>
  803471:	85 c0                	test   eax,eax
  803473:	74 0c                	je     803481 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  803475:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803479:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80347d:	7e 93                	jle    803412 <sys_operate_dev+0x20>
  80347f:	eb 01                	jmp    803482 <sys_operate_dev+0x90>
            break;
  803481:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  803482:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803486:	75 0a                	jne    803492 <sys_operate_dev+0xa0>
  803488:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80348d:	e9 9c 02 00 00       	jmp    80372e <sys_operate_dev+0x33c>
    switch (func) {
  803492:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  803496:	0f 87 8d 02 00 00    	ja     803729 <sys_operate_dev+0x337>
  80349c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80349f:	48 8b 04 c5 e0 54 81 	mov    rax,QWORD PTR [rax*8+0x8154e0]
  8034a6:	00 
  8034a7:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  8034aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034ad:	48 63 d0             	movsxd rdx,eax
  8034b0:	48 89 d0             	mov    rax,rdx
  8034b3:	48 c1 e0 02          	shl    rax,0x2
  8034b7:	48 01 d0             	add    rax,rdx
  8034ba:	48 c1 e0 02          	shl    rax,0x2
  8034be:	48 01 d0             	add    rax,rdx
  8034c1:	48 c1 e0 03          	shl    rax,0x3
  8034c5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8034cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8034ce:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8034d2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8034d6:	48 89 c7             	mov    rdi,rax
  8034d9:	ff d2                	call   rdx
  8034db:	e9 4e 02 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  8034e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034e3:	48 63 d0             	movsxd rdx,eax
  8034e6:	48 89 d0             	mov    rax,rdx
  8034e9:	48 c1 e0 02          	shl    rax,0x2
  8034ed:	48 01 d0             	add    rax,rdx
  8034f0:	48 c1 e0 02          	shl    rax,0x2
  8034f4:	48 01 d0             	add    rax,rdx
  8034f7:	48 c1 e0 03          	shl    rax,0x3
  8034fb:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803501:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803504:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803508:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80350c:	48 89 c7             	mov    rdi,rax
  80350f:	ff d2                	call   rdx
  803511:	e9 18 02 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803516:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803519:	48 63 d0             	movsxd rdx,eax
  80351c:	48 89 d0             	mov    rax,rdx
  80351f:	48 c1 e0 02          	shl    rax,0x2
  803523:	48 01 d0             	add    rax,rdx
  803526:	48 c1 e0 02          	shl    rax,0x2
  80352a:	48 01 d0             	add    rax,rdx
  80352d:	48 c1 e0 03          	shl    rax,0x3
  803531:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803537:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80353a:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80353e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803542:	48 89 c7             	mov    rdi,rax
  803545:	ff d2                	call   rdx
  803547:	e9 e2 01 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  80354c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80354f:	48 63 d0             	movsxd rdx,eax
  803552:	48 89 d0             	mov    rax,rdx
  803555:	48 c1 e0 02          	shl    rax,0x2
  803559:	48 01 d0             	add    rax,rdx
  80355c:	48 c1 e0 02          	shl    rax,0x2
  803560:	48 01 d0             	add    rax,rdx
  803563:	48 c1 e0 03          	shl    rax,0x3
  803567:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80356d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803570:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803574:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803578:	48 89 c7             	mov    rdi,rax
  80357b:	ff d2                	call   rdx
  80357d:	e9 ac 01 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803582:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803585:	48 63 d0             	movsxd rdx,eax
  803588:	48 89 d0             	mov    rax,rdx
  80358b:	48 c1 e0 02          	shl    rax,0x2
  80358f:	48 01 d0             	add    rax,rdx
  803592:	48 c1 e0 02          	shl    rax,0x2
  803596:	48 01 d0             	add    rax,rdx
  803599:	48 c1 e0 03          	shl    rax,0x3
  80359d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8035a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8035a6:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8035aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8035ae:	48 89 c7             	mov    rdi,rax
  8035b1:	ff d2                	call   rdx
  8035b3:	e9 76 01 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8035b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035bb:	48 63 d0             	movsxd rdx,eax
  8035be:	48 89 d0             	mov    rax,rdx
  8035c1:	48 c1 e0 02          	shl    rax,0x2
  8035c5:	48 01 d0             	add    rax,rdx
  8035c8:	48 c1 e0 02          	shl    rax,0x2
  8035cc:	48 01 d0             	add    rax,rdx
  8035cf:	48 c1 e0 03          	shl    rax,0x3
  8035d3:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8035d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8035dc:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  8035e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8035e4:	48 89 c7             	mov    rdi,rax
  8035e7:	ff d2                	call   rdx
  8035e9:	e9 40 01 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  8035ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035f1:	48 63 d0             	movsxd rdx,eax
  8035f4:	48 89 d0             	mov    rax,rdx
  8035f7:	48 c1 e0 02          	shl    rax,0x2
  8035fb:	48 01 d0             	add    rax,rdx
  8035fe:	48 c1 e0 02          	shl    rax,0x2
  803602:	48 01 d0             	add    rax,rdx
  803605:	48 c1 e0 03          	shl    rax,0x3
  803609:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80360f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803612:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803616:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80361a:	48 89 c7             	mov    rdi,rax
  80361d:	ff d2                	call   rdx
  80361f:	e9 0a 01 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803624:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803627:	48 63 d0             	movsxd rdx,eax
  80362a:	48 89 d0             	mov    rax,rdx
  80362d:	48 c1 e0 02          	shl    rax,0x2
  803631:	48 01 d0             	add    rax,rdx
  803634:	48 c1 e0 02          	shl    rax,0x2
  803638:	48 01 d0             	add    rax,rdx
  80363b:	48 c1 e0 03          	shl    rax,0x3
  80363f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803645:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803648:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80364c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803650:	48 89 c7             	mov    rdi,rax
  803653:	ff d2                	call   rdx
  803655:	e9 d4 00 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  80365a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80365d:	48 63 d0             	movsxd rdx,eax
  803660:	48 89 d0             	mov    rax,rdx
  803663:	48 c1 e0 02          	shl    rax,0x2
  803667:	48 01 d0             	add    rax,rdx
  80366a:	48 c1 e0 02          	shl    rax,0x2
  80366e:	48 01 d0             	add    rax,rdx
  803671:	48 c1 e0 03          	shl    rax,0x3
  803675:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80367b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80367e:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803682:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803686:	48 89 c7             	mov    rdi,rax
  803689:	ff d2                	call   rdx
  80368b:	e9 9e 00 00 00       	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803690:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803693:	48 63 d0             	movsxd rdx,eax
  803696:	48 89 d0             	mov    rax,rdx
  803699:	48 c1 e0 02          	shl    rax,0x2
  80369d:	48 01 d0             	add    rax,rdx
  8036a0:	48 c1 e0 02          	shl    rax,0x2
  8036a4:	48 01 d0             	add    rax,rdx
  8036a7:	48 c1 e0 03          	shl    rax,0x3
  8036ab:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036b4:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8036b8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036bc:	48 89 c7             	mov    rdi,rax
  8036bf:	ff d2                	call   rdx
  8036c1:	eb 6b                	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8036c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036c6:	48 63 d0             	movsxd rdx,eax
  8036c9:	48 89 d0             	mov    rax,rdx
  8036cc:	48 c1 e0 02          	shl    rax,0x2
  8036d0:	48 01 d0             	add    rax,rdx
  8036d3:	48 c1 e0 02          	shl    rax,0x2
  8036d7:	48 01 d0             	add    rax,rdx
  8036da:	48 c1 e0 03          	shl    rax,0x3
  8036de:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036e7:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8036eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036ef:	48 89 c7             	mov    rdi,rax
  8036f2:	ff d2                	call   rdx
  8036f4:	eb 38                	jmp    80372e <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8036f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036f9:	48 63 d0             	movsxd rdx,eax
  8036fc:	48 89 d0             	mov    rax,rdx
  8036ff:	48 c1 e0 02          	shl    rax,0x2
  803703:	48 01 d0             	add    rax,rdx
  803706:	48 c1 e0 02          	shl    rax,0x2
  80370a:	48 01 d0             	add    rax,rdx
  80370d:	48 c1 e0 03          	shl    rax,0x3
  803711:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803717:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80371a:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80371e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803722:	48 89 c7             	mov    rdi,rax
  803725:	ff d2                	call   rdx
  803727:	eb 05                	jmp    80372e <sys_operate_dev+0x33c>
    }
    return -1;
  803729:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80372e:	c9                   	leave  
  80372f:	c3                   	ret    

0000000000803730 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803730:	f3 0f 1e fa          	endbr64 
  803734:	55                   	push   rbp
  803735:	48 89 e5             	mov    rbp,rsp
  803738:	48 83 ec 10          	sub    rsp,0x10
  80373c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80373f:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803742:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803746:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803749:	48 63 d0             	movsxd rdx,eax
  80374c:	48 89 d0             	mov    rax,rdx
  80374f:	48 c1 e0 02          	shl    rax,0x2
  803753:	48 01 d0             	add    rax,rdx
  803756:	48 c1 e0 05          	shl    rax,0x5
  80375a:	48 05 80 58 40 00    	add    rax,0x405880
  803760:	8b 00                	mov    eax,DWORD PTR [rax]
  803762:	85 c0                	test   eax,eax
  803764:	75 0a                	jne    803770 <call_drv_func+0x40>
  803766:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80376b:	e9 15 02 00 00       	jmp    803985 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803770:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803774:	0f 87 06 02 00 00    	ja     803980 <call_drv_func+0x250>
  80377a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80377d:	48 8b 04 c5 40 55 81 	mov    rax,QWORD PTR [rax*8+0x815540]
  803784:	00 
  803785:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803788:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80378b:	48 63 d0             	movsxd rdx,eax
  80378e:	48 89 d0             	mov    rax,rdx
  803791:	48 c1 e0 02          	shl    rax,0x2
  803795:	48 01 d0             	add    rax,rdx
  803798:	48 c1 e0 05          	shl    rax,0x5
  80379c:	48 05 88 58 40 00    	add    rax,0x405888
  8037a2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8037a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a9:	48 89 c7             	mov    rdi,rax
  8037ac:	ff d2                	call   rdx
  8037ae:	e9 d2 01 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8037b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037b6:	48 63 d0             	movsxd rdx,eax
  8037b9:	48 89 d0             	mov    rax,rdx
  8037bc:	48 c1 e0 02          	shl    rax,0x2
  8037c0:	48 01 d0             	add    rax,rdx
  8037c3:	48 c1 e0 05          	shl    rax,0x5
  8037c7:	48 05 90 58 40 00    	add    rax,0x405890
  8037cd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8037d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037d4:	48 89 c7             	mov    rdi,rax
  8037d7:	ff d2                	call   rdx
  8037d9:	e9 a7 01 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8037de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037e1:	48 63 d0             	movsxd rdx,eax
  8037e4:	48 89 d0             	mov    rax,rdx
  8037e7:	48 c1 e0 02          	shl    rax,0x2
  8037eb:	48 01 d0             	add    rax,rdx
  8037ee:	48 c1 e0 05          	shl    rax,0x5
  8037f2:	48 05 98 58 40 00    	add    rax,0x405898
  8037f8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8037fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ff:	48 89 c7             	mov    rdi,rax
  803802:	ff d2                	call   rdx
  803804:	e9 7c 01 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803809:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80380c:	48 63 d0             	movsxd rdx,eax
  80380f:	48 89 d0             	mov    rax,rdx
  803812:	48 c1 e0 02          	shl    rax,0x2
  803816:	48 01 d0             	add    rax,rdx
  803819:	48 c1 e0 05          	shl    rax,0x5
  80381d:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803823:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803826:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80382a:	48 89 c7             	mov    rdi,rax
  80382d:	ff d2                	call   rdx
  80382f:	e9 51 01 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803834:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803837:	48 63 d0             	movsxd rdx,eax
  80383a:	48 89 d0             	mov    rax,rdx
  80383d:	48 c1 e0 02          	shl    rax,0x2
  803841:	48 01 d0             	add    rax,rdx
  803844:	48 c1 e0 05          	shl    rax,0x5
  803848:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80384e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803851:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803855:	48 89 c7             	mov    rdi,rax
  803858:	ff d2                	call   rdx
  80385a:	e9 26 01 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80385f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803862:	48 63 d0             	movsxd rdx,eax
  803865:	48 89 d0             	mov    rax,rdx
  803868:	48 c1 e0 02          	shl    rax,0x2
  80386c:	48 01 d0             	add    rax,rdx
  80386f:	48 c1 e0 05          	shl    rax,0x5
  803873:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803879:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80387c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803880:	48 89 c7             	mov    rdi,rax
  803883:	ff d2                	call   rdx
  803885:	e9 fb 00 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  80388a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80388d:	48 63 d0             	movsxd rdx,eax
  803890:	48 89 d0             	mov    rax,rdx
  803893:	48 c1 e0 02          	shl    rax,0x2
  803897:	48 01 d0             	add    rax,rdx
  80389a:	48 c1 e0 05          	shl    rax,0x5
  80389e:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8038a4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038ab:	48 89 c7             	mov    rdi,rax
  8038ae:	ff d2                	call   rdx
  8038b0:	e9 d0 00 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8038b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038b8:	48 63 d0             	movsxd rdx,eax
  8038bb:	48 89 d0             	mov    rax,rdx
  8038be:	48 c1 e0 02          	shl    rax,0x2
  8038c2:	48 01 d0             	add    rax,rdx
  8038c5:	48 c1 e0 05          	shl    rax,0x5
  8038c9:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8038cf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038d6:	48 89 c7             	mov    rdi,rax
  8038d9:	ff d2                	call   rdx
  8038db:	e9 a5 00 00 00       	jmp    803985 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8038e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038e3:	48 63 d0             	movsxd rdx,eax
  8038e6:	48 89 d0             	mov    rax,rdx
  8038e9:	48 c1 e0 02          	shl    rax,0x2
  8038ed:	48 01 d0             	add    rax,rdx
  8038f0:	48 c1 e0 05          	shl    rax,0x5
  8038f4:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8038fa:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803901:	48 89 c7             	mov    rdi,rax
  803904:	ff d2                	call   rdx
  803906:	eb 7d                	jmp    803985 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803908:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80390b:	48 63 d0             	movsxd rdx,eax
  80390e:	48 89 d0             	mov    rax,rdx
  803911:	48 c1 e0 02          	shl    rax,0x2
  803915:	48 01 d0             	add    rax,rdx
  803918:	48 c1 e0 05          	shl    rax,0x5
  80391c:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803922:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803925:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803929:	48 89 c7             	mov    rdi,rax
  80392c:	ff d2                	call   rdx
  80392e:	eb 55                	jmp    803985 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803930:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803933:	48 63 d0             	movsxd rdx,eax
  803936:	48 89 d0             	mov    rax,rdx
  803939:	48 c1 e0 02          	shl    rax,0x2
  80393d:	48 01 d0             	add    rax,rdx
  803940:	48 c1 e0 05          	shl    rax,0x5
  803944:	48 05 d8 58 40 00    	add    rax,0x4058d8
  80394a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80394d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803951:	48 89 c7             	mov    rdi,rax
  803954:	ff d2                	call   rdx
  803956:	eb 2d                	jmp    803985 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803958:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395b:	48 63 d0             	movsxd rdx,eax
  80395e:	48 89 d0             	mov    rax,rdx
  803961:	48 c1 e0 02          	shl    rax,0x2
  803965:	48 01 d0             	add    rax,rdx
  803968:	48 c1 e0 05          	shl    rax,0x5
  80396c:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803972:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803975:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803979:	48 89 c7             	mov    rdi,rax
  80397c:	ff d2                	call   rdx
  80397e:	eb 05                	jmp    803985 <call_drv_func+0x255>
    }
    return -1;
  803980:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803985:	c9                   	leave  
  803986:	c3                   	ret    

0000000000803987 <dispose_device>:
int dispose_device(int dev){
  803987:	f3 0f 1e fa          	endbr64 
  80398b:	55                   	push   rbp
  80398c:	48 89 e5             	mov    rbp,rsp
  80398f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803992:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803995:	48 63 d0             	movsxd rdx,eax
  803998:	48 89 d0             	mov    rax,rdx
  80399b:	48 c1 e0 02          	shl    rax,0x2
  80399f:	48 01 d0             	add    rax,rdx
  8039a2:	48 c1 e0 02          	shl    rax,0x2
  8039a6:	48 01 d0             	add    rax,rdx
  8039a9:	48 c1 e0 03          	shl    rax,0x3
  8039ad:	48 05 90 2e 40 00    	add    rax,0x402e90
  8039b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8039b5:	83 f8 01             	cmp    eax,0x1
  8039b8:	74 07                	je     8039c1 <dispose_device+0x3a>
  8039ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8039bf:	eb 62                	jmp    803a23 <dispose_device+0x9c>
    device* p=&devs[dev];
  8039c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8039c4:	48 63 d0             	movsxd rdx,eax
  8039c7:	48 89 d0             	mov    rax,rdx
  8039ca:	48 c1 e0 02          	shl    rax,0x2
  8039ce:	48 01 d0             	add    rax,rdx
  8039d1:	48 c1 e0 02          	shl    rax,0x2
  8039d5:	48 01 d0             	add    rax,rdx
  8039d8:	48 c1 e0 03          	shl    rax,0x3
  8039dc:	48 05 80 2e 40 00    	add    rax,0x402e80
  8039e2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8039e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039ea:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8039f1:	48 85 c0             	test   rax,rax
  8039f4:	74 1d                	je     803a13 <dispose_device+0x8c>
  8039f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039fa:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803a01:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803a05:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803a0c:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803a13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a17:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803a1e:	b8 00 00 00 00       	mov    eax,0x0
}
  803a23:	5d                   	pop    rbp
  803a24:	c3                   	ret    

0000000000803a25 <dispose_driver>:
int dispose_driver(driver *drv){
  803a25:	f3 0f 1e fa          	endbr64 
  803a29:	55                   	push   rbp
  803a2a:	48 89 e5             	mov    rbp,rsp
  803a2d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803a31:	90                   	nop
  803a32:	5d                   	pop    rbp
  803a33:	c3                   	ret    

0000000000803a34 <get_dev>:

device *get_dev(int devi)
{
  803a34:	f3 0f 1e fa          	endbr64 
  803a38:	55                   	push   rbp
  803a39:	48 89 e5             	mov    rbp,rsp
  803a3c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803a3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a42:	48 63 d0             	movsxd rdx,eax
  803a45:	48 89 d0             	mov    rax,rdx
  803a48:	48 c1 e0 02          	shl    rax,0x2
  803a4c:	48 01 d0             	add    rax,rdx
  803a4f:	48 c1 e0 02          	shl    rax,0x2
  803a53:	48 01 d0             	add    rax,rdx
  803a56:	48 c1 e0 03          	shl    rax,0x3
  803a5a:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803a60:	5d                   	pop    rbp
  803a61:	c3                   	ret    

0000000000803a62 <get_drv>:
driver *get_drv(int drvi)
{
  803a62:	f3 0f 1e fa          	endbr64 
  803a66:	55                   	push   rbp
  803a67:	48 89 e5             	mov    rbp,rsp
  803a6a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803a6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a70:	48 63 d0             	movsxd rdx,eax
  803a73:	48 89 d0             	mov    rax,rdx
  803a76:	48 c1 e0 02          	shl    rax,0x2
  803a7a:	48 01 d0             	add    rax,rdx
  803a7d:	48 c1 e0 05          	shl    rax,0x5
  803a81:	48 05 80 58 40 00    	add    rax,0x405880
}
  803a87:	5d                   	pop    rbp
  803a88:	c3                   	ret    

0000000000803a89 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803a89:	f3 0f 1e fa          	endbr64 
  803a8d:	55                   	push   rbp
  803a8e:	48 89 e5             	mov    rbp,rsp
  803a91:	53                   	push   rbx
  803a92:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803a96:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803a9d:	eb 23                	jmp    803ac2 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803a9f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803aa2:	48 63 d0             	movsxd rdx,eax
  803aa5:	48 89 d0             	mov    rax,rdx
  803aa8:	48 01 c0             	add    rax,rax
  803aab:	48 01 d0             	add    rax,rdx
  803aae:	48 c1 e0 06          	shl    rax,0x6
  803ab2:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803ab8:	8b 00                	mov    eax,DWORD PTR [rax]
  803aba:	85 c0                	test   eax,eax
  803abc:	74 0c                	je     803aca <make_request+0x41>
    for(;i<NR_REQS;i++)
  803abe:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803ac2:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803ac6:	7e d7                	jle    803a9f <make_request+0x16>
  803ac8:	eb 01                	jmp    803acb <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803aca:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803acb:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803acf:	75 0a                	jne    803adb <make_request+0x52>
  803ad1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803ad6:	e9 e7 01 00 00       	jmp    803cc2 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803adb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803ade:	48 63 d0             	movsxd rdx,eax
  803ae1:	48 89 d0             	mov    rax,rdx
  803ae4:	48 01 c0             	add    rax,rax
  803ae7:	48 01 d0             	add    rax,rdx
  803aea:	48 c1 e0 06          	shl    rax,0x6
  803aee:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803af5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803af9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803afc:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803b00:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803b03:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803b07:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803b0b:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803b0f:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803b13:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803b17:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803b1b:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803b1f:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803b23:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803b27:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803b2b:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803b2f:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803b33:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803b37:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803b3b:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803b3f:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803b43:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803b47:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803b4b:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803b4f:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803b53:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803b57:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803b5b:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803b5f:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803b63:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803b67:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803b6b:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803b6f:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803b73:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803b77:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803b7e:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803b85:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803b8c:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803b93:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803b9a:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803ba1:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803ba8:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803baf:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803bb6:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803bbd:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803bc4:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803bcb:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803bd2:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803bd9:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803be0:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803be7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803beb:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803bf1:	48 63 d0             	movsxd rdx,eax
  803bf4:	48 89 d0             	mov    rax,rdx
  803bf7:	48 c1 e0 02          	shl    rax,0x2
  803bfb:	48 01 d0             	add    rax,rdx
  803bfe:	48 c1 e0 02          	shl    rax,0x2
  803c02:	48 01 d0             	add    rax,rdx
  803c05:	48 c1 e0 03          	shl    rax,0x3
  803c09:	48 05 80 2e 40 00    	add    rax,0x402e80
  803c0f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803c13:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c17:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803c1e:	48 85 c0             	test   rax,rax
  803c21:	75 27                	jne    803c4a <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803c23:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803c26:	48 63 d0             	movsxd rdx,eax
  803c29:	48 89 d0             	mov    rax,rdx
  803c2c:	48 01 c0             	add    rax,rax
  803c2f:	48 01 d0             	add    rax,rdx
  803c32:	48 c1 e0 06          	shl    rax,0x6
  803c36:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803c3d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c41:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803c48:	eb 75                	jmp    803cbf <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803c4a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c4e:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803c55:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803c59:	eb 0f                	jmp    803c6a <make_request+0x1e1>
  803c5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803c5f:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803c66:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803c6a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803c6e:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803c75:	48 85 c0             	test   rax,rax
  803c78:	75 e1                	jne    803c5b <make_request+0x1d2>
        p->next=&reqs[i];
  803c7a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803c7d:	48 63 d0             	movsxd rdx,eax
  803c80:	48 89 d0             	mov    rax,rdx
  803c83:	48 01 c0             	add    rax,rax
  803c86:	48 01 d0             	add    rax,rdx
  803c89:	48 c1 e0 06          	shl    rax,0x6
  803c8d:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803c94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803c98:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803c9f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803ca2:	48 63 d0             	movsxd rdx,eax
  803ca5:	48 89 d0             	mov    rax,rdx
  803ca8:	48 01 c0             	add    rax,rax
  803cab:	48 01 d0             	add    rax,rdx
  803cae:	48 c1 e0 06          	shl    rax,0x6
  803cb2:	48 05 38 6d 40 00    	add    rax,0x406d38
  803cb8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803cbf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803cc2:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803cc6:	c9                   	leave  
  803cc7:	c3                   	ret    

0000000000803cc8 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803cc8:	f3 0f 1e fa          	endbr64 
  803ccc:	55                   	push   rbp
  803ccd:	48 89 e5             	mov    rbp,rsp
  803cd0:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803cd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803cdb:	e9 ab 00 00 00       	jmp    803d8b <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803ce0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ce3:	48 98                	cdqe   
  803ce5:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803cec:	00 
  803ced:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803cf1:	e9 86 00 00 00       	jmp    803d7c <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803cf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803cfa:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803d01:	48 85 c0             	test   rax,rax
  803d04:	75 67                	jne    803d6d <do_req+0xa5>
  803d06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d0a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d11:	48 85 c0             	test   rax,rax
  803d14:	74 57                	je     803d6d <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803d16:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d1a:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803d21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d25:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803d2c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d30:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d37:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803d3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d42:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803d49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d4d:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803d53:	48 98                	cdqe   
  803d55:	48 8b 14 c5 40 d8 80 	mov    rdx,QWORD PTR [rax*8+0x80d840]
  803d5c:	00 
  803d5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d61:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803d68:	48 89 c7             	mov    rdi,rax
  803d6b:	ff d2                	call   rdx
        for(;p;p=p->next)
  803d6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d71:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803d78:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803d7c:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803d81:	0f 85 6f ff ff ff    	jne    803cf6 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803d87:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803d8b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803d8f:	0f 8e 4b ff ff ff    	jle    803ce0 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803d95:	b8 00 00 00 00       	mov    eax,0x0
}
  803d9a:	c9                   	leave  
  803d9b:	c3                   	ret    

0000000000803d9c <wait_on_req>:


void wait_on_req(int reqi)
{
  803d9c:	f3 0f 1e fa          	endbr64 
  803da0:	55                   	push   rbp
  803da1:	48 89 e5             	mov    rbp,rsp
  803da4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803da7:	90                   	nop
  803da8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dab:	48 63 d0             	movsxd rdx,eax
  803dae:	48 89 d0             	mov    rax,rdx
  803db1:	48 01 c0             	add    rax,rax
  803db4:	48 01 d0             	add    rax,rdx
  803db7:	48 c1 e0 06          	shl    rax,0x6
  803dbb:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803dc1:	8b 00                	mov    eax,DWORD PTR [rax]
  803dc3:	83 f8 03             	cmp    eax,0x3
  803dc6:	75 e0                	jne    803da8 <wait_on_req+0xc>
}
  803dc8:	90                   	nop
  803dc9:	90                   	nop
  803dca:	5d                   	pop    rbp
  803dcb:	c3                   	ret    

0000000000803dcc <clear_req>:
void clear_req(int reqi)
{
  803dcc:	f3 0f 1e fa          	endbr64 
  803dd0:	55                   	push   rbp
  803dd1:	48 89 e5             	mov    rbp,rsp
  803dd4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803dd7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dda:	48 63 d0             	movsxd rdx,eax
  803ddd:	48 89 d0             	mov    rax,rdx
  803de0:	48 01 c0             	add    rax,rax
  803de3:	48 01 d0             	add    rax,rdx
  803de6:	48 c1 e0 06          	shl    rax,0x6
  803dea:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803df0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803df6:	90                   	nop
  803df7:	5d                   	pop    rbp
  803df8:	c3                   	ret    

0000000000803df9 <init_proc>:
TSS *tss=0xffff800000108000ul;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  803df9:	f3 0f 1e fa          	endbr64 
  803dfd:	55                   	push   rbp
  803dfe:	48 89 e5             	mov    rbp,rsp
  803e01:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803e05:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803e0c:	eb 4c                	jmp    803e5a <init_proc+0x61>
        task[i].pid=-1;
  803e0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e11:	48 98                	cdqe   
  803e13:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803e1a:	48 05 40 85 40 00    	add    rax,0x408540
  803e20:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=TASK_EMPTY;
  803e26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e29:	48 98                	cdqe   
  803e2b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803e32:	48 05 58 85 40 00    	add    rax,0x408558
  803e38:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        task[i].parent_pid=-1;
  803e3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e41:	48 98                	cdqe   
  803e43:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803e4a:	48 05 dc 85 40 00    	add    rax,0x4085dc
  803e50:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803e56:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803e5a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803e5e:	7e ae                	jle    803e0e <init_proc+0x15>
    }
    cur_proc=0;//proc zero
  803e60:	c7 05 62 14 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11462],0x0        # 4152cc <cur_proc>
  803e67:	00 00 00 
    current=task;
  803e6a:	48 c7 05 cb 13 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc113cb],0x408540        # 415240 <current>
  803e71:	40 85 40 00 
    pidd=1;
  803e75:	c7 05 51 14 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11451],0x1        # 4152d0 <pidd>
  803e7c:	00 00 00 
     //===============创建0号进程======================
    int zi=create_proc();
  803e7f:	b8 00 00 00 00       	mov    eax,0x0
  803e84:	e8 d2 02 00 00       	call   80415b <create_proc>
  803e89:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=TASK_READY;
  803e8c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803e8f:	48 98                	cdqe   
  803e91:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803e98:	48 05 58 85 40 00    	add    rax,0x408558
  803e9e:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2


    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803ea4:	68 00 00 80 00       	push   0x800000
  803ea9:	68 00 00 80 00       	push   0x800000
  803eae:	68 00 00 80 00       	push   0x800000
  803eb3:	68 00 00 80 00       	push   0x800000
  803eb8:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803ebe:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803ec4:	b9 00 00 80 00       	mov    ecx,0x800000
  803ec9:	ba 00 00 40 00       	mov    edx,0x400000
  803ece:	be 00 00 40 00       	mov    esi,0x400000
  803ed3:	bf 00 00 40 00       	mov    edi,0x400000
  803ed8:	e8 57 13 00 00       	call   805234 <set_tss>
  803edd:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  803ee1:	48 8b 05 d8 99 00 00 	mov    rax,QWORD PTR [rip+0x99d8]        # 80d8c0 <tss>
  803ee8:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  803eec:	48 89 c6             	mov    rsi,rax
  803eef:	bf a8 06 00 00       	mov    edi,0x6a8
  803ef4:	e8 50 c9 ff ff       	call   800849 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803ef9:	be 08 00 00 00       	mov    esi,0x8
  803efe:	bf 74 01 00 00       	mov    edi,0x174
  803f03:	e8 41 c9 ff ff       	call   800849 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803f08:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803f0f:	00 20 00 
  803f12:	48 89 c6             	mov    rsi,rax
  803f15:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803f1a:	48 89 c7             	mov    rdi,rax
  803f1d:	e8 27 c9 ff ff       	call   800849 <wrmsr>

    comprintf("proc init set.\r\ntss.ist=0x%x\r\n",tss->ists[0]);
  803f22:	48 8b 05 97 99 00 00 	mov    rax,QWORD PTR [rip+0x9997]        # 80d8c0 <tss>
  803f29:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  803f2d:	48 89 c6             	mov    rsi,rax
  803f30:	bf a0 55 81 00       	mov    edi,0x8155a0
  803f35:	b8 00 00 00 00       	mov    eax,0x0
  803f3a:	e8 88 8e 00 00       	call   80cdc7 <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  803f3f:	90                   	nop
  803f40:	c9                   	leave  
  803f41:	c3                   	ret    

0000000000803f42 <create_test_proc>:
void create_test_proc(){
  803f42:	f3 0f 1e fa          	endbr64 
  803f46:	55                   	push   rbp
  803f47:	48 89 e5             	mov    rbp,rsp
  803f4a:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803f4e:	b8 00 00 00 00       	mov    eax,0x0
  803f53:	e8 da 02 00 00       	call   804232 <req_proc>
  803f58:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=TASK_READY;
  803f5b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f5e:	48 98                	cdqe   
  803f60:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f67:	48 05 58 85 40 00    	add    rax,0x408558
  803f6d:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    int currsp=0x9fc00-1;
  803f73:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803f7a:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803f7e:	ba c2 d7 80 00       	mov    edx,0x80d7c2
  803f83:	48 83 ec 08          	sub    rsp,0x8
  803f87:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f8a:	50                   	push   rax
  803f8b:	6a 00                	push   0x0
  803f8d:	52                   	push   rdx
  803f8e:	6a 00                	push   0x0
  803f90:	6a 00                	push   0x0
  803f92:	6a 00                	push   0x0
  803f94:	68 58 7d 00 00       	push   0x7d58
  803f99:	6a 10                	push   0x10
  803f9b:	6a 10                	push   0x10
  803f9d:	6a 10                	push   0x10
  803f9f:	6a 10                	push   0x10
  803fa1:	41 b9 08 00 00 00    	mov    r9d,0x8
  803fa7:	41 b8 10 00 00 00    	mov    r8d,0x10
  803fad:	b9 00 00 00 00       	mov    ecx,0x0
  803fb2:	ba 00 00 00 00       	mov    edx,0x0
  803fb7:	be 00 00 00 00       	mov    esi,0x0
  803fbc:	bf 00 00 00 00       	mov    edi,0x0
  803fc1:	e8 37 03 00 00       	call   8042fd <set_proc>
  803fc6:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803fca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fcd:	48 98                	cdqe   
  803fcf:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803fd6:	48 05 10 87 40 00    	add    rax,0x408710
  803fdc:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  803fe3:	00 
    task[index].mem_struct.stack_top=0x7e00;
  803fe4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fe7:	48 98                	cdqe   
  803fe9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803ff0:	48 05 74 85 40 00    	add    rax,0x408574
  803ff6:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  803ffc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fff:	48 98                	cdqe   
  804001:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804008:	48 05 70 85 40 00    	add    rax,0x408570
  80400e:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  804014:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804017:	48 98                	cdqe   
  804019:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804020:	48 05 6c 85 40 00    	add    rax,0x40856c
  804026:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  80402c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80402f:	48 98                	cdqe   
  804031:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804038:	48 05 68 85 40 00    	add    rax,0x408568
  80403e:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  804044:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  80404b:	00 
    str->rax=0;
  80404c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804050:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804057:	00 
    str->rbx=0;
  804058:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80405c:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  804063:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  804064:	ba 73 44 80 00       	mov    edx,0x804473
  804069:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80406d:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  804071:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804075:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  80407c:	00 
    str->rsi=0;
  80407d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804081:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  804088:	00 
    str->rdi=0;
  804089:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80408d:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  804094:	00 
    str->r15=0;
  804095:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804099:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8040a0:	00 
    str->r14=0;
  8040a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040a5:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8040ac:	00 
    str->r13=0;
  8040ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040b1:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8040b8:	00 
    str->r12=0;
  8040b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040bd:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  8040c4:	00 
    str->r11=0x200;
  8040c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040c9:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  8040d0:	00 
    str->r10=0;
  8040d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040d5:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  8040dc:	00 
    str->r9=0;
  8040dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040e1:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  8040e8:	00 
    str->r8=0;
  8040e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040ed:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  8040f4:	00 
    str->rip=proc_zero;
  8040f5:	ba 73 44 80 00       	mov    edx,0x804473
  8040fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040fe:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  804105:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804109:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  804110:	08 00 00 00 
    str->rflags=0x00200206;
  804114:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804118:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  80411f:	06 02 20 00 
    str->rsp=0x7e00;
  804123:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804127:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  80412e:	00 7e 00 00 
    str->ss=0x2b;
  804132:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804136:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  80413d:	2b 00 00 00 
    str->ds=0x2b;
  804141:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804145:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  80414c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804150:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  804157:	00 

}
  804158:	90                   	nop
  804159:	c9                   	leave  
  80415a:	c3                   	ret    

000000000080415b <create_proc>:
int create_proc()
{
  80415b:	f3 0f 1e fa          	endbr64 
  80415f:	55                   	push   rbp
  804160:	48 89 e5             	mov    rbp,rsp
  804163:	48 83 ec 20          	sub    rsp,0x20
    int index=req_proc();
  804167:	b8 00 00 00 00       	mov    eax,0x0
  80416c:	e8 c1 00 00 00       	call   804232 <req_proc>
  804171:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    struct process *pz=&task[index];
  804174:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804177:	48 98                	cdqe   
  804179:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804180:	48 05 40 85 40 00    	add    rax,0x408540
  804186:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(index==-1)return -1;
  80418a:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80418e:	75 0a                	jne    80419a <create_proc+0x3f>
  804190:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804195:	e9 96 00 00 00       	jmp    804230 <create_proc+0xd5>
    int currsp=0x9fc00-1;
  80419a:	c7 45 e4 ff fb 09 00 	mov    DWORD PTR [rbp-0x1c],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8041a1:	48 89 65 e4          	mov    QWORD PTR [rbp-0x1c],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8041a5:	b9 73 44 80 00       	mov    ecx,0x804473
  8041aa:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8041ad:	48 98                	cdqe   
  8041af:	48 83 ec 08          	sub    rsp,0x8
  8041b3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8041b6:	52                   	push   rdx
  8041b7:	6a 00                	push   0x0
  8041b9:	51                   	push   rcx
  8041ba:	6a 00                	push   0x0
  8041bc:	6a 00                	push   0x0
  8041be:	6a 00                	push   0x0
  8041c0:	50                   	push   rax
  8041c1:	6a 10                	push   0x10
  8041c3:	6a 10                	push   0x10
  8041c5:	6a 10                	push   0x10
  8041c7:	6a 10                	push   0x10
  8041c9:	41 b9 08 00 00 00    	mov    r9d,0x8
  8041cf:	41 b8 10 00 00 00    	mov    r8d,0x10
  8041d5:	b9 00 00 00 00       	mov    ecx,0x0
  8041da:	ba 00 00 00 00       	mov    edx,0x0
  8041df:	be 00 00 00 00       	mov    esi,0x0
  8041e4:	bf 00 00 00 00       	mov    edi,0x0
  8041e9:	e8 0f 01 00 00       	call   8042fd <set_proc>
  8041ee:	48 83 c4 60          	add    rsp,0x60
//    task[index].tss.eip=(long)proc_zero;
    extern struct dir_entry* dtty;
    //stdin stdout stderr
    //这里绕开了sys open，这样是为了尽量快
    extern struct file ftty;
    addr_t filplate=vmalloc();
  8041f2:	b8 00 00 00 00       	mov    eax,0x0
  8041f7:	e8 16 cf ff ff       	call   801112 <vmalloc>
  8041fc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pz->openf[0]=&ftty;
  804200:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804204:	48 c7 80 d8 00 00 00 	mov    QWORD PTR [rax+0xd8],0x408500
  80420b:	00 85 40 00 
    pz->openf[1]=&ftty;
  80420f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804213:	48 c7 80 e0 00 00 00 	mov    QWORD PTR [rax+0xe0],0x408500
  80421a:	00 85 40 00 
    pz->openf[2]=&ftty;
  80421e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804222:	48 c7 80 e8 00 00 00 	mov    QWORD PTR [rax+0xe8],0x408500
  804229:	00 85 40 00 

    return index;
  80422d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804230:	c9                   	leave  
  804231:	c3                   	ret    

0000000000804232 <req_proc>:
int req_proc(){
  804232:	f3 0f 1e fa          	endbr64 
  804236:	55                   	push   rbp
  804237:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80423a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  804241:	eb 04                	jmp    804247 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  804243:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  804247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80424a:	48 98                	cdqe   
  80424c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804253:	48 05 40 85 40 00    	add    rax,0x408540
  804259:	8b 00                	mov    eax,DWORD PTR [rax]
  80425b:	83 f8 ff             	cmp    eax,0xffffffff
  80425e:	74 1e                	je     80427e <req_proc+0x4c>
  804260:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804263:	48 98                	cdqe   
  804265:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80426c:	48 05 58 85 40 00    	add    rax,0x408558
  804272:	8b 00                	mov    eax,DWORD PTR [rax]
  804274:	85 c0                	test   eax,eax
  804276:	74 06                	je     80427e <req_proc+0x4c>
  804278:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80427c:	7e c5                	jle    804243 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  80427e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804282:	7e 07                	jle    80428b <req_proc+0x59>
        return -1;
  804284:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804289:	eb 70                	jmp    8042fb <req_proc+0xc9>
    task[num].pid=pidd++;
  80428b:	8b 05 3f 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1103f]        # 4152d0 <pidd>
  804291:	8d 50 01             	lea    edx,[rax+0x1]
  804294:	89 15 36 10 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11036],edx        # 4152d0 <pidd>
  80429a:	89 c2                	mov    edx,eax
  80429c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80429f:	48 98                	cdqe   
  8042a1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8042a8:	48 05 40 85 40 00    	add    rax,0x408540
  8042ae:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=TASK_ZOMBIE;
  8042b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042b3:	48 98                	cdqe   
  8042b5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8042bc:	48 05 58 85 40 00    	add    rax,0x408558
  8042c2:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
    task[num].utime=0;
  8042c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042cb:	48 98                	cdqe   
  8042cd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8042d4:	48 05 5c 85 40 00    	add    rax,0x40855c
  8042da:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8042e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042e3:	48 98                	cdqe   
  8042e5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8042ec:	48 05 60 85 40 00    	add    rax,0x408560
  8042f2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  8042f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8042fb:	5d                   	pop    rbp
  8042fc:	c3                   	ret    

00000000008042fd <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  8042fd:	f3 0f 1e fa          	endbr64 
  804301:	55                   	push   rbp
  804302:	48 89 e5             	mov    rbp,rsp
  804305:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804309:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80430d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  804311:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  804315:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  804319:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  80431d:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  804320:	48 98                	cdqe   
  804322:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804329:	48 05 40 85 40 00    	add    rax,0x408540
  80432f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  804333:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804337:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80433b:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  804342:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804346:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80434a:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  804351:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804355:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804359:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  804360:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804364:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804368:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  80436f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804373:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804377:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  80437e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804382:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  804386:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  80438d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804391:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804395:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  80439c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043a0:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8043a4:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  8043ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043af:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8043b3:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  8043ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043be:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8043c2:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  8043c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043cd:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  8043d1:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  8043d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043dc:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  8043e0:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  8043e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043eb:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  8043ef:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  8043f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043fa:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  8043fe:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  804405:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804409:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  804410:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  804414:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804418:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  80441c:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  804423:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804427:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80442b:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  804432:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804436:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80443a:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  804441:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804445:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804449:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  804450:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804454:	48 b9 00 10 10 00 00 	movabs rcx,0xffff800000101000
  80445b:	80 ff ff 
  80445e:	48 89 88 44 02 00 00 	mov    QWORD PTR [rax+0x244],rcx
    proc->pml4=PML4_ADDR;
  804465:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804469:	48 89 88 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rcx


}
  804470:	90                   	nop
  804471:	5d                   	pop    rbp
  804472:	c3                   	ret    

0000000000804473 <proc_zero>:
void proc_zero()
{
  804473:	f3 0f 1e fa          	endbr64 
  804477:	55                   	push   rbp
  804478:	48 89 e5             	mov    rbp,rsp
  80447b:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  80447f:	b8 00 00 00 00       	mov    eax,0x0
  804484:	e8 29 4f 00 00       	call   8093b2 <sys_analyse_key>
  804489:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  80448c:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  804490:	89 c7                	mov    edi,eax
  804492:	e8 b6 c8 ff ff       	call   800d4d <putchar>
    {
  804497:	eb e6                	jmp    80447f <proc_zero+0xc>

0000000000804499 <save_rsp>:
    }
}
void save_rsp(){
  804499:	f3 0f 1e fa          	endbr64 
  80449d:	55                   	push   rbp
  80449e:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  8044a1:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  8044a8:	00 
    current->regs.rsp=*p;
  8044a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ad:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8044b0:	48 8b 05 89 0d c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10d89]        # 415240 <current>
  8044b7:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  8044be:	90                   	nop
  8044bf:	5d                   	pop    rbp
  8044c0:	c3                   	ret    

00000000008044c1 <manage_proc>:
void manage_proc(){
  8044c1:	f3 0f 1e fa          	endbr64 
  8044c5:	55                   	push   rbp
  8044c6:	48 89 e5             	mov    rbp,rsp
  8044c9:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  8044cd:	8b 05 f9 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10df9]        # 4152cc <cur_proc>
  8044d3:	83 f8 ff             	cmp    eax,0xffffffff
  8044d6:	74 2d                	je     804505 <manage_proc+0x44>
        task[cur_proc].utime++;
  8044d8:	8b 05 ee 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10dee]        # 4152cc <cur_proc>
  8044de:	48 63 d0             	movsxd rdx,eax
  8044e1:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  8044e8:	48 81 c2 5c 85 40 00 	add    rdx,0x40855c
  8044ef:	8b 12                	mov    edx,DWORD PTR [rdx]
  8044f1:	83 c2 01             	add    edx,0x1
  8044f4:	48 98                	cdqe   
  8044f6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8044fd:	48 05 5c 85 40 00    	add    rax,0x40855c
  804503:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804505:	8b 05 c1 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10dc1]        # 4152cc <cur_proc>
  80450b:	83 f8 ff             	cmp    eax,0xffffffff
  80450e:	74 3c                	je     80454c <manage_proc+0x8b>
  804510:	8b 05 b6 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10db6]        # 4152cc <cur_proc>
  804516:	48 98                	cdqe   
  804518:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80451f:	48 05 5c 85 40 00    	add    rax,0x40855c
  804525:	8b 00                	mov    eax,DWORD PTR [rax]
  804527:	83 f8 0a             	cmp    eax,0xa
  80452a:	77 20                	ja     80454c <manage_proc+0x8b>
    task[cur_proc].stat != TASK_READY){
  80452c:	8b 05 9a 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d9a]        # 4152cc <cur_proc>
  804532:	48 98                	cdqe   
  804534:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80453b:	48 05 58 85 40 00    	add    rax,0x408558
  804541:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804543:	83 f8 02             	cmp    eax,0x2
  804546:	0f 84 02 01 00 00    	je     80464e <manage_proc+0x18d>
        if(cur_proc!=-1)
  80454c:	8b 05 7a 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d7a]        # 4152cc <cur_proc>
  804552:	83 f8 ff             	cmp    eax,0xffffffff
  804555:	74 1b                	je     804572 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  804557:	8b 05 6f 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d6f]        # 4152cc <cur_proc>
  80455d:	48 98                	cdqe   
  80455f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804566:	48 05 5c 85 40 00    	add    rax,0x40855c
  80456c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  804572:	8b 05 54 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d54]        # 4152cc <cur_proc>
  804578:	83 c0 01             	add    eax,0x1
  80457b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  80457e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  804585:	eb 52                	jmp    8045d9 <manage_proc+0x118>
            if(task[i].pid!=-1 && task[i].stat == TASK_READY && i != cur_proc){
  804587:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80458a:	48 98                	cdqe   
  80458c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804593:	48 05 40 85 40 00    	add    rax,0x408540
  804599:	8b 00                	mov    eax,DWORD PTR [rax]
  80459b:	83 f8 ff             	cmp    eax,0xffffffff
  80459e:	74 24                	je     8045c4 <manage_proc+0x103>
  8045a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045a3:	48 98                	cdqe   
  8045a5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8045ac:	48 05 58 85 40 00    	add    rax,0x408558
  8045b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8045b4:	83 f8 02             	cmp    eax,0x2
  8045b7:	75 0b                	jne    8045c4 <manage_proc+0x103>
  8045b9:	8b 05 0d 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d0d]        # 4152cc <cur_proc>
  8045bf:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8045c2:	75 1d                	jne    8045e1 <manage_proc+0x120>
                break;
            }
            i++;
  8045c4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  8045c8:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8045cc:	7e 0b                	jle    8045d9 <manage_proc+0x118>
                times++;
  8045ce:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  8045d2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  8045d9:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  8045dd:	7e a8                	jle    804587 <manage_proc+0xc6>
  8045df:	eb 01                	jmp    8045e2 <manage_proc+0x121>
                break;
  8045e1:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  8045e2:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  8045e6:	74 69                	je     804651 <manage_proc+0x190>
        //switch
        task[cur_proc].stat=TASK_READY;
  8045e8:	8b 05 de 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10cde]        # 4152cc <cur_proc>
  8045ee:	48 98                	cdqe   
  8045f0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8045f7:	48 05 58 85 40 00    	add    rax,0x408558
  8045fd:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        task[i].stat=TASK_RUNNING;
  804603:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804606:	48 98                	cdqe   
  804608:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80460f:	48 05 58 85 40 00    	add    rax,0x408558
  804615:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_to(&task[cur_proc], &task[i]);
  80461b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80461e:	48 98                	cdqe   
  804620:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804627:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  80462e:	8b 05 98 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c98]        # 4152cc <cur_proc>
  804634:	48 98                	cdqe   
  804636:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80463d:	48 05 40 85 40 00    	add    rax,0x408540
  804643:	48 89 d6             	mov    rsi,rdx
  804646:	48 89 c7             	mov    rdi,rax
  804649:	e8 58 0a 00 00       	call   8050a6 <switch_to>
    }
    return;
  80464e:	90                   	nop
  80464f:	eb 01                	jmp    804652 <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  804651:	90                   	nop
}
  804652:	c9                   	leave  
  804653:	c3                   	ret    

0000000000804654 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804654:	f3 0f 1e fa          	endbr64 
  804658:	55                   	push   rbp
  804659:	48 89 e5             	mov    rbp,rsp
  80465c:	48 83 ec 20          	sub    rsp,0x20
  804660:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804663:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804666:	01 c0                	add    eax,eax
  804668:	83 c0 05             	add    eax,0x5
  80466b:	c1 e0 03             	shl    eax,0x3
  80466e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  804671:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804674:	89 05 52 0c c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10c52],eax        # 4152cc <cur_proc>
    switch_proc_asm(sel);
  80467a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80467d:	89 c7                	mov    edi,eax
  80467f:	e8 56 90 00 00       	call   80d6da <switch_proc_asm>
}
  804684:	90                   	nop
  804685:	c9                   	leave  
  804686:	c3                   	ret    

0000000000804687 <switch_proc>:
void switch_proc(int pnr){
  804687:	f3 0f 1e fa          	endbr64 
  80468b:	55                   	push   rbp
  80468c:	48 89 e5             	mov    rbp,rsp
  80468f:	48 81 ec 50 03 00 00 	sub    rsp,0x350
  804696:	89 bd bc fc ff ff    	mov    DWORD PTR [rbp-0x344],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80469c:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  8046a2:	48 98                	cdqe   
  8046a4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046ab:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  8046b2:	48 8d 85 c0 fc ff ff 	lea    rax,[rbp-0x340]
  8046b9:	b9 66 00 00 00       	mov    ecx,0x66
  8046be:	48 89 c7             	mov    rdi,rax
  8046c1:	48 89 d6             	mov    rsi,rdx
  8046c4:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  8046c7:	48 89 f2             	mov    rdx,rsi
  8046ca:	48 89 f8             	mov    rax,rdi
  8046cd:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  8046cf:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  8046d1:	8b 05 f5 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bf5]        # 4152cc <cur_proc>
  8046d7:	48 98                	cdqe   
  8046d9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046e0:	48 05 d0 01 00 00    	add    rax,0x1d0
  8046e6:	48 05 40 85 40 00    	add    rax,0x408540
  8046ec:	48 83 c0 08          	add    rax,0x8
  8046f0:	48 89 c7             	mov    rdi,rax
  8046f3:	e8 4c 00 00 00       	call   804744 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  8046f8:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  8046fe:	89 05 c8 0b c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10bc8],eax        # 4152cc <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804704:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  80470a:	01 c0                	add    eax,eax
  80470c:	83 c0 05             	add    eax,0x5
  80470f:	c1 e0 03             	shl    eax,0x3
  804712:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804715:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  80471b:	48 98                	cdqe   
  80471d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804724:	48 05 d0 01 00 00    	add    rax,0x1d0
  80472a:	48 05 40 85 40 00    	add    rax,0x408540
  804730:	48 83 c0 08          	add    rax,0x8
  804734:	48 89 c6             	mov    rsi,rax
  804737:	bf 00 00 00 00       	mov    edi,0x0
  80473c:	e8 65 09 00 00       	call   8050a6 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  804741:	90                   	nop
  804742:	c9                   	leave  
  804743:	c3                   	ret    

0000000000804744 <save_context>:
void save_context(TSS *tss)
{
  804744:	f3 0f 1e fa          	endbr64 
  804748:	55                   	push   rbp
  804749:	48 89 e5             	mov    rbp,rsp
  80474c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  804750:	90                   	nop
  804751:	5d                   	pop    rbp
  804752:	c3                   	ret    

0000000000804753 <palloc>:
    task[index].stat=TASK_READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804753:	f3 0f 1e fa          	endbr64 
  804757:	55                   	push   rbp
  804758:	48 89 e5             	mov    rbp,rsp
  80475b:	48 83 ec 60          	sub    rsp,0x60
  80475f:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804762:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804765:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804768:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80476e:	85 c0                	test   eax,eax
  804770:	0f 48 c2             	cmovs  eax,edx
  804773:	c1 f8 0c             	sar    eax,0xc
  804776:	89 c1                	mov    ecx,eax
  804778:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80477b:	99                   	cdq    
  80477c:	c1 ea 14             	shr    edx,0x14
  80477f:	01 d0                	add    eax,edx
  804781:	25 ff 0f 00 00       	and    eax,0xfff
  804786:	29 d0                	sub    eax,edx
  804788:	01 c8                	add    eax,ecx
  80478a:	85 c0                	test   eax,eax
  80478c:	0f 95 c0             	setne  al
  80478f:	0f b6 c0             	movzx  eax,al
  804792:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804795:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  80479c:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8047a3:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  8047a4:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8047ab:	00 
    pgind++;
  8047ac:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8047b1:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  8047b8:	e9 30 02 00 00       	jmp    8049ed <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  8047bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8047c4:	25 00 f0 ff ff       	and    eax,0xfffff000
  8047c9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  8047cd:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8047d4:	e9 fe 01 00 00       	jmp    8049d7 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  8047d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8047dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8047e0:	83 e0 01             	and    eax,0x1
  8047e3:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  8047e6:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8047ea:	0f 85 de 01 00 00    	jne    8049ce <palloc+0x27b>
            {
                int new_pg=req_a_page();
  8047f0:	b8 00 00 00 00       	mov    eax,0x0
  8047f5:	e8 f7 cc ff ff       	call   8014f1 <req_a_page>
  8047fa:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  8047fd:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  804801:	0f 85 b9 00 00 00    	jne    8048c0 <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804807:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80480a:	48 98                	cdqe   
  80480c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804813:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804819:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80481c:	0f b7 c0             	movzx  eax,ax
  80481f:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804822:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804825:	48 98                	cdqe   
  804827:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80482e:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804834:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804838:	0f b7 c0             	movzx  eax,ax
  80483b:	c1 e0 10             	shl    eax,0x10
  80483e:	25 00 00 0f 00       	and    eax,0xf0000
  804843:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804846:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804849:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80484c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80484f:	89 c2                	mov    edx,eax
  804851:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804854:	48 98                	cdqe   
  804856:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80485d:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804863:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804866:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804869:	48 98                	cdqe   
  80486b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804872:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804878:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  80487c:	0f b7 c0             	movzx  eax,ax
  80487f:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  804882:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804889:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80488c:	c1 e8 10             	shr    eax,0x10
  80488f:	83 e0 0f             	and    eax,0xf
  804892:	89 c2                	mov    edx,eax
  804894:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804897:	01 d0                	add    eax,edx
  804899:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80489c:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80489f:	89 c2                	mov    edx,eax
  8048a1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8048a4:	48 98                	cdqe   
  8048a6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8048ad:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8048b3:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8048b7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048bb:	e9 3f 01 00 00       	jmp    8049ff <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  8048c0:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8048c3:	89 c7                	mov    edi,eax
  8048c5:	e8 16 ce ff ff       	call   8016e0 <get_phyaddr>
  8048ca:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8048cd:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  8048d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8048d4:	ba 07 00 00 00       	mov    edx,0x7
  8048d9:	89 ce                	mov    esi,ecx
  8048db:	48 89 c7             	mov    rdi,rax
  8048de:	e8 10 ce ff ff       	call   8016f3 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8048e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048e6:	c1 e0 0a             	shl    eax,0xa
  8048e9:	89 c2                	mov    edx,eax
  8048eb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8048ee:	01 d0                	add    eax,edx
  8048f0:	c1 e0 0c             	shl    eax,0xc
  8048f3:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8048f6:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8048fb:	75 09                	jne    804906 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8048fd:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804900:	89 05 ce 09 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc109ce],eax        # 4152d4 <palloc_paddr>
                }
                page_c--;
  804906:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80490a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80490e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804912:	0f 85 b6 00 00 00    	jne    8049ce <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804918:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80491b:	48 98                	cdqe   
  80491d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804924:	48 05 a8 85 40 00    	add    rax,0x4085a8
  80492a:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80492d:	0f b7 c0             	movzx  eax,ax
  804930:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804933:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804936:	48 98                	cdqe   
  804938:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80493f:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804945:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804949:	0f b7 c0             	movzx  eax,ax
  80494c:	c1 e0 10             	shl    eax,0x10
  80494f:	25 00 00 0f 00       	and    eax,0xf0000
  804954:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804957:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80495a:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80495d:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804960:	89 c2                	mov    edx,eax
  804962:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804965:	48 98                	cdqe   
  804967:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80496e:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804974:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804977:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80497a:	48 98                	cdqe   
  80497c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804983:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804989:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  80498d:	0f b7 c0             	movzx  eax,ax
  804990:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804993:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80499a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80499d:	c1 e8 10             	shr    eax,0x10
  8049a0:	83 e0 0f             	and    eax,0xf
  8049a3:	89 c2                	mov    edx,eax
  8049a5:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8049a8:	01 d0                	add    eax,edx
  8049aa:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8049ad:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8049b0:	89 c2                	mov    edx,eax
  8049b2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049b5:	48 98                	cdqe   
  8049b7:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8049be:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8049c4:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  8049c8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049cc:	eb 31                	jmp    8049ff <palloc+0x2ac>
                }
            }
            tblp++;
  8049ce:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8049d3:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8049d7:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8049de:	0f 8e f5 fd ff ff    	jle    8047d9 <palloc+0x86>
        }
        pgind++;
  8049e4:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8049e9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8049ed:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8049f4:	0f 8e c3 fd ff ff    	jle    8047bd <palloc+0x6a>
    }
    return NULL;
  8049fa:	b8 00 00 00 00       	mov    eax,0x0
}
  8049ff:	c9                   	leave  
  804a00:	c3                   	ret    

0000000000804a01 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804a01:	f3 0f 1e fa          	endbr64 
  804a05:	55                   	push   rbp
  804a06:	48 89 e5             	mov    rbp,rsp
  804a09:	48 83 ec 10          	sub    rsp,0x10
  804a0d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804a10:	8b 05 b6 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108b6]        # 4152cc <cur_proc>
  804a16:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804a19:	89 d6                	mov    esi,edx
  804a1b:	89 c7                	mov    edi,eax
  804a1d:	e8 31 fd ff ff       	call   804753 <palloc>
}
  804a22:	c9                   	leave  
  804a23:	c3                   	ret    

0000000000804a24 <proc_end>:
void proc_end()
{
  804a24:	f3 0f 1e fa          	endbr64 
  804a28:	55                   	push   rbp
  804a29:	48 89 e5             	mov    rbp,rsp
  804a2c:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804a30:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804a33:	8b 05 93 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10893]        # 4152cc <cur_proc>
  804a39:	89 c7                	mov    edi,eax
  804a3b:	e8 75 00 00 00       	call   804ab5 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804a40:	8b 05 86 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10886]        # 4152cc <cur_proc>
  804a46:	48 98                	cdqe   
  804a48:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a4f:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804a55:	8b 00                	mov    eax,DWORD PTR [rax]
  804a57:	83 f8 ff             	cmp    eax,0xffffffff
  804a5a:	74 4c                	je     804aa8 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=TASK_READY;
  804a5c:	8b 05 6a 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1086a]        # 4152cc <cur_proc>
  804a62:	48 98                	cdqe   
  804a64:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a6b:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804a71:	8b 00                	mov    eax,DWORD PTR [rax]
  804a73:	89 c0                	mov    eax,eax
  804a75:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a7c:	48 05 58 85 40 00    	add    rax,0x408558
  804a82:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        switch_proc_tss(task[cur_proc].parent_pid);
  804a88:	8b 05 3e 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1083e]        # 4152cc <cur_proc>
  804a8e:	48 98                	cdqe   
  804a90:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a97:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804a9d:	8b 00                	mov    eax,DWORD PTR [rax]
  804a9f:	89 c7                	mov    edi,eax
  804aa1:	e8 ae fb ff ff       	call   804654 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804aa6:	eb 0a                	jmp    804ab2 <proc_end+0x8e>
        switch_proc_tss(0);
  804aa8:	bf 00 00 00 00       	mov    edi,0x0
  804aad:	e8 a2 fb ff ff       	call   804654 <switch_proc_tss>
}
  804ab2:	90                   	nop
  804ab3:	c9                   	leave  
  804ab4:	c3                   	ret    

0000000000804ab5 <del_proc>:
void del_proc(int pnr)
{
  804ab5:	f3 0f 1e fa          	endbr64 
  804ab9:	55                   	push   rbp
  804aba:	48 89 e5             	mov    rbp,rsp
  804abd:	48 83 ec 20          	sub    rsp,0x20
  804ac1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    task[pnr].stat=TASK_ZOMBIE;
  804ac4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ac7:	48 98                	cdqe   
  804ac9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804ad0:	48 05 58 85 40 00    	add    rax,0x408558
  804ad6:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
//    task[pnr].pid=-1;
    //释放申请的页面
    release_mmap(&task[pnr]);
  804adc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804adf:	48 98                	cdqe   
  804ae1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804ae8:	48 05 40 85 40 00    	add    rax,0x408540
  804aee:	48 89 c7             	mov    rdi,rax
  804af1:	e8 a7 11 00 00       	call   805c9d <release_mmap>
    //释放存放页目录的页面
    vmfree(task[pnr].pml4);
  804af6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804af9:	48 98                	cdqe   
  804afb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b02:	48 05 00 86 40 00    	add    rax,0x408600
  804b08:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804b0b:	48 89 c7             	mov    rdi,rax
  804b0e:	e8 9f c6 ff ff       	call   8011b2 <vmfree>
    //关闭打开的文件
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804b13:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  804b1a:	eb 38                	jmp    804b54 <del_proc+0x9f>
        if(task[pnr].openf[i]){
  804b1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b1f:	48 98                	cdqe   
  804b21:	48 8d 50 1a          	lea    rdx,[rax+0x1a]
  804b25:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b28:	48 98                	cdqe   
  804b2a:	48 c1 e2 03          	shl    rdx,0x3
  804b2e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b35:	48 01 d0             	add    rax,rdx
  804b38:	48 05 48 85 40 00    	add    rax,0x408548
  804b3e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804b41:	48 85 c0             	test   rax,rax
  804b44:	74 0a                	je     804b50 <del_proc+0x9b>
            sys_close(i);
  804b46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b49:	89 c7                	mov    edi,eax
  804b4b:	e8 34 3e 00 00       	call   808984 <sys_close>
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804b50:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804b54:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804b58:	7e c2                	jle    804b1c <del_proc+0x67>
        }
    }
    //三个std判断一下是否是会话leader，是的话再关闭
    if(task[pnr].sid==task[pnr].pid){
  804b5a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b5d:	48 98                	cdqe   
  804b5f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b66:	48 05 48 85 40 00    	add    rax,0x408548
  804b6c:	8b 10                	mov    edx,DWORD PTR [rax]
  804b6e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b71:	48 98                	cdqe   
  804b73:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b7a:	48 05 40 85 40 00    	add    rax,0x408540
  804b80:	8b 00                	mov    eax,DWORD PTR [rax]
  804b82:	39 c2                	cmp    edx,eax
  804b84:	75 45                	jne    804bcb <del_proc+0x116>
        //tty和console断联
        sys_ioctl(0,TTY_DISCONNECT,0);
  804b86:	ba 00 00 00 00       	mov    edx,0x0
  804b8b:	be 02 00 00 00       	mov    esi,0x2
  804b90:	bf 00 00 00 00       	mov    edi,0x0
  804b95:	e8 d3 1a 00 00       	call   80666d <sys_ioctl>
        sys_close(0);
  804b9a:	bf 00 00 00 00       	mov    edi,0x0
  804b9f:	e8 e0 3d 00 00       	call   808984 <sys_close>
        sys_close(1);
  804ba4:	bf 01 00 00 00       	mov    edi,0x1
  804ba9:	e8 d6 3d 00 00       	call   808984 <sys_close>
        sys_close(2);
  804bae:	bf 02 00 00 00       	mov    edi,0x2
  804bb3:	e8 cc 3d 00 00       	call   808984 <sys_close>
        //然后,关闭所有前台进程组的进程
        for(int i=0;i<MAX_TASKS;i++){
  804bb8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804bbf:	eb 04                	jmp    804bc5 <del_proc+0x110>
  804bc1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804bc5:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  804bc9:	7e f6                	jle    804bc1 <del_proc+0x10c>
    }
    //TODO 给子进程发送SIGHUP信号结束他们
    //
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804bcb:	90                   	nop
  804bcc:	c9                   	leave  
  804bcd:	c3                   	ret    

0000000000804bce <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804bce:	f3 0f 1e fa          	endbr64 
  804bd2:	55                   	push   rbp
  804bd3:	48 89 e5             	mov    rbp,rsp
  804bd6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804bd9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804bdc:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804be0:	75 07                	jne    804be9 <set_proc_stat+0x1b>
  804be2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804be7:	eb 79                	jmp    804c62 <set_proc_stat+0x94>
    int i=0;
  804be9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804bf0:	eb 04                	jmp    804bf6 <set_proc_stat+0x28>
  804bf2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804bf6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bf9:	48 98                	cdqe   
  804bfb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c02:	48 05 40 85 40 00    	add    rax,0x408540
  804c08:	8b 10                	mov    edx,DWORD PTR [rax]
  804c0a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c0d:	39 c2                	cmp    edx,eax
  804c0f:	75 e1                	jne    804bf2 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804c11:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804c15:	75 07                	jne    804c1e <set_proc_stat+0x50>
  804c17:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c1c:	eb 44                	jmp    804c62 <set_proc_stat+0x94>
    task[i].stat=stat;
  804c1e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804c21:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c24:	48 63 d2             	movsxd rdx,edx
  804c27:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  804c2e:	48 81 c2 58 85 40 00 	add    rdx,0x408558
  804c35:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804c37:	8b 05 8f 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1068f]        # 4152cc <cur_proc>
  804c3d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804c40:	75 1b                	jne    804c5d <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804c42:	8b 05 84 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10684]        # 4152cc <cur_proc>
  804c48:	48 98                	cdqe   
  804c4a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c51:	48 05 5c 85 40 00    	add    rax,0x40855c
  804c57:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  804c5d:	b8 00 00 00 00       	mov    eax,0x0
}
  804c62:	5d                   	pop    rbp
  804c63:	c3                   	ret    

0000000000804c64 <sys_exit>:
//}
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804c64:	f3 0f 1e fa          	endbr64 
  804c68:	55                   	push   rbp
  804c69:	48 89 e5             	mov    rbp,rsp
  804c6c:	48 83 ec 10          	sub    rsp,0x10
  804c70:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    current->exit_code=code;
  804c73:	48 8b 05 c6 05 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc105c6]        # 415240 <current>
  804c7a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c7d:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
    del_proc(cur_proc);
  804c80:	8b 05 46 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10646]        # 4152cc <cur_proc>
  804c86:	89 c7                	mov    edi,eax
  804c88:	e8 28 fe ff ff       	call   804ab5 <del_proc>
    while(1)
        manage_proc();
  804c8d:	b8 00 00 00 00       	mov    eax,0x0
  804c92:	e8 2a f8 ff ff       	call   8044c1 <manage_proc>
  804c97:	eb f4                	jmp    804c8d <sys_exit+0x29>

0000000000804c99 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804c99:	f3 0f 1e fa          	endbr64 
  804c9d:	55                   	push   rbp
  804c9e:	48 89 e5             	mov    rbp,rsp
  804ca1:	53                   	push   rbx
  804ca2:	48 83 ec 48          	sub    rsp,0x48
  804ca6:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804caa:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804cae:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804cb2:	b8 00 00 00 00       	mov    eax,0x0
  804cb7:	e8 76 f5 ff ff       	call   804232 <req_proc>
  804cbc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804cbf:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804cc3:	75 0a                	jne    804ccf <reg_proc+0x36>
  804cc5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804cca:	e9 8c 01 00 00       	jmp    804e5b <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804ccf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804cd3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804cd6:	52                   	push   rdx
  804cd7:	6a 00                	push   0x0
  804cd9:	50                   	push   rax
  804cda:	6a 00                	push   0x0
  804cdc:	6a 00                	push   0x0
  804cde:	6a 00                	push   0x0
  804ce0:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804ce5:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804cec:	00 
  804ced:	6a 28                	push   0x28
  804cef:	6a 28                	push   0x28
  804cf1:	6a 28                	push   0x28
  804cf3:	6a 28                	push   0x28
  804cf5:	41 b9 30 00 00 00    	mov    r9d,0x30
  804cfb:	41 b8 28 00 00 00    	mov    r8d,0x28
  804d01:	b9 00 00 00 00       	mov    ecx,0x0
  804d06:	ba 00 00 00 00       	mov    edx,0x0
  804d0b:	be 00 00 00 00       	mov    esi,0x0
  804d10:	bf 00 00 00 00       	mov    edi,0x0
  804d15:	e8 e3 f5 ff ff       	call   8042fd <set_proc>
  804d1a:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804d1e:	b8 00 00 00 00       	mov    eax,0x0
  804d23:	e8 ea c3 ff ff       	call   801112 <vmalloc>
  804d28:	48 89 c2             	mov    rdx,rax
  804d2b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d2e:	48 98                	cdqe   
  804d30:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d37:	48 05 00 86 40 00    	add    rax,0x408600
  804d3d:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  804d40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d43:	48 98                	cdqe   
  804d45:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d4c:	48 05 00 86 40 00    	add    rax,0x408600
  804d52:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  804d55:	b8 00 00 00 00       	mov    eax,0x0
  804d5a:	e8 b3 c3 ff ff       	call   801112 <vmalloc>
  804d5f:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804d62:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d65:	48 98                	cdqe   
  804d67:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d6e:	48 05 00 86 40 00    	add    rax,0x408600
  804d74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d77:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804d7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d7f:	ba 03 00 00 00       	mov    edx,0x3
  804d84:	be 00 00 00 00       	mov    esi,0x0
  804d89:	48 89 c7             	mov    rdi,rax
  804d8c:	e8 b3 c9 ff ff       	call   801744 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804d91:	b8 00 00 00 00       	mov    eax,0x0
  804d96:	e8 77 c3 ff ff       	call   801112 <vmalloc>
  804d9b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804d9f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804da3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804da7:	48 83 c0 18          	add    rax,0x18
  804dab:	48 83 ca 07          	or     rdx,0x7
  804daf:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804db2:	b8 00 00 00 00       	mov    eax,0x0
  804db7:	e8 35 c7 ff ff       	call   8014f1 <req_a_page>
  804dbc:	89 c7                	mov    edi,eax
  804dbe:	e8 1d c9 ff ff       	call   8016e0 <get_phyaddr>
  804dc3:	89 c1                	mov    ecx,eax
  804dc5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804dc9:	48 05 f8 0f 00 00    	add    rax,0xff8
  804dcf:	ba 06 00 00 00       	mov    edx,0x6
  804dd4:	89 ce                	mov    esi,ecx
  804dd6:	48 89 c7             	mov    rdi,rax
  804dd9:	e8 bd c9 ff ff       	call   80179b <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804dde:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804de1:	48 98                	cdqe   
  804de3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804dea:	48 05 00 86 40 00    	add    rax,0x408600
  804df0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804df3:	48 89 c2             	mov    rdx,rax
  804df6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804df9:	48 98                	cdqe   
  804dfb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e02:	48 05 80 87 40 00    	add    rax,0x408780
  804e08:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=TASK_READY;
  804e0c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e0f:	48 98                	cdqe   
  804e11:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e18:	48 05 58 85 40 00    	add    rax,0x408558
  804e1e:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[i].cwd=cwd;
  804e24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e27:	48 98                	cdqe   
  804e29:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e30:	48 8d 90 08 86 40 00 	lea    rdx,[rax+0x408608]
  804e37:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e3b:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  804e3e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e41:	48 98                	cdqe   
  804e43:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e4a:	48 8d 90 10 86 40 00 	lea    rdx,[rax+0x408610]
  804e51:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804e55:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  804e58:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804e5b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804e5f:	c9                   	leave  
  804e60:	c3                   	ret    

0000000000804e61 <sys_malloc>:

void * sys_malloc(int size)
{
  804e61:	f3 0f 1e fa          	endbr64 
  804e65:	55                   	push   rbp
  804e66:	48 89 e5             	mov    rbp,rsp
  804e69:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804e6c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e6f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804e75:	85 c0                	test   eax,eax
  804e77:	0f 48 c2             	cmovs  eax,edx
  804e7a:	c1 f8 0c             	sar    eax,0xc
  804e7d:	89 c1                	mov    ecx,eax
  804e7f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e82:	99                   	cdq    
  804e83:	c1 ea 14             	shr    edx,0x14
  804e86:	01 d0                	add    eax,edx
  804e88:	25 ff 0f 00 00       	and    eax,0xfff
  804e8d:	29 d0                	sub    eax,edx
  804e8f:	01 c8                	add    eax,ecx
  804e91:	85 c0                	test   eax,eax
  804e93:	0f 95 c0             	setne  al
  804e96:	0f b6 c0             	movzx  eax,al
  804e99:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804e9c:	8b 05 2a 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1042a]        # 4152cc <cur_proc>
  804ea2:	48 98                	cdqe   
  804ea4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804eab:	48 05 68 85 40 00    	add    rax,0x408568
  804eb1:	8b 00                	mov    eax,DWORD PTR [rax]
  804eb3:	48 98                	cdqe   
  804eb5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804eb9:	eb 0c                	jmp    804ec7 <sys_malloc+0x66>
        hp=hp->next;
  804ebb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ebf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ec3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804ec7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ecb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ecf:	48 85 c0             	test   rax,rax
  804ed2:	74 16                	je     804eea <sys_malloc+0x89>
  804ed4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ed8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804edb:	85 c0                	test   eax,eax
  804edd:	75 0b                	jne    804eea <sys_malloc+0x89>
  804edf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ee3:	8b 00                	mov    eax,DWORD PTR [rax]
  804ee5:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ee8:	7e d1                	jle    804ebb <sys_malloc+0x5a>
    if(hp->pgn<n)
  804eea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804eee:	8b 00                	mov    eax,DWORD PTR [rax]
  804ef0:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ef3:	7e 7f                	jle    804f74 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804ef5:	8b 05 d1 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103d1]        # 4152cc <cur_proc>
  804efb:	48 98                	cdqe   
  804efd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f04:	48 05 6c 85 40 00    	add    rax,0x40856c
  804f0a:	8b 10                	mov    edx,DWORD PTR [rax]
  804f0c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f0f:	c1 e0 0c             	shl    eax,0xc
  804f12:	01 d0                	add    eax,edx
  804f14:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804f19:	7e 0a                	jle    804f25 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  804f1b:	b8 00 00 00 00       	mov    eax,0x0
  804f20:	e9 c8 00 00 00       	jmp    804fed <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804f25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f29:	8b 10                	mov    edx,DWORD PTR [rax]
  804f2b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f2e:	29 d0                	sub    eax,edx
  804f30:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804f33:	8b 05 93 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10393]        # 4152cc <cur_proc>
  804f39:	48 98                	cdqe   
  804f3b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f42:	48 05 6c 85 40 00    	add    rax,0x40856c
  804f48:	8b 00                	mov    eax,DWORD PTR [rax]
  804f4a:	48 98                	cdqe   
  804f4c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804f50:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804f57:	eb 13                	jmp    804f6c <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804f59:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f5d:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804f60:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804f67:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804f68:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804f6c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f6f:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804f72:	7c e5                	jl     804f59 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  804f74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f78:	8b 00                	mov    eax,DWORD PTR [rax]
  804f7a:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804f7d:	7d 59                	jge    804fd8 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804f7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f83:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804f87:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f8a:	83 c0 01             	add    eax,0x1
  804f8d:	c1 e0 0c             	shl    eax,0xc
  804f90:	48 98                	cdqe   
  804f92:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804f96:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804f9a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804f9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fa2:	8b 00                	mov    eax,DWORD PTR [rax]
  804fa4:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804fa7:	8d 50 ff             	lea    edx,[rax-0x1]
  804faa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804fae:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804fb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fb4:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804fb8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804fbc:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804fc0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804fc4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804fc8:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804fcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fd0:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804fd4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804fd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fdc:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804fe3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fe7:	48 05 00 10 00 00    	add    rax,0x1000
}
  804fed:	5d                   	pop    rbp
  804fee:	c3                   	ret    

0000000000804fef <sys_free>:
int sys_free(int ptr)
{
  804fef:	f3 0f 1e fa          	endbr64 
  804ff3:	55                   	push   rbp
  804ff4:	48 89 e5             	mov    rbp,rsp
  804ff7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804ffa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ffd:	2d 00 10 00 00       	sub    eax,0x1000
  805002:	48 98                	cdqe   
  805004:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  805008:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80500c:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  805013:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805017:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80501b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80501f:	eb 2e                	jmp    80504f <sys_free+0x60>
    {
        if(p->alloc==0)
  805021:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805025:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805028:	85 c0                	test   eax,eax
  80502a:	75 2c                	jne    805058 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  80502c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805030:	8b 10                	mov    edx,DWORD PTR [rax]
  805032:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805036:	8b 00                	mov    eax,DWORD PTR [rax]
  805038:	83 c0 01             	add    eax,0x1
  80503b:	01 c2                	add    edx,eax
  80503d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805041:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  805043:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805047:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80504b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80504f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805054:	75 cb                	jne    805021 <sys_free+0x32>
  805056:	eb 01                	jmp    805059 <sys_free+0x6a>
            break;
  805058:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  805059:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80505d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805061:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805065:	eb 2e                	jmp    805095 <sys_free+0xa6>
    {
        if(p->alloc==0)
  805067:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80506b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80506e:	85 c0                	test   eax,eax
  805070:	75 2c                	jne    80509e <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  805072:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805076:	8b 10                	mov    edx,DWORD PTR [rax]
  805078:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80507c:	8b 00                	mov    eax,DWORD PTR [rax]
  80507e:	83 c0 01             	add    eax,0x1
  805081:	01 c2                	add    edx,eax
  805083:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805087:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  805089:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80508d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805091:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805095:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80509a:	75 cb                	jne    805067 <sys_free+0x78>
  80509c:	eb 01                	jmp    80509f <sys_free+0xb0>
            break;
  80509e:	90                   	nop
    }
    //合并完成
    return 0;
  80509f:	b8 00 00 00 00       	mov    eax,0x0
}
  8050a4:	5d                   	pop    rbp
  8050a5:	c3                   	ret    

00000000008050a6 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8050a6:	f3 0f 1e fa          	endbr64 
  8050aa:	55                   	push   rbp
  8050ab:	48 89 e5             	mov    rbp,rsp
  8050ae:	53                   	push   rbx
  8050af:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8050b3:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8050b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8050bb:	48 2d 40 85 40 00    	sub    rax,0x408540
  8050c1:	48 c1 f8 02          	sar    rax,0x2
  8050c5:	48 89 c2             	mov    rdx,rax
  8050c8:	48 b8 05 ec 4f c0 fe 	movabs rax,0x4fec04fec04fec05
  8050cf:	04 ec 4f 
  8050d2:	48 0f af c2          	imul   rax,rdx
  8050d6:	89 05 f0 01 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc101f0],eax        # 4152cc <cur_proc>
    current=&task[cur_proc];
  8050dc:	8b 05 ea 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101ea]        # 4152cc <cur_proc>
  8050e2:	48 98                	cdqe   
  8050e4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8050eb:	48 05 40 85 40 00    	add    rax,0x408540
  8050f1:	48 89 05 48 01 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10148],rax        # 415240 <current>
    asm volatile("mov %0,%%rax\n"
  8050f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8050fc:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805103:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  805106:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  80510a:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80510e:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  805112:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  805116:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80511a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80511e:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805122:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  805126:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  80512a:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80512e:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  805135:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 805160 <done>
  80513c:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  805143:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  80514a:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  805150:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  805157:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  80515e:	eb 08                	jmp    805168 <__switch_to>

0000000000805160 <done>:
  805160:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  805161:	90                   	nop
  805162:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805166:	c9                   	leave  
  805167:	c3                   	ret    

0000000000805168 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  805168:	f3 0f 1e fa          	endbr64 
  80516c:	55                   	push   rbp
  80516d:	48 89 e5             	mov    rbp,rsp
  805170:	53                   	push   rbx
  805171:	48 83 ec 18          	sub    rsp,0x18
  805175:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  805179:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80517d:	48 8b 05 3c 87 00 00 	mov    rax,QWORD PTR [rip+0x873c]        # 80d8c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  805184:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  805188:	48 8b 05 31 87 00 00 	mov    rax,QWORD PTR [rip+0x8731]        # 80d8c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80518f:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  805193:	48 8b 05 26 87 00 00 	mov    rax,QWORD PTR [rip+0x8726]        # 80d8c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80519a:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80519e:	48 8b 05 1b 87 00 00 	mov    rax,QWORD PTR [rip+0x871b]        # 80d8c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8051a5:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8051a9:	48 8b 05 10 87 00 00 	mov    rax,QWORD PTR [rip+0x8710]        # 80d8c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8051b0:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8051b4:	48 8b 05 05 87 00 00 	mov    rax,QWORD PTR [rip+0x8705]        # 80d8c0 <tss>
  8051bb:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8051bf:	48 8b 05 fa 86 00 00 	mov    rax,QWORD PTR [rip+0x86fa]        # 80d8c0 <tss>
  8051c6:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  8051ca:	48 8b 05 ef 86 00 00 	mov    rax,QWORD PTR [rip+0x86ef]        # 80d8c0 <tss>
  8051d1:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  8051d5:	48 8b 05 e4 86 00 00 	mov    rax,QWORD PTR [rip+0x86e4]        # 80d8c0 <tss>
  8051dc:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  8051e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8051e4:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  8051eb:	41 52                	push   r10
  8051ed:	41 51                	push   r9
  8051ef:	41 50                	push   r8
  8051f1:	57                   	push   rdi
  8051f2:	49 89 d9             	mov    r9,rbx
  8051f5:	4d 89 d8             	mov    r8,r11
  8051f8:	48 89 c7             	mov    rdi,rax
  8051fb:	e8 34 00 00 00       	call   805234 <set_tss>
  805200:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  805204:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805208:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80520c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805210:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805214:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  80521a:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  805220:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  805226:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  80522c:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  80522d:	90                   	nop
  80522e:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805232:	c9                   	leave  
  805233:	c3                   	ret    

0000000000805234 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  805234:	f3 0f 1e fa          	endbr64 
  805238:	55                   	push   rbp
  805239:	48 89 e5             	mov    rbp,rsp
  80523c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805240:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805244:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  805248:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80524c:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  805250:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  805254:	48 8b 05 65 86 00 00 	mov    rax,QWORD PTR [rip+0x8665]        # 80d8c0 <tss>
  80525b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80525f:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  805263:	48 8b 05 56 86 00 00 	mov    rax,QWORD PTR [rip+0x8656]        # 80d8c0 <tss>
  80526a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80526e:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  805272:	48 8b 05 47 86 00 00 	mov    rax,QWORD PTR [rip+0x8647]        # 80d8c0 <tss>
  805279:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80527d:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  805281:	48 8b 05 38 86 00 00 	mov    rax,QWORD PTR [rip+0x8638]        # 80d8c0 <tss>
  805288:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80528c:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  805290:	48 8b 05 29 86 00 00 	mov    rax,QWORD PTR [rip+0x8629]        # 80d8c0 <tss>
  805297:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80529b:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  80529f:	48 8b 05 1a 86 00 00 	mov    rax,QWORD PTR [rip+0x861a]        # 80d8c0 <tss>
  8052a6:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8052aa:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  8052ae:	48 8b 05 0b 86 00 00 	mov    rax,QWORD PTR [rip+0x860b]        # 80d8c0 <tss>
  8052b5:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8052b9:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  8052bd:	48 8b 05 fc 85 00 00 	mov    rax,QWORD PTR [rip+0x85fc]        # 80d8c0 <tss>
  8052c4:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8052c8:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  8052cc:	48 8b 05 ed 85 00 00 	mov    rax,QWORD PTR [rip+0x85ed]        # 80d8c0 <tss>
  8052d3:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8052d7:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  8052db:	48 8b 05 de 85 00 00 	mov    rax,QWORD PTR [rip+0x85de]        # 80d8c0 <tss>
  8052e2:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8052e6:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  8052ea:	90                   	nop
  8052eb:	5d                   	pop    rbp
  8052ec:	c3                   	ret    

00000000008052ed <fork_child_ret>:

int fork_child_ret(){
  8052ed:	f3 0f 1e fa          	endbr64 
  8052f1:	55                   	push   rbp
  8052f2:	48 89 e5             	mov    rbp,rsp
    return 0;
  8052f5:	b8 00 00 00 00       	mov    eax,0x0

}
  8052fa:	5d                   	pop    rbp
  8052fb:	c3                   	ret    

00000000008052fc <sys_fork>:

int sys_fork(void){
  8052fc:	f3 0f 1e fa          	endbr64 
  805300:	55                   	push   rbp
  805301:	48 89 e5             	mov    rbp,rsp
  805304:	53                   	push   rbx
  805305:	48 81 ec 98 00 00 00 	sub    rsp,0x98
    int pid=req_proc();
  80530c:	b8 00 00 00 00       	mov    eax,0x0
  805311:	e8 1c ef ff ff       	call   804232 <req_proc>
  805316:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  805319:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80531d:	75 0a                	jne    805329 <sys_fork+0x2d>
  80531f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805324:	e9 6e 09 00 00       	jmp    805c97 <sys_fork+0x99b>
    task[pid].regs=current->regs;
  805329:	48 8b 05 10 ff c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ff10]        # 415240 <current>
  805330:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805333:	48 63 d2             	movsxd rdx,edx
  805336:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  80533d:	48 81 c2 80 87 40 00 	add    rdx,0x408780
  805344:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  80534b:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  805352:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  805356:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  80535a:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  805361:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  805368:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  80536c:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  805370:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  805377:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  80537e:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  805382:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  805386:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  80538d:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  805394:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  805398:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  80539c:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  8053a3:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  8053aa:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  8053ae:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  8053b2:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  8053b9:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  8053c0:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  8053c4:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  8053c8:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  8053cf:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  8053d6:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  8053da:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  8053de:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  8053e5:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  8053ec:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  8053f0:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  8053f4:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  8053fb:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  805402:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  805409:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  805410:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  805417:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  80541e:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  805425:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  80542c:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  805433:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  80543a:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  805441:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  805448:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  80544f:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  805456:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  80545d:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  805464:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  80546b:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  805472:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  805479:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  805480:	ba e1 d7 80 00       	mov    edx,0x80d7e1
  805485:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805488:	48 98                	cdqe   
  80548a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805491:	48 05 80 87 40 00    	add    rax,0x408780
  805497:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  80549b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80549e:	48 98                	cdqe   
  8054a0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8054a7:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8054ad:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8054b1:	48 2d a8 00 00 00    	sub    rax,0xa8
  8054b7:	48 89 c2             	mov    rdx,rax
  8054ba:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8054bd:	48 98                	cdqe   
  8054bf:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8054c6:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8054cc:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  8054d0:	48 8b 05 69 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd69]        # 415240 <current>
  8054d7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8054da:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8054dd:	48 63 d2             	movsxd rdx,edx
  8054e0:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  8054e7:	48 81 c2 48 85 40 00 	add    rdx,0x408548
  8054ee:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  8054f0:	48 8b 05 49 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd49]        # 415240 <current>
  8054f7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8054fa:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8054fd:	48 63 d2             	movsxd rdx,edx
  805500:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805507:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  80550e:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  805510:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805513:	48 98                	cdqe   
  805515:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80551c:	48 05 b0 87 40 00    	add    rax,0x4087b0
  805522:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805526:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  80552a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80552e:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  805535:	00 
    r->ds=DS_USER;
  805536:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80553a:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  805541:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805545:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  80554c:	28 00 00 00 
    r->es=DS_USER;
  805550:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805554:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  80555b:	00 
    r->rax=task[pid].regs.rax;
  80555c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80555f:	48 98                	cdqe   
  805561:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805568:	48 05 90 87 40 00    	add    rax,0x408790
  80556e:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805572:	48 89 c2             	mov    rdx,rax
  805575:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805579:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  80557d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805580:	48 98                	cdqe   
  805582:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805589:	48 05 b0 87 40 00    	add    rax,0x4087b0
  80558f:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805593:	48 89 c2             	mov    rdx,rax
  805596:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80559a:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  80559e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055a1:	48 98                	cdqe   
  8055a3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055aa:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8055b0:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8055b4:	48 89 c2             	mov    rdx,rax
  8055b7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055bb:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  8055bf:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055c2:	48 98                	cdqe   
  8055c4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055cb:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8055d1:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8055d5:	48 89 c2             	mov    rdx,rax
  8055d8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055dc:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  8055e0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055e3:	48 98                	cdqe   
  8055e5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055ec:	48 05 c0 87 40 00    	add    rax,0x4087c0
  8055f2:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8055f6:	48 89 c2             	mov    rdx,rax
  8055f9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055fd:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  805601:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805604:	48 98                	cdqe   
  805606:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80560d:	48 05 d0 87 40 00    	add    rax,0x4087d0
  805613:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805617:	48 89 c2             	mov    rdx,rax
  80561a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80561e:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  805622:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805625:	48 98                	cdqe   
  805627:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80562e:	48 05 00 88 40 00    	add    rax,0x408800
  805634:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805638:	48 89 c2             	mov    rdx,rax
  80563b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80563f:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  805643:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805646:	48 98                	cdqe   
  805648:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80564f:	48 05 10 88 40 00    	add    rax,0x408810
  805655:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805659:	48 89 c2             	mov    rdx,rax
  80565c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805660:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  805664:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805667:	48 98                	cdqe   
  805669:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805670:	48 05 10 88 40 00    	add    rax,0x408810
  805676:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80567a:	48 89 c2             	mov    rdx,rax
  80567d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805681:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  805685:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805688:	48 98                	cdqe   
  80568a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805691:	48 05 20 88 40 00    	add    rax,0x408820
  805697:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80569b:	48 89 c2             	mov    rdx,rax
  80569e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056a2:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  8056a6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056a9:	48 98                	cdqe   
  8056ab:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056b2:	48 05 20 88 40 00    	add    rax,0x408820
  8056b8:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8056bc:	48 89 c2             	mov    rdx,rax
  8056bf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056c3:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  8056c7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056ca:	48 98                	cdqe   
  8056cc:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056d3:	48 05 30 88 40 00    	add    rax,0x408830
  8056d9:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056dd:	48 89 c2             	mov    rdx,rax
  8056e0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056e4:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  8056e8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056eb:	48 98                	cdqe   
  8056ed:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056f4:	48 05 30 88 40 00    	add    rax,0x408830
  8056fa:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8056fe:	48 89 c2             	mov    rdx,rax
  805701:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805705:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  805709:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80570c:	48 98                	cdqe   
  80570e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805715:	48 05 40 88 40 00    	add    rax,0x408840
  80571b:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80571f:	48 89 c2             	mov    rdx,rax
  805722:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805726:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  80572a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80572e:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  805735:	48 8b 05 04 fb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fb04]        # 415240 <current>
  80573c:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80573f:	48 63 d2             	movsxd rdx,edx
  805742:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805749:	48 81 c2 10 87 40 00 	add    rdx,0x408710
  805750:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  805757:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  80575e:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  805762:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  805766:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  80576d:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  805774:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  805778:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  80577c:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  805783:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  80578a:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  80578e:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  805792:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  805799:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  8057a0:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  8057a4:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  8057a8:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  8057af:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  8057b6:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  8057ba:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  8057be:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  8057c5:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  8057cc:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  8057d0:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  8057d4:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  8057db:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  8057df:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  8057e5:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=TASK_READY;
  8057e8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057eb:	48 98                	cdqe   
  8057ed:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057f4:	48 05 58 85 40 00    	add    rax,0x408558
  8057fa:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[pid].parent_pid=cur_proc;
  805800:	8b 05 c6 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fac6]        # 4152cc <cur_proc>
  805806:	89 c2                	mov    edx,eax
  805808:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80580b:	48 98                	cdqe   
  80580d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805814:	48 05 dc 85 40 00    	add    rax,0x4085dc
  80581a:	89 10                	mov    DWORD PTR [rax],edx
    //设置父子关系以及初始化子进程的的list节点
    list_init(&task[pid].node);
  80581c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80581f:	48 98                	cdqe   
  805821:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805828:	48 05 10 03 00 00    	add    rax,0x310
  80582e:	48 05 40 85 40 00    	add    rax,0x408540
  805834:	48 83 c0 04          	add    rax,0x4
  805838:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    list->prev = NULL;
  80583f:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805846:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80584d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805854:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80585b:	00 
}
  80585c:	90                   	nop
    task[pid].child_procs=NULL;
  80585d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805860:	48 98                	cdqe   
  805862:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805869:	48 05 60 88 40 00    	add    rax,0x408860
  80586f:	48 c7 40 0c 00 00 00 	mov    QWORD PTR [rax+0xc],0x0
  805876:	00 
    task[pid].node.data=&task[pid];
  805877:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80587a:	48 98                	cdqe   
  80587c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805883:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  80588a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80588d:	48 98                	cdqe   
  80588f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805896:	48 05 50 88 40 00    	add    rax,0x408850
  80589c:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    list_add(current->child_procs,&task[pid].node);
  8058a0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8058a3:	48 98                	cdqe   
  8058a5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8058ac:	48 05 10 03 00 00    	add    rax,0x310
  8058b2:	48 05 40 85 40 00    	add    rax,0x408540
  8058b8:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8058bc:	48 8b 05 7d f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f97d]        # 415240 <current>
  8058c3:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  8058ca:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  8058ce:	48 89 55 90          	mov    QWORD PTR [rbp-0x70],rdx
    if(entry->next==NULL)
  8058d2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8058d6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8058da:	48 85 c0             	test   rax,rax
  8058dd:	75 58                	jne    805937 <sys_fork+0x63b>
  8058df:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8058e3:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  8058e7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8058eb:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  8058ef:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8058f3:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8058f7:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8058fb:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8058ff:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805903:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  805907:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80590a:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80590e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805912:	48 85 c0             	test   rax,rax
  805915:	74 0f                	je     805926 <sys_fork+0x62a>
        new->next->prev = new;
  805917:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80591b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80591f:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  805923:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805926:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80592a:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  80592e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805932:	e9 d9 00 00 00       	jmp    805a10 <sys_fork+0x714>
        struct List* p=entry;
  805937:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80593b:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
        for(;p->next&&p->next!=p;p=p->next){
  805942:	eb 2e                	jmp    805972 <sys_fork+0x676>
            if(p->data==new->data)
  805944:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80594b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80594f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805953:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805957:	48 39 c2             	cmp    rdx,rax
  80595a:	0f 84 af 00 00 00    	je     805a0f <sys_fork+0x713>
        for(;p->next&&p->next!=p;p=p->next){
  805960:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805967:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80596b:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  805972:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805979:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80597d:	48 85 c0             	test   rax,rax
  805980:	74 14                	je     805996 <sys_fork+0x69a>
  805982:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805989:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80598d:	48 39 85 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],rax
  805994:	75 ae                	jne    805944 <sys_fork+0x648>
  805996:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80599d:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  8059a4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8059a8:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    new->next = entry->next;
  8059af:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8059b6:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8059ba:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  8059c1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8059c5:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  8059cc:	48 8b 95 70 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x90]
  8059d3:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8059d6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  8059dd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8059e1:	48 85 c0             	test   rax,rax
  8059e4:	74 15                	je     8059fb <sys_fork+0x6ff>
        new->next->prev = new;
  8059e6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  8059ed:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8059f1:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  8059f8:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8059fb:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805a02:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  805a09:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805a0d:	eb 01                	jmp    805a10 <sys_fork+0x714>
                return;
  805a0f:	90                   	nop
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805a10:	48 8b 05 29 f8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f829]        # 415240 <current>
  805a17:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  805a1e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a21:	48 98                	cdqe   
  805a23:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805a2a:	48 05 d0 00 00 00    	add    rax,0xd0
  805a30:	48 05 40 85 40 00    	add    rax,0x408540
  805a36:	48 83 c0 08          	add    rax,0x8
  805a3a:	ba 00 01 00 00       	mov    edx,0x100
  805a3f:	48 89 ce             	mov    rsi,rcx
  805a42:	48 89 c7             	mov    rdi,rax
  805a45:	e8 f0 73 00 00       	call   80ce3a <memcpy>
    task[pid].utime=0;
  805a4a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a4d:	48 98                	cdqe   
  805a4f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805a56:	48 05 5c 85 40 00    	add    rax,0x40855c
  805a5c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  805a62:	48 8b 0d d7 f7 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f7d7]        # 415240 <current>
  805a69:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a6c:	48 98                	cdqe   
  805a6e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805a75:	48 8d b0 60 85 40 00 	lea    rsi,[rax+0x408560]
  805a7c:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  805a80:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  805a84:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  805a88:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  805a8c:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  805a90:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  805a94:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  805a98:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  805a9c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a9f:	48 98                	cdqe   
  805aa1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805aa8:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  805aaf:	48 8b 05 8a f7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f78a]        # 415240 <current>
  805ab6:	48 89 d6             	mov    rsi,rdx
  805ab9:	48 89 c7             	mov    rdi,rax
  805abc:	e8 de 04 00 00       	call   805f9f <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805ac1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805ac4:	48 98                	cdqe   
  805ac6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805acd:	48 05 74 85 40 00    	add    rax,0x408574
  805ad3:	8b 00                	mov    eax,DWORD PTR [rax]
  805ad5:	2d 00 10 00 00       	sub    eax,0x1000
  805ada:	48 98                	cdqe   
  805adc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805ae0:	eb 5b                	jmp    805b3d <sys_fork+0x841>
        addr_t new_stkpg=vmalloc();
  805ae2:	b8 00 00 00 00       	mov    eax,0x0
  805ae7:	e8 26 b6 ff ff       	call   801112 <vmalloc>
  805aec:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805af0:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805af4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805af8:	ba 00 10 00 00       	mov    edx,0x1000
  805afd:	48 89 ce             	mov    rsi,rcx
  805b00:	48 89 c7             	mov    rdi,rax
  805b03:	e8 32 73 00 00       	call   80ce3a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805b08:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b0b:	48 98                	cdqe   
  805b0d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b14:	48 05 00 86 40 00    	add    rax,0x408600
  805b1a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805b1d:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805b21:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805b25:	48 89 d1             	mov    rcx,rdx
  805b28:	ba 07 00 00 00       	mov    edx,0x7
  805b2d:	48 89 c7             	mov    rdi,rax
  805b30:	e8 8d b3 ff ff       	call   800ec2 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805b35:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  805b3c:	00 
  805b3d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b40:	48 98                	cdqe   
  805b42:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b49:	48 05 70 85 40 00    	add    rax,0x408570
  805b4f:	8b 00                	mov    eax,DWORD PTR [rax]
  805b51:	48 98                	cdqe   
  805b53:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805b57:	73 89                	jae    805ae2 <sys_fork+0x7e6>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  805b59:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805b60:	00 
    int f=1;
  805b61:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805b68:	e9 81 00 00 00       	jmp    805bee <sys_fork+0x8f2>
        addr_t new_stkpg=vmalloc();
  805b6d:	b8 00 00 00 00       	mov    eax,0x0
  805b72:	e8 9b b5 ff ff       	call   801112 <vmalloc>
  805b77:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805b7b:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805b7f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805b83:	ba 00 10 00 00       	mov    edx,0x1000
  805b88:	48 89 ce             	mov    rsi,rcx
  805b8b:	48 89 c7             	mov    rdi,rax
  805b8e:	e8 a7 72 00 00       	call   80ce3a <memcpy>
        if(f){
  805b93:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805b97:	74 20                	je     805bb9 <sys_fork+0x8bd>
            f=0;
  805b99:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805ba0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805ba4:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805baa:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805bae:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805bb2:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805bb9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805bbc:	48 98                	cdqe   
  805bbe:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805bc5:	48 05 00 86 40 00    	add    rax,0x408600
  805bcb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805bce:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805bd2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805bd6:	48 89 d1             	mov    rcx,rdx
  805bd9:	ba 07 00 00 00       	mov    edx,0x7
  805bde:	48 89 c7             	mov    rdi,rax
  805be1:	e8 dc b2 ff ff       	call   800ec2 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805be6:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805bed:	00 
  805bee:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805bf5:	00 
  805bf6:	0f 87 71 ff ff ff    	ja     805b6d <sys_fork+0x871>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805bfc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805bff:	48 98                	cdqe   
  805c01:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c08:	48 05 6c 85 40 00    	add    rax,0x40856c
  805c0e:	8b 00                	mov    eax,DWORD PTR [rax]
  805c10:	2d 00 10 00 00       	sub    eax,0x1000
  805c15:	48 98                	cdqe   
  805c17:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805c1b:	eb 5b                	jmp    805c78 <sys_fork+0x97c>
        addr_t new_hppg=vmalloc();
  805c1d:	b8 00 00 00 00       	mov    eax,0x0
  805c22:	e8 eb b4 ff ff       	call   801112 <vmalloc>
  805c27:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805c2b:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  805c2f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805c33:	ba 00 10 00 00       	mov    edx,0x1000
  805c38:	48 89 ce             	mov    rsi,rcx
  805c3b:	48 89 c7             	mov    rdi,rax
  805c3e:	e8 f7 71 00 00       	call   80ce3a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805c43:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c46:	48 98                	cdqe   
  805c48:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c4f:	48 05 00 86 40 00    	add    rax,0x408600
  805c55:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805c58:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805c5c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805c60:	48 89 d1             	mov    rcx,rdx
  805c63:	ba 07 00 00 00       	mov    edx,0x7
  805c68:	48 89 c7             	mov    rdi,rax
  805c6b:	e8 52 b2 ff ff       	call   800ec2 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805c70:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805c77:	00 
  805c78:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c7b:	48 98                	cdqe   
  805c7d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c84:	48 05 68 85 40 00    	add    rax,0x408568
  805c8a:	8b 00                	mov    eax,DWORD PTR [rax]
  805c8c:	48 98                	cdqe   
  805c8e:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805c92:	73 89                	jae    805c1d <sys_fork+0x921>
    }
    //父进程运行到这里
    return pid;
  805c94:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805c97:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805c9b:	c9                   	leave  
  805c9c:	c3                   	ret    

0000000000805c9d <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805c9d:	f3 0f 1e fa          	endbr64 
  805ca1:	55                   	push   rbp
  805ca2:	48 89 e5             	mov    rbp,rsp
  805ca5:	48 83 ec 50          	sub    rsp,0x50
  805ca9:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805cad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805cb1:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805cb8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805cbc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805cc0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805cc4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805ccb:	e9 be 02 00 00       	jmp    805f8e <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805cd0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cd3:	48 98                	cdqe   
  805cd5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805cdc:	00 
  805cdd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805ce1:	48 01 d0             	add    rax,rdx
  805ce4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ce7:	83 e0 01             	and    eax,0x1
  805cea:	48 85 c0             	test   rax,rax
  805ced:	0f 84 97 02 00 00    	je     805f8a <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805cf3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cf6:	48 98                	cdqe   
  805cf8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805cff:	00 
  805d00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805d04:	48 01 d0             	add    rax,rdx
  805d07:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d0a:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805d11:	ff 00 00 
  805d14:	48 21 d0             	and    rax,rdx
  805d17:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  805d1b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805d1f:	0f 94 c0             	sete   al
  805d22:	0f b6 c0             	movzx  eax,al
  805d25:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  805d28:	e9 24 02 00 00       	jmp    805f51 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805d2d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805d30:	48 98                	cdqe   
  805d32:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d39:	00 
  805d3a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d3e:	48 01 d0             	add    rax,rdx
  805d41:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d44:	83 e0 01             	and    eax,0x1
  805d47:	48 85 c0             	test   rax,rax
  805d4a:	0f 84 fd 01 00 00    	je     805f4d <release_mmap+0x2b0>
  805d50:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805d53:	48 98                	cdqe   
  805d55:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d5c:	00 
  805d5d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d61:	48 01 d0             	add    rax,rdx
  805d64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d67:	25 80 00 00 00       	and    eax,0x80
  805d6c:	48 85 c0             	test   rax,rax
  805d6f:	0f 85 d8 01 00 00    	jne    805f4d <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805d75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805d78:	48 98                	cdqe   
  805d7a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d81:	00 
  805d82:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d86:	48 01 d0             	add    rax,rdx
  805d89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d8c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805d93:	ff 00 00 
  805d96:	48 21 d0             	and    rax,rdx
  805d99:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805d9d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805da4:	e9 6b 01 00 00       	jmp    805f14 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805da9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805dac:	48 98                	cdqe   
  805dae:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805db5:	00 
  805db6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805dba:	48 01 d0             	add    rax,rdx
  805dbd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805dc0:	83 e0 01             	and    eax,0x1
  805dc3:	48 85 c0             	test   rax,rax
  805dc6:	0f 84 dc 00 00 00    	je     805ea8 <release_mmap+0x20b>
  805dcc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805dcf:	48 98                	cdqe   
  805dd1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805dd8:	00 
  805dd9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ddd:	48 01 d0             	add    rax,rdx
  805de0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805de3:	25 80 00 00 00       	and    eax,0x80
  805de8:	48 85 c0             	test   rax,rax
  805deb:	0f 85 b7 00 00 00    	jne    805ea8 <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805df1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805df4:	48 98                	cdqe   
  805df6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805dfd:	00 
  805dfe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805e02:	48 01 d0             	add    rax,rdx
  805e05:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e08:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805e0f:	ff 00 00 
  805e12:	48 21 d0             	and    rax,rdx
  805e15:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  805e19:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805e20:	eb 4f                	jmp    805e71 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  805e22:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805e25:	48 98                	cdqe   
  805e27:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e2e:	00 
  805e2f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805e33:	48 01 d0             	add    rax,rdx
  805e36:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e39:	83 e0 01             	and    eax,0x1
  805e3c:	48 85 c0             	test   rax,rax
  805e3f:	74 2c                	je     805e6d <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    //TODO:这里有一个问题：目前fork时候堆栈空间使用的是vmalloc内存，这样的话free_page是释放不了的。
                                    free_page(pte[l]&PAGE_4K_MASK);
  805e41:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805e44:	48 98                	cdqe   
  805e46:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e4d:	00 
  805e4e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805e52:	48 01 d0             	add    rax,rdx
  805e55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e58:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805e5f:	ff 00 00 
  805e62:	48 21 d0             	and    rax,rdx
  805e65:	48 89 c7             	mov    rdi,rax
  805e68:	e8 54 b7 ff ff       	call   8015c1 <free_page>
                            for(int l=0;l<512;l++){
  805e6d:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805e71:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  805e78:	7e a8                	jle    805e22 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805e7a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e7d:	48 98                	cdqe   
  805e7f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e86:	00 
  805e87:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805e8b:	48 01 d0             	add    rax,rdx
  805e8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e91:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805e98:	ff 00 00 
  805e9b:	48 21 d0             	and    rax,rdx
  805e9e:	48 89 c7             	mov    rdi,rax
  805ea1:	e8 0c b3 ff ff       	call   8011b2 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805ea6:	eb 68                	jmp    805f10 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  805ea8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805eab:	48 98                	cdqe   
  805ead:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805eb4:	00 
  805eb5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805eb9:	48 01 d0             	add    rax,rdx
  805ebc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ebf:	83 e0 01             	and    eax,0x1
  805ec2:	48 85 c0             	test   rax,rax
  805ec5:	74 49                	je     805f10 <release_mmap+0x273>
  805ec7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805eca:	48 98                	cdqe   
  805ecc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ed3:	00 
  805ed4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ed8:	48 01 d0             	add    rax,rdx
  805edb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ede:	25 80 00 00 00       	and    eax,0x80
  805ee3:	48 85 c0             	test   rax,rax
  805ee6:	74 28                	je     805f10 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  805ee8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805eeb:	48 98                	cdqe   
  805eed:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ef4:	00 
  805ef5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ef9:	48 01 d0             	add    rax,rdx
  805efc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805eff:	25 00 f0 ff ff       	and    eax,0xfffff000
  805f04:	be 00 02 00 00       	mov    esi,0x200
  805f09:	89 c7                	mov    edi,eax
  805f0b:	e8 35 b7 ff ff       	call   801645 <free_pages_at>
                    for(int k=0;k<512;k++)
  805f10:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805f14:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  805f1b:	0f 8e 88 fe ff ff    	jle    805da9 <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  805f21:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805f24:	48 98                	cdqe   
  805f26:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f2d:	00 
  805f2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805f32:	48 01 d0             	add    rax,rdx
  805f35:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f38:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f3f:	ff 00 00 
  805f42:	48 21 d0             	and    rax,rdx
  805f45:	48 89 c7             	mov    rdi,rax
  805f48:	e8 65 b2 ff ff       	call   8011b2 <vmfree>
            for(;j<512;j++)
  805f4d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805f51:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  805f58:	0f 8e cf fd ff ff    	jle    805d2d <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  805f5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f61:	48 98                	cdqe   
  805f63:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f6a:	00 
  805f6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f6f:	48 01 d0             	add    rax,rdx
  805f72:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f75:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f7c:	ff 00 00 
  805f7f:	48 21 d0             	and    rax,rdx
  805f82:	48 89 c7             	mov    rdi,rax
  805f85:	e8 28 b2 ff ff       	call   8011b2 <vmfree>
    for(int i=0;i<512;i++)
  805f8a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805f8e:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805f95:	0f 8e 35 fd ff ff    	jle    805cd0 <release_mmap+0x33>
        }
    }
}
  805f9b:	90                   	nop
  805f9c:	90                   	nop
  805f9d:	c9                   	leave  
  805f9e:	c3                   	ret    

0000000000805f9f <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805f9f:	f3 0f 1e fa          	endbr64 
  805fa3:	55                   	push   rbp
  805fa4:	48 89 e5             	mov    rbp,rsp
  805fa7:	48 83 ec 60          	sub    rsp,0x60
  805fab:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805faf:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805fb3:	b8 00 00 00 00       	mov    eax,0x0
  805fb8:	e8 55 b1 ff ff       	call   801112 <vmalloc>
  805fbd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805fc1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805fc5:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  805fcc:	48 89 c1             	mov    rcx,rax
  805fcf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fd3:	ba 00 10 00 00       	mov    edx,0x1000
  805fd8:	48 89 ce             	mov    rsi,rcx
  805fdb:	48 89 c7             	mov    rdi,rax
  805fde:	e8 57 6e 00 00       	call   80ce3a <memcpy>
    to->regs.cr3=pml4p;
  805fe3:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805fe7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805feb:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  805ff2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805ff6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805ffa:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  806001:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806005:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  806009:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806010:	e9 09 03 00 00       	jmp    80631e <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  806015:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806018:	48 98                	cdqe   
  80601a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806021:	00 
  806022:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806026:	48 01 d0             	add    rax,rdx
  806029:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80602c:	83 e0 01             	and    eax,0x1
  80602f:	48 85 c0             	test   rax,rax
  806032:	0f 84 e2 02 00 00    	je     80631a <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806038:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80603b:	48 98                	cdqe   
  80603d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806044:	00 
  806045:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806049:	48 01 d0             	add    rax,rdx
  80604c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80604f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  806053:	b8 00 00 00 00       	mov    eax,0x0
  806058:	e8 b5 b0 ff ff       	call   801112 <vmalloc>
  80605d:	48 89 c2             	mov    rdx,rax
  806060:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  806067:	00 ff ff 
  80606a:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80606e:	48 89 c1             	mov    rcx,rax
  806071:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806074:	48 98                	cdqe   
  806076:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80607d:	00 
  80607e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806082:	48 01 f0             	add    rax,rsi
  806085:	48 09 ca             	or     rdx,rcx
  806088:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80608b:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  806092:	ff 00 00 
  806095:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  806099:	48 89 c1             	mov    rcx,rax
  80609c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80609f:	48 98                	cdqe   
  8060a1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8060a8:	00 
  8060a9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8060ad:	48 01 d0             	add    rax,rdx
  8060b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060b3:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8060ba:	ff 00 00 
  8060bd:	48 21 d0             	and    rax,rdx
  8060c0:	ba 00 10 00 00       	mov    edx,0x1000
  8060c5:	48 89 ce             	mov    rsi,rcx
  8060c8:	48 89 c7             	mov    rdi,rax
  8060cb:	e8 6a 6d 00 00       	call   80ce3a <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8060d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060d3:	48 98                	cdqe   
  8060d5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8060dc:	00 
  8060dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8060e1:	48 01 d0             	add    rax,rdx
  8060e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060e7:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8060ee:	ff 00 00 
  8060f1:	48 21 d0             	and    rax,rdx
  8060f4:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  8060f8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8060ff:	e9 09 02 00 00       	jmp    80630d <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  806104:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806107:	48 98                	cdqe   
  806109:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806110:	00 
  806111:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806115:	48 01 d0             	add    rax,rdx
  806118:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80611b:	83 e0 01             	and    eax,0x1
  80611e:	48 85 c0             	test   rax,rax
  806121:	0f 84 e2 01 00 00    	je     806309 <copy_mmap+0x36a>
  806127:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80612a:	48 98                	cdqe   
  80612c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806133:	00 
  806134:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806138:	48 01 d0             	add    rax,rdx
  80613b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80613e:	25 80 00 00 00       	and    eax,0x80
  806143:	48 85 c0             	test   rax,rax
  806146:	0f 85 bd 01 00 00    	jne    806309 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  80614c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80614f:	48 98                	cdqe   
  806151:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806158:	00 
  806159:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80615d:	48 01 d0             	add    rax,rdx
  806160:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806163:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  806167:	b8 00 00 00 00       	mov    eax,0x0
  80616c:	e8 a1 af ff ff       	call   801112 <vmalloc>
  806171:	48 89 c2             	mov    rdx,rax
  806174:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80617b:	00 ff ff 
  80617e:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  806182:	48 89 c1             	mov    rcx,rax
  806185:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806188:	48 98                	cdqe   
  80618a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  806191:	00 
  806192:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806196:	48 01 f0             	add    rax,rsi
  806199:	48 09 ca             	or     rdx,rcx
  80619c:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80619f:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8061a6:	ff 00 00 
  8061a9:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8061ad:	48 89 c1             	mov    rcx,rax
  8061b0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8061b3:	48 98                	cdqe   
  8061b5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061bc:	00 
  8061bd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061c1:	48 01 d0             	add    rax,rdx
  8061c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061c7:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8061ce:	ff 00 00 
  8061d1:	48 21 d0             	and    rax,rdx
  8061d4:	ba 00 10 00 00       	mov    edx,0x1000
  8061d9:	48 89 ce             	mov    rsi,rcx
  8061dc:	48 89 c7             	mov    rdi,rax
  8061df:	e8 56 6c 00 00       	call   80ce3a <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  8061e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8061e7:	48 98                	cdqe   
  8061e9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061f0:	00 
  8061f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061f5:	48 01 d0             	add    rax,rdx
  8061f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061fb:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806202:	ff 00 00 
  806205:	48 21 d0             	and    rax,rdx
  806208:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  80620c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806213:	e9 e4 00 00 00       	jmp    8062fc <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  806218:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80621b:	48 98                	cdqe   
  80621d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806224:	00 
  806225:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806229:	48 01 d0             	add    rax,rdx
  80622c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80622f:	83 e0 01             	and    eax,0x1
  806232:	48 85 c0             	test   rax,rax
  806235:	0f 84 bd 00 00 00    	je     8062f8 <copy_mmap+0x359>
  80623b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80623e:	48 98                	cdqe   
  806240:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806247:	00 
  806248:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80624c:	48 01 d0             	add    rax,rdx
  80624f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806252:	25 80 00 00 00       	and    eax,0x80
  806257:	48 85 c0             	test   rax,rax
  80625a:	0f 85 98 00 00 00    	jne    8062f8 <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806260:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806263:	48 98                	cdqe   
  806265:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80626c:	00 
  80626d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806271:	48 01 d0             	add    rax,rdx
  806274:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806277:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  80627b:	b8 00 00 00 00       	mov    eax,0x0
  806280:	e8 8d ae ff ff       	call   801112 <vmalloc>
  806285:	48 89 c2             	mov    rdx,rax
  806288:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80628f:	00 ff ff 
  806292:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  806296:	48 89 c1             	mov    rcx,rax
  806299:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80629c:	48 98                	cdqe   
  80629e:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8062a5:	00 
  8062a6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8062aa:	48 01 f0             	add    rax,rsi
  8062ad:	48 09 ca             	or     rdx,rcx
  8062b0:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8062b3:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8062ba:	ff 00 00 
  8062bd:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8062c1:	48 89 c1             	mov    rcx,rax
  8062c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8062c7:	48 98                	cdqe   
  8062c9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8062d0:	00 
  8062d1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8062d5:	48 01 d0             	add    rax,rdx
  8062d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062db:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8062e2:	ff 00 00 
  8062e5:	48 21 d0             	and    rax,rdx
  8062e8:	ba 00 10 00 00       	mov    edx,0x1000
  8062ed:	48 89 ce             	mov    rsi,rcx
  8062f0:	48 89 c7             	mov    rdi,rax
  8062f3:	e8 42 6b 00 00       	call   80ce3a <memcpy>
                    for(int k=0;k<512;k++)
  8062f8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8062fc:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  806303:	0f 8e 0f ff ff ff    	jle    806218 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  806309:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80630d:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  806314:	0f 8e ea fd ff ff    	jle    806104 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  80631a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80631e:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  806325:	0f 8e ea fc ff ff    	jle    806015 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  80632b:	90                   	nop
  80632c:	90                   	nop
  80632d:	c9                   	leave  
  80632e:	c3                   	ret    

000000000080632f <getpgrp>:

pid_t getpgrp(void){
  80632f:	f3 0f 1e fa          	endbr64 
  806333:	55                   	push   rbp
  806334:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  806337:	48 8b 05 02 ef c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ef02]        # 415240 <current>
  80633e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806341:	5d                   	pop    rbp
  806342:	c3                   	ret    

0000000000806343 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  806343:	f3 0f 1e fa          	endbr64 
  806347:	55                   	push   rbp
  806348:	48 89 e5             	mov    rbp,rsp
  80634b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80634e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  806351:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806355:	75 0c                	jne    806363 <getpgid+0x20>
        return current->gpid;
  806357:	48 8b 05 e2 ee c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eee2]        # 415240 <current>
  80635e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806361:	eb 49                	jmp    8063ac <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806363:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80636a:	eb 35                	jmp    8063a1 <getpgid+0x5e>
        if(task[i].pid==pid)
  80636c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80636f:	48 98                	cdqe   
  806371:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806378:	48 05 40 85 40 00    	add    rax,0x408540
  80637e:	8b 10                	mov    edx,DWORD PTR [rax]
  806380:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806383:	39 c2                	cmp    edx,eax
  806385:	75 16                	jne    80639d <getpgid+0x5a>
            return task[i].gpid;
  806387:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80638a:	48 98                	cdqe   
  80638c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806393:	48 05 44 85 40 00    	add    rax,0x408544
  806399:	8b 00                	mov    eax,DWORD PTR [rax]
  80639b:	eb 0f                	jmp    8063ac <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80639d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8063a1:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8063a5:	7e c5                	jle    80636c <getpgid+0x29>
    }
    return -1;
  8063a7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8063ac:	5d                   	pop    rbp
  8063ad:	c3                   	ret    

00000000008063ae <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  8063ae:	f3 0f 1e fa          	endbr64 
  8063b2:	55                   	push   rbp
  8063b3:	48 89 e5             	mov    rbp,rsp
  8063b6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8063b9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8063bc:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8063c0:	75 38                	jne    8063fa <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  8063c2:	48 8b 05 77 ee c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ee77]        # 415240 <current>
  8063c9:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8063cc:	48 8b 05 6d ee c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ee6d]        # 415240 <current>
  8063d3:	8b 00                	mov    eax,DWORD PTR [rax]
  8063d5:	39 c2                	cmp    edx,eax
  8063d7:	75 0a                	jne    8063e3 <setpgid+0x35>
            return -1;
  8063d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8063de:	e9 9d 00 00 00       	jmp    806480 <setpgid+0xd2>
        current->gpid=gid;
  8063e3:	48 8b 05 56 ee c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ee56]        # 415240 <current>
  8063ea:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8063ed:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  8063f0:	b8 00 00 00 00       	mov    eax,0x0
  8063f5:	e9 86 00 00 00       	jmp    806480 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  8063fa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806401:	eb 72                	jmp    806475 <setpgid+0xc7>
        if(task[i].pid==pid)
  806403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806406:	48 98                	cdqe   
  806408:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80640f:	48 05 40 85 40 00    	add    rax,0x408540
  806415:	8b 10                	mov    edx,DWORD PTR [rax]
  806417:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80641a:	39 c2                	cmp    edx,eax
  80641c:	75 53                	jne    806471 <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  80641e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806421:	48 98                	cdqe   
  806423:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80642a:	48 05 48 85 40 00    	add    rax,0x408548
  806430:	8b 10                	mov    edx,DWORD PTR [rax]
  806432:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806435:	48 98                	cdqe   
  806437:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80643e:	48 05 40 85 40 00    	add    rax,0x408540
  806444:	8b 00                	mov    eax,DWORD PTR [rax]
  806446:	39 c2                	cmp    edx,eax
  806448:	75 07                	jne    806451 <setpgid+0xa3>
                return -1;
  80644a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80644f:	eb 2f                	jmp    806480 <setpgid+0xd2>
            task[i].gpid=gid;
  806451:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806454:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806457:	48 63 d2             	movsxd rdx,edx
  80645a:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  806461:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  806468:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  80646a:	b8 00 00 00 00       	mov    eax,0x0
  80646f:	eb 0f                	jmp    806480 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806471:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806475:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  806479:	7e 88                	jle    806403 <setpgid+0x55>
        }
    }
    return -1;
  80647b:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  806480:	5d                   	pop    rbp
  806481:	c3                   	ret    

0000000000806482 <setsid>:

pid_t setsid(void){
  806482:	f3 0f 1e fa          	endbr64 
  806486:	55                   	push   rbp
  806487:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  80648a:	48 8b 15 af ed c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0edaf]        # 415240 <current>
  806491:	48 8b 05 a8 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eda8]        # 415240 <current>
  806498:	8b 12                	mov    edx,DWORD PTR [rdx]
  80649a:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  80649d:	90                   	nop
  80649e:	5d                   	pop    rbp
  80649f:	c3                   	ret    

00000000008064a0 <getsid>:
pid_t getsid(pid_t pid){
  8064a0:	f3 0f 1e fa          	endbr64 
  8064a4:	55                   	push   rbp
  8064a5:	48 89 e5             	mov    rbp,rsp
  8064a8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  8064ab:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8064af:	75 0c                	jne    8064bd <getsid+0x1d>
        return current->sid;
  8064b1:	48 8b 05 88 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed88]        # 415240 <current>
  8064b8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8064bb:	eb 49                	jmp    806506 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8064bd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8064c4:	eb 35                	jmp    8064fb <getsid+0x5b>
        if(task[i].pid==pid)
  8064c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064c9:	48 98                	cdqe   
  8064cb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8064d2:	48 05 40 85 40 00    	add    rax,0x408540
  8064d8:	8b 10                	mov    edx,DWORD PTR [rax]
  8064da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8064dd:	39 c2                	cmp    edx,eax
  8064df:	75 16                	jne    8064f7 <getsid+0x57>
            return task[i].sid;
  8064e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064e4:	48 98                	cdqe   
  8064e6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8064ed:	48 05 48 85 40 00    	add    rax,0x408548
  8064f3:	8b 00                	mov    eax,DWORD PTR [rax]
  8064f5:	eb 0f                	jmp    806506 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8064f7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8064fb:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8064ff:	7e c5                	jle    8064c6 <getsid+0x26>
    }
    return -1;
  806501:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  806506:	5d                   	pop    rbp
  806507:	c3                   	ret    

0000000000806508 <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  806508:	f3 0f 1e fa          	endbr64 
  80650c:	55                   	push   rbp
  80650d:	48 89 e5             	mov    rbp,rsp
  806510:	48 83 ec 20          	sub    rsp,0x20
  806514:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806517:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  80651a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80651d:	ba 00 00 00 00       	mov    edx,0x0
  806522:	be 02 00 00 00       	mov    esi,0x2
  806527:	89 c7                	mov    edi,eax
  806529:	e8 3f 01 00 00       	call   80666d <sys_ioctl>
    int sid= getsid(0);//获取session id
  80652e:	bf 00 00 00 00       	mov    edi,0x0
  806533:	e8 68 ff ff ff       	call   8064a0 <getsid>
  806538:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    struct process* new_fgl=NULL;
  80653b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806542:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  806543:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80654a:	e9 9d 00 00 00       	jmp    8065ec <tcsetpgrp+0xe4>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  80654f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806552:	48 98                	cdqe   
  806554:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80655b:	48 05 58 85 40 00    	add    rax,0x408558
  806561:	8b 00                	mov    eax,DWORD PTR [rax]
  806563:	83 f8 04             	cmp    eax,0x4
  806566:	74 7f                	je     8065e7 <tcsetpgrp+0xdf>
  806568:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80656b:	48 98                	cdqe   
  80656d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806574:	48 05 58 85 40 00    	add    rax,0x408558
  80657a:	8b 00                	mov    eax,DWORD PTR [rax]
  80657c:	85 c0                	test   eax,eax
  80657e:	74 67                	je     8065e7 <tcsetpgrp+0xdf>
        if(task[i].sid==sid){
  806580:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806583:	48 98                	cdqe   
  806585:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80658c:	48 05 48 85 40 00    	add    rax,0x408548
  806592:	8b 10                	mov    edx,DWORD PTR [rax]
  806594:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806597:	39 c2                	cmp    edx,eax
  806599:	75 4d                	jne    8065e8 <tcsetpgrp+0xe0>
            task[i].fg_pgid=pgid_id;
  80659b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80659e:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8065a1:	48 63 d2             	movsxd rdx,edx
  8065a4:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  8065ab:	48 81 c2 4c 85 40 00 	add    rdx,0x40854c
  8065b2:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  8065b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065b7:	48 98                	cdqe   
  8065b9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8065c0:	48 05 40 85 40 00    	add    rax,0x408540
  8065c6:	8b 10                	mov    edx,DWORD PTR [rax]
  8065c8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065cb:	39 c2                	cmp    edx,eax
  8065cd:	75 19                	jne    8065e8 <tcsetpgrp+0xe0>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  8065cf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065d2:	48 98                	cdqe   
  8065d4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8065db:	48 05 40 85 40 00    	add    rax,0x408540
  8065e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8065e5:	eb 01                	jmp    8065e8 <tcsetpgrp+0xe0>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  8065e7:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  8065e8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8065ec:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8065f0:	0f 8e 59 ff ff ff    	jle    80654f <tcsetpgrp+0x47>
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
  8065f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065fa:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
  8065fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806601:	48 63 d2             	movsxd rdx,edx
  806604:	48 83 c2 1a          	add    rdx,0x1a
  806608:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80660d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806611:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  806615:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806619:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80661c:	48 63 d2             	movsxd rdx,edx
  80661f:	48 83 c2 1a          	add    rdx,0x1a
  806623:	48 8b 74 d0 08       	mov    rsi,QWORD PTR [rax+rdx*8+0x8]
  806628:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80662c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80662f:	48 63 d2             	movsxd rdx,edx
  806632:	48 83 c2 1a          	add    rdx,0x1a
  806636:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80663b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80663f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  806643:	b9 00 00 00 00       	mov    ecx,0x0
  806648:	ba 01 00 00 00       	mov    edx,0x1
  80664d:	48 89 c7             	mov    rdi,rax
  806650:	41 ff d0             	call   r8
    ,TTY_CONNECT,0);
}
  806653:	90                   	nop
  806654:	c9                   	leave  
  806655:	c3                   	ret    

0000000000806656 <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  806656:	f3 0f 1e fa          	endbr64 
  80665a:	55                   	push   rbp
  80665b:	48 89 e5             	mov    rbp,rsp
  80665e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  806661:	48 8b 05 d8 eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ebd8]        # 415240 <current>
  806668:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  80666b:	5d                   	pop    rbp
  80666c:	c3                   	ret    

000000000080666d <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  80666d:	f3 0f 1e fa          	endbr64 
  806671:	55                   	push   rbp
  806672:	48 89 e5             	mov    rbp,rsp
  806675:	48 83 ec 10          	sub    rsp,0x10
  806679:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80667c:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80667f:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  806683:	48 8b 05 b6 eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ebb6]        # 415240 <current>
  80668a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80668d:	48 63 d2             	movsxd rdx,edx
  806690:	48 83 c2 1a          	add    rdx,0x1a
  806694:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806699:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80669d:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  8066a1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8066a4:	48 63 d0             	movsxd rdx,eax
  8066a7:	48 8b 05 92 eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eb92]        # 415240 <current>
  8066ae:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  8066b1:	48 63 c9             	movsxd rcx,ecx
  8066b4:	48 83 c1 1a          	add    rcx,0x1a
  8066b8:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  8066bd:	48 8b 05 7c eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eb7c]        # 415240 <current>
  8066c4:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  8066c7:	48 63 c9             	movsxd rcx,ecx
  8066ca:	48 83 c1 1a          	add    rcx,0x1a
  8066ce:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  8066d3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8066d7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8066db:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8066df:	48 89 c7             	mov    rdi,rax
  8066e2:	41 ff d0             	call   r8
    ,request,args);
  8066e5:	90                   	nop
  8066e6:	c9                   	leave  
  8066e7:	c3                   	ret    
  8066e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  8066ef:	00 

00000000008066f0 <outb>:
  8066f0:	66 89 fa             	mov    dx,di
  8066f3:	66 89 f0             	mov    ax,si
  8066f6:	ee                   	out    dx,al
  8066f7:	e8 29 00 00 00       	call   806725 <io_delay>
  8066fc:	c3                   	ret    

00000000008066fd <outw>:
  8066fd:	66 89 fa             	mov    dx,di
  806700:	66 89 f0             	mov    ax,si
  806703:	66 ef                	out    dx,ax
  806705:	90                   	nop
  806706:	90                   	nop
  806707:	90                   	nop
  806708:	c3                   	ret    

0000000000806709 <inb>:
  806709:	31 c0                	xor    eax,eax
  80670b:	66 89 fa             	mov    dx,di
  80670e:	ec                   	in     al,dx
  80670f:	90                   	nop
  806710:	90                   	nop
  806711:	90                   	nop
  806712:	c3                   	ret    

0000000000806713 <inw>:
  806713:	31 c0                	xor    eax,eax
  806715:	66 89 fa             	mov    dx,di
  806718:	66 ed                	in     ax,dx
  80671a:	90                   	nop
  80671b:	90                   	nop
  80671c:	90                   	nop
  80671d:	c3                   	ret    

000000000080671e <eoi>:
  80671e:	b0 20                	mov    al,0x20
  806720:	e6 a0                	out    0xa0,al
  806722:	e6 20                	out    0x20,al
  806724:	c3                   	ret    

0000000000806725 <io_delay>:
  806725:	90                   	nop
  806726:	90                   	nop
  806727:	90                   	nop
  806728:	90                   	nop
  806729:	c3                   	ret    

000000000080672a <turn_on_int>:
  80672a:	b0 f8                	mov    al,0xf8
  80672c:	e6 21                	out    0x21,al
  80672e:	e8 f2 ff ff ff       	call   806725 <io_delay>
  806733:	b0 af                	mov    al,0xaf
  806735:	e6 a1                	out    0xa1,al
  806737:	e8 e9 ff ff ff       	call   806725 <io_delay>
  80673c:	b8 00 70 10 00       	mov    eax,0x107000
  806741:	0f 01 18             	lidt   [rax]
  806744:	90                   	nop
  806745:	90                   	nop
  806746:	90                   	nop
  806747:	90                   	nop
  806748:	c3                   	ret    

0000000000806749 <report_back_trace_of_err>:
  806749:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80674e:	50                   	push   rax
  80674f:	68 58 67 80 00       	push   0x806758
  806754:	83 c4 08             	add    esp,0x8
  806757:	c3                   	ret    

0000000000806758 <bt_msg>:
  806758:	65 72 72             	gs jb  8067cd <fill_desc+0x4e>
  80675b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80675c:	72 20                	jb     80677e <init_gdt+0x11>
  80675e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80675f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  806762:	72 73                	jb     8067d7 <fill_desc+0x58>
  806764:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  806767:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eec3e5 <_knl_end+0x2ec3e5>

000000000080676d <init_gdt>:
#include "memory.h"

descriptor *gdt=GDT_ADDR+KNL_BASE;
extern char *gdtptr;
int init_gdt()
{
  80676d:	f3 0f 1e fa          	endbr64 
  806771:	55                   	push   rbp
  806772:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  806775:	66 b8 48 00          	mov    ax,0x48
  806779:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80677c:	90                   	nop
  80677d:	5d                   	pop    rbp
  80677e:	c3                   	ret    

000000000080677f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80677f:	f3 0f 1e fa          	endbr64 
  806783:	55                   	push   rbp
  806784:	48 89 e5             	mov    rbp,rsp
  806787:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80678b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80678f:	89 d0                	mov    eax,edx
  806791:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  806794:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  806798:	48 8b 15 29 71 00 00 	mov    rdx,QWORD PTR [rip+0x7129]        # 80d8c8 <gdt>
  80679f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067a2:	48 c1 e0 04          	shl    rax,0x4
  8067a6:	48 01 d0             	add    rax,rdx
  8067a9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8067ad:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  8067b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067b5:	48 c1 e8 10          	shr    rax,0x10
  8067b9:	48 89 c1             	mov    rcx,rax
  8067bc:	48 8b 15 05 71 00 00 	mov    rdx,QWORD PTR [rip+0x7105]        # 80d8c8 <gdt>
  8067c3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067c6:	48 c1 e0 04          	shl    rax,0x4
  8067ca:	48 01 d0             	add    rax,rdx
  8067cd:	89 ca                	mov    edx,ecx
  8067cf:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  8067d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067d6:	48 c1 e8 18          	shr    rax,0x18
  8067da:	48 89 c1             	mov    rcx,rax
  8067dd:	48 8b 15 e4 70 00 00 	mov    rdx,QWORD PTR [rip+0x70e4]        # 80d8c8 <gdt>
  8067e4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067e7:	48 c1 e0 04          	shl    rax,0x4
  8067eb:	48 01 d0             	add    rax,rdx
  8067ee:	89 ca                	mov    edx,ecx
  8067f0:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  8067f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067f7:	48 c1 e8 20          	shr    rax,0x20
  8067fb:	48 89 c2             	mov    rdx,rax
  8067fe:	48 8b 0d c3 70 00 00 	mov    rcx,QWORD PTR [rip+0x70c3]        # 80d8c8 <gdt>
  806805:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806808:	48 c1 e0 04          	shl    rax,0x4
  80680c:	48 01 c8             	add    rax,rcx
  80680f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  806812:	48 8b 15 af 70 00 00 	mov    rdx,QWORD PTR [rip+0x70af]        # 80d8c8 <gdt>
  806819:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80681c:	48 c1 e0 04          	shl    rax,0x4
  806820:	48 01 d0             	add    rax,rdx
  806823:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806827:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80682a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80682e:	48 c1 e8 08          	shr    rax,0x8
  806832:	66 25 f0 00          	and    ax,0xf0
  806836:	48 8b 0d 8b 70 00 00 	mov    rcx,QWORD PTR [rip+0x708b]        # 80d8c8 <gdt>
  80683d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806840:	48 c1 e2 04          	shl    rdx,0x4
  806844:	48 01 ca             	add    rdx,rcx
  806847:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80684b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80684f:	90                   	nop
  806850:	5d                   	pop    rbp
  806851:	c3                   	ret    

0000000000806852 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  806852:	f3 0f 1e fa          	endbr64 
  806856:	55                   	push   rbp
  806857:	48 89 e5             	mov    rbp,rsp
  80685a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80685d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806860:	89 c8                	mov    eax,ecx
  806862:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  806866:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80686a:	48 8b 05 57 70 00 00 	mov    rax,QWORD PTR [rip+0x7057]        # 80d8c8 <gdt>
  806871:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  806875:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806878:	48 c1 e0 04          	shl    rax,0x4
  80687c:	48 89 c2             	mov    rdx,rax
  80687f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806883:	48 01 d0             	add    rax,rdx
  806886:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806889:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80688c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80688f:	48 c1 e0 04          	shl    rax,0x4
  806893:	48 89 c2             	mov    rdx,rax
  806896:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80689a:	48 01 d0             	add    rax,rdx
  80689d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8068a0:	c1 ea 10             	shr    edx,0x10
  8068a3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  8068a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8068a9:	48 c1 e0 04          	shl    rax,0x4
  8068ad:	48 89 c2             	mov    rdx,rax
  8068b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068b4:	48 01 c2             	add    rdx,rax
  8068b7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  8068bb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8068bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8068c2:	48 c1 e0 04          	shl    rax,0x4
  8068c6:	48 89 c2             	mov    rdx,rax
  8068c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068cd:	48 01 c2             	add    rdx,rax
  8068d0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8068d4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8068d8:	90                   	nop
  8068d9:	5d                   	pop    rbp
  8068da:	c3                   	ret    

00000000008068db <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8068db:	f3 0f 1e fa          	endbr64 
  8068df:	55                   	push   rbp
  8068e0:	48 89 e5             	mov    rbp,rsp
  8068e3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8068e6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8068e9:	89 d0                	mov    eax,edx
  8068eb:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8068ef:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8068f3:	90                   	nop
  8068f4:	5d                   	pop    rbp
  8068f5:	c3                   	ret    
  8068f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8068fd:	00 00 00 

0000000000806900 <fill_desc>:
  806900:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  806905:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80690a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80690f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  806914:	be 00 60 00 00       	mov    esi,0x6000
  806919:	c1 e2 03             	shl    edx,0x3
  80691c:	01 d6                	add    esi,edx
  80691e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  806922:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  806927:	c1 e8 10             	shr    eax,0x10
  80692a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80692e:	c1 eb 10             	shr    ebx,0x10
  806931:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  806935:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  806939:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80693d:	c3                   	ret    

000000000080693e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80693e:	f3 0f 1e fa          	endbr64 
  806942:	55                   	push   rbp
  806943:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  806946:	b8 00 00 00 00       	mov    eax,0x0
  80694b:	e8 f5 2e 00 00       	call   809845 <execute_request>
    do_req();
  806950:	b8 00 00 00 00       	mov    eax,0x0
  806955:	e8 6e d3 ff ff       	call   803cc8 <do_req>
    if(!manage_proc_lock)
  80695a:	8b 05 a8 6e 00 00    	mov    eax,DWORD PTR [rip+0x6ea8]        # 80d808 <manage_proc_lock>
  806960:	85 c0                	test   eax,eax
  806962:	75 0a                	jne    80696e <clock_c+0x30>
    {
        manage_proc();
  806964:	b8 00 00 00 00       	mov    eax,0x0
  806969:	e8 53 db ff ff       	call   8044c1 <manage_proc>
    }
    //puts("1 disk req executed.");
  80696e:	90                   	nop
  80696f:	5d                   	pop    rbp
  806970:	c3                   	ret    
  806971:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806978:	00 00 00 
  80697b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806980 <clock>:
  806980:	50                   	push   rax
  806981:	53                   	push   rbx
  806982:	51                   	push   rcx
  806983:	52                   	push   rdx
  806984:	57                   	push   rdi
  806985:	56                   	push   rsi
  806986:	41 50                	push   r8
  806988:	41 51                	push   r9
  80698a:	41 52                	push   r10
  80698c:	41 53                	push   r11
  80698e:	41 54                	push   r12
  806990:	41 55                	push   r13
  806992:	41 56                	push   r14
  806994:	41 57                	push   r15
  806996:	e8 fe da ff ff       	call   804499 <save_rsp>
  80699b:	66 8c c0             	mov    ax,es
  80699e:	50                   	push   rax
  80699f:	66 8c d8             	mov    ax,ds
  8069a2:	50                   	push   rax
  8069a3:	66 b8 10 00          	mov    ax,0x10
  8069a7:	8e c0                	mov    es,eax
  8069a9:	8e d8                	mov    ds,eax

00000000008069ab <clock.normal_part>:
  8069ab:	b0 20                	mov    al,0x20
  8069ad:	e6 a0                	out    0xa0,al
  8069af:	e6 20                	out    0x20,al
  8069b1:	e8 88 ff ff ff       	call   80693e <clock_c>
  8069b6:	58                   	pop    rax
  8069b7:	8e d8                	mov    ds,eax
  8069b9:	58                   	pop    rax
  8069ba:	8e c0                	mov    es,eax
  8069bc:	41 5f                	pop    r15
  8069be:	41 5e                	pop    r14
  8069c0:	41 5d                	pop    r13
  8069c2:	41 5c                	pop    r12
  8069c4:	41 5b                	pop    r11
  8069c6:	41 5a                	pop    r10
  8069c8:	41 59                	pop    r9
  8069ca:	41 58                	pop    r8
  8069cc:	5e                   	pop    rsi
  8069cd:	5f                   	pop    rdi
  8069ce:	5a                   	pop    rdx
  8069cf:	59                   	pop    rcx
  8069d0:	5b                   	pop    rbx
  8069d1:	58                   	pop    rax
  8069d2:	48 cf                	iretq  

00000000008069d4 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  8069d4:	f3 0f 1e fa          	endbr64 
  8069d8:	55                   	push   rbp
  8069d9:	48 89 e5             	mov    rbp,rsp
  8069dc:	48 83 ec 30          	sub    rsp,0x30
  8069e0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8069e4:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  8069e8:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  8069ef:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  8069f6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8069fa:	be 00 10 00 00       	mov    esi,0x1000
  8069ff:	48 89 c7             	mov    rdi,rax
  806a02:	e8 e6 19 00 00       	call   8083ed <sys_open>
  806a07:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  806a0a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806a0e:	79 0a                	jns    806a1a <execute+0x46>
  806a10:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a15:	e9 ba 00 00 00       	jmp    806ad4 <execute+0x100>
    //
    char *p=path;
  806a1a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806a1e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  806a22:	eb 05                	jmp    806a29 <execute+0x55>
  806a24:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  806a29:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a2d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a30:	84 c0                	test   al,al
  806a32:	75 f0                	jne    806a24 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  806a34:	eb 05                	jmp    806a3b <execute+0x67>
  806a36:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  806a3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a3f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a42:	3c 2f                	cmp    al,0x2f
  806a44:	74 0a                	je     806a50 <execute+0x7c>
  806a46:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a4a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806a4e:	77 e6                	ja     806a36 <execute+0x62>
    if(p>path)
  806a50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a54:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806a58:	76 2f                	jbe    806a89 <execute+0xb5>
    {
        *p='\0';
  806a5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a5e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  806a61:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806a65:	be 00 40 00 00       	mov    esi,0x4000
  806a6a:	48 89 c7             	mov    rdi,rax
  806a6d:	e8 7b 19 00 00       	call   8083ed <sys_open>
  806a72:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806a75:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806a79:	79 07                	jns    806a82 <execute+0xae>
  806a7b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a80:	eb 52                	jmp    806ad4 <execute+0x100>
        *p='/';
  806a82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a86:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  806a89:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a8c:	48 63 d0             	movsxd rdx,eax
  806a8f:	48 89 d0             	mov    rax,rdx
  806a92:	48 c1 e0 02          	shl    rax,0x2
  806a96:	48 01 d0             	add    rax,rdx
  806a99:	48 c1 e0 03          	shl    rax,0x3
  806a9d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  806aa4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806aa7:	48 63 c8             	movsxd rcx,eax
  806aaa:	48 89 c8             	mov    rax,rcx
  806aad:	48 c1 e0 02          	shl    rax,0x2
  806ab1:	48 01 c8             	add    rax,rcx
  806ab4:	48 c1 e0 03          	shl    rax,0x3
  806ab8:	48 05 60 06 40 00    	add    rax,0x400660
  806abe:	b9 39 6c 80 00       	mov    ecx,0x806c39
  806ac3:	48 89 c6             	mov    rsi,rax
  806ac6:	48 89 cf             	mov    rdi,rcx
  806ac9:	e8 cb e1 ff ff       	call   804c99 <reg_proc>
  806ace:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  806ad1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  806ad4:	c9                   	leave  
  806ad5:	c3                   	ret    

0000000000806ad6 <sys_execve>:

int sys_execve(char *path,char **argv){
  806ad6:	f3 0f 1e fa          	endbr64 
  806ada:	55                   	push   rbp
  806adb:	48 89 e5             	mov    rbp,rsp
  806ade:	48 83 ec 30          	sub    rsp,0x30
  806ae2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806ae6:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  806aea:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  806af1:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  806af8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806afc:	be 00 10 00 00       	mov    esi,0x1000
  806b01:	48 89 c7             	mov    rdi,rax
  806b04:	e8 e4 18 00 00       	call   8083ed <sys_open>
  806b09:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806b0c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806b10:	79 0a                	jns    806b1c <sys_execve+0x46>
  806b12:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  806b17:	e9 ad 00 00 00       	jmp    806bc9 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  806b1c:	48 8b 05 1d e7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e71d]        # 415240 <current>
  806b23:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806b2a:	48 2d 60 06 40 00    	sub    rax,0x400660
  806b30:	48 c1 f8 03          	sar    rax,0x3
  806b34:	48 89 c2             	mov    rdx,rax
  806b37:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  806b3e:	cc cc cc 
  806b41:	48 0f af c2          	imul   rax,rdx
  806b45:	89 c7                	mov    edi,eax
  806b47:	e8 38 1e 00 00       	call   808984 <sys_close>

    void *retp= load_pe;
  806b4c:	48 c7 45 f0 6b 6c 80 	mov    QWORD PTR [rbp-0x10],0x806c6b
  806b53:	00 
    current->exef=&opened[fno];//改变执行文件
  806b54:	48 8b 15 e5 e6 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e6e5]        # 415240 <current>
  806b5b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b5e:	48 63 c8             	movsxd rcx,eax
  806b61:	48 89 c8             	mov    rax,rcx
  806b64:	48 c1 e0 02          	shl    rax,0x2
  806b68:	48 01 c8             	add    rax,rcx
  806b6b:	48 c1 e0 03          	shl    rax,0x3
  806b6f:	48 05 60 06 40 00    	add    rax,0x400660
  806b75:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  806b7c:	48 8b 05 bd e6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e6bd]        # 415240 <current>
  806b83:	48 89 c7             	mov    rdi,rax
  806b86:	e8 12 f1 ff ff       	call   805c9d <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  806b8b:	48 8b 05 ae e6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e6ae]        # 415240 <current>
  806b92:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  806b99:	ff 00 00 
  806b9c:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  806ba3:	48 8b 05 16 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d16]        # 80d8c0 <tss>
  806baa:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  806bae:	48 2d a8 00 00 00    	sub    rax,0xa8
  806bb4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  806bb8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806bbc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bc0:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  806bc4:	b8 00 00 00 00       	mov    eax,0x0
}
  806bc9:	c9                   	leave  
  806bca:	c3                   	ret    

0000000000806bcb <exec_call>:
int exec_call(char *path)
{
  806bcb:	f3 0f 1e fa          	endbr64 
  806bcf:	55                   	push   rbp
  806bd0:	48 89 e5             	mov    rbp,rsp
  806bd3:	48 83 ec 20          	sub    rsp,0x20
  806bd7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  806bdb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bdf:	be 00 00 00 00       	mov    esi,0x0
  806be4:	48 89 c7             	mov    rdi,rax
  806be7:	e8 e8 fd ff ff       	call   8069d4 <execute>
  806bec:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  806bef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bf2:	01 c0                	add    eax,eax
  806bf4:	83 c0 05             	add    eax,0x5
  806bf7:	c1 e0 03             	shl    eax,0x3
  806bfa:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  806bfd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c00:	89 c7                	mov    edi,eax
  806c02:	e8 4d da ff ff       	call   804654 <switch_proc_tss>
    while(task[pi].stat != TASK_ZOMBIE);
  806c07:	90                   	nop
  806c08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c0b:	48 98                	cdqe   
  806c0d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806c14:	48 05 50 85 40 00    	add    rax,0x408550
  806c1a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806c1d:	83 f8 04             	cmp    eax,0x4
  806c20:	75 e6                	jne    806c08 <exec_call+0x3d>
    return task[pi].exit_code;
  806c22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c25:	48 98                	cdqe   
  806c27:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806c2e:	48 05 60 85 40 00    	add    rax,0x408560
  806c34:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806c37:	c9                   	leave  
  806c38:	c3                   	ret    

0000000000806c39 <proc_start>:
int proc_start()
{
  806c39:	f3 0f 1e fa          	endbr64 
  806c3d:	55                   	push   rbp
  806c3e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806c41:	8b 05 85 e6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e685]        # 4152cc <cur_proc>
  806c47:	48 98                	cdqe   
  806c49:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806c50:	48 05 40 85 40 00    	add    rax,0x408540
  806c56:	48 89 c7             	mov    rdi,rax
  806c59:	e8 0d 00 00 00       	call   806c6b <load_pe>
    //释放进程资源
    sys_exit(0);
  806c5e:	bf 00 00 00 00       	mov    edi,0x0
  806c63:	e8 fc df ff ff       	call   804c64 <sys_exit>
}
  806c68:	90                   	nop
  806c69:	5d                   	pop    rbp
  806c6a:	c3                   	ret    

0000000000806c6b <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  806c6b:	f3 0f 1e fa          	endbr64 
  806c6f:	55                   	push   rbp
  806c70:	48 89 e5             	mov    rbp,rsp
  806c73:	48 81 ec e0 02 00 00 	sub    rsp,0x2e0
  806c7a:	48 89 bd 28 fd ff ff 	mov    QWORD PTR [rbp-0x2d8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806c81:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  806c88:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806c8f:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  806c93:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806c9a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806ca1:	eb 28                	jmp    806ccb <load_pe+0x60>
        if(current->openf[i]==f)
  806ca3:	48 8b 05 96 e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e596]        # 415240 <current>
  806caa:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806cad:	48 63 d2             	movsxd rdx,edx
  806cb0:	48 83 c2 1a          	add    rdx,0x1a
  806cb4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806cb9:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  806cbd:	75 08                	jne    806cc7 <load_pe+0x5c>
        {
            exefno=i;
  806cbf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806cc2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806cc5:	eb 0a                	jmp    806cd1 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806cc7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806ccb:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806ccf:	7e d2                	jle    806ca3 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806cd1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806cd5:	75 0a                	jne    806ce1 <load_pe+0x76>
  806cd7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806cdc:	e9 3e 07 00 00       	jmp    80741f <load_pe+0x7b4>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806ce1:	48 8d 8d 60 fe ff ff 	lea    rcx,[rbp-0x1a0]
  806ce8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ceb:	ba 44 00 00 00       	mov    edx,0x44
  806cf0:	48 89 ce             	mov    rsi,rcx
  806cf3:	89 c7                	mov    edi,eax
  806cf5:	e8 42 1d 00 00       	call   808a3c <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  806cfa:	48 8b 85 9c fe ff ff 	mov    rax,QWORD PTR [rbp-0x164]
  806d01:	48 89 c1             	mov    rcx,rax
  806d04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d07:	ba 00 00 00 00       	mov    edx,0x0
  806d0c:	48 89 ce             	mov    rsi,rcx
  806d0f:	89 c7                	mov    edi,eax
  806d11:	e8 86 1e 00 00       	call   808b9c <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806d16:	48 8d 8d 50 fd ff ff 	lea    rcx,[rbp-0x2b0]
  806d1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d20:	ba 0c 01 00 00       	mov    edx,0x10c
  806d25:	48 89 ce             	mov    rsi,rcx
  806d28:	89 c7                	mov    edi,eax
  806d2a:	e8 0d 1d 00 00       	call   808a3c <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806d2f:	48 8b 85 84 fd ff ff 	mov    rax,QWORD PTR [rbp-0x27c]
  806d36:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  806d3a:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  806d40:	c1 e8 0c             	shr    eax,0xc
  806d43:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806d46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d49:	ba 00 00 00 00       	mov    edx,0x0
  806d4e:	be 00 00 00 00       	mov    esi,0x0
  806d53:	89 c7                	mov    edi,eax
  806d55:	e8 42 1e 00 00       	call   808b9c <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  806d5a:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  806d5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d61:	ba 00 10 00 00       	mov    edx,0x1000
  806d66:	48 89 ce             	mov    rsi,rcx
  806d69:	89 c7                	mov    edi,eax
  806d6b:	e8 cc 1c 00 00       	call   808a3c <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  806d70:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806d74:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  806d78:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  806d7c:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806d80:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806d84:	48 01 d0             	add    rax,rdx
  806d87:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  806d8e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806d95:	48 83 c0 04          	add    rax,0x4
  806d99:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806da0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806da7:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  806daa:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806db0:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  806db6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  806dbc:	85 c0                	test   eax,eax
  806dbe:	0f 48 c2             	cmovs  eax,edx
  806dc1:	c1 f8 0c             	sar    eax,0xc
  806dc4:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  806dca:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806dd1:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806dd4:	89 c2                	mov    edx,eax
  806dd6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806dda:	48 01 d0             	add    rax,rdx
  806ddd:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806de4:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806dea:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806df0:	85 c0                	test   eax,eax
  806df2:	0f 48 c2             	cmovs  eax,edx
  806df5:	c1 f8 0a             	sar    eax,0xa
  806df8:	89 c1                	mov    ecx,eax
  806dfa:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806e00:	99                   	cdq    
  806e01:	c1 ea 16             	shr    edx,0x16
  806e04:	01 d0                	add    eax,edx
  806e06:	25 ff 03 00 00       	and    eax,0x3ff
  806e0b:	29 d0                	sub    eax,edx
  806e0d:	01 c8                	add    eax,ecx
  806e0f:	85 c0                	test   eax,eax
  806e11:	0f 95 c0             	setne  al
  806e14:	0f b6 c0             	movzx  eax,al
  806e17:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806e1d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806e24:	48 c1 e8 15          	shr    rax,0x15
  806e28:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806e2e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806e35:	89 c0                	mov    eax,eax
  806e37:	48 05 0c 01 00 00    	add    rax,0x10c
  806e3d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806e41:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806e48:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806e4c:	0f b7 d0             	movzx  edx,ax
  806e4f:	89 d0                	mov    eax,edx
  806e51:	c1 e0 02             	shl    eax,0x2
  806e54:	01 d0                	add    eax,edx
  806e56:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806e59:	05 50 01 00 00       	add    eax,0x150
  806e5e:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806e64:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806e6b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  806e6e:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  806e74:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806e7a:	99                   	cdq    
  806e7b:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806e81:	89 d0                	mov    eax,edx
  806e83:	85 c0                	test   eax,eax
  806e85:	74 23                	je     806eaa <load_pe+0x23f>
  806e87:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806e8d:	99                   	cdq    
  806e8e:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806e94:	89 d1                	mov    ecx,edx
  806e96:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806e9c:	29 c8                	sub    eax,ecx
  806e9e:	89 c2                	mov    edx,eax
  806ea0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  806ea6:	01 d0                	add    eax,edx
  806ea8:	eb 06                	jmp    806eb0 <load_pe+0x245>
  806eaa:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806eb0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806eb6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806ebd:	eb 6b                	jmp    806f2a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  806ebf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ec3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806ec6:	25 00 00 00 02       	and    eax,0x2000000
  806ecb:	89 85 c0 fe ff ff    	mov    DWORD PTR [rbp-0x140],eax
        if(disca)
  806ed1:	83 bd c0 fe ff ff 00 	cmp    DWORD PTR [rbp-0x140],0x0
  806ed8:	75 46                	jne    806f20 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  806eda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ede:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806ee1:	89 c1                	mov    ecx,eax
  806ee3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ee6:	ba 00 00 00 00       	mov    edx,0x0
  806eeb:	48 89 ce             	mov    rsi,rcx
  806eee:	89 c7                	mov    edi,eax
  806ef0:	e8 a7 1c 00 00       	call   808b9c <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806ef5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ef9:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806efc:	89 c2                	mov    edx,eax
  806efe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f02:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806f05:	89 c1                	mov    ecx,eax
  806f07:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806f0b:	48 01 c8             	add    rax,rcx
  806f0e:	48 89 c1             	mov    rcx,rax
  806f11:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806f14:	48 89 ce             	mov    rsi,rcx
  806f17:	89 c7                	mov    edi,eax
  806f19:	e8 1e 1b 00 00       	call   808a3c <sys_read>
  806f1e:	eb 01                	jmp    806f21 <load_pe+0x2b6>
            continue;
  806f20:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806f21:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806f25:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  806f2a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f31:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806f35:	0f b7 c0             	movzx  eax,ax
  806f38:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806f3b:	7c 82                	jl     806ebf <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  806f3d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f44:	48 05 90 00 00 00    	add    rax,0x90
  806f4a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  806f51:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806f58:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806f5b:	85 c0                	test   eax,eax
  806f5d:	0f 84 7b 02 00 00    	je     8071de <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  806f63:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806f6a:	8b 10                	mov    edx,DWORD PTR [rax]
  806f6c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806f70:	01 d0                	add    eax,edx
  806f72:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  806f78:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  806f7e:	48 98                	cdqe   
  806f80:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  806f84:	e9 47 02 00 00       	jmp    8071d0 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  806f89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f8d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806f90:	89 c2                	mov    edx,eax
  806f92:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806f96:	48 01 d0             	add    rax,rdx
  806f99:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  806fa0:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  806fa7:	be bf 55 81 00       	mov    esi,0x8155bf
  806fac:	48 89 c7             	mov    rdi,rax
  806faf:	e8 24 61 00 00       	call   80d0d8 <strcmp>
  806fb4:	85 c0                	test   eax,eax
  806fb6:	75 09                	jne    806fc1 <load_pe+0x356>
            {
                dllp=0x1c00000;
  806fb8:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  806fbf:	eb 25                	jmp    806fe6 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  806fc1:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  806fc8:	48 89 c7             	mov    rdi,rax
  806fcb:	e8 9b fc ff ff       	call   806c6b <load_pe>
  806fd0:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  806fd6:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  806fdc:	89 c7                	mov    edi,eax
  806fde:	e8 3e 04 00 00       	call   807421 <get_module_addr>
  806fe3:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  806fe6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806fe9:	48 98                	cdqe   
  806feb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806ff2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ff5:	48 63 d0             	movsxd rdx,eax
  806ff8:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  806fff:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  807003:	48 01 d0             	add    rax,rdx
  807006:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80700d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  807014:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80701a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80701d:	01 d0                	add    eax,edx
  80701f:	89 c0                	mov    eax,eax
  807021:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  807028:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80702f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807032:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  807038:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80703f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  807042:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807045:	01 d0                	add    eax,edx
  807047:	89 c0                	mov    eax,eax
  807049:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  807050:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  807057:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80705a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80705d:	01 d0                	add    eax,edx
  80705f:	89 c0                	mov    eax,eax
  807061:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  807068:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80706f:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  807072:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807075:	01 d0                	add    eax,edx
  807077:	89 c0                	mov    eax,eax
  807079:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  807080:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  807087:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80708a:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  807090:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807094:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  807097:	89 c2                	mov    edx,eax
  807099:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80709d:	48 01 d0             	add    rax,rdx
  8070a0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8070a4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8070a8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8070ab:	89 c2                	mov    edx,eax
  8070ad:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070b1:	48 01 d0             	add    rax,rdx
  8070b4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8070b8:	e9 00 01 00 00       	jmp    8071bd <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8070bd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070c1:	8b 00                	mov    eax,DWORD PTR [rax]
  8070c3:	85 c0                	test   eax,eax
  8070c5:	79 43                	jns    80710a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8070c7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070cb:	8b 00                	mov    eax,DWORD PTR [rax]
  8070cd:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8070d2:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  8070d8:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8070de:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  8070e4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8070eb:	00 
  8070ec:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8070f3:	48 01 d0             	add    rax,rdx
  8070f6:	8b 10                	mov    edx,DWORD PTR [rax]
  8070f8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8070fb:	01 d0                	add    eax,edx
  8070fd:	89 c2                	mov    edx,eax
  8070ff:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807103:	89 10                	mov    DWORD PTR [rax],edx
  807105:	e9 a9 00 00 00       	jmp    8071b3 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80710a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80710e:	8b 00                	mov    eax,DWORD PTR [rax]
  807110:	89 c0                	mov    eax,eax
  807112:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  807119:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  807120:	02 
                    int i=0;
  807121:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  807128:	eb 7a                	jmp    8071a4 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80712a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80712d:	48 98                	cdqe   
  80712f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807136:	00 
  807137:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80713e:	48 01 d0             	add    rax,rdx
  807141:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807144:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80714b:	48 89 d6             	mov    rsi,rdx
  80714e:	48 89 c7             	mov    rdi,rax
  807151:	e8 82 5f 00 00       	call   80d0d8 <strcmp>
  807156:	85 c0                	test   eax,eax
  807158:	75 46                	jne    8071a0 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80715a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80715d:	48 98                	cdqe   
  80715f:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  807163:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80716a:	48 01 d0             	add    rax,rdx
  80716d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807170:	98                   	cwde   
  807171:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  807177:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80717d:	48 98                	cdqe   
  80717f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  807186:	00 
  807187:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80718e:	48 01 d0             	add    rax,rdx
  807191:	8b 10                	mov    edx,DWORD PTR [rax]
  807193:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807196:	01 d0                	add    eax,edx
  807198:	89 c2                	mov    edx,eax
  80719a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80719e:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8071a0:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8071a4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8071a7:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8071ad:	0f 8c 77 ff ff ff    	jl     80712a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8071b3:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8071b8:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8071bd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8071c1:	8b 00                	mov    eax,DWORD PTR [rax]
  8071c3:	85 c0                	test   eax,eax
  8071c5:	0f 85 f2 fe ff ff    	jne    8070bd <load_pe+0x452>
            }
            impdes++;
  8071cb:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8071d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071d4:	8b 00                	mov    eax,DWORD PTR [rax]
  8071d6:	85 c0                	test   eax,eax
  8071d8:	0f 85 ab fd ff ff    	jne    806f89 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8071de:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8071e5:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8071e6:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8071ed:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  8071f3:	85 c0                	test   eax,eax
  8071f5:	0f 84 ec 00 00 00    	je     8072e7 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8071fb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807202:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  807208:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80720c:	01 d0                	add    eax,edx
  80720e:	89 c0                	mov    eax,eax
  807210:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  807214:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807218:	48 83 c0 40          	add    rax,0x40
  80721c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  807220:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807224:	48 83 c0 02          	add    rax,0x2
  807228:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80722c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807233:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807237:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80723d:	e9 97 00 00 00       	jmp    8072d9 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  807242:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807246:	8b 10                	mov    edx,DWORD PTR [rax]
  807248:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80724c:	01 d0                	add    eax,edx
  80724e:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  807254:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80725b:	eb 5a                	jmp    8072b7 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80725d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807261:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807264:	66 85 c0             	test   ax,ax
  807267:	74 49                	je     8072b2 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  807269:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80726d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807270:	0f b7 d0             	movzx  edx,ax
  807273:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  807279:	01 d0                	add    eax,edx
  80727b:	48 98                	cdqe   
  80727d:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  807284:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  80728b:	8b 00                	mov    eax,DWORD PTR [rax]
  80728d:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  807293:	89 c2                	mov    edx,eax
  807295:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807299:	01 d0                	add    eax,edx
  80729b:	89 c2                	mov    edx,eax
  80729d:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8072a4:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8072a6:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8072ab:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8072b0:	eb 01                	jmp    8072b3 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8072b2:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8072b3:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8072b7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072bb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8072be:	c1 e8 02             	shr    eax,0x2
  8072c1:	89 c2                	mov    edx,eax
  8072c3:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8072c6:	39 c2                	cmp    edx,eax
  8072c8:	77 93                	ja     80725d <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8072ca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072ce:	05 00 10 00 00       	add    eax,0x1000
  8072d3:	48 98                	cdqe   
  8072d5:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8072d9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072dd:	8b 00                	mov    eax,DWORD PTR [rax]
  8072df:	85 c0                	test   eax,eax
  8072e1:	0f 85 5b ff ff ff    	jne    807242 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8072e7:	c7 85 30 fd ff ff 00 	mov    DWORD PTR [rbp-0x2d0],0x0
  8072ee:	00 00 00 
  8072f1:	c7 85 34 fd ff ff 00 	mov    DWORD PTR [rbp-0x2cc],0x0
  8072f8:	00 00 00 
  8072fb:	48 c7 85 38 fd ff ff 	mov    QWORD PTR [rbp-0x2c8],0x0
  807302:	00 00 00 00 
  807306:	48 c7 85 40 fd ff ff 	mov    QWORD PTR [rbp-0x2c0],0x0
  80730d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  807311:	48 8d 85 30 fd ff ff 	lea    rax,[rbp-0x2d0]
  807318:	ba 18 00 00 00       	mov    edx,0x18
  80731d:	48 89 c6             	mov    rsi,rax
  807320:	bf 00 00 00 01       	mov    edi,0x1000000
  807325:	e8 10 5b 00 00       	call   80ce3a <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80732a:	8b 05 9c df c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0df9c]        # 4152cc <cur_proc>
  807330:	48 98                	cdqe   
  807332:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807339:	48 05 60 85 40 00    	add    rax,0x408560
  80733f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  807346:	8b 05 80 df c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0df80]        # 4152cc <cur_proc>
  80734c:	48 98                	cdqe   
  80734e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807355:	48 05 60 85 40 00    	add    rax,0x408560
  80735b:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  807362:	8b 05 64 df c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0df64]        # 4152cc <cur_proc>
  807368:	48 98                	cdqe   
  80736a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807371:	48 05 60 85 40 00    	add    rax,0x408560
  807377:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80737e:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807385:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    int ecode=main(0,NULL);
  80738c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  807393:	be 00 00 00 00       	mov    esi,0x0
  807398:	bf 00 00 00 00       	mov    edi,0x0
  80739d:	ff d0                	call   rax
  80739f:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
  8073a5:	c7 85 bc fe ff ff 14 	mov    DWORD PTR [rbp-0x144],0x14
  8073ac:	00 00 00 
  8073af:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
  8073b5:	89 85 b8 fe ff ff    	mov    DWORD PTR [rbp-0x148],eax
  8073bb:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
  8073c2:	00 00 00 
  8073c5:	c7 85 b0 fe ff ff 00 	mov    DWORD PTR [rbp-0x150],0x0
  8073cc:	00 00 00 
  8073cf:	c7 85 ac fe ff ff 00 	mov    DWORD PTR [rbp-0x154],0x0
  8073d6:	00 00 00 
  8073d9:	c7 85 a8 fe ff ff 00 	mov    DWORD PTR [rbp-0x158],0x0
  8073e0:	00 00 00 
  8073e3:	c7 85 a4 fe ff ff 00 	mov    DWORD PTR [rbp-0x15c],0x0
  8073ea:	00 00 00 
    unsigned int argv;
    unsigned int argc;
}proc_ret_stack;

__attribute__((__always_inline__))inline int do_syscall(int func,int a1,int a2,int a3,int a4,int a5,int a6){
        asm volatile(".byte 0x48\n"
  8073ed:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
  8073f3:	8b bd b8 fe ff ff    	mov    edi,DWORD PTR [rbp-0x148]
  8073f9:	8b b5 b4 fe ff ff    	mov    esi,DWORD PTR [rbp-0x14c]
  8073ff:	8b 95 b0 fe ff ff    	mov    edx,DWORD PTR [rbp-0x150]
  807405:	8b 8d ac fe ff ff    	mov    ecx,DWORD PTR [rbp-0x154]
  80740b:	44 8b 85 a8 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x158]
  807412:	44 8b 8d a4 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x15c]
  807419:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
}
  80741c:	90                   	nop
    do_syscall(SYSCALL_EXIT,ecode,0,0,0,0,0);
    //
    //不应该执行到这
    while(1);
  80741d:	eb fe                	jmp    80741d <load_pe+0x7b2>
    return task[cur_proc].exit_code;
}
  80741f:	c9                   	leave  
  807420:	c3                   	ret    

0000000000807421 <get_module_addr>:

int get_module_addr(int mi)
{
  807421:	f3 0f 1e fa          	endbr64 
  807425:	55                   	push   rbp
  807426:	48 89 e5             	mov    rbp,rsp
  807429:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80742c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80742f:	48 98                	cdqe   
  807431:	8b 04 c5 e0 7e 42 00 	mov    eax,DWORD PTR [rax*8+0x427ee0]
}
  807438:	5d                   	pop    rbp
  807439:	c3                   	ret    

000000000080743a <dispose_library>:
int dispose_library(int dlln)
{
  80743a:	f3 0f 1e fa          	endbr64 
  80743e:	55                   	push   rbp
  80743f:	48 89 e5             	mov    rbp,rsp
  807442:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  807445:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807449:	78 09                	js     807454 <dispose_library+0x1a>
  80744b:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  807452:	7e 07                	jle    80745b <dispose_library+0x21>
  807454:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807459:	eb 1d                	jmp    807478 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80745b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80745e:	48 98                	cdqe   
  807460:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  807467:	48 05 e8 52 41 00    	add    rax,0x4152e8
  80746d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  807473:	b8 00 00 00 00       	mov    eax,0x0
}
  807478:	5d                   	pop    rbp
  807479:	c3                   	ret    

000000000080747a <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80747a:	f3 0f 1e fa          	endbr64 
  80747e:	55                   	push   rbp
  80747f:	48 89 e5             	mov    rbp,rsp
  807482:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  807486:	90                   	nop
  807487:	5d                   	pop    rbp
  807488:	c3                   	ret    

0000000000807489 <sys_rmmod>:
int sys_rmmod(char *name)
{
  807489:	f3 0f 1e fa          	endbr64 
  80748d:	55                   	push   rbp
  80748e:	48 89 e5             	mov    rbp,rsp
  807491:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  807495:	90                   	nop
  807496:	5d                   	pop    rbp
  807497:	c3                   	ret    
  807498:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  80749f:	00 

00000000008074a0 <_syscall>:
  8074a0:	55                   	push   rbp
  8074a1:	bd 00 80 10 00       	mov    ebp,0x108000
  8074a6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8074aa:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8074ae:	50                   	push   rax
  8074af:	53                   	push   rbx
  8074b0:	51                   	push   rcx
  8074b1:	52                   	push   rdx
  8074b2:	57                   	push   rdi
  8074b3:	56                   	push   rsi
  8074b4:	41 50                	push   r8
  8074b6:	41 51                	push   r9
  8074b8:	41 52                	push   r10
  8074ba:	41 53                	push   r11
  8074bc:	41 54                	push   r12
  8074be:	41 55                	push   r13
  8074c0:	41 56                	push   r14
  8074c2:	41 57                	push   r15
  8074c4:	66 8c c0             	mov    ax,es
  8074c7:	50                   	push   rax
  8074c8:	66 8c d8             	mov    ax,ds
  8074cb:	50                   	push   rax
  8074cc:	66 b8 10 00          	mov    ax,0x10
  8074d0:	8e c0                	mov    es,eax
  8074d2:	8e d8                	mov    ds,eax
  8074d4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8074d9:	41 53                	push   r11
  8074db:	51                   	push   rcx
  8074dc:	49 87 ca             	xchg   r10,rcx
  8074df:	e8 bb 90 ff ff       	call   80059f <syscall>
  8074e4:	4c 87 d1             	xchg   rcx,r10
  8074e7:	59                   	pop    rcx
  8074e8:	41 5b                	pop    r11
  8074ea:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  8074ef:	58                   	pop    rax
  8074f0:	8e d8                	mov    ds,eax
  8074f2:	58                   	pop    rax
  8074f3:	8e c0                	mov    es,eax
  8074f5:	41 5f                	pop    r15
  8074f7:	41 5e                	pop    r14
  8074f9:	41 5d                	pop    r13
  8074fb:	41 5c                	pop    r12
  8074fd:	41 5b                	pop    r11
  8074ff:	41 5a                	pop    r10
  807501:	41 59                	pop    r9
  807503:	41 58                	pop    r8
  807505:	5e                   	pop    rsi
  807506:	5f                   	pop    rdi
  807507:	5a                   	pop    rdx
  807508:	59                   	pop    rcx
  807509:	5b                   	pop    rbx
  80750a:	58                   	pop    rax
  80750b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80750f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  807513:	5d                   	pop    rbp
  807514:	fb                   	sti    
  807515:	48 0f 07             	sysretq 

0000000000807518 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  807518:	f3 0f 1e fa          	endbr64 
  80751c:	55                   	push   rbp
  80751d:	48 89 e5             	mov    rbp,rsp
  807520:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  807524:	8b 05 ca 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20dca]        # 4282f4 <framebuffer+0x14>
  80752a:	89 c0                	mov    eax,eax
  80752c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  807530:	8b 05 c2 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20dc2]        # 4282f8 <framebuffer+0x18>
  807536:	89 c0                	mov    eax,eax
  807538:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80753c:	0f b6 05 b9 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20db9]        # 4282fc <framebuffer+0x1c>
  807543:	c0 e8 03             	shr    al,0x3
  807546:	0f b6 c0             	movzx  eax,al
  807549:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80754d:	8b 05 9d 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d9d]        # 4282f0 <framebuffer+0x10>
  807553:	89 c0                	mov    eax,eax
  807555:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  807559:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80755d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  807562:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  807566:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80756a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80756f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  807573:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807577:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80757e:	48 85 c0             	test   rax,rax
  807581:	48 0f 48 c2          	cmovs  rax,rdx
  807585:	48 c1 f8 0c          	sar    rax,0xc
  807589:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80758c:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807593:	80 ff ff 
  807596:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t pp=framebuffer.common.framebuffer_addr;
  80759a:	48 8b 05 47 0d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20d47]        # 4282e8 <framebuffer+0x8>
  8075a1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8075a5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8075ac:	00 
  8075ad:	eb 37                	jmp    8075e6 <init_framebuffer+0xce>
    {
        smmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,PML4_ADDR);
  8075af:	48 8b 75 f8          	mov    rsi,QWORD PTR [rbp-0x8]
  8075b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8075b7:	48 ba 00 10 10 00 00 	movabs rdx,0xffff800000101000
  8075be:	80 ff ff 
  8075c1:	48 89 d1             	mov    rcx,rdx
  8075c4:	ba 07 00 00 00       	mov    edx,0x7
  8075c9:	48 89 c7             	mov    rdi,rax
  8075cc:	e8 f1 98 ff ff       	call   800ec2 <smmap>
        pp+=PAGE_SIZE;
  8075d1:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8075d8:	00 
        p+=PAGE_SIZE;
  8075d9:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8075e0:	00 
    for (size_t i = 0; i < pgc; i++)
  8075e1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8075e6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8075e9:	48 98                	cdqe   
  8075eb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8075ef:	7c be                	jl     8075af <init_framebuffer+0x97>
    }
    
    
}
  8075f1:	90                   	nop
  8075f2:	90                   	nop
  8075f3:	c9                   	leave  
  8075f4:	c3                   	ret    

00000000008075f5 <init_font>:
void init_font(){
  8075f5:	f3 0f 1e fa          	endbr64 
  8075f9:	55                   	push   rbp
  8075fa:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) (_binary_res_font_psf_start+KNL_BASE);
  8075fd:	48 b8 48 dc 80 00 00 	movabs rax,0xffff80000080dc48
  807604:	80 ff ff 
  807607:	48 89 05 12 0d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20d12],rax        # 428320 <boot_font>

    font_width_bytes = (boot_font->width + 7) / 8;
  80760e:	48 8b 05 0b 0d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20d0b]        # 428320 <boot_font>
  807615:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  807618:	83 c0 07             	add    eax,0x7
  80761b:	c1 e8 03             	shr    eax,0x3
  80761e:	89 05 0c 0d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20d0c],eax        # 428330 <font_width_bytes>
    font_width = font_width_bytes * 8;
  807624:	8b 05 06 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d06]        # 428330 <font_width_bytes>
  80762a:	c1 e0 03             	shl    eax,0x3
  80762d:	89 05 f5 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20cf5],eax        # 428328 <font_width>
    font_height = boot_font->height;
  807633:	48 8b 05 e6 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ce6]        # 428320 <boot_font>
  80763a:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80763d:	89 05 e9 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20ce9],eax        # 42832c <font_height>

    glyph_table = (u8*)(_binary_res_font_psf_start+KNL_BASE)+boot_font->header_size;
  807643:	48 8b 05 d6 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20cd6]        # 428320 <boot_font>
  80764a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80764d:	89 c2                	mov    edx,eax
  80764f:	48 b8 00 00 00 00 00 	movabs rax,0xffff800000000000
  807656:	80 ff ff 
  807659:	48 01 d0             	add    rax,rdx
  80765c:	48 05 48 dc 80 00    	add    rax,0x80dc48
  807662:	48 89 05 cf 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ccf],rax        # 428338 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  807669:	48 8b 05 b0 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20cb0]        # 428320 <boot_font>
  807670:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  807673:	89 05 cb 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20ccb],eax        # 428344 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  807679:	48 8b 05 a0 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ca0]        # 428320 <boot_font>
  807680:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  807683:	89 05 b7 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20cb7],eax        # 428340 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  807689:	c7 05 7d 0c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20c7d],0x0        # 428310 <fb_cursor_y>
  807690:	00 00 00 
  807693:	8b 05 77 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c77]        # 428310 <fb_cursor_y>
  807699:	89 05 6d 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c6d],eax        # 42830c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80769f:	8b 05 4f 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c4f]        # 4282f4 <framebuffer+0x14>
  8076a5:	8b 0d 7d 0c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20c7d]        # 428328 <font_width>
  8076ab:	ba 00 00 00 00       	mov    edx,0x0
  8076b0:	f7 f1                	div    ecx
  8076b2:	89 05 5c 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c5c],eax        # 428314 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8076b8:	8b 05 3a 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c3a]        # 4282f8 <framebuffer+0x18>
  8076be:	8b 35 68 0c c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20c68]        # 42832c <font_height>
  8076c4:	ba 00 00 00 00       	mov    edx,0x0
  8076c9:	f7 f6                	div    esi
  8076cb:	89 05 47 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c47],eax        # 428318 <max_ch_nr_y>
    font_size=1;
  8076d1:	c7 05 05 62 00 00 01 	mov    DWORD PTR [rip+0x6205],0x1        # 80d8e0 <font_size>
  8076d8:	00 00 00 
}
  8076db:	90                   	nop
  8076dc:	5d                   	pop    rbp
  8076dd:	c3                   	ret    

00000000008076de <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8076de:	f3 0f 1e fa          	endbr64 
  8076e2:	55                   	push   rbp
  8076e3:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8076e6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8076ea:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8076ee:	48 89 05 eb 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20beb],rax        # 4282e0 <framebuffer>
  8076f5:	48 89 15 ec 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20bec],rdx        # 4282e8 <framebuffer+0x8>
  8076fc:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  807700:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  807704:	48 89 05 e5 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20be5],rax        # 4282f0 <framebuffer+0x10>
  80770b:	48 89 15 e6 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20be6],rdx        # 4282f8 <framebuffer+0x18>
  807712:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  807716:	48 89 05 e3 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20be3],rax        # 428300 <framebuffer+0x20>
}
  80771d:	90                   	nop
  80771e:	5d                   	pop    rbp
  80771f:	c3                   	ret    

0000000000807720 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  807720:	f3 0f 1e fa          	endbr64 
  807724:	55                   	push   rbp
  807725:	48 89 e5             	mov    rbp,rsp
  807728:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80772b:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  80772e:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  807731:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  807734:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  807738:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  80773f:	80 ff ff 
  807742:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  807746:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807749:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80774c:	eb 6c                	jmp    8077ba <fill_rect+0x9a>
        for(int px=y;px<w+y;px++){
  80774e:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  807751:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  807754:	eb 53                	jmp    8077a9 <fill_rect+0x89>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807756:	8b 15 94 0b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20b94]        # 4282f0 <framebuffer+0x10>
  80775c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80775f:	0f af c2             	imul   eax,edx
  807762:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  807764:	0f b6 05 91 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b91]        # 4282fc <framebuffer+0x1c>
  80776b:	0f b6 c0             	movzx  eax,al
  80776e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807772:	8d 50 07             	lea    edx,[rax+0x7]
  807775:	85 c0                	test   eax,eax
  807777:	0f 48 c2             	cmovs  eax,edx
  80777a:	c1 f8 03             	sar    eax,0x3
  80777d:	48 98                	cdqe   
  80777f:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807783:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  80778a:	80 ff ff 
  80778d:	48 01 d0             	add    rax,rdx
  807790:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  807794:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807798:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  80779c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077a0:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8077a3:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  8077a5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077a9:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8077ac:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8077af:	01 d0                	add    eax,edx
  8077b1:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8077b4:	7c a0                	jl     807756 <fill_rect+0x36>
    for(int py=x;py<h+x;py++){
  8077b6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8077ba:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  8077bd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8077c0:	01 d0                	add    eax,edx
  8077c2:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8077c5:	7c 87                	jl     80774e <fill_rect+0x2e>
        }
    }
}
  8077c7:	90                   	nop
  8077c8:	90                   	nop
  8077c9:	5d                   	pop    rbp
  8077ca:	c3                   	ret    

00000000008077cb <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8077cb:	f3 0f 1e fa          	endbr64 
  8077cf:	55                   	push   rbp
  8077d0:	48 89 e5             	mov    rbp,rsp
  8077d3:	48 83 ec 30          	sub    rsp,0x30
  8077d7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8077da:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8077dd:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8077e0:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8077e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8077e7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8077ea:	eb 5a                	jmp    807846 <draw_text+0x7b>
    {
        if(*str=='\n')
  8077ec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077f3:	3c 0a                	cmp    al,0xa
  8077f5:	75 1c                	jne    807813 <draw_text+0x48>
        {
            y+=font_height*size;
  8077f7:	8b 15 2f 0b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20b2f]        # 42832c <font_height>
  8077fd:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807800:	0f af d0             	imul   edx,eax
  807803:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807806:	01 d0                	add    eax,edx
  807808:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  80780b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80780e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807811:	eb 2e                	jmp    807841 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  807813:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807817:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80781a:	0f be c8             	movsx  ecx,al
  80781d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  807820:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  807823:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807826:	89 c7                	mov    edi,eax
  807828:	e8 28 00 00 00       	call   807855 <draw_letter>
            tx+=size*font_width;
  80782d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  807830:	8b 05 f2 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20af2]        # 428328 <font_width>
  807836:	0f af d0             	imul   edx,eax
  807839:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80783c:	01 d0                	add    eax,edx
  80783e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  807841:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  807846:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80784a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80784d:	84 c0                	test   al,al
  80784f:	75 9b                	jne    8077ec <draw_text+0x21>
    }
}
  807851:	90                   	nop
  807852:	90                   	nop
  807853:	c9                   	leave  
  807854:	c3                   	ret    

0000000000807855 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  807855:	f3 0f 1e fa          	endbr64 
  807859:	55                   	push   rbp
  80785a:	48 89 e5             	mov    rbp,rsp
  80785d:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  807860:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  807863:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  807866:	89 c8                	mov    eax,ecx
  807868:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  80786b:	48 8b 05 c6 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ac6]        # 428338 <glyph_table>
  807872:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  807876:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  80787a:	8b 05 c4 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ac4]        # 428344 <glyph_nr>
  807880:	39 c2                	cmp    edx,eax
  807882:	73 13                	jae    807897 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  807884:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807888:	8b 05 b2 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ab2]        # 428340 <bytes_per_glyph>
  80788e:	0f af c2             	imul   eax,edx
  807891:	89 c0                	mov    eax,eax
  807893:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807897:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80789e:	e9 d3 00 00 00       	jmp    807976 <draw_letter+0x121>
        u8 mask = 1 << 7;
  8078a3:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8078a7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8078ae:	e9 a4 00 00 00       	jmp    807957 <draw_letter+0x102>
            int px=x+ch_x*size;
  8078b3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8078b6:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8078ba:	89 c2                	mov    edx,eax
  8078bc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8078bf:	01 d0                	add    eax,edx
  8078c1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8078c4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8078c7:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8078cb:	89 c2                	mov    edx,eax
  8078cd:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8078d0:	01 d0                	add    eax,edx
  8078d2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8078d5:	8b 15 15 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20a15]        # 4282f0 <framebuffer+0x10>
  8078db:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8078de:	0f af c2             	imul   eax,edx
  8078e1:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  8078e3:	0f b6 05 12 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a12]        # 4282fc <framebuffer+0x1c>
  8078ea:	0f b6 c0             	movzx  eax,al
  8078ed:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  8078f1:	8d 50 07             	lea    edx,[rax+0x7]
  8078f4:	85 c0                	test   eax,eax
  8078f6:	0f 48 c2             	cmovs  eax,edx
  8078f9:	c1 f8 03             	sar    eax,0x3
  8078fc:	48 98                	cdqe   
  8078fe:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  807902:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807909:	80 ff ff 
  80790c:	48 01 d0             	add    rax,rdx
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80790f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  807913:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807916:	c1 e8 03             	shr    eax,0x3
  807919:	89 c2                	mov    edx,eax
  80791b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80791f:	48 01 d0             	add    rax,rdx
  807922:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807925:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  807928:	84 c0                	test   al,al
  80792a:	74 0c                	je     807938 <draw_letter+0xe3>
                *ptr=-1;
  80792c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807930:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  807936:	eb 0a                	jmp    807942 <draw_letter+0xed>
            } else {
                *ptr=0;
  807938:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80793c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  807942:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  807945:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807948:	83 e0 07             	and    eax,0x7
  80794b:	85 c0                	test   eax,eax
  80794d:	75 04                	jne    807953 <draw_letter+0xfe>
                mask = 1 << 7;
  80794f:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  807953:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807957:	8b 05 cb 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209cb]        # 428328 <font_width>
  80795d:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807960:	0f 82 4d ff ff ff    	jb     8078b3 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  807966:	8b 05 c4 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209c4]        # 428330 <font_width_bytes>
  80796c:	89 c0                	mov    eax,eax
  80796e:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807972:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807976:	8b 05 b0 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209b0]        # 42832c <font_height>
  80797c:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80797f:	0f 82 1e ff ff ff    	jb     8078a3 <draw_letter+0x4e>
    }
}
  807985:	90                   	nop
  807986:	90                   	nop
  807987:	5d                   	pop    rbp
  807988:	c3                   	ret    

0000000000807989 <scr_up>:
//向上滚动一个像素
void scr_up(){
  807989:	f3 0f 1e fa          	endbr64 
  80798d:	55                   	push   rbp
  80798e:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807991:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807998:	eb 79                	jmp    807a13 <scr_up+0x8a>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  80799a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8079a1:	eb 5f                	jmp    807a02 <scr_up+0x79>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  8079a3:	8b 15 47 09 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20947]        # 4282f0 <framebuffer+0x10>
  8079a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8079ac:	0f af c2             	imul   eax,edx
  8079af:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  8079b1:	0f b6 05 44 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20944]        # 4282fc <framebuffer+0x1c>
  8079b8:	0f b6 c0             	movzx  eax,al
  8079bb:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8079bf:	8d 50 07             	lea    edx,[rax+0x7]
  8079c2:	85 c0                	test   eax,eax
  8079c4:	0f 48 c2             	cmovs  eax,edx
  8079c7:	c1 f8 03             	sar    eax,0x3
  8079ca:	48 98                	cdqe   
  8079cc:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  8079d0:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  8079d7:	80 ff ff 
  8079da:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+
  8079dd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  8079e1:	8b 05 09 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20909]        # 4282f0 <framebuffer+0x10>
  8079e7:	89 c2                	mov    edx,eax
  8079e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079ed:	48 01 d0             	add    rax,rdx
  8079f0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8079f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079f7:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  8079f9:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  8079fe:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807a02:	8b 15 ec 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc208ec]        # 4282f4 <framebuffer+0x14>
  807a08:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a0b:	39 c2                	cmp    edx,eax
  807a0d:	77 94                	ja     8079a3 <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807a0f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807a13:	8b 05 df 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc208df]        # 4282f8 <framebuffer+0x18>
  807a19:	8d 50 ff             	lea    edx,[rax-0x1]
  807a1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a1f:	39 c2                	cmp    edx,eax
  807a21:	0f 87 73 ff ff ff    	ja     80799a <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  807a27:	90                   	nop
  807a28:	90                   	nop
  807a29:	5d                   	pop    rbp
  807a2a:	c3                   	ret    

0000000000807a2b <scr_down>:
void scr_down(){
  807a2b:	f3 0f 1e fa          	endbr64 
  807a2f:	55                   	push   rbp
  807a30:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807a33:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  807a3a:	eb 7a                	jmp    807ab6 <scr_down+0x8b>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807a3c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807a43:	eb 60                	jmp    807aa5 <scr_down+0x7a>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807a45:	8b 15 a5 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc208a5]        # 4282f0 <framebuffer+0x10>
  807a4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a4e:	0f af c2             	imul   eax,edx
  807a51:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  807a53:	0f b6 05 a2 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208a2]        # 4282fc <framebuffer+0x1c>
  807a5a:	0f b6 c0             	movzx  eax,al
  807a5d:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807a61:	8d 50 07             	lea    edx,[rax+0x7]
  807a64:	85 c0                	test   eax,eax
  807a66:	0f 48 c2             	cmovs  eax,edx
  807a69:	c1 f8 03             	sar    eax,0x3
  807a6c:	48 98                	cdqe   
  807a6e:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  807a72:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807a79:	80 ff ff 
  807a7c:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807a7f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  807a83:	8b 05 67 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20867]        # 4282f0 <framebuffer+0x10>
  807a89:	89 c0                	mov    eax,eax
  807a8b:	48 f7 d8             	neg    rax
  807a8e:	48 89 c2             	mov    rdx,rax
  807a91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a95:	48 01 d0             	add    rax,rdx
  807a98:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807a9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a9f:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807aa1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807aa5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807aa8:	8b 05 66 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20866]        # 428314 <max_ch_nr_x>
  807aae:	39 c2                	cmp    edx,eax
  807ab0:	72 93                	jb     807a45 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807ab2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807ab6:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807ab9:	8b 05 59 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20859]        # 428318 <max_ch_nr_y>
  807abf:	39 c2                	cmp    edx,eax
  807ac1:	0f 82 75 ff ff ff    	jb     807a3c <scr_down+0x11>
        }

    }
}
  807ac7:	90                   	nop
  807ac8:	90                   	nop
  807ac9:	5d                   	pop    rbp
  807aca:	c3                   	ret    

0000000000807acb <print>:
void print(char* s){
  807acb:	f3 0f 1e fa          	endbr64 
  807acf:	55                   	push   rbp
  807ad0:	48 89 e5             	mov    rbp,rsp
  807ad3:	48 83 ec 08          	sub    rsp,0x8
  807ad7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  807adb:	e9 c4 00 00 00       	jmp    807ba4 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  807ae0:	8b 15 26 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20826]        # 42830c <fb_cursor_x>
  807ae6:	8b 05 28 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20828]        # 428314 <max_ch_nr_x>
  807aec:	39 c2                	cmp    edx,eax
  807aee:	77 0b                	ja     807afb <print+0x30>
  807af0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807af4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807af7:	3c 0a                	cmp    al,0xa
  807af9:	75 19                	jne    807b14 <print+0x49>
        {
            fb_cursor_y+=1;
  807afb:	8b 05 0f 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2080f]        # 428310 <fb_cursor_y>
  807b01:	83 c0 01             	add    eax,0x1
  807b04:	89 05 06 08 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20806],eax        # 428310 <fb_cursor_y>
            fb_cursor_x=0;
  807b0a:	c7 05 f8 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc207f8],0x0        # 42830c <fb_cursor_x>
  807b11:	00 00 00 
        }
        if(*s=='\n')continue;
  807b14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b1b:	3c 0a                	cmp    al,0xa
  807b1d:	74 7f                	je     807b9e <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  807b1f:	8b 05 f3 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207f3]        # 428318 <max_ch_nr_y>
  807b25:	8d 50 ff             	lea    edx,[rax-0x1]
  807b28:	8b 05 e2 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207e2]        # 428310 <fb_cursor_y>
  807b2e:	39 c2                	cmp    edx,eax
  807b30:	77 0a                	ja     807b3c <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  807b32:	c7 05 d4 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc207d4],0x0        # 428310 <fb_cursor_y>
  807b39:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  807b3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b43:	0f be d0             	movsx  edx,al
  807b46:	8b 05 94 5d 00 00    	mov    eax,DWORD PTR [rip+0x5d94]        # 80d8e0 <font_size>
  807b4c:	8b 35 be 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc207be]        # 428310 <fb_cursor_y>
  807b52:	8b 0d d4 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc207d4]        # 42832c <font_height>
  807b58:	0f af ce             	imul   ecx,esi
  807b5b:	8b 35 7f 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d7f]        # 80d8e0 <font_size>
  807b61:	0f af ce             	imul   ecx,esi
  807b64:	41 89 c8             	mov    r8d,ecx
  807b67:	8b 35 9f 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2079f]        # 42830c <fb_cursor_x>
  807b6d:	8b 0d b5 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc207b5]        # 428328 <font_width>
  807b73:	0f af ce             	imul   ecx,esi
  807b76:	8b 35 64 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d64]        # 80d8e0 <font_size>
  807b7c:	0f af ce             	imul   ecx,esi
  807b7f:	89 cf                	mov    edi,ecx
  807b81:	89 d1                	mov    ecx,edx
  807b83:	89 c2                	mov    edx,eax
  807b85:	44 89 c6             	mov    esi,r8d
  807b88:	e8 c8 fc ff ff       	call   807855 <draw_letter>
        fb_cursor_x+=1;
  807b8d:	8b 05 79 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20779]        # 42830c <fb_cursor_x>
  807b93:	83 c0 01             	add    eax,0x1
  807b96:	89 05 70 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20770],eax        # 42830c <fb_cursor_x>
  807b9c:	eb 01                	jmp    807b9f <print+0xd4>
        if(*s=='\n')continue;
  807b9e:	90                   	nop
    for(;*s;s++){
  807b9f:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  807ba4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ba8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bab:	84 c0                	test   al,al
  807bad:	0f 85 2d ff ff ff    	jne    807ae0 <print+0x15>
    }
}
  807bb3:	90                   	nop
  807bb4:	90                   	nop
  807bb5:	c9                   	leave  
  807bb6:	c3                   	ret    

0000000000807bb7 <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  807bb7:	f3 0f 1e fa          	endbr64 
  807bbb:	55                   	push   rbp
  807bbc:	48 89 e5             	mov    rbp,rsp
  807bbf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807bc3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  807bc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bcb:	48 c7 40 20 00 d9 80 	mov    QWORD PTR [rax+0x20],0x80d900
  807bd2:	00 
    filp->f_ops=&framebuffer_fops;
  807bd3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bd7:	48 c7 40 18 00 d9 80 	mov    QWORD PTR [rax+0x18],0x80d900
  807bde:	00 
    return 1;
  807bdf:	b8 01 00 00 00       	mov    eax,0x1
}
  807be4:	5d                   	pop    rbp
  807be5:	c3                   	ret    

0000000000807be6 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  807be6:	f3 0f 1e fa          	endbr64 
  807bea:	55                   	push   rbp
  807beb:	48 89 e5             	mov    rbp,rsp
  807bee:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807bf2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  807bf6:	90                   	nop
  807bf7:	5d                   	pop    rbp
  807bf8:	c3                   	ret    

0000000000807bf9 <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807bf9:	f3 0f 1e fa          	endbr64 
  807bfd:	55                   	push   rbp
  807bfe:	48 89 e5             	mov    rbp,rsp
  807c01:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807c05:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807c09:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807c0d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807c11:	90                   	nop
  807c12:	5d                   	pop    rbp
  807c13:	c3                   	ret    

0000000000807c14 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807c14:	f3 0f 1e fa          	endbr64 
  807c18:	55                   	push   rbp
  807c19:	48 89 e5             	mov    rbp,rsp
  807c1c:	48 83 ec 40          	sub    rsp,0x40
  807c20:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  807c24:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  807c28:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  807c2c:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  807c30:	b8 00 00 00 00       	mov    eax,0x0
  807c35:	e8 d8 94 ff ff       	call   801112 <vmalloc>
  807c3a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  807c3e:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807c42:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  807c49:	01 10 00 
  807c4c:	48 89 c8             	mov    rax,rcx
  807c4f:	48 f7 e2             	mul    rdx
  807c52:	48 89 c8             	mov    rax,rcx
  807c55:	48 29 d0             	sub    rax,rdx
  807c58:	48 d1 e8             	shr    rax,1
  807c5b:	48 01 d0             	add    rax,rdx
  807c5e:	48 c1 e8 0b          	shr    rax,0xb
  807c62:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  807c65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<(c?c:1);i++){
  807c6c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807c73:	eb 46                	jmp    807cbb <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807c75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c78:	48 63 d0             	movsxd rdx,eax
  807c7b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807c7f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807c83:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c87:	ba ff 0f 00 00       	mov    edx,0xfff
  807c8c:	48 89 ce             	mov    rsi,rcx
  807c8f:	48 89 c7             	mov    rdi,rax
  807c92:	e8 a3 51 00 00       	call   80ce3a <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807c97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c9b:	48 05 ff 0f 00 00    	add    rax,0xfff
  807ca1:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807ca4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ca8:	48 89 c7             	mov    rdi,rax
  807cab:	e8 1b fe ff ff       	call   807acb <print>
        p+=PAGE_4K_SIZE-1;
  807cb0:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<(c?c:1);i++){
  807cb7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807cbb:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807cbf:	74 05                	je     807cc6 <write_framebuffer+0xb2>
  807cc1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807cc4:	eb 05                	jmp    807ccb <write_framebuffer+0xb7>
  807cc6:	b8 01 00 00 00       	mov    eax,0x1
  807ccb:	3b 45 f8             	cmp    eax,DWORD PTR [rbp-0x8]
  807cce:	7f a5                	jg     807c75 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  807cd0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807cd4:	48 89 c7             	mov    rdi,rax
  807cd7:	e8 d6 94 ff ff       	call   8011b2 <vmfree>
    return 0;
  807cdc:	b8 00 00 00 00       	mov    eax,0x0
}
  807ce1:	c9                   	leave  
  807ce2:	c3                   	ret    

0000000000807ce3 <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  807ce3:	f3 0f 1e fa          	endbr64 
  807ce7:	55                   	push   rbp
  807ce8:	48 89 e5             	mov    rbp,rsp
  807ceb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807cef:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807cf3:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807cf7:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807cfb:	90                   	nop
  807cfc:	5d                   	pop    rbp
  807cfd:	c3                   	ret    

0000000000807cfe <path_walk>:
#include "log.h"
#include "mem.h"
#include "str.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  807cfe:	f3 0f 1e fa          	endbr64 
  807d02:	55                   	push   rbp
  807d03:	48 89 e5             	mov    rbp,rsp
  807d06:	48 83 ec 70          	sub    rsp,0x70
  807d0a:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807d0e:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
    char * tmpname = NULL;
  807d12:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807d19:	00 
    int tmpnamelen = 0;
  807d1a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  807d21:	48 8b 05 20 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20620]        # 428348 <root_sb>
  807d28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d2b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  807d2f:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807d36:	00 

    while(*name == '/')
  807d37:	eb 05                	jmp    807d3e <path_walk+0x40>
        name++;
  807d39:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
    while(*name == '/')
  807d3e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d45:	3c 2f                	cmp    al,0x2f
  807d47:	74 f0                	je     807d39 <path_walk+0x3b>

    if(!*name)
  807d49:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d50:	84 c0                	test   al,al
  807d52:	75 09                	jne    807d5d <path_walk+0x5f>
    {
        return parent;
  807d54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d58:	e9 92 02 00 00       	jmp    807fef <path_walk+0x2f1>
    }

    for(;;)
    {
        tmpname = name;
  807d5d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d61:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  807d65:	eb 05                	jmp    807d6c <path_walk+0x6e>
            name++;
  807d67:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name && (*name != '/'))
  807d6c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d70:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d73:	84 c0                	test   al,al
  807d75:	74 0b                	je     807d82 <path_walk+0x84>
  807d77:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d7e:	3c 2f                	cmp    al,0x2f
  807d80:	75 e5                	jne    807d67 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  807d82:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d86:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807d8a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807d8d:	be 00 00 00 00       	mov    esi,0x0
  807d92:	bf 58 00 00 00       	mov    edi,0x58
  807d97:	b8 00 00 00 00       	mov    eax,0x0
  807d9c:	e8 71 93 ff ff       	call   801112 <vmalloc>
  807da1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807da5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807da9:	ba 58 00 00 00       	mov    edx,0x58
  807dae:	be 00 00 00 00       	mov    esi,0x0
  807db3:	48 89 c7             	mov    rdi,rax
  807db6:	e8 2e 51 00 00       	call   80cee9 <memset>

        path->name = vmalloc();
  807dbb:	b8 00 00 00 00       	mov    eax,0x0
  807dc0:	e8 4d 93 ff ff       	call   801112 <vmalloc>
  807dc5:	48 89 c2             	mov    rdx,rax
  807dc8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807dcc:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807dcf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807dd2:	83 c0 01             	add    eax,0x1
  807dd5:	89 c2                	mov    edx,eax
  807dd7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ddb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807dde:	be 00 00 00 00       	mov    esi,0x0
  807de3:	48 89 c7             	mov    rdi,rax
  807de6:	e8 fe 50 00 00       	call   80cee9 <memset>
        memcpy(path->name,tmpname,tmpnamelen);
  807deb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807dee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807df2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807df5:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807df9:	48 89 ce             	mov    rsi,rcx
  807dfc:	48 89 c7             	mov    rdi,rax
  807dff:	e8 36 50 00 00       	call   80ce3a <memcpy>
        path->name_length = tmpnamelen;
  807e04:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e08:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807e0b:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
  807e0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e12:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807e16:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807e1a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807e1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e22:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807e26:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  807e2a:	48 89 d6             	mov    rsi,rdx
  807e2d:	48 89 c7             	mov    rdi,rax
  807e30:	ff d1                	call   rcx
  807e32:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        if(path == NULL)
  807e36:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807e3b:	75 3e                	jne    807e7b <path_walk+0x17d>
        {
            printf("can not find file or dir:%s\n",path->name);
  807e3d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e41:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807e44:	48 89 c6             	mov    rsi,rax
  807e47:	bf c7 55 81 00       	mov    edi,0x8155c7
  807e4c:	b8 00 00 00 00       	mov    eax,0x0
  807e51:	e8 21 8f ff ff       	call   800d77 <printf>
            vmfree(path->name);
  807e56:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e5a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807e5d:	48 89 c7             	mov    rdi,rax
  807e60:	e8 4d 93 ff ff       	call   8011b2 <vmfree>
            vmfree(path);
  807e65:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e69:	48 89 c7             	mov    rdi,rax
  807e6c:	e8 41 93 ff ff       	call   8011b2 <vmfree>
            return NULL;
  807e71:	b8 00 00 00 00       	mov    eax,0x0
  807e76:	e9 74 01 00 00       	jmp    807fef <path_walk+0x2f1>
        }

//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
        path->parent = parent;
  807e7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e7f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807e83:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
        //对于/dev这样的文件夹，lookup返回的就是链表里的dentry，data会一样
        list_add(&parent->subdirs_list,&path->child_node);
  807e87:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e8b:	48 83 c0 10          	add    rax,0x10
  807e8f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807e93:	48 83 c2 28          	add    rdx,0x28
  807e97:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807e9b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(entry->next==NULL)
  807e9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807ea3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ea7:	48 85 c0             	test   rax,rax
  807eaa:	75 58                	jne    807f04 <path_walk+0x206>
  807eac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807eb0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  807eb4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807eb8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    new->next = entry->next;
  807ebc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ec0:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807ec4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ec8:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  807ecc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ed0:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807ed4:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  807ed7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807edb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807edf:	48 85 c0             	test   rax,rax
  807ee2:	74 0f                	je     807ef3 <path_walk+0x1f5>
        new->next->prev = new;
  807ee4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ee8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807eec:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807ef0:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807ef3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ef7:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807efb:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  807eff:	e9 9c 00 00 00       	jmp    807fa0 <path_walk+0x2a2>
        struct List* p=entry;
  807f04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807f08:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        for(;p->next&&p->next!=p;p=p->next){
  807f0c:	eb 21                	jmp    807f2f <path_walk+0x231>
            if(p->data==new->data)
  807f0e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f12:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807f16:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807f1a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807f1e:	48 39 c2             	cmp    rdx,rax
  807f21:	74 7c                	je     807f9f <path_walk+0x2a1>
        for(;p->next&&p->next!=p;p=p->next){
  807f23:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f27:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f2b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  807f2f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f33:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f37:	48 85 c0             	test   rax,rax
  807f3a:	74 0e                	je     807f4a <path_walk+0x24c>
  807f3c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f40:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f44:	48 39 45 b8          	cmp    QWORD PTR [rbp-0x48],rax
  807f48:	75 c4                	jne    807f0e <path_walk+0x210>
  807f4a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f4e:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  807f52:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807f56:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    new->next = entry->next;
  807f5a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807f5e:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807f62:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807f66:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  807f6a:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807f6e:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  807f72:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  807f75:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807f79:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f7d:	48 85 c0             	test   rax,rax
  807f80:	74 0f                	je     807f91 <path_walk+0x293>
        new->next->prev = new;
  807f82:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807f86:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f8a:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807f8e:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807f91:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807f95:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807f99:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  807f9d:	eb 01                	jmp    807fa0 <path_walk+0x2a2>
                return;
  807f9f:	90                   	nop

        if(!*name)
  807fa0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807fa4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807fa7:	84 c0                	test   al,al
  807fa9:	74 2a                	je     807fd5 <path_walk+0x2d7>
            goto last_component;
        while(*name == '/')
  807fab:	eb 05                	jmp    807fb2 <path_walk+0x2b4>
            name++;
  807fad:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name == '/')
  807fb2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807fb6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807fb9:	3c 2f                	cmp    al,0x2f
  807fbb:	74 f0                	je     807fad <path_walk+0x2af>
        if(!*name)
  807fbd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807fc1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807fc4:	84 c0                	test   al,al
  807fc6:	74 10                	je     807fd8 <path_walk+0x2da>
            goto last_slash;

        parent = path;
  807fc8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807fcc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        tmpname = name;
  807fd0:	e9 88 fd ff ff       	jmp    807d5d <path_walk+0x5f>
            goto last_component;
  807fd5:	90                   	nop
  807fd6:	eb 01                	jmp    807fd9 <path_walk+0x2db>
            goto last_slash;
  807fd8:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  807fd9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807fdd:	83 e0 01             	and    eax,0x1
  807fe0:	48 85 c0             	test   rax,rax
  807fe3:	74 06                	je     807feb <path_walk+0x2ed>
    {
        return parent;
  807fe5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807fe9:	eb 04                	jmp    807fef <path_walk+0x2f1>
    }

    return path;
  807feb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  807fef:	c9                   	leave  
  807ff0:	c3                   	ret    

0000000000807ff1 <fill_dentry>:


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  807ff1:	f3 0f 1e fa          	endbr64 
  807ff5:	55                   	push   rbp
  807ff6:	48 89 e5             	mov    rbp,rsp
  807ff9:	48 83 ec 40          	sub    rsp,0x40
  807ffd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808001:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808005:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  808009:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  80800d:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
    struct dirent* dent = (struct dirent*)buf;
  808011:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808015:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if((unsigned long)buf < PAGE_4K_SIZE)
  808019:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80801d:	48 3d ff 0f 00 00    	cmp    rax,0xfff
  808023:	77 07                	ja     80802c <fill_dentry+0x3b>
        return -EFAULT;
  808025:	b8 eb ff ff ff       	mov    eax,0xffffffeb
  80802a:	eb 47                	jmp    808073 <fill_dentry+0x82>

    memcpy(name,dent->d_name,namelen);
  80802c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808030:	89 c2                	mov    edx,eax
  808032:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808036:	48 8d 48 18          	lea    rcx,[rax+0x18]
  80803a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80803e:	48 89 ce             	mov    rsi,rcx
  808041:	48 89 c7             	mov    rdi,rax
  808044:	e8 f1 4d 00 00       	call   80ce3a <memcpy>
    dent->d_namelen = namelen;
  808049:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80804d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808051:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    dent->d_type = type;
  808055:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808059:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80805d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    dent->d_offset = offset;
  808061:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808065:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808069:	48 89 10             	mov    QWORD PTR [rax],rdx
    return sizeof(struct dirent) + namelen;
  80806c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808070:	83 c0 18             	add    eax,0x18
}
  808073:	c9                   	leave  
  808074:	c3                   	ret    

0000000000808075 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  808075:	f3 0f 1e fa          	endbr64 
  808079:	55                   	push   rbp
  80807a:	48 89 e5             	mov    rbp,rsp
  80807d:	48 83 ec 30          	sub    rsp,0x30
  808081:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808085:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808089:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  80808d:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808094:	00 

    for(p = &filesystem;p;p = p->next)
  808095:	48 c7 45 f8 40 d9 80 	mov    QWORD PTR [rbp-0x8],0x80d940
  80809c:	00 
  80809d:	eb 40                	jmp    8080df <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  80809f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8080a6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8080aa:	48 89 d6             	mov    rsi,rdx
  8080ad:	48 89 c7             	mov    rdi,rax
  8080b0:	e8 23 50 00 00       	call   80d0d8 <strcmp>
  8080b5:	85 c0                	test   eax,eax
  8080b7:	75 1a                	jne    8080d3 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  8080b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080bd:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8080c1:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8080c5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8080c9:	48 89 d6             	mov    rsi,rdx
  8080cc:	48 89 c7             	mov    rdi,rax
  8080cf:	ff d1                	call   rcx
  8080d1:	eb 18                	jmp    8080eb <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  8080d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080d7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8080df:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8080e4:	75 b9                	jne    80809f <mount_fs+0x2a>
        }
    return 0;
  8080e6:	b8 00 00 00 00       	mov    eax,0x0
}
  8080eb:	c9                   	leave  
  8080ec:	c3                   	ret    

00000000008080ed <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  8080ed:	f3 0f 1e fa          	endbr64 
  8080f1:	55                   	push   rbp
  8080f2:	48 89 e5             	mov    rbp,rsp
  8080f5:	48 83 ec 20          	sub    rsp,0x20
  8080f9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8080fd:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808104:	00 

    for(p = &filesystem;p;p = p->next)
  808105:	48 c7 45 f8 40 d9 80 	mov    QWORD PTR [rbp-0x8],0x80d940
  80810c:	00 
  80810d:	eb 30                	jmp    80813f <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  80810f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808113:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808116:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80811a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80811d:	48 89 d6             	mov    rsi,rdx
  808120:	48 89 c7             	mov    rdi,rax
  808123:	e8 b0 4f 00 00       	call   80d0d8 <strcmp>
  808128:	85 c0                	test   eax,eax
  80812a:	75 07                	jne    808133 <register_filesystem+0x46>
            return 0;
  80812c:	b8 00 00 00 00       	mov    eax,0x0
  808131:	eb 32                	jmp    808165 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  808133:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808137:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80813b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80813f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808144:	75 c9                	jne    80810f <register_filesystem+0x22>

    fs->next = filesystem.next;
  808146:	48 8b 15 0b 58 00 00 	mov    rdx,QWORD PTR [rip+0x580b]        # 80d958 <filesystem+0x18>
  80814d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808151:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  808155:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808159:	48 89 05 f8 57 00 00 	mov    QWORD PTR [rip+0x57f8],rax        # 80d958 <filesystem+0x18>

    return 1;
  808160:	b8 01 00 00 00       	mov    eax,0x1
}
  808165:	c9                   	leave  
  808166:	c3                   	ret    

0000000000808167 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  808167:	f3 0f 1e fa          	endbr64 
  80816b:	55                   	push   rbp
  80816c:	48 89 e5             	mov    rbp,rsp
  80816f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  808173:	48 c7 45 f8 40 d9 80 	mov    QWORD PTR [rbp-0x8],0x80d940
  80817a:	00 

    while(p->next)
  80817b:	eb 41                	jmp    8081be <unregister_filesystem+0x57>
        if(p->next == fs)
  80817d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808181:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808185:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  808189:	75 27                	jne    8081b2 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  80818b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80818f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808193:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  808197:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80819b:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  80819f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081a3:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8081aa:	00 
            return 1;
  8081ab:	b8 01 00 00 00       	mov    eax,0x1
  8081b0:	eb 1e                	jmp    8081d0 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  8081b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081b6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8081ba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  8081be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081c2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8081c6:	48 85 c0             	test   rax,rax
  8081c9:	75 b2                	jne    80817d <unregister_filesystem+0x16>
    return 0;
  8081cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8081d0:	5d                   	pop    rbp
  8081d1:	c3                   	ret    

00000000008081d2 <root_lookup>:
//在parent inode下查找dest dentry
struct dir_entry* root_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry){
  8081d2:	f3 0f 1e fa          	endbr64 
  8081d6:	55                   	push   rbp
  8081d7:	48 89 e5             	mov    rbp,rsp
  8081da:	48 83 ec 30          	sub    rsp,0x30
  8081de:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8081e2:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    struct dir_entry* tmp= (struct dir_entry *) parent_inode->private_index_info;
  8081e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8081ea:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8081ee:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    struct List* p= tmp->subdirs_list.next;
  8081f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8081f6:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8081fa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  8081fe:	eb 47                	jmp    808247 <root_lookup+0x75>
        struct dir_entry* dp=p->data;
  808200:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808204:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808208:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        if(strcmp(dp->name,dest_dentry->name)==0){
  80820c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808210:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808213:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808217:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80821a:	48 89 d6             	mov    rsi,rdx
  80821d:	48 89 c7             	mov    rdi,rax
  808220:	e8 b3 4e 00 00       	call   80d0d8 <strcmp>
  808225:	85 c0                	test   eax,eax
  808227:	75 12                	jne    80823b <root_lookup+0x69>
            vmfree(dest_dentry);
  808229:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80822d:	48 89 c7             	mov    rdi,rax
  808230:	e8 7d 8f ff ff       	call   8011b2 <vmfree>
            return dp;
  808235:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808239:	eb 24                	jmp    80825f <root_lookup+0x8d>
        }
        p=p->next;
  80823b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80823f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808243:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  808247:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80824c:	75 b2                	jne    808200 <root_lookup+0x2e>
    }
    vmfree(dest_dentry);
  80824e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808252:	48 89 c7             	mov    rdi,rax
  808255:	e8 58 8f ff ff       	call   8011b2 <vmfree>
    return NULL;
  80825a:	b8 00 00 00 00       	mov    eax,0x0
}
  80825f:	c9                   	leave  
  808260:	c3                   	ret    

0000000000808261 <mount_rootfs>:
struct index_node_operations root_iops={
    .lookup=root_lookup
};
void mount_rootfs(){
  808261:	f3 0f 1e fa          	endbr64 
  808265:	55                   	push   rbp
  808266:	48 89 e5             	mov    rbp,rsp
  808269:	48 83 ec 20          	sub    rsp,0x20
    root_sb=(struct super_block*)vmalloc();
  80826d:	b8 00 00 00 00       	mov    eax,0x0
  808272:	e8 9b 8e ff ff       	call   801112 <vmalloc>
  808277:	48 89 05 ca 00 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc200ca],rax        # 428348 <root_sb>
    root_sb->root=root_sb+1;//紧凑跟在后面
  80827e:	48 8b 15 c3 00 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc200c3]        # 428348 <root_sb>
  808285:	48 8b 05 bc 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc200bc]        # 428348 <root_sb>
  80828c:	48 83 c2 18          	add    rdx,0x18
  808290:	48 89 10             	mov    QWORD PTR [rax],rdx
    root_sb->sb_ops=NULL;
  808293:	48 8b 05 ae 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc200ae]        # 428348 <root_sb>
  80829a:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  8082a1:	00 
    struct index_node* ir=root_sb->root+1;
  8082a2:	48 8b 05 9f 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2009f]        # 428348 <root_sb>
  8082a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082ac:	48 83 c0 58          	add    rax,0x58
  8082b0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    root_sb->root->dir_inode=ir;
  8082b4:	48 8b 05 8d 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2008d]        # 428348 <root_sb>
  8082bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082be:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8082c2:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    ir->sb=root_sb;
  8082c6:	48 8b 15 7b 00 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2007b]        # 428348 <root_sb>
  8082cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082d1:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ir->attribute=FS_ATTR_DIR;
  8082d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082d9:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8082e0:	00 
    ir->file_size=0;
  8082e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082e5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    ir->inode_ops=&root_iops;//lookup函数是必要的
  8082ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082f0:	48 c7 40 28 60 d9 80 	mov    QWORD PTR [rax+0x28],0x80d960
  8082f7:	00 
    ir->f_ops=NULL;
  8082f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082fc:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  808303:	00 
    ir->private_index_info=root_sb->root;
  808304:	48 8b 05 3d 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2003d]        # 428348 <root_sb>
  80830b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80830e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808312:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    root_sb->root->name=ir+1;//紧凑跟在后面
  808316:	48 8b 05 2b 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2002b]        # 428348 <root_sb>
  80831d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808320:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808324:	48 83 c2 38          	add    rdx,0x38
  808328:	48 89 10             	mov    QWORD PTR [rax],rdx
    strcpy(root_sb->root->name,"/");
  80832b:	48 8b 05 16 00 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20016]        # 428348 <root_sb>
  808332:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808335:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808338:	be ef 55 81 00       	mov    esi,0x8155ef
  80833d:	48 89 c7             	mov    rdi,rax
  808340:	e8 f3 4b 00 00       	call   80cf38 <strcpy>
    root_sb->root->name_length=1;
  808345:	48 8b 05 fc ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fffc]        # 428348 <root_sb>
  80834c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80834f:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1
    root_sb->root->parent=root_sb->root;
  808356:	48 8b 15 eb ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ffeb]        # 428348 <root_sb>
  80835d:	48 8b 05 e4 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffe4]        # 428348 <root_sb>
  808364:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808367:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80836a:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_init(&root_sb->root->subdirs_list);
  80836e:	48 8b 05 d3 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffd3]        # 428348 <root_sb>
  808375:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808378:	48 83 c0 28          	add    rax,0x28
  80837c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    list->prev = NULL;
  808380:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808384:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80838b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80838f:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808396:	00 
}
  808397:	90                   	nop
    list_init(&root_sb->root->child_node);
  808398:	48 8b 05 a9 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffa9]        # 428348 <root_sb>
  80839f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083a2:	48 83 c0 10          	add    rax,0x10
  8083a6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    list->prev = NULL;
  8083aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8083ae:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8083b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8083b9:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8083c0:	00 
}
  8083c1:	90                   	nop

}
  8083c2:	90                   	nop
  8083c3:	c9                   	leave  
  8083c4:	c3                   	ret    

00000000008083c5 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  8083c5:	f3 0f 1e fa          	endbr64 
  8083c9:	55                   	push   rbp
  8083ca:	48 89 e5             	mov    rbp,rsp
  8083cd:	48 83 ec 10          	sub    rsp,0x10
  8083d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  8083d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083d9:	48 89 c7             	mov    rdi,rax
  8083dc:	b8 00 00 00 00       	mov    eax,0x0
  8083e1:	e8 91 89 ff ff       	call   800d77 <printf>
    return 0;
  8083e6:	b8 00 00 00 00       	mov    eax,0x0
}
  8083eb:	c9                   	leave  
  8083ec:	c3                   	ret    

00000000008083ed <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8083ed:	f3 0f 1e fa          	endbr64 
  8083f1:	55                   	push   rbp
  8083f2:	48 89 e5             	mov    rbp,rsp
  8083f5:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  8083fc:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808403:	89 b5 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],esi
    char * path = NULL;
  808409:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808410:	00 
    long pathlen = 0;
  808411:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808418:	00 
    long error = 0;
  808419:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808420:	00 
    struct dir_entry * dentry = NULL;
  808421:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808428:	00 
    struct file * filp = NULL;
  808429:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  808430:	00 
    struct file ** f = NULL;
  808431:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808438:	00 
    int fd = -1;
  808439:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  808440:	b8 00 00 00 00       	mov    eax,0x0
  808445:	e8 c8 8c ff ff       	call   801112 <vmalloc>
  80844a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    if(path == NULL)
  80844e:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808453:	75 0c                	jne    808461 <sys_open+0x74>
        return -ENOMEM;
  808455:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80845c:	e9 21 05 00 00       	jmp    808982 <sys_open+0x595>
    memset(path,0,PAGE_4K_SIZE);
  808461:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808465:	ba 00 10 00 00       	mov    edx,0x1000
  80846a:	be 00 00 00 00       	mov    esi,0x0
  80846f:	48 89 c7             	mov    rdi,rax
  808472:	e8 72 4a 00 00       	call   80cee9 <memset>
    pathlen = strlen(filename);
  808477:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  80847e:	48 89 c7             	mov    rdi,rax
  808481:	e8 d1 4c 00 00       	call   80d157 <strlen>
  808486:	48 98                	cdqe   
  808488:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(pathlen <= 0)
  80848c:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  808491:	7f 18                	jg     8084ab <sys_open+0xbe>
    {
        vmfree(path);
  808493:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808497:	48 89 c7             	mov    rdi,rax
  80849a:	e8 13 8d ff ff       	call   8011b2 <vmfree>
        return -EFAULT;
  80849f:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8084a6:	e9 d7 04 00 00       	jmp    808982 <sys_open+0x595>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8084ab:	48 81 7d d0 ff 0f 00 	cmp    QWORD PTR [rbp-0x30],0xfff
  8084b2:	00 
  8084b3:	7e 18                	jle    8084cd <sys_open+0xe0>
    {
        vmfree(path);
  8084b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8084b9:	48 89 c7             	mov    rdi,rax
  8084bc:	e8 f1 8c ff ff       	call   8011b2 <vmfree>
        return -ENAMETOOLONG;
  8084c1:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8084c8:	e9 b5 04 00 00       	jmp    808982 <sys_open+0x595>
    }
    strcpy(path,filename);
  8084cd:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  8084d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8084d8:	48 89 d6             	mov    rsi,rdx
  8084db:	48 89 c7             	mov    rdi,rax
  8084de:	e8 55 4a 00 00       	call   80cf38 <strcpy>

    dentry = path_walk(path,0);
  8084e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8084e7:	be 00 00 00 00       	mov    esi,0x0
  8084ec:	48 89 c7             	mov    rdi,rax
  8084ef:	e8 0a f8 ff ff       	call   807cfe <path_walk>
  8084f4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    if(dentry == NULL){
  8084f8:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8084fd:	0f 85 70 02 00 00    	jne    808773 <sys_open+0x386>
        if(!flags&O_CREAT)
            return -ENOENT;
        //创建文件
        //找到上一级目录
        char* p=path+strlen(path)-1;
  808503:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808507:	48 89 c7             	mov    rdi,rax
  80850a:	e8 48 4c 00 00       	call   80d157 <strlen>
  80850f:	48 98                	cdqe   
  808511:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  808515:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808519:	48 01 d0             	add    rax,rdx
  80851c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(;*p!='/'&&p>path;p--);
  808520:	eb 05                	jmp    808527 <sys_open+0x13a>
  808522:	48 83 6d e0 01       	sub    QWORD PTR [rbp-0x20],0x1
  808527:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80852b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80852e:	3c 2f                	cmp    al,0x2f
  808530:	74 0a                	je     80853c <sys_open+0x14f>
  808532:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808536:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  80853a:	77 e6                	ja     808522 <sys_open+0x135>
        *p='\0';
  80853c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808540:	c6 00 00             	mov    BYTE PTR [rax],0x0
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
  808543:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808547:	be 00 40 00 00       	mov    esi,0x4000
  80854c:	48 89 c7             	mov    rdi,rax
  80854f:	e8 aa f7 ff ff       	call   807cfe <path_walk>
  808554:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        if(parent==NULL)
  808558:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80855d:	75 0c                	jne    80856b <sys_open+0x17e>
            return -ENOENT;//上级目录也不在
  80855f:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  808566:	e9 17 04 00 00       	jmp    808982 <sys_open+0x595>
        //创建新的文件
        dentry=(struct dir_entry*)vmalloc();
  80856b:	b8 00 00 00 00       	mov    eax,0x0
  808570:	e8 9d 8b ff ff       	call   801112 <vmalloc>
  808575:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        list_init(&dentry->subdirs_list);
  808579:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80857d:	48 83 c0 28          	add    rax,0x28
  808581:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    list->prev = NULL;
  808588:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80858f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808596:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80859d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8085a4:	00 
}
  8085a5:	90                   	nop
        list_init(&dentry->child_node);
  8085a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085aa:	48 83 c0 10          	add    rax,0x10
  8085ae:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    list->prev = NULL;
  8085b5:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8085bc:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8085c3:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8085ca:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8085d1:	00 
}
  8085d2:	90                   	nop
        dentry->child_node.data=dentry;
  8085d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085d7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8085db:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
        list_add(&parent->subdirs_list,&dentry->child_node);
  8085df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085e3:	48 83 c0 10          	add    rax,0x10
  8085e7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8085eb:	48 83 c2 28          	add    rdx,0x28
  8085ef:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
  8085f3:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    if(entry->next==NULL)
  8085f7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8085fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8085ff:	48 85 c0             	test   rax,rax
  808602:	75 58                	jne    80865c <sys_open+0x26f>
  808604:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808608:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80860c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808610:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    new->next = entry->next;
  808614:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808618:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80861c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808620:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  808624:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808628:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  80862c:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80862f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808633:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808637:	48 85 c0             	test   rax,rax
  80863a:	74 0f                	je     80864b <sys_open+0x25e>
        new->next->prev = new;
  80863c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808640:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808644:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  808648:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80864b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80864f:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  808653:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  808657:	e9 9c 00 00 00       	jmp    8086f8 <sys_open+0x30b>
        struct List* p=entry;
  80865c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808660:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
        for(;p->next&&p->next!=p;p=p->next){
  808664:	eb 21                	jmp    808687 <sys_open+0x29a>
            if(p->data==new->data)
  808666:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80866a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80866e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808672:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808676:	48 39 c2             	cmp    rdx,rax
  808679:	74 7c                	je     8086f7 <sys_open+0x30a>
        for(;p->next&&p->next!=p;p=p->next){
  80867b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80867f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808683:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808687:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80868b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80868f:	48 85 c0             	test   rax,rax
  808692:	74 0e                	je     8086a2 <sys_open+0x2b5>
  808694:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808698:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80869c:	48 39 45 90          	cmp    QWORD PTR [rbp-0x70],rax
  8086a0:	75 c4                	jne    808666 <sys_open+0x279>
  8086a2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8086a6:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  8086aa:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8086ae:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  8086b2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8086b6:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8086ba:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8086be:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8086c2:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8086c6:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  8086ca:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8086cd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8086d1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8086d5:	48 85 c0             	test   rax,rax
  8086d8:	74 0f                	je     8086e9 <sys_open+0x2fc>
        new->next->prev = new;
  8086da:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8086de:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8086e2:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8086e6:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8086e9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8086ed:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8086f1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8086f5:	eb 01                	jmp    8086f8 <sys_open+0x30b>
                return;
  8086f7:	90                   	nop
        dentry->parent=parent;
  8086f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086fc:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808700:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        dentry->dir_inode=dentry+1;//放在后面
  808704:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808708:	48 8d 50 58          	lea    rdx,[rax+0x58]
  80870c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808710:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
        dentry->dir_inode->file_size=0;
  808714:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808718:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80871c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
  808723:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808727:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80872b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80872f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808733:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
  808737:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        dentry->dir_inode->inode_ops=parent->dir_inode->inode_ops;
  80873b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80873f:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  808743:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808747:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80874b:	48 8b 52 28          	mov    rdx,QWORD PTR [rdx+0x28]
  80874f:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
        dentry->dir_ops=parent->dir_ops;
  808753:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808757:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80875b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80875f:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
        //这样的创建文件只能创建普通文件，设备文件要通过devman创建
        dentry->dir_inode->attribute=FS_ATTR_FILE;
  808763:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808767:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80876b:	48 c7 40 10 01 00 00 	mov    QWORD PTR [rax+0x10],0x1
  808772:	00 
    }
    vmfree(path);
  808773:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808777:	48 89 c7             	mov    rdi,rax
  80877a:	e8 33 8a ff ff       	call   8011b2 <vmfree>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  80877f:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808785:	25 00 40 00 00       	and    eax,0x4000
  80878a:	85 c0                	test   eax,eax
  80878c:	74 1e                	je     8087ac <sys_open+0x3bf>
  80878e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808792:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808796:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80879a:	48 83 f8 02          	cmp    rax,0x2
  80879e:	74 0c                	je     8087ac <sys_open+0x3bf>
        return -ENOTDIR;
  8087a0:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8087a7:	e9 d6 01 00 00       	jmp    808982 <sys_open+0x595>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8087ac:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8087b2:	25 00 40 00 00       	and    eax,0x4000
  8087b7:	85 c0                	test   eax,eax
  8087b9:	75 1e                	jne    8087d9 <sys_open+0x3ec>
  8087bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087bf:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8087c3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087c7:	48 83 f8 02          	cmp    rax,0x2
  8087cb:	75 0c                	jne    8087d9 <sys_open+0x3ec>
        return -EISDIR;
  8087cd:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  8087d4:	e9 a9 01 00 00       	jmp    808982 <sys_open+0x595>

    filp = (struct file *)vmalloc();
  8087d9:	b8 00 00 00 00       	mov    eax,0x0
  8087de:	e8 2f 89 ff ff       	call   801112 <vmalloc>
  8087e3:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    memset(filp,0,sizeof(struct file));
  8087e7:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087eb:	ba 28 00 00 00       	mov    edx,0x28
  8087f0:	be 00 00 00 00       	mov    esi,0x0
  8087f5:	48 89 c7             	mov    rdi,rax
  8087f8:	e8 ec 46 00 00       	call   80cee9 <memset>
    filp->dentry = dentry;
  8087fd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808801:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  808805:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  808809:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  80880f:	48 63 d0             	movsxd rdx,eax
  808812:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808816:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
  80881a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80881e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808822:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808826:	83 e0 04             	and    eax,0x4
  808829:	48 85 c0             	test   rax,rax
  80882c:	74 0e                	je     80883c <sys_open+0x44f>
        extern struct file_operations dev_dir_fops;
        filp->f_ops = &dev_dir_fops;	//////	find device file operation function
  80882e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808832:	48 c7 40 18 80 d8 80 	mov    QWORD PTR [rax+0x18],0x80d880
  808839:	00 
  80883a:	eb 14                	jmp    808850 <sys_open+0x463>
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80883c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808840:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808844:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  808848:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80884c:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  808850:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808854:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808858:	48 85 c0             	test   rax,rax
  80885b:	74 33                	je     808890 <sys_open+0x4a3>
  80885d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808861:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808865:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808868:	48 85 c0             	test   rax,rax
  80886b:	74 23                	je     808890 <sys_open+0x4a3>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  80886d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808871:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808875:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808878:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80887c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808880:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808884:	48 89 d6             	mov    rsi,rdx
  808887:	48 89 c7             	mov    rdi,rax
  80888a:	ff d1                	call   rcx
  80888c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  808890:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808895:	74 18                	je     8088af <sys_open+0x4c2>
    {
        vmfree(filp);
  808897:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80889b:	48 89 c7             	mov    rdi,rax
  80889e:	e8 0f 89 ff ff       	call   8011b2 <vmfree>
        return -EFAULT;
  8088a3:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8088aa:	e9 d3 00 00 00       	jmp    808982 <sys_open+0x595>
    }

    if(filp->mode & O_TRUNC)
  8088af:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088b3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8088b7:	25 00 02 00 00       	and    eax,0x200
  8088bc:	48 85 c0             	test   rax,rax
  8088bf:	74 13                	je     8088d4 <sys_open+0x4e7>
    {
        filp->dentry->dir_inode->file_size = 0;
  8088c1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088c5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088c9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088cd:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8088d4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088d8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8088dc:	25 00 04 00 00       	and    eax,0x400
  8088e1:	48 85 c0             	test   rax,rax
  8088e4:	74 19                	je     8088ff <sys_open+0x512>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8088e6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088ea:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088ee:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088f2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8088f5:	48 89 c2             	mov    rdx,rax
  8088f8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088fc:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8088ff:	48 8b 05 3a c9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c93a]        # 415240 <current>
  808906:	48 05 d8 00 00 00    	add    rax,0xd8
  80890c:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    for(i = 0;i < MAX_TASKS;i++)
  808910:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  808917:	eb 28                	jmp    808941 <sys_open+0x554>
        if(f[i] == NULL)
  808919:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80891c:	48 98                	cdqe   
  80891e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  808925:	00 
  808926:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80892a:	48 01 d0             	add    rax,rdx
  80892d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808930:	48 85 c0             	test   rax,rax
  808933:	75 08                	jne    80893d <sys_open+0x550>
        {
            fd = i;
  808935:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808938:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            break;
  80893b:	eb 0a                	jmp    808947 <sys_open+0x55a>
    for(i = 0;i < MAX_TASKS;i++)
  80893d:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808941:	83 7d e8 1f          	cmp    DWORD PTR [rbp-0x18],0x1f
  808945:	7e d2                	jle    808919 <sys_open+0x52c>
        }
    if(i == MAX_TASKS)
  808947:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
  80894b:	75 15                	jne    808962 <sys_open+0x575>
    {
        vmfree(filp);
  80894d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808951:	48 89 c7             	mov    rdi,rax
  808954:	e8 59 88 ff ff       	call   8011b2 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  808959:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  808960:	eb 20                	jmp    808982 <sys_open+0x595>
    }
    f[fd] = filp;
  808962:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808965:	48 98                	cdqe   
  808967:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80896e:	00 
  80896f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808973:	48 01 c2             	add    rdx,rax
  808976:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80897a:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  80897d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808980:	48 98                	cdqe   
}
  808982:	c9                   	leave  
  808983:	c3                   	ret    

0000000000808984 <sys_close>:

unsigned long sys_close(int fd)
{
  808984:	f3 0f 1e fa          	endbr64 
  808988:	55                   	push   rbp
  808989:	48 89 e5             	mov    rbp,rsp
  80898c:	48 83 ec 20          	sub    rsp,0x20
  808990:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  808993:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80899a:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80899b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80899f:	78 06                	js     8089a7 <sys_close+0x23>
  8089a1:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8089a5:	7e 0c                	jle    8089b3 <sys_close+0x2f>
        return -EBADF;
  8089a7:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8089ae:	e9 87 00 00 00       	jmp    808a3a <sys_close+0xb6>

    filp = current->openf[fd];
  8089b3:	48 8b 05 86 c8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c886]        # 415240 <current>
  8089ba:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8089bd:	48 63 d2             	movsxd rdx,edx
  8089c0:	48 83 c2 1a          	add    rdx,0x1a
  8089c4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8089c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8089cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089d1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089d5:	48 85 c0             	test   rax,rax
  8089d8:	74 35                	je     808a0f <sys_close+0x8b>
  8089da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089de:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089e2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8089e6:	48 85 c0             	test   rax,rax
  8089e9:	74 24                	je     808a0f <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  8089eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089ef:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089f3:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8089f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8089ff:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808a03:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808a07:	48 89 d6             	mov    rsi,rdx
  808a0a:	48 89 c7             	mov    rdi,rax
  808a0d:	ff d1                	call   rcx

    vmfree(filp);
  808a0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a13:	48 89 c7             	mov    rdi,rax
  808a16:	e8 97 87 ff ff       	call   8011b2 <vmfree>
    current->openf[fd] = NULL;
  808a1b:	48 8b 05 1e c8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c81e]        # 415240 <current>
  808a22:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808a25:	48 63 d2             	movsxd rdx,edx
  808a28:	48 83 c2 1a          	add    rdx,0x1a
  808a2c:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  808a33:	00 00 

    return 0;
  808a35:	b8 00 00 00 00       	mov    eax,0x0
}
  808a3a:	c9                   	leave  
  808a3b:	c3                   	ret    

0000000000808a3c <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  808a3c:	f3 0f 1e fa          	endbr64 
  808a40:	55                   	push   rbp
  808a41:	48 89 e5             	mov    rbp,rsp
  808a44:	48 83 ec 30          	sub    rsp,0x30
  808a48:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808a4b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808a4f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808a53:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808a5a:	00 
    unsigned long ret = 0;
  808a5b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808a62:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808a63:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808a67:	78 06                	js     808a6f <sys_read+0x33>
  808a69:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808a6d:	7e 09                	jle    808a78 <sys_read+0x3c>
        return -EBADF;
  808a6f:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808a76:	eb 72                	jmp    808aea <sys_read+0xae>
    if(count < 0)
  808a78:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808a7d:	79 09                	jns    808a88 <sys_read+0x4c>
        return -EINVAL;
  808a7f:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808a86:	eb 62                	jmp    808aea <sys_read+0xae>

    filp = current->openf[fd];
  808a88:	48 8b 05 b1 c7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c7b1]        # 415240 <current>
  808a8f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808a92:	48 63 d2             	movsxd rdx,edx
  808a95:	48 83 c2 1a          	add    rdx,0x1a
  808a99:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808a9e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  808aa2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808aa6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808aaa:	48 85 c0             	test   rax,rax
  808aad:	74 37                	je     808ae6 <sys_read+0xaa>
  808aaf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808ab3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ab7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808abb:	48 85 c0             	test   rax,rax
  808abe:	74 26                	je     808ae6 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  808ac0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808ac4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ac8:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  808acc:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808ad0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808ad4:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808ad8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808adc:	48 89 c7             	mov    rdi,rax
  808adf:	41 ff d0             	call   r8
  808ae2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808ae6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808aea:	c9                   	leave  
  808aeb:	c3                   	ret    

0000000000808aec <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  808aec:	f3 0f 1e fa          	endbr64 
  808af0:	55                   	push   rbp
  808af1:	48 89 e5             	mov    rbp,rsp
  808af4:	48 83 ec 30          	sub    rsp,0x30
  808af8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808afb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808aff:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808b03:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808b0a:	00 
    unsigned long ret = 0;
  808b0b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808b12:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808b13:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808b17:	78 06                	js     808b1f <sys_write+0x33>
  808b19:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808b1d:	7e 09                	jle    808b28 <sys_write+0x3c>
        return -EBADF;
  808b1f:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808b26:	eb 72                	jmp    808b9a <sys_write+0xae>
    if(count < 0)
  808b28:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808b2d:	79 09                	jns    808b38 <sys_write+0x4c>
        return -EINVAL;
  808b2f:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808b36:	eb 62                	jmp    808b9a <sys_write+0xae>

    filp = current->openf[fd];
  808b38:	48 8b 05 01 c7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c701]        # 415240 <current>
  808b3f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808b42:	48 63 d2             	movsxd rdx,edx
  808b45:	48 83 c2 1a          	add    rdx,0x1a
  808b49:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808b4e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  808b52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b56:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b5a:	48 85 c0             	test   rax,rax
  808b5d:	74 37                	je     808b96 <sys_write+0xaa>
  808b5f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b63:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b67:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b6b:	48 85 c0             	test   rax,rax
  808b6e:	74 26                	je     808b96 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  808b70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b74:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b78:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  808b7c:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808b80:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808b84:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808b88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b8c:	48 89 c7             	mov    rdi,rax
  808b8f:	41 ff d0             	call   r8
  808b92:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808b96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808b9a:	c9                   	leave  
  808b9b:	c3                   	ret    

0000000000808b9c <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  808b9c:	f3 0f 1e fa          	endbr64 
  808ba0:	55                   	push   rbp
  808ba1:	48 89 e5             	mov    rbp,rsp
  808ba4:	48 83 ec 20          	sub    rsp,0x20
  808ba8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808bab:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808baf:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  808bb2:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808bb9:	00 
    unsigned long ret = 0;
  808bba:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808bc1:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  808bc2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808bc6:	78 06                	js     808bce <sys_lseek+0x32>
  808bc8:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808bcc:	7e 09                	jle    808bd7 <sys_lseek+0x3b>
        return -EBADF;
  808bce:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808bd5:	eb 78                	jmp    808c4f <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  808bd7:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  808bdb:	78 06                	js     808be3 <sys_lseek+0x47>
  808bdd:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  808be1:	7e 09                	jle    808bec <sys_lseek+0x50>
        return -EINVAL;
  808be3:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808bea:	eb 63                	jmp    808c4f <sys_lseek+0xb3>

    filp = current->openf[filds];
  808bec:	48 8b 05 4d c6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c64d]        # 415240 <current>
  808bf3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808bf6:	48 63 d2             	movsxd rdx,edx
  808bf9:	48 83 c2 1a          	add    rdx,0x1a
  808bfd:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808c02:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  808c06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c0a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c0e:	48 85 c0             	test   rax,rax
  808c11:	74 38                	je     808c4b <sys_lseek+0xaf>
  808c13:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c17:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c1b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808c1f:	48 85 c0             	test   rax,rax
  808c22:	74 27                	je     808c4b <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  808c24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c28:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c2c:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  808c30:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808c33:	48 63 d0             	movsxd rdx,eax
  808c36:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c3e:	48 89 ce             	mov    rsi,rcx
  808c41:	48 89 c7             	mov    rdi,rax
  808c44:	41 ff d0             	call   r8
  808c47:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808c4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808c4f:	c9                   	leave  
  808c50:	c3                   	ret    

0000000000808c51 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  808c51:	f3 0f 1e fa          	endbr64 
  808c55:	55                   	push   rbp
  808c56:	48 89 e5             	mov    rbp,rsp
  808c59:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  808c5d:	48 8b 05 dc c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c5dc]        # 415240 <current>
  808c64:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  808c6b:	48 2d d0 00 00 00    	sub    rax,0xd0
  808c71:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  808c75:	bf f8 55 81 00       	mov    edi,0x8155f8
  808c7a:	b8 00 00 00 00       	mov    eax,0x0
  808c7f:	e8 f3 80 ff ff       	call   800d77 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  808c84:	90                   	nop
  808c85:	c9                   	leave  
  808c86:	c3                   	ret    

0000000000808c87 <sys_wait>:

/*
	rusage reserved
*/

unsigned long sys_wait(pid_t pid, int *stat_loc, int options){
  808c87:	f3 0f 1e fa          	endbr64 
  808c8b:	55                   	push   rbp
  808c8c:	48 89 e5             	mov    rbp,rsp
  808c8f:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  808c92:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  808c96:	89 55 b8             	mov    DWORD PTR [rbp-0x48],edx
    struct process* waitee=NULL;
  808c99:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808ca0:	00 
    extern struct process task[];
    if(!current->child_procs)
  808ca1:	48 8b 05 98 c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c598]        # 415240 <current>
  808ca8:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808caf:	48 85 c0             	test   rax,rax
  808cb2:	75 0c                	jne    808cc0 <sys_wait+0x39>
        return -ECHILD;//没有子进程可以等
  808cb4:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808cbb:	e9 af 01 00 00       	jmp    808e6f <sys_wait+0x1e8>
    if(pid==-1){
  808cc0:	83 7d bc ff          	cmp    DWORD PTR [rbp-0x44],0xffffffff
  808cc4:	75 4e                	jne    808d14 <sys_wait+0x8d>
        //任意一个子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808cc6:	48 8b 05 73 c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c573]        # 415240 <current>
  808ccd:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808cd4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808cd8:	eb 31                	jmp    808d0b <sys_wait+0x84>
                struct process* p=l->data;
  808cda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808cde:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808ce2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                if(p->stat == TASK_ZOMBIE) {
  808ce6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808cea:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808ced:	83 f8 04             	cmp    eax,0x4
  808cf0:	75 0d                	jne    808cff <sys_wait+0x78>
                    waitee=p;
  808cf2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808cf6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808cfa:	e9 10 01 00 00       	jmp    808e0f <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808cff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d03:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808d07:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808d0b:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808d10:	75 c8                	jne    808cda <sys_wait+0x53>
  808d12:	eb b2                	jmp    808cc6 <sys_wait+0x3f>
                }
            }
        }

    }else if(pid==0) {
  808d14:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808d18:	75 63                	jne    808d7d <sys_wait+0xf6>
        //等待任意一个和父进程同一个进程组的子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808d1a:	48 8b 05 1f c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c51f]        # 415240 <current>
  808d21:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808d28:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808d2c:	eb 46                	jmp    808d74 <sys_wait+0xed>
                struct process* p=l->data;
  808d2e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d32:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808d36:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if(p->gpid==current->gpid&& p->stat == TASK_ZOMBIE) {
  808d3a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808d3e:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
  808d41:	48 8b 05 f8 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c4f8]        # 415240 <current>
  808d48:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808d4b:	39 c2                	cmp    edx,eax
  808d4d:	75 19                	jne    808d68 <sys_wait+0xe1>
  808d4f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808d53:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808d56:	83 f8 04             	cmp    eax,0x4
  808d59:	75 0d                	jne    808d68 <sys_wait+0xe1>
                    waitee=p;
  808d5b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808d5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808d63:	e9 a7 00 00 00       	jmp    808e0f <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808d68:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d6c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808d70:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808d74:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  808d79:	75 b3                	jne    808d2e <sys_wait+0xa7>
  808d7b:	eb 9d                	jmp    808d1a <sys_wait+0x93>
                }
            }
        }
    }else{
        if(pid<0)pid=-pid;
  808d7d:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808d81:	79 03                	jns    808d86 <sys_wait+0xff>
  808d83:	f7 5d bc             	neg    DWORD PTR [rbp-0x44]
        //检查是不是本进程的子进程
        for(int i=0;i<MAX_TASKS;i++){
  808d86:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808d8d:	eb 37                	jmp    808dc6 <sys_wait+0x13f>
            if(task[i].pid==pid){
  808d8f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808d92:	48 98                	cdqe   
  808d94:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808d9b:	48 05 40 85 40 00    	add    rax,0x408540
  808da1:	8b 10                	mov    edx,DWORD PTR [rax]
  808da3:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808da6:	39 c2                	cmp    edx,eax
  808da8:	75 18                	jne    808dc2 <sys_wait+0x13b>
                waitee=&task[i];
  808daa:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808dad:	48 98                	cdqe   
  808daf:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808db6:	48 05 40 85 40 00    	add    rax,0x408540
  808dbc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                break;
  808dc0:	eb 0a                	jmp    808dcc <sys_wait+0x145>
        for(int i=0;i<MAX_TASKS;i++){
  808dc2:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  808dc6:	83 7d e4 1f          	cmp    DWORD PTR [rbp-0x1c],0x1f
  808dca:	7e c3                	jle    808d8f <sys_wait+0x108>
            }
        }
        if(waitee==NULL||waitee->parent_pid!=current->pid)
  808dcc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808dd1:	74 17                	je     808dea <sys_wait+0x163>
  808dd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dd7:	8b 90 9c 00 00 00    	mov    edx,DWORD PTR [rax+0x9c]
  808ddd:	48 8b 05 5c c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c45c]        # 415240 <current>
  808de4:	8b 00                	mov    eax,DWORD PTR [rax]
  808de6:	39 c2                	cmp    edx,eax
  808de8:	74 09                	je     808df3 <sys_wait+0x16c>
            return -ECHILD;//没有这个进程或者不是子进程
  808dea:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808df1:	eb 7c                	jmp    808e6f <sys_wait+0x1e8>
        //TODO 等待结束以及等待信号
        while (waitee->stat != TASK_ZOMBIE);
  808df3:	90                   	nop
  808df4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808df8:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808dfb:	83 f8 04             	cmp    eax,0x4
  808dfe:	75 f4                	jne    808df4 <sys_wait+0x16d>
        *stat_loc=waitee->exit_code;
  808e00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e04:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808e07:	89 c2                	mov    edx,eax
  808e09:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808e0d:	89 10                	mov    DWORD PTR [rax],edx
    }
    done:
    //清除子进程
    waitee->stat=TASK_EMPTY;
  808e0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e13:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
    //从链表中删除，不再是子进程
    list_drop(&waitee->node);
  808e1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e1e:	48 05 14 03 00 00    	add    rax,0x314
  808e24:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    }
}
__attribute__((always_inline)) inline void list_drop(struct List * entry)
{
    //从链表中删除
    if(entry->prev)
  808e28:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808e2c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e2f:	48 85 c0             	test   rax,rax
  808e32:	74 13                	je     808e47 <sys_wait+0x1c0>
        entry->prev->next=entry->next;
  808e34:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808e38:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e3b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808e3f:	48 8b 52 10          	mov    rdx,QWORD PTR [rdx+0x10]
  808e43:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    if(entry->next)
  808e47:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808e4b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e4f:	48 85 c0             	test   rax,rax
  808e52:	74 12                	je     808e66 <sys_wait+0x1df>
        entry->next->prev=entry->prev;
  808e54:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808e58:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e5c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808e60:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  808e63:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  808e66:	90                   	nop
    //TODO 被信号中断时返回-1
    return waitee->pid;
  808e67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e6b:	8b 00                	mov    eax,DWORD PTR [rax]
  808e6d:	89 c0                	mov    eax,eax
}
  808e6f:	5d                   	pop    rbp
  808e70:	c3                   	ret    

0000000000808e71 <sys_wait4>:
unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  808e71:	f3 0f 1e fa          	endbr64 
  808e75:	55                   	push   rbp
  808e76:	48 89 e5             	mov    rbp,rsp
  808e79:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808e7d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808e81:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808e84:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  808e88:	90                   	nop
  808e89:	5d                   	pop    rbp
  808e8a:	c3                   	ret    

0000000000808e8b <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  808e8b:	f3 0f 1e fa          	endbr64 
  808e8f:	55                   	push   rbp
  808e90:	48 89 e5             	mov    rbp,rsp
  808e93:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  808e97:	90                   	nop
  808e98:	5d                   	pop    rbp
  808e99:	c3                   	ret    

0000000000808e9a <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  808e9a:	f3 0f 1e fa          	endbr64 
  808e9e:	55                   	push   rbp
  808e9f:	48 89 e5             	mov    rbp,rsp
  808ea2:	48 83 ec 10          	sub    rsp,0x10
  808ea6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808eaa:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  808eae:	bf 03 56 81 00       	mov    edi,0x815603
  808eb3:	b8 00 00 00 00       	mov    eax,0x0
  808eb8:	e8 ba 7e ff ff       	call   800d77 <printf>
    switch(cmd)
  808ebd:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808ec2:	74 09                	je     808ecd <sys_reboot+0x33>
  808ec4:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  808ec9:	74 13                	je     808ede <sys_reboot+0x44>
  808ecb:	eb 22                	jmp    808eef <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  808ecd:	be fe 00 00 00       	mov    esi,0xfe
  808ed2:	bf 64 00 00 00       	mov    edi,0x64
  808ed7:	e8 14 d8 ff ff       	call   8066f0 <outb>
            break;
  808edc:	eb 21                	jmp    808eff <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  808ede:	bf 10 56 81 00       	mov    edi,0x815610
  808ee3:	b8 00 00 00 00       	mov    eax,0x0
  808ee8:	e8 8a 7e ff ff       	call   800d77 <printf>
            break;
  808eed:	eb 10                	jmp    808eff <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  808eef:	bf 30 56 81 00       	mov    edi,0x815630
  808ef4:	b8 00 00 00 00       	mov    eax,0x0
  808ef9:	e8 79 7e ff ff       	call   800d77 <printf>
            break;
  808efe:	90                   	nop
    }
    return 0;
  808eff:	b8 00 00 00 00       	mov    eax,0x0
}
  808f04:	c9                   	leave  
  808f05:	c3                   	ret    

0000000000808f06 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  808f06:	f3 0f 1e fa          	endbr64 
  808f0a:	55                   	push   rbp
  808f0b:	48 89 e5             	mov    rbp,rsp
  808f0e:	48 83 ec 30          	sub    rsp,0x30
  808f12:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  808f16:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808f1d:	00 
    long pathlen = 0;
  808f1e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808f25:	00 
    struct dir_entry * dentry = NULL;
  808f26:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808f2d:	00 

    printf("sys_chdir\n");
  808f2e:	bf 47 56 81 00       	mov    edi,0x815647
  808f33:	b8 00 00 00 00       	mov    eax,0x0
  808f38:	e8 3a 7e ff ff       	call   800d77 <printf>
    path = (char *)vmalloc();
  808f3d:	b8 00 00 00 00       	mov    eax,0x0
  808f42:	e8 cb 81 ff ff       	call   801112 <vmalloc>
  808f47:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  808f4b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808f50:	75 0c                	jne    808f5e <sys_chdir+0x58>
        return -ENOMEM;
  808f52:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  808f59:	e9 ca 00 00 00       	jmp    809028 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  808f5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f62:	ba 00 10 00 00       	mov    edx,0x1000
  808f67:	be 00 00 00 00       	mov    esi,0x0
  808f6c:	48 89 c7             	mov    rdi,rax
  808f6f:	e8 75 3f 00 00       	call   80cee9 <memset>
    pathlen = strlen(filename);
  808f74:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808f78:	48 89 c7             	mov    rdi,rax
  808f7b:	e8 d7 41 00 00       	call   80d157 <strlen>
  808f80:	48 98                	cdqe   
  808f82:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  808f86:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808f8b:	7f 18                	jg     808fa5 <sys_chdir+0x9f>
    {
        vmfree(path);
  808f8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f91:	48 89 c7             	mov    rdi,rax
  808f94:	e8 19 82 ff ff       	call   8011b2 <vmfree>
        return -EFAULT;
  808f99:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808fa0:	e9 83 00 00 00       	jmp    809028 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  808fa5:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  808fac:	00 
  808fad:	7e 15                	jle    808fc4 <sys_chdir+0xbe>
    {
        vmfree(path);
  808faf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fb3:	48 89 c7             	mov    rdi,rax
  808fb6:	e8 f7 81 ff ff       	call   8011b2 <vmfree>
        return -ENAMETOOLONG;
  808fbb:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  808fc2:	eb 64                	jmp    809028 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  808fc4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808fc8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808fcc:	48 89 d6             	mov    rsi,rdx
  808fcf:	48 89 c7             	mov    rdi,rax
  808fd2:	e8 61 3f 00 00       	call   80cf38 <strcpy>

    dentry = path_walk(path,0);
  808fd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fdb:	be 00 00 00 00       	mov    esi,0x0
  808fe0:	48 89 c7             	mov    rdi,rax
  808fe3:	e8 16 ed ff ff       	call   807cfe <path_walk>
  808fe8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  808fec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ff0:	48 89 c7             	mov    rdi,rax
  808ff3:	e8 ba 81 ff ff       	call   8011b2 <vmfree>

    if(dentry == NULL)
  808ff8:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  808ffd:	75 09                	jne    809008 <sys_chdir+0x102>
        return -ENOENT;
  808fff:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  809006:	eb 20                	jmp    809028 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  809008:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80900c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  809010:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809014:	48 83 f8 02          	cmp    rax,0x2
  809018:	74 09                	je     809023 <sys_chdir+0x11d>
        return -ENOTDIR;
  80901a:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  809021:	eb 05                	jmp    809028 <sys_chdir+0x122>
    return 0;
  809023:	b8 00 00 00 00       	mov    eax,0x0
}
  809028:	c9                   	leave  
  809029:	c3                   	ret    

000000000080902a <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  80902a:	f3 0f 1e fa          	endbr64 
  80902e:	55                   	push   rbp
  80902f:	48 89 e5             	mov    rbp,rsp
  809032:	48 83 ec 30          	sub    rsp,0x30
  809036:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809039:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80903d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  809041:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809048:	00 
    unsigned long ret = 0;
  809049:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809050:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  809051:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  809055:	78 06                	js     80905d <sys_getdents+0x33>
  809057:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  80905b:	7e 09                	jle    809066 <sys_getdents+0x3c>
        return -EBADF;
  80905d:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  809064:	eb 72                	jmp    8090d8 <sys_getdents+0xae>
    if(count < 0)
  809066:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80906b:	79 09                	jns    809076 <sys_getdents+0x4c>
        return -EINVAL;
  80906d:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  809074:	eb 62                	jmp    8090d8 <sys_getdents+0xae>

    filp = current->openf[fd];
  809076:	48 8b 05 c3 c1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c1c3]        # 415240 <current>
  80907d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  809080:	48 63 d2             	movsxd rdx,edx
  809083:	48 83 c2 1a          	add    rdx,0x1a
  809087:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80908c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  809090:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809094:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809098:	48 85 c0             	test   rax,rax
  80909b:	74 37                	je     8090d4 <sys_getdents+0xaa>
  80909d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8090a1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8090a5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090a9:	48 85 c0             	test   rax,rax
  8090ac:	74 26                	je     8090d4 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8090ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8090b2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8090b6:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8090ba:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8090be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8090c2:	ba f1 7f 80 00       	mov    edx,0x807ff1
  8090c7:	48 89 ce             	mov    rsi,rcx
  8090ca:	48 89 c7             	mov    rdi,rax
  8090cd:	41 ff d0             	call   r8
  8090d0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8090d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8090d8:	c9                   	leave  
  8090d9:	c3                   	ret    
  8090da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000008090e0 <init64>:
  8090e0:	b8 00 80 ff ff       	mov    eax,0xffff8000
  8090e5:	48 c1 e0 20          	shl    rax,0x20
  8090e9:	48 01 c4             	add    rsp,rax
  8090ec:	48 01 c5             	add    rbp,rax
  8090ef:	48 05 73 08 80 00    	add    rax,0x800873
  8090f5:	50                   	push   rax
  8090f6:	c3                   	ret    

00000000008090f7 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8090f7:	f3 0f 1e fa          	endbr64 
  8090fb:	55                   	push   rbp
  8090fc:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8090ff:	0f b6 05 67 f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f467]        # 42856d <k_shift>
  809106:	84 c0                	test   al,al
  809108:	0f 94 c0             	sete   al
  80910b:	88 05 5c f4 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f45c],al        # 42856d <k_shift>
}
  809111:	90                   	nop
  809112:	5d                   	pop    rbp
  809113:	c3                   	ret    

0000000000809114 <ctrl>:
void ctrl()
{
  809114:	f3 0f 1e fa          	endbr64 
  809118:	55                   	push   rbp
  809119:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  80911c:	0f b6 05 4b f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f44b]        # 42856e <k_ctrl>
  809123:	84 c0                	test   al,al
  809125:	0f 94 c0             	sete   al
  809128:	88 05 40 f4 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f440],al        # 42856e <k_ctrl>
}
  80912e:	90                   	nop
  80912f:	5d                   	pop    rbp
  809130:	c3                   	ret    

0000000000809131 <capslock>:
void capslock()
{
  809131:	f3 0f 1e fa          	endbr64 
  809135:	55                   	push   rbp
  809136:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  809139:	0f b6 05 2f f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f42f]        # 42856f <k_capslock>
  809140:	84 c0                	test   al,al
  809142:	0f 94 c0             	sete   al
  809145:	88 05 24 f4 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f424],al        # 42856f <k_capslock>
}
  80914b:	90                   	nop
  80914c:	5d                   	pop    rbp
  80914d:	c3                   	ret    

000000000080914e <to_ascii>:
char to_ascii(char scan_code)
{
  80914e:	f3 0f 1e fa          	endbr64 
  809152:	55                   	push   rbp
  809153:	48 89 e5             	mov    rbp,rsp
  809156:	89 f8                	mov    eax,edi
  809158:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80915b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809162:	e9 c7 00 00 00       	jmp    80922e <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  809167:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80916a:	48 63 d0             	movsxd rdx,eax
  80916d:	48 89 d0             	mov    rax,rdx
  809170:	48 c1 e0 02          	shl    rax,0x2
  809174:	48 01 d0             	add    rax,rdx
  809177:	48 05 c2 57 81 00    	add    rax,0x8157c2
  80917d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809180:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  809183:	0f 85 a1 00 00 00    	jne    80922a <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  809189:	0f b6 05 df f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f3df]        # 42856f <k_capslock>
  809190:	84 c0                	test   al,al
  809192:	74 55                	je     8091e9 <to_ascii+0x9b>
  809194:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809197:	48 63 d0             	movsxd rdx,eax
  80919a:	48 89 d0             	mov    rax,rdx
  80919d:	48 c1 e0 02          	shl    rax,0x2
  8091a1:	48 01 d0             	add    rax,rdx
  8091a4:	48 05 c0 57 81 00    	add    rax,0x8157c0
  8091aa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091ad:	3c 60                	cmp    al,0x60
  8091af:	7e 38                	jle    8091e9 <to_ascii+0x9b>
  8091b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091b4:	48 63 d0             	movsxd rdx,eax
  8091b7:	48 89 d0             	mov    rax,rdx
  8091ba:	48 c1 e0 02          	shl    rax,0x2
  8091be:	48 01 d0             	add    rax,rdx
  8091c1:	48 05 c0 57 81 00    	add    rax,0x8157c0
  8091c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091ca:	3c 7a                	cmp    al,0x7a
  8091cc:	7f 1b                	jg     8091e9 <to_ascii+0x9b>
  8091ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091d1:	48 63 d0             	movsxd rdx,eax
  8091d4:	48 89 d0             	mov    rax,rdx
  8091d7:	48 c1 e0 02          	shl    rax,0x2
  8091db:	48 01 d0             	add    rax,rdx
  8091de:	48 05 c1 57 81 00    	add    rax,0x8157c1
  8091e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091e7:	eb 54                	jmp    80923d <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8091e9:	0f b6 05 7d f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f37d]        # 42856d <k_shift>
  8091f0:	84 c0                	test   al,al
  8091f2:	74 1b                	je     80920f <to_ascii+0xc1>
  8091f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091f7:	48 63 d0             	movsxd rdx,eax
  8091fa:	48 89 d0             	mov    rax,rdx
  8091fd:	48 c1 e0 02          	shl    rax,0x2
  809201:	48 01 d0             	add    rax,rdx
  809204:	48 05 c1 57 81 00    	add    rax,0x8157c1
  80920a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80920d:	eb 2e                	jmp    80923d <to_ascii+0xef>
            else return key_map[i].ascii;
  80920f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809212:	48 63 d0             	movsxd rdx,eax
  809215:	48 89 d0             	mov    rax,rdx
  809218:	48 c1 e0 02          	shl    rax,0x2
  80921c:	48 01 d0             	add    rax,rdx
  80921f:	48 05 c0 57 81 00    	add    rax,0x8157c0
  809225:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809228:	eb 13                	jmp    80923d <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80922a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80922e:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  809232:	0f 8e 2f ff ff ff    	jle    809167 <to_ascii+0x19>
        }

    return '\0';
  809238:	b8 00 00 00 00       	mov    eax,0x0
}
  80923d:	5d                   	pop    rbp
  80923e:	c3                   	ret    

000000000080923f <init_kb>:
int init_kb()
{
  80923f:	f3 0f 1e fa          	endbr64 
  809243:	55                   	push   rbp
  809244:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  809247:	bf 00 57 81 00       	mov    edi,0x815700
  80924c:	e8 d7 9c ff ff       	call   802f28 <reg_device>
    reg_driver(&drv_keyboard);
  809251:	bf 60 56 81 00       	mov    edi,0x815660
  809256:	e8 b5 9f ff ff       	call   803210 <reg_driver>
}
  80925b:	90                   	nop
  80925c:	5d                   	pop    rbp
  80925d:	c3                   	ret    

000000000080925e <key_proc>:
int key_proc()
{
  80925e:	f3 0f 1e fa          	endbr64 
  809262:	55                   	push   rbp
  809263:	48 89 e5             	mov    rbp,rsp
  809266:	48 83 ec 20          	sub    rsp,0x20
    asm volatile("cli");
  80926a:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  80926b:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  80926f:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  809273:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  809277:	bf 60 00 00 00       	mov    edi,0x60
  80927c:	e8 88 d4 ff ff       	call   806709 <inb>
  809281:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  809284:	8b 05 22 47 00 00    	mov    eax,DWORD PTR [rip+0x4722]        # 80d9ac <key_bufq+0xc>
  80928a:	83 c0 01             	add    eax,0x1
  80928d:	8b 0d 1d 47 00 00    	mov    ecx,DWORD PTR [rip+0x471d]        # 80d9b0 <key_bufq+0x10>
  809293:	99                   	cdq    
  809294:	f7 f9                	idiv   ecx
  809296:	8b 05 0c 47 00 00    	mov    eax,DWORD PTR [rip+0x470c]        # 80d9a8 <key_bufq+0x8>
  80929c:	39 c2                	cmp    edx,eax
  80929e:	74 32                	je     8092d2 <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8092a0:	48 8b 15 f9 46 00 00 	mov    rdx,QWORD PTR [rip+0x46f9]        # 80d9a0 <key_bufq>
  8092a7:	8b 05 ff 46 00 00    	mov    eax,DWORD PTR [rip+0x46ff]        # 80d9ac <key_bufq+0xc>
  8092ad:	48 98                	cdqe   
  8092af:	48 01 c2             	add    rdx,rax
  8092b2:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8092b6:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8092b8:	8b 05 ee 46 00 00    	mov    eax,DWORD PTR [rip+0x46ee]        # 80d9ac <key_bufq+0xc>
  8092be:	83 c0 01             	add    eax,0x1
  8092c1:	8b 0d e9 46 00 00    	mov    ecx,DWORD PTR [rip+0x46e9]        # 80d9b0 <key_bufq+0x10>
  8092c7:	99                   	cdq    
  8092c8:	f7 f9                	idiv   ecx
  8092ca:	89 d0                	mov    eax,edx
  8092cc:	89 05 da 46 00 00    	mov    DWORD PTR [rip+0x46da],eax        # 80d9ac <key_bufq+0xc>
    }

    if(scan1==0x48)
  8092d2:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8092d6:	75 0a                	jne    8092e2 <key_proc+0x84>
        scr_up();
  8092d8:	b8 00 00 00 00       	mov    eax,0x0
  8092dd:	e8 a7 e6 ff ff       	call   807989 <scr_up>
    if(scan1==0x50)
  8092e2:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8092e6:	75 0a                	jne    8092f2 <key_proc+0x94>
        scr_down();
  8092e8:	b8 00 00 00 00       	mov    eax,0x0
  8092ed:	e8 39 e7 ff ff       	call   807a2b <scr_down>
    switch (scan1)
  8092f2:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8092f6:	3d b6 00 00 00       	cmp    eax,0xb6
  8092fb:	74 41                	je     80933e <key_proc+0xe0>
  8092fd:	3d b6 00 00 00       	cmp    eax,0xb6
  809302:	7f 5e                	jg     809362 <key_proc+0x104>
  809304:	3d aa 00 00 00       	cmp    eax,0xaa
  809309:	74 33                	je     80933e <key_proc+0xe0>
  80930b:	3d aa 00 00 00       	cmp    eax,0xaa
  809310:	7f 50                	jg     809362 <key_proc+0x104>
  809312:	3d 9d 00 00 00       	cmp    eax,0x9d
  809317:	74 31                	je     80934a <key_proc+0xec>
  809319:	3d 9d 00 00 00       	cmp    eax,0x9d
  80931e:	7f 42                	jg     809362 <key_proc+0x104>
  809320:	83 f8 3a             	cmp    eax,0x3a
  809323:	74 31                	je     809356 <key_proc+0xf8>
  809325:	83 f8 3a             	cmp    eax,0x3a
  809328:	7f 38                	jg     809362 <key_proc+0x104>
  80932a:	83 f8 36             	cmp    eax,0x36
  80932d:	74 0f                	je     80933e <key_proc+0xe0>
  80932f:	83 f8 36             	cmp    eax,0x36
  809332:	7f 2e                	jg     809362 <key_proc+0x104>
  809334:	83 f8 1d             	cmp    eax,0x1d
  809337:	74 11                	je     80934a <key_proc+0xec>
  809339:	83 f8 2a             	cmp    eax,0x2a
  80933c:	75 24                	jne    809362 <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  80933e:	b8 00 00 00 00       	mov    eax,0x0
  809343:	e8 af fd ff ff       	call   8090f7 <shift>
            break;
  809348:	eb 19                	jmp    809363 <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  80934a:	b8 00 00 00 00       	mov    eax,0x0
  80934f:	e8 c0 fd ff ff       	call   809114 <ctrl>
            break;
  809354:	eb 0d                	jmp    809363 <key_proc+0x105>
        case 0x3a:
            capslock();
  809356:	b8 00 00 00 00       	mov    eax,0x0
  80935b:	e8 d1 fd ff ff       	call   809131 <capslock>
            break;
  809360:	eb 01                	jmp    809363 <key_proc+0x105>
        default:
            break;
  809362:	90                   	nop
    }
    //发送到std
    if(!(scan1&FLAG_BREAK)){
  809363:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809367:	84 c0                	test   al,al
  809369:	78 37                	js     8093a2 <key_proc+0x144>
        char ch= to_ascii(scan1);
  80936b:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80936f:	0f be c0             	movsx  eax,al
  809372:	89 c7                	mov    edi,eax
  809374:	e8 d5 fd ff ff       	call   80914e <to_ascii>
  809379:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        unsigned long args[]={(unsigned long) &ch, 1};
  80937c:	48 8d 45 f7          	lea    rax,[rbp-0x9]
  809380:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  809384:	48 c7 45 e8 01 00 00 	mov    QWORD PTR [rbp-0x18],0x1
  80938b:	00 
        //写入stdin
        sys_ioctl(0,TTY_WSTDIN,(unsigned long)args);
  80938c:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  809390:	48 89 c2             	mov    rdx,rax
  809393:	be 03 00 00 00       	mov    esi,0x3
  809398:	bf 00 00 00 00       	mov    edi,0x0
  80939d:	e8 cb d2 ff ff       	call   80666d <sys_ioctl>
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8093a2:	b8 00 00 00 00       	mov    eax,0x0
  8093a7:	e8 72 d3 ff ff       	call   80671e <eoi>
    asm volatile("leave\r\n iretq");
  8093ac:	c9                   	leave  
  8093ad:	48 cf                	iretq  
}
  8093af:	90                   	nop
  8093b0:	c9                   	leave  
  8093b1:	c3                   	ret    

00000000008093b2 <sys_analyse_key>:

char sys_analyse_key()
{
  8093b2:	f3 0f 1e fa          	endbr64 
  8093b6:	55                   	push   rbp
  8093b7:	48 89 e5             	mov    rbp,rsp
  8093ba:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  8093be:	8b 15 e8 45 00 00    	mov    edx,DWORD PTR [rip+0x45e8]        # 80d9ac <key_bufq+0xc>
  8093c4:	8b 05 de 45 00 00    	mov    eax,DWORD PTR [rip+0x45de]        # 80d9a8 <key_bufq+0x8>
  8093ca:	39 c2                	cmp    edx,eax
  8093cc:	75 0a                	jne    8093d8 <sys_analyse_key+0x26>
  8093ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8093d3:	e9 df 00 00 00       	jmp    8094b7 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  8093d8:	8b 05 ca 45 00 00    	mov    eax,DWORD PTR [rip+0x45ca]        # 80d9a8 <key_bufq+0x8>
  8093de:	48 98                	cdqe   
  8093e0:	0f b6 80 60 83 42 00 	movzx  eax,BYTE PTR [rax+0x428360]
  8093e7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  8093ea:	8b 05 b8 45 00 00    	mov    eax,DWORD PTR [rip+0x45b8]        # 80d9a8 <key_bufq+0x8>
  8093f0:	83 c0 01             	add    eax,0x1
  8093f3:	8b 0d b7 45 00 00    	mov    ecx,DWORD PTR [rip+0x45b7]        # 80d9b0 <key_bufq+0x10>
  8093f9:	99                   	cdq    
  8093fa:	f7 f9                	idiv   ecx
  8093fc:	89 d0                	mov    eax,edx
  8093fe:	89 05 a4 45 00 00    	mov    DWORD PTR [rip+0x45a4],eax        # 80d9a8 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  809404:	bf 96 59 81 00       	mov    edi,0x815996
  809409:	b8 00 00 00 00       	mov    eax,0x0
  80940e:	e8 64 79 ff ff       	call   800d77 <printf>
    char res[33]={0};
  809413:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80941a:	00 
  80941b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809422:	00 
  809423:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80942a:	00 
  80942b:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809432:	00 
  809433:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  809437:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  80943b:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80943f:	be 10 00 00 00       	mov    esi,0x10
  809444:	48 89 c7             	mov    rdi,rax
  809447:	e8 ec 77 ff ff       	call   800c38 <itoa>
    printf(res);
  80944c:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  809450:	48 89 c7             	mov    rdi,rax
  809453:	b8 00 00 00 00       	mov    eax,0x0
  809458:	e8 1a 79 ff ff       	call   800d77 <printf>
    if(c&FLAG_BREAK){
  80945d:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809461:	79 16                	jns    809479 <sys_analyse_key+0xc7>
        printf("\n");
  809463:	bf a1 59 81 00       	mov    edi,0x8159a1
  809468:	b8 00 00 00 00       	mov    eax,0x0
  80946d:	e8 05 79 ff ff       	call   800d77 <printf>
        return -1;
  809472:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809477:	eb 3e                	jmp    8094b7 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  809479:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80947d:	83 e0 7f             	and    eax,0x7f
  809480:	89 c7                	mov    edi,eax
  809482:	e8 c7 fc ff ff       	call   80914e <to_ascii>
  809487:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  80948a:	bf a3 59 81 00       	mov    edi,0x8159a3
  80948f:	b8 00 00 00 00       	mov    eax,0x0
  809494:	e8 de 78 ff ff       	call   800d77 <printf>
    putchar(c);
  809499:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80949d:	89 c7                	mov    edi,eax
  80949f:	e8 a9 78 ff ff       	call   800d4d <putchar>
    printf("\n");
  8094a4:	bf a1 59 81 00       	mov    edi,0x8159a1
  8094a9:	b8 00 00 00 00       	mov    eax,0x0
  8094ae:	e8 c4 78 ff ff       	call   800d77 <printf>
    return c;
  8094b3:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8094b7:	c9                   	leave  
  8094b8:	c3                   	ret    

00000000008094b9 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8094b9:	f3 0f 1e fa          	endbr64 
  8094bd:	55                   	push   rbp
  8094be:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8094c1:	b8 00 00 00 00       	mov    eax,0x0
  8094c6:	e8 c4 09 00 00       	call   809e8f <hd_iterate>
    return 0;
  8094cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8094d0:	5d                   	pop    rbp
  8094d1:	c3                   	ret    

00000000008094d2 <disk_int_handler_c>:

int disk_int_handler_c()
{
  8094d2:	f3 0f 1e fa          	endbr64 
  8094d6:	55                   	push   rbp
  8094d7:	48 89 e5             	mov    rbp,rsp
  8094da:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8094de:	48 8b 05 db 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ddb]        # 42b2c0 <running_req>
  8094e5:	48 85 c0             	test   rax,rax
  8094e8:	75 0a                	jne    8094f4 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8094ea:	b8 01 00 00 00       	mov    eax,0x1
  8094ef:	e9 bf 01 00 00       	jmp    8096b3 <disk_int_handler_c+0x1e1>
    }
    short *p=running_req->buf;
  8094f4:	48 8b 05 c5 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21dc5]        # 42b2c0 <running_req>
  8094fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094ff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  809503:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80950a:	48 8b 05 af 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21daf]        # 42b2c0 <running_req>
  809511:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809514:	83 f8 02             	cmp    eax,0x2
  809517:	74 0f                	je     809528 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  809519:	48 8b 05 a0 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21da0]        # 42b2c0 <running_req>
  809520:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  809523:	83 f8 03             	cmp    eax,0x3
  809526:	75 07                	jne    80952f <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  809528:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80952f:	48 8b 05 8a 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d8a]        # 42b2c0 <running_req>
  809536:	8b 00                	mov    eax,DWORD PTR [rax]
  809538:	85 c0                	test   eax,eax
  80953a:	75 50                	jne    80958c <disk_int_handler_c+0xba>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  80953c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809543:	eb 22                	jmp    809567 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  809545:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809548:	0f b7 c0             	movzx  eax,ax
  80954b:	89 c7                	mov    edi,eax
  80954d:	e8 c1 d1 ff ff       	call   806713 <inw>
  809552:	89 c2                	mov    edx,eax
  809554:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809558:	48 8d 48 02          	lea    rcx,[rax+0x2]
  80955c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809560:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  809563:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809567:	48 8b 05 52 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d52]        # 42b2c0 <running_req>
  80956e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809571:	c1 e0 08             	shl    eax,0x8
  809574:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  809577:	7c cc                	jl     809545 <disk_int_handler_c+0x73>
        }
        running_req->result=DISK_CHK_OK;
  809579:	48 8b 05 40 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d40]        # 42b2c0 <running_req>
  809580:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  809587:	e9 d8 00 00 00       	jmp    809664 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_WRITE)
  80958c:	48 8b 05 2d 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d2d]        # 42b2c0 <running_req>
  809593:	8b 00                	mov    eax,DWORD PTR [rax]
  809595:	83 f8 01             	cmp    eax,0x1
  809598:	75 50                	jne    8095ea <disk_int_handler_c+0x118>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  80959a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8095a1:	eb 25                	jmp    8095c8 <disk_int_handler_c+0xf6>
            outw(port,*p++);
  8095a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095a7:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8095ab:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8095af:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8095b2:	0f b7 d0             	movzx  edx,ax
  8095b5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8095b8:	0f b7 c0             	movzx  eax,ax
  8095bb:	89 d6                	mov    esi,edx
  8095bd:	89 c7                	mov    edi,eax
  8095bf:	e8 39 d1 ff ff       	call   8066fd <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8095c4:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8095c8:	48 8b 05 f1 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cf1]        # 42b2c0 <running_req>
  8095cf:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8095d2:	c1 e0 08             	shl    eax,0x8
  8095d5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8095d8:	7c c9                	jl     8095a3 <disk_int_handler_c+0xd1>
        running_req->result=DISK_CHK_OK;
  8095da:	48 8b 05 df 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cdf]        # 42b2c0 <running_req>
  8095e1:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8095e8:	eb 7a                	jmp    809664 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_CHECK)
  8095ea:	48 8b 05 cf 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ccf]        # 42b2c0 <running_req>
  8095f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8095f3:	83 f8 02             	cmp    eax,0x2
  8095f6:	75 34                	jne    80962c <disk_int_handler_c+0x15a>
    {
        char stat=inb(port+7);
  8095f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8095fb:	83 c0 07             	add    eax,0x7
  8095fe:	0f b6 c0             	movzx  eax,al
  809601:	89 c7                	mov    edi,eax
  809603:	e8 01 d1 ff ff       	call   806709 <inb>
  809608:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  80960b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80960e:	0f b7 c0             	movzx  eax,ax
  809611:	89 c7                	mov    edi,eax
  809613:	e8 fb d0 ff ff       	call   806713 <inw>
  809618:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  80961c:	48 8b 05 9d 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c9d]        # 42b2c0 <running_req>
  809623:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  80962a:	eb 38                	jmp    809664 <disk_int_handler_c+0x192>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  80962c:	48 8b 05 8d 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c8d]        # 42b2c0 <running_req>
  809633:	8b 00                	mov    eax,DWORD PTR [rax]
  809635:	83 f8 03             	cmp    eax,0x3
  809638:	75 2a                	jne    809664 <disk_int_handler_c+0x192>
    {
        int stat=inb(port+7);
  80963a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80963d:	83 c0 07             	add    eax,0x7
  809640:	0f b6 c0             	movzx  eax,al
  809643:	89 c7                	mov    edi,eax
  809645:	e8 bf d0 ff ff       	call   806709 <inb>
  80964a:	0f b6 c0             	movzx  eax,al
  80964d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  809650:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809653:	89 c6                	mov    esi,eax
  809655:	bf aa 59 81 00       	mov    edi,0x8159aa
  80965a:	b8 00 00 00 00       	mov    eax,0x0
  80965f:	e8 13 77 ff ff       	call   800d77 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  809664:	48 8b 05 55 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c55]        # 42b2c0 <running_req>
  80966b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809672:	48 8b 05 47 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c47]        # 42b2c0 <running_req>
  809679:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80967d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809684:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  809687:	48 8b 05 3a 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c3a]        # 42b2c8 <running_devman_req>
  80968e:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  809695:	00 00 00 
    running_devman_req=NULL;
  809698:	48 c7 05 25 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c25],0x0        # 42b2c8 <running_devman_req>
  80969f:	00 00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  8096a3:	48 c7 05 12 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c12],0x0        # 42b2c0 <running_req>
  8096aa:	00 00 00 00 
    return 0;
  8096ae:	b8 00 00 00 00       	mov    eax,0x0
}
  8096b3:	c9                   	leave  
  8096b4:	c3                   	ret    

00000000008096b5 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8096b5:	f3 0f 1e fa          	endbr64 
  8096b9:	55                   	push   rbp
  8096ba:	48 89 e5             	mov    rbp,rsp
  8096bd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8096c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8096c3:	48 63 d0             	movsxd rdx,eax
  8096c6:	48 89 d0             	mov    rax,rdx
  8096c9:	48 01 c0             	add    rax,rax
  8096cc:	48 01 d0             	add    rax,rdx
  8096cf:	48 c1 e0 04          	shl    rax,0x4
  8096d3:	48 05 dc 85 42 00    	add    rax,0x4285dc
  8096d9:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8096db:	5d                   	pop    rbp
  8096dc:	c3                   	ret    

00000000008096dd <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  8096dd:	f3 0f 1e fa          	endbr64 
  8096e1:	55                   	push   rbp
  8096e2:	48 89 e5             	mov    rbp,rsp
  8096e5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8096e8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8096eb:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8096ee:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8096f1:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8096f5:	8b 05 f9 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bf9]        # 42b2f4 <tail>
  8096fb:	83 c0 01             	add    eax,0x1
  8096fe:	48 63 d0             	movsxd rdx,eax
  809701:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  809708:	48 c1 ea 20          	shr    rdx,0x20
  80970c:	01 c2                	add    edx,eax
  80970e:	c1 fa 07             	sar    edx,0x7
  809711:	89 c1                	mov    ecx,eax
  809713:	c1 f9 1f             	sar    ecx,0x1f
  809716:	29 ca                	sub    edx,ecx
  809718:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80971e:	29 c8                	sub    eax,ecx
  809720:	89 c2                	mov    edx,eax
  809722:	8b 05 c8 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bc8]        # 42b2f0 <head>
  809728:	39 c2                	cmp    edx,eax
  80972a:	75 0a                	jne    809736 <request+0x59>
    {
        return -1;
  80972c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809731:	e9 0d 01 00 00       	jmp    809843 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  809736:	8b 05 b8 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bb8]        # 42b2f4 <tail>
  80973c:	48 63 d0             	movsxd rdx,eax
  80973f:	48 89 d0             	mov    rax,rdx
  809742:	48 01 c0             	add    rax,rax
  809745:	48 01 d0             	add    rax,rdx
  809748:	48 c1 e0 04          	shl    rax,0x4
  80974c:	48 8d 90 c4 85 42 00 	lea    rdx,[rax+0x4285c4]
  809753:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809756:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  809758:	8b 05 96 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b96]        # 42b2f4 <tail>
  80975e:	48 63 d0             	movsxd rdx,eax
  809761:	48 89 d0             	mov    rax,rdx
  809764:	48 01 c0             	add    rax,rax
  809767:	48 01 d0             	add    rax,rdx
  80976a:	48 c1 e0 04          	shl    rax,0x4
  80976e:	48 8d 90 c0 85 42 00 	lea    rdx,[rax+0x4285c0]
  809775:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809778:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  80977a:	8b 05 74 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b74]        # 42b2f4 <tail>
  809780:	48 63 d0             	movsxd rdx,eax
  809783:	48 89 d0             	mov    rax,rdx
  809786:	48 01 c0             	add    rax,rax
  809789:	48 01 d0             	add    rax,rdx
  80978c:	48 c1 e0 04          	shl    rax,0x4
  809790:	48 8d 90 c8 85 42 00 	lea    rdx,[rax+0x4285c8]
  809797:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80979a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80979c:	8b 05 52 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b52]        # 42b2f4 <tail>
  8097a2:	48 63 d0             	movsxd rdx,eax
  8097a5:	48 89 d0             	mov    rax,rdx
  8097a8:	48 01 c0             	add    rax,rax
  8097ab:	48 01 d0             	add    rax,rdx
  8097ae:	48 c1 e0 04          	shl    rax,0x4
  8097b2:	48 8d 90 cc 85 42 00 	lea    rdx,[rax+0x4285cc]
  8097b9:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8097bc:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8097be:	8b 05 30 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b30]        # 42b2f4 <tail>
  8097c4:	48 63 d0             	movsxd rdx,eax
  8097c7:	48 89 d0             	mov    rax,rdx
  8097ca:	48 01 c0             	add    rax,rax
  8097cd:	48 01 d0             	add    rax,rdx
  8097d0:	48 c1 e0 04          	shl    rax,0x4
  8097d4:	48 05 dc 85 42 00    	add    rax,0x4285dc
  8097da:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8097e0:	8b 05 0e 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b0e]        # 42b2f4 <tail>
  8097e6:	48 63 d0             	movsxd rdx,eax
  8097e9:	48 89 d0             	mov    rax,rdx
  8097ec:	48 01 c0             	add    rax,rax
  8097ef:	48 01 d0             	add    rax,rdx
  8097f2:	48 c1 e0 04          	shl    rax,0x4
  8097f6:	48 8d 90 d0 85 42 00 	lea    rdx,[rax+0x4285d0]
  8097fd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809801:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  809804:	8b 05 ea 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21aea]        # 42b2f4 <tail>
  80980a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80980d:	8b 05 e1 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ae1]        # 42b2f4 <tail>
  809813:	8d 50 01             	lea    edx,[rax+0x1]
  809816:	48 63 c2             	movsxd rax,edx
  809819:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  809820:	48 c1 e8 20          	shr    rax,0x20
  809824:	01 d0                	add    eax,edx
  809826:	c1 f8 07             	sar    eax,0x7
  809829:	89 d1                	mov    ecx,edx
  80982b:	c1 f9 1f             	sar    ecx,0x1f
  80982e:	29 c8                	sub    eax,ecx
  809830:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  809836:	89 d0                	mov    eax,edx
  809838:	29 c8                	sub    eax,ecx
  80983a:	89 05 b4 1a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21ab4],eax        # 42b2f4 <tail>
    return r;
  809840:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809843:	5d                   	pop    rbp
  809844:	c3                   	ret    

0000000000809845 <execute_request>:
int execute_request(){
  809845:	f3 0f 1e fa          	endbr64 
  809849:	55                   	push   rbp
  80984a:	48 89 e5             	mov    rbp,rsp
  80984d:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  809851:	48 8b 05 68 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a68]        # 42b2c0 <running_req>
  809858:	48 85 c0             	test   rax,rax
  80985b:	74 6a                	je     8098c7 <execute_request+0x82>
    {
        running_req->time++;
  80985d:	48 8b 05 5c 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a5c]        # 42b2c0 <running_req>
  809864:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  809867:	83 c2 01             	add    edx,0x1
  80986a:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80986d:	48 8b 05 4c 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a4c]        # 42b2c0 <running_req>
  809874:	8b 00                	mov    eax,DWORD PTR [rax]
  809876:	83 f8 02             	cmp    eax,0x2
  809879:	74 0a                	je     809885 <execute_request+0x40>
            return 2;
  80987b:	b8 02 00 00 00       	mov    eax,0x2
  809880:	e9 b4 01 00 00       	jmp    809a39 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  809885:	48 8b 05 34 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a34]        # 42b2c0 <running_req>
  80988c:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80988f:	83 f8 0a             	cmp    eax,0xa
  809892:	7e 29                	jle    8098bd <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  809894:	48 8b 05 25 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a25]        # 42b2c0 <running_req>
  80989b:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8098a2:	48 8b 05 17 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a17]        # 42b2c0 <running_req>
  8098a9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8098b0:	48 c7 05 05 1a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21a05],0x0        # 42b2c0 <running_req>
  8098b7:	00 00 00 00 
  8098bb:	eb 0a                	jmp    8098c7 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8098bd:	b8 02 00 00 00       	mov    eax,0x2
  8098c2:	e9 72 01 00 00       	jmp    809a39 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8098c7:	8b 15 23 1a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21a23]        # 42b2f0 <head>
  8098cd:	8b 05 21 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a21]        # 42b2f4 <tail>
  8098d3:	39 c2                	cmp    edx,eax
  8098d5:	75 0a                	jne    8098e1 <execute_request+0x9c>
  8098d7:	b8 01 00 00 00       	mov    eax,0x1
  8098dc:	e9 58 01 00 00       	jmp    809a39 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8098e1:	8b 05 09 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a09]        # 42b2f0 <head>
  8098e7:	48 63 d0             	movsxd rdx,eax
  8098ea:	48 89 d0             	mov    rax,rdx
  8098ed:	48 01 c0             	add    rax,rax
  8098f0:	48 01 d0             	add    rax,rdx
  8098f3:	48 c1 e0 04          	shl    rax,0x4
  8098f7:	48 05 c0 85 42 00    	add    rax,0x4285c0
  8098fd:	48 89 05 bc 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc219bc],rax        # 42b2c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  809904:	8b 05 e6 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219e6]        # 42b2f0 <head>
  80990a:	8d 50 01             	lea    edx,[rax+0x1]
  80990d:	48 63 c2             	movsxd rax,edx
  809910:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  809917:	48 c1 e8 20          	shr    rax,0x20
  80991b:	01 d0                	add    eax,edx
  80991d:	c1 f8 07             	sar    eax,0x7
  809920:	89 d1                	mov    ecx,edx
  809922:	c1 f9 1f             	sar    ecx,0x1f
  809925:	29 c8                	sub    eax,ecx
  809927:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80992d:	89 d0                	mov    eax,edx
  80992f:	29 c8                	sub    eax,ecx
  809931:	89 05 b9 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc219b9],eax        # 42b2f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  809937:	48 8b 05 82 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21982]        # 42b2c0 <running_req>
  80993e:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,TASK_SUSPENDED);
    int r=0;
  809945:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  80994c:	48 8b 05 6d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2196d]        # 42b2c0 <running_req>
  809953:	8b 00                	mov    eax,DWORD PTR [rax]
  809955:	83 f8 03             	cmp    eax,0x3
  809958:	0f 84 ad 00 00 00    	je     809a0b <execute_request+0x1c6>
  80995e:	83 f8 03             	cmp    eax,0x3
  809961:	0f 8f bf 00 00 00    	jg     809a26 <execute_request+0x1e1>
  809967:	83 f8 02             	cmp    eax,0x2
  80996a:	0f 84 85 00 00 00    	je     8099f5 <execute_request+0x1b0>
  809970:	83 f8 02             	cmp    eax,0x2
  809973:	0f 8f ad 00 00 00    	jg     809a26 <execute_request+0x1e1>
  809979:	85 c0                	test   eax,eax
  80997b:	74 0a                	je     809987 <execute_request+0x142>
  80997d:	83 f8 01             	cmp    eax,0x1
  809980:	74 3c                	je     8099be <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  809982:	e9 9f 00 00 00       	jmp    809a26 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  809987:	48 8b 05 32 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21932]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  80998e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  809992:	48 8b 05 27 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21927]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  809999:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  80999c:	48 8b 05 1d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2191d]        # 42b2c0 <running_req>
  8099a3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8099a6:	89 c6                	mov    esi,eax
  8099a8:	48 8b 05 11 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21911]        # 42b2c0 <running_req>
  8099af:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8099b2:	89 c7                	mov    edi,eax
  8099b4:	e8 a7 00 00 00       	call   809a60 <async_read_disk>
  8099b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8099bc:	eb 69                	jmp    809a27 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  8099be:	48 8b 05 fb 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218fb]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8099c5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8099c9:	48 8b 05 f0 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218f0]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8099d0:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  8099d3:	48 8b 05 e6 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218e6]        # 42b2c0 <running_req>
  8099da:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  8099dd:	89 c6                	mov    esi,eax
  8099df:	48 8b 05 da 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218da]        # 42b2c0 <running_req>
  8099e6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8099e9:	89 c7                	mov    edi,eax
  8099eb:	e8 88 01 00 00       	call   809b78 <async_write_disk>
  8099f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8099f3:	eb 32                	jmp    809a27 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8099f5:	48 8b 05 c4 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218c4]        # 42b2c0 <running_req>
  8099fc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8099ff:	89 c7                	mov    edi,eax
  809a01:	e8 aa 06 00 00       	call   80a0b0 <async_check_disk>
  809a06:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809a09:	eb 1c                	jmp    809a27 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  809a0b:	48 8b 05 ae 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218ae]        # 42b2c0 <running_req>
  809a12:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809a15:	89 c7                	mov    edi,eax
  809a17:	b8 00 00 00 00       	mov    eax,0x0
  809a1c:	e8 1a 00 00 00       	call   809a3b <async_reset_disk>
  809a21:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809a24:	eb 01                	jmp    809a27 <execute_request+0x1e2>
        break;
  809a26:	90                   	nop
    }
    if(r==-1)return -1;
  809a27:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  809a2b:	75 07                	jne    809a34 <execute_request+0x1ef>
  809a2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809a32:	eb 05                	jmp    809a39 <execute_request+0x1f4>
    return 0;
  809a34:	b8 00 00 00 00       	mov    eax,0x0
}
  809a39:	c9                   	leave  
  809a3a:	c3                   	ret    

0000000000809a3b <async_reset_disk>:
int async_reset_disk(int disk)
{
  809a3b:	f3 0f 1e fa          	endbr64 
  809a3f:	55                   	push   rbp
  809a40:	48 89 e5             	mov    rbp,rsp
  809a43:	48 83 ec 10          	sub    rsp,0x10
  809a47:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  809a4a:	be 0c 00 00 00       	mov    esi,0xc
  809a4f:	bf f6 03 00 00       	mov    edi,0x3f6
  809a54:	e8 97 cc ff ff       	call   8066f0 <outb>
    return 0;
  809a59:	b8 00 00 00 00       	mov    eax,0x0
}
  809a5e:	c9                   	leave  
  809a5f:	c3                   	ret    

0000000000809a60 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  809a60:	f3 0f 1e fa          	endbr64 
  809a64:	55                   	push   rbp
  809a65:	48 89 e5             	mov    rbp,rsp
  809a68:	48 83 ec 30          	sub    rsp,0x30
  809a6c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809a6f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809a72:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809a75:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809a79:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809a7f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809a86:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809a8a:	74 06                	je     809a92 <async_read_disk+0x32>
  809a8c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809a90:	75 06                	jne    809a98 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  809a92:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809a98:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809a9c:	74 06                	je     809aa4 <async_read_disk+0x44>
  809a9e:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809aa2:	75 07                	jne    809aab <async_read_disk+0x4b>
        slave_disk=1;
  809aa4:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  809aab:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809aae:	0f b6 d0             	movzx  edx,al
  809ab1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ab5:	83 c0 02             	add    eax,0x2
  809ab8:	0f b7 c0             	movzx  eax,ax
  809abb:	89 d6                	mov    esi,edx
  809abd:	89 c7                	mov    edi,eax
  809abf:	e8 2c cc ff ff       	call   8066f0 <outb>
    outb(port+3,lba&0xff);
  809ac4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809ac7:	0f b6 d0             	movzx  edx,al
  809aca:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ace:	83 c0 03             	add    eax,0x3
  809ad1:	0f b7 c0             	movzx  eax,ax
  809ad4:	89 d6                	mov    esi,edx
  809ad6:	89 c7                	mov    edi,eax
  809ad8:	e8 13 cc ff ff       	call   8066f0 <outb>
    outb(port+4,(lba>>8)&0xff);
  809add:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809ae0:	c1 e8 08             	shr    eax,0x8
  809ae3:	0f b6 d0             	movzx  edx,al
  809ae6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809aea:	83 c0 04             	add    eax,0x4
  809aed:	0f b7 c0             	movzx  eax,ax
  809af0:	89 d6                	mov    esi,edx
  809af2:	89 c7                	mov    edi,eax
  809af4:	e8 f7 cb ff ff       	call   8066f0 <outb>
    outb(port+5,(lba>>16)&0xff);
  809af9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809afc:	c1 e8 10             	shr    eax,0x10
  809aff:	0f b6 d0             	movzx  edx,al
  809b02:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809b06:	83 c0 05             	add    eax,0x5
  809b09:	0f b7 c0             	movzx  eax,ax
  809b0c:	89 d6                	mov    esi,edx
  809b0e:	89 c7                	mov    edi,eax
  809b10:	e8 db cb ff ff       	call   8066f0 <outb>
    char drv=slave_disk?0x10:0;
  809b15:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809b19:	74 07                	je     809b22 <async_read_disk+0xc2>
  809b1b:	b8 10 00 00 00       	mov    eax,0x10
  809b20:	eb 05                	jmp    809b27 <async_read_disk+0xc7>
  809b22:	b8 00 00 00 00       	mov    eax,0x0
  809b27:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809b2a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809b2d:	c1 e8 18             	shr    eax,0x18
  809b30:	83 e0 0f             	and    eax,0xf
  809b33:	89 c2                	mov    edx,eax
  809b35:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809b39:	09 d0                	or     eax,edx
  809b3b:	83 c8 e0             	or     eax,0xffffffe0
  809b3e:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  809b41:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  809b45:	0f b6 d0             	movzx  edx,al
  809b48:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809b4c:	83 c0 06             	add    eax,0x6
  809b4f:	0f b7 c0             	movzx  eax,ax
  809b52:	89 d6                	mov    esi,edx
  809b54:	89 c7                	mov    edi,eax
  809b56:	e8 95 cb ff ff       	call   8066f0 <outb>
    outb(port+7,DISK_CMD_READ);
  809b5b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809b5f:	83 c0 07             	add    eax,0x7
  809b62:	0f b7 c0             	movzx  eax,ax
  809b65:	be 20 00 00 00       	mov    esi,0x20
  809b6a:	89 c7                	mov    edi,eax
  809b6c:	e8 7f cb ff ff       	call   8066f0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  809b71:	b8 00 00 00 00       	mov    eax,0x0
}
  809b76:	c9                   	leave  
  809b77:	c3                   	ret    

0000000000809b78 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  809b78:	f3 0f 1e fa          	endbr64 
  809b7c:	55                   	push   rbp
  809b7d:	48 89 e5             	mov    rbp,rsp
  809b80:	48 83 ec 30          	sub    rsp,0x30
  809b84:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809b87:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809b8a:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809b8d:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809b91:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809b97:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809b9e:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809ba2:	74 06                	je     809baa <async_write_disk+0x32>
  809ba4:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809ba8:	75 06                	jne    809bb0 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  809baa:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809bb0:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809bb4:	74 06                	je     809bbc <async_write_disk+0x44>
  809bb6:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809bba:	75 07                	jne    809bc3 <async_write_disk+0x4b>
        slave_disk=1;
  809bbc:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  809bc3:	bf f7 00 00 00       	mov    edi,0xf7
  809bc8:	e8 3c cb ff ff       	call   806709 <inb>
  809bcd:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  809bd0:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809bd4:	83 e0 01             	and    eax,0x1
  809bd7:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  809bda:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  809bde:	74 0a                	je     809bea <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  809be0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809be5:	e9 d5 00 00 00       	jmp    809cbf <async_write_disk+0x147>
        }
        t&=0x88;
  809bea:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  809bee:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  809bf2:	74 02                	je     809bf6 <async_write_disk+0x7e>
    {
  809bf4:	eb cd                	jmp    809bc3 <async_write_disk+0x4b>
        if(t==0x8)break;
  809bf6:	90                   	nop
    }
    outb(port+2,sec_n);
  809bf7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809bfa:	0f b6 d0             	movzx  edx,al
  809bfd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c01:	83 c0 02             	add    eax,0x2
  809c04:	0f b7 c0             	movzx  eax,ax
  809c07:	89 d6                	mov    esi,edx
  809c09:	89 c7                	mov    edi,eax
  809c0b:	e8 e0 ca ff ff       	call   8066f0 <outb>
    outb(port+3,lba&0xff);
  809c10:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c13:	0f b6 d0             	movzx  edx,al
  809c16:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c1a:	83 c0 03             	add    eax,0x3
  809c1d:	0f b7 c0             	movzx  eax,ax
  809c20:	89 d6                	mov    esi,edx
  809c22:	89 c7                	mov    edi,eax
  809c24:	e8 c7 ca ff ff       	call   8066f0 <outb>
    outb(port+4,(lba>>8)&0xff);
  809c29:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c2c:	c1 e8 08             	shr    eax,0x8
  809c2f:	0f b6 d0             	movzx  edx,al
  809c32:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c36:	83 c0 04             	add    eax,0x4
  809c39:	0f b7 c0             	movzx  eax,ax
  809c3c:	89 d6                	mov    esi,edx
  809c3e:	89 c7                	mov    edi,eax
  809c40:	e8 ab ca ff ff       	call   8066f0 <outb>
    outb(port+5,(lba>>16)&0xff);
  809c45:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c48:	c1 e8 10             	shr    eax,0x10
  809c4b:	0f b6 d0             	movzx  edx,al
  809c4e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c52:	83 c0 05             	add    eax,0x5
  809c55:	0f b7 c0             	movzx  eax,ax
  809c58:	89 d6                	mov    esi,edx
  809c5a:	89 c7                	mov    edi,eax
  809c5c:	e8 8f ca ff ff       	call   8066f0 <outb>
    char drv=slave_disk?0x10:0;
  809c61:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809c65:	74 07                	je     809c6e <async_write_disk+0xf6>
  809c67:	b8 10 00 00 00       	mov    eax,0x10
  809c6c:	eb 05                	jmp    809c73 <async_write_disk+0xfb>
  809c6e:	b8 00 00 00 00       	mov    eax,0x0
  809c73:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809c76:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c79:	c1 e8 18             	shr    eax,0x18
  809c7c:	83 e0 0f             	and    eax,0xf
  809c7f:	89 c2                	mov    edx,eax
  809c81:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  809c85:	09 d0                	or     eax,edx
  809c87:	83 c8 e0             	or     eax,0xffffffe0
  809c8a:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  809c8d:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809c91:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c95:	83 c0 06             	add    eax,0x6
  809c98:	0f b7 c0             	movzx  eax,ax
  809c9b:	89 d6                	mov    esi,edx
  809c9d:	89 c7                	mov    edi,eax
  809c9f:	e8 4c ca ff ff       	call   8066f0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  809ca4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ca8:	83 c0 07             	add    eax,0x7
  809cab:	0f b7 c0             	movzx  eax,ax
  809cae:	be 30 00 00 00       	mov    esi,0x30
  809cb3:	89 c7                	mov    edi,eax
  809cb5:	e8 36 ca ff ff       	call   8066f0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  809cba:	b8 00 00 00 00       	mov    eax,0x0
}
  809cbf:	c9                   	leave  
  809cc0:	c3                   	ret    

0000000000809cc1 <read_disk>:
int read_disk(driver_args* args)
{
  809cc1:	f3 0f 1e fa          	endbr64 
  809cc5:	55                   	push   rbp
  809cc6:	48 89 e5             	mov    rbp,rsp
  809cc9:	48 83 ec 20          	sub    rsp,0x20
  809ccd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  809cd1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809cd5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809cd8:	48 98                	cdqe   
  809cda:	48 89 c2             	mov    rdx,rax
  809cdd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ce1:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809ce4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ce8:	8b 00                	mov    eax,DWORD PTR [rax]
  809cea:	89 ce                	mov    esi,ecx
  809cec:	89 c7                	mov    edi,eax
  809cee:	e8 a9 05 00 00       	call   80a29c <read_disk_asm>
  809cf3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809cf6:	48 8b 05 c3 15 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc215c3]        # 42b2c0 <running_req>
  809cfd:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809d04:	48 8b 05 b5 15 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc215b5]        # 42b2c0 <running_req>
  809d0b:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809d0f:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809d16:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809d19:	48 c7 05 9c 15 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2159c],0x0        # 42b2c0 <running_req>
  809d20:	00 00 00 00 
    return ret;
  809d24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809d27:	c9                   	leave  
  809d28:	c3                   	ret    

0000000000809d29 <write_disk>:
int write_disk(driver_args* args)
{
  809d29:	f3 0f 1e fa          	endbr64 
  809d2d:	55                   	push   rbp
  809d2e:	48 89 e5             	mov    rbp,rsp
  809d31:	48 83 ec 20          	sub    rsp,0x20
  809d35:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  809d39:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d3d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809d40:	48 98                	cdqe   
  809d42:	48 89 c2             	mov    rdx,rax
  809d45:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d49:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809d4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d50:	8b 00                	mov    eax,DWORD PTR [rax]
  809d52:	89 ce                	mov    esi,ecx
  809d54:	89 c7                	mov    edi,eax
  809d56:	e8 c1 05 00 00       	call   80a31c <write_disk_asm>
  809d5b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809d5e:	48 8b 05 5b 15 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2155b]        # 42b2c0 <running_req>
  809d65:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809d6c:	48 8b 05 4d 15 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2154d]        # 42b2c0 <running_req>
  809d73:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809d77:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809d7e:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809d81:	48 c7 05 34 15 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21534],0x0        # 42b2c0 <running_req>
  809d88:	00 00 00 00 
    return ret;
  809d8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809d8f:	c9                   	leave  
  809d90:	c3                   	ret    

0000000000809d91 <chk_result>:
int chk_result(int r)
{
  809d91:	f3 0f 1e fa          	endbr64 
  809d95:	55                   	push   rbp
  809d96:	48 89 e5             	mov    rbp,rsp
  809d99:	48 83 ec 10          	sub    rsp,0x10
  809d9d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  809da0:	90                   	nop
  809da1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809da4:	48 63 d0             	movsxd rdx,eax
  809da7:	48 89 d0             	mov    rax,rdx
  809daa:	48 01 c0             	add    rax,rax
  809dad:	48 01 d0             	add    rax,rdx
  809db0:	48 c1 e0 04          	shl    rax,0x4
  809db4:	48 05 dc 85 42 00    	add    rax,0x4285dc
  809dba:	8b 00                	mov    eax,DWORD PTR [rax]
  809dbc:	83 f8 03             	cmp    eax,0x3
  809dbf:	75 e0                	jne    809da1 <chk_result+0x10>
    if(disk_reqs[r].result==DISK_CHK_OK)
  809dc1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809dc4:	48 63 d0             	movsxd rdx,eax
  809dc7:	48 89 d0             	mov    rax,rdx
  809dca:	48 01 c0             	add    rax,rax
  809dcd:	48 01 d0             	add    rax,rdx
  809dd0:	48 c1 e0 04          	shl    rax,0x4
  809dd4:	48 05 e0 85 42 00    	add    rax,0x4285e0
  809dda:	8b 00                	mov    eax,DWORD PTR [rax]
  809ddc:	83 f8 01             	cmp    eax,0x1
  809ddf:	75 07                	jne    809de8 <chk_result+0x57>
        return 1;
  809de1:	b8 01 00 00 00       	mov    eax,0x1
  809de6:	eb 14                	jmp    809dfc <chk_result+0x6b>
    comprintf("disk err\n");
  809de8:	bf c8 59 81 00       	mov    edi,0x8159c8
  809ded:	b8 00 00 00 00       	mov    eax,0x0
  809df2:	e8 d0 2f 00 00       	call   80cdc7 <comprintf>
    return 0;
  809df7:	b8 00 00 00 00       	mov    eax,0x0
}
  809dfc:	c9                   	leave  
  809dfd:	c3                   	ret    

0000000000809dfe <disk_existent>:
int disk_existent(int disk)
{
  809dfe:	f3 0f 1e fa          	endbr64 
  809e02:	55                   	push   rbp
  809e03:	48 89 e5             	mov    rbp,rsp
  809e06:	48 83 ec 10          	sub    rsp,0x10
  809e0a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  809e0d:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809e11:	74 5f                	je     809e72 <disk_existent+0x74>
  809e13:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809e17:	7f 6e                	jg     809e87 <disk_existent+0x89>
  809e19:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809e1d:	74 3e                	je     809e5d <disk_existent+0x5f>
  809e1f:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809e23:	7f 62                	jg     809e87 <disk_existent+0x89>
  809e25:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809e29:	74 08                	je     809e33 <disk_existent+0x35>
  809e2b:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  809e2f:	74 17                	je     809e48 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  809e31:	eb 54                	jmp    809e87 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  809e33:	bf d2 59 81 00       	mov    edi,0x8159d2
  809e38:	e8 23 95 ff ff       	call   803360 <sys_find_dev>
  809e3d:	83 f8 ff             	cmp    eax,0xffffffff
  809e40:	0f 95 c0             	setne  al
  809e43:	0f b6 c0             	movzx  eax,al
  809e46:	eb 45                	jmp    809e8d <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  809e48:	bf d6 59 81 00       	mov    edi,0x8159d6
  809e4d:	e8 0e 95 ff ff       	call   803360 <sys_find_dev>
  809e52:	83 f8 ff             	cmp    eax,0xffffffff
  809e55:	0f 95 c0             	setne  al
  809e58:	0f b6 c0             	movzx  eax,al
  809e5b:	eb 30                	jmp    809e8d <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  809e5d:	bf da 59 81 00       	mov    edi,0x8159da
  809e62:	e8 f9 94 ff ff       	call   803360 <sys_find_dev>
  809e67:	83 f8 ff             	cmp    eax,0xffffffff
  809e6a:	0f 95 c0             	setne  al
  809e6d:	0f b6 c0             	movzx  eax,al
  809e70:	eb 1b                	jmp    809e8d <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  809e72:	bf de 59 81 00       	mov    edi,0x8159de
  809e77:	e8 e4 94 ff ff       	call   803360 <sys_find_dev>
  809e7c:	83 f8 ff             	cmp    eax,0xffffffff
  809e7f:	0f 95 c0             	setne  al
  809e82:	0f b6 c0             	movzx  eax,al
  809e85:	eb 06                	jmp    809e8d <disk_existent+0x8f>
        break;
  809e87:	90                   	nop
    }
    return 0;
  809e88:	b8 00 00 00 00       	mov    eax,0x0
}
  809e8d:	c9                   	leave  
  809e8e:	c3                   	ret    

0000000000809e8f <hd_iterate>:
int hd_iterate()
{
  809e8f:	f3 0f 1e fa          	endbr64 
  809e93:	55                   	push   rbp
  809e94:	48 89 e5             	mov    rbp,rsp
  809e97:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  809e9e:	41 b8 00 00 00 00    	mov    r8d,0x0
  809ea4:	b9 01 00 00 00       	mov    ecx,0x1
  809ea9:	ba 00 00 00 00       	mov    edx,0x0
  809eae:	be 02 00 00 00       	mov    esi,0x2
  809eb3:	bf 00 00 00 00       	mov    edi,0x0
  809eb8:	e8 20 f8 ff ff       	call   8096dd <request>
  809ebd:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  809ec0:	41 b8 00 00 00 00    	mov    r8d,0x0
  809ec6:	b9 01 00 00 00       	mov    ecx,0x1
  809ecb:	ba 00 00 00 00       	mov    edx,0x0
  809ed0:	be 02 00 00 00       	mov    esi,0x2
  809ed5:	bf 01 00 00 00       	mov    edi,0x1
  809eda:	e8 fe f7 ff ff       	call   8096dd <request>
  809edf:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  809ee2:	41 b8 00 00 00 00    	mov    r8d,0x0
  809ee8:	b9 01 00 00 00       	mov    ecx,0x1
  809eed:	ba 00 00 00 00       	mov    edx,0x0
  809ef2:	be 02 00 00 00       	mov    esi,0x2
  809ef7:	bf 02 00 00 00       	mov    edi,0x2
  809efc:	e8 dc f7 ff ff       	call   8096dd <request>
  809f01:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  809f04:	41 b8 00 00 00 00    	mov    r8d,0x0
  809f0a:	b9 01 00 00 00       	mov    ecx,0x1
  809f0f:	ba 00 00 00 00       	mov    edx,0x0
  809f14:	be 02 00 00 00       	mov    esi,0x2
  809f19:	bf 03 00 00 00       	mov    edi,0x3
  809f1e:	e8 ba f7 ff ff       	call   8096dd <request>
  809f23:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  809f26:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809f2d:	e9 72 01 00 00       	jmp    80a0a4 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  809f32:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809f36:	74 3b                	je     809f73 <hd_iterate+0xe4>
  809f38:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809f3c:	7f 3e                	jg     809f7c <hd_iterate+0xed>
  809f3e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809f42:	74 26                	je     809f6a <hd_iterate+0xdb>
  809f44:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809f48:	7f 32                	jg     809f7c <hd_iterate+0xed>
  809f4a:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809f4e:	74 08                	je     809f58 <hd_iterate+0xc9>
  809f50:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  809f54:	74 0b                	je     809f61 <hd_iterate+0xd2>
  809f56:	eb 24                	jmp    809f7c <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  809f58:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809f5f:	eb 25                	jmp    809f86 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  809f61:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  809f68:	eb 1c                	jmp    809f86 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  809f6a:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  809f71:	eb 13                	jmp    809f86 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  809f73:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  809f7a:	eb 0a                	jmp    809f86 <hd_iterate+0xf7>
        default:
            return -1;
  809f7c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809f81:	e9 28 01 00 00       	jmp    80a0ae <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  809f86:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809f89:	48 98                	cdqe   
  809f8b:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  809f8f:	89 c7                	mov    edi,eax
  809f91:	e8 fb fd ff ff       	call   809d91 <chk_result>
  809f96:	85 c0                	test   eax,eax
  809f98:	0f 84 81 00 00 00    	je     80a01f <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  809f9e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809fa1:	89 c6                	mov    esi,eax
  809fa3:	bf e2 59 81 00       	mov    edi,0x8159e2
  809fa8:	b8 00 00 00 00       	mov    eax,0x0
  809fad:	e8 c5 6d ff ff       	call   800d77 <printf>
            //新硬盘
            device hd={
  809fb2:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  809fb9:	b8 00 00 00 00       	mov    eax,0x0
  809fbe:	b9 15 00 00 00       	mov    ecx,0x15
  809fc3:	48 89 d7             	mov    rdi,rdx
  809fc6:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  809fc9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809fcc:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  809fd2:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  809fd9:	00 00 00 
  809fdc:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  809fe3:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  809fe6:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  809fea:	7f 07                	jg     809ff3 <hd_iterate+0x164>
  809fec:	b8 f0 01 00 00       	mov    eax,0x1f0
  809ff1:	eb 05                	jmp    809ff8 <hd_iterate+0x169>
  809ff3:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  809ff8:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  809ffe:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80a005:	48 89 c7             	mov    rdi,rax
  80a008:	e8 1b 8f ff ff       	call   802f28 <reg_device>
  80a00d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a010:	48 63 d2             	movsxd rdx,edx
  80a013:	89 04 95 e0 b2 42 00 	mov    DWORD PTR [rdx*4+0x42b2e0],eax
  80a01a:	e9 81 00 00 00       	jmp    80a0a0 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80a01f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a022:	48 98                	cdqe   
  80a024:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80a028:	89 c7                	mov    edi,eax
  80a02a:	e8 62 fd ff ff       	call   809d91 <chk_result>
  80a02f:	85 c0                	test   eax,eax
  80a031:	75 6d                	jne    80a0a0 <hd_iterate+0x211>
        {
            switch (i)
  80a033:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a037:	74 3e                	je     80a077 <hd_iterate+0x1e8>
  80a039:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a03d:	7f 41                	jg     80a080 <hd_iterate+0x1f1>
  80a03f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a043:	74 28                	je     80a06d <hd_iterate+0x1de>
  80a045:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a049:	7f 35                	jg     80a080 <hd_iterate+0x1f1>
  80a04b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a04f:	74 08                	je     80a059 <hd_iterate+0x1ca>
  80a051:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a055:	74 0c                	je     80a063 <hd_iterate+0x1d4>
  80a057:	eb 27                	jmp    80a080 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80a059:	48 c7 45 f8 d2 59 81 	mov    QWORD PTR [rbp-0x8],0x8159d2
  80a060:	00 
  80a061:	eb 1d                	jmp    80a080 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80a063:	48 c7 45 f8 d6 59 81 	mov    QWORD PTR [rbp-0x8],0x8159d6
  80a06a:	00 
  80a06b:	eb 13                	jmp    80a080 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  80a06d:	48 c7 45 f8 da 59 81 	mov    QWORD PTR [rbp-0x8],0x8159da
  80a074:	00 
  80a075:	eb 09                	jmp    80a080 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  80a077:	48 c7 45 f8 de 59 81 	mov    QWORD PTR [rbp-0x8],0x8159de
  80a07e:	00 
  80a07f:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80a080:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a084:	48 89 c7             	mov    rdi,rax
  80a087:	e8 d4 92 ff ff       	call   803360 <sys_find_dev>
  80a08c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80a08f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a092:	89 c7                	mov    edi,eax
  80a094:	e8 9b 99 ff ff       	call   803a34 <get_dev>
  80a099:	89 c7                	mov    edi,eax
  80a09b:	e8 e7 98 ff ff       	call   803987 <dispose_device>
    for(int i=0;i<1;i++)
  80a0a0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a0a4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a0a8:	0f 8e 84 fe ff ff    	jle    809f32 <hd_iterate+0xa3>
        }

    }
}
  80a0ae:	c9                   	leave  
  80a0af:	c3                   	ret    

000000000080a0b0 <async_check_disk>:

int async_check_disk(int disk)
{
  80a0b0:	f3 0f 1e fa          	endbr64 
  80a0b4:	55                   	push   rbp
  80a0b5:	48 89 e5             	mov    rbp,rsp
  80a0b8:	48 83 ec 20          	sub    rsp,0x20
  80a0bc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80a0bf:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  80a0c5:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80a0cb:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80a0cf:	74 06                	je     80a0d7 <async_check_disk+0x27>
  80a0d1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a0d5:	75 06                	jne    80a0dd <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80a0d7:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  80a0dd:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80a0e1:	74 06                	je     80a0e9 <async_check_disk+0x39>
  80a0e3:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a0e7:	75 06                	jne    80a0ef <async_check_disk+0x3f>
        chkcmd=0xf0;
  80a0e9:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80a0ef:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a0f3:	83 c0 02             	add    eax,0x2
  80a0f6:	0f b7 c0             	movzx  eax,ax
  80a0f9:	be 01 00 00 00       	mov    esi,0x1
  80a0fe:	89 c7                	mov    edi,eax
  80a100:	e8 eb c5 ff ff       	call   8066f0 <outb>
    outb(disknr+3,0);
  80a105:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a109:	83 c0 03             	add    eax,0x3
  80a10c:	0f b7 c0             	movzx  eax,ax
  80a10f:	be 00 00 00 00       	mov    esi,0x0
  80a114:	89 c7                	mov    edi,eax
  80a116:	e8 d5 c5 ff ff       	call   8066f0 <outb>
    outb(disknr+4,0);
  80a11b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a11f:	83 c0 04             	add    eax,0x4
  80a122:	0f b7 c0             	movzx  eax,ax
  80a125:	be 00 00 00 00       	mov    esi,0x0
  80a12a:	89 c7                	mov    edi,eax
  80a12c:	e8 bf c5 ff ff       	call   8066f0 <outb>
    outb(disknr+5,0);
  80a131:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a135:	83 c0 05             	add    eax,0x5
  80a138:	0f b7 c0             	movzx  eax,ax
  80a13b:	be 00 00 00 00       	mov    esi,0x0
  80a140:	89 c7                	mov    edi,eax
  80a142:	e8 a9 c5 ff ff       	call   8066f0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80a147:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80a14b:	0f b6 d0             	movzx  edx,al
  80a14e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a152:	83 c0 06             	add    eax,0x6
  80a155:	0f b7 c0             	movzx  eax,ax
  80a158:	89 d6                	mov    esi,edx
  80a15a:	89 c7                	mov    edi,eax
  80a15c:	e8 8f c5 ff ff       	call   8066f0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80a161:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a165:	83 c0 07             	add    eax,0x7
  80a168:	0f b7 c0             	movzx  eax,ax
  80a16b:	be 90 00 00 00       	mov    esi,0x90
  80a170:	89 c7                	mov    edi,eax
  80a172:	e8 79 c5 ff ff       	call   8066f0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  80a177:	b8 00 00 00 00       	mov    eax,0x0
}
  80a17c:	c9                   	leave  
  80a17d:	c3                   	ret    

000000000080a17e <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80a17e:	f3 0f 1e fa          	endbr64 
  80a182:	55                   	push   rbp
  80a183:	48 89 e5             	mov    rbp,rsp
  80a186:	48 83 ec 18          	sub    rsp,0x18
  80a18a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80a18e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  80a195:	eb 04                	jmp    80a19b <hd_do_req+0x1d>
  80a197:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a19b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a19e:	48 98                	cdqe   
  80a1a0:	8b 14 85 e0 b2 42 00 	mov    edx,DWORD PTR [rax*4+0x42b2e0]
  80a1a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1ab:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80a1b1:	39 c2                	cmp    edx,eax
  80a1b3:	75 e2                	jne    80a197 <hd_do_req+0x19>
    switch (args->cmd)
  80a1b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1b9:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a1bf:	83 f8 04             	cmp    eax,0x4
  80a1c2:	74 72                	je     80a236 <hd_do_req+0xb8>
  80a1c4:	83 f8 04             	cmp    eax,0x4
  80a1c7:	0f 8f 96 00 00 00    	jg     80a263 <hd_do_req+0xe5>
  80a1cd:	83 f8 02             	cmp    eax,0x2
  80a1d0:	74 0a                	je     80a1dc <hd_do_req+0x5e>
  80a1d2:	83 f8 03             	cmp    eax,0x3
  80a1d5:	74 32                	je     80a209 <hd_do_req+0x8b>
  80a1d7:	e9 87 00 00 00       	jmp    80a263 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80a1dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1e0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a1e3:	48 98                	cdqe   
  80a1e5:	48 89 c6             	mov    rsi,rax
  80a1e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1ec:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a1ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1f3:	8b 10                	mov    edx,DWORD PTR [rax]
  80a1f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1f8:	49 89 f0             	mov    r8,rsi
  80a1fb:	be 00 00 00 00       	mov    esi,0x0
  80a200:	89 c7                	mov    edi,eax
  80a202:	e8 d6 f4 ff ff       	call   8096dd <request>
        break;
  80a207:	eb 61                	jmp    80a26a <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  80a209:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a20d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a210:	48 98                	cdqe   
  80a212:	48 89 c6             	mov    rsi,rax
  80a215:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a219:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a21c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a220:	8b 10                	mov    edx,DWORD PTR [rax]
  80a222:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a225:	49 89 f0             	mov    r8,rsi
  80a228:	be 01 00 00 00       	mov    esi,0x1
  80a22d:	89 c7                	mov    edi,eax
  80a22f:	e8 a9 f4 ff ff       	call   8096dd <request>
        break;
  80a234:	eb 34                	jmp    80a26a <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  80a236:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a23a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a23d:	48 98                	cdqe   
  80a23f:	48 89 c6             	mov    rsi,rax
  80a242:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a246:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a249:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a24d:	8b 10                	mov    edx,DWORD PTR [rax]
  80a24f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a252:	49 89 f0             	mov    r8,rsi
  80a255:	be 02 00 00 00       	mov    esi,0x2
  80a25a:	89 c7                	mov    edi,eax
  80a25c:	e8 7c f4 ff ff       	call   8096dd <request>
        break;
  80a261:	eb 07                	jmp    80a26a <hd_do_req+0xec>
    default:return -1;
  80a263:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a268:	eb 1e                	jmp    80a288 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80a26a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a26e:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  80a275:	00 00 00 
    running_devman_req=args;
  80a278:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a27c:	48 89 05 45 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21045],rax        # 42b2c8 <running_devman_req>
    return 0;
  80a283:	b8 00 00 00 00       	mov    eax,0x0
  80a288:	c9                   	leave  
  80a289:	c3                   	ret    
  80a28a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080a290 <disk_int_handler>:
  80a290:	e8 89 c4 ff ff       	call   80671e <eoi>
  80a295:	e8 38 f2 ff ff       	call   8094d2 <disk_int_handler_c>
  80a29a:	48 cf                	iretq  

000000000080a29c <read_disk_asm>:
  80a29c:	55                   	push   rbp
  80a29d:	89 e5                	mov    ebp,esp
  80a29f:	66 ba f7 01          	mov    dx,0x1f7
  80a2a3:	31 c9                	xor    ecx,ecx
  80a2a5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a2aa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a2af:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a2b4:	89 c6                	mov    esi,eax
  80a2b6:	66 ba f2 01          	mov    dx,0x1f2
  80a2ba:	88 c8                	mov    al,cl
  80a2bc:	ee                   	out    dx,al
  80a2bd:	66 ba f3 01          	mov    dx,0x1f3
  80a2c1:	89 f0                	mov    eax,esi
  80a2c3:	ee                   	out    dx,al
  80a2c4:	66 ff c2             	inc    dx
  80a2c7:	c1 e8 08             	shr    eax,0x8
  80a2ca:	ee                   	out    dx,al
  80a2cb:	66 ff c2             	inc    dx
  80a2ce:	c1 e8 08             	shr    eax,0x8
  80a2d1:	ee                   	out    dx,al
  80a2d2:	66 ff c2             	inc    dx
  80a2d5:	66 c1 e8 08          	shr    ax,0x8
  80a2d9:	24 0f                	and    al,0xf
  80a2db:	0c e0                	or     al,0xe0
  80a2dd:	ee                   	out    dx,al
  80a2de:	66 ff c2             	inc    dx
  80a2e1:	b0 20                	mov    al,0x20
  80a2e3:	ee                   	out    dx,al

000000000080a2e4 <read_disk_asm.wait>:
  80a2e4:	90                   	nop
  80a2e5:	ec                   	in     al,dx
  80a2e6:	24 88                	and    al,0x88
  80a2e8:	3c 08                	cmp    al,0x8
  80a2ea:	75 f8                	jne    80a2e4 <read_disk_asm.wait>
  80a2ec:	66 89 d7             	mov    di,dx
  80a2ef:	89 c8                	mov    eax,ecx
  80a2f1:	66 b9 00 01          	mov    cx,0x100
  80a2f5:	66 f7 e1             	mul    cx
  80a2f8:	89 c1                	mov    ecx,eax
  80a2fa:	66 ba f0 01          	mov    dx,0x1f0

000000000080a2fe <read_disk_asm.read>:
  80a2fe:	66 ed                	in     ax,dx
  80a300:	66 67 89 03          	mov    WORD PTR [ebx],ax
  80a304:	83 c3 02             	add    ebx,0x2
  80a307:	e2 f5                	loop   80a2fe <read_disk_asm.read>
  80a309:	c9                   	leave  
  80a30a:	b8 00 00 00 00       	mov    eax,0x0
  80a30f:	c3                   	ret    

000000000080a310 <read_disk_asm.err_disk_reading>:
  80a310:	66 ba f1 01          	mov    dx,0x1f1
  80a314:	31 c0                	xor    eax,eax
  80a316:	66 ed                	in     ax,dx
  80a318:	89 ec                	mov    esp,ebp
  80a31a:	5d                   	pop    rbp
  80a31b:	c3                   	ret    

000000000080a31c <write_disk_asm>:
  80a31c:	55                   	push   rbp
  80a31d:	89 e5                	mov    ebp,esp
  80a31f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a324:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a329:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a32e:	50                   	push   rax
  80a32f:	66 ba f2 01          	mov    dx,0x1f2
  80a333:	88 c8                	mov    al,cl
  80a335:	ee                   	out    dx,al
  80a336:	58                   	pop    rax
  80a337:	66 ba f3 01          	mov    dx,0x1f3
  80a33b:	ee                   	out    dx,al
  80a33c:	c1 e8 08             	shr    eax,0x8
  80a33f:	66 ba f4 01          	mov    dx,0x1f4
  80a343:	ee                   	out    dx,al
  80a344:	c1 e8 08             	shr    eax,0x8
  80a347:	66 ba f5 01          	mov    dx,0x1f5
  80a34b:	ee                   	out    dx,al
  80a34c:	c1 e8 08             	shr    eax,0x8
  80a34f:	24 0f                	and    al,0xf
  80a351:	0c e0                	or     al,0xe0
  80a353:	66 ba f6 01          	mov    dx,0x1f6
  80a357:	ee                   	out    dx,al
  80a358:	66 ba f7 01          	mov    dx,0x1f7
  80a35c:	b0 30                	mov    al,0x30
  80a35e:	ee                   	out    dx,al

000000000080a35f <write_disk_asm.not_ready2>:
  80a35f:	90                   	nop
  80a360:	ec                   	in     al,dx
  80a361:	24 88                	and    al,0x88
  80a363:	3c 08                	cmp    al,0x8
  80a365:	75 f8                	jne    80a35f <write_disk_asm.not_ready2>
  80a367:	89 c8                	mov    eax,ecx
  80a369:	66 b9 00 01          	mov    cx,0x100
  80a36d:	66 f7 e1             	mul    cx
  80a370:	89 c1                	mov    ecx,eax
  80a372:	66 ba f0 01          	mov    dx,0x1f0

000000000080a376 <write_disk_asm.go_on_write>:
  80a376:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80a37a:	66 ef                	out    dx,ax
  80a37c:	83 c3 02             	add    ebx,0x2
  80a37f:	e2 f5                	loop   80a376 <write_disk_asm.go_on_write>
  80a381:	89 ec                	mov    esp,ebp
  80a383:	5d                   	pop    rbp
  80a384:	c3                   	ret    

000000000080a385 <DISK1_FAT32_read_FAT_Entry>:
#include "memory.h"
#include "proc.h"
#include "devman.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  80a385:	f3 0f 1e fa          	endbr64 
  80a389:	55                   	push   rbp
  80a38a:	48 89 e5             	mov    rbp,rsp
  80a38d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a394:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a39b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  80a3a1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a3a8:	ba 00 02 00 00       	mov    edx,0x200
  80a3ad:	be 00 00 00 00       	mov    esi,0x0
  80a3b2:	48 89 c7             	mov    rdi,rax
  80a3b5:	e8 2f 2b 00 00       	call   80cee9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a3ba:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a3c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a3c5:	89 c2                	mov    edx,eax
  80a3c7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a3cd:	c1 e8 07             	shr    eax,0x7
  80a3d0:	01 d0                	add    eax,edx
  80a3d2:	89 c2                	mov    edx,eax
  80a3d4:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a3db:	49 89 c0             	mov    r8,rax
  80a3de:	b9 01 00 00 00       	mov    ecx,0x1
  80a3e3:	be 00 00 00 00       	mov    esi,0x0
  80a3e8:	bf 00 00 00 00       	mov    edi,0x0
  80a3ed:	e8 eb f2 ff ff       	call   8096dd <request>
  80a3f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  80a3f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3f8:	89 c7                	mov    edi,eax
  80a3fa:	e8 92 f9 ff ff       	call   809d91 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80a3ff:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a405:	83 e0 7f             	and    eax,0x7f
  80a408:	89 c0                	mov    eax,eax
  80a40a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  80a411:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a417:	89 c6                	mov    esi,eax
  80a419:	bf f8 59 81 00       	mov    edi,0x8159f8
  80a41e:	b8 00 00 00 00       	mov    eax,0x0
  80a423:	e8 4f 69 ff ff       	call   800d77 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  80a428:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a42e:	83 e0 7f             	and    eax,0x7f
  80a431:	89 c0                	mov    eax,eax
  80a433:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a43a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80a43f:	c9                   	leave  
  80a440:	c3                   	ret    

000000000080a441 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  80a441:	f3 0f 1e fa          	endbr64 
  80a445:	55                   	push   rbp
  80a446:	48 89 e5             	mov    rbp,rsp
  80a449:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a450:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a457:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80a45d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  80a463:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a46a:	ba 00 02 00 00       	mov    edx,0x200
  80a46f:	be 00 00 00 00       	mov    esi,0x0
  80a474:	48 89 c7             	mov    rdi,rax
  80a477:	e8 6d 2a 00 00       	call   80cee9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a47c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a483:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a487:	89 c2                	mov    edx,eax
  80a489:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a48f:	c1 e8 07             	shr    eax,0x7
  80a492:	01 d0                	add    eax,edx
  80a494:	89 c2                	mov    edx,eax
  80a496:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a49d:	49 89 c0             	mov    r8,rax
  80a4a0:	b9 01 00 00 00       	mov    ecx,0x1
  80a4a5:	be 00 00 00 00       	mov    esi,0x0
  80a4aa:	bf 00 00 00 00       	mov    edi,0x0
  80a4af:	e8 29 f2 ff ff       	call   8096dd <request>
  80a4b4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  80a4b7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a4ba:	89 c7                	mov    edi,eax
  80a4bc:	e8 d0 f8 ff ff       	call   809d91 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  80a4c1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4c7:	83 e0 7f             	and    eax,0x7f
  80a4ca:	89 c0                	mov    eax,eax
  80a4cc:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a4d3:	25 00 00 00 f0       	and    eax,0xf0000000
  80a4d8:	89 c6                	mov    esi,eax
  80a4da:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  80a4e0:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a4e5:	89 c1                	mov    ecx,eax
  80a4e7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4ed:	83 e0 7f             	and    eax,0x7f
  80a4f0:	89 c2                	mov    edx,eax
  80a4f2:	89 f0                	mov    eax,esi
  80a4f4:	09 c8                	or     eax,ecx
  80a4f6:	89 d2                	mov    edx,edx
  80a4f8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80a4ff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a506:	eb 61                	jmp    80a569 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  80a508:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a50f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a513:	89 c1                	mov    ecx,eax
  80a515:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a51c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a520:	89 c2                	mov    edx,eax
  80a522:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a525:	48 98                	cdqe   
  80a527:	0f af c2             	imul   eax,edx
  80a52a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80a52d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a533:	c1 e8 07             	shr    eax,0x7
  80a536:	01 d0                	add    eax,edx
  80a538:	89 c2                	mov    edx,eax
  80a53a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a541:	49 89 c0             	mov    r8,rax
  80a544:	b9 01 00 00 00       	mov    ecx,0x1
  80a549:	be 01 00 00 00       	mov    esi,0x1
  80a54e:	bf 00 00 00 00       	mov    edi,0x0
  80a553:	e8 85 f1 ff ff       	call   8096dd <request>
  80a558:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80a55b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a55e:	89 c7                	mov    edi,eax
  80a560:	e8 2c f8 ff ff       	call   809d91 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  80a565:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a569:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a56c:	48 63 d0             	movsxd rdx,eax
  80a56f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a576:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a57a:	48 39 c2             	cmp    rdx,rax
  80a57d:	72 89                	jb     80a508 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80a57f:	b8 01 00 00 00       	mov    eax,0x1
}
  80a584:	c9                   	leave  
  80a585:	c3                   	ret    

000000000080a586 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  80a586:	f3 0f 1e fa          	endbr64 
  80a58a:	55                   	push   rbp
  80a58b:	48 89 e5             	mov    rbp,rsp
  80a58e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a592:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a596:	b8 01 00 00 00       	mov    eax,0x1
}
  80a59b:	5d                   	pop    rbp
  80a59c:	c3                   	ret    

000000000080a59d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80a59d:	f3 0f 1e fa          	endbr64 
  80a5a1:	55                   	push   rbp
  80a5a2:	48 89 e5             	mov    rbp,rsp
  80a5a5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a5a9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a5ad:	b8 01 00 00 00       	mov    eax,0x1
}
  80a5b2:	5d                   	pop    rbp
  80a5b3:	c3                   	ret    

000000000080a5b4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a5b4:	f3 0f 1e fa          	endbr64 
  80a5b8:	55                   	push   rbp
  80a5b9:	48 89 e5             	mov    rbp,rsp
  80a5bc:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80a5c0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80a5c4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80a5c8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80a5cc:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a5d0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a5d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a5d8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a5dc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a5e0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a5e4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a5e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a5ec:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a5f0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a5f4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a5f8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80a5fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a600:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a603:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  80a607:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a60e:	00 
	int i,length = 0;
  80a60f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  80a616:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a61d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a61e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a622:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a625:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a629:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a62d:	48 99                	cqo    
  80a62f:	48 f7 fe             	idiv   rsi
  80a632:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a635:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a639:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a63c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a640:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a644:	48 99                	cqo    
  80a646:	48 f7 f9             	idiv   rcx
  80a649:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a64d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a651:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a655:	be 00 00 00 00       	mov    esi,0x0
  80a65a:	48 89 c7             	mov    rdi,rax
  80a65d:	b8 00 00 00 00       	mov    eax,0x0
  80a662:	e8 ab 6a ff ff       	call   801112 <vmalloc>
  80a667:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80a66b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a670:	75 0c                	jne    80a67e <FAT32_read+0xca>
		return -EFAULT;
  80a672:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80a679:	e9 f0 01 00 00       	jmp    80a86e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80a67e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a685:	eb 1e                	jmp    80a6a5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a687:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a68b:	89 c2                	mov    edx,eax
  80a68d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a691:	89 d6                	mov    esi,edx
  80a693:	48 89 c7             	mov    rdi,rax
  80a696:	e8 ea fc ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80a69b:	89 c0                	mov    eax,eax
  80a69d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  80a6a1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a6a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a6a8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a6ab:	7c da                	jl     80a687 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80a6ad:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a6b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a6b4:	48 89 c2             	mov    rdx,rax
  80a6b7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a6bb:	48 01 c2             	add    rdx,rax
  80a6be:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a6c2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6c6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a6ca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a6cd:	48 39 c2             	cmp    rdx,rax
  80a6d0:	76 2c                	jbe    80a6fe <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  80a6d2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a6d6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6da:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a6de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a6e1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a6e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a6e8:	48 89 c1             	mov    rcx,rax
  80a6eb:	48 89 d0             	mov    rax,rdx
  80a6ee:	48 29 c8             	sub    rax,rcx
  80a6f1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80a6f5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a6f9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80a6fc:	eb 07                	jmp    80a705 <FAT32_read+0x151>
	else
		index = count;
  80a6fe:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a702:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  80a705:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a709:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a70d:	89 c2                	mov    edx,eax
  80a70f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a713:	be 00 00 00 00       	mov    esi,0x0
  80a718:	48 89 c7             	mov    rdi,rax
  80a71b:	e8 c9 27 00 00       	call   80cee9 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a720:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a724:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a728:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a72c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a730:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a734:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a738:	48 0f af c2          	imul   rax,rdx
  80a73c:	48 01 c8             	add    rax,rcx
  80a73f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a743:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a747:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a74b:	89 c1                	mov    ecx,eax
  80a74d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a751:	89 c2                	mov    edx,eax
  80a753:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a757:	49 89 c0             	mov    r8,rax
  80a75a:	be 00 00 00 00       	mov    esi,0x0
  80a75f:	bf 00 00 00 00       	mov    edi,0x0
  80a764:	e8 74 ef ff ff       	call   8096dd <request>
  80a769:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80a76c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a76f:	89 c7                	mov    edi,eax
  80a771:	e8 1b f6 ff ff       	call   809d91 <chk_result>
  80a776:	85 c0                	test   eax,eax
  80a778:	75 1c                	jne    80a796 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80a77a:	bf 28 5a 81 00       	mov    edi,0x815a28
  80a77f:	b8 00 00 00 00       	mov    eax,0x0
  80a784:	e8 ee 65 ff ff       	call   800d77 <printf>
			retval = -EIO;
  80a789:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  80a790:	ff 
			break;
  80a791:	e9 ba 00 00 00       	jmp    80a850 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80a796:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a799:	48 63 d0             	movsxd rdx,eax
  80a79c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a7a0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a7a4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  80a7a8:	48 39 c2             	cmp    rdx,rax
  80a7ab:	48 0f 4e c2          	cmovle rax,rdx
  80a7af:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  80a7b2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a7b6:	48 83 f8 1f          	cmp    rax,0x1f
  80a7ba:	77 1f                	ja     80a7db <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80a7bc:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a7bf:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a7c3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a7c7:	48 01 c1             	add    rcx,rax
  80a7ca:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a7ce:	48 89 c6             	mov    rsi,rax
  80a7d1:	48 89 cf             	mov    rdi,rcx
  80a7d4:	e8 61 26 00 00       	call   80ce3a <memcpy>
  80a7d9:	eb 1d                	jmp    80a7f8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80a7db:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a7de:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a7e2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a7e6:	48 01 c1             	add    rcx,rax
  80a7e9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a7ed:	48 89 c6             	mov    rsi,rax
  80a7f0:	48 89 cf             	mov    rdi,rcx
  80a7f3:	e8 42 26 00 00       	call   80ce3a <memcpy>

		index -= length;
  80a7f8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a7fb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80a7fe:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a801:	48 98                	cdqe   
  80a803:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  80a807:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a80e:	00 
		*position += length;
  80a80f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a813:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a816:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a819:	48 98                	cdqe   
  80a81b:	48 01 c2             	add    rdx,rax
  80a81e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a822:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  80a825:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a829:	74 25                	je     80a850 <FAT32_read+0x29c>
  80a82b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a82f:	89 c2                	mov    edx,eax
  80a831:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a835:	89 d6                	mov    esi,edx
  80a837:	48 89 c7             	mov    rdi,rax
  80a83a:	e8 46 fb ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80a83f:	89 c0                	mov    eax,eax
  80a841:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a845:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a84a:	0f 85 b5 fe ff ff    	jne    80a705 <FAT32_read+0x151>

	vmfree(buffer);
  80a850:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a854:	48 89 c7             	mov    rdi,rax
  80a857:	e8 56 69 ff ff       	call   8011b2 <vmfree>
	if(!index)
  80a85c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a860:	75 08                	jne    80a86a <FAT32_read+0x2b6>
		retval = count;
  80a862:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a866:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80a86a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80a86e:	c9                   	leave  
  80a86f:	c3                   	ret    

000000000080a870 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  80a870:	f3 0f 1e fa          	endbr64 
  80a874:	55                   	push   rbp
  80a875:	48 89 e5             	mov    rbp,rsp
  80a878:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80a87f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  80a886:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a88d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a891:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  80a895:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a89c:	e9 8b 00 00 00       	jmp    80a92c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  80a8a1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a8a8:	ba 00 02 00 00       	mov    edx,0x200
  80a8ad:	be 00 00 00 00       	mov    esi,0x0
  80a8b2:	48 89 c7             	mov    rdi,rax
  80a8b5:	e8 2f 26 00 00       	call   80cee9 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80a8ba:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a8c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a8c5:	89 c2                	mov    edx,eax
  80a8c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a8ca:	01 d0                	add    eax,edx
  80a8cc:	89 c2                	mov    edx,eax
  80a8ce:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a8d5:	49 89 c0             	mov    r8,rax
  80a8d8:	b9 01 00 00 00       	mov    ecx,0x1
  80a8dd:	be 00 00 00 00       	mov    esi,0x0
  80a8e2:	bf 00 00 00 00       	mov    edi,0x0
  80a8e7:	e8 f1 ed ff ff       	call   8096dd <request>
  80a8ec:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80a8ef:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a8f6:	eb 2a                	jmp    80a922 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  80a8f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a8fb:	48 98                	cdqe   
  80a8fd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  80a904:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a909:	85 c0                	test   eax,eax
  80a90b:	75 11                	jne    80a91e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80a90d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a910:	c1 e0 07             	shl    eax,0x7
  80a913:	89 c2                	mov    edx,eax
  80a915:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a918:	01 d0                	add    eax,edx
  80a91a:	48 98                	cdqe   
  80a91c:	eb 22                	jmp    80a940 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  80a91e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80a922:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  80a926:	7e d0                	jle    80a8f8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  80a928:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a92c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a92f:	48 98                	cdqe   
  80a931:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80a935:	0f 87 66 ff ff ff    	ja     80a8a1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  80a93b:	b8 00 00 00 00       	mov    eax,0x0
}
  80a940:	c9                   	leave  
  80a941:	c3                   	ret    

000000000080a942 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a942:	f3 0f 1e fa          	endbr64 
  80a946:	55                   	push   rbp
  80a947:	48 89 e5             	mov    rbp,rsp
  80a94a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  80a951:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  80a955:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  80a959:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  80a960:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a967:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a96b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a96f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a973:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a977:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a97b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a97f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a983:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a987:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a98b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a98f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  80a993:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a997:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a99a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80a99e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80a9a5:	00 
	unsigned long sector = 0;
  80a9a6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a9ad:	00 
	int i,length = 0;
  80a9ae:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  80a9b5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a9bc:	00 
	long flags = 0;
  80a9bd:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a9c4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a9c5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a9cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9cf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a9d3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a9d7:	48 99                	cqo    
  80a9d9:	48 f7 fe             	idiv   rsi
  80a9dc:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a9df:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a9e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9e9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a9ed:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a9f1:	48 99                	cqo    
  80a9f3:	48 f7 f9             	idiv   rcx
  80a9f6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a9fa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a9fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aa02:	be 00 00 00 00       	mov    esi,0x0
  80aa07:	48 89 c7             	mov    rdi,rax
  80aa0a:	b8 00 00 00 00       	mov    eax,0x0
  80aa0f:	e8 fe 66 ff ff       	call   801112 <vmalloc>
  80aa14:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  80aa18:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80aa1d:	75 1a                	jne    80aa39 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80aa1f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aa23:	48 89 c7             	mov    rdi,rax
  80aa26:	e8 45 fe ff ff       	call   80a870 <FAT32_find_available_cluster>
  80aa2b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80aa2f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80aa36:	00 
  80aa37:	eb 2f                	jmp    80aa68 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  80aa39:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80aa40:	eb 1e                	jmp    80aa60 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80aa42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa46:	89 c2                	mov    edx,eax
  80aa48:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aa4c:	89 d6                	mov    esi,edx
  80aa4e:	48 89 c7             	mov    rdi,rax
  80aa51:	e8 2f f9 ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80aa56:	89 c0                	mov    eax,eax
  80aa58:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80aa5c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80aa60:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80aa63:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  80aa66:	7c da                	jl     80aa42 <FAT32_write+0x100>

	if(!cluster)
  80aa68:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80aa6d:	75 18                	jne    80aa87 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80aa6f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aa73:	48 89 c7             	mov    rdi,rax
  80aa76:	e8 37 67 ff ff       	call   8011b2 <vmfree>
		return -ENOSPC;
  80aa7b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80aa82:	e9 13 03 00 00       	jmp    80ad9a <FAT32_write+0x458>
	}

	if(flags)
  80aa87:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80aa8c:	74 4d                	je     80aadb <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80aa8e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aa92:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80aa96:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80aa99:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aa9d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aaa1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aaa5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aaa9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80aaad:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80aab1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aab5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aab9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aabd:	48 89 c7             	mov    rdi,rax
  80aac0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  80aac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aac6:	89 c1                	mov    ecx,eax
  80aac8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aacc:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80aad1:	89 ce                	mov    esi,ecx
  80aad3:	48 89 c7             	mov    rdi,rax
  80aad6:	e8 66 f9 ff ff       	call   80a441 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80aadb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80aae2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  80aae5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80aaea:	0f 85 91 00 00 00    	jne    80ab81 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  80aaf0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aaf4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aaf8:	89 c2                	mov    edx,eax
  80aafa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aafe:	be 00 00 00 00       	mov    esi,0x0
  80ab03:	48 89 c7             	mov    rdi,rax
  80ab06:	e8 de 23 00 00       	call   80cee9 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80ab0b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab0f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80ab13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab17:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80ab1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab1f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab23:	48 0f af c2          	imul   rax,rdx
  80ab27:	48 01 c8             	add    rax,rcx
  80ab2a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80ab2e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab32:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab36:	89 c1                	mov    ecx,eax
  80ab38:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab3c:	89 c2                	mov    edx,eax
  80ab3e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab42:	49 89 c0             	mov    r8,rax
  80ab45:	be 00 00 00 00       	mov    esi,0x0
  80ab4a:	bf 00 00 00 00       	mov    edi,0x0
  80ab4f:	e8 89 eb ff ff       	call   8096dd <request>
  80ab54:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  80ab57:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80ab5a:	89 c7                	mov    edi,eax
  80ab5c:	e8 30 f2 ff ff       	call   809d91 <chk_result>
  80ab61:	85 c0                	test   eax,eax
  80ab63:	75 1c                	jne    80ab81 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  80ab65:	bf 58 5a 81 00       	mov    edi,0x815a58
  80ab6a:	b8 00 00 00 00       	mov    eax,0x0
  80ab6f:	e8 03 62 ff ff       	call   800d77 <printf>
				retval = -EIO;
  80ab74:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80ab7b:	ff 
				break;
  80ab7c:	e9 95 01 00 00       	jmp    80ad16 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80ab81:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ab84:	48 63 d0             	movsxd rdx,eax
  80ab87:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab8b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ab8f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  80ab93:	48 39 c2             	cmp    rdx,rax
  80ab96:	48 0f 4e c2          	cmovle rax,rdx
  80ab9a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80ab9d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80aba1:	48 83 f8 1f          	cmp    rax,0x1f
  80aba5:	77 1f                	ja     80abc6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  80aba7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80abaa:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80abae:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abb2:	48 01 c1             	add    rcx,rax
  80abb5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80abb9:	48 89 ce             	mov    rsi,rcx
  80abbc:	48 89 c7             	mov    rdi,rax
  80abbf:	e8 76 22 00 00       	call   80ce3a <memcpy>
  80abc4:	eb 1d                	jmp    80abe3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  80abc6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80abc9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80abcd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abd1:	48 01 c1             	add    rcx,rax
  80abd4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80abd8:	48 89 ce             	mov    rsi,rcx
  80abdb:	48 89 c7             	mov    rdi,rax
  80abde:	e8 57 22 00 00       	call   80ce3a <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80abe3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abe7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abeb:	89 c1                	mov    ecx,eax
  80abed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80abf1:	89 c2                	mov    edx,eax
  80abf3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abf7:	49 89 c0             	mov    r8,rax
  80abfa:	be 01 00 00 00       	mov    esi,0x1
  80abff:	bf 00 00 00 00       	mov    edi,0x0
  80ac04:	e8 d4 ea ff ff       	call   8096dd <request>
  80ac09:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80ac0c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80ac0f:	89 c7                	mov    edi,eax
  80ac11:	e8 7b f1 ff ff       	call   809d91 <chk_result>
  80ac16:	85 c0                	test   eax,eax
  80ac18:	75 1c                	jne    80ac36 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80ac1a:	bf 88 5a 81 00       	mov    edi,0x815a88
  80ac1f:	b8 00 00 00 00       	mov    eax,0x0
  80ac24:	e8 4e 61 ff ff       	call   800d77 <printf>
			retval = -EIO;
  80ac29:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80ac30:	ff 
			break;
  80ac31:	e9 e0 00 00 00       	jmp    80ad16 <FAT32_write+0x3d4>
		}

		index -= length;
  80ac36:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ac39:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80ac3c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ac3f:	48 98                	cdqe   
  80ac41:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  80ac45:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80ac4c:	00 
		*position += length;
  80ac4d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ac54:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ac57:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ac5a:	48 98                	cdqe   
  80ac5c:	48 01 c2             	add    rdx,rax
  80ac5f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ac66:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  80ac69:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ac6d:	0f 84 a2 00 00 00    	je     80ad15 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80ac73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac77:	89 c2                	mov    edx,eax
  80ac79:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac7d:	89 d6                	mov    esi,edx
  80ac7f:	48 89 c7             	mov    rdi,rax
  80ac82:	e8 fe f6 ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80ac87:	89 c0                	mov    eax,eax
  80ac89:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80ac8d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  80ac94:	0f 
  80ac95:	76 72                	jbe    80ad09 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  80ac97:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac9b:	48 89 c7             	mov    rdi,rax
  80ac9e:	e8 cd fb ff ff       	call   80a870 <FAT32_find_available_cluster>
  80aca3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  80aca7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80acac:	75 18                	jne    80acc6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80acae:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80acb2:	48 89 c7             	mov    rdi,rax
  80acb5:	e8 f8 64 ff ff       	call   8011b2 <vmfree>
				return -ENOSPC;
  80acba:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80acc1:	e9 d4 00 00 00       	jmp    80ad9a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  80acc6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80acca:	89 c2                	mov    edx,eax
  80accc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80acd0:	89 c1                	mov    ecx,eax
  80acd2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80acd6:	89 ce                	mov    esi,ecx
  80acd8:	48 89 c7             	mov    rdi,rax
  80acdb:	e8 61 f7 ff ff       	call   80a441 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  80ace0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ace4:	89 c1                	mov    ecx,eax
  80ace6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80acea:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80acef:	89 ce                	mov    esi,ecx
  80acf1:	48 89 c7             	mov    rdi,rax
  80acf4:	e8 48 f7 ff ff       	call   80a441 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  80acf9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80acfd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  80ad01:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80ad08:	00 
		}

	}while(index);
  80ad09:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ad0d:	0f 85 d2 fd ff ff    	jne    80aae5 <FAT32_write+0x1a3>
  80ad13:	eb 01                	jmp    80ad16 <FAT32_write+0x3d4>
			break;
  80ad15:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  80ad16:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad1d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad20:	48 89 c2             	mov    rdx,rax
  80ad23:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ad27:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad2b:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ad2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad32:	48 39 c2             	cmp    rdx,rax
  80ad35:	76 42                	jbe    80ad79 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  80ad37:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad3e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ad41:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ad45:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad49:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ad4d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80ad50:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ad54:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad58:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ad5c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ad60:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80ad64:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80ad68:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ad6c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad70:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ad74:	48 89 c7             	mov    rdi,rax
  80ad77:	ff d2                	call   rdx
	}

	vmfree(buffer);
  80ad79:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad7d:	48 89 c7             	mov    rdi,rax
  80ad80:	e8 2d 64 ff ff       	call   8011b2 <vmfree>
	if(!index)
  80ad85:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ad89:	75 0b                	jne    80ad96 <FAT32_write+0x454>
		retval = count;
  80ad8b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80ad92:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  80ad96:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80ad9a:	c9                   	leave  
  80ad9b:	c3                   	ret    

000000000080ad9c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80ad9c:	f3 0f 1e fa          	endbr64 
  80ada0:	55                   	push   rbp
  80ada1:	48 89 e5             	mov    rbp,rsp
  80ada4:	48 83 ec 30          	sub    rsp,0x30
  80ada8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80adac:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80adb0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  80adb4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adb8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80adbc:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80adc0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  80adc4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80adcb:	00 

	switch(origin)
  80adcc:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80add1:	74 21                	je     80adf4 <FAT32_lseek+0x58>
  80add3:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80add8:	7f 4a                	jg     80ae24 <FAT32_lseek+0x88>
  80adda:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80addf:	74 09                	je     80adea <FAT32_lseek+0x4e>
  80ade1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  80ade6:	74 20                	je     80ae08 <FAT32_lseek+0x6c>
  80ade8:	eb 3a                	jmp    80ae24 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80adea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80adf2:	eb 39                	jmp    80ae2d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  80adf4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adf8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80adfb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adff:	48 01 d0             	add    rax,rdx
  80ae02:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80ae06:	eb 25                	jmp    80ae2d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  80ae08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae0c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae10:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae14:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae17:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae1b:	48 01 d0             	add    rax,rdx
  80ae1e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80ae22:	eb 09                	jmp    80ae2d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  80ae24:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80ae2b:	eb 50                	jmp    80ae7d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80ae2d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80ae32:	78 18                	js     80ae4c <FAT32_lseek+0xb0>
  80ae34:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae38:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae3c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae40:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae47:	48 39 c2             	cmp    rdx,rax
  80ae4a:	73 09                	jae    80ae55 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80ae4c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  80ae53:	eb 28                	jmp    80ae7d <FAT32_lseek+0xe1>

	filp->position = pos;
  80ae55:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae59:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80ae5d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  80ae60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae67:	48 89 c6             	mov    rsi,rax
  80ae6a:	bf b8 5a 81 00       	mov    edi,0x815ab8
  80ae6f:	b8 00 00 00 00       	mov    eax,0x0
  80ae74:	e8 fe 5e ff ff       	call   800d77 <printf>

	return pos;
  80ae79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80ae7d:	c9                   	leave  
  80ae7e:	c3                   	ret    

000000000080ae7f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80ae7f:	f3 0f 1e fa          	endbr64 
  80ae83:	55                   	push   rbp
  80ae84:	48 89 e5             	mov    rbp,rsp
  80ae87:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ae8b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ae8f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80ae93:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80ae97:	90                   	nop
  80ae98:	5d                   	pop    rbp
  80ae99:	c3                   	ret    

000000000080ae9a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80ae9a:	f3 0f 1e fa          	endbr64 
  80ae9e:	55                   	push   rbp
  80ae9f:	48 89 e5             	mov    rbp,rsp
  80aea2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80aea6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80aeaa:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80aeae:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80aeb2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80aeb6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aeba:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aebe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aec2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80aec6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80aeca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aece:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aed2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aed6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aeda:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80aede:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80aee5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80aeec:	00 
	unsigned char * buf =NULL; 
  80aeed:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  80aef4:	00 
	char *name = NULL;
  80aef5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aefc:	00 
	int namelen = 0;
  80aefd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  80af04:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80af0b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  80af12:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80af19:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80af20:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80af27:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80af28:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80af2f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80af30:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80af34:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80af38:	be 00 00 00 00       	mov    esi,0x0
  80af3d:	48 89 c7             	mov    rdi,rax
  80af40:	b8 00 00 00 00       	mov    eax,0x0
  80af45:	e8 c8 61 ff ff       	call   801112 <vmalloc>
  80af4a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80af4e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80af52:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af55:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  80af58:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80af5c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af5f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80af63:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80af67:	48 99                	cqo    
  80af69:	48 f7 fe             	idiv   rsi
  80af6c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80af6f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80af76:	eb 3a                	jmp    80afb2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80af78:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80af7b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80af7f:	89 d6                	mov    esi,edx
  80af81:	48 89 c7             	mov    rdi,rax
  80af84:	e8 fc f3 ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80af89:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80af8c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  80af93:	76 19                	jbe    80afae <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  80af95:	bf e0 5a 81 00       	mov    edi,0x815ae0
  80af9a:	b8 00 00 00 00       	mov    eax,0x0
  80af9f:	e8 d3 5d ff ff       	call   800d77 <printf>
			return NULL;
  80afa4:	b8 00 00 00 00       	mov    eax,0x0
  80afa9:	e9 86 05 00 00       	jmp    80b534 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80afae:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80afb2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80afb5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80afb8:	7c be                	jl     80af78 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80afba:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80afbb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afbf:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80afc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80afc6:	83 e8 02             	sub    eax,0x2
  80afc9:	89 c1                	mov    ecx,eax
  80afcb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afcf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afd3:	48 0f af c1          	imul   rax,rcx
  80afd7:	48 01 d0             	add    rax,rdx
  80afda:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80afde:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afe2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afe6:	89 c1                	mov    ecx,eax
  80afe8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80afec:	89 c2                	mov    edx,eax
  80afee:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80aff2:	49 89 c0             	mov    r8,rax
  80aff5:	be 00 00 00 00       	mov    esi,0x0
  80affa:	bf 00 00 00 00       	mov    edi,0x0
  80afff:	e8 d9 e6 ff ff       	call   8096dd <request>
  80b004:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  80b007:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80b00a:	89 c7                	mov    edi,eax
  80b00c:	e8 80 ed ff ff       	call   809d91 <chk_result>
  80b011:	85 c0                	test   eax,eax
  80b013:	75 25                	jne    80b03a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  80b015:	bf 08 5b 81 00       	mov    edi,0x815b08
  80b01a:	b8 00 00 00 00       	mov    eax,0x0
  80b01f:	e8 53 5d ff ff       	call   800d77 <printf>
		vmfree(buf);
  80b024:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b028:	48 89 c7             	mov    rdi,rax
  80b02b:	e8 82 61 ff ff       	call   8011b2 <vmfree>
		return NULL;
  80b030:	b8 00 00 00 00       	mov    eax,0x0
  80b035:	e9 fa 04 00 00       	jmp    80b534 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80b03a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b03e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b041:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b045:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b049:	48 99                	cqo    
  80b04b:	48 f7 f9             	idiv   rcx
  80b04e:	48 89 d0             	mov    rax,rdx
  80b051:	48 89 c2             	mov    rdx,rax
  80b054:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b058:	48 01 d0             	add    rax,rdx
  80b05b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b05f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b063:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b066:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b06a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b06e:	48 99                	cqo    
  80b070:	48 f7 f9             	idiv   rcx
  80b073:	48 89 d0             	mov    rax,rdx
  80b076:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  80b079:	e9 2f 04 00 00       	jmp    80b4ad <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b07e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b082:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b086:	3c 0f                	cmp    al,0xf
  80b088:	0f 84 00 04 00 00    	je     80b48e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b08e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b092:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b095:	3c e5                	cmp    al,0xe5
  80b097:	0f 84 f4 03 00 00    	je     80b491 <FAT32_readdir+0x5f7>
  80b09d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b0a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b0a4:	84 c0                	test   al,al
  80b0a6:	0f 84 e5 03 00 00    	je     80b491 <FAT32_readdir+0x5f7>
  80b0ac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b0b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b0b3:	3c 05                	cmp    al,0x5
  80b0b5:	0f 84 d6 03 00 00    	je     80b491 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80b0bb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b0c2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b0c6:	48 83 e8 20          	sub    rax,0x20
  80b0ca:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b0ce:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b0d2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b0d6:	3c 0f                	cmp    al,0xf
  80b0d8:	0f 85 2a 02 00 00    	jne    80b308 <FAT32_readdir+0x46e>
  80b0de:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b0e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b0e5:	3c e5                	cmp    al,0xe5
  80b0e7:	0f 84 1b 02 00 00    	je     80b308 <FAT32_readdir+0x46e>
  80b0ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b0f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b0f4:	84 c0                	test   al,al
  80b0f6:	0f 84 0c 02 00 00    	je     80b308 <FAT32_readdir+0x46e>
  80b0fc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b100:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b103:	3c 05                	cmp    al,0x5
  80b105:	0f 84 fd 01 00 00    	je     80b308 <FAT32_readdir+0x46e>
		{
			j = 0;
  80b10b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b112:	eb 1a                	jmp    80b12e <FAT32_readdir+0x294>
			{
				j++;
  80b114:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  80b118:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b11c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b11f:	0f b6 c0             	movzx  eax,al
  80b122:	83 e0 40             	and    eax,0x40
  80b125:	85 c0                	test   eax,eax
  80b127:	75 34                	jne    80b15d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  80b129:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b12e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b132:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b136:	3c 0f                	cmp    al,0xf
  80b138:	75 24                	jne    80b15e <FAT32_readdir+0x2c4>
  80b13a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b13e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b141:	3c e5                	cmp    al,0xe5
  80b143:	74 19                	je     80b15e <FAT32_readdir+0x2c4>
  80b145:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b149:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b14c:	84 c0                	test   al,al
  80b14e:	74 0e                	je     80b15e <FAT32_readdir+0x2c4>
  80b150:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b154:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b157:	3c 05                	cmp    al,0x5
  80b159:	75 b9                	jne    80b114 <FAT32_readdir+0x27a>
  80b15b:	eb 01                	jmp    80b15e <FAT32_readdir+0x2c4>
					break;
  80b15d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80b15e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b161:	89 d0                	mov    eax,edx
  80b163:	01 c0                	add    eax,eax
  80b165:	01 d0                	add    eax,edx
  80b167:	c1 e0 02             	shl    eax,0x2
  80b16a:	01 d0                	add    eax,edx
  80b16c:	83 c0 01             	add    eax,0x1
  80b16f:	be 00 00 00 00       	mov    esi,0x0
  80b174:	89 c7                	mov    edi,eax
  80b176:	b8 00 00 00 00       	mov    eax,0x0
  80b17b:	e8 92 5f ff ff       	call   801112 <vmalloc>
  80b180:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  80b184:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b187:	89 d0                	mov    eax,edx
  80b189:	01 c0                	add    eax,eax
  80b18b:	01 d0                	add    eax,edx
  80b18d:	c1 e0 02             	shl    eax,0x2
  80b190:	01 d0                	add    eax,edx
  80b192:	83 c0 01             	add    eax,0x1
  80b195:	89 c2                	mov    edx,eax
  80b197:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b19b:	be 00 00 00 00       	mov    esi,0x0
  80b1a0:	48 89 c7             	mov    rdi,rax
  80b1a3:	e8 41 1d 00 00       	call   80cee9 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b1a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1ac:	48 83 e8 20          	sub    rax,0x20
  80b1b0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  80b1b4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b1bb:	e9 37 01 00 00       	jmp    80b2f7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  80b1c0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b1c7:	eb 53                	jmp    80b21c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b1c9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1cd:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b1d0:	48 63 d2             	movsxd rdx,edx
  80b1d3:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b1d8:	66 83 f8 ff          	cmp    ax,0xffff
  80b1dc:	74 3a                	je     80b218 <FAT32_readdir+0x37e>
  80b1de:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1e2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b1e5:	48 63 d2             	movsxd rdx,edx
  80b1e8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b1ed:	66 85 c0             	test   ax,ax
  80b1f0:	74 26                	je     80b218 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  80b1f2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1f6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b1f9:	48 63 d2             	movsxd rdx,edx
  80b1fc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b201:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b204:	8d 50 01             	lea    edx,[rax+0x1]
  80b207:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b20a:	48 63 d0             	movsxd rdx,eax
  80b20d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b211:	48 01 d0             	add    rax,rdx
  80b214:	89 ca                	mov    edx,ecx
  80b216:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  80b218:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b21c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  80b220:	7e a7                	jle    80b1c9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  80b222:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b229:	eb 53                	jmp    80b27e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b22b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b22f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b232:	48 63 d2             	movsxd rdx,edx
  80b235:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b23a:	66 83 f8 ff          	cmp    ax,0xffff
  80b23e:	74 3a                	je     80b27a <FAT32_readdir+0x3e0>
  80b240:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b244:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b247:	48 63 d2             	movsxd rdx,edx
  80b24a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b24f:	66 85 c0             	test   ax,ax
  80b252:	74 26                	je     80b27a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  80b254:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b258:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b25b:	48 63 d2             	movsxd rdx,edx
  80b25e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b263:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b266:	8d 50 01             	lea    edx,[rax+0x1]
  80b269:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b26c:	48 63 d0             	movsxd rdx,eax
  80b26f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b273:	48 01 d0             	add    rax,rdx
  80b276:	89 ca                	mov    edx,ecx
  80b278:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80b27a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b27e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  80b282:	7e a7                	jle    80b22b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  80b284:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b28b:	eb 5b                	jmp    80b2e8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b28d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b291:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b294:	48 63 d2             	movsxd rdx,edx
  80b297:	48 83 c2 08          	add    rdx,0x8
  80b29b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b2a0:	66 83 f8 ff          	cmp    ax,0xffff
  80b2a4:	74 3e                	je     80b2e4 <FAT32_readdir+0x44a>
  80b2a6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2aa:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b2ad:	48 63 d2             	movsxd rdx,edx
  80b2b0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b2b5:	66 85 c0             	test   ax,ax
  80b2b8:	74 2a                	je     80b2e4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80b2ba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2be:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b2c1:	48 63 d2             	movsxd rdx,edx
  80b2c4:	48 83 c2 08          	add    rdx,0x8
  80b2c8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b2cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2d0:	8d 50 01             	lea    edx,[rax+0x1]
  80b2d3:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b2d6:	48 63 d0             	movsxd rdx,eax
  80b2d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b2dd:	48 01 d0             	add    rax,rdx
  80b2e0:	89 ca                	mov    edx,ecx
  80b2e2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  80b2e4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b2e8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80b2ec:	7e 9f                	jle    80b28d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80b2ee:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b2f2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  80b2f7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b2fa:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80b2fd:	0f 8c bd fe ff ff    	jl     80b1c0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  80b303:	e9 f5 01 00 00       	jmp    80b4fd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  80b308:	be 00 00 00 00       	mov    esi,0x0
  80b30d:	bf 0f 00 00 00       	mov    edi,0xf
  80b312:	b8 00 00 00 00       	mov    eax,0x0
  80b317:	e8 f6 5d ff ff       	call   801112 <vmalloc>
  80b31c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  80b320:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b324:	ba 0f 00 00 00       	mov    edx,0xf
  80b329:	be 00 00 00 00       	mov    esi,0x0
  80b32e:	48 89 c7             	mov    rdi,rax
  80b331:	e8 b3 1b 00 00       	call   80cee9 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  80b336:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b33d:	eb 74                	jmp    80b3b3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b33f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b343:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b346:	48 98                	cdqe   
  80b348:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b34c:	3c 20                	cmp    al,0x20
  80b34e:	74 6b                	je     80b3bb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80b350:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b354:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b358:	0f b6 c0             	movzx  eax,al
  80b35b:	83 e0 08             	and    eax,0x8
  80b35e:	85 c0                	test   eax,eax
  80b360:	74 29                	je     80b38b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b362:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b366:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b369:	48 98                	cdqe   
  80b36b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b36f:	8d 48 20             	lea    ecx,[rax+0x20]
  80b372:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b375:	8d 50 01             	lea    edx,[rax+0x1]
  80b378:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b37b:	48 63 d0             	movsxd rdx,eax
  80b37e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b382:	48 01 d0             	add    rax,rdx
  80b385:	89 ca                	mov    edx,ecx
  80b387:	88 10                	mov    BYTE PTR [rax],dl
  80b389:	eb 24                	jmp    80b3af <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b38b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b38f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b392:	48 98                	cdqe   
  80b394:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b398:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b39b:	8d 50 01             	lea    edx,[rax+0x1]
  80b39e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b3a1:	48 63 d0             	movsxd rdx,eax
  80b3a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b3a8:	48 01 d0             	add    rax,rdx
  80b3ab:	89 ca                	mov    edx,ecx
  80b3ad:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80b3af:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b3b3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  80b3b7:	7e 86                	jle    80b33f <FAT32_readdir+0x4a5>
  80b3b9:	eb 01                	jmp    80b3bc <FAT32_readdir+0x522>
				break;
  80b3bb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80b3bc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b3c0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b3c4:	0f b6 c0             	movzx  eax,al
  80b3c7:	83 e0 10             	and    eax,0x10
  80b3ca:	85 c0                	test   eax,eax
  80b3cc:	0f 85 27 01 00 00    	jne    80b4f9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  80b3d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b3d5:	8d 50 01             	lea    edx,[rax+0x1]
  80b3d8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b3db:	48 63 d0             	movsxd rdx,eax
  80b3de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b3e2:	48 01 d0             	add    rax,rdx
  80b3e5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  80b3e8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80b3ef:	eb 74                	jmp    80b465 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b3f1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b3f5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b3f8:	48 98                	cdqe   
  80b3fa:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b3fe:	3c 20                	cmp    al,0x20
  80b400:	74 6b                	je     80b46d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80b402:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b406:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b40a:	0f b6 c0             	movzx  eax,al
  80b40d:	83 e0 10             	and    eax,0x10
  80b410:	85 c0                	test   eax,eax
  80b412:	74 29                	je     80b43d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b414:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b418:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b41b:	48 98                	cdqe   
  80b41d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b421:	8d 48 20             	lea    ecx,[rax+0x20]
  80b424:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b427:	8d 50 01             	lea    edx,[rax+0x1]
  80b42a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b42d:	48 63 d0             	movsxd rdx,eax
  80b430:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b434:	48 01 d0             	add    rax,rdx
  80b437:	89 ca                	mov    edx,ecx
  80b439:	88 10                	mov    BYTE PTR [rax],dl
  80b43b:	eb 24                	jmp    80b461 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b43d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b441:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b444:	48 98                	cdqe   
  80b446:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b44a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b44d:	8d 50 01             	lea    edx,[rax+0x1]
  80b450:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b453:	48 63 d0             	movsxd rdx,eax
  80b456:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b45a:	48 01 d0             	add    rax,rdx
  80b45d:	89 ca                	mov    edx,ecx
  80b45f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80b461:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b465:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80b469:	7e 86                	jle    80b3f1 <FAT32_readdir+0x557>
  80b46b:	eb 01                	jmp    80b46e <FAT32_readdir+0x5d4>
				break;
  80b46d:	90                   	nop
		}
		if(x == 8)
  80b46e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80b472:	0f 85 84 00 00 00    	jne    80b4fc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80b478:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80b47c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b47f:	48 63 d0             	movsxd rdx,eax
  80b482:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b486:	48 01 d0             	add    rax,rdx
  80b489:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80b48c:	eb 6e                	jmp    80b4fc <FAT32_readdir+0x662>
			continue;
  80b48e:	90                   	nop
  80b48f:	eb 01                	jmp    80b492 <FAT32_readdir+0x5f8>
			continue;
  80b491:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b492:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80b496:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80b49b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b49f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b4a2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b4a6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b4aa:	48 89 10             	mov    QWORD PTR [rax],rdx
  80b4ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b4b0:	48 63 d0             	movsxd rdx,eax
  80b4b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b4b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b4bb:	48 39 c2             	cmp    rdx,rax
  80b4be:	0f 8c ba fb ff ff    	jl     80b07e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b4c4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b4c7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b4cb:	89 d6                	mov    esi,edx
  80b4cd:	48 89 c7             	mov    rdi,rax
  80b4d0:	e8 b0 ee ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80b4d5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80b4d8:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80b4df:	77 05                	ja     80b4e6 <FAT32_readdir+0x64c>
		goto next_cluster;
  80b4e1:	e9 d5 fa ff ff       	jmp    80afbb <FAT32_readdir+0x121>

	vmfree(buf);
  80b4e6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b4ea:	48 89 c7             	mov    rdi,rax
  80b4ed:	e8 c0 5c ff ff       	call   8011b2 <vmfree>
	return NULL;
  80b4f2:	b8 00 00 00 00       	mov    eax,0x0
  80b4f7:	eb 3b                	jmp    80b534 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80b4f9:	90                   	nop
  80b4fa:	eb 01                	jmp    80b4fd <FAT32_readdir+0x663>
		goto find_lookup_success;
  80b4fc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80b4fd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b501:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b504:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b508:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b50c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80b50f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b512:	48 63 d0             	movsxd rdx,eax
  80b515:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80b519:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80b51d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80b521:	41 b8 00 00 00 00    	mov    r8d,0x0
  80b527:	b9 00 00 00 00       	mov    ecx,0x0
  80b52c:	48 89 c7             	mov    rdi,rax
  80b52f:	41 ff d1             	call   r9
  80b532:	48 98                	cdqe   
}
  80b534:	c9                   	leave  
  80b535:	c3                   	ret    

000000000080b536 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80b536:	f3 0f 1e fa          	endbr64 
  80b53a:	55                   	push   rbp
  80b53b:	48 89 e5             	mov    rbp,rsp
  80b53e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b542:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b546:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b549:	90                   	nop
  80b54a:	5d                   	pop    rbp
  80b54b:	c3                   	ret    

000000000080b54c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80b54c:	f3 0f 1e fa          	endbr64 
  80b550:	55                   	push   rbp
  80b551:	48 89 e5             	mov    rbp,rsp
  80b554:	48 83 ec 60          	sub    rsp,0x60
  80b558:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80b55c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80b560:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b564:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b568:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80b56c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b570:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b574:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b578:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80b57c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80b583:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80b58a:	00 
	unsigned char * buf =NULL; 
  80b58b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80b592:	00 
	int i = 0,j = 0,x = 0;
  80b593:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b59a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b5a1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80b5a8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80b5af:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80b5b0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80b5b7:	00 
	struct index_node * p = NULL;
  80b5b8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80b5bf:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b5c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b5c8:	be 00 00 00 00       	mov    esi,0x0
  80b5cd:	48 89 c7             	mov    rdi,rax
  80b5d0:	b8 00 00 00 00       	mov    eax,0x0
  80b5d5:	e8 38 5b ff ff       	call   801112 <vmalloc>
  80b5da:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80b5de:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b5e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5e5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b5e8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5ec:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b5f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5f3:	83 e8 02             	sub    eax,0x2
  80b5f6:	89 c1                	mov    ecx,eax
  80b5f8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5fc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b600:	48 0f af c1          	imul   rax,rcx
  80b604:	48 01 d0             	add    rax,rdx
  80b607:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:0x%x,sector:0x%x\r\n",cluster,sector);
  80b60b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b60f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b612:	89 c6                	mov    esi,eax
  80b614:	bf 38 5b 81 00       	mov    edi,0x815b38
  80b619:	b8 00 00 00 00       	mov    eax,0x0
  80b61e:	e8 54 57 ff ff       	call   800d77 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b623:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b627:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b62b:	89 c1                	mov    ecx,eax
  80b62d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b631:	89 c2                	mov    edx,eax
  80b633:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b637:	49 89 c0             	mov    r8,rax
  80b63a:	be 00 00 00 00       	mov    esi,0x0
  80b63f:	bf 00 00 00 00       	mov    edi,0x0
  80b644:	e8 94 e0 ff ff       	call   8096dd <request>
  80b649:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80b64c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80b64f:	89 c7                	mov    edi,eax
  80b651:	e8 3b e7 ff ff       	call   809d91 <chk_result>
  80b656:	85 c0                	test   eax,eax
  80b658:	75 25                	jne    80b67f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80b65a:	bf 60 5b 81 00       	mov    edi,0x815b60
  80b65f:	b8 00 00 00 00       	mov    eax,0x0
  80b664:	e8 0e 57 ff ff       	call   800d77 <printf>
		vmfree(buf);
  80b669:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b66d:	48 89 c7             	mov    rdi,rax
  80b670:	e8 3d 5b ff ff       	call   8011b2 <vmfree>
		return NULL;
  80b675:	b8 00 00 00 00       	mov    eax,0x0
  80b67a:	e9 f0 07 00 00       	jmp    80be6f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80b67f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b683:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80b687:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b68e:	e9 9d 05 00 00       	jmp    80bc30 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b693:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b697:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b69b:	3c 0f                	cmp    al,0xf
  80b69d:	0f 84 59 05 00 00    	je     80bbfc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b6a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6aa:	3c e5                	cmp    al,0xe5
  80b6ac:	0f 84 4d 05 00 00    	je     80bbff <FAT32_lookup+0x6b3>
  80b6b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6b9:	84 c0                	test   al,al
  80b6bb:	0f 84 3e 05 00 00    	je     80bbff <FAT32_lookup+0x6b3>
  80b6c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6c8:	3c 05                	cmp    al,0x5
  80b6ca:	0f 84 2f 05 00 00    	je     80bbff <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b6d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6d4:	48 83 e8 20          	sub    rax,0x20
  80b6d8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80b6dc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b6e3:	e9 88 01 00 00       	jmp    80b870 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80b6e8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b6ef:	eb 6a                	jmp    80b75b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80b6f1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b6f5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6f8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b6fb:	7e 15                	jle    80b712 <FAT32_lookup+0x1c6>
  80b6fd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b701:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b704:	48 63 d2             	movsxd rdx,edx
  80b707:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b70c:	66 83 f8 ff          	cmp    ax,0xffff
  80b710:	74 44                	je     80b756 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80b712:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b716:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b719:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b71c:	0f 8f e0 04 00 00    	jg     80bc02 <FAT32_lookup+0x6b6>
  80b722:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b726:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b729:	48 63 d2             	movsxd rdx,edx
  80b72c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b731:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b735:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b738:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b73b:	8d 50 01             	lea    edx,[rax+0x1]
  80b73e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b741:	48 98                	cdqe   
  80b743:	48 01 f0             	add    rax,rsi
  80b746:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b749:	66 98                	cbw    
  80b74b:	66 39 c1             	cmp    cx,ax
  80b74e:	0f 85 ae 04 00 00    	jne    80bc02 <FAT32_lookup+0x6b6>
  80b754:	eb 01                	jmp    80b757 <FAT32_lookup+0x20b>
					continue;
  80b756:	90                   	nop
			for(x=0;x<5;x++)
  80b757:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b75b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80b75f:	7e 90                	jle    80b6f1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80b761:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b768:	eb 6a                	jmp    80b7d4 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80b76a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b76e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b771:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b774:	7e 15                	jle    80b78b <FAT32_lookup+0x23f>
  80b776:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b77a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b77d:	48 63 d2             	movsxd rdx,edx
  80b780:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b785:	66 83 f8 ff          	cmp    ax,0xffff
  80b789:	74 44                	je     80b7cf <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80b78b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b78f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b792:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b795:	0f 8f 6a 04 00 00    	jg     80bc05 <FAT32_lookup+0x6b9>
  80b79b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b79f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b7a2:	48 63 d2             	movsxd rdx,edx
  80b7a5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b7aa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b7ae:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b7b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b7b4:	8d 50 01             	lea    edx,[rax+0x1]
  80b7b7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b7ba:	48 98                	cdqe   
  80b7bc:	48 01 f0             	add    rax,rsi
  80b7bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7c2:	66 98                	cbw    
  80b7c4:	66 39 c1             	cmp    cx,ax
  80b7c7:	0f 85 38 04 00 00    	jne    80bc05 <FAT32_lookup+0x6b9>
  80b7cd:	eb 01                	jmp    80b7d0 <FAT32_lookup+0x284>
					continue;
  80b7cf:	90                   	nop
			for(x=0;x<6;x++)
  80b7d0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b7d4:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80b7d8:	7e 90                	jle    80b76a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80b7da:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b7e1:	eb 72                	jmp    80b855 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80b7e3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b7e7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b7ea:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b7ed:	7e 19                	jle    80b808 <FAT32_lookup+0x2bc>
  80b7ef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b7f3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b7f6:	48 63 d2             	movsxd rdx,edx
  80b7f9:	48 83 c2 08          	add    rdx,0x8
  80b7fd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b802:	66 83 f8 ff          	cmp    ax,0xffff
  80b806:	74 48                	je     80b850 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80b808:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b80c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b80f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b812:	0f 8f f0 03 00 00    	jg     80bc08 <FAT32_lookup+0x6bc>
  80b818:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b81c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b81f:	48 63 d2             	movsxd rdx,edx
  80b822:	48 83 c2 08          	add    rdx,0x8
  80b826:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b82b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b82f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b832:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b835:	8d 50 01             	lea    edx,[rax+0x1]
  80b838:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b83b:	48 98                	cdqe   
  80b83d:	48 01 f0             	add    rax,rsi
  80b840:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b843:	66 98                	cbw    
  80b845:	66 39 c1             	cmp    cx,ax
  80b848:	0f 85 ba 03 00 00    	jne    80bc08 <FAT32_lookup+0x6bc>
  80b84e:	eb 01                	jmp    80b851 <FAT32_lookup+0x305>
					continue;
  80b850:	90                   	nop
			for(x=0;x<2;x++)
  80b851:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b855:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80b859:	7e 88                	jle    80b7e3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80b85b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b85f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b862:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b865:	0f 8d 14 04 00 00    	jge    80bc7f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80b86b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b870:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b874:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b878:	3c 0f                	cmp    al,0xf
  80b87a:	75 0f                	jne    80b88b <FAT32_lookup+0x33f>
  80b87c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b880:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b883:	3c e5                	cmp    al,0xe5
  80b885:	0f 85 5d fe ff ff    	jne    80b6e8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80b88b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80b892:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b899:	e9 f4 01 00 00       	jmp    80ba92 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80b89e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b8a2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b8a5:	48 98                	cdqe   
  80b8a7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b8ab:	0f b6 c0             	movzx  eax,al
  80b8ae:	83 f8 7a             	cmp    eax,0x7a
  80b8b1:	0f 8f d0 01 00 00    	jg     80ba87 <FAT32_lookup+0x53b>
  80b8b7:	83 f8 61             	cmp    eax,0x61
  80b8ba:	0f 8d e6 00 00 00    	jge    80b9a6 <FAT32_lookup+0x45a>
  80b8c0:	83 f8 5a             	cmp    eax,0x5a
  80b8c3:	0f 8f be 01 00 00    	jg     80ba87 <FAT32_lookup+0x53b>
  80b8c9:	83 f8 41             	cmp    eax,0x41
  80b8cc:	0f 8d d4 00 00 00    	jge    80b9a6 <FAT32_lookup+0x45a>
  80b8d2:	83 f8 20             	cmp    eax,0x20
  80b8d5:	74 1a                	je     80b8f1 <FAT32_lookup+0x3a5>
  80b8d7:	83 f8 20             	cmp    eax,0x20
  80b8da:	0f 8c a7 01 00 00    	jl     80ba87 <FAT32_lookup+0x53b>
  80b8e0:	83 e8 30             	sub    eax,0x30
  80b8e3:	83 f8 09             	cmp    eax,0x9
  80b8e6:	0f 87 9b 01 00 00    	ja     80ba87 <FAT32_lookup+0x53b>
  80b8ec:	e9 53 01 00 00       	jmp    80ba44 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80b8f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b8f5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b8f9:	0f b6 c0             	movzx  eax,al
  80b8fc:	83 e0 10             	and    eax,0x10
  80b8ff:	85 c0                	test   eax,eax
  80b901:	75 50                	jne    80b953 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80b903:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b907:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b90a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b90d:	48 98                	cdqe   
  80b90f:	48 01 d0             	add    rax,rdx
  80b912:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b915:	3c 2e                	cmp    al,0x2e
  80b917:	0f 84 70 01 00 00    	je     80ba8d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b91d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b921:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b924:	48 98                	cdqe   
  80b926:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b92a:	0f b6 d0             	movzx  edx,al
  80b92d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b931:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b934:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b937:	48 98                	cdqe   
  80b939:	48 01 c8             	add    rax,rcx
  80b93c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b93f:	0f be c0             	movsx  eax,al
  80b942:	39 c2                	cmp    edx,eax
  80b944:	0f 85 c1 02 00 00    	jne    80bc0b <FAT32_lookup+0x6bf>
						{
							j++;
  80b94a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b94e:	e9 3b 01 00 00       	jmp    80ba8e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b953:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b957:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b95a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b95d:	7d 32                	jge    80b991 <FAT32_lookup+0x445>
  80b95f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b963:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b966:	48 98                	cdqe   
  80b968:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b96c:	0f b6 d0             	movzx  edx,al
  80b96f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b973:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b976:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b979:	48 98                	cdqe   
  80b97b:	48 01 c8             	add    rax,rcx
  80b97e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b981:	0f be c0             	movsx  eax,al
  80b984:	39 c2                	cmp    edx,eax
  80b986:	75 09                	jne    80b991 <FAT32_lookup+0x445>
						{
							j++;
  80b988:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b98c:	e9 fd 00 00 00       	jmp    80ba8e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80b991:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b995:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b998:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b99b:	0f 85 6d 02 00 00    	jne    80bc0e <FAT32_lookup+0x6c2>
							continue;
  80b9a1:	e9 e8 00 00 00       	jmp    80ba8e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80b9a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b9aa:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b9ae:	0f b6 c0             	movzx  eax,al
  80b9b1:	83 e0 08             	and    eax,0x8
  80b9b4:	85 c0                	test   eax,eax
  80b9b6:	74 49                	je     80ba01 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80b9b8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b9bc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b9bf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b9c2:	0f 8d 49 02 00 00    	jge    80bc11 <FAT32_lookup+0x6c5>
  80b9c8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b9cc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b9cf:	48 98                	cdqe   
  80b9d1:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b9d5:	0f b6 c0             	movzx  eax,al
  80b9d8:	8d 50 20             	lea    edx,[rax+0x20]
  80b9db:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b9df:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b9e2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b9e5:	48 98                	cdqe   
  80b9e7:	48 01 c8             	add    rax,rcx
  80b9ea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9ed:	0f be c0             	movsx  eax,al
  80b9f0:	39 c2                	cmp    edx,eax
  80b9f2:	0f 85 19 02 00 00    	jne    80bc11 <FAT32_lookup+0x6c5>
						{
							j++;
  80b9f8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b9fc:	e9 8d 00 00 00       	jmp    80ba8e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ba01:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba05:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba08:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba0b:	0f 8d 03 02 00 00    	jge    80bc14 <FAT32_lookup+0x6c8>
  80ba11:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba15:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba18:	48 98                	cdqe   
  80ba1a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ba1e:	0f b6 d0             	movzx  edx,al
  80ba21:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba25:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ba28:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba2b:	48 98                	cdqe   
  80ba2d:	48 01 c8             	add    rax,rcx
  80ba30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba33:	0f be c0             	movsx  eax,al
  80ba36:	39 c2                	cmp    edx,eax
  80ba38:	0f 85 d6 01 00 00    	jne    80bc14 <FAT32_lookup+0x6c8>
						{
							j++;
  80ba3e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ba42:	eb 4a                	jmp    80ba8e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ba44:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba48:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba4b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba4e:	0f 8d c3 01 00 00    	jge    80bc17 <FAT32_lookup+0x6cb>
  80ba54:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba58:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba5b:	48 98                	cdqe   
  80ba5d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ba61:	0f b6 d0             	movzx  edx,al
  80ba64:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba68:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ba6b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba6e:	48 98                	cdqe   
  80ba70:	48 01 c8             	add    rax,rcx
  80ba73:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba76:	0f be c0             	movsx  eax,al
  80ba79:	39 c2                	cmp    edx,eax
  80ba7b:	0f 85 96 01 00 00    	jne    80bc17 <FAT32_lookup+0x6cb>
					{
						j++;
  80ba81:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80ba85:	eb 07                	jmp    80ba8e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80ba87:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80ba8b:	eb 01                	jmp    80ba8e <FAT32_lookup+0x542>
							continue;
  80ba8d:	90                   	nop
		for(x=0;x<8;x++)
  80ba8e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80ba92:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80ba96:	0f 8e 02 fe ff ff    	jle    80b89e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80ba9c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80baa0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80baa4:	0f b6 c0             	movzx  eax,al
  80baa7:	83 e0 10             	and    eax,0x10
  80baaa:	85 c0                	test   eax,eax
  80baac:	0f 85 d0 01 00 00    	jne    80bc82 <FAT32_lookup+0x736>
		{
			j++;
  80bab2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80bab6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80babd:	e9 2b 01 00 00       	jmp    80bbed <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80bac2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bac6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bac9:	48 98                	cdqe   
  80bacb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bacf:	0f b6 c0             	movzx  eax,al
  80bad2:	83 f8 7a             	cmp    eax,0x7a
  80bad5:	0f 8f 3f 01 00 00    	jg     80bc1a <FAT32_lookup+0x6ce>
  80badb:	83 f8 61             	cmp    eax,0x61
  80bade:	7d 2e                	jge    80bb0e <FAT32_lookup+0x5c2>
  80bae0:	83 f8 5a             	cmp    eax,0x5a
  80bae3:	0f 8f 31 01 00 00    	jg     80bc1a <FAT32_lookup+0x6ce>
  80bae9:	83 f8 41             	cmp    eax,0x41
  80baec:	7d 20                	jge    80bb0e <FAT32_lookup+0x5c2>
  80baee:	83 f8 20             	cmp    eax,0x20
  80baf1:	0f 84 c4 00 00 00    	je     80bbbb <FAT32_lookup+0x66f>
  80baf7:	83 f8 20             	cmp    eax,0x20
  80bafa:	0f 8c 1a 01 00 00    	jl     80bc1a <FAT32_lookup+0x6ce>
  80bb00:	83 e8 30             	sub    eax,0x30
  80bb03:	83 f8 09             	cmp    eax,0x9
  80bb06:	0f 87 0e 01 00 00    	ja     80bc1a <FAT32_lookup+0x6ce>
  80bb0c:	eb 7e                	jmp    80bb8c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80bb0e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb12:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80bb16:	0f b6 c0             	movzx  eax,al
  80bb19:	83 e0 10             	and    eax,0x10
  80bb1c:	85 c0                	test   eax,eax
  80bb1e:	74 39                	je     80bb59 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80bb20:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb24:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb27:	48 98                	cdqe   
  80bb29:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb2d:	0f b6 c0             	movzx  eax,al
  80bb30:	8d 50 20             	lea    edx,[rax+0x20]
  80bb33:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb37:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb3a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb3d:	48 98                	cdqe   
  80bb3f:	48 01 c8             	add    rax,rcx
  80bb42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb45:	0f be c0             	movsx  eax,al
  80bb48:	39 c2                	cmp    edx,eax
  80bb4a:	0f 85 cd 00 00 00    	jne    80bc1d <FAT32_lookup+0x6d1>
							{
								j++;
  80bb50:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bb54:	e9 90 00 00 00       	jmp    80bbe9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bb59:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb5d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb60:	48 98                	cdqe   
  80bb62:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb66:	0f b6 d0             	movzx  edx,al
  80bb69:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb6d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb70:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb73:	48 98                	cdqe   
  80bb75:	48 01 c8             	add    rax,rcx
  80bb78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb7b:	0f be c0             	movsx  eax,al
  80bb7e:	39 c2                	cmp    edx,eax
  80bb80:	0f 85 9a 00 00 00    	jne    80bc20 <FAT32_lookup+0x6d4>
							{
								j++;
  80bb86:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bb8a:	eb 5d                	jmp    80bbe9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bb8c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb90:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb93:	48 98                	cdqe   
  80bb95:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb99:	0f b6 d0             	movzx  edx,al
  80bb9c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bba0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bba3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bba6:	48 98                	cdqe   
  80bba8:	48 01 c8             	add    rax,rcx
  80bbab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbae:	0f be c0             	movsx  eax,al
  80bbb1:	39 c2                	cmp    edx,eax
  80bbb3:	75 6e                	jne    80bc23 <FAT32_lookup+0x6d7>
						{
							j++;
  80bbb5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bbb9:	eb 2e                	jmp    80bbe9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bbbb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bbbf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bbc2:	48 98                	cdqe   
  80bbc4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bbc8:	0f b6 d0             	movzx  edx,al
  80bbcb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bbcf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bbd2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bbd5:	48 98                	cdqe   
  80bbd7:	48 01 c8             	add    rax,rcx
  80bbda:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbdd:	0f be c0             	movsx  eax,al
  80bbe0:	39 c2                	cmp    edx,eax
  80bbe2:	75 42                	jne    80bc26 <FAT32_lookup+0x6da>
						{
							j++;
  80bbe4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bbe8:	90                   	nop
			for(x=8;x<11;x++)
  80bbe9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80bbed:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80bbf1:	0f 8e cb fe ff ff    	jle    80bac2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80bbf7:	e9 86 00 00 00       	jmp    80bc82 <FAT32_lookup+0x736>
			continue;
  80bbfc:	90                   	nop
  80bbfd:	eb 28                	jmp    80bc27 <FAT32_lookup+0x6db>
			continue;
  80bbff:	90                   	nop
  80bc00:	eb 25                	jmp    80bc27 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bc02:	90                   	nop
  80bc03:	eb 22                	jmp    80bc27 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bc05:	90                   	nop
  80bc06:	eb 1f                	jmp    80bc27 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bc08:	90                   	nop
  80bc09:	eb 1c                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc0b:	90                   	nop
  80bc0c:	eb 19                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc0e:	90                   	nop
  80bc0f:	eb 16                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc11:	90                   	nop
  80bc12:	eb 13                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc14:	90                   	nop
  80bc15:	eb 10                	jmp    80bc27 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bc17:	90                   	nop
  80bc18:	eb 0d                	jmp    80bc27 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bc1a:	90                   	nop
  80bc1b:	eb 0a                	jmp    80bc27 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bc1d:	90                   	nop
  80bc1e:	eb 07                	jmp    80bc27 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bc20:	90                   	nop
  80bc21:	eb 04                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc23:	90                   	nop
  80bc24:	eb 01                	jmp    80bc27 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bc26:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80bc27:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80bc2b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80bc30:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80bc33:	48 63 d0             	movsxd rdx,eax
  80bc36:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bc3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bc3e:	48 39 c2             	cmp    rdx,rax
  80bc41:	0f 8c 4c fa ff ff    	jl     80b693 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80bc47:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80bc4a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bc4e:	89 d6                	mov    esi,edx
  80bc50:	48 89 c7             	mov    rdi,rax
  80bc53:	e8 2d e7 ff ff       	call   80a385 <DISK1_FAT32_read_FAT_Entry>
  80bc58:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80bc5b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80bc62:	77 05                	ja     80bc69 <FAT32_lookup+0x71d>
		goto next_cluster;
  80bc64:	e9 7f f9 ff ff       	jmp    80b5e8 <FAT32_lookup+0x9c>

	vmfree(buf);
  80bc69:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bc6d:	48 89 c7             	mov    rdi,rax
  80bc70:	e8 3d 55 ff ff       	call   8011b2 <vmfree>
	return NULL;
  80bc75:	b8 00 00 00 00       	mov    eax,0x0
  80bc7a:	e9 f0 01 00 00       	jmp    80be6f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80bc7f:	90                   	nop
  80bc80:	eb 01                	jmp    80bc83 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80bc82:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80bc83:	be 00 00 00 00       	mov    esi,0x0
  80bc88:	bf 38 00 00 00       	mov    edi,0x38
  80bc8d:	b8 00 00 00 00       	mov    eax,0x0
  80bc92:	e8 7b 54 ff ff       	call   801112 <vmalloc>
  80bc97:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80bc9b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bc9f:	ba 38 00 00 00       	mov    edx,0x38
  80bca4:	be 00 00 00 00       	mov    esi,0x0
  80bca9:	48 89 c7             	mov    rdi,rax
  80bcac:	e8 38 12 00 00       	call   80cee9 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80bcb1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bcb5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80bcb8:	89 c2                	mov    edx,eax
  80bcba:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bcbe:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80bcc1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bcc5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bcc8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bccc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bcd0:	48 01 d0             	add    rax,rdx
  80bcd3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80bcd7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bcdb:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bcdf:	48 89 c1             	mov    rcx,rax
  80bce2:	48 89 d0             	mov    rax,rdx
  80bce5:	ba 00 00 00 00       	mov    edx,0x0
  80bcea:	48 f7 f1             	div    rcx
  80bced:	48 89 c2             	mov    rdx,rax
  80bcf0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bcf4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80bcf8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bcfc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80bd00:	0f b6 c0             	movzx  eax,al
  80bd03:	83 e0 10             	and    eax,0x10
  80bd06:	85 c0                	test   eax,eax
  80bd08:	74 07                	je     80bd11 <FAT32_lookup+0x7c5>
  80bd0a:	ba 02 00 00 00       	mov    edx,0x2
  80bd0f:	eb 05                	jmp    80bd16 <FAT32_lookup+0x7ca>
  80bd11:	ba 01 00 00 00       	mov    edx,0x1
  80bd16:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd1a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80bd1e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80bd22:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80bd26:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd2a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80bd2e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd32:	48 c7 40 20 20 db 80 	mov    QWORD PTR [rax+0x20],0x80db20
  80bd39:	00 
	p->inode_ops = &FAT32_inode_ops;
  80bd3a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd3e:	48 c7 40 28 60 db 80 	mov    QWORD PTR [rax+0x28],0x80db60
  80bd45:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80bd46:	be 00 00 00 00       	mov    esi,0x0
  80bd4b:	bf 20 00 00 00       	mov    edi,0x20
  80bd50:	b8 00 00 00 00       	mov    eax,0x0
  80bd55:	e8 b8 53 ff ff       	call   801112 <vmalloc>
  80bd5a:	48 89 c2             	mov    rdx,rax
  80bd5d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd61:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80bd65:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd69:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bd6d:	ba 20 00 00 00       	mov    edx,0x20
  80bd72:	be 00 00 00 00       	mov    esi,0x0
  80bd77:	48 89 c7             	mov    rdi,rax
  80bd7a:	e8 6a 11 00 00       	call   80cee9 <memset>
	finode = p->private_index_info;
  80bd7f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd83:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bd87:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80bd8b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bd8f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80bd93:	0f b7 c0             	movzx  eax,ax
  80bd96:	c1 e0 10             	shl    eax,0x10
  80bd99:	89 c2                	mov    edx,eax
  80bd9b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bd9f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80bda3:	0f b7 c0             	movzx  eax,ax
  80bda6:	09 d0                	or     eax,edx
  80bda8:	48 98                	cdqe   
  80bdaa:	25 ff ff ff 0f       	and    eax,0xfffffff
  80bdaf:	48 89 c2             	mov    rdx,rax
  80bdb2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bdb6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80bdb9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80bdbc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bdc0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80bdc4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdc8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80bdcc:	48 c1 f8 05          	sar    rax,0x5
  80bdd0:	48 89 c2             	mov    rdx,rax
  80bdd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bdd7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80bddb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bddf:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80bde3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bde7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80bdeb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdef:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80bdf3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bdf7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80bdfb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdff:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80be03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80be07:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80be0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be0f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80be13:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80be17:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80be1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be1f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80be23:	66 c1 e8 0c          	shr    ax,0xc
  80be27:	66 85 c0             	test   ax,ax
  80be2a:	74 27                	je     80be53 <FAT32_lookup+0x907>
  80be2c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be30:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80be34:	83 e0 01             	and    eax,0x1
  80be37:	48 85 c0             	test   rax,rax
  80be3a:	74 17                	je     80be53 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80be3c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be40:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80be44:	48 83 c8 04          	or     rax,0x4
  80be48:	48 89 c2             	mov    rdx,rax
  80be4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be4f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80be53:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80be57:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80be5b:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	vmfree(buf);
  80be5f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80be63:	48 89 c7             	mov    rdi,rax
  80be66:	e8 47 53 ff ff       	call   8011b2 <vmfree>
	return dest_dentry;	
  80be6b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80be6f:	c9                   	leave  
  80be70:	c3                   	ret    

000000000080be71 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80be71:	f3 0f 1e fa          	endbr64 
  80be75:	55                   	push   rbp
  80be76:	48 89 e5             	mov    rbp,rsp
  80be79:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80be7d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80be81:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80be84:	90                   	nop
  80be85:	5d                   	pop    rbp
  80be86:	c3                   	ret    

000000000080be87 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80be87:	f3 0f 1e fa          	endbr64 
  80be8b:	55                   	push   rbp
  80be8c:	48 89 e5             	mov    rbp,rsp
  80be8f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80be93:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80be97:	90                   	nop
  80be98:	5d                   	pop    rbp
  80be99:	c3                   	ret    

000000000080be9a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80be9a:	f3 0f 1e fa          	endbr64 
  80be9e:	55                   	push   rbp
  80be9f:	48 89 e5             	mov    rbp,rsp
  80bea2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bea6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80beaa:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80beae:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80beb2:	90                   	nop
  80beb3:	5d                   	pop    rbp
  80beb4:	c3                   	ret    

000000000080beb5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80beb5:	f3 0f 1e fa          	endbr64 
  80beb9:	55                   	push   rbp
  80beba:	48 89 e5             	mov    rbp,rsp
  80bebd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bec1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bec5:	90                   	nop
  80bec6:	5d                   	pop    rbp
  80bec7:	c3                   	ret    

000000000080bec8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80bec8:	f3 0f 1e fa          	endbr64 
  80becc:	55                   	push   rbp
  80becd:	48 89 e5             	mov    rbp,rsp
  80bed0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bed4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bed8:	90                   	nop
  80bed9:	5d                   	pop    rbp
  80beda:	c3                   	ret    

000000000080bedb <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80bedb:	f3 0f 1e fa          	endbr64 
  80bedf:	55                   	push   rbp
  80bee0:	48 89 e5             	mov    rbp,rsp
  80bee3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bee7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80beeb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80beef:	90                   	nop
  80bef0:	5d                   	pop    rbp
  80bef1:	c3                   	ret    

000000000080bef2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80bef2:	f3 0f 1e fa          	endbr64 
  80bef6:	55                   	push   rbp
  80bef7:	48 89 e5             	mov    rbp,rsp
  80befa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80befe:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf02:	90                   	nop
  80bf03:	5d                   	pop    rbp
  80bf04:	c3                   	ret    

000000000080bf05 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80bf05:	f3 0f 1e fa          	endbr64 
  80bf09:	55                   	push   rbp
  80bf0a:	48 89 e5             	mov    rbp,rsp
  80bf0d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf11:	90                   	nop
  80bf12:	5d                   	pop    rbp
  80bf13:	c3                   	ret    

000000000080bf14 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80bf14:	f3 0f 1e fa          	endbr64 
  80bf18:	55                   	push   rbp
  80bf19:	48 89 e5             	mov    rbp,rsp
  80bf1c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf20:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf24:	90                   	nop
  80bf25:	5d                   	pop    rbp
  80bf26:	c3                   	ret    

000000000080bf27 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80bf27:	f3 0f 1e fa          	endbr64 
  80bf2b:	55                   	push   rbp
  80bf2c:	48 89 e5             	mov    rbp,rsp
  80bf2f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf33:	90                   	nop
  80bf34:	5d                   	pop    rbp
  80bf35:	c3                   	ret    

000000000080bf36 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80bf36:	f3 0f 1e fa          	endbr64 
  80bf3a:	55                   	push   rbp
  80bf3b:	48 89 e5             	mov    rbp,rsp
  80bf3e:	48 83 ec 10          	sub    rsp,0x10
  80bf42:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80bf46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf4a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bf4e:	48 89 c7             	mov    rdi,rax
  80bf51:	e8 5c 52 ff ff       	call   8011b2 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80bf56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf5a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf5d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80bf61:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bf65:	48 89 c7             	mov    rdi,rax
  80bf68:	e8 45 52 ff ff       	call   8011b2 <vmfree>
	vmfree(sb->root->dir_inode);
  80bf6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf71:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf74:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80bf78:	48 89 c7             	mov    rdi,rax
  80bf7b:	e8 32 52 ff ff       	call   8011b2 <vmfree>
	vmfree(sb->root);
  80bf80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf84:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf87:	48 89 c7             	mov    rdi,rax
  80bf8a:	e8 23 52 ff ff       	call   8011b2 <vmfree>
	vmfree(sb);
  80bf8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf93:	48 89 c7             	mov    rdi,rax
  80bf96:	e8 17 52 ff ff       	call   8011b2 <vmfree>
}
  80bf9b:	90                   	nop
  80bf9c:	c9                   	leave  
  80bf9d:	c3                   	ret    

000000000080bf9e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80bf9e:	f3 0f 1e fa          	endbr64 
  80bfa2:	55                   	push   rbp
  80bfa3:	48 89 e5             	mov    rbp,rsp
  80bfa6:	48 83 ec 40          	sub    rsp,0x40
  80bfaa:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80bfae:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80bfb5:	00 
	struct FAT32_Directory * buf = NULL;
  80bfb6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80bfbd:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80bfbe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bfc2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bfc6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80bfca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bfce:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bfd2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bfd6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80bfda:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80bfe1:	00 

	if(finode->dentry_location == 0)
  80bfe2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bfe6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80bfea:	48 85 c0             	test   rax,rax
  80bfed:	75 14                	jne    80c003 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80bfef:	bf 8c 5b 81 00       	mov    edi,0x815b8c
  80bff4:	b8 00 00 00 00       	mov    eax,0x0
  80bff9:	e8 79 4d ff ff       	call   800d77 <printf>
		return ;
  80bffe:	e9 30 01 00 00       	jmp    80c133 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80c003:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c007:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80c00b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c00f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80c013:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80c017:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c01b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c01f:	48 0f af c2          	imul   rax,rdx
  80c023:	48 01 c8             	add    rax,rcx
  80c026:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80c02a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c02e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c032:	be 00 00 00 00       	mov    esi,0x0
  80c037:	48 89 c7             	mov    rdi,rax
  80c03a:	b8 00 00 00 00       	mov    eax,0x0
  80c03f:	e8 ce 50 ff ff       	call   801112 <vmalloc>
  80c044:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80c048:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c04c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c050:	89 c2                	mov    edx,eax
  80c052:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c056:	be 00 00 00 00       	mov    esi,0x0
  80c05b:	48 89 c7             	mov    rdi,rax
  80c05e:	e8 86 0e 00 00       	call   80cee9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c063:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c067:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c06b:	89 c1                	mov    ecx,eax
  80c06d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c071:	89 c2                	mov    edx,eax
  80c073:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c077:	49 89 c0             	mov    r8,rax
  80c07a:	be 00 00 00 00       	mov    esi,0x0
  80c07f:	bf 00 00 00 00       	mov    edi,0x0
  80c084:	e8 54 d6 ff ff       	call   8096dd <request>
  80c089:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80c08c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c08f:	89 c7                	mov    edi,eax
  80c091:	e8 fb dc ff ff       	call   809d91 <chk_result>
    fdentry = buf+finode->dentry_position;
  80c096:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c09a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c09e:	48 c1 e0 05          	shl    rax,0x5
  80c0a2:	48 89 c2             	mov    rdx,rax
  80c0a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c0a9:	48 01 d0             	add    rax,rdx
  80c0ac:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80c0b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c0b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0b7:	89 c2                	mov    edx,eax
  80c0b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0bd:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80c0c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0c7:	89 c2                	mov    edx,eax
  80c0c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0cd:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80c0d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0d5:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80c0d9:	66 25 00 f0          	and    ax,0xf000
  80c0dd:	89 c2                	mov    edx,eax
  80c0df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0e6:	48 c1 e8 10          	shr    rax,0x10
  80c0ea:	09 c2                	or     edx,eax
  80c0ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0f0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c0f4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c0fc:	89 c1                	mov    ecx,eax
  80c0fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c102:	89 c2                	mov    edx,eax
  80c104:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c108:	49 89 c0             	mov    r8,rax
  80c10b:	be 01 00 00 00       	mov    esi,0x1
  80c110:	bf 00 00 00 00       	mov    edi,0x0
  80c115:	e8 c3 d5 ff ff       	call   8096dd <request>
  80c11a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80c11d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80c120:	89 c7                	mov    edi,eax
  80c122:	e8 6a dc ff ff       	call   809d91 <chk_result>
	vmfree(buf);
  80c127:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c12b:	48 89 c7             	mov    rdi,rax
  80c12e:	e8 7f 50 ff ff       	call   8011b2 <vmfree>
}
  80c133:	c9                   	leave  
  80c134:	c3                   	ret    

000000000080c135 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80c135:	f3 0f 1e fa          	endbr64 
  80c139:	55                   	push   rbp
  80c13a:	48 89 e5             	mov    rbp,rsp
  80c13d:	48 83 ec 50          	sub    rsp,0x50
  80c141:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80c145:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80c149:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c150:	00 
	struct FAT32_inode_info * finode = NULL;
  80c151:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80c158:	00 
	struct FAT32_BootSector * fbs = NULL;
  80c159:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80c160:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80c161:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80c168:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80c169:	be 00 00 00 00       	mov    esi,0x0
  80c16e:	bf 18 00 00 00       	mov    edi,0x18
  80c173:	b8 00 00 00 00       	mov    eax,0x0
  80c178:	e8 95 4f ff ff       	call   801112 <vmalloc>
  80c17d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80c181:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c185:	ba 18 00 00 00       	mov    edx,0x18
  80c18a:	be 00 00 00 00       	mov    esi,0x0
  80c18f:	48 89 c7             	mov    rdi,rax
  80c192:	e8 52 0d 00 00       	call   80cee9 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80c197:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c19b:	48 c7 40 08 c0 db 80 	mov    QWORD PTR [rax+0x8],0x80dbc0
  80c1a2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80c1a3:	be 00 00 00 00       	mov    esi,0x0
  80c1a8:	bf 60 00 00 00       	mov    edi,0x60
  80c1ad:	b8 00 00 00 00       	mov    eax,0x0
  80c1b2:	e8 5b 4f ff ff       	call   801112 <vmalloc>
  80c1b7:	48 89 c2             	mov    rdx,rax
  80c1ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1be:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80c1c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1c6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c1ca:	ba 60 00 00 00       	mov    edx,0x60
  80c1cf:	be 00 00 00 00       	mov    esi,0x0
  80c1d4:	48 89 c7             	mov    rdi,rax
  80c1d7:	e8 0d 0d 00 00       	call   80cee9 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80c1dc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80c1e0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80c1e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c1ec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80c1f0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c1f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c1f7:	89 c2                	mov    edx,eax
  80c1f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c1fd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80c200:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c204:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c207:	89 c2                	mov    edx,eax
  80c209:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c20d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80c211:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c215:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c219:	0f b6 d0             	movzx  edx,al
  80c21c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c220:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80c224:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c228:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c22c:	0f b6 d0             	movzx  edx,al
  80c22f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c233:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c237:	0f b7 c0             	movzx  eax,ax
  80c23a:	0f af c2             	imul   eax,edx
  80c23d:	48 63 d0             	movsxd rdx,eax
  80c240:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c244:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80c248:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c24c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c250:	0f b7 d0             	movzx  edx,ax
  80c253:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c257:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80c25b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c25f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c262:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c266:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c26a:	0f b7 c0             	movzx  eax,ax
  80c26d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80c270:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c274:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80c277:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c27b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c27f:	0f b6 c0             	movzx  eax,al
  80c282:	0f af c2             	imul   eax,edx
  80c285:	01 c8                	add    eax,ecx
  80c287:	89 c2                	mov    edx,eax
  80c289:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c28d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80c291:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c295:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c298:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c29c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c2a0:	0f b7 c0             	movzx  eax,ax
  80c2a3:	01 d0                	add    eax,edx
  80c2a5:	89 c2                	mov    edx,eax
  80c2a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2ab:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80c2af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2b3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80c2b6:	89 c2                	mov    edx,eax
  80c2b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2bc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80c2c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2c4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c2c8:	0f b6 d0             	movzx  edx,al
  80c2cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2cf:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80c2d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2d7:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c2db:	0f b7 d0             	movzx  edx,ax
  80c2de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2e2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80c2e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2ea:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c2ee:	0f b7 d0             	movzx  edx,ax
  80c2f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2f5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80c2f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2fd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80c300:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c304:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c308:	0f b7 d0             	movzx  edx,ax
  80c30b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c30f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c313:	0f b7 c0             	movzx  eax,ax
  80c316:	89 c6                	mov    esi,eax
  80c318:	bf a8 5b 81 00       	mov    edi,0x815ba8
  80c31d:	b8 00 00 00 00       	mov    eax,0x0
  80c322:	e8 50 4a ff ff       	call   800d77 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80c327:	be 00 00 00 00       	mov    esi,0x0
  80c32c:	bf 00 02 00 00       	mov    edi,0x200
  80c331:	b8 00 00 00 00       	mov    eax,0x0
  80c336:	e8 d7 4d ff ff       	call   801112 <vmalloc>
  80c33b:	48 89 c2             	mov    rdx,rax
  80c33e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c342:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80c346:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c34a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c34e:	ba 00 02 00 00       	mov    edx,0x200
  80c353:	be 00 00 00 00       	mov    esi,0x0
  80c358:	48 89 c7             	mov    rdi,rax
  80c35b:	e8 89 0b 00 00       	call   80cee9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80c360:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c364:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80c368:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c36c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80c36f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c373:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c377:	0f b7 c0             	movzx  eax,ax
  80c37a:	01 c8                	add    eax,ecx
  80c37c:	49 89 d0             	mov    r8,rdx
  80c37f:	b9 01 00 00 00       	mov    ecx,0x1
  80c384:	89 c2                	mov    edx,eax
  80c386:	be 00 00 00 00       	mov    esi,0x0
  80c38b:	bf 00 00 00 00       	mov    edi,0x0
  80c390:	e8 48 d3 ff ff       	call   8096dd <request>
  80c395:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80c398:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80c39b:	89 c7                	mov    edi,eax
  80c39d:	e8 ef d9 ff ff       	call   809d91 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80c3a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3a6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c3aa:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80c3b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3b4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c3b8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80c3be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3c2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c3c6:	8b 00                	mov    eax,DWORD PTR [rax]
  80c3c8:	89 c6                	mov    esi,eax
  80c3ca:	bf f0 5b 81 00       	mov    edi,0x815bf0
  80c3cf:	b8 00 00 00 00       	mov    eax,0x0
  80c3d4:	e8 9e 49 ff ff       	call   800d77 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80c3d9:	be 00 00 00 00       	mov    esi,0x0
  80c3de:	bf 58 00 00 00       	mov    edi,0x58
  80c3e3:	b8 00 00 00 00       	mov    eax,0x0
  80c3e8:	e8 25 4d ff ff       	call   801112 <vmalloc>
  80c3ed:	48 89 c2             	mov    rdx,rax
  80c3f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3f4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80c3f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c3fe:	ba 58 00 00 00       	mov    edx,0x58
  80c403:	be 00 00 00 00       	mov    esi,0x0
  80c408:	48 89 c7             	mov    rdi,rax
  80c40b:	e8 d9 0a 00 00       	call   80cee9 <memset>

	list_init(&sbp->root->child_node);
  80c410:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c414:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c417:	48 83 c0 10          	add    rax,0x10
  80c41b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = NULL;
  80c41f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c423:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c42a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c42e:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c435:	00 
}
  80c436:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80c437:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c43b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c43e:	48 83 c0 28          	add    rax,0x28
  80c442:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = NULL;
  80c446:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c44a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c451:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c455:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c45c:	00 
}
  80c45d:	90                   	nop
	sbp->root->parent = sbp->root;
  80c45e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c462:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c465:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c469:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80c46c:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80c470:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c474:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c477:	48 c7 40 50 a0 db 80 	mov    QWORD PTR [rax+0x50],0x80dba0
  80c47e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80c47f:	be 00 00 00 00       	mov    esi,0x0
  80c484:	bf 02 00 00 00       	mov    edi,0x2
  80c489:	b8 00 00 00 00       	mov    eax,0x0
  80c48e:	e8 7f 4c ff ff       	call   801112 <vmalloc>
  80c493:	48 89 c2             	mov    rdx,rax
  80c496:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c49a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c49d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80c4a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4a7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4aa:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80c4ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4b4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80c4bb:	be 00 00 00 00       	mov    esi,0x0
  80c4c0:	bf 38 00 00 00       	mov    edi,0x38
  80c4c5:	b8 00 00 00 00       	mov    eax,0x0
  80c4ca:	e8 43 4c ff ff       	call   801112 <vmalloc>
  80c4cf:	48 89 c2             	mov    rdx,rax
  80c4d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4d9:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80c4dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4e4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c4e8:	ba 38 00 00 00       	mov    edx,0x38
  80c4ed:	be 00 00 00 00       	mov    esi,0x0
  80c4f2:	48 89 c7             	mov    rdi,rax
  80c4f5:	e8 ef 09 00 00       	call   80cee9 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80c4fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c501:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c505:	48 c7 40 28 60 db 80 	mov    QWORD PTR [rax+0x28],0x80db60
  80c50c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80c50d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c511:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c514:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c518:	48 c7 40 20 20 db 80 	mov    QWORD PTR [rax+0x20],0x80db20
  80c51f:	00 
	sbp->root->dir_inode->file_size = 0;
  80c520:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c524:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c527:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c52b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80c532:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c536:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c539:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c53d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c540:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c544:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c548:	48 01 d0             	add    rax,rdx
  80c54b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80c54f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c553:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c557:	48 89 c6             	mov    rsi,rax
  80c55a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c55e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c561:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80c565:	48 89 d0             	mov    rax,rdx
  80c568:	ba 00 00 00 00       	mov    edx,0x0
  80c56d:	48 f7 f6             	div    rsi
  80c570:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80c574:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c578:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c57b:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c57f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80c586:	00 
	sbp->root->dir_inode->sb = sbp;
  80c587:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c58b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c58e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c592:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c596:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80c59a:	be 00 00 00 00       	mov    esi,0x0
  80c59f:	bf 20 00 00 00       	mov    edi,0x20
  80c5a4:	b8 00 00 00 00       	mov    eax,0x0
  80c5a9:	e8 64 4b ff ff       	call   801112 <vmalloc>
  80c5ae:	48 89 c2             	mov    rdx,rax
  80c5b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5b5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5b8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5bc:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80c5c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5c7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5cb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c5cf:	ba 20 00 00 00       	mov    edx,0x20
  80c5d4:	be 00 00 00 00       	mov    esi,0x0
  80c5d9:	48 89 c7             	mov    rdi,rax
  80c5dc:	e8 08 09 00 00       	call   80cee9 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80c5e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5e8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5ec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c5f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80c5f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c5f8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80c5fb:	89 c2                	mov    edx,eax
  80c5fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c601:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80c604:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c608:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80c60f:	00 
	finode->dentry_position = 0; 
  80c610:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c614:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c61b:	00 
	finode->create_date = 0;
  80c61c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c620:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80c626:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c62a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80c630:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c634:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80c63a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c63e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80c644:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80c648:	c9                   	leave  
  80c649:	c3                   	ret    

000000000080c64a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80c64a:	f3 0f 1e fa          	endbr64 
  80c64e:	55                   	push   rbp
  80c64f:	48 89 e5             	mov    rbp,rsp
  80c652:	48 81 ec 20 04 00 00 	sub    rsp,0x420
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80c659:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c660:	00 
	struct Disk_Partition_Table DPT = {0};
  80c661:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c668:	b8 00 00 00 00       	mov    eax,0x0
  80c66d:	b9 40 00 00 00       	mov    ecx,0x40
  80c672:	48 89 d7             	mov    rdi,rdx
  80c675:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80c678:	bf e0 db 80 00       	mov    edi,0x80dbe0
  80c67d:	e8 6b ba ff ff       	call   8080ed <register_filesystem>
	
	memset(buf,0,512);
  80c682:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c689:	ba 00 02 00 00       	mov    edx,0x200
  80c68e:	be 00 00 00 00       	mov    esi,0x0
  80c693:	48 89 c7             	mov    rdi,rax
  80c696:	e8 4e 08 00 00       	call   80cee9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80c69b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c6a2:	49 89 c0             	mov    r8,rax
  80c6a5:	b9 01 00 00 00       	mov    ecx,0x1
  80c6aa:	ba 00 00 00 00       	mov    edx,0x0
  80c6af:	be 00 00 00 00       	mov    esi,0x0
  80c6b4:	bf 00 00 00 00       	mov    edi,0x0
  80c6b9:	e8 1f d0 ff ff       	call   8096dd <request>
  80c6be:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80c6c1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80c6c4:	89 c7                	mov    edi,eax
  80c6c6:	e8 c6 d6 ff ff       	call   809d91 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80c6cb:	48 8d 95 e0 fd ff ff 	lea    rdx,[rbp-0x220]
  80c6d2:	48 8d 85 e0 fb ff ff 	lea    rax,[rbp-0x420]
  80c6d9:	48 89 d6             	mov    rsi,rdx
  80c6dc:	ba 40 00 00 00       	mov    edx,0x40
  80c6e1:	48 89 c7             	mov    rdi,rax
  80c6e4:	48 89 d1             	mov    rcx,rdx
  80c6e7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80c6ea:	0f b6 85 a2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x25e]
  80c6f1:	0f b6 d0             	movzx  edx,al
  80c6f4:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c6fa:	89 c6                	mov    esi,eax
  80c6fc:	bf 38 5c 81 00       	mov    edi,0x815c38
  80c701:	b8 00 00 00 00       	mov    eax,0x0
  80c706:	e8 6c 46 ff ff       	call   800d77 <printf>

	memset(buf,0,512);
  80c70b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c712:	ba 00 02 00 00       	mov    edx,0x200
  80c717:	be 00 00 00 00       	mov    esi,0x0
  80c71c:	48 89 c7             	mov    rdi,rax
  80c71f:	e8 c5 07 00 00       	call   80cee9 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80c724:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c72a:	89 c2                	mov    edx,eax
  80c72c:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c733:	49 89 c0             	mov    r8,rax
  80c736:	b9 01 00 00 00       	mov    ecx,0x1
  80c73b:	be 00 00 00 00       	mov    esi,0x0
  80c740:	bf 00 00 00 00       	mov    edi,0x0
  80c745:	e8 93 cf ff ff       	call   8096dd <request>
  80c74a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80c74d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80c750:	89 c7                	mov    edi,eax
  80c752:	e8 3a d6 ff ff       	call   809d91 <chk_result>

    //挂载新文件系统到/mnt
	struct super_block *fat32_sb= mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80c757:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c75e:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c765:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80c76c:	48 89 c2             	mov    rdx,rax
  80c76f:	48 89 ce             	mov    rsi,rcx
  80c772:	bf 32 5c 81 00       	mov    edi,0x815c32
  80c777:	e8 f9 b8 ff ff       	call   808075 <mount_fs>
  80c77c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    fat32_sb->root=dmnt;
  80c780:	48 8b 15 41 bd bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfbd41]        # 4084c8 <dmnt>
  80c787:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c78b:	48 89 10             	mov    QWORD PTR [rax],rdx
//    list_add_to_behind(&root_sb->root->subdirs_list,ddev);//把dev文件夹挂到新的rfs下
}
  80c78e:	90                   	nop
  80c78f:	c9                   	leave  
  80c790:	c3                   	ret    

000000000080c791 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=ioctl_tty
};

long close_tty(struct index_node * inode,struct file * filp){
  80c791:	f3 0f 1e fa          	endbr64 
  80c795:	55                   	push   rbp
  80c796:	48 89 e5             	mov    rbp,rsp
  80c799:	48 83 ec 30          	sub    rsp,0x30
  80c79d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c7a1:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80c7a5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c7a9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c7ad:	48 83 c0 18          	add    rax,0x18
  80c7b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80c7b5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c7b9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c7bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80c7c1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c7c5:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c7c9:	48 83 c0 30          	add    rax,0x30
  80c7cd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80c7d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c7d5:	48 89 c7             	mov    rdi,rax
  80c7d8:	e8 d5 49 ff ff       	call   8011b2 <vmfree>
    vmfree((addr_t)bo);
  80c7dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c7e1:	48 89 c7             	mov    rdi,rax
  80c7e4:	e8 c9 49 ff ff       	call   8011b2 <vmfree>
    vmfree((addr_t)be);
  80c7e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c7ed:	48 89 c7             	mov    rdi,rax
  80c7f0:	e8 bd 49 ff ff       	call   8011b2 <vmfree>
    vmfree((addr_t)filp->private_data);
  80c7f5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c7f9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c7fd:	48 89 c7             	mov    rdi,rax
  80c800:	e8 ad 49 ff ff       	call   8011b2 <vmfree>
    return 0;
  80c805:	b8 00 00 00 00       	mov    eax,0x0
}
  80c80a:	c9                   	leave  
  80c80b:	c3                   	ret    

000000000080c80c <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80c80c:	f3 0f 1e fa          	endbr64 
  80c810:	55                   	push   rbp
  80c811:	48 89 e5             	mov    rbp,rsp
  80c814:	48 83 ec 20          	sub    rsp,0x20
  80c818:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c81c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80c820:	b8 00 00 00 00       	mov    eax,0x0
  80c825:	e8 e8 48 ff ff       	call   801112 <vmalloc>
  80c82a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80c82e:	b8 00 00 00 00       	mov    eax,0x0
  80c833:	e8 da 48 ff ff       	call   801112 <vmalloc>
  80c838:	48 89 c2             	mov    rdx,rax
  80c83b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c83f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80c843:	b8 00 00 00 00       	mov    eax,0x0
  80c848:	e8 c5 48 ff ff       	call   801112 <vmalloc>
  80c84d:	48 89 c2             	mov    rdx,rax
  80c850:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c854:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80c857:	b8 00 00 00 00       	mov    eax,0x0
  80c85c:	e8 b1 48 ff ff       	call   801112 <vmalloc>
  80c861:	48 89 c2             	mov    rdx,rax
  80c864:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c868:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80c86c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c870:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80c877:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c87b:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80c882:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c886:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80c88d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c891:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80c898:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c89c:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80c8a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8a7:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80c8ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8b2:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80c8b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8bd:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80c8c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8c8:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80c8cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c8d3:	48 c7 40 20 00 dc 80 	mov    QWORD PTR [rax+0x20],0x80dc00
  80c8da:	00 
    filp->f_ops=&tty_fops;
  80c8db:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c8df:	48 c7 40 18 00 dc 80 	mov    QWORD PTR [rax+0x18],0x80dc00
  80c8e6:	00 
    filp->private_data=ntty;
  80c8e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c8eb:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c8ef:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80c8f3:	b8 00 00 00 00       	mov    eax,0x0
}
  80c8f8:	c9                   	leave  
  80c8f9:	c3                   	ret    

000000000080c8fa <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80c8fa:	f3 0f 1e fa          	endbr64 
  80c8fe:	55                   	push   rbp
  80c8ff:	48 89 e5             	mov    rbp,rsp
  80c902:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c906:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80c90a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80c90e:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80c912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c916:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c91a:	48 83 c0 18          	add    rax,0x18
  80c91e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c922:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80c929:	eb 6e                	jmp    80c999 <read_tty+0x9f>
        if(b->rptr==b->size)
  80c92b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c92f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80c932:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c936:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80c939:	39 c2                	cmp    edx,eax
  80c93b:	75 0b                	jne    80c948 <read_tty+0x4e>
            b->rptr=0;
  80c93d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c941:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        if(b->rptr==b->wptr)continue;
  80c948:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c94c:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80c94f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c953:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c956:	39 c2                	cmp    edx,eax
  80c958:	75 02                	jne    80c95c <read_tty+0x62>
  80c95a:	eb 3d                	jmp    80c999 <read_tty+0x9f>
        buf[i++]=b->data[b->rptr];
  80c95c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c960:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c963:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c967:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c96a:	48 98                	cdqe   
  80c96c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80c970:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c973:	8d 50 01             	lea    edx,[rax+0x1]
  80c976:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c979:	48 63 d0             	movsxd rdx,eax
  80c97c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c980:	48 01 c2             	add    rdx,rax
  80c983:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80c986:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80c988:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c98c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c98f:	8d 50 01             	lea    edx,[rax+0x1]
  80c992:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c996:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80c999:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c99c:	48 98                	cdqe   
  80c99e:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80c9a2:	77 87                	ja     80c92b <read_tty+0x31>
    }
}
  80c9a4:	90                   	nop
  80c9a5:	5d                   	pop    rbp
  80c9a6:	c3                   	ret    

000000000080c9a7 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80c9a7:	f3 0f 1e fa          	endbr64 
  80c9ab:	55                   	push   rbp
  80c9ac:	48 89 e5             	mov    rbp,rsp
  80c9af:	48 83 ec 40          	sub    rsp,0x40
  80c9b3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c9b7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80c9bb:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80c9bf:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80c9c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c9c7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c9cb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c9cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80c9d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c9da:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c9dd:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80c9e0:	eb 5a                	jmp    80ca3c <write_tty+0x95>
        if(b->wptr==b->size)
  80c9e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c9e6:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c9e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c9ed:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80c9f0:	39 c2                	cmp    edx,eax
  80c9f2:	75 0b                	jne    80c9ff <write_tty+0x58>
            b->wptr=0;
  80c9f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c9f8:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80c9ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ca02:	8d 50 01             	lea    edx,[rax+0x1]
  80ca05:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ca08:	48 63 d0             	movsxd rdx,eax
  80ca0b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ca0f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80ca13:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca17:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ca1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca1e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ca21:	48 98                	cdqe   
  80ca23:	48 01 c2             	add    rdx,rax
  80ca26:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80ca29:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80ca2b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca2f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ca32:	8d 50 01             	lea    edx,[rax+0x1]
  80ca35:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca39:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80ca3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ca3f:	48 98                	cdqe   
  80ca41:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80ca45:	77 9b                	ja     80c9e2 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80ca47:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca4b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ca4e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ca51:	48 98                	cdqe   
  80ca53:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80ca57:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80ca5b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ca5f:	b9 00 00 00 00       	mov    ecx,0x0
  80ca64:	48 89 c7             	mov    rdi,rax
  80ca67:	e8 a8 b1 ff ff       	call   807c14 <write_framebuffer>
}
  80ca6c:	90                   	nop
  80ca6d:	c9                   	leave  
  80ca6e:	c3                   	ret    

000000000080ca6f <ioctl_tty>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long ioctl_tty(struct index_node * inode, struct file * filp, unsigned long cmd, unsigned long arg)
{
  80ca6f:	f3 0f 1e fa          	endbr64 
  80ca73:	55                   	push   rbp
  80ca74:	48 89 e5             	mov    rbp,rsp
  80ca77:	48 83 ec 50          	sub    rsp,0x50
  80ca7b:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80ca7f:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80ca83:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80ca87:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80ca8b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80ca8f:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ca93:	48 83 c0 30          	add    rax,0x30
  80ca97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * ib=&((tty_t*)filp->private_data)->stdin_buf;
  80ca9b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80ca9f:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80caa3:	48 83 c0 18          	add    rax,0x18
  80caa7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int i=0;
  80caab:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80cab2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cab6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cab9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80cabd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cac1:	48 83 c0 08          	add    rax,0x8
  80cac5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cac8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int saved_wptr=b->wptr;
  80cacc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cad0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cad3:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    int fd=-1;
  80cad6:	c7 45 d0 ff ff ff ff 	mov    DWORD PTR [rbp-0x30],0xffffffff
    switch (cmd)
  80cadd:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80cae2:	0f 84 81 01 00 00    	je     80cc69 <ioctl_tty+0x1fa>
  80cae8:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80caed:	0f 87 81 01 00 00    	ja     80cc74 <ioctl_tty+0x205>
  80caf3:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80caf8:	0f 84 e8 00 00 00    	je     80cbe6 <ioctl_tty+0x177>
  80cafe:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80cb03:	0f 87 6b 01 00 00    	ja     80cc74 <ioctl_tty+0x205>
  80cb09:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80cb0e:	74 6a                	je     80cb7a <ioctl_tty+0x10b>
  80cb10:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80cb15:	0f 84 94 00 00 00    	je     80cbaf <ioctl_tty+0x140>
  80cb1b:	e9 54 01 00 00       	jmp    80cc74 <ioctl_tty+0x205>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80cb20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb24:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cb27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb2b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cb2e:	39 c2                	cmp    edx,eax
  80cb30:	75 0b                	jne    80cb3d <ioctl_tty+0xce>
                    b->wptr=0;
  80cb32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb36:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80cb3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cb40:	8d 50 01             	lea    edx,[rax+0x1]
  80cb43:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cb46:	48 63 d0             	movsxd rdx,eax
  80cb49:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cb4d:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cb51:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb55:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cb58:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb5c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb5f:	48 98                	cdqe   
  80cb61:	48 01 c2             	add    rdx,rax
  80cb64:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cb67:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80cb69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb6d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb70:	8d 50 01             	lea    edx,[rax+0x1]
  80cb73:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb77:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80cb7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cb7d:	48 98                	cdqe   
  80cb7f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cb83:	77 9b                	ja     80cb20 <ioctl_tty+0xb1>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80cb85:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb89:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cb8c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80cb8f:	48 98                	cdqe   
  80cb91:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80cb95:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80cb99:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cb9d:	b9 00 00 00 00       	mov    ecx,0x0
  80cba2:	48 89 c7             	mov    rdi,rax
  80cba5:	e8 6a b0 ff ff       	call   807c14 <write_framebuffer>
        break;
  80cbaa:	e9 ce 00 00 00       	jmp    80cc7d <ioctl_tty+0x20e>
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
  80cbaf:	be c1 00 00 00       	mov    esi,0xc1
  80cbb4:	bf 56 5c 81 00       	mov    edi,0x815c56
  80cbb9:	e8 2f b8 ff ff       	call   8083ed <sys_open>
  80cbbe:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80cbc1:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80cbc5:	75 0c                	jne    80cbd3 <ioctl_tty+0x164>
  80cbc7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cbce:	e9 af 00 00 00       	jmp    80cc82 <ioctl_tty+0x213>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80cbd3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cbd7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cbdb:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80cbde:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80cbe1:	e9 97 00 00 00       	jmp    80cc7d <ioctl_tty+0x20e>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80cbe6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cbea:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cbee:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80cbf1:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80cbf4:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80cbf8:	75 09                	jne    80cc03 <ioctl_tty+0x194>
  80cbfa:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cc01:	eb 7f                	jmp    80cc82 <ioctl_tty+0x213>
            sys_close(fd);
  80cc03:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80cc06:	89 c7                	mov    edi,eax
  80cc08:	e8 77 bd ff ff       	call   808984 <sys_close>
        case TTY_WSTDIN:
            while (i<count){
  80cc0d:	eb 5a                	jmp    80cc69 <ioctl_tty+0x1fa>
                if(ib->wptr==ib->size)
  80cc0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc13:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cc16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc1a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cc1d:	39 c2                	cmp    edx,eax
  80cc1f:	75 0b                	jne    80cc2c <ioctl_tty+0x1bd>
                    ib->wptr=0;
  80cc21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc25:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                ib->data[ib->wptr]=buf[i++];
  80cc2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc2f:	8d 50 01             	lea    edx,[rax+0x1]
  80cc32:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cc35:	48 63 d0             	movsxd rdx,eax
  80cc38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cc3c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cc40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc44:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cc47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc4b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc4e:	48 98                	cdqe   
  80cc50:	48 01 c2             	add    rdx,rax
  80cc53:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cc56:	88 02                	mov    BYTE PTR [rdx],al
                ib->wptr++;
  80cc58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc5c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc5f:	8d 50 01             	lea    edx,[rax+0x1]
  80cc62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc66:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80cc69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc6c:	48 98                	cdqe   
  80cc6e:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cc72:	77 9b                	ja     80cc0f <ioctl_tty+0x1a0>
            }
    default:return -1;
  80cc74:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cc7b:	eb 05                	jmp    80cc82 <ioctl_tty+0x213>
    }
    return 0;
  80cc7d:	b8 00 00 00 00       	mov    eax,0x0
}
  80cc82:	c9                   	leave  
  80cc83:	c3                   	ret    

000000000080cc84 <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80cc84:	f3 0f 1e fa          	endbr64 
  80cc88:	55                   	push   rbp
  80cc89:	48 89 e5             	mov    rbp,rsp
  80cc8c:	48 83 ec 10          	sub    rsp,0x10
  80cc90:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80cc93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc96:	83 c0 01             	add    eax,0x1
  80cc99:	0f b7 c0             	movzx  eax,ax
  80cc9c:	be 00 00 00 00       	mov    esi,0x0
  80cca1:	89 c7                	mov    edi,eax
  80cca3:	e8 48 9a ff ff       	call   8066f0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80cca8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccab:	83 c0 03             	add    eax,0x3
  80ccae:	0f b7 c0             	movzx  eax,ax
  80ccb1:	be 80 00 00 00       	mov    esi,0x80
  80ccb6:	89 c7                	mov    edi,eax
  80ccb8:	e8 33 9a ff ff       	call   8066f0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80ccbd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccc0:	0f b7 c0             	movzx  eax,ax
  80ccc3:	be 03 00 00 00       	mov    esi,0x3
  80ccc8:	89 c7                	mov    edi,eax
  80ccca:	e8 21 9a ff ff       	call   8066f0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80cccf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccd2:	83 c0 01             	add    eax,0x1
  80ccd5:	0f b7 c0             	movzx  eax,ax
  80ccd8:	be 00 00 00 00       	mov    esi,0x0
  80ccdd:	89 c7                	mov    edi,eax
  80ccdf:	e8 0c 9a ff ff       	call   8066f0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80cce4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cce7:	83 c0 03             	add    eax,0x3
  80ccea:	0f b7 c0             	movzx  eax,ax
  80cced:	be 03 00 00 00       	mov    esi,0x3
  80ccf2:	89 c7                	mov    edi,eax
  80ccf4:	e8 f7 99 ff ff       	call   8066f0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80ccf9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccfc:	83 c0 02             	add    eax,0x2
  80ccff:	0f b7 c0             	movzx  eax,ax
  80cd02:	be 87 00 00 00       	mov    esi,0x87
  80cd07:	89 c7                	mov    edi,eax
  80cd09:	e8 e2 99 ff ff       	call   8066f0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80cd0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd11:	83 c0 04             	add    eax,0x4
  80cd14:	0f b7 c0             	movzx  eax,ax
  80cd17:	be 0b 00 00 00       	mov    esi,0xb
  80cd1c:	89 c7                	mov    edi,eax
  80cd1e:	e8 cd 99 ff ff       	call   8066f0 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80cd23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd26:	83 c0 04             	add    eax,0x4
  80cd29:	0f b7 c0             	movzx  eax,ax
  80cd2c:	be 0f 00 00 00       	mov    esi,0xf
  80cd31:	89 c7                	mov    edi,eax
  80cd33:	e8 b8 99 ff ff       	call   8066f0 <outb>
}
  80cd38:	90                   	nop
  80cd39:	c9                   	leave  
  80cd3a:	c3                   	ret    

000000000080cd3b <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80cd3b:	f3 0f 1e fa          	endbr64 
  80cd3f:	55                   	push   rbp
  80cd40:	48 89 e5             	mov    rbp,rsp
  80cd43:	48 83 ec 20          	sub    rsp,0x20
  80cd47:	89 f8                	mov    eax,edi
  80cd49:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80cd4c:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80cd50:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80cd53:	83 c0 05             	add    eax,0x5
  80cd56:	0f b6 c0             	movzx  eax,al
  80cd59:	89 c7                	mov    edi,eax
  80cd5b:	e8 a9 99 ff ff       	call   806709 <inb>
  80cd60:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80cd63:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80cd67:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80cd6b:	74 e3                	je     80cd50 <com_putchar+0x15>
    outb(com_base, ch);
  80cd6d:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80cd71:	0f b6 d0             	movzx  edx,al
  80cd74:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80cd77:	0f b7 c0             	movzx  eax,ax
  80cd7a:	89 d6                	mov    esi,edx
  80cd7c:	89 c7                	mov    edi,eax
  80cd7e:	e8 6d 99 ff ff       	call   8066f0 <outb>
}
  80cd83:	90                   	nop
  80cd84:	c9                   	leave  
  80cd85:	c3                   	ret    

000000000080cd86 <com_puts>:

void com_puts(char* s,int com_port){
  80cd86:	f3 0f 1e fa          	endbr64 
  80cd8a:	55                   	push   rbp
  80cd8b:	48 89 e5             	mov    rbp,rsp
  80cd8e:	48 83 ec 10          	sub    rsp,0x10
  80cd92:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80cd96:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80cd99:	eb 1d                	jmp    80cdb8 <com_puts+0x32>
        com_putchar(*s,com_port);
  80cd9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cd9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cda2:	66 98                	cbw    
  80cda4:	0f b7 c0             	movzx  eax,ax
  80cda7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80cdaa:	89 d6                	mov    esi,edx
  80cdac:	89 c7                	mov    edi,eax
  80cdae:	e8 88 ff ff ff       	call   80cd3b <com_putchar>
    for(;*s;s++){
  80cdb3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80cdb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cdbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cdbf:	84 c0                	test   al,al
  80cdc1:	75 d8                	jne    80cd9b <com_puts+0x15>
    }
}
  80cdc3:	90                   	nop
  80cdc4:	90                   	nop
  80cdc5:	c9                   	leave  
  80cdc6:	c3                   	ret    

000000000080cdc7 <comprintf>:
void comprintf(char* fmt,va_list args){
  80cdc7:	f3 0f 1e fa          	endbr64 
  80cdcb:	55                   	push   rbp
  80cdcc:	48 89 e5             	mov    rbp,rsp
  80cdcf:	48 83 ec 20          	sub    rsp,0x20
  80cdd3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cdd7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80cddb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cddf:	48 89 c7             	mov    rdi,rax
  80cde2:	e8 70 03 00 00       	call   80d157 <strlen>
  80cde7:	3d ff 03 00 00       	cmp    eax,0x3ff
  80cdec:	7f 49                	jg     80ce37 <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80cdee:	b8 00 00 00 00       	mov    eax,0x0
  80cdf3:	e8 1a 43 ff ff       	call   801112 <vmalloc>
  80cdf8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80cdfc:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80ce00:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80ce04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ce08:	48 89 ce             	mov    rsi,rcx
  80ce0b:	48 89 c7             	mov    rdi,rax
  80ce0e:	b8 00 00 00 00       	mov    eax,0x0
  80ce13:	e8 6d 03 00 00       	call   80d185 <sprintf>
    com_puts(tmp,PORT_COM1);
  80ce18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ce1c:	be f8 03 00 00       	mov    esi,0x3f8
  80ce21:	48 89 c7             	mov    rdi,rax
  80ce24:	e8 5d ff ff ff       	call   80cd86 <com_puts>
    vmfree(tmp);
  80ce29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ce2d:	48 89 c7             	mov    rdi,rax
  80ce30:	e8 7d 43 ff ff       	call   8011b2 <vmfree>
  80ce35:	eb 01                	jmp    80ce38 <comprintf+0x71>
        return;//一次性输出不了太长
  80ce37:	90                   	nop
  80ce38:	c9                   	leave  
  80ce39:	c3                   	ret    

000000000080ce3a <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80ce3a:	f3 0f 1e fa          	endbr64 
  80ce3e:	55                   	push   rbp
  80ce3f:	48 89 e5             	mov    rbp,rsp
  80ce42:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ce46:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80ce4a:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80ce4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ce51:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80ce54:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80ce5b:	eb 1b                	jmp    80ce78 <memcpy+0x3e>
        *(dest)=*(src);
  80ce5d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ce61:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80ce64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ce68:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80ce6a:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80ce6f:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80ce74:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80ce78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce7b:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80ce7e:	77 dd                	ja     80ce5d <memcpy+0x23>
    }
}
  80ce80:	90                   	nop
  80ce81:	90                   	nop
  80ce82:	5d                   	pop    rbp
  80ce83:	c3                   	ret    

000000000080ce84 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80ce84:	f3 0f 1e fa          	endbr64 
  80ce88:	55                   	push   rbp
  80ce89:	48 89 e5             	mov    rbp,rsp
  80ce8c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ce90:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80ce94:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80ce97:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80ce9e:	eb 3a                	jmp    80ceda <memcmp+0x56>
    {
        if(*a!=*b)
  80cea0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cea4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cea7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ceab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ceae:	38 c2                	cmp    dl,al
  80ceb0:	74 1a                	je     80cecc <memcmp+0x48>
            return *a-*b;
  80ceb2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ceb6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ceb9:	0f b6 d0             	movzx  edx,al
  80cebc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cec0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cec3:	0f b6 c8             	movzx  ecx,al
  80cec6:	89 d0                	mov    eax,edx
  80cec8:	29 c8                	sub    eax,ecx
  80ceca:	eb 1b                	jmp    80cee7 <memcmp+0x63>
        a++;
  80cecc:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80ced1:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80ced6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80ceda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cedd:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80cee0:	7c be                	jl     80cea0 <memcmp+0x1c>
    }
    return 0;
  80cee2:	b8 00 00 00 00       	mov    eax,0x0
}
  80cee7:	5d                   	pop    rbp
  80cee8:	c3                   	ret    

000000000080cee9 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80cee9:	f3 0f 1e fa          	endbr64 
  80ceed:	55                   	push   rbp
  80ceee:	48 89 e5             	mov    rbp,rsp
  80cef1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cef5:	89 f0                	mov    eax,esi
  80cef7:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80cefa:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80cefd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cf04:	eb 16                	jmp    80cf1c <memset+0x33>
        *(buf++)=value;
  80cf06:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf0a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80cf0e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80cf12:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80cf16:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80cf18:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cf1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cf1f:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80cf22:	72 e2                	jb     80cf06 <memset+0x1d>
    }
}
  80cf24:	90                   	nop
  80cf25:	90                   	nop
  80cf26:	5d                   	pop    rbp
  80cf27:	c3                   	ret    

000000000080cf28 <get_mem_size>:

u32 get_mem_size(){
  80cf28:	f3 0f 1e fa          	endbr64 
  80cf2c:	55                   	push   rbp
  80cf2d:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80cf30:	8b 05 c6 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3c6]        # 42b2fc <mem_end>
}
  80cf36:	5d                   	pop    rbp
  80cf37:	c3                   	ret    

000000000080cf38 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80cf38:	f3 0f 1e fa          	endbr64 
  80cf3c:	55                   	push   rbp
  80cf3d:	48 89 e5             	mov    rbp,rsp
  80cf40:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80cf44:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80cf48:	eb 1d                	jmp    80cf67 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80cf4a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80cf4e:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80cf52:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80cf56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf5a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80cf5e:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80cf62:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80cf65:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80cf67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cf6b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf6e:	84 c0                	test   al,al
  80cf70:	75 d8                	jne    80cf4a <strcpy+0x12>
    }
    *dest='\0';
  80cf72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf76:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80cf79:	90                   	nop
  80cf7a:	5d                   	pop    rbp
  80cf7b:	c3                   	ret    

000000000080cf7c <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80cf7c:	f3 0f 1e fa          	endbr64 
  80cf80:	55                   	push   rbp
  80cf81:	48 89 e5             	mov    rbp,rsp
  80cf84:	48 83 ec 30          	sub    rsp,0x30
  80cf88:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80cf8c:	89 f0                	mov    eax,esi
  80cf8e:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80cf91:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80cf96:	0f 84 9c 00 00 00    	je     80d038 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80cf9c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80cfa0:	48 89 c6             	mov    rsi,rax
  80cfa3:	bf 20 b3 42 00       	mov    edi,0x42b320
  80cfa8:	e8 8b ff ff ff       	call   80cf38 <strcpy>
        char* ptr=strtokkee;
  80cfad:	48 c7 45 e8 20 b3 42 	mov    QWORD PTR [rbp-0x18],0x42b320
  80cfb4:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80cfb5:	c7 05 61 e5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1e561],0x0        # 42b520 <tokptr>
  80cfbc:	00 00 00 
  80cfbf:	eb 1c                	jmp    80cfdd <strtok+0x61>
  80cfc1:	8b 05 59 e5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e559]        # 42b520 <tokptr>
  80cfc7:	83 c0 01             	add    eax,0x1
  80cfca:	99                   	cdq    
  80cfcb:	c1 ea 17             	shr    edx,0x17
  80cfce:	01 d0                	add    eax,edx
  80cfd0:	25 ff 01 00 00       	and    eax,0x1ff
  80cfd5:	29 d0                	sub    eax,edx
  80cfd7:	89 05 43 e5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e543],eax        # 42b520 <tokptr>
  80cfdd:	8b 05 3d e5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e53d]        # 42b520 <tokptr>
  80cfe3:	48 98                	cdqe   
  80cfe5:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80cfec:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80cfef:	74 13                	je     80d004 <strtok+0x88>
  80cff1:	8b 05 29 e5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e529]        # 42b520 <tokptr>
  80cff7:	48 98                	cdqe   
  80cff9:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d000:	84 c0                	test   al,al
  80d002:	75 bd                	jne    80cfc1 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80d004:	8b 05 16 e5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e516]        # 42b520 <tokptr>
  80d00a:	48 98                	cdqe   
  80d00c:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
        tokptr=(tokptr+1)%512;
  80d013:	8b 05 07 e5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e507]        # 42b520 <tokptr>
  80d019:	83 c0 01             	add    eax,0x1
  80d01c:	99                   	cdq    
  80d01d:	c1 ea 17             	shr    edx,0x17
  80d020:	01 d0                	add    eax,edx
  80d022:	25 ff 01 00 00       	and    eax,0x1ff
  80d027:	29 d0                	sub    eax,edx
  80d029:	89 05 f1 e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e4f1],eax        # 42b520 <tokptr>
        return ptr;
  80d02f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d033:	e9 9e 00 00 00       	jmp    80d0d6 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80d038:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80d03f:	8b 05 db e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e4db]        # 42b520 <tokptr>
  80d045:	48 98                	cdqe   
  80d047:	48 05 20 b3 42 00    	add    rax,0x42b320
  80d04d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80d051:	eb 20                	jmp    80d073 <strtok+0xf7>
  80d053:	8b 05 c7 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e4c7]        # 42b520 <tokptr>
  80d059:	83 c0 01             	add    eax,0x1
  80d05c:	99                   	cdq    
  80d05d:	c1 ea 17             	shr    edx,0x17
  80d060:	01 d0                	add    eax,edx
  80d062:	25 ff 01 00 00       	and    eax,0x1ff
  80d067:	29 d0                	sub    eax,edx
  80d069:	89 05 b1 e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e4b1],eax        # 42b520 <tokptr>
  80d06f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d073:	8b 05 a7 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e4a7]        # 42b520 <tokptr>
  80d079:	48 98                	cdqe   
  80d07b:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d082:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80d085:	74 13                	je     80d09a <strtok+0x11e>
  80d087:	8b 05 93 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e493]        # 42b520 <tokptr>
  80d08d:	48 98                	cdqe   
  80d08f:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d096:	84 c0                	test   al,al
  80d098:	75 b9                	jne    80d053 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80d09a:	8b 05 80 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e480]        # 42b520 <tokptr>
  80d0a0:	48 98                	cdqe   
  80d0a2:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
    tokptr=(tokptr+1)%512;
  80d0a9:	8b 05 71 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e471]        # 42b520 <tokptr>
  80d0af:	83 c0 01             	add    eax,0x1
  80d0b2:	99                   	cdq    
  80d0b3:	c1 ea 17             	shr    edx,0x17
  80d0b6:	01 d0                	add    eax,edx
  80d0b8:	25 ff 01 00 00       	and    eax,0x1ff
  80d0bd:	29 d0                	sub    eax,edx
  80d0bf:	89 05 5b e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e45b],eax        # 42b520 <tokptr>
    if(c)
  80d0c5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d0c9:	74 06                	je     80d0d1 <strtok+0x155>
        return ptr;
  80d0cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d0cf:	eb 05                	jmp    80d0d6 <strtok+0x15a>
    else
        return (void*)0;
  80d0d1:	b8 00 00 00 00       	mov    eax,0x0
}
  80d0d6:	c9                   	leave  
  80d0d7:	c3                   	ret    

000000000080d0d8 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80d0d8:	f3 0f 1e fa          	endbr64 
  80d0dc:	55                   	push   rbp
  80d0dd:	48 89 e5             	mov    rbp,rsp
  80d0e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d0e4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80d0e8:	eb 3c                	jmp    80d126 <strcmp+0x4e>
		if(*s1>*s2)
  80d0ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d0ee:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d0f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d0f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d0f8:	38 c2                	cmp    dl,al
  80d0fa:	7e 07                	jle    80d103 <strcmp+0x2b>
			return 1;
  80d0fc:	b8 01 00 00 00       	mov    eax,0x1
  80d101:	eb 52                	jmp    80d155 <strcmp+0x7d>
		else if(*s1<*s2)
  80d103:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d107:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d10a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d10e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d111:	38 c2                	cmp    dl,al
  80d113:	7d 07                	jge    80d11c <strcmp+0x44>
			return -1;
  80d115:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80d11a:	eb 39                	jmp    80d155 <strcmp+0x7d>
		s1++;
  80d11c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80d121:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80d126:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d12a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d12d:	84 c0                	test   al,al
  80d12f:	74 0b                	je     80d13c <strcmp+0x64>
  80d131:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d135:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d138:	84 c0                	test   al,al
  80d13a:	75 ae                	jne    80d0ea <strcmp+0x12>
	}
	if(*s1==*s2)
  80d13c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d140:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d143:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d147:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d14a:	38 c2                	cmp    dl,al
  80d14c:	75 07                	jne    80d155 <strcmp+0x7d>
		return 0;
  80d14e:	b8 00 00 00 00       	mov    eax,0x0
  80d153:	eb 00                	jmp    80d155 <strcmp+0x7d>
}
  80d155:	5d                   	pop    rbp
  80d156:	c3                   	ret    

000000000080d157 <strlen>:

int strlen(char *str)
{
  80d157:	f3 0f 1e fa          	endbr64 
  80d15b:	55                   	push   rbp
  80d15c:	48 89 e5             	mov    rbp,rsp
  80d15f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80d163:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80d16a:	eb 09                	jmp    80d175 <strlen+0x1e>
  80d16c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80d171:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d175:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d179:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d17c:	84 c0                	test   al,al
  80d17e:	75 ec                	jne    80d16c <strlen+0x15>
    return l;
  80d180:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80d183:	5d                   	pop    rbp
  80d184:	c3                   	ret    

000000000080d185 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80d185:	f3 0f 1e fa          	endbr64 
  80d189:	55                   	push   rbp
  80d18a:	48 89 e5             	mov    rbp,rsp
  80d18d:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80d194:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80d19b:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80d1a2:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80d1a9:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80d1b0:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80d1b7:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80d1be:	84 c0                	test   al,al
  80d1c0:	74 20                	je     80d1e2 <sprintf+0x5d>
  80d1c2:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80d1c6:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80d1ca:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80d1ce:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80d1d2:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80d1d6:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80d1da:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80d1de:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80d1e2:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d1e9:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80d1f0:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d1f7:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80d1fe:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80d205:	00 00 00 
    while (*pstr!='\n')
  80d208:	eb 39                	jmp    80d243 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80d20a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d211:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d214:	3c 25                	cmp    al,0x25
  80d216:	75 15                	jne    80d22d <sprintf+0xa8>
  80d218:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80d21f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d222:	3c 25                	cmp    al,0x25
  80d224:	74 07                	je     80d22d <sprintf+0xa8>
            argnum++;
  80d226:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80d22d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d234:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80d23b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d242:	01 
    while (*pstr!='\n')
  80d243:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d24a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d24d:	3c 0a                	cmp    al,0xa
  80d24f:	75 b9                	jne    80d20a <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80d251:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80d258:	00 00 00 
  80d25b:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80d262:	00 00 00 
  80d265:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80d269:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80d270:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80d277:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80d27e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d285:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80d28c:	e9 e2 01 00 00       	jmp    80d473 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80d291:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d298:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d29b:	3c 25                	cmp    al,0x25
  80d29d:	0f 85 aa 01 00 00    	jne    80d44d <sprintf+0x2c8>
  80d2a3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d2aa:	48 83 c0 01          	add    rax,0x1
  80d2ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d2b1:	84 c0                	test   al,al
  80d2b3:	0f 84 94 01 00 00    	je     80d44d <sprintf+0x2c8>
            pstr++;
  80d2b9:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d2c0:	01 
            if(*pstr=='x'){
  80d2c1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d2c8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d2cb:	3c 78                	cmp    al,0x78
  80d2cd:	75 64                	jne    80d333 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80d2cf:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d2d5:	83 f8 2f             	cmp    eax,0x2f
  80d2d8:	77 23                	ja     80d2fd <sprintf+0x178>
  80d2da:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d2e1:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d2e7:	89 d2                	mov    edx,edx
  80d2e9:	48 01 d0             	add    rax,rdx
  80d2ec:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d2f2:	83 c2 08             	add    edx,0x8
  80d2f5:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d2fb:	eb 12                	jmp    80d30f <sprintf+0x18a>
  80d2fd:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d304:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d308:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d30f:	8b 00                	mov    eax,DWORD PTR [rax]
  80d311:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80d317:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80d31d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d324:	89 d6                	mov    esi,edx
  80d326:	48 89 c7             	mov    rdi,rax
  80d329:	e8 4e 02 00 00       	call   80d57c <sprint_hex>
            if(*pstr=='x'){
  80d32e:	e9 38 01 00 00       	jmp    80d46b <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80d333:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d33a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d33d:	3c 73                	cmp    al,0x73
  80d33f:	75 68                	jne    80d3a9 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80d341:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d347:	83 f8 2f             	cmp    eax,0x2f
  80d34a:	77 23                	ja     80d36f <sprintf+0x1ea>
  80d34c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d353:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d359:	89 d2                	mov    edx,edx
  80d35b:	48 01 d0             	add    rax,rdx
  80d35e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d364:	83 c2 08             	add    edx,0x8
  80d367:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d36d:	eb 12                	jmp    80d381 <sprintf+0x1fc>
  80d36f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d376:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d37a:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d381:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d384:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80d38b:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80d392:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d399:	48 89 d6             	mov    rsi,rdx
  80d39c:	48 89 c7             	mov    rdi,rax
  80d39f:	e8 5a 02 00 00       	call   80d5fe <sprintn>
            if(*pstr=='x'){
  80d3a4:	e9 c2 00 00 00       	jmp    80d46b <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80d3a9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d3b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d3b3:	3c 64                	cmp    al,0x64
  80d3b5:	75 66                	jne    80d41d <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80d3b7:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d3bd:	83 f8 2f             	cmp    eax,0x2f
  80d3c0:	77 23                	ja     80d3e5 <sprintf+0x260>
  80d3c2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d3c9:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d3cf:	89 d2                	mov    edx,edx
  80d3d1:	48 01 d0             	add    rax,rdx
  80d3d4:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d3da:	83 c2 08             	add    edx,0x8
  80d3dd:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d3e3:	eb 12                	jmp    80d3f7 <sprintf+0x272>
  80d3e5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d3ec:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d3f0:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d3f7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d3fa:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80d401:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80d408:	89 c2                	mov    edx,eax
  80d40a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d411:	89 d6                	mov    esi,edx
  80d413:	48 89 c7             	mov    rdi,rax
  80d416:	e8 ad 00 00 00       	call   80d4c8 <sprint_decimal>
            if(*pstr=='x'){
  80d41b:	eb 4e                	jmp    80d46b <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80d41d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d424:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d427:	3c 63                	cmp    al,0x63
  80d429:	75 02                	jne    80d42d <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80d42b:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80d42d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d434:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d437:	0f be d0             	movsx  edx,al
  80d43a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d441:	89 d6                	mov    esi,edx
  80d443:	48 89 c7             	mov    rdi,rax
  80d446:	e8 3e 00 00 00       	call   80d489 <sprintchar>
            if(*pstr=='x'){
  80d44b:	eb 1e                	jmp    80d46b <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80d44d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d454:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d457:	0f be d0             	movsx  edx,al
  80d45a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d461:	89 d6                	mov    esi,edx
  80d463:	48 89 c7             	mov    rdi,rax
  80d466:	e8 1e 00 00 00       	call   80d489 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80d46b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d472:	01 
  80d473:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d47a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d47d:	84 c0                	test   al,al
  80d47f:	0f 85 0c fe ff ff    	jne    80d291 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80d485:	90                   	nop
  80d486:	90                   	nop
  80d487:	c9                   	leave  
  80d488:	c3                   	ret    

000000000080d489 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80d489:	f3 0f 1e fa          	endbr64 
  80d48d:	55                   	push   rbp
  80d48e:	48 89 e5             	mov    rbp,rsp
  80d491:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d495:	89 f0                	mov    eax,esi
  80d497:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80d49a:	eb 05                	jmp    80d4a1 <sprintchar+0x18>
        dist++;
  80d49c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80d4a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d4a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d4a8:	84 c0                	test   al,al
  80d4aa:	75 f0                	jne    80d49c <sprintchar+0x13>
    *dist++=c;
  80d4ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d4b0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d4b4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80d4b8:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80d4bc:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80d4be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d4c2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80d4c5:	90                   	nop
  80d4c6:	5d                   	pop    rbp
  80d4c7:	c3                   	ret    

000000000080d4c8 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80d4c8:	f3 0f 1e fa          	endbr64 
  80d4cc:	55                   	push   rbp
  80d4cd:	48 89 e5             	mov    rbp,rsp
  80d4d0:	48 83 ec 30          	sub    rsp,0x30
  80d4d4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80d4d8:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80d4db:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80d4e2:	eb 65                	jmp    80d549 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80d4e4:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80d4e7:	48 63 c2             	movsxd rax,edx
  80d4ea:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80d4f1:	48 c1 e8 20          	shr    rax,0x20
  80d4f5:	c1 f8 02             	sar    eax,0x2
  80d4f8:	89 d6                	mov    esi,edx
  80d4fa:	c1 fe 1f             	sar    esi,0x1f
  80d4fd:	29 f0                	sub    eax,esi
  80d4ff:	89 c1                	mov    ecx,eax
  80d501:	89 c8                	mov    eax,ecx
  80d503:	c1 e0 02             	shl    eax,0x2
  80d506:	01 c8                	add    eax,ecx
  80d508:	01 c0                	add    eax,eax
  80d50a:	89 d1                	mov    ecx,edx
  80d50c:	29 c1                	sub    ecx,eax
  80d50e:	89 c8                	mov    eax,ecx
  80d510:	83 c0 30             	add    eax,0x30
  80d513:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80d516:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d519:	8d 50 01             	lea    edx,[rax+0x1]
  80d51c:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d51f:	48 98                	cdqe   
  80d521:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d525:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80d529:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80d52c:	48 63 d0             	movsxd rdx,eax
  80d52f:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80d536:	48 c1 ea 20          	shr    rdx,0x20
  80d53a:	c1 fa 02             	sar    edx,0x2
  80d53d:	c1 f8 1f             	sar    eax,0x1f
  80d540:	89 c1                	mov    ecx,eax
  80d542:	89 d0                	mov    eax,edx
  80d544:	29 c8                	sub    eax,ecx
  80d546:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80d549:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d54c:	83 f8 0f             	cmp    eax,0xf
  80d54f:	76 93                	jbe    80d4e4 <sprint_decimal+0x1c>
    }
    while(p>0)
  80d551:	eb 1f                	jmp    80d572 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80d553:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d557:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d55a:	48 98                	cdqe   
  80d55c:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80d561:	0f be d0             	movsx  edx,al
  80d564:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d568:	89 d6                	mov    esi,edx
  80d56a:	48 89 c7             	mov    rdi,rax
  80d56d:	e8 17 ff ff ff       	call   80d489 <sprintchar>
    while(p>0)
  80d572:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d576:	7f db                	jg     80d553 <sprint_decimal+0x8b>
    }
}
  80d578:	90                   	nop
  80d579:	90                   	nop
  80d57a:	c9                   	leave  
  80d57b:	c3                   	ret    

000000000080d57c <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80d57c:	f3 0f 1e fa          	endbr64 
  80d580:	55                   	push   rbp
  80d581:	48 89 e5             	mov    rbp,rsp
  80d584:	48 83 ec 20          	sub    rsp,0x20
  80d588:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80d58c:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80d58f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80d596:	eb 35                	jmp    80d5cd <sprint_hex+0x51>
        unsigned char a=c%16;
  80d598:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d59b:	83 e0 0f             	and    eax,0xf
  80d59e:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80d5a1:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80d5a5:	76 06                	jbe    80d5ad <sprint_hex+0x31>
  80d5a7:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80d5ab:	eb 04                	jmp    80d5b1 <sprint_hex+0x35>
        else a+='0';
  80d5ad:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80d5b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d5b4:	8d 50 01             	lea    edx,[rax+0x1]
  80d5b7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d5ba:	48 98                	cdqe   
  80d5bc:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d5c0:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80d5c4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d5c7:	c1 e8 04             	shr    eax,0x4
  80d5ca:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80d5cd:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80d5d1:	7e c5                	jle    80d598 <sprint_hex+0x1c>
    }
    while(p>0)
  80d5d3:	eb 1f                	jmp    80d5f4 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80d5d5:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d5d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d5dc:	48 98                	cdqe   
  80d5de:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80d5e3:	0f be d0             	movsx  edx,al
  80d5e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d5ea:	89 d6                	mov    esi,edx
  80d5ec:	48 89 c7             	mov    rdi,rax
  80d5ef:	e8 95 fe ff ff       	call   80d489 <sprintchar>
    while(p>0)
  80d5f4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d5f8:	7f db                	jg     80d5d5 <sprint_hex+0x59>
    }
}
  80d5fa:	90                   	nop
  80d5fb:	90                   	nop
  80d5fc:	c9                   	leave  
  80d5fd:	c3                   	ret    

000000000080d5fe <sprintn>:
void sprintn(char *dist,char *str)
{
  80d5fe:	f3 0f 1e fa          	endbr64 
  80d602:	55                   	push   rbp
  80d603:	48 89 e5             	mov    rbp,rsp
  80d606:	48 83 ec 10          	sub    rsp,0x10
  80d60a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d60e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80d612:	eb 20                	jmp    80d634 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80d614:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d618:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d61c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80d620:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d623:	0f be d0             	movsx  edx,al
  80d626:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d62a:	89 d6                	mov    esi,edx
  80d62c:	48 89 c7             	mov    rdi,rax
  80d62f:	e8 55 fe ff ff       	call   80d489 <sprintchar>
    while(*str!='\0')
  80d634:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d638:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d63b:	84 c0                	test   al,al
  80d63d:	75 d5                	jne    80d614 <sprintn+0x16>
    }
  80d63f:	90                   	nop
  80d640:	90                   	nop
  80d641:	c9                   	leave  
  80d642:	c3                   	ret    
  80d643:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80d64a:	00 00 00 
  80d64d:	0f 1f 00             	nop    DWORD PTR [rax]

000000000080d650 <create_zero>:
  80d650:	e8 dd 6b ff ff       	call   804232 <req_proc>
  80d655:	83 f8 ff             	cmp    eax,0xffffffff
  80d658:	74 0c                	je     80d666 <create_zero.retu>
  80d65a:	e8 9e 6c ff ff       	call   8042fd <set_proc>
  80d65f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80d663:	83 c4 40             	add    esp,0x40

000000000080d666 <create_zero.retu>:
  80d666:	c3                   	ret    

000000000080d667 <fill_desc>:
  80d667:	55                   	push   rbp
  80d668:	48 89 e5             	mov    rbp,rsp
  80d66b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80d66f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80d673:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80d677:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80d67b:	be ba d7 80 00       	mov    esi,0x80d7ba
  80d680:	c7 04 25 ba d7 80 00 	mov    DWORD PTR ds:0x80d7ba,0x0
  80d687:	00 00 00 00 
  80d68b:	c7 04 25 be d7 80 00 	mov    DWORD PTR ds:0x80d7be,0x0
  80d692:	00 00 00 00 
  80d696:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80d69a:	c1 e9 10             	shr    ecx,0x10
  80d69d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80d6a2:	c1 ea 10             	shr    edx,0x10
  80d6a5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80d6a9:	66 c1 ea 08          	shr    dx,0x8
  80d6ad:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80d6b1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80d6b6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80d6ba:	c1 e1 08             	shl    ecx,0x8
  80d6bd:	09 cf                	or     edi,ecx
  80d6bf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80d6c3:	8b 14 25 ba d7 80 00 	mov    edx,DWORD PTR ds:0x80d7ba
  80d6ca:	67 89 10             	mov    DWORD PTR [eax],edx
  80d6cd:	8b 14 25 be d7 80 00 	mov    edx,DWORD PTR ds:0x80d7be
  80d6d4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80d6d8:	c9                   	leave  
  80d6d9:	c3                   	ret    

000000000080d6da <switch_proc_asm>:
  80d6da:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80d6e0:	66 89 04 25 f8 d6 80 	mov    WORD PTR ds:0x80d6f8,ax
  80d6e7:	00 
  80d6e8:	c7 04 25 f4 d6 80 00 	mov    DWORD PTR ds:0x80d6f4,0x0
  80d6ef:	00 00 00 00 

000000000080d6f3 <switch_proc_asm.ljmp>:
  80d6f3:	ea                   	(bad)  
  80d6f4:	00 00                	add    BYTE PTR [rax],al
  80d6f6:	00 00                	add    BYTE PTR [rax],al
  80d6f8:	00 00                	add    BYTE PTR [rax],al
  80d6fa:	c3                   	ret    

000000000080d6fb <switch_to_old>:
  80d6fb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80d700:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80d704:	bf 6c d7 80 00       	mov    edi,0x80d76c
  80d709:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80d70d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80d711:	89 c1                	mov    ecx,eax
  80d713:	83 e9 04             	sub    ecx,0x4
  80d716:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80d719:	50                   	push   rax
  80d71a:	89 f5                	mov    ebp,esi
  80d71c:	83 c5 28             	add    ebp,0x28
  80d71f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d723:	50                   	push   rax
  80d724:	83 c5 04             	add    ebp,0x4
  80d727:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d72b:	50                   	push   rax
  80d72c:	83 c5 04             	add    ebp,0x4
  80d72f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d733:	50                   	push   rax
  80d734:	83 c5 04             	add    ebp,0x4
  80d737:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d73b:	50                   	push   rax
  80d73c:	83 c5 04             	add    ebp,0x4
  80d73f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d743:	50                   	push   rax
  80d744:	83 c5 04             	add    ebp,0x4
  80d747:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d74b:	50                   	push   rax
  80d74c:	83 c5 04             	add    ebp,0x4
  80d74f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d753:	50                   	push   rax
  80d754:	83 c5 04             	add    ebp,0x4
  80d757:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d75b:	50                   	push   rax
  80d75c:	83 c5 04             	add    ebp,0x4
  80d75f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80d763:	0f 22 d8             	mov    cr3,rax
  80d766:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80d76a:	50                   	push   rax
  80d76b:	5c                   	pop    rsp

000000000080d76c <switch_to_old.leap>:
  80d76c:	ea                   	(bad)  
  80d76d:	00 00                	add    BYTE PTR [rax],al
  80d76f:	00 00                	add    BYTE PTR [rax],al
  80d771:	08 00                	or     BYTE PTR [rax],al

000000000080d773 <save_context>:
  80d773:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80d778:	83 c0 44             	add    eax,0x44
  80d77b:	b9 08 00 00 00       	mov    ecx,0x8
  80d780:	89 e7                	mov    edi,esp

000000000080d782 <save_context.loops>:
  80d782:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80d785:	67 89 10             	mov    DWORD PTR [eax],edx
  80d788:	83 c7 04             	add    edi,0x4
  80d78b:	83 e8 04             	sub    eax,0x4
  80d78e:	e2 f2                	loop   80d782 <save_context.loops>
  80d790:	5b                   	pop    rbx
  80d791:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80d796:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80d79a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80d79f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80d7a3:	c3                   	ret    

000000000080d7a4 <move_to_user_mode>:
  80d7a4:	66 b8 20 00          	mov    ax,0x20
  80d7a8:	8e d8                	mov    ds,eax
  80d7aa:	8e c0                	mov    es,eax
  80d7ac:	8e e8                	mov    gs,eax
  80d7ae:	6a 20                	push   0x20
  80d7b0:	54                   	push   rsp
  80d7b1:	6a 18                	push   0x18
  80d7b3:	68 b9 d7 80 00       	push   0x80d7b9
  80d7b8:	cf                   	iret   

000000000080d7b9 <move_to_user_mode.done>:
  80d7b9:	c3                   	ret    

000000000080d7ba <desc>:
	...

000000000080d7c2 <ret_sys_call>:
  80d7c2:	58                   	pop    rax
  80d7c3:	8e d8                	mov    ds,eax
  80d7c5:	58                   	pop    rax
  80d7c6:	8e c0                	mov    es,eax
  80d7c8:	41 5f                	pop    r15
  80d7ca:	41 5e                	pop    r14
  80d7cc:	41 5d                	pop    r13
  80d7ce:	41 5c                	pop    r12
  80d7d0:	41 5b                	pop    r11
  80d7d2:	41 5a                	pop    r10
  80d7d4:	41 59                	pop    r9
  80d7d6:	41 58                	pop    r8
  80d7d8:	5e                   	pop    rsi
  80d7d9:	5f                   	pop    rdi
  80d7da:	5a                   	pop    rdx
  80d7db:	59                   	pop    rcx
  80d7dc:	5b                   	pop    rbx
  80d7dd:	58                   	pop    rax

000000000080d7de <tmp>:
  80d7de:	48 0f 07             	sysretq 

000000000080d7e1 <ret_normal_proc>:
  80d7e1:	58                   	pop    rax
  80d7e2:	8e d8                	mov    ds,eax
  80d7e4:	58                   	pop    rax
  80d7e5:	8e c0                	mov    es,eax
  80d7e7:	41 5f                	pop    r15
  80d7e9:	41 5e                	pop    r14
  80d7eb:	41 5d                	pop    r13
  80d7ed:	41 5c                	pop    r12
  80d7ef:	41 5b                	pop    r11
  80d7f1:	41 5a                	pop    r10
  80d7f3:	41 59                	pop    r9
  80d7f5:	41 58                	pop    r8
  80d7f7:	5e                   	pop    rsi
  80d7f8:	5f                   	pop    rdi
  80d7f9:	5a                   	pop    rdx
  80d7fa:	59                   	pop    rcx
  80d7fb:	5b                   	pop    rbx
  80d7fc:	58                   	pop    rax
  80d7fd:	c3                   	ret    
