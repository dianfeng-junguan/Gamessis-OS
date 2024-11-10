
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
  1000a5:	b8 10 92 80 00       	mov    eax,0x809210
  1000aa:	ea                   	(bad)  
  1000ab:	10 92 80 00 08 00    	adc    BYTE PTR [rdx+0x80080],dl

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
  800194:	b8 53 13 80 00       	mov    eax,0x801353
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
  800217:	b8 8e 93 80 00       	mov    eax,0x80938e
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 07 01 00 00       	call   80033a <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 c0 6a 80 00       	mov    eax,0x806ac0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 eb 00 00 00       	call   80033a <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 c0 a3 80 00       	mov    eax,0x80a3c0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 cf 00 00 00       	call   80033a <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 e0 75 80 00       	mov    eax,0x8075e0
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
  800291:	e8 9a 65 00 00       	call   806830 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 8b 65 00 00       	call   806830 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 7c 65 00 00       	call   806830 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 6d 65 00 00       	call   806830 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 5e 65 00 00       	call   806830 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 4f 65 00 00       	call   806830 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 40 65 00 00       	call   806830 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 31 65 00 00       	call   806830 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 61 65 00 00       	call   80686a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall+KNL_BASE);
  800309:	48 b8 e0 75 80 00 00 	movabs rax,0xffff8000008075e0
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
  800355:	48 8b 15 e4 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd5e4]        # 80d940 <idt>
  80035c:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800360:	48 c1 e0 04          	shl    rax,0x4
  800364:	48 01 d0             	add    rax,rdx
  800367:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80036b:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  80036e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800372:	48 c1 e8 10          	shr    rax,0x10
  800376:	48 89 c2             	mov    rdx,rax
  800379:	48 8b 0d c0 d5 00 00 	mov    rcx,QWORD PTR [rip+0xd5c0]        # 80d940 <idt>
  800380:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800384:	48 c1 e0 04          	shl    rax,0x4
  800388:	48 01 c8             	add    rax,rcx
  80038b:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800393:	48 c1 e8 20          	shr    rax,0x20
  800397:	89 c1                	mov    ecx,eax
  800399:	48 8b 15 a0 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd5a0]        # 80d940 <idt>
  8003a0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a4:	48 c1 e0 04          	shl    rax,0x4
  8003a8:	48 01 c2             	add    rdx,rax
  8003ab:	0f b7 c1             	movzx  eax,cx
  8003ae:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003b1:	48 8b 15 88 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd588]        # 80d940 <idt>
  8003b8:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003bc:	48 c1 e0 04          	shl    rax,0x4
  8003c0:	48 01 d0             	add    rax,rdx
  8003c3:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c7:	83 ca 01             	or     edx,0x1
  8003ca:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003ce:	48 8b 15 6b d5 00 00 	mov    rdx,QWORD PTR [rip+0xd56b]        # 80d940 <idt>
  8003d5:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d9:	48 c1 e0 04          	shl    rax,0x4
  8003dd:	48 01 c2             	add    rdx,rax
  8003e0:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003e4:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e8:	48 8b 15 51 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd551]        # 80d940 <idt>
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
  800412:	e8 47 64 00 00       	call   80685e <eoi>
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
  80042c:	e8 2d 64 00 00       	call   80685e <eoi>
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
  800446:	e8 13 64 00 00       	call   80685e <eoi>
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
  800460:	e8 f9 63 00 00       	call   80685e <eoi>
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
  80047a:	e8 df 63 00 00       	call   80685e <eoi>
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
  800494:	e8 c5 63 00 00       	call   80685e <eoi>
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
  8004ad:	e8 ac 63 00 00       	call   80685e <eoi>
    report_back_trace_of_err();
  8004b2:	b8 00 00 00 00       	mov    eax,0x0
  8004b7:	e8 cd 63 00 00       	call   806889 <report_back_trace_of_err>
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
  8004d2:	e8 87 63 00 00       	call   80685e <eoi>
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
  8004ec:	e8 6d 63 00 00       	call   80685e <eoi>
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
  800505:	e8 54 63 00 00       	call   80685e <eoi>
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
  80051e:	e8 3b 63 00 00       	call   80685e <eoi>
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
  800538:	e8 21 63 00 00       	call   80685e <eoi>
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
  800552:	e8 07 63 00 00       	call   80685e <eoi>
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
  800576:	e8 e3 62 00 00       	call   80685e <eoi>
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
  800593:	e8 c6 62 00 00       	call   80685e <eoi>
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
  8005d6:	48 05 c0 51 81 00    	add    rax,0x8151c0
  8005dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005df:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005e2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e5:	48 98                	cdqe   
  8005e7:	48 89 c7             	mov    rdi,rax
  8005ea:	e8 74 2a 00 00       	call   803063 <reg_device>
  8005ef:	e9 53 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 1:return dispose_device(a);
  8005f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f7:	89 c7                	mov    edi,eax
  8005f9:	e8 c4 34 00 00       	call   803ac2 <dispose_device>
  8005fe:	e9 44 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 2:return reg_driver(a);
  800603:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800606:	48 98                	cdqe   
  800608:	48 89 c7             	mov    rdi,rax
  80060b:	e8 3b 2d 00 00       	call   80334b <reg_driver>
  800610:	e9 32 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 3:return dispose_driver(a);
  800615:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800618:	48 98                	cdqe   
  80061a:	48 89 c7             	mov    rdi,rax
  80061d:	e8 3e 35 00 00       	call   803b60 <dispose_driver>
  800622:	e9 20 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 4:return call_drv_func(a,b,c);
  800627:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80062a:	48 98                	cdqe   
  80062c:	48 89 c2             	mov    rdx,rax
  80062f:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800632:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800635:	89 ce                	mov    esi,ecx
  800637:	89 c7                	mov    edi,eax
  800639:	e8 2d 32 00 00       	call   80386b <call_drv_func>
  80063e:	e9 04 02 00 00       	jmp    800847 <syscall+0x2a8>
        case 5:return req_page_at(a,b);
  800643:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800646:	48 98                	cdqe   
  800648:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80064b:	89 d6                	mov    esi,edx
  80064d:	48 89 c7             	mov    rdi,rax
  800650:	e8 db 12 00 00       	call   801930 <req_page_at>
  800655:	e9 ed 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 6:return free_page(a);
  80065a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80065d:	48 98                	cdqe   
  80065f:	48 89 c7             	mov    rdi,rax
  800662:	e8 95 10 00 00       	call   8016fc <free_page>
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
  800687:	e8 46 47 00 00       	call   804dd2 <reg_proc>
  80068c:	e9 b6 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 8:del_proc(a);
  800691:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800694:	89 c7                	mov    edi,eax
  800696:	e8 53 45 00 00       	call   804bee <del_proc>
        case 10:chk_vm(a,b);
  80069b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80069e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a1:	89 d6                	mov    esi,edx
  8006a3:	89 c7                	mov    edi,eax
  8006a5:	e8 5f 13 00 00       	call   801a09 <chk_vm>
        case 11:return sys_open(a,b);
  8006aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006ad:	48 98                	cdqe   
  8006af:	48 89 c2             	mov    rdx,rax
  8006b2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b5:	89 c6                	mov    esi,eax
  8006b7:	48 89 d7             	mov    rdi,rdx
  8006ba:	e8 64 7e 00 00       	call   808523 <sys_open>
  8006bf:	e9 83 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 12:return sys_close(a);
  8006c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c7:	89 c7                	mov    edi,eax
  8006c9:	e8 ec 83 00 00       	call   808aba <sys_close>
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
  8006e9:	e8 84 84 00 00       	call   808b72 <sys_read>
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
  800709:	e8 14 85 00 00       	call   808c22 <sys_write>
  80070e:	e9 34 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 15:return sys_lseek(a,b,c);
  800713:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800716:	48 63 c8             	movsxd rcx,eax
  800719:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80071c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071f:	48 89 ce             	mov    rsi,rcx
  800722:	89 c7                	mov    edi,eax
  800724:	e8 a9 85 00 00       	call   808cd2 <sys_lseek>
  800729:	e9 19 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 16:return sys_tell(a);
  80072e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800731:	89 c7                	mov    edi,eax
  800733:	e8 b5 16 00 00       	call   801ded <sys_tell>
  800738:	e9 0a 01 00 00       	jmp    800847 <syscall+0x2a8>
        case 17:return reg_vol(a,b,c);
  80073d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800740:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800743:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800746:	89 ce                	mov    esi,ecx
  800748:	89 c7                	mov    edi,eax
  80074a:	b8 00 00 00 00       	mov    eax,0x0
  80074f:	e8 8e 15 00 00       	call   801ce2 <reg_vol>
  800754:	e9 ee 00 00 00       	jmp    800847 <syscall+0x2a8>
        case 18:return free_vol(a);
  800759:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80075c:	89 c7                	mov    edi,eax
  80075e:	b8 00 00 00 00       	mov    eax,0x0
  800763:	e8 5e 15 00 00       	call   801cc6 <free_vol>
  800768:	e9 da 00 00 00       	jmp    800847 <syscall+0x2a8>
        case 19:return execute(a, NULL);
  80076d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800770:	48 98                	cdqe   
  800772:	be 00 00 00 00       	mov    esi,0x0
  800777:	48 89 c7             	mov    rdi,rax
  80077a:	e8 95 63 00 00       	call   806b14 <execute>
  80077f:	e9 c3 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_EXIT:return sys_exit(a);
  800784:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800787:	89 c7                	mov    edi,eax
  800789:	e8 0f 46 00 00       	call   804d9d <sys_exit>
  80078e:	e9 b4 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_CALL:return exec_call(a);
  800793:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800796:	48 98                	cdqe   
  800798:	48 89 c7             	mov    rdi,rax
  80079b:	e8 6b 65 00 00       	call   806d0b <exec_call>
  8007a0:	e9 a2 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a8:	89 c7                	mov    edi,eax
  8007aa:	e8 b8 13 00 00       	call   801b67 <sys_mkfifo>
  8007af:	e9 93 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007b4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b7:	89 c7                	mov    edi,eax
  8007b9:	e8 dc 47 00 00       	call   804f9a <sys_malloc>
  8007be:	e9 84 00 00 00       	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FREE:return sys_free(a);
  8007c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007c6:	89 c7                	mov    edi,eax
  8007c8:	e8 5b 49 00 00       	call   805128 <sys_free>
  8007cd:	eb 78                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007cf:	b8 00 00 00 00       	mov    eax,0x0
  8007d4:	e8 09 8d 00 00       	call   8094e2 <sys_analyse_key>
  8007d9:	0f be c0             	movsx  eax,al
  8007dc:	eb 69                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007e1:	48 98                	cdqe   
  8007e3:	48 89 c7             	mov    rdi,rax
  8007e6:	e8 b0 2c 00 00       	call   80349b <sys_find_dev>
  8007eb:	eb 5a                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_FORK:return sys_fork();
  8007ed:	e8 43 4c 00 00       	call   805435 <sys_fork>
  8007f2:	eb 53                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007f7:	48 98                	cdqe   
  8007f9:	48 89 c2             	mov    rdx,rax
  8007fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007ff:	48 98                	cdqe   
  800801:	48 89 d6             	mov    rsi,rdx
  800804:	48 89 c7             	mov    rdi,rax
  800807:	e8 0a 64 00 00       	call   806c16 <sys_execve>
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
  800826:	e8 02 2d 00 00       	call   80352d <sys_operate_dev>
  80082b:	eb 1a                	jmp    800847 <syscall+0x2a8>
        case SYSCALL_WAIT:return sys_wait(a,b,c);
  80082d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800830:	48 98                	cdqe   
  800832:	48 89 c1             	mov    rcx,rax
  800835:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800838:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80083b:	48 89 ce             	mov    rsi,rcx
  80083e:	89 c7                	mov    edi,eax
  800840:	e8 78 85 00 00       	call   808dbd <sys_wait>
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
  8008cc:	48 8b 04 c5 30 55 81 	mov    rax,QWORD PTR [rax*8+0x815530]
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
  8008e0:	e8 c5 08 00 00       	call   8011aa <set_high_mem_base>
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
  800916:	e8 a6 08 00 00       	call   8011c1 <set_mem_area>
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
  800976:	e8 99 6e 00 00       	call   807814 <set_framebuffer>
  80097b:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80097f:	b8 00 00 00 00       	mov    eax,0x0
  800984:	e8 cf 6c 00 00       	call   807658 <init_framebuffer>
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
  800b4d:	e8 d9 6b 00 00       	call   80772b <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b52:	bf e8 54 81 00       	mov    edi,0x8154e8
  800b57:	e8 a5 70 00 00       	call   807c01 <print>
    init_int();
  800b5c:	b8 00 00 00 00       	mov    eax,0x0
  800b61:	e8 9a f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b66:	bf 05 55 81 00       	mov    edi,0x815505
  800b6b:	e8 91 70 00 00       	call   807c01 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b70:	b8 00 00 00 00       	mov    eax,0x0
  800b75:	e8 3b 09 00 00       	call   8014b5 <init_memory>
    init_com(PORT_COM1);
  800b7a:	bf f8 03 00 00       	mov    edi,0x3f8
  800b7f:	e8 30 c2 00 00       	call   80cdb4 <init_com>
    comprintf("\rgamessis os loaded.\r\n");
  800b84:	bf 12 55 81 00       	mov    edi,0x815512
  800b89:	b8 00 00 00 00       	mov    eax,0x0
  800b8e:	e8 64 c3 00 00       	call   80cef7 <comprintf>
	init_paging();
  800b93:	b8 00 00 00 00       	mov    eax,0x0
  800b98:	e8 02 06 00 00       	call   80119f <init_paging>
 	init_gdt();
  800b9d:	b8 00 00 00 00       	mov    eax,0x0
  800ba2:	e8 06 5d 00 00       	call   8068ad <init_gdt>
    mount_rootfs();
  800ba7:	b8 00 00 00 00       	mov    eax,0x0
  800bac:	e8 e6 77 00 00       	call   808397 <mount_rootfs>
    init_devman();
  800bb1:	b8 00 00 00 00       	mov    eax,0x0
  800bb6:	e8 81 1d 00 00       	call   80293c <init_devman>
    init_proc();
  800bbb:	b8 00 00 00 00       	mov    eax,0x0
  800bc0:	e8 6f 33 00 00       	call   803f34 <init_proc>
    sti();
  800bc5:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800bc6:	b8 00 00 00 00       	mov    eax,0x0
  800bcb:	e8 aa bb 00 00       	call   80c77a <DISK1_FAT32_FS_init>

    //自带驱动
    //init_tty();
    init_kb();
  800bd0:	b8 00 00 00 00       	mov    eax,0x0
  800bd5:	e8 95 87 00 00       	call   80936f <init_kb>
//    init_disk();


    manage_proc_lock=0;
  800bda:	c7 05 64 cd 00 00 00 	mov    DWORD PTR [rip+0xcd64],0x0        # 80d948 <manage_proc_lock>
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
  800bf9:	e8 74 7f 00 00       	call   808b72 <sys_read>
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
  800d70:	e8 8c 6e 00 00       	call   807c01 <print>
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
  800dde:	e8 a4 c4 00 00       	call   80d287 <strlen>
  800de3:	3d ff 03 00 00       	cmp    eax,0x3ff
  800de8:	0f 8f 97 00 00 00    	jg     800e85 <printf+0x10e>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  800dee:	b8 00 00 00 00       	mov    eax,0x0
  800df3:	e8 55 04 00 00       	call   80124d <vmalloc>
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
  800e4c:	e8 64 c4 00 00       	call   80d2b5 <sprintf>
    va_end(vargs);
    print(tmp);
  800e51:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e58:	48 89 c7             	mov    rdi,rax
  800e5b:	e8 a1 6d 00 00       	call   807c01 <print>
    comprintf(tmp);
  800e60:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e67:	48 89 c7             	mov    rdi,rax
  800e6a:	b8 00 00 00 00       	mov    eax,0x0
  800e6f:	e8 83 c0 00 00       	call   80cef7 <comprintf>
    vmfree(tmp);
  800e74:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e7b:	48 89 c7             	mov    rdi,rax
  800e7e:	e8 6a 04 00 00       	call   8012ed <vmfree>
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
  800e90:	48 83 ec 40          	sub    rsp,0x40
  800e94:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e98:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e9c:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e9f:	48 8b 15 ba ca 00 00 	mov    rdx,QWORD PTR [rip+0xcaba]        # 80d960 <pml4>
  800ea6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800eaa:	48 c1 e8 27          	shr    rax,0x27
  800eae:	48 c1 e0 03          	shl    rax,0x3
  800eb2:	48 01 d0             	add    rax,rdx
  800eb5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eb8:	b0 00                	mov    al,0x0
  800eba:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800ebe:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800ec5:	00 00 00 
  800ec8:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ecc:	48 c1 e8 1e          	shr    rax,0x1e
  800ed0:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ed3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ed6:	48 98                	cdqe   
  800ed8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800edf:	00 
  800ee0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ee4:	48 01 d0             	add    rax,rdx
  800ee7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800eee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ef2:	83 e0 01             	and    eax,0x1
  800ef5:	48 85 c0             	test   rax,rax
  800ef8:	75 45                	jne    800f3f <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800efa:	b8 00 00 00 00       	mov    eax,0x0
  800eff:	e8 49 03 00 00       	call   80124d <vmalloc>
  800f04:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f0c:	ba 00 10 00 00       	mov    edx,0x1000
  800f11:	be 00 00 00 00       	mov    esi,0x0
  800f16:	48 89 c7             	mov    rdi,rax
  800f19:	e8 fb c0 00 00       	call   80d019 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f1e:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f21:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f25:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f28:	48 98                	cdqe   
  800f2a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f31:	00 
  800f32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f36:	48 01 f0             	add    rax,rsi
  800f39:	48 09 ca             	or     rdx,rcx
  800f3c:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f43:	b0 00                	mov    al,0x0
  800f45:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f49:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f4d:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f52:	48 c1 e8 15          	shr    rax,0x15
  800f56:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f5d:	00 
  800f5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f62:	48 01 d0             	add    rax,rdx
  800f65:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f68:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f6c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f70:	83 e0 01             	and    eax,0x1
  800f73:	48 85 c0             	test   rax,rax
  800f76:	75 4d                	jne    800fc5 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f78:	b8 00 00 00 00       	mov    eax,0x0
  800f7d:	e8 cb 02 00 00       	call   80124d <vmalloc>
  800f82:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800f86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f8a:	ba 00 10 00 00       	mov    edx,0x1000
  800f8f:	be 00 00 00 00       	mov    esi,0x0
  800f94:	48 89 c7             	mov    rdi,rax
  800f97:	e8 7d c0 00 00       	call   80d019 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f9c:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f9f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fa3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fa7:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fac:	48 c1 e8 15          	shr    rax,0x15
  800fb0:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fb7:	00 
  800fb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fbc:	48 01 f0             	add    rax,rsi
  800fbf:	48 09 ca             	or     rdx,rcx
  800fc2:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fc9:	b0 00                	mov    al,0x0
  800fcb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800fcf:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fd2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800fd6:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800fdc:	48 c1 ea 0c          	shr    rdx,0xc
  800fe0:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fe7:	00 
  800fe8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fec:	48 01 ca             	add    rdx,rcx
  800fef:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800ff3:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800ff6:	b8 00 00 00 00       	mov    eax,0x0
}
  800ffb:	c9                   	leave  
  800ffc:	c3                   	ret    

0000000000800ffd <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  800ffd:	f3 0f 1e fa          	endbr64 
  801001:	55                   	push   rbp
  801002:	48 89 e5             	mov    rbp,rsp
  801005:	48 83 ec 40          	sub    rsp,0x40
  801009:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80100d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801011:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  801014:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  801018:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80101c:	48 c1 e8 27          	shr    rax,0x27
  801020:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801027:	00 
  801028:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80102c:	48 01 d0             	add    rax,rdx
  80102f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801032:	b0 00                	mov    al,0x0
  801034:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  801038:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  80103f:	00 00 00 
  801042:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  801046:	48 c1 e8 1e          	shr    rax,0x1e
  80104a:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  80104d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801050:	48 98                	cdqe   
  801052:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801059:	00 
  80105a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80105e:	48 01 d0             	add    rax,rdx
  801061:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801064:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  801068:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80106c:	83 e0 01             	and    eax,0x1
  80106f:	48 85 c0             	test   rax,rax
  801072:	75 45                	jne    8010b9 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  801074:	b8 00 00 00 00       	mov    eax,0x0
  801079:	e8 cf 01 00 00       	call   80124d <vmalloc>
  80107e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  801082:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801086:	ba 00 10 00 00       	mov    edx,0x1000
  80108b:	be 00 00 00 00       	mov    esi,0x0
  801090:	48 89 c7             	mov    rdi,rax
  801093:	e8 81 bf 00 00       	call   80d019 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  801098:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80109b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80109f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8010a2:	48 98                	cdqe   
  8010a4:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8010ab:	00 
  8010ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010b0:	48 01 f0             	add    rax,rsi
  8010b3:	48 09 ca             	or     rdx,rcx
  8010b6:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  8010b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010bd:	b0 00                	mov    al,0x0
  8010bf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  8010c3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8010c7:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8010cc:	48 c1 e8 15          	shr    rax,0x15
  8010d0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010d7:	00 
  8010d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010dc:	48 01 d0             	add    rax,rdx
  8010df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010e2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  8010e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010ea:	83 e0 01             	and    eax,0x1
  8010ed:	48 85 c0             	test   rax,rax
  8010f0:	75 4d                	jne    80113f <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  8010f2:	b8 00 00 00 00       	mov    eax,0x0
  8010f7:	e8 51 01 00 00       	call   80124d <vmalloc>
  8010fc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  801100:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801104:	ba 00 10 00 00       	mov    edx,0x1000
  801109:	be 00 00 00 00       	mov    esi,0x0
  80110e:	48 89 c7             	mov    rdi,rax
  801111:	e8 03 bf 00 00       	call   80d019 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801116:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801119:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80111d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801121:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801126:	48 c1 e8 15          	shr    rax,0x15
  80112a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801131:	00 
  801132:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801136:	48 01 f0             	add    rax,rsi
  801139:	48 09 ca             	or     rdx,rcx
  80113c:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  80113f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801143:	b0 00                	mov    al,0x0
  801145:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  801149:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80114c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801150:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801156:	48 c1 ea 0c          	shr    rdx,0xc
  80115a:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801161:	00 
  801162:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801166:	48 01 ca             	add    rdx,rcx
  801169:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80116d:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801170:	b8 00 00 00 00       	mov    eax,0x0
}
  801175:	c9                   	leave  
  801176:	c3                   	ret    

0000000000801177 <mdemap>:

stat_t mdemap(addr_t la)
{
  801177:	f3 0f 1e fa          	endbr64 
  80117b:	55                   	push   rbp
  80117c:	48 89 e5             	mov    rbp,rsp
  80117f:	48 83 ec 10          	sub    rsp,0x10
  801183:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801187:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80118b:	ba 00 00 00 00       	mov    edx,0x0
  801190:	48 89 c6             	mov    rsi,rax
  801193:	bf 00 00 00 00       	mov    edi,0x0
  801198:	e8 eb fc ff ff       	call   800e88 <mmap>
}
  80119d:	c9                   	leave  
  80119e:	c3                   	ret    

000000000080119f <init_paging>:
int init_paging()
{
  80119f:	f3 0f 1e fa          	endbr64 
  8011a3:	55                   	push   rbp
  8011a4:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  8011a7:	90                   	nop
  8011a8:	5d                   	pop    rbp
  8011a9:	c3                   	ret    

00000000008011aa <set_high_mem_base>:
void set_high_mem_base(int base)
{
  8011aa:	f3 0f 1e fa          	endbr64 
  8011ae:	55                   	push   rbp
  8011af:	48 89 e5             	mov    rbp,rsp
  8011b2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  8011b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011b8:	89 05 ba c7 00 00    	mov    DWORD PTR [rip+0xc7ba],eax        # 80d978 <high_mem_base>
}
  8011be:	90                   	nop
  8011bf:	5d                   	pop    rbp
  8011c0:	c3                   	ret    

00000000008011c1 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  8011c1:	f3 0f 1e fa          	endbr64 
  8011c5:	55                   	push   rbp
  8011c6:	48 89 e5             	mov    rbp,rsp
  8011c9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8011cd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8011d1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8011d5:	8b 05 45 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff045]        # 400220 <mmap_t_i>
  8011db:	48 63 d0             	movsxd rdx,eax
  8011de:	48 89 d0             	mov    rax,rdx
  8011e1:	48 01 c0             	add    rax,rax
  8011e4:	48 01 d0             	add    rax,rdx
  8011e7:	48 c1 e0 03          	shl    rax,0x3
  8011eb:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8011f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011f6:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8011f9:	8b 05 21 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff021]        # 400220 <mmap_t_i>
  8011ff:	48 63 d0             	movsxd rdx,eax
  801202:	48 89 d0             	mov    rax,rdx
  801205:	48 01 c0             	add    rax,rax
  801208:	48 01 d0             	add    rax,rdx
  80120b:	48 c1 e0 03          	shl    rax,0x3
  80120f:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801216:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80121a:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80121d:	8b 05 fd ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeffd]        # 400220 <mmap_t_i>
  801223:	8d 50 01             	lea    edx,[rax+0x1]
  801226:	89 15 f4 ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfeff4],edx        # 400220 <mmap_t_i>
  80122c:	48 63 d0             	movsxd rdx,eax
  80122f:	48 89 d0             	mov    rax,rdx
  801232:	48 01 c0             	add    rax,rax
  801235:	48 01 d0             	add    rax,rdx
  801238:	48 c1 e0 03          	shl    rax,0x3
  80123c:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801243:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801247:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80124a:	90                   	nop
  80124b:	5d                   	pop    rbp
  80124c:	c3                   	ret    

000000000080124d <vmalloc>:
addr_t vmalloc()
{
  80124d:	f3 0f 1e fa          	endbr64 
  801251:	55                   	push   rbp
  801252:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801255:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80125c:	e9 80 00 00 00       	jmp    8012e1 <vmalloc+0x94>
    {
        for(int j=0;j<32;j++)
  801261:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801268:	eb 6d                	jmp    8012d7 <vmalloc+0x8a>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80126a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80126d:	48 98                	cdqe   
  80126f:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801276:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801279:	be 01 00 00 00       	mov    esi,0x1
  80127e:	89 c1                	mov    ecx,eax
  801280:	d3 e6                	shl    esi,cl
  801282:	89 f0                	mov    eax,esi
  801284:	21 d0                	and    eax,edx
  801286:	85 c0                	test   eax,eax
  801288:	75 49                	jne    8012d3 <vmalloc+0x86>
            {
                vmalloc_map[i]|=(1<<j);
  80128a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80128d:	48 98                	cdqe   
  80128f:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801296:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801299:	be 01 00 00 00       	mov    esi,0x1
  80129e:	89 c1                	mov    ecx,eax
  8012a0:	d3 e6                	shl    esi,cl
  8012a2:	89 f0                	mov    eax,esi
  8012a4:	09 c2                	or     edx,eax
  8012a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012a9:	48 98                	cdqe   
  8012ab:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8012b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012b5:	c1 e0 05             	shl    eax,0x5
  8012b8:	89 c2                	mov    edx,eax
  8012ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012bd:	01 d0                	add    eax,edx
  8012bf:	c1 e0 0c             	shl    eax,0xc
  8012c2:	48 98                	cdqe   
  8012c4:	48 ba 00 00 02 00 00 	movabs rdx,0xffff800000020000
  8012cb:	80 ff ff 
  8012ce:	48 01 d0             	add    rax,rdx
  8012d1:	eb 18                	jmp    8012eb <vmalloc+0x9e>
        for(int j=0;j<32;j++)
  8012d3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8012d7:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8012db:	7e 8d                	jle    80126a <vmalloc+0x1d>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012dd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8012e1:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8012e5:	0f 8e 76 ff ff ff    	jle    801261 <vmalloc+0x14>
            }
        }
    }
}
  8012eb:	5d                   	pop    rbp
  8012ec:	c3                   	ret    

00000000008012ed <vmfree>:

int vmfree(addr_t ptr)
{
  8012ed:	f3 0f 1e fa          	endbr64 
  8012f1:	55                   	push   rbp
  8012f2:	48 89 e5             	mov    rbp,rsp
  8012f5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8012f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012fd:	48 c1 e8 0c          	shr    rax,0xc
  801301:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801304:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801307:	8d 50 1f             	lea    edx,[rax+0x1f]
  80130a:	85 c0                	test   eax,eax
  80130c:	0f 48 c2             	cmovs  eax,edx
  80130f:	c1 f8 05             	sar    eax,0x5
  801312:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801315:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801318:	99                   	cdq    
  801319:	c1 ea 1b             	shr    edx,0x1b
  80131c:	01 d0                	add    eax,edx
  80131e:	83 e0 1f             	and    eax,0x1f
  801321:	29 d0                	sub    eax,edx
  801323:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801326:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801329:	48 98                	cdqe   
  80132b:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801332:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801335:	be 01 00 00 00       	mov    esi,0x1
  80133a:	89 c1                	mov    ecx,eax
  80133c:	d3 e6                	shl    esi,cl
  80133e:	89 f0                	mov    eax,esi
  801340:	f7 d0                	not    eax
  801342:	21 c2                	and    edx,eax
  801344:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801347:	48 98                	cdqe   
  801349:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801350:	90                   	nop
  801351:	5d                   	pop    rbp
  801352:	c3                   	ret    

0000000000801353 <page_err>:
void page_err(){
  801353:	f3 0f 1e fa          	endbr64 
  801357:	55                   	push   rbp
  801358:	48 89 e5             	mov    rbp,rsp
  80135b:	41 54                	push   r12
  80135d:	53                   	push   rbx
  80135e:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  801362:	fa                   	cli    
    printf("page err\n");
  801363:	bf 78 55 81 00       	mov    edi,0x815578
  801368:	b8 00 00 00 00       	mov    eax,0x0
  80136d:	e8 05 fa ff ff       	call   800d77 <printf>
    unsigned long err_code=0,l_addr=0;
  801372:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801379:	00 
  80137a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801381:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801382:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801386:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80138a:	0f 20 d0             	mov    rax,cr2
  80138d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801391:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801395:	83 e0 01             	and    eax,0x1
  801398:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80139b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80139f:	75 41                	jne    8013e2 <page_err+0x8f>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  8013a1:	48 8b 05 98 3e c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13e98]        # 415240 <current>
  8013a8:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  8013af:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8013b3:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8013b9:	49 89 c4             	mov    r12,rax
  8013bc:	b8 00 00 00 00       	mov    eax,0x0
  8013c1:	e8 66 02 00 00       	call   80162c <req_a_page>
  8013c6:	89 c7                	mov    edi,eax
  8013c8:	e8 4e 04 00 00       	call   80181b <get_phyaddr>
  8013cd:	48 98                	cdqe   
  8013cf:	48 89 d9             	mov    rcx,rbx
  8013d2:	ba 07 00 00 00       	mov    edx,0x7
  8013d7:	4c 89 e6             	mov    rsi,r12
  8013da:	48 89 c7             	mov    rdi,rax
  8013dd:	e8 1b fc ff ff       	call   800ffd <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8013e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013e6:	83 e0 02             	and    eax,0x2
  8013e9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("when writing\n");else //puts("when reading");
  8013ec:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013f0:	74 11                	je     801403 <page_err+0xb0>
  8013f2:	bf 82 55 81 00       	mov    edi,0x815582
  8013f7:	b8 00 00 00 00       	mov    eax,0x0
  8013fc:	e8 76 f9 ff ff       	call   800d77 <printf>
  801401:	eb 0a                	jmp    80140d <page_err+0xba>
    p=err_code&4;
  801403:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801407:	83 e0 04             	and    eax,0x4
  80140a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)printf("supervisor mode\n");else //puts("user mode");
  80140d:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801411:	75 11                	jne    801424 <page_err+0xd1>
  801413:	bf 90 55 81 00       	mov    edi,0x815590
  801418:	b8 00 00 00 00       	mov    eax,0x0
  80141d:	e8 55 f9 ff ff       	call   800d77 <printf>
  801422:	eb 0a                	jmp    80142e <page_err+0xdb>
    p=err_code&16;
  801424:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801428:	83 e0 10             	and    eax,0x10
  80142b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("an instruction tries to fetch\n");
  80142e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801432:	74 0f                	je     801443 <page_err+0xf0>
  801434:	bf a8 55 81 00       	mov    edi,0x8155a8
  801439:	b8 00 00 00 00       	mov    eax,0x0
  80143e:	e8 34 f9 ff ff       	call   800d77 <printf>
    unsigned int addr=0;
  801443:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  80144a:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  80144d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801450:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801454:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801457:	89 c6                	mov    esi,eax
  801459:	bf c8 55 81 00       	mov    edi,0x8155c8
  80145e:	b8 00 00 00 00       	mov    eax,0x0
  801463:	e8 0f f9 ff ff       	call   800d77 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801468:	48 8b 15 d1 70 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc070d1]        # 408540 <task>
  80146f:	8b 05 57 3e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13e57]        # 4152cc <cur_proc>
  801475:	48 98                	cdqe   
  801477:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80147e:	48 01 d0             	add    rax,rdx
  801481:	8b 00                	mov    eax,DWORD PTR [rax]
  801483:	83 f8 01             	cmp    eax,0x1
  801486:	75 11                	jne    801499 <page_err+0x146>
    {
        printf("sys died. please reboot.\n");
  801488:	bf ea 55 81 00       	mov    edi,0x8155ea
  80148d:	b8 00 00 00 00       	mov    eax,0x0
  801492:	e8 e0 f8 ff ff       	call   800d77 <printf>
        asm volatile("jmp .");
  801497:	eb fe                	jmp    801497 <page_err+0x144>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801499:	b8 00 00 00 00       	mov    eax,0x0
  80149e:	e8 bb 53 00 00       	call   80685e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  8014a3:	fb                   	sti    
  8014a4:	c9                   	leave  
  8014a5:	48 83 c4 08          	add    rsp,0x8
  8014a9:	48 cf                	iretq  
}
  8014ab:	90                   	nop
  8014ac:	48 83 c4 20          	add    rsp,0x20
  8014b0:	5b                   	pop    rbx
  8014b1:	41 5c                	pop    r12
  8014b3:	5d                   	pop    rbp
  8014b4:	c3                   	ret    

00000000008014b5 <init_memory>:
void init_memory()
{
  8014b5:	f3 0f 1e fa          	endbr64 
  8014b9:	55                   	push   rbp
  8014ba:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  8014bd:	8b 05 5d ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed5d]        # 400220 <mmap_t_i>
  8014c3:	83 e8 01             	sub    eax,0x1
  8014c6:	48 63 d0             	movsxd rdx,eax
  8014c9:	48 89 d0             	mov    rax,rdx
  8014cc:	48 01 c0             	add    rax,rax
  8014cf:	48 01 d0             	add    rax,rdx
  8014d2:	48 c1 e0 03          	shl    rax,0x3
  8014d6:	48 05 40 00 40 00    	add    rax,0x400040
  8014dc:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8014df:	8b 05 3b ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed3b]        # 400220 <mmap_t_i>
  8014e5:	83 e8 01             	sub    eax,0x1
  8014e8:	48 63 d0             	movsxd rdx,eax
  8014eb:	48 89 d0             	mov    rax,rdx
  8014ee:	48 01 c0             	add    rax,rax
  8014f1:	48 01 d0             	add    rax,rdx
  8014f4:	48 c1 e0 03          	shl    rax,0x3
  8014f8:	48 05 48 00 40 00    	add    rax,0x400048
  8014fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801501:	48 01 c8             	add    rax,rcx
  801504:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801508:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80150c:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801513:	48 85 c0             	test   rax,rax
  801516:	48 0f 48 c2          	cmovs  rax,rdx
  80151a:	48 c1 f8 0c          	sar    rax,0xc
  80151e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801521:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801524:	8d 50 1f             	lea    edx,[rax+0x1f]
  801527:	85 c0                	test   eax,eax
  801529:	0f 48 c2             	cmovs  eax,edx
  80152c:	c1 f8 05             	sar    eax,0x5
  80152f:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801532:	48 c7 05 e3 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeae3],0xc00000        # 400020 <page_map>
  801539:	00 00 c0 00 
    int* p=page_map;
  80153d:	48 8b 05 dc ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfeadc]        # 400020 <page_map>
  801544:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801548:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80154f:	00 
    for(int i=0;i<mmap_t_i;i++){
  801550:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801557:	e9 91 00 00 00       	jmp    8015ed <init_memory+0x138>
        int cont=0;
  80155c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801563:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801566:	48 63 d0             	movsxd rdx,eax
  801569:	48 89 d0             	mov    rax,rdx
  80156c:	48 01 c0             	add    rax,rax
  80156f:	48 01 d0             	add    rax,rdx
  801572:	48 c1 e0 03          	shl    rax,0x3
  801576:	48 05 50 00 40 00    	add    rax,0x400050
  80157c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80157f:	48 83 f8 01          	cmp    rax,0x1
  801583:	74 07                	je     80158c <init_memory+0xd7>
            cont=-1;
  801585:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80158c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801593:	eb 15                	jmp    8015aa <init_memory+0xf5>
            *(p++)=cont;
  801595:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801599:	48 8d 50 04          	lea    rdx,[rax+0x4]
  80159d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8015a1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8015a4:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015a6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8015aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015ad:	48 63 c8             	movsxd rcx,eax
  8015b0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015b3:	48 63 d0             	movsxd rdx,eax
  8015b6:	48 89 d0             	mov    rax,rdx
  8015b9:	48 01 c0             	add    rax,rax
  8015bc:	48 01 d0             	add    rax,rdx
  8015bf:	48 c1 e0 03          	shl    rax,0x3
  8015c3:	48 05 48 00 40 00    	add    rax,0x400048
  8015c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015cc:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8015d3:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8015da:	ff 00 00 
  8015dd:	48 21 d0             	and    rax,rdx
  8015e0:	48 c1 e8 11          	shr    rax,0x11
  8015e4:	48 39 c1             	cmp    rcx,rax
  8015e7:	72 ac                	jb     801595 <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  8015e9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8015ed:	8b 05 2d ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfec2d]        # 400220 <mmap_t_i>
  8015f3:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8015f6:	0f 8c 60 ff ff ff    	jl     80155c <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8015fc:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801603:	eb 1d                	jmp    801622 <init_memory+0x16d>
        page_map[i]=0xffffffff;
  801605:	48 8b 15 14 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea14]        # 400020 <page_map>
  80160c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80160f:	48 98                	cdqe   
  801611:	48 c1 e0 02          	shl    rax,0x2
  801615:	48 01 d0             	add    rax,rdx
  801618:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80161e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801622:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801626:	7e dd                	jle    801605 <init_memory+0x150>
    }
}
  801628:	90                   	nop
  801629:	90                   	nop
  80162a:	5d                   	pop    rbp
  80162b:	c3                   	ret    

000000000080162c <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80162c:	f3 0f 1e fa          	endbr64 
  801630:	55                   	push   rbp
  801631:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801634:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80163b:	e9 b0 00 00 00       	jmp    8016f0 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801640:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801647:	e9 96 00 00 00       	jmp    8016e2 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80164c:	48 8b 15 cd e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9cd]        # 400020 <page_map>
  801653:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801656:	48 98                	cdqe   
  801658:	48 c1 e0 02          	shl    rax,0x2
  80165c:	48 01 d0             	add    rax,rdx
  80165f:	8b 10                	mov    edx,DWORD PTR [rax]
  801661:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801664:	be 01 00 00 00       	mov    esi,0x1
  801669:	89 c1                	mov    ecx,eax
  80166b:	d3 e6                	shl    esi,cl
  80166d:	89 f0                	mov    eax,esi
  80166f:	21 d0                	and    eax,edx
  801671:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801674:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801677:	c1 e0 05             	shl    eax,0x5
  80167a:	89 c2                	mov    edx,eax
  80167c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80167f:	01 d0                	add    eax,edx
  801681:	c1 e0 0c             	shl    eax,0xc
  801684:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801689:	7e 53                	jle    8016de <req_a_page+0xb2>
  80168b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80168f:	75 4d                	jne    8016de <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801691:	48 8b 15 88 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe988]        # 400020 <page_map>
  801698:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80169b:	48 98                	cdqe   
  80169d:	48 c1 e0 02          	shl    rax,0x2
  8016a1:	48 01 d0             	add    rax,rdx
  8016a4:	8b 10                	mov    edx,DWORD PTR [rax]
  8016a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016a9:	be 01 00 00 00       	mov    esi,0x1
  8016ae:	89 c1                	mov    ecx,eax
  8016b0:	d3 e6                	shl    esi,cl
  8016b2:	89 f0                	mov    eax,esi
  8016b4:	89 c6                	mov    esi,eax
  8016b6:	48 8b 0d 63 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe963]        # 400020 <page_map>
  8016bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016c0:	48 98                	cdqe   
  8016c2:	48 c1 e0 02          	shl    rax,0x2
  8016c6:	48 01 c8             	add    rax,rcx
  8016c9:	09 f2                	or     edx,esi
  8016cb:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  8016cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016d0:	c1 e0 05             	shl    eax,0x5
  8016d3:	89 c2                	mov    edx,eax
  8016d5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016d8:	01 d0                	add    eax,edx
  8016da:	48 98                	cdqe   
  8016dc:	eb 1c                	jmp    8016fa <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8016de:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8016e2:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8016e6:	0f 8e 60 ff ff ff    	jle    80164c <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8016ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8016f0:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8016f4:	0f 8e 46 ff ff ff    	jle    801640 <req_a_page+0x14>

            }
        }
    }
}
  8016fa:	5d                   	pop    rbp
  8016fb:	c3                   	ret    

00000000008016fc <free_page>:

int free_page(char *paddr){
  8016fc:	f3 0f 1e fa          	endbr64 
  801700:	55                   	push   rbp
  801701:	48 89 e5             	mov    rbp,rsp
  801704:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801708:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80170c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801712:	85 c0                	test   eax,eax
  801714:	0f 48 c2             	cmovs  eax,edx
  801717:	c1 f8 0c             	sar    eax,0xc
  80171a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80171d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801720:	8d 50 1f             	lea    edx,[rax+0x1f]
  801723:	85 c0                	test   eax,eax
  801725:	0f 48 c2             	cmovs  eax,edx
  801728:	c1 f8 05             	sar    eax,0x5
  80172b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80172e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801731:	99                   	cdq    
  801732:	c1 ea 1b             	shr    edx,0x1b
  801735:	01 d0                	add    eax,edx
  801737:	83 e0 1f             	and    eax,0x1f
  80173a:	29 d0                	sub    eax,edx
  80173c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  80173f:	48 8b 15 da e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8da]        # 400020 <page_map>
  801746:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801749:	48 98                	cdqe   
  80174b:	48 c1 e0 02          	shl    rax,0x2
  80174f:	48 01 d0             	add    rax,rdx
  801752:	8b 10                	mov    edx,DWORD PTR [rax]
  801754:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801757:	be 01 00 00 00       	mov    esi,0x1
  80175c:	89 c1                	mov    ecx,eax
  80175e:	d3 e6                	shl    esi,cl
  801760:	89 f0                	mov    eax,esi
  801762:	f7 d0                	not    eax
  801764:	89 c6                	mov    esi,eax
  801766:	48 8b 0d b3 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe8b3]        # 400020 <page_map>
  80176d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801770:	48 98                	cdqe   
  801772:	48 c1 e0 02          	shl    rax,0x2
  801776:	48 01 c8             	add    rax,rcx
  801779:	21 f2                	and    edx,esi
  80177b:	89 10                	mov    DWORD PTR [rax],edx
}
  80177d:	90                   	nop
  80177e:	5d                   	pop    rbp
  80177f:	c3                   	ret    

0000000000801780 <free_pages_at>:

int free_pages_at(int base,int pgn){
  801780:	f3 0f 1e fa          	endbr64 
  801784:	55                   	push   rbp
  801785:	48 89 e5             	mov    rbp,rsp
  801788:	48 83 ec 18          	sub    rsp,0x18
  80178c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80178f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  801792:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801799:	eb 1b                	jmp    8017b6 <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  80179b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80179e:	c1 e0 0c             	shl    eax,0xc
  8017a1:	89 c2                	mov    edx,eax
  8017a3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017a6:	01 d0                	add    eax,edx
  8017a8:	48 98                	cdqe   
  8017aa:	48 89 c7             	mov    rdi,rax
  8017ad:	e8 4a ff ff ff       	call   8016fc <free_page>
    for(int i=0;i<pgn;i++){
  8017b2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017b9:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8017bc:	7c dd                	jl     80179b <free_pages_at+0x1b>
    }
}
  8017be:	90                   	nop
  8017bf:	c9                   	leave  
  8017c0:	c3                   	ret    

00000000008017c1 <check_page>:
int check_page(int num){
  8017c1:	f3 0f 1e fa          	endbr64 
  8017c5:	55                   	push   rbp
  8017c6:	48 89 e5             	mov    rbp,rsp
  8017c9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8017cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017cf:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017d2:	85 c0                	test   eax,eax
  8017d4:	0f 48 c2             	cmovs  eax,edx
  8017d7:	c1 f8 05             	sar    eax,0x5
  8017da:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8017dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017e0:	99                   	cdq    
  8017e1:	c1 ea 1b             	shr    edx,0x1b
  8017e4:	01 d0                	add    eax,edx
  8017e6:	83 e0 1f             	and    eax,0x1f
  8017e9:	29 d0                	sub    eax,edx
  8017eb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8017ee:	48 8b 15 2b e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe82b]        # 400020 <page_map>
  8017f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017f8:	48 98                	cdqe   
  8017fa:	48 c1 e0 02          	shl    rax,0x2
  8017fe:	48 01 d0             	add    rax,rdx
  801801:	8b 10                	mov    edx,DWORD PTR [rax]
  801803:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801806:	be 01 00 00 00       	mov    esi,0x1
  80180b:	89 c1                	mov    ecx,eax
  80180d:	d3 e6                	shl    esi,cl
  80180f:	89 f0                	mov    eax,esi
  801811:	21 d0                	and    eax,edx
  801813:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801816:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801819:	5d                   	pop    rbp
  80181a:	c3                   	ret    

000000000080181b <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80181b:	f3 0f 1e fa          	endbr64 
  80181f:	55                   	push   rbp
  801820:	48 89 e5             	mov    rbp,rsp
  801823:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801826:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801829:	c1 e0 0c             	shl    eax,0xc
}
  80182c:	5d                   	pop    rbp
  80182d:	c3                   	ret    

000000000080182e <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80182e:	f3 0f 1e fa          	endbr64 
  801832:	55                   	push   rbp
  801833:	48 89 e5             	mov    rbp,rsp
  801836:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80183a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80183d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801840:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801844:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80184b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80184f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801852:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801855:	89 c0                	mov    eax,eax
  801857:	25 00 f0 ff ff       	and    eax,0xfffff000
  80185c:	48 09 c2             	or     rdx,rax
  80185f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801863:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801866:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80186a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80186d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801870:	48 98                	cdqe   
  801872:	48 09 c2             	or     rdx,rax
  801875:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801879:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80187c:	90                   	nop
  80187d:	5d                   	pop    rbp
  80187e:	c3                   	ret    

000000000080187f <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80187f:	f3 0f 1e fa          	endbr64 
  801883:	55                   	push   rbp
  801884:	48 89 e5             	mov    rbp,rsp
  801887:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80188b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80188e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801891:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801895:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  80189c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018a0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018a3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018a6:	0c 81                	or     al,0x81
  8018a8:	89 c0                	mov    eax,eax
  8018aa:	48 09 c2             	or     rdx,rax
  8018ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018b1:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8018b4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018b7:	25 00 00 00 c0       	and    eax,0xc0000000
  8018bc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8018bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018c3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018c9:	48 09 c2             	or     rdx,rax
  8018cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018d0:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018d3:	90                   	nop
  8018d4:	5d                   	pop    rbp
  8018d5:	c3                   	ret    

00000000008018d6 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  8018d6:	f3 0f 1e fa          	endbr64 
  8018da:	55                   	push   rbp
  8018db:	48 89 e5             	mov    rbp,rsp
  8018de:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018e2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018e5:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  8018e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018ec:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  8018f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018f7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018fa:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018fd:	0d 81 10 00 00       	or     eax,0x1081
  801902:	48 98                	cdqe   
  801904:	48 09 c2             	or     rdx,rax
  801907:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80190b:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  80190e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801911:	25 00 00 c0 ff       	and    eax,0xffc00000
  801916:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801919:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80191d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801920:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801923:	48 09 c2             	or     rdx,rax
  801926:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80192a:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80192d:	90                   	nop
  80192e:	5d                   	pop    rbp
  80192f:	c3                   	ret    

0000000000801930 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801930:	f3 0f 1e fa          	endbr64 
  801934:	55                   	push   rbp
  801935:	48 89 e5             	mov    rbp,rsp
  801938:	48 83 ec 20          	sub    rsp,0x20
  80193c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801940:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801943:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801948:	75 18                	jne    801962 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80194a:	b8 00 00 00 00       	mov    eax,0x0
  80194f:	e8 d8 fc ff ff       	call   80162c <req_a_page>
  801954:	89 c7                	mov    edi,eax
  801956:	e8 c0 fe ff ff       	call   80181b <get_phyaddr>
  80195b:	48 98                	cdqe   
  80195d:	e9 a5 00 00 00       	jmp    801a07 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801962:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801966:	89 c2                	mov    edx,eax
  801968:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80196b:	89 c6                	mov    esi,eax
  80196d:	89 d7                	mov    edi,edx
  80196f:	e8 52 01 00 00       	call   801ac6 <is_pgs_ava>
  801974:	85 c0                	test   eax,eax
  801976:	75 0c                	jne    801984 <req_page_at+0x54>
  801978:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80197f:	e9 83 00 00 00       	jmp    801a07 <req_page_at+0xd7>
    int pgni=base/4096;
  801984:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801988:	48 c1 e8 0c          	shr    rax,0xc
  80198c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80198f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801992:	8d 50 1f             	lea    edx,[rax+0x1f]
  801995:	85 c0                	test   eax,eax
  801997:	0f 48 c2             	cmovs  eax,edx
  80199a:	c1 f8 05             	sar    eax,0x5
  80199d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8019a0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019a3:	99                   	cdq    
  8019a4:	c1 ea 1b             	shr    edx,0x1b
  8019a7:	01 d0                	add    eax,edx
  8019a9:	83 e0 1f             	and    eax,0x1f
  8019ac:	29 d0                	sub    eax,edx
  8019ae:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8019b1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019b8:	eb 40                	jmp    8019fa <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8019ba:	48 8b 15 5f e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe65f]        # 400020 <page_map>
  8019c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c4:	48 98                	cdqe   
  8019c6:	48 c1 e0 02          	shl    rax,0x2
  8019ca:	48 01 d0             	add    rax,rdx
  8019cd:	8b 10                	mov    edx,DWORD PTR [rax]
  8019cf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8019d2:	be 01 00 00 00       	mov    esi,0x1
  8019d7:	89 c1                	mov    ecx,eax
  8019d9:	d3 e6                	shl    esi,cl
  8019db:	89 f0                	mov    eax,esi
  8019dd:	89 c6                	mov    esi,eax
  8019df:	48 8b 0d 3a e6 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe63a]        # 400020 <page_map>
  8019e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e9:	48 98                	cdqe   
  8019eb:	48 c1 e0 02          	shl    rax,0x2
  8019ef:	48 01 c8             	add    rax,rcx
  8019f2:	09 f2                	or     edx,esi
  8019f4:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8019f6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019fd:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801a00:	7c b8                	jl     8019ba <req_page_at+0x8a>
    }
    return 0;
  801a02:	b8 00 00 00 00       	mov    eax,0x0

}
  801a07:	c9                   	leave  
  801a08:	c3                   	ret    

0000000000801a09 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801a09:	f3 0f 1e fa          	endbr64 
  801a0d:	55                   	push   rbp
  801a0e:	48 89 e5             	mov    rbp,rsp
  801a11:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a14:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801a17:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a1e:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a1f:	0f 20 d8             	mov    rax,cr3
  801a22:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a26:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a29:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a2f:	85 c0                	test   eax,eax
  801a31:	0f 48 c2             	cmovs  eax,edx
  801a34:	c1 f8 15             	sar    eax,0x15
  801a37:	48 98                	cdqe   
  801a39:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a40:	00 
  801a41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a45:	48 01 d0             	add    rax,rdx
  801a48:	8b 00                	mov    eax,DWORD PTR [rax]
  801a4a:	89 c0                	mov    eax,eax
  801a4c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a51:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a55:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a58:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a5e:	85 c0                	test   eax,eax
  801a60:	0f 48 c2             	cmovs  eax,edx
  801a63:	c1 f8 15             	sar    eax,0x15
  801a66:	48 98                	cdqe   
  801a68:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a6f:	00 
  801a70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a74:	48 01 d0             	add    rax,rdx
  801a77:	8b 00                	mov    eax,DWORD PTR [rax]
  801a79:	83 e0 01             	and    eax,0x1
  801a7c:	85 c0                	test   eax,eax
  801a7e:	74 38                	je     801ab8 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801a80:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a83:	99                   	cdq    
  801a84:	c1 ea 0b             	shr    edx,0xb
  801a87:	01 d0                	add    eax,edx
  801a89:	25 ff ff 1f 00       	and    eax,0x1fffff
  801a8e:	29 d0                	sub    eax,edx
  801a90:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a96:	85 c0                	test   eax,eax
  801a98:	0f 48 c2             	cmovs  eax,edx
  801a9b:	c1 f8 0c             	sar    eax,0xc
  801a9e:	48 98                	cdqe   
  801aa0:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801aa7:	00 
  801aa8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801aac:	48 01 d0             	add    rax,rdx
  801aaf:	8b 00                	mov    eax,DWORD PTR [rax]
  801ab1:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801ab4:	85 c0                	test   eax,eax
  801ab6:	75 07                	jne    801abf <chk_vm+0xb6>
    {
        return -1;
  801ab8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801abd:	eb 05                	jmp    801ac4 <chk_vm+0xbb>
    }
    return 0;
  801abf:	b8 00 00 00 00       	mov    eax,0x0
}
  801ac4:	5d                   	pop    rbp
  801ac5:	c3                   	ret    

0000000000801ac6 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801ac6:	f3 0f 1e fa          	endbr64 
  801aca:	55                   	push   rbp
  801acb:	48 89 e5             	mov    rbp,rsp
  801ace:	48 83 ec 18          	sub    rsp,0x18
  801ad2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ad5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801ad8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801adb:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801ae1:	85 c0                	test   eax,eax
  801ae3:	0f 48 c2             	cmovs  eax,edx
  801ae6:	c1 f8 0c             	sar    eax,0xc
  801ae9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801aec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801af3:	eb 1e                	jmp    801b13 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801af5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801af8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801afb:	01 d0                	add    eax,edx
  801afd:	89 c7                	mov    edi,eax
  801aff:	e8 bd fc ff ff       	call   8017c1 <check_page>
  801b04:	85 c0                	test   eax,eax
  801b06:	74 07                	je     801b0f <is_pgs_ava+0x49>
  801b08:	b8 00 00 00 00       	mov    eax,0x0
  801b0d:	eb 11                	jmp    801b20 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801b0f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b16:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801b19:	7c da                	jl     801af5 <is_pgs_ava+0x2f>
    }
    return 1;
  801b1b:	b8 01 00 00 00       	mov    eax,0x1

}
  801b20:	c9                   	leave  
  801b21:	c3                   	ret    

0000000000801b22 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b22:	f3 0f 1e fa          	endbr64 
  801b26:	55                   	push   rbp
  801b27:	48 89 e5             	mov    rbp,rsp
  801b2a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b2e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b32:	c6 05 07 e7 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe707],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b39:	c6 05 01 e7 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe701],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b44:	48 89 05 fd e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6fd],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b4f:	48 89 05 fa e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6fa],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b56:	c7 05 00 e7 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe700],0x1        # 400260 <vols+0x20>
  801b5d:	00 00 00 
    return 0;
  801b60:	b8 00 00 00 00       	mov    eax,0x0
}
  801b65:	5d                   	pop    rbp
  801b66:	c3                   	ret    

0000000000801b67 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801b67:	f3 0f 1e fa          	endbr64 
  801b6b:	55                   	push   rbp
  801b6c:	48 89 e5             	mov    rbp,rsp
  801b6f:	48 83 ec 20          	sub    rsp,0x20
  801b73:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801b76:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b7d:	eb 38                	jmp    801bb7 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b82:	48 98                	cdqe   
  801b84:	48 c1 e0 04          	shl    rax,0x4
  801b88:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b8e:	8b 00                	mov    eax,DWORD PTR [rax]
  801b90:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b93:	75 1e                	jne    801bb3 <sys_mkfifo+0x4c>
  801b95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b98:	48 98                	cdqe   
  801b9a:	48 c1 e0 04          	shl    rax,0x4
  801b9e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ba4:	8b 00                	mov    eax,DWORD PTR [rax]
  801ba6:	83 f8 01             	cmp    eax,0x1
  801ba9:	75 08                	jne    801bb3 <sys_mkfifo+0x4c>
            return i;
  801bab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bae:	e9 a6 00 00 00       	jmp    801c59 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801bb3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bb7:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801bbb:	7e c2                	jle    801b7f <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801bbd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801bc4:	e9 81 00 00 00       	jmp    801c4a <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801bc9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bcc:	48 98                	cdqe   
  801bce:	48 c1 e0 04          	shl    rax,0x4
  801bd2:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bd8:	8b 00                	mov    eax,DWORD PTR [rax]
  801bda:	85 c0                	test   eax,eax
  801bdc:	75 68                	jne    801c46 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801bde:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801be1:	48 98                	cdqe   
  801be3:	48 c1 e0 04          	shl    rax,0x4
  801be7:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bed:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801bf3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bf6:	48 98                	cdqe   
  801bf8:	48 c1 e0 04          	shl    rax,0x4
  801bfc:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801c03:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c06:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801c08:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c0b:	48 98                	cdqe   
  801c0d:	48 c1 e0 04          	shl    rax,0x4
  801c11:	48 05 64 1e 40 00    	add    rax,0x401e64
  801c17:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c1d:	b8 00 00 00 00       	mov    eax,0x0
  801c22:	e8 05 fa ff ff       	call   80162c <req_a_page>
  801c27:	89 c7                	mov    edi,eax
  801c29:	e8 ed fb ff ff       	call   80181b <get_phyaddr>
  801c2e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c31:	48 63 d2             	movsxd rdx,edx
  801c34:	48 c1 e2 04          	shl    rdx,0x4
  801c38:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c3f:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c41:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c44:	eb 13                	jmp    801c59 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c46:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c4a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c4e:	0f 8e 75 ff ff ff    	jle    801bc9 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c54:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c59:	c9                   	leave  
  801c5a:	c3                   	ret    

0000000000801c5b <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801c5b:	f3 0f 1e fa          	endbr64 
  801c5f:	55                   	push   rbp
  801c60:	48 89 e5             	mov    rbp,rsp
  801c63:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801c66:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c6d:	eb 4a                	jmp    801cb9 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801c6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c72:	48 98                	cdqe   
  801c74:	48 c1 e0 04          	shl    rax,0x4
  801c78:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801c7e:	8b 00                	mov    eax,DWORD PTR [rax]
  801c80:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c83:	75 30                	jne    801cb5 <sys_rmfifo+0x5a>
  801c85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c88:	48 98                	cdqe   
  801c8a:	48 c1 e0 04          	shl    rax,0x4
  801c8e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c94:	8b 00                	mov    eax,DWORD PTR [rax]
  801c96:	83 f8 01             	cmp    eax,0x1
  801c99:	75 1a                	jne    801cb5 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801c9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c9e:	48 98                	cdqe   
  801ca0:	48 c1 e0 04          	shl    rax,0x4
  801ca4:	48 05 68 1e 40 00    	add    rax,0x401e68
  801caa:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801cb0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cb3:	eb 0f                	jmp    801cc4 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801cb5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801cb9:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801cbd:	7e b0                	jle    801c6f <sys_rmfifo+0x14>
        }
    }
    return -1;
  801cbf:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801cc4:	5d                   	pop    rbp
  801cc5:	c3                   	ret    

0000000000801cc6 <free_vol>:
int free_vol(int voli)
{
  801cc6:	f3 0f 1e fa          	endbr64 
  801cca:	55                   	push   rbp
  801ccb:	48 89 e5             	mov    rbp,rsp
  801cce:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801cd1:	c7 05 85 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe585],0x0        # 400260 <vols+0x20>
  801cd8:	00 00 00 
    return 0;
  801cdb:	b8 00 00 00 00       	mov    eax,0x0
}
  801ce0:	5d                   	pop    rbp
  801ce1:	c3                   	ret    

0000000000801ce2 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801ce2:	f3 0f 1e fa          	endbr64 
  801ce6:	55                   	push   rbp
  801ce7:	48 89 e5             	mov    rbp,rsp
  801cea:	48 83 ec 20          	sub    rsp,0x20
  801cee:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801cf1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801cf4:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801cf8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cff:	e9 d8 00 00 00       	jmp    801ddc <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801d04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d07:	48 63 d0             	movsxd rdx,eax
  801d0a:	48 89 d0             	mov    rax,rdx
  801d0d:	48 c1 e0 02          	shl    rax,0x2
  801d11:	48 01 d0             	add    rax,rdx
  801d14:	48 c1 e0 03          	shl    rax,0x3
  801d18:	48 05 60 02 40 00    	add    rax,0x400260
  801d1e:	8b 00                	mov    eax,DWORD PTR [rax]
  801d20:	85 c0                	test   eax,eax
  801d22:	0f 85 b0 00 00 00    	jne    801dd8 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d2b:	48 63 d0             	movsxd rdx,eax
  801d2e:	48 89 d0             	mov    rax,rdx
  801d31:	48 c1 e0 02          	shl    rax,0x2
  801d35:	48 01 d0             	add    rax,rdx
  801d38:	48 c1 e0 03          	shl    rax,0x3
  801d3c:	48 05 60 02 40 00    	add    rax,0x400260
  801d42:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d48:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d4b:	48 63 d0             	movsxd rdx,eax
  801d4e:	48 89 d0             	mov    rax,rdx
  801d51:	48 01 c0             	add    rax,rax
  801d54:	48 01 d0             	add    rax,rdx
  801d57:	48 c1 e0 03          	shl    rax,0x3
  801d5b:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801d62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d65:	48 63 d0             	movsxd rdx,eax
  801d68:	48 89 d0             	mov    rax,rdx
  801d6b:	48 c1 e0 02          	shl    rax,0x2
  801d6f:	48 01 d0             	add    rax,rdx
  801d72:	48 c1 e0 03          	shl    rax,0x3
  801d76:	48 05 58 02 40 00    	add    rax,0x400258
  801d7c:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801d7f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d82:	89 c7                	mov    edi,eax
  801d84:	e8 14 1e 00 00       	call   803b9d <get_drv>
  801d89:	48 89 c2             	mov    rdx,rax
  801d8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d8f:	48 63 c8             	movsxd rcx,eax
  801d92:	48 89 c8             	mov    rax,rcx
  801d95:	48 c1 e0 02          	shl    rax,0x2
  801d99:	48 01 c8             	add    rax,rcx
  801d9c:	48 c1 e0 03          	shl    rax,0x3
  801da0:	48 05 48 02 40 00    	add    rax,0x400248
  801da6:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801da9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dac:	48 63 d0             	movsxd rdx,eax
  801daf:	48 89 d0             	mov    rax,rdx
  801db2:	48 c1 e0 02          	shl    rax,0x2
  801db6:	48 01 d0             	add    rax,rdx
  801db9:	48 c1 e0 03          	shl    rax,0x3
  801dbd:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801dc4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801dc8:	48 89 c6             	mov    rsi,rax
  801dcb:	48 89 d7             	mov    rdi,rdx
  801dce:	e8 95 b2 00 00       	call   80d068 <strcpy>
            return i;
  801dd3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dd6:	eb 13                	jmp    801deb <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801dd8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ddc:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801de0:	0f 8e 1e ff ff ff    	jle    801d04 <reg_vol+0x22>
        }
    }
    return -1;
  801de6:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801deb:	c9                   	leave  
  801dec:	c3                   	ret    

0000000000801ded <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801ded:	f3 0f 1e fa          	endbr64 
  801df1:	55                   	push   rbp
  801df2:	48 89 e5             	mov    rbp,rsp
  801df5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801df8:	48 8b 05 41 34 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13441]        # 415240 <current>
  801dff:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e02:	48 63 d2             	movsxd rdx,edx
  801e05:	48 83 c2 1a          	add    rdx,0x1a
  801e09:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801e0e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801e12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e16:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801e19:	5d                   	pop    rbp
  801e1a:	c3                   	ret    

0000000000801e1b <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801e1b:	f3 0f 1e fa          	endbr64 
  801e1f:	55                   	push   rbp
  801e20:	48 89 e5             	mov    rbp,rsp
  801e23:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e26:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e2d:	eb 3f                	jmp    801e6e <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e32:	48 63 d0             	movsxd rdx,eax
  801e35:	48 89 d0             	mov    rax,rdx
  801e38:	48 01 c0             	add    rax,rax
  801e3b:	48 01 d0             	add    rax,rdx
  801e3e:	48 c1 e0 05          	shl    rax,0x5
  801e42:	48 05 60 06 40 00    	add    rax,0x400660
  801e48:	8b 00                	mov    eax,DWORD PTR [rax]
  801e4a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e4d:	75 1b                	jne    801e6a <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e52:	48 63 d0             	movsxd rdx,eax
  801e55:	48 89 d0             	mov    rax,rdx
  801e58:	48 01 c0             	add    rax,rax
  801e5b:	48 01 d0             	add    rax,rdx
  801e5e:	48 c1 e0 05          	shl    rax,0x5
  801e62:	48 05 60 06 40 00    	add    rax,0x400660
  801e68:	eb 0f                	jmp    801e79 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e6a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e6e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801e72:	7e bb                	jle    801e2f <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801e74:	b8 00 00 00 00       	mov    eax,0x0
}
  801e79:	5d                   	pop    rbp
  801e7a:	c3                   	ret    

0000000000801e7b <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801e7b:	f3 0f 1e fa          	endbr64 
  801e7f:	55                   	push   rbp
  801e80:	48 89 e5             	mov    rbp,rsp
  801e83:	48 83 ec 10          	sub    rsp,0x10
  801e87:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801e8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e8f:	48 89 c7             	mov    rdi,rax
  801e92:	e8 a0 04 00 00       	call   802337 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801e97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e9b:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e9f:	84 c0                	test   al,al
  801ea1:	75 07                	jne    801eaa <brelse+0x2f>
  801ea3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ea8:	eb 32                	jmp    801edc <brelse+0x61>
    bh->b_count--;
  801eaa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eae:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801eb2:	8d 50 ff             	lea    edx,[rax-0x1]
  801eb5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eb9:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801ebc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ec0:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ec4:	84 c0                	test   al,al
  801ec6:	75 0f                	jne    801ed7 <brelse+0x5c>
        vmfree(bh->b_data);
  801ec8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ecc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ecf:	48 89 c7             	mov    rdi,rax
  801ed2:	e8 16 f4 ff ff       	call   8012ed <vmfree>
    return 0;
  801ed7:	b8 00 00 00 00       	mov    eax,0x0
}
  801edc:	c9                   	leave  
  801edd:	c3                   	ret    

0000000000801ede <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801ede:	f3 0f 1e fa          	endbr64 
  801ee2:	55                   	push   rbp
  801ee3:	48 89 e5             	mov    rbp,rsp
  801ee6:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801eed:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801ef3:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801ef9:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801eff:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f05:	89 d6                	mov    esi,edx
  801f07:	89 c7                	mov    edi,eax
  801f09:	e8 78 02 00 00       	call   802186 <get_buf>
  801f0e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801f12:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f17:	75 09                	jne    801f22 <bread+0x44>
  801f19:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f20:	eb 75                	jmp    801f97 <bread+0xb9>
    if(!bh->b_uptodate)
  801f22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f26:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f2a:	84 c0                	test   al,al
  801f2c:	75 65                	jne    801f93 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f2e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f34:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f37:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f42:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f45:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f4b:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f52:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f59:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801f5d:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801f63:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801f6a:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801f6d:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801f74:	48 89 c7             	mov    rdi,rax
  801f77:	e8 48 1c 00 00       	call   803bc4 <make_request>
  801f7c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801f7f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f82:	89 c7                	mov    edi,eax
  801f84:	e8 4e 1f 00 00       	call   803ed7 <wait_on_req>
        clear_req(reqi);
  801f89:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f8c:	89 c7                	mov    edi,eax
  801f8e:	e8 74 1f 00 00       	call   803f07 <clear_req>
    }
    return bh;
  801f93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801f97:	c9                   	leave  
  801f98:	c3                   	ret    

0000000000801f99 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801f99:	f3 0f 1e fa          	endbr64 
  801f9d:	55                   	push   rbp
  801f9e:	48 89 e5             	mov    rbp,rsp
  801fa1:	48 83 ec 40          	sub    rsp,0x40
  801fa5:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801fa9:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801fad:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801fb0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fb4:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fb7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801fba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fbe:	48 89 c7             	mov    rdi,rax
  801fc1:	e8 80 01 00 00       	call   802146 <get_according_bnr>
  801fc6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801fc9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801fcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fcf:	89 d6                	mov    esi,edx
  801fd1:	89 c7                	mov    edi,eax
  801fd3:	e8 06 ff ff ff       	call   801ede <bread>
  801fd8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801fdc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801fdf:	ba 00 02 00 00       	mov    edx,0x200
  801fe4:	39 d0                	cmp    eax,edx
  801fe6:	0f 4f c2             	cmovg  eax,edx
  801fe9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801fec:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801fef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ff3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801ff6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801ffa:	48 89 ce             	mov    rsi,rcx
  801ffd:	48 89 c7             	mov    rdi,rax
  802000:	e8 65 af 00 00       	call   80cf6a <memcpy>
        len-=BLOCK_SIZE;
  802005:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80200c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802010:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802013:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802016:	01 c2                	add    edx,eax
  802018:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80201c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80201f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802023:	48 89 c7             	mov    rdi,rax
  802026:	e8 50 fe ff ff       	call   801e7b <brelse>
    }while(len>0);
  80202b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80202f:	7f 89                	jg     801fba <vfs_read_file+0x21>
    return 0;
  802031:	b8 00 00 00 00       	mov    eax,0x0
}
  802036:	c9                   	leave  
  802037:	c3                   	ret    

0000000000802038 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802038:	f3 0f 1e fa          	endbr64 
  80203c:	55                   	push   rbp
  80203d:	48 89 e5             	mov    rbp,rsp
  802040:	48 83 ec 40          	sub    rsp,0x40
  802044:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802048:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80204c:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80204f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802053:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802056:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802059:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80205d:	48 89 c7             	mov    rdi,rax
  802060:	e8 e1 00 00 00       	call   802146 <get_according_bnr>
  802065:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802068:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80206b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80206e:	89 d6                	mov    esi,edx
  802070:	89 c7                	mov    edi,eax
  802072:	e8 0f 01 00 00       	call   802186 <get_buf>
  802077:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80207b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80207e:	ba 00 02 00 00       	mov    edx,0x200
  802083:	39 d0                	cmp    eax,edx
  802085:	0f 4f c2             	cmovg  eax,edx
  802088:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  80208b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80208e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802092:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802095:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802099:	48 89 ce             	mov    rsi,rcx
  80209c:	48 89 c7             	mov    rdi,rax
  80209f:	e8 c6 ae 00 00       	call   80cf6a <memcpy>
        len-=BLOCK_SIZE;
  8020a4:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8020ab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020af:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020b5:	01 c2                	add    edx,eax
  8020b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020bb:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8020be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020c2:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8020c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020ca:	48 89 c7             	mov    rdi,rax
  8020cd:	e8 a9 fd ff ff       	call   801e7b <brelse>
    }while(len>0);
  8020d2:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8020d6:	7f 81                	jg     802059 <vfs_write_file+0x21>
    return 0;
  8020d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8020dd:	c9                   	leave  
  8020de:	c3                   	ret    

00000000008020df <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8020df:	f3 0f 1e fa          	endbr64 
  8020e3:	55                   	push   rbp
  8020e4:	48 89 e5             	mov    rbp,rsp
  8020e7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8020eb:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8020ee:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8020f1:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020f5:	74 35                	je     80212c <vfs_seek_file+0x4d>
  8020f7:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020fb:	7f 3f                	jg     80213c <vfs_seek_file+0x5d>
  8020fd:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802101:	74 08                	je     80210b <vfs_seek_file+0x2c>
  802103:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802107:	74 0e                	je     802117 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802109:	eb 31                	jmp    80213c <vfs_seek_file+0x5d>
        f->ptr=offset;
  80210b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80210f:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802112:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802115:	eb 26                	jmp    80213d <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802117:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80211b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80211e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802121:	01 c2                	add    edx,eax
  802123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802127:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80212a:	eb 11                	jmp    80213d <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80212c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802130:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802133:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802137:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80213a:	eb 01                	jmp    80213d <vfs_seek_file+0x5e>
        break;
  80213c:	90                   	nop
    }
    return f->ptr;
  80213d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802141:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802144:	5d                   	pop    rbp
  802145:	c3                   	ret    

0000000000802146 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802146:	f3 0f 1e fa          	endbr64 
  80214a:	55                   	push   rbp
  80214b:	48 89 e5             	mov    rbp,rsp
  80214e:	48 83 ec 10          	sub    rsp,0x10
  802152:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802156:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80215d:	48 63 d0             	movsxd rdx,eax
  802160:	48 89 d0             	mov    rax,rdx
  802163:	48 c1 e0 02          	shl    rax,0x2
  802167:	48 01 d0             	add    rax,rdx
  80216a:	48 c1 e0 03          	shl    rax,0x3
  80216e:	48 05 58 02 40 00    	add    rax,0x400258
  802174:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802177:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80217b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80217f:	48 89 c7             	mov    rdi,rax
  802182:	ff d2                	call   rdx

}
  802184:	c9                   	leave  
  802185:	c3                   	ret    

0000000000802186 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802186:	f3 0f 1e fa          	endbr64 
  80218a:	55                   	push   rbp
  80218b:	48 89 e5             	mov    rbp,rsp
  80218e:	48 83 ec 20          	sub    rsp,0x20
  802192:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802195:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802198:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80219f:	e9 b9 00 00 00       	jmp    80225d <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8021a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021a7:	48 98                	cdqe   
  8021a9:	48 c1 e0 06          	shl    rax,0x6
  8021ad:	48 05 90 26 40 00    	add    rax,0x402690
  8021b3:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021b6:	0f b7 c0             	movzx  eax,ax
  8021b9:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021bc:	0f 85 97 00 00 00    	jne    802259 <get_buf+0xd3>
  8021c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021c5:	48 98                	cdqe   
  8021c7:	48 c1 e0 06          	shl    rax,0x6
  8021cb:	48 05 88 26 40 00    	add    rax,0x402688
  8021d1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8021d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8021d7:	48 98                	cdqe   
  8021d9:	48 39 c2             	cmp    rdx,rax
  8021dc:	75 7b                	jne    802259 <get_buf+0xd3>
        {
            repeat:
  8021de:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8021df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021e2:	48 98                	cdqe   
  8021e4:	48 c1 e0 06          	shl    rax,0x6
  8021e8:	48 05 80 26 40 00    	add    rax,0x402680
  8021ee:	48 89 c7             	mov    rdi,rax
  8021f1:	e8 41 01 00 00       	call   802337 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8021f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021f9:	48 98                	cdqe   
  8021fb:	48 c1 e0 06          	shl    rax,0x6
  8021ff:	48 05 94 26 40 00    	add    rax,0x402694
  802205:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802208:	84 c0                	test   al,al
  80220a:	74 02                	je     80220e <get_buf+0x88>
                goto repeat;
  80220c:	eb d1                	jmp    8021df <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80220e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802211:	48 98                	cdqe   
  802213:	48 c1 e0 06          	shl    rax,0x6
  802217:	48 05 90 26 40 00    	add    rax,0x402690
  80221d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802220:	0f b7 c0             	movzx  eax,ax
  802223:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802226:	75 30                	jne    802258 <get_buf+0xd2>
  802228:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80222b:	48 98                	cdqe   
  80222d:	48 c1 e0 06          	shl    rax,0x6
  802231:	48 05 88 26 40 00    	add    rax,0x402688
  802237:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80223a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80223d:	48 98                	cdqe   
  80223f:	48 39 c2             	cmp    rdx,rax
  802242:	75 14                	jne    802258 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802244:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802247:	48 98                	cdqe   
  802249:	48 c1 e0 06          	shl    rax,0x6
  80224d:	48 05 80 26 40 00    	add    rax,0x402680
  802253:	e9 dd 00 00 00       	jmp    802335 <get_buf+0x1af>
                continue;
  802258:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802259:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80225d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802261:	0f 8e 3d ff ff ff    	jle    8021a4 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802267:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80226e:	e9 b8 00 00 00       	jmp    80232b <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802273:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802276:	48 98                	cdqe   
  802278:	48 c1 e0 06          	shl    rax,0x6
  80227c:	48 05 94 26 40 00    	add    rax,0x402694
  802282:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802285:	84 c0                	test   al,al
  802287:	0f 85 9a 00 00 00    	jne    802327 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  80228d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802290:	48 98                	cdqe   
  802292:	48 c1 e0 06          	shl    rax,0x6
  802296:	48 05 93 26 40 00    	add    rax,0x402693
  80229c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80229f:	84 c0                	test   al,al
  8022a1:	74 2e                	je     8022d1 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8022a3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022a6:	48 98                	cdqe   
  8022a8:	48 c1 e0 06          	shl    rax,0x6
  8022ac:	48 05 80 26 40 00    	add    rax,0x402680
  8022b2:	48 89 c7             	mov    rdi,rax
  8022b5:	e8 1b 01 00 00       	call   8023d5 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8022ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022bd:	48 98                	cdqe   
  8022bf:	48 c1 e0 06          	shl    rax,0x6
  8022c3:	48 05 80 26 40 00    	add    rax,0x402680
  8022c9:	48 89 c7             	mov    rdi,rax
  8022cc:	e8 66 00 00 00       	call   802337 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8022d1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022d4:	48 98                	cdqe   
  8022d6:	48 c1 e0 06          	shl    rax,0x6
  8022da:	48 05 94 26 40 00    	add    rax,0x402694
  8022e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022e3:	8d 50 01             	lea    edx,[rax+0x1]
  8022e6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022e9:	48 98                	cdqe   
  8022eb:	48 c1 e0 06          	shl    rax,0x6
  8022ef:	48 05 94 26 40 00    	add    rax,0x402694
  8022f5:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8022f7:	b8 00 00 00 00       	mov    eax,0x0
  8022fc:	e8 4c ef ff ff       	call   80124d <vmalloc>
  802301:	48 89 c2             	mov    rdx,rax
  802304:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802307:	48 98                	cdqe   
  802309:	48 c1 e0 06          	shl    rax,0x6
  80230d:	48 05 80 26 40 00    	add    rax,0x402680
  802313:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802316:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802319:	48 98                	cdqe   
  80231b:	48 c1 e0 06          	shl    rax,0x6
  80231f:	48 05 80 26 40 00    	add    rax,0x402680
  802325:	eb 0e                	jmp    802335 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802327:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80232b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80232f:	0f 8e 3e ff ff ff    	jle    802273 <get_buf+0xed>
        }
    }
}
  802335:	c9                   	leave  
  802336:	c3                   	ret    

0000000000802337 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802337:	f3 0f 1e fa          	endbr64 
  80233b:	55                   	push   rbp
  80233c:	48 89 e5             	mov    rbp,rsp
  80233f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802343:	90                   	nop
  802344:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802348:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80234c:	84 c0                	test   al,al
  80234e:	75 f4                	jne    802344 <wait_on_buf+0xd>
    
}
  802350:	90                   	nop
  802351:	90                   	nop
  802352:	5d                   	pop    rbp
  802353:	c3                   	ret    

0000000000802354 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802354:	f3 0f 1e fa          	endbr64 
  802358:	55                   	push   rbp
  802359:	48 89 e5             	mov    rbp,rsp
  80235c:	48 83 ec 30          	sub    rsp,0x30
  802360:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802363:	b8 00 00 00 00       	mov    eax,0x0
  802368:	e8 e0 ee ff ff       	call   80124d <vmalloc>
  80236d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802371:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802375:	49 89 c0             	mov    r8,rax
  802378:	b9 01 00 00 00       	mov    ecx,0x1
  80237d:	ba 00 00 00 00       	mov    edx,0x0
  802382:	be 20 00 00 00       	mov    esi,0x20
  802387:	bf 00 00 00 00       	mov    edi,0x0
  80238c:	e8 7c 74 00 00       	call   80980d <request>
  802391:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802394:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802397:	89 c7                	mov    edi,eax
  802399:	e8 23 7b 00 00       	call   809ec1 <chk_result>

    dpt_t* dpte=buf+0x1be;
  80239e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023a2:	48 05 be 01 00 00    	add    rax,0x1be
  8023a8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8023ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8023b3:	eb 13                	jmp    8023c8 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8023b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023b9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023bc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8023bf:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8023c4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8023c8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8023cc:	7e e7                	jle    8023b5 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8023ce:	b8 00 00 00 00       	mov    eax,0x0
}
  8023d3:	c9                   	leave  
  8023d4:	c3                   	ret    

00000000008023d5 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8023d5:	f3 0f 1e fa          	endbr64 
  8023d9:	55                   	push   rbp
  8023da:	48 89 e5             	mov    rbp,rsp
  8023dd:	48 83 ec 20          	sub    rsp,0x20
  8023e1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8023e5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023e9:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8023ed:	0f b7 c0             	movzx  eax,ax
  8023f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8023f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023f7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023fb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8023fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802402:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802405:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802408:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80240b:	b9 00 02 00 00       	mov    ecx,0x200
  802410:	89 c7                	mov    edi,eax
  802412:	e8 02 00 00 00       	call   802419 <write_block>

}
  802417:	c9                   	leave  
  802418:	c3                   	ret    

0000000000802419 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802419:	f3 0f 1e fa          	endbr64 
  80241d:	55                   	push   rbp
  80241e:	48 89 e5             	mov    rbp,rsp
  802421:	48 83 ec 30          	sub    rsp,0x30
  802425:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802428:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80242b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80242f:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802432:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802435:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802438:	89 d6                	mov    esi,edx
  80243a:	89 c7                	mov    edi,eax
  80243c:	e8 45 fd ff ff       	call   802186 <get_buf>
  802441:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802445:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802448:	ba 00 02 00 00       	mov    edx,0x200
  80244d:	39 d0                	cmp    eax,edx
  80244f:	0f 4f c2             	cmovg  eax,edx
  802452:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802455:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802458:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80245c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80245f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802463:	48 89 ce             	mov    rsi,rcx
  802466:	48 89 c7             	mov    rdi,rax
  802469:	e8 fc aa 00 00       	call   80cf6a <memcpy>
        len-=BLOCK_SIZE;
  80246e:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802475:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802479:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80247d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802481:	48 89 c7             	mov    rdi,rax
  802484:	e8 f2 f9 ff ff       	call   801e7b <brelse>
    }while(len>0);
  802489:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80248d:	7f a3                	jg     802432 <write_block+0x19>
    return 0;
  80248f:	b8 00 00 00 00       	mov    eax,0x0
}
  802494:	c9                   	leave  
  802495:	c3                   	ret    

0000000000802496 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802496:	f3 0f 1e fa          	endbr64 
  80249a:	55                   	push   rbp
  80249b:	48 89 e5             	mov    rbp,rsp
  80249e:	48 83 ec 30          	sub    rsp,0x30
  8024a2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8024a5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8024a8:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8024ac:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8024af:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8024b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024b5:	89 d6                	mov    esi,edx
  8024b7:	89 c7                	mov    edi,eax
  8024b9:	e8 20 fa ff ff       	call   801ede <bread>
  8024be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024c2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8024c5:	ba 00 02 00 00       	mov    edx,0x200
  8024ca:	39 d0                	cmp    eax,edx
  8024cc:	0f 4f c2             	cmovg  eax,edx
  8024cf:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8024d2:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8024d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024d9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8024e0:	48 89 ce             	mov    rsi,rcx
  8024e3:	48 89 c7             	mov    rdi,rax
  8024e6:	e8 7f aa 00 00       	call   80cf6a <memcpy>
        len-=BLOCK_SIZE;
  8024eb:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8024f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024f6:	48 89 c7             	mov    rdi,rax
  8024f9:	e8 7d f9 ff ff       	call   801e7b <brelse>
    }while(len>0);
  8024fe:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802502:	7f ab                	jg     8024af <read_block+0x19>
    return 0;
  802504:	b8 00 00 00 00       	mov    eax,0x0
}
  802509:	c9                   	leave  
  80250a:	c3                   	ret    

000000000080250b <init_vfs>:

int init_vfs()
{
  80250b:	f3 0f 1e fa          	endbr64 
  80250f:	55                   	push   rbp
  802510:	48 89 e5             	mov    rbp,rsp
  802513:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802517:	48 8b 05 62 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f62]        # 408480 <dev_tree>
  80251e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802522:	eb 40                	jmp    802564 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802524:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802528:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80252e:	48 c1 f8 02          	sar    rax,0x2
  802532:	48 89 c2             	mov    rdx,rax
  802535:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80253c:	18 9c 8f 
  80253f:	48 0f af c2          	imul   rax,rdx
  802543:	89 c7                	mov    edi,eax
  802545:	e8 0a fe ff ff       	call   802354 <scan_dev>
  80254a:	85 c0                	test   eax,eax
  80254c:	74 07                	je     802555 <init_vfs+0x4a>
  80254e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802553:	eb 1b                	jmp    802570 <init_vfs+0x65>
    for(;p;p=p->next)
  802555:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802559:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802560:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802564:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802569:	75 b9                	jne    802524 <init_vfs+0x19>
    }

    return 0;
  80256b:	b8 00 00 00 00       	mov    eax,0x0
}
  802570:	c9                   	leave  
  802571:	c3                   	ret    

0000000000802572 <make_dentry>:
};
struct dir_entry_operations dev_dir_dops={

};
static int devd_fd=-1;
void make_dentry(struct dir_entry* d,char* name,int namelen,struct dir_entry* parent,struct dir_entry_operations* dops){
  802572:	f3 0f 1e fa          	endbr64 
  802576:	55                   	push   rbp
  802577:	48 89 e5             	mov    rbp,rsp
  80257a:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80257e:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802582:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  802586:	89 55 9c             	mov    DWORD PTR [rbp-0x64],edx
  802589:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  80258d:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    strcpy(d->name,name);
  802591:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802595:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802598:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  80259c:	48 89 d6             	mov    rsi,rdx
  80259f:	48 89 c7             	mov    rdi,rax
  8025a2:	e8 c1 aa 00 00       	call   80d068 <strcpy>
    d->name_length=namelen;
  8025a7:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025ab:	8b 55 9c             	mov    edx,DWORD PTR [rbp-0x64]
  8025ae:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops=dops;
  8025b1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025b5:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  8025b9:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    list_init(&d->subdirs_list);
  8025bd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025c1:	48 83 c0 28          	add    rax,0x28
  8025c5:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = NULL;
  8025c9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8025cd:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8025d4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8025d8:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8025df:	00 
}
  8025e0:	90                   	nop
    list_init(&d->child_node);
  8025e1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025e5:	48 83 c0 10          	add    rax,0x10
  8025e9:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    list->prev = NULL;
  8025ed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025f1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8025f8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025fc:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  802603:	00 
}
  802604:	90                   	nop
    d->child_node.data=d;
  802605:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802609:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  80260d:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    d->parent=parent;
  802611:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802615:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  802619:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_add(&parent->subdirs_list,&d->child_node);
  80261d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802621:	48 83 c0 10          	add    rax,0x10
  802625:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  802629:	48 83 c2 28          	add    rdx,0x28
  80262d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  802631:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        new->next->prev = new;
    entry->next = new;
}
__attribute__((always_inline)) inline void list_add(struct List * entry,struct List * new)	////add to the tail of the link
{
    if(entry->next==NULL)
  802635:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802639:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80263d:	48 85 c0             	test   rax,rax
  802640:	75 58                	jne    80269a <make_dentry+0x128>
  802642:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802646:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80264a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80264e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    new->next = entry->next;
  802652:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802656:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80265a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80265e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802662:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802666:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80266a:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80266d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802671:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802675:	48 85 c0             	test   rax,rax
  802678:	74 0f                	je     802689 <make_dentry+0x117>
        new->next->prev = new;
  80267a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80267e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802682:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802686:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  802689:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80268d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802691:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802695:	e9 9c 00 00 00       	jmp    802736 <make_dentry+0x1c4>
        list_add_to_behind(entry,new);
    else{
        struct List* p=entry;
  80269a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80269e:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(;p->next&&p->next!=p;p=p->next){
  8026a2:	eb 21                	jmp    8026c5 <make_dentry+0x153>
            if(p->data==new->data)
  8026a4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026a8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8026ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8026b0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8026b4:	48 39 c2             	cmp    rdx,rax
  8026b7:	74 7c                	je     802735 <make_dentry+0x1c3>
        for(;p->next&&p->next!=p;p=p->next){
  8026b9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026bd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026c1:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  8026c5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026c9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026cd:	48 85 c0             	test   rax,rax
  8026d0:	74 0e                	je     8026e0 <make_dentry+0x16e>
  8026d2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026d6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026da:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  8026de:	75 c4                	jne    8026a4 <make_dentry+0x132>
  8026e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026e4:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  8026e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8026ec:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    new->next = entry->next;
  8026f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8026f4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8026f8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026fc:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802700:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  802704:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802708:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80270b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80270f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802713:	48 85 c0             	test   rax,rax
  802716:	74 0f                	je     802727 <make_dentry+0x1b5>
        new->next->prev = new;
  802718:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80271c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802720:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  802724:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  802727:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80272b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80272f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802733:	eb 01                	jmp    802736 <make_dentry+0x1c4>
                return;
  802735:	90                   	nop
}
  802736:	90                   	nop
  802737:	c9                   	leave  
  802738:	c3                   	ret    

0000000000802739 <make_inode>:
void make_inode(struct index_node* i,struct index_node_operations* iops,struct file_operations* fops,unsigned long attr,super_block* sb){
  802739:	f3 0f 1e fa          	endbr64 
  80273d:	55                   	push   rbp
  80273e:	48 89 e5             	mov    rbp,rsp
  802741:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802745:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  802749:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80274d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  802751:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    i->f_ops=fops;
  802755:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802759:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80275d:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    i->attribute=attr;
  802761:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802765:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802769:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    i->sb=sb;
  80276d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802771:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802775:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    i->file_size=0;
  802779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80277d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    i->inode_ops=iops;
  802784:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802788:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80278c:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
}
  802790:	90                   	nop
  802791:	5d                   	pop    rbp
  802792:	c3                   	ret    

0000000000802793 <make_devf>:
void make_devf(struct dir_entry* d,struct index_node* i,char* name,struct dir_entry* ddev,struct file_operations* fops){
  802793:	f3 0f 1e fa          	endbr64 
  802797:	55                   	push   rbp
  802798:	48 89 e5             	mov    rbp,rsp
  80279b:	53                   	push   rbx
  80279c:	48 83 ec 78          	sub    rsp,0x78
  8027a0:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8027a4:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  8027a8:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8027ac:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  8027b0:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    make_dentry(d,name, strlen(name),root_sb->root,&dev_dir_dops);
  8027b4:	48 8b 05 8d 5b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25b8d]        # 428348 <root_sb>
  8027bb:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  8027be:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8027c2:	48 89 c7             	mov    rdi,rax
  8027c5:	e8 bd aa 00 00       	call   80d287 <strlen>
  8027ca:	89 c2                	mov    edx,eax
  8027cc:	48 8b 75 98          	mov    rsi,QWORD PTR [rbp-0x68]
  8027d0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027d4:	41 b8 a0 84 40 00    	mov    r8d,0x4084a0
  8027da:	48 89 d9             	mov    rcx,rbx
  8027dd:	48 89 c7             	mov    rdi,rax
  8027e0:	e8 8d fd ff ff       	call   802572 <make_dentry>
    d->dir_inode=i;
  8027e5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027e9:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8027ed:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(i,ddev->dir_inode->inode_ops,fops,FS_ATTR_DEVICE,root_sb);
  8027f1:	48 8b 0d 50 5b c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25b50]        # 428348 <root_sb>
  8027f8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8027fc:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802800:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  802804:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  802808:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80280c:	49 89 c8             	mov    r8,rcx
  80280f:	b9 04 00 00 00       	mov    ecx,0x4
  802814:	48 89 c7             	mov    rdi,rax
  802817:	e8 1d ff ff ff       	call   802739 <make_inode>
    list_add(&ddev->subdirs_list,&d->child_node);//添加到/dev下
  80281c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802820:	48 83 c0 10          	add    rax,0x10
  802824:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  802828:	48 83 c2 28          	add    rdx,0x28
  80282c:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  802830:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(entry->next==NULL)
  802834:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802838:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80283c:	48 85 c0             	test   rax,rax
  80283f:	75 58                	jne    802899 <make_devf+0x106>
  802841:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802845:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  802849:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80284d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    new->next = entry->next;
  802851:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802855:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802859:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80285d:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802861:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802865:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802869:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80286c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802870:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802874:	48 85 c0             	test   rax,rax
  802877:	74 0f                	je     802888 <make_devf+0xf5>
        new->next->prev = new;
  802879:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80287d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802881:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802885:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  802888:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80288c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802890:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802894:	e9 9c 00 00 00       	jmp    802935 <make_devf+0x1a2>
        struct List* p=entry;
  802899:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80289d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
        for(;p->next&&p->next!=p;p=p->next){
  8028a1:	eb 21                	jmp    8028c4 <make_devf+0x131>
            if(p->data==new->data)
  8028a3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028a7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8028ab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028af:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8028b3:	48 39 c2             	cmp    rdx,rax
  8028b6:	74 7c                	je     802934 <make_devf+0x1a1>
        for(;p->next&&p->next!=p;p=p->next){
  8028b8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028bc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028c0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  8028c4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028cc:	48 85 c0             	test   rax,rax
  8028cf:	74 0e                	je     8028df <make_devf+0x14c>
  8028d1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028d5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028d9:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  8028dd:	75 c4                	jne    8028a3 <make_devf+0x110>
  8028df:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028e3:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8028e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028eb:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    new->next = entry->next;
  8028ef:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8028f3:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8028f7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028fb:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8028ff:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  802903:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  802907:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80290a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80290e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802912:	48 85 c0             	test   rax,rax
  802915:	74 0f                	je     802926 <make_devf+0x193>
        new->next->prev = new;
  802917:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80291b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80291f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  802923:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  802926:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80292a:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80292e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802932:	eb 01                	jmp    802935 <make_devf+0x1a2>
                return;
  802934:	90                   	nop
}
  802935:	90                   	nop
  802936:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80293a:	c9                   	leave  
  80293b:	c3                   	ret    

000000000080293c <init_devman>:
 * 这个/dev文件夹的dentry和inode等数据由devman管理，根文件系统切换时，这个文件夹会跟着挂载到新文件系统的根目录下。
 * */
struct dir_entry* ddev=NULL,*dmnt,*dconsole,*dhd0,*dtty;
struct file ftty;
int init_devman()
{
  80293c:	f3 0f 1e fa          	endbr64 
  802940:	55                   	push   rbp
  802941:	48 89 e5             	mov    rbp,rsp
  802944:	48 83 ec 30          	sub    rsp,0x30
    //创建dev文件夹
    ddev=(struct dir_entry*)vmalloc();
  802948:	b8 00 00 00 00       	mov    eax,0x0
  80294d:	e8 fb e8 ff ff       	call   80124d <vmalloc>
  802952:	48 89 05 67 5b c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05b67],rax        # 4084c0 <ddev>
    struct index_node* idev=ddev+1;
  802959:	48 8b 05 60 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b60]        # 4084c0 <ddev>
  802960:	48 83 c0 58          	add    rax,0x58
  802964:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ddev->name=idev+1;
  802968:	48 8b 05 51 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b51]        # 4084c0 <ddev>
  80296f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802973:	48 83 c2 38          	add    rdx,0x38
  802977:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(ddev,"dev",3,root_sb->root,root_sb->root->dir_ops);
  80297a:	48 8b 05 c7 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259c7]        # 428348 <root_sb>
  802981:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802984:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802988:	48 8b 05 b9 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259b9]        # 428348 <root_sb>
  80298f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802992:	48 8b 05 27 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b27]        # 4084c0 <ddev>
  802999:	49 89 c8             	mov    r8,rcx
  80299c:	48 89 d1             	mov    rcx,rdx
  80299f:	ba 03 00 00 00       	mov    edx,0x3
  8029a4:	be 08 56 81 00       	mov    esi,0x815608
  8029a9:	48 89 c7             	mov    rdi,rax
  8029ac:	e8 c1 fb ff ff       	call   802572 <make_dentry>
    ddev->dir_inode=idev;
  8029b1:	48 8b 05 08 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b08]        # 4084c0 <ddev>
  8029b8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8029bc:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(idev,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  8029c0:	48 8b 0d 81 59 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25981]        # 428348 <root_sb>
  8029c7:	48 8b 05 7a 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2597a]        # 428348 <root_sb>
  8029ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029d1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8029d5:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8029d9:	48 8b 05 68 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25968]        # 428348 <root_sb>
  8029e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029e3:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8029e7:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8029eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029ef:	49 89 c8             	mov    r8,rcx
  8029f2:	b9 02 00 00 00       	mov    ecx,0x2
  8029f7:	48 89 c7             	mov    rdi,rax
  8029fa:	e8 3a fd ff ff       	call   802739 <make_inode>
    idev->private_index_info=ddev;
  8029ff:	48 8b 15 ba 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05aba]        # 4084c0 <ddev>
  802a06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a0a:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    //创建mnt文件夹
    dmnt=(struct dir_entry*)vmalloc();
  802a0e:	b8 00 00 00 00       	mov    eax,0x0
  802a13:	e8 35 e8 ff ff       	call   80124d <vmalloc>
  802a18:	48 89 05 a9 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05aa9],rax        # 4084c8 <dmnt>
    struct index_node* imnt=dmnt+1;
  802a1f:	48 8b 05 a2 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05aa2]        # 4084c8 <dmnt>
  802a26:	48 83 c0 58          	add    rax,0x58
  802a2a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dmnt->name=imnt+1;
  802a2e:	48 8b 05 93 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a93]        # 4084c8 <dmnt>
  802a35:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802a39:	48 83 c2 38          	add    rdx,0x38
  802a3d:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(dmnt,"mnt",3,root_sb->root,root_sb->root->dir_ops);
  802a40:	48 8b 05 01 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25901]        # 428348 <root_sb>
  802a47:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a4a:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a4e:	48 8b 05 f3 58 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc258f3]        # 428348 <root_sb>
  802a55:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802a58:	48 8b 05 69 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a69]        # 4084c8 <dmnt>
  802a5f:	49 89 c8             	mov    r8,rcx
  802a62:	48 89 d1             	mov    rcx,rdx
  802a65:	ba 03 00 00 00       	mov    edx,0x3
  802a6a:	be 0c 56 81 00       	mov    esi,0x81560c
  802a6f:	48 89 c7             	mov    rdi,rax
  802a72:	e8 fb fa ff ff       	call   802572 <make_dentry>
    dmnt->dir_inode=imnt;
  802a77:	48 8b 05 4a 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a4a]        # 4084c8 <dmnt>
  802a7e:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802a82:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(imnt,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  802a86:	48 8b 0d bb 58 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc258bb]        # 428348 <root_sb>
  802a8d:	48 8b 05 b4 58 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc258b4]        # 428348 <root_sb>
  802a94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a97:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802a9b:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802a9f:	48 8b 05 a2 58 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc258a2]        # 428348 <root_sb>
  802aa6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802aa9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802aad:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  802ab1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ab5:	49 89 c8             	mov    r8,rcx
  802ab8:	b9 02 00 00 00       	mov    ecx,0x2
  802abd:	48 89 c7             	mov    rdi,rax
  802ac0:	e8 74 fc ff ff       	call   802739 <make_inode>
    imnt->private_index_info=dmnt;
  802ac5:	48 8b 15 fc 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc059fc]        # 4084c8 <dmnt>
  802acc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ad0:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx


    //创建几个设备文件
    //console-framebuffer.c
    dconsole= (struct dir_entry *) vmalloc();
  802ad4:	b8 00 00 00 00       	mov    eax,0x0
  802ad9:	e8 6f e7 ff ff       	call   80124d <vmalloc>
  802ade:	48 89 05 eb 59 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc059eb],rax        # 4084d0 <dconsole>
    struct index_node* iconsole=dconsole+1;
  802ae5:	48 8b 05 e4 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059e4]        # 4084d0 <dconsole>
  802aec:	48 83 c0 58          	add    rax,0x58
  802af0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dconsole->name=iconsole+1;
  802af4:	48 8b 05 d5 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059d5]        # 4084d0 <dconsole>
  802afb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802aff:	48 83 c2 38          	add    rdx,0x38
  802b03:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dconsole,iconsole,"console",ddev,&framebuffer_fops);
  802b06:	48 8b 15 b3 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc059b3]        # 4084c0 <ddev>
  802b0d:	48 8b 05 bc 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059bc]        # 4084d0 <dconsole>
  802b14:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802b18:	41 b8 40 da 80 00    	mov    r8d,0x80da40
  802b1e:	48 89 d1             	mov    rcx,rdx
  802b21:	ba 10 56 81 00       	mov    edx,0x815610
  802b26:	48 89 c7             	mov    rdi,rax
  802b29:	e8 65 fc ff ff       	call   802793 <make_devf>
    //hd0-disk.c
    dhd0= (struct dir_entry *) vmalloc();
  802b2e:	b8 00 00 00 00       	mov    eax,0x0
  802b33:	e8 15 e7 ff ff       	call   80124d <vmalloc>
  802b38:	48 89 05 99 59 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05999],rax        # 4084d8 <dhd0>
    struct index_node* ihd0=dhd0+1;
  802b3f:	48 8b 05 92 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05992]        # 4084d8 <dhd0>
  802b46:	48 83 c0 58          	add    rax,0x58
  802b4a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    dhd0->name=ihd0+1;
  802b4e:	48 8b 05 83 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05983]        # 4084d8 <dhd0>
  802b55:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802b59:	48 83 c2 38          	add    rdx,0x38
  802b5d:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dhd0,ihd0,"hd0",ddev,&hd_fops);
  802b60:	48 8b 15 59 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05959]        # 4084c0 <ddev>
  802b67:	48 8b 05 6a 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0596a]        # 4084d8 <dhd0>
  802b6e:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802b72:	41 b8 80 85 42 00    	mov    r8d,0x428580
  802b78:	48 89 d1             	mov    rcx,rdx
  802b7b:	ba 18 56 81 00       	mov    edx,0x815618
  802b80:	48 89 c7             	mov    rdi,rax
  802b83:	e8 0b fc ff ff       	call   802793 <make_devf>
    //tty-tty.c
    dtty= (struct dir_entry *) vmalloc();
  802b88:	b8 00 00 00 00       	mov    eax,0x0
  802b8d:	e8 bb e6 ff ff       	call   80124d <vmalloc>
  802b92:	48 89 05 47 59 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05947],rax        # 4084e0 <dtty>
    struct index_node* itty=dtty+1;
  802b99:	48 8b 05 40 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05940]        # 4084e0 <dtty>
  802ba0:	48 83 c0 58          	add    rax,0x58
  802ba4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    dtty->name=itty+1;
  802ba8:	48 8b 05 31 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05931]        # 4084e0 <dtty>
  802baf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802bb3:	48 83 c2 38          	add    rdx,0x38
  802bb7:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dtty,itty,"tty",ddev,&tty_fops);
  802bba:	48 8b 15 ff 58 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc058ff]        # 4084c0 <ddev>
  802bc1:	48 8b 05 18 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05918]        # 4084e0 <dtty>
  802bc8:	48 8b 75 d8          	mov    rsi,QWORD PTR [rbp-0x28]
  802bcc:	41 b8 40 dd 80 00    	mov    r8d,0x80dd40
  802bd2:	48 89 d1             	mov    rcx,rdx
  802bd5:	ba 1c 56 81 00       	mov    edx,0x81561c
  802bda:	48 89 c7             	mov    rdi,rax
  802bdd:	e8 b1 fb ff ff       	call   802793 <make_devf>
    //初始化一下
    tty_fops.open(itty,&ftty);
  802be2:	48 8b 15 57 b1 00 00 	mov    rdx,QWORD PTR [rip+0xb157]        # 80dd40 <tty_fops>
  802be9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bed:	be 00 85 40 00       	mov    esi,0x408500
  802bf2:	48 89 c7             	mov    rdi,rax
  802bf5:	ff d2                	call   rdx

}
  802bf7:	90                   	nop
  802bf8:	c9                   	leave  
  802bf9:	c3                   	ret    

0000000000802bfa <open_dev>:
//
long open_dev(struct index_node * inode,struct file * filp){
  802bfa:	f3 0f 1e fa          	endbr64 
  802bfe:	55                   	push   rbp
  802bff:	48 89 e5             	mov    rbp,rsp
  802c02:	48 83 ec 20          	sub    rsp,0x20
  802c06:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802c0a:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802c0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c12:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802c16:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c19:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802c1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c21:	48 89 c7             	mov    rdi,rax
  802c24:	e8 5e a6 00 00       	call   80d287 <strlen>
  802c29:	48 98                	cdqe   
  802c2b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c33:	48 01 d0             	add    rax,rdx
  802c36:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802c3a:	eb 05                	jmp    802c41 <open_dev+0x47>
  802c3c:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802c41:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c45:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802c48:	3c 2f                	cmp    al,0x2f
  802c4a:	74 0a                	je     802c56 <open_dev+0x5c>
  802c4c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c50:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c54:	73 e6                	jae    802c3c <open_dev+0x42>
    if(p>=name)
  802c56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c5a:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c5e:	72 0c                	jb     802c6c <open_dev+0x72>
        name=p+1;
  802c60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c64:	48 83 c0 01          	add    rax,0x1
  802c68:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802c6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c70:	ba 03 00 00 00       	mov    edx,0x3
  802c75:	be 1c 56 81 00       	mov    esi,0x81561c
  802c7a:	48 89 c7             	mov    rdi,rax
  802c7d:	e8 32 a3 00 00       	call   80cfb4 <memcmp>
  802c82:	85 c0                	test   eax,eax
  802c84:	75 15                	jne    802c9b <open_dev+0xa1>
        return init_tty(inode,filp);
  802c86:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c8a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c8e:	48 89 d6             	mov    rsi,rdx
  802c91:	48 89 c7             	mov    rdi,rax
  802c94:	e8 a3 9c 00 00       	call   80c93c <init_tty>
  802c99:	eb 31                	jmp    802ccc <open_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802c9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c9f:	be 10 56 81 00       	mov    esi,0x815610
  802ca4:	48 89 c7             	mov    rdi,rax
  802ca7:	e8 5c a5 00 00       	call   80d208 <strcmp>
  802cac:	85 c0                	test   eax,eax
  802cae:	75 15                	jne    802cc5 <open_dev+0xcb>
        return open_framebuffer(inode,filp);
  802cb0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802cb4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cb8:	48 89 d6             	mov    rsi,rdx
  802cbb:	48 89 c7             	mov    rdi,rax
  802cbe:	e8 2a 50 00 00       	call   807ced <open_framebuffer>
  802cc3:	eb 07                	jmp    802ccc <open_dev+0xd2>
    }
    return -1;
  802cc5:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
}
  802ccc:	c9                   	leave  
  802ccd:	c3                   	ret    

0000000000802cce <close_dev>:
long close_dev(struct index_node * inode,struct file * filp){
  802cce:	f3 0f 1e fa          	endbr64 
  802cd2:	55                   	push   rbp
  802cd3:	48 89 e5             	mov    rbp,rsp
  802cd6:	48 83 ec 20          	sub    rsp,0x20
  802cda:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802cde:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802ce2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ce6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802cea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ced:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802cf1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802cf5:	48 89 c7             	mov    rdi,rax
  802cf8:	e8 8a a5 00 00       	call   80d287 <strlen>
  802cfd:	48 98                	cdqe   
  802cff:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802d03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d07:	48 01 d0             	add    rax,rdx
  802d0a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802d0e:	eb 05                	jmp    802d15 <close_dev+0x47>
  802d10:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802d15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802d1c:	3c 2f                	cmp    al,0x2f
  802d1e:	74 0a                	je     802d2a <close_dev+0x5c>
  802d20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d24:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d28:	73 e6                	jae    802d10 <close_dev+0x42>
    if(p>=name)
  802d2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d2e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d32:	72 0c                	jb     802d40 <close_dev+0x72>
        name=p+1;
  802d34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d38:	48 83 c0 01          	add    rax,0x1
  802d3c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802d40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d44:	ba 03 00 00 00       	mov    edx,0x3
  802d49:	be 1c 56 81 00       	mov    esi,0x81561c
  802d4e:	48 89 c7             	mov    rdi,rax
  802d51:	e8 5e a2 00 00       	call   80cfb4 <memcmp>
  802d56:	85 c0                	test   eax,eax
  802d58:	75 15                	jne    802d6f <close_dev+0xa1>
        return close_tty(inode,filp);
  802d5a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802d5e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d62:	48 89 d6             	mov    rsi,rdx
  802d65:	48 89 c7             	mov    rdi,rax
  802d68:	e8 54 9b 00 00       	call   80c8c1 <close_tty>
  802d6d:	eb 31                	jmp    802da0 <close_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802d6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d73:	be 10 56 81 00       	mov    esi,0x815610
  802d78:	48 89 c7             	mov    rdi,rax
  802d7b:	e8 88 a4 00 00       	call   80d208 <strcmp>
  802d80:	85 c0                	test   eax,eax
  802d82:	75 15                	jne    802d99 <close_dev+0xcb>
        return close_framebuffer(inode,filp);
  802d84:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802d88:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d8c:	48 89 d6             	mov    rsi,rdx
  802d8f:	48 89 c7             	mov    rdi,rax
  802d92:	e8 85 4f 00 00       	call   807d1c <close_framebuffer>
  802d97:	eb 07                	jmp    802da0 <close_dev+0xd2>
    }
    return -1;
  802d99:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802da0:	c9                   	leave  
  802da1:	c3                   	ret    

0000000000802da2 <read_dev>:
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802da2:	f3 0f 1e fa          	endbr64 
  802da6:	55                   	push   rbp
  802da7:	48 89 e5             	mov    rbp,rsp
  802daa:	48 83 ec 30          	sub    rsp,0x30
  802dae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802db2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802db6:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802dba:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802dbe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802dc2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802dc6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802dc9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802dcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802dd1:	48 89 c7             	mov    rdi,rax
  802dd4:	e8 ae a4 00 00       	call   80d287 <strlen>
  802dd9:	48 98                	cdqe   
  802ddb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ddf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802de3:	48 01 d0             	add    rax,rdx
  802de6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802dea:	eb 05                	jmp    802df1 <read_dev+0x4f>
  802dec:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802df1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802df5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802df8:	3c 2f                	cmp    al,0x2f
  802dfa:	74 0a                	je     802e06 <read_dev+0x64>
  802dfc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e00:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e04:	73 e6                	jae    802dec <read_dev+0x4a>
    if(p>=name)
  802e06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e0a:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e0e:	72 0c                	jb     802e1c <read_dev+0x7a>
        name=p+1;
  802e10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e14:	48 83 c0 01          	add    rax,0x1
  802e18:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802e1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e20:	ba 03 00 00 00       	mov    edx,0x3
  802e25:	be 1c 56 81 00       	mov    esi,0x81561c
  802e2a:	48 89 c7             	mov    rdi,rax
  802e2d:	e8 82 a1 00 00       	call   80cfb4 <memcmp>
  802e32:	85 c0                	test   eax,eax
  802e34:	75 1a                	jne    802e50 <read_dev+0xae>
        return read_tty(filp,buf,count,position);
  802e36:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e3a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e3e:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e42:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e46:	48 89 c7             	mov    rdi,rax
  802e49:	e8 dc 9b 00 00       	call   80ca2a <read_tty>
  802e4e:	eb 36                	jmp    802e86 <read_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802e50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e54:	be 10 56 81 00       	mov    esi,0x815610
  802e59:	48 89 c7             	mov    rdi,rax
  802e5c:	e8 a7 a3 00 00       	call   80d208 <strcmp>
  802e61:	85 c0                	test   eax,eax
  802e63:	75 1a                	jne    802e7f <read_dev+0xdd>
        return read_framebuffer(filp,buf,count,position);
  802e65:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e69:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e6d:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e75:	48 89 c7             	mov    rdi,rax
  802e78:	e8 b2 4e 00 00       	call   807d2f <read_framebuffer>
  802e7d:	eb 07                	jmp    802e86 <read_dev+0xe4>
    }
    return -1;
  802e7f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802e86:	c9                   	leave  
  802e87:	c3                   	ret    

0000000000802e88 <write_dev>:
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802e88:	f3 0f 1e fa          	endbr64 
  802e8c:	55                   	push   rbp
  802e8d:	48 89 e5             	mov    rbp,rsp
  802e90:	48 83 ec 30          	sub    rsp,0x30
  802e94:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e98:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802e9c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802ea0:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802ea4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ea8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802eac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802eaf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802eb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802eb7:	48 89 c7             	mov    rdi,rax
  802eba:	e8 c8 a3 00 00       	call   80d287 <strlen>
  802ebf:	48 98                	cdqe   
  802ec1:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ec5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ec9:	48 01 d0             	add    rax,rdx
  802ecc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802ed0:	eb 05                	jmp    802ed7 <write_dev+0x4f>
  802ed2:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802ed7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802edb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802ede:	3c 2f                	cmp    al,0x2f
  802ee0:	74 0a                	je     802eec <write_dev+0x64>
  802ee2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ee6:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802eea:	73 e6                	jae    802ed2 <write_dev+0x4a>
    if(p>=name)
  802eec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ef0:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802ef4:	72 0c                	jb     802f02 <write_dev+0x7a>
        name=p+1;
  802ef6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802efa:	48 83 c0 01          	add    rax,0x1
  802efe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802f02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f06:	ba 03 00 00 00       	mov    edx,0x3
  802f0b:	be 1c 56 81 00       	mov    esi,0x81561c
  802f10:	48 89 c7             	mov    rdi,rax
  802f13:	e8 9c a0 00 00       	call   80cfb4 <memcmp>
  802f18:	85 c0                	test   eax,eax
  802f1a:	75 1a                	jne    802f36 <write_dev+0xae>
        return write_tty(filp,buf,count,position);
  802f1c:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f20:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f24:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f2c:	48 89 c7             	mov    rdi,rax
  802f2f:	e8 a3 9b 00 00       	call   80cad7 <write_tty>
  802f34:	eb 36                	jmp    802f6c <write_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802f36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f3a:	be 10 56 81 00       	mov    esi,0x815610
  802f3f:	48 89 c7             	mov    rdi,rax
  802f42:	e8 c1 a2 00 00       	call   80d208 <strcmp>
  802f47:	85 c0                	test   eax,eax
  802f49:	75 1a                	jne    802f65 <write_dev+0xdd>
        return write_framebuffer(filp,buf,count,position);
  802f4b:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f4f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f53:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f57:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f5b:	48 89 c7             	mov    rdi,rax
  802f5e:	e8 e7 4d 00 00       	call   807d4a <write_framebuffer>
  802f63:	eb 07                	jmp    802f6c <write_dev+0xe4>
    }
    return -1;
  802f65:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802f6c:	c9                   	leave  
  802f6d:	c3                   	ret    

0000000000802f6e <ioctl_dev>:
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  802f6e:	f3 0f 1e fa          	endbr64 
  802f72:	55                   	push   rbp
  802f73:	48 89 e5             	mov    rbp,rsp
  802f76:	48 83 ec 30          	sub    rsp,0x30
  802f7a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f7e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802f82:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802f86:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802f8a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802f8e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802f92:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f95:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802f99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f9d:	48 89 c7             	mov    rdi,rax
  802fa0:	e8 e2 a2 00 00       	call   80d287 <strlen>
  802fa5:	48 98                	cdqe   
  802fa7:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802fab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802faf:	48 01 d0             	add    rax,rdx
  802fb2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802fb6:	eb 05                	jmp    802fbd <ioctl_dev+0x4f>
  802fb8:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802fbd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fc1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802fc4:	3c 2f                	cmp    al,0x2f
  802fc6:	74 0a                	je     802fd2 <ioctl_dev+0x64>
  802fc8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fcc:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802fd0:	73 e6                	jae    802fb8 <ioctl_dev+0x4a>
    if(p>=name)
  802fd2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fd6:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802fda:	72 0c                	jb     802fe8 <ioctl_dev+0x7a>
        name=p+1;
  802fdc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fe0:	48 83 c0 01          	add    rax,0x1
  802fe4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802fe8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802fec:	ba 03 00 00 00       	mov    edx,0x3
  802ff1:	be 1c 56 81 00       	mov    esi,0x81561c
  802ff6:	48 89 c7             	mov    rdi,rax
  802ff9:	e8 b6 9f 00 00       	call   80cfb4 <memcmp>
  802ffe:	85 c0                	test   eax,eax
  803000:	75 1a                	jne    80301c <ioctl_dev+0xae>
        return ioctl_tty(inode, filp, cmd, arg);
  803002:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  803006:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80300a:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80300e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803012:	48 89 c7             	mov    rdi,rax
  803015:	e8 85 9b 00 00       	call   80cb9f <ioctl_tty>
  80301a:	eb 36                	jmp    803052 <ioctl_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  80301c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803020:	be 10 56 81 00       	mov    esi,0x815610
  803025:	48 89 c7             	mov    rdi,rax
  803028:	e8 db a1 00 00       	call   80d208 <strcmp>
  80302d:	85 c0                	test   eax,eax
  80302f:	75 1a                	jne    80304b <ioctl_dev+0xdd>
        return ioctl_framebuffer(inode,filp,cmd,arg);
  803031:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  803035:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803039:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80303d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803041:	48 89 c7             	mov    rdi,rax
  803044:	e8 d0 4d 00 00       	call   807e19 <ioctl_framebuffer>
  803049:	eb 07                	jmp    803052 <ioctl_dev+0xe4>
    }
    return -1;
  80304b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  803052:	c9                   	leave  
  803053:	c3                   	ret    

0000000000803054 <load_driver>:
int load_driver(char *path)
{
  803054:	f3 0f 1e fa          	endbr64 
  803058:	55                   	push   rbp
  803059:	48 89 e5             	mov    rbp,rsp
  80305c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  803060:	90                   	nop
  803061:	5d                   	pop    rbp
  803062:	c3                   	ret    

0000000000803063 <reg_device>:

int reg_device(device* dev)
{
  803063:	f3 0f 1e fa          	endbr64 
  803067:	55                   	push   rbp
  803068:	48 89 e5             	mov    rbp,rsp
  80306b:	53                   	push   rbx
  80306c:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  803070:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  803077:	e9 42 01 00 00       	jmp    8031be <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  80307c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80307f:	48 63 d0             	movsxd rdx,eax
  803082:	48 89 d0             	mov    rax,rdx
  803085:	48 c1 e0 02          	shl    rax,0x2
  803089:	48 01 d0             	add    rax,rdx
  80308c:	48 c1 e0 02          	shl    rax,0x2
  803090:	48 01 d0             	add    rax,rdx
  803093:	48 c1 e0 03          	shl    rax,0x3
  803097:	48 05 90 2e 40 00    	add    rax,0x402e90
  80309d:	8b 00                	mov    eax,DWORD PTR [rax]
  80309f:	85 c0                	test   eax,eax
  8030a1:	0f 85 13 01 00 00    	jne    8031ba <reg_device+0x157>
        {
            devs[i]=*dev;
  8030a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030aa:	48 63 d0             	movsxd rdx,eax
  8030ad:	48 89 d0             	mov    rax,rdx
  8030b0:	48 c1 e0 02          	shl    rax,0x2
  8030b4:	48 01 d0             	add    rax,rdx
  8030b7:	48 c1 e0 02          	shl    rax,0x2
  8030bb:	48 01 d0             	add    rax,rdx
  8030be:	48 c1 e0 03          	shl    rax,0x3
  8030c2:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  8030c9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8030cd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8030d0:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8030d4:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8030d7:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8030db:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8030df:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8030e3:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8030e7:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8030eb:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8030ef:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8030f3:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8030f7:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8030fb:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8030ff:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803103:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803107:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80310b:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80310f:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803113:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803117:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80311b:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80311f:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803123:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803127:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80312b:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80312f:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803133:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803137:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80313b:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80313f:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803143:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803147:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80314b:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803152:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803159:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803160:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803167:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80316e:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803175:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80317c:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803183:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  80318a:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  803191:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803194:	48 63 d0             	movsxd rdx,eax
  803197:	48 89 d0             	mov    rax,rdx
  80319a:	48 c1 e0 02          	shl    rax,0x2
  80319e:	48 01 d0             	add    rax,rdx
  8031a1:	48 c1 e0 02          	shl    rax,0x2
  8031a5:	48 01 d0             	add    rax,rdx
  8031a8:	48 c1 e0 03          	shl    rax,0x3
  8031ac:	48 05 90 2e 40 00    	add    rax,0x402e90
  8031b2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  8031b8:	eb 0e                	jmp    8031c8 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  8031ba:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8031be:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  8031c2:	0f 8e b4 fe ff ff    	jle    80307c <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  8031c8:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  8031cc:	75 0a                	jne    8031d8 <reg_device+0x175>
        return -1;
  8031ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8031d3:	e9 6d 01 00 00       	jmp    803345 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  8031d8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8031df:	00 
  8031e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8031e3:	48 63 d0             	movsxd rdx,eax
  8031e6:	48 89 d0             	mov    rax,rdx
  8031e9:	48 c1 e0 02          	shl    rax,0x2
  8031ed:	48 01 d0             	add    rax,rdx
  8031f0:	48 c1 e0 02          	shl    rax,0x2
  8031f4:	48 01 d0             	add    rax,rdx
  8031f7:	48 c1 e0 03          	shl    rax,0x3
  8031fb:	48 05 80 2e 40 00    	add    rax,0x402e80
  803201:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  803205:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803209:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80320c:	83 f8 03             	cmp    eax,0x3
  80320f:	74 3b                	je     80324c <reg_device+0x1e9>
  803211:	83 f8 03             	cmp    eax,0x3
  803214:	7f 4b                	jg     803261 <reg_device+0x1fe>
  803216:	83 f8 01             	cmp    eax,0x1
  803219:	74 07                	je     803222 <reg_device+0x1bf>
  80321b:	83 f8 02             	cmp    eax,0x2
  80321e:	74 17                	je     803237 <reg_device+0x1d4>
  803220:	eb 3f                	jmp    803261 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  803222:	48 8b 05 57 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05257]        # 408480 <dev_tree>
  803229:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80322d:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  803234:	00 
        break;
  803235:	eb 34                	jmp    80326b <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  803237:	48 8b 05 4a 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0524a]        # 408488 <dev_tree+0x8>
  80323e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803242:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  803249:	00 
        break;
  80324a:	eb 1f                	jmp    80326b <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  80324c:	48 8b 05 3d 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0523d]        # 408490 <dev_tree+0x10>
  803253:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803257:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  80325e:	00 
        break;
  80325f:	eb 0a                	jmp    80326b <reg_device+0x208>
    default:return -1;//不可能有其他情况
  803261:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803266:	e9 da 00 00 00       	jmp    803345 <reg_device+0x2e2>
    }
    if(!p){
  80326b:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  803270:	75 2b                	jne    80329d <reg_device+0x23a>
        *pp=neo;
  803272:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803276:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80327a:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  80327d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803281:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  803288:	00 00 00 00 
  80328c:	eb 3d                	jmp    8032cb <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  80328e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803292:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803299:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80329d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8032a1:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8032a8:	48 85 c0             	test   rax,rax
  8032ab:	75 e1                	jne    80328e <reg_device+0x22b>
        p->next=neo;
  8032ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8032b1:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8032b5:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  8032bc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032c0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8032c4:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  8032cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032cf:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  8032d6:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  8032da:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032de:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8032e1:	83 f8 04             	cmp    eax,0x4
  8032e4:	74 3b                	je     803321 <reg_device+0x2be>
  8032e6:	83 f8 04             	cmp    eax,0x4
  8032e9:	7f 56                	jg     803341 <reg_device+0x2de>
  8032eb:	83 f8 03             	cmp    eax,0x3
  8032ee:	74 21                	je     803311 <reg_device+0x2ae>
  8032f0:	83 f8 03             	cmp    eax,0x3
  8032f3:	7f 4c                	jg     803341 <reg_device+0x2de>
  8032f5:	83 f8 01             	cmp    eax,0x1
  8032f8:	74 07                	je     803301 <reg_device+0x29e>
  8032fa:	83 f8 02             	cmp    eax,0x2
  8032fd:	74 32                	je     803331 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  8032ff:	eb 40                	jmp    803341 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  803301:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803305:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  80330c:	00 00 00 
        break;
  80330f:	eb 31                	jmp    803342 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  803311:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803315:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  80331c:	00 00 00 
        break;
  80331f:	eb 21                	jmp    803342 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  803321:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803325:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  80332c:	00 00 00 
        break;
  80332f:	eb 11                	jmp    803342 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  803331:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803335:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  80333c:	00 00 00 
        break;
  80333f:	eb 01                	jmp    803342 <reg_device+0x2df>
        break;
  803341:	90                   	nop
    }
    return i;
  803342:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803345:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803349:	c9                   	leave  
  80334a:	c3                   	ret    

000000000080334b <reg_driver>:


int reg_driver(driver *drv)
{
  80334b:	f3 0f 1e fa          	endbr64 
  80334f:	55                   	push   rbp
  803350:	48 89 e5             	mov    rbp,rsp
  803353:	53                   	push   rbx
  803354:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  803358:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80335f:	e9 22 01 00 00       	jmp    803486 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  803364:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803367:	48 63 d0             	movsxd rdx,eax
  80336a:	48 89 d0             	mov    rax,rdx
  80336d:	48 c1 e0 02          	shl    rax,0x2
  803371:	48 01 d0             	add    rax,rdx
  803374:	48 c1 e0 05          	shl    rax,0x5
  803378:	48 05 80 58 40 00    	add    rax,0x405880
  80337e:	8b 00                	mov    eax,DWORD PTR [rax]
  803380:	85 c0                	test   eax,eax
  803382:	0f 85 fa 00 00 00    	jne    803482 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  803388:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80338b:	48 63 d0             	movsxd rdx,eax
  80338e:	48 89 d0             	mov    rax,rdx
  803391:	48 c1 e0 02          	shl    rax,0x2
  803395:	48 01 d0             	add    rax,rdx
  803398:	48 c1 e0 05          	shl    rax,0x5
  80339c:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  8033a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8033a7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8033aa:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8033ae:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8033b1:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8033b5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8033b9:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8033bd:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8033c1:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8033c5:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8033c9:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8033cd:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8033d1:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8033d5:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8033d9:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8033dd:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8033e1:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8033e5:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8033e9:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8033ed:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8033f1:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8033f5:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8033f9:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8033fd:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803401:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803405:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803409:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80340d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803411:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803415:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803419:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80341d:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803421:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803425:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80342c:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803433:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80343a:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803441:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803448:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80344f:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803456:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  80345d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803460:	48 63 d0             	movsxd rdx,eax
  803463:	48 89 d0             	mov    rax,rdx
  803466:	48 c1 e0 02          	shl    rax,0x2
  80346a:	48 01 d0             	add    rax,rdx
  80346d:	48 c1 e0 05          	shl    rax,0x5
  803471:	48 05 80 58 40 00    	add    rax,0x405880
  803477:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  80347d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803480:	eb 13                	jmp    803495 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  803482:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803486:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80348a:	0f 8e d4 fe ff ff    	jle    803364 <reg_driver+0x19>
        }
    }
    return -1;
  803490:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803495:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803499:	c9                   	leave  
  80349a:	c3                   	ret    

000000000080349b <sys_find_dev>:

int sys_find_dev(char *name)
{
  80349b:	f3 0f 1e fa          	endbr64 
  80349f:	55                   	push   rbp
  8034a0:	48 89 e5             	mov    rbp,rsp
  8034a3:	48 83 ec 20          	sub    rsp,0x20
  8034a7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  8034ab:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8034b2:	eb 6c                	jmp    803520 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  8034b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034b7:	48 63 d0             	movsxd rdx,eax
  8034ba:	48 89 d0             	mov    rax,rdx
  8034bd:	48 c1 e0 02          	shl    rax,0x2
  8034c1:	48 01 d0             	add    rax,rdx
  8034c4:	48 c1 e0 02          	shl    rax,0x2
  8034c8:	48 01 d0             	add    rax,rdx
  8034cb:	48 c1 e0 03          	shl    rax,0x3
  8034cf:	48 05 90 2e 40 00    	add    rax,0x402e90
  8034d5:	8b 00                	mov    eax,DWORD PTR [rax]
  8034d7:	85 c0                	test   eax,eax
  8034d9:	74 41                	je     80351c <sys_find_dev+0x81>
  8034db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034de:	48 63 d0             	movsxd rdx,eax
  8034e1:	48 89 d0             	mov    rax,rdx
  8034e4:	48 c1 e0 02          	shl    rax,0x2
  8034e8:	48 01 d0             	add    rax,rdx
  8034eb:	48 c1 e0 02          	shl    rax,0x2
  8034ef:	48 01 d0             	add    rax,rdx
  8034f2:	48 c1 e0 03          	shl    rax,0x3
  8034f6:	48 83 c0 10          	add    rax,0x10
  8034fa:	48 05 80 2e 40 00    	add    rax,0x402e80
  803500:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803504:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803508:	48 89 d6             	mov    rsi,rdx
  80350b:	48 89 c7             	mov    rdi,rax
  80350e:	e8 f5 9c 00 00       	call   80d208 <strcmp>
  803513:	85 c0                	test   eax,eax
  803515:	75 05                	jne    80351c <sys_find_dev+0x81>
            return i;
  803517:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80351a:	eb 0f                	jmp    80352b <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  80351c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803520:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803524:	7e 8e                	jle    8034b4 <sys_find_dev+0x19>
    }
    return -1;
  803526:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80352b:	c9                   	leave  
  80352c:	c3                   	ret    

000000000080352d <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  80352d:	f3 0f 1e fa          	endbr64 
  803531:	55                   	push   rbp
  803532:	48 89 e5             	mov    rbp,rsp
  803535:	48 83 ec 30          	sub    rsp,0x30
  803539:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80353d:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  803540:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803544:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  80354b:	eb 67                	jmp    8035b4 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  80354d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803550:	48 63 d0             	movsxd rdx,eax
  803553:	48 89 d0             	mov    rax,rdx
  803556:	48 c1 e0 02          	shl    rax,0x2
  80355a:	48 01 d0             	add    rax,rdx
  80355d:	48 c1 e0 02          	shl    rax,0x2
  803561:	48 01 d0             	add    rax,rdx
  803564:	48 c1 e0 03          	shl    rax,0x3
  803568:	48 05 90 2e 40 00    	add    rax,0x402e90
  80356e:	8b 00                	mov    eax,DWORD PTR [rax]
  803570:	85 c0                	test   eax,eax
  803572:	74 3c                	je     8035b0 <sys_operate_dev+0x83>
  803574:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803577:	48 63 d0             	movsxd rdx,eax
  80357a:	48 89 d0             	mov    rax,rdx
  80357d:	48 c1 e0 02          	shl    rax,0x2
  803581:	48 01 d0             	add    rax,rdx
  803584:	48 c1 e0 02          	shl    rax,0x2
  803588:	48 01 d0             	add    rax,rdx
  80358b:	48 c1 e0 03          	shl    rax,0x3
  80358f:	48 83 c0 10          	add    rax,0x10
  803593:	48 05 80 2e 40 00    	add    rax,0x402e80
  803599:	48 8d 50 04          	lea    rdx,[rax+0x4]
  80359d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8035a1:	48 89 d6             	mov    rsi,rdx
  8035a4:	48 89 c7             	mov    rdi,rax
  8035a7:	e8 5c 9c 00 00       	call   80d208 <strcmp>
  8035ac:	85 c0                	test   eax,eax
  8035ae:	74 0c                	je     8035bc <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  8035b0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8035b4:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8035b8:	7e 93                	jle    80354d <sys_operate_dev+0x20>
  8035ba:	eb 01                	jmp    8035bd <sys_operate_dev+0x90>
            break;
  8035bc:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  8035bd:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8035c1:	75 0a                	jne    8035cd <sys_operate_dev+0xa0>
  8035c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035c8:	e9 9c 02 00 00       	jmp    803869 <sys_operate_dev+0x33c>
    switch (func) {
  8035cd:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  8035d1:	0f 87 8d 02 00 00    	ja     803864 <sys_operate_dev+0x337>
  8035d7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8035da:	48 8b 04 c5 20 56 81 	mov    rax,QWORD PTR [rax*8+0x815620]
  8035e1:	00 
  8035e2:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  8035e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035e8:	48 63 d0             	movsxd rdx,eax
  8035eb:	48 89 d0             	mov    rax,rdx
  8035ee:	48 c1 e0 02          	shl    rax,0x2
  8035f2:	48 01 d0             	add    rax,rdx
  8035f5:	48 c1 e0 02          	shl    rax,0x2
  8035f9:	48 01 d0             	add    rax,rdx
  8035fc:	48 c1 e0 03          	shl    rax,0x3
  803600:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803606:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803609:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80360d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803611:	48 89 c7             	mov    rdi,rax
  803614:	ff d2                	call   rdx
  803616:	e9 4e 02 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  80361b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80361e:	48 63 d0             	movsxd rdx,eax
  803621:	48 89 d0             	mov    rax,rdx
  803624:	48 c1 e0 02          	shl    rax,0x2
  803628:	48 01 d0             	add    rax,rdx
  80362b:	48 c1 e0 02          	shl    rax,0x2
  80362f:	48 01 d0             	add    rax,rdx
  803632:	48 c1 e0 03          	shl    rax,0x3
  803636:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80363c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80363f:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803643:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803647:	48 89 c7             	mov    rdi,rax
  80364a:	ff d2                	call   rdx
  80364c:	e9 18 02 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803651:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803654:	48 63 d0             	movsxd rdx,eax
  803657:	48 89 d0             	mov    rax,rdx
  80365a:	48 c1 e0 02          	shl    rax,0x2
  80365e:	48 01 d0             	add    rax,rdx
  803661:	48 c1 e0 02          	shl    rax,0x2
  803665:	48 01 d0             	add    rax,rdx
  803668:	48 c1 e0 03          	shl    rax,0x3
  80366c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803672:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803675:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  803679:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80367d:	48 89 c7             	mov    rdi,rax
  803680:	ff d2                	call   rdx
  803682:	e9 e2 01 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  803687:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80368a:	48 63 d0             	movsxd rdx,eax
  80368d:	48 89 d0             	mov    rax,rdx
  803690:	48 c1 e0 02          	shl    rax,0x2
  803694:	48 01 d0             	add    rax,rdx
  803697:	48 c1 e0 02          	shl    rax,0x2
  80369b:	48 01 d0             	add    rax,rdx
  80369e:	48 c1 e0 03          	shl    rax,0x3
  8036a2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036ab:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8036af:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036b3:	48 89 c7             	mov    rdi,rax
  8036b6:	ff d2                	call   rdx
  8036b8:	e9 ac 01 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8036bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036c0:	48 63 d0             	movsxd rdx,eax
  8036c3:	48 89 d0             	mov    rax,rdx
  8036c6:	48 c1 e0 02          	shl    rax,0x2
  8036ca:	48 01 d0             	add    rax,rdx
  8036cd:	48 c1 e0 02          	shl    rax,0x2
  8036d1:	48 01 d0             	add    rax,rdx
  8036d4:	48 c1 e0 03          	shl    rax,0x3
  8036d8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036e1:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8036e5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036e9:	48 89 c7             	mov    rdi,rax
  8036ec:	ff d2                	call   rdx
  8036ee:	e9 76 01 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8036f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036f6:	48 63 d0             	movsxd rdx,eax
  8036f9:	48 89 d0             	mov    rax,rdx
  8036fc:	48 c1 e0 02          	shl    rax,0x2
  803700:	48 01 d0             	add    rax,rdx
  803703:	48 c1 e0 02          	shl    rax,0x2
  803707:	48 01 d0             	add    rax,rdx
  80370a:	48 c1 e0 03          	shl    rax,0x3
  80370e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803714:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803717:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  80371b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80371f:	48 89 c7             	mov    rdi,rax
  803722:	ff d2                	call   rdx
  803724:	e9 40 01 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803729:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80372c:	48 63 d0             	movsxd rdx,eax
  80372f:	48 89 d0             	mov    rax,rdx
  803732:	48 c1 e0 02          	shl    rax,0x2
  803736:	48 01 d0             	add    rax,rdx
  803739:	48 c1 e0 02          	shl    rax,0x2
  80373d:	48 01 d0             	add    rax,rdx
  803740:	48 c1 e0 03          	shl    rax,0x3
  803744:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80374a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80374d:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803751:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803755:	48 89 c7             	mov    rdi,rax
  803758:	ff d2                	call   rdx
  80375a:	e9 0a 01 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  80375f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803762:	48 63 d0             	movsxd rdx,eax
  803765:	48 89 d0             	mov    rax,rdx
  803768:	48 c1 e0 02          	shl    rax,0x2
  80376c:	48 01 d0             	add    rax,rdx
  80376f:	48 c1 e0 02          	shl    rax,0x2
  803773:	48 01 d0             	add    rax,rdx
  803776:	48 c1 e0 03          	shl    rax,0x3
  80377a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803780:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803783:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803787:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80378b:	48 89 c7             	mov    rdi,rax
  80378e:	ff d2                	call   rdx
  803790:	e9 d4 00 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803795:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803798:	48 63 d0             	movsxd rdx,eax
  80379b:	48 89 d0             	mov    rax,rdx
  80379e:	48 c1 e0 02          	shl    rax,0x2
  8037a2:	48 01 d0             	add    rax,rdx
  8037a5:	48 c1 e0 02          	shl    rax,0x2
  8037a9:	48 01 d0             	add    rax,rdx
  8037ac:	48 c1 e0 03          	shl    rax,0x3
  8037b0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8037b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8037b9:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8037bd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8037c1:	48 89 c7             	mov    rdi,rax
  8037c4:	ff d2                	call   rdx
  8037c6:	e9 9e 00 00 00       	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8037cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037ce:	48 63 d0             	movsxd rdx,eax
  8037d1:	48 89 d0             	mov    rax,rdx
  8037d4:	48 c1 e0 02          	shl    rax,0x2
  8037d8:	48 01 d0             	add    rax,rdx
  8037db:	48 c1 e0 02          	shl    rax,0x2
  8037df:	48 01 d0             	add    rax,rdx
  8037e2:	48 c1 e0 03          	shl    rax,0x3
  8037e6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8037ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8037ef:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8037f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8037f7:	48 89 c7             	mov    rdi,rax
  8037fa:	ff d2                	call   rdx
  8037fc:	eb 6b                	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8037fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803801:	48 63 d0             	movsxd rdx,eax
  803804:	48 89 d0             	mov    rax,rdx
  803807:	48 c1 e0 02          	shl    rax,0x2
  80380b:	48 01 d0             	add    rax,rdx
  80380e:	48 c1 e0 02          	shl    rax,0x2
  803812:	48 01 d0             	add    rax,rdx
  803815:	48 c1 e0 03          	shl    rax,0x3
  803819:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80381f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803822:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803826:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80382a:	48 89 c7             	mov    rdi,rax
  80382d:	ff d2                	call   rdx
  80382f:	eb 38                	jmp    803869 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803831:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803834:	48 63 d0             	movsxd rdx,eax
  803837:	48 89 d0             	mov    rax,rdx
  80383a:	48 c1 e0 02          	shl    rax,0x2
  80383e:	48 01 d0             	add    rax,rdx
  803841:	48 c1 e0 02          	shl    rax,0x2
  803845:	48 01 d0             	add    rax,rdx
  803848:	48 c1 e0 03          	shl    rax,0x3
  80384c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803852:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803855:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  803859:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80385d:	48 89 c7             	mov    rdi,rax
  803860:	ff d2                	call   rdx
  803862:	eb 05                	jmp    803869 <sys_operate_dev+0x33c>
    }
    return -1;
  803864:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803869:	c9                   	leave  
  80386a:	c3                   	ret    

000000000080386b <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80386b:	f3 0f 1e fa          	endbr64 
  80386f:	55                   	push   rbp
  803870:	48 89 e5             	mov    rbp,rsp
  803873:	48 83 ec 10          	sub    rsp,0x10
  803877:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80387a:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80387d:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803881:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803884:	48 63 d0             	movsxd rdx,eax
  803887:	48 89 d0             	mov    rax,rdx
  80388a:	48 c1 e0 02          	shl    rax,0x2
  80388e:	48 01 d0             	add    rax,rdx
  803891:	48 c1 e0 05          	shl    rax,0x5
  803895:	48 05 80 58 40 00    	add    rax,0x405880
  80389b:	8b 00                	mov    eax,DWORD PTR [rax]
  80389d:	85 c0                	test   eax,eax
  80389f:	75 0a                	jne    8038ab <call_drv_func+0x40>
  8038a1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038a6:	e9 15 02 00 00       	jmp    803ac0 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8038ab:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8038af:	0f 87 06 02 00 00    	ja     803abb <call_drv_func+0x250>
  8038b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038b8:	48 8b 04 c5 80 56 81 	mov    rax,QWORD PTR [rax*8+0x815680]
  8038bf:	00 
  8038c0:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8038c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038c6:	48 63 d0             	movsxd rdx,eax
  8038c9:	48 89 d0             	mov    rax,rdx
  8038cc:	48 c1 e0 02          	shl    rax,0x2
  8038d0:	48 01 d0             	add    rax,rdx
  8038d3:	48 c1 e0 05          	shl    rax,0x5
  8038d7:	48 05 88 58 40 00    	add    rax,0x405888
  8038dd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038e4:	48 89 c7             	mov    rdi,rax
  8038e7:	ff d2                	call   rdx
  8038e9:	e9 d2 01 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8038ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038f1:	48 63 d0             	movsxd rdx,eax
  8038f4:	48 89 d0             	mov    rax,rdx
  8038f7:	48 c1 e0 02          	shl    rax,0x2
  8038fb:	48 01 d0             	add    rax,rdx
  8038fe:	48 c1 e0 05          	shl    rax,0x5
  803902:	48 05 90 58 40 00    	add    rax,0x405890
  803908:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80390b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80390f:	48 89 c7             	mov    rdi,rax
  803912:	ff d2                	call   rdx
  803914:	e9 a7 01 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803919:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80391c:	48 63 d0             	movsxd rdx,eax
  80391f:	48 89 d0             	mov    rax,rdx
  803922:	48 c1 e0 02          	shl    rax,0x2
  803926:	48 01 d0             	add    rax,rdx
  803929:	48 c1 e0 05          	shl    rax,0x5
  80392d:	48 05 98 58 40 00    	add    rax,0x405898
  803933:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803936:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80393a:	48 89 c7             	mov    rdi,rax
  80393d:	ff d2                	call   rdx
  80393f:	e9 7c 01 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803944:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803947:	48 63 d0             	movsxd rdx,eax
  80394a:	48 89 d0             	mov    rax,rdx
  80394d:	48 c1 e0 02          	shl    rax,0x2
  803951:	48 01 d0             	add    rax,rdx
  803954:	48 c1 e0 05          	shl    rax,0x5
  803958:	48 05 a0 58 40 00    	add    rax,0x4058a0
  80395e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803961:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803965:	48 89 c7             	mov    rdi,rax
  803968:	ff d2                	call   rdx
  80396a:	e9 51 01 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  80396f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803972:	48 63 d0             	movsxd rdx,eax
  803975:	48 89 d0             	mov    rax,rdx
  803978:	48 c1 e0 02          	shl    rax,0x2
  80397c:	48 01 d0             	add    rax,rdx
  80397f:	48 c1 e0 05          	shl    rax,0x5
  803983:	48 05 a8 58 40 00    	add    rax,0x4058a8
  803989:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80398c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803990:	48 89 c7             	mov    rdi,rax
  803993:	ff d2                	call   rdx
  803995:	e9 26 01 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80399a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80399d:	48 63 d0             	movsxd rdx,eax
  8039a0:	48 89 d0             	mov    rax,rdx
  8039a3:	48 c1 e0 02          	shl    rax,0x2
  8039a7:	48 01 d0             	add    rax,rdx
  8039aa:	48 c1 e0 05          	shl    rax,0x5
  8039ae:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8039b4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039bb:	48 89 c7             	mov    rdi,rax
  8039be:	ff d2                	call   rdx
  8039c0:	e9 fb 00 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8039c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039c8:	48 63 d0             	movsxd rdx,eax
  8039cb:	48 89 d0             	mov    rax,rdx
  8039ce:	48 c1 e0 02          	shl    rax,0x2
  8039d2:	48 01 d0             	add    rax,rdx
  8039d5:	48 c1 e0 05          	shl    rax,0x5
  8039d9:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8039df:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039e6:	48 89 c7             	mov    rdi,rax
  8039e9:	ff d2                	call   rdx
  8039eb:	e9 d0 00 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8039f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039f3:	48 63 d0             	movsxd rdx,eax
  8039f6:	48 89 d0             	mov    rax,rdx
  8039f9:	48 c1 e0 02          	shl    rax,0x2
  8039fd:	48 01 d0             	add    rax,rdx
  803a00:	48 c1 e0 05          	shl    rax,0x5
  803a04:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803a0a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a11:	48 89 c7             	mov    rdi,rax
  803a14:	ff d2                	call   rdx
  803a16:	e9 a5 00 00 00       	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803a1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a1e:	48 63 d0             	movsxd rdx,eax
  803a21:	48 89 d0             	mov    rax,rdx
  803a24:	48 c1 e0 02          	shl    rax,0x2
  803a28:	48 01 d0             	add    rax,rdx
  803a2b:	48 c1 e0 05          	shl    rax,0x5
  803a2f:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803a35:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a38:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a3c:	48 89 c7             	mov    rdi,rax
  803a3f:	ff d2                	call   rdx
  803a41:	eb 7d                	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803a43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a46:	48 63 d0             	movsxd rdx,eax
  803a49:	48 89 d0             	mov    rax,rdx
  803a4c:	48 c1 e0 02          	shl    rax,0x2
  803a50:	48 01 d0             	add    rax,rdx
  803a53:	48 c1 e0 05          	shl    rax,0x5
  803a57:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803a5d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a64:	48 89 c7             	mov    rdi,rax
  803a67:	ff d2                	call   rdx
  803a69:	eb 55                	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803a6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a6e:	48 63 d0             	movsxd rdx,eax
  803a71:	48 89 d0             	mov    rax,rdx
  803a74:	48 c1 e0 02          	shl    rax,0x2
  803a78:	48 01 d0             	add    rax,rdx
  803a7b:	48 c1 e0 05          	shl    rax,0x5
  803a7f:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803a85:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a8c:	48 89 c7             	mov    rdi,rax
  803a8f:	ff d2                	call   rdx
  803a91:	eb 2d                	jmp    803ac0 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803a93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a96:	48 63 d0             	movsxd rdx,eax
  803a99:	48 89 d0             	mov    rax,rdx
  803a9c:	48 c1 e0 02          	shl    rax,0x2
  803aa0:	48 01 d0             	add    rax,rdx
  803aa3:	48 c1 e0 05          	shl    rax,0x5
  803aa7:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803aad:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803ab0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ab4:	48 89 c7             	mov    rdi,rax
  803ab7:	ff d2                	call   rdx
  803ab9:	eb 05                	jmp    803ac0 <call_drv_func+0x255>
    }
    return -1;
  803abb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803ac0:	c9                   	leave  
  803ac1:	c3                   	ret    

0000000000803ac2 <dispose_device>:
int dispose_device(int dev){
  803ac2:	f3 0f 1e fa          	endbr64 
  803ac6:	55                   	push   rbp
  803ac7:	48 89 e5             	mov    rbp,rsp
  803aca:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803acd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ad0:	48 63 d0             	movsxd rdx,eax
  803ad3:	48 89 d0             	mov    rax,rdx
  803ad6:	48 c1 e0 02          	shl    rax,0x2
  803ada:	48 01 d0             	add    rax,rdx
  803add:	48 c1 e0 02          	shl    rax,0x2
  803ae1:	48 01 d0             	add    rax,rdx
  803ae4:	48 c1 e0 03          	shl    rax,0x3
  803ae8:	48 05 90 2e 40 00    	add    rax,0x402e90
  803aee:	8b 00                	mov    eax,DWORD PTR [rax]
  803af0:	83 f8 01             	cmp    eax,0x1
  803af3:	74 07                	je     803afc <dispose_device+0x3a>
  803af5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803afa:	eb 62                	jmp    803b5e <dispose_device+0x9c>
    device* p=&devs[dev];
  803afc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803aff:	48 63 d0             	movsxd rdx,eax
  803b02:	48 89 d0             	mov    rax,rdx
  803b05:	48 c1 e0 02          	shl    rax,0x2
  803b09:	48 01 d0             	add    rax,rdx
  803b0c:	48 c1 e0 02          	shl    rax,0x2
  803b10:	48 01 d0             	add    rax,rdx
  803b13:	48 c1 e0 03          	shl    rax,0x3
  803b17:	48 05 80 2e 40 00    	add    rax,0x402e80
  803b1d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803b21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b25:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803b2c:	48 85 c0             	test   rax,rax
  803b2f:	74 1d                	je     803b4e <dispose_device+0x8c>
  803b31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b35:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803b3c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803b40:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803b47:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803b4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b52:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803b59:	b8 00 00 00 00       	mov    eax,0x0
}
  803b5e:	5d                   	pop    rbp
  803b5f:	c3                   	ret    

0000000000803b60 <dispose_driver>:
int dispose_driver(driver *drv){
  803b60:	f3 0f 1e fa          	endbr64 
  803b64:	55                   	push   rbp
  803b65:	48 89 e5             	mov    rbp,rsp
  803b68:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803b6c:	90                   	nop
  803b6d:	5d                   	pop    rbp
  803b6e:	c3                   	ret    

0000000000803b6f <get_dev>:

device *get_dev(int devi)
{
  803b6f:	f3 0f 1e fa          	endbr64 
  803b73:	55                   	push   rbp
  803b74:	48 89 e5             	mov    rbp,rsp
  803b77:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803b7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b7d:	48 63 d0             	movsxd rdx,eax
  803b80:	48 89 d0             	mov    rax,rdx
  803b83:	48 c1 e0 02          	shl    rax,0x2
  803b87:	48 01 d0             	add    rax,rdx
  803b8a:	48 c1 e0 02          	shl    rax,0x2
  803b8e:	48 01 d0             	add    rax,rdx
  803b91:	48 c1 e0 03          	shl    rax,0x3
  803b95:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803b9b:	5d                   	pop    rbp
  803b9c:	c3                   	ret    

0000000000803b9d <get_drv>:
driver *get_drv(int drvi)
{
  803b9d:	f3 0f 1e fa          	endbr64 
  803ba1:	55                   	push   rbp
  803ba2:	48 89 e5             	mov    rbp,rsp
  803ba5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803ba8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bab:	48 63 d0             	movsxd rdx,eax
  803bae:	48 89 d0             	mov    rax,rdx
  803bb1:	48 c1 e0 02          	shl    rax,0x2
  803bb5:	48 01 d0             	add    rax,rdx
  803bb8:	48 c1 e0 05          	shl    rax,0x5
  803bbc:	48 05 80 58 40 00    	add    rax,0x405880
}
  803bc2:	5d                   	pop    rbp
  803bc3:	c3                   	ret    

0000000000803bc4 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803bc4:	f3 0f 1e fa          	endbr64 
  803bc8:	55                   	push   rbp
  803bc9:	48 89 e5             	mov    rbp,rsp
  803bcc:	53                   	push   rbx
  803bcd:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803bd1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803bd8:	eb 23                	jmp    803bfd <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803bda:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803bdd:	48 63 d0             	movsxd rdx,eax
  803be0:	48 89 d0             	mov    rax,rdx
  803be3:	48 01 c0             	add    rax,rax
  803be6:	48 01 d0             	add    rax,rdx
  803be9:	48 c1 e0 06          	shl    rax,0x6
  803bed:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803bf3:	8b 00                	mov    eax,DWORD PTR [rax]
  803bf5:	85 c0                	test   eax,eax
  803bf7:	74 0c                	je     803c05 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803bf9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803bfd:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803c01:	7e d7                	jle    803bda <make_request+0x16>
  803c03:	eb 01                	jmp    803c06 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803c05:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803c06:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803c0a:	75 0a                	jne    803c16 <make_request+0x52>
  803c0c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c11:	e9 e7 01 00 00       	jmp    803dfd <make_request+0x239>
    reqs[i]=*args;//放入数组
  803c16:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803c19:	48 63 d0             	movsxd rdx,eax
  803c1c:	48 89 d0             	mov    rax,rdx
  803c1f:	48 01 c0             	add    rax,rax
  803c22:	48 01 d0             	add    rax,rdx
  803c25:	48 c1 e0 06          	shl    rax,0x6
  803c29:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803c30:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803c34:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803c37:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803c3b:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803c3e:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803c42:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803c46:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803c4a:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803c4e:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803c52:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803c56:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803c5a:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803c5e:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803c62:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803c66:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803c6a:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803c6e:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803c72:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803c76:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803c7a:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803c7e:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803c82:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803c86:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803c8a:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803c8e:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803c92:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803c96:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803c9a:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803c9e:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803ca2:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803ca6:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803caa:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803cae:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803cb2:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803cb9:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803cc0:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803cc7:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803cce:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803cd5:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803cdc:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803ce3:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803cea:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803cf1:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803cf8:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803cff:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803d06:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803d0d:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803d14:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803d1b:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803d22:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803d26:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803d2c:	48 63 d0             	movsxd rdx,eax
  803d2f:	48 89 d0             	mov    rax,rdx
  803d32:	48 c1 e0 02          	shl    rax,0x2
  803d36:	48 01 d0             	add    rax,rdx
  803d39:	48 c1 e0 02          	shl    rax,0x2
  803d3d:	48 01 d0             	add    rax,rdx
  803d40:	48 c1 e0 03          	shl    rax,0x3
  803d44:	48 05 80 2e 40 00    	add    rax,0x402e80
  803d4a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803d4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d52:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d59:	48 85 c0             	test   rax,rax
  803d5c:	75 27                	jne    803d85 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803d5e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803d61:	48 63 d0             	movsxd rdx,eax
  803d64:	48 89 d0             	mov    rax,rdx
  803d67:	48 01 c0             	add    rax,rax
  803d6a:	48 01 d0             	add    rax,rdx
  803d6d:	48 c1 e0 06          	shl    rax,0x6
  803d71:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803d78:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d7c:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803d83:	eb 75                	jmp    803dfa <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803d85:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d89:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d90:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803d94:	eb 0f                	jmp    803da5 <make_request+0x1e1>
  803d96:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803d9a:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803da1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803da5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803da9:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803db0:	48 85 c0             	test   rax,rax
  803db3:	75 e1                	jne    803d96 <make_request+0x1d2>
        p->next=&reqs[i];
  803db5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803db8:	48 63 d0             	movsxd rdx,eax
  803dbb:	48 89 d0             	mov    rax,rdx
  803dbe:	48 01 c0             	add    rax,rax
  803dc1:	48 01 d0             	add    rax,rdx
  803dc4:	48 c1 e0 06          	shl    rax,0x6
  803dc8:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803dcf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803dd3:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803dda:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803ddd:	48 63 d0             	movsxd rdx,eax
  803de0:	48 89 d0             	mov    rax,rdx
  803de3:	48 01 c0             	add    rax,rax
  803de6:	48 01 d0             	add    rax,rdx
  803de9:	48 c1 e0 06          	shl    rax,0x6
  803ded:	48 05 38 6d 40 00    	add    rax,0x406d38
  803df3:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803dfa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803dfd:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803e01:	c9                   	leave  
  803e02:	c3                   	ret    

0000000000803e03 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803e03:	f3 0f 1e fa          	endbr64 
  803e07:	55                   	push   rbp
  803e08:	48 89 e5             	mov    rbp,rsp
  803e0b:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803e0f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803e16:	e9 ab 00 00 00       	jmp    803ec6 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803e1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e1e:	48 98                	cdqe   
  803e20:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803e27:	00 
  803e28:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803e2c:	e9 86 00 00 00       	jmp    803eb7 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803e31:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e35:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803e3c:	48 85 c0             	test   rax,rax
  803e3f:	75 67                	jne    803ea8 <do_req+0xa5>
  803e41:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e45:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803e4c:	48 85 c0             	test   rax,rax
  803e4f:	74 57                	je     803ea8 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803e51:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e55:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803e5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e60:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803e67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e6b:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803e72:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803e79:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e7d:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803e84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e88:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803e8e:	48 98                	cdqe   
  803e90:	48 8b 14 c5 80 d9 80 	mov    rdx,QWORD PTR [rax*8+0x80d980]
  803e97:	00 
  803e98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e9c:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803ea3:	48 89 c7             	mov    rdi,rax
  803ea6:	ff d2                	call   rdx
        for(;p;p=p->next)
  803ea8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803eac:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803eb3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803eb7:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803ebc:	0f 85 6f ff ff ff    	jne    803e31 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803ec2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803ec6:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803eca:	0f 8e 4b ff ff ff    	jle    803e1b <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803ed0:	b8 00 00 00 00       	mov    eax,0x0
}
  803ed5:	c9                   	leave  
  803ed6:	c3                   	ret    

0000000000803ed7 <wait_on_req>:


void wait_on_req(int reqi)
{
  803ed7:	f3 0f 1e fa          	endbr64 
  803edb:	55                   	push   rbp
  803edc:	48 89 e5             	mov    rbp,rsp
  803edf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803ee2:	90                   	nop
  803ee3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ee6:	48 63 d0             	movsxd rdx,eax
  803ee9:	48 89 d0             	mov    rax,rdx
  803eec:	48 01 c0             	add    rax,rax
  803eef:	48 01 d0             	add    rax,rdx
  803ef2:	48 c1 e0 06          	shl    rax,0x6
  803ef6:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803efc:	8b 00                	mov    eax,DWORD PTR [rax]
  803efe:	83 f8 03             	cmp    eax,0x3
  803f01:	75 e0                	jne    803ee3 <wait_on_req+0xc>
}
  803f03:	90                   	nop
  803f04:	90                   	nop
  803f05:	5d                   	pop    rbp
  803f06:	c3                   	ret    

0000000000803f07 <clear_req>:
void clear_req(int reqi)
{
  803f07:	f3 0f 1e fa          	endbr64 
  803f0b:	55                   	push   rbp
  803f0c:	48 89 e5             	mov    rbp,rsp
  803f0f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803f12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f15:	48 63 d0             	movsxd rdx,eax
  803f18:	48 89 d0             	mov    rax,rdx
  803f1b:	48 01 c0             	add    rax,rax
  803f1e:	48 01 d0             	add    rax,rdx
  803f21:	48 c1 e0 06          	shl    rax,0x6
  803f25:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803f2b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803f31:	90                   	nop
  803f32:	5d                   	pop    rbp
  803f33:	c3                   	ret    

0000000000803f34 <init_proc>:
TSS *tss=0xffff800000108000ul;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  803f34:	f3 0f 1e fa          	endbr64 
  803f38:	55                   	push   rbp
  803f39:	48 89 e5             	mov    rbp,rsp
  803f3c:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803f40:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803f47:	eb 4c                	jmp    803f95 <init_proc+0x61>
        task[i].pid=-1;
  803f49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f4c:	48 98                	cdqe   
  803f4e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f55:	48 05 40 85 40 00    	add    rax,0x408540
  803f5b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=TASK_EMPTY;
  803f61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f64:	48 98                	cdqe   
  803f66:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f6d:	48 05 58 85 40 00    	add    rax,0x408558
  803f73:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        task[i].parent_pid=-1;
  803f79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f7c:	48 98                	cdqe   
  803f7e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f85:	48 05 dc 85 40 00    	add    rax,0x4085dc
  803f8b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803f91:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803f95:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803f99:	7e ae                	jle    803f49 <init_proc+0x15>
    }
    cur_proc=0;//proc zero
  803f9b:	c7 05 27 13 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11327],0x0        # 4152cc <cur_proc>
  803fa2:	00 00 00 
    current=task;
  803fa5:	48 c7 05 90 12 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc11290],0x408540        # 415240 <current>
  803fac:	40 85 40 00 
    pidd=1;
  803fb0:	c7 05 16 13 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11316],0x1        # 4152d0 <pidd>
  803fb7:	00 00 00 
     //===============创建0号进程======================
    int zi=create_proc();
  803fba:	b8 00 00 00 00       	mov    eax,0x0
  803fbf:	e8 d2 02 00 00       	call   804296 <create_proc>
  803fc4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=TASK_READY;
  803fc7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803fca:	48 98                	cdqe   
  803fcc:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803fd3:	48 05 58 85 40 00    	add    rax,0x408558
  803fd9:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2


    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803fdf:	68 00 00 80 00       	push   0x800000
  803fe4:	68 00 00 80 00       	push   0x800000
  803fe9:	68 00 00 80 00       	push   0x800000
  803fee:	68 00 00 80 00       	push   0x800000
  803ff3:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803ff9:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803fff:	b9 00 00 80 00       	mov    ecx,0x800000
  804004:	ba 00 00 40 00       	mov    edx,0x400000
  804009:	be 00 00 40 00       	mov    esi,0x400000
  80400e:	bf 00 00 40 00       	mov    edi,0x400000
  804013:	e8 55 13 00 00       	call   80536d <set_tss>
  804018:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  80401c:	48 8b 05 dd 99 00 00 	mov    rax,QWORD PTR [rip+0x99dd]        # 80da00 <tss>
  804023:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  804027:	48 89 c6             	mov    rsi,rax
  80402a:	bf a8 06 00 00       	mov    edi,0x6a8
  80402f:	e8 15 c8 ff ff       	call   800849 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  804034:	be 08 00 00 00       	mov    esi,0x8
  804039:	bf 74 01 00 00       	mov    edi,0x174
  80403e:	e8 06 c8 ff ff       	call   800849 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  804043:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  80404a:	00 20 00 
  80404d:	48 89 c6             	mov    rsi,rax
  804050:	b8 81 00 00 c0       	mov    eax,0xc0000081
  804055:	48 89 c7             	mov    rdi,rax
  804058:	e8 ec c7 ff ff       	call   800849 <wrmsr>

    comprintf("proc init set.\r\ntss.ist=0x%x\r\n",tss->ists[0]);
  80405d:	48 8b 05 9c 99 00 00 	mov    rax,QWORD PTR [rip+0x999c]        # 80da00 <tss>
  804064:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  804068:	48 89 c6             	mov    rsi,rax
  80406b:	bf e0 56 81 00       	mov    edi,0x8156e0
  804070:	b8 00 00 00 00       	mov    eax,0x0
  804075:	e8 7d 8e 00 00       	call   80cef7 <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  80407a:	90                   	nop
  80407b:	c9                   	leave  
  80407c:	c3                   	ret    

000000000080407d <create_test_proc>:
void create_test_proc(){
  80407d:	f3 0f 1e fa          	endbr64 
  804081:	55                   	push   rbp
  804082:	48 89 e5             	mov    rbp,rsp
  804085:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  804089:	b8 00 00 00 00       	mov    eax,0x0
  80408e:	e8 da 02 00 00       	call   80436d <req_proc>
  804093:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=TASK_READY;
  804096:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804099:	48 98                	cdqe   
  80409b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8040a2:	48 05 58 85 40 00    	add    rax,0x408558
  8040a8:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    int currsp=0x9fc00-1;
  8040ae:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8040b5:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8040b9:	ba f2 d8 80 00       	mov    edx,0x80d8f2
  8040be:	48 83 ec 08          	sub    rsp,0x8
  8040c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040c5:	50                   	push   rax
  8040c6:	6a 00                	push   0x0
  8040c8:	52                   	push   rdx
  8040c9:	6a 00                	push   0x0
  8040cb:	6a 00                	push   0x0
  8040cd:	6a 00                	push   0x0
  8040cf:	68 58 7d 00 00       	push   0x7d58
  8040d4:	6a 10                	push   0x10
  8040d6:	6a 10                	push   0x10
  8040d8:	6a 10                	push   0x10
  8040da:	6a 10                	push   0x10
  8040dc:	41 b9 08 00 00 00    	mov    r9d,0x8
  8040e2:	41 b8 10 00 00 00    	mov    r8d,0x10
  8040e8:	b9 00 00 00 00       	mov    ecx,0x0
  8040ed:	ba 00 00 00 00       	mov    edx,0x0
  8040f2:	be 00 00 00 00       	mov    esi,0x0
  8040f7:	bf 00 00 00 00       	mov    edi,0x0
  8040fc:	e8 37 03 00 00       	call   804438 <set_proc>
  804101:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  804105:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804108:	48 98                	cdqe   
  80410a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804111:	48 05 10 87 40 00    	add    rax,0x408710
  804117:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  80411e:	00 
    task[index].mem_struct.stack_top=0x7e00;
  80411f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804122:	48 98                	cdqe   
  804124:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80412b:	48 05 74 85 40 00    	add    rax,0x408574
  804131:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  804137:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80413a:	48 98                	cdqe   
  80413c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804143:	48 05 70 85 40 00    	add    rax,0x408570
  804149:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  80414f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804152:	48 98                	cdqe   
  804154:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80415b:	48 05 6c 85 40 00    	add    rax,0x40856c
  804161:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  804167:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80416a:	48 98                	cdqe   
  80416c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804173:	48 05 68 85 40 00    	add    rax,0x408568
  804179:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  80417f:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  804186:	00 
    str->rax=0;
  804187:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80418b:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804192:	00 
    str->rbx=0;
  804193:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804197:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  80419e:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  80419f:	ba ac 45 80 00       	mov    edx,0x8045ac
  8041a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041a8:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  8041ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041b0:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  8041b7:	00 
    str->rsi=0;
  8041b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041bc:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  8041c3:	00 
    str->rdi=0;
  8041c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041c8:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  8041cf:	00 
    str->r15=0;
  8041d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041d4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8041db:	00 
    str->r14=0;
  8041dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041e0:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8041e7:	00 
    str->r13=0;
  8041e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041ec:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8041f3:	00 
    str->r12=0;
  8041f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041f8:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  8041ff:	00 
    str->r11=0x200;
  804200:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804204:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  80420b:	00 
    str->r10=0;
  80420c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804210:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  804217:	00 
    str->r9=0;
  804218:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80421c:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  804223:	00 
    str->r8=0;
  804224:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804228:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  80422f:	00 
    str->rip=proc_zero;
  804230:	ba ac 45 80 00       	mov    edx,0x8045ac
  804235:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804239:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  804240:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804244:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  80424b:	08 00 00 00 
    str->rflags=0x00200206;
  80424f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804253:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  80425a:	06 02 20 00 
    str->rsp=0x7e00;
  80425e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804262:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  804269:	00 7e 00 00 
    str->ss=0x2b;
  80426d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804271:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  804278:	2b 00 00 00 
    str->ds=0x2b;
  80427c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804280:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  804287:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80428b:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  804292:	00 

}
  804293:	90                   	nop
  804294:	c9                   	leave  
  804295:	c3                   	ret    

0000000000804296 <create_proc>:
int create_proc()
{
  804296:	f3 0f 1e fa          	endbr64 
  80429a:	55                   	push   rbp
  80429b:	48 89 e5             	mov    rbp,rsp
  80429e:	48 83 ec 20          	sub    rsp,0x20
    int index=req_proc();
  8042a2:	b8 00 00 00 00       	mov    eax,0x0
  8042a7:	e8 c1 00 00 00       	call   80436d <req_proc>
  8042ac:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    struct process *pz=&task[index];
  8042af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042b2:	48 98                	cdqe   
  8042b4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8042bb:	48 05 40 85 40 00    	add    rax,0x408540
  8042c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(index==-1)return -1;
  8042c5:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8042c9:	75 0a                	jne    8042d5 <create_proc+0x3f>
  8042cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042d0:	e9 96 00 00 00       	jmp    80436b <create_proc+0xd5>
    int currsp=0x9fc00-1;
  8042d5:	c7 45 e4 ff fb 09 00 	mov    DWORD PTR [rbp-0x1c],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8042dc:	48 89 65 e4          	mov    QWORD PTR [rbp-0x1c],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8042e0:	b9 ac 45 80 00       	mov    ecx,0x8045ac
  8042e5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8042e8:	48 98                	cdqe   
  8042ea:	48 83 ec 08          	sub    rsp,0x8
  8042ee:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042f1:	52                   	push   rdx
  8042f2:	6a 00                	push   0x0
  8042f4:	51                   	push   rcx
  8042f5:	6a 00                	push   0x0
  8042f7:	6a 00                	push   0x0
  8042f9:	6a 00                	push   0x0
  8042fb:	50                   	push   rax
  8042fc:	6a 10                	push   0x10
  8042fe:	6a 10                	push   0x10
  804300:	6a 10                	push   0x10
  804302:	6a 10                	push   0x10
  804304:	41 b9 08 00 00 00    	mov    r9d,0x8
  80430a:	41 b8 10 00 00 00    	mov    r8d,0x10
  804310:	b9 00 00 00 00       	mov    ecx,0x0
  804315:	ba 00 00 00 00       	mov    edx,0x0
  80431a:	be 00 00 00 00       	mov    esi,0x0
  80431f:	bf 00 00 00 00       	mov    edi,0x0
  804324:	e8 0f 01 00 00       	call   804438 <set_proc>
  804329:	48 83 c4 60          	add    rsp,0x60
//    task[index].tss.eip=(long)proc_zero;
    extern struct dir_entry* dtty;
    //stdin stdout stderr
    //这里绕开了sys open，这样是为了尽量快
    extern struct file ftty;
    addr_t filplate=vmalloc();
  80432d:	b8 00 00 00 00       	mov    eax,0x0
  804332:	e8 16 cf ff ff       	call   80124d <vmalloc>
  804337:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pz->openf[0]=&ftty;
  80433b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80433f:	48 c7 80 d8 00 00 00 	mov    QWORD PTR [rax+0xd8],0x408500
  804346:	00 85 40 00 
    pz->openf[1]=&ftty;
  80434a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80434e:	48 c7 80 e0 00 00 00 	mov    QWORD PTR [rax+0xe0],0x408500
  804355:	00 85 40 00 
    pz->openf[2]=&ftty;
  804359:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80435d:	48 c7 80 e8 00 00 00 	mov    QWORD PTR [rax+0xe8],0x408500
  804364:	00 85 40 00 

    return index;
  804368:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80436b:	c9                   	leave  
  80436c:	c3                   	ret    

000000000080436d <req_proc>:
int req_proc(){
  80436d:	f3 0f 1e fa          	endbr64 
  804371:	55                   	push   rbp
  804372:	48 89 e5             	mov    rbp,rsp
    int num=0;
  804375:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  80437c:	eb 04                	jmp    804382 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  80437e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  804382:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804385:	48 98                	cdqe   
  804387:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80438e:	48 05 40 85 40 00    	add    rax,0x408540
  804394:	8b 00                	mov    eax,DWORD PTR [rax]
  804396:	83 f8 ff             	cmp    eax,0xffffffff
  804399:	74 1e                	je     8043b9 <req_proc+0x4c>
  80439b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80439e:	48 98                	cdqe   
  8043a0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043a7:	48 05 58 85 40 00    	add    rax,0x408558
  8043ad:	8b 00                	mov    eax,DWORD PTR [rax]
  8043af:	85 c0                	test   eax,eax
  8043b1:	74 06                	je     8043b9 <req_proc+0x4c>
  8043b3:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8043b7:	7e c5                	jle    80437e <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8043b9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8043bd:	7e 07                	jle    8043c6 <req_proc+0x59>
        return -1;
  8043bf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8043c4:	eb 70                	jmp    804436 <req_proc+0xc9>
    task[num].pid=pidd++;
  8043c6:	8b 05 04 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f04]        # 4152d0 <pidd>
  8043cc:	8d 50 01             	lea    edx,[rax+0x1]
  8043cf:	89 15 fb 0e c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10efb],edx        # 4152d0 <pidd>
  8043d5:	89 c2                	mov    edx,eax
  8043d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043da:	48 98                	cdqe   
  8043dc:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043e3:	48 05 40 85 40 00    	add    rax,0x408540
  8043e9:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=TASK_ZOMBIE;
  8043eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043ee:	48 98                	cdqe   
  8043f0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043f7:	48 05 58 85 40 00    	add    rax,0x408558
  8043fd:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
    task[num].utime=0;
  804403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804406:	48 98                	cdqe   
  804408:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80440f:	48 05 5c 85 40 00    	add    rax,0x40855c
  804415:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  80441b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80441e:	48 98                	cdqe   
  804420:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804427:	48 05 60 85 40 00    	add    rax,0x408560
  80442d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  804433:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804436:	5d                   	pop    rbp
  804437:	c3                   	ret    

0000000000804438 <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  804438:	f3 0f 1e fa          	endbr64 
  80443c:	55                   	push   rbp
  80443d:	48 89 e5             	mov    rbp,rsp
  804440:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804444:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  804448:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80444c:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  804450:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  804454:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  804458:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  80445b:	48 98                	cdqe   
  80445d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804464:	48 05 40 85 40 00    	add    rax,0x408540
  80446a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  80446e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804472:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804476:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  80447d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804481:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804485:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  80448c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804490:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804494:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  80449b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80449f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8044a3:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  8044aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ae:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8044b2:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  8044b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044bd:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8044c1:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  8044c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044cc:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8044d0:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  8044d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044db:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8044df:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  8044e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ea:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8044ee:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  8044f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044f9:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8044fd:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  804504:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804508:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  80450c:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  804513:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804517:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  80451b:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  804522:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804526:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  80452a:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  804531:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804535:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  804539:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  804540:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804544:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  80454b:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  80454f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804553:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  804557:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  80455e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804562:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  804566:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  80456d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804571:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804575:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  80457c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804580:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804584:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  80458b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80458f:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  804596:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  80459a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80459e:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  8045a5:	00 10 10 00 


}
  8045a9:	90                   	nop
  8045aa:	5d                   	pop    rbp
  8045ab:	c3                   	ret    

00000000008045ac <proc_zero>:
void proc_zero()
{
  8045ac:	f3 0f 1e fa          	endbr64 
  8045b0:	55                   	push   rbp
  8045b1:	48 89 e5             	mov    rbp,rsp
  8045b4:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  8045b8:	b8 00 00 00 00       	mov    eax,0x0
  8045bd:	e8 20 4f 00 00       	call   8094e2 <sys_analyse_key>
  8045c2:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  8045c5:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8045c9:	89 c7                	mov    edi,eax
  8045cb:	e8 7d c7 ff ff       	call   800d4d <putchar>
    {
  8045d0:	eb e6                	jmp    8045b8 <proc_zero+0xc>

00000000008045d2 <save_rsp>:
    }
}
void save_rsp(){
  8045d2:	f3 0f 1e fa          	endbr64 
  8045d6:	55                   	push   rbp
  8045d7:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  8045da:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  8045e1:	00 
    current->regs.rsp=*p;
  8045e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8045e9:	48 8b 05 50 0c c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10c50]        # 415240 <current>
  8045f0:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  8045f7:	90                   	nop
  8045f8:	5d                   	pop    rbp
  8045f9:	c3                   	ret    

00000000008045fa <manage_proc>:
void manage_proc(){
  8045fa:	f3 0f 1e fa          	endbr64 
  8045fe:	55                   	push   rbp
  8045ff:	48 89 e5             	mov    rbp,rsp
  804602:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  804606:	8b 05 c0 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10cc0]        # 4152cc <cur_proc>
  80460c:	83 f8 ff             	cmp    eax,0xffffffff
  80460f:	74 2d                	je     80463e <manage_proc+0x44>
        task[cur_proc].utime++;
  804611:	8b 05 b5 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10cb5]        # 4152cc <cur_proc>
  804617:	48 63 d0             	movsxd rdx,eax
  80461a:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  804621:	48 81 c2 5c 85 40 00 	add    rdx,0x40855c
  804628:	8b 12                	mov    edx,DWORD PTR [rdx]
  80462a:	83 c2 01             	add    edx,0x1
  80462d:	48 98                	cdqe   
  80462f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804636:	48 05 5c 85 40 00    	add    rax,0x40855c
  80463c:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80463e:	8b 05 88 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c88]        # 4152cc <cur_proc>
  804644:	83 f8 ff             	cmp    eax,0xffffffff
  804647:	74 3c                	je     804685 <manage_proc+0x8b>
  804649:	8b 05 7d 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c7d]        # 4152cc <cur_proc>
  80464f:	48 98                	cdqe   
  804651:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804658:	48 05 5c 85 40 00    	add    rax,0x40855c
  80465e:	8b 00                	mov    eax,DWORD PTR [rax]
  804660:	83 f8 0a             	cmp    eax,0xa
  804663:	77 20                	ja     804685 <manage_proc+0x8b>
    task[cur_proc].stat != TASK_READY){
  804665:	8b 05 61 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c61]        # 4152cc <cur_proc>
  80466b:	48 98                	cdqe   
  80466d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804674:	48 05 58 85 40 00    	add    rax,0x408558
  80467a:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80467c:	83 f8 02             	cmp    eax,0x2
  80467f:	0f 84 02 01 00 00    	je     804787 <manage_proc+0x18d>
        if(cur_proc!=-1)
  804685:	8b 05 41 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c41]        # 4152cc <cur_proc>
  80468b:	83 f8 ff             	cmp    eax,0xffffffff
  80468e:	74 1b                	je     8046ab <manage_proc+0xb1>
            task[cur_proc].utime=0;
  804690:	8b 05 36 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c36]        # 4152cc <cur_proc>
  804696:	48 98                	cdqe   
  804698:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80469f:	48 05 5c 85 40 00    	add    rax,0x40855c
  8046a5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  8046ab:	8b 05 1b 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c1b]        # 4152cc <cur_proc>
  8046b1:	83 c0 01             	add    eax,0x1
  8046b4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  8046b7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  8046be:	eb 52                	jmp    804712 <manage_proc+0x118>
            if(task[i].pid!=-1 && task[i].stat == TASK_READY && i != cur_proc){
  8046c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046c3:	48 98                	cdqe   
  8046c5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046cc:	48 05 40 85 40 00    	add    rax,0x408540
  8046d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8046d4:	83 f8 ff             	cmp    eax,0xffffffff
  8046d7:	74 24                	je     8046fd <manage_proc+0x103>
  8046d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046dc:	48 98                	cdqe   
  8046de:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046e5:	48 05 58 85 40 00    	add    rax,0x408558
  8046eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8046ed:	83 f8 02             	cmp    eax,0x2
  8046f0:	75 0b                	jne    8046fd <manage_proc+0x103>
  8046f2:	8b 05 d4 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bd4]        # 4152cc <cur_proc>
  8046f8:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8046fb:	75 1d                	jne    80471a <manage_proc+0x120>
                break;
            }
            i++;
  8046fd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  804701:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804705:	7e 0b                	jle    804712 <manage_proc+0x118>
                times++;
  804707:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  80470b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  804712:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  804716:	7e a8                	jle    8046c0 <manage_proc+0xc6>
  804718:	eb 01                	jmp    80471b <manage_proc+0x121>
                break;
  80471a:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  80471b:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  80471f:	74 69                	je     80478a <manage_proc+0x190>
        //switch
        task[cur_proc].stat=TASK_READY;
  804721:	8b 05 a5 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ba5]        # 4152cc <cur_proc>
  804727:	48 98                	cdqe   
  804729:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804730:	48 05 58 85 40 00    	add    rax,0x408558
  804736:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        task[i].stat=TASK_RUNNING;
  80473c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80473f:	48 98                	cdqe   
  804741:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804748:	48 05 58 85 40 00    	add    rax,0x408558
  80474e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_to(&task[cur_proc], &task[i]);
  804754:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804757:	48 98                	cdqe   
  804759:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804760:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  804767:	8b 05 5f 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b5f]        # 4152cc <cur_proc>
  80476d:	48 98                	cdqe   
  80476f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804776:	48 05 40 85 40 00    	add    rax,0x408540
  80477c:	48 89 d6             	mov    rsi,rdx
  80477f:	48 89 c7             	mov    rdi,rax
  804782:	e8 58 0a 00 00       	call   8051df <switch_to>
    }
    return;
  804787:	90                   	nop
  804788:	eb 01                	jmp    80478b <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  80478a:	90                   	nop
}
  80478b:	c9                   	leave  
  80478c:	c3                   	ret    

000000000080478d <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  80478d:	f3 0f 1e fa          	endbr64 
  804791:	55                   	push   rbp
  804792:	48 89 e5             	mov    rbp,rsp
  804795:	48 83 ec 20          	sub    rsp,0x20
  804799:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  80479c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80479f:	01 c0                	add    eax,eax
  8047a1:	83 c0 05             	add    eax,0x5
  8047a4:	c1 e0 03             	shl    eax,0x3
  8047a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  8047aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047ad:	89 05 19 0b c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10b19],eax        # 4152cc <cur_proc>
    switch_proc_asm(sel);
  8047b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047b6:	89 c7                	mov    edi,eax
  8047b8:	e8 4d 90 00 00       	call   80d80a <switch_proc_asm>
}
  8047bd:	90                   	nop
  8047be:	c9                   	leave  
  8047bf:	c3                   	ret    

00000000008047c0 <switch_proc>:
void switch_proc(int pnr){
  8047c0:	f3 0f 1e fa          	endbr64 
  8047c4:	55                   	push   rbp
  8047c5:	48 89 e5             	mov    rbp,rsp
  8047c8:	48 81 ec 50 03 00 00 	sub    rsp,0x350
  8047cf:	89 bd bc fc ff ff    	mov    DWORD PTR [rbp-0x344],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  8047d5:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  8047db:	48 98                	cdqe   
  8047dd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8047e4:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  8047eb:	48 8d 85 c0 fc ff ff 	lea    rax,[rbp-0x340]
  8047f2:	b9 66 00 00 00       	mov    ecx,0x66
  8047f7:	48 89 c7             	mov    rdi,rax
  8047fa:	48 89 d6             	mov    rsi,rdx
  8047fd:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  804800:	48 89 f2             	mov    rdx,rsi
  804803:	48 89 f8             	mov    rax,rdi
  804806:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  804808:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  80480a:	8b 05 bc 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10abc]        # 4152cc <cur_proc>
  804810:	48 98                	cdqe   
  804812:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804819:	48 05 d0 01 00 00    	add    rax,0x1d0
  80481f:	48 05 40 85 40 00    	add    rax,0x408540
  804825:	48 83 c0 08          	add    rax,0x8
  804829:	48 89 c7             	mov    rdi,rax
  80482c:	e8 4c 00 00 00       	call   80487d <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804831:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  804837:	89 05 8f 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10a8f],eax        # 4152cc <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  80483d:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  804843:	01 c0                	add    eax,eax
  804845:	83 c0 05             	add    eax,0x5
  804848:	c1 e0 03             	shl    eax,0x3
  80484b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  80484e:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  804854:	48 98                	cdqe   
  804856:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80485d:	48 05 d0 01 00 00    	add    rax,0x1d0
  804863:	48 05 40 85 40 00    	add    rax,0x408540
  804869:	48 83 c0 08          	add    rax,0x8
  80486d:	48 89 c6             	mov    rsi,rax
  804870:	bf 00 00 00 00       	mov    edi,0x0
  804875:	e8 65 09 00 00       	call   8051df <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80487a:	90                   	nop
  80487b:	c9                   	leave  
  80487c:	c3                   	ret    

000000000080487d <save_context>:
void save_context(TSS *tss)
{
  80487d:	f3 0f 1e fa          	endbr64 
  804881:	55                   	push   rbp
  804882:	48 89 e5             	mov    rbp,rsp
  804885:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  804889:	90                   	nop
  80488a:	5d                   	pop    rbp
  80488b:	c3                   	ret    

000000000080488c <palloc>:
    task[index].stat=TASK_READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  80488c:	f3 0f 1e fa          	endbr64 
  804890:	55                   	push   rbp
  804891:	48 89 e5             	mov    rbp,rsp
  804894:	48 83 ec 60          	sub    rsp,0x60
  804898:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80489b:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  80489e:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8048a1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8048a7:	85 c0                	test   eax,eax
  8048a9:	0f 48 c2             	cmovs  eax,edx
  8048ac:	c1 f8 0c             	sar    eax,0xc
  8048af:	89 c1                	mov    ecx,eax
  8048b1:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8048b4:	99                   	cdq    
  8048b5:	c1 ea 14             	shr    edx,0x14
  8048b8:	01 d0                	add    eax,edx
  8048ba:	25 ff 0f 00 00       	and    eax,0xfff
  8048bf:	29 d0                	sub    eax,edx
  8048c1:	01 c8                	add    eax,ecx
  8048c3:	85 c0                	test   eax,eax
  8048c5:	0f 95 c0             	setne  al
  8048c8:	0f b6 c0             	movzx  eax,al
  8048cb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  8048ce:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  8048d5:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8048dc:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  8048dd:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8048e4:	00 
    pgind++;
  8048e5:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8048ea:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  8048f1:	e9 30 02 00 00       	jmp    804b26 <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  8048f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8048fd:	25 00 f0 ff ff       	and    eax,0xfffff000
  804902:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  804906:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80490d:	e9 fe 01 00 00       	jmp    804b10 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  804912:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804916:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804919:	83 e0 01             	and    eax,0x1
  80491c:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  80491f:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804923:	0f 85 de 01 00 00    	jne    804b07 <palloc+0x27b>
            {
                int new_pg=req_a_page();
  804929:	b8 00 00 00 00       	mov    eax,0x0
  80492e:	e8 f9 cc ff ff       	call   80162c <req_a_page>
  804933:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  804936:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  80493a:	0f 85 b9 00 00 00    	jne    8049f9 <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804940:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804943:	48 98                	cdqe   
  804945:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80494c:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804952:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804955:	0f b7 c0             	movzx  eax,ax
  804958:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80495b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80495e:	48 98                	cdqe   
  804960:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804967:	48 05 a0 85 40 00    	add    rax,0x4085a0
  80496d:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804971:	0f b7 c0             	movzx  eax,ax
  804974:	c1 e0 10             	shl    eax,0x10
  804977:	25 00 00 0f 00       	and    eax,0xf0000
  80497c:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  80497f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804982:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804985:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804988:	89 c2                	mov    edx,eax
  80498a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80498d:	48 98                	cdqe   
  80498f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804996:	48 05 a8 85 40 00    	add    rax,0x4085a8
  80499c:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80499f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049a2:	48 98                	cdqe   
  8049a4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8049ab:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8049b1:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8049b5:	0f b7 c0             	movzx  eax,ax
  8049b8:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  8049bb:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8049c2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8049c5:	c1 e8 10             	shr    eax,0x10
  8049c8:	83 e0 0f             	and    eax,0xf
  8049cb:	89 c2                	mov    edx,eax
  8049cd:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8049d0:	01 d0                	add    eax,edx
  8049d2:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8049d5:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8049d8:	89 c2                	mov    edx,eax
  8049da:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049dd:	48 98                	cdqe   
  8049df:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8049e6:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8049ec:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8049f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049f4:	e9 3f 01 00 00       	jmp    804b38 <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  8049f9:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8049fc:	89 c7                	mov    edi,eax
  8049fe:	e8 18 ce ff ff       	call   80181b <get_phyaddr>
  804a03:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804a06:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  804a09:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a0d:	ba 07 00 00 00       	mov    edx,0x7
  804a12:	89 ce                	mov    esi,ecx
  804a14:	48 89 c7             	mov    rdi,rax
  804a17:	e8 12 ce ff ff       	call   80182e <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804a1c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a1f:	c1 e0 0a             	shl    eax,0xa
  804a22:	89 c2                	mov    edx,eax
  804a24:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804a27:	01 d0                	add    eax,edx
  804a29:	c1 e0 0c             	shl    eax,0xc
  804a2c:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804a2f:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804a34:	75 09                	jne    804a3f <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804a36:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804a39:	89 05 95 08 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10895],eax        # 4152d4 <palloc_paddr>
                }
                page_c--;
  804a3f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804a43:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804a47:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804a4b:	0f 85 b6 00 00 00    	jne    804b07 <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804a51:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a54:	48 98                	cdqe   
  804a56:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a5d:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804a63:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804a66:	0f b7 c0             	movzx  eax,ax
  804a69:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804a6c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a6f:	48 98                	cdqe   
  804a71:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a78:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804a7e:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804a82:	0f b7 c0             	movzx  eax,ax
  804a85:	c1 e0 10             	shl    eax,0x10
  804a88:	25 00 00 0f 00       	and    eax,0xf0000
  804a8d:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804a90:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804a93:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804a96:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804a99:	89 c2                	mov    edx,eax
  804a9b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a9e:	48 98                	cdqe   
  804aa0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804aa7:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804aad:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804ab0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804ab3:	48 98                	cdqe   
  804ab5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804abc:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804ac2:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804ac6:	0f b7 c0             	movzx  eax,ax
  804ac9:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804acc:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804ad3:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804ad6:	c1 e8 10             	shr    eax,0x10
  804ad9:	83 e0 0f             	and    eax,0xf
  804adc:	89 c2                	mov    edx,eax
  804ade:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804ae1:	01 d0                	add    eax,edx
  804ae3:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804ae6:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804ae9:	89 c2                	mov    edx,eax
  804aeb:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804aee:	48 98                	cdqe   
  804af0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804af7:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804afd:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  804b01:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b05:	eb 31                	jmp    804b38 <palloc+0x2ac>
                }
            }
            tblp++;
  804b07:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804b0c:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804b10:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804b17:	0f 8e f5 fd ff ff    	jle    804912 <palloc+0x86>
        }
        pgind++;
  804b1d:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804b22:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b26:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804b2d:	0f 8e c3 fd ff ff    	jle    8048f6 <palloc+0x6a>
    }
    return NULL;
  804b33:	b8 00 00 00 00       	mov    eax,0x0
}
  804b38:	c9                   	leave  
  804b39:	c3                   	ret    

0000000000804b3a <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804b3a:	f3 0f 1e fa          	endbr64 
  804b3e:	55                   	push   rbp
  804b3f:	48 89 e5             	mov    rbp,rsp
  804b42:	48 83 ec 10          	sub    rsp,0x10
  804b46:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804b49:	8b 05 7d 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1077d]        # 4152cc <cur_proc>
  804b4f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804b52:	89 d6                	mov    esi,edx
  804b54:	89 c7                	mov    edi,eax
  804b56:	e8 31 fd ff ff       	call   80488c <palloc>
}
  804b5b:	c9                   	leave  
  804b5c:	c3                   	ret    

0000000000804b5d <proc_end>:
void proc_end()
{
  804b5d:	f3 0f 1e fa          	endbr64 
  804b61:	55                   	push   rbp
  804b62:	48 89 e5             	mov    rbp,rsp
  804b65:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804b69:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804b6c:	8b 05 5a 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1075a]        # 4152cc <cur_proc>
  804b72:	89 c7                	mov    edi,eax
  804b74:	e8 75 00 00 00       	call   804bee <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804b79:	8b 05 4d 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1074d]        # 4152cc <cur_proc>
  804b7f:	48 98                	cdqe   
  804b81:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b88:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804b8e:	8b 00                	mov    eax,DWORD PTR [rax]
  804b90:	83 f8 ff             	cmp    eax,0xffffffff
  804b93:	74 4c                	je     804be1 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=TASK_READY;
  804b95:	8b 05 31 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10731]        # 4152cc <cur_proc>
  804b9b:	48 98                	cdqe   
  804b9d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804ba4:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804baa:	8b 00                	mov    eax,DWORD PTR [rax]
  804bac:	89 c0                	mov    eax,eax
  804bae:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804bb5:	48 05 58 85 40 00    	add    rax,0x408558
  804bbb:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        switch_proc_tss(task[cur_proc].parent_pid);
  804bc1:	8b 05 05 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10705]        # 4152cc <cur_proc>
  804bc7:	48 98                	cdqe   
  804bc9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804bd0:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804bd6:	8b 00                	mov    eax,DWORD PTR [rax]
  804bd8:	89 c7                	mov    edi,eax
  804bda:	e8 ae fb ff ff       	call   80478d <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804bdf:	eb 0a                	jmp    804beb <proc_end+0x8e>
        switch_proc_tss(0);
  804be1:	bf 00 00 00 00       	mov    edi,0x0
  804be6:	e8 a2 fb ff ff       	call   80478d <switch_proc_tss>
}
  804beb:	90                   	nop
  804bec:	c9                   	leave  
  804bed:	c3                   	ret    

0000000000804bee <del_proc>:
void del_proc(int pnr)
{
  804bee:	f3 0f 1e fa          	endbr64 
  804bf2:	55                   	push   rbp
  804bf3:	48 89 e5             	mov    rbp,rsp
  804bf6:	48 83 ec 20          	sub    rsp,0x20
  804bfa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    task[pnr].stat=TASK_ZOMBIE;
  804bfd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c00:	48 98                	cdqe   
  804c02:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c09:	48 05 58 85 40 00    	add    rax,0x408558
  804c0f:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
//    task[pnr].pid=-1;
    //释放申请的页面
    release_mmap(&task[pnr]);
  804c15:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c18:	48 98                	cdqe   
  804c1a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c21:	48 05 40 85 40 00    	add    rax,0x408540
  804c27:	48 89 c7             	mov    rdi,rax
  804c2a:	e8 a7 11 00 00       	call   805dd6 <release_mmap>
    //释放存放页目录的页面
    vmfree(task[pnr].pml4);
  804c2f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c32:	48 98                	cdqe   
  804c34:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c3b:	48 05 00 86 40 00    	add    rax,0x408600
  804c41:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c44:	48 89 c7             	mov    rdi,rax
  804c47:	e8 a1 c6 ff ff       	call   8012ed <vmfree>
    //关闭打开的文件
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804c4c:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  804c53:	eb 38                	jmp    804c8d <del_proc+0x9f>
        if(task[pnr].openf[i]){
  804c55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c58:	48 98                	cdqe   
  804c5a:	48 8d 50 1a          	lea    rdx,[rax+0x1a]
  804c5e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c61:	48 98                	cdqe   
  804c63:	48 c1 e2 03          	shl    rdx,0x3
  804c67:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c6e:	48 01 d0             	add    rax,rdx
  804c71:	48 05 48 85 40 00    	add    rax,0x408548
  804c77:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c7a:	48 85 c0             	test   rax,rax
  804c7d:	74 0a                	je     804c89 <del_proc+0x9b>
            sys_close(i);
  804c7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c82:	89 c7                	mov    edi,eax
  804c84:	e8 31 3e 00 00       	call   808aba <sys_close>
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804c89:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804c8d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804c91:	7e c2                	jle    804c55 <del_proc+0x67>
        }
    }
    //三个std判断一下是否是会话leader，是的话再关闭
    if(task[pnr].sid==task[pnr].pid){
  804c93:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c96:	48 98                	cdqe   
  804c98:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c9f:	48 05 48 85 40 00    	add    rax,0x408548
  804ca5:	8b 10                	mov    edx,DWORD PTR [rax]
  804ca7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804caa:	48 98                	cdqe   
  804cac:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804cb3:	48 05 40 85 40 00    	add    rax,0x408540
  804cb9:	8b 00                	mov    eax,DWORD PTR [rax]
  804cbb:	39 c2                	cmp    edx,eax
  804cbd:	75 45                	jne    804d04 <del_proc+0x116>
        //tty和console断联
        sys_ioctl(0,TTY_DISCONNECT,0);
  804cbf:	ba 00 00 00 00       	mov    edx,0x0
  804cc4:	be 02 00 00 00       	mov    esi,0x2
  804cc9:	bf 00 00 00 00       	mov    edi,0x0
  804cce:	e8 d3 1a 00 00       	call   8067a6 <sys_ioctl>
        sys_close(0);
  804cd3:	bf 00 00 00 00       	mov    edi,0x0
  804cd8:	e8 dd 3d 00 00       	call   808aba <sys_close>
        sys_close(1);
  804cdd:	bf 01 00 00 00       	mov    edi,0x1
  804ce2:	e8 d3 3d 00 00       	call   808aba <sys_close>
        sys_close(2);
  804ce7:	bf 02 00 00 00       	mov    edi,0x2
  804cec:	e8 c9 3d 00 00       	call   808aba <sys_close>
        //然后,关闭所有前台进程组的进程
        for(int i=0;i<MAX_TASKS;i++){
  804cf1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804cf8:	eb 04                	jmp    804cfe <del_proc+0x110>
  804cfa:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804cfe:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  804d02:	7e f6                	jle    804cfa <del_proc+0x10c>
    }
    //TODO 给子进程发送SIGHUP信号结束他们
    //
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804d04:	90                   	nop
  804d05:	c9                   	leave  
  804d06:	c3                   	ret    

0000000000804d07 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804d07:	f3 0f 1e fa          	endbr64 
  804d0b:	55                   	push   rbp
  804d0c:	48 89 e5             	mov    rbp,rsp
  804d0f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804d12:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804d15:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804d19:	75 07                	jne    804d22 <set_proc_stat+0x1b>
  804d1b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d20:	eb 79                	jmp    804d9b <set_proc_stat+0x94>
    int i=0;
  804d22:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804d29:	eb 04                	jmp    804d2f <set_proc_stat+0x28>
  804d2b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804d2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d32:	48 98                	cdqe   
  804d34:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d3b:	48 05 40 85 40 00    	add    rax,0x408540
  804d41:	8b 10                	mov    edx,DWORD PTR [rax]
  804d43:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d46:	39 c2                	cmp    edx,eax
  804d48:	75 e1                	jne    804d2b <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804d4a:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804d4e:	75 07                	jne    804d57 <set_proc_stat+0x50>
  804d50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d55:	eb 44                	jmp    804d9b <set_proc_stat+0x94>
    task[i].stat=stat;
  804d57:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804d5a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804d5d:	48 63 d2             	movsxd rdx,edx
  804d60:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  804d67:	48 81 c2 58 85 40 00 	add    rdx,0x408558
  804d6e:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804d70:	8b 05 56 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10556]        # 4152cc <cur_proc>
  804d76:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804d79:	75 1b                	jne    804d96 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804d7b:	8b 05 4b 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1054b]        # 4152cc <cur_proc>
  804d81:	48 98                	cdqe   
  804d83:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d8a:	48 05 5c 85 40 00    	add    rax,0x40855c
  804d90:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  804d96:	b8 00 00 00 00       	mov    eax,0x0
}
  804d9b:	5d                   	pop    rbp
  804d9c:	c3                   	ret    

0000000000804d9d <sys_exit>:
//}
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804d9d:	f3 0f 1e fa          	endbr64 
  804da1:	55                   	push   rbp
  804da2:	48 89 e5             	mov    rbp,rsp
  804da5:	48 83 ec 10          	sub    rsp,0x10
  804da9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    current->exit_code=code;
  804dac:	48 8b 05 8d 04 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1048d]        # 415240 <current>
  804db3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804db6:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
    del_proc(cur_proc);
  804db9:	8b 05 0d 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1050d]        # 4152cc <cur_proc>
  804dbf:	89 c7                	mov    edi,eax
  804dc1:	e8 28 fe ff ff       	call   804bee <del_proc>
    while(1)
        manage_proc();
  804dc6:	b8 00 00 00 00       	mov    eax,0x0
  804dcb:	e8 2a f8 ff ff       	call   8045fa <manage_proc>
  804dd0:	eb f4                	jmp    804dc6 <sys_exit+0x29>

0000000000804dd2 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804dd2:	f3 0f 1e fa          	endbr64 
  804dd6:	55                   	push   rbp
  804dd7:	48 89 e5             	mov    rbp,rsp
  804dda:	53                   	push   rbx
  804ddb:	48 83 ec 48          	sub    rsp,0x48
  804ddf:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804de3:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804de7:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804deb:	b8 00 00 00 00       	mov    eax,0x0
  804df0:	e8 78 f5 ff ff       	call   80436d <req_proc>
  804df5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804df8:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804dfc:	75 0a                	jne    804e08 <reg_proc+0x36>
  804dfe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804e03:	e9 8c 01 00 00       	jmp    804f94 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804e08:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804e0c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804e0f:	52                   	push   rdx
  804e10:	6a 00                	push   0x0
  804e12:	50                   	push   rax
  804e13:	6a 00                	push   0x0
  804e15:	6a 00                	push   0x0
  804e17:	6a 00                	push   0x0
  804e19:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804e1e:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804e25:	00 
  804e26:	6a 28                	push   0x28
  804e28:	6a 28                	push   0x28
  804e2a:	6a 28                	push   0x28
  804e2c:	6a 28                	push   0x28
  804e2e:	41 b9 30 00 00 00    	mov    r9d,0x30
  804e34:	41 b8 28 00 00 00    	mov    r8d,0x28
  804e3a:	b9 00 00 00 00       	mov    ecx,0x0
  804e3f:	ba 00 00 00 00       	mov    edx,0x0
  804e44:	be 00 00 00 00       	mov    esi,0x0
  804e49:	bf 00 00 00 00       	mov    edi,0x0
  804e4e:	e8 e5 f5 ff ff       	call   804438 <set_proc>
  804e53:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804e57:	b8 00 00 00 00       	mov    eax,0x0
  804e5c:	e8 ec c3 ff ff       	call   80124d <vmalloc>
  804e61:	48 89 c2             	mov    rdx,rax
  804e64:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e67:	48 98                	cdqe   
  804e69:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e70:	48 05 00 86 40 00    	add    rax,0x408600
  804e76:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  804e79:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e7c:	48 98                	cdqe   
  804e7e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e85:	48 05 00 86 40 00    	add    rax,0x408600
  804e8b:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  804e8e:	b8 00 00 00 00       	mov    eax,0x0
  804e93:	e8 b5 c3 ff ff       	call   80124d <vmalloc>
  804e98:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804e9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e9e:	48 98                	cdqe   
  804ea0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804ea7:	48 05 00 86 40 00    	add    rax,0x408600
  804ead:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804eb0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804eb4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804eb8:	ba 03 00 00 00       	mov    edx,0x3
  804ebd:	be 00 00 00 00       	mov    esi,0x0
  804ec2:	48 89 c7             	mov    rdi,rax
  804ec5:	e8 b5 c9 ff ff       	call   80187f <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804eca:	b8 00 00 00 00       	mov    eax,0x0
  804ecf:	e8 79 c3 ff ff       	call   80124d <vmalloc>
  804ed4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804ed8:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804edc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804ee0:	48 83 c0 18          	add    rax,0x18
  804ee4:	48 83 ca 07          	or     rdx,0x7
  804ee8:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804eeb:	b8 00 00 00 00       	mov    eax,0x0
  804ef0:	e8 37 c7 ff ff       	call   80162c <req_a_page>
  804ef5:	89 c7                	mov    edi,eax
  804ef7:	e8 1f c9 ff ff       	call   80181b <get_phyaddr>
  804efc:	89 c1                	mov    ecx,eax
  804efe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804f02:	48 05 f8 0f 00 00    	add    rax,0xff8
  804f08:	ba 06 00 00 00       	mov    edx,0x6
  804f0d:	89 ce                	mov    esi,ecx
  804f0f:	48 89 c7             	mov    rdi,rax
  804f12:	e8 bf c9 ff ff       	call   8018d6 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804f17:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f1a:	48 98                	cdqe   
  804f1c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f23:	48 05 00 86 40 00    	add    rax,0x408600
  804f29:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f2c:	48 89 c2             	mov    rdx,rax
  804f2f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f32:	48 98                	cdqe   
  804f34:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f3b:	48 05 80 87 40 00    	add    rax,0x408780
  804f41:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=TASK_READY;
  804f45:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f48:	48 98                	cdqe   
  804f4a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f51:	48 05 58 85 40 00    	add    rax,0x408558
  804f57:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[i].cwd=cwd;
  804f5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f60:	48 98                	cdqe   
  804f62:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f69:	48 8d 90 08 86 40 00 	lea    rdx,[rax+0x408608]
  804f70:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f74:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  804f77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f7a:	48 98                	cdqe   
  804f7c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f83:	48 8d 90 10 86 40 00 	lea    rdx,[rax+0x408610]
  804f8a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804f8e:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  804f91:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804f94:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804f98:	c9                   	leave  
  804f99:	c3                   	ret    

0000000000804f9a <sys_malloc>:

void * sys_malloc(int size)
{
  804f9a:	f3 0f 1e fa          	endbr64 
  804f9e:	55                   	push   rbp
  804f9f:	48 89 e5             	mov    rbp,rsp
  804fa2:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804fa5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fa8:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804fae:	85 c0                	test   eax,eax
  804fb0:	0f 48 c2             	cmovs  eax,edx
  804fb3:	c1 f8 0c             	sar    eax,0xc
  804fb6:	89 c1                	mov    ecx,eax
  804fb8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fbb:	99                   	cdq    
  804fbc:	c1 ea 14             	shr    edx,0x14
  804fbf:	01 d0                	add    eax,edx
  804fc1:	25 ff 0f 00 00       	and    eax,0xfff
  804fc6:	29 d0                	sub    eax,edx
  804fc8:	01 c8                	add    eax,ecx
  804fca:	85 c0                	test   eax,eax
  804fcc:	0f 95 c0             	setne  al
  804fcf:	0f b6 c0             	movzx  eax,al
  804fd2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804fd5:	8b 05 f1 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc102f1]        # 4152cc <cur_proc>
  804fdb:	48 98                	cdqe   
  804fdd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804fe4:	48 05 68 85 40 00    	add    rax,0x408568
  804fea:	8b 00                	mov    eax,DWORD PTR [rax]
  804fec:	48 98                	cdqe   
  804fee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804ff2:	eb 0c                	jmp    805000 <sys_malloc+0x66>
        hp=hp->next;
  804ff4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ff8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ffc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  805000:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805004:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805008:	48 85 c0             	test   rax,rax
  80500b:	74 16                	je     805023 <sys_malloc+0x89>
  80500d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805011:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805014:	85 c0                	test   eax,eax
  805016:	75 0b                	jne    805023 <sys_malloc+0x89>
  805018:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80501c:	8b 00                	mov    eax,DWORD PTR [rax]
  80501e:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  805021:	7e d1                	jle    804ff4 <sys_malloc+0x5a>
    if(hp->pgn<n)
  805023:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805027:	8b 00                	mov    eax,DWORD PTR [rax]
  805029:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80502c:	7e 7f                	jle    8050ad <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  80502e:	8b 05 98 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10298]        # 4152cc <cur_proc>
  805034:	48 98                	cdqe   
  805036:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80503d:	48 05 6c 85 40 00    	add    rax,0x40856c
  805043:	8b 10                	mov    edx,DWORD PTR [rax]
  805045:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805048:	c1 e0 0c             	shl    eax,0xc
  80504b:	01 d0                	add    eax,edx
  80504d:	3d ff ff ef 01       	cmp    eax,0x1efffff
  805052:	7e 0a                	jle    80505e <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  805054:	b8 00 00 00 00       	mov    eax,0x0
  805059:	e9 c8 00 00 00       	jmp    805126 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  80505e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805062:	8b 10                	mov    edx,DWORD PTR [rax]
  805064:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805067:	29 d0                	sub    eax,edx
  805069:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  80506c:	8b 05 5a 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1025a]        # 4152cc <cur_proc>
  805072:	48 98                	cdqe   
  805074:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80507b:	48 05 6c 85 40 00    	add    rax,0x40856c
  805081:	8b 00                	mov    eax,DWORD PTR [rax]
  805083:	48 98                	cdqe   
  805085:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  805089:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805090:	eb 13                	jmp    8050a5 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  805092:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805096:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  805099:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8050a0:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8050a1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8050a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8050a8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8050ab:	7c e5                	jl     805092 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8050ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050b1:	8b 00                	mov    eax,DWORD PTR [rax]
  8050b3:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8050b6:	7d 59                	jge    805111 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  8050b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050bc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8050c0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8050c3:	83 c0 01             	add    eax,0x1
  8050c6:	c1 e0 0c             	shl    eax,0xc
  8050c9:	48 98                	cdqe   
  8050cb:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8050cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8050d3:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8050d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050db:	8b 00                	mov    eax,DWORD PTR [rax]
  8050dd:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8050e0:	8d 50 ff             	lea    edx,[rax-0x1]
  8050e3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050e7:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8050e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050ed:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8050f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050f5:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8050f9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050fd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805101:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  805105:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805109:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80510d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  805111:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805115:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80511c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805120:	48 05 00 10 00 00    	add    rax,0x1000
}
  805126:	5d                   	pop    rbp
  805127:	c3                   	ret    

0000000000805128 <sys_free>:
int sys_free(int ptr)
{
  805128:	f3 0f 1e fa          	endbr64 
  80512c:	55                   	push   rbp
  80512d:	48 89 e5             	mov    rbp,rsp
  805130:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  805133:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805136:	2d 00 10 00 00       	sub    eax,0x1000
  80513b:	48 98                	cdqe   
  80513d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  805141:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805145:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  80514c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805150:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805154:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805158:	eb 2e                	jmp    805188 <sys_free+0x60>
    {
        if(p->alloc==0)
  80515a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80515e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805161:	85 c0                	test   eax,eax
  805163:	75 2c                	jne    805191 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  805165:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805169:	8b 10                	mov    edx,DWORD PTR [rax]
  80516b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80516f:	8b 00                	mov    eax,DWORD PTR [rax]
  805171:	83 c0 01             	add    eax,0x1
  805174:	01 c2                	add    edx,eax
  805176:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80517a:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  80517c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805180:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805184:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805188:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80518d:	75 cb                	jne    80515a <sys_free+0x32>
  80518f:	eb 01                	jmp    805192 <sys_free+0x6a>
            break;
  805191:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  805192:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805196:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80519a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80519e:	eb 2e                	jmp    8051ce <sys_free+0xa6>
    {
        if(p->alloc==0)
  8051a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051a4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8051a7:	85 c0                	test   eax,eax
  8051a9:	75 2c                	jne    8051d7 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8051ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051af:	8b 10                	mov    edx,DWORD PTR [rax]
  8051b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8051b7:	83 c0 01             	add    eax,0x1
  8051ba:	01 c2                	add    edx,eax
  8051bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051c0:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8051c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051c6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8051ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8051ce:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8051d3:	75 cb                	jne    8051a0 <sys_free+0x78>
  8051d5:	eb 01                	jmp    8051d8 <sys_free+0xb0>
            break;
  8051d7:	90                   	nop
    }
    //合并完成
    return 0;
  8051d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8051dd:	5d                   	pop    rbp
  8051de:	c3                   	ret    

00000000008051df <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8051df:	f3 0f 1e fa          	endbr64 
  8051e3:	55                   	push   rbp
  8051e4:	48 89 e5             	mov    rbp,rsp
  8051e7:	53                   	push   rbx
  8051e8:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8051ec:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8051f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8051f4:	48 2d 40 85 40 00    	sub    rax,0x408540
  8051fa:	48 c1 f8 02          	sar    rax,0x2
  8051fe:	48 89 c2             	mov    rdx,rax
  805201:	48 b8 05 ec 4f c0 fe 	movabs rax,0x4fec04fec04fec05
  805208:	04 ec 4f 
  80520b:	48 0f af c2          	imul   rax,rdx
  80520f:	89 05 b7 00 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc100b7],eax        # 4152cc <cur_proc>
    current=&task[cur_proc];
  805215:	8b 05 b1 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100b1]        # 4152cc <cur_proc>
  80521b:	48 98                	cdqe   
  80521d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805224:	48 05 40 85 40 00    	add    rax,0x408540
  80522a:	48 89 05 0f 00 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1000f],rax        # 415240 <current>
    asm volatile("mov %0,%%rax\n"
  805231:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805235:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  80523c:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  80523f:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  805243:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  805247:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80524b:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  80524f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805253:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805257:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80525b:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  80525f:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  805263:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805267:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  80526e:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 805299 <done>
  805275:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  80527c:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  805283:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  805289:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  805290:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  805297:	eb 08                	jmp    8052a1 <__switch_to>

0000000000805299 <done>:
  805299:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  80529a:	90                   	nop
  80529b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80529f:	c9                   	leave  
  8052a0:	c3                   	ret    

00000000008052a1 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  8052a1:	f3 0f 1e fa          	endbr64 
  8052a5:	55                   	push   rbp
  8052a6:	48 89 e5             	mov    rbp,rsp
  8052a9:	53                   	push   rbx
  8052aa:	48 83 ec 18          	sub    rsp,0x18
  8052ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8052b2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052b6:	48 8b 05 43 87 00 00 	mov    rax,QWORD PTR [rip+0x8743]        # 80da00 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052bd:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052c1:	48 8b 05 38 87 00 00 	mov    rax,QWORD PTR [rip+0x8738]        # 80da00 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052c8:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052cc:	48 8b 05 2d 87 00 00 	mov    rax,QWORD PTR [rip+0x872d]        # 80da00 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052d3:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052d7:	48 8b 05 22 87 00 00 	mov    rax,QWORD PTR [rip+0x8722]        # 80da00 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052de:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052e2:	48 8b 05 17 87 00 00 	mov    rax,QWORD PTR [rip+0x8717]        # 80da00 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052e9:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8052ed:	48 8b 05 0c 87 00 00 	mov    rax,QWORD PTR [rip+0x870c]        # 80da00 <tss>
  8052f4:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8052f8:	48 8b 05 01 87 00 00 	mov    rax,QWORD PTR [rip+0x8701]        # 80da00 <tss>
  8052ff:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  805303:	48 8b 05 f6 86 00 00 	mov    rax,QWORD PTR [rip+0x86f6]        # 80da00 <tss>
  80530a:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80530e:	48 8b 05 eb 86 00 00 	mov    rax,QWORD PTR [rip+0x86eb]        # 80da00 <tss>
  805315:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  805319:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80531d:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  805324:	41 52                	push   r10
  805326:	41 51                	push   r9
  805328:	41 50                	push   r8
  80532a:	57                   	push   rdi
  80532b:	49 89 d9             	mov    r9,rbx
  80532e:	4d 89 d8             	mov    r8,r11
  805331:	48 89 c7             	mov    rdi,rax
  805334:	e8 34 00 00 00       	call   80536d <set_tss>
  805339:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  80533d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805341:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805345:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805349:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80534d:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  805353:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  805359:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  80535f:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  805365:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  805366:	90                   	nop
  805367:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80536b:	c9                   	leave  
  80536c:	c3                   	ret    

000000000080536d <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  80536d:	f3 0f 1e fa          	endbr64 
  805371:	55                   	push   rbp
  805372:	48 89 e5             	mov    rbp,rsp
  805375:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805379:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80537d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  805381:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  805385:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  805389:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  80538d:	48 8b 05 6c 86 00 00 	mov    rax,QWORD PTR [rip+0x866c]        # 80da00 <tss>
  805394:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805398:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  80539c:	48 8b 05 5d 86 00 00 	mov    rax,QWORD PTR [rip+0x865d]        # 80da00 <tss>
  8053a3:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8053a7:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  8053ab:	48 8b 05 4e 86 00 00 	mov    rax,QWORD PTR [rip+0x864e]        # 80da00 <tss>
  8053b2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8053b6:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  8053ba:	48 8b 05 3f 86 00 00 	mov    rax,QWORD PTR [rip+0x863f]        # 80da00 <tss>
  8053c1:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8053c5:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  8053c9:	48 8b 05 30 86 00 00 	mov    rax,QWORD PTR [rip+0x8630]        # 80da00 <tss>
  8053d0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8053d4:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  8053d8:	48 8b 05 21 86 00 00 	mov    rax,QWORD PTR [rip+0x8621]        # 80da00 <tss>
  8053df:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8053e3:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  8053e7:	48 8b 05 12 86 00 00 	mov    rax,QWORD PTR [rip+0x8612]        # 80da00 <tss>
  8053ee:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8053f2:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  8053f6:	48 8b 05 03 86 00 00 	mov    rax,QWORD PTR [rip+0x8603]        # 80da00 <tss>
  8053fd:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805401:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  805405:	48 8b 05 f4 85 00 00 	mov    rax,QWORD PTR [rip+0x85f4]        # 80da00 <tss>
  80540c:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  805410:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  805414:	48 8b 05 e5 85 00 00 	mov    rax,QWORD PTR [rip+0x85e5]        # 80da00 <tss>
  80541b:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80541f:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  805423:	90                   	nop
  805424:	5d                   	pop    rbp
  805425:	c3                   	ret    

0000000000805426 <fork_child_ret>:

int fork_child_ret(){
  805426:	f3 0f 1e fa          	endbr64 
  80542a:	55                   	push   rbp
  80542b:	48 89 e5             	mov    rbp,rsp
    return 0;
  80542e:	b8 00 00 00 00       	mov    eax,0x0

}
  805433:	5d                   	pop    rbp
  805434:	c3                   	ret    

0000000000805435 <sys_fork>:

int sys_fork(void){
  805435:	f3 0f 1e fa          	endbr64 
  805439:	55                   	push   rbp
  80543a:	48 89 e5             	mov    rbp,rsp
  80543d:	53                   	push   rbx
  80543e:	48 81 ec 98 00 00 00 	sub    rsp,0x98
    int pid=req_proc();
  805445:	b8 00 00 00 00       	mov    eax,0x0
  80544a:	e8 1e ef ff ff       	call   80436d <req_proc>
  80544f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  805452:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  805456:	75 0a                	jne    805462 <sys_fork+0x2d>
  805458:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80545d:	e9 6e 09 00 00       	jmp    805dd0 <sys_fork+0x99b>
    task[pid].regs=current->regs;
  805462:	48 8b 05 d7 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fdd7]        # 415240 <current>
  805469:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80546c:	48 63 d2             	movsxd rdx,edx
  80546f:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805476:	48 81 c2 80 87 40 00 	add    rdx,0x408780
  80547d:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  805484:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  80548b:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  80548f:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  805493:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  80549a:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  8054a1:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  8054a5:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  8054a9:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  8054b0:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  8054b7:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  8054bb:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  8054bf:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  8054c6:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  8054cd:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  8054d1:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  8054d5:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  8054dc:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  8054e3:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  8054e7:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  8054eb:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  8054f2:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  8054f9:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  8054fd:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  805501:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  805508:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  80550f:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  805513:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  805517:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  80551e:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  805525:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  805529:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  80552d:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  805534:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  80553b:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  805542:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  805549:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  805550:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  805557:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  80555e:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  805565:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  80556c:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  805573:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  80557a:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  805581:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  805588:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  80558f:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  805596:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  80559d:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  8055a4:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  8055ab:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  8055b2:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  8055b9:	ba 11 d9 80 00       	mov    edx,0x80d911
  8055be:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055c1:	48 98                	cdqe   
  8055c3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055ca:	48 05 80 87 40 00    	add    rax,0x408780
  8055d0:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  8055d4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055d7:	48 98                	cdqe   
  8055d9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055e0:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8055e6:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8055ea:	48 2d a8 00 00 00    	sub    rax,0xa8
  8055f0:	48 89 c2             	mov    rdx,rax
  8055f3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055f6:	48 98                	cdqe   
  8055f8:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055ff:	48 05 b0 87 40 00    	add    rax,0x4087b0
  805605:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  805609:	48 8b 05 30 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc30]        # 415240 <current>
  805610:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805613:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805616:	48 63 d2             	movsxd rdx,edx
  805619:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805620:	48 81 c2 48 85 40 00 	add    rdx,0x408548
  805627:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  805629:	48 8b 05 10 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc10]        # 415240 <current>
  805630:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805633:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805636:	48 63 d2             	movsxd rdx,edx
  805639:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805640:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  805647:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  805649:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80564c:	48 98                	cdqe   
  80564e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805655:	48 05 b0 87 40 00    	add    rax,0x4087b0
  80565b:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80565f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  805663:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805667:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  80566e:	00 
    r->ds=DS_USER;
  80566f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805673:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  80567a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80567e:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  805685:	28 00 00 00 
    r->es=DS_USER;
  805689:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80568d:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  805694:	00 
    r->rax=task[pid].regs.rax;
  805695:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805698:	48 98                	cdqe   
  80569a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056a1:	48 05 90 87 40 00    	add    rax,0x408790
  8056a7:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8056ab:	48 89 c2             	mov    rdx,rax
  8056ae:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056b2:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  8056b6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056b9:	48 98                	cdqe   
  8056bb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056c2:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8056c8:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056cc:	48 89 c2             	mov    rdx,rax
  8056cf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056d3:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  8056d7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056da:	48 98                	cdqe   
  8056dc:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056e3:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8056e9:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056ed:	48 89 c2             	mov    rdx,rax
  8056f0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056f4:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  8056f8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056fb:	48 98                	cdqe   
  8056fd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805704:	48 05 a0 87 40 00    	add    rax,0x4087a0
  80570a:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80570e:	48 89 c2             	mov    rdx,rax
  805711:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805715:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  805719:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80571c:	48 98                	cdqe   
  80571e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805725:	48 05 c0 87 40 00    	add    rax,0x4087c0
  80572b:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80572f:	48 89 c2             	mov    rdx,rax
  805732:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805736:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  80573a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80573d:	48 98                	cdqe   
  80573f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805746:	48 05 d0 87 40 00    	add    rax,0x4087d0
  80574c:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805750:	48 89 c2             	mov    rdx,rax
  805753:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805757:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  80575b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80575e:	48 98                	cdqe   
  805760:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805767:	48 05 00 88 40 00    	add    rax,0x408800
  80576d:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805771:	48 89 c2             	mov    rdx,rax
  805774:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805778:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  80577c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80577f:	48 98                	cdqe   
  805781:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805788:	48 05 10 88 40 00    	add    rax,0x408810
  80578e:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805792:	48 89 c2             	mov    rdx,rax
  805795:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805799:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  80579d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057a0:	48 98                	cdqe   
  8057a2:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057a9:	48 05 10 88 40 00    	add    rax,0x408810
  8057af:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8057b3:	48 89 c2             	mov    rdx,rax
  8057b6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8057ba:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  8057be:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057c1:	48 98                	cdqe   
  8057c3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057ca:	48 05 20 88 40 00    	add    rax,0x408820
  8057d0:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8057d4:	48 89 c2             	mov    rdx,rax
  8057d7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8057db:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  8057df:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057e2:	48 98                	cdqe   
  8057e4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057eb:	48 05 20 88 40 00    	add    rax,0x408820
  8057f1:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8057f5:	48 89 c2             	mov    rdx,rax
  8057f8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8057fc:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  805800:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805803:	48 98                	cdqe   
  805805:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80580c:	48 05 30 88 40 00    	add    rax,0x408830
  805812:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805816:	48 89 c2             	mov    rdx,rax
  805819:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80581d:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  805821:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805824:	48 98                	cdqe   
  805826:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80582d:	48 05 30 88 40 00    	add    rax,0x408830
  805833:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805837:	48 89 c2             	mov    rdx,rax
  80583a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80583e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  805842:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805845:	48 98                	cdqe   
  805847:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80584e:	48 05 40 88 40 00    	add    rax,0x408840
  805854:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805858:	48 89 c2             	mov    rdx,rax
  80585b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80585f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  805863:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805867:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  80586e:	48 8b 05 cb f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f9cb]        # 415240 <current>
  805875:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805878:	48 63 d2             	movsxd rdx,edx
  80587b:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805882:	48 81 c2 10 87 40 00 	add    rdx,0x408710
  805889:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  805890:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  805897:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  80589b:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  80589f:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  8058a6:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  8058ad:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  8058b1:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  8058b5:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  8058bc:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  8058c3:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  8058c7:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  8058cb:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  8058d2:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  8058d9:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  8058dd:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  8058e1:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  8058e8:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  8058ef:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  8058f3:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  8058f7:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  8058fe:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  805905:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  805909:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  80590d:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  805914:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  805918:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  80591e:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=TASK_READY;
  805921:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805924:	48 98                	cdqe   
  805926:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80592d:	48 05 58 85 40 00    	add    rax,0x408558
  805933:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[pid].parent_pid=cur_proc;
  805939:	8b 05 8d f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f98d]        # 4152cc <cur_proc>
  80593f:	89 c2                	mov    edx,eax
  805941:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805944:	48 98                	cdqe   
  805946:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80594d:	48 05 dc 85 40 00    	add    rax,0x4085dc
  805953:	89 10                	mov    DWORD PTR [rax],edx
    //设置父子关系以及初始化子进程的的list节点
    list_init(&task[pid].node);
  805955:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805958:	48 98                	cdqe   
  80595a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805961:	48 05 10 03 00 00    	add    rax,0x310
  805967:	48 05 40 85 40 00    	add    rax,0x408540
  80596d:	48 83 c0 04          	add    rax,0x4
  805971:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    list->prev = NULL;
  805978:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80597f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  805986:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80598d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  805994:	00 
}
  805995:	90                   	nop
    task[pid].child_procs=NULL;
  805996:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805999:	48 98                	cdqe   
  80599b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059a2:	48 05 60 88 40 00    	add    rax,0x408860
  8059a8:	48 c7 40 0c 00 00 00 	mov    QWORD PTR [rax+0xc],0x0
  8059af:	00 
    task[pid].node.data=&task[pid];
  8059b0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059b3:	48 98                	cdqe   
  8059b5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059bc:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  8059c3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059c6:	48 98                	cdqe   
  8059c8:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059cf:	48 05 50 88 40 00    	add    rax,0x408850
  8059d5:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    list_add(current->child_procs,&task[pid].node);
  8059d9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059dc:	48 98                	cdqe   
  8059de:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059e5:	48 05 10 03 00 00    	add    rax,0x310
  8059eb:	48 05 40 85 40 00    	add    rax,0x408540
  8059f1:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8059f5:	48 8b 05 44 f8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f844]        # 415240 <current>
  8059fc:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  805a03:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  805a07:	48 89 55 90          	mov    QWORD PTR [rbp-0x70],rdx
    if(entry->next==NULL)
  805a0b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805a0f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a13:	48 85 c0             	test   rax,rax
  805a16:	75 58                	jne    805a70 <sys_fork+0x63b>
  805a18:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805a1c:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  805a20:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805a24:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  805a28:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  805a2c:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  805a30:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a34:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  805a38:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a3c:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  805a40:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  805a43:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a47:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a4b:	48 85 c0             	test   rax,rax
  805a4e:	74 0f                	je     805a5f <sys_fork+0x62a>
        new->next->prev = new;
  805a50:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a54:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a58:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  805a5c:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805a5f:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  805a63:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  805a67:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805a6b:	e9 d9 00 00 00       	jmp    805b49 <sys_fork+0x714>
        struct List* p=entry;
  805a70:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805a74:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
        for(;p->next&&p->next!=p;p=p->next){
  805a7b:	eb 2e                	jmp    805aab <sys_fork+0x676>
            if(p->data==new->data)
  805a7d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805a84:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  805a88:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805a8c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805a90:	48 39 c2             	cmp    rdx,rax
  805a93:	0f 84 af 00 00 00    	je     805b48 <sys_fork+0x713>
        for(;p->next&&p->next!=p;p=p->next){
  805a99:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805aa0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805aa4:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  805aab:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ab2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805ab6:	48 85 c0             	test   rax,rax
  805ab9:	74 14                	je     805acf <sys_fork+0x69a>
  805abb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ac2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805ac6:	48 39 85 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],rax
  805acd:	75 ae                	jne    805a7d <sys_fork+0x648>
  805acf:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ad6:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  805add:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805ae1:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    new->next = entry->next;
  805ae8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805aef:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  805af3:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805afa:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  805afe:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805b05:	48 8b 95 70 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x90]
  805b0c:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  805b0f:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805b16:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805b1a:	48 85 c0             	test   rax,rax
  805b1d:	74 15                	je     805b34 <sys_fork+0x6ff>
        new->next->prev = new;
  805b1f:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805b26:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805b2a:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  805b31:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805b34:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805b3b:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  805b42:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805b46:	eb 01                	jmp    805b49 <sys_fork+0x714>
                return;
  805b48:	90                   	nop
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805b49:	48 8b 05 f0 f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f6f0]        # 415240 <current>
  805b50:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  805b57:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b5a:	48 98                	cdqe   
  805b5c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b63:	48 05 d0 00 00 00    	add    rax,0xd0
  805b69:	48 05 40 85 40 00    	add    rax,0x408540
  805b6f:	48 83 c0 08          	add    rax,0x8
  805b73:	ba 00 01 00 00       	mov    edx,0x100
  805b78:	48 89 ce             	mov    rsi,rcx
  805b7b:	48 89 c7             	mov    rdi,rax
  805b7e:	e8 e7 73 00 00       	call   80cf6a <memcpy>
    task[pid].utime=0;
  805b83:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b86:	48 98                	cdqe   
  805b88:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b8f:	48 05 5c 85 40 00    	add    rax,0x40855c
  805b95:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  805b9b:	48 8b 0d 9e f6 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f69e]        # 415240 <current>
  805ba2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805ba5:	48 98                	cdqe   
  805ba7:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805bae:	48 8d b0 60 85 40 00 	lea    rsi,[rax+0x408560]
  805bb5:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  805bb9:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  805bbd:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  805bc1:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  805bc5:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  805bc9:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  805bcd:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  805bd1:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  805bd5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805bd8:	48 98                	cdqe   
  805bda:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805be1:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  805be8:	48 8b 05 51 f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f651]        # 415240 <current>
  805bef:	48 89 d6             	mov    rsi,rdx
  805bf2:	48 89 c7             	mov    rdi,rax
  805bf5:	e8 de 04 00 00       	call   8060d8 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805bfa:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805bfd:	48 98                	cdqe   
  805bff:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c06:	48 05 74 85 40 00    	add    rax,0x408574
  805c0c:	8b 00                	mov    eax,DWORD PTR [rax]
  805c0e:	2d 00 10 00 00       	sub    eax,0x1000
  805c13:	48 98                	cdqe   
  805c15:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805c19:	eb 5b                	jmp    805c76 <sys_fork+0x841>
        addr_t new_stkpg=vmalloc();
  805c1b:	b8 00 00 00 00       	mov    eax,0x0
  805c20:	e8 28 b6 ff ff       	call   80124d <vmalloc>
  805c25:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805c29:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805c2d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805c31:	ba 00 10 00 00       	mov    edx,0x1000
  805c36:	48 89 ce             	mov    rsi,rcx
  805c39:	48 89 c7             	mov    rdi,rax
  805c3c:	e8 29 73 00 00       	call   80cf6a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805c41:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c44:	48 98                	cdqe   
  805c46:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c4d:	48 05 00 86 40 00    	add    rax,0x408600
  805c53:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805c56:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805c5a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805c5e:	48 89 d1             	mov    rcx,rdx
  805c61:	ba 07 00 00 00       	mov    edx,0x7
  805c66:	48 89 c7             	mov    rdi,rax
  805c69:	e8 8f b3 ff ff       	call   800ffd <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805c6e:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  805c75:	00 
  805c76:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c79:	48 98                	cdqe   
  805c7b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c82:	48 05 70 85 40 00    	add    rax,0x408570
  805c88:	8b 00                	mov    eax,DWORD PTR [rax]
  805c8a:	48 98                	cdqe   
  805c8c:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805c90:	73 89                	jae    805c1b <sys_fork+0x7e6>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  805c92:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805c99:	00 
    int f=1;
  805c9a:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805ca1:	e9 81 00 00 00       	jmp    805d27 <sys_fork+0x8f2>
        addr_t new_stkpg=vmalloc();
  805ca6:	b8 00 00 00 00       	mov    eax,0x0
  805cab:	e8 9d b5 ff ff       	call   80124d <vmalloc>
  805cb0:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805cb4:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805cb8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805cbc:	ba 00 10 00 00       	mov    edx,0x1000
  805cc1:	48 89 ce             	mov    rsi,rcx
  805cc4:	48 89 c7             	mov    rdi,rax
  805cc7:	e8 9e 72 00 00       	call   80cf6a <memcpy>
        if(f){
  805ccc:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805cd0:	74 20                	je     805cf2 <sys_fork+0x8bd>
            f=0;
  805cd2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805cd9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805cdd:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805ce3:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805ce7:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805ceb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805cf2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805cf5:	48 98                	cdqe   
  805cf7:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805cfe:	48 05 00 86 40 00    	add    rax,0x408600
  805d04:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805d07:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805d0b:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805d0f:	48 89 d1             	mov    rcx,rdx
  805d12:	ba 07 00 00 00       	mov    edx,0x7
  805d17:	48 89 c7             	mov    rdi,rax
  805d1a:	e8 de b2 ff ff       	call   800ffd <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805d1f:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805d26:	00 
  805d27:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805d2e:	00 
  805d2f:	0f 87 71 ff ff ff    	ja     805ca6 <sys_fork+0x871>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805d35:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805d38:	48 98                	cdqe   
  805d3a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805d41:	48 05 6c 85 40 00    	add    rax,0x40856c
  805d47:	8b 00                	mov    eax,DWORD PTR [rax]
  805d49:	2d 00 10 00 00       	sub    eax,0x1000
  805d4e:	48 98                	cdqe   
  805d50:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805d54:	eb 5b                	jmp    805db1 <sys_fork+0x97c>
        addr_t new_hppg=vmalloc();
  805d56:	b8 00 00 00 00       	mov    eax,0x0
  805d5b:	e8 ed b4 ff ff       	call   80124d <vmalloc>
  805d60:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805d64:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  805d68:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d6c:	ba 00 10 00 00       	mov    edx,0x1000
  805d71:	48 89 ce             	mov    rsi,rcx
  805d74:	48 89 c7             	mov    rdi,rax
  805d77:	e8 ee 71 00 00       	call   80cf6a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805d7c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805d7f:	48 98                	cdqe   
  805d81:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805d88:	48 05 00 86 40 00    	add    rax,0x408600
  805d8e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805d91:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805d95:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d99:	48 89 d1             	mov    rcx,rdx
  805d9c:	ba 07 00 00 00       	mov    edx,0x7
  805da1:	48 89 c7             	mov    rdi,rax
  805da4:	e8 54 b2 ff ff       	call   800ffd <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805da9:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805db0:	00 
  805db1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805db4:	48 98                	cdqe   
  805db6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805dbd:	48 05 68 85 40 00    	add    rax,0x408568
  805dc3:	8b 00                	mov    eax,DWORD PTR [rax]
  805dc5:	48 98                	cdqe   
  805dc7:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805dcb:	73 89                	jae    805d56 <sys_fork+0x921>
    }
    //父进程运行到这里
    return pid;
  805dcd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805dd0:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805dd4:	c9                   	leave  
  805dd5:	c3                   	ret    

0000000000805dd6 <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805dd6:	f3 0f 1e fa          	endbr64 
  805dda:	55                   	push   rbp
  805ddb:	48 89 e5             	mov    rbp,rsp
  805dde:	48 83 ec 50          	sub    rsp,0x50
  805de2:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805de6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805dea:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805df1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805df5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805df9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805dfd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805e04:	e9 be 02 00 00       	jmp    8060c7 <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805e09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e0c:	48 98                	cdqe   
  805e0e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e15:	00 
  805e16:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e1a:	48 01 d0             	add    rax,rdx
  805e1d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e20:	83 e0 01             	and    eax,0x1
  805e23:	48 85 c0             	test   rax,rax
  805e26:	0f 84 97 02 00 00    	je     8060c3 <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805e2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e2f:	48 98                	cdqe   
  805e31:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e38:	00 
  805e39:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e3d:	48 01 d0             	add    rax,rdx
  805e40:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e43:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805e4a:	ff 00 00 
  805e4d:	48 21 d0             	and    rax,rdx
  805e50:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  805e54:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805e58:	0f 94 c0             	sete   al
  805e5b:	0f b6 c0             	movzx  eax,al
  805e5e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  805e61:	e9 24 02 00 00       	jmp    80608a <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805e66:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805e69:	48 98                	cdqe   
  805e6b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e72:	00 
  805e73:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e77:	48 01 d0             	add    rax,rdx
  805e7a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e7d:	83 e0 01             	and    eax,0x1
  805e80:	48 85 c0             	test   rax,rax
  805e83:	0f 84 fd 01 00 00    	je     806086 <release_mmap+0x2b0>
  805e89:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805e8c:	48 98                	cdqe   
  805e8e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e95:	00 
  805e96:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e9a:	48 01 d0             	add    rax,rdx
  805e9d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ea0:	25 80 00 00 00       	and    eax,0x80
  805ea5:	48 85 c0             	test   rax,rax
  805ea8:	0f 85 d8 01 00 00    	jne    806086 <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805eae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805eb1:	48 98                	cdqe   
  805eb3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805eba:	00 
  805ebb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ebf:	48 01 d0             	add    rax,rdx
  805ec2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ec5:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805ecc:	ff 00 00 
  805ecf:	48 21 d0             	and    rax,rdx
  805ed2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805ed6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805edd:	e9 6b 01 00 00       	jmp    80604d <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805ee2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805ee5:	48 98                	cdqe   
  805ee7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805eee:	00 
  805eef:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ef3:	48 01 d0             	add    rax,rdx
  805ef6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ef9:	83 e0 01             	and    eax,0x1
  805efc:	48 85 c0             	test   rax,rax
  805eff:	0f 84 dc 00 00 00    	je     805fe1 <release_mmap+0x20b>
  805f05:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f08:	48 98                	cdqe   
  805f0a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f11:	00 
  805f12:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f16:	48 01 d0             	add    rax,rdx
  805f19:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f1c:	25 80 00 00 00       	and    eax,0x80
  805f21:	48 85 c0             	test   rax,rax
  805f24:	0f 85 b7 00 00 00    	jne    805fe1 <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805f2a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f2d:	48 98                	cdqe   
  805f2f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f36:	00 
  805f37:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f3b:	48 01 d0             	add    rax,rdx
  805f3e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f41:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f48:	ff 00 00 
  805f4b:	48 21 d0             	and    rax,rdx
  805f4e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  805f52:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805f59:	eb 4f                	jmp    805faa <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  805f5b:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805f5e:	48 98                	cdqe   
  805f60:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f67:	00 
  805f68:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805f6c:	48 01 d0             	add    rax,rdx
  805f6f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f72:	83 e0 01             	and    eax,0x1
  805f75:	48 85 c0             	test   rax,rax
  805f78:	74 2c                	je     805fa6 <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    //TODO:这里有一个问题：目前fork时候堆栈空间使用的是vmalloc内存，这样的话free_page是释放不了的。
                                    free_page(pte[l]&PAGE_4K_MASK);
  805f7a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805f7d:	48 98                	cdqe   
  805f7f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f86:	00 
  805f87:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805f8b:	48 01 d0             	add    rax,rdx
  805f8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f91:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f98:	ff 00 00 
  805f9b:	48 21 d0             	and    rax,rdx
  805f9e:	48 89 c7             	mov    rdi,rax
  805fa1:	e8 56 b7 ff ff       	call   8016fc <free_page>
                            for(int l=0;l<512;l++){
  805fa6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805faa:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  805fb1:	7e a8                	jle    805f5b <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805fb3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fb6:	48 98                	cdqe   
  805fb8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fbf:	00 
  805fc0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fc4:	48 01 d0             	add    rax,rdx
  805fc7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805fca:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805fd1:	ff 00 00 
  805fd4:	48 21 d0             	and    rax,rdx
  805fd7:	48 89 c7             	mov    rdi,rax
  805fda:	e8 0e b3 ff ff       	call   8012ed <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805fdf:	eb 68                	jmp    806049 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  805fe1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fe4:	48 98                	cdqe   
  805fe6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fed:	00 
  805fee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ff2:	48 01 d0             	add    rax,rdx
  805ff5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ff8:	83 e0 01             	and    eax,0x1
  805ffb:	48 85 c0             	test   rax,rax
  805ffe:	74 49                	je     806049 <release_mmap+0x273>
  806000:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806003:	48 98                	cdqe   
  806005:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80600c:	00 
  80600d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806011:	48 01 d0             	add    rax,rdx
  806014:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806017:	25 80 00 00 00       	and    eax,0x80
  80601c:	48 85 c0             	test   rax,rax
  80601f:	74 28                	je     806049 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  806021:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806024:	48 98                	cdqe   
  806026:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80602d:	00 
  80602e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806032:	48 01 d0             	add    rax,rdx
  806035:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806038:	25 00 f0 ff ff       	and    eax,0xfffff000
  80603d:	be 00 02 00 00       	mov    esi,0x200
  806042:	89 c7                	mov    edi,eax
  806044:	e8 37 b7 ff ff       	call   801780 <free_pages_at>
                    for(int k=0;k<512;k++)
  806049:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80604d:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  806054:	0f 8e 88 fe ff ff    	jle    805ee2 <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  80605a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80605d:	48 98                	cdqe   
  80605f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806066:	00 
  806067:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80606b:	48 01 d0             	add    rax,rdx
  80606e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806071:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806078:	ff 00 00 
  80607b:	48 21 d0             	and    rax,rdx
  80607e:	48 89 c7             	mov    rdi,rax
  806081:	e8 67 b2 ff ff       	call   8012ed <vmfree>
            for(;j<512;j++)
  806086:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80608a:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  806091:	0f 8e cf fd ff ff    	jle    805e66 <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  806097:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80609a:	48 98                	cdqe   
  80609c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8060a3:	00 
  8060a4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8060a8:	48 01 d0             	add    rax,rdx
  8060ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060ae:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8060b5:	ff 00 00 
  8060b8:	48 21 d0             	and    rax,rdx
  8060bb:	48 89 c7             	mov    rdi,rax
  8060be:	e8 2a b2 ff ff       	call   8012ed <vmfree>
    for(int i=0;i<512;i++)
  8060c3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8060c7:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8060ce:	0f 8e 35 fd ff ff    	jle    805e09 <release_mmap+0x33>
        }
    }
}
  8060d4:	90                   	nop
  8060d5:	90                   	nop
  8060d6:	c9                   	leave  
  8060d7:	c3                   	ret    

00000000008060d8 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  8060d8:	f3 0f 1e fa          	endbr64 
  8060dc:	55                   	push   rbp
  8060dd:	48 89 e5             	mov    rbp,rsp
  8060e0:	48 83 ec 60          	sub    rsp,0x60
  8060e4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8060e8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  8060ec:	b8 00 00 00 00       	mov    eax,0x0
  8060f1:	e8 57 b1 ff ff       	call   80124d <vmalloc>
  8060f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  8060fa:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8060fe:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  806105:	48 89 c1             	mov    rcx,rax
  806108:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80610c:	ba 00 10 00 00       	mov    edx,0x1000
  806111:	48 89 ce             	mov    rsi,rcx
  806114:	48 89 c7             	mov    rdi,rax
  806117:	e8 4e 6e 00 00       	call   80cf6a <memcpy>
    to->regs.cr3=pml4p;
  80611c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806120:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  806124:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  80612b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80612f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806133:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  80613a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80613e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  806142:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806149:	e9 09 03 00 00       	jmp    806457 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  80614e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806151:	48 98                	cdqe   
  806153:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80615a:	00 
  80615b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80615f:	48 01 d0             	add    rax,rdx
  806162:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806165:	83 e0 01             	and    eax,0x1
  806168:	48 85 c0             	test   rax,rax
  80616b:	0f 84 e2 02 00 00    	je     806453 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806171:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806174:	48 98                	cdqe   
  806176:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80617d:	00 
  80617e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806182:	48 01 d0             	add    rax,rdx
  806185:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806188:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  80618c:	b8 00 00 00 00       	mov    eax,0x0
  806191:	e8 b7 b0 ff ff       	call   80124d <vmalloc>
  806196:	48 89 c2             	mov    rdx,rax
  806199:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8061a0:	00 ff ff 
  8061a3:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8061a7:	48 89 c1             	mov    rcx,rax
  8061aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061ad:	48 98                	cdqe   
  8061af:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8061b6:	00 
  8061b7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8061bb:	48 01 f0             	add    rax,rsi
  8061be:	48 09 ca             	or     rdx,rcx
  8061c1:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8061c4:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8061cb:	ff 00 00 
  8061ce:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8061d2:	48 89 c1             	mov    rcx,rax
  8061d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061d8:	48 98                	cdqe   
  8061da:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061e1:	00 
  8061e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8061e6:	48 01 d0             	add    rax,rdx
  8061e9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061ec:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8061f3:	ff 00 00 
  8061f6:	48 21 d0             	and    rax,rdx
  8061f9:	ba 00 10 00 00       	mov    edx,0x1000
  8061fe:	48 89 ce             	mov    rsi,rcx
  806201:	48 89 c7             	mov    rdi,rax
  806204:	e8 61 6d 00 00       	call   80cf6a <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  806209:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80620c:	48 98                	cdqe   
  80620e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806215:	00 
  806216:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80621a:	48 01 d0             	add    rax,rdx
  80621d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806220:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806227:	ff 00 00 
  80622a:	48 21 d0             	and    rax,rdx
  80622d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  806231:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806238:	e9 09 02 00 00       	jmp    806446 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  80623d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806240:	48 98                	cdqe   
  806242:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806249:	00 
  80624a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80624e:	48 01 d0             	add    rax,rdx
  806251:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806254:	83 e0 01             	and    eax,0x1
  806257:	48 85 c0             	test   rax,rax
  80625a:	0f 84 e2 01 00 00    	je     806442 <copy_mmap+0x36a>
  806260:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806263:	48 98                	cdqe   
  806265:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80626c:	00 
  80626d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806271:	48 01 d0             	add    rax,rdx
  806274:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806277:	25 80 00 00 00       	and    eax,0x80
  80627c:	48 85 c0             	test   rax,rax
  80627f:	0f 85 bd 01 00 00    	jne    806442 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806285:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806288:	48 98                	cdqe   
  80628a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806291:	00 
  806292:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806296:	48 01 d0             	add    rax,rdx
  806299:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80629c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  8062a0:	b8 00 00 00 00       	mov    eax,0x0
  8062a5:	e8 a3 af ff ff       	call   80124d <vmalloc>
  8062aa:	48 89 c2             	mov    rdx,rax
  8062ad:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8062b4:	00 ff ff 
  8062b7:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8062bb:	48 89 c1             	mov    rcx,rax
  8062be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8062c1:	48 98                	cdqe   
  8062c3:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8062ca:	00 
  8062cb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8062cf:	48 01 f0             	add    rax,rsi
  8062d2:	48 09 ca             	or     rdx,rcx
  8062d5:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8062d8:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8062df:	ff 00 00 
  8062e2:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8062e6:	48 89 c1             	mov    rcx,rax
  8062e9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8062ec:	48 98                	cdqe   
  8062ee:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8062f5:	00 
  8062f6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8062fa:	48 01 d0             	add    rax,rdx
  8062fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806300:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806307:	ff 00 00 
  80630a:	48 21 d0             	and    rax,rdx
  80630d:	ba 00 10 00 00       	mov    edx,0x1000
  806312:	48 89 ce             	mov    rsi,rcx
  806315:	48 89 c7             	mov    rdi,rax
  806318:	e8 4d 6c 00 00       	call   80cf6a <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  80631d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806320:	48 98                	cdqe   
  806322:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806329:	00 
  80632a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80632e:	48 01 d0             	add    rax,rdx
  806331:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806334:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80633b:	ff 00 00 
  80633e:	48 21 d0             	and    rax,rdx
  806341:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  806345:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80634c:	e9 e4 00 00 00       	jmp    806435 <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  806351:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806354:	48 98                	cdqe   
  806356:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80635d:	00 
  80635e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806362:	48 01 d0             	add    rax,rdx
  806365:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806368:	83 e0 01             	and    eax,0x1
  80636b:	48 85 c0             	test   rax,rax
  80636e:	0f 84 bd 00 00 00    	je     806431 <copy_mmap+0x359>
  806374:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806377:	48 98                	cdqe   
  806379:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806380:	00 
  806381:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806385:	48 01 d0             	add    rax,rdx
  806388:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80638b:	25 80 00 00 00       	and    eax,0x80
  806390:	48 85 c0             	test   rax,rax
  806393:	0f 85 98 00 00 00    	jne    806431 <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806399:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80639c:	48 98                	cdqe   
  80639e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8063a5:	00 
  8063a6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8063aa:	48 01 d0             	add    rax,rdx
  8063ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8063b0:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  8063b4:	b8 00 00 00 00       	mov    eax,0x0
  8063b9:	e8 8f ae ff ff       	call   80124d <vmalloc>
  8063be:	48 89 c2             	mov    rdx,rax
  8063c1:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8063c8:	00 ff ff 
  8063cb:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8063cf:	48 89 c1             	mov    rcx,rax
  8063d2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8063d5:	48 98                	cdqe   
  8063d7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8063de:	00 
  8063df:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8063e3:	48 01 f0             	add    rax,rsi
  8063e6:	48 09 ca             	or     rdx,rcx
  8063e9:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8063ec:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8063f3:	ff 00 00 
  8063f6:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8063fa:	48 89 c1             	mov    rcx,rax
  8063fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806400:	48 98                	cdqe   
  806402:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806409:	00 
  80640a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80640e:	48 01 d0             	add    rax,rdx
  806411:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806414:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80641b:	ff 00 00 
  80641e:	48 21 d0             	and    rax,rdx
  806421:	ba 00 10 00 00       	mov    edx,0x1000
  806426:	48 89 ce             	mov    rsi,rcx
  806429:	48 89 c7             	mov    rdi,rax
  80642c:	e8 39 6b 00 00       	call   80cf6a <memcpy>
                    for(int k=0;k<512;k++)
  806431:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806435:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  80643c:	0f 8e 0f ff ff ff    	jle    806351 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  806442:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806446:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  80644d:	0f 8e ea fd ff ff    	jle    80623d <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  806453:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806457:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  80645e:	0f 8e ea fc ff ff    	jle    80614e <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  806464:	90                   	nop
  806465:	90                   	nop
  806466:	c9                   	leave  
  806467:	c3                   	ret    

0000000000806468 <getpgrp>:

pid_t getpgrp(void){
  806468:	f3 0f 1e fa          	endbr64 
  80646c:	55                   	push   rbp
  80646d:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  806470:	48 8b 05 c9 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0edc9]        # 415240 <current>
  806477:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  80647a:	5d                   	pop    rbp
  80647b:	c3                   	ret    

000000000080647c <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  80647c:	f3 0f 1e fa          	endbr64 
  806480:	55                   	push   rbp
  806481:	48 89 e5             	mov    rbp,rsp
  806484:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806487:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  80648a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80648e:	75 0c                	jne    80649c <getpgid+0x20>
        return current->gpid;
  806490:	48 8b 05 a9 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eda9]        # 415240 <current>
  806497:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80649a:	eb 49                	jmp    8064e5 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80649c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8064a3:	eb 35                	jmp    8064da <getpgid+0x5e>
        if(task[i].pid==pid)
  8064a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064a8:	48 98                	cdqe   
  8064aa:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8064b1:	48 05 40 85 40 00    	add    rax,0x408540
  8064b7:	8b 10                	mov    edx,DWORD PTR [rax]
  8064b9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8064bc:	39 c2                	cmp    edx,eax
  8064be:	75 16                	jne    8064d6 <getpgid+0x5a>
            return task[i].gpid;
  8064c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064c3:	48 98                	cdqe   
  8064c5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8064cc:	48 05 44 85 40 00    	add    rax,0x408544
  8064d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8064d4:	eb 0f                	jmp    8064e5 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8064d6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8064da:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8064de:	7e c5                	jle    8064a5 <getpgid+0x29>
    }
    return -1;
  8064e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8064e5:	5d                   	pop    rbp
  8064e6:	c3                   	ret    

00000000008064e7 <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  8064e7:	f3 0f 1e fa          	endbr64 
  8064eb:	55                   	push   rbp
  8064ec:	48 89 e5             	mov    rbp,rsp
  8064ef:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8064f2:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8064f5:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8064f9:	75 38                	jne    806533 <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  8064fb:	48 8b 05 3e ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed3e]        # 415240 <current>
  806502:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  806505:	48 8b 05 34 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed34]        # 415240 <current>
  80650c:	8b 00                	mov    eax,DWORD PTR [rax]
  80650e:	39 c2                	cmp    edx,eax
  806510:	75 0a                	jne    80651c <setpgid+0x35>
            return -1;
  806512:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806517:	e9 9d 00 00 00       	jmp    8065b9 <setpgid+0xd2>
        current->gpid=gid;
  80651c:	48 8b 05 1d ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed1d]        # 415240 <current>
  806523:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806526:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  806529:	b8 00 00 00 00       	mov    eax,0x0
  80652e:	e9 86 00 00 00       	jmp    8065b9 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  806533:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80653a:	eb 72                	jmp    8065ae <setpgid+0xc7>
        if(task[i].pid==pid)
  80653c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80653f:	48 98                	cdqe   
  806541:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806548:	48 05 40 85 40 00    	add    rax,0x408540
  80654e:	8b 10                	mov    edx,DWORD PTR [rax]
  806550:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806553:	39 c2                	cmp    edx,eax
  806555:	75 53                	jne    8065aa <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  806557:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80655a:	48 98                	cdqe   
  80655c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806563:	48 05 48 85 40 00    	add    rax,0x408548
  806569:	8b 10                	mov    edx,DWORD PTR [rax]
  80656b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80656e:	48 98                	cdqe   
  806570:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806577:	48 05 40 85 40 00    	add    rax,0x408540
  80657d:	8b 00                	mov    eax,DWORD PTR [rax]
  80657f:	39 c2                	cmp    edx,eax
  806581:	75 07                	jne    80658a <setpgid+0xa3>
                return -1;
  806583:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806588:	eb 2f                	jmp    8065b9 <setpgid+0xd2>
            task[i].gpid=gid;
  80658a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80658d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806590:	48 63 d2             	movsxd rdx,edx
  806593:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  80659a:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  8065a1:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  8065a3:	b8 00 00 00 00       	mov    eax,0x0
  8065a8:	eb 0f                	jmp    8065b9 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8065aa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8065ae:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8065b2:	7e 88                	jle    80653c <setpgid+0x55>
        }
    }
    return -1;
  8065b4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8065b9:	5d                   	pop    rbp
  8065ba:	c3                   	ret    

00000000008065bb <setsid>:

pid_t setsid(void){
  8065bb:	f3 0f 1e fa          	endbr64 
  8065bf:	55                   	push   rbp
  8065c0:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  8065c3:	48 8b 15 76 ec c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0ec76]        # 415240 <current>
  8065ca:	48 8b 05 6f ec c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ec6f]        # 415240 <current>
  8065d1:	8b 12                	mov    edx,DWORD PTR [rdx]
  8065d3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  8065d6:	90                   	nop
  8065d7:	5d                   	pop    rbp
  8065d8:	c3                   	ret    

00000000008065d9 <getsid>:
pid_t getsid(pid_t pid){
  8065d9:	f3 0f 1e fa          	endbr64 
  8065dd:	55                   	push   rbp
  8065de:	48 89 e5             	mov    rbp,rsp
  8065e1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  8065e4:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8065e8:	75 0c                	jne    8065f6 <getsid+0x1d>
        return current->sid;
  8065ea:	48 8b 05 4f ec c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ec4f]        # 415240 <current>
  8065f1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8065f4:	eb 49                	jmp    80663f <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8065f6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8065fd:	eb 35                	jmp    806634 <getsid+0x5b>
        if(task[i].pid==pid)
  8065ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806602:	48 98                	cdqe   
  806604:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80660b:	48 05 40 85 40 00    	add    rax,0x408540
  806611:	8b 10                	mov    edx,DWORD PTR [rax]
  806613:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806616:	39 c2                	cmp    edx,eax
  806618:	75 16                	jne    806630 <getsid+0x57>
            return task[i].sid;
  80661a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80661d:	48 98                	cdqe   
  80661f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806626:	48 05 48 85 40 00    	add    rax,0x408548
  80662c:	8b 00                	mov    eax,DWORD PTR [rax]
  80662e:	eb 0f                	jmp    80663f <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806630:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806634:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  806638:	7e c5                	jle    8065ff <getsid+0x26>
    }
    return -1;
  80663a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80663f:	5d                   	pop    rbp
  806640:	c3                   	ret    

0000000000806641 <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  806641:	f3 0f 1e fa          	endbr64 
  806645:	55                   	push   rbp
  806646:	48 89 e5             	mov    rbp,rsp
  806649:	48 83 ec 20          	sub    rsp,0x20
  80664d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806650:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  806653:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806656:	ba 00 00 00 00       	mov    edx,0x0
  80665b:	be 02 00 00 00       	mov    esi,0x2
  806660:	89 c7                	mov    edi,eax
  806662:	e8 3f 01 00 00       	call   8067a6 <sys_ioctl>
    int sid= getsid(0);//获取session id
  806667:	bf 00 00 00 00       	mov    edi,0x0
  80666c:	e8 68 ff ff ff       	call   8065d9 <getsid>
  806671:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    struct process* new_fgl=NULL;
  806674:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80667b:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  80667c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806683:	e9 9d 00 00 00       	jmp    806725 <tcsetpgrp+0xe4>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  806688:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80668b:	48 98                	cdqe   
  80668d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806694:	48 05 58 85 40 00    	add    rax,0x408558
  80669a:	8b 00                	mov    eax,DWORD PTR [rax]
  80669c:	83 f8 04             	cmp    eax,0x4
  80669f:	74 7f                	je     806720 <tcsetpgrp+0xdf>
  8066a1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066a4:	48 98                	cdqe   
  8066a6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066ad:	48 05 58 85 40 00    	add    rax,0x408558
  8066b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8066b5:	85 c0                	test   eax,eax
  8066b7:	74 67                	je     806720 <tcsetpgrp+0xdf>
        if(task[i].sid==sid){
  8066b9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066bc:	48 98                	cdqe   
  8066be:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066c5:	48 05 48 85 40 00    	add    rax,0x408548
  8066cb:	8b 10                	mov    edx,DWORD PTR [rax]
  8066cd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8066d0:	39 c2                	cmp    edx,eax
  8066d2:	75 4d                	jne    806721 <tcsetpgrp+0xe0>
            task[i].fg_pgid=pgid_id;
  8066d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066d7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8066da:	48 63 d2             	movsxd rdx,edx
  8066dd:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  8066e4:	48 81 c2 4c 85 40 00 	add    rdx,0x40854c
  8066eb:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  8066ed:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066f0:	48 98                	cdqe   
  8066f2:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066f9:	48 05 40 85 40 00    	add    rax,0x408540
  8066ff:	8b 10                	mov    edx,DWORD PTR [rax]
  806701:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806704:	39 c2                	cmp    edx,eax
  806706:	75 19                	jne    806721 <tcsetpgrp+0xe0>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  806708:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80670b:	48 98                	cdqe   
  80670d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806714:	48 05 40 85 40 00    	add    rax,0x408540
  80671a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80671e:	eb 01                	jmp    806721 <tcsetpgrp+0xe0>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  806720:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  806721:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806725:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  806729:	0f 8e 59 ff ff ff    	jle    806688 <tcsetpgrp+0x47>
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
  80672f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806733:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
  806736:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80673a:	48 63 d2             	movsxd rdx,edx
  80673d:	48 83 c2 1a          	add    rdx,0x1a
  806741:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806746:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80674a:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  80674e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806752:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806755:	48 63 d2             	movsxd rdx,edx
  806758:	48 83 c2 1a          	add    rdx,0x1a
  80675c:	48 8b 74 d0 08       	mov    rsi,QWORD PTR [rax+rdx*8+0x8]
  806761:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806765:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806768:	48 63 d2             	movsxd rdx,edx
  80676b:	48 83 c2 1a          	add    rdx,0x1a
  80676f:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806774:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806778:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80677c:	b9 00 00 00 00       	mov    ecx,0x0
  806781:	ba 01 00 00 00       	mov    edx,0x1
  806786:	48 89 c7             	mov    rdi,rax
  806789:	41 ff d0             	call   r8
    ,TTY_CONNECT,0);
}
  80678c:	90                   	nop
  80678d:	c9                   	leave  
  80678e:	c3                   	ret    

000000000080678f <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  80678f:	f3 0f 1e fa          	endbr64 
  806793:	55                   	push   rbp
  806794:	48 89 e5             	mov    rbp,rsp
  806797:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  80679a:	48 8b 05 9f ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea9f]        # 415240 <current>
  8067a1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  8067a4:	5d                   	pop    rbp
  8067a5:	c3                   	ret    

00000000008067a6 <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  8067a6:	f3 0f 1e fa          	endbr64 
  8067aa:	55                   	push   rbp
  8067ab:	48 89 e5             	mov    rbp,rsp
  8067ae:	48 83 ec 10          	sub    rsp,0x10
  8067b2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8067b5:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8067b8:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  8067bc:	48 8b 05 7d ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea7d]        # 415240 <current>
  8067c3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8067c6:	48 63 d2             	movsxd rdx,edx
  8067c9:	48 83 c2 1a          	add    rdx,0x1a
  8067cd:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8067d2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8067d6:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  8067da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8067dd:	48 63 d0             	movsxd rdx,eax
  8067e0:	48 8b 05 59 ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea59]        # 415240 <current>
  8067e7:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  8067ea:	48 63 c9             	movsxd rcx,ecx
  8067ed:	48 83 c1 1a          	add    rcx,0x1a
  8067f1:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  8067f6:	48 8b 05 43 ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea43]        # 415240 <current>
  8067fd:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  806800:	48 63 c9             	movsxd rcx,ecx
  806803:	48 83 c1 1a          	add    rcx,0x1a
  806807:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  80680c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806810:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  806814:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  806818:	48 89 c7             	mov    rdi,rax
  80681b:	41 ff d0             	call   r8
    ,request,args);
  80681e:	90                   	nop
  80681f:	c9                   	leave  
  806820:	c3                   	ret    
  806821:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806828:	00 00 00 
  80682b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806830 <outb>:
  806830:	66 89 fa             	mov    dx,di
  806833:	66 89 f0             	mov    ax,si
  806836:	ee                   	out    dx,al
  806837:	e8 29 00 00 00       	call   806865 <io_delay>
  80683c:	c3                   	ret    

000000000080683d <outw>:
  80683d:	66 89 fa             	mov    dx,di
  806840:	66 89 f0             	mov    ax,si
  806843:	66 ef                	out    dx,ax
  806845:	90                   	nop
  806846:	90                   	nop
  806847:	90                   	nop
  806848:	c3                   	ret    

0000000000806849 <inb>:
  806849:	31 c0                	xor    eax,eax
  80684b:	66 89 fa             	mov    dx,di
  80684e:	ec                   	in     al,dx
  80684f:	90                   	nop
  806850:	90                   	nop
  806851:	90                   	nop
  806852:	c3                   	ret    

0000000000806853 <inw>:
  806853:	31 c0                	xor    eax,eax
  806855:	66 89 fa             	mov    dx,di
  806858:	66 ed                	in     ax,dx
  80685a:	90                   	nop
  80685b:	90                   	nop
  80685c:	90                   	nop
  80685d:	c3                   	ret    

000000000080685e <eoi>:
  80685e:	b0 20                	mov    al,0x20
  806860:	e6 a0                	out    0xa0,al
  806862:	e6 20                	out    0x20,al
  806864:	c3                   	ret    

0000000000806865 <io_delay>:
  806865:	90                   	nop
  806866:	90                   	nop
  806867:	90                   	nop
  806868:	90                   	nop
  806869:	c3                   	ret    

000000000080686a <turn_on_int>:
  80686a:	b0 f8                	mov    al,0xf8
  80686c:	e6 21                	out    0x21,al
  80686e:	e8 f2 ff ff ff       	call   806865 <io_delay>
  806873:	b0 af                	mov    al,0xaf
  806875:	e6 a1                	out    0xa1,al
  806877:	e8 e9 ff ff ff       	call   806865 <io_delay>
  80687c:	b8 00 70 10 00       	mov    eax,0x107000
  806881:	0f 01 18             	lidt   [rax]
  806884:	90                   	nop
  806885:	90                   	nop
  806886:	90                   	nop
  806887:	90                   	nop
  806888:	c3                   	ret    

0000000000806889 <report_back_trace_of_err>:
  806889:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80688e:	50                   	push   rax
  80688f:	68 98 68 80 00       	push   0x806898
  806894:	83 c4 08             	add    esp,0x8
  806897:	c3                   	ret    

0000000000806898 <bt_msg>:
  806898:	65 72 72             	gs jb  80690d <fill_desc+0x4e>
  80689b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80689c:	72 20                	jb     8068be <init_gdt+0x11>
  80689e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80689f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8068a2:	72 73                	jb     806917 <fill_desc+0x58>
  8068a4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8068a7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eec525 <_knl_end+0x2ec525>

00000000008068ad <init_gdt>:
#include "memory.h"

descriptor *gdt=GDT_ADDR+KNL_BASE;
extern char *gdtptr;
int init_gdt()
{
  8068ad:	f3 0f 1e fa          	endbr64 
  8068b1:	55                   	push   rbp
  8068b2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  8068b5:	66 b8 48 00          	mov    ax,0x48
  8068b9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  8068bc:	90                   	nop
  8068bd:	5d                   	pop    rbp
  8068be:	c3                   	ret    

00000000008068bf <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  8068bf:	f3 0f 1e fa          	endbr64 
  8068c3:	55                   	push   rbp
  8068c4:	48 89 e5             	mov    rbp,rsp
  8068c7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8068cb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8068cf:	89 d0                	mov    eax,edx
  8068d1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  8068d4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  8068d8:	48 8b 15 29 71 00 00 	mov    rdx,QWORD PTR [rip+0x7129]        # 80da08 <gdt>
  8068df:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068e2:	48 c1 e0 04          	shl    rax,0x4
  8068e6:	48 01 d0             	add    rax,rdx
  8068e9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8068ed:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  8068f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068f5:	48 c1 e8 10          	shr    rax,0x10
  8068f9:	48 89 c1             	mov    rcx,rax
  8068fc:	48 8b 15 05 71 00 00 	mov    rdx,QWORD PTR [rip+0x7105]        # 80da08 <gdt>
  806903:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806906:	48 c1 e0 04          	shl    rax,0x4
  80690a:	48 01 d0             	add    rax,rdx
  80690d:	89 ca                	mov    edx,ecx
  80690f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  806912:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806916:	48 c1 e8 18          	shr    rax,0x18
  80691a:	48 89 c1             	mov    rcx,rax
  80691d:	48 8b 15 e4 70 00 00 	mov    rdx,QWORD PTR [rip+0x70e4]        # 80da08 <gdt>
  806924:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806927:	48 c1 e0 04          	shl    rax,0x4
  80692b:	48 01 d0             	add    rax,rdx
  80692e:	89 ca                	mov    edx,ecx
  806930:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  806933:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806937:	48 c1 e8 20          	shr    rax,0x20
  80693b:	48 89 c2             	mov    rdx,rax
  80693e:	48 8b 0d c3 70 00 00 	mov    rcx,QWORD PTR [rip+0x70c3]        # 80da08 <gdt>
  806945:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806948:	48 c1 e0 04          	shl    rax,0x4
  80694c:	48 01 c8             	add    rax,rcx
  80694f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  806952:	48 8b 15 af 70 00 00 	mov    rdx,QWORD PTR [rip+0x70af]        # 80da08 <gdt>
  806959:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80695c:	48 c1 e0 04          	shl    rax,0x4
  806960:	48 01 d0             	add    rax,rdx
  806963:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806967:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80696a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80696e:	48 c1 e8 08          	shr    rax,0x8
  806972:	66 25 f0 00          	and    ax,0xf0
  806976:	48 8b 0d 8b 70 00 00 	mov    rcx,QWORD PTR [rip+0x708b]        # 80da08 <gdt>
  80697d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806980:	48 c1 e2 04          	shl    rdx,0x4
  806984:	48 01 ca             	add    rdx,rcx
  806987:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80698b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80698f:	90                   	nop
  806990:	5d                   	pop    rbp
  806991:	c3                   	ret    

0000000000806992 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  806992:	f3 0f 1e fa          	endbr64 
  806996:	55                   	push   rbp
  806997:	48 89 e5             	mov    rbp,rsp
  80699a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80699d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8069a0:	89 c8                	mov    eax,ecx
  8069a2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  8069a6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  8069aa:	48 8b 05 57 70 00 00 	mov    rax,QWORD PTR [rip+0x7057]        # 80da08 <gdt>
  8069b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  8069b5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069b8:	48 c1 e0 04          	shl    rax,0x4
  8069bc:	48 89 c2             	mov    rdx,rax
  8069bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069c3:	48 01 d0             	add    rax,rdx
  8069c6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8069c9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  8069cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069cf:	48 c1 e0 04          	shl    rax,0x4
  8069d3:	48 89 c2             	mov    rdx,rax
  8069d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069da:	48 01 d0             	add    rax,rdx
  8069dd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8069e0:	c1 ea 10             	shr    edx,0x10
  8069e3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  8069e6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069e9:	48 c1 e0 04          	shl    rax,0x4
  8069ed:	48 89 c2             	mov    rdx,rax
  8069f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069f4:	48 01 c2             	add    rdx,rax
  8069f7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  8069fb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8069ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a02:	48 c1 e0 04          	shl    rax,0x4
  806a06:	48 89 c2             	mov    rdx,rax
  806a09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a0d:	48 01 c2             	add    rdx,rax
  806a10:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  806a14:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  806a18:	90                   	nop
  806a19:	5d                   	pop    rbp
  806a1a:	c3                   	ret    

0000000000806a1b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  806a1b:	f3 0f 1e fa          	endbr64 
  806a1f:	55                   	push   rbp
  806a20:	48 89 e5             	mov    rbp,rsp
  806a23:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  806a26:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  806a29:	89 d0                	mov    eax,edx
  806a2b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  806a2f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  806a33:	90                   	nop
  806a34:	5d                   	pop    rbp
  806a35:	c3                   	ret    
  806a36:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806a3d:	00 00 00 

0000000000806a40 <fill_desc>:
  806a40:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  806a45:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  806a4a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806a4f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  806a54:	be 00 60 00 00       	mov    esi,0x6000
  806a59:	c1 e2 03             	shl    edx,0x3
  806a5c:	01 d6                	add    esi,edx
  806a5e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  806a62:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  806a67:	c1 e8 10             	shr    eax,0x10
  806a6a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  806a6e:	c1 eb 10             	shr    ebx,0x10
  806a71:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  806a75:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  806a79:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  806a7d:	c3                   	ret    

0000000000806a7e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  806a7e:	f3 0f 1e fa          	endbr64 
  806a82:	55                   	push   rbp
  806a83:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  806a86:	b8 00 00 00 00       	mov    eax,0x0
  806a8b:	e8 e5 2e 00 00       	call   809975 <execute_request>
    do_req();
  806a90:	b8 00 00 00 00       	mov    eax,0x0
  806a95:	e8 69 d3 ff ff       	call   803e03 <do_req>
    if(!manage_proc_lock)
  806a9a:	8b 05 a8 6e 00 00    	mov    eax,DWORD PTR [rip+0x6ea8]        # 80d948 <manage_proc_lock>
  806aa0:	85 c0                	test   eax,eax
  806aa2:	75 0a                	jne    806aae <clock_c+0x30>
    {
        manage_proc();
  806aa4:	b8 00 00 00 00       	mov    eax,0x0
  806aa9:	e8 4c db ff ff       	call   8045fa <manage_proc>
    }
    //puts("1 disk req executed.");
  806aae:	90                   	nop
  806aaf:	5d                   	pop    rbp
  806ab0:	c3                   	ret    
  806ab1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806ab8:	00 00 00 
  806abb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806ac0 <clock>:
  806ac0:	50                   	push   rax
  806ac1:	53                   	push   rbx
  806ac2:	51                   	push   rcx
  806ac3:	52                   	push   rdx
  806ac4:	57                   	push   rdi
  806ac5:	56                   	push   rsi
  806ac6:	41 50                	push   r8
  806ac8:	41 51                	push   r9
  806aca:	41 52                	push   r10
  806acc:	41 53                	push   r11
  806ace:	41 54                	push   r12
  806ad0:	41 55                	push   r13
  806ad2:	41 56                	push   r14
  806ad4:	41 57                	push   r15
  806ad6:	e8 f7 da ff ff       	call   8045d2 <save_rsp>
  806adb:	66 8c c0             	mov    ax,es
  806ade:	50                   	push   rax
  806adf:	66 8c d8             	mov    ax,ds
  806ae2:	50                   	push   rax
  806ae3:	66 b8 10 00          	mov    ax,0x10
  806ae7:	8e c0                	mov    es,eax
  806ae9:	8e d8                	mov    ds,eax

0000000000806aeb <clock.normal_part>:
  806aeb:	b0 20                	mov    al,0x20
  806aed:	e6 a0                	out    0xa0,al
  806aef:	e6 20                	out    0x20,al
  806af1:	e8 88 ff ff ff       	call   806a7e <clock_c>
  806af6:	58                   	pop    rax
  806af7:	8e d8                	mov    ds,eax
  806af9:	58                   	pop    rax
  806afa:	8e c0                	mov    es,eax
  806afc:	41 5f                	pop    r15
  806afe:	41 5e                	pop    r14
  806b00:	41 5d                	pop    r13
  806b02:	41 5c                	pop    r12
  806b04:	41 5b                	pop    r11
  806b06:	41 5a                	pop    r10
  806b08:	41 59                	pop    r9
  806b0a:	41 58                	pop    r8
  806b0c:	5e                   	pop    rsi
  806b0d:	5f                   	pop    rdi
  806b0e:	5a                   	pop    rdx
  806b0f:	59                   	pop    rcx
  806b10:	5b                   	pop    rbx
  806b11:	58                   	pop    rax
  806b12:	48 cf                	iretq  

0000000000806b14 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  806b14:	f3 0f 1e fa          	endbr64 
  806b18:	55                   	push   rbp
  806b19:	48 89 e5             	mov    rbp,rsp
  806b1c:	48 83 ec 30          	sub    rsp,0x30
  806b20:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806b24:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  806b28:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  806b2f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  806b36:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b3a:	be 00 10 00 00       	mov    esi,0x1000
  806b3f:	48 89 c7             	mov    rdi,rax
  806b42:	e8 dc 19 00 00       	call   808523 <sys_open>
  806b47:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  806b4a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806b4e:	79 0a                	jns    806b5a <execute+0x46>
  806b50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806b55:	e9 ba 00 00 00       	jmp    806c14 <execute+0x100>
    //
    char *p=path;
  806b5a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b5e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  806b62:	eb 05                	jmp    806b69 <execute+0x55>
  806b64:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  806b69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b6d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b70:	84 c0                	test   al,al
  806b72:	75 f0                	jne    806b64 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  806b74:	eb 05                	jmp    806b7b <execute+0x67>
  806b76:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  806b7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b82:	3c 2f                	cmp    al,0x2f
  806b84:	74 0a                	je     806b90 <execute+0x7c>
  806b86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b8a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806b8e:	77 e6                	ja     806b76 <execute+0x62>
    if(p>path)
  806b90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b94:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806b98:	76 2f                	jbe    806bc9 <execute+0xb5>
    {
        *p='\0';
  806b9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b9e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  806ba1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ba5:	be 00 40 00 00       	mov    esi,0x4000
  806baa:	48 89 c7             	mov    rdi,rax
  806bad:	e8 71 19 00 00       	call   808523 <sys_open>
  806bb2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806bb5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806bb9:	79 07                	jns    806bc2 <execute+0xae>
  806bbb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806bc0:	eb 52                	jmp    806c14 <execute+0x100>
        *p='/';
  806bc2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806bc6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  806bc9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806bcc:	48 63 d0             	movsxd rdx,eax
  806bcf:	48 89 d0             	mov    rax,rdx
  806bd2:	48 c1 e0 02          	shl    rax,0x2
  806bd6:	48 01 d0             	add    rax,rdx
  806bd9:	48 c1 e0 03          	shl    rax,0x3
  806bdd:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  806be4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806be7:	48 63 c8             	movsxd rcx,eax
  806bea:	48 89 c8             	mov    rax,rcx
  806bed:	48 c1 e0 02          	shl    rax,0x2
  806bf1:	48 01 c8             	add    rax,rcx
  806bf4:	48 c1 e0 03          	shl    rax,0x3
  806bf8:	48 05 60 06 40 00    	add    rax,0x400660
  806bfe:	b9 79 6d 80 00       	mov    ecx,0x806d79
  806c03:	48 89 c6             	mov    rsi,rax
  806c06:	48 89 cf             	mov    rdi,rcx
  806c09:	e8 c4 e1 ff ff       	call   804dd2 <reg_proc>
  806c0e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  806c11:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  806c14:	c9                   	leave  
  806c15:	c3                   	ret    

0000000000806c16 <sys_execve>:

int sys_execve(char *path,char **argv){
  806c16:	f3 0f 1e fa          	endbr64 
  806c1a:	55                   	push   rbp
  806c1b:	48 89 e5             	mov    rbp,rsp
  806c1e:	48 83 ec 30          	sub    rsp,0x30
  806c22:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806c26:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  806c2a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  806c31:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  806c38:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c3c:	be 00 10 00 00       	mov    esi,0x1000
  806c41:	48 89 c7             	mov    rdi,rax
  806c44:	e8 da 18 00 00       	call   808523 <sys_open>
  806c49:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806c4c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806c50:	79 0a                	jns    806c5c <sys_execve+0x46>
  806c52:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  806c57:	e9 ad 00 00 00       	jmp    806d09 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  806c5c:	48 8b 05 dd e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5dd]        # 415240 <current>
  806c63:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806c6a:	48 2d 60 06 40 00    	sub    rax,0x400660
  806c70:	48 c1 f8 03          	sar    rax,0x3
  806c74:	48 89 c2             	mov    rdx,rax
  806c77:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  806c7e:	cc cc cc 
  806c81:	48 0f af c2          	imul   rax,rdx
  806c85:	89 c7                	mov    edi,eax
  806c87:	e8 2e 1e 00 00       	call   808aba <sys_close>

    void *retp= load_pe;
  806c8c:	48 c7 45 f0 ab 6d 80 	mov    QWORD PTR [rbp-0x10],0x806dab
  806c93:	00 
    current->exef=&opened[fno];//改变执行文件
  806c94:	48 8b 15 a5 e5 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e5a5]        # 415240 <current>
  806c9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c9e:	48 63 c8             	movsxd rcx,eax
  806ca1:	48 89 c8             	mov    rax,rcx
  806ca4:	48 c1 e0 02          	shl    rax,0x2
  806ca8:	48 01 c8             	add    rax,rcx
  806cab:	48 c1 e0 03          	shl    rax,0x3
  806caf:	48 05 60 06 40 00    	add    rax,0x400660
  806cb5:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  806cbc:	48 8b 05 7d e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e57d]        # 415240 <current>
  806cc3:	48 89 c7             	mov    rdi,rax
  806cc6:	e8 0b f1 ff ff       	call   805dd6 <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  806ccb:	48 8b 05 6e e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e56e]        # 415240 <current>
  806cd2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  806cd9:	ff 00 00 
  806cdc:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  806ce3:	48 8b 05 16 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d16]        # 80da00 <tss>
  806cea:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  806cee:	48 2d a8 00 00 00    	sub    rax,0xa8
  806cf4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  806cf8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806cfc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d00:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  806d04:	b8 00 00 00 00       	mov    eax,0x0
}
  806d09:	c9                   	leave  
  806d0a:	c3                   	ret    

0000000000806d0b <exec_call>:
int exec_call(char *path)
{
  806d0b:	f3 0f 1e fa          	endbr64 
  806d0f:	55                   	push   rbp
  806d10:	48 89 e5             	mov    rbp,rsp
  806d13:	48 83 ec 20          	sub    rsp,0x20
  806d17:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  806d1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d1f:	be 00 00 00 00       	mov    esi,0x0
  806d24:	48 89 c7             	mov    rdi,rax
  806d27:	e8 e8 fd ff ff       	call   806b14 <execute>
  806d2c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  806d2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d32:	01 c0                	add    eax,eax
  806d34:	83 c0 05             	add    eax,0x5
  806d37:	c1 e0 03             	shl    eax,0x3
  806d3a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  806d3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d40:	89 c7                	mov    edi,eax
  806d42:	e8 46 da ff ff       	call   80478d <switch_proc_tss>
    while(task[pi].stat != TASK_ZOMBIE);
  806d47:	90                   	nop
  806d48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d4b:	48 98                	cdqe   
  806d4d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d54:	48 05 50 85 40 00    	add    rax,0x408550
  806d5a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d5d:	83 f8 04             	cmp    eax,0x4
  806d60:	75 e6                	jne    806d48 <exec_call+0x3d>
    return task[pi].exit_code;
  806d62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d65:	48 98                	cdqe   
  806d67:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d6e:	48 05 60 85 40 00    	add    rax,0x408560
  806d74:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806d77:	c9                   	leave  
  806d78:	c3                   	ret    

0000000000806d79 <proc_start>:
int proc_start()
{
  806d79:	f3 0f 1e fa          	endbr64 
  806d7d:	55                   	push   rbp
  806d7e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806d81:	8b 05 45 e5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e545]        # 4152cc <cur_proc>
  806d87:	48 98                	cdqe   
  806d89:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d90:	48 05 40 85 40 00    	add    rax,0x408540
  806d96:	48 89 c7             	mov    rdi,rax
  806d99:	e8 0d 00 00 00       	call   806dab <load_pe>
    //释放进程资源
    sys_exit(0);
  806d9e:	bf 00 00 00 00       	mov    edi,0x0
  806da3:	e8 f5 df ff ff       	call   804d9d <sys_exit>
}
  806da8:	90                   	nop
  806da9:	5d                   	pop    rbp
  806daa:	c3                   	ret    

0000000000806dab <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  806dab:	f3 0f 1e fa          	endbr64 
  806daf:	55                   	push   rbp
  806db0:	48 89 e5             	mov    rbp,rsp
  806db3:	48 81 ec e0 02 00 00 	sub    rsp,0x2e0
  806dba:	48 89 bd 28 fd ff ff 	mov    QWORD PTR [rbp-0x2d8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806dc1:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  806dc8:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806dcf:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  806dd3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806dda:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806de1:	eb 28                	jmp    806e0b <load_pe+0x60>
        if(current->openf[i]==f)
  806de3:	48 8b 05 56 e4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e456]        # 415240 <current>
  806dea:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806ded:	48 63 d2             	movsxd rdx,edx
  806df0:	48 83 c2 1a          	add    rdx,0x1a
  806df4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806df9:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  806dfd:	75 08                	jne    806e07 <load_pe+0x5c>
        {
            exefno=i;
  806dff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e02:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806e05:	eb 0a                	jmp    806e11 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806e07:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806e0b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806e0f:	7e d2                	jle    806de3 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806e11:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806e15:	75 0a                	jne    806e21 <load_pe+0x76>
  806e17:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806e1c:	e9 3e 07 00 00       	jmp    80755f <load_pe+0x7b4>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806e21:	48 8d 8d 60 fe ff ff 	lea    rcx,[rbp-0x1a0]
  806e28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e2b:	ba 44 00 00 00       	mov    edx,0x44
  806e30:	48 89 ce             	mov    rsi,rcx
  806e33:	89 c7                	mov    edi,eax
  806e35:	e8 38 1d 00 00       	call   808b72 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  806e3a:	48 8b 85 9c fe ff ff 	mov    rax,QWORD PTR [rbp-0x164]
  806e41:	48 89 c1             	mov    rcx,rax
  806e44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e47:	ba 00 00 00 00       	mov    edx,0x0
  806e4c:	48 89 ce             	mov    rsi,rcx
  806e4f:	89 c7                	mov    edi,eax
  806e51:	e8 7c 1e 00 00       	call   808cd2 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806e56:	48 8d 8d 50 fd ff ff 	lea    rcx,[rbp-0x2b0]
  806e5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e60:	ba 0c 01 00 00       	mov    edx,0x10c
  806e65:	48 89 ce             	mov    rsi,rcx
  806e68:	89 c7                	mov    edi,eax
  806e6a:	e8 03 1d 00 00       	call   808b72 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806e6f:	48 8b 85 84 fd ff ff 	mov    rax,QWORD PTR [rbp-0x27c]
  806e76:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  806e7a:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  806e80:	c1 e8 0c             	shr    eax,0xc
  806e83:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806e86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e89:	ba 00 00 00 00       	mov    edx,0x0
  806e8e:	be 00 00 00 00       	mov    esi,0x0
  806e93:	89 c7                	mov    edi,eax
  806e95:	e8 38 1e 00 00       	call   808cd2 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  806e9a:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  806e9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ea1:	ba 00 10 00 00       	mov    edx,0x1000
  806ea6:	48 89 ce             	mov    rsi,rcx
  806ea9:	89 c7                	mov    edi,eax
  806eab:	e8 c2 1c 00 00       	call   808b72 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  806eb0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806eb4:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  806eb8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  806ebc:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806ec0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806ec4:	48 01 d0             	add    rax,rdx
  806ec7:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  806ece:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ed5:	48 83 c0 04          	add    rax,0x4
  806ed9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806ee0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ee7:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  806eea:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806ef0:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  806ef6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  806efc:	85 c0                	test   eax,eax
  806efe:	0f 48 c2             	cmovs  eax,edx
  806f01:	c1 f8 0c             	sar    eax,0xc
  806f04:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  806f0a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f11:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806f14:	89 c2                	mov    edx,eax
  806f16:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806f1a:	48 01 d0             	add    rax,rdx
  806f1d:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806f24:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806f2a:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806f30:	85 c0                	test   eax,eax
  806f32:	0f 48 c2             	cmovs  eax,edx
  806f35:	c1 f8 0a             	sar    eax,0xa
  806f38:	89 c1                	mov    ecx,eax
  806f3a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806f40:	99                   	cdq    
  806f41:	c1 ea 16             	shr    edx,0x16
  806f44:	01 d0                	add    eax,edx
  806f46:	25 ff 03 00 00       	and    eax,0x3ff
  806f4b:	29 d0                	sub    eax,edx
  806f4d:	01 c8                	add    eax,ecx
  806f4f:	85 c0                	test   eax,eax
  806f51:	0f 95 c0             	setne  al
  806f54:	0f b6 c0             	movzx  eax,al
  806f57:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806f5d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806f64:	48 c1 e8 15          	shr    rax,0x15
  806f68:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806f6e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f75:	89 c0                	mov    eax,eax
  806f77:	48 05 0c 01 00 00    	add    rax,0x10c
  806f7d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806f81:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f88:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806f8c:	0f b7 d0             	movzx  edx,ax
  806f8f:	89 d0                	mov    eax,edx
  806f91:	c1 e0 02             	shl    eax,0x2
  806f94:	01 d0                	add    eax,edx
  806f96:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806f99:	05 50 01 00 00       	add    eax,0x150
  806f9e:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806fa4:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806fab:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  806fae:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  806fb4:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fba:	99                   	cdq    
  806fbb:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806fc1:	89 d0                	mov    eax,edx
  806fc3:	85 c0                	test   eax,eax
  806fc5:	74 23                	je     806fea <load_pe+0x23f>
  806fc7:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fcd:	99                   	cdq    
  806fce:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806fd4:	89 d1                	mov    ecx,edx
  806fd6:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fdc:	29 c8                	sub    eax,ecx
  806fde:	89 c2                	mov    edx,eax
  806fe0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  806fe6:	01 d0                	add    eax,edx
  806fe8:	eb 06                	jmp    806ff0 <load_pe+0x245>
  806fea:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806ff0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806ff6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806ffd:	eb 6b                	jmp    80706a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  806fff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807003:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  807006:	25 00 00 00 02       	and    eax,0x2000000
  80700b:	89 85 c0 fe ff ff    	mov    DWORD PTR [rbp-0x140],eax
        if(disca)
  807011:	83 bd c0 fe ff ff 00 	cmp    DWORD PTR [rbp-0x140],0x0
  807018:	75 46                	jne    807060 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  80701a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80701e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  807021:	89 c1                	mov    ecx,eax
  807023:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807026:	ba 00 00 00 00       	mov    edx,0x0
  80702b:	48 89 ce             	mov    rsi,rcx
  80702e:	89 c7                	mov    edi,eax
  807030:	e8 9d 1c 00 00       	call   808cd2 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  807035:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807039:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80703c:	89 c2                	mov    edx,eax
  80703e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807042:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807045:	89 c1                	mov    ecx,eax
  807047:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80704b:	48 01 c8             	add    rax,rcx
  80704e:	48 89 c1             	mov    rcx,rax
  807051:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807054:	48 89 ce             	mov    rsi,rcx
  807057:	89 c7                	mov    edi,eax
  807059:	e8 14 1b 00 00       	call   808b72 <sys_read>
  80705e:	eb 01                	jmp    807061 <load_pe+0x2b6>
            continue;
  807060:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  807061:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807065:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80706a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807071:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  807075:	0f b7 c0             	movzx  eax,ax
  807078:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80707b:	7c 82                	jl     806fff <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  80707d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807084:	48 05 90 00 00 00    	add    rax,0x90
  80708a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  807091:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  807098:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80709b:	85 c0                	test   eax,eax
  80709d:	0f 84 7b 02 00 00    	je     80731e <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8070a3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8070aa:	8b 10                	mov    edx,DWORD PTR [rax]
  8070ac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070b0:	01 d0                	add    eax,edx
  8070b2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8070b8:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  8070be:	48 98                	cdqe   
  8070c0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8070c4:	e9 47 02 00 00       	jmp    807310 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8070c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8070cd:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8070d0:	89 c2                	mov    edx,eax
  8070d2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070d6:	48 01 d0             	add    rax,rdx
  8070d9:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8070e0:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8070e7:	be ff 56 81 00       	mov    esi,0x8156ff
  8070ec:	48 89 c7             	mov    rdi,rax
  8070ef:	e8 14 61 00 00       	call   80d208 <strcmp>
  8070f4:	85 c0                	test   eax,eax
  8070f6:	75 09                	jne    807101 <load_pe+0x356>
            {
                dllp=0x1c00000;
  8070f8:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8070ff:	eb 25                	jmp    807126 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  807101:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  807108:	48 89 c7             	mov    rdi,rax
  80710b:	e8 9b fc ff ff       	call   806dab <load_pe>
  807110:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  807116:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80711c:	89 c7                	mov    edi,eax
  80711e:	e8 3e 04 00 00       	call   807561 <get_module_addr>
  807123:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  807126:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807129:	48 98                	cdqe   
  80712b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  807132:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807135:	48 63 d0             	movsxd rdx,eax
  807138:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80713f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  807143:	48 01 d0             	add    rax,rdx
  807146:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80714d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  807154:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80715a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80715d:	01 d0                	add    eax,edx
  80715f:	89 c0                	mov    eax,eax
  807161:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  807168:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80716f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807172:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  807178:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80717f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  807182:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807185:	01 d0                	add    eax,edx
  807187:	89 c0                	mov    eax,eax
  807189:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  807190:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  807197:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80719a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80719d:	01 d0                	add    eax,edx
  80719f:	89 c0                	mov    eax,eax
  8071a1:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8071a8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8071af:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8071b2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8071b5:	01 d0                	add    eax,edx
  8071b7:	89 c0                	mov    eax,eax
  8071b9:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8071c0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8071c7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071ca:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8071d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071d4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071d7:	89 c2                	mov    edx,eax
  8071d9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8071dd:	48 01 d0             	add    rax,rdx
  8071e0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8071e4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071e8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071eb:	89 c2                	mov    edx,eax
  8071ed:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8071f1:	48 01 d0             	add    rax,rdx
  8071f4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8071f8:	e9 00 01 00 00       	jmp    8072fd <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8071fd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807201:	8b 00                	mov    eax,DWORD PTR [rax]
  807203:	85 c0                	test   eax,eax
  807205:	79 43                	jns    80724a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  807207:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80720b:	8b 00                	mov    eax,DWORD PTR [rax]
  80720d:	25 ff ff ff 7f       	and    eax,0x7fffffff
  807212:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  807218:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80721e:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  807224:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80722b:	00 
  80722c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  807233:	48 01 d0             	add    rax,rdx
  807236:	8b 10                	mov    edx,DWORD PTR [rax]
  807238:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80723b:	01 d0                	add    eax,edx
  80723d:	89 c2                	mov    edx,eax
  80723f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807243:	89 10                	mov    DWORD PTR [rax],edx
  807245:	e9 a9 00 00 00       	jmp    8072f3 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80724a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80724e:	8b 00                	mov    eax,DWORD PTR [rax]
  807250:	89 c0                	mov    eax,eax
  807252:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  807259:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  807260:	02 
                    int i=0;
  807261:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  807268:	eb 7a                	jmp    8072e4 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80726a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80726d:	48 98                	cdqe   
  80726f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807276:	00 
  807277:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80727e:	48 01 d0             	add    rax,rdx
  807281:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807284:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80728b:	48 89 d6             	mov    rsi,rdx
  80728e:	48 89 c7             	mov    rdi,rax
  807291:	e8 72 5f 00 00       	call   80d208 <strcmp>
  807296:	85 c0                	test   eax,eax
  807298:	75 46                	jne    8072e0 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80729a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80729d:	48 98                	cdqe   
  80729f:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8072a3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8072aa:	48 01 d0             	add    rax,rdx
  8072ad:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8072b0:	98                   	cwde   
  8072b1:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8072b7:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8072bd:	48 98                	cdqe   
  8072bf:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8072c6:	00 
  8072c7:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8072ce:	48 01 d0             	add    rax,rdx
  8072d1:	8b 10                	mov    edx,DWORD PTR [rax]
  8072d3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8072d6:	01 d0                	add    eax,edx
  8072d8:	89 c2                	mov    edx,eax
  8072da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8072de:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8072e0:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8072e4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8072e7:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8072ed:	0f 8c 77 ff ff ff    	jl     80726a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8072f3:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8072f8:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8072fd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807301:	8b 00                	mov    eax,DWORD PTR [rax]
  807303:	85 c0                	test   eax,eax
  807305:	0f 85 f2 fe ff ff    	jne    8071fd <load_pe+0x452>
            }
            impdes++;
  80730b:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  807310:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807314:	8b 00                	mov    eax,DWORD PTR [rax]
  807316:	85 c0                	test   eax,eax
  807318:	0f 85 ab fd ff ff    	jne    8070c9 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80731e:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  807325:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  807326:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80732d:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  807333:	85 c0                	test   eax,eax
  807335:	0f 84 ec 00 00 00    	je     807427 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80733b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807342:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  807348:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80734c:	01 d0                	add    eax,edx
  80734e:	89 c0                	mov    eax,eax
  807350:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  807354:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807358:	48 83 c0 40          	add    rax,0x40
  80735c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  807360:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807364:	48 83 c0 02          	add    rax,0x2
  807368:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80736c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807373:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807377:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80737d:	e9 97 00 00 00       	jmp    807419 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  807382:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807386:	8b 10                	mov    edx,DWORD PTR [rax]
  807388:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80738c:	01 d0                	add    eax,edx
  80738e:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  807394:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80739b:	eb 5a                	jmp    8073f7 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80739d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8073a1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8073a4:	66 85 c0             	test   ax,ax
  8073a7:	74 49                	je     8073f2 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8073a9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8073ad:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8073b0:	0f b7 d0             	movzx  edx,ax
  8073b3:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8073b9:	01 d0                	add    eax,edx
  8073bb:	48 98                	cdqe   
  8073bd:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8073c4:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8073cb:	8b 00                	mov    eax,DWORD PTR [rax]
  8073cd:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8073d3:	89 c2                	mov    edx,eax
  8073d5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8073d9:	01 d0                	add    eax,edx
  8073db:	89 c2                	mov    edx,eax
  8073dd:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8073e4:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8073e6:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8073eb:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8073f0:	eb 01                	jmp    8073f3 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8073f2:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8073f3:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8073f7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8073fb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8073fe:	c1 e8 02             	shr    eax,0x2
  807401:	89 c2                	mov    edx,eax
  807403:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  807406:	39 c2                	cmp    edx,eax
  807408:	77 93                	ja     80739d <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  80740a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80740e:	05 00 10 00 00       	add    eax,0x1000
  807413:	48 98                	cdqe   
  807415:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  807419:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80741d:	8b 00                	mov    eax,DWORD PTR [rax]
  80741f:	85 c0                	test   eax,eax
  807421:	0f 85 5b ff ff ff    	jne    807382 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  807427:	c7 85 30 fd ff ff 00 	mov    DWORD PTR [rbp-0x2d0],0x0
  80742e:	00 00 00 
  807431:	c7 85 34 fd ff ff 00 	mov    DWORD PTR [rbp-0x2cc],0x0
  807438:	00 00 00 
  80743b:	48 c7 85 38 fd ff ff 	mov    QWORD PTR [rbp-0x2c8],0x0
  807442:	00 00 00 00 
  807446:	48 c7 85 40 fd ff ff 	mov    QWORD PTR [rbp-0x2c0],0x0
  80744d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  807451:	48 8d 85 30 fd ff ff 	lea    rax,[rbp-0x2d0]
  807458:	ba 18 00 00 00       	mov    edx,0x18
  80745d:	48 89 c6             	mov    rsi,rax
  807460:	bf 00 00 00 01       	mov    edi,0x1000000
  807465:	e8 00 5b 00 00       	call   80cf6a <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80746a:	8b 05 5c de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de5c]        # 4152cc <cur_proc>
  807470:	48 98                	cdqe   
  807472:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807479:	48 05 60 85 40 00    	add    rax,0x408560
  80747f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  807486:	8b 05 40 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de40]        # 4152cc <cur_proc>
  80748c:	48 98                	cdqe   
  80748e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807495:	48 05 60 85 40 00    	add    rax,0x408560
  80749b:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  8074a2:	8b 05 24 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de24]        # 4152cc <cur_proc>
  8074a8:	48 98                	cdqe   
  8074aa:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8074b1:	48 05 60 85 40 00    	add    rax,0x408560
  8074b7:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8074be:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8074c5:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    int ecode=main(0,NULL);
  8074cc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8074d3:	be 00 00 00 00       	mov    esi,0x0
  8074d8:	bf 00 00 00 00       	mov    edi,0x0
  8074dd:	ff d0                	call   rax
  8074df:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
  8074e5:	c7 85 bc fe ff ff 14 	mov    DWORD PTR [rbp-0x144],0x14
  8074ec:	00 00 00 
  8074ef:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
  8074f5:	89 85 b8 fe ff ff    	mov    DWORD PTR [rbp-0x148],eax
  8074fb:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
  807502:	00 00 00 
  807505:	c7 85 b0 fe ff ff 00 	mov    DWORD PTR [rbp-0x150],0x0
  80750c:	00 00 00 
  80750f:	c7 85 ac fe ff ff 00 	mov    DWORD PTR [rbp-0x154],0x0
  807516:	00 00 00 
  807519:	c7 85 a8 fe ff ff 00 	mov    DWORD PTR [rbp-0x158],0x0
  807520:	00 00 00 
  807523:	c7 85 a4 fe ff ff 00 	mov    DWORD PTR [rbp-0x15c],0x0
  80752a:	00 00 00 
    unsigned int argv;
    unsigned int argc;
}proc_ret_stack;

__attribute__((__always_inline__))inline int do_syscall(int func,int a1,int a2,int a3,int a4,int a5,int a6){
        asm volatile(".byte 0x48\n"
  80752d:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
  807533:	8b bd b8 fe ff ff    	mov    edi,DWORD PTR [rbp-0x148]
  807539:	8b b5 b4 fe ff ff    	mov    esi,DWORD PTR [rbp-0x14c]
  80753f:	8b 95 b0 fe ff ff    	mov    edx,DWORD PTR [rbp-0x150]
  807545:	8b 8d ac fe ff ff    	mov    ecx,DWORD PTR [rbp-0x154]
  80754b:	44 8b 85 a8 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x158]
  807552:	44 8b 8d a4 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x15c]
  807559:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
}
  80755c:	90                   	nop
    do_syscall(SYSCALL_EXIT,ecode,0,0,0,0,0);
    //
    //不应该执行到这
    while(1);
  80755d:	eb fe                	jmp    80755d <load_pe+0x7b2>
    return task[cur_proc].exit_code;
}
  80755f:	c9                   	leave  
  807560:	c3                   	ret    

0000000000807561 <get_module_addr>:

int get_module_addr(int mi)
{
  807561:	f3 0f 1e fa          	endbr64 
  807565:	55                   	push   rbp
  807566:	48 89 e5             	mov    rbp,rsp
  807569:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80756c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80756f:	48 98                	cdqe   
  807571:	8b 04 c5 e0 7e 42 00 	mov    eax,DWORD PTR [rax*8+0x427ee0]
}
  807578:	5d                   	pop    rbp
  807579:	c3                   	ret    

000000000080757a <dispose_library>:
int dispose_library(int dlln)
{
  80757a:	f3 0f 1e fa          	endbr64 
  80757e:	55                   	push   rbp
  80757f:	48 89 e5             	mov    rbp,rsp
  807582:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  807585:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807589:	78 09                	js     807594 <dispose_library+0x1a>
  80758b:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  807592:	7e 07                	jle    80759b <dispose_library+0x21>
  807594:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807599:	eb 1d                	jmp    8075b8 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80759b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80759e:	48 98                	cdqe   
  8075a0:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8075a7:	48 05 e8 52 41 00    	add    rax,0x4152e8
  8075ad:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8075b3:	b8 00 00 00 00       	mov    eax,0x0
}
  8075b8:	5d                   	pop    rbp
  8075b9:	c3                   	ret    

00000000008075ba <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8075ba:	f3 0f 1e fa          	endbr64 
  8075be:	55                   	push   rbp
  8075bf:	48 89 e5             	mov    rbp,rsp
  8075c2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8075c6:	90                   	nop
  8075c7:	5d                   	pop    rbp
  8075c8:	c3                   	ret    

00000000008075c9 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8075c9:	f3 0f 1e fa          	endbr64 
  8075cd:	55                   	push   rbp
  8075ce:	48 89 e5             	mov    rbp,rsp
  8075d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8075d5:	90                   	nop
  8075d6:	5d                   	pop    rbp
  8075d7:	c3                   	ret    
  8075d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  8075df:	00 

00000000008075e0 <_syscall>:
  8075e0:	55                   	push   rbp
  8075e1:	bd 00 80 10 00       	mov    ebp,0x108000
  8075e6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8075ea:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8075ee:	50                   	push   rax
  8075ef:	53                   	push   rbx
  8075f0:	51                   	push   rcx
  8075f1:	52                   	push   rdx
  8075f2:	57                   	push   rdi
  8075f3:	56                   	push   rsi
  8075f4:	41 50                	push   r8
  8075f6:	41 51                	push   r9
  8075f8:	41 52                	push   r10
  8075fa:	41 53                	push   r11
  8075fc:	41 54                	push   r12
  8075fe:	41 55                	push   r13
  807600:	41 56                	push   r14
  807602:	41 57                	push   r15
  807604:	66 8c c0             	mov    ax,es
  807607:	50                   	push   rax
  807608:	66 8c d8             	mov    ax,ds
  80760b:	50                   	push   rax
  80760c:	66 b8 10 00          	mov    ax,0x10
  807610:	8e c0                	mov    es,eax
  807612:	8e d8                	mov    ds,eax
  807614:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  807619:	41 53                	push   r11
  80761b:	51                   	push   rcx
  80761c:	49 87 ca             	xchg   r10,rcx
  80761f:	e8 7b 8f ff ff       	call   80059f <syscall>
  807624:	4c 87 d1             	xchg   rcx,r10
  807627:	59                   	pop    rcx
  807628:	41 5b                	pop    r11
  80762a:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  80762f:	58                   	pop    rax
  807630:	8e d8                	mov    ds,eax
  807632:	58                   	pop    rax
  807633:	8e c0                	mov    es,eax
  807635:	41 5f                	pop    r15
  807637:	41 5e                	pop    r14
  807639:	41 5d                	pop    r13
  80763b:	41 5c                	pop    r12
  80763d:	41 5b                	pop    r11
  80763f:	41 5a                	pop    r10
  807641:	41 59                	pop    r9
  807643:	41 58                	pop    r8
  807645:	5e                   	pop    rsi
  807646:	5f                   	pop    rdi
  807647:	5a                   	pop    rdx
  807648:	59                   	pop    rcx
  807649:	5b                   	pop    rbx
  80764a:	58                   	pop    rax
  80764b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80764f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  807653:	5d                   	pop    rbp
  807654:	fb                   	sti    
  807655:	48 0f 07             	sysretq 

0000000000807658 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  807658:	f3 0f 1e fa          	endbr64 
  80765c:	55                   	push   rbp
  80765d:	48 89 e5             	mov    rbp,rsp
  807660:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  807664:	8b 05 8a 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c8a]        # 4282f4 <framebuffer+0x14>
  80766a:	89 c0                	mov    eax,eax
  80766c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  807670:	8b 05 82 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c82]        # 4282f8 <framebuffer+0x18>
  807676:	89 c0                	mov    eax,eax
  807678:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80767c:	0f b6 05 79 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c79]        # 4282fc <framebuffer+0x1c>
  807683:	c0 e8 03             	shr    al,0x3
  807686:	0f b6 c0             	movzx  eax,al
  807689:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80768d:	8b 05 5d 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c5d]        # 4282f0 <framebuffer+0x10>
  807693:	89 c0                	mov    eax,eax
  807695:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  807699:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80769d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  8076a2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  8076a6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8076aa:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  8076af:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  8076b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8076b7:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8076be:	48 85 c0             	test   rax,rax
  8076c1:	48 0f 48 c2          	cmovs  rax,rdx
  8076c5:	48 c1 f8 0c          	sar    rax,0xc
  8076c9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  8076cc:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  8076d3:	80 ff ff 
  8076d6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t pp=framebuffer.common.framebuffer_addr;
  8076da:	48 8b 05 07 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c07]        # 4282e8 <framebuffer+0x8>
  8076e1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8076e5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8076ec:	00 
  8076ed:	eb 2d                	jmp    80771c <init_framebuffer+0xc4>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8076ef:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8076f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076f7:	ba 07 00 00 00       	mov    edx,0x7
  8076fc:	48 89 ce             	mov    rsi,rcx
  8076ff:	48 89 c7             	mov    rdi,rax
  807702:	e8 81 97 ff ff       	call   800e88 <mmap>
        pp+=PAGE_SIZE;
  807707:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  80770e:	00 
        p+=PAGE_SIZE;
  80770f:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  807716:	00 
    for (size_t i = 0; i < pgc; i++)
  807717:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80771c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80771f:	48 98                	cdqe   
  807721:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  807725:	7c c8                	jl     8076ef <init_framebuffer+0x97>
    }
    
    
}
  807727:	90                   	nop
  807728:	90                   	nop
  807729:	c9                   	leave  
  80772a:	c3                   	ret    

000000000080772b <init_font>:
void init_font(){
  80772b:	f3 0f 1e fa          	endbr64 
  80772f:	55                   	push   rbp
  807730:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) (_binary_res_font_psf_start+KNL_BASE);
  807733:	48 b8 88 dd 80 00 00 	movabs rax,0xffff80000080dd88
  80773a:	80 ff ff 
  80773d:	48 89 05 dc 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20bdc],rax        # 428320 <boot_font>

    font_width_bytes = (boot_font->width + 7) / 8;
  807744:	48 8b 05 d5 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bd5]        # 428320 <boot_font>
  80774b:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80774e:	83 c0 07             	add    eax,0x7
  807751:	c1 e8 03             	shr    eax,0x3
  807754:	89 05 d6 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bd6],eax        # 428330 <font_width_bytes>
    font_width = font_width_bytes * 8;
  80775a:	8b 05 d0 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bd0]        # 428330 <font_width_bytes>
  807760:	c1 e0 03             	shl    eax,0x3
  807763:	89 05 bf 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bbf],eax        # 428328 <font_width>
    font_height = boot_font->height;
  807769:	48 8b 05 b0 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bb0]        # 428320 <boot_font>
  807770:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807773:	89 05 b3 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bb3],eax        # 42832c <font_height>

    glyph_table = (u8*)(_binary_res_font_psf_start+KNL_BASE)+boot_font->header_size;
  807779:	48 8b 05 a0 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ba0]        # 428320 <boot_font>
  807780:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807783:	89 c2                	mov    edx,eax
  807785:	48 b8 00 00 00 00 00 	movabs rax,0xffff800000000000
  80778c:	80 ff ff 
  80778f:	48 01 d0             	add    rax,rdx
  807792:	48 05 88 dd 80 00    	add    rax,0x80dd88
  807798:	48 89 05 99 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b99],rax        # 428338 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  80779f:	48 8b 05 7a 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b7a]        # 428320 <boot_font>
  8077a6:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8077a9:	89 05 95 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b95],eax        # 428344 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  8077af:	48 8b 05 6a 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b6a]        # 428320 <boot_font>
  8077b6:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8077b9:	89 05 81 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b81],eax        # 428340 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  8077bf:	c7 05 47 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20b47],0x0        # 428310 <fb_cursor_y>
  8077c6:	00 00 00 
  8077c9:	8b 05 41 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b41]        # 428310 <fb_cursor_y>
  8077cf:	89 05 37 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b37],eax        # 42830c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  8077d5:	8b 05 19 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b19]        # 4282f4 <framebuffer+0x14>
  8077db:	8b 0d 47 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20b47]        # 428328 <font_width>
  8077e1:	ba 00 00 00 00       	mov    edx,0x0
  8077e6:	f7 f1                	div    ecx
  8077e8:	89 05 26 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b26],eax        # 428314 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8077ee:	8b 05 04 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b04]        # 4282f8 <framebuffer+0x18>
  8077f4:	8b 35 32 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20b32]        # 42832c <font_height>
  8077fa:	ba 00 00 00 00       	mov    edx,0x0
  8077ff:	f7 f6                	div    esi
  807801:	89 05 11 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b11],eax        # 428318 <max_ch_nr_y>
    font_size=1;
  807807:	c7 05 0f 62 00 00 01 	mov    DWORD PTR [rip+0x620f],0x1        # 80da20 <font_size>
  80780e:	00 00 00 
}
  807811:	90                   	nop
  807812:	5d                   	pop    rbp
  807813:	c3                   	ret    

0000000000807814 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  807814:	f3 0f 1e fa          	endbr64 
  807818:	55                   	push   rbp
  807819:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  80781c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  807820:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  807824:	48 89 05 b5 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ab5],rax        # 4282e0 <framebuffer>
  80782b:	48 89 15 b6 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ab6],rdx        # 4282e8 <framebuffer+0x8>
  807832:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  807836:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80783a:	48 89 05 af 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20aaf],rax        # 4282f0 <framebuffer+0x10>
  807841:	48 89 15 b0 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ab0],rdx        # 4282f8 <framebuffer+0x18>
  807848:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  80784c:	48 89 05 ad 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20aad],rax        # 428300 <framebuffer+0x20>
}
  807853:	90                   	nop
  807854:	5d                   	pop    rbp
  807855:	c3                   	ret    

0000000000807856 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  807856:	f3 0f 1e fa          	endbr64 
  80785a:	55                   	push   rbp
  80785b:	48 89 e5             	mov    rbp,rsp
  80785e:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  807861:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  807864:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  807867:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  80786a:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80786e:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807875:	80 ff ff 
  807878:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  80787c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80787f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807882:	eb 6c                	jmp    8078f0 <fill_rect+0x9a>
        for(int px=y;px<w+y;px++){
  807884:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  807887:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  80788a:	eb 53                	jmp    8078df <fill_rect+0x89>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80788c:	8b 15 5e 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20a5e]        # 4282f0 <framebuffer+0x10>
  807892:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807895:	0f af c2             	imul   eax,edx
  807898:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  80789a:	0f b6 05 5b 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a5b]        # 4282fc <framebuffer+0x1c>
  8078a1:	0f b6 c0             	movzx  eax,al
  8078a4:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8078a8:	8d 50 07             	lea    edx,[rax+0x7]
  8078ab:	85 c0                	test   eax,eax
  8078ad:	0f 48 c2             	cmovs  eax,edx
  8078b0:	c1 f8 03             	sar    eax,0x3
  8078b3:	48 98                	cdqe   
  8078b5:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8078b9:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  8078c0:	80 ff ff 
  8078c3:	48 01 d0             	add    rax,rdx
  8078c6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  8078ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078ce:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  8078d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078d6:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8078d9:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  8078db:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8078df:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8078e2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8078e5:	01 d0                	add    eax,edx
  8078e7:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8078ea:	7c a0                	jl     80788c <fill_rect+0x36>
    for(int py=x;py<h+x;py++){
  8078ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8078f0:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  8078f3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8078f6:	01 d0                	add    eax,edx
  8078f8:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8078fb:	7c 87                	jl     807884 <fill_rect+0x2e>
        }
    }
}
  8078fd:	90                   	nop
  8078fe:	90                   	nop
  8078ff:	5d                   	pop    rbp
  807900:	c3                   	ret    

0000000000807901 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  807901:	f3 0f 1e fa          	endbr64 
  807905:	55                   	push   rbp
  807906:	48 89 e5             	mov    rbp,rsp
  807909:	48 83 ec 30          	sub    rsp,0x30
  80790d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807910:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807913:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807916:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  80791a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80791d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  807920:	eb 5a                	jmp    80797c <draw_text+0x7b>
    {
        if(*str=='\n')
  807922:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807926:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807929:	3c 0a                	cmp    al,0xa
  80792b:	75 1c                	jne    807949 <draw_text+0x48>
        {
            y+=font_height*size;
  80792d:	8b 15 f9 09 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc209f9]        # 42832c <font_height>
  807933:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807936:	0f af d0             	imul   edx,eax
  807939:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80793c:	01 d0                	add    eax,edx
  80793e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  807941:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807944:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807947:	eb 2e                	jmp    807977 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  807949:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80794d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807950:	0f be c8             	movsx  ecx,al
  807953:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  807956:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  807959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80795c:	89 c7                	mov    edi,eax
  80795e:	e8 28 00 00 00       	call   80798b <draw_letter>
            tx+=size*font_width;
  807963:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  807966:	8b 05 bc 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209bc]        # 428328 <font_width>
  80796c:	0f af d0             	imul   edx,eax
  80796f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807972:	01 d0                	add    eax,edx
  807974:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  807977:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  80797c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807980:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807983:	84 c0                	test   al,al
  807985:	75 9b                	jne    807922 <draw_text+0x21>
    }
}
  807987:	90                   	nop
  807988:	90                   	nop
  807989:	c9                   	leave  
  80798a:	c3                   	ret    

000000000080798b <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  80798b:	f3 0f 1e fa          	endbr64 
  80798f:	55                   	push   rbp
  807990:	48 89 e5             	mov    rbp,rsp
  807993:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  807996:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  807999:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  80799c:	89 c8                	mov    eax,ecx
  80799e:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  8079a1:	48 8b 05 90 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20990]        # 428338 <glyph_table>
  8079a8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  8079ac:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  8079b0:	8b 05 8e 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2098e]        # 428344 <glyph_nr>
  8079b6:	39 c2                	cmp    edx,eax
  8079b8:	73 13                	jae    8079cd <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  8079ba:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  8079be:	8b 05 7c 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2097c]        # 428340 <bytes_per_glyph>
  8079c4:	0f af c2             	imul   eax,edx
  8079c7:	89 c0                	mov    eax,eax
  8079c9:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8079cd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8079d4:	e9 d3 00 00 00       	jmp    807aac <draw_letter+0x121>
        u8 mask = 1 << 7;
  8079d9:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8079dd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8079e4:	e9 a4 00 00 00       	jmp    807a8d <draw_letter+0x102>
            int px=x+ch_x*size;
  8079e9:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8079ec:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8079f0:	89 c2                	mov    edx,eax
  8079f2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8079f5:	01 d0                	add    eax,edx
  8079f7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8079fa:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8079fd:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  807a01:	89 c2                	mov    edx,eax
  807a03:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  807a06:	01 d0                	add    eax,edx
  807a08:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807a0b:	8b 15 df 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc208df]        # 4282f0 <framebuffer+0x10>
  807a11:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807a14:	0f af c2             	imul   eax,edx
  807a17:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  807a19:	0f b6 05 dc 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208dc]        # 4282fc <framebuffer+0x1c>
  807a20:	0f b6 c0             	movzx  eax,al
  807a23:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  807a27:	8d 50 07             	lea    edx,[rax+0x7]
  807a2a:	85 c0                	test   eax,eax
  807a2c:	0f 48 c2             	cmovs  eax,edx
  807a2f:	c1 f8 03             	sar    eax,0x3
  807a32:	48 98                	cdqe   
  807a34:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  807a38:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807a3f:	80 ff ff 
  807a42:	48 01 d0             	add    rax,rdx
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807a45:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  807a49:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807a4c:	c1 e8 03             	shr    eax,0x3
  807a4f:	89 c2                	mov    edx,eax
  807a51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a55:	48 01 d0             	add    rax,rdx
  807a58:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807a5b:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  807a5e:	84 c0                	test   al,al
  807a60:	74 0c                	je     807a6e <draw_letter+0xe3>
                *ptr=-1;
  807a62:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a66:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  807a6c:	eb 0a                	jmp    807a78 <draw_letter+0xed>
            } else {
                *ptr=0;
  807a6e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a72:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  807a78:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  807a7b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807a7e:	83 e0 07             	and    eax,0x7
  807a81:	85 c0                	test   eax,eax
  807a83:	75 04                	jne    807a89 <draw_letter+0xfe>
                mask = 1 << 7;
  807a85:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  807a89:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807a8d:	8b 05 95 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20895]        # 428328 <font_width>
  807a93:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807a96:	0f 82 4d ff ff ff    	jb     8079e9 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  807a9c:	8b 05 8e 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2088e]        # 428330 <font_width_bytes>
  807aa2:	89 c0                	mov    eax,eax
  807aa4:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807aa8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807aac:	8b 05 7a 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2087a]        # 42832c <font_height>
  807ab2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  807ab5:	0f 82 1e ff ff ff    	jb     8079d9 <draw_letter+0x4e>
    }
}
  807abb:	90                   	nop
  807abc:	90                   	nop
  807abd:	5d                   	pop    rbp
  807abe:	c3                   	ret    

0000000000807abf <scr_up>:
//向上滚动一个像素
void scr_up(){
  807abf:	f3 0f 1e fa          	endbr64 
  807ac3:	55                   	push   rbp
  807ac4:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807ac7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807ace:	eb 79                	jmp    807b49 <scr_up+0x8a>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807ad0:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807ad7:	eb 5f                	jmp    807b38 <scr_up+0x79>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  807ad9:	8b 15 11 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20811]        # 4282f0 <framebuffer+0x10>
  807adf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807ae2:	0f af c2             	imul   eax,edx
  807ae5:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  807ae7:	0f b6 05 0e 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2080e]        # 4282fc <framebuffer+0x1c>
  807aee:	0f b6 c0             	movzx  eax,al
  807af1:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807af5:	8d 50 07             	lea    edx,[rax+0x7]
  807af8:	85 c0                	test   eax,eax
  807afa:	0f 48 c2             	cmovs  eax,edx
  807afd:	c1 f8 03             	sar    eax,0x3
  807b00:	48 98                	cdqe   
  807b02:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  807b06:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807b0d:	80 ff ff 
  807b10:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+
  807b13:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  807b17:	8b 05 d3 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207d3]        # 4282f0 <framebuffer+0x10>
  807b1d:	89 c2                	mov    edx,eax
  807b1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b23:	48 01 d0             	add    rax,rdx
  807b26:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807b29:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b2d:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  807b2f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807b34:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807b38:	8b 15 b6 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc207b6]        # 4282f4 <framebuffer+0x14>
  807b3e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b41:	39 c2                	cmp    edx,eax
  807b43:	77 94                	ja     807ad9 <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807b45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807b49:	8b 05 a9 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207a9]        # 4282f8 <framebuffer+0x18>
  807b4f:	8d 50 ff             	lea    edx,[rax-0x1]
  807b52:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b55:	39 c2                	cmp    edx,eax
  807b57:	0f 87 73 ff ff ff    	ja     807ad0 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  807b5d:	90                   	nop
  807b5e:	90                   	nop
  807b5f:	5d                   	pop    rbp
  807b60:	c3                   	ret    

0000000000807b61 <scr_down>:
void scr_down(){
  807b61:	f3 0f 1e fa          	endbr64 
  807b65:	55                   	push   rbp
  807b66:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807b69:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  807b70:	eb 7a                	jmp    807bec <scr_down+0x8b>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807b72:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807b79:	eb 60                	jmp    807bdb <scr_down+0x7a>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807b7b:	8b 15 6f 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2076f]        # 4282f0 <framebuffer+0x10>
  807b81:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b84:	0f af c2             	imul   eax,edx
  807b87:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  807b89:	0f b6 05 6c 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2076c]        # 4282fc <framebuffer+0x1c>
  807b90:	0f b6 c0             	movzx  eax,al
  807b93:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807b97:	8d 50 07             	lea    edx,[rax+0x7]
  807b9a:	85 c0                	test   eax,eax
  807b9c:	0f 48 c2             	cmovs  eax,edx
  807b9f:	c1 f8 03             	sar    eax,0x3
  807ba2:	48 98                	cdqe   
  807ba4:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  807ba8:	48 b8 00 00 00 40 00 	movabs rax,0xffff800040000000
  807baf:	80 ff ff 
  807bb2:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807bb5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  807bb9:	8b 05 31 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20731]        # 4282f0 <framebuffer+0x10>
  807bbf:	89 c0                	mov    eax,eax
  807bc1:	48 f7 d8             	neg    rax
  807bc4:	48 89 c2             	mov    rdx,rax
  807bc7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bcb:	48 01 d0             	add    rax,rdx
  807bce:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807bd1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bd5:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807bd7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807bdb:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807bde:	8b 05 30 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20730]        # 428314 <max_ch_nr_x>
  807be4:	39 c2                	cmp    edx,eax
  807be6:	72 93                	jb     807b7b <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807be8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807bec:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807bef:	8b 05 23 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20723]        # 428318 <max_ch_nr_y>
  807bf5:	39 c2                	cmp    edx,eax
  807bf7:	0f 82 75 ff ff ff    	jb     807b72 <scr_down+0x11>
        }

    }
}
  807bfd:	90                   	nop
  807bfe:	90                   	nop
  807bff:	5d                   	pop    rbp
  807c00:	c3                   	ret    

0000000000807c01 <print>:
void print(char* s){
  807c01:	f3 0f 1e fa          	endbr64 
  807c05:	55                   	push   rbp
  807c06:	48 89 e5             	mov    rbp,rsp
  807c09:	48 83 ec 08          	sub    rsp,0x8
  807c0d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  807c11:	e9 c4 00 00 00       	jmp    807cda <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  807c16:	8b 15 f0 06 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc206f0]        # 42830c <fb_cursor_x>
  807c1c:	8b 05 f2 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206f2]        # 428314 <max_ch_nr_x>
  807c22:	39 c2                	cmp    edx,eax
  807c24:	77 0b                	ja     807c31 <print+0x30>
  807c26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c2d:	3c 0a                	cmp    al,0xa
  807c2f:	75 19                	jne    807c4a <print+0x49>
        {
            fb_cursor_y+=1;
  807c31:	8b 05 d9 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206d9]        # 428310 <fb_cursor_y>
  807c37:	83 c0 01             	add    eax,0x1
  807c3a:	89 05 d0 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206d0],eax        # 428310 <fb_cursor_y>
            fb_cursor_x=0;
  807c40:	c7 05 c2 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc206c2],0x0        # 42830c <fb_cursor_x>
  807c47:	00 00 00 
        }
        if(*s=='\n')continue;
  807c4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c51:	3c 0a                	cmp    al,0xa
  807c53:	74 7f                	je     807cd4 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  807c55:	8b 05 bd 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206bd]        # 428318 <max_ch_nr_y>
  807c5b:	8d 50 ff             	lea    edx,[rax-0x1]
  807c5e:	8b 05 ac 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206ac]        # 428310 <fb_cursor_y>
  807c64:	39 c2                	cmp    edx,eax
  807c66:	77 0a                	ja     807c72 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  807c68:	c7 05 9e 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2069e],0x0        # 428310 <fb_cursor_y>
  807c6f:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  807c72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c79:	0f be d0             	movsx  edx,al
  807c7c:	8b 05 9e 5d 00 00    	mov    eax,DWORD PTR [rip+0x5d9e]        # 80da20 <font_size>
  807c82:	8b 35 88 06 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20688]        # 428310 <fb_cursor_y>
  807c88:	8b 0d 9e 06 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2069e]        # 42832c <font_height>
  807c8e:	0f af ce             	imul   ecx,esi
  807c91:	8b 35 89 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d89]        # 80da20 <font_size>
  807c97:	0f af ce             	imul   ecx,esi
  807c9a:	41 89 c8             	mov    r8d,ecx
  807c9d:	8b 35 69 06 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20669]        # 42830c <fb_cursor_x>
  807ca3:	8b 0d 7f 06 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2067f]        # 428328 <font_width>
  807ca9:	0f af ce             	imul   ecx,esi
  807cac:	8b 35 6e 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d6e]        # 80da20 <font_size>
  807cb2:	0f af ce             	imul   ecx,esi
  807cb5:	89 cf                	mov    edi,ecx
  807cb7:	89 d1                	mov    ecx,edx
  807cb9:	89 c2                	mov    edx,eax
  807cbb:	44 89 c6             	mov    esi,r8d
  807cbe:	e8 c8 fc ff ff       	call   80798b <draw_letter>
        fb_cursor_x+=1;
  807cc3:	8b 05 43 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20643]        # 42830c <fb_cursor_x>
  807cc9:	83 c0 01             	add    eax,0x1
  807ccc:	89 05 3a 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2063a],eax        # 42830c <fb_cursor_x>
  807cd2:	eb 01                	jmp    807cd5 <print+0xd4>
        if(*s=='\n')continue;
  807cd4:	90                   	nop
    for(;*s;s++){
  807cd5:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  807cda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807cde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807ce1:	84 c0                	test   al,al
  807ce3:	0f 85 2d ff ff ff    	jne    807c16 <print+0x15>
    }
}
  807ce9:	90                   	nop
  807cea:	90                   	nop
  807ceb:	c9                   	leave  
  807cec:	c3                   	ret    

0000000000807ced <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  807ced:	f3 0f 1e fa          	endbr64 
  807cf1:	55                   	push   rbp
  807cf2:	48 89 e5             	mov    rbp,rsp
  807cf5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807cf9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  807cfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d01:	48 c7 40 20 40 da 80 	mov    QWORD PTR [rax+0x20],0x80da40
  807d08:	00 
    filp->f_ops=&framebuffer_fops;
  807d09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d0d:	48 c7 40 18 40 da 80 	mov    QWORD PTR [rax+0x18],0x80da40
  807d14:	00 
    return 1;
  807d15:	b8 01 00 00 00       	mov    eax,0x1
}
  807d1a:	5d                   	pop    rbp
  807d1b:	c3                   	ret    

0000000000807d1c <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  807d1c:	f3 0f 1e fa          	endbr64 
  807d20:	55                   	push   rbp
  807d21:	48 89 e5             	mov    rbp,rsp
  807d24:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807d28:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  807d2c:	90                   	nop
  807d2d:	5d                   	pop    rbp
  807d2e:	c3                   	ret    

0000000000807d2f <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807d2f:	f3 0f 1e fa          	endbr64 
  807d33:	55                   	push   rbp
  807d34:	48 89 e5             	mov    rbp,rsp
  807d37:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807d3b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807d3f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807d43:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807d47:	90                   	nop
  807d48:	5d                   	pop    rbp
  807d49:	c3                   	ret    

0000000000807d4a <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807d4a:	f3 0f 1e fa          	endbr64 
  807d4e:	55                   	push   rbp
  807d4f:	48 89 e5             	mov    rbp,rsp
  807d52:	48 83 ec 40          	sub    rsp,0x40
  807d56:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  807d5a:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  807d5e:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  807d62:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  807d66:	b8 00 00 00 00       	mov    eax,0x0
  807d6b:	e8 dd 94 ff ff       	call   80124d <vmalloc>
  807d70:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  807d74:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807d78:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  807d7f:	01 10 00 
  807d82:	48 89 c8             	mov    rax,rcx
  807d85:	48 f7 e2             	mul    rdx
  807d88:	48 89 c8             	mov    rax,rcx
  807d8b:	48 29 d0             	sub    rax,rdx
  807d8e:	48 d1 e8             	shr    rax,1
  807d91:	48 01 d0             	add    rax,rdx
  807d94:	48 c1 e8 0b          	shr    rax,0xb
  807d98:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  807d9b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<(c?c:1);i++){
  807da2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807da9:	eb 46                	jmp    807df1 <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807dab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807dae:	48 63 d0             	movsxd rdx,eax
  807db1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807db5:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807db9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807dbd:	ba ff 0f 00 00       	mov    edx,0xfff
  807dc2:	48 89 ce             	mov    rsi,rcx
  807dc5:	48 89 c7             	mov    rdi,rax
  807dc8:	e8 9d 51 00 00       	call   80cf6a <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807dcd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807dd1:	48 05 ff 0f 00 00    	add    rax,0xfff
  807dd7:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807dda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807dde:	48 89 c7             	mov    rdi,rax
  807de1:	e8 1b fe ff ff       	call   807c01 <print>
        p+=PAGE_4K_SIZE-1;
  807de6:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<(c?c:1);i++){
  807ded:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807df1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807df5:	74 05                	je     807dfc <write_framebuffer+0xb2>
  807df7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807dfa:	eb 05                	jmp    807e01 <write_framebuffer+0xb7>
  807dfc:	b8 01 00 00 00       	mov    eax,0x1
  807e01:	3b 45 f8             	cmp    eax,DWORD PTR [rbp-0x8]
  807e04:	7f a5                	jg     807dab <write_framebuffer+0x61>
    }
    vmfree(tmp);
  807e06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e0a:	48 89 c7             	mov    rdi,rax
  807e0d:	e8 db 94 ff ff       	call   8012ed <vmfree>
    return 0;
  807e12:	b8 00 00 00 00       	mov    eax,0x0
}
  807e17:	c9                   	leave  
  807e18:	c3                   	ret    

0000000000807e19 <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  807e19:	f3 0f 1e fa          	endbr64 
  807e1d:	55                   	push   rbp
  807e1e:	48 89 e5             	mov    rbp,rsp
  807e21:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807e25:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807e29:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807e2d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807e31:	90                   	nop
  807e32:	5d                   	pop    rbp
  807e33:	c3                   	ret    

0000000000807e34 <path_walk>:
#include "log.h"
#include "mem.h"
#include "str.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  807e34:	f3 0f 1e fa          	endbr64 
  807e38:	55                   	push   rbp
  807e39:	48 89 e5             	mov    rbp,rsp
  807e3c:	48 83 ec 70          	sub    rsp,0x70
  807e40:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807e44:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
    char * tmpname = NULL;
  807e48:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807e4f:	00 
    int tmpnamelen = 0;
  807e50:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  807e57:	48 8b 05 ea 04 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc204ea]        # 428348 <root_sb>
  807e5e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807e61:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  807e65:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807e6c:	00 

    while(*name == '/')
  807e6d:	eb 05                	jmp    807e74 <path_walk+0x40>
        name++;
  807e6f:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
    while(*name == '/')
  807e74:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e7b:	3c 2f                	cmp    al,0x2f
  807e7d:	74 f0                	je     807e6f <path_walk+0x3b>

    if(!*name)
  807e7f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e86:	84 c0                	test   al,al
  807e88:	75 09                	jne    807e93 <path_walk+0x5f>
    {
        return parent;
  807e8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e8e:	e9 92 02 00 00       	jmp    808125 <path_walk+0x2f1>
    }

    for(;;)
    {
        tmpname = name;
  807e93:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  807e9b:	eb 05                	jmp    807ea2 <path_walk+0x6e>
            name++;
  807e9d:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name && (*name != '/'))
  807ea2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807ea6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807ea9:	84 c0                	test   al,al
  807eab:	74 0b                	je     807eb8 <path_walk+0x84>
  807ead:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807eb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807eb4:	3c 2f                	cmp    al,0x2f
  807eb6:	75 e5                	jne    807e9d <path_walk+0x69>
        tmpnamelen = name - tmpname;
  807eb8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807ebc:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807ec0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807ec3:	be 00 00 00 00       	mov    esi,0x0
  807ec8:	bf 58 00 00 00       	mov    edi,0x58
  807ecd:	b8 00 00 00 00       	mov    eax,0x0
  807ed2:	e8 76 93 ff ff       	call   80124d <vmalloc>
  807ed7:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807edb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807edf:	ba 58 00 00 00       	mov    edx,0x58
  807ee4:	be 00 00 00 00       	mov    esi,0x0
  807ee9:	48 89 c7             	mov    rdi,rax
  807eec:	e8 28 51 00 00       	call   80d019 <memset>

        path->name = vmalloc();
  807ef1:	b8 00 00 00 00       	mov    eax,0x0
  807ef6:	e8 52 93 ff ff       	call   80124d <vmalloc>
  807efb:	48 89 c2             	mov    rdx,rax
  807efe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f02:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807f05:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807f08:	83 c0 01             	add    eax,0x1
  807f0b:	89 c2                	mov    edx,eax
  807f0d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f14:	be 00 00 00 00       	mov    esi,0x0
  807f19:	48 89 c7             	mov    rdi,rax
  807f1c:	e8 f8 50 00 00       	call   80d019 <memset>
        memcpy(path->name,tmpname,tmpnamelen);
  807f21:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807f24:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f2b:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807f2f:	48 89 ce             	mov    rsi,rcx
  807f32:	48 89 c7             	mov    rdi,rax
  807f35:	e8 30 50 00 00       	call   80cf6a <memcpy>
        path->name_length = tmpnamelen;
  807f3a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f3e:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807f41:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
  807f44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f48:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807f4c:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807f50:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807f54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f58:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807f5c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  807f60:	48 89 d6             	mov    rsi,rdx
  807f63:	48 89 c7             	mov    rdi,rax
  807f66:	ff d1                	call   rcx
  807f68:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        if(path == NULL)
  807f6c:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807f71:	75 3e                	jne    807fb1 <path_walk+0x17d>
        {
            printf("can not find file or dir:%s\n",path->name);
  807f73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f77:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f7a:	48 89 c6             	mov    rsi,rax
  807f7d:	bf 07 57 81 00       	mov    edi,0x815707
  807f82:	b8 00 00 00 00       	mov    eax,0x0
  807f87:	e8 eb 8d ff ff       	call   800d77 <printf>
            vmfree(path->name);
  807f8c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f90:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f93:	48 89 c7             	mov    rdi,rax
  807f96:	e8 52 93 ff ff       	call   8012ed <vmfree>
            vmfree(path);
  807f9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f9f:	48 89 c7             	mov    rdi,rax
  807fa2:	e8 46 93 ff ff       	call   8012ed <vmfree>
            return NULL;
  807fa7:	b8 00 00 00 00       	mov    eax,0x0
  807fac:	e9 74 01 00 00       	jmp    808125 <path_walk+0x2f1>
        }

//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
        path->parent = parent;
  807fb1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807fb5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807fb9:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
        //对于/dev这样的文件夹，lookup返回的就是链表里的dentry，data会一样
        list_add(&parent->subdirs_list,&path->child_node);
  807fbd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807fc1:	48 83 c0 10          	add    rax,0x10
  807fc5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807fc9:	48 83 c2 28          	add    rdx,0x28
  807fcd:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807fd1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(entry->next==NULL)
  807fd5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807fd9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807fdd:	48 85 c0             	test   rax,rax
  807fe0:	75 58                	jne    80803a <path_walk+0x206>
  807fe2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807fe6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  807fea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807fee:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    new->next = entry->next;
  807ff2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ff6:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807ffa:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ffe:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  808002:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808006:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80800a:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  80800d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808011:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808015:	48 85 c0             	test   rax,rax
  808018:	74 0f                	je     808029 <path_walk+0x1f5>
        new->next->prev = new;
  80801a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80801e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808022:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  808026:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  808029:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80802d:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  808031:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  808035:	e9 9c 00 00 00       	jmp    8080d6 <path_walk+0x2a2>
        struct List* p=entry;
  80803a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80803e:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        for(;p->next&&p->next!=p;p=p->next){
  808042:	eb 21                	jmp    808065 <path_walk+0x231>
            if(p->data==new->data)
  808044:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808048:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80804c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808050:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808054:	48 39 c2             	cmp    rdx,rax
  808057:	74 7c                	je     8080d5 <path_walk+0x2a1>
        for(;p->next&&p->next!=p;p=p->next){
  808059:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80805d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808061:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  808065:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808069:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80806d:	48 85 c0             	test   rax,rax
  808070:	74 0e                	je     808080 <path_walk+0x24c>
  808072:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808076:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80807a:	48 39 45 b8          	cmp    QWORD PTR [rbp-0x48],rax
  80807e:	75 c4                	jne    808044 <path_walk+0x210>
  808080:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808084:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808088:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80808c:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    new->next = entry->next;
  808090:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808094:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808098:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80809c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8080a0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8080a4:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  8080a8:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8080ab:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8080af:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080b3:	48 85 c0             	test   rax,rax
  8080b6:	74 0f                	je     8080c7 <path_walk+0x293>
        new->next->prev = new;
  8080b8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8080bc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080c0:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  8080c4:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8080c7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8080cb:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  8080cf:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8080d3:	eb 01                	jmp    8080d6 <path_walk+0x2a2>
                return;
  8080d5:	90                   	nop

        if(!*name)
  8080d6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8080dd:	84 c0                	test   al,al
  8080df:	74 2a                	je     80810b <path_walk+0x2d7>
            goto last_component;
        while(*name == '/')
  8080e1:	eb 05                	jmp    8080e8 <path_walk+0x2b4>
            name++;
  8080e3:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name == '/')
  8080e8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8080ef:	3c 2f                	cmp    al,0x2f
  8080f1:	74 f0                	je     8080e3 <path_walk+0x2af>
        if(!*name)
  8080f3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8080fa:	84 c0                	test   al,al
  8080fc:	74 10                	je     80810e <path_walk+0x2da>
            goto last_slash;

        parent = path;
  8080fe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808102:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        tmpname = name;
  808106:	e9 88 fd ff ff       	jmp    807e93 <path_walk+0x5f>
            goto last_component;
  80810b:	90                   	nop
  80810c:	eb 01                	jmp    80810f <path_walk+0x2db>
            goto last_slash;
  80810e:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  80810f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808113:	83 e0 01             	and    eax,0x1
  808116:	48 85 c0             	test   rax,rax
  808119:	74 06                	je     808121 <path_walk+0x2ed>
    {
        return parent;
  80811b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80811f:	eb 04                	jmp    808125 <path_walk+0x2f1>
    }

    return path;
  808121:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  808125:	c9                   	leave  
  808126:	c3                   	ret    

0000000000808127 <fill_dentry>:


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  808127:	f3 0f 1e fa          	endbr64 
  80812b:	55                   	push   rbp
  80812c:	48 89 e5             	mov    rbp,rsp
  80812f:	48 83 ec 40          	sub    rsp,0x40
  808133:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808137:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80813b:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80813f:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  808143:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
    struct dirent* dent = (struct dirent*)buf;
  808147:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80814b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if((unsigned long)buf < PAGE_4K_SIZE)
  80814f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808153:	48 3d ff 0f 00 00    	cmp    rax,0xfff
  808159:	77 07                	ja     808162 <fill_dentry+0x3b>
        return -EFAULT;
  80815b:	b8 eb ff ff ff       	mov    eax,0xffffffeb
  808160:	eb 47                	jmp    8081a9 <fill_dentry+0x82>

    memcpy(name,dent->d_name,namelen);
  808162:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808166:	89 c2                	mov    edx,eax
  808168:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80816c:	48 8d 48 18          	lea    rcx,[rax+0x18]
  808170:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808174:	48 89 ce             	mov    rsi,rcx
  808177:	48 89 c7             	mov    rdi,rax
  80817a:	e8 eb 4d 00 00       	call   80cf6a <memcpy>
    dent->d_namelen = namelen;
  80817f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808183:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808187:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    dent->d_type = type;
  80818b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80818f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808193:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    dent->d_offset = offset;
  808197:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80819b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80819f:	48 89 10             	mov    QWORD PTR [rax],rdx
    return sizeof(struct dirent) + namelen;
  8081a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8081a6:	83 c0 18             	add    eax,0x18
}
  8081a9:	c9                   	leave  
  8081aa:	c3                   	ret    

00000000008081ab <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  8081ab:	f3 0f 1e fa          	endbr64 
  8081af:	55                   	push   rbp
  8081b0:	48 89 e5             	mov    rbp,rsp
  8081b3:	48 83 ec 30          	sub    rsp,0x30
  8081b7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8081bb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8081bf:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  8081c3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8081ca:	00 

    for(p = &filesystem;p;p = p->next)
  8081cb:	48 c7 45 f8 80 da 80 	mov    QWORD PTR [rbp-0x8],0x80da80
  8081d2:	00 
  8081d3:	eb 40                	jmp    808215 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  8081d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8081dc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8081e0:	48 89 d6             	mov    rsi,rdx
  8081e3:	48 89 c7             	mov    rdi,rax
  8081e6:	e8 1d 50 00 00       	call   80d208 <strcmp>
  8081eb:	85 c0                	test   eax,eax
  8081ed:	75 1a                	jne    808209 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  8081ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081f3:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8081f7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8081fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8081ff:	48 89 d6             	mov    rsi,rdx
  808202:	48 89 c7             	mov    rdi,rax
  808205:	ff d1                	call   rcx
  808207:	eb 18                	jmp    808221 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  808209:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80820d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808211:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808215:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80821a:	75 b9                	jne    8081d5 <mount_fs+0x2a>
        }
    return 0;
  80821c:	b8 00 00 00 00       	mov    eax,0x0
}
  808221:	c9                   	leave  
  808222:	c3                   	ret    

0000000000808223 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  808223:	f3 0f 1e fa          	endbr64 
  808227:	55                   	push   rbp
  808228:	48 89 e5             	mov    rbp,rsp
  80822b:	48 83 ec 20          	sub    rsp,0x20
  80822f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  808233:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80823a:	00 

    for(p = &filesystem;p;p = p->next)
  80823b:	48 c7 45 f8 80 da 80 	mov    QWORD PTR [rbp-0x8],0x80da80
  808242:	00 
  808243:	eb 30                	jmp    808275 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  808245:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808249:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80824c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808250:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808253:	48 89 d6             	mov    rsi,rdx
  808256:	48 89 c7             	mov    rdi,rax
  808259:	e8 aa 4f 00 00       	call   80d208 <strcmp>
  80825e:	85 c0                	test   eax,eax
  808260:	75 07                	jne    808269 <register_filesystem+0x46>
            return 0;
  808262:	b8 00 00 00 00       	mov    eax,0x0
  808267:	eb 32                	jmp    80829b <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  808269:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80826d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808271:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808275:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80827a:	75 c9                	jne    808245 <register_filesystem+0x22>

    fs->next = filesystem.next;
  80827c:	48 8b 15 15 58 00 00 	mov    rdx,QWORD PTR [rip+0x5815]        # 80da98 <filesystem+0x18>
  808283:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808287:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  80828b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80828f:	48 89 05 02 58 00 00 	mov    QWORD PTR [rip+0x5802],rax        # 80da98 <filesystem+0x18>

    return 1;
  808296:	b8 01 00 00 00       	mov    eax,0x1
}
  80829b:	c9                   	leave  
  80829c:	c3                   	ret    

000000000080829d <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  80829d:	f3 0f 1e fa          	endbr64 
  8082a1:	55                   	push   rbp
  8082a2:	48 89 e5             	mov    rbp,rsp
  8082a5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  8082a9:	48 c7 45 f8 80 da 80 	mov    QWORD PTR [rbp-0x8],0x80da80
  8082b0:	00 

    while(p->next)
  8082b1:	eb 41                	jmp    8082f4 <unregister_filesystem+0x57>
        if(p->next == fs)
  8082b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8082bb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8082bf:	75 27                	jne    8082e8 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  8082c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082c5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8082c9:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8082cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082d1:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  8082d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8082d9:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8082e0:	00 
            return 1;
  8082e1:	b8 01 00 00 00       	mov    eax,0x1
  8082e6:	eb 1e                	jmp    808306 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  8082e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082ec:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8082f0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  8082f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082f8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8082fc:	48 85 c0             	test   rax,rax
  8082ff:	75 b2                	jne    8082b3 <unregister_filesystem+0x16>
    return 0;
  808301:	b8 00 00 00 00       	mov    eax,0x0
}
  808306:	5d                   	pop    rbp
  808307:	c3                   	ret    

0000000000808308 <root_lookup>:
//在parent inode下查找dest dentry
struct dir_entry* root_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry){
  808308:	f3 0f 1e fa          	endbr64 
  80830c:	55                   	push   rbp
  80830d:	48 89 e5             	mov    rbp,rsp
  808310:	48 83 ec 30          	sub    rsp,0x30
  808314:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  808318:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    struct dir_entry* tmp= (struct dir_entry *) parent_inode->private_index_info;
  80831c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808320:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808324:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    struct List* p= tmp->subdirs_list.next;
  808328:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80832c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808330:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  808334:	eb 47                	jmp    80837d <root_lookup+0x75>
        struct dir_entry* dp=p->data;
  808336:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80833a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80833e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        if(strcmp(dp->name,dest_dentry->name)==0){
  808342:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808346:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808349:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80834d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808350:	48 89 d6             	mov    rsi,rdx
  808353:	48 89 c7             	mov    rdi,rax
  808356:	e8 ad 4e 00 00       	call   80d208 <strcmp>
  80835b:	85 c0                	test   eax,eax
  80835d:	75 12                	jne    808371 <root_lookup+0x69>
            vmfree(dest_dentry);
  80835f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808363:	48 89 c7             	mov    rdi,rax
  808366:	e8 82 8f ff ff       	call   8012ed <vmfree>
            return dp;
  80836b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80836f:	eb 24                	jmp    808395 <root_lookup+0x8d>
        }
        p=p->next;
  808371:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808375:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808379:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  80837d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808382:	75 b2                	jne    808336 <root_lookup+0x2e>
    }
    vmfree(dest_dentry);
  808384:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808388:	48 89 c7             	mov    rdi,rax
  80838b:	e8 5d 8f ff ff       	call   8012ed <vmfree>
    return NULL;
  808390:	b8 00 00 00 00       	mov    eax,0x0
}
  808395:	c9                   	leave  
  808396:	c3                   	ret    

0000000000808397 <mount_rootfs>:
struct index_node_operations root_iops={
    .lookup=root_lookup
};
void mount_rootfs(){
  808397:	f3 0f 1e fa          	endbr64 
  80839b:	55                   	push   rbp
  80839c:	48 89 e5             	mov    rbp,rsp
  80839f:	48 83 ec 20          	sub    rsp,0x20
    root_sb=(struct super_block*)vmalloc();
  8083a3:	b8 00 00 00 00       	mov    eax,0x0
  8083a8:	e8 a0 8e ff ff       	call   80124d <vmalloc>
  8083ad:	48 89 05 94 ff c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1ff94],rax        # 428348 <root_sb>
    root_sb->root=root_sb+1;//紧凑跟在后面
  8083b4:	48 8b 15 8d ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ff8d]        # 428348 <root_sb>
  8083bb:	48 8b 05 86 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff86]        # 428348 <root_sb>
  8083c2:	48 83 c2 18          	add    rdx,0x18
  8083c6:	48 89 10             	mov    QWORD PTR [rax],rdx
    root_sb->sb_ops=NULL;
  8083c9:	48 8b 05 78 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff78]        # 428348 <root_sb>
  8083d0:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  8083d7:	00 
    struct index_node* ir=root_sb->root+1;
  8083d8:	48 8b 05 69 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff69]        # 428348 <root_sb>
  8083df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083e2:	48 83 c0 58          	add    rax,0x58
  8083e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    root_sb->root->dir_inode=ir;
  8083ea:	48 8b 05 57 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff57]        # 428348 <root_sb>
  8083f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083f4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8083f8:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    ir->sb=root_sb;
  8083fc:	48 8b 15 45 ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ff45]        # 428348 <root_sb>
  808403:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808407:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ir->attribute=FS_ATTR_DIR;
  80840b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80840f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  808416:	00 
    ir->file_size=0;
  808417:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80841b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    ir->inode_ops=&root_iops;//lookup函数是必要的
  808422:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808426:	48 c7 40 28 a0 da 80 	mov    QWORD PTR [rax+0x28],0x80daa0
  80842d:	00 
    ir->f_ops=NULL;
  80842e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808432:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  808439:	00 
    ir->private_index_info=root_sb->root;
  80843a:	48 8b 05 07 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff07]        # 428348 <root_sb>
  808441:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808444:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808448:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    root_sb->root->name=ir+1;//紧凑跟在后面
  80844c:	48 8b 05 f5 fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fef5]        # 428348 <root_sb>
  808453:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808456:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80845a:	48 83 c2 38          	add    rdx,0x38
  80845e:	48 89 10             	mov    QWORD PTR [rax],rdx
    strcpy(root_sb->root->name,"/");
  808461:	48 8b 05 e0 fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fee0]        # 428348 <root_sb>
  808468:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80846b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80846e:	be 2f 57 81 00       	mov    esi,0x81572f
  808473:	48 89 c7             	mov    rdi,rax
  808476:	e8 ed 4b 00 00       	call   80d068 <strcpy>
    root_sb->root->name_length=1;
  80847b:	48 8b 05 c6 fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fec6]        # 428348 <root_sb>
  808482:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808485:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1
    root_sb->root->parent=root_sb->root;
  80848c:	48 8b 15 b5 fe c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1feb5]        # 428348 <root_sb>
  808493:	48 8b 05 ae fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1feae]        # 428348 <root_sb>
  80849a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80849d:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  8084a0:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_init(&root_sb->root->subdirs_list);
  8084a4:	48 8b 05 9d fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fe9d]        # 428348 <root_sb>
  8084ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8084ae:	48 83 c0 28          	add    rax,0x28
  8084b2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    list->prev = NULL;
  8084b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084ba:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8084c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084c5:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8084cc:	00 
}
  8084cd:	90                   	nop
    list_init(&root_sb->root->child_node);
  8084ce:	48 8b 05 73 fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fe73]        # 428348 <root_sb>
  8084d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8084d8:	48 83 c0 10          	add    rax,0x10
  8084dc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    list->prev = NULL;
  8084e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084e4:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8084eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084ef:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8084f6:	00 
}
  8084f7:	90                   	nop

}
  8084f8:	90                   	nop
  8084f9:	c9                   	leave  
  8084fa:	c3                   	ret    

00000000008084fb <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  8084fb:	f3 0f 1e fa          	endbr64 
  8084ff:	55                   	push   rbp
  808500:	48 89 e5             	mov    rbp,rsp
  808503:	48 83 ec 10          	sub    rsp,0x10
  808507:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  80850b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80850f:	48 89 c7             	mov    rdi,rax
  808512:	b8 00 00 00 00       	mov    eax,0x0
  808517:	e8 5b 88 ff ff       	call   800d77 <printf>
    return 0;
  80851c:	b8 00 00 00 00       	mov    eax,0x0
}
  808521:	c9                   	leave  
  808522:	c3                   	ret    

0000000000808523 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  808523:	f3 0f 1e fa          	endbr64 
  808527:	55                   	push   rbp
  808528:	48 89 e5             	mov    rbp,rsp
  80852b:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  808532:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808539:	89 b5 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],esi
    char * path = NULL;
  80853f:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808546:	00 
    long pathlen = 0;
  808547:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80854e:	00 
    long error = 0;
  80854f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808556:	00 
    struct dir_entry * dentry = NULL;
  808557:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80855e:	00 
    struct file * filp = NULL;
  80855f:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  808566:	00 
    struct file ** f = NULL;
  808567:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80856e:	00 
    int fd = -1;
  80856f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  808576:	b8 00 00 00 00       	mov    eax,0x0
  80857b:	e8 cd 8c ff ff       	call   80124d <vmalloc>
  808580:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    if(path == NULL)
  808584:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808589:	75 0c                	jne    808597 <sys_open+0x74>
        return -ENOMEM;
  80858b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  808592:	e9 21 05 00 00       	jmp    808ab8 <sys_open+0x595>
    memset(path,0,PAGE_4K_SIZE);
  808597:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80859b:	ba 00 10 00 00       	mov    edx,0x1000
  8085a0:	be 00 00 00 00       	mov    esi,0x0
  8085a5:	48 89 c7             	mov    rdi,rax
  8085a8:	e8 6c 4a 00 00       	call   80d019 <memset>
    pathlen = strlen(filename);
  8085ad:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  8085b4:	48 89 c7             	mov    rdi,rax
  8085b7:	e8 cb 4c 00 00       	call   80d287 <strlen>
  8085bc:	48 98                	cdqe   
  8085be:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(pathlen <= 0)
  8085c2:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8085c7:	7f 18                	jg     8085e1 <sys_open+0xbe>
    {
        vmfree(path);
  8085c9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085cd:	48 89 c7             	mov    rdi,rax
  8085d0:	e8 18 8d ff ff       	call   8012ed <vmfree>
        return -EFAULT;
  8085d5:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8085dc:	e9 d7 04 00 00       	jmp    808ab8 <sys_open+0x595>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8085e1:	48 81 7d d0 ff 0f 00 	cmp    QWORD PTR [rbp-0x30],0xfff
  8085e8:	00 
  8085e9:	7e 18                	jle    808603 <sys_open+0xe0>
    {
        vmfree(path);
  8085eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085ef:	48 89 c7             	mov    rdi,rax
  8085f2:	e8 f6 8c ff ff       	call   8012ed <vmfree>
        return -ENAMETOOLONG;
  8085f7:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8085fe:	e9 b5 04 00 00       	jmp    808ab8 <sys_open+0x595>
    }
    strcpy(path,filename);
  808603:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  80860a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80860e:	48 89 d6             	mov    rsi,rdx
  808611:	48 89 c7             	mov    rdi,rax
  808614:	e8 4f 4a 00 00       	call   80d068 <strcpy>

    dentry = path_walk(path,0);
  808619:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80861d:	be 00 00 00 00       	mov    esi,0x0
  808622:	48 89 c7             	mov    rdi,rax
  808625:	e8 0a f8 ff ff       	call   807e34 <path_walk>
  80862a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    if(dentry == NULL){
  80862e:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808633:	0f 85 70 02 00 00    	jne    8088a9 <sys_open+0x386>
        if(!flags&O_CREAT)
            return -ENOENT;
        //创建文件
        //找到上一级目录
        char* p=path+strlen(path)-1;
  808639:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80863d:	48 89 c7             	mov    rdi,rax
  808640:	e8 42 4c 00 00       	call   80d287 <strlen>
  808645:	48 98                	cdqe   
  808647:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80864b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80864f:	48 01 d0             	add    rax,rdx
  808652:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(;*p!='/'&&p>path;p--);
  808656:	eb 05                	jmp    80865d <sys_open+0x13a>
  808658:	48 83 6d e0 01       	sub    QWORD PTR [rbp-0x20],0x1
  80865d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808661:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808664:	3c 2f                	cmp    al,0x2f
  808666:	74 0a                	je     808672 <sys_open+0x14f>
  808668:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80866c:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  808670:	77 e6                	ja     808658 <sys_open+0x135>
        *p='\0';
  808672:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808676:	c6 00 00             	mov    BYTE PTR [rax],0x0
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
  808679:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80867d:	be 00 40 00 00       	mov    esi,0x4000
  808682:	48 89 c7             	mov    rdi,rax
  808685:	e8 aa f7 ff ff       	call   807e34 <path_walk>
  80868a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        if(parent==NULL)
  80868e:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  808693:	75 0c                	jne    8086a1 <sys_open+0x17e>
            return -ENOENT;//上级目录也不在
  808695:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  80869c:	e9 17 04 00 00       	jmp    808ab8 <sys_open+0x595>
        //创建新的文件
        dentry=(struct dir_entry*)vmalloc();
  8086a1:	b8 00 00 00 00       	mov    eax,0x0
  8086a6:	e8 a2 8b ff ff       	call   80124d <vmalloc>
  8086ab:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        list_init(&dentry->subdirs_list);
  8086af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086b3:	48 83 c0 28          	add    rax,0x28
  8086b7:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    list->prev = NULL;
  8086be:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8086c5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8086cc:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8086d3:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8086da:	00 
}
  8086db:	90                   	nop
        list_init(&dentry->child_node);
  8086dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086e0:	48 83 c0 10          	add    rax,0x10
  8086e4:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    list->prev = NULL;
  8086eb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8086f2:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8086f9:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808700:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808707:	00 
}
  808708:	90                   	nop
        dentry->child_node.data=dentry;
  808709:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80870d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  808711:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
        list_add(&parent->subdirs_list,&dentry->child_node);
  808715:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808719:	48 83 c0 10          	add    rax,0x10
  80871d:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808721:	48 83 c2 28          	add    rdx,0x28
  808725:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
  808729:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    if(entry->next==NULL)
  80872d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808731:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808735:	48 85 c0             	test   rax,rax
  808738:	75 58                	jne    808792 <sys_open+0x26f>
  80873a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80873e:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808742:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808746:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    new->next = entry->next;
  80874a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80874e:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808752:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808756:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  80875a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80875e:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  808762:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  808765:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808769:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80876d:	48 85 c0             	test   rax,rax
  808770:	74 0f                	je     808781 <sys_open+0x25e>
        new->next->prev = new;
  808772:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808776:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80877a:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  80877e:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  808781:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808785:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  808789:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80878d:	e9 9c 00 00 00       	jmp    80882e <sys_open+0x30b>
        struct List* p=entry;
  808792:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808796:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
        for(;p->next&&p->next!=p;p=p->next){
  80879a:	eb 21                	jmp    8087bd <sys_open+0x29a>
            if(p->data==new->data)
  80879c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8087a0:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8087a4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8087a8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8087ac:	48 39 c2             	cmp    rdx,rax
  8087af:	74 7c                	je     80882d <sys_open+0x30a>
        for(;p->next&&p->next!=p;p=p->next){
  8087b1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8087b5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087b9:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8087bd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8087c1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087c5:	48 85 c0             	test   rax,rax
  8087c8:	74 0e                	je     8087d8 <sys_open+0x2b5>
  8087ca:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8087ce:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087d2:	48 39 45 90          	cmp    QWORD PTR [rbp-0x70],rax
  8087d6:	75 c4                	jne    80879c <sys_open+0x279>
  8087d8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8087dc:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  8087e0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8087e4:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  8087e8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8087ec:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8087f0:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8087f4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8087f8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8087fc:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  808800:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  808803:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808807:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80880b:	48 85 c0             	test   rax,rax
  80880e:	74 0f                	je     80881f <sys_open+0x2fc>
        new->next->prev = new;
  808810:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808814:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808818:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  80881c:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80881f:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808823:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  808827:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80882b:	eb 01                	jmp    80882e <sys_open+0x30b>
                return;
  80882d:	90                   	nop
        dentry->parent=parent;
  80882e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808832:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808836:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        dentry->dir_inode=dentry+1;//放在后面
  80883a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80883e:	48 8d 50 58          	lea    rdx,[rax+0x58]
  808842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808846:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
        dentry->dir_inode->file_size=0;
  80884a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80884e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808852:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
  808859:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80885d:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  808861:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808865:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808869:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
  80886d:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        dentry->dir_inode->inode_ops=parent->dir_inode->inode_ops;
  808871:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808875:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  808879:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80887d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808881:	48 8b 52 28          	mov    rdx,QWORD PTR [rdx+0x28]
  808885:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
        dentry->dir_ops=parent->dir_ops;
  808889:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80888d:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  808891:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808895:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
        //这样的创建文件只能创建普通文件，设备文件要通过devman创建
        dentry->dir_inode->attribute=FS_ATTR_FILE;
  808899:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80889d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088a1:	48 c7 40 10 01 00 00 	mov    QWORD PTR [rax+0x10],0x1
  8088a8:	00 
    }
    vmfree(path);
  8088a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8088ad:	48 89 c7             	mov    rdi,rax
  8088b0:	e8 38 8a ff ff       	call   8012ed <vmfree>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  8088b5:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8088bb:	25 00 40 00 00       	and    eax,0x4000
  8088c0:	85 c0                	test   eax,eax
  8088c2:	74 1e                	je     8088e2 <sys_open+0x3bf>
  8088c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8088c8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088cc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088d0:	48 83 f8 02          	cmp    rax,0x2
  8088d4:	74 0c                	je     8088e2 <sys_open+0x3bf>
        return -ENOTDIR;
  8088d6:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8088dd:	e9 d6 01 00 00       	jmp    808ab8 <sys_open+0x595>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8088e2:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8088e8:	25 00 40 00 00       	and    eax,0x4000
  8088ed:	85 c0                	test   eax,eax
  8088ef:	75 1e                	jne    80890f <sys_open+0x3ec>
  8088f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8088f5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088f9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088fd:	48 83 f8 02          	cmp    rax,0x2
  808901:	75 0c                	jne    80890f <sys_open+0x3ec>
        return -EISDIR;
  808903:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  80890a:	e9 a9 01 00 00       	jmp    808ab8 <sys_open+0x595>

    filp = (struct file *)vmalloc();
  80890f:	b8 00 00 00 00       	mov    eax,0x0
  808914:	e8 34 89 ff ff       	call   80124d <vmalloc>
  808919:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    memset(filp,0,sizeof(struct file));
  80891d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808921:	ba 28 00 00 00       	mov    edx,0x28
  808926:	be 00 00 00 00       	mov    esi,0x0
  80892b:	48 89 c7             	mov    rdi,rax
  80892e:	e8 e6 46 00 00       	call   80d019 <memset>
    filp->dentry = dentry;
  808933:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808937:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80893b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  80893f:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808945:	48 63 d0             	movsxd rdx,eax
  808948:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80894c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
  808950:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808954:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808958:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80895c:	83 e0 04             	and    eax,0x4
  80895f:	48 85 c0             	test   rax,rax
  808962:	74 0e                	je     808972 <sys_open+0x44f>
        extern struct file_operations dev_dir_fops;
        filp->f_ops = &dev_dir_fops;	//////	find device file operation function
  808964:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808968:	48 c7 40 18 c0 d9 80 	mov    QWORD PTR [rax+0x18],0x80d9c0
  80896f:	00 
  808970:	eb 14                	jmp    808986 <sys_open+0x463>
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  808972:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808976:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80897a:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80897e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808982:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  808986:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80898a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80898e:	48 85 c0             	test   rax,rax
  808991:	74 33                	je     8089c6 <sys_open+0x4a3>
  808993:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808997:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80899b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80899e:	48 85 c0             	test   rax,rax
  8089a1:	74 23                	je     8089c6 <sys_open+0x4a3>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  8089a3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089a7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089ab:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8089ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089b2:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8089b6:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8089ba:	48 89 d6             	mov    rsi,rdx
  8089bd:	48 89 c7             	mov    rdi,rax
  8089c0:	ff d1                	call   rcx
  8089c2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  8089c6:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8089cb:	74 18                	je     8089e5 <sys_open+0x4c2>
    {
        vmfree(filp);
  8089cd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089d1:	48 89 c7             	mov    rdi,rax
  8089d4:	e8 14 89 ff ff       	call   8012ed <vmfree>
        return -EFAULT;
  8089d9:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8089e0:	e9 d3 00 00 00       	jmp    808ab8 <sys_open+0x595>
    }

    if(filp->mode & O_TRUNC)
  8089e5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089e9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8089ed:	25 00 02 00 00       	and    eax,0x200
  8089f2:	48 85 c0             	test   rax,rax
  8089f5:	74 13                	je     808a0a <sys_open+0x4e7>
    {
        filp->dentry->dir_inode->file_size = 0;
  8089f7:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8089ff:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808a03:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  808a0a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a0e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808a12:	25 00 04 00 00       	and    eax,0x400
  808a17:	48 85 c0             	test   rax,rax
  808a1a:	74 19                	je     808a35 <sys_open+0x512>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  808a1c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a20:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808a24:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808a28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a2b:	48 89 c2             	mov    rdx,rax
  808a2e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a32:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  808a35:	48 8b 05 04 c8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c804]        # 415240 <current>
  808a3c:	48 05 d8 00 00 00    	add    rax,0xd8
  808a42:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    for(i = 0;i < MAX_TASKS;i++)
  808a46:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  808a4d:	eb 28                	jmp    808a77 <sys_open+0x554>
        if(f[i] == NULL)
  808a4f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808a52:	48 98                	cdqe   
  808a54:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  808a5b:	00 
  808a5c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808a60:	48 01 d0             	add    rax,rdx
  808a63:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a66:	48 85 c0             	test   rax,rax
  808a69:	75 08                	jne    808a73 <sys_open+0x550>
        {
            fd = i;
  808a6b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808a6e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            break;
  808a71:	eb 0a                	jmp    808a7d <sys_open+0x55a>
    for(i = 0;i < MAX_TASKS;i++)
  808a73:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808a77:	83 7d e8 1f          	cmp    DWORD PTR [rbp-0x18],0x1f
  808a7b:	7e d2                	jle    808a4f <sys_open+0x52c>
        }
    if(i == MAX_TASKS)
  808a7d:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
  808a81:	75 15                	jne    808a98 <sys_open+0x575>
    {
        vmfree(filp);
  808a83:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a87:	48 89 c7             	mov    rdi,rax
  808a8a:	e8 5e 88 ff ff       	call   8012ed <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  808a8f:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  808a96:	eb 20                	jmp    808ab8 <sys_open+0x595>
    }
    f[fd] = filp;
  808a98:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a9b:	48 98                	cdqe   
  808a9d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  808aa4:	00 
  808aa5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808aa9:	48 01 c2             	add    rdx,rax
  808aac:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808ab0:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  808ab3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808ab6:	48 98                	cdqe   
}
  808ab8:	c9                   	leave  
  808ab9:	c3                   	ret    

0000000000808aba <sys_close>:

unsigned long sys_close(int fd)
{
  808aba:	f3 0f 1e fa          	endbr64 
  808abe:	55                   	push   rbp
  808abf:	48 89 e5             	mov    rbp,rsp
  808ac2:	48 83 ec 20          	sub    rsp,0x20
  808ac6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  808ac9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808ad0:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808ad1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808ad5:	78 06                	js     808add <sys_close+0x23>
  808ad7:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808adb:	7e 0c                	jle    808ae9 <sys_close+0x2f>
        return -EBADF;
  808add:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808ae4:	e9 87 00 00 00       	jmp    808b70 <sys_close+0xb6>

    filp = current->openf[fd];
  808ae9:	48 8b 05 50 c7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c750]        # 415240 <current>
  808af0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808af3:	48 63 d2             	movsxd rdx,edx
  808af6:	48 83 c2 1a          	add    rdx,0x1a
  808afa:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808aff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  808b03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b07:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b0b:	48 85 c0             	test   rax,rax
  808b0e:	74 35                	je     808b45 <sys_close+0x8b>
  808b10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b14:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b18:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808b1c:	48 85 c0             	test   rax,rax
  808b1f:	74 24                	je     808b45 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  808b21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b25:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b29:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  808b2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b31:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b35:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808b39:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808b3d:	48 89 d6             	mov    rsi,rdx
  808b40:	48 89 c7             	mov    rdi,rax
  808b43:	ff d1                	call   rcx

    vmfree(filp);
  808b45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b49:	48 89 c7             	mov    rdi,rax
  808b4c:	e8 9c 87 ff ff       	call   8012ed <vmfree>
    current->openf[fd] = NULL;
  808b51:	48 8b 05 e8 c6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c6e8]        # 415240 <current>
  808b58:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808b5b:	48 63 d2             	movsxd rdx,edx
  808b5e:	48 83 c2 1a          	add    rdx,0x1a
  808b62:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  808b69:	00 00 

    return 0;
  808b6b:	b8 00 00 00 00       	mov    eax,0x0
}
  808b70:	c9                   	leave  
  808b71:	c3                   	ret    

0000000000808b72 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  808b72:	f3 0f 1e fa          	endbr64 
  808b76:	55                   	push   rbp
  808b77:	48 89 e5             	mov    rbp,rsp
  808b7a:	48 83 ec 30          	sub    rsp,0x30
  808b7e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808b81:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808b85:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808b89:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808b90:	00 
    unsigned long ret = 0;
  808b91:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808b98:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808b99:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808b9d:	78 06                	js     808ba5 <sys_read+0x33>
  808b9f:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808ba3:	7e 09                	jle    808bae <sys_read+0x3c>
        return -EBADF;
  808ba5:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808bac:	eb 72                	jmp    808c20 <sys_read+0xae>
    if(count < 0)
  808bae:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808bb3:	79 09                	jns    808bbe <sys_read+0x4c>
        return -EINVAL;
  808bb5:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808bbc:	eb 62                	jmp    808c20 <sys_read+0xae>

    filp = current->openf[fd];
  808bbe:	48 8b 05 7b c6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c67b]        # 415240 <current>
  808bc5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808bc8:	48 63 d2             	movsxd rdx,edx
  808bcb:	48 83 c2 1a          	add    rdx,0x1a
  808bcf:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808bd4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  808bd8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808bdc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808be0:	48 85 c0             	test   rax,rax
  808be3:	74 37                	je     808c1c <sys_read+0xaa>
  808be5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808be9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808bed:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808bf1:	48 85 c0             	test   rax,rax
  808bf4:	74 26                	je     808c1c <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  808bf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808bfa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808bfe:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  808c02:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808c06:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808c0a:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808c0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c12:	48 89 c7             	mov    rdi,rax
  808c15:	41 ff d0             	call   r8
  808c18:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808c1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808c20:	c9                   	leave  
  808c21:	c3                   	ret    

0000000000808c22 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  808c22:	f3 0f 1e fa          	endbr64 
  808c26:	55                   	push   rbp
  808c27:	48 89 e5             	mov    rbp,rsp
  808c2a:	48 83 ec 30          	sub    rsp,0x30
  808c2e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808c31:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808c35:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808c39:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808c40:	00 
    unsigned long ret = 0;
  808c41:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808c48:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808c49:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808c4d:	78 06                	js     808c55 <sys_write+0x33>
  808c4f:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808c53:	7e 09                	jle    808c5e <sys_write+0x3c>
        return -EBADF;
  808c55:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808c5c:	eb 72                	jmp    808cd0 <sys_write+0xae>
    if(count < 0)
  808c5e:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808c63:	79 09                	jns    808c6e <sys_write+0x4c>
        return -EINVAL;
  808c65:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808c6c:	eb 62                	jmp    808cd0 <sys_write+0xae>

    filp = current->openf[fd];
  808c6e:	48 8b 05 cb c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c5cb]        # 415240 <current>
  808c75:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808c78:	48 63 d2             	movsxd rdx,edx
  808c7b:	48 83 c2 1a          	add    rdx,0x1a
  808c7f:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808c84:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  808c88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c8c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c90:	48 85 c0             	test   rax,rax
  808c93:	74 37                	je     808ccc <sys_write+0xaa>
  808c95:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c99:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c9d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ca1:	48 85 c0             	test   rax,rax
  808ca4:	74 26                	je     808ccc <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  808ca6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808caa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808cae:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  808cb2:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808cb6:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808cba:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808cbe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808cc2:	48 89 c7             	mov    rdi,rax
  808cc5:	41 ff d0             	call   r8
  808cc8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808ccc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808cd0:	c9                   	leave  
  808cd1:	c3                   	ret    

0000000000808cd2 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  808cd2:	f3 0f 1e fa          	endbr64 
  808cd6:	55                   	push   rbp
  808cd7:	48 89 e5             	mov    rbp,rsp
  808cda:	48 83 ec 20          	sub    rsp,0x20
  808cde:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808ce1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808ce5:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  808ce8:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808cef:	00 
    unsigned long ret = 0;
  808cf0:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808cf7:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  808cf8:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808cfc:	78 06                	js     808d04 <sys_lseek+0x32>
  808cfe:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808d02:	7e 09                	jle    808d0d <sys_lseek+0x3b>
        return -EBADF;
  808d04:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808d0b:	eb 78                	jmp    808d85 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  808d0d:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  808d11:	78 06                	js     808d19 <sys_lseek+0x47>
  808d13:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  808d17:	7e 09                	jle    808d22 <sys_lseek+0x50>
        return -EINVAL;
  808d19:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808d20:	eb 63                	jmp    808d85 <sys_lseek+0xb3>

    filp = current->openf[filds];
  808d22:	48 8b 05 17 c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c517]        # 415240 <current>
  808d29:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808d2c:	48 63 d2             	movsxd rdx,edx
  808d2f:	48 83 c2 1a          	add    rdx,0x1a
  808d33:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808d38:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  808d3c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d40:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808d44:	48 85 c0             	test   rax,rax
  808d47:	74 38                	je     808d81 <sys_lseek+0xaf>
  808d49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d4d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808d51:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808d55:	48 85 c0             	test   rax,rax
  808d58:	74 27                	je     808d81 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  808d5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d5e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808d62:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  808d66:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808d69:	48 63 d0             	movsxd rdx,eax
  808d6c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808d70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d74:	48 89 ce             	mov    rsi,rcx
  808d77:	48 89 c7             	mov    rdi,rax
  808d7a:	41 ff d0             	call   r8
  808d7d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808d85:	c9                   	leave  
  808d86:	c3                   	ret    

0000000000808d87 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  808d87:	f3 0f 1e fa          	endbr64 
  808d8b:	55                   	push   rbp
  808d8c:	48 89 e5             	mov    rbp,rsp
  808d8f:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  808d93:	48 8b 05 a6 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c4a6]        # 415240 <current>
  808d9a:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  808da1:	48 2d d0 00 00 00    	sub    rax,0xd0
  808da7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  808dab:	bf 38 57 81 00       	mov    edi,0x815738
  808db0:	b8 00 00 00 00       	mov    eax,0x0
  808db5:	e8 bd 7f ff ff       	call   800d77 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  808dba:	90                   	nop
  808dbb:	c9                   	leave  
  808dbc:	c3                   	ret    

0000000000808dbd <sys_wait>:

/*
	rusage reserved
*/

unsigned long sys_wait(pid_t pid, int *stat_loc, int options){
  808dbd:	f3 0f 1e fa          	endbr64 
  808dc1:	55                   	push   rbp
  808dc2:	48 89 e5             	mov    rbp,rsp
  808dc5:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  808dc8:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  808dcc:	89 55 b8             	mov    DWORD PTR [rbp-0x48],edx
    struct process* waitee=NULL;
  808dcf:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808dd6:	00 
    extern struct process task[];
    if(!current->child_procs)
  808dd7:	48 8b 05 62 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c462]        # 415240 <current>
  808dde:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808de5:	48 85 c0             	test   rax,rax
  808de8:	75 0c                	jne    808df6 <sys_wait+0x39>
        return -ECHILD;//没有子进程可以等
  808dea:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808df1:	e9 af 01 00 00       	jmp    808fa5 <sys_wait+0x1e8>
    if(pid==-1){
  808df6:	83 7d bc ff          	cmp    DWORD PTR [rbp-0x44],0xffffffff
  808dfa:	75 4e                	jne    808e4a <sys_wait+0x8d>
        //任意一个子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808dfc:	48 8b 05 3d c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c43d]        # 415240 <current>
  808e03:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808e0a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808e0e:	eb 31                	jmp    808e41 <sys_wait+0x84>
                struct process* p=l->data;
  808e10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808e14:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808e18:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                if(p->stat == TASK_ZOMBIE) {
  808e1c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808e20:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808e23:	83 f8 04             	cmp    eax,0x4
  808e26:	75 0d                	jne    808e35 <sys_wait+0x78>
                    waitee=p;
  808e28:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808e2c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808e30:	e9 10 01 00 00       	jmp    808f45 <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808e35:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808e39:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e3d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808e41:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808e46:	75 c8                	jne    808e10 <sys_wait+0x53>
  808e48:	eb b2                	jmp    808dfc <sys_wait+0x3f>
                }
            }
        }

    }else if(pid==0) {
  808e4a:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808e4e:	75 63                	jne    808eb3 <sys_wait+0xf6>
        //等待任意一个和父进程同一个进程组的子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808e50:	48 8b 05 e9 c3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c3e9]        # 415240 <current>
  808e57:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808e5e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808e62:	eb 46                	jmp    808eaa <sys_wait+0xed>
                struct process* p=l->data;
  808e64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e68:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808e6c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if(p->gpid==current->gpid&& p->stat == TASK_ZOMBIE) {
  808e70:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e74:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
  808e77:	48 8b 05 c2 c3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c3c2]        # 415240 <current>
  808e7e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e81:	39 c2                	cmp    edx,eax
  808e83:	75 19                	jne    808e9e <sys_wait+0xe1>
  808e85:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e89:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808e8c:	83 f8 04             	cmp    eax,0x4
  808e8f:	75 0d                	jne    808e9e <sys_wait+0xe1>
                    waitee=p;
  808e91:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e95:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808e99:	e9 a7 00 00 00       	jmp    808f45 <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808e9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ea2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ea6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808eaa:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  808eaf:	75 b3                	jne    808e64 <sys_wait+0xa7>
  808eb1:	eb 9d                	jmp    808e50 <sys_wait+0x93>
                }
            }
        }
    }else{
        if(pid<0)pid=-pid;
  808eb3:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808eb7:	79 03                	jns    808ebc <sys_wait+0xff>
  808eb9:	f7 5d bc             	neg    DWORD PTR [rbp-0x44]
        //检查是不是本进程的子进程
        for(int i=0;i<MAX_TASKS;i++){
  808ebc:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808ec3:	eb 37                	jmp    808efc <sys_wait+0x13f>
            if(task[i].pid==pid){
  808ec5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808ec8:	48 98                	cdqe   
  808eca:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808ed1:	48 05 40 85 40 00    	add    rax,0x408540
  808ed7:	8b 10                	mov    edx,DWORD PTR [rax]
  808ed9:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808edc:	39 c2                	cmp    edx,eax
  808ede:	75 18                	jne    808ef8 <sys_wait+0x13b>
                waitee=&task[i];
  808ee0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808ee3:	48 98                	cdqe   
  808ee5:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808eec:	48 05 40 85 40 00    	add    rax,0x408540
  808ef2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                break;
  808ef6:	eb 0a                	jmp    808f02 <sys_wait+0x145>
        for(int i=0;i<MAX_TASKS;i++){
  808ef8:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  808efc:	83 7d e4 1f          	cmp    DWORD PTR [rbp-0x1c],0x1f
  808f00:	7e c3                	jle    808ec5 <sys_wait+0x108>
            }
        }
        if(waitee==NULL||waitee->parent_pid!=current->pid)
  808f02:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808f07:	74 17                	je     808f20 <sys_wait+0x163>
  808f09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f0d:	8b 90 9c 00 00 00    	mov    edx,DWORD PTR [rax+0x9c]
  808f13:	48 8b 05 26 c3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c326]        # 415240 <current>
  808f1a:	8b 00                	mov    eax,DWORD PTR [rax]
  808f1c:	39 c2                	cmp    edx,eax
  808f1e:	74 09                	je     808f29 <sys_wait+0x16c>
            return -ECHILD;//没有这个进程或者不是子进程
  808f20:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808f27:	eb 7c                	jmp    808fa5 <sys_wait+0x1e8>
        //TODO 等待结束以及等待信号
        while (waitee->stat != TASK_ZOMBIE);
  808f29:	90                   	nop
  808f2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f2e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f31:	83 f8 04             	cmp    eax,0x4
  808f34:	75 f4                	jne    808f2a <sys_wait+0x16d>
        *stat_loc=waitee->exit_code;
  808f36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f3a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808f3d:	89 c2                	mov    edx,eax
  808f3f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808f43:	89 10                	mov    DWORD PTR [rax],edx
    }
    done:
    //清除子进程
    waitee->stat=TASK_EMPTY;
  808f45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f49:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
    //从链表中删除，不再是子进程
    list_drop(&waitee->node);
  808f50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f54:	48 05 14 03 00 00    	add    rax,0x314
  808f5a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    }
}
__attribute__((always_inline)) inline void list_drop(struct List * entry)
{
    //从链表中删除
    if(entry->prev)
  808f5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f62:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f65:	48 85 c0             	test   rax,rax
  808f68:	74 13                	je     808f7d <sys_wait+0x1c0>
        entry->prev->next=entry->next;
  808f6a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f6e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f71:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f75:	48 8b 52 10          	mov    rdx,QWORD PTR [rdx+0x10]
  808f79:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    if(entry->next)
  808f7d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f81:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f85:	48 85 c0             	test   rax,rax
  808f88:	74 12                	je     808f9c <sys_wait+0x1df>
        entry->next->prev=entry->prev;
  808f8a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f8e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f92:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f96:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  808f99:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  808f9c:	90                   	nop
    //TODO 被信号中断时返回-1
    return waitee->pid;
  808f9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fa1:	8b 00                	mov    eax,DWORD PTR [rax]
  808fa3:	89 c0                	mov    eax,eax
}
  808fa5:	5d                   	pop    rbp
  808fa6:	c3                   	ret    

0000000000808fa7 <sys_wait4>:
unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  808fa7:	f3 0f 1e fa          	endbr64 
  808fab:	55                   	push   rbp
  808fac:	48 89 e5             	mov    rbp,rsp
  808faf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808fb3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808fb7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808fba:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  808fbe:	90                   	nop
  808fbf:	5d                   	pop    rbp
  808fc0:	c3                   	ret    

0000000000808fc1 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  808fc1:	f3 0f 1e fa          	endbr64 
  808fc5:	55                   	push   rbp
  808fc6:	48 89 e5             	mov    rbp,rsp
  808fc9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  808fcd:	90                   	nop
  808fce:	5d                   	pop    rbp
  808fcf:	c3                   	ret    

0000000000808fd0 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  808fd0:	f3 0f 1e fa          	endbr64 
  808fd4:	55                   	push   rbp
  808fd5:	48 89 e5             	mov    rbp,rsp
  808fd8:	48 83 ec 10          	sub    rsp,0x10
  808fdc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808fe0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  808fe4:	bf 43 57 81 00       	mov    edi,0x815743
  808fe9:	b8 00 00 00 00       	mov    eax,0x0
  808fee:	e8 84 7d ff ff       	call   800d77 <printf>
    switch(cmd)
  808ff3:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808ff8:	74 09                	je     809003 <sys_reboot+0x33>
  808ffa:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  808fff:	74 13                	je     809014 <sys_reboot+0x44>
  809001:	eb 22                	jmp    809025 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  809003:	be fe 00 00 00       	mov    esi,0xfe
  809008:	bf 64 00 00 00       	mov    edi,0x64
  80900d:	e8 1e d8 ff ff       	call   806830 <outb>
            break;
  809012:	eb 21                	jmp    809035 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  809014:	bf 50 57 81 00       	mov    edi,0x815750
  809019:	b8 00 00 00 00       	mov    eax,0x0
  80901e:	e8 54 7d ff ff       	call   800d77 <printf>
            break;
  809023:	eb 10                	jmp    809035 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  809025:	bf 70 57 81 00       	mov    edi,0x815770
  80902a:	b8 00 00 00 00       	mov    eax,0x0
  80902f:	e8 43 7d ff ff       	call   800d77 <printf>
            break;
  809034:	90                   	nop
    }
    return 0;
  809035:	b8 00 00 00 00       	mov    eax,0x0
}
  80903a:	c9                   	leave  
  80903b:	c3                   	ret    

000000000080903c <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  80903c:	f3 0f 1e fa          	endbr64 
  809040:	55                   	push   rbp
  809041:	48 89 e5             	mov    rbp,rsp
  809044:	48 83 ec 30          	sub    rsp,0x30
  809048:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  80904c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809053:	00 
    long pathlen = 0;
  809054:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80905b:	00 
    struct dir_entry * dentry = NULL;
  80905c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809063:	00 

    printf("sys_chdir\n");
  809064:	bf 87 57 81 00       	mov    edi,0x815787
  809069:	b8 00 00 00 00       	mov    eax,0x0
  80906e:	e8 04 7d ff ff       	call   800d77 <printf>
    path = (char *)vmalloc();
  809073:	b8 00 00 00 00       	mov    eax,0x0
  809078:	e8 d0 81 ff ff       	call   80124d <vmalloc>
  80907d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  809081:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809086:	75 0c                	jne    809094 <sys_chdir+0x58>
        return -ENOMEM;
  809088:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80908f:	e9 ca 00 00 00       	jmp    80915e <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  809094:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809098:	ba 00 10 00 00       	mov    edx,0x1000
  80909d:	be 00 00 00 00       	mov    esi,0x0
  8090a2:	48 89 c7             	mov    rdi,rax
  8090a5:	e8 6f 3f 00 00       	call   80d019 <memset>
    pathlen = strlen(filename);
  8090aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8090ae:	48 89 c7             	mov    rdi,rax
  8090b1:	e8 d1 41 00 00       	call   80d287 <strlen>
  8090b6:	48 98                	cdqe   
  8090b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8090bc:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8090c1:	7f 18                	jg     8090db <sys_chdir+0x9f>
    {
        vmfree(path);
  8090c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090c7:	48 89 c7             	mov    rdi,rax
  8090ca:	e8 1e 82 ff ff       	call   8012ed <vmfree>
        return -EFAULT;
  8090cf:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8090d6:	e9 83 00 00 00       	jmp    80915e <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8090db:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  8090e2:	00 
  8090e3:	7e 15                	jle    8090fa <sys_chdir+0xbe>
    {
        vmfree(path);
  8090e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090e9:	48 89 c7             	mov    rdi,rax
  8090ec:	e8 fc 81 ff ff       	call   8012ed <vmfree>
        return -ENAMETOOLONG;
  8090f1:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8090f8:	eb 64                	jmp    80915e <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8090fa:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8090fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809102:	48 89 d6             	mov    rsi,rdx
  809105:	48 89 c7             	mov    rdi,rax
  809108:	e8 5b 3f 00 00       	call   80d068 <strcpy>

    dentry = path_walk(path,0);
  80910d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809111:	be 00 00 00 00       	mov    esi,0x0
  809116:	48 89 c7             	mov    rdi,rax
  809119:	e8 16 ed ff ff       	call   807e34 <path_walk>
  80911e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  809122:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809126:	48 89 c7             	mov    rdi,rax
  809129:	e8 bf 81 ff ff       	call   8012ed <vmfree>

    if(dentry == NULL)
  80912e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  809133:	75 09                	jne    80913e <sys_chdir+0x102>
        return -ENOENT;
  809135:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  80913c:	eb 20                	jmp    80915e <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  80913e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809142:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  809146:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80914a:	48 83 f8 02          	cmp    rax,0x2
  80914e:	74 09                	je     809159 <sys_chdir+0x11d>
        return -ENOTDIR;
  809150:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  809157:	eb 05                	jmp    80915e <sys_chdir+0x122>
    return 0;
  809159:	b8 00 00 00 00       	mov    eax,0x0
}
  80915e:	c9                   	leave  
  80915f:	c3                   	ret    

0000000000809160 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  809160:	f3 0f 1e fa          	endbr64 
  809164:	55                   	push   rbp
  809165:	48 89 e5             	mov    rbp,rsp
  809168:	48 83 ec 30          	sub    rsp,0x30
  80916c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80916f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809173:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  809177:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80917e:	00 
    unsigned long ret = 0;
  80917f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809186:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  809187:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80918b:	78 06                	js     809193 <sys_getdents+0x33>
  80918d:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  809191:	7e 09                	jle    80919c <sys_getdents+0x3c>
        return -EBADF;
  809193:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80919a:	eb 72                	jmp    80920e <sys_getdents+0xae>
    if(count < 0)
  80919c:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8091a1:	79 09                	jns    8091ac <sys_getdents+0x4c>
        return -EINVAL;
  8091a3:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8091aa:	eb 62                	jmp    80920e <sys_getdents+0xae>

    filp = current->openf[fd];
  8091ac:	48 8b 05 8d c0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c08d]        # 415240 <current>
  8091b3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8091b6:	48 63 d2             	movsxd rdx,edx
  8091b9:	48 83 c2 1a          	add    rdx,0x1a
  8091bd:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8091c2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  8091c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8091ca:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091ce:	48 85 c0             	test   rax,rax
  8091d1:	74 37                	je     80920a <sys_getdents+0xaa>
  8091d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8091d7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091db:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091df:	48 85 c0             	test   rax,rax
  8091e2:	74 26                	je     80920a <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8091e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8091e8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091ec:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8091f0:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8091f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8091f8:	ba 27 81 80 00       	mov    edx,0x808127
  8091fd:	48 89 ce             	mov    rsi,rcx
  809200:	48 89 c7             	mov    rdi,rax
  809203:	41 ff d0             	call   r8
  809206:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80920a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80920e:	c9                   	leave  
  80920f:	c3                   	ret    

0000000000809210 <init64>:
  809210:	b8 00 80 ff ff       	mov    eax,0xffff8000
  809215:	48 c1 e0 20          	shl    rax,0x20
  809219:	48 01 c4             	add    rsp,rax
  80921c:	48 01 c5             	add    rbp,rax
  80921f:	48 05 73 08 80 00    	add    rax,0x800873
  809225:	50                   	push   rax
  809226:	c3                   	ret    

0000000000809227 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  809227:	f3 0f 1e fa          	endbr64 
  80922b:	55                   	push   rbp
  80922c:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  80922f:	0f b6 05 37 f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f337]        # 42856d <k_shift>
  809236:	84 c0                	test   al,al
  809238:	0f 94 c0             	sete   al
  80923b:	88 05 2c f3 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f32c],al        # 42856d <k_shift>
}
  809241:	90                   	nop
  809242:	5d                   	pop    rbp
  809243:	c3                   	ret    

0000000000809244 <ctrl>:
void ctrl()
{
  809244:	f3 0f 1e fa          	endbr64 
  809248:	55                   	push   rbp
  809249:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  80924c:	0f b6 05 1b f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f31b]        # 42856e <k_ctrl>
  809253:	84 c0                	test   al,al
  809255:	0f 94 c0             	sete   al
  809258:	88 05 10 f3 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f310],al        # 42856e <k_ctrl>
}
  80925e:	90                   	nop
  80925f:	5d                   	pop    rbp
  809260:	c3                   	ret    

0000000000809261 <capslock>:
void capslock()
{
  809261:	f3 0f 1e fa          	endbr64 
  809265:	55                   	push   rbp
  809266:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  809269:	0f b6 05 ff f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f2ff]        # 42856f <k_capslock>
  809270:	84 c0                	test   al,al
  809272:	0f 94 c0             	sete   al
  809275:	88 05 f4 f2 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f2f4],al        # 42856f <k_capslock>
}
  80927b:	90                   	nop
  80927c:	5d                   	pop    rbp
  80927d:	c3                   	ret    

000000000080927e <to_ascii>:
char to_ascii(char scan_code)
{
  80927e:	f3 0f 1e fa          	endbr64 
  809282:	55                   	push   rbp
  809283:	48 89 e5             	mov    rbp,rsp
  809286:	89 f8                	mov    eax,edi
  809288:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80928b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809292:	e9 c7 00 00 00       	jmp    80935e <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  809297:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80929a:	48 63 d0             	movsxd rdx,eax
  80929d:	48 89 d0             	mov    rax,rdx
  8092a0:	48 c1 e0 02          	shl    rax,0x2
  8092a4:	48 01 d0             	add    rax,rdx
  8092a7:	48 05 02 59 81 00    	add    rax,0x815902
  8092ad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092b0:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8092b3:	0f 85 a1 00 00 00    	jne    80935a <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  8092b9:	0f b6 05 af f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f2af]        # 42856f <k_capslock>
  8092c0:	84 c0                	test   al,al
  8092c2:	74 55                	je     809319 <to_ascii+0x9b>
  8092c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092c7:	48 63 d0             	movsxd rdx,eax
  8092ca:	48 89 d0             	mov    rax,rdx
  8092cd:	48 c1 e0 02          	shl    rax,0x2
  8092d1:	48 01 d0             	add    rax,rdx
  8092d4:	48 05 00 59 81 00    	add    rax,0x815900
  8092da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092dd:	3c 60                	cmp    al,0x60
  8092df:	7e 38                	jle    809319 <to_ascii+0x9b>
  8092e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092e4:	48 63 d0             	movsxd rdx,eax
  8092e7:	48 89 d0             	mov    rax,rdx
  8092ea:	48 c1 e0 02          	shl    rax,0x2
  8092ee:	48 01 d0             	add    rax,rdx
  8092f1:	48 05 00 59 81 00    	add    rax,0x815900
  8092f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092fa:	3c 7a                	cmp    al,0x7a
  8092fc:	7f 1b                	jg     809319 <to_ascii+0x9b>
  8092fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809301:	48 63 d0             	movsxd rdx,eax
  809304:	48 89 d0             	mov    rax,rdx
  809307:	48 c1 e0 02          	shl    rax,0x2
  80930b:	48 01 d0             	add    rax,rdx
  80930e:	48 05 01 59 81 00    	add    rax,0x815901
  809314:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809317:	eb 54                	jmp    80936d <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  809319:	0f b6 05 4d f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f24d]        # 42856d <k_shift>
  809320:	84 c0                	test   al,al
  809322:	74 1b                	je     80933f <to_ascii+0xc1>
  809324:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809327:	48 63 d0             	movsxd rdx,eax
  80932a:	48 89 d0             	mov    rax,rdx
  80932d:	48 c1 e0 02          	shl    rax,0x2
  809331:	48 01 d0             	add    rax,rdx
  809334:	48 05 01 59 81 00    	add    rax,0x815901
  80933a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80933d:	eb 2e                	jmp    80936d <to_ascii+0xef>
            else return key_map[i].ascii;
  80933f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809342:	48 63 d0             	movsxd rdx,eax
  809345:	48 89 d0             	mov    rax,rdx
  809348:	48 c1 e0 02          	shl    rax,0x2
  80934c:	48 01 d0             	add    rax,rdx
  80934f:	48 05 00 59 81 00    	add    rax,0x815900
  809355:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809358:	eb 13                	jmp    80936d <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80935a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80935e:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  809362:	0f 8e 2f ff ff ff    	jle    809297 <to_ascii+0x19>
        }

    return '\0';
  809368:	b8 00 00 00 00       	mov    eax,0x0
}
  80936d:	5d                   	pop    rbp
  80936e:	c3                   	ret    

000000000080936f <init_kb>:
int init_kb()
{
  80936f:	f3 0f 1e fa          	endbr64 
  809373:	55                   	push   rbp
  809374:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  809377:	bf 40 58 81 00       	mov    edi,0x815840
  80937c:	e8 e2 9c ff ff       	call   803063 <reg_device>
    reg_driver(&drv_keyboard);
  809381:	bf a0 57 81 00       	mov    edi,0x8157a0
  809386:	e8 c0 9f ff ff       	call   80334b <reg_driver>
}
  80938b:	90                   	nop
  80938c:	5d                   	pop    rbp
  80938d:	c3                   	ret    

000000000080938e <key_proc>:
int key_proc()
{
  80938e:	f3 0f 1e fa          	endbr64 
  809392:	55                   	push   rbp
  809393:	48 89 e5             	mov    rbp,rsp
  809396:	48 83 ec 20          	sub    rsp,0x20
    asm volatile("cli");
  80939a:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  80939b:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  80939f:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8093a3:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8093a7:	bf 60 00 00 00       	mov    edi,0x60
  8093ac:	e8 98 d4 ff ff       	call   806849 <inb>
  8093b1:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8093b4:	8b 05 32 47 00 00    	mov    eax,DWORD PTR [rip+0x4732]        # 80daec <key_bufq+0xc>
  8093ba:	83 c0 01             	add    eax,0x1
  8093bd:	8b 0d 2d 47 00 00    	mov    ecx,DWORD PTR [rip+0x472d]        # 80daf0 <key_bufq+0x10>
  8093c3:	99                   	cdq    
  8093c4:	f7 f9                	idiv   ecx
  8093c6:	8b 05 1c 47 00 00    	mov    eax,DWORD PTR [rip+0x471c]        # 80dae8 <key_bufq+0x8>
  8093cc:	39 c2                	cmp    edx,eax
  8093ce:	74 32                	je     809402 <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8093d0:	48 8b 15 09 47 00 00 	mov    rdx,QWORD PTR [rip+0x4709]        # 80dae0 <key_bufq>
  8093d7:	8b 05 0f 47 00 00    	mov    eax,DWORD PTR [rip+0x470f]        # 80daec <key_bufq+0xc>
  8093dd:	48 98                	cdqe   
  8093df:	48 01 c2             	add    rdx,rax
  8093e2:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8093e6:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8093e8:	8b 05 fe 46 00 00    	mov    eax,DWORD PTR [rip+0x46fe]        # 80daec <key_bufq+0xc>
  8093ee:	83 c0 01             	add    eax,0x1
  8093f1:	8b 0d f9 46 00 00    	mov    ecx,DWORD PTR [rip+0x46f9]        # 80daf0 <key_bufq+0x10>
  8093f7:	99                   	cdq    
  8093f8:	f7 f9                	idiv   ecx
  8093fa:	89 d0                	mov    eax,edx
  8093fc:	89 05 ea 46 00 00    	mov    DWORD PTR [rip+0x46ea],eax        # 80daec <key_bufq+0xc>
    }

    if(scan1==0x48)
  809402:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  809406:	75 0a                	jne    809412 <key_proc+0x84>
        scr_up();
  809408:	b8 00 00 00 00       	mov    eax,0x0
  80940d:	e8 ad e6 ff ff       	call   807abf <scr_up>
    if(scan1==0x50)
  809412:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  809416:	75 0a                	jne    809422 <key_proc+0x94>
        scr_down();
  809418:	b8 00 00 00 00       	mov    eax,0x0
  80941d:	e8 3f e7 ff ff       	call   807b61 <scr_down>
    switch (scan1)
  809422:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809426:	3d b6 00 00 00       	cmp    eax,0xb6
  80942b:	74 41                	je     80946e <key_proc+0xe0>
  80942d:	3d b6 00 00 00       	cmp    eax,0xb6
  809432:	7f 5e                	jg     809492 <key_proc+0x104>
  809434:	3d aa 00 00 00       	cmp    eax,0xaa
  809439:	74 33                	je     80946e <key_proc+0xe0>
  80943b:	3d aa 00 00 00       	cmp    eax,0xaa
  809440:	7f 50                	jg     809492 <key_proc+0x104>
  809442:	3d 9d 00 00 00       	cmp    eax,0x9d
  809447:	74 31                	je     80947a <key_proc+0xec>
  809449:	3d 9d 00 00 00       	cmp    eax,0x9d
  80944e:	7f 42                	jg     809492 <key_proc+0x104>
  809450:	83 f8 3a             	cmp    eax,0x3a
  809453:	74 31                	je     809486 <key_proc+0xf8>
  809455:	83 f8 3a             	cmp    eax,0x3a
  809458:	7f 38                	jg     809492 <key_proc+0x104>
  80945a:	83 f8 36             	cmp    eax,0x36
  80945d:	74 0f                	je     80946e <key_proc+0xe0>
  80945f:	83 f8 36             	cmp    eax,0x36
  809462:	7f 2e                	jg     809492 <key_proc+0x104>
  809464:	83 f8 1d             	cmp    eax,0x1d
  809467:	74 11                	je     80947a <key_proc+0xec>
  809469:	83 f8 2a             	cmp    eax,0x2a
  80946c:	75 24                	jne    809492 <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  80946e:	b8 00 00 00 00       	mov    eax,0x0
  809473:	e8 af fd ff ff       	call   809227 <shift>
            break;
  809478:	eb 19                	jmp    809493 <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  80947a:	b8 00 00 00 00       	mov    eax,0x0
  80947f:	e8 c0 fd ff ff       	call   809244 <ctrl>
            break;
  809484:	eb 0d                	jmp    809493 <key_proc+0x105>
        case 0x3a:
            capslock();
  809486:	b8 00 00 00 00       	mov    eax,0x0
  80948b:	e8 d1 fd ff ff       	call   809261 <capslock>
            break;
  809490:	eb 01                	jmp    809493 <key_proc+0x105>
        default:
            break;
  809492:	90                   	nop
    }
    //发送到std
    if(!(scan1&FLAG_BREAK)){
  809493:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809497:	84 c0                	test   al,al
  809499:	78 37                	js     8094d2 <key_proc+0x144>
        char ch= to_ascii(scan1);
  80949b:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80949f:	0f be c0             	movsx  eax,al
  8094a2:	89 c7                	mov    edi,eax
  8094a4:	e8 d5 fd ff ff       	call   80927e <to_ascii>
  8094a9:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        unsigned long args[]={(unsigned long) &ch, 1};
  8094ac:	48 8d 45 f7          	lea    rax,[rbp-0x9]
  8094b0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  8094b4:	48 c7 45 e8 01 00 00 	mov    QWORD PTR [rbp-0x18],0x1
  8094bb:	00 
        //写入stdin
        sys_ioctl(0,TTY_WSTDIN,(unsigned long)args);
  8094bc:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  8094c0:	48 89 c2             	mov    rdx,rax
  8094c3:	be 03 00 00 00       	mov    esi,0x3
  8094c8:	bf 00 00 00 00       	mov    edi,0x0
  8094cd:	e8 d4 d2 ff ff       	call   8067a6 <sys_ioctl>
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8094d2:	b8 00 00 00 00       	mov    eax,0x0
  8094d7:	e8 82 d3 ff ff       	call   80685e <eoi>
    asm volatile("leave\r\n iretq");
  8094dc:	c9                   	leave  
  8094dd:	48 cf                	iretq  
}
  8094df:	90                   	nop
  8094e0:	c9                   	leave  
  8094e1:	c3                   	ret    

00000000008094e2 <sys_analyse_key>:

char sys_analyse_key()
{
  8094e2:	f3 0f 1e fa          	endbr64 
  8094e6:	55                   	push   rbp
  8094e7:	48 89 e5             	mov    rbp,rsp
  8094ea:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  8094ee:	8b 15 f8 45 00 00    	mov    edx,DWORD PTR [rip+0x45f8]        # 80daec <key_bufq+0xc>
  8094f4:	8b 05 ee 45 00 00    	mov    eax,DWORD PTR [rip+0x45ee]        # 80dae8 <key_bufq+0x8>
  8094fa:	39 c2                	cmp    edx,eax
  8094fc:	75 0a                	jne    809508 <sys_analyse_key+0x26>
  8094fe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809503:	e9 df 00 00 00       	jmp    8095e7 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  809508:	8b 05 da 45 00 00    	mov    eax,DWORD PTR [rip+0x45da]        # 80dae8 <key_bufq+0x8>
  80950e:	48 98                	cdqe   
  809510:	0f b6 80 60 83 42 00 	movzx  eax,BYTE PTR [rax+0x428360]
  809517:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  80951a:	8b 05 c8 45 00 00    	mov    eax,DWORD PTR [rip+0x45c8]        # 80dae8 <key_bufq+0x8>
  809520:	83 c0 01             	add    eax,0x1
  809523:	8b 0d c7 45 00 00    	mov    ecx,DWORD PTR [rip+0x45c7]        # 80daf0 <key_bufq+0x10>
  809529:	99                   	cdq    
  80952a:	f7 f9                	idiv   ecx
  80952c:	89 d0                	mov    eax,edx
  80952e:	89 05 b4 45 00 00    	mov    DWORD PTR [rip+0x45b4],eax        # 80dae8 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  809534:	bf d6 5a 81 00       	mov    edi,0x815ad6
  809539:	b8 00 00 00 00       	mov    eax,0x0
  80953e:	e8 34 78 ff ff       	call   800d77 <printf>
    char res[33]={0};
  809543:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80954a:	00 
  80954b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809552:	00 
  809553:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80955a:	00 
  80955b:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809562:	00 
  809563:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  809567:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  80956b:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80956f:	be 10 00 00 00       	mov    esi,0x10
  809574:	48 89 c7             	mov    rdi,rax
  809577:	e8 bc 76 ff ff       	call   800c38 <itoa>
    printf(res);
  80957c:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  809580:	48 89 c7             	mov    rdi,rax
  809583:	b8 00 00 00 00       	mov    eax,0x0
  809588:	e8 ea 77 ff ff       	call   800d77 <printf>
    if(c&FLAG_BREAK){
  80958d:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809591:	79 16                	jns    8095a9 <sys_analyse_key+0xc7>
        printf("\n");
  809593:	bf e1 5a 81 00       	mov    edi,0x815ae1
  809598:	b8 00 00 00 00       	mov    eax,0x0
  80959d:	e8 d5 77 ff ff       	call   800d77 <printf>
        return -1;
  8095a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8095a7:	eb 3e                	jmp    8095e7 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  8095a9:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8095ad:	83 e0 7f             	and    eax,0x7f
  8095b0:	89 c7                	mov    edi,eax
  8095b2:	e8 c7 fc ff ff       	call   80927e <to_ascii>
  8095b7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  8095ba:	bf e3 5a 81 00       	mov    edi,0x815ae3
  8095bf:	b8 00 00 00 00       	mov    eax,0x0
  8095c4:	e8 ae 77 ff ff       	call   800d77 <printf>
    putchar(c);
  8095c9:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8095cd:	89 c7                	mov    edi,eax
  8095cf:	e8 79 77 ff ff       	call   800d4d <putchar>
    printf("\n");
  8095d4:	bf e1 5a 81 00       	mov    edi,0x815ae1
  8095d9:	b8 00 00 00 00       	mov    eax,0x0
  8095de:	e8 94 77 ff ff       	call   800d77 <printf>
    return c;
  8095e3:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8095e7:	c9                   	leave  
  8095e8:	c3                   	ret    

00000000008095e9 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8095e9:	f3 0f 1e fa          	endbr64 
  8095ed:	55                   	push   rbp
  8095ee:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8095f1:	b8 00 00 00 00       	mov    eax,0x0
  8095f6:	e8 c4 09 00 00       	call   809fbf <hd_iterate>
    return 0;
  8095fb:	b8 00 00 00 00       	mov    eax,0x0
}
  809600:	5d                   	pop    rbp
  809601:	c3                   	ret    

0000000000809602 <disk_int_handler_c>:

int disk_int_handler_c()
{
  809602:	f3 0f 1e fa          	endbr64 
  809606:	55                   	push   rbp
  809607:	48 89 e5             	mov    rbp,rsp
  80960a:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  80960e:	48 8b 05 ab 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cab]        # 42b2c0 <running_req>
  809615:	48 85 c0             	test   rax,rax
  809618:	75 0a                	jne    809624 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80961a:	b8 01 00 00 00       	mov    eax,0x1
  80961f:	e9 bf 01 00 00       	jmp    8097e3 <disk_int_handler_c+0x1e1>
    }
    short *p=running_req->buf;
  809624:	48 8b 05 95 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c95]        # 42b2c0 <running_req>
  80962b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80962f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  809633:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80963a:	48 8b 05 7f 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c7f]        # 42b2c0 <running_req>
  809641:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809644:	83 f8 02             	cmp    eax,0x2
  809647:	74 0f                	je     809658 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  809649:	48 8b 05 70 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c70]        # 42b2c0 <running_req>
  809650:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  809653:	83 f8 03             	cmp    eax,0x3
  809656:	75 07                	jne    80965f <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  809658:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80965f:	48 8b 05 5a 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c5a]        # 42b2c0 <running_req>
  809666:	8b 00                	mov    eax,DWORD PTR [rax]
  809668:	85 c0                	test   eax,eax
  80966a:	75 50                	jne    8096bc <disk_int_handler_c+0xba>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  80966c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809673:	eb 22                	jmp    809697 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  809675:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809678:	0f b7 c0             	movzx  eax,ax
  80967b:	89 c7                	mov    edi,eax
  80967d:	e8 d1 d1 ff ff       	call   806853 <inw>
  809682:	89 c2                	mov    edx,eax
  809684:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809688:	48 8d 48 02          	lea    rcx,[rax+0x2]
  80968c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809690:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  809693:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809697:	48 8b 05 22 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c22]        # 42b2c0 <running_req>
  80969e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8096a1:	c1 e0 08             	shl    eax,0x8
  8096a4:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8096a7:	7c cc                	jl     809675 <disk_int_handler_c+0x73>
        }
        running_req->result=DISK_CHK_OK;
  8096a9:	48 8b 05 10 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c10]        # 42b2c0 <running_req>
  8096b0:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8096b7:	e9 d8 00 00 00       	jmp    809794 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_WRITE)
  8096bc:	48 8b 05 fd 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21bfd]        # 42b2c0 <running_req>
  8096c3:	8b 00                	mov    eax,DWORD PTR [rax]
  8096c5:	83 f8 01             	cmp    eax,0x1
  8096c8:	75 50                	jne    80971a <disk_int_handler_c+0x118>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8096ca:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8096d1:	eb 25                	jmp    8096f8 <disk_int_handler_c+0xf6>
            outw(port,*p++);
  8096d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096d7:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8096db:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8096df:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8096e2:	0f b7 d0             	movzx  edx,ax
  8096e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8096e8:	0f b7 c0             	movzx  eax,ax
  8096eb:	89 d6                	mov    esi,edx
  8096ed:	89 c7                	mov    edi,eax
  8096ef:	e8 49 d1 ff ff       	call   80683d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8096f4:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8096f8:	48 8b 05 c1 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21bc1]        # 42b2c0 <running_req>
  8096ff:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809702:	c1 e0 08             	shl    eax,0x8
  809705:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  809708:	7c c9                	jl     8096d3 <disk_int_handler_c+0xd1>
        running_req->result=DISK_CHK_OK;
  80970a:	48 8b 05 af 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21baf]        # 42b2c0 <running_req>
  809711:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  809718:	eb 7a                	jmp    809794 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_CHECK)
  80971a:	48 8b 05 9f 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b9f]        # 42b2c0 <running_req>
  809721:	8b 00                	mov    eax,DWORD PTR [rax]
  809723:	83 f8 02             	cmp    eax,0x2
  809726:	75 34                	jne    80975c <disk_int_handler_c+0x15a>
    {
        char stat=inb(port+7);
  809728:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80972b:	83 c0 07             	add    eax,0x7
  80972e:	0f b6 c0             	movzx  eax,al
  809731:	89 c7                	mov    edi,eax
  809733:	e8 11 d1 ff ff       	call   806849 <inb>
  809738:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  80973b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80973e:	0f b7 c0             	movzx  eax,ax
  809741:	89 c7                	mov    edi,eax
  809743:	e8 0b d1 ff ff       	call   806853 <inw>
  809748:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  80974c:	48 8b 05 6d 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b6d]        # 42b2c0 <running_req>
  809753:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  80975a:	eb 38                	jmp    809794 <disk_int_handler_c+0x192>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  80975c:	48 8b 05 5d 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b5d]        # 42b2c0 <running_req>
  809763:	8b 00                	mov    eax,DWORD PTR [rax]
  809765:	83 f8 03             	cmp    eax,0x3
  809768:	75 2a                	jne    809794 <disk_int_handler_c+0x192>
    {
        int stat=inb(port+7);
  80976a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80976d:	83 c0 07             	add    eax,0x7
  809770:	0f b6 c0             	movzx  eax,al
  809773:	89 c7                	mov    edi,eax
  809775:	e8 cf d0 ff ff       	call   806849 <inb>
  80977a:	0f b6 c0             	movzx  eax,al
  80977d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  809780:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809783:	89 c6                	mov    esi,eax
  809785:	bf ea 5a 81 00       	mov    edi,0x815aea
  80978a:	b8 00 00 00 00       	mov    eax,0x0
  80978f:	e8 e3 75 ff ff       	call   800d77 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  809794:	48 8b 05 25 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b25]        # 42b2c0 <running_req>
  80979b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8097a2:	48 8b 05 17 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b17]        # 42b2c0 <running_req>
  8097a9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8097ad:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8097b4:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8097b7:	48 8b 05 0a 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b0a]        # 42b2c8 <running_devman_req>
  8097be:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8097c5:	00 00 00 
    running_devman_req=NULL;
  8097c8:	48 c7 05 f5 1a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21af5],0x0        # 42b2c8 <running_devman_req>
  8097cf:	00 00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  8097d3:	48 c7 05 e2 1a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ae2],0x0        # 42b2c0 <running_req>
  8097da:	00 00 00 00 
    return 0;
  8097de:	b8 00 00 00 00       	mov    eax,0x0
}
  8097e3:	c9                   	leave  
  8097e4:	c3                   	ret    

00000000008097e5 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8097e5:	f3 0f 1e fa          	endbr64 
  8097e9:	55                   	push   rbp
  8097ea:	48 89 e5             	mov    rbp,rsp
  8097ed:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8097f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8097f3:	48 63 d0             	movsxd rdx,eax
  8097f6:	48 89 d0             	mov    rax,rdx
  8097f9:	48 01 c0             	add    rax,rax
  8097fc:	48 01 d0             	add    rax,rdx
  8097ff:	48 c1 e0 04          	shl    rax,0x4
  809803:	48 05 dc 85 42 00    	add    rax,0x4285dc
  809809:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80980b:	5d                   	pop    rbp
  80980c:	c3                   	ret    

000000000080980d <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80980d:	f3 0f 1e fa          	endbr64 
  809811:	55                   	push   rbp
  809812:	48 89 e5             	mov    rbp,rsp
  809815:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809818:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80981b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80981e:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  809821:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  809825:	8b 05 c9 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ac9]        # 42b2f4 <tail>
  80982b:	83 c0 01             	add    eax,0x1
  80982e:	48 63 d0             	movsxd rdx,eax
  809831:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  809838:	48 c1 ea 20          	shr    rdx,0x20
  80983c:	01 c2                	add    edx,eax
  80983e:	c1 fa 07             	sar    edx,0x7
  809841:	89 c1                	mov    ecx,eax
  809843:	c1 f9 1f             	sar    ecx,0x1f
  809846:	29 ca                	sub    edx,ecx
  809848:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80984e:	29 c8                	sub    eax,ecx
  809850:	89 c2                	mov    edx,eax
  809852:	8b 05 98 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a98]        # 42b2f0 <head>
  809858:	39 c2                	cmp    edx,eax
  80985a:	75 0a                	jne    809866 <request+0x59>
    {
        return -1;
  80985c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809861:	e9 0d 01 00 00       	jmp    809973 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  809866:	8b 05 88 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a88]        # 42b2f4 <tail>
  80986c:	48 63 d0             	movsxd rdx,eax
  80986f:	48 89 d0             	mov    rax,rdx
  809872:	48 01 c0             	add    rax,rax
  809875:	48 01 d0             	add    rax,rdx
  809878:	48 c1 e0 04          	shl    rax,0x4
  80987c:	48 8d 90 c4 85 42 00 	lea    rdx,[rax+0x4285c4]
  809883:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809886:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  809888:	8b 05 66 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a66]        # 42b2f4 <tail>
  80988e:	48 63 d0             	movsxd rdx,eax
  809891:	48 89 d0             	mov    rax,rdx
  809894:	48 01 c0             	add    rax,rax
  809897:	48 01 d0             	add    rax,rdx
  80989a:	48 c1 e0 04          	shl    rax,0x4
  80989e:	48 8d 90 c0 85 42 00 	lea    rdx,[rax+0x4285c0]
  8098a5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8098a8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8098aa:	8b 05 44 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a44]        # 42b2f4 <tail>
  8098b0:	48 63 d0             	movsxd rdx,eax
  8098b3:	48 89 d0             	mov    rax,rdx
  8098b6:	48 01 c0             	add    rax,rax
  8098b9:	48 01 d0             	add    rax,rdx
  8098bc:	48 c1 e0 04          	shl    rax,0x4
  8098c0:	48 8d 90 c8 85 42 00 	lea    rdx,[rax+0x4285c8]
  8098c7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8098ca:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8098cc:	8b 05 22 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a22]        # 42b2f4 <tail>
  8098d2:	48 63 d0             	movsxd rdx,eax
  8098d5:	48 89 d0             	mov    rax,rdx
  8098d8:	48 01 c0             	add    rax,rax
  8098db:	48 01 d0             	add    rax,rdx
  8098de:	48 c1 e0 04          	shl    rax,0x4
  8098e2:	48 8d 90 cc 85 42 00 	lea    rdx,[rax+0x4285cc]
  8098e9:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8098ec:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8098ee:	8b 05 00 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a00]        # 42b2f4 <tail>
  8098f4:	48 63 d0             	movsxd rdx,eax
  8098f7:	48 89 d0             	mov    rax,rdx
  8098fa:	48 01 c0             	add    rax,rax
  8098fd:	48 01 d0             	add    rax,rdx
  809900:	48 c1 e0 04          	shl    rax,0x4
  809904:	48 05 dc 85 42 00    	add    rax,0x4285dc
  80990a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  809910:	8b 05 de 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219de]        # 42b2f4 <tail>
  809916:	48 63 d0             	movsxd rdx,eax
  809919:	48 89 d0             	mov    rax,rdx
  80991c:	48 01 c0             	add    rax,rax
  80991f:	48 01 d0             	add    rax,rdx
  809922:	48 c1 e0 04          	shl    rax,0x4
  809926:	48 8d 90 d0 85 42 00 	lea    rdx,[rax+0x4285d0]
  80992d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809931:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  809934:	8b 05 ba 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219ba]        # 42b2f4 <tail>
  80993a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80993d:	8b 05 b1 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219b1]        # 42b2f4 <tail>
  809943:	8d 50 01             	lea    edx,[rax+0x1]
  809946:	48 63 c2             	movsxd rax,edx
  809949:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  809950:	48 c1 e8 20          	shr    rax,0x20
  809954:	01 d0                	add    eax,edx
  809956:	c1 f8 07             	sar    eax,0x7
  809959:	89 d1                	mov    ecx,edx
  80995b:	c1 f9 1f             	sar    ecx,0x1f
  80995e:	29 c8                	sub    eax,ecx
  809960:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  809966:	89 d0                	mov    eax,edx
  809968:	29 c8                	sub    eax,ecx
  80996a:	89 05 84 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21984],eax        # 42b2f4 <tail>
    return r;
  809970:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809973:	5d                   	pop    rbp
  809974:	c3                   	ret    

0000000000809975 <execute_request>:
int execute_request(){
  809975:	f3 0f 1e fa          	endbr64 
  809979:	55                   	push   rbp
  80997a:	48 89 e5             	mov    rbp,rsp
  80997d:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  809981:	48 8b 05 38 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21938]        # 42b2c0 <running_req>
  809988:	48 85 c0             	test   rax,rax
  80998b:	74 6a                	je     8099f7 <execute_request+0x82>
    {
        running_req->time++;
  80998d:	48 8b 05 2c 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2192c]        # 42b2c0 <running_req>
  809994:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  809997:	83 c2 01             	add    edx,0x1
  80999a:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80999d:	48 8b 05 1c 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2191c]        # 42b2c0 <running_req>
  8099a4:	8b 00                	mov    eax,DWORD PTR [rax]
  8099a6:	83 f8 02             	cmp    eax,0x2
  8099a9:	74 0a                	je     8099b5 <execute_request+0x40>
            return 2;
  8099ab:	b8 02 00 00 00       	mov    eax,0x2
  8099b0:	e9 b4 01 00 00       	jmp    809b69 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8099b5:	48 8b 05 04 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21904]        # 42b2c0 <running_req>
  8099bc:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8099bf:	83 f8 0a             	cmp    eax,0xa
  8099c2:	7e 29                	jle    8099ed <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  8099c4:	48 8b 05 f5 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218f5]        # 42b2c0 <running_req>
  8099cb:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8099d2:	48 8b 05 e7 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218e7]        # 42b2c0 <running_req>
  8099d9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8099e0:	48 c7 05 d5 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218d5],0x0        # 42b2c0 <running_req>
  8099e7:	00 00 00 00 
  8099eb:	eb 0a                	jmp    8099f7 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8099ed:	b8 02 00 00 00       	mov    eax,0x2
  8099f2:	e9 72 01 00 00       	jmp    809b69 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8099f7:	8b 15 f3 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218f3]        # 42b2f0 <head>
  8099fd:	8b 05 f1 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218f1]        # 42b2f4 <tail>
  809a03:	39 c2                	cmp    edx,eax
  809a05:	75 0a                	jne    809a11 <execute_request+0x9c>
  809a07:	b8 01 00 00 00       	mov    eax,0x1
  809a0c:	e9 58 01 00 00       	jmp    809b69 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  809a11:	8b 05 d9 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218d9]        # 42b2f0 <head>
  809a17:	48 63 d0             	movsxd rdx,eax
  809a1a:	48 89 d0             	mov    rax,rdx
  809a1d:	48 01 c0             	add    rax,rax
  809a20:	48 01 d0             	add    rax,rdx
  809a23:	48 c1 e0 04          	shl    rax,0x4
  809a27:	48 05 c0 85 42 00    	add    rax,0x4285c0
  809a2d:	48 89 05 8c 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2188c],rax        # 42b2c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  809a34:	8b 05 b6 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218b6]        # 42b2f0 <head>
  809a3a:	8d 50 01             	lea    edx,[rax+0x1]
  809a3d:	48 63 c2             	movsxd rax,edx
  809a40:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  809a47:	48 c1 e8 20          	shr    rax,0x20
  809a4b:	01 d0                	add    eax,edx
  809a4d:	c1 f8 07             	sar    eax,0x7
  809a50:	89 d1                	mov    ecx,edx
  809a52:	c1 f9 1f             	sar    ecx,0x1f
  809a55:	29 c8                	sub    eax,ecx
  809a57:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  809a5d:	89 d0                	mov    eax,edx
  809a5f:	29 c8                	sub    eax,ecx
  809a61:	89 05 89 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21889],eax        # 42b2f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  809a67:	48 8b 05 52 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21852]        # 42b2c0 <running_req>
  809a6e:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,TASK_SUSPENDED);
    int r=0;
  809a75:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  809a7c:	48 8b 05 3d 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2183d]        # 42b2c0 <running_req>
  809a83:	8b 00                	mov    eax,DWORD PTR [rax]
  809a85:	83 f8 03             	cmp    eax,0x3
  809a88:	0f 84 ad 00 00 00    	je     809b3b <execute_request+0x1c6>
  809a8e:	83 f8 03             	cmp    eax,0x3
  809a91:	0f 8f bf 00 00 00    	jg     809b56 <execute_request+0x1e1>
  809a97:	83 f8 02             	cmp    eax,0x2
  809a9a:	0f 84 85 00 00 00    	je     809b25 <execute_request+0x1b0>
  809aa0:	83 f8 02             	cmp    eax,0x2
  809aa3:	0f 8f ad 00 00 00    	jg     809b56 <execute_request+0x1e1>
  809aa9:	85 c0                	test   eax,eax
  809aab:	74 0a                	je     809ab7 <execute_request+0x142>
  809aad:	83 f8 01             	cmp    eax,0x1
  809ab0:	74 3c                	je     809aee <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  809ab2:	e9 9f 00 00 00       	jmp    809b56 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  809ab7:	48 8b 05 02 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21802]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  809abe:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  809ac2:	48 8b 05 f7 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217f7]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  809ac9:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  809acc:	48 8b 05 ed 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217ed]        # 42b2c0 <running_req>
  809ad3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  809ad6:	89 c6                	mov    esi,eax
  809ad8:	48 8b 05 e1 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217e1]        # 42b2c0 <running_req>
  809adf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809ae2:	89 c7                	mov    edi,eax
  809ae4:	e8 a7 00 00 00       	call   809b90 <async_read_disk>
  809ae9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809aec:	eb 69                	jmp    809b57 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  809aee:	48 8b 05 cb 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217cb]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  809af5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  809af9:	48 8b 05 c0 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217c0]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  809b00:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  809b03:	48 8b 05 b6 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217b6]        # 42b2c0 <running_req>
  809b0a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  809b0d:	89 c6                	mov    esi,eax
  809b0f:	48 8b 05 aa 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217aa]        # 42b2c0 <running_req>
  809b16:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809b19:	89 c7                	mov    edi,eax
  809b1b:	e8 88 01 00 00       	call   809ca8 <async_write_disk>
  809b20:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809b23:	eb 32                	jmp    809b57 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  809b25:	48 8b 05 94 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21794]        # 42b2c0 <running_req>
  809b2c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809b2f:	89 c7                	mov    edi,eax
  809b31:	e8 aa 06 00 00       	call   80a1e0 <async_check_disk>
  809b36:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809b39:	eb 1c                	jmp    809b57 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  809b3b:	48 8b 05 7e 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2177e]        # 42b2c0 <running_req>
  809b42:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809b45:	89 c7                	mov    edi,eax
  809b47:	b8 00 00 00 00       	mov    eax,0x0
  809b4c:	e8 1a 00 00 00       	call   809b6b <async_reset_disk>
  809b51:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809b54:	eb 01                	jmp    809b57 <execute_request+0x1e2>
        break;
  809b56:	90                   	nop
    }
    if(r==-1)return -1;
  809b57:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  809b5b:	75 07                	jne    809b64 <execute_request+0x1ef>
  809b5d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809b62:	eb 05                	jmp    809b69 <execute_request+0x1f4>
    return 0;
  809b64:	b8 00 00 00 00       	mov    eax,0x0
}
  809b69:	c9                   	leave  
  809b6a:	c3                   	ret    

0000000000809b6b <async_reset_disk>:
int async_reset_disk(int disk)
{
  809b6b:	f3 0f 1e fa          	endbr64 
  809b6f:	55                   	push   rbp
  809b70:	48 89 e5             	mov    rbp,rsp
  809b73:	48 83 ec 10          	sub    rsp,0x10
  809b77:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  809b7a:	be 0c 00 00 00       	mov    esi,0xc
  809b7f:	bf f6 03 00 00       	mov    edi,0x3f6
  809b84:	e8 a7 cc ff ff       	call   806830 <outb>
    return 0;
  809b89:	b8 00 00 00 00       	mov    eax,0x0
}
  809b8e:	c9                   	leave  
  809b8f:	c3                   	ret    

0000000000809b90 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  809b90:	f3 0f 1e fa          	endbr64 
  809b94:	55                   	push   rbp
  809b95:	48 89 e5             	mov    rbp,rsp
  809b98:	48 83 ec 30          	sub    rsp,0x30
  809b9c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809b9f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809ba2:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809ba5:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809ba9:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809baf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809bb6:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809bba:	74 06                	je     809bc2 <async_read_disk+0x32>
  809bbc:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809bc0:	75 06                	jne    809bc8 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  809bc2:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809bc8:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809bcc:	74 06                	je     809bd4 <async_read_disk+0x44>
  809bce:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809bd2:	75 07                	jne    809bdb <async_read_disk+0x4b>
        slave_disk=1;
  809bd4:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  809bdb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809bde:	0f b6 d0             	movzx  edx,al
  809be1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809be5:	83 c0 02             	add    eax,0x2
  809be8:	0f b7 c0             	movzx  eax,ax
  809beb:	89 d6                	mov    esi,edx
  809bed:	89 c7                	mov    edi,eax
  809bef:	e8 3c cc ff ff       	call   806830 <outb>
    outb(port+3,lba&0xff);
  809bf4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809bf7:	0f b6 d0             	movzx  edx,al
  809bfa:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809bfe:	83 c0 03             	add    eax,0x3
  809c01:	0f b7 c0             	movzx  eax,ax
  809c04:	89 d6                	mov    esi,edx
  809c06:	89 c7                	mov    edi,eax
  809c08:	e8 23 cc ff ff       	call   806830 <outb>
    outb(port+4,(lba>>8)&0xff);
  809c0d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c10:	c1 e8 08             	shr    eax,0x8
  809c13:	0f b6 d0             	movzx  edx,al
  809c16:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c1a:	83 c0 04             	add    eax,0x4
  809c1d:	0f b7 c0             	movzx  eax,ax
  809c20:	89 d6                	mov    esi,edx
  809c22:	89 c7                	mov    edi,eax
  809c24:	e8 07 cc ff ff       	call   806830 <outb>
    outb(port+5,(lba>>16)&0xff);
  809c29:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c2c:	c1 e8 10             	shr    eax,0x10
  809c2f:	0f b6 d0             	movzx  edx,al
  809c32:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c36:	83 c0 05             	add    eax,0x5
  809c39:	0f b7 c0             	movzx  eax,ax
  809c3c:	89 d6                	mov    esi,edx
  809c3e:	89 c7                	mov    edi,eax
  809c40:	e8 eb cb ff ff       	call   806830 <outb>
    char drv=slave_disk?0x10:0;
  809c45:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809c49:	74 07                	je     809c52 <async_read_disk+0xc2>
  809c4b:	b8 10 00 00 00       	mov    eax,0x10
  809c50:	eb 05                	jmp    809c57 <async_read_disk+0xc7>
  809c52:	b8 00 00 00 00       	mov    eax,0x0
  809c57:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809c5a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809c5d:	c1 e8 18             	shr    eax,0x18
  809c60:	83 e0 0f             	and    eax,0xf
  809c63:	89 c2                	mov    edx,eax
  809c65:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809c69:	09 d0                	or     eax,edx
  809c6b:	83 c8 e0             	or     eax,0xffffffe0
  809c6e:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  809c71:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  809c75:	0f b6 d0             	movzx  edx,al
  809c78:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c7c:	83 c0 06             	add    eax,0x6
  809c7f:	0f b7 c0             	movzx  eax,ax
  809c82:	89 d6                	mov    esi,edx
  809c84:	89 c7                	mov    edi,eax
  809c86:	e8 a5 cb ff ff       	call   806830 <outb>
    outb(port+7,DISK_CMD_READ);
  809c8b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c8f:	83 c0 07             	add    eax,0x7
  809c92:	0f b7 c0             	movzx  eax,ax
  809c95:	be 20 00 00 00       	mov    esi,0x20
  809c9a:	89 c7                	mov    edi,eax
  809c9c:	e8 8f cb ff ff       	call   806830 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  809ca1:	b8 00 00 00 00       	mov    eax,0x0
}
  809ca6:	c9                   	leave  
  809ca7:	c3                   	ret    

0000000000809ca8 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  809ca8:	f3 0f 1e fa          	endbr64 
  809cac:	55                   	push   rbp
  809cad:	48 89 e5             	mov    rbp,rsp
  809cb0:	48 83 ec 30          	sub    rsp,0x30
  809cb4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809cb7:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809cba:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809cbd:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809cc1:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809cc7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809cce:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809cd2:	74 06                	je     809cda <async_write_disk+0x32>
  809cd4:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809cd8:	75 06                	jne    809ce0 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  809cda:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809ce0:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809ce4:	74 06                	je     809cec <async_write_disk+0x44>
  809ce6:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809cea:	75 07                	jne    809cf3 <async_write_disk+0x4b>
        slave_disk=1;
  809cec:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  809cf3:	bf f7 00 00 00       	mov    edi,0xf7
  809cf8:	e8 4c cb ff ff       	call   806849 <inb>
  809cfd:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  809d00:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809d04:	83 e0 01             	and    eax,0x1
  809d07:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  809d0a:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  809d0e:	74 0a                	je     809d1a <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  809d10:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809d15:	e9 d5 00 00 00       	jmp    809def <async_write_disk+0x147>
        }
        t&=0x88;
  809d1a:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  809d1e:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  809d22:	74 02                	je     809d26 <async_write_disk+0x7e>
    {
  809d24:	eb cd                	jmp    809cf3 <async_write_disk+0x4b>
        if(t==0x8)break;
  809d26:	90                   	nop
    }
    outb(port+2,sec_n);
  809d27:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809d2a:	0f b6 d0             	movzx  edx,al
  809d2d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d31:	83 c0 02             	add    eax,0x2
  809d34:	0f b7 c0             	movzx  eax,ax
  809d37:	89 d6                	mov    esi,edx
  809d39:	89 c7                	mov    edi,eax
  809d3b:	e8 f0 ca ff ff       	call   806830 <outb>
    outb(port+3,lba&0xff);
  809d40:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809d43:	0f b6 d0             	movzx  edx,al
  809d46:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d4a:	83 c0 03             	add    eax,0x3
  809d4d:	0f b7 c0             	movzx  eax,ax
  809d50:	89 d6                	mov    esi,edx
  809d52:	89 c7                	mov    edi,eax
  809d54:	e8 d7 ca ff ff       	call   806830 <outb>
    outb(port+4,(lba>>8)&0xff);
  809d59:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809d5c:	c1 e8 08             	shr    eax,0x8
  809d5f:	0f b6 d0             	movzx  edx,al
  809d62:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d66:	83 c0 04             	add    eax,0x4
  809d69:	0f b7 c0             	movzx  eax,ax
  809d6c:	89 d6                	mov    esi,edx
  809d6e:	89 c7                	mov    edi,eax
  809d70:	e8 bb ca ff ff       	call   806830 <outb>
    outb(port+5,(lba>>16)&0xff);
  809d75:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809d78:	c1 e8 10             	shr    eax,0x10
  809d7b:	0f b6 d0             	movzx  edx,al
  809d7e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d82:	83 c0 05             	add    eax,0x5
  809d85:	0f b7 c0             	movzx  eax,ax
  809d88:	89 d6                	mov    esi,edx
  809d8a:	89 c7                	mov    edi,eax
  809d8c:	e8 9f ca ff ff       	call   806830 <outb>
    char drv=slave_disk?0x10:0;
  809d91:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809d95:	74 07                	je     809d9e <async_write_disk+0xf6>
  809d97:	b8 10 00 00 00       	mov    eax,0x10
  809d9c:	eb 05                	jmp    809da3 <async_write_disk+0xfb>
  809d9e:	b8 00 00 00 00       	mov    eax,0x0
  809da3:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809da6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809da9:	c1 e8 18             	shr    eax,0x18
  809dac:	83 e0 0f             	and    eax,0xf
  809daf:	89 c2                	mov    edx,eax
  809db1:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  809db5:	09 d0                	or     eax,edx
  809db7:	83 c8 e0             	or     eax,0xffffffe0
  809dba:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  809dbd:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809dc1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809dc5:	83 c0 06             	add    eax,0x6
  809dc8:	0f b7 c0             	movzx  eax,ax
  809dcb:	89 d6                	mov    esi,edx
  809dcd:	89 c7                	mov    edi,eax
  809dcf:	e8 5c ca ff ff       	call   806830 <outb>
    outb(port+7,DISK_CMD_WRITE);
  809dd4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809dd8:	83 c0 07             	add    eax,0x7
  809ddb:	0f b7 c0             	movzx  eax,ax
  809dde:	be 30 00 00 00       	mov    esi,0x30
  809de3:	89 c7                	mov    edi,eax
  809de5:	e8 46 ca ff ff       	call   806830 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  809dea:	b8 00 00 00 00       	mov    eax,0x0
}
  809def:	c9                   	leave  
  809df0:	c3                   	ret    

0000000000809df1 <read_disk>:
int read_disk(driver_args* args)
{
  809df1:	f3 0f 1e fa          	endbr64 
  809df5:	55                   	push   rbp
  809df6:	48 89 e5             	mov    rbp,rsp
  809df9:	48 83 ec 20          	sub    rsp,0x20
  809dfd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  809e01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e05:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809e08:	48 98                	cdqe   
  809e0a:	48 89 c2             	mov    rdx,rax
  809e0d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e11:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809e14:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e18:	8b 00                	mov    eax,DWORD PTR [rax]
  809e1a:	89 ce                	mov    esi,ecx
  809e1c:	89 c7                	mov    edi,eax
  809e1e:	e8 a9 05 00 00       	call   80a3cc <read_disk_asm>
  809e23:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809e26:	48 8b 05 93 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21493]        # 42b2c0 <running_req>
  809e2d:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809e34:	48 8b 05 85 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21485]        # 42b2c0 <running_req>
  809e3b:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809e3f:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809e46:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809e49:	48 c7 05 6c 14 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2146c],0x0        # 42b2c0 <running_req>
  809e50:	00 00 00 00 
    return ret;
  809e54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809e57:	c9                   	leave  
  809e58:	c3                   	ret    

0000000000809e59 <write_disk>:
int write_disk(driver_args* args)
{
  809e59:	f3 0f 1e fa          	endbr64 
  809e5d:	55                   	push   rbp
  809e5e:	48 89 e5             	mov    rbp,rsp
  809e61:	48 83 ec 20          	sub    rsp,0x20
  809e65:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  809e69:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e6d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e70:	48 98                	cdqe   
  809e72:	48 89 c2             	mov    rdx,rax
  809e75:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e79:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809e7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e80:	8b 00                	mov    eax,DWORD PTR [rax]
  809e82:	89 ce                	mov    esi,ecx
  809e84:	89 c7                	mov    edi,eax
  809e86:	e8 c1 05 00 00       	call   80a44c <write_disk_asm>
  809e8b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809e8e:	48 8b 05 2b 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2142b]        # 42b2c0 <running_req>
  809e95:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809e9c:	48 8b 05 1d 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2141d]        # 42b2c0 <running_req>
  809ea3:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809ea7:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809eae:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809eb1:	48 c7 05 04 14 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21404],0x0        # 42b2c0 <running_req>
  809eb8:	00 00 00 00 
    return ret;
  809ebc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809ebf:	c9                   	leave  
  809ec0:	c3                   	ret    

0000000000809ec1 <chk_result>:
int chk_result(int r)
{
  809ec1:	f3 0f 1e fa          	endbr64 
  809ec5:	55                   	push   rbp
  809ec6:	48 89 e5             	mov    rbp,rsp
  809ec9:	48 83 ec 10          	sub    rsp,0x10
  809ecd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  809ed0:	90                   	nop
  809ed1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ed4:	48 63 d0             	movsxd rdx,eax
  809ed7:	48 89 d0             	mov    rax,rdx
  809eda:	48 01 c0             	add    rax,rax
  809edd:	48 01 d0             	add    rax,rdx
  809ee0:	48 c1 e0 04          	shl    rax,0x4
  809ee4:	48 05 dc 85 42 00    	add    rax,0x4285dc
  809eea:	8b 00                	mov    eax,DWORD PTR [rax]
  809eec:	83 f8 03             	cmp    eax,0x3
  809eef:	75 e0                	jne    809ed1 <chk_result+0x10>
    if(disk_reqs[r].result==DISK_CHK_OK)
  809ef1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ef4:	48 63 d0             	movsxd rdx,eax
  809ef7:	48 89 d0             	mov    rax,rdx
  809efa:	48 01 c0             	add    rax,rax
  809efd:	48 01 d0             	add    rax,rdx
  809f00:	48 c1 e0 04          	shl    rax,0x4
  809f04:	48 05 e0 85 42 00    	add    rax,0x4285e0
  809f0a:	8b 00                	mov    eax,DWORD PTR [rax]
  809f0c:	83 f8 01             	cmp    eax,0x1
  809f0f:	75 07                	jne    809f18 <chk_result+0x57>
        return 1;
  809f11:	b8 01 00 00 00       	mov    eax,0x1
  809f16:	eb 14                	jmp    809f2c <chk_result+0x6b>
    comprintf("disk err\n");
  809f18:	bf 08 5b 81 00       	mov    edi,0x815b08
  809f1d:	b8 00 00 00 00       	mov    eax,0x0
  809f22:	e8 d0 2f 00 00       	call   80cef7 <comprintf>
    return 0;
  809f27:	b8 00 00 00 00       	mov    eax,0x0
}
  809f2c:	c9                   	leave  
  809f2d:	c3                   	ret    

0000000000809f2e <disk_existent>:
int disk_existent(int disk)
{
  809f2e:	f3 0f 1e fa          	endbr64 
  809f32:	55                   	push   rbp
  809f33:	48 89 e5             	mov    rbp,rsp
  809f36:	48 83 ec 10          	sub    rsp,0x10
  809f3a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  809f3d:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809f41:	74 5f                	je     809fa2 <disk_existent+0x74>
  809f43:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809f47:	7f 6e                	jg     809fb7 <disk_existent+0x89>
  809f49:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809f4d:	74 3e                	je     809f8d <disk_existent+0x5f>
  809f4f:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809f53:	7f 62                	jg     809fb7 <disk_existent+0x89>
  809f55:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809f59:	74 08                	je     809f63 <disk_existent+0x35>
  809f5b:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  809f5f:	74 17                	je     809f78 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  809f61:	eb 54                	jmp    809fb7 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  809f63:	bf 12 5b 81 00       	mov    edi,0x815b12
  809f68:	e8 2e 95 ff ff       	call   80349b <sys_find_dev>
  809f6d:	83 f8 ff             	cmp    eax,0xffffffff
  809f70:	0f 95 c0             	setne  al
  809f73:	0f b6 c0             	movzx  eax,al
  809f76:	eb 45                	jmp    809fbd <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  809f78:	bf 16 5b 81 00       	mov    edi,0x815b16
  809f7d:	e8 19 95 ff ff       	call   80349b <sys_find_dev>
  809f82:	83 f8 ff             	cmp    eax,0xffffffff
  809f85:	0f 95 c0             	setne  al
  809f88:	0f b6 c0             	movzx  eax,al
  809f8b:	eb 30                	jmp    809fbd <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  809f8d:	bf 1a 5b 81 00       	mov    edi,0x815b1a
  809f92:	e8 04 95 ff ff       	call   80349b <sys_find_dev>
  809f97:	83 f8 ff             	cmp    eax,0xffffffff
  809f9a:	0f 95 c0             	setne  al
  809f9d:	0f b6 c0             	movzx  eax,al
  809fa0:	eb 1b                	jmp    809fbd <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  809fa2:	bf 1e 5b 81 00       	mov    edi,0x815b1e
  809fa7:	e8 ef 94 ff ff       	call   80349b <sys_find_dev>
  809fac:	83 f8 ff             	cmp    eax,0xffffffff
  809faf:	0f 95 c0             	setne  al
  809fb2:	0f b6 c0             	movzx  eax,al
  809fb5:	eb 06                	jmp    809fbd <disk_existent+0x8f>
        break;
  809fb7:	90                   	nop
    }
    return 0;
  809fb8:	b8 00 00 00 00       	mov    eax,0x0
}
  809fbd:	c9                   	leave  
  809fbe:	c3                   	ret    

0000000000809fbf <hd_iterate>:
int hd_iterate()
{
  809fbf:	f3 0f 1e fa          	endbr64 
  809fc3:	55                   	push   rbp
  809fc4:	48 89 e5             	mov    rbp,rsp
  809fc7:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  809fce:	41 b8 00 00 00 00    	mov    r8d,0x0
  809fd4:	b9 01 00 00 00       	mov    ecx,0x1
  809fd9:	ba 00 00 00 00       	mov    edx,0x0
  809fde:	be 02 00 00 00       	mov    esi,0x2
  809fe3:	bf 00 00 00 00       	mov    edi,0x0
  809fe8:	e8 20 f8 ff ff       	call   80980d <request>
  809fed:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  809ff0:	41 b8 00 00 00 00    	mov    r8d,0x0
  809ff6:	b9 01 00 00 00       	mov    ecx,0x1
  809ffb:	ba 00 00 00 00       	mov    edx,0x0
  80a000:	be 02 00 00 00       	mov    esi,0x2
  80a005:	bf 01 00 00 00       	mov    edi,0x1
  80a00a:	e8 fe f7 ff ff       	call   80980d <request>
  80a00f:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80a012:	41 b8 00 00 00 00    	mov    r8d,0x0
  80a018:	b9 01 00 00 00       	mov    ecx,0x1
  80a01d:	ba 00 00 00 00       	mov    edx,0x0
  80a022:	be 02 00 00 00       	mov    esi,0x2
  80a027:	bf 02 00 00 00       	mov    edi,0x2
  80a02c:	e8 dc f7 ff ff       	call   80980d <request>
  80a031:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80a034:	41 b8 00 00 00 00    	mov    r8d,0x0
  80a03a:	b9 01 00 00 00       	mov    ecx,0x1
  80a03f:	ba 00 00 00 00       	mov    edx,0x0
  80a044:	be 02 00 00 00       	mov    esi,0x2
  80a049:	bf 03 00 00 00       	mov    edi,0x3
  80a04e:	e8 ba f7 ff ff       	call   80980d <request>
  80a053:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  80a056:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a05d:	e9 72 01 00 00       	jmp    80a1d4 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  80a062:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a066:	74 3b                	je     80a0a3 <hd_iterate+0xe4>
  80a068:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a06c:	7f 3e                	jg     80a0ac <hd_iterate+0xed>
  80a06e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a072:	74 26                	je     80a09a <hd_iterate+0xdb>
  80a074:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a078:	7f 32                	jg     80a0ac <hd_iterate+0xed>
  80a07a:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a07e:	74 08                	je     80a088 <hd_iterate+0xc9>
  80a080:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a084:	74 0b                	je     80a091 <hd_iterate+0xd2>
  80a086:	eb 24                	jmp    80a0ac <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  80a088:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a08f:	eb 25                	jmp    80a0b6 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  80a091:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  80a098:	eb 1c                	jmp    80a0b6 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80a09a:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  80a0a1:	eb 13                	jmp    80a0b6 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  80a0a3:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  80a0aa:	eb 0a                	jmp    80a0b6 <hd_iterate+0xf7>
        default:
            return -1;
  80a0ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a0b1:	e9 28 01 00 00       	jmp    80a1de <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  80a0b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0b9:	48 98                	cdqe   
  80a0bb:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80a0bf:	89 c7                	mov    edi,eax
  80a0c1:	e8 fb fd ff ff       	call   809ec1 <chk_result>
  80a0c6:	85 c0                	test   eax,eax
  80a0c8:	0f 84 81 00 00 00    	je     80a14f <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  80a0ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0d1:	89 c6                	mov    esi,eax
  80a0d3:	bf 22 5b 81 00       	mov    edi,0x815b22
  80a0d8:	b8 00 00 00 00       	mov    eax,0x0
  80a0dd:	e8 95 6c ff ff       	call   800d77 <printf>
            //新硬盘
            device hd={
  80a0e2:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80a0e9:	b8 00 00 00 00       	mov    eax,0x0
  80a0ee:	b9 15 00 00 00       	mov    ecx,0x15
  80a0f3:	48 89 d7             	mov    rdi,rdx
  80a0f6:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  80a0f9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a0fc:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80a102:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80a109:	00 00 00 
  80a10c:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80a113:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  80a116:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a11a:	7f 07                	jg     80a123 <hd_iterate+0x164>
  80a11c:	b8 f0 01 00 00       	mov    eax,0x1f0
  80a121:	eb 05                	jmp    80a128 <hd_iterate+0x169>
  80a123:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80a128:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80a12e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80a135:	48 89 c7             	mov    rdi,rax
  80a138:	e8 26 8f ff ff       	call   803063 <reg_device>
  80a13d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a140:	48 63 d2             	movsxd rdx,edx
  80a143:	89 04 95 e0 b2 42 00 	mov    DWORD PTR [rdx*4+0x42b2e0],eax
  80a14a:	e9 81 00 00 00       	jmp    80a1d0 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80a14f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a152:	48 98                	cdqe   
  80a154:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80a158:	89 c7                	mov    edi,eax
  80a15a:	e8 62 fd ff ff       	call   809ec1 <chk_result>
  80a15f:	85 c0                	test   eax,eax
  80a161:	75 6d                	jne    80a1d0 <hd_iterate+0x211>
        {
            switch (i)
  80a163:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a167:	74 3e                	je     80a1a7 <hd_iterate+0x1e8>
  80a169:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a16d:	7f 41                	jg     80a1b0 <hd_iterate+0x1f1>
  80a16f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a173:	74 28                	je     80a19d <hd_iterate+0x1de>
  80a175:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a179:	7f 35                	jg     80a1b0 <hd_iterate+0x1f1>
  80a17b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a17f:	74 08                	je     80a189 <hd_iterate+0x1ca>
  80a181:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a185:	74 0c                	je     80a193 <hd_iterate+0x1d4>
  80a187:	eb 27                	jmp    80a1b0 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80a189:	48 c7 45 f8 12 5b 81 	mov    QWORD PTR [rbp-0x8],0x815b12
  80a190:	00 
  80a191:	eb 1d                	jmp    80a1b0 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80a193:	48 c7 45 f8 16 5b 81 	mov    QWORD PTR [rbp-0x8],0x815b16
  80a19a:	00 
  80a19b:	eb 13                	jmp    80a1b0 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  80a19d:	48 c7 45 f8 1a 5b 81 	mov    QWORD PTR [rbp-0x8],0x815b1a
  80a1a4:	00 
  80a1a5:	eb 09                	jmp    80a1b0 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  80a1a7:	48 c7 45 f8 1e 5b 81 	mov    QWORD PTR [rbp-0x8],0x815b1e
  80a1ae:	00 
  80a1af:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80a1b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a1b4:	48 89 c7             	mov    rdi,rax
  80a1b7:	e8 df 92 ff ff       	call   80349b <sys_find_dev>
  80a1bc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80a1bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a1c2:	89 c7                	mov    edi,eax
  80a1c4:	e8 a6 99 ff ff       	call   803b6f <get_dev>
  80a1c9:	89 c7                	mov    edi,eax
  80a1cb:	e8 f2 98 ff ff       	call   803ac2 <dispose_device>
    for(int i=0;i<1;i++)
  80a1d0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a1d4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a1d8:	0f 8e 84 fe ff ff    	jle    80a062 <hd_iterate+0xa3>
        }

    }
}
  80a1de:	c9                   	leave  
  80a1df:	c3                   	ret    

000000000080a1e0 <async_check_disk>:

int async_check_disk(int disk)
{
  80a1e0:	f3 0f 1e fa          	endbr64 
  80a1e4:	55                   	push   rbp
  80a1e5:	48 89 e5             	mov    rbp,rsp
  80a1e8:	48 83 ec 20          	sub    rsp,0x20
  80a1ec:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80a1ef:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  80a1f5:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80a1fb:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80a1ff:	74 06                	je     80a207 <async_check_disk+0x27>
  80a201:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a205:	75 06                	jne    80a20d <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80a207:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  80a20d:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80a211:	74 06                	je     80a219 <async_check_disk+0x39>
  80a213:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a217:	75 06                	jne    80a21f <async_check_disk+0x3f>
        chkcmd=0xf0;
  80a219:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80a21f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a223:	83 c0 02             	add    eax,0x2
  80a226:	0f b7 c0             	movzx  eax,ax
  80a229:	be 01 00 00 00       	mov    esi,0x1
  80a22e:	89 c7                	mov    edi,eax
  80a230:	e8 fb c5 ff ff       	call   806830 <outb>
    outb(disknr+3,0);
  80a235:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a239:	83 c0 03             	add    eax,0x3
  80a23c:	0f b7 c0             	movzx  eax,ax
  80a23f:	be 00 00 00 00       	mov    esi,0x0
  80a244:	89 c7                	mov    edi,eax
  80a246:	e8 e5 c5 ff ff       	call   806830 <outb>
    outb(disknr+4,0);
  80a24b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a24f:	83 c0 04             	add    eax,0x4
  80a252:	0f b7 c0             	movzx  eax,ax
  80a255:	be 00 00 00 00       	mov    esi,0x0
  80a25a:	89 c7                	mov    edi,eax
  80a25c:	e8 cf c5 ff ff       	call   806830 <outb>
    outb(disknr+5,0);
  80a261:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a265:	83 c0 05             	add    eax,0x5
  80a268:	0f b7 c0             	movzx  eax,ax
  80a26b:	be 00 00 00 00       	mov    esi,0x0
  80a270:	89 c7                	mov    edi,eax
  80a272:	e8 b9 c5 ff ff       	call   806830 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80a277:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80a27b:	0f b6 d0             	movzx  edx,al
  80a27e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a282:	83 c0 06             	add    eax,0x6
  80a285:	0f b7 c0             	movzx  eax,ax
  80a288:	89 d6                	mov    esi,edx
  80a28a:	89 c7                	mov    edi,eax
  80a28c:	e8 9f c5 ff ff       	call   806830 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80a291:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a295:	83 c0 07             	add    eax,0x7
  80a298:	0f b7 c0             	movzx  eax,ax
  80a29b:	be 90 00 00 00       	mov    esi,0x90
  80a2a0:	89 c7                	mov    edi,eax
  80a2a2:	e8 89 c5 ff ff       	call   806830 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  80a2a7:	b8 00 00 00 00       	mov    eax,0x0
}
  80a2ac:	c9                   	leave  
  80a2ad:	c3                   	ret    

000000000080a2ae <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80a2ae:	f3 0f 1e fa          	endbr64 
  80a2b2:	55                   	push   rbp
  80a2b3:	48 89 e5             	mov    rbp,rsp
  80a2b6:	48 83 ec 18          	sub    rsp,0x18
  80a2ba:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80a2be:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  80a2c5:	eb 04                	jmp    80a2cb <hd_do_req+0x1d>
  80a2c7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a2cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a2ce:	48 98                	cdqe   
  80a2d0:	8b 14 85 e0 b2 42 00 	mov    edx,DWORD PTR [rax*4+0x42b2e0]
  80a2d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2db:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80a2e1:	39 c2                	cmp    edx,eax
  80a2e3:	75 e2                	jne    80a2c7 <hd_do_req+0x19>
    switch (args->cmd)
  80a2e5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2e9:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a2ef:	83 f8 04             	cmp    eax,0x4
  80a2f2:	74 72                	je     80a366 <hd_do_req+0xb8>
  80a2f4:	83 f8 04             	cmp    eax,0x4
  80a2f7:	0f 8f 96 00 00 00    	jg     80a393 <hd_do_req+0xe5>
  80a2fd:	83 f8 02             	cmp    eax,0x2
  80a300:	74 0a                	je     80a30c <hd_do_req+0x5e>
  80a302:	83 f8 03             	cmp    eax,0x3
  80a305:	74 32                	je     80a339 <hd_do_req+0x8b>
  80a307:	e9 87 00 00 00       	jmp    80a393 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80a30c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a310:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a313:	48 98                	cdqe   
  80a315:	48 89 c6             	mov    rsi,rax
  80a318:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a31c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a31f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a323:	8b 10                	mov    edx,DWORD PTR [rax]
  80a325:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a328:	49 89 f0             	mov    r8,rsi
  80a32b:	be 00 00 00 00       	mov    esi,0x0
  80a330:	89 c7                	mov    edi,eax
  80a332:	e8 d6 f4 ff ff       	call   80980d <request>
        break;
  80a337:	eb 61                	jmp    80a39a <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  80a339:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a33d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a340:	48 98                	cdqe   
  80a342:	48 89 c6             	mov    rsi,rax
  80a345:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a349:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a34c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a350:	8b 10                	mov    edx,DWORD PTR [rax]
  80a352:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a355:	49 89 f0             	mov    r8,rsi
  80a358:	be 01 00 00 00       	mov    esi,0x1
  80a35d:	89 c7                	mov    edi,eax
  80a35f:	e8 a9 f4 ff ff       	call   80980d <request>
        break;
  80a364:	eb 34                	jmp    80a39a <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  80a366:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a36a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a36d:	48 98                	cdqe   
  80a36f:	48 89 c6             	mov    rsi,rax
  80a372:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a376:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a379:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a37d:	8b 10                	mov    edx,DWORD PTR [rax]
  80a37f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a382:	49 89 f0             	mov    r8,rsi
  80a385:	be 02 00 00 00       	mov    esi,0x2
  80a38a:	89 c7                	mov    edi,eax
  80a38c:	e8 7c f4 ff ff       	call   80980d <request>
        break;
  80a391:	eb 07                	jmp    80a39a <hd_do_req+0xec>
    default:return -1;
  80a393:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a398:	eb 1e                	jmp    80a3b8 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80a39a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a39e:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  80a3a5:	00 00 00 
    running_devman_req=args;
  80a3a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a3ac:	48 89 05 15 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f15],rax        # 42b2c8 <running_devman_req>
    return 0;
  80a3b3:	b8 00 00 00 00       	mov    eax,0x0
  80a3b8:	c9                   	leave  
  80a3b9:	c3                   	ret    
  80a3ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080a3c0 <disk_int_handler>:
  80a3c0:	e8 99 c4 ff ff       	call   80685e <eoi>
  80a3c5:	e8 38 f2 ff ff       	call   809602 <disk_int_handler_c>
  80a3ca:	48 cf                	iretq  

000000000080a3cc <read_disk_asm>:
  80a3cc:	55                   	push   rbp
  80a3cd:	89 e5                	mov    ebp,esp
  80a3cf:	66 ba f7 01          	mov    dx,0x1f7
  80a3d3:	31 c9                	xor    ecx,ecx
  80a3d5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a3da:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a3df:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a3e4:	89 c6                	mov    esi,eax
  80a3e6:	66 ba f2 01          	mov    dx,0x1f2
  80a3ea:	88 c8                	mov    al,cl
  80a3ec:	ee                   	out    dx,al
  80a3ed:	66 ba f3 01          	mov    dx,0x1f3
  80a3f1:	89 f0                	mov    eax,esi
  80a3f3:	ee                   	out    dx,al
  80a3f4:	66 ff c2             	inc    dx
  80a3f7:	c1 e8 08             	shr    eax,0x8
  80a3fa:	ee                   	out    dx,al
  80a3fb:	66 ff c2             	inc    dx
  80a3fe:	c1 e8 08             	shr    eax,0x8
  80a401:	ee                   	out    dx,al
  80a402:	66 ff c2             	inc    dx
  80a405:	66 c1 e8 08          	shr    ax,0x8
  80a409:	24 0f                	and    al,0xf
  80a40b:	0c e0                	or     al,0xe0
  80a40d:	ee                   	out    dx,al
  80a40e:	66 ff c2             	inc    dx
  80a411:	b0 20                	mov    al,0x20
  80a413:	ee                   	out    dx,al

000000000080a414 <read_disk_asm.wait>:
  80a414:	90                   	nop
  80a415:	ec                   	in     al,dx
  80a416:	24 88                	and    al,0x88
  80a418:	3c 08                	cmp    al,0x8
  80a41a:	75 f8                	jne    80a414 <read_disk_asm.wait>
  80a41c:	66 89 d7             	mov    di,dx
  80a41f:	89 c8                	mov    eax,ecx
  80a421:	66 b9 00 01          	mov    cx,0x100
  80a425:	66 f7 e1             	mul    cx
  80a428:	89 c1                	mov    ecx,eax
  80a42a:	66 ba f0 01          	mov    dx,0x1f0

000000000080a42e <read_disk_asm.read>:
  80a42e:	66 ed                	in     ax,dx
  80a430:	66 67 89 03          	mov    WORD PTR [ebx],ax
  80a434:	83 c3 02             	add    ebx,0x2
  80a437:	e2 f5                	loop   80a42e <read_disk_asm.read>
  80a439:	c9                   	leave  
  80a43a:	b8 00 00 00 00       	mov    eax,0x0
  80a43f:	c3                   	ret    

000000000080a440 <read_disk_asm.err_disk_reading>:
  80a440:	66 ba f1 01          	mov    dx,0x1f1
  80a444:	31 c0                	xor    eax,eax
  80a446:	66 ed                	in     ax,dx
  80a448:	89 ec                	mov    esp,ebp
  80a44a:	5d                   	pop    rbp
  80a44b:	c3                   	ret    

000000000080a44c <write_disk_asm>:
  80a44c:	55                   	push   rbp
  80a44d:	89 e5                	mov    ebp,esp
  80a44f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a454:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a459:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a45e:	50                   	push   rax
  80a45f:	66 ba f2 01          	mov    dx,0x1f2
  80a463:	88 c8                	mov    al,cl
  80a465:	ee                   	out    dx,al
  80a466:	58                   	pop    rax
  80a467:	66 ba f3 01          	mov    dx,0x1f3
  80a46b:	ee                   	out    dx,al
  80a46c:	c1 e8 08             	shr    eax,0x8
  80a46f:	66 ba f4 01          	mov    dx,0x1f4
  80a473:	ee                   	out    dx,al
  80a474:	c1 e8 08             	shr    eax,0x8
  80a477:	66 ba f5 01          	mov    dx,0x1f5
  80a47b:	ee                   	out    dx,al
  80a47c:	c1 e8 08             	shr    eax,0x8
  80a47f:	24 0f                	and    al,0xf
  80a481:	0c e0                	or     al,0xe0
  80a483:	66 ba f6 01          	mov    dx,0x1f6
  80a487:	ee                   	out    dx,al
  80a488:	66 ba f7 01          	mov    dx,0x1f7
  80a48c:	b0 30                	mov    al,0x30
  80a48e:	ee                   	out    dx,al

000000000080a48f <write_disk_asm.not_ready2>:
  80a48f:	90                   	nop
  80a490:	ec                   	in     al,dx
  80a491:	24 88                	and    al,0x88
  80a493:	3c 08                	cmp    al,0x8
  80a495:	75 f8                	jne    80a48f <write_disk_asm.not_ready2>
  80a497:	89 c8                	mov    eax,ecx
  80a499:	66 b9 00 01          	mov    cx,0x100
  80a49d:	66 f7 e1             	mul    cx
  80a4a0:	89 c1                	mov    ecx,eax
  80a4a2:	66 ba f0 01          	mov    dx,0x1f0

000000000080a4a6 <write_disk_asm.go_on_write>:
  80a4a6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80a4aa:	66 ef                	out    dx,ax
  80a4ac:	83 c3 02             	add    ebx,0x2
  80a4af:	e2 f5                	loop   80a4a6 <write_disk_asm.go_on_write>
  80a4b1:	89 ec                	mov    esp,ebp
  80a4b3:	5d                   	pop    rbp
  80a4b4:	c3                   	ret    

000000000080a4b5 <DISK1_FAT32_read_FAT_Entry>:
#include "memory.h"
#include "proc.h"
#include "devman.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  80a4b5:	f3 0f 1e fa          	endbr64 
  80a4b9:	55                   	push   rbp
  80a4ba:	48 89 e5             	mov    rbp,rsp
  80a4bd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a4c4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a4cb:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  80a4d1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a4d8:	ba 00 02 00 00       	mov    edx,0x200
  80a4dd:	be 00 00 00 00       	mov    esi,0x0
  80a4e2:	48 89 c7             	mov    rdi,rax
  80a4e5:	e8 2f 2b 00 00       	call   80d019 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a4ea:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a4f1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a4f5:	89 c2                	mov    edx,eax
  80a4f7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4fd:	c1 e8 07             	shr    eax,0x7
  80a500:	01 d0                	add    eax,edx
  80a502:	89 c2                	mov    edx,eax
  80a504:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a50b:	49 89 c0             	mov    r8,rax
  80a50e:	b9 01 00 00 00       	mov    ecx,0x1
  80a513:	be 00 00 00 00       	mov    esi,0x0
  80a518:	bf 00 00 00 00       	mov    edi,0x0
  80a51d:	e8 eb f2 ff ff       	call   80980d <request>
  80a522:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  80a525:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a528:	89 c7                	mov    edi,eax
  80a52a:	e8 92 f9 ff ff       	call   809ec1 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80a52f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a535:	83 e0 7f             	and    eax,0x7f
  80a538:	89 c0                	mov    eax,eax
  80a53a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  80a541:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a547:	89 c6                	mov    esi,eax
  80a549:	bf 38 5b 81 00       	mov    edi,0x815b38
  80a54e:	b8 00 00 00 00       	mov    eax,0x0
  80a553:	e8 1f 68 ff ff       	call   800d77 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  80a558:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a55e:	83 e0 7f             	and    eax,0x7f
  80a561:	89 c0                	mov    eax,eax
  80a563:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a56a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80a56f:	c9                   	leave  
  80a570:	c3                   	ret    

000000000080a571 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  80a571:	f3 0f 1e fa          	endbr64 
  80a575:	55                   	push   rbp
  80a576:	48 89 e5             	mov    rbp,rsp
  80a579:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a580:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a587:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80a58d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  80a593:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a59a:	ba 00 02 00 00       	mov    edx,0x200
  80a59f:	be 00 00 00 00       	mov    esi,0x0
  80a5a4:	48 89 c7             	mov    rdi,rax
  80a5a7:	e8 6d 2a 00 00       	call   80d019 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a5ac:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a5b3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a5b7:	89 c2                	mov    edx,eax
  80a5b9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a5bf:	c1 e8 07             	shr    eax,0x7
  80a5c2:	01 d0                	add    eax,edx
  80a5c4:	89 c2                	mov    edx,eax
  80a5c6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a5cd:	49 89 c0             	mov    r8,rax
  80a5d0:	b9 01 00 00 00       	mov    ecx,0x1
  80a5d5:	be 00 00 00 00       	mov    esi,0x0
  80a5da:	bf 00 00 00 00       	mov    edi,0x0
  80a5df:	e8 29 f2 ff ff       	call   80980d <request>
  80a5e4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  80a5e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a5ea:	89 c7                	mov    edi,eax
  80a5ec:	e8 d0 f8 ff ff       	call   809ec1 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  80a5f1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a5f7:	83 e0 7f             	and    eax,0x7f
  80a5fa:	89 c0                	mov    eax,eax
  80a5fc:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a603:	25 00 00 00 f0       	and    eax,0xf0000000
  80a608:	89 c6                	mov    esi,eax
  80a60a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  80a610:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a615:	89 c1                	mov    ecx,eax
  80a617:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a61d:	83 e0 7f             	and    eax,0x7f
  80a620:	89 c2                	mov    edx,eax
  80a622:	89 f0                	mov    eax,esi
  80a624:	09 c8                	or     eax,ecx
  80a626:	89 d2                	mov    edx,edx
  80a628:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80a62f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a636:	eb 61                	jmp    80a699 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  80a638:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a63f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a643:	89 c1                	mov    ecx,eax
  80a645:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a64c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a650:	89 c2                	mov    edx,eax
  80a652:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a655:	48 98                	cdqe   
  80a657:	0f af c2             	imul   eax,edx
  80a65a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80a65d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a663:	c1 e8 07             	shr    eax,0x7
  80a666:	01 d0                	add    eax,edx
  80a668:	89 c2                	mov    edx,eax
  80a66a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a671:	49 89 c0             	mov    r8,rax
  80a674:	b9 01 00 00 00       	mov    ecx,0x1
  80a679:	be 01 00 00 00       	mov    esi,0x1
  80a67e:	bf 00 00 00 00       	mov    edi,0x0
  80a683:	e8 85 f1 ff ff       	call   80980d <request>
  80a688:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80a68b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a68e:	89 c7                	mov    edi,eax
  80a690:	e8 2c f8 ff ff       	call   809ec1 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  80a695:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a699:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a69c:	48 63 d0             	movsxd rdx,eax
  80a69f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a6a6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a6aa:	48 39 c2             	cmp    rdx,rax
  80a6ad:	72 89                	jb     80a638 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80a6af:	b8 01 00 00 00       	mov    eax,0x1
}
  80a6b4:	c9                   	leave  
  80a6b5:	c3                   	ret    

000000000080a6b6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  80a6b6:	f3 0f 1e fa          	endbr64 
  80a6ba:	55                   	push   rbp
  80a6bb:	48 89 e5             	mov    rbp,rsp
  80a6be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a6c2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a6c6:	b8 01 00 00 00       	mov    eax,0x1
}
  80a6cb:	5d                   	pop    rbp
  80a6cc:	c3                   	ret    

000000000080a6cd <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80a6cd:	f3 0f 1e fa          	endbr64 
  80a6d1:	55                   	push   rbp
  80a6d2:	48 89 e5             	mov    rbp,rsp
  80a6d5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a6d9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a6dd:	b8 01 00 00 00       	mov    eax,0x1
}
  80a6e2:	5d                   	pop    rbp
  80a6e3:	c3                   	ret    

000000000080a6e4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a6e4:	f3 0f 1e fa          	endbr64 
  80a6e8:	55                   	push   rbp
  80a6e9:	48 89 e5             	mov    rbp,rsp
  80a6ec:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80a6f0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80a6f4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80a6f8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80a6fc:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a700:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a704:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a708:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a70c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a710:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a714:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a718:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a71c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a720:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a724:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a728:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80a72c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a730:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a733:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  80a737:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a73e:	00 
	int i,length = 0;
  80a73f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  80a746:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a74d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a74e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a752:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a755:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a759:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a75d:	48 99                	cqo    
  80a75f:	48 f7 fe             	idiv   rsi
  80a762:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a765:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a769:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a76c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a770:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a774:	48 99                	cqo    
  80a776:	48 f7 f9             	idiv   rcx
  80a779:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a77d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a781:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a785:	be 00 00 00 00       	mov    esi,0x0
  80a78a:	48 89 c7             	mov    rdi,rax
  80a78d:	b8 00 00 00 00       	mov    eax,0x0
  80a792:	e8 b6 6a ff ff       	call   80124d <vmalloc>
  80a797:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80a79b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a7a0:	75 0c                	jne    80a7ae <FAT32_read+0xca>
		return -EFAULT;
  80a7a2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80a7a9:	e9 f0 01 00 00       	jmp    80a99e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80a7ae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a7b5:	eb 1e                	jmp    80a7d5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a7b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7bb:	89 c2                	mov    edx,eax
  80a7bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a7c1:	89 d6                	mov    esi,edx
  80a7c3:	48 89 c7             	mov    rdi,rax
  80a7c6:	e8 ea fc ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80a7cb:	89 c0                	mov    eax,eax
  80a7cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  80a7d1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a7d5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a7d8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a7db:	7c da                	jl     80a7b7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80a7dd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a7e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a7e4:	48 89 c2             	mov    rdx,rax
  80a7e7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a7eb:	48 01 c2             	add    rdx,rax
  80a7ee:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a7f2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a7f6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a7fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a7fd:	48 39 c2             	cmp    rdx,rax
  80a800:	76 2c                	jbe    80a82e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  80a802:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a806:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a80a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a80e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a811:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a815:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a818:	48 89 c1             	mov    rcx,rax
  80a81b:	48 89 d0             	mov    rax,rdx
  80a81e:	48 29 c8             	sub    rax,rcx
  80a821:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80a825:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a829:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80a82c:	eb 07                	jmp    80a835 <FAT32_read+0x151>
	else
		index = count;
  80a82e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a832:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  80a835:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a839:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a83d:	89 c2                	mov    edx,eax
  80a83f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a843:	be 00 00 00 00       	mov    esi,0x0
  80a848:	48 89 c7             	mov    rdi,rax
  80a84b:	e8 c9 27 00 00       	call   80d019 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a850:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a854:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a858:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a85c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a860:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a864:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a868:	48 0f af c2          	imul   rax,rdx
  80a86c:	48 01 c8             	add    rax,rcx
  80a86f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a873:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a877:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a87b:	89 c1                	mov    ecx,eax
  80a87d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a881:	89 c2                	mov    edx,eax
  80a883:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a887:	49 89 c0             	mov    r8,rax
  80a88a:	be 00 00 00 00       	mov    esi,0x0
  80a88f:	bf 00 00 00 00       	mov    edi,0x0
  80a894:	e8 74 ef ff ff       	call   80980d <request>
  80a899:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80a89c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a89f:	89 c7                	mov    edi,eax
  80a8a1:	e8 1b f6 ff ff       	call   809ec1 <chk_result>
  80a8a6:	85 c0                	test   eax,eax
  80a8a8:	75 1c                	jne    80a8c6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80a8aa:	bf 68 5b 81 00       	mov    edi,0x815b68
  80a8af:	b8 00 00 00 00       	mov    eax,0x0
  80a8b4:	e8 be 64 ff ff       	call   800d77 <printf>
			retval = -EIO;
  80a8b9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  80a8c0:	ff 
			break;
  80a8c1:	e9 ba 00 00 00       	jmp    80a980 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80a8c6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a8c9:	48 63 d0             	movsxd rdx,eax
  80a8cc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a8d0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a8d4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  80a8d8:	48 39 c2             	cmp    rdx,rax
  80a8db:	48 0f 4e c2          	cmovle rax,rdx
  80a8df:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  80a8e2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a8e6:	48 83 f8 1f          	cmp    rax,0x1f
  80a8ea:	77 1f                	ja     80a90b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80a8ec:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a8ef:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a8f3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a8f7:	48 01 c1             	add    rcx,rax
  80a8fa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a8fe:	48 89 c6             	mov    rsi,rax
  80a901:	48 89 cf             	mov    rdi,rcx
  80a904:	e8 61 26 00 00       	call   80cf6a <memcpy>
  80a909:	eb 1d                	jmp    80a928 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80a90b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a90e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a912:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a916:	48 01 c1             	add    rcx,rax
  80a919:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a91d:	48 89 c6             	mov    rsi,rax
  80a920:	48 89 cf             	mov    rdi,rcx
  80a923:	e8 42 26 00 00       	call   80cf6a <memcpy>

		index -= length;
  80a928:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a92b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80a92e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a931:	48 98                	cdqe   
  80a933:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  80a937:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a93e:	00 
		*position += length;
  80a93f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a943:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a946:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a949:	48 98                	cdqe   
  80a94b:	48 01 c2             	add    rdx,rax
  80a94e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a952:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  80a955:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a959:	74 25                	je     80a980 <FAT32_read+0x29c>
  80a95b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a95f:	89 c2                	mov    edx,eax
  80a961:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a965:	89 d6                	mov    esi,edx
  80a967:	48 89 c7             	mov    rdi,rax
  80a96a:	e8 46 fb ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80a96f:	89 c0                	mov    eax,eax
  80a971:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a975:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a97a:	0f 85 b5 fe ff ff    	jne    80a835 <FAT32_read+0x151>

	vmfree(buffer);
  80a980:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a984:	48 89 c7             	mov    rdi,rax
  80a987:	e8 61 69 ff ff       	call   8012ed <vmfree>
	if(!index)
  80a98c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a990:	75 08                	jne    80a99a <FAT32_read+0x2b6>
		retval = count;
  80a992:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a996:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80a99a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80a99e:	c9                   	leave  
  80a99f:	c3                   	ret    

000000000080a9a0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  80a9a0:	f3 0f 1e fa          	endbr64 
  80a9a4:	55                   	push   rbp
  80a9a5:	48 89 e5             	mov    rbp,rsp
  80a9a8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80a9af:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  80a9b6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a9bd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a9c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  80a9c5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a9cc:	e9 8b 00 00 00       	jmp    80aa5c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  80a9d1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a9d8:	ba 00 02 00 00       	mov    edx,0x200
  80a9dd:	be 00 00 00 00       	mov    esi,0x0
  80a9e2:	48 89 c7             	mov    rdi,rax
  80a9e5:	e8 2f 26 00 00       	call   80d019 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80a9ea:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a9f1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9f5:	89 c2                	mov    edx,eax
  80a9f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a9fa:	01 d0                	add    eax,edx
  80a9fc:	89 c2                	mov    edx,eax
  80a9fe:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80aa05:	49 89 c0             	mov    r8,rax
  80aa08:	b9 01 00 00 00       	mov    ecx,0x1
  80aa0d:	be 00 00 00 00       	mov    esi,0x0
  80aa12:	bf 00 00 00 00       	mov    edi,0x0
  80aa17:	e8 f1 ed ff ff       	call   80980d <request>
  80aa1c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80aa1f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80aa26:	eb 2a                	jmp    80aa52 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  80aa28:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80aa2b:	48 98                	cdqe   
  80aa2d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  80aa34:	25 ff ff ff 0f       	and    eax,0xfffffff
  80aa39:	85 c0                	test   eax,eax
  80aa3b:	75 11                	jne    80aa4e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80aa3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80aa40:	c1 e0 07             	shl    eax,0x7
  80aa43:	89 c2                	mov    edx,eax
  80aa45:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80aa48:	01 d0                	add    eax,edx
  80aa4a:	48 98                	cdqe   
  80aa4c:	eb 22                	jmp    80aa70 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  80aa4e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80aa52:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  80aa56:	7e d0                	jle    80aa28 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  80aa58:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80aa5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80aa5f:	48 98                	cdqe   
  80aa61:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80aa65:	0f 87 66 ff ff ff    	ja     80a9d1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  80aa6b:	b8 00 00 00 00       	mov    eax,0x0
}
  80aa70:	c9                   	leave  
  80aa71:	c3                   	ret    

000000000080aa72 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  80aa72:	f3 0f 1e fa          	endbr64 
  80aa76:	55                   	push   rbp
  80aa77:	48 89 e5             	mov    rbp,rsp
  80aa7a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  80aa81:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  80aa85:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  80aa89:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  80aa90:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80aa97:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aa9b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa9f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aaa3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aaa7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80aaab:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aaaf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aab3:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aab7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aabb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aabf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  80aac3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aac7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aaca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80aace:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80aad5:	00 
	unsigned long sector = 0;
  80aad6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aadd:	00 
	int i,length = 0;
  80aade:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  80aae5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80aaec:	00 
	long flags = 0;
  80aaed:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80aaf4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80aaf5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80aafc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aaff:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80ab03:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80ab07:	48 99                	cqo    
  80ab09:	48 f7 fe             	idiv   rsi
  80ab0c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80ab0f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ab16:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab19:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80ab1d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80ab21:	48 99                	cqo    
  80ab23:	48 f7 f9             	idiv   rcx
  80ab26:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80ab2a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab2e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ab32:	be 00 00 00 00       	mov    esi,0x0
  80ab37:	48 89 c7             	mov    rdi,rax
  80ab3a:	b8 00 00 00 00       	mov    eax,0x0
  80ab3f:	e8 09 67 ff ff       	call   80124d <vmalloc>
  80ab44:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  80ab48:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80ab4d:	75 1a                	jne    80ab69 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80ab4f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab53:	48 89 c7             	mov    rdi,rax
  80ab56:	e8 45 fe ff ff       	call   80a9a0 <FAT32_find_available_cluster>
  80ab5b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80ab5f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80ab66:	00 
  80ab67:	eb 2f                	jmp    80ab98 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  80ab69:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80ab70:	eb 1e                	jmp    80ab90 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80ab72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab76:	89 c2                	mov    edx,eax
  80ab78:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab7c:	89 d6                	mov    esi,edx
  80ab7e:	48 89 c7             	mov    rdi,rax
  80ab81:	e8 2f f9 ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80ab86:	89 c0                	mov    eax,eax
  80ab88:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80ab8c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80ab90:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ab93:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  80ab96:	7c da                	jl     80ab72 <FAT32_write+0x100>

	if(!cluster)
  80ab98:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80ab9d:	75 18                	jne    80abb7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80ab9f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aba3:	48 89 c7             	mov    rdi,rax
  80aba6:	e8 42 67 ff ff       	call   8012ed <vmfree>
		return -ENOSPC;
  80abab:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80abb2:	e9 13 03 00 00       	jmp    80aeca <FAT32_write+0x458>
	}

	if(flags)
  80abb7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80abbc:	74 4d                	je     80ac0b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80abbe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80abc2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80abc6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80abc9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80abcd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abd1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80abd5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80abd9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80abdd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80abe1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80abe5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abe9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80abed:	48 89 c7             	mov    rdi,rax
  80abf0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  80abf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80abf6:	89 c1                	mov    ecx,eax
  80abf8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abfc:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80ac01:	89 ce                	mov    esi,ecx
  80ac03:	48 89 c7             	mov    rdi,rax
  80ac06:	e8 66 f9 ff ff       	call   80a571 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80ac0b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80ac12:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  80ac15:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80ac1a:	0f 85 91 00 00 00    	jne    80acb1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  80ac20:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac24:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ac28:	89 c2                	mov    edx,eax
  80ac2a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ac2e:	be 00 00 00 00       	mov    esi,0x0
  80ac33:	48 89 c7             	mov    rdi,rax
  80ac36:	e8 de 23 00 00       	call   80d019 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80ac3b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac3f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80ac43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac47:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80ac4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac4f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac53:	48 0f af c2          	imul   rax,rdx
  80ac57:	48 01 c8             	add    rax,rcx
  80ac5a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80ac5e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac62:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac66:	89 c1                	mov    ecx,eax
  80ac68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac6c:	89 c2                	mov    edx,eax
  80ac6e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ac72:	49 89 c0             	mov    r8,rax
  80ac75:	be 00 00 00 00       	mov    esi,0x0
  80ac7a:	bf 00 00 00 00       	mov    edi,0x0
  80ac7f:	e8 89 eb ff ff       	call   80980d <request>
  80ac84:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  80ac87:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80ac8a:	89 c7                	mov    edi,eax
  80ac8c:	e8 30 f2 ff ff       	call   809ec1 <chk_result>
  80ac91:	85 c0                	test   eax,eax
  80ac93:	75 1c                	jne    80acb1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  80ac95:	bf 98 5b 81 00       	mov    edi,0x815b98
  80ac9a:	b8 00 00 00 00       	mov    eax,0x0
  80ac9f:	e8 d3 60 ff ff       	call   800d77 <printf>
				retval = -EIO;
  80aca4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80acab:	ff 
				break;
  80acac:	e9 95 01 00 00       	jmp    80ae46 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80acb1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80acb4:	48 63 d0             	movsxd rdx,eax
  80acb7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80acbb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80acbf:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  80acc3:	48 39 c2             	cmp    rdx,rax
  80acc6:	48 0f 4e c2          	cmovle rax,rdx
  80acca:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80accd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80acd1:	48 83 f8 1f          	cmp    rax,0x1f
  80acd5:	77 1f                	ja     80acf6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  80acd7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80acda:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80acde:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ace2:	48 01 c1             	add    rcx,rax
  80ace5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80ace9:	48 89 ce             	mov    rsi,rcx
  80acec:	48 89 c7             	mov    rdi,rax
  80acef:	e8 76 22 00 00       	call   80cf6a <memcpy>
  80acf4:	eb 1d                	jmp    80ad13 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  80acf6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80acf9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80acfd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad01:	48 01 c1             	add    rcx,rax
  80ad04:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80ad08:	48 89 ce             	mov    rsi,rcx
  80ad0b:	48 89 c7             	mov    rdi,rax
  80ad0e:	e8 57 22 00 00       	call   80cf6a <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80ad13:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ad17:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad1b:	89 c1                	mov    ecx,eax
  80ad1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ad21:	89 c2                	mov    edx,eax
  80ad23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad27:	49 89 c0             	mov    r8,rax
  80ad2a:	be 01 00 00 00       	mov    esi,0x1
  80ad2f:	bf 00 00 00 00       	mov    edi,0x0
  80ad34:	e8 d4 ea ff ff       	call   80980d <request>
  80ad39:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80ad3c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80ad3f:	89 c7                	mov    edi,eax
  80ad41:	e8 7b f1 ff ff       	call   809ec1 <chk_result>
  80ad46:	85 c0                	test   eax,eax
  80ad48:	75 1c                	jne    80ad66 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80ad4a:	bf c8 5b 81 00       	mov    edi,0x815bc8
  80ad4f:	b8 00 00 00 00       	mov    eax,0x0
  80ad54:	e8 1e 60 ff ff       	call   800d77 <printf>
			retval = -EIO;
  80ad59:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80ad60:	ff 
			break;
  80ad61:	e9 e0 00 00 00       	jmp    80ae46 <FAT32_write+0x3d4>
		}

		index -= length;
  80ad66:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad69:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80ad6c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad6f:	48 98                	cdqe   
  80ad71:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  80ad75:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80ad7c:	00 
		*position += length;
  80ad7d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad84:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ad87:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad8a:	48 98                	cdqe   
  80ad8c:	48 01 c2             	add    rdx,rax
  80ad8f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad96:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  80ad99:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ad9d:	0f 84 a2 00 00 00    	je     80ae45 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80ada3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ada7:	89 c2                	mov    edx,eax
  80ada9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adad:	89 d6                	mov    esi,edx
  80adaf:	48 89 c7             	mov    rdi,rax
  80adb2:	e8 fe f6 ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80adb7:	89 c0                	mov    eax,eax
  80adb9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80adbd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  80adc4:	0f 
  80adc5:	76 72                	jbe    80ae39 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  80adc7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adcb:	48 89 c7             	mov    rdi,rax
  80adce:	e8 cd fb ff ff       	call   80a9a0 <FAT32_find_available_cluster>
  80add3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  80add7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80addc:	75 18                	jne    80adf6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80adde:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ade2:	48 89 c7             	mov    rdi,rax
  80ade5:	e8 03 65 ff ff       	call   8012ed <vmfree>
				return -ENOSPC;
  80adea:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80adf1:	e9 d4 00 00 00       	jmp    80aeca <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  80adf6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80adfa:	89 c2                	mov    edx,eax
  80adfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae00:	89 c1                	mov    ecx,eax
  80ae02:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae06:	89 ce                	mov    esi,ecx
  80ae08:	48 89 c7             	mov    rdi,rax
  80ae0b:	e8 61 f7 ff ff       	call   80a571 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  80ae10:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ae14:	89 c1                	mov    ecx,eax
  80ae16:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae1a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80ae1f:	89 ce                	mov    esi,ecx
  80ae21:	48 89 c7             	mov    rdi,rax
  80ae24:	e8 48 f7 ff ff       	call   80a571 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  80ae29:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ae2d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  80ae31:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80ae38:	00 
		}

	}while(index);
  80ae39:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ae3d:	0f 85 d2 fd ff ff    	jne    80ac15 <FAT32_write+0x1a3>
  80ae43:	eb 01                	jmp    80ae46 <FAT32_write+0x3d4>
			break;
  80ae45:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  80ae46:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ae4d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae50:	48 89 c2             	mov    rdx,rax
  80ae53:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae57:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae5b:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae5f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae62:	48 39 c2             	cmp    rdx,rax
  80ae65:	76 42                	jbe    80aea9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  80ae67:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ae6e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae71:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae75:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae79:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae7d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80ae80:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae84:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae88:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae8c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ae90:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80ae94:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80ae98:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae9c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aea0:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aea4:	48 89 c7             	mov    rdi,rax
  80aea7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  80aea9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aead:	48 89 c7             	mov    rdi,rax
  80aeb0:	e8 38 64 ff ff       	call   8012ed <vmfree>
	if(!index)
  80aeb5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80aeb9:	75 0b                	jne    80aec6 <FAT32_write+0x454>
		retval = count;
  80aebb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80aec2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  80aec6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80aeca:	c9                   	leave  
  80aecb:	c3                   	ret    

000000000080aecc <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80aecc:	f3 0f 1e fa          	endbr64 
  80aed0:	55                   	push   rbp
  80aed1:	48 89 e5             	mov    rbp,rsp
  80aed4:	48 83 ec 30          	sub    rsp,0x30
  80aed8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80aedc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80aee0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  80aee4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aee8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aeec:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aef0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  80aef4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80aefb:	00 

	switch(origin)
  80aefc:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80af01:	74 21                	je     80af24 <FAT32_lseek+0x58>
  80af03:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80af08:	7f 4a                	jg     80af54 <FAT32_lseek+0x88>
  80af0a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80af0f:	74 09                	je     80af1a <FAT32_lseek+0x4e>
  80af11:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  80af16:	74 20                	je     80af38 <FAT32_lseek+0x6c>
  80af18:	eb 3a                	jmp    80af54 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80af1a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af1e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80af22:	eb 39                	jmp    80af5d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  80af24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af28:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80af2b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af2f:	48 01 d0             	add    rax,rdx
  80af32:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80af36:	eb 25                	jmp    80af5d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  80af38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af3c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80af40:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80af44:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80af47:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af4b:	48 01 d0             	add    rax,rdx
  80af4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80af52:	eb 09                	jmp    80af5d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  80af54:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80af5b:	eb 50                	jmp    80afad <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80af5d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80af62:	78 18                	js     80af7c <FAT32_lseek+0xb0>
  80af64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af68:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80af6c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80af70:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80af73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af77:	48 39 c2             	cmp    rdx,rax
  80af7a:	73 09                	jae    80af85 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80af7c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  80af83:	eb 28                	jmp    80afad <FAT32_lseek+0xe1>

	filp->position = pos;
  80af85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af89:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80af8d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  80af90:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af97:	48 89 c6             	mov    rsi,rax
  80af9a:	bf f8 5b 81 00       	mov    edi,0x815bf8
  80af9f:	b8 00 00 00 00       	mov    eax,0x0
  80afa4:	e8 ce 5d ff ff       	call   800d77 <printf>

	return pos;
  80afa9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80afad:	c9                   	leave  
  80afae:	c3                   	ret    

000000000080afaf <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80afaf:	f3 0f 1e fa          	endbr64 
  80afb3:	55                   	push   rbp
  80afb4:	48 89 e5             	mov    rbp,rsp
  80afb7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80afbb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80afbf:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80afc3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80afc7:	90                   	nop
  80afc8:	5d                   	pop    rbp
  80afc9:	c3                   	ret    

000000000080afca <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80afca:	f3 0f 1e fa          	endbr64 
  80afce:	55                   	push   rbp
  80afcf:	48 89 e5             	mov    rbp,rsp
  80afd2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80afd6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80afda:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80afde:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80afe2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80afe6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afea:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80afee:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aff2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80aff6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80affa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80affe:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80b002:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b006:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b00a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80b00e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80b015:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80b01c:	00 
	unsigned char * buf =NULL; 
  80b01d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  80b024:	00 
	char *name = NULL;
  80b025:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80b02c:	00 
	int namelen = 0;
  80b02d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  80b034:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80b03b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  80b042:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b049:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80b050:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80b057:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80b058:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80b05f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b060:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b064:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b068:	be 00 00 00 00       	mov    esi,0x0
  80b06d:	48 89 c7             	mov    rdi,rax
  80b070:	b8 00 00 00 00       	mov    eax,0x0
  80b075:	e8 d3 61 ff ff       	call   80124d <vmalloc>
  80b07a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80b07e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b082:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b085:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  80b088:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b08c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b08f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b093:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80b097:	48 99                	cqo    
  80b099:	48 f7 fe             	idiv   rsi
  80b09c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80b09f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80b0a6:	eb 3a                	jmp    80b0e2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b0a8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b0ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b0af:	89 d6                	mov    esi,edx
  80b0b1:	48 89 c7             	mov    rdi,rax
  80b0b4:	e8 fc f3 ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80b0b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80b0bc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  80b0c3:	76 19                	jbe    80b0de <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  80b0c5:	bf 20 5c 81 00       	mov    edi,0x815c20
  80b0ca:	b8 00 00 00 00       	mov    eax,0x0
  80b0cf:	e8 a3 5c ff ff       	call   800d77 <printf>
			return NULL;
  80b0d4:	b8 00 00 00 00       	mov    eax,0x0
  80b0d9:	e9 86 05 00 00       	jmp    80b664 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80b0de:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80b0e2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b0e5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80b0e8:	7c be                	jl     80b0a8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80b0ea:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b0eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b0ef:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b0f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b0f6:	83 e8 02             	sub    eax,0x2
  80b0f9:	89 c1                	mov    ecx,eax
  80b0fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b0ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b103:	48 0f af c1          	imul   rax,rcx
  80b107:	48 01 d0             	add    rax,rdx
  80b10a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b10e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b112:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b116:	89 c1                	mov    ecx,eax
  80b118:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b11c:	89 c2                	mov    edx,eax
  80b11e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b122:	49 89 c0             	mov    r8,rax
  80b125:	be 00 00 00 00       	mov    esi,0x0
  80b12a:	bf 00 00 00 00       	mov    edi,0x0
  80b12f:	e8 d9 e6 ff ff       	call   80980d <request>
  80b134:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  80b137:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80b13a:	89 c7                	mov    edi,eax
  80b13c:	e8 80 ed ff ff       	call   809ec1 <chk_result>
  80b141:	85 c0                	test   eax,eax
  80b143:	75 25                	jne    80b16a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  80b145:	bf 48 5c 81 00       	mov    edi,0x815c48
  80b14a:	b8 00 00 00 00       	mov    eax,0x0
  80b14f:	e8 23 5c ff ff       	call   800d77 <printf>
		vmfree(buf);
  80b154:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b158:	48 89 c7             	mov    rdi,rax
  80b15b:	e8 8d 61 ff ff       	call   8012ed <vmfree>
		return NULL;
  80b160:	b8 00 00 00 00       	mov    eax,0x0
  80b165:	e9 fa 04 00 00       	jmp    80b664 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80b16a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b16e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b171:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b175:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b179:	48 99                	cqo    
  80b17b:	48 f7 f9             	idiv   rcx
  80b17e:	48 89 d0             	mov    rax,rdx
  80b181:	48 89 c2             	mov    rdx,rax
  80b184:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b188:	48 01 d0             	add    rax,rdx
  80b18b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b18f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b193:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b196:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b19a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b19e:	48 99                	cqo    
  80b1a0:	48 f7 f9             	idiv   rcx
  80b1a3:	48 89 d0             	mov    rax,rdx
  80b1a6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  80b1a9:	e9 2f 04 00 00       	jmp    80b5dd <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b1ae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1b2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b1b6:	3c 0f                	cmp    al,0xf
  80b1b8:	0f 84 00 04 00 00    	je     80b5be <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b1be:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1c5:	3c e5                	cmp    al,0xe5
  80b1c7:	0f 84 f4 03 00 00    	je     80b5c1 <FAT32_readdir+0x5f7>
  80b1cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1d4:	84 c0                	test   al,al
  80b1d6:	0f 84 e5 03 00 00    	je     80b5c1 <FAT32_readdir+0x5f7>
  80b1dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1e3:	3c 05                	cmp    al,0x5
  80b1e5:	0f 84 d6 03 00 00    	je     80b5c1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80b1eb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b1f2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1f6:	48 83 e8 20          	sub    rax,0x20
  80b1fa:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b1fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b202:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b206:	3c 0f                	cmp    al,0xf
  80b208:	0f 85 2a 02 00 00    	jne    80b438 <FAT32_readdir+0x46e>
  80b20e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b212:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b215:	3c e5                	cmp    al,0xe5
  80b217:	0f 84 1b 02 00 00    	je     80b438 <FAT32_readdir+0x46e>
  80b21d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b221:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b224:	84 c0                	test   al,al
  80b226:	0f 84 0c 02 00 00    	je     80b438 <FAT32_readdir+0x46e>
  80b22c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b230:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b233:	3c 05                	cmp    al,0x5
  80b235:	0f 84 fd 01 00 00    	je     80b438 <FAT32_readdir+0x46e>
		{
			j = 0;
  80b23b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b242:	eb 1a                	jmp    80b25e <FAT32_readdir+0x294>
			{
				j++;
  80b244:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  80b248:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b24c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b24f:	0f b6 c0             	movzx  eax,al
  80b252:	83 e0 40             	and    eax,0x40
  80b255:	85 c0                	test   eax,eax
  80b257:	75 34                	jne    80b28d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  80b259:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b25e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b262:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b266:	3c 0f                	cmp    al,0xf
  80b268:	75 24                	jne    80b28e <FAT32_readdir+0x2c4>
  80b26a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b26e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b271:	3c e5                	cmp    al,0xe5
  80b273:	74 19                	je     80b28e <FAT32_readdir+0x2c4>
  80b275:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b279:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b27c:	84 c0                	test   al,al
  80b27e:	74 0e                	je     80b28e <FAT32_readdir+0x2c4>
  80b280:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b284:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b287:	3c 05                	cmp    al,0x5
  80b289:	75 b9                	jne    80b244 <FAT32_readdir+0x27a>
  80b28b:	eb 01                	jmp    80b28e <FAT32_readdir+0x2c4>
					break;
  80b28d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80b28e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b291:	89 d0                	mov    eax,edx
  80b293:	01 c0                	add    eax,eax
  80b295:	01 d0                	add    eax,edx
  80b297:	c1 e0 02             	shl    eax,0x2
  80b29a:	01 d0                	add    eax,edx
  80b29c:	83 c0 01             	add    eax,0x1
  80b29f:	be 00 00 00 00       	mov    esi,0x0
  80b2a4:	89 c7                	mov    edi,eax
  80b2a6:	b8 00 00 00 00       	mov    eax,0x0
  80b2ab:	e8 9d 5f ff ff       	call   80124d <vmalloc>
  80b2b0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  80b2b4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b2b7:	89 d0                	mov    eax,edx
  80b2b9:	01 c0                	add    eax,eax
  80b2bb:	01 d0                	add    eax,edx
  80b2bd:	c1 e0 02             	shl    eax,0x2
  80b2c0:	01 d0                	add    eax,edx
  80b2c2:	83 c0 01             	add    eax,0x1
  80b2c5:	89 c2                	mov    edx,eax
  80b2c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b2cb:	be 00 00 00 00       	mov    esi,0x0
  80b2d0:	48 89 c7             	mov    rdi,rax
  80b2d3:	e8 41 1d 00 00       	call   80d019 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b2d8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b2dc:	48 83 e8 20          	sub    rax,0x20
  80b2e0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  80b2e4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b2eb:	e9 37 01 00 00       	jmp    80b427 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  80b2f0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b2f7:	eb 53                	jmp    80b34c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b2f9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2fd:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b300:	48 63 d2             	movsxd rdx,edx
  80b303:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b308:	66 83 f8 ff          	cmp    ax,0xffff
  80b30c:	74 3a                	je     80b348 <FAT32_readdir+0x37e>
  80b30e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b312:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b315:	48 63 d2             	movsxd rdx,edx
  80b318:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b31d:	66 85 c0             	test   ax,ax
  80b320:	74 26                	je     80b348 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  80b322:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b326:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b329:	48 63 d2             	movsxd rdx,edx
  80b32c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b331:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b334:	8d 50 01             	lea    edx,[rax+0x1]
  80b337:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b33a:	48 63 d0             	movsxd rdx,eax
  80b33d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b341:	48 01 d0             	add    rax,rdx
  80b344:	89 ca                	mov    edx,ecx
  80b346:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  80b348:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b34c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  80b350:	7e a7                	jle    80b2f9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  80b352:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b359:	eb 53                	jmp    80b3ae <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b35b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b35f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b362:	48 63 d2             	movsxd rdx,edx
  80b365:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b36a:	66 83 f8 ff          	cmp    ax,0xffff
  80b36e:	74 3a                	je     80b3aa <FAT32_readdir+0x3e0>
  80b370:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b374:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b377:	48 63 d2             	movsxd rdx,edx
  80b37a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b37f:	66 85 c0             	test   ax,ax
  80b382:	74 26                	je     80b3aa <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  80b384:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b388:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b38b:	48 63 d2             	movsxd rdx,edx
  80b38e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b393:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b396:	8d 50 01             	lea    edx,[rax+0x1]
  80b399:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b39c:	48 63 d0             	movsxd rdx,eax
  80b39f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b3a3:	48 01 d0             	add    rax,rdx
  80b3a6:	89 ca                	mov    edx,ecx
  80b3a8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80b3aa:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b3ae:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  80b3b2:	7e a7                	jle    80b35b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  80b3b4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b3bb:	eb 5b                	jmp    80b418 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b3bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b3c1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b3c4:	48 63 d2             	movsxd rdx,edx
  80b3c7:	48 83 c2 08          	add    rdx,0x8
  80b3cb:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b3d0:	66 83 f8 ff          	cmp    ax,0xffff
  80b3d4:	74 3e                	je     80b414 <FAT32_readdir+0x44a>
  80b3d6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b3da:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b3dd:	48 63 d2             	movsxd rdx,edx
  80b3e0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b3e5:	66 85 c0             	test   ax,ax
  80b3e8:	74 2a                	je     80b414 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80b3ea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b3ee:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b3f1:	48 63 d2             	movsxd rdx,edx
  80b3f4:	48 83 c2 08          	add    rdx,0x8
  80b3f8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b3fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b400:	8d 50 01             	lea    edx,[rax+0x1]
  80b403:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b406:	48 63 d0             	movsxd rdx,eax
  80b409:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b40d:	48 01 d0             	add    rax,rdx
  80b410:	89 ca                	mov    edx,ecx
  80b412:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  80b414:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b418:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80b41c:	7e 9f                	jle    80b3bd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80b41e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b422:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  80b427:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b42a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80b42d:	0f 8c bd fe ff ff    	jl     80b2f0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  80b433:	e9 f5 01 00 00       	jmp    80b62d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  80b438:	be 00 00 00 00       	mov    esi,0x0
  80b43d:	bf 0f 00 00 00       	mov    edi,0xf
  80b442:	b8 00 00 00 00       	mov    eax,0x0
  80b447:	e8 01 5e ff ff       	call   80124d <vmalloc>
  80b44c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  80b450:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b454:	ba 0f 00 00 00       	mov    edx,0xf
  80b459:	be 00 00 00 00       	mov    esi,0x0
  80b45e:	48 89 c7             	mov    rdi,rax
  80b461:	e8 b3 1b 00 00       	call   80d019 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  80b466:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b46d:	eb 74                	jmp    80b4e3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b46f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b473:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b476:	48 98                	cdqe   
  80b478:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b47c:	3c 20                	cmp    al,0x20
  80b47e:	74 6b                	je     80b4eb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80b480:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b484:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b488:	0f b6 c0             	movzx  eax,al
  80b48b:	83 e0 08             	and    eax,0x8
  80b48e:	85 c0                	test   eax,eax
  80b490:	74 29                	je     80b4bb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b492:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b496:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b499:	48 98                	cdqe   
  80b49b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b49f:	8d 48 20             	lea    ecx,[rax+0x20]
  80b4a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b4a5:	8d 50 01             	lea    edx,[rax+0x1]
  80b4a8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b4ab:	48 63 d0             	movsxd rdx,eax
  80b4ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4b2:	48 01 d0             	add    rax,rdx
  80b4b5:	89 ca                	mov    edx,ecx
  80b4b7:	88 10                	mov    BYTE PTR [rax],dl
  80b4b9:	eb 24                	jmp    80b4df <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b4bb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b4bf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b4c2:	48 98                	cdqe   
  80b4c4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b4c8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b4cb:	8d 50 01             	lea    edx,[rax+0x1]
  80b4ce:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b4d1:	48 63 d0             	movsxd rdx,eax
  80b4d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4d8:	48 01 d0             	add    rax,rdx
  80b4db:	89 ca                	mov    edx,ecx
  80b4dd:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80b4df:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b4e3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  80b4e7:	7e 86                	jle    80b46f <FAT32_readdir+0x4a5>
  80b4e9:	eb 01                	jmp    80b4ec <FAT32_readdir+0x522>
				break;
  80b4eb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80b4ec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b4f0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b4f4:	0f b6 c0             	movzx  eax,al
  80b4f7:	83 e0 10             	and    eax,0x10
  80b4fa:	85 c0                	test   eax,eax
  80b4fc:	0f 85 27 01 00 00    	jne    80b629 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  80b502:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b505:	8d 50 01             	lea    edx,[rax+0x1]
  80b508:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b50b:	48 63 d0             	movsxd rdx,eax
  80b50e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b512:	48 01 d0             	add    rax,rdx
  80b515:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  80b518:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80b51f:	eb 74                	jmp    80b595 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b521:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b525:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b528:	48 98                	cdqe   
  80b52a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b52e:	3c 20                	cmp    al,0x20
  80b530:	74 6b                	je     80b59d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80b532:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b536:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b53a:	0f b6 c0             	movzx  eax,al
  80b53d:	83 e0 10             	and    eax,0x10
  80b540:	85 c0                	test   eax,eax
  80b542:	74 29                	je     80b56d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b544:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b548:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b54b:	48 98                	cdqe   
  80b54d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b551:	8d 48 20             	lea    ecx,[rax+0x20]
  80b554:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b557:	8d 50 01             	lea    edx,[rax+0x1]
  80b55a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b55d:	48 63 d0             	movsxd rdx,eax
  80b560:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b564:	48 01 d0             	add    rax,rdx
  80b567:	89 ca                	mov    edx,ecx
  80b569:	88 10                	mov    BYTE PTR [rax],dl
  80b56b:	eb 24                	jmp    80b591 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b56d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b571:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b574:	48 98                	cdqe   
  80b576:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b57a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b57d:	8d 50 01             	lea    edx,[rax+0x1]
  80b580:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b583:	48 63 d0             	movsxd rdx,eax
  80b586:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b58a:	48 01 d0             	add    rax,rdx
  80b58d:	89 ca                	mov    edx,ecx
  80b58f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80b591:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b595:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80b599:	7e 86                	jle    80b521 <FAT32_readdir+0x557>
  80b59b:	eb 01                	jmp    80b59e <FAT32_readdir+0x5d4>
				break;
  80b59d:	90                   	nop
		}
		if(x == 8)
  80b59e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80b5a2:	0f 85 84 00 00 00    	jne    80b62c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80b5a8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80b5ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b5af:	48 63 d0             	movsxd rdx,eax
  80b5b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5b6:	48 01 d0             	add    rax,rdx
  80b5b9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80b5bc:	eb 6e                	jmp    80b62c <FAT32_readdir+0x662>
			continue;
  80b5be:	90                   	nop
  80b5bf:	eb 01                	jmp    80b5c2 <FAT32_readdir+0x5f8>
			continue;
  80b5c1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b5c2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80b5c6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80b5cb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b5cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5d2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b5d6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b5da:	48 89 10             	mov    QWORD PTR [rax],rdx
  80b5dd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b5e0:	48 63 d0             	movsxd rdx,eax
  80b5e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b5e7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b5eb:	48 39 c2             	cmp    rdx,rax
  80b5ee:	0f 8c ba fb ff ff    	jl     80b1ae <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b5f4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b5f7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b5fb:	89 d6                	mov    esi,edx
  80b5fd:	48 89 c7             	mov    rdi,rax
  80b600:	e8 b0 ee ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80b605:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80b608:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80b60f:	77 05                	ja     80b616 <FAT32_readdir+0x64c>
		goto next_cluster;
  80b611:	e9 d5 fa ff ff       	jmp    80b0eb <FAT32_readdir+0x121>

	vmfree(buf);
  80b616:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b61a:	48 89 c7             	mov    rdi,rax
  80b61d:	e8 cb 5c ff ff       	call   8012ed <vmfree>
	return NULL;
  80b622:	b8 00 00 00 00       	mov    eax,0x0
  80b627:	eb 3b                	jmp    80b664 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80b629:	90                   	nop
  80b62a:	eb 01                	jmp    80b62d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80b62c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80b62d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b631:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b634:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b638:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b63c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80b63f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b642:	48 63 d0             	movsxd rdx,eax
  80b645:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80b649:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80b64d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80b651:	41 b8 00 00 00 00    	mov    r8d,0x0
  80b657:	b9 00 00 00 00       	mov    ecx,0x0
  80b65c:	48 89 c7             	mov    rdi,rax
  80b65f:	41 ff d1             	call   r9
  80b662:	48 98                	cdqe   
}
  80b664:	c9                   	leave  
  80b665:	c3                   	ret    

000000000080b666 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80b666:	f3 0f 1e fa          	endbr64 
  80b66a:	55                   	push   rbp
  80b66b:	48 89 e5             	mov    rbp,rsp
  80b66e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b672:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b676:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b679:	90                   	nop
  80b67a:	5d                   	pop    rbp
  80b67b:	c3                   	ret    

000000000080b67c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80b67c:	f3 0f 1e fa          	endbr64 
  80b680:	55                   	push   rbp
  80b681:	48 89 e5             	mov    rbp,rsp
  80b684:	48 83 ec 60          	sub    rsp,0x60
  80b688:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80b68c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80b690:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b694:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b698:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80b69c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b6a0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b6a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b6a8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80b6ac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80b6b3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80b6ba:	00 
	unsigned char * buf =NULL; 
  80b6bb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80b6c2:	00 
	int i = 0,j = 0,x = 0;
  80b6c3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b6ca:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b6d1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80b6d8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80b6df:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80b6e0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80b6e7:	00 
	struct index_node * p = NULL;
  80b6e8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80b6ef:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b6f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b6f4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b6f8:	be 00 00 00 00       	mov    esi,0x0
  80b6fd:	48 89 c7             	mov    rdi,rax
  80b700:	b8 00 00 00 00       	mov    eax,0x0
  80b705:	e8 43 5b ff ff       	call   80124d <vmalloc>
  80b70a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80b70e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b712:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b715:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b718:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b71c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b720:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b723:	83 e8 02             	sub    eax,0x2
  80b726:	89 c1                	mov    ecx,eax
  80b728:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b72c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b730:	48 0f af c1          	imul   rax,rcx
  80b734:	48 01 d0             	add    rax,rdx
  80b737:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:0x%x,sector:0x%x\r\n",cluster,sector);
  80b73b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b73f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b742:	89 c6                	mov    esi,eax
  80b744:	bf 78 5c 81 00       	mov    edi,0x815c78
  80b749:	b8 00 00 00 00       	mov    eax,0x0
  80b74e:	e8 24 56 ff ff       	call   800d77 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b753:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b757:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b75b:	89 c1                	mov    ecx,eax
  80b75d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b761:	89 c2                	mov    edx,eax
  80b763:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b767:	49 89 c0             	mov    r8,rax
  80b76a:	be 00 00 00 00       	mov    esi,0x0
  80b76f:	bf 00 00 00 00       	mov    edi,0x0
  80b774:	e8 94 e0 ff ff       	call   80980d <request>
  80b779:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80b77c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80b77f:	89 c7                	mov    edi,eax
  80b781:	e8 3b e7 ff ff       	call   809ec1 <chk_result>
  80b786:	85 c0                	test   eax,eax
  80b788:	75 25                	jne    80b7af <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80b78a:	bf a0 5c 81 00       	mov    edi,0x815ca0
  80b78f:	b8 00 00 00 00       	mov    eax,0x0
  80b794:	e8 de 55 ff ff       	call   800d77 <printf>
		vmfree(buf);
  80b799:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b79d:	48 89 c7             	mov    rdi,rax
  80b7a0:	e8 48 5b ff ff       	call   8012ed <vmfree>
		return NULL;
  80b7a5:	b8 00 00 00 00       	mov    eax,0x0
  80b7aa:	e9 f0 07 00 00       	jmp    80bf9f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80b7af:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b7b3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80b7b7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b7be:	e9 9d 05 00 00       	jmp    80bd60 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b7c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7c7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b7cb:	3c 0f                	cmp    al,0xf
  80b7cd:	0f 84 59 05 00 00    	je     80bd2c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b7d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7da:	3c e5                	cmp    al,0xe5
  80b7dc:	0f 84 4d 05 00 00    	je     80bd2f <FAT32_lookup+0x6b3>
  80b7e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7e9:	84 c0                	test   al,al
  80b7eb:	0f 84 3e 05 00 00    	je     80bd2f <FAT32_lookup+0x6b3>
  80b7f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7f8:	3c 05                	cmp    al,0x5
  80b7fa:	0f 84 2f 05 00 00    	je     80bd2f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b800:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b804:	48 83 e8 20          	sub    rax,0x20
  80b808:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80b80c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b813:	e9 88 01 00 00       	jmp    80b9a0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80b818:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b81f:	eb 6a                	jmp    80b88b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80b821:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b825:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b828:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b82b:	7e 15                	jle    80b842 <FAT32_lookup+0x1c6>
  80b82d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b831:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b834:	48 63 d2             	movsxd rdx,edx
  80b837:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b83c:	66 83 f8 ff          	cmp    ax,0xffff
  80b840:	74 44                	je     80b886 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80b842:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b846:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b849:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b84c:	0f 8f e0 04 00 00    	jg     80bd32 <FAT32_lookup+0x6b6>
  80b852:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b856:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b859:	48 63 d2             	movsxd rdx,edx
  80b85c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b861:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b865:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b868:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b86b:	8d 50 01             	lea    edx,[rax+0x1]
  80b86e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b871:	48 98                	cdqe   
  80b873:	48 01 f0             	add    rax,rsi
  80b876:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b879:	66 98                	cbw    
  80b87b:	66 39 c1             	cmp    cx,ax
  80b87e:	0f 85 ae 04 00 00    	jne    80bd32 <FAT32_lookup+0x6b6>
  80b884:	eb 01                	jmp    80b887 <FAT32_lookup+0x20b>
					continue;
  80b886:	90                   	nop
			for(x=0;x<5;x++)
  80b887:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b88b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80b88f:	7e 90                	jle    80b821 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80b891:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b898:	eb 6a                	jmp    80b904 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80b89a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b89e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b8a1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b8a4:	7e 15                	jle    80b8bb <FAT32_lookup+0x23f>
  80b8a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b8aa:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b8ad:	48 63 d2             	movsxd rdx,edx
  80b8b0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b8b5:	66 83 f8 ff          	cmp    ax,0xffff
  80b8b9:	74 44                	je     80b8ff <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80b8bb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b8bf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b8c2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b8c5:	0f 8f 6a 04 00 00    	jg     80bd35 <FAT32_lookup+0x6b9>
  80b8cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b8cf:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b8d2:	48 63 d2             	movsxd rdx,edx
  80b8d5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b8da:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b8de:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b8e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b8e4:	8d 50 01             	lea    edx,[rax+0x1]
  80b8e7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b8ea:	48 98                	cdqe   
  80b8ec:	48 01 f0             	add    rax,rsi
  80b8ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8f2:	66 98                	cbw    
  80b8f4:	66 39 c1             	cmp    cx,ax
  80b8f7:	0f 85 38 04 00 00    	jne    80bd35 <FAT32_lookup+0x6b9>
  80b8fd:	eb 01                	jmp    80b900 <FAT32_lookup+0x284>
					continue;
  80b8ff:	90                   	nop
			for(x=0;x<6;x++)
  80b900:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b904:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80b908:	7e 90                	jle    80b89a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80b90a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b911:	eb 72                	jmp    80b985 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80b913:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b917:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b91a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b91d:	7e 19                	jle    80b938 <FAT32_lookup+0x2bc>
  80b91f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b923:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b926:	48 63 d2             	movsxd rdx,edx
  80b929:	48 83 c2 08          	add    rdx,0x8
  80b92d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b932:	66 83 f8 ff          	cmp    ax,0xffff
  80b936:	74 48                	je     80b980 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80b938:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b93c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b93f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b942:	0f 8f f0 03 00 00    	jg     80bd38 <FAT32_lookup+0x6bc>
  80b948:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b94c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b94f:	48 63 d2             	movsxd rdx,edx
  80b952:	48 83 c2 08          	add    rdx,0x8
  80b956:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b95b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b95f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b962:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b965:	8d 50 01             	lea    edx,[rax+0x1]
  80b968:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b96b:	48 98                	cdqe   
  80b96d:	48 01 f0             	add    rax,rsi
  80b970:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b973:	66 98                	cbw    
  80b975:	66 39 c1             	cmp    cx,ax
  80b978:	0f 85 ba 03 00 00    	jne    80bd38 <FAT32_lookup+0x6bc>
  80b97e:	eb 01                	jmp    80b981 <FAT32_lookup+0x305>
					continue;
  80b980:	90                   	nop
			for(x=0;x<2;x++)
  80b981:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b985:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80b989:	7e 88                	jle    80b913 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80b98b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b98f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b992:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b995:	0f 8d 14 04 00 00    	jge    80bdaf <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80b99b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b9a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b9a4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b9a8:	3c 0f                	cmp    al,0xf
  80b9aa:	75 0f                	jne    80b9bb <FAT32_lookup+0x33f>
  80b9ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b9b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9b3:	3c e5                	cmp    al,0xe5
  80b9b5:	0f 85 5d fe ff ff    	jne    80b818 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80b9bb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80b9c2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b9c9:	e9 f4 01 00 00       	jmp    80bbc2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80b9ce:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b9d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b9d5:	48 98                	cdqe   
  80b9d7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b9db:	0f b6 c0             	movzx  eax,al
  80b9de:	83 f8 7a             	cmp    eax,0x7a
  80b9e1:	0f 8f d0 01 00 00    	jg     80bbb7 <FAT32_lookup+0x53b>
  80b9e7:	83 f8 61             	cmp    eax,0x61
  80b9ea:	0f 8d e6 00 00 00    	jge    80bad6 <FAT32_lookup+0x45a>
  80b9f0:	83 f8 5a             	cmp    eax,0x5a
  80b9f3:	0f 8f be 01 00 00    	jg     80bbb7 <FAT32_lookup+0x53b>
  80b9f9:	83 f8 41             	cmp    eax,0x41
  80b9fc:	0f 8d d4 00 00 00    	jge    80bad6 <FAT32_lookup+0x45a>
  80ba02:	83 f8 20             	cmp    eax,0x20
  80ba05:	74 1a                	je     80ba21 <FAT32_lookup+0x3a5>
  80ba07:	83 f8 20             	cmp    eax,0x20
  80ba0a:	0f 8c a7 01 00 00    	jl     80bbb7 <FAT32_lookup+0x53b>
  80ba10:	83 e8 30             	sub    eax,0x30
  80ba13:	83 f8 09             	cmp    eax,0x9
  80ba16:	0f 87 9b 01 00 00    	ja     80bbb7 <FAT32_lookup+0x53b>
  80ba1c:	e9 53 01 00 00       	jmp    80bb74 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80ba21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ba25:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80ba29:	0f b6 c0             	movzx  eax,al
  80ba2c:	83 e0 10             	and    eax,0x10
  80ba2f:	85 c0                	test   eax,eax
  80ba31:	75 50                	jne    80ba83 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80ba33:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba37:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ba3a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba3d:	48 98                	cdqe   
  80ba3f:	48 01 d0             	add    rax,rdx
  80ba42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba45:	3c 2e                	cmp    al,0x2e
  80ba47:	0f 84 70 01 00 00    	je     80bbbd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ba4d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba51:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba54:	48 98                	cdqe   
  80ba56:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ba5a:	0f b6 d0             	movzx  edx,al
  80ba5d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba61:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ba64:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba67:	48 98                	cdqe   
  80ba69:	48 01 c8             	add    rax,rcx
  80ba6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba6f:	0f be c0             	movsx  eax,al
  80ba72:	39 c2                	cmp    edx,eax
  80ba74:	0f 85 c1 02 00 00    	jne    80bd3b <FAT32_lookup+0x6bf>
						{
							j++;
  80ba7a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ba7e:	e9 3b 01 00 00       	jmp    80bbbe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ba83:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba87:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba8a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba8d:	7d 32                	jge    80bac1 <FAT32_lookup+0x445>
  80ba8f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba93:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba96:	48 98                	cdqe   
  80ba98:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ba9c:	0f b6 d0             	movzx  edx,al
  80ba9f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80baa3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80baa6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80baa9:	48 98                	cdqe   
  80baab:	48 01 c8             	add    rax,rcx
  80baae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bab1:	0f be c0             	movsx  eax,al
  80bab4:	39 c2                	cmp    edx,eax
  80bab6:	75 09                	jne    80bac1 <FAT32_lookup+0x445>
						{
							j++;
  80bab8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80babc:	e9 fd 00 00 00       	jmp    80bbbe <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80bac1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bac5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bac8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80bacb:	0f 85 6d 02 00 00    	jne    80bd3e <FAT32_lookup+0x6c2>
							continue;
  80bad1:	e9 e8 00 00 00       	jmp    80bbbe <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80bad6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bada:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80bade:	0f b6 c0             	movzx  eax,al
  80bae1:	83 e0 08             	and    eax,0x8
  80bae4:	85 c0                	test   eax,eax
  80bae6:	74 49                	je     80bb31 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80bae8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80baec:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80baef:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80baf2:	0f 8d 49 02 00 00    	jge    80bd41 <FAT32_lookup+0x6c5>
  80baf8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bafc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80baff:	48 98                	cdqe   
  80bb01:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb05:	0f b6 c0             	movzx  eax,al
  80bb08:	8d 50 20             	lea    edx,[rax+0x20]
  80bb0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb0f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb12:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb15:	48 98                	cdqe   
  80bb17:	48 01 c8             	add    rax,rcx
  80bb1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb1d:	0f be c0             	movsx  eax,al
  80bb20:	39 c2                	cmp    edx,eax
  80bb22:	0f 85 19 02 00 00    	jne    80bd41 <FAT32_lookup+0x6c5>
						{
							j++;
  80bb28:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bb2c:	e9 8d 00 00 00       	jmp    80bbbe <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bb31:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb35:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb38:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80bb3b:	0f 8d 03 02 00 00    	jge    80bd44 <FAT32_lookup+0x6c8>
  80bb41:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb45:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb48:	48 98                	cdqe   
  80bb4a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb4e:	0f b6 d0             	movzx  edx,al
  80bb51:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb55:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb58:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb5b:	48 98                	cdqe   
  80bb5d:	48 01 c8             	add    rax,rcx
  80bb60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb63:	0f be c0             	movsx  eax,al
  80bb66:	39 c2                	cmp    edx,eax
  80bb68:	0f 85 d6 01 00 00    	jne    80bd44 <FAT32_lookup+0x6c8>
						{
							j++;
  80bb6e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bb72:	eb 4a                	jmp    80bbbe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bb74:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb78:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb7b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80bb7e:	0f 8d c3 01 00 00    	jge    80bd47 <FAT32_lookup+0x6cb>
  80bb84:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb88:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb8b:	48 98                	cdqe   
  80bb8d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb91:	0f b6 d0             	movzx  edx,al
  80bb94:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb98:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb9b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb9e:	48 98                	cdqe   
  80bba0:	48 01 c8             	add    rax,rcx
  80bba3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bba6:	0f be c0             	movsx  eax,al
  80bba9:	39 c2                	cmp    edx,eax
  80bbab:	0f 85 96 01 00 00    	jne    80bd47 <FAT32_lookup+0x6cb>
					{
						j++;
  80bbb1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80bbb5:	eb 07                	jmp    80bbbe <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80bbb7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80bbbb:	eb 01                	jmp    80bbbe <FAT32_lookup+0x542>
							continue;
  80bbbd:	90                   	nop
		for(x=0;x<8;x++)
  80bbbe:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80bbc2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80bbc6:	0f 8e 02 fe ff ff    	jle    80b9ce <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80bbcc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bbd0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80bbd4:	0f b6 c0             	movzx  eax,al
  80bbd7:	83 e0 10             	and    eax,0x10
  80bbda:	85 c0                	test   eax,eax
  80bbdc:	0f 85 d0 01 00 00    	jne    80bdb2 <FAT32_lookup+0x736>
		{
			j++;
  80bbe2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80bbe6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80bbed:	e9 2b 01 00 00       	jmp    80bd1d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80bbf2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bbf6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bbf9:	48 98                	cdqe   
  80bbfb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bbff:	0f b6 c0             	movzx  eax,al
  80bc02:	83 f8 7a             	cmp    eax,0x7a
  80bc05:	0f 8f 3f 01 00 00    	jg     80bd4a <FAT32_lookup+0x6ce>
  80bc0b:	83 f8 61             	cmp    eax,0x61
  80bc0e:	7d 2e                	jge    80bc3e <FAT32_lookup+0x5c2>
  80bc10:	83 f8 5a             	cmp    eax,0x5a
  80bc13:	0f 8f 31 01 00 00    	jg     80bd4a <FAT32_lookup+0x6ce>
  80bc19:	83 f8 41             	cmp    eax,0x41
  80bc1c:	7d 20                	jge    80bc3e <FAT32_lookup+0x5c2>
  80bc1e:	83 f8 20             	cmp    eax,0x20
  80bc21:	0f 84 c4 00 00 00    	je     80bceb <FAT32_lookup+0x66f>
  80bc27:	83 f8 20             	cmp    eax,0x20
  80bc2a:	0f 8c 1a 01 00 00    	jl     80bd4a <FAT32_lookup+0x6ce>
  80bc30:	83 e8 30             	sub    eax,0x30
  80bc33:	83 f8 09             	cmp    eax,0x9
  80bc36:	0f 87 0e 01 00 00    	ja     80bd4a <FAT32_lookup+0x6ce>
  80bc3c:	eb 7e                	jmp    80bcbc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80bc3e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc42:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80bc46:	0f b6 c0             	movzx  eax,al
  80bc49:	83 e0 10             	and    eax,0x10
  80bc4c:	85 c0                	test   eax,eax
  80bc4e:	74 39                	je     80bc89 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80bc50:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bc54:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bc57:	48 98                	cdqe   
  80bc59:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bc5d:	0f b6 c0             	movzx  eax,al
  80bc60:	8d 50 20             	lea    edx,[rax+0x20]
  80bc63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc67:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bc6a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bc6d:	48 98                	cdqe   
  80bc6f:	48 01 c8             	add    rax,rcx
  80bc72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc75:	0f be c0             	movsx  eax,al
  80bc78:	39 c2                	cmp    edx,eax
  80bc7a:	0f 85 cd 00 00 00    	jne    80bd4d <FAT32_lookup+0x6d1>
							{
								j++;
  80bc80:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bc84:	e9 90 00 00 00       	jmp    80bd19 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bc89:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bc8d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bc90:	48 98                	cdqe   
  80bc92:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bc96:	0f b6 d0             	movzx  edx,al
  80bc99:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc9d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bca0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bca3:	48 98                	cdqe   
  80bca5:	48 01 c8             	add    rax,rcx
  80bca8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcab:	0f be c0             	movsx  eax,al
  80bcae:	39 c2                	cmp    edx,eax
  80bcb0:	0f 85 9a 00 00 00    	jne    80bd50 <FAT32_lookup+0x6d4>
							{
								j++;
  80bcb6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bcba:	eb 5d                	jmp    80bd19 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bcbc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bcc0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bcc3:	48 98                	cdqe   
  80bcc5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bcc9:	0f b6 d0             	movzx  edx,al
  80bccc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bcd0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bcd3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bcd6:	48 98                	cdqe   
  80bcd8:	48 01 c8             	add    rax,rcx
  80bcdb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcde:	0f be c0             	movsx  eax,al
  80bce1:	39 c2                	cmp    edx,eax
  80bce3:	75 6e                	jne    80bd53 <FAT32_lookup+0x6d7>
						{
							j++;
  80bce5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bce9:	eb 2e                	jmp    80bd19 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bceb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bcef:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bcf2:	48 98                	cdqe   
  80bcf4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bcf8:	0f b6 d0             	movzx  edx,al
  80bcfb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bcff:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bd02:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bd05:	48 98                	cdqe   
  80bd07:	48 01 c8             	add    rax,rcx
  80bd0a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd0d:	0f be c0             	movsx  eax,al
  80bd10:	39 c2                	cmp    edx,eax
  80bd12:	75 42                	jne    80bd56 <FAT32_lookup+0x6da>
						{
							j++;
  80bd14:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bd18:	90                   	nop
			for(x=8;x<11;x++)
  80bd19:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80bd1d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80bd21:	0f 8e cb fe ff ff    	jle    80bbf2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80bd27:	e9 86 00 00 00       	jmp    80bdb2 <FAT32_lookup+0x736>
			continue;
  80bd2c:	90                   	nop
  80bd2d:	eb 28                	jmp    80bd57 <FAT32_lookup+0x6db>
			continue;
  80bd2f:	90                   	nop
  80bd30:	eb 25                	jmp    80bd57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bd32:	90                   	nop
  80bd33:	eb 22                	jmp    80bd57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bd35:	90                   	nop
  80bd36:	eb 1f                	jmp    80bd57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bd38:	90                   	nop
  80bd39:	eb 1c                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd3b:	90                   	nop
  80bd3c:	eb 19                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd3e:	90                   	nop
  80bd3f:	eb 16                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd41:	90                   	nop
  80bd42:	eb 13                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd44:	90                   	nop
  80bd45:	eb 10                	jmp    80bd57 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bd47:	90                   	nop
  80bd48:	eb 0d                	jmp    80bd57 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bd4a:	90                   	nop
  80bd4b:	eb 0a                	jmp    80bd57 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bd4d:	90                   	nop
  80bd4e:	eb 07                	jmp    80bd57 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bd50:	90                   	nop
  80bd51:	eb 04                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd53:	90                   	nop
  80bd54:	eb 01                	jmp    80bd57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bd56:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80bd57:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80bd5b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80bd60:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80bd63:	48 63 d0             	movsxd rdx,eax
  80bd66:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bd6a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bd6e:	48 39 c2             	cmp    rdx,rax
  80bd71:	0f 8c 4c fa ff ff    	jl     80b7c3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80bd77:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80bd7a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bd7e:	89 d6                	mov    esi,edx
  80bd80:	48 89 c7             	mov    rdi,rax
  80bd83:	e8 2d e7 ff ff       	call   80a4b5 <DISK1_FAT32_read_FAT_Entry>
  80bd88:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80bd8b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80bd92:	77 05                	ja     80bd99 <FAT32_lookup+0x71d>
		goto next_cluster;
  80bd94:	e9 7f f9 ff ff       	jmp    80b718 <FAT32_lookup+0x9c>

	vmfree(buf);
  80bd99:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bd9d:	48 89 c7             	mov    rdi,rax
  80bda0:	e8 48 55 ff ff       	call   8012ed <vmfree>
	return NULL;
  80bda5:	b8 00 00 00 00       	mov    eax,0x0
  80bdaa:	e9 f0 01 00 00       	jmp    80bf9f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80bdaf:	90                   	nop
  80bdb0:	eb 01                	jmp    80bdb3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80bdb2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80bdb3:	be 00 00 00 00       	mov    esi,0x0
  80bdb8:	bf 38 00 00 00       	mov    edi,0x38
  80bdbd:	b8 00 00 00 00       	mov    eax,0x0
  80bdc2:	e8 86 54 ff ff       	call   80124d <vmalloc>
  80bdc7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80bdcb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdcf:	ba 38 00 00 00       	mov    edx,0x38
  80bdd4:	be 00 00 00 00       	mov    esi,0x0
  80bdd9:	48 89 c7             	mov    rdi,rax
  80bddc:	e8 38 12 00 00       	call   80d019 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80bde1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bde5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80bde8:	89 c2                	mov    edx,eax
  80bdea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdee:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80bdf1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdf5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bdf8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bdfc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80be00:	48 01 d0             	add    rax,rdx
  80be03:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80be07:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80be0b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80be0f:	48 89 c1             	mov    rcx,rax
  80be12:	48 89 d0             	mov    rax,rdx
  80be15:	ba 00 00 00 00       	mov    edx,0x0
  80be1a:	48 f7 f1             	div    rcx
  80be1d:	48 89 c2             	mov    rdx,rax
  80be20:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be24:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80be28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be2c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80be30:	0f b6 c0             	movzx  eax,al
  80be33:	83 e0 10             	and    eax,0x10
  80be36:	85 c0                	test   eax,eax
  80be38:	74 07                	je     80be41 <FAT32_lookup+0x7c5>
  80be3a:	ba 02 00 00 00       	mov    edx,0x2
  80be3f:	eb 05                	jmp    80be46 <FAT32_lookup+0x7ca>
  80be41:	ba 01 00 00 00       	mov    edx,0x1
  80be46:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be4a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80be4e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80be52:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80be56:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be5a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80be5e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be62:	48 c7 40 20 60 dc 80 	mov    QWORD PTR [rax+0x20],0x80dc60
  80be69:	00 
	p->inode_ops = &FAT32_inode_ops;
  80be6a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be6e:	48 c7 40 28 a0 dc 80 	mov    QWORD PTR [rax+0x28],0x80dca0
  80be75:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80be76:	be 00 00 00 00       	mov    esi,0x0
  80be7b:	bf 20 00 00 00       	mov    edi,0x20
  80be80:	b8 00 00 00 00       	mov    eax,0x0
  80be85:	e8 c3 53 ff ff       	call   80124d <vmalloc>
  80be8a:	48 89 c2             	mov    rdx,rax
  80be8d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be91:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80be95:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be99:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80be9d:	ba 20 00 00 00       	mov    edx,0x20
  80bea2:	be 00 00 00 00       	mov    esi,0x0
  80bea7:	48 89 c7             	mov    rdi,rax
  80beaa:	e8 6a 11 00 00       	call   80d019 <memset>
	finode = p->private_index_info;
  80beaf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80beb3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80beb7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80bebb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bebf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80bec3:	0f b7 c0             	movzx  eax,ax
  80bec6:	c1 e0 10             	shl    eax,0x10
  80bec9:	89 c2                	mov    edx,eax
  80becb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80becf:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80bed3:	0f b7 c0             	movzx  eax,ax
  80bed6:	09 d0                	or     eax,edx
  80bed8:	48 98                	cdqe   
  80beda:	25 ff ff ff 0f       	and    eax,0xfffffff
  80bedf:	48 89 c2             	mov    rdx,rax
  80bee2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bee6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80bee9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80beec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bef0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80bef4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bef8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80befc:	48 c1 f8 05          	sar    rax,0x5
  80bf00:	48 89 c2             	mov    rdx,rax
  80bf03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bf07:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80bf0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf0f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80bf13:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bf17:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80bf1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf1f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80bf23:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bf27:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80bf2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf2f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80bf33:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bf37:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80bf3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf3f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80bf43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bf47:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80bf4b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf4f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80bf53:	66 c1 e8 0c          	shr    ax,0xc
  80bf57:	66 85 c0             	test   ax,ax
  80bf5a:	74 27                	je     80bf83 <FAT32_lookup+0x907>
  80bf5c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf60:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bf64:	83 e0 01             	and    eax,0x1
  80bf67:	48 85 c0             	test   rax,rax
  80bf6a:	74 17                	je     80bf83 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80bf6c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf70:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bf74:	48 83 c8 04          	or     rax,0x4
  80bf78:	48 89 c2             	mov    rdx,rax
  80bf7b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf7f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80bf83:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bf87:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80bf8b:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	vmfree(buf);
  80bf8f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bf93:	48 89 c7             	mov    rdi,rax
  80bf96:	e8 52 53 ff ff       	call   8012ed <vmfree>
	return dest_dentry;	
  80bf9b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80bf9f:	c9                   	leave  
  80bfa0:	c3                   	ret    

000000000080bfa1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80bfa1:	f3 0f 1e fa          	endbr64 
  80bfa5:	55                   	push   rbp
  80bfa6:	48 89 e5             	mov    rbp,rsp
  80bfa9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfad:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfb1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80bfb4:	90                   	nop
  80bfb5:	5d                   	pop    rbp
  80bfb6:	c3                   	ret    

000000000080bfb7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80bfb7:	f3 0f 1e fa          	endbr64 
  80bfbb:	55                   	push   rbp
  80bfbc:	48 89 e5             	mov    rbp,rsp
  80bfbf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfc3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfc7:	90                   	nop
  80bfc8:	5d                   	pop    rbp
  80bfc9:	c3                   	ret    

000000000080bfca <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80bfca:	f3 0f 1e fa          	endbr64 
  80bfce:	55                   	push   rbp
  80bfcf:	48 89 e5             	mov    rbp,rsp
  80bfd2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfd6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfda:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bfde:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80bfe2:	90                   	nop
  80bfe3:	5d                   	pop    rbp
  80bfe4:	c3                   	ret    

000000000080bfe5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80bfe5:	f3 0f 1e fa          	endbr64 
  80bfe9:	55                   	push   rbp
  80bfea:	48 89 e5             	mov    rbp,rsp
  80bfed:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bff1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bff5:	90                   	nop
  80bff6:	5d                   	pop    rbp
  80bff7:	c3                   	ret    

000000000080bff8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80bff8:	f3 0f 1e fa          	endbr64 
  80bffc:	55                   	push   rbp
  80bffd:	48 89 e5             	mov    rbp,rsp
  80c000:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c004:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80c008:	90                   	nop
  80c009:	5d                   	pop    rbp
  80c00a:	c3                   	ret    

000000000080c00b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80c00b:	f3 0f 1e fa          	endbr64 
  80c00f:	55                   	push   rbp
  80c010:	48 89 e5             	mov    rbp,rsp
  80c013:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c017:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80c01b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80c01f:	90                   	nop
  80c020:	5d                   	pop    rbp
  80c021:	c3                   	ret    

000000000080c022 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80c022:	f3 0f 1e fa          	endbr64 
  80c026:	55                   	push   rbp
  80c027:	48 89 e5             	mov    rbp,rsp
  80c02a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c02e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80c032:	90                   	nop
  80c033:	5d                   	pop    rbp
  80c034:	c3                   	ret    

000000000080c035 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80c035:	f3 0f 1e fa          	endbr64 
  80c039:	55                   	push   rbp
  80c03a:	48 89 e5             	mov    rbp,rsp
  80c03d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c041:	90                   	nop
  80c042:	5d                   	pop    rbp
  80c043:	c3                   	ret    

000000000080c044 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80c044:	f3 0f 1e fa          	endbr64 
  80c048:	55                   	push   rbp
  80c049:	48 89 e5             	mov    rbp,rsp
  80c04c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c050:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80c054:	90                   	nop
  80c055:	5d                   	pop    rbp
  80c056:	c3                   	ret    

000000000080c057 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80c057:	f3 0f 1e fa          	endbr64 
  80c05b:	55                   	push   rbp
  80c05c:	48 89 e5             	mov    rbp,rsp
  80c05f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c063:	90                   	nop
  80c064:	5d                   	pop    rbp
  80c065:	c3                   	ret    

000000000080c066 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80c066:	f3 0f 1e fa          	endbr64 
  80c06a:	55                   	push   rbp
  80c06b:	48 89 e5             	mov    rbp,rsp
  80c06e:	48 83 ec 10          	sub    rsp,0x10
  80c072:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80c076:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c07a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c07e:	48 89 c7             	mov    rdi,rax
  80c081:	e8 67 52 ff ff       	call   8012ed <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80c086:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c08a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c08d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c091:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c095:	48 89 c7             	mov    rdi,rax
  80c098:	e8 50 52 ff ff       	call   8012ed <vmfree>
	vmfree(sb->root->dir_inode);
  80c09d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0a4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c0a8:	48 89 c7             	mov    rdi,rax
  80c0ab:	e8 3d 52 ff ff       	call   8012ed <vmfree>
	vmfree(sb->root);
  80c0b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0b7:	48 89 c7             	mov    rdi,rax
  80c0ba:	e8 2e 52 ff ff       	call   8012ed <vmfree>
	vmfree(sb);
  80c0bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0c3:	48 89 c7             	mov    rdi,rax
  80c0c6:	e8 22 52 ff ff       	call   8012ed <vmfree>
}
  80c0cb:	90                   	nop
  80c0cc:	c9                   	leave  
  80c0cd:	c3                   	ret    

000000000080c0ce <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80c0ce:	f3 0f 1e fa          	endbr64 
  80c0d2:	55                   	push   rbp
  80c0d3:	48 89 e5             	mov    rbp,rsp
  80c0d6:	48 83 ec 40          	sub    rsp,0x40
  80c0da:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80c0de:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c0e5:	00 
	struct FAT32_Directory * buf = NULL;
  80c0e6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80c0ed:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80c0ee:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c0f2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c0f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80c0fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c0fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c102:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c106:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80c10a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80c111:	00 

	if(finode->dentry_location == 0)
  80c112:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c116:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80c11a:	48 85 c0             	test   rax,rax
  80c11d:	75 14                	jne    80c133 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80c11f:	bf cc 5c 81 00       	mov    edi,0x815ccc
  80c124:	b8 00 00 00 00       	mov    eax,0x0
  80c129:	e8 49 4c ff ff       	call   800d77 <printf>
		return ;
  80c12e:	e9 30 01 00 00       	jmp    80c263 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80c133:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c137:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80c13b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c13f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80c143:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80c147:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c14b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c14f:	48 0f af c2          	imul   rax,rdx
  80c153:	48 01 c8             	add    rax,rcx
  80c156:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80c15a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c15e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c162:	be 00 00 00 00       	mov    esi,0x0
  80c167:	48 89 c7             	mov    rdi,rax
  80c16a:	b8 00 00 00 00       	mov    eax,0x0
  80c16f:	e8 d9 50 ff ff       	call   80124d <vmalloc>
  80c174:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80c178:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c17c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c180:	89 c2                	mov    edx,eax
  80c182:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c186:	be 00 00 00 00       	mov    esi,0x0
  80c18b:	48 89 c7             	mov    rdi,rax
  80c18e:	e8 86 0e 00 00       	call   80d019 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c193:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c197:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c19b:	89 c1                	mov    ecx,eax
  80c19d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c1a1:	89 c2                	mov    edx,eax
  80c1a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1a7:	49 89 c0             	mov    r8,rax
  80c1aa:	be 00 00 00 00       	mov    esi,0x0
  80c1af:	bf 00 00 00 00       	mov    edi,0x0
  80c1b4:	e8 54 d6 ff ff       	call   80980d <request>
  80c1b9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80c1bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c1bf:	89 c7                	mov    edi,eax
  80c1c1:	e8 fb dc ff ff       	call   809ec1 <chk_result>
    fdentry = buf+finode->dentry_position;
  80c1c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c1ca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c1ce:	48 c1 e0 05          	shl    rax,0x5
  80c1d2:	48 89 c2             	mov    rdx,rax
  80c1d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1d9:	48 01 d0             	add    rax,rdx
  80c1dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80c1e0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c1e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c1e7:	89 c2                	mov    edx,eax
  80c1e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1ed:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80c1f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c1f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c1f7:	89 c2                	mov    edx,eax
  80c1f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1fd:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80c201:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c205:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80c209:	66 25 00 f0          	and    ax,0xf000
  80c20d:	89 c2                	mov    edx,eax
  80c20f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c213:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c216:	48 c1 e8 10          	shr    rax,0x10
  80c21a:	09 c2                	or     edx,eax
  80c21c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c220:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c224:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c228:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c22c:	89 c1                	mov    ecx,eax
  80c22e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c232:	89 c2                	mov    edx,eax
  80c234:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c238:	49 89 c0             	mov    r8,rax
  80c23b:	be 01 00 00 00       	mov    esi,0x1
  80c240:	bf 00 00 00 00       	mov    edi,0x0
  80c245:	e8 c3 d5 ff ff       	call   80980d <request>
  80c24a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80c24d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80c250:	89 c7                	mov    edi,eax
  80c252:	e8 6a dc ff ff       	call   809ec1 <chk_result>
	vmfree(buf);
  80c257:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c25b:	48 89 c7             	mov    rdi,rax
  80c25e:	e8 8a 50 ff ff       	call   8012ed <vmfree>
}
  80c263:	c9                   	leave  
  80c264:	c3                   	ret    

000000000080c265 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80c265:	f3 0f 1e fa          	endbr64 
  80c269:	55                   	push   rbp
  80c26a:	48 89 e5             	mov    rbp,rsp
  80c26d:	48 83 ec 50          	sub    rsp,0x50
  80c271:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80c275:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80c279:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c280:	00 
	struct FAT32_inode_info * finode = NULL;
  80c281:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80c288:	00 
	struct FAT32_BootSector * fbs = NULL;
  80c289:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80c290:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80c291:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80c298:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80c299:	be 00 00 00 00       	mov    esi,0x0
  80c29e:	bf 18 00 00 00       	mov    edi,0x18
  80c2a3:	b8 00 00 00 00       	mov    eax,0x0
  80c2a8:	e8 a0 4f ff ff       	call   80124d <vmalloc>
  80c2ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80c2b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2b5:	ba 18 00 00 00       	mov    edx,0x18
  80c2ba:	be 00 00 00 00       	mov    esi,0x0
  80c2bf:	48 89 c7             	mov    rdi,rax
  80c2c2:	e8 52 0d 00 00       	call   80d019 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80c2c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2cb:	48 c7 40 08 00 dd 80 	mov    QWORD PTR [rax+0x8],0x80dd00
  80c2d2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80c2d3:	be 00 00 00 00       	mov    esi,0x0
  80c2d8:	bf 60 00 00 00       	mov    edi,0x60
  80c2dd:	b8 00 00 00 00       	mov    eax,0x0
  80c2e2:	e8 66 4f ff ff       	call   80124d <vmalloc>
  80c2e7:	48 89 c2             	mov    rdx,rax
  80c2ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2ee:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80c2f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2f6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c2fa:	ba 60 00 00 00       	mov    edx,0x60
  80c2ff:	be 00 00 00 00       	mov    esi,0x0
  80c304:	48 89 c7             	mov    rdi,rax
  80c307:	e8 0d 0d 00 00       	call   80d019 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80c30c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80c310:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80c314:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c318:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c31c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80c320:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c324:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c327:	89 c2                	mov    edx,eax
  80c329:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c32d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80c330:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c334:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c337:	89 c2                	mov    edx,eax
  80c339:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c33d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80c341:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c345:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c349:	0f b6 d0             	movzx  edx,al
  80c34c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c350:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80c354:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c358:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c35c:	0f b6 d0             	movzx  edx,al
  80c35f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c363:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c367:	0f b7 c0             	movzx  eax,ax
  80c36a:	0f af c2             	imul   eax,edx
  80c36d:	48 63 d0             	movsxd rdx,eax
  80c370:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c374:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80c378:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c37c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c380:	0f b7 d0             	movzx  edx,ax
  80c383:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c387:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80c38b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c38f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c392:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c396:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c39a:	0f b7 c0             	movzx  eax,ax
  80c39d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80c3a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3a4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80c3a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3ab:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c3af:	0f b6 c0             	movzx  eax,al
  80c3b2:	0f af c2             	imul   eax,edx
  80c3b5:	01 c8                	add    eax,ecx
  80c3b7:	89 c2                	mov    edx,eax
  80c3b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3bd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80c3c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c3c5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c3c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3cc:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c3d0:	0f b7 c0             	movzx  eax,ax
  80c3d3:	01 d0                	add    eax,edx
  80c3d5:	89 c2                	mov    edx,eax
  80c3d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3db:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80c3df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3e3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80c3e6:	89 c2                	mov    edx,eax
  80c3e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3ec:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80c3f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3f4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c3f8:	0f b6 d0             	movzx  edx,al
  80c3fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3ff:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80c403:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c407:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c40b:	0f b7 d0             	movzx  edx,ax
  80c40e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c412:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80c416:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c41a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c41e:	0f b7 d0             	movzx  edx,ax
  80c421:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c425:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80c429:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c42d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80c430:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c434:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c438:	0f b7 d0             	movzx  edx,ax
  80c43b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c43f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c443:	0f b7 c0             	movzx  eax,ax
  80c446:	89 c6                	mov    esi,eax
  80c448:	bf e8 5c 81 00       	mov    edi,0x815ce8
  80c44d:	b8 00 00 00 00       	mov    eax,0x0
  80c452:	e8 20 49 ff ff       	call   800d77 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80c457:	be 00 00 00 00       	mov    esi,0x0
  80c45c:	bf 00 02 00 00       	mov    edi,0x200
  80c461:	b8 00 00 00 00       	mov    eax,0x0
  80c466:	e8 e2 4d ff ff       	call   80124d <vmalloc>
  80c46b:	48 89 c2             	mov    rdx,rax
  80c46e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c472:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80c476:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c47a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c47e:	ba 00 02 00 00       	mov    edx,0x200
  80c483:	be 00 00 00 00       	mov    esi,0x0
  80c488:	48 89 c7             	mov    rdi,rax
  80c48b:	e8 89 0b 00 00       	call   80d019 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80c490:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c494:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80c498:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c49c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80c49f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c4a3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c4a7:	0f b7 c0             	movzx  eax,ax
  80c4aa:	01 c8                	add    eax,ecx
  80c4ac:	49 89 d0             	mov    r8,rdx
  80c4af:	b9 01 00 00 00       	mov    ecx,0x1
  80c4b4:	89 c2                	mov    edx,eax
  80c4b6:	be 00 00 00 00       	mov    esi,0x0
  80c4bb:	bf 00 00 00 00       	mov    edi,0x0
  80c4c0:	e8 48 d3 ff ff       	call   80980d <request>
  80c4c5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80c4c8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80c4cb:	89 c7                	mov    edi,eax
  80c4cd:	e8 ef d9 ff ff       	call   809ec1 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80c4d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c4d6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c4da:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80c4e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c4e4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c4e8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80c4ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c4f2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c4f6:	8b 00                	mov    eax,DWORD PTR [rax]
  80c4f8:	89 c6                	mov    esi,eax
  80c4fa:	bf 30 5d 81 00       	mov    edi,0x815d30
  80c4ff:	b8 00 00 00 00       	mov    eax,0x0
  80c504:	e8 6e 48 ff ff       	call   800d77 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80c509:	be 00 00 00 00       	mov    esi,0x0
  80c50e:	bf 58 00 00 00       	mov    edi,0x58
  80c513:	b8 00 00 00 00       	mov    eax,0x0
  80c518:	e8 30 4d ff ff       	call   80124d <vmalloc>
  80c51d:	48 89 c2             	mov    rdx,rax
  80c520:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c524:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80c527:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c52b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c52e:	ba 58 00 00 00       	mov    edx,0x58
  80c533:	be 00 00 00 00       	mov    esi,0x0
  80c538:	48 89 c7             	mov    rdi,rax
  80c53b:	e8 d9 0a 00 00       	call   80d019 <memset>

	list_init(&sbp->root->child_node);
  80c540:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c544:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c547:	48 83 c0 10          	add    rax,0x10
  80c54b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = NULL;
  80c54f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c553:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c55a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c55e:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c565:	00 
}
  80c566:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80c567:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c56b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c56e:	48 83 c0 28          	add    rax,0x28
  80c572:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = NULL;
  80c576:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c57a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c581:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c585:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c58c:	00 
}
  80c58d:	90                   	nop
	sbp->root->parent = sbp->root;
  80c58e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c592:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c595:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c599:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80c59c:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80c5a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5a7:	48 c7 40 50 e0 dc 80 	mov    QWORD PTR [rax+0x50],0x80dce0
  80c5ae:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80c5af:	be 00 00 00 00       	mov    esi,0x0
  80c5b4:	bf 02 00 00 00       	mov    edi,0x2
  80c5b9:	b8 00 00 00 00       	mov    eax,0x0
  80c5be:	e8 8a 4c ff ff       	call   80124d <vmalloc>
  80c5c3:	48 89 c2             	mov    rdx,rax
  80c5c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5ca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5cd:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80c5d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5da:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80c5dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5e4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80c5eb:	be 00 00 00 00       	mov    esi,0x0
  80c5f0:	bf 38 00 00 00       	mov    edi,0x38
  80c5f5:	b8 00 00 00 00       	mov    eax,0x0
  80c5fa:	e8 4e 4c ff ff       	call   80124d <vmalloc>
  80c5ff:	48 89 c2             	mov    rdx,rax
  80c602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c606:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c609:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80c60d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c611:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c614:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c618:	ba 38 00 00 00       	mov    edx,0x38
  80c61d:	be 00 00 00 00       	mov    esi,0x0
  80c622:	48 89 c7             	mov    rdi,rax
  80c625:	e8 ef 09 00 00       	call   80d019 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80c62a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c62e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c631:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c635:	48 c7 40 28 a0 dc 80 	mov    QWORD PTR [rax+0x28],0x80dca0
  80c63c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80c63d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c641:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c644:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c648:	48 c7 40 20 60 dc 80 	mov    QWORD PTR [rax+0x20],0x80dc60
  80c64f:	00 
	sbp->root->dir_inode->file_size = 0;
  80c650:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c654:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c657:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c65b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80c662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c666:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c669:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c66d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c670:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c674:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c678:	48 01 d0             	add    rax,rdx
  80c67b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80c67f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c683:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c687:	48 89 c6             	mov    rsi,rax
  80c68a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c68e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c691:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80c695:	48 89 d0             	mov    rax,rdx
  80c698:	ba 00 00 00 00       	mov    edx,0x0
  80c69d:	48 f7 f6             	div    rsi
  80c6a0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80c6a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c6ab:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c6af:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80c6b6:	00 
	sbp->root->dir_inode->sb = sbp;
  80c6b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c6be:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c6c2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c6c6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80c6ca:	be 00 00 00 00       	mov    esi,0x0
  80c6cf:	bf 20 00 00 00       	mov    edi,0x20
  80c6d4:	b8 00 00 00 00       	mov    eax,0x0
  80c6d9:	e8 6f 4b ff ff       	call   80124d <vmalloc>
  80c6de:	48 89 c2             	mov    rdx,rax
  80c6e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c6e8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c6ec:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80c6f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c6f7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c6fb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c6ff:	ba 20 00 00 00       	mov    edx,0x20
  80c704:	be 00 00 00 00       	mov    esi,0x0
  80c709:	48 89 c7             	mov    rdi,rax
  80c70c:	e8 08 09 00 00       	call   80d019 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80c711:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c715:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c718:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c71c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c720:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80c724:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c728:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80c72b:	89 c2                	mov    edx,eax
  80c72d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c731:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80c734:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c738:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80c73f:	00 
	finode->dentry_position = 0; 
  80c740:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c744:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c74b:	00 
	finode->create_date = 0;
  80c74c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c750:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80c756:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c75a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80c760:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c764:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80c76a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c76e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80c774:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80c778:	c9                   	leave  
  80c779:	c3                   	ret    

000000000080c77a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80c77a:	f3 0f 1e fa          	endbr64 
  80c77e:	55                   	push   rbp
  80c77f:	48 89 e5             	mov    rbp,rsp
  80c782:	48 81 ec 20 04 00 00 	sub    rsp,0x420
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80c789:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c790:	00 
	struct Disk_Partition_Table DPT = {0};
  80c791:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c798:	b8 00 00 00 00       	mov    eax,0x0
  80c79d:	b9 40 00 00 00       	mov    ecx,0x40
  80c7a2:	48 89 d7             	mov    rdi,rdx
  80c7a5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80c7a8:	bf 20 dd 80 00       	mov    edi,0x80dd20
  80c7ad:	e8 71 ba ff ff       	call   808223 <register_filesystem>
	
	memset(buf,0,512);
  80c7b2:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c7b9:	ba 00 02 00 00       	mov    edx,0x200
  80c7be:	be 00 00 00 00       	mov    esi,0x0
  80c7c3:	48 89 c7             	mov    rdi,rax
  80c7c6:	e8 4e 08 00 00       	call   80d019 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80c7cb:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c7d2:	49 89 c0             	mov    r8,rax
  80c7d5:	b9 01 00 00 00       	mov    ecx,0x1
  80c7da:	ba 00 00 00 00       	mov    edx,0x0
  80c7df:	be 00 00 00 00       	mov    esi,0x0
  80c7e4:	bf 00 00 00 00       	mov    edi,0x0
  80c7e9:	e8 1f d0 ff ff       	call   80980d <request>
  80c7ee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80c7f1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80c7f4:	89 c7                	mov    edi,eax
  80c7f6:	e8 c6 d6 ff ff       	call   809ec1 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80c7fb:	48 8d 95 e0 fd ff ff 	lea    rdx,[rbp-0x220]
  80c802:	48 8d 85 e0 fb ff ff 	lea    rax,[rbp-0x420]
  80c809:	48 89 d6             	mov    rsi,rdx
  80c80c:	ba 40 00 00 00       	mov    edx,0x40
  80c811:	48 89 c7             	mov    rdi,rax
  80c814:	48 89 d1             	mov    rcx,rdx
  80c817:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80c81a:	0f b6 85 a2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x25e]
  80c821:	0f b6 d0             	movzx  edx,al
  80c824:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c82a:	89 c6                	mov    esi,eax
  80c82c:	bf 78 5d 81 00       	mov    edi,0x815d78
  80c831:	b8 00 00 00 00       	mov    eax,0x0
  80c836:	e8 3c 45 ff ff       	call   800d77 <printf>

	memset(buf,0,512);
  80c83b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c842:	ba 00 02 00 00       	mov    edx,0x200
  80c847:	be 00 00 00 00       	mov    esi,0x0
  80c84c:	48 89 c7             	mov    rdi,rax
  80c84f:	e8 c5 07 00 00       	call   80d019 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80c854:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c85a:	89 c2                	mov    edx,eax
  80c85c:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c863:	49 89 c0             	mov    r8,rax
  80c866:	b9 01 00 00 00       	mov    ecx,0x1
  80c86b:	be 00 00 00 00       	mov    esi,0x0
  80c870:	bf 00 00 00 00       	mov    edi,0x0
  80c875:	e8 93 cf ff ff       	call   80980d <request>
  80c87a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80c87d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80c880:	89 c7                	mov    edi,eax
  80c882:	e8 3a d6 ff ff       	call   809ec1 <chk_result>

    //挂载新文件系统到/mnt
	struct super_block *fat32_sb= mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80c887:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c88e:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c895:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80c89c:	48 89 c2             	mov    rdx,rax
  80c89f:	48 89 ce             	mov    rsi,rcx
  80c8a2:	bf 72 5d 81 00       	mov    edi,0x815d72
  80c8a7:	e8 ff b8 ff ff       	call   8081ab <mount_fs>
  80c8ac:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    fat32_sb->root=dmnt;
  80c8b0:	48 8b 15 11 bc bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfbc11]        # 4084c8 <dmnt>
  80c8b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c8bb:	48 89 10             	mov    QWORD PTR [rax],rdx
//    list_add_to_behind(&root_sb->root->subdirs_list,ddev);//把dev文件夹挂到新的rfs下
}
  80c8be:	90                   	nop
  80c8bf:	c9                   	leave  
  80c8c0:	c3                   	ret    

000000000080c8c1 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=ioctl_tty
};

long close_tty(struct index_node * inode,struct file * filp){
  80c8c1:	f3 0f 1e fa          	endbr64 
  80c8c5:	55                   	push   rbp
  80c8c6:	48 89 e5             	mov    rbp,rsp
  80c8c9:	48 83 ec 30          	sub    rsp,0x30
  80c8cd:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c8d1:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80c8d5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c8d9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c8dd:	48 83 c0 18          	add    rax,0x18
  80c8e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80c8e5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c8e9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c8ed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80c8f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c8f5:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c8f9:	48 83 c0 30          	add    rax,0x30
  80c8fd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80c901:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c905:	48 89 c7             	mov    rdi,rax
  80c908:	e8 e0 49 ff ff       	call   8012ed <vmfree>
    vmfree((addr_t)bo);
  80c90d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c911:	48 89 c7             	mov    rdi,rax
  80c914:	e8 d4 49 ff ff       	call   8012ed <vmfree>
    vmfree((addr_t)be);
  80c919:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c91d:	48 89 c7             	mov    rdi,rax
  80c920:	e8 c8 49 ff ff       	call   8012ed <vmfree>
    vmfree((addr_t)filp->private_data);
  80c925:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c929:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c92d:	48 89 c7             	mov    rdi,rax
  80c930:	e8 b8 49 ff ff       	call   8012ed <vmfree>
    return 0;
  80c935:	b8 00 00 00 00       	mov    eax,0x0
}
  80c93a:	c9                   	leave  
  80c93b:	c3                   	ret    

000000000080c93c <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80c93c:	f3 0f 1e fa          	endbr64 
  80c940:	55                   	push   rbp
  80c941:	48 89 e5             	mov    rbp,rsp
  80c944:	48 83 ec 20          	sub    rsp,0x20
  80c948:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c94c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80c950:	b8 00 00 00 00       	mov    eax,0x0
  80c955:	e8 f3 48 ff ff       	call   80124d <vmalloc>
  80c95a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80c95e:	b8 00 00 00 00       	mov    eax,0x0
  80c963:	e8 e5 48 ff ff       	call   80124d <vmalloc>
  80c968:	48 89 c2             	mov    rdx,rax
  80c96b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c96f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80c973:	b8 00 00 00 00       	mov    eax,0x0
  80c978:	e8 d0 48 ff ff       	call   80124d <vmalloc>
  80c97d:	48 89 c2             	mov    rdx,rax
  80c980:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c984:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80c987:	b8 00 00 00 00       	mov    eax,0x0
  80c98c:	e8 bc 48 ff ff       	call   80124d <vmalloc>
  80c991:	48 89 c2             	mov    rdx,rax
  80c994:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c998:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80c99c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9a0:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80c9a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9ab:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80c9b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9b6:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80c9bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9c1:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80c9c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9cc:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80c9d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9d7:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80c9de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9e2:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80c9e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9ed:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80c9f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c9f8:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80c9ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ca03:	48 c7 40 20 40 dd 80 	mov    QWORD PTR [rax+0x20],0x80dd40
  80ca0a:	00 
    filp->f_ops=&tty_fops;
  80ca0b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ca0f:	48 c7 40 18 40 dd 80 	mov    QWORD PTR [rax+0x18],0x80dd40
  80ca16:	00 
    filp->private_data=ntty;
  80ca17:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ca1b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80ca1f:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80ca23:	b8 00 00 00 00       	mov    eax,0x0
}
  80ca28:	c9                   	leave  
  80ca29:	c3                   	ret    

000000000080ca2a <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80ca2a:	f3 0f 1e fa          	endbr64 
  80ca2e:	55                   	push   rbp
  80ca2f:	48 89 e5             	mov    rbp,rsp
  80ca32:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ca36:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80ca3a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80ca3e:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80ca42:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ca46:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ca4a:	48 83 c0 18          	add    rax,0x18
  80ca4e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80ca52:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80ca59:	eb 6e                	jmp    80cac9 <read_tty+0x9f>
        if(b->rptr==b->size)
  80ca5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca5f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80ca62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca66:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80ca69:	39 c2                	cmp    edx,eax
  80ca6b:	75 0b                	jne    80ca78 <read_tty+0x4e>
            b->rptr=0;
  80ca6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca71:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        if(b->rptr==b->wptr)continue;
  80ca78:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca7c:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80ca7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca83:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ca86:	39 c2                	cmp    edx,eax
  80ca88:	75 02                	jne    80ca8c <read_tty+0x62>
  80ca8a:	eb 3d                	jmp    80cac9 <read_tty+0x9f>
        buf[i++]=b->data[b->rptr];
  80ca8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca90:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ca93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca97:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ca9a:	48 98                	cdqe   
  80ca9c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80caa0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80caa3:	8d 50 01             	lea    edx,[rax+0x1]
  80caa6:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80caa9:	48 63 d0             	movsxd rdx,eax
  80caac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cab0:	48 01 c2             	add    rdx,rax
  80cab3:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cab6:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80cab8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cabc:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80cabf:	8d 50 01             	lea    edx,[rax+0x1]
  80cac2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cac6:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80cac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cacc:	48 98                	cdqe   
  80cace:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cad2:	77 87                	ja     80ca5b <read_tty+0x31>
    }
}
  80cad4:	90                   	nop
  80cad5:	5d                   	pop    rbp
  80cad6:	c3                   	ret    

000000000080cad7 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80cad7:	f3 0f 1e fa          	endbr64 
  80cadb:	55                   	push   rbp
  80cadc:	48 89 e5             	mov    rbp,rsp
  80cadf:	48 83 ec 40          	sub    rsp,0x40
  80cae3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80cae7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80caeb:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80caef:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80caf3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80caf7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cafb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80caff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80cb06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb0a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb0d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80cb10:	eb 5a                	jmp    80cb6c <write_tty+0x95>
        if(b->wptr==b->size)
  80cb12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb16:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cb19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb1d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cb20:	39 c2                	cmp    edx,eax
  80cb22:	75 0b                	jne    80cb2f <write_tty+0x58>
            b->wptr=0;
  80cb24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb28:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80cb2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cb32:	8d 50 01             	lea    edx,[rax+0x1]
  80cb35:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cb38:	48 63 d0             	movsxd rdx,eax
  80cb3b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80cb3f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cb43:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb47:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cb4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb4e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb51:	48 98                	cdqe   
  80cb53:	48 01 c2             	add    rdx,rax
  80cb56:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cb59:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80cb5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb5f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb62:	8d 50 01             	lea    edx,[rax+0x1]
  80cb65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb69:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80cb6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cb6f:	48 98                	cdqe   
  80cb71:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80cb75:	77 9b                	ja     80cb12 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80cb77:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb7b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cb7e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80cb81:	48 98                	cdqe   
  80cb83:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80cb87:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80cb8b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80cb8f:	b9 00 00 00 00       	mov    ecx,0x0
  80cb94:	48 89 c7             	mov    rdi,rax
  80cb97:	e8 ae b1 ff ff       	call   807d4a <write_framebuffer>
}
  80cb9c:	90                   	nop
  80cb9d:	c9                   	leave  
  80cb9e:	c3                   	ret    

000000000080cb9f <ioctl_tty>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long ioctl_tty(struct index_node * inode, struct file * filp, unsigned long cmd, unsigned long arg)
{
  80cb9f:	f3 0f 1e fa          	endbr64 
  80cba3:	55                   	push   rbp
  80cba4:	48 89 e5             	mov    rbp,rsp
  80cba7:	48 83 ec 50          	sub    rsp,0x50
  80cbab:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80cbaf:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80cbb3:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80cbb7:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80cbbb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cbbf:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cbc3:	48 83 c0 30          	add    rax,0x30
  80cbc7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * ib=&((tty_t*)filp->private_data)->stdin_buf;
  80cbcb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cbcf:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cbd3:	48 83 c0 18          	add    rax,0x18
  80cbd7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int i=0;
  80cbdb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80cbe2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cbe6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cbe9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80cbed:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cbf1:	48 83 c0 08          	add    rax,0x8
  80cbf5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cbf8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int saved_wptr=b->wptr;
  80cbfc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc00:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc03:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    int fd=-1;
  80cc06:	c7 45 d0 ff ff ff ff 	mov    DWORD PTR [rbp-0x30],0xffffffff
    switch (cmd)
  80cc0d:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80cc12:	0f 84 81 01 00 00    	je     80cd99 <ioctl_tty+0x1fa>
  80cc18:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80cc1d:	0f 87 81 01 00 00    	ja     80cda4 <ioctl_tty+0x205>
  80cc23:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80cc28:	0f 84 e8 00 00 00    	je     80cd16 <ioctl_tty+0x177>
  80cc2e:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80cc33:	0f 87 6b 01 00 00    	ja     80cda4 <ioctl_tty+0x205>
  80cc39:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80cc3e:	74 6a                	je     80ccaa <ioctl_tty+0x10b>
  80cc40:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80cc45:	0f 84 94 00 00 00    	je     80ccdf <ioctl_tty+0x140>
  80cc4b:	e9 54 01 00 00       	jmp    80cda4 <ioctl_tty+0x205>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80cc50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc54:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cc57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc5b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cc5e:	39 c2                	cmp    edx,eax
  80cc60:	75 0b                	jne    80cc6d <ioctl_tty+0xce>
                    b->wptr=0;
  80cc62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc66:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80cc6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc70:	8d 50 01             	lea    edx,[rax+0x1]
  80cc73:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cc76:	48 63 d0             	movsxd rdx,eax
  80cc79:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cc7d:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cc81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc85:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cc88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc8f:	48 98                	cdqe   
  80cc91:	48 01 c2             	add    rdx,rax
  80cc94:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cc97:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80cc99:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc9d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cca0:	8d 50 01             	lea    edx,[rax+0x1]
  80cca3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cca7:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80ccaa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccad:	48 98                	cdqe   
  80ccaf:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80ccb3:	77 9b                	ja     80cc50 <ioctl_tty+0xb1>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80ccb5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ccb9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ccbc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ccbf:	48 98                	cdqe   
  80ccc1:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80ccc5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80ccc9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cccd:	b9 00 00 00 00       	mov    ecx,0x0
  80ccd2:	48 89 c7             	mov    rdi,rax
  80ccd5:	e8 70 b0 ff ff       	call   807d4a <write_framebuffer>
        break;
  80ccda:	e9 ce 00 00 00       	jmp    80cdad <ioctl_tty+0x20e>
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
  80ccdf:	be c1 00 00 00       	mov    esi,0xc1
  80cce4:	bf 96 5d 81 00       	mov    edi,0x815d96
  80cce9:	e8 35 b8 ff ff       	call   808523 <sys_open>
  80ccee:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80ccf1:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80ccf5:	75 0c                	jne    80cd03 <ioctl_tty+0x164>
  80ccf7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80ccfe:	e9 af 00 00 00       	jmp    80cdb2 <ioctl_tty+0x213>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80cd03:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cd07:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cd0b:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80cd0e:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80cd11:	e9 97 00 00 00       	jmp    80cdad <ioctl_tty+0x20e>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80cd16:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cd1a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cd1e:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80cd21:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80cd24:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80cd28:	75 09                	jne    80cd33 <ioctl_tty+0x194>
  80cd2a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cd31:	eb 7f                	jmp    80cdb2 <ioctl_tty+0x213>
            sys_close(fd);
  80cd33:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80cd36:	89 c7                	mov    edi,eax
  80cd38:	e8 7d bd ff ff       	call   808aba <sys_close>
        case TTY_WSTDIN:
            while (i<count){
  80cd3d:	eb 5a                	jmp    80cd99 <ioctl_tty+0x1fa>
                if(ib->wptr==ib->size)
  80cd3f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd43:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cd46:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd4a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cd4d:	39 c2                	cmp    edx,eax
  80cd4f:	75 0b                	jne    80cd5c <ioctl_tty+0x1bd>
                    ib->wptr=0;
  80cd51:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd55:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                ib->data[ib->wptr]=buf[i++];
  80cd5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd5f:	8d 50 01             	lea    edx,[rax+0x1]
  80cd62:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cd65:	48 63 d0             	movsxd rdx,eax
  80cd68:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cd6c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cd70:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd74:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cd77:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd7b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cd7e:	48 98                	cdqe   
  80cd80:	48 01 c2             	add    rdx,rax
  80cd83:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cd86:	88 02                	mov    BYTE PTR [rdx],al
                ib->wptr++;
  80cd88:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cd8f:	8d 50 01             	lea    edx,[rax+0x1]
  80cd92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd96:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80cd99:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd9c:	48 98                	cdqe   
  80cd9e:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cda2:	77 9b                	ja     80cd3f <ioctl_tty+0x1a0>
            }
    default:return -1;
  80cda4:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cdab:	eb 05                	jmp    80cdb2 <ioctl_tty+0x213>
    }
    return 0;
  80cdad:	b8 00 00 00 00       	mov    eax,0x0
}
  80cdb2:	c9                   	leave  
  80cdb3:	c3                   	ret    

000000000080cdb4 <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80cdb4:	f3 0f 1e fa          	endbr64 
  80cdb8:	55                   	push   rbp
  80cdb9:	48 89 e5             	mov    rbp,rsp
  80cdbc:	48 83 ec 10          	sub    rsp,0x10
  80cdc0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80cdc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cdc6:	83 c0 01             	add    eax,0x1
  80cdc9:	0f b7 c0             	movzx  eax,ax
  80cdcc:	be 00 00 00 00       	mov    esi,0x0
  80cdd1:	89 c7                	mov    edi,eax
  80cdd3:	e8 58 9a ff ff       	call   806830 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80cdd8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cddb:	83 c0 03             	add    eax,0x3
  80cdde:	0f b7 c0             	movzx  eax,ax
  80cde1:	be 80 00 00 00       	mov    esi,0x80
  80cde6:	89 c7                	mov    edi,eax
  80cde8:	e8 43 9a ff ff       	call   806830 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80cded:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cdf0:	0f b7 c0             	movzx  eax,ax
  80cdf3:	be 03 00 00 00       	mov    esi,0x3
  80cdf8:	89 c7                	mov    edi,eax
  80cdfa:	e8 31 9a ff ff       	call   806830 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80cdff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce02:	83 c0 01             	add    eax,0x1
  80ce05:	0f b7 c0             	movzx  eax,ax
  80ce08:	be 00 00 00 00       	mov    esi,0x0
  80ce0d:	89 c7                	mov    edi,eax
  80ce0f:	e8 1c 9a ff ff       	call   806830 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80ce14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce17:	83 c0 03             	add    eax,0x3
  80ce1a:	0f b7 c0             	movzx  eax,ax
  80ce1d:	be 03 00 00 00       	mov    esi,0x3
  80ce22:	89 c7                	mov    edi,eax
  80ce24:	e8 07 9a ff ff       	call   806830 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80ce29:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce2c:	83 c0 02             	add    eax,0x2
  80ce2f:	0f b7 c0             	movzx  eax,ax
  80ce32:	be 87 00 00 00       	mov    esi,0x87
  80ce37:	89 c7                	mov    edi,eax
  80ce39:	e8 f2 99 ff ff       	call   806830 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80ce3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce41:	83 c0 04             	add    eax,0x4
  80ce44:	0f b7 c0             	movzx  eax,ax
  80ce47:	be 0b 00 00 00       	mov    esi,0xb
  80ce4c:	89 c7                	mov    edi,eax
  80ce4e:	e8 dd 99 ff ff       	call   806830 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80ce53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ce56:	83 c0 04             	add    eax,0x4
  80ce59:	0f b7 c0             	movzx  eax,ax
  80ce5c:	be 0f 00 00 00       	mov    esi,0xf
  80ce61:	89 c7                	mov    edi,eax
  80ce63:	e8 c8 99 ff ff       	call   806830 <outb>
}
  80ce68:	90                   	nop
  80ce69:	c9                   	leave  
  80ce6a:	c3                   	ret    

000000000080ce6b <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80ce6b:	f3 0f 1e fa          	endbr64 
  80ce6f:	55                   	push   rbp
  80ce70:	48 89 e5             	mov    rbp,rsp
  80ce73:	48 83 ec 20          	sub    rsp,0x20
  80ce77:	89 f8                	mov    eax,edi
  80ce79:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80ce7c:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80ce80:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ce83:	83 c0 05             	add    eax,0x5
  80ce86:	0f b6 c0             	movzx  eax,al
  80ce89:	89 c7                	mov    edi,eax
  80ce8b:	e8 b9 99 ff ff       	call   806849 <inb>
  80ce90:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80ce93:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80ce97:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80ce9b:	74 e3                	je     80ce80 <com_putchar+0x15>
    outb(com_base, ch);
  80ce9d:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80cea1:	0f b6 d0             	movzx  edx,al
  80cea4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80cea7:	0f b7 c0             	movzx  eax,ax
  80ceaa:	89 d6                	mov    esi,edx
  80ceac:	89 c7                	mov    edi,eax
  80ceae:	e8 7d 99 ff ff       	call   806830 <outb>
}
  80ceb3:	90                   	nop
  80ceb4:	c9                   	leave  
  80ceb5:	c3                   	ret    

000000000080ceb6 <com_puts>:

void com_puts(char* s,int com_port){
  80ceb6:	f3 0f 1e fa          	endbr64 
  80ceba:	55                   	push   rbp
  80cebb:	48 89 e5             	mov    rbp,rsp
  80cebe:	48 83 ec 10          	sub    rsp,0x10
  80cec2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80cec6:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80cec9:	eb 1d                	jmp    80cee8 <com_puts+0x32>
        com_putchar(*s,com_port);
  80cecb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cecf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ced2:	66 98                	cbw    
  80ced4:	0f b7 c0             	movzx  eax,ax
  80ced7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80ceda:	89 d6                	mov    esi,edx
  80cedc:	89 c7                	mov    edi,eax
  80cede:	e8 88 ff ff ff       	call   80ce6b <com_putchar>
    for(;*s;s++){
  80cee3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80cee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ceec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ceef:	84 c0                	test   al,al
  80cef1:	75 d8                	jne    80cecb <com_puts+0x15>
    }
}
  80cef3:	90                   	nop
  80cef4:	90                   	nop
  80cef5:	c9                   	leave  
  80cef6:	c3                   	ret    

000000000080cef7 <comprintf>:
void comprintf(char* fmt,va_list args){
  80cef7:	f3 0f 1e fa          	endbr64 
  80cefb:	55                   	push   rbp
  80cefc:	48 89 e5             	mov    rbp,rsp
  80ceff:	48 83 ec 20          	sub    rsp,0x20
  80cf03:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cf07:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80cf0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf0f:	48 89 c7             	mov    rdi,rax
  80cf12:	e8 70 03 00 00       	call   80d287 <strlen>
  80cf17:	3d ff 03 00 00       	cmp    eax,0x3ff
  80cf1c:	7f 49                	jg     80cf67 <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80cf1e:	b8 00 00 00 00       	mov    eax,0x0
  80cf23:	e8 25 43 ff ff       	call   80124d <vmalloc>
  80cf28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80cf2c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80cf30:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80cf34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf38:	48 89 ce             	mov    rsi,rcx
  80cf3b:	48 89 c7             	mov    rdi,rax
  80cf3e:	b8 00 00 00 00       	mov    eax,0x0
  80cf43:	e8 6d 03 00 00       	call   80d2b5 <sprintf>
    com_puts(tmp,PORT_COM1);
  80cf48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf4c:	be f8 03 00 00       	mov    esi,0x3f8
  80cf51:	48 89 c7             	mov    rdi,rax
  80cf54:	e8 5d ff ff ff       	call   80ceb6 <com_puts>
    vmfree(tmp);
  80cf59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf5d:	48 89 c7             	mov    rdi,rax
  80cf60:	e8 88 43 ff ff       	call   8012ed <vmfree>
  80cf65:	eb 01                	jmp    80cf68 <comprintf+0x71>
        return;//一次性输出不了太长
  80cf67:	90                   	nop
  80cf68:	c9                   	leave  
  80cf69:	c3                   	ret    

000000000080cf6a <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80cf6a:	f3 0f 1e fa          	endbr64 
  80cf6e:	55                   	push   rbp
  80cf6f:	48 89 e5             	mov    rbp,rsp
  80cf72:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cf76:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80cf7a:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80cf7d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf81:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80cf84:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cf8b:	eb 1b                	jmp    80cfa8 <memcpy+0x3e>
        *(dest)=*(src);
  80cf8d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cf91:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cf94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf98:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80cf9a:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80cf9f:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80cfa4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cfa8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cfab:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80cfae:	77 dd                	ja     80cf8d <memcpy+0x23>
    }
}
  80cfb0:	90                   	nop
  80cfb1:	90                   	nop
  80cfb2:	5d                   	pop    rbp
  80cfb3:	c3                   	ret    

000000000080cfb4 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80cfb4:	f3 0f 1e fa          	endbr64 
  80cfb8:	55                   	push   rbp
  80cfb9:	48 89 e5             	mov    rbp,rsp
  80cfbc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cfc0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80cfc4:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80cfc7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cfce:	eb 3a                	jmp    80d00a <memcmp+0x56>
    {
        if(*a!=*b)
  80cfd0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cfd4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cfd7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cfdb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cfde:	38 c2                	cmp    dl,al
  80cfe0:	74 1a                	je     80cffc <memcmp+0x48>
            return *a-*b;
  80cfe2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cfe6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cfe9:	0f b6 d0             	movzx  edx,al
  80cfec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cff0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cff3:	0f b6 c8             	movzx  ecx,al
  80cff6:	89 d0                	mov    eax,edx
  80cff8:	29 c8                	sub    eax,ecx
  80cffa:	eb 1b                	jmp    80d017 <memcmp+0x63>
        a++;
  80cffc:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80d001:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80d006:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d00a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d00d:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80d010:	7c be                	jl     80cfd0 <memcmp+0x1c>
    }
    return 0;
  80d012:	b8 00 00 00 00       	mov    eax,0x0
}
  80d017:	5d                   	pop    rbp
  80d018:	c3                   	ret    

000000000080d019 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80d019:	f3 0f 1e fa          	endbr64 
  80d01d:	55                   	push   rbp
  80d01e:	48 89 e5             	mov    rbp,rsp
  80d021:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80d025:	89 f0                	mov    eax,esi
  80d027:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80d02a:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80d02d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80d034:	eb 16                	jmp    80d04c <memset+0x33>
        *(buf++)=value;
  80d036:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d03a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d03e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80d042:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80d046:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80d048:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d04c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d04f:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80d052:	72 e2                	jb     80d036 <memset+0x1d>
    }
}
  80d054:	90                   	nop
  80d055:	90                   	nop
  80d056:	5d                   	pop    rbp
  80d057:	c3                   	ret    

000000000080d058 <get_mem_size>:

u32 get_mem_size(){
  80d058:	f3 0f 1e fa          	endbr64 
  80d05c:	55                   	push   rbp
  80d05d:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80d060:	8b 05 96 e2 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e296]        # 42b2fc <mem_end>
}
  80d066:	5d                   	pop    rbp
  80d067:	c3                   	ret    

000000000080d068 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80d068:	f3 0f 1e fa          	endbr64 
  80d06c:	55                   	push   rbp
  80d06d:	48 89 e5             	mov    rbp,rsp
  80d070:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d074:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80d078:	eb 1d                	jmp    80d097 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80d07a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80d07e:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80d082:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80d086:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d08a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80d08e:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80d092:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80d095:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80d097:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d09b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d09e:	84 c0                	test   al,al
  80d0a0:	75 d8                	jne    80d07a <strcpy+0x12>
    }
    *dest='\0';
  80d0a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d0a6:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80d0a9:	90                   	nop
  80d0aa:	5d                   	pop    rbp
  80d0ab:	c3                   	ret    

000000000080d0ac <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80d0ac:	f3 0f 1e fa          	endbr64 
  80d0b0:	55                   	push   rbp
  80d0b1:	48 89 e5             	mov    rbp,rsp
  80d0b4:	48 83 ec 30          	sub    rsp,0x30
  80d0b8:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80d0bc:	89 f0                	mov    eax,esi
  80d0be:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80d0c1:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80d0c6:	0f 84 9c 00 00 00    	je     80d168 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80d0cc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d0d0:	48 89 c6             	mov    rsi,rax
  80d0d3:	bf 20 b3 42 00       	mov    edi,0x42b320
  80d0d8:	e8 8b ff ff ff       	call   80d068 <strcpy>
        char* ptr=strtokkee;
  80d0dd:	48 c7 45 e8 20 b3 42 	mov    QWORD PTR [rbp-0x18],0x42b320
  80d0e4:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80d0e5:	c7 05 31 e4 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1e431],0x0        # 42b520 <tokptr>
  80d0ec:	00 00 00 
  80d0ef:	eb 1c                	jmp    80d10d <strtok+0x61>
  80d0f1:	8b 05 29 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e429]        # 42b520 <tokptr>
  80d0f7:	83 c0 01             	add    eax,0x1
  80d0fa:	99                   	cdq    
  80d0fb:	c1 ea 17             	shr    edx,0x17
  80d0fe:	01 d0                	add    eax,edx
  80d100:	25 ff 01 00 00       	and    eax,0x1ff
  80d105:	29 d0                	sub    eax,edx
  80d107:	89 05 13 e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e413],eax        # 42b520 <tokptr>
  80d10d:	8b 05 0d e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e40d]        # 42b520 <tokptr>
  80d113:	48 98                	cdqe   
  80d115:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d11c:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80d11f:	74 13                	je     80d134 <strtok+0x88>
  80d121:	8b 05 f9 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3f9]        # 42b520 <tokptr>
  80d127:	48 98                	cdqe   
  80d129:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d130:	84 c0                	test   al,al
  80d132:	75 bd                	jne    80d0f1 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80d134:	8b 05 e6 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3e6]        # 42b520 <tokptr>
  80d13a:	48 98                	cdqe   
  80d13c:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
        tokptr=(tokptr+1)%512;
  80d143:	8b 05 d7 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3d7]        # 42b520 <tokptr>
  80d149:	83 c0 01             	add    eax,0x1
  80d14c:	99                   	cdq    
  80d14d:	c1 ea 17             	shr    edx,0x17
  80d150:	01 d0                	add    eax,edx
  80d152:	25 ff 01 00 00       	and    eax,0x1ff
  80d157:	29 d0                	sub    eax,edx
  80d159:	89 05 c1 e3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e3c1],eax        # 42b520 <tokptr>
        return ptr;
  80d15f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d163:	e9 9e 00 00 00       	jmp    80d206 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80d168:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80d16f:	8b 05 ab e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3ab]        # 42b520 <tokptr>
  80d175:	48 98                	cdqe   
  80d177:	48 05 20 b3 42 00    	add    rax,0x42b320
  80d17d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80d181:	eb 20                	jmp    80d1a3 <strtok+0xf7>
  80d183:	8b 05 97 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e397]        # 42b520 <tokptr>
  80d189:	83 c0 01             	add    eax,0x1
  80d18c:	99                   	cdq    
  80d18d:	c1 ea 17             	shr    edx,0x17
  80d190:	01 d0                	add    eax,edx
  80d192:	25 ff 01 00 00       	and    eax,0x1ff
  80d197:	29 d0                	sub    eax,edx
  80d199:	89 05 81 e3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e381],eax        # 42b520 <tokptr>
  80d19f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d1a3:	8b 05 77 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e377]        # 42b520 <tokptr>
  80d1a9:	48 98                	cdqe   
  80d1ab:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d1b2:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80d1b5:	74 13                	je     80d1ca <strtok+0x11e>
  80d1b7:	8b 05 63 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e363]        # 42b520 <tokptr>
  80d1bd:	48 98                	cdqe   
  80d1bf:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d1c6:	84 c0                	test   al,al
  80d1c8:	75 b9                	jne    80d183 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80d1ca:	8b 05 50 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e350]        # 42b520 <tokptr>
  80d1d0:	48 98                	cdqe   
  80d1d2:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
    tokptr=(tokptr+1)%512;
  80d1d9:	8b 05 41 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e341]        # 42b520 <tokptr>
  80d1df:	83 c0 01             	add    eax,0x1
  80d1e2:	99                   	cdq    
  80d1e3:	c1 ea 17             	shr    edx,0x17
  80d1e6:	01 d0                	add    eax,edx
  80d1e8:	25 ff 01 00 00       	and    eax,0x1ff
  80d1ed:	29 d0                	sub    eax,edx
  80d1ef:	89 05 2b e3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e32b],eax        # 42b520 <tokptr>
    if(c)
  80d1f5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d1f9:	74 06                	je     80d201 <strtok+0x155>
        return ptr;
  80d1fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d1ff:	eb 05                	jmp    80d206 <strtok+0x15a>
    else
        return (void*)0;
  80d201:	b8 00 00 00 00       	mov    eax,0x0
}
  80d206:	c9                   	leave  
  80d207:	c3                   	ret    

000000000080d208 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80d208:	f3 0f 1e fa          	endbr64 
  80d20c:	55                   	push   rbp
  80d20d:	48 89 e5             	mov    rbp,rsp
  80d210:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d214:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80d218:	eb 3c                	jmp    80d256 <strcmp+0x4e>
		if(*s1>*s2)
  80d21a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d21e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d221:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d225:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d228:	38 c2                	cmp    dl,al
  80d22a:	7e 07                	jle    80d233 <strcmp+0x2b>
			return 1;
  80d22c:	b8 01 00 00 00       	mov    eax,0x1
  80d231:	eb 52                	jmp    80d285 <strcmp+0x7d>
		else if(*s1<*s2)
  80d233:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d237:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d23a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d23e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d241:	38 c2                	cmp    dl,al
  80d243:	7d 07                	jge    80d24c <strcmp+0x44>
			return -1;
  80d245:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80d24a:	eb 39                	jmp    80d285 <strcmp+0x7d>
		s1++;
  80d24c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80d251:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80d256:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d25a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d25d:	84 c0                	test   al,al
  80d25f:	74 0b                	je     80d26c <strcmp+0x64>
  80d261:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d265:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d268:	84 c0                	test   al,al
  80d26a:	75 ae                	jne    80d21a <strcmp+0x12>
	}
	if(*s1==*s2)
  80d26c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d270:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d273:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d277:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d27a:	38 c2                	cmp    dl,al
  80d27c:	75 07                	jne    80d285 <strcmp+0x7d>
		return 0;
  80d27e:	b8 00 00 00 00       	mov    eax,0x0
  80d283:	eb 00                	jmp    80d285 <strcmp+0x7d>
}
  80d285:	5d                   	pop    rbp
  80d286:	c3                   	ret    

000000000080d287 <strlen>:

int strlen(char *str)
{
  80d287:	f3 0f 1e fa          	endbr64 
  80d28b:	55                   	push   rbp
  80d28c:	48 89 e5             	mov    rbp,rsp
  80d28f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80d293:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80d29a:	eb 09                	jmp    80d2a5 <strlen+0x1e>
  80d29c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80d2a1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d2a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d2a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d2ac:	84 c0                	test   al,al
  80d2ae:	75 ec                	jne    80d29c <strlen+0x15>
    return l;
  80d2b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80d2b3:	5d                   	pop    rbp
  80d2b4:	c3                   	ret    

000000000080d2b5 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80d2b5:	f3 0f 1e fa          	endbr64 
  80d2b9:	55                   	push   rbp
  80d2ba:	48 89 e5             	mov    rbp,rsp
  80d2bd:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80d2c4:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80d2cb:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80d2d2:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80d2d9:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80d2e0:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80d2e7:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80d2ee:	84 c0                	test   al,al
  80d2f0:	74 20                	je     80d312 <sprintf+0x5d>
  80d2f2:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80d2f6:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80d2fa:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80d2fe:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80d302:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80d306:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80d30a:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80d30e:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80d312:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d319:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80d320:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d327:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80d32e:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80d335:	00 00 00 
    while (*pstr!='\n')
  80d338:	eb 39                	jmp    80d373 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80d33a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d341:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d344:	3c 25                	cmp    al,0x25
  80d346:	75 15                	jne    80d35d <sprintf+0xa8>
  80d348:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80d34f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d352:	3c 25                	cmp    al,0x25
  80d354:	74 07                	je     80d35d <sprintf+0xa8>
            argnum++;
  80d356:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80d35d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d364:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80d36b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d372:	01 
    while (*pstr!='\n')
  80d373:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d37a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d37d:	3c 0a                	cmp    al,0xa
  80d37f:	75 b9                	jne    80d33a <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80d381:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80d388:	00 00 00 
  80d38b:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80d392:	00 00 00 
  80d395:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80d399:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80d3a0:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80d3a7:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80d3ae:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d3b5:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80d3bc:	e9 e2 01 00 00       	jmp    80d5a3 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80d3c1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d3c8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d3cb:	3c 25                	cmp    al,0x25
  80d3cd:	0f 85 aa 01 00 00    	jne    80d57d <sprintf+0x2c8>
  80d3d3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d3da:	48 83 c0 01          	add    rax,0x1
  80d3de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d3e1:	84 c0                	test   al,al
  80d3e3:	0f 84 94 01 00 00    	je     80d57d <sprintf+0x2c8>
            pstr++;
  80d3e9:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d3f0:	01 
            if(*pstr=='x'){
  80d3f1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d3f8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d3fb:	3c 78                	cmp    al,0x78
  80d3fd:	75 64                	jne    80d463 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80d3ff:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d405:	83 f8 2f             	cmp    eax,0x2f
  80d408:	77 23                	ja     80d42d <sprintf+0x178>
  80d40a:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d411:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d417:	89 d2                	mov    edx,edx
  80d419:	48 01 d0             	add    rax,rdx
  80d41c:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d422:	83 c2 08             	add    edx,0x8
  80d425:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d42b:	eb 12                	jmp    80d43f <sprintf+0x18a>
  80d42d:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d434:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d438:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d43f:	8b 00                	mov    eax,DWORD PTR [rax]
  80d441:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80d447:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80d44d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d454:	89 d6                	mov    esi,edx
  80d456:	48 89 c7             	mov    rdi,rax
  80d459:	e8 4e 02 00 00       	call   80d6ac <sprint_hex>
            if(*pstr=='x'){
  80d45e:	e9 38 01 00 00       	jmp    80d59b <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80d463:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d46a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d46d:	3c 73                	cmp    al,0x73
  80d46f:	75 68                	jne    80d4d9 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80d471:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d477:	83 f8 2f             	cmp    eax,0x2f
  80d47a:	77 23                	ja     80d49f <sprintf+0x1ea>
  80d47c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d483:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d489:	89 d2                	mov    edx,edx
  80d48b:	48 01 d0             	add    rax,rdx
  80d48e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d494:	83 c2 08             	add    edx,0x8
  80d497:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d49d:	eb 12                	jmp    80d4b1 <sprintf+0x1fc>
  80d49f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d4a6:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d4aa:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d4b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d4b4:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80d4bb:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80d4c2:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d4c9:	48 89 d6             	mov    rsi,rdx
  80d4cc:	48 89 c7             	mov    rdi,rax
  80d4cf:	e8 5a 02 00 00       	call   80d72e <sprintn>
            if(*pstr=='x'){
  80d4d4:	e9 c2 00 00 00       	jmp    80d59b <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80d4d9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d4e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d4e3:	3c 64                	cmp    al,0x64
  80d4e5:	75 66                	jne    80d54d <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80d4e7:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d4ed:	83 f8 2f             	cmp    eax,0x2f
  80d4f0:	77 23                	ja     80d515 <sprintf+0x260>
  80d4f2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d4f9:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d4ff:	89 d2                	mov    edx,edx
  80d501:	48 01 d0             	add    rax,rdx
  80d504:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d50a:	83 c2 08             	add    edx,0x8
  80d50d:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d513:	eb 12                	jmp    80d527 <sprintf+0x272>
  80d515:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d51c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d520:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d527:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d52a:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80d531:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80d538:	89 c2                	mov    edx,eax
  80d53a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d541:	89 d6                	mov    esi,edx
  80d543:	48 89 c7             	mov    rdi,rax
  80d546:	e8 ad 00 00 00       	call   80d5f8 <sprint_decimal>
            if(*pstr=='x'){
  80d54b:	eb 4e                	jmp    80d59b <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80d54d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d554:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d557:	3c 63                	cmp    al,0x63
  80d559:	75 02                	jne    80d55d <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80d55b:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80d55d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d564:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d567:	0f be d0             	movsx  edx,al
  80d56a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d571:	89 d6                	mov    esi,edx
  80d573:	48 89 c7             	mov    rdi,rax
  80d576:	e8 3e 00 00 00       	call   80d5b9 <sprintchar>
            if(*pstr=='x'){
  80d57b:	eb 1e                	jmp    80d59b <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80d57d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d584:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d587:	0f be d0             	movsx  edx,al
  80d58a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d591:	89 d6                	mov    esi,edx
  80d593:	48 89 c7             	mov    rdi,rax
  80d596:	e8 1e 00 00 00       	call   80d5b9 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80d59b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d5a2:	01 
  80d5a3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d5aa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d5ad:	84 c0                	test   al,al
  80d5af:	0f 85 0c fe ff ff    	jne    80d3c1 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80d5b5:	90                   	nop
  80d5b6:	90                   	nop
  80d5b7:	c9                   	leave  
  80d5b8:	c3                   	ret    

000000000080d5b9 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80d5b9:	f3 0f 1e fa          	endbr64 
  80d5bd:	55                   	push   rbp
  80d5be:	48 89 e5             	mov    rbp,rsp
  80d5c1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d5c5:	89 f0                	mov    eax,esi
  80d5c7:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80d5ca:	eb 05                	jmp    80d5d1 <sprintchar+0x18>
        dist++;
  80d5cc:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80d5d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d5d5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d5d8:	84 c0                	test   al,al
  80d5da:	75 f0                	jne    80d5cc <sprintchar+0x13>
    *dist++=c;
  80d5dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d5e0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d5e4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80d5e8:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80d5ec:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80d5ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d5f2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80d5f5:	90                   	nop
  80d5f6:	5d                   	pop    rbp
  80d5f7:	c3                   	ret    

000000000080d5f8 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80d5f8:	f3 0f 1e fa          	endbr64 
  80d5fc:	55                   	push   rbp
  80d5fd:	48 89 e5             	mov    rbp,rsp
  80d600:	48 83 ec 30          	sub    rsp,0x30
  80d604:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80d608:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80d60b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80d612:	eb 65                	jmp    80d679 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80d614:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80d617:	48 63 c2             	movsxd rax,edx
  80d61a:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80d621:	48 c1 e8 20          	shr    rax,0x20
  80d625:	c1 f8 02             	sar    eax,0x2
  80d628:	89 d6                	mov    esi,edx
  80d62a:	c1 fe 1f             	sar    esi,0x1f
  80d62d:	29 f0                	sub    eax,esi
  80d62f:	89 c1                	mov    ecx,eax
  80d631:	89 c8                	mov    eax,ecx
  80d633:	c1 e0 02             	shl    eax,0x2
  80d636:	01 c8                	add    eax,ecx
  80d638:	01 c0                	add    eax,eax
  80d63a:	89 d1                	mov    ecx,edx
  80d63c:	29 c1                	sub    ecx,eax
  80d63e:	89 c8                	mov    eax,ecx
  80d640:	83 c0 30             	add    eax,0x30
  80d643:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80d646:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d649:	8d 50 01             	lea    edx,[rax+0x1]
  80d64c:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d64f:	48 98                	cdqe   
  80d651:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d655:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80d659:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80d65c:	48 63 d0             	movsxd rdx,eax
  80d65f:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80d666:	48 c1 ea 20          	shr    rdx,0x20
  80d66a:	c1 fa 02             	sar    edx,0x2
  80d66d:	c1 f8 1f             	sar    eax,0x1f
  80d670:	89 c1                	mov    ecx,eax
  80d672:	89 d0                	mov    eax,edx
  80d674:	29 c8                	sub    eax,ecx
  80d676:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80d679:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d67c:	83 f8 0f             	cmp    eax,0xf
  80d67f:	76 93                	jbe    80d614 <sprint_decimal+0x1c>
    }
    while(p>0)
  80d681:	eb 1f                	jmp    80d6a2 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80d683:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d687:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d68a:	48 98                	cdqe   
  80d68c:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80d691:	0f be d0             	movsx  edx,al
  80d694:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d698:	89 d6                	mov    esi,edx
  80d69a:	48 89 c7             	mov    rdi,rax
  80d69d:	e8 17 ff ff ff       	call   80d5b9 <sprintchar>
    while(p>0)
  80d6a2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d6a6:	7f db                	jg     80d683 <sprint_decimal+0x8b>
    }
}
  80d6a8:	90                   	nop
  80d6a9:	90                   	nop
  80d6aa:	c9                   	leave  
  80d6ab:	c3                   	ret    

000000000080d6ac <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80d6ac:	f3 0f 1e fa          	endbr64 
  80d6b0:	55                   	push   rbp
  80d6b1:	48 89 e5             	mov    rbp,rsp
  80d6b4:	48 83 ec 20          	sub    rsp,0x20
  80d6b8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80d6bc:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80d6bf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80d6c6:	eb 35                	jmp    80d6fd <sprint_hex+0x51>
        unsigned char a=c%16;
  80d6c8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d6cb:	83 e0 0f             	and    eax,0xf
  80d6ce:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80d6d1:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80d6d5:	76 06                	jbe    80d6dd <sprint_hex+0x31>
  80d6d7:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80d6db:	eb 04                	jmp    80d6e1 <sprint_hex+0x35>
        else a+='0';
  80d6dd:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80d6e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d6e4:	8d 50 01             	lea    edx,[rax+0x1]
  80d6e7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d6ea:	48 98                	cdqe   
  80d6ec:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d6f0:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80d6f4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d6f7:	c1 e8 04             	shr    eax,0x4
  80d6fa:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80d6fd:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80d701:	7e c5                	jle    80d6c8 <sprint_hex+0x1c>
    }
    while(p>0)
  80d703:	eb 1f                	jmp    80d724 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80d705:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d709:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d70c:	48 98                	cdqe   
  80d70e:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80d713:	0f be d0             	movsx  edx,al
  80d716:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d71a:	89 d6                	mov    esi,edx
  80d71c:	48 89 c7             	mov    rdi,rax
  80d71f:	e8 95 fe ff ff       	call   80d5b9 <sprintchar>
    while(p>0)
  80d724:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d728:	7f db                	jg     80d705 <sprint_hex+0x59>
    }
}
  80d72a:	90                   	nop
  80d72b:	90                   	nop
  80d72c:	c9                   	leave  
  80d72d:	c3                   	ret    

000000000080d72e <sprintn>:
void sprintn(char *dist,char *str)
{
  80d72e:	f3 0f 1e fa          	endbr64 
  80d732:	55                   	push   rbp
  80d733:	48 89 e5             	mov    rbp,rsp
  80d736:	48 83 ec 10          	sub    rsp,0x10
  80d73a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d73e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80d742:	eb 20                	jmp    80d764 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80d744:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d748:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d74c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80d750:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d753:	0f be d0             	movsx  edx,al
  80d756:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d75a:	89 d6                	mov    esi,edx
  80d75c:	48 89 c7             	mov    rdi,rax
  80d75f:	e8 55 fe ff ff       	call   80d5b9 <sprintchar>
    while(*str!='\0')
  80d764:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d768:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d76b:	84 c0                	test   al,al
  80d76d:	75 d5                	jne    80d744 <sprintn+0x16>
    }
  80d76f:	90                   	nop
  80d770:	90                   	nop
  80d771:	c9                   	leave  
  80d772:	c3                   	ret    
  80d773:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80d77a:	00 00 00 
  80d77d:	0f 1f 00             	nop    DWORD PTR [rax]

000000000080d780 <create_zero>:
  80d780:	e8 e8 6b ff ff       	call   80436d <req_proc>
  80d785:	83 f8 ff             	cmp    eax,0xffffffff
  80d788:	74 0c                	je     80d796 <create_zero.retu>
  80d78a:	e8 a9 6c ff ff       	call   804438 <set_proc>
  80d78f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80d793:	83 c4 40             	add    esp,0x40

000000000080d796 <create_zero.retu>:
  80d796:	c3                   	ret    

000000000080d797 <fill_desc>:
  80d797:	55                   	push   rbp
  80d798:	48 89 e5             	mov    rbp,rsp
  80d79b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80d79f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80d7a3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80d7a7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80d7ab:	be ea d8 80 00       	mov    esi,0x80d8ea
  80d7b0:	c7 04 25 ea d8 80 00 	mov    DWORD PTR ds:0x80d8ea,0x0
  80d7b7:	00 00 00 00 
  80d7bb:	c7 04 25 ee d8 80 00 	mov    DWORD PTR ds:0x80d8ee,0x0
  80d7c2:	00 00 00 00 
  80d7c6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80d7ca:	c1 e9 10             	shr    ecx,0x10
  80d7cd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80d7d2:	c1 ea 10             	shr    edx,0x10
  80d7d5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80d7d9:	66 c1 ea 08          	shr    dx,0x8
  80d7dd:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80d7e1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80d7e6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80d7ea:	c1 e1 08             	shl    ecx,0x8
  80d7ed:	09 cf                	or     edi,ecx
  80d7ef:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80d7f3:	8b 14 25 ea d8 80 00 	mov    edx,DWORD PTR ds:0x80d8ea
  80d7fa:	67 89 10             	mov    DWORD PTR [eax],edx
  80d7fd:	8b 14 25 ee d8 80 00 	mov    edx,DWORD PTR ds:0x80d8ee
  80d804:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80d808:	c9                   	leave  
  80d809:	c3                   	ret    

000000000080d80a <switch_proc_asm>:
  80d80a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80d810:	66 89 04 25 28 d8 80 	mov    WORD PTR ds:0x80d828,ax
  80d817:	00 
  80d818:	c7 04 25 24 d8 80 00 	mov    DWORD PTR ds:0x80d824,0x0
  80d81f:	00 00 00 00 

000000000080d823 <switch_proc_asm.ljmp>:
  80d823:	ea                   	(bad)  
  80d824:	00 00                	add    BYTE PTR [rax],al
  80d826:	00 00                	add    BYTE PTR [rax],al
  80d828:	00 00                	add    BYTE PTR [rax],al
  80d82a:	c3                   	ret    

000000000080d82b <switch_to_old>:
  80d82b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80d830:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80d834:	bf 9c d8 80 00       	mov    edi,0x80d89c
  80d839:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80d83d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80d841:	89 c1                	mov    ecx,eax
  80d843:	83 e9 04             	sub    ecx,0x4
  80d846:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80d849:	50                   	push   rax
  80d84a:	89 f5                	mov    ebp,esi
  80d84c:	83 c5 28             	add    ebp,0x28
  80d84f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d853:	50                   	push   rax
  80d854:	83 c5 04             	add    ebp,0x4
  80d857:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d85b:	50                   	push   rax
  80d85c:	83 c5 04             	add    ebp,0x4
  80d85f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d863:	50                   	push   rax
  80d864:	83 c5 04             	add    ebp,0x4
  80d867:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d86b:	50                   	push   rax
  80d86c:	83 c5 04             	add    ebp,0x4
  80d86f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d873:	50                   	push   rax
  80d874:	83 c5 04             	add    ebp,0x4
  80d877:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d87b:	50                   	push   rax
  80d87c:	83 c5 04             	add    ebp,0x4
  80d87f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d883:	50                   	push   rax
  80d884:	83 c5 04             	add    ebp,0x4
  80d887:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d88b:	50                   	push   rax
  80d88c:	83 c5 04             	add    ebp,0x4
  80d88f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80d893:	0f 22 d8             	mov    cr3,rax
  80d896:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80d89a:	50                   	push   rax
  80d89b:	5c                   	pop    rsp

000000000080d89c <switch_to_old.leap>:
  80d89c:	ea                   	(bad)  
  80d89d:	00 00                	add    BYTE PTR [rax],al
  80d89f:	00 00                	add    BYTE PTR [rax],al
  80d8a1:	08 00                	or     BYTE PTR [rax],al

000000000080d8a3 <save_context>:
  80d8a3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80d8a8:	83 c0 44             	add    eax,0x44
  80d8ab:	b9 08 00 00 00       	mov    ecx,0x8
  80d8b0:	89 e7                	mov    edi,esp

000000000080d8b2 <save_context.loops>:
  80d8b2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80d8b5:	67 89 10             	mov    DWORD PTR [eax],edx
  80d8b8:	83 c7 04             	add    edi,0x4
  80d8bb:	83 e8 04             	sub    eax,0x4
  80d8be:	e2 f2                	loop   80d8b2 <save_context.loops>
  80d8c0:	5b                   	pop    rbx
  80d8c1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80d8c6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80d8ca:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80d8cf:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80d8d3:	c3                   	ret    

000000000080d8d4 <move_to_user_mode>:
  80d8d4:	66 b8 20 00          	mov    ax,0x20
  80d8d8:	8e d8                	mov    ds,eax
  80d8da:	8e c0                	mov    es,eax
  80d8dc:	8e e8                	mov    gs,eax
  80d8de:	6a 20                	push   0x20
  80d8e0:	54                   	push   rsp
  80d8e1:	6a 18                	push   0x18
  80d8e3:	68 e9 d8 80 00       	push   0x80d8e9
  80d8e8:	cf                   	iret   

000000000080d8e9 <move_to_user_mode.done>:
  80d8e9:	c3                   	ret    

000000000080d8ea <desc>:
	...

000000000080d8f2 <ret_sys_call>:
  80d8f2:	58                   	pop    rax
  80d8f3:	8e d8                	mov    ds,eax
  80d8f5:	58                   	pop    rax
  80d8f6:	8e c0                	mov    es,eax
  80d8f8:	41 5f                	pop    r15
  80d8fa:	41 5e                	pop    r14
  80d8fc:	41 5d                	pop    r13
  80d8fe:	41 5c                	pop    r12
  80d900:	41 5b                	pop    r11
  80d902:	41 5a                	pop    r10
  80d904:	41 59                	pop    r9
  80d906:	41 58                	pop    r8
  80d908:	5e                   	pop    rsi
  80d909:	5f                   	pop    rdi
  80d90a:	5a                   	pop    rdx
  80d90b:	59                   	pop    rcx
  80d90c:	5b                   	pop    rbx
  80d90d:	58                   	pop    rax

000000000080d90e <tmp>:
  80d90e:	48 0f 07             	sysretq 

000000000080d911 <ret_normal_proc>:
  80d911:	58                   	pop    rax
  80d912:	8e d8                	mov    ds,eax
  80d914:	58                   	pop    rax
  80d915:	8e c0                	mov    es,eax
  80d917:	41 5f                	pop    r15
  80d919:	41 5e                	pop    r14
  80d91b:	41 5d                	pop    r13
  80d91d:	41 5c                	pop    r12
  80d91f:	41 5b                	pop    r11
  80d921:	41 5a                	pop    r10
  80d923:	41 59                	pop    r9
  80d925:	41 58                	pop    r8
  80d927:	5e                   	pop    rsi
  80d928:	5f                   	pop    rdi
  80d929:	5a                   	pop    rdx
  80d92a:	59                   	pop    rcx
  80d92b:	5b                   	pop    rbx
  80d92c:	58                   	pop    rax
  80d92d:	c3                   	ret    
