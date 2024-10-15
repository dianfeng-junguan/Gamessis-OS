
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
  100093:	b8 2e 08 80 00       	mov    eax,0x80082e
  100098:	ea                   	(bad)  
  100099:	2e                   	cs
  10009a:	08                   	.byte 0x8
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
  80000c:	b8 ff 03 80 00       	mov    eax,0x8003ff
  800011:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 0d 03 00 00       	call   800335 <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800028:	b8 19 04 80 00       	mov    eax,0x800419
  80002d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 f1 02 00 00       	call   800335 <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800044:	b8 33 04 80 00       	mov    eax,0x800433
  800049:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 d5 02 00 00       	call   800335 <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800060:	b8 4d 04 80 00       	mov    eax,0x80044d
  800065:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 b9 02 00 00       	call   800335 <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80007c:	b8 67 04 80 00       	mov    eax,0x800467
  800081:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 9d 02 00 00       	call   800335 <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800098:	b8 81 04 80 00       	mov    eax,0x800481
  80009d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 81 02 00 00       	call   800335 <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000b4:	b8 9b 04 80 00       	mov    eax,0x80049b
  8000b9:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 65 02 00 00       	call   800335 <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000d0:	b8 bf 04 80 00       	mov    eax,0x8004bf
  8000d5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 49 02 00 00       	call   800335 <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//double_ints
  8000ec:	b8 d9 04 80 00       	mov    eax,0x8004d9
  8000f1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 2d 02 00 00       	call   800335 <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800108:	b8 f3 04 80 00       	mov    eax,0x8004f3
  80010d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 11 02 00 00       	call   800335 <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800124:	b8 0b 05 80 00       	mov    eax,0x80050b
  800129:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 f5 01 00 00       	call   800335 <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800140:	b8 25 05 80 00       	mov    eax,0x800525
  800145:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 d9 01 00 00       	call   800335 <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80015c:	b8 3f 05 80 00       	mov    eax,0x80053f
  800161:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 bd 01 00 00       	call   800335 <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800178:	b8 59 05 80 00       	mov    eax,0x800559
  80017d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 a1 01 00 00       	call   800335 <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800194:	b8 9f 13 80 00       	mov    eax,0x80139f
  800199:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 85 01 00 00       	call   800335 <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001b0:	b8 33 04 80 00       	mov    eax,0x800433
  8001b5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 69 01 00 00       	call   800335 <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001cc:	b8 80 05 80 00       	mov    eax,0x800580
  8001d1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 4d 01 00 00       	call   800335 <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be 33 04 80 00       	mov    esi,0x800433
  8001f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8001f9:	0f b6 c0             	movzx  eax,al
  8001fc:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800201:	ba 08 00 00 00       	mov    edx,0x8
  800206:	89 c7                	mov    edi,eax
  800208:	e8 28 01 00 00       	call   800335 <set_gate>
    for (int i=17;i<48;i++)
  80020d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  800211:	83 7d fc 2f          	cmp    DWORD PTR [rbp-0x4],0x2f
  800215:	7e da                	jle    8001f1 <init_int+0x1f1>
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800217:	b8 3a 78 80 00       	mov    eax,0x80783a
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 60 59 80 00       	mov    eax,0x805960
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 60 87 80 00       	mov    eax,0x808760
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 70 63 80 00       	mov    eax,0x806370
  800270:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800275:	ba 08 00 00 00       	mov    edx,0x8
  80027a:	48 89 c6             	mov    rsi,rax
  80027d:	bf 80 00 00 00       	mov    edi,0x80
  800282:	e8 ae 00 00 00       	call   800335 <set_gate>
    //set_gate(0x2c,mouse_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    //启动8259A
    
	//ICW1
	outb(0x20,0x11);
  800287:	be 11 00 00 00       	mov    esi,0x11
  80028c:	bf 20 00 00 00       	mov    edi,0x20
  800291:	e8 3a 54 00 00       	call   8056d0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 2b 54 00 00       	call   8056d0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 1c 54 00 00       	call   8056d0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 0d 54 00 00       	call   8056d0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 fe 53 00 00       	call   8056d0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 ef 53 00 00       	call   8056d0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 e0 53 00 00       	call   8056d0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 d1 53 00 00       	call   8056d0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 01 54 00 00       	call   80570a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 70 63 80 00       	mov    eax,0x806370
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 e6 04 00 00       	call   800804 <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 d2 04 00 00       	call   800804 <wrmsr>
}
  800332:	90                   	nop
  800333:	c9                   	leave  
  800334:	c3                   	ret    

0000000000800335 <set_gate>:
void set_gate(u8 index,addr_t offset,u16 selector,u16 attr)
{
  800335:	f3 0f 1e fa          	endbr64 
  800339:	55                   	push   rbp
  80033a:	48 89 e5             	mov    rbp,rsp
  80033d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800341:	89 c8                	mov    eax,ecx
  800343:	89 f9                	mov    ecx,edi
  800345:	88 4d fc             	mov    BYTE PTR [rbp-0x4],cl
  800348:	66 89 55 f8          	mov    WORD PTR [rbp-0x8],dx
  80034c:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    idt[index].offset_low=offset&0xffffu;
    idt[index].offset_high=(offset>>16)&0xffffu;
    idt[index].attr=attr;
    idt[index].selector=selector;
#else
    idt[index].offset_low=offset&0xffff;
  800350:	48 8b 15 a9 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbca9]        # 80c000 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 85 bc 00 00 	mov    rcx,QWORD PTR [rip+0xbc85]        # 80c000 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 65 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc65]        # 80c000 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 4d bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc4d]        # 80c000 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 30 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc30]        # 80c000 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 16 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc16]        # 80c000 <idt>
  8003ea:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003ee:	48 c1 e0 04          	shl    rax,0x4
  8003f2:	48 01 d0             	add    rax,rdx
  8003f5:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
#endif
}
  8003fc:	90                   	nop
  8003fd:	5d                   	pop    rbp
  8003fe:	c3                   	ret    

00000000008003ff <divide_err>:

void divide_err(){
  8003ff:	f3 0f 1e fa          	endbr64 
  800403:	55                   	push   rbp
  800404:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800407:	fa                   	cli    
    //puts("divide err");
    eoi();
  800408:	b8 00 00 00 00       	mov    eax,0x0
  80040d:	e8 ec 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800412:	fb                   	sti    
  800413:	c9                   	leave  
  800414:	48 cf                	iretq  
}
  800416:	90                   	nop
  800417:	5d                   	pop    rbp
  800418:	c3                   	ret    

0000000000800419 <debug>:

void debug(){
  800419:	f3 0f 1e fa          	endbr64 
  80041d:	55                   	push   rbp
  80041e:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800421:	fa                   	cli    
    //puts("debug");
    eoi();
  800422:	b8 00 00 00 00       	mov    eax,0x0
  800427:	e8 d2 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80042c:	fb                   	sti    
  80042d:	c9                   	leave  
  80042e:	48 cf                	iretq  
}
  800430:	90                   	nop
  800431:	5d                   	pop    rbp
  800432:	c3                   	ret    

0000000000800433 <default_int_proc>:
void default_int_proc(){
  800433:	f3 0f 1e fa          	endbr64 
  800437:	55                   	push   rbp
  800438:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80043b:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  80043c:	b8 00 00 00 00       	mov    eax,0x0
  800441:	e8 b8 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800446:	fb                   	sti    
  800447:	c9                   	leave  
  800448:	48 cf                	iretq  
}
  80044a:	90                   	nop
  80044b:	5d                   	pop    rbp
  80044c:	c3                   	ret    

000000000080044d <breakpoint>:
void breakpoint(){
  80044d:	f3 0f 1e fa          	endbr64 
  800451:	55                   	push   rbp
  800452:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800455:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  800456:	b8 00 00 00 00       	mov    eax,0x0
  80045b:	e8 9e 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800460:	fb                   	sti    
  800461:	c9                   	leave  
  800462:	48 cf                	iretq  
}
  800464:	90                   	nop
  800465:	5d                   	pop    rbp
  800466:	c3                   	ret    

0000000000800467 <overflow>:
void overflow(){
  800467:	f3 0f 1e fa          	endbr64 
  80046b:	55                   	push   rbp
  80046c:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80046f:	fa                   	cli    
    //puts("overflow");
    eoi();
  800470:	b8 00 00 00 00       	mov    eax,0x0
  800475:	e8 84 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80047a:	fb                   	sti    
  80047b:	c9                   	leave  
  80047c:	48 cf                	iretq  
}
  80047e:	90                   	nop
  80047f:	5d                   	pop    rbp
  800480:	c3                   	ret    

0000000000800481 <bounds>:
void bounds(){
  800481:	f3 0f 1e fa          	endbr64 
  800485:	55                   	push   rbp
  800486:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800489:	fa                   	cli    
    //puts("bounds");
    eoi();
  80048a:	b8 00 00 00 00       	mov    eax,0x0
  80048f:	e8 6a 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800494:	fb                   	sti    
  800495:	c9                   	leave  
  800496:	48 cf                	iretq  
}
  800498:	90                   	nop
  800499:	5d                   	pop    rbp
  80049a:	c3                   	ret    

000000000080049b <undefined_operator>:
void undefined_operator(){
  80049b:	f3 0f 1e fa          	endbr64 
  80049f:	55                   	push   rbp
  8004a0:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  8004a3:	b8 00 00 00 00       	mov    eax,0x0
  8004a8:	e8 51 52 00 00       	call   8056fe <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 72 52 00 00       	call   805729 <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  8004b7:	eb fe                	jmp    8004b7 <undefined_operator+0x1c>
  8004b9:	c9                   	leave  
  8004ba:	48 cf                	iretq  
}
  8004bc:	90                   	nop
  8004bd:	5d                   	pop    rbp
  8004be:	c3                   	ret    

00000000008004bf <coprocessor_notexist>:
void coprocessor_notexist(){
  8004bf:	f3 0f 1e fa          	endbr64 
  8004c3:	55                   	push   rbp
  8004c4:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004c7:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  8004c8:	b8 00 00 00 00       	mov    eax,0x0
  8004cd:	e8 2c 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004d2:	fb                   	sti    
  8004d3:	c9                   	leave  
  8004d4:	48 cf                	iretq  
}
  8004d6:	90                   	nop
  8004d7:	5d                   	pop    rbp
  8004d8:	c3                   	ret    

00000000008004d9 <double_ints>:
void double_ints(){
  8004d9:	f3 0f 1e fa          	endbr64 
  8004dd:	55                   	push   rbp
  8004de:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004e1:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  8004e2:	b8 00 00 00 00       	mov    eax,0x0
  8004e7:	e8 12 52 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004ec:	fb                   	sti    
  8004ed:	c9                   	leave  
  8004ee:	48 cf                	iretq  
}
  8004f0:	90                   	nop
  8004f1:	5d                   	pop    rbp
  8004f2:	c3                   	ret    

00000000008004f3 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  8004f3:	f3 0f 1e fa          	endbr64 
  8004f7:	55                   	push   rbp
  8004f8:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  8004fb:	b8 00 00 00 00       	mov    eax,0x0
  800500:	e8 f9 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("leave \r\n iretq");
  800505:	c9                   	leave  
  800506:	48 cf                	iretq  
}
  800508:	90                   	nop
  800509:	5d                   	pop    rbp
  80050a:	c3                   	ret    

000000000080050b <invalid_tss>:
void invalid_tss(){
  80050b:	f3 0f 1e fa          	endbr64 
  80050f:	55                   	push   rbp
  800510:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800513:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  800514:	b8 00 00 00 00       	mov    eax,0x0
  800519:	e8 e0 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80051e:	fb                   	sti    
  80051f:	c9                   	leave  
  800520:	48 cf                	iretq  
}
  800522:	90                   	nop
  800523:	5d                   	pop    rbp
  800524:	c3                   	ret    

0000000000800525 <segment_notexist>:
void segment_notexist(){
  800525:	f3 0f 1e fa          	endbr64 
  800529:	55                   	push   rbp
  80052a:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80052d:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  80052e:	b8 00 00 00 00       	mov    eax,0x0
  800533:	e8 c6 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800538:	fb                   	sti    
  800539:	c9                   	leave  
  80053a:	48 cf                	iretq  
}
  80053c:	90                   	nop
  80053d:	5d                   	pop    rbp
  80053e:	c3                   	ret    

000000000080053f <stackseg_overbound>:
void stackseg_overbound(){
  80053f:	f3 0f 1e fa          	endbr64 
  800543:	55                   	push   rbp
  800544:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800547:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  800548:	b8 00 00 00 00       	mov    eax,0x0
  80054d:	e8 ac 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800552:	fb                   	sti    
  800553:	c9                   	leave  
  800554:	48 cf                	iretq  
}
  800556:	90                   	nop
  800557:	5d                   	pop    rbp
  800558:	c3                   	ret    

0000000000800559 <general_protect>:
void general_protect(){
  800559:	f3 0f 1e fa          	endbr64 
  80055d:	55                   	push   rbp
  80055e:	48 89 e5             	mov    rbp,rsp
  800561:	48 83 ec 10          	sub    rsp,0x10
    //print("general protect.");
    int err_code=0;
  800565:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  80056c:	b8 00 00 00 00       	mov    eax,0x0
  800571:	e8 88 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("leave\r\n add $8,%rsp \r\n iretq");
  800576:	c9                   	leave  
  800577:	48 83 c4 08          	add    rsp,0x8
  80057b:	48 cf                	iretq  
}
  80057d:	90                   	nop
  80057e:	c9                   	leave  
  80057f:	c3                   	ret    

0000000000800580 <coprocessor_err>:

void coprocessor_err(){
  800580:	f3 0f 1e fa          	endbr64 
  800584:	55                   	push   rbp
  800585:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800588:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  800589:	b8 00 00 00 00       	mov    eax,0x0
  80058e:	e8 6b 51 00 00       	call   8056fe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800593:	fb                   	sti    
  800594:	c9                   	leave  
  800595:	48 cf                	iretq  
}
  800597:	90                   	nop
  800598:	5d                   	pop    rbp
  800599:	c3                   	ret    

000000000080059a <syscall>:

xchg rcx to r10

*/
int syscall(int a, int b, int c, int d, int e, int f)
{
  80059a:	f3 0f 1e fa          	endbr64 
  80059e:	55                   	push   rbp
  80059f:	48 89 e5             	mov    rbp,rsp
  8005a2:	48 83 ec 30          	sub    rsp,0x30
  8005a6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8005a9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8005ac:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8005af:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8005b2:	44 89 45 dc          	mov    DWORD PTR [rbp-0x24],r8d
  8005b6:	44 89 4d d8          	mov    DWORD PTR [rbp-0x28],r9d
    unsigned long num;
    asm volatile("":"=a"(num));//这样rax中存的参数就到这了
  8005ba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    switch (num)
  8005be:	48 83 7d f8 64       	cmp    QWORD PTR [rbp-0x8],0x64
  8005c3:	0f 87 39 02 00 00    	ja     800802 <syscall+0x268>
  8005c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8005cd:	48 c1 e0 03          	shl    rax,0x3
  8005d1:	48 05 40 37 81 00    	add    rax,0x813740
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 92 1f 00 00       	call   80257c <reg_device>
  8005ea:	e9 13 02 00 00       	jmp    800802 <syscall+0x268>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 e2 29 00 00       	call   802fdb <dispose_device>
  8005f9:	e9 04 02 00 00       	jmp    800802 <syscall+0x268>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 59 22 00 00       	call   802864 <reg_driver>
  80060b:	e9 f2 01 00 00       	jmp    800802 <syscall+0x268>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 5c 2a 00 00       	call   803079 <dispose_driver>
  80061d:	e9 e0 01 00 00       	jmp    800802 <syscall+0x268>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 4b 27 00 00       	call   802d84 <call_drv_func>
  800639:	e9 c4 01 00 00       	jmp    800802 <syscall+0x268>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 d0 12 00 00       	call   801920 <req_page_at>
  800650:	e9 ad 01 00 00       	jmp    800802 <syscall+0x268>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 cb 10 00 00       	call   80172d <free_page>
  800662:	e9 9b 01 00 00       	jmp    800802 <syscall+0x268>
        case 7:return reg_proc(a, b, c);
  800667:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80066a:	48 98                	cdqe   
  80066c:	48 89 c2             	mov    rdx,rax
  80066f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800672:	48 98                	cdqe   
  800674:	48 89 c1             	mov    rcx,rax
  800677:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80067a:	48 98                	cdqe   
  80067c:	48 89 ce             	mov    rsi,rcx
  80067f:	48 89 c7             	mov    rdi,rax
  800682:	e8 b1 3d 00 00       	call   804438 <reg_proc>
  800687:	e9 76 01 00 00       	jmp    800802 <syscall+0x268>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 6d 3b 00 00       	call   804203 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 54 13 00 00       	call   8019f9 <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 96 67 00 00       	call   806e50 <sys_open>
  8006ba:	e9 43 01 00 00       	jmp    800802 <syscall+0x268>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 9e 6a 00 00       	call   807167 <sys_close>
  8006c9:	e9 34 01 00 00       	jmp    800802 <syscall+0x268>
        case 13:return sys_read(a,b,c);
  8006ce:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006d1:	48 63 d0             	movsxd rdx,eax
  8006d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006d7:	48 98                	cdqe   
  8006d9:	48 89 c1             	mov    rcx,rax
  8006dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006df:	48 89 ce             	mov    rsi,rcx
  8006e2:	89 c7                	mov    edi,eax
  8006e4:	e8 36 6b 00 00       	call   80721f <sys_read>
  8006e9:	e9 14 01 00 00       	jmp    800802 <syscall+0x268>
        case 14:return sys_write(a,b,c);
  8006ee:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006f1:	48 63 d0             	movsxd rdx,eax
  8006f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006f7:	48 98                	cdqe   
  8006f9:	48 89 c1             	mov    rcx,rax
  8006fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006ff:	48 89 ce             	mov    rsi,rcx
  800702:	89 c7                	mov    edi,eax
  800704:	e8 c6 6b 00 00       	call   8072cf <sys_write>
  800709:	e9 f4 00 00 00       	jmp    800802 <syscall+0x268>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 5b 6c 00 00       	call   80737f <sys_lseek>
  800724:	e9 d9 00 00 00       	jmp    800802 <syscall+0x268>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 aa 16 00 00       	call   801ddd <sys_tell>
  800733:	e9 ca 00 00 00       	jmp    800802 <syscall+0x268>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 83 15 00 00       	call   801cd2 <reg_vol>
  80074f:	e9 ae 00 00 00       	jmp    800802 <syscall+0x268>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 53 15 00 00       	call   801cb6 <free_vol>
  800763:	e9 9a 00 00 00       	jmp    800802 <syscall+0x268>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 3a 52 00 00       	call   8059b4 <execute>
  80077a:	e9 83 00 00 00       	jmp    800802 <syscall+0x268>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 87 3c 00 00       	call   804410 <sys_exit>
  800789:	eb 77                	jmp    800802 <syscall+0x268>
        case SYSCALL_CALL:return exec_call(a);
  80078b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80078e:	48 98                	cdqe   
  800790:	48 89 c7             	mov    rdi,rax
  800793:	e8 1e 53 00 00       	call   805ab6 <exec_call>
  800798:	eb 68                	jmp    800802 <syscall+0x268>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  80079a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80079d:	89 c7                	mov    edi,eax
  80079f:	e8 b3 13 00 00       	call   801b57 <sys_mkfifo>
  8007a4:	eb 5c                	jmp    800802 <syscall+0x268>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a9:	89 c7                	mov    edi,eax
  8007ab:	e8 8d 3e 00 00       	call   80463d <sys_malloc>
  8007b0:	eb 50                	jmp    800802 <syscall+0x268>
        case SYSCALL_FREE:return sys_free(a);
  8007b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b5:	89 c7                	mov    edi,eax
  8007b7:	e8 28 40 00 00       	call   8047e4 <sys_free>
  8007bc:	eb 44                	jmp    800802 <syscall+0x268>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007be:	b8 00 00 00 00       	mov    eax,0x0
  8007c3:	e8 86 71 00 00       	call   80794e <sys_getkbc>
  8007c8:	0f be c0             	movsx  eax,al
  8007cb:	eb 35                	jmp    800802 <syscall+0x268>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d0:	48 98                	cdqe   
  8007d2:	48 89 c7             	mov    rdi,rax
  8007d5:	e8 da 21 00 00       	call   8029b4 <sys_find_dev>
  8007da:	eb 26                	jmp    800802 <syscall+0x268>
        case SYSCALL_FORK:return sys_fork();
  8007dc:	e8 17 43 00 00       	call   804af8 <sys_fork>
  8007e1:	eb 1f                	jmp    800802 <syscall+0x268>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(a,b,c);
  8007e3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8007e6:	48 98                	cdqe   
  8007e8:	48 89 c2             	mov    rdx,rax
  8007eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007ee:	48 98                	cdqe   
  8007f0:	48 89 c1             	mov    rcx,rax
  8007f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007f6:	89 c6                	mov    esi,eax
  8007f8:	48 89 cf             	mov    rdi,rcx
  8007fb:	e8 46 22 00 00       	call   802a46 <sys_operate_dev>
  800800:	eb 00                	jmp    800802 <syscall+0x268>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");

}
  800802:	c9                   	leave  
  800803:	c3                   	ret    

0000000000800804 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  800804:	f3 0f 1e fa          	endbr64 
  800808:	55                   	push   rbp
  800809:	48 89 e5             	mov    rbp,rsp
  80080c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800810:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  800814:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800818:	48 c1 e8 20          	shr    rax,0x20
  80081c:	48 89 c2             	mov    rdx,rax
  80081f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800823:	89 c0                	mov    eax,eax
  800825:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  800829:	0f 30                	wrmsr  
  80082b:	90                   	nop
  80082c:	5d                   	pop    rbp
  80082d:	c3                   	ret    

000000000080082e <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  80082e:	f3 0f 1e fa          	endbr64 
  800832:	55                   	push   rbp
  800833:	48 89 e5             	mov    rbp,rsp
  800836:	48 83 ec 60          	sub    rsp,0x60
  80083a:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80083d:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800841:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800848:	00 
    mbi=(struct multiboot_header*)addr;
  800849:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80084d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800851:	b8 00 00 00 00       	mov    eax,0x0
  800856:	e8 54 03 00 00       	call   800baf <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  80085b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80085f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800862:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  800865:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800869:	48 83 c0 08          	add    rax,0x8
  80086d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  800871:	e9 5b 02 00 00       	jmp    800ad1 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800876:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80087a:	8b 00                	mov    eax,DWORD PTR [rax]
  80087c:	83 f8 08             	cmp    eax,0x8
  80087f:	0f 87 39 02 00 00    	ja     800abe <main+0x290>
  800885:	89 c0                	mov    eax,eax
  800887:	48 8b 04 c5 a8 3a 81 	mov    rax,QWORD PTR [rax*8+0x813aa8]
  80088e:	00 
  80088f:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  800892:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800896:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800899:	89 c7                	mov    edi,eax
  80089b:	e8 67 09 00 00       	call   801207 <set_high_mem_base>
			break;
  8008a0:	e9 19 02 00 00       	jmp    800abe <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  8008a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008a9:	48 83 c0 10          	add    rax,0x10
  8008ad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8008b1:	eb 37                	jmp    8008ea <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  8008b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008b7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8008ba:	89 c2                	mov    edx,eax
  8008bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008c0:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8008c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008cb:	48 89 ce             	mov    rsi,rcx
  8008ce:	48 89 c7             	mov    rdi,rax
  8008d1:	e8 48 09 00 00       	call   80121e <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008da:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008dd:	89 c2                	mov    edx,eax
  8008df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008e3:	48 01 d0             	add    rax,rdx
  8008e6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008ee:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008f1:	89 c2                	mov    edx,eax
  8008f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008f7:	48 01 d0             	add    rax,rdx
  8008fa:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008fe:	72 b3                	jb     8008b3 <main+0x85>
            }

		}
		break;
  800900:	e9 b9 01 00 00       	jmp    800abe <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  800905:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800909:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  80090d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  800914:	40 
			set_framebuffer(*tagfb);
  800915:	48 83 ec 08          	sub    rsp,0x8
  800919:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80091d:	ff 70 20             	push   QWORD PTR [rax+0x20]
  800920:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800923:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800926:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800929:	ff 30                	push   QWORD PTR [rax]
  80092b:	e8 4b 5c 00 00       	call   80657b <set_framebuffer>
  800930:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800934:	b8 00 00 00 00       	mov    eax,0x0
  800939:	e8 a8 5a 00 00       	call   8063e6 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  80093e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800942:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800946:	0f b6 c0             	movzx  eax,al
  800949:	83 f8 02             	cmp    eax,0x2
  80094c:	0f 84 5a 01 00 00    	je     800aac <main+0x27e>
  800952:	83 f8 02             	cmp    eax,0x2
  800955:	0f 8f 5a 01 00 00    	jg     800ab5 <main+0x287>
  80095b:	85 c0                	test   eax,eax
  80095d:	74 0e                	je     80096d <main+0x13f>
  80095f:	83 f8 01             	cmp    eax,0x1
  800962:	0f 84 15 01 00 00    	je     800a7d <main+0x24f>
  800968:	e9 48 01 00 00       	jmp    800ab5 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  80096d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800971:	48 83 c0 22          	add    rax,0x22
  800975:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800979:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800980:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800987:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80098e:	e9 d4 00 00 00       	jmp    800a67 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800993:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800996:	48 89 d0             	mov    rax,rdx
  800999:	48 01 c0             	add    rax,rax
  80099c:	48 01 c2             	add    rdx,rax
  80099f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009a3:	48 01 d0             	add    rax,rdx
  8009a6:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009aa:	0f b6 c0             	movzx  eax,al
  8009ad:	ba ff 00 00 00       	mov    edx,0xff
  8009b2:	89 d1                	mov    ecx,edx
  8009b4:	29 c1                	sub    ecx,eax
  8009b6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b9:	48 89 d0             	mov    rax,rdx
  8009bc:	48 01 c0             	add    rax,rax
  8009bf:	48 01 c2             	add    rdx,rax
  8009c2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c6:	48 01 d0             	add    rax,rdx
  8009c9:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009cd:	0f b6 d0             	movzx  edx,al
  8009d0:	b8 ff 00 00 00       	mov    eax,0xff
  8009d5:	29 d0                	sub    eax,edx
  8009d7:	89 ce                	mov    esi,ecx
  8009d9:	0f af f0             	imul   esi,eax
  8009dc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009df:	48 89 d0             	mov    rax,rdx
  8009e2:	48 01 c0             	add    rax,rax
  8009e5:	48 01 c2             	add    rdx,rax
  8009e8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ec:	48 01 d0             	add    rax,rdx
  8009ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009f2:	0f b6 c8             	movzx  ecx,al
  8009f5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009f8:	48 89 d0             	mov    rax,rdx
  8009fb:	48 01 c0             	add    rax,rax
  8009fe:	48 01 c2             	add    rdx,rax
  800a01:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a05:	48 01 d0             	add    rax,rdx
  800a08:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a0b:	0f b6 c0             	movzx  eax,al
  800a0e:	0f af c1             	imul   eax,ecx
  800a11:	01 c6                	add    esi,eax
  800a13:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a16:	48 89 d0             	mov    rax,rdx
  800a19:	48 01 c0             	add    rax,rax
  800a1c:	48 01 c2             	add    rdx,rax
  800a1f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a23:	48 01 d0             	add    rax,rdx
  800a26:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a2a:	0f b6 c8             	movzx  ecx,al
  800a2d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a30:	48 89 d0             	mov    rax,rdx
  800a33:	48 01 c0             	add    rax,rax
  800a36:	48 01 c2             	add    rdx,rax
  800a39:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a3d:	48 01 d0             	add    rax,rdx
  800a40:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a44:	0f b6 c0             	movzx  eax,al
  800a47:	0f af c1             	imul   eax,ecx
  800a4a:	01 f0                	add    eax,esi
  800a4c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a4f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a52:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a55:	73 0c                	jae    800a63 <main+0x235>
					{
						color = i;
  800a57:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a5a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a5d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a60:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a63:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a67:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a6b:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a6f:	0f b7 c0             	movzx  eax,ax
  800a72:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a75:	0f 82 18 ff ff ff    	jb     800993 <main+0x165>
					}
				}
			}
			break;
  800a7b:	eb 40                	jmp    800abd <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a7d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a81:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a85:	0f b6 c0             	movzx  eax,al
  800a88:	ba 01 00 00 00       	mov    edx,0x1
  800a8d:	89 c1                	mov    ecx,eax
  800a8f:	d3 e2                	shl    edx,cl
  800a91:	89 d0                	mov    eax,edx
  800a93:	8d 50 ff             	lea    edx,[rax-0x1]
  800a96:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a9a:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a9e:	0f b6 c0             	movzx  eax,al
  800aa1:	89 c1                	mov    ecx,eax
  800aa3:	d3 e2                	shl    edx,cl
  800aa5:	89 d0                	mov    eax,edx
  800aa7:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800aaa:	eb 11                	jmp    800abd <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800aac:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800ab3:	eb 08                	jmp    800abd <main+0x28f>

			default:
				color = 0xffffffff;
  800ab5:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800abc:	90                   	nop
			}

			break;
  800abd:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ac2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800ac5:	83 c0 07             	add    eax,0x7
  800ac8:	89 c0                	mov    eax,eax
  800aca:	83 e0 f8             	and    eax,0xfffffff8
  800acd:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ad5:	8b 00                	mov    eax,DWORD PTR [rax]
  800ad7:	85 c0                	test   eax,eax
  800ad9:	0f 85 97 fd ff ff    	jne    800876 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800adf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ae3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800ae6:	83 c0 07             	add    eax,0x7
  800ae9:	89 c0                	mov    eax,eax
  800aeb:	83 e0 f8             	and    eax,0xfffffff8
  800aee:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800af2:	b8 75 04 00 00       	mov    eax,0x475
  800af7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800afa:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800afd:	b8 00 00 00 00       	mov    eax,0x0
  800b02:	e8 9e 59 00 00       	call   8064a5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b07:	bf 68 3a 81 00       	mov    edi,0x813a68
  800b0c:	e8 2d 5e 00 00       	call   80693e <print>
    init_int();
  800b11:	b8 00 00 00 00       	mov    eax,0x0
  800b16:	e8 e5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b1b:	bf 85 3a 81 00       	mov    edi,0x813a85
  800b20:	e8 19 5e 00 00       	call   80693e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b25:	b8 00 00 00 00       	mov    eax,0x0
  800b2a:	e8 c5 09 00 00       	call   8014f4 <init_memory>
    init_com(PORT_COM1);
  800b2f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b34:	e8 7b a9 00 00       	call   80b4b4 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b39:	be f8 03 00 00       	mov    esi,0x3f8
  800b3e:	bf 92 3a 81 00       	mov    edi,0x813a92
  800b43:	e8 b8 aa 00 00       	call   80b600 <com_puts>
	init_paging();
  800b48:	b8 00 00 00 00       	mov    eax,0x0
  800b4d:	e8 aa 06 00 00       	call   8011fc <init_paging>
 	init_gdt();
  800b52:	b8 00 00 00 00       	mov    eax,0x0
  800b57:	e8 f1 4b 00 00       	call   80574d <init_gdt>
    init_drvdev_man();
  800b5c:	b8 00 00 00 00       	mov    eax,0x0
  800b61:	e8 fc 19 00 00       	call   802562 <init_drvdev_man>
    init_proc();
  800b66:	b8 00 00 00 00       	mov    eax,0x0
  800b6b:	e8 dd 28 00 00       	call   80344d <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b70:	b8 00 00 00 00       	mov    eax,0x0
  800b75:	e8 a1 6c 00 00       	call   80781b <init_kb>
//    init_disk();

    sti();
  800b7a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b7b:	b8 00 00 00 00       	mov    eax,0x0
  800b80:	e8 95 9f 00 00       	call   80ab1a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b85:	c7 05 79 b4 00 00 00 	mov    DWORD PTR [rip+0xb479],0x0        # 80c008 <manage_proc_lock>
  800b8c:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c=sys_getkbc();
  800b8f:	b8 00 00 00 00       	mov    eax,0x0
  800b94:	e8 b5 6d 00 00       	call   80794e <sys_getkbc>
  800b99:	88 45 da             	mov    BYTE PTR [rbp-0x26],al
        if(c!=-1)
  800b9c:	80 7d da ff          	cmp    BYTE PTR [rbp-0x26],0xff
  800ba0:	74 ed                	je     800b8f <main+0x361>
            putchar(c);
  800ba2:	0f be 45 da          	movsx  eax,BYTE PTR [rbp-0x26]
  800ba6:	89 c7                	mov    edi,eax
  800ba8:	e8 41 01 00 00       	call   800cee <putchar>
    {
  800bad:	eb e0                	jmp    800b8f <main+0x361>

0000000000800baf <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800baf:	f3 0f 1e fa          	endbr64 
  800bb3:	55                   	push   rbp
  800bb4:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800bb7:	48 c7 05 3e f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff43e],0xb8000        # 400000 <video>
  800bbe:	00 80 0b 00 
    xpos=0;
  800bc2:	c7 05 3c f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff43c],0x0        # 400008 <xpos>
  800bc9:	00 00 00 
    ypos=0;
  800bcc:	c7 05 36 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff436],0x0        # 40000c <ypos>
  800bd3:	00 00 00 
}
  800bd6:	90                   	nop
  800bd7:	5d                   	pop    rbp
  800bd8:	c3                   	ret    

0000000000800bd9 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800bd9:	f3 0f 1e fa          	endbr64 
  800bdd:	55                   	push   rbp
  800bde:	48 89 e5             	mov    rbp,rsp
  800be1:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800be5:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800be8:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800beb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bf3:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bf6:	48 98                	cdqe   
  800bf8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bfc:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c03:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c07:	75 27                	jne    800c30 <itoa+0x57>
  800c09:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c0d:	79 21                	jns    800c30 <itoa+0x57>
    {
        *p++ = '-';
  800c0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c13:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c17:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c1b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c1e:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c23:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c26:	f7 d8                	neg    eax
  800c28:	48 98                	cdqe   
  800c2a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c2e:	eb 0d                	jmp    800c3d <itoa+0x64>
    }
    else if (base == 'x')
  800c30:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c34:	75 07                	jne    800c3d <itoa+0x64>
        divisor = 16;
  800c36:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c3d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c40:	48 63 c8             	movsxd rcx,eax
  800c43:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c47:	ba 00 00 00 00       	mov    edx,0x0
  800c4c:	48 f7 f1             	div    rcx
  800c4f:	48 89 d0             	mov    rax,rdx
  800c52:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c55:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c59:	7f 0a                	jg     800c65 <itoa+0x8c>
  800c5b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c5e:	83 c0 30             	add    eax,0x30
  800c61:	89 c1                	mov    ecx,eax
  800c63:	eb 08                	jmp    800c6d <itoa+0x94>
  800c65:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c68:	83 c0 57             	add    eax,0x57
  800c6b:	89 c1                	mov    ecx,eax
  800c6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c71:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c75:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c79:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c7b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c7e:	48 63 f0             	movsxd rsi,eax
  800c81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c85:	ba 00 00 00 00       	mov    edx,0x0
  800c8a:	48 f7 f6             	div    rsi
  800c8d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c91:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c96:	75 a5                	jne    800c3d <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c9c:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c9f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800ca3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800ca7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cab:	48 83 e8 01          	sub    rax,0x1
  800caf:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800cb3:	eb 2b                	jmp    800ce0 <itoa+0x107>
    {
        char tmp = *p1;
  800cb5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cb9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800cbc:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800cbf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cc3:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800cc6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cca:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800ccc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cd0:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800cd4:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800cd6:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800cdb:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800ce0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ce4:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800ce8:	72 cb                	jb     800cb5 <itoa+0xdc>
    }
}
  800cea:	90                   	nop
  800ceb:	90                   	nop
  800cec:	5d                   	pop    rbp
  800ced:	c3                   	ret    

0000000000800cee <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800cee:	f3 0f 1e fa          	endbr64 
  800cf2:	55                   	push   rbp
  800cf3:	48 89 e5             	mov    rbp,rsp
  800cf6:	48 83 ec 20          	sub    rsp,0x20
  800cfa:	89 f8                	mov    eax,edi
  800cfc:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cff:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d03:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d06:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d0a:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d0e:	48 89 c7             	mov    rdi,rax
  800d11:	e8 28 5c 00 00       	call   80693e <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d16:	c9                   	leave  
  800d17:	c3                   	ret    

0000000000800d18 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d18:	f3 0f 1e fa          	endbr64 
  800d1c:	55                   	push   rbp
  800d1d:	48 89 e5             	mov    rbp,rsp
  800d20:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d27:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d2e:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d35:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d3c:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d43:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d4a:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d51:	84 c0                	test   al,al
  800d53:	74 20                	je     800d75 <printf+0x5d>
  800d55:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d59:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d5d:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d61:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d65:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d69:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d6d:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d71:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d75:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d7c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d83:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d8a:	08 
 
    while ((c = *format++) != 0)
  800d8b:	e9 29 01 00 00       	jmp    800eb9 <printf+0x1a1>
    {
        if (c != '%')
  800d90:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d97:	74 13                	je     800dac <printf+0x94>
            putchar (c);
  800d99:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800da0:	89 c7                	mov    edi,eax
  800da2:	e8 47 ff ff ff       	call   800cee <putchar>
  800da7:	e9 0d 01 00 00       	jmp    800eb9 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800dac:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800db3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800db7:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800dbe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dc1:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800dc7:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800dce:	83 f8 78             	cmp    eax,0x78
  800dd1:	74 26                	je     800df9 <printf+0xe1>
  800dd3:	83 f8 78             	cmp    eax,0x78
  800dd6:	0f 8f be 00 00 00    	jg     800e9a <printf+0x182>
  800ddc:	83 f8 75             	cmp    eax,0x75
  800ddf:	74 18                	je     800df9 <printf+0xe1>
  800de1:	83 f8 75             	cmp    eax,0x75
  800de4:	0f 8f b0 00 00 00    	jg     800e9a <printf+0x182>
  800dea:	83 f8 64             	cmp    eax,0x64
  800ded:	74 0a                	je     800df9 <printf+0xe1>
  800def:	83 f8 73             	cmp    eax,0x73
  800df2:	74 41                	je     800e35 <printf+0x11d>
  800df4:	e9 a1 00 00 00       	jmp    800e9a <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800df9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e00:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e04:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e0b:	8b 10                	mov    edx,DWORD PTR [rax]
  800e0d:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800e14:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e1b:	89 ce                	mov    esi,ecx
  800e1d:	48 89 c7             	mov    rdi,rax
  800e20:	e8 b4 fd ff ff       	call   800bd9 <itoa>
                p = buf;
  800e25:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e2c:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e33:	eb 34                	jmp    800e69 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e35:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e3c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e40:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e47:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e4a:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e51:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e58:	00 
  800e59:	75 0d                	jne    800e68 <printf+0x150>
                    p = "(null)";
  800e5b:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813af0
  800e62:	f0 3a 81 00 
  800e66:	eb 22                	jmp    800e8a <printf+0x172>
 
string:
  800e68:	90                   	nop
                while (*p)
  800e69:	eb 1f                	jmp    800e8a <printf+0x172>
                    putchar (*p++);
  800e6b:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e72:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e76:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e80:	0f be c0             	movsx  eax,al
  800e83:	89 c7                	mov    edi,eax
  800e85:	e8 64 fe ff ff       	call   800cee <putchar>
                while (*p)
  800e8a:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e94:	84 c0                	test   al,al
  800e96:	75 d3                	jne    800e6b <printf+0x153>
                break;
  800e98:	eb 1f                	jmp    800eb9 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e9a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800ea1:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800ea5:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800eac:	8b 00                	mov    eax,DWORD PTR [rax]
  800eae:	0f be c0             	movsx  eax,al
  800eb1:	89 c7                	mov    edi,eax
  800eb3:	e8 36 fe ff ff       	call   800cee <putchar>
                break;
  800eb8:	90                   	nop
    while ((c = *format++) != 0)
  800eb9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ec0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ec4:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800ecb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ece:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ed4:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800edb:	0f 85 af fe ff ff    	jne    800d90 <printf+0x78>
            }
        }
    }
}
  800ee1:	90                   	nop
  800ee2:	90                   	nop
  800ee3:	c9                   	leave  
  800ee4:	c3                   	ret    

0000000000800ee5 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ee5:	f3 0f 1e fa          	endbr64 
  800ee9:	55                   	push   rbp
  800eea:	48 89 e5             	mov    rbp,rsp
  800eed:	48 83 ec 40          	sub    rsp,0x40
  800ef1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ef5:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ef9:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800efc:	48 8b 15 1d b1 00 00 	mov    rdx,QWORD PTR [rip+0xb11d]        # 80c020 <pml4>
  800f03:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f07:	48 c1 e8 27          	shr    rax,0x27
  800f0b:	48 c1 e0 03          	shl    rax,0x3
  800f0f:	48 01 d0             	add    rax,rdx
  800f12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f15:	b0 00                	mov    al,0x0
  800f17:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f1b:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f22:	00 00 00 
  800f25:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f29:	48 c1 e8 1e          	shr    rax,0x1e
  800f2d:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f30:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f33:	48 98                	cdqe   
  800f35:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f3c:	00 
  800f3d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f41:	48 01 d0             	add    rax,rdx
  800f44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f47:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f4f:	83 e0 01             	and    eax,0x1
  800f52:	48 85 c0             	test   rax,rax
  800f55:	75 45                	jne    800f9c <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f57:	b8 00 00 00 00       	mov    eax,0x0
  800f5c:	e8 49 03 00 00       	call   8012aa <vmalloc>
  800f61:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f69:	ba 00 10 00 00       	mov    edx,0x1000
  800f6e:	be 00 00 00 00       	mov    esi,0x0
  800f73:	48 89 c7             	mov    rdi,rax
  800f76:	e8 75 a7 00 00       	call   80b6f0 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f7b:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f7e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f82:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f85:	48 98                	cdqe   
  800f87:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f8e:	00 
  800f8f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f93:	48 01 f0             	add    rax,rsi
  800f96:	48 09 ca             	or     rdx,rcx
  800f99:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fa0:	b0 00                	mov    al,0x0
  800fa2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fa6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800faa:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800faf:	48 c1 e8 15          	shr    rax,0x15
  800fb3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fba:	00 
  800fbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fbf:	48 01 d0             	add    rax,rdx
  800fc2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fc5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fcd:	83 e0 01             	and    eax,0x1
  800fd0:	48 85 c0             	test   rax,rax
  800fd3:	75 4d                	jne    801022 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fd5:	b8 00 00 00 00       	mov    eax,0x0
  800fda:	e8 cb 02 00 00       	call   8012aa <vmalloc>
  800fdf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fe3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fe7:	ba 00 10 00 00       	mov    edx,0x1000
  800fec:	be 00 00 00 00       	mov    esi,0x0
  800ff1:	48 89 c7             	mov    rdi,rax
  800ff4:	e8 f7 a6 00 00       	call   80b6f0 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800ff9:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ffc:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801000:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801004:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801009:	48 c1 e8 15          	shr    rax,0x15
  80100d:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801014:	00 
  801015:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801019:	48 01 f0             	add    rax,rsi
  80101c:	48 09 ca             	or     rdx,rcx
  80101f:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801022:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801026:	b0 00                	mov    al,0x0
  801028:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80102c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80102f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801033:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801039:	48 c1 ea 0c          	shr    rdx,0xc
  80103d:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801044:	00 
  801045:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801049:	48 01 ca             	add    rdx,rcx
  80104c:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801050:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801053:	b8 00 00 00 00       	mov    eax,0x0
}
  801058:	c9                   	leave  
  801059:	c3                   	ret    

000000000080105a <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  80105a:	f3 0f 1e fa          	endbr64 
  80105e:	55                   	push   rbp
  80105f:	48 89 e5             	mov    rbp,rsp
  801062:	48 83 ec 40          	sub    rsp,0x40
  801066:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80106a:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80106e:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  801071:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  801075:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801079:	48 c1 e8 27          	shr    rax,0x27
  80107d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801084:	00 
  801085:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  801089:	48 01 d0             	add    rax,rdx
  80108c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80108f:	b0 00                	mov    al,0x0
  801091:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  801095:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  80109c:	00 00 00 
  80109f:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  8010a3:	48 c1 e8 1e          	shr    rax,0x1e
  8010a7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  8010aa:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8010ad:	48 98                	cdqe   
  8010af:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010b6:	00 
  8010b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010bb:	48 01 d0             	add    rax,rdx
  8010be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010c1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  8010c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010c9:	83 e0 01             	and    eax,0x1
  8010cc:	48 85 c0             	test   rax,rax
  8010cf:	75 45                	jne    801116 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  8010d1:	b8 00 00 00 00       	mov    eax,0x0
  8010d6:	e8 cf 01 00 00       	call   8012aa <vmalloc>
  8010db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  8010df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010e3:	ba 00 10 00 00       	mov    edx,0x1000
  8010e8:	be 00 00 00 00       	mov    esi,0x0
  8010ed:	48 89 c7             	mov    rdi,rax
  8010f0:	e8 fb a5 00 00       	call   80b6f0 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  8010f5:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  8010f8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8010fc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8010ff:	48 98                	cdqe   
  801101:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801108:	00 
  801109:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80110d:	48 01 f0             	add    rax,rsi
  801110:	48 09 ca             	or     rdx,rcx
  801113:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  801116:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80111a:	b0 00                	mov    al,0x0
  80111c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  801120:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801124:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801129:	48 c1 e8 15          	shr    rax,0x15
  80112d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801134:	00 
  801135:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801139:	48 01 d0             	add    rax,rdx
  80113c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80113f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  801143:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801147:	83 e0 01             	and    eax,0x1
  80114a:	48 85 c0             	test   rax,rax
  80114d:	75 4d                	jne    80119c <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  80114f:	b8 00 00 00 00       	mov    eax,0x0
  801154:	e8 51 01 00 00       	call   8012aa <vmalloc>
  801159:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  80115d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801161:	ba 00 10 00 00       	mov    edx,0x1000
  801166:	be 00 00 00 00       	mov    esi,0x0
  80116b:	48 89 c7             	mov    rdi,rax
  80116e:	e8 7d a5 00 00       	call   80b6f0 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801173:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801176:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80117a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80117e:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801183:	48 c1 e8 15          	shr    rax,0x15
  801187:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80118e:	00 
  80118f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801193:	48 01 f0             	add    rax,rsi
  801196:	48 09 ca             	or     rdx,rcx
  801199:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  80119c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8011a0:	b0 00                	mov    al,0x0
  8011a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  8011a6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8011a9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8011ad:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  8011b3:	48 c1 ea 0c          	shr    rdx,0xc
  8011b7:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  8011be:	00 
  8011bf:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8011c3:	48 01 ca             	add    rdx,rcx
  8011c6:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  8011ca:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  8011cd:	b8 00 00 00 00       	mov    eax,0x0
}
  8011d2:	c9                   	leave  
  8011d3:	c3                   	ret    

00000000008011d4 <mdemap>:

stat_t mdemap(addr_t la)
{
  8011d4:	f3 0f 1e fa          	endbr64 
  8011d8:	55                   	push   rbp
  8011d9:	48 89 e5             	mov    rbp,rsp
  8011dc:	48 83 ec 10          	sub    rsp,0x10
  8011e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  8011e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011e8:	ba 00 00 00 00       	mov    edx,0x0
  8011ed:	48 89 c6             	mov    rsi,rax
  8011f0:	bf 00 00 00 00       	mov    edi,0x0
  8011f5:	e8 eb fc ff ff       	call   800ee5 <mmap>
}
  8011fa:	c9                   	leave  
  8011fb:	c3                   	ret    

00000000008011fc <init_paging>:
int init_paging()
{
  8011fc:	f3 0f 1e fa          	endbr64 
  801200:	55                   	push   rbp
  801201:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801204:	90                   	nop
  801205:	5d                   	pop    rbp
  801206:	c3                   	ret    

0000000000801207 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801207:	f3 0f 1e fa          	endbr64 
  80120b:	55                   	push   rbp
  80120c:	48 89 e5             	mov    rbp,rsp
  80120f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801212:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801215:	89 05 1d ae 00 00    	mov    DWORD PTR [rip+0xae1d],eax        # 80c038 <high_mem_base>
}
  80121b:	90                   	nop
  80121c:	5d                   	pop    rbp
  80121d:	c3                   	ret    

000000000080121e <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80121e:	f3 0f 1e fa          	endbr64 
  801222:	55                   	push   rbp
  801223:	48 89 e5             	mov    rbp,rsp
  801226:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80122a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80122e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801232:	8b 05 e8 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefe8]        # 400220 <mmap_t_i>
  801238:	48 63 d0             	movsxd rdx,eax
  80123b:	48 89 d0             	mov    rax,rdx
  80123e:	48 01 c0             	add    rax,rax
  801241:	48 01 d0             	add    rax,rdx
  801244:	48 c1 e0 03          	shl    rax,0x3
  801248:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80124f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801253:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801256:	8b 05 c4 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefc4]        # 400220 <mmap_t_i>
  80125c:	48 63 d0             	movsxd rdx,eax
  80125f:	48 89 d0             	mov    rax,rdx
  801262:	48 01 c0             	add    rax,rax
  801265:	48 01 d0             	add    rax,rdx
  801268:	48 c1 e0 03          	shl    rax,0x3
  80126c:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801273:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801277:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80127a:	8b 05 a0 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefa0]        # 400220 <mmap_t_i>
  801280:	8d 50 01             	lea    edx,[rax+0x1]
  801283:	89 15 97 ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfef97],edx        # 400220 <mmap_t_i>
  801289:	48 63 d0             	movsxd rdx,eax
  80128c:	48 89 d0             	mov    rax,rdx
  80128f:	48 01 c0             	add    rax,rax
  801292:	48 01 d0             	add    rax,rdx
  801295:	48 c1 e0 03          	shl    rax,0x3
  801299:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8012a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012a4:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8012a7:	90                   	nop
  8012a8:	5d                   	pop    rbp
  8012a9:	c3                   	ret    

00000000008012aa <vmalloc>:
addr_t vmalloc()
{
  8012aa:	f3 0f 1e fa          	endbr64 
  8012ae:	55                   	push   rbp
  8012af:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012b2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012b9:	eb 76                	jmp    801331 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8012bb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012c2:	eb 63                	jmp    801327 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8012c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012c7:	48 98                	cdqe   
  8012c9:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012d3:	be 01 00 00 00       	mov    esi,0x1
  8012d8:	89 c1                	mov    ecx,eax
  8012da:	d3 e6                	shl    esi,cl
  8012dc:	89 f0                	mov    eax,esi
  8012de:	21 d0                	and    eax,edx
  8012e0:	85 c0                	test   eax,eax
  8012e2:	75 3f                	jne    801323 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8012e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012e7:	48 98                	cdqe   
  8012e9:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012f3:	be 01 00 00 00       	mov    esi,0x1
  8012f8:	89 c1                	mov    ecx,eax
  8012fa:	d3 e6                	shl    esi,cl
  8012fc:	89 f0                	mov    eax,esi
  8012fe:	09 c2                	or     edx,eax
  801300:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801303:	48 98                	cdqe   
  801305:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80130c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80130f:	c1 e0 05             	shl    eax,0x5
  801312:	89 c2                	mov    edx,eax
  801314:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801317:	01 d0                	add    eax,edx
  801319:	83 c0 20             	add    eax,0x20
  80131c:	c1 e0 0c             	shl    eax,0xc
  80131f:	48 98                	cdqe   
  801321:	eb 14                	jmp    801337 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801323:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801327:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80132b:	7e 97                	jle    8012c4 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80132d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801331:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801335:	7e 84                	jle    8012bb <vmalloc+0x11>
            }
        }
    }
}
  801337:	5d                   	pop    rbp
  801338:	c3                   	ret    

0000000000801339 <vmfree>:

int vmfree(addr_t ptr)
{
  801339:	f3 0f 1e fa          	endbr64 
  80133d:	55                   	push   rbp
  80133e:	48 89 e5             	mov    rbp,rsp
  801341:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801345:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801349:	48 c1 e8 0c          	shr    rax,0xc
  80134d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801350:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801353:	8d 50 1f             	lea    edx,[rax+0x1f]
  801356:	85 c0                	test   eax,eax
  801358:	0f 48 c2             	cmovs  eax,edx
  80135b:	c1 f8 05             	sar    eax,0x5
  80135e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801361:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801364:	99                   	cdq    
  801365:	c1 ea 1b             	shr    edx,0x1b
  801368:	01 d0                	add    eax,edx
  80136a:	83 e0 1f             	and    eax,0x1f
  80136d:	29 d0                	sub    eax,edx
  80136f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801372:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801375:	48 98                	cdqe   
  801377:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80137e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801381:	be 01 00 00 00       	mov    esi,0x1
  801386:	89 c1                	mov    ecx,eax
  801388:	d3 e6                	shl    esi,cl
  80138a:	89 f0                	mov    eax,esi
  80138c:	f7 d0                	not    eax
  80138e:	21 c2                	and    edx,eax
  801390:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801393:	48 98                	cdqe   
  801395:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  80139c:	90                   	nop
  80139d:	5d                   	pop    rbp
  80139e:	c3                   	ret    

000000000080139f <page_err>:
void page_err(){
  80139f:	f3 0f 1e fa          	endbr64 
  8013a3:	55                   	push   rbp
  8013a4:	48 89 e5             	mov    rbp,rsp
  8013a7:	41 54                	push   r12
  8013a9:	53                   	push   rbx
  8013aa:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  8013ae:	fa                   	cli    
    print("page err\n");
  8013af:	bf f8 3a 81 00       	mov    edi,0x813af8
  8013b4:	e8 85 55 00 00       	call   80693e <print>
    unsigned long err_code=0,l_addr=0;
  8013b9:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8013c0:	00 
  8013c1:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8013c8:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8013c9:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8013cd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8013d1:	0f 20 d0             	mov    rax,cr2
  8013d4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8013d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013dc:	83 e0 01             	and    eax,0x1
  8013df:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8013e2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013e6:	75 41                	jne    801429 <page_err+0x8a>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  8013e8:	48 8b 05 b1 30 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc130b1]        # 4144a0 <current>
  8013ef:	48 8b 98 ac 00 00 00 	mov    rbx,QWORD PTR [rax+0xac]
  8013f6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8013fa:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801400:	49 89 c4             	mov    r12,rax
  801403:	b8 00 00 00 00       	mov    eax,0x0
  801408:	e8 50 02 00 00       	call   80165d <req_a_page>
  80140d:	89 c7                	mov    edi,eax
  80140f:	e8 f7 03 00 00       	call   80180b <get_phyaddr>
  801414:	48 98                	cdqe   
  801416:	48 89 d9             	mov    rcx,rbx
  801419:	ba 07 00 00 00       	mov    edx,0x7
  80141e:	4c 89 e6             	mov    rsi,r12
  801421:	48 89 c7             	mov    rdi,rax
  801424:	e8 31 fc ff ff       	call   80105a <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801429:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80142d:	83 e0 02             	and    eax,0x2
  801430:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801433:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801437:	74 0c                	je     801445 <page_err+0xa6>
  801439:	bf 02 3b 81 00       	mov    edi,0x813b02
  80143e:	e8 fb 54 00 00       	call   80693e <print>
  801443:	eb 0a                	jmp    80144f <page_err+0xb0>
    p=err_code&4;
  801445:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801449:	83 e0 04             	and    eax,0x4
  80144c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80144f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801453:	75 0c                	jne    801461 <page_err+0xc2>
  801455:	bf 10 3b 81 00       	mov    edi,0x813b10
  80145a:	e8 df 54 00 00       	call   80693e <print>
  80145f:	eb 0a                	jmp    80146b <page_err+0xcc>
    p=err_code&16;
  801461:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801465:	83 e0 10             	and    eax,0x10
  801468:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80146b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80146f:	74 0a                	je     80147b <page_err+0xdc>
  801471:	bf 28 3b 81 00       	mov    edi,0x813b28
  801476:	e8 c3 54 00 00       	call   80693e <print>
    unsigned int addr=0;
  80147b:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801482:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801485:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801488:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80148c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80148f:	89 c6                	mov    esi,eax
  801491:	bf 48 3b 81 00       	mov    edi,0x813b48
  801496:	b8 00 00 00 00       	mov    eax,0x0
  80149b:	e8 78 f8 ff ff       	call   800d18 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8014a0:	48 8b 0d f9 6f c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc06ff9]        # 4084a0 <task>
  8014a7:	8b 05 7f 30 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1307f]        # 41452c <cur_proc>
  8014ad:	48 63 d0             	movsxd rdx,eax
  8014b0:	48 89 d0             	mov    rax,rdx
  8014b3:	48 01 c0             	add    rax,rax
  8014b6:	48 01 d0             	add    rax,rdx
  8014b9:	48 c1 e0 08          	shl    rax,0x8
  8014bd:	48 01 c8             	add    rax,rcx
  8014c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8014c2:	83 f8 01             	cmp    eax,0x1
  8014c5:	75 11                	jne    8014d8 <page_err+0x139>
    {
        printf("sys died. please reboot.\n");
  8014c7:	bf 6a 3b 81 00       	mov    edi,0x813b6a
  8014cc:	b8 00 00 00 00       	mov    eax,0x0
  8014d1:	e8 42 f8 ff ff       	call   800d18 <printf>
        asm volatile("jmp .");
  8014d6:	eb fe                	jmp    8014d6 <page_err+0x137>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8014d8:	b8 00 00 00 00       	mov    eax,0x0
  8014dd:	e8 1c 42 00 00       	call   8056fe <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  8014e2:	fb                   	sti    
  8014e3:	c9                   	leave  
  8014e4:	48 83 c4 08          	add    rsp,0x8
  8014e8:	48 cf                	iretq  
}
  8014ea:	90                   	nop
  8014eb:	48 83 c4 20          	add    rsp,0x20
  8014ef:	5b                   	pop    rbx
  8014f0:	41 5c                	pop    r12
  8014f2:	5d                   	pop    rbp
  8014f3:	c3                   	ret    

00000000008014f4 <init_memory>:
void init_memory()
{
  8014f4:	f3 0f 1e fa          	endbr64 
  8014f8:	55                   	push   rbp
  8014f9:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  8014fc:	8b 05 1e ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed1e]        # 400220 <mmap_t_i>
  801502:	83 e8 01             	sub    eax,0x1
  801505:	48 63 d0             	movsxd rdx,eax
  801508:	48 89 d0             	mov    rax,rdx
  80150b:	48 01 c0             	add    rax,rax
  80150e:	48 01 d0             	add    rax,rdx
  801511:	48 c1 e0 03          	shl    rax,0x3
  801515:	48 05 40 00 40 00    	add    rax,0x400040
  80151b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80151e:	8b 05 fc ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfecfc]        # 400220 <mmap_t_i>
  801524:	83 e8 01             	sub    eax,0x1
  801527:	48 63 d0             	movsxd rdx,eax
  80152a:	48 89 d0             	mov    rax,rdx
  80152d:	48 01 c0             	add    rax,rax
  801530:	48 01 d0             	add    rax,rdx
  801533:	48 c1 e0 03          	shl    rax,0x3
  801537:	48 05 48 00 40 00    	add    rax,0x400048
  80153d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801540:	48 01 c8             	add    rax,rcx
  801543:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801547:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80154b:	48 c1 e8 0c          	shr    rax,0xc
  80154f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801552:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801555:	8d 50 1f             	lea    edx,[rax+0x1f]
  801558:	85 c0                	test   eax,eax
  80155a:	0f 48 c2             	cmovs  eax,edx
  80155d:	c1 f8 05             	sar    eax,0x5
  801560:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801563:	48 c7 05 b2 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeab2],0xc00000        # 400020 <page_map>
  80156a:	00 00 c0 00 
    int* p=page_map;
  80156e:	48 8b 05 ab ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfeaab]        # 400020 <page_map>
  801575:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801579:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801580:	00 
    for(int i=0;i<mmap_t_i;i++){
  801581:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801588:	e9 91 00 00 00       	jmp    80161e <init_memory+0x12a>
        int cont=0;
  80158d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801594:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801597:	48 63 d0             	movsxd rdx,eax
  80159a:	48 89 d0             	mov    rax,rdx
  80159d:	48 01 c0             	add    rax,rax
  8015a0:	48 01 d0             	add    rax,rdx
  8015a3:	48 c1 e0 03          	shl    rax,0x3
  8015a7:	48 05 50 00 40 00    	add    rax,0x400050
  8015ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015b0:	48 83 f8 01          	cmp    rax,0x1
  8015b4:	74 07                	je     8015bd <init_memory+0xc9>
            cont=-1;
  8015b6:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015bd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8015c4:	eb 15                	jmp    8015db <init_memory+0xe7>
            *(p++)=cont;
  8015c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015ca:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8015ce:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8015d2:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8015d5:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015d7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8015db:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015de:	48 63 c8             	movsxd rcx,eax
  8015e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015e4:	48 63 d0             	movsxd rdx,eax
  8015e7:	48 89 d0             	mov    rax,rdx
  8015ea:	48 01 c0             	add    rax,rax
  8015ed:	48 01 d0             	add    rax,rdx
  8015f0:	48 c1 e0 03          	shl    rax,0x3
  8015f4:	48 05 48 00 40 00    	add    rax,0x400048
  8015fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015fd:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801604:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80160b:	ff 00 00 
  80160e:	48 21 d0             	and    rax,rdx
  801611:	48 c1 e8 11          	shr    rax,0x11
  801615:	48 39 c1             	cmp    rcx,rax
  801618:	72 ac                	jb     8015c6 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  80161a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80161e:	8b 05 fc eb bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfebfc]        # 400220 <mmap_t_i>
  801624:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801627:	0f 8c 60 ff ff ff    	jl     80158d <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80162d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801634:	eb 1d                	jmp    801653 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801636:	48 8b 15 e3 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9e3]        # 400020 <page_map>
  80163d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801640:	48 98                	cdqe   
  801642:	48 c1 e0 02          	shl    rax,0x2
  801646:	48 01 d0             	add    rax,rdx
  801649:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80164f:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801653:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801657:	7e dd                	jle    801636 <init_memory+0x142>
    }
}
  801659:	90                   	nop
  80165a:	90                   	nop
  80165b:	5d                   	pop    rbp
  80165c:	c3                   	ret    

000000000080165d <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80165d:	f3 0f 1e fa          	endbr64 
  801661:	55                   	push   rbp
  801662:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801665:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80166c:	e9 b0 00 00 00       	jmp    801721 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801671:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801678:	e9 96 00 00 00       	jmp    801713 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80167d:	48 8b 15 9c e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe99c]        # 400020 <page_map>
  801684:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801687:	48 98                	cdqe   
  801689:	48 c1 e0 02          	shl    rax,0x2
  80168d:	48 01 d0             	add    rax,rdx
  801690:	8b 10                	mov    edx,DWORD PTR [rax]
  801692:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801695:	be 01 00 00 00       	mov    esi,0x1
  80169a:	89 c1                	mov    ecx,eax
  80169c:	d3 e6                	shl    esi,cl
  80169e:	89 f0                	mov    eax,esi
  8016a0:	21 d0                	and    eax,edx
  8016a2:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8016a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016a8:	c1 e0 05             	shl    eax,0x5
  8016ab:	89 c2                	mov    edx,eax
  8016ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016b0:	01 d0                	add    eax,edx
  8016b2:	c1 e0 0c             	shl    eax,0xc
  8016b5:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8016ba:	7e 53                	jle    80170f <req_a_page+0xb2>
  8016bc:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8016c0:	75 4d                	jne    80170f <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8016c2:	48 8b 15 57 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe957]        # 400020 <page_map>
  8016c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016cc:	48 98                	cdqe   
  8016ce:	48 c1 e0 02          	shl    rax,0x2
  8016d2:	48 01 d0             	add    rax,rdx
  8016d5:	8b 10                	mov    edx,DWORD PTR [rax]
  8016d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016da:	be 01 00 00 00       	mov    esi,0x1
  8016df:	89 c1                	mov    ecx,eax
  8016e1:	d3 e6                	shl    esi,cl
  8016e3:	89 f0                	mov    eax,esi
  8016e5:	89 c6                	mov    esi,eax
  8016e7:	48 8b 0d 32 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe932]        # 400020 <page_map>
  8016ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016f1:	48 98                	cdqe   
  8016f3:	48 c1 e0 02          	shl    rax,0x2
  8016f7:	48 01 c8             	add    rax,rcx
  8016fa:	09 f2                	or     edx,esi
  8016fc:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  8016fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801701:	c1 e0 05             	shl    eax,0x5
  801704:	89 c2                	mov    edx,eax
  801706:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801709:	01 d0                	add    eax,edx
  80170b:	48 98                	cdqe   
  80170d:	eb 1c                	jmp    80172b <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80170f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801713:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801717:	0f 8e 60 ff ff ff    	jle    80167d <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80171d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801721:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801725:	0f 8e 46 ff ff ff    	jle    801671 <req_a_page+0x14>

            }
        }
    }
}
  80172b:	5d                   	pop    rbp
  80172c:	c3                   	ret    

000000000080172d <free_page>:

int free_page(char *paddr){
  80172d:	f3 0f 1e fa          	endbr64 
  801731:	55                   	push   rbp
  801732:	48 89 e5             	mov    rbp,rsp
  801735:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801739:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80173d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801743:	85 c0                	test   eax,eax
  801745:	0f 48 c2             	cmovs  eax,edx
  801748:	c1 f8 0c             	sar    eax,0xc
  80174b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80174e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801751:	8d 50 1f             	lea    edx,[rax+0x1f]
  801754:	85 c0                	test   eax,eax
  801756:	0f 48 c2             	cmovs  eax,edx
  801759:	c1 f8 05             	sar    eax,0x5
  80175c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80175f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801762:	99                   	cdq    
  801763:	c1 ea 1b             	shr    edx,0x1b
  801766:	01 d0                	add    eax,edx
  801768:	83 e0 1f             	and    eax,0x1f
  80176b:	29 d0                	sub    eax,edx
  80176d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801770:	48 8b 15 a9 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8a9]        # 400020 <page_map>
  801777:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80177a:	48 98                	cdqe   
  80177c:	48 c1 e0 02          	shl    rax,0x2
  801780:	48 01 d0             	add    rax,rdx
  801783:	8b 10                	mov    edx,DWORD PTR [rax]
  801785:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801788:	be 01 00 00 00       	mov    esi,0x1
  80178d:	89 c1                	mov    ecx,eax
  80178f:	d3 e6                	shl    esi,cl
  801791:	89 f0                	mov    eax,esi
  801793:	f7 d0                	not    eax
  801795:	89 c6                	mov    esi,eax
  801797:	48 8b 0d 82 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe882]        # 400020 <page_map>
  80179e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017a1:	48 98                	cdqe   
  8017a3:	48 c1 e0 02          	shl    rax,0x2
  8017a7:	48 01 c8             	add    rax,rcx
  8017aa:	21 f2                	and    edx,esi
  8017ac:	89 10                	mov    DWORD PTR [rax],edx
}
  8017ae:	90                   	nop
  8017af:	5d                   	pop    rbp
  8017b0:	c3                   	ret    

00000000008017b1 <check_page>:
int check_page(int num){
  8017b1:	f3 0f 1e fa          	endbr64 
  8017b5:	55                   	push   rbp
  8017b6:	48 89 e5             	mov    rbp,rsp
  8017b9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8017bc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017bf:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017c2:	85 c0                	test   eax,eax
  8017c4:	0f 48 c2             	cmovs  eax,edx
  8017c7:	c1 f8 05             	sar    eax,0x5
  8017ca:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8017cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017d0:	99                   	cdq    
  8017d1:	c1 ea 1b             	shr    edx,0x1b
  8017d4:	01 d0                	add    eax,edx
  8017d6:	83 e0 1f             	and    eax,0x1f
  8017d9:	29 d0                	sub    eax,edx
  8017db:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8017de:	48 8b 15 3b e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe83b]        # 400020 <page_map>
  8017e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017e8:	48 98                	cdqe   
  8017ea:	48 c1 e0 02          	shl    rax,0x2
  8017ee:	48 01 d0             	add    rax,rdx
  8017f1:	8b 10                	mov    edx,DWORD PTR [rax]
  8017f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017f6:	be 01 00 00 00       	mov    esi,0x1
  8017fb:	89 c1                	mov    ecx,eax
  8017fd:	d3 e6                	shl    esi,cl
  8017ff:	89 f0                	mov    eax,esi
  801801:	21 d0                	and    eax,edx
  801803:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801806:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801809:	5d                   	pop    rbp
  80180a:	c3                   	ret    

000000000080180b <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80180b:	f3 0f 1e fa          	endbr64 
  80180f:	55                   	push   rbp
  801810:	48 89 e5             	mov    rbp,rsp
  801813:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801816:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801819:	c1 e0 0c             	shl    eax,0xc
}
  80181c:	5d                   	pop    rbp
  80181d:	c3                   	ret    

000000000080181e <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80181e:	f3 0f 1e fa          	endbr64 
  801822:	55                   	push   rbp
  801823:	48 89 e5             	mov    rbp,rsp
  801826:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80182a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80182d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801830:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801834:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80183b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80183f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801842:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801845:	89 c0                	mov    eax,eax
  801847:	25 00 f0 ff ff       	and    eax,0xfffff000
  80184c:	48 09 c2             	or     rdx,rax
  80184f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801853:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801856:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80185a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80185d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801860:	48 98                	cdqe   
  801862:	48 09 c2             	or     rdx,rax
  801865:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801869:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80186c:	90                   	nop
  80186d:	5d                   	pop    rbp
  80186e:	c3                   	ret    

000000000080186f <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80186f:	f3 0f 1e fa          	endbr64 
  801873:	55                   	push   rbp
  801874:	48 89 e5             	mov    rbp,rsp
  801877:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80187b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80187e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801881:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801885:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  80188c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801890:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801893:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801896:	0c 81                	or     al,0x81
  801898:	89 c0                	mov    eax,eax
  80189a:	48 09 c2             	or     rdx,rax
  80189d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018a1:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8018a4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018a7:	25 00 00 00 c0       	and    eax,0xc0000000
  8018ac:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8018af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018b3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018b9:	48 09 c2             	or     rdx,rax
  8018bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018c0:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018c3:	90                   	nop
  8018c4:	5d                   	pop    rbp
  8018c5:	c3                   	ret    

00000000008018c6 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  8018c6:	f3 0f 1e fa          	endbr64 
  8018ca:	55                   	push   rbp
  8018cb:	48 89 e5             	mov    rbp,rsp
  8018ce:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018d2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018d5:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  8018d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018dc:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  8018e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018ea:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018ed:	0d 81 10 00 00       	or     eax,0x1081
  8018f2:	48 98                	cdqe   
  8018f4:	48 09 c2             	or     rdx,rax
  8018f7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018fb:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8018fe:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801901:	25 00 00 c0 ff       	and    eax,0xffc00000
  801906:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801909:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80190d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801910:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801913:	48 09 c2             	or     rdx,rax
  801916:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80191a:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80191d:	90                   	nop
  80191e:	5d                   	pop    rbp
  80191f:	c3                   	ret    

0000000000801920 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801920:	f3 0f 1e fa          	endbr64 
  801924:	55                   	push   rbp
  801925:	48 89 e5             	mov    rbp,rsp
  801928:	48 83 ec 20          	sub    rsp,0x20
  80192c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801930:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801933:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801938:	75 18                	jne    801952 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80193a:	b8 00 00 00 00       	mov    eax,0x0
  80193f:	e8 19 fd ff ff       	call   80165d <req_a_page>
  801944:	89 c7                	mov    edi,eax
  801946:	e8 c0 fe ff ff       	call   80180b <get_phyaddr>
  80194b:	48 98                	cdqe   
  80194d:	e9 a5 00 00 00       	jmp    8019f7 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801952:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801956:	89 c2                	mov    edx,eax
  801958:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80195b:	89 c6                	mov    esi,eax
  80195d:	89 d7                	mov    edi,edx
  80195f:	e8 52 01 00 00       	call   801ab6 <is_pgs_ava>
  801964:	85 c0                	test   eax,eax
  801966:	75 0c                	jne    801974 <req_page_at+0x54>
  801968:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80196f:	e9 83 00 00 00       	jmp    8019f7 <req_page_at+0xd7>
    int pgni=base/4096;
  801974:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801978:	48 c1 e8 0c          	shr    rax,0xc
  80197c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80197f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801982:	8d 50 1f             	lea    edx,[rax+0x1f]
  801985:	85 c0                	test   eax,eax
  801987:	0f 48 c2             	cmovs  eax,edx
  80198a:	c1 f8 05             	sar    eax,0x5
  80198d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801990:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801993:	99                   	cdq    
  801994:	c1 ea 1b             	shr    edx,0x1b
  801997:	01 d0                	add    eax,edx
  801999:	83 e0 1f             	and    eax,0x1f
  80199c:	29 d0                	sub    eax,edx
  80199e:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8019a1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019a8:	eb 40                	jmp    8019ea <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8019aa:	48 8b 15 6f e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe66f]        # 400020 <page_map>
  8019b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b4:	48 98                	cdqe   
  8019b6:	48 c1 e0 02          	shl    rax,0x2
  8019ba:	48 01 d0             	add    rax,rdx
  8019bd:	8b 10                	mov    edx,DWORD PTR [rax]
  8019bf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8019c2:	be 01 00 00 00       	mov    esi,0x1
  8019c7:	89 c1                	mov    ecx,eax
  8019c9:	d3 e6                	shl    esi,cl
  8019cb:	89 f0                	mov    eax,esi
  8019cd:	89 c6                	mov    esi,eax
  8019cf:	48 8b 0d 4a e6 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe64a]        # 400020 <page_map>
  8019d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019d9:	48 98                	cdqe   
  8019db:	48 c1 e0 02          	shl    rax,0x2
  8019df:	48 01 c8             	add    rax,rcx
  8019e2:	09 f2                	or     edx,esi
  8019e4:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8019e6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019ed:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8019f0:	7c b8                	jl     8019aa <req_page_at+0x8a>
    }
    return 0;
  8019f2:	b8 00 00 00 00       	mov    eax,0x0

}
  8019f7:	c9                   	leave  
  8019f8:	c3                   	ret    

00000000008019f9 <chk_vm>:
int chk_vm(int base, int pgn)
{
  8019f9:	f3 0f 1e fa          	endbr64 
  8019fd:	55                   	push   rbp
  8019fe:	48 89 e5             	mov    rbp,rsp
  801a01:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a04:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801a07:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a0e:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a0f:	0f 20 d8             	mov    rax,cr3
  801a12:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a16:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a19:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a1f:	85 c0                	test   eax,eax
  801a21:	0f 48 c2             	cmovs  eax,edx
  801a24:	c1 f8 15             	sar    eax,0x15
  801a27:	48 98                	cdqe   
  801a29:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a30:	00 
  801a31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a35:	48 01 d0             	add    rax,rdx
  801a38:	8b 00                	mov    eax,DWORD PTR [rax]
  801a3a:	89 c0                	mov    eax,eax
  801a3c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a41:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a45:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a48:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a4e:	85 c0                	test   eax,eax
  801a50:	0f 48 c2             	cmovs  eax,edx
  801a53:	c1 f8 15             	sar    eax,0x15
  801a56:	48 98                	cdqe   
  801a58:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a5f:	00 
  801a60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a64:	48 01 d0             	add    rax,rdx
  801a67:	8b 00                	mov    eax,DWORD PTR [rax]
  801a69:	83 e0 01             	and    eax,0x1
  801a6c:	85 c0                	test   eax,eax
  801a6e:	74 38                	je     801aa8 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801a70:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a73:	99                   	cdq    
  801a74:	c1 ea 0b             	shr    edx,0xb
  801a77:	01 d0                	add    eax,edx
  801a79:	25 ff ff 1f 00       	and    eax,0x1fffff
  801a7e:	29 d0                	sub    eax,edx
  801a80:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a86:	85 c0                	test   eax,eax
  801a88:	0f 48 c2             	cmovs  eax,edx
  801a8b:	c1 f8 0c             	sar    eax,0xc
  801a8e:	48 98                	cdqe   
  801a90:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a97:	00 
  801a98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801a9c:	48 01 d0             	add    rax,rdx
  801a9f:	8b 00                	mov    eax,DWORD PTR [rax]
  801aa1:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801aa4:	85 c0                	test   eax,eax
  801aa6:	75 07                	jne    801aaf <chk_vm+0xb6>
    {
        return -1;
  801aa8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801aad:	eb 05                	jmp    801ab4 <chk_vm+0xbb>
    }
    return 0;
  801aaf:	b8 00 00 00 00       	mov    eax,0x0
}
  801ab4:	5d                   	pop    rbp
  801ab5:	c3                   	ret    

0000000000801ab6 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801ab6:	f3 0f 1e fa          	endbr64 
  801aba:	55                   	push   rbp
  801abb:	48 89 e5             	mov    rbp,rsp
  801abe:	48 83 ec 18          	sub    rsp,0x18
  801ac2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ac5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801ac8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801acb:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801ad1:	85 c0                	test   eax,eax
  801ad3:	0f 48 c2             	cmovs  eax,edx
  801ad6:	c1 f8 0c             	sar    eax,0xc
  801ad9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801adc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ae3:	eb 1e                	jmp    801b03 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801ae5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801ae8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aeb:	01 d0                	add    eax,edx
  801aed:	89 c7                	mov    edi,eax
  801aef:	e8 bd fc ff ff       	call   8017b1 <check_page>
  801af4:	85 c0                	test   eax,eax
  801af6:	74 07                	je     801aff <is_pgs_ava+0x49>
  801af8:	b8 00 00 00 00       	mov    eax,0x0
  801afd:	eb 11                	jmp    801b10 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801aff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b03:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b06:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801b09:	7c da                	jl     801ae5 <is_pgs_ava+0x2f>
    }
    return 1;
  801b0b:	b8 01 00 00 00       	mov    eax,0x1

}
  801b10:	c9                   	leave  
  801b11:	c3                   	ret    

0000000000801b12 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b12:	f3 0f 1e fa          	endbr64 
  801b16:	55                   	push   rbp
  801b17:	48 89 e5             	mov    rbp,rsp
  801b1a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b1e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b22:	c6 05 17 e7 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe717],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b29:	c6 05 11 e7 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe711],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b34:	48 89 05 0d e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe70d],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b3f:	48 89 05 0a e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe70a],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b46:	c7 05 10 e7 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe710],0x1        # 400260 <vols+0x20>
  801b4d:	00 00 00 
    return 0;
  801b50:	b8 00 00 00 00       	mov    eax,0x0
}
  801b55:	5d                   	pop    rbp
  801b56:	c3                   	ret    

0000000000801b57 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801b57:	f3 0f 1e fa          	endbr64 
  801b5b:	55                   	push   rbp
  801b5c:	48 89 e5             	mov    rbp,rsp
  801b5f:	48 83 ec 20          	sub    rsp,0x20
  801b63:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801b66:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b6d:	eb 38                	jmp    801ba7 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b72:	48 98                	cdqe   
  801b74:	48 c1 e0 04          	shl    rax,0x4
  801b78:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b7e:	8b 00                	mov    eax,DWORD PTR [rax]
  801b80:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b83:	75 1e                	jne    801ba3 <sys_mkfifo+0x4c>
  801b85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b88:	48 98                	cdqe   
  801b8a:	48 c1 e0 04          	shl    rax,0x4
  801b8e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b94:	8b 00                	mov    eax,DWORD PTR [rax]
  801b96:	83 f8 01             	cmp    eax,0x1
  801b99:	75 08                	jne    801ba3 <sys_mkfifo+0x4c>
            return i;
  801b9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b9e:	e9 a6 00 00 00       	jmp    801c49 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801ba3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ba7:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801bab:	7e c2                	jle    801b6f <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801bad:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801bb4:	e9 81 00 00 00       	jmp    801c3a <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801bb9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bbc:	48 98                	cdqe   
  801bbe:	48 c1 e0 04          	shl    rax,0x4
  801bc2:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bc8:	8b 00                	mov    eax,DWORD PTR [rax]
  801bca:	85 c0                	test   eax,eax
  801bcc:	75 68                	jne    801c36 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801bce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bd1:	48 98                	cdqe   
  801bd3:	48 c1 e0 04          	shl    rax,0x4
  801bd7:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bdd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801be3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801be6:	48 98                	cdqe   
  801be8:	48 c1 e0 04          	shl    rax,0x4
  801bec:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801bf3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bf6:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801bf8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bfb:	48 98                	cdqe   
  801bfd:	48 c1 e0 04          	shl    rax,0x4
  801c01:	48 05 64 1e 40 00    	add    rax,0x401e64
  801c07:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c0d:	b8 00 00 00 00       	mov    eax,0x0
  801c12:	e8 46 fa ff ff       	call   80165d <req_a_page>
  801c17:	89 c7                	mov    edi,eax
  801c19:	e8 ed fb ff ff       	call   80180b <get_phyaddr>
  801c1e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c21:	48 63 d2             	movsxd rdx,edx
  801c24:	48 c1 e2 04          	shl    rdx,0x4
  801c28:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c2f:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c31:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c34:	eb 13                	jmp    801c49 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c36:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c3a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c3e:	0f 8e 75 ff ff ff    	jle    801bb9 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c44:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c49:	c9                   	leave  
  801c4a:	c3                   	ret    

0000000000801c4b <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801c4b:	f3 0f 1e fa          	endbr64 
  801c4f:	55                   	push   rbp
  801c50:	48 89 e5             	mov    rbp,rsp
  801c53:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801c56:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c5d:	eb 4a                	jmp    801ca9 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801c5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c62:	48 98                	cdqe   
  801c64:	48 c1 e0 04          	shl    rax,0x4
  801c68:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801c6e:	8b 00                	mov    eax,DWORD PTR [rax]
  801c70:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c73:	75 30                	jne    801ca5 <sys_rmfifo+0x5a>
  801c75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c78:	48 98                	cdqe   
  801c7a:	48 c1 e0 04          	shl    rax,0x4
  801c7e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c84:	8b 00                	mov    eax,DWORD PTR [rax]
  801c86:	83 f8 01             	cmp    eax,0x1
  801c89:	75 1a                	jne    801ca5 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801c8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c8e:	48 98                	cdqe   
  801c90:	48 c1 e0 04          	shl    rax,0x4
  801c94:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c9a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801ca0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ca3:	eb 0f                	jmp    801cb4 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801ca5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ca9:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801cad:	7e b0                	jle    801c5f <sys_rmfifo+0x14>
        }
    }
    return -1;
  801caf:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801cb4:	5d                   	pop    rbp
  801cb5:	c3                   	ret    

0000000000801cb6 <free_vol>:
int free_vol(int voli)
{
  801cb6:	f3 0f 1e fa          	endbr64 
  801cba:	55                   	push   rbp
  801cbb:	48 89 e5             	mov    rbp,rsp
  801cbe:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801cc1:	c7 05 95 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe595],0x0        # 400260 <vols+0x20>
  801cc8:	00 00 00 
    return 0;
  801ccb:	b8 00 00 00 00       	mov    eax,0x0
}
  801cd0:	5d                   	pop    rbp
  801cd1:	c3                   	ret    

0000000000801cd2 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801cd2:	f3 0f 1e fa          	endbr64 
  801cd6:	55                   	push   rbp
  801cd7:	48 89 e5             	mov    rbp,rsp
  801cda:	48 83 ec 20          	sub    rsp,0x20
  801cde:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ce1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801ce4:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801ce8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cef:	e9 d8 00 00 00       	jmp    801dcc <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801cf4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cf7:	48 63 d0             	movsxd rdx,eax
  801cfa:	48 89 d0             	mov    rax,rdx
  801cfd:	48 c1 e0 02          	shl    rax,0x2
  801d01:	48 01 d0             	add    rax,rdx
  801d04:	48 c1 e0 03          	shl    rax,0x3
  801d08:	48 05 60 02 40 00    	add    rax,0x400260
  801d0e:	8b 00                	mov    eax,DWORD PTR [rax]
  801d10:	85 c0                	test   eax,eax
  801d12:	0f 85 b0 00 00 00    	jne    801dc8 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d1b:	48 63 d0             	movsxd rdx,eax
  801d1e:	48 89 d0             	mov    rax,rdx
  801d21:	48 c1 e0 02          	shl    rax,0x2
  801d25:	48 01 d0             	add    rax,rdx
  801d28:	48 c1 e0 03          	shl    rax,0x3
  801d2c:	48 05 60 02 40 00    	add    rax,0x400260
  801d32:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d38:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d3b:	48 63 d0             	movsxd rdx,eax
  801d3e:	48 89 d0             	mov    rax,rdx
  801d41:	48 01 c0             	add    rax,rax
  801d44:	48 01 d0             	add    rax,rdx
  801d47:	48 c1 e0 03          	shl    rax,0x3
  801d4b:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801d52:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d55:	48 63 d0             	movsxd rdx,eax
  801d58:	48 89 d0             	mov    rax,rdx
  801d5b:	48 c1 e0 02          	shl    rax,0x2
  801d5f:	48 01 d0             	add    rax,rdx
  801d62:	48 c1 e0 03          	shl    rax,0x3
  801d66:	48 05 58 02 40 00    	add    rax,0x400258
  801d6c:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801d6f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d72:	89 c7                	mov    edi,eax
  801d74:	e8 3d 13 00 00       	call   8030b6 <get_drv>
  801d79:	48 89 c2             	mov    rdx,rax
  801d7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d7f:	48 63 c8             	movsxd rcx,eax
  801d82:	48 89 c8             	mov    rax,rcx
  801d85:	48 c1 e0 02          	shl    rax,0x2
  801d89:	48 01 c8             	add    rax,rcx
  801d8c:	48 c1 e0 03          	shl    rax,0x3
  801d90:	48 05 48 02 40 00    	add    rax,0x400248
  801d96:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801d99:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d9c:	48 63 d0             	movsxd rdx,eax
  801d9f:	48 89 d0             	mov    rax,rdx
  801da2:	48 c1 e0 02          	shl    rax,0x2
  801da6:	48 01 d0             	add    rax,rdx
  801da9:	48 c1 e0 03          	shl    rax,0x3
  801dad:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801db4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801db8:	48 89 c6             	mov    rsi,rax
  801dbb:	48 89 d7             	mov    rdi,rdx
  801dbe:	e8 7c 99 00 00       	call   80b73f <strcpy>
            return i;
  801dc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dc6:	eb 13                	jmp    801ddb <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801dc8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801dcc:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801dd0:	0f 8e 1e ff ff ff    	jle    801cf4 <reg_vol+0x22>
        }
    }
    return -1;
  801dd6:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ddb:	c9                   	leave  
  801ddc:	c3                   	ret    

0000000000801ddd <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801ddd:	f3 0f 1e fa          	endbr64 
  801de1:	55                   	push   rbp
  801de2:	48 89 e5             	mov    rbp,rsp
  801de5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801de8:	48 8b 05 b1 26 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc126b1]        # 4144a0 <current>
  801def:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801df2:	48 63 d2             	movsxd rdx,edx
  801df5:	48 83 c2 18          	add    rdx,0x18
  801df9:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  801dfe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801e02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e06:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801e09:	5d                   	pop    rbp
  801e0a:	c3                   	ret    

0000000000801e0b <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801e0b:	f3 0f 1e fa          	endbr64 
  801e0f:	55                   	push   rbp
  801e10:	48 89 e5             	mov    rbp,rsp
  801e13:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e16:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e1d:	eb 3f                	jmp    801e5e <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e22:	48 63 d0             	movsxd rdx,eax
  801e25:	48 89 d0             	mov    rax,rdx
  801e28:	48 01 c0             	add    rax,rax
  801e2b:	48 01 d0             	add    rax,rdx
  801e2e:	48 c1 e0 05          	shl    rax,0x5
  801e32:	48 05 60 06 40 00    	add    rax,0x400660
  801e38:	8b 00                	mov    eax,DWORD PTR [rax]
  801e3a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e3d:	75 1b                	jne    801e5a <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e42:	48 63 d0             	movsxd rdx,eax
  801e45:	48 89 d0             	mov    rax,rdx
  801e48:	48 01 c0             	add    rax,rax
  801e4b:	48 01 d0             	add    rax,rdx
  801e4e:	48 c1 e0 05          	shl    rax,0x5
  801e52:	48 05 60 06 40 00    	add    rax,0x400660
  801e58:	eb 0f                	jmp    801e69 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e5a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e5e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801e62:	7e bb                	jle    801e1f <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801e64:	b8 00 00 00 00       	mov    eax,0x0
}
  801e69:	5d                   	pop    rbp
  801e6a:	c3                   	ret    

0000000000801e6b <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801e6b:	f3 0f 1e fa          	endbr64 
  801e6f:	55                   	push   rbp
  801e70:	48 89 e5             	mov    rbp,rsp
  801e73:	48 83 ec 10          	sub    rsp,0x10
  801e77:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801e7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e7f:	48 89 c7             	mov    rdi,rax
  801e82:	e8 a0 04 00 00       	call   802327 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801e87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e8b:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e8f:	84 c0                	test   al,al
  801e91:	75 07                	jne    801e9a <brelse+0x2f>
  801e93:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e98:	eb 32                	jmp    801ecc <brelse+0x61>
    bh->b_count--;
  801e9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e9e:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ea2:	8d 50 ff             	lea    edx,[rax-0x1]
  801ea5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ea9:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801eac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eb0:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801eb4:	84 c0                	test   al,al
  801eb6:	75 0f                	jne    801ec7 <brelse+0x5c>
        vmfree(bh->b_data);
  801eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ebc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ebf:	48 89 c7             	mov    rdi,rax
  801ec2:	e8 72 f4 ff ff       	call   801339 <vmfree>
    return 0;
  801ec7:	b8 00 00 00 00       	mov    eax,0x0
}
  801ecc:	c9                   	leave  
  801ecd:	c3                   	ret    

0000000000801ece <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801ece:	f3 0f 1e fa          	endbr64 
  801ed2:	55                   	push   rbp
  801ed3:	48 89 e5             	mov    rbp,rsp
  801ed6:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801edd:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801ee3:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801ee9:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801eef:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801ef5:	89 d6                	mov    esi,edx
  801ef7:	89 c7                	mov    edi,eax
  801ef9:	e8 78 02 00 00       	call   802176 <get_buf>
  801efe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801f02:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f07:	75 09                	jne    801f12 <bread+0x44>
  801f09:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f10:	eb 75                	jmp    801f87 <bread+0xb9>
    if(!bh->b_uptodate)
  801f12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f16:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f1a:	84 c0                	test   al,al
  801f1c:	75 65                	jne    801f83 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f1e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f24:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f27:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f32:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f35:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f3b:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f42:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f49:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801f4d:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801f53:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801f5a:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801f5d:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801f64:	48 89 c7             	mov    rdi,rax
  801f67:	e8 71 11 00 00       	call   8030dd <make_request>
  801f6c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801f6f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f72:	89 c7                	mov    edi,eax
  801f74:	e8 77 14 00 00       	call   8033f0 <wait_on_req>
        clear_req(reqi);
  801f79:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f7c:	89 c7                	mov    edi,eax
  801f7e:	e8 9d 14 00 00       	call   803420 <clear_req>
    }
    return bh;
  801f83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801f87:	c9                   	leave  
  801f88:	c3                   	ret    

0000000000801f89 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801f89:	f3 0f 1e fa          	endbr64 
  801f8d:	55                   	push   rbp
  801f8e:	48 89 e5             	mov    rbp,rsp
  801f91:	48 83 ec 40          	sub    rsp,0x40
  801f95:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801f99:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801f9d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801fa0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fa4:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fa7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801faa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fae:	48 89 c7             	mov    rdi,rax
  801fb1:	e8 80 01 00 00       	call   802136 <get_according_bnr>
  801fb6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801fb9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801fbc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fbf:	89 d6                	mov    esi,edx
  801fc1:	89 c7                	mov    edi,eax
  801fc3:	e8 06 ff ff ff       	call   801ece <bread>
  801fc8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801fcc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801fcf:	ba 00 02 00 00       	mov    edx,0x200
  801fd4:	39 d0                	cmp    eax,edx
  801fd6:	0f 4f c2             	cmovg  eax,edx
  801fd9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801fdc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801fdf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801fe3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801fe6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801fea:	48 89 ce             	mov    rsi,rcx
  801fed:	48 89 c7             	mov    rdi,rax
  801ff0:	e8 4c 96 00 00       	call   80b641 <memcpy>
        len-=BLOCK_SIZE;
  801ff5:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801ffc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802000:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802003:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802006:	01 c2                	add    edx,eax
  802008:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80200c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80200f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802013:	48 89 c7             	mov    rdi,rax
  802016:	e8 50 fe ff ff       	call   801e6b <brelse>
    }while(len>0);
  80201b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80201f:	7f 89                	jg     801faa <vfs_read_file+0x21>
    return 0;
  802021:	b8 00 00 00 00       	mov    eax,0x0
}
  802026:	c9                   	leave  
  802027:	c3                   	ret    

0000000000802028 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802028:	f3 0f 1e fa          	endbr64 
  80202c:	55                   	push   rbp
  80202d:	48 89 e5             	mov    rbp,rsp
  802030:	48 83 ec 40          	sub    rsp,0x40
  802034:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802038:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80203c:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80203f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802043:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802046:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802049:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80204d:	48 89 c7             	mov    rdi,rax
  802050:	e8 e1 00 00 00       	call   802136 <get_according_bnr>
  802055:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802058:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80205b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80205e:	89 d6                	mov    esi,edx
  802060:	89 c7                	mov    edi,eax
  802062:	e8 0f 01 00 00       	call   802176 <get_buf>
  802067:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80206b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80206e:	ba 00 02 00 00       	mov    edx,0x200
  802073:	39 d0                	cmp    eax,edx
  802075:	0f 4f c2             	cmovg  eax,edx
  802078:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  80207b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80207e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802082:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802085:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802089:	48 89 ce             	mov    rsi,rcx
  80208c:	48 89 c7             	mov    rdi,rax
  80208f:	e8 ad 95 00 00       	call   80b641 <memcpy>
        len-=BLOCK_SIZE;
  802094:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80209b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80209f:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020a5:	01 c2                	add    edx,eax
  8020a7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020ab:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8020ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020b2:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8020b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020ba:	48 89 c7             	mov    rdi,rax
  8020bd:	e8 a9 fd ff ff       	call   801e6b <brelse>
    }while(len>0);
  8020c2:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8020c6:	7f 81                	jg     802049 <vfs_write_file+0x21>
    return 0;
  8020c8:	b8 00 00 00 00       	mov    eax,0x0
}
  8020cd:	c9                   	leave  
  8020ce:	c3                   	ret    

00000000008020cf <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8020cf:	f3 0f 1e fa          	endbr64 
  8020d3:	55                   	push   rbp
  8020d4:	48 89 e5             	mov    rbp,rsp
  8020d7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8020db:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8020de:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8020e1:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020e5:	74 35                	je     80211c <vfs_seek_file+0x4d>
  8020e7:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020eb:	7f 3f                	jg     80212c <vfs_seek_file+0x5d>
  8020ed:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8020f1:	74 08                	je     8020fb <vfs_seek_file+0x2c>
  8020f3:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8020f7:	74 0e                	je     802107 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8020f9:	eb 31                	jmp    80212c <vfs_seek_file+0x5d>
        f->ptr=offset;
  8020fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020ff:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802102:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802105:	eb 26                	jmp    80212d <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802107:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80210b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80210e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802111:	01 c2                	add    edx,eax
  802113:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802117:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80211a:	eb 11                	jmp    80212d <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80211c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802120:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802127:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80212a:	eb 01                	jmp    80212d <vfs_seek_file+0x5e>
        break;
  80212c:	90                   	nop
    }
    return f->ptr;
  80212d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802131:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802134:	5d                   	pop    rbp
  802135:	c3                   	ret    

0000000000802136 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802136:	f3 0f 1e fa          	endbr64 
  80213a:	55                   	push   rbp
  80213b:	48 89 e5             	mov    rbp,rsp
  80213e:	48 83 ec 10          	sub    rsp,0x10
  802142:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802146:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80214a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80214d:	48 63 d0             	movsxd rdx,eax
  802150:	48 89 d0             	mov    rax,rdx
  802153:	48 c1 e0 02          	shl    rax,0x2
  802157:	48 01 d0             	add    rax,rdx
  80215a:	48 c1 e0 03          	shl    rax,0x3
  80215e:	48 05 58 02 40 00    	add    rax,0x400258
  802164:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802167:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80216b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80216f:	48 89 c7             	mov    rdi,rax
  802172:	ff d2                	call   rdx

}
  802174:	c9                   	leave  
  802175:	c3                   	ret    

0000000000802176 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802176:	f3 0f 1e fa          	endbr64 
  80217a:	55                   	push   rbp
  80217b:	48 89 e5             	mov    rbp,rsp
  80217e:	48 83 ec 20          	sub    rsp,0x20
  802182:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802185:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802188:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80218f:	e9 b9 00 00 00       	jmp    80224d <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802194:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802197:	48 98                	cdqe   
  802199:	48 c1 e0 06          	shl    rax,0x6
  80219d:	48 05 90 26 40 00    	add    rax,0x402690
  8021a3:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021a6:	0f b7 c0             	movzx  eax,ax
  8021a9:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021ac:	0f 85 97 00 00 00    	jne    802249 <get_buf+0xd3>
  8021b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021b5:	48 98                	cdqe   
  8021b7:	48 c1 e0 06          	shl    rax,0x6
  8021bb:	48 05 88 26 40 00    	add    rax,0x402688
  8021c1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8021c4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8021c7:	48 98                	cdqe   
  8021c9:	48 39 c2             	cmp    rdx,rax
  8021cc:	75 7b                	jne    802249 <get_buf+0xd3>
        {
            repeat:
  8021ce:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8021cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021d2:	48 98                	cdqe   
  8021d4:	48 c1 e0 06          	shl    rax,0x6
  8021d8:	48 05 80 26 40 00    	add    rax,0x402680
  8021de:	48 89 c7             	mov    rdi,rax
  8021e1:	e8 41 01 00 00       	call   802327 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8021e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021e9:	48 98                	cdqe   
  8021eb:	48 c1 e0 06          	shl    rax,0x6
  8021ef:	48 05 94 26 40 00    	add    rax,0x402694
  8021f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8021f8:	84 c0                	test   al,al
  8021fa:	74 02                	je     8021fe <get_buf+0x88>
                goto repeat;
  8021fc:	eb d1                	jmp    8021cf <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8021fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802201:	48 98                	cdqe   
  802203:	48 c1 e0 06          	shl    rax,0x6
  802207:	48 05 90 26 40 00    	add    rax,0x402690
  80220d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802210:	0f b7 c0             	movzx  eax,ax
  802213:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802216:	75 30                	jne    802248 <get_buf+0xd2>
  802218:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80221b:	48 98                	cdqe   
  80221d:	48 c1 e0 06          	shl    rax,0x6
  802221:	48 05 88 26 40 00    	add    rax,0x402688
  802227:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80222a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80222d:	48 98                	cdqe   
  80222f:	48 39 c2             	cmp    rdx,rax
  802232:	75 14                	jne    802248 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802234:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802237:	48 98                	cdqe   
  802239:	48 c1 e0 06          	shl    rax,0x6
  80223d:	48 05 80 26 40 00    	add    rax,0x402680
  802243:	e9 dd 00 00 00       	jmp    802325 <get_buf+0x1af>
                continue;
  802248:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802249:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80224d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802251:	0f 8e 3d ff ff ff    	jle    802194 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802257:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80225e:	e9 b8 00 00 00       	jmp    80231b <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802263:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802266:	48 98                	cdqe   
  802268:	48 c1 e0 06          	shl    rax,0x6
  80226c:	48 05 94 26 40 00    	add    rax,0x402694
  802272:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802275:	84 c0                	test   al,al
  802277:	0f 85 9a 00 00 00    	jne    802317 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  80227d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802280:	48 98                	cdqe   
  802282:	48 c1 e0 06          	shl    rax,0x6
  802286:	48 05 93 26 40 00    	add    rax,0x402693
  80228c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80228f:	84 c0                	test   al,al
  802291:	74 2e                	je     8022c1 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802293:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802296:	48 98                	cdqe   
  802298:	48 c1 e0 06          	shl    rax,0x6
  80229c:	48 05 80 26 40 00    	add    rax,0x402680
  8022a2:	48 89 c7             	mov    rdi,rax
  8022a5:	e8 1b 01 00 00       	call   8023c5 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8022aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022ad:	48 98                	cdqe   
  8022af:	48 c1 e0 06          	shl    rax,0x6
  8022b3:	48 05 80 26 40 00    	add    rax,0x402680
  8022b9:	48 89 c7             	mov    rdi,rax
  8022bc:	e8 66 00 00 00       	call   802327 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8022c1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022c4:	48 98                	cdqe   
  8022c6:	48 c1 e0 06          	shl    rax,0x6
  8022ca:	48 05 94 26 40 00    	add    rax,0x402694
  8022d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022d3:	8d 50 01             	lea    edx,[rax+0x1]
  8022d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022d9:	48 98                	cdqe   
  8022db:	48 c1 e0 06          	shl    rax,0x6
  8022df:	48 05 94 26 40 00    	add    rax,0x402694
  8022e5:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8022e7:	b8 00 00 00 00       	mov    eax,0x0
  8022ec:	e8 b9 ef ff ff       	call   8012aa <vmalloc>
  8022f1:	48 89 c2             	mov    rdx,rax
  8022f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022f7:	48 98                	cdqe   
  8022f9:	48 c1 e0 06          	shl    rax,0x6
  8022fd:	48 05 80 26 40 00    	add    rax,0x402680
  802303:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802306:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802309:	48 98                	cdqe   
  80230b:	48 c1 e0 06          	shl    rax,0x6
  80230f:	48 05 80 26 40 00    	add    rax,0x402680
  802315:	eb 0e                	jmp    802325 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802317:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80231b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80231f:	0f 8e 3e ff ff ff    	jle    802263 <get_buf+0xed>
        }
    }
}
  802325:	c9                   	leave  
  802326:	c3                   	ret    

0000000000802327 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802327:	f3 0f 1e fa          	endbr64 
  80232b:	55                   	push   rbp
  80232c:	48 89 e5             	mov    rbp,rsp
  80232f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802333:	90                   	nop
  802334:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802338:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80233c:	84 c0                	test   al,al
  80233e:	75 f4                	jne    802334 <wait_on_buf+0xd>
    
}
  802340:	90                   	nop
  802341:	90                   	nop
  802342:	5d                   	pop    rbp
  802343:	c3                   	ret    

0000000000802344 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802344:	f3 0f 1e fa          	endbr64 
  802348:	55                   	push   rbp
  802349:	48 89 e5             	mov    rbp,rsp
  80234c:	48 83 ec 30          	sub    rsp,0x30
  802350:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802353:	b8 00 00 00 00       	mov    eax,0x0
  802358:	e8 4d ef ff ff       	call   8012aa <vmalloc>
  80235d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802361:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802365:	49 89 c0             	mov    r8,rax
  802368:	b9 01 00 00 00       	mov    ecx,0x1
  80236d:	ba 00 00 00 00       	mov    edx,0x0
  802372:	be 20 00 00 00       	mov    esi,0x20
  802377:	bf 00 00 00 00       	mov    edi,0x0
  80237c:	e8 48 58 00 00       	call   807bc9 <request>
  802381:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802384:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802387:	89 c7                	mov    edi,eax
  802389:	e8 ef 5e 00 00       	call   80827d <chk_result>

    dpt_t* dpte=buf+0x1be;
  80238e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802392:	48 05 be 01 00 00    	add    rax,0x1be
  802398:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  80239c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8023a3:	eb 13                	jmp    8023b8 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8023a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023a9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023ac:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8023af:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8023b4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8023b8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8023bc:	7e e7                	jle    8023a5 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8023be:	b8 00 00 00 00       	mov    eax,0x0
}
  8023c3:	c9                   	leave  
  8023c4:	c3                   	ret    

00000000008023c5 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8023c5:	f3 0f 1e fa          	endbr64 
  8023c9:	55                   	push   rbp
  8023ca:	48 89 e5             	mov    rbp,rsp
  8023cd:	48 83 ec 20          	sub    rsp,0x20
  8023d1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8023d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023d9:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8023dd:	0f b7 c0             	movzx  eax,ax
  8023e0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8023e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023e7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023eb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8023ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8023f5:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8023f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8023fb:	b9 00 02 00 00       	mov    ecx,0x200
  802400:	89 c7                	mov    edi,eax
  802402:	e8 02 00 00 00       	call   802409 <write_block>

}
  802407:	c9                   	leave  
  802408:	c3                   	ret    

0000000000802409 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802409:	f3 0f 1e fa          	endbr64 
  80240d:	55                   	push   rbp
  80240e:	48 89 e5             	mov    rbp,rsp
  802411:	48 83 ec 30          	sub    rsp,0x30
  802415:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802418:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80241b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80241f:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802422:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802425:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802428:	89 d6                	mov    esi,edx
  80242a:	89 c7                	mov    edi,eax
  80242c:	e8 45 fd ff ff       	call   802176 <get_buf>
  802431:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802435:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802438:	ba 00 02 00 00       	mov    edx,0x200
  80243d:	39 d0                	cmp    eax,edx
  80243f:	0f 4f c2             	cmovg  eax,edx
  802442:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802445:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802448:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80244c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80244f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802453:	48 89 ce             	mov    rsi,rcx
  802456:	48 89 c7             	mov    rdi,rax
  802459:	e8 e3 91 00 00       	call   80b641 <memcpy>
        len-=BLOCK_SIZE;
  80245e:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802465:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802469:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80246d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802471:	48 89 c7             	mov    rdi,rax
  802474:	e8 f2 f9 ff ff       	call   801e6b <brelse>
    }while(len>0);
  802479:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80247d:	7f a3                	jg     802422 <write_block+0x19>
    return 0;
  80247f:	b8 00 00 00 00       	mov    eax,0x0
}
  802484:	c9                   	leave  
  802485:	c3                   	ret    

0000000000802486 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802486:	f3 0f 1e fa          	endbr64 
  80248a:	55                   	push   rbp
  80248b:	48 89 e5             	mov    rbp,rsp
  80248e:	48 83 ec 30          	sub    rsp,0x30
  802492:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802495:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802498:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80249c:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  80249f:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8024a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024a5:	89 d6                	mov    esi,edx
  8024a7:	89 c7                	mov    edi,eax
  8024a9:	e8 20 fa ff ff       	call   801ece <bread>
  8024ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024b2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8024b5:	ba 00 02 00 00       	mov    edx,0x200
  8024ba:	39 d0                	cmp    eax,edx
  8024bc:	0f 4f c2             	cmovg  eax,edx
  8024bf:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8024c2:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8024c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024c9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024cc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8024d0:	48 89 ce             	mov    rsi,rcx
  8024d3:	48 89 c7             	mov    rdi,rax
  8024d6:	e8 66 91 00 00       	call   80b641 <memcpy>
        len-=BLOCK_SIZE;
  8024db:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8024e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024e6:	48 89 c7             	mov    rdi,rax
  8024e9:	e8 7d f9 ff ff       	call   801e6b <brelse>
    }while(len>0);
  8024ee:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024f2:	7f ab                	jg     80249f <read_block+0x19>
    return 0;
  8024f4:	b8 00 00 00 00       	mov    eax,0x0
}
  8024f9:	c9                   	leave  
  8024fa:	c3                   	ret    

00000000008024fb <init_vfs>:

int init_vfs()
{
  8024fb:	f3 0f 1e fa          	endbr64 
  8024ff:	55                   	push   rbp
  802500:	48 89 e5             	mov    rbp,rsp
  802503:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802507:	48 8b 05 72 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f72]        # 408480 <dev_tree>
  80250e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802512:	eb 40                	jmp    802554 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802514:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802518:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80251e:	48 c1 f8 02          	sar    rax,0x2
  802522:	48 89 c2             	mov    rdx,rax
  802525:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80252c:	18 9c 8f 
  80252f:	48 0f af c2          	imul   rax,rdx
  802533:	89 c7                	mov    edi,eax
  802535:	e8 0a fe ff ff       	call   802344 <scan_dev>
  80253a:	85 c0                	test   eax,eax
  80253c:	74 07                	je     802545 <init_vfs+0x4a>
  80253e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802543:	eb 1b                	jmp    802560 <init_vfs+0x65>
    for(;p;p=p->next)
  802545:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802549:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802550:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802554:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802559:	75 b9                	jne    802514 <init_vfs+0x19>
    }

    return 0;
  80255b:	b8 00 00 00 00       	mov    eax,0x0
}
  802560:	c9                   	leave  
  802561:	c3                   	ret    

0000000000802562 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802562:	f3 0f 1e fa          	endbr64 
  802566:	55                   	push   rbp
  802567:	48 89 e5             	mov    rbp,rsp
}
  80256a:	90                   	nop
  80256b:	5d                   	pop    rbp
  80256c:	c3                   	ret    

000000000080256d <load_driver>:
int load_driver(char *path)
{
  80256d:	f3 0f 1e fa          	endbr64 
  802571:	55                   	push   rbp
  802572:	48 89 e5             	mov    rbp,rsp
  802575:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802579:	90                   	nop
  80257a:	5d                   	pop    rbp
  80257b:	c3                   	ret    

000000000080257c <reg_device>:

int reg_device(device* dev)
{
  80257c:	f3 0f 1e fa          	endbr64 
  802580:	55                   	push   rbp
  802581:	48 89 e5             	mov    rbp,rsp
  802584:	53                   	push   rbx
  802585:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802589:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802590:	e9 42 01 00 00       	jmp    8026d7 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802595:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802598:	48 63 d0             	movsxd rdx,eax
  80259b:	48 89 d0             	mov    rax,rdx
  80259e:	48 c1 e0 02          	shl    rax,0x2
  8025a2:	48 01 d0             	add    rax,rdx
  8025a5:	48 c1 e0 02          	shl    rax,0x2
  8025a9:	48 01 d0             	add    rax,rdx
  8025ac:	48 c1 e0 03          	shl    rax,0x3
  8025b0:	48 05 90 2e 40 00    	add    rax,0x402e90
  8025b6:	8b 00                	mov    eax,DWORD PTR [rax]
  8025b8:	85 c0                	test   eax,eax
  8025ba:	0f 85 13 01 00 00    	jne    8026d3 <reg_device+0x157>
        {
            devs[i]=*dev;
  8025c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025c3:	48 63 d0             	movsxd rdx,eax
  8025c6:	48 89 d0             	mov    rax,rdx
  8025c9:	48 c1 e0 02          	shl    rax,0x2
  8025cd:	48 01 d0             	add    rax,rdx
  8025d0:	48 c1 e0 02          	shl    rax,0x2
  8025d4:	48 01 d0             	add    rax,rdx
  8025d7:	48 c1 e0 03          	shl    rax,0x3
  8025db:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  8025e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8025e6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8025e9:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8025ed:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8025f0:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8025f4:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8025f8:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8025fc:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802600:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802604:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802608:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80260c:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802610:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802614:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802618:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80261c:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802620:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802624:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802628:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80262c:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802630:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802634:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802638:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80263c:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802640:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802644:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802648:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80264c:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802650:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802654:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802658:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80265c:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802660:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802664:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80266b:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802672:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802679:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802680:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802687:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80268e:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802695:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80269c:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8026a3:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  8026aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026ad:	48 63 d0             	movsxd rdx,eax
  8026b0:	48 89 d0             	mov    rax,rdx
  8026b3:	48 c1 e0 02          	shl    rax,0x2
  8026b7:	48 01 d0             	add    rax,rdx
  8026ba:	48 c1 e0 02          	shl    rax,0x2
  8026be:	48 01 d0             	add    rax,rdx
  8026c1:	48 c1 e0 03          	shl    rax,0x3
  8026c5:	48 05 90 2e 40 00    	add    rax,0x402e90
  8026cb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  8026d1:	eb 0e                	jmp    8026e1 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  8026d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8026d7:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  8026db:	0f 8e b4 fe ff ff    	jle    802595 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  8026e1:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  8026e5:	75 0a                	jne    8026f1 <reg_device+0x175>
        return -1;
  8026e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8026ec:	e9 6d 01 00 00       	jmp    80285e <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  8026f1:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8026f8:	00 
  8026f9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026fc:	48 63 d0             	movsxd rdx,eax
  8026ff:	48 89 d0             	mov    rax,rdx
  802702:	48 c1 e0 02          	shl    rax,0x2
  802706:	48 01 d0             	add    rax,rdx
  802709:	48 c1 e0 02          	shl    rax,0x2
  80270d:	48 01 d0             	add    rax,rdx
  802710:	48 c1 e0 03          	shl    rax,0x3
  802714:	48 05 80 2e 40 00    	add    rax,0x402e80
  80271a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  80271e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802722:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802725:	83 f8 03             	cmp    eax,0x3
  802728:	74 3b                	je     802765 <reg_device+0x1e9>
  80272a:	83 f8 03             	cmp    eax,0x3
  80272d:	7f 4b                	jg     80277a <reg_device+0x1fe>
  80272f:	83 f8 01             	cmp    eax,0x1
  802732:	74 07                	je     80273b <reg_device+0x1bf>
  802734:	83 f8 02             	cmp    eax,0x2
  802737:	74 17                	je     802750 <reg_device+0x1d4>
  802739:	eb 3f                	jmp    80277a <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  80273b:	48 8b 05 3e 5d c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05d3e]        # 408480 <dev_tree>
  802742:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802746:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  80274d:	00 
        break;
  80274e:	eb 34                	jmp    802784 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802750:	48 8b 05 31 5d c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05d31]        # 408488 <dev_tree+0x8>
  802757:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80275b:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802762:	00 
        break;
  802763:	eb 1f                	jmp    802784 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802765:	48 8b 05 24 5d c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05d24]        # 408490 <dev_tree+0x10>
  80276c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802770:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802777:	00 
        break;
  802778:	eb 0a                	jmp    802784 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  80277a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80277f:	e9 da 00 00 00       	jmp    80285e <reg_device+0x2e2>
    }
    if(!p){
  802784:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802789:	75 2b                	jne    8027b6 <reg_device+0x23a>
        *pp=neo;
  80278b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80278f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802793:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802796:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80279a:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8027a1:	00 00 00 00 
  8027a5:	eb 3d                	jmp    8027e4 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8027a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027ab:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8027b2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027ba:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8027c1:	48 85 c0             	test   rax,rax
  8027c4:	75 e1                	jne    8027a7 <reg_device+0x22b>
        p->next=neo;
  8027c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027ca:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8027ce:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  8027d5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027d9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8027dd:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  8027e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027e8:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  8027ef:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  8027f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027f7:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8027fa:	83 f8 04             	cmp    eax,0x4
  8027fd:	74 3b                	je     80283a <reg_device+0x2be>
  8027ff:	83 f8 04             	cmp    eax,0x4
  802802:	7f 56                	jg     80285a <reg_device+0x2de>
  802804:	83 f8 03             	cmp    eax,0x3
  802807:	74 21                	je     80282a <reg_device+0x2ae>
  802809:	83 f8 03             	cmp    eax,0x3
  80280c:	7f 4c                	jg     80285a <reg_device+0x2de>
  80280e:	83 f8 01             	cmp    eax,0x1
  802811:	74 07                	je     80281a <reg_device+0x29e>
  802813:	83 f8 02             	cmp    eax,0x2
  802816:	74 32                	je     80284a <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802818:	eb 40                	jmp    80285a <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80281a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80281e:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802825:	00 00 00 
        break;
  802828:	eb 31                	jmp    80285b <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80282a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80282e:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802835:	00 00 00 
        break;
  802838:	eb 21                	jmp    80285b <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80283a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80283e:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802845:	00 00 00 
        break;
  802848:	eb 11                	jmp    80285b <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  80284a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80284e:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802855:	00 00 00 
        break;
  802858:	eb 01                	jmp    80285b <reg_device+0x2df>
        break;
  80285a:	90                   	nop
    }
    return i;
  80285b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80285e:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802862:	c9                   	leave  
  802863:	c3                   	ret    

0000000000802864 <reg_driver>:


int reg_driver(driver *drv)
{
  802864:	f3 0f 1e fa          	endbr64 
  802868:	55                   	push   rbp
  802869:	48 89 e5             	mov    rbp,rsp
  80286c:	53                   	push   rbx
  80286d:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802871:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802878:	e9 22 01 00 00       	jmp    80299f <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  80287d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802880:	48 63 d0             	movsxd rdx,eax
  802883:	48 89 d0             	mov    rax,rdx
  802886:	48 c1 e0 02          	shl    rax,0x2
  80288a:	48 01 d0             	add    rax,rdx
  80288d:	48 c1 e0 05          	shl    rax,0x5
  802891:	48 05 80 58 40 00    	add    rax,0x405880
  802897:	8b 00                	mov    eax,DWORD PTR [rax]
  802899:	85 c0                	test   eax,eax
  80289b:	0f 85 fa 00 00 00    	jne    80299b <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8028a1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028a4:	48 63 d0             	movsxd rdx,eax
  8028a7:	48 89 d0             	mov    rax,rdx
  8028aa:	48 c1 e0 02          	shl    rax,0x2
  8028ae:	48 01 d0             	add    rax,rdx
  8028b1:	48 c1 e0 05          	shl    rax,0x5
  8028b5:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  8028bc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028c0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8028c3:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8028c7:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8028ca:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8028ce:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8028d2:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8028d6:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8028da:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8028de:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8028e2:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8028e6:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8028ea:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8028ee:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8028f2:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8028f6:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8028fa:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8028fe:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802902:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802906:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80290a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80290e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802912:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802916:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80291a:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80291e:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802922:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802926:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80292a:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80292e:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802932:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802936:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80293a:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80293e:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802945:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80294c:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802953:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80295a:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802961:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802968:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80296f:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802976:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802979:	48 63 d0             	movsxd rdx,eax
  80297c:	48 89 d0             	mov    rax,rdx
  80297f:	48 c1 e0 02          	shl    rax,0x2
  802983:	48 01 d0             	add    rax,rdx
  802986:	48 c1 e0 05          	shl    rax,0x5
  80298a:	48 05 80 58 40 00    	add    rax,0x405880
  802990:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802996:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802999:	eb 13                	jmp    8029ae <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  80299b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80299f:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8029a3:	0f 8e d4 fe ff ff    	jle    80287d <reg_driver+0x19>
        }
    }
    return -1;
  8029a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8029ae:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8029b2:	c9                   	leave  
  8029b3:	c3                   	ret    

00000000008029b4 <sys_find_dev>:

int sys_find_dev(char *name)
{
  8029b4:	f3 0f 1e fa          	endbr64 
  8029b8:	55                   	push   rbp
  8029b9:	48 89 e5             	mov    rbp,rsp
  8029bc:	48 83 ec 20          	sub    rsp,0x20
  8029c0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  8029c4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8029cb:	eb 6c                	jmp    802a39 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  8029cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029d0:	48 63 d0             	movsxd rdx,eax
  8029d3:	48 89 d0             	mov    rax,rdx
  8029d6:	48 c1 e0 02          	shl    rax,0x2
  8029da:	48 01 d0             	add    rax,rdx
  8029dd:	48 c1 e0 02          	shl    rax,0x2
  8029e1:	48 01 d0             	add    rax,rdx
  8029e4:	48 c1 e0 03          	shl    rax,0x3
  8029e8:	48 05 90 2e 40 00    	add    rax,0x402e90
  8029ee:	8b 00                	mov    eax,DWORD PTR [rax]
  8029f0:	85 c0                	test   eax,eax
  8029f2:	74 41                	je     802a35 <sys_find_dev+0x81>
  8029f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029f7:	48 63 d0             	movsxd rdx,eax
  8029fa:	48 89 d0             	mov    rax,rdx
  8029fd:	48 c1 e0 02          	shl    rax,0x2
  802a01:	48 01 d0             	add    rax,rdx
  802a04:	48 c1 e0 02          	shl    rax,0x2
  802a08:	48 01 d0             	add    rax,rdx
  802a0b:	48 c1 e0 03          	shl    rax,0x3
  802a0f:	48 83 c0 10          	add    rax,0x10
  802a13:	48 05 80 2e 40 00    	add    rax,0x402e80
  802a19:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802a1d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802a21:	48 89 d6             	mov    rsi,rdx
  802a24:	48 89 c7             	mov    rdi,rax
  802a27:	e8 b3 8e 00 00       	call   80b8df <strcmp>
  802a2c:	85 c0                	test   eax,eax
  802a2e:	75 05                	jne    802a35 <sys_find_dev+0x81>
            return i;
  802a30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a33:	eb 0f                	jmp    802a44 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802a35:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802a39:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802a3d:	7e 8e                	jle    8029cd <sys_find_dev+0x19>
    }
    return -1;
  802a3f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802a44:	c9                   	leave  
  802a45:	c3                   	ret    

0000000000802a46 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802a46:	f3 0f 1e fa          	endbr64 
  802a4a:	55                   	push   rbp
  802a4b:	48 89 e5             	mov    rbp,rsp
  802a4e:	48 83 ec 30          	sub    rsp,0x30
  802a52:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802a56:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802a59:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802a5d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802a64:	eb 67                	jmp    802acd <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802a66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a69:	48 63 d0             	movsxd rdx,eax
  802a6c:	48 89 d0             	mov    rax,rdx
  802a6f:	48 c1 e0 02          	shl    rax,0x2
  802a73:	48 01 d0             	add    rax,rdx
  802a76:	48 c1 e0 02          	shl    rax,0x2
  802a7a:	48 01 d0             	add    rax,rdx
  802a7d:	48 c1 e0 03          	shl    rax,0x3
  802a81:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a87:	8b 00                	mov    eax,DWORD PTR [rax]
  802a89:	85 c0                	test   eax,eax
  802a8b:	74 3c                	je     802ac9 <sys_operate_dev+0x83>
  802a8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a90:	48 63 d0             	movsxd rdx,eax
  802a93:	48 89 d0             	mov    rax,rdx
  802a96:	48 c1 e0 02          	shl    rax,0x2
  802a9a:	48 01 d0             	add    rax,rdx
  802a9d:	48 c1 e0 02          	shl    rax,0x2
  802aa1:	48 01 d0             	add    rax,rdx
  802aa4:	48 c1 e0 03          	shl    rax,0x3
  802aa8:	48 83 c0 10          	add    rax,0x10
  802aac:	48 05 80 2e 40 00    	add    rax,0x402e80
  802ab2:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802ab6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802aba:	48 89 d6             	mov    rsi,rdx
  802abd:	48 89 c7             	mov    rdi,rax
  802ac0:	e8 1a 8e 00 00       	call   80b8df <strcmp>
  802ac5:	85 c0                	test   eax,eax
  802ac7:	74 0c                	je     802ad5 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802ac9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802acd:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802ad1:	7e 93                	jle    802a66 <sys_operate_dev+0x20>
  802ad3:	eb 01                	jmp    802ad6 <sys_operate_dev+0x90>
            break;
  802ad5:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802ad6:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802ada:	75 0a                	jne    802ae6 <sys_operate_dev+0xa0>
  802adc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ae1:	e9 9c 02 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
    switch (func) {
  802ae6:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802aea:	0f 87 8d 02 00 00    	ja     802d7d <sys_operate_dev+0x337>
  802af0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802af3:	48 8b 04 c5 88 3b 81 	mov    rax,QWORD PTR [rax*8+0x813b88]
  802afa:	00 
  802afb:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802afe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b01:	48 63 d0             	movsxd rdx,eax
  802b04:	48 89 d0             	mov    rax,rdx
  802b07:	48 c1 e0 02          	shl    rax,0x2
  802b0b:	48 01 d0             	add    rax,rdx
  802b0e:	48 c1 e0 02          	shl    rax,0x2
  802b12:	48 01 d0             	add    rax,rdx
  802b15:	48 c1 e0 03          	shl    rax,0x3
  802b19:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b1f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b22:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802b26:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b2a:	48 89 c7             	mov    rdi,rax
  802b2d:	ff d2                	call   rdx
  802b2f:	e9 4e 02 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802b34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b37:	48 63 d0             	movsxd rdx,eax
  802b3a:	48 89 d0             	mov    rax,rdx
  802b3d:	48 c1 e0 02          	shl    rax,0x2
  802b41:	48 01 d0             	add    rax,rdx
  802b44:	48 c1 e0 02          	shl    rax,0x2
  802b48:	48 01 d0             	add    rax,rdx
  802b4b:	48 c1 e0 03          	shl    rax,0x3
  802b4f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b58:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802b5c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b60:	48 89 c7             	mov    rdi,rax
  802b63:	ff d2                	call   rdx
  802b65:	e9 18 02 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802b6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b6d:	48 63 d0             	movsxd rdx,eax
  802b70:	48 89 d0             	mov    rax,rdx
  802b73:	48 c1 e0 02          	shl    rax,0x2
  802b77:	48 01 d0             	add    rax,rdx
  802b7a:	48 c1 e0 02          	shl    rax,0x2
  802b7e:	48 01 d0             	add    rax,rdx
  802b81:	48 c1 e0 03          	shl    rax,0x3
  802b85:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b8b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b8e:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802b92:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b96:	48 89 c7             	mov    rdi,rax
  802b99:	ff d2                	call   rdx
  802b9b:	e9 e2 01 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802ba0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ba3:	48 63 d0             	movsxd rdx,eax
  802ba6:	48 89 d0             	mov    rax,rdx
  802ba9:	48 c1 e0 02          	shl    rax,0x2
  802bad:	48 01 d0             	add    rax,rdx
  802bb0:	48 c1 e0 02          	shl    rax,0x2
  802bb4:	48 01 d0             	add    rax,rdx
  802bb7:	48 c1 e0 03          	shl    rax,0x3
  802bbb:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bc1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bc4:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802bc8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bcc:	48 89 c7             	mov    rdi,rax
  802bcf:	ff d2                	call   rdx
  802bd1:	e9 ac 01 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802bd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bd9:	48 63 d0             	movsxd rdx,eax
  802bdc:	48 89 d0             	mov    rax,rdx
  802bdf:	48 c1 e0 02          	shl    rax,0x2
  802be3:	48 01 d0             	add    rax,rdx
  802be6:	48 c1 e0 02          	shl    rax,0x2
  802bea:	48 01 d0             	add    rax,rdx
  802bed:	48 c1 e0 03          	shl    rax,0x3
  802bf1:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bf7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bfa:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802bfe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c02:	48 89 c7             	mov    rdi,rax
  802c05:	ff d2                	call   rdx
  802c07:	e9 76 01 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802c0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c0f:	48 63 d0             	movsxd rdx,eax
  802c12:	48 89 d0             	mov    rax,rdx
  802c15:	48 c1 e0 02          	shl    rax,0x2
  802c19:	48 01 d0             	add    rax,rdx
  802c1c:	48 c1 e0 02          	shl    rax,0x2
  802c20:	48 01 d0             	add    rax,rdx
  802c23:	48 c1 e0 03          	shl    rax,0x3
  802c27:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c30:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802c34:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c38:	48 89 c7             	mov    rdi,rax
  802c3b:	ff d2                	call   rdx
  802c3d:	e9 40 01 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802c42:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c45:	48 63 d0             	movsxd rdx,eax
  802c48:	48 89 d0             	mov    rax,rdx
  802c4b:	48 c1 e0 02          	shl    rax,0x2
  802c4f:	48 01 d0             	add    rax,rdx
  802c52:	48 c1 e0 02          	shl    rax,0x2
  802c56:	48 01 d0             	add    rax,rdx
  802c59:	48 c1 e0 03          	shl    rax,0x3
  802c5d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c63:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c66:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802c6a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c6e:	48 89 c7             	mov    rdi,rax
  802c71:	ff d2                	call   rdx
  802c73:	e9 0a 01 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802c78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c7b:	48 63 d0             	movsxd rdx,eax
  802c7e:	48 89 d0             	mov    rax,rdx
  802c81:	48 c1 e0 02          	shl    rax,0x2
  802c85:	48 01 d0             	add    rax,rdx
  802c88:	48 c1 e0 02          	shl    rax,0x2
  802c8c:	48 01 d0             	add    rax,rdx
  802c8f:	48 c1 e0 03          	shl    rax,0x3
  802c93:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c99:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c9c:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802ca0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ca4:	48 89 c7             	mov    rdi,rax
  802ca7:	ff d2                	call   rdx
  802ca9:	e9 d4 00 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802cae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cb1:	48 63 d0             	movsxd rdx,eax
  802cb4:	48 89 d0             	mov    rax,rdx
  802cb7:	48 c1 e0 02          	shl    rax,0x2
  802cbb:	48 01 d0             	add    rax,rdx
  802cbe:	48 c1 e0 02          	shl    rax,0x2
  802cc2:	48 01 d0             	add    rax,rdx
  802cc5:	48 c1 e0 03          	shl    rax,0x3
  802cc9:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ccf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cd2:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802cd6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cda:	48 89 c7             	mov    rdi,rax
  802cdd:	ff d2                	call   rdx
  802cdf:	e9 9e 00 00 00       	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802ce4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ce7:	48 63 d0             	movsxd rdx,eax
  802cea:	48 89 d0             	mov    rax,rdx
  802ced:	48 c1 e0 02          	shl    rax,0x2
  802cf1:	48 01 d0             	add    rax,rdx
  802cf4:	48 c1 e0 02          	shl    rax,0x2
  802cf8:	48 01 d0             	add    rax,rdx
  802cfb:	48 c1 e0 03          	shl    rax,0x3
  802cff:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d05:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d08:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802d0c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d10:	48 89 c7             	mov    rdi,rax
  802d13:	ff d2                	call   rdx
  802d15:	eb 6b                	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802d17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d1a:	48 63 d0             	movsxd rdx,eax
  802d1d:	48 89 d0             	mov    rax,rdx
  802d20:	48 c1 e0 02          	shl    rax,0x2
  802d24:	48 01 d0             	add    rax,rdx
  802d27:	48 c1 e0 02          	shl    rax,0x2
  802d2b:	48 01 d0             	add    rax,rdx
  802d2e:	48 c1 e0 03          	shl    rax,0x3
  802d32:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d38:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d3b:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802d3f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d43:	48 89 c7             	mov    rdi,rax
  802d46:	ff d2                	call   rdx
  802d48:	eb 38                	jmp    802d82 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802d4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d4d:	48 63 d0             	movsxd rdx,eax
  802d50:	48 89 d0             	mov    rax,rdx
  802d53:	48 c1 e0 02          	shl    rax,0x2
  802d57:	48 01 d0             	add    rax,rdx
  802d5a:	48 c1 e0 02          	shl    rax,0x2
  802d5e:	48 01 d0             	add    rax,rdx
  802d61:	48 c1 e0 03          	shl    rax,0x3
  802d65:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d6b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d6e:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802d72:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d76:	48 89 c7             	mov    rdi,rax
  802d79:	ff d2                	call   rdx
  802d7b:	eb 05                	jmp    802d82 <sys_operate_dev+0x33c>
    }
    return -1;
  802d7d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802d82:	c9                   	leave  
  802d83:	c3                   	ret    

0000000000802d84 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802d84:	f3 0f 1e fa          	endbr64 
  802d88:	55                   	push   rbp
  802d89:	48 89 e5             	mov    rbp,rsp
  802d8c:	48 83 ec 10          	sub    rsp,0x10
  802d90:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802d93:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802d96:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802d9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d9d:	48 63 d0             	movsxd rdx,eax
  802da0:	48 89 d0             	mov    rax,rdx
  802da3:	48 c1 e0 02          	shl    rax,0x2
  802da7:	48 01 d0             	add    rax,rdx
  802daa:	48 c1 e0 05          	shl    rax,0x5
  802dae:	48 05 80 58 40 00    	add    rax,0x405880
  802db4:	8b 00                	mov    eax,DWORD PTR [rax]
  802db6:	85 c0                	test   eax,eax
  802db8:	75 0a                	jne    802dc4 <call_drv_func+0x40>
  802dba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802dbf:	e9 15 02 00 00       	jmp    802fd9 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802dc4:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802dc8:	0f 87 06 02 00 00    	ja     802fd4 <call_drv_func+0x250>
  802dce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802dd1:	48 8b 04 c5 e8 3b 81 	mov    rax,QWORD PTR [rax*8+0x813be8]
  802dd8:	00 
  802dd9:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802ddc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ddf:	48 63 d0             	movsxd rdx,eax
  802de2:	48 89 d0             	mov    rax,rdx
  802de5:	48 c1 e0 02          	shl    rax,0x2
  802de9:	48 01 d0             	add    rax,rdx
  802dec:	48 c1 e0 05          	shl    rax,0x5
  802df0:	48 05 88 58 40 00    	add    rax,0x405888
  802df6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802df9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dfd:	48 89 c7             	mov    rdi,rax
  802e00:	ff d2                	call   rdx
  802e02:	e9 d2 01 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802e07:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e0a:	48 63 d0             	movsxd rdx,eax
  802e0d:	48 89 d0             	mov    rax,rdx
  802e10:	48 c1 e0 02          	shl    rax,0x2
  802e14:	48 01 d0             	add    rax,rdx
  802e17:	48 c1 e0 05          	shl    rax,0x5
  802e1b:	48 05 90 58 40 00    	add    rax,0x405890
  802e21:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e28:	48 89 c7             	mov    rdi,rax
  802e2b:	ff d2                	call   rdx
  802e2d:	e9 a7 01 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802e32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e35:	48 63 d0             	movsxd rdx,eax
  802e38:	48 89 d0             	mov    rax,rdx
  802e3b:	48 c1 e0 02          	shl    rax,0x2
  802e3f:	48 01 d0             	add    rax,rdx
  802e42:	48 c1 e0 05          	shl    rax,0x5
  802e46:	48 05 98 58 40 00    	add    rax,0x405898
  802e4c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e4f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e53:	48 89 c7             	mov    rdi,rax
  802e56:	ff d2                	call   rdx
  802e58:	e9 7c 01 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802e5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e60:	48 63 d0             	movsxd rdx,eax
  802e63:	48 89 d0             	mov    rax,rdx
  802e66:	48 c1 e0 02          	shl    rax,0x2
  802e6a:	48 01 d0             	add    rax,rdx
  802e6d:	48 c1 e0 05          	shl    rax,0x5
  802e71:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802e77:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e7e:	48 89 c7             	mov    rdi,rax
  802e81:	ff d2                	call   rdx
  802e83:	e9 51 01 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802e88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e8b:	48 63 d0             	movsxd rdx,eax
  802e8e:	48 89 d0             	mov    rax,rdx
  802e91:	48 c1 e0 02          	shl    rax,0x2
  802e95:	48 01 d0             	add    rax,rdx
  802e98:	48 c1 e0 05          	shl    rax,0x5
  802e9c:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802ea2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ea5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ea9:	48 89 c7             	mov    rdi,rax
  802eac:	ff d2                	call   rdx
  802eae:	e9 26 01 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802eb3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eb6:	48 63 d0             	movsxd rdx,eax
  802eb9:	48 89 d0             	mov    rax,rdx
  802ebc:	48 c1 e0 02          	shl    rax,0x2
  802ec0:	48 01 d0             	add    rax,rdx
  802ec3:	48 c1 e0 05          	shl    rax,0x5
  802ec7:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802ecd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ed0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ed4:	48 89 c7             	mov    rdi,rax
  802ed7:	ff d2                	call   rdx
  802ed9:	e9 fb 00 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802ede:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ee1:	48 63 d0             	movsxd rdx,eax
  802ee4:	48 89 d0             	mov    rax,rdx
  802ee7:	48 c1 e0 02          	shl    rax,0x2
  802eeb:	48 01 d0             	add    rax,rdx
  802eee:	48 c1 e0 05          	shl    rax,0x5
  802ef2:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802ef8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802efb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802eff:	48 89 c7             	mov    rdi,rax
  802f02:	ff d2                	call   rdx
  802f04:	e9 d0 00 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802f09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f0c:	48 63 d0             	movsxd rdx,eax
  802f0f:	48 89 d0             	mov    rax,rdx
  802f12:	48 c1 e0 02          	shl    rax,0x2
  802f16:	48 01 d0             	add    rax,rdx
  802f19:	48 c1 e0 05          	shl    rax,0x5
  802f1d:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802f23:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f2a:	48 89 c7             	mov    rdi,rax
  802f2d:	ff d2                	call   rdx
  802f2f:	e9 a5 00 00 00       	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802f34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f37:	48 63 d0             	movsxd rdx,eax
  802f3a:	48 89 d0             	mov    rax,rdx
  802f3d:	48 c1 e0 02          	shl    rax,0x2
  802f41:	48 01 d0             	add    rax,rdx
  802f44:	48 c1 e0 05          	shl    rax,0x5
  802f48:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802f4e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f51:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f55:	48 89 c7             	mov    rdi,rax
  802f58:	ff d2                	call   rdx
  802f5a:	eb 7d                	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802f5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f5f:	48 63 d0             	movsxd rdx,eax
  802f62:	48 89 d0             	mov    rax,rdx
  802f65:	48 c1 e0 02          	shl    rax,0x2
  802f69:	48 01 d0             	add    rax,rdx
  802f6c:	48 c1 e0 05          	shl    rax,0x5
  802f70:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802f76:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f79:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f7d:	48 89 c7             	mov    rdi,rax
  802f80:	ff d2                	call   rdx
  802f82:	eb 55                	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802f84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f87:	48 63 d0             	movsxd rdx,eax
  802f8a:	48 89 d0             	mov    rax,rdx
  802f8d:	48 c1 e0 02          	shl    rax,0x2
  802f91:	48 01 d0             	add    rax,rdx
  802f94:	48 c1 e0 05          	shl    rax,0x5
  802f98:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802f9e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fa1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fa5:	48 89 c7             	mov    rdi,rax
  802fa8:	ff d2                	call   rdx
  802faa:	eb 2d                	jmp    802fd9 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  802fac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802faf:	48 63 d0             	movsxd rdx,eax
  802fb2:	48 89 d0             	mov    rax,rdx
  802fb5:	48 c1 e0 02          	shl    rax,0x2
  802fb9:	48 01 d0             	add    rax,rdx
  802fbc:	48 c1 e0 05          	shl    rax,0x5
  802fc0:	48 05 e0 58 40 00    	add    rax,0x4058e0
  802fc6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fcd:	48 89 c7             	mov    rdi,rax
  802fd0:	ff d2                	call   rdx
  802fd2:	eb 05                	jmp    802fd9 <call_drv_func+0x255>
    }
    return -1;
  802fd4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802fd9:	c9                   	leave  
  802fda:	c3                   	ret    

0000000000802fdb <dispose_device>:
int dispose_device(int dev){
  802fdb:	f3 0f 1e fa          	endbr64 
  802fdf:	55                   	push   rbp
  802fe0:	48 89 e5             	mov    rbp,rsp
  802fe3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  802fe6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802fe9:	48 63 d0             	movsxd rdx,eax
  802fec:	48 89 d0             	mov    rax,rdx
  802fef:	48 c1 e0 02          	shl    rax,0x2
  802ff3:	48 01 d0             	add    rax,rdx
  802ff6:	48 c1 e0 02          	shl    rax,0x2
  802ffa:	48 01 d0             	add    rax,rdx
  802ffd:	48 c1 e0 03          	shl    rax,0x3
  803001:	48 05 90 2e 40 00    	add    rax,0x402e90
  803007:	8b 00                	mov    eax,DWORD PTR [rax]
  803009:	83 f8 01             	cmp    eax,0x1
  80300c:	74 07                	je     803015 <dispose_device+0x3a>
  80300e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803013:	eb 62                	jmp    803077 <dispose_device+0x9c>
    device* p=&devs[dev];
  803015:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803018:	48 63 d0             	movsxd rdx,eax
  80301b:	48 89 d0             	mov    rax,rdx
  80301e:	48 c1 e0 02          	shl    rax,0x2
  803022:	48 01 d0             	add    rax,rdx
  803025:	48 c1 e0 02          	shl    rax,0x2
  803029:	48 01 d0             	add    rax,rdx
  80302c:	48 c1 e0 03          	shl    rax,0x3
  803030:	48 05 80 2e 40 00    	add    rax,0x402e80
  803036:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80303a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80303e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803045:	48 85 c0             	test   rax,rax
  803048:	74 1d                	je     803067 <dispose_device+0x8c>
  80304a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80304e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803055:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803059:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803060:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803067:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80306b:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803072:	b8 00 00 00 00       	mov    eax,0x0
}
  803077:	5d                   	pop    rbp
  803078:	c3                   	ret    

0000000000803079 <dispose_driver>:
int dispose_driver(driver *drv){
  803079:	f3 0f 1e fa          	endbr64 
  80307d:	55                   	push   rbp
  80307e:	48 89 e5             	mov    rbp,rsp
  803081:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803085:	90                   	nop
  803086:	5d                   	pop    rbp
  803087:	c3                   	ret    

0000000000803088 <get_dev>:

device *get_dev(int devi)
{
  803088:	f3 0f 1e fa          	endbr64 
  80308c:	55                   	push   rbp
  80308d:	48 89 e5             	mov    rbp,rsp
  803090:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803093:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803096:	48 63 d0             	movsxd rdx,eax
  803099:	48 89 d0             	mov    rax,rdx
  80309c:	48 c1 e0 02          	shl    rax,0x2
  8030a0:	48 01 d0             	add    rax,rdx
  8030a3:	48 c1 e0 02          	shl    rax,0x2
  8030a7:	48 01 d0             	add    rax,rdx
  8030aa:	48 c1 e0 03          	shl    rax,0x3
  8030ae:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8030b4:	5d                   	pop    rbp
  8030b5:	c3                   	ret    

00000000008030b6 <get_drv>:
driver *get_drv(int drvi)
{
  8030b6:	f3 0f 1e fa          	endbr64 
  8030ba:	55                   	push   rbp
  8030bb:	48 89 e5             	mov    rbp,rsp
  8030be:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8030c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030c4:	48 63 d0             	movsxd rdx,eax
  8030c7:	48 89 d0             	mov    rax,rdx
  8030ca:	48 c1 e0 02          	shl    rax,0x2
  8030ce:	48 01 d0             	add    rax,rdx
  8030d1:	48 c1 e0 05          	shl    rax,0x5
  8030d5:	48 05 80 58 40 00    	add    rax,0x405880
}
  8030db:	5d                   	pop    rbp
  8030dc:	c3                   	ret    

00000000008030dd <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8030dd:	f3 0f 1e fa          	endbr64 
  8030e1:	55                   	push   rbp
  8030e2:	48 89 e5             	mov    rbp,rsp
  8030e5:	53                   	push   rbx
  8030e6:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8030ea:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8030f1:	eb 23                	jmp    803116 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8030f3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030f6:	48 63 d0             	movsxd rdx,eax
  8030f9:	48 89 d0             	mov    rax,rdx
  8030fc:	48 01 c0             	add    rax,rax
  8030ff:	48 01 d0             	add    rax,rdx
  803102:	48 c1 e0 06          	shl    rax,0x6
  803106:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80310c:	8b 00                	mov    eax,DWORD PTR [rax]
  80310e:	85 c0                	test   eax,eax
  803110:	74 0c                	je     80311e <make_request+0x41>
    for(;i<NR_REQS;i++)
  803112:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803116:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80311a:	7e d7                	jle    8030f3 <make_request+0x16>
  80311c:	eb 01                	jmp    80311f <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80311e:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80311f:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803123:	75 0a                	jne    80312f <make_request+0x52>
  803125:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80312a:	e9 e7 01 00 00       	jmp    803316 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80312f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803132:	48 63 d0             	movsxd rdx,eax
  803135:	48 89 d0             	mov    rax,rdx
  803138:	48 01 c0             	add    rax,rax
  80313b:	48 01 d0             	add    rax,rdx
  80313e:	48 c1 e0 06          	shl    rax,0x6
  803142:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803149:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80314d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803150:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803154:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803157:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80315b:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80315f:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803163:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803167:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80316b:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80316f:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803173:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803177:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80317b:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80317f:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803183:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803187:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80318b:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80318f:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803193:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803197:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80319b:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80319f:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8031a3:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8031a7:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8031ab:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8031af:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8031b3:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8031b7:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8031bb:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8031bf:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8031c3:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8031c7:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8031cb:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8031d2:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8031d9:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8031e0:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8031e7:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8031ee:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8031f5:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8031fc:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803203:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80320a:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803211:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803218:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80321f:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803226:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80322d:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803234:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80323b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80323f:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803245:	48 63 d0             	movsxd rdx,eax
  803248:	48 89 d0             	mov    rax,rdx
  80324b:	48 c1 e0 02          	shl    rax,0x2
  80324f:	48 01 d0             	add    rax,rdx
  803252:	48 c1 e0 02          	shl    rax,0x2
  803256:	48 01 d0             	add    rax,rdx
  803259:	48 c1 e0 03          	shl    rax,0x3
  80325d:	48 05 80 2e 40 00    	add    rax,0x402e80
  803263:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803267:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80326b:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803272:	48 85 c0             	test   rax,rax
  803275:	75 27                	jne    80329e <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803277:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80327a:	48 63 d0             	movsxd rdx,eax
  80327d:	48 89 d0             	mov    rax,rdx
  803280:	48 01 c0             	add    rax,rax
  803283:	48 01 d0             	add    rax,rdx
  803286:	48 c1 e0 06          	shl    rax,0x6
  80328a:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803291:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803295:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  80329c:	eb 75                	jmp    803313 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  80329e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032a2:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8032a9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8032ad:	eb 0f                	jmp    8032be <make_request+0x1e1>
  8032af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8032b3:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8032ba:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8032be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8032c2:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8032c9:	48 85 c0             	test   rax,rax
  8032cc:	75 e1                	jne    8032af <make_request+0x1d2>
        p->next=&reqs[i];
  8032ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032d1:	48 63 d0             	movsxd rdx,eax
  8032d4:	48 89 d0             	mov    rax,rdx
  8032d7:	48 01 c0             	add    rax,rax
  8032da:	48 01 d0             	add    rax,rdx
  8032dd:	48 c1 e0 06          	shl    rax,0x6
  8032e1:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8032e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8032ec:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8032f3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032f6:	48 63 d0             	movsxd rdx,eax
  8032f9:	48 89 d0             	mov    rax,rdx
  8032fc:	48 01 c0             	add    rax,rax
  8032ff:	48 01 d0             	add    rax,rdx
  803302:	48 c1 e0 06          	shl    rax,0x6
  803306:	48 05 38 6d 40 00    	add    rax,0x406d38
  80330c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803313:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803316:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80331a:	c9                   	leave  
  80331b:	c3                   	ret    

000000000080331c <do_req>:
//取出一个申请并且执行
int do_req()
{
  80331c:	f3 0f 1e fa          	endbr64 
  803320:	55                   	push   rbp
  803321:	48 89 e5             	mov    rbp,rsp
  803324:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803328:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80332f:	e9 ab 00 00 00       	jmp    8033df <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803334:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803337:	48 98                	cdqe   
  803339:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803340:	00 
  803341:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803345:	e9 86 00 00 00       	jmp    8033d0 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80334a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80334e:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803355:	48 85 c0             	test   rax,rax
  803358:	75 67                	jne    8033c1 <do_req+0xa5>
  80335a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80335e:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803365:	48 85 c0             	test   rax,rax
  803368:	74 57                	je     8033c1 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  80336a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80336e:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803375:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803379:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803380:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803384:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80338b:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803392:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803396:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  80339d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033a1:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8033a7:	48 98                	cdqe   
  8033a9:	48 8b 14 c5 40 c0 80 	mov    rdx,QWORD PTR [rax*8+0x80c040]
  8033b0:	00 
  8033b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033b5:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8033bc:	48 89 c7             	mov    rdi,rax
  8033bf:	ff d2                	call   rdx
        for(;p;p=p->next)
  8033c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c5:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8033cc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8033d0:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8033d5:	0f 85 6f ff ff ff    	jne    80334a <do_req+0x2e>
    for(int i=0;i<3;i++)
  8033db:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8033df:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8033e3:	0f 8e 4b ff ff ff    	jle    803334 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8033e9:	b8 00 00 00 00       	mov    eax,0x0
}
  8033ee:	c9                   	leave  
  8033ef:	c3                   	ret    

00000000008033f0 <wait_on_req>:


void wait_on_req(int reqi)
{
  8033f0:	f3 0f 1e fa          	endbr64 
  8033f4:	55                   	push   rbp
  8033f5:	48 89 e5             	mov    rbp,rsp
  8033f8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8033fb:	90                   	nop
  8033fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033ff:	48 63 d0             	movsxd rdx,eax
  803402:	48 89 d0             	mov    rax,rdx
  803405:	48 01 c0             	add    rax,rax
  803408:	48 01 d0             	add    rax,rdx
  80340b:	48 c1 e0 06          	shl    rax,0x6
  80340f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803415:	8b 00                	mov    eax,DWORD PTR [rax]
  803417:	83 f8 03             	cmp    eax,0x3
  80341a:	75 e0                	jne    8033fc <wait_on_req+0xc>
}
  80341c:	90                   	nop
  80341d:	90                   	nop
  80341e:	5d                   	pop    rbp
  80341f:	c3                   	ret    

0000000000803420 <clear_req>:
void clear_req(int reqi)
{
  803420:	f3 0f 1e fa          	endbr64 
  803424:	55                   	push   rbp
  803425:	48 89 e5             	mov    rbp,rsp
  803428:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80342b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80342e:	48 63 d0             	movsxd rdx,eax
  803431:	48 89 d0             	mov    rax,rdx
  803434:	48 01 c0             	add    rax,rax
  803437:	48 01 d0             	add    rax,rdx
  80343a:	48 c1 e0 06          	shl    rax,0x6
  80343e:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803444:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80344a:	90                   	nop
  80344b:	5d                   	pop    rbp
  80344c:	c3                   	ret    

000000000080344d <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80344d:	f3 0f 1e fa          	endbr64 
  803451:	55                   	push   rbp
  803452:	48 89 e5             	mov    rbp,rsp
  803455:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803459:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803460:	eb 61                	jmp    8034c3 <init_proc+0x76>
        task[i].pid=-1;
  803462:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803465:	48 63 d0             	movsxd rdx,eax
  803468:	48 89 d0             	mov    rax,rdx
  80346b:	48 01 c0             	add    rax,rax
  80346e:	48 01 d0             	add    rax,rdx
  803471:	48 c1 e0 08          	shl    rax,0x8
  803475:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80347b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803481:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803484:	48 63 d0             	movsxd rdx,eax
  803487:	48 89 d0             	mov    rax,rdx
  80348a:	48 01 c0             	add    rax,rax
  80348d:	48 01 d0             	add    rax,rdx
  803490:	48 c1 e0 08          	shl    rax,0x8
  803494:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80349a:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8034a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034a3:	48 63 d0             	movsxd rdx,eax
  8034a6:	48 89 d0             	mov    rax,rdx
  8034a9:	48 01 c0             	add    rax,rax
  8034ac:	48 01 d0             	add    rax,rdx
  8034af:	48 c1 e0 08          	shl    rax,0x8
  8034b3:	48 05 28 85 40 00    	add    rax,0x408528
  8034b9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8034bf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8034c3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8034c7:	7e 99                	jle    803462 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8034c9:	c7 05 59 10 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11059],0x0        # 41452c <cur_proc>
  8034d0:	00 00 00 
    current=task;
  8034d3:	48 c7 05 c2 0f c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10fc2],0x4084a0        # 4144a0 <current>
  8034da:	a0 84 40 00 
    pidd=1;
  8034de:	c7 05 48 10 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11048],0x1        # 414530 <pidd>
  8034e5:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8034e8:	b8 00 00 00 00       	mov    eax,0x0
  8034ed:	e8 09 03 00 00       	call   8037fb <create_proc>
  8034f2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8034f5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8034f8:	48 63 d0             	movsxd rdx,eax
  8034fb:	48 89 d0             	mov    rax,rdx
  8034fe:	48 01 c0             	add    rax,rax
  803501:	48 01 d0             	add    rax,rdx
  803504:	48 c1 e0 08          	shl    rax,0x8
  803508:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80350e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803514:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803517:	83 c0 03             	add    eax,0x3
  80351a:	c1 e0 04             	shl    eax,0x4
  80351d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803520:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803523:	01 c0                	add    eax,eax
  803525:	83 c0 05             	add    eax,0x5
  803528:	c1 e0 03             	shl    eax,0x3
  80352b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  80352e:	68 00 00 80 00       	push   0x800000
  803533:	68 00 00 80 00       	push   0x800000
  803538:	68 00 00 80 00       	push   0x800000
  80353d:	68 00 00 80 00       	push   0x800000
  803542:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803548:	41 b8 00 00 80 00    	mov    r8d,0x800000
  80354e:	b9 00 00 80 00       	mov    ecx,0x800000
  803553:	ba 00 00 40 00       	mov    edx,0x400000
  803558:	be 00 00 40 00       	mov    esi,0x400000
  80355d:	bf 00 00 40 00       	mov    edi,0x400000
  803562:	e8 c9 14 00 00       	call   804a30 <set_tss>
  803567:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  80356b:	48 8b 05 ee 8a 00 00 	mov    rax,QWORD PTR [rip+0x8aee]        # 80c060 <tss>
  803572:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  803576:	48 89 c6             	mov    rsi,rax
  803579:	bf a8 06 00 00       	mov    edi,0x6a8
  80357e:	e8 81 d2 ff ff       	call   800804 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803583:	be 08 00 00 00       	mov    esi,0x8
  803588:	bf 74 01 00 00       	mov    edi,0x174
  80358d:	e8 72 d2 ff ff       	call   800804 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803592:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803599:	00 20 00 
  80359c:	48 89 c6             	mov    rsi,rax
  80359f:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8035a4:	48 89 c7             	mov    rdi,rax
  8035a7:	e8 58 d2 ff ff       	call   800804 <wrmsr>
    //创建一个测试进程
    create_test_proc();
  8035ac:	b8 00 00 00 00       	mov    eax,0x0
  8035b1:	e8 03 00 00 00       	call   8035b9 <create_test_proc>
}
  8035b6:	90                   	nop
  8035b7:	c9                   	leave  
  8035b8:	c3                   	ret    

00000000008035b9 <create_test_proc>:
void create_test_proc(){
  8035b9:	f3 0f 1e fa          	endbr64 
  8035bd:	55                   	push   rbp
  8035be:	48 89 e5             	mov    rbp,rsp
  8035c1:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  8035c5:	b8 00 00 00 00       	mov    eax,0x0
  8035ca:	e8 af 02 00 00       	call   80387e <req_proc>
  8035cf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  8035d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035d5:	48 63 d0             	movsxd rdx,eax
  8035d8:	48 89 d0             	mov    rax,rdx
  8035db:	48 01 c0             	add    rax,rax
  8035de:	48 01 d0             	add    rax,rdx
  8035e1:	48 c1 e0 08          	shl    rax,0x8
  8035e5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8035eb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  8035f1:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8035f8:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8035fc:	ba c2 bf 80 00       	mov    edx,0x80bfc2
  803601:	48 83 ec 08          	sub    rsp,0x8
  803605:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803608:	50                   	push   rax
  803609:	6a 00                	push   0x0
  80360b:	52                   	push   rdx
  80360c:	6a 00                	push   0x0
  80360e:	6a 00                	push   0x0
  803610:	6a 00                	push   0x0
  803612:	68 58 7d 00 00       	push   0x7d58
  803617:	6a 10                	push   0x10
  803619:	6a 10                	push   0x10
  80361b:	6a 10                	push   0x10
  80361d:	6a 10                	push   0x10
  80361f:	41 b9 08 00 00 00    	mov    r9d,0x8
  803625:	41 b8 10 00 00 00    	mov    r8d,0x10
  80362b:	b9 00 00 00 00       	mov    ecx,0x0
  803630:	ba 00 00 00 00       	mov    edx,0x0
  803635:	be 00 00 00 00       	mov    esi,0x0
  80363a:	bf 00 00 00 00       	mov    edi,0x0
  80363f:	e8 33 03 00 00       	call   803977 <set_proc>
  803644:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803648:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80364b:	48 63 d0             	movsxd rdx,eax
  80364e:	48 89 d0             	mov    rax,rdx
  803651:	48 01 c0             	add    rax,rax
  803654:	48 01 d0             	add    rax,rdx
  803657:	48 c1 e0 08          	shl    rax,0x8
  80365b:	48 05 68 86 40 00    	add    rax,0x408668
  803661:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    task[index].mem_struct.stack_top=0x7e00;
  803668:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80366b:	48 63 d0             	movsxd rdx,eax
  80366e:	48 89 d0             	mov    rax,rdx
  803671:	48 01 c0             	add    rax,rax
  803674:	48 01 d0             	add    rax,rdx
  803677:	48 c1 e0 08          	shl    rax,0x8
  80367b:	48 05 c0 84 40 00    	add    rax,0x4084c0
  803681:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  803687:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80368a:	48 63 d0             	movsxd rdx,eax
  80368d:	48 89 d0             	mov    rax,rdx
  803690:	48 01 c0             	add    rax,rax
  803693:	48 01 d0             	add    rax,rdx
  803696:	48 c1 e0 08          	shl    rax,0x8
  80369a:	48 05 bc 84 40 00    	add    rax,0x4084bc
  8036a0:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  8036a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a9:	48 63 d0             	movsxd rdx,eax
  8036ac:	48 89 d0             	mov    rax,rdx
  8036af:	48 01 c0             	add    rax,rax
  8036b2:	48 01 d0             	add    rax,rdx
  8036b5:	48 c1 e0 08          	shl    rax,0x8
  8036b9:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8036bf:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  8036c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036c8:	48 63 d0             	movsxd rdx,eax
  8036cb:	48 89 d0             	mov    rax,rdx
  8036ce:	48 01 c0             	add    rax,rax
  8036d1:	48 01 d0             	add    rax,rdx
  8036d4:	48 c1 e0 08          	shl    rax,0x8
  8036d8:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8036de:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  8036e4:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  8036eb:	00 
    str->rax=0;
  8036ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036f0:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  8036f7:	00 
    str->rbx=0;
  8036f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036fc:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803703:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803704:	ba f2 3a 80 00       	mov    edx,0x803af2
  803709:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80370d:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803711:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803715:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  80371c:	00 
    str->rsi=0;
  80371d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803721:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803728:	00 
    str->rdi=0;
  803729:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80372d:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803734:	00 
    str->r15=0;
  803735:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803739:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803740:	00 
    str->r14=0;
  803741:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803745:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80374c:	00 
    str->r13=0;
  80374d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803751:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803758:	00 
    str->r12=0;
  803759:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80375d:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803764:	00 
    str->r11=0x200;
  803765:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803769:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  803770:	00 
    str->r10=0;
  803771:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803775:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  80377c:	00 
    str->r9=0;
  80377d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803781:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803788:	00 
    str->r8=0;
  803789:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80378d:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803794:	00 
    str->rip=proc_zero;
  803795:	ba f2 3a 80 00       	mov    edx,0x803af2
  80379a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80379e:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  8037a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a9:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  8037b0:	08 00 00 00 
    str->rflags=0x00200206;
  8037b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b8:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  8037bf:	06 02 20 00 
    str->rsp=0x7e00;
  8037c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c7:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  8037ce:	00 7e 00 00 
    str->ss=0x2b;
  8037d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037d6:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  8037dd:	2b 00 00 00 
    str->ds=0x2b;
  8037e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037e5:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  8037ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037f0:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  8037f7:	00 

}
  8037f8:	90                   	nop
  8037f9:	c9                   	leave  
  8037fa:	c3                   	ret    

00000000008037fb <create_proc>:
int create_proc()
{
  8037fb:	f3 0f 1e fa          	endbr64 
  8037ff:	55                   	push   rbp
  803800:	48 89 e5             	mov    rbp,rsp
  803803:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803807:	b8 00 00 00 00       	mov    eax,0x0
  80380c:	e8 6d 00 00 00       	call   80387e <req_proc>
  803811:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803814:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803818:	75 07                	jne    803821 <create_proc+0x26>
  80381a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80381f:	eb 5b                	jmp    80387c <create_proc+0x81>
    int currsp=0x9fc00-1;
  803821:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803828:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80382c:	b9 f2 3a 80 00       	mov    ecx,0x803af2
  803831:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803834:	48 98                	cdqe   
  803836:	48 83 ec 08          	sub    rsp,0x8
  80383a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80383d:	52                   	push   rdx
  80383e:	6a 00                	push   0x0
  803840:	51                   	push   rcx
  803841:	6a 00                	push   0x0
  803843:	6a 00                	push   0x0
  803845:	6a 00                	push   0x0
  803847:	50                   	push   rax
  803848:	6a 10                	push   0x10
  80384a:	6a 10                	push   0x10
  80384c:	6a 10                	push   0x10
  80384e:	6a 10                	push   0x10
  803850:	41 b9 08 00 00 00    	mov    r9d,0x8
  803856:	41 b8 10 00 00 00    	mov    r8d,0x10
  80385c:	b9 00 00 00 00       	mov    ecx,0x0
  803861:	ba 00 00 00 00       	mov    edx,0x0
  803866:	be 00 00 00 00       	mov    esi,0x0
  80386b:	bf 00 00 00 00       	mov    edi,0x0
  803870:	e8 02 01 00 00       	call   803977 <set_proc>
  803875:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803879:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80387c:	c9                   	leave  
  80387d:	c3                   	ret    

000000000080387e <req_proc>:
int req_proc(){
  80387e:	f3 0f 1e fa          	endbr64 
  803882:	55                   	push   rbp
  803883:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803886:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80388d:	eb 04                	jmp    803893 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  80388f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803893:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803896:	48 63 d0             	movsxd rdx,eax
  803899:	48 89 d0             	mov    rax,rdx
  80389c:	48 01 c0             	add    rax,rax
  80389f:	48 01 d0             	add    rax,rdx
  8038a2:	48 c1 e0 08          	shl    rax,0x8
  8038a6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8038ae:	83 f8 ff             	cmp    eax,0xffffffff
  8038b1:	74 26                	je     8038d9 <req_proc+0x5b>
  8038b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038b6:	48 63 d0             	movsxd rdx,eax
  8038b9:	48 89 d0             	mov    rax,rdx
  8038bc:	48 01 c0             	add    rax,rax
  8038bf:	48 01 d0             	add    rax,rdx
  8038c2:	48 c1 e0 08          	shl    rax,0x8
  8038c6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8038cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8038ce:	83 f8 03             	cmp    eax,0x3
  8038d1:	74 06                	je     8038d9 <req_proc+0x5b>
  8038d3:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8038d7:	7e b6                	jle    80388f <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8038d9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8038dd:	7e 0a                	jle    8038e9 <req_proc+0x6b>
        return -1;
  8038df:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038e4:	e9 8c 00 00 00       	jmp    803975 <req_proc+0xf7>
    task[num].pid=pidd++;
  8038e9:	8b 05 41 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c41]        # 414530 <pidd>
  8038ef:	8d 50 01             	lea    edx,[rax+0x1]
  8038f2:	89 15 38 0c c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10c38],edx        # 414530 <pidd>
  8038f8:	89 c1                	mov    ecx,eax
  8038fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038fd:	48 63 d0             	movsxd rdx,eax
  803900:	48 89 d0             	mov    rax,rdx
  803903:	48 01 c0             	add    rax,rax
  803906:	48 01 d0             	add    rax,rdx
  803909:	48 c1 e0 08          	shl    rax,0x8
  80390d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803913:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803915:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803918:	48 63 d0             	movsxd rdx,eax
  80391b:	48 89 d0             	mov    rax,rdx
  80391e:	48 01 c0             	add    rax,rax
  803921:	48 01 d0             	add    rax,rdx
  803924:	48 c1 e0 08          	shl    rax,0x8
  803928:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80392e:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803934:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803937:	48 63 d0             	movsxd rdx,eax
  80393a:	48 89 d0             	mov    rax,rdx
  80393d:	48 01 c0             	add    rax,rax
  803940:	48 01 d0             	add    rax,rdx
  803943:	48 c1 e0 08          	shl    rax,0x8
  803947:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80394d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803953:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803956:	48 63 d0             	movsxd rdx,eax
  803959:	48 89 d0             	mov    rax,rdx
  80395c:	48 01 c0             	add    rax,rax
  80395f:	48 01 d0             	add    rax,rdx
  803962:	48 c1 e0 08          	shl    rax,0x8
  803966:	48 05 ac 84 40 00    	add    rax,0x4084ac
  80396c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803972:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803975:	5d                   	pop    rbp
  803976:	c3                   	ret    

0000000000803977 <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  803977:	f3 0f 1e fa          	endbr64 
  80397b:	55                   	push   rbp
  80397c:	48 89 e5             	mov    rbp,rsp
  80397f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803983:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803987:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80398b:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  80398f:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803993:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803997:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  80399a:	48 63 d0             	movsxd rdx,eax
  80399d:	48 89 d0             	mov    rax,rdx
  8039a0:	48 01 c0             	add    rax,rax
  8039a3:	48 01 d0             	add    rax,rdx
  8039a6:	48 c1 e0 08          	shl    rax,0x8
  8039aa:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039b0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  8039b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039b8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8039bc:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=rbx;
  8039c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039c7:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8039cb:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=rcx;
  8039d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039d6:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8039da:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=rdx;
  8039e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039e5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8039e9:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  8039f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039f4:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8039f8:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  8039ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a03:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a07:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803a0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a12:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a16:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803a1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a21:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803a25:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803a2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a30:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803a34:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803a3b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a3f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803a43:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=rsp;
  803a4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a4e:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803a52:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=rbp;
  803a59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a5d:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803a61:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=rsi;
  803a68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a6c:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803a70:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=rdi;
  803a77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a7b:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803a7f:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803a86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a8a:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803a91:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803a95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a99:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803a9d:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803aa4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa8:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803aac:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803ab3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803abb:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803ac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ac6:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803aca:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad5:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803adc:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803ae0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ae4:	48 c7 80 ac 00 00 00 	mov    QWORD PTR [rax+0xac],0x101000
  803aeb:	00 10 10 00 


}
  803aef:	90                   	nop
  803af0:	5d                   	pop    rbp
  803af1:	c3                   	ret    

0000000000803af2 <proc_zero>:
void proc_zero()
{
  803af2:	f3 0f 1e fa          	endbr64 
  803af6:	55                   	push   rbp
  803af7:	48 89 e5             	mov    rbp,rsp
  803afa:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("mov $27,%rax\n"
  803afe:	48 c7 c0 1b 00 00 00 	mov    rax,0x1b
  803b05:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    long rax;
    asm volatile("":"=a"(rax));
  803b08:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(rax==0){
  803b0c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  803b11:	75 19                	jne    803b2c <proc_zero+0x3a>
        printf("parent proc ret:%d\n",cur_proc);
  803b13:	8b 05 13 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a13]        # 41452c <cur_proc>
  803b19:	89 c6                	mov    esi,eax
  803b1b:	bf 48 3c 81 00       	mov    edi,0x813c48
  803b20:	b8 00 00 00 00       	mov    eax,0x0
  803b25:	e8 ee d1 ff ff       	call   800d18 <printf>
  803b2a:	eb 17                	jmp    803b43 <proc_zero+0x51>
    }else{
        printf("child proc ret:%d\n",cur_proc);
  803b2c:	8b 05 fa 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109fa]        # 41452c <cur_proc>
  803b32:	89 c6                	mov    esi,eax
  803b34:	bf 5c 3c 81 00       	mov    edi,0x813c5c
  803b39:	b8 00 00 00 00       	mov    eax,0x0
  803b3e:	e8 d5 d1 ff ff       	call   800d18 <printf>
    }
    while(1);
  803b43:	eb fe                	jmp    803b43 <proc_zero+0x51>

0000000000803b45 <save_rsp>:
}
void save_rsp(){
  803b45:	f3 0f 1e fa          	endbr64 
  803b49:	55                   	push   rbp
  803b4a:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803b4d:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803b54:	00 
    current->regs.rsp=*p;
  803b55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b59:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803b5c:	48 8b 05 3d 09 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1093d]        # 4144a0 <current>
  803b63:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
}
  803b6a:	90                   	nop
  803b6b:	5d                   	pop    rbp
  803b6c:	c3                   	ret    

0000000000803b6d <manage_proc>:
void manage_proc(){
  803b6d:	f3 0f 1e fa          	endbr64 
  803b71:	55                   	push   rbp
  803b72:	48 89 e5             	mov    rbp,rsp
  803b75:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803b79:	8b 05 ad 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109ad]        # 41452c <cur_proc>
  803b7f:	83 f8 ff             	cmp    eax,0xffffffff
  803b82:	74 39                	je     803bbd <manage_proc+0x50>
        task[cur_proc].utime++;
  803b84:	8b 15 a2 09 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc109a2]        # 41452c <cur_proc>
  803b8a:	48 63 ca             	movsxd rcx,edx
  803b8d:	48 89 c8             	mov    rax,rcx
  803b90:	48 01 c0             	add    rax,rax
  803b93:	48 01 c8             	add    rax,rcx
  803b96:	48 c1 e0 08          	shl    rax,0x8
  803b9a:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ba0:	8b 00                	mov    eax,DWORD PTR [rax]
  803ba2:	8d 48 01             	lea    ecx,[rax+0x1]
  803ba5:	48 63 d2             	movsxd rdx,edx
  803ba8:	48 89 d0             	mov    rax,rdx
  803bab:	48 01 c0             	add    rax,rax
  803bae:	48 01 d0             	add    rax,rdx
  803bb1:	48 c1 e0 08          	shl    rax,0x8
  803bb5:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803bbb:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803bbd:	8b 05 69 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10969]        # 41452c <cur_proc>
  803bc3:	83 f8 ff             	cmp    eax,0xffffffff
  803bc6:	74 4a                	je     803c12 <manage_proc+0xa5>
  803bc8:	8b 05 5e 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1095e]        # 41452c <cur_proc>
  803bce:	48 63 d0             	movsxd rdx,eax
  803bd1:	48 89 d0             	mov    rax,rdx
  803bd4:	48 01 c0             	add    rax,rax
  803bd7:	48 01 d0             	add    rax,rdx
  803bda:	48 c1 e0 08          	shl    rax,0x8
  803bde:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803be4:	8b 00                	mov    eax,DWORD PTR [rax]
  803be6:	83 f8 01             	cmp    eax,0x1
  803be9:	77 27                	ja     803c12 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803beb:	8b 05 3b 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1093b]        # 41452c <cur_proc>
  803bf1:	48 63 d0             	movsxd rdx,eax
  803bf4:	48 89 d0             	mov    rax,rdx
  803bf7:	48 01 c0             	add    rax,rax
  803bfa:	48 01 d0             	add    rax,rdx
  803bfd:	48 c1 e0 08          	shl    rax,0x8
  803c01:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c07:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803c09:	83 f8 01             	cmp    eax,0x1
  803c0c:	0f 84 1e 01 00 00    	je     803d30 <manage_proc+0x1c3>
        if(cur_proc!=-1)
  803c12:	8b 05 14 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10914]        # 41452c <cur_proc>
  803c18:	83 f8 ff             	cmp    eax,0xffffffff
  803c1b:	74 22                	je     803c3f <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803c1d:	8b 05 09 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10909]        # 41452c <cur_proc>
  803c23:	48 63 d0             	movsxd rdx,eax
  803c26:	48 89 d0             	mov    rax,rdx
  803c29:	48 01 c0             	add    rax,rax
  803c2c:	48 01 d0             	add    rax,rdx
  803c2f:	48 c1 e0 08          	shl    rax,0x8
  803c33:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c39:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803c3f:	8b 05 e7 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108e7]        # 41452c <cur_proc>
  803c45:	83 c0 01             	add    eax,0x1
  803c48:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        //轮询，直到有一个符合条件
        while(1){
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803c4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c4e:	48 63 d0             	movsxd rdx,eax
  803c51:	48 89 d0             	mov    rax,rdx
  803c54:	48 01 c0             	add    rax,rax
  803c57:	48 01 d0             	add    rax,rdx
  803c5a:	48 c1 e0 08          	shl    rax,0x8
  803c5e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c64:	8b 00                	mov    eax,DWORD PTR [rax]
  803c66:	83 f8 ff             	cmp    eax,0xffffffff
  803c69:	74 2b                	je     803c96 <manage_proc+0x129>
  803c6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c6e:	48 63 d0             	movsxd rdx,eax
  803c71:	48 89 d0             	mov    rax,rdx
  803c74:	48 01 c0             	add    rax,rax
  803c77:	48 01 d0             	add    rax,rdx
  803c7a:	48 c1 e0 08          	shl    rax,0x8
  803c7e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c84:	8b 00                	mov    eax,DWORD PTR [rax]
  803c86:	83 f8 01             	cmp    eax,0x1
  803c89:	75 0b                	jne    803c96 <manage_proc+0x129>
  803c8b:	8b 05 9b 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1089b]        # 41452c <cur_proc>
  803c91:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803c94:	75 16                	jne    803cac <manage_proc+0x13f>
                break;
            }
            i=(i+1)%MAX_TASKS;
  803c96:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c99:	83 c0 01             	add    eax,0x1
  803c9c:	99                   	cdq    
  803c9d:	c1 ea 1b             	shr    edx,0x1b
  803ca0:	01 d0                	add    eax,edx
  803ca2:	83 e0 1f             	and    eax,0x1f
  803ca5:	29 d0                	sub    eax,edx
  803ca7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803caa:	eb 9f                	jmp    803c4b <manage_proc+0xde>
                break;
  803cac:	90                   	nop
        }
        //switch
        task[cur_proc].stat=READY;
  803cad:	8b 05 79 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10879]        # 41452c <cur_proc>
  803cb3:	48 63 d0             	movsxd rdx,eax
  803cb6:	48 89 d0             	mov    rax,rdx
  803cb9:	48 01 c0             	add    rax,rax
  803cbc:	48 01 d0             	add    rax,rdx
  803cbf:	48 c1 e0 08          	shl    rax,0x8
  803cc3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803cc9:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803ccf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cd2:	48 63 d0             	movsxd rdx,eax
  803cd5:	48 89 d0             	mov    rax,rdx
  803cd8:	48 01 c0             	add    rax,rax
  803cdb:	48 01 d0             	add    rax,rdx
  803cde:	48 c1 e0 08          	shl    rax,0x8
  803ce2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ce8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803cee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cf1:	48 63 d0             	movsxd rdx,eax
  803cf4:	48 89 d0             	mov    rax,rdx
  803cf7:	48 01 c0             	add    rax,rax
  803cfa:	48 01 d0             	add    rax,rdx
  803cfd:	48 c1 e0 08          	shl    rax,0x8
  803d01:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d08:	8b 05 1e 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1081e]        # 41452c <cur_proc>
  803d0e:	48 63 c8             	movsxd rcx,eax
  803d11:	48 89 c8             	mov    rax,rcx
  803d14:	48 01 c0             	add    rax,rax
  803d17:	48 01 c8             	add    rax,rcx
  803d1a:	48 c1 e0 08          	shl    rax,0x8
  803d1e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d24:	48 89 d6             	mov    rsi,rdx
  803d27:	48 89 c7             	mov    rdi,rax
  803d2a:	e8 6c 0b 00 00       	call   80489b <switch_to>
    }
    return;
  803d2f:	90                   	nop
  803d30:	90                   	nop
}
  803d31:	c9                   	leave  
  803d32:	c3                   	ret    

0000000000803d33 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d33:	f3 0f 1e fa          	endbr64 
  803d37:	55                   	push   rbp
  803d38:	48 89 e5             	mov    rbp,rsp
  803d3b:	48 83 ec 20          	sub    rsp,0x20
  803d3f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803d42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d45:	01 c0                	add    eax,eax
  803d47:	83 c0 05             	add    eax,0x5
  803d4a:	c1 e0 03             	shl    eax,0x3
  803d4d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803d50:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d53:	89 05 d3 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107d3],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803d59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d5c:	89 c7                	mov    edi,eax
  803d5e:	e8 77 81 00 00       	call   80beda <switch_proc_asm>
}
  803d63:	90                   	nop
  803d64:	c9                   	leave  
  803d65:	c3                   	ret    

0000000000803d66 <switch_proc>:
void switch_proc(int pnr){
  803d66:	f3 0f 1e fa          	endbr64 
  803d6a:	55                   	push   rbp
  803d6b:	48 89 e5             	mov    rbp,rsp
  803d6e:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803d75:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803d7b:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803d81:	48 63 d0             	movsxd rdx,eax
  803d84:	48 89 d0             	mov    rax,rdx
  803d87:	48 01 c0             	add    rax,rax
  803d8a:	48 01 d0             	add    rax,rdx
  803d8d:	48 c1 e0 08          	shl    rax,0x8
  803d91:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d98:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803d9f:	48 89 d6             	mov    rsi,rdx
  803da2:	ba 60 00 00 00       	mov    edx,0x60
  803da7:	48 89 c7             	mov    rdi,rax
  803daa:	48 89 d1             	mov    rcx,rdx
  803dad:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803db0:	8b 05 76 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10776]        # 41452c <cur_proc>
  803db6:	48 63 d0             	movsxd rdx,eax
  803db9:	48 89 d0             	mov    rax,rdx
  803dbc:	48 01 c0             	add    rax,rax
  803dbf:	48 01 d0             	add    rax,rdx
  803dc2:	48 c1 e0 08          	shl    rax,0x8
  803dc6:	48 05 c0 01 00 00    	add    rax,0x1c0
  803dcc:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803dd2:	48 83 c0 04          	add    rax,0x4
  803dd6:	48 89 c7             	mov    rdi,rax
  803dd9:	e8 53 00 00 00       	call   803e31 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803dde:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803de4:	89 05 42 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10742],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803dea:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803df0:	01 c0                	add    eax,eax
  803df2:	83 c0 05             	add    eax,0x5
  803df5:	c1 e0 03             	shl    eax,0x3
  803df8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803dfb:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e01:	48 63 d0             	movsxd rdx,eax
  803e04:	48 89 d0             	mov    rax,rdx
  803e07:	48 01 c0             	add    rax,rax
  803e0a:	48 01 d0             	add    rax,rdx
  803e0d:	48 c1 e0 08          	shl    rax,0x8
  803e11:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e17:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e1d:	48 83 c0 04          	add    rax,0x4
  803e21:	48 89 c6             	mov    rsi,rax
  803e24:	bf 00 00 00 00       	mov    edi,0x0
  803e29:	e8 6d 0a 00 00       	call   80489b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803e2e:	90                   	nop
  803e2f:	c9                   	leave  
  803e30:	c3                   	ret    

0000000000803e31 <save_context>:
void save_context(TSS *tss)
{
  803e31:	f3 0f 1e fa          	endbr64 
  803e35:	55                   	push   rbp
  803e36:	48 89 e5             	mov    rbp,rsp
  803e39:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803e3d:	90                   	nop
  803e3e:	5d                   	pop    rbp
  803e3f:	c3                   	ret    

0000000000803e40 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803e40:	f3 0f 1e fa          	endbr64 
  803e44:	55                   	push   rbp
  803e45:	48 89 e5             	mov    rbp,rsp
  803e48:	48 83 ec 60          	sub    rsp,0x60
  803e4c:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803e4f:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803e52:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e55:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803e5b:	85 c0                	test   eax,eax
  803e5d:	0f 48 c2             	cmovs  eax,edx
  803e60:	c1 f8 0c             	sar    eax,0xc
  803e63:	89 c1                	mov    ecx,eax
  803e65:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e68:	99                   	cdq    
  803e69:	c1 ea 14             	shr    edx,0x14
  803e6c:	01 d0                	add    eax,edx
  803e6e:	25 ff 0f 00 00       	and    eax,0xfff
  803e73:	29 d0                	sub    eax,edx
  803e75:	01 c8                	add    eax,ecx
  803e77:	85 c0                	test   eax,eax
  803e79:	0f 95 c0             	setne  al
  803e7c:	0f b6 c0             	movzx  eax,al
  803e7f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803e82:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803e89:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803e90:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803e91:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803e98:	00 
    pgind++;
  803e99:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e9e:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803ea5:	e9 76 02 00 00       	jmp    804120 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803eaa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803eae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803eb1:	25 00 f0 ff ff       	and    eax,0xfffff000
  803eb6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803eba:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803ec1:	e9 44 02 00 00       	jmp    80410a <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803ec6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803eca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ecd:	83 e0 01             	and    eax,0x1
  803ed0:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803ed3:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803ed7:	0f 85 24 02 00 00    	jne    804101 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803edd:	b8 00 00 00 00       	mov    eax,0x0
  803ee2:	e8 76 d7 ff ff       	call   80165d <req_a_page>
  803ee7:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803eea:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803eee:	0f 85 dc 00 00 00    	jne    803fd0 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803ef4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ef7:	48 63 d0             	movsxd rdx,eax
  803efa:	48 89 d0             	mov    rax,rdx
  803efd:	48 01 c0             	add    rax,rax
  803f00:	48 01 d0             	add    rax,rdx
  803f03:	48 c1 e0 08          	shl    rax,0x8
  803f07:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f0d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f10:	0f b7 c0             	movzx  eax,ax
  803f13:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f16:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f19:	48 63 d0             	movsxd rdx,eax
  803f1c:	48 89 d0             	mov    rax,rdx
  803f1f:	48 01 c0             	add    rax,rax
  803f22:	48 01 d0             	add    rax,rdx
  803f25:	48 c1 e0 08          	shl    rax,0x8
  803f29:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f2f:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f33:	0f b7 c0             	movzx  eax,ax
  803f36:	c1 e0 10             	shl    eax,0x10
  803f39:	25 00 00 0f 00       	and    eax,0xf0000
  803f3e:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803f41:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f44:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803f47:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f4a:	89 c1                	mov    ecx,eax
  803f4c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f4f:	48 63 d0             	movsxd rdx,eax
  803f52:	48 89 d0             	mov    rax,rdx
  803f55:	48 01 c0             	add    rax,rax
  803f58:	48 01 d0             	add    rax,rdx
  803f5b:	48 c1 e0 08          	shl    rax,0x8
  803f5f:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f65:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803f68:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f6b:	48 63 d0             	movsxd rdx,eax
  803f6e:	48 89 d0             	mov    rax,rdx
  803f71:	48 01 c0             	add    rax,rax
  803f74:	48 01 d0             	add    rax,rdx
  803f77:	48 c1 e0 08          	shl    rax,0x8
  803f7b:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f81:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f85:	0f b7 c0             	movzx  eax,ax
  803f88:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803f8b:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803f92:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f95:	c1 e8 10             	shr    eax,0x10
  803f98:	83 e0 0f             	and    eax,0xf
  803f9b:	89 c2                	mov    edx,eax
  803f9d:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fa0:	01 d0                	add    eax,edx
  803fa2:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803fa5:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fa8:	89 c1                	mov    ecx,eax
  803faa:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fad:	48 63 d0             	movsxd rdx,eax
  803fb0:	48 89 d0             	mov    rax,rdx
  803fb3:	48 01 c0             	add    rax,rax
  803fb6:	48 01 d0             	add    rax,rdx
  803fb9:	48 c1 e0 08          	shl    rax,0x8
  803fbd:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803fc3:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803fc7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803fcb:	e9 62 01 00 00       	jmp    804132 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  803fd0:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803fd3:	89 c7                	mov    edi,eax
  803fd5:	e8 31 d8 ff ff       	call   80180b <get_phyaddr>
  803fda:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803fdd:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803fe0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803fe4:	ba 07 00 00 00       	mov    edx,0x7
  803fe9:	89 ce                	mov    esi,ecx
  803feb:	48 89 c7             	mov    rdi,rax
  803fee:	e8 2b d8 ff ff       	call   80181e <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803ff3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ff6:	c1 e0 0a             	shl    eax,0xa
  803ff9:	89 c2                	mov    edx,eax
  803ffb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803ffe:	01 d0                	add    eax,edx
  804000:	c1 e0 0c             	shl    eax,0xc
  804003:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804006:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  80400b:	75 09                	jne    804016 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  80400d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804010:	89 05 1e 05 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1051e],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  804016:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80401a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80401e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804022:	0f 85 d9 00 00 00    	jne    804101 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804028:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80402b:	48 63 d0             	movsxd rdx,eax
  80402e:	48 89 d0             	mov    rax,rdx
  804031:	48 01 c0             	add    rax,rax
  804034:	48 01 d0             	add    rax,rdx
  804037:	48 c1 e0 08          	shl    rax,0x8
  80403b:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804041:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804044:	0f b7 c0             	movzx  eax,ax
  804047:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80404a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80404d:	48 63 d0             	movsxd rdx,eax
  804050:	48 89 d0             	mov    rax,rdx
  804053:	48 01 c0             	add    rax,rax
  804056:	48 01 d0             	add    rax,rdx
  804059:	48 c1 e0 08          	shl    rax,0x8
  80405d:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804063:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804067:	0f b7 c0             	movzx  eax,ax
  80406a:	c1 e0 10             	shl    eax,0x10
  80406d:	25 00 00 0f 00       	and    eax,0xf0000
  804072:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804075:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804078:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80407b:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80407e:	89 c1                	mov    ecx,eax
  804080:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804083:	48 63 d0             	movsxd rdx,eax
  804086:	48 89 d0             	mov    rax,rdx
  804089:	48 01 c0             	add    rax,rax
  80408c:	48 01 d0             	add    rax,rdx
  80408f:	48 c1 e0 08          	shl    rax,0x8
  804093:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804099:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80409c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80409f:	48 63 d0             	movsxd rdx,eax
  8040a2:	48 89 d0             	mov    rax,rdx
  8040a5:	48 01 c0             	add    rax,rax
  8040a8:	48 01 d0             	add    rax,rdx
  8040ab:	48 c1 e0 08          	shl    rax,0x8
  8040af:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040b5:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040b9:	0f b7 c0             	movzx  eax,ax
  8040bc:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8040bf:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8040c6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040c9:	c1 e8 10             	shr    eax,0x10
  8040cc:	83 e0 0f             	and    eax,0xf
  8040cf:	89 c2                	mov    edx,eax
  8040d1:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040d4:	01 d0                	add    eax,edx
  8040d6:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8040d9:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040dc:	89 c1                	mov    ecx,eax
  8040de:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040e1:	48 63 d0             	movsxd rdx,eax
  8040e4:	48 89 d0             	mov    rax,rdx
  8040e7:	48 01 c0             	add    rax,rax
  8040ea:	48 01 d0             	add    rax,rdx
  8040ed:	48 c1 e0 08          	shl    rax,0x8
  8040f1:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040f7:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8040fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8040ff:	eb 31                	jmp    804132 <palloc+0x2f2>
                }
            }
            tblp++;
  804101:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804106:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80410a:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804111:	0f 8e af fd ff ff    	jle    803ec6 <palloc+0x86>
        }
        pgind++;
  804117:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80411c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804120:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804127:	0f 8e 7d fd ff ff    	jle    803eaa <palloc+0x6a>
    }
    return NULL;
  80412d:	b8 00 00 00 00       	mov    eax,0x0
}
  804132:	c9                   	leave  
  804133:	c3                   	ret    

0000000000804134 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804134:	f3 0f 1e fa          	endbr64 
  804138:	55                   	push   rbp
  804139:	48 89 e5             	mov    rbp,rsp
  80413c:	48 83 ec 10          	sub    rsp,0x10
  804140:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804143:	8b 05 e3 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103e3]        # 41452c <cur_proc>
  804149:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80414c:	89 d6                	mov    esi,edx
  80414e:	89 c7                	mov    edi,eax
  804150:	e8 eb fc ff ff       	call   803e40 <palloc>
}
  804155:	c9                   	leave  
  804156:	c3                   	ret    

0000000000804157 <proc_end>:
void proc_end()
{
  804157:	f3 0f 1e fa          	endbr64 
  80415b:	55                   	push   rbp
  80415c:	48 89 e5             	mov    rbp,rsp
  80415f:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804163:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804166:	8b 05 c0 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103c0]        # 41452c <cur_proc>
  80416c:	89 c7                	mov    edi,eax
  80416e:	e8 90 00 00 00       	call   804203 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804173:	8b 05 b3 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103b3]        # 41452c <cur_proc>
  804179:	48 63 d0             	movsxd rdx,eax
  80417c:	48 89 d0             	mov    rax,rdx
  80417f:	48 01 c0             	add    rax,rax
  804182:	48 01 d0             	add    rax,rdx
  804185:	48 c1 e0 08          	shl    rax,0x8
  804189:	48 05 28 85 40 00    	add    rax,0x408528
  80418f:	8b 00                	mov    eax,DWORD PTR [rax]
  804191:	83 f8 ff             	cmp    eax,0xffffffff
  804194:	74 60                	je     8041f6 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  804196:	8b 05 90 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10390]        # 41452c <cur_proc>
  80419c:	48 63 d0             	movsxd rdx,eax
  80419f:	48 89 d0             	mov    rax,rdx
  8041a2:	48 01 c0             	add    rax,rax
  8041a5:	48 01 d0             	add    rax,rdx
  8041a8:	48 c1 e0 08          	shl    rax,0x8
  8041ac:	48 05 28 85 40 00    	add    rax,0x408528
  8041b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8041b4:	89 c2                	mov    edx,eax
  8041b6:	48 89 d0             	mov    rax,rdx
  8041b9:	48 01 c0             	add    rax,rax
  8041bc:	48 01 d0             	add    rax,rdx
  8041bf:	48 c1 e0 08          	shl    rax,0x8
  8041c3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8041c9:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8041cf:	8b 05 57 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10357]        # 41452c <cur_proc>
  8041d5:	48 63 d0             	movsxd rdx,eax
  8041d8:	48 89 d0             	mov    rax,rdx
  8041db:	48 01 c0             	add    rax,rax
  8041de:	48 01 d0             	add    rax,rdx
  8041e1:	48 c1 e0 08          	shl    rax,0x8
  8041e5:	48 05 28 85 40 00    	add    rax,0x408528
  8041eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8041ed:	89 c7                	mov    edi,eax
  8041ef:	e8 3f fb ff ff       	call   803d33 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8041f4:	eb 0a                	jmp    804200 <proc_end+0xa9>
        switch_proc_tss(0);
  8041f6:	bf 00 00 00 00       	mov    edi,0x0
  8041fb:	e8 33 fb ff ff       	call   803d33 <switch_proc_tss>
}
  804200:	90                   	nop
  804201:	c9                   	leave  
  804202:	c3                   	ret    

0000000000804203 <del_proc>:
void del_proc(int pnr)
{
  804203:	f3 0f 1e fa          	endbr64 
  804207:	55                   	push   rbp
  804208:	48 89 e5             	mov    rbp,rsp
  80420b:	48 83 ec 30          	sub    rsp,0x30
  80420f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804212:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804215:	48 63 d0             	movsxd rdx,eax
  804218:	48 89 d0             	mov    rax,rdx
  80421b:	48 01 c0             	add    rax,rax
  80421e:	48 01 d0             	add    rax,rdx
  804221:	48 c1 e0 08          	shl    rax,0x8
  804225:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80422b:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804231:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804234:	48 63 d0             	movsxd rdx,eax
  804237:	48 89 d0             	mov    rax,rdx
  80423a:	48 01 c0             	add    rax,rax
  80423d:	48 01 d0             	add    rax,rdx
  804240:	48 c1 e0 08          	shl    rax,0x8
  804244:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80424a:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804250:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804255:	eb 63                	jmp    8042ba <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  804257:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80425b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80425e:	25 00 f0 ff ff       	and    eax,0xfffff000
  804263:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804267:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80426e:	eb 30                	jmp    8042a0 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804270:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804274:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804277:	83 e0 01             	and    eax,0x1
  80427a:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  80427d:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804281:	74 14                	je     804297 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804283:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804287:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80428a:	25 00 f0 ff ff       	and    eax,0xfffff000
  80428f:	48 89 c7             	mov    rdi,rax
  804292:	e8 96 d4 ff ff       	call   80172d <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804297:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80429c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8042a0:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8042a7:	7e c7                	jle    804270 <del_proc+0x6d>
        }
        vmfree(tp);
  8042a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042ad:	48 89 c7             	mov    rdi,rax
  8042b0:	e8 84 d0 ff ff       	call   801339 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8042b5:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8042ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042c1:	83 e0 01             	and    eax,0x1
  8042c4:	48 85 c0             	test   rax,rax
  8042c7:	75 8e                	jne    804257 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  8042c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042cd:	48 89 c7             	mov    rdi,rax
  8042d0:	e8 64 d0 ff ff       	call   801339 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8042d5:	90                   	nop
  8042d6:	c9                   	leave  
  8042d7:	c3                   	ret    

00000000008042d8 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8042d8:	f3 0f 1e fa          	endbr64 
  8042dc:	55                   	push   rbp
  8042dd:	48 89 e5             	mov    rbp,rsp
  8042e0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8042e3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8042e6:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8042ea:	75 0a                	jne    8042f6 <set_proc_stat+0x1e>
  8042ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042f1:	e9 8c 00 00 00       	jmp    804382 <set_proc_stat+0xaa>
    int i=0;
  8042f6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8042fd:	eb 04                	jmp    804303 <set_proc_stat+0x2b>
  8042ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804303:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804306:	48 63 d0             	movsxd rdx,eax
  804309:	48 89 d0             	mov    rax,rdx
  80430c:	48 01 c0             	add    rax,rax
  80430f:	48 01 d0             	add    rax,rdx
  804312:	48 c1 e0 08          	shl    rax,0x8
  804316:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80431c:	8b 10                	mov    edx,DWORD PTR [rax]
  80431e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804321:	39 c2                	cmp    edx,eax
  804323:	75 da                	jne    8042ff <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  804325:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804329:	75 07                	jne    804332 <set_proc_stat+0x5a>
  80432b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804330:	eb 50                	jmp    804382 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804332:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804335:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804338:	48 63 c8             	movsxd rcx,eax
  80433b:	48 89 c8             	mov    rax,rcx
  80433e:	48 01 c0             	add    rax,rax
  804341:	48 01 c8             	add    rax,rcx
  804344:	48 c1 e0 08          	shl    rax,0x8
  804348:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80434e:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804350:	8b 05 d6 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101d6]        # 41452c <cur_proc>
  804356:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804359:	75 22                	jne    80437d <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  80435b:	8b 05 cb 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101cb]        # 41452c <cur_proc>
  804361:	48 63 d0             	movsxd rdx,eax
  804364:	48 89 d0             	mov    rax,rdx
  804367:	48 01 c0             	add    rax,rax
  80436a:	48 01 d0             	add    rax,rdx
  80436d:	48 c1 e0 08          	shl    rax,0x8
  804371:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804377:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  80437d:	b8 00 00 00 00       	mov    eax,0x0
}
  804382:	5d                   	pop    rbp
  804383:	c3                   	ret    

0000000000804384 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  804384:	f3 0f 1e fa          	endbr64 
  804388:	55                   	push   rbp
  804389:	48 89 e5             	mov    rbp,rsp
  80438c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804390:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804397:	eb 6a                	jmp    804403 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  804399:	8b 05 8d 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1018d]        # 41452c <cur_proc>
  80439f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8043a2:	48 63 ca             	movsxd rcx,edx
  8043a5:	48 63 d0             	movsxd rdx,eax
  8043a8:	48 89 d0             	mov    rax,rdx
  8043ab:	48 01 c0             	add    rax,rax
  8043ae:	48 01 d0             	add    rax,rdx
  8043b1:	48 c1 e0 05          	shl    rax,0x5
  8043b5:	48 01 c8             	add    rax,rcx
  8043b8:	48 83 c0 18          	add    rax,0x18
  8043bc:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8043c3:	00 
  8043c4:	48 85 c0             	test   rax,rax
  8043c7:	75 36                	jne    8043ff <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  8043c9:	8b 05 5d 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1015d]        # 41452c <cur_proc>
  8043cf:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8043d2:	48 63 ca             	movsxd rcx,edx
  8043d5:	48 63 d0             	movsxd rdx,eax
  8043d8:	48 89 d0             	mov    rax,rdx
  8043db:	48 01 c0             	add    rax,rax
  8043de:	48 01 d0             	add    rax,rdx
  8043e1:	48 c1 e0 05          	shl    rax,0x5
  8043e5:	48 01 c8             	add    rax,rcx
  8043e8:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8043ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8043f0:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8043f7:	00 
            return 0;
  8043f8:	b8 00 00 00 00       	mov    eax,0x0
  8043fd:	eb 0f                	jmp    80440e <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8043ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804403:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804407:	7e 90                	jle    804399 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804409:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80440e:	5d                   	pop    rbp
  80440f:	c3                   	ret    

0000000000804410 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804410:	f3 0f 1e fa          	endbr64 
  804414:	55                   	push   rbp
  804415:	48 89 e5             	mov    rbp,rsp
  804418:	48 83 ec 10          	sub    rsp,0x10
  80441c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  80441f:	8b 05 07 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10107]        # 41452c <cur_proc>
  804425:	89 c7                	mov    edi,eax
  804427:	e8 d7 fd ff ff       	call   804203 <del_proc>
    while(1)
        manage_proc();
  80442c:	b8 00 00 00 00       	mov    eax,0x0
  804431:	e8 37 f7 ff ff       	call   803b6d <manage_proc>
  804436:	eb f4                	jmp    80442c <sys_exit+0x1c>

0000000000804438 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804438:	f3 0f 1e fa          	endbr64 
  80443c:	55                   	push   rbp
  80443d:	48 89 e5             	mov    rbp,rsp
  804440:	53                   	push   rbx
  804441:	48 83 ec 48          	sub    rsp,0x48
  804445:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804449:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80444d:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804451:	b8 00 00 00 00       	mov    eax,0x0
  804456:	e8 23 f4 ff ff       	call   80387e <req_proc>
  80445b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  80445e:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804462:	75 0a                	jne    80446e <reg_proc+0x36>
  804464:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804469:	e9 c9 01 00 00       	jmp    804637 <reg_proc+0x1ff>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  80446e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804472:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804475:	52                   	push   rdx
  804476:	6a 00                	push   0x0
  804478:	50                   	push   rax
  804479:	6a 00                	push   0x0
  80447b:	6a 00                	push   0x0
  80447d:	6a 00                	push   0x0
  80447f:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804484:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  80448b:	00 
  80448c:	6a 28                	push   0x28
  80448e:	6a 28                	push   0x28
  804490:	6a 28                	push   0x28
  804492:	6a 28                	push   0x28
  804494:	41 b9 30 00 00 00    	mov    r9d,0x30
  80449a:	41 b8 28 00 00 00    	mov    r8d,0x28
  8044a0:	b9 00 00 00 00       	mov    ecx,0x0
  8044a5:	ba 00 00 00 00       	mov    edx,0x0
  8044aa:	be 00 00 00 00       	mov    esi,0x0
  8044af:	bf 00 00 00 00       	mov    edi,0x0
  8044b4:	e8 be f4 ff ff       	call   803977 <set_proc>
  8044b9:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  8044bd:	b8 00 00 00 00       	mov    eax,0x0
  8044c2:	e8 e3 cd ff ff       	call   8012aa <vmalloc>
  8044c7:	48 89 c1             	mov    rcx,rax
  8044ca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044cd:	48 63 d0             	movsxd rdx,eax
  8044d0:	48 89 d0             	mov    rax,rdx
  8044d3:	48 01 c0             	add    rax,rax
  8044d6:	48 01 d0             	add    rax,rdx
  8044d9:	48 c1 e0 08          	shl    rax,0x8
  8044dd:	48 05 40 85 40 00    	add    rax,0x408540
  8044e3:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  8044e7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044ea:	48 63 d0             	movsxd rdx,eax
  8044ed:	48 89 d0             	mov    rax,rdx
  8044f0:	48 01 c0             	add    rax,rax
  8044f3:	48 01 d0             	add    rax,rdx
  8044f6:	48 c1 e0 08          	shl    rax,0x8
  8044fa:	48 05 40 85 40 00    	add    rax,0x408540
  804500:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  804504:	b8 00 00 00 00       	mov    eax,0x0
  804509:	e8 9c cd ff ff       	call   8012aa <vmalloc>
  80450e:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804511:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804514:	48 63 d0             	movsxd rdx,eax
  804517:	48 89 d0             	mov    rax,rdx
  80451a:	48 01 c0             	add    rax,rax
  80451d:	48 01 d0             	add    rax,rdx
  804520:	48 c1 e0 08          	shl    rax,0x8
  804524:	48 05 40 85 40 00    	add    rax,0x408540
  80452a:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80452e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804532:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804536:	ba 03 00 00 00       	mov    edx,0x3
  80453b:	be 00 00 00 00       	mov    esi,0x0
  804540:	48 89 c7             	mov    rdi,rax
  804543:	e8 27 d3 ff ff       	call   80186f <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804548:	b8 00 00 00 00       	mov    eax,0x0
  80454d:	e8 58 cd ff ff       	call   8012aa <vmalloc>
  804552:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804556:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80455a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80455e:	48 83 c0 18          	add    rax,0x18
  804562:	48 83 ca 07          	or     rdx,0x7
  804566:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804569:	b8 00 00 00 00       	mov    eax,0x0
  80456e:	e8 ea d0 ff ff       	call   80165d <req_a_page>
  804573:	89 c7                	mov    edi,eax
  804575:	e8 91 d2 ff ff       	call   80180b <get_phyaddr>
  80457a:	89 c1                	mov    ecx,eax
  80457c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804580:	48 05 f8 0f 00 00    	add    rax,0xff8
  804586:	ba 06 00 00 00       	mov    edx,0x6
  80458b:	89 ce                	mov    esi,ecx
  80458d:	48 89 c7             	mov    rdi,rax
  804590:	e8 31 d3 ff ff       	call   8018c6 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804595:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804598:	48 63 d0             	movsxd rdx,eax
  80459b:	48 89 d0             	mov    rax,rdx
  80459e:	48 01 c0             	add    rax,rax
  8045a1:	48 01 d0             	add    rax,rdx
  8045a4:	48 c1 e0 08          	shl    rax,0x8
  8045a8:	48 05 40 85 40 00    	add    rax,0x408540
  8045ae:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8045b2:	48 89 c1             	mov    rcx,rax
  8045b5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045b8:	48 63 d0             	movsxd rdx,eax
  8045bb:	48 89 d0             	mov    rax,rdx
  8045be:	48 01 c0             	add    rax,rax
  8045c1:	48 01 d0             	add    rax,rdx
  8045c4:	48 c1 e0 08          	shl    rax,0x8
  8045c8:	48 05 d0 86 40 00    	add    rax,0x4086d0
  8045ce:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  8045d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045d4:	48 63 d0             	movsxd rdx,eax
  8045d7:	48 89 d0             	mov    rax,rdx
  8045da:	48 01 c0             	add    rax,rax
  8045dd:	48 01 d0             	add    rax,rdx
  8045e0:	48 c1 e0 08          	shl    rax,0x8
  8045e4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045ea:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8045f0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045f3:	48 63 d0             	movsxd rdx,eax
  8045f6:	48 89 d0             	mov    rax,rdx
  8045f9:	48 01 c0             	add    rax,rax
  8045fc:	48 01 d0             	add    rax,rdx
  8045ff:	48 c1 e0 08          	shl    rax,0x8
  804603:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80460a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80460e:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804612:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804615:	48 63 d0             	movsxd rdx,eax
  804618:	48 89 d0             	mov    rax,rdx
  80461b:	48 01 c0             	add    rax,rax
  80461e:	48 01 d0             	add    rax,rdx
  804621:	48 c1 e0 08          	shl    rax,0x8
  804625:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80462c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804630:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  804634:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804637:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80463b:	c9                   	leave  
  80463c:	c3                   	ret    

000000000080463d <sys_malloc>:

void * sys_malloc(int size)
{
  80463d:	f3 0f 1e fa          	endbr64 
  804641:	55                   	push   rbp
  804642:	48 89 e5             	mov    rbp,rsp
  804645:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804648:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80464b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804651:	85 c0                	test   eax,eax
  804653:	0f 48 c2             	cmovs  eax,edx
  804656:	c1 f8 0c             	sar    eax,0xc
  804659:	89 c1                	mov    ecx,eax
  80465b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80465e:	99                   	cdq    
  80465f:	c1 ea 14             	shr    edx,0x14
  804662:	01 d0                	add    eax,edx
  804664:	25 ff 0f 00 00       	and    eax,0xfff
  804669:	29 d0                	sub    eax,edx
  80466b:	01 c8                	add    eax,ecx
  80466d:	85 c0                	test   eax,eax
  80466f:	0f 95 c0             	setne  al
  804672:	0f b6 c0             	movzx  eax,al
  804675:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804678:	8b 05 ae fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0feae]        # 41452c <cur_proc>
  80467e:	48 63 d0             	movsxd rdx,eax
  804681:	48 89 d0             	mov    rax,rdx
  804684:	48 01 c0             	add    rax,rax
  804687:	48 01 d0             	add    rax,rdx
  80468a:	48 c1 e0 08          	shl    rax,0x8
  80468e:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804694:	8b 00                	mov    eax,DWORD PTR [rax]
  804696:	48 98                	cdqe   
  804698:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  80469c:	eb 0c                	jmp    8046aa <sys_malloc+0x6d>
        hp=hp->next;
  80469e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046a6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046ae:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046b2:	48 85 c0             	test   rax,rax
  8046b5:	74 16                	je     8046cd <sys_malloc+0x90>
  8046b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046bb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046be:	85 c0                	test   eax,eax
  8046c0:	75 0b                	jne    8046cd <sys_malloc+0x90>
  8046c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046c6:	8b 00                	mov    eax,DWORD PTR [rax]
  8046c8:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8046cb:	7e d1                	jle    80469e <sys_malloc+0x61>
    if(hp->pgn<n)
  8046cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046d1:	8b 00                	mov    eax,DWORD PTR [rax]
  8046d3:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8046d6:	0f 8e 8d 00 00 00    	jle    804769 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8046dc:	8b 05 4a fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe4a]        # 41452c <cur_proc>
  8046e2:	48 63 d0             	movsxd rdx,eax
  8046e5:	48 89 d0             	mov    rax,rdx
  8046e8:	48 01 c0             	add    rax,rax
  8046eb:	48 01 d0             	add    rax,rdx
  8046ee:	48 c1 e0 08          	shl    rax,0x8
  8046f2:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8046f8:	8b 10                	mov    edx,DWORD PTR [rax]
  8046fa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8046fd:	c1 e0 0c             	shl    eax,0xc
  804700:	01 d0                	add    eax,edx
  804702:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804707:	7e 0a                	jle    804713 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804709:	b8 00 00 00 00       	mov    eax,0x0
  80470e:	e9 cf 00 00 00       	jmp    8047e2 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804713:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804717:	8b 10                	mov    edx,DWORD PTR [rax]
  804719:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80471c:	29 d0                	sub    eax,edx
  80471e:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804721:	8b 05 05 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe05]        # 41452c <cur_proc>
  804727:	48 63 d0             	movsxd rdx,eax
  80472a:	48 89 d0             	mov    rax,rdx
  80472d:	48 01 c0             	add    rax,rax
  804730:	48 01 d0             	add    rax,rdx
  804733:	48 c1 e0 08          	shl    rax,0x8
  804737:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80473d:	8b 00                	mov    eax,DWORD PTR [rax]
  80473f:	48 98                	cdqe   
  804741:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804745:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80474c:	eb 13                	jmp    804761 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  80474e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804752:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804755:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  80475c:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80475d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804761:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804764:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804767:	7c e5                	jl     80474e <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804769:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80476d:	8b 00                	mov    eax,DWORD PTR [rax]
  80476f:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804772:	7d 59                	jge    8047cd <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804774:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804778:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  80477c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80477f:	83 c0 01             	add    eax,0x1
  804782:	c1 e0 0c             	shl    eax,0xc
  804785:	48 98                	cdqe   
  804787:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  80478b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80478f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804793:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804797:	8b 00                	mov    eax,DWORD PTR [rax]
  804799:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  80479c:	8d 50 ff             	lea    edx,[rax-0x1]
  80479f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047a3:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8047a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047a9:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8047ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047b1:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8047b5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047b9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8047bd:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  8047c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047c5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8047c9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  8047cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047d1:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  8047d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047dc:	48 05 00 10 00 00    	add    rax,0x1000
}
  8047e2:	5d                   	pop    rbp
  8047e3:	c3                   	ret    

00000000008047e4 <sys_free>:
int sys_free(int ptr)
{
  8047e4:	f3 0f 1e fa          	endbr64 
  8047e8:	55                   	push   rbp
  8047e9:	48 89 e5             	mov    rbp,rsp
  8047ec:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8047ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047f2:	2d 00 10 00 00       	sub    eax,0x1000
  8047f7:	48 98                	cdqe   
  8047f9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8047fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804801:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804808:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80480c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804810:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804814:	eb 2e                	jmp    804844 <sys_free+0x60>
    {
        if(p->alloc==0)
  804816:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80481a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80481d:	85 c0                	test   eax,eax
  80481f:	75 2c                	jne    80484d <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804821:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804825:	8b 10                	mov    edx,DWORD PTR [rax]
  804827:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80482b:	8b 00                	mov    eax,DWORD PTR [rax]
  80482d:	83 c0 01             	add    eax,0x1
  804830:	01 c2                	add    edx,eax
  804832:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804836:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804838:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804840:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804844:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804849:	75 cb                	jne    804816 <sys_free+0x32>
  80484b:	eb 01                	jmp    80484e <sys_free+0x6a>
            break;
  80484d:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  80484e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804852:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804856:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80485a:	eb 2e                	jmp    80488a <sys_free+0xa6>
    {
        if(p->alloc==0)
  80485c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804860:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804863:	85 c0                	test   eax,eax
  804865:	75 2c                	jne    804893 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804867:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80486b:	8b 10                	mov    edx,DWORD PTR [rax]
  80486d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804871:	8b 00                	mov    eax,DWORD PTR [rax]
  804873:	83 c0 01             	add    eax,0x1
  804876:	01 c2                	add    edx,eax
  804878:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80487c:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  80487e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804882:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804886:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80488a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80488f:	75 cb                	jne    80485c <sys_free+0x78>
  804891:	eb 01                	jmp    804894 <sys_free+0xb0>
            break;
  804893:	90                   	nop
    }
    //合并完成
    return 0;
  804894:	b8 00 00 00 00       	mov    eax,0x0
}
  804899:	5d                   	pop    rbp
  80489a:	c3                   	ret    

000000000080489b <switch_to>:

void switch_to(struct process *from, struct process *to) {
  80489b:	f3 0f 1e fa          	endbr64 
  80489f:	55                   	push   rbp
  8048a0:	48 89 e5             	mov    rbp,rsp
  8048a3:	53                   	push   rbx
  8048a4:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8048a8:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8048ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048b0:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  8048b6:	48 c1 f8 08          	sar    rax,0x8
  8048ba:	48 89 c2             	mov    rdx,rax
  8048bd:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  8048c4:	aa aa aa 
  8048c7:	48 0f af c2          	imul   rax,rdx
  8048cb:	89 05 5b fc c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0fc5b],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  8048d1:	8b 05 55 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc55]        # 41452c <cur_proc>
  8048d7:	48 63 d0             	movsxd rdx,eax
  8048da:	48 89 d0             	mov    rax,rdx
  8048dd:	48 01 c0             	add    rax,rax
  8048e0:	48 01 d0             	add    rax,rdx
  8048e3:	48 c1 e0 08          	shl    rax,0x8
  8048e7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8048ed:	48 89 05 ac fb c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fbac],rax        # 4144a0 <current>
    asm volatile("mov %0,%%rax\n"
  8048f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048f8:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  8048ff:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804902:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804906:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80490a:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80490e:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804916:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80491a:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80491e:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804922:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804926:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80492a:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804931:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 80495c <done>
  804938:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  80493f:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804946:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  80494c:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804953:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  80495a:	eb 08                	jmp    804964 <__switch_to>

000000000080495c <done>:
  80495c:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  80495d:	90                   	nop
  80495e:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804962:	c9                   	leave  
  804963:	c3                   	ret    

0000000000804964 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804964:	f3 0f 1e fa          	endbr64 
  804968:	55                   	push   rbp
  804969:	48 89 e5             	mov    rbp,rsp
  80496c:	53                   	push   rbx
  80496d:	48 83 ec 18          	sub    rsp,0x18
  804971:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804975:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804979:	48 8b 05 e0 76 00 00 	mov    rax,QWORD PTR [rip+0x76e0]        # 80c060 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804980:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804984:	48 8b 05 d5 76 00 00 	mov    rax,QWORD PTR [rip+0x76d5]        # 80c060 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80498b:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80498f:	48 8b 05 ca 76 00 00 	mov    rax,QWORD PTR [rip+0x76ca]        # 80c060 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804996:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80499a:	48 8b 05 bf 76 00 00 	mov    rax,QWORD PTR [rip+0x76bf]        # 80c060 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049a1:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049a5:	48 8b 05 b4 76 00 00 	mov    rax,QWORD PTR [rip+0x76b4]        # 80c060 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049ac:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8049b0:	48 8b 05 a9 76 00 00 	mov    rax,QWORD PTR [rip+0x76a9]        # 80c060 <tss>
  8049b7:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8049bb:	48 8b 05 9e 76 00 00 	mov    rax,QWORD PTR [rip+0x769e]        # 80c060 <tss>
  8049c2:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  8049c6:	48 8b 05 93 76 00 00 	mov    rax,QWORD PTR [rip+0x7693]        # 80c060 <tss>
  8049cd:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  8049d1:	48 8b 05 88 76 00 00 	mov    rax,QWORD PTR [rip+0x7688]        # 80c060 <tss>
  8049d8:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  8049dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8049e0:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  8049e7:	41 52                	push   r10
  8049e9:	41 51                	push   r9
  8049eb:	41 50                	push   r8
  8049ed:	57                   	push   rdi
  8049ee:	49 89 d9             	mov    r9,rbx
  8049f1:	4d 89 d8             	mov    r8,r11
  8049f4:	48 89 c7             	mov    rdi,rax
  8049f7:	e8 34 00 00 00       	call   804a30 <set_tss>
  8049fc:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804a00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a04:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804a08:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a0c:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804a10:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804a16:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804a1c:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804a22:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  804a28:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804a29:	90                   	nop
  804a2a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804a2e:	c9                   	leave  
  804a2f:	c3                   	ret    

0000000000804a30 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804a30:	f3 0f 1e fa          	endbr64 
  804a34:	55                   	push   rbp
  804a35:	48 89 e5             	mov    rbp,rsp
  804a38:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804a3c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804a40:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804a44:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804a48:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804a4c:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804a50:	48 8b 05 09 76 00 00 	mov    rax,QWORD PTR [rip+0x7609]        # 80c060 <tss>
  804a57:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804a5b:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804a5f:	48 8b 05 fa 75 00 00 	mov    rax,QWORD PTR [rip+0x75fa]        # 80c060 <tss>
  804a66:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804a6a:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804a6e:	48 8b 05 eb 75 00 00 	mov    rax,QWORD PTR [rip+0x75eb]        # 80c060 <tss>
  804a75:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a79:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804a7d:	48 8b 05 dc 75 00 00 	mov    rax,QWORD PTR [rip+0x75dc]        # 80c060 <tss>
  804a84:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804a88:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804a8c:	48 8b 05 cd 75 00 00 	mov    rax,QWORD PTR [rip+0x75cd]        # 80c060 <tss>
  804a93:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804a97:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804a9b:	48 8b 05 be 75 00 00 	mov    rax,QWORD PTR [rip+0x75be]        # 80c060 <tss>
  804aa2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804aa6:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804aaa:	48 8b 05 af 75 00 00 	mov    rax,QWORD PTR [rip+0x75af]        # 80c060 <tss>
  804ab1:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804ab5:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804ab9:	48 8b 05 a0 75 00 00 	mov    rax,QWORD PTR [rip+0x75a0]        # 80c060 <tss>
  804ac0:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804ac4:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804ac8:	48 8b 05 91 75 00 00 	mov    rax,QWORD PTR [rip+0x7591]        # 80c060 <tss>
  804acf:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804ad3:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804ad7:	48 8b 05 82 75 00 00 	mov    rax,QWORD PTR [rip+0x7582]        # 80c060 <tss>
  804ade:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804ae2:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804ae6:	90                   	nop
  804ae7:	5d                   	pop    rbp
  804ae8:	c3                   	ret    

0000000000804ae9 <fork_child_ret>:

int fork_child_ret(){
  804ae9:	f3 0f 1e fa          	endbr64 
  804aed:	55                   	push   rbp
  804aee:	48 89 e5             	mov    rbp,rsp
    return 0;
  804af1:	b8 00 00 00 00       	mov    eax,0x0

}
  804af6:	5d                   	pop    rbp
  804af7:	c3                   	ret    

0000000000804af8 <sys_fork>:

int sys_fork(void){
  804af8:	f3 0f 1e fa          	endbr64 
  804afc:	55                   	push   rbp
  804afd:	48 89 e5             	mov    rbp,rsp
  804b00:	53                   	push   rbx
  804b01:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804b05:	b8 00 00 00 00       	mov    eax,0x0
  804b0a:	e8 6f ed ff ff       	call   80387e <req_proc>
  804b0f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804b12:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804b16:	75 0a                	jne    804b22 <sys_fork+0x2a>
  804b18:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b1d:	e9 17 08 00 00       	jmp    805339 <sys_fork+0x841>
    task[pid].regs=current->regs;
  804b22:	48 8b 05 77 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f977]        # 4144a0 <current>
  804b29:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b2c:	48 63 ca             	movsxd rcx,edx
  804b2f:	48 89 ca             	mov    rdx,rcx
  804b32:	48 01 d2             	add    rdx,rdx
  804b35:	48 01 ca             	add    rdx,rcx
  804b38:	48 c1 e2 08          	shl    rdx,0x8
  804b3c:	48 81 c2 d0 86 40 00 	add    rdx,0x4086d0
  804b43:	48 8b 88 30 02 00 00 	mov    rcx,QWORD PTR [rax+0x230]
  804b4a:	48 8b 98 38 02 00 00 	mov    rbx,QWORD PTR [rax+0x238]
  804b51:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  804b54:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  804b58:	48 8b 88 40 02 00 00 	mov    rcx,QWORD PTR [rax+0x240]
  804b5f:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
  804b66:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  804b6a:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  804b6e:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
  804b75:	48 8b 98 58 02 00 00 	mov    rbx,QWORD PTR [rax+0x258]
  804b7c:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  804b80:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  804b84:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
  804b8b:	48 8b 98 68 02 00 00 	mov    rbx,QWORD PTR [rax+0x268]
  804b92:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  804b96:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  804b9a:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
  804ba1:	48 8b 98 78 02 00 00 	mov    rbx,QWORD PTR [rax+0x278]
  804ba8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  804bac:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  804bb0:	48 8b 88 80 02 00 00 	mov    rcx,QWORD PTR [rax+0x280]
  804bb7:	48 8b 98 88 02 00 00 	mov    rbx,QWORD PTR [rax+0x288]
  804bbe:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  804bc2:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  804bc6:	48 8b 88 90 02 00 00 	mov    rcx,QWORD PTR [rax+0x290]
  804bcd:	48 8b 98 98 02 00 00 	mov    rbx,QWORD PTR [rax+0x298]
  804bd4:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  804bd8:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  804bdc:	48 8b 88 a0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a0]
  804be3:	48 8b 98 a8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2a8]
  804bea:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  804bee:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  804bf2:	48 8b 88 b0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b0]
  804bf9:	48 8b 98 b8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2b8]
  804c00:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  804c07:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  804c0e:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
  804c15:	48 8b 98 c8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2c8]
  804c1c:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  804c23:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  804c2a:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
  804c31:	48 8b 98 d8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2d8]
  804c38:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  804c3f:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  804c46:	48 8b 88 e0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e0]
  804c4d:	48 8b 98 e8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2e8]
  804c54:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  804c5b:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  804c62:	48 8b 88 f0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f0]
  804c69:	48 8b 98 f8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2f8]
  804c70:	48 89 8a c0 00 00 00 	mov    QWORD PTR [rdx+0xc0],rcx
  804c77:	48 89 9a c8 00 00 00 	mov    QWORD PTR [rdx+0xc8],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804c7e:	b9 e1 bf 80 00       	mov    ecx,0x80bfe1
  804c83:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c86:	48 63 d0             	movsxd rdx,eax
  804c89:	48 89 d0             	mov    rax,rdx
  804c8c:	48 01 c0             	add    rax,rax
  804c8f:	48 01 d0             	add    rax,rdx
  804c92:	48 c1 e0 08          	shl    rax,0x8
  804c96:	48 05 d8 86 40 00    	add    rax,0x4086d8
  804c9c:	48 89 08             	mov    QWORD PTR [rax],rcx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804c9f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ca2:	48 63 d0             	movsxd rdx,eax
  804ca5:	48 89 d0             	mov    rax,rdx
  804ca8:	48 01 c0             	add    rax,rax
  804cab:	48 01 d0             	add    rax,rdx
  804cae:	48 c1 e0 08          	shl    rax,0x8
  804cb2:	48 05 08 87 40 00    	add    rax,0x408708
  804cb8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804cbb:	48 2d a8 00 00 00    	sub    rax,0xa8
  804cc1:	48 89 c1             	mov    rcx,rax
  804cc4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cc7:	48 63 d0             	movsxd rdx,eax
  804cca:	48 89 d0             	mov    rax,rdx
  804ccd:	48 01 c0             	add    rax,rax
  804cd0:	48 01 d0             	add    rax,rdx
  804cd3:	48 c1 e0 08          	shl    rax,0x8
  804cd7:	48 05 08 87 40 00    	add    rax,0x408708
  804cdd:	48 89 08             	mov    QWORD PTR [rax],rcx
    stack_store_regs *r=task[pid].regs.rsp;
  804ce0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ce3:	48 63 d0             	movsxd rdx,eax
  804ce6:	48 89 d0             	mov    rax,rdx
  804ce9:	48 01 c0             	add    rax,rax
  804cec:	48 01 d0             	add    rax,rdx
  804cef:	48 c1 e0 08          	shl    rax,0x8
  804cf3:	48 05 08 87 40 00    	add    rax,0x408708
  804cf9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804cfc:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804d00:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d04:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804d0b:	00 
    r->ds=DS_USER;
  804d0c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d10:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804d17:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d1b:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804d22:	28 00 00 00 
    r->es=DS_USER;
  804d26:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d2a:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804d31:	00 
    r->rax=task[pid].regs.rax;
  804d32:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d35:	48 63 d0             	movsxd rdx,eax
  804d38:	48 89 d0             	mov    rax,rdx
  804d3b:	48 01 c0             	add    rax,rax
  804d3e:	48 01 d0             	add    rax,rdx
  804d41:	48 c1 e0 08          	shl    rax,0x8
  804d45:	48 05 e8 86 40 00    	add    rax,0x4086e8
  804d4b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d4e:	48 89 c2             	mov    rdx,rax
  804d51:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d55:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804d59:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d5c:	48 63 d0             	movsxd rdx,eax
  804d5f:	48 89 d0             	mov    rax,rdx
  804d62:	48 01 c0             	add    rax,rax
  804d65:	48 01 d0             	add    rax,rdx
  804d68:	48 c1 e0 08          	shl    rax,0x8
  804d6c:	48 05 00 87 40 00    	add    rax,0x408700
  804d72:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d75:	48 89 c2             	mov    rdx,rax
  804d78:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d7c:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804d80:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d83:	48 63 d0             	movsxd rdx,eax
  804d86:	48 89 d0             	mov    rax,rdx
  804d89:	48 01 c0             	add    rax,rax
  804d8c:	48 01 d0             	add    rax,rdx
  804d8f:	48 c1 e0 08          	shl    rax,0x8
  804d93:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804d99:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d9c:	48 89 c2             	mov    rdx,rax
  804d9f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804da3:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804da7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804daa:	48 63 d0             	movsxd rdx,eax
  804dad:	48 89 d0             	mov    rax,rdx
  804db0:	48 01 c0             	add    rax,rax
  804db3:	48 01 d0             	add    rax,rdx
  804db6:	48 c1 e0 08          	shl    rax,0x8
  804dba:	48 05 f8 86 40 00    	add    rax,0x4086f8
  804dc0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dc3:	48 89 c2             	mov    rdx,rax
  804dc6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dca:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804dce:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804dd1:	48 63 d0             	movsxd rdx,eax
  804dd4:	48 89 d0             	mov    rax,rdx
  804dd7:	48 01 c0             	add    rax,rax
  804dda:	48 01 d0             	add    rax,rdx
  804ddd:	48 c1 e0 08          	shl    rax,0x8
  804de1:	48 05 18 87 40 00    	add    rax,0x408718
  804de7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dea:	48 89 c2             	mov    rdx,rax
  804ded:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804df1:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804df5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804df8:	48 63 d0             	movsxd rdx,eax
  804dfb:	48 89 d0             	mov    rax,rdx
  804dfe:	48 01 c0             	add    rax,rax
  804e01:	48 01 d0             	add    rax,rdx
  804e04:	48 c1 e0 08          	shl    rax,0x8
  804e08:	48 05 20 87 40 00    	add    rax,0x408720
  804e0e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e11:	48 89 c2             	mov    rdx,rax
  804e14:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e18:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804e1c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e1f:	48 63 d0             	movsxd rdx,eax
  804e22:	48 89 d0             	mov    rax,rdx
  804e25:	48 01 c0             	add    rax,rax
  804e28:	48 01 d0             	add    rax,rdx
  804e2b:	48 c1 e0 08          	shl    rax,0x8
  804e2f:	48 05 58 87 40 00    	add    rax,0x408758
  804e35:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e38:	48 89 c2             	mov    rdx,rax
  804e3b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e3f:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804e43:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e46:	48 63 d0             	movsxd rdx,eax
  804e49:	48 89 d0             	mov    rax,rdx
  804e4c:	48 01 c0             	add    rax,rax
  804e4f:	48 01 d0             	add    rax,rdx
  804e52:	48 c1 e0 08          	shl    rax,0x8
  804e56:	48 05 60 87 40 00    	add    rax,0x408760
  804e5c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e5f:	48 89 c2             	mov    rdx,rax
  804e62:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e66:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804e6a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e6d:	48 63 d0             	movsxd rdx,eax
  804e70:	48 89 d0             	mov    rax,rdx
  804e73:	48 01 c0             	add    rax,rax
  804e76:	48 01 d0             	add    rax,rdx
  804e79:	48 c1 e0 08          	shl    rax,0x8
  804e7d:	48 05 68 87 40 00    	add    rax,0x408768
  804e83:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e86:	48 89 c2             	mov    rdx,rax
  804e89:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e8d:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804e91:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e94:	48 63 d0             	movsxd rdx,eax
  804e97:	48 89 d0             	mov    rax,rdx
  804e9a:	48 01 c0             	add    rax,rax
  804e9d:	48 01 d0             	add    rax,rdx
  804ea0:	48 c1 e0 08          	shl    rax,0x8
  804ea4:	48 05 70 87 40 00    	add    rax,0x408770
  804eaa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ead:	48 89 c2             	mov    rdx,rax
  804eb0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804eb4:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804eb8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ebb:	48 63 d0             	movsxd rdx,eax
  804ebe:	48 89 d0             	mov    rax,rdx
  804ec1:	48 01 c0             	add    rax,rax
  804ec4:	48 01 d0             	add    rax,rdx
  804ec7:	48 c1 e0 08          	shl    rax,0x8
  804ecb:	48 05 78 87 40 00    	add    rax,0x408778
  804ed1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ed4:	48 89 c2             	mov    rdx,rax
  804ed7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804edb:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804edf:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ee2:	48 63 d0             	movsxd rdx,eax
  804ee5:	48 89 d0             	mov    rax,rdx
  804ee8:	48 01 c0             	add    rax,rax
  804eeb:	48 01 d0             	add    rax,rdx
  804eee:	48 c1 e0 08          	shl    rax,0x8
  804ef2:	48 05 80 87 40 00    	add    rax,0x408780
  804ef8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804efb:	48 89 c2             	mov    rdx,rax
  804efe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f02:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804f06:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f09:	48 63 d0             	movsxd rdx,eax
  804f0c:	48 89 d0             	mov    rax,rdx
  804f0f:	48 01 c0             	add    rax,rax
  804f12:	48 01 d0             	add    rax,rdx
  804f15:	48 c1 e0 08          	shl    rax,0x8
  804f19:	48 05 88 87 40 00    	add    rax,0x408788
  804f1f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f22:	48 89 c2             	mov    rdx,rax
  804f25:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f29:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804f2d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f30:	48 63 d0             	movsxd rdx,eax
  804f33:	48 89 d0             	mov    rax,rdx
  804f36:	48 01 c0             	add    rax,rax
  804f39:	48 01 d0             	add    rax,rdx
  804f3c:	48 c1 e0 08          	shl    rax,0x8
  804f40:	48 05 90 87 40 00    	add    rax,0x408790
  804f46:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f49:	48 89 c2             	mov    rdx,rax
  804f4c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f50:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804f54:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f58:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804f5f:	48 8b 05 3a f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f53a]        # 4144a0 <current>
  804f66:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f69:	48 63 ca             	movsxd rcx,edx
  804f6c:	48 89 ca             	mov    rdx,rcx
  804f6f:	48 01 d2             	add    rdx,rdx
  804f72:	48 01 ca             	add    rdx,rcx
  804f75:	48 c1 e2 08          	shl    rdx,0x8
  804f79:	48 81 c2 60 86 40 00 	add    rdx,0x408660
  804f80:	48 8b 88 c4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1c4]
  804f87:	48 8b 98 cc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1cc]
  804f8e:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804f92:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804f96:	48 8b 88 d4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d4]
  804f9d:	48 8b 98 dc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1dc]
  804fa4:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804fa8:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804fac:	48 8b 88 e4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e4]
  804fb3:	48 8b 98 ec 01 00 00 	mov    rbx,QWORD PTR [rax+0x1ec]
  804fba:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804fbe:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804fc2:	48 8b 88 f4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f4]
  804fc9:	48 8b 98 fc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1fc]
  804fd0:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804fd4:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804fd8:	48 8b 88 04 02 00 00 	mov    rcx,QWORD PTR [rax+0x204]
  804fdf:	48 8b 98 0c 02 00 00 	mov    rbx,QWORD PTR [rax+0x20c]
  804fe6:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804fea:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804fee:	48 8b 88 14 02 00 00 	mov    rcx,QWORD PTR [rax+0x214]
  804ff5:	48 8b 98 1c 02 00 00 	mov    rbx,QWORD PTR [rax+0x21c]
  804ffc:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  805000:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  805004:	48 8b 88 24 02 00 00 	mov    rcx,QWORD PTR [rax+0x224]
  80500b:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  80500f:	8b 80 2c 02 00 00    	mov    eax,DWORD PTR [rax+0x22c]
  805015:	89 42 6c             	mov    DWORD PTR [rdx+0x6c],eax
    task[pid].stat=READY;
  805018:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80501b:	48 63 d0             	movsxd rdx,eax
  80501e:	48 89 d0             	mov    rax,rdx
  805021:	48 01 c0             	add    rax,rax
  805024:	48 01 d0             	add    rax,rdx
  805027:	48 c1 e0 08          	shl    rax,0x8
  80502b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  805031:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  805037:	8b 05 ef f4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f4ef]        # 41452c <cur_proc>
  80503d:	89 c1                	mov    ecx,eax
  80503f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805042:	48 63 d0             	movsxd rdx,eax
  805045:	48 89 d0             	mov    rax,rdx
  805048:	48 01 c0             	add    rax,rax
  80504b:	48 01 d0             	add    rax,rdx
  80504e:	48 c1 e0 08          	shl    rax,0x8
  805052:	48 05 28 85 40 00    	add    rax,0x408528
  805058:	89 08                	mov    DWORD PTR [rax],ecx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  80505a:	48 8b 05 3f f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f43f]        # 4144a0 <current>
  805061:	48 8d 88 c4 00 00 00 	lea    rcx,[rax+0xc4]
  805068:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80506b:	48 63 d0             	movsxd rdx,eax
  80506e:	48 89 d0             	mov    rax,rdx
  805071:	48 01 c0             	add    rax,rax
  805074:	48 01 d0             	add    rax,rdx
  805077:	48 c1 e0 08          	shl    rax,0x8
  80507b:	48 05 c0 00 00 00    	add    rax,0xc0
  805081:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805087:	48 83 c0 04          	add    rax,0x4
  80508b:	ba 00 01 00 00       	mov    edx,0x100
  805090:	48 89 ce             	mov    rsi,rcx
  805093:	48 89 c7             	mov    rdi,rax
  805096:	e8 a6 65 00 00       	call   80b641 <memcpy>
    task[pid].utime=0;
  80509b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80509e:	48 63 d0             	movsxd rdx,eax
  8050a1:	48 89 d0             	mov    rax,rdx
  8050a4:	48 01 c0             	add    rax,rax
  8050a7:	48 01 d0             	add    rax,rdx
  8050aa:	48 c1 e0 08          	shl    rax,0x8
  8050ae:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8050b4:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  8050ba:	48 8b 0d df f3 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f3df]        # 4144a0 <current>
  8050c1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050c4:	48 63 d0             	movsxd rdx,eax
  8050c7:	48 89 d0             	mov    rax,rdx
  8050ca:	48 01 c0             	add    rax,rax
  8050cd:	48 01 d0             	add    rax,rdx
  8050d0:	48 c1 e0 08          	shl    rax,0x8
  8050d4:	48 8d b0 b0 84 40 00 	lea    rsi,[rax+0x4084b0]
  8050db:	48 8b 41 14          	mov    rax,QWORD PTR [rcx+0x14]
  8050df:	48 8b 51 1c          	mov    rdx,QWORD PTR [rcx+0x1c]
  8050e3:	48 89 46 04          	mov    QWORD PTR [rsi+0x4],rax
  8050e7:	48 89 56 0c          	mov    QWORD PTR [rsi+0xc],rdx
  8050eb:	48 8b 41 24          	mov    rax,QWORD PTR [rcx+0x24]
  8050ef:	48 8b 51 2c          	mov    rdx,QWORD PTR [rcx+0x2c]
  8050f3:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
  8050f7:	48 89 56 1c          	mov    QWORD PTR [rsi+0x1c],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  8050fb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050fe:	48 63 d0             	movsxd rdx,eax
  805101:	48 89 d0             	mov    rax,rdx
  805104:	48 01 c0             	add    rax,rax
  805107:	48 01 d0             	add    rax,rdx
  80510a:	48 c1 e0 08          	shl    rax,0x8
  80510e:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  805115:	48 8b 05 84 f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f384]        # 4144a0 <current>
  80511c:	48 89 d6             	mov    rsi,rdx
  80511f:	48 89 c7             	mov    rdi,rax
  805122:	e8 18 02 00 00       	call   80533f <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805127:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80512a:	48 63 d0             	movsxd rdx,eax
  80512d:	48 89 d0             	mov    rax,rdx
  805130:	48 01 c0             	add    rax,rax
  805133:	48 01 d0             	add    rax,rdx
  805136:	48 c1 e0 08          	shl    rax,0x8
  80513a:	48 05 c0 84 40 00    	add    rax,0x4084c0
  805140:	8b 00                	mov    eax,DWORD PTR [rax]
  805142:	2d 00 10 00 00       	sub    eax,0x1000
  805147:	48 98                	cdqe   
  805149:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  80514d:	eb 63                	jmp    8051b2 <sys_fork+0x6ba>
        addr_t new_stkpg=vmalloc();
  80514f:	b8 00 00 00 00       	mov    eax,0x0
  805154:	e8 51 c1 ff ff       	call   8012aa <vmalloc>
  805159:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  80515d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805161:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805165:	ba 00 10 00 00       	mov    edx,0x1000
  80516a:	48 89 ce             	mov    rsi,rcx
  80516d:	48 89 c7             	mov    rdi,rax
  805170:	e8 cc 64 00 00       	call   80b641 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805175:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805178:	48 63 d0             	movsxd rdx,eax
  80517b:	48 89 d0             	mov    rax,rdx
  80517e:	48 01 c0             	add    rax,rax
  805181:	48 01 d0             	add    rax,rdx
  805184:	48 c1 e0 08          	shl    rax,0x8
  805188:	48 05 40 85 40 00    	add    rax,0x408540
  80518e:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805192:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805196:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80519a:	48 89 d1             	mov    rcx,rdx
  80519d:	ba 07 00 00 00       	mov    edx,0x7
  8051a2:	48 89 c7             	mov    rdi,rax
  8051a5:	e8 b0 be ff ff       	call   80105a <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8051aa:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  8051b1:	00 
  8051b2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051b5:	48 63 d0             	movsxd rdx,eax
  8051b8:	48 89 d0             	mov    rax,rdx
  8051bb:	48 01 c0             	add    rax,rax
  8051be:	48 01 d0             	add    rax,rdx
  8051c1:	48 c1 e0 08          	shl    rax,0x8
  8051c5:	48 05 bc 84 40 00    	add    rax,0x4084bc
  8051cb:	8b 00                	mov    eax,DWORD PTR [rax]
  8051cd:	48 98                	cdqe   
  8051cf:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8051d3:	0f 83 76 ff ff ff    	jae    80514f <sys_fork+0x657>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  8051d9:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  8051e0:	00 
    int f=1;
  8051e1:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8051e8:	e9 89 00 00 00       	jmp    805276 <sys_fork+0x77e>
        addr_t new_stkpg=vmalloc();
  8051ed:	b8 00 00 00 00       	mov    eax,0x0
  8051f2:	e8 b3 c0 ff ff       	call   8012aa <vmalloc>
  8051f7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8051fb:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8051ff:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805203:	ba 00 10 00 00       	mov    edx,0x1000
  805208:	48 89 ce             	mov    rsi,rcx
  80520b:	48 89 c7             	mov    rdi,rax
  80520e:	e8 2e 64 00 00       	call   80b641 <memcpy>
        if(f){
  805213:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805217:	74 20                	je     805239 <sys_fork+0x741>
            f=0;
  805219:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805220:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805224:	48 05 c8 0f 00 00    	add    rax,0xfc8
  80522a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  80522e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805232:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805239:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80523c:	48 63 d0             	movsxd rdx,eax
  80523f:	48 89 d0             	mov    rax,rdx
  805242:	48 01 c0             	add    rax,rax
  805245:	48 01 d0             	add    rax,rdx
  805248:	48 c1 e0 08          	shl    rax,0x8
  80524c:	48 05 40 85 40 00    	add    rax,0x408540
  805252:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805256:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80525a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80525e:	48 89 d1             	mov    rcx,rdx
  805261:	ba 07 00 00 00       	mov    edx,0x7
  805266:	48 89 c7             	mov    rdi,rax
  805269:	e8 ec bd ff ff       	call   80105a <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  80526e:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805275:	00 
  805276:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  80527d:	00 
  80527e:	0f 87 69 ff ff ff    	ja     8051ed <sys_fork+0x6f5>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805284:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805287:	48 63 d0             	movsxd rdx,eax
  80528a:	48 89 d0             	mov    rax,rdx
  80528d:	48 01 c0             	add    rax,rax
  805290:	48 01 d0             	add    rax,rdx
  805293:	48 c1 e0 08          	shl    rax,0x8
  805297:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80529d:	8b 00                	mov    eax,DWORD PTR [rax]
  80529f:	2d 00 10 00 00       	sub    eax,0x1000
  8052a4:	48 98                	cdqe   
  8052a6:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8052aa:	eb 63                	jmp    80530f <sys_fork+0x817>
        addr_t new_hppg=vmalloc();
  8052ac:	b8 00 00 00 00       	mov    eax,0x0
  8052b1:	e8 f4 bf ff ff       	call   8012aa <vmalloc>
  8052b6:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8052ba:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8052be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052c2:	ba 00 10 00 00       	mov    edx,0x1000
  8052c7:	48 89 ce             	mov    rsi,rcx
  8052ca:	48 89 c7             	mov    rdi,rax
  8052cd:	e8 6f 63 00 00       	call   80b641 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8052d2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052d5:	48 63 d0             	movsxd rdx,eax
  8052d8:	48 89 d0             	mov    rax,rdx
  8052db:	48 01 c0             	add    rax,rax
  8052de:	48 01 d0             	add    rax,rdx
  8052e1:	48 c1 e0 08          	shl    rax,0x8
  8052e5:	48 05 40 85 40 00    	add    rax,0x408540
  8052eb:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  8052ef:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  8052f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052f7:	48 89 d1             	mov    rcx,rdx
  8052fa:	ba 07 00 00 00       	mov    edx,0x7
  8052ff:	48 89 c7             	mov    rdi,rax
  805302:	e8 53 bd ff ff       	call   80105a <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805307:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  80530e:	00 
  80530f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805312:	48 63 d0             	movsxd rdx,eax
  805315:	48 89 d0             	mov    rax,rdx
  805318:	48 01 c0             	add    rax,rax
  80531b:	48 01 d0             	add    rax,rdx
  80531e:	48 c1 e0 08          	shl    rax,0x8
  805322:	48 05 b4 84 40 00    	add    rax,0x4084b4
  805328:	8b 00                	mov    eax,DWORD PTR [rax]
  80532a:	48 98                	cdqe   
  80532c:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805330:	0f 83 76 ff ff ff    	jae    8052ac <sys_fork+0x7b4>
    }
    //父进程运行到这里
    return pid;
  805336:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805339:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80533d:	c9                   	leave  
  80533e:	c3                   	ret    

000000000080533f <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  80533f:	f3 0f 1e fa          	endbr64 
  805343:	55                   	push   rbp
  805344:	48 89 e5             	mov    rbp,rsp
  805347:	48 83 ec 60          	sub    rsp,0x60
  80534b:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80534f:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805353:	b8 00 00 00 00       	mov    eax,0x0
  805358:	e8 4d bf ff ff       	call   8012aa <vmalloc>
  80535d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805361:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805365:	48 8b 80 30 02 00 00 	mov    rax,QWORD PTR [rax+0x230]
  80536c:	48 89 c1             	mov    rcx,rax
  80536f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805373:	ba 00 10 00 00       	mov    edx,0x1000
  805378:	48 89 ce             	mov    rsi,rcx
  80537b:	48 89 c7             	mov    rdi,rax
  80537e:	e8 be 62 00 00       	call   80b641 <memcpy>
    to->regs.cr3=pml4p;
  805383:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805387:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80538b:	48 89 90 30 02 00 00 	mov    QWORD PTR [rax+0x230],rdx
    to->pml4=pml4p;
  805392:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805396:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80539a:	48 89 90 ac 00 00 00 	mov    QWORD PTR [rax+0xac],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  8053a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8053a5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  8053a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8053b0:	e9 09 03 00 00       	jmp    8056be <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8053b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053b8:	48 98                	cdqe   
  8053ba:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053c1:	00 
  8053c2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053c6:	48 01 d0             	add    rax,rdx
  8053c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053cc:	83 e0 01             	and    eax,0x1
  8053cf:	48 85 c0             	test   rax,rax
  8053d2:	0f 84 e2 02 00 00    	je     8056ba <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8053d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053db:	48 98                	cdqe   
  8053dd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053e4:	00 
  8053e5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053e9:	48 01 d0             	add    rax,rdx
  8053ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053ef:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  8053f3:	b8 00 00 00 00       	mov    eax,0x0
  8053f8:	e8 ad be ff ff       	call   8012aa <vmalloc>
  8053fd:	48 89 c2             	mov    rdx,rax
  805400:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805407:	00 ff ff 
  80540a:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80540e:	48 89 c1             	mov    rcx,rax
  805411:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805414:	48 98                	cdqe   
  805416:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80541d:	00 
  80541e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805422:	48 01 f0             	add    rax,rsi
  805425:	48 09 ca             	or     rdx,rcx
  805428:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80542b:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805432:	ff 00 00 
  805435:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805439:	48 89 c1             	mov    rcx,rax
  80543c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80543f:	48 98                	cdqe   
  805441:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805448:	00 
  805449:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80544d:	48 01 d0             	add    rax,rdx
  805450:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805453:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80545a:	ff 00 00 
  80545d:	48 21 d0             	and    rax,rdx
  805460:	ba 00 10 00 00       	mov    edx,0x1000
  805465:	48 89 ce             	mov    rsi,rcx
  805468:	48 89 c7             	mov    rdi,rax
  80546b:	e8 d1 61 00 00       	call   80b641 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805470:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805473:	48 98                	cdqe   
  805475:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80547c:	00 
  80547d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805481:	48 01 d0             	add    rax,rdx
  805484:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805487:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80548e:	ff 00 00 
  805491:	48 21 d0             	and    rax,rdx
  805494:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  805498:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80549f:	e9 09 02 00 00       	jmp    8056ad <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8054a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054a7:	48 98                	cdqe   
  8054a9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054b0:	00 
  8054b1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054b5:	48 01 d0             	add    rax,rdx
  8054b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054bb:	83 e0 01             	and    eax,0x1
  8054be:	48 85 c0             	test   rax,rax
  8054c1:	0f 84 e2 01 00 00    	je     8056a9 <copy_mmap+0x36a>
  8054c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054ca:	48 98                	cdqe   
  8054cc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054d3:	00 
  8054d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054d8:	48 01 d0             	add    rax,rdx
  8054db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054de:	25 80 00 00 00       	and    eax,0x80
  8054e3:	48 85 c0             	test   rax,rax
  8054e6:	0f 85 bd 01 00 00    	jne    8056a9 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8054ec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054ef:	48 98                	cdqe   
  8054f1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054f8:	00 
  8054f9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054fd:	48 01 d0             	add    rax,rdx
  805500:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805503:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  805507:	b8 00 00 00 00       	mov    eax,0x0
  80550c:	e8 99 bd ff ff       	call   8012aa <vmalloc>
  805511:	48 89 c2             	mov    rdx,rax
  805514:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80551b:	00 ff ff 
  80551e:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805522:	48 89 c1             	mov    rcx,rax
  805525:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805528:	48 98                	cdqe   
  80552a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805531:	00 
  805532:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805536:	48 01 f0             	add    rax,rsi
  805539:	48 09 ca             	or     rdx,rcx
  80553c:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80553f:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805546:	ff 00 00 
  805549:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  80554d:	48 89 c1             	mov    rcx,rax
  805550:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805553:	48 98                	cdqe   
  805555:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80555c:	00 
  80555d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805561:	48 01 d0             	add    rax,rdx
  805564:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805567:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80556e:	ff 00 00 
  805571:	48 21 d0             	and    rax,rdx
  805574:	ba 00 10 00 00       	mov    edx,0x1000
  805579:	48 89 ce             	mov    rsi,rcx
  80557c:	48 89 c7             	mov    rdi,rax
  80557f:	e8 bd 60 00 00       	call   80b641 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805584:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805587:	48 98                	cdqe   
  805589:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805590:	00 
  805591:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805595:	48 01 d0             	add    rax,rdx
  805598:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80559b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8055a2:	ff 00 00 
  8055a5:	48 21 d0             	and    rax,rdx
  8055a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  8055ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8055b3:	e9 e4 00 00 00       	jmp    80569c <copy_mmap+0x35d>
                    {
                        if(pde[j]&PAGE_PRESENT&&!(pde[j]&PDE_4MB)){
  8055b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055bb:	48 98                	cdqe   
  8055bd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055c4:	00 
  8055c5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055c9:	48 01 d0             	add    rax,rdx
  8055cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055cf:	83 e0 01             	and    eax,0x1
  8055d2:	48 85 c0             	test   rax,rax
  8055d5:	0f 84 bd 00 00 00    	je     805698 <copy_mmap+0x359>
  8055db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055de:	48 98                	cdqe   
  8055e0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055e7:	00 
  8055e8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055ec:	48 01 d0             	add    rax,rdx
  8055ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055f2:	25 80 00 00 00       	and    eax,0x80
  8055f7:	48 85 c0             	test   rax,rax
  8055fa:	0f 85 98 00 00 00    	jne    805698 <copy_mmap+0x359>
                            addr_t old_data3=pde[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805600:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805603:	48 98                	cdqe   
  805605:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80560c:	00 
  80560d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805611:	48 01 d0             	add    rax,rdx
  805614:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805617:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[j]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  80561b:	b8 00 00 00 00       	mov    eax,0x0
  805620:	e8 85 bc ff ff       	call   8012aa <vmalloc>
  805625:	48 89 c2             	mov    rdx,rax
  805628:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80562f:	00 ff ff 
  805632:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805636:	48 89 c1             	mov    rcx,rax
  805639:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80563c:	48 98                	cdqe   
  80563e:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805645:	00 
  805646:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80564a:	48 01 f0             	add    rax,rsi
  80564d:	48 09 ca             	or     rdx,rcx
  805650:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[j]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805653:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80565a:	ff 00 00 
  80565d:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805661:	48 89 c1             	mov    rcx,rax
  805664:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805667:	48 98                	cdqe   
  805669:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805670:	00 
  805671:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805675:	48 01 d0             	add    rax,rdx
  805678:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80567b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805682:	ff 00 00 
  805685:	48 21 d0             	and    rax,rdx
  805688:	ba 00 10 00 00       	mov    edx,0x1000
  80568d:	48 89 ce             	mov    rsi,rcx
  805690:	48 89 c7             	mov    rdi,rax
  805693:	e8 a9 5f 00 00       	call   80b641 <memcpy>
                    for(int k=0;k<512;k++)
  805698:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80569c:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8056a3:	0f 8e 0f ff ff ff    	jle    8055b8 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  8056a9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8056ad:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8056b4:	0f 8e ea fd ff ff    	jle    8054a4 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  8056ba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8056be:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8056c5:	0f 8e ea fc ff ff    	jle    8053b5 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
  8056cb:	90                   	nop
  8056cc:	90                   	nop
  8056cd:	c9                   	leave  
  8056ce:	c3                   	ret    
  8056cf:	90                   	nop

00000000008056d0 <outb>:
  8056d0:	66 89 fa             	mov    dx,di
  8056d3:	66 89 f0             	mov    ax,si
  8056d6:	ee                   	out    dx,al
  8056d7:	e8 29 00 00 00       	call   805705 <io_delay>
  8056dc:	c3                   	ret    

00000000008056dd <outw>:
  8056dd:	66 89 fa             	mov    dx,di
  8056e0:	66 89 f0             	mov    ax,si
  8056e3:	66 ef                	out    dx,ax
  8056e5:	90                   	nop
  8056e6:	90                   	nop
  8056e7:	90                   	nop
  8056e8:	c3                   	ret    

00000000008056e9 <inb>:
  8056e9:	31 c0                	xor    eax,eax
  8056eb:	66 89 fa             	mov    dx,di
  8056ee:	ec                   	in     al,dx
  8056ef:	90                   	nop
  8056f0:	90                   	nop
  8056f1:	90                   	nop
  8056f2:	c3                   	ret    

00000000008056f3 <inw>:
  8056f3:	31 c0                	xor    eax,eax
  8056f5:	66 89 fa             	mov    dx,di
  8056f8:	66 ed                	in     ax,dx
  8056fa:	90                   	nop
  8056fb:	90                   	nop
  8056fc:	90                   	nop
  8056fd:	c3                   	ret    

00000000008056fe <eoi>:
  8056fe:	b0 20                	mov    al,0x20
  805700:	e6 a0                	out    0xa0,al
  805702:	e6 20                	out    0x20,al
  805704:	c3                   	ret    

0000000000805705 <io_delay>:
  805705:	90                   	nop
  805706:	90                   	nop
  805707:	90                   	nop
  805708:	90                   	nop
  805709:	c3                   	ret    

000000000080570a <turn_on_int>:
  80570a:	b0 f8                	mov    al,0xf8
  80570c:	e6 21                	out    0x21,al
  80570e:	e8 f2 ff ff ff       	call   805705 <io_delay>
  805713:	b0 af                	mov    al,0xaf
  805715:	e6 a1                	out    0xa1,al
  805717:	e8 e9 ff ff ff       	call   805705 <io_delay>
  80571c:	b8 00 70 10 00       	mov    eax,0x107000
  805721:	0f 01 18             	lidt   [rax]
  805724:	90                   	nop
  805725:	90                   	nop
  805726:	90                   	nop
  805727:	90                   	nop
  805728:	c3                   	ret    

0000000000805729 <report_back_trace_of_err>:
  805729:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80572e:	50                   	push   rax
  80572f:	68 38 57 80 00       	push   0x805738
  805734:	83 c4 08             	add    esp,0x8
  805737:	c3                   	ret    

0000000000805738 <bt_msg>:
  805738:	65 72 72             	gs jb  8057ad <fill_desc+0x4e>
  80573b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80573c:	72 20                	jb     80575e <init_gdt+0x11>
  80573e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80573f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805742:	72 73                	jb     8057b7 <fill_desc+0x58>
  805744:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805747:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb3c5 <_knl_end+0x2eb3c5>

000000000080574d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80574d:	f3 0f 1e fa          	endbr64 
  805751:	55                   	push   rbp
  805752:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805755:	66 b8 48 00          	mov    ax,0x48
  805759:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80575c:	90                   	nop
  80575d:	5d                   	pop    rbp
  80575e:	c3                   	ret    

000000000080575f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80575f:	f3 0f 1e fa          	endbr64 
  805763:	55                   	push   rbp
  805764:	48 89 e5             	mov    rbp,rsp
  805767:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80576b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80576f:	89 d0                	mov    eax,edx
  805771:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805774:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805778:	48 8b 15 e9 68 00 00 	mov    rdx,QWORD PTR [rip+0x68e9]        # 80c068 <gdt>
  80577f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805782:	48 c1 e0 04          	shl    rax,0x4
  805786:	48 01 d0             	add    rax,rdx
  805789:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80578d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805791:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805795:	48 c1 e8 10          	shr    rax,0x10
  805799:	48 89 c1             	mov    rcx,rax
  80579c:	48 8b 15 c5 68 00 00 	mov    rdx,QWORD PTR [rip+0x68c5]        # 80c068 <gdt>
  8057a3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057a6:	48 c1 e0 04          	shl    rax,0x4
  8057aa:	48 01 d0             	add    rax,rdx
  8057ad:	89 ca                	mov    edx,ecx
  8057af:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  8057b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8057b6:	48 c1 e8 18          	shr    rax,0x18
  8057ba:	48 89 c1             	mov    rcx,rax
  8057bd:	48 8b 15 a4 68 00 00 	mov    rdx,QWORD PTR [rip+0x68a4]        # 80c068 <gdt>
  8057c4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057c7:	48 c1 e0 04          	shl    rax,0x4
  8057cb:	48 01 d0             	add    rax,rdx
  8057ce:	89 ca                	mov    edx,ecx
  8057d0:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  8057d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8057d7:	48 c1 e8 20          	shr    rax,0x20
  8057db:	48 89 c2             	mov    rdx,rax
  8057de:	48 8b 0d 83 68 00 00 	mov    rcx,QWORD PTR [rip+0x6883]        # 80c068 <gdt>
  8057e5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057e8:	48 c1 e0 04          	shl    rax,0x4
  8057ec:	48 01 c8             	add    rax,rcx
  8057ef:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  8057f2:	48 8b 15 6f 68 00 00 	mov    rdx,QWORD PTR [rip+0x686f]        # 80c068 <gdt>
  8057f9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057fc:	48 c1 e0 04          	shl    rax,0x4
  805800:	48 01 d0             	add    rax,rdx
  805803:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805807:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80580a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80580e:	48 c1 e8 08          	shr    rax,0x8
  805812:	66 25 f0 00          	and    ax,0xf0
  805816:	48 8b 0d 4b 68 00 00 	mov    rcx,QWORD PTR [rip+0x684b]        # 80c068 <gdt>
  80581d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805820:	48 c1 e2 04          	shl    rdx,0x4
  805824:	48 01 ca             	add    rdx,rcx
  805827:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80582b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80582f:	90                   	nop
  805830:	5d                   	pop    rbp
  805831:	c3                   	ret    

0000000000805832 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805832:	f3 0f 1e fa          	endbr64 
  805836:	55                   	push   rbp
  805837:	48 89 e5             	mov    rbp,rsp
  80583a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80583d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805840:	89 c8                	mov    eax,ecx
  805842:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805846:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80584a:	48 8b 05 17 68 00 00 	mov    rax,QWORD PTR [rip+0x6817]        # 80c068 <gdt>
  805851:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805855:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805858:	48 c1 e0 04          	shl    rax,0x4
  80585c:	48 89 c2             	mov    rdx,rax
  80585f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805863:	48 01 d0             	add    rax,rdx
  805866:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805869:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80586c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80586f:	48 c1 e0 04          	shl    rax,0x4
  805873:	48 89 c2             	mov    rdx,rax
  805876:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80587a:	48 01 d0             	add    rax,rdx
  80587d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805880:	c1 ea 10             	shr    edx,0x10
  805883:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805886:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805889:	48 c1 e0 04          	shl    rax,0x4
  80588d:	48 89 c2             	mov    rdx,rax
  805890:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805894:	48 01 c2             	add    rdx,rax
  805897:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80589b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  80589f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058a2:	48 c1 e0 04          	shl    rax,0x4
  8058a6:	48 89 c2             	mov    rdx,rax
  8058a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8058ad:	48 01 c2             	add    rdx,rax
  8058b0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8058b4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8058b8:	90                   	nop
  8058b9:	5d                   	pop    rbp
  8058ba:	c3                   	ret    

00000000008058bb <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8058bb:	f3 0f 1e fa          	endbr64 
  8058bf:	55                   	push   rbp
  8058c0:	48 89 e5             	mov    rbp,rsp
  8058c3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8058c6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8058c9:	89 d0                	mov    eax,edx
  8058cb:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8058cf:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8058d3:	90                   	nop
  8058d4:	5d                   	pop    rbp
  8058d5:	c3                   	ret    
  8058d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8058dd:	00 00 00 

00000000008058e0 <fill_desc>:
  8058e0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8058e5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8058ea:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8058ef:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8058f4:	be 00 60 00 00       	mov    esi,0x6000
  8058f9:	c1 e2 03             	shl    edx,0x3
  8058fc:	01 d6                	add    esi,edx
  8058fe:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805902:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805907:	c1 e8 10             	shr    eax,0x10
  80590a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80590e:	c1 eb 10             	shr    ebx,0x10
  805911:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805915:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805919:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80591d:	c3                   	ret    

000000000080591e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80591e:	f3 0f 1e fa          	endbr64 
  805922:	55                   	push   rbp
  805923:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805926:	b8 00 00 00 00       	mov    eax,0x0
  80592b:	e8 01 24 00 00       	call   807d31 <execute_request>
    do_req();
  805930:	b8 00 00 00 00       	mov    eax,0x0
  805935:	e8 e2 d9 ff ff       	call   80331c <do_req>
    if(!manage_proc_lock)
  80593a:	8b 05 c8 66 00 00    	mov    eax,DWORD PTR [rip+0x66c8]        # 80c008 <manage_proc_lock>
  805940:	85 c0                	test   eax,eax
  805942:	75 0a                	jne    80594e <clock_c+0x30>
    {
        manage_proc();
  805944:	b8 00 00 00 00       	mov    eax,0x0
  805949:	e8 1f e2 ff ff       	call   803b6d <manage_proc>
    }
    //puts("1 disk req executed.");
  80594e:	90                   	nop
  80594f:	5d                   	pop    rbp
  805950:	c3                   	ret    
  805951:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805958:	00 00 00 
  80595b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805960 <clock>:
  805960:	50                   	push   rax
  805961:	53                   	push   rbx
  805962:	51                   	push   rcx
  805963:	52                   	push   rdx
  805964:	57                   	push   rdi
  805965:	56                   	push   rsi
  805966:	41 50                	push   r8
  805968:	41 51                	push   r9
  80596a:	41 52                	push   r10
  80596c:	41 53                	push   r11
  80596e:	41 54                	push   r12
  805970:	41 55                	push   r13
  805972:	41 56                	push   r14
  805974:	41 57                	push   r15
  805976:	e8 ca e1 ff ff       	call   803b45 <save_rsp>
  80597b:	66 8c c0             	mov    ax,es
  80597e:	50                   	push   rax
  80597f:	66 8c d8             	mov    ax,ds
  805982:	50                   	push   rax
  805983:	66 b8 10 00          	mov    ax,0x10
  805987:	8e c0                	mov    es,eax
  805989:	8e d8                	mov    ds,eax

000000000080598b <clock.normal_part>:
  80598b:	b0 20                	mov    al,0x20
  80598d:	e6 a0                	out    0xa0,al
  80598f:	e6 20                	out    0x20,al
  805991:	e8 88 ff ff ff       	call   80591e <clock_c>
  805996:	58                   	pop    rax
  805997:	8e d8                	mov    ds,eax
  805999:	58                   	pop    rax
  80599a:	8e c0                	mov    es,eax
  80599c:	41 5f                	pop    r15
  80599e:	41 5e                	pop    r14
  8059a0:	41 5d                	pop    r13
  8059a2:	41 5c                	pop    r12
  8059a4:	41 5b                	pop    r11
  8059a6:	41 5a                	pop    r10
  8059a8:	41 59                	pop    r9
  8059aa:	41 58                	pop    r8
  8059ac:	5e                   	pop    rsi
  8059ad:	5f                   	pop    rdi
  8059ae:	5a                   	pop    rdx
  8059af:	59                   	pop    rcx
  8059b0:	5b                   	pop    rbx
  8059b1:	58                   	pop    rax
  8059b2:	48 cf                	iretq  

00000000008059b4 <execute>:
    return ind;
}
*/

int execute(char *path, char *argv)
{
  8059b4:	f3 0f 1e fa          	endbr64 
  8059b8:	55                   	push   rbp
  8059b9:	48 89 e5             	mov    rbp,rsp
  8059bc:	48 83 ec 30          	sub    rsp,0x30
  8059c0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8059c4:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  8059c8:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  8059cf:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  8059d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059da:	be 00 10 00 00       	mov    esi,0x1000
  8059df:	48 89 c7             	mov    rdi,rax
  8059e2:	e8 69 14 00 00       	call   806e50 <sys_open>
  8059e7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  8059ea:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8059ee:	79 0a                	jns    8059fa <execute+0x46>
  8059f0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8059f5:	e9 ba 00 00 00       	jmp    805ab4 <execute+0x100>
    //
    char *p=path;
  8059fa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059fe:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805a02:	eb 05                	jmp    805a09 <execute+0x55>
  805a04:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805a09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a0d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a10:	84 c0                	test   al,al
  805a12:	75 f0                	jne    805a04 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  805a14:	eb 05                	jmp    805a1b <execute+0x67>
  805a16:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805a1b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a22:	3c 2f                	cmp    al,0x2f
  805a24:	74 0a                	je     805a30 <execute+0x7c>
  805a26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a2a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805a2e:	77 e6                	ja     805a16 <execute+0x62>
    if(p>path)
  805a30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a34:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805a38:	76 2f                	jbe    805a69 <execute+0xb5>
    {
        *p='\0';
  805a3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a3e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805a41:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a45:	be 00 40 00 00       	mov    esi,0x4000
  805a4a:	48 89 c7             	mov    rdi,rax
  805a4d:	e8 fe 13 00 00       	call   806e50 <sys_open>
  805a52:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805a55:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a59:	79 07                	jns    805a62 <execute+0xae>
  805a5b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a60:	eb 52                	jmp    805ab4 <execute+0x100>
        *p='/';
  805a62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a66:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805a69:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a6c:	48 63 d0             	movsxd rdx,eax
  805a6f:	48 89 d0             	mov    rax,rdx
  805a72:	48 c1 e0 02          	shl    rax,0x2
  805a76:	48 01 d0             	add    rax,rdx
  805a79:	48 c1 e0 03          	shl    rax,0x3
  805a7d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805a84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a87:	48 63 c8             	movsxd rcx,eax
  805a8a:	48 89 c8             	mov    rax,rcx
  805a8d:	48 c1 e0 02          	shl    rax,0x2
  805a91:	48 01 c8             	add    rax,rcx
  805a94:	48 c1 e0 03          	shl    rax,0x3
  805a98:	48 05 60 06 40 00    	add    rax,0x400660
  805a9e:	b9 31 5b 80 00       	mov    ecx,0x805b31
  805aa3:	48 89 c6             	mov    rsi,rax
  805aa6:	48 89 cf             	mov    rdi,rcx
  805aa9:	e8 8a e9 ff ff       	call   804438 <reg_proc>
  805aae:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805ab1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805ab4:	c9                   	leave  
  805ab5:	c3                   	ret    

0000000000805ab6 <exec_call>:

int exec_call(char *path)
{
  805ab6:	f3 0f 1e fa          	endbr64 
  805aba:	55                   	push   rbp
  805abb:	48 89 e5             	mov    rbp,rsp
  805abe:	48 83 ec 20          	sub    rsp,0x20
  805ac2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  805ac6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805aca:	be 00 00 00 00       	mov    esi,0x0
  805acf:	48 89 c7             	mov    rdi,rax
  805ad2:	e8 dd fe ff ff       	call   8059b4 <execute>
  805ad7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805ada:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805add:	01 c0                	add    eax,eax
  805adf:	83 c0 05             	add    eax,0x5
  805ae2:	c1 e0 03             	shl    eax,0x3
  805ae5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805ae8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805aeb:	89 c7                	mov    edi,eax
  805aed:	e8 41 e2 ff ff       	call   803d33 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805af2:	90                   	nop
  805af3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805af6:	48 63 d0             	movsxd rdx,eax
  805af9:	48 89 d0             	mov    rax,rdx
  805afc:	48 01 c0             	add    rax,rax
  805aff:	48 01 d0             	add    rax,rdx
  805b02:	48 c1 e0 08          	shl    rax,0x8
  805b06:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805b0c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805b0f:	83 f8 03             	cmp    eax,0x3
  805b12:	75 df                	jne    805af3 <exec_call+0x3d>
    return task[pi].exit_code;
  805b14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b17:	48 63 d0             	movsxd rdx,eax
  805b1a:	48 89 d0             	mov    rax,rdx
  805b1d:	48 01 c0             	add    rax,rax
  805b20:	48 01 d0             	add    rax,rdx
  805b23:	48 c1 e0 08          	shl    rax,0x8
  805b27:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805b2d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805b2f:	c9                   	leave  
  805b30:	c3                   	ret    

0000000000805b31 <proc_start>:
int proc_start()
{
  805b31:	f3 0f 1e fa          	endbr64 
  805b35:	55                   	push   rbp
  805b36:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805b39:	8b 05 ed e9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e9ed]        # 41452c <cur_proc>
  805b3f:	48 63 d0             	movsxd rdx,eax
  805b42:	48 89 d0             	mov    rax,rdx
  805b45:	48 01 c0             	add    rax,rax
  805b48:	48 01 d0             	add    rax,rdx
  805b4b:	48 c1 e0 08          	shl    rax,0x8
  805b4f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805b55:	48 89 c7             	mov    rdi,rax
  805b58:	e8 0d 00 00 00       	call   805b6a <load_pe>
    //释放进程资源
    sys_exit(0);
  805b5d:	bf 00 00 00 00       	mov    edi,0x0
  805b62:	e8 a9 e8 ff ff       	call   804410 <sys_exit>
}
  805b67:	90                   	nop
  805b68:	5d                   	pop    rbp
  805b69:	c3                   	ret    

0000000000805b6a <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  805b6a:	f3 0f 1e fa          	endbr64 
  805b6e:	55                   	push   rbp
  805b6f:	48 89 e5             	mov    rbp,rsp
  805b72:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805b79:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  805b80:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805b87:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805b8e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  805b92:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805b99:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805ba0:	eb 28                	jmp    805bca <load_pe+0x60>
        if(current->openf[i]==f)
  805ba2:	48 8b 05 f7 e8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e8f7]        # 4144a0 <current>
  805ba9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805bac:	48 63 d2             	movsxd rdx,edx
  805baf:	48 83 c2 18          	add    rdx,0x18
  805bb3:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  805bb8:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  805bbc:	75 08                	jne    805bc6 <load_pe+0x5c>
        {
            exefno=i;
  805bbe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805bc1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  805bc4:	eb 0a                	jmp    805bd0 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805bc6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805bca:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  805bce:	7e d2                	jle    805ba2 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  805bd0:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805bd4:	75 0a                	jne    805be0 <load_pe+0x76>
  805bd6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805bdb:	e9 11 07 00 00       	jmp    8062f1 <load_pe+0x787>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  805be0:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  805be7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bea:	ba 44 00 00 00       	mov    edx,0x44
  805bef:	48 89 ce             	mov    rsi,rcx
  805bf2:	89 c7                	mov    edi,eax
  805bf4:	e8 26 16 00 00       	call   80721f <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  805bf9:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  805c00:	48 89 c1             	mov    rcx,rax
  805c03:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c06:	ba 00 00 00 00       	mov    edx,0x0
  805c0b:	48 89 ce             	mov    rsi,rcx
  805c0e:	89 c7                	mov    edi,eax
  805c10:	e8 6a 17 00 00       	call   80737f <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  805c15:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805c1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c1f:	ba 0c 01 00 00       	mov    edx,0x10c
  805c24:	48 89 ce             	mov    rsi,rcx
  805c27:	89 c7                	mov    edi,eax
  805c29:	e8 f1 15 00 00       	call   80721f <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  805c2e:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  805c35:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805c39:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  805c3f:	c1 e8 0c             	shr    eax,0xc
  805c42:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  805c45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c48:	ba 00 00 00 00       	mov    edx,0x0
  805c4d:	be 00 00 00 00       	mov    esi,0x0
  805c52:	89 c7                	mov    edi,eax
  805c54:	e8 26 17 00 00       	call   80737f <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805c59:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  805c5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c60:	ba 00 10 00 00       	mov    edx,0x1000
  805c65:	48 89 ce             	mov    rsi,rcx
  805c68:	89 c7                	mov    edi,eax
  805c6a:	e8 b0 15 00 00       	call   80721f <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  805c6f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c73:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  805c77:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805c7b:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  805c7f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c83:	48 01 d0             	add    rax,rdx
  805c86:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805c8d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805c94:	48 83 c0 04          	add    rax,0x4
  805c98:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805c9f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ca6:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805ca9:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  805caf:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  805cb5:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  805cbb:	85 c0                	test   eax,eax
  805cbd:	0f 48 c2             	cmovs  eax,edx
  805cc0:	c1 f8 0c             	sar    eax,0xc
  805cc3:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805cc9:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805cd0:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  805cd3:	89 c2                	mov    edx,eax
  805cd5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805cd9:	48 01 d0             	add    rax,rdx
  805cdc:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805ce3:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805ce9:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  805cef:	85 c0                	test   eax,eax
  805cf1:	0f 48 c2             	cmovs  eax,edx
  805cf4:	c1 f8 0a             	sar    eax,0xa
  805cf7:	89 c1                	mov    ecx,eax
  805cf9:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805cff:	99                   	cdq    
  805d00:	c1 ea 16             	shr    edx,0x16
  805d03:	01 d0                	add    eax,edx
  805d05:	25 ff 03 00 00       	and    eax,0x3ff
  805d0a:	29 d0                	sub    eax,edx
  805d0c:	01 c8                	add    eax,ecx
  805d0e:	85 c0                	test   eax,eax
  805d10:	0f 95 c0             	setne  al
  805d13:	0f b6 c0             	movzx  eax,al
  805d16:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805d1c:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805d23:	48 c1 e8 15          	shr    rax,0x15
  805d27:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  805d2d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d34:	89 c0                	mov    eax,eax
  805d36:	48 05 0c 01 00 00    	add    rax,0x10c
  805d3c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805d40:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d47:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805d4b:	0f b7 d0             	movzx  edx,ax
  805d4e:	89 d0                	mov    eax,edx
  805d50:	c1 e0 02             	shl    eax,0x2
  805d53:	01 d0                	add    eax,edx
  805d55:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805d58:	05 50 01 00 00       	add    eax,0x150
  805d5d:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  805d63:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d6a:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805d6d:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805d73:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d79:	99                   	cdq    
  805d7a:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805d80:	89 d0                	mov    eax,edx
  805d82:	85 c0                	test   eax,eax
  805d84:	74 23                	je     805da9 <load_pe+0x23f>
  805d86:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d8c:	99                   	cdq    
  805d8d:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805d93:	89 d1                	mov    ecx,edx
  805d95:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d9b:	29 c8                	sub    eax,ecx
  805d9d:	89 c2                	mov    edx,eax
  805d9f:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805da5:	01 d0                	add    eax,edx
  805da7:	eb 06                	jmp    805daf <load_pe+0x245>
  805da9:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805daf:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805db5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805dbc:	eb 6b                	jmp    805e29 <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805dbe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805dc2:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805dc5:	25 00 00 00 02       	and    eax,0x2000000
  805dca:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  805dd0:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  805dd7:	75 46                	jne    805e1f <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  805dd9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ddd:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805de0:	89 c1                	mov    ecx,eax
  805de2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805de5:	ba 00 00 00 00       	mov    edx,0x0
  805dea:	48 89 ce             	mov    rsi,rcx
  805ded:	89 c7                	mov    edi,eax
  805def:	e8 8b 15 00 00       	call   80737f <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  805df4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805df8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805dfb:	89 c2                	mov    edx,eax
  805dfd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e01:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e04:	89 c1                	mov    ecx,eax
  805e06:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e0a:	48 01 c8             	add    rax,rcx
  805e0d:	48 89 c1             	mov    rcx,rax
  805e10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e13:	48 89 ce             	mov    rsi,rcx
  805e16:	89 c7                	mov    edi,eax
  805e18:	e8 02 14 00 00       	call   80721f <sys_read>
  805e1d:	eb 01                	jmp    805e20 <load_pe+0x2b6>
            continue;
  805e1f:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805e20:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805e24:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805e29:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805e30:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805e34:	0f b7 c0             	movzx  eax,ax
  805e37:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805e3a:	7c 82                	jl     805dbe <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805e3c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805e43:	48 05 90 00 00 00    	add    rax,0x90
  805e49:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  805e50:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e57:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805e5a:	85 c0                	test   eax,eax
  805e5c:	0f 84 7b 02 00 00    	je     8060dd <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805e62:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e69:	8b 10                	mov    edx,DWORD PTR [rax]
  805e6b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e6f:	01 d0                	add    eax,edx
  805e71:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805e77:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  805e7d:	48 98                	cdqe   
  805e7f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805e83:	e9 47 02 00 00       	jmp    8060cf <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805e88:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e8c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e8f:	89 c2                	mov    edx,eax
  805e91:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e95:	48 01 d0             	add    rax,rdx
  805e98:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805e9f:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  805ea6:	be 6f 3c 81 00       	mov    esi,0x813c6f
  805eab:	48 89 c7             	mov    rdi,rax
  805eae:	e8 2c 5a 00 00       	call   80b8df <strcmp>
  805eb3:	85 c0                	test   eax,eax
  805eb5:	75 09                	jne    805ec0 <load_pe+0x356>
            {
                dllp=0x1c00000;
  805eb7:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805ebe:	eb 25                	jmp    805ee5 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805ec0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805ec7:	48 89 c7             	mov    rdi,rax
  805eca:	e8 9b fc ff ff       	call   805b6a <load_pe>
  805ecf:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805ed5:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  805edb:	89 c7                	mov    edi,eax
  805edd:	e8 11 04 00 00       	call   8062f3 <get_module_addr>
  805ee2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805ee5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ee8:	48 98                	cdqe   
  805eea:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805ef1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ef4:	48 63 d0             	movsxd rdx,eax
  805ef7:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  805efe:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805f02:	48 01 d0             	add    rax,rdx
  805f05:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  805f0c:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805f13:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  805f19:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f1c:	01 d0                	add    eax,edx
  805f1e:	89 c0                	mov    eax,eax
  805f20:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  805f27:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f2e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805f31:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805f37:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f3e:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805f41:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f44:	01 d0                	add    eax,edx
  805f46:	89 c0                	mov    eax,eax
  805f48:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805f4f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f56:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805f59:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f5c:	01 d0                	add    eax,edx
  805f5e:	89 c0                	mov    eax,eax
  805f60:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805f67:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f6e:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805f71:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f74:	01 d0                	add    eax,edx
  805f76:	89 c0                	mov    eax,eax
  805f78:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805f7f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f86:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f89:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805f8f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f93:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f96:	89 c2                	mov    edx,eax
  805f98:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805f9c:	48 01 d0             	add    rax,rdx
  805f9f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805fa3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805fa7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805faa:	89 c2                	mov    edx,eax
  805fac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805fb0:	48 01 d0             	add    rax,rdx
  805fb3:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805fb7:	e9 00 01 00 00       	jmp    8060bc <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805fbc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fc0:	8b 00                	mov    eax,DWORD PTR [rax]
  805fc2:	85 c0                	test   eax,eax
  805fc4:	79 43                	jns    806009 <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805fc6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fca:	8b 00                	mov    eax,DWORD PTR [rax]
  805fcc:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805fd1:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  805fd7:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805fdd:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  805fe3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805fea:	00 
  805feb:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805ff2:	48 01 d0             	add    rax,rdx
  805ff5:	8b 10                	mov    edx,DWORD PTR [rax]
  805ff7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ffa:	01 d0                	add    eax,edx
  805ffc:	89 c2                	mov    edx,eax
  805ffe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806002:	89 10                	mov    DWORD PTR [rax],edx
  806004:	e9 a9 00 00 00       	jmp    8060b2 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  806009:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80600d:	8b 00                	mov    eax,DWORD PTR [rax]
  80600f:	89 c0                	mov    eax,eax
  806011:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806018:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  80601f:	02 
                    int i=0;
  806020:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  806027:	eb 7a                	jmp    8060a3 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  806029:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80602c:	48 98                	cdqe   
  80602e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806035:	00 
  806036:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80603d:	48 01 d0             	add    rax,rdx
  806040:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806043:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80604a:	48 89 d6             	mov    rsi,rdx
  80604d:	48 89 c7             	mov    rdi,rax
  806050:	e8 8a 58 00 00       	call   80b8df <strcmp>
  806055:	85 c0                	test   eax,eax
  806057:	75 46                	jne    80609f <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  806059:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80605c:	48 98                	cdqe   
  80605e:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806062:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  806069:	48 01 d0             	add    rax,rdx
  80606c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80606f:	98                   	cwde   
  806070:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  806076:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80607c:	48 98                	cdqe   
  80607e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806085:	00 
  806086:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80608d:	48 01 d0             	add    rax,rdx
  806090:	8b 10                	mov    edx,DWORD PTR [rax]
  806092:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806095:	01 d0                	add    eax,edx
  806097:	89 c2                	mov    edx,eax
  806099:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80609d:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  80609f:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8060a3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8060a6:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8060ac:	0f 8c 77 ff ff ff    	jl     806029 <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8060b2:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8060b7:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8060bc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8060c2:	85 c0                	test   eax,eax
  8060c4:	0f 85 f2 fe ff ff    	jne    805fbc <load_pe+0x452>
            }
            impdes++;
  8060ca:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8060cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8060d3:	8b 00                	mov    eax,DWORD PTR [rax]
  8060d5:	85 c0                	test   eax,eax
  8060d7:	0f 85 ab fd ff ff    	jne    805e88 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8060dd:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8060e4:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8060e5:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060ec:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  8060f2:	85 c0                	test   eax,eax
  8060f4:	0f 84 ec 00 00 00    	je     8061e6 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8060fa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806101:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  806107:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80610b:	01 d0                	add    eax,edx
  80610d:	89 c0                	mov    eax,eax
  80610f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806113:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806117:	48 83 c0 40          	add    rax,0x40
  80611b:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  80611f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806123:	48 83 c0 02          	add    rax,0x2
  806127:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80612b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806132:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806136:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80613c:	e9 97 00 00 00       	jmp    8061d8 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806141:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806145:	8b 10                	mov    edx,DWORD PTR [rax]
  806147:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80614b:	01 d0                	add    eax,edx
  80614d:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806153:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80615a:	eb 5a                	jmp    8061b6 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80615c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806160:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806163:	66 85 c0             	test   ax,ax
  806166:	74 49                	je     8061b1 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806168:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80616c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80616f:	0f b7 d0             	movzx  edx,ax
  806172:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  806178:	01 d0                	add    eax,edx
  80617a:	48 98                	cdqe   
  80617c:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  806183:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  80618a:	8b 00                	mov    eax,DWORD PTR [rax]
  80618c:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  806192:	89 c2                	mov    edx,eax
  806194:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806198:	01 d0                	add    eax,edx
  80619a:	89 c2                	mov    edx,eax
  80619c:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8061a3:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8061a5:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8061aa:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8061af:	eb 01                	jmp    8061b2 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8061b1:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8061b2:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8061b6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061ba:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8061bd:	c1 e8 02             	shr    eax,0x2
  8061c0:	89 c2                	mov    edx,eax
  8061c2:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8061c5:	39 c2                	cmp    edx,eax
  8061c7:	77 93                	ja     80615c <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8061c9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061cd:	05 00 10 00 00       	add    eax,0x1000
  8061d2:	48 98                	cdqe   
  8061d4:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8061d8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061dc:	8b 00                	mov    eax,DWORD PTR [rax]
  8061de:	85 c0                	test   eax,eax
  8061e0:	0f 85 5b ff ff ff    	jne    806141 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8061e6:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8061ed:	00 00 00 
  8061f0:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8061f7:	00 00 00 
  8061fa:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806201:	00 00 00 00 
  806205:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80620c:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806210:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  806217:	ba 18 00 00 00       	mov    edx,0x18
  80621c:	48 89 c6             	mov    rsi,rax
  80621f:	bf 00 00 00 01       	mov    edi,0x1000000
  806224:	e8 18 54 00 00       	call   80b641 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  806229:	8b 05 fd e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2fd]        # 41452c <cur_proc>
  80622f:	48 63 d0             	movsxd rdx,eax
  806232:	48 89 d0             	mov    rax,rdx
  806235:	48 01 c0             	add    rax,rax
  806238:	48 01 d0             	add    rax,rdx
  80623b:	48 c1 e0 08          	shl    rax,0x8
  80623f:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806245:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  80624c:	8b 05 da e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2da]        # 41452c <cur_proc>
  806252:	48 63 d0             	movsxd rdx,eax
  806255:	48 89 d0             	mov    rax,rdx
  806258:	48 01 c0             	add    rax,rax
  80625b:	48 01 d0             	add    rax,rdx
  80625e:	48 c1 e0 08          	shl    rax,0x8
  806262:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806268:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  80626f:	8b 05 b7 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2b7]        # 41452c <cur_proc>
  806275:	48 63 d0             	movsxd rdx,eax
  806278:	48 89 d0             	mov    rax,rdx
  80627b:	48 01 c0             	add    rax,rax
  80627e:	48 01 d0             	add    rax,rdx
  806281:	48 c1 e0 08          	shl    rax,0x8
  806285:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80628b:	c7 40 10 00 f0 ff ff 	mov    DWORD PTR [rax+0x10],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  806292:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806299:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8062a0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8062a7:	be 00 00 00 00       	mov    esi,0x0
  8062ac:	bf 00 00 00 00       	mov    edi,0x0
  8062b1:	ff d0                	call   rax
  8062b3:	8b 15 73 e2 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0e273]        # 41452c <cur_proc>
  8062b9:	89 c1                	mov    ecx,eax
  8062bb:	48 63 d2             	movsxd rdx,edx
  8062be:	48 89 d0             	mov    rax,rdx
  8062c1:	48 01 c0             	add    rax,rax
  8062c4:	48 01 d0             	add    rax,rdx
  8062c7:	48 c1 e0 08          	shl    rax,0x8
  8062cb:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8062d1:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  8062d3:	8b 05 53 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e253]        # 41452c <cur_proc>
  8062d9:	48 63 d0             	movsxd rdx,eax
  8062dc:	48 89 d0             	mov    rax,rdx
  8062df:	48 01 c0             	add    rax,rax
  8062e2:	48 01 d0             	add    rax,rdx
  8062e5:	48 c1 e0 08          	shl    rax,0x8
  8062e9:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8062ef:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8062f1:	c9                   	leave  
  8062f2:	c3                   	ret    

00000000008062f3 <get_module_addr>:

int get_module_addr(int mi)
{
  8062f3:	f3 0f 1e fa          	endbr64 
  8062f7:	55                   	push   rbp
  8062f8:	48 89 e5             	mov    rbp,rsp
  8062fb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  8062fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806301:	48 98                	cdqe   
  806303:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  80630a:	5d                   	pop    rbp
  80630b:	c3                   	ret    

000000000080630c <dispose_library>:
int dispose_library(int dlln)
{
  80630c:	f3 0f 1e fa          	endbr64 
  806310:	55                   	push   rbp
  806311:	48 89 e5             	mov    rbp,rsp
  806314:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  806317:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80631b:	78 09                	js     806326 <dispose_library+0x1a>
  80631d:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806324:	7e 07                	jle    80632d <dispose_library+0x21>
  806326:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80632b:	eb 1d                	jmp    80634a <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80632d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806330:	48 98                	cdqe   
  806332:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  806339:	48 05 48 45 41 00    	add    rax,0x414548
  80633f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  806345:	b8 00 00 00 00       	mov    eax,0x0
}
  80634a:	5d                   	pop    rbp
  80634b:	c3                   	ret    

000000000080634c <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80634c:	f3 0f 1e fa          	endbr64 
  806350:	55                   	push   rbp
  806351:	48 89 e5             	mov    rbp,rsp
  806354:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806358:	90                   	nop
  806359:	5d                   	pop    rbp
  80635a:	c3                   	ret    

000000000080635b <sys_rmmod>:
int sys_rmmod(char *name)
{
  80635b:	f3 0f 1e fa          	endbr64 
  80635f:	55                   	push   rbp
  806360:	48 89 e5             	mov    rbp,rsp
  806363:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806367:	90                   	nop
  806368:	5d                   	pop    rbp
  806369:	c3                   	ret    
  80636a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000806370 <_syscall>:
  806370:	55                   	push   rbp
  806371:	bd 00 80 10 00       	mov    ebp,0x108000
  806376:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80637a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80637e:	50                   	push   rax
  80637f:	53                   	push   rbx
  806380:	51                   	push   rcx
  806381:	52                   	push   rdx
  806382:	57                   	push   rdi
  806383:	56                   	push   rsi
  806384:	41 50                	push   r8
  806386:	41 51                	push   r9
  806388:	41 52                	push   r10
  80638a:	41 53                	push   r11
  80638c:	41 54                	push   r12
  80638e:	41 55                	push   r13
  806390:	41 56                	push   r14
  806392:	41 57                	push   r15
  806394:	66 8c c0             	mov    ax,es
  806397:	50                   	push   rax
  806398:	66 8c d8             	mov    ax,ds
  80639b:	50                   	push   rax
  80639c:	66 b8 10 00          	mov    ax,0x10
  8063a0:	8e c0                	mov    es,eax
  8063a2:	8e d8                	mov    ds,eax
  8063a4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8063a9:	41 53                	push   r11
  8063ab:	51                   	push   rcx
  8063ac:	49 87 ca             	xchg   r10,rcx
  8063af:	e8 e6 a1 ff ff       	call   80059a <syscall>
  8063b4:	4c 87 d1             	xchg   rcx,r10
  8063b7:	59                   	pop    rcx
  8063b8:	41 5b                	pop    r11
  8063ba:	58                   	pop    rax
  8063bb:	8e d8                	mov    ds,eax
  8063bd:	58                   	pop    rax
  8063be:	8e c0                	mov    es,eax
  8063c0:	41 5f                	pop    r15
  8063c2:	41 5e                	pop    r14
  8063c4:	41 5d                	pop    r13
  8063c6:	41 5c                	pop    r12
  8063c8:	41 5b                	pop    r11
  8063ca:	41 5a                	pop    r10
  8063cc:	41 59                	pop    r9
  8063ce:	41 58                	pop    r8
  8063d0:	5e                   	pop    rsi
  8063d1:	5f                   	pop    rdi
  8063d2:	5a                   	pop    rdx
  8063d3:	59                   	pop    rcx
  8063d4:	5b                   	pop    rbx
  8063d5:	48 83 c4 08          	add    rsp,0x8
  8063d9:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  8063dd:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  8063e1:	5d                   	pop    rbp
  8063e2:	fb                   	sti    
  8063e3:	48 0f 07             	sysretq 

00000000008063e6 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8063e6:	f3 0f 1e fa          	endbr64 
  8063ea:	55                   	push   rbp
  8063eb:	48 89 e5             	mov    rbp,rsp
  8063ee:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8063f2:	8b 05 5c 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2115c]        # 427554 <framebuffer+0x14>
  8063f8:	89 c0                	mov    eax,eax
  8063fa:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8063fe:	8b 05 54 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21154]        # 427558 <framebuffer+0x18>
  806404:	89 c0                	mov    eax,eax
  806406:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80640a:	0f b6 05 4b 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2114b]        # 42755c <framebuffer+0x1c>
  806411:	c0 e8 03             	shr    al,0x3
  806414:	0f b6 c0             	movzx  eax,al
  806417:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80641b:	8b 05 2f 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2112f]        # 427550 <framebuffer+0x10>
  806421:	89 c0                	mov    eax,eax
  806423:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806427:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80642b:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806430:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806434:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806438:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80643d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806441:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806445:	48 c1 e8 0c          	shr    rax,0xc
  806449:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80644c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806453:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806454:	48 8b 05 ed 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc210ed]        # 427548 <framebuffer+0x8>
  80645b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80645f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806466:	00 
  806467:	eb 2d                	jmp    806496 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  806469:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80646d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806471:	ba 07 00 00 00       	mov    edx,0x7
  806476:	48 89 ce             	mov    rsi,rcx
  806479:	48 89 c7             	mov    rdi,rax
  80647c:	e8 64 aa ff ff       	call   800ee5 <mmap>
        pp+=PAGE_SIZE;
  806481:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  806488:	00 
        p+=PAGE_SIZE;
  806489:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  806490:	00 
    for (size_t i = 0; i < pgc; i++)
  806491:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  806496:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806499:	48 98                	cdqe   
  80649b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80649f:	72 c8                	jb     806469 <init_framebuffer+0x83>
    }
    
    
}
  8064a1:	90                   	nop
  8064a2:	90                   	nop
  8064a3:	c9                   	leave  
  8064a4:	c3                   	ret    

00000000008064a5 <init_font>:
void init_font(){
  8064a5:	f3 0f 1e fa          	endbr64 
  8064a9:	55                   	push   rbp
  8064aa:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8064ad:	48 c7 05 c8 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc210c8],0x80c320        # 427580 <boot_font>
  8064b4:	20 c3 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8064b8:	48 8b 05 c1 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc210c1]        # 427580 <boot_font>
  8064bf:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8064c2:	83 c0 07             	add    eax,0x7
  8064c5:	c1 e8 03             	shr    eax,0x3
  8064c8:	89 05 c2 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210c2],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8064ce:	8b 05 bc 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210bc]        # 427590 <font_width_bytes>
  8064d4:	c1 e0 03             	shl    eax,0x3
  8064d7:	89 05 ab 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210ab],eax        # 427588 <font_width>
    font_height = boot_font->height;
  8064dd:	48 8b 05 9c 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2109c]        # 427580 <boot_font>
  8064e4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8064e7:	89 05 9f 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2109f],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8064ed:	48 8b 05 8c 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2108c]        # 427580 <boot_font>
  8064f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8064f7:	89 c0                	mov    eax,eax
  8064f9:	48 05 20 c3 80 00    	add    rax,0x80c320
  8064ff:	48 89 05 92 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21092],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806506:	48 8b 05 73 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21073]        # 427580 <boot_font>
  80650d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806510:	89 05 8e 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2108e],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806516:	48 8b 05 63 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21063]        # 427580 <boot_font>
  80651d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806520:	89 05 7a 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2107a],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806526:	c7 05 40 10 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21040],0x0        # 427570 <fb_cursor_y>
  80652d:	00 00 00 
  806530:	8b 05 3a 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2103a]        # 427570 <fb_cursor_y>
  806536:	89 05 30 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21030],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80653c:	8b 05 12 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21012]        # 427554 <framebuffer+0x14>
  806542:	8b 0d 40 10 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21040]        # 427588 <font_width>
  806548:	ba 00 00 00 00       	mov    edx,0x0
  80654d:	f7 f1                	div    ecx
  80654f:	89 05 1f 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2101f],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806555:	8b 05 fd 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ffd]        # 427558 <framebuffer+0x18>
  80655b:	8b 35 2b 10 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2102b]        # 42758c <font_height>
  806561:	ba 00 00 00 00       	mov    edx,0x0
  806566:	f7 f6                	div    esi
  806568:	89 05 0a 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2100a],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  80656e:	c7 05 f8 5a 00 00 01 	mov    DWORD PTR [rip+0x5af8],0x1        # 80c070 <font_size>
  806575:	00 00 00 
}
  806578:	90                   	nop
  806579:	5d                   	pop    rbp
  80657a:	c3                   	ret    

000000000080657b <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  80657b:	f3 0f 1e fa          	endbr64 
  80657f:	55                   	push   rbp
  806580:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  806583:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  806587:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80658b:	48 89 05 ae 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20fae],rax        # 427540 <framebuffer>
  806592:	48 89 15 af 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20faf],rdx        # 427548 <framebuffer+0x8>
  806599:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  80659d:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8065a1:	48 89 05 a8 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20fa8],rax        # 427550 <framebuffer+0x10>
  8065a8:	48 89 15 a9 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20fa9],rdx        # 427558 <framebuffer+0x18>
  8065af:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8065b3:	48 89 05 a6 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20fa6],rax        # 427560 <framebuffer+0x20>
}
  8065ba:	90                   	nop
  8065bb:	5d                   	pop    rbp
  8065bc:	c3                   	ret    

00000000008065bd <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8065bd:	f3 0f 1e fa          	endbr64 
  8065c1:	55                   	push   rbp
  8065c2:	48 89 e5             	mov    rbp,rsp
  8065c5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8065c8:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8065cb:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8065ce:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  8065d1:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8065d5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  8065dc:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  8065dd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8065e0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8065e3:	eb 64                	jmp    806649 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  8065e5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8065e8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8065eb:	eb 4b                	jmp    806638 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8065ed:	8b 15 5d 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20f5d]        # 427550 <framebuffer+0x10>
  8065f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065f6:	0f af c2             	imul   eax,edx
  8065f9:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  8065fb:	0f b6 05 5a 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f5a]        # 42755c <framebuffer+0x1c>
  806602:	0f b6 c0             	movzx  eax,al
  806605:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806609:	8d 50 07             	lea    edx,[rax+0x7]
  80660c:	85 c0                	test   eax,eax
  80660e:	0f 48 c2             	cmovs  eax,edx
  806611:	c1 f8 03             	sar    eax,0x3
  806614:	48 98                	cdqe   
  806616:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806619:	48 05 00 00 00 40    	add    rax,0x40000000
  80661f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806623:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806627:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  80662b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80662f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806632:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806634:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806638:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80663b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80663e:	01 d0                	add    eax,edx
  806640:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806643:	7c a8                	jl     8065ed <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806645:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806649:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80664c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80664f:	01 d0                	add    eax,edx
  806651:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806654:	7c 8f                	jl     8065e5 <fill_rect+0x28>
        }
    }
}
  806656:	90                   	nop
  806657:	90                   	nop
  806658:	5d                   	pop    rbp
  806659:	c3                   	ret    

000000000080665a <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  80665a:	f3 0f 1e fa          	endbr64 
  80665e:	55                   	push   rbp
  80665f:	48 89 e5             	mov    rbp,rsp
  806662:	48 83 ec 30          	sub    rsp,0x30
  806666:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806669:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80666c:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80666f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806673:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806676:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806679:	eb 5a                	jmp    8066d5 <draw_text+0x7b>
    {
        if(*str=='\n')
  80667b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80667f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806682:	3c 0a                	cmp    al,0xa
  806684:	75 1c                	jne    8066a2 <draw_text+0x48>
        {
            y+=font_height*size;
  806686:	8b 15 00 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20f00]        # 42758c <font_height>
  80668c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80668f:	0f af d0             	imul   edx,eax
  806692:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806695:	01 d0                	add    eax,edx
  806697:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  80669a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80669d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8066a0:	eb 2e                	jmp    8066d0 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8066a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8066a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8066a9:	0f be c8             	movsx  ecx,al
  8066ac:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8066af:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8066b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066b5:	89 c7                	mov    edi,eax
  8066b7:	e8 28 00 00 00       	call   8066e4 <draw_letter>
            tx+=size*font_width;
  8066bc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8066bf:	8b 05 c3 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ec3]        # 427588 <font_width>
  8066c5:	0f af d0             	imul   edx,eax
  8066c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066cb:	01 d0                	add    eax,edx
  8066cd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8066d0:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8066d5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8066d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8066dc:	84 c0                	test   al,al
  8066de:	75 9b                	jne    80667b <draw_text+0x21>
    }
}
  8066e0:	90                   	nop
  8066e1:	90                   	nop
  8066e2:	c9                   	leave  
  8066e3:	c3                   	ret    

00000000008066e4 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  8066e4:	f3 0f 1e fa          	endbr64 
  8066e8:	55                   	push   rbp
  8066e9:	48 89 e5             	mov    rbp,rsp
  8066ec:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  8066ef:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  8066f2:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  8066f5:	89 c8                	mov    eax,ecx
  8066f7:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  8066fa:	48 8b 05 97 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e97]        # 427598 <glyph_table>
  806701:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806705:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806709:	8b 05 95 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e95]        # 4275a4 <glyph_nr>
  80670f:	39 c2                	cmp    edx,eax
  806711:	73 13                	jae    806726 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806713:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806717:	8b 05 83 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e83]        # 4275a0 <bytes_per_glyph>
  80671d:	0f af c2             	imul   eax,edx
  806720:	89 c0                	mov    eax,eax
  806722:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806726:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80672d:	e9 cb 00 00 00       	jmp    8067fd <draw_letter+0x119>
        u8 mask = 1 << 7;
  806732:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806736:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80673d:	e9 9c 00 00 00       	jmp    8067de <draw_letter+0xfa>
            int px=x+ch_x*size;
  806742:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806745:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806749:	89 c2                	mov    edx,eax
  80674b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80674e:	01 d0                	add    eax,edx
  806750:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806753:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806756:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  80675a:	89 c2                	mov    edx,eax
  80675c:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  80675f:	01 d0                	add    eax,edx
  806761:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806764:	8b 15 e6 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20de6]        # 427550 <framebuffer+0x10>
  80676a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80676d:	0f af c2             	imul   eax,edx
  806770:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806772:	0f b6 05 e3 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20de3]        # 42755c <framebuffer+0x1c>
  806779:	0f b6 c0             	movzx  eax,al
  80677c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806780:	8d 50 07             	lea    edx,[rax+0x7]
  806783:	85 c0                	test   eax,eax
  806785:	0f 48 c2             	cmovs  eax,edx
  806788:	c1 f8 03             	sar    eax,0x3
  80678b:	48 98                	cdqe   
  80678d:	48 01 c8             	add    rax,rcx
  806790:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806796:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  80679a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80679d:	c1 e8 03             	shr    eax,0x3
  8067a0:	89 c2                	mov    edx,eax
  8067a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067a6:	48 01 d0             	add    rax,rdx
  8067a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8067ac:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8067af:	84 c0                	test   al,al
  8067b1:	74 0c                	je     8067bf <draw_letter+0xdb>
                *ptr=-1;
  8067b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067b7:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  8067bd:	eb 0a                	jmp    8067c9 <draw_letter+0xe5>
            } else {
                *ptr=0;
  8067bf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067c3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  8067c9:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8067cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8067cf:	83 e0 07             	and    eax,0x7
  8067d2:	85 c0                	test   eax,eax
  8067d4:	75 04                	jne    8067da <draw_letter+0xf6>
                mask = 1 << 7;
  8067d6:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8067da:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8067de:	8b 05 a4 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20da4]        # 427588 <font_width>
  8067e4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8067e7:	0f 82 55 ff ff ff    	jb     806742 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  8067ed:	8b 05 9d 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d9d]        # 427590 <font_width_bytes>
  8067f3:	89 c0                	mov    eax,eax
  8067f5:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8067f9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8067fd:	8b 05 89 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d89]        # 42758c <font_height>
  806803:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806806:	0f 82 26 ff ff ff    	jb     806732 <draw_letter+0x4e>
    }
}
  80680c:	90                   	nop
  80680d:	90                   	nop
  80680e:	5d                   	pop    rbp
  80680f:	c3                   	ret    

0000000000806810 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806810:	f3 0f 1e fa          	endbr64 
  806814:	55                   	push   rbp
  806815:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806818:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80681f:	eb 71                	jmp    806892 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806821:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806828:	eb 57                	jmp    806881 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  80682a:	8b 15 20 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20d20]        # 427550 <framebuffer+0x10>
  806830:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806833:	0f af c2             	imul   eax,edx
  806836:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806838:	0f b6 05 1d 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d1d]        # 42755c <framebuffer+0x1c>
  80683f:	0f b6 c0             	movzx  eax,al
  806842:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806846:	8d 50 07             	lea    edx,[rax+0x7]
  806849:	85 c0                	test   eax,eax
  80684b:	0f 48 c2             	cmovs  eax,edx
  80684e:	c1 f8 03             	sar    eax,0x3
  806851:	48 98                	cdqe   
  806853:	48 01 c8             	add    rax,rcx
  806856:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  80685c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806860:	8b 05 ea 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cea]        # 427550 <framebuffer+0x10>
  806866:	89 c2                	mov    edx,eax
  806868:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80686c:	48 01 d0             	add    rax,rdx
  80686f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806872:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806876:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806878:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  80687d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806881:	8b 15 cd 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20ccd]        # 427554 <framebuffer+0x14>
  806887:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80688a:	39 c2                	cmp    edx,eax
  80688c:	77 9c                	ja     80682a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  80688e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806892:	8b 05 c0 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cc0]        # 427558 <framebuffer+0x18>
  806898:	8d 50 ff             	lea    edx,[rax-0x1]
  80689b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80689e:	39 c2                	cmp    edx,eax
  8068a0:	0f 87 7b ff ff ff    	ja     806821 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  8068a6:	90                   	nop
  8068a7:	90                   	nop
  8068a8:	5d                   	pop    rbp
  8068a9:	c3                   	ret    

00000000008068aa <scr_down>:
void scr_down(){
  8068aa:	f3 0f 1e fa          	endbr64 
  8068ae:	55                   	push   rbp
  8068af:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8068b2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  8068b9:	eb 72                	jmp    80692d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8068bb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8068c2:	eb 58                	jmp    80691c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8068c4:	8b 15 86 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20c86]        # 427550 <framebuffer+0x10>
  8068ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068cd:	0f af c2             	imul   eax,edx
  8068d0:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8068d2:	0f b6 05 83 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c83]        # 42755c <framebuffer+0x1c>
  8068d9:	0f b6 c0             	movzx  eax,al
  8068dc:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8068e0:	8d 50 07             	lea    edx,[rax+0x7]
  8068e3:	85 c0                	test   eax,eax
  8068e5:	0f 48 c2             	cmovs  eax,edx
  8068e8:	c1 f8 03             	sar    eax,0x3
  8068eb:	48 98                	cdqe   
  8068ed:	48 01 c8             	add    rax,rcx
  8068f0:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8068f6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  8068fa:	8b 05 50 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c50]        # 427550 <framebuffer+0x10>
  806900:	89 c0                	mov    eax,eax
  806902:	48 f7 d8             	neg    rax
  806905:	48 89 c2             	mov    rdx,rax
  806908:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80690c:	48 01 d0             	add    rax,rdx
  80690f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806912:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806916:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806918:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80691c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80691f:	8b 05 4f 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c4f]        # 427574 <max_ch_nr_x>
  806925:	39 c2                	cmp    edx,eax
  806927:	72 9b                	jb     8068c4 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806929:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80692d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806930:	8b 05 42 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c42]        # 427578 <max_ch_nr_y>
  806936:	39 c2                	cmp    edx,eax
  806938:	72 81                	jb     8068bb <scr_down+0x11>
        }

    }
}
  80693a:	90                   	nop
  80693b:	90                   	nop
  80693c:	5d                   	pop    rbp
  80693d:	c3                   	ret    

000000000080693e <print>:
void print(char* s){
  80693e:	f3 0f 1e fa          	endbr64 
  806942:	55                   	push   rbp
  806943:	48 89 e5             	mov    rbp,rsp
  806946:	48 83 ec 08          	sub    rsp,0x8
  80694a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  80694e:	e9 c4 00 00 00       	jmp    806a17 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806953:	8b 15 13 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20c13]        # 42756c <fb_cursor_x>
  806959:	8b 05 15 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c15]        # 427574 <max_ch_nr_x>
  80695f:	39 c2                	cmp    edx,eax
  806961:	77 0b                	ja     80696e <print+0x30>
  806963:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806967:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80696a:	3c 0a                	cmp    al,0xa
  80696c:	75 19                	jne    806987 <print+0x49>
        {
            fb_cursor_y+=1;
  80696e:	8b 05 fc 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bfc]        # 427570 <fb_cursor_y>
  806974:	83 c0 01             	add    eax,0x1
  806977:	89 05 f3 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bf3],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  80697d:	c7 05 e5 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20be5],0x0        # 42756c <fb_cursor_x>
  806984:	00 00 00 
        }
        if(*s=='\n')continue;
  806987:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80698b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80698e:	3c 0a                	cmp    al,0xa
  806990:	74 7f                	je     806a11 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  806992:	8b 05 e0 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20be0]        # 427578 <max_ch_nr_y>
  806998:	8d 50 ff             	lea    edx,[rax-0x1]
  80699b:	8b 05 cf 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bcf]        # 427570 <fb_cursor_y>
  8069a1:	39 c2                	cmp    edx,eax
  8069a3:	77 0a                	ja     8069af <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  8069a5:	c7 05 c1 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20bc1],0x0        # 427570 <fb_cursor_y>
  8069ac:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8069af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069b3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069b6:	0f be d0             	movsx  edx,al
  8069b9:	8b 05 b1 56 00 00    	mov    eax,DWORD PTR [rip+0x56b1]        # 80c070 <font_size>
  8069bf:	8b 35 ab 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20bab]        # 427570 <fb_cursor_y>
  8069c5:	8b 0d c1 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20bc1]        # 42758c <font_height>
  8069cb:	0f af ce             	imul   ecx,esi
  8069ce:	8b 35 9c 56 00 00    	mov    esi,DWORD PTR [rip+0x569c]        # 80c070 <font_size>
  8069d4:	0f af ce             	imul   ecx,esi
  8069d7:	41 89 c8             	mov    r8d,ecx
  8069da:	8b 35 8c 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20b8c]        # 42756c <fb_cursor_x>
  8069e0:	8b 0d a2 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20ba2]        # 427588 <font_width>
  8069e6:	0f af ce             	imul   ecx,esi
  8069e9:	8b 35 81 56 00 00    	mov    esi,DWORD PTR [rip+0x5681]        # 80c070 <font_size>
  8069ef:	0f af ce             	imul   ecx,esi
  8069f2:	89 cf                	mov    edi,ecx
  8069f4:	89 d1                	mov    ecx,edx
  8069f6:	89 c2                	mov    edx,eax
  8069f8:	44 89 c6             	mov    esi,r8d
  8069fb:	e8 e4 fc ff ff       	call   8066e4 <draw_letter>
        fb_cursor_x+=1;
  806a00:	8b 05 66 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b66]        # 42756c <fb_cursor_x>
  806a06:	83 c0 01             	add    eax,0x1
  806a09:	89 05 5d 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b5d],eax        # 42756c <fb_cursor_x>
  806a0f:	eb 01                	jmp    806a12 <print+0xd4>
        if(*s=='\n')continue;
  806a11:	90                   	nop
    for(;*s;s++){
  806a12:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806a17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a1e:	84 c0                	test   al,al
  806a20:	0f 85 2d ff ff ff    	jne    806953 <print+0x15>
    }
}
  806a26:	90                   	nop
  806a27:	90                   	nop
  806a28:	c9                   	leave  
  806a29:	c3                   	ret    

0000000000806a2a <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806a2a:	f3 0f 1e fa          	endbr64 
  806a2e:	55                   	push   rbp
  806a2f:	48 89 e5             	mov    rbp,rsp
  806a32:	48 83 ec 50          	sub    rsp,0x50
  806a36:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806a3a:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806a3e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806a45:	00 
    int tmpnamelen = 0;
  806a46:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  806a4d:	48 8b 05 54 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b54]        # 4275a8 <root_sb>
  806a54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806a57:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  806a5b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806a62:	00 

    while(*name == '/')
  806a63:	eb 05                	jmp    806a6a <path_walk+0x40>
        name++;
  806a65:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  806a6a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a6e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a71:	3c 2f                	cmp    al,0x2f
  806a73:	74 f0                	je     806a65 <path_walk+0x3b>

    if(!*name)
  806a75:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a7c:	84 c0                	test   al,al
  806a7e:	75 09                	jne    806a89 <path_walk+0x5f>
    {
        return parent;
  806a80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a84:	e9 1b 02 00 00       	jmp    806ca4 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  806a89:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a8d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  806a91:	eb 05                	jmp    806a98 <path_walk+0x6e>
            name++;
  806a93:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  806a98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a9f:	84 c0                	test   al,al
  806aa1:	74 0b                	je     806aae <path_walk+0x84>
  806aa3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806aa7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806aaa:	3c 2f                	cmp    al,0x2f
  806aac:	75 e5                	jne    806a93 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806aae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ab2:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806ab6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806ab9:	be 00 00 00 00       	mov    esi,0x0
  806abe:	bf 48 00 00 00       	mov    edi,0x48
  806ac3:	b8 00 00 00 00       	mov    eax,0x0
  806ac8:	e8 dd a7 ff ff       	call   8012aa <vmalloc>
  806acd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806ad1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ad5:	ba 48 00 00 00       	mov    edx,0x48
  806ada:	be 00 00 00 00       	mov    esi,0x0
  806adf:	48 89 c7             	mov    rdi,rax
  806ae2:	e8 09 4c 00 00       	call   80b6f0 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806ae7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806aea:	83 c0 01             	add    eax,0x1
  806aed:	be 00 00 00 00       	mov    esi,0x0
  806af2:	89 c7                	mov    edi,eax
  806af4:	b8 00 00 00 00       	mov    eax,0x0
  806af9:	e8 ac a7 ff ff       	call   8012aa <vmalloc>
  806afe:	48 89 c2             	mov    rdx,rax
  806b01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b05:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806b08:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b0b:	83 c0 01             	add    eax,0x1
  806b0e:	48 63 d0             	movsxd rdx,eax
  806b11:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806b18:	be 00 00 00 00       	mov    esi,0x0
  806b1d:	48 89 c7             	mov    rdi,rax
  806b20:	e8 cb 4b 00 00       	call   80b6f0 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806b25:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b28:	48 63 d0             	movsxd rdx,eax
  806b2b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b2f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806b32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b36:	48 89 ce             	mov    rsi,rcx
  806b39:	48 89 c7             	mov    rdi,rax
  806b3c:	e8 00 4b 00 00       	call   80b641 <memcpy>
        path->name_length = tmpnamelen;
  806b41:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b45:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806b48:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806b4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b4f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806b53:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806b57:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  806b5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b5f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806b63:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806b67:	48 89 d6             	mov    rsi,rdx
  806b6a:	48 89 c7             	mov    rdi,rax
  806b6d:	ff d1                	call   rcx
  806b6f:	48 85 c0             	test   rax,rax
  806b72:	75 3e                	jne    806bb2 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  806b74:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b78:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806b7b:	48 89 c6             	mov    rsi,rax
  806b7e:	bf 77 3c 81 00       	mov    edi,0x813c77
  806b83:	b8 00 00 00 00       	mov    eax,0x0
  806b88:	e8 8b a1 ff ff       	call   800d18 <printf>
            vmfree(path->name);
  806b8d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806b94:	48 89 c7             	mov    rdi,rax
  806b97:	e8 9d a7 ff ff       	call   801339 <vmfree>
            vmfree(path);
  806b9c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ba0:	48 89 c7             	mov    rdi,rax
  806ba3:	e8 91 a7 ff ff       	call   801339 <vmfree>
            return NULL;
  806ba8:	b8 00 00 00 00       	mov    eax,0x0
  806bad:	e9 f2 00 00 00       	jmp    806ca4 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  806bb2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bb6:	48 83 c0 10          	add    rax,0x10
  806bba:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806bbe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806bc2:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806bc6:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806bc9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806bcd:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806bd1:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806bd5:	90                   	nop
        list_init(&path->subdirs_list);
  806bd6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bda:	48 83 c0 20          	add    rax,0x20
  806bde:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  806be2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806be6:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806bea:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806bed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806bf1:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806bf5:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806bf9:	90                   	nop
        path->parent = parent;
  806bfa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bfe:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806c02:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  806c06:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c0a:	48 83 c0 10          	add    rax,0x10
  806c0e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806c12:	48 83 c2 20          	add    rdx,0x20
  806c16:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806c1a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  806c1e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c22:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  806c26:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c2a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  806c2e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c32:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806c36:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  806c39:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c3d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806c41:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806c45:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  806c48:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c4c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806c50:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806c54:	90                   	nop

        if(!*name)
  806c55:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c5c:	84 c0                	test   al,al
  806c5e:	74 2a                	je     806c8a <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  806c60:	eb 05                	jmp    806c67 <path_walk+0x23d>
            name++;
  806c62:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  806c67:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c6b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c6e:	3c 2f                	cmp    al,0x2f
  806c70:	74 f0                	je     806c62 <path_walk+0x238>
        if(!*name)
  806c72:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c79:	84 c0                	test   al,al
  806c7b:	74 10                	je     806c8d <path_walk+0x263>
            goto last_slash;

        parent = path;
  806c7d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c81:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  806c85:	e9 ff fd ff ff       	jmp    806a89 <path_walk+0x5f>
            goto last_component;
  806c8a:	90                   	nop
  806c8b:	eb 01                	jmp    806c8e <path_walk+0x264>
            goto last_slash;
  806c8d:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  806c8e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806c92:	83 e0 01             	and    eax,0x1
  806c95:	48 85 c0             	test   rax,rax
  806c98:	74 06                	je     806ca0 <path_walk+0x276>
    {
        return parent;
  806c9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c9e:	eb 04                	jmp    806ca4 <path_walk+0x27a>
    }

    return path;
  806ca0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  806ca4:	c9                   	leave  
  806ca5:	c3                   	ret    

0000000000806ca6 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  806ca6:	f3 0f 1e fa          	endbr64 
  806caa:	55                   	push   rbp
  806cab:	48 89 e5             	mov    rbp,rsp
  806cae:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806cb2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806cb6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806cba:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  806cbe:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  806cc2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cc6:	83 c0 18             	add    eax,0x18
}
  806cc9:	5d                   	pop    rbp
  806cca:	c3                   	ret    

0000000000806ccb <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  806ccb:	f3 0f 1e fa          	endbr64 
  806ccf:	55                   	push   rbp
  806cd0:	48 89 e5             	mov    rbp,rsp
  806cd3:	48 83 ec 30          	sub    rsp,0x30
  806cd7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  806cdb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806cdf:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  806ce3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806cea:	00 

    for(p = &filesystem;p;p = p->next)
  806ceb:	48 c7 45 f8 80 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c080
  806cf2:	00 
  806cf3:	eb 40                	jmp    806d35 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  806cf5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806cf9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806cfc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806d00:	48 89 d6             	mov    rsi,rdx
  806d03:	48 89 c7             	mov    rdi,rax
  806d06:	e8 d4 4b 00 00       	call   80b8df <strcmp>
  806d0b:	85 c0                	test   eax,eax
  806d0d:	75 1a                	jne    806d29 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  806d0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d13:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  806d17:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806d1b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806d1f:	48 89 d6             	mov    rsi,rdx
  806d22:	48 89 c7             	mov    rdi,rax
  806d25:	ff d1                	call   rcx
  806d27:	eb 18                	jmp    806d41 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  806d29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d2d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806d35:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806d3a:	75 b9                	jne    806cf5 <mount_fs+0x2a>
        }
    return 0;
  806d3c:	b8 00 00 00 00       	mov    eax,0x0
}
  806d41:	c9                   	leave  
  806d42:	c3                   	ret    

0000000000806d43 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  806d43:	f3 0f 1e fa          	endbr64 
  806d47:	55                   	push   rbp
  806d48:	48 89 e5             	mov    rbp,rsp
  806d4b:	48 83 ec 20          	sub    rsp,0x20
  806d4f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  806d53:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806d5a:	00 

    for(p = &filesystem;p;p = p->next)
  806d5b:	48 c7 45 f8 80 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c080
  806d62:	00 
  806d63:	eb 30                	jmp    806d95 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  806d65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d69:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806d6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d70:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806d73:	48 89 d6             	mov    rsi,rdx
  806d76:	48 89 c7             	mov    rdi,rax
  806d79:	e8 61 4b 00 00       	call   80b8df <strcmp>
  806d7e:	85 c0                	test   eax,eax
  806d80:	75 07                	jne    806d89 <register_filesystem+0x46>
            return 0;
  806d82:	b8 00 00 00 00       	mov    eax,0x0
  806d87:	eb 32                	jmp    806dbb <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  806d89:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d8d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d91:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806d95:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806d9a:	75 c9                	jne    806d65 <register_filesystem+0x22>

    fs->next = filesystem.next;
  806d9c:	48 8b 15 f5 52 00 00 	mov    rdx,QWORD PTR [rip+0x52f5]        # 80c098 <filesystem+0x18>
  806da3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806da7:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  806dab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806daf:	48 89 05 e2 52 00 00 	mov    QWORD PTR [rip+0x52e2],rax        # 80c098 <filesystem+0x18>

    return 1;
  806db6:	b8 01 00 00 00       	mov    eax,0x1
}
  806dbb:	c9                   	leave  
  806dbc:	c3                   	ret    

0000000000806dbd <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  806dbd:	f3 0f 1e fa          	endbr64 
  806dc1:	55                   	push   rbp
  806dc2:	48 89 e5             	mov    rbp,rsp
  806dc5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  806dc9:	48 c7 45 f8 80 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c080
  806dd0:	00 

    while(p->next)
  806dd1:	eb 41                	jmp    806e14 <unregister_filesystem+0x57>
        if(p->next == fs)
  806dd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806dd7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806ddb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806ddf:	75 27                	jne    806e08 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  806de1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806de5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806de9:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  806ded:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806df1:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  806df5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806df9:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806e00:	00 
            return 1;
  806e01:	b8 01 00 00 00       	mov    eax,0x1
  806e06:	eb 1e                	jmp    806e26 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  806e08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e0c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806e10:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  806e14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e18:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806e1c:	48 85 c0             	test   rax,rax
  806e1f:	75 b2                	jne    806dd3 <unregister_filesystem+0x16>
    return 0;
  806e21:	b8 00 00 00 00       	mov    eax,0x0
}
  806e26:	5d                   	pop    rbp
  806e27:	c3                   	ret    

0000000000806e28 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  806e28:	f3 0f 1e fa          	endbr64 
  806e2c:	55                   	push   rbp
  806e2d:	48 89 e5             	mov    rbp,rsp
  806e30:	48 83 ec 10          	sub    rsp,0x10
  806e34:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  806e38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e3c:	48 89 c7             	mov    rdi,rax
  806e3f:	b8 00 00 00 00       	mov    eax,0x0
  806e44:	e8 cf 9e ff ff       	call   800d18 <printf>
    return 0;
  806e49:	b8 00 00 00 00       	mov    eax,0x0
}
  806e4e:	c9                   	leave  
  806e4f:	c3                   	ret    

0000000000806e50 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  806e50:	f3 0f 1e fa          	endbr64 
  806e54:	55                   	push   rbp
  806e55:	48 89 e5             	mov    rbp,rsp
  806e58:	48 83 ec 50          	sub    rsp,0x50
  806e5c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806e60:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  806e63:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806e6a:	00 
    long pathlen = 0;
  806e6b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806e72:	00 
    long error = 0;
  806e73:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806e7a:	00 
    struct dir_entry * dentry = NULL;
  806e7b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  806e82:	00 
    struct file * filp = NULL;
  806e83:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  806e8a:	00 
    struct file ** f = NULL;
  806e8b:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  806e92:	00 
    int fd = -1;
  806e93:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  806e9a:	b8 00 00 00 00       	mov    eax,0x0
  806e9f:	e8 06 a4 ff ff       	call   8012aa <vmalloc>
  806ea4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  806ea8:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  806ead:	75 0c                	jne    806ebb <sys_open+0x6b>
        return -ENOMEM;
  806eaf:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  806eb6:	e9 aa 02 00 00       	jmp    807165 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  806ebb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ebf:	ba 00 10 00 00       	mov    edx,0x1000
  806ec4:	be 00 00 00 00       	mov    esi,0x0
  806ec9:	48 89 c7             	mov    rdi,rax
  806ecc:	e8 1f 48 00 00       	call   80b6f0 <memset>
    pathlen = strlen(filename);
  806ed1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ed5:	48 89 c7             	mov    rdi,rax
  806ed8:	e8 81 4a 00 00       	call   80b95e <strlen>
  806edd:	48 98                	cdqe   
  806edf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  806ee3:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  806ee8:	7f 18                	jg     806f02 <sys_open+0xb2>
    {
        vmfree(path);
  806eea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806eee:	48 89 c7             	mov    rdi,rax
  806ef1:	e8 43 a4 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  806ef6:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806efd:	e9 63 02 00 00       	jmp    807165 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  806f02:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  806f09:	00 
  806f0a:	7e 18                	jle    806f24 <sys_open+0xd4>
    {
        vmfree(path);
  806f0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f10:	48 89 c7             	mov    rdi,rax
  806f13:	e8 21 a4 ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  806f18:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  806f1f:	e9 41 02 00 00       	jmp    807165 <sys_open+0x315>
    }
    strcpy(filename,path);
  806f24:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806f28:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806f2c:	48 89 d6             	mov    rsi,rdx
  806f2f:	48 89 c7             	mov    rdi,rax
  806f32:	e8 08 48 00 00       	call   80b73f <strcpy>

    dentry = path_walk(path,0);
  806f37:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f3b:	be 00 00 00 00       	mov    esi,0x0
  806f40:	48 89 c7             	mov    rdi,rax
  806f43:	e8 e2 fa ff ff       	call   806a2a <path_walk>
  806f48:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  806f4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f50:	48 89 c7             	mov    rdi,rax
  806f53:	e8 e1 a3 ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  806f58:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806f5d:	75 0c                	jne    806f6b <sys_open+0x11b>
        return -ENOENT;
  806f5f:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  806f66:	e9 fa 01 00 00       	jmp    807165 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  806f6b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806f6e:	25 00 40 00 00       	and    eax,0x4000
  806f73:	85 c0                	test   eax,eax
  806f75:	74 1e                	je     806f95 <sys_open+0x145>
  806f77:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f7b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f7f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806f83:	48 83 f8 02          	cmp    rax,0x2
  806f87:	74 0c                	je     806f95 <sys_open+0x145>
        return -ENOTDIR;
  806f89:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806f90:	e9 d0 01 00 00       	jmp    807165 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  806f95:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806f98:	25 00 40 00 00       	and    eax,0x4000
  806f9d:	85 c0                	test   eax,eax
  806f9f:	75 1e                	jne    806fbf <sys_open+0x16f>
  806fa1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fa5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806fa9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806fad:	48 83 f8 02          	cmp    rax,0x2
  806fb1:	75 0c                	jne    806fbf <sys_open+0x16f>
        return -EISDIR;
  806fb3:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  806fba:	e9 a6 01 00 00       	jmp    807165 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  806fbf:	b8 00 00 00 00       	mov    eax,0x0
  806fc4:	e8 e1 a2 ff ff       	call   8012aa <vmalloc>
  806fc9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  806fcd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fd1:	ba 28 00 00 00       	mov    edx,0x28
  806fd6:	be 00 00 00 00       	mov    esi,0x0
  806fdb:	48 89 c7             	mov    rdi,rax
  806fde:	e8 0d 47 00 00       	call   80b6f0 <memset>
    filp->dentry = dentry;
  806fe3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fe7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806feb:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  806fef:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806ff2:	48 63 d0             	movsxd rdx,eax
  806ff5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806ff9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  806ffd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807001:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807005:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807009:	83 e0 04             	and    eax,0x4
  80700c:	48 85 c0             	test   rax,rax
  80700f:	74 0e                	je     80701f <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807011:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807015:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80701c:	00 
  80701d:	eb 14                	jmp    807033 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80701f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807023:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807027:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80702b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80702f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807033:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807037:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80703b:	48 85 c0             	test   rax,rax
  80703e:	74 33                	je     807073 <sys_open+0x223>
  807040:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807044:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807048:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80704b:	48 85 c0             	test   rax,rax
  80704e:	74 23                	je     807073 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  807050:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807054:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807058:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80705b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80705f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807063:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807067:	48 89 d6             	mov    rsi,rdx
  80706a:	48 89 c7             	mov    rdi,rax
  80706d:	ff d1                	call   rcx
  80706f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  807073:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807078:	74 18                	je     807092 <sys_open+0x242>
    {
        vmfree(filp);
  80707a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80707e:	48 89 c7             	mov    rdi,rax
  807081:	e8 b3 a2 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  807086:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80708d:	e9 d3 00 00 00       	jmp    807165 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  807092:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807096:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80709a:	25 00 02 00 00       	and    eax,0x200
  80709f:	48 85 c0             	test   rax,rax
  8070a2:	74 13                	je     8070b7 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  8070a4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070a8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8070ac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8070b0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8070b7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070bb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8070bf:	25 00 04 00 00       	and    eax,0x400
  8070c4:	48 85 c0             	test   rax,rax
  8070c7:	74 19                	je     8070e2 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8070c9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070cd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8070d1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8070d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8070d8:	48 89 c2             	mov    rdx,rax
  8070db:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070df:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8070e2:	48 8b 05 b7 d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d3b7]        # 4144a0 <current>
  8070e9:	48 05 c4 00 00 00    	add    rax,0xc4
  8070ef:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  8070f3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8070fa:	eb 28                	jmp    807124 <sys_open+0x2d4>
        if(f[i] == NULL)
  8070fc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070ff:	48 98                	cdqe   
  807101:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807108:	00 
  807109:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80710d:	48 01 d0             	add    rax,rdx
  807110:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807113:	48 85 c0             	test   rax,rax
  807116:	75 08                	jne    807120 <sys_open+0x2d0>
        {
            fd = i;
  807118:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80711b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  80711e:	eb 0a                	jmp    80712a <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807120:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807124:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  807128:	7e d2                	jle    8070fc <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80712a:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  80712e:	75 15                	jne    807145 <sys_open+0x2f5>
    {
        vmfree(filp);
  807130:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807134:	48 89 c7             	mov    rdi,rax
  807137:	e8 fd a1 ff ff       	call   801339 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80713c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  807143:	eb 20                	jmp    807165 <sys_open+0x315>
    }
    f[fd] = filp;
  807145:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807148:	48 98                	cdqe   
  80714a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807151:	00 
  807152:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807156:	48 01 c2             	add    rdx,rax
  807159:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80715d:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  807160:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807163:	48 98                	cdqe   
}
  807165:	c9                   	leave  
  807166:	c3                   	ret    

0000000000807167 <sys_close>:

unsigned long sys_close(int fd)
{
  807167:	f3 0f 1e fa          	endbr64 
  80716b:	55                   	push   rbp
  80716c:	48 89 e5             	mov    rbp,rsp
  80716f:	48 83 ec 20          	sub    rsp,0x20
  807173:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  807176:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80717d:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80717e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807182:	78 06                	js     80718a <sys_close+0x23>
  807184:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807188:	7e 0c                	jle    807196 <sys_close+0x2f>
        return -EBADF;
  80718a:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807191:	e9 87 00 00 00       	jmp    80721d <sys_close+0xb6>

    filp = current->openf[fd];
  807196:	48 8b 05 03 d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d303]        # 4144a0 <current>
  80719d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8071a0:	48 63 d2             	movsxd rdx,edx
  8071a3:	48 83 c2 18          	add    rdx,0x18
  8071a7:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8071ac:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8071b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071b4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071b8:	48 85 c0             	test   rax,rax
  8071bb:	74 35                	je     8071f2 <sys_close+0x8b>
  8071bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071c1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071c5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8071c9:	48 85 c0             	test   rax,rax
  8071cc:	74 24                	je     8071f2 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  8071ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071d2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071d6:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8071da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071de:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8071e2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8071e6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8071ea:	48 89 d6             	mov    rsi,rdx
  8071ed:	48 89 c7             	mov    rdi,rax
  8071f0:	ff d1                	call   rcx

    vmfree(filp);
  8071f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071f6:	48 89 c7             	mov    rdi,rax
  8071f9:	e8 3b a1 ff ff       	call   801339 <vmfree>
    current->openf[fd] = NULL;
  8071fe:	48 8b 05 9b d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d29b]        # 4144a0 <current>
  807205:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807208:	48 63 d2             	movsxd rdx,edx
  80720b:	48 83 c2 18          	add    rdx,0x18
  80720f:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  807216:	00 00 

    return 0;
  807218:	b8 00 00 00 00       	mov    eax,0x0
}
  80721d:	c9                   	leave  
  80721e:	c3                   	ret    

000000000080721f <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  80721f:	f3 0f 1e fa          	endbr64 
  807223:	55                   	push   rbp
  807224:	48 89 e5             	mov    rbp,rsp
  807227:	48 83 ec 30          	sub    rsp,0x30
  80722b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80722e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807232:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807236:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80723d:	00 
    unsigned long ret = 0;
  80723e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807245:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807246:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80724a:	78 06                	js     807252 <sys_read+0x33>
  80724c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807250:	7e 09                	jle    80725b <sys_read+0x3c>
        return -EBADF;
  807252:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807259:	eb 72                	jmp    8072cd <sys_read+0xae>
    if(count < 0)
  80725b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807260:	79 09                	jns    80726b <sys_read+0x4c>
        return -EINVAL;
  807262:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807269:	eb 62                	jmp    8072cd <sys_read+0xae>

    filp = current->openf[fd];
  80726b:	48 8b 05 2e d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d22e]        # 4144a0 <current>
  807272:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807275:	48 63 d2             	movsxd rdx,edx
  807278:	48 83 c2 18          	add    rdx,0x18
  80727c:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807281:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  807285:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807289:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80728d:	48 85 c0             	test   rax,rax
  807290:	74 37                	je     8072c9 <sys_read+0xaa>
  807292:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807296:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80729a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80729e:	48 85 c0             	test   rax,rax
  8072a1:	74 26                	je     8072c9 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  8072a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072a7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072ab:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  8072af:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8072b3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8072b7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8072bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072bf:	48 89 c7             	mov    rdi,rax
  8072c2:	41 ff d0             	call   r8
  8072c5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8072c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8072cd:	c9                   	leave  
  8072ce:	c3                   	ret    

00000000008072cf <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  8072cf:	f3 0f 1e fa          	endbr64 
  8072d3:	55                   	push   rbp
  8072d4:	48 89 e5             	mov    rbp,rsp
  8072d7:	48 83 ec 30          	sub    rsp,0x30
  8072db:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8072de:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8072e2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8072e6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8072ed:	00 
    unsigned long ret = 0;
  8072ee:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8072f5:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8072f6:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8072fa:	78 06                	js     807302 <sys_write+0x33>
  8072fc:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807300:	7e 09                	jle    80730b <sys_write+0x3c>
        return -EBADF;
  807302:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807309:	eb 72                	jmp    80737d <sys_write+0xae>
    if(count < 0)
  80730b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807310:	79 09                	jns    80731b <sys_write+0x4c>
        return -EINVAL;
  807312:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807319:	eb 62                	jmp    80737d <sys_write+0xae>

    filp = current->openf[fd];
  80731b:	48 8b 05 7e d1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d17e]        # 4144a0 <current>
  807322:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807325:	48 63 d2             	movsxd rdx,edx
  807328:	48 83 c2 18          	add    rdx,0x18
  80732c:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807331:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807335:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807339:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80733d:	48 85 c0             	test   rax,rax
  807340:	74 37                	je     807379 <sys_write+0xaa>
  807342:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807346:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80734a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80734e:	48 85 c0             	test   rax,rax
  807351:	74 26                	je     807379 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  807353:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807357:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80735b:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  80735f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807363:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807367:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80736b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80736f:	48 89 c7             	mov    rdi,rax
  807372:	41 ff d0             	call   r8
  807375:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807379:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80737d:	c9                   	leave  
  80737e:	c3                   	ret    

000000000080737f <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  80737f:	f3 0f 1e fa          	endbr64 
  807383:	55                   	push   rbp
  807384:	48 89 e5             	mov    rbp,rsp
  807387:	48 83 ec 20          	sub    rsp,0x20
  80738b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80738e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807392:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  807395:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80739c:	00 
    unsigned long ret = 0;
  80739d:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8073a4:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  8073a5:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8073a9:	78 06                	js     8073b1 <sys_lseek+0x32>
  8073ab:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8073af:	7e 09                	jle    8073ba <sys_lseek+0x3b>
        return -EBADF;
  8073b1:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8073b8:	eb 78                	jmp    807432 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  8073ba:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8073be:	78 06                	js     8073c6 <sys_lseek+0x47>
  8073c0:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  8073c4:	7e 09                	jle    8073cf <sys_lseek+0x50>
        return -EINVAL;
  8073c6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8073cd:	eb 63                	jmp    807432 <sys_lseek+0xb3>

    filp = current->openf[filds];
  8073cf:	48 8b 05 ca d0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d0ca]        # 4144a0 <current>
  8073d6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8073d9:	48 63 d2             	movsxd rdx,edx
  8073dc:	48 83 c2 18          	add    rdx,0x18
  8073e0:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8073e5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  8073e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8073ed:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8073f1:	48 85 c0             	test   rax,rax
  8073f4:	74 38                	je     80742e <sys_lseek+0xaf>
  8073f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8073fa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8073fe:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807402:	48 85 c0             	test   rax,rax
  807405:	74 27                	je     80742e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807407:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80740b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80740f:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807413:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807416:	48 63 d0             	movsxd rdx,eax
  807419:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80741d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807421:	48 89 ce             	mov    rsi,rcx
  807424:	48 89 c7             	mov    rdi,rax
  807427:	41 ff d0             	call   r8
  80742a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80742e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807432:	c9                   	leave  
  807433:	c3                   	ret    

0000000000807434 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807434:	f3 0f 1e fa          	endbr64 
  807438:	55                   	push   rbp
  807439:	48 89 e5             	mov    rbp,rsp
  80743c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  807440:	48 8b 05 59 d0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d059]        # 4144a0 <current>
  807447:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  80744e:	48 2d d0 00 00 00    	sub    rax,0xd0
  807454:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  807458:	bf a0 3c 81 00       	mov    edi,0x813ca0
  80745d:	b8 00 00 00 00       	mov    eax,0x0
  807462:	e8 b1 98 ff ff       	call   800d18 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  807467:	90                   	nop
  807468:	c9                   	leave  
  807469:	c3                   	ret    

000000000080746a <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  80746a:	f3 0f 1e fa          	endbr64 
  80746e:	55                   	push   rbp
  80746f:	48 89 e5             	mov    rbp,rsp
  807472:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807476:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80747a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80747d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  807481:	90                   	nop
  807482:	5d                   	pop    rbp
  807483:	c3                   	ret    

0000000000807484 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  807484:	f3 0f 1e fa          	endbr64 
  807488:	55                   	push   rbp
  807489:	48 89 e5             	mov    rbp,rsp
  80748c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  807490:	90                   	nop
  807491:	5d                   	pop    rbp
  807492:	c3                   	ret    

0000000000807493 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  807493:	f3 0f 1e fa          	endbr64 
  807497:	55                   	push   rbp
  807498:	48 89 e5             	mov    rbp,rsp
  80749b:	48 83 ec 10          	sub    rsp,0x10
  80749f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8074a3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  8074a7:	bf ab 3c 81 00       	mov    edi,0x813cab
  8074ac:	b8 00 00 00 00       	mov    eax,0x0
  8074b1:	e8 62 98 ff ff       	call   800d18 <printf>
    switch(cmd)
  8074b6:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8074bb:	74 09                	je     8074c6 <sys_reboot+0x33>
  8074bd:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  8074c2:	74 13                	je     8074d7 <sys_reboot+0x44>
  8074c4:	eb 22                	jmp    8074e8 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  8074c6:	be fe 00 00 00       	mov    esi,0xfe
  8074cb:	bf 64 00 00 00       	mov    edi,0x64
  8074d0:	e8 fb e1 ff ff       	call   8056d0 <outb>
            break;
  8074d5:	eb 21                	jmp    8074f8 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  8074d7:	bf b8 3c 81 00       	mov    edi,0x813cb8
  8074dc:	b8 00 00 00 00       	mov    eax,0x0
  8074e1:	e8 32 98 ff ff       	call   800d18 <printf>
            break;
  8074e6:	eb 10                	jmp    8074f8 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  8074e8:	bf d8 3c 81 00       	mov    edi,0x813cd8
  8074ed:	b8 00 00 00 00       	mov    eax,0x0
  8074f2:	e8 21 98 ff ff       	call   800d18 <printf>
            break;
  8074f7:	90                   	nop
    }
    return 0;
  8074f8:	b8 00 00 00 00       	mov    eax,0x0
}
  8074fd:	c9                   	leave  
  8074fe:	c3                   	ret    

00000000008074ff <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  8074ff:	f3 0f 1e fa          	endbr64 
  807503:	55                   	push   rbp
  807504:	48 89 e5             	mov    rbp,rsp
  807507:	48 83 ec 30          	sub    rsp,0x30
  80750b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  80750f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807516:	00 
    long pathlen = 0;
  807517:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80751e:	00 
    struct dir_entry * dentry = NULL;
  80751f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807526:	00 

    printf("sys_chdir\n");
  807527:	bf ef 3c 81 00       	mov    edi,0x813cef
  80752c:	b8 00 00 00 00       	mov    eax,0x0
  807531:	e8 e2 97 ff ff       	call   800d18 <printf>
    path = (char *)vmalloc();
  807536:	b8 00 00 00 00       	mov    eax,0x0
  80753b:	e8 6a 9d ff ff       	call   8012aa <vmalloc>
  807540:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  807544:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807549:	75 0c                	jne    807557 <sys_chdir+0x58>
        return -ENOMEM;
  80754b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807552:	e9 ca 00 00 00       	jmp    807621 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  807557:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80755b:	ba 00 10 00 00       	mov    edx,0x1000
  807560:	be 00 00 00 00       	mov    esi,0x0
  807565:	48 89 c7             	mov    rdi,rax
  807568:	e8 83 41 00 00       	call   80b6f0 <memset>
    pathlen = strlen(filename);
  80756d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807571:	48 89 c7             	mov    rdi,rax
  807574:	e8 e5 43 00 00       	call   80b95e <strlen>
  807579:	48 98                	cdqe   
  80757b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  80757f:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  807584:	7f 18                	jg     80759e <sys_chdir+0x9f>
    {
        vmfree(path);
  807586:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80758a:	48 89 c7             	mov    rdi,rax
  80758d:	e8 a7 9d ff ff       	call   801339 <vmfree>
        return -EFAULT;
  807592:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807599:	e9 83 00 00 00       	jmp    807621 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  80759e:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  8075a5:	00 
  8075a6:	7e 15                	jle    8075bd <sys_chdir+0xbe>
    {
        vmfree(path);
  8075a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075ac:	48 89 c7             	mov    rdi,rax
  8075af:	e8 85 9d ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  8075b4:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8075bb:	eb 64                	jmp    807621 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8075bd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8075c1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075c5:	48 89 d6             	mov    rsi,rdx
  8075c8:	48 89 c7             	mov    rdi,rax
  8075cb:	e8 6f 41 00 00       	call   80b73f <strcpy>

    dentry = path_walk(path,0);
  8075d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075d4:	be 00 00 00 00       	mov    esi,0x0
  8075d9:	48 89 c7             	mov    rdi,rax
  8075dc:	e8 49 f4 ff ff       	call   806a2a <path_walk>
  8075e1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  8075e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075e9:	48 89 c7             	mov    rdi,rax
  8075ec:	e8 48 9d ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  8075f1:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8075f6:	75 09                	jne    807601 <sys_chdir+0x102>
        return -ENOENT;
  8075f8:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8075ff:	eb 20                	jmp    807621 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807601:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807605:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807609:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80760d:	48 83 f8 02          	cmp    rax,0x2
  807611:	74 09                	je     80761c <sys_chdir+0x11d>
        return -ENOTDIR;
  807613:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  80761a:	eb 05                	jmp    807621 <sys_chdir+0x122>
    return 0;
  80761c:	b8 00 00 00 00       	mov    eax,0x0
}
  807621:	c9                   	leave  
  807622:	c3                   	ret    

0000000000807623 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807623:	f3 0f 1e fa          	endbr64 
  807627:	55                   	push   rbp
  807628:	48 89 e5             	mov    rbp,rsp
  80762b:	48 83 ec 30          	sub    rsp,0x30
  80762f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807632:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807636:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80763a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807641:	00 
    unsigned long ret = 0;
  807642:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807649:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  80764a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80764e:	78 06                	js     807656 <sys_getdents+0x33>
  807650:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807654:	7e 09                	jle    80765f <sys_getdents+0x3c>
        return -EBADF;
  807656:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80765d:	eb 72                	jmp    8076d1 <sys_getdents+0xae>
    if(count < 0)
  80765f:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807664:	79 09                	jns    80766f <sys_getdents+0x4c>
        return -EINVAL;
  807666:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80766d:	eb 62                	jmp    8076d1 <sys_getdents+0xae>

    filp = current->openf[fd];
  80766f:	48 8b 05 2a ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ce2a]        # 4144a0 <current>
  807676:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807679:	48 63 d2             	movsxd rdx,edx
  80767c:	48 83 c2 18          	add    rdx,0x18
  807680:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807685:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807689:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80768d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807691:	48 85 c0             	test   rax,rax
  807694:	74 37                	je     8076cd <sys_getdents+0xaa>
  807696:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80769a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80769e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076a2:	48 85 c0             	test   rax,rax
  8076a5:	74 26                	je     8076cd <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8076a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076ab:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076af:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8076b3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8076b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076bb:	ba a6 6c 80 00       	mov    edx,0x806ca6
  8076c0:	48 89 ce             	mov    rsi,rcx
  8076c3:	48 89 c7             	mov    rdi,rax
  8076c6:	41 ff d0             	call   r8
  8076c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8076cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8076d1:	c9                   	leave  
  8076d2:	c3                   	ret    

00000000008076d3 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8076d3:	f3 0f 1e fa          	endbr64 
  8076d7:	55                   	push   rbp
  8076d8:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8076db:	0f b6 05 eb 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200eb]        # 4277cd <k_shift>
  8076e2:	84 c0                	test   al,al
  8076e4:	0f 94 c0             	sete   al
  8076e7:	88 05 e0 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200e0],al        # 4277cd <k_shift>
}
  8076ed:	90                   	nop
  8076ee:	5d                   	pop    rbp
  8076ef:	c3                   	ret    

00000000008076f0 <ctrl>:
void ctrl()
{
  8076f0:	f3 0f 1e fa          	endbr64 
  8076f4:	55                   	push   rbp
  8076f5:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8076f8:	0f b6 05 cf 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200cf]        # 4277ce <k_ctrl>
  8076ff:	84 c0                	test   al,al
  807701:	0f 94 c0             	sete   al
  807704:	88 05 c4 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200c4],al        # 4277ce <k_ctrl>
}
  80770a:	90                   	nop
  80770b:	5d                   	pop    rbp
  80770c:	c3                   	ret    

000000000080770d <capslock>:
void capslock()
{
  80770d:	f3 0f 1e fa          	endbr64 
  807711:	55                   	push   rbp
  807712:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807715:	0f b6 05 b3 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200b3]        # 4277cf <k_capslock>
  80771c:	84 c0                	test   al,al
  80771e:	0f 94 c0             	sete   al
  807721:	88 05 a8 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200a8],al        # 4277cf <k_capslock>
}
  807727:	90                   	nop
  807728:	5d                   	pop    rbp
  807729:	c3                   	ret    

000000000080772a <to_ascii>:
char to_ascii(char scan_code)
{
  80772a:	f3 0f 1e fa          	endbr64 
  80772e:	55                   	push   rbp
  80772f:	48 89 e5             	mov    rbp,rsp
  807732:	89 f8                	mov    eax,edi
  807734:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807737:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80773e:	e9 c7 00 00 00       	jmp    80780a <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807743:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807746:	48 63 d0             	movsxd rdx,eax
  807749:	48 89 d0             	mov    rax,rdx
  80774c:	48 c1 e0 02          	shl    rax,0x2
  807750:	48 01 d0             	add    rax,rdx
  807753:	48 05 62 3e 81 00    	add    rax,0x813e62
  807759:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80775c:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  80775f:	0f 85 a1 00 00 00    	jne    807806 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807765:	0f b6 05 63 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20063]        # 4277cf <k_capslock>
  80776c:	84 c0                	test   al,al
  80776e:	74 55                	je     8077c5 <to_ascii+0x9b>
  807770:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807773:	48 63 d0             	movsxd rdx,eax
  807776:	48 89 d0             	mov    rax,rdx
  807779:	48 c1 e0 02          	shl    rax,0x2
  80777d:	48 01 d0             	add    rax,rdx
  807780:	48 05 60 3e 81 00    	add    rax,0x813e60
  807786:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807789:	3c 60                	cmp    al,0x60
  80778b:	7e 38                	jle    8077c5 <to_ascii+0x9b>
  80778d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807790:	48 63 d0             	movsxd rdx,eax
  807793:	48 89 d0             	mov    rax,rdx
  807796:	48 c1 e0 02          	shl    rax,0x2
  80779a:	48 01 d0             	add    rax,rdx
  80779d:	48 05 60 3e 81 00    	add    rax,0x813e60
  8077a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077a6:	3c 7a                	cmp    al,0x7a
  8077a8:	7f 1b                	jg     8077c5 <to_ascii+0x9b>
  8077aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077ad:	48 63 d0             	movsxd rdx,eax
  8077b0:	48 89 d0             	mov    rax,rdx
  8077b3:	48 c1 e0 02          	shl    rax,0x2
  8077b7:	48 01 d0             	add    rax,rdx
  8077ba:	48 05 61 3e 81 00    	add    rax,0x813e61
  8077c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077c3:	eb 54                	jmp    807819 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8077c5:	0f b6 05 01 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20001]        # 4277cd <k_shift>
  8077cc:	84 c0                	test   al,al
  8077ce:	74 1b                	je     8077eb <to_ascii+0xc1>
  8077d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077d3:	48 63 d0             	movsxd rdx,eax
  8077d6:	48 89 d0             	mov    rax,rdx
  8077d9:	48 c1 e0 02          	shl    rax,0x2
  8077dd:	48 01 d0             	add    rax,rdx
  8077e0:	48 05 61 3e 81 00    	add    rax,0x813e61
  8077e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077e9:	eb 2e                	jmp    807819 <to_ascii+0xef>
            else return key_map[i].ascii;
  8077eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077ee:	48 63 d0             	movsxd rdx,eax
  8077f1:	48 89 d0             	mov    rax,rdx
  8077f4:	48 c1 e0 02          	shl    rax,0x2
  8077f8:	48 01 d0             	add    rax,rdx
  8077fb:	48 05 60 3e 81 00    	add    rax,0x813e60
  807801:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807804:	eb 13                	jmp    807819 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807806:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80780a:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  80780e:	0f 8e 2f ff ff ff    	jle    807743 <to_ascii+0x19>
        }

    return '\0';
  807814:	b8 00 00 00 00       	mov    eax,0x0
}
  807819:	5d                   	pop    rbp
  80781a:	c3                   	ret    

000000000080781b <init_kb>:
int init_kb()
{
  80781b:	f3 0f 1e fa          	endbr64 
  80781f:	55                   	push   rbp
  807820:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807823:	bf a0 3d 81 00       	mov    edi,0x813da0
  807828:	e8 4f ad ff ff       	call   80257c <reg_device>
    reg_driver(&drv_keyboard);
  80782d:	bf 00 3d 81 00       	mov    edi,0x813d00
  807832:	e8 2d b0 ff ff       	call   802864 <reg_driver>
}
  807837:	90                   	nop
  807838:	5d                   	pop    rbp
  807839:	c3                   	ret    

000000000080783a <key_proc>:
int key_proc()
{
  80783a:	f3 0f 1e fa          	endbr64 
  80783e:	55                   	push   rbp
  80783f:	48 89 e5             	mov    rbp,rsp
  807842:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807846:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  80784a:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  80784e:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807852:	bf 60 00 00 00       	mov    edi,0x60
  807857:	e8 8d de ff ff       	call   8056e9 <inb>
  80785c:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  80785f:	8b 05 47 48 00 00    	mov    eax,DWORD PTR [rip+0x4847]        # 80c0ac <key_bufq+0xc>
  807865:	83 c0 01             	add    eax,0x1
  807868:	8b 0d 42 48 00 00    	mov    ecx,DWORD PTR [rip+0x4842]        # 80c0b0 <key_bufq+0x10>
  80786e:	99                   	cdq    
  80786f:	f7 f9                	idiv   ecx
  807871:	8b 05 31 48 00 00    	mov    eax,DWORD PTR [rip+0x4831]        # 80c0a8 <key_bufq+0x8>
  807877:	39 c2                	cmp    edx,eax
  807879:	74 32                	je     8078ad <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  80787b:	48 8b 15 1e 48 00 00 	mov    rdx,QWORD PTR [rip+0x481e]        # 80c0a0 <key_bufq>
  807882:	8b 05 24 48 00 00    	mov    eax,DWORD PTR [rip+0x4824]        # 80c0ac <key_bufq+0xc>
  807888:	48 98                	cdqe   
  80788a:	48 01 c2             	add    rdx,rax
  80788d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807891:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  807893:	8b 05 13 48 00 00    	mov    eax,DWORD PTR [rip+0x4813]        # 80c0ac <key_bufq+0xc>
  807899:	83 c0 01             	add    eax,0x1
  80789c:	8b 0d 0e 48 00 00    	mov    ecx,DWORD PTR [rip+0x480e]        # 80c0b0 <key_bufq+0x10>
  8078a2:	99                   	cdq    
  8078a3:	f7 f9                	idiv   ecx
  8078a5:	89 d0                	mov    eax,edx
  8078a7:	89 05 ff 47 00 00    	mov    DWORD PTR [rip+0x47ff],eax        # 80c0ac <key_bufq+0xc>
    }

    if(scan1==0x48)
  8078ad:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8078b1:	75 0a                	jne    8078bd <key_proc+0x83>
        scr_up();
  8078b3:	b8 00 00 00 00       	mov    eax,0x0
  8078b8:	e8 53 ef ff ff       	call   806810 <scr_up>
    if(scan1==0x50)
  8078bd:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8078c1:	75 0a                	jne    8078cd <key_proc+0x93>
        scr_down();
  8078c3:	b8 00 00 00 00       	mov    eax,0x0
  8078c8:	e8 dd ef ff ff       	call   8068aa <scr_down>
    switch (scan1)
  8078cd:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8078d1:	3d b6 00 00 00       	cmp    eax,0xb6
  8078d6:	74 41                	je     807919 <key_proc+0xdf>
  8078d8:	3d b6 00 00 00       	cmp    eax,0xb6
  8078dd:	7f 5e                	jg     80793d <key_proc+0x103>
  8078df:	3d aa 00 00 00       	cmp    eax,0xaa
  8078e4:	74 33                	je     807919 <key_proc+0xdf>
  8078e6:	3d aa 00 00 00       	cmp    eax,0xaa
  8078eb:	7f 50                	jg     80793d <key_proc+0x103>
  8078ed:	3d 9d 00 00 00       	cmp    eax,0x9d
  8078f2:	74 31                	je     807925 <key_proc+0xeb>
  8078f4:	3d 9d 00 00 00       	cmp    eax,0x9d
  8078f9:	7f 42                	jg     80793d <key_proc+0x103>
  8078fb:	83 f8 3a             	cmp    eax,0x3a
  8078fe:	74 31                	je     807931 <key_proc+0xf7>
  807900:	83 f8 3a             	cmp    eax,0x3a
  807903:	7f 38                	jg     80793d <key_proc+0x103>
  807905:	83 f8 36             	cmp    eax,0x36
  807908:	74 0f                	je     807919 <key_proc+0xdf>
  80790a:	83 f8 36             	cmp    eax,0x36
  80790d:	7f 2e                	jg     80793d <key_proc+0x103>
  80790f:	83 f8 1d             	cmp    eax,0x1d
  807912:	74 11                	je     807925 <key_proc+0xeb>
  807914:	83 f8 2a             	cmp    eax,0x2a
  807917:	75 24                	jne    80793d <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807919:	b8 00 00 00 00       	mov    eax,0x0
  80791e:	e8 b0 fd ff ff       	call   8076d3 <shift>
            break;
  807923:	eb 19                	jmp    80793e <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  807925:	b8 00 00 00 00       	mov    eax,0x0
  80792a:	e8 c1 fd ff ff       	call   8076f0 <ctrl>
            break;
  80792f:	eb 0d                	jmp    80793e <key_proc+0x104>
        case 0x3a:
            capslock();
  807931:	b8 00 00 00 00       	mov    eax,0x0
  807936:	e8 d2 fd ff ff       	call   80770d <capslock>
            break;
  80793b:	eb 01                	jmp    80793e <key_proc+0x104>
        default:
            break;
  80793d:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  80793e:	b8 00 00 00 00       	mov    eax,0x0
  807943:	e8 b6 dd ff ff       	call   8056fe <eoi>
    asm volatile("leave \r\n iretq");
  807948:	c9                   	leave  
  807949:	48 cf                	iretq  
}
  80794b:	90                   	nop
  80794c:	c9                   	leave  
  80794d:	c3                   	ret    

000000000080794e <sys_getkbc>:

char sys_getkbc()
{
  80794e:	f3 0f 1e fa          	endbr64 
  807952:	55                   	push   rbp
  807953:	48 89 e5             	mov    rbp,rsp
  807956:	48 83 ec 10          	sub    rsp,0x10
    if(key_bufq.tail==key_bufq.head)return -1;
  80795a:	8b 15 4c 47 00 00    	mov    edx,DWORD PTR [rip+0x474c]        # 80c0ac <key_bufq+0xc>
  807960:	8b 05 42 47 00 00    	mov    eax,DWORD PTR [rip+0x4742]        # 80c0a8 <key_bufq+0x8>
  807966:	39 c2                	cmp    edx,eax
  807968:	75 07                	jne    807971 <sys_getkbc+0x23>
  80796a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80796f:	eb 4e                	jmp    8079bf <sys_getkbc+0x71>
    char c=key_buf[key_bufq.head];
  807971:	8b 05 31 47 00 00    	mov    eax,DWORD PTR [rip+0x4731]        # 80c0a8 <key_bufq+0x8>
  807977:	48 98                	cdqe   
  807979:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  807980:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
  807983:	8b 05 1f 47 00 00    	mov    eax,DWORD PTR [rip+0x471f]        # 80c0a8 <key_bufq+0x8>
  807989:	83 c0 01             	add    eax,0x1
  80798c:	8b 0d 1e 47 00 00    	mov    ecx,DWORD PTR [rip+0x471e]        # 80c0b0 <key_bufq+0x10>
  807992:	99                   	cdq    
  807993:	f7 f9                	idiv   ecx
  807995:	89 d0                	mov    eax,edx
  807997:	89 05 0b 47 00 00    	mov    DWORD PTR [rip+0x470b],eax        # 80c0a8 <key_bufq+0x8>
    if(c&FLAG_BREAK)return -1;
  80799d:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  8079a1:	79 07                	jns    8079aa <sys_getkbc+0x5c>
  8079a3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8079a8:	eb 15                	jmp    8079bf <sys_getkbc+0x71>
    c= to_ascii(c&0x7f);
  8079aa:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8079ae:	83 e0 7f             	and    eax,0x7f
  8079b1:	89 c7                	mov    edi,eax
  8079b3:	e8 72 fd ff ff       	call   80772a <to_ascii>
  8079b8:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    return c;
  8079bb:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8079bf:	c9                   	leave  
  8079c0:	c3                   	ret    

00000000008079c1 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8079c1:	f3 0f 1e fa          	endbr64 
  8079c5:	55                   	push   rbp
  8079c6:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8079c9:	b8 00 00 00 00       	mov    eax,0x0
  8079ce:	e8 8d 09 00 00       	call   808360 <hd_iterate>
    return 0;
  8079d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8079d8:	5d                   	pop    rbp
  8079d9:	c3                   	ret    

00000000008079da <disk_int_handler_c>:

int disk_int_handler_c()
{
  8079da:	f3 0f 1e fa          	endbr64 
  8079de:	55                   	push   rbp
  8079df:	48 89 e5             	mov    rbp,rsp
  8079e2:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8079e6:	48 8b 05 f3 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22af3]        # 42a4e0 <running_req>
  8079ed:	48 85 c0             	test   rax,rax
  8079f0:	75 0a                	jne    8079fc <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8079f2:	b8 01 00 00 00       	mov    eax,0x1
  8079f7:	e9 a3 01 00 00       	jmp    807b9f <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  8079fc:	48 8b 05 dd 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22add]        # 42a4e0 <running_req>
  807a03:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a07:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  807a0b:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807a12:	48 8b 05 c7 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ac7]        # 42a4e0 <running_req>
  807a19:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807a1c:	83 f8 02             	cmp    eax,0x2
  807a1f:	74 0f                	je     807a30 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  807a21:	48 8b 05 b8 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ab8]        # 42a4e0 <running_req>
  807a28:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807a2b:	83 f8 03             	cmp    eax,0x3
  807a2e:	75 07                	jne    807a37 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  807a30:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  807a37:	48 8b 05 a2 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22aa2]        # 42a4e0 <running_req>
  807a3e:	8b 00                	mov    eax,DWORD PTR [rax]
  807a40:	85 c0                	test   eax,eax
  807a42:	75 42                	jne    807a86 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  807a44:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807a4b:	eb 22                	jmp    807a6f <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  807a4d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a50:	0f b7 c0             	movzx  eax,ax
  807a53:	89 c7                	mov    edi,eax
  807a55:	e8 99 dc ff ff       	call   8056f3 <inw>
  807a5a:	89 c2                	mov    edx,eax
  807a5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a60:	48 8d 48 02          	lea    rcx,[rax+0x2]
  807a64:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  807a68:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  807a6b:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807a6f:	48 8b 05 6a 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a6a]        # 42a4e0 <running_req>
  807a76:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807a79:	c1 e0 08             	shl    eax,0x8
  807a7c:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  807a7f:	7c cc                	jl     807a4d <disk_int_handler_c+0x73>
  807a81:	e9 ca 00 00 00       	jmp    807b50 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  807a86:	48 8b 05 53 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a53]        # 42a4e0 <running_req>
  807a8d:	8b 00                	mov    eax,DWORD PTR [rax]
  807a8f:	83 f8 01             	cmp    eax,0x1
  807a92:	75 42                	jne    807ad6 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  807a94:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807a9b:	eb 25                	jmp    807ac2 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  807a9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807aa1:	48 8d 50 02          	lea    rdx,[rax+0x2]
  807aa5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  807aa9:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807aac:	0f b7 d0             	movzx  edx,ax
  807aaf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807ab2:	0f b7 c0             	movzx  eax,ax
  807ab5:	89 d6                	mov    esi,edx
  807ab7:	89 c7                	mov    edi,eax
  807ab9:	e8 1f dc ff ff       	call   8056dd <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  807abe:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807ac2:	48 8b 05 17 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a17]        # 42a4e0 <running_req>
  807ac9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807acc:	c1 e0 08             	shl    eax,0x8
  807acf:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807ad2:	7c c9                	jl     807a9d <disk_int_handler_c+0xc3>
  807ad4:	eb 7a                	jmp    807b50 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  807ad6:	48 8b 05 03 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a03]        # 42a4e0 <running_req>
  807add:	8b 00                	mov    eax,DWORD PTR [rax]
  807adf:	83 f8 02             	cmp    eax,0x2
  807ae2:	75 34                	jne    807b18 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  807ae4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807ae7:	83 c0 07             	add    eax,0x7
  807aea:	0f b6 c0             	movzx  eax,al
  807aed:	89 c7                	mov    edi,eax
  807aef:	e8 f5 db ff ff       	call   8056e9 <inb>
  807af4:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  807af7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807afa:	0f b7 c0             	movzx  eax,ax
  807afd:	89 c7                	mov    edi,eax
  807aff:	e8 ef db ff ff       	call   8056f3 <inw>
  807b04:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  807b08:	48 8b 05 d1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229d1]        # 42a4e0 <running_req>
  807b0f:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  807b16:	eb 38                	jmp    807b50 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  807b18:	48 8b 05 c1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229c1]        # 42a4e0 <running_req>
  807b1f:	8b 00                	mov    eax,DWORD PTR [rax]
  807b21:	83 f8 03             	cmp    eax,0x3
  807b24:	75 2a                	jne    807b50 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  807b26:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807b29:	83 c0 07             	add    eax,0x7
  807b2c:	0f b6 c0             	movzx  eax,al
  807b2f:	89 c7                	mov    edi,eax
  807b31:	e8 b3 db ff ff       	call   8056e9 <inb>
  807b36:	0f b6 c0             	movzx  eax,al
  807b39:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  807b3c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b3f:	89 c6                	mov    esi,eax
  807b41:	bf 36 40 81 00       	mov    edi,0x814036
  807b46:	b8 00 00 00 00       	mov    eax,0x0
  807b4b:	e8 c8 91 ff ff       	call   800d18 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  807b50:	48 8b 05 89 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22989]        # 42a4e0 <running_req>
  807b57:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807b5e:	48 8b 05 7b 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2297b]        # 42a4e0 <running_req>
  807b65:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807b69:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807b70:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  807b73:	48 8b 05 6e 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2296e]        # 42a4e8 <running_devman_req>
  807b7a:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  807b81:	00 00 00 
    running_devman_req=NULL;
  807b84:	48 c7 05 59 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22959],0x0        # 42a4e8 <running_devman_req>
  807b8b:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807b8f:	48 c7 05 46 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22946],0x0        # 42a4e0 <running_req>
  807b96:	00 00 00 00 
    return 0;
  807b9a:	b8 00 00 00 00       	mov    eax,0x0
}
  807b9f:	c9                   	leave  
  807ba0:	c3                   	ret    

0000000000807ba1 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  807ba1:	f3 0f 1e fa          	endbr64 
  807ba5:	55                   	push   rbp
  807ba6:	48 89 e5             	mov    rbp,rsp
  807ba9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  807bac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807baf:	48 63 d0             	movsxd rdx,eax
  807bb2:	48 89 d0             	mov    rax,rdx
  807bb5:	48 01 c0             	add    rax,rax
  807bb8:	48 01 d0             	add    rax,rdx
  807bbb:	48 c1 e0 04          	shl    rax,0x4
  807bbf:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807bc5:	8b 00                	mov    eax,DWORD PTR [rax]
}
  807bc7:	5d                   	pop    rbp
  807bc8:	c3                   	ret    

0000000000807bc9 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  807bc9:	f3 0f 1e fa          	endbr64 
  807bcd:	55                   	push   rbp
  807bce:	48 89 e5             	mov    rbp,rsp
  807bd1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807bd4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807bd7:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807bda:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  807bdd:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  807be1:	8b 05 2d 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2292d]        # 42a514 <tail>
  807be7:	83 c0 01             	add    eax,0x1
  807bea:	48 63 d0             	movsxd rdx,eax
  807bed:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  807bf4:	48 c1 ea 20          	shr    rdx,0x20
  807bf8:	01 c2                	add    edx,eax
  807bfa:	c1 fa 07             	sar    edx,0x7
  807bfd:	89 c1                	mov    ecx,eax
  807bff:	c1 f9 1f             	sar    ecx,0x1f
  807c02:	29 ca                	sub    edx,ecx
  807c04:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  807c0a:	29 c8                	sub    eax,ecx
  807c0c:	89 c2                	mov    edx,eax
  807c0e:	8b 05 fc 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228fc]        # 42a510 <head>
  807c14:	39 c2                	cmp    edx,eax
  807c16:	75 0a                	jne    807c22 <request+0x59>
    {
        return -1;
  807c18:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c1d:	e9 0d 01 00 00       	jmp    807d2f <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  807c22:	8b 05 ec 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ec]        # 42a514 <tail>
  807c28:	48 63 d0             	movsxd rdx,eax
  807c2b:	48 89 d0             	mov    rax,rdx
  807c2e:	48 01 c0             	add    rax,rax
  807c31:	48 01 d0             	add    rax,rdx
  807c34:	48 c1 e0 04          	shl    rax,0x4
  807c38:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  807c3f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807c42:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  807c44:	8b 05 ca 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ca]        # 42a514 <tail>
  807c4a:	48 63 d0             	movsxd rdx,eax
  807c4d:	48 89 d0             	mov    rax,rdx
  807c50:	48 01 c0             	add    rax,rax
  807c53:	48 01 d0             	add    rax,rdx
  807c56:	48 c1 e0 04          	shl    rax,0x4
  807c5a:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  807c61:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c64:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  807c66:	8b 05 a8 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228a8]        # 42a514 <tail>
  807c6c:	48 63 d0             	movsxd rdx,eax
  807c6f:	48 89 d0             	mov    rax,rdx
  807c72:	48 01 c0             	add    rax,rax
  807c75:	48 01 d0             	add    rax,rdx
  807c78:	48 c1 e0 04          	shl    rax,0x4
  807c7c:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  807c83:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807c86:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  807c88:	8b 05 86 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22886]        # 42a514 <tail>
  807c8e:	48 63 d0             	movsxd rdx,eax
  807c91:	48 89 d0             	mov    rax,rdx
  807c94:	48 01 c0             	add    rax,rax
  807c97:	48 01 d0             	add    rax,rdx
  807c9a:	48 c1 e0 04          	shl    rax,0x4
  807c9e:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  807ca5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  807ca8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  807caa:	8b 05 64 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22864]        # 42a514 <tail>
  807cb0:	48 63 d0             	movsxd rdx,eax
  807cb3:	48 89 d0             	mov    rax,rdx
  807cb6:	48 01 c0             	add    rax,rax
  807cb9:	48 01 d0             	add    rax,rdx
  807cbc:	48 c1 e0 04          	shl    rax,0x4
  807cc0:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807cc6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  807ccc:	8b 05 42 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22842]        # 42a514 <tail>
  807cd2:	48 63 d0             	movsxd rdx,eax
  807cd5:	48 89 d0             	mov    rax,rdx
  807cd8:	48 01 c0             	add    rax,rax
  807cdb:	48 01 d0             	add    rax,rdx
  807cde:	48 c1 e0 04          	shl    rax,0x4
  807ce2:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  807ce9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807ced:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  807cf0:	8b 05 1e 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2281e]        # 42a514 <tail>
  807cf6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  807cf9:	8b 05 15 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22815]        # 42a514 <tail>
  807cff:	8d 50 01             	lea    edx,[rax+0x1]
  807d02:	48 63 c2             	movsxd rax,edx
  807d05:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807d0c:	48 c1 e8 20          	shr    rax,0x20
  807d10:	01 d0                	add    eax,edx
  807d12:	c1 f8 07             	sar    eax,0x7
  807d15:	89 d1                	mov    ecx,edx
  807d17:	c1 f9 1f             	sar    ecx,0x1f
  807d1a:	29 c8                	sub    eax,ecx
  807d1c:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807d22:	89 d0                	mov    eax,edx
  807d24:	29 c8                	sub    eax,ecx
  807d26:	89 05 e8 27 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc227e8],eax        # 42a514 <tail>
    return r;
  807d2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807d2f:	5d                   	pop    rbp
  807d30:	c3                   	ret    

0000000000807d31 <execute_request>:
int execute_request(){
  807d31:	f3 0f 1e fa          	endbr64 
  807d35:	55                   	push   rbp
  807d36:	48 89 e5             	mov    rbp,rsp
  807d39:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  807d3d:	48 8b 05 9c 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2279c]        # 42a4e0 <running_req>
  807d44:	48 85 c0             	test   rax,rax
  807d47:	74 6a                	je     807db3 <execute_request+0x82>
    {
        running_req->time++;
  807d49:	48 8b 05 90 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22790]        # 42a4e0 <running_req>
  807d50:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  807d53:	83 c2 01             	add    edx,0x1
  807d56:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  807d59:	48 8b 05 80 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22780]        # 42a4e0 <running_req>
  807d60:	8b 00                	mov    eax,DWORD PTR [rax]
  807d62:	83 f8 02             	cmp    eax,0x2
  807d65:	74 0a                	je     807d71 <execute_request+0x40>
            return 2;
  807d67:	b8 02 00 00 00       	mov    eax,0x2
  807d6c:	e9 b4 01 00 00       	jmp    807f25 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  807d71:	48 8b 05 68 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22768]        # 42a4e0 <running_req>
  807d78:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  807d7b:	83 f8 0a             	cmp    eax,0xa
  807d7e:	7e 29                	jle    807da9 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  807d80:	48 8b 05 59 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22759]        # 42a4e0 <running_req>
  807d87:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  807d8e:	48 8b 05 4b 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2274b]        # 42a4e0 <running_req>
  807d95:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  807d9c:	48 c7 05 39 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22739],0x0        # 42a4e0 <running_req>
  807da3:	00 00 00 00 
  807da7:	eb 0a                	jmp    807db3 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  807da9:	b8 02 00 00 00       	mov    eax,0x2
  807dae:	e9 72 01 00 00       	jmp    807f25 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  807db3:	8b 15 57 27 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22757]        # 42a510 <head>
  807db9:	8b 05 55 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22755]        # 42a514 <tail>
  807dbf:	39 c2                	cmp    edx,eax
  807dc1:	75 0a                	jne    807dcd <execute_request+0x9c>
  807dc3:	b8 01 00 00 00       	mov    eax,0x1
  807dc8:	e9 58 01 00 00       	jmp    807f25 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  807dcd:	8b 05 3d 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2273d]        # 42a510 <head>
  807dd3:	48 63 d0             	movsxd rdx,eax
  807dd6:	48 89 d0             	mov    rax,rdx
  807dd9:	48 01 c0             	add    rax,rax
  807ddc:	48 01 d0             	add    rax,rdx
  807ddf:	48 c1 e0 04          	shl    rax,0x4
  807de3:	48 05 e0 77 42 00    	add    rax,0x4277e0
  807de9:	48 89 05 f0 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc226f0],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  807df0:	8b 05 1a 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2271a]        # 42a510 <head>
  807df6:	8d 50 01             	lea    edx,[rax+0x1]
  807df9:	48 63 c2             	movsxd rax,edx
  807dfc:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807e03:	48 c1 e8 20          	shr    rax,0x20
  807e07:	01 d0                	add    eax,edx
  807e09:	c1 f8 07             	sar    eax,0x7
  807e0c:	89 d1                	mov    ecx,edx
  807e0e:	c1 f9 1f             	sar    ecx,0x1f
  807e11:	29 c8                	sub    eax,ecx
  807e13:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807e19:	89 d0                	mov    eax,edx
  807e1b:	29 c8                	sub    eax,ecx
  807e1d:	89 05 ed 26 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc226ed],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  807e23:	48 8b 05 b6 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226b6]        # 42a4e0 <running_req>
  807e2a:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  807e31:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  807e38:	48 8b 05 a1 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226a1]        # 42a4e0 <running_req>
  807e3f:	8b 00                	mov    eax,DWORD PTR [rax]
  807e41:	83 f8 03             	cmp    eax,0x3
  807e44:	0f 84 ad 00 00 00    	je     807ef7 <execute_request+0x1c6>
  807e4a:	83 f8 03             	cmp    eax,0x3
  807e4d:	0f 8f bf 00 00 00    	jg     807f12 <execute_request+0x1e1>
  807e53:	83 f8 02             	cmp    eax,0x2
  807e56:	0f 84 85 00 00 00    	je     807ee1 <execute_request+0x1b0>
  807e5c:	83 f8 02             	cmp    eax,0x2
  807e5f:	0f 8f ad 00 00 00    	jg     807f12 <execute_request+0x1e1>
  807e65:	85 c0                	test   eax,eax
  807e67:	74 0a                	je     807e73 <execute_request+0x142>
  807e69:	83 f8 01             	cmp    eax,0x1
  807e6c:	74 3c                	je     807eaa <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  807e6e:	e9 9f 00 00 00       	jmp    807f12 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  807e73:	48 8b 05 66 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22666]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807e7a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  807e7e:	48 8b 05 5b 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2265b]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807e85:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  807e88:	48 8b 05 51 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22651]        # 42a4e0 <running_req>
  807e8f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  807e92:	89 c6                	mov    esi,eax
  807e94:	48 8b 05 45 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22645]        # 42a4e0 <running_req>
  807e9b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e9e:	89 c7                	mov    edi,eax
  807ea0:	e8 a7 00 00 00       	call   807f4c <async_read_disk>
  807ea5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807ea8:	eb 69                	jmp    807f13 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  807eaa:	48 8b 05 2f 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2262f]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807eb1:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  807eb5:	48 8b 05 24 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22624]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807ebc:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  807ebf:	48 8b 05 1a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2261a]        # 42a4e0 <running_req>
  807ec6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  807ec9:	89 c6                	mov    esi,eax
  807ecb:	48 8b 05 0e 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2260e]        # 42a4e0 <running_req>
  807ed2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807ed5:	89 c7                	mov    edi,eax
  807ed7:	e8 88 01 00 00       	call   808064 <async_write_disk>
  807edc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807edf:	eb 32                	jmp    807f13 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  807ee1:	48 8b 05 f8 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225f8]        # 42a4e0 <running_req>
  807ee8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807eeb:	89 c7                	mov    edi,eax
  807eed:	e8 8f 06 00 00       	call   808581 <async_check_disk>
  807ef2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807ef5:	eb 1c                	jmp    807f13 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  807ef7:	48 8b 05 e2 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225e2]        # 42a4e0 <running_req>
  807efe:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807f01:	89 c7                	mov    edi,eax
  807f03:	b8 00 00 00 00       	mov    eax,0x0
  807f08:	e8 1a 00 00 00       	call   807f27 <async_reset_disk>
  807f0d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807f10:	eb 01                	jmp    807f13 <execute_request+0x1e2>
        break;
  807f12:	90                   	nop
    }
    if(r==-1)return -1;
  807f13:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807f17:	75 07                	jne    807f20 <execute_request+0x1ef>
  807f19:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807f1e:	eb 05                	jmp    807f25 <execute_request+0x1f4>
    return 0;
  807f20:	b8 00 00 00 00       	mov    eax,0x0
}
  807f25:	c9                   	leave  
  807f26:	c3                   	ret    

0000000000807f27 <async_reset_disk>:
int async_reset_disk(int disk)
{
  807f27:	f3 0f 1e fa          	endbr64 
  807f2b:	55                   	push   rbp
  807f2c:	48 89 e5             	mov    rbp,rsp
  807f2f:	48 83 ec 10          	sub    rsp,0x10
  807f33:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  807f36:	be 0c 00 00 00       	mov    esi,0xc
  807f3b:	bf f6 03 00 00       	mov    edi,0x3f6
  807f40:	e8 8b d7 ff ff       	call   8056d0 <outb>
    return 0;
  807f45:	b8 00 00 00 00       	mov    eax,0x0
}
  807f4a:	c9                   	leave  
  807f4b:	c3                   	ret    

0000000000807f4c <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  807f4c:	f3 0f 1e fa          	endbr64 
  807f50:	55                   	push   rbp
  807f51:	48 89 e5             	mov    rbp,rsp
  807f54:	48 83 ec 30          	sub    rsp,0x30
  807f58:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807f5b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807f5e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807f61:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  807f65:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807f6b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807f72:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807f76:	74 06                	je     807f7e <async_read_disk+0x32>
  807f78:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807f7c:	75 06                	jne    807f84 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  807f7e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  807f84:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807f88:	74 06                	je     807f90 <async_read_disk+0x44>
  807f8a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807f8e:	75 07                	jne    807f97 <async_read_disk+0x4b>
        slave_disk=1;
  807f90:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  807f97:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807f9a:	0f b6 d0             	movzx  edx,al
  807f9d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fa1:	83 c0 02             	add    eax,0x2
  807fa4:	0f b7 c0             	movzx  eax,ax
  807fa7:	89 d6                	mov    esi,edx
  807fa9:	89 c7                	mov    edi,eax
  807fab:	e8 20 d7 ff ff       	call   8056d0 <outb>
    outb(port+3,lba&0xff);
  807fb0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fb3:	0f b6 d0             	movzx  edx,al
  807fb6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fba:	83 c0 03             	add    eax,0x3
  807fbd:	0f b7 c0             	movzx  eax,ax
  807fc0:	89 d6                	mov    esi,edx
  807fc2:	89 c7                	mov    edi,eax
  807fc4:	e8 07 d7 ff ff       	call   8056d0 <outb>
    outb(port+4,(lba>>8)&0xff);
  807fc9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fcc:	c1 e8 08             	shr    eax,0x8
  807fcf:	0f b6 d0             	movzx  edx,al
  807fd2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fd6:	83 c0 04             	add    eax,0x4
  807fd9:	0f b7 c0             	movzx  eax,ax
  807fdc:	89 d6                	mov    esi,edx
  807fde:	89 c7                	mov    edi,eax
  807fe0:	e8 eb d6 ff ff       	call   8056d0 <outb>
    outb(port+5,(lba>>16)&0xff);
  807fe5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fe8:	c1 e8 10             	shr    eax,0x10
  807feb:	0f b6 d0             	movzx  edx,al
  807fee:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807ff2:	83 c0 05             	add    eax,0x5
  807ff5:	0f b7 c0             	movzx  eax,ax
  807ff8:	89 d6                	mov    esi,edx
  807ffa:	89 c7                	mov    edi,eax
  807ffc:	e8 cf d6 ff ff       	call   8056d0 <outb>
    char drv=slave_disk?0x10:0;
  808001:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808005:	74 07                	je     80800e <async_read_disk+0xc2>
  808007:	b8 10 00 00 00       	mov    eax,0x10
  80800c:	eb 05                	jmp    808013 <async_read_disk+0xc7>
  80800e:	b8 00 00 00 00       	mov    eax,0x0
  808013:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808016:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808019:	c1 e8 18             	shr    eax,0x18
  80801c:	83 e0 0f             	and    eax,0xf
  80801f:	89 c2                	mov    edx,eax
  808021:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808025:	09 d0                	or     eax,edx
  808027:	83 c8 e0             	or     eax,0xffffffe0
  80802a:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  80802d:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808031:	0f b6 d0             	movzx  edx,al
  808034:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808038:	83 c0 06             	add    eax,0x6
  80803b:	0f b7 c0             	movzx  eax,ax
  80803e:	89 d6                	mov    esi,edx
  808040:	89 c7                	mov    edi,eax
  808042:	e8 89 d6 ff ff       	call   8056d0 <outb>
    outb(port+7,DISK_CMD_READ);
  808047:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80804b:	83 c0 07             	add    eax,0x7
  80804e:	0f b7 c0             	movzx  eax,ax
  808051:	be 20 00 00 00       	mov    esi,0x20
  808056:	89 c7                	mov    edi,eax
  808058:	e8 73 d6 ff ff       	call   8056d0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  80805d:	b8 00 00 00 00       	mov    eax,0x0
}
  808062:	c9                   	leave  
  808063:	c3                   	ret    

0000000000808064 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  808064:	f3 0f 1e fa          	endbr64 
  808068:	55                   	push   rbp
  808069:	48 89 e5             	mov    rbp,rsp
  80806c:	48 83 ec 30          	sub    rsp,0x30
  808070:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808073:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808076:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808079:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80807d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808083:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80808a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80808e:	74 06                	je     808096 <async_write_disk+0x32>
  808090:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808094:	75 06                	jne    80809c <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  808096:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80809c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8080a0:	74 06                	je     8080a8 <async_write_disk+0x44>
  8080a2:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8080a6:	75 07                	jne    8080af <async_write_disk+0x4b>
        slave_disk=1;
  8080a8:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8080af:	bf f7 00 00 00       	mov    edi,0xf7
  8080b4:	e8 30 d6 ff ff       	call   8056e9 <inb>
  8080b9:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8080bc:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8080c0:	83 e0 01             	and    eax,0x1
  8080c3:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  8080c6:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8080ca:	74 0a                	je     8080d6 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8080cc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8080d1:	e9 d5 00 00 00       	jmp    8081ab <async_write_disk+0x147>
        }
        t&=0x88;
  8080d6:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8080da:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8080de:	74 02                	je     8080e2 <async_write_disk+0x7e>
    {
  8080e0:	eb cd                	jmp    8080af <async_write_disk+0x4b>
        if(t==0x8)break;
  8080e2:	90                   	nop
    }
    outb(port+2,sec_n);
  8080e3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8080e6:	0f b6 d0             	movzx  edx,al
  8080e9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8080ed:	83 c0 02             	add    eax,0x2
  8080f0:	0f b7 c0             	movzx  eax,ax
  8080f3:	89 d6                	mov    esi,edx
  8080f5:	89 c7                	mov    edi,eax
  8080f7:	e8 d4 d5 ff ff       	call   8056d0 <outb>
    outb(port+3,lba&0xff);
  8080fc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8080ff:	0f b6 d0             	movzx  edx,al
  808102:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808106:	83 c0 03             	add    eax,0x3
  808109:	0f b7 c0             	movzx  eax,ax
  80810c:	89 d6                	mov    esi,edx
  80810e:	89 c7                	mov    edi,eax
  808110:	e8 bb d5 ff ff       	call   8056d0 <outb>
    outb(port+4,(lba>>8)&0xff);
  808115:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808118:	c1 e8 08             	shr    eax,0x8
  80811b:	0f b6 d0             	movzx  edx,al
  80811e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808122:	83 c0 04             	add    eax,0x4
  808125:	0f b7 c0             	movzx  eax,ax
  808128:	89 d6                	mov    esi,edx
  80812a:	89 c7                	mov    edi,eax
  80812c:	e8 9f d5 ff ff       	call   8056d0 <outb>
    outb(port+5,(lba>>16)&0xff);
  808131:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808134:	c1 e8 10             	shr    eax,0x10
  808137:	0f b6 d0             	movzx  edx,al
  80813a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80813e:	83 c0 05             	add    eax,0x5
  808141:	0f b7 c0             	movzx  eax,ax
  808144:	89 d6                	mov    esi,edx
  808146:	89 c7                	mov    edi,eax
  808148:	e8 83 d5 ff ff       	call   8056d0 <outb>
    char drv=slave_disk?0x10:0;
  80814d:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808151:	74 07                	je     80815a <async_write_disk+0xf6>
  808153:	b8 10 00 00 00       	mov    eax,0x10
  808158:	eb 05                	jmp    80815f <async_write_disk+0xfb>
  80815a:	b8 00 00 00 00       	mov    eax,0x0
  80815f:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808162:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808165:	c1 e8 18             	shr    eax,0x18
  808168:	83 e0 0f             	and    eax,0xf
  80816b:	89 c2                	mov    edx,eax
  80816d:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808171:	09 d0                	or     eax,edx
  808173:	83 c8 e0             	or     eax,0xffffffe0
  808176:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  808179:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80817d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808181:	83 c0 06             	add    eax,0x6
  808184:	0f b7 c0             	movzx  eax,ax
  808187:	89 d6                	mov    esi,edx
  808189:	89 c7                	mov    edi,eax
  80818b:	e8 40 d5 ff ff       	call   8056d0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  808190:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808194:	83 c0 07             	add    eax,0x7
  808197:	0f b7 c0             	movzx  eax,ax
  80819a:	be 30 00 00 00       	mov    esi,0x30
  80819f:	89 c7                	mov    edi,eax
  8081a1:	e8 2a d5 ff ff       	call   8056d0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  8081a6:	b8 00 00 00 00       	mov    eax,0x0
}
  8081ab:	c9                   	leave  
  8081ac:	c3                   	ret    

00000000008081ad <read_disk>:
int read_disk(driver_args* args)
{
  8081ad:	f3 0f 1e fa          	endbr64 
  8081b1:	55                   	push   rbp
  8081b2:	48 89 e5             	mov    rbp,rsp
  8081b5:	48 83 ec 20          	sub    rsp,0x20
  8081b9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8081bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081c1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8081c4:	48 98                	cdqe   
  8081c6:	48 89 c2             	mov    rdx,rax
  8081c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081cd:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8081d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081d4:	8b 00                	mov    eax,DWORD PTR [rax]
  8081d6:	89 ce                	mov    esi,ecx
  8081d8:	89 c7                	mov    edi,eax
  8081da:	e8 8d 05 00 00       	call   80876c <read_disk_asm>
  8081df:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8081e2:	48 8b 05 f7 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222f7]        # 42a4e0 <running_req>
  8081e9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8081f0:	48 8b 05 e9 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e9]        # 42a4e0 <running_req>
  8081f7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8081fb:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808202:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808205:	48 c7 05 d0 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222d0],0x0        # 42a4e0 <running_req>
  80820c:	00 00 00 00 
    return ret;
  808210:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808213:	c9                   	leave  
  808214:	c3                   	ret    

0000000000808215 <write_disk>:
int write_disk(driver_args* args)
{
  808215:	f3 0f 1e fa          	endbr64 
  808219:	55                   	push   rbp
  80821a:	48 89 e5             	mov    rbp,rsp
  80821d:	48 83 ec 20          	sub    rsp,0x20
  808221:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  808225:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808229:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80822c:	48 98                	cdqe   
  80822e:	48 89 c2             	mov    rdx,rax
  808231:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808235:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808238:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80823c:	8b 00                	mov    eax,DWORD PTR [rax]
  80823e:	89 ce                	mov    esi,ecx
  808240:	89 c7                	mov    edi,eax
  808242:	e8 a5 05 00 00       	call   8087ec <write_disk_asm>
  808247:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80824a:	48 8b 05 8f 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2228f]        # 42a4e0 <running_req>
  808251:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808258:	48 8b 05 81 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22281]        # 42a4e0 <running_req>
  80825f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808263:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80826a:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80826d:	48 c7 05 68 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22268],0x0        # 42a4e0 <running_req>
  808274:	00 00 00 00 
    return ret;
  808278:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80827b:	c9                   	leave  
  80827c:	c3                   	ret    

000000000080827d <chk_result>:
int chk_result(int r)
{
  80827d:	f3 0f 1e fa          	endbr64 
  808281:	55                   	push   rbp
  808282:	48 89 e5             	mov    rbp,rsp
  808285:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  808288:	90                   	nop
  808289:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80828c:	48 63 d0             	movsxd rdx,eax
  80828f:	48 89 d0             	mov    rax,rdx
  808292:	48 01 c0             	add    rax,rax
  808295:	48 01 d0             	add    rax,rdx
  808298:	48 c1 e0 04          	shl    rax,0x4
  80829c:	48 05 fc 77 42 00    	add    rax,0x4277fc
  8082a2:	8b 00                	mov    eax,DWORD PTR [rax]
  8082a4:	83 f8 03             	cmp    eax,0x3
  8082a7:	75 e0                	jne    808289 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  8082a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8082ac:	48 63 d0             	movsxd rdx,eax
  8082af:	48 89 d0             	mov    rax,rdx
  8082b2:	48 01 c0             	add    rax,rax
  8082b5:	48 01 d0             	add    rax,rdx
  8082b8:	48 c1 e0 04          	shl    rax,0x4
  8082bc:	48 05 00 78 42 00    	add    rax,0x427800
  8082c2:	8b 00                	mov    eax,DWORD PTR [rax]
  8082c4:	83 f8 01             	cmp    eax,0x1
  8082c7:	0f 94 c0             	sete   al
  8082ca:	0f b6 c0             	movzx  eax,al
}
  8082cd:	5d                   	pop    rbp
  8082ce:	c3                   	ret    

00000000008082cf <disk_existent>:
int disk_existent(int disk)
{
  8082cf:	f3 0f 1e fa          	endbr64 
  8082d3:	55                   	push   rbp
  8082d4:	48 89 e5             	mov    rbp,rsp
  8082d7:	48 83 ec 10          	sub    rsp,0x10
  8082db:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8082de:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8082e2:	74 5f                	je     808343 <disk_existent+0x74>
  8082e4:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8082e8:	7f 6e                	jg     808358 <disk_existent+0x89>
  8082ea:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8082ee:	74 3e                	je     80832e <disk_existent+0x5f>
  8082f0:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8082f4:	7f 62                	jg     808358 <disk_existent+0x89>
  8082f6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8082fa:	74 08                	je     808304 <disk_existent+0x35>
  8082fc:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  808300:	74 17                	je     808319 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  808302:	eb 54                	jmp    808358 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  808304:	bf 54 40 81 00       	mov    edi,0x814054
  808309:	e8 a6 a6 ff ff       	call   8029b4 <sys_find_dev>
  80830e:	83 f8 ff             	cmp    eax,0xffffffff
  808311:	0f 95 c0             	setne  al
  808314:	0f b6 c0             	movzx  eax,al
  808317:	eb 45                	jmp    80835e <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  808319:	bf 58 40 81 00       	mov    edi,0x814058
  80831e:	e8 91 a6 ff ff       	call   8029b4 <sys_find_dev>
  808323:	83 f8 ff             	cmp    eax,0xffffffff
  808326:	0f 95 c0             	setne  al
  808329:	0f b6 c0             	movzx  eax,al
  80832c:	eb 30                	jmp    80835e <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  80832e:	bf 5c 40 81 00       	mov    edi,0x81405c
  808333:	e8 7c a6 ff ff       	call   8029b4 <sys_find_dev>
  808338:	83 f8 ff             	cmp    eax,0xffffffff
  80833b:	0f 95 c0             	setne  al
  80833e:	0f b6 c0             	movzx  eax,al
  808341:	eb 1b                	jmp    80835e <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  808343:	bf 60 40 81 00       	mov    edi,0x814060
  808348:	e8 67 a6 ff ff       	call   8029b4 <sys_find_dev>
  80834d:	83 f8 ff             	cmp    eax,0xffffffff
  808350:	0f 95 c0             	setne  al
  808353:	0f b6 c0             	movzx  eax,al
  808356:	eb 06                	jmp    80835e <disk_existent+0x8f>
        break;
  808358:	90                   	nop
    }
    return 0;
  808359:	b8 00 00 00 00       	mov    eax,0x0
}
  80835e:	c9                   	leave  
  80835f:	c3                   	ret    

0000000000808360 <hd_iterate>:
int hd_iterate()
{
  808360:	f3 0f 1e fa          	endbr64 
  808364:	55                   	push   rbp
  808365:	48 89 e5             	mov    rbp,rsp
  808368:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  80836f:	41 b8 00 00 00 00    	mov    r8d,0x0
  808375:	b9 01 00 00 00       	mov    ecx,0x1
  80837a:	ba 00 00 00 00       	mov    edx,0x0
  80837f:	be 02 00 00 00       	mov    esi,0x2
  808384:	bf 00 00 00 00       	mov    edi,0x0
  808389:	e8 3b f8 ff ff       	call   807bc9 <request>
  80838e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  808391:	41 b8 00 00 00 00    	mov    r8d,0x0
  808397:	b9 01 00 00 00       	mov    ecx,0x1
  80839c:	ba 00 00 00 00       	mov    edx,0x0
  8083a1:	be 02 00 00 00       	mov    esi,0x2
  8083a6:	bf 01 00 00 00       	mov    edi,0x1
  8083ab:	e8 19 f8 ff ff       	call   807bc9 <request>
  8083b0:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  8083b3:	41 b8 00 00 00 00    	mov    r8d,0x0
  8083b9:	b9 01 00 00 00       	mov    ecx,0x1
  8083be:	ba 00 00 00 00       	mov    edx,0x0
  8083c3:	be 02 00 00 00       	mov    esi,0x2
  8083c8:	bf 02 00 00 00       	mov    edi,0x2
  8083cd:	e8 f7 f7 ff ff       	call   807bc9 <request>
  8083d2:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8083d5:	41 b8 00 00 00 00    	mov    r8d,0x0
  8083db:	b9 01 00 00 00       	mov    ecx,0x1
  8083e0:	ba 00 00 00 00       	mov    edx,0x0
  8083e5:	be 02 00 00 00       	mov    esi,0x2
  8083ea:	bf 03 00 00 00       	mov    edi,0x3
  8083ef:	e8 d5 f7 ff ff       	call   807bc9 <request>
  8083f4:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  8083f7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8083fe:	e9 72 01 00 00       	jmp    808575 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808403:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808407:	74 3b                	je     808444 <hd_iterate+0xe4>
  808409:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80840d:	7f 3e                	jg     80844d <hd_iterate+0xed>
  80840f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808413:	74 26                	je     80843b <hd_iterate+0xdb>
  808415:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808419:	7f 32                	jg     80844d <hd_iterate+0xed>
  80841b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80841f:	74 08                	je     808429 <hd_iterate+0xc9>
  808421:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808425:	74 0b                	je     808432 <hd_iterate+0xd2>
  808427:	eb 24                	jmp    80844d <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  808429:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808430:	eb 25                	jmp    808457 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808432:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  808439:	eb 1c                	jmp    808457 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80843b:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  808442:	eb 13                	jmp    808457 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  808444:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  80844b:	eb 0a                	jmp    808457 <hd_iterate+0xf7>
        default:
            return -1;
  80844d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808452:	e9 28 01 00 00       	jmp    80857f <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  808457:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80845a:	48 98                	cdqe   
  80845c:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808460:	89 c7                	mov    edi,eax
  808462:	e8 16 fe ff ff       	call   80827d <chk_result>
  808467:	85 c0                	test   eax,eax
  808469:	0f 84 81 00 00 00    	je     8084f0 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  80846f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808472:	89 c6                	mov    esi,eax
  808474:	bf 64 40 81 00       	mov    edi,0x814064
  808479:	b8 00 00 00 00       	mov    eax,0x0
  80847e:	e8 95 88 ff ff       	call   800d18 <printf>
            //新硬盘
            device hd={
  808483:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80848a:	b8 00 00 00 00       	mov    eax,0x0
  80848f:	b9 15 00 00 00       	mov    ecx,0x15
  808494:	48 89 d7             	mov    rdi,rdx
  808497:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  80849a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80849d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  8084a3:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  8084aa:	00 00 00 
  8084ad:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  8084b4:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  8084b7:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8084bb:	7f 07                	jg     8084c4 <hd_iterate+0x164>
  8084bd:	b8 f0 01 00 00       	mov    eax,0x1f0
  8084c2:	eb 05                	jmp    8084c9 <hd_iterate+0x169>
  8084c4:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  8084c9:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  8084cf:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  8084d6:	48 89 c7             	mov    rdi,rax
  8084d9:	e8 9e a0 ff ff       	call   80257c <reg_device>
  8084de:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8084e1:	48 63 d2             	movsxd rdx,edx
  8084e4:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  8084eb:	e9 81 00 00 00       	jmp    808571 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  8084f0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8084f3:	48 98                	cdqe   
  8084f5:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8084f9:	89 c7                	mov    edi,eax
  8084fb:	e8 7d fd ff ff       	call   80827d <chk_result>
  808500:	85 c0                	test   eax,eax
  808502:	75 6d                	jne    808571 <hd_iterate+0x211>
        {
            switch (i)
  808504:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808508:	74 3e                	je     808548 <hd_iterate+0x1e8>
  80850a:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80850e:	7f 41                	jg     808551 <hd_iterate+0x1f1>
  808510:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808514:	74 28                	je     80853e <hd_iterate+0x1de>
  808516:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80851a:	7f 35                	jg     808551 <hd_iterate+0x1f1>
  80851c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808520:	74 08                	je     80852a <hd_iterate+0x1ca>
  808522:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808526:	74 0c                	je     808534 <hd_iterate+0x1d4>
  808528:	eb 27                	jmp    808551 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80852a:	48 c7 45 f8 54 40 81 	mov    QWORD PTR [rbp-0x8],0x814054
  808531:	00 
  808532:	eb 1d                	jmp    808551 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  808534:	48 c7 45 f8 58 40 81 	mov    QWORD PTR [rbp-0x8],0x814058
  80853b:	00 
  80853c:	eb 13                	jmp    808551 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  80853e:	48 c7 45 f8 5c 40 81 	mov    QWORD PTR [rbp-0x8],0x81405c
  808545:	00 
  808546:	eb 09                	jmp    808551 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  808548:	48 c7 45 f8 60 40 81 	mov    QWORD PTR [rbp-0x8],0x814060
  80854f:	00 
  808550:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  808551:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808555:	48 89 c7             	mov    rdi,rax
  808558:	e8 57 a4 ff ff       	call   8029b4 <sys_find_dev>
  80855d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  808560:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808563:	89 c7                	mov    edi,eax
  808565:	e8 1e ab ff ff       	call   803088 <get_dev>
  80856a:	89 c7                	mov    edi,eax
  80856c:	e8 6a aa ff ff       	call   802fdb <dispose_device>
    for(int i=0;i<1;i++)
  808571:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808575:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808579:	0f 8e 84 fe ff ff    	jle    808403 <hd_iterate+0xa3>
        }

    }
}
  80857f:	c9                   	leave  
  808580:	c3                   	ret    

0000000000808581 <async_check_disk>:

int async_check_disk(int disk)
{
  808581:	f3 0f 1e fa          	endbr64 
  808585:	55                   	push   rbp
  808586:	48 89 e5             	mov    rbp,rsp
  808589:	48 83 ec 20          	sub    rsp,0x20
  80858d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  808590:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  808596:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80859c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8085a0:	74 06                	je     8085a8 <async_check_disk+0x27>
  8085a2:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8085a6:	75 06                	jne    8085ae <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  8085a8:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  8085ae:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8085b2:	74 06                	je     8085ba <async_check_disk+0x39>
  8085b4:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8085b8:	75 06                	jne    8085c0 <async_check_disk+0x3f>
        chkcmd=0xf0;
  8085ba:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  8085c0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085c4:	83 c0 02             	add    eax,0x2
  8085c7:	0f b7 c0             	movzx  eax,ax
  8085ca:	be 01 00 00 00       	mov    esi,0x1
  8085cf:	89 c7                	mov    edi,eax
  8085d1:	e8 fa d0 ff ff       	call   8056d0 <outb>
    outb(disknr+3,0);
  8085d6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085da:	83 c0 03             	add    eax,0x3
  8085dd:	0f b7 c0             	movzx  eax,ax
  8085e0:	be 00 00 00 00       	mov    esi,0x0
  8085e5:	89 c7                	mov    edi,eax
  8085e7:	e8 e4 d0 ff ff       	call   8056d0 <outb>
    outb(disknr+4,0);
  8085ec:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085f0:	83 c0 04             	add    eax,0x4
  8085f3:	0f b7 c0             	movzx  eax,ax
  8085f6:	be 00 00 00 00       	mov    esi,0x0
  8085fb:	89 c7                	mov    edi,eax
  8085fd:	e8 ce d0 ff ff       	call   8056d0 <outb>
    outb(disknr+5,0);
  808602:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808606:	83 c0 05             	add    eax,0x5
  808609:	0f b7 c0             	movzx  eax,ax
  80860c:	be 00 00 00 00       	mov    esi,0x0
  808611:	89 c7                	mov    edi,eax
  808613:	e8 b8 d0 ff ff       	call   8056d0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808618:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80861c:	0f b6 d0             	movzx  edx,al
  80861f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808623:	83 c0 06             	add    eax,0x6
  808626:	0f b7 c0             	movzx  eax,ax
  808629:	89 d6                	mov    esi,edx
  80862b:	89 c7                	mov    edi,eax
  80862d:	e8 9e d0 ff ff       	call   8056d0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808632:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808636:	83 c0 07             	add    eax,0x7
  808639:	0f b7 c0             	movzx  eax,ax
  80863c:	be 90 00 00 00       	mov    esi,0x90
  808641:	89 c7                	mov    edi,eax
  808643:	e8 88 d0 ff ff       	call   8056d0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808648:	b8 00 00 00 00       	mov    eax,0x0
}
  80864d:	c9                   	leave  
  80864e:	c3                   	ret    

000000000080864f <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80864f:	f3 0f 1e fa          	endbr64 
  808653:	55                   	push   rbp
  808654:	48 89 e5             	mov    rbp,rsp
  808657:	48 83 ec 18          	sub    rsp,0x18
  80865b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80865f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808666:	eb 04                	jmp    80866c <hd_do_req+0x1d>
  808668:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80866c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80866f:	48 98                	cdqe   
  808671:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  808678:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80867c:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808682:	39 c2                	cmp    edx,eax
  808684:	75 e2                	jne    808668 <hd_do_req+0x19>
    switch (args->cmd)
  808686:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80868a:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808690:	83 f8 04             	cmp    eax,0x4
  808693:	74 72                	je     808707 <hd_do_req+0xb8>
  808695:	83 f8 04             	cmp    eax,0x4
  808698:	0f 8f 96 00 00 00    	jg     808734 <hd_do_req+0xe5>
  80869e:	83 f8 02             	cmp    eax,0x2
  8086a1:	74 0a                	je     8086ad <hd_do_req+0x5e>
  8086a3:	83 f8 03             	cmp    eax,0x3
  8086a6:	74 32                	je     8086da <hd_do_req+0x8b>
  8086a8:	e9 87 00 00 00       	jmp    808734 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  8086ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086b1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8086b4:	48 98                	cdqe   
  8086b6:	48 89 c6             	mov    rsi,rax
  8086b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086bd:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8086c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086c4:	8b 10                	mov    edx,DWORD PTR [rax]
  8086c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086c9:	49 89 f0             	mov    r8,rsi
  8086cc:	be 00 00 00 00       	mov    esi,0x0
  8086d1:	89 c7                	mov    edi,eax
  8086d3:	e8 f1 f4 ff ff       	call   807bc9 <request>
        break;
  8086d8:	eb 61                	jmp    80873b <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  8086da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086de:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8086e1:	48 98                	cdqe   
  8086e3:	48 89 c6             	mov    rsi,rax
  8086e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086ea:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8086ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086f1:	8b 10                	mov    edx,DWORD PTR [rax]
  8086f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086f6:	49 89 f0             	mov    r8,rsi
  8086f9:	be 01 00 00 00       	mov    esi,0x1
  8086fe:	89 c7                	mov    edi,eax
  808700:	e8 c4 f4 ff ff       	call   807bc9 <request>
        break;
  808705:	eb 34                	jmp    80873b <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808707:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80870b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80870e:	48 98                	cdqe   
  808710:	48 89 c6             	mov    rsi,rax
  808713:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808717:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80871a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80871e:	8b 10                	mov    edx,DWORD PTR [rax]
  808720:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808723:	49 89 f0             	mov    r8,rsi
  808726:	be 02 00 00 00       	mov    esi,0x2
  80872b:	89 c7                	mov    edi,eax
  80872d:	e8 97 f4 ff ff       	call   807bc9 <request>
        break;
  808732:	eb 07                	jmp    80873b <hd_do_req+0xec>
    default:return -1;
  808734:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808739:	eb 1e                	jmp    808759 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80873b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80873f:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808746:	00 00 00 
    running_devman_req=args;
  808749:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80874d:	48 89 05 94 1d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21d94],rax        # 42a4e8 <running_devman_req>
    return 0;
  808754:	b8 00 00 00 00       	mov    eax,0x0
  808759:	c9                   	leave  
  80875a:	c3                   	ret    
  80875b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000808760 <disk_int_handler>:
  808760:	e8 99 cf ff ff       	call   8056fe <eoi>
  808765:	e8 70 f2 ff ff       	call   8079da <disk_int_handler_c>
  80876a:	48 cf                	iretq  

000000000080876c <read_disk_asm>:
  80876c:	55                   	push   rbp
  80876d:	89 e5                	mov    ebp,esp
  80876f:	66 ba f7 01          	mov    dx,0x1f7
  808773:	31 c9                	xor    ecx,ecx
  808775:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80877a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80877f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808784:	89 c6                	mov    esi,eax
  808786:	66 ba f2 01          	mov    dx,0x1f2
  80878a:	88 c8                	mov    al,cl
  80878c:	ee                   	out    dx,al
  80878d:	66 ba f3 01          	mov    dx,0x1f3
  808791:	89 f0                	mov    eax,esi
  808793:	ee                   	out    dx,al
  808794:	66 ff c2             	inc    dx
  808797:	c1 e8 08             	shr    eax,0x8
  80879a:	ee                   	out    dx,al
  80879b:	66 ff c2             	inc    dx
  80879e:	c1 e8 08             	shr    eax,0x8
  8087a1:	ee                   	out    dx,al
  8087a2:	66 ff c2             	inc    dx
  8087a5:	66 c1 e8 08          	shr    ax,0x8
  8087a9:	24 0f                	and    al,0xf
  8087ab:	0c e0                	or     al,0xe0
  8087ad:	ee                   	out    dx,al
  8087ae:	66 ff c2             	inc    dx
  8087b1:	b0 20                	mov    al,0x20
  8087b3:	ee                   	out    dx,al

00000000008087b4 <read_disk_asm.wait>:
  8087b4:	90                   	nop
  8087b5:	ec                   	in     al,dx
  8087b6:	24 88                	and    al,0x88
  8087b8:	3c 08                	cmp    al,0x8
  8087ba:	75 f8                	jne    8087b4 <read_disk_asm.wait>
  8087bc:	66 89 d7             	mov    di,dx
  8087bf:	89 c8                	mov    eax,ecx
  8087c1:	66 b9 00 01          	mov    cx,0x100
  8087c5:	66 f7 e1             	mul    cx
  8087c8:	89 c1                	mov    ecx,eax
  8087ca:	66 ba f0 01          	mov    dx,0x1f0

00000000008087ce <read_disk_asm.read>:
  8087ce:	66 ed                	in     ax,dx
  8087d0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  8087d4:	83 c3 02             	add    ebx,0x2
  8087d7:	e2 f5                	loop   8087ce <read_disk_asm.read>
  8087d9:	c9                   	leave  
  8087da:	b8 00 00 00 00       	mov    eax,0x0
  8087df:	c3                   	ret    

00000000008087e0 <read_disk_asm.err_disk_reading>:
  8087e0:	66 ba f1 01          	mov    dx,0x1f1
  8087e4:	31 c0                	xor    eax,eax
  8087e6:	66 ed                	in     ax,dx
  8087e8:	89 ec                	mov    esp,ebp
  8087ea:	5d                   	pop    rbp
  8087eb:	c3                   	ret    

00000000008087ec <write_disk_asm>:
  8087ec:	55                   	push   rbp
  8087ed:	89 e5                	mov    ebp,esp
  8087ef:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8087f4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8087f9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8087fe:	50                   	push   rax
  8087ff:	66 ba f2 01          	mov    dx,0x1f2
  808803:	88 c8                	mov    al,cl
  808805:	ee                   	out    dx,al
  808806:	58                   	pop    rax
  808807:	66 ba f3 01          	mov    dx,0x1f3
  80880b:	ee                   	out    dx,al
  80880c:	c1 e8 08             	shr    eax,0x8
  80880f:	66 ba f4 01          	mov    dx,0x1f4
  808813:	ee                   	out    dx,al
  808814:	c1 e8 08             	shr    eax,0x8
  808817:	66 ba f5 01          	mov    dx,0x1f5
  80881b:	ee                   	out    dx,al
  80881c:	c1 e8 08             	shr    eax,0x8
  80881f:	24 0f                	and    al,0xf
  808821:	0c e0                	or     al,0xe0
  808823:	66 ba f6 01          	mov    dx,0x1f6
  808827:	ee                   	out    dx,al
  808828:	66 ba f7 01          	mov    dx,0x1f7
  80882c:	b0 30                	mov    al,0x30
  80882e:	ee                   	out    dx,al

000000000080882f <write_disk_asm.not_ready2>:
  80882f:	90                   	nop
  808830:	ec                   	in     al,dx
  808831:	24 88                	and    al,0x88
  808833:	3c 08                	cmp    al,0x8
  808835:	75 f8                	jne    80882f <write_disk_asm.not_ready2>
  808837:	89 c8                	mov    eax,ecx
  808839:	66 b9 00 01          	mov    cx,0x100
  80883d:	66 f7 e1             	mul    cx
  808840:	89 c1                	mov    ecx,eax
  808842:	66 ba f0 01          	mov    dx,0x1f0

0000000000808846 <write_disk_asm.go_on_write>:
  808846:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80884a:	66 ef                	out    dx,ax
  80884c:	83 c3 02             	add    ebx,0x2
  80884f:	e2 f5                	loop   808846 <write_disk_asm.go_on_write>
  808851:	89 ec                	mov    esp,ebp
  808853:	5d                   	pop    rbp
  808854:	c3                   	ret    

0000000000808855 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808855:	f3 0f 1e fa          	endbr64 
  808859:	55                   	push   rbp
  80885a:	48 89 e5             	mov    rbp,rsp
  80885d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808864:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80886b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808871:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808878:	ba 00 02 00 00       	mov    edx,0x200
  80887d:	be 00 00 00 00       	mov    esi,0x0
  808882:	48 89 c7             	mov    rdi,rax
  808885:	e8 66 2e 00 00       	call   80b6f0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80888a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808891:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808895:	89 c2                	mov    edx,eax
  808897:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80889d:	c1 e8 07             	shr    eax,0x7
  8088a0:	01 d0                	add    eax,edx
  8088a2:	89 c2                	mov    edx,eax
  8088a4:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8088ab:	49 89 c0             	mov    r8,rax
  8088ae:	b9 01 00 00 00       	mov    ecx,0x1
  8088b3:	be 00 00 00 00       	mov    esi,0x0
  8088b8:	bf 00 00 00 00       	mov    edi,0x0
  8088bd:	e8 07 f3 ff ff       	call   807bc9 <request>
  8088c2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  8088c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8088c8:	89 c7                	mov    edi,eax
  8088ca:	e8 ae f9 ff ff       	call   80827d <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  8088cf:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088d5:	83 e0 7f             	and    eax,0x7f
  8088d8:	89 c0                	mov    eax,eax
  8088da:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  8088e1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088e7:	89 c6                	mov    esi,eax
  8088e9:	bf 78 40 81 00       	mov    edi,0x814078
  8088ee:	b8 00 00 00 00       	mov    eax,0x0
  8088f3:	e8 20 84 ff ff       	call   800d18 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  8088f8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088fe:	83 e0 7f             	and    eax,0x7f
  808901:	89 c0                	mov    eax,eax
  808903:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80890a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80890f:	c9                   	leave  
  808910:	c3                   	ret    

0000000000808911 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808911:	f3 0f 1e fa          	endbr64 
  808915:	55                   	push   rbp
  808916:	48 89 e5             	mov    rbp,rsp
  808919:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808920:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808927:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80892d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  808933:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80893a:	ba 00 02 00 00       	mov    edx,0x200
  80893f:	be 00 00 00 00       	mov    esi,0x0
  808944:	48 89 c7             	mov    rdi,rax
  808947:	e8 a4 2d 00 00       	call   80b6f0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80894c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808953:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808957:	89 c2                	mov    edx,eax
  808959:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80895f:	c1 e8 07             	shr    eax,0x7
  808962:	01 d0                	add    eax,edx
  808964:	89 c2                	mov    edx,eax
  808966:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80896d:	49 89 c0             	mov    r8,rax
  808970:	b9 01 00 00 00       	mov    ecx,0x1
  808975:	be 00 00 00 00       	mov    esi,0x0
  80897a:	bf 00 00 00 00       	mov    edi,0x0
  80897f:	e8 45 f2 ff ff       	call   807bc9 <request>
  808984:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  808987:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80898a:	89 c7                	mov    edi,eax
  80898c:	e8 ec f8 ff ff       	call   80827d <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  808991:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808997:	83 e0 7f             	and    eax,0x7f
  80899a:	89 c0                	mov    eax,eax
  80899c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  8089a3:	25 00 00 00 f0       	and    eax,0xf0000000
  8089a8:	89 c6                	mov    esi,eax
  8089aa:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  8089b0:	25 ff ff ff 0f       	and    eax,0xfffffff
  8089b5:	89 c1                	mov    ecx,eax
  8089b7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8089bd:	83 e0 7f             	and    eax,0x7f
  8089c0:	89 c2                	mov    edx,eax
  8089c2:	89 f0                	mov    eax,esi
  8089c4:	09 c8                	or     eax,ecx
  8089c6:	89 d2                	mov    edx,edx
  8089c8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  8089cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8089d6:	eb 61                	jmp    808a39 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  8089d8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8089df:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8089e3:	89 c1                	mov    ecx,eax
  8089e5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8089ec:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8089f0:	89 c2                	mov    edx,eax
  8089f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8089f5:	48 98                	cdqe   
  8089f7:	0f af c2             	imul   eax,edx
  8089fa:	8d 14 01             	lea    edx,[rcx+rax*1]
  8089fd:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808a03:	c1 e8 07             	shr    eax,0x7
  808a06:	01 d0                	add    eax,edx
  808a08:	89 c2                	mov    edx,eax
  808a0a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808a11:	49 89 c0             	mov    r8,rax
  808a14:	b9 01 00 00 00       	mov    ecx,0x1
  808a19:	be 01 00 00 00       	mov    esi,0x1
  808a1e:	bf 00 00 00 00       	mov    edi,0x0
  808a23:	e8 a1 f1 ff ff       	call   807bc9 <request>
  808a28:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  808a2b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808a2e:	89 c7                	mov    edi,eax
  808a30:	e8 48 f8 ff ff       	call   80827d <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  808a35:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808a39:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808a3c:	48 63 d0             	movsxd rdx,eax
  808a3f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808a46:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808a4a:	48 39 c2             	cmp    rdx,rax
  808a4d:	72 89                	jb     8089d8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  808a4f:	b8 01 00 00 00       	mov    eax,0x1
}
  808a54:	c9                   	leave  
  808a55:	c3                   	ret    

0000000000808a56 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  808a56:	f3 0f 1e fa          	endbr64 
  808a5a:	55                   	push   rbp
  808a5b:	48 89 e5             	mov    rbp,rsp
  808a5e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a62:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808a66:	b8 01 00 00 00       	mov    eax,0x1
}
  808a6b:	5d                   	pop    rbp
  808a6c:	c3                   	ret    

0000000000808a6d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  808a6d:	f3 0f 1e fa          	endbr64 
  808a71:	55                   	push   rbp
  808a72:	48 89 e5             	mov    rbp,rsp
  808a75:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a79:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808a7d:	b8 01 00 00 00       	mov    eax,0x1
}
  808a82:	5d                   	pop    rbp
  808a83:	c3                   	ret    

0000000000808a84 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  808a84:	f3 0f 1e fa          	endbr64 
  808a88:	55                   	push   rbp
  808a89:	48 89 e5             	mov    rbp,rsp
  808a8c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808a90:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  808a94:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  808a98:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  808a9c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808aa0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808aa4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808aa8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808aac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ab0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808ab4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ab8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808abc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ac0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ac4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ac8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  808acc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808ad0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808ad3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  808ad7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808ade:	00 
	int i,length = 0;
  808adf:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  808ae6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808aed:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808aee:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808af2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808af5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808af9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808afd:	48 99                	cqo    
  808aff:	48 f7 fe             	idiv   rsi
  808b02:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808b05:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b0c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b10:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808b14:	48 99                	cqo    
  808b16:	48 f7 f9             	idiv   rcx
  808b19:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808b1d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b21:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b25:	be 00 00 00 00       	mov    esi,0x0
  808b2a:	48 89 c7             	mov    rdi,rax
  808b2d:	b8 00 00 00 00       	mov    eax,0x0
  808b32:	e8 73 87 ff ff       	call   8012aa <vmalloc>
  808b37:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  808b3b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808b40:	75 0c                	jne    808b4e <FAT32_read+0xca>
		return -EFAULT;
  808b42:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808b49:	e9 f0 01 00 00       	jmp    808d3e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  808b4e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808b55:	eb 1e                	jmp    808b75 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808b57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b5b:	89 c2                	mov    edx,eax
  808b5d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b61:	89 d6                	mov    esi,edx
  808b63:	48 89 c7             	mov    rdi,rax
  808b66:	e8 ea fc ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  808b6b:	89 c0                	mov    eax,eax
  808b6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  808b71:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808b75:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b78:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808b7b:	7c da                	jl     808b57 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  808b7d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b81:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b84:	48 89 c2             	mov    rdx,rax
  808b87:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808b8b:	48 01 c2             	add    rdx,rax
  808b8e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b92:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b96:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808b9a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b9d:	48 39 c2             	cmp    rdx,rax
  808ba0:	76 2c                	jbe    808bce <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  808ba2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ba6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808baa:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808bae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808bb1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808bb5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808bb8:	48 89 c1             	mov    rcx,rax
  808bbb:	48 89 d0             	mov    rax,rdx
  808bbe:	48 29 c8             	sub    rax,rcx
  808bc1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  808bc5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808bc9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  808bcc:	eb 07                	jmp    808bd5 <FAT32_read+0x151>
	else
		index = count;
  808bce:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808bd2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  808bd5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808bd9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808bdd:	89 c2                	mov    edx,eax
  808bdf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808be3:	be 00 00 00 00       	mov    esi,0x0
  808be8:	48 89 c7             	mov    rdi,rax
  808beb:	e8 00 2b 00 00       	call   80b6f0 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808bf0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808bf4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808bf8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808bfc:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808c00:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c04:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c08:	48 0f af c2          	imul   rax,rdx
  808c0c:	48 01 c8             	add    rax,rcx
  808c0f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808c13:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c17:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c1b:	89 c1                	mov    ecx,eax
  808c1d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808c21:	89 c2                	mov    edx,eax
  808c23:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c27:	49 89 c0             	mov    r8,rax
  808c2a:	be 00 00 00 00       	mov    esi,0x0
  808c2f:	bf 00 00 00 00       	mov    edi,0x0
  808c34:	e8 90 ef ff ff       	call   807bc9 <request>
  808c39:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  808c3c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808c3f:	89 c7                	mov    edi,eax
  808c41:	e8 37 f6 ff ff       	call   80827d <chk_result>
  808c46:	85 c0                	test   eax,eax
  808c48:	75 1c                	jne    808c66 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  808c4a:	bf a8 40 81 00       	mov    edi,0x8140a8
  808c4f:	b8 00 00 00 00       	mov    eax,0x0
  808c54:	e8 bf 80 ff ff       	call   800d18 <printf>
			retval = -EIO;
  808c59:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  808c60:	ff 
			break;
  808c61:	e9 ba 00 00 00       	jmp    808d20 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808c66:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808c69:	48 63 d0             	movsxd rdx,eax
  808c6c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c70:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c74:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  808c78:	48 39 c2             	cmp    rdx,rax
  808c7b:	48 0f 4e c2          	cmovle rax,rdx
  808c7f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  808c82:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808c86:	48 83 f8 1f          	cmp    rax,0x1f
  808c8a:	77 1f                	ja     808cab <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  808c8c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808c8f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808c93:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c97:	48 01 c1             	add    rcx,rax
  808c9a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808c9e:	48 89 c6             	mov    rsi,rax
  808ca1:	48 89 cf             	mov    rdi,rcx
  808ca4:	e8 98 29 00 00       	call   80b641 <memcpy>
  808ca9:	eb 1d                	jmp    808cc8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  808cab:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808cae:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808cb2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808cb6:	48 01 c1             	add    rcx,rax
  808cb9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808cbd:	48 89 c6             	mov    rsi,rax
  808cc0:	48 89 cf             	mov    rdi,rcx
  808cc3:	e8 79 29 00 00       	call   80b641 <memcpy>

		index -= length;
  808cc8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808ccb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  808cce:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808cd1:	48 98                	cdqe   
  808cd3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  808cd7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808cde:	00 
		*position += length;
  808cdf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808ce3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808ce6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808ce9:	48 98                	cdqe   
  808ceb:	48 01 c2             	add    rdx,rax
  808cee:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808cf2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  808cf5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808cf9:	74 25                	je     808d20 <FAT32_read+0x29c>
  808cfb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808cff:	89 c2                	mov    edx,eax
  808d01:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808d05:	89 d6                	mov    esi,edx
  808d07:	48 89 c7             	mov    rdi,rax
  808d0a:	e8 46 fb ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  808d0f:	89 c0                	mov    eax,eax
  808d11:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808d15:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808d1a:	0f 85 b5 fe ff ff    	jne    808bd5 <FAT32_read+0x151>

	vmfree(buffer);
  808d20:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808d24:	48 89 c7             	mov    rdi,rax
  808d27:	e8 0d 86 ff ff       	call   801339 <vmfree>
	if(!index)
  808d2c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808d30:	75 08                	jne    808d3a <FAT32_read+0x2b6>
		retval = count;
  808d32:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808d36:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  808d3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  808d3e:	c9                   	leave  
  808d3f:	c3                   	ret    

0000000000808d40 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  808d40:	f3 0f 1e fa          	endbr64 
  808d44:	55                   	push   rbp
  808d45:	48 89 e5             	mov    rbp,rsp
  808d48:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  808d4f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  808d56:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808d5d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808d61:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  808d65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808d6c:	e9 8b 00 00 00       	jmp    808dfc <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  808d71:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808d78:	ba 00 02 00 00       	mov    edx,0x200
  808d7d:	be 00 00 00 00       	mov    esi,0x0
  808d82:	48 89 c7             	mov    rdi,rax
  808d85:	e8 66 29 00 00       	call   80b6f0 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  808d8a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808d91:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808d95:	89 c2                	mov    edx,eax
  808d97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d9a:	01 d0                	add    eax,edx
  808d9c:	89 c2                	mov    edx,eax
  808d9e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808da5:	49 89 c0             	mov    r8,rax
  808da8:	b9 01 00 00 00       	mov    ecx,0x1
  808dad:	be 00 00 00 00       	mov    esi,0x0
  808db2:	bf 00 00 00 00       	mov    edi,0x0
  808db7:	e8 0d ee ff ff       	call   807bc9 <request>
  808dbc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  808dbf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808dc6:	eb 2a                	jmp    808df2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  808dc8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808dcb:	48 98                	cdqe   
  808dcd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  808dd4:	25 ff ff ff 0f       	and    eax,0xfffffff
  808dd9:	85 c0                	test   eax,eax
  808ddb:	75 11                	jne    808dee <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  808ddd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808de0:	c1 e0 07             	shl    eax,0x7
  808de3:	89 c2                	mov    edx,eax
  808de5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808de8:	01 d0                	add    eax,edx
  808dea:	48 98                	cdqe   
  808dec:	eb 22                	jmp    808e10 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  808dee:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808df2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  808df6:	7e d0                	jle    808dc8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  808df8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808dfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808dff:	48 98                	cdqe   
  808e01:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  808e05:	0f 87 66 ff ff ff    	ja     808d71 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  808e0b:	b8 00 00 00 00       	mov    eax,0x0
}
  808e10:	c9                   	leave  
  808e11:	c3                   	ret    

0000000000808e12 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  808e12:	f3 0f 1e fa          	endbr64 
  808e16:	55                   	push   rbp
  808e17:	48 89 e5             	mov    rbp,rsp
  808e1a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  808e21:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  808e25:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  808e29:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808e30:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808e37:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808e3b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e3f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e43:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e47:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808e4b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808e4f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e53:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e57:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808e5b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e5f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  808e63:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808e67:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e6a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  808e6e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  808e75:	00 
	unsigned long sector = 0;
  808e76:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808e7d:	00 
	int i,length = 0;
  808e7e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  808e85:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808e8c:	00 
	long flags = 0;
  808e8d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808e94:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808e95:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808e9c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e9f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808ea3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808ea7:	48 99                	cqo    
  808ea9:	48 f7 fe             	idiv   rsi
  808eac:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808eaf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808eb6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808eb9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808ebd:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808ec1:	48 99                	cqo    
  808ec3:	48 f7 f9             	idiv   rcx
  808ec6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808eca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808ece:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ed2:	be 00 00 00 00       	mov    esi,0x0
  808ed7:	48 89 c7             	mov    rdi,rax
  808eda:	b8 00 00 00 00       	mov    eax,0x0
  808edf:	e8 c6 83 ff ff       	call   8012aa <vmalloc>
  808ee4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  808ee8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808eed:	75 1a                	jne    808f09 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  808eef:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808ef3:	48 89 c7             	mov    rdi,rax
  808ef6:	e8 45 fe ff ff       	call   808d40 <FAT32_find_available_cluster>
  808efb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  808eff:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808f06:	00 
  808f07:	eb 2f                	jmp    808f38 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  808f09:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808f10:	eb 1e                	jmp    808f30 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808f12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f16:	89 c2                	mov    edx,eax
  808f18:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f1c:	89 d6                	mov    esi,edx
  808f1e:	48 89 c7             	mov    rdi,rax
  808f21:	e8 2f f9 ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  808f26:	89 c0                	mov    eax,eax
  808f28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  808f2c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808f30:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f33:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  808f36:	7c da                	jl     808f12 <FAT32_write+0x100>

	if(!cluster)
  808f38:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808f3d:	75 18                	jne    808f57 <FAT32_write+0x145>
	{
		vmfree(buffer);
  808f3f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f43:	48 89 c7             	mov    rdi,rax
  808f46:	e8 ee 83 ff ff       	call   801339 <vmfree>
		return -ENOSPC;
  808f4b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808f52:	e9 13 03 00 00       	jmp    80926a <FAT32_write+0x458>
	}

	if(flags)
  808f57:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808f5c:	74 4d                	je     808fab <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  808f5e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808f62:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808f66:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808f69:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808f6d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f71:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f75:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f79:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808f7d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808f81:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808f85:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f89:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f8d:	48 89 c7             	mov    rdi,rax
  808f90:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  808f92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f96:	89 c1                	mov    ecx,eax
  808f98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f9c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  808fa1:	89 ce                	mov    esi,ecx
  808fa3:	48 89 c7             	mov    rdi,rax
  808fa6:	e8 66 f9 ff ff       	call   808911 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  808fab:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808fb2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  808fb5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808fba:	0f 85 91 00 00 00    	jne    809051 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  808fc0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fc4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808fc8:	89 c2                	mov    edx,eax
  808fca:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fce:	be 00 00 00 00       	mov    esi,0x0
  808fd3:	48 89 c7             	mov    rdi,rax
  808fd6:	e8 15 27 00 00       	call   80b6f0 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808fdb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fdf:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808fe3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fe7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808feb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fef:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ff3:	48 0f af c2          	imul   rax,rdx
  808ff7:	48 01 c8             	add    rax,rcx
  808ffa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808ffe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809002:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809006:	89 c1                	mov    ecx,eax
  809008:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80900c:	89 c2                	mov    edx,eax
  80900e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809012:	49 89 c0             	mov    r8,rax
  809015:	be 00 00 00 00       	mov    esi,0x0
  80901a:	bf 00 00 00 00       	mov    edi,0x0
  80901f:	e8 a5 eb ff ff       	call   807bc9 <request>
  809024:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  809027:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80902a:	89 c7                	mov    edi,eax
  80902c:	e8 4c f2 ff ff       	call   80827d <chk_result>
  809031:	85 c0                	test   eax,eax
  809033:	75 1c                	jne    809051 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809035:	bf d8 40 81 00       	mov    edi,0x8140d8
  80903a:	b8 00 00 00 00       	mov    eax,0x0
  80903f:	e8 d4 7c ff ff       	call   800d18 <printf>
				retval = -EIO;
  809044:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80904b:	ff 
				break;
  80904c:	e9 95 01 00 00       	jmp    8091e6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809051:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809054:	48 63 d0             	movsxd rdx,eax
  809057:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80905b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80905f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809063:	48 39 c2             	cmp    rdx,rax
  809066:	48 0f 4e c2          	cmovle rax,rdx
  80906a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80906d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809071:	48 83 f8 1f          	cmp    rax,0x1f
  809075:	77 1f                	ja     809096 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809077:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80907a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80907e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809082:	48 01 c1             	add    rcx,rax
  809085:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809089:	48 89 ce             	mov    rsi,rcx
  80908c:	48 89 c7             	mov    rdi,rax
  80908f:	e8 ad 25 00 00       	call   80b641 <memcpy>
  809094:	eb 1d                	jmp    8090b3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809096:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809099:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80909d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090a1:	48 01 c1             	add    rcx,rax
  8090a4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8090a8:	48 89 ce             	mov    rsi,rcx
  8090ab:	48 89 c7             	mov    rdi,rax
  8090ae:	e8 8e 25 00 00       	call   80b641 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8090b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090b7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8090bb:	89 c1                	mov    ecx,eax
  8090bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8090c1:	89 c2                	mov    edx,eax
  8090c3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090c7:	49 89 c0             	mov    r8,rax
  8090ca:	be 01 00 00 00       	mov    esi,0x1
  8090cf:	bf 00 00 00 00       	mov    edi,0x0
  8090d4:	e8 f0 ea ff ff       	call   807bc9 <request>
  8090d9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  8090dc:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  8090df:	89 c7                	mov    edi,eax
  8090e1:	e8 97 f1 ff ff       	call   80827d <chk_result>
  8090e6:	85 c0                	test   eax,eax
  8090e8:	75 1c                	jne    809106 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8090ea:	bf 08 41 81 00       	mov    edi,0x814108
  8090ef:	b8 00 00 00 00       	mov    eax,0x0
  8090f4:	e8 1f 7c ff ff       	call   800d18 <printf>
			retval = -EIO;
  8090f9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809100:	ff 
			break;
  809101:	e9 e0 00 00 00       	jmp    8091e6 <FAT32_write+0x3d4>
		}

		index -= length;
  809106:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809109:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80910c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80910f:	48 98                	cdqe   
  809111:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809115:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80911c:	00 
		*position += length;
  80911d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809124:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809127:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80912a:	48 98                	cdqe   
  80912c:	48 01 c2             	add    rdx,rax
  80912f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809136:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809139:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80913d:	0f 84 a2 00 00 00    	je     8091e5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809143:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809147:	89 c2                	mov    edx,eax
  809149:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80914d:	89 d6                	mov    esi,edx
  80914f:	48 89 c7             	mov    rdi,rax
  809152:	e8 fe f6 ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  809157:	89 c0                	mov    eax,eax
  809159:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80915d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809164:	0f 
  809165:	76 72                	jbe    8091d9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809167:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80916b:	48 89 c7             	mov    rdi,rax
  80916e:	e8 cd fb ff ff       	call   808d40 <FAT32_find_available_cluster>
  809173:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809177:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80917c:	75 18                	jne    809196 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80917e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809182:	48 89 c7             	mov    rdi,rax
  809185:	e8 af 81 ff ff       	call   801339 <vmfree>
				return -ENOSPC;
  80918a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809191:	e9 d4 00 00 00       	jmp    80926a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809196:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80919a:	89 c2                	mov    edx,eax
  80919c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091a0:	89 c1                	mov    ecx,eax
  8091a2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091a6:	89 ce                	mov    esi,ecx
  8091a8:	48 89 c7             	mov    rdi,rax
  8091ab:	e8 61 f7 ff ff       	call   808911 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  8091b0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091b4:	89 c1                	mov    ecx,eax
  8091b6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091ba:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  8091bf:	89 ce                	mov    esi,ecx
  8091c1:	48 89 c7             	mov    rdi,rax
  8091c4:	e8 48 f7 ff ff       	call   808911 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  8091c9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  8091d1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8091d8:	00 
		}

	}while(index);
  8091d9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8091dd:	0f 85 d2 fd ff ff    	jne    808fb5 <FAT32_write+0x1a3>
  8091e3:	eb 01                	jmp    8091e6 <FAT32_write+0x3d4>
			break;
  8091e5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8091e6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8091ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091f0:	48 89 c2             	mov    rdx,rax
  8091f3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8091f7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091fb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809202:	48 39 c2             	cmp    rdx,rax
  809205:	76 42                	jbe    809249 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  809207:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80920e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809211:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809215:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809219:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80921d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809220:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809224:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809228:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80922c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809230:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809234:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809238:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80923c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809240:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809244:	48 89 c7             	mov    rdi,rax
  809247:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809249:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80924d:	48 89 c7             	mov    rdi,rax
  809250:	e8 e4 80 ff ff       	call   801339 <vmfree>
	if(!index)
  809255:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809259:	75 0b                	jne    809266 <FAT32_write+0x454>
		retval = count;
  80925b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809262:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809266:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80926a:	c9                   	leave  
  80926b:	c3                   	ret    

000000000080926c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80926c:	f3 0f 1e fa          	endbr64 
  809270:	55                   	push   rbp
  809271:	48 89 e5             	mov    rbp,rsp
  809274:	48 83 ec 30          	sub    rsp,0x30
  809278:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80927c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809280:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809284:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809288:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80928c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809290:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809294:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80929b:	00 

	switch(origin)
  80929c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8092a1:	74 21                	je     8092c4 <FAT32_lseek+0x58>
  8092a3:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8092a8:	7f 4a                	jg     8092f4 <FAT32_lseek+0x88>
  8092aa:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8092af:	74 09                	je     8092ba <FAT32_lseek+0x4e>
  8092b1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  8092b6:	74 20                	je     8092d8 <FAT32_lseek+0x6c>
  8092b8:	eb 3a                	jmp    8092f4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  8092ba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8092c2:	eb 39                	jmp    8092fd <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  8092c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092c8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092cf:	48 01 d0             	add    rax,rdx
  8092d2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8092d6:	eb 25                	jmp    8092fd <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  8092d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092dc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092e0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092e4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092eb:	48 01 d0             	add    rax,rdx
  8092ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8092f2:	eb 09                	jmp    8092fd <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  8092f4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8092fb:	eb 50                	jmp    80934d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  8092fd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809302:	78 18                	js     80931c <FAT32_lseek+0xb0>
  809304:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809308:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80930c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809310:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809313:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809317:	48 39 c2             	cmp    rdx,rax
  80931a:	73 09                	jae    809325 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80931c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809323:	eb 28                	jmp    80934d <FAT32_lseek+0xe1>

	filp->position = pos;
  809325:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809329:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80932d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809330:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809334:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809337:	48 89 c6             	mov    rsi,rax
  80933a:	bf 38 41 81 00       	mov    edi,0x814138
  80933f:	b8 00 00 00 00       	mov    eax,0x0
  809344:	e8 cf 79 ff ff       	call   800d18 <printf>

	return pos;
  809349:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80934d:	c9                   	leave  
  80934e:	c3                   	ret    

000000000080934f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80934f:	f3 0f 1e fa          	endbr64 
  809353:	55                   	push   rbp
  809354:	48 89 e5             	mov    rbp,rsp
  809357:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80935b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80935f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809363:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809367:	90                   	nop
  809368:	5d                   	pop    rbp
  809369:	c3                   	ret    

000000000080936a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80936a:	f3 0f 1e fa          	endbr64 
  80936e:	55                   	push   rbp
  80936f:	48 89 e5             	mov    rbp,rsp
  809372:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809376:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80937a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80937e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809382:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809386:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80938a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80938e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809392:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809396:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80939a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80939e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8093a2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8093a6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093aa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  8093ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8093b5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  8093bc:	00 
	unsigned char * buf =NULL; 
  8093bd:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  8093c4:	00 
	char *name = NULL;
  8093c5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8093cc:	00 
	int namelen = 0;
  8093cd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  8093d4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8093db:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  8093e2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8093e9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8093f0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8093f7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  8093f8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8093ff:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809400:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809404:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809408:	be 00 00 00 00       	mov    esi,0x0
  80940d:	48 89 c7             	mov    rdi,rax
  809410:	b8 00 00 00 00       	mov    eax,0x0
  809415:	e8 90 7e ff ff       	call   8012aa <vmalloc>
  80941a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80941e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809422:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809425:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809428:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80942c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80942f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809433:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809437:	48 99                	cqo    
  809439:	48 f7 fe             	idiv   rsi
  80943c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80943f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809446:	eb 3a                	jmp    809482 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809448:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80944b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80944f:	89 d6                	mov    esi,edx
  809451:	48 89 c7             	mov    rdi,rax
  809454:	e8 fc f3 ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  809459:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80945c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  809463:	76 19                	jbe    80947e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  809465:	bf 60 41 81 00       	mov    edi,0x814160
  80946a:	b8 00 00 00 00       	mov    eax,0x0
  80946f:	e8 a4 78 ff ff       	call   800d18 <printf>
			return NULL;
  809474:	b8 00 00 00 00       	mov    eax,0x0
  809479:	e9 86 05 00 00       	jmp    809a04 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80947e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  809482:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809485:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809488:	7c be                	jl     809448 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80948a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80948b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80948f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809493:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809496:	83 e8 02             	sub    eax,0x2
  809499:	89 c1                	mov    ecx,eax
  80949b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80949f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094a3:	48 0f af c1          	imul   rax,rcx
  8094a7:	48 01 d0             	add    rax,rdx
  8094aa:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8094ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094b2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094b6:	89 c1                	mov    ecx,eax
  8094b8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8094bc:	89 c2                	mov    edx,eax
  8094be:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8094c2:	49 89 c0             	mov    r8,rax
  8094c5:	be 00 00 00 00       	mov    esi,0x0
  8094ca:	bf 00 00 00 00       	mov    edi,0x0
  8094cf:	e8 f5 e6 ff ff       	call   807bc9 <request>
  8094d4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  8094d7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8094da:	89 c7                	mov    edi,eax
  8094dc:	e8 9c ed ff ff       	call   80827d <chk_result>
  8094e1:	85 c0                	test   eax,eax
  8094e3:	75 25                	jne    80950a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  8094e5:	bf 88 41 81 00       	mov    edi,0x814188
  8094ea:	b8 00 00 00 00       	mov    eax,0x0
  8094ef:	e8 24 78 ff ff       	call   800d18 <printf>
		vmfree(buf);
  8094f4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8094f8:	48 89 c7             	mov    rdi,rax
  8094fb:	e8 39 7e ff ff       	call   801339 <vmfree>
		return NULL;
  809500:	b8 00 00 00 00       	mov    eax,0x0
  809505:	e9 fa 04 00 00       	jmp    809a04 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80950a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80950e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809511:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809515:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809519:	48 99                	cqo    
  80951b:	48 f7 f9             	idiv   rcx
  80951e:	48 89 d0             	mov    rax,rdx
  809521:	48 89 c2             	mov    rdx,rax
  809524:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809528:	48 01 d0             	add    rax,rdx
  80952b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80952f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809533:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809536:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80953a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80953e:	48 99                	cqo    
  809540:	48 f7 f9             	idiv   rcx
  809543:	48 89 d0             	mov    rax,rdx
  809546:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  809549:	e9 2f 04 00 00       	jmp    80997d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80954e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809552:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809556:	3c 0f                	cmp    al,0xf
  809558:	0f 84 00 04 00 00    	je     80995e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80955e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809562:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809565:	3c e5                	cmp    al,0xe5
  809567:	0f 84 f4 03 00 00    	je     809961 <FAT32_readdir+0x5f7>
  80956d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809571:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809574:	84 c0                	test   al,al
  809576:	0f 84 e5 03 00 00    	je     809961 <FAT32_readdir+0x5f7>
  80957c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809580:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809583:	3c 05                	cmp    al,0x5
  809585:	0f 84 d6 03 00 00    	je     809961 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80958b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809592:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809596:	48 83 e8 20          	sub    rax,0x20
  80959a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80959e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095a2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8095a6:	3c 0f                	cmp    al,0xf
  8095a8:	0f 85 2a 02 00 00    	jne    8097d8 <FAT32_readdir+0x46e>
  8095ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095b5:	3c e5                	cmp    al,0xe5
  8095b7:	0f 84 1b 02 00 00    	je     8097d8 <FAT32_readdir+0x46e>
  8095bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095c4:	84 c0                	test   al,al
  8095c6:	0f 84 0c 02 00 00    	je     8097d8 <FAT32_readdir+0x46e>
  8095cc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095d3:	3c 05                	cmp    al,0x5
  8095d5:	0f 84 fd 01 00 00    	je     8097d8 <FAT32_readdir+0x46e>
		{
			j = 0;
  8095db:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8095e2:	eb 1a                	jmp    8095fe <FAT32_readdir+0x294>
			{
				j++;
  8095e4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  8095e8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095ef:	0f b6 c0             	movzx  eax,al
  8095f2:	83 e0 40             	and    eax,0x40
  8095f5:	85 c0                	test   eax,eax
  8095f7:	75 34                	jne    80962d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  8095f9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8095fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809602:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809606:	3c 0f                	cmp    al,0xf
  809608:	75 24                	jne    80962e <FAT32_readdir+0x2c4>
  80960a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80960e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809611:	3c e5                	cmp    al,0xe5
  809613:	74 19                	je     80962e <FAT32_readdir+0x2c4>
  809615:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809619:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80961c:	84 c0                	test   al,al
  80961e:	74 0e                	je     80962e <FAT32_readdir+0x2c4>
  809620:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809624:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809627:	3c 05                	cmp    al,0x5
  809629:	75 b9                	jne    8095e4 <FAT32_readdir+0x27a>
  80962b:	eb 01                	jmp    80962e <FAT32_readdir+0x2c4>
					break;
  80962d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80962e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809631:	89 d0                	mov    eax,edx
  809633:	01 c0                	add    eax,eax
  809635:	01 d0                	add    eax,edx
  809637:	c1 e0 02             	shl    eax,0x2
  80963a:	01 d0                	add    eax,edx
  80963c:	83 c0 01             	add    eax,0x1
  80963f:	be 00 00 00 00       	mov    esi,0x0
  809644:	89 c7                	mov    edi,eax
  809646:	b8 00 00 00 00       	mov    eax,0x0
  80964b:	e8 5a 7c ff ff       	call   8012aa <vmalloc>
  809650:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809654:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809657:	89 d0                	mov    eax,edx
  809659:	01 c0                	add    eax,eax
  80965b:	01 d0                	add    eax,edx
  80965d:	c1 e0 02             	shl    eax,0x2
  809660:	01 d0                	add    eax,edx
  809662:	83 c0 01             	add    eax,0x1
  809665:	89 c2                	mov    edx,eax
  809667:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80966b:	be 00 00 00 00       	mov    esi,0x0
  809670:	48 89 c7             	mov    rdi,rax
  809673:	e8 78 20 00 00       	call   80b6f0 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809678:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80967c:	48 83 e8 20          	sub    rax,0x20
  809680:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809684:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80968b:	e9 37 01 00 00       	jmp    8097c7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809690:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809697:	eb 53                	jmp    8096ec <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809699:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80969d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096a0:	48 63 d2             	movsxd rdx,edx
  8096a3:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8096a8:	66 83 f8 ff          	cmp    ax,0xffff
  8096ac:	74 3a                	je     8096e8 <FAT32_readdir+0x37e>
  8096ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096b2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096b5:	48 63 d2             	movsxd rdx,edx
  8096b8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8096bd:	66 85 c0             	test   ax,ax
  8096c0:	74 26                	je     8096e8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  8096c2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096c6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096c9:	48 63 d2             	movsxd rdx,edx
  8096cc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  8096d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096d4:	8d 50 01             	lea    edx,[rax+0x1]
  8096d7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8096da:	48 63 d0             	movsxd rdx,eax
  8096dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096e1:	48 01 d0             	add    rax,rdx
  8096e4:	89 ca                	mov    edx,ecx
  8096e6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  8096e8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8096ec:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  8096f0:	7e a7                	jle    809699 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  8096f2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8096f9:	eb 53                	jmp    80974e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8096fb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096ff:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809702:	48 63 d2             	movsxd rdx,edx
  809705:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80970a:	66 83 f8 ff          	cmp    ax,0xffff
  80970e:	74 3a                	je     80974a <FAT32_readdir+0x3e0>
  809710:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809714:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809717:	48 63 d2             	movsxd rdx,edx
  80971a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80971f:	66 85 c0             	test   ax,ax
  809722:	74 26                	je     80974a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809724:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809728:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80972b:	48 63 d2             	movsxd rdx,edx
  80972e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809733:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809736:	8d 50 01             	lea    edx,[rax+0x1]
  809739:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80973c:	48 63 d0             	movsxd rdx,eax
  80973f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809743:	48 01 d0             	add    rax,rdx
  809746:	89 ca                	mov    edx,ecx
  809748:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80974a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80974e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809752:	7e a7                	jle    8096fb <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809754:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80975b:	eb 5b                	jmp    8097b8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80975d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809761:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809764:	48 63 d2             	movsxd rdx,edx
  809767:	48 83 c2 08          	add    rdx,0x8
  80976b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809770:	66 83 f8 ff          	cmp    ax,0xffff
  809774:	74 3e                	je     8097b4 <FAT32_readdir+0x44a>
  809776:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80977a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80977d:	48 63 d2             	movsxd rdx,edx
  809780:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809785:	66 85 c0             	test   ax,ax
  809788:	74 2a                	je     8097b4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80978a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80978e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809791:	48 63 d2             	movsxd rdx,edx
  809794:	48 83 c2 08          	add    rdx,0x8
  809798:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80979d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8097a0:	8d 50 01             	lea    edx,[rax+0x1]
  8097a3:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8097a6:	48 63 d0             	movsxd rdx,eax
  8097a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097ad:	48 01 d0             	add    rax,rdx
  8097b0:	89 ca                	mov    edx,ecx
  8097b2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  8097b4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8097b8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  8097bc:	7e 9f                	jle    80975d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  8097be:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8097c2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  8097c7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8097ca:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8097cd:	0f 8c bd fe ff ff    	jl     809690 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  8097d3:	e9 f5 01 00 00       	jmp    8099cd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  8097d8:	be 00 00 00 00       	mov    esi,0x0
  8097dd:	bf 0f 00 00 00       	mov    edi,0xf
  8097e2:	b8 00 00 00 00       	mov    eax,0x0
  8097e7:	e8 be 7a ff ff       	call   8012aa <vmalloc>
  8097ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  8097f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097f4:	ba 0f 00 00 00       	mov    edx,0xf
  8097f9:	be 00 00 00 00       	mov    esi,0x0
  8097fe:	48 89 c7             	mov    rdi,rax
  809801:	e8 ea 1e 00 00       	call   80b6f0 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809806:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80980d:	eb 74                	jmp    809883 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80980f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809813:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809816:	48 98                	cdqe   
  809818:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80981c:	3c 20                	cmp    al,0x20
  80981e:	74 6b                	je     80988b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809820:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809824:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809828:	0f b6 c0             	movzx  eax,al
  80982b:	83 e0 08             	and    eax,0x8
  80982e:	85 c0                	test   eax,eax
  809830:	74 29                	je     80985b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809832:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809836:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809839:	48 98                	cdqe   
  80983b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80983f:	8d 48 20             	lea    ecx,[rax+0x20]
  809842:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809845:	8d 50 01             	lea    edx,[rax+0x1]
  809848:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80984b:	48 63 d0             	movsxd rdx,eax
  80984e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809852:	48 01 d0             	add    rax,rdx
  809855:	89 ca                	mov    edx,ecx
  809857:	88 10                	mov    BYTE PTR [rax],dl
  809859:	eb 24                	jmp    80987f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80985b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80985f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809862:	48 98                	cdqe   
  809864:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809868:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80986b:	8d 50 01             	lea    edx,[rax+0x1]
  80986e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809871:	48 63 d0             	movsxd rdx,eax
  809874:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809878:	48 01 d0             	add    rax,rdx
  80987b:	89 ca                	mov    edx,ecx
  80987d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80987f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809883:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809887:	7e 86                	jle    80980f <FAT32_readdir+0x4a5>
  809889:	eb 01                	jmp    80988c <FAT32_readdir+0x522>
				break;
  80988b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80988c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809890:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809894:	0f b6 c0             	movzx  eax,al
  809897:	83 e0 10             	and    eax,0x10
  80989a:	85 c0                	test   eax,eax
  80989c:	0f 85 27 01 00 00    	jne    8099c9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  8098a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8098a5:	8d 50 01             	lea    edx,[rax+0x1]
  8098a8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8098ab:	48 63 d0             	movsxd rdx,eax
  8098ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8098b2:	48 01 d0             	add    rax,rdx
  8098b5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  8098b8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  8098bf:	eb 74                	jmp    809935 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  8098c1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8098c5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8098c8:	48 98                	cdqe   
  8098ca:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8098ce:	3c 20                	cmp    al,0x20
  8098d0:	74 6b                	je     80993d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  8098d2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8098d6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  8098da:	0f b6 c0             	movzx  eax,al
  8098dd:	83 e0 10             	and    eax,0x10
  8098e0:	85 c0                	test   eax,eax
  8098e2:	74 29                	je     80990d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  8098e4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8098e8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8098eb:	48 98                	cdqe   
  8098ed:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8098f1:	8d 48 20             	lea    ecx,[rax+0x20]
  8098f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8098f7:	8d 50 01             	lea    edx,[rax+0x1]
  8098fa:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8098fd:	48 63 d0             	movsxd rdx,eax
  809900:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809904:	48 01 d0             	add    rax,rdx
  809907:	89 ca                	mov    edx,ecx
  809909:	88 10                	mov    BYTE PTR [rax],dl
  80990b:	eb 24                	jmp    809931 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80990d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809911:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809914:	48 98                	cdqe   
  809916:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80991a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80991d:	8d 50 01             	lea    edx,[rax+0x1]
  809920:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809923:	48 63 d0             	movsxd rdx,eax
  809926:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80992a:	48 01 d0             	add    rax,rdx
  80992d:	89 ca                	mov    edx,ecx
  80992f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  809931:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809935:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  809939:	7e 86                	jle    8098c1 <FAT32_readdir+0x557>
  80993b:	eb 01                	jmp    80993e <FAT32_readdir+0x5d4>
				break;
  80993d:	90                   	nop
		}
		if(x == 8)
  80993e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  809942:	0f 85 84 00 00 00    	jne    8099cc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  809948:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80994c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80994f:	48 63 d0             	movsxd rdx,eax
  809952:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809956:	48 01 d0             	add    rax,rdx
  809959:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80995c:	eb 6e                	jmp    8099cc <FAT32_readdir+0x662>
			continue;
  80995e:	90                   	nop
  80995f:	eb 01                	jmp    809962 <FAT32_readdir+0x5f8>
			continue;
  809961:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809962:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  809966:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80996b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80996f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809972:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809976:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80997a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80997d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809980:	48 63 d0             	movsxd rdx,eax
  809983:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809987:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80998b:	48 39 c2             	cmp    rdx,rax
  80998e:	0f 8c ba fb ff ff    	jl     80954e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809994:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809997:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80999b:	89 d6                	mov    esi,edx
  80999d:	48 89 c7             	mov    rdi,rax
  8099a0:	e8 b0 ee ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  8099a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  8099a8:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  8099af:	77 05                	ja     8099b6 <FAT32_readdir+0x64c>
		goto next_cluster;
  8099b1:	e9 d5 fa ff ff       	jmp    80948b <FAT32_readdir+0x121>

	vmfree(buf);
  8099b6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099ba:	48 89 c7             	mov    rdi,rax
  8099bd:	e8 77 79 ff ff       	call   801339 <vmfree>
	return NULL;
  8099c2:	b8 00 00 00 00       	mov    eax,0x0
  8099c7:	eb 3b                	jmp    809a04 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  8099c9:	90                   	nop
  8099ca:	eb 01                	jmp    8099cd <FAT32_readdir+0x663>
		goto find_lookup_success;
  8099cc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  8099cd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8099d4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  8099d8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099dc:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  8099df:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8099e2:	48 63 d0             	movsxd rdx,eax
  8099e5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  8099e9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8099ed:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  8099f1:	41 b8 00 00 00 00    	mov    r8d,0x0
  8099f7:	b9 00 00 00 00       	mov    ecx,0x0
  8099fc:	48 89 c7             	mov    rdi,rax
  8099ff:	41 ff d1             	call   r9
  809a02:	48 98                	cdqe   
}
  809a04:	c9                   	leave  
  809a05:	c3                   	ret    

0000000000809a06 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809a06:	f3 0f 1e fa          	endbr64 
  809a0a:	55                   	push   rbp
  809a0b:	48 89 e5             	mov    rbp,rsp
  809a0e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a12:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809a16:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809a19:	90                   	nop
  809a1a:	5d                   	pop    rbp
  809a1b:	c3                   	ret    

0000000000809a1c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  809a1c:	f3 0f 1e fa          	endbr64 
  809a20:	55                   	push   rbp
  809a21:	48 89 e5             	mov    rbp,rsp
  809a24:	48 83 ec 60          	sub    rsp,0x60
  809a28:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  809a2c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  809a30:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809a34:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a38:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  809a3c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809a40:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a44:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a48:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  809a4c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809a53:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809a5a:	00 
	unsigned char * buf =NULL; 
  809a5b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  809a62:	00 
	int i = 0,j = 0,x = 0;
  809a63:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809a6a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809a71:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809a78:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809a7f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809a80:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809a87:	00 
	struct index_node * p = NULL;
  809a88:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  809a8f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809a90:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a94:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a98:	be 00 00 00 00       	mov    esi,0x0
  809a9d:	48 89 c7             	mov    rdi,rax
  809aa0:	b8 00 00 00 00       	mov    eax,0x0
  809aa5:	e8 00 78 ff ff       	call   8012aa <vmalloc>
  809aaa:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  809aae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809ab2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ab5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809ab8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809abc:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809ac0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ac3:	83 e8 02             	sub    eax,0x2
  809ac6:	89 c1                	mov    ecx,eax
  809ac8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809acc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ad0:	48 0f af c1          	imul   rax,rcx
  809ad4:	48 01 d0             	add    rax,rdx
  809ad7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  809adb:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809adf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ae2:	89 c6                	mov    esi,eax
  809ae4:	bf b8 41 81 00       	mov    edi,0x8141b8
  809ae9:	b8 00 00 00 00       	mov    eax,0x0
  809aee:	e8 25 72 ff ff       	call   800d18 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809af3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809af7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809afb:	89 c1                	mov    ecx,eax
  809afd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b01:	89 c2                	mov    edx,eax
  809b03:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b07:	49 89 c0             	mov    r8,rax
  809b0a:	be 00 00 00 00       	mov    esi,0x0
  809b0f:	bf 00 00 00 00       	mov    edi,0x0
  809b14:	e8 b0 e0 ff ff       	call   807bc9 <request>
  809b19:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  809b1c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  809b1f:	89 c7                	mov    edi,eax
  809b21:	e8 57 e7 ff ff       	call   80827d <chk_result>
  809b26:	85 c0                	test   eax,eax
  809b28:	75 25                	jne    809b4f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  809b2a:	bf e0 41 81 00       	mov    edi,0x8141e0
  809b2f:	b8 00 00 00 00       	mov    eax,0x0
  809b34:	e8 df 71 ff ff       	call   800d18 <printf>
		vmfree(buf);
  809b39:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b3d:	48 89 c7             	mov    rdi,rax
  809b40:	e8 f4 77 ff ff       	call   801339 <vmfree>
		return NULL;
  809b45:	b8 00 00 00 00       	mov    eax,0x0
  809b4a:	e9 f0 07 00 00       	jmp    80a33f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  809b4f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b53:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  809b57:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809b5e:	e9 9d 05 00 00       	jmp    80a100 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809b63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b67:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809b6b:	3c 0f                	cmp    al,0xf
  809b6d:	0f 84 59 05 00 00    	je     80a0cc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809b73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b77:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b7a:	3c e5                	cmp    al,0xe5
  809b7c:	0f 84 4d 05 00 00    	je     80a0cf <FAT32_lookup+0x6b3>
  809b82:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b89:	84 c0                	test   al,al
  809b8b:	0f 84 3e 05 00 00    	je     80a0cf <FAT32_lookup+0x6b3>
  809b91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b95:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b98:	3c 05                	cmp    al,0x5
  809b9a:	0f 84 2f 05 00 00    	je     80a0cf <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809ba0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ba4:	48 83 e8 20          	sub    rax,0x20
  809ba8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  809bac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809bb3:	e9 88 01 00 00       	jmp    809d40 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  809bb8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809bbf:	eb 6a                	jmp    809c2b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  809bc1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bc5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809bc8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bcb:	7e 15                	jle    809be2 <FAT32_lookup+0x1c6>
  809bcd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809bd1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809bd4:	48 63 d2             	movsxd rdx,edx
  809bd7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809bdc:	66 83 f8 ff          	cmp    ax,0xffff
  809be0:	74 44                	je     809c26 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  809be2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809be6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809be9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bec:	0f 8f e0 04 00 00    	jg     80a0d2 <FAT32_lookup+0x6b6>
  809bf2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809bf6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809bf9:	48 63 d2             	movsxd rdx,edx
  809bfc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809c01:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c05:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809c08:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809c0b:	8d 50 01             	lea    edx,[rax+0x1]
  809c0e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809c11:	48 98                	cdqe   
  809c13:	48 01 f0             	add    rax,rsi
  809c16:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c19:	66 98                	cbw    
  809c1b:	66 39 c1             	cmp    cx,ax
  809c1e:	0f 85 ae 04 00 00    	jne    80a0d2 <FAT32_lookup+0x6b6>
  809c24:	eb 01                	jmp    809c27 <FAT32_lookup+0x20b>
					continue;
  809c26:	90                   	nop
			for(x=0;x<5;x++)
  809c27:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809c2b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  809c2f:	7e 90                	jle    809bc1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  809c31:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809c38:	eb 6a                	jmp    809ca4 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  809c3a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c3e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c41:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c44:	7e 15                	jle    809c5b <FAT32_lookup+0x23f>
  809c46:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c4a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c4d:	48 63 d2             	movsxd rdx,edx
  809c50:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809c55:	66 83 f8 ff          	cmp    ax,0xffff
  809c59:	74 44                	je     809c9f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  809c5b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c5f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c62:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c65:	0f 8f 6a 04 00 00    	jg     80a0d5 <FAT32_lookup+0x6b9>
  809c6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c6f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c72:	48 63 d2             	movsxd rdx,edx
  809c75:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809c7a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c7e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809c81:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809c84:	8d 50 01             	lea    edx,[rax+0x1]
  809c87:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809c8a:	48 98                	cdqe   
  809c8c:	48 01 f0             	add    rax,rsi
  809c8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c92:	66 98                	cbw    
  809c94:	66 39 c1             	cmp    cx,ax
  809c97:	0f 85 38 04 00 00    	jne    80a0d5 <FAT32_lookup+0x6b9>
  809c9d:	eb 01                	jmp    809ca0 <FAT32_lookup+0x284>
					continue;
  809c9f:	90                   	nop
			for(x=0;x<6;x++)
  809ca0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809ca4:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  809ca8:	7e 90                	jle    809c3a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  809caa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809cb1:	eb 72                	jmp    809d25 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  809cb3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cb7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809cba:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809cbd:	7e 19                	jle    809cd8 <FAT32_lookup+0x2bc>
  809cbf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cc3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809cc6:	48 63 d2             	movsxd rdx,edx
  809cc9:	48 83 c2 08          	add    rdx,0x8
  809ccd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809cd2:	66 83 f8 ff          	cmp    ax,0xffff
  809cd6:	74 48                	je     809d20 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  809cd8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cdc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809cdf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809ce2:	0f 8f f0 03 00 00    	jg     80a0d8 <FAT32_lookup+0x6bc>
  809ce8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cec:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809cef:	48 63 d2             	movsxd rdx,edx
  809cf2:	48 83 c2 08          	add    rdx,0x8
  809cf6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809cfb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cff:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809d02:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809d05:	8d 50 01             	lea    edx,[rax+0x1]
  809d08:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809d0b:	48 98                	cdqe   
  809d0d:	48 01 f0             	add    rax,rsi
  809d10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d13:	66 98                	cbw    
  809d15:	66 39 c1             	cmp    cx,ax
  809d18:	0f 85 ba 03 00 00    	jne    80a0d8 <FAT32_lookup+0x6bc>
  809d1e:	eb 01                	jmp    809d21 <FAT32_lookup+0x305>
					continue;
  809d20:	90                   	nop
			for(x=0;x<2;x++)
  809d21:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809d25:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  809d29:	7e 88                	jle    809cb3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  809d2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d2f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809d32:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809d35:	0f 8d 14 04 00 00    	jge    80a14f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  809d3b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809d40:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809d44:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809d48:	3c 0f                	cmp    al,0xf
  809d4a:	75 0f                	jne    809d5b <FAT32_lookup+0x33f>
  809d4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809d50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d53:	3c e5                	cmp    al,0xe5
  809d55:	0f 85 5d fe ff ff    	jne    809bb8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  809d5b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  809d62:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809d69:	e9 f4 01 00 00       	jmp    809f62 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  809d6e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809d72:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809d75:	48 98                	cdqe   
  809d77:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d7b:	0f b6 c0             	movzx  eax,al
  809d7e:	83 f8 7a             	cmp    eax,0x7a
  809d81:	0f 8f d0 01 00 00    	jg     809f57 <FAT32_lookup+0x53b>
  809d87:	83 f8 61             	cmp    eax,0x61
  809d8a:	0f 8d e6 00 00 00    	jge    809e76 <FAT32_lookup+0x45a>
  809d90:	83 f8 5a             	cmp    eax,0x5a
  809d93:	0f 8f be 01 00 00    	jg     809f57 <FAT32_lookup+0x53b>
  809d99:	83 f8 41             	cmp    eax,0x41
  809d9c:	0f 8d d4 00 00 00    	jge    809e76 <FAT32_lookup+0x45a>
  809da2:	83 f8 20             	cmp    eax,0x20
  809da5:	74 1a                	je     809dc1 <FAT32_lookup+0x3a5>
  809da7:	83 f8 20             	cmp    eax,0x20
  809daa:	0f 8c a7 01 00 00    	jl     809f57 <FAT32_lookup+0x53b>
  809db0:	83 e8 30             	sub    eax,0x30
  809db3:	83 f8 09             	cmp    eax,0x9
  809db6:	0f 87 9b 01 00 00    	ja     809f57 <FAT32_lookup+0x53b>
  809dbc:	e9 53 01 00 00       	jmp    809f14 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809dc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dc5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809dc9:	0f b6 c0             	movzx  eax,al
  809dcc:	83 e0 10             	and    eax,0x10
  809dcf:	85 c0                	test   eax,eax
  809dd1:	75 50                	jne    809e23 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  809dd3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809dd7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809dda:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809ddd:	48 98                	cdqe   
  809ddf:	48 01 d0             	add    rax,rdx
  809de2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809de5:	3c 2e                	cmp    al,0x2e
  809de7:	0f 84 70 01 00 00    	je     809f5d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809ded:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809df1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809df4:	48 98                	cdqe   
  809df6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809dfa:	0f b6 d0             	movzx  edx,al
  809dfd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e01:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e04:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e07:	48 98                	cdqe   
  809e09:	48 01 c8             	add    rax,rcx
  809e0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e0f:	0f be c0             	movsx  eax,al
  809e12:	39 c2                	cmp    edx,eax
  809e14:	0f 85 c1 02 00 00    	jne    80a0db <FAT32_lookup+0x6bf>
						{
							j++;
  809e1a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e1e:	e9 3b 01 00 00       	jmp    809f5e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809e23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e27:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e2a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e2d:	7d 32                	jge    809e61 <FAT32_lookup+0x445>
  809e2f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e33:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e36:	48 98                	cdqe   
  809e38:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809e3c:	0f b6 d0             	movzx  edx,al
  809e3f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e43:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e46:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e49:	48 98                	cdqe   
  809e4b:	48 01 c8             	add    rax,rcx
  809e4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e51:	0f be c0             	movsx  eax,al
  809e54:	39 c2                	cmp    edx,eax
  809e56:	75 09                	jne    809e61 <FAT32_lookup+0x445>
						{
							j++;
  809e58:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e5c:	e9 fd 00 00 00       	jmp    809f5e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  809e61:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e65:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e68:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e6b:	0f 85 6d 02 00 00    	jne    80a0de <FAT32_lookup+0x6c2>
							continue;
  809e71:	e9 e8 00 00 00       	jmp    809f5e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809e76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e7a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809e7e:	0f b6 c0             	movzx  eax,al
  809e81:	83 e0 08             	and    eax,0x8
  809e84:	85 c0                	test   eax,eax
  809e86:	74 49                	je     809ed1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809e88:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e8f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e92:	0f 8d 49 02 00 00    	jge    80a0e1 <FAT32_lookup+0x6c5>
  809e98:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e9c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e9f:	48 98                	cdqe   
  809ea1:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809ea5:	0f b6 c0             	movzx  eax,al
  809ea8:	8d 50 20             	lea    edx,[rax+0x20]
  809eab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809eaf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809eb2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809eb5:	48 98                	cdqe   
  809eb7:	48 01 c8             	add    rax,rcx
  809eba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ebd:	0f be c0             	movsx  eax,al
  809ec0:	39 c2                	cmp    edx,eax
  809ec2:	0f 85 19 02 00 00    	jne    80a0e1 <FAT32_lookup+0x6c5>
						{
							j++;
  809ec8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809ecc:	e9 8d 00 00 00       	jmp    809f5e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809ed1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809ed5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809ed8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809edb:	0f 8d 03 02 00 00    	jge    80a0e4 <FAT32_lookup+0x6c8>
  809ee1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809ee5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809ee8:	48 98                	cdqe   
  809eea:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809eee:	0f b6 d0             	movzx  edx,al
  809ef1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809ef5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809ef8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809efb:	48 98                	cdqe   
  809efd:	48 01 c8             	add    rax,rcx
  809f00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f03:	0f be c0             	movsx  eax,al
  809f06:	39 c2                	cmp    edx,eax
  809f08:	0f 85 d6 01 00 00    	jne    80a0e4 <FAT32_lookup+0x6c8>
						{
							j++;
  809f0e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809f12:	eb 4a                	jmp    809f5e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809f14:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f18:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809f1b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809f1e:	0f 8d c3 01 00 00    	jge    80a0e7 <FAT32_lookup+0x6cb>
  809f24:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f28:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809f2b:	48 98                	cdqe   
  809f2d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f31:	0f b6 d0             	movzx  edx,al
  809f34:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f38:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809f3b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809f3e:	48 98                	cdqe   
  809f40:	48 01 c8             	add    rax,rcx
  809f43:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f46:	0f be c0             	movsx  eax,al
  809f49:	39 c2                	cmp    edx,eax
  809f4b:	0f 85 96 01 00 00    	jne    80a0e7 <FAT32_lookup+0x6cb>
					{
						j++;
  809f51:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  809f55:	eb 07                	jmp    809f5e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  809f57:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  809f5b:	eb 01                	jmp    809f5e <FAT32_lookup+0x542>
							continue;
  809f5d:	90                   	nop
		for(x=0;x<8;x++)
  809f5e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809f62:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  809f66:	0f 8e 02 fe ff ff    	jle    809d6e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809f6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f70:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809f74:	0f b6 c0             	movzx  eax,al
  809f77:	83 e0 10             	and    eax,0x10
  809f7a:	85 c0                	test   eax,eax
  809f7c:	0f 85 d0 01 00 00    	jne    80a152 <FAT32_lookup+0x736>
		{
			j++;
  809f82:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  809f86:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  809f8d:	e9 2b 01 00 00       	jmp    80a0bd <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  809f92:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f96:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809f99:	48 98                	cdqe   
  809f9b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f9f:	0f b6 c0             	movzx  eax,al
  809fa2:	83 f8 7a             	cmp    eax,0x7a
  809fa5:	0f 8f 3f 01 00 00    	jg     80a0ea <FAT32_lookup+0x6ce>
  809fab:	83 f8 61             	cmp    eax,0x61
  809fae:	7d 2e                	jge    809fde <FAT32_lookup+0x5c2>
  809fb0:	83 f8 5a             	cmp    eax,0x5a
  809fb3:	0f 8f 31 01 00 00    	jg     80a0ea <FAT32_lookup+0x6ce>
  809fb9:	83 f8 41             	cmp    eax,0x41
  809fbc:	7d 20                	jge    809fde <FAT32_lookup+0x5c2>
  809fbe:	83 f8 20             	cmp    eax,0x20
  809fc1:	0f 84 c4 00 00 00    	je     80a08b <FAT32_lookup+0x66f>
  809fc7:	83 f8 20             	cmp    eax,0x20
  809fca:	0f 8c 1a 01 00 00    	jl     80a0ea <FAT32_lookup+0x6ce>
  809fd0:	83 e8 30             	sub    eax,0x30
  809fd3:	83 f8 09             	cmp    eax,0x9
  809fd6:	0f 87 0e 01 00 00    	ja     80a0ea <FAT32_lookup+0x6ce>
  809fdc:	eb 7e                	jmp    80a05c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809fde:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fe2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809fe6:	0f b6 c0             	movzx  eax,al
  809fe9:	83 e0 10             	and    eax,0x10
  809fec:	85 c0                	test   eax,eax
  809fee:	74 39                	je     80a029 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809ff0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809ff4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809ff7:	48 98                	cdqe   
  809ff9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809ffd:	0f b6 c0             	movzx  eax,al
  80a000:	8d 50 20             	lea    edx,[rax+0x20]
  80a003:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a007:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a00a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a00d:	48 98                	cdqe   
  80a00f:	48 01 c8             	add    rax,rcx
  80a012:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a015:	0f be c0             	movsx  eax,al
  80a018:	39 c2                	cmp    edx,eax
  80a01a:	0f 85 cd 00 00 00    	jne    80a0ed <FAT32_lookup+0x6d1>
							{
								j++;
  80a020:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a024:	e9 90 00 00 00       	jmp    80a0b9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a029:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a02d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a030:	48 98                	cdqe   
  80a032:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a036:	0f b6 d0             	movzx  edx,al
  80a039:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a03d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a040:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a043:	48 98                	cdqe   
  80a045:	48 01 c8             	add    rax,rcx
  80a048:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a04b:	0f be c0             	movsx  eax,al
  80a04e:	39 c2                	cmp    edx,eax
  80a050:	0f 85 9a 00 00 00    	jne    80a0f0 <FAT32_lookup+0x6d4>
							{
								j++;
  80a056:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a05a:	eb 5d                	jmp    80a0b9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a05c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a060:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a063:	48 98                	cdqe   
  80a065:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a069:	0f b6 d0             	movzx  edx,al
  80a06c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a070:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a073:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a076:	48 98                	cdqe   
  80a078:	48 01 c8             	add    rax,rcx
  80a07b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a07e:	0f be c0             	movsx  eax,al
  80a081:	39 c2                	cmp    edx,eax
  80a083:	75 6e                	jne    80a0f3 <FAT32_lookup+0x6d7>
						{
							j++;
  80a085:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a089:	eb 2e                	jmp    80a0b9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a08b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a08f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a092:	48 98                	cdqe   
  80a094:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a098:	0f b6 d0             	movzx  edx,al
  80a09b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a09f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a0a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0a5:	48 98                	cdqe   
  80a0a7:	48 01 c8             	add    rax,rcx
  80a0aa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0ad:	0f be c0             	movsx  eax,al
  80a0b0:	39 c2                	cmp    edx,eax
  80a0b2:	75 42                	jne    80a0f6 <FAT32_lookup+0x6da>
						{
							j++;
  80a0b4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a0b8:	90                   	nop
			for(x=8;x<11;x++)
  80a0b9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a0bd:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a0c1:	0f 8e cb fe ff ff    	jle    809f92 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a0c7:	e9 86 00 00 00       	jmp    80a152 <FAT32_lookup+0x736>
			continue;
  80a0cc:	90                   	nop
  80a0cd:	eb 28                	jmp    80a0f7 <FAT32_lookup+0x6db>
			continue;
  80a0cf:	90                   	nop
  80a0d0:	eb 25                	jmp    80a0f7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0d2:	90                   	nop
  80a0d3:	eb 22                	jmp    80a0f7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0d5:	90                   	nop
  80a0d6:	eb 1f                	jmp    80a0f7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0d8:	90                   	nop
  80a0d9:	eb 1c                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0db:	90                   	nop
  80a0dc:	eb 19                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0de:	90                   	nop
  80a0df:	eb 16                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0e1:	90                   	nop
  80a0e2:	eb 13                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0e4:	90                   	nop
  80a0e5:	eb 10                	jmp    80a0f7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a0e7:	90                   	nop
  80a0e8:	eb 0d                	jmp    80a0f7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a0ea:	90                   	nop
  80a0eb:	eb 0a                	jmp    80a0f7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a0ed:	90                   	nop
  80a0ee:	eb 07                	jmp    80a0f7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a0f0:	90                   	nop
  80a0f1:	eb 04                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0f3:	90                   	nop
  80a0f4:	eb 01                	jmp    80a0f7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0f6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a0f7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a0fb:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a100:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a103:	48 63 d0             	movsxd rdx,eax
  80a106:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a10a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a10e:	48 39 c2             	cmp    rdx,rax
  80a111:	0f 8c 4c fa ff ff    	jl     809b63 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a117:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a11a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a11e:	89 d6                	mov    esi,edx
  80a120:	48 89 c7             	mov    rdi,rax
  80a123:	e8 2d e7 ff ff       	call   808855 <DISK1_FAT32_read_FAT_Entry>
  80a128:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a12b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a132:	77 05                	ja     80a139 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a134:	e9 7f f9 ff ff       	jmp    809ab8 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a139:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a13d:	48 89 c7             	mov    rdi,rax
  80a140:	e8 f4 71 ff ff       	call   801339 <vmfree>
	return NULL;
  80a145:	b8 00 00 00 00       	mov    eax,0x0
  80a14a:	e9 f0 01 00 00       	jmp    80a33f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a14f:	90                   	nop
  80a150:	eb 01                	jmp    80a153 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a152:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a153:	be 00 00 00 00       	mov    esi,0x0
  80a158:	bf 38 00 00 00       	mov    edi,0x38
  80a15d:	b8 00 00 00 00       	mov    eax,0x0
  80a162:	e8 43 71 ff ff       	call   8012aa <vmalloc>
  80a167:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a16b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a16f:	ba 38 00 00 00       	mov    edx,0x38
  80a174:	be 00 00 00 00       	mov    esi,0x0
  80a179:	48 89 c7             	mov    rdi,rax
  80a17c:	e8 6f 15 00 00       	call   80b6f0 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a181:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a185:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a188:	89 c2                	mov    edx,eax
  80a18a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a18e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a191:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a195:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a198:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a19c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a1a0:	48 01 d0             	add    rax,rdx
  80a1a3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a1a7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1ab:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a1af:	48 89 c1             	mov    rcx,rax
  80a1b2:	48 89 d0             	mov    rax,rdx
  80a1b5:	ba 00 00 00 00       	mov    edx,0x0
  80a1ba:	48 f7 f1             	div    rcx
  80a1bd:	48 89 c2             	mov    rdx,rax
  80a1c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1c4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a1c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1cc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a1d0:	0f b6 c0             	movzx  eax,al
  80a1d3:	83 e0 10             	and    eax,0x10
  80a1d6:	85 c0                	test   eax,eax
  80a1d8:	74 07                	je     80a1e1 <FAT32_lookup+0x7c5>
  80a1da:	ba 02 00 00 00       	mov    edx,0x2
  80a1df:	eb 05                	jmp    80a1e6 <FAT32_lookup+0x7ca>
  80a1e1:	ba 01 00 00 00       	mov    edx,0x1
  80a1e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1ea:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a1ee:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a1f2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a1f6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1fa:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a1fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a202:	48 c7 40 20 20 c2 80 	mov    QWORD PTR [rax+0x20],0x80c220
  80a209:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a20a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a20e:	48 c7 40 28 60 c2 80 	mov    QWORD PTR [rax+0x28],0x80c260
  80a215:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a216:	be 00 00 00 00       	mov    esi,0x0
  80a21b:	bf 20 00 00 00       	mov    edi,0x20
  80a220:	b8 00 00 00 00       	mov    eax,0x0
  80a225:	e8 80 70 ff ff       	call   8012aa <vmalloc>
  80a22a:	48 89 c2             	mov    rdx,rax
  80a22d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a231:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a235:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a239:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a23d:	ba 20 00 00 00       	mov    edx,0x20
  80a242:	be 00 00 00 00       	mov    esi,0x0
  80a247:	48 89 c7             	mov    rdi,rax
  80a24a:	e8 a1 14 00 00       	call   80b6f0 <memset>
	finode = p->private_index_info;
  80a24f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a253:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a257:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a25b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a25f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a263:	0f b7 c0             	movzx  eax,ax
  80a266:	c1 e0 10             	shl    eax,0x10
  80a269:	89 c2                	mov    edx,eax
  80a26b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a26f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a273:	0f b7 c0             	movzx  eax,ax
  80a276:	09 d0                	or     eax,edx
  80a278:	48 98                	cdqe   
  80a27a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a27f:	48 89 c2             	mov    rdx,rax
  80a282:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a286:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a289:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a28c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a290:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a294:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a298:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a29c:	48 c1 f8 05          	sar    rax,0x5
  80a2a0:	48 89 c2             	mov    rdx,rax
  80a2a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2a7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a2ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2af:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a2b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2b7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a2bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2bf:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a2c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2c7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a2cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2cf:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a2d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2d7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a2db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2df:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a2e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2e7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a2eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2ef:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a2f3:	66 c1 e8 0c          	shr    ax,0xc
  80a2f7:	66 85 c0             	test   ax,ax
  80a2fa:	74 27                	je     80a323 <FAT32_lookup+0x907>
  80a2fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a300:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a304:	83 e0 01             	and    eax,0x1
  80a307:	48 85 c0             	test   rax,rax
  80a30a:	74 17                	je     80a323 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a30c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a310:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a314:	48 83 c8 04          	or     rax,0x4
  80a318:	48 89 c2             	mov    rdx,rax
  80a31b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a31f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a323:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a327:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a32b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a32f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a333:	48 89 c7             	mov    rdi,rax
  80a336:	e8 fe 6f ff ff       	call   801339 <vmfree>
	return dest_dentry;	
  80a33b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80a33f:	c9                   	leave  
  80a340:	c3                   	ret    

000000000080a341 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a341:	f3 0f 1e fa          	endbr64 
  80a345:	55                   	push   rbp
  80a346:	48 89 e5             	mov    rbp,rsp
  80a349:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a34d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a351:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a354:	90                   	nop
  80a355:	5d                   	pop    rbp
  80a356:	c3                   	ret    

000000000080a357 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80a357:	f3 0f 1e fa          	endbr64 
  80a35b:	55                   	push   rbp
  80a35c:	48 89 e5             	mov    rbp,rsp
  80a35f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a363:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a367:	90                   	nop
  80a368:	5d                   	pop    rbp
  80a369:	c3                   	ret    

000000000080a36a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80a36a:	f3 0f 1e fa          	endbr64 
  80a36e:	55                   	push   rbp
  80a36f:	48 89 e5             	mov    rbp,rsp
  80a372:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a376:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a37a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a37e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a382:	90                   	nop
  80a383:	5d                   	pop    rbp
  80a384:	c3                   	ret    

000000000080a385 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a385:	f3 0f 1e fa          	endbr64 
  80a389:	55                   	push   rbp
  80a38a:	48 89 e5             	mov    rbp,rsp
  80a38d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a391:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a395:	90                   	nop
  80a396:	5d                   	pop    rbp
  80a397:	c3                   	ret    

000000000080a398 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a398:	f3 0f 1e fa          	endbr64 
  80a39c:	55                   	push   rbp
  80a39d:	48 89 e5             	mov    rbp,rsp
  80a3a0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3a4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3a8:	90                   	nop
  80a3a9:	5d                   	pop    rbp
  80a3aa:	c3                   	ret    

000000000080a3ab <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80a3ab:	f3 0f 1e fa          	endbr64 
  80a3af:	55                   	push   rbp
  80a3b0:	48 89 e5             	mov    rbp,rsp
  80a3b3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3b7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3bb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a3bf:	90                   	nop
  80a3c0:	5d                   	pop    rbp
  80a3c1:	c3                   	ret    

000000000080a3c2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80a3c2:	f3 0f 1e fa          	endbr64 
  80a3c6:	55                   	push   rbp
  80a3c7:	48 89 e5             	mov    rbp,rsp
  80a3ca:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3ce:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3d2:	90                   	nop
  80a3d3:	5d                   	pop    rbp
  80a3d4:	c3                   	ret    

000000000080a3d5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80a3d5:	f3 0f 1e fa          	endbr64 
  80a3d9:	55                   	push   rbp
  80a3da:	48 89 e5             	mov    rbp,rsp
  80a3dd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3e1:	90                   	nop
  80a3e2:	5d                   	pop    rbp
  80a3e3:	c3                   	ret    

000000000080a3e4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80a3e4:	f3 0f 1e fa          	endbr64 
  80a3e8:	55                   	push   rbp
  80a3e9:	48 89 e5             	mov    rbp,rsp
  80a3ec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3f0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3f4:	90                   	nop
  80a3f5:	5d                   	pop    rbp
  80a3f6:	c3                   	ret    

000000000080a3f7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80a3f7:	f3 0f 1e fa          	endbr64 
  80a3fb:	55                   	push   rbp
  80a3fc:	48 89 e5             	mov    rbp,rsp
  80a3ff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a403:	90                   	nop
  80a404:	5d                   	pop    rbp
  80a405:	c3                   	ret    

000000000080a406 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80a406:	f3 0f 1e fa          	endbr64 
  80a40a:	55                   	push   rbp
  80a40b:	48 89 e5             	mov    rbp,rsp
  80a40e:	48 83 ec 10          	sub    rsp,0x10
  80a412:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80a416:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a41a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a41e:	48 89 c7             	mov    rdi,rax
  80a421:	e8 13 6f ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80a426:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a42a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a42d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a431:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a435:	48 89 c7             	mov    rdi,rax
  80a438:	e8 fc 6e ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode);
  80a43d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a441:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a444:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a448:	48 89 c7             	mov    rdi,rax
  80a44b:	e8 e9 6e ff ff       	call   801339 <vmfree>
	vmfree(sb->root);
  80a450:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a454:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a457:	48 89 c7             	mov    rdi,rax
  80a45a:	e8 da 6e ff ff       	call   801339 <vmfree>
	vmfree(sb);
  80a45f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a463:	48 89 c7             	mov    rdi,rax
  80a466:	e8 ce 6e ff ff       	call   801339 <vmfree>
}
  80a46b:	90                   	nop
  80a46c:	c9                   	leave  
  80a46d:	c3                   	ret    

000000000080a46e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80a46e:	f3 0f 1e fa          	endbr64 
  80a472:	55                   	push   rbp
  80a473:	48 89 e5             	mov    rbp,rsp
  80a476:	48 83 ec 40          	sub    rsp,0x40
  80a47a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80a47e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a485:	00 
	struct FAT32_Directory * buf = NULL;
  80a486:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a48d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80a48e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a492:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a496:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80a49a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a49e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a4a2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4a6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80a4aa:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a4b1:	00 

	if(finode->dentry_location == 0)
  80a4b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4b6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a4ba:	48 85 c0             	test   rax,rax
  80a4bd:	75 14                	jne    80a4d3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80a4bf:	bf 0c 42 81 00       	mov    edi,0x81420c
  80a4c4:	b8 00 00 00 00       	mov    eax,0x0
  80a4c9:	e8 4a 68 ff ff       	call   800d18 <printf>
		return ;
  80a4ce:	e9 30 01 00 00       	jmp    80a603 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80a4d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4d7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a4db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4df:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a4e3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a4e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4eb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4ef:	48 0f af c2          	imul   rax,rdx
  80a4f3:	48 01 c8             	add    rax,rcx
  80a4f6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80a4fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a502:	be 00 00 00 00       	mov    esi,0x0
  80a507:	48 89 c7             	mov    rdi,rax
  80a50a:	b8 00 00 00 00       	mov    eax,0x0
  80a50f:	e8 96 6d ff ff       	call   8012aa <vmalloc>
  80a514:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80a518:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a51c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a520:	89 c2                	mov    edx,eax
  80a522:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a526:	be 00 00 00 00       	mov    esi,0x0
  80a52b:	48 89 c7             	mov    rdi,rax
  80a52e:	e8 bd 11 00 00       	call   80b6f0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a533:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a537:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a53b:	89 c1                	mov    ecx,eax
  80a53d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a541:	89 c2                	mov    edx,eax
  80a543:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a547:	49 89 c0             	mov    r8,rax
  80a54a:	be 00 00 00 00       	mov    esi,0x0
  80a54f:	bf 00 00 00 00       	mov    edi,0x0
  80a554:	e8 70 d6 ff ff       	call   807bc9 <request>
  80a559:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80a55c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a55f:	89 c7                	mov    edi,eax
  80a561:	e8 17 dd ff ff       	call   80827d <chk_result>
    fdentry = buf+finode->dentry_position;
  80a566:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a56a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a56e:	48 c1 e0 05          	shl    rax,0x5
  80a572:	48 89 c2             	mov    rdx,rax
  80a575:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a579:	48 01 d0             	add    rax,rdx
  80a57c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80a580:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a584:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a587:	89 c2                	mov    edx,eax
  80a589:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a58d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80a590:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a594:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a597:	89 c2                	mov    edx,eax
  80a599:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a59d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80a5a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5a5:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a5a9:	66 25 00 f0          	and    ax,0xf000
  80a5ad:	89 c2                	mov    edx,eax
  80a5af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a5b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a5b6:	48 c1 e8 10          	shr    rax,0x10
  80a5ba:	09 c2                	or     edx,eax
  80a5bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5c0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a5c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a5c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a5cc:	89 c1                	mov    ecx,eax
  80a5ce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a5d2:	89 c2                	mov    edx,eax
  80a5d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5d8:	49 89 c0             	mov    r8,rax
  80a5db:	be 01 00 00 00       	mov    esi,0x1
  80a5e0:	bf 00 00 00 00       	mov    edi,0x0
  80a5e5:	e8 df d5 ff ff       	call   807bc9 <request>
  80a5ea:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80a5ed:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80a5f0:	89 c7                	mov    edi,eax
  80a5f2:	e8 86 dc ff ff       	call   80827d <chk_result>
	vmfree(buf);
  80a5f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5fb:	48 89 c7             	mov    rdi,rax
  80a5fe:	e8 36 6d ff ff       	call   801339 <vmfree>
}
  80a603:	c9                   	leave  
  80a604:	c3                   	ret    

000000000080a605 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80a605:	f3 0f 1e fa          	endbr64 
  80a609:	55                   	push   rbp
  80a60a:	48 89 e5             	mov    rbp,rsp
  80a60d:	48 83 ec 50          	sub    rsp,0x50
  80a611:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80a615:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80a619:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a620:	00 
	struct FAT32_inode_info * finode = NULL;
  80a621:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a628:	00 
	struct FAT32_BootSector * fbs = NULL;
  80a629:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a630:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80a631:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a638:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80a639:	be 00 00 00 00       	mov    esi,0x0
  80a63e:	bf 18 00 00 00       	mov    edi,0x18
  80a643:	b8 00 00 00 00       	mov    eax,0x0
  80a648:	e8 5d 6c ff ff       	call   8012aa <vmalloc>
  80a64d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80a651:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a655:	ba 18 00 00 00       	mov    edx,0x18
  80a65a:	be 00 00 00 00       	mov    esi,0x0
  80a65f:	48 89 c7             	mov    rdi,rax
  80a662:	e8 89 10 00 00       	call   80b6f0 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80a667:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a66b:	48 c7 40 08 c0 c2 80 	mov    QWORD PTR [rax+0x8],0x80c2c0
  80a672:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80a673:	be 00 00 00 00       	mov    esi,0x0
  80a678:	bf 60 00 00 00       	mov    edi,0x60
  80a67d:	b8 00 00 00 00       	mov    eax,0x0
  80a682:	e8 23 6c ff ff       	call   8012aa <vmalloc>
  80a687:	48 89 c2             	mov    rdx,rax
  80a68a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a68e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80a692:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a696:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a69a:	ba 60 00 00 00       	mov    edx,0x60
  80a69f:	be 00 00 00 00       	mov    esi,0x0
  80a6a4:	48 89 c7             	mov    rdi,rax
  80a6a7:	e8 44 10 00 00       	call   80b6f0 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80a6ac:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a6b0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80a6b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a6b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6bc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80a6c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6c4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a6c7:	89 c2                	mov    edx,eax
  80a6c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6cd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80a6d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6d4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80a6d7:	89 c2                	mov    edx,eax
  80a6d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6dd:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80a6e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6e5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a6e9:	0f b6 d0             	movzx  edx,al
  80a6ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6f0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80a6f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6f8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a6fc:	0f b6 d0             	movzx  edx,al
  80a6ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a703:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a707:	0f b7 c0             	movzx  eax,ax
  80a70a:	0f af c2             	imul   eax,edx
  80a70d:	48 63 d0             	movsxd rdx,eax
  80a710:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a714:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80a718:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a71c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a720:	0f b7 d0             	movzx  edx,ax
  80a723:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a727:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80a72b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a72f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a732:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a736:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a73a:	0f b7 c0             	movzx  eax,ax
  80a73d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80a740:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a744:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80a747:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a74b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a74f:	0f b6 c0             	movzx  eax,al
  80a752:	0f af c2             	imul   eax,edx
  80a755:	01 c8                	add    eax,ecx
  80a757:	89 c2                	mov    edx,eax
  80a759:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a75d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80a761:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a765:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a768:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a76c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a770:	0f b7 c0             	movzx  eax,ax
  80a773:	01 d0                	add    eax,edx
  80a775:	89 c2                	mov    edx,eax
  80a777:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a77b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80a77f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a783:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80a786:	89 c2                	mov    edx,eax
  80a788:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a78c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80a790:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a794:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a798:	0f b6 d0             	movzx  edx,al
  80a79b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a79f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80a7a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7a7:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a7ab:	0f b7 d0             	movzx  edx,ax
  80a7ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7b2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80a7b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7ba:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a7be:	0f b7 d0             	movzx  edx,ax
  80a7c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7c5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80a7c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7cd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80a7d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7d4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a7d8:	0f b7 d0             	movzx  edx,ax
  80a7db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7df:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a7e3:	0f b7 c0             	movzx  eax,ax
  80a7e6:	89 c6                	mov    esi,eax
  80a7e8:	bf 28 42 81 00       	mov    edi,0x814228
  80a7ed:	b8 00 00 00 00       	mov    eax,0x0
  80a7f2:	e8 21 65 ff ff       	call   800d18 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80a7f7:	be 00 00 00 00       	mov    esi,0x0
  80a7fc:	bf 00 02 00 00       	mov    edi,0x200
  80a801:	b8 00 00 00 00       	mov    eax,0x0
  80a806:	e8 9f 6a ff ff       	call   8012aa <vmalloc>
  80a80b:	48 89 c2             	mov    rdx,rax
  80a80e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a812:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80a816:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a81a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a81e:	ba 00 02 00 00       	mov    edx,0x200
  80a823:	be 00 00 00 00       	mov    esi,0x0
  80a828:	48 89 c7             	mov    rdi,rax
  80a82b:	e8 c0 0e 00 00       	call   80b6f0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80a830:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a834:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80a838:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a83c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80a83f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a843:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a847:	0f b7 c0             	movzx  eax,ax
  80a84a:	01 c8                	add    eax,ecx
  80a84c:	49 89 d0             	mov    r8,rdx
  80a84f:	b9 01 00 00 00       	mov    ecx,0x1
  80a854:	89 c2                	mov    edx,eax
  80a856:	be 00 00 00 00       	mov    esi,0x0
  80a85b:	bf 00 00 00 00       	mov    edi,0x0
  80a860:	e8 64 d3 ff ff       	call   807bc9 <request>
  80a865:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80a868:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80a86b:	89 c7                	mov    edi,eax
  80a86d:	e8 0b da ff ff       	call   80827d <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80a872:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a876:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a87a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80a880:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a884:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a888:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80a88e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a892:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a896:	8b 00                	mov    eax,DWORD PTR [rax]
  80a898:	89 c6                	mov    esi,eax
  80a89a:	bf 70 42 81 00       	mov    edi,0x814270
  80a89f:	b8 00 00 00 00       	mov    eax,0x0
  80a8a4:	e8 6f 64 ff ff       	call   800d18 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80a8a9:	be 00 00 00 00       	mov    esi,0x0
  80a8ae:	bf 48 00 00 00       	mov    edi,0x48
  80a8b3:	b8 00 00 00 00       	mov    eax,0x0
  80a8b8:	e8 ed 69 ff ff       	call   8012aa <vmalloc>
  80a8bd:	48 89 c2             	mov    rdx,rax
  80a8c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8c4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80a8c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8ce:	ba 48 00 00 00       	mov    edx,0x48
  80a8d3:	be 00 00 00 00       	mov    esi,0x0
  80a8d8:	48 89 c7             	mov    rdi,rax
  80a8db:	e8 10 0e 00 00       	call   80b6f0 <memset>

	list_init(&sbp->root->child_node);
  80a8e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8e7:	48 83 c0 10          	add    rax,0x10
  80a8eb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80a8ef:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a8f3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a8f7:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a8fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a8fe:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a902:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a906:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80a907:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a90b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a90e:	48 83 c0 20          	add    rax,0x20
  80a912:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80a916:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a91a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a91e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a921:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a925:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a929:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a92d:	90                   	nop
	sbp->root->parent = sbp->root;
  80a92e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a932:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a935:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a939:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80a93c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80a940:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a944:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a947:	48 c7 40 40 a0 c2 80 	mov    QWORD PTR [rax+0x40],0x80c2a0
  80a94e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80a94f:	be 00 00 00 00       	mov    esi,0x0
  80a954:	bf 02 00 00 00       	mov    edi,0x2
  80a959:	b8 00 00 00 00       	mov    eax,0x0
  80a95e:	e8 47 69 ff ff       	call   8012aa <vmalloc>
  80a963:	48 89 c2             	mov    rdx,rax
  80a966:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a96a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a96d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80a970:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a974:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a977:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a97a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80a97d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a981:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a984:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a98b:	be 00 00 00 00       	mov    esi,0x0
  80a990:	bf 38 00 00 00       	mov    edi,0x38
  80a995:	b8 00 00 00 00       	mov    eax,0x0
  80a99a:	e8 0b 69 ff ff       	call   8012aa <vmalloc>
  80a99f:	48 89 c2             	mov    rdx,rax
  80a9a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9a9:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80a9ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9b4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9b8:	ba 38 00 00 00       	mov    edx,0x38
  80a9bd:	be 00 00 00 00       	mov    esi,0x0
  80a9c2:	48 89 c7             	mov    rdi,rax
  80a9c5:	e8 26 0d 00 00       	call   80b6f0 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80a9ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9d1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9d5:	48 c7 40 28 60 c2 80 	mov    QWORD PTR [rax+0x28],0x80c260
  80a9dc:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80a9dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9e4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9e8:	48 c7 40 20 20 c2 80 	mov    QWORD PTR [rax+0x20],0x80c220
  80a9ef:	00 
	sbp->root->dir_inode->file_size = 0;
  80a9f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9f7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9fb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80aa02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa09:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa0d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aa10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa14:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aa18:	48 01 d0             	add    rax,rdx
  80aa1b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80aa1f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa23:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80aa27:	48 89 c6             	mov    rsi,rax
  80aa2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa31:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80aa35:	48 89 d0             	mov    rax,rdx
  80aa38:	ba 00 00 00 00       	mov    edx,0x0
  80aa3d:	48 f7 f6             	div    rsi
  80aa40:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80aa44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa48:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa4b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa4f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80aa56:	00 
	sbp->root->dir_inode->sb = sbp;
  80aa57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa5b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa5e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa62:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80aa66:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80aa6a:	be 00 00 00 00       	mov    esi,0x0
  80aa6f:	bf 20 00 00 00       	mov    edi,0x20
  80aa74:	b8 00 00 00 00       	mov    eax,0x0
  80aa79:	e8 2c 68 ff ff       	call   8012aa <vmalloc>
  80aa7e:	48 89 c2             	mov    rdx,rax
  80aa81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa85:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa88:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa8c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80aa90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa97:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa9b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa9f:	ba 20 00 00 00       	mov    edx,0x20
  80aaa4:	be 00 00 00 00       	mov    esi,0x0
  80aaa9:	48 89 c7             	mov    rdi,rax
  80aaac:	e8 3f 0c 00 00       	call   80b6f0 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80aab1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aab5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aab8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aabc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aac0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80aac4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aac8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80aacb:	89 c2                	mov    edx,eax
  80aacd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aad1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80aad4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aad8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80aadf:	00 
	finode->dentry_position = 0; 
  80aae0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aae4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80aaeb:	00 
	finode->create_date = 0;
  80aaec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aaf0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80aaf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aafa:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80ab00:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab04:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80ab0a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab0e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80ab14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80ab18:	c9                   	leave  
  80ab19:	c3                   	ret    

000000000080ab1a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80ab1a:	f3 0f 1e fa          	endbr64 
  80ab1e:	55                   	push   rbp
  80ab1f:	48 89 e5             	mov    rbp,rsp
  80ab22:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80ab29:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ab30:	00 
	struct Disk_Partition_Table DPT = {0};
  80ab31:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80ab38:	b8 00 00 00 00       	mov    eax,0x0
  80ab3d:	b9 40 00 00 00       	mov    ecx,0x40
  80ab42:	48 89 d7             	mov    rdi,rdx
  80ab45:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80ab48:	bf e0 c2 80 00       	mov    edi,0x80c2e0
  80ab4d:	e8 f1 c1 ff ff       	call   806d43 <register_filesystem>
	
	memset(buf,0,512);
  80ab52:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab59:	ba 00 02 00 00       	mov    edx,0x200
  80ab5e:	be 00 00 00 00       	mov    esi,0x0
  80ab63:	48 89 c7             	mov    rdi,rax
  80ab66:	e8 85 0b 00 00       	call   80b6f0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80ab6b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab72:	49 89 c0             	mov    r8,rax
  80ab75:	b9 01 00 00 00       	mov    ecx,0x1
  80ab7a:	ba 00 00 00 00       	mov    edx,0x0
  80ab7f:	be 00 00 00 00       	mov    esi,0x0
  80ab84:	bf 00 00 00 00       	mov    edi,0x0
  80ab89:	e8 3b d0 ff ff       	call   807bc9 <request>
  80ab8e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80ab91:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ab94:	89 c7                	mov    edi,eax
  80ab96:	e8 e2 d6 ff ff       	call   80827d <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80ab9b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80aba2:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80aba9:	48 89 d6             	mov    rsi,rdx
  80abac:	ba 40 00 00 00       	mov    edx,0x40
  80abb1:	48 89 c7             	mov    rdi,rax
  80abb4:	48 89 d1             	mov    rcx,rdx
  80abb7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80abba:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80abc1:	0f b6 d0             	movzx  edx,al
  80abc4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80abca:	89 c6                	mov    esi,eax
  80abcc:	bf b8 42 81 00       	mov    edi,0x8142b8
  80abd1:	b8 00 00 00 00       	mov    eax,0x0
  80abd6:	e8 3d 61 ff ff       	call   800d18 <printf>

	memset(buf,0,512);
  80abdb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80abe2:	ba 00 02 00 00       	mov    edx,0x200
  80abe7:	be 00 00 00 00       	mov    esi,0x0
  80abec:	48 89 c7             	mov    rdi,rax
  80abef:	e8 fc 0a 00 00       	call   80b6f0 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80abf4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80abfa:	89 c2                	mov    edx,eax
  80abfc:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ac03:	49 89 c0             	mov    r8,rax
  80ac06:	b9 01 00 00 00       	mov    ecx,0x1
  80ac0b:	be 00 00 00 00       	mov    esi,0x0
  80ac10:	bf 00 00 00 00       	mov    edi,0x0
  80ac15:	e8 af cf ff ff       	call   807bc9 <request>
  80ac1a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80ac1d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ac20:	89 c7                	mov    edi,eax
  80ac22:	e8 56 d6 ff ff       	call   80827d <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80ac27:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ac2e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80ac35:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80ac3c:	48 89 c2             	mov    rdx,rax
  80ac3f:	48 89 ce             	mov    rsi,rcx
  80ac42:	bf b2 42 81 00       	mov    edi,0x8142b2
  80ac47:	e8 7f c0 ff ff       	call   806ccb <mount_fs>
  80ac4c:	48 89 05 55 c9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1c955],rax        # 4275a8 <root_sb>
}
  80ac53:	90                   	nop
  80ac54:	c9                   	leave  
  80ac55:	c3                   	ret    

000000000080ac56 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80ac56:	f3 0f 1e fa          	endbr64 
  80ac5a:	55                   	push   rbp
  80ac5b:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  80ac5e:	48 8b 05 c3 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8c3]        # 42a528 <vpage_base>
  80ac65:	48 05 a0 00 00 00    	add    rax,0xa0
  80ac6b:	48 89 05 b6 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8b6],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  80ac72:	8b 05 b8 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8b8]        # 42a530 <page_boffset>
  80ac78:	05 a0 00 00 00       	add    eax,0xa0
  80ac7d:	89 05 ad f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8ad],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  80ac83:	48 8b 15 9e f8 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f89e]        # 42a528 <vpage_base>
  80ac8a:	48 8b 05 8f f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f88f]        # 42a520 <video_end>
  80ac91:	48 39 c2             	cmp    rdx,rax
  80ac94:	72 0e                	jb     80aca4 <scrdown+0x4e>
        vpage_base=video_base;
  80ac96:	48 8b 05 7b f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f87b]        # 42a518 <video_base>
  80ac9d:	48 89 05 84 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f884],rax        # 42a528 <vpage_base>
    set_origin();
  80aca4:	b8 00 00 00 00       	mov    eax,0x0
  80aca9:	e8 6a 00 00 00       	call   80ad18 <set_origin>
}
  80acae:	90                   	nop
  80acaf:	5d                   	pop    rbp
  80acb0:	c3                   	ret    

000000000080acb1 <scrup>:
void scrup()
{
  80acb1:	f3 0f 1e fa          	endbr64 
  80acb5:	55                   	push   rbp
  80acb6:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80acb9:	8b 05 71 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f871]        # 42a530 <page_boffset>
  80acbf:	85 c0                	test   eax,eax
  80acc1:	75 24                	jne    80ace7 <scrup+0x36>
    {
        page_boffset=0;
  80acc3:	c7 05 63 f8 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f863],0x0        # 42a530 <page_boffset>
  80acca:	00 00 00 
        vpage_base=video_base;
  80accd:	48 8b 05 44 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f844]        # 42a518 <video_base>
  80acd4:	48 89 05 4d f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f84d],rax        # 42a528 <vpage_base>
        set_origin();
  80acdb:	b8 00 00 00 00       	mov    eax,0x0
  80ace0:	e8 33 00 00 00       	call   80ad18 <set_origin>
        return;
  80ace5:	eb 2f                	jmp    80ad16 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80ace7:	48 8b 05 3a f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f83a]        # 42a528 <vpage_base>
  80acee:	48 2d a0 00 00 00    	sub    rax,0xa0
  80acf4:	48 89 05 2d f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f82d],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  80acfb:	8b 05 2f f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f82f]        # 42a530 <page_boffset>
  80ad01:	2d a0 00 00 00       	sub    eax,0xa0
  80ad06:	89 05 24 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f824],eax        # 42a530 <page_boffset>
    set_origin();
  80ad0c:	b8 00 00 00 00       	mov    eax,0x0
  80ad11:	e8 02 00 00 00       	call   80ad18 <set_origin>
}
  80ad16:	5d                   	pop    rbp
  80ad17:	c3                   	ret    

000000000080ad18 <set_origin>:
void set_origin(void)
{
  80ad18:	f3 0f 1e fa          	endbr64 
  80ad1c:	55                   	push   rbp
  80ad1d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80ad20:	fa                   	cli    
    outb(port_reg_index,12);
  80ad21:	8b 05 19 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f819]        # 42a540 <port_reg_index>
  80ad27:	0f b7 c0             	movzx  eax,ax
  80ad2a:	be 0c 00 00 00       	mov    esi,0xc
  80ad2f:	89 c7                	mov    edi,eax
  80ad31:	e8 9a a9 ff ff       	call   8056d0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80ad36:	8b 05 f4 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7f4]        # 42a530 <page_boffset>
  80ad3c:	c1 e8 09             	shr    eax,0x9
  80ad3f:	0f b6 d0             	movzx  edx,al
  80ad42:	8b 05 fc f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7fc]        # 42a544 <port_reg_v>
  80ad48:	0f b7 c0             	movzx  eax,ax
  80ad4b:	89 d6                	mov    esi,edx
  80ad4d:	89 c7                	mov    edi,eax
  80ad4f:	e8 7c a9 ff ff       	call   8056d0 <outb>
    outb(port_reg_index,13);
  80ad54:	8b 05 e6 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7e6]        # 42a540 <port_reg_index>
  80ad5a:	0f b7 c0             	movzx  eax,ax
  80ad5d:	be 0d 00 00 00       	mov    esi,0xd
  80ad62:	89 c7                	mov    edi,eax
  80ad64:	e8 67 a9 ff ff       	call   8056d0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80ad69:	8b 05 c1 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7c1]        # 42a530 <page_boffset>
  80ad6f:	d1 e8                	shr    eax,1
  80ad71:	0f b6 d0             	movzx  edx,al
  80ad74:	8b 05 ca f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7ca]        # 42a544 <port_reg_v>
  80ad7a:	0f b7 c0             	movzx  eax,ax
  80ad7d:	89 d6                	mov    esi,edx
  80ad7f:	89 c7                	mov    edi,eax
  80ad81:	e8 4a a9 ff ff       	call   8056d0 <outb>
    asm volatile("sti");
  80ad86:	fb                   	sti    

}
  80ad87:	90                   	nop
  80ad88:	5d                   	pop    rbp
  80ad89:	c3                   	ret    

000000000080ad8a <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80ad8a:	f3 0f 1e fa          	endbr64 
  80ad8e:	55                   	push   rbp
  80ad8f:	48 89 e5             	mov    rbp,rsp
  80ad92:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80ad96:	be e8 44 81 00       	mov    esi,0x8144e8
  80ad9b:	bf 94 43 81 00       	mov    edi,0x814394
  80ada0:	e8 9a 09 00 00       	call   80b73f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80ada5:	be ed 44 81 00       	mov    esi,0x8144ed
  80adaa:	bf 54 44 81 00       	mov    edi,0x814454
  80adaf:	e8 8b 09 00 00       	call   80b73f <strcpy>
    reg_driver(&drv_tty);
  80adb4:	bf e0 42 81 00       	mov    edi,0x8142e0
  80adb9:	e8 a6 7a ff ff       	call   802864 <reg_driver>
    reg_device(&dev_tty);
  80adbe:	bf 80 43 81 00       	mov    edi,0x814380
  80adc3:	e8 b4 77 ff ff       	call   80257c <reg_device>
    reg_device(&dev_stdout);
  80adc8:	bf 40 44 81 00       	mov    edi,0x814440
  80adcd:	e8 aa 77 ff ff       	call   80257c <reg_device>
    unsigned char *vp=0x20000;
  80add2:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80add9:	00 
    if(*vp==0x7)
  80adda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ade1:	3c 07                	cmp    al,0x7
  80ade3:	75 36                	jne    80ae1b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80ade5:	c7 05 45 f7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f745],0x0        # 42a534 <video_mode>
  80adec:	00 00 00 
        video_base=0xb0000;
  80adef:	48 c7 05 1e f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f71e],0xb0000        # 42a518 <video_base>
  80adf6:	00 00 0b 00 
        video_end=0xb8000-1;
  80adfa:	48 c7 05 1b f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f71b],0xb7fff        # 42a520 <video_end>
  80ae01:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80ae05:	c7 05 31 f7 c1 ff b4 	mov    DWORD PTR [rip+0xffffffffffc1f731],0x3b4        # 42a540 <port_reg_index>
  80ae0c:	03 00 00 
        port_reg_v=0x3b5;
  80ae0f:	c7 05 2b f7 c1 ff b5 	mov    DWORD PTR [rip+0xffffffffffc1f72b],0x3b5        # 42a544 <port_reg_v>
  80ae16:	03 00 00 
  80ae19:	eb 61                	jmp    80ae7c <init_tty+0xf2>
    }else if(*vp<=0x3)
  80ae1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae22:	3c 03                	cmp    al,0x3
  80ae24:	77 36                	ja     80ae5c <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80ae26:	c7 05 04 f7 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc1f704],0x1        # 42a534 <video_mode>
  80ae2d:	00 00 00 
        video_base=0xb8000;
  80ae30:	48 c7 05 dd f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6dd],0xb8000        # 42a518 <video_base>
  80ae37:	00 80 0b 00 
        video_end=0xc0000-1;
  80ae3b:	48 c7 05 da f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6da],0xbffff        # 42a520 <video_end>
  80ae42:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80ae46:	c7 05 f0 f6 c1 ff d4 	mov    DWORD PTR [rip+0xffffffffffc1f6f0],0x3d4        # 42a540 <port_reg_index>
  80ae4d:	03 00 00 
        port_reg_v=0x3d5;
  80ae50:	c7 05 ea f6 c1 ff d5 	mov    DWORD PTR [rip+0xffffffffffc1f6ea],0x3d5        # 42a544 <port_reg_v>
  80ae57:	03 00 00 
  80ae5a:	eb 20                	jmp    80ae7c <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80ae5c:	c7 05 ce f6 c1 ff 02 	mov    DWORD PTR [rip+0xffffffffffc1f6ce],0x2        # 42a534 <video_mode>
  80ae63:	00 00 00 
        video_base=0xa0000;
  80ae66:	48 c7 05 a7 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6a7],0xa0000        # 42a518 <video_base>
  80ae6d:	00 00 0a 00 
        video_end=0xb0000-1;
  80ae71:	48 c7 05 a4 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6a4],0xaffff        # 42a520 <video_end>
  80ae78:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80ae7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae83:	3c 01                	cmp    al,0x1
  80ae85:	77 0f                	ja     80ae96 <init_tty+0x10c>
  80ae87:	c7 05 ab f6 c1 ff 28 	mov    DWORD PTR [rip+0xffffffffffc1f6ab],0x28        # 42a53c <line_chs>
  80ae8e:	00 00 00 
  80ae91:	e9 91 00 00 00       	jmp    80af27 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80ae96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae9a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae9d:	3c 03                	cmp    al,0x3
  80ae9f:	76 0b                	jbe    80aeac <init_tty+0x122>
  80aea1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aea5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aea8:	3c 07                	cmp    al,0x7
  80aeaa:	75 0c                	jne    80aeb8 <init_tty+0x12e>
  80aeac:	c7 05 86 f6 c1 ff 50 	mov    DWORD PTR [rip+0xffffffffffc1f686],0x50        # 42a53c <line_chs>
  80aeb3:	00 00 00 
  80aeb6:	eb 6f                	jmp    80af27 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80aeb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aebc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aebf:	3c 05                	cmp    al,0x5
  80aec1:	76 16                	jbe    80aed9 <init_tty+0x14f>
  80aec3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aec7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aeca:	3c 09                	cmp    al,0x9
  80aecc:	74 0b                	je     80aed9 <init_tty+0x14f>
  80aece:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aed2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aed5:	3c 0d                	cmp    al,0xd
  80aed7:	75 0c                	jne    80aee5 <init_tty+0x15b>
  80aed9:	c7 05 59 f6 c1 ff 40 	mov    DWORD PTR [rip+0xffffffffffc1f659],0x140        # 42a53c <line_chs>
  80aee0:	01 00 00 
  80aee3:	eb 42                	jmp    80af27 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80aee5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aee9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aeec:	3c 06                	cmp    al,0x6
  80aeee:	74 16                	je     80af06 <init_tty+0x17c>
  80aef0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aef4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aef7:	3c 0a                	cmp    al,0xa
  80aef9:	74 0b                	je     80af06 <init_tty+0x17c>
  80aefb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aeff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af02:	3c 0d                	cmp    al,0xd
  80af04:	76 0c                	jbe    80af12 <init_tty+0x188>
  80af06:	c7 05 2c f6 c1 ff 80 	mov    DWORD PTR [rip+0xffffffffffc1f62c],0x280        # 42a53c <line_chs>
  80af0d:	02 00 00 
  80af10:	eb 15                	jmp    80af27 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80af12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af16:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af19:	3c 08                	cmp    al,0x8
  80af1b:	75 0a                	jne    80af27 <init_tty+0x19d>
  80af1d:	c7 05 15 f6 c1 ff a0 	mov    DWORD PTR [rip+0xffffffffffc1f615],0xa0        # 42a53c <line_chs>
  80af24:	00 00 00 
    switch (*vp)
  80af27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af2e:	0f b6 c0             	movzx  eax,al
  80af31:	83 f8 14             	cmp    eax,0x14
  80af34:	77 61                	ja     80af97 <init_tty+0x20d>
  80af36:	89 c0                	mov    eax,eax
  80af38:	48 8b 04 c5 f8 44 81 	mov    rax,QWORD PTR [rax*8+0x8144f8]
  80af3f:	00 
  80af40:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80af43:	c7 05 fb f5 c1 ff e8 	mov    DWORD PTR [rip+0xffffffffffc1f5fb],0x3e8        # 42a548 <vpage_size>
  80af4a:	03 00 00 
  80af4d:	eb 49                	jmp    80af98 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80af4f:	c7 05 ef f5 c1 ff d0 	mov    DWORD PTR [rip+0xffffffffffc1f5ef],0x7d0        # 42a548 <vpage_size>
  80af56:	07 00 00 
  80af59:	eb 3d                	jmp    80af98 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80af5b:	c7 05 e3 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5e3],0xfa00        # 42a548 <vpage_size>
  80af62:	fa 00 00 
  80af65:	eb 31                	jmp    80af98 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80af67:	c7 05 d7 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5d7],0x1f400        # 42a548 <vpage_size>
  80af6e:	f4 01 00 
  80af71:	eb 25                	jmp    80af98 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80af73:	c7 05 cb f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5cb],0x7d00        # 42a548 <vpage_size>
  80af7a:	7d 00 00 
  80af7d:	eb 19                	jmp    80af98 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80af7f:	c7 05 bf f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5bf],0x36b00        # 42a548 <vpage_size>
  80af86:	6b 03 00 
  80af89:	eb 0d                	jmp    80af98 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80af8b:	c7 05 b3 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5b3],0x4b000        # 42a548 <vpage_size>
  80af92:	b0 04 00 
  80af95:	eb 01                	jmp    80af98 <init_tty+0x20e>
    default:
        break;
  80af97:	90                   	nop
    }
    m_ptr=video_base;
  80af98:	48 8b 05 79 f5 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f579]        # 42a518 <video_base>
  80af9f:	48 89 05 5a 13 00 00 	mov    QWORD PTR [rip+0x135a],rax        # 80c300 <m_ptr>
    page_boffset=0;
  80afa6:	c7 05 80 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f580],0x0        # 42a530 <page_boffset>
  80afad:	00 00 00 
    vpage_base=video_base;
  80afb0:	48 8b 05 61 f5 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f561]        # 42a518 <video_base>
  80afb7:	48 89 05 6a f5 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f56a],rax        # 42a528 <vpage_base>
    vp++;
  80afbe:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80afc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afc7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80afca:	0f b6 c0             	movzx  eax,al
  80afcd:	89 05 65 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f565],eax        # 42a538 <vpage>
    vp++;
  80afd3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80afd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afdc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80afe0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80afe4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80afe7:	0f b6 c0             	movzx  eax,al
  80afea:	89 05 64 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f564],eax        # 42a554 <stline>
    endline=*vp++;
  80aff0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aff4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80aff8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80affc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80afff:	0f b6 c0             	movzx  eax,al
  80b002:	89 05 50 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f550],eax        # 42a558 <endline>
    videoy=*vp++;
  80b008:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b00c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b010:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b014:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b017:	0f b6 c0             	movzx  eax,al
  80b01a:	89 05 30 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f530],eax        # 42a550 <videoy>
    videox=*vp;
  80b020:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b024:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b027:	0f b6 c0             	movzx  eax,al
  80b02a:	89 05 1c f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f51c],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80b030:	90                   	nop
  80b031:	c9                   	leave  
  80b032:	c3                   	ret    

000000000080b033 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80b033:	f3 0f 1e fa          	endbr64 
  80b037:	55                   	push   rbp
  80b038:	48 89 e5             	mov    rbp,rsp
  80b03b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80b03f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b043:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80b046:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80b049:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b04c:	05 00 c0 05 00       	add    eax,0x5c000
  80b051:	01 c0                	add    eax,eax
  80b053:	48 98                	cdqe   
  80b055:	48 89 05 a4 12 00 00 	mov    QWORD PTR [rip+0x12a4],rax        # 80c300 <m_ptr>
}
  80b05c:	90                   	nop
  80b05d:	5d                   	pop    rbp
  80b05e:	c3                   	ret    

000000000080b05f <tell_monitor>:
int tell_monitor()
{
  80b05f:	f3 0f 1e fa          	endbr64 
  80b063:	55                   	push   rbp
  80b064:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80b067:	48 8b 05 92 12 00 00 	mov    rax,QWORD PTR [rip+0x1292]        # 80c300 <m_ptr>
  80b06e:	48 8b 15 a3 f4 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f4a3]        # 42a518 <video_base>
  80b075:	48 29 d0             	sub    rax,rdx
  80b078:	48 89 c2             	mov    rdx,rax
  80b07b:	48 c1 ea 3f          	shr    rdx,0x3f
  80b07f:	48 01 d0             	add    rax,rdx
  80b082:	48 d1 f8             	sar    rax,1
}
  80b085:	5d                   	pop    rbp
  80b086:	c3                   	ret    

000000000080b087 <del_ch>:
void del_ch()
{
  80b087:	f3 0f 1e fa          	endbr64 
  80b08b:	55                   	push   rbp
  80b08c:	48 89 e5             	mov    rbp,rsp
  80b08f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80b096:	48 8b 05 63 12 00 00 	mov    rax,QWORD PTR [rip+0x1263]        # 80c300 <m_ptr>
  80b09d:	48 83 e8 02          	sub    rax,0x2
  80b0a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80b0a5:	b8 00 00 00 00       	mov    eax,0x0
  80b0aa:	e8 b0 ff ff ff       	call   80b05f <tell_monitor>
  80b0af:	89 c2                	mov    edx,eax
  80b0b1:	48 63 c2             	movsxd rax,edx
  80b0b4:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80b0bb:	48 c1 e8 20          	shr    rax,0x20
  80b0bf:	c1 f8 05             	sar    eax,0x5
  80b0c2:	89 d1                	mov    ecx,edx
  80b0c4:	c1 f9 1f             	sar    ecx,0x1f
  80b0c7:	29 c8                	sub    eax,ecx
  80b0c9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80b0cc:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80b0cf:	89 c8                	mov    eax,ecx
  80b0d1:	c1 e0 02             	shl    eax,0x2
  80b0d4:	01 c8                	add    eax,ecx
  80b0d6:	c1 e0 04             	shl    eax,0x4
  80b0d9:	29 c2                	sub    edx,eax
  80b0db:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80b0de:	eb 17                	jmp    80b0f7 <del_ch+0x70>
    {
        *p=*(p+2);
  80b0e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0e4:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80b0e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0ec:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80b0ee:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80b0f3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b0f7:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80b0fb:	7e e3                	jle    80b0e0 <del_ch+0x59>
    }
    driver_args args= {
  80b0fd:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80b104:	b8 00 00 00 00       	mov    eax,0x0
  80b109:	b9 18 00 00 00       	mov    ecx,0x18
  80b10e:	48 89 d7             	mov    rdi,rdx
  80b111:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80b114:	b8 00 00 00 00       	mov    eax,0x0
  80b119:	e8 41 ff ff ff       	call   80b05f <tell_monitor>
  80b11e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80b121:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80b127:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80b12e:	48 89 c7             	mov    rdi,rax
  80b131:	e8 fd fe ff ff       	call   80b033 <seek_tty>
    set_cur();
  80b136:	b8 00 00 00 00       	mov    eax,0x0
  80b13b:	e8 03 00 00 00       	call   80b143 <set_cur>
}
  80b140:	90                   	nop
  80b141:	c9                   	leave  
  80b142:	c3                   	ret    

000000000080b143 <set_cur>:
void set_cur()
{
  80b143:	f3 0f 1e fa          	endbr64 
  80b147:	55                   	push   rbp
  80b148:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b14b:	fa                   	cli    
    outb(port_reg_index,14);
  80b14c:	8b 05 ee f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3ee]        # 42a540 <port_reg_index>
  80b152:	0f b7 c0             	movzx  eax,ax
  80b155:	be 0e 00 00 00       	mov    esi,0xe
  80b15a:	89 c7                	mov    edi,eax
  80b15c:	e8 6f a5 ff ff       	call   8056d0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80b161:	48 8b 05 98 11 00 00 	mov    rax,QWORD PTR [rip+0x1198]        # 80c300 <m_ptr>
  80b168:	48 8b 15 a9 f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f3a9]        # 42a518 <video_base>
  80b16f:	48 29 d0             	sub    rax,rdx
  80b172:	48 c1 f8 09          	sar    rax,0x9
  80b176:	0f b6 d0             	movzx  edx,al
  80b179:	8b 05 c5 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3c5]        # 42a544 <port_reg_v>
  80b17f:	0f b7 c0             	movzx  eax,ax
  80b182:	89 d6                	mov    esi,edx
  80b184:	89 c7                	mov    edi,eax
  80b186:	e8 45 a5 ff ff       	call   8056d0 <outb>
    outb(port_reg_index,15);
  80b18b:	8b 05 af f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3af]        # 42a540 <port_reg_index>
  80b191:	0f b7 c0             	movzx  eax,ax
  80b194:	be 0f 00 00 00       	mov    esi,0xf
  80b199:	89 c7                	mov    edi,eax
  80b19b:	e8 30 a5 ff ff       	call   8056d0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80b1a0:	48 8b 05 59 11 00 00 	mov    rax,QWORD PTR [rip+0x1159]        # 80c300 <m_ptr>
  80b1a7:	48 8b 15 6a f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f36a]        # 42a518 <video_base>
  80b1ae:	48 29 d0             	sub    rax,rdx
  80b1b1:	48 d1 f8             	sar    rax,1
  80b1b4:	0f b6 d0             	movzx  edx,al
  80b1b7:	8b 05 87 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f387]        # 42a544 <port_reg_v>
  80b1bd:	0f b7 c0             	movzx  eax,ax
  80b1c0:	89 d6                	mov    esi,edx
  80b1c2:	89 c7                	mov    edi,eax
  80b1c4:	e8 07 a5 ff ff       	call   8056d0 <outb>
    asm volatile("sti");
  80b1c9:	fb                   	sti    
}
  80b1ca:	90                   	nop
  80b1cb:	5d                   	pop    rbp
  80b1cc:	c3                   	ret    

000000000080b1cd <read_tty>:

int read_tty(driver_args *args)
{
  80b1cd:	f3 0f 1e fa          	endbr64 
  80b1d1:	55                   	push   rbp
  80b1d2:	48 89 e5             	mov    rbp,rsp
  80b1d5:	48 83 ec 20          	sub    rsp,0x20
  80b1d9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80b1dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b1e1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80b1e4:	48 98                	cdqe   
  80b1e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b1ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b1ee:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b1f1:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b1f4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b1fb:	eb 4a                	jmp    80b247 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80b1fd:	48 8b 15 fc 10 00 00 	mov    rdx,QWORD PTR [rip+0x10fc]        # 80c300 <m_ptr>
  80b204:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b208:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b20c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b210:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b213:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80b215:	48 8b 05 e4 10 00 00 	mov    rax,QWORD PTR [rip+0x10e4]        # 80c300 <m_ptr>
  80b21c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80b222:	75 0d                	jne    80b231 <read_tty+0x64>
  80b224:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b228:	7e 07                	jle    80b231 <read_tty+0x64>
        {
            return 1;//读到尾了
  80b22a:	b8 01 00 00 00       	mov    eax,0x1
  80b22f:	eb 2d                	jmp    80b25e <read_tty+0x91>
        }
        m_ptr+=2;
  80b231:	48 8b 05 c8 10 00 00 	mov    rax,QWORD PTR [rip+0x10c8]        # 80c300 <m_ptr>
  80b238:	48 83 c0 02          	add    rax,0x2
  80b23c:	48 89 05 bd 10 00 00 	mov    QWORD PTR [rip+0x10bd],rax        # 80c300 <m_ptr>
    for(int i=0;i<len;i++)
  80b243:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b247:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b24a:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b24d:	7c ae                	jl     80b1fd <read_tty+0x30>
    }
    set_cur();
  80b24f:	b8 00 00 00 00       	mov    eax,0x0
  80b254:	e8 ea fe ff ff       	call   80b143 <set_cur>
    return 0;
  80b259:	b8 00 00 00 00       	mov    eax,0x0
}
  80b25e:	c9                   	leave  
  80b25f:	c3                   	ret    

000000000080b260 <write_tty>:
int write_tty(driver_args *args)
{
  80b260:	f3 0f 1e fa          	endbr64 
  80b264:	55                   	push   rbp
  80b265:	48 89 e5             	mov    rbp,rsp
  80b268:	48 83 ec 30          	sub    rsp,0x30
  80b26c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80b270:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b274:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b277:	48 98                	cdqe   
  80b279:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b27d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b281:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b284:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b287:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b28e:	e9 0b 01 00 00       	jmp    80b39e <write_tty+0x13e>
    {
        if(*src=='\n')
  80b293:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b297:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b29a:	3c 0a                	cmp    al,0xa
  80b29c:	75 50                	jne    80b2ee <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80b29e:	48 8b 05 5b 10 00 00 	mov    rax,QWORD PTR [rip+0x105b]        # 80c300 <m_ptr>
  80b2a5:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80b2ab:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80b2ae:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2b1:	89 c2                	mov    edx,eax
  80b2b3:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80b2b8:	48 0f af c2          	imul   rax,rdx
  80b2bc:	48 c1 e8 20          	shr    rax,0x20
  80b2c0:	c1 e8 07             	shr    eax,0x7
  80b2c3:	8d 50 01             	lea    edx,[rax+0x1]
  80b2c6:	89 d0                	mov    eax,edx
  80b2c8:	c1 e0 02             	shl    eax,0x2
  80b2cb:	01 d0                	add    eax,edx
  80b2cd:	c1 e0 05             	shl    eax,0x5
  80b2d0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80b2d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2d6:	05 00 80 0b 00       	add    eax,0xb8000
  80b2db:	89 c0                	mov    eax,eax
  80b2dd:	48 89 05 1c 10 00 00 	mov    QWORD PTR [rip+0x101c],rax        # 80c300 <m_ptr>
            src++;
  80b2e4:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80b2e9:	e9 ac 00 00 00       	jmp    80b39a <write_tty+0x13a>
        }else if(*src=='\0')
  80b2ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2f5:	84 c0                	test   al,al
  80b2f7:	0f 84 af 00 00 00    	je     80b3ac <write_tty+0x14c>
            break;
        if(*src=='\b')
  80b2fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b301:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b304:	3c 08                	cmp    al,0x8
  80b306:	75 1e                	jne    80b326 <write_tty+0xc6>
        {
            m_ptr-=2;
  80b308:	48 8b 05 f1 0f 00 00 	mov    rax,QWORD PTR [rip+0xff1]        # 80c300 <m_ptr>
  80b30f:	48 83 e8 02          	sub    rax,0x2
  80b313:	48 89 05 e6 0f 00 00 	mov    QWORD PTR [rip+0xfe6],rax        # 80c300 <m_ptr>
            *m_ptr=0;
  80b31a:	48 8b 05 df 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdf]        # 80c300 <m_ptr>
  80b321:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80b324:	eb 3e                	jmp    80b364 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80b326:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b32a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b32e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80b332:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80c300 <m_ptr>
  80b339:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b33d:	48 89 0d bc 0f 00 00 	mov    QWORD PTR [rip+0xfbc],rcx        # 80c300 <m_ptr>
  80b344:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b347:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80b349:	48 8b 05 b0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb0]        # 80c300 <m_ptr>
  80b350:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b354:	48 89 15 a5 0f 00 00 	mov    QWORD PTR [rip+0xfa5],rdx        # 80c300 <m_ptr>
  80b35b:	0f b6 15 a6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfa6]        # 80c308 <m_color>
  80b362:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80b364:	48 8b 05 95 0f 00 00 	mov    rax,QWORD PTR [rip+0xf95]        # 80c300 <m_ptr>
  80b36b:	48 8b 0d b6 f1 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1f1b6]        # 42a528 <vpage_base>
  80b372:	48 29 c8             	sub    rax,rcx
  80b375:	48 89 c2             	mov    rdx,rax
  80b378:	8b 05 ca f1 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f1ca]        # 42a548 <vpage_size>
  80b37e:	8b 0d b8 f1 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f1b8]        # 42a53c <line_chs>
  80b384:	29 c8                	sub    eax,ecx
  80b386:	01 c0                	add    eax,eax
  80b388:	48 98                	cdqe   
  80b38a:	48 39 c2             	cmp    rdx,rax
  80b38d:	7c 0b                	jl     80b39a <write_tty+0x13a>
  80b38f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b393:	7e 05                	jle    80b39a <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80b395:	e8 bc f8 ff ff       	call   80ac56 <scrdown>
    for(int i=0;i<len;i++)
  80b39a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b39e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b3a1:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b3a4:	0f 8c e9 fe ff ff    	jl     80b293 <write_tty+0x33>
  80b3aa:	eb 01                	jmp    80b3ad <write_tty+0x14d>
            break;
  80b3ac:	90                   	nop
        }
    }
    set_cur();
  80b3ad:	b8 00 00 00 00       	mov    eax,0x0
  80b3b2:	e8 8c fd ff ff       	call   80b143 <set_cur>
    return 0;
  80b3b7:	b8 00 00 00 00       	mov    eax,0x0
}
  80b3bc:	c9                   	leave  
  80b3bd:	c3                   	ret    

000000000080b3be <cls>:

void cls(driver_args *args)
{
  80b3be:	f3 0f 1e fa          	endbr64 
  80b3c2:	55                   	push   rbp
  80b3c3:	48 89 e5             	mov    rbp,rsp
  80b3c6:	48 83 ec 20          	sub    rsp,0x20
  80b3ca:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80b3ce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b3d5:	eb 16                	jmp    80b3ed <cls+0x2f>
    {
        vpage_base[i]=0;
  80b3d7:	48 8b 15 4a f1 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f14a]        # 42a528 <vpage_base>
  80b3de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b3e1:	48 98                	cdqe   
  80b3e3:	48 01 d0             	add    rax,rdx
  80b3e6:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80b3e9:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80b3ed:	8b 05 55 f1 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f155]        # 42a548 <vpage_size>
  80b3f3:	01 c0                	add    eax,eax
  80b3f5:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80b3f8:	7c dd                	jl     80b3d7 <cls+0x19>
    }
    m_ptr=vpage_base;
  80b3fa:	48 8b 05 27 f1 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f127]        # 42a528 <vpage_base>
  80b401:	48 89 05 f8 0e 00 00 	mov    QWORD PTR [rip+0xef8],rax        # 80c300 <m_ptr>
    set_cur();
  80b408:	b8 00 00 00 00       	mov    eax,0x0
  80b40d:	e8 31 fd ff ff       	call   80b143 <set_cur>
}
  80b412:	90                   	nop
  80b413:	c9                   	leave  
  80b414:	c3                   	ret    

000000000080b415 <set_color>:

void set_color(char color)
{
  80b415:	f3 0f 1e fa          	endbr64 
  80b419:	55                   	push   rbp
  80b41a:	48 89 e5             	mov    rbp,rsp
  80b41d:	89 f8                	mov    eax,edi
  80b41f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80b422:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80b426:	88 05 dc 0e 00 00    	mov    BYTE PTR [rip+0xedc],al        # 80c308 <m_color>
}
  80b42c:	90                   	nop
  80b42d:	5d                   	pop    rbp
  80b42e:	c3                   	ret    

000000000080b42f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80b42f:	f3 0f 1e fa          	endbr64 
  80b433:	55                   	push   rbp
  80b434:	48 89 e5             	mov    rbp,rsp
  80b437:	48 83 ec 10          	sub    rsp,0x10
  80b43b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80b43f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b443:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80b449:	83 f8 0d             	cmp    eax,0xd
  80b44c:	74 45                	je     80b493 <tty_do_req+0x64>
  80b44e:	83 f8 0d             	cmp    eax,0xd
  80b451:	7f 53                	jg     80b4a6 <tty_do_req+0x77>
  80b453:	83 f8 0c             	cmp    eax,0xc
  80b456:	74 2d                	je     80b485 <tty_do_req+0x56>
  80b458:	83 f8 0c             	cmp    eax,0xc
  80b45b:	7f 49                	jg     80b4a6 <tty_do_req+0x77>
  80b45d:	83 f8 02             	cmp    eax,0x2
  80b460:	74 07                	je     80b469 <tty_do_req+0x3a>
  80b462:	83 f8 03             	cmp    eax,0x3
  80b465:	74 10                	je     80b477 <tty_do_req+0x48>
  80b467:	eb 3d                	jmp    80b4a6 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80b469:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b46d:	48 89 c7             	mov    rdi,rax
  80b470:	e8 58 fd ff ff       	call   80b1cd <read_tty>
        break;
  80b475:	eb 36                	jmp    80b4ad <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80b477:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b47b:	48 89 c7             	mov    rdi,rax
  80b47e:	e8 dd fd ff ff       	call   80b260 <write_tty>
        break;
  80b483:	eb 28                	jmp    80b4ad <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80b485:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b489:	48 89 c7             	mov    rdi,rax
  80b48c:	e8 a2 fb ff ff       	call   80b033 <seek_tty>
        break;
  80b491:	eb 1a                	jmp    80b4ad <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80b493:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b497:	48 89 c7             	mov    rdi,rax
  80b49a:	b8 00 00 00 00       	mov    eax,0x0
  80b49f:	e8 bb fb ff ff       	call   80b05f <tell_monitor>
        break;
  80b4a4:	eb 07                	jmp    80b4ad <tty_do_req+0x7e>
    default:return -1;
  80b4a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b4ab:	eb 05                	jmp    80b4b2 <tty_do_req+0x83>
    }
    return 0;
  80b4ad:	b8 00 00 00 00       	mov    eax,0x0
}
  80b4b2:	c9                   	leave  
  80b4b3:	c3                   	ret    

000000000080b4b4 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b4b4:	f3 0f 1e fa          	endbr64 
  80b4b8:	55                   	push   rbp
  80b4b9:	48 89 e5             	mov    rbp,rsp
  80b4bc:	48 83 ec 10          	sub    rsp,0x10
  80b4c0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b4c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4c6:	83 c0 01             	add    eax,0x1
  80b4c9:	0f b7 c0             	movzx  eax,ax
  80b4cc:	be 00 00 00 00       	mov    esi,0x0
  80b4d1:	89 c7                	mov    edi,eax
  80b4d3:	e8 f8 a1 ff ff       	call   8056d0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b4d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4db:	83 c0 03             	add    eax,0x3
  80b4de:	0f b7 c0             	movzx  eax,ax
  80b4e1:	be 80 00 00 00       	mov    esi,0x80
  80b4e6:	89 c7                	mov    edi,eax
  80b4e8:	e8 e3 a1 ff ff       	call   8056d0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b4ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4f0:	0f b7 c0             	movzx  eax,ax
  80b4f3:	be 03 00 00 00       	mov    esi,0x3
  80b4f8:	89 c7                	mov    edi,eax
  80b4fa:	e8 d1 a1 ff ff       	call   8056d0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b4ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b502:	83 c0 01             	add    eax,0x1
  80b505:	0f b7 c0             	movzx  eax,ax
  80b508:	be 00 00 00 00       	mov    esi,0x0
  80b50d:	89 c7                	mov    edi,eax
  80b50f:	e8 bc a1 ff ff       	call   8056d0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b514:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b517:	83 c0 03             	add    eax,0x3
  80b51a:	0f b7 c0             	movzx  eax,ax
  80b51d:	be 03 00 00 00       	mov    esi,0x3
  80b522:	89 c7                	mov    edi,eax
  80b524:	e8 a7 a1 ff ff       	call   8056d0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80b529:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b52c:	83 c0 02             	add    eax,0x2
  80b52f:	0f b7 c0             	movzx  eax,ax
  80b532:	be c7 00 00 00       	mov    esi,0xc7
  80b537:	89 c7                	mov    edi,eax
  80b539:	e8 92 a1 ff ff       	call   8056d0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b53e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b541:	83 c0 04             	add    eax,0x4
  80b544:	0f b7 c0             	movzx  eax,ax
  80b547:	be 0b 00 00 00       	mov    esi,0xb
  80b54c:	89 c7                	mov    edi,eax
  80b54e:	e8 7d a1 ff ff       	call   8056d0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80b553:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b556:	83 c0 04             	add    eax,0x4
  80b559:	0f b7 c0             	movzx  eax,ax
  80b55c:	be 1e 00 00 00       	mov    esi,0x1e
  80b561:	89 c7                	mov    edi,eax
  80b563:	e8 68 a1 ff ff       	call   8056d0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80b568:	b8 61 00 00 00       	mov    eax,0x61
  80b56d:	0f b6 d0             	movzx  edx,al
  80b570:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b573:	0f b7 c0             	movzx  eax,ax
  80b576:	89 d6                	mov    esi,edx
  80b578:	89 c7                	mov    edi,eax
  80b57a:	e8 51 a1 ff ff       	call   8056d0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80b57f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b582:	0f b6 c0             	movzx  eax,al
  80b585:	89 c7                	mov    edi,eax
  80b587:	e8 5d a1 ff ff       	call   8056e9 <inb>
  80b58c:	0f b6 d0             	movzx  edx,al
  80b58f:	b8 61 00 00 00       	mov    eax,0x61
  80b594:	0f be c0             	movsx  eax,al
  80b597:	39 c2                	cmp    edx,eax
  80b599:	75 17                	jne    80b5b2 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b59b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b59e:	83 c0 04             	add    eax,0x4
  80b5a1:	0f b7 c0             	movzx  eax,ax
  80b5a4:	be 0f 00 00 00       	mov    esi,0xf
  80b5a9:	89 c7                	mov    edi,eax
  80b5ab:	e8 20 a1 ff ff       	call   8056d0 <outb>
  80b5b0:	eb 01                	jmp    80b5b3 <init_com+0xff>
        return;
  80b5b2:	90                   	nop
}
  80b5b3:	c9                   	leave  
  80b5b4:	c3                   	ret    

000000000080b5b5 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80b5b5:	f3 0f 1e fa          	endbr64 
  80b5b9:	55                   	push   rbp
  80b5ba:	48 89 e5             	mov    rbp,rsp
  80b5bd:	48 83 ec 20          	sub    rsp,0x20
  80b5c1:	89 f8                	mov    eax,edi
  80b5c3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80b5c6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80b5ca:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b5cd:	83 c0 05             	add    eax,0x5
  80b5d0:	0f b6 c0             	movzx  eax,al
  80b5d3:	89 c7                	mov    edi,eax
  80b5d5:	e8 0f a1 ff ff       	call   8056e9 <inb>
  80b5da:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80b5dd:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80b5e1:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80b5e5:	74 e3                	je     80b5ca <com_putchar+0x15>
    outb(com_base, ch);
  80b5e7:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80b5eb:	0f b6 d0             	movzx  edx,al
  80b5ee:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b5f1:	0f b7 c0             	movzx  eax,ax
  80b5f4:	89 d6                	mov    esi,edx
  80b5f6:	89 c7                	mov    edi,eax
  80b5f8:	e8 d3 a0 ff ff       	call   8056d0 <outb>
}
  80b5fd:	90                   	nop
  80b5fe:	c9                   	leave  
  80b5ff:	c3                   	ret    

000000000080b600 <com_puts>:

void com_puts(char* s,int com_port){
  80b600:	f3 0f 1e fa          	endbr64 
  80b604:	55                   	push   rbp
  80b605:	48 89 e5             	mov    rbp,rsp
  80b608:	48 83 ec 10          	sub    rsp,0x10
  80b60c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b610:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80b613:	eb 1d                	jmp    80b632 <com_puts+0x32>
        com_putchar(*s,com_port);
  80b615:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b619:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b61c:	66 98                	cbw    
  80b61e:	0f b7 c0             	movzx  eax,ax
  80b621:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80b624:	89 d6                	mov    esi,edx
  80b626:	89 c7                	mov    edi,eax
  80b628:	e8 88 ff ff ff       	call   80b5b5 <com_putchar>
    for(;*s;s++){
  80b62d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80b632:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b636:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b639:	84 c0                	test   al,al
  80b63b:	75 d8                	jne    80b615 <com_puts+0x15>
    }
  80b63d:	90                   	nop
  80b63e:	90                   	nop
  80b63f:	c9                   	leave  
  80b640:	c3                   	ret    

000000000080b641 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80b641:	f3 0f 1e fa          	endbr64 
  80b645:	55                   	push   rbp
  80b646:	48 89 e5             	mov    rbp,rsp
  80b649:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b64d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b651:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80b654:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b658:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80b65b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b662:	eb 1b                	jmp    80b67f <memcpy+0x3e>
        *(dest)=*(src);
  80b664:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b668:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b66b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b66f:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80b671:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80b676:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80b67b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b67f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b682:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80b685:	77 dd                	ja     80b664 <memcpy+0x23>
    }
}
  80b687:	90                   	nop
  80b688:	90                   	nop
  80b689:	5d                   	pop    rbp
  80b68a:	c3                   	ret    

000000000080b68b <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80b68b:	f3 0f 1e fa          	endbr64 
  80b68f:	55                   	push   rbp
  80b690:	48 89 e5             	mov    rbp,rsp
  80b693:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b697:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b69b:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80b69e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b6a5:	eb 3a                	jmp    80b6e1 <memcmp+0x56>
    {
        if(*a!=*b)
  80b6a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6ab:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b6ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6b5:	38 c2                	cmp    dl,al
  80b6b7:	74 1a                	je     80b6d3 <memcmp+0x48>
            return *a-*b;
  80b6b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6bd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6c0:	0f b6 d0             	movzx  edx,al
  80b6c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6ca:	0f b6 c8             	movzx  ecx,al
  80b6cd:	89 d0                	mov    eax,edx
  80b6cf:	29 c8                	sub    eax,ecx
  80b6d1:	eb 1b                	jmp    80b6ee <memcmp+0x63>
        a++;
  80b6d3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80b6d8:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80b6dd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b6e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6e4:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80b6e7:	7c be                	jl     80b6a7 <memcmp+0x1c>
    }
    return 0;
  80b6e9:	b8 00 00 00 00       	mov    eax,0x0
}
  80b6ee:	5d                   	pop    rbp
  80b6ef:	c3                   	ret    

000000000080b6f0 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80b6f0:	f3 0f 1e fa          	endbr64 
  80b6f4:	55                   	push   rbp
  80b6f5:	48 89 e5             	mov    rbp,rsp
  80b6f8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b6fc:	89 f0                	mov    eax,esi
  80b6fe:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80b701:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80b704:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b70b:	eb 16                	jmp    80b723 <memset+0x33>
        *(buf++)=value;
  80b70d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b711:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b715:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b719:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80b71d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80b71f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b723:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b726:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80b729:	72 e2                	jb     80b70d <memset+0x1d>
    }
}
  80b72b:	90                   	nop
  80b72c:	90                   	nop
  80b72d:	5d                   	pop    rbp
  80b72e:	c3                   	ret    

000000000080b72f <get_mem_size>:

u32 get_mem_size(){
  80b72f:	f3 0f 1e fa          	endbr64 
  80b733:	55                   	push   rbp
  80b734:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80b737:	8b 05 1f ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ee1f]        # 42a55c <mem_end>
}
  80b73d:	5d                   	pop    rbp
  80b73e:	c3                   	ret    

000000000080b73f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80b73f:	f3 0f 1e fa          	endbr64 
  80b743:	55                   	push   rbp
  80b744:	48 89 e5             	mov    rbp,rsp
  80b747:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b74b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80b74f:	eb 1d                	jmp    80b76e <strcpy+0x2f>
        *(dest++)=*(buf++);
  80b751:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80b755:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b759:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80b75d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b761:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b765:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b769:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b76c:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80b76e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b772:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b775:	84 c0                	test   al,al
  80b777:	75 d8                	jne    80b751 <strcpy+0x12>
    }
    *dest='\0';
  80b779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b77d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80b780:	90                   	nop
  80b781:	5d                   	pop    rbp
  80b782:	c3                   	ret    

000000000080b783 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80b783:	f3 0f 1e fa          	endbr64 
  80b787:	55                   	push   rbp
  80b788:	48 89 e5             	mov    rbp,rsp
  80b78b:	48 83 ec 30          	sub    rsp,0x30
  80b78f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b793:	89 f0                	mov    eax,esi
  80b795:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80b798:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80b79d:	0f 84 9c 00 00 00    	je     80b83f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80b7a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b7a7:	48 89 c6             	mov    rsi,rax
  80b7aa:	bf 80 a5 42 00       	mov    edi,0x42a580
  80b7af:	e8 8b ff ff ff       	call   80b73f <strcpy>
        char* ptr=strtokkee;
  80b7b4:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80b7bb:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80b7bc:	c7 05 ba ef c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1efba],0x0        # 42a780 <tokptr>
  80b7c3:	00 00 00 
  80b7c6:	eb 1c                	jmp    80b7e4 <strtok+0x61>
  80b7c8:	8b 05 b2 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1efb2]        # 42a780 <tokptr>
  80b7ce:	83 c0 01             	add    eax,0x1
  80b7d1:	99                   	cdq    
  80b7d2:	c1 ea 17             	shr    edx,0x17
  80b7d5:	01 d0                	add    eax,edx
  80b7d7:	25 ff 01 00 00       	and    eax,0x1ff
  80b7dc:	29 d0                	sub    eax,edx
  80b7de:	89 05 9c ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef9c],eax        # 42a780 <tokptr>
  80b7e4:	8b 05 96 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef96]        # 42a780 <tokptr>
  80b7ea:	48 98                	cdqe   
  80b7ec:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b7f3:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b7f6:	74 13                	je     80b80b <strtok+0x88>
  80b7f8:	8b 05 82 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef82]        # 42a780 <tokptr>
  80b7fe:	48 98                	cdqe   
  80b800:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b807:	84 c0                	test   al,al
  80b809:	75 bd                	jne    80b7c8 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80b80b:	8b 05 6f ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef6f]        # 42a780 <tokptr>
  80b811:	48 98                	cdqe   
  80b813:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80b81a:	8b 05 60 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef60]        # 42a780 <tokptr>
  80b820:	83 c0 01             	add    eax,0x1
  80b823:	99                   	cdq    
  80b824:	c1 ea 17             	shr    edx,0x17
  80b827:	01 d0                	add    eax,edx
  80b829:	25 ff 01 00 00       	and    eax,0x1ff
  80b82e:	29 d0                	sub    eax,edx
  80b830:	89 05 4a ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef4a],eax        # 42a780 <tokptr>
        return ptr;
  80b836:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b83a:	e9 9e 00 00 00       	jmp    80b8dd <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80b83f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80b846:	8b 05 34 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef34]        # 42a780 <tokptr>
  80b84c:	48 98                	cdqe   
  80b84e:	48 05 80 a5 42 00    	add    rax,0x42a580
  80b854:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80b858:	eb 20                	jmp    80b87a <strtok+0xf7>
  80b85a:	8b 05 20 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef20]        # 42a780 <tokptr>
  80b860:	83 c0 01             	add    eax,0x1
  80b863:	99                   	cdq    
  80b864:	c1 ea 17             	shr    edx,0x17
  80b867:	01 d0                	add    eax,edx
  80b869:	25 ff 01 00 00       	and    eax,0x1ff
  80b86e:	29 d0                	sub    eax,edx
  80b870:	89 05 0a ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef0a],eax        # 42a780 <tokptr>
  80b876:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b87a:	8b 05 00 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef00]        # 42a780 <tokptr>
  80b880:	48 98                	cdqe   
  80b882:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b889:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b88c:	74 13                	je     80b8a1 <strtok+0x11e>
  80b88e:	8b 05 ec ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eeec]        # 42a780 <tokptr>
  80b894:	48 98                	cdqe   
  80b896:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b89d:	84 c0                	test   al,al
  80b89f:	75 b9                	jne    80b85a <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80b8a1:	8b 05 d9 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eed9]        # 42a780 <tokptr>
  80b8a7:	48 98                	cdqe   
  80b8a9:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80b8b0:	8b 05 ca ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eeca]        # 42a780 <tokptr>
  80b8b6:	83 c0 01             	add    eax,0x1
  80b8b9:	99                   	cdq    
  80b8ba:	c1 ea 17             	shr    edx,0x17
  80b8bd:	01 d0                	add    eax,edx
  80b8bf:	25 ff 01 00 00       	and    eax,0x1ff
  80b8c4:	29 d0                	sub    eax,edx
  80b8c6:	89 05 b4 ee c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eeb4],eax        # 42a780 <tokptr>
    if(c)
  80b8cc:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80b8d0:	74 06                	je     80b8d8 <strtok+0x155>
        return ptr;
  80b8d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b8d6:	eb 05                	jmp    80b8dd <strtok+0x15a>
    else
        return (void*)0;
  80b8d8:	b8 00 00 00 00       	mov    eax,0x0
}
  80b8dd:	c9                   	leave  
  80b8de:	c3                   	ret    

000000000080b8df <strcmp>:
int strcmp(char *s1,char *s2)
{
  80b8df:	f3 0f 1e fa          	endbr64 
  80b8e3:	55                   	push   rbp
  80b8e4:	48 89 e5             	mov    rbp,rsp
  80b8e7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b8eb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80b8ef:	eb 3c                	jmp    80b92d <strcmp+0x4e>
		if(*s1>*s2)
  80b8f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8f5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b8f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b8fc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8ff:	38 c2                	cmp    dl,al
  80b901:	7e 07                	jle    80b90a <strcmp+0x2b>
			return 1;
  80b903:	b8 01 00 00 00       	mov    eax,0x1
  80b908:	eb 52                	jmp    80b95c <strcmp+0x7d>
		else if(*s1<*s2)
  80b90a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b90e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b911:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b915:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b918:	38 c2                	cmp    dl,al
  80b91a:	7d 07                	jge    80b923 <strcmp+0x44>
			return -1;
  80b91c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b921:	eb 39                	jmp    80b95c <strcmp+0x7d>
		s1++;
  80b923:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80b928:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80b92d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b931:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b934:	84 c0                	test   al,al
  80b936:	74 0b                	je     80b943 <strcmp+0x64>
  80b938:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b93c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b93f:	84 c0                	test   al,al
  80b941:	75 ae                	jne    80b8f1 <strcmp+0x12>
	}
	if(*s1==*s2)
  80b943:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b947:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b94a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b94e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b951:	38 c2                	cmp    dl,al
  80b953:	75 07                	jne    80b95c <strcmp+0x7d>
		return 0;
  80b955:	b8 00 00 00 00       	mov    eax,0x0
  80b95a:	eb 00                	jmp    80b95c <strcmp+0x7d>
}
  80b95c:	5d                   	pop    rbp
  80b95d:	c3                   	ret    

000000000080b95e <strlen>:

int strlen(char *str)
{
  80b95e:	f3 0f 1e fa          	endbr64 
  80b962:	55                   	push   rbp
  80b963:	48 89 e5             	mov    rbp,rsp
  80b966:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80b96a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80b971:	eb 09                	jmp    80b97c <strlen+0x1e>
  80b973:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80b978:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b97c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b980:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b983:	84 c0                	test   al,al
  80b985:	75 ec                	jne    80b973 <strlen+0x15>
    return l;
  80b987:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80b98a:	5d                   	pop    rbp
  80b98b:	c3                   	ret    

000000000080b98c <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80b98c:	f3 0f 1e fa          	endbr64 
  80b990:	55                   	push   rbp
  80b991:	48 89 e5             	mov    rbp,rsp
  80b994:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80b99b:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80b9a2:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80b9a9:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80b9b0:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80b9b7:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80b9be:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80b9c5:	84 c0                	test   al,al
  80b9c7:	74 20                	je     80b9e9 <sprintf+0x5d>
  80b9c9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80b9cd:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80b9d1:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80b9d5:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80b9d9:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80b9dd:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80b9e1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80b9e5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80b9e9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80b9f0:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80b9f7:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80b9fe:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80ba05:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80ba0c:	00 00 00 
    while (*pstr!='\n')
  80ba0f:	eb 39                	jmp    80ba4a <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80ba11:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba1b:	3c 25                	cmp    al,0x25
  80ba1d:	75 15                	jne    80ba34 <sprintf+0xa8>
  80ba1f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80ba26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba29:	3c 25                	cmp    al,0x25
  80ba2b:	74 07                	je     80ba34 <sprintf+0xa8>
            argnum++;
  80ba2d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80ba34:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba3b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80ba42:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ba49:	01 
    while (*pstr!='\n')
  80ba4a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba51:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba54:	3c 0a                	cmp    al,0xa
  80ba56:	75 b9                	jne    80ba11 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80ba58:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80ba5f:	00 00 00 
  80ba62:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80ba69:	00 00 00 
  80ba6c:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80ba70:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80ba77:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80ba7e:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80ba85:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ba8c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80ba93:	e9 e2 01 00 00       	jmp    80bc7a <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80ba98:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80baa2:	3c 25                	cmp    al,0x25
  80baa4:	0f 85 aa 01 00 00    	jne    80bc54 <sprintf+0x2c8>
  80baaa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bab1:	48 83 c0 01          	add    rax,0x1
  80bab5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bab8:	84 c0                	test   al,al
  80baba:	0f 84 94 01 00 00    	je     80bc54 <sprintf+0x2c8>
            pstr++;
  80bac0:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bac7:	01 
            if(*pstr=='x'){
  80bac8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bacf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bad2:	3c 78                	cmp    al,0x78
  80bad4:	75 64                	jne    80bb3a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bad6:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80badc:	83 f8 2f             	cmp    eax,0x2f
  80badf:	77 23                	ja     80bb04 <sprintf+0x178>
  80bae1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bae8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80baee:	89 d2                	mov    edx,edx
  80baf0:	48 01 d0             	add    rax,rdx
  80baf3:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80baf9:	83 c2 08             	add    edx,0x8
  80bafc:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bb02:	eb 12                	jmp    80bb16 <sprintf+0x18a>
  80bb04:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bb0b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bb0f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bb16:	8b 00                	mov    eax,DWORD PTR [rax]
  80bb18:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80bb1e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80bb24:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bb2b:	89 d6                	mov    esi,edx
  80bb2d:	48 89 c7             	mov    rdi,rax
  80bb30:	e8 4e 02 00 00       	call   80bd83 <sprint_hex>
            if(*pstr=='x'){
  80bb35:	e9 38 01 00 00       	jmp    80bc72 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80bb3a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bb41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb44:	3c 73                	cmp    al,0x73
  80bb46:	75 68                	jne    80bbb0 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80bb48:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bb4e:	83 f8 2f             	cmp    eax,0x2f
  80bb51:	77 23                	ja     80bb76 <sprintf+0x1ea>
  80bb53:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bb5a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb60:	89 d2                	mov    edx,edx
  80bb62:	48 01 d0             	add    rax,rdx
  80bb65:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb6b:	83 c2 08             	add    edx,0x8
  80bb6e:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bb74:	eb 12                	jmp    80bb88 <sprintf+0x1fc>
  80bb76:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bb7d:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bb81:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bb88:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bb8b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80bb92:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80bb99:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bba0:	48 89 d6             	mov    rsi,rdx
  80bba3:	48 89 c7             	mov    rdi,rax
  80bba6:	e8 5a 02 00 00       	call   80be05 <sprintn>
            if(*pstr=='x'){
  80bbab:	e9 c2 00 00 00       	jmp    80bc72 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80bbb0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bbb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbba:	3c 64                	cmp    al,0x64
  80bbbc:	75 66                	jne    80bc24 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80bbbe:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bbc4:	83 f8 2f             	cmp    eax,0x2f
  80bbc7:	77 23                	ja     80bbec <sprintf+0x260>
  80bbc9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bbd0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bbd6:	89 d2                	mov    edx,edx
  80bbd8:	48 01 d0             	add    rax,rdx
  80bbdb:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bbe1:	83 c2 08             	add    edx,0x8
  80bbe4:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bbea:	eb 12                	jmp    80bbfe <sprintf+0x272>
  80bbec:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bbf3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bbf7:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bbfe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc01:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80bc08:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80bc0f:	89 c2                	mov    edx,eax
  80bc11:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc18:	89 d6                	mov    esi,edx
  80bc1a:	48 89 c7             	mov    rdi,rax
  80bc1d:	e8 ad 00 00 00       	call   80bccf <sprint_decimal>
            if(*pstr=='x'){
  80bc22:	eb 4e                	jmp    80bc72 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80bc24:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc2e:	3c 63                	cmp    al,0x63
  80bc30:	75 02                	jne    80bc34 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80bc32:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80bc34:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc3e:	0f be d0             	movsx  edx,al
  80bc41:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc48:	89 d6                	mov    esi,edx
  80bc4a:	48 89 c7             	mov    rdi,rax
  80bc4d:	e8 3e 00 00 00       	call   80bc90 <sprintchar>
            if(*pstr=='x'){
  80bc52:	eb 1e                	jmp    80bc72 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80bc54:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc5e:	0f be d0             	movsx  edx,al
  80bc61:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc68:	89 d6                	mov    esi,edx
  80bc6a:	48 89 c7             	mov    rdi,rax
  80bc6d:	e8 1e 00 00 00       	call   80bc90 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80bc72:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bc79:	01 
  80bc7a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc84:	84 c0                	test   al,al
  80bc86:	0f 85 0c fe ff ff    	jne    80ba98 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80bc8c:	90                   	nop
  80bc8d:	90                   	nop
  80bc8e:	c9                   	leave  
  80bc8f:	c3                   	ret    

000000000080bc90 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80bc90:	f3 0f 1e fa          	endbr64 
  80bc94:	55                   	push   rbp
  80bc95:	48 89 e5             	mov    rbp,rsp
  80bc98:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bc9c:	89 f0                	mov    eax,esi
  80bc9e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80bca1:	eb 05                	jmp    80bca8 <sprintchar+0x18>
        dist++;
  80bca3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80bca8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcaf:	84 c0                	test   al,al
  80bcb1:	75 f0                	jne    80bca3 <sprintchar+0x13>
    *dist++=c;
  80bcb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcb7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bcbb:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80bcbf:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80bcc3:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80bcc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcc9:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bccc:	90                   	nop
  80bccd:	5d                   	pop    rbp
  80bcce:	c3                   	ret    

000000000080bccf <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80bccf:	f3 0f 1e fa          	endbr64 
  80bcd3:	55                   	push   rbp
  80bcd4:	48 89 e5             	mov    rbp,rsp
  80bcd7:	48 83 ec 30          	sub    rsp,0x30
  80bcdb:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bcdf:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80bce2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80bce9:	eb 65                	jmp    80bd50 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80bceb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80bcee:	48 63 c2             	movsxd rax,edx
  80bcf1:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80bcf8:	48 c1 e8 20          	shr    rax,0x20
  80bcfc:	c1 f8 02             	sar    eax,0x2
  80bcff:	89 d6                	mov    esi,edx
  80bd01:	c1 fe 1f             	sar    esi,0x1f
  80bd04:	29 f0                	sub    eax,esi
  80bd06:	89 c1                	mov    ecx,eax
  80bd08:	89 c8                	mov    eax,ecx
  80bd0a:	c1 e0 02             	shl    eax,0x2
  80bd0d:	01 c8                	add    eax,ecx
  80bd0f:	01 c0                	add    eax,eax
  80bd11:	89 d1                	mov    ecx,edx
  80bd13:	29 c1                	sub    ecx,eax
  80bd15:	89 c8                	mov    eax,ecx
  80bd17:	83 c0 30             	add    eax,0x30
  80bd1a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80bd1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd20:	8d 50 01             	lea    edx,[rax+0x1]
  80bd23:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bd26:	48 98                	cdqe   
  80bd28:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bd2c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80bd30:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80bd33:	48 63 d0             	movsxd rdx,eax
  80bd36:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80bd3d:	48 c1 ea 20          	shr    rdx,0x20
  80bd41:	c1 fa 02             	sar    edx,0x2
  80bd44:	c1 f8 1f             	sar    eax,0x1f
  80bd47:	89 c1                	mov    ecx,eax
  80bd49:	89 d0                	mov    eax,edx
  80bd4b:	29 c8                	sub    eax,ecx
  80bd4d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80bd50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd53:	83 f8 0f             	cmp    eax,0xf
  80bd56:	76 93                	jbe    80bceb <sprint_decimal+0x1c>
    }
    while(p>0)
  80bd58:	eb 1f                	jmp    80bd79 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80bd5a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bd5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd61:	48 98                	cdqe   
  80bd63:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80bd68:	0f be d0             	movsx  edx,al
  80bd6b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bd6f:	89 d6                	mov    esi,edx
  80bd71:	48 89 c7             	mov    rdi,rax
  80bd74:	e8 17 ff ff ff       	call   80bc90 <sprintchar>
    while(p>0)
  80bd79:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bd7d:	7f db                	jg     80bd5a <sprint_decimal+0x8b>
    }
}
  80bd7f:	90                   	nop
  80bd80:	90                   	nop
  80bd81:	c9                   	leave  
  80bd82:	c3                   	ret    

000000000080bd83 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80bd83:	f3 0f 1e fa          	endbr64 
  80bd87:	55                   	push   rbp
  80bd88:	48 89 e5             	mov    rbp,rsp
  80bd8b:	48 83 ec 20          	sub    rsp,0x20
  80bd8f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bd93:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80bd96:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80bd9d:	eb 35                	jmp    80bdd4 <sprint_hex+0x51>
        unsigned char a=c%16;
  80bd9f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bda2:	83 e0 0f             	and    eax,0xf
  80bda5:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80bda8:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80bdac:	76 06                	jbe    80bdb4 <sprint_hex+0x31>
  80bdae:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80bdb2:	eb 04                	jmp    80bdb8 <sprint_hex+0x35>
        else a+='0';
  80bdb4:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80bdb8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bdbb:	8d 50 01             	lea    edx,[rax+0x1]
  80bdbe:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bdc1:	48 98                	cdqe   
  80bdc3:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bdc7:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80bdcb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bdce:	c1 e8 04             	shr    eax,0x4
  80bdd1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80bdd4:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80bdd8:	7e c5                	jle    80bd9f <sprint_hex+0x1c>
    }
    while(p>0)
  80bdda:	eb 1f                	jmp    80bdfb <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80bddc:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bde0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bde3:	48 98                	cdqe   
  80bde5:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80bdea:	0f be d0             	movsx  edx,al
  80bded:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdf1:	89 d6                	mov    esi,edx
  80bdf3:	48 89 c7             	mov    rdi,rax
  80bdf6:	e8 95 fe ff ff       	call   80bc90 <sprintchar>
    while(p>0)
  80bdfb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bdff:	7f db                	jg     80bddc <sprint_hex+0x59>
    }
}
  80be01:	90                   	nop
  80be02:	90                   	nop
  80be03:	c9                   	leave  
  80be04:	c3                   	ret    

000000000080be05 <sprintn>:
void sprintn(char *dist,char *str)
{
  80be05:	f3 0f 1e fa          	endbr64 
  80be09:	55                   	push   rbp
  80be0a:	48 89 e5             	mov    rbp,rsp
  80be0d:	48 83 ec 10          	sub    rsp,0x10
  80be11:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80be15:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80be19:	eb 20                	jmp    80be3b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80be1b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80be1f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80be23:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80be27:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be2a:	0f be d0             	movsx  edx,al
  80be2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80be31:	89 d6                	mov    esi,edx
  80be33:	48 89 c7             	mov    rdi,rax
  80be36:	e8 55 fe ff ff       	call   80bc90 <sprintchar>
    while(*str!='\0')
  80be3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80be3f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be42:	84 c0                	test   al,al
  80be44:	75 d5                	jne    80be1b <sprintn+0x16>
    }
  80be46:	90                   	nop
  80be47:	90                   	nop
  80be48:	c9                   	leave  
  80be49:	c3                   	ret    
  80be4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080be50 <create_zero>:
  80be50:	e8 29 7a ff ff       	call   80387e <req_proc>
  80be55:	83 f8 ff             	cmp    eax,0xffffffff
  80be58:	74 0c                	je     80be66 <create_zero.retu>
  80be5a:	e8 18 7b ff ff       	call   803977 <set_proc>
  80be5f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80be63:	83 c4 40             	add    esp,0x40

000000000080be66 <create_zero.retu>:
  80be66:	c3                   	ret    

000000000080be67 <fill_desc>:
  80be67:	55                   	push   rbp
  80be68:	48 89 e5             	mov    rbp,rsp
  80be6b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80be6f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80be73:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80be77:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80be7b:	be ba bf 80 00       	mov    esi,0x80bfba
  80be80:	c7 04 25 ba bf 80 00 	mov    DWORD PTR ds:0x80bfba,0x0
  80be87:	00 00 00 00 
  80be8b:	c7 04 25 be bf 80 00 	mov    DWORD PTR ds:0x80bfbe,0x0
  80be92:	00 00 00 00 
  80be96:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80be9a:	c1 e9 10             	shr    ecx,0x10
  80be9d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80bea2:	c1 ea 10             	shr    edx,0x10
  80bea5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80bea9:	66 c1 ea 08          	shr    dx,0x8
  80bead:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80beb1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80beb6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80beba:	c1 e1 08             	shl    ecx,0x8
  80bebd:	09 cf                	or     edi,ecx
  80bebf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80bec3:	8b 14 25 ba bf 80 00 	mov    edx,DWORD PTR ds:0x80bfba
  80beca:	67 89 10             	mov    DWORD PTR [eax],edx
  80becd:	8b 14 25 be bf 80 00 	mov    edx,DWORD PTR ds:0x80bfbe
  80bed4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80bed8:	c9                   	leave  
  80bed9:	c3                   	ret    

000000000080beda <switch_proc_asm>:
  80beda:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80bee0:	66 89 04 25 f8 be 80 	mov    WORD PTR ds:0x80bef8,ax
  80bee7:	00 
  80bee8:	c7 04 25 f4 be 80 00 	mov    DWORD PTR ds:0x80bef4,0x0
  80beef:	00 00 00 00 

000000000080bef3 <switch_proc_asm.ljmp>:
  80bef3:	ea                   	(bad)  
  80bef4:	00 00                	add    BYTE PTR [rax],al
  80bef6:	00 00                	add    BYTE PTR [rax],al
  80bef8:	00 00                	add    BYTE PTR [rax],al
  80befa:	c3                   	ret    

000000000080befb <switch_to_old>:
  80befb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80bf00:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80bf04:	bf 6c bf 80 00       	mov    edi,0x80bf6c
  80bf09:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80bf0d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80bf11:	89 c1                	mov    ecx,eax
  80bf13:	83 e9 04             	sub    ecx,0x4
  80bf16:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80bf19:	50                   	push   rax
  80bf1a:	89 f5                	mov    ebp,esi
  80bf1c:	83 c5 28             	add    ebp,0x28
  80bf1f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf23:	50                   	push   rax
  80bf24:	83 c5 04             	add    ebp,0x4
  80bf27:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf2b:	50                   	push   rax
  80bf2c:	83 c5 04             	add    ebp,0x4
  80bf2f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf33:	50                   	push   rax
  80bf34:	83 c5 04             	add    ebp,0x4
  80bf37:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf3b:	50                   	push   rax
  80bf3c:	83 c5 04             	add    ebp,0x4
  80bf3f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf43:	50                   	push   rax
  80bf44:	83 c5 04             	add    ebp,0x4
  80bf47:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf4b:	50                   	push   rax
  80bf4c:	83 c5 04             	add    ebp,0x4
  80bf4f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf53:	50                   	push   rax
  80bf54:	83 c5 04             	add    ebp,0x4
  80bf57:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf5b:	50                   	push   rax
  80bf5c:	83 c5 04             	add    ebp,0x4
  80bf5f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80bf63:	0f 22 d8             	mov    cr3,rax
  80bf66:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80bf6a:	50                   	push   rax
  80bf6b:	5c                   	pop    rsp

000000000080bf6c <switch_to_old.leap>:
  80bf6c:	ea                   	(bad)  
  80bf6d:	00 00                	add    BYTE PTR [rax],al
  80bf6f:	00 00                	add    BYTE PTR [rax],al
  80bf71:	08 00                	or     BYTE PTR [rax],al

000000000080bf73 <save_context>:
  80bf73:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80bf78:	83 c0 44             	add    eax,0x44
  80bf7b:	b9 08 00 00 00       	mov    ecx,0x8
  80bf80:	89 e7                	mov    edi,esp

000000000080bf82 <save_context.loops>:
  80bf82:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80bf85:	67 89 10             	mov    DWORD PTR [eax],edx
  80bf88:	83 c7 04             	add    edi,0x4
  80bf8b:	83 e8 04             	sub    eax,0x4
  80bf8e:	e2 f2                	loop   80bf82 <save_context.loops>
  80bf90:	5b                   	pop    rbx
  80bf91:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80bf96:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80bf9a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80bf9f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80bfa3:	c3                   	ret    

000000000080bfa4 <move_to_user_mode>:
  80bfa4:	66 b8 20 00          	mov    ax,0x20
  80bfa8:	8e d8                	mov    ds,eax
  80bfaa:	8e c0                	mov    es,eax
  80bfac:	8e e8                	mov    gs,eax
  80bfae:	6a 20                	push   0x20
  80bfb0:	54                   	push   rsp
  80bfb1:	6a 18                	push   0x18
  80bfb3:	68 b9 bf 80 00       	push   0x80bfb9
  80bfb8:	cf                   	iret   

000000000080bfb9 <move_to_user_mode.done>:
  80bfb9:	c3                   	ret    

000000000080bfba <desc>:
	...

000000000080bfc2 <ret_sys_call>:
  80bfc2:	58                   	pop    rax
  80bfc3:	8e d8                	mov    ds,eax
  80bfc5:	58                   	pop    rax
  80bfc6:	8e c0                	mov    es,eax
  80bfc8:	41 5f                	pop    r15
  80bfca:	41 5e                	pop    r14
  80bfcc:	41 5d                	pop    r13
  80bfce:	41 5c                	pop    r12
  80bfd0:	41 5b                	pop    r11
  80bfd2:	41 5a                	pop    r10
  80bfd4:	41 59                	pop    r9
  80bfd6:	41 58                	pop    r8
  80bfd8:	5e                   	pop    rsi
  80bfd9:	5f                   	pop    rdi
  80bfda:	5a                   	pop    rdx
  80bfdb:	59                   	pop    rcx
  80bfdc:	5b                   	pop    rbx
  80bfdd:	58                   	pop    rax

000000000080bfde <tmp>:
  80bfde:	48 0f 07             	sysretq 

000000000080bfe1 <ret_normal_proc>:
  80bfe1:	58                   	pop    rax
  80bfe2:	8e d8                	mov    ds,eax
  80bfe4:	58                   	pop    rax
  80bfe5:	8e c0                	mov    es,eax
  80bfe7:	41 5f                	pop    r15
  80bfe9:	41 5e                	pop    r14
  80bfeb:	41 5d                	pop    r13
  80bfed:	41 5c                	pop    r12
  80bfef:	41 5b                	pop    r11
  80bff1:	41 5a                	pop    r10
  80bff3:	41 59                	pop    r9
  80bff5:	41 58                	pop    r8
  80bff7:	5e                   	pop    rsi
  80bff8:	5f                   	pop    rdi
  80bff9:	5a                   	pop    rdx
  80bffa:	59                   	pop    rcx
  80bffb:	5b                   	pop    rbx
  80bffc:	58                   	pop    rax
  80bffd:	c3                   	ret    
