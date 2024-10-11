
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
  800217:	b8 a0 77 80 00       	mov    eax,0x8077a0
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 10 59 80 00       	mov    eax,0x805910
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 d0 86 80 00       	mov    eax,0x8086d0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 20 63 80 00       	mov    eax,0x806320
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
  800291:	e8 ea 53 00 00       	call   805680 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 db 53 00 00       	call   805680 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 cc 53 00 00       	call   805680 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 bd 53 00 00       	call   805680 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 ae 53 00 00       	call   805680 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 9f 53 00 00       	call   805680 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 90 53 00 00       	call   805680 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 81 53 00 00       	call   805680 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 b1 53 00 00       	call   8056ba <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 20 63 80 00       	mov    eax,0x806320
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
  800350:	48 8b 15 29 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc29]        # 80bf80 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 05 bc 00 00 	mov    rcx,QWORD PTR [rip+0xbc05]        # 80bf80 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 e5 bb 00 00 	mov    rdx,QWORD PTR [rip+0xbbe5]        # 80bf80 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 cd bb 00 00 	mov    rdx,QWORD PTR [rip+0xbbcd]        # 80bf80 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 b0 bb 00 00 	mov    rdx,QWORD PTR [rip+0xbbb0]        # 80bf80 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 96 bb 00 00 	mov    rdx,QWORD PTR [rip+0xbb96]        # 80bf80 <idt>
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
  80040d:	e8 9c 52 00 00       	call   8056ae <eoi>
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
  800427:	e8 82 52 00 00       	call   8056ae <eoi>
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
  800441:	e8 68 52 00 00       	call   8056ae <eoi>
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
  80045b:	e8 4e 52 00 00       	call   8056ae <eoi>
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
  800475:	e8 34 52 00 00       	call   8056ae <eoi>
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
  80048f:	e8 1a 52 00 00       	call   8056ae <eoi>
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
  8004a8:	e8 01 52 00 00       	call   8056ae <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 22 52 00 00       	call   8056d9 <report_back_trace_of_err>
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
  8004cd:	e8 dc 51 00 00       	call   8056ae <eoi>
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
  8004e7:	e8 c2 51 00 00       	call   8056ae <eoi>
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
  800500:	e8 a9 51 00 00       	call   8056ae <eoi>
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
  800519:	e8 90 51 00 00       	call   8056ae <eoi>
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
  800533:	e8 76 51 00 00       	call   8056ae <eoi>
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
  80054d:	e8 5c 51 00 00       	call   8056ae <eoi>
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
  800571:	e8 38 51 00 00       	call   8056ae <eoi>
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
  80058e:	e8 1b 51 00 00       	call   8056ae <eoi>
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
  8005d1:	48 05 c0 36 81 00    	add    rax,0x8136c0
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
  800682:	e8 69 3d 00 00       	call   8043f0 <reg_proc>
  800687:	e9 76 01 00 00       	jmp    800802 <syscall+0x268>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 25 3b 00 00       	call   8041bb <del_proc>
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
  8006b5:	e8 fc 66 00 00       	call   806db6 <sys_open>
  8006ba:	e9 43 01 00 00       	jmp    800802 <syscall+0x268>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 04 6a 00 00       	call   8070cd <sys_close>
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
  8006e4:	e8 9c 6a 00 00       	call   807185 <sys_read>
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
  800704:	e8 2c 6b 00 00       	call   807235 <sys_write>
  800709:	e9 f4 00 00 00       	jmp    800802 <syscall+0x268>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 c1 6b 00 00       	call   8072e5 <sys_lseek>
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
        case 19:return sys_execve(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 ea 51 00 00       	call   805964 <sys_execve>
  80077a:	e9 83 00 00 00       	jmp    800802 <syscall+0x268>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 3f 3c 00 00       	call   8043c8 <sys_exit>
  800789:	eb 77                	jmp    800802 <syscall+0x268>
        case SYSCALL_CALL:return exec_call(a);
  80078b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80078e:	48 98                	cdqe   
  800790:	48 89 c7             	mov    rdi,rax
  800793:	e8 ce 52 00 00       	call   805a66 <exec_call>
  800798:	eb 68                	jmp    800802 <syscall+0x268>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  80079a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80079d:	89 c7                	mov    edi,eax
  80079f:	e8 b3 13 00 00       	call   801b57 <sys_mkfifo>
  8007a4:	eb 5c                	jmp    800802 <syscall+0x268>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a9:	89 c7                	mov    edi,eax
  8007ab:	e8 45 3e 00 00       	call   8045f5 <sys_malloc>
  8007b0:	eb 50                	jmp    800802 <syscall+0x268>
        case SYSCALL_FREE:return sys_free(a);
  8007b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b5:	89 c7                	mov    edi,eax
  8007b7:	e8 e0 3f 00 00       	call   80479c <sys_free>
  8007bc:	eb 44                	jmp    800802 <syscall+0x268>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007be:	b8 00 00 00 00       	mov    eax,0x0
  8007c3:	e8 ec 70 00 00       	call   8078b4 <sys_getkbc>
  8007c8:	0f be c0             	movsx  eax,al
  8007cb:	eb 35                	jmp    800802 <syscall+0x268>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d0:	48 98                	cdqe   
  8007d2:	48 89 c7             	mov    rdi,rax
  8007d5:	e8 da 21 00 00       	call   8029b4 <sys_find_dev>
  8007da:	eb 26                	jmp    800802 <syscall+0x268>
        case SYSCALL_FORK:return sys_fork();
  8007dc:	e8 c1 42 00 00       	call   804aa2 <sys_fork>
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
  800887:	48 8b 04 c5 28 3a 81 	mov    rax,QWORD PTR [rax*8+0x813a28]
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
  80092b:	e8 b1 5b 00 00       	call   8064e1 <set_framebuffer>
  800930:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800934:	b8 00 00 00 00       	mov    eax,0x0
  800939:	e8 0e 5a 00 00       	call   80634c <init_framebuffer>
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
  800b02:	e8 04 59 00 00       	call   80640b <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b07:	bf e8 39 81 00       	mov    edi,0x8139e8
  800b0c:	e8 93 5d 00 00       	call   8068a4 <print>
    init_int();
  800b11:	b8 00 00 00 00       	mov    eax,0x0
  800b16:	e8 e5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b1b:	bf 05 3a 81 00       	mov    edi,0x813a05
  800b20:	e8 7f 5d 00 00       	call   8068a4 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b25:	b8 00 00 00 00       	mov    eax,0x0
  800b2a:	e8 c5 09 00 00       	call   8014f4 <init_memory>
    init_com(PORT_COM1);
  800b2f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b34:	e8 eb a8 00 00       	call   80b424 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b39:	be f8 03 00 00       	mov    esi,0x3f8
  800b3e:	bf 12 3a 81 00       	mov    edi,0x813a12
  800b43:	e8 28 aa 00 00       	call   80b570 <com_puts>
	init_paging();
  800b48:	b8 00 00 00 00       	mov    eax,0x0
  800b4d:	e8 aa 06 00 00       	call   8011fc <init_paging>
 	init_gdt();
  800b52:	b8 00 00 00 00       	mov    eax,0x0
  800b57:	e8 a1 4b 00 00       	call   8056fd <init_gdt>
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
  800b75:	e8 07 6c 00 00       	call   807781 <init_kb>
//    init_disk();

    sti();
  800b7a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b7b:	b8 00 00 00 00       	mov    eax,0x0
  800b80:	e8 05 9f 00 00       	call   80aa8a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b85:	c7 05 f9 b3 00 00 00 	mov    DWORD PTR [rip+0xb3f9],0x0        # 80bf88 <manage_proc_lock>
  800b8c:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c=sys_getkbc();
  800b8f:	b8 00 00 00 00       	mov    eax,0x0
  800b94:	e8 1b 6d 00 00       	call   8078b4 <sys_getkbc>
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
  800d11:	e8 8e 5b 00 00       	call   8068a4 <print>
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
  800e5b:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813a70
  800e62:	70 3a 81 00 
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
  800efc:	48 8b 15 9d b0 00 00 	mov    rdx,QWORD PTR [rip+0xb09d]        # 80bfa0 <pml4>
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
  800f76:	e8 e5 a6 00 00       	call   80b660 <memset>
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
  800ff4:	e8 67 a6 00 00       	call   80b660 <memset>
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
  8010f0:	e8 6b a5 00 00       	call   80b660 <memset>
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
  80116e:	e8 ed a4 00 00       	call   80b660 <memset>
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
  801215:	89 05 9d ad 00 00    	mov    DWORD PTR [rip+0xad9d],eax        # 80bfb8 <high_mem_base>
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
  8013af:	bf 78 3a 81 00       	mov    edi,0x813a78
  8013b4:	e8 eb 54 00 00       	call   8068a4 <print>
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
  801439:	bf 82 3a 81 00       	mov    edi,0x813a82
  80143e:	e8 61 54 00 00       	call   8068a4 <print>
  801443:	eb 0a                	jmp    80144f <page_err+0xb0>
    p=err_code&4;
  801445:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801449:	83 e0 04             	and    eax,0x4
  80144c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80144f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801453:	75 0c                	jne    801461 <page_err+0xc2>
  801455:	bf 90 3a 81 00       	mov    edi,0x813a90
  80145a:	e8 45 54 00 00       	call   8068a4 <print>
  80145f:	eb 0a                	jmp    80146b <page_err+0xcc>
    p=err_code&16;
  801461:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801465:	83 e0 10             	and    eax,0x10
  801468:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80146b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80146f:	74 0a                	je     80147b <page_err+0xdc>
  801471:	bf a8 3a 81 00       	mov    edi,0x813aa8
  801476:	e8 29 54 00 00       	call   8068a4 <print>
    unsigned int addr=0;
  80147b:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801482:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801485:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801488:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80148c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80148f:	89 c6                	mov    esi,eax
  801491:	bf c8 3a 81 00       	mov    edi,0x813ac8
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
  8014c7:	bf ea 3a 81 00       	mov    edi,0x813aea
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
  8014dd:	e8 cc 41 00 00       	call   8056ae <eoi>
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
  801dbe:	e8 ec 98 00 00       	call   80b6af <strcpy>
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
  801ff0:	e8 bc 95 00 00       	call   80b5b1 <memcpy>
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
  80208f:	e8 1d 95 00 00       	call   80b5b1 <memcpy>
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
  80237c:	e8 ae 57 00 00       	call   807b2f <request>
  802381:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802384:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802387:	89 c7                	mov    edi,eax
  802389:	e8 55 5e 00 00       	call   8081e3 <chk_result>

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
  802459:	e8 53 91 00 00       	call   80b5b1 <memcpy>
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
  8024d6:	e8 d6 90 00 00       	call   80b5b1 <memcpy>
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
  802a27:	e8 23 8e 00 00       	call   80b84f <strcmp>
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
  802ac0:	e8 8a 8d 00 00       	call   80b84f <strcmp>
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
  802af3:	48 8b 04 c5 08 3b 81 	mov    rax,QWORD PTR [rax*8+0x813b08]
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
  802dd1:	48 8b 04 c5 68 3b 81 	mov    rax,QWORD PTR [rax*8+0x813b68]
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
  8033a9:	48 8b 14 c5 c0 bf 80 	mov    rdx,QWORD PTR [rax*8+0x80bfc0]
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
  803562:	e8 73 14 00 00       	call   8049da <set_tss>
  803567:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  80356b:	48 8b 05 6e 8a 00 00 	mov    rax,QWORD PTR [rip+0x8a6e]        # 80bfe0 <tss>
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
  8035fc:	ba 32 bf 80 00       	mov    edx,0x80bf32
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
  803704:	ba e3 3a 80 00       	mov    edx,0x803ae3
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
  803795:	ba e3 3a 80 00       	mov    edx,0x803ae3
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
  80382c:	b9 e3 3a 80 00       	mov    ecx,0x803ae3
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


}
  803ae0:	90                   	nop
  803ae1:	5d                   	pop    rbp
  803ae2:	c3                   	ret    

0000000000803ae3 <proc_zero>:
void proc_zero()
{
  803ae3:	f3 0f 1e fa          	endbr64 
  803ae7:	55                   	push   rbp
  803ae8:	48 89 e5             	mov    rbp,rsp
    asm volatile("mov $27,%rax\n"
  803aeb:	48 c7 c0 1b 00 00 00 	mov    rax,0x1b
  803af2:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    while(1);
  803af5:	eb fe                	jmp    803af5 <proc_zero+0x12>

0000000000803af7 <save_rsp>:
}
void save_rsp(){
  803af7:	f3 0f 1e fa          	endbr64 
  803afb:	55                   	push   rbp
  803afc:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803aff:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803b06:	00 
    current->regs.rsp=*p;
  803b07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b0b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803b0e:	48 8b 05 8b 09 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1098b]        # 4144a0 <current>
  803b15:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
}
  803b1c:	90                   	nop
  803b1d:	5d                   	pop    rbp
  803b1e:	c3                   	ret    

0000000000803b1f <manage_proc>:
void manage_proc(){
  803b1f:	f3 0f 1e fa          	endbr64 
  803b23:	55                   	push   rbp
  803b24:	48 89 e5             	mov    rbp,rsp
  803b27:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803b2b:	8b 05 fb 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109fb]        # 41452c <cur_proc>
  803b31:	83 f8 ff             	cmp    eax,0xffffffff
  803b34:	74 39                	je     803b6f <manage_proc+0x50>
        task[cur_proc].utime++;
  803b36:	8b 15 f0 09 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc109f0]        # 41452c <cur_proc>
  803b3c:	48 63 ca             	movsxd rcx,edx
  803b3f:	48 89 c8             	mov    rax,rcx
  803b42:	48 01 c0             	add    rax,rax
  803b45:	48 01 c8             	add    rax,rcx
  803b48:	48 c1 e0 08          	shl    rax,0x8
  803b4c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803b52:	8b 00                	mov    eax,DWORD PTR [rax]
  803b54:	8d 48 01             	lea    ecx,[rax+0x1]
  803b57:	48 63 d2             	movsxd rdx,edx
  803b5a:	48 89 d0             	mov    rax,rdx
  803b5d:	48 01 c0             	add    rax,rax
  803b60:	48 01 d0             	add    rax,rdx
  803b63:	48 c1 e0 08          	shl    rax,0x8
  803b67:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803b6d:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803b6f:	8b 05 b7 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109b7]        # 41452c <cur_proc>
  803b75:	83 f8 ff             	cmp    eax,0xffffffff
  803b78:	74 4a                	je     803bc4 <manage_proc+0xa5>
  803b7a:	8b 05 ac 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109ac]        # 41452c <cur_proc>
  803b80:	48 63 d0             	movsxd rdx,eax
  803b83:	48 89 d0             	mov    rax,rdx
  803b86:	48 01 c0             	add    rax,rax
  803b89:	48 01 d0             	add    rax,rdx
  803b8c:	48 c1 e0 08          	shl    rax,0x8
  803b90:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803b96:	8b 00                	mov    eax,DWORD PTR [rax]
  803b98:	83 f8 01             	cmp    eax,0x1
  803b9b:	77 27                	ja     803bc4 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803b9d:	8b 05 89 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10989]        # 41452c <cur_proc>
  803ba3:	48 63 d0             	movsxd rdx,eax
  803ba6:	48 89 d0             	mov    rax,rdx
  803ba9:	48 01 c0             	add    rax,rax
  803bac:	48 01 d0             	add    rax,rdx
  803baf:	48 c1 e0 08          	shl    rax,0x8
  803bb3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803bb9:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803bbb:	83 f8 01             	cmp    eax,0x1
  803bbe:	0f 84 21 01 00 00    	je     803ce5 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803bc4:	8b 05 62 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10962]        # 41452c <cur_proc>
  803bca:	83 f8 ff             	cmp    eax,0xffffffff
  803bcd:	74 22                	je     803bf1 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803bcf:	8b 05 57 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10957]        # 41452c <cur_proc>
  803bd5:	48 63 d0             	movsxd rdx,eax
  803bd8:	48 89 d0             	mov    rax,rdx
  803bdb:	48 01 c0             	add    rax,rax
  803bde:	48 01 d0             	add    rax,rdx
  803be1:	48 c1 e0 08          	shl    rax,0x8
  803be5:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803beb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803bf1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803bf8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803bff:	eb 4f                	jmp    803c50 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803c01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c04:	48 63 d0             	movsxd rdx,eax
  803c07:	48 89 d0             	mov    rax,rdx
  803c0a:	48 01 c0             	add    rax,rax
  803c0d:	48 01 d0             	add    rax,rdx
  803c10:	48 c1 e0 08          	shl    rax,0x8
  803c14:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c1a:	8b 00                	mov    eax,DWORD PTR [rax]
  803c1c:	83 f8 ff             	cmp    eax,0xffffffff
  803c1f:	74 2b                	je     803c4c <manage_proc+0x12d>
  803c21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c24:	48 63 d0             	movsxd rdx,eax
  803c27:	48 89 d0             	mov    rax,rdx
  803c2a:	48 01 c0             	add    rax,rax
  803c2d:	48 01 d0             	add    rax,rdx
  803c30:	48 c1 e0 08          	shl    rax,0x8
  803c34:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c3a:	8b 00                	mov    eax,DWORD PTR [rax]
  803c3c:	83 f8 01             	cmp    eax,0x1
  803c3f:	75 0b                	jne    803c4c <manage_proc+0x12d>
  803c41:	8b 05 e5 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108e5]        # 41452c <cur_proc>
  803c47:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803c4a:	75 0c                	jne    803c58 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803c4c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803c50:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803c54:	7e ab                	jle    803c01 <manage_proc+0xe2>
  803c56:	eb 01                	jmp    803c59 <manage_proc+0x13a>
                break;
  803c58:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803c59:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803c5d:	0f 8f 85 00 00 00    	jg     803ce8 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  803c63:	8b 05 c3 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108c3]        # 41452c <cur_proc>
  803c69:	48 63 d0             	movsxd rdx,eax
  803c6c:	48 89 d0             	mov    rax,rdx
  803c6f:	48 01 c0             	add    rax,rax
  803c72:	48 01 d0             	add    rax,rdx
  803c75:	48 c1 e0 08          	shl    rax,0x8
  803c79:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c7f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803c85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c88:	48 63 d0             	movsxd rdx,eax
  803c8b:	48 89 d0             	mov    rax,rdx
  803c8e:	48 01 c0             	add    rax,rax
  803c91:	48 01 d0             	add    rax,rdx
  803c94:	48 c1 e0 08          	shl    rax,0x8
  803c98:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c9e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803ca4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ca7:	48 63 d0             	movsxd rdx,eax
  803caa:	48 89 d0             	mov    rax,rdx
  803cad:	48 01 c0             	add    rax,rax
  803cb0:	48 01 d0             	add    rax,rdx
  803cb3:	48 c1 e0 08          	shl    rax,0x8
  803cb7:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803cbe:	8b 05 68 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10868]        # 41452c <cur_proc>
  803cc4:	48 63 c8             	movsxd rcx,eax
  803cc7:	48 89 c8             	mov    rax,rcx
  803cca:	48 01 c0             	add    rax,rax
  803ccd:	48 01 c8             	add    rax,rcx
  803cd0:	48 c1 e0 08          	shl    rax,0x8
  803cd4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cda:	48 89 d6             	mov    rsi,rdx
  803cdd:	48 89 c7             	mov    rdi,rax
  803ce0:	e8 6e 0b 00 00       	call   804853 <switch_to>
    }
    return;
  803ce5:	90                   	nop
  803ce6:	eb 01                	jmp    803ce9 <manage_proc+0x1ca>
            return;
  803ce8:	90                   	nop
}
  803ce9:	c9                   	leave  
  803cea:	c3                   	ret    

0000000000803ceb <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803ceb:	f3 0f 1e fa          	endbr64 
  803cef:	55                   	push   rbp
  803cf0:	48 89 e5             	mov    rbp,rsp
  803cf3:	48 83 ec 20          	sub    rsp,0x20
  803cf7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803cfa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803cfd:	01 c0                	add    eax,eax
  803cff:	83 c0 05             	add    eax,0x5
  803d02:	c1 e0 03             	shl    eax,0x3
  803d05:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803d08:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d0b:	89 05 1b 08 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1081b],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803d11:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d14:	89 c7                	mov    edi,eax
  803d16:	e8 2f 81 00 00       	call   80be4a <switch_proc_asm>
}
  803d1b:	90                   	nop
  803d1c:	c9                   	leave  
  803d1d:	c3                   	ret    

0000000000803d1e <switch_proc>:
void switch_proc(int pnr){
  803d1e:	f3 0f 1e fa          	endbr64 
  803d22:	55                   	push   rbp
  803d23:	48 89 e5             	mov    rbp,rsp
  803d26:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803d2d:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803d33:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803d39:	48 63 d0             	movsxd rdx,eax
  803d3c:	48 89 d0             	mov    rax,rdx
  803d3f:	48 01 c0             	add    rax,rax
  803d42:	48 01 d0             	add    rax,rdx
  803d45:	48 c1 e0 08          	shl    rax,0x8
  803d49:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d50:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803d57:	48 89 d6             	mov    rsi,rdx
  803d5a:	ba 60 00 00 00       	mov    edx,0x60
  803d5f:	48 89 c7             	mov    rdi,rax
  803d62:	48 89 d1             	mov    rcx,rdx
  803d65:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803d68:	8b 05 be 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107be]        # 41452c <cur_proc>
  803d6e:	48 63 d0             	movsxd rdx,eax
  803d71:	48 89 d0             	mov    rax,rdx
  803d74:	48 01 c0             	add    rax,rax
  803d77:	48 01 d0             	add    rax,rdx
  803d7a:	48 c1 e0 08          	shl    rax,0x8
  803d7e:	48 05 c0 01 00 00    	add    rax,0x1c0
  803d84:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d8a:	48 83 c0 04          	add    rax,0x4
  803d8e:	48 89 c7             	mov    rdi,rax
  803d91:	e8 53 00 00 00       	call   803de9 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803d96:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803d9c:	89 05 8a 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1078a],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803da2:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803da8:	01 c0                	add    eax,eax
  803daa:	83 c0 05             	add    eax,0x5
  803dad:	c1 e0 03             	shl    eax,0x3
  803db0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803db3:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803db9:	48 63 d0             	movsxd rdx,eax
  803dbc:	48 89 d0             	mov    rax,rdx
  803dbf:	48 01 c0             	add    rax,rax
  803dc2:	48 01 d0             	add    rax,rdx
  803dc5:	48 c1 e0 08          	shl    rax,0x8
  803dc9:	48 05 c0 01 00 00    	add    rax,0x1c0
  803dcf:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803dd5:	48 83 c0 04          	add    rax,0x4
  803dd9:	48 89 c6             	mov    rsi,rax
  803ddc:	bf 00 00 00 00       	mov    edi,0x0
  803de1:	e8 6d 0a 00 00       	call   804853 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803de6:	90                   	nop
  803de7:	c9                   	leave  
  803de8:	c3                   	ret    

0000000000803de9 <save_context>:
void save_context(TSS *tss)
{
  803de9:	f3 0f 1e fa          	endbr64 
  803ded:	55                   	push   rbp
  803dee:	48 89 e5             	mov    rbp,rsp
  803df1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803df5:	90                   	nop
  803df6:	5d                   	pop    rbp
  803df7:	c3                   	ret    

0000000000803df8 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803df8:	f3 0f 1e fa          	endbr64 
  803dfc:	55                   	push   rbp
  803dfd:	48 89 e5             	mov    rbp,rsp
  803e00:	48 83 ec 60          	sub    rsp,0x60
  803e04:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803e07:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803e0a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e0d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803e13:	85 c0                	test   eax,eax
  803e15:	0f 48 c2             	cmovs  eax,edx
  803e18:	c1 f8 0c             	sar    eax,0xc
  803e1b:	89 c1                	mov    ecx,eax
  803e1d:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e20:	99                   	cdq    
  803e21:	c1 ea 14             	shr    edx,0x14
  803e24:	01 d0                	add    eax,edx
  803e26:	25 ff 0f 00 00       	and    eax,0xfff
  803e2b:	29 d0                	sub    eax,edx
  803e2d:	01 c8                	add    eax,ecx
  803e2f:	85 c0                	test   eax,eax
  803e31:	0f 95 c0             	setne  al
  803e34:	0f b6 c0             	movzx  eax,al
  803e37:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803e3a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803e41:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803e48:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803e49:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803e50:	00 
    pgind++;
  803e51:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e56:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803e5d:	e9 76 02 00 00       	jmp    8040d8 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803e62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e69:	25 00 f0 ff ff       	and    eax,0xfffff000
  803e6e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803e72:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803e79:	e9 44 02 00 00       	jmp    8040c2 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803e7e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803e82:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e85:	83 e0 01             	and    eax,0x1
  803e88:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803e8b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803e8f:	0f 85 24 02 00 00    	jne    8040b9 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803e95:	b8 00 00 00 00       	mov    eax,0x0
  803e9a:	e8 be d7 ff ff       	call   80165d <req_a_page>
  803e9f:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803ea2:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803ea6:	0f 85 dc 00 00 00    	jne    803f88 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803eac:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803eaf:	48 63 d0             	movsxd rdx,eax
  803eb2:	48 89 d0             	mov    rax,rdx
  803eb5:	48 01 c0             	add    rax,rax
  803eb8:	48 01 d0             	add    rax,rdx
  803ebb:	48 c1 e0 08          	shl    rax,0x8
  803ebf:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803ec5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803ec8:	0f b7 c0             	movzx  eax,ax
  803ecb:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803ece:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ed1:	48 63 d0             	movsxd rdx,eax
  803ed4:	48 89 d0             	mov    rax,rdx
  803ed7:	48 01 c0             	add    rax,rax
  803eda:	48 01 d0             	add    rax,rdx
  803edd:	48 c1 e0 08          	shl    rax,0x8
  803ee1:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803ee7:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803eeb:	0f b7 c0             	movzx  eax,ax
  803eee:	c1 e0 10             	shl    eax,0x10
  803ef1:	25 00 00 0f 00       	and    eax,0xf0000
  803ef6:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803ef9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803efc:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803eff:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f02:	89 c1                	mov    ecx,eax
  803f04:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f07:	48 63 d0             	movsxd rdx,eax
  803f0a:	48 89 d0             	mov    rax,rdx
  803f0d:	48 01 c0             	add    rax,rax
  803f10:	48 01 d0             	add    rax,rdx
  803f13:	48 c1 e0 08          	shl    rax,0x8
  803f17:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f1d:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803f20:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f23:	48 63 d0             	movsxd rdx,eax
  803f26:	48 89 d0             	mov    rax,rdx
  803f29:	48 01 c0             	add    rax,rax
  803f2c:	48 01 d0             	add    rax,rdx
  803f2f:	48 c1 e0 08          	shl    rax,0x8
  803f33:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f39:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f3d:	0f b7 c0             	movzx  eax,ax
  803f40:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803f43:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803f4a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f4d:	c1 e8 10             	shr    eax,0x10
  803f50:	83 e0 0f             	and    eax,0xf
  803f53:	89 c2                	mov    edx,eax
  803f55:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803f58:	01 d0                	add    eax,edx
  803f5a:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803f5d:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803f60:	89 c1                	mov    ecx,eax
  803f62:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f65:	48 63 d0             	movsxd rdx,eax
  803f68:	48 89 d0             	mov    rax,rdx
  803f6b:	48 01 c0             	add    rax,rax
  803f6e:	48 01 d0             	add    rax,rdx
  803f71:	48 c1 e0 08          	shl    rax,0x8
  803f75:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f7b:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803f7f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803f83:	e9 62 01 00 00       	jmp    8040ea <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  803f88:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803f8b:	89 c7                	mov    edi,eax
  803f8d:	e8 79 d8 ff ff       	call   80180b <get_phyaddr>
  803f92:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803f95:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803f98:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803f9c:	ba 07 00 00 00       	mov    edx,0x7
  803fa1:	89 ce                	mov    esi,ecx
  803fa3:	48 89 c7             	mov    rdi,rax
  803fa6:	e8 73 d8 ff ff       	call   80181e <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803fab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803fae:	c1 e0 0a             	shl    eax,0xa
  803fb1:	89 c2                	mov    edx,eax
  803fb3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803fb6:	01 d0                	add    eax,edx
  803fb8:	c1 e0 0c             	shl    eax,0xc
  803fbb:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  803fbe:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  803fc3:	75 09                	jne    803fce <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  803fc5:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  803fc8:	89 05 66 05 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10566],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  803fce:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  803fd2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  803fd6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  803fda:	0f 85 d9 00 00 00    	jne    8040b9 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803fe0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fe3:	48 63 d0             	movsxd rdx,eax
  803fe6:	48 89 d0             	mov    rax,rdx
  803fe9:	48 01 c0             	add    rax,rax
  803fec:	48 01 d0             	add    rax,rdx
  803fef:	48 c1 e0 08          	shl    rax,0x8
  803ff3:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803ff9:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803ffc:	0f b7 c0             	movzx  eax,ax
  803fff:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804002:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804005:	48 63 d0             	movsxd rdx,eax
  804008:	48 89 d0             	mov    rax,rdx
  80400b:	48 01 c0             	add    rax,rax
  80400e:	48 01 d0             	add    rax,rdx
  804011:	48 c1 e0 08          	shl    rax,0x8
  804015:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80401b:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80401f:	0f b7 c0             	movzx  eax,ax
  804022:	c1 e0 10             	shl    eax,0x10
  804025:	25 00 00 0f 00       	and    eax,0xf0000
  80402a:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  80402d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804030:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804033:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804036:	89 c1                	mov    ecx,eax
  804038:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80403b:	48 63 d0             	movsxd rdx,eax
  80403e:	48 89 d0             	mov    rax,rdx
  804041:	48 01 c0             	add    rax,rax
  804044:	48 01 d0             	add    rax,rdx
  804047:	48 c1 e0 08          	shl    rax,0x8
  80404b:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804051:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804054:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804057:	48 63 d0             	movsxd rdx,eax
  80405a:	48 89 d0             	mov    rax,rdx
  80405d:	48 01 c0             	add    rax,rax
  804060:	48 01 d0             	add    rax,rdx
  804063:	48 c1 e0 08          	shl    rax,0x8
  804067:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80406d:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804071:	0f b7 c0             	movzx  eax,ax
  804074:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804077:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80407e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804081:	c1 e8 10             	shr    eax,0x10
  804084:	83 e0 0f             	and    eax,0xf
  804087:	89 c2                	mov    edx,eax
  804089:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80408c:	01 d0                	add    eax,edx
  80408e:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804091:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804094:	89 c1                	mov    ecx,eax
  804096:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804099:	48 63 d0             	movsxd rdx,eax
  80409c:	48 89 d0             	mov    rax,rdx
  80409f:	48 01 c0             	add    rax,rax
  8040a2:	48 01 d0             	add    rax,rdx
  8040a5:	48 c1 e0 08          	shl    rax,0x8
  8040a9:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040af:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8040b3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8040b7:	eb 31                	jmp    8040ea <palloc+0x2f2>
                }
            }
            tblp++;
  8040b9:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8040be:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8040c2:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8040c9:	0f 8e af fd ff ff    	jle    803e7e <palloc+0x86>
        }
        pgind++;
  8040cf:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8040d4:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8040d8:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8040df:	0f 8e 7d fd ff ff    	jle    803e62 <palloc+0x6a>
    }
    return NULL;
  8040e5:	b8 00 00 00 00       	mov    eax,0x0
}
  8040ea:	c9                   	leave  
  8040eb:	c3                   	ret    

00000000008040ec <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8040ec:	f3 0f 1e fa          	endbr64 
  8040f0:	55                   	push   rbp
  8040f1:	48 89 e5             	mov    rbp,rsp
  8040f4:	48 83 ec 10          	sub    rsp,0x10
  8040f8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8040fb:	8b 05 2b 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1042b]        # 41452c <cur_proc>
  804101:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804104:	89 d6                	mov    esi,edx
  804106:	89 c7                	mov    edi,eax
  804108:	e8 eb fc ff ff       	call   803df8 <palloc>
}
  80410d:	c9                   	leave  
  80410e:	c3                   	ret    

000000000080410f <proc_end>:
void proc_end()
{
  80410f:	f3 0f 1e fa          	endbr64 
  804113:	55                   	push   rbp
  804114:	48 89 e5             	mov    rbp,rsp
  804117:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  80411b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  80411e:	8b 05 08 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10408]        # 41452c <cur_proc>
  804124:	89 c7                	mov    edi,eax
  804126:	e8 90 00 00 00       	call   8041bb <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  80412b:	8b 05 fb 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103fb]        # 41452c <cur_proc>
  804131:	48 63 d0             	movsxd rdx,eax
  804134:	48 89 d0             	mov    rax,rdx
  804137:	48 01 c0             	add    rax,rax
  80413a:	48 01 d0             	add    rax,rdx
  80413d:	48 c1 e0 08          	shl    rax,0x8
  804141:	48 05 28 85 40 00    	add    rax,0x408528
  804147:	8b 00                	mov    eax,DWORD PTR [rax]
  804149:	83 f8 ff             	cmp    eax,0xffffffff
  80414c:	74 60                	je     8041ae <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  80414e:	8b 05 d8 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103d8]        # 41452c <cur_proc>
  804154:	48 63 d0             	movsxd rdx,eax
  804157:	48 89 d0             	mov    rax,rdx
  80415a:	48 01 c0             	add    rax,rax
  80415d:	48 01 d0             	add    rax,rdx
  804160:	48 c1 e0 08          	shl    rax,0x8
  804164:	48 05 28 85 40 00    	add    rax,0x408528
  80416a:	8b 00                	mov    eax,DWORD PTR [rax]
  80416c:	89 c2                	mov    edx,eax
  80416e:	48 89 d0             	mov    rax,rdx
  804171:	48 01 c0             	add    rax,rax
  804174:	48 01 d0             	add    rax,rdx
  804177:	48 c1 e0 08          	shl    rax,0x8
  80417b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804181:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804187:	8b 05 9f 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1039f]        # 41452c <cur_proc>
  80418d:	48 63 d0             	movsxd rdx,eax
  804190:	48 89 d0             	mov    rax,rdx
  804193:	48 01 c0             	add    rax,rax
  804196:	48 01 d0             	add    rax,rdx
  804199:	48 c1 e0 08          	shl    rax,0x8
  80419d:	48 05 28 85 40 00    	add    rax,0x408528
  8041a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8041a5:	89 c7                	mov    edi,eax
  8041a7:	e8 3f fb ff ff       	call   803ceb <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8041ac:	eb 0a                	jmp    8041b8 <proc_end+0xa9>
        switch_proc_tss(0);
  8041ae:	bf 00 00 00 00       	mov    edi,0x0
  8041b3:	e8 33 fb ff ff       	call   803ceb <switch_proc_tss>
}
  8041b8:	90                   	nop
  8041b9:	c9                   	leave  
  8041ba:	c3                   	ret    

00000000008041bb <del_proc>:
void del_proc(int pnr)
{
  8041bb:	f3 0f 1e fa          	endbr64 
  8041bf:	55                   	push   rbp
  8041c0:	48 89 e5             	mov    rbp,rsp
  8041c3:	48 83 ec 30          	sub    rsp,0x30
  8041c7:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8041ca:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8041cd:	48 63 d0             	movsxd rdx,eax
  8041d0:	48 89 d0             	mov    rax,rdx
  8041d3:	48 01 c0             	add    rax,rax
  8041d6:	48 01 d0             	add    rax,rdx
  8041d9:	48 c1 e0 08          	shl    rax,0x8
  8041dd:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8041e3:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8041e9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8041ec:	48 63 d0             	movsxd rdx,eax
  8041ef:	48 89 d0             	mov    rax,rdx
  8041f2:	48 01 c0             	add    rax,rax
  8041f5:	48 01 d0             	add    rax,rdx
  8041f8:	48 c1 e0 08          	shl    rax,0x8
  8041fc:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804202:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804208:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80420d:	eb 63                	jmp    804272 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  80420f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804213:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804216:	25 00 f0 ff ff       	and    eax,0xfffff000
  80421b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80421f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804226:	eb 30                	jmp    804258 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804228:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80422c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80422f:	83 e0 01             	and    eax,0x1
  804232:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804235:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804239:	74 14                	je     80424f <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  80423b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80423f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804242:	25 00 f0 ff ff       	and    eax,0xfffff000
  804247:	48 89 c7             	mov    rdi,rax
  80424a:	e8 de d4 ff ff       	call   80172d <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80424f:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804254:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804258:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80425f:	7e c7                	jle    804228 <del_proc+0x6d>
        }
        vmfree(tp);
  804261:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804265:	48 89 c7             	mov    rdi,rax
  804268:	e8 cc d0 ff ff       	call   801339 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80426d:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804272:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804276:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804279:	83 e0 01             	and    eax,0x1
  80427c:	48 85 c0             	test   rax,rax
  80427f:	75 8e                	jne    80420f <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804281:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804285:	48 89 c7             	mov    rdi,rax
  804288:	e8 ac d0 ff ff       	call   801339 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80428d:	90                   	nop
  80428e:	c9                   	leave  
  80428f:	c3                   	ret    

0000000000804290 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804290:	f3 0f 1e fa          	endbr64 
  804294:	55                   	push   rbp
  804295:	48 89 e5             	mov    rbp,rsp
  804298:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80429b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  80429e:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8042a2:	75 0a                	jne    8042ae <set_proc_stat+0x1e>
  8042a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042a9:	e9 8c 00 00 00       	jmp    80433a <set_proc_stat+0xaa>
    int i=0;
  8042ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8042b5:	eb 04                	jmp    8042bb <set_proc_stat+0x2b>
  8042b7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8042bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042be:	48 63 d0             	movsxd rdx,eax
  8042c1:	48 89 d0             	mov    rax,rdx
  8042c4:	48 01 c0             	add    rax,rax
  8042c7:	48 01 d0             	add    rax,rdx
  8042ca:	48 c1 e0 08          	shl    rax,0x8
  8042ce:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8042d4:	8b 10                	mov    edx,DWORD PTR [rax]
  8042d6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8042d9:	39 c2                	cmp    edx,eax
  8042db:	75 da                	jne    8042b7 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  8042dd:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8042e1:	75 07                	jne    8042ea <set_proc_stat+0x5a>
  8042e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042e8:	eb 50                	jmp    80433a <set_proc_stat+0xaa>
    task[i].stat=stat;
  8042ea:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8042ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042f0:	48 63 c8             	movsxd rcx,eax
  8042f3:	48 89 c8             	mov    rax,rcx
  8042f6:	48 01 c0             	add    rax,rax
  8042f9:	48 01 c8             	add    rax,rcx
  8042fc:	48 c1 e0 08          	shl    rax,0x8
  804300:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804306:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804308:	8b 05 1e 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1021e]        # 41452c <cur_proc>
  80430e:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804311:	75 22                	jne    804335 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  804313:	8b 05 13 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10213]        # 41452c <cur_proc>
  804319:	48 63 d0             	movsxd rdx,eax
  80431c:	48 89 d0             	mov    rax,rdx
  80431f:	48 01 c0             	add    rax,rax
  804322:	48 01 d0             	add    rax,rdx
  804325:	48 c1 e0 08          	shl    rax,0x8
  804329:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80432f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804335:	b8 00 00 00 00       	mov    eax,0x0
}
  80433a:	5d                   	pop    rbp
  80433b:	c3                   	ret    

000000000080433c <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  80433c:	f3 0f 1e fa          	endbr64 
  804340:	55                   	push   rbp
  804341:	48 89 e5             	mov    rbp,rsp
  804344:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804348:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80434f:	eb 6a                	jmp    8043bb <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  804351:	8b 05 d5 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101d5]        # 41452c <cur_proc>
  804357:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80435a:	48 63 ca             	movsxd rcx,edx
  80435d:	48 63 d0             	movsxd rdx,eax
  804360:	48 89 d0             	mov    rax,rdx
  804363:	48 01 c0             	add    rax,rax
  804366:	48 01 d0             	add    rax,rdx
  804369:	48 c1 e0 05          	shl    rax,0x5
  80436d:	48 01 c8             	add    rax,rcx
  804370:	48 83 c0 18          	add    rax,0x18
  804374:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  80437b:	00 
  80437c:	48 85 c0             	test   rax,rax
  80437f:	75 36                	jne    8043b7 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804381:	8b 05 a5 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101a5]        # 41452c <cur_proc>
  804387:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80438a:	48 63 ca             	movsxd rcx,edx
  80438d:	48 63 d0             	movsxd rdx,eax
  804390:	48 89 d0             	mov    rax,rdx
  804393:	48 01 c0             	add    rax,rax
  804396:	48 01 d0             	add    rax,rdx
  804399:	48 c1 e0 05          	shl    rax,0x5
  80439d:	48 01 c8             	add    rax,rcx
  8043a0:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8043a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8043a8:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8043af:	00 
            return 0;
  8043b0:	b8 00 00 00 00       	mov    eax,0x0
  8043b5:	eb 0f                	jmp    8043c6 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8043b7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8043bb:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8043bf:	7e 90                	jle    804351 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8043c1:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8043c6:	5d                   	pop    rbp
  8043c7:	c3                   	ret    

00000000008043c8 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8043c8:	f3 0f 1e fa          	endbr64 
  8043cc:	55                   	push   rbp
  8043cd:	48 89 e5             	mov    rbp,rsp
  8043d0:	48 83 ec 10          	sub    rsp,0x10
  8043d4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8043d7:	8b 05 4f 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1014f]        # 41452c <cur_proc>
  8043dd:	89 c7                	mov    edi,eax
  8043df:	e8 d7 fd ff ff       	call   8041bb <del_proc>
    while(1)
        manage_proc();
  8043e4:	b8 00 00 00 00       	mov    eax,0x0
  8043e9:	e8 31 f7 ff ff       	call   803b1f <manage_proc>
  8043ee:	eb f4                	jmp    8043e4 <sys_exit+0x1c>

00000000008043f0 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  8043f0:	f3 0f 1e fa          	endbr64 
  8043f4:	55                   	push   rbp
  8043f5:	48 89 e5             	mov    rbp,rsp
  8043f8:	53                   	push   rbx
  8043f9:	48 83 ec 48          	sub    rsp,0x48
  8043fd:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804401:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804405:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804409:	b8 00 00 00 00       	mov    eax,0x0
  80440e:	e8 6b f4 ff ff       	call   80387e <req_proc>
  804413:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804416:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80441a:	75 0a                	jne    804426 <reg_proc+0x36>
  80441c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804421:	e9 c9 01 00 00       	jmp    8045ef <reg_proc+0x1ff>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804426:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80442a:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80442d:	52                   	push   rdx
  80442e:	6a 00                	push   0x0
  804430:	50                   	push   rax
  804431:	6a 00                	push   0x0
  804433:	6a 00                	push   0x0
  804435:	6a 00                	push   0x0
  804437:	68 00 f0 ff ff       	push   0xfffffffffffff000
  80443c:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804443:	00 
  804444:	6a 28                	push   0x28
  804446:	6a 28                	push   0x28
  804448:	6a 28                	push   0x28
  80444a:	6a 28                	push   0x28
  80444c:	41 b9 30 00 00 00    	mov    r9d,0x30
  804452:	41 b8 28 00 00 00    	mov    r8d,0x28
  804458:	b9 00 00 00 00       	mov    ecx,0x0
  80445d:	ba 00 00 00 00       	mov    edx,0x0
  804462:	be 00 00 00 00       	mov    esi,0x0
  804467:	bf 00 00 00 00       	mov    edi,0x0
  80446c:	e8 06 f5 ff ff       	call   803977 <set_proc>
  804471:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804475:	b8 00 00 00 00       	mov    eax,0x0
  80447a:	e8 2b ce ff ff       	call   8012aa <vmalloc>
  80447f:	48 89 c1             	mov    rcx,rax
  804482:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804485:	48 63 d0             	movsxd rdx,eax
  804488:	48 89 d0             	mov    rax,rdx
  80448b:	48 01 c0             	add    rax,rax
  80448e:	48 01 d0             	add    rax,rdx
  804491:	48 c1 e0 08          	shl    rax,0x8
  804495:	48 05 40 85 40 00    	add    rax,0x408540
  80449b:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  80449f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044a2:	48 63 d0             	movsxd rdx,eax
  8044a5:	48 89 d0             	mov    rax,rdx
  8044a8:	48 01 c0             	add    rax,rax
  8044ab:	48 01 d0             	add    rax,rdx
  8044ae:	48 c1 e0 08          	shl    rax,0x8
  8044b2:	48 05 40 85 40 00    	add    rax,0x408540
  8044b8:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  8044bc:	b8 00 00 00 00       	mov    eax,0x0
  8044c1:	e8 e4 cd ff ff       	call   8012aa <vmalloc>
  8044c6:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  8044c9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044cc:	48 63 d0             	movsxd rdx,eax
  8044cf:	48 89 d0             	mov    rax,rdx
  8044d2:	48 01 c0             	add    rax,rax
  8044d5:	48 01 d0             	add    rax,rdx
  8044d8:	48 c1 e0 08          	shl    rax,0x8
  8044dc:	48 05 40 85 40 00    	add    rax,0x408540
  8044e2:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8044e6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  8044ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8044ee:	ba 03 00 00 00       	mov    edx,0x3
  8044f3:	be 00 00 00 00       	mov    esi,0x0
  8044f8:	48 89 c7             	mov    rdi,rax
  8044fb:	e8 6f d3 ff ff       	call   80186f <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804500:	b8 00 00 00 00       	mov    eax,0x0
  804505:	e8 a0 cd ff ff       	call   8012aa <vmalloc>
  80450a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  80450e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804512:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804516:	48 83 c0 18          	add    rax,0x18
  80451a:	48 83 ca 07          	or     rdx,0x7
  80451e:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804521:	b8 00 00 00 00       	mov    eax,0x0
  804526:	e8 32 d1 ff ff       	call   80165d <req_a_page>
  80452b:	89 c7                	mov    edi,eax
  80452d:	e8 d9 d2 ff ff       	call   80180b <get_phyaddr>
  804532:	89 c1                	mov    ecx,eax
  804534:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804538:	48 05 f8 0f 00 00    	add    rax,0xff8
  80453e:	ba 06 00 00 00       	mov    edx,0x6
  804543:	89 ce                	mov    esi,ecx
  804545:	48 89 c7             	mov    rdi,rax
  804548:	e8 79 d3 ff ff       	call   8018c6 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  80454d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804550:	48 63 d0             	movsxd rdx,eax
  804553:	48 89 d0             	mov    rax,rdx
  804556:	48 01 c0             	add    rax,rax
  804559:	48 01 d0             	add    rax,rdx
  80455c:	48 c1 e0 08          	shl    rax,0x8
  804560:	48 05 40 85 40 00    	add    rax,0x408540
  804566:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80456a:	48 89 c1             	mov    rcx,rax
  80456d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804570:	48 63 d0             	movsxd rdx,eax
  804573:	48 89 d0             	mov    rax,rdx
  804576:	48 01 c0             	add    rax,rax
  804579:	48 01 d0             	add    rax,rdx
  80457c:	48 c1 e0 08          	shl    rax,0x8
  804580:	48 05 d0 86 40 00    	add    rax,0x4086d0
  804586:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  804589:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80458c:	48 63 d0             	movsxd rdx,eax
  80458f:	48 89 d0             	mov    rax,rdx
  804592:	48 01 c0             	add    rax,rax
  804595:	48 01 d0             	add    rax,rdx
  804598:	48 c1 e0 08          	shl    rax,0x8
  80459c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045a2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8045a8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045ab:	48 63 d0             	movsxd rdx,eax
  8045ae:	48 89 d0             	mov    rax,rdx
  8045b1:	48 01 c0             	add    rax,rax
  8045b4:	48 01 d0             	add    rax,rdx
  8045b7:	48 c1 e0 08          	shl    rax,0x8
  8045bb:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8045c2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8045c6:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  8045ca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045cd:	48 63 d0             	movsxd rdx,eax
  8045d0:	48 89 d0             	mov    rax,rdx
  8045d3:	48 01 c0             	add    rax,rax
  8045d6:	48 01 d0             	add    rax,rdx
  8045d9:	48 c1 e0 08          	shl    rax,0x8
  8045dd:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8045e4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8045e8:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  8045ec:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8045ef:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8045f3:	c9                   	leave  
  8045f4:	c3                   	ret    

00000000008045f5 <sys_malloc>:

void * sys_malloc(int size)
{
  8045f5:	f3 0f 1e fa          	endbr64 
  8045f9:	55                   	push   rbp
  8045fa:	48 89 e5             	mov    rbp,rsp
  8045fd:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804600:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804603:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804609:	85 c0                	test   eax,eax
  80460b:	0f 48 c2             	cmovs  eax,edx
  80460e:	c1 f8 0c             	sar    eax,0xc
  804611:	89 c1                	mov    ecx,eax
  804613:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804616:	99                   	cdq    
  804617:	c1 ea 14             	shr    edx,0x14
  80461a:	01 d0                	add    eax,edx
  80461c:	25 ff 0f 00 00       	and    eax,0xfff
  804621:	29 d0                	sub    eax,edx
  804623:	01 c8                	add    eax,ecx
  804625:	85 c0                	test   eax,eax
  804627:	0f 95 c0             	setne  al
  80462a:	0f b6 c0             	movzx  eax,al
  80462d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804630:	8b 05 f6 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fef6]        # 41452c <cur_proc>
  804636:	48 63 d0             	movsxd rdx,eax
  804639:	48 89 d0             	mov    rax,rdx
  80463c:	48 01 c0             	add    rax,rax
  80463f:	48 01 d0             	add    rax,rdx
  804642:	48 c1 e0 08          	shl    rax,0x8
  804646:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80464c:	8b 00                	mov    eax,DWORD PTR [rax]
  80464e:	48 98                	cdqe   
  804650:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804654:	eb 0c                	jmp    804662 <sys_malloc+0x6d>
        hp=hp->next;
  804656:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80465a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80465e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804666:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80466a:	48 85 c0             	test   rax,rax
  80466d:	74 16                	je     804685 <sys_malloc+0x90>
  80466f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804673:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804676:	85 c0                	test   eax,eax
  804678:	75 0b                	jne    804685 <sys_malloc+0x90>
  80467a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80467e:	8b 00                	mov    eax,DWORD PTR [rax]
  804680:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804683:	7e d1                	jle    804656 <sys_malloc+0x61>
    if(hp->pgn<n)
  804685:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804689:	8b 00                	mov    eax,DWORD PTR [rax]
  80468b:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80468e:	0f 8e 8d 00 00 00    	jle    804721 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804694:	8b 05 92 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe92]        # 41452c <cur_proc>
  80469a:	48 63 d0             	movsxd rdx,eax
  80469d:	48 89 d0             	mov    rax,rdx
  8046a0:	48 01 c0             	add    rax,rax
  8046a3:	48 01 d0             	add    rax,rdx
  8046a6:	48 c1 e0 08          	shl    rax,0x8
  8046aa:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8046b0:	8b 10                	mov    edx,DWORD PTR [rax]
  8046b2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8046b5:	c1 e0 0c             	shl    eax,0xc
  8046b8:	01 d0                	add    eax,edx
  8046ba:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8046bf:	7e 0a                	jle    8046cb <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  8046c1:	b8 00 00 00 00       	mov    eax,0x0
  8046c6:	e9 cf 00 00 00       	jmp    80479a <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  8046cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046cf:	8b 10                	mov    edx,DWORD PTR [rax]
  8046d1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8046d4:	29 d0                	sub    eax,edx
  8046d6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8046d9:	8b 05 4d fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe4d]        # 41452c <cur_proc>
  8046df:	48 63 d0             	movsxd rdx,eax
  8046e2:	48 89 d0             	mov    rax,rdx
  8046e5:	48 01 c0             	add    rax,rax
  8046e8:	48 01 d0             	add    rax,rdx
  8046eb:	48 c1 e0 08          	shl    rax,0x8
  8046ef:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8046f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8046f7:	48 98                	cdqe   
  8046f9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8046fd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804704:	eb 13                	jmp    804719 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804706:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80470a:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80470d:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804714:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804715:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804719:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80471c:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80471f:	7c e5                	jl     804706 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804721:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804725:	8b 00                	mov    eax,DWORD PTR [rax]
  804727:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80472a:	7d 59                	jge    804785 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  80472c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804730:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804734:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804737:	83 c0 01             	add    eax,0x1
  80473a:	c1 e0 0c             	shl    eax,0xc
  80473d:	48 98                	cdqe   
  80473f:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804743:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804747:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  80474b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80474f:	8b 00                	mov    eax,DWORD PTR [rax]
  804751:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804754:	8d 50 ff             	lea    edx,[rax-0x1]
  804757:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80475b:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80475d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804761:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804765:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804769:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80476d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804771:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804775:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80477d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804781:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804785:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804789:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804790:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804794:	48 05 00 10 00 00    	add    rax,0x1000
}
  80479a:	5d                   	pop    rbp
  80479b:	c3                   	ret    

000000000080479c <sys_free>:
int sys_free(int ptr)
{
  80479c:	f3 0f 1e fa          	endbr64 
  8047a0:	55                   	push   rbp
  8047a1:	48 89 e5             	mov    rbp,rsp
  8047a4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8047a7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047aa:	2d 00 10 00 00       	sub    eax,0x1000
  8047af:	48 98                	cdqe   
  8047b1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8047b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047b9:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  8047c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047c4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8047c8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8047cc:	eb 2e                	jmp    8047fc <sys_free+0x60>
    {
        if(p->alloc==0)
  8047ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047d2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8047d5:	85 c0                	test   eax,eax
  8047d7:	75 2c                	jne    804805 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8047d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047dd:	8b 10                	mov    edx,DWORD PTR [rax]
  8047df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8047e5:	83 c0 01             	add    eax,0x1
  8047e8:	01 c2                	add    edx,eax
  8047ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047ee:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8047f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047f4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8047f8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8047fc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804801:	75 cb                	jne    8047ce <sys_free+0x32>
  804803:	eb 01                	jmp    804806 <sys_free+0x6a>
            break;
  804805:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804806:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80480a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80480e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804812:	eb 2e                	jmp    804842 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804814:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804818:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80481b:	85 c0                	test   eax,eax
  80481d:	75 2c                	jne    80484b <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80481f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804823:	8b 10                	mov    edx,DWORD PTR [rax]
  804825:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804829:	8b 00                	mov    eax,DWORD PTR [rax]
  80482b:	83 c0 01             	add    eax,0x1
  80482e:	01 c2                	add    edx,eax
  804830:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804834:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804836:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80483e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804842:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804847:	75 cb                	jne    804814 <sys_free+0x78>
  804849:	eb 01                	jmp    80484c <sys_free+0xb0>
            break;
  80484b:	90                   	nop
    }
    //合并完成
    return 0;
  80484c:	b8 00 00 00 00       	mov    eax,0x0
}
  804851:	5d                   	pop    rbp
  804852:	c3                   	ret    

0000000000804853 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804853:	f3 0f 1e fa          	endbr64 
  804857:	55                   	push   rbp
  804858:	48 89 e5             	mov    rbp,rsp
  80485b:	53                   	push   rbx
  80485c:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804860:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804864:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804868:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  80486e:	48 c1 f8 08          	sar    rax,0x8
  804872:	48 89 c2             	mov    rdx,rax
  804875:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  80487c:	aa aa aa 
  80487f:	48 0f af c2          	imul   rax,rdx
  804883:	89 05 a3 fc c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0fca3],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  804889:	8b 05 9d fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc9d]        # 41452c <cur_proc>
  80488f:	48 63 d0             	movsxd rdx,eax
  804892:	48 89 d0             	mov    rax,rdx
  804895:	48 01 c0             	add    rax,rax
  804898:	48 01 d0             	add    rax,rdx
  80489b:	48 c1 e0 08          	shl    rax,0x8
  80489f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8048a5:	48 89 05 f4 fb c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fbf4],rax        # 4144a0 <current>
    asm volatile("mov %%rsp,%0\r\n"
  8048ac:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  8048b0:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  8048b4:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  8048b8:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  8048bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048c0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8048c4:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8048c8:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  8048cc:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  8048d0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8048d4:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  8048db:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804906 <done>
  8048e2:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  8048e9:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  8048f0:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  8048f6:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  8048fd:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804904:	eb 08                	jmp    80490e <__switch_to>

0000000000804906 <done>:
  804906:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804907:	90                   	nop
  804908:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80490c:	c9                   	leave  
  80490d:	c3                   	ret    

000000000080490e <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  80490e:	f3 0f 1e fa          	endbr64 
  804912:	55                   	push   rbp
  804913:	48 89 e5             	mov    rbp,rsp
  804916:	53                   	push   rbx
  804917:	48 83 ec 18          	sub    rsp,0x18
  80491b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80491f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804923:	48 8b 05 b6 76 00 00 	mov    rax,QWORD PTR [rip+0x76b6]        # 80bfe0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80492a:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80492e:	48 8b 05 ab 76 00 00 	mov    rax,QWORD PTR [rip+0x76ab]        # 80bfe0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804935:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804939:	48 8b 05 a0 76 00 00 	mov    rax,QWORD PTR [rip+0x76a0]        # 80bfe0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804940:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804944:	48 8b 05 95 76 00 00 	mov    rax,QWORD PTR [rip+0x7695]        # 80bfe0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80494b:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80494f:	48 8b 05 8a 76 00 00 	mov    rax,QWORD PTR [rip+0x768a]        # 80bfe0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804956:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  80495a:	48 8b 05 7f 76 00 00 	mov    rax,QWORD PTR [rip+0x767f]        # 80bfe0 <tss>
  804961:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804965:	48 8b 05 74 76 00 00 	mov    rax,QWORD PTR [rip+0x7674]        # 80bfe0 <tss>
  80496c:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804970:	48 8b 05 69 76 00 00 	mov    rax,QWORD PTR [rip+0x7669]        # 80bfe0 <tss>
  804977:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80497b:	48 8b 05 5e 76 00 00 	mov    rax,QWORD PTR [rip+0x765e]        # 80bfe0 <tss>
  804982:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804986:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80498a:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804991:	41 52                	push   r10
  804993:	41 51                	push   r9
  804995:	41 50                	push   r8
  804997:	57                   	push   rdi
  804998:	49 89 d9             	mov    r9,rbx
  80499b:	4d 89 d8             	mov    r8,r11
  80499e:	48 89 c7             	mov    rdi,rax
  8049a1:	e8 34 00 00 00       	call   8049da <set_tss>
  8049a6:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  8049aa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8049ae:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8049b2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8049b6:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8049ba:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  8049c0:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  8049c6:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  8049cc:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  8049d2:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  8049d3:	90                   	nop
  8049d4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8049d8:	c9                   	leave  
  8049d9:	c3                   	ret    

00000000008049da <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  8049da:	f3 0f 1e fa          	endbr64 
  8049de:	55                   	push   rbp
  8049df:	48 89 e5             	mov    rbp,rsp
  8049e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8049e6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8049ea:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8049ee:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8049f2:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  8049f6:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  8049fa:	48 8b 05 df 75 00 00 	mov    rax,QWORD PTR [rip+0x75df]        # 80bfe0 <tss>
  804a01:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804a05:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804a09:	48 8b 05 d0 75 00 00 	mov    rax,QWORD PTR [rip+0x75d0]        # 80bfe0 <tss>
  804a10:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804a14:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804a18:	48 8b 05 c1 75 00 00 	mov    rax,QWORD PTR [rip+0x75c1]        # 80bfe0 <tss>
  804a1f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a23:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804a27:	48 8b 05 b2 75 00 00 	mov    rax,QWORD PTR [rip+0x75b2]        # 80bfe0 <tss>
  804a2e:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804a32:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804a36:	48 8b 05 a3 75 00 00 	mov    rax,QWORD PTR [rip+0x75a3]        # 80bfe0 <tss>
  804a3d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804a41:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804a45:	48 8b 05 94 75 00 00 	mov    rax,QWORD PTR [rip+0x7594]        # 80bfe0 <tss>
  804a4c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804a50:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804a54:	48 8b 05 85 75 00 00 	mov    rax,QWORD PTR [rip+0x7585]        # 80bfe0 <tss>
  804a5b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804a5f:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804a63:	48 8b 05 76 75 00 00 	mov    rax,QWORD PTR [rip+0x7576]        # 80bfe0 <tss>
  804a6a:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804a6e:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804a72:	48 8b 05 67 75 00 00 	mov    rax,QWORD PTR [rip+0x7567]        # 80bfe0 <tss>
  804a79:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804a7d:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804a81:	48 8b 05 58 75 00 00 	mov    rax,QWORD PTR [rip+0x7558]        # 80bfe0 <tss>
  804a88:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804a8c:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804a90:	90                   	nop
  804a91:	5d                   	pop    rbp
  804a92:	c3                   	ret    

0000000000804a93 <fork_child_ret>:

int fork_child_ret(){
  804a93:	f3 0f 1e fa          	endbr64 
  804a97:	55                   	push   rbp
  804a98:	48 89 e5             	mov    rbp,rsp
    return 0;
  804a9b:	b8 00 00 00 00       	mov    eax,0x0

}
  804aa0:	5d                   	pop    rbp
  804aa1:	c3                   	ret    

0000000000804aa2 <sys_fork>:

int sys_fork(void){
  804aa2:	f3 0f 1e fa          	endbr64 
  804aa6:	55                   	push   rbp
  804aa7:	48 89 e5             	mov    rbp,rsp
  804aaa:	53                   	push   rbx
  804aab:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804aaf:	b8 00 00 00 00       	mov    eax,0x0
  804ab4:	e8 c5 ed ff ff       	call   80387e <req_proc>
  804ab9:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804abc:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804ac0:	75 0a                	jne    804acc <sys_fork+0x2a>
  804ac2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804ac7:	e9 17 08 00 00       	jmp    8052e3 <sys_fork+0x841>
    task[pid].regs=current->regs;
  804acc:	48 8b 05 cd f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f9cd]        # 4144a0 <current>
  804ad3:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804ad6:	48 63 ca             	movsxd rcx,edx
  804ad9:	48 89 ca             	mov    rdx,rcx
  804adc:	48 01 d2             	add    rdx,rdx
  804adf:	48 01 ca             	add    rdx,rcx
  804ae2:	48 c1 e2 08          	shl    rdx,0x8
  804ae6:	48 81 c2 d0 86 40 00 	add    rdx,0x4086d0
  804aed:	48 8b 88 30 02 00 00 	mov    rcx,QWORD PTR [rax+0x230]
  804af4:	48 8b 98 38 02 00 00 	mov    rbx,QWORD PTR [rax+0x238]
  804afb:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  804afe:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  804b02:	48 8b 88 40 02 00 00 	mov    rcx,QWORD PTR [rax+0x240]
  804b09:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
  804b10:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  804b14:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  804b18:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
  804b1f:	48 8b 98 58 02 00 00 	mov    rbx,QWORD PTR [rax+0x258]
  804b26:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  804b2a:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  804b2e:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
  804b35:	48 8b 98 68 02 00 00 	mov    rbx,QWORD PTR [rax+0x268]
  804b3c:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  804b40:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  804b44:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
  804b4b:	48 8b 98 78 02 00 00 	mov    rbx,QWORD PTR [rax+0x278]
  804b52:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  804b56:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  804b5a:	48 8b 88 80 02 00 00 	mov    rcx,QWORD PTR [rax+0x280]
  804b61:	48 8b 98 88 02 00 00 	mov    rbx,QWORD PTR [rax+0x288]
  804b68:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  804b6c:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  804b70:	48 8b 88 90 02 00 00 	mov    rcx,QWORD PTR [rax+0x290]
  804b77:	48 8b 98 98 02 00 00 	mov    rbx,QWORD PTR [rax+0x298]
  804b7e:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  804b82:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  804b86:	48 8b 88 a0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a0]
  804b8d:	48 8b 98 a8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2a8]
  804b94:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  804b98:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  804b9c:	48 8b 88 b0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b0]
  804ba3:	48 8b 98 b8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2b8]
  804baa:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  804bb1:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  804bb8:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
  804bbf:	48 8b 98 c8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2c8]
  804bc6:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  804bcd:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  804bd4:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
  804bdb:	48 8b 98 d8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2d8]
  804be2:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  804be9:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  804bf0:	48 8b 88 e0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e0]
  804bf7:	48 8b 98 e8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2e8]
  804bfe:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  804c05:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  804c0c:	48 8b 88 f0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f0]
  804c13:	48 8b 98 f8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2f8]
  804c1a:	48 89 8a c0 00 00 00 	mov    QWORD PTR [rdx+0xc0],rcx
  804c21:	48 89 9a c8 00 00 00 	mov    QWORD PTR [rdx+0xc8],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804c28:	b9 51 bf 80 00       	mov    ecx,0x80bf51
  804c2d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c30:	48 63 d0             	movsxd rdx,eax
  804c33:	48 89 d0             	mov    rax,rdx
  804c36:	48 01 c0             	add    rax,rax
  804c39:	48 01 d0             	add    rax,rdx
  804c3c:	48 c1 e0 08          	shl    rax,0x8
  804c40:	48 05 d8 86 40 00    	add    rax,0x4086d8
  804c46:	48 89 08             	mov    QWORD PTR [rax],rcx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804c49:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c4c:	48 63 d0             	movsxd rdx,eax
  804c4f:	48 89 d0             	mov    rax,rdx
  804c52:	48 01 c0             	add    rax,rax
  804c55:	48 01 d0             	add    rax,rdx
  804c58:	48 c1 e0 08          	shl    rax,0x8
  804c5c:	48 05 08 87 40 00    	add    rax,0x408708
  804c62:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c65:	48 2d a8 00 00 00    	sub    rax,0xa8
  804c6b:	48 89 c1             	mov    rcx,rax
  804c6e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c71:	48 63 d0             	movsxd rdx,eax
  804c74:	48 89 d0             	mov    rax,rdx
  804c77:	48 01 c0             	add    rax,rax
  804c7a:	48 01 d0             	add    rax,rdx
  804c7d:	48 c1 e0 08          	shl    rax,0x8
  804c81:	48 05 08 87 40 00    	add    rax,0x408708
  804c87:	48 89 08             	mov    QWORD PTR [rax],rcx
    stack_store_regs *r=task[pid].regs.rsp;
  804c8a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c8d:	48 63 d0             	movsxd rdx,eax
  804c90:	48 89 d0             	mov    rax,rdx
  804c93:	48 01 c0             	add    rax,rax
  804c96:	48 01 d0             	add    rax,rdx
  804c99:	48 c1 e0 08          	shl    rax,0x8
  804c9d:	48 05 08 87 40 00    	add    rax,0x408708
  804ca3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ca6:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804caa:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cae:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804cb5:	00 
    r->ds=DS_USER;
  804cb6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cba:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804cc1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cc5:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804ccc:	28 00 00 00 
    r->es=DS_USER;
  804cd0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cd4:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804cdb:	00 
    r->rax=task[pid].regs.rax;
  804cdc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cdf:	48 63 d0             	movsxd rdx,eax
  804ce2:	48 89 d0             	mov    rax,rdx
  804ce5:	48 01 c0             	add    rax,rax
  804ce8:	48 01 d0             	add    rax,rdx
  804ceb:	48 c1 e0 08          	shl    rax,0x8
  804cef:	48 05 e8 86 40 00    	add    rax,0x4086e8
  804cf5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804cf8:	48 89 c2             	mov    rdx,rax
  804cfb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cff:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804d03:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d06:	48 63 d0             	movsxd rdx,eax
  804d09:	48 89 d0             	mov    rax,rdx
  804d0c:	48 01 c0             	add    rax,rax
  804d0f:	48 01 d0             	add    rax,rdx
  804d12:	48 c1 e0 08          	shl    rax,0x8
  804d16:	48 05 00 87 40 00    	add    rax,0x408700
  804d1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d1f:	48 89 c2             	mov    rdx,rax
  804d22:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d26:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804d2a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d2d:	48 63 d0             	movsxd rdx,eax
  804d30:	48 89 d0             	mov    rax,rdx
  804d33:	48 01 c0             	add    rax,rax
  804d36:	48 01 d0             	add    rax,rdx
  804d39:	48 c1 e0 08          	shl    rax,0x8
  804d3d:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804d43:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d46:	48 89 c2             	mov    rdx,rax
  804d49:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d4d:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804d51:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d54:	48 63 d0             	movsxd rdx,eax
  804d57:	48 89 d0             	mov    rax,rdx
  804d5a:	48 01 c0             	add    rax,rax
  804d5d:	48 01 d0             	add    rax,rdx
  804d60:	48 c1 e0 08          	shl    rax,0x8
  804d64:	48 05 f8 86 40 00    	add    rax,0x4086f8
  804d6a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d6d:	48 89 c2             	mov    rdx,rax
  804d70:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d74:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804d78:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d7b:	48 63 d0             	movsxd rdx,eax
  804d7e:	48 89 d0             	mov    rax,rdx
  804d81:	48 01 c0             	add    rax,rax
  804d84:	48 01 d0             	add    rax,rdx
  804d87:	48 c1 e0 08          	shl    rax,0x8
  804d8b:	48 05 18 87 40 00    	add    rax,0x408718
  804d91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d94:	48 89 c2             	mov    rdx,rax
  804d97:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d9b:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804d9f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804da2:	48 63 d0             	movsxd rdx,eax
  804da5:	48 89 d0             	mov    rax,rdx
  804da8:	48 01 c0             	add    rax,rax
  804dab:	48 01 d0             	add    rax,rdx
  804dae:	48 c1 e0 08          	shl    rax,0x8
  804db2:	48 05 20 87 40 00    	add    rax,0x408720
  804db8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dbb:	48 89 c2             	mov    rdx,rax
  804dbe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dc2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804dc6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804dc9:	48 63 d0             	movsxd rdx,eax
  804dcc:	48 89 d0             	mov    rax,rdx
  804dcf:	48 01 c0             	add    rax,rax
  804dd2:	48 01 d0             	add    rax,rdx
  804dd5:	48 c1 e0 08          	shl    rax,0x8
  804dd9:	48 05 58 87 40 00    	add    rax,0x408758
  804ddf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804de2:	48 89 c2             	mov    rdx,rax
  804de5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804de9:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804ded:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804df0:	48 63 d0             	movsxd rdx,eax
  804df3:	48 89 d0             	mov    rax,rdx
  804df6:	48 01 c0             	add    rax,rax
  804df9:	48 01 d0             	add    rax,rdx
  804dfc:	48 c1 e0 08          	shl    rax,0x8
  804e00:	48 05 60 87 40 00    	add    rax,0x408760
  804e06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e09:	48 89 c2             	mov    rdx,rax
  804e0c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e10:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804e14:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e17:	48 63 d0             	movsxd rdx,eax
  804e1a:	48 89 d0             	mov    rax,rdx
  804e1d:	48 01 c0             	add    rax,rax
  804e20:	48 01 d0             	add    rax,rdx
  804e23:	48 c1 e0 08          	shl    rax,0x8
  804e27:	48 05 68 87 40 00    	add    rax,0x408768
  804e2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e30:	48 89 c2             	mov    rdx,rax
  804e33:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e37:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804e3b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e3e:	48 63 d0             	movsxd rdx,eax
  804e41:	48 89 d0             	mov    rax,rdx
  804e44:	48 01 c0             	add    rax,rax
  804e47:	48 01 d0             	add    rax,rdx
  804e4a:	48 c1 e0 08          	shl    rax,0x8
  804e4e:	48 05 70 87 40 00    	add    rax,0x408770
  804e54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e57:	48 89 c2             	mov    rdx,rax
  804e5a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e5e:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804e62:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e65:	48 63 d0             	movsxd rdx,eax
  804e68:	48 89 d0             	mov    rax,rdx
  804e6b:	48 01 c0             	add    rax,rax
  804e6e:	48 01 d0             	add    rax,rdx
  804e71:	48 c1 e0 08          	shl    rax,0x8
  804e75:	48 05 78 87 40 00    	add    rax,0x408778
  804e7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e7e:	48 89 c2             	mov    rdx,rax
  804e81:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e85:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804e89:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e8c:	48 63 d0             	movsxd rdx,eax
  804e8f:	48 89 d0             	mov    rax,rdx
  804e92:	48 01 c0             	add    rax,rax
  804e95:	48 01 d0             	add    rax,rdx
  804e98:	48 c1 e0 08          	shl    rax,0x8
  804e9c:	48 05 80 87 40 00    	add    rax,0x408780
  804ea2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ea5:	48 89 c2             	mov    rdx,rax
  804ea8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804eac:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804eb0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804eb3:	48 63 d0             	movsxd rdx,eax
  804eb6:	48 89 d0             	mov    rax,rdx
  804eb9:	48 01 c0             	add    rax,rax
  804ebc:	48 01 d0             	add    rax,rdx
  804ebf:	48 c1 e0 08          	shl    rax,0x8
  804ec3:	48 05 88 87 40 00    	add    rax,0x408788
  804ec9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ecc:	48 89 c2             	mov    rdx,rax
  804ecf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ed3:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804ed7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804eda:	48 63 d0             	movsxd rdx,eax
  804edd:	48 89 d0             	mov    rax,rdx
  804ee0:	48 01 c0             	add    rax,rax
  804ee3:	48 01 d0             	add    rax,rdx
  804ee6:	48 c1 e0 08          	shl    rax,0x8
  804eea:	48 05 90 87 40 00    	add    rax,0x408790
  804ef0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ef3:	48 89 c2             	mov    rdx,rax
  804ef6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804efa:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804efe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f02:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804f09:	48 8b 05 90 f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f590]        # 4144a0 <current>
  804f10:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f13:	48 63 ca             	movsxd rcx,edx
  804f16:	48 89 ca             	mov    rdx,rcx
  804f19:	48 01 d2             	add    rdx,rdx
  804f1c:	48 01 ca             	add    rdx,rcx
  804f1f:	48 c1 e2 08          	shl    rdx,0x8
  804f23:	48 81 c2 60 86 40 00 	add    rdx,0x408660
  804f2a:	48 8b 88 c4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1c4]
  804f31:	48 8b 98 cc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1cc]
  804f38:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804f3c:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804f40:	48 8b 88 d4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d4]
  804f47:	48 8b 98 dc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1dc]
  804f4e:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804f52:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804f56:	48 8b 88 e4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e4]
  804f5d:	48 8b 98 ec 01 00 00 	mov    rbx,QWORD PTR [rax+0x1ec]
  804f64:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804f68:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804f6c:	48 8b 88 f4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f4]
  804f73:	48 8b 98 fc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1fc]
  804f7a:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804f7e:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804f82:	48 8b 88 04 02 00 00 	mov    rcx,QWORD PTR [rax+0x204]
  804f89:	48 8b 98 0c 02 00 00 	mov    rbx,QWORD PTR [rax+0x20c]
  804f90:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804f94:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804f98:	48 8b 88 14 02 00 00 	mov    rcx,QWORD PTR [rax+0x214]
  804f9f:	48 8b 98 1c 02 00 00 	mov    rbx,QWORD PTR [rax+0x21c]
  804fa6:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  804faa:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  804fae:	48 8b 88 24 02 00 00 	mov    rcx,QWORD PTR [rax+0x224]
  804fb5:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  804fb9:	8b 80 2c 02 00 00    	mov    eax,DWORD PTR [rax+0x22c]
  804fbf:	89 42 6c             	mov    DWORD PTR [rdx+0x6c],eax
    task[pid].stat=READY;
  804fc2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fc5:	48 63 d0             	movsxd rdx,eax
  804fc8:	48 89 d0             	mov    rax,rdx
  804fcb:	48 01 c0             	add    rax,rax
  804fce:	48 01 d0             	add    rax,rdx
  804fd1:	48 c1 e0 08          	shl    rax,0x8
  804fd5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804fdb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  804fe1:	8b 05 45 f5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f545]        # 41452c <cur_proc>
  804fe7:	89 c1                	mov    ecx,eax
  804fe9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fec:	48 63 d0             	movsxd rdx,eax
  804fef:	48 89 d0             	mov    rax,rdx
  804ff2:	48 01 c0             	add    rax,rax
  804ff5:	48 01 d0             	add    rax,rdx
  804ff8:	48 c1 e0 08          	shl    rax,0x8
  804ffc:	48 05 28 85 40 00    	add    rax,0x408528
  805002:	89 08                	mov    DWORD PTR [rax],ecx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805004:	48 8b 05 95 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f495]        # 4144a0 <current>
  80500b:	48 8d 88 c4 00 00 00 	lea    rcx,[rax+0xc4]
  805012:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805015:	48 63 d0             	movsxd rdx,eax
  805018:	48 89 d0             	mov    rax,rdx
  80501b:	48 01 c0             	add    rax,rax
  80501e:	48 01 d0             	add    rax,rdx
  805021:	48 c1 e0 08          	shl    rax,0x8
  805025:	48 05 c0 00 00 00    	add    rax,0xc0
  80502b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805031:	48 83 c0 04          	add    rax,0x4
  805035:	ba 00 01 00 00       	mov    edx,0x100
  80503a:	48 89 ce             	mov    rsi,rcx
  80503d:	48 89 c7             	mov    rdi,rax
  805040:	e8 6c 65 00 00       	call   80b5b1 <memcpy>
    task[pid].utime=0;
  805045:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805048:	48 63 d0             	movsxd rdx,eax
  80504b:	48 89 d0             	mov    rax,rdx
  80504e:	48 01 c0             	add    rax,rax
  805051:	48 01 d0             	add    rax,rdx
  805054:	48 c1 e0 08          	shl    rax,0x8
  805058:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80505e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  805064:	48 8b 0d 35 f4 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f435]        # 4144a0 <current>
  80506b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80506e:	48 63 d0             	movsxd rdx,eax
  805071:	48 89 d0             	mov    rax,rdx
  805074:	48 01 c0             	add    rax,rax
  805077:	48 01 d0             	add    rax,rdx
  80507a:	48 c1 e0 08          	shl    rax,0x8
  80507e:	48 8d b0 b0 84 40 00 	lea    rsi,[rax+0x4084b0]
  805085:	48 8b 41 14          	mov    rax,QWORD PTR [rcx+0x14]
  805089:	48 8b 51 1c          	mov    rdx,QWORD PTR [rcx+0x1c]
  80508d:	48 89 46 04          	mov    QWORD PTR [rsi+0x4],rax
  805091:	48 89 56 0c          	mov    QWORD PTR [rsi+0xc],rdx
  805095:	48 8b 41 24          	mov    rax,QWORD PTR [rcx+0x24]
  805099:	48 8b 51 2c          	mov    rdx,QWORD PTR [rcx+0x2c]
  80509d:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
  8050a1:	48 89 56 1c          	mov    QWORD PTR [rsi+0x1c],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  8050a5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050a8:	48 63 d0             	movsxd rdx,eax
  8050ab:	48 89 d0             	mov    rax,rdx
  8050ae:	48 01 c0             	add    rax,rax
  8050b1:	48 01 d0             	add    rax,rdx
  8050b4:	48 c1 e0 08          	shl    rax,0x8
  8050b8:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8050bf:	48 8b 05 da f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f3da]        # 4144a0 <current>
  8050c6:	48 89 d6             	mov    rsi,rdx
  8050c9:	48 89 c7             	mov    rdi,rax
  8050cc:	e8 18 02 00 00       	call   8052e9 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  8050d1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050d4:	48 63 d0             	movsxd rdx,eax
  8050d7:	48 89 d0             	mov    rax,rdx
  8050da:	48 01 c0             	add    rax,rax
  8050dd:	48 01 d0             	add    rax,rdx
  8050e0:	48 c1 e0 08          	shl    rax,0x8
  8050e4:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8050ea:	8b 00                	mov    eax,DWORD PTR [rax]
  8050ec:	2d 00 10 00 00       	sub    eax,0x1000
  8050f1:	48 98                	cdqe   
  8050f3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8050f7:	eb 63                	jmp    80515c <sys_fork+0x6ba>
        addr_t new_stkpg=vmalloc();
  8050f9:	b8 00 00 00 00       	mov    eax,0x0
  8050fe:	e8 a7 c1 ff ff       	call   8012aa <vmalloc>
  805103:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805107:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80510b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80510f:	ba 00 10 00 00       	mov    edx,0x1000
  805114:	48 89 ce             	mov    rsi,rcx
  805117:	48 89 c7             	mov    rdi,rax
  80511a:	e8 92 64 00 00       	call   80b5b1 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80511f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805122:	48 63 d0             	movsxd rdx,eax
  805125:	48 89 d0             	mov    rax,rdx
  805128:	48 01 c0             	add    rax,rax
  80512b:	48 01 d0             	add    rax,rdx
  80512e:	48 c1 e0 08          	shl    rax,0x8
  805132:	48 05 40 85 40 00    	add    rax,0x408540
  805138:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  80513c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805140:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805144:	48 89 d1             	mov    rcx,rdx
  805147:	ba 07 00 00 00       	mov    edx,0x7
  80514c:	48 89 c7             	mov    rdi,rax
  80514f:	e8 06 bf ff ff       	call   80105a <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805154:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  80515b:	00 
  80515c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80515f:	48 63 d0             	movsxd rdx,eax
  805162:	48 89 d0             	mov    rax,rdx
  805165:	48 01 c0             	add    rax,rax
  805168:	48 01 d0             	add    rax,rdx
  80516b:	48 c1 e0 08          	shl    rax,0x8
  80516f:	48 05 bc 84 40 00    	add    rax,0x4084bc
  805175:	8b 00                	mov    eax,DWORD PTR [rax]
  805177:	48 98                	cdqe   
  805179:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80517d:	0f 83 76 ff ff ff    	jae    8050f9 <sys_fork+0x657>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  805183:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  80518a:	00 
    int f=1;
  80518b:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805192:	e9 89 00 00 00       	jmp    805220 <sys_fork+0x77e>
        addr_t new_stkpg=vmalloc();
  805197:	b8 00 00 00 00       	mov    eax,0x0
  80519c:	e8 09 c1 ff ff       	call   8012aa <vmalloc>
  8051a1:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8051a5:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8051a9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8051ad:	ba 00 10 00 00       	mov    edx,0x1000
  8051b2:	48 89 ce             	mov    rsi,rcx
  8051b5:	48 89 c7             	mov    rdi,rax
  8051b8:	e8 f4 63 00 00       	call   80b5b1 <memcpy>
        if(f){
  8051bd:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8051c1:	74 20                	je     8051e3 <sys_fork+0x741>
            f=0;
  8051c3:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  8051ca:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8051ce:	48 05 c8 0f 00 00    	add    rax,0xfc8
  8051d4:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  8051d8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8051dc:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8051e3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051e6:	48 63 d0             	movsxd rdx,eax
  8051e9:	48 89 d0             	mov    rax,rdx
  8051ec:	48 01 c0             	add    rax,rax
  8051ef:	48 01 d0             	add    rax,rdx
  8051f2:	48 c1 e0 08          	shl    rax,0x8
  8051f6:	48 05 40 85 40 00    	add    rax,0x408540
  8051fc:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805200:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805204:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805208:	48 89 d1             	mov    rcx,rdx
  80520b:	ba 07 00 00 00       	mov    edx,0x7
  805210:	48 89 c7             	mov    rdi,rax
  805213:	e8 42 be ff ff       	call   80105a <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805218:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  80521f:	00 
  805220:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805227:	00 
  805228:	0f 87 69 ff ff ff    	ja     805197 <sys_fork+0x6f5>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  80522e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805231:	48 63 d0             	movsxd rdx,eax
  805234:	48 89 d0             	mov    rax,rdx
  805237:	48 01 c0             	add    rax,rax
  80523a:	48 01 d0             	add    rax,rdx
  80523d:	48 c1 e0 08          	shl    rax,0x8
  805241:	48 05 b8 84 40 00    	add    rax,0x4084b8
  805247:	8b 00                	mov    eax,DWORD PTR [rax]
  805249:	2d 00 10 00 00       	sub    eax,0x1000
  80524e:	48 98                	cdqe   
  805250:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805254:	eb 63                	jmp    8052b9 <sys_fork+0x817>
        addr_t new_hppg=vmalloc();
  805256:	b8 00 00 00 00       	mov    eax,0x0
  80525b:	e8 4a c0 ff ff       	call   8012aa <vmalloc>
  805260:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805264:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  805268:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80526c:	ba 00 10 00 00       	mov    edx,0x1000
  805271:	48 89 ce             	mov    rsi,rcx
  805274:	48 89 c7             	mov    rdi,rax
  805277:	e8 35 63 00 00       	call   80b5b1 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80527c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80527f:	48 63 d0             	movsxd rdx,eax
  805282:	48 89 d0             	mov    rax,rdx
  805285:	48 01 c0             	add    rax,rax
  805288:	48 01 d0             	add    rax,rdx
  80528b:	48 c1 e0 08          	shl    rax,0x8
  80528f:	48 05 40 85 40 00    	add    rax,0x408540
  805295:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805299:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  80529d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052a1:	48 89 d1             	mov    rcx,rdx
  8052a4:	ba 07 00 00 00       	mov    edx,0x7
  8052a9:	48 89 c7             	mov    rdi,rax
  8052ac:	e8 a9 bd ff ff       	call   80105a <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8052b1:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  8052b8:	00 
  8052b9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052bc:	48 63 d0             	movsxd rdx,eax
  8052bf:	48 89 d0             	mov    rax,rdx
  8052c2:	48 01 c0             	add    rax,rax
  8052c5:	48 01 d0             	add    rax,rdx
  8052c8:	48 c1 e0 08          	shl    rax,0x8
  8052cc:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8052d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8052d4:	48 98                	cdqe   
  8052d6:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  8052da:	0f 83 76 ff ff ff    	jae    805256 <sys_fork+0x7b4>
    }
    //父进程运行到这里
    return pid;
  8052e0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  8052e3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8052e7:	c9                   	leave  
  8052e8:	c3                   	ret    

00000000008052e9 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  8052e9:	f3 0f 1e fa          	endbr64 
  8052ed:	55                   	push   rbp
  8052ee:	48 89 e5             	mov    rbp,rsp
  8052f1:	48 83 ec 60          	sub    rsp,0x60
  8052f5:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8052f9:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  8052fd:	b8 00 00 00 00       	mov    eax,0x0
  805302:	e8 a3 bf ff ff       	call   8012aa <vmalloc>
  805307:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  80530b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80530f:	48 8b 80 30 02 00 00 	mov    rax,QWORD PTR [rax+0x230]
  805316:	48 89 c1             	mov    rcx,rax
  805319:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80531d:	ba 00 10 00 00       	mov    edx,0x1000
  805322:	48 89 ce             	mov    rsi,rcx
  805325:	48 89 c7             	mov    rdi,rax
  805328:	e8 84 62 00 00       	call   80b5b1 <memcpy>
    to->regs.cr3=pml4p;
  80532d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805331:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805335:	48 89 90 30 02 00 00 	mov    QWORD PTR [rax+0x230],rdx
    to->pml4=pml4p;
  80533c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805340:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805344:	48 89 90 ac 00 00 00 	mov    QWORD PTR [rax+0xac],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  80534b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80534f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805353:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80535a:	e9 09 03 00 00       	jmp    805668 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  80535f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805362:	48 98                	cdqe   
  805364:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80536b:	00 
  80536c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805370:	48 01 d0             	add    rax,rdx
  805373:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805376:	83 e0 01             	and    eax,0x1
  805379:	48 85 c0             	test   rax,rax
  80537c:	0f 84 e2 02 00 00    	je     805664 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805382:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805385:	48 98                	cdqe   
  805387:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80538e:	00 
  80538f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805393:	48 01 d0             	add    rax,rdx
  805396:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805399:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  80539d:	b8 00 00 00 00       	mov    eax,0x0
  8053a2:	e8 03 bf ff ff       	call   8012aa <vmalloc>
  8053a7:	48 89 c2             	mov    rdx,rax
  8053aa:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8053b1:	00 ff ff 
  8053b4:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8053b8:	48 89 c1             	mov    rcx,rax
  8053bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053be:	48 98                	cdqe   
  8053c0:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8053c7:	00 
  8053c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053cc:	48 01 f0             	add    rax,rsi
  8053cf:	48 09 ca             	or     rdx,rcx
  8053d2:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8053d5:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8053dc:	ff 00 00 
  8053df:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8053e3:	48 89 c1             	mov    rcx,rax
  8053e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053e9:	48 98                	cdqe   
  8053eb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053f2:	00 
  8053f3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053f7:	48 01 d0             	add    rax,rdx
  8053fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053fd:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805404:	ff 00 00 
  805407:	48 21 d0             	and    rax,rdx
  80540a:	ba 00 10 00 00       	mov    edx,0x1000
  80540f:	48 89 ce             	mov    rsi,rcx
  805412:	48 89 c7             	mov    rdi,rax
  805415:	e8 97 61 00 00       	call   80b5b1 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  80541a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80541d:	48 98                	cdqe   
  80541f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805426:	00 
  805427:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80542b:	48 01 d0             	add    rax,rdx
  80542e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805431:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805438:	ff 00 00 
  80543b:	48 21 d0             	and    rax,rdx
  80543e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  805442:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805449:	e9 09 02 00 00       	jmp    805657 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  80544e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805451:	48 98                	cdqe   
  805453:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80545a:	00 
  80545b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80545f:	48 01 d0             	add    rax,rdx
  805462:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805465:	83 e0 01             	and    eax,0x1
  805468:	48 85 c0             	test   rax,rax
  80546b:	0f 84 e2 01 00 00    	je     805653 <copy_mmap+0x36a>
  805471:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805474:	48 98                	cdqe   
  805476:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80547d:	00 
  80547e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805482:	48 01 d0             	add    rax,rdx
  805485:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805488:	25 80 00 00 00       	and    eax,0x80
  80548d:	48 85 c0             	test   rax,rax
  805490:	0f 85 bd 01 00 00    	jne    805653 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805496:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805499:	48 98                	cdqe   
  80549b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054a2:	00 
  8054a3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054a7:	48 01 d0             	add    rax,rdx
  8054aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054ad:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  8054b1:	b8 00 00 00 00       	mov    eax,0x0
  8054b6:	e8 ef bd ff ff       	call   8012aa <vmalloc>
  8054bb:	48 89 c2             	mov    rdx,rax
  8054be:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8054c5:	00 ff ff 
  8054c8:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8054cc:	48 89 c1             	mov    rcx,rax
  8054cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054d2:	48 98                	cdqe   
  8054d4:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8054db:	00 
  8054dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054e0:	48 01 f0             	add    rax,rsi
  8054e3:	48 09 ca             	or     rdx,rcx
  8054e6:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8054e9:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8054f0:	ff 00 00 
  8054f3:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8054f7:	48 89 c1             	mov    rcx,rax
  8054fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054fd:	48 98                	cdqe   
  8054ff:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805506:	00 
  805507:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80550b:	48 01 d0             	add    rax,rdx
  80550e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805511:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805518:	ff 00 00 
  80551b:	48 21 d0             	and    rax,rdx
  80551e:	ba 00 10 00 00       	mov    edx,0x1000
  805523:	48 89 ce             	mov    rsi,rcx
  805526:	48 89 c7             	mov    rdi,rax
  805529:	e8 83 60 00 00       	call   80b5b1 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  80552e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805531:	48 98                	cdqe   
  805533:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80553a:	00 
  80553b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80553f:	48 01 d0             	add    rax,rdx
  805542:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805545:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80554c:	ff 00 00 
  80554f:	48 21 d0             	and    rax,rdx
  805552:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  805556:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80555d:	e9 e4 00 00 00       	jmp    805646 <copy_mmap+0x35d>
                    {
                        if(pde[j]&PAGE_PRESENT&&!(pde[j]&PDE_4MB)){
  805562:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805565:	48 98                	cdqe   
  805567:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80556e:	00 
  80556f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805573:	48 01 d0             	add    rax,rdx
  805576:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805579:	83 e0 01             	and    eax,0x1
  80557c:	48 85 c0             	test   rax,rax
  80557f:	0f 84 bd 00 00 00    	je     805642 <copy_mmap+0x359>
  805585:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805588:	48 98                	cdqe   
  80558a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805591:	00 
  805592:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805596:	48 01 d0             	add    rax,rdx
  805599:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80559c:	25 80 00 00 00       	and    eax,0x80
  8055a1:	48 85 c0             	test   rax,rax
  8055a4:	0f 85 98 00 00 00    	jne    805642 <copy_mmap+0x359>
                            addr_t old_data3=pde[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8055aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055ad:	48 98                	cdqe   
  8055af:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055b6:	00 
  8055b7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055bb:	48 01 d0             	add    rax,rdx
  8055be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055c1:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[j]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  8055c5:	b8 00 00 00 00       	mov    eax,0x0
  8055ca:	e8 db bc ff ff       	call   8012aa <vmalloc>
  8055cf:	48 89 c2             	mov    rdx,rax
  8055d2:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8055d9:	00 ff ff 
  8055dc:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8055e0:	48 89 c1             	mov    rcx,rax
  8055e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055e6:	48 98                	cdqe   
  8055e8:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8055ef:	00 
  8055f0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055f4:	48 01 f0             	add    rax,rsi
  8055f7:	48 09 ca             	or     rdx,rcx
  8055fa:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[j]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8055fd:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805604:	ff 00 00 
  805607:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  80560b:	48 89 c1             	mov    rcx,rax
  80560e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805611:	48 98                	cdqe   
  805613:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80561a:	00 
  80561b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80561f:	48 01 d0             	add    rax,rdx
  805622:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805625:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80562c:	ff 00 00 
  80562f:	48 21 d0             	and    rax,rdx
  805632:	ba 00 10 00 00       	mov    edx,0x1000
  805637:	48 89 ce             	mov    rsi,rcx
  80563a:	48 89 c7             	mov    rdi,rax
  80563d:	e8 6f 5f 00 00       	call   80b5b1 <memcpy>
                    for(int k=0;k<512;k++)
  805642:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805646:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  80564d:	0f 8e 0f ff ff ff    	jle    805562 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  805653:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805657:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  80565e:	0f 8e ea fd ff ff    	jle    80544e <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  805664:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805668:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  80566f:	0f 8e ea fc ff ff    	jle    80535f <copy_mmap+0x76>
                    }
                }
            }
        }
    }
  805675:	90                   	nop
  805676:	90                   	nop
  805677:	c9                   	leave  
  805678:	c3                   	ret    
  805679:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000805680 <outb>:
  805680:	66 89 fa             	mov    dx,di
  805683:	66 89 f0             	mov    ax,si
  805686:	ee                   	out    dx,al
  805687:	e8 29 00 00 00       	call   8056b5 <io_delay>
  80568c:	c3                   	ret    

000000000080568d <outw>:
  80568d:	66 89 fa             	mov    dx,di
  805690:	66 89 f0             	mov    ax,si
  805693:	66 ef                	out    dx,ax
  805695:	90                   	nop
  805696:	90                   	nop
  805697:	90                   	nop
  805698:	c3                   	ret    

0000000000805699 <inb>:
  805699:	31 c0                	xor    eax,eax
  80569b:	66 89 fa             	mov    dx,di
  80569e:	ec                   	in     al,dx
  80569f:	90                   	nop
  8056a0:	90                   	nop
  8056a1:	90                   	nop
  8056a2:	c3                   	ret    

00000000008056a3 <inw>:
  8056a3:	31 c0                	xor    eax,eax
  8056a5:	66 89 fa             	mov    dx,di
  8056a8:	66 ed                	in     ax,dx
  8056aa:	90                   	nop
  8056ab:	90                   	nop
  8056ac:	90                   	nop
  8056ad:	c3                   	ret    

00000000008056ae <eoi>:
  8056ae:	b0 20                	mov    al,0x20
  8056b0:	e6 a0                	out    0xa0,al
  8056b2:	e6 20                	out    0x20,al
  8056b4:	c3                   	ret    

00000000008056b5 <io_delay>:
  8056b5:	90                   	nop
  8056b6:	90                   	nop
  8056b7:	90                   	nop
  8056b8:	90                   	nop
  8056b9:	c3                   	ret    

00000000008056ba <turn_on_int>:
  8056ba:	b0 f8                	mov    al,0xf8
  8056bc:	e6 21                	out    0x21,al
  8056be:	e8 f2 ff ff ff       	call   8056b5 <io_delay>
  8056c3:	b0 af                	mov    al,0xaf
  8056c5:	e6 a1                	out    0xa1,al
  8056c7:	e8 e9 ff ff ff       	call   8056b5 <io_delay>
  8056cc:	b8 00 70 10 00       	mov    eax,0x107000
  8056d1:	0f 01 18             	lidt   [rax]
  8056d4:	90                   	nop
  8056d5:	90                   	nop
  8056d6:	90                   	nop
  8056d7:	90                   	nop
  8056d8:	c3                   	ret    

00000000008056d9 <report_back_trace_of_err>:
  8056d9:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8056de:	50                   	push   rax
  8056df:	68 e8 56 80 00       	push   0x8056e8
  8056e4:	83 c4 08             	add    esp,0x8
  8056e7:	c3                   	ret    

00000000008056e8 <bt_msg>:
  8056e8:	65 72 72             	gs jb  80575d <fill_desc+0x4e>
  8056eb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8056ec:	72 20                	jb     80570e <init_gdt+0x11>
  8056ee:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8056ef:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8056f2:	72 73                	jb     805767 <fill_desc+0x58>
  8056f4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8056f7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb375 <_knl_end+0x2eb375>

00000000008056fd <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8056fd:	f3 0f 1e fa          	endbr64 
  805701:	55                   	push   rbp
  805702:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805705:	66 b8 48 00          	mov    ax,0x48
  805709:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80570c:	90                   	nop
  80570d:	5d                   	pop    rbp
  80570e:	c3                   	ret    

000000000080570f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80570f:	f3 0f 1e fa          	endbr64 
  805713:	55                   	push   rbp
  805714:	48 89 e5             	mov    rbp,rsp
  805717:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80571b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80571f:	89 d0                	mov    eax,edx
  805721:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805724:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805728:	48 8b 15 b9 68 00 00 	mov    rdx,QWORD PTR [rip+0x68b9]        # 80bfe8 <gdt>
  80572f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805732:	48 c1 e0 04          	shl    rax,0x4
  805736:	48 01 d0             	add    rax,rdx
  805739:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80573d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805741:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805745:	48 c1 e8 10          	shr    rax,0x10
  805749:	48 89 c1             	mov    rcx,rax
  80574c:	48 8b 15 95 68 00 00 	mov    rdx,QWORD PTR [rip+0x6895]        # 80bfe8 <gdt>
  805753:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805756:	48 c1 e0 04          	shl    rax,0x4
  80575a:	48 01 d0             	add    rax,rdx
  80575d:	89 ca                	mov    edx,ecx
  80575f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  805762:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805766:	48 c1 e8 18          	shr    rax,0x18
  80576a:	48 89 c1             	mov    rcx,rax
  80576d:	48 8b 15 74 68 00 00 	mov    rdx,QWORD PTR [rip+0x6874]        # 80bfe8 <gdt>
  805774:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805777:	48 c1 e0 04          	shl    rax,0x4
  80577b:	48 01 d0             	add    rax,rdx
  80577e:	89 ca                	mov    edx,ecx
  805780:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  805783:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805787:	48 c1 e8 20          	shr    rax,0x20
  80578b:	48 89 c2             	mov    rdx,rax
  80578e:	48 8b 0d 53 68 00 00 	mov    rcx,QWORD PTR [rip+0x6853]        # 80bfe8 <gdt>
  805795:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805798:	48 c1 e0 04          	shl    rax,0x4
  80579c:	48 01 c8             	add    rax,rcx
  80579f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  8057a2:	48 8b 15 3f 68 00 00 	mov    rdx,QWORD PTR [rip+0x683f]        # 80bfe8 <gdt>
  8057a9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057ac:	48 c1 e0 04          	shl    rax,0x4
  8057b0:	48 01 d0             	add    rax,rdx
  8057b3:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8057b7:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  8057ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8057be:	48 c1 e8 08          	shr    rax,0x8
  8057c2:	66 25 f0 00          	and    ax,0xf0
  8057c6:	48 8b 0d 1b 68 00 00 	mov    rcx,QWORD PTR [rip+0x681b]        # 80bfe8 <gdt>
  8057cd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8057d0:	48 c1 e2 04          	shl    rdx,0x4
  8057d4:	48 01 ca             	add    rdx,rcx
  8057d7:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  8057db:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  8057df:	90                   	nop
  8057e0:	5d                   	pop    rbp
  8057e1:	c3                   	ret    

00000000008057e2 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  8057e2:	f3 0f 1e fa          	endbr64 
  8057e6:	55                   	push   rbp
  8057e7:	48 89 e5             	mov    rbp,rsp
  8057ea:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8057ed:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8057f0:	89 c8                	mov    eax,ecx
  8057f2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  8057f6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  8057fa:	48 8b 05 e7 67 00 00 	mov    rax,QWORD PTR [rip+0x67e7]        # 80bfe8 <gdt>
  805801:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805805:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805808:	48 c1 e0 04          	shl    rax,0x4
  80580c:	48 89 c2             	mov    rdx,rax
  80580f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805813:	48 01 d0             	add    rax,rdx
  805816:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805819:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80581c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80581f:	48 c1 e0 04          	shl    rax,0x4
  805823:	48 89 c2             	mov    rdx,rax
  805826:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80582a:	48 01 d0             	add    rax,rdx
  80582d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805830:	c1 ea 10             	shr    edx,0x10
  805833:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805836:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805839:	48 c1 e0 04          	shl    rax,0x4
  80583d:	48 89 c2             	mov    rdx,rax
  805840:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805844:	48 01 c2             	add    rdx,rax
  805847:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80584b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  80584f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805852:	48 c1 e0 04          	shl    rax,0x4
  805856:	48 89 c2             	mov    rdx,rax
  805859:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80585d:	48 01 c2             	add    rdx,rax
  805860:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805864:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805868:	90                   	nop
  805869:	5d                   	pop    rbp
  80586a:	c3                   	ret    

000000000080586b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80586b:	f3 0f 1e fa          	endbr64 
  80586f:	55                   	push   rbp
  805870:	48 89 e5             	mov    rbp,rsp
  805873:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805876:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805879:	89 d0                	mov    eax,edx
  80587b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  80587f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805883:	90                   	nop
  805884:	5d                   	pop    rbp
  805885:	c3                   	ret    
  805886:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80588d:	00 00 00 

0000000000805890 <fill_desc>:
  805890:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805895:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80589a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80589f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8058a4:	be 00 60 00 00       	mov    esi,0x6000
  8058a9:	c1 e2 03             	shl    edx,0x3
  8058ac:	01 d6                	add    esi,edx
  8058ae:	66 67 89 1e          	mov    WORD PTR [esi],bx
  8058b2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  8058b7:	c1 e8 10             	shr    eax,0x10
  8058ba:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  8058be:	c1 eb 10             	shr    ebx,0x10
  8058c1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  8058c5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  8058c9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  8058cd:	c3                   	ret    

00000000008058ce <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  8058ce:	f3 0f 1e fa          	endbr64 
  8058d2:	55                   	push   rbp
  8058d3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  8058d6:	b8 00 00 00 00       	mov    eax,0x0
  8058db:	e8 b7 23 00 00       	call   807c97 <execute_request>
    do_req();
  8058e0:	b8 00 00 00 00       	mov    eax,0x0
  8058e5:	e8 32 da ff ff       	call   80331c <do_req>
    if(!manage_proc_lock)
  8058ea:	8b 05 98 66 00 00    	mov    eax,DWORD PTR [rip+0x6698]        # 80bf88 <manage_proc_lock>
  8058f0:	85 c0                	test   eax,eax
  8058f2:	75 0a                	jne    8058fe <clock_c+0x30>
    {
        manage_proc();
  8058f4:	b8 00 00 00 00       	mov    eax,0x0
  8058f9:	e8 21 e2 ff ff       	call   803b1f <manage_proc>
    }
    //puts("1 disk req executed.");
  8058fe:	90                   	nop
  8058ff:	5d                   	pop    rbp
  805900:	c3                   	ret    
  805901:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805908:	00 00 00 
  80590b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805910 <clock>:
  805910:	50                   	push   rax
  805911:	53                   	push   rbx
  805912:	51                   	push   rcx
  805913:	52                   	push   rdx
  805914:	57                   	push   rdi
  805915:	56                   	push   rsi
  805916:	41 50                	push   r8
  805918:	41 51                	push   r9
  80591a:	41 52                	push   r10
  80591c:	41 53                	push   r11
  80591e:	41 54                	push   r12
  805920:	41 55                	push   r13
  805922:	41 56                	push   r14
  805924:	41 57                	push   r15
  805926:	e8 cc e1 ff ff       	call   803af7 <save_rsp>
  80592b:	66 8c c0             	mov    ax,es
  80592e:	50                   	push   rax
  80592f:	66 8c d8             	mov    ax,ds
  805932:	50                   	push   rax
  805933:	66 b8 10 00          	mov    ax,0x10
  805937:	8e c0                	mov    es,eax
  805939:	8e d8                	mov    ds,eax

000000000080593b <clock.normal_part>:
  80593b:	b0 20                	mov    al,0x20
  80593d:	e6 a0                	out    0xa0,al
  80593f:	e6 20                	out    0x20,al
  805941:	e8 88 ff ff ff       	call   8058ce <clock_c>
  805946:	58                   	pop    rax
  805947:	8e d8                	mov    ds,eax
  805949:	58                   	pop    rax
  80594a:	8e c0                	mov    es,eax
  80594c:	41 5f                	pop    r15
  80594e:	41 5e                	pop    r14
  805950:	41 5d                	pop    r13
  805952:	41 5c                	pop    r12
  805954:	41 5b                	pop    r11
  805956:	41 5a                	pop    r10
  805958:	41 59                	pop    r9
  80595a:	41 58                	pop    r8
  80595c:	5e                   	pop    rsi
  80595d:	5f                   	pop    rdi
  80595e:	5a                   	pop    rdx
  80595f:	59                   	pop    rcx
  805960:	5b                   	pop    rbx
  805961:	58                   	pop    rax
  805962:	48 cf                	iretq  

0000000000805964 <sys_execve>:
    return ind;
}
*/

int sys_execve(char *path, char *argv)
{
  805964:	f3 0f 1e fa          	endbr64 
  805968:	55                   	push   rbp
  805969:	48 89 e5             	mov    rbp,rsp
  80596c:	48 83 ec 30          	sub    rsp,0x30
  805970:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805974:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805978:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80597f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  805986:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80598a:	be 00 10 00 00       	mov    esi,0x1000
  80598f:	48 89 c7             	mov    rdi,rax
  805992:	e8 1f 14 00 00       	call   806db6 <sys_open>
  805997:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  80599a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80599e:	79 0a                	jns    8059aa <sys_execve+0x46>
  8059a0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8059a5:	e9 ba 00 00 00       	jmp    805a64 <sys_execve+0x100>
    //
    char *p=path;
  8059aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059ae:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  8059b2:	eb 05                	jmp    8059b9 <sys_execve+0x55>
  8059b4:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  8059b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059bd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059c0:	84 c0                	test   al,al
  8059c2:	75 f0                	jne    8059b4 <sys_execve+0x50>
    for(;*p!='/'&&p>path;p--);
  8059c4:	eb 05                	jmp    8059cb <sys_execve+0x67>
  8059c6:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  8059cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059d2:	3c 2f                	cmp    al,0x2f
  8059d4:	74 0a                	je     8059e0 <sys_execve+0x7c>
  8059d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059da:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8059de:	77 e6                	ja     8059c6 <sys_execve+0x62>
    if(p>path)
  8059e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059e4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8059e8:	76 2f                	jbe    805a19 <sys_execve+0xb5>
    {
        *p='\0';
  8059ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059ee:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  8059f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059f5:	be 00 40 00 00       	mov    esi,0x4000
  8059fa:	48 89 c7             	mov    rdi,rax
  8059fd:	e8 b4 13 00 00       	call   806db6 <sys_open>
  805a02:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805a05:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a09:	79 07                	jns    805a12 <sys_execve+0xae>
  805a0b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a10:	eb 52                	jmp    805a64 <sys_execve+0x100>
        *p='/';
  805a12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a16:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805a19:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a1c:	48 63 d0             	movsxd rdx,eax
  805a1f:	48 89 d0             	mov    rax,rdx
  805a22:	48 c1 e0 02          	shl    rax,0x2
  805a26:	48 01 d0             	add    rax,rdx
  805a29:	48 c1 e0 03          	shl    rax,0x3
  805a2d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805a34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a37:	48 63 c8             	movsxd rcx,eax
  805a3a:	48 89 c8             	mov    rax,rcx
  805a3d:	48 c1 e0 02          	shl    rax,0x2
  805a41:	48 01 c8             	add    rax,rcx
  805a44:	48 c1 e0 03          	shl    rax,0x3
  805a48:	48 05 60 06 40 00    	add    rax,0x400660
  805a4e:	b9 e1 5a 80 00       	mov    ecx,0x805ae1
  805a53:	48 89 c6             	mov    rsi,rax
  805a56:	48 89 cf             	mov    rdi,rcx
  805a59:	e8 92 e9 ff ff       	call   8043f0 <reg_proc>
  805a5e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805a61:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805a64:	c9                   	leave  
  805a65:	c3                   	ret    

0000000000805a66 <exec_call>:

int exec_call(char *path)
{
  805a66:	f3 0f 1e fa          	endbr64 
  805a6a:	55                   	push   rbp
  805a6b:	48 89 e5             	mov    rbp,rsp
  805a6e:	48 83 ec 20          	sub    rsp,0x20
  805a72:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= sys_execve(path, NULL);
  805a76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805a7a:	be 00 00 00 00       	mov    esi,0x0
  805a7f:	48 89 c7             	mov    rdi,rax
  805a82:	e8 dd fe ff ff       	call   805964 <sys_execve>
  805a87:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805a8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a8d:	01 c0                	add    eax,eax
  805a8f:	83 c0 05             	add    eax,0x5
  805a92:	c1 e0 03             	shl    eax,0x3
  805a95:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805a98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a9b:	89 c7                	mov    edi,eax
  805a9d:	e8 49 e2 ff ff       	call   803ceb <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805aa2:	90                   	nop
  805aa3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805aa6:	48 63 d0             	movsxd rdx,eax
  805aa9:	48 89 d0             	mov    rax,rdx
  805aac:	48 01 c0             	add    rax,rax
  805aaf:	48 01 d0             	add    rax,rdx
  805ab2:	48 c1 e0 08          	shl    rax,0x8
  805ab6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805abc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805abf:	83 f8 03             	cmp    eax,0x3
  805ac2:	75 df                	jne    805aa3 <exec_call+0x3d>
    return task[pi].exit_code;
  805ac4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ac7:	48 63 d0             	movsxd rdx,eax
  805aca:	48 89 d0             	mov    rax,rdx
  805acd:	48 01 c0             	add    rax,rax
  805ad0:	48 01 d0             	add    rax,rdx
  805ad3:	48 c1 e0 08          	shl    rax,0x8
  805ad7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805add:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805adf:	c9                   	leave  
  805ae0:	c3                   	ret    

0000000000805ae1 <proc_start>:
int proc_start()
{
  805ae1:	f3 0f 1e fa          	endbr64 
  805ae5:	55                   	push   rbp
  805ae6:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805ae9:	8b 05 3d ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea3d]        # 41452c <cur_proc>
  805aef:	48 63 d0             	movsxd rdx,eax
  805af2:	48 89 d0             	mov    rax,rdx
  805af5:	48 01 c0             	add    rax,rax
  805af8:	48 01 d0             	add    rax,rdx
  805afb:	48 c1 e0 08          	shl    rax,0x8
  805aff:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805b05:	48 89 c7             	mov    rdi,rax
  805b08:	e8 0d 00 00 00       	call   805b1a <load_pe>
    //释放进程资源
    sys_exit(0);
  805b0d:	bf 00 00 00 00       	mov    edi,0x0
  805b12:	e8 b1 e8 ff ff       	call   8043c8 <sys_exit>
}
  805b17:	90                   	nop
  805b18:	5d                   	pop    rbp
  805b19:	c3                   	ret    

0000000000805b1a <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  805b1a:	f3 0f 1e fa          	endbr64 
  805b1e:	55                   	push   rbp
  805b1f:	48 89 e5             	mov    rbp,rsp
  805b22:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805b29:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  805b30:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805b37:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805b3e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  805b42:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805b49:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805b50:	eb 28                	jmp    805b7a <load_pe+0x60>
        if(current->openf[i]==f)
  805b52:	48 8b 05 47 e9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e947]        # 4144a0 <current>
  805b59:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805b5c:	48 63 d2             	movsxd rdx,edx
  805b5f:	48 83 c2 18          	add    rdx,0x18
  805b63:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  805b68:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  805b6c:	75 08                	jne    805b76 <load_pe+0x5c>
        {
            exefno=i;
  805b6e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805b71:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  805b74:	eb 0a                	jmp    805b80 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805b76:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805b7a:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  805b7e:	7e d2                	jle    805b52 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  805b80:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805b84:	75 0a                	jne    805b90 <load_pe+0x76>
  805b86:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805b8b:	e9 11 07 00 00       	jmp    8062a1 <load_pe+0x787>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  805b90:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  805b97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b9a:	ba 44 00 00 00       	mov    edx,0x44
  805b9f:	48 89 ce             	mov    rsi,rcx
  805ba2:	89 c7                	mov    edi,eax
  805ba4:	e8 dc 15 00 00       	call   807185 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  805ba9:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  805bb0:	48 89 c1             	mov    rcx,rax
  805bb3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bb6:	ba 00 00 00 00       	mov    edx,0x0
  805bbb:	48 89 ce             	mov    rsi,rcx
  805bbe:	89 c7                	mov    edi,eax
  805bc0:	e8 20 17 00 00       	call   8072e5 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  805bc5:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805bcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bcf:	ba 0c 01 00 00       	mov    edx,0x10c
  805bd4:	48 89 ce             	mov    rsi,rcx
  805bd7:	89 c7                	mov    edi,eax
  805bd9:	e8 a7 15 00 00       	call   807185 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  805bde:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  805be5:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805be9:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  805bef:	c1 e8 0c             	shr    eax,0xc
  805bf2:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  805bf5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bf8:	ba 00 00 00 00       	mov    edx,0x0
  805bfd:	be 00 00 00 00       	mov    esi,0x0
  805c02:	89 c7                	mov    edi,eax
  805c04:	e8 dc 16 00 00       	call   8072e5 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805c09:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  805c0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c10:	ba 00 10 00 00       	mov    edx,0x1000
  805c15:	48 89 ce             	mov    rsi,rcx
  805c18:	89 c7                	mov    edi,eax
  805c1a:	e8 66 15 00 00       	call   807185 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  805c1f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c23:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  805c27:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805c2b:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  805c2f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c33:	48 01 d0             	add    rax,rdx
  805c36:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805c3d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805c44:	48 83 c0 04          	add    rax,0x4
  805c48:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805c4f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805c56:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805c59:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  805c5f:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  805c65:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  805c6b:	85 c0                	test   eax,eax
  805c6d:	0f 48 c2             	cmovs  eax,edx
  805c70:	c1 f8 0c             	sar    eax,0xc
  805c73:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805c79:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805c80:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  805c83:	89 c2                	mov    edx,eax
  805c85:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c89:	48 01 d0             	add    rax,rdx
  805c8c:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805c93:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805c99:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  805c9f:	85 c0                	test   eax,eax
  805ca1:	0f 48 c2             	cmovs  eax,edx
  805ca4:	c1 f8 0a             	sar    eax,0xa
  805ca7:	89 c1                	mov    ecx,eax
  805ca9:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805caf:	99                   	cdq    
  805cb0:	c1 ea 16             	shr    edx,0x16
  805cb3:	01 d0                	add    eax,edx
  805cb5:	25 ff 03 00 00       	and    eax,0x3ff
  805cba:	29 d0                	sub    eax,edx
  805cbc:	01 c8                	add    eax,ecx
  805cbe:	85 c0                	test   eax,eax
  805cc0:	0f 95 c0             	setne  al
  805cc3:	0f b6 c0             	movzx  eax,al
  805cc6:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805ccc:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805cd3:	48 c1 e8 15          	shr    rax,0x15
  805cd7:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  805cdd:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ce4:	89 c0                	mov    eax,eax
  805ce6:	48 05 0c 01 00 00    	add    rax,0x10c
  805cec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805cf0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805cf7:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805cfb:	0f b7 d0             	movzx  edx,ax
  805cfe:	89 d0                	mov    eax,edx
  805d00:	c1 e0 02             	shl    eax,0x2
  805d03:	01 d0                	add    eax,edx
  805d05:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805d08:	05 50 01 00 00       	add    eax,0x150
  805d0d:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  805d13:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d1a:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805d1d:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805d23:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d29:	99                   	cdq    
  805d2a:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805d30:	89 d0                	mov    eax,edx
  805d32:	85 c0                	test   eax,eax
  805d34:	74 23                	je     805d59 <load_pe+0x23f>
  805d36:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d3c:	99                   	cdq    
  805d3d:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805d43:	89 d1                	mov    ecx,edx
  805d45:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d4b:	29 c8                	sub    eax,ecx
  805d4d:	89 c2                	mov    edx,eax
  805d4f:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805d55:	01 d0                	add    eax,edx
  805d57:	eb 06                	jmp    805d5f <load_pe+0x245>
  805d59:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d5f:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805d65:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805d6c:	eb 6b                	jmp    805dd9 <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805d6e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d72:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805d75:	25 00 00 00 02       	and    eax,0x2000000
  805d7a:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  805d80:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  805d87:	75 46                	jne    805dcf <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  805d89:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d8d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805d90:	89 c1                	mov    ecx,eax
  805d92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d95:	ba 00 00 00 00       	mov    edx,0x0
  805d9a:	48 89 ce             	mov    rsi,rcx
  805d9d:	89 c7                	mov    edi,eax
  805d9f:	e8 41 15 00 00       	call   8072e5 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  805da4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805da8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805dab:	89 c2                	mov    edx,eax
  805dad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805db1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805db4:	89 c1                	mov    ecx,eax
  805db6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805dba:	48 01 c8             	add    rax,rcx
  805dbd:	48 89 c1             	mov    rcx,rax
  805dc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dc3:	48 89 ce             	mov    rsi,rcx
  805dc6:	89 c7                	mov    edi,eax
  805dc8:	e8 b8 13 00 00       	call   807185 <sys_read>
  805dcd:	eb 01                	jmp    805dd0 <load_pe+0x2b6>
            continue;
  805dcf:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805dd0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805dd4:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805dd9:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805de0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805de4:	0f b7 c0             	movzx  eax,ax
  805de7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805dea:	7c 82                	jl     805d6e <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805dec:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805df3:	48 05 90 00 00 00    	add    rax,0x90
  805df9:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  805e00:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e07:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805e0a:	85 c0                	test   eax,eax
  805e0c:	0f 84 7b 02 00 00    	je     80608d <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805e12:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e19:	8b 10                	mov    edx,DWORD PTR [rax]
  805e1b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e1f:	01 d0                	add    eax,edx
  805e21:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805e27:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  805e2d:	48 98                	cdqe   
  805e2f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805e33:	e9 47 02 00 00       	jmp    80607f <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805e38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e3c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e3f:	89 c2                	mov    edx,eax
  805e41:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e45:	48 01 d0             	add    rax,rdx
  805e48:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805e4f:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  805e56:	be c8 3b 81 00       	mov    esi,0x813bc8
  805e5b:	48 89 c7             	mov    rdi,rax
  805e5e:	e8 ec 59 00 00       	call   80b84f <strcmp>
  805e63:	85 c0                	test   eax,eax
  805e65:	75 09                	jne    805e70 <load_pe+0x356>
            {
                dllp=0x1c00000;
  805e67:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805e6e:	eb 25                	jmp    805e95 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805e70:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805e77:	48 89 c7             	mov    rdi,rax
  805e7a:	e8 9b fc ff ff       	call   805b1a <load_pe>
  805e7f:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805e85:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  805e8b:	89 c7                	mov    edi,eax
  805e8d:	e8 11 04 00 00       	call   8062a3 <get_module_addr>
  805e92:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805e95:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805e98:	48 98                	cdqe   
  805e9a:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805ea1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ea4:	48 63 d0             	movsxd rdx,eax
  805ea7:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  805eae:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805eb2:	48 01 d0             	add    rax,rdx
  805eb5:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  805ebc:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805ec3:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  805ec9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ecc:	01 d0                	add    eax,edx
  805ece:	89 c0                	mov    eax,eax
  805ed0:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  805ed7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805ede:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805ee1:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805ee7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805eee:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805ef1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ef4:	01 d0                	add    eax,edx
  805ef6:	89 c0                	mov    eax,eax
  805ef8:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805eff:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f06:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805f09:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f0c:	01 d0                	add    eax,edx
  805f0e:	89 c0                	mov    eax,eax
  805f10:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805f17:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f1e:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805f21:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f24:	01 d0                	add    eax,edx
  805f26:	89 c0                	mov    eax,eax
  805f28:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805f2f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f36:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f39:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805f3f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f43:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f46:	89 c2                	mov    edx,eax
  805f48:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805f4c:	48 01 d0             	add    rax,rdx
  805f4f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805f53:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f57:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f5a:	89 c2                	mov    edx,eax
  805f5c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805f60:	48 01 d0             	add    rax,rdx
  805f63:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805f67:	e9 00 01 00 00       	jmp    80606c <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805f6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f70:	8b 00                	mov    eax,DWORD PTR [rax]
  805f72:	85 c0                	test   eax,eax
  805f74:	79 43                	jns    805fb9 <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805f76:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f7a:	8b 00                	mov    eax,DWORD PTR [rax]
  805f7c:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805f81:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  805f87:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805f8d:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  805f93:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805f9a:	00 
  805f9b:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805fa2:	48 01 d0             	add    rax,rdx
  805fa5:	8b 10                	mov    edx,DWORD PTR [rax]
  805fa7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805faa:	01 d0                	add    eax,edx
  805fac:	89 c2                	mov    edx,eax
  805fae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fb2:	89 10                	mov    DWORD PTR [rax],edx
  805fb4:	e9 a9 00 00 00       	jmp    806062 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805fb9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fbd:	8b 00                	mov    eax,DWORD PTR [rax]
  805fbf:	89 c0                	mov    eax,eax
  805fc1:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805fc8:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  805fcf:	02 
                    int i=0;
  805fd0:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805fd7:	eb 7a                	jmp    806053 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805fd9:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805fdc:	48 98                	cdqe   
  805fde:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fe5:	00 
  805fe6:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  805fed:	48 01 d0             	add    rax,rdx
  805ff0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805ff3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  805ffa:	48 89 d6             	mov    rsi,rdx
  805ffd:	48 89 c7             	mov    rdi,rax
  806000:	e8 4a 58 00 00       	call   80b84f <strcmp>
  806005:	85 c0                	test   eax,eax
  806007:	75 46                	jne    80604f <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  806009:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80600c:	48 98                	cdqe   
  80600e:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806012:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  806019:	48 01 d0             	add    rax,rdx
  80601c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80601f:	98                   	cwde   
  806020:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  806026:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80602c:	48 98                	cdqe   
  80602e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806035:	00 
  806036:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80603d:	48 01 d0             	add    rax,rdx
  806040:	8b 10                	mov    edx,DWORD PTR [rax]
  806042:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806045:	01 d0                	add    eax,edx
  806047:	89 c2                	mov    edx,eax
  806049:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80604d:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  80604f:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  806053:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806056:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  80605c:	0f 8c 77 ff ff ff    	jl     805fd9 <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  806062:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  806067:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80606c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806070:	8b 00                	mov    eax,DWORD PTR [rax]
  806072:	85 c0                	test   eax,eax
  806074:	0f 85 f2 fe ff ff    	jne    805f6c <load_pe+0x452>
            }
            impdes++;
  80607a:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  80607f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806083:	8b 00                	mov    eax,DWORD PTR [rax]
  806085:	85 c0                	test   eax,eax
  806087:	0f 85 ab fd ff ff    	jne    805e38 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80608d:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  806094:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  806095:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80609c:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  8060a2:	85 c0                	test   eax,eax
  8060a4:	0f 84 ec 00 00 00    	je     806196 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8060aa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060b1:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  8060b7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8060bb:	01 d0                	add    eax,edx
  8060bd:	89 c0                	mov    eax,eax
  8060bf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8060c3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8060c7:	48 83 c0 40          	add    rax,0x40
  8060cb:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8060cf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8060d3:	48 83 c0 02          	add    rax,0x2
  8060d7:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8060db:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060e2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8060e6:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  8060ec:	e9 97 00 00 00       	jmp    806188 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  8060f1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8060f5:	8b 10                	mov    edx,DWORD PTR [rax]
  8060f7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8060fb:	01 d0                	add    eax,edx
  8060fd:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806103:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80610a:	eb 5a                	jmp    806166 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80610c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806110:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806113:	66 85 c0             	test   ax,ax
  806116:	74 49                	je     806161 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806118:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80611c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80611f:	0f b7 d0             	movzx  edx,ax
  806122:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  806128:	01 d0                	add    eax,edx
  80612a:	48 98                	cdqe   
  80612c:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  806133:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  80613a:	8b 00                	mov    eax,DWORD PTR [rax]
  80613c:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  806142:	89 c2                	mov    edx,eax
  806144:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806148:	01 d0                	add    eax,edx
  80614a:	89 c2                	mov    edx,eax
  80614c:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  806153:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  806155:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80615a:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  80615f:	eb 01                	jmp    806162 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  806161:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806162:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  806166:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80616a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80616d:	c1 e8 02             	shr    eax,0x2
  806170:	89 c2                	mov    edx,eax
  806172:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  806175:	39 c2                	cmp    edx,eax
  806177:	77 93                	ja     80610c <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  806179:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80617d:	05 00 10 00 00       	add    eax,0x1000
  806182:	48 98                	cdqe   
  806184:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  806188:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80618c:	8b 00                	mov    eax,DWORD PTR [rax]
  80618e:	85 c0                	test   eax,eax
  806190:	0f 85 5b ff ff ff    	jne    8060f1 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  806196:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80619d:	00 00 00 
  8061a0:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8061a7:	00 00 00 
  8061aa:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8061b1:	00 00 00 00 
  8061b5:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8061bc:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8061c0:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8061c7:	ba 18 00 00 00       	mov    edx,0x18
  8061cc:	48 89 c6             	mov    rsi,rax
  8061cf:	bf 00 00 00 01       	mov    edi,0x1000000
  8061d4:	e8 d8 53 00 00       	call   80b5b1 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8061d9:	8b 05 4d e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e34d]        # 41452c <cur_proc>
  8061df:	48 63 d0             	movsxd rdx,eax
  8061e2:	48 89 d0             	mov    rax,rdx
  8061e5:	48 01 c0             	add    rax,rax
  8061e8:	48 01 d0             	add    rax,rdx
  8061eb:	48 c1 e0 08          	shl    rax,0x8
  8061ef:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8061f5:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8061fc:	8b 05 2a e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e32a]        # 41452c <cur_proc>
  806202:	48 63 d0             	movsxd rdx,eax
  806205:	48 89 d0             	mov    rax,rdx
  806208:	48 01 c0             	add    rax,rax
  80620b:	48 01 d0             	add    rax,rdx
  80620e:	48 c1 e0 08          	shl    rax,0x8
  806212:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806218:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  80621f:	8b 05 07 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e307]        # 41452c <cur_proc>
  806225:	48 63 d0             	movsxd rdx,eax
  806228:	48 89 d0             	mov    rax,rdx
  80622b:	48 01 c0             	add    rax,rax
  80622e:	48 01 d0             	add    rax,rdx
  806231:	48 c1 e0 08          	shl    rax,0x8
  806235:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80623b:	c7 40 10 00 f0 ff ff 	mov    DWORD PTR [rax+0x10],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  806242:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806249:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  806250:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  806257:	be 00 00 00 00       	mov    esi,0x0
  80625c:	bf 00 00 00 00       	mov    edi,0x0
  806261:	ff d0                	call   rax
  806263:	8b 15 c3 e2 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0e2c3]        # 41452c <cur_proc>
  806269:	89 c1                	mov    ecx,eax
  80626b:	48 63 d2             	movsxd rdx,edx
  80626e:	48 89 d0             	mov    rax,rdx
  806271:	48 01 c0             	add    rax,rax
  806274:	48 01 d0             	add    rax,rdx
  806277:	48 c1 e0 08          	shl    rax,0x8
  80627b:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806281:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  806283:	8b 05 a3 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2a3]        # 41452c <cur_proc>
  806289:	48 63 d0             	movsxd rdx,eax
  80628c:	48 89 d0             	mov    rax,rdx
  80628f:	48 01 c0             	add    rax,rax
  806292:	48 01 d0             	add    rax,rdx
  806295:	48 c1 e0 08          	shl    rax,0x8
  806299:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80629f:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8062a1:	c9                   	leave  
  8062a2:	c3                   	ret    

00000000008062a3 <get_module_addr>:

int get_module_addr(int mi)
{
  8062a3:	f3 0f 1e fa          	endbr64 
  8062a7:	55                   	push   rbp
  8062a8:	48 89 e5             	mov    rbp,rsp
  8062ab:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  8062ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062b1:	48 98                	cdqe   
  8062b3:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  8062ba:	5d                   	pop    rbp
  8062bb:	c3                   	ret    

00000000008062bc <dispose_library>:
int dispose_library(int dlln)
{
  8062bc:	f3 0f 1e fa          	endbr64 
  8062c0:	55                   	push   rbp
  8062c1:	48 89 e5             	mov    rbp,rsp
  8062c4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  8062c7:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8062cb:	78 09                	js     8062d6 <dispose_library+0x1a>
  8062cd:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  8062d4:	7e 07                	jle    8062dd <dispose_library+0x21>
  8062d6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8062db:	eb 1d                	jmp    8062fa <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  8062dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062e0:	48 98                	cdqe   
  8062e2:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8062e9:	48 05 48 45 41 00    	add    rax,0x414548
  8062ef:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8062f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8062fa:	5d                   	pop    rbp
  8062fb:	c3                   	ret    

00000000008062fc <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8062fc:	f3 0f 1e fa          	endbr64 
  806300:	55                   	push   rbp
  806301:	48 89 e5             	mov    rbp,rsp
  806304:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806308:	90                   	nop
  806309:	5d                   	pop    rbp
  80630a:	c3                   	ret    

000000000080630b <sys_rmmod>:
int sys_rmmod(char *name)
{
  80630b:	f3 0f 1e fa          	endbr64 
  80630f:	55                   	push   rbp
  806310:	48 89 e5             	mov    rbp,rsp
  806313:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806317:	90                   	nop
  806318:	5d                   	pop    rbp
  806319:	c3                   	ret    
  80631a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000806320 <_syscall>:
  806320:	55                   	push   rbp
  806321:	bd 00 80 10 00       	mov    ebp,0x108000
  806326:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80632a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80632e:	41 53                	push   r11
  806330:	51                   	push   rcx
  806331:	49 87 ca             	xchg   r10,rcx
  806334:	e8 61 a2 ff ff       	call   80059a <syscall>
  806339:	4c 87 d1             	xchg   rcx,r10
  80633c:	59                   	pop    rcx
  80633d:	41 5b                	pop    r11
  80633f:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  806343:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  806347:	5d                   	pop    rbp
  806348:	fb                   	sti    
  806349:	48 0f 07             	sysretq 

000000000080634c <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  80634c:	f3 0f 1e fa          	endbr64 
  806350:	55                   	push   rbp
  806351:	48 89 e5             	mov    rbp,rsp
  806354:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806358:	8b 05 f6 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc211f6]        # 427554 <framebuffer+0x14>
  80635e:	89 c0                	mov    eax,eax
  806360:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  806364:	8b 05 ee 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc211ee]        # 427558 <framebuffer+0x18>
  80636a:	89 c0                	mov    eax,eax
  80636c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  806370:	0f b6 05 e5 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211e5]        # 42755c <framebuffer+0x1c>
  806377:	c0 e8 03             	shr    al,0x3
  80637a:	0f b6 c0             	movzx  eax,al
  80637d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  806381:	8b 05 c9 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc211c9]        # 427550 <framebuffer+0x10>
  806387:	89 c0                	mov    eax,eax
  806389:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  80638d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806391:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806396:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80639a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80639e:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  8063a3:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  8063a7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063ab:	48 c1 e8 0c          	shr    rax,0xc
  8063af:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  8063b2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  8063b9:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  8063ba:	48 8b 05 87 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21187]        # 427548 <framebuffer+0x8>
  8063c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8063c5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8063cc:	00 
  8063cd:	eb 2d                	jmp    8063fc <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8063cf:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8063d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8063d7:	ba 07 00 00 00       	mov    edx,0x7
  8063dc:	48 89 ce             	mov    rsi,rcx
  8063df:	48 89 c7             	mov    rdi,rax
  8063e2:	e8 fe aa ff ff       	call   800ee5 <mmap>
        pp+=PAGE_SIZE;
  8063e7:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8063ee:	00 
        p+=PAGE_SIZE;
  8063ef:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8063f6:	00 
    for (size_t i = 0; i < pgc; i++)
  8063f7:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8063fc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8063ff:	48 98                	cdqe   
  806401:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806405:	72 c8                	jb     8063cf <init_framebuffer+0x83>
    }
    
    
}
  806407:	90                   	nop
  806408:	90                   	nop
  806409:	c9                   	leave  
  80640a:	c3                   	ret    

000000000080640b <init_font>:
void init_font(){
  80640b:	f3 0f 1e fa          	endbr64 
  80640f:	55                   	push   rbp
  806410:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  806413:	48 c7 05 62 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21162],0x80c2a0        # 427580 <boot_font>
  80641a:	a0 c2 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  80641e:	48 8b 05 5b 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2115b]        # 427580 <boot_font>
  806425:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  806428:	83 c0 07             	add    eax,0x7
  80642b:	c1 e8 03             	shr    eax,0x3
  80642e:	89 05 5c 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2115c],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  806434:	8b 05 56 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21156]        # 427590 <font_width_bytes>
  80643a:	c1 e0 03             	shl    eax,0x3
  80643d:	89 05 45 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21145],eax        # 427588 <font_width>
    font_height = boot_font->height;
  806443:	48 8b 05 36 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21136]        # 427580 <boot_font>
  80644a:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80644d:	89 05 39 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21139],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  806453:	48 8b 05 26 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21126]        # 427580 <boot_font>
  80645a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80645d:	89 c0                	mov    eax,eax
  80645f:	48 05 a0 c2 80 00    	add    rax,0x80c2a0
  806465:	48 89 05 2c 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2112c],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  80646c:	48 8b 05 0d 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2110d]        # 427580 <boot_font>
  806473:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806476:	89 05 28 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21128],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  80647c:	48 8b 05 fd 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc210fd]        # 427580 <boot_font>
  806483:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806486:	89 05 14 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21114],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  80648c:	c7 05 da 10 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc210da],0x0        # 427570 <fb_cursor_y>
  806493:	00 00 00 
  806496:	8b 05 d4 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210d4]        # 427570 <fb_cursor_y>
  80649c:	89 05 ca 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210ca],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  8064a2:	8b 05 ac 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210ac]        # 427554 <framebuffer+0x14>
  8064a8:	8b 0d da 10 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc210da]        # 427588 <font_width>
  8064ae:	ba 00 00 00 00       	mov    edx,0x0
  8064b3:	f7 f1                	div    ecx
  8064b5:	89 05 b9 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210b9],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8064bb:	8b 05 97 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21097]        # 427558 <framebuffer+0x18>
  8064c1:	8b 35 c5 10 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc210c5]        # 42758c <font_height>
  8064c7:	ba 00 00 00 00       	mov    edx,0x0
  8064cc:	f7 f6                	div    esi
  8064ce:	89 05 a4 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210a4],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  8064d4:	c7 05 12 5b 00 00 01 	mov    DWORD PTR [rip+0x5b12],0x1        # 80bff0 <font_size>
  8064db:	00 00 00 
}
  8064de:	90                   	nop
  8064df:	5d                   	pop    rbp
  8064e0:	c3                   	ret    

00000000008064e1 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8064e1:	f3 0f 1e fa          	endbr64 
  8064e5:	55                   	push   rbp
  8064e6:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8064e9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8064ed:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8064f1:	48 89 05 48 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21048],rax        # 427540 <framebuffer>
  8064f8:	48 89 15 49 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21049],rdx        # 427548 <framebuffer+0x8>
  8064ff:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  806503:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  806507:	48 89 05 42 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21042],rax        # 427550 <framebuffer+0x10>
  80650e:	48 89 15 43 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21043],rdx        # 427558 <framebuffer+0x18>
  806515:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  806519:	48 89 05 40 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21040],rax        # 427560 <framebuffer+0x20>
}
  806520:	90                   	nop
  806521:	5d                   	pop    rbp
  806522:	c3                   	ret    

0000000000806523 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  806523:	f3 0f 1e fa          	endbr64 
  806527:	55                   	push   rbp
  806528:	48 89 e5             	mov    rbp,rsp
  80652b:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80652e:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  806531:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806534:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806537:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80653b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806542:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806543:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806546:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806549:	eb 64                	jmp    8065af <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80654b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80654e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806551:	eb 4b                	jmp    80659e <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806553:	8b 15 f7 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20ff7]        # 427550 <framebuffer+0x10>
  806559:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80655c:	0f af c2             	imul   eax,edx
  80655f:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806561:	0f b6 05 f4 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ff4]        # 42755c <framebuffer+0x1c>
  806568:	0f b6 c0             	movzx  eax,al
  80656b:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  80656f:	8d 50 07             	lea    edx,[rax+0x7]
  806572:	85 c0                	test   eax,eax
  806574:	0f 48 c2             	cmovs  eax,edx
  806577:	c1 f8 03             	sar    eax,0x3
  80657a:	48 98                	cdqe   
  80657c:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80657f:	48 05 00 00 00 40    	add    rax,0x40000000
  806585:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806589:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80658d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806591:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806595:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806598:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80659a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80659e:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8065a1:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8065a4:	01 d0                	add    eax,edx
  8065a6:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8065a9:	7c a8                	jl     806553 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  8065ab:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8065af:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  8065b2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8065b5:	01 d0                	add    eax,edx
  8065b7:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8065ba:	7c 8f                	jl     80654b <fill_rect+0x28>
        }
    }
}
  8065bc:	90                   	nop
  8065bd:	90                   	nop
  8065be:	5d                   	pop    rbp
  8065bf:	c3                   	ret    

00000000008065c0 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8065c0:	f3 0f 1e fa          	endbr64 
  8065c4:	55                   	push   rbp
  8065c5:	48 89 e5             	mov    rbp,rsp
  8065c8:	48 83 ec 30          	sub    rsp,0x30
  8065cc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8065cf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8065d2:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8065d5:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8065d9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8065dc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8065df:	eb 5a                	jmp    80663b <draw_text+0x7b>
    {
        if(*str=='\n')
  8065e1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8065e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8065e8:	3c 0a                	cmp    al,0xa
  8065ea:	75 1c                	jne    806608 <draw_text+0x48>
        {
            y+=font_height*size;
  8065ec:	8b 15 9a 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20f9a]        # 42758c <font_height>
  8065f2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8065f5:	0f af d0             	imul   edx,eax
  8065f8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065fb:	01 d0                	add    eax,edx
  8065fd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  806600:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806603:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806606:	eb 2e                	jmp    806636 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  806608:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80660c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80660f:	0f be c8             	movsx  ecx,al
  806612:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806615:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  806618:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80661b:	89 c7                	mov    edi,eax
  80661d:	e8 28 00 00 00       	call   80664a <draw_letter>
            tx+=size*font_width;
  806622:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806625:	8b 05 5d 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f5d]        # 427588 <font_width>
  80662b:	0f af d0             	imul   edx,eax
  80662e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806631:	01 d0                	add    eax,edx
  806633:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  806636:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  80663b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80663f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806642:	84 c0                	test   al,al
  806644:	75 9b                	jne    8065e1 <draw_text+0x21>
    }
}
  806646:	90                   	nop
  806647:	90                   	nop
  806648:	c9                   	leave  
  806649:	c3                   	ret    

000000000080664a <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  80664a:	f3 0f 1e fa          	endbr64 
  80664e:	55                   	push   rbp
  80664f:	48 89 e5             	mov    rbp,rsp
  806652:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  806655:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806658:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  80665b:	89 c8                	mov    eax,ecx
  80665d:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  806660:	48 8b 05 31 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20f31]        # 427598 <glyph_table>
  806667:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  80666b:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  80666f:	8b 05 2f 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f2f]        # 4275a4 <glyph_nr>
  806675:	39 c2                	cmp    edx,eax
  806677:	73 13                	jae    80668c <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806679:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  80667d:	8b 05 1d 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f1d]        # 4275a0 <bytes_per_glyph>
  806683:	0f af c2             	imul   eax,edx
  806686:	89 c0                	mov    eax,eax
  806688:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  80668c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806693:	e9 cb 00 00 00       	jmp    806763 <draw_letter+0x119>
        u8 mask = 1 << 7;
  806698:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  80669c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8066a3:	e9 9c 00 00 00       	jmp    806744 <draw_letter+0xfa>
            int px=x+ch_x*size;
  8066a8:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8066ab:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8066af:	89 c2                	mov    edx,eax
  8066b1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8066b4:	01 d0                	add    eax,edx
  8066b6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8066b9:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8066bc:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8066c0:	89 c2                	mov    edx,eax
  8066c2:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8066c5:	01 d0                	add    eax,edx
  8066c7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8066ca:	8b 15 80 0e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20e80]        # 427550 <framebuffer+0x10>
  8066d0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8066d3:	0f af c2             	imul   eax,edx
  8066d6:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  8066d8:	0f b6 05 7d 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e7d]        # 42755c <framebuffer+0x1c>
  8066df:	0f b6 c0             	movzx  eax,al
  8066e2:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  8066e6:	8d 50 07             	lea    edx,[rax+0x7]
  8066e9:	85 c0                	test   eax,eax
  8066eb:	0f 48 c2             	cmovs  eax,edx
  8066ee:	c1 f8 03             	sar    eax,0x3
  8066f1:	48 98                	cdqe   
  8066f3:	48 01 c8             	add    rax,rcx
  8066f6:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8066fc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  806700:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806703:	c1 e8 03             	shr    eax,0x3
  806706:	89 c2                	mov    edx,eax
  806708:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80670c:	48 01 d0             	add    rax,rdx
  80670f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806712:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  806715:	84 c0                	test   al,al
  806717:	74 0c                	je     806725 <draw_letter+0xdb>
                *ptr=-1;
  806719:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80671d:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  806723:	eb 0a                	jmp    80672f <draw_letter+0xe5>
            } else {
                *ptr=0;
  806725:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806729:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  80672f:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  806732:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806735:	83 e0 07             	and    eax,0x7
  806738:	85 c0                	test   eax,eax
  80673a:	75 04                	jne    806740 <draw_letter+0xf6>
                mask = 1 << 7;
  80673c:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806740:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806744:	8b 05 3e 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e3e]        # 427588 <font_width>
  80674a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80674d:	0f 82 55 ff ff ff    	jb     8066a8 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  806753:	8b 05 37 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e37]        # 427590 <font_width_bytes>
  806759:	89 c0                	mov    eax,eax
  80675b:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  80675f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806763:	8b 05 23 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e23]        # 42758c <font_height>
  806769:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80676c:	0f 82 26 ff ff ff    	jb     806698 <draw_letter+0x4e>
    }
}
  806772:	90                   	nop
  806773:	90                   	nop
  806774:	5d                   	pop    rbp
  806775:	c3                   	ret    

0000000000806776 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806776:	f3 0f 1e fa          	endbr64 
  80677a:	55                   	push   rbp
  80677b:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  80677e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806785:	eb 71                	jmp    8067f8 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806787:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80678e:	eb 57                	jmp    8067e7 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  806790:	8b 15 ba 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20dba]        # 427550 <framebuffer+0x10>
  806796:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806799:	0f af c2             	imul   eax,edx
  80679c:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  80679e:	0f b6 05 b7 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20db7]        # 42755c <framebuffer+0x1c>
  8067a5:	0f b6 c0             	movzx  eax,al
  8067a8:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8067ac:	8d 50 07             	lea    edx,[rax+0x7]
  8067af:	85 c0                	test   eax,eax
  8067b1:	0f 48 c2             	cmovs  eax,edx
  8067b4:	c1 f8 03             	sar    eax,0x3
  8067b7:	48 98                	cdqe   
  8067b9:	48 01 c8             	add    rax,rcx
  8067bc:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  8067c2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  8067c6:	8b 05 84 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d84]        # 427550 <framebuffer+0x10>
  8067cc:	89 c2                	mov    edx,eax
  8067ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067d2:	48 01 d0             	add    rax,rdx
  8067d5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8067d8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067dc:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  8067de:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  8067e3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8067e7:	8b 15 67 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20d67]        # 427554 <framebuffer+0x14>
  8067ed:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8067f0:	39 c2                	cmp    edx,eax
  8067f2:	77 9c                	ja     806790 <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  8067f4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8067f8:	8b 05 5a 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d5a]        # 427558 <framebuffer+0x18>
  8067fe:	8d 50 ff             	lea    edx,[rax-0x1]
  806801:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806804:	39 c2                	cmp    edx,eax
  806806:	0f 87 7b ff ff ff    	ja     806787 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  80680c:	90                   	nop
  80680d:	90                   	nop
  80680e:	5d                   	pop    rbp
  80680f:	c3                   	ret    

0000000000806810 <scr_down>:
void scr_down(){
  806810:	f3 0f 1e fa          	endbr64 
  806814:	55                   	push   rbp
  806815:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806818:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  80681f:	eb 72                	jmp    806893 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806821:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806828:	eb 58                	jmp    806882 <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
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
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  80685c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806860:	8b 05 ea 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cea]        # 427550 <framebuffer+0x10>
  806866:	89 c0                	mov    eax,eax
  806868:	48 f7 d8             	neg    rax
  80686b:	48 89 c2             	mov    rdx,rax
  80686e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806872:	48 01 d0             	add    rax,rdx
  806875:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806878:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80687c:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80687e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806882:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806885:	8b 05 e9 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ce9]        # 427574 <max_ch_nr_x>
  80688b:	39 c2                	cmp    edx,eax
  80688d:	72 9b                	jb     80682a <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  80688f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806893:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806896:	8b 05 dc 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cdc]        # 427578 <max_ch_nr_y>
  80689c:	39 c2                	cmp    edx,eax
  80689e:	72 81                	jb     806821 <scr_down+0x11>
        }

    }
}
  8068a0:	90                   	nop
  8068a1:	90                   	nop
  8068a2:	5d                   	pop    rbp
  8068a3:	c3                   	ret    

00000000008068a4 <print>:
void print(char* s){
  8068a4:	f3 0f 1e fa          	endbr64 
  8068a8:	55                   	push   rbp
  8068a9:	48 89 e5             	mov    rbp,rsp
  8068ac:	48 83 ec 08          	sub    rsp,0x8
  8068b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  8068b4:	e9 c4 00 00 00       	jmp    80697d <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  8068b9:	8b 15 ad 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20cad]        # 42756c <fb_cursor_x>
  8068bf:	8b 05 af 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20caf]        # 427574 <max_ch_nr_x>
  8068c5:	39 c2                	cmp    edx,eax
  8068c7:	77 0b                	ja     8068d4 <print+0x30>
  8068c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068d0:	3c 0a                	cmp    al,0xa
  8068d2:	75 19                	jne    8068ed <print+0x49>
        {
            fb_cursor_y+=1;
  8068d4:	8b 05 96 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c96]        # 427570 <fb_cursor_y>
  8068da:	83 c0 01             	add    eax,0x1
  8068dd:	89 05 8d 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c8d],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  8068e3:	c7 05 7f 0c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20c7f],0x0        # 42756c <fb_cursor_x>
  8068ea:	00 00 00 
        }
        if(*s=='\n')continue;
  8068ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068f4:	3c 0a                	cmp    al,0xa
  8068f6:	74 7f                	je     806977 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  8068f8:	8b 05 7a 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c7a]        # 427578 <max_ch_nr_y>
  8068fe:	8d 50 ff             	lea    edx,[rax-0x1]
  806901:	8b 05 69 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c69]        # 427570 <fb_cursor_y>
  806907:	39 c2                	cmp    edx,eax
  806909:	77 0a                	ja     806915 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  80690b:	c7 05 5b 0c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20c5b],0x0        # 427570 <fb_cursor_y>
  806912:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806915:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806919:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80691c:	0f be d0             	movsx  edx,al
  80691f:	8b 05 cb 56 00 00    	mov    eax,DWORD PTR [rip+0x56cb]        # 80bff0 <font_size>
  806925:	8b 35 45 0c c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20c45]        # 427570 <fb_cursor_y>
  80692b:	8b 0d 5b 0c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20c5b]        # 42758c <font_height>
  806931:	0f af ce             	imul   ecx,esi
  806934:	8b 35 b6 56 00 00    	mov    esi,DWORD PTR [rip+0x56b6]        # 80bff0 <font_size>
  80693a:	0f af ce             	imul   ecx,esi
  80693d:	41 89 c8             	mov    r8d,ecx
  806940:	8b 35 26 0c c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20c26]        # 42756c <fb_cursor_x>
  806946:	8b 0d 3c 0c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20c3c]        # 427588 <font_width>
  80694c:	0f af ce             	imul   ecx,esi
  80694f:	8b 35 9b 56 00 00    	mov    esi,DWORD PTR [rip+0x569b]        # 80bff0 <font_size>
  806955:	0f af ce             	imul   ecx,esi
  806958:	89 cf                	mov    edi,ecx
  80695a:	89 d1                	mov    ecx,edx
  80695c:	89 c2                	mov    edx,eax
  80695e:	44 89 c6             	mov    esi,r8d
  806961:	e8 e4 fc ff ff       	call   80664a <draw_letter>
        fb_cursor_x+=1;
  806966:	8b 05 00 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c00]        # 42756c <fb_cursor_x>
  80696c:	83 c0 01             	add    eax,0x1
  80696f:	89 05 f7 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bf7],eax        # 42756c <fb_cursor_x>
  806975:	eb 01                	jmp    806978 <print+0xd4>
        if(*s=='\n')continue;
  806977:	90                   	nop
    for(;*s;s++){
  806978:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80697d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806981:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806984:	84 c0                	test   al,al
  806986:	0f 85 2d ff ff ff    	jne    8068b9 <print+0x15>
    }
}
  80698c:	90                   	nop
  80698d:	90                   	nop
  80698e:	c9                   	leave  
  80698f:	c3                   	ret    

0000000000806990 <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806990:	f3 0f 1e fa          	endbr64 
  806994:	55                   	push   rbp
  806995:	48 89 e5             	mov    rbp,rsp
  806998:	48 83 ec 50          	sub    rsp,0x50
  80699c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8069a0:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  8069a4:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8069ab:	00 
    int tmpnamelen = 0;
  8069ac:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  8069b3:	48 8b 05 ee 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bee]        # 4275a8 <root_sb>
  8069ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8069bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  8069c1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8069c8:	00 

    while(*name == '/')
  8069c9:	eb 05                	jmp    8069d0 <path_walk+0x40>
        name++;
  8069cb:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  8069d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8069d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069d7:	3c 2f                	cmp    al,0x2f
  8069d9:	74 f0                	je     8069cb <path_walk+0x3b>

    if(!*name)
  8069db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8069df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069e2:	84 c0                	test   al,al
  8069e4:	75 09                	jne    8069ef <path_walk+0x5f>
    {
        return parent;
  8069e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069ea:	e9 1b 02 00 00       	jmp    806c0a <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8069ef:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8069f3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8069f7:	eb 05                	jmp    8069fe <path_walk+0x6e>
            name++;
  8069f9:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8069fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a02:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a05:	84 c0                	test   al,al
  806a07:	74 0b                	je     806a14 <path_walk+0x84>
  806a09:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a0d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a10:	3c 2f                	cmp    al,0x2f
  806a12:	75 e5                	jne    8069f9 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806a14:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a18:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806a1c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806a1f:	be 00 00 00 00       	mov    esi,0x0
  806a24:	bf 48 00 00 00       	mov    edi,0x48
  806a29:	b8 00 00 00 00       	mov    eax,0x0
  806a2e:	e8 77 a8 ff ff       	call   8012aa <vmalloc>
  806a33:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806a37:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806a3b:	ba 48 00 00 00       	mov    edx,0x48
  806a40:	be 00 00 00 00       	mov    esi,0x0
  806a45:	48 89 c7             	mov    rdi,rax
  806a48:	e8 13 4c 00 00       	call   80b660 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806a4d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a50:	83 c0 01             	add    eax,0x1
  806a53:	be 00 00 00 00       	mov    esi,0x0
  806a58:	89 c7                	mov    edi,eax
  806a5a:	b8 00 00 00 00       	mov    eax,0x0
  806a5f:	e8 46 a8 ff ff       	call   8012aa <vmalloc>
  806a64:	48 89 c2             	mov    rdx,rax
  806a67:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806a6b:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806a6e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a71:	83 c0 01             	add    eax,0x1
  806a74:	48 63 d0             	movsxd rdx,eax
  806a77:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806a7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806a7e:	be 00 00 00 00       	mov    esi,0x0
  806a83:	48 89 c7             	mov    rdi,rax
  806a86:	e8 d5 4b 00 00       	call   80b660 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806a8b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806a8e:	48 63 d0             	movsxd rdx,eax
  806a91:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806a95:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806a98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a9c:	48 89 ce             	mov    rsi,rcx
  806a9f:	48 89 c7             	mov    rdi,rax
  806aa2:	e8 0a 4b 00 00       	call   80b5b1 <memcpy>
        path->name_length = tmpnamelen;
  806aa7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806aab:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806aae:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806ab1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ab5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806ab9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806abd:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  806ac1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ac5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806ac9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806acd:	48 89 d6             	mov    rsi,rdx
  806ad0:	48 89 c7             	mov    rdi,rax
  806ad3:	ff d1                	call   rcx
  806ad5:	48 85 c0             	test   rax,rax
  806ad8:	75 3e                	jne    806b18 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  806ada:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ade:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806ae1:	48 89 c6             	mov    rsi,rax
  806ae4:	bf d0 3b 81 00       	mov    edi,0x813bd0
  806ae9:	b8 00 00 00 00       	mov    eax,0x0
  806aee:	e8 25 a2 ff ff       	call   800d18 <printf>
            vmfree(path->name);
  806af3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806af7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806afa:	48 89 c7             	mov    rdi,rax
  806afd:	e8 37 a8 ff ff       	call   801339 <vmfree>
            vmfree(path);
  806b02:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b06:	48 89 c7             	mov    rdi,rax
  806b09:	e8 2b a8 ff ff       	call   801339 <vmfree>
            return NULL;
  806b0e:	b8 00 00 00 00       	mov    eax,0x0
  806b13:	e9 f2 00 00 00       	jmp    806c0a <path_walk+0x27a>
        }

        list_init(&path->child_node);
  806b18:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b1c:	48 83 c0 10          	add    rax,0x10
  806b20:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806b24:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806b28:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806b2c:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806b2f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806b33:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806b37:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806b3b:	90                   	nop
        list_init(&path->subdirs_list);
  806b3c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b40:	48 83 c0 20          	add    rax,0x20
  806b44:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  806b48:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806b4c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806b50:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806b53:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806b57:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806b5b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806b5f:	90                   	nop
        path->parent = parent;
  806b60:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b64:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806b68:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  806b6c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b70:	48 83 c0 10          	add    rax,0x10
  806b74:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806b78:	48 83 c2 20          	add    rdx,0x20
  806b7c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806b80:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  806b84:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b88:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  806b8c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806b90:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  806b94:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806b98:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806b9c:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  806b9f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806ba3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806ba7:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806bab:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  806bae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806bb2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806bb6:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806bba:	90                   	nop

        if(!*name)
  806bbb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806bbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bc2:	84 c0                	test   al,al
  806bc4:	74 2a                	je     806bf0 <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  806bc6:	eb 05                	jmp    806bcd <path_walk+0x23d>
            name++;
  806bc8:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  806bcd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806bd1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bd4:	3c 2f                	cmp    al,0x2f
  806bd6:	74 f0                	je     806bc8 <path_walk+0x238>
        if(!*name)
  806bd8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806bdc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bdf:	84 c0                	test   al,al
  806be1:	74 10                	je     806bf3 <path_walk+0x263>
            goto last_slash;

        parent = path;
  806be3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806be7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  806beb:	e9 ff fd ff ff       	jmp    8069ef <path_walk+0x5f>
            goto last_component;
  806bf0:	90                   	nop
  806bf1:	eb 01                	jmp    806bf4 <path_walk+0x264>
            goto last_slash;
  806bf3:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  806bf4:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806bf8:	83 e0 01             	and    eax,0x1
  806bfb:	48 85 c0             	test   rax,rax
  806bfe:	74 06                	je     806c06 <path_walk+0x276>
    {
        return parent;
  806c00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c04:	eb 04                	jmp    806c0a <path_walk+0x27a>
    }

    return path;
  806c06:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  806c0a:	c9                   	leave  
  806c0b:	c3                   	ret    

0000000000806c0c <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  806c0c:	f3 0f 1e fa          	endbr64 
  806c10:	55                   	push   rbp
  806c11:	48 89 e5             	mov    rbp,rsp
  806c14:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806c18:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806c1c:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806c20:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  806c24:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  806c28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c2c:	83 c0 18             	add    eax,0x18
}
  806c2f:	5d                   	pop    rbp
  806c30:	c3                   	ret    

0000000000806c31 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  806c31:	f3 0f 1e fa          	endbr64 
  806c35:	55                   	push   rbp
  806c36:	48 89 e5             	mov    rbp,rsp
  806c39:	48 83 ec 30          	sub    rsp,0x30
  806c3d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  806c41:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806c45:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  806c49:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806c50:	00 

    for(p = &filesystem;p;p = p->next)
  806c51:	48 c7 45 f8 00 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c000
  806c58:	00 
  806c59:	eb 40                	jmp    806c9b <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  806c5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c5f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806c62:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806c66:	48 89 d6             	mov    rsi,rdx
  806c69:	48 89 c7             	mov    rdi,rax
  806c6c:	e8 de 4b 00 00       	call   80b84f <strcmp>
  806c71:	85 c0                	test   eax,eax
  806c73:	75 1a                	jne    806c8f <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  806c75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c79:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  806c7d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806c81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c85:	48 89 d6             	mov    rsi,rdx
  806c88:	48 89 c7             	mov    rdi,rax
  806c8b:	ff d1                	call   rcx
  806c8d:	eb 18                	jmp    806ca7 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  806c8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c93:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806c97:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806c9b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806ca0:	75 b9                	jne    806c5b <mount_fs+0x2a>
        }
    return 0;
  806ca2:	b8 00 00 00 00       	mov    eax,0x0
}
  806ca7:	c9                   	leave  
  806ca8:	c3                   	ret    

0000000000806ca9 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  806ca9:	f3 0f 1e fa          	endbr64 
  806cad:	55                   	push   rbp
  806cae:	48 89 e5             	mov    rbp,rsp
  806cb1:	48 83 ec 20          	sub    rsp,0x20
  806cb5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  806cb9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806cc0:	00 

    for(p = &filesystem;p;p = p->next)
  806cc1:	48 c7 45 f8 00 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c000
  806cc8:	00 
  806cc9:	eb 30                	jmp    806cfb <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  806ccb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ccf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806cd2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cd6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806cd9:	48 89 d6             	mov    rsi,rdx
  806cdc:	48 89 c7             	mov    rdi,rax
  806cdf:	e8 6b 4b 00 00       	call   80b84f <strcmp>
  806ce4:	85 c0                	test   eax,eax
  806ce6:	75 07                	jne    806cef <register_filesystem+0x46>
            return 0;
  806ce8:	b8 00 00 00 00       	mov    eax,0x0
  806ced:	eb 32                	jmp    806d21 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  806cef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806cf3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806cf7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806cfb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806d00:	75 c9                	jne    806ccb <register_filesystem+0x22>

    fs->next = filesystem.next;
  806d02:	48 8b 15 0f 53 00 00 	mov    rdx,QWORD PTR [rip+0x530f]        # 80c018 <filesystem+0x18>
  806d09:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d0d:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  806d11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d15:	48 89 05 fc 52 00 00 	mov    QWORD PTR [rip+0x52fc],rax        # 80c018 <filesystem+0x18>

    return 1;
  806d1c:	b8 01 00 00 00       	mov    eax,0x1
}
  806d21:	c9                   	leave  
  806d22:	c3                   	ret    

0000000000806d23 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  806d23:	f3 0f 1e fa          	endbr64 
  806d27:	55                   	push   rbp
  806d28:	48 89 e5             	mov    rbp,rsp
  806d2b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  806d2f:	48 c7 45 f8 00 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c000
  806d36:	00 

    while(p->next)
  806d37:	eb 41                	jmp    806d7a <unregister_filesystem+0x57>
        if(p->next == fs)
  806d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d3d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d41:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806d45:	75 27                	jne    806d6e <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  806d47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d4b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d4f:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  806d53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d57:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  806d5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d5f:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806d66:	00 
            return 1;
  806d67:	b8 01 00 00 00       	mov    eax,0x1
  806d6c:	eb 1e                	jmp    806d8c <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  806d6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d72:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d76:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  806d7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d7e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d82:	48 85 c0             	test   rax,rax
  806d85:	75 b2                	jne    806d39 <unregister_filesystem+0x16>
    return 0;
  806d87:	b8 00 00 00 00       	mov    eax,0x0
}
  806d8c:	5d                   	pop    rbp
  806d8d:	c3                   	ret    

0000000000806d8e <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  806d8e:	f3 0f 1e fa          	endbr64 
  806d92:	55                   	push   rbp
  806d93:	48 89 e5             	mov    rbp,rsp
  806d96:	48 83 ec 10          	sub    rsp,0x10
  806d9a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  806d9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806da2:	48 89 c7             	mov    rdi,rax
  806da5:	b8 00 00 00 00       	mov    eax,0x0
  806daa:	e8 69 9f ff ff       	call   800d18 <printf>
    return 0;
  806daf:	b8 00 00 00 00       	mov    eax,0x0
}
  806db4:	c9                   	leave  
  806db5:	c3                   	ret    

0000000000806db6 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  806db6:	f3 0f 1e fa          	endbr64 
  806dba:	55                   	push   rbp
  806dbb:	48 89 e5             	mov    rbp,rsp
  806dbe:	48 83 ec 50          	sub    rsp,0x50
  806dc2:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806dc6:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  806dc9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806dd0:	00 
    long pathlen = 0;
  806dd1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806dd8:	00 
    long error = 0;
  806dd9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806de0:	00 
    struct dir_entry * dentry = NULL;
  806de1:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  806de8:	00 
    struct file * filp = NULL;
  806de9:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  806df0:	00 
    struct file ** f = NULL;
  806df1:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  806df8:	00 
    int fd = -1;
  806df9:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  806e00:	b8 00 00 00 00       	mov    eax,0x0
  806e05:	e8 a0 a4 ff ff       	call   8012aa <vmalloc>
  806e0a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  806e0e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  806e13:	75 0c                	jne    806e21 <sys_open+0x6b>
        return -ENOMEM;
  806e15:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  806e1c:	e9 aa 02 00 00       	jmp    8070cb <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  806e21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e25:	ba 00 10 00 00       	mov    edx,0x1000
  806e2a:	be 00 00 00 00       	mov    esi,0x0
  806e2f:	48 89 c7             	mov    rdi,rax
  806e32:	e8 29 48 00 00       	call   80b660 <memset>
    pathlen = strlen(filename);
  806e37:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806e3b:	48 89 c7             	mov    rdi,rax
  806e3e:	e8 8b 4a 00 00       	call   80b8ce <strlen>
  806e43:	48 98                	cdqe   
  806e45:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  806e49:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  806e4e:	7f 18                	jg     806e68 <sys_open+0xb2>
    {
        vmfree(path);
  806e50:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e54:	48 89 c7             	mov    rdi,rax
  806e57:	e8 dd a4 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  806e5c:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806e63:	e9 63 02 00 00       	jmp    8070cb <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  806e68:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  806e6f:	00 
  806e70:	7e 18                	jle    806e8a <sys_open+0xd4>
    {
        vmfree(path);
  806e72:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e76:	48 89 c7             	mov    rdi,rax
  806e79:	e8 bb a4 ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  806e7e:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  806e85:	e9 41 02 00 00       	jmp    8070cb <sys_open+0x315>
    }
    strcpy(filename,path);
  806e8a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806e8e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806e92:	48 89 d6             	mov    rsi,rdx
  806e95:	48 89 c7             	mov    rdi,rax
  806e98:	e8 12 48 00 00       	call   80b6af <strcpy>

    dentry = path_walk(path,0);
  806e9d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ea1:	be 00 00 00 00       	mov    esi,0x0
  806ea6:	48 89 c7             	mov    rdi,rax
  806ea9:	e8 e2 fa ff ff       	call   806990 <path_walk>
  806eae:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  806eb2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806eb6:	48 89 c7             	mov    rdi,rax
  806eb9:	e8 7b a4 ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  806ebe:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806ec3:	75 0c                	jne    806ed1 <sys_open+0x11b>
        return -ENOENT;
  806ec5:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  806ecc:	e9 fa 01 00 00       	jmp    8070cb <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  806ed1:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806ed4:	25 00 40 00 00       	and    eax,0x4000
  806ed9:	85 c0                	test   eax,eax
  806edb:	74 1e                	je     806efb <sys_open+0x145>
  806edd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ee1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806ee5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806ee9:	48 83 f8 02          	cmp    rax,0x2
  806eed:	74 0c                	je     806efb <sys_open+0x145>
        return -ENOTDIR;
  806eef:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806ef6:	e9 d0 01 00 00       	jmp    8070cb <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  806efb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806efe:	25 00 40 00 00       	and    eax,0x4000
  806f03:	85 c0                	test   eax,eax
  806f05:	75 1e                	jne    806f25 <sys_open+0x16f>
  806f07:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f0b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f0f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806f13:	48 83 f8 02          	cmp    rax,0x2
  806f17:	75 0c                	jne    806f25 <sys_open+0x16f>
        return -EISDIR;
  806f19:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  806f20:	e9 a6 01 00 00       	jmp    8070cb <sys_open+0x315>

    filp = (struct file *)vmalloc();
  806f25:	b8 00 00 00 00       	mov    eax,0x0
  806f2a:	e8 7b a3 ff ff       	call   8012aa <vmalloc>
  806f2f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  806f33:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f37:	ba 28 00 00 00       	mov    edx,0x28
  806f3c:	be 00 00 00 00       	mov    esi,0x0
  806f41:	48 89 c7             	mov    rdi,rax
  806f44:	e8 17 47 00 00       	call   80b660 <memset>
    filp->dentry = dentry;
  806f49:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f4d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806f51:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  806f55:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806f58:	48 63 d0             	movsxd rdx,eax
  806f5b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f5f:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  806f63:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f67:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f6b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806f6f:	83 e0 04             	and    eax,0x4
  806f72:	48 85 c0             	test   rax,rax
  806f75:	74 0e                	je     806f85 <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  806f77:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f7b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806f82:	00 
  806f83:	eb 14                	jmp    806f99 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  806f85:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f89:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f8d:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  806f91:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f95:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  806f99:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f9d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806fa1:	48 85 c0             	test   rax,rax
  806fa4:	74 33                	je     806fd9 <sys_open+0x223>
  806fa6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806faa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806fae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806fb1:	48 85 c0             	test   rax,rax
  806fb4:	74 23                	je     806fd9 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  806fb6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fba:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806fbe:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806fc1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fc5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806fc9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806fcd:	48 89 d6             	mov    rsi,rdx
  806fd0:	48 89 c7             	mov    rdi,rax
  806fd3:	ff d1                	call   rcx
  806fd5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  806fd9:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  806fde:	74 18                	je     806ff8 <sys_open+0x242>
    {
        vmfree(filp);
  806fe0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fe4:	48 89 c7             	mov    rdi,rax
  806fe7:	e8 4d a3 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  806fec:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806ff3:	e9 d3 00 00 00       	jmp    8070cb <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  806ff8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806ffc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807000:	25 00 02 00 00       	and    eax,0x200
  807005:	48 85 c0             	test   rax,rax
  807008:	74 13                	je     80701d <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  80700a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80700e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807012:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807016:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  80701d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807021:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807025:	25 00 04 00 00       	and    eax,0x400
  80702a:	48 85 c0             	test   rax,rax
  80702d:	74 19                	je     807048 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  80702f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807033:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807037:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80703b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80703e:	48 89 c2             	mov    rdx,rax
  807041:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807045:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807048:	48 8b 05 51 d4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d451]        # 4144a0 <current>
  80704f:	48 05 c4 00 00 00    	add    rax,0xc4
  807055:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807059:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807060:	eb 28                	jmp    80708a <sys_open+0x2d4>
        if(f[i] == NULL)
  807062:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807065:	48 98                	cdqe   
  807067:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80706e:	00 
  80706f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807073:	48 01 d0             	add    rax,rdx
  807076:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807079:	48 85 c0             	test   rax,rax
  80707c:	75 08                	jne    807086 <sys_open+0x2d0>
        {
            fd = i;
  80707e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807081:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  807084:	eb 0a                	jmp    807090 <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807086:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80708a:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80708e:	7e d2                	jle    807062 <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  807090:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  807094:	75 15                	jne    8070ab <sys_open+0x2f5>
    {
        vmfree(filp);
  807096:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80709a:	48 89 c7             	mov    rdi,rax
  80709d:	e8 97 a2 ff ff       	call   801339 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  8070a2:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  8070a9:	eb 20                	jmp    8070cb <sys_open+0x315>
    }
    f[fd] = filp;
  8070ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070ae:	48 98                	cdqe   
  8070b0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8070b7:	00 
  8070b8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8070bc:	48 01 c2             	add    rdx,rax
  8070bf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070c3:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  8070c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070c9:	48 98                	cdqe   
}
  8070cb:	c9                   	leave  
  8070cc:	c3                   	ret    

00000000008070cd <sys_close>:

unsigned long sys_close(int fd)
{
  8070cd:	f3 0f 1e fa          	endbr64 
  8070d1:	55                   	push   rbp
  8070d2:	48 89 e5             	mov    rbp,rsp
  8070d5:	48 83 ec 20          	sub    rsp,0x20
  8070d9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  8070dc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8070e3:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8070e4:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8070e8:	78 06                	js     8070f0 <sys_close+0x23>
  8070ea:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8070ee:	7e 0c                	jle    8070fc <sys_close+0x2f>
        return -EBADF;
  8070f0:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8070f7:	e9 87 00 00 00       	jmp    807183 <sys_close+0xb6>

    filp = current->openf[fd];
  8070fc:	48 8b 05 9d d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d39d]        # 4144a0 <current>
  807103:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807106:	48 63 d2             	movsxd rdx,edx
  807109:	48 83 c2 18          	add    rdx,0x18
  80710d:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807112:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  807116:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80711a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80711e:	48 85 c0             	test   rax,rax
  807121:	74 35                	je     807158 <sys_close+0x8b>
  807123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807127:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80712b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80712f:	48 85 c0             	test   rax,rax
  807132:	74 24                	je     807158 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  807134:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807138:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80713c:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807140:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807144:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807148:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80714c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807150:	48 89 d6             	mov    rsi,rdx
  807153:	48 89 c7             	mov    rdi,rax
  807156:	ff d1                	call   rcx

    vmfree(filp);
  807158:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80715c:	48 89 c7             	mov    rdi,rax
  80715f:	e8 d5 a1 ff ff       	call   801339 <vmfree>
    current->openf[fd] = NULL;
  807164:	48 8b 05 35 d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d335]        # 4144a0 <current>
  80716b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80716e:	48 63 d2             	movsxd rdx,edx
  807171:	48 83 c2 18          	add    rdx,0x18
  807175:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  80717c:	00 00 

    return 0;
  80717e:	b8 00 00 00 00       	mov    eax,0x0
}
  807183:	c9                   	leave  
  807184:	c3                   	ret    

0000000000807185 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  807185:	f3 0f 1e fa          	endbr64 
  807189:	55                   	push   rbp
  80718a:	48 89 e5             	mov    rbp,rsp
  80718d:	48 83 ec 30          	sub    rsp,0x30
  807191:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807194:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807198:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80719c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8071a3:	00 
    unsigned long ret = 0;
  8071a4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8071ab:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8071ac:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8071b0:	78 06                	js     8071b8 <sys_read+0x33>
  8071b2:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8071b6:	7e 09                	jle    8071c1 <sys_read+0x3c>
        return -EBADF;
  8071b8:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8071bf:	eb 72                	jmp    807233 <sys_read+0xae>
    if(count < 0)
  8071c1:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8071c6:	79 09                	jns    8071d1 <sys_read+0x4c>
        return -EINVAL;
  8071c8:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8071cf:	eb 62                	jmp    807233 <sys_read+0xae>

    filp = current->openf[fd];
  8071d1:	48 8b 05 c8 d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d2c8]        # 4144a0 <current>
  8071d8:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8071db:	48 63 d2             	movsxd rdx,edx
  8071de:	48 83 c2 18          	add    rdx,0x18
  8071e2:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8071e7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  8071eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8071ef:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071f3:	48 85 c0             	test   rax,rax
  8071f6:	74 37                	je     80722f <sys_read+0xaa>
  8071f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8071fc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807200:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807204:	48 85 c0             	test   rax,rax
  807207:	74 26                	je     80722f <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  807209:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80720d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807211:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  807215:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807219:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80721d:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  807221:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807225:	48 89 c7             	mov    rdi,rax
  807228:	41 ff d0             	call   r8
  80722b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80722f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807233:	c9                   	leave  
  807234:	c3                   	ret    

0000000000807235 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  807235:	f3 0f 1e fa          	endbr64 
  807239:	55                   	push   rbp
  80723a:	48 89 e5             	mov    rbp,rsp
  80723d:	48 83 ec 30          	sub    rsp,0x30
  807241:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807244:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807248:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80724c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807253:	00 
    unsigned long ret = 0;
  807254:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80725b:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80725c:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807260:	78 06                	js     807268 <sys_write+0x33>
  807262:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807266:	7e 09                	jle    807271 <sys_write+0x3c>
        return -EBADF;
  807268:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80726f:	eb 72                	jmp    8072e3 <sys_write+0xae>
    if(count < 0)
  807271:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807276:	79 09                	jns    807281 <sys_write+0x4c>
        return -EINVAL;
  807278:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80727f:	eb 62                	jmp    8072e3 <sys_write+0xae>

    filp = current->openf[fd];
  807281:	48 8b 05 18 d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d218]        # 4144a0 <current>
  807288:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80728b:	48 63 d2             	movsxd rdx,edx
  80728e:	48 83 c2 18          	add    rdx,0x18
  807292:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807297:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  80729b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80729f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072a3:	48 85 c0             	test   rax,rax
  8072a6:	74 37                	je     8072df <sys_write+0xaa>
  8072a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072ac:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072b0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072b4:	48 85 c0             	test   rax,rax
  8072b7:	74 26                	je     8072df <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  8072b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072bd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072c1:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  8072c5:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8072c9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8072cd:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8072d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072d5:	48 89 c7             	mov    rdi,rax
  8072d8:	41 ff d0             	call   r8
  8072db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8072df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8072e3:	c9                   	leave  
  8072e4:	c3                   	ret    

00000000008072e5 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  8072e5:	f3 0f 1e fa          	endbr64 
  8072e9:	55                   	push   rbp
  8072ea:	48 89 e5             	mov    rbp,rsp
  8072ed:	48 83 ec 20          	sub    rsp,0x20
  8072f1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8072f4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8072f8:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8072fb:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807302:	00 
    unsigned long ret = 0;
  807303:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80730a:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  80730b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80730f:	78 06                	js     807317 <sys_lseek+0x32>
  807311:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807315:	7e 09                	jle    807320 <sys_lseek+0x3b>
        return -EBADF;
  807317:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80731e:	eb 78                	jmp    807398 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  807320:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  807324:	78 06                	js     80732c <sys_lseek+0x47>
  807326:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  80732a:	7e 09                	jle    807335 <sys_lseek+0x50>
        return -EINVAL;
  80732c:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807333:	eb 63                	jmp    807398 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807335:	48 8b 05 64 d1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d164]        # 4144a0 <current>
  80733c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80733f:	48 63 d2             	movsxd rdx,edx
  807342:	48 83 c2 18          	add    rdx,0x18
  807346:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  80734b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  80734f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807353:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807357:	48 85 c0             	test   rax,rax
  80735a:	74 38                	je     807394 <sys_lseek+0xaf>
  80735c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807360:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807364:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807368:	48 85 c0             	test   rax,rax
  80736b:	74 27                	je     807394 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  80736d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807371:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807375:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807379:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80737c:	48 63 d0             	movsxd rdx,eax
  80737f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807383:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807387:	48 89 ce             	mov    rsi,rcx
  80738a:	48 89 c7             	mov    rdi,rax
  80738d:	41 ff d0             	call   r8
  807390:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807394:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807398:	c9                   	leave  
  807399:	c3                   	ret    

000000000080739a <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  80739a:	f3 0f 1e fa          	endbr64 
  80739e:	55                   	push   rbp
  80739f:	48 89 e5             	mov    rbp,rsp
  8073a2:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  8073a6:	48 8b 05 f3 d0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d0f3]        # 4144a0 <current>
  8073ad:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  8073b4:	48 2d d0 00 00 00    	sub    rax,0xd0
  8073ba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  8073be:	bf f8 3b 81 00       	mov    edi,0x813bf8
  8073c3:	b8 00 00 00 00       	mov    eax,0x0
  8073c8:	e8 4b 99 ff ff       	call   800d18 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  8073cd:	90                   	nop
  8073ce:	c9                   	leave  
  8073cf:	c3                   	ret    

00000000008073d0 <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  8073d0:	f3 0f 1e fa          	endbr64 
  8073d4:	55                   	push   rbp
  8073d5:	48 89 e5             	mov    rbp,rsp
  8073d8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8073dc:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8073e0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8073e3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  8073e7:	90                   	nop
  8073e8:	5d                   	pop    rbp
  8073e9:	c3                   	ret    

00000000008073ea <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  8073ea:	f3 0f 1e fa          	endbr64 
  8073ee:	55                   	push   rbp
  8073ef:	48 89 e5             	mov    rbp,rsp
  8073f2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  8073f6:	90                   	nop
  8073f7:	5d                   	pop    rbp
  8073f8:	c3                   	ret    

00000000008073f9 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  8073f9:	f3 0f 1e fa          	endbr64 
  8073fd:	55                   	push   rbp
  8073fe:	48 89 e5             	mov    rbp,rsp
  807401:	48 83 ec 10          	sub    rsp,0x10
  807405:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807409:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  80740d:	bf 03 3c 81 00       	mov    edi,0x813c03
  807412:	b8 00 00 00 00       	mov    eax,0x0
  807417:	e8 fc 98 ff ff       	call   800d18 <printf>
    switch(cmd)
  80741c:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807421:	74 09                	je     80742c <sys_reboot+0x33>
  807423:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  807428:	74 13                	je     80743d <sys_reboot+0x44>
  80742a:	eb 22                	jmp    80744e <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  80742c:	be fe 00 00 00       	mov    esi,0xfe
  807431:	bf 64 00 00 00       	mov    edi,0x64
  807436:	e8 45 e2 ff ff       	call   805680 <outb>
            break;
  80743b:	eb 21                	jmp    80745e <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  80743d:	bf 10 3c 81 00       	mov    edi,0x813c10
  807442:	b8 00 00 00 00       	mov    eax,0x0
  807447:	e8 cc 98 ff ff       	call   800d18 <printf>
            break;
  80744c:	eb 10                	jmp    80745e <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  80744e:	bf 30 3c 81 00       	mov    edi,0x813c30
  807453:	b8 00 00 00 00       	mov    eax,0x0
  807458:	e8 bb 98 ff ff       	call   800d18 <printf>
            break;
  80745d:	90                   	nop
    }
    return 0;
  80745e:	b8 00 00 00 00       	mov    eax,0x0
}
  807463:	c9                   	leave  
  807464:	c3                   	ret    

0000000000807465 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  807465:	f3 0f 1e fa          	endbr64 
  807469:	55                   	push   rbp
  80746a:	48 89 e5             	mov    rbp,rsp
  80746d:	48 83 ec 30          	sub    rsp,0x30
  807471:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  807475:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80747c:	00 
    long pathlen = 0;
  80747d:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807484:	00 
    struct dir_entry * dentry = NULL;
  807485:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80748c:	00 

    printf("sys_chdir\n");
  80748d:	bf 47 3c 81 00       	mov    edi,0x813c47
  807492:	b8 00 00 00 00       	mov    eax,0x0
  807497:	e8 7c 98 ff ff       	call   800d18 <printf>
    path = (char *)vmalloc();
  80749c:	b8 00 00 00 00       	mov    eax,0x0
  8074a1:	e8 04 9e ff ff       	call   8012aa <vmalloc>
  8074a6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  8074aa:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8074af:	75 0c                	jne    8074bd <sys_chdir+0x58>
        return -ENOMEM;
  8074b1:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  8074b8:	e9 ca 00 00 00       	jmp    807587 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  8074bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8074c1:	ba 00 10 00 00       	mov    edx,0x1000
  8074c6:	be 00 00 00 00       	mov    esi,0x0
  8074cb:	48 89 c7             	mov    rdi,rax
  8074ce:	e8 8d 41 00 00       	call   80b660 <memset>
    pathlen = strlen(filename);
  8074d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8074d7:	48 89 c7             	mov    rdi,rax
  8074da:	e8 ef 43 00 00       	call   80b8ce <strlen>
  8074df:	48 98                	cdqe   
  8074e1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8074e5:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8074ea:	7f 18                	jg     807504 <sys_chdir+0x9f>
    {
        vmfree(path);
  8074ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8074f0:	48 89 c7             	mov    rdi,rax
  8074f3:	e8 41 9e ff ff       	call   801339 <vmfree>
        return -EFAULT;
  8074f8:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8074ff:	e9 83 00 00 00       	jmp    807587 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807504:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  80750b:	00 
  80750c:	7e 15                	jle    807523 <sys_chdir+0xbe>
    {
        vmfree(path);
  80750e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807512:	48 89 c7             	mov    rdi,rax
  807515:	e8 1f 9e ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  80751a:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807521:	eb 64                	jmp    807587 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  807523:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807527:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80752b:	48 89 d6             	mov    rsi,rdx
  80752e:	48 89 c7             	mov    rdi,rax
  807531:	e8 79 41 00 00       	call   80b6af <strcpy>

    dentry = path_walk(path,0);
  807536:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80753a:	be 00 00 00 00       	mov    esi,0x0
  80753f:	48 89 c7             	mov    rdi,rax
  807542:	e8 49 f4 ff ff       	call   806990 <path_walk>
  807547:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  80754b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80754f:	48 89 c7             	mov    rdi,rax
  807552:	e8 e2 9d ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  807557:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80755c:	75 09                	jne    807567 <sys_chdir+0x102>
        return -ENOENT;
  80755e:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807565:	eb 20                	jmp    807587 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807567:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80756b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80756f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807573:	48 83 f8 02          	cmp    rax,0x2
  807577:	74 09                	je     807582 <sys_chdir+0x11d>
        return -ENOTDIR;
  807579:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807580:	eb 05                	jmp    807587 <sys_chdir+0x122>
    return 0;
  807582:	b8 00 00 00 00       	mov    eax,0x0
}
  807587:	c9                   	leave  
  807588:	c3                   	ret    

0000000000807589 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807589:	f3 0f 1e fa          	endbr64 
  80758d:	55                   	push   rbp
  80758e:	48 89 e5             	mov    rbp,rsp
  807591:	48 83 ec 30          	sub    rsp,0x30
  807595:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807598:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80759c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8075a0:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8075a7:	00 
    unsigned long ret = 0;
  8075a8:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8075af:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  8075b0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8075b4:	78 06                	js     8075bc <sys_getdents+0x33>
  8075b6:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  8075ba:	7e 09                	jle    8075c5 <sys_getdents+0x3c>
        return -EBADF;
  8075bc:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8075c3:	eb 72                	jmp    807637 <sys_getdents+0xae>
    if(count < 0)
  8075c5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8075ca:	79 09                	jns    8075d5 <sys_getdents+0x4c>
        return -EINVAL;
  8075cc:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8075d3:	eb 62                	jmp    807637 <sys_getdents+0xae>

    filp = current->openf[fd];
  8075d5:	48 8b 05 c4 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cec4]        # 4144a0 <current>
  8075dc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8075df:	48 63 d2             	movsxd rdx,edx
  8075e2:	48 83 c2 18          	add    rdx,0x18
  8075e6:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8075eb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  8075ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8075f3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8075f7:	48 85 c0             	test   rax,rax
  8075fa:	74 37                	je     807633 <sys_getdents+0xaa>
  8075fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807600:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807604:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807608:	48 85 c0             	test   rax,rax
  80760b:	74 26                	je     807633 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  80760d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807611:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807615:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  807619:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80761d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807621:	ba 0c 6c 80 00       	mov    edx,0x806c0c
  807626:	48 89 ce             	mov    rsi,rcx
  807629:	48 89 c7             	mov    rdi,rax
  80762c:	41 ff d0             	call   r8
  80762f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807633:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807637:	c9                   	leave  
  807638:	c3                   	ret    

0000000000807639 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  807639:	f3 0f 1e fa          	endbr64 
  80763d:	55                   	push   rbp
  80763e:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  807641:	0f b6 05 85 01 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20185]        # 4277cd <k_shift>
  807648:	84 c0                	test   al,al
  80764a:	0f 94 c0             	sete   al
  80764d:	88 05 7a 01 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2017a],al        # 4277cd <k_shift>
}
  807653:	90                   	nop
  807654:	5d                   	pop    rbp
  807655:	c3                   	ret    

0000000000807656 <ctrl>:
void ctrl()
{
  807656:	f3 0f 1e fa          	endbr64 
  80765a:	55                   	push   rbp
  80765b:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  80765e:	0f b6 05 69 01 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20169]        # 4277ce <k_ctrl>
  807665:	84 c0                	test   al,al
  807667:	0f 94 c0             	sete   al
  80766a:	88 05 5e 01 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2015e],al        # 4277ce <k_ctrl>
}
  807670:	90                   	nop
  807671:	5d                   	pop    rbp
  807672:	c3                   	ret    

0000000000807673 <capslock>:
void capslock()
{
  807673:	f3 0f 1e fa          	endbr64 
  807677:	55                   	push   rbp
  807678:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  80767b:	0f b6 05 4d 01 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2014d]        # 4277cf <k_capslock>
  807682:	84 c0                	test   al,al
  807684:	0f 94 c0             	sete   al
  807687:	88 05 42 01 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20142],al        # 4277cf <k_capslock>
}
  80768d:	90                   	nop
  80768e:	5d                   	pop    rbp
  80768f:	c3                   	ret    

0000000000807690 <to_ascii>:
char to_ascii(char scan_code)
{
  807690:	f3 0f 1e fa          	endbr64 
  807694:	55                   	push   rbp
  807695:	48 89 e5             	mov    rbp,rsp
  807698:	89 f8                	mov    eax,edi
  80769a:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80769d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8076a4:	e9 c7 00 00 00       	jmp    807770 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8076a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8076ac:	48 63 d0             	movsxd rdx,eax
  8076af:	48 89 d0             	mov    rax,rdx
  8076b2:	48 c1 e0 02          	shl    rax,0x2
  8076b6:	48 01 d0             	add    rax,rdx
  8076b9:	48 05 c2 3d 81 00    	add    rax,0x813dc2
  8076bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076c2:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8076c5:	0f 85 a1 00 00 00    	jne    80776c <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  8076cb:	0f b6 05 fd 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200fd]        # 4277cf <k_capslock>
  8076d2:	84 c0                	test   al,al
  8076d4:	74 55                	je     80772b <to_ascii+0x9b>
  8076d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8076d9:	48 63 d0             	movsxd rdx,eax
  8076dc:	48 89 d0             	mov    rax,rdx
  8076df:	48 c1 e0 02          	shl    rax,0x2
  8076e3:	48 01 d0             	add    rax,rdx
  8076e6:	48 05 c0 3d 81 00    	add    rax,0x813dc0
  8076ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076ef:	3c 60                	cmp    al,0x60
  8076f1:	7e 38                	jle    80772b <to_ascii+0x9b>
  8076f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8076f6:	48 63 d0             	movsxd rdx,eax
  8076f9:	48 89 d0             	mov    rax,rdx
  8076fc:	48 c1 e0 02          	shl    rax,0x2
  807700:	48 01 d0             	add    rax,rdx
  807703:	48 05 c0 3d 81 00    	add    rax,0x813dc0
  807709:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80770c:	3c 7a                	cmp    al,0x7a
  80770e:	7f 1b                	jg     80772b <to_ascii+0x9b>
  807710:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807713:	48 63 d0             	movsxd rdx,eax
  807716:	48 89 d0             	mov    rax,rdx
  807719:	48 c1 e0 02          	shl    rax,0x2
  80771d:	48 01 d0             	add    rax,rdx
  807720:	48 05 c1 3d 81 00    	add    rax,0x813dc1
  807726:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807729:	eb 54                	jmp    80777f <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  80772b:	0f b6 05 9b 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2009b]        # 4277cd <k_shift>
  807732:	84 c0                	test   al,al
  807734:	74 1b                	je     807751 <to_ascii+0xc1>
  807736:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807739:	48 63 d0             	movsxd rdx,eax
  80773c:	48 89 d0             	mov    rax,rdx
  80773f:	48 c1 e0 02          	shl    rax,0x2
  807743:	48 01 d0             	add    rax,rdx
  807746:	48 05 c1 3d 81 00    	add    rax,0x813dc1
  80774c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80774f:	eb 2e                	jmp    80777f <to_ascii+0xef>
            else return key_map[i].ascii;
  807751:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807754:	48 63 d0             	movsxd rdx,eax
  807757:	48 89 d0             	mov    rax,rdx
  80775a:	48 c1 e0 02          	shl    rax,0x2
  80775e:	48 01 d0             	add    rax,rdx
  807761:	48 05 c0 3d 81 00    	add    rax,0x813dc0
  807767:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80776a:	eb 13                	jmp    80777f <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80776c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807770:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  807774:	0f 8e 2f ff ff ff    	jle    8076a9 <to_ascii+0x19>
        }

    return '\0';
  80777a:	b8 00 00 00 00       	mov    eax,0x0
}
  80777f:	5d                   	pop    rbp
  807780:	c3                   	ret    

0000000000807781 <init_kb>:
int init_kb()
{
  807781:	f3 0f 1e fa          	endbr64 
  807785:	55                   	push   rbp
  807786:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807789:	bf 00 3d 81 00       	mov    edi,0x813d00
  80778e:	e8 e9 ad ff ff       	call   80257c <reg_device>
    reg_driver(&drv_keyboard);
  807793:	bf 60 3c 81 00       	mov    edi,0x813c60
  807798:	e8 c7 b0 ff ff       	call   802864 <reg_driver>
}
  80779d:	90                   	nop
  80779e:	5d                   	pop    rbp
  80779f:	c3                   	ret    

00000000008077a0 <key_proc>:
int key_proc()
{
  8077a0:	f3 0f 1e fa          	endbr64 
  8077a4:	55                   	push   rbp
  8077a5:	48 89 e5             	mov    rbp,rsp
  8077a8:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8077ac:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8077b0:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8077b4:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8077b8:	bf 60 00 00 00       	mov    edi,0x60
  8077bd:	e8 d7 de ff ff       	call   805699 <inb>
  8077c2:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8077c5:	8b 05 61 48 00 00    	mov    eax,DWORD PTR [rip+0x4861]        # 80c02c <key_bufq+0xc>
  8077cb:	83 c0 01             	add    eax,0x1
  8077ce:	8b 0d 5c 48 00 00    	mov    ecx,DWORD PTR [rip+0x485c]        # 80c030 <key_bufq+0x10>
  8077d4:	99                   	cdq    
  8077d5:	f7 f9                	idiv   ecx
  8077d7:	8b 05 4b 48 00 00    	mov    eax,DWORD PTR [rip+0x484b]        # 80c028 <key_bufq+0x8>
  8077dd:	39 c2                	cmp    edx,eax
  8077df:	74 32                	je     807813 <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8077e1:	48 8b 15 38 48 00 00 	mov    rdx,QWORD PTR [rip+0x4838]        # 80c020 <key_bufq>
  8077e8:	8b 05 3e 48 00 00    	mov    eax,DWORD PTR [rip+0x483e]        # 80c02c <key_bufq+0xc>
  8077ee:	48 98                	cdqe   
  8077f0:	48 01 c2             	add    rdx,rax
  8077f3:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8077f7:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8077f9:	8b 05 2d 48 00 00    	mov    eax,DWORD PTR [rip+0x482d]        # 80c02c <key_bufq+0xc>
  8077ff:	83 c0 01             	add    eax,0x1
  807802:	8b 0d 28 48 00 00    	mov    ecx,DWORD PTR [rip+0x4828]        # 80c030 <key_bufq+0x10>
  807808:	99                   	cdq    
  807809:	f7 f9                	idiv   ecx
  80780b:	89 d0                	mov    eax,edx
  80780d:	89 05 19 48 00 00    	mov    DWORD PTR [rip+0x4819],eax        # 80c02c <key_bufq+0xc>
    }

    if(scan1==0x48)
  807813:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  807817:	75 0a                	jne    807823 <key_proc+0x83>
        scr_up();
  807819:	b8 00 00 00 00       	mov    eax,0x0
  80781e:	e8 53 ef ff ff       	call   806776 <scr_up>
    if(scan1==0x50)
  807823:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  807827:	75 0a                	jne    807833 <key_proc+0x93>
        scr_down();
  807829:	b8 00 00 00 00       	mov    eax,0x0
  80782e:	e8 dd ef ff ff       	call   806810 <scr_down>
    switch (scan1)
  807833:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807837:	3d b6 00 00 00       	cmp    eax,0xb6
  80783c:	74 41                	je     80787f <key_proc+0xdf>
  80783e:	3d b6 00 00 00       	cmp    eax,0xb6
  807843:	7f 5e                	jg     8078a3 <key_proc+0x103>
  807845:	3d aa 00 00 00       	cmp    eax,0xaa
  80784a:	74 33                	je     80787f <key_proc+0xdf>
  80784c:	3d aa 00 00 00       	cmp    eax,0xaa
  807851:	7f 50                	jg     8078a3 <key_proc+0x103>
  807853:	3d 9d 00 00 00       	cmp    eax,0x9d
  807858:	74 31                	je     80788b <key_proc+0xeb>
  80785a:	3d 9d 00 00 00       	cmp    eax,0x9d
  80785f:	7f 42                	jg     8078a3 <key_proc+0x103>
  807861:	83 f8 3a             	cmp    eax,0x3a
  807864:	74 31                	je     807897 <key_proc+0xf7>
  807866:	83 f8 3a             	cmp    eax,0x3a
  807869:	7f 38                	jg     8078a3 <key_proc+0x103>
  80786b:	83 f8 36             	cmp    eax,0x36
  80786e:	74 0f                	je     80787f <key_proc+0xdf>
  807870:	83 f8 36             	cmp    eax,0x36
  807873:	7f 2e                	jg     8078a3 <key_proc+0x103>
  807875:	83 f8 1d             	cmp    eax,0x1d
  807878:	74 11                	je     80788b <key_proc+0xeb>
  80787a:	83 f8 2a             	cmp    eax,0x2a
  80787d:	75 24                	jne    8078a3 <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  80787f:	b8 00 00 00 00       	mov    eax,0x0
  807884:	e8 b0 fd ff ff       	call   807639 <shift>
            break;
  807889:	eb 19                	jmp    8078a4 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  80788b:	b8 00 00 00 00       	mov    eax,0x0
  807890:	e8 c1 fd ff ff       	call   807656 <ctrl>
            break;
  807895:	eb 0d                	jmp    8078a4 <key_proc+0x104>
        case 0x3a:
            capslock();
  807897:	b8 00 00 00 00       	mov    eax,0x0
  80789c:	e8 d2 fd ff ff       	call   807673 <capslock>
            break;
  8078a1:	eb 01                	jmp    8078a4 <key_proc+0x104>
        default:
            break;
  8078a3:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8078a4:	b8 00 00 00 00       	mov    eax,0x0
  8078a9:	e8 00 de ff ff       	call   8056ae <eoi>
    asm volatile("leave \r\n iretq");
  8078ae:	c9                   	leave  
  8078af:	48 cf                	iretq  
}
  8078b1:	90                   	nop
  8078b2:	c9                   	leave  
  8078b3:	c3                   	ret    

00000000008078b4 <sys_getkbc>:

char sys_getkbc()
{
  8078b4:	f3 0f 1e fa          	endbr64 
  8078b8:	55                   	push   rbp
  8078b9:	48 89 e5             	mov    rbp,rsp
  8078bc:	48 83 ec 10          	sub    rsp,0x10
    if(key_bufq.tail==key_bufq.head)return -1;
  8078c0:	8b 15 66 47 00 00    	mov    edx,DWORD PTR [rip+0x4766]        # 80c02c <key_bufq+0xc>
  8078c6:	8b 05 5c 47 00 00    	mov    eax,DWORD PTR [rip+0x475c]        # 80c028 <key_bufq+0x8>
  8078cc:	39 c2                	cmp    edx,eax
  8078ce:	75 07                	jne    8078d7 <sys_getkbc+0x23>
  8078d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8078d5:	eb 4e                	jmp    807925 <sys_getkbc+0x71>
    char c=key_buf[key_bufq.head];
  8078d7:	8b 05 4b 47 00 00    	mov    eax,DWORD PTR [rip+0x474b]        # 80c028 <key_bufq+0x8>
  8078dd:	48 98                	cdqe   
  8078df:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  8078e6:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
  8078e9:	8b 05 39 47 00 00    	mov    eax,DWORD PTR [rip+0x4739]        # 80c028 <key_bufq+0x8>
  8078ef:	83 c0 01             	add    eax,0x1
  8078f2:	8b 0d 38 47 00 00    	mov    ecx,DWORD PTR [rip+0x4738]        # 80c030 <key_bufq+0x10>
  8078f8:	99                   	cdq    
  8078f9:	f7 f9                	idiv   ecx
  8078fb:	89 d0                	mov    eax,edx
  8078fd:	89 05 25 47 00 00    	mov    DWORD PTR [rip+0x4725],eax        # 80c028 <key_bufq+0x8>
    if(c&FLAG_BREAK)return -1;
  807903:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  807907:	79 07                	jns    807910 <sys_getkbc+0x5c>
  807909:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80790e:	eb 15                	jmp    807925 <sys_getkbc+0x71>
    c= to_ascii(c&0x7f);
  807910:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  807914:	83 e0 7f             	and    eax,0x7f
  807917:	89 c7                	mov    edi,eax
  807919:	e8 72 fd ff ff       	call   807690 <to_ascii>
  80791e:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    return c;
  807921:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807925:	c9                   	leave  
  807926:	c3                   	ret    

0000000000807927 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  807927:	f3 0f 1e fa          	endbr64 
  80792b:	55                   	push   rbp
  80792c:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80792f:	b8 00 00 00 00       	mov    eax,0x0
  807934:	e8 8d 09 00 00       	call   8082c6 <hd_iterate>
    return 0;
  807939:	b8 00 00 00 00       	mov    eax,0x0
}
  80793e:	5d                   	pop    rbp
  80793f:	c3                   	ret    

0000000000807940 <disk_int_handler_c>:

int disk_int_handler_c()
{
  807940:	f3 0f 1e fa          	endbr64 
  807944:	55                   	push   rbp
  807945:	48 89 e5             	mov    rbp,rsp
  807948:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  80794c:	48 8b 05 8d 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b8d]        # 42a4e0 <running_req>
  807953:	48 85 c0             	test   rax,rax
  807956:	75 0a                	jne    807962 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  807958:	b8 01 00 00 00       	mov    eax,0x1
  80795d:	e9 a3 01 00 00       	jmp    807b05 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  807962:	48 8b 05 77 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b77]        # 42a4e0 <running_req>
  807969:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80796d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  807971:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807978:	48 8b 05 61 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b61]        # 42a4e0 <running_req>
  80797f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807982:	83 f8 02             	cmp    eax,0x2
  807985:	74 0f                	je     807996 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  807987:	48 8b 05 52 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b52]        # 42a4e0 <running_req>
  80798e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807991:	83 f8 03             	cmp    eax,0x3
  807994:	75 07                	jne    80799d <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  807996:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80799d:	48 8b 05 3c 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b3c]        # 42a4e0 <running_req>
  8079a4:	8b 00                	mov    eax,DWORD PTR [rax]
  8079a6:	85 c0                	test   eax,eax
  8079a8:	75 42                	jne    8079ec <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8079aa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8079b1:	eb 22                	jmp    8079d5 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8079b3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8079b6:	0f b7 c0             	movzx  eax,ax
  8079b9:	89 c7                	mov    edi,eax
  8079bb:	e8 e3 dc ff ff       	call   8056a3 <inw>
  8079c0:	89 c2                	mov    edx,eax
  8079c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079c6:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8079ca:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8079ce:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8079d1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8079d5:	48 8b 05 04 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b04]        # 42a4e0 <running_req>
  8079dc:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8079df:	c1 e0 08             	shl    eax,0x8
  8079e2:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8079e5:	7c cc                	jl     8079b3 <disk_int_handler_c+0x73>
  8079e7:	e9 ca 00 00 00       	jmp    807ab6 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8079ec:	48 8b 05 ed 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22aed]        # 42a4e0 <running_req>
  8079f3:	8b 00                	mov    eax,DWORD PTR [rax]
  8079f5:	83 f8 01             	cmp    eax,0x1
  8079f8:	75 42                	jne    807a3c <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8079fa:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807a01:	eb 25                	jmp    807a28 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  807a03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a07:	48 8d 50 02          	lea    rdx,[rax+0x2]
  807a0b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  807a0f:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807a12:	0f b7 d0             	movzx  edx,ax
  807a15:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a18:	0f b7 c0             	movzx  eax,ax
  807a1b:	89 d6                	mov    esi,edx
  807a1d:	89 c7                	mov    edi,eax
  807a1f:	e8 69 dc ff ff       	call   80568d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  807a24:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807a28:	48 8b 05 b1 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ab1]        # 42a4e0 <running_req>
  807a2f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807a32:	c1 e0 08             	shl    eax,0x8
  807a35:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807a38:	7c c9                	jl     807a03 <disk_int_handler_c+0xc3>
  807a3a:	eb 7a                	jmp    807ab6 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  807a3c:	48 8b 05 9d 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a9d]        # 42a4e0 <running_req>
  807a43:	8b 00                	mov    eax,DWORD PTR [rax]
  807a45:	83 f8 02             	cmp    eax,0x2
  807a48:	75 34                	jne    807a7e <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  807a4a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a4d:	83 c0 07             	add    eax,0x7
  807a50:	0f b6 c0             	movzx  eax,al
  807a53:	89 c7                	mov    edi,eax
  807a55:	e8 3f dc ff ff       	call   805699 <inb>
  807a5a:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  807a5d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a60:	0f b7 c0             	movzx  eax,ax
  807a63:	89 c7                	mov    edi,eax
  807a65:	e8 39 dc ff ff       	call   8056a3 <inw>
  807a6a:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  807a6e:	48 8b 05 6b 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a6b]        # 42a4e0 <running_req>
  807a75:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  807a7c:	eb 38                	jmp    807ab6 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  807a7e:	48 8b 05 5b 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a5b]        # 42a4e0 <running_req>
  807a85:	8b 00                	mov    eax,DWORD PTR [rax]
  807a87:	83 f8 03             	cmp    eax,0x3
  807a8a:	75 2a                	jne    807ab6 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  807a8c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a8f:	83 c0 07             	add    eax,0x7
  807a92:	0f b6 c0             	movzx  eax,al
  807a95:	89 c7                	mov    edi,eax
  807a97:	e8 fd db ff ff       	call   805699 <inb>
  807a9c:	0f b6 c0             	movzx  eax,al
  807a9f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  807aa2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807aa5:	89 c6                	mov    esi,eax
  807aa7:	bf 96 3f 81 00       	mov    edi,0x813f96
  807aac:	b8 00 00 00 00       	mov    eax,0x0
  807ab1:	e8 62 92 ff ff       	call   800d18 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  807ab6:	48 8b 05 23 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a23]        # 42a4e0 <running_req>
  807abd:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807ac4:	48 8b 05 15 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a15]        # 42a4e0 <running_req>
  807acb:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807acf:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807ad6:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  807ad9:	48 8b 05 08 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a08]        # 42a4e8 <running_devman_req>
  807ae0:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  807ae7:	00 00 00 
    running_devman_req=NULL;
  807aea:	48 c7 05 f3 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc229f3],0x0        # 42a4e8 <running_devman_req>
  807af1:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807af5:	48 c7 05 e0 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc229e0],0x0        # 42a4e0 <running_req>
  807afc:	00 00 00 00 
    return 0;
  807b00:	b8 00 00 00 00       	mov    eax,0x0
}
  807b05:	c9                   	leave  
  807b06:	c3                   	ret    

0000000000807b07 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  807b07:	f3 0f 1e fa          	endbr64 
  807b0b:	55                   	push   rbp
  807b0c:	48 89 e5             	mov    rbp,rsp
  807b0f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  807b12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b15:	48 63 d0             	movsxd rdx,eax
  807b18:	48 89 d0             	mov    rax,rdx
  807b1b:	48 01 c0             	add    rax,rax
  807b1e:	48 01 d0             	add    rax,rdx
  807b21:	48 c1 e0 04          	shl    rax,0x4
  807b25:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807b2b:	8b 00                	mov    eax,DWORD PTR [rax]
}
  807b2d:	5d                   	pop    rbp
  807b2e:	c3                   	ret    

0000000000807b2f <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  807b2f:	f3 0f 1e fa          	endbr64 
  807b33:	55                   	push   rbp
  807b34:	48 89 e5             	mov    rbp,rsp
  807b37:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807b3a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807b3d:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807b40:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  807b43:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  807b47:	8b 05 c7 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc229c7]        # 42a514 <tail>
  807b4d:	83 c0 01             	add    eax,0x1
  807b50:	48 63 d0             	movsxd rdx,eax
  807b53:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  807b5a:	48 c1 ea 20          	shr    rdx,0x20
  807b5e:	01 c2                	add    edx,eax
  807b60:	c1 fa 07             	sar    edx,0x7
  807b63:	89 c1                	mov    ecx,eax
  807b65:	c1 f9 1f             	sar    ecx,0x1f
  807b68:	29 ca                	sub    edx,ecx
  807b6a:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  807b70:	29 c8                	sub    eax,ecx
  807b72:	89 c2                	mov    edx,eax
  807b74:	8b 05 96 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22996]        # 42a510 <head>
  807b7a:	39 c2                	cmp    edx,eax
  807b7c:	75 0a                	jne    807b88 <request+0x59>
    {
        return -1;
  807b7e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b83:	e9 0d 01 00 00       	jmp    807c95 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  807b88:	8b 05 86 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22986]        # 42a514 <tail>
  807b8e:	48 63 d0             	movsxd rdx,eax
  807b91:	48 89 d0             	mov    rax,rdx
  807b94:	48 01 c0             	add    rax,rax
  807b97:	48 01 d0             	add    rax,rdx
  807b9a:	48 c1 e0 04          	shl    rax,0x4
  807b9e:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  807ba5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807ba8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  807baa:	8b 05 64 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22964]        # 42a514 <tail>
  807bb0:	48 63 d0             	movsxd rdx,eax
  807bb3:	48 89 d0             	mov    rax,rdx
  807bb6:	48 01 c0             	add    rax,rax
  807bb9:	48 01 d0             	add    rax,rdx
  807bbc:	48 c1 e0 04          	shl    rax,0x4
  807bc0:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  807bc7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807bca:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  807bcc:	8b 05 42 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22942]        # 42a514 <tail>
  807bd2:	48 63 d0             	movsxd rdx,eax
  807bd5:	48 89 d0             	mov    rax,rdx
  807bd8:	48 01 c0             	add    rax,rax
  807bdb:	48 01 d0             	add    rax,rdx
  807bde:	48 c1 e0 04          	shl    rax,0x4
  807be2:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  807be9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807bec:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  807bee:	8b 05 20 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22920]        # 42a514 <tail>
  807bf4:	48 63 d0             	movsxd rdx,eax
  807bf7:	48 89 d0             	mov    rax,rdx
  807bfa:	48 01 c0             	add    rax,rax
  807bfd:	48 01 d0             	add    rax,rdx
  807c00:	48 c1 e0 04          	shl    rax,0x4
  807c04:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  807c0b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  807c0e:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  807c10:	8b 05 fe 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228fe]        # 42a514 <tail>
  807c16:	48 63 d0             	movsxd rdx,eax
  807c19:	48 89 d0             	mov    rax,rdx
  807c1c:	48 01 c0             	add    rax,rax
  807c1f:	48 01 d0             	add    rax,rdx
  807c22:	48 c1 e0 04          	shl    rax,0x4
  807c26:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807c2c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  807c32:	8b 05 dc 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228dc]        # 42a514 <tail>
  807c38:	48 63 d0             	movsxd rdx,eax
  807c3b:	48 89 d0             	mov    rax,rdx
  807c3e:	48 01 c0             	add    rax,rax
  807c41:	48 01 d0             	add    rax,rdx
  807c44:	48 c1 e0 04          	shl    rax,0x4
  807c48:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  807c4f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c53:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  807c56:	8b 05 b8 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228b8]        # 42a514 <tail>
  807c5c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  807c5f:	8b 05 af 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228af]        # 42a514 <tail>
  807c65:	8d 50 01             	lea    edx,[rax+0x1]
  807c68:	48 63 c2             	movsxd rax,edx
  807c6b:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807c72:	48 c1 e8 20          	shr    rax,0x20
  807c76:	01 d0                	add    eax,edx
  807c78:	c1 f8 07             	sar    eax,0x7
  807c7b:	89 d1                	mov    ecx,edx
  807c7d:	c1 f9 1f             	sar    ecx,0x1f
  807c80:	29 c8                	sub    eax,ecx
  807c82:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807c88:	89 d0                	mov    eax,edx
  807c8a:	29 c8                	sub    eax,ecx
  807c8c:	89 05 82 28 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22882],eax        # 42a514 <tail>
    return r;
  807c92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807c95:	5d                   	pop    rbp
  807c96:	c3                   	ret    

0000000000807c97 <execute_request>:
int execute_request(){
  807c97:	f3 0f 1e fa          	endbr64 
  807c9b:	55                   	push   rbp
  807c9c:	48 89 e5             	mov    rbp,rsp
  807c9f:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  807ca3:	48 8b 05 36 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22836]        # 42a4e0 <running_req>
  807caa:	48 85 c0             	test   rax,rax
  807cad:	74 6a                	je     807d19 <execute_request+0x82>
    {
        running_req->time++;
  807caf:	48 8b 05 2a 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2282a]        # 42a4e0 <running_req>
  807cb6:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  807cb9:	83 c2 01             	add    edx,0x1
  807cbc:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  807cbf:	48 8b 05 1a 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2281a]        # 42a4e0 <running_req>
  807cc6:	8b 00                	mov    eax,DWORD PTR [rax]
  807cc8:	83 f8 02             	cmp    eax,0x2
  807ccb:	74 0a                	je     807cd7 <execute_request+0x40>
            return 2;
  807ccd:	b8 02 00 00 00       	mov    eax,0x2
  807cd2:	e9 b4 01 00 00       	jmp    807e8b <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  807cd7:	48 8b 05 02 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22802]        # 42a4e0 <running_req>
  807cde:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  807ce1:	83 f8 0a             	cmp    eax,0xa
  807ce4:	7e 29                	jle    807d0f <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  807ce6:	48 8b 05 f3 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227f3]        # 42a4e0 <running_req>
  807ced:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  807cf4:	48 8b 05 e5 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227e5]        # 42a4e0 <running_req>
  807cfb:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  807d02:	48 c7 05 d3 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc227d3],0x0        # 42a4e0 <running_req>
  807d09:	00 00 00 00 
  807d0d:	eb 0a                	jmp    807d19 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  807d0f:	b8 02 00 00 00       	mov    eax,0x2
  807d14:	e9 72 01 00 00       	jmp    807e8b <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  807d19:	8b 15 f1 27 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc227f1]        # 42a510 <head>
  807d1f:	8b 05 ef 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227ef]        # 42a514 <tail>
  807d25:	39 c2                	cmp    edx,eax
  807d27:	75 0a                	jne    807d33 <execute_request+0x9c>
  807d29:	b8 01 00 00 00       	mov    eax,0x1
  807d2e:	e9 58 01 00 00       	jmp    807e8b <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  807d33:	8b 05 d7 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227d7]        # 42a510 <head>
  807d39:	48 63 d0             	movsxd rdx,eax
  807d3c:	48 89 d0             	mov    rax,rdx
  807d3f:	48 01 c0             	add    rax,rax
  807d42:	48 01 d0             	add    rax,rdx
  807d45:	48 c1 e0 04          	shl    rax,0x4
  807d49:	48 05 e0 77 42 00    	add    rax,0x4277e0
  807d4f:	48 89 05 8a 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2278a],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  807d56:	8b 05 b4 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227b4]        # 42a510 <head>
  807d5c:	8d 50 01             	lea    edx,[rax+0x1]
  807d5f:	48 63 c2             	movsxd rax,edx
  807d62:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807d69:	48 c1 e8 20          	shr    rax,0x20
  807d6d:	01 d0                	add    eax,edx
  807d6f:	c1 f8 07             	sar    eax,0x7
  807d72:	89 d1                	mov    ecx,edx
  807d74:	c1 f9 1f             	sar    ecx,0x1f
  807d77:	29 c8                	sub    eax,ecx
  807d79:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807d7f:	89 d0                	mov    eax,edx
  807d81:	29 c8                	sub    eax,ecx
  807d83:	89 05 87 27 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22787],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  807d89:	48 8b 05 50 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22750]        # 42a4e0 <running_req>
  807d90:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  807d97:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  807d9e:	48 8b 05 3b 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2273b]        # 42a4e0 <running_req>
  807da5:	8b 00                	mov    eax,DWORD PTR [rax]
  807da7:	83 f8 03             	cmp    eax,0x3
  807daa:	0f 84 ad 00 00 00    	je     807e5d <execute_request+0x1c6>
  807db0:	83 f8 03             	cmp    eax,0x3
  807db3:	0f 8f bf 00 00 00    	jg     807e78 <execute_request+0x1e1>
  807db9:	83 f8 02             	cmp    eax,0x2
  807dbc:	0f 84 85 00 00 00    	je     807e47 <execute_request+0x1b0>
  807dc2:	83 f8 02             	cmp    eax,0x2
  807dc5:	0f 8f ad 00 00 00    	jg     807e78 <execute_request+0x1e1>
  807dcb:	85 c0                	test   eax,eax
  807dcd:	74 0a                	je     807dd9 <execute_request+0x142>
  807dcf:	83 f8 01             	cmp    eax,0x1
  807dd2:	74 3c                	je     807e10 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  807dd4:	e9 9f 00 00 00       	jmp    807e78 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  807dd9:	48 8b 05 00 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22700]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807de0:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  807de4:	48 8b 05 f5 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226f5]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807deb:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  807dee:	48 8b 05 eb 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226eb]        # 42a4e0 <running_req>
  807df5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  807df8:	89 c6                	mov    esi,eax
  807dfa:	48 8b 05 df 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226df]        # 42a4e0 <running_req>
  807e01:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e04:	89 c7                	mov    edi,eax
  807e06:	e8 a7 00 00 00       	call   807eb2 <async_read_disk>
  807e0b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807e0e:	eb 69                	jmp    807e79 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  807e10:	48 8b 05 c9 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226c9]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807e17:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  807e1b:	48 8b 05 be 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226be]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807e22:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  807e25:	48 8b 05 b4 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226b4]        # 42a4e0 <running_req>
  807e2c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  807e2f:	89 c6                	mov    esi,eax
  807e31:	48 8b 05 a8 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226a8]        # 42a4e0 <running_req>
  807e38:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e3b:	89 c7                	mov    edi,eax
  807e3d:	e8 88 01 00 00       	call   807fca <async_write_disk>
  807e42:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807e45:	eb 32                	jmp    807e79 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  807e47:	48 8b 05 92 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22692]        # 42a4e0 <running_req>
  807e4e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e51:	89 c7                	mov    edi,eax
  807e53:	e8 8f 06 00 00       	call   8084e7 <async_check_disk>
  807e58:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807e5b:	eb 1c                	jmp    807e79 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  807e5d:	48 8b 05 7c 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2267c]        # 42a4e0 <running_req>
  807e64:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e67:	89 c7                	mov    edi,eax
  807e69:	b8 00 00 00 00       	mov    eax,0x0
  807e6e:	e8 1a 00 00 00       	call   807e8d <async_reset_disk>
  807e73:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807e76:	eb 01                	jmp    807e79 <execute_request+0x1e2>
        break;
  807e78:	90                   	nop
    }
    if(r==-1)return -1;
  807e79:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807e7d:	75 07                	jne    807e86 <execute_request+0x1ef>
  807e7f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e84:	eb 05                	jmp    807e8b <execute_request+0x1f4>
    return 0;
  807e86:	b8 00 00 00 00       	mov    eax,0x0
}
  807e8b:	c9                   	leave  
  807e8c:	c3                   	ret    

0000000000807e8d <async_reset_disk>:
int async_reset_disk(int disk)
{
  807e8d:	f3 0f 1e fa          	endbr64 
  807e91:	55                   	push   rbp
  807e92:	48 89 e5             	mov    rbp,rsp
  807e95:	48 83 ec 10          	sub    rsp,0x10
  807e99:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  807e9c:	be 0c 00 00 00       	mov    esi,0xc
  807ea1:	bf f6 03 00 00       	mov    edi,0x3f6
  807ea6:	e8 d5 d7 ff ff       	call   805680 <outb>
    return 0;
  807eab:	b8 00 00 00 00       	mov    eax,0x0
}
  807eb0:	c9                   	leave  
  807eb1:	c3                   	ret    

0000000000807eb2 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  807eb2:	f3 0f 1e fa          	endbr64 
  807eb6:	55                   	push   rbp
  807eb7:	48 89 e5             	mov    rbp,rsp
  807eba:	48 83 ec 30          	sub    rsp,0x30
  807ebe:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807ec1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807ec4:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807ec7:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  807ecb:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807ed1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807ed8:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807edc:	74 06                	je     807ee4 <async_read_disk+0x32>
  807ede:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807ee2:	75 06                	jne    807eea <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  807ee4:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  807eea:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807eee:	74 06                	je     807ef6 <async_read_disk+0x44>
  807ef0:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807ef4:	75 07                	jne    807efd <async_read_disk+0x4b>
        slave_disk=1;
  807ef6:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  807efd:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807f00:	0f b6 d0             	movzx  edx,al
  807f03:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f07:	83 c0 02             	add    eax,0x2
  807f0a:	0f b7 c0             	movzx  eax,ax
  807f0d:	89 d6                	mov    esi,edx
  807f0f:	89 c7                	mov    edi,eax
  807f11:	e8 6a d7 ff ff       	call   805680 <outb>
    outb(port+3,lba&0xff);
  807f16:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f19:	0f b6 d0             	movzx  edx,al
  807f1c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f20:	83 c0 03             	add    eax,0x3
  807f23:	0f b7 c0             	movzx  eax,ax
  807f26:	89 d6                	mov    esi,edx
  807f28:	89 c7                	mov    edi,eax
  807f2a:	e8 51 d7 ff ff       	call   805680 <outb>
    outb(port+4,(lba>>8)&0xff);
  807f2f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f32:	c1 e8 08             	shr    eax,0x8
  807f35:	0f b6 d0             	movzx  edx,al
  807f38:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f3c:	83 c0 04             	add    eax,0x4
  807f3f:	0f b7 c0             	movzx  eax,ax
  807f42:	89 d6                	mov    esi,edx
  807f44:	89 c7                	mov    edi,eax
  807f46:	e8 35 d7 ff ff       	call   805680 <outb>
    outb(port+5,(lba>>16)&0xff);
  807f4b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f4e:	c1 e8 10             	shr    eax,0x10
  807f51:	0f b6 d0             	movzx  edx,al
  807f54:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f58:	83 c0 05             	add    eax,0x5
  807f5b:	0f b7 c0             	movzx  eax,ax
  807f5e:	89 d6                	mov    esi,edx
  807f60:	89 c7                	mov    edi,eax
  807f62:	e8 19 d7 ff ff       	call   805680 <outb>
    char drv=slave_disk?0x10:0;
  807f67:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  807f6b:	74 07                	je     807f74 <async_read_disk+0xc2>
  807f6d:	b8 10 00 00 00       	mov    eax,0x10
  807f72:	eb 05                	jmp    807f79 <async_read_disk+0xc7>
  807f74:	b8 00 00 00 00       	mov    eax,0x0
  807f79:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  807f7c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f7f:	c1 e8 18             	shr    eax,0x18
  807f82:	83 e0 0f             	and    eax,0xf
  807f85:	89 c2                	mov    edx,eax
  807f87:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  807f8b:	09 d0                	or     eax,edx
  807f8d:	83 c8 e0             	or     eax,0xffffffe0
  807f90:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  807f93:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  807f97:	0f b6 d0             	movzx  edx,al
  807f9a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f9e:	83 c0 06             	add    eax,0x6
  807fa1:	0f b7 c0             	movzx  eax,ax
  807fa4:	89 d6                	mov    esi,edx
  807fa6:	89 c7                	mov    edi,eax
  807fa8:	e8 d3 d6 ff ff       	call   805680 <outb>
    outb(port+7,DISK_CMD_READ);
  807fad:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fb1:	83 c0 07             	add    eax,0x7
  807fb4:	0f b7 c0             	movzx  eax,ax
  807fb7:	be 20 00 00 00       	mov    esi,0x20
  807fbc:	89 c7                	mov    edi,eax
  807fbe:	e8 bd d6 ff ff       	call   805680 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  807fc3:	b8 00 00 00 00       	mov    eax,0x0
}
  807fc8:	c9                   	leave  
  807fc9:	c3                   	ret    

0000000000807fca <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  807fca:	f3 0f 1e fa          	endbr64 
  807fce:	55                   	push   rbp
  807fcf:	48 89 e5             	mov    rbp,rsp
  807fd2:	48 83 ec 30          	sub    rsp,0x30
  807fd6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807fd9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807fdc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807fdf:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  807fe3:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807fe9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807ff0:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807ff4:	74 06                	je     807ffc <async_write_disk+0x32>
  807ff6:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807ffa:	75 06                	jne    808002 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  807ffc:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808002:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808006:	74 06                	je     80800e <async_write_disk+0x44>
  808008:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80800c:	75 07                	jne    808015 <async_write_disk+0x4b>
        slave_disk=1;
  80800e:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  808015:	bf f7 00 00 00       	mov    edi,0xf7
  80801a:	e8 7a d6 ff ff       	call   805699 <inb>
  80801f:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  808022:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808026:	83 e0 01             	and    eax,0x1
  808029:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  80802c:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  808030:	74 0a                	je     80803c <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  808032:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808037:	e9 d5 00 00 00       	jmp    808111 <async_write_disk+0x147>
        }
        t&=0x88;
  80803c:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  808040:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  808044:	74 02                	je     808048 <async_write_disk+0x7e>
    {
  808046:	eb cd                	jmp    808015 <async_write_disk+0x4b>
        if(t==0x8)break;
  808048:	90                   	nop
    }
    outb(port+2,sec_n);
  808049:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80804c:	0f b6 d0             	movzx  edx,al
  80804f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808053:	83 c0 02             	add    eax,0x2
  808056:	0f b7 c0             	movzx  eax,ax
  808059:	89 d6                	mov    esi,edx
  80805b:	89 c7                	mov    edi,eax
  80805d:	e8 1e d6 ff ff       	call   805680 <outb>
    outb(port+3,lba&0xff);
  808062:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808065:	0f b6 d0             	movzx  edx,al
  808068:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80806c:	83 c0 03             	add    eax,0x3
  80806f:	0f b7 c0             	movzx  eax,ax
  808072:	89 d6                	mov    esi,edx
  808074:	89 c7                	mov    edi,eax
  808076:	e8 05 d6 ff ff       	call   805680 <outb>
    outb(port+4,(lba>>8)&0xff);
  80807b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80807e:	c1 e8 08             	shr    eax,0x8
  808081:	0f b6 d0             	movzx  edx,al
  808084:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808088:	83 c0 04             	add    eax,0x4
  80808b:	0f b7 c0             	movzx  eax,ax
  80808e:	89 d6                	mov    esi,edx
  808090:	89 c7                	mov    edi,eax
  808092:	e8 e9 d5 ff ff       	call   805680 <outb>
    outb(port+5,(lba>>16)&0xff);
  808097:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80809a:	c1 e8 10             	shr    eax,0x10
  80809d:	0f b6 d0             	movzx  edx,al
  8080a0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8080a4:	83 c0 05             	add    eax,0x5
  8080a7:	0f b7 c0             	movzx  eax,ax
  8080aa:	89 d6                	mov    esi,edx
  8080ac:	89 c7                	mov    edi,eax
  8080ae:	e8 cd d5 ff ff       	call   805680 <outb>
    char drv=slave_disk?0x10:0;
  8080b3:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8080b7:	74 07                	je     8080c0 <async_write_disk+0xf6>
  8080b9:	b8 10 00 00 00       	mov    eax,0x10
  8080be:	eb 05                	jmp    8080c5 <async_write_disk+0xfb>
  8080c0:	b8 00 00 00 00       	mov    eax,0x0
  8080c5:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8080c8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8080cb:	c1 e8 18             	shr    eax,0x18
  8080ce:	83 e0 0f             	and    eax,0xf
  8080d1:	89 c2                	mov    edx,eax
  8080d3:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  8080d7:	09 d0                	or     eax,edx
  8080d9:	83 c8 e0             	or     eax,0xffffffe0
  8080dc:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  8080df:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  8080e3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8080e7:	83 c0 06             	add    eax,0x6
  8080ea:	0f b7 c0             	movzx  eax,ax
  8080ed:	89 d6                	mov    esi,edx
  8080ef:	89 c7                	mov    edi,eax
  8080f1:	e8 8a d5 ff ff       	call   805680 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8080f6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8080fa:	83 c0 07             	add    eax,0x7
  8080fd:	0f b7 c0             	movzx  eax,ax
  808100:	be 30 00 00 00       	mov    esi,0x30
  808105:	89 c7                	mov    edi,eax
  808107:	e8 74 d5 ff ff       	call   805680 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80810c:	b8 00 00 00 00       	mov    eax,0x0
}
  808111:	c9                   	leave  
  808112:	c3                   	ret    

0000000000808113 <read_disk>:
int read_disk(driver_args* args)
{
  808113:	f3 0f 1e fa          	endbr64 
  808117:	55                   	push   rbp
  808118:	48 89 e5             	mov    rbp,rsp
  80811b:	48 83 ec 20          	sub    rsp,0x20
  80811f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  808123:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808127:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80812a:	48 98                	cdqe   
  80812c:	48 89 c2             	mov    rdx,rax
  80812f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808133:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808136:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80813a:	8b 00                	mov    eax,DWORD PTR [rax]
  80813c:	89 ce                	mov    esi,ecx
  80813e:	89 c7                	mov    edi,eax
  808140:	e8 97 05 00 00       	call   8086dc <read_disk_asm>
  808145:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  808148:	48 8b 05 91 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22391]        # 42a4e0 <running_req>
  80814f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808156:	48 8b 05 83 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22383]        # 42a4e0 <running_req>
  80815d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808161:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808168:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80816b:	48 c7 05 6a 23 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2236a],0x0        # 42a4e0 <running_req>
  808172:	00 00 00 00 
    return ret;
  808176:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808179:	c9                   	leave  
  80817a:	c3                   	ret    

000000000080817b <write_disk>:
int write_disk(driver_args* args)
{
  80817b:	f3 0f 1e fa          	endbr64 
  80817f:	55                   	push   rbp
  808180:	48 89 e5             	mov    rbp,rsp
  808183:	48 83 ec 20          	sub    rsp,0x20
  808187:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  80818b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80818f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808192:	48 98                	cdqe   
  808194:	48 89 c2             	mov    rdx,rax
  808197:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80819b:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80819e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081a2:	8b 00                	mov    eax,DWORD PTR [rax]
  8081a4:	89 ce                	mov    esi,ecx
  8081a6:	89 c7                	mov    edi,eax
  8081a8:	e8 af 05 00 00       	call   80875c <write_disk_asm>
  8081ad:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8081b0:	48 8b 05 29 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22329]        # 42a4e0 <running_req>
  8081b7:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8081be:	48 8b 05 1b 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2231b]        # 42a4e0 <running_req>
  8081c5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8081c9:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8081d0:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8081d3:	48 c7 05 02 23 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22302],0x0        # 42a4e0 <running_req>
  8081da:	00 00 00 00 
    return ret;
  8081de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8081e1:	c9                   	leave  
  8081e2:	c3                   	ret    

00000000008081e3 <chk_result>:
int chk_result(int r)
{
  8081e3:	f3 0f 1e fa          	endbr64 
  8081e7:	55                   	push   rbp
  8081e8:	48 89 e5             	mov    rbp,rsp
  8081eb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8081ee:	90                   	nop
  8081ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8081f2:	48 63 d0             	movsxd rdx,eax
  8081f5:	48 89 d0             	mov    rax,rdx
  8081f8:	48 01 c0             	add    rax,rax
  8081fb:	48 01 d0             	add    rax,rdx
  8081fe:	48 c1 e0 04          	shl    rax,0x4
  808202:	48 05 fc 77 42 00    	add    rax,0x4277fc
  808208:	8b 00                	mov    eax,DWORD PTR [rax]
  80820a:	83 f8 03             	cmp    eax,0x3
  80820d:	75 e0                	jne    8081ef <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80820f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808212:	48 63 d0             	movsxd rdx,eax
  808215:	48 89 d0             	mov    rax,rdx
  808218:	48 01 c0             	add    rax,rax
  80821b:	48 01 d0             	add    rax,rdx
  80821e:	48 c1 e0 04          	shl    rax,0x4
  808222:	48 05 00 78 42 00    	add    rax,0x427800
  808228:	8b 00                	mov    eax,DWORD PTR [rax]
  80822a:	83 f8 01             	cmp    eax,0x1
  80822d:	0f 94 c0             	sete   al
  808230:	0f b6 c0             	movzx  eax,al
}
  808233:	5d                   	pop    rbp
  808234:	c3                   	ret    

0000000000808235 <disk_existent>:
int disk_existent(int disk)
{
  808235:	f3 0f 1e fa          	endbr64 
  808239:	55                   	push   rbp
  80823a:	48 89 e5             	mov    rbp,rsp
  80823d:	48 83 ec 10          	sub    rsp,0x10
  808241:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  808244:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  808248:	74 5f                	je     8082a9 <disk_existent+0x74>
  80824a:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80824e:	7f 6e                	jg     8082be <disk_existent+0x89>
  808250:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808254:	74 3e                	je     808294 <disk_existent+0x5f>
  808256:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80825a:	7f 62                	jg     8082be <disk_existent+0x89>
  80825c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808260:	74 08                	je     80826a <disk_existent+0x35>
  808262:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  808266:	74 17                	je     80827f <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  808268:	eb 54                	jmp    8082be <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  80826a:	bf b4 3f 81 00       	mov    edi,0x813fb4
  80826f:	e8 40 a7 ff ff       	call   8029b4 <sys_find_dev>
  808274:	83 f8 ff             	cmp    eax,0xffffffff
  808277:	0f 95 c0             	setne  al
  80827a:	0f b6 c0             	movzx  eax,al
  80827d:	eb 45                	jmp    8082c4 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  80827f:	bf b8 3f 81 00       	mov    edi,0x813fb8
  808284:	e8 2b a7 ff ff       	call   8029b4 <sys_find_dev>
  808289:	83 f8 ff             	cmp    eax,0xffffffff
  80828c:	0f 95 c0             	setne  al
  80828f:	0f b6 c0             	movzx  eax,al
  808292:	eb 30                	jmp    8082c4 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  808294:	bf bc 3f 81 00       	mov    edi,0x813fbc
  808299:	e8 16 a7 ff ff       	call   8029b4 <sys_find_dev>
  80829e:	83 f8 ff             	cmp    eax,0xffffffff
  8082a1:	0f 95 c0             	setne  al
  8082a4:	0f b6 c0             	movzx  eax,al
  8082a7:	eb 1b                	jmp    8082c4 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8082a9:	bf c0 3f 81 00       	mov    edi,0x813fc0
  8082ae:	e8 01 a7 ff ff       	call   8029b4 <sys_find_dev>
  8082b3:	83 f8 ff             	cmp    eax,0xffffffff
  8082b6:	0f 95 c0             	setne  al
  8082b9:	0f b6 c0             	movzx  eax,al
  8082bc:	eb 06                	jmp    8082c4 <disk_existent+0x8f>
        break;
  8082be:	90                   	nop
    }
    return 0;
  8082bf:	b8 00 00 00 00       	mov    eax,0x0
}
  8082c4:	c9                   	leave  
  8082c5:	c3                   	ret    

00000000008082c6 <hd_iterate>:
int hd_iterate()
{
  8082c6:	f3 0f 1e fa          	endbr64 
  8082ca:	55                   	push   rbp
  8082cb:	48 89 e5             	mov    rbp,rsp
  8082ce:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8082d5:	41 b8 00 00 00 00    	mov    r8d,0x0
  8082db:	b9 01 00 00 00       	mov    ecx,0x1
  8082e0:	ba 00 00 00 00       	mov    edx,0x0
  8082e5:	be 02 00 00 00       	mov    esi,0x2
  8082ea:	bf 00 00 00 00       	mov    edi,0x0
  8082ef:	e8 3b f8 ff ff       	call   807b2f <request>
  8082f4:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8082f7:	41 b8 00 00 00 00    	mov    r8d,0x0
  8082fd:	b9 01 00 00 00       	mov    ecx,0x1
  808302:	ba 00 00 00 00       	mov    edx,0x0
  808307:	be 02 00 00 00       	mov    esi,0x2
  80830c:	bf 01 00 00 00       	mov    edi,0x1
  808311:	e8 19 f8 ff ff       	call   807b2f <request>
  808316:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  808319:	41 b8 00 00 00 00    	mov    r8d,0x0
  80831f:	b9 01 00 00 00       	mov    ecx,0x1
  808324:	ba 00 00 00 00       	mov    edx,0x0
  808329:	be 02 00 00 00       	mov    esi,0x2
  80832e:	bf 02 00 00 00       	mov    edi,0x2
  808333:	e8 f7 f7 ff ff       	call   807b2f <request>
  808338:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80833b:	41 b8 00 00 00 00    	mov    r8d,0x0
  808341:	b9 01 00 00 00       	mov    ecx,0x1
  808346:	ba 00 00 00 00       	mov    edx,0x0
  80834b:	be 02 00 00 00       	mov    esi,0x2
  808350:	bf 03 00 00 00       	mov    edi,0x3
  808355:	e8 d5 f7 ff ff       	call   807b2f <request>
  80835a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  80835d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808364:	e9 72 01 00 00       	jmp    8084db <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808369:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80836d:	74 3b                	je     8083aa <hd_iterate+0xe4>
  80836f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808373:	7f 3e                	jg     8083b3 <hd_iterate+0xed>
  808375:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808379:	74 26                	je     8083a1 <hd_iterate+0xdb>
  80837b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80837f:	7f 32                	jg     8083b3 <hd_iterate+0xed>
  808381:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808385:	74 08                	je     80838f <hd_iterate+0xc9>
  808387:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80838b:	74 0b                	je     808398 <hd_iterate+0xd2>
  80838d:	eb 24                	jmp    8083b3 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  80838f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808396:	eb 25                	jmp    8083bd <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808398:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  80839f:	eb 1c                	jmp    8083bd <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8083a1:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8083a8:	eb 13                	jmp    8083bd <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8083aa:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8083b1:	eb 0a                	jmp    8083bd <hd_iterate+0xf7>
        default:
            return -1;
  8083b3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083b8:	e9 28 01 00 00       	jmp    8084e5 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8083bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8083c0:	48 98                	cdqe   
  8083c2:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8083c6:	89 c7                	mov    edi,eax
  8083c8:	e8 16 fe ff ff       	call   8081e3 <chk_result>
  8083cd:	85 c0                	test   eax,eax
  8083cf:	0f 84 81 00 00 00    	je     808456 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8083d5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8083d8:	89 c6                	mov    esi,eax
  8083da:	bf c4 3f 81 00       	mov    edi,0x813fc4
  8083df:	b8 00 00 00 00       	mov    eax,0x0
  8083e4:	e8 2f 89 ff ff       	call   800d18 <printf>
            //新硬盘
            device hd={
  8083e9:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  8083f0:	b8 00 00 00 00       	mov    eax,0x0
  8083f5:	b9 15 00 00 00       	mov    ecx,0x15
  8083fa:	48 89 d7             	mov    rdi,rdx
  8083fd:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  808400:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808403:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  808409:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  808410:	00 00 00 
  808413:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80841a:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  80841d:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808421:	7f 07                	jg     80842a <hd_iterate+0x164>
  808423:	b8 f0 01 00 00       	mov    eax,0x1f0
  808428:	eb 05                	jmp    80842f <hd_iterate+0x169>
  80842a:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80842f:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  808435:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80843c:	48 89 c7             	mov    rdi,rax
  80843f:	e8 38 a1 ff ff       	call   80257c <reg_device>
  808444:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  808447:	48 63 d2             	movsxd rdx,edx
  80844a:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  808451:	e9 81 00 00 00       	jmp    8084d7 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  808456:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808459:	48 98                	cdqe   
  80845b:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80845f:	89 c7                	mov    edi,eax
  808461:	e8 7d fd ff ff       	call   8081e3 <chk_result>
  808466:	85 c0                	test   eax,eax
  808468:	75 6d                	jne    8084d7 <hd_iterate+0x211>
        {
            switch (i)
  80846a:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80846e:	74 3e                	je     8084ae <hd_iterate+0x1e8>
  808470:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808474:	7f 41                	jg     8084b7 <hd_iterate+0x1f1>
  808476:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80847a:	74 28                	je     8084a4 <hd_iterate+0x1de>
  80847c:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808480:	7f 35                	jg     8084b7 <hd_iterate+0x1f1>
  808482:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808486:	74 08                	je     808490 <hd_iterate+0x1ca>
  808488:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80848c:	74 0c                	je     80849a <hd_iterate+0x1d4>
  80848e:	eb 27                	jmp    8084b7 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  808490:	48 c7 45 f8 b4 3f 81 	mov    QWORD PTR [rbp-0x8],0x813fb4
  808497:	00 
  808498:	eb 1d                	jmp    8084b7 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80849a:	48 c7 45 f8 b8 3f 81 	mov    QWORD PTR [rbp-0x8],0x813fb8
  8084a1:	00 
  8084a2:	eb 13                	jmp    8084b7 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8084a4:	48 c7 45 f8 bc 3f 81 	mov    QWORD PTR [rbp-0x8],0x813fbc
  8084ab:	00 
  8084ac:	eb 09                	jmp    8084b7 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8084ae:	48 c7 45 f8 c0 3f 81 	mov    QWORD PTR [rbp-0x8],0x813fc0
  8084b5:	00 
  8084b6:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8084b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8084bb:	48 89 c7             	mov    rdi,rax
  8084be:	e8 f1 a4 ff ff       	call   8029b4 <sys_find_dev>
  8084c3:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8084c6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8084c9:	89 c7                	mov    edi,eax
  8084cb:	e8 b8 ab ff ff       	call   803088 <get_dev>
  8084d0:	89 c7                	mov    edi,eax
  8084d2:	e8 04 ab ff ff       	call   802fdb <dispose_device>
    for(int i=0;i<1;i++)
  8084d7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8084db:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8084df:	0f 8e 84 fe ff ff    	jle    808369 <hd_iterate+0xa3>
        }

    }
}
  8084e5:	c9                   	leave  
  8084e6:	c3                   	ret    

00000000008084e7 <async_check_disk>:

int async_check_disk(int disk)
{
  8084e7:	f3 0f 1e fa          	endbr64 
  8084eb:	55                   	push   rbp
  8084ec:	48 89 e5             	mov    rbp,rsp
  8084ef:	48 83 ec 20          	sub    rsp,0x20
  8084f3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8084f6:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8084fc:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808502:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808506:	74 06                	je     80850e <async_check_disk+0x27>
  808508:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80850c:	75 06                	jne    808514 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80850e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  808514:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808518:	74 06                	je     808520 <async_check_disk+0x39>
  80851a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80851e:	75 06                	jne    808526 <async_check_disk+0x3f>
        chkcmd=0xf0;
  808520:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  808526:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80852a:	83 c0 02             	add    eax,0x2
  80852d:	0f b7 c0             	movzx  eax,ax
  808530:	be 01 00 00 00       	mov    esi,0x1
  808535:	89 c7                	mov    edi,eax
  808537:	e8 44 d1 ff ff       	call   805680 <outb>
    outb(disknr+3,0);
  80853c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808540:	83 c0 03             	add    eax,0x3
  808543:	0f b7 c0             	movzx  eax,ax
  808546:	be 00 00 00 00       	mov    esi,0x0
  80854b:	89 c7                	mov    edi,eax
  80854d:	e8 2e d1 ff ff       	call   805680 <outb>
    outb(disknr+4,0);
  808552:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808556:	83 c0 04             	add    eax,0x4
  808559:	0f b7 c0             	movzx  eax,ax
  80855c:	be 00 00 00 00       	mov    esi,0x0
  808561:	89 c7                	mov    edi,eax
  808563:	e8 18 d1 ff ff       	call   805680 <outb>
    outb(disknr+5,0);
  808568:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80856c:	83 c0 05             	add    eax,0x5
  80856f:	0f b7 c0             	movzx  eax,ax
  808572:	be 00 00 00 00       	mov    esi,0x0
  808577:	89 c7                	mov    edi,eax
  808579:	e8 02 d1 ff ff       	call   805680 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80857e:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  808582:	0f b6 d0             	movzx  edx,al
  808585:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808589:	83 c0 06             	add    eax,0x6
  80858c:	0f b7 c0             	movzx  eax,ax
  80858f:	89 d6                	mov    esi,edx
  808591:	89 c7                	mov    edi,eax
  808593:	e8 e8 d0 ff ff       	call   805680 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808598:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80859c:	83 c0 07             	add    eax,0x7
  80859f:	0f b7 c0             	movzx  eax,ax
  8085a2:	be 90 00 00 00       	mov    esi,0x90
  8085a7:	89 c7                	mov    edi,eax
  8085a9:	e8 d2 d0 ff ff       	call   805680 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8085ae:	b8 00 00 00 00       	mov    eax,0x0
}
  8085b3:	c9                   	leave  
  8085b4:	c3                   	ret    

00000000008085b5 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8085b5:	f3 0f 1e fa          	endbr64 
  8085b9:	55                   	push   rbp
  8085ba:	48 89 e5             	mov    rbp,rsp
  8085bd:	48 83 ec 18          	sub    rsp,0x18
  8085c1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8085c5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8085cc:	eb 04                	jmp    8085d2 <hd_do_req+0x1d>
  8085ce:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8085d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8085d5:	48 98                	cdqe   
  8085d7:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  8085de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085e2:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8085e8:	39 c2                	cmp    edx,eax
  8085ea:	75 e2                	jne    8085ce <hd_do_req+0x19>
    switch (args->cmd)
  8085ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085f0:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8085f6:	83 f8 04             	cmp    eax,0x4
  8085f9:	74 72                	je     80866d <hd_do_req+0xb8>
  8085fb:	83 f8 04             	cmp    eax,0x4
  8085fe:	0f 8f 96 00 00 00    	jg     80869a <hd_do_req+0xe5>
  808604:	83 f8 02             	cmp    eax,0x2
  808607:	74 0a                	je     808613 <hd_do_req+0x5e>
  808609:	83 f8 03             	cmp    eax,0x3
  80860c:	74 32                	je     808640 <hd_do_req+0x8b>
  80860e:	e9 87 00 00 00       	jmp    80869a <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  808613:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808617:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80861a:	48 98                	cdqe   
  80861c:	48 89 c6             	mov    rsi,rax
  80861f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808623:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808626:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80862a:	8b 10                	mov    edx,DWORD PTR [rax]
  80862c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80862f:	49 89 f0             	mov    r8,rsi
  808632:	be 00 00 00 00       	mov    esi,0x0
  808637:	89 c7                	mov    edi,eax
  808639:	e8 f1 f4 ff ff       	call   807b2f <request>
        break;
  80863e:	eb 61                	jmp    8086a1 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  808640:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808644:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808647:	48 98                	cdqe   
  808649:	48 89 c6             	mov    rsi,rax
  80864c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808650:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808653:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808657:	8b 10                	mov    edx,DWORD PTR [rax]
  808659:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80865c:	49 89 f0             	mov    r8,rsi
  80865f:	be 01 00 00 00       	mov    esi,0x1
  808664:	89 c7                	mov    edi,eax
  808666:	e8 c4 f4 ff ff       	call   807b2f <request>
        break;
  80866b:	eb 34                	jmp    8086a1 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  80866d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808671:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808674:	48 98                	cdqe   
  808676:	48 89 c6             	mov    rsi,rax
  808679:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80867d:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808680:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808684:	8b 10                	mov    edx,DWORD PTR [rax]
  808686:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808689:	49 89 f0             	mov    r8,rsi
  80868c:	be 02 00 00 00       	mov    esi,0x2
  808691:	89 c7                	mov    edi,eax
  808693:	e8 97 f4 ff ff       	call   807b2f <request>
        break;
  808698:	eb 07                	jmp    8086a1 <hd_do_req+0xec>
    default:return -1;
  80869a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80869f:	eb 1e                	jmp    8086bf <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  8086a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086a5:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8086ac:	00 00 00 
    running_devman_req=args;
  8086af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086b3:	48 89 05 2e 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e2e],rax        # 42a4e8 <running_devman_req>
    return 0;
  8086ba:	b8 00 00 00 00       	mov    eax,0x0
  8086bf:	c9                   	leave  
  8086c0:	c3                   	ret    
  8086c1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8086c8:	00 00 00 
  8086cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008086d0 <disk_int_handler>:
  8086d0:	e8 d9 cf ff ff       	call   8056ae <eoi>
  8086d5:	e8 66 f2 ff ff       	call   807940 <disk_int_handler_c>
  8086da:	48 cf                	iretq  

00000000008086dc <read_disk_asm>:
  8086dc:	55                   	push   rbp
  8086dd:	89 e5                	mov    ebp,esp
  8086df:	66 ba f7 01          	mov    dx,0x1f7
  8086e3:	31 c9                	xor    ecx,ecx
  8086e5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8086ea:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8086ef:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8086f4:	89 c6                	mov    esi,eax
  8086f6:	66 ba f2 01          	mov    dx,0x1f2
  8086fa:	88 c8                	mov    al,cl
  8086fc:	ee                   	out    dx,al
  8086fd:	66 ba f3 01          	mov    dx,0x1f3
  808701:	89 f0                	mov    eax,esi
  808703:	ee                   	out    dx,al
  808704:	66 ff c2             	inc    dx
  808707:	c1 e8 08             	shr    eax,0x8
  80870a:	ee                   	out    dx,al
  80870b:	66 ff c2             	inc    dx
  80870e:	c1 e8 08             	shr    eax,0x8
  808711:	ee                   	out    dx,al
  808712:	66 ff c2             	inc    dx
  808715:	66 c1 e8 08          	shr    ax,0x8
  808719:	24 0f                	and    al,0xf
  80871b:	0c e0                	or     al,0xe0
  80871d:	ee                   	out    dx,al
  80871e:	66 ff c2             	inc    dx
  808721:	b0 20                	mov    al,0x20
  808723:	ee                   	out    dx,al

0000000000808724 <read_disk_asm.wait>:
  808724:	90                   	nop
  808725:	ec                   	in     al,dx
  808726:	24 88                	and    al,0x88
  808728:	3c 08                	cmp    al,0x8
  80872a:	75 f8                	jne    808724 <read_disk_asm.wait>
  80872c:	66 89 d7             	mov    di,dx
  80872f:	89 c8                	mov    eax,ecx
  808731:	66 b9 00 01          	mov    cx,0x100
  808735:	66 f7 e1             	mul    cx
  808738:	89 c1                	mov    ecx,eax
  80873a:	66 ba f0 01          	mov    dx,0x1f0

000000000080873e <read_disk_asm.read>:
  80873e:	66 ed                	in     ax,dx
  808740:	66 67 89 03          	mov    WORD PTR [ebx],ax
  808744:	83 c3 02             	add    ebx,0x2
  808747:	e2 f5                	loop   80873e <read_disk_asm.read>
  808749:	c9                   	leave  
  80874a:	b8 00 00 00 00       	mov    eax,0x0
  80874f:	c3                   	ret    

0000000000808750 <read_disk_asm.err_disk_reading>:
  808750:	66 ba f1 01          	mov    dx,0x1f1
  808754:	31 c0                	xor    eax,eax
  808756:	66 ed                	in     ax,dx
  808758:	89 ec                	mov    esp,ebp
  80875a:	5d                   	pop    rbp
  80875b:	c3                   	ret    

000000000080875c <write_disk_asm>:
  80875c:	55                   	push   rbp
  80875d:	89 e5                	mov    ebp,esp
  80875f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808764:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808769:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80876e:	50                   	push   rax
  80876f:	66 ba f2 01          	mov    dx,0x1f2
  808773:	88 c8                	mov    al,cl
  808775:	ee                   	out    dx,al
  808776:	58                   	pop    rax
  808777:	66 ba f3 01          	mov    dx,0x1f3
  80877b:	ee                   	out    dx,al
  80877c:	c1 e8 08             	shr    eax,0x8
  80877f:	66 ba f4 01          	mov    dx,0x1f4
  808783:	ee                   	out    dx,al
  808784:	c1 e8 08             	shr    eax,0x8
  808787:	66 ba f5 01          	mov    dx,0x1f5
  80878b:	ee                   	out    dx,al
  80878c:	c1 e8 08             	shr    eax,0x8
  80878f:	24 0f                	and    al,0xf
  808791:	0c e0                	or     al,0xe0
  808793:	66 ba f6 01          	mov    dx,0x1f6
  808797:	ee                   	out    dx,al
  808798:	66 ba f7 01          	mov    dx,0x1f7
  80879c:	b0 30                	mov    al,0x30
  80879e:	ee                   	out    dx,al

000000000080879f <write_disk_asm.not_ready2>:
  80879f:	90                   	nop
  8087a0:	ec                   	in     al,dx
  8087a1:	24 88                	and    al,0x88
  8087a3:	3c 08                	cmp    al,0x8
  8087a5:	75 f8                	jne    80879f <write_disk_asm.not_ready2>
  8087a7:	89 c8                	mov    eax,ecx
  8087a9:	66 b9 00 01          	mov    cx,0x100
  8087ad:	66 f7 e1             	mul    cx
  8087b0:	89 c1                	mov    ecx,eax
  8087b2:	66 ba f0 01          	mov    dx,0x1f0

00000000008087b6 <write_disk_asm.go_on_write>:
  8087b6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8087ba:	66 ef                	out    dx,ax
  8087bc:	83 c3 02             	add    ebx,0x2
  8087bf:	e2 f5                	loop   8087b6 <write_disk_asm.go_on_write>
  8087c1:	89 ec                	mov    esp,ebp
  8087c3:	5d                   	pop    rbp
  8087c4:	c3                   	ret    

00000000008087c5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  8087c5:	f3 0f 1e fa          	endbr64 
  8087c9:	55                   	push   rbp
  8087ca:	48 89 e5             	mov    rbp,rsp
  8087cd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8087d4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8087db:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  8087e1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8087e8:	ba 00 02 00 00       	mov    edx,0x200
  8087ed:	be 00 00 00 00       	mov    esi,0x0
  8087f2:	48 89 c7             	mov    rdi,rax
  8087f5:	e8 66 2e 00 00       	call   80b660 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8087fa:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808801:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808805:	89 c2                	mov    edx,eax
  808807:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80880d:	c1 e8 07             	shr    eax,0x7
  808810:	01 d0                	add    eax,edx
  808812:	89 c2                	mov    edx,eax
  808814:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80881b:	49 89 c0             	mov    r8,rax
  80881e:	b9 01 00 00 00       	mov    ecx,0x1
  808823:	be 00 00 00 00       	mov    esi,0x0
  808828:	bf 00 00 00 00       	mov    edi,0x0
  80882d:	e8 fd f2 ff ff       	call   807b2f <request>
  808832:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  808835:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808838:	89 c7                	mov    edi,eax
  80883a:	e8 a4 f9 ff ff       	call   8081e3 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80883f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808845:	83 e0 7f             	and    eax,0x7f
  808848:	89 c0                	mov    eax,eax
  80884a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  808851:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808857:	89 c6                	mov    esi,eax
  808859:	bf d8 3f 81 00       	mov    edi,0x813fd8
  80885e:	b8 00 00 00 00       	mov    eax,0x0
  808863:	e8 b0 84 ff ff       	call   800d18 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808868:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80886e:	83 e0 7f             	and    eax,0x7f
  808871:	89 c0                	mov    eax,eax
  808873:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80887a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80887f:	c9                   	leave  
  808880:	c3                   	ret    

0000000000808881 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808881:	f3 0f 1e fa          	endbr64 
  808885:	55                   	push   rbp
  808886:	48 89 e5             	mov    rbp,rsp
  808889:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808890:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808897:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80889d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  8088a3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8088aa:	ba 00 02 00 00       	mov    edx,0x200
  8088af:	be 00 00 00 00       	mov    esi,0x0
  8088b4:	48 89 c7             	mov    rdi,rax
  8088b7:	e8 a4 2d 00 00       	call   80b660 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8088bc:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8088c3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8088c7:	89 c2                	mov    edx,eax
  8088c9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088cf:	c1 e8 07             	shr    eax,0x7
  8088d2:	01 d0                	add    eax,edx
  8088d4:	89 c2                	mov    edx,eax
  8088d6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8088dd:	49 89 c0             	mov    r8,rax
  8088e0:	b9 01 00 00 00       	mov    ecx,0x1
  8088e5:	be 00 00 00 00       	mov    esi,0x0
  8088ea:	bf 00 00 00 00       	mov    edi,0x0
  8088ef:	e8 3b f2 ff ff       	call   807b2f <request>
  8088f4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  8088f7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8088fa:	89 c7                	mov    edi,eax
  8088fc:	e8 e2 f8 ff ff       	call   8081e3 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  808901:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808907:	83 e0 7f             	and    eax,0x7f
  80890a:	89 c0                	mov    eax,eax
  80890c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808913:	25 00 00 00 f0       	and    eax,0xf0000000
  808918:	89 c6                	mov    esi,eax
  80891a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  808920:	25 ff ff ff 0f       	and    eax,0xfffffff
  808925:	89 c1                	mov    ecx,eax
  808927:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80892d:	83 e0 7f             	and    eax,0x7f
  808930:	89 c2                	mov    edx,eax
  808932:	89 f0                	mov    eax,esi
  808934:	09 c8                	or     eax,ecx
  808936:	89 d2                	mov    edx,edx
  808938:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80893f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808946:	eb 61                	jmp    8089a9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  808948:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80894f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808953:	89 c1                	mov    ecx,eax
  808955:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80895c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808960:	89 c2                	mov    edx,eax
  808962:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808965:	48 98                	cdqe   
  808967:	0f af c2             	imul   eax,edx
  80896a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80896d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808973:	c1 e8 07             	shr    eax,0x7
  808976:	01 d0                	add    eax,edx
  808978:	89 c2                	mov    edx,eax
  80897a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808981:	49 89 c0             	mov    r8,rax
  808984:	b9 01 00 00 00       	mov    ecx,0x1
  808989:	be 01 00 00 00       	mov    esi,0x1
  80898e:	bf 00 00 00 00       	mov    edi,0x0
  808993:	e8 97 f1 ff ff       	call   807b2f <request>
  808998:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80899b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80899e:	89 c7                	mov    edi,eax
  8089a0:	e8 3e f8 ff ff       	call   8081e3 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  8089a5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8089a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8089ac:	48 63 d0             	movsxd rdx,eax
  8089af:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8089b6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8089ba:	48 39 c2             	cmp    rdx,rax
  8089bd:	72 89                	jb     808948 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  8089bf:	b8 01 00 00 00       	mov    eax,0x1
}
  8089c4:	c9                   	leave  
  8089c5:	c3                   	ret    

00000000008089c6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  8089c6:	f3 0f 1e fa          	endbr64 
  8089ca:	55                   	push   rbp
  8089cb:	48 89 e5             	mov    rbp,rsp
  8089ce:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8089d2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8089d6:	b8 01 00 00 00       	mov    eax,0x1
}
  8089db:	5d                   	pop    rbp
  8089dc:	c3                   	ret    

00000000008089dd <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  8089dd:	f3 0f 1e fa          	endbr64 
  8089e1:	55                   	push   rbp
  8089e2:	48 89 e5             	mov    rbp,rsp
  8089e5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8089e9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8089ed:	b8 01 00 00 00       	mov    eax,0x1
}
  8089f2:	5d                   	pop    rbp
  8089f3:	c3                   	ret    

00000000008089f4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  8089f4:	f3 0f 1e fa          	endbr64 
  8089f8:	55                   	push   rbp
  8089f9:	48 89 e5             	mov    rbp,rsp
  8089fc:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808a00:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  808a04:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  808a08:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  808a0c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808a10:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a14:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808a18:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808a1c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808a20:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808a24:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a28:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808a2c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808a30:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808a34:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808a38:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  808a3c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808a40:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a43:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  808a47:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808a4e:	00 
	int i,length = 0;
  808a4f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  808a56:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808a5d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808a5e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808a62:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a65:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808a69:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808a6d:	48 99                	cqo    
  808a6f:	48 f7 fe             	idiv   rsi
  808a72:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808a75:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808a79:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a7c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808a80:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808a84:	48 99                	cqo    
  808a86:	48 f7 f9             	idiv   rcx
  808a89:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808a8d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a91:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808a95:	be 00 00 00 00       	mov    esi,0x0
  808a9a:	48 89 c7             	mov    rdi,rax
  808a9d:	b8 00 00 00 00       	mov    eax,0x0
  808aa2:	e8 03 88 ff ff       	call   8012aa <vmalloc>
  808aa7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  808aab:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808ab0:	75 0c                	jne    808abe <FAT32_read+0xca>
		return -EFAULT;
  808ab2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808ab9:	e9 f0 01 00 00       	jmp    808cae <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  808abe:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808ac5:	eb 1e                	jmp    808ae5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808ac7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808acb:	89 c2                	mov    edx,eax
  808acd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808ad1:	89 d6                	mov    esi,edx
  808ad3:	48 89 c7             	mov    rdi,rax
  808ad6:	e8 ea fc ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  808adb:	89 c0                	mov    eax,eax
  808add:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  808ae1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808ae5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ae8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808aeb:	7c da                	jl     808ac7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  808aed:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808af1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808af4:	48 89 c2             	mov    rdx,rax
  808af7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808afb:	48 01 c2             	add    rdx,rax
  808afe:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b02:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b06:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808b0a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b0d:	48 39 c2             	cmp    rdx,rax
  808b10:	76 2c                	jbe    808b3e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  808b12:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b16:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b1a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808b1e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808b21:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b28:	48 89 c1             	mov    rcx,rax
  808b2b:	48 89 d0             	mov    rax,rdx
  808b2e:	48 29 c8             	sub    rax,rcx
  808b31:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  808b35:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808b39:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  808b3c:	eb 07                	jmp    808b45 <FAT32_read+0x151>
	else
		index = count;
  808b3e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808b42:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  808b45:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b49:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b4d:	89 c2                	mov    edx,eax
  808b4f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808b53:	be 00 00 00 00       	mov    esi,0x0
  808b58:	48 89 c7             	mov    rdi,rax
  808b5b:	e8 00 2b 00 00       	call   80b660 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808b60:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b64:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808b68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b6c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808b70:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b74:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b78:	48 0f af c2          	imul   rax,rdx
  808b7c:	48 01 c8             	add    rax,rcx
  808b7f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808b83:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b87:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b8b:	89 c1                	mov    ecx,eax
  808b8d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808b91:	89 c2                	mov    edx,eax
  808b93:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808b97:	49 89 c0             	mov    r8,rax
  808b9a:	be 00 00 00 00       	mov    esi,0x0
  808b9f:	bf 00 00 00 00       	mov    edi,0x0
  808ba4:	e8 86 ef ff ff       	call   807b2f <request>
  808ba9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  808bac:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808baf:	89 c7                	mov    edi,eax
  808bb1:	e8 2d f6 ff ff       	call   8081e3 <chk_result>
  808bb6:	85 c0                	test   eax,eax
  808bb8:	75 1c                	jne    808bd6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  808bba:	bf 08 40 81 00       	mov    edi,0x814008
  808bbf:	b8 00 00 00 00       	mov    eax,0x0
  808bc4:	e8 4f 81 ff ff       	call   800d18 <printf>
			retval = -EIO;
  808bc9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  808bd0:	ff 
			break;
  808bd1:	e9 ba 00 00 00       	jmp    808c90 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808bd6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808bd9:	48 63 d0             	movsxd rdx,eax
  808bdc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808be0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808be4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  808be8:	48 39 c2             	cmp    rdx,rax
  808beb:	48 0f 4e c2          	cmovle rax,rdx
  808bef:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  808bf2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808bf6:	48 83 f8 1f          	cmp    rax,0x1f
  808bfa:	77 1f                	ja     808c1b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  808bfc:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808bff:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808c03:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c07:	48 01 c1             	add    rcx,rax
  808c0a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808c0e:	48 89 c6             	mov    rsi,rax
  808c11:	48 89 cf             	mov    rdi,rcx
  808c14:	e8 98 29 00 00       	call   80b5b1 <memcpy>
  808c19:	eb 1d                	jmp    808c38 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  808c1b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808c1e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808c22:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c26:	48 01 c1             	add    rcx,rax
  808c29:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808c2d:	48 89 c6             	mov    rsi,rax
  808c30:	48 89 cf             	mov    rdi,rcx
  808c33:	e8 79 29 00 00       	call   80b5b1 <memcpy>

		index -= length;
  808c38:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808c3b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  808c3e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808c41:	48 98                	cdqe   
  808c43:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  808c47:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808c4e:	00 
		*position += length;
  808c4f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808c53:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808c56:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808c59:	48 98                	cdqe   
  808c5b:	48 01 c2             	add    rdx,rax
  808c5e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808c62:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  808c65:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808c69:	74 25                	je     808c90 <FAT32_read+0x29c>
  808c6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c6f:	89 c2                	mov    edx,eax
  808c71:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c75:	89 d6                	mov    esi,edx
  808c77:	48 89 c7             	mov    rdi,rax
  808c7a:	e8 46 fb ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  808c7f:	89 c0                	mov    eax,eax
  808c81:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808c85:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808c8a:	0f 85 b5 fe ff ff    	jne    808b45 <FAT32_read+0x151>

	vmfree(buffer);
  808c90:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c94:	48 89 c7             	mov    rdi,rax
  808c97:	e8 9d 86 ff ff       	call   801339 <vmfree>
	if(!index)
  808c9c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808ca0:	75 08                	jne    808caa <FAT32_read+0x2b6>
		retval = count;
  808ca2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808ca6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  808caa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  808cae:	c9                   	leave  
  808caf:	c3                   	ret    

0000000000808cb0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  808cb0:	f3 0f 1e fa          	endbr64 
  808cb4:	55                   	push   rbp
  808cb5:	48 89 e5             	mov    rbp,rsp
  808cb8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  808cbf:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  808cc6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808ccd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808cd1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  808cd5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808cdc:	e9 8b 00 00 00       	jmp    808d6c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  808ce1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808ce8:	ba 00 02 00 00       	mov    edx,0x200
  808ced:	be 00 00 00 00       	mov    esi,0x0
  808cf2:	48 89 c7             	mov    rdi,rax
  808cf5:	e8 66 29 00 00       	call   80b660 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  808cfa:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808d01:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808d05:	89 c2                	mov    edx,eax
  808d07:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d0a:	01 d0                	add    eax,edx
  808d0c:	89 c2                	mov    edx,eax
  808d0e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808d15:	49 89 c0             	mov    r8,rax
  808d18:	b9 01 00 00 00       	mov    ecx,0x1
  808d1d:	be 00 00 00 00       	mov    esi,0x0
  808d22:	bf 00 00 00 00       	mov    edi,0x0
  808d27:	e8 03 ee ff ff       	call   807b2f <request>
  808d2c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  808d2f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808d36:	eb 2a                	jmp    808d62 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  808d38:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808d3b:	48 98                	cdqe   
  808d3d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  808d44:	25 ff ff ff 0f       	and    eax,0xfffffff
  808d49:	85 c0                	test   eax,eax
  808d4b:	75 11                	jne    808d5e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  808d4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d50:	c1 e0 07             	shl    eax,0x7
  808d53:	89 c2                	mov    edx,eax
  808d55:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808d58:	01 d0                	add    eax,edx
  808d5a:	48 98                	cdqe   
  808d5c:	eb 22                	jmp    808d80 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  808d5e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808d62:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  808d66:	7e d0                	jle    808d38 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  808d68:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808d6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d6f:	48 98                	cdqe   
  808d71:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  808d75:	0f 87 66 ff ff ff    	ja     808ce1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  808d7b:	b8 00 00 00 00       	mov    eax,0x0
}
  808d80:	c9                   	leave  
  808d81:	c3                   	ret    

0000000000808d82 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  808d82:	f3 0f 1e fa          	endbr64 
  808d86:	55                   	push   rbp
  808d87:	48 89 e5             	mov    rbp,rsp
  808d8a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  808d91:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  808d95:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  808d99:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808da0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808da7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808dab:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808daf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808db3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808db7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808dbb:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808dbf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808dc3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808dc7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808dcb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808dcf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  808dd3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808dd7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808dda:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  808dde:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  808de5:	00 
	unsigned long sector = 0;
  808de6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808ded:	00 
	int i,length = 0;
  808dee:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  808df5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808dfc:	00 
	long flags = 0;
  808dfd:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808e04:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808e05:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808e0c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e0f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808e13:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808e17:	48 99                	cqo    
  808e19:	48 f7 fe             	idiv   rsi
  808e1c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808e1f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808e26:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e29:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808e2d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808e31:	48 99                	cqo    
  808e33:	48 f7 f9             	idiv   rcx
  808e36:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808e3a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808e3e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808e42:	be 00 00 00 00       	mov    esi,0x0
  808e47:	48 89 c7             	mov    rdi,rax
  808e4a:	b8 00 00 00 00       	mov    eax,0x0
  808e4f:	e8 56 84 ff ff       	call   8012aa <vmalloc>
  808e54:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  808e58:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808e5d:	75 1a                	jne    808e79 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  808e5f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808e63:	48 89 c7             	mov    rdi,rax
  808e66:	e8 45 fe ff ff       	call   808cb0 <FAT32_find_available_cluster>
  808e6b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  808e6f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808e76:	00 
  808e77:	eb 2f                	jmp    808ea8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  808e79:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808e80:	eb 1e                	jmp    808ea0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808e82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e86:	89 c2                	mov    edx,eax
  808e88:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808e8c:	89 d6                	mov    esi,edx
  808e8e:	48 89 c7             	mov    rdi,rax
  808e91:	e8 2f f9 ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  808e96:	89 c0                	mov    eax,eax
  808e98:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  808e9c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808ea0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808ea3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  808ea6:	7c da                	jl     808e82 <FAT32_write+0x100>

	if(!cluster)
  808ea8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808ead:	75 18                	jne    808ec7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  808eaf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808eb3:	48 89 c7             	mov    rdi,rax
  808eb6:	e8 7e 84 ff ff       	call   801339 <vmfree>
		return -ENOSPC;
  808ebb:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808ec2:	e9 13 03 00 00       	jmp    8091da <FAT32_write+0x458>
	}

	if(flags)
  808ec7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808ecc:	74 4d                	je     808f1b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  808ece:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808ed2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808ed6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808ed9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808edd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ee1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ee5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ee9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808eed:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808ef1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808ef5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ef9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808efd:	48 89 c7             	mov    rdi,rax
  808f00:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  808f02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f06:	89 c1                	mov    ecx,eax
  808f08:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f0c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  808f11:	89 ce                	mov    esi,ecx
  808f13:	48 89 c7             	mov    rdi,rax
  808f16:	e8 66 f9 ff ff       	call   808881 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  808f1b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808f22:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  808f25:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808f2a:	0f 85 91 00 00 00    	jne    808fc1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  808f30:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f34:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f38:	89 c2                	mov    edx,eax
  808f3a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f3e:	be 00 00 00 00       	mov    esi,0x0
  808f43:	48 89 c7             	mov    rdi,rax
  808f46:	e8 15 27 00 00       	call   80b660 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808f4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f4f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808f53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f57:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808f5b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f5f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f63:	48 0f af c2          	imul   rax,rdx
  808f67:	48 01 c8             	add    rax,rcx
  808f6a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808f6e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f72:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f76:	89 c1                	mov    ecx,eax
  808f78:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808f7c:	89 c2                	mov    edx,eax
  808f7e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f82:	49 89 c0             	mov    r8,rax
  808f85:	be 00 00 00 00       	mov    esi,0x0
  808f8a:	bf 00 00 00 00       	mov    edi,0x0
  808f8f:	e8 9b eb ff ff       	call   807b2f <request>
  808f94:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  808f97:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  808f9a:	89 c7                	mov    edi,eax
  808f9c:	e8 42 f2 ff ff       	call   8081e3 <chk_result>
  808fa1:	85 c0                	test   eax,eax
  808fa3:	75 1c                	jne    808fc1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  808fa5:	bf 38 40 81 00       	mov    edi,0x814038
  808faa:	b8 00 00 00 00       	mov    eax,0x0
  808faf:	e8 64 7d ff ff       	call   800d18 <printf>
				retval = -EIO;
  808fb4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  808fbb:	ff 
				break;
  808fbc:	e9 95 01 00 00       	jmp    809156 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808fc1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  808fc4:	48 63 d0             	movsxd rdx,eax
  808fc7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fcb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808fcf:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  808fd3:	48 39 c2             	cmp    rdx,rax
  808fd6:	48 0f 4e c2          	cmovle rax,rdx
  808fda:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  808fdd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808fe1:	48 83 f8 1f          	cmp    rax,0x1f
  808fe5:	77 1f                	ja     809006 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  808fe7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808fea:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  808fee:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ff2:	48 01 c1             	add    rcx,rax
  808ff5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808ff9:	48 89 ce             	mov    rsi,rcx
  808ffc:	48 89 c7             	mov    rdi,rax
  808fff:	e8 ad 25 00 00       	call   80b5b1 <memcpy>
  809004:	eb 1d                	jmp    809023 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809006:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809009:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80900d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809011:	48 01 c1             	add    rcx,rax
  809014:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809018:	48 89 ce             	mov    rsi,rcx
  80901b:	48 89 c7             	mov    rdi,rax
  80901e:	e8 8e 25 00 00       	call   80b5b1 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809023:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809027:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80902b:	89 c1                	mov    ecx,eax
  80902d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809031:	89 c2                	mov    edx,eax
  809033:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809037:	49 89 c0             	mov    r8,rax
  80903a:	be 01 00 00 00       	mov    esi,0x1
  80903f:	bf 00 00 00 00       	mov    edi,0x0
  809044:	e8 e6 ea ff ff       	call   807b2f <request>
  809049:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80904c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80904f:	89 c7                	mov    edi,eax
  809051:	e8 8d f1 ff ff       	call   8081e3 <chk_result>
  809056:	85 c0                	test   eax,eax
  809058:	75 1c                	jne    809076 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80905a:	bf 68 40 81 00       	mov    edi,0x814068
  80905f:	b8 00 00 00 00       	mov    eax,0x0
  809064:	e8 af 7c ff ff       	call   800d18 <printf>
			retval = -EIO;
  809069:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809070:	ff 
			break;
  809071:	e9 e0 00 00 00       	jmp    809156 <FAT32_write+0x3d4>
		}

		index -= length;
  809076:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809079:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80907c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80907f:	48 98                	cdqe   
  809081:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809085:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80908c:	00 
		*position += length;
  80908d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809094:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809097:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80909a:	48 98                	cdqe   
  80909c:	48 01 c2             	add    rdx,rax
  80909f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8090a6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  8090a9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8090ad:	0f 84 a2 00 00 00    	je     809155 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8090b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090b7:	89 c2                	mov    edx,eax
  8090b9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090bd:	89 d6                	mov    esi,edx
  8090bf:	48 89 c7             	mov    rdi,rax
  8090c2:	e8 fe f6 ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  8090c7:	89 c0                	mov    eax,eax
  8090c9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  8090cd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  8090d4:	0f 
  8090d5:	76 72                	jbe    809149 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  8090d7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090db:	48 89 c7             	mov    rdi,rax
  8090de:	e8 cd fb ff ff       	call   808cb0 <FAT32_find_available_cluster>
  8090e3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  8090e7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  8090ec:	75 18                	jne    809106 <FAT32_write+0x384>
			{
				vmfree(buffer);
  8090ee:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090f2:	48 89 c7             	mov    rdi,rax
  8090f5:	e8 3f 82 ff ff       	call   801339 <vmfree>
				return -ENOSPC;
  8090fa:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809101:	e9 d4 00 00 00       	jmp    8091da <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809106:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80910a:	89 c2                	mov    edx,eax
  80910c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809110:	89 c1                	mov    ecx,eax
  809112:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809116:	89 ce                	mov    esi,ecx
  809118:	48 89 c7             	mov    rdi,rax
  80911b:	e8 61 f7 ff ff       	call   808881 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  809120:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809124:	89 c1                	mov    ecx,eax
  809126:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80912a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80912f:	89 ce                	mov    esi,ecx
  809131:	48 89 c7             	mov    rdi,rax
  809134:	e8 48 f7 ff ff       	call   808881 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  809139:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80913d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  809141:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809148:	00 
		}

	}while(index);
  809149:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80914d:	0f 85 d2 fd ff ff    	jne    808f25 <FAT32_write+0x1a3>
  809153:	eb 01                	jmp    809156 <FAT32_write+0x3d4>
			break;
  809155:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  809156:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80915d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809160:	48 89 c2             	mov    rdx,rax
  809163:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809167:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80916b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80916f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809172:	48 39 c2             	cmp    rdx,rax
  809175:	76 42                	jbe    8091b9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  809177:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80917e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809181:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809185:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809189:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80918d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809190:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809194:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809198:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80919c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091a0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8091a4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8091a8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8091ac:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091b0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091b4:	48 89 c7             	mov    rdi,rax
  8091b7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  8091b9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091bd:	48 89 c7             	mov    rdi,rax
  8091c0:	e8 74 81 ff ff       	call   801339 <vmfree>
	if(!index)
  8091c5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8091c9:	75 0b                	jne    8091d6 <FAT32_write+0x454>
		retval = count;
  8091cb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8091d2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  8091d6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8091da:	c9                   	leave  
  8091db:	c3                   	ret    

00000000008091dc <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  8091dc:	f3 0f 1e fa          	endbr64 
  8091e0:	55                   	push   rbp
  8091e1:	48 89 e5             	mov    rbp,rsp
  8091e4:	48 83 ec 30          	sub    rsp,0x30
  8091e8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8091ec:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8091f0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  8091f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8091f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091fc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809200:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809204:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80920b:	00 

	switch(origin)
  80920c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809211:	74 21                	je     809234 <FAT32_lseek+0x58>
  809213:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809218:	7f 4a                	jg     809264 <FAT32_lseek+0x88>
  80921a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80921f:	74 09                	je     80922a <FAT32_lseek+0x4e>
  809221:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  809226:	74 20                	je     809248 <FAT32_lseek+0x6c>
  809228:	eb 3a                	jmp    809264 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80922a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80922e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809232:	eb 39                	jmp    80926d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  809234:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809238:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80923b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80923f:	48 01 d0             	add    rax,rdx
  809242:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809246:	eb 25                	jmp    80926d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  809248:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80924c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809250:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809254:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809257:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80925b:	48 01 d0             	add    rax,rdx
  80925e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809262:	eb 09                	jmp    80926d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  809264:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80926b:	eb 50                	jmp    8092bd <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80926d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809272:	78 18                	js     80928c <FAT32_lseek+0xb0>
  809274:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809278:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80927c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809280:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809283:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809287:	48 39 c2             	cmp    rdx,rax
  80928a:	73 09                	jae    809295 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80928c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809293:	eb 28                	jmp    8092bd <FAT32_lseek+0xe1>

	filp->position = pos;
  809295:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809299:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80929d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  8092a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092a7:	48 89 c6             	mov    rsi,rax
  8092aa:	bf 98 40 81 00       	mov    edi,0x814098
  8092af:	b8 00 00 00 00       	mov    eax,0x0
  8092b4:	e8 5f 7a ff ff       	call   800d18 <printf>

	return pos;
  8092b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8092bd:	c9                   	leave  
  8092be:	c3                   	ret    

00000000008092bf <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  8092bf:	f3 0f 1e fa          	endbr64 
  8092c3:	55                   	push   rbp
  8092c4:	48 89 e5             	mov    rbp,rsp
  8092c7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8092cb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8092cf:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8092d3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8092d7:	90                   	nop
  8092d8:	5d                   	pop    rbp
  8092d9:	c3                   	ret    

00000000008092da <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  8092da:	f3 0f 1e fa          	endbr64 
  8092de:	55                   	push   rbp
  8092df:	48 89 e5             	mov    rbp,rsp
  8092e2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8092e6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8092ea:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8092ee:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  8092f2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8092f6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092fa:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092fe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809302:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809306:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80930a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80930e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809312:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809316:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80931a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80931e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809325:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80932c:	00 
	unsigned char * buf =NULL; 
  80932d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  809334:	00 
	char *name = NULL;
  809335:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80933c:	00 
	int namelen = 0;
  80933d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  809344:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80934b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  809352:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809359:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809360:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  809367:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809368:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80936f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809370:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809374:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809378:	be 00 00 00 00       	mov    esi,0x0
  80937d:	48 89 c7             	mov    rdi,rax
  809380:	b8 00 00 00 00       	mov    eax,0x0
  809385:	e8 20 7f ff ff       	call   8012aa <vmalloc>
  80938a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80938e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809392:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809395:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809398:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80939c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80939f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8093a3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8093a7:	48 99                	cqo    
  8093a9:	48 f7 fe             	idiv   rsi
  8093ac:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  8093af:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8093b6:	eb 3a                	jmp    8093f2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8093b8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8093bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093bf:	89 d6                	mov    esi,edx
  8093c1:	48 89 c7             	mov    rdi,rax
  8093c4:	e8 fc f3 ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  8093c9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  8093cc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  8093d3:	76 19                	jbe    8093ee <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  8093d5:	bf c0 40 81 00       	mov    edi,0x8140c0
  8093da:	b8 00 00 00 00       	mov    eax,0x0
  8093df:	e8 34 79 ff ff       	call   800d18 <printf>
			return NULL;
  8093e4:	b8 00 00 00 00       	mov    eax,0x0
  8093e9:	e9 86 05 00 00       	jmp    809974 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  8093ee:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8093f2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8093f5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8093f8:	7c be                	jl     8093b8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  8093fa:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8093fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093ff:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809406:	83 e8 02             	sub    eax,0x2
  809409:	89 c1                	mov    ecx,eax
  80940b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80940f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809413:	48 0f af c1          	imul   rax,rcx
  809417:	48 01 d0             	add    rax,rdx
  80941a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80941e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809422:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809426:	89 c1                	mov    ecx,eax
  809428:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80942c:	89 c2                	mov    edx,eax
  80942e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809432:	49 89 c0             	mov    r8,rax
  809435:	be 00 00 00 00       	mov    esi,0x0
  80943a:	bf 00 00 00 00       	mov    edi,0x0
  80943f:	e8 eb e6 ff ff       	call   807b2f <request>
  809444:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  809447:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80944a:	89 c7                	mov    edi,eax
  80944c:	e8 92 ed ff ff       	call   8081e3 <chk_result>
  809451:	85 c0                	test   eax,eax
  809453:	75 25                	jne    80947a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  809455:	bf e8 40 81 00       	mov    edi,0x8140e8
  80945a:	b8 00 00 00 00       	mov    eax,0x0
  80945f:	e8 b4 78 ff ff       	call   800d18 <printf>
		vmfree(buf);
  809464:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809468:	48 89 c7             	mov    rdi,rax
  80946b:	e8 c9 7e ff ff       	call   801339 <vmfree>
		return NULL;
  809470:	b8 00 00 00 00       	mov    eax,0x0
  809475:	e9 fa 04 00 00       	jmp    809974 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80947a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80947e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809481:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809485:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809489:	48 99                	cqo    
  80948b:	48 f7 f9             	idiv   rcx
  80948e:	48 89 d0             	mov    rax,rdx
  809491:	48 89 c2             	mov    rdx,rax
  809494:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809498:	48 01 d0             	add    rax,rdx
  80949b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80949f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8094a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8094a6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8094aa:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8094ae:	48 99                	cqo    
  8094b0:	48 f7 f9             	idiv   rcx
  8094b3:	48 89 d0             	mov    rax,rdx
  8094b6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  8094b9:	e9 2f 04 00 00       	jmp    8098ed <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8094be:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8094c2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8094c6:	3c 0f                	cmp    al,0xf
  8094c8:	0f 84 00 04 00 00    	je     8098ce <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8094ce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8094d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094d5:	3c e5                	cmp    al,0xe5
  8094d7:	0f 84 f4 03 00 00    	je     8098d1 <FAT32_readdir+0x5f7>
  8094dd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8094e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094e4:	84 c0                	test   al,al
  8094e6:	0f 84 e5 03 00 00    	je     8098d1 <FAT32_readdir+0x5f7>
  8094ec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8094f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094f3:	3c 05                	cmp    al,0x5
  8094f5:	0f 84 d6 03 00 00    	je     8098d1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  8094fb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809502:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809506:	48 83 e8 20          	sub    rax,0x20
  80950a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80950e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809512:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809516:	3c 0f                	cmp    al,0xf
  809518:	0f 85 2a 02 00 00    	jne    809748 <FAT32_readdir+0x46e>
  80951e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809522:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809525:	3c e5                	cmp    al,0xe5
  809527:	0f 84 1b 02 00 00    	je     809748 <FAT32_readdir+0x46e>
  80952d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809531:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809534:	84 c0                	test   al,al
  809536:	0f 84 0c 02 00 00    	je     809748 <FAT32_readdir+0x46e>
  80953c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809540:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809543:	3c 05                	cmp    al,0x5
  809545:	0f 84 fd 01 00 00    	je     809748 <FAT32_readdir+0x46e>
		{
			j = 0;
  80954b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809552:	eb 1a                	jmp    80956e <FAT32_readdir+0x294>
			{
				j++;
  809554:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  809558:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80955c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80955f:	0f b6 c0             	movzx  eax,al
  809562:	83 e0 40             	and    eax,0x40
  809565:	85 c0                	test   eax,eax
  809567:	75 34                	jne    80959d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809569:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80956e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809572:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809576:	3c 0f                	cmp    al,0xf
  809578:	75 24                	jne    80959e <FAT32_readdir+0x2c4>
  80957a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80957e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809581:	3c e5                	cmp    al,0xe5
  809583:	74 19                	je     80959e <FAT32_readdir+0x2c4>
  809585:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809589:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80958c:	84 c0                	test   al,al
  80958e:	74 0e                	je     80959e <FAT32_readdir+0x2c4>
  809590:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809594:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809597:	3c 05                	cmp    al,0x5
  809599:	75 b9                	jne    809554 <FAT32_readdir+0x27a>
  80959b:	eb 01                	jmp    80959e <FAT32_readdir+0x2c4>
					break;
  80959d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80959e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8095a1:	89 d0                	mov    eax,edx
  8095a3:	01 c0                	add    eax,eax
  8095a5:	01 d0                	add    eax,edx
  8095a7:	c1 e0 02             	shl    eax,0x2
  8095aa:	01 d0                	add    eax,edx
  8095ac:	83 c0 01             	add    eax,0x1
  8095af:	be 00 00 00 00       	mov    esi,0x0
  8095b4:	89 c7                	mov    edi,eax
  8095b6:	b8 00 00 00 00       	mov    eax,0x0
  8095bb:	e8 ea 7c ff ff       	call   8012aa <vmalloc>
  8095c0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  8095c4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8095c7:	89 d0                	mov    eax,edx
  8095c9:	01 c0                	add    eax,eax
  8095cb:	01 d0                	add    eax,edx
  8095cd:	c1 e0 02             	shl    eax,0x2
  8095d0:	01 d0                	add    eax,edx
  8095d2:	83 c0 01             	add    eax,0x1
  8095d5:	89 c2                	mov    edx,eax
  8095d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8095db:	be 00 00 00 00       	mov    esi,0x0
  8095e0:	48 89 c7             	mov    rdi,rax
  8095e3:	e8 78 20 00 00       	call   80b660 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8095e8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8095ec:	48 83 e8 20          	sub    rax,0x20
  8095f0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  8095f4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8095fb:	e9 37 01 00 00       	jmp    809737 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809600:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809607:	eb 53                	jmp    80965c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809609:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80960d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809610:	48 63 d2             	movsxd rdx,edx
  809613:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809618:	66 83 f8 ff          	cmp    ax,0xffff
  80961c:	74 3a                	je     809658 <FAT32_readdir+0x37e>
  80961e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809622:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809625:	48 63 d2             	movsxd rdx,edx
  809628:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80962d:	66 85 c0             	test   ax,ax
  809630:	74 26                	je     809658 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  809632:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809636:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809639:	48 63 d2             	movsxd rdx,edx
  80963c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809641:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809644:	8d 50 01             	lea    edx,[rax+0x1]
  809647:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80964a:	48 63 d0             	movsxd rdx,eax
  80964d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809651:	48 01 d0             	add    rax,rdx
  809654:	89 ca                	mov    edx,ecx
  809656:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  809658:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80965c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809660:	7e a7                	jle    809609 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809662:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809669:	eb 53                	jmp    8096be <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80966b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80966f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809672:	48 63 d2             	movsxd rdx,edx
  809675:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80967a:	66 83 f8 ff          	cmp    ax,0xffff
  80967e:	74 3a                	je     8096ba <FAT32_readdir+0x3e0>
  809680:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809684:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809687:	48 63 d2             	movsxd rdx,edx
  80968a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80968f:	66 85 c0             	test   ax,ax
  809692:	74 26                	je     8096ba <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809694:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809698:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80969b:	48 63 d2             	movsxd rdx,edx
  80969e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  8096a3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096a6:	8d 50 01             	lea    edx,[rax+0x1]
  8096a9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8096ac:	48 63 d0             	movsxd rdx,eax
  8096af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096b3:	48 01 d0             	add    rax,rdx
  8096b6:	89 ca                	mov    edx,ecx
  8096b8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  8096ba:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8096be:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  8096c2:	7e a7                	jle    80966b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  8096c4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8096cb:	eb 5b                	jmp    809728 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8096cd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096d1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096d4:	48 63 d2             	movsxd rdx,edx
  8096d7:	48 83 c2 08          	add    rdx,0x8
  8096db:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  8096e0:	66 83 f8 ff          	cmp    ax,0xffff
  8096e4:	74 3e                	je     809724 <FAT32_readdir+0x44a>
  8096e6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096ea:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096ed:	48 63 d2             	movsxd rdx,edx
  8096f0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8096f5:	66 85 c0             	test   ax,ax
  8096f8:	74 2a                	je     809724 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  8096fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096fe:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809701:	48 63 d2             	movsxd rdx,edx
  809704:	48 83 c2 08          	add    rdx,0x8
  809708:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80970d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809710:	8d 50 01             	lea    edx,[rax+0x1]
  809713:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809716:	48 63 d0             	movsxd rdx,eax
  809719:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80971d:	48 01 d0             	add    rax,rdx
  809720:	89 ca                	mov    edx,ecx
  809722:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  809724:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809728:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80972c:	7e 9f                	jle    8096cd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80972e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809732:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  809737:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80973a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80973d:	0f 8c bd fe ff ff    	jl     809600 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  809743:	e9 f5 01 00 00       	jmp    80993d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  809748:	be 00 00 00 00       	mov    esi,0x0
  80974d:	bf 0f 00 00 00       	mov    edi,0xf
  809752:	b8 00 00 00 00       	mov    eax,0x0
  809757:	e8 4e 7b ff ff       	call   8012aa <vmalloc>
  80975c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809760:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809764:	ba 0f 00 00 00       	mov    edx,0xf
  809769:	be 00 00 00 00       	mov    esi,0x0
  80976e:	48 89 c7             	mov    rdi,rax
  809771:	e8 ea 1e 00 00       	call   80b660 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809776:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80977d:	eb 74                	jmp    8097f3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80977f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809783:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809786:	48 98                	cdqe   
  809788:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80978c:	3c 20                	cmp    al,0x20
  80978e:	74 6b                	je     8097fb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809790:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809794:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809798:	0f b6 c0             	movzx  eax,al
  80979b:	83 e0 08             	and    eax,0x8
  80979e:	85 c0                	test   eax,eax
  8097a0:	74 29                	je     8097cb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  8097a2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8097a6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8097a9:	48 98                	cdqe   
  8097ab:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8097af:	8d 48 20             	lea    ecx,[rax+0x20]
  8097b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8097b5:	8d 50 01             	lea    edx,[rax+0x1]
  8097b8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8097bb:	48 63 d0             	movsxd rdx,eax
  8097be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097c2:	48 01 d0             	add    rax,rdx
  8097c5:	89 ca                	mov    edx,ecx
  8097c7:	88 10                	mov    BYTE PTR [rax],dl
  8097c9:	eb 24                	jmp    8097ef <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  8097cb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8097cf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8097d2:	48 98                	cdqe   
  8097d4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  8097d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8097db:	8d 50 01             	lea    edx,[rax+0x1]
  8097de:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8097e1:	48 63 d0             	movsxd rdx,eax
  8097e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097e8:	48 01 d0             	add    rax,rdx
  8097eb:	89 ca                	mov    edx,ecx
  8097ed:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  8097ef:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8097f3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  8097f7:	7e 86                	jle    80977f <FAT32_readdir+0x4a5>
  8097f9:	eb 01                	jmp    8097fc <FAT32_readdir+0x522>
				break;
  8097fb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  8097fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809800:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809804:	0f b6 c0             	movzx  eax,al
  809807:	83 e0 10             	and    eax,0x10
  80980a:	85 c0                	test   eax,eax
  80980c:	0f 85 27 01 00 00    	jne    809939 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  809812:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809815:	8d 50 01             	lea    edx,[rax+0x1]
  809818:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80981b:	48 63 d0             	movsxd rdx,eax
  80981e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809822:	48 01 d0             	add    rax,rdx
  809825:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  809828:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80982f:	eb 74                	jmp    8098a5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809831:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809835:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809838:	48 98                	cdqe   
  80983a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80983e:	3c 20                	cmp    al,0x20
  809840:	74 6b                	je     8098ad <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809842:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809846:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80984a:	0f b6 c0             	movzx  eax,al
  80984d:	83 e0 10             	and    eax,0x10
  809850:	85 c0                	test   eax,eax
  809852:	74 29                	je     80987d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809854:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809858:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80985b:	48 98                	cdqe   
  80985d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809861:	8d 48 20             	lea    ecx,[rax+0x20]
  809864:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809867:	8d 50 01             	lea    edx,[rax+0x1]
  80986a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80986d:	48 63 d0             	movsxd rdx,eax
  809870:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809874:	48 01 d0             	add    rax,rdx
  809877:	89 ca                	mov    edx,ecx
  809879:	88 10                	mov    BYTE PTR [rax],dl
  80987b:	eb 24                	jmp    8098a1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80987d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809881:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809884:	48 98                	cdqe   
  809886:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80988a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80988d:	8d 50 01             	lea    edx,[rax+0x1]
  809890:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809893:	48 63 d0             	movsxd rdx,eax
  809896:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80989a:	48 01 d0             	add    rax,rdx
  80989d:	89 ca                	mov    edx,ecx
  80989f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  8098a1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8098a5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  8098a9:	7e 86                	jle    809831 <FAT32_readdir+0x557>
  8098ab:	eb 01                	jmp    8098ae <FAT32_readdir+0x5d4>
				break;
  8098ad:	90                   	nop
		}
		if(x == 8)
  8098ae:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  8098b2:	0f 85 84 00 00 00    	jne    80993c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  8098b8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  8098bc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8098bf:	48 63 d0             	movsxd rdx,eax
  8098c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8098c6:	48 01 d0             	add    rax,rdx
  8098c9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  8098cc:	eb 6e                	jmp    80993c <FAT32_readdir+0x662>
			continue;
  8098ce:	90                   	nop
  8098cf:	eb 01                	jmp    8098d2 <FAT32_readdir+0x5f8>
			continue;
  8098d1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8098d2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  8098d6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  8098db:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8098df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098e2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  8098e6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8098ea:	48 89 10             	mov    QWORD PTR [rax],rdx
  8098ed:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8098f0:	48 63 d0             	movsxd rdx,eax
  8098f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098f7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8098fb:	48 39 c2             	cmp    rdx,rax
  8098fe:	0f 8c ba fb ff ff    	jl     8094be <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809904:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809907:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80990b:	89 d6                	mov    esi,edx
  80990d:	48 89 c7             	mov    rdi,rax
  809910:	e8 b0 ee ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  809915:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  809918:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80991f:	77 05                	ja     809926 <FAT32_readdir+0x64c>
		goto next_cluster;
  809921:	e9 d5 fa ff ff       	jmp    8093fb <FAT32_readdir+0x121>

	vmfree(buf);
  809926:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80992a:	48 89 c7             	mov    rdi,rax
  80992d:	e8 07 7a ff ff       	call   801339 <vmfree>
	return NULL;
  809932:	b8 00 00 00 00       	mov    eax,0x0
  809937:	eb 3b                	jmp    809974 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  809939:	90                   	nop
  80993a:	eb 01                	jmp    80993d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80993c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80993d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809941:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809944:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809948:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80994c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80994f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809952:	48 63 d0             	movsxd rdx,eax
  809955:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  809959:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80995d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  809961:	41 b8 00 00 00 00    	mov    r8d,0x0
  809967:	b9 00 00 00 00       	mov    ecx,0x0
  80996c:	48 89 c7             	mov    rdi,rax
  80996f:	41 ff d1             	call   r9
  809972:	48 98                	cdqe   
}
  809974:	c9                   	leave  
  809975:	c3                   	ret    

0000000000809976 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809976:	f3 0f 1e fa          	endbr64 
  80997a:	55                   	push   rbp
  80997b:	48 89 e5             	mov    rbp,rsp
  80997e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809982:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809986:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809989:	90                   	nop
  80998a:	5d                   	pop    rbp
  80998b:	c3                   	ret    

000000000080998c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80998c:	f3 0f 1e fa          	endbr64 
  809990:	55                   	push   rbp
  809991:	48 89 e5             	mov    rbp,rsp
  809994:	48 83 ec 60          	sub    rsp,0x60
  809998:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80999c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  8099a0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099a4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8099a8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  8099ac:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099b0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8099b4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8099b8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  8099bc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8099c3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8099ca:	00 
	unsigned char * buf =NULL; 
  8099cb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8099d2:	00 
	int i = 0,j = 0,x = 0;
  8099d3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8099da:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8099e1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8099e8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8099ef:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  8099f0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8099f7:	00 
	struct index_node * p = NULL;
  8099f8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8099ff:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809a00:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a04:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a08:	be 00 00 00 00       	mov    esi,0x0
  809a0d:	48 89 c7             	mov    rdi,rax
  809a10:	b8 00 00 00 00       	mov    eax,0x0
  809a15:	e8 90 78 ff ff       	call   8012aa <vmalloc>
  809a1a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  809a1e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809a22:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a25:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809a28:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a2c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809a30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a33:	83 e8 02             	sub    eax,0x2
  809a36:	89 c1                	mov    ecx,eax
  809a38:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a3c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a40:	48 0f af c1          	imul   rax,rcx
  809a44:	48 01 d0             	add    rax,rdx
  809a47:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  809a4b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809a4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a52:	89 c6                	mov    esi,eax
  809a54:	bf 18 41 81 00       	mov    edi,0x814118
  809a59:	b8 00 00 00 00       	mov    eax,0x0
  809a5e:	e8 b5 72 ff ff       	call   800d18 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809a63:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a67:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a6b:	89 c1                	mov    ecx,eax
  809a6d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a71:	89 c2                	mov    edx,eax
  809a73:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809a77:	49 89 c0             	mov    r8,rax
  809a7a:	be 00 00 00 00       	mov    esi,0x0
  809a7f:	bf 00 00 00 00       	mov    edi,0x0
  809a84:	e8 a6 e0 ff ff       	call   807b2f <request>
  809a89:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  809a8c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  809a8f:	89 c7                	mov    edi,eax
  809a91:	e8 4d e7 ff ff       	call   8081e3 <chk_result>
  809a96:	85 c0                	test   eax,eax
  809a98:	75 25                	jne    809abf <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  809a9a:	bf 40 41 81 00       	mov    edi,0x814140
  809a9f:	b8 00 00 00 00       	mov    eax,0x0
  809aa4:	e8 6f 72 ff ff       	call   800d18 <printf>
		vmfree(buf);
  809aa9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809aad:	48 89 c7             	mov    rdi,rax
  809ab0:	e8 84 78 ff ff       	call   801339 <vmfree>
		return NULL;
  809ab5:	b8 00 00 00 00       	mov    eax,0x0
  809aba:	e9 f0 07 00 00       	jmp    80a2af <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  809abf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809ac3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  809ac7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809ace:	e9 9d 05 00 00       	jmp    80a070 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809ad3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ad7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809adb:	3c 0f                	cmp    al,0xf
  809add:	0f 84 59 05 00 00    	je     80a03c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809ae3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ae7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809aea:	3c e5                	cmp    al,0xe5
  809aec:	0f 84 4d 05 00 00    	je     80a03f <FAT32_lookup+0x6b3>
  809af2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809af6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809af9:	84 c0                	test   al,al
  809afb:	0f 84 3e 05 00 00    	je     80a03f <FAT32_lookup+0x6b3>
  809b01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b08:	3c 05                	cmp    al,0x5
  809b0a:	0f 84 2f 05 00 00    	je     80a03f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809b10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b14:	48 83 e8 20          	sub    rax,0x20
  809b18:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  809b1c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809b23:	e9 88 01 00 00       	jmp    809cb0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  809b28:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809b2f:	eb 6a                	jmp    809b9b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  809b31:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809b35:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809b38:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809b3b:	7e 15                	jle    809b52 <FAT32_lookup+0x1c6>
  809b3d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809b41:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809b44:	48 63 d2             	movsxd rdx,edx
  809b47:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b4c:	66 83 f8 ff          	cmp    ax,0xffff
  809b50:	74 44                	je     809b96 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  809b52:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809b56:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809b59:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809b5c:	0f 8f e0 04 00 00    	jg     80a042 <FAT32_lookup+0x6b6>
  809b62:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809b66:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809b69:	48 63 d2             	movsxd rdx,edx
  809b6c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809b71:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809b75:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809b78:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809b7b:	8d 50 01             	lea    edx,[rax+0x1]
  809b7e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809b81:	48 98                	cdqe   
  809b83:	48 01 f0             	add    rax,rsi
  809b86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b89:	66 98                	cbw    
  809b8b:	66 39 c1             	cmp    cx,ax
  809b8e:	0f 85 ae 04 00 00    	jne    80a042 <FAT32_lookup+0x6b6>
  809b94:	eb 01                	jmp    809b97 <FAT32_lookup+0x20b>
					continue;
  809b96:	90                   	nop
			for(x=0;x<5;x++)
  809b97:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809b9b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  809b9f:	7e 90                	jle    809b31 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  809ba1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809ba8:	eb 6a                	jmp    809c14 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  809baa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bae:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809bb1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bb4:	7e 15                	jle    809bcb <FAT32_lookup+0x23f>
  809bb6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809bba:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809bbd:	48 63 d2             	movsxd rdx,edx
  809bc0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809bc5:	66 83 f8 ff          	cmp    ax,0xffff
  809bc9:	74 44                	je     809c0f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  809bcb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bcf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809bd2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bd5:	0f 8f 6a 04 00 00    	jg     80a045 <FAT32_lookup+0x6b9>
  809bdb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809bdf:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809be2:	48 63 d2             	movsxd rdx,edx
  809be5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809bea:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bee:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809bf1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809bf4:	8d 50 01             	lea    edx,[rax+0x1]
  809bf7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809bfa:	48 98                	cdqe   
  809bfc:	48 01 f0             	add    rax,rsi
  809bff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c02:	66 98                	cbw    
  809c04:	66 39 c1             	cmp    cx,ax
  809c07:	0f 85 38 04 00 00    	jne    80a045 <FAT32_lookup+0x6b9>
  809c0d:	eb 01                	jmp    809c10 <FAT32_lookup+0x284>
					continue;
  809c0f:	90                   	nop
			for(x=0;x<6;x++)
  809c10:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809c14:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  809c18:	7e 90                	jle    809baa <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  809c1a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809c21:	eb 72                	jmp    809c95 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  809c23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c27:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c2a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c2d:	7e 19                	jle    809c48 <FAT32_lookup+0x2bc>
  809c2f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c33:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c36:	48 63 d2             	movsxd rdx,edx
  809c39:	48 83 c2 08          	add    rdx,0x8
  809c3d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809c42:	66 83 f8 ff          	cmp    ax,0xffff
  809c46:	74 48                	je     809c90 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  809c48:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c4c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c4f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c52:	0f 8f f0 03 00 00    	jg     80a048 <FAT32_lookup+0x6bc>
  809c58:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c5c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c5f:	48 63 d2             	movsxd rdx,edx
  809c62:	48 83 c2 08          	add    rdx,0x8
  809c66:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809c6b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c6f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809c72:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809c75:	8d 50 01             	lea    edx,[rax+0x1]
  809c78:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809c7b:	48 98                	cdqe   
  809c7d:	48 01 f0             	add    rax,rsi
  809c80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c83:	66 98                	cbw    
  809c85:	66 39 c1             	cmp    cx,ax
  809c88:	0f 85 ba 03 00 00    	jne    80a048 <FAT32_lookup+0x6bc>
  809c8e:	eb 01                	jmp    809c91 <FAT32_lookup+0x305>
					continue;
  809c90:	90                   	nop
			for(x=0;x<2;x++)
  809c91:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809c95:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  809c99:	7e 88                	jle    809c23 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  809c9b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c9f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809ca2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809ca5:	0f 8d 14 04 00 00    	jge    80a0bf <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  809cab:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809cb0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cb4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809cb8:	3c 0f                	cmp    al,0xf
  809cba:	75 0f                	jne    809ccb <FAT32_lookup+0x33f>
  809cbc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cc0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cc3:	3c e5                	cmp    al,0xe5
  809cc5:	0f 85 5d fe ff ff    	jne    809b28 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  809ccb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  809cd2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809cd9:	e9 f4 01 00 00       	jmp    809ed2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  809cde:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809ce2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809ce5:	48 98                	cdqe   
  809ce7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809ceb:	0f b6 c0             	movzx  eax,al
  809cee:	83 f8 7a             	cmp    eax,0x7a
  809cf1:	0f 8f d0 01 00 00    	jg     809ec7 <FAT32_lookup+0x53b>
  809cf7:	83 f8 61             	cmp    eax,0x61
  809cfa:	0f 8d e6 00 00 00    	jge    809de6 <FAT32_lookup+0x45a>
  809d00:	83 f8 5a             	cmp    eax,0x5a
  809d03:	0f 8f be 01 00 00    	jg     809ec7 <FAT32_lookup+0x53b>
  809d09:	83 f8 41             	cmp    eax,0x41
  809d0c:	0f 8d d4 00 00 00    	jge    809de6 <FAT32_lookup+0x45a>
  809d12:	83 f8 20             	cmp    eax,0x20
  809d15:	74 1a                	je     809d31 <FAT32_lookup+0x3a5>
  809d17:	83 f8 20             	cmp    eax,0x20
  809d1a:	0f 8c a7 01 00 00    	jl     809ec7 <FAT32_lookup+0x53b>
  809d20:	83 e8 30             	sub    eax,0x30
  809d23:	83 f8 09             	cmp    eax,0x9
  809d26:	0f 87 9b 01 00 00    	ja     809ec7 <FAT32_lookup+0x53b>
  809d2c:	e9 53 01 00 00       	jmp    809e84 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809d31:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d35:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809d39:	0f b6 c0             	movzx  eax,al
  809d3c:	83 e0 10             	and    eax,0x10
  809d3f:	85 c0                	test   eax,eax
  809d41:	75 50                	jne    809d93 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  809d43:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d47:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809d4a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809d4d:	48 98                	cdqe   
  809d4f:	48 01 d0             	add    rax,rdx
  809d52:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d55:	3c 2e                	cmp    al,0x2e
  809d57:	0f 84 70 01 00 00    	je     809ecd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809d5d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809d61:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809d64:	48 98                	cdqe   
  809d66:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d6a:	0f b6 d0             	movzx  edx,al
  809d6d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d71:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809d74:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809d77:	48 98                	cdqe   
  809d79:	48 01 c8             	add    rax,rcx
  809d7c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d7f:	0f be c0             	movsx  eax,al
  809d82:	39 c2                	cmp    edx,eax
  809d84:	0f 85 c1 02 00 00    	jne    80a04b <FAT32_lookup+0x6bf>
						{
							j++;
  809d8a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809d8e:	e9 3b 01 00 00       	jmp    809ece <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809d93:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d97:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809d9a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809d9d:	7d 32                	jge    809dd1 <FAT32_lookup+0x445>
  809d9f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809da3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809da6:	48 98                	cdqe   
  809da8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809dac:	0f b6 d0             	movzx  edx,al
  809daf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809db3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809db6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809db9:	48 98                	cdqe   
  809dbb:	48 01 c8             	add    rax,rcx
  809dbe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809dc1:	0f be c0             	movsx  eax,al
  809dc4:	39 c2                	cmp    edx,eax
  809dc6:	75 09                	jne    809dd1 <FAT32_lookup+0x445>
						{
							j++;
  809dc8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809dcc:	e9 fd 00 00 00       	jmp    809ece <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  809dd1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809dd5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809dd8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809ddb:	0f 85 6d 02 00 00    	jne    80a04e <FAT32_lookup+0x6c2>
							continue;
  809de1:	e9 e8 00 00 00       	jmp    809ece <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809de6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dea:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809dee:	0f b6 c0             	movzx  eax,al
  809df1:	83 e0 08             	and    eax,0x8
  809df4:	85 c0                	test   eax,eax
  809df6:	74 49                	je     809e41 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809df8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809dfc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809dff:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e02:	0f 8d 49 02 00 00    	jge    80a051 <FAT32_lookup+0x6c5>
  809e08:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e0c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e0f:	48 98                	cdqe   
  809e11:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809e15:	0f b6 c0             	movzx  eax,al
  809e18:	8d 50 20             	lea    edx,[rax+0x20]
  809e1b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e1f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e22:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e25:	48 98                	cdqe   
  809e27:	48 01 c8             	add    rax,rcx
  809e2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e2d:	0f be c0             	movsx  eax,al
  809e30:	39 c2                	cmp    edx,eax
  809e32:	0f 85 19 02 00 00    	jne    80a051 <FAT32_lookup+0x6c5>
						{
							j++;
  809e38:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e3c:	e9 8d 00 00 00       	jmp    809ece <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809e41:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e45:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e48:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e4b:	0f 8d 03 02 00 00    	jge    80a054 <FAT32_lookup+0x6c8>
  809e51:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e55:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e58:	48 98                	cdqe   
  809e5a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809e5e:	0f b6 d0             	movzx  edx,al
  809e61:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e65:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e68:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e6b:	48 98                	cdqe   
  809e6d:	48 01 c8             	add    rax,rcx
  809e70:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e73:	0f be c0             	movsx  eax,al
  809e76:	39 c2                	cmp    edx,eax
  809e78:	0f 85 d6 01 00 00    	jne    80a054 <FAT32_lookup+0x6c8>
						{
							j++;
  809e7e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e82:	eb 4a                	jmp    809ece <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809e84:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e88:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e8b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e8e:	0f 8d c3 01 00 00    	jge    80a057 <FAT32_lookup+0x6cb>
  809e94:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e98:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e9b:	48 98                	cdqe   
  809e9d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809ea1:	0f b6 d0             	movzx  edx,al
  809ea4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809ea8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809eab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809eae:	48 98                	cdqe   
  809eb0:	48 01 c8             	add    rax,rcx
  809eb3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809eb6:	0f be c0             	movsx  eax,al
  809eb9:	39 c2                	cmp    edx,eax
  809ebb:	0f 85 96 01 00 00    	jne    80a057 <FAT32_lookup+0x6cb>
					{
						j++;
  809ec1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  809ec5:	eb 07                	jmp    809ece <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  809ec7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  809ecb:	eb 01                	jmp    809ece <FAT32_lookup+0x542>
							continue;
  809ecd:	90                   	nop
		for(x=0;x<8;x++)
  809ece:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809ed2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  809ed6:	0f 8e 02 fe ff ff    	jle    809cde <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809edc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ee0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809ee4:	0f b6 c0             	movzx  eax,al
  809ee7:	83 e0 10             	and    eax,0x10
  809eea:	85 c0                	test   eax,eax
  809eec:	0f 85 d0 01 00 00    	jne    80a0c2 <FAT32_lookup+0x736>
		{
			j++;
  809ef2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  809ef6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  809efd:	e9 2b 01 00 00       	jmp    80a02d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  809f02:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f06:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809f09:	48 98                	cdqe   
  809f0b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f0f:	0f b6 c0             	movzx  eax,al
  809f12:	83 f8 7a             	cmp    eax,0x7a
  809f15:	0f 8f 3f 01 00 00    	jg     80a05a <FAT32_lookup+0x6ce>
  809f1b:	83 f8 61             	cmp    eax,0x61
  809f1e:	7d 2e                	jge    809f4e <FAT32_lookup+0x5c2>
  809f20:	83 f8 5a             	cmp    eax,0x5a
  809f23:	0f 8f 31 01 00 00    	jg     80a05a <FAT32_lookup+0x6ce>
  809f29:	83 f8 41             	cmp    eax,0x41
  809f2c:	7d 20                	jge    809f4e <FAT32_lookup+0x5c2>
  809f2e:	83 f8 20             	cmp    eax,0x20
  809f31:	0f 84 c4 00 00 00    	je     809ffb <FAT32_lookup+0x66f>
  809f37:	83 f8 20             	cmp    eax,0x20
  809f3a:	0f 8c 1a 01 00 00    	jl     80a05a <FAT32_lookup+0x6ce>
  809f40:	83 e8 30             	sub    eax,0x30
  809f43:	83 f8 09             	cmp    eax,0x9
  809f46:	0f 87 0e 01 00 00    	ja     80a05a <FAT32_lookup+0x6ce>
  809f4c:	eb 7e                	jmp    809fcc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809f4e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f52:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809f56:	0f b6 c0             	movzx  eax,al
  809f59:	83 e0 10             	and    eax,0x10
  809f5c:	85 c0                	test   eax,eax
  809f5e:	74 39                	je     809f99 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809f60:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f64:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809f67:	48 98                	cdqe   
  809f69:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f6d:	0f b6 c0             	movzx  eax,al
  809f70:	8d 50 20             	lea    edx,[rax+0x20]
  809f73:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f77:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809f7a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809f7d:	48 98                	cdqe   
  809f7f:	48 01 c8             	add    rax,rcx
  809f82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f85:	0f be c0             	movsx  eax,al
  809f88:	39 c2                	cmp    edx,eax
  809f8a:	0f 85 cd 00 00 00    	jne    80a05d <FAT32_lookup+0x6d1>
							{
								j++;
  809f90:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  809f94:	e9 90 00 00 00       	jmp    80a029 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809f99:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f9d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809fa0:	48 98                	cdqe   
  809fa2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809fa6:	0f b6 d0             	movzx  edx,al
  809fa9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809fad:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809fb0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809fb3:	48 98                	cdqe   
  809fb5:	48 01 c8             	add    rax,rcx
  809fb8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fbb:	0f be c0             	movsx  eax,al
  809fbe:	39 c2                	cmp    edx,eax
  809fc0:	0f 85 9a 00 00 00    	jne    80a060 <FAT32_lookup+0x6d4>
							{
								j++;
  809fc6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  809fca:	eb 5d                	jmp    80a029 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809fcc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809fd0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809fd3:	48 98                	cdqe   
  809fd5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809fd9:	0f b6 d0             	movzx  edx,al
  809fdc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809fe0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809fe3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809fe6:	48 98                	cdqe   
  809fe8:	48 01 c8             	add    rax,rcx
  809feb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fee:	0f be c0             	movsx  eax,al
  809ff1:	39 c2                	cmp    edx,eax
  809ff3:	75 6e                	jne    80a063 <FAT32_lookup+0x6d7>
						{
							j++;
  809ff5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809ff9:	eb 2e                	jmp    80a029 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809ffb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809fff:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a002:	48 98                	cdqe   
  80a004:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a008:	0f b6 d0             	movzx  edx,al
  80a00b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a00f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a012:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a015:	48 98                	cdqe   
  80a017:	48 01 c8             	add    rax,rcx
  80a01a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a01d:	0f be c0             	movsx  eax,al
  80a020:	39 c2                	cmp    edx,eax
  80a022:	75 42                	jne    80a066 <FAT32_lookup+0x6da>
						{
							j++;
  80a024:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a028:	90                   	nop
			for(x=8;x<11;x++)
  80a029:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a02d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a031:	0f 8e cb fe ff ff    	jle    809f02 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a037:	e9 86 00 00 00       	jmp    80a0c2 <FAT32_lookup+0x736>
			continue;
  80a03c:	90                   	nop
  80a03d:	eb 28                	jmp    80a067 <FAT32_lookup+0x6db>
			continue;
  80a03f:	90                   	nop
  80a040:	eb 25                	jmp    80a067 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a042:	90                   	nop
  80a043:	eb 22                	jmp    80a067 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a045:	90                   	nop
  80a046:	eb 1f                	jmp    80a067 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a048:	90                   	nop
  80a049:	eb 1c                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a04b:	90                   	nop
  80a04c:	eb 19                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a04e:	90                   	nop
  80a04f:	eb 16                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a051:	90                   	nop
  80a052:	eb 13                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a054:	90                   	nop
  80a055:	eb 10                	jmp    80a067 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a057:	90                   	nop
  80a058:	eb 0d                	jmp    80a067 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a05a:	90                   	nop
  80a05b:	eb 0a                	jmp    80a067 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a05d:	90                   	nop
  80a05e:	eb 07                	jmp    80a067 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a060:	90                   	nop
  80a061:	eb 04                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a063:	90                   	nop
  80a064:	eb 01                	jmp    80a067 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a066:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a067:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a06b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a070:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a073:	48 63 d0             	movsxd rdx,eax
  80a076:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a07a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a07e:	48 39 c2             	cmp    rdx,rax
  80a081:	0f 8c 4c fa ff ff    	jl     809ad3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a087:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a08a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a08e:	89 d6                	mov    esi,edx
  80a090:	48 89 c7             	mov    rdi,rax
  80a093:	e8 2d e7 ff ff       	call   8087c5 <DISK1_FAT32_read_FAT_Entry>
  80a098:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a09b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a0a2:	77 05                	ja     80a0a9 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a0a4:	e9 7f f9 ff ff       	jmp    809a28 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a0a9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a0ad:	48 89 c7             	mov    rdi,rax
  80a0b0:	e8 84 72 ff ff       	call   801339 <vmfree>
	return NULL;
  80a0b5:	b8 00 00 00 00       	mov    eax,0x0
  80a0ba:	e9 f0 01 00 00       	jmp    80a2af <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a0bf:	90                   	nop
  80a0c0:	eb 01                	jmp    80a0c3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a0c2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a0c3:	be 00 00 00 00       	mov    esi,0x0
  80a0c8:	bf 38 00 00 00       	mov    edi,0x38
  80a0cd:	b8 00 00 00 00       	mov    eax,0x0
  80a0d2:	e8 d3 71 ff ff       	call   8012aa <vmalloc>
  80a0d7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a0db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a0df:	ba 38 00 00 00       	mov    edx,0x38
  80a0e4:	be 00 00 00 00       	mov    esi,0x0
  80a0e9:	48 89 c7             	mov    rdi,rax
  80a0ec:	e8 6f 15 00 00       	call   80b660 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a0f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a0f5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a0f8:	89 c2                	mov    edx,eax
  80a0fa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a0fe:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a101:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a105:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a108:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a10c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a110:	48 01 d0             	add    rax,rdx
  80a113:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a117:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a11b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a11f:	48 89 c1             	mov    rcx,rax
  80a122:	48 89 d0             	mov    rax,rdx
  80a125:	ba 00 00 00 00       	mov    edx,0x0
  80a12a:	48 f7 f1             	div    rcx
  80a12d:	48 89 c2             	mov    rdx,rax
  80a130:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a134:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a138:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a13c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a140:	0f b6 c0             	movzx  eax,al
  80a143:	83 e0 10             	and    eax,0x10
  80a146:	85 c0                	test   eax,eax
  80a148:	74 07                	je     80a151 <FAT32_lookup+0x7c5>
  80a14a:	ba 02 00 00 00       	mov    edx,0x2
  80a14f:	eb 05                	jmp    80a156 <FAT32_lookup+0x7ca>
  80a151:	ba 01 00 00 00       	mov    edx,0x1
  80a156:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a15a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a15e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a162:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a166:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a16a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a16e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a172:	48 c7 40 20 a0 c1 80 	mov    QWORD PTR [rax+0x20],0x80c1a0
  80a179:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a17a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a17e:	48 c7 40 28 e0 c1 80 	mov    QWORD PTR [rax+0x28],0x80c1e0
  80a185:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a186:	be 00 00 00 00       	mov    esi,0x0
  80a18b:	bf 20 00 00 00       	mov    edi,0x20
  80a190:	b8 00 00 00 00       	mov    eax,0x0
  80a195:	e8 10 71 ff ff       	call   8012aa <vmalloc>
  80a19a:	48 89 c2             	mov    rdx,rax
  80a19d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1a1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a1a5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1a9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a1ad:	ba 20 00 00 00       	mov    edx,0x20
  80a1b2:	be 00 00 00 00       	mov    esi,0x0
  80a1b7:	48 89 c7             	mov    rdi,rax
  80a1ba:	e8 a1 14 00 00       	call   80b660 <memset>
	finode = p->private_index_info;
  80a1bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1c3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a1c7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a1cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1cf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a1d3:	0f b7 c0             	movzx  eax,ax
  80a1d6:	c1 e0 10             	shl    eax,0x10
  80a1d9:	89 c2                	mov    edx,eax
  80a1db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1df:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a1e3:	0f b7 c0             	movzx  eax,ax
  80a1e6:	09 d0                	or     eax,edx
  80a1e8:	48 98                	cdqe   
  80a1ea:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a1ef:	48 89 c2             	mov    rdx,rax
  80a1f2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a1f6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a1f9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a1fc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a200:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a204:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a208:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a20c:	48 c1 f8 05          	sar    rax,0x5
  80a210:	48 89 c2             	mov    rdx,rax
  80a213:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a217:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a21b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a21f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a223:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a227:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a22b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a22f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a233:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a237:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a23b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a23f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a243:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a247:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a24b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a24f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a253:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a257:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a25b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a25f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a263:	66 c1 e8 0c          	shr    ax,0xc
  80a267:	66 85 c0             	test   ax,ax
  80a26a:	74 27                	je     80a293 <FAT32_lookup+0x907>
  80a26c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a270:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a274:	83 e0 01             	and    eax,0x1
  80a277:	48 85 c0             	test   rax,rax
  80a27a:	74 17                	je     80a293 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a27c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a280:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a284:	48 83 c8 04          	or     rax,0x4
  80a288:	48 89 c2             	mov    rdx,rax
  80a28b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a28f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a293:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a297:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a29b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a29f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a2a3:	48 89 c7             	mov    rdi,rax
  80a2a6:	e8 8e 70 ff ff       	call   801339 <vmfree>
	return dest_dentry;	
  80a2ab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80a2af:	c9                   	leave  
  80a2b0:	c3                   	ret    

000000000080a2b1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a2b1:	f3 0f 1e fa          	endbr64 
  80a2b5:	55                   	push   rbp
  80a2b6:	48 89 e5             	mov    rbp,rsp
  80a2b9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a2bd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a2c1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a2c4:	90                   	nop
  80a2c5:	5d                   	pop    rbp
  80a2c6:	c3                   	ret    

000000000080a2c7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80a2c7:	f3 0f 1e fa          	endbr64 
  80a2cb:	55                   	push   rbp
  80a2cc:	48 89 e5             	mov    rbp,rsp
  80a2cf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a2d3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a2d7:	90                   	nop
  80a2d8:	5d                   	pop    rbp
  80a2d9:	c3                   	ret    

000000000080a2da <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80a2da:	f3 0f 1e fa          	endbr64 
  80a2de:	55                   	push   rbp
  80a2df:	48 89 e5             	mov    rbp,rsp
  80a2e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a2e6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a2ea:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a2ee:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a2f2:	90                   	nop
  80a2f3:	5d                   	pop    rbp
  80a2f4:	c3                   	ret    

000000000080a2f5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a2f5:	f3 0f 1e fa          	endbr64 
  80a2f9:	55                   	push   rbp
  80a2fa:	48 89 e5             	mov    rbp,rsp
  80a2fd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a301:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a305:	90                   	nop
  80a306:	5d                   	pop    rbp
  80a307:	c3                   	ret    

000000000080a308 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a308:	f3 0f 1e fa          	endbr64 
  80a30c:	55                   	push   rbp
  80a30d:	48 89 e5             	mov    rbp,rsp
  80a310:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a314:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a318:	90                   	nop
  80a319:	5d                   	pop    rbp
  80a31a:	c3                   	ret    

000000000080a31b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80a31b:	f3 0f 1e fa          	endbr64 
  80a31f:	55                   	push   rbp
  80a320:	48 89 e5             	mov    rbp,rsp
  80a323:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a327:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a32b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a32f:	90                   	nop
  80a330:	5d                   	pop    rbp
  80a331:	c3                   	ret    

000000000080a332 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80a332:	f3 0f 1e fa          	endbr64 
  80a336:	55                   	push   rbp
  80a337:	48 89 e5             	mov    rbp,rsp
  80a33a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a33e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a342:	90                   	nop
  80a343:	5d                   	pop    rbp
  80a344:	c3                   	ret    

000000000080a345 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80a345:	f3 0f 1e fa          	endbr64 
  80a349:	55                   	push   rbp
  80a34a:	48 89 e5             	mov    rbp,rsp
  80a34d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a351:	90                   	nop
  80a352:	5d                   	pop    rbp
  80a353:	c3                   	ret    

000000000080a354 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80a354:	f3 0f 1e fa          	endbr64 
  80a358:	55                   	push   rbp
  80a359:	48 89 e5             	mov    rbp,rsp
  80a35c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a360:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a364:	90                   	nop
  80a365:	5d                   	pop    rbp
  80a366:	c3                   	ret    

000000000080a367 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80a367:	f3 0f 1e fa          	endbr64 
  80a36b:	55                   	push   rbp
  80a36c:	48 89 e5             	mov    rbp,rsp
  80a36f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a373:	90                   	nop
  80a374:	5d                   	pop    rbp
  80a375:	c3                   	ret    

000000000080a376 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80a376:	f3 0f 1e fa          	endbr64 
  80a37a:	55                   	push   rbp
  80a37b:	48 89 e5             	mov    rbp,rsp
  80a37e:	48 83 ec 10          	sub    rsp,0x10
  80a382:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80a386:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a38a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a38e:	48 89 c7             	mov    rdi,rax
  80a391:	e8 a3 6f ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80a396:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a39a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a39d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a3a1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a3a5:	48 89 c7             	mov    rdi,rax
  80a3a8:	e8 8c 6f ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode);
  80a3ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a3b4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a3b8:	48 89 c7             	mov    rdi,rax
  80a3bb:	e8 79 6f ff ff       	call   801339 <vmfree>
	vmfree(sb->root);
  80a3c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a3c7:	48 89 c7             	mov    rdi,rax
  80a3ca:	e8 6a 6f ff ff       	call   801339 <vmfree>
	vmfree(sb);
  80a3cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3d3:	48 89 c7             	mov    rdi,rax
  80a3d6:	e8 5e 6f ff ff       	call   801339 <vmfree>
}
  80a3db:	90                   	nop
  80a3dc:	c9                   	leave  
  80a3dd:	c3                   	ret    

000000000080a3de <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80a3de:	f3 0f 1e fa          	endbr64 
  80a3e2:	55                   	push   rbp
  80a3e3:	48 89 e5             	mov    rbp,rsp
  80a3e6:	48 83 ec 40          	sub    rsp,0x40
  80a3ea:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80a3ee:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a3f5:	00 
	struct FAT32_Directory * buf = NULL;
  80a3f6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a3fd:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80a3fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a402:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a406:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80a40a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a40e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a412:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a416:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80a41a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a421:	00 

	if(finode->dentry_location == 0)
  80a422:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a426:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a42a:	48 85 c0             	test   rax,rax
  80a42d:	75 14                	jne    80a443 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80a42f:	bf 6c 41 81 00       	mov    edi,0x81416c
  80a434:	b8 00 00 00 00       	mov    eax,0x0
  80a439:	e8 da 68 ff ff       	call   800d18 <printf>
		return ;
  80a43e:	e9 30 01 00 00       	jmp    80a573 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80a443:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a447:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a44b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a44f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a453:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a457:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a45b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a45f:	48 0f af c2          	imul   rax,rdx
  80a463:	48 01 c8             	add    rax,rcx
  80a466:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80a46a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a46e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a472:	be 00 00 00 00       	mov    esi,0x0
  80a477:	48 89 c7             	mov    rdi,rax
  80a47a:	b8 00 00 00 00       	mov    eax,0x0
  80a47f:	e8 26 6e ff ff       	call   8012aa <vmalloc>
  80a484:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80a488:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a48c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a490:	89 c2                	mov    edx,eax
  80a492:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a496:	be 00 00 00 00       	mov    esi,0x0
  80a49b:	48 89 c7             	mov    rdi,rax
  80a49e:	e8 bd 11 00 00       	call   80b660 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a4a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4a7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4ab:	89 c1                	mov    ecx,eax
  80a4ad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a4b1:	89 c2                	mov    edx,eax
  80a4b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a4b7:	49 89 c0             	mov    r8,rax
  80a4ba:	be 00 00 00 00       	mov    esi,0x0
  80a4bf:	bf 00 00 00 00       	mov    edi,0x0
  80a4c4:	e8 66 d6 ff ff       	call   807b2f <request>
  80a4c9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80a4cc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a4cf:	89 c7                	mov    edi,eax
  80a4d1:	e8 0d dd ff ff       	call   8081e3 <chk_result>
    fdentry = buf+finode->dentry_position;
  80a4d6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4de:	48 c1 e0 05          	shl    rax,0x5
  80a4e2:	48 89 c2             	mov    rdx,rax
  80a4e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a4e9:	48 01 d0             	add    rax,rdx
  80a4ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80a4f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a4f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a4f7:	89 c2                	mov    edx,eax
  80a4f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4fd:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80a500:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a504:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a507:	89 c2                	mov    edx,eax
  80a509:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a50d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80a511:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a515:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a519:	66 25 00 f0          	and    ax,0xf000
  80a51d:	89 c2                	mov    edx,eax
  80a51f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a523:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a526:	48 c1 e8 10          	shr    rax,0x10
  80a52a:	09 c2                	or     edx,eax
  80a52c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a530:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a534:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a538:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a53c:	89 c1                	mov    ecx,eax
  80a53e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a542:	89 c2                	mov    edx,eax
  80a544:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a548:	49 89 c0             	mov    r8,rax
  80a54b:	be 01 00 00 00       	mov    esi,0x1
  80a550:	bf 00 00 00 00       	mov    edi,0x0
  80a555:	e8 d5 d5 ff ff       	call   807b2f <request>
  80a55a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80a55d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80a560:	89 c7                	mov    edi,eax
  80a562:	e8 7c dc ff ff       	call   8081e3 <chk_result>
	vmfree(buf);
  80a567:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a56b:	48 89 c7             	mov    rdi,rax
  80a56e:	e8 c6 6d ff ff       	call   801339 <vmfree>
}
  80a573:	c9                   	leave  
  80a574:	c3                   	ret    

000000000080a575 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80a575:	f3 0f 1e fa          	endbr64 
  80a579:	55                   	push   rbp
  80a57a:	48 89 e5             	mov    rbp,rsp
  80a57d:	48 83 ec 50          	sub    rsp,0x50
  80a581:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80a585:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80a589:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a590:	00 
	struct FAT32_inode_info * finode = NULL;
  80a591:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a598:	00 
	struct FAT32_BootSector * fbs = NULL;
  80a599:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a5a0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80a5a1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a5a8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80a5a9:	be 00 00 00 00       	mov    esi,0x0
  80a5ae:	bf 18 00 00 00       	mov    edi,0x18
  80a5b3:	b8 00 00 00 00       	mov    eax,0x0
  80a5b8:	e8 ed 6c ff ff       	call   8012aa <vmalloc>
  80a5bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80a5c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5c5:	ba 18 00 00 00       	mov    edx,0x18
  80a5ca:	be 00 00 00 00       	mov    esi,0x0
  80a5cf:	48 89 c7             	mov    rdi,rax
  80a5d2:	e8 89 10 00 00       	call   80b660 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80a5d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5db:	48 c7 40 08 40 c2 80 	mov    QWORD PTR [rax+0x8],0x80c240
  80a5e2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80a5e3:	be 00 00 00 00       	mov    esi,0x0
  80a5e8:	bf 60 00 00 00       	mov    edi,0x60
  80a5ed:	b8 00 00 00 00       	mov    eax,0x0
  80a5f2:	e8 b3 6c ff ff       	call   8012aa <vmalloc>
  80a5f7:	48 89 c2             	mov    rdx,rax
  80a5fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5fe:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80a602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a606:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a60a:	ba 60 00 00 00       	mov    edx,0x60
  80a60f:	be 00 00 00 00       	mov    esi,0x0
  80a614:	48 89 c7             	mov    rdi,rax
  80a617:	e8 44 10 00 00       	call   80b660 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80a61c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a620:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80a624:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a628:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a62c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80a630:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a634:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a637:	89 c2                	mov    edx,eax
  80a639:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a63d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80a640:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a644:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80a647:	89 c2                	mov    edx,eax
  80a649:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a64d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80a651:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a655:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a659:	0f b6 d0             	movzx  edx,al
  80a65c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a660:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80a664:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a668:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a66c:	0f b6 d0             	movzx  edx,al
  80a66f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a673:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a677:	0f b7 c0             	movzx  eax,ax
  80a67a:	0f af c2             	imul   eax,edx
  80a67d:	48 63 d0             	movsxd rdx,eax
  80a680:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a684:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80a688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a68c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a690:	0f b7 d0             	movzx  edx,ax
  80a693:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a697:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80a69b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a69f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a6a2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6a6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a6aa:	0f b7 c0             	movzx  eax,ax
  80a6ad:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80a6b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6b4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80a6b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6bb:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a6bf:	0f b6 c0             	movzx  eax,al
  80a6c2:	0f af c2             	imul   eax,edx
  80a6c5:	01 c8                	add    eax,ecx
  80a6c7:	89 c2                	mov    edx,eax
  80a6c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6cd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80a6d1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6d5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a6d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6dc:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a6e0:	0f b7 c0             	movzx  eax,ax
  80a6e3:	01 d0                	add    eax,edx
  80a6e5:	89 c2                	mov    edx,eax
  80a6e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6eb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80a6ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6f3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80a6f6:	89 c2                	mov    edx,eax
  80a6f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6fc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80a700:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a704:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a708:	0f b6 d0             	movzx  edx,al
  80a70b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a70f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80a713:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a717:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a71b:	0f b7 d0             	movzx  edx,ax
  80a71e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a722:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80a726:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a72a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a72e:	0f b7 d0             	movzx  edx,ax
  80a731:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a735:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80a739:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a73d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80a740:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a744:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a748:	0f b7 d0             	movzx  edx,ax
  80a74b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a74f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a753:	0f b7 c0             	movzx  eax,ax
  80a756:	89 c6                	mov    esi,eax
  80a758:	bf 88 41 81 00       	mov    edi,0x814188
  80a75d:	b8 00 00 00 00       	mov    eax,0x0
  80a762:	e8 b1 65 ff ff       	call   800d18 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80a767:	be 00 00 00 00       	mov    esi,0x0
  80a76c:	bf 00 02 00 00       	mov    edi,0x200
  80a771:	b8 00 00 00 00       	mov    eax,0x0
  80a776:	e8 2f 6b ff ff       	call   8012aa <vmalloc>
  80a77b:	48 89 c2             	mov    rdx,rax
  80a77e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a782:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80a786:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a78a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a78e:	ba 00 02 00 00       	mov    edx,0x200
  80a793:	be 00 00 00 00       	mov    esi,0x0
  80a798:	48 89 c7             	mov    rdi,rax
  80a79b:	e8 c0 0e 00 00       	call   80b660 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80a7a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7a4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80a7a8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a7ac:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80a7af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7b3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a7b7:	0f b7 c0             	movzx  eax,ax
  80a7ba:	01 c8                	add    eax,ecx
  80a7bc:	49 89 d0             	mov    r8,rdx
  80a7bf:	b9 01 00 00 00       	mov    ecx,0x1
  80a7c4:	89 c2                	mov    edx,eax
  80a7c6:	be 00 00 00 00       	mov    esi,0x0
  80a7cb:	bf 00 00 00 00       	mov    edi,0x0
  80a7d0:	e8 5a d3 ff ff       	call   807b2f <request>
  80a7d5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80a7d8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80a7db:	89 c7                	mov    edi,eax
  80a7dd:	e8 01 da ff ff       	call   8081e3 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80a7e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7e6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a7ea:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80a7f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7f4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a7f8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80a7fe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a802:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a806:	8b 00                	mov    eax,DWORD PTR [rax]
  80a808:	89 c6                	mov    esi,eax
  80a80a:	bf d0 41 81 00       	mov    edi,0x8141d0
  80a80f:	b8 00 00 00 00       	mov    eax,0x0
  80a814:	e8 ff 64 ff ff       	call   800d18 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80a819:	be 00 00 00 00       	mov    esi,0x0
  80a81e:	bf 48 00 00 00       	mov    edi,0x48
  80a823:	b8 00 00 00 00       	mov    eax,0x0
  80a828:	e8 7d 6a ff ff       	call   8012aa <vmalloc>
  80a82d:	48 89 c2             	mov    rdx,rax
  80a830:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a834:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80a837:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a83b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a83e:	ba 48 00 00 00       	mov    edx,0x48
  80a843:	be 00 00 00 00       	mov    esi,0x0
  80a848:	48 89 c7             	mov    rdi,rax
  80a84b:	e8 10 0e 00 00       	call   80b660 <memset>

	list_init(&sbp->root->child_node);
  80a850:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a854:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a857:	48 83 c0 10          	add    rax,0x10
  80a85b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80a85f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a863:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a867:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a86a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a86e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a872:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a876:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80a877:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a87b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a87e:	48 83 c0 20          	add    rax,0x20
  80a882:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80a886:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a88a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a88e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a891:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a895:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a899:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a89d:	90                   	nop
	sbp->root->parent = sbp->root;
  80a89e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8a5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a8a9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80a8ac:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80a8b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8b7:	48 c7 40 40 20 c2 80 	mov    QWORD PTR [rax+0x40],0x80c220
  80a8be:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80a8bf:	be 00 00 00 00       	mov    esi,0x0
  80a8c4:	bf 02 00 00 00       	mov    edi,0x2
  80a8c9:	b8 00 00 00 00       	mov    eax,0x0
  80a8ce:	e8 d7 69 ff ff       	call   8012aa <vmalloc>
  80a8d3:	48 89 c2             	mov    rdx,rax
  80a8d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8da:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8dd:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80a8e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8ea:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80a8ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8f4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a8fb:	be 00 00 00 00       	mov    esi,0x0
  80a900:	bf 38 00 00 00       	mov    edi,0x38
  80a905:	b8 00 00 00 00       	mov    eax,0x0
  80a90a:	e8 9b 69 ff ff       	call   8012aa <vmalloc>
  80a90f:	48 89 c2             	mov    rdx,rax
  80a912:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a916:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a919:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80a91d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a921:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a924:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a928:	ba 38 00 00 00       	mov    edx,0x38
  80a92d:	be 00 00 00 00       	mov    esi,0x0
  80a932:	48 89 c7             	mov    rdi,rax
  80a935:	e8 26 0d 00 00       	call   80b660 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80a93a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a93e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a941:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a945:	48 c7 40 28 e0 c1 80 	mov    QWORD PTR [rax+0x28],0x80c1e0
  80a94c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80a94d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a951:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a954:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a958:	48 c7 40 20 a0 c1 80 	mov    QWORD PTR [rax+0x20],0x80c1a0
  80a95f:	00 
	sbp->root->dir_inode->file_size = 0;
  80a960:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a964:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a967:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a96b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a972:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a976:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a979:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a97d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a980:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a984:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a988:	48 01 d0             	add    rax,rdx
  80a98b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a98f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a993:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a997:	48 89 c6             	mov    rsi,rax
  80a99a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a99e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9a1:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80a9a5:	48 89 d0             	mov    rax,rdx
  80a9a8:	ba 00 00 00 00       	mov    edx,0x0
  80a9ad:	48 f7 f6             	div    rsi
  80a9b0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80a9b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9bb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9bf:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80a9c6:	00 
	sbp->root->dir_inode->sb = sbp;
  80a9c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9ce:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9d2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a9d6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a9da:	be 00 00 00 00       	mov    esi,0x0
  80a9df:	bf 20 00 00 00       	mov    edi,0x20
  80a9e4:	b8 00 00 00 00       	mov    eax,0x0
  80a9e9:	e8 bc 68 ff ff       	call   8012aa <vmalloc>
  80a9ee:	48 89 c2             	mov    rdx,rax
  80a9f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9f8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9fc:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80aa00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa07:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa0b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa0f:	ba 20 00 00 00       	mov    edx,0x20
  80aa14:	be 00 00 00 00       	mov    esi,0x0
  80aa19:	48 89 c7             	mov    rdi,rax
  80aa1c:	e8 3f 0c 00 00       	call   80b660 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80aa21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa28:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa2c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa30:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80aa34:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa38:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80aa3b:	89 c2                	mov    edx,eax
  80aa3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa41:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80aa44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa48:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80aa4f:	00 
	finode->dentry_position = 0; 
  80aa50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa54:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80aa5b:	00 
	finode->create_date = 0;
  80aa5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa60:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80aa66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa6a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80aa70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa74:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80aa7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa7e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80aa84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80aa88:	c9                   	leave  
  80aa89:	c3                   	ret    

000000000080aa8a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80aa8a:	f3 0f 1e fa          	endbr64 
  80aa8e:	55                   	push   rbp
  80aa8f:	48 89 e5             	mov    rbp,rsp
  80aa92:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80aa99:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80aaa0:	00 
	struct Disk_Partition_Table DPT = {0};
  80aaa1:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80aaa8:	b8 00 00 00 00       	mov    eax,0x0
  80aaad:	b9 40 00 00 00       	mov    ecx,0x40
  80aab2:	48 89 d7             	mov    rdi,rdx
  80aab5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80aab8:	bf 60 c2 80 00       	mov    edi,0x80c260
  80aabd:	e8 e7 c1 ff ff       	call   806ca9 <register_filesystem>
	
	memset(buf,0,512);
  80aac2:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80aac9:	ba 00 02 00 00       	mov    edx,0x200
  80aace:	be 00 00 00 00       	mov    esi,0x0
  80aad3:	48 89 c7             	mov    rdi,rax
  80aad6:	e8 85 0b 00 00       	call   80b660 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80aadb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80aae2:	49 89 c0             	mov    r8,rax
  80aae5:	b9 01 00 00 00       	mov    ecx,0x1
  80aaea:	ba 00 00 00 00       	mov    edx,0x0
  80aaef:	be 00 00 00 00       	mov    esi,0x0
  80aaf4:	bf 00 00 00 00       	mov    edi,0x0
  80aaf9:	e8 31 d0 ff ff       	call   807b2f <request>
  80aafe:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80ab01:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ab04:	89 c7                	mov    edi,eax
  80ab06:	e8 d8 d6 ff ff       	call   8081e3 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80ab0b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80ab12:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80ab19:	48 89 d6             	mov    rsi,rdx
  80ab1c:	ba 40 00 00 00       	mov    edx,0x40
  80ab21:	48 89 c7             	mov    rdi,rax
  80ab24:	48 89 d1             	mov    rcx,rdx
  80ab27:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80ab2a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80ab31:	0f b6 d0             	movzx  edx,al
  80ab34:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80ab3a:	89 c6                	mov    esi,eax
  80ab3c:	bf 18 42 81 00       	mov    edi,0x814218
  80ab41:	b8 00 00 00 00       	mov    eax,0x0
  80ab46:	e8 cd 61 ff ff       	call   800d18 <printf>

	memset(buf,0,512);
  80ab4b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab52:	ba 00 02 00 00       	mov    edx,0x200
  80ab57:	be 00 00 00 00       	mov    esi,0x0
  80ab5c:	48 89 c7             	mov    rdi,rax
  80ab5f:	e8 fc 0a 00 00       	call   80b660 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80ab64:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80ab6a:	89 c2                	mov    edx,eax
  80ab6c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab73:	49 89 c0             	mov    r8,rax
  80ab76:	b9 01 00 00 00       	mov    ecx,0x1
  80ab7b:	be 00 00 00 00       	mov    esi,0x0
  80ab80:	bf 00 00 00 00       	mov    edi,0x0
  80ab85:	e8 a5 cf ff ff       	call   807b2f <request>
  80ab8a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80ab8d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ab90:	89 c7                	mov    edi,eax
  80ab92:	e8 4c d6 ff ff       	call   8081e3 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80ab97:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab9e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80aba5:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80abac:	48 89 c2             	mov    rdx,rax
  80abaf:	48 89 ce             	mov    rsi,rcx
  80abb2:	bf 12 42 81 00       	mov    edi,0x814212
  80abb7:	e8 75 c0 ff ff       	call   806c31 <mount_fs>
  80abbc:	48 89 05 e5 c9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1c9e5],rax        # 4275a8 <root_sb>
}
  80abc3:	90                   	nop
  80abc4:	c9                   	leave  
  80abc5:	c3                   	ret    

000000000080abc6 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80abc6:	f3 0f 1e fa          	endbr64 
  80abca:	55                   	push   rbp
  80abcb:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  80abce:	48 8b 05 53 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f953]        # 42a528 <vpage_base>
  80abd5:	48 05 a0 00 00 00    	add    rax,0xa0
  80abdb:	48 89 05 46 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f946],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  80abe2:	8b 05 48 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f948]        # 42a530 <page_boffset>
  80abe8:	05 a0 00 00 00       	add    eax,0xa0
  80abed:	89 05 3d f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f93d],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  80abf3:	48 8b 15 2e f9 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f92e]        # 42a528 <vpage_base>
  80abfa:	48 8b 05 1f f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f91f]        # 42a520 <video_end>
  80ac01:	48 39 c2             	cmp    rdx,rax
  80ac04:	72 0e                	jb     80ac14 <scrdown+0x4e>
        vpage_base=video_base;
  80ac06:	48 8b 05 0b f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f90b]        # 42a518 <video_base>
  80ac0d:	48 89 05 14 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f914],rax        # 42a528 <vpage_base>
    set_origin();
  80ac14:	b8 00 00 00 00       	mov    eax,0x0
  80ac19:	e8 6a 00 00 00       	call   80ac88 <set_origin>
}
  80ac1e:	90                   	nop
  80ac1f:	5d                   	pop    rbp
  80ac20:	c3                   	ret    

000000000080ac21 <scrup>:
void scrup()
{
  80ac21:	f3 0f 1e fa          	endbr64 
  80ac25:	55                   	push   rbp
  80ac26:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80ac29:	8b 05 01 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f901]        # 42a530 <page_boffset>
  80ac2f:	85 c0                	test   eax,eax
  80ac31:	75 24                	jne    80ac57 <scrup+0x36>
    {
        page_boffset=0;
  80ac33:	c7 05 f3 f8 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f8f3],0x0        # 42a530 <page_boffset>
  80ac3a:	00 00 00 
        vpage_base=video_base;
  80ac3d:	48 8b 05 d4 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8d4]        # 42a518 <video_base>
  80ac44:	48 89 05 dd f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8dd],rax        # 42a528 <vpage_base>
        set_origin();
  80ac4b:	b8 00 00 00 00       	mov    eax,0x0
  80ac50:	e8 33 00 00 00       	call   80ac88 <set_origin>
        return;
  80ac55:	eb 2f                	jmp    80ac86 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80ac57:	48 8b 05 ca f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8ca]        # 42a528 <vpage_base>
  80ac5e:	48 2d a0 00 00 00    	sub    rax,0xa0
  80ac64:	48 89 05 bd f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8bd],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  80ac6b:	8b 05 bf f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8bf]        # 42a530 <page_boffset>
  80ac71:	2d a0 00 00 00       	sub    eax,0xa0
  80ac76:	89 05 b4 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8b4],eax        # 42a530 <page_boffset>
    set_origin();
  80ac7c:	b8 00 00 00 00       	mov    eax,0x0
  80ac81:	e8 02 00 00 00       	call   80ac88 <set_origin>
}
  80ac86:	5d                   	pop    rbp
  80ac87:	c3                   	ret    

000000000080ac88 <set_origin>:
void set_origin(void)
{
  80ac88:	f3 0f 1e fa          	endbr64 
  80ac8c:	55                   	push   rbp
  80ac8d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80ac90:	fa                   	cli    
    outb(port_reg_index,12);
  80ac91:	8b 05 a9 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8a9]        # 42a540 <port_reg_index>
  80ac97:	0f b7 c0             	movzx  eax,ax
  80ac9a:	be 0c 00 00 00       	mov    esi,0xc
  80ac9f:	89 c7                	mov    edi,eax
  80aca1:	e8 da a9 ff ff       	call   805680 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80aca6:	8b 05 84 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f884]        # 42a530 <page_boffset>
  80acac:	c1 e8 09             	shr    eax,0x9
  80acaf:	0f b6 d0             	movzx  edx,al
  80acb2:	8b 05 8c f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f88c]        # 42a544 <port_reg_v>
  80acb8:	0f b7 c0             	movzx  eax,ax
  80acbb:	89 d6                	mov    esi,edx
  80acbd:	89 c7                	mov    edi,eax
  80acbf:	e8 bc a9 ff ff       	call   805680 <outb>
    outb(port_reg_index,13);
  80acc4:	8b 05 76 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f876]        # 42a540 <port_reg_index>
  80acca:	0f b7 c0             	movzx  eax,ax
  80accd:	be 0d 00 00 00       	mov    esi,0xd
  80acd2:	89 c7                	mov    edi,eax
  80acd4:	e8 a7 a9 ff ff       	call   805680 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80acd9:	8b 05 51 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f851]        # 42a530 <page_boffset>
  80acdf:	d1 e8                	shr    eax,1
  80ace1:	0f b6 d0             	movzx  edx,al
  80ace4:	8b 05 5a f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f85a]        # 42a544 <port_reg_v>
  80acea:	0f b7 c0             	movzx  eax,ax
  80aced:	89 d6                	mov    esi,edx
  80acef:	89 c7                	mov    edi,eax
  80acf1:	e8 8a a9 ff ff       	call   805680 <outb>
    asm volatile("sti");
  80acf6:	fb                   	sti    

}
  80acf7:	90                   	nop
  80acf8:	5d                   	pop    rbp
  80acf9:	c3                   	ret    

000000000080acfa <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80acfa:	f3 0f 1e fa          	endbr64 
  80acfe:	55                   	push   rbp
  80acff:	48 89 e5             	mov    rbp,rsp
  80ad02:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80ad06:	be 48 44 81 00       	mov    esi,0x814448
  80ad0b:	bf f4 42 81 00       	mov    edi,0x8142f4
  80ad10:	e8 9a 09 00 00       	call   80b6af <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80ad15:	be 4d 44 81 00       	mov    esi,0x81444d
  80ad1a:	bf b4 43 81 00       	mov    edi,0x8143b4
  80ad1f:	e8 8b 09 00 00       	call   80b6af <strcpy>
    reg_driver(&drv_tty);
  80ad24:	bf 40 42 81 00       	mov    edi,0x814240
  80ad29:	e8 36 7b ff ff       	call   802864 <reg_driver>
    reg_device(&dev_tty);
  80ad2e:	bf e0 42 81 00       	mov    edi,0x8142e0
  80ad33:	e8 44 78 ff ff       	call   80257c <reg_device>
    reg_device(&dev_stdout);
  80ad38:	bf a0 43 81 00       	mov    edi,0x8143a0
  80ad3d:	e8 3a 78 ff ff       	call   80257c <reg_device>
    unsigned char *vp=0x20000;
  80ad42:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80ad49:	00 
    if(*vp==0x7)
  80ad4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad51:	3c 07                	cmp    al,0x7
  80ad53:	75 36                	jne    80ad8b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80ad55:	c7 05 d5 f7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f7d5],0x0        # 42a534 <video_mode>
  80ad5c:	00 00 00 
        video_base=0xb0000;
  80ad5f:	48 c7 05 ae f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7ae],0xb0000        # 42a518 <video_base>
  80ad66:	00 00 0b 00 
        video_end=0xb8000-1;
  80ad6a:	48 c7 05 ab f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7ab],0xb7fff        # 42a520 <video_end>
  80ad71:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80ad75:	c7 05 c1 f7 c1 ff b4 	mov    DWORD PTR [rip+0xffffffffffc1f7c1],0x3b4        # 42a540 <port_reg_index>
  80ad7c:	03 00 00 
        port_reg_v=0x3b5;
  80ad7f:	c7 05 bb f7 c1 ff b5 	mov    DWORD PTR [rip+0xffffffffffc1f7bb],0x3b5        # 42a544 <port_reg_v>
  80ad86:	03 00 00 
  80ad89:	eb 61                	jmp    80adec <init_tty+0xf2>
    }else if(*vp<=0x3)
  80ad8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad92:	3c 03                	cmp    al,0x3
  80ad94:	77 36                	ja     80adcc <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80ad96:	c7 05 94 f7 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc1f794],0x1        # 42a534 <video_mode>
  80ad9d:	00 00 00 
        video_base=0xb8000;
  80ada0:	48 c7 05 6d f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f76d],0xb8000        # 42a518 <video_base>
  80ada7:	00 80 0b 00 
        video_end=0xc0000-1;
  80adab:	48 c7 05 6a f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f76a],0xbffff        # 42a520 <video_end>
  80adb2:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80adb6:	c7 05 80 f7 c1 ff d4 	mov    DWORD PTR [rip+0xffffffffffc1f780],0x3d4        # 42a540 <port_reg_index>
  80adbd:	03 00 00 
        port_reg_v=0x3d5;
  80adc0:	c7 05 7a f7 c1 ff d5 	mov    DWORD PTR [rip+0xffffffffffc1f77a],0x3d5        # 42a544 <port_reg_v>
  80adc7:	03 00 00 
  80adca:	eb 20                	jmp    80adec <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80adcc:	c7 05 5e f7 c1 ff 02 	mov    DWORD PTR [rip+0xffffffffffc1f75e],0x2        # 42a534 <video_mode>
  80add3:	00 00 00 
        video_base=0xa0000;
  80add6:	48 c7 05 37 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f737],0xa0000        # 42a518 <video_base>
  80addd:	00 00 0a 00 
        video_end=0xb0000-1;
  80ade1:	48 c7 05 34 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f734],0xaffff        # 42a520 <video_end>
  80ade8:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80adec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adf0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80adf3:	3c 01                	cmp    al,0x1
  80adf5:	77 0f                	ja     80ae06 <init_tty+0x10c>
  80adf7:	c7 05 3b f7 c1 ff 28 	mov    DWORD PTR [rip+0xffffffffffc1f73b],0x28        # 42a53c <line_chs>
  80adfe:	00 00 00 
  80ae01:	e9 91 00 00 00       	jmp    80ae97 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80ae06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae0a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae0d:	3c 03                	cmp    al,0x3
  80ae0f:	76 0b                	jbe    80ae1c <init_tty+0x122>
  80ae11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae18:	3c 07                	cmp    al,0x7
  80ae1a:	75 0c                	jne    80ae28 <init_tty+0x12e>
  80ae1c:	c7 05 16 f7 c1 ff 50 	mov    DWORD PTR [rip+0xffffffffffc1f716],0x50        # 42a53c <line_chs>
  80ae23:	00 00 00 
  80ae26:	eb 6f                	jmp    80ae97 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80ae28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae2c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae2f:	3c 05                	cmp    al,0x5
  80ae31:	76 16                	jbe    80ae49 <init_tty+0x14f>
  80ae33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae3a:	3c 09                	cmp    al,0x9
  80ae3c:	74 0b                	je     80ae49 <init_tty+0x14f>
  80ae3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae45:	3c 0d                	cmp    al,0xd
  80ae47:	75 0c                	jne    80ae55 <init_tty+0x15b>
  80ae49:	c7 05 e9 f6 c1 ff 40 	mov    DWORD PTR [rip+0xffffffffffc1f6e9],0x140        # 42a53c <line_chs>
  80ae50:	01 00 00 
  80ae53:	eb 42                	jmp    80ae97 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80ae55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae5c:	3c 06                	cmp    al,0x6
  80ae5e:	74 16                	je     80ae76 <init_tty+0x17c>
  80ae60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae67:	3c 0a                	cmp    al,0xa
  80ae69:	74 0b                	je     80ae76 <init_tty+0x17c>
  80ae6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae72:	3c 0d                	cmp    al,0xd
  80ae74:	76 0c                	jbe    80ae82 <init_tty+0x188>
  80ae76:	c7 05 bc f6 c1 ff 80 	mov    DWORD PTR [rip+0xffffffffffc1f6bc],0x280        # 42a53c <line_chs>
  80ae7d:	02 00 00 
  80ae80:	eb 15                	jmp    80ae97 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80ae82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae89:	3c 08                	cmp    al,0x8
  80ae8b:	75 0a                	jne    80ae97 <init_tty+0x19d>
  80ae8d:	c7 05 a5 f6 c1 ff a0 	mov    DWORD PTR [rip+0xffffffffffc1f6a5],0xa0        # 42a53c <line_chs>
  80ae94:	00 00 00 
    switch (*vp)
  80ae97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae9b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae9e:	0f b6 c0             	movzx  eax,al
  80aea1:	83 f8 14             	cmp    eax,0x14
  80aea4:	77 61                	ja     80af07 <init_tty+0x20d>
  80aea6:	89 c0                	mov    eax,eax
  80aea8:	48 8b 04 c5 58 44 81 	mov    rax,QWORD PTR [rax*8+0x814458]
  80aeaf:	00 
  80aeb0:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80aeb3:	c7 05 8b f6 c1 ff e8 	mov    DWORD PTR [rip+0xffffffffffc1f68b],0x3e8        # 42a548 <vpage_size>
  80aeba:	03 00 00 
  80aebd:	eb 49                	jmp    80af08 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80aebf:	c7 05 7f f6 c1 ff d0 	mov    DWORD PTR [rip+0xffffffffffc1f67f],0x7d0        # 42a548 <vpage_size>
  80aec6:	07 00 00 
  80aec9:	eb 3d                	jmp    80af08 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80aecb:	c7 05 73 f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f673],0xfa00        # 42a548 <vpage_size>
  80aed2:	fa 00 00 
  80aed5:	eb 31                	jmp    80af08 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80aed7:	c7 05 67 f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f667],0x1f400        # 42a548 <vpage_size>
  80aede:	f4 01 00 
  80aee1:	eb 25                	jmp    80af08 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80aee3:	c7 05 5b f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f65b],0x7d00        # 42a548 <vpage_size>
  80aeea:	7d 00 00 
  80aeed:	eb 19                	jmp    80af08 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80aeef:	c7 05 4f f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f64f],0x36b00        # 42a548 <vpage_size>
  80aef6:	6b 03 00 
  80aef9:	eb 0d                	jmp    80af08 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80aefb:	c7 05 43 f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f643],0x4b000        # 42a548 <vpage_size>
  80af02:	b0 04 00 
  80af05:	eb 01                	jmp    80af08 <init_tty+0x20e>
    default:
        break;
  80af07:	90                   	nop
    }
    m_ptr=video_base;
  80af08:	48 8b 05 09 f6 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f609]        # 42a518 <video_base>
  80af0f:	48 89 05 6a 13 00 00 	mov    QWORD PTR [rip+0x136a],rax        # 80c280 <m_ptr>
    page_boffset=0;
  80af16:	c7 05 10 f6 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f610],0x0        # 42a530 <page_boffset>
  80af1d:	00 00 00 
    vpage_base=video_base;
  80af20:	48 8b 05 f1 f5 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f5f1]        # 42a518 <video_base>
  80af27:	48 89 05 fa f5 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f5fa],rax        # 42a528 <vpage_base>
    vp++;
  80af2e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80af33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af3a:	0f b6 c0             	movzx  eax,al
  80af3d:	89 05 f5 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5f5],eax        # 42a538 <vpage>
    vp++;
  80af43:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80af48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af4c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80af50:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80af54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af57:	0f b6 c0             	movzx  eax,al
  80af5a:	89 05 f4 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5f4],eax        # 42a554 <stline>
    endline=*vp++;
  80af60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af64:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80af68:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80af6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af6f:	0f b6 c0             	movzx  eax,al
  80af72:	89 05 e0 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5e0],eax        # 42a558 <endline>
    videoy=*vp++;
  80af78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af7c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80af80:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80af84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af87:	0f b6 c0             	movzx  eax,al
  80af8a:	89 05 c0 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5c0],eax        # 42a550 <videoy>
    videox=*vp;
  80af90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af94:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af97:	0f b6 c0             	movzx  eax,al
  80af9a:	89 05 ac f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5ac],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80afa0:	90                   	nop
  80afa1:	c9                   	leave  
  80afa2:	c3                   	ret    

000000000080afa3 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80afa3:	f3 0f 1e fa          	endbr64 
  80afa7:	55                   	push   rbp
  80afa8:	48 89 e5             	mov    rbp,rsp
  80afab:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80afaf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80afb3:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80afb6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80afb9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80afbc:	05 00 c0 05 00       	add    eax,0x5c000
  80afc1:	01 c0                	add    eax,eax
  80afc3:	48 98                	cdqe   
  80afc5:	48 89 05 b4 12 00 00 	mov    QWORD PTR [rip+0x12b4],rax        # 80c280 <m_ptr>
}
  80afcc:	90                   	nop
  80afcd:	5d                   	pop    rbp
  80afce:	c3                   	ret    

000000000080afcf <tell_monitor>:
int tell_monitor()
{
  80afcf:	f3 0f 1e fa          	endbr64 
  80afd3:	55                   	push   rbp
  80afd4:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80afd7:	48 8b 05 a2 12 00 00 	mov    rax,QWORD PTR [rip+0x12a2]        # 80c280 <m_ptr>
  80afde:	48 8b 15 33 f5 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f533]        # 42a518 <video_base>
  80afe5:	48 29 d0             	sub    rax,rdx
  80afe8:	48 89 c2             	mov    rdx,rax
  80afeb:	48 c1 ea 3f          	shr    rdx,0x3f
  80afef:	48 01 d0             	add    rax,rdx
  80aff2:	48 d1 f8             	sar    rax,1
}
  80aff5:	5d                   	pop    rbp
  80aff6:	c3                   	ret    

000000000080aff7 <del_ch>:
void del_ch()
{
  80aff7:	f3 0f 1e fa          	endbr64 
  80affb:	55                   	push   rbp
  80affc:	48 89 e5             	mov    rbp,rsp
  80afff:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80b006:	48 8b 05 73 12 00 00 	mov    rax,QWORD PTR [rip+0x1273]        # 80c280 <m_ptr>
  80b00d:	48 83 e8 02          	sub    rax,0x2
  80b011:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80b015:	b8 00 00 00 00       	mov    eax,0x0
  80b01a:	e8 b0 ff ff ff       	call   80afcf <tell_monitor>
  80b01f:	89 c2                	mov    edx,eax
  80b021:	48 63 c2             	movsxd rax,edx
  80b024:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80b02b:	48 c1 e8 20          	shr    rax,0x20
  80b02f:	c1 f8 05             	sar    eax,0x5
  80b032:	89 d1                	mov    ecx,edx
  80b034:	c1 f9 1f             	sar    ecx,0x1f
  80b037:	29 c8                	sub    eax,ecx
  80b039:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80b03c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80b03f:	89 c8                	mov    eax,ecx
  80b041:	c1 e0 02             	shl    eax,0x2
  80b044:	01 c8                	add    eax,ecx
  80b046:	c1 e0 04             	shl    eax,0x4
  80b049:	29 c2                	sub    edx,eax
  80b04b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80b04e:	eb 17                	jmp    80b067 <del_ch+0x70>
    {
        *p=*(p+2);
  80b050:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b054:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80b058:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b05c:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80b05e:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80b063:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b067:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80b06b:	7e e3                	jle    80b050 <del_ch+0x59>
    }
    driver_args args= {
  80b06d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80b074:	b8 00 00 00 00       	mov    eax,0x0
  80b079:	b9 18 00 00 00       	mov    ecx,0x18
  80b07e:	48 89 d7             	mov    rdi,rdx
  80b081:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80b084:	b8 00 00 00 00       	mov    eax,0x0
  80b089:	e8 41 ff ff ff       	call   80afcf <tell_monitor>
  80b08e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80b091:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80b097:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80b09e:	48 89 c7             	mov    rdi,rax
  80b0a1:	e8 fd fe ff ff       	call   80afa3 <seek_tty>
    set_cur();
  80b0a6:	b8 00 00 00 00       	mov    eax,0x0
  80b0ab:	e8 03 00 00 00       	call   80b0b3 <set_cur>
}
  80b0b0:	90                   	nop
  80b0b1:	c9                   	leave  
  80b0b2:	c3                   	ret    

000000000080b0b3 <set_cur>:
void set_cur()
{
  80b0b3:	f3 0f 1e fa          	endbr64 
  80b0b7:	55                   	push   rbp
  80b0b8:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b0bb:	fa                   	cli    
    outb(port_reg_index,14);
  80b0bc:	8b 05 7e f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f47e]        # 42a540 <port_reg_index>
  80b0c2:	0f b7 c0             	movzx  eax,ax
  80b0c5:	be 0e 00 00 00       	mov    esi,0xe
  80b0ca:	89 c7                	mov    edi,eax
  80b0cc:	e8 af a5 ff ff       	call   805680 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80b0d1:	48 8b 05 a8 11 00 00 	mov    rax,QWORD PTR [rip+0x11a8]        # 80c280 <m_ptr>
  80b0d8:	48 8b 15 39 f4 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f439]        # 42a518 <video_base>
  80b0df:	48 29 d0             	sub    rax,rdx
  80b0e2:	48 c1 f8 09          	sar    rax,0x9
  80b0e6:	0f b6 d0             	movzx  edx,al
  80b0e9:	8b 05 55 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f455]        # 42a544 <port_reg_v>
  80b0ef:	0f b7 c0             	movzx  eax,ax
  80b0f2:	89 d6                	mov    esi,edx
  80b0f4:	89 c7                	mov    edi,eax
  80b0f6:	e8 85 a5 ff ff       	call   805680 <outb>
    outb(port_reg_index,15);
  80b0fb:	8b 05 3f f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f43f]        # 42a540 <port_reg_index>
  80b101:	0f b7 c0             	movzx  eax,ax
  80b104:	be 0f 00 00 00       	mov    esi,0xf
  80b109:	89 c7                	mov    edi,eax
  80b10b:	e8 70 a5 ff ff       	call   805680 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80b110:	48 8b 05 69 11 00 00 	mov    rax,QWORD PTR [rip+0x1169]        # 80c280 <m_ptr>
  80b117:	48 8b 15 fa f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f3fa]        # 42a518 <video_base>
  80b11e:	48 29 d0             	sub    rax,rdx
  80b121:	48 d1 f8             	sar    rax,1
  80b124:	0f b6 d0             	movzx  edx,al
  80b127:	8b 05 17 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f417]        # 42a544 <port_reg_v>
  80b12d:	0f b7 c0             	movzx  eax,ax
  80b130:	89 d6                	mov    esi,edx
  80b132:	89 c7                	mov    edi,eax
  80b134:	e8 47 a5 ff ff       	call   805680 <outb>
    asm volatile("sti");
  80b139:	fb                   	sti    
}
  80b13a:	90                   	nop
  80b13b:	5d                   	pop    rbp
  80b13c:	c3                   	ret    

000000000080b13d <read_tty>:

int read_tty(driver_args *args)
{
  80b13d:	f3 0f 1e fa          	endbr64 
  80b141:	55                   	push   rbp
  80b142:	48 89 e5             	mov    rbp,rsp
  80b145:	48 83 ec 20          	sub    rsp,0x20
  80b149:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80b14d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b151:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80b154:	48 98                	cdqe   
  80b156:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b15a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b15e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b161:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b164:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b16b:	eb 4a                	jmp    80b1b7 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80b16d:	48 8b 15 0c 11 00 00 	mov    rdx,QWORD PTR [rip+0x110c]        # 80c280 <m_ptr>
  80b174:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b178:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b17c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b180:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b183:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80b185:	48 8b 05 f4 10 00 00 	mov    rax,QWORD PTR [rip+0x10f4]        # 80c280 <m_ptr>
  80b18c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80b192:	75 0d                	jne    80b1a1 <read_tty+0x64>
  80b194:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b198:	7e 07                	jle    80b1a1 <read_tty+0x64>
        {
            return 1;//读到尾了
  80b19a:	b8 01 00 00 00       	mov    eax,0x1
  80b19f:	eb 2d                	jmp    80b1ce <read_tty+0x91>
        }
        m_ptr+=2;
  80b1a1:	48 8b 05 d8 10 00 00 	mov    rax,QWORD PTR [rip+0x10d8]        # 80c280 <m_ptr>
  80b1a8:	48 83 c0 02          	add    rax,0x2
  80b1ac:	48 89 05 cd 10 00 00 	mov    QWORD PTR [rip+0x10cd],rax        # 80c280 <m_ptr>
    for(int i=0;i<len;i++)
  80b1b3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b1b7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b1ba:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b1bd:	7c ae                	jl     80b16d <read_tty+0x30>
    }
    set_cur();
  80b1bf:	b8 00 00 00 00       	mov    eax,0x0
  80b1c4:	e8 ea fe ff ff       	call   80b0b3 <set_cur>
    return 0;
  80b1c9:	b8 00 00 00 00       	mov    eax,0x0
}
  80b1ce:	c9                   	leave  
  80b1cf:	c3                   	ret    

000000000080b1d0 <write_tty>:
int write_tty(driver_args *args)
{
  80b1d0:	f3 0f 1e fa          	endbr64 
  80b1d4:	55                   	push   rbp
  80b1d5:	48 89 e5             	mov    rbp,rsp
  80b1d8:	48 83 ec 30          	sub    rsp,0x30
  80b1dc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80b1e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b1e4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b1e7:	48 98                	cdqe   
  80b1e9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b1ed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b1f1:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b1f4:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b1f7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b1fe:	e9 0b 01 00 00       	jmp    80b30e <write_tty+0x13e>
    {
        if(*src=='\n')
  80b203:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b207:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b20a:	3c 0a                	cmp    al,0xa
  80b20c:	75 50                	jne    80b25e <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80b20e:	48 8b 05 6b 10 00 00 	mov    rax,QWORD PTR [rip+0x106b]        # 80c280 <m_ptr>
  80b215:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80b21b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80b21e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b221:	89 c2                	mov    edx,eax
  80b223:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80b228:	48 0f af c2          	imul   rax,rdx
  80b22c:	48 c1 e8 20          	shr    rax,0x20
  80b230:	c1 e8 07             	shr    eax,0x7
  80b233:	8d 50 01             	lea    edx,[rax+0x1]
  80b236:	89 d0                	mov    eax,edx
  80b238:	c1 e0 02             	shl    eax,0x2
  80b23b:	01 d0                	add    eax,edx
  80b23d:	c1 e0 05             	shl    eax,0x5
  80b240:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80b243:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b246:	05 00 80 0b 00       	add    eax,0xb8000
  80b24b:	89 c0                	mov    eax,eax
  80b24d:	48 89 05 2c 10 00 00 	mov    QWORD PTR [rip+0x102c],rax        # 80c280 <m_ptr>
            src++;
  80b254:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80b259:	e9 ac 00 00 00       	jmp    80b30a <write_tty+0x13a>
        }else if(*src=='\0')
  80b25e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b262:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b265:	84 c0                	test   al,al
  80b267:	0f 84 af 00 00 00    	je     80b31c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80b26d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b271:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b274:	3c 08                	cmp    al,0x8
  80b276:	75 1e                	jne    80b296 <write_tty+0xc6>
        {
            m_ptr-=2;
  80b278:	48 8b 05 01 10 00 00 	mov    rax,QWORD PTR [rip+0x1001]        # 80c280 <m_ptr>
  80b27f:	48 83 e8 02          	sub    rax,0x2
  80b283:	48 89 05 f6 0f 00 00 	mov    QWORD PTR [rip+0xff6],rax        # 80c280 <m_ptr>
            *m_ptr=0;
  80b28a:	48 8b 05 ef 0f 00 00 	mov    rax,QWORD PTR [rip+0xfef]        # 80c280 <m_ptr>
  80b291:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80b294:	eb 3e                	jmp    80b2d4 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80b296:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b29a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b29e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80b2a2:	48 8b 05 d7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfd7]        # 80c280 <m_ptr>
  80b2a9:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b2ad:	48 89 0d cc 0f 00 00 	mov    QWORD PTR [rip+0xfcc],rcx        # 80c280 <m_ptr>
  80b2b4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b2b7:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80b2b9:	48 8b 05 c0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc0]        # 80c280 <m_ptr>
  80b2c0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b2c4:	48 89 15 b5 0f 00 00 	mov    QWORD PTR [rip+0xfb5],rdx        # 80c280 <m_ptr>
  80b2cb:	0f b6 15 b6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfb6]        # 80c288 <m_color>
  80b2d2:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80b2d4:	48 8b 05 a5 0f 00 00 	mov    rax,QWORD PTR [rip+0xfa5]        # 80c280 <m_ptr>
  80b2db:	48 8b 0d 46 f2 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1f246]        # 42a528 <vpage_base>
  80b2e2:	48 29 c8             	sub    rax,rcx
  80b2e5:	48 89 c2             	mov    rdx,rax
  80b2e8:	8b 05 5a f2 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f25a]        # 42a548 <vpage_size>
  80b2ee:	8b 0d 48 f2 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f248]        # 42a53c <line_chs>
  80b2f4:	29 c8                	sub    eax,ecx
  80b2f6:	01 c0                	add    eax,eax
  80b2f8:	48 98                	cdqe   
  80b2fa:	48 39 c2             	cmp    rdx,rax
  80b2fd:	7c 0b                	jl     80b30a <write_tty+0x13a>
  80b2ff:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b303:	7e 05                	jle    80b30a <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80b305:	e8 bc f8 ff ff       	call   80abc6 <scrdown>
    for(int i=0;i<len;i++)
  80b30a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b30e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b311:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b314:	0f 8c e9 fe ff ff    	jl     80b203 <write_tty+0x33>
  80b31a:	eb 01                	jmp    80b31d <write_tty+0x14d>
            break;
  80b31c:	90                   	nop
        }
    }
    set_cur();
  80b31d:	b8 00 00 00 00       	mov    eax,0x0
  80b322:	e8 8c fd ff ff       	call   80b0b3 <set_cur>
    return 0;
  80b327:	b8 00 00 00 00       	mov    eax,0x0
}
  80b32c:	c9                   	leave  
  80b32d:	c3                   	ret    

000000000080b32e <cls>:

void cls(driver_args *args)
{
  80b32e:	f3 0f 1e fa          	endbr64 
  80b332:	55                   	push   rbp
  80b333:	48 89 e5             	mov    rbp,rsp
  80b336:	48 83 ec 20          	sub    rsp,0x20
  80b33a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80b33e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b345:	eb 16                	jmp    80b35d <cls+0x2f>
    {
        vpage_base[i]=0;
  80b347:	48 8b 15 da f1 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f1da]        # 42a528 <vpage_base>
  80b34e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b351:	48 98                	cdqe   
  80b353:	48 01 d0             	add    rax,rdx
  80b356:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80b359:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80b35d:	8b 05 e5 f1 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f1e5]        # 42a548 <vpage_size>
  80b363:	01 c0                	add    eax,eax
  80b365:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80b368:	7c dd                	jl     80b347 <cls+0x19>
    }
    m_ptr=vpage_base;
  80b36a:	48 8b 05 b7 f1 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f1b7]        # 42a528 <vpage_base>
  80b371:	48 89 05 08 0f 00 00 	mov    QWORD PTR [rip+0xf08],rax        # 80c280 <m_ptr>
    set_cur();
  80b378:	b8 00 00 00 00       	mov    eax,0x0
  80b37d:	e8 31 fd ff ff       	call   80b0b3 <set_cur>
}
  80b382:	90                   	nop
  80b383:	c9                   	leave  
  80b384:	c3                   	ret    

000000000080b385 <set_color>:

void set_color(char color)
{
  80b385:	f3 0f 1e fa          	endbr64 
  80b389:	55                   	push   rbp
  80b38a:	48 89 e5             	mov    rbp,rsp
  80b38d:	89 f8                	mov    eax,edi
  80b38f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80b392:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80b396:	88 05 ec 0e 00 00    	mov    BYTE PTR [rip+0xeec],al        # 80c288 <m_color>
}
  80b39c:	90                   	nop
  80b39d:	5d                   	pop    rbp
  80b39e:	c3                   	ret    

000000000080b39f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80b39f:	f3 0f 1e fa          	endbr64 
  80b3a3:	55                   	push   rbp
  80b3a4:	48 89 e5             	mov    rbp,rsp
  80b3a7:	48 83 ec 10          	sub    rsp,0x10
  80b3ab:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80b3af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3b3:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80b3b9:	83 f8 0d             	cmp    eax,0xd
  80b3bc:	74 45                	je     80b403 <tty_do_req+0x64>
  80b3be:	83 f8 0d             	cmp    eax,0xd
  80b3c1:	7f 53                	jg     80b416 <tty_do_req+0x77>
  80b3c3:	83 f8 0c             	cmp    eax,0xc
  80b3c6:	74 2d                	je     80b3f5 <tty_do_req+0x56>
  80b3c8:	83 f8 0c             	cmp    eax,0xc
  80b3cb:	7f 49                	jg     80b416 <tty_do_req+0x77>
  80b3cd:	83 f8 02             	cmp    eax,0x2
  80b3d0:	74 07                	je     80b3d9 <tty_do_req+0x3a>
  80b3d2:	83 f8 03             	cmp    eax,0x3
  80b3d5:	74 10                	je     80b3e7 <tty_do_req+0x48>
  80b3d7:	eb 3d                	jmp    80b416 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80b3d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3dd:	48 89 c7             	mov    rdi,rax
  80b3e0:	e8 58 fd ff ff       	call   80b13d <read_tty>
        break;
  80b3e5:	eb 36                	jmp    80b41d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80b3e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3eb:	48 89 c7             	mov    rdi,rax
  80b3ee:	e8 dd fd ff ff       	call   80b1d0 <write_tty>
        break;
  80b3f3:	eb 28                	jmp    80b41d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80b3f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3f9:	48 89 c7             	mov    rdi,rax
  80b3fc:	e8 a2 fb ff ff       	call   80afa3 <seek_tty>
        break;
  80b401:	eb 1a                	jmp    80b41d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80b403:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b407:	48 89 c7             	mov    rdi,rax
  80b40a:	b8 00 00 00 00       	mov    eax,0x0
  80b40f:	e8 bb fb ff ff       	call   80afcf <tell_monitor>
        break;
  80b414:	eb 07                	jmp    80b41d <tty_do_req+0x7e>
    default:return -1;
  80b416:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b41b:	eb 05                	jmp    80b422 <tty_do_req+0x83>
    }
    return 0;
  80b41d:	b8 00 00 00 00       	mov    eax,0x0
}
  80b422:	c9                   	leave  
  80b423:	c3                   	ret    

000000000080b424 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b424:	f3 0f 1e fa          	endbr64 
  80b428:	55                   	push   rbp
  80b429:	48 89 e5             	mov    rbp,rsp
  80b42c:	48 83 ec 10          	sub    rsp,0x10
  80b430:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b433:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b436:	83 c0 01             	add    eax,0x1
  80b439:	0f b7 c0             	movzx  eax,ax
  80b43c:	be 00 00 00 00       	mov    esi,0x0
  80b441:	89 c7                	mov    edi,eax
  80b443:	e8 38 a2 ff ff       	call   805680 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b448:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b44b:	83 c0 03             	add    eax,0x3
  80b44e:	0f b7 c0             	movzx  eax,ax
  80b451:	be 80 00 00 00       	mov    esi,0x80
  80b456:	89 c7                	mov    edi,eax
  80b458:	e8 23 a2 ff ff       	call   805680 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b45d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b460:	0f b7 c0             	movzx  eax,ax
  80b463:	be 03 00 00 00       	mov    esi,0x3
  80b468:	89 c7                	mov    edi,eax
  80b46a:	e8 11 a2 ff ff       	call   805680 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b46f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b472:	83 c0 01             	add    eax,0x1
  80b475:	0f b7 c0             	movzx  eax,ax
  80b478:	be 00 00 00 00       	mov    esi,0x0
  80b47d:	89 c7                	mov    edi,eax
  80b47f:	e8 fc a1 ff ff       	call   805680 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b484:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b487:	83 c0 03             	add    eax,0x3
  80b48a:	0f b7 c0             	movzx  eax,ax
  80b48d:	be 03 00 00 00       	mov    esi,0x3
  80b492:	89 c7                	mov    edi,eax
  80b494:	e8 e7 a1 ff ff       	call   805680 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80b499:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b49c:	83 c0 02             	add    eax,0x2
  80b49f:	0f b7 c0             	movzx  eax,ax
  80b4a2:	be c7 00 00 00       	mov    esi,0xc7
  80b4a7:	89 c7                	mov    edi,eax
  80b4a9:	e8 d2 a1 ff ff       	call   805680 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b4ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4b1:	83 c0 04             	add    eax,0x4
  80b4b4:	0f b7 c0             	movzx  eax,ax
  80b4b7:	be 0b 00 00 00       	mov    esi,0xb
  80b4bc:	89 c7                	mov    edi,eax
  80b4be:	e8 bd a1 ff ff       	call   805680 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80b4c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4c6:	83 c0 04             	add    eax,0x4
  80b4c9:	0f b7 c0             	movzx  eax,ax
  80b4cc:	be 1e 00 00 00       	mov    esi,0x1e
  80b4d1:	89 c7                	mov    edi,eax
  80b4d3:	e8 a8 a1 ff ff       	call   805680 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80b4d8:	b8 61 00 00 00       	mov    eax,0x61
  80b4dd:	0f b6 d0             	movzx  edx,al
  80b4e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4e3:	0f b7 c0             	movzx  eax,ax
  80b4e6:	89 d6                	mov    esi,edx
  80b4e8:	89 c7                	mov    edi,eax
  80b4ea:	e8 91 a1 ff ff       	call   805680 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80b4ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4f2:	0f b6 c0             	movzx  eax,al
  80b4f5:	89 c7                	mov    edi,eax
  80b4f7:	e8 9d a1 ff ff       	call   805699 <inb>
  80b4fc:	0f b6 d0             	movzx  edx,al
  80b4ff:	b8 61 00 00 00       	mov    eax,0x61
  80b504:	0f be c0             	movsx  eax,al
  80b507:	39 c2                	cmp    edx,eax
  80b509:	75 17                	jne    80b522 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b50b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b50e:	83 c0 04             	add    eax,0x4
  80b511:	0f b7 c0             	movzx  eax,ax
  80b514:	be 0f 00 00 00       	mov    esi,0xf
  80b519:	89 c7                	mov    edi,eax
  80b51b:	e8 60 a1 ff ff       	call   805680 <outb>
  80b520:	eb 01                	jmp    80b523 <init_com+0xff>
        return;
  80b522:	90                   	nop
}
  80b523:	c9                   	leave  
  80b524:	c3                   	ret    

000000000080b525 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80b525:	f3 0f 1e fa          	endbr64 
  80b529:	55                   	push   rbp
  80b52a:	48 89 e5             	mov    rbp,rsp
  80b52d:	48 83 ec 20          	sub    rsp,0x20
  80b531:	89 f8                	mov    eax,edi
  80b533:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80b536:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80b53a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b53d:	83 c0 05             	add    eax,0x5
  80b540:	0f b6 c0             	movzx  eax,al
  80b543:	89 c7                	mov    edi,eax
  80b545:	e8 4f a1 ff ff       	call   805699 <inb>
  80b54a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80b54d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80b551:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80b555:	74 e3                	je     80b53a <com_putchar+0x15>
    outb(com_base, ch);
  80b557:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80b55b:	0f b6 d0             	movzx  edx,al
  80b55e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b561:	0f b7 c0             	movzx  eax,ax
  80b564:	89 d6                	mov    esi,edx
  80b566:	89 c7                	mov    edi,eax
  80b568:	e8 13 a1 ff ff       	call   805680 <outb>
}
  80b56d:	90                   	nop
  80b56e:	c9                   	leave  
  80b56f:	c3                   	ret    

000000000080b570 <com_puts>:

void com_puts(char* s,int com_port){
  80b570:	f3 0f 1e fa          	endbr64 
  80b574:	55                   	push   rbp
  80b575:	48 89 e5             	mov    rbp,rsp
  80b578:	48 83 ec 10          	sub    rsp,0x10
  80b57c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b580:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80b583:	eb 1d                	jmp    80b5a2 <com_puts+0x32>
        com_putchar(*s,com_port);
  80b585:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b589:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b58c:	66 98                	cbw    
  80b58e:	0f b7 c0             	movzx  eax,ax
  80b591:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80b594:	89 d6                	mov    esi,edx
  80b596:	89 c7                	mov    edi,eax
  80b598:	e8 88 ff ff ff       	call   80b525 <com_putchar>
    for(;*s;s++){
  80b59d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80b5a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b5a9:	84 c0                	test   al,al
  80b5ab:	75 d8                	jne    80b585 <com_puts+0x15>
    }
  80b5ad:	90                   	nop
  80b5ae:	90                   	nop
  80b5af:	c9                   	leave  
  80b5b0:	c3                   	ret    

000000000080b5b1 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80b5b1:	f3 0f 1e fa          	endbr64 
  80b5b5:	55                   	push   rbp
  80b5b6:	48 89 e5             	mov    rbp,rsp
  80b5b9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b5bd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b5c1:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80b5c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b5c8:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80b5cb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b5d2:	eb 1b                	jmp    80b5ef <memcpy+0x3e>
        *(dest)=*(src);
  80b5d4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b5d8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b5db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b5df:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80b5e1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80b5e6:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80b5eb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b5ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5f2:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80b5f5:	77 dd                	ja     80b5d4 <memcpy+0x23>
    }
}
  80b5f7:	90                   	nop
  80b5f8:	90                   	nop
  80b5f9:	5d                   	pop    rbp
  80b5fa:	c3                   	ret    

000000000080b5fb <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80b5fb:	f3 0f 1e fa          	endbr64 
  80b5ff:	55                   	push   rbp
  80b600:	48 89 e5             	mov    rbp,rsp
  80b603:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b607:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b60b:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80b60e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b615:	eb 3a                	jmp    80b651 <memcmp+0x56>
    {
        if(*a!=*b)
  80b617:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b61b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b61e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b622:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b625:	38 c2                	cmp    dl,al
  80b627:	74 1a                	je     80b643 <memcmp+0x48>
            return *a-*b;
  80b629:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b62d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b630:	0f b6 d0             	movzx  edx,al
  80b633:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b637:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b63a:	0f b6 c8             	movzx  ecx,al
  80b63d:	89 d0                	mov    eax,edx
  80b63f:	29 c8                	sub    eax,ecx
  80b641:	eb 1b                	jmp    80b65e <memcmp+0x63>
        a++;
  80b643:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80b648:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80b64d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b651:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b654:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80b657:	7c be                	jl     80b617 <memcmp+0x1c>
    }
    return 0;
  80b659:	b8 00 00 00 00       	mov    eax,0x0
}
  80b65e:	5d                   	pop    rbp
  80b65f:	c3                   	ret    

000000000080b660 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80b660:	f3 0f 1e fa          	endbr64 
  80b664:	55                   	push   rbp
  80b665:	48 89 e5             	mov    rbp,rsp
  80b668:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b66c:	89 f0                	mov    eax,esi
  80b66e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80b671:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80b674:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b67b:	eb 16                	jmp    80b693 <memset+0x33>
        *(buf++)=value;
  80b67d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b681:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b685:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b689:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80b68d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80b68f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b693:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b696:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80b699:	72 e2                	jb     80b67d <memset+0x1d>
    }
}
  80b69b:	90                   	nop
  80b69c:	90                   	nop
  80b69d:	5d                   	pop    rbp
  80b69e:	c3                   	ret    

000000000080b69f <get_mem_size>:

u32 get_mem_size(){
  80b69f:	f3 0f 1e fa          	endbr64 
  80b6a3:	55                   	push   rbp
  80b6a4:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80b6a7:	8b 05 af ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eeaf]        # 42a55c <mem_end>
}
  80b6ad:	5d                   	pop    rbp
  80b6ae:	c3                   	ret    

000000000080b6af <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80b6af:	f3 0f 1e fa          	endbr64 
  80b6b3:	55                   	push   rbp
  80b6b4:	48 89 e5             	mov    rbp,rsp
  80b6b7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b6bb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80b6bf:	eb 1d                	jmp    80b6de <strcpy+0x2f>
        *(dest++)=*(buf++);
  80b6c1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80b6c5:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b6c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80b6cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6d1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b6d5:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b6d9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b6dc:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80b6de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6e5:	84 c0                	test   al,al
  80b6e7:	75 d8                	jne    80b6c1 <strcpy+0x12>
    }
    *dest='\0';
  80b6e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6ed:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80b6f0:	90                   	nop
  80b6f1:	5d                   	pop    rbp
  80b6f2:	c3                   	ret    

000000000080b6f3 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80b6f3:	f3 0f 1e fa          	endbr64 
  80b6f7:	55                   	push   rbp
  80b6f8:	48 89 e5             	mov    rbp,rsp
  80b6fb:	48 83 ec 30          	sub    rsp,0x30
  80b6ff:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b703:	89 f0                	mov    eax,esi
  80b705:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80b708:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80b70d:	0f 84 9c 00 00 00    	je     80b7af <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80b713:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b717:	48 89 c6             	mov    rsi,rax
  80b71a:	bf 80 a5 42 00       	mov    edi,0x42a580
  80b71f:	e8 8b ff ff ff       	call   80b6af <strcpy>
        char* ptr=strtokkee;
  80b724:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80b72b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80b72c:	c7 05 4a f0 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f04a],0x0        # 42a780 <tokptr>
  80b733:	00 00 00 
  80b736:	eb 1c                	jmp    80b754 <strtok+0x61>
  80b738:	8b 05 42 f0 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f042]        # 42a780 <tokptr>
  80b73e:	83 c0 01             	add    eax,0x1
  80b741:	99                   	cdq    
  80b742:	c1 ea 17             	shr    edx,0x17
  80b745:	01 d0                	add    eax,edx
  80b747:	25 ff 01 00 00       	and    eax,0x1ff
  80b74c:	29 d0                	sub    eax,edx
  80b74e:	89 05 2c f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f02c],eax        # 42a780 <tokptr>
  80b754:	8b 05 26 f0 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f026]        # 42a780 <tokptr>
  80b75a:	48 98                	cdqe   
  80b75c:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b763:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b766:	74 13                	je     80b77b <strtok+0x88>
  80b768:	8b 05 12 f0 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f012]        # 42a780 <tokptr>
  80b76e:	48 98                	cdqe   
  80b770:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b777:	84 c0                	test   al,al
  80b779:	75 bd                	jne    80b738 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80b77b:	8b 05 ff ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1efff]        # 42a780 <tokptr>
  80b781:	48 98                	cdqe   
  80b783:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80b78a:	8b 05 f0 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eff0]        # 42a780 <tokptr>
  80b790:	83 c0 01             	add    eax,0x1
  80b793:	99                   	cdq    
  80b794:	c1 ea 17             	shr    edx,0x17
  80b797:	01 d0                	add    eax,edx
  80b799:	25 ff 01 00 00       	and    eax,0x1ff
  80b79e:	29 d0                	sub    eax,edx
  80b7a0:	89 05 da ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1efda],eax        # 42a780 <tokptr>
        return ptr;
  80b7a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7aa:	e9 9e 00 00 00       	jmp    80b84d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80b7af:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80b7b6:	8b 05 c4 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1efc4]        # 42a780 <tokptr>
  80b7bc:	48 98                	cdqe   
  80b7be:	48 05 80 a5 42 00    	add    rax,0x42a580
  80b7c4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80b7c8:	eb 20                	jmp    80b7ea <strtok+0xf7>
  80b7ca:	8b 05 b0 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1efb0]        # 42a780 <tokptr>
  80b7d0:	83 c0 01             	add    eax,0x1
  80b7d3:	99                   	cdq    
  80b7d4:	c1 ea 17             	shr    edx,0x17
  80b7d7:	01 d0                	add    eax,edx
  80b7d9:	25 ff 01 00 00       	and    eax,0x1ff
  80b7de:	29 d0                	sub    eax,edx
  80b7e0:	89 05 9a ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef9a],eax        # 42a780 <tokptr>
  80b7e6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b7ea:	8b 05 90 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef90]        # 42a780 <tokptr>
  80b7f0:	48 98                	cdqe   
  80b7f2:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b7f9:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b7fc:	74 13                	je     80b811 <strtok+0x11e>
  80b7fe:	8b 05 7c ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef7c]        # 42a780 <tokptr>
  80b804:	48 98                	cdqe   
  80b806:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b80d:	84 c0                	test   al,al
  80b80f:	75 b9                	jne    80b7ca <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80b811:	8b 05 69 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef69]        # 42a780 <tokptr>
  80b817:	48 98                	cdqe   
  80b819:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80b820:	8b 05 5a ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef5a]        # 42a780 <tokptr>
  80b826:	83 c0 01             	add    eax,0x1
  80b829:	99                   	cdq    
  80b82a:	c1 ea 17             	shr    edx,0x17
  80b82d:	01 d0                	add    eax,edx
  80b82f:	25 ff 01 00 00       	and    eax,0x1ff
  80b834:	29 d0                	sub    eax,edx
  80b836:	89 05 44 ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef44],eax        # 42a780 <tokptr>
    if(c)
  80b83c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80b840:	74 06                	je     80b848 <strtok+0x155>
        return ptr;
  80b842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b846:	eb 05                	jmp    80b84d <strtok+0x15a>
    else
        return (void*)0;
  80b848:	b8 00 00 00 00       	mov    eax,0x0
}
  80b84d:	c9                   	leave  
  80b84e:	c3                   	ret    

000000000080b84f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80b84f:	f3 0f 1e fa          	endbr64 
  80b853:	55                   	push   rbp
  80b854:	48 89 e5             	mov    rbp,rsp
  80b857:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b85b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80b85f:	eb 3c                	jmp    80b89d <strcmp+0x4e>
		if(*s1>*s2)
  80b861:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b865:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b868:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b86c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b86f:	38 c2                	cmp    dl,al
  80b871:	7e 07                	jle    80b87a <strcmp+0x2b>
			return 1;
  80b873:	b8 01 00 00 00       	mov    eax,0x1
  80b878:	eb 52                	jmp    80b8cc <strcmp+0x7d>
		else if(*s1<*s2)
  80b87a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b87e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b881:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b885:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b888:	38 c2                	cmp    dl,al
  80b88a:	7d 07                	jge    80b893 <strcmp+0x44>
			return -1;
  80b88c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b891:	eb 39                	jmp    80b8cc <strcmp+0x7d>
		s1++;
  80b893:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80b898:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80b89d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8a4:	84 c0                	test   al,al
  80b8a6:	74 0b                	je     80b8b3 <strcmp+0x64>
  80b8a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b8ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8af:	84 c0                	test   al,al
  80b8b1:	75 ae                	jne    80b861 <strcmp+0x12>
	}
	if(*s1==*s2)
  80b8b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8b7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b8ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b8be:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8c1:	38 c2                	cmp    dl,al
  80b8c3:	75 07                	jne    80b8cc <strcmp+0x7d>
		return 0;
  80b8c5:	b8 00 00 00 00       	mov    eax,0x0
  80b8ca:	eb 00                	jmp    80b8cc <strcmp+0x7d>
}
  80b8cc:	5d                   	pop    rbp
  80b8cd:	c3                   	ret    

000000000080b8ce <strlen>:

int strlen(char *str)
{
  80b8ce:	f3 0f 1e fa          	endbr64 
  80b8d2:	55                   	push   rbp
  80b8d3:	48 89 e5             	mov    rbp,rsp
  80b8d6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80b8da:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80b8e1:	eb 09                	jmp    80b8ec <strlen+0x1e>
  80b8e3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80b8e8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b8ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b8f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8f3:	84 c0                	test   al,al
  80b8f5:	75 ec                	jne    80b8e3 <strlen+0x15>
    return l;
  80b8f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80b8fa:	5d                   	pop    rbp
  80b8fb:	c3                   	ret    

000000000080b8fc <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80b8fc:	f3 0f 1e fa          	endbr64 
  80b900:	55                   	push   rbp
  80b901:	48 89 e5             	mov    rbp,rsp
  80b904:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80b90b:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80b912:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80b919:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80b920:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80b927:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80b92e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80b935:	84 c0                	test   al,al
  80b937:	74 20                	je     80b959 <sprintf+0x5d>
  80b939:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80b93d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80b941:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80b945:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80b949:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80b94d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80b951:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80b955:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80b959:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80b960:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80b967:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80b96e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80b975:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80b97c:	00 00 00 
    while (*pstr!='\n')
  80b97f:	eb 39                	jmp    80b9ba <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80b981:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80b988:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b98b:	3c 25                	cmp    al,0x25
  80b98d:	75 15                	jne    80b9a4 <sprintf+0xa8>
  80b98f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80b996:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b999:	3c 25                	cmp    al,0x25
  80b99b:	74 07                	je     80b9a4 <sprintf+0xa8>
            argnum++;
  80b99d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80b9a4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80b9ab:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80b9b2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80b9b9:	01 
    while (*pstr!='\n')
  80b9ba:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80b9c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9c4:	3c 0a                	cmp    al,0xa
  80b9c6:	75 b9                	jne    80b981 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80b9c8:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80b9cf:	00 00 00 
  80b9d2:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80b9d9:	00 00 00 
  80b9dc:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80b9e0:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80b9e7:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80b9ee:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80b9f5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80b9fc:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80ba03:	e9 e2 01 00 00       	jmp    80bbea <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80ba08:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba12:	3c 25                	cmp    al,0x25
  80ba14:	0f 85 aa 01 00 00    	jne    80bbc4 <sprintf+0x2c8>
  80ba1a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba21:	48 83 c0 01          	add    rax,0x1
  80ba25:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba28:	84 c0                	test   al,al
  80ba2a:	0f 84 94 01 00 00    	je     80bbc4 <sprintf+0x2c8>
            pstr++;
  80ba30:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ba37:	01 
            if(*pstr=='x'){
  80ba38:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba3f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba42:	3c 78                	cmp    al,0x78
  80ba44:	75 64                	jne    80baaa <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80ba46:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ba4c:	83 f8 2f             	cmp    eax,0x2f
  80ba4f:	77 23                	ja     80ba74 <sprintf+0x178>
  80ba51:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ba58:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ba5e:	89 d2                	mov    edx,edx
  80ba60:	48 01 d0             	add    rax,rdx
  80ba63:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ba69:	83 c2 08             	add    edx,0x8
  80ba6c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ba72:	eb 12                	jmp    80ba86 <sprintf+0x18a>
  80ba74:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80ba7b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80ba7f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80ba86:	8b 00                	mov    eax,DWORD PTR [rax]
  80ba88:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80ba8e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80ba94:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ba9b:	89 d6                	mov    esi,edx
  80ba9d:	48 89 c7             	mov    rdi,rax
  80baa0:	e8 4e 02 00 00       	call   80bcf3 <sprint_hex>
            if(*pstr=='x'){
  80baa5:	e9 38 01 00 00       	jmp    80bbe2 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80baaa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bab1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bab4:	3c 73                	cmp    al,0x73
  80bab6:	75 68                	jne    80bb20 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80bab8:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80babe:	83 f8 2f             	cmp    eax,0x2f
  80bac1:	77 23                	ja     80bae6 <sprintf+0x1ea>
  80bac3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80baca:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bad0:	89 d2                	mov    edx,edx
  80bad2:	48 01 d0             	add    rax,rdx
  80bad5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80badb:	83 c2 08             	add    edx,0x8
  80bade:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bae4:	eb 12                	jmp    80baf8 <sprintf+0x1fc>
  80bae6:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80baed:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80baf1:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80baf8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bafb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80bb02:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80bb09:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bb10:	48 89 d6             	mov    rsi,rdx
  80bb13:	48 89 c7             	mov    rdi,rax
  80bb16:	e8 5a 02 00 00       	call   80bd75 <sprintn>
            if(*pstr=='x'){
  80bb1b:	e9 c2 00 00 00       	jmp    80bbe2 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80bb20:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bb27:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb2a:	3c 64                	cmp    al,0x64
  80bb2c:	75 66                	jne    80bb94 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80bb2e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bb34:	83 f8 2f             	cmp    eax,0x2f
  80bb37:	77 23                	ja     80bb5c <sprintf+0x260>
  80bb39:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bb40:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb46:	89 d2                	mov    edx,edx
  80bb48:	48 01 d0             	add    rax,rdx
  80bb4b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb51:	83 c2 08             	add    edx,0x8
  80bb54:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bb5a:	eb 12                	jmp    80bb6e <sprintf+0x272>
  80bb5c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bb63:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bb67:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bb6e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bb71:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80bb78:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80bb7f:	89 c2                	mov    edx,eax
  80bb81:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bb88:	89 d6                	mov    esi,edx
  80bb8a:	48 89 c7             	mov    rdi,rax
  80bb8d:	e8 ad 00 00 00       	call   80bc3f <sprint_decimal>
            if(*pstr=='x'){
  80bb92:	eb 4e                	jmp    80bbe2 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80bb94:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bb9b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb9e:	3c 63                	cmp    al,0x63
  80bba0:	75 02                	jne    80bba4 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80bba2:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80bba4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bbab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbae:	0f be d0             	movsx  edx,al
  80bbb1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bbb8:	89 d6                	mov    esi,edx
  80bbba:	48 89 c7             	mov    rdi,rax
  80bbbd:	e8 3e 00 00 00       	call   80bc00 <sprintchar>
            if(*pstr=='x'){
  80bbc2:	eb 1e                	jmp    80bbe2 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80bbc4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bbcb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbce:	0f be d0             	movsx  edx,al
  80bbd1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bbd8:	89 d6                	mov    esi,edx
  80bbda:	48 89 c7             	mov    rdi,rax
  80bbdd:	e8 1e 00 00 00       	call   80bc00 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80bbe2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bbe9:	01 
  80bbea:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bbf1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbf4:	84 c0                	test   al,al
  80bbf6:	0f 85 0c fe ff ff    	jne    80ba08 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80bbfc:	90                   	nop
  80bbfd:	90                   	nop
  80bbfe:	c9                   	leave  
  80bbff:	c3                   	ret    

000000000080bc00 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80bc00:	f3 0f 1e fa          	endbr64 
  80bc04:	55                   	push   rbp
  80bc05:	48 89 e5             	mov    rbp,rsp
  80bc08:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bc0c:	89 f0                	mov    eax,esi
  80bc0e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80bc11:	eb 05                	jmp    80bc18 <sprintchar+0x18>
        dist++;
  80bc13:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80bc18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc1f:	84 c0                	test   al,al
  80bc21:	75 f0                	jne    80bc13 <sprintchar+0x13>
    *dist++=c;
  80bc23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc27:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bc2b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80bc2f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80bc33:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80bc35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc39:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bc3c:	90                   	nop
  80bc3d:	5d                   	pop    rbp
  80bc3e:	c3                   	ret    

000000000080bc3f <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80bc3f:	f3 0f 1e fa          	endbr64 
  80bc43:	55                   	push   rbp
  80bc44:	48 89 e5             	mov    rbp,rsp
  80bc47:	48 83 ec 30          	sub    rsp,0x30
  80bc4b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bc4f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80bc52:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80bc59:	eb 65                	jmp    80bcc0 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80bc5b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80bc5e:	48 63 c2             	movsxd rax,edx
  80bc61:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80bc68:	48 c1 e8 20          	shr    rax,0x20
  80bc6c:	c1 f8 02             	sar    eax,0x2
  80bc6f:	89 d6                	mov    esi,edx
  80bc71:	c1 fe 1f             	sar    esi,0x1f
  80bc74:	29 f0                	sub    eax,esi
  80bc76:	89 c1                	mov    ecx,eax
  80bc78:	89 c8                	mov    eax,ecx
  80bc7a:	c1 e0 02             	shl    eax,0x2
  80bc7d:	01 c8                	add    eax,ecx
  80bc7f:	01 c0                	add    eax,eax
  80bc81:	89 d1                	mov    ecx,edx
  80bc83:	29 c1                	sub    ecx,eax
  80bc85:	89 c8                	mov    eax,ecx
  80bc87:	83 c0 30             	add    eax,0x30
  80bc8a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80bc8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bc90:	8d 50 01             	lea    edx,[rax+0x1]
  80bc93:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bc96:	48 98                	cdqe   
  80bc98:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bc9c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80bca0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80bca3:	48 63 d0             	movsxd rdx,eax
  80bca6:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80bcad:	48 c1 ea 20          	shr    rdx,0x20
  80bcb1:	c1 fa 02             	sar    edx,0x2
  80bcb4:	c1 f8 1f             	sar    eax,0x1f
  80bcb7:	89 c1                	mov    ecx,eax
  80bcb9:	89 d0                	mov    eax,edx
  80bcbb:	29 c8                	sub    eax,ecx
  80bcbd:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80bcc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bcc3:	83 f8 0f             	cmp    eax,0xf
  80bcc6:	76 93                	jbe    80bc5b <sprint_decimal+0x1c>
    }
    while(p>0)
  80bcc8:	eb 1f                	jmp    80bce9 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80bcca:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bcce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bcd1:	48 98                	cdqe   
  80bcd3:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80bcd8:	0f be d0             	movsx  edx,al
  80bcdb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bcdf:	89 d6                	mov    esi,edx
  80bce1:	48 89 c7             	mov    rdi,rax
  80bce4:	e8 17 ff ff ff       	call   80bc00 <sprintchar>
    while(p>0)
  80bce9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bced:	7f db                	jg     80bcca <sprint_decimal+0x8b>
    }
}
  80bcef:	90                   	nop
  80bcf0:	90                   	nop
  80bcf1:	c9                   	leave  
  80bcf2:	c3                   	ret    

000000000080bcf3 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80bcf3:	f3 0f 1e fa          	endbr64 
  80bcf7:	55                   	push   rbp
  80bcf8:	48 89 e5             	mov    rbp,rsp
  80bcfb:	48 83 ec 20          	sub    rsp,0x20
  80bcff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bd03:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80bd06:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80bd0d:	eb 35                	jmp    80bd44 <sprint_hex+0x51>
        unsigned char a=c%16;
  80bd0f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bd12:	83 e0 0f             	and    eax,0xf
  80bd15:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80bd18:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80bd1c:	76 06                	jbe    80bd24 <sprint_hex+0x31>
  80bd1e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80bd22:	eb 04                	jmp    80bd28 <sprint_hex+0x35>
        else a+='0';
  80bd24:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80bd28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd2b:	8d 50 01             	lea    edx,[rax+0x1]
  80bd2e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bd31:	48 98                	cdqe   
  80bd33:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bd37:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80bd3b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bd3e:	c1 e8 04             	shr    eax,0x4
  80bd41:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80bd44:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80bd48:	7e c5                	jle    80bd0f <sprint_hex+0x1c>
    }
    while(p>0)
  80bd4a:	eb 1f                	jmp    80bd6b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80bd4c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bd50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd53:	48 98                	cdqe   
  80bd55:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80bd5a:	0f be d0             	movsx  edx,al
  80bd5d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bd61:	89 d6                	mov    esi,edx
  80bd63:	48 89 c7             	mov    rdi,rax
  80bd66:	e8 95 fe ff ff       	call   80bc00 <sprintchar>
    while(p>0)
  80bd6b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bd6f:	7f db                	jg     80bd4c <sprint_hex+0x59>
    }
}
  80bd71:	90                   	nop
  80bd72:	90                   	nop
  80bd73:	c9                   	leave  
  80bd74:	c3                   	ret    

000000000080bd75 <sprintn>:
void sprintn(char *dist,char *str)
{
  80bd75:	f3 0f 1e fa          	endbr64 
  80bd79:	55                   	push   rbp
  80bd7a:	48 89 e5             	mov    rbp,rsp
  80bd7d:	48 83 ec 10          	sub    rsp,0x10
  80bd81:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bd85:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80bd89:	eb 20                	jmp    80bdab <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80bd8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd8f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bd93:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80bd97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd9a:	0f be d0             	movsx  edx,al
  80bd9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bda1:	89 d6                	mov    esi,edx
  80bda3:	48 89 c7             	mov    rdi,rax
  80bda6:	e8 55 fe ff ff       	call   80bc00 <sprintchar>
    while(*str!='\0')
  80bdab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bdaf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdb2:	84 c0                	test   al,al
  80bdb4:	75 d5                	jne    80bd8b <sprintn+0x16>
    }
  80bdb6:	90                   	nop
  80bdb7:	90                   	nop
  80bdb8:	c9                   	leave  
  80bdb9:	c3                   	ret    
  80bdba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080bdc0 <create_zero>:
  80bdc0:	e8 b9 7a ff ff       	call   80387e <req_proc>
  80bdc5:	83 f8 ff             	cmp    eax,0xffffffff
  80bdc8:	74 0c                	je     80bdd6 <create_zero.retu>
  80bdca:	e8 a8 7b ff ff       	call   803977 <set_proc>
  80bdcf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80bdd3:	83 c4 40             	add    esp,0x40

000000000080bdd6 <create_zero.retu>:
  80bdd6:	c3                   	ret    

000000000080bdd7 <fill_desc>:
  80bdd7:	55                   	push   rbp
  80bdd8:	48 89 e5             	mov    rbp,rsp
  80bddb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80bddf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80bde3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80bde7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80bdeb:	be 2a bf 80 00       	mov    esi,0x80bf2a
  80bdf0:	c7 04 25 2a bf 80 00 	mov    DWORD PTR ds:0x80bf2a,0x0
  80bdf7:	00 00 00 00 
  80bdfb:	c7 04 25 2e bf 80 00 	mov    DWORD PTR ds:0x80bf2e,0x0
  80be02:	00 00 00 00 
  80be06:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80be0a:	c1 e9 10             	shr    ecx,0x10
  80be0d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80be12:	c1 ea 10             	shr    edx,0x10
  80be15:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80be19:	66 c1 ea 08          	shr    dx,0x8
  80be1d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80be21:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80be26:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80be2a:	c1 e1 08             	shl    ecx,0x8
  80be2d:	09 cf                	or     edi,ecx
  80be2f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80be33:	8b 14 25 2a bf 80 00 	mov    edx,DWORD PTR ds:0x80bf2a
  80be3a:	67 89 10             	mov    DWORD PTR [eax],edx
  80be3d:	8b 14 25 2e bf 80 00 	mov    edx,DWORD PTR ds:0x80bf2e
  80be44:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80be48:	c9                   	leave  
  80be49:	c3                   	ret    

000000000080be4a <switch_proc_asm>:
  80be4a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80be50:	66 89 04 25 68 be 80 	mov    WORD PTR ds:0x80be68,ax
  80be57:	00 
  80be58:	c7 04 25 64 be 80 00 	mov    DWORD PTR ds:0x80be64,0x0
  80be5f:	00 00 00 00 

000000000080be63 <switch_proc_asm.ljmp>:
  80be63:	ea                   	(bad)  
  80be64:	00 00                	add    BYTE PTR [rax],al
  80be66:	00 00                	add    BYTE PTR [rax],al
  80be68:	00 00                	add    BYTE PTR [rax],al
  80be6a:	c3                   	ret    

000000000080be6b <switch_to_old>:
  80be6b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80be70:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80be74:	bf dc be 80 00       	mov    edi,0x80bedc
  80be79:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80be7d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80be81:	89 c1                	mov    ecx,eax
  80be83:	83 e9 04             	sub    ecx,0x4
  80be86:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80be89:	50                   	push   rax
  80be8a:	89 f5                	mov    ebp,esi
  80be8c:	83 c5 28             	add    ebp,0x28
  80be8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80be93:	50                   	push   rax
  80be94:	83 c5 04             	add    ebp,0x4
  80be97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80be9b:	50                   	push   rax
  80be9c:	83 c5 04             	add    ebp,0x4
  80be9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bea3:	50                   	push   rax
  80bea4:	83 c5 04             	add    ebp,0x4
  80bea7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80beab:	50                   	push   rax
  80beac:	83 c5 04             	add    ebp,0x4
  80beaf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80beb3:	50                   	push   rax
  80beb4:	83 c5 04             	add    ebp,0x4
  80beb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bebb:	50                   	push   rax
  80bebc:	83 c5 04             	add    ebp,0x4
  80bebf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bec3:	50                   	push   rax
  80bec4:	83 c5 04             	add    ebp,0x4
  80bec7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80becb:	50                   	push   rax
  80becc:	83 c5 04             	add    ebp,0x4
  80becf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80bed3:	0f 22 d8             	mov    cr3,rax
  80bed6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80beda:	50                   	push   rax
  80bedb:	5c                   	pop    rsp

000000000080bedc <switch_to_old.leap>:
  80bedc:	ea                   	(bad)  
  80bedd:	00 00                	add    BYTE PTR [rax],al
  80bedf:	00 00                	add    BYTE PTR [rax],al
  80bee1:	08 00                	or     BYTE PTR [rax],al

000000000080bee3 <save_context>:
  80bee3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80bee8:	83 c0 44             	add    eax,0x44
  80beeb:	b9 08 00 00 00       	mov    ecx,0x8
  80bef0:	89 e7                	mov    edi,esp

000000000080bef2 <save_context.loops>:
  80bef2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80bef5:	67 89 10             	mov    DWORD PTR [eax],edx
  80bef8:	83 c7 04             	add    edi,0x4
  80befb:	83 e8 04             	sub    eax,0x4
  80befe:	e2 f2                	loop   80bef2 <save_context.loops>
  80bf00:	5b                   	pop    rbx
  80bf01:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80bf06:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80bf0a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80bf0f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80bf13:	c3                   	ret    

000000000080bf14 <move_to_user_mode>:
  80bf14:	66 b8 20 00          	mov    ax,0x20
  80bf18:	8e d8                	mov    ds,eax
  80bf1a:	8e c0                	mov    es,eax
  80bf1c:	8e e8                	mov    gs,eax
  80bf1e:	6a 20                	push   0x20
  80bf20:	54                   	push   rsp
  80bf21:	6a 18                	push   0x18
  80bf23:	68 29 bf 80 00       	push   0x80bf29
  80bf28:	cf                   	iret   

000000000080bf29 <move_to_user_mode.done>:
  80bf29:	c3                   	ret    

000000000080bf2a <desc>:
	...

000000000080bf32 <ret_sys_call>:
  80bf32:	58                   	pop    rax
  80bf33:	8e d8                	mov    ds,eax
  80bf35:	58                   	pop    rax
  80bf36:	8e c0                	mov    es,eax
  80bf38:	41 5f                	pop    r15
  80bf3a:	41 5e                	pop    r14
  80bf3c:	41 5d                	pop    r13
  80bf3e:	41 5c                	pop    r12
  80bf40:	41 5b                	pop    r11
  80bf42:	41 5a                	pop    r10
  80bf44:	41 59                	pop    r9
  80bf46:	41 58                	pop    r8
  80bf48:	5e                   	pop    rsi
  80bf49:	5f                   	pop    rdi
  80bf4a:	5a                   	pop    rdx
  80bf4b:	59                   	pop    rcx
  80bf4c:	5b                   	pop    rbx
  80bf4d:	58                   	pop    rax

000000000080bf4e <tmp>:
  80bf4e:	48 0f 07             	sysretq 

000000000080bf51 <ret_normal_proc>:
  80bf51:	58                   	pop    rax
  80bf52:	8e d8                	mov    ds,eax
  80bf54:	58                   	pop    rax
  80bf55:	8e c0                	mov    es,eax
  80bf57:	41 5f                	pop    r15
  80bf59:	41 5e                	pop    r14
  80bf5b:	41 5d                	pop    r13
  80bf5d:	41 5c                	pop    r12
  80bf5f:	41 5b                	pop    r11
  80bf61:	41 5a                	pop    r10
  80bf63:	41 59                	pop    r9
  80bf65:	41 58                	pop    r8
  80bf67:	5e                   	pop    rsi
  80bf68:	5f                   	pop    rdi
  80bf69:	5a                   	pop    rdx
  80bf6a:	59                   	pop    rcx
  80bf6b:	5b                   	pop    rbx
  80bf6c:	58                   	pop    rax
  80bf6d:	c3                   	ret    
