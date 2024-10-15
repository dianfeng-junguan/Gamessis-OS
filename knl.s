
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
  800217:	b8 4a 78 80 00       	mov    eax,0x80784a
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 70 59 80 00       	mov    eax,0x805970
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 70 87 80 00       	mov    eax,0x808770
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 80 63 80 00       	mov    eax,0x806380
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
  800291:	e8 4a 54 00 00       	call   8056e0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 3b 54 00 00       	call   8056e0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 2c 54 00 00       	call   8056e0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 1d 54 00 00       	call   8056e0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 0e 54 00 00       	call   8056e0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 ff 53 00 00       	call   8056e0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 f0 53 00 00       	call   8056e0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 e1 53 00 00       	call   8056e0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 11 54 00 00       	call   80571a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 80 63 80 00       	mov    eax,0x806380
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
  800350:	48 8b 15 c9 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbcc9]        # 80c020 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d a5 bc 00 00 	mov    rcx,QWORD PTR [rip+0xbca5]        # 80c020 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 85 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc85]        # 80c020 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 6d bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc6d]        # 80c020 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 50 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc50]        # 80c020 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 36 bc 00 00 	mov    rdx,QWORD PTR [rip+0xbc36]        # 80c020 <idt>
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
  80040d:	e8 fc 52 00 00       	call   80570e <eoi>
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
  800427:	e8 e2 52 00 00       	call   80570e <eoi>
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
  800441:	e8 c8 52 00 00       	call   80570e <eoi>
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
  80045b:	e8 ae 52 00 00       	call   80570e <eoi>
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
  800475:	e8 94 52 00 00       	call   80570e <eoi>
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
  80048f:	e8 7a 52 00 00       	call   80570e <eoi>
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
  8004a8:	e8 61 52 00 00       	call   80570e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 82 52 00 00       	call   805739 <report_back_trace_of_err>
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
  8004cd:	e8 3c 52 00 00       	call   80570e <eoi>
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
  8004e7:	e8 22 52 00 00       	call   80570e <eoi>
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
  800500:	e8 09 52 00 00       	call   80570e <eoi>
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
  800519:	e8 f0 51 00 00       	call   80570e <eoi>
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
  800533:	e8 d6 51 00 00       	call   80570e <eoi>
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
  80054d:	e8 bc 51 00 00       	call   80570e <eoi>
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
  800571:	e8 98 51 00 00       	call   80570e <eoi>
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
  80058e:	e8 7b 51 00 00       	call   80570e <eoi>
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
  8005d1:	48 05 60 37 81 00    	add    rax,0x813760
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
  800682:	e8 b7 3d 00 00       	call   80443e <reg_proc>
  800687:	e9 76 01 00 00       	jmp    800802 <syscall+0x268>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 73 3b 00 00       	call   804209 <del_proc>
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
  8006b5:	e8 a6 67 00 00       	call   806e60 <sys_open>
  8006ba:	e9 43 01 00 00       	jmp    800802 <syscall+0x268>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 ae 6a 00 00       	call   807177 <sys_close>
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
  8006e4:	e8 46 6b 00 00       	call   80722f <sys_read>
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
  800704:	e8 d6 6b 00 00       	call   8072df <sys_write>
  800709:	e9 f4 00 00 00       	jmp    800802 <syscall+0x268>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 6b 6c 00 00       	call   80738f <sys_lseek>
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
  800775:	e8 4a 52 00 00       	call   8059c4 <sys_execve>
  80077a:	e9 83 00 00 00       	jmp    800802 <syscall+0x268>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 8d 3c 00 00       	call   804416 <sys_exit>
  800789:	eb 77                	jmp    800802 <syscall+0x268>
        case SYSCALL_CALL:return exec_call(a);
  80078b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80078e:	48 98                	cdqe   
  800790:	48 89 c7             	mov    rdi,rax
  800793:	e8 2e 53 00 00       	call   805ac6 <exec_call>
  800798:	eb 68                	jmp    800802 <syscall+0x268>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  80079a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80079d:	89 c7                	mov    edi,eax
  80079f:	e8 b3 13 00 00       	call   801b57 <sys_mkfifo>
  8007a4:	eb 5c                	jmp    800802 <syscall+0x268>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a9:	89 c7                	mov    edi,eax
  8007ab:	e8 93 3e 00 00       	call   804643 <sys_malloc>
  8007b0:	eb 50                	jmp    800802 <syscall+0x268>
        case SYSCALL_FREE:return sys_free(a);
  8007b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b5:	89 c7                	mov    edi,eax
  8007b7:	e8 2e 40 00 00       	call   8047ea <sys_free>
  8007bc:	eb 44                	jmp    800802 <syscall+0x268>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007be:	b8 00 00 00 00       	mov    eax,0x0
  8007c3:	e8 96 71 00 00       	call   80795e <sys_getkbc>
  8007c8:	0f be c0             	movsx  eax,al
  8007cb:	eb 35                	jmp    800802 <syscall+0x268>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d0:	48 98                	cdqe   
  8007d2:	48 89 c7             	mov    rdi,rax
  8007d5:	e8 da 21 00 00       	call   8029b4 <sys_find_dev>
  8007da:	eb 26                	jmp    800802 <syscall+0x268>
        case SYSCALL_FORK:return sys_fork();
  8007dc:	e8 1d 43 00 00       	call   804afe <sys_fork>
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
  800887:	48 8b 04 c5 c8 3a 81 	mov    rax,QWORD PTR [rax*8+0x813ac8]
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
  80092b:	e8 5b 5c 00 00       	call   80658b <set_framebuffer>
  800930:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800934:	b8 00 00 00 00       	mov    eax,0x0
  800939:	e8 b8 5a 00 00       	call   8063f6 <init_framebuffer>
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
  800b02:	e8 ae 59 00 00       	call   8064b5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b07:	bf 88 3a 81 00       	mov    edi,0x813a88
  800b0c:	e8 3d 5e 00 00       	call   80694e <print>
    init_int();
  800b11:	b8 00 00 00 00       	mov    eax,0x0
  800b16:	e8 e5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b1b:	bf a5 3a 81 00       	mov    edi,0x813aa5
  800b20:	e8 29 5e 00 00       	call   80694e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b25:	b8 00 00 00 00       	mov    eax,0x0
  800b2a:	e8 c5 09 00 00       	call   8014f4 <init_memory>
    init_com(PORT_COM1);
  800b2f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b34:	e8 8b a9 00 00       	call   80b4c4 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b39:	be f8 03 00 00       	mov    esi,0x3f8
  800b3e:	bf b2 3a 81 00       	mov    edi,0x813ab2
  800b43:	e8 c8 aa 00 00       	call   80b610 <com_puts>
	init_paging();
  800b48:	b8 00 00 00 00       	mov    eax,0x0
  800b4d:	e8 aa 06 00 00       	call   8011fc <init_paging>
 	init_gdt();
  800b52:	b8 00 00 00 00       	mov    eax,0x0
  800b57:	e8 01 4c 00 00       	call   80575d <init_gdt>
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
  800b75:	e8 b1 6c 00 00       	call   80782b <init_kb>
//    init_disk();

    sti();
  800b7a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b7b:	b8 00 00 00 00       	mov    eax,0x0
  800b80:	e8 a5 9f 00 00       	call   80ab2a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b85:	c7 05 99 b4 00 00 00 	mov    DWORD PTR [rip+0xb499],0x0        # 80c028 <manage_proc_lock>
  800b8c:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c=sys_getkbc();
  800b8f:	b8 00 00 00 00       	mov    eax,0x0
  800b94:	e8 c5 6d 00 00       	call   80795e <sys_getkbc>
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
  800d11:	e8 38 5c 00 00       	call   80694e <print>
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
  800e5b:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813b10
  800e62:	10 3b 81 00 
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
  800efc:	48 8b 15 3d b1 00 00 	mov    rdx,QWORD PTR [rip+0xb13d]        # 80c040 <pml4>
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
  800f76:	e8 85 a7 00 00       	call   80b700 <memset>
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
  800ff4:	e8 07 a7 00 00       	call   80b700 <memset>
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
  8010f0:	e8 0b a6 00 00       	call   80b700 <memset>
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
  80116e:	e8 8d a5 00 00       	call   80b700 <memset>
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
  801215:	89 05 3d ae 00 00    	mov    DWORD PTR [rip+0xae3d],eax        # 80c058 <high_mem_base>
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
  8013af:	bf 18 3b 81 00       	mov    edi,0x813b18
  8013b4:	e8 95 55 00 00       	call   80694e <print>
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
  801439:	bf 22 3b 81 00       	mov    edi,0x813b22
  80143e:	e8 0b 55 00 00       	call   80694e <print>
  801443:	eb 0a                	jmp    80144f <page_err+0xb0>
    p=err_code&4;
  801445:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801449:	83 e0 04             	and    eax,0x4
  80144c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80144f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801453:	75 0c                	jne    801461 <page_err+0xc2>
  801455:	bf 30 3b 81 00       	mov    edi,0x813b30
  80145a:	e8 ef 54 00 00       	call   80694e <print>
  80145f:	eb 0a                	jmp    80146b <page_err+0xcc>
    p=err_code&16;
  801461:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801465:	83 e0 10             	and    eax,0x10
  801468:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80146b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80146f:	74 0a                	je     80147b <page_err+0xdc>
  801471:	bf 48 3b 81 00       	mov    edi,0x813b48
  801476:	e8 d3 54 00 00       	call   80694e <print>
    unsigned int addr=0;
  80147b:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801482:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801485:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801488:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80148c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80148f:	89 c6                	mov    esi,eax
  801491:	bf 68 3b 81 00       	mov    edi,0x813b68
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
  8014c7:	bf 8a 3b 81 00       	mov    edi,0x813b8a
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
  8014dd:	e8 2c 42 00 00       	call   80570e <eoi>
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
  801dbe:	e8 8c 99 00 00       	call   80b74f <strcpy>
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
  801ff0:	e8 5c 96 00 00       	call   80b651 <memcpy>
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
  80208f:	e8 bd 95 00 00       	call   80b651 <memcpy>
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
  80237c:	e8 58 58 00 00       	call   807bd9 <request>
  802381:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802384:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802387:	89 c7                	mov    edi,eax
  802389:	e8 ff 5e 00 00       	call   80828d <chk_result>

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
  802459:	e8 f3 91 00 00       	call   80b651 <memcpy>
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
  8024d6:	e8 76 91 00 00       	call   80b651 <memcpy>
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
  802a27:	e8 c3 8e 00 00       	call   80b8ef <strcmp>
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
  802ac0:	e8 2a 8e 00 00       	call   80b8ef <strcmp>
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
  802af3:	48 8b 04 c5 a8 3b 81 	mov    rax,QWORD PTR [rax*8+0x813ba8]
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
  802dd1:	48 8b 04 c5 08 3c 81 	mov    rax,QWORD PTR [rax*8+0x813c08]
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
  8033a9:	48 8b 14 c5 60 c0 80 	mov    rdx,QWORD PTR [rax*8+0x80c060]
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
  803562:	e8 cf 14 00 00       	call   804a36 <set_tss>
  803567:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  80356b:	48 8b 05 0e 8b 00 00 	mov    rax,QWORD PTR [rip+0x8b0e]        # 80c080 <tss>
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
  8035fc:	ba d2 bf 80 00       	mov    edx,0x80bfd2
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
  803b1b:	bf 68 3c 81 00       	mov    edi,0x813c68
  803b20:	b8 00 00 00 00       	mov    eax,0x0
  803b25:	e8 ee d1 ff ff       	call   800d18 <printf>
  803b2a:	eb 17                	jmp    803b43 <proc_zero+0x51>
    }else{
        printf("child proc ret:%d\n",cur_proc);
  803b2c:	8b 05 fa 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109fa]        # 41452c <cur_proc>
  803b32:	89 c6                	mov    esi,eax
  803b34:	bf 7c 3c 81 00       	mov    edi,0x813c7c
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
  803c0c:	0f 84 21 01 00 00    	je     803d33 <manage_proc+0x1c6>
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
        int i=0;
  803c3f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803c46:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803c4d:	eb 4f                	jmp    803c9e <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803c4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c52:	48 63 d0             	movsxd rdx,eax
  803c55:	48 89 d0             	mov    rax,rdx
  803c58:	48 01 c0             	add    rax,rax
  803c5b:	48 01 d0             	add    rax,rdx
  803c5e:	48 c1 e0 08          	shl    rax,0x8
  803c62:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c68:	8b 00                	mov    eax,DWORD PTR [rax]
  803c6a:	83 f8 ff             	cmp    eax,0xffffffff
  803c6d:	74 2b                	je     803c9a <manage_proc+0x12d>
  803c6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c72:	48 63 d0             	movsxd rdx,eax
  803c75:	48 89 d0             	mov    rax,rdx
  803c78:	48 01 c0             	add    rax,rax
  803c7b:	48 01 d0             	add    rax,rdx
  803c7e:	48 c1 e0 08          	shl    rax,0x8
  803c82:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c88:	8b 00                	mov    eax,DWORD PTR [rax]
  803c8a:	83 f8 01             	cmp    eax,0x1
  803c8d:	75 0b                	jne    803c9a <manage_proc+0x12d>
  803c8f:	8b 05 97 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10897]        # 41452c <cur_proc>
  803c95:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803c98:	75 0c                	jne    803ca6 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803c9a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803c9e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803ca2:	7e ab                	jle    803c4f <manage_proc+0xe2>
  803ca4:	eb 01                	jmp    803ca7 <manage_proc+0x13a>
                break;
  803ca6:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803ca7:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803cab:	0f 8f 85 00 00 00    	jg     803d36 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  803cb1:	8b 05 75 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10875]        # 41452c <cur_proc>
  803cb7:	48 63 d0             	movsxd rdx,eax
  803cba:	48 89 d0             	mov    rax,rdx
  803cbd:	48 01 c0             	add    rax,rax
  803cc0:	48 01 d0             	add    rax,rdx
  803cc3:	48 c1 e0 08          	shl    rax,0x8
  803cc7:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ccd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803cd3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cd6:	48 63 d0             	movsxd rdx,eax
  803cd9:	48 89 d0             	mov    rax,rdx
  803cdc:	48 01 c0             	add    rax,rax
  803cdf:	48 01 d0             	add    rax,rdx
  803ce2:	48 c1 e0 08          	shl    rax,0x8
  803ce6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803cec:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803cf2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cf5:	48 63 d0             	movsxd rdx,eax
  803cf8:	48 89 d0             	mov    rax,rdx
  803cfb:	48 01 c0             	add    rax,rax
  803cfe:	48 01 d0             	add    rax,rdx
  803d01:	48 c1 e0 08          	shl    rax,0x8
  803d05:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d0c:	8b 05 1a 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1081a]        # 41452c <cur_proc>
  803d12:	48 63 c8             	movsxd rcx,eax
  803d15:	48 89 c8             	mov    rax,rcx
  803d18:	48 01 c0             	add    rax,rax
  803d1b:	48 01 c8             	add    rax,rcx
  803d1e:	48 c1 e0 08          	shl    rax,0x8
  803d22:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d28:	48 89 d6             	mov    rsi,rdx
  803d2b:	48 89 c7             	mov    rdi,rax
  803d2e:	e8 6e 0b 00 00       	call   8048a1 <switch_to>
    }
    return;
  803d33:	90                   	nop
  803d34:	eb 01                	jmp    803d37 <manage_proc+0x1ca>
            return;
  803d36:	90                   	nop
}
  803d37:	c9                   	leave  
  803d38:	c3                   	ret    

0000000000803d39 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d39:	f3 0f 1e fa          	endbr64 
  803d3d:	55                   	push   rbp
  803d3e:	48 89 e5             	mov    rbp,rsp
  803d41:	48 83 ec 20          	sub    rsp,0x20
  803d45:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803d48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d4b:	01 c0                	add    eax,eax
  803d4d:	83 c0 05             	add    eax,0x5
  803d50:	c1 e0 03             	shl    eax,0x3
  803d53:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803d56:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d59:	89 05 cd 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107cd],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803d5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d62:	89 c7                	mov    edi,eax
  803d64:	e8 81 81 00 00       	call   80beea <switch_proc_asm>
}
  803d69:	90                   	nop
  803d6a:	c9                   	leave  
  803d6b:	c3                   	ret    

0000000000803d6c <switch_proc>:
void switch_proc(int pnr){
  803d6c:	f3 0f 1e fa          	endbr64 
  803d70:	55                   	push   rbp
  803d71:	48 89 e5             	mov    rbp,rsp
  803d74:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803d7b:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803d81:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803d87:	48 63 d0             	movsxd rdx,eax
  803d8a:	48 89 d0             	mov    rax,rdx
  803d8d:	48 01 c0             	add    rax,rax
  803d90:	48 01 d0             	add    rax,rdx
  803d93:	48 c1 e0 08          	shl    rax,0x8
  803d97:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d9e:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803da5:	48 89 d6             	mov    rsi,rdx
  803da8:	ba 60 00 00 00       	mov    edx,0x60
  803dad:	48 89 c7             	mov    rdi,rax
  803db0:	48 89 d1             	mov    rcx,rdx
  803db3:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803db6:	8b 05 70 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10770]        # 41452c <cur_proc>
  803dbc:	48 63 d0             	movsxd rdx,eax
  803dbf:	48 89 d0             	mov    rax,rdx
  803dc2:	48 01 c0             	add    rax,rax
  803dc5:	48 01 d0             	add    rax,rdx
  803dc8:	48 c1 e0 08          	shl    rax,0x8
  803dcc:	48 05 c0 01 00 00    	add    rax,0x1c0
  803dd2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803dd8:	48 83 c0 04          	add    rax,0x4
  803ddc:	48 89 c7             	mov    rdi,rax
  803ddf:	e8 53 00 00 00       	call   803e37 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803de4:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803dea:	89 05 3c 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1073c],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803df0:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803df6:	01 c0                	add    eax,eax
  803df8:	83 c0 05             	add    eax,0x5
  803dfb:	c1 e0 03             	shl    eax,0x3
  803dfe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803e01:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e07:	48 63 d0             	movsxd rdx,eax
  803e0a:	48 89 d0             	mov    rax,rdx
  803e0d:	48 01 c0             	add    rax,rax
  803e10:	48 01 d0             	add    rax,rdx
  803e13:	48 c1 e0 08          	shl    rax,0x8
  803e17:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e1d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e23:	48 83 c0 04          	add    rax,0x4
  803e27:	48 89 c6             	mov    rsi,rax
  803e2a:	bf 00 00 00 00       	mov    edi,0x0
  803e2f:	e8 6d 0a 00 00       	call   8048a1 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803e34:	90                   	nop
  803e35:	c9                   	leave  
  803e36:	c3                   	ret    

0000000000803e37 <save_context>:
void save_context(TSS *tss)
{
  803e37:	f3 0f 1e fa          	endbr64 
  803e3b:	55                   	push   rbp
  803e3c:	48 89 e5             	mov    rbp,rsp
  803e3f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803e43:	90                   	nop
  803e44:	5d                   	pop    rbp
  803e45:	c3                   	ret    

0000000000803e46 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803e46:	f3 0f 1e fa          	endbr64 
  803e4a:	55                   	push   rbp
  803e4b:	48 89 e5             	mov    rbp,rsp
  803e4e:	48 83 ec 60          	sub    rsp,0x60
  803e52:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803e55:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803e58:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e5b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803e61:	85 c0                	test   eax,eax
  803e63:	0f 48 c2             	cmovs  eax,edx
  803e66:	c1 f8 0c             	sar    eax,0xc
  803e69:	89 c1                	mov    ecx,eax
  803e6b:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e6e:	99                   	cdq    
  803e6f:	c1 ea 14             	shr    edx,0x14
  803e72:	01 d0                	add    eax,edx
  803e74:	25 ff 0f 00 00       	and    eax,0xfff
  803e79:	29 d0                	sub    eax,edx
  803e7b:	01 c8                	add    eax,ecx
  803e7d:	85 c0                	test   eax,eax
  803e7f:	0f 95 c0             	setne  al
  803e82:	0f b6 c0             	movzx  eax,al
  803e85:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803e88:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803e8f:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803e96:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803e97:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803e9e:	00 
    pgind++;
  803e9f:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803ea4:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803eab:	e9 76 02 00 00       	jmp    804126 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803eb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803eb4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803eb7:	25 00 f0 ff ff       	and    eax,0xfffff000
  803ebc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803ec0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803ec7:	e9 44 02 00 00       	jmp    804110 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803ecc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803ed0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ed3:	83 e0 01             	and    eax,0x1
  803ed6:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803ed9:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803edd:	0f 85 24 02 00 00    	jne    804107 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803ee3:	b8 00 00 00 00       	mov    eax,0x0
  803ee8:	e8 70 d7 ff ff       	call   80165d <req_a_page>
  803eed:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803ef0:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803ef4:	0f 85 dc 00 00 00    	jne    803fd6 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803efa:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803efd:	48 63 d0             	movsxd rdx,eax
  803f00:	48 89 d0             	mov    rax,rdx
  803f03:	48 01 c0             	add    rax,rax
  803f06:	48 01 d0             	add    rax,rdx
  803f09:	48 c1 e0 08          	shl    rax,0x8
  803f0d:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f13:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f16:	0f b7 c0             	movzx  eax,ax
  803f19:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f1c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f1f:	48 63 d0             	movsxd rdx,eax
  803f22:	48 89 d0             	mov    rax,rdx
  803f25:	48 01 c0             	add    rax,rax
  803f28:	48 01 d0             	add    rax,rdx
  803f2b:	48 c1 e0 08          	shl    rax,0x8
  803f2f:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f35:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f39:	0f b7 c0             	movzx  eax,ax
  803f3c:	c1 e0 10             	shl    eax,0x10
  803f3f:	25 00 00 0f 00       	and    eax,0xf0000
  803f44:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803f47:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f4a:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803f4d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f50:	89 c1                	mov    ecx,eax
  803f52:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f55:	48 63 d0             	movsxd rdx,eax
  803f58:	48 89 d0             	mov    rax,rdx
  803f5b:	48 01 c0             	add    rax,rax
  803f5e:	48 01 d0             	add    rax,rdx
  803f61:	48 c1 e0 08          	shl    rax,0x8
  803f65:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f6b:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803f6e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f71:	48 63 d0             	movsxd rdx,eax
  803f74:	48 89 d0             	mov    rax,rdx
  803f77:	48 01 c0             	add    rax,rax
  803f7a:	48 01 d0             	add    rax,rdx
  803f7d:	48 c1 e0 08          	shl    rax,0x8
  803f81:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f87:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f8b:	0f b7 c0             	movzx  eax,ax
  803f8e:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803f91:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803f98:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f9b:	c1 e8 10             	shr    eax,0x10
  803f9e:	83 e0 0f             	and    eax,0xf
  803fa1:	89 c2                	mov    edx,eax
  803fa3:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fa6:	01 d0                	add    eax,edx
  803fa8:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803fab:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fae:	89 c1                	mov    ecx,eax
  803fb0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fb3:	48 63 d0             	movsxd rdx,eax
  803fb6:	48 89 d0             	mov    rax,rdx
  803fb9:	48 01 c0             	add    rax,rax
  803fbc:	48 01 d0             	add    rax,rdx
  803fbf:	48 c1 e0 08          	shl    rax,0x8
  803fc3:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803fc9:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803fcd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803fd1:	e9 62 01 00 00       	jmp    804138 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  803fd6:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803fd9:	89 c7                	mov    edi,eax
  803fdb:	e8 2b d8 ff ff       	call   80180b <get_phyaddr>
  803fe0:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803fe3:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803fe6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803fea:	ba 07 00 00 00       	mov    edx,0x7
  803fef:	89 ce                	mov    esi,ecx
  803ff1:	48 89 c7             	mov    rdi,rax
  803ff4:	e8 25 d8 ff ff       	call   80181e <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803ff9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ffc:	c1 e0 0a             	shl    eax,0xa
  803fff:	89 c2                	mov    edx,eax
  804001:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804004:	01 d0                	add    eax,edx
  804006:	c1 e0 0c             	shl    eax,0xc
  804009:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  80400c:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804011:	75 09                	jne    80401c <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804013:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804016:	89 05 18 05 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10518],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  80401c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804020:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804024:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804028:	0f 85 d9 00 00 00    	jne    804107 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80402e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804031:	48 63 d0             	movsxd rdx,eax
  804034:	48 89 d0             	mov    rax,rdx
  804037:	48 01 c0             	add    rax,rax
  80403a:	48 01 d0             	add    rax,rdx
  80403d:	48 c1 e0 08          	shl    rax,0x8
  804041:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804047:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80404a:	0f b7 c0             	movzx  eax,ax
  80404d:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804050:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804053:	48 63 d0             	movsxd rdx,eax
  804056:	48 89 d0             	mov    rax,rdx
  804059:	48 01 c0             	add    rax,rax
  80405c:	48 01 d0             	add    rax,rdx
  80405f:	48 c1 e0 08          	shl    rax,0x8
  804063:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804069:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80406d:	0f b7 c0             	movzx  eax,ax
  804070:	c1 e0 10             	shl    eax,0x10
  804073:	25 00 00 0f 00       	and    eax,0xf0000
  804078:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  80407b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80407e:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804081:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804084:	89 c1                	mov    ecx,eax
  804086:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804089:	48 63 d0             	movsxd rdx,eax
  80408c:	48 89 d0             	mov    rax,rdx
  80408f:	48 01 c0             	add    rax,rax
  804092:	48 01 d0             	add    rax,rdx
  804095:	48 c1 e0 08          	shl    rax,0x8
  804099:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80409f:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8040a2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040a5:	48 63 d0             	movsxd rdx,eax
  8040a8:	48 89 d0             	mov    rax,rdx
  8040ab:	48 01 c0             	add    rax,rax
  8040ae:	48 01 d0             	add    rax,rdx
  8040b1:	48 c1 e0 08          	shl    rax,0x8
  8040b5:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040bb:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040bf:	0f b7 c0             	movzx  eax,ax
  8040c2:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8040c5:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8040cc:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040cf:	c1 e8 10             	shr    eax,0x10
  8040d2:	83 e0 0f             	and    eax,0xf
  8040d5:	89 c2                	mov    edx,eax
  8040d7:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040da:	01 d0                	add    eax,edx
  8040dc:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8040df:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040e2:	89 c1                	mov    ecx,eax
  8040e4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040e7:	48 63 d0             	movsxd rdx,eax
  8040ea:	48 89 d0             	mov    rax,rdx
  8040ed:	48 01 c0             	add    rax,rax
  8040f0:	48 01 d0             	add    rax,rdx
  8040f3:	48 c1 e0 08          	shl    rax,0x8
  8040f7:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040fd:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  804101:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804105:	eb 31                	jmp    804138 <palloc+0x2f2>
                }
            }
            tblp++;
  804107:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  80410c:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804110:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804117:	0f 8e af fd ff ff    	jle    803ecc <palloc+0x86>
        }
        pgind++;
  80411d:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804122:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804126:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80412d:	0f 8e 7d fd ff ff    	jle    803eb0 <palloc+0x6a>
    }
    return NULL;
  804133:	b8 00 00 00 00       	mov    eax,0x0
}
  804138:	c9                   	leave  
  804139:	c3                   	ret    

000000000080413a <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  80413a:	f3 0f 1e fa          	endbr64 
  80413e:	55                   	push   rbp
  80413f:	48 89 e5             	mov    rbp,rsp
  804142:	48 83 ec 10          	sub    rsp,0x10
  804146:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804149:	8b 05 dd 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103dd]        # 41452c <cur_proc>
  80414f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804152:	89 d6                	mov    esi,edx
  804154:	89 c7                	mov    edi,eax
  804156:	e8 eb fc ff ff       	call   803e46 <palloc>
}
  80415b:	c9                   	leave  
  80415c:	c3                   	ret    

000000000080415d <proc_end>:
void proc_end()
{
  80415d:	f3 0f 1e fa          	endbr64 
  804161:	55                   	push   rbp
  804162:	48 89 e5             	mov    rbp,rsp
  804165:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804169:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  80416c:	8b 05 ba 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103ba]        # 41452c <cur_proc>
  804172:	89 c7                	mov    edi,eax
  804174:	e8 90 00 00 00       	call   804209 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804179:	8b 05 ad 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103ad]        # 41452c <cur_proc>
  80417f:	48 63 d0             	movsxd rdx,eax
  804182:	48 89 d0             	mov    rax,rdx
  804185:	48 01 c0             	add    rax,rax
  804188:	48 01 d0             	add    rax,rdx
  80418b:	48 c1 e0 08          	shl    rax,0x8
  80418f:	48 05 28 85 40 00    	add    rax,0x408528
  804195:	8b 00                	mov    eax,DWORD PTR [rax]
  804197:	83 f8 ff             	cmp    eax,0xffffffff
  80419a:	74 60                	je     8041fc <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  80419c:	8b 05 8a 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1038a]        # 41452c <cur_proc>
  8041a2:	48 63 d0             	movsxd rdx,eax
  8041a5:	48 89 d0             	mov    rax,rdx
  8041a8:	48 01 c0             	add    rax,rax
  8041ab:	48 01 d0             	add    rax,rdx
  8041ae:	48 c1 e0 08          	shl    rax,0x8
  8041b2:	48 05 28 85 40 00    	add    rax,0x408528
  8041b8:	8b 00                	mov    eax,DWORD PTR [rax]
  8041ba:	89 c2                	mov    edx,eax
  8041bc:	48 89 d0             	mov    rax,rdx
  8041bf:	48 01 c0             	add    rax,rax
  8041c2:	48 01 d0             	add    rax,rdx
  8041c5:	48 c1 e0 08          	shl    rax,0x8
  8041c9:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8041cf:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8041d5:	8b 05 51 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10351]        # 41452c <cur_proc>
  8041db:	48 63 d0             	movsxd rdx,eax
  8041de:	48 89 d0             	mov    rax,rdx
  8041e1:	48 01 c0             	add    rax,rax
  8041e4:	48 01 d0             	add    rax,rdx
  8041e7:	48 c1 e0 08          	shl    rax,0x8
  8041eb:	48 05 28 85 40 00    	add    rax,0x408528
  8041f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8041f3:	89 c7                	mov    edi,eax
  8041f5:	e8 3f fb ff ff       	call   803d39 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8041fa:	eb 0a                	jmp    804206 <proc_end+0xa9>
        switch_proc_tss(0);
  8041fc:	bf 00 00 00 00       	mov    edi,0x0
  804201:	e8 33 fb ff ff       	call   803d39 <switch_proc_tss>
}
  804206:	90                   	nop
  804207:	c9                   	leave  
  804208:	c3                   	ret    

0000000000804209 <del_proc>:
void del_proc(int pnr)
{
  804209:	f3 0f 1e fa          	endbr64 
  80420d:	55                   	push   rbp
  80420e:	48 89 e5             	mov    rbp,rsp
  804211:	48 83 ec 30          	sub    rsp,0x30
  804215:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804218:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80421b:	48 63 d0             	movsxd rdx,eax
  80421e:	48 89 d0             	mov    rax,rdx
  804221:	48 01 c0             	add    rax,rax
  804224:	48 01 d0             	add    rax,rdx
  804227:	48 c1 e0 08          	shl    rax,0x8
  80422b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804231:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804237:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80423a:	48 63 d0             	movsxd rdx,eax
  80423d:	48 89 d0             	mov    rax,rdx
  804240:	48 01 c0             	add    rax,rax
  804243:	48 01 d0             	add    rax,rdx
  804246:	48 c1 e0 08          	shl    rax,0x8
  80424a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804250:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804256:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80425b:	eb 63                	jmp    8042c0 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  80425d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804261:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804264:	25 00 f0 ff ff       	and    eax,0xfffff000
  804269:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80426d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804274:	eb 30                	jmp    8042a6 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804276:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80427a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80427d:	83 e0 01             	and    eax,0x1
  804280:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804283:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804287:	74 14                	je     80429d <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804289:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80428d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804290:	25 00 f0 ff ff       	and    eax,0xfffff000
  804295:	48 89 c7             	mov    rdi,rax
  804298:	e8 90 d4 ff ff       	call   80172d <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80429d:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8042a2:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8042a6:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8042ad:	7e c7                	jle    804276 <del_proc+0x6d>
        }
        vmfree(tp);
  8042af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042b3:	48 89 c7             	mov    rdi,rax
  8042b6:	e8 7e d0 ff ff       	call   801339 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8042bb:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8042c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042c7:	83 e0 01             	and    eax,0x1
  8042ca:	48 85 c0             	test   rax,rax
  8042cd:	75 8e                	jne    80425d <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  8042cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042d3:	48 89 c7             	mov    rdi,rax
  8042d6:	e8 5e d0 ff ff       	call   801339 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8042db:	90                   	nop
  8042dc:	c9                   	leave  
  8042dd:	c3                   	ret    

00000000008042de <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8042de:	f3 0f 1e fa          	endbr64 
  8042e2:	55                   	push   rbp
  8042e3:	48 89 e5             	mov    rbp,rsp
  8042e6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8042e9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8042ec:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8042f0:	75 0a                	jne    8042fc <set_proc_stat+0x1e>
  8042f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042f7:	e9 8c 00 00 00       	jmp    804388 <set_proc_stat+0xaa>
    int i=0;
  8042fc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804303:	eb 04                	jmp    804309 <set_proc_stat+0x2b>
  804305:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804309:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80430c:	48 63 d0             	movsxd rdx,eax
  80430f:	48 89 d0             	mov    rax,rdx
  804312:	48 01 c0             	add    rax,rax
  804315:	48 01 d0             	add    rax,rdx
  804318:	48 c1 e0 08          	shl    rax,0x8
  80431c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804322:	8b 10                	mov    edx,DWORD PTR [rax]
  804324:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804327:	39 c2                	cmp    edx,eax
  804329:	75 da                	jne    804305 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  80432b:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80432f:	75 07                	jne    804338 <set_proc_stat+0x5a>
  804331:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804336:	eb 50                	jmp    804388 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804338:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80433b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80433e:	48 63 c8             	movsxd rcx,eax
  804341:	48 89 c8             	mov    rax,rcx
  804344:	48 01 c0             	add    rax,rax
  804347:	48 01 c8             	add    rax,rcx
  80434a:	48 c1 e0 08          	shl    rax,0x8
  80434e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804354:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804356:	8b 05 d0 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101d0]        # 41452c <cur_proc>
  80435c:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80435f:	75 22                	jne    804383 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  804361:	8b 05 c5 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101c5]        # 41452c <cur_proc>
  804367:	48 63 d0             	movsxd rdx,eax
  80436a:	48 89 d0             	mov    rax,rdx
  80436d:	48 01 c0             	add    rax,rax
  804370:	48 01 d0             	add    rax,rdx
  804373:	48 c1 e0 08          	shl    rax,0x8
  804377:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80437d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804383:	b8 00 00 00 00       	mov    eax,0x0
}
  804388:	5d                   	pop    rbp
  804389:	c3                   	ret    

000000000080438a <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  80438a:	f3 0f 1e fa          	endbr64 
  80438e:	55                   	push   rbp
  80438f:	48 89 e5             	mov    rbp,rsp
  804392:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804396:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80439d:	eb 6a                	jmp    804409 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  80439f:	8b 05 87 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10187]        # 41452c <cur_proc>
  8043a5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8043a8:	48 63 ca             	movsxd rcx,edx
  8043ab:	48 63 d0             	movsxd rdx,eax
  8043ae:	48 89 d0             	mov    rax,rdx
  8043b1:	48 01 c0             	add    rax,rax
  8043b4:	48 01 d0             	add    rax,rdx
  8043b7:	48 c1 e0 05          	shl    rax,0x5
  8043bb:	48 01 c8             	add    rax,rcx
  8043be:	48 83 c0 18          	add    rax,0x18
  8043c2:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8043c9:	00 
  8043ca:	48 85 c0             	test   rax,rax
  8043cd:	75 36                	jne    804405 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  8043cf:	8b 05 57 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10157]        # 41452c <cur_proc>
  8043d5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8043d8:	48 63 ca             	movsxd rcx,edx
  8043db:	48 63 d0             	movsxd rdx,eax
  8043de:	48 89 d0             	mov    rax,rdx
  8043e1:	48 01 c0             	add    rax,rax
  8043e4:	48 01 d0             	add    rax,rdx
  8043e7:	48 c1 e0 05          	shl    rax,0x5
  8043eb:	48 01 c8             	add    rax,rcx
  8043ee:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8043f2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8043f6:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8043fd:	00 
            return 0;
  8043fe:	b8 00 00 00 00       	mov    eax,0x0
  804403:	eb 0f                	jmp    804414 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804405:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804409:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80440d:	7e 90                	jle    80439f <add_proc_openf+0x15>
        }
    }
    return -1;//full
  80440f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804414:	5d                   	pop    rbp
  804415:	c3                   	ret    

0000000000804416 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804416:	f3 0f 1e fa          	endbr64 
  80441a:	55                   	push   rbp
  80441b:	48 89 e5             	mov    rbp,rsp
  80441e:	48 83 ec 10          	sub    rsp,0x10
  804422:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804425:	8b 05 01 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10101]        # 41452c <cur_proc>
  80442b:	89 c7                	mov    edi,eax
  80442d:	e8 d7 fd ff ff       	call   804209 <del_proc>
    while(1)
        manage_proc();
  804432:	b8 00 00 00 00       	mov    eax,0x0
  804437:	e8 31 f7 ff ff       	call   803b6d <manage_proc>
  80443c:	eb f4                	jmp    804432 <sys_exit+0x1c>

000000000080443e <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  80443e:	f3 0f 1e fa          	endbr64 
  804442:	55                   	push   rbp
  804443:	48 89 e5             	mov    rbp,rsp
  804446:	53                   	push   rbx
  804447:	48 83 ec 48          	sub    rsp,0x48
  80444b:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80444f:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804453:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804457:	b8 00 00 00 00       	mov    eax,0x0
  80445c:	e8 1d f4 ff ff       	call   80387e <req_proc>
  804461:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804464:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804468:	75 0a                	jne    804474 <reg_proc+0x36>
  80446a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80446f:	e9 c9 01 00 00       	jmp    80463d <reg_proc+0x1ff>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804474:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804478:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80447b:	52                   	push   rdx
  80447c:	6a 00                	push   0x0
  80447e:	50                   	push   rax
  80447f:	6a 00                	push   0x0
  804481:	6a 00                	push   0x0
  804483:	6a 00                	push   0x0
  804485:	68 00 f0 ff ff       	push   0xfffffffffffff000
  80448a:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804491:	00 
  804492:	6a 28                	push   0x28
  804494:	6a 28                	push   0x28
  804496:	6a 28                	push   0x28
  804498:	6a 28                	push   0x28
  80449a:	41 b9 30 00 00 00    	mov    r9d,0x30
  8044a0:	41 b8 28 00 00 00    	mov    r8d,0x28
  8044a6:	b9 00 00 00 00       	mov    ecx,0x0
  8044ab:	ba 00 00 00 00       	mov    edx,0x0
  8044b0:	be 00 00 00 00       	mov    esi,0x0
  8044b5:	bf 00 00 00 00       	mov    edi,0x0
  8044ba:	e8 b8 f4 ff ff       	call   803977 <set_proc>
  8044bf:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  8044c3:	b8 00 00 00 00       	mov    eax,0x0
  8044c8:	e8 dd cd ff ff       	call   8012aa <vmalloc>
  8044cd:	48 89 c1             	mov    rcx,rax
  8044d0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044d3:	48 63 d0             	movsxd rdx,eax
  8044d6:	48 89 d0             	mov    rax,rdx
  8044d9:	48 01 c0             	add    rax,rax
  8044dc:	48 01 d0             	add    rax,rdx
  8044df:	48 c1 e0 08          	shl    rax,0x8
  8044e3:	48 05 40 85 40 00    	add    rax,0x408540
  8044e9:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  8044ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044f0:	48 63 d0             	movsxd rdx,eax
  8044f3:	48 89 d0             	mov    rax,rdx
  8044f6:	48 01 c0             	add    rax,rax
  8044f9:	48 01 d0             	add    rax,rdx
  8044fc:	48 c1 e0 08          	shl    rax,0x8
  804500:	48 05 40 85 40 00    	add    rax,0x408540
  804506:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  80450a:	b8 00 00 00 00       	mov    eax,0x0
  80450f:	e8 96 cd ff ff       	call   8012aa <vmalloc>
  804514:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804517:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80451a:	48 63 d0             	movsxd rdx,eax
  80451d:	48 89 d0             	mov    rax,rdx
  804520:	48 01 c0             	add    rax,rax
  804523:	48 01 d0             	add    rax,rdx
  804526:	48 c1 e0 08          	shl    rax,0x8
  80452a:	48 05 40 85 40 00    	add    rax,0x408540
  804530:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804534:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804538:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80453c:	ba 03 00 00 00       	mov    edx,0x3
  804541:	be 00 00 00 00       	mov    esi,0x0
  804546:	48 89 c7             	mov    rdi,rax
  804549:	e8 21 d3 ff ff       	call   80186f <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  80454e:	b8 00 00 00 00       	mov    eax,0x0
  804553:	e8 52 cd ff ff       	call   8012aa <vmalloc>
  804558:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  80455c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804560:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804564:	48 83 c0 18          	add    rax,0x18
  804568:	48 83 ca 07          	or     rdx,0x7
  80456c:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  80456f:	b8 00 00 00 00       	mov    eax,0x0
  804574:	e8 e4 d0 ff ff       	call   80165d <req_a_page>
  804579:	89 c7                	mov    edi,eax
  80457b:	e8 8b d2 ff ff       	call   80180b <get_phyaddr>
  804580:	89 c1                	mov    ecx,eax
  804582:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804586:	48 05 f8 0f 00 00    	add    rax,0xff8
  80458c:	ba 06 00 00 00       	mov    edx,0x6
  804591:	89 ce                	mov    esi,ecx
  804593:	48 89 c7             	mov    rdi,rax
  804596:	e8 2b d3 ff ff       	call   8018c6 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  80459b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80459e:	48 63 d0             	movsxd rdx,eax
  8045a1:	48 89 d0             	mov    rax,rdx
  8045a4:	48 01 c0             	add    rax,rax
  8045a7:	48 01 d0             	add    rax,rdx
  8045aa:	48 c1 e0 08          	shl    rax,0x8
  8045ae:	48 05 40 85 40 00    	add    rax,0x408540
  8045b4:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8045b8:	48 89 c1             	mov    rcx,rax
  8045bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045be:	48 63 d0             	movsxd rdx,eax
  8045c1:	48 89 d0             	mov    rax,rdx
  8045c4:	48 01 c0             	add    rax,rax
  8045c7:	48 01 d0             	add    rax,rdx
  8045ca:	48 c1 e0 08          	shl    rax,0x8
  8045ce:	48 05 d0 86 40 00    	add    rax,0x4086d0
  8045d4:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  8045d7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045da:	48 63 d0             	movsxd rdx,eax
  8045dd:	48 89 d0             	mov    rax,rdx
  8045e0:	48 01 c0             	add    rax,rax
  8045e3:	48 01 d0             	add    rax,rdx
  8045e6:	48 c1 e0 08          	shl    rax,0x8
  8045ea:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045f0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8045f6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045f9:	48 63 d0             	movsxd rdx,eax
  8045fc:	48 89 d0             	mov    rax,rdx
  8045ff:	48 01 c0             	add    rax,rax
  804602:	48 01 d0             	add    rax,rdx
  804605:	48 c1 e0 08          	shl    rax,0x8
  804609:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804610:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804614:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804618:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80461b:	48 63 d0             	movsxd rdx,eax
  80461e:	48 89 d0             	mov    rax,rdx
  804621:	48 01 c0             	add    rax,rax
  804624:	48 01 d0             	add    rax,rdx
  804627:	48 c1 e0 08          	shl    rax,0x8
  80462b:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804632:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804636:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  80463a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80463d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804641:	c9                   	leave  
  804642:	c3                   	ret    

0000000000804643 <sys_malloc>:

void * sys_malloc(int size)
{
  804643:	f3 0f 1e fa          	endbr64 
  804647:	55                   	push   rbp
  804648:	48 89 e5             	mov    rbp,rsp
  80464b:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  80464e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804651:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804657:	85 c0                	test   eax,eax
  804659:	0f 48 c2             	cmovs  eax,edx
  80465c:	c1 f8 0c             	sar    eax,0xc
  80465f:	89 c1                	mov    ecx,eax
  804661:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804664:	99                   	cdq    
  804665:	c1 ea 14             	shr    edx,0x14
  804668:	01 d0                	add    eax,edx
  80466a:	25 ff 0f 00 00       	and    eax,0xfff
  80466f:	29 d0                	sub    eax,edx
  804671:	01 c8                	add    eax,ecx
  804673:	85 c0                	test   eax,eax
  804675:	0f 95 c0             	setne  al
  804678:	0f b6 c0             	movzx  eax,al
  80467b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  80467e:	8b 05 a8 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fea8]        # 41452c <cur_proc>
  804684:	48 63 d0             	movsxd rdx,eax
  804687:	48 89 d0             	mov    rax,rdx
  80468a:	48 01 c0             	add    rax,rax
  80468d:	48 01 d0             	add    rax,rdx
  804690:	48 c1 e0 08          	shl    rax,0x8
  804694:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80469a:	8b 00                	mov    eax,DWORD PTR [rax]
  80469c:	48 98                	cdqe   
  80469e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046a2:	eb 0c                	jmp    8046b0 <sys_malloc+0x6d>
        hp=hp->next;
  8046a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046ac:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046b4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046b8:	48 85 c0             	test   rax,rax
  8046bb:	74 16                	je     8046d3 <sys_malloc+0x90>
  8046bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046c1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046c4:	85 c0                	test   eax,eax
  8046c6:	75 0b                	jne    8046d3 <sys_malloc+0x90>
  8046c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8046ce:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8046d1:	7e d1                	jle    8046a4 <sys_malloc+0x61>
    if(hp->pgn<n)
  8046d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046d7:	8b 00                	mov    eax,DWORD PTR [rax]
  8046d9:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8046dc:	0f 8e 8d 00 00 00    	jle    80476f <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8046e2:	8b 05 44 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe44]        # 41452c <cur_proc>
  8046e8:	48 63 d0             	movsxd rdx,eax
  8046eb:	48 89 d0             	mov    rax,rdx
  8046ee:	48 01 c0             	add    rax,rax
  8046f1:	48 01 d0             	add    rax,rdx
  8046f4:	48 c1 e0 08          	shl    rax,0x8
  8046f8:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8046fe:	8b 10                	mov    edx,DWORD PTR [rax]
  804700:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804703:	c1 e0 0c             	shl    eax,0xc
  804706:	01 d0                	add    eax,edx
  804708:	3d ff ff ef 01       	cmp    eax,0x1efffff
  80470d:	7e 0a                	jle    804719 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  80470f:	b8 00 00 00 00       	mov    eax,0x0
  804714:	e9 cf 00 00 00       	jmp    8047e8 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804719:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80471d:	8b 10                	mov    edx,DWORD PTR [rax]
  80471f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804722:	29 d0                	sub    eax,edx
  804724:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804727:	8b 05 ff fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdff]        # 41452c <cur_proc>
  80472d:	48 63 d0             	movsxd rdx,eax
  804730:	48 89 d0             	mov    rax,rdx
  804733:	48 01 c0             	add    rax,rax
  804736:	48 01 d0             	add    rax,rdx
  804739:	48 c1 e0 08          	shl    rax,0x8
  80473d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804743:	8b 00                	mov    eax,DWORD PTR [rax]
  804745:	48 98                	cdqe   
  804747:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80474b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804752:	eb 13                	jmp    804767 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804754:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804758:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80475b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804762:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804763:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804767:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80476a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80476d:	7c e5                	jl     804754 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  80476f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804773:	8b 00                	mov    eax,DWORD PTR [rax]
  804775:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804778:	7d 59                	jge    8047d3 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  80477a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80477e:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804782:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804785:	83 c0 01             	add    eax,0x1
  804788:	c1 e0 0c             	shl    eax,0xc
  80478b:	48 98                	cdqe   
  80478d:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804791:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804795:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804799:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80479d:	8b 00                	mov    eax,DWORD PTR [rax]
  80479f:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8047a2:	8d 50 ff             	lea    edx,[rax-0x1]
  8047a5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047a9:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8047ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047af:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8047b3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047b7:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8047bb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047bf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8047c3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  8047c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047cb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8047cf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  8047d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047d7:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  8047de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047e2:	48 05 00 10 00 00    	add    rax,0x1000
}
  8047e8:	5d                   	pop    rbp
  8047e9:	c3                   	ret    

00000000008047ea <sys_free>:
int sys_free(int ptr)
{
  8047ea:	f3 0f 1e fa          	endbr64 
  8047ee:	55                   	push   rbp
  8047ef:	48 89 e5             	mov    rbp,rsp
  8047f2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8047f5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047f8:	2d 00 10 00 00       	sub    eax,0x1000
  8047fd:	48 98                	cdqe   
  8047ff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804803:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804807:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  80480e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804812:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804816:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80481a:	eb 2e                	jmp    80484a <sys_free+0x60>
    {
        if(p->alloc==0)
  80481c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804820:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804823:	85 c0                	test   eax,eax
  804825:	75 2c                	jne    804853 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804827:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80482b:	8b 10                	mov    edx,DWORD PTR [rax]
  80482d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804831:	8b 00                	mov    eax,DWORD PTR [rax]
  804833:	83 c0 01             	add    eax,0x1
  804836:	01 c2                	add    edx,eax
  804838:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80483c:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  80483e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804842:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804846:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80484a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80484f:	75 cb                	jne    80481c <sys_free+0x32>
  804851:	eb 01                	jmp    804854 <sys_free+0x6a>
            break;
  804853:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804854:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804858:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80485c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804860:	eb 2e                	jmp    804890 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804862:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804866:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804869:	85 c0                	test   eax,eax
  80486b:	75 2c                	jne    804899 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80486d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804871:	8b 10                	mov    edx,DWORD PTR [rax]
  804873:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804877:	8b 00                	mov    eax,DWORD PTR [rax]
  804879:	83 c0 01             	add    eax,0x1
  80487c:	01 c2                	add    edx,eax
  80487e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804882:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804884:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804888:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80488c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804890:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804895:	75 cb                	jne    804862 <sys_free+0x78>
  804897:	eb 01                	jmp    80489a <sys_free+0xb0>
            break;
  804899:	90                   	nop
    }
    //合并完成
    return 0;
  80489a:	b8 00 00 00 00       	mov    eax,0x0
}
  80489f:	5d                   	pop    rbp
  8048a0:	c3                   	ret    

00000000008048a1 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8048a1:	f3 0f 1e fa          	endbr64 
  8048a5:	55                   	push   rbp
  8048a6:	48 89 e5             	mov    rbp,rsp
  8048a9:	53                   	push   rbx
  8048aa:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8048ae:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8048b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048b6:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  8048bc:	48 c1 f8 08          	sar    rax,0x8
  8048c0:	48 89 c2             	mov    rdx,rax
  8048c3:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  8048ca:	aa aa aa 
  8048cd:	48 0f af c2          	imul   rax,rdx
  8048d1:	89 05 55 fc c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0fc55],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  8048d7:	8b 05 4f fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc4f]        # 41452c <cur_proc>
  8048dd:	48 63 d0             	movsxd rdx,eax
  8048e0:	48 89 d0             	mov    rax,rdx
  8048e3:	48 01 c0             	add    rax,rax
  8048e6:	48 01 d0             	add    rax,rdx
  8048e9:	48 c1 e0 08          	shl    rax,0x8
  8048ed:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8048f3:	48 89 05 a6 fb c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fba6],rax        # 4144a0 <current>
    asm volatile("mov %0,%%rax\n"
  8048fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048fe:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  804905:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804908:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  80490c:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804910:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804914:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804918:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80491c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804920:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804924:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804928:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  80492c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804930:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804937:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804962 <done>
  80493e:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804945:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  80494c:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804952:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804959:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804960:	eb 08                	jmp    80496a <__switch_to>

0000000000804962 <done>:
  804962:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804963:	90                   	nop
  804964:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804968:	c9                   	leave  
  804969:	c3                   	ret    

000000000080496a <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  80496a:	f3 0f 1e fa          	endbr64 
  80496e:	55                   	push   rbp
  80496f:	48 89 e5             	mov    rbp,rsp
  804972:	53                   	push   rbx
  804973:	48 83 ec 18          	sub    rsp,0x18
  804977:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80497b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80497f:	48 8b 05 fa 76 00 00 	mov    rax,QWORD PTR [rip+0x76fa]        # 80c080 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804986:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80498a:	48 8b 05 ef 76 00 00 	mov    rax,QWORD PTR [rip+0x76ef]        # 80c080 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804991:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804995:	48 8b 05 e4 76 00 00 	mov    rax,QWORD PTR [rip+0x76e4]        # 80c080 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80499c:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049a0:	48 8b 05 d9 76 00 00 	mov    rax,QWORD PTR [rip+0x76d9]        # 80c080 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049a7:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049ab:	48 8b 05 ce 76 00 00 	mov    rax,QWORD PTR [rip+0x76ce]        # 80c080 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049b2:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8049b6:	48 8b 05 c3 76 00 00 	mov    rax,QWORD PTR [rip+0x76c3]        # 80c080 <tss>
  8049bd:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8049c1:	48 8b 05 b8 76 00 00 	mov    rax,QWORD PTR [rip+0x76b8]        # 80c080 <tss>
  8049c8:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  8049cc:	48 8b 05 ad 76 00 00 	mov    rax,QWORD PTR [rip+0x76ad]        # 80c080 <tss>
  8049d3:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  8049d7:	48 8b 05 a2 76 00 00 	mov    rax,QWORD PTR [rip+0x76a2]        # 80c080 <tss>
  8049de:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  8049e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8049e6:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  8049ed:	41 52                	push   r10
  8049ef:	41 51                	push   r9
  8049f1:	41 50                	push   r8
  8049f3:	57                   	push   rdi
  8049f4:	49 89 d9             	mov    r9,rbx
  8049f7:	4d 89 d8             	mov    r8,r11
  8049fa:	48 89 c7             	mov    rdi,rax
  8049fd:	e8 34 00 00 00       	call   804a36 <set_tss>
  804a02:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804a06:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a0a:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804a0e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a12:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804a16:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804a1c:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804a22:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804a28:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  804a2e:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804a2f:	90                   	nop
  804a30:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804a34:	c9                   	leave  
  804a35:	c3                   	ret    

0000000000804a36 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804a36:	f3 0f 1e fa          	endbr64 
  804a3a:	55                   	push   rbp
  804a3b:	48 89 e5             	mov    rbp,rsp
  804a3e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804a42:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804a46:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804a4a:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804a4e:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804a52:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804a56:	48 8b 05 23 76 00 00 	mov    rax,QWORD PTR [rip+0x7623]        # 80c080 <tss>
  804a5d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804a61:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804a65:	48 8b 05 14 76 00 00 	mov    rax,QWORD PTR [rip+0x7614]        # 80c080 <tss>
  804a6c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804a70:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804a74:	48 8b 05 05 76 00 00 	mov    rax,QWORD PTR [rip+0x7605]        # 80c080 <tss>
  804a7b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a7f:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804a83:	48 8b 05 f6 75 00 00 	mov    rax,QWORD PTR [rip+0x75f6]        # 80c080 <tss>
  804a8a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804a8e:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804a92:	48 8b 05 e7 75 00 00 	mov    rax,QWORD PTR [rip+0x75e7]        # 80c080 <tss>
  804a99:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804a9d:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804aa1:	48 8b 05 d8 75 00 00 	mov    rax,QWORD PTR [rip+0x75d8]        # 80c080 <tss>
  804aa8:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804aac:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804ab0:	48 8b 05 c9 75 00 00 	mov    rax,QWORD PTR [rip+0x75c9]        # 80c080 <tss>
  804ab7:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804abb:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804abf:	48 8b 05 ba 75 00 00 	mov    rax,QWORD PTR [rip+0x75ba]        # 80c080 <tss>
  804ac6:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804aca:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804ace:	48 8b 05 ab 75 00 00 	mov    rax,QWORD PTR [rip+0x75ab]        # 80c080 <tss>
  804ad5:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804ad9:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804add:	48 8b 05 9c 75 00 00 	mov    rax,QWORD PTR [rip+0x759c]        # 80c080 <tss>
  804ae4:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804ae8:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804aec:	90                   	nop
  804aed:	5d                   	pop    rbp
  804aee:	c3                   	ret    

0000000000804aef <fork_child_ret>:

int fork_child_ret(){
  804aef:	f3 0f 1e fa          	endbr64 
  804af3:	55                   	push   rbp
  804af4:	48 89 e5             	mov    rbp,rsp
    return 0;
  804af7:	b8 00 00 00 00       	mov    eax,0x0

}
  804afc:	5d                   	pop    rbp
  804afd:	c3                   	ret    

0000000000804afe <sys_fork>:

int sys_fork(void){
  804afe:	f3 0f 1e fa          	endbr64 
  804b02:	55                   	push   rbp
  804b03:	48 89 e5             	mov    rbp,rsp
  804b06:	53                   	push   rbx
  804b07:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804b0b:	b8 00 00 00 00       	mov    eax,0x0
  804b10:	e8 69 ed ff ff       	call   80387e <req_proc>
  804b15:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804b18:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804b1c:	75 0a                	jne    804b28 <sys_fork+0x2a>
  804b1e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b23:	e9 17 08 00 00       	jmp    80533f <sys_fork+0x841>
    task[pid].regs=current->regs;
  804b28:	48 8b 05 71 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f971]        # 4144a0 <current>
  804b2f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b32:	48 63 ca             	movsxd rcx,edx
  804b35:	48 89 ca             	mov    rdx,rcx
  804b38:	48 01 d2             	add    rdx,rdx
  804b3b:	48 01 ca             	add    rdx,rcx
  804b3e:	48 c1 e2 08          	shl    rdx,0x8
  804b42:	48 81 c2 d0 86 40 00 	add    rdx,0x4086d0
  804b49:	48 8b 88 30 02 00 00 	mov    rcx,QWORD PTR [rax+0x230]
  804b50:	48 8b 98 38 02 00 00 	mov    rbx,QWORD PTR [rax+0x238]
  804b57:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  804b5a:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  804b5e:	48 8b 88 40 02 00 00 	mov    rcx,QWORD PTR [rax+0x240]
  804b65:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
  804b6c:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  804b70:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  804b74:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
  804b7b:	48 8b 98 58 02 00 00 	mov    rbx,QWORD PTR [rax+0x258]
  804b82:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  804b86:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  804b8a:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
  804b91:	48 8b 98 68 02 00 00 	mov    rbx,QWORD PTR [rax+0x268]
  804b98:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  804b9c:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  804ba0:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
  804ba7:	48 8b 98 78 02 00 00 	mov    rbx,QWORD PTR [rax+0x278]
  804bae:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  804bb2:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  804bb6:	48 8b 88 80 02 00 00 	mov    rcx,QWORD PTR [rax+0x280]
  804bbd:	48 8b 98 88 02 00 00 	mov    rbx,QWORD PTR [rax+0x288]
  804bc4:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  804bc8:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  804bcc:	48 8b 88 90 02 00 00 	mov    rcx,QWORD PTR [rax+0x290]
  804bd3:	48 8b 98 98 02 00 00 	mov    rbx,QWORD PTR [rax+0x298]
  804bda:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  804bde:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  804be2:	48 8b 88 a0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a0]
  804be9:	48 8b 98 a8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2a8]
  804bf0:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  804bf4:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  804bf8:	48 8b 88 b0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b0]
  804bff:	48 8b 98 b8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2b8]
  804c06:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  804c0d:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  804c14:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
  804c1b:	48 8b 98 c8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2c8]
  804c22:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  804c29:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  804c30:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
  804c37:	48 8b 98 d8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2d8]
  804c3e:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  804c45:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  804c4c:	48 8b 88 e0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e0]
  804c53:	48 8b 98 e8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2e8]
  804c5a:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  804c61:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  804c68:	48 8b 88 f0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f0]
  804c6f:	48 8b 98 f8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2f8]
  804c76:	48 89 8a c0 00 00 00 	mov    QWORD PTR [rdx+0xc0],rcx
  804c7d:	48 89 9a c8 00 00 00 	mov    QWORD PTR [rdx+0xc8],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804c84:	b9 f1 bf 80 00       	mov    ecx,0x80bff1
  804c89:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c8c:	48 63 d0             	movsxd rdx,eax
  804c8f:	48 89 d0             	mov    rax,rdx
  804c92:	48 01 c0             	add    rax,rax
  804c95:	48 01 d0             	add    rax,rdx
  804c98:	48 c1 e0 08          	shl    rax,0x8
  804c9c:	48 05 d8 86 40 00    	add    rax,0x4086d8
  804ca2:	48 89 08             	mov    QWORD PTR [rax],rcx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804ca5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ca8:	48 63 d0             	movsxd rdx,eax
  804cab:	48 89 d0             	mov    rax,rdx
  804cae:	48 01 c0             	add    rax,rax
  804cb1:	48 01 d0             	add    rax,rdx
  804cb4:	48 c1 e0 08          	shl    rax,0x8
  804cb8:	48 05 08 87 40 00    	add    rax,0x408708
  804cbe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804cc1:	48 2d a8 00 00 00    	sub    rax,0xa8
  804cc7:	48 89 c1             	mov    rcx,rax
  804cca:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ccd:	48 63 d0             	movsxd rdx,eax
  804cd0:	48 89 d0             	mov    rax,rdx
  804cd3:	48 01 c0             	add    rax,rax
  804cd6:	48 01 d0             	add    rax,rdx
  804cd9:	48 c1 e0 08          	shl    rax,0x8
  804cdd:	48 05 08 87 40 00    	add    rax,0x408708
  804ce3:	48 89 08             	mov    QWORD PTR [rax],rcx
    stack_store_regs *r=task[pid].regs.rsp;
  804ce6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ce9:	48 63 d0             	movsxd rdx,eax
  804cec:	48 89 d0             	mov    rax,rdx
  804cef:	48 01 c0             	add    rax,rax
  804cf2:	48 01 d0             	add    rax,rdx
  804cf5:	48 c1 e0 08          	shl    rax,0x8
  804cf9:	48 05 08 87 40 00    	add    rax,0x408708
  804cff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d02:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804d06:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d0a:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804d11:	00 
    r->ds=DS_USER;
  804d12:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d16:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804d1d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d21:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804d28:	28 00 00 00 
    r->es=DS_USER;
  804d2c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d30:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804d37:	00 
    r->rax=task[pid].regs.rax;
  804d38:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d3b:	48 63 d0             	movsxd rdx,eax
  804d3e:	48 89 d0             	mov    rax,rdx
  804d41:	48 01 c0             	add    rax,rax
  804d44:	48 01 d0             	add    rax,rdx
  804d47:	48 c1 e0 08          	shl    rax,0x8
  804d4b:	48 05 e8 86 40 00    	add    rax,0x4086e8
  804d51:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d54:	48 89 c2             	mov    rdx,rax
  804d57:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d5b:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804d5f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d62:	48 63 d0             	movsxd rdx,eax
  804d65:	48 89 d0             	mov    rax,rdx
  804d68:	48 01 c0             	add    rax,rax
  804d6b:	48 01 d0             	add    rax,rdx
  804d6e:	48 c1 e0 08          	shl    rax,0x8
  804d72:	48 05 00 87 40 00    	add    rax,0x408700
  804d78:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d7b:	48 89 c2             	mov    rdx,rax
  804d7e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d82:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804d86:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d89:	48 63 d0             	movsxd rdx,eax
  804d8c:	48 89 d0             	mov    rax,rdx
  804d8f:	48 01 c0             	add    rax,rax
  804d92:	48 01 d0             	add    rax,rdx
  804d95:	48 c1 e0 08          	shl    rax,0x8
  804d99:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804d9f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804da2:	48 89 c2             	mov    rdx,rax
  804da5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804da9:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804dad:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804db0:	48 63 d0             	movsxd rdx,eax
  804db3:	48 89 d0             	mov    rax,rdx
  804db6:	48 01 c0             	add    rax,rax
  804db9:	48 01 d0             	add    rax,rdx
  804dbc:	48 c1 e0 08          	shl    rax,0x8
  804dc0:	48 05 f8 86 40 00    	add    rax,0x4086f8
  804dc6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dc9:	48 89 c2             	mov    rdx,rax
  804dcc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dd0:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804dd4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804dd7:	48 63 d0             	movsxd rdx,eax
  804dda:	48 89 d0             	mov    rax,rdx
  804ddd:	48 01 c0             	add    rax,rax
  804de0:	48 01 d0             	add    rax,rdx
  804de3:	48 c1 e0 08          	shl    rax,0x8
  804de7:	48 05 18 87 40 00    	add    rax,0x408718
  804ded:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804df0:	48 89 c2             	mov    rdx,rax
  804df3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804df7:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804dfb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804dfe:	48 63 d0             	movsxd rdx,eax
  804e01:	48 89 d0             	mov    rax,rdx
  804e04:	48 01 c0             	add    rax,rax
  804e07:	48 01 d0             	add    rax,rdx
  804e0a:	48 c1 e0 08          	shl    rax,0x8
  804e0e:	48 05 20 87 40 00    	add    rax,0x408720
  804e14:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e17:	48 89 c2             	mov    rdx,rax
  804e1a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e1e:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804e22:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e25:	48 63 d0             	movsxd rdx,eax
  804e28:	48 89 d0             	mov    rax,rdx
  804e2b:	48 01 c0             	add    rax,rax
  804e2e:	48 01 d0             	add    rax,rdx
  804e31:	48 c1 e0 08          	shl    rax,0x8
  804e35:	48 05 58 87 40 00    	add    rax,0x408758
  804e3b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e3e:	48 89 c2             	mov    rdx,rax
  804e41:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e45:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804e49:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e4c:	48 63 d0             	movsxd rdx,eax
  804e4f:	48 89 d0             	mov    rax,rdx
  804e52:	48 01 c0             	add    rax,rax
  804e55:	48 01 d0             	add    rax,rdx
  804e58:	48 c1 e0 08          	shl    rax,0x8
  804e5c:	48 05 60 87 40 00    	add    rax,0x408760
  804e62:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e65:	48 89 c2             	mov    rdx,rax
  804e68:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e6c:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804e70:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e73:	48 63 d0             	movsxd rdx,eax
  804e76:	48 89 d0             	mov    rax,rdx
  804e79:	48 01 c0             	add    rax,rax
  804e7c:	48 01 d0             	add    rax,rdx
  804e7f:	48 c1 e0 08          	shl    rax,0x8
  804e83:	48 05 68 87 40 00    	add    rax,0x408768
  804e89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e8c:	48 89 c2             	mov    rdx,rax
  804e8f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e93:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804e97:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e9a:	48 63 d0             	movsxd rdx,eax
  804e9d:	48 89 d0             	mov    rax,rdx
  804ea0:	48 01 c0             	add    rax,rax
  804ea3:	48 01 d0             	add    rax,rdx
  804ea6:	48 c1 e0 08          	shl    rax,0x8
  804eaa:	48 05 70 87 40 00    	add    rax,0x408770
  804eb0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804eb3:	48 89 c2             	mov    rdx,rax
  804eb6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804eba:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804ebe:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ec1:	48 63 d0             	movsxd rdx,eax
  804ec4:	48 89 d0             	mov    rax,rdx
  804ec7:	48 01 c0             	add    rax,rax
  804eca:	48 01 d0             	add    rax,rdx
  804ecd:	48 c1 e0 08          	shl    rax,0x8
  804ed1:	48 05 78 87 40 00    	add    rax,0x408778
  804ed7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804eda:	48 89 c2             	mov    rdx,rax
  804edd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ee1:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804ee5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ee8:	48 63 d0             	movsxd rdx,eax
  804eeb:	48 89 d0             	mov    rax,rdx
  804eee:	48 01 c0             	add    rax,rax
  804ef1:	48 01 d0             	add    rax,rdx
  804ef4:	48 c1 e0 08          	shl    rax,0x8
  804ef8:	48 05 80 87 40 00    	add    rax,0x408780
  804efe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f01:	48 89 c2             	mov    rdx,rax
  804f04:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f08:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804f0c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f0f:	48 63 d0             	movsxd rdx,eax
  804f12:	48 89 d0             	mov    rax,rdx
  804f15:	48 01 c0             	add    rax,rax
  804f18:	48 01 d0             	add    rax,rdx
  804f1b:	48 c1 e0 08          	shl    rax,0x8
  804f1f:	48 05 88 87 40 00    	add    rax,0x408788
  804f25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f28:	48 89 c2             	mov    rdx,rax
  804f2b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f2f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804f33:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f36:	48 63 d0             	movsxd rdx,eax
  804f39:	48 89 d0             	mov    rax,rdx
  804f3c:	48 01 c0             	add    rax,rax
  804f3f:	48 01 d0             	add    rax,rdx
  804f42:	48 c1 e0 08          	shl    rax,0x8
  804f46:	48 05 90 87 40 00    	add    rax,0x408790
  804f4c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f4f:	48 89 c2             	mov    rdx,rax
  804f52:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f56:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804f5a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f5e:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804f65:	48 8b 05 34 f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f534]        # 4144a0 <current>
  804f6c:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f6f:	48 63 ca             	movsxd rcx,edx
  804f72:	48 89 ca             	mov    rdx,rcx
  804f75:	48 01 d2             	add    rdx,rdx
  804f78:	48 01 ca             	add    rdx,rcx
  804f7b:	48 c1 e2 08          	shl    rdx,0x8
  804f7f:	48 81 c2 60 86 40 00 	add    rdx,0x408660
  804f86:	48 8b 88 c4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1c4]
  804f8d:	48 8b 98 cc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1cc]
  804f94:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804f98:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804f9c:	48 8b 88 d4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d4]
  804fa3:	48 8b 98 dc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1dc]
  804faa:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804fae:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804fb2:	48 8b 88 e4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e4]
  804fb9:	48 8b 98 ec 01 00 00 	mov    rbx,QWORD PTR [rax+0x1ec]
  804fc0:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804fc4:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804fc8:	48 8b 88 f4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f4]
  804fcf:	48 8b 98 fc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1fc]
  804fd6:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804fda:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804fde:	48 8b 88 04 02 00 00 	mov    rcx,QWORD PTR [rax+0x204]
  804fe5:	48 8b 98 0c 02 00 00 	mov    rbx,QWORD PTR [rax+0x20c]
  804fec:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804ff0:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804ff4:	48 8b 88 14 02 00 00 	mov    rcx,QWORD PTR [rax+0x214]
  804ffb:	48 8b 98 1c 02 00 00 	mov    rbx,QWORD PTR [rax+0x21c]
  805002:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  805006:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  80500a:	48 8b 88 24 02 00 00 	mov    rcx,QWORD PTR [rax+0x224]
  805011:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  805015:	8b 80 2c 02 00 00    	mov    eax,DWORD PTR [rax+0x22c]
  80501b:	89 42 6c             	mov    DWORD PTR [rdx+0x6c],eax
    task[pid].stat=READY;
  80501e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805021:	48 63 d0             	movsxd rdx,eax
  805024:	48 89 d0             	mov    rax,rdx
  805027:	48 01 c0             	add    rax,rax
  80502a:	48 01 d0             	add    rax,rdx
  80502d:	48 c1 e0 08          	shl    rax,0x8
  805031:	48 05 a4 84 40 00    	add    rax,0x4084a4
  805037:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  80503d:	8b 05 e9 f4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f4e9]        # 41452c <cur_proc>
  805043:	89 c1                	mov    ecx,eax
  805045:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805048:	48 63 d0             	movsxd rdx,eax
  80504b:	48 89 d0             	mov    rax,rdx
  80504e:	48 01 c0             	add    rax,rax
  805051:	48 01 d0             	add    rax,rdx
  805054:	48 c1 e0 08          	shl    rax,0x8
  805058:	48 05 28 85 40 00    	add    rax,0x408528
  80505e:	89 08                	mov    DWORD PTR [rax],ecx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805060:	48 8b 05 39 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f439]        # 4144a0 <current>
  805067:	48 8d 88 c4 00 00 00 	lea    rcx,[rax+0xc4]
  80506e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805071:	48 63 d0             	movsxd rdx,eax
  805074:	48 89 d0             	mov    rax,rdx
  805077:	48 01 c0             	add    rax,rax
  80507a:	48 01 d0             	add    rax,rdx
  80507d:	48 c1 e0 08          	shl    rax,0x8
  805081:	48 05 c0 00 00 00    	add    rax,0xc0
  805087:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80508d:	48 83 c0 04          	add    rax,0x4
  805091:	ba 00 01 00 00       	mov    edx,0x100
  805096:	48 89 ce             	mov    rsi,rcx
  805099:	48 89 c7             	mov    rdi,rax
  80509c:	e8 b0 65 00 00       	call   80b651 <memcpy>
    task[pid].utime=0;
  8050a1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050a4:	48 63 d0             	movsxd rdx,eax
  8050a7:	48 89 d0             	mov    rax,rdx
  8050aa:	48 01 c0             	add    rax,rax
  8050ad:	48 01 d0             	add    rax,rdx
  8050b0:	48 c1 e0 08          	shl    rax,0x8
  8050b4:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8050ba:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  8050c0:	48 8b 0d d9 f3 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f3d9]        # 4144a0 <current>
  8050c7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050ca:	48 63 d0             	movsxd rdx,eax
  8050cd:	48 89 d0             	mov    rax,rdx
  8050d0:	48 01 c0             	add    rax,rax
  8050d3:	48 01 d0             	add    rax,rdx
  8050d6:	48 c1 e0 08          	shl    rax,0x8
  8050da:	48 8d b0 b0 84 40 00 	lea    rsi,[rax+0x4084b0]
  8050e1:	48 8b 41 14          	mov    rax,QWORD PTR [rcx+0x14]
  8050e5:	48 8b 51 1c          	mov    rdx,QWORD PTR [rcx+0x1c]
  8050e9:	48 89 46 04          	mov    QWORD PTR [rsi+0x4],rax
  8050ed:	48 89 56 0c          	mov    QWORD PTR [rsi+0xc],rdx
  8050f1:	48 8b 41 24          	mov    rax,QWORD PTR [rcx+0x24]
  8050f5:	48 8b 51 2c          	mov    rdx,QWORD PTR [rcx+0x2c]
  8050f9:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
  8050fd:	48 89 56 1c          	mov    QWORD PTR [rsi+0x1c],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  805101:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805104:	48 63 d0             	movsxd rdx,eax
  805107:	48 89 d0             	mov    rax,rdx
  80510a:	48 01 c0             	add    rax,rax
  80510d:	48 01 d0             	add    rax,rdx
  805110:	48 c1 e0 08          	shl    rax,0x8
  805114:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80511b:	48 8b 05 7e f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f37e]        # 4144a0 <current>
  805122:	48 89 d6             	mov    rsi,rdx
  805125:	48 89 c7             	mov    rdi,rax
  805128:	e8 18 02 00 00       	call   805345 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  80512d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805130:	48 63 d0             	movsxd rdx,eax
  805133:	48 89 d0             	mov    rax,rdx
  805136:	48 01 c0             	add    rax,rax
  805139:	48 01 d0             	add    rax,rdx
  80513c:	48 c1 e0 08          	shl    rax,0x8
  805140:	48 05 c0 84 40 00    	add    rax,0x4084c0
  805146:	8b 00                	mov    eax,DWORD PTR [rax]
  805148:	2d 00 10 00 00       	sub    eax,0x1000
  80514d:	48 98                	cdqe   
  80514f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805153:	eb 63                	jmp    8051b8 <sys_fork+0x6ba>
        addr_t new_stkpg=vmalloc();
  805155:	b8 00 00 00 00       	mov    eax,0x0
  80515a:	e8 4b c1 ff ff       	call   8012aa <vmalloc>
  80515f:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805163:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805167:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80516b:	ba 00 10 00 00       	mov    edx,0x1000
  805170:	48 89 ce             	mov    rsi,rcx
  805173:	48 89 c7             	mov    rdi,rax
  805176:	e8 d6 64 00 00       	call   80b651 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80517b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80517e:	48 63 d0             	movsxd rdx,eax
  805181:	48 89 d0             	mov    rax,rdx
  805184:	48 01 c0             	add    rax,rax
  805187:	48 01 d0             	add    rax,rdx
  80518a:	48 c1 e0 08          	shl    rax,0x8
  80518e:	48 05 40 85 40 00    	add    rax,0x408540
  805194:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805198:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80519c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8051a0:	48 89 d1             	mov    rcx,rdx
  8051a3:	ba 07 00 00 00       	mov    edx,0x7
  8051a8:	48 89 c7             	mov    rdi,rax
  8051ab:	e8 aa be ff ff       	call   80105a <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8051b0:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  8051b7:	00 
  8051b8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051bb:	48 63 d0             	movsxd rdx,eax
  8051be:	48 89 d0             	mov    rax,rdx
  8051c1:	48 01 c0             	add    rax,rax
  8051c4:	48 01 d0             	add    rax,rdx
  8051c7:	48 c1 e0 08          	shl    rax,0x8
  8051cb:	48 05 bc 84 40 00    	add    rax,0x4084bc
  8051d1:	8b 00                	mov    eax,DWORD PTR [rax]
  8051d3:	48 98                	cdqe   
  8051d5:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8051d9:	0f 83 76 ff ff ff    	jae    805155 <sys_fork+0x657>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  8051df:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  8051e6:	00 
    int f=1;
  8051e7:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8051ee:	e9 89 00 00 00       	jmp    80527c <sys_fork+0x77e>
        addr_t new_stkpg=vmalloc();
  8051f3:	b8 00 00 00 00       	mov    eax,0x0
  8051f8:	e8 ad c0 ff ff       	call   8012aa <vmalloc>
  8051fd:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805201:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805205:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805209:	ba 00 10 00 00       	mov    edx,0x1000
  80520e:	48 89 ce             	mov    rsi,rcx
  805211:	48 89 c7             	mov    rdi,rax
  805214:	e8 38 64 00 00       	call   80b651 <memcpy>
        if(f){
  805219:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80521d:	74 20                	je     80523f <sys_fork+0x741>
            f=0;
  80521f:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805226:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80522a:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805230:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805234:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805238:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80523f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805242:	48 63 d0             	movsxd rdx,eax
  805245:	48 89 d0             	mov    rax,rdx
  805248:	48 01 c0             	add    rax,rax
  80524b:	48 01 d0             	add    rax,rdx
  80524e:	48 c1 e0 08          	shl    rax,0x8
  805252:	48 05 40 85 40 00    	add    rax,0x408540
  805258:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  80525c:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805260:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805264:	48 89 d1             	mov    rcx,rdx
  805267:	ba 07 00 00 00       	mov    edx,0x7
  80526c:	48 89 c7             	mov    rdi,rax
  80526f:	e8 e6 bd ff ff       	call   80105a <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805274:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  80527b:	00 
  80527c:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805283:	00 
  805284:	0f 87 69 ff ff ff    	ja     8051f3 <sys_fork+0x6f5>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  80528a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80528d:	48 63 d0             	movsxd rdx,eax
  805290:	48 89 d0             	mov    rax,rdx
  805293:	48 01 c0             	add    rax,rax
  805296:	48 01 d0             	add    rax,rdx
  805299:	48 c1 e0 08          	shl    rax,0x8
  80529d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8052a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8052a5:	2d 00 10 00 00       	sub    eax,0x1000
  8052aa:	48 98                	cdqe   
  8052ac:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8052b0:	eb 63                	jmp    805315 <sys_fork+0x817>
        addr_t new_hppg=vmalloc();
  8052b2:	b8 00 00 00 00       	mov    eax,0x0
  8052b7:	e8 ee bf ff ff       	call   8012aa <vmalloc>
  8052bc:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8052c0:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8052c4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052c8:	ba 00 10 00 00       	mov    edx,0x1000
  8052cd:	48 89 ce             	mov    rsi,rcx
  8052d0:	48 89 c7             	mov    rdi,rax
  8052d3:	e8 79 63 00 00       	call   80b651 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8052d8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052db:	48 63 d0             	movsxd rdx,eax
  8052de:	48 89 d0             	mov    rax,rdx
  8052e1:	48 01 c0             	add    rax,rax
  8052e4:	48 01 d0             	add    rax,rdx
  8052e7:	48 c1 e0 08          	shl    rax,0x8
  8052eb:	48 05 40 85 40 00    	add    rax,0x408540
  8052f1:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  8052f5:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  8052f9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052fd:	48 89 d1             	mov    rcx,rdx
  805300:	ba 07 00 00 00       	mov    edx,0x7
  805305:	48 89 c7             	mov    rdi,rax
  805308:	e8 4d bd ff ff       	call   80105a <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  80530d:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805314:	00 
  805315:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805318:	48 63 d0             	movsxd rdx,eax
  80531b:	48 89 d0             	mov    rax,rdx
  80531e:	48 01 c0             	add    rax,rax
  805321:	48 01 d0             	add    rax,rdx
  805324:	48 c1 e0 08          	shl    rax,0x8
  805328:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80532e:	8b 00                	mov    eax,DWORD PTR [rax]
  805330:	48 98                	cdqe   
  805332:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805336:	0f 83 76 ff ff ff    	jae    8052b2 <sys_fork+0x7b4>
    }
    //父进程运行到这里
    return pid;
  80533c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  80533f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805343:	c9                   	leave  
  805344:	c3                   	ret    

0000000000805345 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805345:	f3 0f 1e fa          	endbr64 
  805349:	55                   	push   rbp
  80534a:	48 89 e5             	mov    rbp,rsp
  80534d:	48 83 ec 60          	sub    rsp,0x60
  805351:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805355:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805359:	b8 00 00 00 00       	mov    eax,0x0
  80535e:	e8 47 bf ff ff       	call   8012aa <vmalloc>
  805363:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805367:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80536b:	48 8b 80 30 02 00 00 	mov    rax,QWORD PTR [rax+0x230]
  805372:	48 89 c1             	mov    rcx,rax
  805375:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805379:	ba 00 10 00 00       	mov    edx,0x1000
  80537e:	48 89 ce             	mov    rsi,rcx
  805381:	48 89 c7             	mov    rdi,rax
  805384:	e8 c8 62 00 00       	call   80b651 <memcpy>
    to->regs.cr3=pml4p;
  805389:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80538d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805391:	48 89 90 30 02 00 00 	mov    QWORD PTR [rax+0x230],rdx
    to->pml4=pml4p;
  805398:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80539c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8053a0:	48 89 90 ac 00 00 00 	mov    QWORD PTR [rax+0xac],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  8053a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8053ab:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  8053af:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8053b6:	e9 09 03 00 00       	jmp    8056c4 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8053bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053be:	48 98                	cdqe   
  8053c0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053c7:	00 
  8053c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053cc:	48 01 d0             	add    rax,rdx
  8053cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053d2:	83 e0 01             	and    eax,0x1
  8053d5:	48 85 c0             	test   rax,rax
  8053d8:	0f 84 e2 02 00 00    	je     8056c0 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8053de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053e1:	48 98                	cdqe   
  8053e3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053ea:	00 
  8053eb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053ef:	48 01 d0             	add    rax,rdx
  8053f2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053f5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  8053f9:	b8 00 00 00 00       	mov    eax,0x0
  8053fe:	e8 a7 be ff ff       	call   8012aa <vmalloc>
  805403:	48 89 c2             	mov    rdx,rax
  805406:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80540d:	00 ff ff 
  805410:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805414:	48 89 c1             	mov    rcx,rax
  805417:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80541a:	48 98                	cdqe   
  80541c:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805423:	00 
  805424:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805428:	48 01 f0             	add    rax,rsi
  80542b:	48 09 ca             	or     rdx,rcx
  80542e:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805431:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805438:	ff 00 00 
  80543b:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80543f:	48 89 c1             	mov    rcx,rax
  805442:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805445:	48 98                	cdqe   
  805447:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80544e:	00 
  80544f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805453:	48 01 d0             	add    rax,rdx
  805456:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805459:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805460:	ff 00 00 
  805463:	48 21 d0             	and    rax,rdx
  805466:	ba 00 10 00 00       	mov    edx,0x1000
  80546b:	48 89 ce             	mov    rsi,rcx
  80546e:	48 89 c7             	mov    rdi,rax
  805471:	e8 db 61 00 00       	call   80b651 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805476:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805479:	48 98                	cdqe   
  80547b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805482:	00 
  805483:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805487:	48 01 d0             	add    rax,rdx
  80548a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80548d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805494:	ff 00 00 
  805497:	48 21 d0             	and    rax,rdx
  80549a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  80549e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8054a5:	e9 09 02 00 00       	jmp    8056b3 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8054aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054ad:	48 98                	cdqe   
  8054af:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054b6:	00 
  8054b7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054bb:	48 01 d0             	add    rax,rdx
  8054be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054c1:	83 e0 01             	and    eax,0x1
  8054c4:	48 85 c0             	test   rax,rax
  8054c7:	0f 84 e2 01 00 00    	je     8056af <copy_mmap+0x36a>
  8054cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054d0:	48 98                	cdqe   
  8054d2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054d9:	00 
  8054da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054de:	48 01 d0             	add    rax,rdx
  8054e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054e4:	25 80 00 00 00       	and    eax,0x80
  8054e9:	48 85 c0             	test   rax,rax
  8054ec:	0f 85 bd 01 00 00    	jne    8056af <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8054f2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8054f5:	48 98                	cdqe   
  8054f7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054fe:	00 
  8054ff:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805503:	48 01 d0             	add    rax,rdx
  805506:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805509:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  80550d:	b8 00 00 00 00       	mov    eax,0x0
  805512:	e8 93 bd ff ff       	call   8012aa <vmalloc>
  805517:	48 89 c2             	mov    rdx,rax
  80551a:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805521:	00 ff ff 
  805524:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805528:	48 89 c1             	mov    rcx,rax
  80552b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80552e:	48 98                	cdqe   
  805530:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805537:	00 
  805538:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80553c:	48 01 f0             	add    rax,rsi
  80553f:	48 09 ca             	or     rdx,rcx
  805542:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805545:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80554c:	ff 00 00 
  80554f:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805553:	48 89 c1             	mov    rcx,rax
  805556:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805559:	48 98                	cdqe   
  80555b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805562:	00 
  805563:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805567:	48 01 d0             	add    rax,rdx
  80556a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80556d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805574:	ff 00 00 
  805577:	48 21 d0             	and    rax,rdx
  80557a:	ba 00 10 00 00       	mov    edx,0x1000
  80557f:	48 89 ce             	mov    rsi,rcx
  805582:	48 89 c7             	mov    rdi,rax
  805585:	e8 c7 60 00 00       	call   80b651 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  80558a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80558d:	48 98                	cdqe   
  80558f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805596:	00 
  805597:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80559b:	48 01 d0             	add    rax,rdx
  80559e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055a1:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8055a8:	ff 00 00 
  8055ab:	48 21 d0             	and    rax,rdx
  8055ae:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  8055b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8055b9:	e9 e4 00 00 00       	jmp    8056a2 <copy_mmap+0x35d>
                    {
                        if(pde[j]&PAGE_PRESENT&&!(pde[j]&PDE_4MB)){
  8055be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055c1:	48 98                	cdqe   
  8055c3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055ca:	00 
  8055cb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055cf:	48 01 d0             	add    rax,rdx
  8055d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055d5:	83 e0 01             	and    eax,0x1
  8055d8:	48 85 c0             	test   rax,rax
  8055db:	0f 84 bd 00 00 00    	je     80569e <copy_mmap+0x359>
  8055e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055e4:	48 98                	cdqe   
  8055e6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055ed:	00 
  8055ee:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055f2:	48 01 d0             	add    rax,rdx
  8055f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055f8:	25 80 00 00 00       	and    eax,0x80
  8055fd:	48 85 c0             	test   rax,rax
  805600:	0f 85 98 00 00 00    	jne    80569e <copy_mmap+0x359>
                            addr_t old_data3=pde[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805606:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805609:	48 98                	cdqe   
  80560b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805612:	00 
  805613:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805617:	48 01 d0             	add    rax,rdx
  80561a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80561d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[j]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  805621:	b8 00 00 00 00       	mov    eax,0x0
  805626:	e8 7f bc ff ff       	call   8012aa <vmalloc>
  80562b:	48 89 c2             	mov    rdx,rax
  80562e:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805635:	00 ff ff 
  805638:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  80563c:	48 89 c1             	mov    rcx,rax
  80563f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805642:	48 98                	cdqe   
  805644:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80564b:	00 
  80564c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805650:	48 01 f0             	add    rax,rsi
  805653:	48 09 ca             	or     rdx,rcx
  805656:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[j]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805659:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805660:	ff 00 00 
  805663:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805667:	48 89 c1             	mov    rcx,rax
  80566a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80566d:	48 98                	cdqe   
  80566f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805676:	00 
  805677:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80567b:	48 01 d0             	add    rax,rdx
  80567e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805681:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805688:	ff 00 00 
  80568b:	48 21 d0             	and    rax,rdx
  80568e:	ba 00 10 00 00       	mov    edx,0x1000
  805693:	48 89 ce             	mov    rsi,rcx
  805696:	48 89 c7             	mov    rdi,rax
  805699:	e8 b3 5f 00 00       	call   80b651 <memcpy>
                    for(int k=0;k<512;k++)
  80569e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8056a2:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8056a9:	0f 8e 0f ff ff ff    	jle    8055be <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  8056af:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8056b3:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8056ba:	0f 8e ea fd ff ff    	jle    8054aa <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  8056c0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8056c4:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8056cb:	0f 8e ea fc ff ff    	jle    8053bb <copy_mmap+0x76>
                    }
                }
            }
        }
    }
  8056d1:	90                   	nop
  8056d2:	90                   	nop
  8056d3:	c9                   	leave  
  8056d4:	c3                   	ret    
  8056d5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8056dc:	00 00 00 
  8056df:	90                   	nop

00000000008056e0 <outb>:
  8056e0:	66 89 fa             	mov    dx,di
  8056e3:	66 89 f0             	mov    ax,si
  8056e6:	ee                   	out    dx,al
  8056e7:	e8 29 00 00 00       	call   805715 <io_delay>
  8056ec:	c3                   	ret    

00000000008056ed <outw>:
  8056ed:	66 89 fa             	mov    dx,di
  8056f0:	66 89 f0             	mov    ax,si
  8056f3:	66 ef                	out    dx,ax
  8056f5:	90                   	nop
  8056f6:	90                   	nop
  8056f7:	90                   	nop
  8056f8:	c3                   	ret    

00000000008056f9 <inb>:
  8056f9:	31 c0                	xor    eax,eax
  8056fb:	66 89 fa             	mov    dx,di
  8056fe:	ec                   	in     al,dx
  8056ff:	90                   	nop
  805700:	90                   	nop
  805701:	90                   	nop
  805702:	c3                   	ret    

0000000000805703 <inw>:
  805703:	31 c0                	xor    eax,eax
  805705:	66 89 fa             	mov    dx,di
  805708:	66 ed                	in     ax,dx
  80570a:	90                   	nop
  80570b:	90                   	nop
  80570c:	90                   	nop
  80570d:	c3                   	ret    

000000000080570e <eoi>:
  80570e:	b0 20                	mov    al,0x20
  805710:	e6 a0                	out    0xa0,al
  805712:	e6 20                	out    0x20,al
  805714:	c3                   	ret    

0000000000805715 <io_delay>:
  805715:	90                   	nop
  805716:	90                   	nop
  805717:	90                   	nop
  805718:	90                   	nop
  805719:	c3                   	ret    

000000000080571a <turn_on_int>:
  80571a:	b0 f8                	mov    al,0xf8
  80571c:	e6 21                	out    0x21,al
  80571e:	e8 f2 ff ff ff       	call   805715 <io_delay>
  805723:	b0 af                	mov    al,0xaf
  805725:	e6 a1                	out    0xa1,al
  805727:	e8 e9 ff ff ff       	call   805715 <io_delay>
  80572c:	b8 00 70 10 00       	mov    eax,0x107000
  805731:	0f 01 18             	lidt   [rax]
  805734:	90                   	nop
  805735:	90                   	nop
  805736:	90                   	nop
  805737:	90                   	nop
  805738:	c3                   	ret    

0000000000805739 <report_back_trace_of_err>:
  805739:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80573e:	50                   	push   rax
  80573f:	68 48 57 80 00       	push   0x805748
  805744:	83 c4 08             	add    esp,0x8
  805747:	c3                   	ret    

0000000000805748 <bt_msg>:
  805748:	65 72 72             	gs jb  8057bd <fill_desc+0x4e>
  80574b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80574c:	72 20                	jb     80576e <init_gdt+0x11>
  80574e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80574f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805752:	72 73                	jb     8057c7 <fill_desc+0x58>
  805754:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805757:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb3d5 <_knl_end+0x2eb3d5>

000000000080575d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80575d:	f3 0f 1e fa          	endbr64 
  805761:	55                   	push   rbp
  805762:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805765:	66 b8 48 00          	mov    ax,0x48
  805769:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80576c:	90                   	nop
  80576d:	5d                   	pop    rbp
  80576e:	c3                   	ret    

000000000080576f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80576f:	f3 0f 1e fa          	endbr64 
  805773:	55                   	push   rbp
  805774:	48 89 e5             	mov    rbp,rsp
  805777:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80577b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80577f:	89 d0                	mov    eax,edx
  805781:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805784:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805788:	48 8b 15 f9 68 00 00 	mov    rdx,QWORD PTR [rip+0x68f9]        # 80c088 <gdt>
  80578f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805792:	48 c1 e0 04          	shl    rax,0x4
  805796:	48 01 d0             	add    rax,rdx
  805799:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80579d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  8057a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8057a5:	48 c1 e8 10          	shr    rax,0x10
  8057a9:	48 89 c1             	mov    rcx,rax
  8057ac:	48 8b 15 d5 68 00 00 	mov    rdx,QWORD PTR [rip+0x68d5]        # 80c088 <gdt>
  8057b3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057b6:	48 c1 e0 04          	shl    rax,0x4
  8057ba:	48 01 d0             	add    rax,rdx
  8057bd:	89 ca                	mov    edx,ecx
  8057bf:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  8057c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8057c6:	48 c1 e8 18          	shr    rax,0x18
  8057ca:	48 89 c1             	mov    rcx,rax
  8057cd:	48 8b 15 b4 68 00 00 	mov    rdx,QWORD PTR [rip+0x68b4]        # 80c088 <gdt>
  8057d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057d7:	48 c1 e0 04          	shl    rax,0x4
  8057db:	48 01 d0             	add    rax,rdx
  8057de:	89 ca                	mov    edx,ecx
  8057e0:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  8057e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8057e7:	48 c1 e8 20          	shr    rax,0x20
  8057eb:	48 89 c2             	mov    rdx,rax
  8057ee:	48 8b 0d 93 68 00 00 	mov    rcx,QWORD PTR [rip+0x6893]        # 80c088 <gdt>
  8057f5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8057f8:	48 c1 e0 04          	shl    rax,0x4
  8057fc:	48 01 c8             	add    rax,rcx
  8057ff:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805802:	48 8b 15 7f 68 00 00 	mov    rdx,QWORD PTR [rip+0x687f]        # 80c088 <gdt>
  805809:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80580c:	48 c1 e0 04          	shl    rax,0x4
  805810:	48 01 d0             	add    rax,rdx
  805813:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805817:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80581a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80581e:	48 c1 e8 08          	shr    rax,0x8
  805822:	66 25 f0 00          	and    ax,0xf0
  805826:	48 8b 0d 5b 68 00 00 	mov    rcx,QWORD PTR [rip+0x685b]        # 80c088 <gdt>
  80582d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805830:	48 c1 e2 04          	shl    rdx,0x4
  805834:	48 01 ca             	add    rdx,rcx
  805837:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80583b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80583f:	90                   	nop
  805840:	5d                   	pop    rbp
  805841:	c3                   	ret    

0000000000805842 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805842:	f3 0f 1e fa          	endbr64 
  805846:	55                   	push   rbp
  805847:	48 89 e5             	mov    rbp,rsp
  80584a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80584d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805850:	89 c8                	mov    eax,ecx
  805852:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805856:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80585a:	48 8b 05 27 68 00 00 	mov    rax,QWORD PTR [rip+0x6827]        # 80c088 <gdt>
  805861:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805865:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805868:	48 c1 e0 04          	shl    rax,0x4
  80586c:	48 89 c2             	mov    rdx,rax
  80586f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805873:	48 01 d0             	add    rax,rdx
  805876:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805879:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80587c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80587f:	48 c1 e0 04          	shl    rax,0x4
  805883:	48 89 c2             	mov    rdx,rax
  805886:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80588a:	48 01 d0             	add    rax,rdx
  80588d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805890:	c1 ea 10             	shr    edx,0x10
  805893:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805896:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805899:	48 c1 e0 04          	shl    rax,0x4
  80589d:	48 89 c2             	mov    rdx,rax
  8058a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8058a4:	48 01 c2             	add    rdx,rax
  8058a7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  8058ab:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8058af:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058b2:	48 c1 e0 04          	shl    rax,0x4
  8058b6:	48 89 c2             	mov    rdx,rax
  8058b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8058bd:	48 01 c2             	add    rdx,rax
  8058c0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8058c4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8058c8:	90                   	nop
  8058c9:	5d                   	pop    rbp
  8058ca:	c3                   	ret    

00000000008058cb <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8058cb:	f3 0f 1e fa          	endbr64 
  8058cf:	55                   	push   rbp
  8058d0:	48 89 e5             	mov    rbp,rsp
  8058d3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8058d6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8058d9:	89 d0                	mov    eax,edx
  8058db:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8058df:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8058e3:	90                   	nop
  8058e4:	5d                   	pop    rbp
  8058e5:	c3                   	ret    
  8058e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8058ed:	00 00 00 

00000000008058f0 <fill_desc>:
  8058f0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8058f5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8058fa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8058ff:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805904:	be 00 60 00 00       	mov    esi,0x6000
  805909:	c1 e2 03             	shl    edx,0x3
  80590c:	01 d6                	add    esi,edx
  80590e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805912:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805917:	c1 e8 10             	shr    eax,0x10
  80591a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80591e:	c1 eb 10             	shr    ebx,0x10
  805921:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805925:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805929:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80592d:	c3                   	ret    

000000000080592e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80592e:	f3 0f 1e fa          	endbr64 
  805932:	55                   	push   rbp
  805933:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805936:	b8 00 00 00 00       	mov    eax,0x0
  80593b:	e8 01 24 00 00       	call   807d41 <execute_request>
    do_req();
  805940:	b8 00 00 00 00       	mov    eax,0x0
  805945:	e8 d2 d9 ff ff       	call   80331c <do_req>
    if(!manage_proc_lock)
  80594a:	8b 05 d8 66 00 00    	mov    eax,DWORD PTR [rip+0x66d8]        # 80c028 <manage_proc_lock>
  805950:	85 c0                	test   eax,eax
  805952:	75 0a                	jne    80595e <clock_c+0x30>
    {
        manage_proc();
  805954:	b8 00 00 00 00       	mov    eax,0x0
  805959:	e8 0f e2 ff ff       	call   803b6d <manage_proc>
    }
    //puts("1 disk req executed.");
  80595e:	90                   	nop
  80595f:	5d                   	pop    rbp
  805960:	c3                   	ret    
  805961:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805968:	00 00 00 
  80596b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805970 <clock>:
  805970:	50                   	push   rax
  805971:	53                   	push   rbx
  805972:	51                   	push   rcx
  805973:	52                   	push   rdx
  805974:	57                   	push   rdi
  805975:	56                   	push   rsi
  805976:	41 50                	push   r8
  805978:	41 51                	push   r9
  80597a:	41 52                	push   r10
  80597c:	41 53                	push   r11
  80597e:	41 54                	push   r12
  805980:	41 55                	push   r13
  805982:	41 56                	push   r14
  805984:	41 57                	push   r15
  805986:	e8 ba e1 ff ff       	call   803b45 <save_rsp>
  80598b:	66 8c c0             	mov    ax,es
  80598e:	50                   	push   rax
  80598f:	66 8c d8             	mov    ax,ds
  805992:	50                   	push   rax
  805993:	66 b8 10 00          	mov    ax,0x10
  805997:	8e c0                	mov    es,eax
  805999:	8e d8                	mov    ds,eax

000000000080599b <clock.normal_part>:
  80599b:	b0 20                	mov    al,0x20
  80599d:	e6 a0                	out    0xa0,al
  80599f:	e6 20                	out    0x20,al
  8059a1:	e8 88 ff ff ff       	call   80592e <clock_c>
  8059a6:	58                   	pop    rax
  8059a7:	8e d8                	mov    ds,eax
  8059a9:	58                   	pop    rax
  8059aa:	8e c0                	mov    es,eax
  8059ac:	41 5f                	pop    r15
  8059ae:	41 5e                	pop    r14
  8059b0:	41 5d                	pop    r13
  8059b2:	41 5c                	pop    r12
  8059b4:	41 5b                	pop    r11
  8059b6:	41 5a                	pop    r10
  8059b8:	41 59                	pop    r9
  8059ba:	41 58                	pop    r8
  8059bc:	5e                   	pop    rsi
  8059bd:	5f                   	pop    rdi
  8059be:	5a                   	pop    rdx
  8059bf:	59                   	pop    rcx
  8059c0:	5b                   	pop    rbx
  8059c1:	58                   	pop    rax
  8059c2:	48 cf                	iretq  

00000000008059c4 <sys_execve>:
    return ind;
}
*/

int sys_execve(char *path, char *argv)
{
  8059c4:	f3 0f 1e fa          	endbr64 
  8059c8:	55                   	push   rbp
  8059c9:	48 89 e5             	mov    rbp,rsp
  8059cc:	48 83 ec 30          	sub    rsp,0x30
  8059d0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8059d4:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  8059d8:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  8059df:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  8059e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059ea:	be 00 10 00 00       	mov    esi,0x1000
  8059ef:	48 89 c7             	mov    rdi,rax
  8059f2:	e8 69 14 00 00       	call   806e60 <sys_open>
  8059f7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  8059fa:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8059fe:	79 0a                	jns    805a0a <sys_execve+0x46>
  805a00:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a05:	e9 ba 00 00 00       	jmp    805ac4 <sys_execve+0x100>
    //
    char *p=path;
  805a0a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a0e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805a12:	eb 05                	jmp    805a19 <sys_execve+0x55>
  805a14:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805a19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a1d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a20:	84 c0                	test   al,al
  805a22:	75 f0                	jne    805a14 <sys_execve+0x50>
    for(;*p!='/'&&p>path;p--);
  805a24:	eb 05                	jmp    805a2b <sys_execve+0x67>
  805a26:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805a2b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a32:	3c 2f                	cmp    al,0x2f
  805a34:	74 0a                	je     805a40 <sys_execve+0x7c>
  805a36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a3a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805a3e:	77 e6                	ja     805a26 <sys_execve+0x62>
    if(p>path)
  805a40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a44:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805a48:	76 2f                	jbe    805a79 <sys_execve+0xb5>
    {
        *p='\0';
  805a4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a4e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805a51:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a55:	be 00 40 00 00       	mov    esi,0x4000
  805a5a:	48 89 c7             	mov    rdi,rax
  805a5d:	e8 fe 13 00 00       	call   806e60 <sys_open>
  805a62:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805a65:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a69:	79 07                	jns    805a72 <sys_execve+0xae>
  805a6b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a70:	eb 52                	jmp    805ac4 <sys_execve+0x100>
        *p='/';
  805a72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a76:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805a79:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a7c:	48 63 d0             	movsxd rdx,eax
  805a7f:	48 89 d0             	mov    rax,rdx
  805a82:	48 c1 e0 02          	shl    rax,0x2
  805a86:	48 01 d0             	add    rax,rdx
  805a89:	48 c1 e0 03          	shl    rax,0x3
  805a8d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805a94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a97:	48 63 c8             	movsxd rcx,eax
  805a9a:	48 89 c8             	mov    rax,rcx
  805a9d:	48 c1 e0 02          	shl    rax,0x2
  805aa1:	48 01 c8             	add    rax,rcx
  805aa4:	48 c1 e0 03          	shl    rax,0x3
  805aa8:	48 05 60 06 40 00    	add    rax,0x400660
  805aae:	b9 41 5b 80 00       	mov    ecx,0x805b41
  805ab3:	48 89 c6             	mov    rsi,rax
  805ab6:	48 89 cf             	mov    rdi,rcx
  805ab9:	e8 80 e9 ff ff       	call   80443e <reg_proc>
  805abe:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805ac1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805ac4:	c9                   	leave  
  805ac5:	c3                   	ret    

0000000000805ac6 <exec_call>:

int exec_call(char *path)
{
  805ac6:	f3 0f 1e fa          	endbr64 
  805aca:	55                   	push   rbp
  805acb:	48 89 e5             	mov    rbp,rsp
  805ace:	48 83 ec 20          	sub    rsp,0x20
  805ad2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= sys_execve(path, NULL);
  805ad6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ada:	be 00 00 00 00       	mov    esi,0x0
  805adf:	48 89 c7             	mov    rdi,rax
  805ae2:	e8 dd fe ff ff       	call   8059c4 <sys_execve>
  805ae7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805aea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805aed:	01 c0                	add    eax,eax
  805aef:	83 c0 05             	add    eax,0x5
  805af2:	c1 e0 03             	shl    eax,0x3
  805af5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805af8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805afb:	89 c7                	mov    edi,eax
  805afd:	e8 37 e2 ff ff       	call   803d39 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805b02:	90                   	nop
  805b03:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b06:	48 63 d0             	movsxd rdx,eax
  805b09:	48 89 d0             	mov    rax,rdx
  805b0c:	48 01 c0             	add    rax,rax
  805b0f:	48 01 d0             	add    rax,rdx
  805b12:	48 c1 e0 08          	shl    rax,0x8
  805b16:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805b1c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805b1f:	83 f8 03             	cmp    eax,0x3
  805b22:	75 df                	jne    805b03 <exec_call+0x3d>
    return task[pi].exit_code;
  805b24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b27:	48 63 d0             	movsxd rdx,eax
  805b2a:	48 89 d0             	mov    rax,rdx
  805b2d:	48 01 c0             	add    rax,rax
  805b30:	48 01 d0             	add    rax,rdx
  805b33:	48 c1 e0 08          	shl    rax,0x8
  805b37:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805b3d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805b3f:	c9                   	leave  
  805b40:	c3                   	ret    

0000000000805b41 <proc_start>:
int proc_start()
{
  805b41:	f3 0f 1e fa          	endbr64 
  805b45:	55                   	push   rbp
  805b46:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805b49:	8b 05 dd e9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e9dd]        # 41452c <cur_proc>
  805b4f:	48 63 d0             	movsxd rdx,eax
  805b52:	48 89 d0             	mov    rax,rdx
  805b55:	48 01 c0             	add    rax,rax
  805b58:	48 01 d0             	add    rax,rdx
  805b5b:	48 c1 e0 08          	shl    rax,0x8
  805b5f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805b65:	48 89 c7             	mov    rdi,rax
  805b68:	e8 0d 00 00 00       	call   805b7a <load_pe>
    //释放进程资源
    sys_exit(0);
  805b6d:	bf 00 00 00 00       	mov    edi,0x0
  805b72:	e8 9f e8 ff ff       	call   804416 <sys_exit>
}
  805b77:	90                   	nop
  805b78:	5d                   	pop    rbp
  805b79:	c3                   	ret    

0000000000805b7a <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  805b7a:	f3 0f 1e fa          	endbr64 
  805b7e:	55                   	push   rbp
  805b7f:	48 89 e5             	mov    rbp,rsp
  805b82:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805b89:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  805b90:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805b97:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805b9e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  805ba2:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805ba9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805bb0:	eb 28                	jmp    805bda <load_pe+0x60>
        if(current->openf[i]==f)
  805bb2:	48 8b 05 e7 e8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e8e7]        # 4144a0 <current>
  805bb9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805bbc:	48 63 d2             	movsxd rdx,edx
  805bbf:	48 83 c2 18          	add    rdx,0x18
  805bc3:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  805bc8:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  805bcc:	75 08                	jne    805bd6 <load_pe+0x5c>
        {
            exefno=i;
  805bce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805bd1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  805bd4:	eb 0a                	jmp    805be0 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805bd6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805bda:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  805bde:	7e d2                	jle    805bb2 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  805be0:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805be4:	75 0a                	jne    805bf0 <load_pe+0x76>
  805be6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805beb:	e9 11 07 00 00       	jmp    806301 <load_pe+0x787>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  805bf0:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  805bf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bfa:	ba 44 00 00 00       	mov    edx,0x44
  805bff:	48 89 ce             	mov    rsi,rcx
  805c02:	89 c7                	mov    edi,eax
  805c04:	e8 26 16 00 00       	call   80722f <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  805c09:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  805c10:	48 89 c1             	mov    rcx,rax
  805c13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c16:	ba 00 00 00 00       	mov    edx,0x0
  805c1b:	48 89 ce             	mov    rsi,rcx
  805c1e:	89 c7                	mov    edi,eax
  805c20:	e8 6a 17 00 00       	call   80738f <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  805c25:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805c2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c2f:	ba 0c 01 00 00       	mov    edx,0x10c
  805c34:	48 89 ce             	mov    rsi,rcx
  805c37:	89 c7                	mov    edi,eax
  805c39:	e8 f1 15 00 00       	call   80722f <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  805c3e:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  805c45:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805c49:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  805c4f:	c1 e8 0c             	shr    eax,0xc
  805c52:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  805c55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c58:	ba 00 00 00 00       	mov    edx,0x0
  805c5d:	be 00 00 00 00       	mov    esi,0x0
  805c62:	89 c7                	mov    edi,eax
  805c64:	e8 26 17 00 00       	call   80738f <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805c69:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  805c6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c70:	ba 00 10 00 00       	mov    edx,0x1000
  805c75:	48 89 ce             	mov    rsi,rcx
  805c78:	89 c7                	mov    edi,eax
  805c7a:	e8 b0 15 00 00       	call   80722f <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  805c7f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c83:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  805c87:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805c8b:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  805c8f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805c93:	48 01 d0             	add    rax,rdx
  805c96:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805c9d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ca4:	48 83 c0 04          	add    rax,0x4
  805ca8:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805caf:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805cb6:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805cb9:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  805cbf:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  805cc5:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  805ccb:	85 c0                	test   eax,eax
  805ccd:	0f 48 c2             	cmovs  eax,edx
  805cd0:	c1 f8 0c             	sar    eax,0xc
  805cd3:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805cd9:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805ce0:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  805ce3:	89 c2                	mov    edx,eax
  805ce5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805ce9:	48 01 d0             	add    rax,rdx
  805cec:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805cf3:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805cf9:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  805cff:	85 c0                	test   eax,eax
  805d01:	0f 48 c2             	cmovs  eax,edx
  805d04:	c1 f8 0a             	sar    eax,0xa
  805d07:	89 c1                	mov    ecx,eax
  805d09:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  805d0f:	99                   	cdq    
  805d10:	c1 ea 16             	shr    edx,0x16
  805d13:	01 d0                	add    eax,edx
  805d15:	25 ff 03 00 00       	and    eax,0x3ff
  805d1a:	29 d0                	sub    eax,edx
  805d1c:	01 c8                	add    eax,ecx
  805d1e:	85 c0                	test   eax,eax
  805d20:	0f 95 c0             	setne  al
  805d23:	0f b6 c0             	movzx  eax,al
  805d26:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805d2c:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805d33:	48 c1 e8 15          	shr    rax,0x15
  805d37:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  805d3d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d44:	89 c0                	mov    eax,eax
  805d46:	48 05 0c 01 00 00    	add    rax,0x10c
  805d4c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805d50:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d57:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805d5b:	0f b7 d0             	movzx  edx,ax
  805d5e:	89 d0                	mov    eax,edx
  805d60:	c1 e0 02             	shl    eax,0x2
  805d63:	01 d0                	add    eax,edx
  805d65:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805d68:	05 50 01 00 00       	add    eax,0x150
  805d6d:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  805d73:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805d7a:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805d7d:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805d83:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d89:	99                   	cdq    
  805d8a:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805d90:	89 d0                	mov    eax,edx
  805d92:	85 c0                	test   eax,eax
  805d94:	74 23                	je     805db9 <load_pe+0x23f>
  805d96:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805d9c:	99                   	cdq    
  805d9d:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  805da3:	89 d1                	mov    ecx,edx
  805da5:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805dab:	29 c8                	sub    eax,ecx
  805dad:	89 c2                	mov    edx,eax
  805daf:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805db5:	01 d0                	add    eax,edx
  805db7:	eb 06                	jmp    805dbf <load_pe+0x245>
  805db9:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  805dbf:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805dc5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805dcc:	eb 6b                	jmp    805e39 <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805dce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805dd2:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805dd5:	25 00 00 00 02       	and    eax,0x2000000
  805dda:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  805de0:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  805de7:	75 46                	jne    805e2f <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  805de9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ded:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805df0:	89 c1                	mov    ecx,eax
  805df2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805df5:	ba 00 00 00 00       	mov    edx,0x0
  805dfa:	48 89 ce             	mov    rsi,rcx
  805dfd:	89 c7                	mov    edi,eax
  805dff:	e8 8b 15 00 00       	call   80738f <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  805e04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e08:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805e0b:	89 c2                	mov    edx,eax
  805e0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e11:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e14:	89 c1                	mov    ecx,eax
  805e16:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e1a:	48 01 c8             	add    rax,rcx
  805e1d:	48 89 c1             	mov    rcx,rax
  805e20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e23:	48 89 ce             	mov    rsi,rcx
  805e26:	89 c7                	mov    edi,eax
  805e28:	e8 02 14 00 00       	call   80722f <sys_read>
  805e2d:	eb 01                	jmp    805e30 <load_pe+0x2b6>
            continue;
  805e2f:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805e30:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805e34:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805e39:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805e40:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805e44:	0f b7 c0             	movzx  eax,ax
  805e47:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805e4a:	7c 82                	jl     805dce <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805e4c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805e53:	48 05 90 00 00 00    	add    rax,0x90
  805e59:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  805e60:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e67:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805e6a:	85 c0                	test   eax,eax
  805e6c:	0f 84 7b 02 00 00    	je     8060ed <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805e72:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  805e79:	8b 10                	mov    edx,DWORD PTR [rax]
  805e7b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805e7f:	01 d0                	add    eax,edx
  805e81:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805e87:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  805e8d:	48 98                	cdqe   
  805e8f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805e93:	e9 47 02 00 00       	jmp    8060df <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805e98:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e9c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e9f:	89 c2                	mov    edx,eax
  805ea1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805ea5:	48 01 d0             	add    rax,rdx
  805ea8:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805eaf:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  805eb6:	be 8f 3c 81 00       	mov    esi,0x813c8f
  805ebb:	48 89 c7             	mov    rdi,rax
  805ebe:	e8 2c 5a 00 00       	call   80b8ef <strcmp>
  805ec3:	85 c0                	test   eax,eax
  805ec5:	75 09                	jne    805ed0 <load_pe+0x356>
            {
                dllp=0x1c00000;
  805ec7:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805ece:	eb 25                	jmp    805ef5 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805ed0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805ed7:	48 89 c7             	mov    rdi,rax
  805eda:	e8 9b fc ff ff       	call   805b7a <load_pe>
  805edf:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805ee5:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  805eeb:	89 c7                	mov    edi,eax
  805eed:	e8 11 04 00 00       	call   806303 <get_module_addr>
  805ef2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805ef5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ef8:	48 98                	cdqe   
  805efa:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805f01:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f04:	48 63 d0             	movsxd rdx,eax
  805f07:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  805f0e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805f12:	48 01 d0             	add    rax,rdx
  805f15:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  805f1c:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805f23:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  805f29:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f2c:	01 d0                	add    eax,edx
  805f2e:	89 c0                	mov    eax,eax
  805f30:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  805f37:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f3e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805f41:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805f47:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f4e:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805f51:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f54:	01 d0                	add    eax,edx
  805f56:	89 c0                	mov    eax,eax
  805f58:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805f5f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f66:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805f69:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f6c:	01 d0                	add    eax,edx
  805f6e:	89 c0                	mov    eax,eax
  805f70:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805f77:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f7e:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805f81:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f84:	01 d0                	add    eax,edx
  805f86:	89 c0                	mov    eax,eax
  805f88:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805f8f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805f96:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805f99:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805f9f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805fa3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805fa6:	89 c2                	mov    edx,eax
  805fa8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805fac:	48 01 d0             	add    rax,rdx
  805faf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805fb3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805fb7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805fba:	89 c2                	mov    edx,eax
  805fbc:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805fc0:	48 01 d0             	add    rax,rdx
  805fc3:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805fc7:	e9 00 01 00 00       	jmp    8060cc <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805fcc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fd0:	8b 00                	mov    eax,DWORD PTR [rax]
  805fd2:	85 c0                	test   eax,eax
  805fd4:	79 43                	jns    806019 <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805fd6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fda:	8b 00                	mov    eax,DWORD PTR [rax]
  805fdc:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805fe1:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  805fe7:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805fed:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  805ff3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805ffa:	00 
  805ffb:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806002:	48 01 d0             	add    rax,rdx
  806005:	8b 10                	mov    edx,DWORD PTR [rax]
  806007:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80600a:	01 d0                	add    eax,edx
  80600c:	89 c2                	mov    edx,eax
  80600e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806012:	89 10                	mov    DWORD PTR [rax],edx
  806014:	e9 a9 00 00 00       	jmp    8060c2 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  806019:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80601d:	8b 00                	mov    eax,DWORD PTR [rax]
  80601f:	89 c0                	mov    eax,eax
  806021:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806028:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  80602f:	02 
                    int i=0;
  806030:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  806037:	eb 7a                	jmp    8060b3 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  806039:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80603c:	48 98                	cdqe   
  80603e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806045:	00 
  806046:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80604d:	48 01 d0             	add    rax,rdx
  806050:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806053:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80605a:	48 89 d6             	mov    rsi,rdx
  80605d:	48 89 c7             	mov    rdi,rax
  806060:	e8 8a 58 00 00       	call   80b8ef <strcmp>
  806065:	85 c0                	test   eax,eax
  806067:	75 46                	jne    8060af <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  806069:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80606c:	48 98                	cdqe   
  80606e:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806072:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  806079:	48 01 d0             	add    rax,rdx
  80607c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80607f:	98                   	cwde   
  806080:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  806086:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80608c:	48 98                	cdqe   
  80608e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806095:	00 
  806096:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80609d:	48 01 d0             	add    rax,rdx
  8060a0:	8b 10                	mov    edx,DWORD PTR [rax]
  8060a2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8060a5:	01 d0                	add    eax,edx
  8060a7:	89 c2                	mov    edx,eax
  8060a9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060ad:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8060af:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8060b3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8060b6:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8060bc:	0f 8c 77 ff ff ff    	jl     806039 <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8060c2:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8060c7:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8060cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8060d2:	85 c0                	test   eax,eax
  8060d4:	0f 85 f2 fe ff ff    	jne    805fcc <load_pe+0x452>
            }
            impdes++;
  8060da:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8060df:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8060e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8060e5:	85 c0                	test   eax,eax
  8060e7:	0f 85 ab fd ff ff    	jne    805e98 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8060ed:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8060f4:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8060f5:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060fc:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806102:	85 c0                	test   eax,eax
  806104:	0f 84 ec 00 00 00    	je     8061f6 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80610a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806111:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  806117:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80611b:	01 d0                	add    eax,edx
  80611d:	89 c0                	mov    eax,eax
  80611f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806123:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806127:	48 83 c0 40          	add    rax,0x40
  80612b:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  80612f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806133:	48 83 c0 02          	add    rax,0x2
  806137:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80613b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806142:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806146:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80614c:	e9 97 00 00 00       	jmp    8061e8 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806151:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806155:	8b 10                	mov    edx,DWORD PTR [rax]
  806157:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80615b:	01 d0                	add    eax,edx
  80615d:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806163:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80616a:	eb 5a                	jmp    8061c6 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80616c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806170:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806173:	66 85 c0             	test   ax,ax
  806176:	74 49                	je     8061c1 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806178:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80617c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80617f:	0f b7 d0             	movzx  edx,ax
  806182:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  806188:	01 d0                	add    eax,edx
  80618a:	48 98                	cdqe   
  80618c:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  806193:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  80619a:	8b 00                	mov    eax,DWORD PTR [rax]
  80619c:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8061a2:	89 c2                	mov    edx,eax
  8061a4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8061a8:	01 d0                	add    eax,edx
  8061aa:	89 c2                	mov    edx,eax
  8061ac:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8061b3:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8061b5:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8061ba:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8061bf:	eb 01                	jmp    8061c2 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8061c1:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8061c2:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8061c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061ca:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8061cd:	c1 e8 02             	shr    eax,0x2
  8061d0:	89 c2                	mov    edx,eax
  8061d2:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8061d5:	39 c2                	cmp    edx,eax
  8061d7:	77 93                	ja     80616c <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8061d9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061dd:	05 00 10 00 00       	add    eax,0x1000
  8061e2:	48 98                	cdqe   
  8061e4:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8061e8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8061ee:	85 c0                	test   eax,eax
  8061f0:	0f 85 5b ff ff ff    	jne    806151 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8061f6:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8061fd:	00 00 00 
  806200:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  806207:	00 00 00 
  80620a:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806211:	00 00 00 00 
  806215:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80621c:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806220:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  806227:	ba 18 00 00 00       	mov    edx,0x18
  80622c:	48 89 c6             	mov    rsi,rax
  80622f:	bf 00 00 00 01       	mov    edi,0x1000000
  806234:	e8 18 54 00 00       	call   80b651 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  806239:	8b 05 ed e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2ed]        # 41452c <cur_proc>
  80623f:	48 63 d0             	movsxd rdx,eax
  806242:	48 89 d0             	mov    rax,rdx
  806245:	48 01 c0             	add    rax,rax
  806248:	48 01 d0             	add    rax,rdx
  80624b:	48 c1 e0 08          	shl    rax,0x8
  80624f:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806255:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  80625c:	8b 05 ca e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2ca]        # 41452c <cur_proc>
  806262:	48 63 d0             	movsxd rdx,eax
  806265:	48 89 d0             	mov    rax,rdx
  806268:	48 01 c0             	add    rax,rax
  80626b:	48 01 d0             	add    rax,rdx
  80626e:	48 c1 e0 08          	shl    rax,0x8
  806272:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806278:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  80627f:	8b 05 a7 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2a7]        # 41452c <cur_proc>
  806285:	48 63 d0             	movsxd rdx,eax
  806288:	48 89 d0             	mov    rax,rdx
  80628b:	48 01 c0             	add    rax,rax
  80628e:	48 01 d0             	add    rax,rdx
  806291:	48 c1 e0 08          	shl    rax,0x8
  806295:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80629b:	c7 40 10 00 f0 ff ff 	mov    DWORD PTR [rax+0x10],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8062a2:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8062a9:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8062b0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8062b7:	be 00 00 00 00       	mov    esi,0x0
  8062bc:	bf 00 00 00 00       	mov    edi,0x0
  8062c1:	ff d0                	call   rax
  8062c3:	8b 15 63 e2 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0e263]        # 41452c <cur_proc>
  8062c9:	89 c1                	mov    ecx,eax
  8062cb:	48 63 d2             	movsxd rdx,edx
  8062ce:	48 89 d0             	mov    rax,rdx
  8062d1:	48 01 c0             	add    rax,rax
  8062d4:	48 01 d0             	add    rax,rdx
  8062d7:	48 c1 e0 08          	shl    rax,0x8
  8062db:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8062e1:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  8062e3:	8b 05 43 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e243]        # 41452c <cur_proc>
  8062e9:	48 63 d0             	movsxd rdx,eax
  8062ec:	48 89 d0             	mov    rax,rdx
  8062ef:	48 01 c0             	add    rax,rax
  8062f2:	48 01 d0             	add    rax,rdx
  8062f5:	48 c1 e0 08          	shl    rax,0x8
  8062f9:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8062ff:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806301:	c9                   	leave  
  806302:	c3                   	ret    

0000000000806303 <get_module_addr>:

int get_module_addr(int mi)
{
  806303:	f3 0f 1e fa          	endbr64 
  806307:	55                   	push   rbp
  806308:	48 89 e5             	mov    rbp,rsp
  80630b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80630e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806311:	48 98                	cdqe   
  806313:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  80631a:	5d                   	pop    rbp
  80631b:	c3                   	ret    

000000000080631c <dispose_library>:
int dispose_library(int dlln)
{
  80631c:	f3 0f 1e fa          	endbr64 
  806320:	55                   	push   rbp
  806321:	48 89 e5             	mov    rbp,rsp
  806324:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  806327:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80632b:	78 09                	js     806336 <dispose_library+0x1a>
  80632d:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806334:	7e 07                	jle    80633d <dispose_library+0x21>
  806336:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80633b:	eb 1d                	jmp    80635a <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80633d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806340:	48 98                	cdqe   
  806342:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  806349:	48 05 48 45 41 00    	add    rax,0x414548
  80634f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  806355:	b8 00 00 00 00       	mov    eax,0x0
}
  80635a:	5d                   	pop    rbp
  80635b:	c3                   	ret    

000000000080635c <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80635c:	f3 0f 1e fa          	endbr64 
  806360:	55                   	push   rbp
  806361:	48 89 e5             	mov    rbp,rsp
  806364:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806368:	90                   	nop
  806369:	5d                   	pop    rbp
  80636a:	c3                   	ret    

000000000080636b <sys_rmmod>:
int sys_rmmod(char *name)
{
  80636b:	f3 0f 1e fa          	endbr64 
  80636f:	55                   	push   rbp
  806370:	48 89 e5             	mov    rbp,rsp
  806373:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806377:	90                   	nop
  806378:	5d                   	pop    rbp
  806379:	c3                   	ret    
  80637a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000806380 <_syscall>:
  806380:	55                   	push   rbp
  806381:	bd 00 80 10 00       	mov    ebp,0x108000
  806386:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80638a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80638e:	50                   	push   rax
  80638f:	53                   	push   rbx
  806390:	51                   	push   rcx
  806391:	52                   	push   rdx
  806392:	57                   	push   rdi
  806393:	56                   	push   rsi
  806394:	41 50                	push   r8
  806396:	41 51                	push   r9
  806398:	41 52                	push   r10
  80639a:	41 53                	push   r11
  80639c:	41 54                	push   r12
  80639e:	41 55                	push   r13
  8063a0:	41 56                	push   r14
  8063a2:	41 57                	push   r15
  8063a4:	66 8c c0             	mov    ax,es
  8063a7:	50                   	push   rax
  8063a8:	66 8c d8             	mov    ax,ds
  8063ab:	50                   	push   rax
  8063ac:	66 b8 10 00          	mov    ax,0x10
  8063b0:	8e c0                	mov    es,eax
  8063b2:	8e d8                	mov    ds,eax
  8063b4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8063b9:	41 53                	push   r11
  8063bb:	51                   	push   rcx
  8063bc:	49 87 ca             	xchg   r10,rcx
  8063bf:	e8 d6 a1 ff ff       	call   80059a <syscall>
  8063c4:	4c 87 d1             	xchg   rcx,r10
  8063c7:	59                   	pop    rcx
  8063c8:	41 5b                	pop    r11
  8063ca:	58                   	pop    rax
  8063cb:	8e d8                	mov    ds,eax
  8063cd:	58                   	pop    rax
  8063ce:	8e c0                	mov    es,eax
  8063d0:	41 5f                	pop    r15
  8063d2:	41 5e                	pop    r14
  8063d4:	41 5d                	pop    r13
  8063d6:	41 5c                	pop    r12
  8063d8:	41 5b                	pop    r11
  8063da:	41 5a                	pop    r10
  8063dc:	41 59                	pop    r9
  8063de:	41 58                	pop    r8
  8063e0:	5e                   	pop    rsi
  8063e1:	5f                   	pop    rdi
  8063e2:	5a                   	pop    rdx
  8063e3:	59                   	pop    rcx
  8063e4:	5b                   	pop    rbx
  8063e5:	48 83 c4 08          	add    rsp,0x8
  8063e9:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  8063ed:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  8063f1:	5d                   	pop    rbp
  8063f2:	fb                   	sti    
  8063f3:	48 0f 07             	sysretq 

00000000008063f6 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8063f6:	f3 0f 1e fa          	endbr64 
  8063fa:	55                   	push   rbp
  8063fb:	48 89 e5             	mov    rbp,rsp
  8063fe:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806402:	8b 05 4c 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2114c]        # 427554 <framebuffer+0x14>
  806408:	89 c0                	mov    eax,eax
  80640a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  80640e:	8b 05 44 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21144]        # 427558 <framebuffer+0x18>
  806414:	89 c0                	mov    eax,eax
  806416:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80641a:	0f b6 05 3b 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2113b]        # 42755c <framebuffer+0x1c>
  806421:	c0 e8 03             	shr    al,0x3
  806424:	0f b6 c0             	movzx  eax,al
  806427:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80642b:	8b 05 1f 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2111f]        # 427550 <framebuffer+0x10>
  806431:	89 c0                	mov    eax,eax
  806433:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806437:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80643b:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806440:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806444:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806448:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80644d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806451:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806455:	48 c1 e8 0c          	shr    rax,0xc
  806459:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80645c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806463:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806464:	48 8b 05 dd 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc210dd]        # 427548 <framebuffer+0x8>
  80646b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80646f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806476:	00 
  806477:	eb 2d                	jmp    8064a6 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  806479:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80647d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806481:	ba 07 00 00 00       	mov    edx,0x7
  806486:	48 89 ce             	mov    rsi,rcx
  806489:	48 89 c7             	mov    rdi,rax
  80648c:	e8 54 aa ff ff       	call   800ee5 <mmap>
        pp+=PAGE_SIZE;
  806491:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  806498:	00 
        p+=PAGE_SIZE;
  806499:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8064a0:	00 
    for (size_t i = 0; i < pgc; i++)
  8064a1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8064a6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8064a9:	48 98                	cdqe   
  8064ab:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8064af:	72 c8                	jb     806479 <init_framebuffer+0x83>
    }
    
    
}
  8064b1:	90                   	nop
  8064b2:	90                   	nop
  8064b3:	c9                   	leave  
  8064b4:	c3                   	ret    

00000000008064b5 <init_font>:
void init_font(){
  8064b5:	f3 0f 1e fa          	endbr64 
  8064b9:	55                   	push   rbp
  8064ba:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8064bd:	48 c7 05 b8 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc210b8],0x80c340        # 427580 <boot_font>
  8064c4:	40 c3 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8064c8:	48 8b 05 b1 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc210b1]        # 427580 <boot_font>
  8064cf:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8064d2:	83 c0 07             	add    eax,0x7
  8064d5:	c1 e8 03             	shr    eax,0x3
  8064d8:	89 05 b2 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc210b2],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8064de:	8b 05 ac 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210ac]        # 427590 <font_width_bytes>
  8064e4:	c1 e0 03             	shl    eax,0x3
  8064e7:	89 05 9b 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2109b],eax        # 427588 <font_width>
    font_height = boot_font->height;
  8064ed:	48 8b 05 8c 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2108c]        # 427580 <boot_font>
  8064f4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8064f7:	89 05 8f 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2108f],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8064fd:	48 8b 05 7c 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2107c]        # 427580 <boot_font>
  806504:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806507:	89 c0                	mov    eax,eax
  806509:	48 05 40 c3 80 00    	add    rax,0x80c340
  80650f:	48 89 05 82 10 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21082],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806516:	48 8b 05 63 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21063]        # 427580 <boot_font>
  80651d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806520:	89 05 7e 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2107e],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806526:	48 8b 05 53 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21053]        # 427580 <boot_font>
  80652d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806530:	89 05 6a 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2106a],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806536:	c7 05 30 10 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21030],0x0        # 427570 <fb_cursor_y>
  80653d:	00 00 00 
  806540:	8b 05 2a 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2102a]        # 427570 <fb_cursor_y>
  806546:	89 05 20 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21020],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80654c:	8b 05 02 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21002]        # 427554 <framebuffer+0x14>
  806552:	8b 0d 30 10 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21030]        # 427588 <font_width>
  806558:	ba 00 00 00 00       	mov    edx,0x0
  80655d:	f7 f1                	div    ecx
  80655f:	89 05 0f 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2100f],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806565:	8b 05 ed 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20fed]        # 427558 <framebuffer+0x18>
  80656b:	8b 35 1b 10 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2101b]        # 42758c <font_height>
  806571:	ba 00 00 00 00       	mov    edx,0x0
  806576:	f7 f6                	div    esi
  806578:	89 05 fa 0f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20ffa],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  80657e:	c7 05 08 5b 00 00 01 	mov    DWORD PTR [rip+0x5b08],0x1        # 80c090 <font_size>
  806585:	00 00 00 
}
  806588:	90                   	nop
  806589:	5d                   	pop    rbp
  80658a:	c3                   	ret    

000000000080658b <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  80658b:	f3 0f 1e fa          	endbr64 
  80658f:	55                   	push   rbp
  806590:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  806593:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  806597:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80659b:	48 89 05 9e 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f9e],rax        # 427540 <framebuffer>
  8065a2:	48 89 15 9f 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f9f],rdx        # 427548 <framebuffer+0x8>
  8065a9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8065ad:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8065b1:	48 89 05 98 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f98],rax        # 427550 <framebuffer+0x10>
  8065b8:	48 89 15 99 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f99],rdx        # 427558 <framebuffer+0x18>
  8065bf:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8065c3:	48 89 05 96 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f96],rax        # 427560 <framebuffer+0x20>
}
  8065ca:	90                   	nop
  8065cb:	5d                   	pop    rbp
  8065cc:	c3                   	ret    

00000000008065cd <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8065cd:	f3 0f 1e fa          	endbr64 
  8065d1:	55                   	push   rbp
  8065d2:	48 89 e5             	mov    rbp,rsp
  8065d5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8065d8:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8065db:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8065de:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  8065e1:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8065e5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  8065ec:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  8065ed:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8065f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8065f3:	eb 64                	jmp    806659 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  8065f5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8065f8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8065fb:	eb 4b                	jmp    806648 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8065fd:	8b 15 4d 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20f4d]        # 427550 <framebuffer+0x10>
  806603:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806606:	0f af c2             	imul   eax,edx
  806609:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  80660b:	0f b6 05 4a 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f4a]        # 42755c <framebuffer+0x1c>
  806612:	0f b6 c0             	movzx  eax,al
  806615:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806619:	8d 50 07             	lea    edx,[rax+0x7]
  80661c:	85 c0                	test   eax,eax
  80661e:	0f 48 c2             	cmovs  eax,edx
  806621:	c1 f8 03             	sar    eax,0x3
  806624:	48 98                	cdqe   
  806626:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806629:	48 05 00 00 00 40    	add    rax,0x40000000
  80662f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806633:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806637:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  80663b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80663f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806642:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806644:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806648:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80664b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80664e:	01 d0                	add    eax,edx
  806650:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806653:	7c a8                	jl     8065fd <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806655:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806659:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80665c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80665f:	01 d0                	add    eax,edx
  806661:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806664:	7c 8f                	jl     8065f5 <fill_rect+0x28>
        }
    }
}
  806666:	90                   	nop
  806667:	90                   	nop
  806668:	5d                   	pop    rbp
  806669:	c3                   	ret    

000000000080666a <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  80666a:	f3 0f 1e fa          	endbr64 
  80666e:	55                   	push   rbp
  80666f:	48 89 e5             	mov    rbp,rsp
  806672:	48 83 ec 30          	sub    rsp,0x30
  806676:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806679:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80667c:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80667f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806683:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806686:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806689:	eb 5a                	jmp    8066e5 <draw_text+0x7b>
    {
        if(*str=='\n')
  80668b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80668f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806692:	3c 0a                	cmp    al,0xa
  806694:	75 1c                	jne    8066b2 <draw_text+0x48>
        {
            y+=font_height*size;
  806696:	8b 15 f0 0e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20ef0]        # 42758c <font_height>
  80669c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80669f:	0f af d0             	imul   edx,eax
  8066a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066a5:	01 d0                	add    eax,edx
  8066a7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8066aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8066ad:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8066b0:	eb 2e                	jmp    8066e0 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8066b2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8066b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8066b9:	0f be c8             	movsx  ecx,al
  8066bc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8066bf:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8066c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066c5:	89 c7                	mov    edi,eax
  8066c7:	e8 28 00 00 00       	call   8066f4 <draw_letter>
            tx+=size*font_width;
  8066cc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8066cf:	8b 05 b3 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20eb3]        # 427588 <font_width>
  8066d5:	0f af d0             	imul   edx,eax
  8066d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066db:	01 d0                	add    eax,edx
  8066dd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8066e0:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8066e5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8066e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8066ec:	84 c0                	test   al,al
  8066ee:	75 9b                	jne    80668b <draw_text+0x21>
    }
}
  8066f0:	90                   	nop
  8066f1:	90                   	nop
  8066f2:	c9                   	leave  
  8066f3:	c3                   	ret    

00000000008066f4 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  8066f4:	f3 0f 1e fa          	endbr64 
  8066f8:	55                   	push   rbp
  8066f9:	48 89 e5             	mov    rbp,rsp
  8066fc:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  8066ff:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806702:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  806705:	89 c8                	mov    eax,ecx
  806707:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  80670a:	48 8b 05 87 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e87]        # 427598 <glyph_table>
  806711:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806715:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806719:	8b 05 85 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e85]        # 4275a4 <glyph_nr>
  80671f:	39 c2                	cmp    edx,eax
  806721:	73 13                	jae    806736 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806723:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806727:	8b 05 73 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e73]        # 4275a0 <bytes_per_glyph>
  80672d:	0f af c2             	imul   eax,edx
  806730:	89 c0                	mov    eax,eax
  806732:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806736:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80673d:	e9 cb 00 00 00       	jmp    80680d <draw_letter+0x119>
        u8 mask = 1 << 7;
  806742:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806746:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80674d:	e9 9c 00 00 00       	jmp    8067ee <draw_letter+0xfa>
            int px=x+ch_x*size;
  806752:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806755:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806759:	89 c2                	mov    edx,eax
  80675b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80675e:	01 d0                	add    eax,edx
  806760:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806763:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806766:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  80676a:	89 c2                	mov    edx,eax
  80676c:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  80676f:	01 d0                	add    eax,edx
  806771:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806774:	8b 15 d6 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20dd6]        # 427550 <framebuffer+0x10>
  80677a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80677d:	0f af c2             	imul   eax,edx
  806780:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806782:	0f b6 05 d3 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20dd3]        # 42755c <framebuffer+0x1c>
  806789:	0f b6 c0             	movzx  eax,al
  80678c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806790:	8d 50 07             	lea    edx,[rax+0x7]
  806793:	85 c0                	test   eax,eax
  806795:	0f 48 c2             	cmovs  eax,edx
  806798:	c1 f8 03             	sar    eax,0x3
  80679b:	48 98                	cdqe   
  80679d:	48 01 c8             	add    rax,rcx
  8067a0:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8067a6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  8067aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8067ad:	c1 e8 03             	shr    eax,0x3
  8067b0:	89 c2                	mov    edx,eax
  8067b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067b6:	48 01 d0             	add    rax,rdx
  8067b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8067bc:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8067bf:	84 c0                	test   al,al
  8067c1:	74 0c                	je     8067cf <draw_letter+0xdb>
                *ptr=-1;
  8067c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067c7:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  8067cd:	eb 0a                	jmp    8067d9 <draw_letter+0xe5>
            } else {
                *ptr=0;
  8067cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067d3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  8067d9:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8067dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8067df:	83 e0 07             	and    eax,0x7
  8067e2:	85 c0                	test   eax,eax
  8067e4:	75 04                	jne    8067ea <draw_letter+0xf6>
                mask = 1 << 7;
  8067e6:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8067ea:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8067ee:	8b 05 94 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d94]        # 427588 <font_width>
  8067f4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8067f7:	0f 82 55 ff ff ff    	jb     806752 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  8067fd:	8b 05 8d 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d8d]        # 427590 <font_width_bytes>
  806803:	89 c0                	mov    eax,eax
  806805:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806809:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80680d:	8b 05 79 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d79]        # 42758c <font_height>
  806813:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806816:	0f 82 26 ff ff ff    	jb     806742 <draw_letter+0x4e>
    }
}
  80681c:	90                   	nop
  80681d:	90                   	nop
  80681e:	5d                   	pop    rbp
  80681f:	c3                   	ret    

0000000000806820 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806820:	f3 0f 1e fa          	endbr64 
  806824:	55                   	push   rbp
  806825:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806828:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80682f:	eb 71                	jmp    8068a2 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806831:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806838:	eb 57                	jmp    806891 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  80683a:	8b 15 10 0d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20d10]        # 427550 <framebuffer+0x10>
  806840:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806843:	0f af c2             	imul   eax,edx
  806846:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806848:	0f b6 05 0d 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d0d]        # 42755c <framebuffer+0x1c>
  80684f:	0f b6 c0             	movzx  eax,al
  806852:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806856:	8d 50 07             	lea    edx,[rax+0x7]
  806859:	85 c0                	test   eax,eax
  80685b:	0f 48 c2             	cmovs  eax,edx
  80685e:	c1 f8 03             	sar    eax,0x3
  806861:	48 98                	cdqe   
  806863:	48 01 c8             	add    rax,rcx
  806866:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  80686c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806870:	8b 05 da 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cda]        # 427550 <framebuffer+0x10>
  806876:	89 c2                	mov    edx,eax
  806878:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80687c:	48 01 d0             	add    rax,rdx
  80687f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806882:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806886:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806888:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  80688d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806891:	8b 15 bd 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20cbd]        # 427554 <framebuffer+0x14>
  806897:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80689a:	39 c2                	cmp    edx,eax
  80689c:	77 9c                	ja     80683a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  80689e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8068a2:	8b 05 b0 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cb0]        # 427558 <framebuffer+0x18>
  8068a8:	8d 50 ff             	lea    edx,[rax-0x1]
  8068ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068ae:	39 c2                	cmp    edx,eax
  8068b0:	0f 87 7b ff ff ff    	ja     806831 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  8068b6:	90                   	nop
  8068b7:	90                   	nop
  8068b8:	5d                   	pop    rbp
  8068b9:	c3                   	ret    

00000000008068ba <scr_down>:
void scr_down(){
  8068ba:	f3 0f 1e fa          	endbr64 
  8068be:	55                   	push   rbp
  8068bf:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8068c2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  8068c9:	eb 72                	jmp    80693d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8068cb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8068d2:	eb 58                	jmp    80692c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8068d4:	8b 15 76 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20c76]        # 427550 <framebuffer+0x10>
  8068da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068dd:	0f af c2             	imul   eax,edx
  8068e0:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8068e2:	0f b6 05 73 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c73]        # 42755c <framebuffer+0x1c>
  8068e9:	0f b6 c0             	movzx  eax,al
  8068ec:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8068f0:	8d 50 07             	lea    edx,[rax+0x7]
  8068f3:	85 c0                	test   eax,eax
  8068f5:	0f 48 c2             	cmovs  eax,edx
  8068f8:	c1 f8 03             	sar    eax,0x3
  8068fb:	48 98                	cdqe   
  8068fd:	48 01 c8             	add    rax,rcx
  806900:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806906:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80690a:	8b 05 40 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c40]        # 427550 <framebuffer+0x10>
  806910:	89 c0                	mov    eax,eax
  806912:	48 f7 d8             	neg    rax
  806915:	48 89 c2             	mov    rdx,rax
  806918:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80691c:	48 01 d0             	add    rax,rdx
  80691f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806922:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806926:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806928:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80692c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80692f:	8b 05 3f 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c3f]        # 427574 <max_ch_nr_x>
  806935:	39 c2                	cmp    edx,eax
  806937:	72 9b                	jb     8068d4 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806939:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80693d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806940:	8b 05 32 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c32]        # 427578 <max_ch_nr_y>
  806946:	39 c2                	cmp    edx,eax
  806948:	72 81                	jb     8068cb <scr_down+0x11>
        }

    }
}
  80694a:	90                   	nop
  80694b:	90                   	nop
  80694c:	5d                   	pop    rbp
  80694d:	c3                   	ret    

000000000080694e <print>:
void print(char* s){
  80694e:	f3 0f 1e fa          	endbr64 
  806952:	55                   	push   rbp
  806953:	48 89 e5             	mov    rbp,rsp
  806956:	48 83 ec 08          	sub    rsp,0x8
  80695a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  80695e:	e9 c4 00 00 00       	jmp    806a27 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806963:	8b 15 03 0c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20c03]        # 42756c <fb_cursor_x>
  806969:	8b 05 05 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c05]        # 427574 <max_ch_nr_x>
  80696f:	39 c2                	cmp    edx,eax
  806971:	77 0b                	ja     80697e <print+0x30>
  806973:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806977:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80697a:	3c 0a                	cmp    al,0xa
  80697c:	75 19                	jne    806997 <print+0x49>
        {
            fb_cursor_y+=1;
  80697e:	8b 05 ec 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bec]        # 427570 <fb_cursor_y>
  806984:	83 c0 01             	add    eax,0x1
  806987:	89 05 e3 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20be3],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  80698d:	c7 05 d5 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20bd5],0x0        # 42756c <fb_cursor_x>
  806994:	00 00 00 
        }
        if(*s=='\n')continue;
  806997:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80699b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80699e:	3c 0a                	cmp    al,0xa
  8069a0:	74 7f                	je     806a21 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  8069a2:	8b 05 d0 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bd0]        # 427578 <max_ch_nr_y>
  8069a8:	8d 50 ff             	lea    edx,[rax-0x1]
  8069ab:	8b 05 bf 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bbf]        # 427570 <fb_cursor_y>
  8069b1:	39 c2                	cmp    edx,eax
  8069b3:	77 0a                	ja     8069bf <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  8069b5:	c7 05 b1 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20bb1],0x0        # 427570 <fb_cursor_y>
  8069bc:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8069bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069c3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069c6:	0f be d0             	movsx  edx,al
  8069c9:	8b 05 c1 56 00 00    	mov    eax,DWORD PTR [rip+0x56c1]        # 80c090 <font_size>
  8069cf:	8b 35 9b 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20b9b]        # 427570 <fb_cursor_y>
  8069d5:	8b 0d b1 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20bb1]        # 42758c <font_height>
  8069db:	0f af ce             	imul   ecx,esi
  8069de:	8b 35 ac 56 00 00    	mov    esi,DWORD PTR [rip+0x56ac]        # 80c090 <font_size>
  8069e4:	0f af ce             	imul   ecx,esi
  8069e7:	41 89 c8             	mov    r8d,ecx
  8069ea:	8b 35 7c 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20b7c]        # 42756c <fb_cursor_x>
  8069f0:	8b 0d 92 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20b92]        # 427588 <font_width>
  8069f6:	0f af ce             	imul   ecx,esi
  8069f9:	8b 35 91 56 00 00    	mov    esi,DWORD PTR [rip+0x5691]        # 80c090 <font_size>
  8069ff:	0f af ce             	imul   ecx,esi
  806a02:	89 cf                	mov    edi,ecx
  806a04:	89 d1                	mov    ecx,edx
  806a06:	89 c2                	mov    edx,eax
  806a08:	44 89 c6             	mov    esi,r8d
  806a0b:	e8 e4 fc ff ff       	call   8066f4 <draw_letter>
        fb_cursor_x+=1;
  806a10:	8b 05 56 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b56]        # 42756c <fb_cursor_x>
  806a16:	83 c0 01             	add    eax,0x1
  806a19:	89 05 4d 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b4d],eax        # 42756c <fb_cursor_x>
  806a1f:	eb 01                	jmp    806a22 <print+0xd4>
        if(*s=='\n')continue;
  806a21:	90                   	nop
    for(;*s;s++){
  806a22:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806a27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a2e:	84 c0                	test   al,al
  806a30:	0f 85 2d ff ff ff    	jne    806963 <print+0x15>
    }
}
  806a36:	90                   	nop
  806a37:	90                   	nop
  806a38:	c9                   	leave  
  806a39:	c3                   	ret    

0000000000806a3a <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806a3a:	f3 0f 1e fa          	endbr64 
  806a3e:	55                   	push   rbp
  806a3f:	48 89 e5             	mov    rbp,rsp
  806a42:	48 83 ec 50          	sub    rsp,0x50
  806a46:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806a4a:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806a4e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806a55:	00 
    int tmpnamelen = 0;
  806a56:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  806a5d:	48 8b 05 44 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b44]        # 4275a8 <root_sb>
  806a64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806a67:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  806a6b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806a72:	00 

    while(*name == '/')
  806a73:	eb 05                	jmp    806a7a <path_walk+0x40>
        name++;
  806a75:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  806a7a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a7e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a81:	3c 2f                	cmp    al,0x2f
  806a83:	74 f0                	je     806a75 <path_walk+0x3b>

    if(!*name)
  806a85:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806a8c:	84 c0                	test   al,al
  806a8e:	75 09                	jne    806a99 <path_walk+0x5f>
    {
        return parent;
  806a90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806a94:	e9 1b 02 00 00       	jmp    806cb4 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  806a99:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a9d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  806aa1:	eb 05                	jmp    806aa8 <path_walk+0x6e>
            name++;
  806aa3:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  806aa8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806aac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806aaf:	84 c0                	test   al,al
  806ab1:	74 0b                	je     806abe <path_walk+0x84>
  806ab3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ab7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806aba:	3c 2f                	cmp    al,0x2f
  806abc:	75 e5                	jne    806aa3 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806abe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ac2:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806ac6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806ac9:	be 00 00 00 00       	mov    esi,0x0
  806ace:	bf 48 00 00 00       	mov    edi,0x48
  806ad3:	b8 00 00 00 00       	mov    eax,0x0
  806ad8:	e8 cd a7 ff ff       	call   8012aa <vmalloc>
  806add:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806ae1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ae5:	ba 48 00 00 00       	mov    edx,0x48
  806aea:	be 00 00 00 00       	mov    esi,0x0
  806aef:	48 89 c7             	mov    rdi,rax
  806af2:	e8 09 4c 00 00       	call   80b700 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806af7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806afa:	83 c0 01             	add    eax,0x1
  806afd:	be 00 00 00 00       	mov    esi,0x0
  806b02:	89 c7                	mov    edi,eax
  806b04:	b8 00 00 00 00       	mov    eax,0x0
  806b09:	e8 9c a7 ff ff       	call   8012aa <vmalloc>
  806b0e:	48 89 c2             	mov    rdx,rax
  806b11:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b15:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806b18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b1b:	83 c0 01             	add    eax,0x1
  806b1e:	48 63 d0             	movsxd rdx,eax
  806b21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806b28:	be 00 00 00 00       	mov    esi,0x0
  806b2d:	48 89 c7             	mov    rdi,rax
  806b30:	e8 cb 4b 00 00       	call   80b700 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806b35:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b38:	48 63 d0             	movsxd rdx,eax
  806b3b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b3f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806b42:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b46:	48 89 ce             	mov    rsi,rcx
  806b49:	48 89 c7             	mov    rdi,rax
  806b4c:	e8 00 4b 00 00       	call   80b651 <memcpy>
        path->name_length = tmpnamelen;
  806b51:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b55:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806b58:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806b5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b5f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806b63:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806b67:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  806b6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b6f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806b73:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806b77:	48 89 d6             	mov    rsi,rdx
  806b7a:	48 89 c7             	mov    rdi,rax
  806b7d:	ff d1                	call   rcx
  806b7f:	48 85 c0             	test   rax,rax
  806b82:	75 3e                	jne    806bc2 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  806b84:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806b88:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806b8b:	48 89 c6             	mov    rsi,rax
  806b8e:	bf 97 3c 81 00       	mov    edi,0x813c97
  806b93:	b8 00 00 00 00       	mov    eax,0x0
  806b98:	e8 7b a1 ff ff       	call   800d18 <printf>
            vmfree(path->name);
  806b9d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ba1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806ba4:	48 89 c7             	mov    rdi,rax
  806ba7:	e8 8d a7 ff ff       	call   801339 <vmfree>
            vmfree(path);
  806bac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bb0:	48 89 c7             	mov    rdi,rax
  806bb3:	e8 81 a7 ff ff       	call   801339 <vmfree>
            return NULL;
  806bb8:	b8 00 00 00 00       	mov    eax,0x0
  806bbd:	e9 f2 00 00 00       	jmp    806cb4 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  806bc2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bc6:	48 83 c0 10          	add    rax,0x10
  806bca:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806bce:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806bd2:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806bd6:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806bd9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806bdd:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806be1:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806be5:	90                   	nop
        list_init(&path->subdirs_list);
  806be6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806bea:	48 83 c0 20          	add    rax,0x20
  806bee:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  806bf2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806bf6:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806bfa:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806bfd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806c01:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806c05:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806c09:	90                   	nop
        path->parent = parent;
  806c0a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c0e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806c12:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  806c16:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c1a:	48 83 c0 10          	add    rax,0x10
  806c1e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806c22:	48 83 c2 20          	add    rdx,0x20
  806c26:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806c2a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  806c2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c32:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  806c36:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c3a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  806c3e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c42:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806c46:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  806c49:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806c4d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806c51:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806c55:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  806c58:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c5c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806c60:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806c64:	90                   	nop

        if(!*name)
  806c65:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c69:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c6c:	84 c0                	test   al,al
  806c6e:	74 2a                	je     806c9a <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  806c70:	eb 05                	jmp    806c77 <path_walk+0x23d>
            name++;
  806c72:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  806c77:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c7e:	3c 2f                	cmp    al,0x2f
  806c80:	74 f0                	je     806c72 <path_walk+0x238>
        if(!*name)
  806c82:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806c86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c89:	84 c0                	test   al,al
  806c8b:	74 10                	je     806c9d <path_walk+0x263>
            goto last_slash;

        parent = path;
  806c8d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806c91:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  806c95:	e9 ff fd ff ff       	jmp    806a99 <path_walk+0x5f>
            goto last_component;
  806c9a:	90                   	nop
  806c9b:	eb 01                	jmp    806c9e <path_walk+0x264>
            goto last_slash;
  806c9d:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  806c9e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806ca2:	83 e0 01             	and    eax,0x1
  806ca5:	48 85 c0             	test   rax,rax
  806ca8:	74 06                	je     806cb0 <path_walk+0x276>
    {
        return parent;
  806caa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806cae:	eb 04                	jmp    806cb4 <path_walk+0x27a>
    }

    return path;
  806cb0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  806cb4:	c9                   	leave  
  806cb5:	c3                   	ret    

0000000000806cb6 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  806cb6:	f3 0f 1e fa          	endbr64 
  806cba:	55                   	push   rbp
  806cbb:	48 89 e5             	mov    rbp,rsp
  806cbe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806cc2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806cc6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806cca:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  806cce:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  806cd2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cd6:	83 c0 18             	add    eax,0x18
}
  806cd9:	5d                   	pop    rbp
  806cda:	c3                   	ret    

0000000000806cdb <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  806cdb:	f3 0f 1e fa          	endbr64 
  806cdf:	55                   	push   rbp
  806ce0:	48 89 e5             	mov    rbp,rsp
  806ce3:	48 83 ec 30          	sub    rsp,0x30
  806ce7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  806ceb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806cef:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  806cf3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806cfa:	00 

    for(p = &filesystem;p;p = p->next)
  806cfb:	48 c7 45 f8 a0 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c0a0
  806d02:	00 
  806d03:	eb 40                	jmp    806d45 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  806d05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806d0c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806d10:	48 89 d6             	mov    rsi,rdx
  806d13:	48 89 c7             	mov    rdi,rax
  806d16:	e8 d4 4b 00 00       	call   80b8ef <strcmp>
  806d1b:	85 c0                	test   eax,eax
  806d1d:	75 1a                	jne    806d39 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  806d1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d23:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  806d27:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806d2b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806d2f:	48 89 d6             	mov    rsi,rdx
  806d32:	48 89 c7             	mov    rdi,rax
  806d35:	ff d1                	call   rcx
  806d37:	eb 18                	jmp    806d51 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  806d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d3d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806d41:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806d45:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806d4a:	75 b9                	jne    806d05 <mount_fs+0x2a>
        }
    return 0;
  806d4c:	b8 00 00 00 00       	mov    eax,0x0
}
  806d51:	c9                   	leave  
  806d52:	c3                   	ret    

0000000000806d53 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  806d53:	f3 0f 1e fa          	endbr64 
  806d57:	55                   	push   rbp
  806d58:	48 89 e5             	mov    rbp,rsp
  806d5b:	48 83 ec 20          	sub    rsp,0x20
  806d5f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  806d63:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806d6a:	00 

    for(p = &filesystem;p;p = p->next)
  806d6b:	48 c7 45 f8 a0 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c0a0
  806d72:	00 
  806d73:	eb 30                	jmp    806da5 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  806d75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d79:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806d7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d80:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806d83:	48 89 d6             	mov    rsi,rdx
  806d86:	48 89 c7             	mov    rdi,rax
  806d89:	e8 61 4b 00 00       	call   80b8ef <strcmp>
  806d8e:	85 c0                	test   eax,eax
  806d90:	75 07                	jne    806d99 <register_filesystem+0x46>
            return 0;
  806d92:	b8 00 00 00 00       	mov    eax,0x0
  806d97:	eb 32                	jmp    806dcb <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  806d99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d9d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806da1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806da5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806daa:	75 c9                	jne    806d75 <register_filesystem+0x22>

    fs->next = filesystem.next;
  806dac:	48 8b 15 05 53 00 00 	mov    rdx,QWORD PTR [rip+0x5305]        # 80c0b8 <filesystem+0x18>
  806db3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806db7:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  806dbb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806dbf:	48 89 05 f2 52 00 00 	mov    QWORD PTR [rip+0x52f2],rax        # 80c0b8 <filesystem+0x18>

    return 1;
  806dc6:	b8 01 00 00 00       	mov    eax,0x1
}
  806dcb:	c9                   	leave  
  806dcc:	c3                   	ret    

0000000000806dcd <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  806dcd:	f3 0f 1e fa          	endbr64 
  806dd1:	55                   	push   rbp
  806dd2:	48 89 e5             	mov    rbp,rsp
  806dd5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  806dd9:	48 c7 45 f8 a0 c0 80 	mov    QWORD PTR [rbp-0x8],0x80c0a0
  806de0:	00 

    while(p->next)
  806de1:	eb 41                	jmp    806e24 <unregister_filesystem+0x57>
        if(p->next == fs)
  806de3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806de7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806deb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806def:	75 27                	jne    806e18 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  806df1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806df5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806df9:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  806dfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e01:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  806e05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e09:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806e10:	00 
            return 1;
  806e11:	b8 01 00 00 00       	mov    eax,0x1
  806e16:	eb 1e                	jmp    806e36 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  806e18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e1c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806e20:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  806e24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e28:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806e2c:	48 85 c0             	test   rax,rax
  806e2f:	75 b2                	jne    806de3 <unregister_filesystem+0x16>
    return 0;
  806e31:	b8 00 00 00 00       	mov    eax,0x0
}
  806e36:	5d                   	pop    rbp
  806e37:	c3                   	ret    

0000000000806e38 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  806e38:	f3 0f 1e fa          	endbr64 
  806e3c:	55                   	push   rbp
  806e3d:	48 89 e5             	mov    rbp,rsp
  806e40:	48 83 ec 10          	sub    rsp,0x10
  806e44:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  806e48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e4c:	48 89 c7             	mov    rdi,rax
  806e4f:	b8 00 00 00 00       	mov    eax,0x0
  806e54:	e8 bf 9e ff ff       	call   800d18 <printf>
    return 0;
  806e59:	b8 00 00 00 00       	mov    eax,0x0
}
  806e5e:	c9                   	leave  
  806e5f:	c3                   	ret    

0000000000806e60 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  806e60:	f3 0f 1e fa          	endbr64 
  806e64:	55                   	push   rbp
  806e65:	48 89 e5             	mov    rbp,rsp
  806e68:	48 83 ec 50          	sub    rsp,0x50
  806e6c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806e70:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  806e73:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806e7a:	00 
    long pathlen = 0;
  806e7b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806e82:	00 
    long error = 0;
  806e83:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806e8a:	00 
    struct dir_entry * dentry = NULL;
  806e8b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  806e92:	00 
    struct file * filp = NULL;
  806e93:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  806e9a:	00 
    struct file ** f = NULL;
  806e9b:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  806ea2:	00 
    int fd = -1;
  806ea3:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  806eaa:	b8 00 00 00 00       	mov    eax,0x0
  806eaf:	e8 f6 a3 ff ff       	call   8012aa <vmalloc>
  806eb4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  806eb8:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  806ebd:	75 0c                	jne    806ecb <sys_open+0x6b>
        return -ENOMEM;
  806ebf:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  806ec6:	e9 aa 02 00 00       	jmp    807175 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  806ecb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ecf:	ba 00 10 00 00       	mov    edx,0x1000
  806ed4:	be 00 00 00 00       	mov    esi,0x0
  806ed9:	48 89 c7             	mov    rdi,rax
  806edc:	e8 1f 48 00 00       	call   80b700 <memset>
    pathlen = strlen(filename);
  806ee1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ee5:	48 89 c7             	mov    rdi,rax
  806ee8:	e8 81 4a 00 00       	call   80b96e <strlen>
  806eed:	48 98                	cdqe   
  806eef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  806ef3:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  806ef8:	7f 18                	jg     806f12 <sys_open+0xb2>
    {
        vmfree(path);
  806efa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806efe:	48 89 c7             	mov    rdi,rax
  806f01:	e8 33 a4 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  806f06:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806f0d:	e9 63 02 00 00       	jmp    807175 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  806f12:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  806f19:	00 
  806f1a:	7e 18                	jle    806f34 <sys_open+0xd4>
    {
        vmfree(path);
  806f1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f20:	48 89 c7             	mov    rdi,rax
  806f23:	e8 11 a4 ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  806f28:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  806f2f:	e9 41 02 00 00       	jmp    807175 <sys_open+0x315>
    }
    strcpy(filename,path);
  806f34:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806f38:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806f3c:	48 89 d6             	mov    rsi,rdx
  806f3f:	48 89 c7             	mov    rdi,rax
  806f42:	e8 08 48 00 00       	call   80b74f <strcpy>

    dentry = path_walk(path,0);
  806f47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f4b:	be 00 00 00 00       	mov    esi,0x0
  806f50:	48 89 c7             	mov    rdi,rax
  806f53:	e8 e2 fa ff ff       	call   806a3a <path_walk>
  806f58:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  806f5c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f60:	48 89 c7             	mov    rdi,rax
  806f63:	e8 d1 a3 ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  806f68:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806f6d:	75 0c                	jne    806f7b <sys_open+0x11b>
        return -ENOENT;
  806f6f:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  806f76:	e9 fa 01 00 00       	jmp    807175 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  806f7b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806f7e:	25 00 40 00 00       	and    eax,0x4000
  806f83:	85 c0                	test   eax,eax
  806f85:	74 1e                	je     806fa5 <sys_open+0x145>
  806f87:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f8b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f8f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806f93:	48 83 f8 02          	cmp    rax,0x2
  806f97:	74 0c                	je     806fa5 <sys_open+0x145>
        return -ENOTDIR;
  806f99:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806fa0:	e9 d0 01 00 00       	jmp    807175 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  806fa5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806fa8:	25 00 40 00 00       	and    eax,0x4000
  806fad:	85 c0                	test   eax,eax
  806faf:	75 1e                	jne    806fcf <sys_open+0x16f>
  806fb1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fb5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806fb9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806fbd:	48 83 f8 02          	cmp    rax,0x2
  806fc1:	75 0c                	jne    806fcf <sys_open+0x16f>
        return -EISDIR;
  806fc3:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  806fca:	e9 a6 01 00 00       	jmp    807175 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  806fcf:	b8 00 00 00 00       	mov    eax,0x0
  806fd4:	e8 d1 a2 ff ff       	call   8012aa <vmalloc>
  806fd9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  806fdd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fe1:	ba 28 00 00 00       	mov    edx,0x28
  806fe6:	be 00 00 00 00       	mov    esi,0x0
  806feb:	48 89 c7             	mov    rdi,rax
  806fee:	e8 0d 47 00 00       	call   80b700 <memset>
    filp->dentry = dentry;
  806ff3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806ff7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806ffb:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  806fff:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807002:	48 63 d0             	movsxd rdx,eax
  807005:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807009:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  80700d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807011:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807015:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807019:	83 e0 04             	and    eax,0x4
  80701c:	48 85 c0             	test   rax,rax
  80701f:	74 0e                	je     80702f <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807021:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807025:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80702c:	00 
  80702d:	eb 14                	jmp    807043 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80702f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807033:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807037:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80703b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80703f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807043:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807047:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80704b:	48 85 c0             	test   rax,rax
  80704e:	74 33                	je     807083 <sys_open+0x223>
  807050:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807054:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807058:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80705b:	48 85 c0             	test   rax,rax
  80705e:	74 23                	je     807083 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  807060:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807064:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807068:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80706b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80706f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807073:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807077:	48 89 d6             	mov    rsi,rdx
  80707a:	48 89 c7             	mov    rdi,rax
  80707d:	ff d1                	call   rcx
  80707f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  807083:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807088:	74 18                	je     8070a2 <sys_open+0x242>
    {
        vmfree(filp);
  80708a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80708e:	48 89 c7             	mov    rdi,rax
  807091:	e8 a3 a2 ff ff       	call   801339 <vmfree>
        return -EFAULT;
  807096:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80709d:	e9 d3 00 00 00       	jmp    807175 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  8070a2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070a6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8070aa:	25 00 02 00 00       	and    eax,0x200
  8070af:	48 85 c0             	test   rax,rax
  8070b2:	74 13                	je     8070c7 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  8070b4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8070bc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8070c0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8070c7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070cb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8070cf:	25 00 04 00 00       	and    eax,0x400
  8070d4:	48 85 c0             	test   rax,rax
  8070d7:	74 19                	je     8070f2 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8070d9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070dd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8070e1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8070e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8070e8:	48 89 c2             	mov    rdx,rax
  8070eb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8070ef:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8070f2:	48 8b 05 a7 d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d3a7]        # 4144a0 <current>
  8070f9:	48 05 c4 00 00 00    	add    rax,0xc4
  8070ff:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807103:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80710a:	eb 28                	jmp    807134 <sys_open+0x2d4>
        if(f[i] == NULL)
  80710c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80710f:	48 98                	cdqe   
  807111:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807118:	00 
  807119:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80711d:	48 01 d0             	add    rax,rdx
  807120:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807123:	48 85 c0             	test   rax,rax
  807126:	75 08                	jne    807130 <sys_open+0x2d0>
        {
            fd = i;
  807128:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80712b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  80712e:	eb 0a                	jmp    80713a <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807130:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807134:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  807138:	7e d2                	jle    80710c <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80713a:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  80713e:	75 15                	jne    807155 <sys_open+0x2f5>
    {
        vmfree(filp);
  807140:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807144:	48 89 c7             	mov    rdi,rax
  807147:	e8 ed a1 ff ff       	call   801339 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80714c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  807153:	eb 20                	jmp    807175 <sys_open+0x315>
    }
    f[fd] = filp;
  807155:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807158:	48 98                	cdqe   
  80715a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807161:	00 
  807162:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807166:	48 01 c2             	add    rdx,rax
  807169:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80716d:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  807170:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807173:	48 98                	cdqe   
}
  807175:	c9                   	leave  
  807176:	c3                   	ret    

0000000000807177 <sys_close>:

unsigned long sys_close(int fd)
{
  807177:	f3 0f 1e fa          	endbr64 
  80717b:	55                   	push   rbp
  80717c:	48 89 e5             	mov    rbp,rsp
  80717f:	48 83 ec 20          	sub    rsp,0x20
  807183:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  807186:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80718d:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80718e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807192:	78 06                	js     80719a <sys_close+0x23>
  807194:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807198:	7e 0c                	jle    8071a6 <sys_close+0x2f>
        return -EBADF;
  80719a:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8071a1:	e9 87 00 00 00       	jmp    80722d <sys_close+0xb6>

    filp = current->openf[fd];
  8071a6:	48 8b 05 f3 d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d2f3]        # 4144a0 <current>
  8071ad:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8071b0:	48 63 d2             	movsxd rdx,edx
  8071b3:	48 83 c2 18          	add    rdx,0x18
  8071b7:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8071bc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8071c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071c8:	48 85 c0             	test   rax,rax
  8071cb:	74 35                	je     807202 <sys_close+0x8b>
  8071cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071d1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071d5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8071d9:	48 85 c0             	test   rax,rax
  8071dc:	74 24                	je     807202 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  8071de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071e2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071e6:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8071ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071ee:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8071f2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8071f6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8071fa:	48 89 d6             	mov    rsi,rdx
  8071fd:	48 89 c7             	mov    rdi,rax
  807200:	ff d1                	call   rcx

    vmfree(filp);
  807202:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807206:	48 89 c7             	mov    rdi,rax
  807209:	e8 2b a1 ff ff       	call   801339 <vmfree>
    current->openf[fd] = NULL;
  80720e:	48 8b 05 8b d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d28b]        # 4144a0 <current>
  807215:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807218:	48 63 d2             	movsxd rdx,edx
  80721b:	48 83 c2 18          	add    rdx,0x18
  80721f:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  807226:	00 00 

    return 0;
  807228:	b8 00 00 00 00       	mov    eax,0x0
}
  80722d:	c9                   	leave  
  80722e:	c3                   	ret    

000000000080722f <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  80722f:	f3 0f 1e fa          	endbr64 
  807233:	55                   	push   rbp
  807234:	48 89 e5             	mov    rbp,rsp
  807237:	48 83 ec 30          	sub    rsp,0x30
  80723b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80723e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807242:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807246:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80724d:	00 
    unsigned long ret = 0;
  80724e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807255:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807256:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80725a:	78 06                	js     807262 <sys_read+0x33>
  80725c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807260:	7e 09                	jle    80726b <sys_read+0x3c>
        return -EBADF;
  807262:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807269:	eb 72                	jmp    8072dd <sys_read+0xae>
    if(count < 0)
  80726b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807270:	79 09                	jns    80727b <sys_read+0x4c>
        return -EINVAL;
  807272:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807279:	eb 62                	jmp    8072dd <sys_read+0xae>

    filp = current->openf[fd];
  80727b:	48 8b 05 1e d2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d21e]        # 4144a0 <current>
  807282:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807285:	48 63 d2             	movsxd rdx,edx
  807288:	48 83 c2 18          	add    rdx,0x18
  80728c:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807291:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  807295:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807299:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80729d:	48 85 c0             	test   rax,rax
  8072a0:	74 37                	je     8072d9 <sys_read+0xaa>
  8072a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072a6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072aa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8072ae:	48 85 c0             	test   rax,rax
  8072b1:	74 26                	je     8072d9 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  8072b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8072bb:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  8072bf:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8072c3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8072c7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8072cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8072cf:	48 89 c7             	mov    rdi,rax
  8072d2:	41 ff d0             	call   r8
  8072d5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8072d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8072dd:	c9                   	leave  
  8072de:	c3                   	ret    

00000000008072df <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  8072df:	f3 0f 1e fa          	endbr64 
  8072e3:	55                   	push   rbp
  8072e4:	48 89 e5             	mov    rbp,rsp
  8072e7:	48 83 ec 30          	sub    rsp,0x30
  8072eb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8072ee:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8072f2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8072f6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8072fd:	00 
    unsigned long ret = 0;
  8072fe:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807305:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807306:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80730a:	78 06                	js     807312 <sys_write+0x33>
  80730c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807310:	7e 09                	jle    80731b <sys_write+0x3c>
        return -EBADF;
  807312:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807319:	eb 72                	jmp    80738d <sys_write+0xae>
    if(count < 0)
  80731b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807320:	79 09                	jns    80732b <sys_write+0x4c>
        return -EINVAL;
  807322:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807329:	eb 62                	jmp    80738d <sys_write+0xae>

    filp = current->openf[fd];
  80732b:	48 8b 05 6e d1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d16e]        # 4144a0 <current>
  807332:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807335:	48 63 d2             	movsxd rdx,edx
  807338:	48 83 c2 18          	add    rdx,0x18
  80733c:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807341:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807345:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807349:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80734d:	48 85 c0             	test   rax,rax
  807350:	74 37                	je     807389 <sys_write+0xaa>
  807352:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807356:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80735a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80735e:	48 85 c0             	test   rax,rax
  807361:	74 26                	je     807389 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  807363:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807367:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80736b:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  80736f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807373:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807377:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80737b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80737f:	48 89 c7             	mov    rdi,rax
  807382:	41 ff d0             	call   r8
  807385:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807389:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80738d:	c9                   	leave  
  80738e:	c3                   	ret    

000000000080738f <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  80738f:	f3 0f 1e fa          	endbr64 
  807393:	55                   	push   rbp
  807394:	48 89 e5             	mov    rbp,rsp
  807397:	48 83 ec 20          	sub    rsp,0x20
  80739b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80739e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8073a2:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8073a5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8073ac:	00 
    unsigned long ret = 0;
  8073ad:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8073b4:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  8073b5:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8073b9:	78 06                	js     8073c1 <sys_lseek+0x32>
  8073bb:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8073bf:	7e 09                	jle    8073ca <sys_lseek+0x3b>
        return -EBADF;
  8073c1:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8073c8:	eb 78                	jmp    807442 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  8073ca:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8073ce:	78 06                	js     8073d6 <sys_lseek+0x47>
  8073d0:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  8073d4:	7e 09                	jle    8073df <sys_lseek+0x50>
        return -EINVAL;
  8073d6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8073dd:	eb 63                	jmp    807442 <sys_lseek+0xb3>

    filp = current->openf[filds];
  8073df:	48 8b 05 ba d0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d0ba]        # 4144a0 <current>
  8073e6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8073e9:	48 63 d2             	movsxd rdx,edx
  8073ec:	48 83 c2 18          	add    rdx,0x18
  8073f0:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8073f5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  8073f9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8073fd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807401:	48 85 c0             	test   rax,rax
  807404:	74 38                	je     80743e <sys_lseek+0xaf>
  807406:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80740a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80740e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807412:	48 85 c0             	test   rax,rax
  807415:	74 27                	je     80743e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807417:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80741b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80741f:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807423:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807426:	48 63 d0             	movsxd rdx,eax
  807429:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80742d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807431:	48 89 ce             	mov    rsi,rcx
  807434:	48 89 c7             	mov    rdi,rax
  807437:	41 ff d0             	call   r8
  80743a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80743e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807442:	c9                   	leave  
  807443:	c3                   	ret    

0000000000807444 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807444:	f3 0f 1e fa          	endbr64 
  807448:	55                   	push   rbp
  807449:	48 89 e5             	mov    rbp,rsp
  80744c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  807450:	48 8b 05 49 d0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d049]        # 4144a0 <current>
  807457:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  80745e:	48 2d d0 00 00 00    	sub    rax,0xd0
  807464:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  807468:	bf c0 3c 81 00       	mov    edi,0x813cc0
  80746d:	b8 00 00 00 00       	mov    eax,0x0
  807472:	e8 a1 98 ff ff       	call   800d18 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  807477:	90                   	nop
  807478:	c9                   	leave  
  807479:	c3                   	ret    

000000000080747a <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  80747a:	f3 0f 1e fa          	endbr64 
  80747e:	55                   	push   rbp
  80747f:	48 89 e5             	mov    rbp,rsp
  807482:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807486:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80748a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80748d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  807491:	90                   	nop
  807492:	5d                   	pop    rbp
  807493:	c3                   	ret    

0000000000807494 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  807494:	f3 0f 1e fa          	endbr64 
  807498:	55                   	push   rbp
  807499:	48 89 e5             	mov    rbp,rsp
  80749c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  8074a0:	90                   	nop
  8074a1:	5d                   	pop    rbp
  8074a2:	c3                   	ret    

00000000008074a3 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  8074a3:	f3 0f 1e fa          	endbr64 
  8074a7:	55                   	push   rbp
  8074a8:	48 89 e5             	mov    rbp,rsp
  8074ab:	48 83 ec 10          	sub    rsp,0x10
  8074af:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8074b3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  8074b7:	bf cb 3c 81 00       	mov    edi,0x813ccb
  8074bc:	b8 00 00 00 00       	mov    eax,0x0
  8074c1:	e8 52 98 ff ff       	call   800d18 <printf>
    switch(cmd)
  8074c6:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8074cb:	74 09                	je     8074d6 <sys_reboot+0x33>
  8074cd:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  8074d2:	74 13                	je     8074e7 <sys_reboot+0x44>
  8074d4:	eb 22                	jmp    8074f8 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  8074d6:	be fe 00 00 00       	mov    esi,0xfe
  8074db:	bf 64 00 00 00       	mov    edi,0x64
  8074e0:	e8 fb e1 ff ff       	call   8056e0 <outb>
            break;
  8074e5:	eb 21                	jmp    807508 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  8074e7:	bf d8 3c 81 00       	mov    edi,0x813cd8
  8074ec:	b8 00 00 00 00       	mov    eax,0x0
  8074f1:	e8 22 98 ff ff       	call   800d18 <printf>
            break;
  8074f6:	eb 10                	jmp    807508 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  8074f8:	bf f8 3c 81 00       	mov    edi,0x813cf8
  8074fd:	b8 00 00 00 00       	mov    eax,0x0
  807502:	e8 11 98 ff ff       	call   800d18 <printf>
            break;
  807507:	90                   	nop
    }
    return 0;
  807508:	b8 00 00 00 00       	mov    eax,0x0
}
  80750d:	c9                   	leave  
  80750e:	c3                   	ret    

000000000080750f <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  80750f:	f3 0f 1e fa          	endbr64 
  807513:	55                   	push   rbp
  807514:	48 89 e5             	mov    rbp,rsp
  807517:	48 83 ec 30          	sub    rsp,0x30
  80751b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  80751f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807526:	00 
    long pathlen = 0;
  807527:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80752e:	00 
    struct dir_entry * dentry = NULL;
  80752f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807536:	00 

    printf("sys_chdir\n");
  807537:	bf 0f 3d 81 00       	mov    edi,0x813d0f
  80753c:	b8 00 00 00 00       	mov    eax,0x0
  807541:	e8 d2 97 ff ff       	call   800d18 <printf>
    path = (char *)vmalloc();
  807546:	b8 00 00 00 00       	mov    eax,0x0
  80754b:	e8 5a 9d ff ff       	call   8012aa <vmalloc>
  807550:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  807554:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807559:	75 0c                	jne    807567 <sys_chdir+0x58>
        return -ENOMEM;
  80755b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807562:	e9 ca 00 00 00       	jmp    807631 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  807567:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80756b:	ba 00 10 00 00       	mov    edx,0x1000
  807570:	be 00 00 00 00       	mov    esi,0x0
  807575:	48 89 c7             	mov    rdi,rax
  807578:	e8 83 41 00 00       	call   80b700 <memset>
    pathlen = strlen(filename);
  80757d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807581:	48 89 c7             	mov    rdi,rax
  807584:	e8 e5 43 00 00       	call   80b96e <strlen>
  807589:	48 98                	cdqe   
  80758b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  80758f:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  807594:	7f 18                	jg     8075ae <sys_chdir+0x9f>
    {
        vmfree(path);
  807596:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80759a:	48 89 c7             	mov    rdi,rax
  80759d:	e8 97 9d ff ff       	call   801339 <vmfree>
        return -EFAULT;
  8075a2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8075a9:	e9 83 00 00 00       	jmp    807631 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8075ae:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  8075b5:	00 
  8075b6:	7e 15                	jle    8075cd <sys_chdir+0xbe>
    {
        vmfree(path);
  8075b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075bc:	48 89 c7             	mov    rdi,rax
  8075bf:	e8 75 9d ff ff       	call   801339 <vmfree>
        return -ENAMETOOLONG;
  8075c4:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8075cb:	eb 64                	jmp    807631 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8075cd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8075d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075d5:	48 89 d6             	mov    rsi,rdx
  8075d8:	48 89 c7             	mov    rdi,rax
  8075db:	e8 6f 41 00 00       	call   80b74f <strcpy>

    dentry = path_walk(path,0);
  8075e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075e4:	be 00 00 00 00       	mov    esi,0x0
  8075e9:	48 89 c7             	mov    rdi,rax
  8075ec:	e8 49 f4 ff ff       	call   806a3a <path_walk>
  8075f1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  8075f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075f9:	48 89 c7             	mov    rdi,rax
  8075fc:	e8 38 9d ff ff       	call   801339 <vmfree>

    if(dentry == NULL)
  807601:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  807606:	75 09                	jne    807611 <sys_chdir+0x102>
        return -ENOENT;
  807608:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  80760f:	eb 20                	jmp    807631 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807611:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807615:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807619:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80761d:	48 83 f8 02          	cmp    rax,0x2
  807621:	74 09                	je     80762c <sys_chdir+0x11d>
        return -ENOTDIR;
  807623:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  80762a:	eb 05                	jmp    807631 <sys_chdir+0x122>
    return 0;
  80762c:	b8 00 00 00 00       	mov    eax,0x0
}
  807631:	c9                   	leave  
  807632:	c3                   	ret    

0000000000807633 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807633:	f3 0f 1e fa          	endbr64 
  807637:	55                   	push   rbp
  807638:	48 89 e5             	mov    rbp,rsp
  80763b:	48 83 ec 30          	sub    rsp,0x30
  80763f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807642:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807646:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80764a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807651:	00 
    unsigned long ret = 0;
  807652:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807659:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  80765a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80765e:	78 06                	js     807666 <sys_getdents+0x33>
  807660:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807664:	7e 09                	jle    80766f <sys_getdents+0x3c>
        return -EBADF;
  807666:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80766d:	eb 72                	jmp    8076e1 <sys_getdents+0xae>
    if(count < 0)
  80766f:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807674:	79 09                	jns    80767f <sys_getdents+0x4c>
        return -EINVAL;
  807676:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80767d:	eb 62                	jmp    8076e1 <sys_getdents+0xae>

    filp = current->openf[fd];
  80767f:	48 8b 05 1a ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ce1a]        # 4144a0 <current>
  807686:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807689:	48 63 d2             	movsxd rdx,edx
  80768c:	48 83 c2 18          	add    rdx,0x18
  807690:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807695:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807699:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80769d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076a1:	48 85 c0             	test   rax,rax
  8076a4:	74 37                	je     8076dd <sys_getdents+0xaa>
  8076a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076aa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076ae:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076b2:	48 85 c0             	test   rax,rax
  8076b5:	74 26                	je     8076dd <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8076b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076bb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076bf:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8076c3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8076c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076cb:	ba b6 6c 80 00       	mov    edx,0x806cb6
  8076d0:	48 89 ce             	mov    rsi,rcx
  8076d3:	48 89 c7             	mov    rdi,rax
  8076d6:	41 ff d0             	call   r8
  8076d9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8076dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8076e1:	c9                   	leave  
  8076e2:	c3                   	ret    

00000000008076e3 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8076e3:	f3 0f 1e fa          	endbr64 
  8076e7:	55                   	push   rbp
  8076e8:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8076eb:	0f b6 05 db 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200db]        # 4277cd <k_shift>
  8076f2:	84 c0                	test   al,al
  8076f4:	0f 94 c0             	sete   al
  8076f7:	88 05 d0 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200d0],al        # 4277cd <k_shift>
}
  8076fd:	90                   	nop
  8076fe:	5d                   	pop    rbp
  8076ff:	c3                   	ret    

0000000000807700 <ctrl>:
void ctrl()
{
  807700:	f3 0f 1e fa          	endbr64 
  807704:	55                   	push   rbp
  807705:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  807708:	0f b6 05 bf 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200bf]        # 4277ce <k_ctrl>
  80770f:	84 c0                	test   al,al
  807711:	0f 94 c0             	sete   al
  807714:	88 05 b4 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200b4],al        # 4277ce <k_ctrl>
}
  80771a:	90                   	nop
  80771b:	5d                   	pop    rbp
  80771c:	c3                   	ret    

000000000080771d <capslock>:
void capslock()
{
  80771d:	f3 0f 1e fa          	endbr64 
  807721:	55                   	push   rbp
  807722:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807725:	0f b6 05 a3 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200a3]        # 4277cf <k_capslock>
  80772c:	84 c0                	test   al,al
  80772e:	0f 94 c0             	sete   al
  807731:	88 05 98 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20098],al        # 4277cf <k_capslock>
}
  807737:	90                   	nop
  807738:	5d                   	pop    rbp
  807739:	c3                   	ret    

000000000080773a <to_ascii>:
char to_ascii(char scan_code)
{
  80773a:	f3 0f 1e fa          	endbr64 
  80773e:	55                   	push   rbp
  80773f:	48 89 e5             	mov    rbp,rsp
  807742:	89 f8                	mov    eax,edi
  807744:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807747:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80774e:	e9 c7 00 00 00       	jmp    80781a <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807753:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807756:	48 63 d0             	movsxd rdx,eax
  807759:	48 89 d0             	mov    rax,rdx
  80775c:	48 c1 e0 02          	shl    rax,0x2
  807760:	48 01 d0             	add    rax,rdx
  807763:	48 05 82 3e 81 00    	add    rax,0x813e82
  807769:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80776c:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  80776f:	0f 85 a1 00 00 00    	jne    807816 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807775:	0f b6 05 53 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20053]        # 4277cf <k_capslock>
  80777c:	84 c0                	test   al,al
  80777e:	74 55                	je     8077d5 <to_ascii+0x9b>
  807780:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807783:	48 63 d0             	movsxd rdx,eax
  807786:	48 89 d0             	mov    rax,rdx
  807789:	48 c1 e0 02          	shl    rax,0x2
  80778d:	48 01 d0             	add    rax,rdx
  807790:	48 05 80 3e 81 00    	add    rax,0x813e80
  807796:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807799:	3c 60                	cmp    al,0x60
  80779b:	7e 38                	jle    8077d5 <to_ascii+0x9b>
  80779d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077a0:	48 63 d0             	movsxd rdx,eax
  8077a3:	48 89 d0             	mov    rax,rdx
  8077a6:	48 c1 e0 02          	shl    rax,0x2
  8077aa:	48 01 d0             	add    rax,rdx
  8077ad:	48 05 80 3e 81 00    	add    rax,0x813e80
  8077b3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077b6:	3c 7a                	cmp    al,0x7a
  8077b8:	7f 1b                	jg     8077d5 <to_ascii+0x9b>
  8077ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077bd:	48 63 d0             	movsxd rdx,eax
  8077c0:	48 89 d0             	mov    rax,rdx
  8077c3:	48 c1 e0 02          	shl    rax,0x2
  8077c7:	48 01 d0             	add    rax,rdx
  8077ca:	48 05 81 3e 81 00    	add    rax,0x813e81
  8077d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077d3:	eb 54                	jmp    807829 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8077d5:	0f b6 05 f1 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fff1]        # 4277cd <k_shift>
  8077dc:	84 c0                	test   al,al
  8077de:	74 1b                	je     8077fb <to_ascii+0xc1>
  8077e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077e3:	48 63 d0             	movsxd rdx,eax
  8077e6:	48 89 d0             	mov    rax,rdx
  8077e9:	48 c1 e0 02          	shl    rax,0x2
  8077ed:	48 01 d0             	add    rax,rdx
  8077f0:	48 05 81 3e 81 00    	add    rax,0x813e81
  8077f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077f9:	eb 2e                	jmp    807829 <to_ascii+0xef>
            else return key_map[i].ascii;
  8077fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077fe:	48 63 d0             	movsxd rdx,eax
  807801:	48 89 d0             	mov    rax,rdx
  807804:	48 c1 e0 02          	shl    rax,0x2
  807808:	48 01 d0             	add    rax,rdx
  80780b:	48 05 80 3e 81 00    	add    rax,0x813e80
  807811:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807814:	eb 13                	jmp    807829 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807816:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80781a:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  80781e:	0f 8e 2f ff ff ff    	jle    807753 <to_ascii+0x19>
        }

    return '\0';
  807824:	b8 00 00 00 00       	mov    eax,0x0
}
  807829:	5d                   	pop    rbp
  80782a:	c3                   	ret    

000000000080782b <init_kb>:
int init_kb()
{
  80782b:	f3 0f 1e fa          	endbr64 
  80782f:	55                   	push   rbp
  807830:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807833:	bf c0 3d 81 00       	mov    edi,0x813dc0
  807838:	e8 3f ad ff ff       	call   80257c <reg_device>
    reg_driver(&drv_keyboard);
  80783d:	bf 20 3d 81 00       	mov    edi,0x813d20
  807842:	e8 1d b0 ff ff       	call   802864 <reg_driver>
}
  807847:	90                   	nop
  807848:	5d                   	pop    rbp
  807849:	c3                   	ret    

000000000080784a <key_proc>:
int key_proc()
{
  80784a:	f3 0f 1e fa          	endbr64 
  80784e:	55                   	push   rbp
  80784f:	48 89 e5             	mov    rbp,rsp
  807852:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807856:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  80785a:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  80785e:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807862:	bf 60 00 00 00       	mov    edi,0x60
  807867:	e8 8d de ff ff       	call   8056f9 <inb>
  80786c:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  80786f:	8b 05 57 48 00 00    	mov    eax,DWORD PTR [rip+0x4857]        # 80c0cc <key_bufq+0xc>
  807875:	83 c0 01             	add    eax,0x1
  807878:	8b 0d 52 48 00 00    	mov    ecx,DWORD PTR [rip+0x4852]        # 80c0d0 <key_bufq+0x10>
  80787e:	99                   	cdq    
  80787f:	f7 f9                	idiv   ecx
  807881:	8b 05 41 48 00 00    	mov    eax,DWORD PTR [rip+0x4841]        # 80c0c8 <key_bufq+0x8>
  807887:	39 c2                	cmp    edx,eax
  807889:	74 32                	je     8078bd <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  80788b:	48 8b 15 2e 48 00 00 	mov    rdx,QWORD PTR [rip+0x482e]        # 80c0c0 <key_bufq>
  807892:	8b 05 34 48 00 00    	mov    eax,DWORD PTR [rip+0x4834]        # 80c0cc <key_bufq+0xc>
  807898:	48 98                	cdqe   
  80789a:	48 01 c2             	add    rdx,rax
  80789d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8078a1:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8078a3:	8b 05 23 48 00 00    	mov    eax,DWORD PTR [rip+0x4823]        # 80c0cc <key_bufq+0xc>
  8078a9:	83 c0 01             	add    eax,0x1
  8078ac:	8b 0d 1e 48 00 00    	mov    ecx,DWORD PTR [rip+0x481e]        # 80c0d0 <key_bufq+0x10>
  8078b2:	99                   	cdq    
  8078b3:	f7 f9                	idiv   ecx
  8078b5:	89 d0                	mov    eax,edx
  8078b7:	89 05 0f 48 00 00    	mov    DWORD PTR [rip+0x480f],eax        # 80c0cc <key_bufq+0xc>
    }

    if(scan1==0x48)
  8078bd:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8078c1:	75 0a                	jne    8078cd <key_proc+0x83>
        scr_up();
  8078c3:	b8 00 00 00 00       	mov    eax,0x0
  8078c8:	e8 53 ef ff ff       	call   806820 <scr_up>
    if(scan1==0x50)
  8078cd:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8078d1:	75 0a                	jne    8078dd <key_proc+0x93>
        scr_down();
  8078d3:	b8 00 00 00 00       	mov    eax,0x0
  8078d8:	e8 dd ef ff ff       	call   8068ba <scr_down>
    switch (scan1)
  8078dd:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8078e1:	3d b6 00 00 00       	cmp    eax,0xb6
  8078e6:	74 41                	je     807929 <key_proc+0xdf>
  8078e8:	3d b6 00 00 00       	cmp    eax,0xb6
  8078ed:	7f 5e                	jg     80794d <key_proc+0x103>
  8078ef:	3d aa 00 00 00       	cmp    eax,0xaa
  8078f4:	74 33                	je     807929 <key_proc+0xdf>
  8078f6:	3d aa 00 00 00       	cmp    eax,0xaa
  8078fb:	7f 50                	jg     80794d <key_proc+0x103>
  8078fd:	3d 9d 00 00 00       	cmp    eax,0x9d
  807902:	74 31                	je     807935 <key_proc+0xeb>
  807904:	3d 9d 00 00 00       	cmp    eax,0x9d
  807909:	7f 42                	jg     80794d <key_proc+0x103>
  80790b:	83 f8 3a             	cmp    eax,0x3a
  80790e:	74 31                	je     807941 <key_proc+0xf7>
  807910:	83 f8 3a             	cmp    eax,0x3a
  807913:	7f 38                	jg     80794d <key_proc+0x103>
  807915:	83 f8 36             	cmp    eax,0x36
  807918:	74 0f                	je     807929 <key_proc+0xdf>
  80791a:	83 f8 36             	cmp    eax,0x36
  80791d:	7f 2e                	jg     80794d <key_proc+0x103>
  80791f:	83 f8 1d             	cmp    eax,0x1d
  807922:	74 11                	je     807935 <key_proc+0xeb>
  807924:	83 f8 2a             	cmp    eax,0x2a
  807927:	75 24                	jne    80794d <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807929:	b8 00 00 00 00       	mov    eax,0x0
  80792e:	e8 b0 fd ff ff       	call   8076e3 <shift>
            break;
  807933:	eb 19                	jmp    80794e <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  807935:	b8 00 00 00 00       	mov    eax,0x0
  80793a:	e8 c1 fd ff ff       	call   807700 <ctrl>
            break;
  80793f:	eb 0d                	jmp    80794e <key_proc+0x104>
        case 0x3a:
            capslock();
  807941:	b8 00 00 00 00       	mov    eax,0x0
  807946:	e8 d2 fd ff ff       	call   80771d <capslock>
            break;
  80794b:	eb 01                	jmp    80794e <key_proc+0x104>
        default:
            break;
  80794d:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  80794e:	b8 00 00 00 00       	mov    eax,0x0
  807953:	e8 b6 dd ff ff       	call   80570e <eoi>
    asm volatile("leave \r\n iretq");
  807958:	c9                   	leave  
  807959:	48 cf                	iretq  
}
  80795b:	90                   	nop
  80795c:	c9                   	leave  
  80795d:	c3                   	ret    

000000000080795e <sys_getkbc>:

char sys_getkbc()
{
  80795e:	f3 0f 1e fa          	endbr64 
  807962:	55                   	push   rbp
  807963:	48 89 e5             	mov    rbp,rsp
  807966:	48 83 ec 10          	sub    rsp,0x10
    if(key_bufq.tail==key_bufq.head)return -1;
  80796a:	8b 15 5c 47 00 00    	mov    edx,DWORD PTR [rip+0x475c]        # 80c0cc <key_bufq+0xc>
  807970:	8b 05 52 47 00 00    	mov    eax,DWORD PTR [rip+0x4752]        # 80c0c8 <key_bufq+0x8>
  807976:	39 c2                	cmp    edx,eax
  807978:	75 07                	jne    807981 <sys_getkbc+0x23>
  80797a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80797f:	eb 4e                	jmp    8079cf <sys_getkbc+0x71>
    char c=key_buf[key_bufq.head];
  807981:	8b 05 41 47 00 00    	mov    eax,DWORD PTR [rip+0x4741]        # 80c0c8 <key_bufq+0x8>
  807987:	48 98                	cdqe   
  807989:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  807990:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
  807993:	8b 05 2f 47 00 00    	mov    eax,DWORD PTR [rip+0x472f]        # 80c0c8 <key_bufq+0x8>
  807999:	83 c0 01             	add    eax,0x1
  80799c:	8b 0d 2e 47 00 00    	mov    ecx,DWORD PTR [rip+0x472e]        # 80c0d0 <key_bufq+0x10>
  8079a2:	99                   	cdq    
  8079a3:	f7 f9                	idiv   ecx
  8079a5:	89 d0                	mov    eax,edx
  8079a7:	89 05 1b 47 00 00    	mov    DWORD PTR [rip+0x471b],eax        # 80c0c8 <key_bufq+0x8>
    if(c&FLAG_BREAK)return -1;
  8079ad:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  8079b1:	79 07                	jns    8079ba <sys_getkbc+0x5c>
  8079b3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8079b8:	eb 15                	jmp    8079cf <sys_getkbc+0x71>
    c= to_ascii(c&0x7f);
  8079ba:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8079be:	83 e0 7f             	and    eax,0x7f
  8079c1:	89 c7                	mov    edi,eax
  8079c3:	e8 72 fd ff ff       	call   80773a <to_ascii>
  8079c8:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    return c;
  8079cb:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8079cf:	c9                   	leave  
  8079d0:	c3                   	ret    

00000000008079d1 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8079d1:	f3 0f 1e fa          	endbr64 
  8079d5:	55                   	push   rbp
  8079d6:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8079d9:	b8 00 00 00 00       	mov    eax,0x0
  8079de:	e8 8d 09 00 00       	call   808370 <hd_iterate>
    return 0;
  8079e3:	b8 00 00 00 00       	mov    eax,0x0
}
  8079e8:	5d                   	pop    rbp
  8079e9:	c3                   	ret    

00000000008079ea <disk_int_handler_c>:

int disk_int_handler_c()
{
  8079ea:	f3 0f 1e fa          	endbr64 
  8079ee:	55                   	push   rbp
  8079ef:	48 89 e5             	mov    rbp,rsp
  8079f2:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8079f6:	48 8b 05 e3 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ae3]        # 42a4e0 <running_req>
  8079fd:	48 85 c0             	test   rax,rax
  807a00:	75 0a                	jne    807a0c <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  807a02:	b8 01 00 00 00       	mov    eax,0x1
  807a07:	e9 a3 01 00 00       	jmp    807baf <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  807a0c:	48 8b 05 cd 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22acd]        # 42a4e0 <running_req>
  807a13:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a17:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  807a1b:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807a22:	48 8b 05 b7 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ab7]        # 42a4e0 <running_req>
  807a29:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807a2c:	83 f8 02             	cmp    eax,0x2
  807a2f:	74 0f                	je     807a40 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  807a31:	48 8b 05 a8 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22aa8]        # 42a4e0 <running_req>
  807a38:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807a3b:	83 f8 03             	cmp    eax,0x3
  807a3e:	75 07                	jne    807a47 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  807a40:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  807a47:	48 8b 05 92 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a92]        # 42a4e0 <running_req>
  807a4e:	8b 00                	mov    eax,DWORD PTR [rax]
  807a50:	85 c0                	test   eax,eax
  807a52:	75 42                	jne    807a96 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  807a54:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807a5b:	eb 22                	jmp    807a7f <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  807a5d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a60:	0f b7 c0             	movzx  eax,ax
  807a63:	89 c7                	mov    edi,eax
  807a65:	e8 99 dc ff ff       	call   805703 <inw>
  807a6a:	89 c2                	mov    edx,eax
  807a6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a70:	48 8d 48 02          	lea    rcx,[rax+0x2]
  807a74:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  807a78:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  807a7b:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807a7f:	48 8b 05 5a 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a5a]        # 42a4e0 <running_req>
  807a86:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807a89:	c1 e0 08             	shl    eax,0x8
  807a8c:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  807a8f:	7c cc                	jl     807a5d <disk_int_handler_c+0x73>
  807a91:	e9 ca 00 00 00       	jmp    807b60 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  807a96:	48 8b 05 43 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a43]        # 42a4e0 <running_req>
  807a9d:	8b 00                	mov    eax,DWORD PTR [rax]
  807a9f:	83 f8 01             	cmp    eax,0x1
  807aa2:	75 42                	jne    807ae6 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  807aa4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807aab:	eb 25                	jmp    807ad2 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  807aad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ab1:	48 8d 50 02          	lea    rdx,[rax+0x2]
  807ab5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  807ab9:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807abc:	0f b7 d0             	movzx  edx,ax
  807abf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807ac2:	0f b7 c0             	movzx  eax,ax
  807ac5:	89 d6                	mov    esi,edx
  807ac7:	89 c7                	mov    edi,eax
  807ac9:	e8 1f dc ff ff       	call   8056ed <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  807ace:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807ad2:	48 8b 05 07 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a07]        # 42a4e0 <running_req>
  807ad9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807adc:	c1 e0 08             	shl    eax,0x8
  807adf:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807ae2:	7c c9                	jl     807aad <disk_int_handler_c+0xc3>
  807ae4:	eb 7a                	jmp    807b60 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  807ae6:	48 8b 05 f3 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229f3]        # 42a4e0 <running_req>
  807aed:	8b 00                	mov    eax,DWORD PTR [rax]
  807aef:	83 f8 02             	cmp    eax,0x2
  807af2:	75 34                	jne    807b28 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  807af4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807af7:	83 c0 07             	add    eax,0x7
  807afa:	0f b6 c0             	movzx  eax,al
  807afd:	89 c7                	mov    edi,eax
  807aff:	e8 f5 db ff ff       	call   8056f9 <inb>
  807b04:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  807b07:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807b0a:	0f b7 c0             	movzx  eax,ax
  807b0d:	89 c7                	mov    edi,eax
  807b0f:	e8 ef db ff ff       	call   805703 <inw>
  807b14:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  807b18:	48 8b 05 c1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229c1]        # 42a4e0 <running_req>
  807b1f:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  807b26:	eb 38                	jmp    807b60 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  807b28:	48 8b 05 b1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229b1]        # 42a4e0 <running_req>
  807b2f:	8b 00                	mov    eax,DWORD PTR [rax]
  807b31:	83 f8 03             	cmp    eax,0x3
  807b34:	75 2a                	jne    807b60 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  807b36:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807b39:	83 c0 07             	add    eax,0x7
  807b3c:	0f b6 c0             	movzx  eax,al
  807b3f:	89 c7                	mov    edi,eax
  807b41:	e8 b3 db ff ff       	call   8056f9 <inb>
  807b46:	0f b6 c0             	movzx  eax,al
  807b49:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  807b4c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b4f:	89 c6                	mov    esi,eax
  807b51:	bf 56 40 81 00       	mov    edi,0x814056
  807b56:	b8 00 00 00 00       	mov    eax,0x0
  807b5b:	e8 b8 91 ff ff       	call   800d18 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  807b60:	48 8b 05 79 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22979]        # 42a4e0 <running_req>
  807b67:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807b6e:	48 8b 05 6b 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2296b]        # 42a4e0 <running_req>
  807b75:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807b79:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807b80:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  807b83:	48 8b 05 5e 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2295e]        # 42a4e8 <running_devman_req>
  807b8a:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  807b91:	00 00 00 
    running_devman_req=NULL;
  807b94:	48 c7 05 49 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22949],0x0        # 42a4e8 <running_devman_req>
  807b9b:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807b9f:	48 c7 05 36 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22936],0x0        # 42a4e0 <running_req>
  807ba6:	00 00 00 00 
    return 0;
  807baa:	b8 00 00 00 00       	mov    eax,0x0
}
  807baf:	c9                   	leave  
  807bb0:	c3                   	ret    

0000000000807bb1 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  807bb1:	f3 0f 1e fa          	endbr64 
  807bb5:	55                   	push   rbp
  807bb6:	48 89 e5             	mov    rbp,rsp
  807bb9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  807bbc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bbf:	48 63 d0             	movsxd rdx,eax
  807bc2:	48 89 d0             	mov    rax,rdx
  807bc5:	48 01 c0             	add    rax,rax
  807bc8:	48 01 d0             	add    rax,rdx
  807bcb:	48 c1 e0 04          	shl    rax,0x4
  807bcf:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807bd5:	8b 00                	mov    eax,DWORD PTR [rax]
}
  807bd7:	5d                   	pop    rbp
  807bd8:	c3                   	ret    

0000000000807bd9 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  807bd9:	f3 0f 1e fa          	endbr64 
  807bdd:	55                   	push   rbp
  807bde:	48 89 e5             	mov    rbp,rsp
  807be1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807be4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807be7:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807bea:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  807bed:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  807bf1:	8b 05 1d 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2291d]        # 42a514 <tail>
  807bf7:	83 c0 01             	add    eax,0x1
  807bfa:	48 63 d0             	movsxd rdx,eax
  807bfd:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  807c04:	48 c1 ea 20          	shr    rdx,0x20
  807c08:	01 c2                	add    edx,eax
  807c0a:	c1 fa 07             	sar    edx,0x7
  807c0d:	89 c1                	mov    ecx,eax
  807c0f:	c1 f9 1f             	sar    ecx,0x1f
  807c12:	29 ca                	sub    edx,ecx
  807c14:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  807c1a:	29 c8                	sub    eax,ecx
  807c1c:	89 c2                	mov    edx,eax
  807c1e:	8b 05 ec 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ec]        # 42a510 <head>
  807c24:	39 c2                	cmp    edx,eax
  807c26:	75 0a                	jne    807c32 <request+0x59>
    {
        return -1;
  807c28:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c2d:	e9 0d 01 00 00       	jmp    807d3f <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  807c32:	8b 05 dc 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228dc]        # 42a514 <tail>
  807c38:	48 63 d0             	movsxd rdx,eax
  807c3b:	48 89 d0             	mov    rax,rdx
  807c3e:	48 01 c0             	add    rax,rax
  807c41:	48 01 d0             	add    rax,rdx
  807c44:	48 c1 e0 04          	shl    rax,0x4
  807c48:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  807c4f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807c52:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  807c54:	8b 05 ba 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ba]        # 42a514 <tail>
  807c5a:	48 63 d0             	movsxd rdx,eax
  807c5d:	48 89 d0             	mov    rax,rdx
  807c60:	48 01 c0             	add    rax,rax
  807c63:	48 01 d0             	add    rax,rdx
  807c66:	48 c1 e0 04          	shl    rax,0x4
  807c6a:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  807c71:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c74:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  807c76:	8b 05 98 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22898]        # 42a514 <tail>
  807c7c:	48 63 d0             	movsxd rdx,eax
  807c7f:	48 89 d0             	mov    rax,rdx
  807c82:	48 01 c0             	add    rax,rax
  807c85:	48 01 d0             	add    rax,rdx
  807c88:	48 c1 e0 04          	shl    rax,0x4
  807c8c:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  807c93:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807c96:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  807c98:	8b 05 76 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22876]        # 42a514 <tail>
  807c9e:	48 63 d0             	movsxd rdx,eax
  807ca1:	48 89 d0             	mov    rax,rdx
  807ca4:	48 01 c0             	add    rax,rax
  807ca7:	48 01 d0             	add    rax,rdx
  807caa:	48 c1 e0 04          	shl    rax,0x4
  807cae:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  807cb5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  807cb8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  807cba:	8b 05 54 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22854]        # 42a514 <tail>
  807cc0:	48 63 d0             	movsxd rdx,eax
  807cc3:	48 89 d0             	mov    rax,rdx
  807cc6:	48 01 c0             	add    rax,rax
  807cc9:	48 01 d0             	add    rax,rdx
  807ccc:	48 c1 e0 04          	shl    rax,0x4
  807cd0:	48 05 fc 77 42 00    	add    rax,0x4277fc
  807cd6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  807cdc:	8b 05 32 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22832]        # 42a514 <tail>
  807ce2:	48 63 d0             	movsxd rdx,eax
  807ce5:	48 89 d0             	mov    rax,rdx
  807ce8:	48 01 c0             	add    rax,rax
  807ceb:	48 01 d0             	add    rax,rdx
  807cee:	48 c1 e0 04          	shl    rax,0x4
  807cf2:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  807cf9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807cfd:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  807d00:	8b 05 0e 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2280e]        # 42a514 <tail>
  807d06:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  807d09:	8b 05 05 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22805]        # 42a514 <tail>
  807d0f:	8d 50 01             	lea    edx,[rax+0x1]
  807d12:	48 63 c2             	movsxd rax,edx
  807d15:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807d1c:	48 c1 e8 20          	shr    rax,0x20
  807d20:	01 d0                	add    eax,edx
  807d22:	c1 f8 07             	sar    eax,0x7
  807d25:	89 d1                	mov    ecx,edx
  807d27:	c1 f9 1f             	sar    ecx,0x1f
  807d2a:	29 c8                	sub    eax,ecx
  807d2c:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807d32:	89 d0                	mov    eax,edx
  807d34:	29 c8                	sub    eax,ecx
  807d36:	89 05 d8 27 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc227d8],eax        # 42a514 <tail>
    return r;
  807d3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807d3f:	5d                   	pop    rbp
  807d40:	c3                   	ret    

0000000000807d41 <execute_request>:
int execute_request(){
  807d41:	f3 0f 1e fa          	endbr64 
  807d45:	55                   	push   rbp
  807d46:	48 89 e5             	mov    rbp,rsp
  807d49:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  807d4d:	48 8b 05 8c 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2278c]        # 42a4e0 <running_req>
  807d54:	48 85 c0             	test   rax,rax
  807d57:	74 6a                	je     807dc3 <execute_request+0x82>
    {
        running_req->time++;
  807d59:	48 8b 05 80 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22780]        # 42a4e0 <running_req>
  807d60:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  807d63:	83 c2 01             	add    edx,0x1
  807d66:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  807d69:	48 8b 05 70 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22770]        # 42a4e0 <running_req>
  807d70:	8b 00                	mov    eax,DWORD PTR [rax]
  807d72:	83 f8 02             	cmp    eax,0x2
  807d75:	74 0a                	je     807d81 <execute_request+0x40>
            return 2;
  807d77:	b8 02 00 00 00       	mov    eax,0x2
  807d7c:	e9 b4 01 00 00       	jmp    807f35 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  807d81:	48 8b 05 58 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22758]        # 42a4e0 <running_req>
  807d88:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  807d8b:	83 f8 0a             	cmp    eax,0xa
  807d8e:	7e 29                	jle    807db9 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  807d90:	48 8b 05 49 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22749]        # 42a4e0 <running_req>
  807d97:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  807d9e:	48 8b 05 3b 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2273b]        # 42a4e0 <running_req>
  807da5:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  807dac:	48 c7 05 29 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22729],0x0        # 42a4e0 <running_req>
  807db3:	00 00 00 00 
  807db7:	eb 0a                	jmp    807dc3 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  807db9:	b8 02 00 00 00       	mov    eax,0x2
  807dbe:	e9 72 01 00 00       	jmp    807f35 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  807dc3:	8b 15 47 27 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22747]        # 42a510 <head>
  807dc9:	8b 05 45 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22745]        # 42a514 <tail>
  807dcf:	39 c2                	cmp    edx,eax
  807dd1:	75 0a                	jne    807ddd <execute_request+0x9c>
  807dd3:	b8 01 00 00 00       	mov    eax,0x1
  807dd8:	e9 58 01 00 00       	jmp    807f35 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  807ddd:	8b 05 2d 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2272d]        # 42a510 <head>
  807de3:	48 63 d0             	movsxd rdx,eax
  807de6:	48 89 d0             	mov    rax,rdx
  807de9:	48 01 c0             	add    rax,rax
  807dec:	48 01 d0             	add    rax,rdx
  807def:	48 c1 e0 04          	shl    rax,0x4
  807df3:	48 05 e0 77 42 00    	add    rax,0x4277e0
  807df9:	48 89 05 e0 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc226e0],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  807e00:	8b 05 0a 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2270a]        # 42a510 <head>
  807e06:	8d 50 01             	lea    edx,[rax+0x1]
  807e09:	48 63 c2             	movsxd rax,edx
  807e0c:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  807e13:	48 c1 e8 20          	shr    rax,0x20
  807e17:	01 d0                	add    eax,edx
  807e19:	c1 f8 07             	sar    eax,0x7
  807e1c:	89 d1                	mov    ecx,edx
  807e1e:	c1 f9 1f             	sar    ecx,0x1f
  807e21:	29 c8                	sub    eax,ecx
  807e23:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  807e29:	89 d0                	mov    eax,edx
  807e2b:	29 c8                	sub    eax,ecx
  807e2d:	89 05 dd 26 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc226dd],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  807e33:	48 8b 05 a6 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226a6]        # 42a4e0 <running_req>
  807e3a:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  807e41:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  807e48:	48 8b 05 91 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22691]        # 42a4e0 <running_req>
  807e4f:	8b 00                	mov    eax,DWORD PTR [rax]
  807e51:	83 f8 03             	cmp    eax,0x3
  807e54:	0f 84 ad 00 00 00    	je     807f07 <execute_request+0x1c6>
  807e5a:	83 f8 03             	cmp    eax,0x3
  807e5d:	0f 8f bf 00 00 00    	jg     807f22 <execute_request+0x1e1>
  807e63:	83 f8 02             	cmp    eax,0x2
  807e66:	0f 84 85 00 00 00    	je     807ef1 <execute_request+0x1b0>
  807e6c:	83 f8 02             	cmp    eax,0x2
  807e6f:	0f 8f ad 00 00 00    	jg     807f22 <execute_request+0x1e1>
  807e75:	85 c0                	test   eax,eax
  807e77:	74 0a                	je     807e83 <execute_request+0x142>
  807e79:	83 f8 01             	cmp    eax,0x1
  807e7c:	74 3c                	je     807eba <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  807e7e:	e9 9f 00 00 00       	jmp    807f22 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  807e83:	48 8b 05 56 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22656]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807e8a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  807e8e:	48 8b 05 4b 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2264b]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807e95:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  807e98:	48 8b 05 41 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22641]        # 42a4e0 <running_req>
  807e9f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  807ea2:	89 c6                	mov    esi,eax
  807ea4:	48 8b 05 35 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22635]        # 42a4e0 <running_req>
  807eab:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807eae:	89 c7                	mov    edi,eax
  807eb0:	e8 a7 00 00 00       	call   807f5c <async_read_disk>
  807eb5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807eb8:	eb 69                	jmp    807f23 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  807eba:	48 8b 05 1f 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2261f]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807ec1:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  807ec5:	48 8b 05 14 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22614]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807ecc:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  807ecf:	48 8b 05 0a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2260a]        # 42a4e0 <running_req>
  807ed6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  807ed9:	89 c6                	mov    esi,eax
  807edb:	48 8b 05 fe 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225fe]        # 42a4e0 <running_req>
  807ee2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807ee5:	89 c7                	mov    edi,eax
  807ee7:	e8 88 01 00 00       	call   808074 <async_write_disk>
  807eec:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807eef:	eb 32                	jmp    807f23 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  807ef1:	48 8b 05 e8 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225e8]        # 42a4e0 <running_req>
  807ef8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807efb:	89 c7                	mov    edi,eax
  807efd:	e8 8f 06 00 00       	call   808591 <async_check_disk>
  807f02:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807f05:	eb 1c                	jmp    807f23 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  807f07:	48 8b 05 d2 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225d2]        # 42a4e0 <running_req>
  807f0e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807f11:	89 c7                	mov    edi,eax
  807f13:	b8 00 00 00 00       	mov    eax,0x0
  807f18:	e8 1a 00 00 00       	call   807f37 <async_reset_disk>
  807f1d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807f20:	eb 01                	jmp    807f23 <execute_request+0x1e2>
        break;
  807f22:	90                   	nop
    }
    if(r==-1)return -1;
  807f23:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807f27:	75 07                	jne    807f30 <execute_request+0x1ef>
  807f29:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807f2e:	eb 05                	jmp    807f35 <execute_request+0x1f4>
    return 0;
  807f30:	b8 00 00 00 00       	mov    eax,0x0
}
  807f35:	c9                   	leave  
  807f36:	c3                   	ret    

0000000000807f37 <async_reset_disk>:
int async_reset_disk(int disk)
{
  807f37:	f3 0f 1e fa          	endbr64 
  807f3b:	55                   	push   rbp
  807f3c:	48 89 e5             	mov    rbp,rsp
  807f3f:	48 83 ec 10          	sub    rsp,0x10
  807f43:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  807f46:	be 0c 00 00 00       	mov    esi,0xc
  807f4b:	bf f6 03 00 00       	mov    edi,0x3f6
  807f50:	e8 8b d7 ff ff       	call   8056e0 <outb>
    return 0;
  807f55:	b8 00 00 00 00       	mov    eax,0x0
}
  807f5a:	c9                   	leave  
  807f5b:	c3                   	ret    

0000000000807f5c <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  807f5c:	f3 0f 1e fa          	endbr64 
  807f60:	55                   	push   rbp
  807f61:	48 89 e5             	mov    rbp,rsp
  807f64:	48 83 ec 30          	sub    rsp,0x30
  807f68:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807f6b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807f6e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807f71:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  807f75:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807f7b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807f82:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807f86:	74 06                	je     807f8e <async_read_disk+0x32>
  807f88:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807f8c:	75 06                	jne    807f94 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  807f8e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  807f94:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807f98:	74 06                	je     807fa0 <async_read_disk+0x44>
  807f9a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807f9e:	75 07                	jne    807fa7 <async_read_disk+0x4b>
        slave_disk=1;
  807fa0:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  807fa7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807faa:	0f b6 d0             	movzx  edx,al
  807fad:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fb1:	83 c0 02             	add    eax,0x2
  807fb4:	0f b7 c0             	movzx  eax,ax
  807fb7:	89 d6                	mov    esi,edx
  807fb9:	89 c7                	mov    edi,eax
  807fbb:	e8 20 d7 ff ff       	call   8056e0 <outb>
    outb(port+3,lba&0xff);
  807fc0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fc3:	0f b6 d0             	movzx  edx,al
  807fc6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fca:	83 c0 03             	add    eax,0x3
  807fcd:	0f b7 c0             	movzx  eax,ax
  807fd0:	89 d6                	mov    esi,edx
  807fd2:	89 c7                	mov    edi,eax
  807fd4:	e8 07 d7 ff ff       	call   8056e0 <outb>
    outb(port+4,(lba>>8)&0xff);
  807fd9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fdc:	c1 e8 08             	shr    eax,0x8
  807fdf:	0f b6 d0             	movzx  edx,al
  807fe2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807fe6:	83 c0 04             	add    eax,0x4
  807fe9:	0f b7 c0             	movzx  eax,ax
  807fec:	89 d6                	mov    esi,edx
  807fee:	89 c7                	mov    edi,eax
  807ff0:	e8 eb d6 ff ff       	call   8056e0 <outb>
    outb(port+5,(lba>>16)&0xff);
  807ff5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807ff8:	c1 e8 10             	shr    eax,0x10
  807ffb:	0f b6 d0             	movzx  edx,al
  807ffe:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808002:	83 c0 05             	add    eax,0x5
  808005:	0f b7 c0             	movzx  eax,ax
  808008:	89 d6                	mov    esi,edx
  80800a:	89 c7                	mov    edi,eax
  80800c:	e8 cf d6 ff ff       	call   8056e0 <outb>
    char drv=slave_disk?0x10:0;
  808011:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808015:	74 07                	je     80801e <async_read_disk+0xc2>
  808017:	b8 10 00 00 00       	mov    eax,0x10
  80801c:	eb 05                	jmp    808023 <async_read_disk+0xc7>
  80801e:	b8 00 00 00 00       	mov    eax,0x0
  808023:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808026:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808029:	c1 e8 18             	shr    eax,0x18
  80802c:	83 e0 0f             	and    eax,0xf
  80802f:	89 c2                	mov    edx,eax
  808031:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808035:	09 d0                	or     eax,edx
  808037:	83 c8 e0             	or     eax,0xffffffe0
  80803a:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  80803d:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808041:	0f b6 d0             	movzx  edx,al
  808044:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808048:	83 c0 06             	add    eax,0x6
  80804b:	0f b7 c0             	movzx  eax,ax
  80804e:	89 d6                	mov    esi,edx
  808050:	89 c7                	mov    edi,eax
  808052:	e8 89 d6 ff ff       	call   8056e0 <outb>
    outb(port+7,DISK_CMD_READ);
  808057:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80805b:	83 c0 07             	add    eax,0x7
  80805e:	0f b7 c0             	movzx  eax,ax
  808061:	be 20 00 00 00       	mov    esi,0x20
  808066:	89 c7                	mov    edi,eax
  808068:	e8 73 d6 ff ff       	call   8056e0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  80806d:	b8 00 00 00 00       	mov    eax,0x0
}
  808072:	c9                   	leave  
  808073:	c3                   	ret    

0000000000808074 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  808074:	f3 0f 1e fa          	endbr64 
  808078:	55                   	push   rbp
  808079:	48 89 e5             	mov    rbp,rsp
  80807c:	48 83 ec 30          	sub    rsp,0x30
  808080:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808083:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808086:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808089:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80808d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808093:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80809a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80809e:	74 06                	je     8080a6 <async_write_disk+0x32>
  8080a0:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8080a4:	75 06                	jne    8080ac <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  8080a6:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8080ac:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8080b0:	74 06                	je     8080b8 <async_write_disk+0x44>
  8080b2:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8080b6:	75 07                	jne    8080bf <async_write_disk+0x4b>
        slave_disk=1;
  8080b8:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8080bf:	bf f7 00 00 00       	mov    edi,0xf7
  8080c4:	e8 30 d6 ff ff       	call   8056f9 <inb>
  8080c9:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8080cc:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8080d0:	83 e0 01             	and    eax,0x1
  8080d3:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  8080d6:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8080da:	74 0a                	je     8080e6 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8080dc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8080e1:	e9 d5 00 00 00       	jmp    8081bb <async_write_disk+0x147>
        }
        t&=0x88;
  8080e6:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8080ea:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8080ee:	74 02                	je     8080f2 <async_write_disk+0x7e>
    {
  8080f0:	eb cd                	jmp    8080bf <async_write_disk+0x4b>
        if(t==0x8)break;
  8080f2:	90                   	nop
    }
    outb(port+2,sec_n);
  8080f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8080f6:	0f b6 d0             	movzx  edx,al
  8080f9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8080fd:	83 c0 02             	add    eax,0x2
  808100:	0f b7 c0             	movzx  eax,ax
  808103:	89 d6                	mov    esi,edx
  808105:	89 c7                	mov    edi,eax
  808107:	e8 d4 d5 ff ff       	call   8056e0 <outb>
    outb(port+3,lba&0xff);
  80810c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80810f:	0f b6 d0             	movzx  edx,al
  808112:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808116:	83 c0 03             	add    eax,0x3
  808119:	0f b7 c0             	movzx  eax,ax
  80811c:	89 d6                	mov    esi,edx
  80811e:	89 c7                	mov    edi,eax
  808120:	e8 bb d5 ff ff       	call   8056e0 <outb>
    outb(port+4,(lba>>8)&0xff);
  808125:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808128:	c1 e8 08             	shr    eax,0x8
  80812b:	0f b6 d0             	movzx  edx,al
  80812e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808132:	83 c0 04             	add    eax,0x4
  808135:	0f b7 c0             	movzx  eax,ax
  808138:	89 d6                	mov    esi,edx
  80813a:	89 c7                	mov    edi,eax
  80813c:	e8 9f d5 ff ff       	call   8056e0 <outb>
    outb(port+5,(lba>>16)&0xff);
  808141:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808144:	c1 e8 10             	shr    eax,0x10
  808147:	0f b6 d0             	movzx  edx,al
  80814a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80814e:	83 c0 05             	add    eax,0x5
  808151:	0f b7 c0             	movzx  eax,ax
  808154:	89 d6                	mov    esi,edx
  808156:	89 c7                	mov    edi,eax
  808158:	e8 83 d5 ff ff       	call   8056e0 <outb>
    char drv=slave_disk?0x10:0;
  80815d:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808161:	74 07                	je     80816a <async_write_disk+0xf6>
  808163:	b8 10 00 00 00       	mov    eax,0x10
  808168:	eb 05                	jmp    80816f <async_write_disk+0xfb>
  80816a:	b8 00 00 00 00       	mov    eax,0x0
  80816f:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808172:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808175:	c1 e8 18             	shr    eax,0x18
  808178:	83 e0 0f             	and    eax,0xf
  80817b:	89 c2                	mov    edx,eax
  80817d:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808181:	09 d0                	or     eax,edx
  808183:	83 c8 e0             	or     eax,0xffffffe0
  808186:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  808189:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80818d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808191:	83 c0 06             	add    eax,0x6
  808194:	0f b7 c0             	movzx  eax,ax
  808197:	89 d6                	mov    esi,edx
  808199:	89 c7                	mov    edi,eax
  80819b:	e8 40 d5 ff ff       	call   8056e0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8081a0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8081a4:	83 c0 07             	add    eax,0x7
  8081a7:	0f b7 c0             	movzx  eax,ax
  8081aa:	be 30 00 00 00       	mov    esi,0x30
  8081af:	89 c7                	mov    edi,eax
  8081b1:	e8 2a d5 ff ff       	call   8056e0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  8081b6:	b8 00 00 00 00       	mov    eax,0x0
}
  8081bb:	c9                   	leave  
  8081bc:	c3                   	ret    

00000000008081bd <read_disk>:
int read_disk(driver_args* args)
{
  8081bd:	f3 0f 1e fa          	endbr64 
  8081c1:	55                   	push   rbp
  8081c2:	48 89 e5             	mov    rbp,rsp
  8081c5:	48 83 ec 20          	sub    rsp,0x20
  8081c9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8081cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081d1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8081d4:	48 98                	cdqe   
  8081d6:	48 89 c2             	mov    rdx,rax
  8081d9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081dd:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8081e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8081e6:	89 ce                	mov    esi,ecx
  8081e8:	89 c7                	mov    edi,eax
  8081ea:	e8 8d 05 00 00       	call   80877c <read_disk_asm>
  8081ef:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8081f2:	48 8b 05 e7 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e7]        # 42a4e0 <running_req>
  8081f9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808200:	48 8b 05 d9 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222d9]        # 42a4e0 <running_req>
  808207:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80820b:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808212:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808215:	48 c7 05 c0 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222c0],0x0        # 42a4e0 <running_req>
  80821c:	00 00 00 00 
    return ret;
  808220:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808223:	c9                   	leave  
  808224:	c3                   	ret    

0000000000808225 <write_disk>:
int write_disk(driver_args* args)
{
  808225:	f3 0f 1e fa          	endbr64 
  808229:	55                   	push   rbp
  80822a:	48 89 e5             	mov    rbp,rsp
  80822d:	48 83 ec 20          	sub    rsp,0x20
  808231:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  808235:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808239:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80823c:	48 98                	cdqe   
  80823e:	48 89 c2             	mov    rdx,rax
  808241:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808245:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808248:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80824c:	8b 00                	mov    eax,DWORD PTR [rax]
  80824e:	89 ce                	mov    esi,ecx
  808250:	89 c7                	mov    edi,eax
  808252:	e8 a5 05 00 00       	call   8087fc <write_disk_asm>
  808257:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80825a:	48 8b 05 7f 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2227f]        # 42a4e0 <running_req>
  808261:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808268:	48 8b 05 71 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22271]        # 42a4e0 <running_req>
  80826f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808273:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80827a:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80827d:	48 c7 05 58 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22258],0x0        # 42a4e0 <running_req>
  808284:	00 00 00 00 
    return ret;
  808288:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80828b:	c9                   	leave  
  80828c:	c3                   	ret    

000000000080828d <chk_result>:
int chk_result(int r)
{
  80828d:	f3 0f 1e fa          	endbr64 
  808291:	55                   	push   rbp
  808292:	48 89 e5             	mov    rbp,rsp
  808295:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  808298:	90                   	nop
  808299:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80829c:	48 63 d0             	movsxd rdx,eax
  80829f:	48 89 d0             	mov    rax,rdx
  8082a2:	48 01 c0             	add    rax,rax
  8082a5:	48 01 d0             	add    rax,rdx
  8082a8:	48 c1 e0 04          	shl    rax,0x4
  8082ac:	48 05 fc 77 42 00    	add    rax,0x4277fc
  8082b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8082b4:	83 f8 03             	cmp    eax,0x3
  8082b7:	75 e0                	jne    808299 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  8082b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8082bc:	48 63 d0             	movsxd rdx,eax
  8082bf:	48 89 d0             	mov    rax,rdx
  8082c2:	48 01 c0             	add    rax,rax
  8082c5:	48 01 d0             	add    rax,rdx
  8082c8:	48 c1 e0 04          	shl    rax,0x4
  8082cc:	48 05 00 78 42 00    	add    rax,0x427800
  8082d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8082d4:	83 f8 01             	cmp    eax,0x1
  8082d7:	0f 94 c0             	sete   al
  8082da:	0f b6 c0             	movzx  eax,al
}
  8082dd:	5d                   	pop    rbp
  8082de:	c3                   	ret    

00000000008082df <disk_existent>:
int disk_existent(int disk)
{
  8082df:	f3 0f 1e fa          	endbr64 
  8082e3:	55                   	push   rbp
  8082e4:	48 89 e5             	mov    rbp,rsp
  8082e7:	48 83 ec 10          	sub    rsp,0x10
  8082eb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8082ee:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8082f2:	74 5f                	je     808353 <disk_existent+0x74>
  8082f4:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8082f8:	7f 6e                	jg     808368 <disk_existent+0x89>
  8082fa:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8082fe:	74 3e                	je     80833e <disk_existent+0x5f>
  808300:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808304:	7f 62                	jg     808368 <disk_existent+0x89>
  808306:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80830a:	74 08                	je     808314 <disk_existent+0x35>
  80830c:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  808310:	74 17                	je     808329 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  808312:	eb 54                	jmp    808368 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  808314:	bf 74 40 81 00       	mov    edi,0x814074
  808319:	e8 96 a6 ff ff       	call   8029b4 <sys_find_dev>
  80831e:	83 f8 ff             	cmp    eax,0xffffffff
  808321:	0f 95 c0             	setne  al
  808324:	0f b6 c0             	movzx  eax,al
  808327:	eb 45                	jmp    80836e <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  808329:	bf 78 40 81 00       	mov    edi,0x814078
  80832e:	e8 81 a6 ff ff       	call   8029b4 <sys_find_dev>
  808333:	83 f8 ff             	cmp    eax,0xffffffff
  808336:	0f 95 c0             	setne  al
  808339:	0f b6 c0             	movzx  eax,al
  80833c:	eb 30                	jmp    80836e <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  80833e:	bf 7c 40 81 00       	mov    edi,0x81407c
  808343:	e8 6c a6 ff ff       	call   8029b4 <sys_find_dev>
  808348:	83 f8 ff             	cmp    eax,0xffffffff
  80834b:	0f 95 c0             	setne  al
  80834e:	0f b6 c0             	movzx  eax,al
  808351:	eb 1b                	jmp    80836e <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  808353:	bf 80 40 81 00       	mov    edi,0x814080
  808358:	e8 57 a6 ff ff       	call   8029b4 <sys_find_dev>
  80835d:	83 f8 ff             	cmp    eax,0xffffffff
  808360:	0f 95 c0             	setne  al
  808363:	0f b6 c0             	movzx  eax,al
  808366:	eb 06                	jmp    80836e <disk_existent+0x8f>
        break;
  808368:	90                   	nop
    }
    return 0;
  808369:	b8 00 00 00 00       	mov    eax,0x0
}
  80836e:	c9                   	leave  
  80836f:	c3                   	ret    

0000000000808370 <hd_iterate>:
int hd_iterate()
{
  808370:	f3 0f 1e fa          	endbr64 
  808374:	55                   	push   rbp
  808375:	48 89 e5             	mov    rbp,rsp
  808378:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  80837f:	41 b8 00 00 00 00    	mov    r8d,0x0
  808385:	b9 01 00 00 00       	mov    ecx,0x1
  80838a:	ba 00 00 00 00       	mov    edx,0x0
  80838f:	be 02 00 00 00       	mov    esi,0x2
  808394:	bf 00 00 00 00       	mov    edi,0x0
  808399:	e8 3b f8 ff ff       	call   807bd9 <request>
  80839e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8083a1:	41 b8 00 00 00 00    	mov    r8d,0x0
  8083a7:	b9 01 00 00 00       	mov    ecx,0x1
  8083ac:	ba 00 00 00 00       	mov    edx,0x0
  8083b1:	be 02 00 00 00       	mov    esi,0x2
  8083b6:	bf 01 00 00 00       	mov    edi,0x1
  8083bb:	e8 19 f8 ff ff       	call   807bd9 <request>
  8083c0:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  8083c3:	41 b8 00 00 00 00    	mov    r8d,0x0
  8083c9:	b9 01 00 00 00       	mov    ecx,0x1
  8083ce:	ba 00 00 00 00       	mov    edx,0x0
  8083d3:	be 02 00 00 00       	mov    esi,0x2
  8083d8:	bf 02 00 00 00       	mov    edi,0x2
  8083dd:	e8 f7 f7 ff ff       	call   807bd9 <request>
  8083e2:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8083e5:	41 b8 00 00 00 00    	mov    r8d,0x0
  8083eb:	b9 01 00 00 00       	mov    ecx,0x1
  8083f0:	ba 00 00 00 00       	mov    edx,0x0
  8083f5:	be 02 00 00 00       	mov    esi,0x2
  8083fa:	bf 03 00 00 00       	mov    edi,0x3
  8083ff:	e8 d5 f7 ff ff       	call   807bd9 <request>
  808404:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  808407:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80840e:	e9 72 01 00 00       	jmp    808585 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808413:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808417:	74 3b                	je     808454 <hd_iterate+0xe4>
  808419:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80841d:	7f 3e                	jg     80845d <hd_iterate+0xed>
  80841f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808423:	74 26                	je     80844b <hd_iterate+0xdb>
  808425:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808429:	7f 32                	jg     80845d <hd_iterate+0xed>
  80842b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80842f:	74 08                	je     808439 <hd_iterate+0xc9>
  808431:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808435:	74 0b                	je     808442 <hd_iterate+0xd2>
  808437:	eb 24                	jmp    80845d <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  808439:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808440:	eb 25                	jmp    808467 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808442:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  808449:	eb 1c                	jmp    808467 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80844b:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  808452:	eb 13                	jmp    808467 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  808454:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  80845b:	eb 0a                	jmp    808467 <hd_iterate+0xf7>
        default:
            return -1;
  80845d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808462:	e9 28 01 00 00       	jmp    80858f <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  808467:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80846a:	48 98                	cdqe   
  80846c:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808470:	89 c7                	mov    edi,eax
  808472:	e8 16 fe ff ff       	call   80828d <chk_result>
  808477:	85 c0                	test   eax,eax
  808479:	0f 84 81 00 00 00    	je     808500 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  80847f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808482:	89 c6                	mov    esi,eax
  808484:	bf 84 40 81 00       	mov    edi,0x814084
  808489:	b8 00 00 00 00       	mov    eax,0x0
  80848e:	e8 85 88 ff ff       	call   800d18 <printf>
            //新硬盘
            device hd={
  808493:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80849a:	b8 00 00 00 00       	mov    eax,0x0
  80849f:	b9 15 00 00 00       	mov    ecx,0x15
  8084a4:	48 89 d7             	mov    rdi,rdx
  8084a7:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8084aa:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8084ad:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  8084b3:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  8084ba:	00 00 00 
  8084bd:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  8084c4:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  8084c7:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8084cb:	7f 07                	jg     8084d4 <hd_iterate+0x164>
  8084cd:	b8 f0 01 00 00       	mov    eax,0x1f0
  8084d2:	eb 05                	jmp    8084d9 <hd_iterate+0x169>
  8084d4:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  8084d9:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  8084df:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  8084e6:	48 89 c7             	mov    rdi,rax
  8084e9:	e8 8e a0 ff ff       	call   80257c <reg_device>
  8084ee:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8084f1:	48 63 d2             	movsxd rdx,edx
  8084f4:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  8084fb:	e9 81 00 00 00       	jmp    808581 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  808500:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808503:	48 98                	cdqe   
  808505:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808509:	89 c7                	mov    edi,eax
  80850b:	e8 7d fd ff ff       	call   80828d <chk_result>
  808510:	85 c0                	test   eax,eax
  808512:	75 6d                	jne    808581 <hd_iterate+0x211>
        {
            switch (i)
  808514:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808518:	74 3e                	je     808558 <hd_iterate+0x1e8>
  80851a:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80851e:	7f 41                	jg     808561 <hd_iterate+0x1f1>
  808520:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808524:	74 28                	je     80854e <hd_iterate+0x1de>
  808526:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80852a:	7f 35                	jg     808561 <hd_iterate+0x1f1>
  80852c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808530:	74 08                	je     80853a <hd_iterate+0x1ca>
  808532:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808536:	74 0c                	je     808544 <hd_iterate+0x1d4>
  808538:	eb 27                	jmp    808561 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80853a:	48 c7 45 f8 74 40 81 	mov    QWORD PTR [rbp-0x8],0x814074
  808541:	00 
  808542:	eb 1d                	jmp    808561 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  808544:	48 c7 45 f8 78 40 81 	mov    QWORD PTR [rbp-0x8],0x814078
  80854b:	00 
  80854c:	eb 13                	jmp    808561 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  80854e:	48 c7 45 f8 7c 40 81 	mov    QWORD PTR [rbp-0x8],0x81407c
  808555:	00 
  808556:	eb 09                	jmp    808561 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  808558:	48 c7 45 f8 80 40 81 	mov    QWORD PTR [rbp-0x8],0x814080
  80855f:	00 
  808560:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  808561:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808565:	48 89 c7             	mov    rdi,rax
  808568:	e8 47 a4 ff ff       	call   8029b4 <sys_find_dev>
  80856d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  808570:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808573:	89 c7                	mov    edi,eax
  808575:	e8 0e ab ff ff       	call   803088 <get_dev>
  80857a:	89 c7                	mov    edi,eax
  80857c:	e8 5a aa ff ff       	call   802fdb <dispose_device>
    for(int i=0;i<1;i++)
  808581:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808585:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808589:	0f 8e 84 fe ff ff    	jle    808413 <hd_iterate+0xa3>
        }

    }
}
  80858f:	c9                   	leave  
  808590:	c3                   	ret    

0000000000808591 <async_check_disk>:

int async_check_disk(int disk)
{
  808591:	f3 0f 1e fa          	endbr64 
  808595:	55                   	push   rbp
  808596:	48 89 e5             	mov    rbp,rsp
  808599:	48 83 ec 20          	sub    rsp,0x20
  80859d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8085a0:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8085a6:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8085ac:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8085b0:	74 06                	je     8085b8 <async_check_disk+0x27>
  8085b2:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8085b6:	75 06                	jne    8085be <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  8085b8:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  8085be:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8085c2:	74 06                	je     8085ca <async_check_disk+0x39>
  8085c4:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8085c8:	75 06                	jne    8085d0 <async_check_disk+0x3f>
        chkcmd=0xf0;
  8085ca:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  8085d0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085d4:	83 c0 02             	add    eax,0x2
  8085d7:	0f b7 c0             	movzx  eax,ax
  8085da:	be 01 00 00 00       	mov    esi,0x1
  8085df:	89 c7                	mov    edi,eax
  8085e1:	e8 fa d0 ff ff       	call   8056e0 <outb>
    outb(disknr+3,0);
  8085e6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085ea:	83 c0 03             	add    eax,0x3
  8085ed:	0f b7 c0             	movzx  eax,ax
  8085f0:	be 00 00 00 00       	mov    esi,0x0
  8085f5:	89 c7                	mov    edi,eax
  8085f7:	e8 e4 d0 ff ff       	call   8056e0 <outb>
    outb(disknr+4,0);
  8085fc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808600:	83 c0 04             	add    eax,0x4
  808603:	0f b7 c0             	movzx  eax,ax
  808606:	be 00 00 00 00       	mov    esi,0x0
  80860b:	89 c7                	mov    edi,eax
  80860d:	e8 ce d0 ff ff       	call   8056e0 <outb>
    outb(disknr+5,0);
  808612:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808616:	83 c0 05             	add    eax,0x5
  808619:	0f b7 c0             	movzx  eax,ax
  80861c:	be 00 00 00 00       	mov    esi,0x0
  808621:	89 c7                	mov    edi,eax
  808623:	e8 b8 d0 ff ff       	call   8056e0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808628:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80862c:	0f b6 d0             	movzx  edx,al
  80862f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808633:	83 c0 06             	add    eax,0x6
  808636:	0f b7 c0             	movzx  eax,ax
  808639:	89 d6                	mov    esi,edx
  80863b:	89 c7                	mov    edi,eax
  80863d:	e8 9e d0 ff ff       	call   8056e0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808642:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808646:	83 c0 07             	add    eax,0x7
  808649:	0f b7 c0             	movzx  eax,ax
  80864c:	be 90 00 00 00       	mov    esi,0x90
  808651:	89 c7                	mov    edi,eax
  808653:	e8 88 d0 ff ff       	call   8056e0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808658:	b8 00 00 00 00       	mov    eax,0x0
}
  80865d:	c9                   	leave  
  80865e:	c3                   	ret    

000000000080865f <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80865f:	f3 0f 1e fa          	endbr64 
  808663:	55                   	push   rbp
  808664:	48 89 e5             	mov    rbp,rsp
  808667:	48 83 ec 18          	sub    rsp,0x18
  80866b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80866f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808676:	eb 04                	jmp    80867c <hd_do_req+0x1d>
  808678:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80867c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80867f:	48 98                	cdqe   
  808681:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  808688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80868c:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808692:	39 c2                	cmp    edx,eax
  808694:	75 e2                	jne    808678 <hd_do_req+0x19>
    switch (args->cmd)
  808696:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80869a:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8086a0:	83 f8 04             	cmp    eax,0x4
  8086a3:	74 72                	je     808717 <hd_do_req+0xb8>
  8086a5:	83 f8 04             	cmp    eax,0x4
  8086a8:	0f 8f 96 00 00 00    	jg     808744 <hd_do_req+0xe5>
  8086ae:	83 f8 02             	cmp    eax,0x2
  8086b1:	74 0a                	je     8086bd <hd_do_req+0x5e>
  8086b3:	83 f8 03             	cmp    eax,0x3
  8086b6:	74 32                	je     8086ea <hd_do_req+0x8b>
  8086b8:	e9 87 00 00 00       	jmp    808744 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  8086bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086c1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8086c4:	48 98                	cdqe   
  8086c6:	48 89 c6             	mov    rsi,rax
  8086c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086cd:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8086d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086d4:	8b 10                	mov    edx,DWORD PTR [rax]
  8086d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086d9:	49 89 f0             	mov    r8,rsi
  8086dc:	be 00 00 00 00       	mov    esi,0x0
  8086e1:	89 c7                	mov    edi,eax
  8086e3:	e8 f1 f4 ff ff       	call   807bd9 <request>
        break;
  8086e8:	eb 61                	jmp    80874b <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  8086ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086ee:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8086f1:	48 98                	cdqe   
  8086f3:	48 89 c6             	mov    rsi,rax
  8086f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086fa:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8086fd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808701:	8b 10                	mov    edx,DWORD PTR [rax]
  808703:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808706:	49 89 f0             	mov    r8,rsi
  808709:	be 01 00 00 00       	mov    esi,0x1
  80870e:	89 c7                	mov    edi,eax
  808710:	e8 c4 f4 ff ff       	call   807bd9 <request>
        break;
  808715:	eb 34                	jmp    80874b <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808717:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80871b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80871e:	48 98                	cdqe   
  808720:	48 89 c6             	mov    rsi,rax
  808723:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808727:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80872a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80872e:	8b 10                	mov    edx,DWORD PTR [rax]
  808730:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808733:	49 89 f0             	mov    r8,rsi
  808736:	be 02 00 00 00       	mov    esi,0x2
  80873b:	89 c7                	mov    edi,eax
  80873d:	e8 97 f4 ff ff       	call   807bd9 <request>
        break;
  808742:	eb 07                	jmp    80874b <hd_do_req+0xec>
    default:return -1;
  808744:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808749:	eb 1e                	jmp    808769 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80874b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80874f:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808756:	00 00 00 
    running_devman_req=args;
  808759:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80875d:	48 89 05 84 1d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21d84],rax        # 42a4e8 <running_devman_req>
    return 0;
  808764:	b8 00 00 00 00       	mov    eax,0x0
  808769:	c9                   	leave  
  80876a:	c3                   	ret    
  80876b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000808770 <disk_int_handler>:
  808770:	e8 99 cf ff ff       	call   80570e <eoi>
  808775:	e8 70 f2 ff ff       	call   8079ea <disk_int_handler_c>
  80877a:	48 cf                	iretq  

000000000080877c <read_disk_asm>:
  80877c:	55                   	push   rbp
  80877d:	89 e5                	mov    ebp,esp
  80877f:	66 ba f7 01          	mov    dx,0x1f7
  808783:	31 c9                	xor    ecx,ecx
  808785:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80878a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80878f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808794:	89 c6                	mov    esi,eax
  808796:	66 ba f2 01          	mov    dx,0x1f2
  80879a:	88 c8                	mov    al,cl
  80879c:	ee                   	out    dx,al
  80879d:	66 ba f3 01          	mov    dx,0x1f3
  8087a1:	89 f0                	mov    eax,esi
  8087a3:	ee                   	out    dx,al
  8087a4:	66 ff c2             	inc    dx
  8087a7:	c1 e8 08             	shr    eax,0x8
  8087aa:	ee                   	out    dx,al
  8087ab:	66 ff c2             	inc    dx
  8087ae:	c1 e8 08             	shr    eax,0x8
  8087b1:	ee                   	out    dx,al
  8087b2:	66 ff c2             	inc    dx
  8087b5:	66 c1 e8 08          	shr    ax,0x8
  8087b9:	24 0f                	and    al,0xf
  8087bb:	0c e0                	or     al,0xe0
  8087bd:	ee                   	out    dx,al
  8087be:	66 ff c2             	inc    dx
  8087c1:	b0 20                	mov    al,0x20
  8087c3:	ee                   	out    dx,al

00000000008087c4 <read_disk_asm.wait>:
  8087c4:	90                   	nop
  8087c5:	ec                   	in     al,dx
  8087c6:	24 88                	and    al,0x88
  8087c8:	3c 08                	cmp    al,0x8
  8087ca:	75 f8                	jne    8087c4 <read_disk_asm.wait>
  8087cc:	66 89 d7             	mov    di,dx
  8087cf:	89 c8                	mov    eax,ecx
  8087d1:	66 b9 00 01          	mov    cx,0x100
  8087d5:	66 f7 e1             	mul    cx
  8087d8:	89 c1                	mov    ecx,eax
  8087da:	66 ba f0 01          	mov    dx,0x1f0

00000000008087de <read_disk_asm.read>:
  8087de:	66 ed                	in     ax,dx
  8087e0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  8087e4:	83 c3 02             	add    ebx,0x2
  8087e7:	e2 f5                	loop   8087de <read_disk_asm.read>
  8087e9:	c9                   	leave  
  8087ea:	b8 00 00 00 00       	mov    eax,0x0
  8087ef:	c3                   	ret    

00000000008087f0 <read_disk_asm.err_disk_reading>:
  8087f0:	66 ba f1 01          	mov    dx,0x1f1
  8087f4:	31 c0                	xor    eax,eax
  8087f6:	66 ed                	in     ax,dx
  8087f8:	89 ec                	mov    esp,ebp
  8087fa:	5d                   	pop    rbp
  8087fb:	c3                   	ret    

00000000008087fc <write_disk_asm>:
  8087fc:	55                   	push   rbp
  8087fd:	89 e5                	mov    ebp,esp
  8087ff:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808804:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808809:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80880e:	50                   	push   rax
  80880f:	66 ba f2 01          	mov    dx,0x1f2
  808813:	88 c8                	mov    al,cl
  808815:	ee                   	out    dx,al
  808816:	58                   	pop    rax
  808817:	66 ba f3 01          	mov    dx,0x1f3
  80881b:	ee                   	out    dx,al
  80881c:	c1 e8 08             	shr    eax,0x8
  80881f:	66 ba f4 01          	mov    dx,0x1f4
  808823:	ee                   	out    dx,al
  808824:	c1 e8 08             	shr    eax,0x8
  808827:	66 ba f5 01          	mov    dx,0x1f5
  80882b:	ee                   	out    dx,al
  80882c:	c1 e8 08             	shr    eax,0x8
  80882f:	24 0f                	and    al,0xf
  808831:	0c e0                	or     al,0xe0
  808833:	66 ba f6 01          	mov    dx,0x1f6
  808837:	ee                   	out    dx,al
  808838:	66 ba f7 01          	mov    dx,0x1f7
  80883c:	b0 30                	mov    al,0x30
  80883e:	ee                   	out    dx,al

000000000080883f <write_disk_asm.not_ready2>:
  80883f:	90                   	nop
  808840:	ec                   	in     al,dx
  808841:	24 88                	and    al,0x88
  808843:	3c 08                	cmp    al,0x8
  808845:	75 f8                	jne    80883f <write_disk_asm.not_ready2>
  808847:	89 c8                	mov    eax,ecx
  808849:	66 b9 00 01          	mov    cx,0x100
  80884d:	66 f7 e1             	mul    cx
  808850:	89 c1                	mov    ecx,eax
  808852:	66 ba f0 01          	mov    dx,0x1f0

0000000000808856 <write_disk_asm.go_on_write>:
  808856:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80885a:	66 ef                	out    dx,ax
  80885c:	83 c3 02             	add    ebx,0x2
  80885f:	e2 f5                	loop   808856 <write_disk_asm.go_on_write>
  808861:	89 ec                	mov    esp,ebp
  808863:	5d                   	pop    rbp
  808864:	c3                   	ret    

0000000000808865 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808865:	f3 0f 1e fa          	endbr64 
  808869:	55                   	push   rbp
  80886a:	48 89 e5             	mov    rbp,rsp
  80886d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808874:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80887b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808881:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808888:	ba 00 02 00 00       	mov    edx,0x200
  80888d:	be 00 00 00 00       	mov    esi,0x0
  808892:	48 89 c7             	mov    rdi,rax
  808895:	e8 66 2e 00 00       	call   80b700 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80889a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8088a1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8088a5:	89 c2                	mov    edx,eax
  8088a7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088ad:	c1 e8 07             	shr    eax,0x7
  8088b0:	01 d0                	add    eax,edx
  8088b2:	89 c2                	mov    edx,eax
  8088b4:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8088bb:	49 89 c0             	mov    r8,rax
  8088be:	b9 01 00 00 00       	mov    ecx,0x1
  8088c3:	be 00 00 00 00       	mov    esi,0x0
  8088c8:	bf 00 00 00 00       	mov    edi,0x0
  8088cd:	e8 07 f3 ff ff       	call   807bd9 <request>
  8088d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  8088d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8088d8:	89 c7                	mov    edi,eax
  8088da:	e8 ae f9 ff ff       	call   80828d <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  8088df:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088e5:	83 e0 7f             	and    eax,0x7f
  8088e8:	89 c0                	mov    eax,eax
  8088ea:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  8088f1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8088f7:	89 c6                	mov    esi,eax
  8088f9:	bf 98 40 81 00       	mov    edi,0x814098
  8088fe:	b8 00 00 00 00       	mov    eax,0x0
  808903:	e8 10 84 ff ff       	call   800d18 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808908:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80890e:	83 e0 7f             	and    eax,0x7f
  808911:	89 c0                	mov    eax,eax
  808913:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80891a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80891f:	c9                   	leave  
  808920:	c3                   	ret    

0000000000808921 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808921:	f3 0f 1e fa          	endbr64 
  808925:	55                   	push   rbp
  808926:	48 89 e5             	mov    rbp,rsp
  808929:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808930:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808937:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80893d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  808943:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80894a:	ba 00 02 00 00       	mov    edx,0x200
  80894f:	be 00 00 00 00       	mov    esi,0x0
  808954:	48 89 c7             	mov    rdi,rax
  808957:	e8 a4 2d 00 00       	call   80b700 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80895c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808963:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808967:	89 c2                	mov    edx,eax
  808969:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80896f:	c1 e8 07             	shr    eax,0x7
  808972:	01 d0                	add    eax,edx
  808974:	89 c2                	mov    edx,eax
  808976:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80897d:	49 89 c0             	mov    r8,rax
  808980:	b9 01 00 00 00       	mov    ecx,0x1
  808985:	be 00 00 00 00       	mov    esi,0x0
  80898a:	bf 00 00 00 00       	mov    edi,0x0
  80898f:	e8 45 f2 ff ff       	call   807bd9 <request>
  808994:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  808997:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80899a:	89 c7                	mov    edi,eax
  80899c:	e8 ec f8 ff ff       	call   80828d <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  8089a1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8089a7:	83 e0 7f             	and    eax,0x7f
  8089aa:	89 c0                	mov    eax,eax
  8089ac:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  8089b3:	25 00 00 00 f0       	and    eax,0xf0000000
  8089b8:	89 c6                	mov    esi,eax
  8089ba:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  8089c0:	25 ff ff ff 0f       	and    eax,0xfffffff
  8089c5:	89 c1                	mov    ecx,eax
  8089c7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8089cd:	83 e0 7f             	and    eax,0x7f
  8089d0:	89 c2                	mov    edx,eax
  8089d2:	89 f0                	mov    eax,esi
  8089d4:	09 c8                	or     eax,ecx
  8089d6:	89 d2                	mov    edx,edx
  8089d8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  8089df:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8089e6:	eb 61                	jmp    808a49 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  8089e8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8089ef:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8089f3:	89 c1                	mov    ecx,eax
  8089f5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8089fc:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808a00:	89 c2                	mov    edx,eax
  808a02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808a05:	48 98                	cdqe   
  808a07:	0f af c2             	imul   eax,edx
  808a0a:	8d 14 01             	lea    edx,[rcx+rax*1]
  808a0d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808a13:	c1 e8 07             	shr    eax,0x7
  808a16:	01 d0                	add    eax,edx
  808a18:	89 c2                	mov    edx,eax
  808a1a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808a21:	49 89 c0             	mov    r8,rax
  808a24:	b9 01 00 00 00       	mov    ecx,0x1
  808a29:	be 01 00 00 00       	mov    esi,0x1
  808a2e:	bf 00 00 00 00       	mov    edi,0x0
  808a33:	e8 a1 f1 ff ff       	call   807bd9 <request>
  808a38:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  808a3b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808a3e:	89 c7                	mov    edi,eax
  808a40:	e8 48 f8 ff ff       	call   80828d <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  808a45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808a49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808a4c:	48 63 d0             	movsxd rdx,eax
  808a4f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808a56:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808a5a:	48 39 c2             	cmp    rdx,rax
  808a5d:	72 89                	jb     8089e8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  808a5f:	b8 01 00 00 00       	mov    eax,0x1
}
  808a64:	c9                   	leave  
  808a65:	c3                   	ret    

0000000000808a66 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  808a66:	f3 0f 1e fa          	endbr64 
  808a6a:	55                   	push   rbp
  808a6b:	48 89 e5             	mov    rbp,rsp
  808a6e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a72:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808a76:	b8 01 00 00 00       	mov    eax,0x1
}
  808a7b:	5d                   	pop    rbp
  808a7c:	c3                   	ret    

0000000000808a7d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  808a7d:	f3 0f 1e fa          	endbr64 
  808a81:	55                   	push   rbp
  808a82:	48 89 e5             	mov    rbp,rsp
  808a85:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a89:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808a8d:	b8 01 00 00 00       	mov    eax,0x1
}
  808a92:	5d                   	pop    rbp
  808a93:	c3                   	ret    

0000000000808a94 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  808a94:	f3 0f 1e fa          	endbr64 
  808a98:	55                   	push   rbp
  808a99:	48 89 e5             	mov    rbp,rsp
  808a9c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808aa0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  808aa4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  808aa8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  808aac:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808ab0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ab4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ab8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808abc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ac0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808ac4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ac8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808acc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ad0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ad4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ad8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  808adc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808ae0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808ae3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  808ae7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808aee:	00 
	int i,length = 0;
  808aef:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  808af6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808afd:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808afe:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b02:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b05:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b09:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808b0d:	48 99                	cqo    
  808b0f:	48 f7 fe             	idiv   rsi
  808b12:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808b15:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b19:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b1c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b20:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808b24:	48 99                	cqo    
  808b26:	48 f7 f9             	idiv   rcx
  808b29:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808b2d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b31:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b35:	be 00 00 00 00       	mov    esi,0x0
  808b3a:	48 89 c7             	mov    rdi,rax
  808b3d:	b8 00 00 00 00       	mov    eax,0x0
  808b42:	e8 63 87 ff ff       	call   8012aa <vmalloc>
  808b47:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  808b4b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808b50:	75 0c                	jne    808b5e <FAT32_read+0xca>
		return -EFAULT;
  808b52:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808b59:	e9 f0 01 00 00       	jmp    808d4e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  808b5e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808b65:	eb 1e                	jmp    808b85 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808b67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b6b:	89 c2                	mov    edx,eax
  808b6d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808b71:	89 d6                	mov    esi,edx
  808b73:	48 89 c7             	mov    rdi,rax
  808b76:	e8 ea fc ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  808b7b:	89 c0                	mov    eax,eax
  808b7d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  808b81:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808b85:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b88:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808b8b:	7c da                	jl     808b67 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  808b8d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808b91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b94:	48 89 c2             	mov    rdx,rax
  808b97:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808b9b:	48 01 c2             	add    rdx,rax
  808b9e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ba2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ba6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808baa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808bad:	48 39 c2             	cmp    rdx,rax
  808bb0:	76 2c                	jbe    808bde <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  808bb2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808bb6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808bba:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808bbe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808bc1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808bc5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808bc8:	48 89 c1             	mov    rcx,rax
  808bcb:	48 89 d0             	mov    rax,rdx
  808bce:	48 29 c8             	sub    rax,rcx
  808bd1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  808bd5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808bd9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  808bdc:	eb 07                	jmp    808be5 <FAT32_read+0x151>
	else
		index = count;
  808bde:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808be2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  808be5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808be9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808bed:	89 c2                	mov    edx,eax
  808bef:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808bf3:	be 00 00 00 00       	mov    esi,0x0
  808bf8:	48 89 c7             	mov    rdi,rax
  808bfb:	e8 00 2b 00 00       	call   80b700 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808c00:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c04:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808c08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c0c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808c10:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c14:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c18:	48 0f af c2          	imul   rax,rdx
  808c1c:	48 01 c8             	add    rax,rcx
  808c1f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808c23:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c27:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c2b:	89 c1                	mov    ecx,eax
  808c2d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808c31:	89 c2                	mov    edx,eax
  808c33:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808c37:	49 89 c0             	mov    r8,rax
  808c3a:	be 00 00 00 00       	mov    esi,0x0
  808c3f:	bf 00 00 00 00       	mov    edi,0x0
  808c44:	e8 90 ef ff ff       	call   807bd9 <request>
  808c49:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  808c4c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808c4f:	89 c7                	mov    edi,eax
  808c51:	e8 37 f6 ff ff       	call   80828d <chk_result>
  808c56:	85 c0                	test   eax,eax
  808c58:	75 1c                	jne    808c76 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  808c5a:	bf c8 40 81 00       	mov    edi,0x8140c8
  808c5f:	b8 00 00 00 00       	mov    eax,0x0
  808c64:	e8 af 80 ff ff       	call   800d18 <printf>
			retval = -EIO;
  808c69:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  808c70:	ff 
			break;
  808c71:	e9 ba 00 00 00       	jmp    808d30 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808c76:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808c79:	48 63 d0             	movsxd rdx,eax
  808c7c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c80:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c84:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  808c88:	48 39 c2             	cmp    rdx,rax
  808c8b:	48 0f 4e c2          	cmovle rax,rdx
  808c8f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  808c92:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808c96:	48 83 f8 1f          	cmp    rax,0x1f
  808c9a:	77 1f                	ja     808cbb <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  808c9c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808c9f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808ca3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808ca7:	48 01 c1             	add    rcx,rax
  808caa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808cae:	48 89 c6             	mov    rsi,rax
  808cb1:	48 89 cf             	mov    rdi,rcx
  808cb4:	e8 98 29 00 00       	call   80b651 <memcpy>
  808cb9:	eb 1d                	jmp    808cd8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  808cbb:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  808cbe:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  808cc2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808cc6:	48 01 c1             	add    rcx,rax
  808cc9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808ccd:	48 89 c6             	mov    rsi,rax
  808cd0:	48 89 cf             	mov    rdi,rcx
  808cd3:	e8 79 29 00 00       	call   80b651 <memcpy>

		index -= length;
  808cd8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808cdb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  808cde:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808ce1:	48 98                	cdqe   
  808ce3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  808ce7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808cee:	00 
		*position += length;
  808cef:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808cf3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808cf6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808cf9:	48 98                	cdqe   
  808cfb:	48 01 c2             	add    rdx,rax
  808cfe:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808d02:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  808d05:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808d09:	74 25                	je     808d30 <FAT32_read+0x29c>
  808d0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d0f:	89 c2                	mov    edx,eax
  808d11:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808d15:	89 d6                	mov    esi,edx
  808d17:	48 89 c7             	mov    rdi,rax
  808d1a:	e8 46 fb ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  808d1f:	89 c0                	mov    eax,eax
  808d21:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808d25:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808d2a:	0f 85 b5 fe ff ff    	jne    808be5 <FAT32_read+0x151>

	vmfree(buffer);
  808d30:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808d34:	48 89 c7             	mov    rdi,rax
  808d37:	e8 fd 85 ff ff       	call   801339 <vmfree>
	if(!index)
  808d3c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808d40:	75 08                	jne    808d4a <FAT32_read+0x2b6>
		retval = count;
  808d42:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808d46:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  808d4a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  808d4e:	c9                   	leave  
  808d4f:	c3                   	ret    

0000000000808d50 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  808d50:	f3 0f 1e fa          	endbr64 
  808d54:	55                   	push   rbp
  808d55:	48 89 e5             	mov    rbp,rsp
  808d58:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  808d5f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  808d66:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808d6d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808d71:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  808d75:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808d7c:	e9 8b 00 00 00       	jmp    808e0c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  808d81:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808d88:	ba 00 02 00 00       	mov    edx,0x200
  808d8d:	be 00 00 00 00       	mov    esi,0x0
  808d92:	48 89 c7             	mov    rdi,rax
  808d95:	e8 66 29 00 00       	call   80b700 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  808d9a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  808da1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808da5:	89 c2                	mov    edx,eax
  808da7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808daa:	01 d0                	add    eax,edx
  808dac:	89 c2                	mov    edx,eax
  808dae:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  808db5:	49 89 c0             	mov    r8,rax
  808db8:	b9 01 00 00 00       	mov    ecx,0x1
  808dbd:	be 00 00 00 00       	mov    esi,0x0
  808dc2:	bf 00 00 00 00       	mov    edi,0x0
  808dc7:	e8 0d ee ff ff       	call   807bd9 <request>
  808dcc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  808dcf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808dd6:	eb 2a                	jmp    808e02 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  808dd8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808ddb:	48 98                	cdqe   
  808ddd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  808de4:	25 ff ff ff 0f       	and    eax,0xfffffff
  808de9:	85 c0                	test   eax,eax
  808deb:	75 11                	jne    808dfe <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  808ded:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808df0:	c1 e0 07             	shl    eax,0x7
  808df3:	89 c2                	mov    edx,eax
  808df5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808df8:	01 d0                	add    eax,edx
  808dfa:	48 98                	cdqe   
  808dfc:	eb 22                	jmp    808e20 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  808dfe:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808e02:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  808e06:	7e d0                	jle    808dd8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  808e08:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808e0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e0f:	48 98                	cdqe   
  808e11:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  808e15:	0f 87 66 ff ff ff    	ja     808d81 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  808e1b:	b8 00 00 00 00       	mov    eax,0x0
}
  808e20:	c9                   	leave  
  808e21:	c3                   	ret    

0000000000808e22 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  808e22:	f3 0f 1e fa          	endbr64 
  808e26:	55                   	push   rbp
  808e27:	48 89 e5             	mov    rbp,rsp
  808e2a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  808e31:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  808e35:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  808e39:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808e40:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808e47:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808e4b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e4f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e53:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e57:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808e5b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808e5f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e63:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e67:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808e6b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e6f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  808e73:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808e77:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808e7a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  808e7e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  808e85:	00 
	unsigned long sector = 0;
  808e86:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808e8d:	00 
	int i,length = 0;
  808e8e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  808e95:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808e9c:	00 
	long flags = 0;
  808e9d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808ea4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808ea5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808eac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808eaf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808eb3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808eb7:	48 99                	cqo    
  808eb9:	48 f7 fe             	idiv   rsi
  808ebc:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808ebf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808ec6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808ec9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808ecd:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808ed1:	48 99                	cqo    
  808ed3:	48 f7 f9             	idiv   rcx
  808ed6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808eda:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808ede:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ee2:	be 00 00 00 00       	mov    esi,0x0
  808ee7:	48 89 c7             	mov    rdi,rax
  808eea:	b8 00 00 00 00       	mov    eax,0x0
  808eef:	e8 b6 83 ff ff       	call   8012aa <vmalloc>
  808ef4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  808ef8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808efd:	75 1a                	jne    808f19 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  808eff:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f03:	48 89 c7             	mov    rdi,rax
  808f06:	e8 45 fe ff ff       	call   808d50 <FAT32_find_available_cluster>
  808f0b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  808f0f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808f16:	00 
  808f17:	eb 2f                	jmp    808f48 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  808f19:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808f20:	eb 1e                	jmp    808f40 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808f22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f26:	89 c2                	mov    edx,eax
  808f28:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f2c:	89 d6                	mov    esi,edx
  808f2e:	48 89 c7             	mov    rdi,rax
  808f31:	e8 2f f9 ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  808f36:	89 c0                	mov    eax,eax
  808f38:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  808f3c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808f40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f43:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  808f46:	7c da                	jl     808f22 <FAT32_write+0x100>

	if(!cluster)
  808f48:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808f4d:	75 18                	jne    808f67 <FAT32_write+0x145>
	{
		vmfree(buffer);
  808f4f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f53:	48 89 c7             	mov    rdi,rax
  808f56:	e8 de 83 ff ff       	call   801339 <vmfree>
		return -ENOSPC;
  808f5b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808f62:	e9 13 03 00 00       	jmp    80927a <FAT32_write+0x458>
	}

	if(flags)
  808f67:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808f6c:	74 4d                	je     808fbb <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  808f6e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808f72:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808f76:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808f79:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808f7d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f81:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f85:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f89:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808f8d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808f91:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808f95:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f99:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f9d:	48 89 c7             	mov    rdi,rax
  808fa0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  808fa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fa6:	89 c1                	mov    ecx,eax
  808fa8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fac:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  808fb1:	89 ce                	mov    esi,ecx
  808fb3:	48 89 c7             	mov    rdi,rax
  808fb6:	e8 66 f9 ff ff       	call   808921 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  808fbb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808fc2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  808fc5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808fca:	0f 85 91 00 00 00    	jne    809061 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  808fd0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fd4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808fd8:	89 c2                	mov    edx,eax
  808fda:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fde:	be 00 00 00 00       	mov    esi,0x0
  808fe3:	48 89 c7             	mov    rdi,rax
  808fe6:	e8 15 27 00 00       	call   80b700 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808feb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fef:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808ff3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ff7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  808ffb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809003:	48 0f af c2          	imul   rax,rdx
  809007:	48 01 c8             	add    rax,rcx
  80900a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80900e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809012:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809016:	89 c1                	mov    ecx,eax
  809018:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80901c:	89 c2                	mov    edx,eax
  80901e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809022:	49 89 c0             	mov    r8,rax
  809025:	be 00 00 00 00       	mov    esi,0x0
  80902a:	bf 00 00 00 00       	mov    edi,0x0
  80902f:	e8 a5 eb ff ff       	call   807bd9 <request>
  809034:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  809037:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80903a:	89 c7                	mov    edi,eax
  80903c:	e8 4c f2 ff ff       	call   80828d <chk_result>
  809041:	85 c0                	test   eax,eax
  809043:	75 1c                	jne    809061 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809045:	bf f8 40 81 00       	mov    edi,0x8140f8
  80904a:	b8 00 00 00 00       	mov    eax,0x0
  80904f:	e8 c4 7c ff ff       	call   800d18 <printf>
				retval = -EIO;
  809054:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80905b:	ff 
				break;
  80905c:	e9 95 01 00 00       	jmp    8091f6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809061:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809064:	48 63 d0             	movsxd rdx,eax
  809067:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80906b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80906f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809073:	48 39 c2             	cmp    rdx,rax
  809076:	48 0f 4e c2          	cmovle rax,rdx
  80907a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80907d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809081:	48 83 f8 1f          	cmp    rax,0x1f
  809085:	77 1f                	ja     8090a6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809087:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80908a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80908e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809092:	48 01 c1             	add    rcx,rax
  809095:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809099:	48 89 ce             	mov    rsi,rcx
  80909c:	48 89 c7             	mov    rdi,rax
  80909f:	e8 ad 25 00 00       	call   80b651 <memcpy>
  8090a4:	eb 1d                	jmp    8090c3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  8090a6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8090a9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  8090ad:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090b1:	48 01 c1             	add    rcx,rax
  8090b4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8090b8:	48 89 ce             	mov    rsi,rcx
  8090bb:	48 89 c7             	mov    rdi,rax
  8090be:	e8 8e 25 00 00       	call   80b651 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8090c3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090c7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8090cb:	89 c1                	mov    ecx,eax
  8090cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8090d1:	89 c2                	mov    edx,eax
  8090d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090d7:	49 89 c0             	mov    r8,rax
  8090da:	be 01 00 00 00       	mov    esi,0x1
  8090df:	bf 00 00 00 00       	mov    edi,0x0
  8090e4:	e8 f0 ea ff ff       	call   807bd9 <request>
  8090e9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  8090ec:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  8090ef:	89 c7                	mov    edi,eax
  8090f1:	e8 97 f1 ff ff       	call   80828d <chk_result>
  8090f6:	85 c0                	test   eax,eax
  8090f8:	75 1c                	jne    809116 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8090fa:	bf 28 41 81 00       	mov    edi,0x814128
  8090ff:	b8 00 00 00 00       	mov    eax,0x0
  809104:	e8 0f 7c ff ff       	call   800d18 <printf>
			retval = -EIO;
  809109:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809110:	ff 
			break;
  809111:	e9 e0 00 00 00       	jmp    8091f6 <FAT32_write+0x3d4>
		}

		index -= length;
  809116:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809119:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80911c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80911f:	48 98                	cdqe   
  809121:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809125:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80912c:	00 
		*position += length;
  80912d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809134:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809137:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80913a:	48 98                	cdqe   
  80913c:	48 01 c2             	add    rdx,rax
  80913f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809146:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809149:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80914d:	0f 84 a2 00 00 00    	je     8091f5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809153:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809157:	89 c2                	mov    edx,eax
  809159:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80915d:	89 d6                	mov    esi,edx
  80915f:	48 89 c7             	mov    rdi,rax
  809162:	e8 fe f6 ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  809167:	89 c0                	mov    eax,eax
  809169:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80916d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809174:	0f 
  809175:	76 72                	jbe    8091e9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809177:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80917b:	48 89 c7             	mov    rdi,rax
  80917e:	e8 cd fb ff ff       	call   808d50 <FAT32_find_available_cluster>
  809183:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809187:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80918c:	75 18                	jne    8091a6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80918e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809192:	48 89 c7             	mov    rdi,rax
  809195:	e8 9f 81 ff ff       	call   801339 <vmfree>
				return -ENOSPC;
  80919a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  8091a1:	e9 d4 00 00 00       	jmp    80927a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  8091a6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091aa:	89 c2                	mov    edx,eax
  8091ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091b0:	89 c1                	mov    ecx,eax
  8091b2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091b6:	89 ce                	mov    esi,ecx
  8091b8:	48 89 c7             	mov    rdi,rax
  8091bb:	e8 61 f7 ff ff       	call   808921 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  8091c0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091c4:	89 c1                	mov    ecx,eax
  8091c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091ca:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  8091cf:	89 ce                	mov    esi,ecx
  8091d1:	48 89 c7             	mov    rdi,rax
  8091d4:	e8 48 f7 ff ff       	call   808921 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  8091d9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091dd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  8091e1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8091e8:	00 
		}

	}while(index);
  8091e9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8091ed:	0f 85 d2 fd ff ff    	jne    808fc5 <FAT32_write+0x1a3>
  8091f3:	eb 01                	jmp    8091f6 <FAT32_write+0x3d4>
			break;
  8091f5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8091f6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8091fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809200:	48 89 c2             	mov    rdx,rax
  809203:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809207:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80920b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80920f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809212:	48 39 c2             	cmp    rdx,rax
  809215:	76 42                	jbe    809259 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  809217:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80921e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809221:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809225:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809229:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80922d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809230:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809234:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809238:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80923c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809240:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809244:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809248:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80924c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809250:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809254:	48 89 c7             	mov    rdi,rax
  809257:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809259:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80925d:	48 89 c7             	mov    rdi,rax
  809260:	e8 d4 80 ff ff       	call   801339 <vmfree>
	if(!index)
  809265:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809269:	75 0b                	jne    809276 <FAT32_write+0x454>
		retval = count;
  80926b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809272:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809276:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80927a:	c9                   	leave  
  80927b:	c3                   	ret    

000000000080927c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80927c:	f3 0f 1e fa          	endbr64 
  809280:	55                   	push   rbp
  809281:	48 89 e5             	mov    rbp,rsp
  809284:	48 83 ec 30          	sub    rsp,0x30
  809288:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80928c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809290:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809294:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809298:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80929c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092a0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  8092a4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8092ab:	00 

	switch(origin)
  8092ac:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8092b1:	74 21                	je     8092d4 <FAT32_lseek+0x58>
  8092b3:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8092b8:	7f 4a                	jg     809304 <FAT32_lseek+0x88>
  8092ba:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8092bf:	74 09                	je     8092ca <FAT32_lseek+0x4e>
  8092c1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  8092c6:	74 20                	je     8092e8 <FAT32_lseek+0x6c>
  8092c8:	eb 3a                	jmp    809304 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  8092ca:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8092d2:	eb 39                	jmp    80930d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  8092d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092d8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092db:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092df:	48 01 d0             	add    rax,rdx
  8092e2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8092e6:	eb 25                	jmp    80930d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  8092e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092ec:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092f0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092f4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092fb:	48 01 d0             	add    rax,rdx
  8092fe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809302:	eb 09                	jmp    80930d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  809304:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80930b:	eb 50                	jmp    80935d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80930d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809312:	78 18                	js     80932c <FAT32_lseek+0xb0>
  809314:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809318:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80931c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809320:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809323:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809327:	48 39 c2             	cmp    rdx,rax
  80932a:	73 09                	jae    809335 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80932c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809333:	eb 28                	jmp    80935d <FAT32_lseek+0xe1>

	filp->position = pos;
  809335:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809339:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80933d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809340:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809344:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809347:	48 89 c6             	mov    rsi,rax
  80934a:	bf 58 41 81 00       	mov    edi,0x814158
  80934f:	b8 00 00 00 00       	mov    eax,0x0
  809354:	e8 bf 79 ff ff       	call   800d18 <printf>

	return pos;
  809359:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80935d:	c9                   	leave  
  80935e:	c3                   	ret    

000000000080935f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80935f:	f3 0f 1e fa          	endbr64 
  809363:	55                   	push   rbp
  809364:	48 89 e5             	mov    rbp,rsp
  809367:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80936b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80936f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809373:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809377:	90                   	nop
  809378:	5d                   	pop    rbp
  809379:	c3                   	ret    

000000000080937a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80937a:	f3 0f 1e fa          	endbr64 
  80937e:	55                   	push   rbp
  80937f:	48 89 e5             	mov    rbp,rsp
  809382:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809386:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80938a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80938e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809392:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809396:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80939a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80939e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8093a2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8093a6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8093aa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093ae:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8093b2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8093b6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093ba:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  8093be:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8093c5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  8093cc:	00 
	unsigned char * buf =NULL; 
  8093cd:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  8093d4:	00 
	char *name = NULL;
  8093d5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8093dc:	00 
	int namelen = 0;
  8093dd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  8093e4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8093eb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  8093f2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8093f9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809400:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  809407:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809408:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80940f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809410:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809414:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809418:	be 00 00 00 00       	mov    esi,0x0
  80941d:	48 89 c7             	mov    rdi,rax
  809420:	b8 00 00 00 00       	mov    eax,0x0
  809425:	e8 80 7e ff ff       	call   8012aa <vmalloc>
  80942a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80942e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809432:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809435:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809438:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80943c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80943f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809443:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809447:	48 99                	cqo    
  809449:	48 f7 fe             	idiv   rsi
  80944c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80944f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809456:	eb 3a                	jmp    809492 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809458:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80945b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80945f:	89 d6                	mov    esi,edx
  809461:	48 89 c7             	mov    rdi,rax
  809464:	e8 fc f3 ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  809469:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80946c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  809473:	76 19                	jbe    80948e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  809475:	bf 80 41 81 00       	mov    edi,0x814180
  80947a:	b8 00 00 00 00       	mov    eax,0x0
  80947f:	e8 94 78 ff ff       	call   800d18 <printf>
			return NULL;
  809484:	b8 00 00 00 00       	mov    eax,0x0
  809489:	e9 86 05 00 00       	jmp    809a14 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80948e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  809492:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809495:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809498:	7c be                	jl     809458 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80949a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80949b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80949f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8094a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094a6:	83 e8 02             	sub    eax,0x2
  8094a9:	89 c1                	mov    ecx,eax
  8094ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094af:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094b3:	48 0f af c1          	imul   rax,rcx
  8094b7:	48 01 d0             	add    rax,rdx
  8094ba:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8094be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094c2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094c6:	89 c1                	mov    ecx,eax
  8094c8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8094cc:	89 c2                	mov    edx,eax
  8094ce:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8094d2:	49 89 c0             	mov    r8,rax
  8094d5:	be 00 00 00 00       	mov    esi,0x0
  8094da:	bf 00 00 00 00       	mov    edi,0x0
  8094df:	e8 f5 e6 ff ff       	call   807bd9 <request>
  8094e4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  8094e7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8094ea:	89 c7                	mov    edi,eax
  8094ec:	e8 9c ed ff ff       	call   80828d <chk_result>
  8094f1:	85 c0                	test   eax,eax
  8094f3:	75 25                	jne    80951a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  8094f5:	bf a8 41 81 00       	mov    edi,0x8141a8
  8094fa:	b8 00 00 00 00       	mov    eax,0x0
  8094ff:	e8 14 78 ff ff       	call   800d18 <printf>
		vmfree(buf);
  809504:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809508:	48 89 c7             	mov    rdi,rax
  80950b:	e8 29 7e ff ff       	call   801339 <vmfree>
		return NULL;
  809510:	b8 00 00 00 00       	mov    eax,0x0
  809515:	e9 fa 04 00 00       	jmp    809a14 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80951a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80951e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809521:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809525:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809529:	48 99                	cqo    
  80952b:	48 f7 f9             	idiv   rcx
  80952e:	48 89 d0             	mov    rax,rdx
  809531:	48 89 c2             	mov    rdx,rax
  809534:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809538:	48 01 d0             	add    rax,rdx
  80953b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80953f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809543:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809546:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80954a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80954e:	48 99                	cqo    
  809550:	48 f7 f9             	idiv   rcx
  809553:	48 89 d0             	mov    rax,rdx
  809556:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  809559:	e9 2f 04 00 00       	jmp    80998d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80955e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809562:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809566:	3c 0f                	cmp    al,0xf
  809568:	0f 84 00 04 00 00    	je     80996e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80956e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809572:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809575:	3c e5                	cmp    al,0xe5
  809577:	0f 84 f4 03 00 00    	je     809971 <FAT32_readdir+0x5f7>
  80957d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809581:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809584:	84 c0                	test   al,al
  809586:	0f 84 e5 03 00 00    	je     809971 <FAT32_readdir+0x5f7>
  80958c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809590:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809593:	3c 05                	cmp    al,0x5
  809595:	0f 84 d6 03 00 00    	je     809971 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80959b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8095a2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8095a6:	48 83 e8 20          	sub    rax,0x20
  8095aa:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8095ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095b2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8095b6:	3c 0f                	cmp    al,0xf
  8095b8:	0f 85 2a 02 00 00    	jne    8097e8 <FAT32_readdir+0x46e>
  8095be:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095c5:	3c e5                	cmp    al,0xe5
  8095c7:	0f 84 1b 02 00 00    	je     8097e8 <FAT32_readdir+0x46e>
  8095cd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095d4:	84 c0                	test   al,al
  8095d6:	0f 84 0c 02 00 00    	je     8097e8 <FAT32_readdir+0x46e>
  8095dc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095e3:	3c 05                	cmp    al,0x5
  8095e5:	0f 84 fd 01 00 00    	je     8097e8 <FAT32_readdir+0x46e>
		{
			j = 0;
  8095eb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8095f2:	eb 1a                	jmp    80960e <FAT32_readdir+0x294>
			{
				j++;
  8095f4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  8095f8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095fc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095ff:	0f b6 c0             	movzx  eax,al
  809602:	83 e0 40             	and    eax,0x40
  809605:	85 c0                	test   eax,eax
  809607:	75 34                	jne    80963d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809609:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80960e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809612:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809616:	3c 0f                	cmp    al,0xf
  809618:	75 24                	jne    80963e <FAT32_readdir+0x2c4>
  80961a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80961e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809621:	3c e5                	cmp    al,0xe5
  809623:	74 19                	je     80963e <FAT32_readdir+0x2c4>
  809625:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809629:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80962c:	84 c0                	test   al,al
  80962e:	74 0e                	je     80963e <FAT32_readdir+0x2c4>
  809630:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809634:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809637:	3c 05                	cmp    al,0x5
  809639:	75 b9                	jne    8095f4 <FAT32_readdir+0x27a>
  80963b:	eb 01                	jmp    80963e <FAT32_readdir+0x2c4>
					break;
  80963d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80963e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809641:	89 d0                	mov    eax,edx
  809643:	01 c0                	add    eax,eax
  809645:	01 d0                	add    eax,edx
  809647:	c1 e0 02             	shl    eax,0x2
  80964a:	01 d0                	add    eax,edx
  80964c:	83 c0 01             	add    eax,0x1
  80964f:	be 00 00 00 00       	mov    esi,0x0
  809654:	89 c7                	mov    edi,eax
  809656:	b8 00 00 00 00       	mov    eax,0x0
  80965b:	e8 4a 7c ff ff       	call   8012aa <vmalloc>
  809660:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809664:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809667:	89 d0                	mov    eax,edx
  809669:	01 c0                	add    eax,eax
  80966b:	01 d0                	add    eax,edx
  80966d:	c1 e0 02             	shl    eax,0x2
  809670:	01 d0                	add    eax,edx
  809672:	83 c0 01             	add    eax,0x1
  809675:	89 c2                	mov    edx,eax
  809677:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80967b:	be 00 00 00 00       	mov    esi,0x0
  809680:	48 89 c7             	mov    rdi,rax
  809683:	e8 78 20 00 00       	call   80b700 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809688:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80968c:	48 83 e8 20          	sub    rax,0x20
  809690:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809694:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80969b:	e9 37 01 00 00       	jmp    8097d7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  8096a0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8096a7:	eb 53                	jmp    8096fc <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8096a9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096ad:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096b0:	48 63 d2             	movsxd rdx,edx
  8096b3:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8096b8:	66 83 f8 ff          	cmp    ax,0xffff
  8096bc:	74 3a                	je     8096f8 <FAT32_readdir+0x37e>
  8096be:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096c2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096c5:	48 63 d2             	movsxd rdx,edx
  8096c8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8096cd:	66 85 c0             	test   ax,ax
  8096d0:	74 26                	je     8096f8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  8096d2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096d6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8096d9:	48 63 d2             	movsxd rdx,edx
  8096dc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  8096e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096e4:	8d 50 01             	lea    edx,[rax+0x1]
  8096e7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8096ea:	48 63 d0             	movsxd rdx,eax
  8096ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096f1:	48 01 d0             	add    rax,rdx
  8096f4:	89 ca                	mov    edx,ecx
  8096f6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  8096f8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8096fc:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809700:	7e a7                	jle    8096a9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809702:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809709:	eb 53                	jmp    80975e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80970b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80970f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809712:	48 63 d2             	movsxd rdx,edx
  809715:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80971a:	66 83 f8 ff          	cmp    ax,0xffff
  80971e:	74 3a                	je     80975a <FAT32_readdir+0x3e0>
  809720:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809724:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809727:	48 63 d2             	movsxd rdx,edx
  80972a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80972f:	66 85 c0             	test   ax,ax
  809732:	74 26                	je     80975a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809734:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809738:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80973b:	48 63 d2             	movsxd rdx,edx
  80973e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809743:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809746:	8d 50 01             	lea    edx,[rax+0x1]
  809749:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80974c:	48 63 d0             	movsxd rdx,eax
  80974f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809753:	48 01 d0             	add    rax,rdx
  809756:	89 ca                	mov    edx,ecx
  809758:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80975a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80975e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809762:	7e a7                	jle    80970b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809764:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80976b:	eb 5b                	jmp    8097c8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80976d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809771:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809774:	48 63 d2             	movsxd rdx,edx
  809777:	48 83 c2 08          	add    rdx,0x8
  80977b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809780:	66 83 f8 ff          	cmp    ax,0xffff
  809784:	74 3e                	je     8097c4 <FAT32_readdir+0x44a>
  809786:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80978a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80978d:	48 63 d2             	movsxd rdx,edx
  809790:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809795:	66 85 c0             	test   ax,ax
  809798:	74 2a                	je     8097c4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80979a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80979e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8097a1:	48 63 d2             	movsxd rdx,edx
  8097a4:	48 83 c2 08          	add    rdx,0x8
  8097a8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  8097ad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8097b0:	8d 50 01             	lea    edx,[rax+0x1]
  8097b3:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8097b6:	48 63 d0             	movsxd rdx,eax
  8097b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097bd:	48 01 d0             	add    rax,rdx
  8097c0:	89 ca                	mov    edx,ecx
  8097c2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  8097c4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8097c8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  8097cc:	7e 9f                	jle    80976d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  8097ce:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8097d2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  8097d7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8097da:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8097dd:	0f 8c bd fe ff ff    	jl     8096a0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  8097e3:	e9 f5 01 00 00       	jmp    8099dd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  8097e8:	be 00 00 00 00       	mov    esi,0x0
  8097ed:	bf 0f 00 00 00       	mov    edi,0xf
  8097f2:	b8 00 00 00 00       	mov    eax,0x0
  8097f7:	e8 ae 7a ff ff       	call   8012aa <vmalloc>
  8097fc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809800:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809804:	ba 0f 00 00 00       	mov    edx,0xf
  809809:	be 00 00 00 00       	mov    esi,0x0
  80980e:	48 89 c7             	mov    rdi,rax
  809811:	e8 ea 1e 00 00       	call   80b700 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809816:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80981d:	eb 74                	jmp    809893 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80981f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809823:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809826:	48 98                	cdqe   
  809828:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80982c:	3c 20                	cmp    al,0x20
  80982e:	74 6b                	je     80989b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809830:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809834:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809838:	0f b6 c0             	movzx  eax,al
  80983b:	83 e0 08             	and    eax,0x8
  80983e:	85 c0                	test   eax,eax
  809840:	74 29                	je     80986b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809842:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809846:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809849:	48 98                	cdqe   
  80984b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80984f:	8d 48 20             	lea    ecx,[rax+0x20]
  809852:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809855:	8d 50 01             	lea    edx,[rax+0x1]
  809858:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80985b:	48 63 d0             	movsxd rdx,eax
  80985e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809862:	48 01 d0             	add    rax,rdx
  809865:	89 ca                	mov    edx,ecx
  809867:	88 10                	mov    BYTE PTR [rax],dl
  809869:	eb 24                	jmp    80988f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80986b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80986f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809872:	48 98                	cdqe   
  809874:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809878:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80987b:	8d 50 01             	lea    edx,[rax+0x1]
  80987e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809881:	48 63 d0             	movsxd rdx,eax
  809884:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809888:	48 01 d0             	add    rax,rdx
  80988b:	89 ca                	mov    edx,ecx
  80988d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80988f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809893:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809897:	7e 86                	jle    80981f <FAT32_readdir+0x4a5>
  809899:	eb 01                	jmp    80989c <FAT32_readdir+0x522>
				break;
  80989b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80989c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8098a0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8098a4:	0f b6 c0             	movzx  eax,al
  8098a7:	83 e0 10             	and    eax,0x10
  8098aa:	85 c0                	test   eax,eax
  8098ac:	0f 85 27 01 00 00    	jne    8099d9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  8098b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8098b5:	8d 50 01             	lea    edx,[rax+0x1]
  8098b8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8098bb:	48 63 d0             	movsxd rdx,eax
  8098be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8098c2:	48 01 d0             	add    rax,rdx
  8098c5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  8098c8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  8098cf:	eb 74                	jmp    809945 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  8098d1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8098d5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8098d8:	48 98                	cdqe   
  8098da:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8098de:	3c 20                	cmp    al,0x20
  8098e0:	74 6b                	je     80994d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  8098e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8098e6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  8098ea:	0f b6 c0             	movzx  eax,al
  8098ed:	83 e0 10             	and    eax,0x10
  8098f0:	85 c0                	test   eax,eax
  8098f2:	74 29                	je     80991d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  8098f4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8098f8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8098fb:	48 98                	cdqe   
  8098fd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809901:	8d 48 20             	lea    ecx,[rax+0x20]
  809904:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809907:	8d 50 01             	lea    edx,[rax+0x1]
  80990a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80990d:	48 63 d0             	movsxd rdx,eax
  809910:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809914:	48 01 d0             	add    rax,rdx
  809917:	89 ca                	mov    edx,ecx
  809919:	88 10                	mov    BYTE PTR [rax],dl
  80991b:	eb 24                	jmp    809941 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80991d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809921:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809924:	48 98                	cdqe   
  809926:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80992a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80992d:	8d 50 01             	lea    edx,[rax+0x1]
  809930:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809933:	48 63 d0             	movsxd rdx,eax
  809936:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80993a:	48 01 d0             	add    rax,rdx
  80993d:	89 ca                	mov    edx,ecx
  80993f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  809941:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809945:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  809949:	7e 86                	jle    8098d1 <FAT32_readdir+0x557>
  80994b:	eb 01                	jmp    80994e <FAT32_readdir+0x5d4>
				break;
  80994d:	90                   	nop
		}
		if(x == 8)
  80994e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  809952:	0f 85 84 00 00 00    	jne    8099dc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  809958:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80995c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80995f:	48 63 d0             	movsxd rdx,eax
  809962:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809966:	48 01 d0             	add    rax,rdx
  809969:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80996c:	eb 6e                	jmp    8099dc <FAT32_readdir+0x662>
			continue;
  80996e:	90                   	nop
  80996f:	eb 01                	jmp    809972 <FAT32_readdir+0x5f8>
			continue;
  809971:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809972:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  809976:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80997b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80997f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809982:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809986:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80998a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80998d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809990:	48 63 d0             	movsxd rdx,eax
  809993:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809997:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80999b:	48 39 c2             	cmp    rdx,rax
  80999e:	0f 8c ba fb ff ff    	jl     80955e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8099a4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8099a7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8099ab:	89 d6                	mov    esi,edx
  8099ad:	48 89 c7             	mov    rdi,rax
  8099b0:	e8 b0 ee ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  8099b5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  8099b8:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  8099bf:	77 05                	ja     8099c6 <FAT32_readdir+0x64c>
		goto next_cluster;
  8099c1:	e9 d5 fa ff ff       	jmp    80949b <FAT32_readdir+0x121>

	vmfree(buf);
  8099c6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099ca:	48 89 c7             	mov    rdi,rax
  8099cd:	e8 67 79 ff ff       	call   801339 <vmfree>
	return NULL;
  8099d2:	b8 00 00 00 00       	mov    eax,0x0
  8099d7:	eb 3b                	jmp    809a14 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  8099d9:	90                   	nop
  8099da:	eb 01                	jmp    8099dd <FAT32_readdir+0x663>
		goto find_lookup_success;
  8099dc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  8099dd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8099e4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  8099e8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099ec:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  8099ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8099f2:	48 63 d0             	movsxd rdx,eax
  8099f5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  8099f9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8099fd:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  809a01:	41 b8 00 00 00 00    	mov    r8d,0x0
  809a07:	b9 00 00 00 00       	mov    ecx,0x0
  809a0c:	48 89 c7             	mov    rdi,rax
  809a0f:	41 ff d1             	call   r9
  809a12:	48 98                	cdqe   
}
  809a14:	c9                   	leave  
  809a15:	c3                   	ret    

0000000000809a16 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809a16:	f3 0f 1e fa          	endbr64 
  809a1a:	55                   	push   rbp
  809a1b:	48 89 e5             	mov    rbp,rsp
  809a1e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a22:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809a26:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809a29:	90                   	nop
  809a2a:	5d                   	pop    rbp
  809a2b:	c3                   	ret    

0000000000809a2c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  809a2c:	f3 0f 1e fa          	endbr64 
  809a30:	55                   	push   rbp
  809a31:	48 89 e5             	mov    rbp,rsp
  809a34:	48 83 ec 60          	sub    rsp,0x60
  809a38:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  809a3c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  809a40:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809a44:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a48:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  809a4c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809a50:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a54:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a58:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  809a5c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809a63:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809a6a:	00 
	unsigned char * buf =NULL; 
  809a6b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  809a72:	00 
	int i = 0,j = 0,x = 0;
  809a73:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809a7a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809a81:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809a88:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809a8f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809a90:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809a97:	00 
	struct index_node * p = NULL;
  809a98:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  809a9f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809aa0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809aa4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809aa8:	be 00 00 00 00       	mov    esi,0x0
  809aad:	48 89 c7             	mov    rdi,rax
  809ab0:	b8 00 00 00 00       	mov    eax,0x0
  809ab5:	e8 f0 77 ff ff       	call   8012aa <vmalloc>
  809aba:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  809abe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809ac2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ac5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809ac8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809acc:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809ad0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ad3:	83 e8 02             	sub    eax,0x2
  809ad6:	89 c1                	mov    ecx,eax
  809ad8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809adc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ae0:	48 0f af c1          	imul   rax,rcx
  809ae4:	48 01 d0             	add    rax,rdx
  809ae7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  809aeb:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809aef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809af2:	89 c6                	mov    esi,eax
  809af4:	bf d8 41 81 00       	mov    edi,0x8141d8
  809af9:	b8 00 00 00 00       	mov    eax,0x0
  809afe:	e8 15 72 ff ff       	call   800d18 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809b03:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809b07:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809b0b:	89 c1                	mov    ecx,eax
  809b0d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b11:	89 c2                	mov    edx,eax
  809b13:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b17:	49 89 c0             	mov    r8,rax
  809b1a:	be 00 00 00 00       	mov    esi,0x0
  809b1f:	bf 00 00 00 00       	mov    edi,0x0
  809b24:	e8 b0 e0 ff ff       	call   807bd9 <request>
  809b29:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  809b2c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  809b2f:	89 c7                	mov    edi,eax
  809b31:	e8 57 e7 ff ff       	call   80828d <chk_result>
  809b36:	85 c0                	test   eax,eax
  809b38:	75 25                	jne    809b5f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  809b3a:	bf 00 42 81 00       	mov    edi,0x814200
  809b3f:	b8 00 00 00 00       	mov    eax,0x0
  809b44:	e8 cf 71 ff ff       	call   800d18 <printf>
		vmfree(buf);
  809b49:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b4d:	48 89 c7             	mov    rdi,rax
  809b50:	e8 e4 77 ff ff       	call   801339 <vmfree>
		return NULL;
  809b55:	b8 00 00 00 00       	mov    eax,0x0
  809b5a:	e9 f0 07 00 00       	jmp    80a34f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  809b5f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b63:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  809b67:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809b6e:	e9 9d 05 00 00       	jmp    80a110 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809b73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b77:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809b7b:	3c 0f                	cmp    al,0xf
  809b7d:	0f 84 59 05 00 00    	je     80a0dc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809b83:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b87:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b8a:	3c e5                	cmp    al,0xe5
  809b8c:	0f 84 4d 05 00 00    	je     80a0df <FAT32_lookup+0x6b3>
  809b92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b99:	84 c0                	test   al,al
  809b9b:	0f 84 3e 05 00 00    	je     80a0df <FAT32_lookup+0x6b3>
  809ba1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ba5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ba8:	3c 05                	cmp    al,0x5
  809baa:	0f 84 2f 05 00 00    	je     80a0df <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809bb0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809bb4:	48 83 e8 20          	sub    rax,0x20
  809bb8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  809bbc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809bc3:	e9 88 01 00 00       	jmp    809d50 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  809bc8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809bcf:	eb 6a                	jmp    809c3b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  809bd1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bd5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809bd8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bdb:	7e 15                	jle    809bf2 <FAT32_lookup+0x1c6>
  809bdd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809be1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809be4:	48 63 d2             	movsxd rdx,edx
  809be7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809bec:	66 83 f8 ff          	cmp    ax,0xffff
  809bf0:	74 44                	je     809c36 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  809bf2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809bf6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809bf9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809bfc:	0f 8f e0 04 00 00    	jg     80a0e2 <FAT32_lookup+0x6b6>
  809c02:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c06:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c09:	48 63 d2             	movsxd rdx,edx
  809c0c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809c11:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c15:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809c18:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809c1b:	8d 50 01             	lea    edx,[rax+0x1]
  809c1e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809c21:	48 98                	cdqe   
  809c23:	48 01 f0             	add    rax,rsi
  809c26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c29:	66 98                	cbw    
  809c2b:	66 39 c1             	cmp    cx,ax
  809c2e:	0f 85 ae 04 00 00    	jne    80a0e2 <FAT32_lookup+0x6b6>
  809c34:	eb 01                	jmp    809c37 <FAT32_lookup+0x20b>
					continue;
  809c36:	90                   	nop
			for(x=0;x<5;x++)
  809c37:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809c3b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  809c3f:	7e 90                	jle    809bd1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  809c41:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809c48:	eb 6a                	jmp    809cb4 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  809c4a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c4e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c51:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c54:	7e 15                	jle    809c6b <FAT32_lookup+0x23f>
  809c56:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c5a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c5d:	48 63 d2             	movsxd rdx,edx
  809c60:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809c65:	66 83 f8 ff          	cmp    ax,0xffff
  809c69:	74 44                	je     809caf <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  809c6b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c6f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809c72:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809c75:	0f 8f 6a 04 00 00    	jg     80a0e5 <FAT32_lookup+0x6b9>
  809c7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c7f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809c82:	48 63 d2             	movsxd rdx,edx
  809c85:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809c8a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c8e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809c91:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809c94:	8d 50 01             	lea    edx,[rax+0x1]
  809c97:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809c9a:	48 98                	cdqe   
  809c9c:	48 01 f0             	add    rax,rsi
  809c9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ca2:	66 98                	cbw    
  809ca4:	66 39 c1             	cmp    cx,ax
  809ca7:	0f 85 38 04 00 00    	jne    80a0e5 <FAT32_lookup+0x6b9>
  809cad:	eb 01                	jmp    809cb0 <FAT32_lookup+0x284>
					continue;
  809caf:	90                   	nop
			for(x=0;x<6;x++)
  809cb0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809cb4:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  809cb8:	7e 90                	jle    809c4a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  809cba:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809cc1:	eb 72                	jmp    809d35 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  809cc3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cc7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809cca:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809ccd:	7e 19                	jle    809ce8 <FAT32_lookup+0x2bc>
  809ccf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cd3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809cd6:	48 63 d2             	movsxd rdx,edx
  809cd9:	48 83 c2 08          	add    rdx,0x8
  809cdd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809ce2:	66 83 f8 ff          	cmp    ax,0xffff
  809ce6:	74 48                	je     809d30 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  809ce8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cec:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809cef:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809cf2:	0f 8f f0 03 00 00    	jg     80a0e8 <FAT32_lookup+0x6bc>
  809cf8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809cfc:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  809cff:	48 63 d2             	movsxd rdx,edx
  809d02:	48 83 c2 08          	add    rdx,0x8
  809d06:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809d0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d0f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  809d12:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809d15:	8d 50 01             	lea    edx,[rax+0x1]
  809d18:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  809d1b:	48 98                	cdqe   
  809d1d:	48 01 f0             	add    rax,rsi
  809d20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d23:	66 98                	cbw    
  809d25:	66 39 c1             	cmp    cx,ax
  809d28:	0f 85 ba 03 00 00    	jne    80a0e8 <FAT32_lookup+0x6bc>
  809d2e:	eb 01                	jmp    809d31 <FAT32_lookup+0x305>
					continue;
  809d30:	90                   	nop
			for(x=0;x<2;x++)
  809d31:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809d35:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  809d39:	7e 88                	jle    809cc3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  809d3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d3f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809d42:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809d45:	0f 8d 14 04 00 00    	jge    80a15f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  809d4b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  809d50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809d54:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809d58:	3c 0f                	cmp    al,0xf
  809d5a:	75 0f                	jne    809d6b <FAT32_lookup+0x33f>
  809d5c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809d60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d63:	3c e5                	cmp    al,0xe5
  809d65:	0f 85 5d fe ff ff    	jne    809bc8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  809d6b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  809d72:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809d79:	e9 f4 01 00 00       	jmp    809f72 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  809d7e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809d82:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809d85:	48 98                	cdqe   
  809d87:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d8b:	0f b6 c0             	movzx  eax,al
  809d8e:	83 f8 7a             	cmp    eax,0x7a
  809d91:	0f 8f d0 01 00 00    	jg     809f67 <FAT32_lookup+0x53b>
  809d97:	83 f8 61             	cmp    eax,0x61
  809d9a:	0f 8d e6 00 00 00    	jge    809e86 <FAT32_lookup+0x45a>
  809da0:	83 f8 5a             	cmp    eax,0x5a
  809da3:	0f 8f be 01 00 00    	jg     809f67 <FAT32_lookup+0x53b>
  809da9:	83 f8 41             	cmp    eax,0x41
  809dac:	0f 8d d4 00 00 00    	jge    809e86 <FAT32_lookup+0x45a>
  809db2:	83 f8 20             	cmp    eax,0x20
  809db5:	74 1a                	je     809dd1 <FAT32_lookup+0x3a5>
  809db7:	83 f8 20             	cmp    eax,0x20
  809dba:	0f 8c a7 01 00 00    	jl     809f67 <FAT32_lookup+0x53b>
  809dc0:	83 e8 30             	sub    eax,0x30
  809dc3:	83 f8 09             	cmp    eax,0x9
  809dc6:	0f 87 9b 01 00 00    	ja     809f67 <FAT32_lookup+0x53b>
  809dcc:	e9 53 01 00 00       	jmp    809f24 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809dd1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dd5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809dd9:	0f b6 c0             	movzx  eax,al
  809ddc:	83 e0 10             	and    eax,0x10
  809ddf:	85 c0                	test   eax,eax
  809de1:	75 50                	jne    809e33 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  809de3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809de7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809dea:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809ded:	48 98                	cdqe   
  809def:	48 01 d0             	add    rax,rdx
  809df2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809df5:	3c 2e                	cmp    al,0x2e
  809df7:	0f 84 70 01 00 00    	je     809f6d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809dfd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e01:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e04:	48 98                	cdqe   
  809e06:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809e0a:	0f b6 d0             	movzx  edx,al
  809e0d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e11:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e14:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e17:	48 98                	cdqe   
  809e19:	48 01 c8             	add    rax,rcx
  809e1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e1f:	0f be c0             	movsx  eax,al
  809e22:	39 c2                	cmp    edx,eax
  809e24:	0f 85 c1 02 00 00    	jne    80a0eb <FAT32_lookup+0x6bf>
						{
							j++;
  809e2a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e2e:	e9 3b 01 00 00       	jmp    809f6e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809e33:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e37:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e3a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e3d:	7d 32                	jge    809e71 <FAT32_lookup+0x445>
  809e3f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809e43:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e46:	48 98                	cdqe   
  809e48:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809e4c:	0f b6 d0             	movzx  edx,al
  809e4f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e53:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809e56:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809e59:	48 98                	cdqe   
  809e5b:	48 01 c8             	add    rax,rcx
  809e5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e61:	0f be c0             	movsx  eax,al
  809e64:	39 c2                	cmp    edx,eax
  809e66:	75 09                	jne    809e71 <FAT32_lookup+0x445>
						{
							j++;
  809e68:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809e6c:	e9 fd 00 00 00       	jmp    809f6e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  809e71:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e75:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e78:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809e7b:	0f 85 6d 02 00 00    	jne    80a0ee <FAT32_lookup+0x6c2>
							continue;
  809e81:	e9 e8 00 00 00       	jmp    809f6e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809e86:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e8a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809e8e:	0f b6 c0             	movzx  eax,al
  809e91:	83 e0 08             	and    eax,0x8
  809e94:	85 c0                	test   eax,eax
  809e96:	74 49                	je     809ee1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809e98:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e9c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e9f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809ea2:	0f 8d 49 02 00 00    	jge    80a0f1 <FAT32_lookup+0x6c5>
  809ea8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809eac:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809eaf:	48 98                	cdqe   
  809eb1:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809eb5:	0f b6 c0             	movzx  eax,al
  809eb8:	8d 50 20             	lea    edx,[rax+0x20]
  809ebb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809ebf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809ec2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809ec5:	48 98                	cdqe   
  809ec7:	48 01 c8             	add    rax,rcx
  809eca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ecd:	0f be c0             	movsx  eax,al
  809ed0:	39 c2                	cmp    edx,eax
  809ed2:	0f 85 19 02 00 00    	jne    80a0f1 <FAT32_lookup+0x6c5>
						{
							j++;
  809ed8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809edc:	e9 8d 00 00 00       	jmp    809f6e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809ee1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809ee5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809ee8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809eeb:	0f 8d 03 02 00 00    	jge    80a0f4 <FAT32_lookup+0x6c8>
  809ef1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809ef5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809ef8:	48 98                	cdqe   
  809efa:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809efe:	0f b6 d0             	movzx  edx,al
  809f01:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f05:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809f08:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809f0b:	48 98                	cdqe   
  809f0d:	48 01 c8             	add    rax,rcx
  809f10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f13:	0f be c0             	movsx  eax,al
  809f16:	39 c2                	cmp    edx,eax
  809f18:	0f 85 d6 01 00 00    	jne    80a0f4 <FAT32_lookup+0x6c8>
						{
							j++;
  809f1e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809f22:	eb 4a                	jmp    809f6e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809f24:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f28:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809f2b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809f2e:	0f 8d c3 01 00 00    	jge    80a0f7 <FAT32_lookup+0x6cb>
  809f34:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809f38:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809f3b:	48 98                	cdqe   
  809f3d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f41:	0f b6 d0             	movzx  edx,al
  809f44:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809f48:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809f4b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809f4e:	48 98                	cdqe   
  809f50:	48 01 c8             	add    rax,rcx
  809f53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f56:	0f be c0             	movsx  eax,al
  809f59:	39 c2                	cmp    edx,eax
  809f5b:	0f 85 96 01 00 00    	jne    80a0f7 <FAT32_lookup+0x6cb>
					{
						j++;
  809f61:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  809f65:	eb 07                	jmp    809f6e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  809f67:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  809f6b:	eb 01                	jmp    809f6e <FAT32_lookup+0x542>
							continue;
  809f6d:	90                   	nop
		for(x=0;x<8;x++)
  809f6e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809f72:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  809f76:	0f 8e 02 fe ff ff    	jle    809d7e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  809f7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f80:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809f84:	0f b6 c0             	movzx  eax,al
  809f87:	83 e0 10             	and    eax,0x10
  809f8a:	85 c0                	test   eax,eax
  809f8c:	0f 85 d0 01 00 00    	jne    80a162 <FAT32_lookup+0x736>
		{
			j++;
  809f92:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  809f96:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  809f9d:	e9 2b 01 00 00       	jmp    80a0cd <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  809fa2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809fa6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809fa9:	48 98                	cdqe   
  809fab:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809faf:	0f b6 c0             	movzx  eax,al
  809fb2:	83 f8 7a             	cmp    eax,0x7a
  809fb5:	0f 8f 3f 01 00 00    	jg     80a0fa <FAT32_lookup+0x6ce>
  809fbb:	83 f8 61             	cmp    eax,0x61
  809fbe:	7d 2e                	jge    809fee <FAT32_lookup+0x5c2>
  809fc0:	83 f8 5a             	cmp    eax,0x5a
  809fc3:	0f 8f 31 01 00 00    	jg     80a0fa <FAT32_lookup+0x6ce>
  809fc9:	83 f8 41             	cmp    eax,0x41
  809fcc:	7d 20                	jge    809fee <FAT32_lookup+0x5c2>
  809fce:	83 f8 20             	cmp    eax,0x20
  809fd1:	0f 84 c4 00 00 00    	je     80a09b <FAT32_lookup+0x66f>
  809fd7:	83 f8 20             	cmp    eax,0x20
  809fda:	0f 8c 1a 01 00 00    	jl     80a0fa <FAT32_lookup+0x6ce>
  809fe0:	83 e8 30             	sub    eax,0x30
  809fe3:	83 f8 09             	cmp    eax,0x9
  809fe6:	0f 87 0e 01 00 00    	ja     80a0fa <FAT32_lookup+0x6ce>
  809fec:	eb 7e                	jmp    80a06c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809fee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ff2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809ff6:	0f b6 c0             	movzx  eax,al
  809ff9:	83 e0 10             	and    eax,0x10
  809ffc:	85 c0                	test   eax,eax
  809ffe:	74 39                	je     80a039 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a000:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a004:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a007:	48 98                	cdqe   
  80a009:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a00d:	0f b6 c0             	movzx  eax,al
  80a010:	8d 50 20             	lea    edx,[rax+0x20]
  80a013:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a017:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a01a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a01d:	48 98                	cdqe   
  80a01f:	48 01 c8             	add    rax,rcx
  80a022:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a025:	0f be c0             	movsx  eax,al
  80a028:	39 c2                	cmp    edx,eax
  80a02a:	0f 85 cd 00 00 00    	jne    80a0fd <FAT32_lookup+0x6d1>
							{
								j++;
  80a030:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a034:	e9 90 00 00 00       	jmp    80a0c9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a039:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a03d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a040:	48 98                	cdqe   
  80a042:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a046:	0f b6 d0             	movzx  edx,al
  80a049:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a04d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a050:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a053:	48 98                	cdqe   
  80a055:	48 01 c8             	add    rax,rcx
  80a058:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a05b:	0f be c0             	movsx  eax,al
  80a05e:	39 c2                	cmp    edx,eax
  80a060:	0f 85 9a 00 00 00    	jne    80a100 <FAT32_lookup+0x6d4>
							{
								j++;
  80a066:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a06a:	eb 5d                	jmp    80a0c9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a06c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a070:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a073:	48 98                	cdqe   
  80a075:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a079:	0f b6 d0             	movzx  edx,al
  80a07c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a080:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a083:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a086:	48 98                	cdqe   
  80a088:	48 01 c8             	add    rax,rcx
  80a08b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a08e:	0f be c0             	movsx  eax,al
  80a091:	39 c2                	cmp    edx,eax
  80a093:	75 6e                	jne    80a103 <FAT32_lookup+0x6d7>
						{
							j++;
  80a095:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a099:	eb 2e                	jmp    80a0c9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a09b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a09f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a0a2:	48 98                	cdqe   
  80a0a4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a0a8:	0f b6 d0             	movzx  edx,al
  80a0ab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0af:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a0b2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0b5:	48 98                	cdqe   
  80a0b7:	48 01 c8             	add    rax,rcx
  80a0ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0bd:	0f be c0             	movsx  eax,al
  80a0c0:	39 c2                	cmp    edx,eax
  80a0c2:	75 42                	jne    80a106 <FAT32_lookup+0x6da>
						{
							j++;
  80a0c4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a0c8:	90                   	nop
			for(x=8;x<11;x++)
  80a0c9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a0cd:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a0d1:	0f 8e cb fe ff ff    	jle    809fa2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a0d7:	e9 86 00 00 00       	jmp    80a162 <FAT32_lookup+0x736>
			continue;
  80a0dc:	90                   	nop
  80a0dd:	eb 28                	jmp    80a107 <FAT32_lookup+0x6db>
			continue;
  80a0df:	90                   	nop
  80a0e0:	eb 25                	jmp    80a107 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0e2:	90                   	nop
  80a0e3:	eb 22                	jmp    80a107 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0e5:	90                   	nop
  80a0e6:	eb 1f                	jmp    80a107 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a0e8:	90                   	nop
  80a0e9:	eb 1c                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0eb:	90                   	nop
  80a0ec:	eb 19                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0ee:	90                   	nop
  80a0ef:	eb 16                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0f1:	90                   	nop
  80a0f2:	eb 13                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a0f4:	90                   	nop
  80a0f5:	eb 10                	jmp    80a107 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a0f7:	90                   	nop
  80a0f8:	eb 0d                	jmp    80a107 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a0fa:	90                   	nop
  80a0fb:	eb 0a                	jmp    80a107 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a0fd:	90                   	nop
  80a0fe:	eb 07                	jmp    80a107 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a100:	90                   	nop
  80a101:	eb 04                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a103:	90                   	nop
  80a104:	eb 01                	jmp    80a107 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a106:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a107:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a10b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a110:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a113:	48 63 d0             	movsxd rdx,eax
  80a116:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a11a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a11e:	48 39 c2             	cmp    rdx,rax
  80a121:	0f 8c 4c fa ff ff    	jl     809b73 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a127:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a12a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a12e:	89 d6                	mov    esi,edx
  80a130:	48 89 c7             	mov    rdi,rax
  80a133:	e8 2d e7 ff ff       	call   808865 <DISK1_FAT32_read_FAT_Entry>
  80a138:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a13b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a142:	77 05                	ja     80a149 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a144:	e9 7f f9 ff ff       	jmp    809ac8 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a149:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a14d:	48 89 c7             	mov    rdi,rax
  80a150:	e8 e4 71 ff ff       	call   801339 <vmfree>
	return NULL;
  80a155:	b8 00 00 00 00       	mov    eax,0x0
  80a15a:	e9 f0 01 00 00       	jmp    80a34f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a15f:	90                   	nop
  80a160:	eb 01                	jmp    80a163 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a162:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a163:	be 00 00 00 00       	mov    esi,0x0
  80a168:	bf 38 00 00 00       	mov    edi,0x38
  80a16d:	b8 00 00 00 00       	mov    eax,0x0
  80a172:	e8 33 71 ff ff       	call   8012aa <vmalloc>
  80a177:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a17b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a17f:	ba 38 00 00 00       	mov    edx,0x38
  80a184:	be 00 00 00 00       	mov    esi,0x0
  80a189:	48 89 c7             	mov    rdi,rax
  80a18c:	e8 6f 15 00 00       	call   80b700 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a191:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a195:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a198:	89 c2                	mov    edx,eax
  80a19a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a19e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a1a1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1a5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a1a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1ac:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a1b0:	48 01 d0             	add    rax,rdx
  80a1b3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a1b7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1bb:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a1bf:	48 89 c1             	mov    rcx,rax
  80a1c2:	48 89 d0             	mov    rax,rdx
  80a1c5:	ba 00 00 00 00       	mov    edx,0x0
  80a1ca:	48 f7 f1             	div    rcx
  80a1cd:	48 89 c2             	mov    rdx,rax
  80a1d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1d4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a1d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1dc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a1e0:	0f b6 c0             	movzx  eax,al
  80a1e3:	83 e0 10             	and    eax,0x10
  80a1e6:	85 c0                	test   eax,eax
  80a1e8:	74 07                	je     80a1f1 <FAT32_lookup+0x7c5>
  80a1ea:	ba 02 00 00 00       	mov    edx,0x2
  80a1ef:	eb 05                	jmp    80a1f6 <FAT32_lookup+0x7ca>
  80a1f1:	ba 01 00 00 00       	mov    edx,0x1
  80a1f6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a1fa:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a1fe:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a202:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a206:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a20a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a20e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a212:	48 c7 40 20 40 c2 80 	mov    QWORD PTR [rax+0x20],0x80c240
  80a219:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a21a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a21e:	48 c7 40 28 80 c2 80 	mov    QWORD PTR [rax+0x28],0x80c280
  80a225:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a226:	be 00 00 00 00       	mov    esi,0x0
  80a22b:	bf 20 00 00 00       	mov    edi,0x20
  80a230:	b8 00 00 00 00       	mov    eax,0x0
  80a235:	e8 70 70 ff ff       	call   8012aa <vmalloc>
  80a23a:	48 89 c2             	mov    rdx,rax
  80a23d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a241:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a245:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a249:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a24d:	ba 20 00 00 00       	mov    edx,0x20
  80a252:	be 00 00 00 00       	mov    esi,0x0
  80a257:	48 89 c7             	mov    rdi,rax
  80a25a:	e8 a1 14 00 00       	call   80b700 <memset>
	finode = p->private_index_info;
  80a25f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a263:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a267:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a26b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a26f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a273:	0f b7 c0             	movzx  eax,ax
  80a276:	c1 e0 10             	shl    eax,0x10
  80a279:	89 c2                	mov    edx,eax
  80a27b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a27f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a283:	0f b7 c0             	movzx  eax,ax
  80a286:	09 d0                	or     eax,edx
  80a288:	48 98                	cdqe   
  80a28a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a28f:	48 89 c2             	mov    rdx,rax
  80a292:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a296:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a299:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a29c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2a0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a2a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2a8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a2ac:	48 c1 f8 05          	sar    rax,0x5
  80a2b0:	48 89 c2             	mov    rdx,rax
  80a2b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2b7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a2bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2bf:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a2c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2c7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a2cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2cf:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a2d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2d7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a2db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2df:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a2e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2e7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a2eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2ef:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a2f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a2f7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a2fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2ff:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a303:	66 c1 e8 0c          	shr    ax,0xc
  80a307:	66 85 c0             	test   ax,ax
  80a30a:	74 27                	je     80a333 <FAT32_lookup+0x907>
  80a30c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a310:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a314:	83 e0 01             	and    eax,0x1
  80a317:	48 85 c0             	test   rax,rax
  80a31a:	74 17                	je     80a333 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a31c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a320:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a324:	48 83 c8 04          	or     rax,0x4
  80a328:	48 89 c2             	mov    rdx,rax
  80a32b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a32f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a333:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a337:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a33b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a33f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a343:	48 89 c7             	mov    rdi,rax
  80a346:	e8 ee 6f ff ff       	call   801339 <vmfree>
	return dest_dentry;	
  80a34b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80a34f:	c9                   	leave  
  80a350:	c3                   	ret    

000000000080a351 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a351:	f3 0f 1e fa          	endbr64 
  80a355:	55                   	push   rbp
  80a356:	48 89 e5             	mov    rbp,rsp
  80a359:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a35d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a361:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a364:	90                   	nop
  80a365:	5d                   	pop    rbp
  80a366:	c3                   	ret    

000000000080a367 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80a367:	f3 0f 1e fa          	endbr64 
  80a36b:	55                   	push   rbp
  80a36c:	48 89 e5             	mov    rbp,rsp
  80a36f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a373:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a377:	90                   	nop
  80a378:	5d                   	pop    rbp
  80a379:	c3                   	ret    

000000000080a37a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80a37a:	f3 0f 1e fa          	endbr64 
  80a37e:	55                   	push   rbp
  80a37f:	48 89 e5             	mov    rbp,rsp
  80a382:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a386:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a38a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a38e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a392:	90                   	nop
  80a393:	5d                   	pop    rbp
  80a394:	c3                   	ret    

000000000080a395 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a395:	f3 0f 1e fa          	endbr64 
  80a399:	55                   	push   rbp
  80a39a:	48 89 e5             	mov    rbp,rsp
  80a39d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3a1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3a5:	90                   	nop
  80a3a6:	5d                   	pop    rbp
  80a3a7:	c3                   	ret    

000000000080a3a8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a3a8:	f3 0f 1e fa          	endbr64 
  80a3ac:	55                   	push   rbp
  80a3ad:	48 89 e5             	mov    rbp,rsp
  80a3b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3b4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3b8:	90                   	nop
  80a3b9:	5d                   	pop    rbp
  80a3ba:	c3                   	ret    

000000000080a3bb <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80a3bb:	f3 0f 1e fa          	endbr64 
  80a3bf:	55                   	push   rbp
  80a3c0:	48 89 e5             	mov    rbp,rsp
  80a3c3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3c7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3cb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a3cf:	90                   	nop
  80a3d0:	5d                   	pop    rbp
  80a3d1:	c3                   	ret    

000000000080a3d2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80a3d2:	f3 0f 1e fa          	endbr64 
  80a3d6:	55                   	push   rbp
  80a3d7:	48 89 e5             	mov    rbp,rsp
  80a3da:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3de:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a3e2:	90                   	nop
  80a3e3:	5d                   	pop    rbp
  80a3e4:	c3                   	ret    

000000000080a3e5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80a3e5:	f3 0f 1e fa          	endbr64 
  80a3e9:	55                   	push   rbp
  80a3ea:	48 89 e5             	mov    rbp,rsp
  80a3ed:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a3f1:	90                   	nop
  80a3f2:	5d                   	pop    rbp
  80a3f3:	c3                   	ret    

000000000080a3f4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80a3f4:	f3 0f 1e fa          	endbr64 
  80a3f8:	55                   	push   rbp
  80a3f9:	48 89 e5             	mov    rbp,rsp
  80a3fc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a400:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a404:	90                   	nop
  80a405:	5d                   	pop    rbp
  80a406:	c3                   	ret    

000000000080a407 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80a407:	f3 0f 1e fa          	endbr64 
  80a40b:	55                   	push   rbp
  80a40c:	48 89 e5             	mov    rbp,rsp
  80a40f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a413:	90                   	nop
  80a414:	5d                   	pop    rbp
  80a415:	c3                   	ret    

000000000080a416 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80a416:	f3 0f 1e fa          	endbr64 
  80a41a:	55                   	push   rbp
  80a41b:	48 89 e5             	mov    rbp,rsp
  80a41e:	48 83 ec 10          	sub    rsp,0x10
  80a422:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80a426:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a42a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a42e:	48 89 c7             	mov    rdi,rax
  80a431:	e8 03 6f ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80a436:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a43a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a43d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a441:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a445:	48 89 c7             	mov    rdi,rax
  80a448:	e8 ec 6e ff ff       	call   801339 <vmfree>
	vmfree(sb->root->dir_inode);
  80a44d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a451:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a454:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a458:	48 89 c7             	mov    rdi,rax
  80a45b:	e8 d9 6e ff ff       	call   801339 <vmfree>
	vmfree(sb->root);
  80a460:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a464:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a467:	48 89 c7             	mov    rdi,rax
  80a46a:	e8 ca 6e ff ff       	call   801339 <vmfree>
	vmfree(sb);
  80a46f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a473:	48 89 c7             	mov    rdi,rax
  80a476:	e8 be 6e ff ff       	call   801339 <vmfree>
}
  80a47b:	90                   	nop
  80a47c:	c9                   	leave  
  80a47d:	c3                   	ret    

000000000080a47e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80a47e:	f3 0f 1e fa          	endbr64 
  80a482:	55                   	push   rbp
  80a483:	48 89 e5             	mov    rbp,rsp
  80a486:	48 83 ec 40          	sub    rsp,0x40
  80a48a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80a48e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a495:	00 
	struct FAT32_Directory * buf = NULL;
  80a496:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a49d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80a49e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a4a2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a4a6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80a4aa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a4ae:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a4b2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4b6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80a4ba:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a4c1:	00 

	if(finode->dentry_location == 0)
  80a4c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4c6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a4ca:	48 85 c0             	test   rax,rax
  80a4cd:	75 14                	jne    80a4e3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80a4cf:	bf 2c 42 81 00       	mov    edi,0x81422c
  80a4d4:	b8 00 00 00 00       	mov    eax,0x0
  80a4d9:	e8 3a 68 ff ff       	call   800d18 <printf>
		return ;
  80a4de:	e9 30 01 00 00       	jmp    80a613 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80a4e3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4e7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a4eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4ef:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a4f3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a4f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4ff:	48 0f af c2          	imul   rax,rdx
  80a503:	48 01 c8             	add    rax,rcx
  80a506:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80a50a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a50e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a512:	be 00 00 00 00       	mov    esi,0x0
  80a517:	48 89 c7             	mov    rdi,rax
  80a51a:	b8 00 00 00 00       	mov    eax,0x0
  80a51f:	e8 86 6d ff ff       	call   8012aa <vmalloc>
  80a524:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80a528:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a52c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a530:	89 c2                	mov    edx,eax
  80a532:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a536:	be 00 00 00 00       	mov    esi,0x0
  80a53b:	48 89 c7             	mov    rdi,rax
  80a53e:	e8 bd 11 00 00       	call   80b700 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a543:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a547:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a54b:	89 c1                	mov    ecx,eax
  80a54d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a551:	89 c2                	mov    edx,eax
  80a553:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a557:	49 89 c0             	mov    r8,rax
  80a55a:	be 00 00 00 00       	mov    esi,0x0
  80a55f:	bf 00 00 00 00       	mov    edi,0x0
  80a564:	e8 70 d6 ff ff       	call   807bd9 <request>
  80a569:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80a56c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a56f:	89 c7                	mov    edi,eax
  80a571:	e8 17 dd ff ff       	call   80828d <chk_result>
    fdentry = buf+finode->dentry_position;
  80a576:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a57a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a57e:	48 c1 e0 05          	shl    rax,0x5
  80a582:	48 89 c2             	mov    rdx,rax
  80a585:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a589:	48 01 d0             	add    rax,rdx
  80a58c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80a590:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a594:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a597:	89 c2                	mov    edx,eax
  80a599:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a59d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80a5a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a5a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a5a7:	89 c2                	mov    edx,eax
  80a5a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5ad:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80a5b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5b5:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a5b9:	66 25 00 f0          	and    ax,0xf000
  80a5bd:	89 c2                	mov    edx,eax
  80a5bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a5c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a5c6:	48 c1 e8 10          	shr    rax,0x10
  80a5ca:	09 c2                	or     edx,eax
  80a5cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5d0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a5d4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a5d8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a5dc:	89 c1                	mov    ecx,eax
  80a5de:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a5e2:	89 c2                	mov    edx,eax
  80a5e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5e8:	49 89 c0             	mov    r8,rax
  80a5eb:	be 01 00 00 00       	mov    esi,0x1
  80a5f0:	bf 00 00 00 00       	mov    edi,0x0
  80a5f5:	e8 df d5 ff ff       	call   807bd9 <request>
  80a5fa:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80a5fd:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80a600:	89 c7                	mov    edi,eax
  80a602:	e8 86 dc ff ff       	call   80828d <chk_result>
	vmfree(buf);
  80a607:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a60b:	48 89 c7             	mov    rdi,rax
  80a60e:	e8 26 6d ff ff       	call   801339 <vmfree>
}
  80a613:	c9                   	leave  
  80a614:	c3                   	ret    

000000000080a615 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80a615:	f3 0f 1e fa          	endbr64 
  80a619:	55                   	push   rbp
  80a61a:	48 89 e5             	mov    rbp,rsp
  80a61d:	48 83 ec 50          	sub    rsp,0x50
  80a621:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80a625:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80a629:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a630:	00 
	struct FAT32_inode_info * finode = NULL;
  80a631:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a638:	00 
	struct FAT32_BootSector * fbs = NULL;
  80a639:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a640:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80a641:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a648:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80a649:	be 00 00 00 00       	mov    esi,0x0
  80a64e:	bf 18 00 00 00       	mov    edi,0x18
  80a653:	b8 00 00 00 00       	mov    eax,0x0
  80a658:	e8 4d 6c ff ff       	call   8012aa <vmalloc>
  80a65d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80a661:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a665:	ba 18 00 00 00       	mov    edx,0x18
  80a66a:	be 00 00 00 00       	mov    esi,0x0
  80a66f:	48 89 c7             	mov    rdi,rax
  80a672:	e8 89 10 00 00       	call   80b700 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80a677:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a67b:	48 c7 40 08 e0 c2 80 	mov    QWORD PTR [rax+0x8],0x80c2e0
  80a682:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80a683:	be 00 00 00 00       	mov    esi,0x0
  80a688:	bf 60 00 00 00       	mov    edi,0x60
  80a68d:	b8 00 00 00 00       	mov    eax,0x0
  80a692:	e8 13 6c ff ff       	call   8012aa <vmalloc>
  80a697:	48 89 c2             	mov    rdx,rax
  80a69a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a69e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80a6a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a6a6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6aa:	ba 60 00 00 00       	mov    edx,0x60
  80a6af:	be 00 00 00 00       	mov    esi,0x0
  80a6b4:	48 89 c7             	mov    rdi,rax
  80a6b7:	e8 44 10 00 00       	call   80b700 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80a6bc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a6c0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80a6c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a6c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6cc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80a6d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6d4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a6d7:	89 c2                	mov    edx,eax
  80a6d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6dd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80a6e0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6e4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80a6e7:	89 c2                	mov    edx,eax
  80a6e9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a6ed:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80a6f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6f5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a6f9:	0f b6 d0             	movzx  edx,al
  80a6fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a700:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80a704:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a708:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80a70c:	0f b6 d0             	movzx  edx,al
  80a70f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a713:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a717:	0f b7 c0             	movzx  eax,ax
  80a71a:	0f af c2             	imul   eax,edx
  80a71d:	48 63 d0             	movsxd rdx,eax
  80a720:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a724:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80a728:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a72c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80a730:	0f b7 d0             	movzx  edx,ax
  80a733:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a737:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80a73b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a73f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a742:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a746:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a74a:	0f b7 c0             	movzx  eax,ax
  80a74d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80a750:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a754:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80a757:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a75b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a75f:	0f b6 c0             	movzx  eax,al
  80a762:	0f af c2             	imul   eax,edx
  80a765:	01 c8                	add    eax,ecx
  80a767:	89 c2                	mov    edx,eax
  80a769:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a76d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80a771:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a775:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80a778:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a77c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80a780:	0f b7 c0             	movzx  eax,ax
  80a783:	01 d0                	add    eax,edx
  80a785:	89 c2                	mov    edx,eax
  80a787:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a78b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80a78f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a793:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80a796:	89 c2                	mov    edx,eax
  80a798:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a79c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80a7a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7a4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80a7a8:	0f b6 d0             	movzx  edx,al
  80a7ab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7af:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80a7b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7b7:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a7bb:	0f b7 d0             	movzx  edx,ax
  80a7be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7c2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80a7c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7ca:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a7ce:	0f b7 d0             	movzx  edx,ax
  80a7d1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7d5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80a7d9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7dd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80a7e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7e4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80a7e8:	0f b7 d0             	movzx  edx,ax
  80a7eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7ef:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a7f3:	0f b7 c0             	movzx  eax,ax
  80a7f6:	89 c6                	mov    esi,eax
  80a7f8:	bf 48 42 81 00       	mov    edi,0x814248
  80a7fd:	b8 00 00 00 00       	mov    eax,0x0
  80a802:	e8 11 65 ff ff       	call   800d18 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80a807:	be 00 00 00 00       	mov    esi,0x0
  80a80c:	bf 00 02 00 00       	mov    edi,0x200
  80a811:	b8 00 00 00 00       	mov    eax,0x0
  80a816:	e8 8f 6a ff ff       	call   8012aa <vmalloc>
  80a81b:	48 89 c2             	mov    rdx,rax
  80a81e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a822:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80a826:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a82a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a82e:	ba 00 02 00 00       	mov    edx,0x200
  80a833:	be 00 00 00 00       	mov    esi,0x0
  80a838:	48 89 c7             	mov    rdi,rax
  80a83b:	e8 c0 0e 00 00       	call   80b700 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80a840:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a844:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80a848:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a84c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80a84f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a853:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80a857:	0f b7 c0             	movzx  eax,ax
  80a85a:	01 c8                	add    eax,ecx
  80a85c:	49 89 d0             	mov    r8,rdx
  80a85f:	b9 01 00 00 00       	mov    ecx,0x1
  80a864:	89 c2                	mov    edx,eax
  80a866:	be 00 00 00 00       	mov    esi,0x0
  80a86b:	bf 00 00 00 00       	mov    edi,0x0
  80a870:	e8 64 d3 ff ff       	call   807bd9 <request>
  80a875:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80a878:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80a87b:	89 c7                	mov    edi,eax
  80a87d:	e8 0b da ff ff       	call   80828d <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80a882:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a886:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a88a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80a890:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a894:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a898:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80a89e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a8a2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80a8a6:	8b 00                	mov    eax,DWORD PTR [rax]
  80a8a8:	89 c6                	mov    esi,eax
  80a8aa:	bf 90 42 81 00       	mov    edi,0x814290
  80a8af:	b8 00 00 00 00       	mov    eax,0x0
  80a8b4:	e8 5f 64 ff ff       	call   800d18 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80a8b9:	be 00 00 00 00       	mov    esi,0x0
  80a8be:	bf 48 00 00 00       	mov    edi,0x48
  80a8c3:	b8 00 00 00 00       	mov    eax,0x0
  80a8c8:	e8 dd 69 ff ff       	call   8012aa <vmalloc>
  80a8cd:	48 89 c2             	mov    rdx,rax
  80a8d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8d4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80a8d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8de:	ba 48 00 00 00       	mov    edx,0x48
  80a8e3:	be 00 00 00 00       	mov    esi,0x0
  80a8e8:	48 89 c7             	mov    rdi,rax
  80a8eb:	e8 10 0e 00 00       	call   80b700 <memset>

	list_init(&sbp->root->child_node);
  80a8f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8f7:	48 83 c0 10          	add    rax,0x10
  80a8fb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80a8ff:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a903:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a907:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a90a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a90e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a912:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a916:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80a917:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a91b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a91e:	48 83 c0 20          	add    rax,0x20
  80a922:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80a926:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a92a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a92e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80a931:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a935:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a939:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80a93d:	90                   	nop
	sbp->root->parent = sbp->root;
  80a93e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a942:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a945:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a949:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80a94c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80a950:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a954:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a957:	48 c7 40 40 c0 c2 80 	mov    QWORD PTR [rax+0x40],0x80c2c0
  80a95e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80a95f:	be 00 00 00 00       	mov    esi,0x0
  80a964:	bf 02 00 00 00       	mov    edi,0x2
  80a969:	b8 00 00 00 00       	mov    eax,0x0
  80a96e:	e8 37 69 ff ff       	call   8012aa <vmalloc>
  80a973:	48 89 c2             	mov    rdx,rax
  80a976:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a97a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a97d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80a980:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a984:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a987:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a98a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80a98d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a991:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a994:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a99b:	be 00 00 00 00       	mov    esi,0x0
  80a9a0:	bf 38 00 00 00       	mov    edi,0x38
  80a9a5:	b8 00 00 00 00       	mov    eax,0x0
  80a9aa:	e8 fb 68 ff ff       	call   8012aa <vmalloc>
  80a9af:	48 89 c2             	mov    rdx,rax
  80a9b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9b9:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80a9bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9c4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9c8:	ba 38 00 00 00       	mov    edx,0x38
  80a9cd:	be 00 00 00 00       	mov    esi,0x0
  80a9d2:	48 89 c7             	mov    rdi,rax
  80a9d5:	e8 26 0d 00 00       	call   80b700 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80a9da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9e1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9e5:	48 c7 40 28 80 c2 80 	mov    QWORD PTR [rax+0x28],0x80c280
  80a9ec:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80a9ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9f4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a9f8:	48 c7 40 20 40 c2 80 	mov    QWORD PTR [rax+0x20],0x80c240
  80a9ff:	00 
	sbp->root->dir_inode->file_size = 0;
  80aa00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa07:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa0b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80aa12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa16:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa19:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa1d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aa20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa24:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aa28:	48 01 d0             	add    rax,rdx
  80aa2b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80aa2f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa33:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80aa37:	48 89 c6             	mov    rsi,rax
  80aa3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa3e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa41:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80aa45:	48 89 d0             	mov    rax,rdx
  80aa48:	ba 00 00 00 00       	mov    edx,0x0
  80aa4d:	48 f7 f6             	div    rsi
  80aa50:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80aa54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa58:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa5b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa5f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80aa66:	00 
	sbp->root->dir_inode->sb = sbp;
  80aa67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa6b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa6e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa72:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80aa76:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80aa7a:	be 00 00 00 00       	mov    esi,0x0
  80aa7f:	bf 20 00 00 00       	mov    edi,0x20
  80aa84:	b8 00 00 00 00       	mov    eax,0x0
  80aa89:	e8 1c 68 ff ff       	call   8012aa <vmalloc>
  80aa8e:	48 89 c2             	mov    rdx,rax
  80aa91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa95:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa98:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa9c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80aaa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aaa4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aaa7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aaab:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aaaf:	ba 20 00 00 00       	mov    edx,0x20
  80aab4:	be 00 00 00 00       	mov    esi,0x0
  80aab9:	48 89 c7             	mov    rdi,rax
  80aabc:	e8 3f 0c 00 00       	call   80b700 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80aac1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aac5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aac8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aacc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aad0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80aad4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aad8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80aadb:	89 c2                	mov    edx,eax
  80aadd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aae1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80aae4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aae8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80aaef:	00 
	finode->dentry_position = 0; 
  80aaf0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aaf4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80aafb:	00 
	finode->create_date = 0;
  80aafc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab00:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80ab06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab0a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80ab10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab14:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80ab1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab1e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80ab24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80ab28:	c9                   	leave  
  80ab29:	c3                   	ret    

000000000080ab2a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80ab2a:	f3 0f 1e fa          	endbr64 
  80ab2e:	55                   	push   rbp
  80ab2f:	48 89 e5             	mov    rbp,rsp
  80ab32:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80ab39:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ab40:	00 
	struct Disk_Partition_Table DPT = {0};
  80ab41:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80ab48:	b8 00 00 00 00       	mov    eax,0x0
  80ab4d:	b9 40 00 00 00       	mov    ecx,0x40
  80ab52:	48 89 d7             	mov    rdi,rdx
  80ab55:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80ab58:	bf 00 c3 80 00       	mov    edi,0x80c300
  80ab5d:	e8 f1 c1 ff ff       	call   806d53 <register_filesystem>
	
	memset(buf,0,512);
  80ab62:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab69:	ba 00 02 00 00       	mov    edx,0x200
  80ab6e:	be 00 00 00 00       	mov    esi,0x0
  80ab73:	48 89 c7             	mov    rdi,rax
  80ab76:	e8 85 0b 00 00       	call   80b700 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80ab7b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ab82:	49 89 c0             	mov    r8,rax
  80ab85:	b9 01 00 00 00       	mov    ecx,0x1
  80ab8a:	ba 00 00 00 00       	mov    edx,0x0
  80ab8f:	be 00 00 00 00       	mov    esi,0x0
  80ab94:	bf 00 00 00 00       	mov    edi,0x0
  80ab99:	e8 3b d0 ff ff       	call   807bd9 <request>
  80ab9e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80aba1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80aba4:	89 c7                	mov    edi,eax
  80aba6:	e8 e2 d6 ff ff       	call   80828d <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80abab:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80abb2:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80abb9:	48 89 d6             	mov    rsi,rdx
  80abbc:	ba 40 00 00 00       	mov    edx,0x40
  80abc1:	48 89 c7             	mov    rdi,rax
  80abc4:	48 89 d1             	mov    rcx,rdx
  80abc7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80abca:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80abd1:	0f b6 d0             	movzx  edx,al
  80abd4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80abda:	89 c6                	mov    esi,eax
  80abdc:	bf d8 42 81 00       	mov    edi,0x8142d8
  80abe1:	b8 00 00 00 00       	mov    eax,0x0
  80abe6:	e8 2d 61 ff ff       	call   800d18 <printf>

	memset(buf,0,512);
  80abeb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80abf2:	ba 00 02 00 00       	mov    edx,0x200
  80abf7:	be 00 00 00 00       	mov    esi,0x0
  80abfc:	48 89 c7             	mov    rdi,rax
  80abff:	e8 fc 0a 00 00       	call   80b700 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80ac04:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80ac0a:	89 c2                	mov    edx,eax
  80ac0c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ac13:	49 89 c0             	mov    r8,rax
  80ac16:	b9 01 00 00 00       	mov    ecx,0x1
  80ac1b:	be 00 00 00 00       	mov    esi,0x0
  80ac20:	bf 00 00 00 00       	mov    edi,0x0
  80ac25:	e8 af cf ff ff       	call   807bd9 <request>
  80ac2a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80ac2d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ac30:	89 c7                	mov    edi,eax
  80ac32:	e8 56 d6 ff ff       	call   80828d <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80ac37:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80ac3e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80ac45:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80ac4c:	48 89 c2             	mov    rdx,rax
  80ac4f:	48 89 ce             	mov    rsi,rcx
  80ac52:	bf d2 42 81 00       	mov    edi,0x8142d2
  80ac57:	e8 7f c0 ff ff       	call   806cdb <mount_fs>
  80ac5c:	48 89 05 45 c9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1c945],rax        # 4275a8 <root_sb>
}
  80ac63:	90                   	nop
  80ac64:	c9                   	leave  
  80ac65:	c3                   	ret    

000000000080ac66 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80ac66:	f3 0f 1e fa          	endbr64 
  80ac6a:	55                   	push   rbp
  80ac6b:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  80ac6e:	48 8b 05 b3 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8b3]        # 42a528 <vpage_base>
  80ac75:	48 05 a0 00 00 00    	add    rax,0xa0
  80ac7b:	48 89 05 a6 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8a6],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  80ac82:	8b 05 a8 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8a8]        # 42a530 <page_boffset>
  80ac88:	05 a0 00 00 00       	add    eax,0xa0
  80ac8d:	89 05 9d f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f89d],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  80ac93:	48 8b 15 8e f8 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f88e]        # 42a528 <vpage_base>
  80ac9a:	48 8b 05 7f f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f87f]        # 42a520 <video_end>
  80aca1:	48 39 c2             	cmp    rdx,rax
  80aca4:	72 0e                	jb     80acb4 <scrdown+0x4e>
        vpage_base=video_base;
  80aca6:	48 8b 05 6b f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f86b]        # 42a518 <video_base>
  80acad:	48 89 05 74 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f874],rax        # 42a528 <vpage_base>
    set_origin();
  80acb4:	b8 00 00 00 00       	mov    eax,0x0
  80acb9:	e8 6a 00 00 00       	call   80ad28 <set_origin>
}
  80acbe:	90                   	nop
  80acbf:	5d                   	pop    rbp
  80acc0:	c3                   	ret    

000000000080acc1 <scrup>:
void scrup()
{
  80acc1:	f3 0f 1e fa          	endbr64 
  80acc5:	55                   	push   rbp
  80acc6:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80acc9:	8b 05 61 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f861]        # 42a530 <page_boffset>
  80accf:	85 c0                	test   eax,eax
  80acd1:	75 24                	jne    80acf7 <scrup+0x36>
    {
        page_boffset=0;
  80acd3:	c7 05 53 f8 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f853],0x0        # 42a530 <page_boffset>
  80acda:	00 00 00 
        vpage_base=video_base;
  80acdd:	48 8b 05 34 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f834]        # 42a518 <video_base>
  80ace4:	48 89 05 3d f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f83d],rax        # 42a528 <vpage_base>
        set_origin();
  80aceb:	b8 00 00 00 00       	mov    eax,0x0
  80acf0:	e8 33 00 00 00       	call   80ad28 <set_origin>
        return;
  80acf5:	eb 2f                	jmp    80ad26 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80acf7:	48 8b 05 2a f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f82a]        # 42a528 <vpage_base>
  80acfe:	48 2d a0 00 00 00    	sub    rax,0xa0
  80ad04:	48 89 05 1d f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f81d],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  80ad0b:	8b 05 1f f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f81f]        # 42a530 <page_boffset>
  80ad11:	2d a0 00 00 00       	sub    eax,0xa0
  80ad16:	89 05 14 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f814],eax        # 42a530 <page_boffset>
    set_origin();
  80ad1c:	b8 00 00 00 00       	mov    eax,0x0
  80ad21:	e8 02 00 00 00       	call   80ad28 <set_origin>
}
  80ad26:	5d                   	pop    rbp
  80ad27:	c3                   	ret    

000000000080ad28 <set_origin>:
void set_origin(void)
{
  80ad28:	f3 0f 1e fa          	endbr64 
  80ad2c:	55                   	push   rbp
  80ad2d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80ad30:	fa                   	cli    
    outb(port_reg_index,12);
  80ad31:	8b 05 09 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f809]        # 42a540 <port_reg_index>
  80ad37:	0f b7 c0             	movzx  eax,ax
  80ad3a:	be 0c 00 00 00       	mov    esi,0xc
  80ad3f:	89 c7                	mov    edi,eax
  80ad41:	e8 9a a9 ff ff       	call   8056e0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80ad46:	8b 05 e4 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7e4]        # 42a530 <page_boffset>
  80ad4c:	c1 e8 09             	shr    eax,0x9
  80ad4f:	0f b6 d0             	movzx  edx,al
  80ad52:	8b 05 ec f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7ec]        # 42a544 <port_reg_v>
  80ad58:	0f b7 c0             	movzx  eax,ax
  80ad5b:	89 d6                	mov    esi,edx
  80ad5d:	89 c7                	mov    edi,eax
  80ad5f:	e8 7c a9 ff ff       	call   8056e0 <outb>
    outb(port_reg_index,13);
  80ad64:	8b 05 d6 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7d6]        # 42a540 <port_reg_index>
  80ad6a:	0f b7 c0             	movzx  eax,ax
  80ad6d:	be 0d 00 00 00       	mov    esi,0xd
  80ad72:	89 c7                	mov    edi,eax
  80ad74:	e8 67 a9 ff ff       	call   8056e0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80ad79:	8b 05 b1 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7b1]        # 42a530 <page_boffset>
  80ad7f:	d1 e8                	shr    eax,1
  80ad81:	0f b6 d0             	movzx  edx,al
  80ad84:	8b 05 ba f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7ba]        # 42a544 <port_reg_v>
  80ad8a:	0f b7 c0             	movzx  eax,ax
  80ad8d:	89 d6                	mov    esi,edx
  80ad8f:	89 c7                	mov    edi,eax
  80ad91:	e8 4a a9 ff ff       	call   8056e0 <outb>
    asm volatile("sti");
  80ad96:	fb                   	sti    

}
  80ad97:	90                   	nop
  80ad98:	5d                   	pop    rbp
  80ad99:	c3                   	ret    

000000000080ad9a <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80ad9a:	f3 0f 1e fa          	endbr64 
  80ad9e:	55                   	push   rbp
  80ad9f:	48 89 e5             	mov    rbp,rsp
  80ada2:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80ada6:	be 08 45 81 00       	mov    esi,0x814508
  80adab:	bf b4 43 81 00       	mov    edi,0x8143b4
  80adb0:	e8 9a 09 00 00       	call   80b74f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80adb5:	be 0d 45 81 00       	mov    esi,0x81450d
  80adba:	bf 74 44 81 00       	mov    edi,0x814474
  80adbf:	e8 8b 09 00 00       	call   80b74f <strcpy>
    reg_driver(&drv_tty);
  80adc4:	bf 00 43 81 00       	mov    edi,0x814300
  80adc9:	e8 96 7a ff ff       	call   802864 <reg_driver>
    reg_device(&dev_tty);
  80adce:	bf a0 43 81 00       	mov    edi,0x8143a0
  80add3:	e8 a4 77 ff ff       	call   80257c <reg_device>
    reg_device(&dev_stdout);
  80add8:	bf 60 44 81 00       	mov    edi,0x814460
  80addd:	e8 9a 77 ff ff       	call   80257c <reg_device>
    unsigned char *vp=0x20000;
  80ade2:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80ade9:	00 
    if(*vp==0x7)
  80adea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80adf1:	3c 07                	cmp    al,0x7
  80adf3:	75 36                	jne    80ae2b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80adf5:	c7 05 35 f7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f735],0x0        # 42a534 <video_mode>
  80adfc:	00 00 00 
        video_base=0xb0000;
  80adff:	48 c7 05 0e f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f70e],0xb0000        # 42a518 <video_base>
  80ae06:	00 00 0b 00 
        video_end=0xb8000-1;
  80ae0a:	48 c7 05 0b f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f70b],0xb7fff        # 42a520 <video_end>
  80ae11:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80ae15:	c7 05 21 f7 c1 ff b4 	mov    DWORD PTR [rip+0xffffffffffc1f721],0x3b4        # 42a540 <port_reg_index>
  80ae1c:	03 00 00 
        port_reg_v=0x3b5;
  80ae1f:	c7 05 1b f7 c1 ff b5 	mov    DWORD PTR [rip+0xffffffffffc1f71b],0x3b5        # 42a544 <port_reg_v>
  80ae26:	03 00 00 
  80ae29:	eb 61                	jmp    80ae8c <init_tty+0xf2>
    }else if(*vp<=0x3)
  80ae2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae32:	3c 03                	cmp    al,0x3
  80ae34:	77 36                	ja     80ae6c <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80ae36:	c7 05 f4 f6 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc1f6f4],0x1        # 42a534 <video_mode>
  80ae3d:	00 00 00 
        video_base=0xb8000;
  80ae40:	48 c7 05 cd f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6cd],0xb8000        # 42a518 <video_base>
  80ae47:	00 80 0b 00 
        video_end=0xc0000-1;
  80ae4b:	48 c7 05 ca f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6ca],0xbffff        # 42a520 <video_end>
  80ae52:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80ae56:	c7 05 e0 f6 c1 ff d4 	mov    DWORD PTR [rip+0xffffffffffc1f6e0],0x3d4        # 42a540 <port_reg_index>
  80ae5d:	03 00 00 
        port_reg_v=0x3d5;
  80ae60:	c7 05 da f6 c1 ff d5 	mov    DWORD PTR [rip+0xffffffffffc1f6da],0x3d5        # 42a544 <port_reg_v>
  80ae67:	03 00 00 
  80ae6a:	eb 20                	jmp    80ae8c <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80ae6c:	c7 05 be f6 c1 ff 02 	mov    DWORD PTR [rip+0xffffffffffc1f6be],0x2        # 42a534 <video_mode>
  80ae73:	00 00 00 
        video_base=0xa0000;
  80ae76:	48 c7 05 97 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f697],0xa0000        # 42a518 <video_base>
  80ae7d:	00 00 0a 00 
        video_end=0xb0000-1;
  80ae81:	48 c7 05 94 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f694],0xaffff        # 42a520 <video_end>
  80ae88:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80ae8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae93:	3c 01                	cmp    al,0x1
  80ae95:	77 0f                	ja     80aea6 <init_tty+0x10c>
  80ae97:	c7 05 9b f6 c1 ff 28 	mov    DWORD PTR [rip+0xffffffffffc1f69b],0x28        # 42a53c <line_chs>
  80ae9e:	00 00 00 
  80aea1:	e9 91 00 00 00       	jmp    80af37 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80aea6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aeaa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aead:	3c 03                	cmp    al,0x3
  80aeaf:	76 0b                	jbe    80aebc <init_tty+0x122>
  80aeb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aeb5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aeb8:	3c 07                	cmp    al,0x7
  80aeba:	75 0c                	jne    80aec8 <init_tty+0x12e>
  80aebc:	c7 05 76 f6 c1 ff 50 	mov    DWORD PTR [rip+0xffffffffffc1f676],0x50        # 42a53c <line_chs>
  80aec3:	00 00 00 
  80aec6:	eb 6f                	jmp    80af37 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80aec8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aecc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aecf:	3c 05                	cmp    al,0x5
  80aed1:	76 16                	jbe    80aee9 <init_tty+0x14f>
  80aed3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aed7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aeda:	3c 09                	cmp    al,0x9
  80aedc:	74 0b                	je     80aee9 <init_tty+0x14f>
  80aede:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aee2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aee5:	3c 0d                	cmp    al,0xd
  80aee7:	75 0c                	jne    80aef5 <init_tty+0x15b>
  80aee9:	c7 05 49 f6 c1 ff 40 	mov    DWORD PTR [rip+0xffffffffffc1f649],0x140        # 42a53c <line_chs>
  80aef0:	01 00 00 
  80aef3:	eb 42                	jmp    80af37 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80aef5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aef9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aefc:	3c 06                	cmp    al,0x6
  80aefe:	74 16                	je     80af16 <init_tty+0x17c>
  80af00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af04:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af07:	3c 0a                	cmp    al,0xa
  80af09:	74 0b                	je     80af16 <init_tty+0x17c>
  80af0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af12:	3c 0d                	cmp    al,0xd
  80af14:	76 0c                	jbe    80af22 <init_tty+0x188>
  80af16:	c7 05 1c f6 c1 ff 80 	mov    DWORD PTR [rip+0xffffffffffc1f61c],0x280        # 42a53c <line_chs>
  80af1d:	02 00 00 
  80af20:	eb 15                	jmp    80af37 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80af22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af29:	3c 08                	cmp    al,0x8
  80af2b:	75 0a                	jne    80af37 <init_tty+0x19d>
  80af2d:	c7 05 05 f6 c1 ff a0 	mov    DWORD PTR [rip+0xffffffffffc1f605],0xa0        # 42a53c <line_chs>
  80af34:	00 00 00 
    switch (*vp)
  80af37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af3e:	0f b6 c0             	movzx  eax,al
  80af41:	83 f8 14             	cmp    eax,0x14
  80af44:	77 61                	ja     80afa7 <init_tty+0x20d>
  80af46:	89 c0                	mov    eax,eax
  80af48:	48 8b 04 c5 18 45 81 	mov    rax,QWORD PTR [rax*8+0x814518]
  80af4f:	00 
  80af50:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80af53:	c7 05 eb f5 c1 ff e8 	mov    DWORD PTR [rip+0xffffffffffc1f5eb],0x3e8        # 42a548 <vpage_size>
  80af5a:	03 00 00 
  80af5d:	eb 49                	jmp    80afa8 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80af5f:	c7 05 df f5 c1 ff d0 	mov    DWORD PTR [rip+0xffffffffffc1f5df],0x7d0        # 42a548 <vpage_size>
  80af66:	07 00 00 
  80af69:	eb 3d                	jmp    80afa8 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80af6b:	c7 05 d3 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5d3],0xfa00        # 42a548 <vpage_size>
  80af72:	fa 00 00 
  80af75:	eb 31                	jmp    80afa8 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80af77:	c7 05 c7 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5c7],0x1f400        # 42a548 <vpage_size>
  80af7e:	f4 01 00 
  80af81:	eb 25                	jmp    80afa8 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80af83:	c7 05 bb f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5bb],0x7d00        # 42a548 <vpage_size>
  80af8a:	7d 00 00 
  80af8d:	eb 19                	jmp    80afa8 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80af8f:	c7 05 af f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5af],0x36b00        # 42a548 <vpage_size>
  80af96:	6b 03 00 
  80af99:	eb 0d                	jmp    80afa8 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80af9b:	c7 05 a3 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5a3],0x4b000        # 42a548 <vpage_size>
  80afa2:	b0 04 00 
  80afa5:	eb 01                	jmp    80afa8 <init_tty+0x20e>
    default:
        break;
  80afa7:	90                   	nop
    }
    m_ptr=video_base;
  80afa8:	48 8b 05 69 f5 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f569]        # 42a518 <video_base>
  80afaf:	48 89 05 6a 13 00 00 	mov    QWORD PTR [rip+0x136a],rax        # 80c320 <m_ptr>
    page_boffset=0;
  80afb6:	c7 05 70 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f570],0x0        # 42a530 <page_boffset>
  80afbd:	00 00 00 
    vpage_base=video_base;
  80afc0:	48 8b 05 51 f5 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f551]        # 42a518 <video_base>
  80afc7:	48 89 05 5a f5 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f55a],rax        # 42a528 <vpage_base>
    vp++;
  80afce:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80afd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afd7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80afda:	0f b6 c0             	movzx  eax,al
  80afdd:	89 05 55 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f555],eax        # 42a538 <vpage>
    vp++;
  80afe3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80afe8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afec:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80aff0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80aff4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aff7:	0f b6 c0             	movzx  eax,al
  80affa:	89 05 54 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f554],eax        # 42a554 <stline>
    endline=*vp++;
  80b000:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b004:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b008:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b00c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b00f:	0f b6 c0             	movzx  eax,al
  80b012:	89 05 40 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f540],eax        # 42a558 <endline>
    videoy=*vp++;
  80b018:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b01c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b020:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b024:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b027:	0f b6 c0             	movzx  eax,al
  80b02a:	89 05 20 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f520],eax        # 42a550 <videoy>
    videox=*vp;
  80b030:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b034:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b037:	0f b6 c0             	movzx  eax,al
  80b03a:	89 05 0c f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f50c],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80b040:	90                   	nop
  80b041:	c9                   	leave  
  80b042:	c3                   	ret    

000000000080b043 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80b043:	f3 0f 1e fa          	endbr64 
  80b047:	55                   	push   rbp
  80b048:	48 89 e5             	mov    rbp,rsp
  80b04b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80b04f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b053:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80b056:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80b059:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b05c:	05 00 c0 05 00       	add    eax,0x5c000
  80b061:	01 c0                	add    eax,eax
  80b063:	48 98                	cdqe   
  80b065:	48 89 05 b4 12 00 00 	mov    QWORD PTR [rip+0x12b4],rax        # 80c320 <m_ptr>
}
  80b06c:	90                   	nop
  80b06d:	5d                   	pop    rbp
  80b06e:	c3                   	ret    

000000000080b06f <tell_monitor>:
int tell_monitor()
{
  80b06f:	f3 0f 1e fa          	endbr64 
  80b073:	55                   	push   rbp
  80b074:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80b077:	48 8b 05 a2 12 00 00 	mov    rax,QWORD PTR [rip+0x12a2]        # 80c320 <m_ptr>
  80b07e:	48 8b 15 93 f4 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f493]        # 42a518 <video_base>
  80b085:	48 29 d0             	sub    rax,rdx
  80b088:	48 89 c2             	mov    rdx,rax
  80b08b:	48 c1 ea 3f          	shr    rdx,0x3f
  80b08f:	48 01 d0             	add    rax,rdx
  80b092:	48 d1 f8             	sar    rax,1
}
  80b095:	5d                   	pop    rbp
  80b096:	c3                   	ret    

000000000080b097 <del_ch>:
void del_ch()
{
  80b097:	f3 0f 1e fa          	endbr64 
  80b09b:	55                   	push   rbp
  80b09c:	48 89 e5             	mov    rbp,rsp
  80b09f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80b0a6:	48 8b 05 73 12 00 00 	mov    rax,QWORD PTR [rip+0x1273]        # 80c320 <m_ptr>
  80b0ad:	48 83 e8 02          	sub    rax,0x2
  80b0b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80b0b5:	b8 00 00 00 00       	mov    eax,0x0
  80b0ba:	e8 b0 ff ff ff       	call   80b06f <tell_monitor>
  80b0bf:	89 c2                	mov    edx,eax
  80b0c1:	48 63 c2             	movsxd rax,edx
  80b0c4:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80b0cb:	48 c1 e8 20          	shr    rax,0x20
  80b0cf:	c1 f8 05             	sar    eax,0x5
  80b0d2:	89 d1                	mov    ecx,edx
  80b0d4:	c1 f9 1f             	sar    ecx,0x1f
  80b0d7:	29 c8                	sub    eax,ecx
  80b0d9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80b0dc:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80b0df:	89 c8                	mov    eax,ecx
  80b0e1:	c1 e0 02             	shl    eax,0x2
  80b0e4:	01 c8                	add    eax,ecx
  80b0e6:	c1 e0 04             	shl    eax,0x4
  80b0e9:	29 c2                	sub    edx,eax
  80b0eb:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80b0ee:	eb 17                	jmp    80b107 <del_ch+0x70>
    {
        *p=*(p+2);
  80b0f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0f4:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80b0f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0fc:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80b0fe:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80b103:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b107:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80b10b:	7e e3                	jle    80b0f0 <del_ch+0x59>
    }
    driver_args args= {
  80b10d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80b114:	b8 00 00 00 00       	mov    eax,0x0
  80b119:	b9 18 00 00 00       	mov    ecx,0x18
  80b11e:	48 89 d7             	mov    rdi,rdx
  80b121:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80b124:	b8 00 00 00 00       	mov    eax,0x0
  80b129:	e8 41 ff ff ff       	call   80b06f <tell_monitor>
  80b12e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80b131:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80b137:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80b13e:	48 89 c7             	mov    rdi,rax
  80b141:	e8 fd fe ff ff       	call   80b043 <seek_tty>
    set_cur();
  80b146:	b8 00 00 00 00       	mov    eax,0x0
  80b14b:	e8 03 00 00 00       	call   80b153 <set_cur>
}
  80b150:	90                   	nop
  80b151:	c9                   	leave  
  80b152:	c3                   	ret    

000000000080b153 <set_cur>:
void set_cur()
{
  80b153:	f3 0f 1e fa          	endbr64 
  80b157:	55                   	push   rbp
  80b158:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b15b:	fa                   	cli    
    outb(port_reg_index,14);
  80b15c:	8b 05 de f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3de]        # 42a540 <port_reg_index>
  80b162:	0f b7 c0             	movzx  eax,ax
  80b165:	be 0e 00 00 00       	mov    esi,0xe
  80b16a:	89 c7                	mov    edi,eax
  80b16c:	e8 6f a5 ff ff       	call   8056e0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80b171:	48 8b 05 a8 11 00 00 	mov    rax,QWORD PTR [rip+0x11a8]        # 80c320 <m_ptr>
  80b178:	48 8b 15 99 f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f399]        # 42a518 <video_base>
  80b17f:	48 29 d0             	sub    rax,rdx
  80b182:	48 c1 f8 09          	sar    rax,0x9
  80b186:	0f b6 d0             	movzx  edx,al
  80b189:	8b 05 b5 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3b5]        # 42a544 <port_reg_v>
  80b18f:	0f b7 c0             	movzx  eax,ax
  80b192:	89 d6                	mov    esi,edx
  80b194:	89 c7                	mov    edi,eax
  80b196:	e8 45 a5 ff ff       	call   8056e0 <outb>
    outb(port_reg_index,15);
  80b19b:	8b 05 9f f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f39f]        # 42a540 <port_reg_index>
  80b1a1:	0f b7 c0             	movzx  eax,ax
  80b1a4:	be 0f 00 00 00       	mov    esi,0xf
  80b1a9:	89 c7                	mov    edi,eax
  80b1ab:	e8 30 a5 ff ff       	call   8056e0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80b1b0:	48 8b 05 69 11 00 00 	mov    rax,QWORD PTR [rip+0x1169]        # 80c320 <m_ptr>
  80b1b7:	48 8b 15 5a f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f35a]        # 42a518 <video_base>
  80b1be:	48 29 d0             	sub    rax,rdx
  80b1c1:	48 d1 f8             	sar    rax,1
  80b1c4:	0f b6 d0             	movzx  edx,al
  80b1c7:	8b 05 77 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f377]        # 42a544 <port_reg_v>
  80b1cd:	0f b7 c0             	movzx  eax,ax
  80b1d0:	89 d6                	mov    esi,edx
  80b1d2:	89 c7                	mov    edi,eax
  80b1d4:	e8 07 a5 ff ff       	call   8056e0 <outb>
    asm volatile("sti");
  80b1d9:	fb                   	sti    
}
  80b1da:	90                   	nop
  80b1db:	5d                   	pop    rbp
  80b1dc:	c3                   	ret    

000000000080b1dd <read_tty>:

int read_tty(driver_args *args)
{
  80b1dd:	f3 0f 1e fa          	endbr64 
  80b1e1:	55                   	push   rbp
  80b1e2:	48 89 e5             	mov    rbp,rsp
  80b1e5:	48 83 ec 20          	sub    rsp,0x20
  80b1e9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80b1ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b1f1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80b1f4:	48 98                	cdqe   
  80b1f6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b1fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b1fe:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b201:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b204:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b20b:	eb 4a                	jmp    80b257 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80b20d:	48 8b 15 0c 11 00 00 	mov    rdx,QWORD PTR [rip+0x110c]        # 80c320 <m_ptr>
  80b214:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b218:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b21c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b220:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b223:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80b225:	48 8b 05 f4 10 00 00 	mov    rax,QWORD PTR [rip+0x10f4]        # 80c320 <m_ptr>
  80b22c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80b232:	75 0d                	jne    80b241 <read_tty+0x64>
  80b234:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b238:	7e 07                	jle    80b241 <read_tty+0x64>
        {
            return 1;//读到尾了
  80b23a:	b8 01 00 00 00       	mov    eax,0x1
  80b23f:	eb 2d                	jmp    80b26e <read_tty+0x91>
        }
        m_ptr+=2;
  80b241:	48 8b 05 d8 10 00 00 	mov    rax,QWORD PTR [rip+0x10d8]        # 80c320 <m_ptr>
  80b248:	48 83 c0 02          	add    rax,0x2
  80b24c:	48 89 05 cd 10 00 00 	mov    QWORD PTR [rip+0x10cd],rax        # 80c320 <m_ptr>
    for(int i=0;i<len;i++)
  80b253:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b257:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b25a:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b25d:	7c ae                	jl     80b20d <read_tty+0x30>
    }
    set_cur();
  80b25f:	b8 00 00 00 00       	mov    eax,0x0
  80b264:	e8 ea fe ff ff       	call   80b153 <set_cur>
    return 0;
  80b269:	b8 00 00 00 00       	mov    eax,0x0
}
  80b26e:	c9                   	leave  
  80b26f:	c3                   	ret    

000000000080b270 <write_tty>:
int write_tty(driver_args *args)
{
  80b270:	f3 0f 1e fa          	endbr64 
  80b274:	55                   	push   rbp
  80b275:	48 89 e5             	mov    rbp,rsp
  80b278:	48 83 ec 30          	sub    rsp,0x30
  80b27c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80b280:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b284:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b287:	48 98                	cdqe   
  80b289:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b28d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b291:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b294:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b297:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b29e:	e9 0b 01 00 00       	jmp    80b3ae <write_tty+0x13e>
    {
        if(*src=='\n')
  80b2a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2aa:	3c 0a                	cmp    al,0xa
  80b2ac:	75 50                	jne    80b2fe <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80b2ae:	48 8b 05 6b 10 00 00 	mov    rax,QWORD PTR [rip+0x106b]        # 80c320 <m_ptr>
  80b2b5:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80b2bb:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80b2be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2c1:	89 c2                	mov    edx,eax
  80b2c3:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80b2c8:	48 0f af c2          	imul   rax,rdx
  80b2cc:	48 c1 e8 20          	shr    rax,0x20
  80b2d0:	c1 e8 07             	shr    eax,0x7
  80b2d3:	8d 50 01             	lea    edx,[rax+0x1]
  80b2d6:	89 d0                	mov    eax,edx
  80b2d8:	c1 e0 02             	shl    eax,0x2
  80b2db:	01 d0                	add    eax,edx
  80b2dd:	c1 e0 05             	shl    eax,0x5
  80b2e0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80b2e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2e6:	05 00 80 0b 00       	add    eax,0xb8000
  80b2eb:	89 c0                	mov    eax,eax
  80b2ed:	48 89 05 2c 10 00 00 	mov    QWORD PTR [rip+0x102c],rax        # 80c320 <m_ptr>
            src++;
  80b2f4:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80b2f9:	e9 ac 00 00 00       	jmp    80b3aa <write_tty+0x13a>
        }else if(*src=='\0')
  80b2fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b302:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b305:	84 c0                	test   al,al
  80b307:	0f 84 af 00 00 00    	je     80b3bc <write_tty+0x14c>
            break;
        if(*src=='\b')
  80b30d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b311:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b314:	3c 08                	cmp    al,0x8
  80b316:	75 1e                	jne    80b336 <write_tty+0xc6>
        {
            m_ptr-=2;
  80b318:	48 8b 05 01 10 00 00 	mov    rax,QWORD PTR [rip+0x1001]        # 80c320 <m_ptr>
  80b31f:	48 83 e8 02          	sub    rax,0x2
  80b323:	48 89 05 f6 0f 00 00 	mov    QWORD PTR [rip+0xff6],rax        # 80c320 <m_ptr>
            *m_ptr=0;
  80b32a:	48 8b 05 ef 0f 00 00 	mov    rax,QWORD PTR [rip+0xfef]        # 80c320 <m_ptr>
  80b331:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80b334:	eb 3e                	jmp    80b374 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80b336:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b33a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b33e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80b342:	48 8b 05 d7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfd7]        # 80c320 <m_ptr>
  80b349:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b34d:	48 89 0d cc 0f 00 00 	mov    QWORD PTR [rip+0xfcc],rcx        # 80c320 <m_ptr>
  80b354:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b357:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80b359:	48 8b 05 c0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc0]        # 80c320 <m_ptr>
  80b360:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b364:	48 89 15 b5 0f 00 00 	mov    QWORD PTR [rip+0xfb5],rdx        # 80c320 <m_ptr>
  80b36b:	0f b6 15 b6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfb6]        # 80c328 <m_color>
  80b372:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80b374:	48 8b 05 a5 0f 00 00 	mov    rax,QWORD PTR [rip+0xfa5]        # 80c320 <m_ptr>
  80b37b:	48 8b 0d a6 f1 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1f1a6]        # 42a528 <vpage_base>
  80b382:	48 29 c8             	sub    rax,rcx
  80b385:	48 89 c2             	mov    rdx,rax
  80b388:	8b 05 ba f1 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f1ba]        # 42a548 <vpage_size>
  80b38e:	8b 0d a8 f1 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f1a8]        # 42a53c <line_chs>
  80b394:	29 c8                	sub    eax,ecx
  80b396:	01 c0                	add    eax,eax
  80b398:	48 98                	cdqe   
  80b39a:	48 39 c2             	cmp    rdx,rax
  80b39d:	7c 0b                	jl     80b3aa <write_tty+0x13a>
  80b39f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b3a3:	7e 05                	jle    80b3aa <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80b3a5:	e8 bc f8 ff ff       	call   80ac66 <scrdown>
    for(int i=0;i<len;i++)
  80b3aa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b3ae:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b3b1:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b3b4:	0f 8c e9 fe ff ff    	jl     80b2a3 <write_tty+0x33>
  80b3ba:	eb 01                	jmp    80b3bd <write_tty+0x14d>
            break;
  80b3bc:	90                   	nop
        }
    }
    set_cur();
  80b3bd:	b8 00 00 00 00       	mov    eax,0x0
  80b3c2:	e8 8c fd ff ff       	call   80b153 <set_cur>
    return 0;
  80b3c7:	b8 00 00 00 00       	mov    eax,0x0
}
  80b3cc:	c9                   	leave  
  80b3cd:	c3                   	ret    

000000000080b3ce <cls>:

void cls(driver_args *args)
{
  80b3ce:	f3 0f 1e fa          	endbr64 
  80b3d2:	55                   	push   rbp
  80b3d3:	48 89 e5             	mov    rbp,rsp
  80b3d6:	48 83 ec 20          	sub    rsp,0x20
  80b3da:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80b3de:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b3e5:	eb 16                	jmp    80b3fd <cls+0x2f>
    {
        vpage_base[i]=0;
  80b3e7:	48 8b 15 3a f1 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f13a]        # 42a528 <vpage_base>
  80b3ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b3f1:	48 98                	cdqe   
  80b3f3:	48 01 d0             	add    rax,rdx
  80b3f6:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80b3f9:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80b3fd:	8b 05 45 f1 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f145]        # 42a548 <vpage_size>
  80b403:	01 c0                	add    eax,eax
  80b405:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80b408:	7c dd                	jl     80b3e7 <cls+0x19>
    }
    m_ptr=vpage_base;
  80b40a:	48 8b 05 17 f1 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f117]        # 42a528 <vpage_base>
  80b411:	48 89 05 08 0f 00 00 	mov    QWORD PTR [rip+0xf08],rax        # 80c320 <m_ptr>
    set_cur();
  80b418:	b8 00 00 00 00       	mov    eax,0x0
  80b41d:	e8 31 fd ff ff       	call   80b153 <set_cur>
}
  80b422:	90                   	nop
  80b423:	c9                   	leave  
  80b424:	c3                   	ret    

000000000080b425 <set_color>:

void set_color(char color)
{
  80b425:	f3 0f 1e fa          	endbr64 
  80b429:	55                   	push   rbp
  80b42a:	48 89 e5             	mov    rbp,rsp
  80b42d:	89 f8                	mov    eax,edi
  80b42f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80b432:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80b436:	88 05 ec 0e 00 00    	mov    BYTE PTR [rip+0xeec],al        # 80c328 <m_color>
}
  80b43c:	90                   	nop
  80b43d:	5d                   	pop    rbp
  80b43e:	c3                   	ret    

000000000080b43f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80b43f:	f3 0f 1e fa          	endbr64 
  80b443:	55                   	push   rbp
  80b444:	48 89 e5             	mov    rbp,rsp
  80b447:	48 83 ec 10          	sub    rsp,0x10
  80b44b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80b44f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b453:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80b459:	83 f8 0d             	cmp    eax,0xd
  80b45c:	74 45                	je     80b4a3 <tty_do_req+0x64>
  80b45e:	83 f8 0d             	cmp    eax,0xd
  80b461:	7f 53                	jg     80b4b6 <tty_do_req+0x77>
  80b463:	83 f8 0c             	cmp    eax,0xc
  80b466:	74 2d                	je     80b495 <tty_do_req+0x56>
  80b468:	83 f8 0c             	cmp    eax,0xc
  80b46b:	7f 49                	jg     80b4b6 <tty_do_req+0x77>
  80b46d:	83 f8 02             	cmp    eax,0x2
  80b470:	74 07                	je     80b479 <tty_do_req+0x3a>
  80b472:	83 f8 03             	cmp    eax,0x3
  80b475:	74 10                	je     80b487 <tty_do_req+0x48>
  80b477:	eb 3d                	jmp    80b4b6 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80b479:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b47d:	48 89 c7             	mov    rdi,rax
  80b480:	e8 58 fd ff ff       	call   80b1dd <read_tty>
        break;
  80b485:	eb 36                	jmp    80b4bd <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80b487:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b48b:	48 89 c7             	mov    rdi,rax
  80b48e:	e8 dd fd ff ff       	call   80b270 <write_tty>
        break;
  80b493:	eb 28                	jmp    80b4bd <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80b495:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b499:	48 89 c7             	mov    rdi,rax
  80b49c:	e8 a2 fb ff ff       	call   80b043 <seek_tty>
        break;
  80b4a1:	eb 1a                	jmp    80b4bd <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80b4a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b4a7:	48 89 c7             	mov    rdi,rax
  80b4aa:	b8 00 00 00 00       	mov    eax,0x0
  80b4af:	e8 bb fb ff ff       	call   80b06f <tell_monitor>
        break;
  80b4b4:	eb 07                	jmp    80b4bd <tty_do_req+0x7e>
    default:return -1;
  80b4b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b4bb:	eb 05                	jmp    80b4c2 <tty_do_req+0x83>
    }
    return 0;
  80b4bd:	b8 00 00 00 00       	mov    eax,0x0
}
  80b4c2:	c9                   	leave  
  80b4c3:	c3                   	ret    

000000000080b4c4 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b4c4:	f3 0f 1e fa          	endbr64 
  80b4c8:	55                   	push   rbp
  80b4c9:	48 89 e5             	mov    rbp,rsp
  80b4cc:	48 83 ec 10          	sub    rsp,0x10
  80b4d0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b4d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4d6:	83 c0 01             	add    eax,0x1
  80b4d9:	0f b7 c0             	movzx  eax,ax
  80b4dc:	be 00 00 00 00       	mov    esi,0x0
  80b4e1:	89 c7                	mov    edi,eax
  80b4e3:	e8 f8 a1 ff ff       	call   8056e0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b4e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4eb:	83 c0 03             	add    eax,0x3
  80b4ee:	0f b7 c0             	movzx  eax,ax
  80b4f1:	be 80 00 00 00       	mov    esi,0x80
  80b4f6:	89 c7                	mov    edi,eax
  80b4f8:	e8 e3 a1 ff ff       	call   8056e0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b4fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b500:	0f b7 c0             	movzx  eax,ax
  80b503:	be 03 00 00 00       	mov    esi,0x3
  80b508:	89 c7                	mov    edi,eax
  80b50a:	e8 d1 a1 ff ff       	call   8056e0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b50f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b512:	83 c0 01             	add    eax,0x1
  80b515:	0f b7 c0             	movzx  eax,ax
  80b518:	be 00 00 00 00       	mov    esi,0x0
  80b51d:	89 c7                	mov    edi,eax
  80b51f:	e8 bc a1 ff ff       	call   8056e0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b524:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b527:	83 c0 03             	add    eax,0x3
  80b52a:	0f b7 c0             	movzx  eax,ax
  80b52d:	be 03 00 00 00       	mov    esi,0x3
  80b532:	89 c7                	mov    edi,eax
  80b534:	e8 a7 a1 ff ff       	call   8056e0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80b539:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b53c:	83 c0 02             	add    eax,0x2
  80b53f:	0f b7 c0             	movzx  eax,ax
  80b542:	be c7 00 00 00       	mov    esi,0xc7
  80b547:	89 c7                	mov    edi,eax
  80b549:	e8 92 a1 ff ff       	call   8056e0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b54e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b551:	83 c0 04             	add    eax,0x4
  80b554:	0f b7 c0             	movzx  eax,ax
  80b557:	be 0b 00 00 00       	mov    esi,0xb
  80b55c:	89 c7                	mov    edi,eax
  80b55e:	e8 7d a1 ff ff       	call   8056e0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80b563:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b566:	83 c0 04             	add    eax,0x4
  80b569:	0f b7 c0             	movzx  eax,ax
  80b56c:	be 1e 00 00 00       	mov    esi,0x1e
  80b571:	89 c7                	mov    edi,eax
  80b573:	e8 68 a1 ff ff       	call   8056e0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80b578:	b8 61 00 00 00       	mov    eax,0x61
  80b57d:	0f b6 d0             	movzx  edx,al
  80b580:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b583:	0f b7 c0             	movzx  eax,ax
  80b586:	89 d6                	mov    esi,edx
  80b588:	89 c7                	mov    edi,eax
  80b58a:	e8 51 a1 ff ff       	call   8056e0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80b58f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b592:	0f b6 c0             	movzx  eax,al
  80b595:	89 c7                	mov    edi,eax
  80b597:	e8 5d a1 ff ff       	call   8056f9 <inb>
  80b59c:	0f b6 d0             	movzx  edx,al
  80b59f:	b8 61 00 00 00       	mov    eax,0x61
  80b5a4:	0f be c0             	movsx  eax,al
  80b5a7:	39 c2                	cmp    edx,eax
  80b5a9:	75 17                	jne    80b5c2 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b5ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5ae:	83 c0 04             	add    eax,0x4
  80b5b1:	0f b7 c0             	movzx  eax,ax
  80b5b4:	be 0f 00 00 00       	mov    esi,0xf
  80b5b9:	89 c7                	mov    edi,eax
  80b5bb:	e8 20 a1 ff ff       	call   8056e0 <outb>
  80b5c0:	eb 01                	jmp    80b5c3 <init_com+0xff>
        return;
  80b5c2:	90                   	nop
}
  80b5c3:	c9                   	leave  
  80b5c4:	c3                   	ret    

000000000080b5c5 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80b5c5:	f3 0f 1e fa          	endbr64 
  80b5c9:	55                   	push   rbp
  80b5ca:	48 89 e5             	mov    rbp,rsp
  80b5cd:	48 83 ec 20          	sub    rsp,0x20
  80b5d1:	89 f8                	mov    eax,edi
  80b5d3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80b5d6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80b5da:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b5dd:	83 c0 05             	add    eax,0x5
  80b5e0:	0f b6 c0             	movzx  eax,al
  80b5e3:	89 c7                	mov    edi,eax
  80b5e5:	e8 0f a1 ff ff       	call   8056f9 <inb>
  80b5ea:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80b5ed:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80b5f1:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80b5f5:	74 e3                	je     80b5da <com_putchar+0x15>
    outb(com_base, ch);
  80b5f7:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80b5fb:	0f b6 d0             	movzx  edx,al
  80b5fe:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b601:	0f b7 c0             	movzx  eax,ax
  80b604:	89 d6                	mov    esi,edx
  80b606:	89 c7                	mov    edi,eax
  80b608:	e8 d3 a0 ff ff       	call   8056e0 <outb>
}
  80b60d:	90                   	nop
  80b60e:	c9                   	leave  
  80b60f:	c3                   	ret    

000000000080b610 <com_puts>:

void com_puts(char* s,int com_port){
  80b610:	f3 0f 1e fa          	endbr64 
  80b614:	55                   	push   rbp
  80b615:	48 89 e5             	mov    rbp,rsp
  80b618:	48 83 ec 10          	sub    rsp,0x10
  80b61c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b620:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80b623:	eb 1d                	jmp    80b642 <com_puts+0x32>
        com_putchar(*s,com_port);
  80b625:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b629:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b62c:	66 98                	cbw    
  80b62e:	0f b7 c0             	movzx  eax,ax
  80b631:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80b634:	89 d6                	mov    esi,edx
  80b636:	89 c7                	mov    edi,eax
  80b638:	e8 88 ff ff ff       	call   80b5c5 <com_putchar>
    for(;*s;s++){
  80b63d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80b642:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b646:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b649:	84 c0                	test   al,al
  80b64b:	75 d8                	jne    80b625 <com_puts+0x15>
    }
  80b64d:	90                   	nop
  80b64e:	90                   	nop
  80b64f:	c9                   	leave  
  80b650:	c3                   	ret    

000000000080b651 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80b651:	f3 0f 1e fa          	endbr64 
  80b655:	55                   	push   rbp
  80b656:	48 89 e5             	mov    rbp,rsp
  80b659:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b65d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b661:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80b664:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b668:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80b66b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b672:	eb 1b                	jmp    80b68f <memcpy+0x3e>
        *(dest)=*(src);
  80b674:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b678:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b67b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b67f:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80b681:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80b686:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80b68b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b68f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b692:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80b695:	77 dd                	ja     80b674 <memcpy+0x23>
    }
}
  80b697:	90                   	nop
  80b698:	90                   	nop
  80b699:	5d                   	pop    rbp
  80b69a:	c3                   	ret    

000000000080b69b <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80b69b:	f3 0f 1e fa          	endbr64 
  80b69f:	55                   	push   rbp
  80b6a0:	48 89 e5             	mov    rbp,rsp
  80b6a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b6a7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b6ab:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80b6ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b6b5:	eb 3a                	jmp    80b6f1 <memcmp+0x56>
    {
        if(*a!=*b)
  80b6b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6bb:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b6be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6c5:	38 c2                	cmp    dl,al
  80b6c7:	74 1a                	je     80b6e3 <memcmp+0x48>
            return *a-*b;
  80b6c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6d0:	0f b6 d0             	movzx  edx,al
  80b6d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6da:	0f b6 c8             	movzx  ecx,al
  80b6dd:	89 d0                	mov    eax,edx
  80b6df:	29 c8                	sub    eax,ecx
  80b6e1:	eb 1b                	jmp    80b6fe <memcmp+0x63>
        a++;
  80b6e3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80b6e8:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80b6ed:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b6f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6f4:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80b6f7:	7c be                	jl     80b6b7 <memcmp+0x1c>
    }
    return 0;
  80b6f9:	b8 00 00 00 00       	mov    eax,0x0
}
  80b6fe:	5d                   	pop    rbp
  80b6ff:	c3                   	ret    

000000000080b700 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80b700:	f3 0f 1e fa          	endbr64 
  80b704:	55                   	push   rbp
  80b705:	48 89 e5             	mov    rbp,rsp
  80b708:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b70c:	89 f0                	mov    eax,esi
  80b70e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80b711:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80b714:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b71b:	eb 16                	jmp    80b733 <memset+0x33>
        *(buf++)=value;
  80b71d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b721:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b725:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b729:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80b72d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80b72f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b733:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b736:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80b739:	72 e2                	jb     80b71d <memset+0x1d>
    }
}
  80b73b:	90                   	nop
  80b73c:	90                   	nop
  80b73d:	5d                   	pop    rbp
  80b73e:	c3                   	ret    

000000000080b73f <get_mem_size>:

u32 get_mem_size(){
  80b73f:	f3 0f 1e fa          	endbr64 
  80b743:	55                   	push   rbp
  80b744:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80b747:	8b 05 0f ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ee0f]        # 42a55c <mem_end>
}
  80b74d:	5d                   	pop    rbp
  80b74e:	c3                   	ret    

000000000080b74f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80b74f:	f3 0f 1e fa          	endbr64 
  80b753:	55                   	push   rbp
  80b754:	48 89 e5             	mov    rbp,rsp
  80b757:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b75b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80b75f:	eb 1d                	jmp    80b77e <strcpy+0x2f>
        *(dest++)=*(buf++);
  80b761:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80b765:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b769:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80b76d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b771:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b775:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b779:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b77c:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80b77e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b782:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b785:	84 c0                	test   al,al
  80b787:	75 d8                	jne    80b761 <strcpy+0x12>
    }
    *dest='\0';
  80b789:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b78d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80b790:	90                   	nop
  80b791:	5d                   	pop    rbp
  80b792:	c3                   	ret    

000000000080b793 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80b793:	f3 0f 1e fa          	endbr64 
  80b797:	55                   	push   rbp
  80b798:	48 89 e5             	mov    rbp,rsp
  80b79b:	48 83 ec 30          	sub    rsp,0x30
  80b79f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b7a3:	89 f0                	mov    eax,esi
  80b7a5:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80b7a8:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80b7ad:	0f 84 9c 00 00 00    	je     80b84f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80b7b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b7b7:	48 89 c6             	mov    rsi,rax
  80b7ba:	bf 80 a5 42 00       	mov    edi,0x42a580
  80b7bf:	e8 8b ff ff ff       	call   80b74f <strcpy>
        char* ptr=strtokkee;
  80b7c4:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80b7cb:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80b7cc:	c7 05 aa ef c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1efaa],0x0        # 42a780 <tokptr>
  80b7d3:	00 00 00 
  80b7d6:	eb 1c                	jmp    80b7f4 <strtok+0x61>
  80b7d8:	8b 05 a2 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1efa2]        # 42a780 <tokptr>
  80b7de:	83 c0 01             	add    eax,0x1
  80b7e1:	99                   	cdq    
  80b7e2:	c1 ea 17             	shr    edx,0x17
  80b7e5:	01 d0                	add    eax,edx
  80b7e7:	25 ff 01 00 00       	and    eax,0x1ff
  80b7ec:	29 d0                	sub    eax,edx
  80b7ee:	89 05 8c ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef8c],eax        # 42a780 <tokptr>
  80b7f4:	8b 05 86 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef86]        # 42a780 <tokptr>
  80b7fa:	48 98                	cdqe   
  80b7fc:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b803:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b806:	74 13                	je     80b81b <strtok+0x88>
  80b808:	8b 05 72 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef72]        # 42a780 <tokptr>
  80b80e:	48 98                	cdqe   
  80b810:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b817:	84 c0                	test   al,al
  80b819:	75 bd                	jne    80b7d8 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80b81b:	8b 05 5f ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef5f]        # 42a780 <tokptr>
  80b821:	48 98                	cdqe   
  80b823:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80b82a:	8b 05 50 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef50]        # 42a780 <tokptr>
  80b830:	83 c0 01             	add    eax,0x1
  80b833:	99                   	cdq    
  80b834:	c1 ea 17             	shr    edx,0x17
  80b837:	01 d0                	add    eax,edx
  80b839:	25 ff 01 00 00       	and    eax,0x1ff
  80b83e:	29 d0                	sub    eax,edx
  80b840:	89 05 3a ef c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ef3a],eax        # 42a780 <tokptr>
        return ptr;
  80b846:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b84a:	e9 9e 00 00 00       	jmp    80b8ed <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80b84f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80b856:	8b 05 24 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef24]        # 42a780 <tokptr>
  80b85c:	48 98                	cdqe   
  80b85e:	48 05 80 a5 42 00    	add    rax,0x42a580
  80b864:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80b868:	eb 20                	jmp    80b88a <strtok+0xf7>
  80b86a:	8b 05 10 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef10]        # 42a780 <tokptr>
  80b870:	83 c0 01             	add    eax,0x1
  80b873:	99                   	cdq    
  80b874:	c1 ea 17             	shr    edx,0x17
  80b877:	01 d0                	add    eax,edx
  80b879:	25 ff 01 00 00       	and    eax,0x1ff
  80b87e:	29 d0                	sub    eax,edx
  80b880:	89 05 fa ee c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eefa],eax        # 42a780 <tokptr>
  80b886:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b88a:	8b 05 f0 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eef0]        # 42a780 <tokptr>
  80b890:	48 98                	cdqe   
  80b892:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b899:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80b89c:	74 13                	je     80b8b1 <strtok+0x11e>
  80b89e:	8b 05 dc ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eedc]        # 42a780 <tokptr>
  80b8a4:	48 98                	cdqe   
  80b8a6:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80b8ad:	84 c0                	test   al,al
  80b8af:	75 b9                	jne    80b86a <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80b8b1:	8b 05 c9 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eec9]        # 42a780 <tokptr>
  80b8b7:	48 98                	cdqe   
  80b8b9:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80b8c0:	8b 05 ba ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eeba]        # 42a780 <tokptr>
  80b8c6:	83 c0 01             	add    eax,0x1
  80b8c9:	99                   	cdq    
  80b8ca:	c1 ea 17             	shr    edx,0x17
  80b8cd:	01 d0                	add    eax,edx
  80b8cf:	25 ff 01 00 00       	and    eax,0x1ff
  80b8d4:	29 d0                	sub    eax,edx
  80b8d6:	89 05 a4 ee c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eea4],eax        # 42a780 <tokptr>
    if(c)
  80b8dc:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80b8e0:	74 06                	je     80b8e8 <strtok+0x155>
        return ptr;
  80b8e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b8e6:	eb 05                	jmp    80b8ed <strtok+0x15a>
    else
        return (void*)0;
  80b8e8:	b8 00 00 00 00       	mov    eax,0x0
}
  80b8ed:	c9                   	leave  
  80b8ee:	c3                   	ret    

000000000080b8ef <strcmp>:
int strcmp(char *s1,char *s2)
{
  80b8ef:	f3 0f 1e fa          	endbr64 
  80b8f3:	55                   	push   rbp
  80b8f4:	48 89 e5             	mov    rbp,rsp
  80b8f7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b8fb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80b8ff:	eb 3c                	jmp    80b93d <strcmp+0x4e>
		if(*s1>*s2)
  80b901:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b905:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b908:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b90c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b90f:	38 c2                	cmp    dl,al
  80b911:	7e 07                	jle    80b91a <strcmp+0x2b>
			return 1;
  80b913:	b8 01 00 00 00       	mov    eax,0x1
  80b918:	eb 52                	jmp    80b96c <strcmp+0x7d>
		else if(*s1<*s2)
  80b91a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b91e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b921:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b925:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b928:	38 c2                	cmp    dl,al
  80b92a:	7d 07                	jge    80b933 <strcmp+0x44>
			return -1;
  80b92c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b931:	eb 39                	jmp    80b96c <strcmp+0x7d>
		s1++;
  80b933:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80b938:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80b93d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b941:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b944:	84 c0                	test   al,al
  80b946:	74 0b                	je     80b953 <strcmp+0x64>
  80b948:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b94c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b94f:	84 c0                	test   al,al
  80b951:	75 ae                	jne    80b901 <strcmp+0x12>
	}
	if(*s1==*s2)
  80b953:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b957:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b95a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b95e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b961:	38 c2                	cmp    dl,al
  80b963:	75 07                	jne    80b96c <strcmp+0x7d>
		return 0;
  80b965:	b8 00 00 00 00       	mov    eax,0x0
  80b96a:	eb 00                	jmp    80b96c <strcmp+0x7d>
}
  80b96c:	5d                   	pop    rbp
  80b96d:	c3                   	ret    

000000000080b96e <strlen>:

int strlen(char *str)
{
  80b96e:	f3 0f 1e fa          	endbr64 
  80b972:	55                   	push   rbp
  80b973:	48 89 e5             	mov    rbp,rsp
  80b976:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80b97a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80b981:	eb 09                	jmp    80b98c <strlen+0x1e>
  80b983:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80b988:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b98c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b990:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b993:	84 c0                	test   al,al
  80b995:	75 ec                	jne    80b983 <strlen+0x15>
    return l;
  80b997:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80b99a:	5d                   	pop    rbp
  80b99b:	c3                   	ret    

000000000080b99c <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80b99c:	f3 0f 1e fa          	endbr64 
  80b9a0:	55                   	push   rbp
  80b9a1:	48 89 e5             	mov    rbp,rsp
  80b9a4:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80b9ab:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80b9b2:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80b9b9:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80b9c0:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80b9c7:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80b9ce:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80b9d5:	84 c0                	test   al,al
  80b9d7:	74 20                	je     80b9f9 <sprintf+0x5d>
  80b9d9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80b9dd:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80b9e1:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80b9e5:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80b9e9:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80b9ed:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80b9f1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80b9f5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80b9f9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ba00:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80ba07:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ba0e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80ba15:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80ba1c:	00 00 00 
    while (*pstr!='\n')
  80ba1f:	eb 39                	jmp    80ba5a <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80ba21:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba2b:	3c 25                	cmp    al,0x25
  80ba2d:	75 15                	jne    80ba44 <sprintf+0xa8>
  80ba2f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80ba36:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba39:	3c 25                	cmp    al,0x25
  80ba3b:	74 07                	je     80ba44 <sprintf+0xa8>
            argnum++;
  80ba3d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80ba44:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba4b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80ba52:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ba59:	01 
    while (*pstr!='\n')
  80ba5a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ba61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba64:	3c 0a                	cmp    al,0xa
  80ba66:	75 b9                	jne    80ba21 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80ba68:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80ba6f:	00 00 00 
  80ba72:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80ba79:	00 00 00 
  80ba7c:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80ba80:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80ba87:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80ba8e:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80ba95:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ba9c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80baa3:	e9 e2 01 00 00       	jmp    80bc8a <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80baa8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80baaf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bab2:	3c 25                	cmp    al,0x25
  80bab4:	0f 85 aa 01 00 00    	jne    80bc64 <sprintf+0x2c8>
  80baba:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bac1:	48 83 c0 01          	add    rax,0x1
  80bac5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bac8:	84 c0                	test   al,al
  80baca:	0f 84 94 01 00 00    	je     80bc64 <sprintf+0x2c8>
            pstr++;
  80bad0:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bad7:	01 
            if(*pstr=='x'){
  80bad8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80badf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bae2:	3c 78                	cmp    al,0x78
  80bae4:	75 64                	jne    80bb4a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bae6:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80baec:	83 f8 2f             	cmp    eax,0x2f
  80baef:	77 23                	ja     80bb14 <sprintf+0x178>
  80baf1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80baf8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bafe:	89 d2                	mov    edx,edx
  80bb00:	48 01 d0             	add    rax,rdx
  80bb03:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb09:	83 c2 08             	add    edx,0x8
  80bb0c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bb12:	eb 12                	jmp    80bb26 <sprintf+0x18a>
  80bb14:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bb1b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bb1f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bb26:	8b 00                	mov    eax,DWORD PTR [rax]
  80bb28:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80bb2e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80bb34:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bb3b:	89 d6                	mov    esi,edx
  80bb3d:	48 89 c7             	mov    rdi,rax
  80bb40:	e8 4e 02 00 00       	call   80bd93 <sprint_hex>
            if(*pstr=='x'){
  80bb45:	e9 38 01 00 00       	jmp    80bc82 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80bb4a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bb51:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb54:	3c 73                	cmp    al,0x73
  80bb56:	75 68                	jne    80bbc0 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80bb58:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bb5e:	83 f8 2f             	cmp    eax,0x2f
  80bb61:	77 23                	ja     80bb86 <sprintf+0x1ea>
  80bb63:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bb6a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb70:	89 d2                	mov    edx,edx
  80bb72:	48 01 d0             	add    rax,rdx
  80bb75:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bb7b:	83 c2 08             	add    edx,0x8
  80bb7e:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bb84:	eb 12                	jmp    80bb98 <sprintf+0x1fc>
  80bb86:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bb8d:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bb91:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bb98:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bb9b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80bba2:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80bba9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bbb0:	48 89 d6             	mov    rsi,rdx
  80bbb3:	48 89 c7             	mov    rdi,rax
  80bbb6:	e8 5a 02 00 00       	call   80be15 <sprintn>
            if(*pstr=='x'){
  80bbbb:	e9 c2 00 00 00       	jmp    80bc82 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80bbc0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bbc7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbca:	3c 64                	cmp    al,0x64
  80bbcc:	75 66                	jne    80bc34 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80bbce:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bbd4:	83 f8 2f             	cmp    eax,0x2f
  80bbd7:	77 23                	ja     80bbfc <sprintf+0x260>
  80bbd9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bbe0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bbe6:	89 d2                	mov    edx,edx
  80bbe8:	48 01 d0             	add    rax,rdx
  80bbeb:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bbf1:	83 c2 08             	add    edx,0x8
  80bbf4:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bbfa:	eb 12                	jmp    80bc0e <sprintf+0x272>
  80bbfc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bc03:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bc07:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bc0e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc11:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80bc18:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80bc1f:	89 c2                	mov    edx,eax
  80bc21:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc28:	89 d6                	mov    esi,edx
  80bc2a:	48 89 c7             	mov    rdi,rax
  80bc2d:	e8 ad 00 00 00       	call   80bcdf <sprint_decimal>
            if(*pstr=='x'){
  80bc32:	eb 4e                	jmp    80bc82 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80bc34:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc3e:	3c 63                	cmp    al,0x63
  80bc40:	75 02                	jne    80bc44 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80bc42:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80bc44:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc4b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc4e:	0f be d0             	movsx  edx,al
  80bc51:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc58:	89 d6                	mov    esi,edx
  80bc5a:	48 89 c7             	mov    rdi,rax
  80bc5d:	e8 3e 00 00 00       	call   80bca0 <sprintchar>
            if(*pstr=='x'){
  80bc62:	eb 1e                	jmp    80bc82 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80bc64:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc6b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc6e:	0f be d0             	movsx  edx,al
  80bc71:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bc78:	89 d6                	mov    esi,edx
  80bc7a:	48 89 c7             	mov    rdi,rax
  80bc7d:	e8 1e 00 00 00       	call   80bca0 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80bc82:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bc89:	01 
  80bc8a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc94:	84 c0                	test   al,al
  80bc96:	0f 85 0c fe ff ff    	jne    80baa8 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80bc9c:	90                   	nop
  80bc9d:	90                   	nop
  80bc9e:	c9                   	leave  
  80bc9f:	c3                   	ret    

000000000080bca0 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80bca0:	f3 0f 1e fa          	endbr64 
  80bca4:	55                   	push   rbp
  80bca5:	48 89 e5             	mov    rbp,rsp
  80bca8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bcac:	89 f0                	mov    eax,esi
  80bcae:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80bcb1:	eb 05                	jmp    80bcb8 <sprintchar+0x18>
        dist++;
  80bcb3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80bcb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcbf:	84 c0                	test   al,al
  80bcc1:	75 f0                	jne    80bcb3 <sprintchar+0x13>
    *dist++=c;
  80bcc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcc7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bccb:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80bccf:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80bcd3:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80bcd5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bcd9:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bcdc:	90                   	nop
  80bcdd:	5d                   	pop    rbp
  80bcde:	c3                   	ret    

000000000080bcdf <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80bcdf:	f3 0f 1e fa          	endbr64 
  80bce3:	55                   	push   rbp
  80bce4:	48 89 e5             	mov    rbp,rsp
  80bce7:	48 83 ec 30          	sub    rsp,0x30
  80bceb:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bcef:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80bcf2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80bcf9:	eb 65                	jmp    80bd60 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80bcfb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80bcfe:	48 63 c2             	movsxd rax,edx
  80bd01:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80bd08:	48 c1 e8 20          	shr    rax,0x20
  80bd0c:	c1 f8 02             	sar    eax,0x2
  80bd0f:	89 d6                	mov    esi,edx
  80bd11:	c1 fe 1f             	sar    esi,0x1f
  80bd14:	29 f0                	sub    eax,esi
  80bd16:	89 c1                	mov    ecx,eax
  80bd18:	89 c8                	mov    eax,ecx
  80bd1a:	c1 e0 02             	shl    eax,0x2
  80bd1d:	01 c8                	add    eax,ecx
  80bd1f:	01 c0                	add    eax,eax
  80bd21:	89 d1                	mov    ecx,edx
  80bd23:	29 c1                	sub    ecx,eax
  80bd25:	89 c8                	mov    eax,ecx
  80bd27:	83 c0 30             	add    eax,0x30
  80bd2a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80bd2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd30:	8d 50 01             	lea    edx,[rax+0x1]
  80bd33:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bd36:	48 98                	cdqe   
  80bd38:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bd3c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80bd40:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80bd43:	48 63 d0             	movsxd rdx,eax
  80bd46:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80bd4d:	48 c1 ea 20          	shr    rdx,0x20
  80bd51:	c1 fa 02             	sar    edx,0x2
  80bd54:	c1 f8 1f             	sar    eax,0x1f
  80bd57:	89 c1                	mov    ecx,eax
  80bd59:	89 d0                	mov    eax,edx
  80bd5b:	29 c8                	sub    eax,ecx
  80bd5d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80bd60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd63:	83 f8 0f             	cmp    eax,0xf
  80bd66:	76 93                	jbe    80bcfb <sprint_decimal+0x1c>
    }
    while(p>0)
  80bd68:	eb 1f                	jmp    80bd89 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80bd6a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bd6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd71:	48 98                	cdqe   
  80bd73:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80bd78:	0f be d0             	movsx  edx,al
  80bd7b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bd7f:	89 d6                	mov    esi,edx
  80bd81:	48 89 c7             	mov    rdi,rax
  80bd84:	e8 17 ff ff ff       	call   80bca0 <sprintchar>
    while(p>0)
  80bd89:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bd8d:	7f db                	jg     80bd6a <sprint_decimal+0x8b>
    }
}
  80bd8f:	90                   	nop
  80bd90:	90                   	nop
  80bd91:	c9                   	leave  
  80bd92:	c3                   	ret    

000000000080bd93 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80bd93:	f3 0f 1e fa          	endbr64 
  80bd97:	55                   	push   rbp
  80bd98:	48 89 e5             	mov    rbp,rsp
  80bd9b:	48 83 ec 20          	sub    rsp,0x20
  80bd9f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bda3:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80bda6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80bdad:	eb 35                	jmp    80bde4 <sprint_hex+0x51>
        unsigned char a=c%16;
  80bdaf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bdb2:	83 e0 0f             	and    eax,0xf
  80bdb5:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80bdb8:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80bdbc:	76 06                	jbe    80bdc4 <sprint_hex+0x31>
  80bdbe:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80bdc2:	eb 04                	jmp    80bdc8 <sprint_hex+0x35>
        else a+='0';
  80bdc4:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80bdc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bdcb:	8d 50 01             	lea    edx,[rax+0x1]
  80bdce:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bdd1:	48 98                	cdqe   
  80bdd3:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bdd7:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80bddb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80bdde:	c1 e8 04             	shr    eax,0x4
  80bde1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80bde4:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80bde8:	7e c5                	jle    80bdaf <sprint_hex+0x1c>
    }
    while(p>0)
  80bdea:	eb 1f                	jmp    80be0b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80bdec:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bdf0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bdf3:	48 98                	cdqe   
  80bdf5:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80bdfa:	0f be d0             	movsx  edx,al
  80bdfd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be01:	89 d6                	mov    esi,edx
  80be03:	48 89 c7             	mov    rdi,rax
  80be06:	e8 95 fe ff ff       	call   80bca0 <sprintchar>
    while(p>0)
  80be0b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80be0f:	7f db                	jg     80bdec <sprint_hex+0x59>
    }
}
  80be11:	90                   	nop
  80be12:	90                   	nop
  80be13:	c9                   	leave  
  80be14:	c3                   	ret    

000000000080be15 <sprintn>:
void sprintn(char *dist,char *str)
{
  80be15:	f3 0f 1e fa          	endbr64 
  80be19:	55                   	push   rbp
  80be1a:	48 89 e5             	mov    rbp,rsp
  80be1d:	48 83 ec 10          	sub    rsp,0x10
  80be21:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80be25:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80be29:	eb 20                	jmp    80be4b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80be2b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80be2f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80be33:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80be37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be3a:	0f be d0             	movsx  edx,al
  80be3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80be41:	89 d6                	mov    esi,edx
  80be43:	48 89 c7             	mov    rdi,rax
  80be46:	e8 55 fe ff ff       	call   80bca0 <sprintchar>
    while(*str!='\0')
  80be4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80be4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be52:	84 c0                	test   al,al
  80be54:	75 d5                	jne    80be2b <sprintn+0x16>
    }
  80be56:	90                   	nop
  80be57:	90                   	nop
  80be58:	c9                   	leave  
  80be59:	c3                   	ret    
  80be5a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080be60 <create_zero>:
  80be60:	e8 19 7a ff ff       	call   80387e <req_proc>
  80be65:	83 f8 ff             	cmp    eax,0xffffffff
  80be68:	74 0c                	je     80be76 <create_zero.retu>
  80be6a:	e8 08 7b ff ff       	call   803977 <set_proc>
  80be6f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80be73:	83 c4 40             	add    esp,0x40

000000000080be76 <create_zero.retu>:
  80be76:	c3                   	ret    

000000000080be77 <fill_desc>:
  80be77:	55                   	push   rbp
  80be78:	48 89 e5             	mov    rbp,rsp
  80be7b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80be7f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80be83:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80be87:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80be8b:	be ca bf 80 00       	mov    esi,0x80bfca
  80be90:	c7 04 25 ca bf 80 00 	mov    DWORD PTR ds:0x80bfca,0x0
  80be97:	00 00 00 00 
  80be9b:	c7 04 25 ce bf 80 00 	mov    DWORD PTR ds:0x80bfce,0x0
  80bea2:	00 00 00 00 
  80bea6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80beaa:	c1 e9 10             	shr    ecx,0x10
  80bead:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80beb2:	c1 ea 10             	shr    edx,0x10
  80beb5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80beb9:	66 c1 ea 08          	shr    dx,0x8
  80bebd:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80bec1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80bec6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80beca:	c1 e1 08             	shl    ecx,0x8
  80becd:	09 cf                	or     edi,ecx
  80becf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80bed3:	8b 14 25 ca bf 80 00 	mov    edx,DWORD PTR ds:0x80bfca
  80beda:	67 89 10             	mov    DWORD PTR [eax],edx
  80bedd:	8b 14 25 ce bf 80 00 	mov    edx,DWORD PTR ds:0x80bfce
  80bee4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80bee8:	c9                   	leave  
  80bee9:	c3                   	ret    

000000000080beea <switch_proc_asm>:
  80beea:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80bef0:	66 89 04 25 08 bf 80 	mov    WORD PTR ds:0x80bf08,ax
  80bef7:	00 
  80bef8:	c7 04 25 04 bf 80 00 	mov    DWORD PTR ds:0x80bf04,0x0
  80beff:	00 00 00 00 

000000000080bf03 <switch_proc_asm.ljmp>:
  80bf03:	ea                   	(bad)  
  80bf04:	00 00                	add    BYTE PTR [rax],al
  80bf06:	00 00                	add    BYTE PTR [rax],al
  80bf08:	00 00                	add    BYTE PTR [rax],al
  80bf0a:	c3                   	ret    

000000000080bf0b <switch_to_old>:
  80bf0b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80bf10:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80bf14:	bf 7c bf 80 00       	mov    edi,0x80bf7c
  80bf19:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80bf1d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80bf21:	89 c1                	mov    ecx,eax
  80bf23:	83 e9 04             	sub    ecx,0x4
  80bf26:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80bf29:	50                   	push   rax
  80bf2a:	89 f5                	mov    ebp,esi
  80bf2c:	83 c5 28             	add    ebp,0x28
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
  80bf5f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf63:	50                   	push   rax
  80bf64:	83 c5 04             	add    ebp,0x4
  80bf67:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80bf6b:	50                   	push   rax
  80bf6c:	83 c5 04             	add    ebp,0x4
  80bf6f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80bf73:	0f 22 d8             	mov    cr3,rax
  80bf76:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80bf7a:	50                   	push   rax
  80bf7b:	5c                   	pop    rsp

000000000080bf7c <switch_to_old.leap>:
  80bf7c:	ea                   	(bad)  
  80bf7d:	00 00                	add    BYTE PTR [rax],al
  80bf7f:	00 00                	add    BYTE PTR [rax],al
  80bf81:	08 00                	or     BYTE PTR [rax],al

000000000080bf83 <save_context>:
  80bf83:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80bf88:	83 c0 44             	add    eax,0x44
  80bf8b:	b9 08 00 00 00       	mov    ecx,0x8
  80bf90:	89 e7                	mov    edi,esp

000000000080bf92 <save_context.loops>:
  80bf92:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80bf95:	67 89 10             	mov    DWORD PTR [eax],edx
  80bf98:	83 c7 04             	add    edi,0x4
  80bf9b:	83 e8 04             	sub    eax,0x4
  80bf9e:	e2 f2                	loop   80bf92 <save_context.loops>
  80bfa0:	5b                   	pop    rbx
  80bfa1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80bfa6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80bfaa:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80bfaf:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80bfb3:	c3                   	ret    

000000000080bfb4 <move_to_user_mode>:
  80bfb4:	66 b8 20 00          	mov    ax,0x20
  80bfb8:	8e d8                	mov    ds,eax
  80bfba:	8e c0                	mov    es,eax
  80bfbc:	8e e8                	mov    gs,eax
  80bfbe:	6a 20                	push   0x20
  80bfc0:	54                   	push   rsp
  80bfc1:	6a 18                	push   0x18
  80bfc3:	68 c9 bf 80 00       	push   0x80bfc9
  80bfc8:	cf                   	iret   

000000000080bfc9 <move_to_user_mode.done>:
  80bfc9:	c3                   	ret    

000000000080bfca <desc>:
	...

000000000080bfd2 <ret_sys_call>:
  80bfd2:	58                   	pop    rax
  80bfd3:	8e d8                	mov    ds,eax
  80bfd5:	58                   	pop    rax
  80bfd6:	8e c0                	mov    es,eax
  80bfd8:	41 5f                	pop    r15
  80bfda:	41 5e                	pop    r14
  80bfdc:	41 5d                	pop    r13
  80bfde:	41 5c                	pop    r12
  80bfe0:	41 5b                	pop    r11
  80bfe2:	41 5a                	pop    r10
  80bfe4:	41 59                	pop    r9
  80bfe6:	41 58                	pop    r8
  80bfe8:	5e                   	pop    rsi
  80bfe9:	5f                   	pop    rdi
  80bfea:	5a                   	pop    rdx
  80bfeb:	59                   	pop    rcx
  80bfec:	5b                   	pop    rbx
  80bfed:	58                   	pop    rax

000000000080bfee <tmp>:
  80bfee:	48 0f 07             	sysretq 

000000000080bff1 <ret_normal_proc>:
  80bff1:	58                   	pop    rax
  80bff2:	8e d8                	mov    ds,eax
  80bff4:	58                   	pop    rax
  80bff5:	8e c0                	mov    es,eax
  80bff7:	41 5f                	pop    r15
  80bff9:	41 5e                	pop    r14
  80bffb:	41 5d                	pop    r13
  80bffd:	41 5c                	pop    r12
  80bfff:	41 5b                	pop    r11
  80c001:	41 5a                	pop    r10
  80c003:	41 59                	pop    r9
  80c005:	41 58                	pop    r8
  80c007:	5e                   	pop    rsi
  80c008:	5f                   	pop    rdi
  80c009:	5a                   	pop    rdx
  80c00a:	59                   	pop    rcx
  80c00b:	5b                   	pop    rbx
  80c00c:	58                   	pop    rax
  80c00d:	c3                   	ret    
