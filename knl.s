
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
  100093:	b8 4e 08 80 00       	mov    eax,0x80084e
  100098:	ea                   	(bad)  
  100099:	4e                   	rex.WRX
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
  800194:	b8 ae 13 80 00       	mov    eax,0x8013ae
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
  800217:	b8 6c 7c 80 00       	mov    eax,0x807c6c
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 a0 5c 80 00       	mov    eax,0x805ca0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 20 8c 80 00       	mov    eax,0x808c20
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 a0 67 80 00       	mov    eax,0x8067a0
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
  800291:	e8 7a 57 00 00       	call   805a10 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 6b 57 00 00       	call   805a10 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 5c 57 00 00       	call   805a10 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 4d 57 00 00       	call   805a10 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 3e 57 00 00       	call   805a10 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 2f 57 00 00       	call   805a10 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 20 57 00 00       	call   805a10 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 11 57 00 00       	call   805a10 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 41 57 00 00       	call   805a4a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 a0 67 80 00       	mov    eax,0x8067a0
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 06 05 00 00       	call   800824 <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 f2 04 00 00       	call   800824 <wrmsr>
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
  800350:	48 8b 15 69 c1 00 00 	mov    rdx,QWORD PTR [rip+0xc169]        # 80c4c0 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 45 c1 00 00 	mov    rcx,QWORD PTR [rip+0xc145]        # 80c4c0 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 25 c1 00 00 	mov    rdx,QWORD PTR [rip+0xc125]        # 80c4c0 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 0d c1 00 00 	mov    rdx,QWORD PTR [rip+0xc10d]        # 80c4c0 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 f0 c0 00 00 	mov    rdx,QWORD PTR [rip+0xc0f0]        # 80c4c0 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 d6 c0 00 00 	mov    rdx,QWORD PTR [rip+0xc0d6]        # 80c4c0 <idt>
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
  80040d:	e8 2c 56 00 00       	call   805a3e <eoi>
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
  800427:	e8 12 56 00 00       	call   805a3e <eoi>
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
  800441:	e8 f8 55 00 00       	call   805a3e <eoi>
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
  80045b:	e8 de 55 00 00       	call   805a3e <eoi>
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
  800475:	e8 c4 55 00 00       	call   805a3e <eoi>
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
  80048f:	e8 aa 55 00 00       	call   805a3e <eoi>
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
  8004a8:	e8 91 55 00 00       	call   805a3e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 b2 55 00 00       	call   805a69 <report_back_trace_of_err>
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
  8004cd:	e8 6c 55 00 00       	call   805a3e <eoi>
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
  8004e7:	e8 52 55 00 00       	call   805a3e <eoi>
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
  800500:	e8 39 55 00 00       	call   805a3e <eoi>
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
  800519:	e8 20 55 00 00       	call   805a3e <eoi>
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
  800533:	e8 06 55 00 00       	call   805a3e <eoi>
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
  80054d:	e8 ec 54 00 00       	call   805a3e <eoi>
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
  800571:	e8 c8 54 00 00       	call   805a3e <eoi>
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
  80058e:	e8 ab 54 00 00       	call   805a3e <eoi>
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
  8005c3:	0f 87 59 02 00 00    	ja     800822 <syscall+0x288>
  8005c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8005cd:	48 c1 e0 03          	shl    rax,0x3
  8005d1:	48 05 00 3c 81 00    	add    rax,0x813c00
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 e2 1f 00 00       	call   8025cc <reg_device>
  8005ea:	e9 33 02 00 00       	jmp    800822 <syscall+0x288>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 32 2a 00 00       	call   80302b <dispose_device>
  8005f9:	e9 24 02 00 00       	jmp    800822 <syscall+0x288>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 a9 22 00 00       	call   8028b4 <reg_driver>
  80060b:	e9 12 02 00 00       	jmp    800822 <syscall+0x288>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 ac 2a 00 00       	call   8030c9 <dispose_driver>
  80061d:	e9 00 02 00 00       	jmp    800822 <syscall+0x288>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 9b 27 00 00       	call   802dd4 <call_drv_func>
  800639:	e9 e4 01 00 00       	jmp    800822 <syscall+0x288>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 20 13 00 00       	call   801970 <req_page_at>
  800650:	e9 cd 01 00 00       	jmp    800822 <syscall+0x288>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 da 10 00 00       	call   80173c <free_page>
  800662:	e9 bb 01 00 00       	jmp    800822 <syscall+0x288>
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
  800682:	e8 e6 3d 00 00       	call   80446d <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 a2 3b 00 00       	call   804238 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 a4 13 00 00       	call   801a49 <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 c8 6b 00 00       	call   807282 <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 d0 6e 00 00       	call   807599 <sys_close>
  8006c9:	e9 54 01 00 00       	jmp    800822 <syscall+0x288>
        case 13:return sys_read(a,b,c);
  8006ce:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006d1:	48 63 d0             	movsxd rdx,eax
  8006d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006d7:	48 98                	cdqe   
  8006d9:	48 89 c1             	mov    rcx,rax
  8006dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006df:	48 89 ce             	mov    rsi,rcx
  8006e2:	89 c7                	mov    edi,eax
  8006e4:	e8 68 6f 00 00       	call   807651 <sys_read>
  8006e9:	e9 34 01 00 00       	jmp    800822 <syscall+0x288>
        case 14:return sys_write(a,b,c);
  8006ee:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006f1:	48 63 d0             	movsxd rdx,eax
  8006f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006f7:	48 98                	cdqe   
  8006f9:	48 89 c1             	mov    rcx,rax
  8006fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006ff:	48 89 ce             	mov    rsi,rcx
  800702:	89 c7                	mov    edi,eax
  800704:	e8 f8 6f 00 00       	call   807701 <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 8d 70 00 00       	call   8077b1 <sys_lseek>
  800724:	e9 f9 00 00 00       	jmp    800822 <syscall+0x288>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 fa 16 00 00       	call   801e2d <sys_tell>
  800733:	e9 ea 00 00 00       	jmp    800822 <syscall+0x288>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 d3 15 00 00       	call   801d22 <reg_vol>
  80074f:	e9 ce 00 00 00       	jmp    800822 <syscall+0x288>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 a3 15 00 00       	call   801d06 <free_vol>
  800763:	e9 ba 00 00 00       	jmp    800822 <syscall+0x288>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 7a 55 00 00       	call   805cf4 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 bc 3c 00 00       	call   804445 <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 50 57 00 00       	call   805eeb <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 fd 13 00 00       	call   801ba7 <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 bc 3e 00 00       	call   804672 <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 57 40 00 00       	call   804819 <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 b3 75 00 00       	call   807d81 <sys_analyse_key>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 24 22 00 00       	call   802a04 <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 46 43 00 00       	call   804b2d <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 f5 55 00 00       	call   805df6 <sys_execve>
  800801:	eb 1f                	jmp    800822 <syscall+0x288>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(a,b,c);
  800803:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800806:	48 98                	cdqe   
  800808:	48 89 c2             	mov    rdx,rax
  80080b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80080e:	48 98                	cdqe   
  800810:	48 89 c1             	mov    rcx,rax
  800813:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800816:	89 c6                	mov    esi,eax
  800818:	48 89 cf             	mov    rdi,rcx
  80081b:	e8 76 22 00 00       	call   802a96 <sys_operate_dev>
  800820:	eb 00                	jmp    800822 <syscall+0x288>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");

}
  800822:	c9                   	leave  
  800823:	c3                   	ret    

0000000000800824 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  800824:	f3 0f 1e fa          	endbr64 
  800828:	55                   	push   rbp
  800829:	48 89 e5             	mov    rbp,rsp
  80082c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800830:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  800834:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800838:	48 c1 e8 20          	shr    rax,0x20
  80083c:	48 89 c2             	mov    rdx,rax
  80083f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800843:	89 c0                	mov    eax,eax
  800845:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  800849:	0f 30                	wrmsr  
  80084b:	90                   	nop
  80084c:	5d                   	pop    rbp
  80084d:	c3                   	ret    

000000000080084e <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  80084e:	f3 0f 1e fa          	endbr64 
  800852:	55                   	push   rbp
  800853:	48 89 e5             	mov    rbp,rsp
  800856:	48 83 ec 60          	sub    rsp,0x60
  80085a:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80085d:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800861:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800868:	00 
    mbi=(struct multiboot_header*)addr;
  800869:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80086d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800871:	b8 00 00 00 00       	mov    eax,0x0
  800876:	e8 43 03 00 00       	call   800bbe <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  80087b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80087f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800882:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  800885:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800889:	48 83 c0 08          	add    rax,0x8
  80088d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  800891:	e9 5b 02 00 00       	jmp    800af1 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800896:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80089a:	8b 00                	mov    eax,DWORD PTR [rax]
  80089c:	83 f8 08             	cmp    eax,0x8
  80089f:	0f 87 39 02 00 00    	ja     800ade <main+0x290>
  8008a5:	89 c0                	mov    eax,eax
  8008a7:	48 8b 04 c5 68 3f 81 	mov    rax,QWORD PTR [rax*8+0x813f68]
  8008ae:	00 
  8008af:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  8008b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008b6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008b9:	89 c7                	mov    edi,eax
  8008bb:	e8 56 09 00 00       	call   801216 <set_high_mem_base>
			break;
  8008c0:	e9 19 02 00 00       	jmp    800ade <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  8008c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008c9:	48 83 c0 10          	add    rax,0x10
  8008cd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8008d1:	eb 37                	jmp    80090a <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  8008d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008d7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8008da:	89 c2                	mov    edx,eax
  8008dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008e0:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8008e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008eb:	48 89 ce             	mov    rsi,rcx
  8008ee:	48 89 c7             	mov    rdi,rax
  8008f1:	e8 37 09 00 00       	call   80122d <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008fa:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008fd:	89 c2                	mov    edx,eax
  8008ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800903:	48 01 d0             	add    rax,rdx
  800906:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  80090a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80090e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800911:	89 c2                	mov    edx,eax
  800913:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800917:	48 01 d0             	add    rax,rdx
  80091a:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80091e:	72 b3                	jb     8008d3 <main+0x85>
            }

		}
		break;
  800920:	e9 b9 01 00 00       	jmp    800ade <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  800925:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800929:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  80092d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  800934:	40 
			set_framebuffer(*tagfb);
  800935:	48 83 ec 08          	sub    rsp,0x8
  800939:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80093d:	ff 70 20             	push   QWORD PTR [rax+0x20]
  800940:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800943:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800946:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800949:	ff 30                	push   QWORD PTR [rax]
  80094b:	e8 5d 60 00 00       	call   8069ad <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 ba 5e 00 00       	call   806818 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  80095e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800962:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800966:	0f b6 c0             	movzx  eax,al
  800969:	83 f8 02             	cmp    eax,0x2
  80096c:	0f 84 5a 01 00 00    	je     800acc <main+0x27e>
  800972:	83 f8 02             	cmp    eax,0x2
  800975:	0f 8f 5a 01 00 00    	jg     800ad5 <main+0x287>
  80097b:	85 c0                	test   eax,eax
  80097d:	74 0e                	je     80098d <main+0x13f>
  80097f:	83 f8 01             	cmp    eax,0x1
  800982:	0f 84 15 01 00 00    	je     800a9d <main+0x24f>
  800988:	e9 48 01 00 00       	jmp    800ad5 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  80098d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800991:	48 83 c0 22          	add    rax,0x22
  800995:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800999:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  8009a0:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009a7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8009ae:	e9 d4 00 00 00       	jmp    800a87 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  8009b3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b6:	48 89 d0             	mov    rax,rdx
  8009b9:	48 01 c0             	add    rax,rax
  8009bc:	48 01 c2             	add    rdx,rax
  8009bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c3:	48 01 d0             	add    rax,rdx
  8009c6:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009ca:	0f b6 c0             	movzx  eax,al
  8009cd:	ba ff 00 00 00       	mov    edx,0xff
  8009d2:	89 d1                	mov    ecx,edx
  8009d4:	29 c1                	sub    ecx,eax
  8009d6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009d9:	48 89 d0             	mov    rax,rdx
  8009dc:	48 01 c0             	add    rax,rax
  8009df:	48 01 c2             	add    rdx,rax
  8009e2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009e6:	48 01 d0             	add    rax,rdx
  8009e9:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009ed:	0f b6 d0             	movzx  edx,al
  8009f0:	b8 ff 00 00 00       	mov    eax,0xff
  8009f5:	29 d0                	sub    eax,edx
  8009f7:	89 ce                	mov    esi,ecx
  8009f9:	0f af f0             	imul   esi,eax
  8009fc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ff:	48 89 d0             	mov    rax,rdx
  800a02:	48 01 c0             	add    rax,rax
  800a05:	48 01 c2             	add    rdx,rax
  800a08:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a0c:	48 01 d0             	add    rax,rdx
  800a0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a12:	0f b6 c8             	movzx  ecx,al
  800a15:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a18:	48 89 d0             	mov    rax,rdx
  800a1b:	48 01 c0             	add    rax,rax
  800a1e:	48 01 c2             	add    rdx,rax
  800a21:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a25:	48 01 d0             	add    rax,rdx
  800a28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a2b:	0f b6 c0             	movzx  eax,al
  800a2e:	0f af c1             	imul   eax,ecx
  800a31:	01 c6                	add    esi,eax
  800a33:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a36:	48 89 d0             	mov    rax,rdx
  800a39:	48 01 c0             	add    rax,rax
  800a3c:	48 01 c2             	add    rdx,rax
  800a3f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a43:	48 01 d0             	add    rax,rdx
  800a46:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a4a:	0f b6 c8             	movzx  ecx,al
  800a4d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a50:	48 89 d0             	mov    rax,rdx
  800a53:	48 01 c0             	add    rax,rax
  800a56:	48 01 c2             	add    rdx,rax
  800a59:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a5d:	48 01 d0             	add    rax,rdx
  800a60:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a64:	0f b6 c0             	movzx  eax,al
  800a67:	0f af c1             	imul   eax,ecx
  800a6a:	01 f0                	add    eax,esi
  800a6c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a6f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a72:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a75:	73 0c                	jae    800a83 <main+0x235>
					{
						color = i;
  800a77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a7a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a7d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a80:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a83:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a87:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a8b:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a8f:	0f b7 c0             	movzx  eax,ax
  800a92:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a95:	0f 82 18 ff ff ff    	jb     8009b3 <main+0x165>
					}
				}
			}
			break;
  800a9b:	eb 40                	jmp    800add <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a9d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800aa1:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800aa5:	0f b6 c0             	movzx  eax,al
  800aa8:	ba 01 00 00 00       	mov    edx,0x1
  800aad:	89 c1                	mov    ecx,eax
  800aaf:	d3 e2                	shl    edx,cl
  800ab1:	89 d0                	mov    eax,edx
  800ab3:	8d 50 ff             	lea    edx,[rax-0x1]
  800ab6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800aba:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800abe:	0f b6 c0             	movzx  eax,al
  800ac1:	89 c1                	mov    ecx,eax
  800ac3:	d3 e2                	shl    edx,cl
  800ac5:	89 d0                	mov    eax,edx
  800ac7:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800aca:	eb 11                	jmp    800add <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800acc:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800ad3:	eb 08                	jmp    800add <main+0x28f>

			default:
				color = 0xffffffff;
  800ad5:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800adc:	90                   	nop
			}

			break;
  800add:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800ade:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ae2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800ae5:	83 c0 07             	add    eax,0x7
  800ae8:	89 c0                	mov    eax,eax
  800aea:	83 e0 f8             	and    eax,0xfffffff8
  800aed:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800af1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800af5:	8b 00                	mov    eax,DWORD PTR [rax]
  800af7:	85 c0                	test   eax,eax
  800af9:	0f 85 97 fd ff ff    	jne    800896 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800aff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b03:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b06:	83 c0 07             	add    eax,0x7
  800b09:	89 c0                	mov    eax,eax
  800b0b:	83 e0 f8             	and    eax,0xfffffff8
  800b0e:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800b12:	b8 75 04 00 00       	mov    eax,0x475
  800b17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800b1a:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800b1d:	b8 00 00 00 00       	mov    eax,0x0
  800b22:	e8 b0 5d 00 00       	call   8068d7 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf 28 3f 81 00       	mov    edi,0x813f28
  800b2c:	e8 3f 62 00 00       	call   806d70 <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf 45 3f 81 00       	mov    edi,0x813f45
  800b40:	e8 2b 62 00 00       	call   806d70 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 b4 09 00 00       	call   801503 <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 1b ae 00 00       	call   80b974 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b59:	be f8 03 00 00       	mov    esi,0x3f8
  800b5e:	bf 52 3f 81 00       	mov    edi,0x813f52
  800b63:	e8 58 af 00 00       	call   80bac0 <com_puts>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 99 06 00 00       	call   80120b <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 11 4f 00 00       	call   805a8d <init_gdt>
    init_drvdev_man();
  800b7c:	b8 00 00 00 00       	mov    eax,0x0
  800b81:	e8 2c 1a 00 00       	call   8025b2 <init_drvdev_man>
    init_proc();
  800b86:	b8 00 00 00 00       	mov    eax,0x0
  800b8b:	e8 0d 29 00 00       	call   80349d <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b90:	b8 00 00 00 00       	mov    eax,0x0
  800b95:	e8 b3 70 00 00       	call   807c4d <init_kb>
//    init_disk();

    sti();
  800b9a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 35 a4 00 00       	call   80afda <DISK1_FAT32_FS_init>

    manage_proc_lock=0;
  800ba5:	c7 05 19 b9 00 00 00 	mov    DWORD PTR [rip+0xb919],0x0        # 80c4c8 <manage_proc_lock>
  800bac:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c= sys_analyse_key();
  800baf:	b8 00 00 00 00       	mov    eax,0x0
  800bb4:	e8 c8 71 00 00       	call   807d81 <sys_analyse_key>
  800bb9:	88 45 da             	mov    BYTE PTR [rbp-0x26],al
    {
  800bbc:	eb f1                	jmp    800baf <main+0x361>

0000000000800bbe <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800bbe:	f3 0f 1e fa          	endbr64 
  800bc2:	55                   	push   rbp
  800bc3:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800bc6:	48 c7 05 2f f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff42f],0xb8000        # 400000 <video>
  800bcd:	00 80 0b 00 
    xpos=0;
  800bd1:	c7 05 2d f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff42d],0x0        # 400008 <xpos>
  800bd8:	00 00 00 
    ypos=0;
  800bdb:	c7 05 27 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff427],0x0        # 40000c <ypos>
  800be2:	00 00 00 
}
  800be5:	90                   	nop
  800be6:	5d                   	pop    rbp
  800be7:	c3                   	ret    

0000000000800be8 <itoa>:

void itoa (char *buf, int base, int d)
{
  800be8:	f3 0f 1e fa          	endbr64 
  800bec:	55                   	push   rbp
  800bed:	48 89 e5             	mov    rbp,rsp
  800bf0:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800bf4:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bf7:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bfa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bfe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c02:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c05:	48 98                	cdqe   
  800c07:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c0b:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c12:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c16:	75 27                	jne    800c3f <itoa+0x57>
  800c18:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c1c:	79 21                	jns    800c3f <itoa+0x57>
    {
        *p++ = '-';
  800c1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c22:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c26:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c2a:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c2d:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c32:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c35:	f7 d8                	neg    eax
  800c37:	48 98                	cdqe   
  800c39:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c3d:	eb 0d                	jmp    800c4c <itoa+0x64>
    }
    else if (base == 'x')
  800c3f:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c43:	75 07                	jne    800c4c <itoa+0x64>
        divisor = 16;
  800c45:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c4c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c4f:	48 63 c8             	movsxd rcx,eax
  800c52:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c56:	ba 00 00 00 00       	mov    edx,0x0
  800c5b:	48 f7 f1             	div    rcx
  800c5e:	48 89 d0             	mov    rax,rdx
  800c61:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c64:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c68:	7f 0a                	jg     800c74 <itoa+0x8c>
  800c6a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c6d:	83 c0 30             	add    eax,0x30
  800c70:	89 c1                	mov    ecx,eax
  800c72:	eb 08                	jmp    800c7c <itoa+0x94>
  800c74:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c77:	83 c0 57             	add    eax,0x57
  800c7a:	89 c1                	mov    ecx,eax
  800c7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c80:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c84:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c88:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c8a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c8d:	48 63 f0             	movsxd rsi,eax
  800c90:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c94:	ba 00 00 00 00       	mov    edx,0x0
  800c99:	48 f7 f6             	div    rsi
  800c9c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800ca0:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800ca5:	75 a5                	jne    800c4c <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800ca7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cab:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800cae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800cb2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800cb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cba:	48 83 e8 01          	sub    rax,0x1
  800cbe:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800cc2:	eb 2b                	jmp    800cef <itoa+0x107>
    {
        char tmp = *p1;
  800cc4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cc8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ccb:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800cce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cd2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800cd5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cd9:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800cdb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cdf:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800ce3:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800ce5:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800cea:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800cef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cf3:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cf7:	72 cb                	jb     800cc4 <itoa+0xdc>
    }
}
  800cf9:	90                   	nop
  800cfa:	90                   	nop
  800cfb:	5d                   	pop    rbp
  800cfc:	c3                   	ret    

0000000000800cfd <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800cfd:	f3 0f 1e fa          	endbr64 
  800d01:	55                   	push   rbp
  800d02:	48 89 e5             	mov    rbp,rsp
  800d05:	48 83 ec 20          	sub    rsp,0x20
  800d09:	89 f8                	mov    eax,edi
  800d0b:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d0e:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d12:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d15:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d19:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d1d:	48 89 c7             	mov    rdi,rax
  800d20:	e8 4b 60 00 00       	call   806d70 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d25:	c9                   	leave  
  800d26:	c3                   	ret    

0000000000800d27 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d27:	f3 0f 1e fa          	endbr64 
  800d2b:	55                   	push   rbp
  800d2c:	48 89 e5             	mov    rbp,rsp
  800d2f:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d36:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d3d:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d44:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d4b:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d52:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d59:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d60:	84 c0                	test   al,al
  800d62:	74 20                	je     800d84 <printf+0x5d>
  800d64:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d68:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d6c:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d70:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d74:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d78:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d7c:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d80:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d84:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d8b:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];

    arg++;
  800d92:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d99:	08 
 
    while ((c = *format++) != 0)
  800d9a:	e9 29 01 00 00       	jmp    800ec8 <printf+0x1a1>
    {
        if (c != '%')
  800d9f:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800da6:	74 13                	je     800dbb <printf+0x94>
            putchar (c);
  800da8:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800daf:	89 c7                	mov    edi,eax
  800db1:	e8 47 ff ff ff       	call   800cfd <putchar>
  800db6:	e9 0d 01 00 00       	jmp    800ec8 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800dbb:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800dc2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dc6:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800dcd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dd0:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800dd6:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800ddd:	83 f8 78             	cmp    eax,0x78
  800de0:	74 26                	je     800e08 <printf+0xe1>
  800de2:	83 f8 78             	cmp    eax,0x78
  800de5:	0f 8f be 00 00 00    	jg     800ea9 <printf+0x182>
  800deb:	83 f8 75             	cmp    eax,0x75
  800dee:	74 18                	je     800e08 <printf+0xe1>
  800df0:	83 f8 75             	cmp    eax,0x75
  800df3:	0f 8f b0 00 00 00    	jg     800ea9 <printf+0x182>
  800df9:	83 f8 64             	cmp    eax,0x64
  800dfc:	74 0a                	je     800e08 <printf+0xe1>
  800dfe:	83 f8 73             	cmp    eax,0x73
  800e01:	74 41                	je     800e44 <printf+0x11d>
  800e03:	e9 a1 00 00 00       	jmp    800ea9 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800e08:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e0f:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e13:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e1a:	8b 10                	mov    edx,DWORD PTR [rax]
  800e1c:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800e23:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e2a:	89 ce                	mov    esi,ecx
  800e2c:	48 89 c7             	mov    rdi,rax
  800e2f:	e8 b4 fd ff ff       	call   800be8 <itoa>
                p = buf;
  800e34:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e3b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e42:	eb 34                	jmp    800e78 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e44:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e4b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e4f:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e56:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e59:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e60:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e67:	00 
  800e68:	75 0d                	jne    800e77 <printf+0x150>
                    p = "(null)";
  800e6a:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813fb0
  800e71:	b0 3f 81 00 
  800e75:	eb 22                	jmp    800e99 <printf+0x172>
 
string:
  800e77:	90                   	nop
                while (*p)
  800e78:	eb 1f                	jmp    800e99 <printf+0x172>
                    putchar (*p++);
  800e7a:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e81:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e85:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e8f:	0f be c0             	movsx  eax,al
  800e92:	89 c7                	mov    edi,eax
  800e94:	e8 64 fe ff ff       	call   800cfd <putchar>
                while (*p)
  800e99:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800ea0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ea3:	84 c0                	test   al,al
  800ea5:	75 d3                	jne    800e7a <printf+0x153>
                break;
  800ea7:	eb 1f                	jmp    800ec8 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800ea9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800eb0:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800eb4:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ebb:	8b 00                	mov    eax,DWORD PTR [rax]
  800ebd:	0f be c0             	movsx  eax,al
  800ec0:	89 c7                	mov    edi,eax
  800ec2:	e8 36 fe ff ff       	call   800cfd <putchar>
                break;
  800ec7:	90                   	nop
    while ((c = *format++) != 0)
  800ec8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ecf:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ed3:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800eda:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800edd:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ee3:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800eea:	0f 85 af fe ff ff    	jne    800d9f <printf+0x78>
            }
        }
    }
}
  800ef0:	90                   	nop
  800ef1:	90                   	nop
  800ef2:	c9                   	leave  
  800ef3:	c3                   	ret    

0000000000800ef4 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ef4:	f3 0f 1e fa          	endbr64 
  800ef8:	55                   	push   rbp
  800ef9:	48 89 e5             	mov    rbp,rsp
  800efc:	48 83 ec 40          	sub    rsp,0x40
  800f00:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800f04:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800f08:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800f0b:	48 8b 15 ce b5 00 00 	mov    rdx,QWORD PTR [rip+0xb5ce]        # 80c4e0 <pml4>
  800f12:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f16:	48 c1 e8 27          	shr    rax,0x27
  800f1a:	48 c1 e0 03          	shl    rax,0x3
  800f1e:	48 01 d0             	add    rax,rdx
  800f21:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f24:	b0 00                	mov    al,0x0
  800f26:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f2a:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f31:	00 00 00 
  800f34:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f38:	48 c1 e8 1e          	shr    rax,0x1e
  800f3c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f3f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f42:	48 98                	cdqe   
  800f44:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f4b:	00 
  800f4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f50:	48 01 d0             	add    rax,rdx
  800f53:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f56:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f5e:	83 e0 01             	and    eax,0x1
  800f61:	48 85 c0             	test   rax,rax
  800f64:	75 45                	jne    800fab <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f66:	b8 00 00 00 00       	mov    eax,0x0
  800f6b:	e8 49 03 00 00       	call   8012b9 <vmalloc>
  800f70:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f78:	ba 00 10 00 00       	mov    edx,0x1000
  800f7d:	be 00 00 00 00       	mov    esi,0x0
  800f82:	48 89 c7             	mov    rdi,rax
  800f85:	e8 26 ac 00 00       	call   80bbb0 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f8a:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f8d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f91:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f94:	48 98                	cdqe   
  800f96:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f9d:	00 
  800f9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800fa2:	48 01 f0             	add    rax,rsi
  800fa5:	48 09 ca             	or     rdx,rcx
  800fa8:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800fab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800faf:	b0 00                	mov    al,0x0
  800fb1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fb5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fb9:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fbe:	48 c1 e8 15          	shr    rax,0x15
  800fc2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fc9:	00 
  800fca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fce:	48 01 d0             	add    rax,rdx
  800fd1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fd4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fd8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fdc:	83 e0 01             	and    eax,0x1
  800fdf:	48 85 c0             	test   rax,rax
  800fe2:	75 4d                	jne    801031 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fe4:	b8 00 00 00 00       	mov    eax,0x0
  800fe9:	e8 cb 02 00 00       	call   8012b9 <vmalloc>
  800fee:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800ff2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ff6:	ba 00 10 00 00       	mov    edx,0x1000
  800ffb:	be 00 00 00 00       	mov    esi,0x0
  801000:	48 89 c7             	mov    rdi,rax
  801003:	e8 a8 ab 00 00       	call   80bbb0 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801008:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80100b:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80100f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801013:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801018:	48 c1 e8 15          	shr    rax,0x15
  80101c:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801023:	00 
  801024:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801028:	48 01 f0             	add    rax,rsi
  80102b:	48 09 ca             	or     rdx,rcx
  80102e:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801031:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801035:	b0 00                	mov    al,0x0
  801037:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80103b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80103e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801042:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801048:	48 c1 ea 0c          	shr    rdx,0xc
  80104c:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801053:	00 
  801054:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801058:	48 01 ca             	add    rdx,rcx
  80105b:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80105f:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801062:	b8 00 00 00 00       	mov    eax,0x0
}
  801067:	c9                   	leave  
  801068:	c3                   	ret    

0000000000801069 <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  801069:	f3 0f 1e fa          	endbr64 
  80106d:	55                   	push   rbp
  80106e:	48 89 e5             	mov    rbp,rsp
  801071:	48 83 ec 40          	sub    rsp,0x40
  801075:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801079:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80107d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  801080:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  801084:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801088:	48 c1 e8 27          	shr    rax,0x27
  80108c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801093:	00 
  801094:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  801098:	48 01 d0             	add    rax,rdx
  80109b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80109e:	b0 00                	mov    al,0x0
  8010a0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  8010a4:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  8010ab:	00 00 00 
  8010ae:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  8010b2:	48 c1 e8 1e          	shr    rax,0x1e
  8010b6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  8010b9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8010bc:	48 98                	cdqe   
  8010be:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010c5:	00 
  8010c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010ca:	48 01 d0             	add    rax,rdx
  8010cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010d0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  8010d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010d8:	83 e0 01             	and    eax,0x1
  8010db:	48 85 c0             	test   rax,rax
  8010de:	75 45                	jne    801125 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  8010e0:	b8 00 00 00 00       	mov    eax,0x0
  8010e5:	e8 cf 01 00 00       	call   8012b9 <vmalloc>
  8010ea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  8010ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010f2:	ba 00 10 00 00       	mov    edx,0x1000
  8010f7:	be 00 00 00 00       	mov    esi,0x0
  8010fc:	48 89 c7             	mov    rdi,rax
  8010ff:	e8 ac aa 00 00       	call   80bbb0 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  801104:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801107:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80110b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80110e:	48 98                	cdqe   
  801110:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801117:	00 
  801118:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80111c:	48 01 f0             	add    rax,rsi
  80111f:	48 09 ca             	or     rdx,rcx
  801122:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  801125:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801129:	b0 00                	mov    al,0x0
  80112b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  80112f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801133:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801138:	48 c1 e8 15          	shr    rax,0x15
  80113c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801143:	00 
  801144:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801148:	48 01 d0             	add    rax,rdx
  80114b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80114e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  801152:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801156:	83 e0 01             	and    eax,0x1
  801159:	48 85 c0             	test   rax,rax
  80115c:	75 4d                	jne    8011ab <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  80115e:	b8 00 00 00 00       	mov    eax,0x0
  801163:	e8 51 01 00 00       	call   8012b9 <vmalloc>
  801168:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  80116c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801170:	ba 00 10 00 00       	mov    edx,0x1000
  801175:	be 00 00 00 00       	mov    esi,0x0
  80117a:	48 89 c7             	mov    rdi,rax
  80117d:	e8 2e aa 00 00       	call   80bbb0 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801182:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801185:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801189:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80118d:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801192:	48 c1 e8 15          	shr    rax,0x15
  801196:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80119d:	00 
  80119e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011a2:	48 01 f0             	add    rax,rsi
  8011a5:	48 09 ca             	or     rdx,rcx
  8011a8:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  8011ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8011af:	b0 00                	mov    al,0x0
  8011b1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  8011b5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8011b8:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8011bc:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  8011c2:	48 c1 ea 0c          	shr    rdx,0xc
  8011c6:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  8011cd:	00 
  8011ce:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8011d2:	48 01 ca             	add    rdx,rcx
  8011d5:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  8011d9:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  8011dc:	b8 00 00 00 00       	mov    eax,0x0
}
  8011e1:	c9                   	leave  
  8011e2:	c3                   	ret    

00000000008011e3 <mdemap>:

stat_t mdemap(addr_t la)
{
  8011e3:	f3 0f 1e fa          	endbr64 
  8011e7:	55                   	push   rbp
  8011e8:	48 89 e5             	mov    rbp,rsp
  8011eb:	48 83 ec 10          	sub    rsp,0x10
  8011ef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  8011f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011f7:	ba 00 00 00 00       	mov    edx,0x0
  8011fc:	48 89 c6             	mov    rsi,rax
  8011ff:	bf 00 00 00 00       	mov    edi,0x0
  801204:	e8 eb fc ff ff       	call   800ef4 <mmap>
}
  801209:	c9                   	leave  
  80120a:	c3                   	ret    

000000000080120b <init_paging>:
int init_paging()
{
  80120b:	f3 0f 1e fa          	endbr64 
  80120f:	55                   	push   rbp
  801210:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801213:	90                   	nop
  801214:	5d                   	pop    rbp
  801215:	c3                   	ret    

0000000000801216 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801216:	f3 0f 1e fa          	endbr64 
  80121a:	55                   	push   rbp
  80121b:	48 89 e5             	mov    rbp,rsp
  80121e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801221:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801224:	89 05 ce b2 00 00    	mov    DWORD PTR [rip+0xb2ce],eax        # 80c4f8 <high_mem_base>
}
  80122a:	90                   	nop
  80122b:	5d                   	pop    rbp
  80122c:	c3                   	ret    

000000000080122d <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80122d:	f3 0f 1e fa          	endbr64 
  801231:	55                   	push   rbp
  801232:	48 89 e5             	mov    rbp,rsp
  801235:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801239:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80123d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801241:	8b 05 d9 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefd9]        # 400220 <mmap_t_i>
  801247:	48 63 d0             	movsxd rdx,eax
  80124a:	48 89 d0             	mov    rax,rdx
  80124d:	48 01 c0             	add    rax,rax
  801250:	48 01 d0             	add    rax,rdx
  801253:	48 c1 e0 03          	shl    rax,0x3
  801257:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80125e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801262:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801265:	8b 05 b5 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefb5]        # 400220 <mmap_t_i>
  80126b:	48 63 d0             	movsxd rdx,eax
  80126e:	48 89 d0             	mov    rax,rdx
  801271:	48 01 c0             	add    rax,rax
  801274:	48 01 d0             	add    rax,rdx
  801277:	48 c1 e0 03          	shl    rax,0x3
  80127b:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801282:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801286:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801289:	8b 05 91 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef91]        # 400220 <mmap_t_i>
  80128f:	8d 50 01             	lea    edx,[rax+0x1]
  801292:	89 15 88 ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfef88],edx        # 400220 <mmap_t_i>
  801298:	48 63 d0             	movsxd rdx,eax
  80129b:	48 89 d0             	mov    rax,rdx
  80129e:	48 01 c0             	add    rax,rax
  8012a1:	48 01 d0             	add    rax,rdx
  8012a4:	48 c1 e0 03          	shl    rax,0x3
  8012a8:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8012af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012b3:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8012b6:	90                   	nop
  8012b7:	5d                   	pop    rbp
  8012b8:	c3                   	ret    

00000000008012b9 <vmalloc>:
addr_t vmalloc()
{
  8012b9:	f3 0f 1e fa          	endbr64 
  8012bd:	55                   	push   rbp
  8012be:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012c1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012c8:	eb 76                	jmp    801340 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8012ca:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012d1:	eb 63                	jmp    801336 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8012d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012d6:	48 98                	cdqe   
  8012d8:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012e2:	be 01 00 00 00       	mov    esi,0x1
  8012e7:	89 c1                	mov    ecx,eax
  8012e9:	d3 e6                	shl    esi,cl
  8012eb:	89 f0                	mov    eax,esi
  8012ed:	21 d0                	and    eax,edx
  8012ef:	85 c0                	test   eax,eax
  8012f1:	75 3f                	jne    801332 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8012f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012f6:	48 98                	cdqe   
  8012f8:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801302:	be 01 00 00 00       	mov    esi,0x1
  801307:	89 c1                	mov    ecx,eax
  801309:	d3 e6                	shl    esi,cl
  80130b:	89 f0                	mov    eax,esi
  80130d:	09 c2                	or     edx,eax
  80130f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801312:	48 98                	cdqe   
  801314:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80131b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80131e:	c1 e0 05             	shl    eax,0x5
  801321:	89 c2                	mov    edx,eax
  801323:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801326:	01 d0                	add    eax,edx
  801328:	83 c0 20             	add    eax,0x20
  80132b:	c1 e0 0c             	shl    eax,0xc
  80132e:	48 98                	cdqe   
  801330:	eb 14                	jmp    801346 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801332:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801336:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80133a:	7e 97                	jle    8012d3 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80133c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801340:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801344:	7e 84                	jle    8012ca <vmalloc+0x11>
            }
        }
    }
}
  801346:	5d                   	pop    rbp
  801347:	c3                   	ret    

0000000000801348 <vmfree>:

int vmfree(addr_t ptr)
{
  801348:	f3 0f 1e fa          	endbr64 
  80134c:	55                   	push   rbp
  80134d:	48 89 e5             	mov    rbp,rsp
  801350:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801354:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801358:	48 c1 e8 0c          	shr    rax,0xc
  80135c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80135f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801362:	8d 50 1f             	lea    edx,[rax+0x1f]
  801365:	85 c0                	test   eax,eax
  801367:	0f 48 c2             	cmovs  eax,edx
  80136a:	c1 f8 05             	sar    eax,0x5
  80136d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801370:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801373:	99                   	cdq    
  801374:	c1 ea 1b             	shr    edx,0x1b
  801377:	01 d0                	add    eax,edx
  801379:	83 e0 1f             	and    eax,0x1f
  80137c:	29 d0                	sub    eax,edx
  80137e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801381:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801384:	48 98                	cdqe   
  801386:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80138d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801390:	be 01 00 00 00       	mov    esi,0x1
  801395:	89 c1                	mov    ecx,eax
  801397:	d3 e6                	shl    esi,cl
  801399:	89 f0                	mov    eax,esi
  80139b:	f7 d0                	not    eax
  80139d:	21 c2                	and    edx,eax
  80139f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013a2:	48 98                	cdqe   
  8013a4:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8013ab:	90                   	nop
  8013ac:	5d                   	pop    rbp
  8013ad:	c3                   	ret    

00000000008013ae <page_err>:
void page_err(){
  8013ae:	f3 0f 1e fa          	endbr64 
  8013b2:	55                   	push   rbp
  8013b3:	48 89 e5             	mov    rbp,rsp
  8013b6:	41 54                	push   r12
  8013b8:	53                   	push   rbx
  8013b9:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  8013bd:	fa                   	cli    
    print("page err\n");
  8013be:	bf b8 3f 81 00       	mov    edi,0x813fb8
  8013c3:	e8 a8 59 00 00       	call   806d70 <print>
    unsigned long err_code=0,l_addr=0;
  8013c8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8013cf:	00 
  8013d0:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8013d7:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8013d8:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8013dc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8013e0:	0f 20 d0             	mov    rax,cr2
  8013e3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8013e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013eb:	83 e0 01             	and    eax,0x1
  8013ee:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8013f1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013f5:	75 41                	jne    801438 <page_err+0x8a>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  8013f7:	48 8b 05 a2 30 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc130a2]        # 4144a0 <current>
  8013fe:	48 8b 98 ac 00 00 00 	mov    rbx,QWORD PTR [rax+0xac]
  801405:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801409:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80140f:	49 89 c4             	mov    r12,rax
  801412:	b8 00 00 00 00       	mov    eax,0x0
  801417:	e8 50 02 00 00       	call   80166c <req_a_page>
  80141c:	89 c7                	mov    edi,eax
  80141e:	e8 38 04 00 00       	call   80185b <get_phyaddr>
  801423:	48 98                	cdqe   
  801425:	48 89 d9             	mov    rcx,rbx
  801428:	ba 07 00 00 00       	mov    edx,0x7
  80142d:	4c 89 e6             	mov    rsi,r12
  801430:	48 89 c7             	mov    rdi,rax
  801433:	e8 31 fc ff ff       	call   801069 <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801438:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80143c:	83 e0 02             	and    eax,0x2
  80143f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801442:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801446:	74 0c                	je     801454 <page_err+0xa6>
  801448:	bf c2 3f 81 00       	mov    edi,0x813fc2
  80144d:	e8 1e 59 00 00       	call   806d70 <print>
  801452:	eb 0a                	jmp    80145e <page_err+0xb0>
    p=err_code&4;
  801454:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801458:	83 e0 04             	and    eax,0x4
  80145b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80145e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801462:	75 0c                	jne    801470 <page_err+0xc2>
  801464:	bf d0 3f 81 00       	mov    edi,0x813fd0
  801469:	e8 02 59 00 00       	call   806d70 <print>
  80146e:	eb 0a                	jmp    80147a <page_err+0xcc>
    p=err_code&16;
  801470:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801474:	83 e0 10             	and    eax,0x10
  801477:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80147a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80147e:	74 0a                	je     80148a <page_err+0xdc>
  801480:	bf e8 3f 81 00       	mov    edi,0x813fe8
  801485:	e8 e6 58 00 00       	call   806d70 <print>
    unsigned int addr=0;
  80148a:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801491:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801494:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801497:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80149b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80149e:	89 c6                	mov    esi,eax
  8014a0:	bf 08 40 81 00       	mov    edi,0x814008
  8014a5:	b8 00 00 00 00       	mov    eax,0x0
  8014aa:	e8 78 f8 ff ff       	call   800d27 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8014af:	48 8b 0d ea 6f c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc06fea]        # 4084a0 <task>
  8014b6:	8b 05 70 30 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13070]        # 41452c <cur_proc>
  8014bc:	48 63 d0             	movsxd rdx,eax
  8014bf:	48 89 d0             	mov    rax,rdx
  8014c2:	48 01 c0             	add    rax,rax
  8014c5:	48 01 d0             	add    rax,rdx
  8014c8:	48 c1 e0 08          	shl    rax,0x8
  8014cc:	48 01 c8             	add    rax,rcx
  8014cf:	8b 00                	mov    eax,DWORD PTR [rax]
  8014d1:	83 f8 01             	cmp    eax,0x1
  8014d4:	75 11                	jne    8014e7 <page_err+0x139>
    {
        printf("sys died. please reboot.\n");
  8014d6:	bf 2a 40 81 00       	mov    edi,0x81402a
  8014db:	b8 00 00 00 00       	mov    eax,0x0
  8014e0:	e8 42 f8 ff ff       	call   800d27 <printf>
        asm volatile("jmp .");
  8014e5:	eb fe                	jmp    8014e5 <page_err+0x137>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8014e7:	b8 00 00 00 00       	mov    eax,0x0
  8014ec:	e8 4d 45 00 00       	call   805a3e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  8014f1:	fb                   	sti    
  8014f2:	c9                   	leave  
  8014f3:	48 83 c4 08          	add    rsp,0x8
  8014f7:	48 cf                	iretq  
}
  8014f9:	90                   	nop
  8014fa:	48 83 c4 20          	add    rsp,0x20
  8014fe:	5b                   	pop    rbx
  8014ff:	41 5c                	pop    r12
  801501:	5d                   	pop    rbp
  801502:	c3                   	ret    

0000000000801503 <init_memory>:
void init_memory()
{
  801503:	f3 0f 1e fa          	endbr64 
  801507:	55                   	push   rbp
  801508:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80150b:	8b 05 0f ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed0f]        # 400220 <mmap_t_i>
  801511:	83 e8 01             	sub    eax,0x1
  801514:	48 63 d0             	movsxd rdx,eax
  801517:	48 89 d0             	mov    rax,rdx
  80151a:	48 01 c0             	add    rax,rax
  80151d:	48 01 d0             	add    rax,rdx
  801520:	48 c1 e0 03          	shl    rax,0x3
  801524:	48 05 40 00 40 00    	add    rax,0x400040
  80152a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80152d:	8b 05 ed ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeced]        # 400220 <mmap_t_i>
  801533:	83 e8 01             	sub    eax,0x1
  801536:	48 63 d0             	movsxd rdx,eax
  801539:	48 89 d0             	mov    rax,rdx
  80153c:	48 01 c0             	add    rax,rax
  80153f:	48 01 d0             	add    rax,rdx
  801542:	48 c1 e0 03          	shl    rax,0x3
  801546:	48 05 48 00 40 00    	add    rax,0x400048
  80154c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80154f:	48 01 c8             	add    rax,rcx
  801552:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801556:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80155a:	48 c1 e8 0c          	shr    rax,0xc
  80155e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801561:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801564:	8d 50 1f             	lea    edx,[rax+0x1f]
  801567:	85 c0                	test   eax,eax
  801569:	0f 48 c2             	cmovs  eax,edx
  80156c:	c1 f8 05             	sar    eax,0x5
  80156f:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801572:	48 c7 05 a3 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeaa3],0xc00000        # 400020 <page_map>
  801579:	00 00 c0 00 
    int* p=page_map;
  80157d:	48 8b 05 9c ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfea9c]        # 400020 <page_map>
  801584:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801588:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80158f:	00 
    for(int i=0;i<mmap_t_i;i++){
  801590:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801597:	e9 91 00 00 00       	jmp    80162d <init_memory+0x12a>
        int cont=0;
  80159c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8015a3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015a6:	48 63 d0             	movsxd rdx,eax
  8015a9:	48 89 d0             	mov    rax,rdx
  8015ac:	48 01 c0             	add    rax,rax
  8015af:	48 01 d0             	add    rax,rdx
  8015b2:	48 c1 e0 03          	shl    rax,0x3
  8015b6:	48 05 50 00 40 00    	add    rax,0x400050
  8015bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015bf:	48 83 f8 01          	cmp    rax,0x1
  8015c3:	74 07                	je     8015cc <init_memory+0xc9>
            cont=-1;
  8015c5:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015cc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8015d3:	eb 15                	jmp    8015ea <init_memory+0xe7>
            *(p++)=cont;
  8015d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015d9:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8015dd:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8015e1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8015e4:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015e6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8015ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015ed:	48 63 c8             	movsxd rcx,eax
  8015f0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015f3:	48 63 d0             	movsxd rdx,eax
  8015f6:	48 89 d0             	mov    rax,rdx
  8015f9:	48 01 c0             	add    rax,rax
  8015fc:	48 01 d0             	add    rax,rdx
  8015ff:	48 c1 e0 03          	shl    rax,0x3
  801603:	48 05 48 00 40 00    	add    rax,0x400048
  801609:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80160c:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801613:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80161a:	ff 00 00 
  80161d:	48 21 d0             	and    rax,rdx
  801620:	48 c1 e8 11          	shr    rax,0x11
  801624:	48 39 c1             	cmp    rcx,rax
  801627:	72 ac                	jb     8015d5 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  801629:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80162d:	8b 05 ed eb bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfebed]        # 400220 <mmap_t_i>
  801633:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801636:	0f 8c 60 ff ff ff    	jl     80159c <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80163c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801643:	eb 1d                	jmp    801662 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801645:	48 8b 15 d4 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9d4]        # 400020 <page_map>
  80164c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80164f:	48 98                	cdqe   
  801651:	48 c1 e0 02          	shl    rax,0x2
  801655:	48 01 d0             	add    rax,rdx
  801658:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80165e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801662:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801666:	7e dd                	jle    801645 <init_memory+0x142>
    }
}
  801668:	90                   	nop
  801669:	90                   	nop
  80166a:	5d                   	pop    rbp
  80166b:	c3                   	ret    

000000000080166c <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80166c:	f3 0f 1e fa          	endbr64 
  801670:	55                   	push   rbp
  801671:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801674:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80167b:	e9 b0 00 00 00       	jmp    801730 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801680:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801687:	e9 96 00 00 00       	jmp    801722 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80168c:	48 8b 15 8d e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe98d]        # 400020 <page_map>
  801693:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801696:	48 98                	cdqe   
  801698:	48 c1 e0 02          	shl    rax,0x2
  80169c:	48 01 d0             	add    rax,rdx
  80169f:	8b 10                	mov    edx,DWORD PTR [rax]
  8016a1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016a4:	be 01 00 00 00       	mov    esi,0x1
  8016a9:	89 c1                	mov    ecx,eax
  8016ab:	d3 e6                	shl    esi,cl
  8016ad:	89 f0                	mov    eax,esi
  8016af:	21 d0                	and    eax,edx
  8016b1:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8016b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016b7:	c1 e0 05             	shl    eax,0x5
  8016ba:	89 c2                	mov    edx,eax
  8016bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016bf:	01 d0                	add    eax,edx
  8016c1:	c1 e0 0c             	shl    eax,0xc
  8016c4:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8016c9:	7e 53                	jle    80171e <req_a_page+0xb2>
  8016cb:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8016cf:	75 4d                	jne    80171e <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8016d1:	48 8b 15 48 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe948]        # 400020 <page_map>
  8016d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016db:	48 98                	cdqe   
  8016dd:	48 c1 e0 02          	shl    rax,0x2
  8016e1:	48 01 d0             	add    rax,rdx
  8016e4:	8b 10                	mov    edx,DWORD PTR [rax]
  8016e6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016e9:	be 01 00 00 00       	mov    esi,0x1
  8016ee:	89 c1                	mov    ecx,eax
  8016f0:	d3 e6                	shl    esi,cl
  8016f2:	89 f0                	mov    eax,esi
  8016f4:	89 c6                	mov    esi,eax
  8016f6:	48 8b 0d 23 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe923]        # 400020 <page_map>
  8016fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801700:	48 98                	cdqe   
  801702:	48 c1 e0 02          	shl    rax,0x2
  801706:	48 01 c8             	add    rax,rcx
  801709:	09 f2                	or     edx,esi
  80170b:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  80170d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801710:	c1 e0 05             	shl    eax,0x5
  801713:	89 c2                	mov    edx,eax
  801715:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801718:	01 d0                	add    eax,edx
  80171a:	48 98                	cdqe   
  80171c:	eb 1c                	jmp    80173a <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80171e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801722:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801726:	0f 8e 60 ff ff ff    	jle    80168c <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80172c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801730:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801734:	0f 8e 46 ff ff ff    	jle    801680 <req_a_page+0x14>

            }
        }
    }
}
  80173a:	5d                   	pop    rbp
  80173b:	c3                   	ret    

000000000080173c <free_page>:

int free_page(char *paddr){
  80173c:	f3 0f 1e fa          	endbr64 
  801740:	55                   	push   rbp
  801741:	48 89 e5             	mov    rbp,rsp
  801744:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801748:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80174c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801752:	85 c0                	test   eax,eax
  801754:	0f 48 c2             	cmovs  eax,edx
  801757:	c1 f8 0c             	sar    eax,0xc
  80175a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80175d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801760:	8d 50 1f             	lea    edx,[rax+0x1f]
  801763:	85 c0                	test   eax,eax
  801765:	0f 48 c2             	cmovs  eax,edx
  801768:	c1 f8 05             	sar    eax,0x5
  80176b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80176e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801771:	99                   	cdq    
  801772:	c1 ea 1b             	shr    edx,0x1b
  801775:	01 d0                	add    eax,edx
  801777:	83 e0 1f             	and    eax,0x1f
  80177a:	29 d0                	sub    eax,edx
  80177c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  80177f:	48 8b 15 9a e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe89a]        # 400020 <page_map>
  801786:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801789:	48 98                	cdqe   
  80178b:	48 c1 e0 02          	shl    rax,0x2
  80178f:	48 01 d0             	add    rax,rdx
  801792:	8b 10                	mov    edx,DWORD PTR [rax]
  801794:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801797:	be 01 00 00 00       	mov    esi,0x1
  80179c:	89 c1                	mov    ecx,eax
  80179e:	d3 e6                	shl    esi,cl
  8017a0:	89 f0                	mov    eax,esi
  8017a2:	f7 d0                	not    eax
  8017a4:	89 c6                	mov    esi,eax
  8017a6:	48 8b 0d 73 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe873]        # 400020 <page_map>
  8017ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017b0:	48 98                	cdqe   
  8017b2:	48 c1 e0 02          	shl    rax,0x2
  8017b6:	48 01 c8             	add    rax,rcx
  8017b9:	21 f2                	and    edx,esi
  8017bb:	89 10                	mov    DWORD PTR [rax],edx
}
  8017bd:	90                   	nop
  8017be:	5d                   	pop    rbp
  8017bf:	c3                   	ret    

00000000008017c0 <free_pages_at>:

int free_pages_at(int base,int pgn){
  8017c0:	f3 0f 1e fa          	endbr64 
  8017c4:	55                   	push   rbp
  8017c5:	48 89 e5             	mov    rbp,rsp
  8017c8:	48 83 ec 18          	sub    rsp,0x18
  8017cc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8017cf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  8017d2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017d9:	eb 1b                	jmp    8017f6 <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  8017db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017de:	c1 e0 0c             	shl    eax,0xc
  8017e1:	89 c2                	mov    edx,eax
  8017e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017e6:	01 d0                	add    eax,edx
  8017e8:	48 98                	cdqe   
  8017ea:	48 89 c7             	mov    rdi,rax
  8017ed:	e8 4a ff ff ff       	call   80173c <free_page>
    for(int i=0;i<pgn;i++){
  8017f2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017f9:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8017fc:	7c dd                	jl     8017db <free_pages_at+0x1b>
    }
}
  8017fe:	90                   	nop
  8017ff:	c9                   	leave  
  801800:	c3                   	ret    

0000000000801801 <check_page>:
int check_page(int num){
  801801:	f3 0f 1e fa          	endbr64 
  801805:	55                   	push   rbp
  801806:	48 89 e5             	mov    rbp,rsp
  801809:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80180c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80180f:	8d 50 1f             	lea    edx,[rax+0x1f]
  801812:	85 c0                	test   eax,eax
  801814:	0f 48 c2             	cmovs  eax,edx
  801817:	c1 f8 05             	sar    eax,0x5
  80181a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  80181d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801820:	99                   	cdq    
  801821:	c1 ea 1b             	shr    edx,0x1b
  801824:	01 d0                	add    eax,edx
  801826:	83 e0 1f             	and    eax,0x1f
  801829:	29 d0                	sub    eax,edx
  80182b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  80182e:	48 8b 15 eb e7 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe7eb]        # 400020 <page_map>
  801835:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801838:	48 98                	cdqe   
  80183a:	48 c1 e0 02          	shl    rax,0x2
  80183e:	48 01 d0             	add    rax,rdx
  801841:	8b 10                	mov    edx,DWORD PTR [rax]
  801843:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801846:	be 01 00 00 00       	mov    esi,0x1
  80184b:	89 c1                	mov    ecx,eax
  80184d:	d3 e6                	shl    esi,cl
  80184f:	89 f0                	mov    eax,esi
  801851:	21 d0                	and    eax,edx
  801853:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801856:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801859:	5d                   	pop    rbp
  80185a:	c3                   	ret    

000000000080185b <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80185b:	f3 0f 1e fa          	endbr64 
  80185f:	55                   	push   rbp
  801860:	48 89 e5             	mov    rbp,rsp
  801863:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801866:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801869:	c1 e0 0c             	shl    eax,0xc
}
  80186c:	5d                   	pop    rbp
  80186d:	c3                   	ret    

000000000080186e <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80186e:	f3 0f 1e fa          	endbr64 
  801872:	55                   	push   rbp
  801873:	48 89 e5             	mov    rbp,rsp
  801876:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80187a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80187d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801880:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801884:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80188b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80188f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801892:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801895:	89 c0                	mov    eax,eax
  801897:	25 00 f0 ff ff       	and    eax,0xfffff000
  80189c:	48 09 c2             	or     rdx,rax
  80189f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018a3:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8018a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018aa:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018ad:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8018b0:	48 98                	cdqe   
  8018b2:	48 09 c2             	or     rdx,rax
  8018b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b9:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018bc:	90                   	nop
  8018bd:	5d                   	pop    rbp
  8018be:	c3                   	ret    

00000000008018bf <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8018bf:	f3 0f 1e fa          	endbr64 
  8018c3:	55                   	push   rbp
  8018c4:	48 89 e5             	mov    rbp,rsp
  8018c7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018cb:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018ce:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8018d1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018d5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8018dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018e0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018e3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018e6:	0c 81                	or     al,0x81
  8018e8:	89 c0                	mov    eax,eax
  8018ea:	48 09 c2             	or     rdx,rax
  8018ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018f1:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8018f4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018f7:	25 00 00 00 c0       	and    eax,0xc0000000
  8018fc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8018ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801903:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801906:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801909:	48 09 c2             	or     rdx,rax
  80190c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801910:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801913:	90                   	nop
  801914:	5d                   	pop    rbp
  801915:	c3                   	ret    

0000000000801916 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  801916:	f3 0f 1e fa          	endbr64 
  80191a:	55                   	push   rbp
  80191b:	48 89 e5             	mov    rbp,rsp
  80191e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801922:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801925:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  801928:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80192c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  801933:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801937:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80193a:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80193d:	0d 81 10 00 00       	or     eax,0x1081
  801942:	48 98                	cdqe   
  801944:	48 09 c2             	or     rdx,rax
  801947:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80194b:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  80194e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801951:	25 00 00 c0 ff       	and    eax,0xffc00000
  801956:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801959:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80195d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801960:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801963:	48 09 c2             	or     rdx,rax
  801966:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80196a:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80196d:	90                   	nop
  80196e:	5d                   	pop    rbp
  80196f:	c3                   	ret    

0000000000801970 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801970:	f3 0f 1e fa          	endbr64 
  801974:	55                   	push   rbp
  801975:	48 89 e5             	mov    rbp,rsp
  801978:	48 83 ec 20          	sub    rsp,0x20
  80197c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801980:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801983:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801988:	75 18                	jne    8019a2 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80198a:	b8 00 00 00 00       	mov    eax,0x0
  80198f:	e8 d8 fc ff ff       	call   80166c <req_a_page>
  801994:	89 c7                	mov    edi,eax
  801996:	e8 c0 fe ff ff       	call   80185b <get_phyaddr>
  80199b:	48 98                	cdqe   
  80199d:	e9 a5 00 00 00       	jmp    801a47 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8019a2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019a6:	89 c2                	mov    edx,eax
  8019a8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8019ab:	89 c6                	mov    esi,eax
  8019ad:	89 d7                	mov    edi,edx
  8019af:	e8 52 01 00 00       	call   801b06 <is_pgs_ava>
  8019b4:	85 c0                	test   eax,eax
  8019b6:	75 0c                	jne    8019c4 <req_page_at+0x54>
  8019b8:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8019bf:	e9 83 00 00 00       	jmp    801a47 <req_page_at+0xd7>
    int pgni=base/4096;
  8019c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019c8:	48 c1 e8 0c          	shr    rax,0xc
  8019cc:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8019cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019d2:	8d 50 1f             	lea    edx,[rax+0x1f]
  8019d5:	85 c0                	test   eax,eax
  8019d7:	0f 48 c2             	cmovs  eax,edx
  8019da:	c1 f8 05             	sar    eax,0x5
  8019dd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8019e0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019e3:	99                   	cdq    
  8019e4:	c1 ea 1b             	shr    edx,0x1b
  8019e7:	01 d0                	add    eax,edx
  8019e9:	83 e0 1f             	and    eax,0x1f
  8019ec:	29 d0                	sub    eax,edx
  8019ee:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8019f1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019f8:	eb 40                	jmp    801a3a <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8019fa:	48 8b 15 1f e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe61f]        # 400020 <page_map>
  801a01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a04:	48 98                	cdqe   
  801a06:	48 c1 e0 02          	shl    rax,0x2
  801a0a:	48 01 d0             	add    rax,rdx
  801a0d:	8b 10                	mov    edx,DWORD PTR [rax]
  801a0f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801a12:	be 01 00 00 00       	mov    esi,0x1
  801a17:	89 c1                	mov    ecx,eax
  801a19:	d3 e6                	shl    esi,cl
  801a1b:	89 f0                	mov    eax,esi
  801a1d:	89 c6                	mov    esi,eax
  801a1f:	48 8b 0d fa e5 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe5fa]        # 400020 <page_map>
  801a26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a29:	48 98                	cdqe   
  801a2b:	48 c1 e0 02          	shl    rax,0x2
  801a2f:	48 01 c8             	add    rax,rcx
  801a32:	09 f2                	or     edx,esi
  801a34:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801a36:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a3a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a3d:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801a40:	7c b8                	jl     8019fa <req_page_at+0x8a>
    }
    return 0;
  801a42:	b8 00 00 00 00       	mov    eax,0x0

}
  801a47:	c9                   	leave  
  801a48:	c3                   	ret    

0000000000801a49 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801a49:	f3 0f 1e fa          	endbr64 
  801a4d:	55                   	push   rbp
  801a4e:	48 89 e5             	mov    rbp,rsp
  801a51:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a54:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801a57:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a5e:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a5f:	0f 20 d8             	mov    rax,cr3
  801a62:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a66:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a69:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a6f:	85 c0                	test   eax,eax
  801a71:	0f 48 c2             	cmovs  eax,edx
  801a74:	c1 f8 15             	sar    eax,0x15
  801a77:	48 98                	cdqe   
  801a79:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a80:	00 
  801a81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a85:	48 01 d0             	add    rax,rdx
  801a88:	8b 00                	mov    eax,DWORD PTR [rax]
  801a8a:	89 c0                	mov    eax,eax
  801a8c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a91:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a95:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a98:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a9e:	85 c0                	test   eax,eax
  801aa0:	0f 48 c2             	cmovs  eax,edx
  801aa3:	c1 f8 15             	sar    eax,0x15
  801aa6:	48 98                	cdqe   
  801aa8:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801aaf:	00 
  801ab0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ab4:	48 01 d0             	add    rax,rdx
  801ab7:	8b 00                	mov    eax,DWORD PTR [rax]
  801ab9:	83 e0 01             	and    eax,0x1
  801abc:	85 c0                	test   eax,eax
  801abe:	74 38                	je     801af8 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801ac0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ac3:	99                   	cdq    
  801ac4:	c1 ea 0b             	shr    edx,0xb
  801ac7:	01 d0                	add    eax,edx
  801ac9:	25 ff ff 1f 00       	and    eax,0x1fffff
  801ace:	29 d0                	sub    eax,edx
  801ad0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801ad6:	85 c0                	test   eax,eax
  801ad8:	0f 48 c2             	cmovs  eax,edx
  801adb:	c1 f8 0c             	sar    eax,0xc
  801ade:	48 98                	cdqe   
  801ae0:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801ae7:	00 
  801ae8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801aec:	48 01 d0             	add    rax,rdx
  801aef:	8b 00                	mov    eax,DWORD PTR [rax]
  801af1:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801af4:	85 c0                	test   eax,eax
  801af6:	75 07                	jne    801aff <chk_vm+0xb6>
    {
        return -1;
  801af8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801afd:	eb 05                	jmp    801b04 <chk_vm+0xbb>
    }
    return 0;
  801aff:	b8 00 00 00 00       	mov    eax,0x0
}
  801b04:	5d                   	pop    rbp
  801b05:	c3                   	ret    

0000000000801b06 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801b06:	f3 0f 1e fa          	endbr64 
  801b0a:	55                   	push   rbp
  801b0b:	48 89 e5             	mov    rbp,rsp
  801b0e:	48 83 ec 18          	sub    rsp,0x18
  801b12:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b15:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801b18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b1b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801b21:	85 c0                	test   eax,eax
  801b23:	0f 48 c2             	cmovs  eax,edx
  801b26:	c1 f8 0c             	sar    eax,0xc
  801b29:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801b2c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b33:	eb 1e                	jmp    801b53 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801b35:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801b38:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b3b:	01 d0                	add    eax,edx
  801b3d:	89 c7                	mov    edi,eax
  801b3f:	e8 bd fc ff ff       	call   801801 <check_page>
  801b44:	85 c0                	test   eax,eax
  801b46:	74 07                	je     801b4f <is_pgs_ava+0x49>
  801b48:	b8 00 00 00 00       	mov    eax,0x0
  801b4d:	eb 11                	jmp    801b60 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801b4f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b56:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801b59:	7c da                	jl     801b35 <is_pgs_ava+0x2f>
    }
    return 1;
  801b5b:	b8 01 00 00 00       	mov    eax,0x1

}
  801b60:	c9                   	leave  
  801b61:	c3                   	ret    

0000000000801b62 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b62:	f3 0f 1e fa          	endbr64 
  801b66:	55                   	push   rbp
  801b67:	48 89 e5             	mov    rbp,rsp
  801b6a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b6e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b72:	c6 05 c7 e6 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe6c7],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b79:	c6 05 c1 e6 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe6c1],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b84:	48 89 05 bd e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6bd],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b8f:	48 89 05 ba e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6ba],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b96:	c7 05 c0 e6 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe6c0],0x1        # 400260 <vols+0x20>
  801b9d:	00 00 00 
    return 0;
  801ba0:	b8 00 00 00 00       	mov    eax,0x0
}
  801ba5:	5d                   	pop    rbp
  801ba6:	c3                   	ret    

0000000000801ba7 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801ba7:	f3 0f 1e fa          	endbr64 
  801bab:	55                   	push   rbp
  801bac:	48 89 e5             	mov    rbp,rsp
  801baf:	48 83 ec 20          	sub    rsp,0x20
  801bb3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801bb6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801bbd:	eb 38                	jmp    801bf7 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801bbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bc2:	48 98                	cdqe   
  801bc4:	48 c1 e0 04          	shl    rax,0x4
  801bc8:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801bce:	8b 00                	mov    eax,DWORD PTR [rax]
  801bd0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801bd3:	75 1e                	jne    801bf3 <sys_mkfifo+0x4c>
  801bd5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bd8:	48 98                	cdqe   
  801bda:	48 c1 e0 04          	shl    rax,0x4
  801bde:	48 05 68 1e 40 00    	add    rax,0x401e68
  801be4:	8b 00                	mov    eax,DWORD PTR [rax]
  801be6:	83 f8 01             	cmp    eax,0x1
  801be9:	75 08                	jne    801bf3 <sys_mkfifo+0x4c>
            return i;
  801beb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bee:	e9 a6 00 00 00       	jmp    801c99 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801bf3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bf7:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801bfb:	7e c2                	jle    801bbf <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801bfd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801c04:	e9 81 00 00 00       	jmp    801c8a <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801c09:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c0c:	48 98                	cdqe   
  801c0e:	48 c1 e0 04          	shl    rax,0x4
  801c12:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c18:	8b 00                	mov    eax,DWORD PTR [rax]
  801c1a:	85 c0                	test   eax,eax
  801c1c:	75 68                	jne    801c86 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801c1e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c21:	48 98                	cdqe   
  801c23:	48 c1 e0 04          	shl    rax,0x4
  801c27:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c2d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801c33:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c36:	48 98                	cdqe   
  801c38:	48 c1 e0 04          	shl    rax,0x4
  801c3c:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801c43:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c46:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801c48:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c4b:	48 98                	cdqe   
  801c4d:	48 c1 e0 04          	shl    rax,0x4
  801c51:	48 05 64 1e 40 00    	add    rax,0x401e64
  801c57:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c5d:	b8 00 00 00 00       	mov    eax,0x0
  801c62:	e8 05 fa ff ff       	call   80166c <req_a_page>
  801c67:	89 c7                	mov    edi,eax
  801c69:	e8 ed fb ff ff       	call   80185b <get_phyaddr>
  801c6e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c71:	48 63 d2             	movsxd rdx,edx
  801c74:	48 c1 e2 04          	shl    rdx,0x4
  801c78:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c7f:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c81:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c84:	eb 13                	jmp    801c99 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c86:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c8a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c8e:	0f 8e 75 ff ff ff    	jle    801c09 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c94:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c99:	c9                   	leave  
  801c9a:	c3                   	ret    

0000000000801c9b <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801c9b:	f3 0f 1e fa          	endbr64 
  801c9f:	55                   	push   rbp
  801ca0:	48 89 e5             	mov    rbp,rsp
  801ca3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801ca6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cad:	eb 4a                	jmp    801cf9 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801caf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cb2:	48 98                	cdqe   
  801cb4:	48 c1 e0 04          	shl    rax,0x4
  801cb8:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801cbe:	8b 00                	mov    eax,DWORD PTR [rax]
  801cc0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801cc3:	75 30                	jne    801cf5 <sys_rmfifo+0x5a>
  801cc5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cc8:	48 98                	cdqe   
  801cca:	48 c1 e0 04          	shl    rax,0x4
  801cce:	48 05 68 1e 40 00    	add    rax,0x401e68
  801cd4:	8b 00                	mov    eax,DWORD PTR [rax]
  801cd6:	83 f8 01             	cmp    eax,0x1
  801cd9:	75 1a                	jne    801cf5 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801cdb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cde:	48 98                	cdqe   
  801ce0:	48 c1 e0 04          	shl    rax,0x4
  801ce4:	48 05 68 1e 40 00    	add    rax,0x401e68
  801cea:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801cf0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cf3:	eb 0f                	jmp    801d04 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801cf5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801cf9:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801cfd:	7e b0                	jle    801caf <sys_rmfifo+0x14>
        }
    }
    return -1;
  801cff:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801d04:	5d                   	pop    rbp
  801d05:	c3                   	ret    

0000000000801d06 <free_vol>:
int free_vol(int voli)
{
  801d06:	f3 0f 1e fa          	endbr64 
  801d0a:	55                   	push   rbp
  801d0b:	48 89 e5             	mov    rbp,rsp
  801d0e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801d11:	c7 05 45 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe545],0x0        # 400260 <vols+0x20>
  801d18:	00 00 00 
    return 0;
  801d1b:	b8 00 00 00 00       	mov    eax,0x0
}
  801d20:	5d                   	pop    rbp
  801d21:	c3                   	ret    

0000000000801d22 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801d22:	f3 0f 1e fa          	endbr64 
  801d26:	55                   	push   rbp
  801d27:	48 89 e5             	mov    rbp,rsp
  801d2a:	48 83 ec 20          	sub    rsp,0x20
  801d2e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801d31:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801d34:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801d38:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801d3f:	e9 d8 00 00 00       	jmp    801e1c <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801d44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d47:	48 63 d0             	movsxd rdx,eax
  801d4a:	48 89 d0             	mov    rax,rdx
  801d4d:	48 c1 e0 02          	shl    rax,0x2
  801d51:	48 01 d0             	add    rax,rdx
  801d54:	48 c1 e0 03          	shl    rax,0x3
  801d58:	48 05 60 02 40 00    	add    rax,0x400260
  801d5e:	8b 00                	mov    eax,DWORD PTR [rax]
  801d60:	85 c0                	test   eax,eax
  801d62:	0f 85 b0 00 00 00    	jne    801e18 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d6b:	48 63 d0             	movsxd rdx,eax
  801d6e:	48 89 d0             	mov    rax,rdx
  801d71:	48 c1 e0 02          	shl    rax,0x2
  801d75:	48 01 d0             	add    rax,rdx
  801d78:	48 c1 e0 03          	shl    rax,0x3
  801d7c:	48 05 60 02 40 00    	add    rax,0x400260
  801d82:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d88:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d8b:	48 63 d0             	movsxd rdx,eax
  801d8e:	48 89 d0             	mov    rax,rdx
  801d91:	48 01 c0             	add    rax,rax
  801d94:	48 01 d0             	add    rax,rdx
  801d97:	48 c1 e0 03          	shl    rax,0x3
  801d9b:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801da2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801da5:	48 63 d0             	movsxd rdx,eax
  801da8:	48 89 d0             	mov    rax,rdx
  801dab:	48 c1 e0 02          	shl    rax,0x2
  801daf:	48 01 d0             	add    rax,rdx
  801db2:	48 c1 e0 03          	shl    rax,0x3
  801db6:	48 05 58 02 40 00    	add    rax,0x400258
  801dbc:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801dbf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dc2:	89 c7                	mov    edi,eax
  801dc4:	e8 3d 13 00 00       	call   803106 <get_drv>
  801dc9:	48 89 c2             	mov    rdx,rax
  801dcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dcf:	48 63 c8             	movsxd rcx,eax
  801dd2:	48 89 c8             	mov    rax,rcx
  801dd5:	48 c1 e0 02          	shl    rax,0x2
  801dd9:	48 01 c8             	add    rax,rcx
  801ddc:	48 c1 e0 03          	shl    rax,0x3
  801de0:	48 05 48 02 40 00    	add    rax,0x400248
  801de6:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801de9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dec:	48 63 d0             	movsxd rdx,eax
  801def:	48 89 d0             	mov    rax,rdx
  801df2:	48 c1 e0 02          	shl    rax,0x2
  801df6:	48 01 d0             	add    rax,rdx
  801df9:	48 c1 e0 03          	shl    rax,0x3
  801dfd:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801e04:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801e08:	48 89 c6             	mov    rsi,rax
  801e0b:	48 89 d7             	mov    rdi,rdx
  801e0e:	e8 ec 9d 00 00       	call   80bbff <strcpy>
            return i;
  801e13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e16:	eb 13                	jmp    801e2b <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801e18:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e1c:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801e20:	0f 8e 1e ff ff ff    	jle    801d44 <reg_vol+0x22>
        }
    }
    return -1;
  801e26:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801e2b:	c9                   	leave  
  801e2c:	c3                   	ret    

0000000000801e2d <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801e2d:	f3 0f 1e fa          	endbr64 
  801e31:	55                   	push   rbp
  801e32:	48 89 e5             	mov    rbp,rsp
  801e35:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801e38:	48 8b 05 61 26 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc12661]        # 4144a0 <current>
  801e3f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e42:	48 63 d2             	movsxd rdx,edx
  801e45:	48 83 c2 18          	add    rdx,0x18
  801e49:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  801e4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801e52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e56:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801e59:	5d                   	pop    rbp
  801e5a:	c3                   	ret    

0000000000801e5b <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801e5b:	f3 0f 1e fa          	endbr64 
  801e5f:	55                   	push   rbp
  801e60:	48 89 e5             	mov    rbp,rsp
  801e63:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e66:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e6d:	eb 3f                	jmp    801eae <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e72:	48 63 d0             	movsxd rdx,eax
  801e75:	48 89 d0             	mov    rax,rdx
  801e78:	48 01 c0             	add    rax,rax
  801e7b:	48 01 d0             	add    rax,rdx
  801e7e:	48 c1 e0 05          	shl    rax,0x5
  801e82:	48 05 60 06 40 00    	add    rax,0x400660
  801e88:	8b 00                	mov    eax,DWORD PTR [rax]
  801e8a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e8d:	75 1b                	jne    801eaa <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e92:	48 63 d0             	movsxd rdx,eax
  801e95:	48 89 d0             	mov    rax,rdx
  801e98:	48 01 c0             	add    rax,rax
  801e9b:	48 01 d0             	add    rax,rdx
  801e9e:	48 c1 e0 05          	shl    rax,0x5
  801ea2:	48 05 60 06 40 00    	add    rax,0x400660
  801ea8:	eb 0f                	jmp    801eb9 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801eaa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801eae:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801eb2:	7e bb                	jle    801e6f <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801eb4:	b8 00 00 00 00       	mov    eax,0x0
}
  801eb9:	5d                   	pop    rbp
  801eba:	c3                   	ret    

0000000000801ebb <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801ebb:	f3 0f 1e fa          	endbr64 
  801ebf:	55                   	push   rbp
  801ec0:	48 89 e5             	mov    rbp,rsp
  801ec3:	48 83 ec 10          	sub    rsp,0x10
  801ec7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801ecb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ecf:	48 89 c7             	mov    rdi,rax
  801ed2:	e8 a0 04 00 00       	call   802377 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801ed7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801edb:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801edf:	84 c0                	test   al,al
  801ee1:	75 07                	jne    801eea <brelse+0x2f>
  801ee3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ee8:	eb 32                	jmp    801f1c <brelse+0x61>
    bh->b_count--;
  801eea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eee:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ef2:	8d 50 ff             	lea    edx,[rax-0x1]
  801ef5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ef9:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801efc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f00:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801f04:	84 c0                	test   al,al
  801f06:	75 0f                	jne    801f17 <brelse+0x5c>
        vmfree(bh->b_data);
  801f08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f0c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f0f:	48 89 c7             	mov    rdi,rax
  801f12:	e8 31 f4 ff ff       	call   801348 <vmfree>
    return 0;
  801f17:	b8 00 00 00 00       	mov    eax,0x0
}
  801f1c:	c9                   	leave  
  801f1d:	c3                   	ret    

0000000000801f1e <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801f1e:	f3 0f 1e fa          	endbr64 
  801f22:	55                   	push   rbp
  801f23:	48 89 e5             	mov    rbp,rsp
  801f26:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801f2d:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801f33:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801f39:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801f3f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f45:	89 d6                	mov    esi,edx
  801f47:	89 c7                	mov    edi,eax
  801f49:	e8 78 02 00 00       	call   8021c6 <get_buf>
  801f4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801f52:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f57:	75 09                	jne    801f62 <bread+0x44>
  801f59:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f60:	eb 75                	jmp    801fd7 <bread+0xb9>
    if(!bh->b_uptodate)
  801f62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f66:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f6a:	84 c0                	test   al,al
  801f6c:	75 65                	jne    801fd3 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f6e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f74:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f77:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f82:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f85:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f8b:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f92:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f99:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801f9d:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801fa3:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801faa:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801fad:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801fb4:	48 89 c7             	mov    rdi,rax
  801fb7:	e8 71 11 00 00       	call   80312d <make_request>
  801fbc:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801fbf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fc2:	89 c7                	mov    edi,eax
  801fc4:	e8 77 14 00 00       	call   803440 <wait_on_req>
        clear_req(reqi);
  801fc9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fcc:	89 c7                	mov    edi,eax
  801fce:	e8 9d 14 00 00       	call   803470 <clear_req>
    }
    return bh;
  801fd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801fd7:	c9                   	leave  
  801fd8:	c3                   	ret    

0000000000801fd9 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801fd9:	f3 0f 1e fa          	endbr64 
  801fdd:	55                   	push   rbp
  801fde:	48 89 e5             	mov    rbp,rsp
  801fe1:	48 83 ec 40          	sub    rsp,0x40
  801fe5:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801fe9:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801fed:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801ff0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ff4:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801ff7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801ffa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ffe:	48 89 c7             	mov    rdi,rax
  802001:	e8 80 01 00 00       	call   802186 <get_according_bnr>
  802006:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802009:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80200c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80200f:	89 d6                	mov    esi,edx
  802011:	89 c7                	mov    edi,eax
  802013:	e8 06 ff ff ff       	call   801f1e <bread>
  802018:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80201c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80201f:	ba 00 02 00 00       	mov    edx,0x200
  802024:	39 d0                	cmp    eax,edx
  802026:	0f 4f c2             	cmovg  eax,edx
  802029:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80202c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80202f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802033:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802036:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80203a:	48 89 ce             	mov    rsi,rcx
  80203d:	48 89 c7             	mov    rdi,rax
  802040:	e8 bc 9a 00 00       	call   80bb01 <memcpy>
        len-=BLOCK_SIZE;
  802045:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80204c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802050:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802053:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802056:	01 c2                	add    edx,eax
  802058:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80205c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80205f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802063:	48 89 c7             	mov    rdi,rax
  802066:	e8 50 fe ff ff       	call   801ebb <brelse>
    }while(len>0);
  80206b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80206f:	7f 89                	jg     801ffa <vfs_read_file+0x21>
    return 0;
  802071:	b8 00 00 00 00       	mov    eax,0x0
}
  802076:	c9                   	leave  
  802077:	c3                   	ret    

0000000000802078 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802078:	f3 0f 1e fa          	endbr64 
  80207c:	55                   	push   rbp
  80207d:	48 89 e5             	mov    rbp,rsp
  802080:	48 83 ec 40          	sub    rsp,0x40
  802084:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802088:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80208c:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80208f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802093:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802096:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802099:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80209d:	48 89 c7             	mov    rdi,rax
  8020a0:	e8 e1 00 00 00       	call   802186 <get_according_bnr>
  8020a5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8020a8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8020ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020ae:	89 d6                	mov    esi,edx
  8020b0:	89 c7                	mov    edi,eax
  8020b2:	e8 0f 01 00 00       	call   8021c6 <get_buf>
  8020b7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8020bb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8020be:	ba 00 02 00 00       	mov    edx,0x200
  8020c3:	39 d0                	cmp    eax,edx
  8020c5:	0f 4f c2             	cmovg  eax,edx
  8020c8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8020cb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8020ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8020d5:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8020d9:	48 89 ce             	mov    rsi,rcx
  8020dc:	48 89 c7             	mov    rdi,rax
  8020df:	e8 1d 9a 00 00       	call   80bb01 <memcpy>
        len-=BLOCK_SIZE;
  8020e4:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8020eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020ef:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020f5:	01 c2                	add    edx,eax
  8020f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020fb:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8020fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802102:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802106:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80210a:	48 89 c7             	mov    rdi,rax
  80210d:	e8 a9 fd ff ff       	call   801ebb <brelse>
    }while(len>0);
  802112:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802116:	7f 81                	jg     802099 <vfs_write_file+0x21>
    return 0;
  802118:	b8 00 00 00 00       	mov    eax,0x0
}
  80211d:	c9                   	leave  
  80211e:	c3                   	ret    

000000000080211f <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  80211f:	f3 0f 1e fa          	endbr64 
  802123:	55                   	push   rbp
  802124:	48 89 e5             	mov    rbp,rsp
  802127:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80212b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80212e:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802131:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802135:	74 35                	je     80216c <vfs_seek_file+0x4d>
  802137:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80213b:	7f 3f                	jg     80217c <vfs_seek_file+0x5d>
  80213d:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802141:	74 08                	je     80214b <vfs_seek_file+0x2c>
  802143:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802147:	74 0e                	je     802157 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802149:	eb 31                	jmp    80217c <vfs_seek_file+0x5d>
        f->ptr=offset;
  80214b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80214f:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802152:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802155:	eb 26                	jmp    80217d <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802157:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80215e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802161:	01 c2                	add    edx,eax
  802163:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802167:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80216a:	eb 11                	jmp    80217d <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80216c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802170:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802177:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80217a:	eb 01                	jmp    80217d <vfs_seek_file+0x5e>
        break;
  80217c:	90                   	nop
    }
    return f->ptr;
  80217d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802181:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802184:	5d                   	pop    rbp
  802185:	c3                   	ret    

0000000000802186 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802186:	f3 0f 1e fa          	endbr64 
  80218a:	55                   	push   rbp
  80218b:	48 89 e5             	mov    rbp,rsp
  80218e:	48 83 ec 10          	sub    rsp,0x10
  802192:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802196:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80219a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80219d:	48 63 d0             	movsxd rdx,eax
  8021a0:	48 89 d0             	mov    rax,rdx
  8021a3:	48 c1 e0 02          	shl    rax,0x2
  8021a7:	48 01 d0             	add    rax,rdx
  8021aa:	48 c1 e0 03          	shl    rax,0x3
  8021ae:	48 05 58 02 40 00    	add    rax,0x400258
  8021b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8021b7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8021bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021bf:	48 89 c7             	mov    rdi,rax
  8021c2:	ff d2                	call   rdx

}
  8021c4:	c9                   	leave  
  8021c5:	c3                   	ret    

00000000008021c6 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8021c6:	f3 0f 1e fa          	endbr64 
  8021ca:	55                   	push   rbp
  8021cb:	48 89 e5             	mov    rbp,rsp
  8021ce:	48 83 ec 20          	sub    rsp,0x20
  8021d2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021d5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8021df:	e9 b9 00 00 00       	jmp    80229d <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8021e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021e7:	48 98                	cdqe   
  8021e9:	48 c1 e0 06          	shl    rax,0x6
  8021ed:	48 05 90 26 40 00    	add    rax,0x402690
  8021f3:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021f6:	0f b7 c0             	movzx  eax,ax
  8021f9:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021fc:	0f 85 97 00 00 00    	jne    802299 <get_buf+0xd3>
  802202:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802205:	48 98                	cdqe   
  802207:	48 c1 e0 06          	shl    rax,0x6
  80220b:	48 05 88 26 40 00    	add    rax,0x402688
  802211:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802214:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802217:	48 98                	cdqe   
  802219:	48 39 c2             	cmp    rdx,rax
  80221c:	75 7b                	jne    802299 <get_buf+0xd3>
        {
            repeat:
  80221e:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  80221f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802222:	48 98                	cdqe   
  802224:	48 c1 e0 06          	shl    rax,0x6
  802228:	48 05 80 26 40 00    	add    rax,0x402680
  80222e:	48 89 c7             	mov    rdi,rax
  802231:	e8 41 01 00 00       	call   802377 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802236:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802239:	48 98                	cdqe   
  80223b:	48 c1 e0 06          	shl    rax,0x6
  80223f:	48 05 94 26 40 00    	add    rax,0x402694
  802245:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802248:	84 c0                	test   al,al
  80224a:	74 02                	je     80224e <get_buf+0x88>
                goto repeat;
  80224c:	eb d1                	jmp    80221f <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80224e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802251:	48 98                	cdqe   
  802253:	48 c1 e0 06          	shl    rax,0x6
  802257:	48 05 90 26 40 00    	add    rax,0x402690
  80225d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802260:	0f b7 c0             	movzx  eax,ax
  802263:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802266:	75 30                	jne    802298 <get_buf+0xd2>
  802268:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80226b:	48 98                	cdqe   
  80226d:	48 c1 e0 06          	shl    rax,0x6
  802271:	48 05 88 26 40 00    	add    rax,0x402688
  802277:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80227a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80227d:	48 98                	cdqe   
  80227f:	48 39 c2             	cmp    rdx,rax
  802282:	75 14                	jne    802298 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802284:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802287:	48 98                	cdqe   
  802289:	48 c1 e0 06          	shl    rax,0x6
  80228d:	48 05 80 26 40 00    	add    rax,0x402680
  802293:	e9 dd 00 00 00       	jmp    802375 <get_buf+0x1af>
                continue;
  802298:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802299:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80229d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8022a1:	0f 8e 3d ff ff ff    	jle    8021e4 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022a7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8022ae:	e9 b8 00 00 00       	jmp    80236b <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8022b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022b6:	48 98                	cdqe   
  8022b8:	48 c1 e0 06          	shl    rax,0x6
  8022bc:	48 05 94 26 40 00    	add    rax,0x402694
  8022c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022c5:	84 c0                	test   al,al
  8022c7:	0f 85 9a 00 00 00    	jne    802367 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8022cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022d0:	48 98                	cdqe   
  8022d2:	48 c1 e0 06          	shl    rax,0x6
  8022d6:	48 05 93 26 40 00    	add    rax,0x402693
  8022dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022df:	84 c0                	test   al,al
  8022e1:	74 2e                	je     802311 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8022e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022e6:	48 98                	cdqe   
  8022e8:	48 c1 e0 06          	shl    rax,0x6
  8022ec:	48 05 80 26 40 00    	add    rax,0x402680
  8022f2:	48 89 c7             	mov    rdi,rax
  8022f5:	e8 1b 01 00 00       	call   802415 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8022fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022fd:	48 98                	cdqe   
  8022ff:	48 c1 e0 06          	shl    rax,0x6
  802303:	48 05 80 26 40 00    	add    rax,0x402680
  802309:	48 89 c7             	mov    rdi,rax
  80230c:	e8 66 00 00 00       	call   802377 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802311:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802314:	48 98                	cdqe   
  802316:	48 c1 e0 06          	shl    rax,0x6
  80231a:	48 05 94 26 40 00    	add    rax,0x402694
  802320:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802323:	8d 50 01             	lea    edx,[rax+0x1]
  802326:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802329:	48 98                	cdqe   
  80232b:	48 c1 e0 06          	shl    rax,0x6
  80232f:	48 05 94 26 40 00    	add    rax,0x402694
  802335:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802337:	b8 00 00 00 00       	mov    eax,0x0
  80233c:	e8 78 ef ff ff       	call   8012b9 <vmalloc>
  802341:	48 89 c2             	mov    rdx,rax
  802344:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802347:	48 98                	cdqe   
  802349:	48 c1 e0 06          	shl    rax,0x6
  80234d:	48 05 80 26 40 00    	add    rax,0x402680
  802353:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802356:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802359:	48 98                	cdqe   
  80235b:	48 c1 e0 06          	shl    rax,0x6
  80235f:	48 05 80 26 40 00    	add    rax,0x402680
  802365:	eb 0e                	jmp    802375 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802367:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80236b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80236f:	0f 8e 3e ff ff ff    	jle    8022b3 <get_buf+0xed>
        }
    }
}
  802375:	c9                   	leave  
  802376:	c3                   	ret    

0000000000802377 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802377:	f3 0f 1e fa          	endbr64 
  80237b:	55                   	push   rbp
  80237c:	48 89 e5             	mov    rbp,rsp
  80237f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802383:	90                   	nop
  802384:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802388:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80238c:	84 c0                	test   al,al
  80238e:	75 f4                	jne    802384 <wait_on_buf+0xd>
    
}
  802390:	90                   	nop
  802391:	90                   	nop
  802392:	5d                   	pop    rbp
  802393:	c3                   	ret    

0000000000802394 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802394:	f3 0f 1e fa          	endbr64 
  802398:	55                   	push   rbp
  802399:	48 89 e5             	mov    rbp,rsp
  80239c:	48 83 ec 30          	sub    rsp,0x30
  8023a0:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  8023a3:	b8 00 00 00 00       	mov    eax,0x0
  8023a8:	e8 0c ef ff ff       	call   8012b9 <vmalloc>
  8023ad:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  8023b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023b5:	49 89 c0             	mov    r8,rax
  8023b8:	b9 01 00 00 00       	mov    ecx,0x1
  8023bd:	ba 00 00 00 00       	mov    edx,0x0
  8023c2:	be 20 00 00 00       	mov    esi,0x20
  8023c7:	bf 00 00 00 00       	mov    edi,0x0
  8023cc:	e8 b0 5c 00 00       	call   808081 <request>
  8023d1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8023d4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8023d7:	89 c7                	mov    edi,eax
  8023d9:	e8 57 63 00 00       	call   808735 <chk_result>

    dpt_t* dpte=buf+0x1be;
  8023de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023e2:	48 05 be 01 00 00    	add    rax,0x1be
  8023e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8023ec:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8023f3:	eb 13                	jmp    802408 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8023f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023f9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023fc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8023ff:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802404:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802408:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80240c:	7e e7                	jle    8023f5 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  80240e:	b8 00 00 00 00       	mov    eax,0x0
}
  802413:	c9                   	leave  
  802414:	c3                   	ret    

0000000000802415 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802415:	f3 0f 1e fa          	endbr64 
  802419:	55                   	push   rbp
  80241a:	48 89 e5             	mov    rbp,rsp
  80241d:	48 83 ec 20          	sub    rsp,0x20
  802421:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802425:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802429:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80242d:	0f b7 c0             	movzx  eax,ax
  802430:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802433:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802437:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80243b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80243e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802442:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802445:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802448:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80244b:	b9 00 02 00 00       	mov    ecx,0x200
  802450:	89 c7                	mov    edi,eax
  802452:	e8 02 00 00 00       	call   802459 <write_block>

}
  802457:	c9                   	leave  
  802458:	c3                   	ret    

0000000000802459 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802459:	f3 0f 1e fa          	endbr64 
  80245d:	55                   	push   rbp
  80245e:	48 89 e5             	mov    rbp,rsp
  802461:	48 83 ec 30          	sub    rsp,0x30
  802465:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802468:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80246b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80246f:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802472:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802475:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802478:	89 d6                	mov    esi,edx
  80247a:	89 c7                	mov    edi,eax
  80247c:	e8 45 fd ff ff       	call   8021c6 <get_buf>
  802481:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802485:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802488:	ba 00 02 00 00       	mov    edx,0x200
  80248d:	39 d0                	cmp    eax,edx
  80248f:	0f 4f c2             	cmovg  eax,edx
  802492:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802495:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802498:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80249c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80249f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8024a3:	48 89 ce             	mov    rsi,rcx
  8024a6:	48 89 c7             	mov    rdi,rax
  8024a9:	e8 53 96 00 00       	call   80bb01 <memcpy>
        len-=BLOCK_SIZE;
  8024ae:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8024b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024b9:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8024bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024c1:	48 89 c7             	mov    rdi,rax
  8024c4:	e8 f2 f9 ff ff       	call   801ebb <brelse>
    }while(len>0);
  8024c9:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024cd:	7f a3                	jg     802472 <write_block+0x19>
    return 0;
  8024cf:	b8 00 00 00 00       	mov    eax,0x0
}
  8024d4:	c9                   	leave  
  8024d5:	c3                   	ret    

00000000008024d6 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8024d6:	f3 0f 1e fa          	endbr64 
  8024da:	55                   	push   rbp
  8024db:	48 89 e5             	mov    rbp,rsp
  8024de:	48 83 ec 30          	sub    rsp,0x30
  8024e2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8024e5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8024e8:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8024ec:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8024ef:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8024f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024f5:	89 d6                	mov    esi,edx
  8024f7:	89 c7                	mov    edi,eax
  8024f9:	e8 20 fa ff ff       	call   801f1e <bread>
  8024fe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802502:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802505:	ba 00 02 00 00       	mov    edx,0x200
  80250a:	39 d0                	cmp    eax,edx
  80250c:	0f 4f c2             	cmovg  eax,edx
  80250f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802512:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802515:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802519:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80251c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802520:	48 89 ce             	mov    rsi,rcx
  802523:	48 89 c7             	mov    rdi,rax
  802526:	e8 d6 95 00 00       	call   80bb01 <memcpy>
        len-=BLOCK_SIZE;
  80252b:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802532:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802536:	48 89 c7             	mov    rdi,rax
  802539:	e8 7d f9 ff ff       	call   801ebb <brelse>
    }while(len>0);
  80253e:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802542:	7f ab                	jg     8024ef <read_block+0x19>
    return 0;
  802544:	b8 00 00 00 00       	mov    eax,0x0
}
  802549:	c9                   	leave  
  80254a:	c3                   	ret    

000000000080254b <init_vfs>:

int init_vfs()
{
  80254b:	f3 0f 1e fa          	endbr64 
  80254f:	55                   	push   rbp
  802550:	48 89 e5             	mov    rbp,rsp
  802553:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802557:	48 8b 05 22 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f22]        # 408480 <dev_tree>
  80255e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802562:	eb 40                	jmp    8025a4 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802564:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802568:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80256e:	48 c1 f8 02          	sar    rax,0x2
  802572:	48 89 c2             	mov    rdx,rax
  802575:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80257c:	18 9c 8f 
  80257f:	48 0f af c2          	imul   rax,rdx
  802583:	89 c7                	mov    edi,eax
  802585:	e8 0a fe ff ff       	call   802394 <scan_dev>
  80258a:	85 c0                	test   eax,eax
  80258c:	74 07                	je     802595 <init_vfs+0x4a>
  80258e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802593:	eb 1b                	jmp    8025b0 <init_vfs+0x65>
    for(;p;p=p->next)
  802595:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802599:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8025a0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8025a4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8025a9:	75 b9                	jne    802564 <init_vfs+0x19>
    }

    return 0;
  8025ab:	b8 00 00 00 00       	mov    eax,0x0
}
  8025b0:	c9                   	leave  
  8025b1:	c3                   	ret    

00000000008025b2 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8025b2:	f3 0f 1e fa          	endbr64 
  8025b6:	55                   	push   rbp
  8025b7:	48 89 e5             	mov    rbp,rsp
}
  8025ba:	90                   	nop
  8025bb:	5d                   	pop    rbp
  8025bc:	c3                   	ret    

00000000008025bd <load_driver>:
int load_driver(char *path)
{
  8025bd:	f3 0f 1e fa          	endbr64 
  8025c1:	55                   	push   rbp
  8025c2:	48 89 e5             	mov    rbp,rsp
  8025c5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8025c9:	90                   	nop
  8025ca:	5d                   	pop    rbp
  8025cb:	c3                   	ret    

00000000008025cc <reg_device>:

int reg_device(device* dev)
{
  8025cc:	f3 0f 1e fa          	endbr64 
  8025d0:	55                   	push   rbp
  8025d1:	48 89 e5             	mov    rbp,rsp
  8025d4:	53                   	push   rbx
  8025d5:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8025d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8025e0:	e9 42 01 00 00       	jmp    802727 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8025e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025e8:	48 63 d0             	movsxd rdx,eax
  8025eb:	48 89 d0             	mov    rax,rdx
  8025ee:	48 c1 e0 02          	shl    rax,0x2
  8025f2:	48 01 d0             	add    rax,rdx
  8025f5:	48 c1 e0 02          	shl    rax,0x2
  8025f9:	48 01 d0             	add    rax,rdx
  8025fc:	48 c1 e0 03          	shl    rax,0x3
  802600:	48 05 90 2e 40 00    	add    rax,0x402e90
  802606:	8b 00                	mov    eax,DWORD PTR [rax]
  802608:	85 c0                	test   eax,eax
  80260a:	0f 85 13 01 00 00    	jne    802723 <reg_device+0x157>
        {
            devs[i]=*dev;
  802610:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802613:	48 63 d0             	movsxd rdx,eax
  802616:	48 89 d0             	mov    rax,rdx
  802619:	48 c1 e0 02          	shl    rax,0x2
  80261d:	48 01 d0             	add    rax,rdx
  802620:	48 c1 e0 02          	shl    rax,0x2
  802624:	48 01 d0             	add    rax,rdx
  802627:	48 c1 e0 03          	shl    rax,0x3
  80262b:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802632:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802636:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802639:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80263d:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802640:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802644:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802648:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80264c:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802650:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802654:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802658:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80265c:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802660:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802664:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802668:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80266c:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802670:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802674:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802678:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80267c:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802680:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802684:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802688:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80268c:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802690:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802694:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802698:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80269c:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8026a0:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8026a4:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8026a8:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8026ac:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8026b0:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8026b4:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8026bb:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8026c2:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8026c9:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8026d0:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8026d7:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8026de:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8026e5:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8026ec:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8026f3:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  8026fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026fd:	48 63 d0             	movsxd rdx,eax
  802700:	48 89 d0             	mov    rax,rdx
  802703:	48 c1 e0 02          	shl    rax,0x2
  802707:	48 01 d0             	add    rax,rdx
  80270a:	48 c1 e0 02          	shl    rax,0x2
  80270e:	48 01 d0             	add    rax,rdx
  802711:	48 c1 e0 03          	shl    rax,0x3
  802715:	48 05 90 2e 40 00    	add    rax,0x402e90
  80271b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802721:	eb 0e                	jmp    802731 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802723:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802727:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  80272b:	0f 8e b4 fe ff ff    	jle    8025e5 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802731:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802735:	75 0a                	jne    802741 <reg_device+0x175>
        return -1;
  802737:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80273c:	e9 6d 01 00 00       	jmp    8028ae <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802741:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802748:	00 
  802749:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80274c:	48 63 d0             	movsxd rdx,eax
  80274f:	48 89 d0             	mov    rax,rdx
  802752:	48 c1 e0 02          	shl    rax,0x2
  802756:	48 01 d0             	add    rax,rdx
  802759:	48 c1 e0 02          	shl    rax,0x2
  80275d:	48 01 d0             	add    rax,rdx
  802760:	48 c1 e0 03          	shl    rax,0x3
  802764:	48 05 80 2e 40 00    	add    rax,0x402e80
  80276a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  80276e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802772:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802775:	83 f8 03             	cmp    eax,0x3
  802778:	74 3b                	je     8027b5 <reg_device+0x1e9>
  80277a:	83 f8 03             	cmp    eax,0x3
  80277d:	7f 4b                	jg     8027ca <reg_device+0x1fe>
  80277f:	83 f8 01             	cmp    eax,0x1
  802782:	74 07                	je     80278b <reg_device+0x1bf>
  802784:	83 f8 02             	cmp    eax,0x2
  802787:	74 17                	je     8027a0 <reg_device+0x1d4>
  802789:	eb 3f                	jmp    8027ca <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  80278b:	48 8b 05 ee 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cee]        # 408480 <dev_tree>
  802792:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802796:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  80279d:	00 
        break;
  80279e:	eb 34                	jmp    8027d4 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  8027a0:	48 8b 05 e1 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ce1]        # 408488 <dev_tree+0x8>
  8027a7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027ab:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  8027b2:	00 
        break;
  8027b3:	eb 1f                	jmp    8027d4 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  8027b5:	48 8b 05 d4 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cd4]        # 408490 <dev_tree+0x10>
  8027bc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027c0:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  8027c7:	00 
        break;
  8027c8:	eb 0a                	jmp    8027d4 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  8027ca:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8027cf:	e9 da 00 00 00       	jmp    8028ae <reg_device+0x2e2>
    }
    if(!p){
  8027d4:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8027d9:	75 2b                	jne    802806 <reg_device+0x23a>
        *pp=neo;
  8027db:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027df:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8027e3:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8027e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027ea:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8027f1:	00 00 00 00 
  8027f5:	eb 3d                	jmp    802834 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8027f7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027fb:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802802:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802806:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80280a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802811:	48 85 c0             	test   rax,rax
  802814:	75 e1                	jne    8027f7 <reg_device+0x22b>
        p->next=neo;
  802816:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80281a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80281e:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802825:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802829:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80282d:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802834:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802838:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  80283f:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802843:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802847:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80284a:	83 f8 04             	cmp    eax,0x4
  80284d:	74 3b                	je     80288a <reg_device+0x2be>
  80284f:	83 f8 04             	cmp    eax,0x4
  802852:	7f 56                	jg     8028aa <reg_device+0x2de>
  802854:	83 f8 03             	cmp    eax,0x3
  802857:	74 21                	je     80287a <reg_device+0x2ae>
  802859:	83 f8 03             	cmp    eax,0x3
  80285c:	7f 4c                	jg     8028aa <reg_device+0x2de>
  80285e:	83 f8 01             	cmp    eax,0x1
  802861:	74 07                	je     80286a <reg_device+0x29e>
  802863:	83 f8 02             	cmp    eax,0x2
  802866:	74 32                	je     80289a <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802868:	eb 40                	jmp    8028aa <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80286a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80286e:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802875:	00 00 00 
        break;
  802878:	eb 31                	jmp    8028ab <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80287a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80287e:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802885:	00 00 00 
        break;
  802888:	eb 21                	jmp    8028ab <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80288a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80288e:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802895:	00 00 00 
        break;
  802898:	eb 11                	jmp    8028ab <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  80289a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80289e:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  8028a5:	00 00 00 
        break;
  8028a8:	eb 01                	jmp    8028ab <reg_device+0x2df>
        break;
  8028aa:	90                   	nop
    }
    return i;
  8028ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8028ae:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8028b2:	c9                   	leave  
  8028b3:	c3                   	ret    

00000000008028b4 <reg_driver>:


int reg_driver(driver *drv)
{
  8028b4:	f3 0f 1e fa          	endbr64 
  8028b8:	55                   	push   rbp
  8028b9:	48 89 e5             	mov    rbp,rsp
  8028bc:	53                   	push   rbx
  8028bd:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  8028c1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8028c8:	e9 22 01 00 00       	jmp    8029ef <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8028cd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028d0:	48 63 d0             	movsxd rdx,eax
  8028d3:	48 89 d0             	mov    rax,rdx
  8028d6:	48 c1 e0 02          	shl    rax,0x2
  8028da:	48 01 d0             	add    rax,rdx
  8028dd:	48 c1 e0 05          	shl    rax,0x5
  8028e1:	48 05 80 58 40 00    	add    rax,0x405880
  8028e7:	8b 00                	mov    eax,DWORD PTR [rax]
  8028e9:	85 c0                	test   eax,eax
  8028eb:	0f 85 fa 00 00 00    	jne    8029eb <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8028f1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028f4:	48 63 d0             	movsxd rdx,eax
  8028f7:	48 89 d0             	mov    rax,rdx
  8028fa:	48 c1 e0 02          	shl    rax,0x2
  8028fe:	48 01 d0             	add    rax,rdx
  802901:	48 c1 e0 05          	shl    rax,0x5
  802905:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  80290c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802910:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802913:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802917:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80291a:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80291e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802922:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802926:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80292a:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80292e:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802932:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802936:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80293a:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80293e:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802942:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802946:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80294a:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80294e:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802952:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802956:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80295a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80295e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802962:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802966:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80296a:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80296e:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802972:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802976:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80297a:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80297e:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802982:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802986:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80298a:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80298e:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802995:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80299c:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8029a3:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8029aa:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8029b1:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8029b8:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8029bf:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  8029c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029c9:	48 63 d0             	movsxd rdx,eax
  8029cc:	48 89 d0             	mov    rax,rdx
  8029cf:	48 c1 e0 02          	shl    rax,0x2
  8029d3:	48 01 d0             	add    rax,rdx
  8029d6:	48 c1 e0 05          	shl    rax,0x5
  8029da:	48 05 80 58 40 00    	add    rax,0x405880
  8029e0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8029e6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029e9:	eb 13                	jmp    8029fe <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8029eb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8029ef:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8029f3:	0f 8e d4 fe ff ff    	jle    8028cd <reg_driver+0x19>
        }
    }
    return -1;
  8029f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8029fe:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802a02:	c9                   	leave  
  802a03:	c3                   	ret    

0000000000802a04 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802a04:	f3 0f 1e fa          	endbr64 
  802a08:	55                   	push   rbp
  802a09:	48 89 e5             	mov    rbp,rsp
  802a0c:	48 83 ec 20          	sub    rsp,0x20
  802a10:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802a14:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802a1b:	eb 6c                	jmp    802a89 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802a1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a20:	48 63 d0             	movsxd rdx,eax
  802a23:	48 89 d0             	mov    rax,rdx
  802a26:	48 c1 e0 02          	shl    rax,0x2
  802a2a:	48 01 d0             	add    rax,rdx
  802a2d:	48 c1 e0 02          	shl    rax,0x2
  802a31:	48 01 d0             	add    rax,rdx
  802a34:	48 c1 e0 03          	shl    rax,0x3
  802a38:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a3e:	8b 00                	mov    eax,DWORD PTR [rax]
  802a40:	85 c0                	test   eax,eax
  802a42:	74 41                	je     802a85 <sys_find_dev+0x81>
  802a44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a47:	48 63 d0             	movsxd rdx,eax
  802a4a:	48 89 d0             	mov    rax,rdx
  802a4d:	48 c1 e0 02          	shl    rax,0x2
  802a51:	48 01 d0             	add    rax,rdx
  802a54:	48 c1 e0 02          	shl    rax,0x2
  802a58:	48 01 d0             	add    rax,rdx
  802a5b:	48 c1 e0 03          	shl    rax,0x3
  802a5f:	48 83 c0 10          	add    rax,0x10
  802a63:	48 05 80 2e 40 00    	add    rax,0x402e80
  802a69:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802a6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802a71:	48 89 d6             	mov    rsi,rdx
  802a74:	48 89 c7             	mov    rdi,rax
  802a77:	e8 23 93 00 00       	call   80bd9f <strcmp>
  802a7c:	85 c0                	test   eax,eax
  802a7e:	75 05                	jne    802a85 <sys_find_dev+0x81>
            return i;
  802a80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a83:	eb 0f                	jmp    802a94 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802a85:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802a89:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802a8d:	7e 8e                	jle    802a1d <sys_find_dev+0x19>
    }
    return -1;
  802a8f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802a94:	c9                   	leave  
  802a95:	c3                   	ret    

0000000000802a96 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802a96:	f3 0f 1e fa          	endbr64 
  802a9a:	55                   	push   rbp
  802a9b:	48 89 e5             	mov    rbp,rsp
  802a9e:	48 83 ec 30          	sub    rsp,0x30
  802aa2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802aa6:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802aa9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802aad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802ab4:	eb 67                	jmp    802b1d <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802ab6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ab9:	48 63 d0             	movsxd rdx,eax
  802abc:	48 89 d0             	mov    rax,rdx
  802abf:	48 c1 e0 02          	shl    rax,0x2
  802ac3:	48 01 d0             	add    rax,rdx
  802ac6:	48 c1 e0 02          	shl    rax,0x2
  802aca:	48 01 d0             	add    rax,rdx
  802acd:	48 c1 e0 03          	shl    rax,0x3
  802ad1:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ad7:	8b 00                	mov    eax,DWORD PTR [rax]
  802ad9:	85 c0                	test   eax,eax
  802adb:	74 3c                	je     802b19 <sys_operate_dev+0x83>
  802add:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ae0:	48 63 d0             	movsxd rdx,eax
  802ae3:	48 89 d0             	mov    rax,rdx
  802ae6:	48 c1 e0 02          	shl    rax,0x2
  802aea:	48 01 d0             	add    rax,rdx
  802aed:	48 c1 e0 02          	shl    rax,0x2
  802af1:	48 01 d0             	add    rax,rdx
  802af4:	48 c1 e0 03          	shl    rax,0x3
  802af8:	48 83 c0 10          	add    rax,0x10
  802afc:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b02:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802b06:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b0a:	48 89 d6             	mov    rsi,rdx
  802b0d:	48 89 c7             	mov    rdi,rax
  802b10:	e8 8a 92 00 00       	call   80bd9f <strcmp>
  802b15:	85 c0                	test   eax,eax
  802b17:	74 0c                	je     802b25 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802b19:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802b1d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802b21:	7e 93                	jle    802ab6 <sys_operate_dev+0x20>
  802b23:	eb 01                	jmp    802b26 <sys_operate_dev+0x90>
            break;
  802b25:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802b26:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802b2a:	75 0a                	jne    802b36 <sys_operate_dev+0xa0>
  802b2c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b31:	e9 9c 02 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
    switch (func) {
  802b36:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802b3a:	0f 87 8d 02 00 00    	ja     802dcd <sys_operate_dev+0x337>
  802b40:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802b43:	48 8b 04 c5 48 40 81 	mov    rax,QWORD PTR [rax*8+0x814048]
  802b4a:	00 
  802b4b:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802b4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b51:	48 63 d0             	movsxd rdx,eax
  802b54:	48 89 d0             	mov    rax,rdx
  802b57:	48 c1 e0 02          	shl    rax,0x2
  802b5b:	48 01 d0             	add    rax,rdx
  802b5e:	48 c1 e0 02          	shl    rax,0x2
  802b62:	48 01 d0             	add    rax,rdx
  802b65:	48 c1 e0 03          	shl    rax,0x3
  802b69:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b6f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b72:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802b76:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b7a:	48 89 c7             	mov    rdi,rax
  802b7d:	ff d2                	call   rdx
  802b7f:	e9 4e 02 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802b84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b87:	48 63 d0             	movsxd rdx,eax
  802b8a:	48 89 d0             	mov    rax,rdx
  802b8d:	48 c1 e0 02          	shl    rax,0x2
  802b91:	48 01 d0             	add    rax,rdx
  802b94:	48 c1 e0 02          	shl    rax,0x2
  802b98:	48 01 d0             	add    rax,rdx
  802b9b:	48 c1 e0 03          	shl    rax,0x3
  802b9f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ba5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ba8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802bac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bb0:	48 89 c7             	mov    rdi,rax
  802bb3:	ff d2                	call   rdx
  802bb5:	e9 18 02 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802bba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bbd:	48 63 d0             	movsxd rdx,eax
  802bc0:	48 89 d0             	mov    rax,rdx
  802bc3:	48 c1 e0 02          	shl    rax,0x2
  802bc7:	48 01 d0             	add    rax,rdx
  802bca:	48 c1 e0 02          	shl    rax,0x2
  802bce:	48 01 d0             	add    rax,rdx
  802bd1:	48 c1 e0 03          	shl    rax,0x3
  802bd5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bdb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bde:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802be2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802be6:	48 89 c7             	mov    rdi,rax
  802be9:	ff d2                	call   rdx
  802beb:	e9 e2 01 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802bf0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bf3:	48 63 d0             	movsxd rdx,eax
  802bf6:	48 89 d0             	mov    rax,rdx
  802bf9:	48 c1 e0 02          	shl    rax,0x2
  802bfd:	48 01 d0             	add    rax,rdx
  802c00:	48 c1 e0 02          	shl    rax,0x2
  802c04:	48 01 d0             	add    rax,rdx
  802c07:	48 c1 e0 03          	shl    rax,0x3
  802c0b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c14:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802c18:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c1c:	48 89 c7             	mov    rdi,rax
  802c1f:	ff d2                	call   rdx
  802c21:	e9 ac 01 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802c26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c29:	48 63 d0             	movsxd rdx,eax
  802c2c:	48 89 d0             	mov    rax,rdx
  802c2f:	48 c1 e0 02          	shl    rax,0x2
  802c33:	48 01 d0             	add    rax,rdx
  802c36:	48 c1 e0 02          	shl    rax,0x2
  802c3a:	48 01 d0             	add    rax,rdx
  802c3d:	48 c1 e0 03          	shl    rax,0x3
  802c41:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c47:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c4a:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802c4e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c52:	48 89 c7             	mov    rdi,rax
  802c55:	ff d2                	call   rdx
  802c57:	e9 76 01 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802c5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c5f:	48 63 d0             	movsxd rdx,eax
  802c62:	48 89 d0             	mov    rax,rdx
  802c65:	48 c1 e0 02          	shl    rax,0x2
  802c69:	48 01 d0             	add    rax,rdx
  802c6c:	48 c1 e0 02          	shl    rax,0x2
  802c70:	48 01 d0             	add    rax,rdx
  802c73:	48 c1 e0 03          	shl    rax,0x3
  802c77:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c7d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c80:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802c84:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c88:	48 89 c7             	mov    rdi,rax
  802c8b:	ff d2                	call   rdx
  802c8d:	e9 40 01 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802c92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c95:	48 63 d0             	movsxd rdx,eax
  802c98:	48 89 d0             	mov    rax,rdx
  802c9b:	48 c1 e0 02          	shl    rax,0x2
  802c9f:	48 01 d0             	add    rax,rdx
  802ca2:	48 c1 e0 02          	shl    rax,0x2
  802ca6:	48 01 d0             	add    rax,rdx
  802ca9:	48 c1 e0 03          	shl    rax,0x3
  802cad:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802cb3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cb6:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802cba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cbe:	48 89 c7             	mov    rdi,rax
  802cc1:	ff d2                	call   rdx
  802cc3:	e9 0a 01 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802cc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ccb:	48 63 d0             	movsxd rdx,eax
  802cce:	48 89 d0             	mov    rax,rdx
  802cd1:	48 c1 e0 02          	shl    rax,0x2
  802cd5:	48 01 d0             	add    rax,rdx
  802cd8:	48 c1 e0 02          	shl    rax,0x2
  802cdc:	48 01 d0             	add    rax,rdx
  802cdf:	48 c1 e0 03          	shl    rax,0x3
  802ce3:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ce9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cec:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802cf0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cf4:	48 89 c7             	mov    rdi,rax
  802cf7:	ff d2                	call   rdx
  802cf9:	e9 d4 00 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802cfe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d01:	48 63 d0             	movsxd rdx,eax
  802d04:	48 89 d0             	mov    rax,rdx
  802d07:	48 c1 e0 02          	shl    rax,0x2
  802d0b:	48 01 d0             	add    rax,rdx
  802d0e:	48 c1 e0 02          	shl    rax,0x2
  802d12:	48 01 d0             	add    rax,rdx
  802d15:	48 c1 e0 03          	shl    rax,0x3
  802d19:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d1f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d22:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802d26:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d2a:	48 89 c7             	mov    rdi,rax
  802d2d:	ff d2                	call   rdx
  802d2f:	e9 9e 00 00 00       	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802d34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d37:	48 63 d0             	movsxd rdx,eax
  802d3a:	48 89 d0             	mov    rax,rdx
  802d3d:	48 c1 e0 02          	shl    rax,0x2
  802d41:	48 01 d0             	add    rax,rdx
  802d44:	48 c1 e0 02          	shl    rax,0x2
  802d48:	48 01 d0             	add    rax,rdx
  802d4b:	48 c1 e0 03          	shl    rax,0x3
  802d4f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d58:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802d5c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d60:	48 89 c7             	mov    rdi,rax
  802d63:	ff d2                	call   rdx
  802d65:	eb 6b                	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802d67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d6a:	48 63 d0             	movsxd rdx,eax
  802d6d:	48 89 d0             	mov    rax,rdx
  802d70:	48 c1 e0 02          	shl    rax,0x2
  802d74:	48 01 d0             	add    rax,rdx
  802d77:	48 c1 e0 02          	shl    rax,0x2
  802d7b:	48 01 d0             	add    rax,rdx
  802d7e:	48 c1 e0 03          	shl    rax,0x3
  802d82:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d88:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d8b:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802d8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d93:	48 89 c7             	mov    rdi,rax
  802d96:	ff d2                	call   rdx
  802d98:	eb 38                	jmp    802dd2 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802d9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d9d:	48 63 d0             	movsxd rdx,eax
  802da0:	48 89 d0             	mov    rax,rdx
  802da3:	48 c1 e0 02          	shl    rax,0x2
  802da7:	48 01 d0             	add    rax,rdx
  802daa:	48 c1 e0 02          	shl    rax,0x2
  802dae:	48 01 d0             	add    rax,rdx
  802db1:	48 c1 e0 03          	shl    rax,0x3
  802db5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802dbb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802dbe:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802dc2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dc6:	48 89 c7             	mov    rdi,rax
  802dc9:	ff d2                	call   rdx
  802dcb:	eb 05                	jmp    802dd2 <sys_operate_dev+0x33c>
    }
    return -1;
  802dcd:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802dd2:	c9                   	leave  
  802dd3:	c3                   	ret    

0000000000802dd4 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802dd4:	f3 0f 1e fa          	endbr64 
  802dd8:	55                   	push   rbp
  802dd9:	48 89 e5             	mov    rbp,rsp
  802ddc:	48 83 ec 10          	sub    rsp,0x10
  802de0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802de3:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802de6:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802dea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ded:	48 63 d0             	movsxd rdx,eax
  802df0:	48 89 d0             	mov    rax,rdx
  802df3:	48 c1 e0 02          	shl    rax,0x2
  802df7:	48 01 d0             	add    rax,rdx
  802dfa:	48 c1 e0 05          	shl    rax,0x5
  802dfe:	48 05 80 58 40 00    	add    rax,0x405880
  802e04:	8b 00                	mov    eax,DWORD PTR [rax]
  802e06:	85 c0                	test   eax,eax
  802e08:	75 0a                	jne    802e14 <call_drv_func+0x40>
  802e0a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e0f:	e9 15 02 00 00       	jmp    803029 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802e14:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802e18:	0f 87 06 02 00 00    	ja     803024 <call_drv_func+0x250>
  802e1e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802e21:	48 8b 04 c5 a8 40 81 	mov    rax,QWORD PTR [rax*8+0x8140a8]
  802e28:	00 
  802e29:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802e2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e2f:	48 63 d0             	movsxd rdx,eax
  802e32:	48 89 d0             	mov    rax,rdx
  802e35:	48 c1 e0 02          	shl    rax,0x2
  802e39:	48 01 d0             	add    rax,rdx
  802e3c:	48 c1 e0 05          	shl    rax,0x5
  802e40:	48 05 88 58 40 00    	add    rax,0x405888
  802e46:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e4d:	48 89 c7             	mov    rdi,rax
  802e50:	ff d2                	call   rdx
  802e52:	e9 d2 01 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802e57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e5a:	48 63 d0             	movsxd rdx,eax
  802e5d:	48 89 d0             	mov    rax,rdx
  802e60:	48 c1 e0 02          	shl    rax,0x2
  802e64:	48 01 d0             	add    rax,rdx
  802e67:	48 c1 e0 05          	shl    rax,0x5
  802e6b:	48 05 90 58 40 00    	add    rax,0x405890
  802e71:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e78:	48 89 c7             	mov    rdi,rax
  802e7b:	ff d2                	call   rdx
  802e7d:	e9 a7 01 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802e82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e85:	48 63 d0             	movsxd rdx,eax
  802e88:	48 89 d0             	mov    rax,rdx
  802e8b:	48 c1 e0 02          	shl    rax,0x2
  802e8f:	48 01 d0             	add    rax,rdx
  802e92:	48 c1 e0 05          	shl    rax,0x5
  802e96:	48 05 98 58 40 00    	add    rax,0x405898
  802e9c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ea3:	48 89 c7             	mov    rdi,rax
  802ea6:	ff d2                	call   rdx
  802ea8:	e9 7c 01 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802ead:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eb0:	48 63 d0             	movsxd rdx,eax
  802eb3:	48 89 d0             	mov    rax,rdx
  802eb6:	48 c1 e0 02          	shl    rax,0x2
  802eba:	48 01 d0             	add    rax,rdx
  802ebd:	48 c1 e0 05          	shl    rax,0x5
  802ec1:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802ec7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802eca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ece:	48 89 c7             	mov    rdi,rax
  802ed1:	ff d2                	call   rdx
  802ed3:	e9 51 01 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802ed8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802edb:	48 63 d0             	movsxd rdx,eax
  802ede:	48 89 d0             	mov    rax,rdx
  802ee1:	48 c1 e0 02          	shl    rax,0x2
  802ee5:	48 01 d0             	add    rax,rdx
  802ee8:	48 c1 e0 05          	shl    rax,0x5
  802eec:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802ef2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ef5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ef9:	48 89 c7             	mov    rdi,rax
  802efc:	ff d2                	call   rdx
  802efe:	e9 26 01 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802f03:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f06:	48 63 d0             	movsxd rdx,eax
  802f09:	48 89 d0             	mov    rax,rdx
  802f0c:	48 c1 e0 02          	shl    rax,0x2
  802f10:	48 01 d0             	add    rax,rdx
  802f13:	48 c1 e0 05          	shl    rax,0x5
  802f17:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802f1d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f24:	48 89 c7             	mov    rdi,rax
  802f27:	ff d2                	call   rdx
  802f29:	e9 fb 00 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802f2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f31:	48 63 d0             	movsxd rdx,eax
  802f34:	48 89 d0             	mov    rax,rdx
  802f37:	48 c1 e0 02          	shl    rax,0x2
  802f3b:	48 01 d0             	add    rax,rdx
  802f3e:	48 c1 e0 05          	shl    rax,0x5
  802f42:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802f48:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f4f:	48 89 c7             	mov    rdi,rax
  802f52:	ff d2                	call   rdx
  802f54:	e9 d0 00 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802f59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f5c:	48 63 d0             	movsxd rdx,eax
  802f5f:	48 89 d0             	mov    rax,rdx
  802f62:	48 c1 e0 02          	shl    rax,0x2
  802f66:	48 01 d0             	add    rax,rdx
  802f69:	48 c1 e0 05          	shl    rax,0x5
  802f6d:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802f73:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f7a:	48 89 c7             	mov    rdi,rax
  802f7d:	ff d2                	call   rdx
  802f7f:	e9 a5 00 00 00       	jmp    803029 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802f84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f87:	48 63 d0             	movsxd rdx,eax
  802f8a:	48 89 d0             	mov    rax,rdx
  802f8d:	48 c1 e0 02          	shl    rax,0x2
  802f91:	48 01 d0             	add    rax,rdx
  802f94:	48 c1 e0 05          	shl    rax,0x5
  802f98:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802f9e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fa1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fa5:	48 89 c7             	mov    rdi,rax
  802fa8:	ff d2                	call   rdx
  802faa:	eb 7d                	jmp    803029 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802fac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802faf:	48 63 d0             	movsxd rdx,eax
  802fb2:	48 89 d0             	mov    rax,rdx
  802fb5:	48 c1 e0 02          	shl    rax,0x2
  802fb9:	48 01 d0             	add    rax,rdx
  802fbc:	48 c1 e0 05          	shl    rax,0x5
  802fc0:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802fc6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fcd:	48 89 c7             	mov    rdi,rax
  802fd0:	ff d2                	call   rdx
  802fd2:	eb 55                	jmp    803029 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802fd4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fd7:	48 63 d0             	movsxd rdx,eax
  802fda:	48 89 d0             	mov    rax,rdx
  802fdd:	48 c1 e0 02          	shl    rax,0x2
  802fe1:	48 01 d0             	add    rax,rdx
  802fe4:	48 c1 e0 05          	shl    rax,0x5
  802fe8:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802fee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ff1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ff5:	48 89 c7             	mov    rdi,rax
  802ff8:	ff d2                	call   rdx
  802ffa:	eb 2d                	jmp    803029 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  802ffc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fff:	48 63 d0             	movsxd rdx,eax
  803002:	48 89 d0             	mov    rax,rdx
  803005:	48 c1 e0 02          	shl    rax,0x2
  803009:	48 01 d0             	add    rax,rdx
  80300c:	48 c1 e0 05          	shl    rax,0x5
  803010:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803016:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803019:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80301d:	48 89 c7             	mov    rdi,rax
  803020:	ff d2                	call   rdx
  803022:	eb 05                	jmp    803029 <call_drv_func+0x255>
    }
    return -1;
  803024:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803029:	c9                   	leave  
  80302a:	c3                   	ret    

000000000080302b <dispose_device>:
int dispose_device(int dev){
  80302b:	f3 0f 1e fa          	endbr64 
  80302f:	55                   	push   rbp
  803030:	48 89 e5             	mov    rbp,rsp
  803033:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803036:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803039:	48 63 d0             	movsxd rdx,eax
  80303c:	48 89 d0             	mov    rax,rdx
  80303f:	48 c1 e0 02          	shl    rax,0x2
  803043:	48 01 d0             	add    rax,rdx
  803046:	48 c1 e0 02          	shl    rax,0x2
  80304a:	48 01 d0             	add    rax,rdx
  80304d:	48 c1 e0 03          	shl    rax,0x3
  803051:	48 05 90 2e 40 00    	add    rax,0x402e90
  803057:	8b 00                	mov    eax,DWORD PTR [rax]
  803059:	83 f8 01             	cmp    eax,0x1
  80305c:	74 07                	je     803065 <dispose_device+0x3a>
  80305e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803063:	eb 62                	jmp    8030c7 <dispose_device+0x9c>
    device* p=&devs[dev];
  803065:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803068:	48 63 d0             	movsxd rdx,eax
  80306b:	48 89 d0             	mov    rax,rdx
  80306e:	48 c1 e0 02          	shl    rax,0x2
  803072:	48 01 d0             	add    rax,rdx
  803075:	48 c1 e0 02          	shl    rax,0x2
  803079:	48 01 d0             	add    rax,rdx
  80307c:	48 c1 e0 03          	shl    rax,0x3
  803080:	48 05 80 2e 40 00    	add    rax,0x402e80
  803086:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80308a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80308e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803095:	48 85 c0             	test   rax,rax
  803098:	74 1d                	je     8030b7 <dispose_device+0x8c>
  80309a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80309e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8030a5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8030a9:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8030b0:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8030b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8030bb:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8030c2:	b8 00 00 00 00       	mov    eax,0x0
}
  8030c7:	5d                   	pop    rbp
  8030c8:	c3                   	ret    

00000000008030c9 <dispose_driver>:
int dispose_driver(driver *drv){
  8030c9:	f3 0f 1e fa          	endbr64 
  8030cd:	55                   	push   rbp
  8030ce:	48 89 e5             	mov    rbp,rsp
  8030d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8030d5:	90                   	nop
  8030d6:	5d                   	pop    rbp
  8030d7:	c3                   	ret    

00000000008030d8 <get_dev>:

device *get_dev(int devi)
{
  8030d8:	f3 0f 1e fa          	endbr64 
  8030dc:	55                   	push   rbp
  8030dd:	48 89 e5             	mov    rbp,rsp
  8030e0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8030e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030e6:	48 63 d0             	movsxd rdx,eax
  8030e9:	48 89 d0             	mov    rax,rdx
  8030ec:	48 c1 e0 02          	shl    rax,0x2
  8030f0:	48 01 d0             	add    rax,rdx
  8030f3:	48 c1 e0 02          	shl    rax,0x2
  8030f7:	48 01 d0             	add    rax,rdx
  8030fa:	48 c1 e0 03          	shl    rax,0x3
  8030fe:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803104:	5d                   	pop    rbp
  803105:	c3                   	ret    

0000000000803106 <get_drv>:
driver *get_drv(int drvi)
{
  803106:	f3 0f 1e fa          	endbr64 
  80310a:	55                   	push   rbp
  80310b:	48 89 e5             	mov    rbp,rsp
  80310e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803111:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803114:	48 63 d0             	movsxd rdx,eax
  803117:	48 89 d0             	mov    rax,rdx
  80311a:	48 c1 e0 02          	shl    rax,0x2
  80311e:	48 01 d0             	add    rax,rdx
  803121:	48 c1 e0 05          	shl    rax,0x5
  803125:	48 05 80 58 40 00    	add    rax,0x405880
}
  80312b:	5d                   	pop    rbp
  80312c:	c3                   	ret    

000000000080312d <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  80312d:	f3 0f 1e fa          	endbr64 
  803131:	55                   	push   rbp
  803132:	48 89 e5             	mov    rbp,rsp
  803135:	53                   	push   rbx
  803136:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  80313a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803141:	eb 23                	jmp    803166 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803143:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803146:	48 63 d0             	movsxd rdx,eax
  803149:	48 89 d0             	mov    rax,rdx
  80314c:	48 01 c0             	add    rax,rax
  80314f:	48 01 d0             	add    rax,rdx
  803152:	48 c1 e0 06          	shl    rax,0x6
  803156:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80315c:	8b 00                	mov    eax,DWORD PTR [rax]
  80315e:	85 c0                	test   eax,eax
  803160:	74 0c                	je     80316e <make_request+0x41>
    for(;i<NR_REQS;i++)
  803162:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803166:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80316a:	7e d7                	jle    803143 <make_request+0x16>
  80316c:	eb 01                	jmp    80316f <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80316e:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80316f:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803173:	75 0a                	jne    80317f <make_request+0x52>
  803175:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80317a:	e9 e7 01 00 00       	jmp    803366 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80317f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803182:	48 63 d0             	movsxd rdx,eax
  803185:	48 89 d0             	mov    rax,rdx
  803188:	48 01 c0             	add    rax,rax
  80318b:	48 01 d0             	add    rax,rdx
  80318e:	48 c1 e0 06          	shl    rax,0x6
  803192:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803199:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80319d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8031a0:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8031a4:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8031a7:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8031ab:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8031af:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8031b3:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8031b7:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8031bb:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8031bf:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8031c3:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8031c7:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8031cb:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8031cf:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8031d3:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8031d7:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8031db:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8031df:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8031e3:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8031e7:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8031eb:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8031ef:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8031f3:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8031f7:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8031fb:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8031ff:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803203:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803207:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80320b:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80320f:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803213:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803217:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80321b:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803222:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803229:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803230:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803237:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80323e:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803245:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80324c:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803253:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80325a:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803261:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803268:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80326f:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803276:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80327d:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803284:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80328b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80328f:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803295:	48 63 d0             	movsxd rdx,eax
  803298:	48 89 d0             	mov    rax,rdx
  80329b:	48 c1 e0 02          	shl    rax,0x2
  80329f:	48 01 d0             	add    rax,rdx
  8032a2:	48 c1 e0 02          	shl    rax,0x2
  8032a6:	48 01 d0             	add    rax,rdx
  8032a9:	48 c1 e0 03          	shl    rax,0x3
  8032ad:	48 05 80 2e 40 00    	add    rax,0x402e80
  8032b3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8032b7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032bb:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8032c2:	48 85 c0             	test   rax,rax
  8032c5:	75 27                	jne    8032ee <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8032c7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032ca:	48 63 d0             	movsxd rdx,eax
  8032cd:	48 89 d0             	mov    rax,rdx
  8032d0:	48 01 c0             	add    rax,rax
  8032d3:	48 01 d0             	add    rax,rdx
  8032d6:	48 c1 e0 06          	shl    rax,0x6
  8032da:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8032e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032e5:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8032ec:	eb 75                	jmp    803363 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8032ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032f2:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8032f9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8032fd:	eb 0f                	jmp    80330e <make_request+0x1e1>
  8032ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803303:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80330a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80330e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803312:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803319:	48 85 c0             	test   rax,rax
  80331c:	75 e1                	jne    8032ff <make_request+0x1d2>
        p->next=&reqs[i];
  80331e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803321:	48 63 d0             	movsxd rdx,eax
  803324:	48 89 d0             	mov    rax,rdx
  803327:	48 01 c0             	add    rax,rax
  80332a:	48 01 d0             	add    rax,rdx
  80332d:	48 c1 e0 06          	shl    rax,0x6
  803331:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803338:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80333c:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803343:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803346:	48 63 d0             	movsxd rdx,eax
  803349:	48 89 d0             	mov    rax,rdx
  80334c:	48 01 c0             	add    rax,rax
  80334f:	48 01 d0             	add    rax,rdx
  803352:	48 c1 e0 06          	shl    rax,0x6
  803356:	48 05 38 6d 40 00    	add    rax,0x406d38
  80335c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803363:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803366:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80336a:	c9                   	leave  
  80336b:	c3                   	ret    

000000000080336c <do_req>:
//取出一个申请并且执行
int do_req()
{
  80336c:	f3 0f 1e fa          	endbr64 
  803370:	55                   	push   rbp
  803371:	48 89 e5             	mov    rbp,rsp
  803374:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803378:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80337f:	e9 ab 00 00 00       	jmp    80342f <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803384:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803387:	48 98                	cdqe   
  803389:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803390:	00 
  803391:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803395:	e9 86 00 00 00       	jmp    803420 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80339a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80339e:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8033a5:	48 85 c0             	test   rax,rax
  8033a8:	75 67                	jne    803411 <do_req+0xa5>
  8033aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ae:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033b5:	48 85 c0             	test   rax,rax
  8033b8:	74 57                	je     803411 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8033ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033be:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8033c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c9:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8033d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033d4:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033db:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8033e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033e6:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8033ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033f1:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8033f7:	48 98                	cdqe   
  8033f9:	48 8b 14 c5 00 c5 80 	mov    rdx,QWORD PTR [rax*8+0x80c500]
  803400:	00 
  803401:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803405:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80340c:	48 89 c7             	mov    rdi,rax
  80340f:	ff d2                	call   rdx
        for(;p;p=p->next)
  803411:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803415:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80341c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803420:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803425:	0f 85 6f ff ff ff    	jne    80339a <do_req+0x2e>
    for(int i=0;i<3;i++)
  80342b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80342f:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803433:	0f 8e 4b ff ff ff    	jle    803384 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803439:	b8 00 00 00 00       	mov    eax,0x0
}
  80343e:	c9                   	leave  
  80343f:	c3                   	ret    

0000000000803440 <wait_on_req>:


void wait_on_req(int reqi)
{
  803440:	f3 0f 1e fa          	endbr64 
  803444:	55                   	push   rbp
  803445:	48 89 e5             	mov    rbp,rsp
  803448:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80344b:	90                   	nop
  80344c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80344f:	48 63 d0             	movsxd rdx,eax
  803452:	48 89 d0             	mov    rax,rdx
  803455:	48 01 c0             	add    rax,rax
  803458:	48 01 d0             	add    rax,rdx
  80345b:	48 c1 e0 06          	shl    rax,0x6
  80345f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803465:	8b 00                	mov    eax,DWORD PTR [rax]
  803467:	83 f8 03             	cmp    eax,0x3
  80346a:	75 e0                	jne    80344c <wait_on_req+0xc>
}
  80346c:	90                   	nop
  80346d:	90                   	nop
  80346e:	5d                   	pop    rbp
  80346f:	c3                   	ret    

0000000000803470 <clear_req>:
void clear_req(int reqi)
{
  803470:	f3 0f 1e fa          	endbr64 
  803474:	55                   	push   rbp
  803475:	48 89 e5             	mov    rbp,rsp
  803478:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80347b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80347e:	48 63 d0             	movsxd rdx,eax
  803481:	48 89 d0             	mov    rax,rdx
  803484:	48 01 c0             	add    rax,rax
  803487:	48 01 d0             	add    rax,rdx
  80348a:	48 c1 e0 06          	shl    rax,0x6
  80348e:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803494:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80349a:	90                   	nop
  80349b:	5d                   	pop    rbp
  80349c:	c3                   	ret    

000000000080349d <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80349d:	f3 0f 1e fa          	endbr64 
  8034a1:	55                   	push   rbp
  8034a2:	48 89 e5             	mov    rbp,rsp
  8034a5:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8034a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8034b0:	eb 61                	jmp    803513 <init_proc+0x76>
        task[i].pid=-1;
  8034b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034b5:	48 63 d0             	movsxd rdx,eax
  8034b8:	48 89 d0             	mov    rax,rdx
  8034bb:	48 01 c0             	add    rax,rax
  8034be:	48 01 d0             	add    rax,rdx
  8034c1:	48 c1 e0 08          	shl    rax,0x8
  8034c5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8034cb:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8034d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034d4:	48 63 d0             	movsxd rdx,eax
  8034d7:	48 89 d0             	mov    rax,rdx
  8034da:	48 01 c0             	add    rax,rax
  8034dd:	48 01 d0             	add    rax,rdx
  8034e0:	48 c1 e0 08          	shl    rax,0x8
  8034e4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8034ea:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8034f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034f3:	48 63 d0             	movsxd rdx,eax
  8034f6:	48 89 d0             	mov    rax,rdx
  8034f9:	48 01 c0             	add    rax,rax
  8034fc:	48 01 d0             	add    rax,rdx
  8034ff:	48 c1 e0 08          	shl    rax,0x8
  803503:	48 05 28 85 40 00    	add    rax,0x408528
  803509:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  80350f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803513:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803517:	7e 99                	jle    8034b2 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803519:	c7 05 09 10 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11009],0x0        # 41452c <cur_proc>
  803520:	00 00 00 
    current=task;
  803523:	48 c7 05 72 0f c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10f72],0x4084a0        # 4144a0 <current>
  80352a:	a0 84 40 00 
    pidd=1;
  80352e:	c7 05 f8 0f c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10ff8],0x1        # 414530 <pidd>
  803535:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803538:	b8 00 00 00 00       	mov    eax,0x0
  80353d:	e8 ff 02 00 00       	call   803841 <create_proc>
  803542:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803545:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803548:	48 63 d0             	movsxd rdx,eax
  80354b:	48 89 d0             	mov    rax,rdx
  80354e:	48 01 c0             	add    rax,rax
  803551:	48 01 d0             	add    rax,rdx
  803554:	48 c1 e0 08          	shl    rax,0x8
  803558:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80355e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803564:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803567:	83 c0 03             	add    eax,0x3
  80356a:	c1 e0 04             	shl    eax,0x4
  80356d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803570:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803573:	01 c0                	add    eax,eax
  803575:	83 c0 05             	add    eax,0x5
  803578:	c1 e0 03             	shl    eax,0x3
  80357b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  80357e:	68 00 00 80 00       	push   0x800000
  803583:	68 00 00 80 00       	push   0x800000
  803588:	68 00 00 80 00       	push   0x800000
  80358d:	68 00 00 80 00       	push   0x800000
  803592:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803598:	41 b8 00 00 80 00    	mov    r8d,0x800000
  80359e:	b9 00 00 80 00       	mov    ecx,0x800000
  8035a3:	ba 00 00 40 00       	mov    edx,0x400000
  8035a8:	be 00 00 40 00       	mov    esi,0x400000
  8035ad:	bf 00 00 40 00       	mov    edi,0x400000
  8035b2:	e8 ae 14 00 00       	call   804a65 <set_tss>
  8035b7:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  8035bb:	48 8b 05 5e 8f 00 00 	mov    rax,QWORD PTR [rip+0x8f5e]        # 80c520 <tss>
  8035c2:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  8035c6:	48 89 c6             	mov    rsi,rax
  8035c9:	bf a8 06 00 00       	mov    edi,0x6a8
  8035ce:	e8 51 d2 ff ff       	call   800824 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8035d3:	be 08 00 00 00       	mov    esi,0x8
  8035d8:	bf 74 01 00 00       	mov    edi,0x174
  8035dd:	e8 42 d2 ff ff       	call   800824 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8035e2:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8035e9:	00 20 00 
  8035ec:	48 89 c6             	mov    rsi,rax
  8035ef:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8035f4:	48 89 c7             	mov    rdi,rax
  8035f7:	e8 28 d2 ff ff       	call   800824 <wrmsr>
    //创建一个测试进程
//    create_test_proc();
}
  8035fc:	90                   	nop
  8035fd:	c9                   	leave  
  8035fe:	c3                   	ret    

00000000008035ff <create_test_proc>:
void create_test_proc(){
  8035ff:	f3 0f 1e fa          	endbr64 
  803603:	55                   	push   rbp
  803604:	48 89 e5             	mov    rbp,rsp
  803607:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  80360b:	b8 00 00 00 00       	mov    eax,0x0
  803610:	e8 af 02 00 00       	call   8038c4 <req_proc>
  803615:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803618:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80361b:	48 63 d0             	movsxd rdx,eax
  80361e:	48 89 d0             	mov    rax,rdx
  803621:	48 01 c0             	add    rax,rax
  803624:	48 01 d0             	add    rax,rdx
  803627:	48 c1 e0 08          	shl    rax,0x8
  80362b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803631:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803637:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80363e:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803642:	ba 82 c4 80 00       	mov    edx,0x80c482
  803647:	48 83 ec 08          	sub    rsp,0x8
  80364b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80364e:	50                   	push   rax
  80364f:	6a 00                	push   0x0
  803651:	52                   	push   rdx
  803652:	6a 00                	push   0x0
  803654:	6a 00                	push   0x0
  803656:	6a 00                	push   0x0
  803658:	68 58 7d 00 00       	push   0x7d58
  80365d:	6a 10                	push   0x10
  80365f:	6a 10                	push   0x10
  803661:	6a 10                	push   0x10
  803663:	6a 10                	push   0x10
  803665:	41 b9 08 00 00 00    	mov    r9d,0x8
  80366b:	41 b8 10 00 00 00    	mov    r8d,0x10
  803671:	b9 00 00 00 00       	mov    ecx,0x0
  803676:	ba 00 00 00 00       	mov    edx,0x0
  80367b:	be 00 00 00 00       	mov    esi,0x0
  803680:	bf 00 00 00 00       	mov    edi,0x0
  803685:	e8 33 03 00 00       	call   8039bd <set_proc>
  80368a:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  80368e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803691:	48 63 d0             	movsxd rdx,eax
  803694:	48 89 d0             	mov    rax,rdx
  803697:	48 01 c0             	add    rax,rax
  80369a:	48 01 d0             	add    rax,rdx
  80369d:	48 c1 e0 08          	shl    rax,0x8
  8036a1:	48 05 68 86 40 00    	add    rax,0x408668
  8036a7:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    task[index].mem_struct.stack_top=0x7e00;
  8036ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036b1:	48 63 d0             	movsxd rdx,eax
  8036b4:	48 89 d0             	mov    rax,rdx
  8036b7:	48 01 c0             	add    rax,rax
  8036ba:	48 01 d0             	add    rax,rdx
  8036bd:	48 c1 e0 08          	shl    rax,0x8
  8036c1:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8036c7:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  8036cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d0:	48 63 d0             	movsxd rdx,eax
  8036d3:	48 89 d0             	mov    rax,rdx
  8036d6:	48 01 c0             	add    rax,rax
  8036d9:	48 01 d0             	add    rax,rdx
  8036dc:	48 c1 e0 08          	shl    rax,0x8
  8036e0:	48 05 bc 84 40 00    	add    rax,0x4084bc
  8036e6:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  8036ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036ef:	48 63 d0             	movsxd rdx,eax
  8036f2:	48 89 d0             	mov    rax,rdx
  8036f5:	48 01 c0             	add    rax,rax
  8036f8:	48 01 d0             	add    rax,rdx
  8036fb:	48 c1 e0 08          	shl    rax,0x8
  8036ff:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803705:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  80370b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80370e:	48 63 d0             	movsxd rdx,eax
  803711:	48 89 d0             	mov    rax,rdx
  803714:	48 01 c0             	add    rax,rax
  803717:	48 01 d0             	add    rax,rdx
  80371a:	48 c1 e0 08          	shl    rax,0x8
  80371e:	48 05 b4 84 40 00    	add    rax,0x4084b4
  803724:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  80372a:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803731:	00 
    str->rax=0;
  803732:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803736:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  80373d:	00 
    str->rbx=0;
  80373e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803742:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803749:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  80374a:	ba 38 3b 80 00       	mov    edx,0x803b38
  80374f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803753:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803757:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80375b:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803762:	00 
    str->rsi=0;
  803763:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803767:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  80376e:	00 
    str->rdi=0;
  80376f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803773:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  80377a:	00 
    str->r15=0;
  80377b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80377f:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803786:	00 
    str->r14=0;
  803787:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80378b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803792:	00 
    str->r13=0;
  803793:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803797:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  80379e:	00 
    str->r12=0;
  80379f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a3:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  8037aa:	00 
    str->r11=0x200;
  8037ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037af:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  8037b6:	00 
    str->r10=0;
  8037b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037bb:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  8037c2:	00 
    str->r9=0;
  8037c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c7:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  8037ce:	00 
    str->r8=0;
  8037cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037d3:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  8037da:	00 
    str->rip=proc_zero;
  8037db:	ba 38 3b 80 00       	mov    edx,0x803b38
  8037e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037e4:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  8037eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ef:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  8037f6:	08 00 00 00 
    str->rflags=0x00200206;
  8037fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037fe:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  803805:	06 02 20 00 
    str->rsp=0x7e00;
  803809:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80380d:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803814:	00 7e 00 00 
    str->ss=0x2b;
  803818:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80381c:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803823:	2b 00 00 00 
    str->ds=0x2b;
  803827:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80382b:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803832:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803836:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  80383d:	00 

}
  80383e:	90                   	nop
  80383f:	c9                   	leave  
  803840:	c3                   	ret    

0000000000803841 <create_proc>:
int create_proc()
{
  803841:	f3 0f 1e fa          	endbr64 
  803845:	55                   	push   rbp
  803846:	48 89 e5             	mov    rbp,rsp
  803849:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  80384d:	b8 00 00 00 00       	mov    eax,0x0
  803852:	e8 6d 00 00 00       	call   8038c4 <req_proc>
  803857:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  80385a:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80385e:	75 07                	jne    803867 <create_proc+0x26>
  803860:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803865:	eb 5b                	jmp    8038c2 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803867:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80386e:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803872:	b9 38 3b 80 00       	mov    ecx,0x803b38
  803877:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80387a:	48 98                	cdqe   
  80387c:	48 83 ec 08          	sub    rsp,0x8
  803880:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803883:	52                   	push   rdx
  803884:	6a 00                	push   0x0
  803886:	51                   	push   rcx
  803887:	6a 00                	push   0x0
  803889:	6a 00                	push   0x0
  80388b:	6a 00                	push   0x0
  80388d:	50                   	push   rax
  80388e:	6a 10                	push   0x10
  803890:	6a 10                	push   0x10
  803892:	6a 10                	push   0x10
  803894:	6a 10                	push   0x10
  803896:	41 b9 08 00 00 00    	mov    r9d,0x8
  80389c:	41 b8 10 00 00 00    	mov    r8d,0x10
  8038a2:	b9 00 00 00 00       	mov    ecx,0x0
  8038a7:	ba 00 00 00 00       	mov    edx,0x0
  8038ac:	be 00 00 00 00       	mov    esi,0x0
  8038b1:	bf 00 00 00 00       	mov    edi,0x0
  8038b6:	e8 02 01 00 00       	call   8039bd <set_proc>
  8038bb:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  8038bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8038c2:	c9                   	leave  
  8038c3:	c3                   	ret    

00000000008038c4 <req_proc>:
int req_proc(){
  8038c4:	f3 0f 1e fa          	endbr64 
  8038c8:	55                   	push   rbp
  8038c9:	48 89 e5             	mov    rbp,rsp
    int num=0;
  8038cc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038d3:	eb 04                	jmp    8038d9 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  8038d5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038dc:	48 63 d0             	movsxd rdx,eax
  8038df:	48 89 d0             	mov    rax,rdx
  8038e2:	48 01 c0             	add    rax,rax
  8038e5:	48 01 d0             	add    rax,rdx
  8038e8:	48 c1 e0 08          	shl    rax,0x8
  8038ec:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038f2:	8b 00                	mov    eax,DWORD PTR [rax]
  8038f4:	83 f8 ff             	cmp    eax,0xffffffff
  8038f7:	74 26                	je     80391f <req_proc+0x5b>
  8038f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038fc:	48 63 d0             	movsxd rdx,eax
  8038ff:	48 89 d0             	mov    rax,rdx
  803902:	48 01 c0             	add    rax,rax
  803905:	48 01 d0             	add    rax,rdx
  803908:	48 c1 e0 08          	shl    rax,0x8
  80390c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803912:	8b 00                	mov    eax,DWORD PTR [rax]
  803914:	83 f8 03             	cmp    eax,0x3
  803917:	74 06                	je     80391f <req_proc+0x5b>
  803919:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80391d:	7e b6                	jle    8038d5 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  80391f:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803923:	7e 0a                	jle    80392f <req_proc+0x6b>
        return -1;
  803925:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80392a:	e9 8c 00 00 00       	jmp    8039bb <req_proc+0xf7>
    task[num].pid=pidd++;
  80392f:	8b 05 fb 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bfb]        # 414530 <pidd>
  803935:	8d 50 01             	lea    edx,[rax+0x1]
  803938:	89 15 f2 0b c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10bf2],edx        # 414530 <pidd>
  80393e:	89 c1                	mov    ecx,eax
  803940:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803943:	48 63 d0             	movsxd rdx,eax
  803946:	48 89 d0             	mov    rax,rdx
  803949:	48 01 c0             	add    rax,rax
  80394c:	48 01 d0             	add    rax,rdx
  80394f:	48 c1 e0 08          	shl    rax,0x8
  803953:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803959:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  80395b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395e:	48 63 d0             	movsxd rdx,eax
  803961:	48 89 d0             	mov    rax,rdx
  803964:	48 01 c0             	add    rax,rax
  803967:	48 01 d0             	add    rax,rdx
  80396a:	48 c1 e0 08          	shl    rax,0x8
  80396e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803974:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  80397a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80397d:	48 63 d0             	movsxd rdx,eax
  803980:	48 89 d0             	mov    rax,rdx
  803983:	48 01 c0             	add    rax,rax
  803986:	48 01 d0             	add    rax,rdx
  803989:	48 c1 e0 08          	shl    rax,0x8
  80398d:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803993:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803999:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80399c:	48 63 d0             	movsxd rdx,eax
  80399f:	48 89 d0             	mov    rax,rdx
  8039a2:	48 01 c0             	add    rax,rax
  8039a5:	48 01 d0             	add    rax,rdx
  8039a8:	48 c1 e0 08          	shl    rax,0x8
  8039ac:	48 05 ac 84 40 00    	add    rax,0x4084ac
  8039b2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  8039b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8039bb:	5d                   	pop    rbp
  8039bc:	c3                   	ret    

00000000008039bd <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  8039bd:	f3 0f 1e fa          	endbr64 
  8039c1:	55                   	push   rbp
  8039c2:	48 89 e5             	mov    rbp,rsp
  8039c5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8039c9:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8039cd:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8039d1:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  8039d5:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  8039d9:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  8039dd:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  8039e0:	48 63 d0             	movsxd rdx,eax
  8039e3:	48 89 d0             	mov    rax,rdx
  8039e6:	48 01 c0             	add    rax,rax
  8039e9:	48 01 d0             	add    rax,rdx
  8039ec:	48 c1 e0 08          	shl    rax,0x8
  8039f0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039f6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  8039fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039fe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a02:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=rbx;
  803a09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a0d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803a11:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=rcx;
  803a18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a1c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803a20:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=rdx;
  803a27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a2b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803a2f:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803a36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a3a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803a3e:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803a45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a49:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a4d:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803a54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a58:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a5c:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803a63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a67:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803a6b:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803a72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a76:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803a7a:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803a81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a85:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803a89:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=rsp;
  803a90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a94:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803a98:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=rbp;
  803a9f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa3:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803aa7:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=rsi;
  803aae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab2:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ab6:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=rdi;
  803abd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ac1:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803ac5:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803acc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad0:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803ad7:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803adb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803adf:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803ae3:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803aea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aee:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803af2:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803af9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803afd:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803b01:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803b08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b0c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803b10:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803b17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b1b:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803b22:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803b26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b2a:	48 c7 80 ac 00 00 00 	mov    QWORD PTR [rax+0xac],0x101000
  803b31:	00 10 10 00 


}
  803b35:	90                   	nop
  803b36:	5d                   	pop    rbp
  803b37:	c3                   	ret    

0000000000803b38 <proc_zero>:
void proc_zero()
{
  803b38:	f3 0f 1e fa          	endbr64 
  803b3c:	55                   	push   rbp
  803b3d:	48 89 e5             	mov    rbp,rsp
  803b40:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  803b44:	b8 00 00 00 00       	mov    eax,0x0
  803b49:	e8 33 42 00 00       	call   807d81 <sys_analyse_key>
  803b4e:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  803b51:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  803b55:	89 c7                	mov    edi,eax
  803b57:	e8 a1 d1 ff ff       	call   800cfd <putchar>
    {
  803b5c:	eb e6                	jmp    803b44 <proc_zero+0xc>

0000000000803b5e <save_rsp>:
    }
}
void save_rsp(){
  803b5e:	f3 0f 1e fa          	endbr64 
  803b62:	55                   	push   rbp
  803b63:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803b66:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803b6d:	00 
    current->regs.rsp=*p;
  803b6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b72:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803b75:	48 8b 05 24 09 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10924]        # 4144a0 <current>
  803b7c:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
}
  803b83:	90                   	nop
  803b84:	5d                   	pop    rbp
  803b85:	c3                   	ret    

0000000000803b86 <manage_proc>:
void manage_proc(){
  803b86:	f3 0f 1e fa          	endbr64 
  803b8a:	55                   	push   rbp
  803b8b:	48 89 e5             	mov    rbp,rsp
  803b8e:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803b92:	8b 05 94 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10994]        # 41452c <cur_proc>
  803b98:	83 f8 ff             	cmp    eax,0xffffffff
  803b9b:	74 39                	je     803bd6 <manage_proc+0x50>
        task[cur_proc].utime++;
  803b9d:	8b 15 89 09 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc10989]        # 41452c <cur_proc>
  803ba3:	48 63 ca             	movsxd rcx,edx
  803ba6:	48 89 c8             	mov    rax,rcx
  803ba9:	48 01 c0             	add    rax,rax
  803bac:	48 01 c8             	add    rax,rcx
  803baf:	48 c1 e0 08          	shl    rax,0x8
  803bb3:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803bb9:	8b 00                	mov    eax,DWORD PTR [rax]
  803bbb:	8d 48 01             	lea    ecx,[rax+0x1]
  803bbe:	48 63 d2             	movsxd rdx,edx
  803bc1:	48 89 d0             	mov    rax,rdx
  803bc4:	48 01 c0             	add    rax,rax
  803bc7:	48 01 d0             	add    rax,rdx
  803bca:	48 c1 e0 08          	shl    rax,0x8
  803bce:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803bd4:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803bd6:	8b 05 50 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10950]        # 41452c <cur_proc>
  803bdc:	83 f8 ff             	cmp    eax,0xffffffff
  803bdf:	74 4a                	je     803c2b <manage_proc+0xa5>
  803be1:	8b 05 45 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10945]        # 41452c <cur_proc>
  803be7:	48 63 d0             	movsxd rdx,eax
  803bea:	48 89 d0             	mov    rax,rdx
  803bed:	48 01 c0             	add    rax,rax
  803bf0:	48 01 d0             	add    rax,rdx
  803bf3:	48 c1 e0 08          	shl    rax,0x8
  803bf7:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803bfd:	8b 00                	mov    eax,DWORD PTR [rax]
  803bff:	83 f8 0a             	cmp    eax,0xa
  803c02:	77 27                	ja     803c2b <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803c04:	8b 05 22 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10922]        # 41452c <cur_proc>
  803c0a:	48 63 d0             	movsxd rdx,eax
  803c0d:	48 89 d0             	mov    rax,rdx
  803c10:	48 01 c0             	add    rax,rax
  803c13:	48 01 d0             	add    rax,rdx
  803c16:	48 c1 e0 08          	shl    rax,0x8
  803c1a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c20:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803c22:	83 f8 01             	cmp    eax,0x1
  803c25:	0f 84 37 01 00 00    	je     803d62 <manage_proc+0x1dc>
        if(cur_proc!=-1)
  803c2b:	8b 05 fb 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108fb]        # 41452c <cur_proc>
  803c31:	83 f8 ff             	cmp    eax,0xffffffff
  803c34:	74 22                	je     803c58 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803c36:	8b 05 f0 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108f0]        # 41452c <cur_proc>
  803c3c:	48 63 d0             	movsxd rdx,eax
  803c3f:	48 89 d0             	mov    rax,rdx
  803c42:	48 01 c0             	add    rax,rax
  803c45:	48 01 d0             	add    rax,rdx
  803c48:	48 c1 e0 08          	shl    rax,0x8
  803c4c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c52:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803c58:	8b 05 ce 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108ce]        # 41452c <cur_proc>
  803c5e:	83 c0 01             	add    eax,0x1
  803c61:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  803c64:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  803c6b:	eb 60                	jmp    803ccd <manage_proc+0x147>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803c6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c70:	48 63 d0             	movsxd rdx,eax
  803c73:	48 89 d0             	mov    rax,rdx
  803c76:	48 01 c0             	add    rax,rax
  803c79:	48 01 d0             	add    rax,rdx
  803c7c:	48 c1 e0 08          	shl    rax,0x8
  803c80:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c86:	8b 00                	mov    eax,DWORD PTR [rax]
  803c88:	83 f8 ff             	cmp    eax,0xffffffff
  803c8b:	74 2b                	je     803cb8 <manage_proc+0x132>
  803c8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c90:	48 63 d0             	movsxd rdx,eax
  803c93:	48 89 d0             	mov    rax,rdx
  803c96:	48 01 c0             	add    rax,rax
  803c99:	48 01 d0             	add    rax,rdx
  803c9c:	48 c1 e0 08          	shl    rax,0x8
  803ca0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ca6:	8b 00                	mov    eax,DWORD PTR [rax]
  803ca8:	83 f8 01             	cmp    eax,0x1
  803cab:	75 0b                	jne    803cb8 <manage_proc+0x132>
  803cad:	8b 05 79 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10879]        # 41452c <cur_proc>
  803cb3:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803cb6:	75 1d                	jne    803cd5 <manage_proc+0x14f>
                break;
            }
            i++;
  803cb8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  803cbc:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  803cc0:	7e 0b                	jle    803ccd <manage_proc+0x147>
                times++;
  803cc2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  803cc6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  803ccd:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  803cd1:	7e 9a                	jle    803c6d <manage_proc+0xe7>
  803cd3:	eb 01                	jmp    803cd6 <manage_proc+0x150>
                break;
  803cd5:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803cd6:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  803cda:	0f 84 85 00 00 00    	je     803d65 <manage_proc+0x1df>
        //switch
        task[cur_proc].stat=READY;
  803ce0:	8b 05 46 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10846]        # 41452c <cur_proc>
  803ce6:	48 63 d0             	movsxd rdx,eax
  803ce9:	48 89 d0             	mov    rax,rdx
  803cec:	48 01 c0             	add    rax,rax
  803cef:	48 01 d0             	add    rax,rdx
  803cf2:	48 c1 e0 08          	shl    rax,0x8
  803cf6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803cfc:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803d02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d05:	48 63 d0             	movsxd rdx,eax
  803d08:	48 89 d0             	mov    rax,rdx
  803d0b:	48 01 c0             	add    rax,rax
  803d0e:	48 01 d0             	add    rax,rdx
  803d11:	48 c1 e0 08          	shl    rax,0x8
  803d15:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d1b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803d21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d24:	48 63 d0             	movsxd rdx,eax
  803d27:	48 89 d0             	mov    rax,rdx
  803d2a:	48 01 c0             	add    rax,rax
  803d2d:	48 01 d0             	add    rax,rdx
  803d30:	48 c1 e0 08          	shl    rax,0x8
  803d34:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d3b:	8b 05 eb 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107eb]        # 41452c <cur_proc>
  803d41:	48 63 c8             	movsxd rcx,eax
  803d44:	48 89 c8             	mov    rax,rcx
  803d47:	48 01 c0             	add    rax,rax
  803d4a:	48 01 c8             	add    rax,rcx
  803d4d:	48 c1 e0 08          	shl    rax,0x8
  803d51:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d57:	48 89 d6             	mov    rsi,rdx
  803d5a:	48 89 c7             	mov    rdi,rax
  803d5d:	e8 6e 0b 00 00       	call   8048d0 <switch_to>
    }
    return;
  803d62:	90                   	nop
  803d63:	eb 01                	jmp    803d66 <manage_proc+0x1e0>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803d65:	90                   	nop
}
  803d66:	c9                   	leave  
  803d67:	c3                   	ret    

0000000000803d68 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d68:	f3 0f 1e fa          	endbr64 
  803d6c:	55                   	push   rbp
  803d6d:	48 89 e5             	mov    rbp,rsp
  803d70:	48 83 ec 20          	sub    rsp,0x20
  803d74:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803d77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d7a:	01 c0                	add    eax,eax
  803d7c:	83 c0 05             	add    eax,0x5
  803d7f:	c1 e0 03             	shl    eax,0x3
  803d82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803d85:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d88:	89 05 9e 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1079e],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803d8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d91:	89 c7                	mov    edi,eax
  803d93:	e8 02 86 00 00       	call   80c39a <switch_proc_asm>
}
  803d98:	90                   	nop
  803d99:	c9                   	leave  
  803d9a:	c3                   	ret    

0000000000803d9b <switch_proc>:
void switch_proc(int pnr){
  803d9b:	f3 0f 1e fa          	endbr64 
  803d9f:	55                   	push   rbp
  803da0:	48 89 e5             	mov    rbp,rsp
  803da3:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803daa:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803db0:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803db6:	48 63 d0             	movsxd rdx,eax
  803db9:	48 89 d0             	mov    rax,rdx
  803dbc:	48 01 c0             	add    rax,rax
  803dbf:	48 01 d0             	add    rax,rdx
  803dc2:	48 c1 e0 08          	shl    rax,0x8
  803dc6:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803dcd:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803dd4:	48 89 d6             	mov    rsi,rdx
  803dd7:	ba 60 00 00 00       	mov    edx,0x60
  803ddc:	48 89 c7             	mov    rdi,rax
  803ddf:	48 89 d1             	mov    rcx,rdx
  803de2:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803de5:	8b 05 41 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10741]        # 41452c <cur_proc>
  803deb:	48 63 d0             	movsxd rdx,eax
  803dee:	48 89 d0             	mov    rax,rdx
  803df1:	48 01 c0             	add    rax,rax
  803df4:	48 01 d0             	add    rax,rdx
  803df7:	48 c1 e0 08          	shl    rax,0x8
  803dfb:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e01:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e07:	48 83 c0 04          	add    rax,0x4
  803e0b:	48 89 c7             	mov    rdi,rax
  803e0e:	e8 53 00 00 00       	call   803e66 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803e13:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e19:	89 05 0d 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1070d],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803e1f:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e25:	01 c0                	add    eax,eax
  803e27:	83 c0 05             	add    eax,0x5
  803e2a:	c1 e0 03             	shl    eax,0x3
  803e2d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803e30:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e36:	48 63 d0             	movsxd rdx,eax
  803e39:	48 89 d0             	mov    rax,rdx
  803e3c:	48 01 c0             	add    rax,rax
  803e3f:	48 01 d0             	add    rax,rdx
  803e42:	48 c1 e0 08          	shl    rax,0x8
  803e46:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e4c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e52:	48 83 c0 04          	add    rax,0x4
  803e56:	48 89 c6             	mov    rsi,rax
  803e59:	bf 00 00 00 00       	mov    edi,0x0
  803e5e:	e8 6d 0a 00 00       	call   8048d0 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803e63:	90                   	nop
  803e64:	c9                   	leave  
  803e65:	c3                   	ret    

0000000000803e66 <save_context>:
void save_context(TSS *tss)
{
  803e66:	f3 0f 1e fa          	endbr64 
  803e6a:	55                   	push   rbp
  803e6b:	48 89 e5             	mov    rbp,rsp
  803e6e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803e72:	90                   	nop
  803e73:	5d                   	pop    rbp
  803e74:	c3                   	ret    

0000000000803e75 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803e75:	f3 0f 1e fa          	endbr64 
  803e79:	55                   	push   rbp
  803e7a:	48 89 e5             	mov    rbp,rsp
  803e7d:	48 83 ec 60          	sub    rsp,0x60
  803e81:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803e84:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803e87:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e8a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803e90:	85 c0                	test   eax,eax
  803e92:	0f 48 c2             	cmovs  eax,edx
  803e95:	c1 f8 0c             	sar    eax,0xc
  803e98:	89 c1                	mov    ecx,eax
  803e9a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e9d:	99                   	cdq    
  803e9e:	c1 ea 14             	shr    edx,0x14
  803ea1:	01 d0                	add    eax,edx
  803ea3:	25 ff 0f 00 00       	and    eax,0xfff
  803ea8:	29 d0                	sub    eax,edx
  803eaa:	01 c8                	add    eax,ecx
  803eac:	85 c0                	test   eax,eax
  803eae:	0f 95 c0             	setne  al
  803eb1:	0f b6 c0             	movzx  eax,al
  803eb4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803eb7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803ebe:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803ec5:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803ec6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803ecd:	00 
    pgind++;
  803ece:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803ed3:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803eda:	e9 76 02 00 00       	jmp    804155 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803edf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ee3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ee6:	25 00 f0 ff ff       	and    eax,0xfffff000
  803eeb:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803eef:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803ef6:	e9 44 02 00 00       	jmp    80413f <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803efb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803eff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803f02:	83 e0 01             	and    eax,0x1
  803f05:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803f08:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803f0c:	0f 85 24 02 00 00    	jne    804136 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803f12:	b8 00 00 00 00       	mov    eax,0x0
  803f17:	e8 50 d7 ff ff       	call   80166c <req_a_page>
  803f1c:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803f1f:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803f23:	0f 85 dc 00 00 00    	jne    804005 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803f29:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f2c:	48 63 d0             	movsxd rdx,eax
  803f2f:	48 89 d0             	mov    rax,rdx
  803f32:	48 01 c0             	add    rax,rax
  803f35:	48 01 d0             	add    rax,rdx
  803f38:	48 c1 e0 08          	shl    rax,0x8
  803f3c:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f42:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f45:	0f b7 c0             	movzx  eax,ax
  803f48:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f4b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f4e:	48 63 d0             	movsxd rdx,eax
  803f51:	48 89 d0             	mov    rax,rdx
  803f54:	48 01 c0             	add    rax,rax
  803f57:	48 01 d0             	add    rax,rdx
  803f5a:	48 c1 e0 08          	shl    rax,0x8
  803f5e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f64:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f68:	0f b7 c0             	movzx  eax,ax
  803f6b:	c1 e0 10             	shl    eax,0x10
  803f6e:	25 00 00 0f 00       	and    eax,0xf0000
  803f73:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803f76:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f79:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803f7c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f7f:	89 c1                	mov    ecx,eax
  803f81:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f84:	48 63 d0             	movsxd rdx,eax
  803f87:	48 89 d0             	mov    rax,rdx
  803f8a:	48 01 c0             	add    rax,rax
  803f8d:	48 01 d0             	add    rax,rdx
  803f90:	48 c1 e0 08          	shl    rax,0x8
  803f94:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f9a:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803f9d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fa0:	48 63 d0             	movsxd rdx,eax
  803fa3:	48 89 d0             	mov    rax,rdx
  803fa6:	48 01 c0             	add    rax,rax
  803fa9:	48 01 d0             	add    rax,rdx
  803fac:	48 c1 e0 08          	shl    rax,0x8
  803fb0:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803fb6:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803fba:	0f b7 c0             	movzx  eax,ax
  803fbd:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803fc0:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803fc7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803fca:	c1 e8 10             	shr    eax,0x10
  803fcd:	83 e0 0f             	and    eax,0xf
  803fd0:	89 c2                	mov    edx,eax
  803fd2:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fd5:	01 d0                	add    eax,edx
  803fd7:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803fda:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fdd:	89 c1                	mov    ecx,eax
  803fdf:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fe2:	48 63 d0             	movsxd rdx,eax
  803fe5:	48 89 d0             	mov    rax,rdx
  803fe8:	48 01 c0             	add    rax,rax
  803feb:	48 01 d0             	add    rax,rdx
  803fee:	48 c1 e0 08          	shl    rax,0x8
  803ff2:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803ff8:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803ffc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804000:	e9 62 01 00 00       	jmp    804167 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  804005:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804008:	89 c7                	mov    edi,eax
  80400a:	e8 4c d8 ff ff       	call   80185b <get_phyaddr>
  80400f:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804012:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  804015:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804019:	ba 07 00 00 00       	mov    edx,0x7
  80401e:	89 ce                	mov    esi,ecx
  804020:	48 89 c7             	mov    rdi,rax
  804023:	e8 46 d8 ff ff       	call   80186e <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804028:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80402b:	c1 e0 0a             	shl    eax,0xa
  80402e:	89 c2                	mov    edx,eax
  804030:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804033:	01 d0                	add    eax,edx
  804035:	c1 e0 0c             	shl    eax,0xc
  804038:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  80403b:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804040:	75 09                	jne    80404b <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804042:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804045:	89 05 e9 04 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc104e9],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  80404b:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80404f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804053:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804057:	0f 85 d9 00 00 00    	jne    804136 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80405d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804060:	48 63 d0             	movsxd rdx,eax
  804063:	48 89 d0             	mov    rax,rdx
  804066:	48 01 c0             	add    rax,rax
  804069:	48 01 d0             	add    rax,rdx
  80406c:	48 c1 e0 08          	shl    rax,0x8
  804070:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804076:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804079:	0f b7 c0             	movzx  eax,ax
  80407c:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80407f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804082:	48 63 d0             	movsxd rdx,eax
  804085:	48 89 d0             	mov    rax,rdx
  804088:	48 01 c0             	add    rax,rax
  80408b:	48 01 d0             	add    rax,rdx
  80408e:	48 c1 e0 08          	shl    rax,0x8
  804092:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804098:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80409c:	0f b7 c0             	movzx  eax,ax
  80409f:	c1 e0 10             	shl    eax,0x10
  8040a2:	25 00 00 0f 00       	and    eax,0xf0000
  8040a7:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  8040aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8040ad:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8040b0:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040b3:	89 c1                	mov    ecx,eax
  8040b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040b8:	48 63 d0             	movsxd rdx,eax
  8040bb:	48 89 d0             	mov    rax,rdx
  8040be:	48 01 c0             	add    rax,rax
  8040c1:	48 01 d0             	add    rax,rdx
  8040c4:	48 c1 e0 08          	shl    rax,0x8
  8040c8:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8040ce:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8040d1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040d4:	48 63 d0             	movsxd rdx,eax
  8040d7:	48 89 d0             	mov    rax,rdx
  8040da:	48 01 c0             	add    rax,rax
  8040dd:	48 01 d0             	add    rax,rdx
  8040e0:	48 c1 e0 08          	shl    rax,0x8
  8040e4:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040ea:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040ee:	0f b7 c0             	movzx  eax,ax
  8040f1:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8040f4:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8040fb:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040fe:	c1 e8 10             	shr    eax,0x10
  804101:	83 e0 0f             	and    eax,0xf
  804104:	89 c2                	mov    edx,eax
  804106:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804109:	01 d0                	add    eax,edx
  80410b:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80410e:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804111:	89 c1                	mov    ecx,eax
  804113:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804116:	48 63 d0             	movsxd rdx,eax
  804119:	48 89 d0             	mov    rax,rdx
  80411c:	48 01 c0             	add    rax,rax
  80411f:	48 01 d0             	add    rax,rdx
  804122:	48 c1 e0 08          	shl    rax,0x8
  804126:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80412c:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  804130:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804134:	eb 31                	jmp    804167 <palloc+0x2f2>
                }
            }
            tblp++;
  804136:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  80413b:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80413f:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804146:	0f 8e af fd ff ff    	jle    803efb <palloc+0x86>
        }
        pgind++;
  80414c:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804151:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804155:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80415c:	0f 8e 7d fd ff ff    	jle    803edf <palloc+0x6a>
    }
    return NULL;
  804162:	b8 00 00 00 00       	mov    eax,0x0
}
  804167:	c9                   	leave  
  804168:	c3                   	ret    

0000000000804169 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804169:	f3 0f 1e fa          	endbr64 
  80416d:	55                   	push   rbp
  80416e:	48 89 e5             	mov    rbp,rsp
  804171:	48 83 ec 10          	sub    rsp,0x10
  804175:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804178:	8b 05 ae 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103ae]        # 41452c <cur_proc>
  80417e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804181:	89 d6                	mov    esi,edx
  804183:	89 c7                	mov    edi,eax
  804185:	e8 eb fc ff ff       	call   803e75 <palloc>
}
  80418a:	c9                   	leave  
  80418b:	c3                   	ret    

000000000080418c <proc_end>:
void proc_end()
{
  80418c:	f3 0f 1e fa          	endbr64 
  804190:	55                   	push   rbp
  804191:	48 89 e5             	mov    rbp,rsp
  804194:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804198:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  80419b:	8b 05 8b 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1038b]        # 41452c <cur_proc>
  8041a1:	89 c7                	mov    edi,eax
  8041a3:	e8 90 00 00 00       	call   804238 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8041a8:	8b 05 7e 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1037e]        # 41452c <cur_proc>
  8041ae:	48 63 d0             	movsxd rdx,eax
  8041b1:	48 89 d0             	mov    rax,rdx
  8041b4:	48 01 c0             	add    rax,rax
  8041b7:	48 01 d0             	add    rax,rdx
  8041ba:	48 c1 e0 08          	shl    rax,0x8
  8041be:	48 05 28 85 40 00    	add    rax,0x408528
  8041c4:	8b 00                	mov    eax,DWORD PTR [rax]
  8041c6:	83 f8 ff             	cmp    eax,0xffffffff
  8041c9:	74 60                	je     80422b <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  8041cb:	8b 05 5b 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1035b]        # 41452c <cur_proc>
  8041d1:	48 63 d0             	movsxd rdx,eax
  8041d4:	48 89 d0             	mov    rax,rdx
  8041d7:	48 01 c0             	add    rax,rax
  8041da:	48 01 d0             	add    rax,rdx
  8041dd:	48 c1 e0 08          	shl    rax,0x8
  8041e1:	48 05 28 85 40 00    	add    rax,0x408528
  8041e7:	8b 00                	mov    eax,DWORD PTR [rax]
  8041e9:	89 c2                	mov    edx,eax
  8041eb:	48 89 d0             	mov    rax,rdx
  8041ee:	48 01 c0             	add    rax,rax
  8041f1:	48 01 d0             	add    rax,rdx
  8041f4:	48 c1 e0 08          	shl    rax,0x8
  8041f8:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8041fe:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804204:	8b 05 22 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10322]        # 41452c <cur_proc>
  80420a:	48 63 d0             	movsxd rdx,eax
  80420d:	48 89 d0             	mov    rax,rdx
  804210:	48 01 c0             	add    rax,rax
  804213:	48 01 d0             	add    rax,rdx
  804216:	48 c1 e0 08          	shl    rax,0x8
  80421a:	48 05 28 85 40 00    	add    rax,0x408528
  804220:	8b 00                	mov    eax,DWORD PTR [rax]
  804222:	89 c7                	mov    edi,eax
  804224:	e8 3f fb ff ff       	call   803d68 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804229:	eb 0a                	jmp    804235 <proc_end+0xa9>
        switch_proc_tss(0);
  80422b:	bf 00 00 00 00       	mov    edi,0x0
  804230:	e8 33 fb ff ff       	call   803d68 <switch_proc_tss>
}
  804235:	90                   	nop
  804236:	c9                   	leave  
  804237:	c3                   	ret    

0000000000804238 <del_proc>:
void del_proc(int pnr)
{
  804238:	f3 0f 1e fa          	endbr64 
  80423c:	55                   	push   rbp
  80423d:	48 89 e5             	mov    rbp,rsp
  804240:	48 83 ec 30          	sub    rsp,0x30
  804244:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804247:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80424a:	48 63 d0             	movsxd rdx,eax
  80424d:	48 89 d0             	mov    rax,rdx
  804250:	48 01 c0             	add    rax,rax
  804253:	48 01 d0             	add    rax,rdx
  804256:	48 c1 e0 08          	shl    rax,0x8
  80425a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804260:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804266:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804269:	48 63 d0             	movsxd rdx,eax
  80426c:	48 89 d0             	mov    rax,rdx
  80426f:	48 01 c0             	add    rax,rax
  804272:	48 01 d0             	add    rax,rdx
  804275:	48 c1 e0 08          	shl    rax,0x8
  804279:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80427f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804285:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80428a:	eb 63                	jmp    8042ef <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  80428c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804290:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804293:	25 00 f0 ff ff       	and    eax,0xfffff000
  804298:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80429c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8042a3:	eb 30                	jmp    8042d5 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8042a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042ac:	83 e0 01             	and    eax,0x1
  8042af:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8042b2:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8042b6:	74 14                	je     8042cc <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  8042b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042bf:	25 00 f0 ff ff       	and    eax,0xfffff000
  8042c4:	48 89 c7             	mov    rdi,rax
  8042c7:	e8 70 d4 ff ff       	call   80173c <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8042cc:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8042d1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8042d5:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8042dc:	7e c7                	jle    8042a5 <del_proc+0x6d>
        }
        vmfree(tp);
  8042de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042e2:	48 89 c7             	mov    rdi,rax
  8042e5:	e8 5e d0 ff ff       	call   801348 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8042ea:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8042ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042f3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042f6:	83 e0 01             	and    eax,0x1
  8042f9:	48 85 c0             	test   rax,rax
  8042fc:	75 8e                	jne    80428c <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  8042fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804302:	48 89 c7             	mov    rdi,rax
  804305:	e8 3e d0 ff ff       	call   801348 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80430a:	90                   	nop
  80430b:	c9                   	leave  
  80430c:	c3                   	ret    

000000000080430d <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  80430d:	f3 0f 1e fa          	endbr64 
  804311:	55                   	push   rbp
  804312:	48 89 e5             	mov    rbp,rsp
  804315:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804318:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  80431b:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80431f:	75 0a                	jne    80432b <set_proc_stat+0x1e>
  804321:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804326:	e9 8c 00 00 00       	jmp    8043b7 <set_proc_stat+0xaa>
    int i=0;
  80432b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804332:	eb 04                	jmp    804338 <set_proc_stat+0x2b>
  804334:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804338:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80433b:	48 63 d0             	movsxd rdx,eax
  80433e:	48 89 d0             	mov    rax,rdx
  804341:	48 01 c0             	add    rax,rax
  804344:	48 01 d0             	add    rax,rdx
  804347:	48 c1 e0 08          	shl    rax,0x8
  80434b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804351:	8b 10                	mov    edx,DWORD PTR [rax]
  804353:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804356:	39 c2                	cmp    edx,eax
  804358:	75 da                	jne    804334 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  80435a:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80435e:	75 07                	jne    804367 <set_proc_stat+0x5a>
  804360:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804365:	eb 50                	jmp    8043b7 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804367:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80436a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80436d:	48 63 c8             	movsxd rcx,eax
  804370:	48 89 c8             	mov    rax,rcx
  804373:	48 01 c0             	add    rax,rax
  804376:	48 01 c8             	add    rax,rcx
  804379:	48 c1 e0 08          	shl    rax,0x8
  80437d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804383:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804385:	8b 05 a1 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101a1]        # 41452c <cur_proc>
  80438b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80438e:	75 22                	jne    8043b2 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  804390:	8b 05 96 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10196]        # 41452c <cur_proc>
  804396:	48 63 d0             	movsxd rdx,eax
  804399:	48 89 d0             	mov    rax,rdx
  80439c:	48 01 c0             	add    rax,rax
  80439f:	48 01 d0             	add    rax,rdx
  8043a2:	48 c1 e0 08          	shl    rax,0x8
  8043a6:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8043ac:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  8043b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8043b7:	5d                   	pop    rbp
  8043b8:	c3                   	ret    

00000000008043b9 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  8043b9:	f3 0f 1e fa          	endbr64 
  8043bd:	55                   	push   rbp
  8043be:	48 89 e5             	mov    rbp,rsp
  8043c1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8043c5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8043cc:	eb 6a                	jmp    804438 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  8043ce:	8b 05 58 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10158]        # 41452c <cur_proc>
  8043d4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8043d7:	48 63 ca             	movsxd rcx,edx
  8043da:	48 63 d0             	movsxd rdx,eax
  8043dd:	48 89 d0             	mov    rax,rdx
  8043e0:	48 01 c0             	add    rax,rax
  8043e3:	48 01 d0             	add    rax,rdx
  8043e6:	48 c1 e0 05          	shl    rax,0x5
  8043ea:	48 01 c8             	add    rax,rcx
  8043ed:	48 83 c0 18          	add    rax,0x18
  8043f1:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8043f8:	00 
  8043f9:	48 85 c0             	test   rax,rax
  8043fc:	75 36                	jne    804434 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  8043fe:	8b 05 28 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10128]        # 41452c <cur_proc>
  804404:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804407:	48 63 ca             	movsxd rcx,edx
  80440a:	48 63 d0             	movsxd rdx,eax
  80440d:	48 89 d0             	mov    rax,rdx
  804410:	48 01 c0             	add    rax,rax
  804413:	48 01 d0             	add    rax,rdx
  804416:	48 c1 e0 05          	shl    rax,0x5
  80441a:	48 01 c8             	add    rax,rcx
  80441d:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804421:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804425:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  80442c:	00 
            return 0;
  80442d:	b8 00 00 00 00       	mov    eax,0x0
  804432:	eb 0f                	jmp    804443 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804434:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804438:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80443c:	7e 90                	jle    8043ce <add_proc_openf+0x15>
        }
    }
    return -1;//full
  80443e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804443:	5d                   	pop    rbp
  804444:	c3                   	ret    

0000000000804445 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804445:	f3 0f 1e fa          	endbr64 
  804449:	55                   	push   rbp
  80444a:	48 89 e5             	mov    rbp,rsp
  80444d:	48 83 ec 10          	sub    rsp,0x10
  804451:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804454:	8b 05 d2 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100d2]        # 41452c <cur_proc>
  80445a:	89 c7                	mov    edi,eax
  80445c:	e8 d7 fd ff ff       	call   804238 <del_proc>
    while(1)
        manage_proc();
  804461:	b8 00 00 00 00       	mov    eax,0x0
  804466:	e8 1b f7 ff ff       	call   803b86 <manage_proc>
  80446b:	eb f4                	jmp    804461 <sys_exit+0x1c>

000000000080446d <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  80446d:	f3 0f 1e fa          	endbr64 
  804471:	55                   	push   rbp
  804472:	48 89 e5             	mov    rbp,rsp
  804475:	53                   	push   rbx
  804476:	48 83 ec 48          	sub    rsp,0x48
  80447a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80447e:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804482:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804486:	b8 00 00 00 00       	mov    eax,0x0
  80448b:	e8 34 f4 ff ff       	call   8038c4 <req_proc>
  804490:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804493:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804497:	75 0a                	jne    8044a3 <reg_proc+0x36>
  804499:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80449e:	e9 c9 01 00 00       	jmp    80466c <reg_proc+0x1ff>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  8044a3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8044a7:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8044aa:	52                   	push   rdx
  8044ab:	6a 00                	push   0x0
  8044ad:	50                   	push   rax
  8044ae:	6a 00                	push   0x0
  8044b0:	6a 00                	push   0x0
  8044b2:	6a 00                	push   0x0
  8044b4:	68 00 f0 ff ff       	push   0xfffffffffffff000
  8044b9:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  8044c0:	00 
  8044c1:	6a 28                	push   0x28
  8044c3:	6a 28                	push   0x28
  8044c5:	6a 28                	push   0x28
  8044c7:	6a 28                	push   0x28
  8044c9:	41 b9 30 00 00 00    	mov    r9d,0x30
  8044cf:	41 b8 28 00 00 00    	mov    r8d,0x28
  8044d5:	b9 00 00 00 00       	mov    ecx,0x0
  8044da:	ba 00 00 00 00       	mov    edx,0x0
  8044df:	be 00 00 00 00       	mov    esi,0x0
  8044e4:	bf 00 00 00 00       	mov    edi,0x0
  8044e9:	e8 cf f4 ff ff       	call   8039bd <set_proc>
  8044ee:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  8044f2:	b8 00 00 00 00       	mov    eax,0x0
  8044f7:	e8 bd cd ff ff       	call   8012b9 <vmalloc>
  8044fc:	48 89 c1             	mov    rcx,rax
  8044ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804502:	48 63 d0             	movsxd rdx,eax
  804505:	48 89 d0             	mov    rax,rdx
  804508:	48 01 c0             	add    rax,rax
  80450b:	48 01 d0             	add    rax,rdx
  80450e:	48 c1 e0 08          	shl    rax,0x8
  804512:	48 05 40 85 40 00    	add    rax,0x408540
  804518:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  80451c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80451f:	48 63 d0             	movsxd rdx,eax
  804522:	48 89 d0             	mov    rax,rdx
  804525:	48 01 c0             	add    rax,rax
  804528:	48 01 d0             	add    rax,rdx
  80452b:	48 c1 e0 08          	shl    rax,0x8
  80452f:	48 05 40 85 40 00    	add    rax,0x408540
  804535:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  804539:	b8 00 00 00 00       	mov    eax,0x0
  80453e:	e8 76 cd ff ff       	call   8012b9 <vmalloc>
  804543:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804546:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804549:	48 63 d0             	movsxd rdx,eax
  80454c:	48 89 d0             	mov    rax,rdx
  80454f:	48 01 c0             	add    rax,rax
  804552:	48 01 d0             	add    rax,rdx
  804555:	48 c1 e0 08          	shl    rax,0x8
  804559:	48 05 40 85 40 00    	add    rax,0x408540
  80455f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804563:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804567:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80456b:	ba 03 00 00 00       	mov    edx,0x3
  804570:	be 00 00 00 00       	mov    esi,0x0
  804575:	48 89 c7             	mov    rdi,rax
  804578:	e8 42 d3 ff ff       	call   8018bf <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  80457d:	b8 00 00 00 00       	mov    eax,0x0
  804582:	e8 32 cd ff ff       	call   8012b9 <vmalloc>
  804587:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  80458b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80458f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804593:	48 83 c0 18          	add    rax,0x18
  804597:	48 83 ca 07          	or     rdx,0x7
  80459b:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  80459e:	b8 00 00 00 00       	mov    eax,0x0
  8045a3:	e8 c4 d0 ff ff       	call   80166c <req_a_page>
  8045a8:	89 c7                	mov    edi,eax
  8045aa:	e8 ac d2 ff ff       	call   80185b <get_phyaddr>
  8045af:	89 c1                	mov    ecx,eax
  8045b1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8045b5:	48 05 f8 0f 00 00    	add    rax,0xff8
  8045bb:	ba 06 00 00 00       	mov    edx,0x6
  8045c0:	89 ce                	mov    esi,ecx
  8045c2:	48 89 c7             	mov    rdi,rax
  8045c5:	e8 4c d3 ff ff       	call   801916 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  8045ca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045cd:	48 63 d0             	movsxd rdx,eax
  8045d0:	48 89 d0             	mov    rax,rdx
  8045d3:	48 01 c0             	add    rax,rax
  8045d6:	48 01 d0             	add    rax,rdx
  8045d9:	48 c1 e0 08          	shl    rax,0x8
  8045dd:	48 05 40 85 40 00    	add    rax,0x408540
  8045e3:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8045e7:	48 89 c1             	mov    rcx,rax
  8045ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045ed:	48 63 d0             	movsxd rdx,eax
  8045f0:	48 89 d0             	mov    rax,rdx
  8045f3:	48 01 c0             	add    rax,rax
  8045f6:	48 01 d0             	add    rax,rdx
  8045f9:	48 c1 e0 08          	shl    rax,0x8
  8045fd:	48 05 d0 86 40 00    	add    rax,0x4086d0
  804603:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  804606:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804609:	48 63 d0             	movsxd rdx,eax
  80460c:	48 89 d0             	mov    rax,rdx
  80460f:	48 01 c0             	add    rax,rax
  804612:	48 01 d0             	add    rax,rdx
  804615:	48 c1 e0 08          	shl    rax,0x8
  804619:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80461f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804625:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804628:	48 63 d0             	movsxd rdx,eax
  80462b:	48 89 d0             	mov    rax,rdx
  80462e:	48 01 c0             	add    rax,rax
  804631:	48 01 d0             	add    rax,rdx
  804634:	48 c1 e0 08          	shl    rax,0x8
  804638:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80463f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804643:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804647:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80464a:	48 63 d0             	movsxd rdx,eax
  80464d:	48 89 d0             	mov    rax,rdx
  804650:	48 01 c0             	add    rax,rax
  804653:	48 01 d0             	add    rax,rdx
  804656:	48 c1 e0 08          	shl    rax,0x8
  80465a:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804661:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804665:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  804669:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80466c:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804670:	c9                   	leave  
  804671:	c3                   	ret    

0000000000804672 <sys_malloc>:

void * sys_malloc(int size)
{
  804672:	f3 0f 1e fa          	endbr64 
  804676:	55                   	push   rbp
  804677:	48 89 e5             	mov    rbp,rsp
  80467a:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  80467d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804680:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804686:	85 c0                	test   eax,eax
  804688:	0f 48 c2             	cmovs  eax,edx
  80468b:	c1 f8 0c             	sar    eax,0xc
  80468e:	89 c1                	mov    ecx,eax
  804690:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804693:	99                   	cdq    
  804694:	c1 ea 14             	shr    edx,0x14
  804697:	01 d0                	add    eax,edx
  804699:	25 ff 0f 00 00       	and    eax,0xfff
  80469e:	29 d0                	sub    eax,edx
  8046a0:	01 c8                	add    eax,ecx
  8046a2:	85 c0                	test   eax,eax
  8046a4:	0f 95 c0             	setne  al
  8046a7:	0f b6 c0             	movzx  eax,al
  8046aa:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8046ad:	8b 05 79 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe79]        # 41452c <cur_proc>
  8046b3:	48 63 d0             	movsxd rdx,eax
  8046b6:	48 89 d0             	mov    rax,rdx
  8046b9:	48 01 c0             	add    rax,rax
  8046bc:	48 01 d0             	add    rax,rdx
  8046bf:	48 c1 e0 08          	shl    rax,0x8
  8046c3:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8046c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8046cb:	48 98                	cdqe   
  8046cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046d1:	eb 0c                	jmp    8046df <sys_malloc+0x6d>
        hp=hp->next;
  8046d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046d7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046e3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046e7:	48 85 c0             	test   rax,rax
  8046ea:	74 16                	je     804702 <sys_malloc+0x90>
  8046ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046f0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046f3:	85 c0                	test   eax,eax
  8046f5:	75 0b                	jne    804702 <sys_malloc+0x90>
  8046f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8046fd:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804700:	7e d1                	jle    8046d3 <sys_malloc+0x61>
    if(hp->pgn<n)
  804702:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804706:	8b 00                	mov    eax,DWORD PTR [rax]
  804708:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80470b:	0f 8e 8d 00 00 00    	jle    80479e <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804711:	8b 05 15 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe15]        # 41452c <cur_proc>
  804717:	48 63 d0             	movsxd rdx,eax
  80471a:	48 89 d0             	mov    rax,rdx
  80471d:	48 01 c0             	add    rax,rax
  804720:	48 01 d0             	add    rax,rdx
  804723:	48 c1 e0 08          	shl    rax,0x8
  804727:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80472d:	8b 10                	mov    edx,DWORD PTR [rax]
  80472f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804732:	c1 e0 0c             	shl    eax,0xc
  804735:	01 d0                	add    eax,edx
  804737:	3d ff ff ef 01       	cmp    eax,0x1efffff
  80473c:	7e 0a                	jle    804748 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  80473e:	b8 00 00 00 00       	mov    eax,0x0
  804743:	e9 cf 00 00 00       	jmp    804817 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804748:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80474c:	8b 10                	mov    edx,DWORD PTR [rax]
  80474e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804751:	29 d0                	sub    eax,edx
  804753:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804756:	8b 05 d0 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdd0]        # 41452c <cur_proc>
  80475c:	48 63 d0             	movsxd rdx,eax
  80475f:	48 89 d0             	mov    rax,rdx
  804762:	48 01 c0             	add    rax,rax
  804765:	48 01 d0             	add    rax,rdx
  804768:	48 c1 e0 08          	shl    rax,0x8
  80476c:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804772:	8b 00                	mov    eax,DWORD PTR [rax]
  804774:	48 98                	cdqe   
  804776:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80477a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804781:	eb 13                	jmp    804796 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804783:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804787:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80478a:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804791:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804792:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804796:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804799:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80479c:	7c e5                	jl     804783 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  80479e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047a2:	8b 00                	mov    eax,DWORD PTR [rax]
  8047a4:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047a7:	7d 59                	jge    804802 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  8047a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047ad:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8047b1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047b4:	83 c0 01             	add    eax,0x1
  8047b7:	c1 e0 0c             	shl    eax,0xc
  8047ba:	48 98                	cdqe   
  8047bc:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8047c0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8047c4:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8047c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8047ce:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8047d1:	8d 50 ff             	lea    edx,[rax-0x1]
  8047d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047d8:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8047da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047de:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8047e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047e6:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8047ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8047ee:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8047f2:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  8047f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047fa:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8047fe:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804802:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804806:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80480d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804811:	48 05 00 10 00 00    	add    rax,0x1000
}
  804817:	5d                   	pop    rbp
  804818:	c3                   	ret    

0000000000804819 <sys_free>:
int sys_free(int ptr)
{
  804819:	f3 0f 1e fa          	endbr64 
  80481d:	55                   	push   rbp
  80481e:	48 89 e5             	mov    rbp,rsp
  804821:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804824:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804827:	2d 00 10 00 00       	sub    eax,0x1000
  80482c:	48 98                	cdqe   
  80482e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  804832:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804836:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  80483d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804841:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804845:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804849:	eb 2e                	jmp    804879 <sys_free+0x60>
    {
        if(p->alloc==0)
  80484b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80484f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804852:	85 c0                	test   eax,eax
  804854:	75 2c                	jne    804882 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804856:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80485a:	8b 10                	mov    edx,DWORD PTR [rax]
  80485c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804860:	8b 00                	mov    eax,DWORD PTR [rax]
  804862:	83 c0 01             	add    eax,0x1
  804865:	01 c2                	add    edx,eax
  804867:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80486b:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  80486d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804871:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804875:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804879:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80487e:	75 cb                	jne    80484b <sys_free+0x32>
  804880:	eb 01                	jmp    804883 <sys_free+0x6a>
            break;
  804882:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804883:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804887:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80488b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80488f:	eb 2e                	jmp    8048bf <sys_free+0xa6>
    {
        if(p->alloc==0)
  804891:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804895:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804898:	85 c0                	test   eax,eax
  80489a:	75 2c                	jne    8048c8 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80489c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048a0:	8b 10                	mov    edx,DWORD PTR [rax]
  8048a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048a6:	8b 00                	mov    eax,DWORD PTR [rax]
  8048a8:	83 c0 01             	add    eax,0x1
  8048ab:	01 c2                	add    edx,eax
  8048ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048b1:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8048b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048b7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048bb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048bf:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048c4:	75 cb                	jne    804891 <sys_free+0x78>
  8048c6:	eb 01                	jmp    8048c9 <sys_free+0xb0>
            break;
  8048c8:	90                   	nop
    }
    //合并完成
    return 0;
  8048c9:	b8 00 00 00 00       	mov    eax,0x0
}
  8048ce:	5d                   	pop    rbp
  8048cf:	c3                   	ret    

00000000008048d0 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8048d0:	f3 0f 1e fa          	endbr64 
  8048d4:	55                   	push   rbp
  8048d5:	48 89 e5             	mov    rbp,rsp
  8048d8:	53                   	push   rbx
  8048d9:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8048dd:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8048e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048e5:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  8048eb:	48 c1 f8 08          	sar    rax,0x8
  8048ef:	48 89 c2             	mov    rdx,rax
  8048f2:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  8048f9:	aa aa aa 
  8048fc:	48 0f af c2          	imul   rax,rdx
  804900:	89 05 26 fc c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0fc26],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  804906:	8b 05 20 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc20]        # 41452c <cur_proc>
  80490c:	48 63 d0             	movsxd rdx,eax
  80490f:	48 89 d0             	mov    rax,rdx
  804912:	48 01 c0             	add    rax,rax
  804915:	48 01 d0             	add    rax,rdx
  804918:	48 c1 e0 08          	shl    rax,0x8
  80491c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804922:	48 89 05 77 fb c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fb77],rax        # 4144a0 <current>
    asm volatile("mov %0,%%rax\n"
  804929:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80492d:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  804934:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804937:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  80493b:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80493f:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804943:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804947:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80494b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80494f:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804953:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804957:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  80495b:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80495f:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804966:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804991 <done>
  80496d:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804974:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  80497b:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804981:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804988:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  80498f:	eb 08                	jmp    804999 <__switch_to>

0000000000804991 <done>:
  804991:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804992:	90                   	nop
  804993:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804997:	c9                   	leave  
  804998:	c3                   	ret    

0000000000804999 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804999:	f3 0f 1e fa          	endbr64 
  80499d:	55                   	push   rbp
  80499e:	48 89 e5             	mov    rbp,rsp
  8049a1:	53                   	push   rbx
  8049a2:	48 83 ec 18          	sub    rsp,0x18
  8049a6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8049aa:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049ae:	48 8b 05 6b 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b6b]        # 80c520 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049b5:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049b9:	48 8b 05 60 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b60]        # 80c520 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049c0:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049c4:	48 8b 05 55 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b55]        # 80c520 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049cb:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049cf:	48 8b 05 4a 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b4a]        # 80c520 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049d6:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049da:	48 8b 05 3f 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b3f]        # 80c520 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049e1:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8049e5:	48 8b 05 34 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b34]        # 80c520 <tss>
  8049ec:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8049f0:	48 8b 05 29 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b29]        # 80c520 <tss>
  8049f7:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  8049fb:	48 8b 05 1e 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b1e]        # 80c520 <tss>
  804a02:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804a06:	48 8b 05 13 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b13]        # 80c520 <tss>
  804a0d:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804a11:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a15:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804a1c:	41 52                	push   r10
  804a1e:	41 51                	push   r9
  804a20:	41 50                	push   r8
  804a22:	57                   	push   rdi
  804a23:	49 89 d9             	mov    r9,rbx
  804a26:	4d 89 d8             	mov    r8,r11
  804a29:	48 89 c7             	mov    rdi,rax
  804a2c:	e8 34 00 00 00       	call   804a65 <set_tss>
  804a31:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804a35:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a39:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804a3d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a41:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804a45:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804a4b:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804a51:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804a57:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  804a5d:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804a5e:	90                   	nop
  804a5f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804a63:	c9                   	leave  
  804a64:	c3                   	ret    

0000000000804a65 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804a65:	f3 0f 1e fa          	endbr64 
  804a69:	55                   	push   rbp
  804a6a:	48 89 e5             	mov    rbp,rsp
  804a6d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804a71:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804a75:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804a79:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804a7d:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804a81:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804a85:	48 8b 05 94 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a94]        # 80c520 <tss>
  804a8c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804a90:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804a94:	48 8b 05 85 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a85]        # 80c520 <tss>
  804a9b:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804a9f:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804aa3:	48 8b 05 76 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a76]        # 80c520 <tss>
  804aaa:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804aae:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804ab2:	48 8b 05 67 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a67]        # 80c520 <tss>
  804ab9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804abd:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804ac1:	48 8b 05 58 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a58]        # 80c520 <tss>
  804ac8:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804acc:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804ad0:	48 8b 05 49 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a49]        # 80c520 <tss>
  804ad7:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804adb:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804adf:	48 8b 05 3a 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a3a]        # 80c520 <tss>
  804ae6:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804aea:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804aee:	48 8b 05 2b 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a2b]        # 80c520 <tss>
  804af5:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804af9:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804afd:	48 8b 05 1c 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a1c]        # 80c520 <tss>
  804b04:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804b08:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804b0c:	48 8b 05 0d 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a0d]        # 80c520 <tss>
  804b13:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804b17:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804b1b:	90                   	nop
  804b1c:	5d                   	pop    rbp
  804b1d:	c3                   	ret    

0000000000804b1e <fork_child_ret>:

int fork_child_ret(){
  804b1e:	f3 0f 1e fa          	endbr64 
  804b22:	55                   	push   rbp
  804b23:	48 89 e5             	mov    rbp,rsp
    return 0;
  804b26:	b8 00 00 00 00       	mov    eax,0x0

}
  804b2b:	5d                   	pop    rbp
  804b2c:	c3                   	ret    

0000000000804b2d <sys_fork>:

int sys_fork(void){
  804b2d:	f3 0f 1e fa          	endbr64 
  804b31:	55                   	push   rbp
  804b32:	48 89 e5             	mov    rbp,rsp
  804b35:	53                   	push   rbx
  804b36:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804b3a:	b8 00 00 00 00       	mov    eax,0x0
  804b3f:	e8 80 ed ff ff       	call   8038c4 <req_proc>
  804b44:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804b47:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804b4b:	75 0a                	jne    804b57 <sys_fork+0x2a>
  804b4d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b52:	e9 17 08 00 00       	jmp    80536e <sys_fork+0x841>
    task[pid].regs=current->regs;
  804b57:	48 8b 05 42 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f942]        # 4144a0 <current>
  804b5e:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b61:	48 63 ca             	movsxd rcx,edx
  804b64:	48 89 ca             	mov    rdx,rcx
  804b67:	48 01 d2             	add    rdx,rdx
  804b6a:	48 01 ca             	add    rdx,rcx
  804b6d:	48 c1 e2 08          	shl    rdx,0x8
  804b71:	48 81 c2 d0 86 40 00 	add    rdx,0x4086d0
  804b78:	48 8b 88 30 02 00 00 	mov    rcx,QWORD PTR [rax+0x230]
  804b7f:	48 8b 98 38 02 00 00 	mov    rbx,QWORD PTR [rax+0x238]
  804b86:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  804b89:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  804b8d:	48 8b 88 40 02 00 00 	mov    rcx,QWORD PTR [rax+0x240]
  804b94:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
  804b9b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  804b9f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  804ba3:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
  804baa:	48 8b 98 58 02 00 00 	mov    rbx,QWORD PTR [rax+0x258]
  804bb1:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  804bb5:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  804bb9:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
  804bc0:	48 8b 98 68 02 00 00 	mov    rbx,QWORD PTR [rax+0x268]
  804bc7:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  804bcb:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  804bcf:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
  804bd6:	48 8b 98 78 02 00 00 	mov    rbx,QWORD PTR [rax+0x278]
  804bdd:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  804be1:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  804be5:	48 8b 88 80 02 00 00 	mov    rcx,QWORD PTR [rax+0x280]
  804bec:	48 8b 98 88 02 00 00 	mov    rbx,QWORD PTR [rax+0x288]
  804bf3:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  804bf7:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  804bfb:	48 8b 88 90 02 00 00 	mov    rcx,QWORD PTR [rax+0x290]
  804c02:	48 8b 98 98 02 00 00 	mov    rbx,QWORD PTR [rax+0x298]
  804c09:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  804c0d:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  804c11:	48 8b 88 a0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a0]
  804c18:	48 8b 98 a8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2a8]
  804c1f:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  804c23:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  804c27:	48 8b 88 b0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b0]
  804c2e:	48 8b 98 b8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2b8]
  804c35:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  804c3c:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  804c43:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
  804c4a:	48 8b 98 c8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2c8]
  804c51:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  804c58:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  804c5f:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
  804c66:	48 8b 98 d8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2d8]
  804c6d:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  804c74:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  804c7b:	48 8b 88 e0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e0]
  804c82:	48 8b 98 e8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2e8]
  804c89:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  804c90:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  804c97:	48 8b 88 f0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f0]
  804c9e:	48 8b 98 f8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2f8]
  804ca5:	48 89 8a c0 00 00 00 	mov    QWORD PTR [rdx+0xc0],rcx
  804cac:	48 89 9a c8 00 00 00 	mov    QWORD PTR [rdx+0xc8],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804cb3:	b9 a1 c4 80 00       	mov    ecx,0x80c4a1
  804cb8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cbb:	48 63 d0             	movsxd rdx,eax
  804cbe:	48 89 d0             	mov    rax,rdx
  804cc1:	48 01 c0             	add    rax,rax
  804cc4:	48 01 d0             	add    rax,rdx
  804cc7:	48 c1 e0 08          	shl    rax,0x8
  804ccb:	48 05 d8 86 40 00    	add    rax,0x4086d8
  804cd1:	48 89 08             	mov    QWORD PTR [rax],rcx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804cd4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cd7:	48 63 d0             	movsxd rdx,eax
  804cda:	48 89 d0             	mov    rax,rdx
  804cdd:	48 01 c0             	add    rax,rax
  804ce0:	48 01 d0             	add    rax,rdx
  804ce3:	48 c1 e0 08          	shl    rax,0x8
  804ce7:	48 05 08 87 40 00    	add    rax,0x408708
  804ced:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804cf0:	48 2d a8 00 00 00    	sub    rax,0xa8
  804cf6:	48 89 c1             	mov    rcx,rax
  804cf9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cfc:	48 63 d0             	movsxd rdx,eax
  804cff:	48 89 d0             	mov    rax,rdx
  804d02:	48 01 c0             	add    rax,rax
  804d05:	48 01 d0             	add    rax,rdx
  804d08:	48 c1 e0 08          	shl    rax,0x8
  804d0c:	48 05 08 87 40 00    	add    rax,0x408708
  804d12:	48 89 08             	mov    QWORD PTR [rax],rcx
    stack_store_regs *r=task[pid].regs.rsp;
  804d15:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d18:	48 63 d0             	movsxd rdx,eax
  804d1b:	48 89 d0             	mov    rax,rdx
  804d1e:	48 01 c0             	add    rax,rax
  804d21:	48 01 d0             	add    rax,rdx
  804d24:	48 c1 e0 08          	shl    rax,0x8
  804d28:	48 05 08 87 40 00    	add    rax,0x408708
  804d2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d31:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804d35:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d39:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804d40:	00 
    r->ds=DS_USER;
  804d41:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d45:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804d4c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d50:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804d57:	28 00 00 00 
    r->es=DS_USER;
  804d5b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d5f:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804d66:	00 
    r->rax=task[pid].regs.rax;
  804d67:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d6a:	48 63 d0             	movsxd rdx,eax
  804d6d:	48 89 d0             	mov    rax,rdx
  804d70:	48 01 c0             	add    rax,rax
  804d73:	48 01 d0             	add    rax,rdx
  804d76:	48 c1 e0 08          	shl    rax,0x8
  804d7a:	48 05 e8 86 40 00    	add    rax,0x4086e8
  804d80:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d83:	48 89 c2             	mov    rdx,rax
  804d86:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d8a:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804d8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d91:	48 63 d0             	movsxd rdx,eax
  804d94:	48 89 d0             	mov    rax,rdx
  804d97:	48 01 c0             	add    rax,rax
  804d9a:	48 01 d0             	add    rax,rdx
  804d9d:	48 c1 e0 08          	shl    rax,0x8
  804da1:	48 05 00 87 40 00    	add    rax,0x408700
  804da7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804daa:	48 89 c2             	mov    rdx,rax
  804dad:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804db1:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804db5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804db8:	48 63 d0             	movsxd rdx,eax
  804dbb:	48 89 d0             	mov    rax,rdx
  804dbe:	48 01 c0             	add    rax,rax
  804dc1:	48 01 d0             	add    rax,rdx
  804dc4:	48 c1 e0 08          	shl    rax,0x8
  804dc8:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804dce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dd1:	48 89 c2             	mov    rdx,rax
  804dd4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dd8:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804ddc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ddf:	48 63 d0             	movsxd rdx,eax
  804de2:	48 89 d0             	mov    rax,rdx
  804de5:	48 01 c0             	add    rax,rax
  804de8:	48 01 d0             	add    rax,rdx
  804deb:	48 c1 e0 08          	shl    rax,0x8
  804def:	48 05 f8 86 40 00    	add    rax,0x4086f8
  804df5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804df8:	48 89 c2             	mov    rdx,rax
  804dfb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dff:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804e03:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e06:	48 63 d0             	movsxd rdx,eax
  804e09:	48 89 d0             	mov    rax,rdx
  804e0c:	48 01 c0             	add    rax,rax
  804e0f:	48 01 d0             	add    rax,rdx
  804e12:	48 c1 e0 08          	shl    rax,0x8
  804e16:	48 05 18 87 40 00    	add    rax,0x408718
  804e1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e1f:	48 89 c2             	mov    rdx,rax
  804e22:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e26:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804e2a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e2d:	48 63 d0             	movsxd rdx,eax
  804e30:	48 89 d0             	mov    rax,rdx
  804e33:	48 01 c0             	add    rax,rax
  804e36:	48 01 d0             	add    rax,rdx
  804e39:	48 c1 e0 08          	shl    rax,0x8
  804e3d:	48 05 20 87 40 00    	add    rax,0x408720
  804e43:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e46:	48 89 c2             	mov    rdx,rax
  804e49:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e4d:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804e51:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e54:	48 63 d0             	movsxd rdx,eax
  804e57:	48 89 d0             	mov    rax,rdx
  804e5a:	48 01 c0             	add    rax,rax
  804e5d:	48 01 d0             	add    rax,rdx
  804e60:	48 c1 e0 08          	shl    rax,0x8
  804e64:	48 05 58 87 40 00    	add    rax,0x408758
  804e6a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e6d:	48 89 c2             	mov    rdx,rax
  804e70:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e74:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804e78:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e7b:	48 63 d0             	movsxd rdx,eax
  804e7e:	48 89 d0             	mov    rax,rdx
  804e81:	48 01 c0             	add    rax,rax
  804e84:	48 01 d0             	add    rax,rdx
  804e87:	48 c1 e0 08          	shl    rax,0x8
  804e8b:	48 05 60 87 40 00    	add    rax,0x408760
  804e91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e94:	48 89 c2             	mov    rdx,rax
  804e97:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e9b:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804e9f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ea2:	48 63 d0             	movsxd rdx,eax
  804ea5:	48 89 d0             	mov    rax,rdx
  804ea8:	48 01 c0             	add    rax,rax
  804eab:	48 01 d0             	add    rax,rdx
  804eae:	48 c1 e0 08          	shl    rax,0x8
  804eb2:	48 05 68 87 40 00    	add    rax,0x408768
  804eb8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ebb:	48 89 c2             	mov    rdx,rax
  804ebe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ec2:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804ec6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ec9:	48 63 d0             	movsxd rdx,eax
  804ecc:	48 89 d0             	mov    rax,rdx
  804ecf:	48 01 c0             	add    rax,rax
  804ed2:	48 01 d0             	add    rax,rdx
  804ed5:	48 c1 e0 08          	shl    rax,0x8
  804ed9:	48 05 70 87 40 00    	add    rax,0x408770
  804edf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ee2:	48 89 c2             	mov    rdx,rax
  804ee5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ee9:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804eed:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ef0:	48 63 d0             	movsxd rdx,eax
  804ef3:	48 89 d0             	mov    rax,rdx
  804ef6:	48 01 c0             	add    rax,rax
  804ef9:	48 01 d0             	add    rax,rdx
  804efc:	48 c1 e0 08          	shl    rax,0x8
  804f00:	48 05 78 87 40 00    	add    rax,0x408778
  804f06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f09:	48 89 c2             	mov    rdx,rax
  804f0c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f10:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804f14:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f17:	48 63 d0             	movsxd rdx,eax
  804f1a:	48 89 d0             	mov    rax,rdx
  804f1d:	48 01 c0             	add    rax,rax
  804f20:	48 01 d0             	add    rax,rdx
  804f23:	48 c1 e0 08          	shl    rax,0x8
  804f27:	48 05 80 87 40 00    	add    rax,0x408780
  804f2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f30:	48 89 c2             	mov    rdx,rax
  804f33:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f37:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804f3b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f3e:	48 63 d0             	movsxd rdx,eax
  804f41:	48 89 d0             	mov    rax,rdx
  804f44:	48 01 c0             	add    rax,rax
  804f47:	48 01 d0             	add    rax,rdx
  804f4a:	48 c1 e0 08          	shl    rax,0x8
  804f4e:	48 05 88 87 40 00    	add    rax,0x408788
  804f54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f57:	48 89 c2             	mov    rdx,rax
  804f5a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f5e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804f62:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f65:	48 63 d0             	movsxd rdx,eax
  804f68:	48 89 d0             	mov    rax,rdx
  804f6b:	48 01 c0             	add    rax,rax
  804f6e:	48 01 d0             	add    rax,rdx
  804f71:	48 c1 e0 08          	shl    rax,0x8
  804f75:	48 05 90 87 40 00    	add    rax,0x408790
  804f7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f7e:	48 89 c2             	mov    rdx,rax
  804f81:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f85:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804f89:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f8d:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804f94:	48 8b 05 05 f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f505]        # 4144a0 <current>
  804f9b:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f9e:	48 63 ca             	movsxd rcx,edx
  804fa1:	48 89 ca             	mov    rdx,rcx
  804fa4:	48 01 d2             	add    rdx,rdx
  804fa7:	48 01 ca             	add    rdx,rcx
  804faa:	48 c1 e2 08          	shl    rdx,0x8
  804fae:	48 81 c2 60 86 40 00 	add    rdx,0x408660
  804fb5:	48 8b 88 c4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1c4]
  804fbc:	48 8b 98 cc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1cc]
  804fc3:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804fc7:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804fcb:	48 8b 88 d4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d4]
  804fd2:	48 8b 98 dc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1dc]
  804fd9:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804fdd:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804fe1:	48 8b 88 e4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e4]
  804fe8:	48 8b 98 ec 01 00 00 	mov    rbx,QWORD PTR [rax+0x1ec]
  804fef:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804ff3:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804ff7:	48 8b 88 f4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f4]
  804ffe:	48 8b 98 fc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1fc]
  805005:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  805009:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  80500d:	48 8b 88 04 02 00 00 	mov    rcx,QWORD PTR [rax+0x204]
  805014:	48 8b 98 0c 02 00 00 	mov    rbx,QWORD PTR [rax+0x20c]
  80501b:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  80501f:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  805023:	48 8b 88 14 02 00 00 	mov    rcx,QWORD PTR [rax+0x214]
  80502a:	48 8b 98 1c 02 00 00 	mov    rbx,QWORD PTR [rax+0x21c]
  805031:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  805035:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  805039:	48 8b 88 24 02 00 00 	mov    rcx,QWORD PTR [rax+0x224]
  805040:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  805044:	8b 80 2c 02 00 00    	mov    eax,DWORD PTR [rax+0x22c]
  80504a:	89 42 6c             	mov    DWORD PTR [rdx+0x6c],eax
    task[pid].stat=READY;
  80504d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805050:	48 63 d0             	movsxd rdx,eax
  805053:	48 89 d0             	mov    rax,rdx
  805056:	48 01 c0             	add    rax,rax
  805059:	48 01 d0             	add    rax,rdx
  80505c:	48 c1 e0 08          	shl    rax,0x8
  805060:	48 05 a4 84 40 00    	add    rax,0x4084a4
  805066:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  80506c:	8b 05 ba f4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f4ba]        # 41452c <cur_proc>
  805072:	89 c1                	mov    ecx,eax
  805074:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805077:	48 63 d0             	movsxd rdx,eax
  80507a:	48 89 d0             	mov    rax,rdx
  80507d:	48 01 c0             	add    rax,rax
  805080:	48 01 d0             	add    rax,rdx
  805083:	48 c1 e0 08          	shl    rax,0x8
  805087:	48 05 28 85 40 00    	add    rax,0x408528
  80508d:	89 08                	mov    DWORD PTR [rax],ecx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  80508f:	48 8b 05 0a f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f40a]        # 4144a0 <current>
  805096:	48 8d 88 c4 00 00 00 	lea    rcx,[rax+0xc4]
  80509d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050a0:	48 63 d0             	movsxd rdx,eax
  8050a3:	48 89 d0             	mov    rax,rdx
  8050a6:	48 01 c0             	add    rax,rax
  8050a9:	48 01 d0             	add    rax,rdx
  8050ac:	48 c1 e0 08          	shl    rax,0x8
  8050b0:	48 05 c0 00 00 00    	add    rax,0xc0
  8050b6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8050bc:	48 83 c0 04          	add    rax,0x4
  8050c0:	ba 00 01 00 00       	mov    edx,0x100
  8050c5:	48 89 ce             	mov    rsi,rcx
  8050c8:	48 89 c7             	mov    rdi,rax
  8050cb:	e8 31 6a 00 00       	call   80bb01 <memcpy>
    task[pid].utime=0;
  8050d0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050d3:	48 63 d0             	movsxd rdx,eax
  8050d6:	48 89 d0             	mov    rax,rdx
  8050d9:	48 01 c0             	add    rax,rax
  8050dc:	48 01 d0             	add    rax,rdx
  8050df:	48 c1 e0 08          	shl    rax,0x8
  8050e3:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8050e9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  8050ef:	48 8b 0d aa f3 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f3aa]        # 4144a0 <current>
  8050f6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050f9:	48 63 d0             	movsxd rdx,eax
  8050fc:	48 89 d0             	mov    rax,rdx
  8050ff:	48 01 c0             	add    rax,rax
  805102:	48 01 d0             	add    rax,rdx
  805105:	48 c1 e0 08          	shl    rax,0x8
  805109:	48 8d b0 b0 84 40 00 	lea    rsi,[rax+0x4084b0]
  805110:	48 8b 41 14          	mov    rax,QWORD PTR [rcx+0x14]
  805114:	48 8b 51 1c          	mov    rdx,QWORD PTR [rcx+0x1c]
  805118:	48 89 46 04          	mov    QWORD PTR [rsi+0x4],rax
  80511c:	48 89 56 0c          	mov    QWORD PTR [rsi+0xc],rdx
  805120:	48 8b 41 24          	mov    rax,QWORD PTR [rcx+0x24]
  805124:	48 8b 51 2c          	mov    rdx,QWORD PTR [rcx+0x2c]
  805128:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
  80512c:	48 89 56 1c          	mov    QWORD PTR [rsi+0x1c],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  805130:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805133:	48 63 d0             	movsxd rdx,eax
  805136:	48 89 d0             	mov    rax,rdx
  805139:	48 01 c0             	add    rax,rax
  80513c:	48 01 d0             	add    rax,rdx
  80513f:	48 c1 e0 08          	shl    rax,0x8
  805143:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80514a:	48 8b 05 4f f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f34f]        # 4144a0 <current>
  805151:	48 89 d6             	mov    rsi,rdx
  805154:	48 89 c7             	mov    rdi,rax
  805157:	e8 1a 05 00 00       	call   805676 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  80515c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80515f:	48 63 d0             	movsxd rdx,eax
  805162:	48 89 d0             	mov    rax,rdx
  805165:	48 01 c0             	add    rax,rax
  805168:	48 01 d0             	add    rax,rdx
  80516b:	48 c1 e0 08          	shl    rax,0x8
  80516f:	48 05 c0 84 40 00    	add    rax,0x4084c0
  805175:	8b 00                	mov    eax,DWORD PTR [rax]
  805177:	2d 00 10 00 00       	sub    eax,0x1000
  80517c:	48 98                	cdqe   
  80517e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805182:	eb 63                	jmp    8051e7 <sys_fork+0x6ba>
        addr_t new_stkpg=vmalloc();
  805184:	b8 00 00 00 00       	mov    eax,0x0
  805189:	e8 2b c1 ff ff       	call   8012b9 <vmalloc>
  80518e:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805192:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805196:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80519a:	ba 00 10 00 00       	mov    edx,0x1000
  80519f:	48 89 ce             	mov    rsi,rcx
  8051a2:	48 89 c7             	mov    rdi,rax
  8051a5:	e8 57 69 00 00       	call   80bb01 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8051aa:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051ad:	48 63 d0             	movsxd rdx,eax
  8051b0:	48 89 d0             	mov    rax,rdx
  8051b3:	48 01 c0             	add    rax,rax
  8051b6:	48 01 d0             	add    rax,rdx
  8051b9:	48 c1 e0 08          	shl    rax,0x8
  8051bd:	48 05 40 85 40 00    	add    rax,0x408540
  8051c3:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  8051c7:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8051cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8051cf:	48 89 d1             	mov    rcx,rdx
  8051d2:	ba 07 00 00 00       	mov    edx,0x7
  8051d7:	48 89 c7             	mov    rdi,rax
  8051da:	e8 8a be ff ff       	call   801069 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8051df:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  8051e6:	00 
  8051e7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051ea:	48 63 d0             	movsxd rdx,eax
  8051ed:	48 89 d0             	mov    rax,rdx
  8051f0:	48 01 c0             	add    rax,rax
  8051f3:	48 01 d0             	add    rax,rdx
  8051f6:	48 c1 e0 08          	shl    rax,0x8
  8051fa:	48 05 bc 84 40 00    	add    rax,0x4084bc
  805200:	8b 00                	mov    eax,DWORD PTR [rax]
  805202:	48 98                	cdqe   
  805204:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805208:	0f 83 76 ff ff ff    	jae    805184 <sys_fork+0x657>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  80520e:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805215:	00 
    int f=1;
  805216:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  80521d:	e9 89 00 00 00       	jmp    8052ab <sys_fork+0x77e>
        addr_t new_stkpg=vmalloc();
  805222:	b8 00 00 00 00       	mov    eax,0x0
  805227:	e8 8d c0 ff ff       	call   8012b9 <vmalloc>
  80522c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805230:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805234:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805238:	ba 00 10 00 00       	mov    edx,0x1000
  80523d:	48 89 ce             	mov    rsi,rcx
  805240:	48 89 c7             	mov    rdi,rax
  805243:	e8 b9 68 00 00       	call   80bb01 <memcpy>
        if(f){
  805248:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80524c:	74 20                	je     80526e <sys_fork+0x741>
            f=0;
  80524e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805255:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805259:	48 05 c8 0f 00 00    	add    rax,0xfc8
  80525f:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805263:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805267:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80526e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805271:	48 63 d0             	movsxd rdx,eax
  805274:	48 89 d0             	mov    rax,rdx
  805277:	48 01 c0             	add    rax,rax
  80527a:	48 01 d0             	add    rax,rdx
  80527d:	48 c1 e0 08          	shl    rax,0x8
  805281:	48 05 40 85 40 00    	add    rax,0x408540
  805287:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  80528b:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80528f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805293:	48 89 d1             	mov    rcx,rdx
  805296:	ba 07 00 00 00       	mov    edx,0x7
  80529b:	48 89 c7             	mov    rdi,rax
  80529e:	e8 c6 bd ff ff       	call   801069 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8052a3:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  8052aa:	00 
  8052ab:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  8052b2:	00 
  8052b3:	0f 87 69 ff ff ff    	ja     805222 <sys_fork+0x6f5>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  8052b9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052bc:	48 63 d0             	movsxd rdx,eax
  8052bf:	48 89 d0             	mov    rax,rdx
  8052c2:	48 01 c0             	add    rax,rax
  8052c5:	48 01 d0             	add    rax,rdx
  8052c8:	48 c1 e0 08          	shl    rax,0x8
  8052cc:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8052d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8052d4:	2d 00 10 00 00       	sub    eax,0x1000
  8052d9:	48 98                	cdqe   
  8052db:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8052df:	eb 63                	jmp    805344 <sys_fork+0x817>
        addr_t new_hppg=vmalloc();
  8052e1:	b8 00 00 00 00       	mov    eax,0x0
  8052e6:	e8 ce bf ff ff       	call   8012b9 <vmalloc>
  8052eb:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8052ef:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8052f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052f7:	ba 00 10 00 00       	mov    edx,0x1000
  8052fc:	48 89 ce             	mov    rsi,rcx
  8052ff:	48 89 c7             	mov    rdi,rax
  805302:	e8 fa 67 00 00       	call   80bb01 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805307:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80530a:	48 63 d0             	movsxd rdx,eax
  80530d:	48 89 d0             	mov    rax,rdx
  805310:	48 01 c0             	add    rax,rax
  805313:	48 01 d0             	add    rax,rdx
  805316:	48 c1 e0 08          	shl    rax,0x8
  80531a:	48 05 40 85 40 00    	add    rax,0x408540
  805320:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805324:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805328:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80532c:	48 89 d1             	mov    rcx,rdx
  80532f:	ba 07 00 00 00       	mov    edx,0x7
  805334:	48 89 c7             	mov    rdi,rax
  805337:	e8 2d bd ff ff       	call   801069 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  80533c:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805343:	00 
  805344:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805347:	48 63 d0             	movsxd rdx,eax
  80534a:	48 89 d0             	mov    rax,rdx
  80534d:	48 01 c0             	add    rax,rax
  805350:	48 01 d0             	add    rax,rdx
  805353:	48 c1 e0 08          	shl    rax,0x8
  805357:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80535d:	8b 00                	mov    eax,DWORD PTR [rax]
  80535f:	48 98                	cdqe   
  805361:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805365:	0f 83 76 ff ff ff    	jae    8052e1 <sys_fork+0x7b4>
    }
    //父进程运行到这里
    return pid;
  80536b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  80536e:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805372:	c9                   	leave  
  805373:	c3                   	ret    

0000000000805374 <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805374:	f3 0f 1e fa          	endbr64 
  805378:	55                   	push   rbp
  805379:	48 89 e5             	mov    rbp,rsp
  80537c:	48 83 ec 50          	sub    rsp,0x50
  805380:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805384:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805388:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  80538f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805393:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805397:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  80539b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8053a2:	e9 be 02 00 00       	jmp    805665 <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8053a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053aa:	48 98                	cdqe   
  8053ac:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053b3:	00 
  8053b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053b8:	48 01 d0             	add    rax,rdx
  8053bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053be:	83 e0 01             	and    eax,0x1
  8053c1:	48 85 c0             	test   rax,rax
  8053c4:	0f 84 97 02 00 00    	je     805661 <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8053ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053cd:	48 98                	cdqe   
  8053cf:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053d6:	00 
  8053d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053db:	48 01 d0             	add    rax,rdx
  8053de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053e1:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8053e8:	ff 00 00 
  8053eb:	48 21 d0             	and    rax,rdx
  8053ee:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  8053f2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8053f6:	0f 94 c0             	sete   al
  8053f9:	0f b6 c0             	movzx  eax,al
  8053fc:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  8053ff:	e9 24 02 00 00       	jmp    805628 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805404:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805407:	48 98                	cdqe   
  805409:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805410:	00 
  805411:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805415:	48 01 d0             	add    rax,rdx
  805418:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80541b:	83 e0 01             	and    eax,0x1
  80541e:	48 85 c0             	test   rax,rax
  805421:	0f 84 fd 01 00 00    	je     805624 <release_mmap+0x2b0>
  805427:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80542a:	48 98                	cdqe   
  80542c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805433:	00 
  805434:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805438:	48 01 d0             	add    rax,rdx
  80543b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80543e:	25 80 00 00 00       	and    eax,0x80
  805443:	48 85 c0             	test   rax,rax
  805446:	0f 85 d8 01 00 00    	jne    805624 <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  80544c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80544f:	48 98                	cdqe   
  805451:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805458:	00 
  805459:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80545d:	48 01 d0             	add    rax,rdx
  805460:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805463:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80546a:	ff 00 00 
  80546d:	48 21 d0             	and    rax,rdx
  805470:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805474:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80547b:	e9 6b 01 00 00       	jmp    8055eb <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805480:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805483:	48 98                	cdqe   
  805485:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80548c:	00 
  80548d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805491:	48 01 d0             	add    rax,rdx
  805494:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805497:	83 e0 01             	and    eax,0x1
  80549a:	48 85 c0             	test   rax,rax
  80549d:	0f 84 dc 00 00 00    	je     80557f <release_mmap+0x20b>
  8054a3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8054a6:	48 98                	cdqe   
  8054a8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054af:	00 
  8054b0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054b4:	48 01 d0             	add    rax,rdx
  8054b7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054ba:	25 80 00 00 00       	and    eax,0x80
  8054bf:	48 85 c0             	test   rax,rax
  8054c2:	0f 85 b7 00 00 00    	jne    80557f <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  8054c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8054cb:	48 98                	cdqe   
  8054cd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054d4:	00 
  8054d5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054d9:	48 01 d0             	add    rax,rdx
  8054dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054df:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8054e6:	ff 00 00 
  8054e9:	48 21 d0             	and    rax,rdx
  8054ec:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  8054f0:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8054f7:	eb 4f                	jmp    805548 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  8054f9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8054fc:	48 98                	cdqe   
  8054fe:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805505:	00 
  805506:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80550a:	48 01 d0             	add    rax,rdx
  80550d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805510:	83 e0 01             	and    eax,0x1
  805513:	48 85 c0             	test   rax,rax
  805516:	74 2c                	je     805544 <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  805518:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80551b:	48 98                	cdqe   
  80551d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805524:	00 
  805525:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805529:	48 01 d0             	add    rax,rdx
  80552c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80552f:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805536:	ff 00 00 
  805539:	48 21 d0             	and    rax,rdx
  80553c:	48 89 c7             	mov    rdi,rax
  80553f:	e8 f8 c1 ff ff       	call   80173c <free_page>
                            for(int l=0;l<512;l++){
  805544:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805548:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  80554f:	7e a8                	jle    8054f9 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805551:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805554:	48 98                	cdqe   
  805556:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80555d:	00 
  80555e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805562:	48 01 d0             	add    rax,rdx
  805565:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805568:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80556f:	ff 00 00 
  805572:	48 21 d0             	and    rax,rdx
  805575:	48 89 c7             	mov    rdi,rax
  805578:	e8 cb bd ff ff       	call   801348 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80557d:	eb 68                	jmp    8055e7 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  80557f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805582:	48 98                	cdqe   
  805584:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80558b:	00 
  80558c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805590:	48 01 d0             	add    rax,rdx
  805593:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805596:	83 e0 01             	and    eax,0x1
  805599:	48 85 c0             	test   rax,rax
  80559c:	74 49                	je     8055e7 <release_mmap+0x273>
  80559e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8055a1:	48 98                	cdqe   
  8055a3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055aa:	00 
  8055ab:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055af:	48 01 d0             	add    rax,rdx
  8055b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055b5:	25 80 00 00 00       	and    eax,0x80
  8055ba:	48 85 c0             	test   rax,rax
  8055bd:	74 28                	je     8055e7 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  8055bf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8055c2:	48 98                	cdqe   
  8055c4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055cb:	00 
  8055cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055d0:	48 01 d0             	add    rax,rdx
  8055d3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055d6:	25 00 f0 ff ff       	and    eax,0xfffff000
  8055db:	be 00 02 00 00       	mov    esi,0x200
  8055e0:	89 c7                	mov    edi,eax
  8055e2:	e8 d9 c1 ff ff       	call   8017c0 <free_pages_at>
                    for(int k=0;k<512;k++)
  8055e7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8055eb:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8055f2:	0f 8e 88 fe ff ff    	jle    805480 <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  8055f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055fb:	48 98                	cdqe   
  8055fd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805604:	00 
  805605:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805609:	48 01 d0             	add    rax,rdx
  80560c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80560f:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805616:	ff 00 00 
  805619:	48 21 d0             	and    rax,rdx
  80561c:	48 89 c7             	mov    rdi,rax
  80561f:	e8 24 bd ff ff       	call   801348 <vmfree>
            for(;j<512;j++)
  805624:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805628:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  80562f:	0f 8e cf fd ff ff    	jle    805404 <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  805635:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805638:	48 98                	cdqe   
  80563a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805641:	00 
  805642:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805646:	48 01 d0             	add    rax,rdx
  805649:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80564c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805653:	ff 00 00 
  805656:	48 21 d0             	and    rax,rdx
  805659:	48 89 c7             	mov    rdi,rax
  80565c:	e8 e7 bc ff ff       	call   801348 <vmfree>
    for(int i=0;i<512;i++)
  805661:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805665:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  80566c:	0f 8e 35 fd ff ff    	jle    8053a7 <release_mmap+0x33>
        }
    }
}
  805672:	90                   	nop
  805673:	90                   	nop
  805674:	c9                   	leave  
  805675:	c3                   	ret    

0000000000805676 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805676:	f3 0f 1e fa          	endbr64 
  80567a:	55                   	push   rbp
  80567b:	48 89 e5             	mov    rbp,rsp
  80567e:	48 83 ec 60          	sub    rsp,0x60
  805682:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805686:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  80568a:	b8 00 00 00 00       	mov    eax,0x0
  80568f:	e8 25 bc ff ff       	call   8012b9 <vmalloc>
  805694:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805698:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80569c:	48 8b 80 30 02 00 00 	mov    rax,QWORD PTR [rax+0x230]
  8056a3:	48 89 c1             	mov    rcx,rax
  8056a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8056aa:	ba 00 10 00 00       	mov    edx,0x1000
  8056af:	48 89 ce             	mov    rsi,rcx
  8056b2:	48 89 c7             	mov    rdi,rax
  8056b5:	e8 47 64 00 00       	call   80bb01 <memcpy>
    to->regs.cr3=pml4p;
  8056ba:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8056be:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8056c2:	48 89 90 30 02 00 00 	mov    QWORD PTR [rax+0x230],rdx
    to->pml4=pml4p;
  8056c9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8056cd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8056d1:	48 89 90 ac 00 00 00 	mov    QWORD PTR [rax+0xac],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  8056d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8056dc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  8056e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8056e7:	e9 09 03 00 00       	jmp    8059f5 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8056ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056ef:	48 98                	cdqe   
  8056f1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056f8:	00 
  8056f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8056fd:	48 01 d0             	add    rax,rdx
  805700:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805703:	83 e0 01             	and    eax,0x1
  805706:	48 85 c0             	test   rax,rax
  805709:	0f 84 e2 02 00 00    	je     8059f1 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  80570f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805712:	48 98                	cdqe   
  805714:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80571b:	00 
  80571c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805720:	48 01 d0             	add    rax,rdx
  805723:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805726:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  80572a:	b8 00 00 00 00       	mov    eax,0x0
  80572f:	e8 85 bb ff ff       	call   8012b9 <vmalloc>
  805734:	48 89 c2             	mov    rdx,rax
  805737:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80573e:	00 ff ff 
  805741:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805745:	48 89 c1             	mov    rcx,rax
  805748:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80574b:	48 98                	cdqe   
  80574d:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805754:	00 
  805755:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805759:	48 01 f0             	add    rax,rsi
  80575c:	48 09 ca             	or     rdx,rcx
  80575f:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805762:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805769:	ff 00 00 
  80576c:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805770:	48 89 c1             	mov    rcx,rax
  805773:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805776:	48 98                	cdqe   
  805778:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80577f:	00 
  805780:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805784:	48 01 d0             	add    rax,rdx
  805787:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80578a:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805791:	ff 00 00 
  805794:	48 21 d0             	and    rax,rdx
  805797:	ba 00 10 00 00       	mov    edx,0x1000
  80579c:	48 89 ce             	mov    rsi,rcx
  80579f:	48 89 c7             	mov    rdi,rax
  8057a2:	e8 5a 63 00 00       	call   80bb01 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8057a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057aa:	48 98                	cdqe   
  8057ac:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057b3:	00 
  8057b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057b8:	48 01 d0             	add    rax,rdx
  8057bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8057be:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8057c5:	ff 00 00 
  8057c8:	48 21 d0             	and    rax,rdx
  8057cb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  8057cf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8057d6:	e9 09 02 00 00       	jmp    8059e4 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8057db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8057de:	48 98                	cdqe   
  8057e0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057e7:	00 
  8057e8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8057ec:	48 01 d0             	add    rax,rdx
  8057ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8057f2:	83 e0 01             	and    eax,0x1
  8057f5:	48 85 c0             	test   rax,rax
  8057f8:	0f 84 e2 01 00 00    	je     8059e0 <copy_mmap+0x36a>
  8057fe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805801:	48 98                	cdqe   
  805803:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80580a:	00 
  80580b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80580f:	48 01 d0             	add    rax,rdx
  805812:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805815:	25 80 00 00 00       	and    eax,0x80
  80581a:	48 85 c0             	test   rax,rax
  80581d:	0f 85 bd 01 00 00    	jne    8059e0 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805823:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805826:	48 98                	cdqe   
  805828:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80582f:	00 
  805830:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805834:	48 01 d0             	add    rax,rdx
  805837:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80583a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  80583e:	b8 00 00 00 00       	mov    eax,0x0
  805843:	e8 71 ba ff ff       	call   8012b9 <vmalloc>
  805848:	48 89 c2             	mov    rdx,rax
  80584b:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805852:	00 ff ff 
  805855:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805859:	48 89 c1             	mov    rcx,rax
  80585c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80585f:	48 98                	cdqe   
  805861:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805868:	00 
  805869:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80586d:	48 01 f0             	add    rax,rsi
  805870:	48 09 ca             	or     rdx,rcx
  805873:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805876:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80587d:	ff 00 00 
  805880:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805884:	48 89 c1             	mov    rcx,rax
  805887:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80588a:	48 98                	cdqe   
  80588c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805893:	00 
  805894:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805898:	48 01 d0             	add    rax,rdx
  80589b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80589e:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8058a5:	ff 00 00 
  8058a8:	48 21 d0             	and    rax,rdx
  8058ab:	ba 00 10 00 00       	mov    edx,0x1000
  8058b0:	48 89 ce             	mov    rsi,rcx
  8058b3:	48 89 c7             	mov    rdi,rax
  8058b6:	e8 46 62 00 00       	call   80bb01 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  8058bb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8058be:	48 98                	cdqe   
  8058c0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058c7:	00 
  8058c8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058cc:	48 01 d0             	add    rax,rdx
  8058cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8058d2:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8058d9:	ff 00 00 
  8058dc:	48 21 d0             	and    rax,rdx
  8058df:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  8058e3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8058ea:	e9 e4 00 00 00       	jmp    8059d3 <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  8058ef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8058f2:	48 98                	cdqe   
  8058f4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058fb:	00 
  8058fc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805900:	48 01 d0             	add    rax,rdx
  805903:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805906:	83 e0 01             	and    eax,0x1
  805909:	48 85 c0             	test   rax,rax
  80590c:	0f 84 bd 00 00 00    	je     8059cf <copy_mmap+0x359>
  805912:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805915:	48 98                	cdqe   
  805917:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80591e:	00 
  80591f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805923:	48 01 d0             	add    rax,rdx
  805926:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805929:	25 80 00 00 00       	and    eax,0x80
  80592e:	48 85 c0             	test   rax,rax
  805931:	0f 85 98 00 00 00    	jne    8059cf <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805937:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80593a:	48 98                	cdqe   
  80593c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805943:	00 
  805944:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805948:	48 01 d0             	add    rax,rdx
  80594b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80594e:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  805952:	b8 00 00 00 00       	mov    eax,0x0
  805957:	e8 5d b9 ff ff       	call   8012b9 <vmalloc>
  80595c:	48 89 c2             	mov    rdx,rax
  80595f:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805966:	00 ff ff 
  805969:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  80596d:	48 89 c1             	mov    rcx,rax
  805970:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805973:	48 98                	cdqe   
  805975:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80597c:	00 
  80597d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805981:	48 01 f0             	add    rax,rsi
  805984:	48 09 ca             	or     rdx,rcx
  805987:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80598a:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805991:	ff 00 00 
  805994:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805998:	48 89 c1             	mov    rcx,rax
  80599b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80599e:	48 98                	cdqe   
  8059a0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8059a7:	00 
  8059a8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8059ac:	48 01 d0             	add    rax,rdx
  8059af:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8059b2:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8059b9:	ff 00 00 
  8059bc:	48 21 d0             	and    rax,rdx
  8059bf:	ba 00 10 00 00       	mov    edx,0x1000
  8059c4:	48 89 ce             	mov    rsi,rcx
  8059c7:	48 89 c7             	mov    rdi,rax
  8059ca:	e8 32 61 00 00       	call   80bb01 <memcpy>
                    for(int k=0;k<512;k++)
  8059cf:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8059d3:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8059da:	0f 8e 0f ff ff ff    	jle    8058ef <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  8059e0:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8059e4:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8059eb:	0f 8e ea fd ff ff    	jle    8057db <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  8059f1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8059f5:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8059fc:	0f 8e ea fc ff ff    	jle    8056ec <copy_mmap+0x76>
                    }
                }
            }
        }
    }
  805a02:	90                   	nop
  805a03:	90                   	nop
  805a04:	c9                   	leave  
  805a05:	c3                   	ret    
  805a06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805a0d:	00 00 00 

0000000000805a10 <outb>:
  805a10:	66 89 fa             	mov    dx,di
  805a13:	66 89 f0             	mov    ax,si
  805a16:	ee                   	out    dx,al
  805a17:	e8 29 00 00 00       	call   805a45 <io_delay>
  805a1c:	c3                   	ret    

0000000000805a1d <outw>:
  805a1d:	66 89 fa             	mov    dx,di
  805a20:	66 89 f0             	mov    ax,si
  805a23:	66 ef                	out    dx,ax
  805a25:	90                   	nop
  805a26:	90                   	nop
  805a27:	90                   	nop
  805a28:	c3                   	ret    

0000000000805a29 <inb>:
  805a29:	31 c0                	xor    eax,eax
  805a2b:	66 89 fa             	mov    dx,di
  805a2e:	ec                   	in     al,dx
  805a2f:	90                   	nop
  805a30:	90                   	nop
  805a31:	90                   	nop
  805a32:	c3                   	ret    

0000000000805a33 <inw>:
  805a33:	31 c0                	xor    eax,eax
  805a35:	66 89 fa             	mov    dx,di
  805a38:	66 ed                	in     ax,dx
  805a3a:	90                   	nop
  805a3b:	90                   	nop
  805a3c:	90                   	nop
  805a3d:	c3                   	ret    

0000000000805a3e <eoi>:
  805a3e:	b0 20                	mov    al,0x20
  805a40:	e6 a0                	out    0xa0,al
  805a42:	e6 20                	out    0x20,al
  805a44:	c3                   	ret    

0000000000805a45 <io_delay>:
  805a45:	90                   	nop
  805a46:	90                   	nop
  805a47:	90                   	nop
  805a48:	90                   	nop
  805a49:	c3                   	ret    

0000000000805a4a <turn_on_int>:
  805a4a:	b0 f8                	mov    al,0xf8
  805a4c:	e6 21                	out    0x21,al
  805a4e:	e8 f2 ff ff ff       	call   805a45 <io_delay>
  805a53:	b0 af                	mov    al,0xaf
  805a55:	e6 a1                	out    0xa1,al
  805a57:	e8 e9 ff ff ff       	call   805a45 <io_delay>
  805a5c:	b8 00 70 10 00       	mov    eax,0x107000
  805a61:	0f 01 18             	lidt   [rax]
  805a64:	90                   	nop
  805a65:	90                   	nop
  805a66:	90                   	nop
  805a67:	90                   	nop
  805a68:	c3                   	ret    

0000000000805a69 <report_back_trace_of_err>:
  805a69:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805a6e:	50                   	push   rax
  805a6f:	68 78 5a 80 00       	push   0x805a78
  805a74:	83 c4 08             	add    esp,0x8
  805a77:	c3                   	ret    

0000000000805a78 <bt_msg>:
  805a78:	65 72 72             	gs jb  805aed <fill_desc+0x4e>
  805a7b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805a7c:	72 20                	jb     805a9e <init_gdt+0x11>
  805a7e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805a7f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805a82:	72 73                	jb     805af7 <fill_desc+0x58>
  805a84:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805a87:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb705 <_knl_end+0x2eb705>

0000000000805a8d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  805a8d:	f3 0f 1e fa          	endbr64 
  805a91:	55                   	push   rbp
  805a92:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805a95:	66 b8 48 00          	mov    ax,0x48
  805a99:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  805a9c:	90                   	nop
  805a9d:	5d                   	pop    rbp
  805a9e:	c3                   	ret    

0000000000805a9f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  805a9f:	f3 0f 1e fa          	endbr64 
  805aa3:	55                   	push   rbp
  805aa4:	48 89 e5             	mov    rbp,rsp
  805aa7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805aab:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805aaf:	89 d0                	mov    eax,edx
  805ab1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805ab4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805ab8:	48 8b 15 69 6a 00 00 	mov    rdx,QWORD PTR [rip+0x6a69]        # 80c528 <gdt>
  805abf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805ac2:	48 c1 e0 04          	shl    rax,0x4
  805ac6:	48 01 d0             	add    rax,rdx
  805ac9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805acd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ad5:	48 c1 e8 10          	shr    rax,0x10
  805ad9:	48 89 c1             	mov    rcx,rax
  805adc:	48 8b 15 45 6a 00 00 	mov    rdx,QWORD PTR [rip+0x6a45]        # 80c528 <gdt>
  805ae3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805ae6:	48 c1 e0 04          	shl    rax,0x4
  805aea:	48 01 d0             	add    rax,rdx
  805aed:	89 ca                	mov    edx,ecx
  805aef:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  805af2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805af6:	48 c1 e8 18          	shr    rax,0x18
  805afa:	48 89 c1             	mov    rcx,rax
  805afd:	48 8b 15 24 6a 00 00 	mov    rdx,QWORD PTR [rip+0x6a24]        # 80c528 <gdt>
  805b04:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b07:	48 c1 e0 04          	shl    rax,0x4
  805b0b:	48 01 d0             	add    rax,rdx
  805b0e:	89 ca                	mov    edx,ecx
  805b10:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  805b13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b17:	48 c1 e8 20          	shr    rax,0x20
  805b1b:	48 89 c2             	mov    rdx,rax
  805b1e:	48 8b 0d 03 6a 00 00 	mov    rcx,QWORD PTR [rip+0x6a03]        # 80c528 <gdt>
  805b25:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b28:	48 c1 e0 04          	shl    rax,0x4
  805b2c:	48 01 c8             	add    rax,rcx
  805b2f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805b32:	48 8b 15 ef 69 00 00 	mov    rdx,QWORD PTR [rip+0x69ef]        # 80c528 <gdt>
  805b39:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b3c:	48 c1 e0 04          	shl    rax,0x4
  805b40:	48 01 d0             	add    rax,rdx
  805b43:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805b47:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  805b4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b4e:	48 c1 e8 08          	shr    rax,0x8
  805b52:	66 25 f0 00          	and    ax,0xf0
  805b56:	48 8b 0d cb 69 00 00 	mov    rcx,QWORD PTR [rip+0x69cb]        # 80c528 <gdt>
  805b5d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805b60:	48 c1 e2 04          	shl    rdx,0x4
  805b64:	48 01 ca             	add    rdx,rcx
  805b67:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  805b6b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805b6f:	90                   	nop
  805b70:	5d                   	pop    rbp
  805b71:	c3                   	ret    

0000000000805b72 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805b72:	f3 0f 1e fa          	endbr64 
  805b76:	55                   	push   rbp
  805b77:	48 89 e5             	mov    rbp,rsp
  805b7a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805b7d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805b80:	89 c8                	mov    eax,ecx
  805b82:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805b86:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  805b8a:	48 8b 05 97 69 00 00 	mov    rax,QWORD PTR [rip+0x6997]        # 80c528 <gdt>
  805b91:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805b95:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805b98:	48 c1 e0 04          	shl    rax,0x4
  805b9c:	48 89 c2             	mov    rdx,rax
  805b9f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ba3:	48 01 d0             	add    rax,rdx
  805ba6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805ba9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  805bac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805baf:	48 c1 e0 04          	shl    rax,0x4
  805bb3:	48 89 c2             	mov    rdx,rax
  805bb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bba:	48 01 d0             	add    rax,rdx
  805bbd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805bc0:	c1 ea 10             	shr    edx,0x10
  805bc3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805bc6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bc9:	48 c1 e0 04          	shl    rax,0x4
  805bcd:	48 89 c2             	mov    rdx,rax
  805bd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bd4:	48 01 c2             	add    rdx,rax
  805bd7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  805bdb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  805bdf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805be2:	48 c1 e0 04          	shl    rax,0x4
  805be6:	48 89 c2             	mov    rdx,rax
  805be9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bed:	48 01 c2             	add    rdx,rax
  805bf0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805bf4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805bf8:	90                   	nop
  805bf9:	5d                   	pop    rbp
  805bfa:	c3                   	ret    

0000000000805bfb <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  805bfb:	f3 0f 1e fa          	endbr64 
  805bff:	55                   	push   rbp
  805c00:	48 89 e5             	mov    rbp,rsp
  805c03:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805c06:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805c09:	89 d0                	mov    eax,edx
  805c0b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805c0f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805c13:	90                   	nop
  805c14:	5d                   	pop    rbp
  805c15:	c3                   	ret    
  805c16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805c1d:	00 00 00 

0000000000805c20 <fill_desc>:
  805c20:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805c25:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  805c2a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  805c2f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805c34:	be 00 60 00 00       	mov    esi,0x6000
  805c39:	c1 e2 03             	shl    edx,0x3
  805c3c:	01 d6                	add    esi,edx
  805c3e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805c42:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805c47:	c1 e8 10             	shr    eax,0x10
  805c4a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  805c4e:	c1 eb 10             	shr    ebx,0x10
  805c51:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805c55:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805c59:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  805c5d:	c3                   	ret    

0000000000805c5e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  805c5e:	f3 0f 1e fa          	endbr64 
  805c62:	55                   	push   rbp
  805c63:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805c66:	b8 00 00 00 00       	mov    eax,0x0
  805c6b:	e8 79 25 00 00       	call   8081e9 <execute_request>
    do_req();
  805c70:	b8 00 00 00 00       	mov    eax,0x0
  805c75:	e8 f2 d6 ff ff       	call   80336c <do_req>
    if(!manage_proc_lock)
  805c7a:	8b 05 48 68 00 00    	mov    eax,DWORD PTR [rip+0x6848]        # 80c4c8 <manage_proc_lock>
  805c80:	85 c0                	test   eax,eax
  805c82:	75 0a                	jne    805c8e <clock_c+0x30>
    {
        manage_proc();
  805c84:	b8 00 00 00 00       	mov    eax,0x0
  805c89:	e8 f8 de ff ff       	call   803b86 <manage_proc>
    }
    //puts("1 disk req executed.");
  805c8e:	90                   	nop
  805c8f:	5d                   	pop    rbp
  805c90:	c3                   	ret    
  805c91:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805c98:	00 00 00 
  805c9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805ca0 <clock>:
  805ca0:	50                   	push   rax
  805ca1:	53                   	push   rbx
  805ca2:	51                   	push   rcx
  805ca3:	52                   	push   rdx
  805ca4:	57                   	push   rdi
  805ca5:	56                   	push   rsi
  805ca6:	41 50                	push   r8
  805ca8:	41 51                	push   r9
  805caa:	41 52                	push   r10
  805cac:	41 53                	push   r11
  805cae:	41 54                	push   r12
  805cb0:	41 55                	push   r13
  805cb2:	41 56                	push   r14
  805cb4:	41 57                	push   r15
  805cb6:	e8 a3 de ff ff       	call   803b5e <save_rsp>
  805cbb:	66 8c c0             	mov    ax,es
  805cbe:	50                   	push   rax
  805cbf:	66 8c d8             	mov    ax,ds
  805cc2:	50                   	push   rax
  805cc3:	66 b8 10 00          	mov    ax,0x10
  805cc7:	8e c0                	mov    es,eax
  805cc9:	8e d8                	mov    ds,eax

0000000000805ccb <clock.normal_part>:
  805ccb:	b0 20                	mov    al,0x20
  805ccd:	e6 a0                	out    0xa0,al
  805ccf:	e6 20                	out    0x20,al
  805cd1:	e8 88 ff ff ff       	call   805c5e <clock_c>
  805cd6:	58                   	pop    rax
  805cd7:	8e d8                	mov    ds,eax
  805cd9:	58                   	pop    rax
  805cda:	8e c0                	mov    es,eax
  805cdc:	41 5f                	pop    r15
  805cde:	41 5e                	pop    r14
  805ce0:	41 5d                	pop    r13
  805ce2:	41 5c                	pop    r12
  805ce4:	41 5b                	pop    r11
  805ce6:	41 5a                	pop    r10
  805ce8:	41 59                	pop    r9
  805cea:	41 58                	pop    r8
  805cec:	5e                   	pop    rsi
  805ced:	5f                   	pop    rdi
  805cee:	5a                   	pop    rdx
  805cef:	59                   	pop    rcx
  805cf0:	5b                   	pop    rbx
  805cf1:	58                   	pop    rax
  805cf2:	48 cf                	iretq  

0000000000805cf4 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  805cf4:	f3 0f 1e fa          	endbr64 
  805cf8:	55                   	push   rbp
  805cf9:	48 89 e5             	mov    rbp,rsp
  805cfc:	48 83 ec 30          	sub    rsp,0x30
  805d00:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805d04:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805d08:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  805d0f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  805d16:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d1a:	be 00 10 00 00       	mov    esi,0x1000
  805d1f:	48 89 c7             	mov    rdi,rax
  805d22:	e8 5b 15 00 00       	call   807282 <sys_open>
  805d27:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805d2a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805d2e:	79 0a                	jns    805d3a <execute+0x46>
  805d30:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805d35:	e9 ba 00 00 00       	jmp    805df4 <execute+0x100>
    //
    char *p=path;
  805d3a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805d42:	eb 05                	jmp    805d49 <execute+0x55>
  805d44:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805d49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d50:	84 c0                	test   al,al
  805d52:	75 f0                	jne    805d44 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  805d54:	eb 05                	jmp    805d5b <execute+0x67>
  805d56:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805d5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d62:	3c 2f                	cmp    al,0x2f
  805d64:	74 0a                	je     805d70 <execute+0x7c>
  805d66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d6a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805d6e:	77 e6                	ja     805d56 <execute+0x62>
    if(p>path)
  805d70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d74:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805d78:	76 2f                	jbe    805da9 <execute+0xb5>
    {
        *p='\0';
  805d7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d7e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805d81:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d85:	be 00 40 00 00       	mov    esi,0x4000
  805d8a:	48 89 c7             	mov    rdi,rax
  805d8d:	e8 f0 14 00 00       	call   807282 <sys_open>
  805d92:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805d95:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805d99:	79 07                	jns    805da2 <execute+0xae>
  805d9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805da0:	eb 52                	jmp    805df4 <execute+0x100>
        *p='/';
  805da2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805da6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805da9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805dac:	48 63 d0             	movsxd rdx,eax
  805daf:	48 89 d0             	mov    rax,rdx
  805db2:	48 c1 e0 02          	shl    rax,0x2
  805db6:	48 01 d0             	add    rax,rdx
  805db9:	48 c1 e0 03          	shl    rax,0x3
  805dbd:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805dc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dc7:	48 63 c8             	movsxd rcx,eax
  805dca:	48 89 c8             	mov    rax,rcx
  805dcd:	48 c1 e0 02          	shl    rax,0x2
  805dd1:	48 01 c8             	add    rax,rcx
  805dd4:	48 c1 e0 03          	shl    rax,0x3
  805dd8:	48 05 60 06 40 00    	add    rax,0x400660
  805dde:	b9 66 5f 80 00       	mov    ecx,0x805f66
  805de3:	48 89 c6             	mov    rsi,rax
  805de6:	48 89 cf             	mov    rdi,rcx
  805de9:	e8 7f e6 ff ff       	call   80446d <reg_proc>
  805dee:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805df1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805df4:	c9                   	leave  
  805df5:	c3                   	ret    

0000000000805df6 <sys_execve>:

int sys_execve(char *path,char **argv){
  805df6:	f3 0f 1e fa          	endbr64 
  805dfa:	55                   	push   rbp
  805dfb:	48 89 e5             	mov    rbp,rsp
  805dfe:	48 83 ec 30          	sub    rsp,0x30
  805e02:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805e06:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  805e0a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  805e11:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  805e18:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e1c:	be 00 10 00 00       	mov    esi,0x1000
  805e21:	48 89 c7             	mov    rdi,rax
  805e24:	e8 59 14 00 00       	call   807282 <sys_open>
  805e29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e2c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805e30:	79 0a                	jns    805e3c <sys_execve+0x46>
  805e32:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  805e37:	e9 ad 00 00 00       	jmp    805ee9 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  805e3c:	48 8b 05 5d e6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e65d]        # 4144a0 <current>
  805e43:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805e4a:	48 2d 60 06 40 00    	sub    rax,0x400660
  805e50:	48 c1 f8 03          	sar    rax,0x3
  805e54:	48 89 c2             	mov    rdx,rax
  805e57:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  805e5e:	cc cc cc 
  805e61:	48 0f af c2          	imul   rax,rdx
  805e65:	89 c7                	mov    edi,eax
  805e67:	e8 2d 17 00 00       	call   807599 <sys_close>

    void *retp= load_pe;
  805e6c:	48 c7 45 f0 9f 5f 80 	mov    QWORD PTR [rbp-0x10],0x805f9f
  805e73:	00 
    current->exef=&opened[fno];//改变执行文件
  805e74:	48 8b 15 25 e6 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e625]        # 4144a0 <current>
  805e7b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e7e:	48 63 c8             	movsxd rcx,eax
  805e81:	48 89 c8             	mov    rax,rcx
  805e84:	48 c1 e0 02          	shl    rax,0x2
  805e88:	48 01 c8             	add    rax,rcx
  805e8b:	48 c1 e0 03          	shl    rax,0x3
  805e8f:	48 05 60 06 40 00    	add    rax,0x400660
  805e95:	48 89 82 bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  805e9c:	48 8b 05 fd e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5fd]        # 4144a0 <current>
  805ea3:	48 89 c7             	mov    rdi,rax
  805ea6:	e8 c9 f4 ff ff       	call   805374 <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  805eab:	48 8b 05 ee e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5ee]        # 4144a0 <current>
  805eb2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  805eb9:	ff 00 00 
  805ebc:	48 89 b0 68 02 00 00 	mov    QWORD PTR [rax+0x268],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  805ec3:	48 8b 05 56 66 00 00 	mov    rax,QWORD PTR [rip+0x6656]        # 80c520 <tss>
  805eca:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  805ece:	48 2d a8 00 00 00    	sub    rax,0xa8
  805ed4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  805ed8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805edc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ee0:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  805ee4:	b8 00 00 00 00       	mov    eax,0x0
}
  805ee9:	c9                   	leave  
  805eea:	c3                   	ret    

0000000000805eeb <exec_call>:
int exec_call(char *path)
{
  805eeb:	f3 0f 1e fa          	endbr64 
  805eef:	55                   	push   rbp
  805ef0:	48 89 e5             	mov    rbp,rsp
  805ef3:	48 83 ec 20          	sub    rsp,0x20
  805ef7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  805efb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805eff:	be 00 00 00 00       	mov    esi,0x0
  805f04:	48 89 c7             	mov    rdi,rax
  805f07:	e8 e8 fd ff ff       	call   805cf4 <execute>
  805f0c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805f0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f12:	01 c0                	add    eax,eax
  805f14:	83 c0 05             	add    eax,0x5
  805f17:	c1 e0 03             	shl    eax,0x3
  805f1a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805f1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f20:	89 c7                	mov    edi,eax
  805f22:	e8 41 de ff ff       	call   803d68 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805f27:	90                   	nop
  805f28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f2b:	48 63 d0             	movsxd rdx,eax
  805f2e:	48 89 d0             	mov    rax,rdx
  805f31:	48 01 c0             	add    rax,rax
  805f34:	48 01 d0             	add    rax,rdx
  805f37:	48 c1 e0 08          	shl    rax,0x8
  805f3b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805f41:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805f44:	83 f8 03             	cmp    eax,0x3
  805f47:	75 df                	jne    805f28 <exec_call+0x3d>
    return task[pi].exit_code;
  805f49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f4c:	48 63 d0             	movsxd rdx,eax
  805f4f:	48 89 d0             	mov    rax,rdx
  805f52:	48 01 c0             	add    rax,rax
  805f55:	48 01 d0             	add    rax,rdx
  805f58:	48 c1 e0 08          	shl    rax,0x8
  805f5c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805f62:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805f64:	c9                   	leave  
  805f65:	c3                   	ret    

0000000000805f66 <proc_start>:
int proc_start()
{
  805f66:	f3 0f 1e fa          	endbr64 
  805f6a:	55                   	push   rbp
  805f6b:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805f6e:	8b 05 b8 e5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e5b8]        # 41452c <cur_proc>
  805f74:	48 63 d0             	movsxd rdx,eax
  805f77:	48 89 d0             	mov    rax,rdx
  805f7a:	48 01 c0             	add    rax,rax
  805f7d:	48 01 d0             	add    rax,rdx
  805f80:	48 c1 e0 08          	shl    rax,0x8
  805f84:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805f8a:	48 89 c7             	mov    rdi,rax
  805f8d:	e8 0d 00 00 00       	call   805f9f <load_pe>
    //释放进程资源
    sys_exit(0);
  805f92:	bf 00 00 00 00       	mov    edi,0x0
  805f97:	e8 a9 e4 ff ff       	call   804445 <sys_exit>
}
  805f9c:	90                   	nop
  805f9d:	5d                   	pop    rbp
  805f9e:	c3                   	ret    

0000000000805f9f <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  805f9f:	f3 0f 1e fa          	endbr64 
  805fa3:	55                   	push   rbp
  805fa4:	48 89 e5             	mov    rbp,rsp
  805fa7:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805fae:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  805fb5:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805fbc:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805fc3:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  805fc7:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805fce:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805fd5:	eb 28                	jmp    805fff <load_pe+0x60>
        if(current->openf[i]==f)
  805fd7:	48 8b 05 c2 e4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e4c2]        # 4144a0 <current>
  805fde:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805fe1:	48 63 d2             	movsxd rdx,edx
  805fe4:	48 83 c2 18          	add    rdx,0x18
  805fe8:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  805fed:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  805ff1:	75 08                	jne    805ffb <load_pe+0x5c>
        {
            exefno=i;
  805ff3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805ff6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  805ff9:	eb 0a                	jmp    806005 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805ffb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805fff:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806003:	7e d2                	jle    805fd7 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806005:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806009:	75 0a                	jne    806015 <load_pe+0x76>
  80600b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806010:	e9 11 07 00 00       	jmp    806726 <load_pe+0x787>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806015:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  80601c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80601f:	ba 44 00 00 00       	mov    edx,0x44
  806024:	48 89 ce             	mov    rsi,rcx
  806027:	89 c7                	mov    edi,eax
  806029:	e8 23 16 00 00       	call   807651 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  80602e:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806035:	48 89 c1             	mov    rcx,rax
  806038:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80603b:	ba 00 00 00 00       	mov    edx,0x0
  806040:	48 89 ce             	mov    rsi,rcx
  806043:	89 c7                	mov    edi,eax
  806045:	e8 67 17 00 00       	call   8077b1 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80604a:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  806051:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806054:	ba 0c 01 00 00       	mov    edx,0x10c
  806059:	48 89 ce             	mov    rsi,rcx
  80605c:	89 c7                	mov    edi,eax
  80605e:	e8 ee 15 00 00       	call   807651 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806063:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  80606a:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80606e:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  806074:	c1 e8 0c             	shr    eax,0xc
  806077:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  80607a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80607d:	ba 00 00 00 00       	mov    edx,0x0
  806082:	be 00 00 00 00       	mov    esi,0x0
  806087:	89 c7                	mov    edi,eax
  806089:	e8 23 17 00 00       	call   8077b1 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  80608e:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  806092:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806095:	ba 00 10 00 00       	mov    edx,0x1000
  80609a:	48 89 ce             	mov    rsi,rcx
  80609d:	89 c7                	mov    edi,eax
  80609f:	e8 ad 15 00 00       	call   807651 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8060a4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8060a8:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  8060ac:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8060b0:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  8060b4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8060b8:	48 01 d0             	add    rax,rdx
  8060bb:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8060c2:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060c9:	48 83 c0 04          	add    rax,0x4
  8060cd:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8060d4:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060db:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8060de:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  8060e4:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  8060ea:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8060f0:	85 c0                	test   eax,eax
  8060f2:	0f 48 c2             	cmovs  eax,edx
  8060f5:	c1 f8 0c             	sar    eax,0xc
  8060f8:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  8060fe:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806105:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806108:	89 c2                	mov    edx,eax
  80610a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80610e:	48 01 d0             	add    rax,rdx
  806111:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806118:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  80611e:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806124:	85 c0                	test   eax,eax
  806126:	0f 48 c2             	cmovs  eax,edx
  806129:	c1 f8 0a             	sar    eax,0xa
  80612c:	89 c1                	mov    ecx,eax
  80612e:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806134:	99                   	cdq    
  806135:	c1 ea 16             	shr    edx,0x16
  806138:	01 d0                	add    eax,edx
  80613a:	25 ff 03 00 00       	and    eax,0x3ff
  80613f:	29 d0                	sub    eax,edx
  806141:	01 c8                	add    eax,ecx
  806143:	85 c0                	test   eax,eax
  806145:	0f 95 c0             	setne  al
  806148:	0f b6 c0             	movzx  eax,al
  80614b:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806151:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806158:	48 c1 e8 15          	shr    rax,0x15
  80615c:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806162:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806169:	89 c0                	mov    eax,eax
  80616b:	48 05 0c 01 00 00    	add    rax,0x10c
  806171:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806175:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80617c:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806180:	0f b7 d0             	movzx  edx,ax
  806183:	89 d0                	mov    eax,edx
  806185:	c1 e0 02             	shl    eax,0x2
  806188:	01 d0                	add    eax,edx
  80618a:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  80618d:	05 50 01 00 00       	add    eax,0x150
  806192:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806198:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80619f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8061a2:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8061a8:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061ae:	99                   	cdq    
  8061af:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8061b5:	89 d0                	mov    eax,edx
  8061b7:	85 c0                	test   eax,eax
  8061b9:	74 23                	je     8061de <load_pe+0x23f>
  8061bb:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061c1:	99                   	cdq    
  8061c2:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8061c8:	89 d1                	mov    ecx,edx
  8061ca:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061d0:	29 c8                	sub    eax,ecx
  8061d2:	89 c2                	mov    edx,eax
  8061d4:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8061da:	01 d0                	add    eax,edx
  8061dc:	eb 06                	jmp    8061e4 <load_pe+0x245>
  8061de:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061e4:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8061ea:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8061f1:	eb 6b                	jmp    80625e <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  8061f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8061f7:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8061fa:	25 00 00 00 02       	and    eax,0x2000000
  8061ff:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  806205:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  80620c:	75 46                	jne    806254 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  80620e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806212:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806215:	89 c1                	mov    ecx,eax
  806217:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80621a:	ba 00 00 00 00       	mov    edx,0x0
  80621f:	48 89 ce             	mov    rsi,rcx
  806222:	89 c7                	mov    edi,eax
  806224:	e8 88 15 00 00       	call   8077b1 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806229:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80622d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806230:	89 c2                	mov    edx,eax
  806232:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806236:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806239:	89 c1                	mov    ecx,eax
  80623b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80623f:	48 01 c8             	add    rax,rcx
  806242:	48 89 c1             	mov    rcx,rax
  806245:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806248:	48 89 ce             	mov    rsi,rcx
  80624b:	89 c7                	mov    edi,eax
  80624d:	e8 ff 13 00 00       	call   807651 <sys_read>
  806252:	eb 01                	jmp    806255 <load_pe+0x2b6>
            continue;
  806254:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806255:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806259:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80625e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806265:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806269:	0f b7 c0             	movzx  eax,ax
  80626c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80626f:	7c 82                	jl     8061f3 <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  806271:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806278:	48 05 90 00 00 00    	add    rax,0x90
  80627e:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  806285:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80628c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80628f:	85 c0                	test   eax,eax
  806291:	0f 84 7b 02 00 00    	je     806512 <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  806297:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80629e:	8b 10                	mov    edx,DWORD PTR [rax]
  8062a0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8062a4:	01 d0                	add    eax,edx
  8062a6:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8062ac:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  8062b2:	48 98                	cdqe   
  8062b4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8062b8:	e9 47 02 00 00       	jmp    806504 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8062bd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062c1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8062c4:	89 c2                	mov    edx,eax
  8062c6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8062ca:	48 01 d0             	add    rax,rdx
  8062cd:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8062d4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8062db:	be 08 41 81 00       	mov    esi,0x814108
  8062e0:	48 89 c7             	mov    rdi,rax
  8062e3:	e8 b7 5a 00 00       	call   80bd9f <strcmp>
  8062e8:	85 c0                	test   eax,eax
  8062ea:	75 09                	jne    8062f5 <load_pe+0x356>
            {
                dllp=0x1c00000;
  8062ec:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8062f3:	eb 25                	jmp    80631a <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8062f5:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8062fc:	48 89 c7             	mov    rdi,rax
  8062ff:	e8 9b fc ff ff       	call   805f9f <load_pe>
  806304:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  80630a:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  806310:	89 c7                	mov    edi,eax
  806312:	e8 11 04 00 00       	call   806728 <get_module_addr>
  806317:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  80631a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80631d:	48 98                	cdqe   
  80631f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806326:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806329:	48 63 d0             	movsxd rdx,eax
  80632c:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  806333:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806337:	48 01 d0             	add    rax,rdx
  80633a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  806341:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806348:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80634e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806351:	01 d0                	add    eax,edx
  806353:	89 c0                	mov    eax,eax
  806355:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  80635c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806363:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806366:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80636c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806373:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  806376:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806379:	01 d0                	add    eax,edx
  80637b:	89 c0                	mov    eax,eax
  80637d:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  806384:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80638b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80638e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806391:	01 d0                	add    eax,edx
  806393:	89 c0                	mov    eax,eax
  806395:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  80639c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063a3:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8063a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8063a9:	01 d0                	add    eax,edx
  8063ab:	89 c0                	mov    eax,eax
  8063ad:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8063b4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063bb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8063be:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8063c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063c8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8063cb:	89 c2                	mov    edx,eax
  8063cd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8063d1:	48 01 d0             	add    rax,rdx
  8063d4:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8063d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063dc:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8063df:	89 c2                	mov    edx,eax
  8063e1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8063e5:	48 01 d0             	add    rax,rdx
  8063e8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8063ec:	e9 00 01 00 00       	jmp    8064f1 <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8063f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8063f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8063f7:	85 c0                	test   eax,eax
  8063f9:	79 43                	jns    80643e <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8063fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8063ff:	8b 00                	mov    eax,DWORD PTR [rax]
  806401:	25 ff ff ff 7f       	and    eax,0x7fffffff
  806406:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  80640c:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  806412:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  806418:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80641f:	00 
  806420:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806427:	48 01 d0             	add    rax,rdx
  80642a:	8b 10                	mov    edx,DWORD PTR [rax]
  80642c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80642f:	01 d0                	add    eax,edx
  806431:	89 c2                	mov    edx,eax
  806433:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806437:	89 10                	mov    DWORD PTR [rax],edx
  806439:	e9 a9 00 00 00       	jmp    8064e7 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80643e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806442:	8b 00                	mov    eax,DWORD PTR [rax]
  806444:	89 c0                	mov    eax,eax
  806446:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  80644d:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  806454:	02 
                    int i=0;
  806455:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  80645c:	eb 7a                	jmp    8064d8 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80645e:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806461:	48 98                	cdqe   
  806463:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80646a:	00 
  80646b:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  806472:	48 01 d0             	add    rax,rdx
  806475:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806478:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80647f:	48 89 d6             	mov    rsi,rdx
  806482:	48 89 c7             	mov    rdi,rax
  806485:	e8 15 59 00 00       	call   80bd9f <strcmp>
  80648a:	85 c0                	test   eax,eax
  80648c:	75 46                	jne    8064d4 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80648e:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806491:	48 98                	cdqe   
  806493:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806497:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80649e:	48 01 d0             	add    rax,rdx
  8064a1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8064a4:	98                   	cwde   
  8064a5:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8064ab:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8064b1:	48 98                	cdqe   
  8064b3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8064ba:	00 
  8064bb:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8064c2:	48 01 d0             	add    rax,rdx
  8064c5:	8b 10                	mov    edx,DWORD PTR [rax]
  8064c7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8064ca:	01 d0                	add    eax,edx
  8064cc:	89 c2                	mov    edx,eax
  8064ce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064d2:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8064d4:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8064d8:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8064db:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8064e1:	0f 8c 77 ff ff ff    	jl     80645e <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8064e7:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8064ec:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8064f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8064f7:	85 c0                	test   eax,eax
  8064f9:	0f 85 f2 fe ff ff    	jne    8063f1 <load_pe+0x452>
            }
            impdes++;
  8064ff:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  806504:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806508:	8b 00                	mov    eax,DWORD PTR [rax]
  80650a:	85 c0                	test   eax,eax
  80650c:	0f 85 ab fd ff ff    	jne    8062bd <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  806512:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  806519:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80651a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806521:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806527:	85 c0                	test   eax,eax
  806529:	0f 84 ec 00 00 00    	je     80661b <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80652f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806536:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  80653c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  806540:	01 d0                	add    eax,edx
  806542:	89 c0                	mov    eax,eax
  806544:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806548:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80654c:	48 83 c0 40          	add    rax,0x40
  806550:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  806554:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806558:	48 83 c0 02          	add    rax,0x2
  80655c:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  806560:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806567:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80656b:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  806571:	e9 97 00 00 00       	jmp    80660d <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806576:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80657a:	8b 10                	mov    edx,DWORD PTR [rax]
  80657c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806580:	01 d0                	add    eax,edx
  806582:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806588:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80658f:	eb 5a                	jmp    8065eb <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  806591:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806595:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806598:	66 85 c0             	test   ax,ax
  80659b:	74 49                	je     8065e6 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  80659d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8065a1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065a4:	0f b7 d0             	movzx  edx,ax
  8065a7:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8065ad:	01 d0                	add    eax,edx
  8065af:	48 98                	cdqe   
  8065b1:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8065b8:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8065bf:	8b 00                	mov    eax,DWORD PTR [rax]
  8065c1:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8065c7:	89 c2                	mov    edx,eax
  8065c9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8065cd:	01 d0                	add    eax,edx
  8065cf:	89 c2                	mov    edx,eax
  8065d1:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8065d8:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8065da:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8065df:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8065e4:	eb 01                	jmp    8065e7 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8065e6:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8065e7:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8065eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8065ef:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8065f2:	c1 e8 02             	shr    eax,0x2
  8065f5:	89 c2                	mov    edx,eax
  8065f7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8065fa:	39 c2                	cmp    edx,eax
  8065fc:	77 93                	ja     806591 <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8065fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806602:	05 00 10 00 00       	add    eax,0x1000
  806607:	48 98                	cdqe   
  806609:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80660d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806611:	8b 00                	mov    eax,DWORD PTR [rax]
  806613:	85 c0                	test   eax,eax
  806615:	0f 85 5b ff ff ff    	jne    806576 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80661b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  806622:	00 00 00 
  806625:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80662c:	00 00 00 
  80662f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806636:	00 00 00 00 
  80663a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  806641:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806645:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80664c:	ba 18 00 00 00       	mov    edx,0x18
  806651:	48 89 c6             	mov    rsi,rax
  806654:	bf 00 00 00 01       	mov    edi,0x1000000
  806659:	e8 a3 54 00 00       	call   80bb01 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80665e:	8b 05 c8 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dec8]        # 41452c <cur_proc>
  806664:	48 63 d0             	movsxd rdx,eax
  806667:	48 89 d0             	mov    rax,rdx
  80666a:	48 01 c0             	add    rax,rax
  80666d:	48 01 d0             	add    rax,rdx
  806670:	48 c1 e0 08          	shl    rax,0x8
  806674:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80667a:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  806681:	8b 05 a5 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dea5]        # 41452c <cur_proc>
  806687:	48 63 d0             	movsxd rdx,eax
  80668a:	48 89 d0             	mov    rax,rdx
  80668d:	48 01 c0             	add    rax,rax
  806690:	48 01 d0             	add    rax,rdx
  806693:	48 c1 e0 08          	shl    rax,0x8
  806697:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80669d:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  8066a4:	8b 05 82 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de82]        # 41452c <cur_proc>
  8066aa:	48 63 d0             	movsxd rdx,eax
  8066ad:	48 89 d0             	mov    rax,rdx
  8066b0:	48 01 c0             	add    rax,rax
  8066b3:	48 01 d0             	add    rax,rdx
  8066b6:	48 c1 e0 08          	shl    rax,0x8
  8066ba:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8066c0:	c7 40 10 00 f0 ff ff 	mov    DWORD PTR [rax+0x10],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8066c7:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8066ce:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8066d5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8066dc:	be 00 00 00 00       	mov    esi,0x0
  8066e1:	bf 00 00 00 00       	mov    edi,0x0
  8066e6:	ff d0                	call   rax
  8066e8:	8b 15 3e de c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0de3e]        # 41452c <cur_proc>
  8066ee:	89 c1                	mov    ecx,eax
  8066f0:	48 63 d2             	movsxd rdx,edx
  8066f3:	48 89 d0             	mov    rax,rdx
  8066f6:	48 01 c0             	add    rax,rax
  8066f9:	48 01 d0             	add    rax,rdx
  8066fc:	48 c1 e0 08          	shl    rax,0x8
  806700:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806706:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  806708:	8b 05 1e de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de1e]        # 41452c <cur_proc>
  80670e:	48 63 d0             	movsxd rdx,eax
  806711:	48 89 d0             	mov    rax,rdx
  806714:	48 01 c0             	add    rax,rax
  806717:	48 01 d0             	add    rax,rdx
  80671a:	48 c1 e0 08          	shl    rax,0x8
  80671e:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806724:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806726:	c9                   	leave  
  806727:	c3                   	ret    

0000000000806728 <get_module_addr>:

int get_module_addr(int mi)
{
  806728:	f3 0f 1e fa          	endbr64 
  80672c:	55                   	push   rbp
  80672d:	48 89 e5             	mov    rbp,rsp
  806730:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  806733:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806736:	48 98                	cdqe   
  806738:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  80673f:	5d                   	pop    rbp
  806740:	c3                   	ret    

0000000000806741 <dispose_library>:
int dispose_library(int dlln)
{
  806741:	f3 0f 1e fa          	endbr64 
  806745:	55                   	push   rbp
  806746:	48 89 e5             	mov    rbp,rsp
  806749:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  80674c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806750:	78 09                	js     80675b <dispose_library+0x1a>
  806752:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806759:	7e 07                	jle    806762 <dispose_library+0x21>
  80675b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806760:	eb 1d                	jmp    80677f <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  806762:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806765:	48 98                	cdqe   
  806767:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80676e:	48 05 48 45 41 00    	add    rax,0x414548
  806774:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  80677a:	b8 00 00 00 00       	mov    eax,0x0
}
  80677f:	5d                   	pop    rbp
  806780:	c3                   	ret    

0000000000806781 <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  806781:	f3 0f 1e fa          	endbr64 
  806785:	55                   	push   rbp
  806786:	48 89 e5             	mov    rbp,rsp
  806789:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80678d:	90                   	nop
  80678e:	5d                   	pop    rbp
  80678f:	c3                   	ret    

0000000000806790 <sys_rmmod>:
int sys_rmmod(char *name)
{
  806790:	f3 0f 1e fa          	endbr64 
  806794:	55                   	push   rbp
  806795:	48 89 e5             	mov    rbp,rsp
  806798:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  80679c:	90                   	nop
  80679d:	5d                   	pop    rbp
  80679e:	c3                   	ret    
  80679f:	90                   	nop

00000000008067a0 <_syscall>:
  8067a0:	55                   	push   rbp
  8067a1:	bd 00 80 10 00       	mov    ebp,0x108000
  8067a6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8067aa:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8067ae:	50                   	push   rax
  8067af:	53                   	push   rbx
  8067b0:	51                   	push   rcx
  8067b1:	52                   	push   rdx
  8067b2:	57                   	push   rdi
  8067b3:	56                   	push   rsi
  8067b4:	41 50                	push   r8
  8067b6:	41 51                	push   r9
  8067b8:	41 52                	push   r10
  8067ba:	41 53                	push   r11
  8067bc:	41 54                	push   r12
  8067be:	41 55                	push   r13
  8067c0:	41 56                	push   r14
  8067c2:	41 57                	push   r15
  8067c4:	66 8c c0             	mov    ax,es
  8067c7:	50                   	push   rax
  8067c8:	66 8c d8             	mov    ax,ds
  8067cb:	50                   	push   rax
  8067cc:	66 b8 10 00          	mov    ax,0x10
  8067d0:	8e c0                	mov    es,eax
  8067d2:	8e d8                	mov    ds,eax
  8067d4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8067d9:	41 53                	push   r11
  8067db:	51                   	push   rcx
  8067dc:	49 87 ca             	xchg   r10,rcx
  8067df:	e8 b6 9d ff ff       	call   80059a <syscall>
  8067e4:	4c 87 d1             	xchg   rcx,r10
  8067e7:	59                   	pop    rcx
  8067e8:	41 5b                	pop    r11
  8067ea:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  8067ef:	58                   	pop    rax
  8067f0:	8e d8                	mov    ds,eax
  8067f2:	58                   	pop    rax
  8067f3:	8e c0                	mov    es,eax
  8067f5:	41 5f                	pop    r15
  8067f7:	41 5e                	pop    r14
  8067f9:	41 5d                	pop    r13
  8067fb:	41 5c                	pop    r12
  8067fd:	41 5b                	pop    r11
  8067ff:	41 5a                	pop    r10
  806801:	41 59                	pop    r9
  806803:	41 58                	pop    r8
  806805:	5e                   	pop    rsi
  806806:	5f                   	pop    rdi
  806807:	5a                   	pop    rdx
  806808:	59                   	pop    rcx
  806809:	5b                   	pop    rbx
  80680a:	58                   	pop    rax
  80680b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80680f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  806813:	5d                   	pop    rbp
  806814:	fb                   	sti    
  806815:	48 0f 07             	sysretq 

0000000000806818 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  806818:	f3 0f 1e fa          	endbr64 
  80681c:	55                   	push   rbp
  80681d:	48 89 e5             	mov    rbp,rsp
  806820:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806824:	8b 05 2a 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d2a]        # 427554 <framebuffer+0x14>
  80682a:	89 c0                	mov    eax,eax
  80682c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  806830:	8b 05 22 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d22]        # 427558 <framebuffer+0x18>
  806836:	89 c0                	mov    eax,eax
  806838:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80683c:	0f b6 05 19 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d19]        # 42755c <framebuffer+0x1c>
  806843:	c0 e8 03             	shr    al,0x3
  806846:	0f b6 c0             	movzx  eax,al
  806849:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80684d:	8b 05 fd 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cfd]        # 427550 <framebuffer+0x10>
  806853:	89 c0                	mov    eax,eax
  806855:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806859:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80685d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806862:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806866:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80686a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80686f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806873:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806877:	48 c1 e8 0c          	shr    rax,0xc
  80687b:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80687e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806885:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806886:	48 8b 05 bb 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20cbb]        # 427548 <framebuffer+0x8>
  80688d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  806891:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806898:	00 
  806899:	eb 2d                	jmp    8068c8 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80689b:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80689f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068a3:	ba 07 00 00 00       	mov    edx,0x7
  8068a8:	48 89 ce             	mov    rsi,rcx
  8068ab:	48 89 c7             	mov    rdi,rax
  8068ae:	e8 41 a6 ff ff       	call   800ef4 <mmap>
        pp+=PAGE_SIZE;
  8068b3:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8068ba:	00 
        p+=PAGE_SIZE;
  8068bb:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8068c2:	00 
    for (size_t i = 0; i < pgc; i++)
  8068c3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8068c8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8068cb:	48 98                	cdqe   
  8068cd:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8068d1:	72 c8                	jb     80689b <init_framebuffer+0x83>
    }
    
    
}
  8068d3:	90                   	nop
  8068d4:	90                   	nop
  8068d5:	c9                   	leave  
  8068d6:	c3                   	ret    

00000000008068d7 <init_font>:
void init_font(){
  8068d7:	f3 0f 1e fa          	endbr64 
  8068db:	55                   	push   rbp
  8068dc:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8068df:	48 c7 05 96 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20c96],0x80c7e0        # 427580 <boot_font>
  8068e6:	e0 c7 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8068ea:	48 8b 05 8f 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c8f]        # 427580 <boot_font>
  8068f1:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8068f4:	83 c0 07             	add    eax,0x7
  8068f7:	c1 e8 03             	shr    eax,0x3
  8068fa:	89 05 90 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c90],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  806900:	8b 05 8a 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c8a]        # 427590 <font_width_bytes>
  806906:	c1 e0 03             	shl    eax,0x3
  806909:	89 05 79 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c79],eax        # 427588 <font_width>
    font_height = boot_font->height;
  80690f:	48 8b 05 6a 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c6a]        # 427580 <boot_font>
  806916:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806919:	89 05 6d 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c6d],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  80691f:	48 8b 05 5a 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c5a]        # 427580 <boot_font>
  806926:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806929:	89 c0                	mov    eax,eax
  80692b:	48 05 e0 c7 80 00    	add    rax,0x80c7e0
  806931:	48 89 05 60 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20c60],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806938:	48 8b 05 41 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c41]        # 427580 <boot_font>
  80693f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806942:	89 05 5c 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c5c],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806948:	48 8b 05 31 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c31]        # 427580 <boot_font>
  80694f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806952:	89 05 48 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c48],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806958:	c7 05 0e 0c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20c0e],0x0        # 427570 <fb_cursor_y>
  80695f:	00 00 00 
  806962:	8b 05 08 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c08]        # 427570 <fb_cursor_y>
  806968:	89 05 fe 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bfe],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80696e:	8b 05 e0 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20be0]        # 427554 <framebuffer+0x14>
  806974:	8b 0d 0e 0c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20c0e]        # 427588 <font_width>
  80697a:	ba 00 00 00 00       	mov    edx,0x0
  80697f:	f7 f1                	div    ecx
  806981:	89 05 ed 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bed],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806987:	8b 05 cb 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bcb]        # 427558 <framebuffer+0x18>
  80698d:	8b 35 f9 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20bf9]        # 42758c <font_height>
  806993:	ba 00 00 00 00       	mov    edx,0x0
  806998:	f7 f6                	div    esi
  80699a:	89 05 d8 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bd8],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  8069a0:	c7 05 86 5b 00 00 01 	mov    DWORD PTR [rip+0x5b86],0x1        # 80c530 <font_size>
  8069a7:	00 00 00 
}
  8069aa:	90                   	nop
  8069ab:	5d                   	pop    rbp
  8069ac:	c3                   	ret    

00000000008069ad <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8069ad:	f3 0f 1e fa          	endbr64 
  8069b1:	55                   	push   rbp
  8069b2:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8069b5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8069b9:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8069bd:	48 89 05 7c 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b7c],rax        # 427540 <framebuffer>
  8069c4:	48 89 15 7d 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b7d],rdx        # 427548 <framebuffer+0x8>
  8069cb:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8069cf:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8069d3:	48 89 05 76 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b76],rax        # 427550 <framebuffer+0x10>
  8069da:	48 89 15 77 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b77],rdx        # 427558 <framebuffer+0x18>
  8069e1:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8069e5:	48 89 05 74 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b74],rax        # 427560 <framebuffer+0x20>
}
  8069ec:	90                   	nop
  8069ed:	5d                   	pop    rbp
  8069ee:	c3                   	ret    

00000000008069ef <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8069ef:	f3 0f 1e fa          	endbr64 
  8069f3:	55                   	push   rbp
  8069f4:	48 89 e5             	mov    rbp,rsp
  8069f7:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8069fa:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8069fd:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806a00:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806a03:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  806a07:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806a0e:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806a0f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806a12:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806a15:	eb 64                	jmp    806a7b <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  806a17:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806a1a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806a1d:	eb 4b                	jmp    806a6a <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806a1f:	8b 15 2b 0b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20b2b]        # 427550 <framebuffer+0x10>
  806a25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a28:	0f af c2             	imul   eax,edx
  806a2b:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806a2d:	0f b6 05 28 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b28]        # 42755c <framebuffer+0x1c>
  806a34:	0f b6 c0             	movzx  eax,al
  806a37:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806a3b:	8d 50 07             	lea    edx,[rax+0x7]
  806a3e:	85 c0                	test   eax,eax
  806a40:	0f 48 c2             	cmovs  eax,edx
  806a43:	c1 f8 03             	sar    eax,0x3
  806a46:	48 98                	cdqe   
  806a48:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806a4b:	48 05 00 00 00 40    	add    rax,0x40000000
  806a51:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806a55:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a59:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806a5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a61:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806a64:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806a66:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806a6a:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  806a6d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806a70:	01 d0                	add    eax,edx
  806a72:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806a75:	7c a8                	jl     806a1f <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806a77:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806a7b:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  806a7e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806a81:	01 d0                	add    eax,edx
  806a83:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806a86:	7c 8f                	jl     806a17 <fill_rect+0x28>
        }
    }
}
  806a88:	90                   	nop
  806a89:	90                   	nop
  806a8a:	5d                   	pop    rbp
  806a8b:	c3                   	ret    

0000000000806a8c <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  806a8c:	f3 0f 1e fa          	endbr64 
  806a90:	55                   	push   rbp
  806a91:	48 89 e5             	mov    rbp,rsp
  806a94:	48 83 ec 30          	sub    rsp,0x30
  806a98:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a9b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a9e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806aa1:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806aa5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806aa8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806aab:	eb 5a                	jmp    806b07 <draw_text+0x7b>
    {
        if(*str=='\n')
  806aad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ab1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ab4:	3c 0a                	cmp    al,0xa
  806ab6:	75 1c                	jne    806ad4 <draw_text+0x48>
        {
            y+=font_height*size;
  806ab8:	8b 15 ce 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20ace]        # 42758c <font_height>
  806abe:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806ac1:	0f af d0             	imul   edx,eax
  806ac4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ac7:	01 d0                	add    eax,edx
  806ac9:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  806acc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806acf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806ad2:	eb 2e                	jmp    806b02 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  806ad4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ad8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806adb:	0f be c8             	movsx  ecx,al
  806ade:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806ae1:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  806ae4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ae7:	89 c7                	mov    edi,eax
  806ae9:	e8 28 00 00 00       	call   806b16 <draw_letter>
            tx+=size*font_width;
  806aee:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806af1:	8b 05 91 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a91]        # 427588 <font_width>
  806af7:	0f af d0             	imul   edx,eax
  806afa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806afd:	01 d0                	add    eax,edx
  806aff:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  806b02:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  806b07:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b0e:	84 c0                	test   al,al
  806b10:	75 9b                	jne    806aad <draw_text+0x21>
    }
}
  806b12:	90                   	nop
  806b13:	90                   	nop
  806b14:	c9                   	leave  
  806b15:	c3                   	ret    

0000000000806b16 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  806b16:	f3 0f 1e fa          	endbr64 
  806b1a:	55                   	push   rbp
  806b1b:	48 89 e5             	mov    rbp,rsp
  806b1e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  806b21:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806b24:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  806b27:	89 c8                	mov    eax,ecx
  806b29:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  806b2c:	48 8b 05 65 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a65]        # 427598 <glyph_table>
  806b33:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806b37:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806b3b:	8b 05 63 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a63]        # 4275a4 <glyph_nr>
  806b41:	39 c2                	cmp    edx,eax
  806b43:	73 13                	jae    806b58 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806b45:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806b49:	8b 05 51 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a51]        # 4275a0 <bytes_per_glyph>
  806b4f:	0f af c2             	imul   eax,edx
  806b52:	89 c0                	mov    eax,eax
  806b54:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806b58:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806b5f:	e9 cb 00 00 00       	jmp    806c2f <draw_letter+0x119>
        u8 mask = 1 << 7;
  806b64:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806b68:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806b6f:	e9 9c 00 00 00       	jmp    806c10 <draw_letter+0xfa>
            int px=x+ch_x*size;
  806b74:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806b77:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806b7b:	89 c2                	mov    edx,eax
  806b7d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  806b80:	01 d0                	add    eax,edx
  806b82:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806b85:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806b88:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  806b8c:	89 c2                	mov    edx,eax
  806b8e:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  806b91:	01 d0                	add    eax,edx
  806b93:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806b96:	8b 15 b4 09 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc209b4]        # 427550 <framebuffer+0x10>
  806b9c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806b9f:	0f af c2             	imul   eax,edx
  806ba2:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806ba4:	0f b6 05 b1 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc209b1]        # 42755c <framebuffer+0x1c>
  806bab:	0f b6 c0             	movzx  eax,al
  806bae:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806bb2:	8d 50 07             	lea    edx,[rax+0x7]
  806bb5:	85 c0                	test   eax,eax
  806bb7:	0f 48 c2             	cmovs  eax,edx
  806bba:	c1 f8 03             	sar    eax,0x3
  806bbd:	48 98                	cdqe   
  806bbf:	48 01 c8             	add    rax,rcx
  806bc2:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806bc8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  806bcc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806bcf:	c1 e8 03             	shr    eax,0x3
  806bd2:	89 c2                	mov    edx,eax
  806bd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806bd8:	48 01 d0             	add    rax,rdx
  806bdb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bde:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  806be1:	84 c0                	test   al,al
  806be3:	74 0c                	je     806bf1 <draw_letter+0xdb>
                *ptr=-1;
  806be5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806be9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  806bef:	eb 0a                	jmp    806bfb <draw_letter+0xe5>
            } else {
                *ptr=0;
  806bf1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806bf5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  806bfb:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  806bfe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806c01:	83 e0 07             	and    eax,0x7
  806c04:	85 c0                	test   eax,eax
  806c06:	75 04                	jne    806c0c <draw_letter+0xf6>
                mask = 1 << 7;
  806c08:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806c0c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806c10:	8b 05 72 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20972]        # 427588 <font_width>
  806c16:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806c19:	0f 82 55 ff ff ff    	jb     806b74 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  806c1f:	8b 05 6b 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2096b]        # 427590 <font_width_bytes>
  806c25:	89 c0                	mov    eax,eax
  806c27:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806c2b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806c2f:	8b 05 57 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20957]        # 42758c <font_height>
  806c35:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806c38:	0f 82 26 ff ff ff    	jb     806b64 <draw_letter+0x4e>
    }
}
  806c3e:	90                   	nop
  806c3f:	90                   	nop
  806c40:	5d                   	pop    rbp
  806c41:	c3                   	ret    

0000000000806c42 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806c42:	f3 0f 1e fa          	endbr64 
  806c46:	55                   	push   rbp
  806c47:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806c4a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806c51:	eb 71                	jmp    806cc4 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806c53:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806c5a:	eb 57                	jmp    806cb3 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  806c5c:	8b 15 ee 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc208ee]        # 427550 <framebuffer+0x10>
  806c62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c65:	0f af c2             	imul   eax,edx
  806c68:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806c6a:	0f b6 05 eb 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208eb]        # 42755c <framebuffer+0x1c>
  806c71:	0f b6 c0             	movzx  eax,al
  806c74:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806c78:	8d 50 07             	lea    edx,[rax+0x7]
  806c7b:	85 c0                	test   eax,eax
  806c7d:	0f 48 c2             	cmovs  eax,edx
  806c80:	c1 f8 03             	sar    eax,0x3
  806c83:	48 98                	cdqe   
  806c85:	48 01 c8             	add    rax,rcx
  806c88:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  806c8e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806c92:	8b 05 b8 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc208b8]        # 427550 <framebuffer+0x10>
  806c98:	89 c2                	mov    edx,eax
  806c9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806c9e:	48 01 d0             	add    rax,rdx
  806ca1:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806ca4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ca8:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806caa:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806caf:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806cb3:	8b 15 9b 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2089b]        # 427554 <framebuffer+0x14>
  806cb9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806cbc:	39 c2                	cmp    edx,eax
  806cbe:	77 9c                	ja     806c5c <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806cc0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806cc4:	8b 05 8e 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2088e]        # 427558 <framebuffer+0x18>
  806cca:	8d 50 ff             	lea    edx,[rax-0x1]
  806ccd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cd0:	39 c2                	cmp    edx,eax
  806cd2:	0f 87 7b ff ff ff    	ja     806c53 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  806cd8:	90                   	nop
  806cd9:	90                   	nop
  806cda:	5d                   	pop    rbp
  806cdb:	c3                   	ret    

0000000000806cdc <scr_down>:
void scr_down(){
  806cdc:	f3 0f 1e fa          	endbr64 
  806ce0:	55                   	push   rbp
  806ce1:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806ce4:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  806ceb:	eb 72                	jmp    806d5f <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806ced:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806cf4:	eb 58                	jmp    806d4e <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806cf6:	8b 15 54 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20854]        # 427550 <framebuffer+0x10>
  806cfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cff:	0f af c2             	imul   eax,edx
  806d02:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806d04:	0f b6 05 51 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20851]        # 42755c <framebuffer+0x1c>
  806d0b:	0f b6 c0             	movzx  eax,al
  806d0e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806d12:	8d 50 07             	lea    edx,[rax+0x7]
  806d15:	85 c0                	test   eax,eax
  806d17:	0f 48 c2             	cmovs  eax,edx
  806d1a:	c1 f8 03             	sar    eax,0x3
  806d1d:	48 98                	cdqe   
  806d1f:	48 01 c8             	add    rax,rcx
  806d22:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806d28:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806d2c:	8b 05 1e 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2081e]        # 427550 <framebuffer+0x10>
  806d32:	89 c0                	mov    eax,eax
  806d34:	48 f7 d8             	neg    rax
  806d37:	48 89 c2             	mov    rdx,rax
  806d3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d3e:	48 01 d0             	add    rax,rdx
  806d41:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806d44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d48:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806d4a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806d4e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806d51:	8b 05 1d 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2081d]        # 427574 <max_ch_nr_x>
  806d57:	39 c2                	cmp    edx,eax
  806d59:	72 9b                	jb     806cf6 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806d5b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806d5f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806d62:	8b 05 10 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20810]        # 427578 <max_ch_nr_y>
  806d68:	39 c2                	cmp    edx,eax
  806d6a:	72 81                	jb     806ced <scr_down+0x11>
        }

    }
}
  806d6c:	90                   	nop
  806d6d:	90                   	nop
  806d6e:	5d                   	pop    rbp
  806d6f:	c3                   	ret    

0000000000806d70 <print>:
void print(char* s){
  806d70:	f3 0f 1e fa          	endbr64 
  806d74:	55                   	push   rbp
  806d75:	48 89 e5             	mov    rbp,rsp
  806d78:	48 83 ec 08          	sub    rsp,0x8
  806d7c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  806d80:	e9 c4 00 00 00       	jmp    806e49 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806d85:	8b 15 e1 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc207e1]        # 42756c <fb_cursor_x>
  806d8b:	8b 05 e3 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207e3]        # 427574 <max_ch_nr_x>
  806d91:	39 c2                	cmp    edx,eax
  806d93:	77 0b                	ja     806da0 <print+0x30>
  806d95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806d99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806d9c:	3c 0a                	cmp    al,0xa
  806d9e:	75 19                	jne    806db9 <print+0x49>
        {
            fb_cursor_y+=1;
  806da0:	8b 05 ca 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207ca]        # 427570 <fb_cursor_y>
  806da6:	83 c0 01             	add    eax,0x1
  806da9:	89 05 c1 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc207c1],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  806daf:	c7 05 b3 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc207b3],0x0        # 42756c <fb_cursor_x>
  806db6:	00 00 00 
        }
        if(*s=='\n')continue;
  806db9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806dbd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806dc0:	3c 0a                	cmp    al,0xa
  806dc2:	74 7f                	je     806e43 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  806dc4:	8b 05 ae 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207ae]        # 427578 <max_ch_nr_y>
  806dca:	8d 50 ff             	lea    edx,[rax-0x1]
  806dcd:	8b 05 9d 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2079d]        # 427570 <fb_cursor_y>
  806dd3:	39 c2                	cmp    edx,eax
  806dd5:	77 0a                	ja     806de1 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  806dd7:	c7 05 8f 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2078f],0x0        # 427570 <fb_cursor_y>
  806dde:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806de1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806de5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806de8:	0f be d0             	movsx  edx,al
  806deb:	8b 05 3f 57 00 00    	mov    eax,DWORD PTR [rip+0x573f]        # 80c530 <font_size>
  806df1:	8b 35 79 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20779]        # 427570 <fb_cursor_y>
  806df7:	8b 0d 8f 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2078f]        # 42758c <font_height>
  806dfd:	0f af ce             	imul   ecx,esi
  806e00:	8b 35 2a 57 00 00    	mov    esi,DWORD PTR [rip+0x572a]        # 80c530 <font_size>
  806e06:	0f af ce             	imul   ecx,esi
  806e09:	41 89 c8             	mov    r8d,ecx
  806e0c:	8b 35 5a 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2075a]        # 42756c <fb_cursor_x>
  806e12:	8b 0d 70 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20770]        # 427588 <font_width>
  806e18:	0f af ce             	imul   ecx,esi
  806e1b:	8b 35 0f 57 00 00    	mov    esi,DWORD PTR [rip+0x570f]        # 80c530 <font_size>
  806e21:	0f af ce             	imul   ecx,esi
  806e24:	89 cf                	mov    edi,ecx
  806e26:	89 d1                	mov    ecx,edx
  806e28:	89 c2                	mov    edx,eax
  806e2a:	44 89 c6             	mov    esi,r8d
  806e2d:	e8 e4 fc ff ff       	call   806b16 <draw_letter>
        fb_cursor_x+=1;
  806e32:	8b 05 34 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20734]        # 42756c <fb_cursor_x>
  806e38:	83 c0 01             	add    eax,0x1
  806e3b:	89 05 2b 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2072b],eax        # 42756c <fb_cursor_x>
  806e41:	eb 01                	jmp    806e44 <print+0xd4>
        if(*s=='\n')continue;
  806e43:	90                   	nop
    for(;*s;s++){
  806e44:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806e49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e50:	84 c0                	test   al,al
  806e52:	0f 85 2d ff ff ff    	jne    806d85 <print+0x15>
    }
}
  806e58:	90                   	nop
  806e59:	90                   	nop
  806e5a:	c9                   	leave  
  806e5b:	c3                   	ret    

0000000000806e5c <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806e5c:	f3 0f 1e fa          	endbr64 
  806e60:	55                   	push   rbp
  806e61:	48 89 e5             	mov    rbp,rsp
  806e64:	48 83 ec 50          	sub    rsp,0x50
  806e68:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806e6c:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806e70:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806e77:	00 
    int tmpnamelen = 0;
  806e78:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  806e7f:	48 8b 05 22 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20722]        # 4275a8 <root_sb>
  806e86:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806e89:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  806e8d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806e94:	00 

    while(*name == '/')
  806e95:	eb 05                	jmp    806e9c <path_walk+0x40>
        name++;
  806e97:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  806e9c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ea0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ea3:	3c 2f                	cmp    al,0x2f
  806ea5:	74 f0                	je     806e97 <path_walk+0x3b>

    if(!*name)
  806ea7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806eab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806eae:	84 c0                	test   al,al
  806eb0:	75 09                	jne    806ebb <path_walk+0x5f>
    {
        return parent;
  806eb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806eb6:	e9 1b 02 00 00       	jmp    8070d6 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  806ebb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ebf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  806ec3:	eb 05                	jmp    806eca <path_walk+0x6e>
            name++;
  806ec5:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  806eca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ece:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ed1:	84 c0                	test   al,al
  806ed3:	74 0b                	je     806ee0 <path_walk+0x84>
  806ed5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ed9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806edc:	3c 2f                	cmp    al,0x2f
  806ede:	75 e5                	jne    806ec5 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806ee0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ee4:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806ee8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806eeb:	be 00 00 00 00       	mov    esi,0x0
  806ef0:	bf 48 00 00 00       	mov    edi,0x48
  806ef5:	b8 00 00 00 00       	mov    eax,0x0
  806efa:	e8 ba a3 ff ff       	call   8012b9 <vmalloc>
  806eff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806f03:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f07:	ba 48 00 00 00       	mov    edx,0x48
  806f0c:	be 00 00 00 00       	mov    esi,0x0
  806f11:	48 89 c7             	mov    rdi,rax
  806f14:	e8 97 4c 00 00       	call   80bbb0 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806f19:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f1c:	83 c0 01             	add    eax,0x1
  806f1f:	be 00 00 00 00       	mov    esi,0x0
  806f24:	89 c7                	mov    edi,eax
  806f26:	b8 00 00 00 00       	mov    eax,0x0
  806f2b:	e8 89 a3 ff ff       	call   8012b9 <vmalloc>
  806f30:	48 89 c2             	mov    rdx,rax
  806f33:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f37:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806f3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f3d:	83 c0 01             	add    eax,0x1
  806f40:	48 63 d0             	movsxd rdx,eax
  806f43:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f47:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806f4a:	be 00 00 00 00       	mov    esi,0x0
  806f4f:	48 89 c7             	mov    rdi,rax
  806f52:	e8 59 4c 00 00       	call   80bbb0 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806f57:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f5a:	48 63 d0             	movsxd rdx,eax
  806f5d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f61:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806f64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f68:	48 89 ce             	mov    rsi,rcx
  806f6b:	48 89 c7             	mov    rdi,rax
  806f6e:	e8 8e 4b 00 00       	call   80bb01 <memcpy>
        path->name_length = tmpnamelen;
  806f73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f77:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806f7a:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806f7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f81:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f85:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806f89:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  806f8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f91:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806f95:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806f99:	48 89 d6             	mov    rsi,rdx
  806f9c:	48 89 c7             	mov    rdi,rax
  806f9f:	ff d1                	call   rcx
  806fa1:	48 85 c0             	test   rax,rax
  806fa4:	75 3e                	jne    806fe4 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  806fa6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806faa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806fad:	48 89 c6             	mov    rsi,rax
  806fb0:	bf 10 41 81 00       	mov    edi,0x814110
  806fb5:	b8 00 00 00 00       	mov    eax,0x0
  806fba:	e8 68 9d ff ff       	call   800d27 <printf>
            vmfree(path->name);
  806fbf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806fc3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806fc6:	48 89 c7             	mov    rdi,rax
  806fc9:	e8 7a a3 ff ff       	call   801348 <vmfree>
            vmfree(path);
  806fce:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806fd2:	48 89 c7             	mov    rdi,rax
  806fd5:	e8 6e a3 ff ff       	call   801348 <vmfree>
            return NULL;
  806fda:	b8 00 00 00 00       	mov    eax,0x0
  806fdf:	e9 f2 00 00 00       	jmp    8070d6 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  806fe4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806fe8:	48 83 c0 10          	add    rax,0x10
  806fec:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806ff0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806ff4:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806ff8:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806ffb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806fff:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807003:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807007:	90                   	nop
        list_init(&path->subdirs_list);
  807008:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80700c:	48 83 c0 20          	add    rax,0x20
  807010:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  807014:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807018:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80701c:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80701f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807023:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807027:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80702b:	90                   	nop
        path->parent = parent;
  80702c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807030:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807034:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  807038:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80703c:	48 83 c0 10          	add    rax,0x10
  807040:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807044:	48 83 c2 20          	add    rdx,0x20
  807048:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80704c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  807050:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807054:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807058:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80705c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  807060:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807064:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807068:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  80706b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80706f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807073:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807077:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80707a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80707e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807082:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807086:	90                   	nop

        if(!*name)
  807087:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80708b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80708e:	84 c0                	test   al,al
  807090:	74 2a                	je     8070bc <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  807092:	eb 05                	jmp    807099 <path_walk+0x23d>
            name++;
  807094:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  807099:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80709d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070a0:	3c 2f                	cmp    al,0x2f
  8070a2:	74 f0                	je     807094 <path_walk+0x238>
        if(!*name)
  8070a4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070ab:	84 c0                	test   al,al
  8070ad:	74 10                	je     8070bf <path_walk+0x263>
            goto last_slash;

        parent = path;
  8070af:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8070b3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8070b7:	e9 ff fd ff ff       	jmp    806ebb <path_walk+0x5f>
            goto last_component;
  8070bc:	90                   	nop
  8070bd:	eb 01                	jmp    8070c0 <path_walk+0x264>
            goto last_slash;
  8070bf:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8070c0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8070c4:	83 e0 01             	and    eax,0x1
  8070c7:	48 85 c0             	test   rax,rax
  8070ca:	74 06                	je     8070d2 <path_walk+0x276>
    {
        return parent;
  8070cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8070d0:	eb 04                	jmp    8070d6 <path_walk+0x27a>
    }

    return path;
  8070d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8070d6:	c9                   	leave  
  8070d7:	c3                   	ret    

00000000008070d8 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  8070d8:	f3 0f 1e fa          	endbr64 
  8070dc:	55                   	push   rbp
  8070dd:	48 89 e5             	mov    rbp,rsp
  8070e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8070e4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8070e8:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8070ec:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8070f0:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  8070f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070f8:	83 c0 18             	add    eax,0x18
}
  8070fb:	5d                   	pop    rbp
  8070fc:	c3                   	ret    

00000000008070fd <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  8070fd:	f3 0f 1e fa          	endbr64 
  807101:	55                   	push   rbp
  807102:	48 89 e5             	mov    rbp,rsp
  807105:	48 83 ec 30          	sub    rsp,0x30
  807109:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80710d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807111:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  807115:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80711c:	00 

    for(p = &filesystem;p;p = p->next)
  80711d:	48 c7 45 f8 40 c5 80 	mov    QWORD PTR [rbp-0x8],0x80c540
  807124:	00 
  807125:	eb 40                	jmp    807167 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  807127:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80712b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80712e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807132:	48 89 d6             	mov    rsi,rdx
  807135:	48 89 c7             	mov    rdi,rax
  807138:	e8 62 4c 00 00       	call   80bd9f <strcmp>
  80713d:	85 c0                	test   eax,eax
  80713f:	75 1a                	jne    80715b <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  807141:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807145:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  807149:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80714d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807151:	48 89 d6             	mov    rsi,rdx
  807154:	48 89 c7             	mov    rdi,rax
  807157:	ff d1                	call   rcx
  807159:	eb 18                	jmp    807173 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  80715b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80715f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807163:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807167:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80716c:	75 b9                	jne    807127 <mount_fs+0x2a>
        }
    return 0;
  80716e:	b8 00 00 00 00       	mov    eax,0x0
}
  807173:	c9                   	leave  
  807174:	c3                   	ret    

0000000000807175 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  807175:	f3 0f 1e fa          	endbr64 
  807179:	55                   	push   rbp
  80717a:	48 89 e5             	mov    rbp,rsp
  80717d:	48 83 ec 20          	sub    rsp,0x20
  807181:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  807185:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80718c:	00 

    for(p = &filesystem;p;p = p->next)
  80718d:	48 c7 45 f8 40 c5 80 	mov    QWORD PTR [rbp-0x8],0x80c540
  807194:	00 
  807195:	eb 30                	jmp    8071c7 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  807197:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80719b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80719e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071a5:	48 89 d6             	mov    rsi,rdx
  8071a8:	48 89 c7             	mov    rdi,rax
  8071ab:	e8 ef 4b 00 00       	call   80bd9f <strcmp>
  8071b0:	85 c0                	test   eax,eax
  8071b2:	75 07                	jne    8071bb <register_filesystem+0x46>
            return 0;
  8071b4:	b8 00 00 00 00       	mov    eax,0x0
  8071b9:	eb 32                	jmp    8071ed <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8071bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071bf:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071c3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8071c7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8071cc:	75 c9                	jne    807197 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8071ce:	48 8b 15 83 53 00 00 	mov    rdx,QWORD PTR [rip+0x5383]        # 80c558 <filesystem+0x18>
  8071d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071d9:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  8071dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071e1:	48 89 05 70 53 00 00 	mov    QWORD PTR [rip+0x5370],rax        # 80c558 <filesystem+0x18>

    return 1;
  8071e8:	b8 01 00 00 00       	mov    eax,0x1
}
  8071ed:	c9                   	leave  
  8071ee:	c3                   	ret    

00000000008071ef <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  8071ef:	f3 0f 1e fa          	endbr64 
  8071f3:	55                   	push   rbp
  8071f4:	48 89 e5             	mov    rbp,rsp
  8071f7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  8071fb:	48 c7 45 f8 40 c5 80 	mov    QWORD PTR [rbp-0x8],0x80c540
  807202:	00 

    while(p->next)
  807203:	eb 41                	jmp    807246 <unregister_filesystem+0x57>
        if(p->next == fs)
  807205:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807209:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80720d:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  807211:	75 27                	jne    80723a <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  807213:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807217:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80721b:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80721f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807223:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  807227:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80722b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  807232:	00 
            return 1;
  807233:	b8 01 00 00 00       	mov    eax,0x1
  807238:	eb 1e                	jmp    807258 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  80723a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80723e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807242:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  807246:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80724a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80724e:	48 85 c0             	test   rax,rax
  807251:	75 b2                	jne    807205 <unregister_filesystem+0x16>
    return 0;
  807253:	b8 00 00 00 00       	mov    eax,0x0
}
  807258:	5d                   	pop    rbp
  807259:	c3                   	ret    

000000000080725a <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  80725a:	f3 0f 1e fa          	endbr64 
  80725e:	55                   	push   rbp
  80725f:	48 89 e5             	mov    rbp,rsp
  807262:	48 83 ec 10          	sub    rsp,0x10
  807266:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  80726a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80726e:	48 89 c7             	mov    rdi,rax
  807271:	b8 00 00 00 00       	mov    eax,0x0
  807276:	e8 ac 9a ff ff       	call   800d27 <printf>
    return 0;
  80727b:	b8 00 00 00 00       	mov    eax,0x0
}
  807280:	c9                   	leave  
  807281:	c3                   	ret    

0000000000807282 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  807282:	f3 0f 1e fa          	endbr64 
  807286:	55                   	push   rbp
  807287:	48 89 e5             	mov    rbp,rsp
  80728a:	48 83 ec 50          	sub    rsp,0x50
  80728e:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  807292:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  807295:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80729c:	00 
    long pathlen = 0;
  80729d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8072a4:	00 
    long error = 0;
  8072a5:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8072ac:	00 
    struct dir_entry * dentry = NULL;
  8072ad:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8072b4:	00 
    struct file * filp = NULL;
  8072b5:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8072bc:	00 
    struct file ** f = NULL;
  8072bd:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8072c4:	00 
    int fd = -1;
  8072c5:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  8072cc:	b8 00 00 00 00       	mov    eax,0x0
  8072d1:	e8 e3 9f ff ff       	call   8012b9 <vmalloc>
  8072d6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  8072da:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8072df:	75 0c                	jne    8072ed <sys_open+0x6b>
        return -ENOMEM;
  8072e1:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  8072e8:	e9 aa 02 00 00       	jmp    807597 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  8072ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8072f1:	ba 00 10 00 00       	mov    edx,0x1000
  8072f6:	be 00 00 00 00       	mov    esi,0x0
  8072fb:	48 89 c7             	mov    rdi,rax
  8072fe:	e8 ad 48 00 00       	call   80bbb0 <memset>
    pathlen = strlen(filename);
  807303:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807307:	48 89 c7             	mov    rdi,rax
  80730a:	e8 0f 4b 00 00       	call   80be1e <strlen>
  80730f:	48 98                	cdqe   
  807311:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  807315:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  80731a:	7f 18                	jg     807334 <sys_open+0xb2>
    {
        vmfree(path);
  80731c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807320:	48 89 c7             	mov    rdi,rax
  807323:	e8 20 a0 ff ff       	call   801348 <vmfree>
        return -EFAULT;
  807328:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80732f:	e9 63 02 00 00       	jmp    807597 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807334:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  80733b:	00 
  80733c:	7e 18                	jle    807356 <sys_open+0xd4>
    {
        vmfree(path);
  80733e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807342:	48 89 c7             	mov    rdi,rax
  807345:	e8 fe 9f ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  80734a:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807351:	e9 41 02 00 00       	jmp    807597 <sys_open+0x315>
    }
    strcpy(filename,path);
  807356:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80735a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80735e:	48 89 d6             	mov    rsi,rdx
  807361:	48 89 c7             	mov    rdi,rax
  807364:	e8 96 48 00 00       	call   80bbff <strcpy>

    dentry = path_walk(path,0);
  807369:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80736d:	be 00 00 00 00       	mov    esi,0x0
  807372:	48 89 c7             	mov    rdi,rax
  807375:	e8 e2 fa ff ff       	call   806e5c <path_walk>
  80737a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  80737e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807382:	48 89 c7             	mov    rdi,rax
  807385:	e8 be 9f ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  80738a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80738f:	75 0c                	jne    80739d <sys_open+0x11b>
        return -ENOENT;
  807391:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807398:	e9 fa 01 00 00       	jmp    807597 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  80739d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8073a0:	25 00 40 00 00       	and    eax,0x4000
  8073a5:	85 c0                	test   eax,eax
  8073a7:	74 1e                	je     8073c7 <sys_open+0x145>
  8073a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073ad:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8073b1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8073b5:	48 83 f8 02          	cmp    rax,0x2
  8073b9:	74 0c                	je     8073c7 <sys_open+0x145>
        return -ENOTDIR;
  8073bb:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8073c2:	e9 d0 01 00 00       	jmp    807597 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8073c7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8073ca:	25 00 40 00 00       	and    eax,0x4000
  8073cf:	85 c0                	test   eax,eax
  8073d1:	75 1e                	jne    8073f1 <sys_open+0x16f>
  8073d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073d7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8073db:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8073df:	48 83 f8 02          	cmp    rax,0x2
  8073e3:	75 0c                	jne    8073f1 <sys_open+0x16f>
        return -EISDIR;
  8073e5:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  8073ec:	e9 a6 01 00 00       	jmp    807597 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  8073f1:	b8 00 00 00 00       	mov    eax,0x0
  8073f6:	e8 be 9e ff ff       	call   8012b9 <vmalloc>
  8073fb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  8073ff:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807403:	ba 28 00 00 00       	mov    edx,0x28
  807408:	be 00 00 00 00       	mov    esi,0x0
  80740d:	48 89 c7             	mov    rdi,rax
  807410:	e8 9b 47 00 00       	call   80bbb0 <memset>
    filp->dentry = dentry;
  807415:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807419:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80741d:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  807421:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807424:	48 63 d0             	movsxd rdx,eax
  807427:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80742b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  80742f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807433:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807437:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80743b:	83 e0 04             	and    eax,0x4
  80743e:	48 85 c0             	test   rax,rax
  807441:	74 0e                	je     807451 <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807443:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807447:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80744e:	00 
  80744f:	eb 14                	jmp    807465 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  807451:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807455:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807459:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80745d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807461:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807465:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807469:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80746d:	48 85 c0             	test   rax,rax
  807470:	74 33                	je     8074a5 <sys_open+0x223>
  807472:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807476:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80747a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80747d:	48 85 c0             	test   rax,rax
  807480:	74 23                	je     8074a5 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  807482:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807486:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80748a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80748d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807491:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807495:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807499:	48 89 d6             	mov    rsi,rdx
  80749c:	48 89 c7             	mov    rdi,rax
  80749f:	ff d1                	call   rcx
  8074a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  8074a5:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8074aa:	74 18                	je     8074c4 <sys_open+0x242>
    {
        vmfree(filp);
  8074ac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074b0:	48 89 c7             	mov    rdi,rax
  8074b3:	e8 90 9e ff ff       	call   801348 <vmfree>
        return -EFAULT;
  8074b8:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8074bf:	e9 d3 00 00 00       	jmp    807597 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  8074c4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074c8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8074cc:	25 00 02 00 00       	and    eax,0x200
  8074d1:	48 85 c0             	test   rax,rax
  8074d4:	74 13                	je     8074e9 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  8074d6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8074de:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8074e2:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8074e9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074ed:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8074f1:	25 00 04 00 00       	and    eax,0x400
  8074f6:	48 85 c0             	test   rax,rax
  8074f9:	74 19                	je     807514 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8074fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807503:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807507:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80750a:	48 89 c2             	mov    rdx,rax
  80750d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807511:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807514:	48 8b 05 85 cf c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cf85]        # 4144a0 <current>
  80751b:	48 05 c4 00 00 00    	add    rax,0xc4
  807521:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807525:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80752c:	eb 28                	jmp    807556 <sys_open+0x2d4>
        if(f[i] == NULL)
  80752e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807531:	48 98                	cdqe   
  807533:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80753a:	00 
  80753b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80753f:	48 01 d0             	add    rax,rdx
  807542:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807545:	48 85 c0             	test   rax,rax
  807548:	75 08                	jne    807552 <sys_open+0x2d0>
        {
            fd = i;
  80754a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80754d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  807550:	eb 0a                	jmp    80755c <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807552:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807556:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80755a:	7e d2                	jle    80752e <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80755c:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  807560:	75 15                	jne    807577 <sys_open+0x2f5>
    {
        vmfree(filp);
  807562:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807566:	48 89 c7             	mov    rdi,rax
  807569:	e8 da 9d ff ff       	call   801348 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80756e:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  807575:	eb 20                	jmp    807597 <sys_open+0x315>
    }
    f[fd] = filp;
  807577:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80757a:	48 98                	cdqe   
  80757c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807583:	00 
  807584:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807588:	48 01 c2             	add    rdx,rax
  80758b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80758f:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  807592:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807595:	48 98                	cdqe   
}
  807597:	c9                   	leave  
  807598:	c3                   	ret    

0000000000807599 <sys_close>:

unsigned long sys_close(int fd)
{
  807599:	f3 0f 1e fa          	endbr64 
  80759d:	55                   	push   rbp
  80759e:	48 89 e5             	mov    rbp,rsp
  8075a1:	48 83 ec 20          	sub    rsp,0x20
  8075a5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  8075a8:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8075af:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8075b0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8075b4:	78 06                	js     8075bc <sys_close+0x23>
  8075b6:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8075ba:	7e 0c                	jle    8075c8 <sys_close+0x2f>
        return -EBADF;
  8075bc:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8075c3:	e9 87 00 00 00       	jmp    80764f <sys_close+0xb6>

    filp = current->openf[fd];
  8075c8:	48 8b 05 d1 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ced1]        # 4144a0 <current>
  8075cf:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8075d2:	48 63 d2             	movsxd rdx,edx
  8075d5:	48 83 c2 18          	add    rdx,0x18
  8075d9:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8075de:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8075e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075e6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8075ea:	48 85 c0             	test   rax,rax
  8075ed:	74 35                	je     807624 <sys_close+0x8b>
  8075ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075f3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8075f7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8075fb:	48 85 c0             	test   rax,rax
  8075fe:	74 24                	je     807624 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  807600:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807604:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807608:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80760c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807610:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807614:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807618:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80761c:	48 89 d6             	mov    rsi,rdx
  80761f:	48 89 c7             	mov    rdi,rax
  807622:	ff d1                	call   rcx

    vmfree(filp);
  807624:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807628:	48 89 c7             	mov    rdi,rax
  80762b:	e8 18 9d ff ff       	call   801348 <vmfree>
    current->openf[fd] = NULL;
  807630:	48 8b 05 69 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ce69]        # 4144a0 <current>
  807637:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80763a:	48 63 d2             	movsxd rdx,edx
  80763d:	48 83 c2 18          	add    rdx,0x18
  807641:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  807648:	00 00 

    return 0;
  80764a:	b8 00 00 00 00       	mov    eax,0x0
}
  80764f:	c9                   	leave  
  807650:	c3                   	ret    

0000000000807651 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  807651:	f3 0f 1e fa          	endbr64 
  807655:	55                   	push   rbp
  807656:	48 89 e5             	mov    rbp,rsp
  807659:	48 83 ec 30          	sub    rsp,0x30
  80765d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807660:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807664:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807668:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80766f:	00 
    unsigned long ret = 0;
  807670:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807677:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807678:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80767c:	78 06                	js     807684 <sys_read+0x33>
  80767e:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807682:	7e 09                	jle    80768d <sys_read+0x3c>
        return -EBADF;
  807684:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80768b:	eb 72                	jmp    8076ff <sys_read+0xae>
    if(count < 0)
  80768d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807692:	79 09                	jns    80769d <sys_read+0x4c>
        return -EINVAL;
  807694:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80769b:	eb 62                	jmp    8076ff <sys_read+0xae>

    filp = current->openf[fd];
  80769d:	48 8b 05 fc cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cdfc]        # 4144a0 <current>
  8076a4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8076a7:	48 63 d2             	movsxd rdx,edx
  8076aa:	48 83 c2 18          	add    rdx,0x18
  8076ae:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8076b3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  8076b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076bb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076bf:	48 85 c0             	test   rax,rax
  8076c2:	74 37                	je     8076fb <sys_read+0xaa>
  8076c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076c8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076cc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8076d0:	48 85 c0             	test   rax,rax
  8076d3:	74 26                	je     8076fb <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  8076d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076d9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076dd:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  8076e1:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8076e5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8076e9:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8076ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076f1:	48 89 c7             	mov    rdi,rax
  8076f4:	41 ff d0             	call   r8
  8076f7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8076fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8076ff:	c9                   	leave  
  807700:	c3                   	ret    

0000000000807701 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  807701:	f3 0f 1e fa          	endbr64 
  807705:	55                   	push   rbp
  807706:	48 89 e5             	mov    rbp,rsp
  807709:	48 83 ec 30          	sub    rsp,0x30
  80770d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807710:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807714:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807718:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80771f:	00 
    unsigned long ret = 0;
  807720:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807727:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807728:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80772c:	78 06                	js     807734 <sys_write+0x33>
  80772e:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807732:	7e 09                	jle    80773d <sys_write+0x3c>
        return -EBADF;
  807734:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80773b:	eb 72                	jmp    8077af <sys_write+0xae>
    if(count < 0)
  80773d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807742:	79 09                	jns    80774d <sys_write+0x4c>
        return -EINVAL;
  807744:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80774b:	eb 62                	jmp    8077af <sys_write+0xae>

    filp = current->openf[fd];
  80774d:	48 8b 05 4c cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cd4c]        # 4144a0 <current>
  807754:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807757:	48 63 d2             	movsxd rdx,edx
  80775a:	48 83 c2 18          	add    rdx,0x18
  80775e:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807763:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807767:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80776b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80776f:	48 85 c0             	test   rax,rax
  807772:	74 37                	je     8077ab <sys_write+0xaa>
  807774:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807778:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80777c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807780:	48 85 c0             	test   rax,rax
  807783:	74 26                	je     8077ab <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  807785:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807789:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80778d:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  807791:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807795:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807799:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80779d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077a1:	48 89 c7             	mov    rdi,rax
  8077a4:	41 ff d0             	call   r8
  8077a7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8077ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8077af:	c9                   	leave  
  8077b0:	c3                   	ret    

00000000008077b1 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  8077b1:	f3 0f 1e fa          	endbr64 
  8077b5:	55                   	push   rbp
  8077b6:	48 89 e5             	mov    rbp,rsp
  8077b9:	48 83 ec 20          	sub    rsp,0x20
  8077bd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8077c0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8077c4:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8077c7:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8077ce:	00 
    unsigned long ret = 0;
  8077cf:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8077d6:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  8077d7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8077db:	78 06                	js     8077e3 <sys_lseek+0x32>
  8077dd:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8077e1:	7e 09                	jle    8077ec <sys_lseek+0x3b>
        return -EBADF;
  8077e3:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8077ea:	eb 78                	jmp    807864 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  8077ec:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8077f0:	78 06                	js     8077f8 <sys_lseek+0x47>
  8077f2:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  8077f6:	7e 09                	jle    807801 <sys_lseek+0x50>
        return -EINVAL;
  8077f8:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8077ff:	eb 63                	jmp    807864 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807801:	48 8b 05 98 cc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cc98]        # 4144a0 <current>
  807808:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80780b:	48 63 d2             	movsxd rdx,edx
  80780e:	48 83 c2 18          	add    rdx,0x18
  807812:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807817:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  80781b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80781f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807823:	48 85 c0             	test   rax,rax
  807826:	74 38                	je     807860 <sys_lseek+0xaf>
  807828:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80782c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807830:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807834:	48 85 c0             	test   rax,rax
  807837:	74 27                	je     807860 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807839:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80783d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807841:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807845:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807848:	48 63 d0             	movsxd rdx,eax
  80784b:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80784f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807853:	48 89 ce             	mov    rsi,rcx
  807856:	48 89 c7             	mov    rdi,rax
  807859:	41 ff d0             	call   r8
  80785c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807860:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807864:	c9                   	leave  
  807865:	c3                   	ret    

0000000000807866 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807866:	f3 0f 1e fa          	endbr64 
  80786a:	55                   	push   rbp
  80786b:	48 89 e5             	mov    rbp,rsp
  80786e:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  807872:	48 8b 05 27 cc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cc27]        # 4144a0 <current>
  807879:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  807880:	48 2d d0 00 00 00    	sub    rax,0xd0
  807886:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  80788a:	bf 38 41 81 00       	mov    edi,0x814138
  80788f:	b8 00 00 00 00       	mov    eax,0x0
  807894:	e8 8e 94 ff ff       	call   800d27 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  807899:	90                   	nop
  80789a:	c9                   	leave  
  80789b:	c3                   	ret    

000000000080789c <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  80789c:	f3 0f 1e fa          	endbr64 
  8078a0:	55                   	push   rbp
  8078a1:	48 89 e5             	mov    rbp,rsp
  8078a4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078a8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8078ac:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8078af:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  8078b3:	90                   	nop
  8078b4:	5d                   	pop    rbp
  8078b5:	c3                   	ret    

00000000008078b6 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  8078b6:	f3 0f 1e fa          	endbr64 
  8078ba:	55                   	push   rbp
  8078bb:	48 89 e5             	mov    rbp,rsp
  8078be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  8078c2:	90                   	nop
  8078c3:	5d                   	pop    rbp
  8078c4:	c3                   	ret    

00000000008078c5 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  8078c5:	f3 0f 1e fa          	endbr64 
  8078c9:	55                   	push   rbp
  8078ca:	48 89 e5             	mov    rbp,rsp
  8078cd:	48 83 ec 10          	sub    rsp,0x10
  8078d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078d5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  8078d9:	bf 43 41 81 00       	mov    edi,0x814143
  8078de:	b8 00 00 00 00       	mov    eax,0x0
  8078e3:	e8 3f 94 ff ff       	call   800d27 <printf>
    switch(cmd)
  8078e8:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8078ed:	74 09                	je     8078f8 <sys_reboot+0x33>
  8078ef:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  8078f4:	74 13                	je     807909 <sys_reboot+0x44>
  8078f6:	eb 22                	jmp    80791a <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  8078f8:	be fe 00 00 00       	mov    esi,0xfe
  8078fd:	bf 64 00 00 00       	mov    edi,0x64
  807902:	e8 09 e1 ff ff       	call   805a10 <outb>
            break;
  807907:	eb 21                	jmp    80792a <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  807909:	bf 50 41 81 00       	mov    edi,0x814150
  80790e:	b8 00 00 00 00       	mov    eax,0x0
  807913:	e8 0f 94 ff ff       	call   800d27 <printf>
            break;
  807918:	eb 10                	jmp    80792a <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  80791a:	bf 70 41 81 00       	mov    edi,0x814170
  80791f:	b8 00 00 00 00       	mov    eax,0x0
  807924:	e8 fe 93 ff ff       	call   800d27 <printf>
            break;
  807929:	90                   	nop
    }
    return 0;
  80792a:	b8 00 00 00 00       	mov    eax,0x0
}
  80792f:	c9                   	leave  
  807930:	c3                   	ret    

0000000000807931 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  807931:	f3 0f 1e fa          	endbr64 
  807935:	55                   	push   rbp
  807936:	48 89 e5             	mov    rbp,rsp
  807939:	48 83 ec 30          	sub    rsp,0x30
  80793d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  807941:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807948:	00 
    long pathlen = 0;
  807949:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807950:	00 
    struct dir_entry * dentry = NULL;
  807951:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807958:	00 

    printf("sys_chdir\n");
  807959:	bf 87 41 81 00       	mov    edi,0x814187
  80795e:	b8 00 00 00 00       	mov    eax,0x0
  807963:	e8 bf 93 ff ff       	call   800d27 <printf>
    path = (char *)vmalloc();
  807968:	b8 00 00 00 00       	mov    eax,0x0
  80796d:	e8 47 99 ff ff       	call   8012b9 <vmalloc>
  807972:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  807976:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80797b:	75 0c                	jne    807989 <sys_chdir+0x58>
        return -ENOMEM;
  80797d:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807984:	e9 ca 00 00 00       	jmp    807a53 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  807989:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80798d:	ba 00 10 00 00       	mov    edx,0x1000
  807992:	be 00 00 00 00       	mov    esi,0x0
  807997:	48 89 c7             	mov    rdi,rax
  80799a:	e8 11 42 00 00       	call   80bbb0 <memset>
    pathlen = strlen(filename);
  80799f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079a3:	48 89 c7             	mov    rdi,rax
  8079a6:	e8 73 44 00 00       	call   80be1e <strlen>
  8079ab:	48 98                	cdqe   
  8079ad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8079b1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8079b6:	7f 18                	jg     8079d0 <sys_chdir+0x9f>
    {
        vmfree(path);
  8079b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079bc:	48 89 c7             	mov    rdi,rax
  8079bf:	e8 84 99 ff ff       	call   801348 <vmfree>
        return -EFAULT;
  8079c4:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079cb:	e9 83 00 00 00       	jmp    807a53 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8079d0:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  8079d7:	00 
  8079d8:	7e 15                	jle    8079ef <sys_chdir+0xbe>
    {
        vmfree(path);
  8079da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079de:	48 89 c7             	mov    rdi,rax
  8079e1:	e8 62 99 ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  8079e6:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8079ed:	eb 64                	jmp    807a53 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8079ef:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8079f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079f7:	48 89 d6             	mov    rsi,rdx
  8079fa:	48 89 c7             	mov    rdi,rax
  8079fd:	e8 fd 41 00 00       	call   80bbff <strcpy>

    dentry = path_walk(path,0);
  807a02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a06:	be 00 00 00 00       	mov    esi,0x0
  807a0b:	48 89 c7             	mov    rdi,rax
  807a0e:	e8 49 f4 ff ff       	call   806e5c <path_walk>
  807a13:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  807a17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a1b:	48 89 c7             	mov    rdi,rax
  807a1e:	e8 25 99 ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  807a23:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  807a28:	75 09                	jne    807a33 <sys_chdir+0x102>
        return -ENOENT;
  807a2a:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807a31:	eb 20                	jmp    807a53 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807a33:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807a37:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a3b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a3f:	48 83 f8 02          	cmp    rax,0x2
  807a43:	74 09                	je     807a4e <sys_chdir+0x11d>
        return -ENOTDIR;
  807a45:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807a4c:	eb 05                	jmp    807a53 <sys_chdir+0x122>
    return 0;
  807a4e:	b8 00 00 00 00       	mov    eax,0x0
}
  807a53:	c9                   	leave  
  807a54:	c3                   	ret    

0000000000807a55 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807a55:	f3 0f 1e fa          	endbr64 
  807a59:	55                   	push   rbp
  807a5a:	48 89 e5             	mov    rbp,rsp
  807a5d:	48 83 ec 30          	sub    rsp,0x30
  807a61:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807a64:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807a68:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807a6c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807a73:	00 
    unsigned long ret = 0;
  807a74:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807a7b:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  807a7c:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807a80:	78 06                	js     807a88 <sys_getdents+0x33>
  807a82:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807a86:	7e 09                	jle    807a91 <sys_getdents+0x3c>
        return -EBADF;
  807a88:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807a8f:	eb 72                	jmp    807b03 <sys_getdents+0xae>
    if(count < 0)
  807a91:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807a96:	79 09                	jns    807aa1 <sys_getdents+0x4c>
        return -EINVAL;
  807a98:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807a9f:	eb 62                	jmp    807b03 <sys_getdents+0xae>

    filp = current->openf[fd];
  807aa1:	48 8b 05 f8 c9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c9f8]        # 4144a0 <current>
  807aa8:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807aab:	48 63 d2             	movsxd rdx,edx
  807aae:	48 83 c2 18          	add    rdx,0x18
  807ab2:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807ab7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807abb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807abf:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ac3:	48 85 c0             	test   rax,rax
  807ac6:	74 37                	je     807aff <sys_getdents+0xaa>
  807ac8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807acc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ad0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ad4:	48 85 c0             	test   rax,rax
  807ad7:	74 26                	je     807aff <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  807ad9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807add:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ae1:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  807ae5:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807ae9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807aed:	ba d8 70 80 00       	mov    edx,0x8070d8
  807af2:	48 89 ce             	mov    rsi,rcx
  807af5:	48 89 c7             	mov    rdi,rax
  807af8:	41 ff d0             	call   r8
  807afb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807aff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807b03:	c9                   	leave  
  807b04:	c3                   	ret    

0000000000807b05 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  807b05:	f3 0f 1e fa          	endbr64 
  807b09:	55                   	push   rbp
  807b0a:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  807b0d:	0f b6 05 b9 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fcb9]        # 4277cd <k_shift>
  807b14:	84 c0                	test   al,al
  807b16:	0f 94 c0             	sete   al
  807b19:	88 05 ae fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fcae],al        # 4277cd <k_shift>
}
  807b1f:	90                   	nop
  807b20:	5d                   	pop    rbp
  807b21:	c3                   	ret    

0000000000807b22 <ctrl>:
void ctrl()
{
  807b22:	f3 0f 1e fa          	endbr64 
  807b26:	55                   	push   rbp
  807b27:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  807b2a:	0f b6 05 9d fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc9d]        # 4277ce <k_ctrl>
  807b31:	84 c0                	test   al,al
  807b33:	0f 94 c0             	sete   al
  807b36:	88 05 92 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc92],al        # 4277ce <k_ctrl>
}
  807b3c:	90                   	nop
  807b3d:	5d                   	pop    rbp
  807b3e:	c3                   	ret    

0000000000807b3f <capslock>:
void capslock()
{
  807b3f:	f3 0f 1e fa          	endbr64 
  807b43:	55                   	push   rbp
  807b44:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807b47:	0f b6 05 81 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc81]        # 4277cf <k_capslock>
  807b4e:	84 c0                	test   al,al
  807b50:	0f 94 c0             	sete   al
  807b53:	88 05 76 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc76],al        # 4277cf <k_capslock>
}
  807b59:	90                   	nop
  807b5a:	5d                   	pop    rbp
  807b5b:	c3                   	ret    

0000000000807b5c <to_ascii>:
char to_ascii(char scan_code)
{
  807b5c:	f3 0f 1e fa          	endbr64 
  807b60:	55                   	push   rbp
  807b61:	48 89 e5             	mov    rbp,rsp
  807b64:	89 f8                	mov    eax,edi
  807b66:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807b69:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807b70:	e9 c7 00 00 00       	jmp    807c3c <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807b75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b78:	48 63 d0             	movsxd rdx,eax
  807b7b:	48 89 d0             	mov    rax,rdx
  807b7e:	48 c1 e0 02          	shl    rax,0x2
  807b82:	48 01 d0             	add    rax,rdx
  807b85:	48 05 02 43 81 00    	add    rax,0x814302
  807b8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b8e:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  807b91:	0f 85 a1 00 00 00    	jne    807c38 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807b97:	0f b6 05 31 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc31]        # 4277cf <k_capslock>
  807b9e:	84 c0                	test   al,al
  807ba0:	74 55                	je     807bf7 <to_ascii+0x9b>
  807ba2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807ba5:	48 63 d0             	movsxd rdx,eax
  807ba8:	48 89 d0             	mov    rax,rdx
  807bab:	48 c1 e0 02          	shl    rax,0x2
  807baf:	48 01 d0             	add    rax,rdx
  807bb2:	48 05 00 43 81 00    	add    rax,0x814300
  807bb8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bbb:	3c 60                	cmp    al,0x60
  807bbd:	7e 38                	jle    807bf7 <to_ascii+0x9b>
  807bbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bc2:	48 63 d0             	movsxd rdx,eax
  807bc5:	48 89 d0             	mov    rax,rdx
  807bc8:	48 c1 e0 02          	shl    rax,0x2
  807bcc:	48 01 d0             	add    rax,rdx
  807bcf:	48 05 00 43 81 00    	add    rax,0x814300
  807bd5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bd8:	3c 7a                	cmp    al,0x7a
  807bda:	7f 1b                	jg     807bf7 <to_ascii+0x9b>
  807bdc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bdf:	48 63 d0             	movsxd rdx,eax
  807be2:	48 89 d0             	mov    rax,rdx
  807be5:	48 c1 e0 02          	shl    rax,0x2
  807be9:	48 01 d0             	add    rax,rdx
  807bec:	48 05 01 43 81 00    	add    rax,0x814301
  807bf2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bf5:	eb 54                	jmp    807c4b <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  807bf7:	0f b6 05 cf fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fbcf]        # 4277cd <k_shift>
  807bfe:	84 c0                	test   al,al
  807c00:	74 1b                	je     807c1d <to_ascii+0xc1>
  807c02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c05:	48 63 d0             	movsxd rdx,eax
  807c08:	48 89 d0             	mov    rax,rdx
  807c0b:	48 c1 e0 02          	shl    rax,0x2
  807c0f:	48 01 d0             	add    rax,rdx
  807c12:	48 05 01 43 81 00    	add    rax,0x814301
  807c18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c1b:	eb 2e                	jmp    807c4b <to_ascii+0xef>
            else return key_map[i].ascii;
  807c1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c20:	48 63 d0             	movsxd rdx,eax
  807c23:	48 89 d0             	mov    rax,rdx
  807c26:	48 c1 e0 02          	shl    rax,0x2
  807c2a:	48 01 d0             	add    rax,rdx
  807c2d:	48 05 00 43 81 00    	add    rax,0x814300
  807c33:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c36:	eb 13                	jmp    807c4b <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807c38:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c3c:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  807c40:	0f 8e 2f ff ff ff    	jle    807b75 <to_ascii+0x19>
        }

    return '\0';
  807c46:	b8 00 00 00 00       	mov    eax,0x0
}
  807c4b:	5d                   	pop    rbp
  807c4c:	c3                   	ret    

0000000000807c4d <init_kb>:
int init_kb()
{
  807c4d:	f3 0f 1e fa          	endbr64 
  807c51:	55                   	push   rbp
  807c52:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807c55:	bf 40 42 81 00       	mov    edi,0x814240
  807c5a:	e8 6d a9 ff ff       	call   8025cc <reg_device>
    reg_driver(&drv_keyboard);
  807c5f:	bf a0 41 81 00       	mov    edi,0x8141a0
  807c64:	e8 4b ac ff ff       	call   8028b4 <reg_driver>
}
  807c69:	90                   	nop
  807c6a:	5d                   	pop    rbp
  807c6b:	c3                   	ret    

0000000000807c6c <key_proc>:
int key_proc()
{
  807c6c:	f3 0f 1e fa          	endbr64 
  807c70:	55                   	push   rbp
  807c71:	48 89 e5             	mov    rbp,rsp
  807c74:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("cli");
  807c78:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807c79:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  807c7d:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  807c81:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807c85:	bf 60 00 00 00       	mov    edi,0x60
  807c8a:	e8 9a dd ff ff       	call   805a29 <inb>
  807c8f:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  807c92:	8b 05 d4 48 00 00    	mov    eax,DWORD PTR [rip+0x48d4]        # 80c56c <key_bufq+0xc>
  807c98:	83 c0 01             	add    eax,0x1
  807c9b:	8b 0d cf 48 00 00    	mov    ecx,DWORD PTR [rip+0x48cf]        # 80c570 <key_bufq+0x10>
  807ca1:	99                   	cdq    
  807ca2:	f7 f9                	idiv   ecx
  807ca4:	8b 05 be 48 00 00    	mov    eax,DWORD PTR [rip+0x48be]        # 80c568 <key_bufq+0x8>
  807caa:	39 c2                	cmp    edx,eax
  807cac:	74 32                	je     807ce0 <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  807cae:	48 8b 15 ab 48 00 00 	mov    rdx,QWORD PTR [rip+0x48ab]        # 80c560 <key_bufq>
  807cb5:	8b 05 b1 48 00 00    	mov    eax,DWORD PTR [rip+0x48b1]        # 80c56c <key_bufq+0xc>
  807cbb:	48 98                	cdqe   
  807cbd:	48 01 c2             	add    rdx,rax
  807cc0:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807cc4:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  807cc6:	8b 05 a0 48 00 00    	mov    eax,DWORD PTR [rip+0x48a0]        # 80c56c <key_bufq+0xc>
  807ccc:	83 c0 01             	add    eax,0x1
  807ccf:	8b 0d 9b 48 00 00    	mov    ecx,DWORD PTR [rip+0x489b]        # 80c570 <key_bufq+0x10>
  807cd5:	99                   	cdq    
  807cd6:	f7 f9                	idiv   ecx
  807cd8:	89 d0                	mov    eax,edx
  807cda:	89 05 8c 48 00 00    	mov    DWORD PTR [rip+0x488c],eax        # 80c56c <key_bufq+0xc>
    }

    if(scan1==0x48)
  807ce0:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  807ce4:	75 0a                	jne    807cf0 <key_proc+0x84>
        scr_up();
  807ce6:	b8 00 00 00 00       	mov    eax,0x0
  807ceb:	e8 52 ef ff ff       	call   806c42 <scr_up>
    if(scan1==0x50)
  807cf0:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  807cf4:	75 0a                	jne    807d00 <key_proc+0x94>
        scr_down();
  807cf6:	b8 00 00 00 00       	mov    eax,0x0
  807cfb:	e8 dc ef ff ff       	call   806cdc <scr_down>
    switch (scan1)
  807d00:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807d04:	3d b6 00 00 00       	cmp    eax,0xb6
  807d09:	74 41                	je     807d4c <key_proc+0xe0>
  807d0b:	3d b6 00 00 00       	cmp    eax,0xb6
  807d10:	7f 5e                	jg     807d70 <key_proc+0x104>
  807d12:	3d aa 00 00 00       	cmp    eax,0xaa
  807d17:	74 33                	je     807d4c <key_proc+0xe0>
  807d19:	3d aa 00 00 00       	cmp    eax,0xaa
  807d1e:	7f 50                	jg     807d70 <key_proc+0x104>
  807d20:	3d 9d 00 00 00       	cmp    eax,0x9d
  807d25:	74 31                	je     807d58 <key_proc+0xec>
  807d27:	3d 9d 00 00 00       	cmp    eax,0x9d
  807d2c:	7f 42                	jg     807d70 <key_proc+0x104>
  807d2e:	83 f8 3a             	cmp    eax,0x3a
  807d31:	74 31                	je     807d64 <key_proc+0xf8>
  807d33:	83 f8 3a             	cmp    eax,0x3a
  807d36:	7f 38                	jg     807d70 <key_proc+0x104>
  807d38:	83 f8 36             	cmp    eax,0x36
  807d3b:	74 0f                	je     807d4c <key_proc+0xe0>
  807d3d:	83 f8 36             	cmp    eax,0x36
  807d40:	7f 2e                	jg     807d70 <key_proc+0x104>
  807d42:	83 f8 1d             	cmp    eax,0x1d
  807d45:	74 11                	je     807d58 <key_proc+0xec>
  807d47:	83 f8 2a             	cmp    eax,0x2a
  807d4a:	75 24                	jne    807d70 <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807d4c:	b8 00 00 00 00       	mov    eax,0x0
  807d51:	e8 af fd ff ff       	call   807b05 <shift>
            break;
  807d56:	eb 19                	jmp    807d71 <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  807d58:	b8 00 00 00 00       	mov    eax,0x0
  807d5d:	e8 c0 fd ff ff       	call   807b22 <ctrl>
            break;
  807d62:	eb 0d                	jmp    807d71 <key_proc+0x105>
        case 0x3a:
            capslock();
  807d64:	b8 00 00 00 00       	mov    eax,0x0
  807d69:	e8 d1 fd ff ff       	call   807b3f <capslock>
            break;
  807d6e:	eb 01                	jmp    807d71 <key_proc+0x105>
        default:
            break;
  807d70:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  807d71:	b8 00 00 00 00       	mov    eax,0x0
  807d76:	e8 c3 dc ff ff       	call   805a3e <eoi>
    asm volatile("leave\r\n iretq");
  807d7b:	c9                   	leave  
  807d7c:	48 cf                	iretq  
}
  807d7e:	90                   	nop
  807d7f:	c9                   	leave  
  807d80:	c3                   	ret    

0000000000807d81 <sys_analyse_key>:

char sys_analyse_key()
{
  807d81:	f3 0f 1e fa          	endbr64 
  807d85:	55                   	push   rbp
  807d86:	48 89 e5             	mov    rbp,rsp
  807d89:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  807d8d:	8b 15 d9 47 00 00    	mov    edx,DWORD PTR [rip+0x47d9]        # 80c56c <key_bufq+0xc>
  807d93:	8b 05 cf 47 00 00    	mov    eax,DWORD PTR [rip+0x47cf]        # 80c568 <key_bufq+0x8>
  807d99:	39 c2                	cmp    edx,eax
  807d9b:	75 0a                	jne    807da7 <sys_analyse_key+0x26>
  807d9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807da2:	e9 d0 00 00 00       	jmp    807e77 <sys_analyse_key+0xf6>
    char c=key_buf[key_bufq.head];
  807da7:	8b 05 bb 47 00 00    	mov    eax,DWORD PTR [rip+0x47bb]        # 80c568 <key_bufq+0x8>
  807dad:	48 98                	cdqe   
  807daf:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  807db6:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  807db9:	8b 05 a9 47 00 00    	mov    eax,DWORD PTR [rip+0x47a9]        # 80c568 <key_bufq+0x8>
  807dbf:	83 c0 01             	add    eax,0x1
  807dc2:	8b 0d a8 47 00 00    	mov    ecx,DWORD PTR [rip+0x47a8]        # 80c570 <key_bufq+0x10>
  807dc8:	99                   	cdq    
  807dc9:	f7 f9                	idiv   ecx
  807dcb:	89 d0                	mov    eax,edx
  807dcd:	89 05 95 47 00 00    	mov    DWORD PTR [rip+0x4795],eax        # 80c568 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  807dd3:	bf d6 44 81 00       	mov    edi,0x8144d6
  807dd8:	b8 00 00 00 00       	mov    eax,0x0
  807ddd:	e8 45 8f ff ff       	call   800d27 <printf>
    char res[33]={0};
  807de2:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  807de9:	00 
  807dea:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807df1:	00 
  807df2:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807df9:	00 
  807dfa:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807e01:	00 
  807e02:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  807e06:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  807e0a:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  807e0e:	be 10 00 00 00       	mov    esi,0x10
  807e13:	48 89 c7             	mov    rdi,rax
  807e16:	e8 cd 8d ff ff       	call   800be8 <itoa>
    printf(res);
  807e1b:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  807e1f:	48 89 c7             	mov    rdi,rax
  807e22:	b8 00 00 00 00       	mov    eax,0x0
  807e27:	e8 fb 8e ff ff       	call   800d27 <printf>
    if(c&FLAG_BREAK)return -1;
  807e2c:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  807e30:	79 07                	jns    807e39 <sys_analyse_key+0xb8>
  807e32:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e37:	eb 3e                	jmp    807e77 <sys_analyse_key+0xf6>
    c= to_ascii(c&0x7f);
  807e39:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  807e3d:	83 e0 7f             	and    eax,0x7f
  807e40:	89 c7                	mov    edi,eax
  807e42:	e8 15 fd ff ff       	call   807b5c <to_ascii>
  807e47:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  807e4a:	bf e1 44 81 00       	mov    edi,0x8144e1
  807e4f:	b8 00 00 00 00       	mov    eax,0x0
  807e54:	e8 ce 8e ff ff       	call   800d27 <printf>
    putchar(c);
  807e59:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  807e5d:	89 c7                	mov    edi,eax
  807e5f:	e8 99 8e ff ff       	call   800cfd <putchar>
    printf("\n");
  807e64:	bf e8 44 81 00       	mov    edi,0x8144e8
  807e69:	b8 00 00 00 00       	mov    eax,0x0
  807e6e:	e8 b4 8e ff ff       	call   800d27 <printf>
    return c;
  807e73:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807e77:	c9                   	leave  
  807e78:	c3                   	ret    

0000000000807e79 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  807e79:	f3 0f 1e fa          	endbr64 
  807e7d:	55                   	push   rbp
  807e7e:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  807e81:	b8 00 00 00 00       	mov    eax,0x0
  807e86:	e8 8d 09 00 00       	call   808818 <hd_iterate>
    return 0;
  807e8b:	b8 00 00 00 00       	mov    eax,0x0
}
  807e90:	5d                   	pop    rbp
  807e91:	c3                   	ret    

0000000000807e92 <disk_int_handler_c>:

int disk_int_handler_c()
{
  807e92:	f3 0f 1e fa          	endbr64 
  807e96:	55                   	push   rbp
  807e97:	48 89 e5             	mov    rbp,rsp
  807e9a:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  807e9e:	48 8b 05 3b 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2263b]        # 42a4e0 <running_req>
  807ea5:	48 85 c0             	test   rax,rax
  807ea8:	75 0a                	jne    807eb4 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  807eaa:	b8 01 00 00 00       	mov    eax,0x1
  807eaf:	e9 a3 01 00 00       	jmp    808057 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  807eb4:	48 8b 05 25 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22625]        # 42a4e0 <running_req>
  807ebb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ebf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  807ec3:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807eca:	48 8b 05 0f 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2260f]        # 42a4e0 <running_req>
  807ed1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807ed4:	83 f8 02             	cmp    eax,0x2
  807ed7:	74 0f                	je     807ee8 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  807ed9:	48 8b 05 00 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22600]        # 42a4e0 <running_req>
  807ee0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807ee3:	83 f8 03             	cmp    eax,0x3
  807ee6:	75 07                	jne    807eef <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  807ee8:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  807eef:	48 8b 05 ea 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225ea]        # 42a4e0 <running_req>
  807ef6:	8b 00                	mov    eax,DWORD PTR [rax]
  807ef8:	85 c0                	test   eax,eax
  807efa:	75 42                	jne    807f3e <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  807efc:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807f03:	eb 22                	jmp    807f27 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  807f05:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f08:	0f b7 c0             	movzx  eax,ax
  807f0b:	89 c7                	mov    edi,eax
  807f0d:	e8 21 db ff ff       	call   805a33 <inw>
  807f12:	89 c2                	mov    edx,eax
  807f14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f18:	48 8d 48 02          	lea    rcx,[rax+0x2]
  807f1c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  807f20:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  807f23:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807f27:	48 8b 05 b2 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225b2]        # 42a4e0 <running_req>
  807f2e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807f31:	c1 e0 08             	shl    eax,0x8
  807f34:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  807f37:	7c cc                	jl     807f05 <disk_int_handler_c+0x73>
  807f39:	e9 ca 00 00 00       	jmp    808008 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  807f3e:	48 8b 05 9b 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2259b]        # 42a4e0 <running_req>
  807f45:	8b 00                	mov    eax,DWORD PTR [rax]
  807f47:	83 f8 01             	cmp    eax,0x1
  807f4a:	75 42                	jne    807f8e <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  807f4c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807f53:	eb 25                	jmp    807f7a <disk_int_handler_c+0xe8>
            outw(port,*p++);
  807f55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f59:	48 8d 50 02          	lea    rdx,[rax+0x2]
  807f5d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  807f61:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807f64:	0f b7 d0             	movzx  edx,ax
  807f67:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f6a:	0f b7 c0             	movzx  eax,ax
  807f6d:	89 d6                	mov    esi,edx
  807f6f:	89 c7                	mov    edi,eax
  807f71:	e8 a7 da ff ff       	call   805a1d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  807f76:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807f7a:	48 8b 05 5f 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2255f]        # 42a4e0 <running_req>
  807f81:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807f84:	c1 e0 08             	shl    eax,0x8
  807f87:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807f8a:	7c c9                	jl     807f55 <disk_int_handler_c+0xc3>
  807f8c:	eb 7a                	jmp    808008 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  807f8e:	48 8b 05 4b 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2254b]        # 42a4e0 <running_req>
  807f95:	8b 00                	mov    eax,DWORD PTR [rax]
  807f97:	83 f8 02             	cmp    eax,0x2
  807f9a:	75 34                	jne    807fd0 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  807f9c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f9f:	83 c0 07             	add    eax,0x7
  807fa2:	0f b6 c0             	movzx  eax,al
  807fa5:	89 c7                	mov    edi,eax
  807fa7:	e8 7d da ff ff       	call   805a29 <inb>
  807fac:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  807faf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807fb2:	0f b7 c0             	movzx  eax,ax
  807fb5:	89 c7                	mov    edi,eax
  807fb7:	e8 77 da ff ff       	call   805a33 <inw>
  807fbc:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  807fc0:	48 8b 05 19 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22519]        # 42a4e0 <running_req>
  807fc7:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  807fce:	eb 38                	jmp    808008 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  807fd0:	48 8b 05 09 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22509]        # 42a4e0 <running_req>
  807fd7:	8b 00                	mov    eax,DWORD PTR [rax]
  807fd9:	83 f8 03             	cmp    eax,0x3
  807fdc:	75 2a                	jne    808008 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  807fde:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807fe1:	83 c0 07             	add    eax,0x7
  807fe4:	0f b6 c0             	movzx  eax,al
  807fe7:	89 c7                	mov    edi,eax
  807fe9:	e8 3b da ff ff       	call   805a29 <inb>
  807fee:	0f b6 c0             	movzx  eax,al
  807ff1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  807ff4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807ff7:	89 c6                	mov    esi,eax
  807ff9:	bf ea 44 81 00       	mov    edi,0x8144ea
  807ffe:	b8 00 00 00 00       	mov    eax,0x0
  808003:	e8 1f 8d ff ff       	call   800d27 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  808008:	48 8b 05 d1 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224d1]        # 42a4e0 <running_req>
  80800f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808016:	48 8b 05 c3 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c3]        # 42a4e0 <running_req>
  80801d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808021:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808028:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  80802b:	48 8b 05 b6 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224b6]        # 42a4e8 <running_devman_req>
  808032:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  808039:	00 00 00 
    running_devman_req=NULL;
  80803c:	48 c7 05 a1 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc224a1],0x0        # 42a4e8 <running_devman_req>
  808043:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808047:	48 c7 05 8e 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2248e],0x0        # 42a4e0 <running_req>
  80804e:	00 00 00 00 
    return 0;
  808052:	b8 00 00 00 00       	mov    eax,0x0
}
  808057:	c9                   	leave  
  808058:	c3                   	ret    

0000000000808059 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  808059:	f3 0f 1e fa          	endbr64 
  80805d:	55                   	push   rbp
  80805e:	48 89 e5             	mov    rbp,rsp
  808061:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  808064:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808067:	48 63 d0             	movsxd rdx,eax
  80806a:	48 89 d0             	mov    rax,rdx
  80806d:	48 01 c0             	add    rax,rax
  808070:	48 01 d0             	add    rax,rdx
  808073:	48 c1 e0 04          	shl    rax,0x4
  808077:	48 05 fc 77 42 00    	add    rax,0x4277fc
  80807d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80807f:	5d                   	pop    rbp
  808080:	c3                   	ret    

0000000000808081 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  808081:	f3 0f 1e fa          	endbr64 
  808085:	55                   	push   rbp
  808086:	48 89 e5             	mov    rbp,rsp
  808089:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80808c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80808f:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808092:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  808095:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  808099:	8b 05 75 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22475]        # 42a514 <tail>
  80809f:	83 c0 01             	add    eax,0x1
  8080a2:	48 63 d0             	movsxd rdx,eax
  8080a5:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8080ac:	48 c1 ea 20          	shr    rdx,0x20
  8080b0:	01 c2                	add    edx,eax
  8080b2:	c1 fa 07             	sar    edx,0x7
  8080b5:	89 c1                	mov    ecx,eax
  8080b7:	c1 f9 1f             	sar    ecx,0x1f
  8080ba:	29 ca                	sub    edx,ecx
  8080bc:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8080c2:	29 c8                	sub    eax,ecx
  8080c4:	89 c2                	mov    edx,eax
  8080c6:	8b 05 44 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22444]        # 42a510 <head>
  8080cc:	39 c2                	cmp    edx,eax
  8080ce:	75 0a                	jne    8080da <request+0x59>
    {
        return -1;
  8080d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8080d5:	e9 0d 01 00 00       	jmp    8081e7 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8080da:	8b 05 34 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22434]        # 42a514 <tail>
  8080e0:	48 63 d0             	movsxd rdx,eax
  8080e3:	48 89 d0             	mov    rax,rdx
  8080e6:	48 01 c0             	add    rax,rax
  8080e9:	48 01 d0             	add    rax,rdx
  8080ec:	48 c1 e0 04          	shl    rax,0x4
  8080f0:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  8080f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8080fa:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8080fc:	8b 05 12 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22412]        # 42a514 <tail>
  808102:	48 63 d0             	movsxd rdx,eax
  808105:	48 89 d0             	mov    rax,rdx
  808108:	48 01 c0             	add    rax,rax
  80810b:	48 01 d0             	add    rax,rdx
  80810e:	48 c1 e0 04          	shl    rax,0x4
  808112:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  808119:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80811c:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  80811e:	8b 05 f0 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223f0]        # 42a514 <tail>
  808124:	48 63 d0             	movsxd rdx,eax
  808127:	48 89 d0             	mov    rax,rdx
  80812a:	48 01 c0             	add    rax,rax
  80812d:	48 01 d0             	add    rax,rdx
  808130:	48 c1 e0 04          	shl    rax,0x4
  808134:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  80813b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80813e:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  808140:	8b 05 ce 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223ce]        # 42a514 <tail>
  808146:	48 63 d0             	movsxd rdx,eax
  808149:	48 89 d0             	mov    rax,rdx
  80814c:	48 01 c0             	add    rax,rax
  80814f:	48 01 d0             	add    rax,rdx
  808152:	48 c1 e0 04          	shl    rax,0x4
  808156:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  80815d:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808160:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  808162:	8b 05 ac 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223ac]        # 42a514 <tail>
  808168:	48 63 d0             	movsxd rdx,eax
  80816b:	48 89 d0             	mov    rax,rdx
  80816e:	48 01 c0             	add    rax,rax
  808171:	48 01 d0             	add    rax,rdx
  808174:	48 c1 e0 04          	shl    rax,0x4
  808178:	48 05 fc 77 42 00    	add    rax,0x4277fc
  80817e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  808184:	8b 05 8a 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2238a]        # 42a514 <tail>
  80818a:	48 63 d0             	movsxd rdx,eax
  80818d:	48 89 d0             	mov    rax,rdx
  808190:	48 01 c0             	add    rax,rax
  808193:	48 01 d0             	add    rax,rdx
  808196:	48 c1 e0 04          	shl    rax,0x4
  80819a:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  8081a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8081a5:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8081a8:	8b 05 66 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22366]        # 42a514 <tail>
  8081ae:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8081b1:	8b 05 5d 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2235d]        # 42a514 <tail>
  8081b7:	8d 50 01             	lea    edx,[rax+0x1]
  8081ba:	48 63 c2             	movsxd rax,edx
  8081bd:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8081c4:	48 c1 e8 20          	shr    rax,0x20
  8081c8:	01 d0                	add    eax,edx
  8081ca:	c1 f8 07             	sar    eax,0x7
  8081cd:	89 d1                	mov    ecx,edx
  8081cf:	c1 f9 1f             	sar    ecx,0x1f
  8081d2:	29 c8                	sub    eax,ecx
  8081d4:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8081da:	89 d0                	mov    eax,edx
  8081dc:	29 c8                	sub    eax,ecx
  8081de:	89 05 30 23 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22330],eax        # 42a514 <tail>
    return r;
  8081e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8081e7:	5d                   	pop    rbp
  8081e8:	c3                   	ret    

00000000008081e9 <execute_request>:
int execute_request(){
  8081e9:	f3 0f 1e fa          	endbr64 
  8081ed:	55                   	push   rbp
  8081ee:	48 89 e5             	mov    rbp,rsp
  8081f1:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8081f5:	48 8b 05 e4 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e4]        # 42a4e0 <running_req>
  8081fc:	48 85 c0             	test   rax,rax
  8081ff:	74 6a                	je     80826b <execute_request+0x82>
    {
        running_req->time++;
  808201:	48 8b 05 d8 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222d8]        # 42a4e0 <running_req>
  808208:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80820b:	83 c2 01             	add    edx,0x1
  80820e:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  808211:	48 8b 05 c8 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222c8]        # 42a4e0 <running_req>
  808218:	8b 00                	mov    eax,DWORD PTR [rax]
  80821a:	83 f8 02             	cmp    eax,0x2
  80821d:	74 0a                	je     808229 <execute_request+0x40>
            return 2;
  80821f:	b8 02 00 00 00       	mov    eax,0x2
  808224:	e9 b4 01 00 00       	jmp    8083dd <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  808229:	48 8b 05 b0 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222b0]        # 42a4e0 <running_req>
  808230:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808233:	83 f8 0a             	cmp    eax,0xa
  808236:	7e 29                	jle    808261 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  808238:	48 8b 05 a1 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222a1]        # 42a4e0 <running_req>
  80823f:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  808246:	48 8b 05 93 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22293]        # 42a4e0 <running_req>
  80824d:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  808254:	48 c7 05 81 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22281],0x0        # 42a4e0 <running_req>
  80825b:	00 00 00 00 
  80825f:	eb 0a                	jmp    80826b <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  808261:	b8 02 00 00 00       	mov    eax,0x2
  808266:	e9 72 01 00 00       	jmp    8083dd <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  80826b:	8b 15 9f 22 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2229f]        # 42a510 <head>
  808271:	8b 05 9d 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2229d]        # 42a514 <tail>
  808277:	39 c2                	cmp    edx,eax
  808279:	75 0a                	jne    808285 <execute_request+0x9c>
  80827b:	b8 01 00 00 00       	mov    eax,0x1
  808280:	e9 58 01 00 00       	jmp    8083dd <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  808285:	8b 05 85 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22285]        # 42a510 <head>
  80828b:	48 63 d0             	movsxd rdx,eax
  80828e:	48 89 d0             	mov    rax,rdx
  808291:	48 01 c0             	add    rax,rax
  808294:	48 01 d0             	add    rax,rdx
  808297:	48 c1 e0 04          	shl    rax,0x4
  80829b:	48 05 e0 77 42 00    	add    rax,0x4277e0
  8082a1:	48 89 05 38 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22238],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8082a8:	8b 05 62 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22262]        # 42a510 <head>
  8082ae:	8d 50 01             	lea    edx,[rax+0x1]
  8082b1:	48 63 c2             	movsxd rax,edx
  8082b4:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8082bb:	48 c1 e8 20          	shr    rax,0x20
  8082bf:	01 d0                	add    eax,edx
  8082c1:	c1 f8 07             	sar    eax,0x7
  8082c4:	89 d1                	mov    ecx,edx
  8082c6:	c1 f9 1f             	sar    ecx,0x1f
  8082c9:	29 c8                	sub    eax,ecx
  8082cb:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8082d1:	89 d0                	mov    eax,edx
  8082d3:	29 c8                	sub    eax,ecx
  8082d5:	89 05 35 22 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22235],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  8082db:	48 8b 05 fe 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221fe]        # 42a4e0 <running_req>
  8082e2:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8082e9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8082f0:	48 8b 05 e9 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221e9]        # 42a4e0 <running_req>
  8082f7:	8b 00                	mov    eax,DWORD PTR [rax]
  8082f9:	83 f8 03             	cmp    eax,0x3
  8082fc:	0f 84 ad 00 00 00    	je     8083af <execute_request+0x1c6>
  808302:	83 f8 03             	cmp    eax,0x3
  808305:	0f 8f bf 00 00 00    	jg     8083ca <execute_request+0x1e1>
  80830b:	83 f8 02             	cmp    eax,0x2
  80830e:	0f 84 85 00 00 00    	je     808399 <execute_request+0x1b0>
  808314:	83 f8 02             	cmp    eax,0x2
  808317:	0f 8f ad 00 00 00    	jg     8083ca <execute_request+0x1e1>
  80831d:	85 c0                	test   eax,eax
  80831f:	74 0a                	je     80832b <execute_request+0x142>
  808321:	83 f8 01             	cmp    eax,0x1
  808324:	74 3c                	je     808362 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  808326:	e9 9f 00 00 00       	jmp    8083ca <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  80832b:	48 8b 05 ae 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221ae]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  808332:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  808336:	48 8b 05 a3 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221a3]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80833d:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  808340:	48 8b 05 99 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22199]        # 42a4e0 <running_req>
  808347:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80834a:	89 c6                	mov    esi,eax
  80834c:	48 8b 05 8d 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2218d]        # 42a4e0 <running_req>
  808353:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808356:	89 c7                	mov    edi,eax
  808358:	e8 a7 00 00 00       	call   808404 <async_read_disk>
  80835d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808360:	eb 69                	jmp    8083cb <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  808362:	48 8b 05 77 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22177]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808369:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  80836d:	48 8b 05 6c 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2216c]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808374:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  808377:	48 8b 05 62 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22162]        # 42a4e0 <running_req>
  80837e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  808381:	89 c6                	mov    esi,eax
  808383:	48 8b 05 56 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22156]        # 42a4e0 <running_req>
  80838a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80838d:	89 c7                	mov    edi,eax
  80838f:	e8 88 01 00 00       	call   80851c <async_write_disk>
  808394:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808397:	eb 32                	jmp    8083cb <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  808399:	48 8b 05 40 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22140]        # 42a4e0 <running_req>
  8083a0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8083a3:	89 c7                	mov    edi,eax
  8083a5:	e8 8f 06 00 00       	call   808a39 <async_check_disk>
  8083aa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8083ad:	eb 1c                	jmp    8083cb <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8083af:	48 8b 05 2a 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2212a]        # 42a4e0 <running_req>
  8083b6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8083b9:	89 c7                	mov    edi,eax
  8083bb:	b8 00 00 00 00       	mov    eax,0x0
  8083c0:	e8 1a 00 00 00       	call   8083df <async_reset_disk>
  8083c5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8083c8:	eb 01                	jmp    8083cb <execute_request+0x1e2>
        break;
  8083ca:	90                   	nop
    }
    if(r==-1)return -1;
  8083cb:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8083cf:	75 07                	jne    8083d8 <execute_request+0x1ef>
  8083d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083d6:	eb 05                	jmp    8083dd <execute_request+0x1f4>
    return 0;
  8083d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8083dd:	c9                   	leave  
  8083de:	c3                   	ret    

00000000008083df <async_reset_disk>:
int async_reset_disk(int disk)
{
  8083df:	f3 0f 1e fa          	endbr64 
  8083e3:	55                   	push   rbp
  8083e4:	48 89 e5             	mov    rbp,rsp
  8083e7:	48 83 ec 10          	sub    rsp,0x10
  8083eb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8083ee:	be 0c 00 00 00       	mov    esi,0xc
  8083f3:	bf f6 03 00 00       	mov    edi,0x3f6
  8083f8:	e8 13 d6 ff ff       	call   805a10 <outb>
    return 0;
  8083fd:	b8 00 00 00 00       	mov    eax,0x0
}
  808402:	c9                   	leave  
  808403:	c3                   	ret    

0000000000808404 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  808404:	f3 0f 1e fa          	endbr64 
  808408:	55                   	push   rbp
  808409:	48 89 e5             	mov    rbp,rsp
  80840c:	48 83 ec 30          	sub    rsp,0x30
  808410:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808413:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808416:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808419:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80841d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808423:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80842a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80842e:	74 06                	je     808436 <async_read_disk+0x32>
  808430:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808434:	75 06                	jne    80843c <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  808436:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80843c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808440:	74 06                	je     808448 <async_read_disk+0x44>
  808442:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808446:	75 07                	jne    80844f <async_read_disk+0x4b>
        slave_disk=1;
  808448:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  80844f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808452:	0f b6 d0             	movzx  edx,al
  808455:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808459:	83 c0 02             	add    eax,0x2
  80845c:	0f b7 c0             	movzx  eax,ax
  80845f:	89 d6                	mov    esi,edx
  808461:	89 c7                	mov    edi,eax
  808463:	e8 a8 d5 ff ff       	call   805a10 <outb>
    outb(port+3,lba&0xff);
  808468:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80846b:	0f b6 d0             	movzx  edx,al
  80846e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808472:	83 c0 03             	add    eax,0x3
  808475:	0f b7 c0             	movzx  eax,ax
  808478:	89 d6                	mov    esi,edx
  80847a:	89 c7                	mov    edi,eax
  80847c:	e8 8f d5 ff ff       	call   805a10 <outb>
    outb(port+4,(lba>>8)&0xff);
  808481:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808484:	c1 e8 08             	shr    eax,0x8
  808487:	0f b6 d0             	movzx  edx,al
  80848a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80848e:	83 c0 04             	add    eax,0x4
  808491:	0f b7 c0             	movzx  eax,ax
  808494:	89 d6                	mov    esi,edx
  808496:	89 c7                	mov    edi,eax
  808498:	e8 73 d5 ff ff       	call   805a10 <outb>
    outb(port+5,(lba>>16)&0xff);
  80849d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8084a0:	c1 e8 10             	shr    eax,0x10
  8084a3:	0f b6 d0             	movzx  edx,al
  8084a6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8084aa:	83 c0 05             	add    eax,0x5
  8084ad:	0f b7 c0             	movzx  eax,ax
  8084b0:	89 d6                	mov    esi,edx
  8084b2:	89 c7                	mov    edi,eax
  8084b4:	e8 57 d5 ff ff       	call   805a10 <outb>
    char drv=slave_disk?0x10:0;
  8084b9:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8084bd:	74 07                	je     8084c6 <async_read_disk+0xc2>
  8084bf:	b8 10 00 00 00       	mov    eax,0x10
  8084c4:	eb 05                	jmp    8084cb <async_read_disk+0xc7>
  8084c6:	b8 00 00 00 00       	mov    eax,0x0
  8084cb:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8084ce:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8084d1:	c1 e8 18             	shr    eax,0x18
  8084d4:	83 e0 0f             	and    eax,0xf
  8084d7:	89 c2                	mov    edx,eax
  8084d9:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8084dd:	09 d0                	or     eax,edx
  8084df:	83 c8 e0             	or     eax,0xffffffe0
  8084e2:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8084e5:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8084e9:	0f b6 d0             	movzx  edx,al
  8084ec:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8084f0:	83 c0 06             	add    eax,0x6
  8084f3:	0f b7 c0             	movzx  eax,ax
  8084f6:	89 d6                	mov    esi,edx
  8084f8:	89 c7                	mov    edi,eax
  8084fa:	e8 11 d5 ff ff       	call   805a10 <outb>
    outb(port+7,DISK_CMD_READ);
  8084ff:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808503:	83 c0 07             	add    eax,0x7
  808506:	0f b7 c0             	movzx  eax,ax
  808509:	be 20 00 00 00       	mov    esi,0x20
  80850e:	89 c7                	mov    edi,eax
  808510:	e8 fb d4 ff ff       	call   805a10 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  808515:	b8 00 00 00 00       	mov    eax,0x0
}
  80851a:	c9                   	leave  
  80851b:	c3                   	ret    

000000000080851c <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  80851c:	f3 0f 1e fa          	endbr64 
  808520:	55                   	push   rbp
  808521:	48 89 e5             	mov    rbp,rsp
  808524:	48 83 ec 30          	sub    rsp,0x30
  808528:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80852b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80852e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808531:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  808535:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80853b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808542:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808546:	74 06                	je     80854e <async_write_disk+0x32>
  808548:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80854c:	75 06                	jne    808554 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  80854e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808554:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808558:	74 06                	je     808560 <async_write_disk+0x44>
  80855a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80855e:	75 07                	jne    808567 <async_write_disk+0x4b>
        slave_disk=1;
  808560:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  808567:	bf f7 00 00 00       	mov    edi,0xf7
  80856c:	e8 b8 d4 ff ff       	call   805a29 <inb>
  808571:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  808574:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808578:	83 e0 01             	and    eax,0x1
  80857b:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  80857e:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  808582:	74 0a                	je     80858e <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  808584:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808589:	e9 d5 00 00 00       	jmp    808663 <async_write_disk+0x147>
        }
        t&=0x88;
  80858e:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  808592:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  808596:	74 02                	je     80859a <async_write_disk+0x7e>
    {
  808598:	eb cd                	jmp    808567 <async_write_disk+0x4b>
        if(t==0x8)break;
  80859a:	90                   	nop
    }
    outb(port+2,sec_n);
  80859b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80859e:	0f b6 d0             	movzx  edx,al
  8085a1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085a5:	83 c0 02             	add    eax,0x2
  8085a8:	0f b7 c0             	movzx  eax,ax
  8085ab:	89 d6                	mov    esi,edx
  8085ad:	89 c7                	mov    edi,eax
  8085af:	e8 5c d4 ff ff       	call   805a10 <outb>
    outb(port+3,lba&0xff);
  8085b4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8085b7:	0f b6 d0             	movzx  edx,al
  8085ba:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085be:	83 c0 03             	add    eax,0x3
  8085c1:	0f b7 c0             	movzx  eax,ax
  8085c4:	89 d6                	mov    esi,edx
  8085c6:	89 c7                	mov    edi,eax
  8085c8:	e8 43 d4 ff ff       	call   805a10 <outb>
    outb(port+4,(lba>>8)&0xff);
  8085cd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8085d0:	c1 e8 08             	shr    eax,0x8
  8085d3:	0f b6 d0             	movzx  edx,al
  8085d6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085da:	83 c0 04             	add    eax,0x4
  8085dd:	0f b7 c0             	movzx  eax,ax
  8085e0:	89 d6                	mov    esi,edx
  8085e2:	89 c7                	mov    edi,eax
  8085e4:	e8 27 d4 ff ff       	call   805a10 <outb>
    outb(port+5,(lba>>16)&0xff);
  8085e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8085ec:	c1 e8 10             	shr    eax,0x10
  8085ef:	0f b6 d0             	movzx  edx,al
  8085f2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085f6:	83 c0 05             	add    eax,0x5
  8085f9:	0f b7 c0             	movzx  eax,ax
  8085fc:	89 d6                	mov    esi,edx
  8085fe:	89 c7                	mov    edi,eax
  808600:	e8 0b d4 ff ff       	call   805a10 <outb>
    char drv=slave_disk?0x10:0;
  808605:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808609:	74 07                	je     808612 <async_write_disk+0xf6>
  80860b:	b8 10 00 00 00       	mov    eax,0x10
  808610:	eb 05                	jmp    808617 <async_write_disk+0xfb>
  808612:	b8 00 00 00 00       	mov    eax,0x0
  808617:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80861a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80861d:	c1 e8 18             	shr    eax,0x18
  808620:	83 e0 0f             	and    eax,0xf
  808623:	89 c2                	mov    edx,eax
  808625:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808629:	09 d0                	or     eax,edx
  80862b:	83 c8 e0             	or     eax,0xffffffe0
  80862e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  808631:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  808635:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808639:	83 c0 06             	add    eax,0x6
  80863c:	0f b7 c0             	movzx  eax,ax
  80863f:	89 d6                	mov    esi,edx
  808641:	89 c7                	mov    edi,eax
  808643:	e8 c8 d3 ff ff       	call   805a10 <outb>
    outb(port+7,DISK_CMD_WRITE);
  808648:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80864c:	83 c0 07             	add    eax,0x7
  80864f:	0f b7 c0             	movzx  eax,ax
  808652:	be 30 00 00 00       	mov    esi,0x30
  808657:	89 c7                	mov    edi,eax
  808659:	e8 b2 d3 ff ff       	call   805a10 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80865e:	b8 00 00 00 00       	mov    eax,0x0
}
  808663:	c9                   	leave  
  808664:	c3                   	ret    

0000000000808665 <read_disk>:
int read_disk(driver_args* args)
{
  808665:	f3 0f 1e fa          	endbr64 
  808669:	55                   	push   rbp
  80866a:	48 89 e5             	mov    rbp,rsp
  80866d:	48 83 ec 20          	sub    rsp,0x20
  808671:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  808675:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808679:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80867c:	48 98                	cdqe   
  80867e:	48 89 c2             	mov    rdx,rax
  808681:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808685:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80868c:	8b 00                	mov    eax,DWORD PTR [rax]
  80868e:	89 ce                	mov    esi,ecx
  808690:	89 c7                	mov    edi,eax
  808692:	e8 95 05 00 00       	call   808c2c <read_disk_asm>
  808697:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80869a:	48 8b 05 3f 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e3f]        # 42a4e0 <running_req>
  8086a1:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8086a8:	48 8b 05 31 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e31]        # 42a4e0 <running_req>
  8086af:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8086b3:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8086ba:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8086bd:	48 c7 05 18 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e18],0x0        # 42a4e0 <running_req>
  8086c4:	00 00 00 00 
    return ret;
  8086c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8086cb:	c9                   	leave  
  8086cc:	c3                   	ret    

00000000008086cd <write_disk>:
int write_disk(driver_args* args)
{
  8086cd:	f3 0f 1e fa          	endbr64 
  8086d1:	55                   	push   rbp
  8086d2:	48 89 e5             	mov    rbp,rsp
  8086d5:	48 83 ec 20          	sub    rsp,0x20
  8086d9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8086dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086e1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8086e4:	48 98                	cdqe   
  8086e6:	48 89 c2             	mov    rdx,rax
  8086e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086ed:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8086f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086f4:	8b 00                	mov    eax,DWORD PTR [rax]
  8086f6:	89 ce                	mov    esi,ecx
  8086f8:	89 c7                	mov    edi,eax
  8086fa:	e8 ad 05 00 00       	call   808cac <write_disk_asm>
  8086ff:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  808702:	48 8b 05 d7 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21dd7]        # 42a4e0 <running_req>
  808709:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808710:	48 8b 05 c9 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21dc9]        # 42a4e0 <running_req>
  808717:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80871b:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808722:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808725:	48 c7 05 b0 1d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21db0],0x0        # 42a4e0 <running_req>
  80872c:	00 00 00 00 
    return ret;
  808730:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808733:	c9                   	leave  
  808734:	c3                   	ret    

0000000000808735 <chk_result>:
int chk_result(int r)
{
  808735:	f3 0f 1e fa          	endbr64 
  808739:	55                   	push   rbp
  80873a:	48 89 e5             	mov    rbp,rsp
  80873d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  808740:	90                   	nop
  808741:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808744:	48 63 d0             	movsxd rdx,eax
  808747:	48 89 d0             	mov    rax,rdx
  80874a:	48 01 c0             	add    rax,rax
  80874d:	48 01 d0             	add    rax,rdx
  808750:	48 c1 e0 04          	shl    rax,0x4
  808754:	48 05 fc 77 42 00    	add    rax,0x4277fc
  80875a:	8b 00                	mov    eax,DWORD PTR [rax]
  80875c:	83 f8 03             	cmp    eax,0x3
  80875f:	75 e0                	jne    808741 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  808761:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808764:	48 63 d0             	movsxd rdx,eax
  808767:	48 89 d0             	mov    rax,rdx
  80876a:	48 01 c0             	add    rax,rax
  80876d:	48 01 d0             	add    rax,rdx
  808770:	48 c1 e0 04          	shl    rax,0x4
  808774:	48 05 00 78 42 00    	add    rax,0x427800
  80877a:	8b 00                	mov    eax,DWORD PTR [rax]
  80877c:	83 f8 01             	cmp    eax,0x1
  80877f:	0f 94 c0             	sete   al
  808782:	0f b6 c0             	movzx  eax,al
}
  808785:	5d                   	pop    rbp
  808786:	c3                   	ret    

0000000000808787 <disk_existent>:
int disk_existent(int disk)
{
  808787:	f3 0f 1e fa          	endbr64 
  80878b:	55                   	push   rbp
  80878c:	48 89 e5             	mov    rbp,rsp
  80878f:	48 83 ec 10          	sub    rsp,0x10
  808793:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  808796:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80879a:	74 5f                	je     8087fb <disk_existent+0x74>
  80879c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8087a0:	7f 6e                	jg     808810 <disk_existent+0x89>
  8087a2:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8087a6:	74 3e                	je     8087e6 <disk_existent+0x5f>
  8087a8:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8087ac:	7f 62                	jg     808810 <disk_existent+0x89>
  8087ae:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8087b2:	74 08                	je     8087bc <disk_existent+0x35>
  8087b4:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8087b8:	74 17                	je     8087d1 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8087ba:	eb 54                	jmp    808810 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8087bc:	bf 08 45 81 00       	mov    edi,0x814508
  8087c1:	e8 3e a2 ff ff       	call   802a04 <sys_find_dev>
  8087c6:	83 f8 ff             	cmp    eax,0xffffffff
  8087c9:	0f 95 c0             	setne  al
  8087cc:	0f b6 c0             	movzx  eax,al
  8087cf:	eb 45                	jmp    808816 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8087d1:	bf 0c 45 81 00       	mov    edi,0x81450c
  8087d6:	e8 29 a2 ff ff       	call   802a04 <sys_find_dev>
  8087db:	83 f8 ff             	cmp    eax,0xffffffff
  8087de:	0f 95 c0             	setne  al
  8087e1:	0f b6 c0             	movzx  eax,al
  8087e4:	eb 30                	jmp    808816 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8087e6:	bf 10 45 81 00       	mov    edi,0x814510
  8087eb:	e8 14 a2 ff ff       	call   802a04 <sys_find_dev>
  8087f0:	83 f8 ff             	cmp    eax,0xffffffff
  8087f3:	0f 95 c0             	setne  al
  8087f6:	0f b6 c0             	movzx  eax,al
  8087f9:	eb 1b                	jmp    808816 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8087fb:	bf 14 45 81 00       	mov    edi,0x814514
  808800:	e8 ff a1 ff ff       	call   802a04 <sys_find_dev>
  808805:	83 f8 ff             	cmp    eax,0xffffffff
  808808:	0f 95 c0             	setne  al
  80880b:	0f b6 c0             	movzx  eax,al
  80880e:	eb 06                	jmp    808816 <disk_existent+0x8f>
        break;
  808810:	90                   	nop
    }
    return 0;
  808811:	b8 00 00 00 00       	mov    eax,0x0
}
  808816:	c9                   	leave  
  808817:	c3                   	ret    

0000000000808818 <hd_iterate>:
int hd_iterate()
{
  808818:	f3 0f 1e fa          	endbr64 
  80881c:	55                   	push   rbp
  80881d:	48 89 e5             	mov    rbp,rsp
  808820:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  808827:	41 b8 00 00 00 00    	mov    r8d,0x0
  80882d:	b9 01 00 00 00       	mov    ecx,0x1
  808832:	ba 00 00 00 00       	mov    edx,0x0
  808837:	be 02 00 00 00       	mov    esi,0x2
  80883c:	bf 00 00 00 00       	mov    edi,0x0
  808841:	e8 3b f8 ff ff       	call   808081 <request>
  808846:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  808849:	41 b8 00 00 00 00    	mov    r8d,0x0
  80884f:	b9 01 00 00 00       	mov    ecx,0x1
  808854:	ba 00 00 00 00       	mov    edx,0x0
  808859:	be 02 00 00 00       	mov    esi,0x2
  80885e:	bf 01 00 00 00       	mov    edi,0x1
  808863:	e8 19 f8 ff ff       	call   808081 <request>
  808868:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80886b:	41 b8 00 00 00 00    	mov    r8d,0x0
  808871:	b9 01 00 00 00       	mov    ecx,0x1
  808876:	ba 00 00 00 00       	mov    edx,0x0
  80887b:	be 02 00 00 00       	mov    esi,0x2
  808880:	bf 02 00 00 00       	mov    edi,0x2
  808885:	e8 f7 f7 ff ff       	call   808081 <request>
  80888a:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80888d:	41 b8 00 00 00 00    	mov    r8d,0x0
  808893:	b9 01 00 00 00       	mov    ecx,0x1
  808898:	ba 00 00 00 00       	mov    edx,0x0
  80889d:	be 02 00 00 00       	mov    esi,0x2
  8088a2:	bf 03 00 00 00       	mov    edi,0x3
  8088a7:	e8 d5 f7 ff ff       	call   808081 <request>
  8088ac:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  8088af:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8088b6:	e9 72 01 00 00       	jmp    808a2d <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  8088bb:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8088bf:	74 3b                	je     8088fc <hd_iterate+0xe4>
  8088c1:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8088c5:	7f 3e                	jg     808905 <hd_iterate+0xed>
  8088c7:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8088cb:	74 26                	je     8088f3 <hd_iterate+0xdb>
  8088cd:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8088d1:	7f 32                	jg     808905 <hd_iterate+0xed>
  8088d3:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8088d7:	74 08                	je     8088e1 <hd_iterate+0xc9>
  8088d9:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8088dd:	74 0b                	je     8088ea <hd_iterate+0xd2>
  8088df:	eb 24                	jmp    808905 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8088e1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8088e8:	eb 25                	jmp    80890f <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8088ea:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8088f1:	eb 1c                	jmp    80890f <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8088f3:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8088fa:	eb 13                	jmp    80890f <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8088fc:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  808903:	eb 0a                	jmp    80890f <hd_iterate+0xf7>
        default:
            return -1;
  808905:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80890a:	e9 28 01 00 00       	jmp    808a37 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  80890f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808912:	48 98                	cdqe   
  808914:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808918:	89 c7                	mov    edi,eax
  80891a:	e8 16 fe ff ff       	call   808735 <chk_result>
  80891f:	85 c0                	test   eax,eax
  808921:	0f 84 81 00 00 00    	je     8089a8 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  808927:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80892a:	89 c6                	mov    esi,eax
  80892c:	bf 18 45 81 00       	mov    edi,0x814518
  808931:	b8 00 00 00 00       	mov    eax,0x0
  808936:	e8 ec 83 ff ff       	call   800d27 <printf>
            //新硬盘
            device hd={
  80893b:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  808942:	b8 00 00 00 00       	mov    eax,0x0
  808947:	b9 15 00 00 00       	mov    ecx,0x15
  80894c:	48 89 d7             	mov    rdi,rdx
  80894f:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  808952:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808955:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80895b:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  808962:	00 00 00 
  808965:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80896c:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  80896f:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808973:	7f 07                	jg     80897c <hd_iterate+0x164>
  808975:	b8 f0 01 00 00       	mov    eax,0x1f0
  80897a:	eb 05                	jmp    808981 <hd_iterate+0x169>
  80897c:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  808981:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  808987:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80898e:	48 89 c7             	mov    rdi,rax
  808991:	e8 36 9c ff ff       	call   8025cc <reg_device>
  808996:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  808999:	48 63 d2             	movsxd rdx,edx
  80899c:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  8089a3:	e9 81 00 00 00       	jmp    808a29 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  8089a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8089ab:	48 98                	cdqe   
  8089ad:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8089b1:	89 c7                	mov    edi,eax
  8089b3:	e8 7d fd ff ff       	call   808735 <chk_result>
  8089b8:	85 c0                	test   eax,eax
  8089ba:	75 6d                	jne    808a29 <hd_iterate+0x211>
        {
            switch (i)
  8089bc:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8089c0:	74 3e                	je     808a00 <hd_iterate+0x1e8>
  8089c2:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8089c6:	7f 41                	jg     808a09 <hd_iterate+0x1f1>
  8089c8:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8089cc:	74 28                	je     8089f6 <hd_iterate+0x1de>
  8089ce:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8089d2:	7f 35                	jg     808a09 <hd_iterate+0x1f1>
  8089d4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8089d8:	74 08                	je     8089e2 <hd_iterate+0x1ca>
  8089da:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8089de:	74 0c                	je     8089ec <hd_iterate+0x1d4>
  8089e0:	eb 27                	jmp    808a09 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  8089e2:	48 c7 45 f8 08 45 81 	mov    QWORD PTR [rbp-0x8],0x814508
  8089e9:	00 
  8089ea:	eb 1d                	jmp    808a09 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  8089ec:	48 c7 45 f8 0c 45 81 	mov    QWORD PTR [rbp-0x8],0x81450c
  8089f3:	00 
  8089f4:	eb 13                	jmp    808a09 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8089f6:	48 c7 45 f8 10 45 81 	mov    QWORD PTR [rbp-0x8],0x814510
  8089fd:	00 
  8089fe:	eb 09                	jmp    808a09 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  808a00:	48 c7 45 f8 14 45 81 	mov    QWORD PTR [rbp-0x8],0x814514
  808a07:	00 
  808a08:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  808a09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a0d:	48 89 c7             	mov    rdi,rax
  808a10:	e8 ef 9f ff ff       	call   802a04 <sys_find_dev>
  808a15:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  808a18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a1b:	89 c7                	mov    edi,eax
  808a1d:	e8 b6 a6 ff ff       	call   8030d8 <get_dev>
  808a22:	89 c7                	mov    edi,eax
  808a24:	e8 02 a6 ff ff       	call   80302b <dispose_device>
    for(int i=0;i<1;i++)
  808a29:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808a2d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808a31:	0f 8e 84 fe ff ff    	jle    8088bb <hd_iterate+0xa3>
        }

    }
}
  808a37:	c9                   	leave  
  808a38:	c3                   	ret    

0000000000808a39 <async_check_disk>:

int async_check_disk(int disk)
{
  808a39:	f3 0f 1e fa          	endbr64 
  808a3d:	55                   	push   rbp
  808a3e:	48 89 e5             	mov    rbp,rsp
  808a41:	48 83 ec 20          	sub    rsp,0x20
  808a45:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  808a48:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  808a4e:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808a54:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808a58:	74 06                	je     808a60 <async_check_disk+0x27>
  808a5a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808a5e:	75 06                	jne    808a66 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  808a60:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  808a66:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808a6a:	74 06                	je     808a72 <async_check_disk+0x39>
  808a6c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808a70:	75 06                	jne    808a78 <async_check_disk+0x3f>
        chkcmd=0xf0;
  808a72:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  808a78:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a7c:	83 c0 02             	add    eax,0x2
  808a7f:	0f b7 c0             	movzx  eax,ax
  808a82:	be 01 00 00 00       	mov    esi,0x1
  808a87:	89 c7                	mov    edi,eax
  808a89:	e8 82 cf ff ff       	call   805a10 <outb>
    outb(disknr+3,0);
  808a8e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a92:	83 c0 03             	add    eax,0x3
  808a95:	0f b7 c0             	movzx  eax,ax
  808a98:	be 00 00 00 00       	mov    esi,0x0
  808a9d:	89 c7                	mov    edi,eax
  808a9f:	e8 6c cf ff ff       	call   805a10 <outb>
    outb(disknr+4,0);
  808aa4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808aa8:	83 c0 04             	add    eax,0x4
  808aab:	0f b7 c0             	movzx  eax,ax
  808aae:	be 00 00 00 00       	mov    esi,0x0
  808ab3:	89 c7                	mov    edi,eax
  808ab5:	e8 56 cf ff ff       	call   805a10 <outb>
    outb(disknr+5,0);
  808aba:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808abe:	83 c0 05             	add    eax,0x5
  808ac1:	0f b7 c0             	movzx  eax,ax
  808ac4:	be 00 00 00 00       	mov    esi,0x0
  808ac9:	89 c7                	mov    edi,eax
  808acb:	e8 40 cf ff ff       	call   805a10 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808ad0:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  808ad4:	0f b6 d0             	movzx  edx,al
  808ad7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808adb:	83 c0 06             	add    eax,0x6
  808ade:	0f b7 c0             	movzx  eax,ax
  808ae1:	89 d6                	mov    esi,edx
  808ae3:	89 c7                	mov    edi,eax
  808ae5:	e8 26 cf ff ff       	call   805a10 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808aea:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808aee:	83 c0 07             	add    eax,0x7
  808af1:	0f b7 c0             	movzx  eax,ax
  808af4:	be 90 00 00 00       	mov    esi,0x90
  808af9:	89 c7                	mov    edi,eax
  808afb:	e8 10 cf ff ff       	call   805a10 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808b00:	b8 00 00 00 00       	mov    eax,0x0
}
  808b05:	c9                   	leave  
  808b06:	c3                   	ret    

0000000000808b07 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  808b07:	f3 0f 1e fa          	endbr64 
  808b0b:	55                   	push   rbp
  808b0c:	48 89 e5             	mov    rbp,rsp
  808b0f:	48 83 ec 18          	sub    rsp,0x18
  808b13:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  808b17:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808b1e:	eb 04                	jmp    808b24 <hd_do_req+0x1d>
  808b20:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808b24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b27:	48 98                	cdqe   
  808b29:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  808b30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b34:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808b3a:	39 c2                	cmp    edx,eax
  808b3c:	75 e2                	jne    808b20 <hd_do_req+0x19>
    switch (args->cmd)
  808b3e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b42:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808b48:	83 f8 04             	cmp    eax,0x4
  808b4b:	74 72                	je     808bbf <hd_do_req+0xb8>
  808b4d:	83 f8 04             	cmp    eax,0x4
  808b50:	0f 8f 96 00 00 00    	jg     808bec <hd_do_req+0xe5>
  808b56:	83 f8 02             	cmp    eax,0x2
  808b59:	74 0a                	je     808b65 <hd_do_req+0x5e>
  808b5b:	83 f8 03             	cmp    eax,0x3
  808b5e:	74 32                	je     808b92 <hd_do_req+0x8b>
  808b60:	e9 87 00 00 00       	jmp    808bec <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  808b65:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b69:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b6c:	48 98                	cdqe   
  808b6e:	48 89 c6             	mov    rsi,rax
  808b71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b75:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808b78:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b7c:	8b 10                	mov    edx,DWORD PTR [rax]
  808b7e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b81:	49 89 f0             	mov    r8,rsi
  808b84:	be 00 00 00 00       	mov    esi,0x0
  808b89:	89 c7                	mov    edi,eax
  808b8b:	e8 f1 f4 ff ff       	call   808081 <request>
        break;
  808b90:	eb 61                	jmp    808bf3 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  808b92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b96:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b99:	48 98                	cdqe   
  808b9b:	48 89 c6             	mov    rsi,rax
  808b9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ba2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808ba5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ba9:	8b 10                	mov    edx,DWORD PTR [rax]
  808bab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808bae:	49 89 f0             	mov    r8,rsi
  808bb1:	be 01 00 00 00       	mov    esi,0x1
  808bb6:	89 c7                	mov    edi,eax
  808bb8:	e8 c4 f4 ff ff       	call   808081 <request>
        break;
  808bbd:	eb 34                	jmp    808bf3 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808bbf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bc3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808bc6:	48 98                	cdqe   
  808bc8:	48 89 c6             	mov    rsi,rax
  808bcb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bcf:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808bd2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bd6:	8b 10                	mov    edx,DWORD PTR [rax]
  808bd8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808bdb:	49 89 f0             	mov    r8,rsi
  808bde:	be 02 00 00 00       	mov    esi,0x2
  808be3:	89 c7                	mov    edi,eax
  808be5:	e8 97 f4 ff ff       	call   808081 <request>
        break;
  808bea:	eb 07                	jmp    808bf3 <hd_do_req+0xec>
    default:return -1;
  808bec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808bf1:	eb 1e                	jmp    808c11 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  808bf3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bf7:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808bfe:	00 00 00 
    running_devman_req=args;
  808c01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c05:	48 89 05 dc 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218dc],rax        # 42a4e8 <running_devman_req>
    return 0;
  808c0c:	b8 00 00 00 00       	mov    eax,0x0
  808c11:	c9                   	leave  
  808c12:	c3                   	ret    
  808c13:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  808c1a:	00 00 00 
  808c1d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000808c20 <disk_int_handler>:
  808c20:	e8 19 ce ff ff       	call   805a3e <eoi>
  808c25:	e8 68 f2 ff ff       	call   807e92 <disk_int_handler_c>
  808c2a:	48 cf                	iretq  

0000000000808c2c <read_disk_asm>:
  808c2c:	55                   	push   rbp
  808c2d:	89 e5                	mov    ebp,esp
  808c2f:	66 ba f7 01          	mov    dx,0x1f7
  808c33:	31 c9                	xor    ecx,ecx
  808c35:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808c3a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808c3f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808c44:	89 c6                	mov    esi,eax
  808c46:	66 ba f2 01          	mov    dx,0x1f2
  808c4a:	88 c8                	mov    al,cl
  808c4c:	ee                   	out    dx,al
  808c4d:	66 ba f3 01          	mov    dx,0x1f3
  808c51:	89 f0                	mov    eax,esi
  808c53:	ee                   	out    dx,al
  808c54:	66 ff c2             	inc    dx
  808c57:	c1 e8 08             	shr    eax,0x8
  808c5a:	ee                   	out    dx,al
  808c5b:	66 ff c2             	inc    dx
  808c5e:	c1 e8 08             	shr    eax,0x8
  808c61:	ee                   	out    dx,al
  808c62:	66 ff c2             	inc    dx
  808c65:	66 c1 e8 08          	shr    ax,0x8
  808c69:	24 0f                	and    al,0xf
  808c6b:	0c e0                	or     al,0xe0
  808c6d:	ee                   	out    dx,al
  808c6e:	66 ff c2             	inc    dx
  808c71:	b0 20                	mov    al,0x20
  808c73:	ee                   	out    dx,al

0000000000808c74 <read_disk_asm.wait>:
  808c74:	90                   	nop
  808c75:	ec                   	in     al,dx
  808c76:	24 88                	and    al,0x88
  808c78:	3c 08                	cmp    al,0x8
  808c7a:	75 f8                	jne    808c74 <read_disk_asm.wait>
  808c7c:	66 89 d7             	mov    di,dx
  808c7f:	89 c8                	mov    eax,ecx
  808c81:	66 b9 00 01          	mov    cx,0x100
  808c85:	66 f7 e1             	mul    cx
  808c88:	89 c1                	mov    ecx,eax
  808c8a:	66 ba f0 01          	mov    dx,0x1f0

0000000000808c8e <read_disk_asm.read>:
  808c8e:	66 ed                	in     ax,dx
  808c90:	66 67 89 03          	mov    WORD PTR [ebx],ax
  808c94:	83 c3 02             	add    ebx,0x2
  808c97:	e2 f5                	loop   808c8e <read_disk_asm.read>
  808c99:	c9                   	leave  
  808c9a:	b8 00 00 00 00       	mov    eax,0x0
  808c9f:	c3                   	ret    

0000000000808ca0 <read_disk_asm.err_disk_reading>:
  808ca0:	66 ba f1 01          	mov    dx,0x1f1
  808ca4:	31 c0                	xor    eax,eax
  808ca6:	66 ed                	in     ax,dx
  808ca8:	89 ec                	mov    esp,ebp
  808caa:	5d                   	pop    rbp
  808cab:	c3                   	ret    

0000000000808cac <write_disk_asm>:
  808cac:	55                   	push   rbp
  808cad:	89 e5                	mov    ebp,esp
  808caf:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808cb4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808cb9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808cbe:	50                   	push   rax
  808cbf:	66 ba f2 01          	mov    dx,0x1f2
  808cc3:	88 c8                	mov    al,cl
  808cc5:	ee                   	out    dx,al
  808cc6:	58                   	pop    rax
  808cc7:	66 ba f3 01          	mov    dx,0x1f3
  808ccb:	ee                   	out    dx,al
  808ccc:	c1 e8 08             	shr    eax,0x8
  808ccf:	66 ba f4 01          	mov    dx,0x1f4
  808cd3:	ee                   	out    dx,al
  808cd4:	c1 e8 08             	shr    eax,0x8
  808cd7:	66 ba f5 01          	mov    dx,0x1f5
  808cdb:	ee                   	out    dx,al
  808cdc:	c1 e8 08             	shr    eax,0x8
  808cdf:	24 0f                	and    al,0xf
  808ce1:	0c e0                	or     al,0xe0
  808ce3:	66 ba f6 01          	mov    dx,0x1f6
  808ce7:	ee                   	out    dx,al
  808ce8:	66 ba f7 01          	mov    dx,0x1f7
  808cec:	b0 30                	mov    al,0x30
  808cee:	ee                   	out    dx,al

0000000000808cef <write_disk_asm.not_ready2>:
  808cef:	90                   	nop
  808cf0:	ec                   	in     al,dx
  808cf1:	24 88                	and    al,0x88
  808cf3:	3c 08                	cmp    al,0x8
  808cf5:	75 f8                	jne    808cef <write_disk_asm.not_ready2>
  808cf7:	89 c8                	mov    eax,ecx
  808cf9:	66 b9 00 01          	mov    cx,0x100
  808cfd:	66 f7 e1             	mul    cx
  808d00:	89 c1                	mov    ecx,eax
  808d02:	66 ba f0 01          	mov    dx,0x1f0

0000000000808d06 <write_disk_asm.go_on_write>:
  808d06:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  808d0a:	66 ef                	out    dx,ax
  808d0c:	83 c3 02             	add    ebx,0x2
  808d0f:	e2 f5                	loop   808d06 <write_disk_asm.go_on_write>
  808d11:	89 ec                	mov    esp,ebp
  808d13:	5d                   	pop    rbp
  808d14:	c3                   	ret    

0000000000808d15 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808d15:	f3 0f 1e fa          	endbr64 
  808d19:	55                   	push   rbp
  808d1a:	48 89 e5             	mov    rbp,rsp
  808d1d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808d24:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808d2b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808d31:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808d38:	ba 00 02 00 00       	mov    edx,0x200
  808d3d:	be 00 00 00 00       	mov    esi,0x0
  808d42:	48 89 c7             	mov    rdi,rax
  808d45:	e8 66 2e 00 00       	call   80bbb0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808d4a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808d51:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808d55:	89 c2                	mov    edx,eax
  808d57:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808d5d:	c1 e8 07             	shr    eax,0x7
  808d60:	01 d0                	add    eax,edx
  808d62:	89 c2                	mov    edx,eax
  808d64:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808d6b:	49 89 c0             	mov    r8,rax
  808d6e:	b9 01 00 00 00       	mov    ecx,0x1
  808d73:	be 00 00 00 00       	mov    esi,0x0
  808d78:	bf 00 00 00 00       	mov    edi,0x0
  808d7d:	e8 ff f2 ff ff       	call   808081 <request>
  808d82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  808d85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d88:	89 c7                	mov    edi,eax
  808d8a:	e8 a6 f9 ff ff       	call   808735 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  808d8f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808d95:	83 e0 7f             	and    eax,0x7f
  808d98:	89 c0                	mov    eax,eax
  808d9a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  808da1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808da7:	89 c6                	mov    esi,eax
  808da9:	bf 30 45 81 00       	mov    edi,0x814530
  808dae:	b8 00 00 00 00       	mov    eax,0x0
  808db3:	e8 6f 7f ff ff       	call   800d27 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808db8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808dbe:	83 e0 7f             	and    eax,0x7f
  808dc1:	89 c0                	mov    eax,eax
  808dc3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808dca:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  808dcf:	c9                   	leave  
  808dd0:	c3                   	ret    

0000000000808dd1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808dd1:	f3 0f 1e fa          	endbr64 
  808dd5:	55                   	push   rbp
  808dd6:	48 89 e5             	mov    rbp,rsp
  808dd9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808de0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808de7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  808ded:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  808df3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808dfa:	ba 00 02 00 00       	mov    edx,0x200
  808dff:	be 00 00 00 00       	mov    esi,0x0
  808e04:	48 89 c7             	mov    rdi,rax
  808e07:	e8 a4 2d 00 00       	call   80bbb0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808e0c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808e13:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e17:	89 c2                	mov    edx,eax
  808e19:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808e1f:	c1 e8 07             	shr    eax,0x7
  808e22:	01 d0                	add    eax,edx
  808e24:	89 c2                	mov    edx,eax
  808e26:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808e2d:	49 89 c0             	mov    r8,rax
  808e30:	b9 01 00 00 00       	mov    ecx,0x1
  808e35:	be 00 00 00 00       	mov    esi,0x0
  808e3a:	bf 00 00 00 00       	mov    edi,0x0
  808e3f:	e8 3d f2 ff ff       	call   808081 <request>
  808e44:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  808e47:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808e4a:	89 c7                	mov    edi,eax
  808e4c:	e8 e4 f8 ff ff       	call   808735 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  808e51:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808e57:	83 e0 7f             	and    eax,0x7f
  808e5a:	89 c0                	mov    eax,eax
  808e5c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808e63:	25 00 00 00 f0       	and    eax,0xf0000000
  808e68:	89 c6                	mov    esi,eax
  808e6a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  808e70:	25 ff ff ff 0f       	and    eax,0xfffffff
  808e75:	89 c1                	mov    ecx,eax
  808e77:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808e7d:	83 e0 7f             	and    eax,0x7f
  808e80:	89 c2                	mov    edx,eax
  808e82:	89 f0                	mov    eax,esi
  808e84:	09 c8                	or     eax,ecx
  808e86:	89 d2                	mov    edx,edx
  808e88:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  808e8f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808e96:	eb 61                	jmp    808ef9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  808e98:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808e9f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ea3:	89 c1                	mov    ecx,eax
  808ea5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808eac:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808eb0:	89 c2                	mov    edx,eax
  808eb2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808eb5:	48 98                	cdqe   
  808eb7:	0f af c2             	imul   eax,edx
  808eba:	8d 14 01             	lea    edx,[rcx+rax*1]
  808ebd:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808ec3:	c1 e8 07             	shr    eax,0x7
  808ec6:	01 d0                	add    eax,edx
  808ec8:	89 c2                	mov    edx,eax
  808eca:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808ed1:	49 89 c0             	mov    r8,rax
  808ed4:	b9 01 00 00 00       	mov    ecx,0x1
  808ed9:	be 01 00 00 00       	mov    esi,0x1
  808ede:	bf 00 00 00 00       	mov    edi,0x0
  808ee3:	e8 99 f1 ff ff       	call   808081 <request>
  808ee8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  808eeb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808eee:	89 c7                	mov    edi,eax
  808ef0:	e8 40 f8 ff ff       	call   808735 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  808ef5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808ef9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808efc:	48 63 d0             	movsxd rdx,eax
  808eff:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808f06:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808f0a:	48 39 c2             	cmp    rdx,rax
  808f0d:	72 89                	jb     808e98 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  808f0f:	b8 01 00 00 00       	mov    eax,0x1
}
  808f14:	c9                   	leave  
  808f15:	c3                   	ret    

0000000000808f16 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  808f16:	f3 0f 1e fa          	endbr64 
  808f1a:	55                   	push   rbp
  808f1b:	48 89 e5             	mov    rbp,rsp
  808f1e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808f22:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808f26:	b8 01 00 00 00       	mov    eax,0x1
}
  808f2b:	5d                   	pop    rbp
  808f2c:	c3                   	ret    

0000000000808f2d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  808f2d:	f3 0f 1e fa          	endbr64 
  808f31:	55                   	push   rbp
  808f32:	48 89 e5             	mov    rbp,rsp
  808f35:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808f39:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808f3d:	b8 01 00 00 00       	mov    eax,0x1
}
  808f42:	5d                   	pop    rbp
  808f43:	c3                   	ret    

0000000000808f44 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  808f44:	f3 0f 1e fa          	endbr64 
  808f48:	55                   	push   rbp
  808f49:	48 89 e5             	mov    rbp,rsp
  808f4c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808f50:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  808f54:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  808f58:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  808f5c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808f60:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808f64:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f68:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f6c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f70:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808f74:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808f78:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f7c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f80:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f84:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f88:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  808f8c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f90:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f93:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  808f97:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808f9e:	00 
	int i,length = 0;
  808f9f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  808fa6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808fad:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808fae:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808fb2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808fb5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808fb9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808fbd:	48 99                	cqo    
  808fbf:	48 f7 fe             	idiv   rsi
  808fc2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808fc5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808fc9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808fcc:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808fd0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808fd4:	48 99                	cqo    
  808fd6:	48 f7 f9             	idiv   rcx
  808fd9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808fdd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808fe1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808fe5:	be 00 00 00 00       	mov    esi,0x0
  808fea:	48 89 c7             	mov    rdi,rax
  808fed:	b8 00 00 00 00       	mov    eax,0x0
  808ff2:	e8 c2 82 ff ff       	call   8012b9 <vmalloc>
  808ff7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  808ffb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809000:	75 0c                	jne    80900e <FAT32_read+0xca>
		return -EFAULT;
  809002:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  809009:	e9 f0 01 00 00       	jmp    8091fe <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80900e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809015:	eb 1e                	jmp    809035 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809017:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80901b:	89 c2                	mov    edx,eax
  80901d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809021:	89 d6                	mov    esi,edx
  809023:	48 89 c7             	mov    rdi,rax
  809026:	e8 ea fc ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  80902b:	89 c0                	mov    eax,eax
  80902d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  809031:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809035:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809038:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80903b:	7c da                	jl     809017 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80903d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809041:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809044:	48 89 c2             	mov    rdx,rax
  809047:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80904b:	48 01 c2             	add    rdx,rax
  80904e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809052:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809056:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80905a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80905d:	48 39 c2             	cmp    rdx,rax
  809060:	76 2c                	jbe    80908e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  809062:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809066:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80906a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80906e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809071:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809075:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809078:	48 89 c1             	mov    rcx,rax
  80907b:	48 89 d0             	mov    rax,rdx
  80907e:	48 29 c8             	sub    rax,rcx
  809081:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  809085:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809089:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80908c:	eb 07                	jmp    809095 <FAT32_read+0x151>
	else
		index = count;
  80908e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809092:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  809095:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809099:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80909d:	89 c2                	mov    edx,eax
  80909f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8090a3:	be 00 00 00 00       	mov    esi,0x0
  8090a8:	48 89 c7             	mov    rdi,rax
  8090ab:	e8 00 2b 00 00       	call   80bbb0 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8090b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8090b4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8090b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090bc:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8090c0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8090c4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8090c8:	48 0f af c2          	imul   rax,rdx
  8090cc:	48 01 c8             	add    rax,rcx
  8090cf:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8090d3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8090d7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8090db:	89 c1                	mov    ecx,eax
  8090dd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8090e1:	89 c2                	mov    edx,eax
  8090e3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8090e7:	49 89 c0             	mov    r8,rax
  8090ea:	be 00 00 00 00       	mov    esi,0x0
  8090ef:	bf 00 00 00 00       	mov    edi,0x0
  8090f4:	e8 88 ef ff ff       	call   808081 <request>
  8090f9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  8090fc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8090ff:	89 c7                	mov    edi,eax
  809101:	e8 2f f6 ff ff       	call   808735 <chk_result>
  809106:	85 c0                	test   eax,eax
  809108:	75 1c                	jne    809126 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80910a:	bf 60 45 81 00       	mov    edi,0x814560
  80910f:	b8 00 00 00 00       	mov    eax,0x0
  809114:	e8 0e 7c ff ff       	call   800d27 <printf>
			retval = -EIO;
  809119:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  809120:	ff 
			break;
  809121:	e9 ba 00 00 00       	jmp    8091e0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809126:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809129:	48 63 d0             	movsxd rdx,eax
  80912c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809130:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809134:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  809138:	48 39 c2             	cmp    rdx,rax
  80913b:	48 0f 4e c2          	cmovle rax,rdx
  80913f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  809142:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809146:	48 83 f8 1f          	cmp    rax,0x1f
  80914a:	77 1f                	ja     80916b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80914c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80914f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809153:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809157:	48 01 c1             	add    rcx,rax
  80915a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80915e:	48 89 c6             	mov    rsi,rax
  809161:	48 89 cf             	mov    rdi,rcx
  809164:	e8 98 29 00 00       	call   80bb01 <memcpy>
  809169:	eb 1d                	jmp    809188 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80916b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80916e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809172:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809176:	48 01 c1             	add    rcx,rax
  809179:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80917d:	48 89 c6             	mov    rsi,rax
  809180:	48 89 cf             	mov    rdi,rcx
  809183:	e8 79 29 00 00       	call   80bb01 <memcpy>

		index -= length;
  809188:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80918b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80918e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  809191:	48 98                	cdqe   
  809193:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  809197:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80919e:	00 
		*position += length;
  80919f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091a3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8091a6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8091a9:	48 98                	cdqe   
  8091ab:	48 01 c2             	add    rdx,rax
  8091ae:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091b2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  8091b5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8091b9:	74 25                	je     8091e0 <FAT32_read+0x29c>
  8091bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091bf:	89 c2                	mov    edx,eax
  8091c1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8091c5:	89 d6                	mov    esi,edx
  8091c7:	48 89 c7             	mov    rdi,rax
  8091ca:	e8 46 fb ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  8091cf:	89 c0                	mov    eax,eax
  8091d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8091d5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8091da:	0f 85 b5 fe ff ff    	jne    809095 <FAT32_read+0x151>

	vmfree(buffer);
  8091e0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8091e4:	48 89 c7             	mov    rdi,rax
  8091e7:	e8 5c 81 ff ff       	call   801348 <vmfree>
	if(!index)
  8091ec:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8091f0:	75 08                	jne    8091fa <FAT32_read+0x2b6>
		retval = count;
  8091f2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8091f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  8091fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  8091fe:	c9                   	leave  
  8091ff:	c3                   	ret    

0000000000809200 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  809200:	f3 0f 1e fa          	endbr64 
  809204:	55                   	push   rbp
  809205:	48 89 e5             	mov    rbp,rsp
  809208:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80920f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  809216:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80921d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  809221:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  809225:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80922c:	e9 8b 00 00 00       	jmp    8092bc <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  809231:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809238:	ba 00 02 00 00       	mov    edx,0x200
  80923d:	be 00 00 00 00       	mov    esi,0x0
  809242:	48 89 c7             	mov    rdi,rax
  809245:	e8 66 29 00 00       	call   80bbb0 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80924a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  809251:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809255:	89 c2                	mov    edx,eax
  809257:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80925a:	01 d0                	add    eax,edx
  80925c:	89 c2                	mov    edx,eax
  80925e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809265:	49 89 c0             	mov    r8,rax
  809268:	b9 01 00 00 00       	mov    ecx,0x1
  80926d:	be 00 00 00 00       	mov    esi,0x0
  809272:	bf 00 00 00 00       	mov    edi,0x0
  809277:	e8 05 ee ff ff       	call   808081 <request>
  80927c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80927f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809286:	eb 2a                	jmp    8092b2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  809288:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80928b:	48 98                	cdqe   
  80928d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  809294:	25 ff ff ff 0f       	and    eax,0xfffffff
  809299:	85 c0                	test   eax,eax
  80929b:	75 11                	jne    8092ae <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80929d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092a0:	c1 e0 07             	shl    eax,0x7
  8092a3:	89 c2                	mov    edx,eax
  8092a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8092a8:	01 d0                	add    eax,edx
  8092aa:	48 98                	cdqe   
  8092ac:	eb 22                	jmp    8092d0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  8092ae:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8092b2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  8092b6:	7e d0                	jle    809288 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  8092b8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8092bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092bf:	48 98                	cdqe   
  8092c1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8092c5:	0f 87 66 ff ff ff    	ja     809231 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  8092cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8092d0:	c9                   	leave  
  8092d1:	c3                   	ret    

00000000008092d2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  8092d2:	f3 0f 1e fa          	endbr64 
  8092d6:	55                   	push   rbp
  8092d7:	48 89 e5             	mov    rbp,rsp
  8092da:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  8092e1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  8092e5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  8092e9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8092f0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  8092f7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8092fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092ff:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809303:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809307:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80930b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80930f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809313:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809317:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80931b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80931f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  809323:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809327:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80932a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80932e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809335:	00 
	unsigned long sector = 0;
  809336:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80933d:	00 
	int i,length = 0;
  80933e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  809345:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80934c:	00 
	long flags = 0;
  80934d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809354:	00 
	int index = *position / fsbi->bytes_per_cluster;
  809355:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80935c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80935f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809363:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809367:	48 99                	cqo    
  809369:	48 f7 fe             	idiv   rsi
  80936c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80936f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809376:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809379:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80937d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809381:	48 99                	cqo    
  809383:	48 f7 f9             	idiv   rcx
  809386:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80938a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80938e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809392:	be 00 00 00 00       	mov    esi,0x0
  809397:	48 89 c7             	mov    rdi,rax
  80939a:	b8 00 00 00 00       	mov    eax,0x0
  80939f:	e8 15 7f ff ff       	call   8012b9 <vmalloc>
  8093a4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  8093a8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8093ad:	75 1a                	jne    8093c9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  8093af:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093b3:	48 89 c7             	mov    rdi,rax
  8093b6:	e8 45 fe ff ff       	call   809200 <FAT32_find_available_cluster>
  8093bb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  8093bf:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8093c6:	00 
  8093c7:	eb 2f                	jmp    8093f8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  8093c9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8093d0:	eb 1e                	jmp    8093f0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8093d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093d6:	89 c2                	mov    edx,eax
  8093d8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093dc:	89 d6                	mov    esi,edx
  8093de:	48 89 c7             	mov    rdi,rax
  8093e1:	e8 2f f9 ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  8093e6:	89 c0                	mov    eax,eax
  8093e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  8093ec:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8093f0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8093f3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  8093f6:	7c da                	jl     8093d2 <FAT32_write+0x100>

	if(!cluster)
  8093f8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8093fd:	75 18                	jne    809417 <FAT32_write+0x145>
	{
		vmfree(buffer);
  8093ff:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809403:	48 89 c7             	mov    rdi,rax
  809406:	e8 3d 7f ff ff       	call   801348 <vmfree>
		return -ENOSPC;
  80940b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809412:	e9 13 03 00 00       	jmp    80972a <FAT32_write+0x458>
	}

	if(flags)
  809417:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80941c:	74 4d                	je     80946b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80941e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809422:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809426:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809429:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80942d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809431:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809435:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809439:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80943d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809441:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809445:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809449:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80944d:	48 89 c7             	mov    rdi,rax
  809450:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  809452:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809456:	89 c1                	mov    ecx,eax
  809458:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80945c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809461:	89 ce                	mov    esi,ecx
  809463:	48 89 c7             	mov    rdi,rax
  809466:	e8 66 f9 ff ff       	call   808dd1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80946b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809472:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  809475:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80947a:	0f 85 91 00 00 00    	jne    809511 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  809480:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809484:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809488:	89 c2                	mov    edx,eax
  80948a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80948e:	be 00 00 00 00       	mov    esi,0x0
  809493:	48 89 c7             	mov    rdi,rax
  809496:	e8 15 27 00 00       	call   80bbb0 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80949b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80949f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8094a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094a7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8094ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094af:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094b3:	48 0f af c2          	imul   rax,rdx
  8094b7:	48 01 c8             	add    rax,rcx
  8094ba:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8094be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094c2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094c6:	89 c1                	mov    ecx,eax
  8094c8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8094cc:	89 c2                	mov    edx,eax
  8094ce:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8094d2:	49 89 c0             	mov    r8,rax
  8094d5:	be 00 00 00 00       	mov    esi,0x0
  8094da:	bf 00 00 00 00       	mov    edi,0x0
  8094df:	e8 9d eb ff ff       	call   808081 <request>
  8094e4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  8094e7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  8094ea:	89 c7                	mov    edi,eax
  8094ec:	e8 44 f2 ff ff       	call   808735 <chk_result>
  8094f1:	85 c0                	test   eax,eax
  8094f3:	75 1c                	jne    809511 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  8094f5:	bf 90 45 81 00       	mov    edi,0x814590
  8094fa:	b8 00 00 00 00       	mov    eax,0x0
  8094ff:	e8 23 78 ff ff       	call   800d27 <printf>
				retval = -EIO;
  809504:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80950b:	ff 
				break;
  80950c:	e9 95 01 00 00       	jmp    8096a6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809511:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809514:	48 63 d0             	movsxd rdx,eax
  809517:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80951b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80951f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809523:	48 39 c2             	cmp    rdx,rax
  809526:	48 0f 4e c2          	cmovle rax,rdx
  80952a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80952d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809531:	48 83 f8 1f          	cmp    rax,0x1f
  809535:	77 1f                	ja     809556 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809537:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80953a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80953e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809542:	48 01 c1             	add    rcx,rax
  809545:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809549:	48 89 ce             	mov    rsi,rcx
  80954c:	48 89 c7             	mov    rdi,rax
  80954f:	e8 ad 25 00 00       	call   80bb01 <memcpy>
  809554:	eb 1d                	jmp    809573 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809556:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809559:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80955d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809561:	48 01 c1             	add    rcx,rax
  809564:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809568:	48 89 ce             	mov    rsi,rcx
  80956b:	48 89 c7             	mov    rdi,rax
  80956e:	e8 8e 25 00 00       	call   80bb01 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809573:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809577:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80957b:	89 c1                	mov    ecx,eax
  80957d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809581:	89 c2                	mov    edx,eax
  809583:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809587:	49 89 c0             	mov    r8,rax
  80958a:	be 01 00 00 00       	mov    esi,0x1
  80958f:	bf 00 00 00 00       	mov    edi,0x0
  809594:	e8 e8 ea ff ff       	call   808081 <request>
  809599:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80959c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80959f:	89 c7                	mov    edi,eax
  8095a1:	e8 8f f1 ff ff       	call   808735 <chk_result>
  8095a6:	85 c0                	test   eax,eax
  8095a8:	75 1c                	jne    8095c6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8095aa:	bf c0 45 81 00       	mov    edi,0x8145c0
  8095af:	b8 00 00 00 00       	mov    eax,0x0
  8095b4:	e8 6e 77 ff ff       	call   800d27 <printf>
			retval = -EIO;
  8095b9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  8095c0:	ff 
			break;
  8095c1:	e9 e0 00 00 00       	jmp    8096a6 <FAT32_write+0x3d4>
		}

		index -= length;
  8095c6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8095c9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  8095cc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8095cf:	48 98                	cdqe   
  8095d1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  8095d5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8095dc:	00 
		*position += length;
  8095dd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8095e4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8095e7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8095ea:	48 98                	cdqe   
  8095ec:	48 01 c2             	add    rdx,rax
  8095ef:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8095f6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  8095f9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8095fd:	0f 84 a2 00 00 00    	je     8096a5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809603:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809607:	89 c2                	mov    edx,eax
  809609:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80960d:	89 d6                	mov    esi,edx
  80960f:	48 89 c7             	mov    rdi,rax
  809612:	e8 fe f6 ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  809617:	89 c0                	mov    eax,eax
  809619:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80961d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809624:	0f 
  809625:	76 72                	jbe    809699 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809627:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80962b:	48 89 c7             	mov    rdi,rax
  80962e:	e8 cd fb ff ff       	call   809200 <FAT32_find_available_cluster>
  809633:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809637:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80963c:	75 18                	jne    809656 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80963e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809642:	48 89 c7             	mov    rdi,rax
  809645:	e8 fe 7c ff ff       	call   801348 <vmfree>
				return -ENOSPC;
  80964a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809651:	e9 d4 00 00 00       	jmp    80972a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809656:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80965a:	89 c2                	mov    edx,eax
  80965c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809660:	89 c1                	mov    ecx,eax
  809662:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809666:	89 ce                	mov    esi,ecx
  809668:	48 89 c7             	mov    rdi,rax
  80966b:	e8 61 f7 ff ff       	call   808dd1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  809670:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809674:	89 c1                	mov    ecx,eax
  809676:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80967a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80967f:	89 ce                	mov    esi,ecx
  809681:	48 89 c7             	mov    rdi,rax
  809684:	e8 48 f7 ff ff       	call   808dd1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  809689:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80968d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  809691:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809698:	00 
		}

	}while(index);
  809699:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80969d:	0f 85 d2 fd ff ff    	jne    809475 <FAT32_write+0x1a3>
  8096a3:	eb 01                	jmp    8096a6 <FAT32_write+0x3d4>
			break;
  8096a5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8096a6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8096ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8096b0:	48 89 c2             	mov    rdx,rax
  8096b3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8096b7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096bb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8096bf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8096c2:	48 39 c2             	cmp    rdx,rax
  8096c5:	76 42                	jbe    809709 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  8096c7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8096ce:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8096d1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8096d5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096d9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8096dd:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  8096e0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8096e4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096e8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8096ec:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8096f0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8096f4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8096f8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8096fc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809700:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809704:	48 89 c7             	mov    rdi,rax
  809707:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809709:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80970d:	48 89 c7             	mov    rdi,rax
  809710:	e8 33 7c ff ff       	call   801348 <vmfree>
	if(!index)
  809715:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809719:	75 0b                	jne    809726 <FAT32_write+0x454>
		retval = count;
  80971b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809722:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809726:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80972a:	c9                   	leave  
  80972b:	c3                   	ret    

000000000080972c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80972c:	f3 0f 1e fa          	endbr64 
  809730:	55                   	push   rbp
  809731:	48 89 e5             	mov    rbp,rsp
  809734:	48 83 ec 30          	sub    rsp,0x30
  809738:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80973c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809740:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809744:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809748:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80974c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809750:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809754:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80975b:	00 

	switch(origin)
  80975c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809761:	74 21                	je     809784 <FAT32_lseek+0x58>
  809763:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809768:	7f 4a                	jg     8097b4 <FAT32_lseek+0x88>
  80976a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80976f:	74 09                	je     80977a <FAT32_lseek+0x4e>
  809771:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  809776:	74 20                	je     809798 <FAT32_lseek+0x6c>
  809778:	eb 3a                	jmp    8097b4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80977a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80977e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809782:	eb 39                	jmp    8097bd <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  809784:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809788:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80978b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80978f:	48 01 d0             	add    rax,rdx
  809792:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809796:	eb 25                	jmp    8097bd <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  809798:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80979c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097a0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8097a4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8097a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8097ab:	48 01 d0             	add    rax,rdx
  8097ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8097b2:	eb 09                	jmp    8097bd <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  8097b4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8097bb:	eb 50                	jmp    80980d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  8097bd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8097c2:	78 18                	js     8097dc <FAT32_lseek+0xb0>
  8097c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8097c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097cc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8097d0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8097d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097d7:	48 39 c2             	cmp    rdx,rax
  8097da:	73 09                	jae    8097e5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  8097dc:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  8097e3:	eb 28                	jmp    80980d <FAT32_lseek+0xe1>

	filp->position = pos;
  8097e5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8097e9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8097ed:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  8097f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8097f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097f7:	48 89 c6             	mov    rsi,rax
  8097fa:	bf f0 45 81 00       	mov    edi,0x8145f0
  8097ff:	b8 00 00 00 00       	mov    eax,0x0
  809804:	e8 1e 75 ff ff       	call   800d27 <printf>

	return pos;
  809809:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80980d:	c9                   	leave  
  80980e:	c3                   	ret    

000000000080980f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80980f:	f3 0f 1e fa          	endbr64 
  809813:	55                   	push   rbp
  809814:	48 89 e5             	mov    rbp,rsp
  809817:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80981b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80981f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809823:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809827:	90                   	nop
  809828:	5d                   	pop    rbp
  809829:	c3                   	ret    

000000000080982a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80982a:	f3 0f 1e fa          	endbr64 
  80982e:	55                   	push   rbp
  80982f:	48 89 e5             	mov    rbp,rsp
  809832:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809836:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80983a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80983e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809842:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809846:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80984a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80984e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809852:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809856:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80985a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80985e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809862:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809866:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80986a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80986e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809875:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80987c:	00 
	unsigned char * buf =NULL; 
  80987d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  809884:	00 
	char *name = NULL;
  809885:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80988c:	00 
	int namelen = 0;
  80988d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  809894:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80989b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  8098a2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8098a9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8098b0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8098b7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  8098b8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8098bf:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  8098c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8098c8:	be 00 00 00 00       	mov    esi,0x0
  8098cd:	48 89 c7             	mov    rdi,rax
  8098d0:	b8 00 00 00 00       	mov    eax,0x0
  8098d5:	e8 df 79 ff ff       	call   8012b9 <vmalloc>
  8098da:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  8098de:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8098e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098e5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  8098e8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8098ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098ef:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8098f3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8098f7:	48 99                	cqo    
  8098f9:	48 f7 fe             	idiv   rsi
  8098fc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  8098ff:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809906:	eb 3a                	jmp    809942 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809908:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80990b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80990f:	89 d6                	mov    esi,edx
  809911:	48 89 c7             	mov    rdi,rax
  809914:	e8 fc f3 ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  809919:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80991c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  809923:	76 19                	jbe    80993e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  809925:	bf 18 46 81 00       	mov    edi,0x814618
  80992a:	b8 00 00 00 00       	mov    eax,0x0
  80992f:	e8 f3 73 ff ff       	call   800d27 <printf>
			return NULL;
  809934:	b8 00 00 00 00       	mov    eax,0x0
  809939:	e9 86 05 00 00       	jmp    809ec4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80993e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  809942:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809945:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809948:	7c be                	jl     809908 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80994a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80994b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80994f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809953:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809956:	83 e8 02             	sub    eax,0x2
  809959:	89 c1                	mov    ecx,eax
  80995b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80995f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809963:	48 0f af c1          	imul   rax,rcx
  809967:	48 01 d0             	add    rax,rdx
  80996a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80996e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809972:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809976:	89 c1                	mov    ecx,eax
  809978:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80997c:	89 c2                	mov    edx,eax
  80997e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809982:	49 89 c0             	mov    r8,rax
  809985:	be 00 00 00 00       	mov    esi,0x0
  80998a:	bf 00 00 00 00       	mov    edi,0x0
  80998f:	e8 ed e6 ff ff       	call   808081 <request>
  809994:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  809997:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80999a:	89 c7                	mov    edi,eax
  80999c:	e8 94 ed ff ff       	call   808735 <chk_result>
  8099a1:	85 c0                	test   eax,eax
  8099a3:	75 25                	jne    8099ca <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  8099a5:	bf 40 46 81 00       	mov    edi,0x814640
  8099aa:	b8 00 00 00 00       	mov    eax,0x0
  8099af:	e8 73 73 ff ff       	call   800d27 <printf>
		vmfree(buf);
  8099b4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099b8:	48 89 c7             	mov    rdi,rax
  8099bb:	e8 88 79 ff ff       	call   801348 <vmfree>
		return NULL;
  8099c0:	b8 00 00 00 00       	mov    eax,0x0
  8099c5:	e9 fa 04 00 00       	jmp    809ec4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  8099ca:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8099d1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8099d5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8099d9:	48 99                	cqo    
  8099db:	48 f7 f9             	idiv   rcx
  8099de:	48 89 d0             	mov    rax,rdx
  8099e1:	48 89 c2             	mov    rdx,rax
  8099e4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8099e8:	48 01 d0             	add    rax,rdx
  8099eb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8099ef:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8099f3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8099f6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8099fa:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8099fe:	48 99                	cqo    
  809a00:	48 f7 f9             	idiv   rcx
  809a03:	48 89 d0             	mov    rax,rdx
  809a06:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  809a09:	e9 2f 04 00 00       	jmp    809e3d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809a0e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a12:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809a16:	3c 0f                	cmp    al,0xf
  809a18:	0f 84 00 04 00 00    	je     809e1e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809a1e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a22:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a25:	3c e5                	cmp    al,0xe5
  809a27:	0f 84 f4 03 00 00    	je     809e21 <FAT32_readdir+0x5f7>
  809a2d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a31:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a34:	84 c0                	test   al,al
  809a36:	0f 84 e5 03 00 00    	je     809e21 <FAT32_readdir+0x5f7>
  809a3c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a43:	3c 05                	cmp    al,0x5
  809a45:	0f 84 d6 03 00 00    	je     809e21 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  809a4b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809a52:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a56:	48 83 e8 20          	sub    rax,0x20
  809a5a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809a5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a62:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809a66:	3c 0f                	cmp    al,0xf
  809a68:	0f 85 2a 02 00 00    	jne    809c98 <FAT32_readdir+0x46e>
  809a6e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a75:	3c e5                	cmp    al,0xe5
  809a77:	0f 84 1b 02 00 00    	je     809c98 <FAT32_readdir+0x46e>
  809a7d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a84:	84 c0                	test   al,al
  809a86:	0f 84 0c 02 00 00    	je     809c98 <FAT32_readdir+0x46e>
  809a8c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a93:	3c 05                	cmp    al,0x5
  809a95:	0f 84 fd 01 00 00    	je     809c98 <FAT32_readdir+0x46e>
		{
			j = 0;
  809a9b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809aa2:	eb 1a                	jmp    809abe <FAT32_readdir+0x294>
			{
				j++;
  809aa4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  809aa8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809aac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809aaf:	0f b6 c0             	movzx  eax,al
  809ab2:	83 e0 40             	and    eax,0x40
  809ab5:	85 c0                	test   eax,eax
  809ab7:	75 34                	jne    809aed <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809ab9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809abe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ac2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809ac6:	3c 0f                	cmp    al,0xf
  809ac8:	75 24                	jne    809aee <FAT32_readdir+0x2c4>
  809aca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ace:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ad1:	3c e5                	cmp    al,0xe5
  809ad3:	74 19                	je     809aee <FAT32_readdir+0x2c4>
  809ad5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ad9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809adc:	84 c0                	test   al,al
  809ade:	74 0e                	je     809aee <FAT32_readdir+0x2c4>
  809ae0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ae4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ae7:	3c 05                	cmp    al,0x5
  809ae9:	75 b9                	jne    809aa4 <FAT32_readdir+0x27a>
  809aeb:	eb 01                	jmp    809aee <FAT32_readdir+0x2c4>
					break;
  809aed:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  809aee:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809af1:	89 d0                	mov    eax,edx
  809af3:	01 c0                	add    eax,eax
  809af5:	01 d0                	add    eax,edx
  809af7:	c1 e0 02             	shl    eax,0x2
  809afa:	01 d0                	add    eax,edx
  809afc:	83 c0 01             	add    eax,0x1
  809aff:	be 00 00 00 00       	mov    esi,0x0
  809b04:	89 c7                	mov    edi,eax
  809b06:	b8 00 00 00 00       	mov    eax,0x0
  809b0b:	e8 a9 77 ff ff       	call   8012b9 <vmalloc>
  809b10:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809b14:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809b17:	89 d0                	mov    eax,edx
  809b19:	01 c0                	add    eax,eax
  809b1b:	01 d0                	add    eax,edx
  809b1d:	c1 e0 02             	shl    eax,0x2
  809b20:	01 d0                	add    eax,edx
  809b22:	83 c0 01             	add    eax,0x1
  809b25:	89 c2                	mov    edx,eax
  809b27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809b2b:	be 00 00 00 00       	mov    esi,0x0
  809b30:	48 89 c7             	mov    rdi,rax
  809b33:	e8 78 20 00 00       	call   80bbb0 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809b38:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809b3c:	48 83 e8 20          	sub    rax,0x20
  809b40:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809b44:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809b4b:	e9 37 01 00 00       	jmp    809c87 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809b50:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809b57:	eb 53                	jmp    809bac <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809b59:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b5d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b60:	48 63 d2             	movsxd rdx,edx
  809b63:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b68:	66 83 f8 ff          	cmp    ax,0xffff
  809b6c:	74 3a                	je     809ba8 <FAT32_readdir+0x37e>
  809b6e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b72:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b75:	48 63 d2             	movsxd rdx,edx
  809b78:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b7d:	66 85 c0             	test   ax,ax
  809b80:	74 26                	je     809ba8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  809b82:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b86:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b89:	48 63 d2             	movsxd rdx,edx
  809b8c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809b91:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809b94:	8d 50 01             	lea    edx,[rax+0x1]
  809b97:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809b9a:	48 63 d0             	movsxd rdx,eax
  809b9d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ba1:	48 01 d0             	add    rax,rdx
  809ba4:	89 ca                	mov    edx,ecx
  809ba6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  809ba8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809bac:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809bb0:	7e a7                	jle    809b59 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809bb2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809bb9:	eb 53                	jmp    809c0e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809bbb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809bbf:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809bc2:	48 63 d2             	movsxd rdx,edx
  809bc5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809bca:	66 83 f8 ff          	cmp    ax,0xffff
  809bce:	74 3a                	je     809c0a <FAT32_readdir+0x3e0>
  809bd0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809bd4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809bd7:	48 63 d2             	movsxd rdx,edx
  809bda:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809bdf:	66 85 c0             	test   ax,ax
  809be2:	74 26                	je     809c0a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809be4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809be8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809beb:	48 63 d2             	movsxd rdx,edx
  809bee:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809bf3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809bf6:	8d 50 01             	lea    edx,[rax+0x1]
  809bf9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809bfc:	48 63 d0             	movsxd rdx,eax
  809bff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c03:	48 01 d0             	add    rax,rdx
  809c06:	89 ca                	mov    edx,ecx
  809c08:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  809c0a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809c0e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809c12:	7e a7                	jle    809bbb <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809c14:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809c1b:	eb 5b                	jmp    809c78 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809c1d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c21:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809c24:	48 63 d2             	movsxd rdx,edx
  809c27:	48 83 c2 08          	add    rdx,0x8
  809c2b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809c30:	66 83 f8 ff          	cmp    ax,0xffff
  809c34:	74 3e                	je     809c74 <FAT32_readdir+0x44a>
  809c36:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c3a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809c3d:	48 63 d2             	movsxd rdx,edx
  809c40:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809c45:	66 85 c0             	test   ax,ax
  809c48:	74 2a                	je     809c74 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  809c4a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c4e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809c51:	48 63 d2             	movsxd rdx,edx
  809c54:	48 83 c2 08          	add    rdx,0x8
  809c58:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809c5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809c60:	8d 50 01             	lea    edx,[rax+0x1]
  809c63:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809c66:	48 63 d0             	movsxd rdx,eax
  809c69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c6d:	48 01 d0             	add    rax,rdx
  809c70:	89 ca                	mov    edx,ecx
  809c72:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  809c74:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809c78:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  809c7c:	7e 9f                	jle    809c1d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  809c7e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809c82:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  809c87:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809c8a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809c8d:	0f 8c bd fe ff ff    	jl     809b50 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  809c93:	e9 f5 01 00 00       	jmp    809e8d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  809c98:	be 00 00 00 00       	mov    esi,0x0
  809c9d:	bf 0f 00 00 00       	mov    edi,0xf
  809ca2:	b8 00 00 00 00       	mov    eax,0x0
  809ca7:	e8 0d 76 ff ff       	call   8012b9 <vmalloc>
  809cac:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809cb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cb4:	ba 0f 00 00 00       	mov    edx,0xf
  809cb9:	be 00 00 00 00       	mov    esi,0x0
  809cbe:	48 89 c7             	mov    rdi,rax
  809cc1:	e8 ea 1e 00 00       	call   80bbb0 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809cc6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809ccd:	eb 74                	jmp    809d43 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809ccf:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809cd3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809cd6:	48 98                	cdqe   
  809cd8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809cdc:	3c 20                	cmp    al,0x20
  809cde:	74 6b                	je     809d4b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809ce0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809ce4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809ce8:	0f b6 c0             	movzx  eax,al
  809ceb:	83 e0 08             	and    eax,0x8
  809cee:	85 c0                	test   eax,eax
  809cf0:	74 29                	je     809d1b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809cf2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809cf6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809cf9:	48 98                	cdqe   
  809cfb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809cff:	8d 48 20             	lea    ecx,[rax+0x20]
  809d02:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d05:	8d 50 01             	lea    edx,[rax+0x1]
  809d08:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d0b:	48 63 d0             	movsxd rdx,eax
  809d0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d12:	48 01 d0             	add    rax,rdx
  809d15:	89 ca                	mov    edx,ecx
  809d17:	88 10                	mov    BYTE PTR [rax],dl
  809d19:	eb 24                	jmp    809d3f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809d1b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809d1f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809d22:	48 98                	cdqe   
  809d24:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809d28:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d2b:	8d 50 01             	lea    edx,[rax+0x1]
  809d2e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d31:	48 63 d0             	movsxd rdx,eax
  809d34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d38:	48 01 d0             	add    rax,rdx
  809d3b:	89 ca                	mov    edx,ecx
  809d3d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  809d3f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809d43:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809d47:	7e 86                	jle    809ccf <FAT32_readdir+0x4a5>
  809d49:	eb 01                	jmp    809d4c <FAT32_readdir+0x522>
				break;
  809d4b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  809d4c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809d50:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809d54:	0f b6 c0             	movzx  eax,al
  809d57:	83 e0 10             	and    eax,0x10
  809d5a:	85 c0                	test   eax,eax
  809d5c:	0f 85 27 01 00 00    	jne    809e89 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  809d62:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d65:	8d 50 01             	lea    edx,[rax+0x1]
  809d68:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d6b:	48 63 d0             	movsxd rdx,eax
  809d6e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d72:	48 01 d0             	add    rax,rdx
  809d75:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  809d78:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  809d7f:	eb 74                	jmp    809df5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809d81:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809d85:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809d88:	48 98                	cdqe   
  809d8a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d8e:	3c 20                	cmp    al,0x20
  809d90:	74 6b                	je     809dfd <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809d92:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809d96:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809d9a:	0f b6 c0             	movzx  eax,al
  809d9d:	83 e0 10             	and    eax,0x10
  809da0:	85 c0                	test   eax,eax
  809da2:	74 29                	je     809dcd <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809da4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809da8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809dab:	48 98                	cdqe   
  809dad:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809db1:	8d 48 20             	lea    ecx,[rax+0x20]
  809db4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809db7:	8d 50 01             	lea    edx,[rax+0x1]
  809dba:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809dbd:	48 63 d0             	movsxd rdx,eax
  809dc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809dc4:	48 01 d0             	add    rax,rdx
  809dc7:	89 ca                	mov    edx,ecx
  809dc9:	88 10                	mov    BYTE PTR [rax],dl
  809dcb:	eb 24                	jmp    809df1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809dcd:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809dd1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809dd4:	48 98                	cdqe   
  809dd6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809dda:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809ddd:	8d 50 01             	lea    edx,[rax+0x1]
  809de0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809de3:	48 63 d0             	movsxd rdx,eax
  809de6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809dea:	48 01 d0             	add    rax,rdx
  809ded:	89 ca                	mov    edx,ecx
  809def:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  809df1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809df5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  809df9:	7e 86                	jle    809d81 <FAT32_readdir+0x557>
  809dfb:	eb 01                	jmp    809dfe <FAT32_readdir+0x5d4>
				break;
  809dfd:	90                   	nop
		}
		if(x == 8)
  809dfe:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  809e02:	0f 85 84 00 00 00    	jne    809e8c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  809e08:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  809e0c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e0f:	48 63 d0             	movsxd rdx,eax
  809e12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e16:	48 01 d0             	add    rax,rdx
  809e19:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  809e1c:	eb 6e                	jmp    809e8c <FAT32_readdir+0x662>
			continue;
  809e1e:	90                   	nop
  809e1f:	eb 01                	jmp    809e22 <FAT32_readdir+0x5f8>
			continue;
  809e21:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809e22:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  809e26:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  809e2b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809e32:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809e36:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e3a:	48 89 10             	mov    QWORD PTR [rax],rdx
  809e3d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809e40:	48 63 d0             	movsxd rdx,eax
  809e43:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809e47:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809e4b:	48 39 c2             	cmp    rdx,rax
  809e4e:	0f 8c ba fb ff ff    	jl     809a0e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809e54:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809e57:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809e5b:	89 d6                	mov    esi,edx
  809e5d:	48 89 c7             	mov    rdi,rax
  809e60:	e8 b0 ee ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  809e65:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  809e68:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  809e6f:	77 05                	ja     809e76 <FAT32_readdir+0x64c>
		goto next_cluster;
  809e71:	e9 d5 fa ff ff       	jmp    80994b <FAT32_readdir+0x121>

	vmfree(buf);
  809e76:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809e7a:	48 89 c7             	mov    rdi,rax
  809e7d:	e8 c6 74 ff ff       	call   801348 <vmfree>
	return NULL;
  809e82:	b8 00 00 00 00       	mov    eax,0x0
  809e87:	eb 3b                	jmp    809ec4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  809e89:	90                   	nop
  809e8a:	eb 01                	jmp    809e8d <FAT32_readdir+0x663>
		goto find_lookup_success;
  809e8c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  809e8d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809e94:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809e98:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e9c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  809e9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809ea2:	48 63 d0             	movsxd rdx,eax
  809ea5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  809ea9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809ead:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  809eb1:	41 b8 00 00 00 00    	mov    r8d,0x0
  809eb7:	b9 00 00 00 00       	mov    ecx,0x0
  809ebc:	48 89 c7             	mov    rdi,rax
  809ebf:	41 ff d1             	call   r9
  809ec2:	48 98                	cdqe   
}
  809ec4:	c9                   	leave  
  809ec5:	c3                   	ret    

0000000000809ec6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809ec6:	f3 0f 1e fa          	endbr64 
  809eca:	55                   	push   rbp
  809ecb:	48 89 e5             	mov    rbp,rsp
  809ece:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809ed2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809ed6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809ed9:	90                   	nop
  809eda:	5d                   	pop    rbp
  809edb:	c3                   	ret    

0000000000809edc <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  809edc:	f3 0f 1e fa          	endbr64 
  809ee0:	55                   	push   rbp
  809ee1:	48 89 e5             	mov    rbp,rsp
  809ee4:	48 83 ec 60          	sub    rsp,0x60
  809ee8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  809eec:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  809ef0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809ef4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ef8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  809efc:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809f00:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809f04:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f08:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  809f0c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809f13:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809f1a:	00 
	unsigned char * buf =NULL; 
  809f1b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  809f22:	00 
	int i = 0,j = 0,x = 0;
  809f23:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809f2a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809f31:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809f38:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809f3f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809f40:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809f47:	00 
	struct index_node * p = NULL;
  809f48:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  809f4f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809f50:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f54:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809f58:	be 00 00 00 00       	mov    esi,0x0
  809f5d:	48 89 c7             	mov    rdi,rax
  809f60:	b8 00 00 00 00       	mov    eax,0x0
  809f65:	e8 4f 73 ff ff       	call   8012b9 <vmalloc>
  809f6a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  809f6e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809f72:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809f75:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809f78:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f7c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809f80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809f83:	83 e8 02             	sub    eax,0x2
  809f86:	89 c1                	mov    ecx,eax
  809f88:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f8c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f90:	48 0f af c1          	imul   rax,rcx
  809f94:	48 01 d0             	add    rax,rdx
  809f97:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  809f9b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809f9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809fa2:	89 c6                	mov    esi,eax
  809fa4:	bf 70 46 81 00       	mov    edi,0x814670
  809fa9:	b8 00 00 00 00       	mov    eax,0x0
  809fae:	e8 74 6d ff ff       	call   800d27 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809fb3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809fb7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809fbb:	89 c1                	mov    ecx,eax
  809fbd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809fc1:	89 c2                	mov    edx,eax
  809fc3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809fc7:	49 89 c0             	mov    r8,rax
  809fca:	be 00 00 00 00       	mov    esi,0x0
  809fcf:	bf 00 00 00 00       	mov    edi,0x0
  809fd4:	e8 a8 e0 ff ff       	call   808081 <request>
  809fd9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  809fdc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  809fdf:	89 c7                	mov    edi,eax
  809fe1:	e8 4f e7 ff ff       	call   808735 <chk_result>
  809fe6:	85 c0                	test   eax,eax
  809fe8:	75 25                	jne    80a00f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  809fea:	bf 98 46 81 00       	mov    edi,0x814698
  809fef:	b8 00 00 00 00       	mov    eax,0x0
  809ff4:	e8 2e 6d ff ff       	call   800d27 <printf>
		vmfree(buf);
  809ff9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809ffd:	48 89 c7             	mov    rdi,rax
  80a000:	e8 43 73 ff ff       	call   801348 <vmfree>
		return NULL;
  80a005:	b8 00 00 00 00       	mov    eax,0x0
  80a00a:	e9 f0 07 00 00       	jmp    80a7ff <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80a00f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a013:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a017:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a01e:	e9 9d 05 00 00       	jmp    80a5c0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80a023:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a027:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a02b:	3c 0f                	cmp    al,0xf
  80a02d:	0f 84 59 05 00 00    	je     80a58c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80a033:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a037:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a03a:	3c e5                	cmp    al,0xe5
  80a03c:	0f 84 4d 05 00 00    	je     80a58f <FAT32_lookup+0x6b3>
  80a042:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a046:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a049:	84 c0                	test   al,al
  80a04b:	0f 84 3e 05 00 00    	je     80a58f <FAT32_lookup+0x6b3>
  80a051:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a055:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a058:	3c 05                	cmp    al,0x5
  80a05a:	0f 84 2f 05 00 00    	je     80a58f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a060:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a064:	48 83 e8 20          	sub    rax,0x20
  80a068:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80a06c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a073:	e9 88 01 00 00       	jmp    80a200 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80a078:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a07f:	eb 6a                	jmp    80a0eb <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80a081:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a085:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a088:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a08b:	7e 15                	jle    80a0a2 <FAT32_lookup+0x1c6>
  80a08d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a091:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a094:	48 63 d2             	movsxd rdx,edx
  80a097:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a09c:	66 83 f8 ff          	cmp    ax,0xffff
  80a0a0:	74 44                	je     80a0e6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80a0a2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0a6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a0a9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a0ac:	0f 8f e0 04 00 00    	jg     80a592 <FAT32_lookup+0x6b6>
  80a0b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a0b6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a0b9:	48 63 d2             	movsxd rdx,edx
  80a0bc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a0c1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0c5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a0c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0cb:	8d 50 01             	lea    edx,[rax+0x1]
  80a0ce:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a0d1:	48 98                	cdqe   
  80a0d3:	48 01 f0             	add    rax,rsi
  80a0d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0d9:	66 98                	cbw    
  80a0db:	66 39 c1             	cmp    cx,ax
  80a0de:	0f 85 ae 04 00 00    	jne    80a592 <FAT32_lookup+0x6b6>
  80a0e4:	eb 01                	jmp    80a0e7 <FAT32_lookup+0x20b>
					continue;
  80a0e6:	90                   	nop
			for(x=0;x<5;x++)
  80a0e7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a0eb:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80a0ef:	7e 90                	jle    80a081 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80a0f1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a0f8:	eb 6a                	jmp    80a164 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80a0fa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0fe:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a101:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a104:	7e 15                	jle    80a11b <FAT32_lookup+0x23f>
  80a106:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a10a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a10d:	48 63 d2             	movsxd rdx,edx
  80a110:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a115:	66 83 f8 ff          	cmp    ax,0xffff
  80a119:	74 44                	je     80a15f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80a11b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a11f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a122:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a125:	0f 8f 6a 04 00 00    	jg     80a595 <FAT32_lookup+0x6b9>
  80a12b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a12f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a132:	48 63 d2             	movsxd rdx,edx
  80a135:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a13a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a13e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a141:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a144:	8d 50 01             	lea    edx,[rax+0x1]
  80a147:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a14a:	48 98                	cdqe   
  80a14c:	48 01 f0             	add    rax,rsi
  80a14f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a152:	66 98                	cbw    
  80a154:	66 39 c1             	cmp    cx,ax
  80a157:	0f 85 38 04 00 00    	jne    80a595 <FAT32_lookup+0x6b9>
  80a15d:	eb 01                	jmp    80a160 <FAT32_lookup+0x284>
					continue;
  80a15f:	90                   	nop
			for(x=0;x<6;x++)
  80a160:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a164:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80a168:	7e 90                	jle    80a0fa <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80a16a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a171:	eb 72                	jmp    80a1e5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80a173:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a177:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a17a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a17d:	7e 19                	jle    80a198 <FAT32_lookup+0x2bc>
  80a17f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a183:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a186:	48 63 d2             	movsxd rdx,edx
  80a189:	48 83 c2 08          	add    rdx,0x8
  80a18d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a192:	66 83 f8 ff          	cmp    ax,0xffff
  80a196:	74 48                	je     80a1e0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80a198:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a19c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a19f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a1a2:	0f 8f f0 03 00 00    	jg     80a598 <FAT32_lookup+0x6bc>
  80a1a8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a1ac:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a1af:	48 63 d2             	movsxd rdx,edx
  80a1b2:	48 83 c2 08          	add    rdx,0x8
  80a1b6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a1bb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a1bf:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a1c2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a1c5:	8d 50 01             	lea    edx,[rax+0x1]
  80a1c8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a1cb:	48 98                	cdqe   
  80a1cd:	48 01 f0             	add    rax,rsi
  80a1d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1d3:	66 98                	cbw    
  80a1d5:	66 39 c1             	cmp    cx,ax
  80a1d8:	0f 85 ba 03 00 00    	jne    80a598 <FAT32_lookup+0x6bc>
  80a1de:	eb 01                	jmp    80a1e1 <FAT32_lookup+0x305>
					continue;
  80a1e0:	90                   	nop
			for(x=0;x<2;x++)
  80a1e1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a1e5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80a1e9:	7e 88                	jle    80a173 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80a1eb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a1ef:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a1f2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a1f5:	0f 8d 14 04 00 00    	jge    80a60f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80a1fb:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a200:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a204:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a208:	3c 0f                	cmp    al,0xf
  80a20a:	75 0f                	jne    80a21b <FAT32_lookup+0x33f>
  80a20c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a210:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a213:	3c e5                	cmp    al,0xe5
  80a215:	0f 85 5d fe ff ff    	jne    80a078 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80a21b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80a222:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a229:	e9 f4 01 00 00       	jmp    80a422 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80a22e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a232:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a235:	48 98                	cdqe   
  80a237:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a23b:	0f b6 c0             	movzx  eax,al
  80a23e:	83 f8 7a             	cmp    eax,0x7a
  80a241:	0f 8f d0 01 00 00    	jg     80a417 <FAT32_lookup+0x53b>
  80a247:	83 f8 61             	cmp    eax,0x61
  80a24a:	0f 8d e6 00 00 00    	jge    80a336 <FAT32_lookup+0x45a>
  80a250:	83 f8 5a             	cmp    eax,0x5a
  80a253:	0f 8f be 01 00 00    	jg     80a417 <FAT32_lookup+0x53b>
  80a259:	83 f8 41             	cmp    eax,0x41
  80a25c:	0f 8d d4 00 00 00    	jge    80a336 <FAT32_lookup+0x45a>
  80a262:	83 f8 20             	cmp    eax,0x20
  80a265:	74 1a                	je     80a281 <FAT32_lookup+0x3a5>
  80a267:	83 f8 20             	cmp    eax,0x20
  80a26a:	0f 8c a7 01 00 00    	jl     80a417 <FAT32_lookup+0x53b>
  80a270:	83 e8 30             	sub    eax,0x30
  80a273:	83 f8 09             	cmp    eax,0x9
  80a276:	0f 87 9b 01 00 00    	ja     80a417 <FAT32_lookup+0x53b>
  80a27c:	e9 53 01 00 00       	jmp    80a3d4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a281:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a285:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a289:	0f b6 c0             	movzx  eax,al
  80a28c:	83 e0 10             	and    eax,0x10
  80a28f:	85 c0                	test   eax,eax
  80a291:	75 50                	jne    80a2e3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80a293:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a297:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a29a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a29d:	48 98                	cdqe   
  80a29f:	48 01 d0             	add    rax,rdx
  80a2a2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2a5:	3c 2e                	cmp    al,0x2e
  80a2a7:	0f 84 70 01 00 00    	je     80a41d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a2ad:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a2b1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a2b4:	48 98                	cdqe   
  80a2b6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a2ba:	0f b6 d0             	movzx  edx,al
  80a2bd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2c1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a2c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a2c7:	48 98                	cdqe   
  80a2c9:	48 01 c8             	add    rax,rcx
  80a2cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2cf:	0f be c0             	movsx  eax,al
  80a2d2:	39 c2                	cmp    edx,eax
  80a2d4:	0f 85 c1 02 00 00    	jne    80a59b <FAT32_lookup+0x6bf>
						{
							j++;
  80a2da:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a2de:	e9 3b 01 00 00       	jmp    80a41e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a2e3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2e7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2ea:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2ed:	7d 32                	jge    80a321 <FAT32_lookup+0x445>
  80a2ef:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a2f3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a2f6:	48 98                	cdqe   
  80a2f8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a2fc:	0f b6 d0             	movzx  edx,al
  80a2ff:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a303:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a306:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a309:	48 98                	cdqe   
  80a30b:	48 01 c8             	add    rax,rcx
  80a30e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a311:	0f be c0             	movsx  eax,al
  80a314:	39 c2                	cmp    edx,eax
  80a316:	75 09                	jne    80a321 <FAT32_lookup+0x445>
						{
							j++;
  80a318:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a31c:	e9 fd 00 00 00       	jmp    80a41e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80a321:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a325:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a328:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a32b:	0f 85 6d 02 00 00    	jne    80a59e <FAT32_lookup+0x6c2>
							continue;
  80a331:	e9 e8 00 00 00       	jmp    80a41e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80a336:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a33a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a33e:	0f b6 c0             	movzx  eax,al
  80a341:	83 e0 08             	and    eax,0x8
  80a344:	85 c0                	test   eax,eax
  80a346:	74 49                	je     80a391 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a348:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a34c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a34f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a352:	0f 8d 49 02 00 00    	jge    80a5a1 <FAT32_lookup+0x6c5>
  80a358:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a35c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a35f:	48 98                	cdqe   
  80a361:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a365:	0f b6 c0             	movzx  eax,al
  80a368:	8d 50 20             	lea    edx,[rax+0x20]
  80a36b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a36f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a372:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a375:	48 98                	cdqe   
  80a377:	48 01 c8             	add    rax,rcx
  80a37a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a37d:	0f be c0             	movsx  eax,al
  80a380:	39 c2                	cmp    edx,eax
  80a382:	0f 85 19 02 00 00    	jne    80a5a1 <FAT32_lookup+0x6c5>
						{
							j++;
  80a388:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a38c:	e9 8d 00 00 00       	jmp    80a41e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a391:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a395:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a398:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a39b:	0f 8d 03 02 00 00    	jge    80a5a4 <FAT32_lookup+0x6c8>
  80a3a1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a3a5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a3a8:	48 98                	cdqe   
  80a3aa:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a3ae:	0f b6 d0             	movzx  edx,al
  80a3b1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3b5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a3b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a3bb:	48 98                	cdqe   
  80a3bd:	48 01 c8             	add    rax,rcx
  80a3c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a3c3:	0f be c0             	movsx  eax,al
  80a3c6:	39 c2                	cmp    edx,eax
  80a3c8:	0f 85 d6 01 00 00    	jne    80a5a4 <FAT32_lookup+0x6c8>
						{
							j++;
  80a3ce:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a3d2:	eb 4a                	jmp    80a41e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a3d4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3d8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a3db:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a3de:	0f 8d c3 01 00 00    	jge    80a5a7 <FAT32_lookup+0x6cb>
  80a3e4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a3e8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a3eb:	48 98                	cdqe   
  80a3ed:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a3f1:	0f b6 d0             	movzx  edx,al
  80a3f4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3f8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a3fb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a3fe:	48 98                	cdqe   
  80a400:	48 01 c8             	add    rax,rcx
  80a403:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a406:	0f be c0             	movsx  eax,al
  80a409:	39 c2                	cmp    edx,eax
  80a40b:	0f 85 96 01 00 00    	jne    80a5a7 <FAT32_lookup+0x6cb>
					{
						j++;
  80a411:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80a415:	eb 07                	jmp    80a41e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80a417:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80a41b:	eb 01                	jmp    80a41e <FAT32_lookup+0x542>
							continue;
  80a41d:	90                   	nop
		for(x=0;x<8;x++)
  80a41e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a422:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80a426:	0f 8e 02 fe ff ff    	jle    80a22e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a42c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a430:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a434:	0f b6 c0             	movzx  eax,al
  80a437:	83 e0 10             	and    eax,0x10
  80a43a:	85 c0                	test   eax,eax
  80a43c:	0f 85 d0 01 00 00    	jne    80a612 <FAT32_lookup+0x736>
		{
			j++;
  80a442:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80a446:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80a44d:	e9 2b 01 00 00       	jmp    80a57d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80a452:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a456:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a459:	48 98                	cdqe   
  80a45b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a45f:	0f b6 c0             	movzx  eax,al
  80a462:	83 f8 7a             	cmp    eax,0x7a
  80a465:	0f 8f 3f 01 00 00    	jg     80a5aa <FAT32_lookup+0x6ce>
  80a46b:	83 f8 61             	cmp    eax,0x61
  80a46e:	7d 2e                	jge    80a49e <FAT32_lookup+0x5c2>
  80a470:	83 f8 5a             	cmp    eax,0x5a
  80a473:	0f 8f 31 01 00 00    	jg     80a5aa <FAT32_lookup+0x6ce>
  80a479:	83 f8 41             	cmp    eax,0x41
  80a47c:	7d 20                	jge    80a49e <FAT32_lookup+0x5c2>
  80a47e:	83 f8 20             	cmp    eax,0x20
  80a481:	0f 84 c4 00 00 00    	je     80a54b <FAT32_lookup+0x66f>
  80a487:	83 f8 20             	cmp    eax,0x20
  80a48a:	0f 8c 1a 01 00 00    	jl     80a5aa <FAT32_lookup+0x6ce>
  80a490:	83 e8 30             	sub    eax,0x30
  80a493:	83 f8 09             	cmp    eax,0x9
  80a496:	0f 87 0e 01 00 00    	ja     80a5aa <FAT32_lookup+0x6ce>
  80a49c:	eb 7e                	jmp    80a51c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80a49e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4a2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a4a6:	0f b6 c0             	movzx  eax,al
  80a4a9:	83 e0 10             	and    eax,0x10
  80a4ac:	85 c0                	test   eax,eax
  80a4ae:	74 39                	je     80a4e9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a4b0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4b4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4b7:	48 98                	cdqe   
  80a4b9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4bd:	0f b6 c0             	movzx  eax,al
  80a4c0:	8d 50 20             	lea    edx,[rax+0x20]
  80a4c3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4c7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a4ca:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4cd:	48 98                	cdqe   
  80a4cf:	48 01 c8             	add    rax,rcx
  80a4d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4d5:	0f be c0             	movsx  eax,al
  80a4d8:	39 c2                	cmp    edx,eax
  80a4da:	0f 85 cd 00 00 00    	jne    80a5ad <FAT32_lookup+0x6d1>
							{
								j++;
  80a4e0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a4e4:	e9 90 00 00 00       	jmp    80a579 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4e9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4ed:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4f0:	48 98                	cdqe   
  80a4f2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4f6:	0f b6 d0             	movzx  edx,al
  80a4f9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4fd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a500:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a503:	48 98                	cdqe   
  80a505:	48 01 c8             	add    rax,rcx
  80a508:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a50b:	0f be c0             	movsx  eax,al
  80a50e:	39 c2                	cmp    edx,eax
  80a510:	0f 85 9a 00 00 00    	jne    80a5b0 <FAT32_lookup+0x6d4>
							{
								j++;
  80a516:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a51a:	eb 5d                	jmp    80a579 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a51c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a520:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a523:	48 98                	cdqe   
  80a525:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a529:	0f b6 d0             	movzx  edx,al
  80a52c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a530:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a533:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a536:	48 98                	cdqe   
  80a538:	48 01 c8             	add    rax,rcx
  80a53b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a53e:	0f be c0             	movsx  eax,al
  80a541:	39 c2                	cmp    edx,eax
  80a543:	75 6e                	jne    80a5b3 <FAT32_lookup+0x6d7>
						{
							j++;
  80a545:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a549:	eb 2e                	jmp    80a579 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a54b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a54f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a552:	48 98                	cdqe   
  80a554:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a558:	0f b6 d0             	movzx  edx,al
  80a55b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a55f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a562:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a565:	48 98                	cdqe   
  80a567:	48 01 c8             	add    rax,rcx
  80a56a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a56d:	0f be c0             	movsx  eax,al
  80a570:	39 c2                	cmp    edx,eax
  80a572:	75 42                	jne    80a5b6 <FAT32_lookup+0x6da>
						{
							j++;
  80a574:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a578:	90                   	nop
			for(x=8;x<11;x++)
  80a579:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a57d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a581:	0f 8e cb fe ff ff    	jle    80a452 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a587:	e9 86 00 00 00       	jmp    80a612 <FAT32_lookup+0x736>
			continue;
  80a58c:	90                   	nop
  80a58d:	eb 28                	jmp    80a5b7 <FAT32_lookup+0x6db>
			continue;
  80a58f:	90                   	nop
  80a590:	eb 25                	jmp    80a5b7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a592:	90                   	nop
  80a593:	eb 22                	jmp    80a5b7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a595:	90                   	nop
  80a596:	eb 1f                	jmp    80a5b7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a598:	90                   	nop
  80a599:	eb 1c                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a59b:	90                   	nop
  80a59c:	eb 19                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a59e:	90                   	nop
  80a59f:	eb 16                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a5a1:	90                   	nop
  80a5a2:	eb 13                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a5a4:	90                   	nop
  80a5a5:	eb 10                	jmp    80a5b7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a5a7:	90                   	nop
  80a5a8:	eb 0d                	jmp    80a5b7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a5aa:	90                   	nop
  80a5ab:	eb 0a                	jmp    80a5b7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a5ad:	90                   	nop
  80a5ae:	eb 07                	jmp    80a5b7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a5b0:	90                   	nop
  80a5b1:	eb 04                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a5b3:	90                   	nop
  80a5b4:	eb 01                	jmp    80a5b7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a5b6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a5b7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a5bb:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a5c0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a5c3:	48 63 d0             	movsxd rdx,eax
  80a5c6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a5ca:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a5ce:	48 39 c2             	cmp    rdx,rax
  80a5d1:	0f 8c 4c fa ff ff    	jl     80a023 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a5d7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a5da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a5de:	89 d6                	mov    esi,edx
  80a5e0:	48 89 c7             	mov    rdi,rax
  80a5e3:	e8 2d e7 ff ff       	call   808d15 <DISK1_FAT32_read_FAT_Entry>
  80a5e8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a5eb:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a5f2:	77 05                	ja     80a5f9 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a5f4:	e9 7f f9 ff ff       	jmp    809f78 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a5f9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a5fd:	48 89 c7             	mov    rdi,rax
  80a600:	e8 43 6d ff ff       	call   801348 <vmfree>
	return NULL;
  80a605:	b8 00 00 00 00       	mov    eax,0x0
  80a60a:	e9 f0 01 00 00       	jmp    80a7ff <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a60f:	90                   	nop
  80a610:	eb 01                	jmp    80a613 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a612:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a613:	be 00 00 00 00       	mov    esi,0x0
  80a618:	bf 38 00 00 00       	mov    edi,0x38
  80a61d:	b8 00 00 00 00       	mov    eax,0x0
  80a622:	e8 92 6c ff ff       	call   8012b9 <vmalloc>
  80a627:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a62b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a62f:	ba 38 00 00 00       	mov    edx,0x38
  80a634:	be 00 00 00 00       	mov    esi,0x0
  80a639:	48 89 c7             	mov    rdi,rax
  80a63c:	e8 6f 15 00 00       	call   80bbb0 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a641:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a645:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a648:	89 c2                	mov    edx,eax
  80a64a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a64e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a651:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a655:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a658:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a65c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a660:	48 01 d0             	add    rax,rdx
  80a663:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a667:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a66b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a66f:	48 89 c1             	mov    rcx,rax
  80a672:	48 89 d0             	mov    rax,rdx
  80a675:	ba 00 00 00 00       	mov    edx,0x0
  80a67a:	48 f7 f1             	div    rcx
  80a67d:	48 89 c2             	mov    rdx,rax
  80a680:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a684:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a68c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a690:	0f b6 c0             	movzx  eax,al
  80a693:	83 e0 10             	and    eax,0x10
  80a696:	85 c0                	test   eax,eax
  80a698:	74 07                	je     80a6a1 <FAT32_lookup+0x7c5>
  80a69a:	ba 02 00 00 00       	mov    edx,0x2
  80a69f:	eb 05                	jmp    80a6a6 <FAT32_lookup+0x7ca>
  80a6a1:	ba 01 00 00 00       	mov    edx,0x1
  80a6a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6aa:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a6ae:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a6b2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a6b6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6ba:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a6be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6c2:	48 c7 40 20 e0 c6 80 	mov    QWORD PTR [rax+0x20],0x80c6e0
  80a6c9:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a6ca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6ce:	48 c7 40 28 20 c7 80 	mov    QWORD PTR [rax+0x28],0x80c720
  80a6d5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a6d6:	be 00 00 00 00       	mov    esi,0x0
  80a6db:	bf 20 00 00 00       	mov    edi,0x20
  80a6e0:	b8 00 00 00 00       	mov    eax,0x0
  80a6e5:	e8 cf 6b ff ff       	call   8012b9 <vmalloc>
  80a6ea:	48 89 c2             	mov    rdx,rax
  80a6ed:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6f1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a6f5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6f9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a6fd:	ba 20 00 00 00       	mov    edx,0x20
  80a702:	be 00 00 00 00       	mov    esi,0x0
  80a707:	48 89 c7             	mov    rdi,rax
  80a70a:	e8 a1 14 00 00       	call   80bbb0 <memset>
	finode = p->private_index_info;
  80a70f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a713:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a717:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a71b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a71f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a723:	0f b7 c0             	movzx  eax,ax
  80a726:	c1 e0 10             	shl    eax,0x10
  80a729:	89 c2                	mov    edx,eax
  80a72b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a72f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a733:	0f b7 c0             	movzx  eax,ax
  80a736:	09 d0                	or     eax,edx
  80a738:	48 98                	cdqe   
  80a73a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a73f:	48 89 c2             	mov    rdx,rax
  80a742:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a746:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a749:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a74c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a750:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a754:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a758:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a75c:	48 c1 f8 05          	sar    rax,0x5
  80a760:	48 89 c2             	mov    rdx,rax
  80a763:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a767:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a76b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a76f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a773:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a777:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a77b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a77f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a783:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a787:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a78b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a78f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a793:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a797:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a79b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a79f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a7a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a7a7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a7ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7af:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a7b3:	66 c1 e8 0c          	shr    ax,0xc
  80a7b7:	66 85 c0             	test   ax,ax
  80a7ba:	74 27                	je     80a7e3 <FAT32_lookup+0x907>
  80a7bc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a7c0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a7c4:	83 e0 01             	and    eax,0x1
  80a7c7:	48 85 c0             	test   rax,rax
  80a7ca:	74 17                	je     80a7e3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a7cc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a7d0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a7d4:	48 83 c8 04          	or     rax,0x4
  80a7d8:	48 89 c2             	mov    rdx,rax
  80a7db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a7df:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a7e3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a7e7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a7eb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a7ef:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a7f3:	48 89 c7             	mov    rdi,rax
  80a7f6:	e8 4d 6b ff ff       	call   801348 <vmfree>
	return dest_dentry;	
  80a7fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80a7ff:	c9                   	leave  
  80a800:	c3                   	ret    

000000000080a801 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a801:	f3 0f 1e fa          	endbr64 
  80a805:	55                   	push   rbp
  80a806:	48 89 e5             	mov    rbp,rsp
  80a809:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a80d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a811:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a814:	90                   	nop
  80a815:	5d                   	pop    rbp
  80a816:	c3                   	ret    

000000000080a817 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80a817:	f3 0f 1e fa          	endbr64 
  80a81b:	55                   	push   rbp
  80a81c:	48 89 e5             	mov    rbp,rsp
  80a81f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a823:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a827:	90                   	nop
  80a828:	5d                   	pop    rbp
  80a829:	c3                   	ret    

000000000080a82a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80a82a:	f3 0f 1e fa          	endbr64 
  80a82e:	55                   	push   rbp
  80a82f:	48 89 e5             	mov    rbp,rsp
  80a832:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a836:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a83a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a83e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a842:	90                   	nop
  80a843:	5d                   	pop    rbp
  80a844:	c3                   	ret    

000000000080a845 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a845:	f3 0f 1e fa          	endbr64 
  80a849:	55                   	push   rbp
  80a84a:	48 89 e5             	mov    rbp,rsp
  80a84d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a851:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a855:	90                   	nop
  80a856:	5d                   	pop    rbp
  80a857:	c3                   	ret    

000000000080a858 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a858:	f3 0f 1e fa          	endbr64 
  80a85c:	55                   	push   rbp
  80a85d:	48 89 e5             	mov    rbp,rsp
  80a860:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a864:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a868:	90                   	nop
  80a869:	5d                   	pop    rbp
  80a86a:	c3                   	ret    

000000000080a86b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80a86b:	f3 0f 1e fa          	endbr64 
  80a86f:	55                   	push   rbp
  80a870:	48 89 e5             	mov    rbp,rsp
  80a873:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a877:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a87b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a87f:	90                   	nop
  80a880:	5d                   	pop    rbp
  80a881:	c3                   	ret    

000000000080a882 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80a882:	f3 0f 1e fa          	endbr64 
  80a886:	55                   	push   rbp
  80a887:	48 89 e5             	mov    rbp,rsp
  80a88a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a88e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a892:	90                   	nop
  80a893:	5d                   	pop    rbp
  80a894:	c3                   	ret    

000000000080a895 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80a895:	f3 0f 1e fa          	endbr64 
  80a899:	55                   	push   rbp
  80a89a:	48 89 e5             	mov    rbp,rsp
  80a89d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a8a1:	90                   	nop
  80a8a2:	5d                   	pop    rbp
  80a8a3:	c3                   	ret    

000000000080a8a4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80a8a4:	f3 0f 1e fa          	endbr64 
  80a8a8:	55                   	push   rbp
  80a8a9:	48 89 e5             	mov    rbp,rsp
  80a8ac:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a8b0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a8b4:	90                   	nop
  80a8b5:	5d                   	pop    rbp
  80a8b6:	c3                   	ret    

000000000080a8b7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80a8b7:	f3 0f 1e fa          	endbr64 
  80a8bb:	55                   	push   rbp
  80a8bc:	48 89 e5             	mov    rbp,rsp
  80a8bf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a8c3:	90                   	nop
  80a8c4:	5d                   	pop    rbp
  80a8c5:	c3                   	ret    

000000000080a8c6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80a8c6:	f3 0f 1e fa          	endbr64 
  80a8ca:	55                   	push   rbp
  80a8cb:	48 89 e5             	mov    rbp,rsp
  80a8ce:	48 83 ec 10          	sub    rsp,0x10
  80a8d2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80a8d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a8de:	48 89 c7             	mov    rdi,rax
  80a8e1:	e8 62 6a ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80a8e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8ed:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a8f1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a8f5:	48 89 c7             	mov    rdi,rax
  80a8f8:	e8 4b 6a ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode);
  80a8fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a901:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a904:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a908:	48 89 c7             	mov    rdi,rax
  80a90b:	e8 38 6a ff ff       	call   801348 <vmfree>
	vmfree(sb->root);
  80a910:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a914:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a917:	48 89 c7             	mov    rdi,rax
  80a91a:	e8 29 6a ff ff       	call   801348 <vmfree>
	vmfree(sb);
  80a91f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a923:	48 89 c7             	mov    rdi,rax
  80a926:	e8 1d 6a ff ff       	call   801348 <vmfree>
}
  80a92b:	90                   	nop
  80a92c:	c9                   	leave  
  80a92d:	c3                   	ret    

000000000080a92e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80a92e:	f3 0f 1e fa          	endbr64 
  80a932:	55                   	push   rbp
  80a933:	48 89 e5             	mov    rbp,rsp
  80a936:	48 83 ec 40          	sub    rsp,0x40
  80a93a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80a93e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a945:	00 
	struct FAT32_Directory * buf = NULL;
  80a946:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a94d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80a94e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a952:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a956:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80a95a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a95e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a962:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a966:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80a96a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a971:	00 

	if(finode->dentry_location == 0)
  80a972:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a976:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a97a:	48 85 c0             	test   rax,rax
  80a97d:	75 14                	jne    80a993 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80a97f:	bf c4 46 81 00       	mov    edi,0x8146c4
  80a984:	b8 00 00 00 00       	mov    eax,0x0
  80a989:	e8 99 63 ff ff       	call   800d27 <printf>
		return ;
  80a98e:	e9 30 01 00 00       	jmp    80aac3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80a993:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a997:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a99b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a99f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a9a3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a9a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9ab:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9af:	48 0f af c2          	imul   rax,rdx
  80a9b3:	48 01 c8             	add    rax,rcx
  80a9b6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80a9ba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9be:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a9c2:	be 00 00 00 00       	mov    esi,0x0
  80a9c7:	48 89 c7             	mov    rdi,rax
  80a9ca:	b8 00 00 00 00       	mov    eax,0x0
  80a9cf:	e8 e5 68 ff ff       	call   8012b9 <vmalloc>
  80a9d4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80a9d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9dc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a9e0:	89 c2                	mov    edx,eax
  80a9e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a9e6:	be 00 00 00 00       	mov    esi,0x0
  80a9eb:	48 89 c7             	mov    rdi,rax
  80a9ee:	e8 bd 11 00 00       	call   80bbb0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a9f3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9f7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9fb:	89 c1                	mov    ecx,eax
  80a9fd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80aa01:	89 c2                	mov    edx,eax
  80aa03:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa07:	49 89 c0             	mov    r8,rax
  80aa0a:	be 00 00 00 00       	mov    esi,0x0
  80aa0f:	bf 00 00 00 00       	mov    edi,0x0
  80aa14:	e8 68 d6 ff ff       	call   808081 <request>
  80aa19:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80aa1c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80aa1f:	89 c7                	mov    edi,eax
  80aa21:	e8 0f dd ff ff       	call   808735 <chk_result>
    fdentry = buf+finode->dentry_position;
  80aa26:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa2a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa2e:	48 c1 e0 05          	shl    rax,0x5
  80aa32:	48 89 c2             	mov    rdx,rax
  80aa35:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa39:	48 01 d0             	add    rax,rdx
  80aa3c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80aa40:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80aa44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa47:	89 c2                	mov    edx,eax
  80aa49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa4d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80aa50:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa57:	89 c2                	mov    edx,eax
  80aa59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa5d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80aa61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa65:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80aa69:	66 25 00 f0          	and    ax,0xf000
  80aa6d:	89 c2                	mov    edx,eax
  80aa6f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa73:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa76:	48 c1 e8 10          	shr    rax,0x10
  80aa7a:	09 c2                	or     edx,eax
  80aa7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa80:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80aa84:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa88:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa8c:	89 c1                	mov    ecx,eax
  80aa8e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80aa92:	89 c2                	mov    edx,eax
  80aa94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa98:	49 89 c0             	mov    r8,rax
  80aa9b:	be 01 00 00 00       	mov    esi,0x1
  80aaa0:	bf 00 00 00 00       	mov    edi,0x0
  80aaa5:	e8 d7 d5 ff ff       	call   808081 <request>
  80aaaa:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80aaad:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80aab0:	89 c7                	mov    edi,eax
  80aab2:	e8 7e dc ff ff       	call   808735 <chk_result>
	vmfree(buf);
  80aab7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aabb:	48 89 c7             	mov    rdi,rax
  80aabe:	e8 85 68 ff ff       	call   801348 <vmfree>
}
  80aac3:	c9                   	leave  
  80aac4:	c3                   	ret    

000000000080aac5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80aac5:	f3 0f 1e fa          	endbr64 
  80aac9:	55                   	push   rbp
  80aaca:	48 89 e5             	mov    rbp,rsp
  80aacd:	48 83 ec 50          	sub    rsp,0x50
  80aad1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80aad5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80aad9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80aae0:	00 
	struct FAT32_inode_info * finode = NULL;
  80aae1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aae8:	00 
	struct FAT32_BootSector * fbs = NULL;
  80aae9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80aaf0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80aaf1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80aaf8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80aaf9:	be 00 00 00 00       	mov    esi,0x0
  80aafe:	bf 18 00 00 00       	mov    edi,0x18
  80ab03:	b8 00 00 00 00       	mov    eax,0x0
  80ab08:	e8 ac 67 ff ff       	call   8012b9 <vmalloc>
  80ab0d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80ab11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab15:	ba 18 00 00 00       	mov    edx,0x18
  80ab1a:	be 00 00 00 00       	mov    esi,0x0
  80ab1f:	48 89 c7             	mov    rdi,rax
  80ab22:	e8 89 10 00 00       	call   80bbb0 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80ab27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab2b:	48 c7 40 08 80 c7 80 	mov    QWORD PTR [rax+0x8],0x80c780
  80ab32:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80ab33:	be 00 00 00 00       	mov    esi,0x0
  80ab38:	bf 60 00 00 00       	mov    edi,0x60
  80ab3d:	b8 00 00 00 00       	mov    eax,0x0
  80ab42:	e8 72 67 ff ff       	call   8012b9 <vmalloc>
  80ab47:	48 89 c2             	mov    rdx,rax
  80ab4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab4e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80ab52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab56:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab5a:	ba 60 00 00 00       	mov    edx,0x60
  80ab5f:	be 00 00 00 00       	mov    esi,0x0
  80ab64:	48 89 c7             	mov    rdi,rax
  80ab67:	e8 44 10 00 00       	call   80bbb0 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80ab6c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ab70:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80ab74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab78:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab7c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80ab80:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab84:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ab87:	89 c2                	mov    edx,eax
  80ab89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab8d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80ab90:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab94:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ab97:	89 c2                	mov    edx,eax
  80ab99:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab9d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80aba1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aba5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80aba9:	0f b6 d0             	movzx  edx,al
  80abac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abb0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80abb4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abb8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80abbc:	0f b6 d0             	movzx  edx,al
  80abbf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abc3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80abc7:	0f b7 c0             	movzx  eax,ax
  80abca:	0f af c2             	imul   eax,edx
  80abcd:	48 63 d0             	movsxd rdx,eax
  80abd0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abd4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80abd8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abdc:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80abe0:	0f b7 d0             	movzx  edx,ax
  80abe3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abe7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80abeb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abef:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80abf2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abf6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80abfa:	0f b7 c0             	movzx  eax,ax
  80abfd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80ac00:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac04:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80ac07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac0b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ac0f:	0f b6 c0             	movzx  eax,al
  80ac12:	0f af c2             	imul   eax,edx
  80ac15:	01 c8                	add    eax,ecx
  80ac17:	89 c2                	mov    edx,eax
  80ac19:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac1d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80ac21:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac25:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ac28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac2c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ac30:	0f b7 c0             	movzx  eax,ax
  80ac33:	01 d0                	add    eax,edx
  80ac35:	89 c2                	mov    edx,eax
  80ac37:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac3b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80ac3f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac43:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80ac46:	89 c2                	mov    edx,eax
  80ac48:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac4c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80ac50:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac54:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ac58:	0f b6 d0             	movzx  edx,al
  80ac5b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac5f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80ac63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac67:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ac6b:	0f b7 d0             	movzx  edx,ax
  80ac6e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac72:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80ac76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac7a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80ac7e:	0f b7 d0             	movzx  edx,ax
  80ac81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac85:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80ac89:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac8d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80ac90:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac94:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80ac98:	0f b7 d0             	movzx  edx,ax
  80ac9b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac9f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80aca3:	0f b7 c0             	movzx  eax,ax
  80aca6:	89 c6                	mov    esi,eax
  80aca8:	bf e0 46 81 00       	mov    edi,0x8146e0
  80acad:	b8 00 00 00 00       	mov    eax,0x0
  80acb2:	e8 70 60 ff ff       	call   800d27 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80acb7:	be 00 00 00 00       	mov    esi,0x0
  80acbc:	bf 00 02 00 00       	mov    edi,0x200
  80acc1:	b8 00 00 00 00       	mov    eax,0x0
  80acc6:	e8 ee 65 ff ff       	call   8012b9 <vmalloc>
  80accb:	48 89 c2             	mov    rdx,rax
  80acce:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acd2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80acd6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acda:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80acde:	ba 00 02 00 00       	mov    edx,0x200
  80ace3:	be 00 00 00 00       	mov    esi,0x0
  80ace8:	48 89 c7             	mov    rdi,rax
  80aceb:	e8 c0 0e 00 00       	call   80bbb0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80acf0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acf4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80acf8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80acfc:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80acff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ad03:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ad07:	0f b7 c0             	movzx  eax,ax
  80ad0a:	01 c8                	add    eax,ecx
  80ad0c:	49 89 d0             	mov    r8,rdx
  80ad0f:	b9 01 00 00 00       	mov    ecx,0x1
  80ad14:	89 c2                	mov    edx,eax
  80ad16:	be 00 00 00 00       	mov    esi,0x0
  80ad1b:	bf 00 00 00 00       	mov    edi,0x0
  80ad20:	e8 5c d3 ff ff       	call   808081 <request>
  80ad25:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80ad28:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80ad2b:	89 c7                	mov    edi,eax
  80ad2d:	e8 03 da ff ff       	call   808735 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80ad32:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ad36:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80ad3a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80ad40:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ad44:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80ad48:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80ad4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ad52:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80ad56:	8b 00                	mov    eax,DWORD PTR [rax]
  80ad58:	89 c6                	mov    esi,eax
  80ad5a:	bf 28 47 81 00       	mov    edi,0x814728
  80ad5f:	b8 00 00 00 00       	mov    eax,0x0
  80ad64:	e8 be 5f ff ff       	call   800d27 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80ad69:	be 00 00 00 00       	mov    esi,0x0
  80ad6e:	bf 48 00 00 00       	mov    edi,0x48
  80ad73:	b8 00 00 00 00       	mov    eax,0x0
  80ad78:	e8 3c 65 ff ff       	call   8012b9 <vmalloc>
  80ad7d:	48 89 c2             	mov    rdx,rax
  80ad80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad84:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80ad87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad8b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad8e:	ba 48 00 00 00       	mov    edx,0x48
  80ad93:	be 00 00 00 00       	mov    esi,0x0
  80ad98:	48 89 c7             	mov    rdi,rax
  80ad9b:	e8 10 0e 00 00       	call   80bbb0 <memset>

	list_init(&sbp->root->child_node);
  80ada0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ada4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ada7:	48 83 c0 10          	add    rax,0x10
  80adab:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80adaf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80adb3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80adb7:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80adba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80adbe:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80adc2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80adc6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80adc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adcb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80adce:	48 83 c0 20          	add    rax,0x20
  80add2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80add6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80adda:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80adde:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80ade1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ade5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80ade9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80aded:	90                   	nop
	sbp->root->parent = sbp->root;
  80adee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adf2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80adf5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80adf9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80adfc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80ae00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae07:	48 c7 40 40 60 c7 80 	mov    QWORD PTR [rax+0x40],0x80c760
  80ae0e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80ae0f:	be 00 00 00 00       	mov    esi,0x0
  80ae14:	bf 02 00 00 00       	mov    edi,0x2
  80ae19:	b8 00 00 00 00       	mov    eax,0x0
  80ae1e:	e8 96 64 ff ff       	call   8012b9 <vmalloc>
  80ae23:	48 89 c2             	mov    rdx,rax
  80ae26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae2a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae2d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80ae30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae34:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae37:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae3a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80ae3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae41:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae44:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80ae4b:	be 00 00 00 00       	mov    esi,0x0
  80ae50:	bf 38 00 00 00       	mov    edi,0x38
  80ae55:	b8 00 00 00 00       	mov    eax,0x0
  80ae5a:	e8 5a 64 ff ff       	call   8012b9 <vmalloc>
  80ae5f:	48 89 c2             	mov    rdx,rax
  80ae62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae69:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80ae6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae71:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae74:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae78:	ba 38 00 00 00       	mov    edx,0x38
  80ae7d:	be 00 00 00 00       	mov    esi,0x0
  80ae82:	48 89 c7             	mov    rdi,rax
  80ae85:	e8 26 0d 00 00       	call   80bbb0 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80ae8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae91:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae95:	48 c7 40 28 20 c7 80 	mov    QWORD PTR [rax+0x28],0x80c720
  80ae9c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80ae9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aea1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aea4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aea8:	48 c7 40 20 e0 c6 80 	mov    QWORD PTR [rax+0x20],0x80c6e0
  80aeaf:	00 
	sbp->root->dir_inode->file_size = 0;
  80aeb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aeb4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aeb7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aebb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80aec2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aec6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aec9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aecd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aed0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aed4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aed8:	48 01 d0             	add    rax,rdx
  80aedb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80aedf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aee3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80aee7:	48 89 c6             	mov    rsi,rax
  80aeea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aeee:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aef1:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80aef5:	48 89 d0             	mov    rax,rdx
  80aef8:	ba 00 00 00 00       	mov    edx,0x0
  80aefd:	48 f7 f6             	div    rsi
  80af00:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80af04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af08:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af0b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af0f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80af16:	00 
	sbp->root->dir_inode->sb = sbp;
  80af17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af1b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af1e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af22:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80af26:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80af2a:	be 00 00 00 00       	mov    esi,0x0
  80af2f:	bf 20 00 00 00       	mov    edi,0x20
  80af34:	b8 00 00 00 00       	mov    eax,0x0
  80af39:	e8 7b 63 ff ff       	call   8012b9 <vmalloc>
  80af3e:	48 89 c2             	mov    rdx,rax
  80af41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af45:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af48:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af4c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80af50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af57:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af5b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af5f:	ba 20 00 00 00       	mov    edx,0x20
  80af64:	be 00 00 00 00       	mov    esi,0x0
  80af69:	48 89 c7             	mov    rdi,rax
  80af6c:	e8 3f 0c 00 00       	call   80bbb0 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80af71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af75:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af78:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af7c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af80:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80af84:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af88:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80af8b:	89 c2                	mov    edx,eax
  80af8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af91:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80af94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af98:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80af9f:	00 
	finode->dentry_position = 0; 
  80afa0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afa4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80afab:	00 
	finode->create_date = 0;
  80afac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afb0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80afb6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afba:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80afc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afc4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80afca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afce:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80afd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80afd8:	c9                   	leave  
  80afd9:	c3                   	ret    

000000000080afda <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80afda:	f3 0f 1e fa          	endbr64 
  80afde:	55                   	push   rbp
  80afdf:	48 89 e5             	mov    rbp,rsp
  80afe2:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80afe9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80aff0:	00 
	struct Disk_Partition_Table DPT = {0};
  80aff1:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80aff8:	b8 00 00 00 00       	mov    eax,0x0
  80affd:	b9 40 00 00 00       	mov    ecx,0x40
  80b002:	48 89 d7             	mov    rdi,rdx
  80b005:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80b008:	bf a0 c7 80 00       	mov    edi,0x80c7a0
  80b00d:	e8 63 c1 ff ff       	call   807175 <register_filesystem>
	
	memset(buf,0,512);
  80b012:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b019:	ba 00 02 00 00       	mov    edx,0x200
  80b01e:	be 00 00 00 00       	mov    esi,0x0
  80b023:	48 89 c7             	mov    rdi,rax
  80b026:	e8 85 0b 00 00       	call   80bbb0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80b02b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b032:	49 89 c0             	mov    r8,rax
  80b035:	b9 01 00 00 00       	mov    ecx,0x1
  80b03a:	ba 00 00 00 00       	mov    edx,0x0
  80b03f:	be 00 00 00 00       	mov    esi,0x0
  80b044:	bf 00 00 00 00       	mov    edi,0x0
  80b049:	e8 33 d0 ff ff       	call   808081 <request>
  80b04e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80b051:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b054:	89 c7                	mov    edi,eax
  80b056:	e8 da d6 ff ff       	call   808735 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80b05b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80b062:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80b069:	48 89 d6             	mov    rsi,rdx
  80b06c:	ba 40 00 00 00       	mov    edx,0x40
  80b071:	48 89 c7             	mov    rdi,rax
  80b074:	48 89 d1             	mov    rcx,rdx
  80b077:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80b07a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80b081:	0f b6 d0             	movzx  edx,al
  80b084:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b08a:	89 c6                	mov    esi,eax
  80b08c:	bf 70 47 81 00       	mov    edi,0x814770
  80b091:	b8 00 00 00 00       	mov    eax,0x0
  80b096:	e8 8c 5c ff ff       	call   800d27 <printf>

	memset(buf,0,512);
  80b09b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b0a2:	ba 00 02 00 00       	mov    edx,0x200
  80b0a7:	be 00 00 00 00       	mov    esi,0x0
  80b0ac:	48 89 c7             	mov    rdi,rax
  80b0af:	e8 fc 0a 00 00       	call   80bbb0 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80b0b4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b0ba:	89 c2                	mov    edx,eax
  80b0bc:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b0c3:	49 89 c0             	mov    r8,rax
  80b0c6:	b9 01 00 00 00       	mov    ecx,0x1
  80b0cb:	be 00 00 00 00       	mov    esi,0x0
  80b0d0:	bf 00 00 00 00       	mov    edi,0x0
  80b0d5:	e8 a7 cf ff ff       	call   808081 <request>
  80b0da:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80b0dd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b0e0:	89 c7                	mov    edi,eax
  80b0e2:	e8 4e d6 ff ff       	call   808735 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80b0e7:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b0ee:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b0f5:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80b0fc:	48 89 c2             	mov    rdx,rax
  80b0ff:	48 89 ce             	mov    rsi,rcx
  80b102:	bf 6a 47 81 00       	mov    edi,0x81476a
  80b107:	e8 f1 bf ff ff       	call   8070fd <mount_fs>
  80b10c:	48 89 05 95 c4 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1c495],rax        # 4275a8 <root_sb>
}
  80b113:	90                   	nop
  80b114:	c9                   	leave  
  80b115:	c3                   	ret    

000000000080b116 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80b116:	f3 0f 1e fa          	endbr64 
  80b11a:	55                   	push   rbp
  80b11b:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  80b11e:	48 8b 05 03 f4 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f403]        # 42a528 <vpage_base>
  80b125:	48 05 a0 00 00 00    	add    rax,0xa0
  80b12b:	48 89 05 f6 f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f3f6],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  80b132:	8b 05 f8 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3f8]        # 42a530 <page_boffset>
  80b138:	05 a0 00 00 00       	add    eax,0xa0
  80b13d:	89 05 ed f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f3ed],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  80b143:	48 8b 15 de f3 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f3de]        # 42a528 <vpage_base>
  80b14a:	48 8b 05 cf f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f3cf]        # 42a520 <video_end>
  80b151:	48 39 c2             	cmp    rdx,rax
  80b154:	72 0e                	jb     80b164 <scrdown+0x4e>
        vpage_base=video_base;
  80b156:	48 8b 05 bb f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f3bb]        # 42a518 <video_base>
  80b15d:	48 89 05 c4 f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f3c4],rax        # 42a528 <vpage_base>
    set_origin();
  80b164:	b8 00 00 00 00       	mov    eax,0x0
  80b169:	e8 6a 00 00 00       	call   80b1d8 <set_origin>
}
  80b16e:	90                   	nop
  80b16f:	5d                   	pop    rbp
  80b170:	c3                   	ret    

000000000080b171 <scrup>:
void scrup()
{
  80b171:	f3 0f 1e fa          	endbr64 
  80b175:	55                   	push   rbp
  80b176:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80b179:	8b 05 b1 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3b1]        # 42a530 <page_boffset>
  80b17f:	85 c0                	test   eax,eax
  80b181:	75 24                	jne    80b1a7 <scrup+0x36>
    {
        page_boffset=0;
  80b183:	c7 05 a3 f3 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f3a3],0x0        # 42a530 <page_boffset>
  80b18a:	00 00 00 
        vpage_base=video_base;
  80b18d:	48 8b 05 84 f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f384]        # 42a518 <video_base>
  80b194:	48 89 05 8d f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f38d],rax        # 42a528 <vpage_base>
        set_origin();
  80b19b:	b8 00 00 00 00       	mov    eax,0x0
  80b1a0:	e8 33 00 00 00       	call   80b1d8 <set_origin>
        return;
  80b1a5:	eb 2f                	jmp    80b1d6 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80b1a7:	48 8b 05 7a f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f37a]        # 42a528 <vpage_base>
  80b1ae:	48 2d a0 00 00 00    	sub    rax,0xa0
  80b1b4:	48 89 05 6d f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f36d],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  80b1bb:	8b 05 6f f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f36f]        # 42a530 <page_boffset>
  80b1c1:	2d a0 00 00 00       	sub    eax,0xa0
  80b1c6:	89 05 64 f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f364],eax        # 42a530 <page_boffset>
    set_origin();
  80b1cc:	b8 00 00 00 00       	mov    eax,0x0
  80b1d1:	e8 02 00 00 00       	call   80b1d8 <set_origin>
}
  80b1d6:	5d                   	pop    rbp
  80b1d7:	c3                   	ret    

000000000080b1d8 <set_origin>:
void set_origin(void)
{
  80b1d8:	f3 0f 1e fa          	endbr64 
  80b1dc:	55                   	push   rbp
  80b1dd:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b1e0:	fa                   	cli    
    outb(port_reg_index,12);
  80b1e1:	8b 05 59 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f359]        # 42a540 <port_reg_index>
  80b1e7:	0f b7 c0             	movzx  eax,ax
  80b1ea:	be 0c 00 00 00       	mov    esi,0xc
  80b1ef:	89 c7                	mov    edi,eax
  80b1f1:	e8 1a a8 ff ff       	call   805a10 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80b1f6:	8b 05 34 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f334]        # 42a530 <page_boffset>
  80b1fc:	c1 e8 09             	shr    eax,0x9
  80b1ff:	0f b6 d0             	movzx  edx,al
  80b202:	8b 05 3c f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f33c]        # 42a544 <port_reg_v>
  80b208:	0f b7 c0             	movzx  eax,ax
  80b20b:	89 d6                	mov    esi,edx
  80b20d:	89 c7                	mov    edi,eax
  80b20f:	e8 fc a7 ff ff       	call   805a10 <outb>
    outb(port_reg_index,13);
  80b214:	8b 05 26 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f326]        # 42a540 <port_reg_index>
  80b21a:	0f b7 c0             	movzx  eax,ax
  80b21d:	be 0d 00 00 00       	mov    esi,0xd
  80b222:	89 c7                	mov    edi,eax
  80b224:	e8 e7 a7 ff ff       	call   805a10 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80b229:	8b 05 01 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f301]        # 42a530 <page_boffset>
  80b22f:	d1 e8                	shr    eax,1
  80b231:	0f b6 d0             	movzx  edx,al
  80b234:	8b 05 0a f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f30a]        # 42a544 <port_reg_v>
  80b23a:	0f b7 c0             	movzx  eax,ax
  80b23d:	89 d6                	mov    esi,edx
  80b23f:	89 c7                	mov    edi,eax
  80b241:	e8 ca a7 ff ff       	call   805a10 <outb>
    asm volatile("sti");
  80b246:	fb                   	sti    

}
  80b247:	90                   	nop
  80b248:	5d                   	pop    rbp
  80b249:	c3                   	ret    

000000000080b24a <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80b24a:	f3 0f 1e fa          	endbr64 
  80b24e:	55                   	push   rbp
  80b24f:	48 89 e5             	mov    rbp,rsp
  80b252:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80b256:	be a8 49 81 00       	mov    esi,0x8149a8
  80b25b:	bf 54 48 81 00       	mov    edi,0x814854
  80b260:	e8 9a 09 00 00       	call   80bbff <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80b265:	be ad 49 81 00       	mov    esi,0x8149ad
  80b26a:	bf 14 49 81 00       	mov    edi,0x814914
  80b26f:	e8 8b 09 00 00       	call   80bbff <strcpy>
    reg_driver(&drv_tty);
  80b274:	bf a0 47 81 00       	mov    edi,0x8147a0
  80b279:	e8 36 76 ff ff       	call   8028b4 <reg_driver>
    reg_device(&dev_tty);
  80b27e:	bf 40 48 81 00       	mov    edi,0x814840
  80b283:	e8 44 73 ff ff       	call   8025cc <reg_device>
    reg_device(&dev_stdout);
  80b288:	bf 00 49 81 00       	mov    edi,0x814900
  80b28d:	e8 3a 73 ff ff       	call   8025cc <reg_device>
    unsigned char *vp=0x20000;
  80b292:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80b299:	00 
    if(*vp==0x7)
  80b29a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b29e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2a1:	3c 07                	cmp    al,0x7
  80b2a3:	75 36                	jne    80b2db <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80b2a5:	c7 05 85 f2 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f285],0x0        # 42a534 <video_mode>
  80b2ac:	00 00 00 
        video_base=0xb0000;
  80b2af:	48 c7 05 5e f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f25e],0xb0000        # 42a518 <video_base>
  80b2b6:	00 00 0b 00 
        video_end=0xb8000-1;
  80b2ba:	48 c7 05 5b f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f25b],0xb7fff        # 42a520 <video_end>
  80b2c1:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80b2c5:	c7 05 71 f2 c1 ff b4 	mov    DWORD PTR [rip+0xffffffffffc1f271],0x3b4        # 42a540 <port_reg_index>
  80b2cc:	03 00 00 
        port_reg_v=0x3b5;
  80b2cf:	c7 05 6b f2 c1 ff b5 	mov    DWORD PTR [rip+0xffffffffffc1f26b],0x3b5        # 42a544 <port_reg_v>
  80b2d6:	03 00 00 
  80b2d9:	eb 61                	jmp    80b33c <init_tty+0xf2>
    }else if(*vp<=0x3)
  80b2db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2e2:	3c 03                	cmp    al,0x3
  80b2e4:	77 36                	ja     80b31c <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80b2e6:	c7 05 44 f2 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc1f244],0x1        # 42a534 <video_mode>
  80b2ed:	00 00 00 
        video_base=0xb8000;
  80b2f0:	48 c7 05 1d f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f21d],0xb8000        # 42a518 <video_base>
  80b2f7:	00 80 0b 00 
        video_end=0xc0000-1;
  80b2fb:	48 c7 05 1a f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f21a],0xbffff        # 42a520 <video_end>
  80b302:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80b306:	c7 05 30 f2 c1 ff d4 	mov    DWORD PTR [rip+0xffffffffffc1f230],0x3d4        # 42a540 <port_reg_index>
  80b30d:	03 00 00 
        port_reg_v=0x3d5;
  80b310:	c7 05 2a f2 c1 ff d5 	mov    DWORD PTR [rip+0xffffffffffc1f22a],0x3d5        # 42a544 <port_reg_v>
  80b317:	03 00 00 
  80b31a:	eb 20                	jmp    80b33c <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80b31c:	c7 05 0e f2 c1 ff 02 	mov    DWORD PTR [rip+0xffffffffffc1f20e],0x2        # 42a534 <video_mode>
  80b323:	00 00 00 
        video_base=0xa0000;
  80b326:	48 c7 05 e7 f1 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f1e7],0xa0000        # 42a518 <video_base>
  80b32d:	00 00 0a 00 
        video_end=0xb0000-1;
  80b331:	48 c7 05 e4 f1 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f1e4],0xaffff        # 42a520 <video_end>
  80b338:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80b33c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b340:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b343:	3c 01                	cmp    al,0x1
  80b345:	77 0f                	ja     80b356 <init_tty+0x10c>
  80b347:	c7 05 eb f1 c1 ff 28 	mov    DWORD PTR [rip+0xffffffffffc1f1eb],0x28        # 42a53c <line_chs>
  80b34e:	00 00 00 
  80b351:	e9 91 00 00 00       	jmp    80b3e7 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80b356:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b35a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b35d:	3c 03                	cmp    al,0x3
  80b35f:	76 0b                	jbe    80b36c <init_tty+0x122>
  80b361:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b365:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b368:	3c 07                	cmp    al,0x7
  80b36a:	75 0c                	jne    80b378 <init_tty+0x12e>
  80b36c:	c7 05 c6 f1 c1 ff 50 	mov    DWORD PTR [rip+0xffffffffffc1f1c6],0x50        # 42a53c <line_chs>
  80b373:	00 00 00 
  80b376:	eb 6f                	jmp    80b3e7 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80b378:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b37c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b37f:	3c 05                	cmp    al,0x5
  80b381:	76 16                	jbe    80b399 <init_tty+0x14f>
  80b383:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b387:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b38a:	3c 09                	cmp    al,0x9
  80b38c:	74 0b                	je     80b399 <init_tty+0x14f>
  80b38e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b392:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b395:	3c 0d                	cmp    al,0xd
  80b397:	75 0c                	jne    80b3a5 <init_tty+0x15b>
  80b399:	c7 05 99 f1 c1 ff 40 	mov    DWORD PTR [rip+0xffffffffffc1f199],0x140        # 42a53c <line_chs>
  80b3a0:	01 00 00 
  80b3a3:	eb 42                	jmp    80b3e7 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80b3a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3ac:	3c 06                	cmp    al,0x6
  80b3ae:	74 16                	je     80b3c6 <init_tty+0x17c>
  80b3b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3b4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3b7:	3c 0a                	cmp    al,0xa
  80b3b9:	74 0b                	je     80b3c6 <init_tty+0x17c>
  80b3bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3c2:	3c 0d                	cmp    al,0xd
  80b3c4:	76 0c                	jbe    80b3d2 <init_tty+0x188>
  80b3c6:	c7 05 6c f1 c1 ff 80 	mov    DWORD PTR [rip+0xffffffffffc1f16c],0x280        # 42a53c <line_chs>
  80b3cd:	02 00 00 
  80b3d0:	eb 15                	jmp    80b3e7 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80b3d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3d9:	3c 08                	cmp    al,0x8
  80b3db:	75 0a                	jne    80b3e7 <init_tty+0x19d>
  80b3dd:	c7 05 55 f1 c1 ff a0 	mov    DWORD PTR [rip+0xffffffffffc1f155],0xa0        # 42a53c <line_chs>
  80b3e4:	00 00 00 
    switch (*vp)
  80b3e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3ee:	0f b6 c0             	movzx  eax,al
  80b3f1:	83 f8 14             	cmp    eax,0x14
  80b3f4:	77 61                	ja     80b457 <init_tty+0x20d>
  80b3f6:	89 c0                	mov    eax,eax
  80b3f8:	48 8b 04 c5 b8 49 81 	mov    rax,QWORD PTR [rax*8+0x8149b8]
  80b3ff:	00 
  80b400:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80b403:	c7 05 3b f1 c1 ff e8 	mov    DWORD PTR [rip+0xffffffffffc1f13b],0x3e8        # 42a548 <vpage_size>
  80b40a:	03 00 00 
  80b40d:	eb 49                	jmp    80b458 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80b40f:	c7 05 2f f1 c1 ff d0 	mov    DWORD PTR [rip+0xffffffffffc1f12f],0x7d0        # 42a548 <vpage_size>
  80b416:	07 00 00 
  80b419:	eb 3d                	jmp    80b458 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80b41b:	c7 05 23 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f123],0xfa00        # 42a548 <vpage_size>
  80b422:	fa 00 00 
  80b425:	eb 31                	jmp    80b458 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80b427:	c7 05 17 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f117],0x1f400        # 42a548 <vpage_size>
  80b42e:	f4 01 00 
  80b431:	eb 25                	jmp    80b458 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80b433:	c7 05 0b f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f10b],0x7d00        # 42a548 <vpage_size>
  80b43a:	7d 00 00 
  80b43d:	eb 19                	jmp    80b458 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80b43f:	c7 05 ff f0 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f0ff],0x36b00        # 42a548 <vpage_size>
  80b446:	6b 03 00 
  80b449:	eb 0d                	jmp    80b458 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80b44b:	c7 05 f3 f0 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f0f3],0x4b000        # 42a548 <vpage_size>
  80b452:	b0 04 00 
  80b455:	eb 01                	jmp    80b458 <init_tty+0x20e>
    default:
        break;
  80b457:	90                   	nop
    }
    m_ptr=video_base;
  80b458:	48 8b 05 b9 f0 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f0b9]        # 42a518 <video_base>
  80b45f:	48 89 05 5a 13 00 00 	mov    QWORD PTR [rip+0x135a],rax        # 80c7c0 <m_ptr>
    page_boffset=0;
  80b466:	c7 05 c0 f0 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f0c0],0x0        # 42a530 <page_boffset>
  80b46d:	00 00 00 
    vpage_base=video_base;
  80b470:	48 8b 05 a1 f0 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f0a1]        # 42a518 <video_base>
  80b477:	48 89 05 aa f0 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f0aa],rax        # 42a528 <vpage_base>
    vp++;
  80b47e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80b483:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b487:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b48a:	0f b6 c0             	movzx  eax,al
  80b48d:	89 05 a5 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f0a5],eax        # 42a538 <vpage>
    vp++;
  80b493:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80b498:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b49c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b4a0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b4a4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b4a7:	0f b6 c0             	movzx  eax,al
  80b4aa:	89 05 a4 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f0a4],eax        # 42a554 <stline>
    endline=*vp++;
  80b4b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b4b4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b4b8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b4bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b4bf:	0f b6 c0             	movzx  eax,al
  80b4c2:	89 05 90 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f090],eax        # 42a558 <endline>
    videoy=*vp++;
  80b4c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b4cc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b4d0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b4d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b4d7:	0f b6 c0             	movzx  eax,al
  80b4da:	89 05 70 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f070],eax        # 42a550 <videoy>
    videox=*vp;
  80b4e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b4e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b4e7:	0f b6 c0             	movzx  eax,al
  80b4ea:	89 05 5c f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f05c],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80b4f0:	90                   	nop
  80b4f1:	c9                   	leave  
  80b4f2:	c3                   	ret    

000000000080b4f3 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80b4f3:	f3 0f 1e fa          	endbr64 
  80b4f7:	55                   	push   rbp
  80b4f8:	48 89 e5             	mov    rbp,rsp
  80b4fb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80b4ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b503:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80b506:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80b509:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b50c:	05 00 c0 05 00       	add    eax,0x5c000
  80b511:	01 c0                	add    eax,eax
  80b513:	48 98                	cdqe   
  80b515:	48 89 05 a4 12 00 00 	mov    QWORD PTR [rip+0x12a4],rax        # 80c7c0 <m_ptr>
}
  80b51c:	90                   	nop
  80b51d:	5d                   	pop    rbp
  80b51e:	c3                   	ret    

000000000080b51f <tell_monitor>:
int tell_monitor()
{
  80b51f:	f3 0f 1e fa          	endbr64 
  80b523:	55                   	push   rbp
  80b524:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80b527:	48 8b 05 92 12 00 00 	mov    rax,QWORD PTR [rip+0x1292]        # 80c7c0 <m_ptr>
  80b52e:	48 8b 15 e3 ef c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1efe3]        # 42a518 <video_base>
  80b535:	48 29 d0             	sub    rax,rdx
  80b538:	48 89 c2             	mov    rdx,rax
  80b53b:	48 c1 ea 3f          	shr    rdx,0x3f
  80b53f:	48 01 d0             	add    rax,rdx
  80b542:	48 d1 f8             	sar    rax,1
}
  80b545:	5d                   	pop    rbp
  80b546:	c3                   	ret    

000000000080b547 <del_ch>:
void del_ch()
{
  80b547:	f3 0f 1e fa          	endbr64 
  80b54b:	55                   	push   rbp
  80b54c:	48 89 e5             	mov    rbp,rsp
  80b54f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80b556:	48 8b 05 63 12 00 00 	mov    rax,QWORD PTR [rip+0x1263]        # 80c7c0 <m_ptr>
  80b55d:	48 83 e8 02          	sub    rax,0x2
  80b561:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80b565:	b8 00 00 00 00       	mov    eax,0x0
  80b56a:	e8 b0 ff ff ff       	call   80b51f <tell_monitor>
  80b56f:	89 c2                	mov    edx,eax
  80b571:	48 63 c2             	movsxd rax,edx
  80b574:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80b57b:	48 c1 e8 20          	shr    rax,0x20
  80b57f:	c1 f8 05             	sar    eax,0x5
  80b582:	89 d1                	mov    ecx,edx
  80b584:	c1 f9 1f             	sar    ecx,0x1f
  80b587:	29 c8                	sub    eax,ecx
  80b589:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80b58c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80b58f:	89 c8                	mov    eax,ecx
  80b591:	c1 e0 02             	shl    eax,0x2
  80b594:	01 c8                	add    eax,ecx
  80b596:	c1 e0 04             	shl    eax,0x4
  80b599:	29 c2                	sub    edx,eax
  80b59b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80b59e:	eb 17                	jmp    80b5b7 <del_ch+0x70>
    {
        *p=*(p+2);
  80b5a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5a4:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80b5a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5ac:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80b5ae:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80b5b3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b5b7:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80b5bb:	7e e3                	jle    80b5a0 <del_ch+0x59>
    }
    driver_args args= {
  80b5bd:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80b5c4:	b8 00 00 00 00       	mov    eax,0x0
  80b5c9:	b9 18 00 00 00       	mov    ecx,0x18
  80b5ce:	48 89 d7             	mov    rdi,rdx
  80b5d1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80b5d4:	b8 00 00 00 00       	mov    eax,0x0
  80b5d9:	e8 41 ff ff ff       	call   80b51f <tell_monitor>
  80b5de:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80b5e1:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80b5e7:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80b5ee:	48 89 c7             	mov    rdi,rax
  80b5f1:	e8 fd fe ff ff       	call   80b4f3 <seek_tty>
    set_cur();
  80b5f6:	b8 00 00 00 00       	mov    eax,0x0
  80b5fb:	e8 03 00 00 00       	call   80b603 <set_cur>
}
  80b600:	90                   	nop
  80b601:	c9                   	leave  
  80b602:	c3                   	ret    

000000000080b603 <set_cur>:
void set_cur()
{
  80b603:	f3 0f 1e fa          	endbr64 
  80b607:	55                   	push   rbp
  80b608:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b60b:	fa                   	cli    
    outb(port_reg_index,14);
  80b60c:	8b 05 2e ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef2e]        # 42a540 <port_reg_index>
  80b612:	0f b7 c0             	movzx  eax,ax
  80b615:	be 0e 00 00 00       	mov    esi,0xe
  80b61a:	89 c7                	mov    edi,eax
  80b61c:	e8 ef a3 ff ff       	call   805a10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80b621:	48 8b 05 98 11 00 00 	mov    rax,QWORD PTR [rip+0x1198]        # 80c7c0 <m_ptr>
  80b628:	48 8b 15 e9 ee c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1eee9]        # 42a518 <video_base>
  80b62f:	48 29 d0             	sub    rax,rdx
  80b632:	48 c1 f8 09          	sar    rax,0x9
  80b636:	0f b6 d0             	movzx  edx,al
  80b639:	8b 05 05 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef05]        # 42a544 <port_reg_v>
  80b63f:	0f b7 c0             	movzx  eax,ax
  80b642:	89 d6                	mov    esi,edx
  80b644:	89 c7                	mov    edi,eax
  80b646:	e8 c5 a3 ff ff       	call   805a10 <outb>
    outb(port_reg_index,15);
  80b64b:	8b 05 ef ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eeef]        # 42a540 <port_reg_index>
  80b651:	0f b7 c0             	movzx  eax,ax
  80b654:	be 0f 00 00 00       	mov    esi,0xf
  80b659:	89 c7                	mov    edi,eax
  80b65b:	e8 b0 a3 ff ff       	call   805a10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80b660:	48 8b 05 59 11 00 00 	mov    rax,QWORD PTR [rip+0x1159]        # 80c7c0 <m_ptr>
  80b667:	48 8b 15 aa ee c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1eeaa]        # 42a518 <video_base>
  80b66e:	48 29 d0             	sub    rax,rdx
  80b671:	48 d1 f8             	sar    rax,1
  80b674:	0f b6 d0             	movzx  edx,al
  80b677:	8b 05 c7 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eec7]        # 42a544 <port_reg_v>
  80b67d:	0f b7 c0             	movzx  eax,ax
  80b680:	89 d6                	mov    esi,edx
  80b682:	89 c7                	mov    edi,eax
  80b684:	e8 87 a3 ff ff       	call   805a10 <outb>
    asm volatile("sti");
  80b689:	fb                   	sti    
}
  80b68a:	90                   	nop
  80b68b:	5d                   	pop    rbp
  80b68c:	c3                   	ret    

000000000080b68d <read_tty>:

int read_tty(driver_args *args)
{
  80b68d:	f3 0f 1e fa          	endbr64 
  80b691:	55                   	push   rbp
  80b692:	48 89 e5             	mov    rbp,rsp
  80b695:	48 83 ec 20          	sub    rsp,0x20
  80b699:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80b69d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6a1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80b6a4:	48 98                	cdqe   
  80b6a6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b6aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6ae:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b6b1:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b6b4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b6bb:	eb 4a                	jmp    80b707 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80b6bd:	48 8b 15 fc 10 00 00 	mov    rdx,QWORD PTR [rip+0x10fc]        # 80c7c0 <m_ptr>
  80b6c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6c8:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b6cc:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b6d0:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b6d3:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80b6d5:	48 8b 05 e4 10 00 00 	mov    rax,QWORD PTR [rip+0x10e4]        # 80c7c0 <m_ptr>
  80b6dc:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80b6e2:	75 0d                	jne    80b6f1 <read_tty+0x64>
  80b6e4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b6e8:	7e 07                	jle    80b6f1 <read_tty+0x64>
        {
            return 1;//读到尾了
  80b6ea:	b8 01 00 00 00       	mov    eax,0x1
  80b6ef:	eb 2d                	jmp    80b71e <read_tty+0x91>
        }
        m_ptr+=2;
  80b6f1:	48 8b 05 c8 10 00 00 	mov    rax,QWORD PTR [rip+0x10c8]        # 80c7c0 <m_ptr>
  80b6f8:	48 83 c0 02          	add    rax,0x2
  80b6fc:	48 89 05 bd 10 00 00 	mov    QWORD PTR [rip+0x10bd],rax        # 80c7c0 <m_ptr>
    for(int i=0;i<len;i++)
  80b703:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b707:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b70a:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b70d:	7c ae                	jl     80b6bd <read_tty+0x30>
    }
    set_cur();
  80b70f:	b8 00 00 00 00       	mov    eax,0x0
  80b714:	e8 ea fe ff ff       	call   80b603 <set_cur>
    return 0;
  80b719:	b8 00 00 00 00       	mov    eax,0x0
}
  80b71e:	c9                   	leave  
  80b71f:	c3                   	ret    

000000000080b720 <write_tty>:
int write_tty(driver_args *args)
{
  80b720:	f3 0f 1e fa          	endbr64 
  80b724:	55                   	push   rbp
  80b725:	48 89 e5             	mov    rbp,rsp
  80b728:	48 83 ec 30          	sub    rsp,0x30
  80b72c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80b730:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b734:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b737:	48 98                	cdqe   
  80b739:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b73d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b741:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b744:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b747:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b74e:	e9 0b 01 00 00       	jmp    80b85e <write_tty+0x13e>
    {
        if(*src=='\n')
  80b753:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b757:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b75a:	3c 0a                	cmp    al,0xa
  80b75c:	75 50                	jne    80b7ae <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80b75e:	48 8b 05 5b 10 00 00 	mov    rax,QWORD PTR [rip+0x105b]        # 80c7c0 <m_ptr>
  80b765:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80b76b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80b76e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b771:	89 c2                	mov    edx,eax
  80b773:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80b778:	48 0f af c2          	imul   rax,rdx
  80b77c:	48 c1 e8 20          	shr    rax,0x20
  80b780:	c1 e8 07             	shr    eax,0x7
  80b783:	8d 50 01             	lea    edx,[rax+0x1]
  80b786:	89 d0                	mov    eax,edx
  80b788:	c1 e0 02             	shl    eax,0x2
  80b78b:	01 d0                	add    eax,edx
  80b78d:	c1 e0 05             	shl    eax,0x5
  80b790:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80b793:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b796:	05 00 80 0b 00       	add    eax,0xb8000
  80b79b:	89 c0                	mov    eax,eax
  80b79d:	48 89 05 1c 10 00 00 	mov    QWORD PTR [rip+0x101c],rax        # 80c7c0 <m_ptr>
            src++;
  80b7a4:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80b7a9:	e9 ac 00 00 00       	jmp    80b85a <write_tty+0x13a>
        }else if(*src=='\0')
  80b7ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b7b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7b5:	84 c0                	test   al,al
  80b7b7:	0f 84 af 00 00 00    	je     80b86c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80b7bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b7c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b7c4:	3c 08                	cmp    al,0x8
  80b7c6:	75 1e                	jne    80b7e6 <write_tty+0xc6>
        {
            m_ptr-=2;
  80b7c8:	48 8b 05 f1 0f 00 00 	mov    rax,QWORD PTR [rip+0xff1]        # 80c7c0 <m_ptr>
  80b7cf:	48 83 e8 02          	sub    rax,0x2
  80b7d3:	48 89 05 e6 0f 00 00 	mov    QWORD PTR [rip+0xfe6],rax        # 80c7c0 <m_ptr>
            *m_ptr=0;
  80b7da:	48 8b 05 df 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdf]        # 80c7c0 <m_ptr>
  80b7e1:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80b7e4:	eb 3e                	jmp    80b824 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80b7e6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b7ea:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b7ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80b7f2:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80c7c0 <m_ptr>
  80b7f9:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b7fd:	48 89 0d bc 0f 00 00 	mov    QWORD PTR [rip+0xfbc],rcx        # 80c7c0 <m_ptr>
  80b804:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b807:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80b809:	48 8b 05 b0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb0]        # 80c7c0 <m_ptr>
  80b810:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b814:	48 89 15 a5 0f 00 00 	mov    QWORD PTR [rip+0xfa5],rdx        # 80c7c0 <m_ptr>
  80b81b:	0f b6 15 a6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfa6]        # 80c7c8 <m_color>
  80b822:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80b824:	48 8b 05 95 0f 00 00 	mov    rax,QWORD PTR [rip+0xf95]        # 80c7c0 <m_ptr>
  80b82b:	48 8b 0d f6 ec c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1ecf6]        # 42a528 <vpage_base>
  80b832:	48 29 c8             	sub    rax,rcx
  80b835:	48 89 c2             	mov    rdx,rax
  80b838:	8b 05 0a ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed0a]        # 42a548 <vpage_size>
  80b83e:	8b 0d f8 ec c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1ecf8]        # 42a53c <line_chs>
  80b844:	29 c8                	sub    eax,ecx
  80b846:	01 c0                	add    eax,eax
  80b848:	48 98                	cdqe   
  80b84a:	48 39 c2             	cmp    rdx,rax
  80b84d:	7c 0b                	jl     80b85a <write_tty+0x13a>
  80b84f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b853:	7e 05                	jle    80b85a <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80b855:	e8 bc f8 ff ff       	call   80b116 <scrdown>
    for(int i=0;i<len;i++)
  80b85a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b85e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b861:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b864:	0f 8c e9 fe ff ff    	jl     80b753 <write_tty+0x33>
  80b86a:	eb 01                	jmp    80b86d <write_tty+0x14d>
            break;
  80b86c:	90                   	nop
        }
    }
    set_cur();
  80b86d:	b8 00 00 00 00       	mov    eax,0x0
  80b872:	e8 8c fd ff ff       	call   80b603 <set_cur>
    return 0;
  80b877:	b8 00 00 00 00       	mov    eax,0x0
}
  80b87c:	c9                   	leave  
  80b87d:	c3                   	ret    

000000000080b87e <cls>:

void cls(driver_args *args)
{
  80b87e:	f3 0f 1e fa          	endbr64 
  80b882:	55                   	push   rbp
  80b883:	48 89 e5             	mov    rbp,rsp
  80b886:	48 83 ec 20          	sub    rsp,0x20
  80b88a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80b88e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b895:	eb 16                	jmp    80b8ad <cls+0x2f>
    {
        vpage_base[i]=0;
  80b897:	48 8b 15 8a ec c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ec8a]        # 42a528 <vpage_base>
  80b89e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b8a1:	48 98                	cdqe   
  80b8a3:	48 01 d0             	add    rax,rdx
  80b8a6:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80b8a9:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80b8ad:	8b 05 95 ec c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ec95]        # 42a548 <vpage_size>
  80b8b3:	01 c0                	add    eax,eax
  80b8b5:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80b8b8:	7c dd                	jl     80b897 <cls+0x19>
    }
    m_ptr=vpage_base;
  80b8ba:	48 8b 05 67 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec67]        # 42a528 <vpage_base>
  80b8c1:	48 89 05 f8 0e 00 00 	mov    QWORD PTR [rip+0xef8],rax        # 80c7c0 <m_ptr>
    set_cur();
  80b8c8:	b8 00 00 00 00       	mov    eax,0x0
  80b8cd:	e8 31 fd ff ff       	call   80b603 <set_cur>
}
  80b8d2:	90                   	nop
  80b8d3:	c9                   	leave  
  80b8d4:	c3                   	ret    

000000000080b8d5 <set_color>:

void set_color(char color)
{
  80b8d5:	f3 0f 1e fa          	endbr64 
  80b8d9:	55                   	push   rbp
  80b8da:	48 89 e5             	mov    rbp,rsp
  80b8dd:	89 f8                	mov    eax,edi
  80b8df:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80b8e2:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80b8e6:	88 05 dc 0e 00 00    	mov    BYTE PTR [rip+0xedc],al        # 80c7c8 <m_color>
}
  80b8ec:	90                   	nop
  80b8ed:	5d                   	pop    rbp
  80b8ee:	c3                   	ret    

000000000080b8ef <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80b8ef:	f3 0f 1e fa          	endbr64 
  80b8f3:	55                   	push   rbp
  80b8f4:	48 89 e5             	mov    rbp,rsp
  80b8f7:	48 83 ec 10          	sub    rsp,0x10
  80b8fb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80b8ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b903:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80b909:	83 f8 0d             	cmp    eax,0xd
  80b90c:	74 45                	je     80b953 <tty_do_req+0x64>
  80b90e:	83 f8 0d             	cmp    eax,0xd
  80b911:	7f 53                	jg     80b966 <tty_do_req+0x77>
  80b913:	83 f8 0c             	cmp    eax,0xc
  80b916:	74 2d                	je     80b945 <tty_do_req+0x56>
  80b918:	83 f8 0c             	cmp    eax,0xc
  80b91b:	7f 49                	jg     80b966 <tty_do_req+0x77>
  80b91d:	83 f8 02             	cmp    eax,0x2
  80b920:	74 07                	je     80b929 <tty_do_req+0x3a>
  80b922:	83 f8 03             	cmp    eax,0x3
  80b925:	74 10                	je     80b937 <tty_do_req+0x48>
  80b927:	eb 3d                	jmp    80b966 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80b929:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b92d:	48 89 c7             	mov    rdi,rax
  80b930:	e8 58 fd ff ff       	call   80b68d <read_tty>
        break;
  80b935:	eb 36                	jmp    80b96d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80b937:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b93b:	48 89 c7             	mov    rdi,rax
  80b93e:	e8 dd fd ff ff       	call   80b720 <write_tty>
        break;
  80b943:	eb 28                	jmp    80b96d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80b945:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b949:	48 89 c7             	mov    rdi,rax
  80b94c:	e8 a2 fb ff ff       	call   80b4f3 <seek_tty>
        break;
  80b951:	eb 1a                	jmp    80b96d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80b953:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b957:	48 89 c7             	mov    rdi,rax
  80b95a:	b8 00 00 00 00       	mov    eax,0x0
  80b95f:	e8 bb fb ff ff       	call   80b51f <tell_monitor>
        break;
  80b964:	eb 07                	jmp    80b96d <tty_do_req+0x7e>
    default:return -1;
  80b966:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b96b:	eb 05                	jmp    80b972 <tty_do_req+0x83>
    }
    return 0;
  80b96d:	b8 00 00 00 00       	mov    eax,0x0
}
  80b972:	c9                   	leave  
  80b973:	c3                   	ret    

000000000080b974 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b974:	f3 0f 1e fa          	endbr64 
  80b978:	55                   	push   rbp
  80b979:	48 89 e5             	mov    rbp,rsp
  80b97c:	48 83 ec 10          	sub    rsp,0x10
  80b980:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b983:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b986:	83 c0 01             	add    eax,0x1
  80b989:	0f b7 c0             	movzx  eax,ax
  80b98c:	be 00 00 00 00       	mov    esi,0x0
  80b991:	89 c7                	mov    edi,eax
  80b993:	e8 78 a0 ff ff       	call   805a10 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b998:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b99b:	83 c0 03             	add    eax,0x3
  80b99e:	0f b7 c0             	movzx  eax,ax
  80b9a1:	be 80 00 00 00       	mov    esi,0x80
  80b9a6:	89 c7                	mov    edi,eax
  80b9a8:	e8 63 a0 ff ff       	call   805a10 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b9ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9b0:	0f b7 c0             	movzx  eax,ax
  80b9b3:	be 03 00 00 00       	mov    esi,0x3
  80b9b8:	89 c7                	mov    edi,eax
  80b9ba:	e8 51 a0 ff ff       	call   805a10 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b9bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9c2:	83 c0 01             	add    eax,0x1
  80b9c5:	0f b7 c0             	movzx  eax,ax
  80b9c8:	be 00 00 00 00       	mov    esi,0x0
  80b9cd:	89 c7                	mov    edi,eax
  80b9cf:	e8 3c a0 ff ff       	call   805a10 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b9d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9d7:	83 c0 03             	add    eax,0x3
  80b9da:	0f b7 c0             	movzx  eax,ax
  80b9dd:	be 03 00 00 00       	mov    esi,0x3
  80b9e2:	89 c7                	mov    edi,eax
  80b9e4:	e8 27 a0 ff ff       	call   805a10 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80b9e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9ec:	83 c0 02             	add    eax,0x2
  80b9ef:	0f b7 c0             	movzx  eax,ax
  80b9f2:	be c7 00 00 00       	mov    esi,0xc7
  80b9f7:	89 c7                	mov    edi,eax
  80b9f9:	e8 12 a0 ff ff       	call   805a10 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b9fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba01:	83 c0 04             	add    eax,0x4
  80ba04:	0f b7 c0             	movzx  eax,ax
  80ba07:	be 0b 00 00 00       	mov    esi,0xb
  80ba0c:	89 c7                	mov    edi,eax
  80ba0e:	e8 fd 9f ff ff       	call   805a10 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80ba13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba16:	83 c0 04             	add    eax,0x4
  80ba19:	0f b7 c0             	movzx  eax,ax
  80ba1c:	be 1e 00 00 00       	mov    esi,0x1e
  80ba21:	89 c7                	mov    edi,eax
  80ba23:	e8 e8 9f ff ff       	call   805a10 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80ba28:	b8 61 00 00 00       	mov    eax,0x61
  80ba2d:	0f b6 d0             	movzx  edx,al
  80ba30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba33:	0f b7 c0             	movzx  eax,ax
  80ba36:	89 d6                	mov    esi,edx
  80ba38:	89 c7                	mov    edi,eax
  80ba3a:	e8 d1 9f ff ff       	call   805a10 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80ba3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba42:	0f b6 c0             	movzx  eax,al
  80ba45:	89 c7                	mov    edi,eax
  80ba47:	e8 dd 9f ff ff       	call   805a29 <inb>
  80ba4c:	0f b6 d0             	movzx  edx,al
  80ba4f:	b8 61 00 00 00       	mov    eax,0x61
  80ba54:	0f be c0             	movsx  eax,al
  80ba57:	39 c2                	cmp    edx,eax
  80ba59:	75 17                	jne    80ba72 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80ba5b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba5e:	83 c0 04             	add    eax,0x4
  80ba61:	0f b7 c0             	movzx  eax,ax
  80ba64:	be 0f 00 00 00       	mov    esi,0xf
  80ba69:	89 c7                	mov    edi,eax
  80ba6b:	e8 a0 9f ff ff       	call   805a10 <outb>
  80ba70:	eb 01                	jmp    80ba73 <init_com+0xff>
        return;
  80ba72:	90                   	nop
}
  80ba73:	c9                   	leave  
  80ba74:	c3                   	ret    

000000000080ba75 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80ba75:	f3 0f 1e fa          	endbr64 
  80ba79:	55                   	push   rbp
  80ba7a:	48 89 e5             	mov    rbp,rsp
  80ba7d:	48 83 ec 20          	sub    rsp,0x20
  80ba81:	89 f8                	mov    eax,edi
  80ba83:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80ba86:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80ba8a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ba8d:	83 c0 05             	add    eax,0x5
  80ba90:	0f b6 c0             	movzx  eax,al
  80ba93:	89 c7                	mov    edi,eax
  80ba95:	e8 8f 9f ff ff       	call   805a29 <inb>
  80ba9a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80ba9d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80baa1:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80baa5:	74 e3                	je     80ba8a <com_putchar+0x15>
    outb(com_base, ch);
  80baa7:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80baab:	0f b6 d0             	movzx  edx,al
  80baae:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80bab1:	0f b7 c0             	movzx  eax,ax
  80bab4:	89 d6                	mov    esi,edx
  80bab6:	89 c7                	mov    edi,eax
  80bab8:	e8 53 9f ff ff       	call   805a10 <outb>
}
  80babd:	90                   	nop
  80babe:	c9                   	leave  
  80babf:	c3                   	ret    

000000000080bac0 <com_puts>:

void com_puts(char* s,int com_port){
  80bac0:	f3 0f 1e fa          	endbr64 
  80bac4:	55                   	push   rbp
  80bac5:	48 89 e5             	mov    rbp,rsp
  80bac8:	48 83 ec 10          	sub    rsp,0x10
  80bacc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bad0:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80bad3:	eb 1d                	jmp    80baf2 <com_puts+0x32>
        com_putchar(*s,com_port);
  80bad5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bad9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80badc:	66 98                	cbw    
  80bade:	0f b7 c0             	movzx  eax,ax
  80bae1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80bae4:	89 d6                	mov    esi,edx
  80bae6:	89 c7                	mov    edi,eax
  80bae8:	e8 88 ff ff ff       	call   80ba75 <com_putchar>
    for(;*s;s++){
  80baed:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80baf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80baf6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80baf9:	84 c0                	test   al,al
  80bafb:	75 d8                	jne    80bad5 <com_puts+0x15>
    }
  80bafd:	90                   	nop
  80bafe:	90                   	nop
  80baff:	c9                   	leave  
  80bb00:	c3                   	ret    

000000000080bb01 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80bb01:	f3 0f 1e fa          	endbr64 
  80bb05:	55                   	push   rbp
  80bb06:	48 89 e5             	mov    rbp,rsp
  80bb09:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bb0d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bb11:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80bb14:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb18:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80bb1b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bb22:	eb 1b                	jmp    80bb3f <memcpy+0x3e>
        *(dest)=*(src);
  80bb24:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb28:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bb2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb2f:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80bb31:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80bb36:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80bb3b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bb3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bb42:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80bb45:	77 dd                	ja     80bb24 <memcpy+0x23>
    }
}
  80bb47:	90                   	nop
  80bb48:	90                   	nop
  80bb49:	5d                   	pop    rbp
  80bb4a:	c3                   	ret    

000000000080bb4b <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80bb4b:	f3 0f 1e fa          	endbr64 
  80bb4f:	55                   	push   rbp
  80bb50:	48 89 e5             	mov    rbp,rsp
  80bb53:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bb57:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bb5b:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80bb5e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bb65:	eb 3a                	jmp    80bba1 <memcmp+0x56>
    {
        if(*a!=*b)
  80bb67:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb6b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bb6e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb75:	38 c2                	cmp    dl,al
  80bb77:	74 1a                	je     80bb93 <memcmp+0x48>
            return *a-*b;
  80bb79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb80:	0f b6 d0             	movzx  edx,al
  80bb83:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb87:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb8a:	0f b6 c8             	movzx  ecx,al
  80bb8d:	89 d0                	mov    eax,edx
  80bb8f:	29 c8                	sub    eax,ecx
  80bb91:	eb 1b                	jmp    80bbae <memcmp+0x63>
        a++;
  80bb93:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80bb98:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80bb9d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bba1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bba4:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80bba7:	7c be                	jl     80bb67 <memcmp+0x1c>
    }
    return 0;
  80bba9:	b8 00 00 00 00       	mov    eax,0x0
}
  80bbae:	5d                   	pop    rbp
  80bbaf:	c3                   	ret    

000000000080bbb0 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80bbb0:	f3 0f 1e fa          	endbr64 
  80bbb4:	55                   	push   rbp
  80bbb5:	48 89 e5             	mov    rbp,rsp
  80bbb8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bbbc:	89 f0                	mov    eax,esi
  80bbbe:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80bbc1:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80bbc4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bbcb:	eb 16                	jmp    80bbe3 <memset+0x33>
        *(buf++)=value;
  80bbcd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bbd1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bbd5:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bbd9:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80bbdd:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80bbdf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bbe3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bbe6:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80bbe9:	72 e2                	jb     80bbcd <memset+0x1d>
    }
}
  80bbeb:	90                   	nop
  80bbec:	90                   	nop
  80bbed:	5d                   	pop    rbp
  80bbee:	c3                   	ret    

000000000080bbef <get_mem_size>:

u32 get_mem_size(){
  80bbef:	f3 0f 1e fa          	endbr64 
  80bbf3:	55                   	push   rbp
  80bbf4:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80bbf7:	8b 05 5f e9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e95f]        # 42a55c <mem_end>
}
  80bbfd:	5d                   	pop    rbp
  80bbfe:	c3                   	ret    

000000000080bbff <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80bbff:	f3 0f 1e fa          	endbr64 
  80bc03:	55                   	push   rbp
  80bc04:	48 89 e5             	mov    rbp,rsp
  80bc07:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bc0b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80bc0f:	eb 1d                	jmp    80bc2e <strcpy+0x2f>
        *(dest++)=*(buf++);
  80bc11:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80bc15:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80bc19:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80bc1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc21:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80bc25:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80bc29:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80bc2c:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80bc2e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc35:	84 c0                	test   al,al
  80bc37:	75 d8                	jne    80bc11 <strcpy+0x12>
    }
    *dest='\0';
  80bc39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc3d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bc40:	90                   	nop
  80bc41:	5d                   	pop    rbp
  80bc42:	c3                   	ret    

000000000080bc43 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80bc43:	f3 0f 1e fa          	endbr64 
  80bc47:	55                   	push   rbp
  80bc48:	48 89 e5             	mov    rbp,rsp
  80bc4b:	48 83 ec 30          	sub    rsp,0x30
  80bc4f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bc53:	89 f0                	mov    eax,esi
  80bc55:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80bc58:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80bc5d:	0f 84 9c 00 00 00    	je     80bcff <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80bc63:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bc67:	48 89 c6             	mov    rsi,rax
  80bc6a:	bf 80 a5 42 00       	mov    edi,0x42a580
  80bc6f:	e8 8b ff ff ff       	call   80bbff <strcpy>
        char* ptr=strtokkee;
  80bc74:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80bc7b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80bc7c:	c7 05 fa ea c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1eafa],0x0        # 42a780 <tokptr>
  80bc83:	00 00 00 
  80bc86:	eb 1c                	jmp    80bca4 <strtok+0x61>
  80bc88:	8b 05 f2 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eaf2]        # 42a780 <tokptr>
  80bc8e:	83 c0 01             	add    eax,0x1
  80bc91:	99                   	cdq    
  80bc92:	c1 ea 17             	shr    edx,0x17
  80bc95:	01 d0                	add    eax,edx
  80bc97:	25 ff 01 00 00       	and    eax,0x1ff
  80bc9c:	29 d0                	sub    eax,edx
  80bc9e:	89 05 dc ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eadc],eax        # 42a780 <tokptr>
  80bca4:	8b 05 d6 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ead6]        # 42a780 <tokptr>
  80bcaa:	48 98                	cdqe   
  80bcac:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bcb3:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bcb6:	74 13                	je     80bccb <strtok+0x88>
  80bcb8:	8b 05 c2 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eac2]        # 42a780 <tokptr>
  80bcbe:	48 98                	cdqe   
  80bcc0:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bcc7:	84 c0                	test   al,al
  80bcc9:	75 bd                	jne    80bc88 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80bccb:	8b 05 af ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eaaf]        # 42a780 <tokptr>
  80bcd1:	48 98                	cdqe   
  80bcd3:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80bcda:	8b 05 a0 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eaa0]        # 42a780 <tokptr>
  80bce0:	83 c0 01             	add    eax,0x1
  80bce3:	99                   	cdq    
  80bce4:	c1 ea 17             	shr    edx,0x17
  80bce7:	01 d0                	add    eax,edx
  80bce9:	25 ff 01 00 00       	and    eax,0x1ff
  80bcee:	29 d0                	sub    eax,edx
  80bcf0:	89 05 8a ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ea8a],eax        # 42a780 <tokptr>
        return ptr;
  80bcf6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bcfa:	e9 9e 00 00 00       	jmp    80bd9d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80bcff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80bd06:	8b 05 74 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea74]        # 42a780 <tokptr>
  80bd0c:	48 98                	cdqe   
  80bd0e:	48 05 80 a5 42 00    	add    rax,0x42a580
  80bd14:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80bd18:	eb 20                	jmp    80bd3a <strtok+0xf7>
  80bd1a:	8b 05 60 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea60]        # 42a780 <tokptr>
  80bd20:	83 c0 01             	add    eax,0x1
  80bd23:	99                   	cdq    
  80bd24:	c1 ea 17             	shr    edx,0x17
  80bd27:	01 d0                	add    eax,edx
  80bd29:	25 ff 01 00 00       	and    eax,0x1ff
  80bd2e:	29 d0                	sub    eax,edx
  80bd30:	89 05 4a ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ea4a],eax        # 42a780 <tokptr>
  80bd36:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bd3a:	8b 05 40 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea40]        # 42a780 <tokptr>
  80bd40:	48 98                	cdqe   
  80bd42:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bd49:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bd4c:	74 13                	je     80bd61 <strtok+0x11e>
  80bd4e:	8b 05 2c ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea2c]        # 42a780 <tokptr>
  80bd54:	48 98                	cdqe   
  80bd56:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bd5d:	84 c0                	test   al,al
  80bd5f:	75 b9                	jne    80bd1a <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80bd61:	8b 05 19 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea19]        # 42a780 <tokptr>
  80bd67:	48 98                	cdqe   
  80bd69:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80bd70:	8b 05 0a ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea0a]        # 42a780 <tokptr>
  80bd76:	83 c0 01             	add    eax,0x1
  80bd79:	99                   	cdq    
  80bd7a:	c1 ea 17             	shr    edx,0x17
  80bd7d:	01 d0                	add    eax,edx
  80bd7f:	25 ff 01 00 00       	and    eax,0x1ff
  80bd84:	29 d0                	sub    eax,edx
  80bd86:	89 05 f4 e9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e9f4],eax        # 42a780 <tokptr>
    if(c)
  80bd8c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bd90:	74 06                	je     80bd98 <strtok+0x155>
        return ptr;
  80bd92:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd96:	eb 05                	jmp    80bd9d <strtok+0x15a>
    else
        return (void*)0;
  80bd98:	b8 00 00 00 00       	mov    eax,0x0
}
  80bd9d:	c9                   	leave  
  80bd9e:	c3                   	ret    

000000000080bd9f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80bd9f:	f3 0f 1e fa          	endbr64 
  80bda3:	55                   	push   rbp
  80bda4:	48 89 e5             	mov    rbp,rsp
  80bda7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bdab:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80bdaf:	eb 3c                	jmp    80bded <strcmp+0x4e>
		if(*s1>*s2)
  80bdb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bdb5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bdb8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bdbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdbf:	38 c2                	cmp    dl,al
  80bdc1:	7e 07                	jle    80bdca <strcmp+0x2b>
			return 1;
  80bdc3:	b8 01 00 00 00       	mov    eax,0x1
  80bdc8:	eb 52                	jmp    80be1c <strcmp+0x7d>
		else if(*s1<*s2)
  80bdca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bdce:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bdd1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bdd5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdd8:	38 c2                	cmp    dl,al
  80bdda:	7d 07                	jge    80bde3 <strcmp+0x44>
			return -1;
  80bddc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80bde1:	eb 39                	jmp    80be1c <strcmp+0x7d>
		s1++;
  80bde3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80bde8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80bded:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bdf1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdf4:	84 c0                	test   al,al
  80bdf6:	74 0b                	je     80be03 <strcmp+0x64>
  80bdf8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bdfc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdff:	84 c0                	test   al,al
  80be01:	75 ae                	jne    80bdb1 <strcmp+0x12>
	}
	if(*s1==*s2)
  80be03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80be07:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80be0a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80be0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be11:	38 c2                	cmp    dl,al
  80be13:	75 07                	jne    80be1c <strcmp+0x7d>
		return 0;
  80be15:	b8 00 00 00 00       	mov    eax,0x0
  80be1a:	eb 00                	jmp    80be1c <strcmp+0x7d>
}
  80be1c:	5d                   	pop    rbp
  80be1d:	c3                   	ret    

000000000080be1e <strlen>:

int strlen(char *str)
{
  80be1e:	f3 0f 1e fa          	endbr64 
  80be22:	55                   	push   rbp
  80be23:	48 89 e5             	mov    rbp,rsp
  80be26:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80be2a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80be31:	eb 09                	jmp    80be3c <strlen+0x1e>
  80be33:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80be38:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80be3c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be43:	84 c0                	test   al,al
  80be45:	75 ec                	jne    80be33 <strlen+0x15>
    return l;
  80be47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80be4a:	5d                   	pop    rbp
  80be4b:	c3                   	ret    

000000000080be4c <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80be4c:	f3 0f 1e fa          	endbr64 
  80be50:	55                   	push   rbp
  80be51:	48 89 e5             	mov    rbp,rsp
  80be54:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80be5b:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80be62:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80be69:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80be70:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80be77:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80be7e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80be85:	84 c0                	test   al,al
  80be87:	74 20                	je     80bea9 <sprintf+0x5d>
  80be89:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80be8d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80be91:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80be95:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80be99:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80be9d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80bea1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80bea5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80bea9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80beb0:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80beb7:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bebe:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80bec5:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80becc:	00 00 00 
    while (*pstr!='\n')
  80becf:	eb 39                	jmp    80bf0a <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80bed1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bed8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bedb:	3c 25                	cmp    al,0x25
  80bedd:	75 15                	jne    80bef4 <sprintf+0xa8>
  80bedf:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80bee6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bee9:	3c 25                	cmp    al,0x25
  80beeb:	74 07                	je     80bef4 <sprintf+0xa8>
            argnum++;
  80beed:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80bef4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80befb:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80bf02:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bf09:	01 
    while (*pstr!='\n')
  80bf0a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf11:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf14:	3c 0a                	cmp    al,0xa
  80bf16:	75 b9                	jne    80bed1 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80bf18:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80bf1f:	00 00 00 
  80bf22:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80bf29:	00 00 00 
  80bf2c:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80bf30:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80bf37:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80bf3e:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80bf45:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bf4c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80bf53:	e9 e2 01 00 00       	jmp    80c13a <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80bf58:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf62:	3c 25                	cmp    al,0x25
  80bf64:	0f 85 aa 01 00 00    	jne    80c114 <sprintf+0x2c8>
  80bf6a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf71:	48 83 c0 01          	add    rax,0x1
  80bf75:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf78:	84 c0                	test   al,al
  80bf7a:	0f 84 94 01 00 00    	je     80c114 <sprintf+0x2c8>
            pstr++;
  80bf80:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bf87:	01 
            if(*pstr=='x'){
  80bf88:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf92:	3c 78                	cmp    al,0x78
  80bf94:	75 64                	jne    80bffa <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bf96:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bf9c:	83 f8 2f             	cmp    eax,0x2f
  80bf9f:	77 23                	ja     80bfc4 <sprintf+0x178>
  80bfa1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bfa8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bfae:	89 d2                	mov    edx,edx
  80bfb0:	48 01 d0             	add    rax,rdx
  80bfb3:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bfb9:	83 c2 08             	add    edx,0x8
  80bfbc:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bfc2:	eb 12                	jmp    80bfd6 <sprintf+0x18a>
  80bfc4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bfcb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bfcf:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bfd6:	8b 00                	mov    eax,DWORD PTR [rax]
  80bfd8:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80bfde:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80bfe4:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bfeb:	89 d6                	mov    esi,edx
  80bfed:	48 89 c7             	mov    rdi,rax
  80bff0:	e8 4e 02 00 00       	call   80c243 <sprint_hex>
            if(*pstr=='x'){
  80bff5:	e9 38 01 00 00       	jmp    80c132 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80bffa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c001:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c004:	3c 73                	cmp    al,0x73
  80c006:	75 68                	jne    80c070 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80c008:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c00e:	83 f8 2f             	cmp    eax,0x2f
  80c011:	77 23                	ja     80c036 <sprintf+0x1ea>
  80c013:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c01a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c020:	89 d2                	mov    edx,edx
  80c022:	48 01 d0             	add    rax,rdx
  80c025:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c02b:	83 c2 08             	add    edx,0x8
  80c02e:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c034:	eb 12                	jmp    80c048 <sprintf+0x1fc>
  80c036:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c03d:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c041:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c048:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c04b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80c052:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80c059:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c060:	48 89 d6             	mov    rsi,rdx
  80c063:	48 89 c7             	mov    rdi,rax
  80c066:	e8 5a 02 00 00       	call   80c2c5 <sprintn>
            if(*pstr=='x'){
  80c06b:	e9 c2 00 00 00       	jmp    80c132 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80c070:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c077:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c07a:	3c 64                	cmp    al,0x64
  80c07c:	75 66                	jne    80c0e4 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80c07e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c084:	83 f8 2f             	cmp    eax,0x2f
  80c087:	77 23                	ja     80c0ac <sprintf+0x260>
  80c089:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c090:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c096:	89 d2                	mov    edx,edx
  80c098:	48 01 d0             	add    rax,rdx
  80c09b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c0a1:	83 c2 08             	add    edx,0x8
  80c0a4:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c0aa:	eb 12                	jmp    80c0be <sprintf+0x272>
  80c0ac:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c0b3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c0b7:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c0be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0c1:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80c0c8:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80c0cf:	89 c2                	mov    edx,eax
  80c0d1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c0d8:	89 d6                	mov    esi,edx
  80c0da:	48 89 c7             	mov    rdi,rax
  80c0dd:	e8 ad 00 00 00       	call   80c18f <sprint_decimal>
            if(*pstr=='x'){
  80c0e2:	eb 4e                	jmp    80c132 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80c0e4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c0eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c0ee:	3c 63                	cmp    al,0x63
  80c0f0:	75 02                	jne    80c0f4 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80c0f2:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80c0f4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c0fb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c0fe:	0f be d0             	movsx  edx,al
  80c101:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c108:	89 d6                	mov    esi,edx
  80c10a:	48 89 c7             	mov    rdi,rax
  80c10d:	e8 3e 00 00 00       	call   80c150 <sprintchar>
            if(*pstr=='x'){
  80c112:	eb 1e                	jmp    80c132 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80c114:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c11b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c11e:	0f be d0             	movsx  edx,al
  80c121:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c128:	89 d6                	mov    esi,edx
  80c12a:	48 89 c7             	mov    rdi,rax
  80c12d:	e8 1e 00 00 00       	call   80c150 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80c132:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80c139:	01 
  80c13a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c141:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c144:	84 c0                	test   al,al
  80c146:	0f 85 0c fe ff ff    	jne    80bf58 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80c14c:	90                   	nop
  80c14d:	90                   	nop
  80c14e:	c9                   	leave  
  80c14f:	c3                   	ret    

000000000080c150 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80c150:	f3 0f 1e fa          	endbr64 
  80c154:	55                   	push   rbp
  80c155:	48 89 e5             	mov    rbp,rsp
  80c158:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c15c:	89 f0                	mov    eax,esi
  80c15e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80c161:	eb 05                	jmp    80c168 <sprintchar+0x18>
        dist++;
  80c163:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80c168:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c16c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c16f:	84 c0                	test   al,al
  80c171:	75 f0                	jne    80c163 <sprintchar+0x13>
    *dist++=c;
  80c173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c177:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c17b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80c17f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80c183:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80c185:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c189:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80c18c:	90                   	nop
  80c18d:	5d                   	pop    rbp
  80c18e:	c3                   	ret    

000000000080c18f <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80c18f:	f3 0f 1e fa          	endbr64 
  80c193:	55                   	push   rbp
  80c194:	48 89 e5             	mov    rbp,rsp
  80c197:	48 83 ec 30          	sub    rsp,0x30
  80c19b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c19f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80c1a2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80c1a9:	eb 65                	jmp    80c210 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80c1ab:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80c1ae:	48 63 c2             	movsxd rax,edx
  80c1b1:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80c1b8:	48 c1 e8 20          	shr    rax,0x20
  80c1bc:	c1 f8 02             	sar    eax,0x2
  80c1bf:	89 d6                	mov    esi,edx
  80c1c1:	c1 fe 1f             	sar    esi,0x1f
  80c1c4:	29 f0                	sub    eax,esi
  80c1c6:	89 c1                	mov    ecx,eax
  80c1c8:	89 c8                	mov    eax,ecx
  80c1ca:	c1 e0 02             	shl    eax,0x2
  80c1cd:	01 c8                	add    eax,ecx
  80c1cf:	01 c0                	add    eax,eax
  80c1d1:	89 d1                	mov    ecx,edx
  80c1d3:	29 c1                	sub    ecx,eax
  80c1d5:	89 c8                	mov    eax,ecx
  80c1d7:	83 c0 30             	add    eax,0x30
  80c1da:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80c1dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c1e0:	8d 50 01             	lea    edx,[rax+0x1]
  80c1e3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c1e6:	48 98                	cdqe   
  80c1e8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c1ec:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80c1f0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c1f3:	48 63 d0             	movsxd rdx,eax
  80c1f6:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80c1fd:	48 c1 ea 20          	shr    rdx,0x20
  80c201:	c1 fa 02             	sar    edx,0x2
  80c204:	c1 f8 1f             	sar    eax,0x1f
  80c207:	89 c1                	mov    ecx,eax
  80c209:	89 d0                	mov    eax,edx
  80c20b:	29 c8                	sub    eax,ecx
  80c20d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80c210:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c213:	83 f8 0f             	cmp    eax,0xf
  80c216:	76 93                	jbe    80c1ab <sprint_decimal+0x1c>
    }
    while(p>0)
  80c218:	eb 1f                	jmp    80c239 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80c21a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c21e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c221:	48 98                	cdqe   
  80c223:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80c228:	0f be d0             	movsx  edx,al
  80c22b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c22f:	89 d6                	mov    esi,edx
  80c231:	48 89 c7             	mov    rdi,rax
  80c234:	e8 17 ff ff ff       	call   80c150 <sprintchar>
    while(p>0)
  80c239:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c23d:	7f db                	jg     80c21a <sprint_decimal+0x8b>
    }
}
  80c23f:	90                   	nop
  80c240:	90                   	nop
  80c241:	c9                   	leave  
  80c242:	c3                   	ret    

000000000080c243 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80c243:	f3 0f 1e fa          	endbr64 
  80c247:	55                   	push   rbp
  80c248:	48 89 e5             	mov    rbp,rsp
  80c24b:	48 83 ec 20          	sub    rsp,0x20
  80c24f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c253:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80c256:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80c25d:	eb 35                	jmp    80c294 <sprint_hex+0x51>
        unsigned char a=c%16;
  80c25f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c262:	83 e0 0f             	and    eax,0xf
  80c265:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80c268:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80c26c:	76 06                	jbe    80c274 <sprint_hex+0x31>
  80c26e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80c272:	eb 04                	jmp    80c278 <sprint_hex+0x35>
        else a+='0';
  80c274:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80c278:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c27b:	8d 50 01             	lea    edx,[rax+0x1]
  80c27e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c281:	48 98                	cdqe   
  80c283:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c287:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80c28b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c28e:	c1 e8 04             	shr    eax,0x4
  80c291:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80c294:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80c298:	7e c5                	jle    80c25f <sprint_hex+0x1c>
    }
    while(p>0)
  80c29a:	eb 1f                	jmp    80c2bb <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80c29c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c2a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c2a3:	48 98                	cdqe   
  80c2a5:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80c2aa:	0f be d0             	movsx  edx,al
  80c2ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2b1:	89 d6                	mov    esi,edx
  80c2b3:	48 89 c7             	mov    rdi,rax
  80c2b6:	e8 95 fe ff ff       	call   80c150 <sprintchar>
    while(p>0)
  80c2bb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c2bf:	7f db                	jg     80c29c <sprint_hex+0x59>
    }
}
  80c2c1:	90                   	nop
  80c2c2:	90                   	nop
  80c2c3:	c9                   	leave  
  80c2c4:	c3                   	ret    

000000000080c2c5 <sprintn>:
void sprintn(char *dist,char *str)
{
  80c2c5:	f3 0f 1e fa          	endbr64 
  80c2c9:	55                   	push   rbp
  80c2ca:	48 89 e5             	mov    rbp,rsp
  80c2cd:	48 83 ec 10          	sub    rsp,0x10
  80c2d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c2d5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80c2d9:	eb 20                	jmp    80c2fb <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80c2db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c2df:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c2e3:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80c2e7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c2ea:	0f be d0             	movsx  edx,al
  80c2ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2f1:	89 d6                	mov    esi,edx
  80c2f3:	48 89 c7             	mov    rdi,rax
  80c2f6:	e8 55 fe ff ff       	call   80c150 <sprintchar>
    while(*str!='\0')
  80c2fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c2ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c302:	84 c0                	test   al,al
  80c304:	75 d5                	jne    80c2db <sprintn+0x16>
    }
  80c306:	90                   	nop
  80c307:	90                   	nop
  80c308:	c9                   	leave  
  80c309:	c3                   	ret    
  80c30a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080c310 <create_zero>:
  80c310:	e8 af 75 ff ff       	call   8038c4 <req_proc>
  80c315:	83 f8 ff             	cmp    eax,0xffffffff
  80c318:	74 0c                	je     80c326 <create_zero.retu>
  80c31a:	e8 9e 76 ff ff       	call   8039bd <set_proc>
  80c31f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80c323:	83 c4 40             	add    esp,0x40

000000000080c326 <create_zero.retu>:
  80c326:	c3                   	ret    

000000000080c327 <fill_desc>:
  80c327:	55                   	push   rbp
  80c328:	48 89 e5             	mov    rbp,rsp
  80c32b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80c32f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80c333:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80c337:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80c33b:	be 7a c4 80 00       	mov    esi,0x80c47a
  80c340:	c7 04 25 7a c4 80 00 	mov    DWORD PTR ds:0x80c47a,0x0
  80c347:	00 00 00 00 
  80c34b:	c7 04 25 7e c4 80 00 	mov    DWORD PTR ds:0x80c47e,0x0
  80c352:	00 00 00 00 
  80c356:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80c35a:	c1 e9 10             	shr    ecx,0x10
  80c35d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80c362:	c1 ea 10             	shr    edx,0x10
  80c365:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80c369:	66 c1 ea 08          	shr    dx,0x8
  80c36d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80c371:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80c376:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80c37a:	c1 e1 08             	shl    ecx,0x8
  80c37d:	09 cf                	or     edi,ecx
  80c37f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80c383:	8b 14 25 7a c4 80 00 	mov    edx,DWORD PTR ds:0x80c47a
  80c38a:	67 89 10             	mov    DWORD PTR [eax],edx
  80c38d:	8b 14 25 7e c4 80 00 	mov    edx,DWORD PTR ds:0x80c47e
  80c394:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80c398:	c9                   	leave  
  80c399:	c3                   	ret    

000000000080c39a <switch_proc_asm>:
  80c39a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80c3a0:	66 89 04 25 b8 c3 80 	mov    WORD PTR ds:0x80c3b8,ax
  80c3a7:	00 
  80c3a8:	c7 04 25 b4 c3 80 00 	mov    DWORD PTR ds:0x80c3b4,0x0
  80c3af:	00 00 00 00 

000000000080c3b3 <switch_proc_asm.ljmp>:
  80c3b3:	ea                   	(bad)  
  80c3b4:	00 00                	add    BYTE PTR [rax],al
  80c3b6:	00 00                	add    BYTE PTR [rax],al
  80c3b8:	00 00                	add    BYTE PTR [rax],al
  80c3ba:	c3                   	ret    

000000000080c3bb <switch_to_old>:
  80c3bb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80c3c0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80c3c4:	bf 2c c4 80 00       	mov    edi,0x80c42c
  80c3c9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80c3cd:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80c3d1:	89 c1                	mov    ecx,eax
  80c3d3:	83 e9 04             	sub    ecx,0x4
  80c3d6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80c3d9:	50                   	push   rax
  80c3da:	89 f5                	mov    ebp,esi
  80c3dc:	83 c5 28             	add    ebp,0x28
  80c3df:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3e3:	50                   	push   rax
  80c3e4:	83 c5 04             	add    ebp,0x4
  80c3e7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3eb:	50                   	push   rax
  80c3ec:	83 c5 04             	add    ebp,0x4
  80c3ef:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3f3:	50                   	push   rax
  80c3f4:	83 c5 04             	add    ebp,0x4
  80c3f7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3fb:	50                   	push   rax
  80c3fc:	83 c5 04             	add    ebp,0x4
  80c3ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c403:	50                   	push   rax
  80c404:	83 c5 04             	add    ebp,0x4
  80c407:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c40b:	50                   	push   rax
  80c40c:	83 c5 04             	add    ebp,0x4
  80c40f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c413:	50                   	push   rax
  80c414:	83 c5 04             	add    ebp,0x4
  80c417:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c41b:	50                   	push   rax
  80c41c:	83 c5 04             	add    ebp,0x4
  80c41f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80c423:	0f 22 d8             	mov    cr3,rax
  80c426:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80c42a:	50                   	push   rax
  80c42b:	5c                   	pop    rsp

000000000080c42c <switch_to_old.leap>:
  80c42c:	ea                   	(bad)  
  80c42d:	00 00                	add    BYTE PTR [rax],al
  80c42f:	00 00                	add    BYTE PTR [rax],al
  80c431:	08 00                	or     BYTE PTR [rax],al

000000000080c433 <save_context>:
  80c433:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80c438:	83 c0 44             	add    eax,0x44
  80c43b:	b9 08 00 00 00       	mov    ecx,0x8
  80c440:	89 e7                	mov    edi,esp

000000000080c442 <save_context.loops>:
  80c442:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80c445:	67 89 10             	mov    DWORD PTR [eax],edx
  80c448:	83 c7 04             	add    edi,0x4
  80c44b:	83 e8 04             	sub    eax,0x4
  80c44e:	e2 f2                	loop   80c442 <save_context.loops>
  80c450:	5b                   	pop    rbx
  80c451:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80c456:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80c45a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80c45f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80c463:	c3                   	ret    

000000000080c464 <move_to_user_mode>:
  80c464:	66 b8 20 00          	mov    ax,0x20
  80c468:	8e d8                	mov    ds,eax
  80c46a:	8e c0                	mov    es,eax
  80c46c:	8e e8                	mov    gs,eax
  80c46e:	6a 20                	push   0x20
  80c470:	54                   	push   rsp
  80c471:	6a 18                	push   0x18
  80c473:	68 79 c4 80 00       	push   0x80c479
  80c478:	cf                   	iret   

000000000080c479 <move_to_user_mode.done>:
  80c479:	c3                   	ret    

000000000080c47a <desc>:
	...

000000000080c482 <ret_sys_call>:
  80c482:	58                   	pop    rax
  80c483:	8e d8                	mov    ds,eax
  80c485:	58                   	pop    rax
  80c486:	8e c0                	mov    es,eax
  80c488:	41 5f                	pop    r15
  80c48a:	41 5e                	pop    r14
  80c48c:	41 5d                	pop    r13
  80c48e:	41 5c                	pop    r12
  80c490:	41 5b                	pop    r11
  80c492:	41 5a                	pop    r10
  80c494:	41 59                	pop    r9
  80c496:	41 58                	pop    r8
  80c498:	5e                   	pop    rsi
  80c499:	5f                   	pop    rdi
  80c49a:	5a                   	pop    rdx
  80c49b:	59                   	pop    rcx
  80c49c:	5b                   	pop    rbx
  80c49d:	58                   	pop    rax

000000000080c49e <tmp>:
  80c49e:	48 0f 07             	sysretq 

000000000080c4a1 <ret_normal_proc>:
  80c4a1:	58                   	pop    rax
  80c4a2:	8e d8                	mov    ds,eax
  80c4a4:	58                   	pop    rax
  80c4a5:	8e c0                	mov    es,eax
  80c4a7:	41 5f                	pop    r15
  80c4a9:	41 5e                	pop    r14
  80c4ab:	41 5d                	pop    r13
  80c4ad:	41 5c                	pop    r12
  80c4af:	41 5b                	pop    r11
  80c4b1:	41 5a                	pop    r10
  80c4b3:	41 59                	pop    r9
  80c4b5:	41 58                	pop    r8
  80c4b7:	5e                   	pop    rsi
  80c4b8:	5f                   	pop    rdi
  80c4b9:	5a                   	pop    rdx
  80c4ba:	59                   	pop    rcx
  80c4bb:	5b                   	pop    rbx
  80c4bc:	58                   	pop    rax
  80c4bd:	c3                   	ret    
