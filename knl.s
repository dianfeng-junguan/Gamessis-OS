
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
  800194:	b8 2c 13 80 00       	mov    eax,0x80132c
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
  800217:	b8 1a 8e 80 00       	mov    eax,0x808e1a
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 e0 67 80 00       	mov    eax,0x8067e0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 10 9e 80 00       	mov    eax,0x809e10
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 b0 72 80 00       	mov    eax,0x8072b0
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
  800291:	e8 ba 62 00 00       	call   806550 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 ab 62 00 00       	call   806550 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 9c 62 00 00       	call   806550 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 8d 62 00 00       	call   806550 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 7e 62 00 00       	call   806550 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 6f 62 00 00       	call   806550 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 60 62 00 00       	call   806550 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 51 62 00 00       	call   806550 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 81 62 00 00       	call   80658a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 b0 72 80 00       	mov    eax,0x8072b0
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
  800350:	48 8b 15 89 cf 00 00 	mov    rdx,QWORD PTR [rip+0xcf89]        # 80d2e0 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 65 cf 00 00 	mov    rcx,QWORD PTR [rip+0xcf65]        # 80d2e0 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 45 cf 00 00 	mov    rdx,QWORD PTR [rip+0xcf45]        # 80d2e0 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 2d cf 00 00 	mov    rdx,QWORD PTR [rip+0xcf2d]        # 80d2e0 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 10 cf 00 00 	mov    rdx,QWORD PTR [rip+0xcf10]        # 80d2e0 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 f6 ce 00 00 	mov    rdx,QWORD PTR [rip+0xcef6]        # 80d2e0 <idt>
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
  80040d:	e8 6c 61 00 00       	call   80657e <eoi>
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
  800427:	e8 52 61 00 00       	call   80657e <eoi>
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
  800441:	e8 38 61 00 00       	call   80657e <eoi>
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
  80045b:	e8 1e 61 00 00       	call   80657e <eoi>
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
  800475:	e8 04 61 00 00       	call   80657e <eoi>
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
  80048f:	e8 ea 60 00 00       	call   80657e <eoi>
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
  8004a8:	e8 d1 60 00 00       	call   80657e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 f2 60 00 00       	call   8065a9 <report_back_trace_of_err>
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
  8004cd:	e8 ac 60 00 00       	call   80657e <eoi>
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
  8004e7:	e8 92 60 00 00       	call   80657e <eoi>
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
  800500:	e8 79 60 00 00       	call   80657e <eoi>
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
  800519:	e8 60 60 00 00       	call   80657e <eoi>
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
  800533:	e8 46 60 00 00       	call   80657e <eoi>
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
  80054d:	e8 2c 60 00 00       	call   80657e <eoi>
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
  800571:	e8 08 60 00 00       	call   80657e <eoi>
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
  80058e:	e8 eb 5f 00 00       	call   80657e <eoi>
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
  8005d1:	48 05 60 4b 81 00    	add    rax,0x814b60
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 b7 29 00 00       	call   802fa1 <reg_device>
  8005ea:	e9 33 02 00 00       	jmp    800822 <syscall+0x288>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 07 34 00 00       	call   803a00 <dispose_device>
  8005f9:	e9 24 02 00 00       	jmp    800822 <syscall+0x288>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 7e 2c 00 00       	call   803289 <reg_driver>
  80060b:	e9 12 02 00 00       	jmp    800822 <syscall+0x288>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 81 34 00 00       	call   803a9e <dispose_driver>
  80061d:	e9 00 02 00 00       	jmp    800822 <syscall+0x288>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 70 31 00 00       	call   8037a9 <call_drv_func>
  800639:	e9 e4 01 00 00       	jmp    800822 <syscall+0x288>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 a5 12 00 00       	call   8018f5 <req_page_at>
  800650:	e9 cd 01 00 00       	jmp    800822 <syscall+0x288>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 5f 10 00 00       	call   8016c1 <free_page>
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
  800682:	e8 7a 46 00 00       	call   804d01 <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 5d 44 00 00       	call   804af3 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 29 13 00 00       	call   8019ce <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 f6 7a 00 00       	call   8081b0 <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 7e 80 00 00       	call   808747 <sys_close>
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
  8006e4:	e8 16 81 00 00       	call   8087ff <sys_read>
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
  800704:	e8 a6 81 00 00       	call   8088af <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 3b 82 00 00       	call   80895f <sys_lseek>
  800724:	e9 f9 00 00 00       	jmp    800822 <syscall+0x288>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 7f 16 00 00       	call   801db2 <sys_tell>
  800733:	e9 ea 00 00 00       	jmp    800822 <syscall+0x288>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 58 15 00 00       	call   801ca7 <reg_vol>
  80074f:	e9 ce 00 00 00       	jmp    800822 <syscall+0x288>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 28 15 00 00       	call   801c8b <free_vol>
  800763:	e9 ba 00 00 00       	jmp    800822 <syscall+0x288>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 ba 60 00 00       	call   806834 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 50 45 00 00       	call   804cd9 <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 90 62 00 00       	call   806a2b <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 82 13 00 00       	call   801b2c <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 13 47 00 00       	call   804ec9 <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 95 48 00 00       	call   805057 <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 61 87 00 00       	call   808f2f <sys_analyse_key>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 f9 2b 00 00       	call   8033d9 <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 7d 4b 00 00       	call   805364 <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 35 61 00 00       	call   806936 <sys_execve>
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
  80081b:	e8 4b 2c 00 00       	call   80346b <sys_operate_dev>
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
#include "syscall.h"
#include "fcntl.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  80084e:	f3 0f 1e fa          	endbr64 
  800852:	55                   	push   rbp
  800853:	48 89 e5             	mov    rbp,rsp
  800856:	48 83 ec 70          	sub    rsp,0x70
  80085a:	89 7d 9c             	mov    DWORD PTR [rbp-0x64],edi
  80085d:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi

    struct multiboot_header* mbi=0ul;
  800861:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800868:	00 
    mbi=(struct multiboot_header*)addr;
  800869:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80086d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800871:	b8 00 00 00 00       	mov    eax,0x0
  800876:	e8 7d 03 00 00       	call   800bf8 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  80087b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80087f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800882:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  800885:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
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
  8008a7:	48 8b 04 c5 e0 4e 81 	mov    rax,QWORD PTR [rax*8+0x814ee0]
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
  8008bb:	e8 d4 08 00 00       	call   801194 <set_high_mem_base>
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
  8008f1:	e8 b5 08 00 00       	call   8011ab <set_mem_area>
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
  800929:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  80092d:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x40000000
  800934:	40 
			set_framebuffer(*tagfb);
  800935:	48 83 ec 08          	sub    rsp,0x8
  800939:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80093d:	ff 70 20             	push   QWORD PTR [rax+0x20]
  800940:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800943:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800946:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800949:	ff 30                	push   QWORD PTR [rax]
  80094b:	e8 7b 6b 00 00       	call   8074cb <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 ca 69 00 00       	call   807328 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  80095e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
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
  80098d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800991:	48 83 c0 22          	add    rax,0x22
  800995:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

				color = 0;
  800999:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
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
  8009bf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
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
  8009e2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
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
  800a08:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  800a0c:	48 01 d0             	add    rax,rdx
  800a0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a12:	0f b6 c8             	movzx  ecx,al
  800a15:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a18:	48 89 d0             	mov    rax,rdx
  800a1b:	48 01 c0             	add    rax,rax
  800a1e:	48 01 c2             	add    rdx,rax
  800a21:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  800a25:	48 01 d0             	add    rax,rdx
  800a28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a2b:	0f b6 c0             	movzx  eax,al
  800a2e:	0f af c1             	imul   eax,ecx
  800a31:	01 c6                	add    esi,eax
  800a33:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a36:	48 89 d0             	mov    rax,rdx
  800a39:	48 01 c0             	add    rax,rax
  800a3c:	48 01 c2             	add    rdx,rax
  800a3f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  800a43:	48 01 d0             	add    rax,rdx
  800a46:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a4a:	0f b6 c8             	movzx  ecx,al
  800a4d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a50:	48 89 d0             	mov    rax,rdx
  800a53:	48 01 c0             	add    rax,rax
  800a56:	48 01 c2             	add    rdx,rax
  800a59:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  800a5d:	48 01 d0             	add    rax,rdx
  800a60:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a64:	0f b6 c0             	movzx  eax,al
  800a67:	0f af c1             	imul   eax,ecx
  800a6a:	01 f0                	add    eax,esi
  800a6c:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
					if (distance < best_distance)
  800a6f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  800a72:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a75:	73 0c                	jae    800a83 <main+0x235>
					{
						color = i;
  800a77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a7a:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
						best_distance = distance;
  800a7d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  800a80:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a83:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a87:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
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
  800a9d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800aa1:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800aa5:	0f b6 c0             	movzx  eax,al
  800aa8:	ba 01 00 00 00       	mov    edx,0x1
  800aad:	89 c1                	mov    ecx,eax
  800aaf:	d3 e2                	shl    edx,cl
  800ab1:	89 d0                	mov    eax,edx
  800ab3:	8d 50 ff             	lea    edx,[rax-0x1]
  800ab6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800aba:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800abe:	0f b6 c0             	movzx  eax,al
  800ac1:	89 c1                	mov    ecx,eax
  800ac3:	d3 e2                	shl    edx,cl
  800ac5:	89 d0                	mov    eax,edx
  800ac7:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
				break;
  800aca:	eb 11                	jmp    800add <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800acc:	c7 45 bc 5c 01 00 00 	mov    DWORD PTR [rbp-0x44],0x15c
				break;
  800ad3:	eb 08                	jmp    800add <main+0x28f>

			default:
				color = 0xffffffff;
  800ad5:	c7 45 bc ff ff ff ff 	mov    DWORD PTR [rbp-0x44],0xffffffff
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
  800b22:	e8 ce 68 00 00       	call   8073f5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf 88 4e 81 00       	mov    edi,0x814e88
  800b2c:	e8 5d 6d 00 00       	call   80788e <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf a5 4e 81 00       	mov    edi,0x814ea5
  800b40:	e8 49 6d 00 00       	call   80788e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 2b 09 00 00       	call   80147a <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 01 bc 00 00       	call   80c75a <init_com>
    comprintf("\rgamessis os loaded.\r\n");
  800b59:	bf b2 4e 81 00       	mov    edi,0x814eb2
  800b5e:	b8 00 00 00 00       	mov    eax,0x0
  800b63:	e8 35 bd 00 00       	call   80c89d <comprintf>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 17 06 00 00       	call   801189 <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 51 5a 00 00       	call   8065cd <init_gdt>
    init_proc();
  800b7c:	b8 00 00 00 00       	mov    eax,0x0
  800b81:	e8 ec 32 00 00       	call   803e72 <init_proc>
    mount_rootfs();
  800b86:	b8 00 00 00 00       	mov    eax,0x0
  800b8b:	e8 94 74 00 00       	call   808024 <mount_rootfs>
    init_devman();
  800b90:	b8 00 00 00 00       	mov    eax,0x0
  800b95:	e8 67 1d 00 00       	call   802901 <init_devman>
    sti();
  800b9a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 25 b6 00 00       	call   80c1ca <DISK1_FAT32_FS_init>

    int fd= sys_open("/dev/console",O_WRONLY);
  800ba5:	be 01 00 00 00       	mov    esi,0x1
  800baa:	bf c9 4e 81 00       	mov    edi,0x814ec9
  800baf:	e8 fc 75 00 00       	call   8081b0 <sys_open>
  800bb4:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    sys_write(fd,"try",4);
  800bb7:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  800bba:	ba 04 00 00 00       	mov    edx,0x4
  800bbf:	be d6 4e 81 00       	mov    esi,0x814ed6
  800bc4:	89 c7                	mov    edi,eax
  800bc6:	e8 e4 7c 00 00       	call   8088af <sys_write>
    sys_close(fd);
  800bcb:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  800bce:	89 c7                	mov    edi,eax
  800bd0:	e8 72 7b 00 00       	call   808747 <sys_close>
    //自带驱动
    //init_tty();
    init_kb();
  800bd5:	b8 00 00 00 00       	mov    eax,0x0
  800bda:	e8 1c 82 00 00       	call   808dfb <init_kb>
//    init_disk();


    manage_proc_lock=0;
  800bdf:	c7 05 ff c6 00 00 00 	mov    DWORD PTR [rip+0xc6ff],0x0        # 80d2e8 <manage_proc_lock>
  800be6:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c= sys_analyse_key();
  800be9:	b8 00 00 00 00       	mov    eax,0x0
  800bee:	e8 3c 83 00 00       	call   808f2f <sys_analyse_key>
  800bf3:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
    {
  800bf6:	eb f1                	jmp    800be9 <main+0x39b>

0000000000800bf8 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800bf8:	f3 0f 1e fa          	endbr64 
  800bfc:	55                   	push   rbp
  800bfd:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800c00:	48 c7 05 f5 f3 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff3f5],0xb8000        # 400000 <video>
  800c07:	00 80 0b 00 
    xpos=0;
  800c0b:	c7 05 f3 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3f3],0x0        # 400008 <xpos>
  800c12:	00 00 00 
    ypos=0;
  800c15:	c7 05 ed f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3ed],0x0        # 40000c <ypos>
  800c1c:	00 00 00 
}
  800c1f:	90                   	nop
  800c20:	5d                   	pop    rbp
  800c21:	c3                   	ret    

0000000000800c22 <itoa>:

void itoa (char *buf, int base, int d)
{
  800c22:	f3 0f 1e fa          	endbr64 
  800c26:	55                   	push   rbp
  800c27:	48 89 e5             	mov    rbp,rsp
  800c2a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800c2e:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800c31:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800c34:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c38:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c3c:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c3f:	48 98                	cdqe   
  800c41:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c45:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c4c:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c50:	75 27                	jne    800c79 <itoa+0x57>
  800c52:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c56:	79 21                	jns    800c79 <itoa+0x57>
    {
        *p++ = '-';
  800c58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c5c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c60:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c64:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c67:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c6c:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c6f:	f7 d8                	neg    eax
  800c71:	48 98                	cdqe   
  800c73:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c77:	eb 0d                	jmp    800c86 <itoa+0x64>
    }
    else if (base == 'x')
  800c79:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c7d:	75 07                	jne    800c86 <itoa+0x64>
        divisor = 16;
  800c7f:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c86:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c89:	48 63 c8             	movsxd rcx,eax
  800c8c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c90:	ba 00 00 00 00       	mov    edx,0x0
  800c95:	48 f7 f1             	div    rcx
  800c98:	48 89 d0             	mov    rax,rdx
  800c9b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c9e:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800ca2:	7f 0a                	jg     800cae <itoa+0x8c>
  800ca4:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800ca7:	83 c0 30             	add    eax,0x30
  800caa:	89 c1                	mov    ecx,eax
  800cac:	eb 08                	jmp    800cb6 <itoa+0x94>
  800cae:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cb1:	83 c0 57             	add    eax,0x57
  800cb4:	89 c1                	mov    ecx,eax
  800cb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cba:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800cbe:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800cc2:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800cc4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800cc7:	48 63 f0             	movsxd rsi,eax
  800cca:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800cce:	ba 00 00 00 00       	mov    edx,0x0
  800cd3:	48 f7 f6             	div    rsi
  800cd6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800cda:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800cdf:	75 a5                	jne    800c86 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800ce1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ce5:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800ce8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800cec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800cf0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cf4:	48 83 e8 01          	sub    rax,0x1
  800cf8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800cfc:	eb 2b                	jmp    800d29 <itoa+0x107>
    {
        char tmp = *p1;
  800cfe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d02:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d05:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800d08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d0c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800d0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d13:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800d15:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d19:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800d1d:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800d1f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800d24:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800d29:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d2d:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800d31:	72 cb                	jb     800cfe <itoa+0xdc>
    }
}
  800d33:	90                   	nop
  800d34:	90                   	nop
  800d35:	5d                   	pop    rbp
  800d36:	c3                   	ret    

0000000000800d37 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800d37:	f3 0f 1e fa          	endbr64 
  800d3b:	55                   	push   rbp
  800d3c:	48 89 e5             	mov    rbp,rsp
  800d3f:	48 83 ec 20          	sub    rsp,0x20
  800d43:	89 f8                	mov    eax,edi
  800d45:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d48:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d4c:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d4f:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d53:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d57:	48 89 c7             	mov    rdi,rax
  800d5a:	e8 2f 6b 00 00       	call   80788e <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d5f:	c9                   	leave  
  800d60:	c3                   	ret    

0000000000800d61 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format,...)
{
  800d61:	f3 0f 1e fa          	endbr64 
  800d65:	55                   	push   rbp
  800d66:	48 89 e5             	mov    rbp,rsp
  800d69:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  800d70:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  800d77:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d7e:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d85:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d8c:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d93:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d9a:	84 c0                	test   al,al
  800d9c:	74 20                	je     800dbe <printf+0x5d>
  800d9e:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800da2:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800da6:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800daa:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800dae:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800db2:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800db6:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800dba:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    if(strlen(format)>=1024)
  800dbe:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  800dc5:	48 89 c7             	mov    rdi,rax
  800dc8:	e8 60 be 00 00       	call   80cc2d <strlen>
  800dcd:	3d ff 03 00 00       	cmp    eax,0x3ff
  800dd2:	0f 8f 97 00 00 00    	jg     800e6f <printf+0x10e>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  800dd8:	b8 00 00 00 00       	mov    eax,0x0
  800ddd:	e8 55 04 00 00       	call   801237 <vmalloc>
  800de2:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    va_list vargs;
    va_start(vargs,format);
  800de9:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
  800df0:	00 00 00 
  800df3:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
  800dfa:	00 00 00 
  800dfd:	48 8d 45 10          	lea    rax,[rbp+0x10]
  800e01:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
  800e08:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  800e0f:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    sprintf(tmp,format,vargs);
  800e16:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  800e1d:	48 8b 8d 28 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd8]
  800e24:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e2b:	48 89 ce             	mov    rsi,rcx
  800e2e:	48 89 c7             	mov    rdi,rax
  800e31:	b8 00 00 00 00       	mov    eax,0x0
  800e36:	e8 20 be 00 00       	call   80cc5b <sprintf>
    va_end(vargs);
    print(tmp);
  800e3b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e42:	48 89 c7             	mov    rdi,rax
  800e45:	e8 44 6a 00 00       	call   80788e <print>
    comprintf(tmp);
  800e4a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e51:	48 89 c7             	mov    rdi,rax
  800e54:	b8 00 00 00 00       	mov    eax,0x0
  800e59:	e8 3f ba 00 00       	call   80c89d <comprintf>
    vmfree(tmp);
  800e5e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e65:	48 89 c7             	mov    rdi,rax
  800e68:	e8 59 04 00 00       	call   8012c6 <vmfree>
  800e6d:	eb 01                	jmp    800e70 <printf+0x10f>
        return;//一次性输出不了太长
  800e6f:	90                   	nop
//                putchar (*((int *) arg++));
//                break;
//            }
//        }
//    }
}
  800e70:	c9                   	leave  
  800e71:	c3                   	ret    

0000000000800e72 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e72:	f3 0f 1e fa          	endbr64 
  800e76:	55                   	push   rbp
  800e77:	48 89 e5             	mov    rbp,rsp
  800e7a:	48 83 ec 40          	sub    rsp,0x40
  800e7e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e82:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e86:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e89:	48 8b 15 70 c4 00 00 	mov    rdx,QWORD PTR [rip+0xc470]        # 80d300 <pml4>
  800e90:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e94:	48 c1 e8 27          	shr    rax,0x27
  800e98:	48 c1 e0 03          	shl    rax,0x3
  800e9c:	48 01 d0             	add    rax,rdx
  800e9f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ea2:	b0 00                	mov    al,0x0
  800ea4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800ea8:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800eaf:	00 00 00 
  800eb2:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800eb6:	48 c1 e8 1e          	shr    rax,0x1e
  800eba:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ebd:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ec0:	48 98                	cdqe   
  800ec2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ec9:	00 
  800eca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ece:	48 01 d0             	add    rax,rdx
  800ed1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ed4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800ed8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800edc:	83 e0 01             	and    eax,0x1
  800edf:	48 85 c0             	test   rax,rax
  800ee2:	75 45                	jne    800f29 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800ee4:	b8 00 00 00 00       	mov    eax,0x0
  800ee9:	e8 49 03 00 00       	call   801237 <vmalloc>
  800eee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800ef2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ef6:	ba 00 10 00 00       	mov    edx,0x1000
  800efb:	be 00 00 00 00       	mov    esi,0x0
  800f00:	48 89 c7             	mov    rdi,rax
  800f03:	e8 b7 ba 00 00       	call   80c9bf <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f08:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f0b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f0f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f12:	48 98                	cdqe   
  800f14:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f1b:	00 
  800f1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f20:	48 01 f0             	add    rax,rsi
  800f23:	48 09 ca             	or     rdx,rcx
  800f26:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f2d:	b0 00                	mov    al,0x0
  800f2f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f33:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f37:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f3c:	48 c1 e8 15          	shr    rax,0x15
  800f40:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f47:	00 
  800f48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f4c:	48 01 d0             	add    rax,rdx
  800f4f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f52:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f5a:	83 e0 01             	and    eax,0x1
  800f5d:	48 85 c0             	test   rax,rax
  800f60:	75 4d                	jne    800faf <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f62:	b8 00 00 00 00       	mov    eax,0x0
  800f67:	e8 cb 02 00 00       	call   801237 <vmalloc>
  800f6c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800f70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f74:	ba 00 10 00 00       	mov    edx,0x1000
  800f79:	be 00 00 00 00       	mov    esi,0x0
  800f7e:	48 89 c7             	mov    rdi,rax
  800f81:	e8 39 ba 00 00       	call   80c9bf <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f86:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f89:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f8d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f91:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f96:	48 c1 e8 15          	shr    rax,0x15
  800f9a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fa1:	00 
  800fa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fa6:	48 01 f0             	add    rax,rsi
  800fa9:	48 09 ca             	or     rdx,rcx
  800fac:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800faf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fb3:	b0 00                	mov    al,0x0
  800fb5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800fb9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fbc:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800fc0:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800fc6:	48 c1 ea 0c          	shr    rdx,0xc
  800fca:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fd1:	00 
  800fd2:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fd6:	48 01 ca             	add    rdx,rcx
  800fd9:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fdd:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800fe0:	b8 00 00 00 00       	mov    eax,0x0
}
  800fe5:	c9                   	leave  
  800fe6:	c3                   	ret    

0000000000800fe7 <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  800fe7:	f3 0f 1e fa          	endbr64 
  800feb:	55                   	push   rbp
  800fec:	48 89 e5             	mov    rbp,rsp
  800fef:	48 83 ec 40          	sub    rsp,0x40
  800ff3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ff7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ffb:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  800ffe:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  801002:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801006:	48 c1 e8 27          	shr    rax,0x27
  80100a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801011:	00 
  801012:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  801016:	48 01 d0             	add    rax,rdx
  801019:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80101c:	b0 00                	mov    al,0x0
  80101e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  801022:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  801029:	00 00 00 
  80102c:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  801030:	48 c1 e8 1e          	shr    rax,0x1e
  801034:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  801037:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80103a:	48 98                	cdqe   
  80103c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801043:	00 
  801044:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801048:	48 01 d0             	add    rax,rdx
  80104b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80104e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  801052:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801056:	83 e0 01             	and    eax,0x1
  801059:	48 85 c0             	test   rax,rax
  80105c:	75 45                	jne    8010a3 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  80105e:	b8 00 00 00 00       	mov    eax,0x0
  801063:	e8 cf 01 00 00       	call   801237 <vmalloc>
  801068:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  80106c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801070:	ba 00 10 00 00       	mov    edx,0x1000
  801075:	be 00 00 00 00       	mov    esi,0x0
  80107a:	48 89 c7             	mov    rdi,rax
  80107d:	e8 3d b9 00 00       	call   80c9bf <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  801082:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801085:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  801089:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80108c:	48 98                	cdqe   
  80108e:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801095:	00 
  801096:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80109a:	48 01 f0             	add    rax,rsi
  80109d:	48 09 ca             	or     rdx,rcx
  8010a0:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  8010a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010a7:	b0 00                	mov    al,0x0
  8010a9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  8010ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8010b1:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8010b6:	48 c1 e8 15          	shr    rax,0x15
  8010ba:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010c1:	00 
  8010c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010c6:	48 01 d0             	add    rax,rdx
  8010c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010cc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  8010d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010d4:	83 e0 01             	and    eax,0x1
  8010d7:	48 85 c0             	test   rax,rax
  8010da:	75 4d                	jne    801129 <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  8010dc:	b8 00 00 00 00       	mov    eax,0x0
  8010e1:	e8 51 01 00 00       	call   801237 <vmalloc>
  8010e6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  8010ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010ee:	ba 00 10 00 00       	mov    edx,0x1000
  8010f3:	be 00 00 00 00       	mov    esi,0x0
  8010f8:	48 89 c7             	mov    rdi,rax
  8010fb:	e8 bf b8 00 00       	call   80c9bf <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801100:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801103:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801107:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80110b:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801110:	48 c1 e8 15          	shr    rax,0x15
  801114:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80111b:	00 
  80111c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801120:	48 01 f0             	add    rax,rsi
  801123:	48 09 ca             	or     rdx,rcx
  801126:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801129:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80112d:	b0 00                	mov    al,0x0
  80112f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  801133:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801136:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80113a:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801140:	48 c1 ea 0c          	shr    rdx,0xc
  801144:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  80114b:	00 
  80114c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801150:	48 01 ca             	add    rdx,rcx
  801153:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801157:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  80115a:	b8 00 00 00 00       	mov    eax,0x0
}
  80115f:	c9                   	leave  
  801160:	c3                   	ret    

0000000000801161 <mdemap>:

stat_t mdemap(addr_t la)
{
  801161:	f3 0f 1e fa          	endbr64 
  801165:	55                   	push   rbp
  801166:	48 89 e5             	mov    rbp,rsp
  801169:	48 83 ec 10          	sub    rsp,0x10
  80116d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801171:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801175:	ba 00 00 00 00       	mov    edx,0x0
  80117a:	48 89 c6             	mov    rsi,rax
  80117d:	bf 00 00 00 00       	mov    edi,0x0
  801182:	e8 eb fc ff ff       	call   800e72 <mmap>
}
  801187:	c9                   	leave  
  801188:	c3                   	ret    

0000000000801189 <init_paging>:
int init_paging()
{
  801189:	f3 0f 1e fa          	endbr64 
  80118d:	55                   	push   rbp
  80118e:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801191:	90                   	nop
  801192:	5d                   	pop    rbp
  801193:	c3                   	ret    

0000000000801194 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801194:	f3 0f 1e fa          	endbr64 
  801198:	55                   	push   rbp
  801199:	48 89 e5             	mov    rbp,rsp
  80119c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  80119f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011a2:	89 05 70 c1 00 00    	mov    DWORD PTR [rip+0xc170],eax        # 80d318 <high_mem_base>
}
  8011a8:	90                   	nop
  8011a9:	5d                   	pop    rbp
  8011aa:	c3                   	ret    

00000000008011ab <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  8011ab:	f3 0f 1e fa          	endbr64 
  8011af:	55                   	push   rbp
  8011b0:	48 89 e5             	mov    rbp,rsp
  8011b3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8011b7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8011bb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8011bf:	8b 05 5b f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff05b]        # 400220 <mmap_t_i>
  8011c5:	48 63 d0             	movsxd rdx,eax
  8011c8:	48 89 d0             	mov    rax,rdx
  8011cb:	48 01 c0             	add    rax,rax
  8011ce:	48 01 d0             	add    rax,rdx
  8011d1:	48 c1 e0 03          	shl    rax,0x3
  8011d5:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8011dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011e0:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8011e3:	8b 05 37 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff037]        # 400220 <mmap_t_i>
  8011e9:	48 63 d0             	movsxd rdx,eax
  8011ec:	48 89 d0             	mov    rax,rdx
  8011ef:	48 01 c0             	add    rax,rax
  8011f2:	48 01 d0             	add    rax,rdx
  8011f5:	48 c1 e0 03          	shl    rax,0x3
  8011f9:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801200:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801204:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801207:	8b 05 13 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff013]        # 400220 <mmap_t_i>
  80120d:	8d 50 01             	lea    edx,[rax+0x1]
  801210:	89 15 0a f0 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff00a],edx        # 400220 <mmap_t_i>
  801216:	48 63 d0             	movsxd rdx,eax
  801219:	48 89 d0             	mov    rax,rdx
  80121c:	48 01 c0             	add    rax,rax
  80121f:	48 01 d0             	add    rax,rdx
  801222:	48 c1 e0 03          	shl    rax,0x3
  801226:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  80122d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801231:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  801234:	90                   	nop
  801235:	5d                   	pop    rbp
  801236:	c3                   	ret    

0000000000801237 <vmalloc>:
addr_t vmalloc()
{
  801237:	f3 0f 1e fa          	endbr64 
  80123b:	55                   	push   rbp
  80123c:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80123f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801246:	eb 76                	jmp    8012be <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801248:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80124f:	eb 63                	jmp    8012b4 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801251:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801254:	48 98                	cdqe   
  801256:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80125d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801260:	be 01 00 00 00       	mov    esi,0x1
  801265:	89 c1                	mov    ecx,eax
  801267:	d3 e6                	shl    esi,cl
  801269:	89 f0                	mov    eax,esi
  80126b:	21 d0                	and    eax,edx
  80126d:	85 c0                	test   eax,eax
  80126f:	75 3f                	jne    8012b0 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801271:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801274:	48 98                	cdqe   
  801276:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80127d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801280:	be 01 00 00 00       	mov    esi,0x1
  801285:	89 c1                	mov    ecx,eax
  801287:	d3 e6                	shl    esi,cl
  801289:	89 f0                	mov    eax,esi
  80128b:	09 c2                	or     edx,eax
  80128d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801290:	48 98                	cdqe   
  801292:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801299:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80129c:	c1 e0 05             	shl    eax,0x5
  80129f:	89 c2                	mov    edx,eax
  8012a1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012a4:	01 d0                	add    eax,edx
  8012a6:	83 c0 20             	add    eax,0x20
  8012a9:	c1 e0 0c             	shl    eax,0xc
  8012ac:	48 98                	cdqe   
  8012ae:	eb 14                	jmp    8012c4 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8012b0:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8012b4:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8012b8:	7e 97                	jle    801251 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012ba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8012be:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8012c2:	7e 84                	jle    801248 <vmalloc+0x11>
            }
        }
    }
}
  8012c4:	5d                   	pop    rbp
  8012c5:	c3                   	ret    

00000000008012c6 <vmfree>:

int vmfree(addr_t ptr)
{
  8012c6:	f3 0f 1e fa          	endbr64 
  8012ca:	55                   	push   rbp
  8012cb:	48 89 e5             	mov    rbp,rsp
  8012ce:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8012d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012d6:	48 c1 e8 0c          	shr    rax,0xc
  8012da:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8012dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012e0:	8d 50 1f             	lea    edx,[rax+0x1f]
  8012e3:	85 c0                	test   eax,eax
  8012e5:	0f 48 c2             	cmovs  eax,edx
  8012e8:	c1 f8 05             	sar    eax,0x5
  8012eb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8012ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012f1:	99                   	cdq    
  8012f2:	c1 ea 1b             	shr    edx,0x1b
  8012f5:	01 d0                	add    eax,edx
  8012f7:	83 e0 1f             	and    eax,0x1f
  8012fa:	29 d0                	sub    eax,edx
  8012fc:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8012ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801302:	48 98                	cdqe   
  801304:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80130b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80130e:	be 01 00 00 00       	mov    esi,0x1
  801313:	89 c1                	mov    ecx,eax
  801315:	d3 e6                	shl    esi,cl
  801317:	89 f0                	mov    eax,esi
  801319:	f7 d0                	not    eax
  80131b:	21 c2                	and    edx,eax
  80131d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801320:	48 98                	cdqe   
  801322:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801329:	90                   	nop
  80132a:	5d                   	pop    rbp
  80132b:	c3                   	ret    

000000000080132c <page_err>:
void page_err(){
  80132c:	f3 0f 1e fa          	endbr64 
  801330:	55                   	push   rbp
  801331:	48 89 e5             	mov    rbp,rsp
  801334:	41 54                	push   r12
  801336:	53                   	push   rbx
  801337:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  80133b:	fa                   	cli    
    print("page err\n");
  80133c:	bf 28 4f 81 00       	mov    edi,0x814f28
  801341:	e8 48 65 00 00       	call   80788e <print>
    unsigned long err_code=0,l_addr=0;
  801346:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80134d:	00 
  80134e:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801355:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801356:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80135a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80135e:	0f 20 d0             	mov    rax,cr2
  801361:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801365:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801369:	83 e0 01             	and    eax,0x1
  80136c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80136f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801373:	75 41                	jne    8013b6 <page_err+0x8a>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  801375:	48 8b 05 64 42 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc14264]        # 4155e0 <current>
  80137c:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  801383:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801387:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80138d:	49 89 c4             	mov    r12,rax
  801390:	b8 00 00 00 00       	mov    eax,0x0
  801395:	e8 57 02 00 00       	call   8015f1 <req_a_page>
  80139a:	89 c7                	mov    edi,eax
  80139c:	e8 3f 04 00 00       	call   8017e0 <get_phyaddr>
  8013a1:	48 98                	cdqe   
  8013a3:	48 89 d9             	mov    rcx,rbx
  8013a6:	ba 07 00 00 00       	mov    edx,0x7
  8013ab:	4c 89 e6             	mov    rsi,r12
  8013ae:	48 89 c7             	mov    rdi,rax
  8013b1:	e8 31 fc ff ff       	call   800fe7 <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8013b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013ba:	83 e0 02             	and    eax,0x2
  8013bd:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8013c0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013c4:	74 0c                	je     8013d2 <page_err+0xa6>
  8013c6:	bf 32 4f 81 00       	mov    edi,0x814f32
  8013cb:	e8 be 64 00 00       	call   80788e <print>
  8013d0:	eb 0a                	jmp    8013dc <page_err+0xb0>
    p=err_code&4;
  8013d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013d6:	83 e0 04             	and    eax,0x4
  8013d9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8013dc:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013e0:	75 0c                	jne    8013ee <page_err+0xc2>
  8013e2:	bf 40 4f 81 00       	mov    edi,0x814f40
  8013e7:	e8 a2 64 00 00       	call   80788e <print>
  8013ec:	eb 0a                	jmp    8013f8 <page_err+0xcc>
    p=err_code&16;
  8013ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013f2:	83 e0 10             	and    eax,0x10
  8013f5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8013f8:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013fc:	74 0a                	je     801408 <page_err+0xdc>
  8013fe:	bf 58 4f 81 00       	mov    edi,0x814f58
  801403:	e8 86 64 00 00       	call   80788e <print>
    unsigned int addr=0;
  801408:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  80140f:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801412:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801415:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801419:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80141c:	89 c6                	mov    esi,eax
  80141e:	bf 78 4f 81 00       	mov    edi,0x814f78
  801423:	b8 00 00 00 00       	mov    eax,0x0
  801428:	e8 34 f9 ff ff       	call   800d61 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  80142d:	48 8b 15 ac 70 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc070ac]        # 4084e0 <task>
  801434:	8b 05 32 42 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc14232]        # 41566c <cur_proc>
  80143a:	48 98                	cdqe   
  80143c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  801443:	48 01 d0             	add    rax,rdx
  801446:	8b 00                	mov    eax,DWORD PTR [rax]
  801448:	83 f8 01             	cmp    eax,0x1
  80144b:	75 11                	jne    80145e <page_err+0x132>
    {
        printf("sys died. please reboot.\n");
  80144d:	bf 9a 4f 81 00       	mov    edi,0x814f9a
  801452:	b8 00 00 00 00       	mov    eax,0x0
  801457:	e8 05 f9 ff ff       	call   800d61 <printf>
        asm volatile("jmp .");
  80145c:	eb fe                	jmp    80145c <page_err+0x130>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80145e:	b8 00 00 00 00       	mov    eax,0x0
  801463:	e8 16 51 00 00       	call   80657e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  801468:	fb                   	sti    
  801469:	c9                   	leave  
  80146a:	48 83 c4 08          	add    rsp,0x8
  80146e:	48 cf                	iretq  
}
  801470:	90                   	nop
  801471:	48 83 c4 20          	add    rsp,0x20
  801475:	5b                   	pop    rbx
  801476:	41 5c                	pop    r12
  801478:	5d                   	pop    rbp
  801479:	c3                   	ret    

000000000080147a <init_memory>:
void init_memory()
{
  80147a:	f3 0f 1e fa          	endbr64 
  80147e:	55                   	push   rbp
  80147f:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801482:	8b 05 98 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed98]        # 400220 <mmap_t_i>
  801488:	83 e8 01             	sub    eax,0x1
  80148b:	48 63 d0             	movsxd rdx,eax
  80148e:	48 89 d0             	mov    rax,rdx
  801491:	48 01 c0             	add    rax,rax
  801494:	48 01 d0             	add    rax,rdx
  801497:	48 c1 e0 03          	shl    rax,0x3
  80149b:	48 05 40 00 40 00    	add    rax,0x400040
  8014a1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8014a4:	8b 05 76 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed76]        # 400220 <mmap_t_i>
  8014aa:	83 e8 01             	sub    eax,0x1
  8014ad:	48 63 d0             	movsxd rdx,eax
  8014b0:	48 89 d0             	mov    rax,rdx
  8014b3:	48 01 c0             	add    rax,rax
  8014b6:	48 01 d0             	add    rax,rdx
  8014b9:	48 c1 e0 03          	shl    rax,0x3
  8014bd:	48 05 48 00 40 00    	add    rax,0x400048
  8014c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8014c6:	48 01 c8             	add    rax,rcx
  8014c9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8014cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8014d1:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8014d8:	48 85 c0             	test   rax,rax
  8014db:	48 0f 48 c2          	cmovs  rax,rdx
  8014df:	48 c1 f8 0c          	sar    rax,0xc
  8014e3:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8014e6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8014e9:	8d 50 1f             	lea    edx,[rax+0x1f]
  8014ec:	85 c0                	test   eax,eax
  8014ee:	0f 48 c2             	cmovs  eax,edx
  8014f1:	c1 f8 05             	sar    eax,0x5
  8014f4:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8014f7:	48 c7 05 1e eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb1e],0xc00000        # 400020 <page_map>
  8014fe:	00 00 c0 00 
    int* p=page_map;
  801502:	48 8b 05 17 eb bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfeb17]        # 400020 <page_map>
  801509:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80150d:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801514:	00 
    for(int i=0;i<mmap_t_i;i++){
  801515:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80151c:	e9 91 00 00 00       	jmp    8015b2 <init_memory+0x138>
        int cont=0;
  801521:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801528:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80152b:	48 63 d0             	movsxd rdx,eax
  80152e:	48 89 d0             	mov    rax,rdx
  801531:	48 01 c0             	add    rax,rax
  801534:	48 01 d0             	add    rax,rdx
  801537:	48 c1 e0 03          	shl    rax,0x3
  80153b:	48 05 50 00 40 00    	add    rax,0x400050
  801541:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801544:	48 83 f8 01          	cmp    rax,0x1
  801548:	74 07                	je     801551 <init_memory+0xd7>
            cont=-1;
  80154a:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801551:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801558:	eb 15                	jmp    80156f <init_memory+0xf5>
            *(p++)=cont;
  80155a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80155e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801562:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  801566:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801569:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80156b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80156f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801572:	48 63 c8             	movsxd rcx,eax
  801575:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801578:	48 63 d0             	movsxd rdx,eax
  80157b:	48 89 d0             	mov    rax,rdx
  80157e:	48 01 c0             	add    rax,rax
  801581:	48 01 d0             	add    rax,rdx
  801584:	48 c1 e0 03          	shl    rax,0x3
  801588:	48 05 48 00 40 00    	add    rax,0x400048
  80158e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801591:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801598:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80159f:	ff 00 00 
  8015a2:	48 21 d0             	and    rax,rdx
  8015a5:	48 c1 e8 11          	shr    rax,0x11
  8015a9:	48 39 c1             	cmp    rcx,rax
  8015ac:	72 ac                	jb     80155a <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  8015ae:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8015b2:	8b 05 68 ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfec68]        # 400220 <mmap_t_i>
  8015b8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8015bb:	0f 8c 60 ff ff ff    	jl     801521 <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8015c1:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8015c8:	eb 1d                	jmp    8015e7 <init_memory+0x16d>
        page_map[i]=0xffffffff;
  8015ca:	48 8b 15 4f ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea4f]        # 400020 <page_map>
  8015d1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8015d4:	48 98                	cdqe   
  8015d6:	48 c1 e0 02          	shl    rax,0x2
  8015da:	48 01 d0             	add    rax,rdx
  8015dd:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8015e3:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8015e7:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8015eb:	7e dd                	jle    8015ca <init_memory+0x150>
    }
}
  8015ed:	90                   	nop
  8015ee:	90                   	nop
  8015ef:	5d                   	pop    rbp
  8015f0:	c3                   	ret    

00000000008015f1 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8015f1:	f3 0f 1e fa          	endbr64 
  8015f5:	55                   	push   rbp
  8015f6:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8015f9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801600:	e9 b0 00 00 00       	jmp    8016b5 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801605:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80160c:	e9 96 00 00 00       	jmp    8016a7 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801611:	48 8b 15 08 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea08]        # 400020 <page_map>
  801618:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80161b:	48 98                	cdqe   
  80161d:	48 c1 e0 02          	shl    rax,0x2
  801621:	48 01 d0             	add    rax,rdx
  801624:	8b 10                	mov    edx,DWORD PTR [rax]
  801626:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801629:	be 01 00 00 00       	mov    esi,0x1
  80162e:	89 c1                	mov    ecx,eax
  801630:	d3 e6                	shl    esi,cl
  801632:	89 f0                	mov    eax,esi
  801634:	21 d0                	and    eax,edx
  801636:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801639:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80163c:	c1 e0 05             	shl    eax,0x5
  80163f:	89 c2                	mov    edx,eax
  801641:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801644:	01 d0                	add    eax,edx
  801646:	c1 e0 0c             	shl    eax,0xc
  801649:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80164e:	7e 53                	jle    8016a3 <req_a_page+0xb2>
  801650:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801654:	75 4d                	jne    8016a3 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801656:	48 8b 15 c3 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9c3]        # 400020 <page_map>
  80165d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801660:	48 98                	cdqe   
  801662:	48 c1 e0 02          	shl    rax,0x2
  801666:	48 01 d0             	add    rax,rdx
  801669:	8b 10                	mov    edx,DWORD PTR [rax]
  80166b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80166e:	be 01 00 00 00       	mov    esi,0x1
  801673:	89 c1                	mov    ecx,eax
  801675:	d3 e6                	shl    esi,cl
  801677:	89 f0                	mov    eax,esi
  801679:	89 c6                	mov    esi,eax
  80167b:	48 8b 0d 9e e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe99e]        # 400020 <page_map>
  801682:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801685:	48 98                	cdqe   
  801687:	48 c1 e0 02          	shl    rax,0x2
  80168b:	48 01 c8             	add    rax,rcx
  80168e:	09 f2                	or     edx,esi
  801690:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801692:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801695:	c1 e0 05             	shl    eax,0x5
  801698:	89 c2                	mov    edx,eax
  80169a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80169d:	01 d0                	add    eax,edx
  80169f:	48 98                	cdqe   
  8016a1:	eb 1c                	jmp    8016bf <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8016a3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8016a7:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8016ab:	0f 8e 60 ff ff ff    	jle    801611 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8016b1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8016b5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8016b9:	0f 8e 46 ff ff ff    	jle    801605 <req_a_page+0x14>

            }
        }
    }
}
  8016bf:	5d                   	pop    rbp
  8016c0:	c3                   	ret    

00000000008016c1 <free_page>:

int free_page(char *paddr){
  8016c1:	f3 0f 1e fa          	endbr64 
  8016c5:	55                   	push   rbp
  8016c6:	48 89 e5             	mov    rbp,rsp
  8016c9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8016cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016d7:	85 c0                	test   eax,eax
  8016d9:	0f 48 c2             	cmovs  eax,edx
  8016dc:	c1 f8 0c             	sar    eax,0xc
  8016df:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8016e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016e5:	8d 50 1f             	lea    edx,[rax+0x1f]
  8016e8:	85 c0                	test   eax,eax
  8016ea:	0f 48 c2             	cmovs  eax,edx
  8016ed:	c1 f8 05             	sar    eax,0x5
  8016f0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8016f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016f6:	99                   	cdq    
  8016f7:	c1 ea 1b             	shr    edx,0x1b
  8016fa:	01 d0                	add    eax,edx
  8016fc:	83 e0 1f             	and    eax,0x1f
  8016ff:	29 d0                	sub    eax,edx
  801701:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801704:	48 8b 15 15 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe915]        # 400020 <page_map>
  80170b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80170e:	48 98                	cdqe   
  801710:	48 c1 e0 02          	shl    rax,0x2
  801714:	48 01 d0             	add    rax,rdx
  801717:	8b 10                	mov    edx,DWORD PTR [rax]
  801719:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80171c:	be 01 00 00 00       	mov    esi,0x1
  801721:	89 c1                	mov    ecx,eax
  801723:	d3 e6                	shl    esi,cl
  801725:	89 f0                	mov    eax,esi
  801727:	f7 d0                	not    eax
  801729:	89 c6                	mov    esi,eax
  80172b:	48 8b 0d ee e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe8ee]        # 400020 <page_map>
  801732:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801735:	48 98                	cdqe   
  801737:	48 c1 e0 02          	shl    rax,0x2
  80173b:	48 01 c8             	add    rax,rcx
  80173e:	21 f2                	and    edx,esi
  801740:	89 10                	mov    DWORD PTR [rax],edx
}
  801742:	90                   	nop
  801743:	5d                   	pop    rbp
  801744:	c3                   	ret    

0000000000801745 <free_pages_at>:

int free_pages_at(int base,int pgn){
  801745:	f3 0f 1e fa          	endbr64 
  801749:	55                   	push   rbp
  80174a:	48 89 e5             	mov    rbp,rsp
  80174d:	48 83 ec 18          	sub    rsp,0x18
  801751:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801754:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  801757:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80175e:	eb 1b                	jmp    80177b <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  801760:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801763:	c1 e0 0c             	shl    eax,0xc
  801766:	89 c2                	mov    edx,eax
  801768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80176b:	01 d0                	add    eax,edx
  80176d:	48 98                	cdqe   
  80176f:	48 89 c7             	mov    rdi,rax
  801772:	e8 4a ff ff ff       	call   8016c1 <free_page>
    for(int i=0;i<pgn;i++){
  801777:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80177b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80177e:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801781:	7c dd                	jl     801760 <free_pages_at+0x1b>
    }
}
  801783:	90                   	nop
  801784:	c9                   	leave  
  801785:	c3                   	ret    

0000000000801786 <check_page>:
int check_page(int num){
  801786:	f3 0f 1e fa          	endbr64 
  80178a:	55                   	push   rbp
  80178b:	48 89 e5             	mov    rbp,rsp
  80178e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801791:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801794:	8d 50 1f             	lea    edx,[rax+0x1f]
  801797:	85 c0                	test   eax,eax
  801799:	0f 48 c2             	cmovs  eax,edx
  80179c:	c1 f8 05             	sar    eax,0x5
  80179f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8017a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017a5:	99                   	cdq    
  8017a6:	c1 ea 1b             	shr    edx,0x1b
  8017a9:	01 d0                	add    eax,edx
  8017ab:	83 e0 1f             	and    eax,0x1f
  8017ae:	29 d0                	sub    eax,edx
  8017b0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8017b3:	48 8b 15 66 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe866]        # 400020 <page_map>
  8017ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017bd:	48 98                	cdqe   
  8017bf:	48 c1 e0 02          	shl    rax,0x2
  8017c3:	48 01 d0             	add    rax,rdx
  8017c6:	8b 10                	mov    edx,DWORD PTR [rax]
  8017c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017cb:	be 01 00 00 00       	mov    esi,0x1
  8017d0:	89 c1                	mov    ecx,eax
  8017d2:	d3 e6                	shl    esi,cl
  8017d4:	89 f0                	mov    eax,esi
  8017d6:	21 d0                	and    eax,edx
  8017d8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8017db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8017de:	5d                   	pop    rbp
  8017df:	c3                   	ret    

00000000008017e0 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8017e0:	f3 0f 1e fa          	endbr64 
  8017e4:	55                   	push   rbp
  8017e5:	48 89 e5             	mov    rbp,rsp
  8017e8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8017eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017ee:	c1 e0 0c             	shl    eax,0xc
}
  8017f1:	5d                   	pop    rbp
  8017f2:	c3                   	ret    

00000000008017f3 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8017f3:	f3 0f 1e fa          	endbr64 
  8017f7:	55                   	push   rbp
  8017f8:	48 89 e5             	mov    rbp,rsp
  8017fb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8017ff:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801802:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801805:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801809:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801810:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801814:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801817:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80181a:	89 c0                	mov    eax,eax
  80181c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801821:	48 09 c2             	or     rdx,rax
  801824:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801828:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  80182b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80182f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801832:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801835:	48 98                	cdqe   
  801837:	48 09 c2             	or     rdx,rax
  80183a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80183e:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801841:	90                   	nop
  801842:	5d                   	pop    rbp
  801843:	c3                   	ret    

0000000000801844 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801844:	f3 0f 1e fa          	endbr64 
  801848:	55                   	push   rbp
  801849:	48 89 e5             	mov    rbp,rsp
  80184c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801850:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801853:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801856:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80185a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801861:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801865:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801868:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80186b:	0c 81                	or     al,0x81
  80186d:	89 c0                	mov    eax,eax
  80186f:	48 09 c2             	or     rdx,rax
  801872:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801876:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801879:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80187c:	25 00 00 00 c0       	and    eax,0xc0000000
  801881:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801884:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801888:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80188b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80188e:	48 09 c2             	or     rdx,rax
  801891:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801895:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801898:	90                   	nop
  801899:	5d                   	pop    rbp
  80189a:	c3                   	ret    

000000000080189b <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  80189b:	f3 0f 1e fa          	endbr64 
  80189f:	55                   	push   rbp
  8018a0:	48 89 e5             	mov    rbp,rsp
  8018a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018a7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018aa:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  8018ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018b1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  8018b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018bf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018c2:	0d 81 10 00 00       	or     eax,0x1081
  8018c7:	48 98                	cdqe   
  8018c9:	48 09 c2             	or     rdx,rax
  8018cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018d0:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8018d3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018d6:	25 00 00 c0 ff       	and    eax,0xffc00000
  8018db:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8018de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018e2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018e8:	48 09 c2             	or     rdx,rax
  8018eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018ef:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018f2:	90                   	nop
  8018f3:	5d                   	pop    rbp
  8018f4:	c3                   	ret    

00000000008018f5 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8018f5:	f3 0f 1e fa          	endbr64 
  8018f9:	55                   	push   rbp
  8018fa:	48 89 e5             	mov    rbp,rsp
  8018fd:	48 83 ec 20          	sub    rsp,0x20
  801901:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801905:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801908:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80190d:	75 18                	jne    801927 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80190f:	b8 00 00 00 00       	mov    eax,0x0
  801914:	e8 d8 fc ff ff       	call   8015f1 <req_a_page>
  801919:	89 c7                	mov    edi,eax
  80191b:	e8 c0 fe ff ff       	call   8017e0 <get_phyaddr>
  801920:	48 98                	cdqe   
  801922:	e9 a5 00 00 00       	jmp    8019cc <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801927:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80192b:	89 c2                	mov    edx,eax
  80192d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801930:	89 c6                	mov    esi,eax
  801932:	89 d7                	mov    edi,edx
  801934:	e8 52 01 00 00       	call   801a8b <is_pgs_ava>
  801939:	85 c0                	test   eax,eax
  80193b:	75 0c                	jne    801949 <req_page_at+0x54>
  80193d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801944:	e9 83 00 00 00       	jmp    8019cc <req_page_at+0xd7>
    int pgni=base/4096;
  801949:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80194d:	48 c1 e8 0c          	shr    rax,0xc
  801951:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801954:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801957:	8d 50 1f             	lea    edx,[rax+0x1f]
  80195a:	85 c0                	test   eax,eax
  80195c:	0f 48 c2             	cmovs  eax,edx
  80195f:	c1 f8 05             	sar    eax,0x5
  801962:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801965:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801968:	99                   	cdq    
  801969:	c1 ea 1b             	shr    edx,0x1b
  80196c:	01 d0                	add    eax,edx
  80196e:	83 e0 1f             	and    eax,0x1f
  801971:	29 d0                	sub    eax,edx
  801973:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801976:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80197d:	eb 40                	jmp    8019bf <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80197f:	48 8b 15 9a e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe69a]        # 400020 <page_map>
  801986:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801989:	48 98                	cdqe   
  80198b:	48 c1 e0 02          	shl    rax,0x2
  80198f:	48 01 d0             	add    rax,rdx
  801992:	8b 10                	mov    edx,DWORD PTR [rax]
  801994:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801997:	be 01 00 00 00       	mov    esi,0x1
  80199c:	89 c1                	mov    ecx,eax
  80199e:	d3 e6                	shl    esi,cl
  8019a0:	89 f0                	mov    eax,esi
  8019a2:	89 c6                	mov    esi,eax
  8019a4:	48 8b 0d 75 e6 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe675]        # 400020 <page_map>
  8019ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019ae:	48 98                	cdqe   
  8019b0:	48 c1 e0 02          	shl    rax,0x2
  8019b4:	48 01 c8             	add    rax,rcx
  8019b7:	09 f2                	or     edx,esi
  8019b9:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8019bb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c2:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8019c5:	7c b8                	jl     80197f <req_page_at+0x8a>
    }
    return 0;
  8019c7:	b8 00 00 00 00       	mov    eax,0x0

}
  8019cc:	c9                   	leave  
  8019cd:	c3                   	ret    

00000000008019ce <chk_vm>:
int chk_vm(int base, int pgn)
{
  8019ce:	f3 0f 1e fa          	endbr64 
  8019d2:	55                   	push   rbp
  8019d3:	48 89 e5             	mov    rbp,rsp
  8019d6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8019d9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8019dc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8019e3:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8019e4:	0f 20 d8             	mov    rax,cr3
  8019e7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8019eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019ee:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  8019f4:	85 c0                	test   eax,eax
  8019f6:	0f 48 c2             	cmovs  eax,edx
  8019f9:	c1 f8 15             	sar    eax,0x15
  8019fc:	48 98                	cdqe   
  8019fe:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a05:	00 
  801a06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a0a:	48 01 d0             	add    rax,rdx
  801a0d:	8b 00                	mov    eax,DWORD PTR [rax]
  801a0f:	89 c0                	mov    eax,eax
  801a11:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a16:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a1a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a1d:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a23:	85 c0                	test   eax,eax
  801a25:	0f 48 c2             	cmovs  eax,edx
  801a28:	c1 f8 15             	sar    eax,0x15
  801a2b:	48 98                	cdqe   
  801a2d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a34:	00 
  801a35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a39:	48 01 d0             	add    rax,rdx
  801a3c:	8b 00                	mov    eax,DWORD PTR [rax]
  801a3e:	83 e0 01             	and    eax,0x1
  801a41:	85 c0                	test   eax,eax
  801a43:	74 38                	je     801a7d <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801a45:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a48:	99                   	cdq    
  801a49:	c1 ea 0b             	shr    edx,0xb
  801a4c:	01 d0                	add    eax,edx
  801a4e:	25 ff ff 1f 00       	and    eax,0x1fffff
  801a53:	29 d0                	sub    eax,edx
  801a55:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a5b:	85 c0                	test   eax,eax
  801a5d:	0f 48 c2             	cmovs  eax,edx
  801a60:	c1 f8 0c             	sar    eax,0xc
  801a63:	48 98                	cdqe   
  801a65:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a6c:	00 
  801a6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801a71:	48 01 d0             	add    rax,rdx
  801a74:	8b 00                	mov    eax,DWORD PTR [rax]
  801a76:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a79:	85 c0                	test   eax,eax
  801a7b:	75 07                	jne    801a84 <chk_vm+0xb6>
    {
        return -1;
  801a7d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801a82:	eb 05                	jmp    801a89 <chk_vm+0xbb>
    }
    return 0;
  801a84:	b8 00 00 00 00       	mov    eax,0x0
}
  801a89:	5d                   	pop    rbp
  801a8a:	c3                   	ret    

0000000000801a8b <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801a8b:	f3 0f 1e fa          	endbr64 
  801a8f:	55                   	push   rbp
  801a90:	48 89 e5             	mov    rbp,rsp
  801a93:	48 83 ec 18          	sub    rsp,0x18
  801a97:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a9a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801a9d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aa0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801aa6:	85 c0                	test   eax,eax
  801aa8:	0f 48 c2             	cmovs  eax,edx
  801aab:	c1 f8 0c             	sar    eax,0xc
  801aae:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801ab1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ab8:	eb 1e                	jmp    801ad8 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801aba:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801abd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ac0:	01 d0                	add    eax,edx
  801ac2:	89 c7                	mov    edi,eax
  801ac4:	e8 bd fc ff ff       	call   801786 <check_page>
  801ac9:	85 c0                	test   eax,eax
  801acb:	74 07                	je     801ad4 <is_pgs_ava+0x49>
  801acd:	b8 00 00 00 00       	mov    eax,0x0
  801ad2:	eb 11                	jmp    801ae5 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801ad4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ad8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801adb:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801ade:	7c da                	jl     801aba <is_pgs_ava+0x2f>
    }
    return 1;
  801ae0:	b8 01 00 00 00       	mov    eax,0x1

}
  801ae5:	c9                   	leave  
  801ae6:	c3                   	ret    

0000000000801ae7 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801ae7:	f3 0f 1e fa          	endbr64 
  801aeb:	55                   	push   rbp
  801aec:	48 89 e5             	mov    rbp,rsp
  801aef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801af3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801af7:	c6 05 42 e7 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe742],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801afe:	c6 05 3c e7 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe73c],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b09:	48 89 05 38 e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe738],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b14:	48 89 05 35 e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe735],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b1b:	c7 05 3b e7 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe73b],0x1        # 400260 <vols+0x20>
  801b22:	00 00 00 
    return 0;
  801b25:	b8 00 00 00 00       	mov    eax,0x0
}
  801b2a:	5d                   	pop    rbp
  801b2b:	c3                   	ret    

0000000000801b2c <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801b2c:	f3 0f 1e fa          	endbr64 
  801b30:	55                   	push   rbp
  801b31:	48 89 e5             	mov    rbp,rsp
  801b34:	48 83 ec 20          	sub    rsp,0x20
  801b38:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801b3b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b42:	eb 38                	jmp    801b7c <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b47:	48 98                	cdqe   
  801b49:	48 c1 e0 04          	shl    rax,0x4
  801b4d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b53:	8b 00                	mov    eax,DWORD PTR [rax]
  801b55:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b58:	75 1e                	jne    801b78 <sys_mkfifo+0x4c>
  801b5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b5d:	48 98                	cdqe   
  801b5f:	48 c1 e0 04          	shl    rax,0x4
  801b63:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b69:	8b 00                	mov    eax,DWORD PTR [rax]
  801b6b:	83 f8 01             	cmp    eax,0x1
  801b6e:	75 08                	jne    801b78 <sys_mkfifo+0x4c>
            return i;
  801b70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b73:	e9 a6 00 00 00       	jmp    801c1e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801b78:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b7c:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b80:	7e c2                	jle    801b44 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801b82:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801b89:	e9 81 00 00 00       	jmp    801c0f <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801b8e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b91:	48 98                	cdqe   
  801b93:	48 c1 e0 04          	shl    rax,0x4
  801b97:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b9d:	8b 00                	mov    eax,DWORD PTR [rax]
  801b9f:	85 c0                	test   eax,eax
  801ba1:	75 68                	jne    801c0b <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801ba3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801ba6:	48 98                	cdqe   
  801ba8:	48 c1 e0 04          	shl    rax,0x4
  801bac:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bb2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801bb8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bbb:	48 98                	cdqe   
  801bbd:	48 c1 e0 04          	shl    rax,0x4
  801bc1:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801bc8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bcb:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801bcd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bd0:	48 98                	cdqe   
  801bd2:	48 c1 e0 04          	shl    rax,0x4
  801bd6:	48 05 64 1e 40 00    	add    rax,0x401e64
  801bdc:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801be2:	b8 00 00 00 00       	mov    eax,0x0
  801be7:	e8 05 fa ff ff       	call   8015f1 <req_a_page>
  801bec:	89 c7                	mov    edi,eax
  801bee:	e8 ed fb ff ff       	call   8017e0 <get_phyaddr>
  801bf3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801bf6:	48 63 d2             	movsxd rdx,edx
  801bf9:	48 c1 e2 04          	shl    rdx,0x4
  801bfd:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c04:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c06:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c09:	eb 13                	jmp    801c1e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c0b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c0f:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c13:	0f 8e 75 ff ff ff    	jle    801b8e <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c19:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c1e:	c9                   	leave  
  801c1f:	c3                   	ret    

0000000000801c20 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801c20:	f3 0f 1e fa          	endbr64 
  801c24:	55                   	push   rbp
  801c25:	48 89 e5             	mov    rbp,rsp
  801c28:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801c2b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c32:	eb 4a                	jmp    801c7e <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801c34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c37:	48 98                	cdqe   
  801c39:	48 c1 e0 04          	shl    rax,0x4
  801c3d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801c43:	8b 00                	mov    eax,DWORD PTR [rax]
  801c45:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c48:	75 30                	jne    801c7a <sys_rmfifo+0x5a>
  801c4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c4d:	48 98                	cdqe   
  801c4f:	48 c1 e0 04          	shl    rax,0x4
  801c53:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c59:	8b 00                	mov    eax,DWORD PTR [rax]
  801c5b:	83 f8 01             	cmp    eax,0x1
  801c5e:	75 1a                	jne    801c7a <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801c60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c63:	48 98                	cdqe   
  801c65:	48 c1 e0 04          	shl    rax,0x4
  801c69:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c6f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801c75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c78:	eb 0f                	jmp    801c89 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801c7a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c7e:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801c82:	7e b0                	jle    801c34 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801c84:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c89:	5d                   	pop    rbp
  801c8a:	c3                   	ret    

0000000000801c8b <free_vol>:
int free_vol(int voli)
{
  801c8b:	f3 0f 1e fa          	endbr64 
  801c8f:	55                   	push   rbp
  801c90:	48 89 e5             	mov    rbp,rsp
  801c93:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801c96:	c7 05 c0 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe5c0],0x0        # 400260 <vols+0x20>
  801c9d:	00 00 00 
    return 0;
  801ca0:	b8 00 00 00 00       	mov    eax,0x0
}
  801ca5:	5d                   	pop    rbp
  801ca6:	c3                   	ret    

0000000000801ca7 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801ca7:	f3 0f 1e fa          	endbr64 
  801cab:	55                   	push   rbp
  801cac:	48 89 e5             	mov    rbp,rsp
  801caf:	48 83 ec 20          	sub    rsp,0x20
  801cb3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801cb6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801cb9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801cbd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cc4:	e9 d8 00 00 00       	jmp    801da1 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801cc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ccc:	48 63 d0             	movsxd rdx,eax
  801ccf:	48 89 d0             	mov    rax,rdx
  801cd2:	48 c1 e0 02          	shl    rax,0x2
  801cd6:	48 01 d0             	add    rax,rdx
  801cd9:	48 c1 e0 03          	shl    rax,0x3
  801cdd:	48 05 60 02 40 00    	add    rax,0x400260
  801ce3:	8b 00                	mov    eax,DWORD PTR [rax]
  801ce5:	85 c0                	test   eax,eax
  801ce7:	0f 85 b0 00 00 00    	jne    801d9d <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801ced:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cf0:	48 63 d0             	movsxd rdx,eax
  801cf3:	48 89 d0             	mov    rax,rdx
  801cf6:	48 c1 e0 02          	shl    rax,0x2
  801cfa:	48 01 d0             	add    rax,rdx
  801cfd:	48 c1 e0 03          	shl    rax,0x3
  801d01:	48 05 60 02 40 00    	add    rax,0x400260
  801d07:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d0d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d10:	48 63 d0             	movsxd rdx,eax
  801d13:	48 89 d0             	mov    rax,rdx
  801d16:	48 01 c0             	add    rax,rax
  801d19:	48 01 d0             	add    rax,rdx
  801d1c:	48 c1 e0 03          	shl    rax,0x3
  801d20:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801d27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d2a:	48 63 d0             	movsxd rdx,eax
  801d2d:	48 89 d0             	mov    rax,rdx
  801d30:	48 c1 e0 02          	shl    rax,0x2
  801d34:	48 01 d0             	add    rax,rdx
  801d37:	48 c1 e0 03          	shl    rax,0x3
  801d3b:	48 05 58 02 40 00    	add    rax,0x400258
  801d41:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801d44:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d47:	89 c7                	mov    edi,eax
  801d49:	e8 8d 1d 00 00       	call   803adb <get_drv>
  801d4e:	48 89 c2             	mov    rdx,rax
  801d51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d54:	48 63 c8             	movsxd rcx,eax
  801d57:	48 89 c8             	mov    rax,rcx
  801d5a:	48 c1 e0 02          	shl    rax,0x2
  801d5e:	48 01 c8             	add    rax,rcx
  801d61:	48 c1 e0 03          	shl    rax,0x3
  801d65:	48 05 48 02 40 00    	add    rax,0x400248
  801d6b:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801d6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d71:	48 63 d0             	movsxd rdx,eax
  801d74:	48 89 d0             	mov    rax,rdx
  801d77:	48 c1 e0 02          	shl    rax,0x2
  801d7b:	48 01 d0             	add    rax,rdx
  801d7e:	48 c1 e0 03          	shl    rax,0x3
  801d82:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801d89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801d8d:	48 89 c6             	mov    rsi,rax
  801d90:	48 89 d7             	mov    rdi,rdx
  801d93:	e8 76 ac 00 00       	call   80ca0e <strcpy>
            return i;
  801d98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d9b:	eb 13                	jmp    801db0 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801d9d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801da1:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801da5:	0f 8e 1e ff ff ff    	jle    801cc9 <reg_vol+0x22>
        }
    }
    return -1;
  801dab:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801db0:	c9                   	leave  
  801db1:	c3                   	ret    

0000000000801db2 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801db2:	f3 0f 1e fa          	endbr64 
  801db6:	55                   	push   rbp
  801db7:	48 89 e5             	mov    rbp,rsp
  801dba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801dbd:	48 8b 05 1c 38 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1381c]        # 4155e0 <current>
  801dc4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801dc7:	48 63 d2             	movsxd rdx,edx
  801dca:	48 83 c2 1a          	add    rdx,0x1a
  801dce:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801dd3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801dd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ddb:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801dde:	5d                   	pop    rbp
  801ddf:	c3                   	ret    

0000000000801de0 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801de0:	f3 0f 1e fa          	endbr64 
  801de4:	55                   	push   rbp
  801de5:	48 89 e5             	mov    rbp,rsp
  801de8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801deb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801df2:	eb 3f                	jmp    801e33 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801df4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801df7:	48 63 d0             	movsxd rdx,eax
  801dfa:	48 89 d0             	mov    rax,rdx
  801dfd:	48 01 c0             	add    rax,rax
  801e00:	48 01 d0             	add    rax,rdx
  801e03:	48 c1 e0 05          	shl    rax,0x5
  801e07:	48 05 60 06 40 00    	add    rax,0x400660
  801e0d:	8b 00                	mov    eax,DWORD PTR [rax]
  801e0f:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e12:	75 1b                	jne    801e2f <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e17:	48 63 d0             	movsxd rdx,eax
  801e1a:	48 89 d0             	mov    rax,rdx
  801e1d:	48 01 c0             	add    rax,rax
  801e20:	48 01 d0             	add    rax,rdx
  801e23:	48 c1 e0 05          	shl    rax,0x5
  801e27:	48 05 60 06 40 00    	add    rax,0x400660
  801e2d:	eb 0f                	jmp    801e3e <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e2f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e33:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801e37:	7e bb                	jle    801df4 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801e39:	b8 00 00 00 00       	mov    eax,0x0
}
  801e3e:	5d                   	pop    rbp
  801e3f:	c3                   	ret    

0000000000801e40 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801e40:	f3 0f 1e fa          	endbr64 
  801e44:	55                   	push   rbp
  801e45:	48 89 e5             	mov    rbp,rsp
  801e48:	48 83 ec 10          	sub    rsp,0x10
  801e4c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801e50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e54:	48 89 c7             	mov    rdi,rax
  801e57:	e8 a0 04 00 00       	call   8022fc <wait_on_buf>
    if(bh->b_count==0)return -1;
  801e5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e60:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e64:	84 c0                	test   al,al
  801e66:	75 07                	jne    801e6f <brelse+0x2f>
  801e68:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e6d:	eb 32                	jmp    801ea1 <brelse+0x61>
    bh->b_count--;
  801e6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e73:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e77:	8d 50 ff             	lea    edx,[rax-0x1]
  801e7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e7e:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801e81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e85:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e89:	84 c0                	test   al,al
  801e8b:	75 0f                	jne    801e9c <brelse+0x5c>
        vmfree(bh->b_data);
  801e8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e94:	48 89 c7             	mov    rdi,rax
  801e97:	e8 2a f4 ff ff       	call   8012c6 <vmfree>
    return 0;
  801e9c:	b8 00 00 00 00       	mov    eax,0x0
}
  801ea1:	c9                   	leave  
  801ea2:	c3                   	ret    

0000000000801ea3 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801ea3:	f3 0f 1e fa          	endbr64 
  801ea7:	55                   	push   rbp
  801ea8:	48 89 e5             	mov    rbp,rsp
  801eab:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801eb2:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801eb8:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801ebe:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801ec4:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801eca:	89 d6                	mov    esi,edx
  801ecc:	89 c7                	mov    edi,eax
  801ece:	e8 78 02 00 00       	call   80214b <get_buf>
  801ed3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801ed7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801edc:	75 09                	jne    801ee7 <bread+0x44>
  801ede:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801ee5:	eb 75                	jmp    801f5c <bread+0xb9>
    if(!bh->b_uptodate)
  801ee7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eeb:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801eef:	84 c0                	test   al,al
  801ef1:	75 65                	jne    801f58 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801ef3:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801ef9:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801efc:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f07:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f0a:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f10:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f17:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f1e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801f22:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801f28:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801f2f:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801f32:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801f39:	48 89 c7             	mov    rdi,rax
  801f3c:	e8 c1 1b 00 00       	call   803b02 <make_request>
  801f41:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801f44:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f47:	89 c7                	mov    edi,eax
  801f49:	e8 c7 1e 00 00       	call   803e15 <wait_on_req>
        clear_req(reqi);
  801f4e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f51:	89 c7                	mov    edi,eax
  801f53:	e8 ed 1e 00 00       	call   803e45 <clear_req>
    }
    return bh;
  801f58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801f5c:	c9                   	leave  
  801f5d:	c3                   	ret    

0000000000801f5e <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801f5e:	f3 0f 1e fa          	endbr64 
  801f62:	55                   	push   rbp
  801f63:	48 89 e5             	mov    rbp,rsp
  801f66:	48 83 ec 40          	sub    rsp,0x40
  801f6a:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801f6e:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801f72:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801f75:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f79:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f7c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801f7f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f83:	48 89 c7             	mov    rdi,rax
  801f86:	e8 80 01 00 00       	call   80210b <get_according_bnr>
  801f8b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801f8e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801f91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f94:	89 d6                	mov    esi,edx
  801f96:	89 c7                	mov    edi,eax
  801f98:	e8 06 ff ff ff       	call   801ea3 <bread>
  801f9d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801fa1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801fa4:	ba 00 02 00 00       	mov    edx,0x200
  801fa9:	39 d0                	cmp    eax,edx
  801fab:	0f 4f c2             	cmovg  eax,edx
  801fae:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801fb1:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801fb4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801fb8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801fbb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801fbf:	48 89 ce             	mov    rsi,rcx
  801fc2:	48 89 c7             	mov    rdi,rax
  801fc5:	e8 46 a9 00 00       	call   80c910 <memcpy>
        len-=BLOCK_SIZE;
  801fca:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801fd1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fd5:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801fd8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fdb:	01 c2                	add    edx,eax
  801fdd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fe1:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  801fe4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801fe8:	48 89 c7             	mov    rdi,rax
  801feb:	e8 50 fe ff ff       	call   801e40 <brelse>
    }while(len>0);
  801ff0:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801ff4:	7f 89                	jg     801f7f <vfs_read_file+0x21>
    return 0;
  801ff6:	b8 00 00 00 00       	mov    eax,0x0
}
  801ffb:	c9                   	leave  
  801ffc:	c3                   	ret    

0000000000801ffd <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  801ffd:	f3 0f 1e fa          	endbr64 
  802001:	55                   	push   rbp
  802002:	48 89 e5             	mov    rbp,rsp
  802005:	48 83 ec 40          	sub    rsp,0x40
  802009:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80200d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802011:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802014:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802018:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80201b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80201e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802022:	48 89 c7             	mov    rdi,rax
  802025:	e8 e1 00 00 00       	call   80210b <get_according_bnr>
  80202a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  80202d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802030:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802033:	89 d6                	mov    esi,edx
  802035:	89 c7                	mov    edi,eax
  802037:	e8 0f 01 00 00       	call   80214b <get_buf>
  80203c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802040:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802043:	ba 00 02 00 00       	mov    edx,0x200
  802048:	39 d0                	cmp    eax,edx
  80204a:	0f 4f c2             	cmovg  eax,edx
  80204d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802050:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802053:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802057:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80205a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80205e:	48 89 ce             	mov    rsi,rcx
  802061:	48 89 c7             	mov    rdi,rax
  802064:	e8 a7 a8 00 00       	call   80c910 <memcpy>
        len-=BLOCK_SIZE;
  802069:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802070:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802074:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802077:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80207a:	01 c2                	add    edx,eax
  80207c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802080:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802083:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802087:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80208b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80208f:	48 89 c7             	mov    rdi,rax
  802092:	e8 a9 fd ff ff       	call   801e40 <brelse>
    }while(len>0);
  802097:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80209b:	7f 81                	jg     80201e <vfs_write_file+0x21>
    return 0;
  80209d:	b8 00 00 00 00       	mov    eax,0x0
}
  8020a2:	c9                   	leave  
  8020a3:	c3                   	ret    

00000000008020a4 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8020a4:	f3 0f 1e fa          	endbr64 
  8020a8:	55                   	push   rbp
  8020a9:	48 89 e5             	mov    rbp,rsp
  8020ac:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8020b0:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8020b3:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8020b6:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020ba:	74 35                	je     8020f1 <vfs_seek_file+0x4d>
  8020bc:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020c0:	7f 3f                	jg     802101 <vfs_seek_file+0x5d>
  8020c2:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8020c6:	74 08                	je     8020d0 <vfs_seek_file+0x2c>
  8020c8:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8020cc:	74 0e                	je     8020dc <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8020ce:	eb 31                	jmp    802101 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8020d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020d4:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8020d7:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020da:	eb 26                	jmp    802102 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8020dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020e0:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020e3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8020e6:	01 c2                	add    edx,eax
  8020e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020ec:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020ef:	eb 11                	jmp    802102 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8020f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020f5:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8020f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020fc:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020ff:	eb 01                	jmp    802102 <vfs_seek_file+0x5e>
        break;
  802101:	90                   	nop
    }
    return f->ptr;
  802102:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802106:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802109:	5d                   	pop    rbp
  80210a:	c3                   	ret    

000000000080210b <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80210b:	f3 0f 1e fa          	endbr64 
  80210f:	55                   	push   rbp
  802110:	48 89 e5             	mov    rbp,rsp
  802113:	48 83 ec 10          	sub    rsp,0x10
  802117:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80211b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80211f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802122:	48 63 d0             	movsxd rdx,eax
  802125:	48 89 d0             	mov    rax,rdx
  802128:	48 c1 e0 02          	shl    rax,0x2
  80212c:	48 01 d0             	add    rax,rdx
  80212f:	48 c1 e0 03          	shl    rax,0x3
  802133:	48 05 58 02 40 00    	add    rax,0x400258
  802139:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80213c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802140:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802144:	48 89 c7             	mov    rdi,rax
  802147:	ff d2                	call   rdx

}
  802149:	c9                   	leave  
  80214a:	c3                   	ret    

000000000080214b <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80214b:	f3 0f 1e fa          	endbr64 
  80214f:	55                   	push   rbp
  802150:	48 89 e5             	mov    rbp,rsp
  802153:	48 83 ec 20          	sub    rsp,0x20
  802157:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80215a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80215d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802164:	e9 b9 00 00 00       	jmp    802222 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802169:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80216c:	48 98                	cdqe   
  80216e:	48 c1 e0 06          	shl    rax,0x6
  802172:	48 05 90 26 40 00    	add    rax,0x402690
  802178:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80217b:	0f b7 c0             	movzx  eax,ax
  80217e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802181:	0f 85 97 00 00 00    	jne    80221e <get_buf+0xd3>
  802187:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80218a:	48 98                	cdqe   
  80218c:	48 c1 e0 06          	shl    rax,0x6
  802190:	48 05 88 26 40 00    	add    rax,0x402688
  802196:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802199:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80219c:	48 98                	cdqe   
  80219e:	48 39 c2             	cmp    rdx,rax
  8021a1:	75 7b                	jne    80221e <get_buf+0xd3>
        {
            repeat:
  8021a3:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8021a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021a7:	48 98                	cdqe   
  8021a9:	48 c1 e0 06          	shl    rax,0x6
  8021ad:	48 05 80 26 40 00    	add    rax,0x402680
  8021b3:	48 89 c7             	mov    rdi,rax
  8021b6:	e8 41 01 00 00       	call   8022fc <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8021bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021be:	48 98                	cdqe   
  8021c0:	48 c1 e0 06          	shl    rax,0x6
  8021c4:	48 05 94 26 40 00    	add    rax,0x402694
  8021ca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8021cd:	84 c0                	test   al,al
  8021cf:	74 02                	je     8021d3 <get_buf+0x88>
                goto repeat;
  8021d1:	eb d1                	jmp    8021a4 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8021d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021d6:	48 98                	cdqe   
  8021d8:	48 c1 e0 06          	shl    rax,0x6
  8021dc:	48 05 90 26 40 00    	add    rax,0x402690
  8021e2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021e5:	0f b7 c0             	movzx  eax,ax
  8021e8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021eb:	75 30                	jne    80221d <get_buf+0xd2>
  8021ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021f0:	48 98                	cdqe   
  8021f2:	48 c1 e0 06          	shl    rax,0x6
  8021f6:	48 05 88 26 40 00    	add    rax,0x402688
  8021fc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8021ff:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802202:	48 98                	cdqe   
  802204:	48 39 c2             	cmp    rdx,rax
  802207:	75 14                	jne    80221d <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802209:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80220c:	48 98                	cdqe   
  80220e:	48 c1 e0 06          	shl    rax,0x6
  802212:	48 05 80 26 40 00    	add    rax,0x402680
  802218:	e9 dd 00 00 00       	jmp    8022fa <get_buf+0x1af>
                continue;
  80221d:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80221e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802222:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802226:	0f 8e 3d ff ff ff    	jle    802169 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80222c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802233:	e9 b8 00 00 00       	jmp    8022f0 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802238:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80223b:	48 98                	cdqe   
  80223d:	48 c1 e0 06          	shl    rax,0x6
  802241:	48 05 94 26 40 00    	add    rax,0x402694
  802247:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80224a:	84 c0                	test   al,al
  80224c:	0f 85 9a 00 00 00    	jne    8022ec <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802252:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802255:	48 98                	cdqe   
  802257:	48 c1 e0 06          	shl    rax,0x6
  80225b:	48 05 93 26 40 00    	add    rax,0x402693
  802261:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802264:	84 c0                	test   al,al
  802266:	74 2e                	je     802296 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802268:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80226b:	48 98                	cdqe   
  80226d:	48 c1 e0 06          	shl    rax,0x6
  802271:	48 05 80 26 40 00    	add    rax,0x402680
  802277:	48 89 c7             	mov    rdi,rax
  80227a:	e8 1b 01 00 00       	call   80239a <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80227f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802282:	48 98                	cdqe   
  802284:	48 c1 e0 06          	shl    rax,0x6
  802288:	48 05 80 26 40 00    	add    rax,0x402680
  80228e:	48 89 c7             	mov    rdi,rax
  802291:	e8 66 00 00 00       	call   8022fc <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802296:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802299:	48 98                	cdqe   
  80229b:	48 c1 e0 06          	shl    rax,0x6
  80229f:	48 05 94 26 40 00    	add    rax,0x402694
  8022a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022a8:	8d 50 01             	lea    edx,[rax+0x1]
  8022ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022ae:	48 98                	cdqe   
  8022b0:	48 c1 e0 06          	shl    rax,0x6
  8022b4:	48 05 94 26 40 00    	add    rax,0x402694
  8022ba:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8022bc:	b8 00 00 00 00       	mov    eax,0x0
  8022c1:	e8 71 ef ff ff       	call   801237 <vmalloc>
  8022c6:	48 89 c2             	mov    rdx,rax
  8022c9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022cc:	48 98                	cdqe   
  8022ce:	48 c1 e0 06          	shl    rax,0x6
  8022d2:	48 05 80 26 40 00    	add    rax,0x402680
  8022d8:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8022db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022de:	48 98                	cdqe   
  8022e0:	48 c1 e0 06          	shl    rax,0x6
  8022e4:	48 05 80 26 40 00    	add    rax,0x402680
  8022ea:	eb 0e                	jmp    8022fa <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022ec:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8022f0:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8022f4:	0f 8e 3e ff ff ff    	jle    802238 <get_buf+0xed>
        }
    }
}
  8022fa:	c9                   	leave  
  8022fb:	c3                   	ret    

00000000008022fc <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8022fc:	f3 0f 1e fa          	endbr64 
  802300:	55                   	push   rbp
  802301:	48 89 e5             	mov    rbp,rsp
  802304:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802308:	90                   	nop
  802309:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80230d:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802311:	84 c0                	test   al,al
  802313:	75 f4                	jne    802309 <wait_on_buf+0xd>
    
}
  802315:	90                   	nop
  802316:	90                   	nop
  802317:	5d                   	pop    rbp
  802318:	c3                   	ret    

0000000000802319 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802319:	f3 0f 1e fa          	endbr64 
  80231d:	55                   	push   rbp
  80231e:	48 89 e5             	mov    rbp,rsp
  802321:	48 83 ec 30          	sub    rsp,0x30
  802325:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802328:	b8 00 00 00 00       	mov    eax,0x0
  80232d:	e8 05 ef ff ff       	call   801237 <vmalloc>
  802332:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802336:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80233a:	49 89 c0             	mov    r8,rax
  80233d:	b9 01 00 00 00       	mov    ecx,0x1
  802342:	ba 00 00 00 00       	mov    edx,0x0
  802347:	be 20 00 00 00       	mov    esi,0x20
  80234c:	bf 00 00 00 00       	mov    edi,0x0
  802351:	e8 04 6f 00 00       	call   80925a <request>
  802356:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802359:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80235c:	89 c7                	mov    edi,eax
  80235e:	e8 ab 75 00 00       	call   80990e <chk_result>

    dpt_t* dpte=buf+0x1be;
  802363:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802367:	48 05 be 01 00 00    	add    rax,0x1be
  80236d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802371:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802378:	eb 13                	jmp    80238d <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  80237a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80237e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802381:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802384:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802389:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80238d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802391:	7e e7                	jle    80237a <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  802393:	b8 00 00 00 00       	mov    eax,0x0
}
  802398:	c9                   	leave  
  802399:	c3                   	ret    

000000000080239a <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80239a:	f3 0f 1e fa          	endbr64 
  80239e:	55                   	push   rbp
  80239f:	48 89 e5             	mov    rbp,rsp
  8023a2:	48 83 ec 20          	sub    rsp,0x20
  8023a6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8023aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023ae:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8023b2:	0f b7 c0             	movzx  eax,ax
  8023b5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8023b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023bc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023c0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8023c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023c7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8023ca:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8023cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8023d0:	b9 00 02 00 00       	mov    ecx,0x200
  8023d5:	89 c7                	mov    edi,eax
  8023d7:	e8 02 00 00 00       	call   8023de <write_block>

}
  8023dc:	c9                   	leave  
  8023dd:	c3                   	ret    

00000000008023de <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8023de:	f3 0f 1e fa          	endbr64 
  8023e2:	55                   	push   rbp
  8023e3:	48 89 e5             	mov    rbp,rsp
  8023e6:	48 83 ec 30          	sub    rsp,0x30
  8023ea:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8023ed:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8023f0:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8023f4:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8023f7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8023fa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8023fd:	89 d6                	mov    esi,edx
  8023ff:	89 c7                	mov    edi,eax
  802401:	e8 45 fd ff ff       	call   80214b <get_buf>
  802406:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80240a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80240d:	ba 00 02 00 00       	mov    edx,0x200
  802412:	39 d0                	cmp    eax,edx
  802414:	0f 4f c2             	cmovg  eax,edx
  802417:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80241a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80241d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802421:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802424:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802428:	48 89 ce             	mov    rsi,rcx
  80242b:	48 89 c7             	mov    rdi,rax
  80242e:	e8 dd a4 00 00       	call   80c910 <memcpy>
        len-=BLOCK_SIZE;
  802433:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80243a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80243e:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802442:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802446:	48 89 c7             	mov    rdi,rax
  802449:	e8 f2 f9 ff ff       	call   801e40 <brelse>
    }while(len>0);
  80244e:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802452:	7f a3                	jg     8023f7 <write_block+0x19>
    return 0;
  802454:	b8 00 00 00 00       	mov    eax,0x0
}
  802459:	c9                   	leave  
  80245a:	c3                   	ret    

000000000080245b <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80245b:	f3 0f 1e fa          	endbr64 
  80245f:	55                   	push   rbp
  802460:	48 89 e5             	mov    rbp,rsp
  802463:	48 83 ec 30          	sub    rsp,0x30
  802467:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80246a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80246d:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802471:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802474:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802477:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80247a:	89 d6                	mov    esi,edx
  80247c:	89 c7                	mov    edi,eax
  80247e:	e8 20 fa ff ff       	call   801ea3 <bread>
  802483:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802487:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80248a:	ba 00 02 00 00       	mov    edx,0x200
  80248f:	39 d0                	cmp    eax,edx
  802491:	0f 4f c2             	cmovg  eax,edx
  802494:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802497:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80249a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80249e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024a1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8024a5:	48 89 ce             	mov    rsi,rcx
  8024a8:	48 89 c7             	mov    rdi,rax
  8024ab:	e8 60 a4 00 00       	call   80c910 <memcpy>
        len-=BLOCK_SIZE;
  8024b0:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8024b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024bb:	48 89 c7             	mov    rdi,rax
  8024be:	e8 7d f9 ff ff       	call   801e40 <brelse>
    }while(len>0);
  8024c3:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024c7:	7f ab                	jg     802474 <read_block+0x19>
    return 0;
  8024c9:	b8 00 00 00 00       	mov    eax,0x0
}
  8024ce:	c9                   	leave  
  8024cf:	c3                   	ret    

00000000008024d0 <init_vfs>:

int init_vfs()
{
  8024d0:	f3 0f 1e fa          	endbr64 
  8024d4:	55                   	push   rbp
  8024d5:	48 89 e5             	mov    rbp,rsp
  8024d8:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8024dc:	48 8b 05 9d 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f9d]        # 408480 <dev_tree>
  8024e3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8024e7:	eb 40                	jmp    802529 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8024e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024ed:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8024f3:	48 c1 f8 02          	sar    rax,0x2
  8024f7:	48 89 c2             	mov    rdx,rax
  8024fa:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802501:	18 9c 8f 
  802504:	48 0f af c2          	imul   rax,rdx
  802508:	89 c7                	mov    edi,eax
  80250a:	e8 0a fe ff ff       	call   802319 <scan_dev>
  80250f:	85 c0                	test   eax,eax
  802511:	74 07                	je     80251a <init_vfs+0x4a>
  802513:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802518:	eb 1b                	jmp    802535 <init_vfs+0x65>
    for(;p;p=p->next)
  80251a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80251e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802525:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802529:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80252e:	75 b9                	jne    8024e9 <init_vfs+0x19>
    }

    return 0;
  802530:	b8 00 00 00 00       	mov    eax,0x0
}
  802535:	c9                   	leave  
  802536:	c3                   	ret    

0000000000802537 <make_dentry>:
};
struct dir_entry_operations dev_dir_dops={

};
static int devd_fd=-1;
void make_dentry(struct dir_entry* d,char* name,int namelen,struct dir_entry* parent,struct dir_entry_operations* dops){
  802537:	f3 0f 1e fa          	endbr64 
  80253b:	55                   	push   rbp
  80253c:	48 89 e5             	mov    rbp,rsp
  80253f:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  802543:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802547:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80254b:	89 55 9c             	mov    DWORD PTR [rbp-0x64],edx
  80254e:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802552:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    strcpy(d->name,name);
  802556:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80255a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80255d:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  802561:	48 89 d6             	mov    rsi,rdx
  802564:	48 89 c7             	mov    rdi,rax
  802567:	e8 a2 a4 00 00       	call   80ca0e <strcpy>
    d->name_length=namelen;
  80256c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802570:	8b 55 9c             	mov    edx,DWORD PTR [rbp-0x64]
  802573:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops=dops;
  802576:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80257a:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  80257e:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    list_init(&d->subdirs_list);
  802582:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802586:	48 83 c0 28          	add    rax,0x28
  80258a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = NULL;
  80258e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  802592:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  802599:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80259d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8025a4:	00 
}
  8025a5:	90                   	nop
    list_init(&d->child_node);
  8025a6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025aa:	48 83 c0 10          	add    rax,0x10
  8025ae:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    list->prev = NULL;
  8025b2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025b6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8025bd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025c1:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8025c8:	00 
}
  8025c9:	90                   	nop
    d->child_node.data=d;
  8025ca:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025ce:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  8025d2:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    d->parent=parent;
  8025d6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025da:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8025de:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_add(&parent->subdirs_list,&d->child_node);
  8025e2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025e6:	48 83 c0 10          	add    rax,0x10
  8025ea:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8025ee:	48 83 c2 28          	add    rdx,0x28
  8025f2:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8025f6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        new->next->prev = new;
    entry->next = new;
}
__attribute__((always_inline)) inline void list_add(struct List * entry,struct List * new)	////add to the tail of the link
{
    if(entry->next==NULL)
  8025fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025fe:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802602:	48 85 c0             	test   rax,rax
  802605:	75 58                	jne    80265f <make_dentry+0x128>
  802607:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80260b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80260f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802613:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    new->next = entry->next;
  802617:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80261b:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80261f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802623:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802627:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80262b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80262f:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802632:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802636:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80263a:	48 85 c0             	test   rax,rax
  80263d:	74 0f                	je     80264e <make_dentry+0x117>
        new->next->prev = new;
  80263f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802643:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802647:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80264b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80264e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802652:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802656:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80265a:	e9 9c 00 00 00       	jmp    8026fb <make_dentry+0x1c4>
        list_add_to_behind(entry,new);
    else{
        struct List* p=entry;
  80265f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802663:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(;p->next&&p->next!=p;p=p->next){
  802667:	eb 21                	jmp    80268a <make_dentry+0x153>
            if(p->data==new->data)
  802669:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80266d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802671:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802675:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802679:	48 39 c2             	cmp    rdx,rax
  80267c:	74 7c                	je     8026fa <make_dentry+0x1c3>
        for(;p->next&&p->next!=p;p=p->next){
  80267e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802682:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802686:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  80268a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80268e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802692:	48 85 c0             	test   rax,rax
  802695:	74 0e                	je     8026a5 <make_dentry+0x16e>
  802697:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80269b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80269f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  8026a3:	75 c4                	jne    802669 <make_dentry+0x132>
  8026a5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026a9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  8026ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8026b1:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    new->next = entry->next;
  8026b5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8026b9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8026bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026c1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8026c5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026c9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8026cd:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8026d0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026d8:	48 85 c0             	test   rax,rax
  8026db:	74 0f                	je     8026ec <make_dentry+0x1b5>
        new->next->prev = new;
  8026dd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026e1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026e5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8026e9:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8026ec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8026f0:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8026f4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8026f8:	eb 01                	jmp    8026fb <make_dentry+0x1c4>
                return;
  8026fa:	90                   	nop
}
  8026fb:	90                   	nop
  8026fc:	c9                   	leave  
  8026fd:	c3                   	ret    

00000000008026fe <make_inode>:
void make_inode(struct index_node* i,struct index_node_operations* iops,struct file_operations* fops,unsigned long attr,super_block* sb){
  8026fe:	f3 0f 1e fa          	endbr64 
  802702:	55                   	push   rbp
  802703:	48 89 e5             	mov    rbp,rsp
  802706:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80270a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80270e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  802712:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  802716:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    i->f_ops=fops;
  80271a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80271e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802722:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    i->attribute=attr;
  802726:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80272a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80272e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    i->sb=sb;
  802732:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802736:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80273a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    i->file_size=0;
  80273e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802742:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    i->inode_ops=iops;
  802749:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80274d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802751:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
}
  802755:	90                   	nop
  802756:	5d                   	pop    rbp
  802757:	c3                   	ret    

0000000000802758 <make_devf>:
void make_devf(struct dir_entry* d,struct index_node* i,char* name,struct dir_entry* ddev,struct file_operations* fops){
  802758:	f3 0f 1e fa          	endbr64 
  80275c:	55                   	push   rbp
  80275d:	48 89 e5             	mov    rbp,rsp
  802760:	53                   	push   rbx
  802761:	48 83 ec 78          	sub    rsp,0x78
  802765:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802769:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80276d:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  802771:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802775:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    make_dentry(d,name, strlen(name),root_sb->root,&dev_dir_dops);
  802779:	48 8b 05 68 5f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25f68]        # 4286e8 <root_sb>
  802780:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  802783:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  802787:	48 89 c7             	mov    rdi,rax
  80278a:	e8 9e a4 00 00       	call   80cc2d <strlen>
  80278f:	89 c2                	mov    edx,eax
  802791:	48 8b 75 98          	mov    rsi,QWORD PTR [rbp-0x68]
  802795:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802799:	41 b8 a0 84 40 00    	mov    r8d,0x4084a0
  80279f:	48 89 d9             	mov    rcx,rbx
  8027a2:	48 89 c7             	mov    rdi,rax
  8027a5:	e8 8d fd ff ff       	call   802537 <make_dentry>
    d->dir_inode=i;
  8027aa:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027ae:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8027b2:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(i,ddev->dir_inode->inode_ops,fops,FS_ATTR_DEVICE,root_sb);
  8027b6:	48 8b 0d 2b 5f c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25f2b]        # 4286e8 <root_sb>
  8027bd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8027c1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8027c5:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8027c9:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  8027cd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8027d1:	49 89 c8             	mov    r8,rcx
  8027d4:	b9 04 00 00 00       	mov    ecx,0x4
  8027d9:	48 89 c7             	mov    rdi,rax
  8027dc:	e8 1d ff ff ff       	call   8026fe <make_inode>
    list_add(&ddev->subdirs_list,&d->child_node);//添加到/dev下
  8027e1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027e5:	48 83 c0 10          	add    rax,0x10
  8027e9:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8027ed:	48 83 c2 28          	add    rdx,0x28
  8027f1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8027f5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(entry->next==NULL)
  8027f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027fd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802801:	48 85 c0             	test   rax,rax
  802804:	75 58                	jne    80285e <make_devf+0x106>
  802806:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80280a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  80280e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802812:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    new->next = entry->next;
  802816:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80281a:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80281e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802822:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802826:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80282a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80282e:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802831:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802835:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802839:	48 85 c0             	test   rax,rax
  80283c:	74 0f                	je     80284d <make_devf+0xf5>
        new->next->prev = new;
  80283e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802842:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802846:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80284a:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80284d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802851:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802855:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802859:	e9 9c 00 00 00       	jmp    8028fa <make_devf+0x1a2>
        struct List* p=entry;
  80285e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802862:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
        for(;p->next&&p->next!=p;p=p->next){
  802866:	eb 21                	jmp    802889 <make_devf+0x131>
            if(p->data==new->data)
  802868:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80286c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802870:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802874:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802878:	48 39 c2             	cmp    rdx,rax
  80287b:	74 7c                	je     8028f9 <make_devf+0x1a1>
        for(;p->next&&p->next!=p;p=p->next){
  80287d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  802881:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802885:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  802889:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80288d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802891:	48 85 c0             	test   rax,rax
  802894:	74 0e                	je     8028a4 <make_devf+0x14c>
  802896:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80289a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80289e:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  8028a2:	75 c4                	jne    802868 <make_devf+0x110>
  8028a4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8028ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028b0:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    new->next = entry->next;
  8028b4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8028b8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8028bc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028c0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8028c4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028c8:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8028cc:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8028cf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028d3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028d7:	48 85 c0             	test   rax,rax
  8028da:	74 0f                	je     8028eb <make_devf+0x193>
        new->next->prev = new;
  8028dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028e0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028e4:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8028e8:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8028eb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8028ef:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8028f3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8028f7:	eb 01                	jmp    8028fa <make_devf+0x1a2>
                return;
  8028f9:	90                   	nop
}
  8028fa:	90                   	nop
  8028fb:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8028ff:	c9                   	leave  
  802900:	c3                   	ret    

0000000000802901 <init_devman>:
 * 创建/dev文件夹，添加必要的设备文件。
 * 这个/dev文件夹的dentry和inode等数据由devman管理，根文件系统切换时，这个文件夹会跟着挂载到新文件系统的根目录下。
 * */
struct dir_entry* ddev=NULL,*dmnt;
int init_devman()
{
  802901:	f3 0f 1e fa          	endbr64 
  802905:	55                   	push   rbp
  802906:	48 89 e5             	mov    rbp,rsp
  802909:	48 83 ec 30          	sub    rsp,0x30
    //创建dev文件夹
    ddev=(struct dir_entry*)vmalloc();
  80290d:	b8 00 00 00 00       	mov    eax,0x0
  802912:	e8 20 e9 ff ff       	call   801237 <vmalloc>
  802917:	48 89 05 a2 5b c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05ba2],rax        # 4084c0 <ddev>
    struct index_node* idev=ddev+1;
  80291e:	48 8b 05 9b 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b9b]        # 4084c0 <ddev>
  802925:	48 83 c0 58          	add    rax,0x58
  802929:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ddev->name=idev+1;
  80292d:	48 8b 05 8c 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b8c]        # 4084c0 <ddev>
  802934:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802938:	48 83 c2 38          	add    rdx,0x38
  80293c:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(ddev,"dev",3,root_sb->root,root_sb->root->dir_ops);
  80293f:	48 8b 05 a2 5d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25da2]        # 4286e8 <root_sb>
  802946:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802949:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80294d:	48 8b 05 94 5d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25d94]        # 4286e8 <root_sb>
  802954:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802957:	48 8b 05 62 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b62]        # 4084c0 <ddev>
  80295e:	49 89 c8             	mov    r8,rcx
  802961:	48 89 d1             	mov    rcx,rdx
  802964:	ba 03 00 00 00       	mov    edx,0x3
  802969:	be b8 4f 81 00       	mov    esi,0x814fb8
  80296e:	48 89 c7             	mov    rdi,rax
  802971:	e8 c1 fb ff ff       	call   802537 <make_dentry>
    ddev->dir_inode=idev;
  802976:	48 8b 05 43 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b43]        # 4084c0 <ddev>
  80297d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802981:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(idev,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  802985:	48 8b 0d 5c 5d c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25d5c]        # 4286e8 <root_sb>
  80298c:	48 8b 05 55 5d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25d55]        # 4286e8 <root_sb>
  802993:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802996:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80299a:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80299e:	48 8b 05 43 5d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25d43]        # 4286e8 <root_sb>
  8029a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029a8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8029ac:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8029b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029b4:	49 89 c8             	mov    r8,rcx
  8029b7:	b9 02 00 00 00       	mov    ecx,0x2
  8029bc:	48 89 c7             	mov    rdi,rax
  8029bf:	e8 3a fd ff ff       	call   8026fe <make_inode>
    idev->private_index_info=ddev;
  8029c4:	48 8b 15 f5 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05af5]        # 4084c0 <ddev>
  8029cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029cf:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    //创建mnt文件夹
    dmnt=(struct dir_entry*)vmalloc();
  8029d3:	b8 00 00 00 00       	mov    eax,0x0
  8029d8:	e8 5a e8 ff ff       	call   801237 <vmalloc>
  8029dd:	48 89 05 e4 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05ae4],rax        # 4084c8 <dmnt>
    struct index_node* imnt=dmnt+1;
  8029e4:	48 8b 05 dd 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05add]        # 4084c8 <dmnt>
  8029eb:	48 83 c0 58          	add    rax,0x58
  8029ef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dmnt->name=imnt+1;
  8029f3:	48 8b 05 ce 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ace]        # 4084c8 <dmnt>
  8029fa:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8029fe:	48 83 c2 38          	add    rdx,0x38
  802a02:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(dmnt,"mnt",3,root_sb->root,root_sb->root->dir_ops);
  802a05:	48 8b 05 dc 5c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25cdc]        # 4286e8 <root_sb>
  802a0c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a0f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a13:	48 8b 05 ce 5c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25cce]        # 4286e8 <root_sb>
  802a1a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802a1d:	48 8b 05 a4 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05aa4]        # 4084c8 <dmnt>
  802a24:	49 89 c8             	mov    r8,rcx
  802a27:	48 89 d1             	mov    rcx,rdx
  802a2a:	ba 03 00 00 00       	mov    edx,0x3
  802a2f:	be bc 4f 81 00       	mov    esi,0x814fbc
  802a34:	48 89 c7             	mov    rdi,rax
  802a37:	e8 fb fa ff ff       	call   802537 <make_dentry>
    dmnt->dir_inode=imnt;
  802a3c:	48 8b 05 85 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a85]        # 4084c8 <dmnt>
  802a43:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802a47:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(imnt,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  802a4b:	48 8b 0d 96 5c c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25c96]        # 4286e8 <root_sb>
  802a52:	48 8b 05 8f 5c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25c8f]        # 4286e8 <root_sb>
  802a59:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a5c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802a60:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802a64:	48 8b 05 7d 5c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25c7d]        # 4286e8 <root_sb>
  802a6b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a6e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802a72:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  802a76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802a7a:	49 89 c8             	mov    r8,rcx
  802a7d:	b9 02 00 00 00       	mov    ecx,0x2
  802a82:	48 89 c7             	mov    rdi,rax
  802a85:	e8 74 fc ff ff       	call   8026fe <make_inode>
    imnt->private_index_info=dmnt;
  802a8a:	48 8b 15 37 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05a37]        # 4084c8 <dmnt>
  802a91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802a95:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx


    //创建几个设备文件
    //console-framebuffer.c
    struct dir_entry* dconsole= (struct dir_entry *) vmalloc();
  802a99:	b8 00 00 00 00       	mov    eax,0x0
  802a9e:	e8 94 e7 ff ff       	call   801237 <vmalloc>
  802aa3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    struct index_node* iconsole=dconsole+1;
  802aa7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802aab:	48 83 c0 58          	add    rax,0x58
  802aaf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    dconsole->name=iconsole+1;
  802ab3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ab7:	48 8d 50 38          	lea    rdx,[rax+0x38]
  802abb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802abf:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dconsole,iconsole,"console",ddev,&framebuffer_fops);
  802ac2:	48 8b 15 f7 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc059f7]        # 4084c0 <ddev>
  802ac9:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802acd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ad1:	41 b8 e0 d3 80 00    	mov    r8d,0x80d3e0
  802ad7:	48 89 d1             	mov    rcx,rdx
  802ada:	ba c0 4f 81 00       	mov    edx,0x814fc0
  802adf:	48 89 c7             	mov    rdi,rax
  802ae2:	e8 71 fc ff ff       	call   802758 <make_devf>
    //hd0-disk.c
    struct dir_entry* dhd0= (struct dir_entry *) vmalloc();
  802ae7:	b8 00 00 00 00       	mov    eax,0x0
  802aec:	e8 46 e7 ff ff       	call   801237 <vmalloc>
  802af1:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    struct index_node* ihd0=dhd0+1;
  802af5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802af9:	48 83 c0 58          	add    rax,0x58
  802afd:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    dhd0->name=ihd0+1;
  802b01:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b05:	48 8d 50 38          	lea    rdx,[rax+0x38]
  802b09:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b0d:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dhd0,ihd0,"hd0",ddev,&hd_fops);
  802b10:	48 8b 15 a9 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc059a9]        # 4084c0 <ddev>
  802b17:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  802b1b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b1f:	41 b8 20 89 42 00    	mov    r8d,0x428920
  802b25:	48 89 d1             	mov    rcx,rdx
  802b28:	ba c8 4f 81 00       	mov    edx,0x814fc8
  802b2d:	48 89 c7             	mov    rdi,rax
  802b30:	e8 23 fc ff ff       	call   802758 <make_devf>


}
  802b35:	90                   	nop
  802b36:	c9                   	leave  
  802b37:	c3                   	ret    

0000000000802b38 <open_dev>:
//
long open_dev(struct index_node * inode,struct file * filp){
  802b38:	f3 0f 1e fa          	endbr64 
  802b3c:	55                   	push   rbp
  802b3d:	48 89 e5             	mov    rbp,rsp
  802b40:	48 83 ec 20          	sub    rsp,0x20
  802b44:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802b48:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802b4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802b50:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802b54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b57:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802b5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b5f:	48 89 c7             	mov    rdi,rax
  802b62:	e8 c6 a0 00 00       	call   80cc2d <strlen>
  802b67:	48 98                	cdqe   
  802b69:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802b6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b71:	48 01 d0             	add    rax,rdx
  802b74:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802b78:	eb 05                	jmp    802b7f <open_dev+0x47>
  802b7a:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802b7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802b86:	3c 2f                	cmp    al,0x2f
  802b88:	74 0a                	je     802b94 <open_dev+0x5c>
  802b8a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b8e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802b92:	73 e6                	jae    802b7a <open_dev+0x42>
    if(p>=name)
  802b94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802b98:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802b9c:	72 0c                	jb     802baa <open_dev+0x72>
        name=p+1;
  802b9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ba2:	48 83 c0 01          	add    rax,0x1
  802ba6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802bae:	ba 03 00 00 00       	mov    edx,0x3
  802bb3:	be cc 4f 81 00       	mov    esi,0x814fcc
  802bb8:	48 89 c7             	mov    rdi,rax
  802bbb:	e8 9a 9d 00 00       	call   80c95a <memcmp>
  802bc0:	85 c0                	test   eax,eax
  802bc2:	75 15                	jne    802bd9 <open_dev+0xa1>
        return init_tty(inode,filp);
  802bc4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802bc8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bcc:	48 89 d6             	mov    rsi,rdx
  802bcf:	48 89 c7             	mov    rdi,rax
  802bd2:	e8 b5 97 00 00       	call   80c38c <init_tty>
  802bd7:	eb 31                	jmp    802c0a <open_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802bd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802bdd:	be c0 4f 81 00       	mov    esi,0x814fc0
  802be2:	48 89 c7             	mov    rdi,rax
  802be5:	e8 c4 9f 00 00       	call   80cbae <strcmp>
  802bea:	85 c0                	test   eax,eax
  802bec:	75 15                	jne    802c03 <open_dev+0xcb>
        return open_framebuffer(inode,filp);
  802bee:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802bf2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bf6:	48 89 d6             	mov    rsi,rdx
  802bf9:	48 89 c7             	mov    rdi,rax
  802bfc:	e8 79 4d 00 00       	call   80797a <open_framebuffer>
  802c01:	eb 07                	jmp    802c0a <open_dev+0xd2>
    }
    return -1;
  802c03:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
}
  802c0a:	c9                   	leave  
  802c0b:	c3                   	ret    

0000000000802c0c <close_dev>:
long close_dev(struct index_node * inode,struct file * filp){
  802c0c:	f3 0f 1e fa          	endbr64 
  802c10:	55                   	push   rbp
  802c11:	48 89 e5             	mov    rbp,rsp
  802c14:	48 83 ec 20          	sub    rsp,0x20
  802c18:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802c1c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802c20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c24:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802c28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c2b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c33:	48 89 c7             	mov    rdi,rax
  802c36:	e8 f2 9f 00 00       	call   80cc2d <strlen>
  802c3b:	48 98                	cdqe   
  802c3d:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802c41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c45:	48 01 d0             	add    rax,rdx
  802c48:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802c4c:	eb 05                	jmp    802c53 <close_dev+0x47>
  802c4e:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802c53:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802c5a:	3c 2f                	cmp    al,0x2f
  802c5c:	74 0a                	je     802c68 <close_dev+0x5c>
  802c5e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c62:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c66:	73 e6                	jae    802c4e <close_dev+0x42>
    if(p>=name)
  802c68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c6c:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c70:	72 0c                	jb     802c7e <close_dev+0x72>
        name=p+1;
  802c72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c76:	48 83 c0 01          	add    rax,0x1
  802c7a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802c7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c82:	ba 03 00 00 00       	mov    edx,0x3
  802c87:	be cc 4f 81 00       	mov    esi,0x814fcc
  802c8c:	48 89 c7             	mov    rdi,rax
  802c8f:	e8 c6 9c 00 00       	call   80c95a <memcmp>
  802c94:	85 c0                	test   eax,eax
  802c96:	75 15                	jne    802cad <close_dev+0xa1>
        return close_tty(inode,filp);
  802c98:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c9c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ca0:	48 89 d6             	mov    rsi,rdx
  802ca3:	48 89 c7             	mov    rdi,rax
  802ca6:	e8 66 96 00 00       	call   80c311 <close_tty>
  802cab:	eb 31                	jmp    802cde <close_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802cad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802cb1:	be c0 4f 81 00       	mov    esi,0x814fc0
  802cb6:	48 89 c7             	mov    rdi,rax
  802cb9:	e8 f0 9e 00 00       	call   80cbae <strcmp>
  802cbe:	85 c0                	test   eax,eax
  802cc0:	75 15                	jne    802cd7 <close_dev+0xcb>
        return close_framebuffer(inode,filp);
  802cc2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802cc6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cca:	48 89 d6             	mov    rsi,rdx
  802ccd:	48 89 c7             	mov    rdi,rax
  802cd0:	e8 d4 4c 00 00       	call   8079a9 <close_framebuffer>
  802cd5:	eb 07                	jmp    802cde <close_dev+0xd2>
    }
    return -1;
  802cd7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802cde:	c9                   	leave  
  802cdf:	c3                   	ret    

0000000000802ce0 <read_dev>:
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802ce0:	f3 0f 1e fa          	endbr64 
  802ce4:	55                   	push   rbp
  802ce5:	48 89 e5             	mov    rbp,rsp
  802ce8:	48 83 ec 30          	sub    rsp,0x30
  802cec:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802cf0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802cf4:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802cf8:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802cfc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d00:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802d04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d07:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802d0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d0f:	48 89 c7             	mov    rdi,rax
  802d12:	e8 16 9f 00 00       	call   80cc2d <strlen>
  802d17:	48 98                	cdqe   
  802d19:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802d1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d21:	48 01 d0             	add    rax,rdx
  802d24:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802d28:	eb 05                	jmp    802d2f <read_dev+0x4f>
  802d2a:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802d2f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d33:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802d36:	3c 2f                	cmp    al,0x2f
  802d38:	74 0a                	je     802d44 <read_dev+0x64>
  802d3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d3e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d42:	73 e6                	jae    802d2a <read_dev+0x4a>
    if(p>=name)
  802d44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d48:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d4c:	72 0c                	jb     802d5a <read_dev+0x7a>
        name=p+1;
  802d4e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d52:	48 83 c0 01          	add    rax,0x1
  802d56:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802d5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d5e:	ba 03 00 00 00       	mov    edx,0x3
  802d63:	be cc 4f 81 00       	mov    esi,0x814fcc
  802d68:	48 89 c7             	mov    rdi,rax
  802d6b:	e8 ea 9b 00 00       	call   80c95a <memcmp>
  802d70:	85 c0                	test   eax,eax
  802d72:	75 1a                	jne    802d8e <read_dev+0xae>
        return read_tty(filp,buf,count,position);
  802d74:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802d78:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d7c:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802d80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d84:	48 89 c7             	mov    rdi,rax
  802d87:	e8 ee 96 00 00       	call   80c47a <read_tty>
  802d8c:	eb 36                	jmp    802dc4 <read_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802d8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d92:	be c0 4f 81 00       	mov    esi,0x814fc0
  802d97:	48 89 c7             	mov    rdi,rax
  802d9a:	e8 0f 9e 00 00       	call   80cbae <strcmp>
  802d9f:	85 c0                	test   eax,eax
  802da1:	75 1a                	jne    802dbd <read_dev+0xdd>
        return read_framebuffer(filp,buf,count,position);
  802da3:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802da7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802dab:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802daf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802db3:	48 89 c7             	mov    rdi,rax
  802db6:	e8 01 4c 00 00       	call   8079bc <read_framebuffer>
  802dbb:	eb 07                	jmp    802dc4 <read_dev+0xe4>
    }
    return -1;
  802dbd:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802dc4:	c9                   	leave  
  802dc5:	c3                   	ret    

0000000000802dc6 <write_dev>:
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802dc6:	f3 0f 1e fa          	endbr64 
  802dca:	55                   	push   rbp
  802dcb:	48 89 e5             	mov    rbp,rsp
  802dce:	48 83 ec 30          	sub    rsp,0x30
  802dd2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802dd6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802dda:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802dde:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802de2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802de6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802dea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ded:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802df1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802df5:	48 89 c7             	mov    rdi,rax
  802df8:	e8 30 9e 00 00       	call   80cc2d <strlen>
  802dfd:	48 98                	cdqe   
  802dff:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802e03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e07:	48 01 d0             	add    rax,rdx
  802e0a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802e0e:	eb 05                	jmp    802e15 <write_dev+0x4f>
  802e10:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802e15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802e1c:	3c 2f                	cmp    al,0x2f
  802e1e:	74 0a                	je     802e2a <write_dev+0x64>
  802e20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e24:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e28:	73 e6                	jae    802e10 <write_dev+0x4a>
    if(p>=name)
  802e2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e2e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802e32:	72 0c                	jb     802e40 <write_dev+0x7a>
        name=p+1;
  802e34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e38:	48 83 c0 01          	add    rax,0x1
  802e3c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802e40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e44:	ba 03 00 00 00       	mov    edx,0x3
  802e49:	be cc 4f 81 00       	mov    esi,0x814fcc
  802e4e:	48 89 c7             	mov    rdi,rax
  802e51:	e8 04 9b 00 00       	call   80c95a <memcmp>
  802e56:	85 c0                	test   eax,eax
  802e58:	75 1a                	jne    802e74 <write_dev+0xae>
        return write_tty(filp,buf,count,position);
  802e5a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e5e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e62:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e66:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e6a:	48 89 c7             	mov    rdi,rax
  802e6d:	e8 a1 96 00 00       	call   80c513 <write_tty>
  802e72:	eb 36                	jmp    802eaa <write_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802e74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e78:	be c0 4f 81 00       	mov    esi,0x814fc0
  802e7d:	48 89 c7             	mov    rdi,rax
  802e80:	e8 29 9d 00 00       	call   80cbae <strcmp>
  802e85:	85 c0                	test   eax,eax
  802e87:	75 1a                	jne    802ea3 <write_dev+0xdd>
        return write_framebuffer(filp,buf,count,position);
  802e89:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e8d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e91:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e95:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e99:	48 89 c7             	mov    rdi,rax
  802e9c:	e8 36 4b 00 00       	call   8079d7 <write_framebuffer>
  802ea1:	eb 07                	jmp    802eaa <write_dev+0xe4>
    }
    return -1;
  802ea3:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802eaa:	c9                   	leave  
  802eab:	c3                   	ret    

0000000000802eac <ioctl_dev>:
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  802eac:	f3 0f 1e fa          	endbr64 
  802eb0:	55                   	push   rbp
  802eb1:	48 89 e5             	mov    rbp,rsp
  802eb4:	48 83 ec 30          	sub    rsp,0x30
  802eb8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802ebc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802ec0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802ec4:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802ec8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ecc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802ed0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ed3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802ed7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802edb:	48 89 c7             	mov    rdi,rax
  802ede:	e8 4a 9d 00 00       	call   80cc2d <strlen>
  802ee3:	48 98                	cdqe   
  802ee5:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ee9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802eed:	48 01 d0             	add    rax,rdx
  802ef0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802ef4:	eb 05                	jmp    802efb <ioctl_dev+0x4f>
  802ef6:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802efb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802eff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802f02:	3c 2f                	cmp    al,0x2f
  802f04:	74 0a                	je     802f10 <ioctl_dev+0x64>
  802f06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f0a:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802f0e:	73 e6                	jae    802ef6 <ioctl_dev+0x4a>
    if(p>=name)
  802f10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f14:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802f18:	72 0c                	jb     802f26 <ioctl_dev+0x7a>
        name=p+1;
  802f1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f1e:	48 83 c0 01          	add    rax,0x1
  802f22:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802f26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f2a:	ba 03 00 00 00       	mov    edx,0x3
  802f2f:	be cc 4f 81 00       	mov    esi,0x814fcc
  802f34:	48 89 c7             	mov    rdi,rax
  802f37:	e8 1e 9a 00 00       	call   80c95a <memcmp>
  802f3c:	85 c0                	test   eax,eax
  802f3e:	75 1a                	jne    802f5a <ioctl_dev+0xae>
        return tty_do_req(inode,filp,cmd,arg);
  802f40:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f44:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f48:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f50:	48 89 c7             	mov    rdi,rax
  802f53:	e8 83 96 00 00       	call   80c5db <tty_do_req>
  802f58:	eb 36                	jmp    802f90 <ioctl_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f5e:	be c0 4f 81 00       	mov    esi,0x814fc0
  802f63:	48 89 c7             	mov    rdi,rax
  802f66:	e8 43 9c 00 00       	call   80cbae <strcmp>
  802f6b:	85 c0                	test   eax,eax
  802f6d:	75 1a                	jne    802f89 <ioctl_dev+0xdd>
        return ioctl_framebuffer(inode,filp,cmd,arg);
  802f6f:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f73:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f77:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f7b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f7f:	48 89 c7             	mov    rdi,rax
  802f82:	e8 1f 4b 00 00       	call   807aa6 <ioctl_framebuffer>
  802f87:	eb 07                	jmp    802f90 <ioctl_dev+0xe4>
    }
    return -1;
  802f89:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802f90:	c9                   	leave  
  802f91:	c3                   	ret    

0000000000802f92 <load_driver>:
int load_driver(char *path)
{
  802f92:	f3 0f 1e fa          	endbr64 
  802f96:	55                   	push   rbp
  802f97:	48 89 e5             	mov    rbp,rsp
  802f9a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802f9e:	90                   	nop
  802f9f:	5d                   	pop    rbp
  802fa0:	c3                   	ret    

0000000000802fa1 <reg_device>:

int reg_device(device* dev)
{
  802fa1:	f3 0f 1e fa          	endbr64 
  802fa5:	55                   	push   rbp
  802fa6:	48 89 e5             	mov    rbp,rsp
  802fa9:	53                   	push   rbx
  802faa:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802fae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802fb5:	e9 42 01 00 00       	jmp    8030fc <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802fba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802fbd:	48 63 d0             	movsxd rdx,eax
  802fc0:	48 89 d0             	mov    rax,rdx
  802fc3:	48 c1 e0 02          	shl    rax,0x2
  802fc7:	48 01 d0             	add    rax,rdx
  802fca:	48 c1 e0 02          	shl    rax,0x2
  802fce:	48 01 d0             	add    rax,rdx
  802fd1:	48 c1 e0 03          	shl    rax,0x3
  802fd5:	48 05 90 2e 40 00    	add    rax,0x402e90
  802fdb:	8b 00                	mov    eax,DWORD PTR [rax]
  802fdd:	85 c0                	test   eax,eax
  802fdf:	0f 85 13 01 00 00    	jne    8030f8 <reg_device+0x157>
        {
            devs[i]=*dev;
  802fe5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802fe8:	48 63 d0             	movsxd rdx,eax
  802feb:	48 89 d0             	mov    rax,rdx
  802fee:	48 c1 e0 02          	shl    rax,0x2
  802ff2:	48 01 d0             	add    rax,rdx
  802ff5:	48 c1 e0 02          	shl    rax,0x2
  802ff9:	48 01 d0             	add    rax,rdx
  802ffc:	48 c1 e0 03          	shl    rax,0x3
  803000:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  803007:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80300b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80300e:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803012:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803015:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803019:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80301d:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803021:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803025:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803029:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80302d:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803031:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803035:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803039:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80303d:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803041:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803045:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803049:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80304d:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803051:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803055:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803059:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80305d:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803061:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803065:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803069:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80306d:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803071:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803075:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803079:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80307d:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803081:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803085:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803089:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803090:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803097:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80309e:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8030a5:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8030ac:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8030b3:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8030ba:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8030c1:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8030c8:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  8030cf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030d2:	48 63 d0             	movsxd rdx,eax
  8030d5:	48 89 d0             	mov    rax,rdx
  8030d8:	48 c1 e0 02          	shl    rax,0x2
  8030dc:	48 01 d0             	add    rax,rdx
  8030df:	48 c1 e0 02          	shl    rax,0x2
  8030e3:	48 01 d0             	add    rax,rdx
  8030e6:	48 c1 e0 03          	shl    rax,0x3
  8030ea:	48 05 90 2e 40 00    	add    rax,0x402e90
  8030f0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  8030f6:	eb 0e                	jmp    803106 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  8030f8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8030fc:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  803100:	0f 8e b4 fe ff ff    	jle    802fba <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  803106:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  80310a:	75 0a                	jne    803116 <reg_device+0x175>
        return -1;
  80310c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803111:	e9 6d 01 00 00       	jmp    803283 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  803116:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80311d:	00 
  80311e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803121:	48 63 d0             	movsxd rdx,eax
  803124:	48 89 d0             	mov    rax,rdx
  803127:	48 c1 e0 02          	shl    rax,0x2
  80312b:	48 01 d0             	add    rax,rdx
  80312e:	48 c1 e0 02          	shl    rax,0x2
  803132:	48 01 d0             	add    rax,rdx
  803135:	48 c1 e0 03          	shl    rax,0x3
  803139:	48 05 80 2e 40 00    	add    rax,0x402e80
  80313f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  803143:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803147:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80314a:	83 f8 03             	cmp    eax,0x3
  80314d:	74 3b                	je     80318a <reg_device+0x1e9>
  80314f:	83 f8 03             	cmp    eax,0x3
  803152:	7f 4b                	jg     80319f <reg_device+0x1fe>
  803154:	83 f8 01             	cmp    eax,0x1
  803157:	74 07                	je     803160 <reg_device+0x1bf>
  803159:	83 f8 02             	cmp    eax,0x2
  80315c:	74 17                	je     803175 <reg_device+0x1d4>
  80315e:	eb 3f                	jmp    80319f <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  803160:	48 8b 05 19 53 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05319]        # 408480 <dev_tree>
  803167:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80316b:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  803172:	00 
        break;
  803173:	eb 34                	jmp    8031a9 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  803175:	48 8b 05 0c 53 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0530c]        # 408488 <dev_tree+0x8>
  80317c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803180:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  803187:	00 
        break;
  803188:	eb 1f                	jmp    8031a9 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  80318a:	48 8b 05 ff 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc052ff]        # 408490 <dev_tree+0x10>
  803191:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803195:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  80319c:	00 
        break;
  80319d:	eb 0a                	jmp    8031a9 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  80319f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8031a4:	e9 da 00 00 00       	jmp    803283 <reg_device+0x2e2>
    }
    if(!p){
  8031a9:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8031ae:	75 2b                	jne    8031db <reg_device+0x23a>
        *pp=neo;
  8031b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8031b4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8031b8:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8031bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031bf:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8031c6:	00 00 00 00 
  8031ca:	eb 3d                	jmp    803209 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8031cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8031d0:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8031d7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8031db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8031df:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8031e6:	48 85 c0             	test   rax,rax
  8031e9:	75 e1                	jne    8031cc <reg_device+0x22b>
        p->next=neo;
  8031eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8031ef:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8031f3:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  8031fa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031fe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803202:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  803209:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80320d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  803214:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  803218:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80321c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80321f:	83 f8 04             	cmp    eax,0x4
  803222:	74 3b                	je     80325f <reg_device+0x2be>
  803224:	83 f8 04             	cmp    eax,0x4
  803227:	7f 56                	jg     80327f <reg_device+0x2de>
  803229:	83 f8 03             	cmp    eax,0x3
  80322c:	74 21                	je     80324f <reg_device+0x2ae>
  80322e:	83 f8 03             	cmp    eax,0x3
  803231:	7f 4c                	jg     80327f <reg_device+0x2de>
  803233:	83 f8 01             	cmp    eax,0x1
  803236:	74 07                	je     80323f <reg_device+0x29e>
  803238:	83 f8 02             	cmp    eax,0x2
  80323b:	74 32                	je     80326f <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  80323d:	eb 40                	jmp    80327f <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80323f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803243:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  80324a:	00 00 00 
        break;
  80324d:	eb 31                	jmp    803280 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80324f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803253:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  80325a:	00 00 00 
        break;
  80325d:	eb 21                	jmp    803280 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80325f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803263:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  80326a:	00 00 00 
        break;
  80326d:	eb 11                	jmp    803280 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  80326f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803273:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  80327a:	00 00 00 
        break;
  80327d:	eb 01                	jmp    803280 <reg_device+0x2df>
        break;
  80327f:	90                   	nop
    }
    return i;
  803280:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803283:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803287:	c9                   	leave  
  803288:	c3                   	ret    

0000000000803289 <reg_driver>:


int reg_driver(driver *drv)
{
  803289:	f3 0f 1e fa          	endbr64 
  80328d:	55                   	push   rbp
  80328e:	48 89 e5             	mov    rbp,rsp
  803291:	53                   	push   rbx
  803292:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  803296:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80329d:	e9 22 01 00 00       	jmp    8033c4 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8032a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032a5:	48 63 d0             	movsxd rdx,eax
  8032a8:	48 89 d0             	mov    rax,rdx
  8032ab:	48 c1 e0 02          	shl    rax,0x2
  8032af:	48 01 d0             	add    rax,rdx
  8032b2:	48 c1 e0 05          	shl    rax,0x5
  8032b6:	48 05 80 58 40 00    	add    rax,0x405880
  8032bc:	8b 00                	mov    eax,DWORD PTR [rax]
  8032be:	85 c0                	test   eax,eax
  8032c0:	0f 85 fa 00 00 00    	jne    8033c0 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8032c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032c9:	48 63 d0             	movsxd rdx,eax
  8032cc:	48 89 d0             	mov    rax,rdx
  8032cf:	48 c1 e0 02          	shl    rax,0x2
  8032d3:	48 01 d0             	add    rax,rdx
  8032d6:	48 c1 e0 05          	shl    rax,0x5
  8032da:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  8032e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032e5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8032e8:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8032ec:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8032ef:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8032f3:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8032f7:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8032fb:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8032ff:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803303:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803307:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80330b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80330f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803313:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803317:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80331b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80331f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803323:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803327:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80332b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80332f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803333:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803337:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80333b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80333f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803343:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803347:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80334b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80334f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803353:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803357:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80335b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80335f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803363:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80336a:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803371:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803378:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80337f:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803386:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80338d:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803394:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  80339b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80339e:	48 63 d0             	movsxd rdx,eax
  8033a1:	48 89 d0             	mov    rax,rdx
  8033a4:	48 c1 e0 02          	shl    rax,0x2
  8033a8:	48 01 d0             	add    rax,rdx
  8033ab:	48 c1 e0 05          	shl    rax,0x5
  8033af:	48 05 80 58 40 00    	add    rax,0x405880
  8033b5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8033bb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8033be:	eb 13                	jmp    8033d3 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8033c0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8033c4:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8033c8:	0f 8e d4 fe ff ff    	jle    8032a2 <reg_driver+0x19>
        }
    }
    return -1;
  8033ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8033d3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8033d7:	c9                   	leave  
  8033d8:	c3                   	ret    

00000000008033d9 <sys_find_dev>:

int sys_find_dev(char *name)
{
  8033d9:	f3 0f 1e fa          	endbr64 
  8033dd:	55                   	push   rbp
  8033de:	48 89 e5             	mov    rbp,rsp
  8033e1:	48 83 ec 20          	sub    rsp,0x20
  8033e5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  8033e9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8033f0:	eb 6c                	jmp    80345e <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  8033f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f5:	48 63 d0             	movsxd rdx,eax
  8033f8:	48 89 d0             	mov    rax,rdx
  8033fb:	48 c1 e0 02          	shl    rax,0x2
  8033ff:	48 01 d0             	add    rax,rdx
  803402:	48 c1 e0 02          	shl    rax,0x2
  803406:	48 01 d0             	add    rax,rdx
  803409:	48 c1 e0 03          	shl    rax,0x3
  80340d:	48 05 90 2e 40 00    	add    rax,0x402e90
  803413:	8b 00                	mov    eax,DWORD PTR [rax]
  803415:	85 c0                	test   eax,eax
  803417:	74 41                	je     80345a <sys_find_dev+0x81>
  803419:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80341c:	48 63 d0             	movsxd rdx,eax
  80341f:	48 89 d0             	mov    rax,rdx
  803422:	48 c1 e0 02          	shl    rax,0x2
  803426:	48 01 d0             	add    rax,rdx
  803429:	48 c1 e0 02          	shl    rax,0x2
  80342d:	48 01 d0             	add    rax,rdx
  803430:	48 c1 e0 03          	shl    rax,0x3
  803434:	48 83 c0 10          	add    rax,0x10
  803438:	48 05 80 2e 40 00    	add    rax,0x402e80
  80343e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803442:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803446:	48 89 d6             	mov    rsi,rdx
  803449:	48 89 c7             	mov    rdi,rax
  80344c:	e8 5d 97 00 00       	call   80cbae <strcmp>
  803451:	85 c0                	test   eax,eax
  803453:	75 05                	jne    80345a <sys_find_dev+0x81>
            return i;
  803455:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803458:	eb 0f                	jmp    803469 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  80345a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80345e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803462:	7e 8e                	jle    8033f2 <sys_find_dev+0x19>
    }
    return -1;
  803464:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803469:	c9                   	leave  
  80346a:	c3                   	ret    

000000000080346b <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  80346b:	f3 0f 1e fa          	endbr64 
  80346f:	55                   	push   rbp
  803470:	48 89 e5             	mov    rbp,rsp
  803473:	48 83 ec 30          	sub    rsp,0x30
  803477:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80347b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80347e:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803482:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  803489:	eb 67                	jmp    8034f2 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  80348b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80348e:	48 63 d0             	movsxd rdx,eax
  803491:	48 89 d0             	mov    rax,rdx
  803494:	48 c1 e0 02          	shl    rax,0x2
  803498:	48 01 d0             	add    rax,rdx
  80349b:	48 c1 e0 02          	shl    rax,0x2
  80349f:	48 01 d0             	add    rax,rdx
  8034a2:	48 c1 e0 03          	shl    rax,0x3
  8034a6:	48 05 90 2e 40 00    	add    rax,0x402e90
  8034ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8034ae:	85 c0                	test   eax,eax
  8034b0:	74 3c                	je     8034ee <sys_operate_dev+0x83>
  8034b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034b5:	48 63 d0             	movsxd rdx,eax
  8034b8:	48 89 d0             	mov    rax,rdx
  8034bb:	48 c1 e0 02          	shl    rax,0x2
  8034bf:	48 01 d0             	add    rax,rdx
  8034c2:	48 c1 e0 02          	shl    rax,0x2
  8034c6:	48 01 d0             	add    rax,rdx
  8034c9:	48 c1 e0 03          	shl    rax,0x3
  8034cd:	48 83 c0 10          	add    rax,0x10
  8034d1:	48 05 80 2e 40 00    	add    rax,0x402e80
  8034d7:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8034db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8034df:	48 89 d6             	mov    rsi,rdx
  8034e2:	48 89 c7             	mov    rdi,rax
  8034e5:	e8 c4 96 00 00       	call   80cbae <strcmp>
  8034ea:	85 c0                	test   eax,eax
  8034ec:	74 0c                	je     8034fa <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  8034ee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8034f2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8034f6:	7e 93                	jle    80348b <sys_operate_dev+0x20>
  8034f8:	eb 01                	jmp    8034fb <sys_operate_dev+0x90>
            break;
  8034fa:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  8034fb:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8034ff:	75 0a                	jne    80350b <sys_operate_dev+0xa0>
  803501:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803506:	e9 9c 02 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
    switch (func) {
  80350b:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  80350f:	0f 87 8d 02 00 00    	ja     8037a2 <sys_operate_dev+0x337>
  803515:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  803518:	48 8b 04 c5 d0 4f 81 	mov    rax,QWORD PTR [rax*8+0x814fd0]
  80351f:	00 
  803520:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  803523:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803526:	48 63 d0             	movsxd rdx,eax
  803529:	48 89 d0             	mov    rax,rdx
  80352c:	48 c1 e0 02          	shl    rax,0x2
  803530:	48 01 d0             	add    rax,rdx
  803533:	48 c1 e0 02          	shl    rax,0x2
  803537:	48 01 d0             	add    rax,rdx
  80353a:	48 c1 e0 03          	shl    rax,0x3
  80353e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803544:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803547:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80354b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80354f:	48 89 c7             	mov    rdi,rax
  803552:	ff d2                	call   rdx
  803554:	e9 4e 02 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803559:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80355c:	48 63 d0             	movsxd rdx,eax
  80355f:	48 89 d0             	mov    rax,rdx
  803562:	48 c1 e0 02          	shl    rax,0x2
  803566:	48 01 d0             	add    rax,rdx
  803569:	48 c1 e0 02          	shl    rax,0x2
  80356d:	48 01 d0             	add    rax,rdx
  803570:	48 c1 e0 03          	shl    rax,0x3
  803574:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80357a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80357d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803581:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803585:	48 89 c7             	mov    rdi,rax
  803588:	ff d2                	call   rdx
  80358a:	e9 18 02 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  80358f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803592:	48 63 d0             	movsxd rdx,eax
  803595:	48 89 d0             	mov    rax,rdx
  803598:	48 c1 e0 02          	shl    rax,0x2
  80359c:	48 01 d0             	add    rax,rdx
  80359f:	48 c1 e0 02          	shl    rax,0x2
  8035a3:	48 01 d0             	add    rax,rdx
  8035a6:	48 c1 e0 03          	shl    rax,0x3
  8035aa:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8035b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8035b3:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8035b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8035bb:	48 89 c7             	mov    rdi,rax
  8035be:	ff d2                	call   rdx
  8035c0:	e9 e2 01 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8035c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035c8:	48 63 d0             	movsxd rdx,eax
  8035cb:	48 89 d0             	mov    rax,rdx
  8035ce:	48 c1 e0 02          	shl    rax,0x2
  8035d2:	48 01 d0             	add    rax,rdx
  8035d5:	48 c1 e0 02          	shl    rax,0x2
  8035d9:	48 01 d0             	add    rax,rdx
  8035dc:	48 c1 e0 03          	shl    rax,0x3
  8035e0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8035e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8035e9:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8035ed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8035f1:	48 89 c7             	mov    rdi,rax
  8035f4:	ff d2                	call   rdx
  8035f6:	e9 ac 01 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8035fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035fe:	48 63 d0             	movsxd rdx,eax
  803601:	48 89 d0             	mov    rax,rdx
  803604:	48 c1 e0 02          	shl    rax,0x2
  803608:	48 01 d0             	add    rax,rdx
  80360b:	48 c1 e0 02          	shl    rax,0x2
  80360f:	48 01 d0             	add    rax,rdx
  803612:	48 c1 e0 03          	shl    rax,0x3
  803616:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80361c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80361f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  803623:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803627:	48 89 c7             	mov    rdi,rax
  80362a:	ff d2                	call   rdx
  80362c:	e9 76 01 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  803631:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803634:	48 63 d0             	movsxd rdx,eax
  803637:	48 89 d0             	mov    rax,rdx
  80363a:	48 c1 e0 02          	shl    rax,0x2
  80363e:	48 01 d0             	add    rax,rdx
  803641:	48 c1 e0 02          	shl    rax,0x2
  803645:	48 01 d0             	add    rax,rdx
  803648:	48 c1 e0 03          	shl    rax,0x3
  80364c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803652:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803655:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803659:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80365d:	48 89 c7             	mov    rdi,rax
  803660:	ff d2                	call   rdx
  803662:	e9 40 01 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803667:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80366a:	48 63 d0             	movsxd rdx,eax
  80366d:	48 89 d0             	mov    rax,rdx
  803670:	48 c1 e0 02          	shl    rax,0x2
  803674:	48 01 d0             	add    rax,rdx
  803677:	48 c1 e0 02          	shl    rax,0x2
  80367b:	48 01 d0             	add    rax,rdx
  80367e:	48 c1 e0 03          	shl    rax,0x3
  803682:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803688:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80368b:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  80368f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803693:	48 89 c7             	mov    rdi,rax
  803696:	ff d2                	call   rdx
  803698:	e9 0a 01 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  80369d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a0:	48 63 d0             	movsxd rdx,eax
  8036a3:	48 89 d0             	mov    rax,rdx
  8036a6:	48 c1 e0 02          	shl    rax,0x2
  8036aa:	48 01 d0             	add    rax,rdx
  8036ad:	48 c1 e0 02          	shl    rax,0x2
  8036b1:	48 01 d0             	add    rax,rdx
  8036b4:	48 c1 e0 03          	shl    rax,0x3
  8036b8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036c1:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8036c5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036c9:	48 89 c7             	mov    rdi,rax
  8036cc:	ff d2                	call   rdx
  8036ce:	e9 d4 00 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8036d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d6:	48 63 d0             	movsxd rdx,eax
  8036d9:	48 89 d0             	mov    rax,rdx
  8036dc:	48 c1 e0 02          	shl    rax,0x2
  8036e0:	48 01 d0             	add    rax,rdx
  8036e3:	48 c1 e0 02          	shl    rax,0x2
  8036e7:	48 01 d0             	add    rax,rdx
  8036ea:	48 c1 e0 03          	shl    rax,0x3
  8036ee:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036f7:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8036fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036ff:	48 89 c7             	mov    rdi,rax
  803702:	ff d2                	call   rdx
  803704:	e9 9e 00 00 00       	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803709:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80370c:	48 63 d0             	movsxd rdx,eax
  80370f:	48 89 d0             	mov    rax,rdx
  803712:	48 c1 e0 02          	shl    rax,0x2
  803716:	48 01 d0             	add    rax,rdx
  803719:	48 c1 e0 02          	shl    rax,0x2
  80371d:	48 01 d0             	add    rax,rdx
  803720:	48 c1 e0 03          	shl    rax,0x3
  803724:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80372a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80372d:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  803731:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803735:	48 89 c7             	mov    rdi,rax
  803738:	ff d2                	call   rdx
  80373a:	eb 6b                	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  80373c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80373f:	48 63 d0             	movsxd rdx,eax
  803742:	48 89 d0             	mov    rax,rdx
  803745:	48 c1 e0 02          	shl    rax,0x2
  803749:	48 01 d0             	add    rax,rdx
  80374c:	48 c1 e0 02          	shl    rax,0x2
  803750:	48 01 d0             	add    rax,rdx
  803753:	48 c1 e0 03          	shl    rax,0x3
  803757:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80375d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803760:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803764:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803768:	48 89 c7             	mov    rdi,rax
  80376b:	ff d2                	call   rdx
  80376d:	eb 38                	jmp    8037a7 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  80376f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803772:	48 63 d0             	movsxd rdx,eax
  803775:	48 89 d0             	mov    rax,rdx
  803778:	48 c1 e0 02          	shl    rax,0x2
  80377c:	48 01 d0             	add    rax,rdx
  80377f:	48 c1 e0 02          	shl    rax,0x2
  803783:	48 01 d0             	add    rax,rdx
  803786:	48 c1 e0 03          	shl    rax,0x3
  80378a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803790:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803793:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  803797:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80379b:	48 89 c7             	mov    rdi,rax
  80379e:	ff d2                	call   rdx
  8037a0:	eb 05                	jmp    8037a7 <sys_operate_dev+0x33c>
    }
    return -1;
  8037a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8037a7:	c9                   	leave  
  8037a8:	c3                   	ret    

00000000008037a9 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8037a9:	f3 0f 1e fa          	endbr64 
  8037ad:	55                   	push   rbp
  8037ae:	48 89 e5             	mov    rbp,rsp
  8037b1:	48 83 ec 10          	sub    rsp,0x10
  8037b5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8037b8:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8037bb:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8037bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037c2:	48 63 d0             	movsxd rdx,eax
  8037c5:	48 89 d0             	mov    rax,rdx
  8037c8:	48 c1 e0 02          	shl    rax,0x2
  8037cc:	48 01 d0             	add    rax,rdx
  8037cf:	48 c1 e0 05          	shl    rax,0x5
  8037d3:	48 05 80 58 40 00    	add    rax,0x405880
  8037d9:	8b 00                	mov    eax,DWORD PTR [rax]
  8037db:	85 c0                	test   eax,eax
  8037dd:	75 0a                	jne    8037e9 <call_drv_func+0x40>
  8037df:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8037e4:	e9 15 02 00 00       	jmp    8039fe <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8037e9:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8037ed:	0f 87 06 02 00 00    	ja     8039f9 <call_drv_func+0x250>
  8037f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8037f6:	48 8b 04 c5 30 50 81 	mov    rax,QWORD PTR [rax*8+0x815030]
  8037fd:	00 
  8037fe:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803801:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803804:	48 63 d0             	movsxd rdx,eax
  803807:	48 89 d0             	mov    rax,rdx
  80380a:	48 c1 e0 02          	shl    rax,0x2
  80380e:	48 01 d0             	add    rax,rdx
  803811:	48 c1 e0 05          	shl    rax,0x5
  803815:	48 05 88 58 40 00    	add    rax,0x405888
  80381b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80381e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803822:	48 89 c7             	mov    rdi,rax
  803825:	ff d2                	call   rdx
  803827:	e9 d2 01 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  80382c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80382f:	48 63 d0             	movsxd rdx,eax
  803832:	48 89 d0             	mov    rax,rdx
  803835:	48 c1 e0 02          	shl    rax,0x2
  803839:	48 01 d0             	add    rax,rdx
  80383c:	48 c1 e0 05          	shl    rax,0x5
  803840:	48 05 90 58 40 00    	add    rax,0x405890
  803846:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803849:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80384d:	48 89 c7             	mov    rdi,rax
  803850:	ff d2                	call   rdx
  803852:	e9 a7 01 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803857:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80385a:	48 63 d0             	movsxd rdx,eax
  80385d:	48 89 d0             	mov    rax,rdx
  803860:	48 c1 e0 02          	shl    rax,0x2
  803864:	48 01 d0             	add    rax,rdx
  803867:	48 c1 e0 05          	shl    rax,0x5
  80386b:	48 05 98 58 40 00    	add    rax,0x405898
  803871:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803874:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803878:	48 89 c7             	mov    rdi,rax
  80387b:	ff d2                	call   rdx
  80387d:	e9 7c 01 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803882:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803885:	48 63 d0             	movsxd rdx,eax
  803888:	48 89 d0             	mov    rax,rdx
  80388b:	48 c1 e0 02          	shl    rax,0x2
  80388f:	48 01 d0             	add    rax,rdx
  803892:	48 c1 e0 05          	shl    rax,0x5
  803896:	48 05 a0 58 40 00    	add    rax,0x4058a0
  80389c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80389f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038a3:	48 89 c7             	mov    rdi,rax
  8038a6:	ff d2                	call   rdx
  8038a8:	e9 51 01 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8038ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038b0:	48 63 d0             	movsxd rdx,eax
  8038b3:	48 89 d0             	mov    rax,rdx
  8038b6:	48 c1 e0 02          	shl    rax,0x2
  8038ba:	48 01 d0             	add    rax,rdx
  8038bd:	48 c1 e0 05          	shl    rax,0x5
  8038c1:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8038c7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038ce:	48 89 c7             	mov    rdi,rax
  8038d1:	ff d2                	call   rdx
  8038d3:	e9 26 01 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8038d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038db:	48 63 d0             	movsxd rdx,eax
  8038de:	48 89 d0             	mov    rax,rdx
  8038e1:	48 c1 e0 02          	shl    rax,0x2
  8038e5:	48 01 d0             	add    rax,rdx
  8038e8:	48 c1 e0 05          	shl    rax,0x5
  8038ec:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8038f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f9:	48 89 c7             	mov    rdi,rax
  8038fc:	ff d2                	call   rdx
  8038fe:	e9 fb 00 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  803903:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803906:	48 63 d0             	movsxd rdx,eax
  803909:	48 89 d0             	mov    rax,rdx
  80390c:	48 c1 e0 02          	shl    rax,0x2
  803910:	48 01 d0             	add    rax,rdx
  803913:	48 c1 e0 05          	shl    rax,0x5
  803917:	48 05 b8 58 40 00    	add    rax,0x4058b8
  80391d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803920:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803924:	48 89 c7             	mov    rdi,rax
  803927:	ff d2                	call   rdx
  803929:	e9 d0 00 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  80392e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803931:	48 63 d0             	movsxd rdx,eax
  803934:	48 89 d0             	mov    rax,rdx
  803937:	48 c1 e0 02          	shl    rax,0x2
  80393b:	48 01 d0             	add    rax,rdx
  80393e:	48 c1 e0 05          	shl    rax,0x5
  803942:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803948:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80394b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80394f:	48 89 c7             	mov    rdi,rax
  803952:	ff d2                	call   rdx
  803954:	e9 a5 00 00 00       	jmp    8039fe <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395c:	48 63 d0             	movsxd rdx,eax
  80395f:	48 89 d0             	mov    rax,rdx
  803962:	48 c1 e0 02          	shl    rax,0x2
  803966:	48 01 d0             	add    rax,rdx
  803969:	48 c1 e0 05          	shl    rax,0x5
  80396d:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803973:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803976:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80397a:	48 89 c7             	mov    rdi,rax
  80397d:	ff d2                	call   rdx
  80397f:	eb 7d                	jmp    8039fe <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803981:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803984:	48 63 d0             	movsxd rdx,eax
  803987:	48 89 d0             	mov    rax,rdx
  80398a:	48 c1 e0 02          	shl    rax,0x2
  80398e:	48 01 d0             	add    rax,rdx
  803991:	48 c1 e0 05          	shl    rax,0x5
  803995:	48 05 d0 58 40 00    	add    rax,0x4058d0
  80399b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80399e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039a2:	48 89 c7             	mov    rdi,rax
  8039a5:	ff d2                	call   rdx
  8039a7:	eb 55                	jmp    8039fe <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8039a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039ac:	48 63 d0             	movsxd rdx,eax
  8039af:	48 89 d0             	mov    rax,rdx
  8039b2:	48 c1 e0 02          	shl    rax,0x2
  8039b6:	48 01 d0             	add    rax,rdx
  8039b9:	48 c1 e0 05          	shl    rax,0x5
  8039bd:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8039c3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039ca:	48 89 c7             	mov    rdi,rax
  8039cd:	ff d2                	call   rdx
  8039cf:	eb 2d                	jmp    8039fe <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8039d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039d4:	48 63 d0             	movsxd rdx,eax
  8039d7:	48 89 d0             	mov    rax,rdx
  8039da:	48 c1 e0 02          	shl    rax,0x2
  8039de:	48 01 d0             	add    rax,rdx
  8039e1:	48 c1 e0 05          	shl    rax,0x5
  8039e5:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8039eb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039f2:	48 89 c7             	mov    rdi,rax
  8039f5:	ff d2                	call   rdx
  8039f7:	eb 05                	jmp    8039fe <call_drv_func+0x255>
    }
    return -1;
  8039f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8039fe:	c9                   	leave  
  8039ff:	c3                   	ret    

0000000000803a00 <dispose_device>:
int dispose_device(int dev){
  803a00:	f3 0f 1e fa          	endbr64 
  803a04:	55                   	push   rbp
  803a05:	48 89 e5             	mov    rbp,rsp
  803a08:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803a0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803a0e:	48 63 d0             	movsxd rdx,eax
  803a11:	48 89 d0             	mov    rax,rdx
  803a14:	48 c1 e0 02          	shl    rax,0x2
  803a18:	48 01 d0             	add    rax,rdx
  803a1b:	48 c1 e0 02          	shl    rax,0x2
  803a1f:	48 01 d0             	add    rax,rdx
  803a22:	48 c1 e0 03          	shl    rax,0x3
  803a26:	48 05 90 2e 40 00    	add    rax,0x402e90
  803a2c:	8b 00                	mov    eax,DWORD PTR [rax]
  803a2e:	83 f8 01             	cmp    eax,0x1
  803a31:	74 07                	je     803a3a <dispose_device+0x3a>
  803a33:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803a38:	eb 62                	jmp    803a9c <dispose_device+0x9c>
    device* p=&devs[dev];
  803a3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803a3d:	48 63 d0             	movsxd rdx,eax
  803a40:	48 89 d0             	mov    rax,rdx
  803a43:	48 c1 e0 02          	shl    rax,0x2
  803a47:	48 01 d0             	add    rax,rdx
  803a4a:	48 c1 e0 02          	shl    rax,0x2
  803a4e:	48 01 d0             	add    rax,rdx
  803a51:	48 c1 e0 03          	shl    rax,0x3
  803a55:	48 05 80 2e 40 00    	add    rax,0x402e80
  803a5b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803a5f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a63:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803a6a:	48 85 c0             	test   rax,rax
  803a6d:	74 1d                	je     803a8c <dispose_device+0x8c>
  803a6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a73:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803a7a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803a7e:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803a85:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803a8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a90:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803a97:	b8 00 00 00 00       	mov    eax,0x0
}
  803a9c:	5d                   	pop    rbp
  803a9d:	c3                   	ret    

0000000000803a9e <dispose_driver>:
int dispose_driver(driver *drv){
  803a9e:	f3 0f 1e fa          	endbr64 
  803aa2:	55                   	push   rbp
  803aa3:	48 89 e5             	mov    rbp,rsp
  803aa6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803aaa:	90                   	nop
  803aab:	5d                   	pop    rbp
  803aac:	c3                   	ret    

0000000000803aad <get_dev>:

device *get_dev(int devi)
{
  803aad:	f3 0f 1e fa          	endbr64 
  803ab1:	55                   	push   rbp
  803ab2:	48 89 e5             	mov    rbp,rsp
  803ab5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803ab8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803abb:	48 63 d0             	movsxd rdx,eax
  803abe:	48 89 d0             	mov    rax,rdx
  803ac1:	48 c1 e0 02          	shl    rax,0x2
  803ac5:	48 01 d0             	add    rax,rdx
  803ac8:	48 c1 e0 02          	shl    rax,0x2
  803acc:	48 01 d0             	add    rax,rdx
  803acf:	48 c1 e0 03          	shl    rax,0x3
  803ad3:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803ad9:	5d                   	pop    rbp
  803ada:	c3                   	ret    

0000000000803adb <get_drv>:
driver *get_drv(int drvi)
{
  803adb:	f3 0f 1e fa          	endbr64 
  803adf:	55                   	push   rbp
  803ae0:	48 89 e5             	mov    rbp,rsp
  803ae3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803ae6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ae9:	48 63 d0             	movsxd rdx,eax
  803aec:	48 89 d0             	mov    rax,rdx
  803aef:	48 c1 e0 02          	shl    rax,0x2
  803af3:	48 01 d0             	add    rax,rdx
  803af6:	48 c1 e0 05          	shl    rax,0x5
  803afa:	48 05 80 58 40 00    	add    rax,0x405880
}
  803b00:	5d                   	pop    rbp
  803b01:	c3                   	ret    

0000000000803b02 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803b02:	f3 0f 1e fa          	endbr64 
  803b06:	55                   	push   rbp
  803b07:	48 89 e5             	mov    rbp,rsp
  803b0a:	53                   	push   rbx
  803b0b:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803b0f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803b16:	eb 23                	jmp    803b3b <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803b18:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803b1b:	48 63 d0             	movsxd rdx,eax
  803b1e:	48 89 d0             	mov    rax,rdx
  803b21:	48 01 c0             	add    rax,rax
  803b24:	48 01 d0             	add    rax,rdx
  803b27:	48 c1 e0 06          	shl    rax,0x6
  803b2b:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803b31:	8b 00                	mov    eax,DWORD PTR [rax]
  803b33:	85 c0                	test   eax,eax
  803b35:	74 0c                	je     803b43 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803b37:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803b3b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803b3f:	7e d7                	jle    803b18 <make_request+0x16>
  803b41:	eb 01                	jmp    803b44 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803b43:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803b44:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803b48:	75 0a                	jne    803b54 <make_request+0x52>
  803b4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803b4f:	e9 e7 01 00 00       	jmp    803d3b <make_request+0x239>
    reqs[i]=*args;//放入数组
  803b54:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803b57:	48 63 d0             	movsxd rdx,eax
  803b5a:	48 89 d0             	mov    rax,rdx
  803b5d:	48 01 c0             	add    rax,rax
  803b60:	48 01 d0             	add    rax,rdx
  803b63:	48 c1 e0 06          	shl    rax,0x6
  803b67:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803b6e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803b72:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803b75:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803b79:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803b7c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803b80:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803b84:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803b88:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803b8c:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803b90:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803b94:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803b98:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803b9c:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803ba0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803ba4:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803ba8:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803bac:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803bb0:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803bb4:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803bb8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803bbc:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803bc0:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803bc4:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803bc8:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803bcc:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803bd0:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803bd4:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803bd8:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803bdc:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803be0:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803be4:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803be8:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803bec:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803bf0:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803bf7:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803bfe:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803c05:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803c0c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803c13:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803c1a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803c21:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803c28:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803c2f:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803c36:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803c3d:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803c44:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803c4b:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803c52:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803c59:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803c60:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803c64:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803c6a:	48 63 d0             	movsxd rdx,eax
  803c6d:	48 89 d0             	mov    rax,rdx
  803c70:	48 c1 e0 02          	shl    rax,0x2
  803c74:	48 01 d0             	add    rax,rdx
  803c77:	48 c1 e0 02          	shl    rax,0x2
  803c7b:	48 01 d0             	add    rax,rdx
  803c7e:	48 c1 e0 03          	shl    rax,0x3
  803c82:	48 05 80 2e 40 00    	add    rax,0x402e80
  803c88:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803c8c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c90:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803c97:	48 85 c0             	test   rax,rax
  803c9a:	75 27                	jne    803cc3 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803c9c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803c9f:	48 63 d0             	movsxd rdx,eax
  803ca2:	48 89 d0             	mov    rax,rdx
  803ca5:	48 01 c0             	add    rax,rax
  803ca8:	48 01 d0             	add    rax,rdx
  803cab:	48 c1 e0 06          	shl    rax,0x6
  803caf:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803cb6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803cba:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803cc1:	eb 75                	jmp    803d38 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803cc3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803cc7:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803cce:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803cd2:	eb 0f                	jmp    803ce3 <make_request+0x1e1>
  803cd4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803cd8:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803cdf:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803ce3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803ce7:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803cee:	48 85 c0             	test   rax,rax
  803cf1:	75 e1                	jne    803cd4 <make_request+0x1d2>
        p->next=&reqs[i];
  803cf3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803cf6:	48 63 d0             	movsxd rdx,eax
  803cf9:	48 89 d0             	mov    rax,rdx
  803cfc:	48 01 c0             	add    rax,rax
  803cff:	48 01 d0             	add    rax,rdx
  803d02:	48 c1 e0 06          	shl    rax,0x6
  803d06:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803d0d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803d11:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803d18:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803d1b:	48 63 d0             	movsxd rdx,eax
  803d1e:	48 89 d0             	mov    rax,rdx
  803d21:	48 01 c0             	add    rax,rax
  803d24:	48 01 d0             	add    rax,rdx
  803d27:	48 c1 e0 06          	shl    rax,0x6
  803d2b:	48 05 38 6d 40 00    	add    rax,0x406d38
  803d31:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803d38:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803d3b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803d3f:	c9                   	leave  
  803d40:	c3                   	ret    

0000000000803d41 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803d41:	f3 0f 1e fa          	endbr64 
  803d45:	55                   	push   rbp
  803d46:	48 89 e5             	mov    rbp,rsp
  803d49:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803d4d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803d54:	e9 ab 00 00 00       	jmp    803e04 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803d59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d5c:	48 98                	cdqe   
  803d5e:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803d65:	00 
  803d66:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803d6a:	e9 86 00 00 00       	jmp    803df5 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803d6f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d73:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803d7a:	48 85 c0             	test   rax,rax
  803d7d:	75 67                	jne    803de6 <do_req+0xa5>
  803d7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d83:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d8a:	48 85 c0             	test   rax,rax
  803d8d:	74 57                	je     803de6 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803d8f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d93:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803d9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803d9e:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803da5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803da9:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803db0:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803db7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803dbb:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803dc2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803dc6:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803dcc:	48 98                	cdqe   
  803dce:	48 8b 14 c5 20 d3 80 	mov    rdx,QWORD PTR [rax*8+0x80d320]
  803dd5:	00 
  803dd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803dda:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803de1:	48 89 c7             	mov    rdi,rax
  803de4:	ff d2                	call   rdx
        for(;p;p=p->next)
  803de6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803dea:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803df1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803df5:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803dfa:	0f 85 6f ff ff ff    	jne    803d6f <do_req+0x2e>
    for(int i=0;i<3;i++)
  803e00:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803e04:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803e08:	0f 8e 4b ff ff ff    	jle    803d59 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803e0e:	b8 00 00 00 00       	mov    eax,0x0
}
  803e13:	c9                   	leave  
  803e14:	c3                   	ret    

0000000000803e15 <wait_on_req>:


void wait_on_req(int reqi)
{
  803e15:	f3 0f 1e fa          	endbr64 
  803e19:	55                   	push   rbp
  803e1a:	48 89 e5             	mov    rbp,rsp
  803e1d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803e20:	90                   	nop
  803e21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e24:	48 63 d0             	movsxd rdx,eax
  803e27:	48 89 d0             	mov    rax,rdx
  803e2a:	48 01 c0             	add    rax,rax
  803e2d:	48 01 d0             	add    rax,rdx
  803e30:	48 c1 e0 06          	shl    rax,0x6
  803e34:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803e3a:	8b 00                	mov    eax,DWORD PTR [rax]
  803e3c:	83 f8 03             	cmp    eax,0x3
  803e3f:	75 e0                	jne    803e21 <wait_on_req+0xc>
}
  803e41:	90                   	nop
  803e42:	90                   	nop
  803e43:	5d                   	pop    rbp
  803e44:	c3                   	ret    

0000000000803e45 <clear_req>:
void clear_req(int reqi)
{
  803e45:	f3 0f 1e fa          	endbr64 
  803e49:	55                   	push   rbp
  803e4a:	48 89 e5             	mov    rbp,rsp
  803e4d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803e50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e53:	48 63 d0             	movsxd rdx,eax
  803e56:	48 89 d0             	mov    rax,rdx
  803e59:	48 01 c0             	add    rax,rax
  803e5c:	48 01 d0             	add    rax,rdx
  803e5f:	48 c1 e0 06          	shl    rax,0x6
  803e63:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803e69:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803e6f:	90                   	nop
  803e70:	5d                   	pop    rbp
  803e71:	c3                   	ret    

0000000000803e72 <init_proc>:
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  803e72:	f3 0f 1e fa          	endbr64 
  803e76:	55                   	push   rbp
  803e77:	48 89 e5             	mov    rbp,rsp
  803e7a:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803e7e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803e85:	eb 4c                	jmp    803ed3 <init_proc+0x61>
        task[i].pid=-1;
  803e87:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e8a:	48 98                	cdqe   
  803e8c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803e93:	48 05 e0 84 40 00    	add    rax,0x4084e0
  803e99:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803e9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ea2:	48 98                	cdqe   
  803ea4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803eab:	48 05 f8 84 40 00    	add    rax,0x4084f8
  803eb1:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803eb7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803eba:	48 98                	cdqe   
  803ebc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ec3:	48 05 7c 85 40 00    	add    rax,0x40857c
  803ec9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803ecf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803ed3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803ed7:	7e ae                	jle    803e87 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803ed9:	c7 05 89 17 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11789],0x0        # 41566c <cur_proc>
  803ee0:	00 00 00 
    current=task;
  803ee3:	48 c7 05 f2 16 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc116f2],0x4084e0        # 4155e0 <current>
  803eea:	e0 84 40 00 
    pidd=1;
  803eee:	c7 05 78 17 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11778],0x1        # 415670 <pidd>
  803ef5:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803ef8:	b8 00 00 00 00       	mov    eax,0x0
  803efd:	e8 ec 02 00 00       	call   8041ee <create_proc>
  803f02:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803f05:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f08:	48 98                	cdqe   
  803f0a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f11:	48 05 f8 84 40 00    	add    rax,0x4084f8
  803f17:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803f1d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f20:	83 c0 03             	add    eax,0x3
  803f23:	c1 e0 04             	shl    eax,0x4
  803f26:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803f29:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f2c:	01 c0                	add    eax,eax
  803f2e:	83 c0 05             	add    eax,0x5
  803f31:	c1 e0 03             	shl    eax,0x3
  803f34:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803f37:	68 00 00 80 00       	push   0x800000
  803f3c:	68 00 00 80 00       	push   0x800000
  803f41:	68 00 00 80 00       	push   0x800000
  803f46:	68 00 00 80 00       	push   0x800000
  803f4b:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803f51:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803f57:	b9 00 00 80 00       	mov    ecx,0x800000
  803f5c:	ba 00 00 40 00       	mov    edx,0x400000
  803f61:	be 00 00 40 00       	mov    esi,0x400000
  803f66:	bf 00 00 40 00       	mov    edi,0x400000
  803f6b:	e8 2c 13 00 00       	call   80529c <set_tss>
  803f70:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  803f74:	48 8b 05 25 94 00 00 	mov    rax,QWORD PTR [rip+0x9425]        # 80d3a0 <tss>
  803f7b:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  803f7f:	48 89 c6             	mov    rsi,rax
  803f82:	bf a8 06 00 00       	mov    edi,0x6a8
  803f87:	e8 98 c8 ff ff       	call   800824 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803f8c:	be 08 00 00 00       	mov    esi,0x8
  803f91:	bf 74 01 00 00       	mov    edi,0x174
  803f96:	e8 89 c8 ff ff       	call   800824 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803f9b:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803fa2:	00 20 00 
  803fa5:	48 89 c6             	mov    rsi,rax
  803fa8:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803fad:	48 89 c7             	mov    rdi,rax
  803fb0:	e8 6f c8 ff ff       	call   800824 <wrmsr>
    comprintf("proc init set.\r\ntss.ist=0x%x\r\n",tss->ists[0]);
  803fb5:	48 8b 05 e4 93 00 00 	mov    rax,QWORD PTR [rip+0x93e4]        # 80d3a0 <tss>
  803fbc:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  803fc0:	48 89 c6             	mov    rsi,rax
  803fc3:	bf 90 50 81 00       	mov    edi,0x815090
  803fc8:	b8 00 00 00 00       	mov    eax,0x0
  803fcd:	e8 cb 88 00 00       	call   80c89d <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  803fd2:	90                   	nop
  803fd3:	c9                   	leave  
  803fd4:	c3                   	ret    

0000000000803fd5 <create_test_proc>:
void create_test_proc(){
  803fd5:	f3 0f 1e fa          	endbr64 
  803fd9:	55                   	push   rbp
  803fda:	48 89 e5             	mov    rbp,rsp
  803fdd:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803fe1:	b8 00 00 00 00       	mov    eax,0x0
  803fe6:	e8 86 02 00 00       	call   804271 <req_proc>
  803feb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803fee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ff1:	48 98                	cdqe   
  803ff3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ffa:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804000:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  804006:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80400d:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  804011:	ba 92 d2 80 00       	mov    edx,0x80d292
  804016:	48 83 ec 08          	sub    rsp,0x8
  80401a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80401d:	50                   	push   rax
  80401e:	6a 00                	push   0x0
  804020:	52                   	push   rdx
  804021:	6a 00                	push   0x0
  804023:	6a 00                	push   0x0
  804025:	6a 00                	push   0x0
  804027:	68 58 7d 00 00       	push   0x7d58
  80402c:	6a 10                	push   0x10
  80402e:	6a 10                	push   0x10
  804030:	6a 10                	push   0x10
  804032:	6a 10                	push   0x10
  804034:	41 b9 08 00 00 00    	mov    r9d,0x8
  80403a:	41 b8 10 00 00 00    	mov    r8d,0x10
  804040:	b9 00 00 00 00       	mov    ecx,0x0
  804045:	ba 00 00 00 00       	mov    edx,0x0
  80404a:	be 00 00 00 00       	mov    esi,0x0
  80404f:	bf 00 00 00 00       	mov    edi,0x0
  804054:	e8 e4 02 00 00       	call   80433d <set_proc>
  804059:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  80405d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804060:	48 98                	cdqe   
  804062:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804069:	48 05 b0 86 40 00    	add    rax,0x4086b0
  80406f:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  804076:	00 
    task[index].mem_struct.stack_top=0x7e00;
  804077:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80407a:	48 98                	cdqe   
  80407c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804083:	48 05 14 85 40 00    	add    rax,0x408514
  804089:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  80408f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804092:	48 98                	cdqe   
  804094:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80409b:	48 05 10 85 40 00    	add    rax,0x408510
  8040a1:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  8040a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040aa:	48 98                	cdqe   
  8040ac:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040b3:	48 05 0c 85 40 00    	add    rax,0x40850c
  8040b9:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  8040bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040c2:	48 98                	cdqe   
  8040c4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040cb:	48 05 08 85 40 00    	add    rax,0x408508
  8040d1:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  8040d7:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  8040de:	00 
    str->rax=0;
  8040df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040e3:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  8040ea:	00 
    str->rbx=0;
  8040eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040ef:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  8040f6:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  8040f7:	ba b1 44 80 00       	mov    edx,0x8044b1
  8040fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804100:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  804104:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804108:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  80410f:	00 
    str->rsi=0;
  804110:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804114:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  80411b:	00 
    str->rdi=0;
  80411c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804120:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  804127:	00 
    str->r15=0;
  804128:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80412c:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  804133:	00 
    str->r14=0;
  804134:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804138:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80413f:	00 
    str->r13=0;
  804140:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804144:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  80414b:	00 
    str->r12=0;
  80414c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804150:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  804157:	00 
    str->r11=0x200;
  804158:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80415c:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  804163:	00 
    str->r10=0;
  804164:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804168:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  80416f:	00 
    str->r9=0;
  804170:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804174:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  80417b:	00 
    str->r8=0;
  80417c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804180:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  804187:	00 
    str->rip=proc_zero;
  804188:	ba b1 44 80 00       	mov    edx,0x8044b1
  80418d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804191:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  804198:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80419c:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  8041a3:	08 00 00 00 
    str->rflags=0x00200206;
  8041a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041ab:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  8041b2:	06 02 20 00 
    str->rsp=0x7e00;
  8041b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041ba:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  8041c1:	00 7e 00 00 
    str->ss=0x2b;
  8041c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041c9:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  8041d0:	2b 00 00 00 
    str->ds=0x2b;
  8041d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041d8:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  8041df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041e3:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  8041ea:	00 

}
  8041eb:	90                   	nop
  8041ec:	c9                   	leave  
  8041ed:	c3                   	ret    

00000000008041ee <create_proc>:
int create_proc()
{
  8041ee:	f3 0f 1e fa          	endbr64 
  8041f2:	55                   	push   rbp
  8041f3:	48 89 e5             	mov    rbp,rsp
  8041f6:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  8041fa:	b8 00 00 00 00       	mov    eax,0x0
  8041ff:	e8 6d 00 00 00       	call   804271 <req_proc>
  804204:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  804207:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80420b:	75 07                	jne    804214 <create_proc+0x26>
  80420d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804212:	eb 5b                	jmp    80426f <create_proc+0x81>
    int currsp=0x9fc00-1;
  804214:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80421b:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80421f:	b9 b1 44 80 00       	mov    ecx,0x8044b1
  804224:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804227:	48 98                	cdqe   
  804229:	48 83 ec 08          	sub    rsp,0x8
  80422d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804230:	52                   	push   rdx
  804231:	6a 00                	push   0x0
  804233:	51                   	push   rcx
  804234:	6a 00                	push   0x0
  804236:	6a 00                	push   0x0
  804238:	6a 00                	push   0x0
  80423a:	50                   	push   rax
  80423b:	6a 10                	push   0x10
  80423d:	6a 10                	push   0x10
  80423f:	6a 10                	push   0x10
  804241:	6a 10                	push   0x10
  804243:	41 b9 08 00 00 00    	mov    r9d,0x8
  804249:	41 b8 10 00 00 00    	mov    r8d,0x10
  80424f:	b9 00 00 00 00       	mov    ecx,0x0
  804254:	ba 00 00 00 00       	mov    edx,0x0
  804259:	be 00 00 00 00       	mov    esi,0x0
  80425e:	bf 00 00 00 00       	mov    edi,0x0
  804263:	e8 d5 00 00 00       	call   80433d <set_proc>
  804268:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  80426c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80426f:	c9                   	leave  
  804270:	c3                   	ret    

0000000000804271 <req_proc>:
int req_proc(){
  804271:	f3 0f 1e fa          	endbr64 
  804275:	55                   	push   rbp
  804276:	48 89 e5             	mov    rbp,rsp
    int num=0;
  804279:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  804280:	eb 04                	jmp    804286 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  804282:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  804286:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804289:	48 98                	cdqe   
  80428b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804292:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804298:	8b 00                	mov    eax,DWORD PTR [rax]
  80429a:	83 f8 ff             	cmp    eax,0xffffffff
  80429d:	74 1f                	je     8042be <req_proc+0x4d>
  80429f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042a2:	48 98                	cdqe   
  8042a4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042ab:	48 05 f8 84 40 00    	add    rax,0x4084f8
  8042b1:	8b 00                	mov    eax,DWORD PTR [rax]
  8042b3:	83 f8 03             	cmp    eax,0x3
  8042b6:	74 06                	je     8042be <req_proc+0x4d>
  8042b8:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8042bc:	7e c4                	jle    804282 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8042be:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8042c2:	7e 07                	jle    8042cb <req_proc+0x5a>
        return -1;
  8042c4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042c9:	eb 70                	jmp    80433b <req_proc+0xca>
    task[num].pid=pidd++;
  8042cb:	8b 05 9f 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1139f]        # 415670 <pidd>
  8042d1:	8d 50 01             	lea    edx,[rax+0x1]
  8042d4:	89 15 96 13 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11396],edx        # 415670 <pidd>
  8042da:	89 c2                	mov    edx,eax
  8042dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042df:	48 98                	cdqe   
  8042e1:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042e8:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8042ee:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  8042f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042f3:	48 98                	cdqe   
  8042f5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042fc:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804302:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  804308:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80430b:	48 98                	cdqe   
  80430d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804314:	48 05 fc 84 40 00    	add    rax,0x4084fc
  80431a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  804320:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804323:	48 98                	cdqe   
  804325:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80432c:	48 05 00 85 40 00    	add    rax,0x408500
  804332:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  804338:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80433b:	5d                   	pop    rbp
  80433c:	c3                   	ret    

000000000080433d <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  80433d:	f3 0f 1e fa          	endbr64 
  804341:	55                   	push   rbp
  804342:	48 89 e5             	mov    rbp,rsp
  804345:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804349:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80434d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  804351:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  804355:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  804359:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  80435d:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  804360:	48 98                	cdqe   
  804362:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804369:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80436f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  804373:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804377:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80437b:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  804382:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804386:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80438a:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  804391:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804395:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804399:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  8043a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043a4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8043a8:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  8043af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043b3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8043b7:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  8043be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043c2:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8043c6:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  8043cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043d1:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8043d5:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  8043dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043e0:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8043e4:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  8043eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043ef:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8043f3:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  8043fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043fe:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804402:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  804409:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80440d:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  804411:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  804418:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80441c:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  804420:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  804427:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80442b:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  80442f:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  804436:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80443a:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  80443e:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  804445:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804449:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  804450:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  804454:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804458:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  80445c:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  804463:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804467:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80446b:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  804472:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804476:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80447a:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  804481:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804485:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804489:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  804490:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804494:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  80449b:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  80449f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044a3:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  8044aa:	00 10 10 00 


}
  8044ae:	90                   	nop
  8044af:	5d                   	pop    rbp
  8044b0:	c3                   	ret    

00000000008044b1 <proc_zero>:
void proc_zero()
{
  8044b1:	f3 0f 1e fa          	endbr64 
  8044b5:	55                   	push   rbp
  8044b6:	48 89 e5             	mov    rbp,rsp
  8044b9:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  8044bd:	b8 00 00 00 00       	mov    eax,0x0
  8044c2:	e8 68 4a 00 00       	call   808f2f <sys_analyse_key>
  8044c7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  8044ca:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8044ce:	89 c7                	mov    edi,eax
  8044d0:	e8 62 c8 ff ff       	call   800d37 <putchar>
    {
  8044d5:	eb e6                	jmp    8044bd <proc_zero+0xc>

00000000008044d7 <save_rsp>:
    }
}
void save_rsp(){
  8044d7:	f3 0f 1e fa          	endbr64 
  8044db:	55                   	push   rbp
  8044dc:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  8044df:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  8044e6:	00 
    current->regs.rsp=*p;
  8044e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044eb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8044ee:	48 8b 05 eb 10 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc110eb]        # 4155e0 <current>
  8044f5:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  8044fc:	90                   	nop
  8044fd:	5d                   	pop    rbp
  8044fe:	c3                   	ret    

00000000008044ff <manage_proc>:
void manage_proc(){
  8044ff:	f3 0f 1e fa          	endbr64 
  804503:	55                   	push   rbp
  804504:	48 89 e5             	mov    rbp,rsp
  804507:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  80450b:	8b 05 5b 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1115b]        # 41566c <cur_proc>
  804511:	83 f8 ff             	cmp    eax,0xffffffff
  804514:	74 2d                	je     804543 <manage_proc+0x44>
        task[cur_proc].utime++;
  804516:	8b 05 50 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11150]        # 41566c <cur_proc>
  80451c:	48 63 d0             	movsxd rdx,eax
  80451f:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804526:	48 81 c2 fc 84 40 00 	add    rdx,0x4084fc
  80452d:	8b 12                	mov    edx,DWORD PTR [rdx]
  80452f:	83 c2 01             	add    edx,0x1
  804532:	48 98                	cdqe   
  804534:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80453b:	48 05 fc 84 40 00    	add    rax,0x4084fc
  804541:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804543:	8b 05 23 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11123]        # 41566c <cur_proc>
  804549:	83 f8 ff             	cmp    eax,0xffffffff
  80454c:	74 3c                	je     80458a <manage_proc+0x8b>
  80454e:	8b 05 18 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11118]        # 41566c <cur_proc>
  804554:	48 98                	cdqe   
  804556:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80455d:	48 05 fc 84 40 00    	add    rax,0x4084fc
  804563:	8b 00                	mov    eax,DWORD PTR [rax]
  804565:	83 f8 0a             	cmp    eax,0xa
  804568:	77 20                	ja     80458a <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  80456a:	8b 05 fc 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110fc]        # 41566c <cur_proc>
  804570:	48 98                	cdqe   
  804572:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804579:	48 05 f8 84 40 00    	add    rax,0x4084f8
  80457f:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804581:	83 f8 01             	cmp    eax,0x1
  804584:	0f 84 02 01 00 00    	je     80468c <manage_proc+0x18d>
        if(cur_proc!=-1)
  80458a:	8b 05 dc 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110dc]        # 41566c <cur_proc>
  804590:	83 f8 ff             	cmp    eax,0xffffffff
  804593:	74 1b                	je     8045b0 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  804595:	8b 05 d1 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110d1]        # 41566c <cur_proc>
  80459b:	48 98                	cdqe   
  80459d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8045a4:	48 05 fc 84 40 00    	add    rax,0x4084fc
  8045aa:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  8045b0:	8b 05 b6 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110b6]        # 41566c <cur_proc>
  8045b6:	83 c0 01             	add    eax,0x1
  8045b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  8045bc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  8045c3:	eb 52                	jmp    804617 <manage_proc+0x118>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  8045c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045c8:	48 98                	cdqe   
  8045ca:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8045d1:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8045d7:	8b 00                	mov    eax,DWORD PTR [rax]
  8045d9:	83 f8 ff             	cmp    eax,0xffffffff
  8045dc:	74 24                	je     804602 <manage_proc+0x103>
  8045de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045e1:	48 98                	cdqe   
  8045e3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8045ea:	48 05 f8 84 40 00    	add    rax,0x4084f8
  8045f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8045f2:	83 f8 01             	cmp    eax,0x1
  8045f5:	75 0b                	jne    804602 <manage_proc+0x103>
  8045f7:	8b 05 6f 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1106f]        # 41566c <cur_proc>
  8045fd:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804600:	75 1d                	jne    80461f <manage_proc+0x120>
                break;
            }
            i++;
  804602:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  804606:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80460a:	7e 0b                	jle    804617 <manage_proc+0x118>
                times++;
  80460c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  804610:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  804617:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  80461b:	7e a8                	jle    8045c5 <manage_proc+0xc6>
  80461d:	eb 01                	jmp    804620 <manage_proc+0x121>
                break;
  80461f:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  804620:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  804624:	74 69                	je     80468f <manage_proc+0x190>
        //switch
        task[cur_proc].stat=READY;
  804626:	8b 05 40 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11040]        # 41566c <cur_proc>
  80462c:	48 98                	cdqe   
  80462e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804635:	48 05 f8 84 40 00    	add    rax,0x4084f8
  80463b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804641:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804644:	48 98                	cdqe   
  804646:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80464d:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804653:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  804659:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80465c:	48 98                	cdqe   
  80465e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804665:	48 8d 90 e0 84 40 00 	lea    rdx,[rax+0x4084e0]
  80466c:	8b 05 fa 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ffa]        # 41566c <cur_proc>
  804672:	48 98                	cdqe   
  804674:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80467b:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804681:	48 89 d6             	mov    rsi,rdx
  804684:	48 89 c7             	mov    rdi,rax
  804687:	e8 82 0a 00 00       	call   80510e <switch_to>
    }
    return;
  80468c:	90                   	nop
  80468d:	eb 01                	jmp    804690 <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  80468f:	90                   	nop
}
  804690:	c9                   	leave  
  804691:	c3                   	ret    

0000000000804692 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804692:	f3 0f 1e fa          	endbr64 
  804696:	55                   	push   rbp
  804697:	48 89 e5             	mov    rbp,rsp
  80469a:	48 83 ec 20          	sub    rsp,0x20
  80469e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  8046a1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8046a4:	01 c0                	add    eax,eax
  8046a6:	83 c0 05             	add    eax,0x5
  8046a9:	c1 e0 03             	shl    eax,0x3
  8046ac:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  8046af:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8046b2:	89 05 b4 0f c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10fb4],eax        # 41566c <cur_proc>
    switch_proc_asm(sel);
  8046b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046bb:	89 c7                	mov    edi,eax
  8046bd:	e8 e8 8a 00 00       	call   80d1aa <switch_proc_asm>
}
  8046c2:	90                   	nop
  8046c3:	c9                   	leave  
  8046c4:	c3                   	ret    

00000000008046c5 <switch_proc>:
void switch_proc(int pnr){
  8046c5:	f3 0f 1e fa          	endbr64 
  8046c9:	55                   	push   rbp
  8046ca:	48 89 e5             	mov    rbp,rsp
  8046cd:	48 81 ec 30 03 00 00 	sub    rsp,0x330
  8046d4:	89 bd dc fc ff ff    	mov    DWORD PTR [rbp-0x324],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  8046da:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  8046e0:	48 98                	cdqe   
  8046e2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8046e9:	48 8d 90 e0 84 40 00 	lea    rdx,[rax+0x4084e0]
  8046f0:	48 8d 85 e0 fc ff ff 	lea    rax,[rbp-0x320]
  8046f7:	b9 63 00 00 00       	mov    ecx,0x63
  8046fc:	48 89 c7             	mov    rdi,rax
  8046ff:	48 89 d6             	mov    rsi,rdx
  804702:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  804705:	48 89 f2             	mov    rdx,rsi
  804708:	48 89 f8             	mov    rax,rdi
  80470b:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  80470d:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  80470f:	8b 05 57 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f57]        # 41566c <cur_proc>
  804715:	48 98                	cdqe   
  804717:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80471e:	48 05 d0 01 00 00    	add    rax,0x1d0
  804724:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80472a:	48 83 c0 08          	add    rax,0x8
  80472e:	48 89 c7             	mov    rdi,rax
  804731:	e8 4c 00 00 00       	call   804782 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804736:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  80473c:	89 05 2a 0f c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10f2a],eax        # 41566c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804742:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  804748:	01 c0                	add    eax,eax
  80474a:	83 c0 05             	add    eax,0x5
  80474d:	c1 e0 03             	shl    eax,0x3
  804750:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804753:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  804759:	48 98                	cdqe   
  80475b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804762:	48 05 d0 01 00 00    	add    rax,0x1d0
  804768:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80476e:	48 83 c0 08          	add    rax,0x8
  804772:	48 89 c6             	mov    rsi,rax
  804775:	bf 00 00 00 00       	mov    edi,0x0
  80477a:	e8 8f 09 00 00       	call   80510e <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80477f:	90                   	nop
  804780:	c9                   	leave  
  804781:	c3                   	ret    

0000000000804782 <save_context>:
void save_context(TSS *tss)
{
  804782:	f3 0f 1e fa          	endbr64 
  804786:	55                   	push   rbp
  804787:	48 89 e5             	mov    rbp,rsp
  80478a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  80478e:	90                   	nop
  80478f:	5d                   	pop    rbp
  804790:	c3                   	ret    

0000000000804791 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804791:	f3 0f 1e fa          	endbr64 
  804795:	55                   	push   rbp
  804796:	48 89 e5             	mov    rbp,rsp
  804799:	48 83 ec 60          	sub    rsp,0x60
  80479d:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8047a0:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  8047a3:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8047a6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8047ac:	85 c0                	test   eax,eax
  8047ae:	0f 48 c2             	cmovs  eax,edx
  8047b1:	c1 f8 0c             	sar    eax,0xc
  8047b4:	89 c1                	mov    ecx,eax
  8047b6:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8047b9:	99                   	cdq    
  8047ba:	c1 ea 14             	shr    edx,0x14
  8047bd:	01 d0                	add    eax,edx
  8047bf:	25 ff 0f 00 00       	and    eax,0xfff
  8047c4:	29 d0                	sub    eax,edx
  8047c6:	01 c8                	add    eax,ecx
  8047c8:	85 c0                	test   eax,eax
  8047ca:	0f 95 c0             	setne  al
  8047cd:	0f b6 c0             	movzx  eax,al
  8047d0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  8047d3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  8047da:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8047e1:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  8047e2:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8047e9:	00 
    pgind++;
  8047ea:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8047ef:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  8047f6:	e9 30 02 00 00       	jmp    804a2b <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  8047fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804802:	25 00 f0 ff ff       	and    eax,0xfffff000
  804807:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80480b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  804812:	e9 fe 01 00 00       	jmp    804a15 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  804817:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80481b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80481e:	83 e0 01             	and    eax,0x1
  804821:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804824:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804828:	0f 85 de 01 00 00    	jne    804a0c <palloc+0x27b>
            {
                int new_pg=req_a_page();
  80482e:	b8 00 00 00 00       	mov    eax,0x0
  804833:	e8 b9 cd ff ff       	call   8015f1 <req_a_page>
  804838:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  80483b:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  80483f:	0f 85 b9 00 00 00    	jne    8048fe <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804845:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804848:	48 98                	cdqe   
  80484a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804851:	48 05 48 85 40 00    	add    rax,0x408548
  804857:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80485a:	0f b7 c0             	movzx  eax,ax
  80485d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804860:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804863:	48 98                	cdqe   
  804865:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80486c:	48 05 40 85 40 00    	add    rax,0x408540
  804872:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804876:	0f b7 c0             	movzx  eax,ax
  804879:	c1 e0 10             	shl    eax,0x10
  80487c:	25 00 00 0f 00       	and    eax,0xf0000
  804881:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804884:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804887:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80488a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80488d:	89 c2                	mov    edx,eax
  80488f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804892:	48 98                	cdqe   
  804894:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80489b:	48 05 48 85 40 00    	add    rax,0x408548
  8048a1:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8048a4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8048a7:	48 98                	cdqe   
  8048a9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8048b0:	48 05 40 85 40 00    	add    rax,0x408540
  8048b6:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8048ba:	0f b7 c0             	movzx  eax,ax
  8048bd:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  8048c0:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8048c7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8048ca:	c1 e8 10             	shr    eax,0x10
  8048cd:	83 e0 0f             	and    eax,0xf
  8048d0:	89 c2                	mov    edx,eax
  8048d2:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8048d5:	01 d0                	add    eax,edx
  8048d7:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8048da:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8048dd:	89 c2                	mov    edx,eax
  8048df:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8048e2:	48 98                	cdqe   
  8048e4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8048eb:	48 05 40 85 40 00    	add    rax,0x408540
  8048f1:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8048f5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048f9:	e9 3f 01 00 00       	jmp    804a3d <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  8048fe:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804901:	89 c7                	mov    edi,eax
  804903:	e8 d8 ce ff ff       	call   8017e0 <get_phyaddr>
  804908:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  80490b:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  80490e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804912:	ba 07 00 00 00       	mov    edx,0x7
  804917:	89 ce                	mov    esi,ecx
  804919:	48 89 c7             	mov    rdi,rax
  80491c:	e8 d2 ce ff ff       	call   8017f3 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804921:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804924:	c1 e0 0a             	shl    eax,0xa
  804927:	89 c2                	mov    edx,eax
  804929:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80492c:	01 d0                	add    eax,edx
  80492e:	c1 e0 0c             	shl    eax,0xc
  804931:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804934:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804939:	75 09                	jne    804944 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  80493b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80493e:	89 05 30 0d c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10d30],eax        # 415674 <palloc_paddr>
                }
                page_c--;
  804944:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804948:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80494c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804950:	0f 85 b6 00 00 00    	jne    804a0c <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804956:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804959:	48 98                	cdqe   
  80495b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804962:	48 05 48 85 40 00    	add    rax,0x408548
  804968:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80496b:	0f b7 c0             	movzx  eax,ax
  80496e:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804971:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804974:	48 98                	cdqe   
  804976:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80497d:	48 05 40 85 40 00    	add    rax,0x408540
  804983:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804987:	0f b7 c0             	movzx  eax,ax
  80498a:	c1 e0 10             	shl    eax,0x10
  80498d:	25 00 00 0f 00       	and    eax,0xf0000
  804992:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804995:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804998:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80499b:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80499e:	89 c2                	mov    edx,eax
  8049a0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049a3:	48 98                	cdqe   
  8049a5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8049ac:	48 05 48 85 40 00    	add    rax,0x408548
  8049b2:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8049b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049b8:	48 98                	cdqe   
  8049ba:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8049c1:	48 05 40 85 40 00    	add    rax,0x408540
  8049c7:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8049cb:	0f b7 c0             	movzx  eax,ax
  8049ce:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8049d1:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8049d8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8049db:	c1 e8 10             	shr    eax,0x10
  8049de:	83 e0 0f             	and    eax,0xf
  8049e1:	89 c2                	mov    edx,eax
  8049e3:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8049e6:	01 d0                	add    eax,edx
  8049e8:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8049eb:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8049ee:	89 c2                	mov    edx,eax
  8049f0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049f3:	48 98                	cdqe   
  8049f5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8049fc:	48 05 40 85 40 00    	add    rax,0x408540
  804a02:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  804a06:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a0a:	eb 31                	jmp    804a3d <palloc+0x2ac>
                }
            }
            tblp++;
  804a0c:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804a11:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804a15:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804a1c:	0f 8e f5 fd ff ff    	jle    804817 <palloc+0x86>
        }
        pgind++;
  804a22:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804a27:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804a2b:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804a32:	0f 8e c3 fd ff ff    	jle    8047fb <palloc+0x6a>
    }
    return NULL;
  804a38:	b8 00 00 00 00       	mov    eax,0x0
}
  804a3d:	c9                   	leave  
  804a3e:	c3                   	ret    

0000000000804a3f <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804a3f:	f3 0f 1e fa          	endbr64 
  804a43:	55                   	push   rbp
  804a44:	48 89 e5             	mov    rbp,rsp
  804a47:	48 83 ec 10          	sub    rsp,0x10
  804a4b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804a4e:	8b 05 18 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c18]        # 41566c <cur_proc>
  804a54:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804a57:	89 d6                	mov    esi,edx
  804a59:	89 c7                	mov    edi,eax
  804a5b:	e8 31 fd ff ff       	call   804791 <palloc>
}
  804a60:	c9                   	leave  
  804a61:	c3                   	ret    

0000000000804a62 <proc_end>:
void proc_end()
{
  804a62:	f3 0f 1e fa          	endbr64 
  804a66:	55                   	push   rbp
  804a67:	48 89 e5             	mov    rbp,rsp
  804a6a:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804a6e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804a71:	8b 05 f5 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bf5]        # 41566c <cur_proc>
  804a77:	89 c7                	mov    edi,eax
  804a79:	e8 75 00 00 00       	call   804af3 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804a7e:	8b 05 e8 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10be8]        # 41566c <cur_proc>
  804a84:	48 98                	cdqe   
  804a86:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804a8d:	48 05 7c 85 40 00    	add    rax,0x40857c
  804a93:	8b 00                	mov    eax,DWORD PTR [rax]
  804a95:	83 f8 ff             	cmp    eax,0xffffffff
  804a98:	74 4c                	je     804ae6 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=READY;
  804a9a:	8b 05 cc 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bcc]        # 41566c <cur_proc>
  804aa0:	48 98                	cdqe   
  804aa2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804aa9:	48 05 7c 85 40 00    	add    rax,0x40857c
  804aaf:	8b 00                	mov    eax,DWORD PTR [rax]
  804ab1:	89 c0                	mov    eax,eax
  804ab3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804aba:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804ac0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804ac6:	8b 05 a0 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ba0]        # 41566c <cur_proc>
  804acc:	48 98                	cdqe   
  804ace:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ad5:	48 05 7c 85 40 00    	add    rax,0x40857c
  804adb:	8b 00                	mov    eax,DWORD PTR [rax]
  804add:	89 c7                	mov    edi,eax
  804adf:	e8 ae fb ff ff       	call   804692 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804ae4:	eb 0a                	jmp    804af0 <proc_end+0x8e>
        switch_proc_tss(0);
  804ae6:	bf 00 00 00 00       	mov    edi,0x0
  804aeb:	e8 a2 fb ff ff       	call   804692 <switch_proc_tss>
}
  804af0:	90                   	nop
  804af1:	c9                   	leave  
  804af2:	c3                   	ret    

0000000000804af3 <del_proc>:
void del_proc(int pnr)
{
  804af3:	f3 0f 1e fa          	endbr64 
  804af7:	55                   	push   rbp
  804af8:	48 89 e5             	mov    rbp,rsp
  804afb:	48 83 ec 30          	sub    rsp,0x30
  804aff:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804b02:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804b05:	48 98                	cdqe   
  804b07:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b0e:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804b14:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804b1a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804b1d:	48 98                	cdqe   
  804b1f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b26:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804b2c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804b32:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804b37:	eb 63                	jmp    804b9c <del_proc+0xa9>
    {
        page_item *tp=*p&0xfffff000;
  804b39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b3d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804b40:	25 00 f0 ff ff       	and    eax,0xfffff000
  804b45:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804b49:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804b50:	eb 30                	jmp    804b82 <del_proc+0x8f>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804b52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b56:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804b59:	83 e0 01             	and    eax,0x1
  804b5c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804b5f:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804b63:	74 14                	je     804b79 <del_proc+0x86>
            {
                free_page(*tp&0xfffff000);
  804b65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b69:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804b6c:	25 00 f0 ff ff       	and    eax,0xfffff000
  804b71:	48 89 c7             	mov    rdi,rax
  804b74:	e8 48 cb ff ff       	call   8016c1 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804b79:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804b7e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b82:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804b89:	7e c7                	jle    804b52 <del_proc+0x5f>
        }
        vmfree(tp);
  804b8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b8f:	48 89 c7             	mov    rdi,rax
  804b92:	e8 2f c7 ff ff       	call   8012c6 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804b97:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804b9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ba0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ba3:	83 e0 01             	and    eax,0x1
  804ba6:	48 85 c0             	test   rax,rax
  804ba9:	75 8e                	jne    804b39 <del_proc+0x46>
    }
    //释放存放页目录的页面
    vmfree(p);
  804bab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804baf:	48 89 c7             	mov    rdi,rax
  804bb2:	e8 0f c7 ff ff       	call   8012c6 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804bb7:	90                   	nop
  804bb8:	c9                   	leave  
  804bb9:	c3                   	ret    

0000000000804bba <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804bba:	f3 0f 1e fa          	endbr64 
  804bbe:	55                   	push   rbp
  804bbf:	48 89 e5             	mov    rbp,rsp
  804bc2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804bc5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804bc8:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804bcc:	75 07                	jne    804bd5 <set_proc_stat+0x1b>
  804bce:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804bd3:	eb 79                	jmp    804c4e <set_proc_stat+0x94>
    int i=0;
  804bd5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804bdc:	eb 04                	jmp    804be2 <set_proc_stat+0x28>
  804bde:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804be2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804be5:	48 98                	cdqe   
  804be7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804bee:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804bf4:	8b 10                	mov    edx,DWORD PTR [rax]
  804bf6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bf9:	39 c2                	cmp    edx,eax
  804bfb:	75 e1                	jne    804bde <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804bfd:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804c01:	75 07                	jne    804c0a <set_proc_stat+0x50>
  804c03:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c08:	eb 44                	jmp    804c4e <set_proc_stat+0x94>
    task[i].stat=stat;
  804c0a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804c0d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c10:	48 63 d2             	movsxd rdx,edx
  804c13:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804c1a:	48 81 c2 f8 84 40 00 	add    rdx,0x4084f8
  804c21:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804c23:	8b 05 43 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a43]        # 41566c <cur_proc>
  804c29:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804c2c:	75 1b                	jne    804c49 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804c2e:	8b 05 38 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a38]        # 41566c <cur_proc>
  804c34:	48 98                	cdqe   
  804c36:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c3d:	48 05 fc 84 40 00    	add    rax,0x4084fc
  804c43:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  804c49:	b8 00 00 00 00       	mov    eax,0x0
}
  804c4e:	5d                   	pop    rbp
  804c4f:	c3                   	ret    

0000000000804c50 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  804c50:	f3 0f 1e fa          	endbr64 
  804c54:	55                   	push   rbp
  804c55:	48 89 e5             	mov    rbp,rsp
  804c58:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804c5c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804c63:	eb 67                	jmp    804ccc <add_proc_openf+0x7c>
        if(task[cur_proc].openf[i]==NULL)
  804c65:	8b 05 01 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a01]        # 41566c <cur_proc>
  804c6b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c6e:	48 63 d2             	movsxd rdx,edx
  804c71:	48 83 c2 1a          	add    rdx,0x1a
  804c75:	48 98                	cdqe   
  804c77:	48 c1 e2 03          	shl    rdx,0x3
  804c7b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c82:	48 01 d0             	add    rax,rdx
  804c85:	48 05 e8 84 40 00    	add    rax,0x4084e8
  804c8b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c8e:	48 85 c0             	test   rax,rax
  804c91:	75 35                	jne    804cc8 <add_proc_openf+0x78>
        {
            task[cur_proc].openf[i]=entry;
  804c93:	8b 05 d3 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109d3]        # 41566c <cur_proc>
  804c99:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c9c:	48 63 d2             	movsxd rdx,edx
  804c9f:	48 83 c2 1a          	add    rdx,0x1a
  804ca3:	48 98                	cdqe   
  804ca5:	48 c1 e2 03          	shl    rdx,0x3
  804ca9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804cb0:	48 01 d0             	add    rax,rdx
  804cb3:	48 8d 90 e8 84 40 00 	lea    rdx,[rax+0x4084e8]
  804cba:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cbe:	48 89 02             	mov    QWORD PTR [rdx],rax
            return 0;
  804cc1:	b8 00 00 00 00       	mov    eax,0x0
  804cc6:	eb 0f                	jmp    804cd7 <add_proc_openf+0x87>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804cc8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804ccc:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804cd0:	7e 93                	jle    804c65 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804cd2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804cd7:	5d                   	pop    rbp
  804cd8:	c3                   	ret    

0000000000804cd9 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804cd9:	f3 0f 1e fa          	endbr64 
  804cdd:	55                   	push   rbp
  804cde:	48 89 e5             	mov    rbp,rsp
  804ce1:	48 83 ec 10          	sub    rsp,0x10
  804ce5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804ce8:	8b 05 7e 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1097e]        # 41566c <cur_proc>
  804cee:	89 c7                	mov    edi,eax
  804cf0:	e8 fe fd ff ff       	call   804af3 <del_proc>
    while(1)
        manage_proc();
  804cf5:	b8 00 00 00 00       	mov    eax,0x0
  804cfa:	e8 00 f8 ff ff       	call   8044ff <manage_proc>
  804cff:	eb f4                	jmp    804cf5 <sys_exit+0x1c>

0000000000804d01 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804d01:	f3 0f 1e fa          	endbr64 
  804d05:	55                   	push   rbp
  804d06:	48 89 e5             	mov    rbp,rsp
  804d09:	53                   	push   rbx
  804d0a:	48 83 ec 48          	sub    rsp,0x48
  804d0e:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804d12:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804d16:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804d1a:	b8 00 00 00 00       	mov    eax,0x0
  804d1f:	e8 4d f5 ff ff       	call   804271 <req_proc>
  804d24:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804d27:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804d2b:	75 0a                	jne    804d37 <reg_proc+0x36>
  804d2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d32:	e9 8c 01 00 00       	jmp    804ec3 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804d37:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804d3b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804d3e:	52                   	push   rdx
  804d3f:	6a 00                	push   0x0
  804d41:	50                   	push   rax
  804d42:	6a 00                	push   0x0
  804d44:	6a 00                	push   0x0
  804d46:	6a 00                	push   0x0
  804d48:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804d4d:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804d54:	00 
  804d55:	6a 28                	push   0x28
  804d57:	6a 28                	push   0x28
  804d59:	6a 28                	push   0x28
  804d5b:	6a 28                	push   0x28
  804d5d:	41 b9 30 00 00 00    	mov    r9d,0x30
  804d63:	41 b8 28 00 00 00    	mov    r8d,0x28
  804d69:	b9 00 00 00 00       	mov    ecx,0x0
  804d6e:	ba 00 00 00 00       	mov    edx,0x0
  804d73:	be 00 00 00 00       	mov    esi,0x0
  804d78:	bf 00 00 00 00       	mov    edi,0x0
  804d7d:	e8 bb f5 ff ff       	call   80433d <set_proc>
  804d82:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804d86:	b8 00 00 00 00       	mov    eax,0x0
  804d8b:	e8 a7 c4 ff ff       	call   801237 <vmalloc>
  804d90:	48 89 c2             	mov    rdx,rax
  804d93:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d96:	48 98                	cdqe   
  804d98:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d9f:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804da5:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  804da8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804dab:	48 98                	cdqe   
  804dad:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804db4:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804dba:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  804dbd:	b8 00 00 00 00       	mov    eax,0x0
  804dc2:	e8 70 c4 ff ff       	call   801237 <vmalloc>
  804dc7:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804dca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804dcd:	48 98                	cdqe   
  804dcf:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804dd6:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804ddc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ddf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804de3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804de7:	ba 03 00 00 00       	mov    edx,0x3
  804dec:	be 00 00 00 00       	mov    esi,0x0
  804df1:	48 89 c7             	mov    rdi,rax
  804df4:	e8 4b ca ff ff       	call   801844 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804df9:	b8 00 00 00 00       	mov    eax,0x0
  804dfe:	e8 34 c4 ff ff       	call   801237 <vmalloc>
  804e03:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804e07:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804e0b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804e0f:	48 83 c0 18          	add    rax,0x18
  804e13:	48 83 ca 07          	or     rdx,0x7
  804e17:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804e1a:	b8 00 00 00 00       	mov    eax,0x0
  804e1f:	e8 cd c7 ff ff       	call   8015f1 <req_a_page>
  804e24:	89 c7                	mov    edi,eax
  804e26:	e8 b5 c9 ff ff       	call   8017e0 <get_phyaddr>
  804e2b:	89 c1                	mov    ecx,eax
  804e2d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804e31:	48 05 f8 0f 00 00    	add    rax,0xff8
  804e37:	ba 06 00 00 00       	mov    edx,0x6
  804e3c:	89 ce                	mov    esi,ecx
  804e3e:	48 89 c7             	mov    rdi,rax
  804e41:	e8 55 ca ff ff       	call   80189b <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804e46:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e49:	48 98                	cdqe   
  804e4b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e52:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804e58:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e5b:	48 89 c2             	mov    rdx,rax
  804e5e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e61:	48 98                	cdqe   
  804e63:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e6a:	48 05 20 87 40 00    	add    rax,0x408720
  804e70:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=READY;
  804e74:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e77:	48 98                	cdqe   
  804e79:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e80:	48 05 f8 84 40 00    	add    rax,0x4084f8
  804e86:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804e8c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e8f:	48 98                	cdqe   
  804e91:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e98:	48 8d 90 a8 85 40 00 	lea    rdx,[rax+0x4085a8]
  804e9f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ea3:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  804ea6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ea9:	48 98                	cdqe   
  804eab:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804eb2:	48 8d 90 b0 85 40 00 	lea    rdx,[rax+0x4085b0]
  804eb9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804ebd:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  804ec0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804ec3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804ec7:	c9                   	leave  
  804ec8:	c3                   	ret    

0000000000804ec9 <sys_malloc>:

void * sys_malloc(int size)
{
  804ec9:	f3 0f 1e fa          	endbr64 
  804ecd:	55                   	push   rbp
  804ece:	48 89 e5             	mov    rbp,rsp
  804ed1:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804ed4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ed7:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804edd:	85 c0                	test   eax,eax
  804edf:	0f 48 c2             	cmovs  eax,edx
  804ee2:	c1 f8 0c             	sar    eax,0xc
  804ee5:	89 c1                	mov    ecx,eax
  804ee7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804eea:	99                   	cdq    
  804eeb:	c1 ea 14             	shr    edx,0x14
  804eee:	01 d0                	add    eax,edx
  804ef0:	25 ff 0f 00 00       	and    eax,0xfff
  804ef5:	29 d0                	sub    eax,edx
  804ef7:	01 c8                	add    eax,ecx
  804ef9:	85 c0                	test   eax,eax
  804efb:	0f 95 c0             	setne  al
  804efe:	0f b6 c0             	movzx  eax,al
  804f01:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804f04:	8b 05 62 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10762]        # 41566c <cur_proc>
  804f0a:	48 98                	cdqe   
  804f0c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f13:	48 05 08 85 40 00    	add    rax,0x408508
  804f19:	8b 00                	mov    eax,DWORD PTR [rax]
  804f1b:	48 98                	cdqe   
  804f1d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804f21:	eb 0c                	jmp    804f2f <sys_malloc+0x66>
        hp=hp->next;
  804f23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f27:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804f2b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804f2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f33:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804f37:	48 85 c0             	test   rax,rax
  804f3a:	74 16                	je     804f52 <sys_malloc+0x89>
  804f3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f40:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804f43:	85 c0                	test   eax,eax
  804f45:	75 0b                	jne    804f52 <sys_malloc+0x89>
  804f47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f4b:	8b 00                	mov    eax,DWORD PTR [rax]
  804f4d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804f50:	7e d1                	jle    804f23 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f56:	8b 00                	mov    eax,DWORD PTR [rax]
  804f58:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804f5b:	7e 7f                	jle    804fdc <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804f5d:	8b 05 09 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10709]        # 41566c <cur_proc>
  804f63:	48 98                	cdqe   
  804f65:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f6c:	48 05 0c 85 40 00    	add    rax,0x40850c
  804f72:	8b 10                	mov    edx,DWORD PTR [rax]
  804f74:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f77:	c1 e0 0c             	shl    eax,0xc
  804f7a:	01 d0                	add    eax,edx
  804f7c:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804f81:	7e 0a                	jle    804f8d <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  804f83:	b8 00 00 00 00       	mov    eax,0x0
  804f88:	e9 c8 00 00 00       	jmp    805055 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804f8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f91:	8b 10                	mov    edx,DWORD PTR [rax]
  804f93:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f96:	29 d0                	sub    eax,edx
  804f98:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804f9b:	8b 05 cb 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc106cb]        # 41566c <cur_proc>
  804fa1:	48 98                	cdqe   
  804fa3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804faa:	48 05 0c 85 40 00    	add    rax,0x40850c
  804fb0:	8b 00                	mov    eax,DWORD PTR [rax]
  804fb2:	48 98                	cdqe   
  804fb4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804fb8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804fbf:	eb 13                	jmp    804fd4 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804fc1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804fc5:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804fc8:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804fcf:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804fd0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804fd4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fd7:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804fda:	7c e5                	jl     804fc1 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  804fdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fe0:	8b 00                	mov    eax,DWORD PTR [rax]
  804fe2:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804fe5:	7d 59                	jge    805040 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804fe7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804feb:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804fef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ff2:	83 c0 01             	add    eax,0x1
  804ff5:	c1 e0 0c             	shl    eax,0xc
  804ff8:	48 98                	cdqe   
  804ffa:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804ffe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805002:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  805006:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80500a:	8b 00                	mov    eax,DWORD PTR [rax]
  80500c:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  80500f:	8d 50 ff             	lea    edx,[rax-0x1]
  805012:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805016:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  805018:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80501c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  805020:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805024:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  805028:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80502c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805030:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  805034:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805038:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80503c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  805040:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805044:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80504b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80504f:	48 05 00 10 00 00    	add    rax,0x1000
}
  805055:	5d                   	pop    rbp
  805056:	c3                   	ret    

0000000000805057 <sys_free>:
int sys_free(int ptr)
{
  805057:	f3 0f 1e fa          	endbr64 
  80505b:	55                   	push   rbp
  80505c:	48 89 e5             	mov    rbp,rsp
  80505f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  805062:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805065:	2d 00 10 00 00       	sub    eax,0x1000
  80506a:	48 98                	cdqe   
  80506c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  805070:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805074:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  80507b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80507f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805083:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805087:	eb 2e                	jmp    8050b7 <sys_free+0x60>
    {
        if(p->alloc==0)
  805089:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80508d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805090:	85 c0                	test   eax,eax
  805092:	75 2c                	jne    8050c0 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  805094:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805098:	8b 10                	mov    edx,DWORD PTR [rax]
  80509a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80509e:	8b 00                	mov    eax,DWORD PTR [rax]
  8050a0:	83 c0 01             	add    eax,0x1
  8050a3:	01 c2                	add    edx,eax
  8050a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050a9:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8050ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050af:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8050b3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8050b7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8050bc:	75 cb                	jne    805089 <sys_free+0x32>
  8050be:	eb 01                	jmp    8050c1 <sys_free+0x6a>
            break;
  8050c0:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8050c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050c5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8050c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8050cd:	eb 2e                	jmp    8050fd <sys_free+0xa6>
    {
        if(p->alloc==0)
  8050cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050d3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8050d6:	85 c0                	test   eax,eax
  8050d8:	75 2c                	jne    805106 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8050da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050de:	8b 10                	mov    edx,DWORD PTR [rax]
  8050e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8050e6:	83 c0 01             	add    eax,0x1
  8050e9:	01 c2                	add    edx,eax
  8050eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050ef:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8050f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050f5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8050f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8050fd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805102:	75 cb                	jne    8050cf <sys_free+0x78>
  805104:	eb 01                	jmp    805107 <sys_free+0xb0>
            break;
  805106:	90                   	nop
    }
    //合并完成
    return 0;
  805107:	b8 00 00 00 00       	mov    eax,0x0
}
  80510c:	5d                   	pop    rbp
  80510d:	c3                   	ret    

000000000080510e <switch_to>:

void switch_to(struct process *from, struct process *to) {
  80510e:	f3 0f 1e fa          	endbr64 
  805112:	55                   	push   rbp
  805113:	48 89 e5             	mov    rbp,rsp
  805116:	53                   	push   rbx
  805117:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  80511b:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  80511f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805123:	48 2d e0 84 40 00    	sub    rax,0x4084e0
  805129:	48 c1 f8 02          	sar    rax,0x2
  80512d:	48 89 c2             	mov    rdx,rax
  805130:	48 b8 f7 c0 46 ef 8a 	movabs rax,0x2697cc8aef46c0f7
  805137:	cc 97 26 
  80513a:	48 0f af c2          	imul   rax,rdx
  80513e:	89 05 28 05 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10528],eax        # 41566c <cur_proc>
    current=&task[cur_proc];
  805144:	8b 05 22 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10522]        # 41566c <cur_proc>
  80514a:	48 98                	cdqe   
  80514c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805153:	48 05 e0 84 40 00    	add    rax,0x4084e0
  805159:	48 89 05 80 04 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10480],rax        # 4155e0 <current>
    asm volatile("mov %0,%%rax\n"
  805160:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805164:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  80516b:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  80516e:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  805172:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  805176:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80517a:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  80517e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805182:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805186:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80518a:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  80518e:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  805192:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805196:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  80519d:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 8051c8 <done>
  8051a4:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  8051ab:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  8051b2:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  8051b8:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  8051bf:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  8051c6:	eb 08                	jmp    8051d0 <__switch_to>

00000000008051c8 <done>:
  8051c8:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  8051c9:	90                   	nop
  8051ca:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8051ce:	c9                   	leave  
  8051cf:	c3                   	ret    

00000000008051d0 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  8051d0:	f3 0f 1e fa          	endbr64 
  8051d4:	55                   	push   rbp
  8051d5:	48 89 e5             	mov    rbp,rsp
  8051d8:	53                   	push   rbx
  8051d9:	48 83 ec 18          	sub    rsp,0x18
  8051dd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8051e1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8051e5:	48 8b 05 b4 81 00 00 	mov    rax,QWORD PTR [rip+0x81b4]        # 80d3a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8051ec:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8051f0:	48 8b 05 a9 81 00 00 	mov    rax,QWORD PTR [rip+0x81a9]        # 80d3a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8051f7:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8051fb:	48 8b 05 9e 81 00 00 	mov    rax,QWORD PTR [rip+0x819e]        # 80d3a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  805202:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  805206:	48 8b 05 93 81 00 00 	mov    rax,QWORD PTR [rip+0x8193]        # 80d3a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80520d:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  805211:	48 8b 05 88 81 00 00 	mov    rax,QWORD PTR [rip+0x8188]        # 80d3a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  805218:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  80521c:	48 8b 05 7d 81 00 00 	mov    rax,QWORD PTR [rip+0x817d]        # 80d3a0 <tss>
  805223:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  805227:	48 8b 05 72 81 00 00 	mov    rax,QWORD PTR [rip+0x8172]        # 80d3a0 <tss>
  80522e:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  805232:	48 8b 05 67 81 00 00 	mov    rax,QWORD PTR [rip+0x8167]        # 80d3a0 <tss>
  805239:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80523d:	48 8b 05 5c 81 00 00 	mov    rax,QWORD PTR [rip+0x815c]        # 80d3a0 <tss>
  805244:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  805248:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80524c:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  805253:	41 52                	push   r10
  805255:	41 51                	push   r9
  805257:	41 50                	push   r8
  805259:	57                   	push   rdi
  80525a:	49 89 d9             	mov    r9,rbx
  80525d:	4d 89 d8             	mov    r8,r11
  805260:	48 89 c7             	mov    rdi,rax
  805263:	e8 34 00 00 00       	call   80529c <set_tss>
  805268:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  80526c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805270:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805274:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805278:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80527c:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  805282:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  805288:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  80528e:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  805294:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  805295:	90                   	nop
  805296:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80529a:	c9                   	leave  
  80529b:	c3                   	ret    

000000000080529c <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  80529c:	f3 0f 1e fa          	endbr64 
  8052a0:	55                   	push   rbp
  8052a1:	48 89 e5             	mov    rbp,rsp
  8052a4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8052a8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8052ac:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8052b0:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8052b4:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  8052b8:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  8052bc:	48 8b 05 dd 80 00 00 	mov    rax,QWORD PTR [rip+0x80dd]        # 80d3a0 <tss>
  8052c3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8052c7:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  8052cb:	48 8b 05 ce 80 00 00 	mov    rax,QWORD PTR [rip+0x80ce]        # 80d3a0 <tss>
  8052d2:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8052d6:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  8052da:	48 8b 05 bf 80 00 00 	mov    rax,QWORD PTR [rip+0x80bf]        # 80d3a0 <tss>
  8052e1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8052e5:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  8052e9:	48 8b 05 b0 80 00 00 	mov    rax,QWORD PTR [rip+0x80b0]        # 80d3a0 <tss>
  8052f0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8052f4:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  8052f8:	48 8b 05 a1 80 00 00 	mov    rax,QWORD PTR [rip+0x80a1]        # 80d3a0 <tss>
  8052ff:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  805303:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  805307:	48 8b 05 92 80 00 00 	mov    rax,QWORD PTR [rip+0x8092]        # 80d3a0 <tss>
  80530e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  805312:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  805316:	48 8b 05 83 80 00 00 	mov    rax,QWORD PTR [rip+0x8083]        # 80d3a0 <tss>
  80531d:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  805321:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  805325:	48 8b 05 74 80 00 00 	mov    rax,QWORD PTR [rip+0x8074]        # 80d3a0 <tss>
  80532c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805330:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  805334:	48 8b 05 65 80 00 00 	mov    rax,QWORD PTR [rip+0x8065]        # 80d3a0 <tss>
  80533b:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  80533f:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  805343:	48 8b 05 56 80 00 00 	mov    rax,QWORD PTR [rip+0x8056]        # 80d3a0 <tss>
  80534a:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80534e:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  805352:	90                   	nop
  805353:	5d                   	pop    rbp
  805354:	c3                   	ret    

0000000000805355 <fork_child_ret>:

int fork_child_ret(){
  805355:	f3 0f 1e fa          	endbr64 
  805359:	55                   	push   rbp
  80535a:	48 89 e5             	mov    rbp,rsp
    return 0;
  80535d:	b8 00 00 00 00       	mov    eax,0x0

}
  805362:	5d                   	pop    rbp
  805363:	c3                   	ret    

0000000000805364 <sys_fork>:

int sys_fork(void){
  805364:	f3 0f 1e fa          	endbr64 
  805368:	55                   	push   rbp
  805369:	48 89 e5             	mov    rbp,rsp
  80536c:	53                   	push   rbx
  80536d:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  805371:	b8 00 00 00 00       	mov    eax,0x0
  805376:	e8 f6 ee ff ff       	call   804271 <req_proc>
  80537b:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  80537e:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  805382:	75 0a                	jne    80538e <sys_fork+0x2a>
  805384:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805389:	e9 7a 07 00 00       	jmp    805b08 <sys_fork+0x7a4>
    task[pid].regs=current->regs;
  80538e:	48 8b 05 4b 02 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1024b]        # 4155e0 <current>
  805395:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805398:	48 63 d2             	movsxd rdx,edx
  80539b:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8053a2:	48 81 c2 20 87 40 00 	add    rdx,0x408720
  8053a9:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  8053b0:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  8053b7:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  8053bb:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  8053bf:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  8053c6:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  8053cd:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  8053d1:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  8053d5:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  8053dc:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  8053e3:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  8053e7:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  8053eb:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  8053f2:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  8053f9:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  8053fd:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  805401:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  805408:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  80540f:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  805413:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  805417:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  80541e:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  805425:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  805429:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  80542d:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  805434:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  80543b:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  80543f:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  805443:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  80544a:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  805451:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  805455:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  805459:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  805460:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  805467:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  80546e:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  805475:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  80547c:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  805483:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  80548a:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  805491:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  805498:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  80549f:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  8054a6:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  8054ad:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  8054b4:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  8054bb:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  8054c2:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  8054c9:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  8054d0:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  8054d7:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  8054de:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  8054e5:	ba b1 d2 80 00       	mov    edx,0x80d2b1
  8054ea:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8054ed:	48 98                	cdqe   
  8054ef:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8054f6:	48 05 20 87 40 00    	add    rax,0x408720
  8054fc:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  805500:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805503:	48 98                	cdqe   
  805505:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80550c:	48 05 50 87 40 00    	add    rax,0x408750
  805512:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805516:	48 2d a8 00 00 00    	sub    rax,0xa8
  80551c:	48 89 c2             	mov    rdx,rax
  80551f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805522:	48 98                	cdqe   
  805524:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80552b:	48 05 50 87 40 00    	add    rax,0x408750
  805531:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  805535:	48 8b 05 a4 00 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc100a4]        # 4155e0 <current>
  80553c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80553f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805542:	48 63 d2             	movsxd rdx,edx
  805545:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  80554c:	48 81 c2 e8 84 40 00 	add    rdx,0x4084e8
  805553:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  805555:	48 8b 05 84 00 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10084]        # 4155e0 <current>
  80555c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80555f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805562:	48 63 d2             	movsxd rdx,edx
  805565:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  80556c:	48 81 c2 e4 84 40 00 	add    rdx,0x4084e4
  805573:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  805575:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805578:	48 98                	cdqe   
  80557a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805581:	48 05 50 87 40 00    	add    rax,0x408750
  805587:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80558b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  80558f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805593:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  80559a:	00 
    r->ds=DS_USER;
  80559b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80559f:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  8055a6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055aa:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  8055b1:	28 00 00 00 
    r->es=DS_USER;
  8055b5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055b9:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  8055c0:	00 
    r->rax=task[pid].regs.rax;
  8055c1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055c4:	48 98                	cdqe   
  8055c6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8055cd:	48 05 30 87 40 00    	add    rax,0x408730
  8055d3:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8055d7:	48 89 c2             	mov    rdx,rax
  8055da:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055de:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  8055e2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055e5:	48 98                	cdqe   
  8055e7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8055ee:	48 05 50 87 40 00    	add    rax,0x408750
  8055f4:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8055f8:	48 89 c2             	mov    rdx,rax
  8055fb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8055ff:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  805603:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805606:	48 98                	cdqe   
  805608:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80560f:	48 05 40 87 40 00    	add    rax,0x408740
  805615:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805619:	48 89 c2             	mov    rdx,rax
  80561c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805620:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  805624:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805627:	48 98                	cdqe   
  805629:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805630:	48 05 40 87 40 00    	add    rax,0x408740
  805636:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80563a:	48 89 c2             	mov    rdx,rax
  80563d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805641:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  805645:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805648:	48 98                	cdqe   
  80564a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805651:	48 05 60 87 40 00    	add    rax,0x408760
  805657:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80565b:	48 89 c2             	mov    rdx,rax
  80565e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805662:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  805666:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805669:	48 98                	cdqe   
  80566b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805672:	48 05 70 87 40 00    	add    rax,0x408770
  805678:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80567c:	48 89 c2             	mov    rdx,rax
  80567f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805683:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  805687:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80568a:	48 98                	cdqe   
  80568c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805693:	48 05 a0 87 40 00    	add    rax,0x4087a0
  805699:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80569d:	48 89 c2             	mov    rdx,rax
  8056a0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056a4:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  8056a8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056ab:	48 98                	cdqe   
  8056ad:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8056b4:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8056ba:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056be:	48 89 c2             	mov    rdx,rax
  8056c1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056c5:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  8056c9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056cc:	48 98                	cdqe   
  8056ce:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8056d5:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8056db:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8056df:	48 89 c2             	mov    rdx,rax
  8056e2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056e6:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  8056ea:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056ed:	48 98                	cdqe   
  8056ef:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8056f6:	48 05 c0 87 40 00    	add    rax,0x4087c0
  8056fc:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805700:	48 89 c2             	mov    rdx,rax
  805703:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805707:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  80570b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80570e:	48 98                	cdqe   
  805710:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805717:	48 05 c0 87 40 00    	add    rax,0x4087c0
  80571d:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805721:	48 89 c2             	mov    rdx,rax
  805724:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805728:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  80572c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80572f:	48 98                	cdqe   
  805731:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805738:	48 05 d0 87 40 00    	add    rax,0x4087d0
  80573e:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805742:	48 89 c2             	mov    rdx,rax
  805745:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805749:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  80574d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805750:	48 98                	cdqe   
  805752:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805759:	48 05 d0 87 40 00    	add    rax,0x4087d0
  80575f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805763:	48 89 c2             	mov    rdx,rax
  805766:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80576a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  80576e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805771:	48 98                	cdqe   
  805773:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80577a:	48 05 e0 87 40 00    	add    rax,0x4087e0
  805780:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805784:	48 89 c2             	mov    rdx,rax
  805787:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80578b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  80578f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805793:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  80579a:	48 8b 05 3f fe c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fe3f]        # 4155e0 <current>
  8057a1:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8057a4:	48 63 d2             	movsxd rdx,edx
  8057a7:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8057ae:	48 81 c2 b0 86 40 00 	add    rdx,0x4086b0
  8057b5:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  8057bc:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  8057c3:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  8057c7:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  8057cb:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  8057d2:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  8057d9:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  8057dd:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  8057e1:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  8057e8:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  8057ef:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  8057f3:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  8057f7:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  8057fe:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  805805:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  805809:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  80580d:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  805814:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  80581b:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  80581f:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  805823:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  80582a:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  805831:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  805835:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  805839:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  805840:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  805844:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  80584a:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=READY;
  80584d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805850:	48 98                	cdqe   
  805852:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805859:	48 05 f8 84 40 00    	add    rax,0x4084f8
  80585f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  805865:	8b 05 01 fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe01]        # 41566c <cur_proc>
  80586b:	89 c2                	mov    edx,eax
  80586d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805870:	48 98                	cdqe   
  805872:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805879:	48 05 7c 85 40 00    	add    rax,0x40857c
  80587f:	89 10                	mov    DWORD PTR [rax],edx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805881:	48 8b 05 58 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd58]        # 4155e0 <current>
  805888:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  80588f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805892:	48 98                	cdqe   
  805894:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80589b:	48 05 d0 00 00 00    	add    rax,0xd0
  8058a1:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8058a7:	48 83 c0 08          	add    rax,0x8
  8058ab:	ba 00 01 00 00       	mov    edx,0x100
  8058b0:	48 89 ce             	mov    rsi,rcx
  8058b3:	48 89 c7             	mov    rdi,rax
  8058b6:	e8 55 70 00 00       	call   80c910 <memcpy>
    task[pid].utime=0;
  8058bb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8058be:	48 98                	cdqe   
  8058c0:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058c7:	48 05 fc 84 40 00    	add    rax,0x4084fc
  8058cd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  8058d3:	48 8b 0d 06 fd c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0fd06]        # 4155e0 <current>
  8058da:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8058dd:	48 98                	cdqe   
  8058df:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058e6:	48 8d b0 00 85 40 00 	lea    rsi,[rax+0x408500]
  8058ed:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  8058f1:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  8058f5:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  8058f9:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  8058fd:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  805901:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  805905:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  805909:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  80590d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805910:	48 98                	cdqe   
  805912:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805919:	48 8d 90 e0 84 40 00 	lea    rdx,[rax+0x4084e0]
  805920:	48 8b 05 b9 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fcb9]        # 4155e0 <current>
  805927:	48 89 d6             	mov    rsi,rdx
  80592a:	48 89 c7             	mov    rdi,rax
  80592d:	e8 de 04 00 00       	call   805e10 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805932:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805935:	48 98                	cdqe   
  805937:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80593e:	48 05 14 85 40 00    	add    rax,0x408514
  805944:	8b 00                	mov    eax,DWORD PTR [rax]
  805946:	2d 00 10 00 00       	sub    eax,0x1000
  80594b:	48 98                	cdqe   
  80594d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805951:	eb 5b                	jmp    8059ae <sys_fork+0x64a>
        addr_t new_stkpg=vmalloc();
  805953:	b8 00 00 00 00       	mov    eax,0x0
  805958:	e8 da b8 ff ff       	call   801237 <vmalloc>
  80595d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805961:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805965:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805969:	ba 00 10 00 00       	mov    edx,0x1000
  80596e:	48 89 ce             	mov    rsi,rcx
  805971:	48 89 c7             	mov    rdi,rax
  805974:	e8 97 6f 00 00       	call   80c910 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805979:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80597c:	48 98                	cdqe   
  80597e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805985:	48 05 a0 85 40 00    	add    rax,0x4085a0
  80598b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80598e:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805992:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805996:	48 89 d1             	mov    rcx,rdx
  805999:	ba 07 00 00 00       	mov    edx,0x7
  80599e:	48 89 c7             	mov    rdi,rax
  8059a1:	e8 41 b6 ff ff       	call   800fe7 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8059a6:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  8059ad:	00 
  8059ae:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059b1:	48 98                	cdqe   
  8059b3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8059ba:	48 05 10 85 40 00    	add    rax,0x408510
  8059c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8059c2:	48 98                	cdqe   
  8059c4:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8059c8:	73 89                	jae    805953 <sys_fork+0x5ef>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  8059ca:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  8059d1:	00 
    int f=1;
  8059d2:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8059d9:	e9 81 00 00 00       	jmp    805a5f <sys_fork+0x6fb>
        addr_t new_stkpg=vmalloc();
  8059de:	b8 00 00 00 00       	mov    eax,0x0
  8059e3:	e8 4f b8 ff ff       	call   801237 <vmalloc>
  8059e8:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8059ec:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8059f0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8059f4:	ba 00 10 00 00       	mov    edx,0x1000
  8059f9:	48 89 ce             	mov    rsi,rcx
  8059fc:	48 89 c7             	mov    rdi,rax
  8059ff:	e8 0c 6f 00 00       	call   80c910 <memcpy>
        if(f){
  805a04:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805a08:	74 20                	je     805a2a <sys_fork+0x6c6>
            f=0;
  805a0a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805a11:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805a15:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805a1b:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805a1f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805a23:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805a2a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a2d:	48 98                	cdqe   
  805a2f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a36:	48 05 a0 85 40 00    	add    rax,0x4085a0
  805a3c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805a3f:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805a43:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805a47:	48 89 d1             	mov    rcx,rdx
  805a4a:	ba 07 00 00 00       	mov    edx,0x7
  805a4f:	48 89 c7             	mov    rdi,rax
  805a52:	e8 90 b5 ff ff       	call   800fe7 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805a57:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805a5e:	00 
  805a5f:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805a66:	00 
  805a67:	0f 87 71 ff ff ff    	ja     8059de <sys_fork+0x67a>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805a6d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805a70:	48 98                	cdqe   
  805a72:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a79:	48 05 0c 85 40 00    	add    rax,0x40850c
  805a7f:	8b 00                	mov    eax,DWORD PTR [rax]
  805a81:	2d 00 10 00 00       	sub    eax,0x1000
  805a86:	48 98                	cdqe   
  805a88:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805a8c:	eb 5b                	jmp    805ae9 <sys_fork+0x785>
        addr_t new_hppg=vmalloc();
  805a8e:	b8 00 00 00 00       	mov    eax,0x0
  805a93:	e8 9f b7 ff ff       	call   801237 <vmalloc>
  805a98:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805a9c:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  805aa0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805aa4:	ba 00 10 00 00       	mov    edx,0x1000
  805aa9:	48 89 ce             	mov    rsi,rcx
  805aac:	48 89 c7             	mov    rdi,rax
  805aaf:	e8 5c 6e 00 00       	call   80c910 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805ab4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805ab7:	48 98                	cdqe   
  805ab9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805ac0:	48 05 a0 85 40 00    	add    rax,0x4085a0
  805ac6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805ac9:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805acd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805ad1:	48 89 d1             	mov    rcx,rdx
  805ad4:	ba 07 00 00 00       	mov    edx,0x7
  805ad9:	48 89 c7             	mov    rdi,rax
  805adc:	e8 06 b5 ff ff       	call   800fe7 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805ae1:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805ae8:	00 
  805ae9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805aec:	48 98                	cdqe   
  805aee:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805af5:	48 05 08 85 40 00    	add    rax,0x408508
  805afb:	8b 00                	mov    eax,DWORD PTR [rax]
  805afd:	48 98                	cdqe   
  805aff:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805b03:	73 89                	jae    805a8e <sys_fork+0x72a>
    }
    //父进程运行到这里
    return pid;
  805b05:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805b08:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805b0c:	c9                   	leave  
  805b0d:	c3                   	ret    

0000000000805b0e <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805b0e:	f3 0f 1e fa          	endbr64 
  805b12:	55                   	push   rbp
  805b13:	48 89 e5             	mov    rbp,rsp
  805b16:	48 83 ec 50          	sub    rsp,0x50
  805b1a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805b1e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b22:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805b29:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805b2d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805b31:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805b35:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805b3c:	e9 be 02 00 00       	jmp    805dff <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805b41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b44:	48 98                	cdqe   
  805b46:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805b4d:	00 
  805b4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b52:	48 01 d0             	add    rax,rdx
  805b55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b58:	83 e0 01             	and    eax,0x1
  805b5b:	48 85 c0             	test   rax,rax
  805b5e:	0f 84 97 02 00 00    	je     805dfb <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805b64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b67:	48 98                	cdqe   
  805b69:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805b70:	00 
  805b71:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b75:	48 01 d0             	add    rax,rdx
  805b78:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b7b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805b82:	ff 00 00 
  805b85:	48 21 d0             	and    rax,rdx
  805b88:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  805b8c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805b90:	0f 94 c0             	sete   al
  805b93:	0f b6 c0             	movzx  eax,al
  805b96:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  805b99:	e9 24 02 00 00       	jmp    805dc2 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805b9e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805ba1:	48 98                	cdqe   
  805ba3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805baa:	00 
  805bab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805baf:	48 01 d0             	add    rax,rdx
  805bb2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805bb5:	83 e0 01             	and    eax,0x1
  805bb8:	48 85 c0             	test   rax,rax
  805bbb:	0f 84 fd 01 00 00    	je     805dbe <release_mmap+0x2b0>
  805bc1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805bc4:	48 98                	cdqe   
  805bc6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805bcd:	00 
  805bce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805bd2:	48 01 d0             	add    rax,rdx
  805bd5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805bd8:	25 80 00 00 00       	and    eax,0x80
  805bdd:	48 85 c0             	test   rax,rax
  805be0:	0f 85 d8 01 00 00    	jne    805dbe <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805be6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805be9:	48 98                	cdqe   
  805beb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805bf2:	00 
  805bf3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805bf7:	48 01 d0             	add    rax,rdx
  805bfa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805bfd:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805c04:	ff 00 00 
  805c07:	48 21 d0             	and    rax,rdx
  805c0a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805c0e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805c15:	e9 6b 01 00 00       	jmp    805d85 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805c1a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805c1d:	48 98                	cdqe   
  805c1f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805c26:	00 
  805c27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805c2b:	48 01 d0             	add    rax,rdx
  805c2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c31:	83 e0 01             	and    eax,0x1
  805c34:	48 85 c0             	test   rax,rax
  805c37:	0f 84 dc 00 00 00    	je     805d19 <release_mmap+0x20b>
  805c3d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805c40:	48 98                	cdqe   
  805c42:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805c49:	00 
  805c4a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805c4e:	48 01 d0             	add    rax,rdx
  805c51:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c54:	25 80 00 00 00       	and    eax,0x80
  805c59:	48 85 c0             	test   rax,rax
  805c5c:	0f 85 b7 00 00 00    	jne    805d19 <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805c62:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805c65:	48 98                	cdqe   
  805c67:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805c6e:	00 
  805c6f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805c73:	48 01 d0             	add    rax,rdx
  805c76:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c79:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805c80:	ff 00 00 
  805c83:	48 21 d0             	and    rax,rdx
  805c86:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  805c8a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805c91:	eb 4f                	jmp    805ce2 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  805c93:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805c96:	48 98                	cdqe   
  805c98:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805c9f:	00 
  805ca0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805ca4:	48 01 d0             	add    rax,rdx
  805ca7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805caa:	83 e0 01             	and    eax,0x1
  805cad:	48 85 c0             	test   rax,rax
  805cb0:	74 2c                	je     805cde <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  805cb2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805cb5:	48 98                	cdqe   
  805cb7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805cbe:	00 
  805cbf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805cc3:	48 01 d0             	add    rax,rdx
  805cc6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805cc9:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805cd0:	ff 00 00 
  805cd3:	48 21 d0             	and    rax,rdx
  805cd6:	48 89 c7             	mov    rdi,rax
  805cd9:	e8 e3 b9 ff ff       	call   8016c1 <free_page>
                            for(int l=0;l<512;l++){
  805cde:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805ce2:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  805ce9:	7e a8                	jle    805c93 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805ceb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805cee:	48 98                	cdqe   
  805cf0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805cf7:	00 
  805cf8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805cfc:	48 01 d0             	add    rax,rdx
  805cff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d02:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805d09:	ff 00 00 
  805d0c:	48 21 d0             	and    rax,rdx
  805d0f:	48 89 c7             	mov    rdi,rax
  805d12:	e8 af b5 ff ff       	call   8012c6 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805d17:	eb 68                	jmp    805d81 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  805d19:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d1c:	48 98                	cdqe   
  805d1e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d25:	00 
  805d26:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d2a:	48 01 d0             	add    rax,rdx
  805d2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d30:	83 e0 01             	and    eax,0x1
  805d33:	48 85 c0             	test   rax,rax
  805d36:	74 49                	je     805d81 <release_mmap+0x273>
  805d38:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d3b:	48 98                	cdqe   
  805d3d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d44:	00 
  805d45:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d49:	48 01 d0             	add    rax,rdx
  805d4c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d4f:	25 80 00 00 00       	and    eax,0x80
  805d54:	48 85 c0             	test   rax,rax
  805d57:	74 28                	je     805d81 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  805d59:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d5c:	48 98                	cdqe   
  805d5e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d65:	00 
  805d66:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d6a:	48 01 d0             	add    rax,rdx
  805d6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805d70:	25 00 f0 ff ff       	and    eax,0xfffff000
  805d75:	be 00 02 00 00       	mov    esi,0x200
  805d7a:	89 c7                	mov    edi,eax
  805d7c:	e8 c4 b9 ff ff       	call   801745 <free_pages_at>
                    for(int k=0;k<512;k++)
  805d81:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805d85:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  805d8c:	0f 8e 88 fe ff ff    	jle    805c1a <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  805d92:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805d95:	48 98                	cdqe   
  805d97:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805d9e:	00 
  805d9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805da3:	48 01 d0             	add    rax,rdx
  805da6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805da9:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805db0:	ff 00 00 
  805db3:	48 21 d0             	and    rax,rdx
  805db6:	48 89 c7             	mov    rdi,rax
  805db9:	e8 08 b5 ff ff       	call   8012c6 <vmfree>
            for(;j<512;j++)
  805dbe:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805dc2:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  805dc9:	0f 8e cf fd ff ff    	jle    805b9e <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  805dcf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dd2:	48 98                	cdqe   
  805dd4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ddb:	00 
  805ddc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805de0:	48 01 d0             	add    rax,rdx
  805de3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805de6:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805ded:	ff 00 00 
  805df0:	48 21 d0             	and    rax,rdx
  805df3:	48 89 c7             	mov    rdi,rax
  805df6:	e8 cb b4 ff ff       	call   8012c6 <vmfree>
    for(int i=0;i<512;i++)
  805dfb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805dff:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805e06:	0f 8e 35 fd ff ff    	jle    805b41 <release_mmap+0x33>
        }
    }
}
  805e0c:	90                   	nop
  805e0d:	90                   	nop
  805e0e:	c9                   	leave  
  805e0f:	c3                   	ret    

0000000000805e10 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805e10:	f3 0f 1e fa          	endbr64 
  805e14:	55                   	push   rbp
  805e15:	48 89 e5             	mov    rbp,rsp
  805e18:	48 83 ec 60          	sub    rsp,0x60
  805e1c:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805e20:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805e24:	b8 00 00 00 00       	mov    eax,0x0
  805e29:	e8 09 b4 ff ff       	call   801237 <vmalloc>
  805e2e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805e32:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805e36:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  805e3d:	48 89 c1             	mov    rcx,rax
  805e40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e44:	ba 00 10 00 00       	mov    edx,0x1000
  805e49:	48 89 ce             	mov    rsi,rcx
  805e4c:	48 89 c7             	mov    rdi,rax
  805e4f:	e8 bc 6a 00 00       	call   80c910 <memcpy>
    to->regs.cr3=pml4p;
  805e54:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805e58:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805e5c:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  805e63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805e67:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805e6b:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  805e72:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e76:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805e7a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805e81:	e9 09 03 00 00       	jmp    80618f <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805e86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e89:	48 98                	cdqe   
  805e8b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e92:	00 
  805e93:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e97:	48 01 d0             	add    rax,rdx
  805e9a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e9d:	83 e0 01             	and    eax,0x1
  805ea0:	48 85 c0             	test   rax,rax
  805ea3:	0f 84 e2 02 00 00    	je     80618b <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805ea9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eac:	48 98                	cdqe   
  805eae:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805eb5:	00 
  805eb6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805eba:	48 01 d0             	add    rax,rdx
  805ebd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ec0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  805ec4:	b8 00 00 00 00       	mov    eax,0x0
  805ec9:	e8 69 b3 ff ff       	call   801237 <vmalloc>
  805ece:	48 89 c2             	mov    rdx,rax
  805ed1:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805ed8:	00 ff ff 
  805edb:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805edf:	48 89 c1             	mov    rcx,rax
  805ee2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ee5:	48 98                	cdqe   
  805ee7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805eee:	00 
  805eef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805ef3:	48 01 f0             	add    rax,rsi
  805ef6:	48 09 ca             	or     rdx,rcx
  805ef9:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805efc:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805f03:	ff 00 00 
  805f06:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805f0a:	48 89 c1             	mov    rcx,rax
  805f0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f10:	48 98                	cdqe   
  805f12:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f19:	00 
  805f1a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f1e:	48 01 d0             	add    rax,rdx
  805f21:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f24:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f2b:	ff 00 00 
  805f2e:	48 21 d0             	and    rax,rdx
  805f31:	ba 00 10 00 00       	mov    edx,0x1000
  805f36:	48 89 ce             	mov    rsi,rcx
  805f39:	48 89 c7             	mov    rdi,rax
  805f3c:	e8 cf 69 00 00       	call   80c910 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805f41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f44:	48 98                	cdqe   
  805f46:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f4d:	00 
  805f4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805f52:	48 01 d0             	add    rax,rdx
  805f55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f58:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f5f:	ff 00 00 
  805f62:	48 21 d0             	and    rax,rdx
  805f65:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  805f69:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805f70:	e9 09 02 00 00       	jmp    80617e <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805f75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805f78:	48 98                	cdqe   
  805f7a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f81:	00 
  805f82:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f86:	48 01 d0             	add    rax,rdx
  805f89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f8c:	83 e0 01             	and    eax,0x1
  805f8f:	48 85 c0             	test   rax,rax
  805f92:	0f 84 e2 01 00 00    	je     80617a <copy_mmap+0x36a>
  805f98:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805f9b:	48 98                	cdqe   
  805f9d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fa4:	00 
  805fa5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fa9:	48 01 d0             	add    rax,rdx
  805fac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805faf:	25 80 00 00 00       	and    eax,0x80
  805fb4:	48 85 c0             	test   rax,rax
  805fb7:	0f 85 bd 01 00 00    	jne    80617a <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805fbd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805fc0:	48 98                	cdqe   
  805fc2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fc9:	00 
  805fca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fce:	48 01 d0             	add    rax,rdx
  805fd1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805fd4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  805fd8:	b8 00 00 00 00       	mov    eax,0x0
  805fdd:	e8 55 b2 ff ff       	call   801237 <vmalloc>
  805fe2:	48 89 c2             	mov    rdx,rax
  805fe5:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805fec:	00 ff ff 
  805fef:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805ff3:	48 89 c1             	mov    rcx,rax
  805ff6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805ff9:	48 98                	cdqe   
  805ffb:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  806002:	00 
  806003:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806007:	48 01 f0             	add    rax,rsi
  80600a:	48 09 ca             	or     rdx,rcx
  80600d:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  806010:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  806017:	ff 00 00 
  80601a:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  80601e:	48 89 c1             	mov    rcx,rax
  806021:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806024:	48 98                	cdqe   
  806026:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80602d:	00 
  80602e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806032:	48 01 d0             	add    rax,rdx
  806035:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806038:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80603f:	ff 00 00 
  806042:	48 21 d0             	and    rax,rdx
  806045:	ba 00 10 00 00       	mov    edx,0x1000
  80604a:	48 89 ce             	mov    rsi,rcx
  80604d:	48 89 c7             	mov    rdi,rax
  806050:	e8 bb 68 00 00       	call   80c910 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  806055:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806058:	48 98                	cdqe   
  80605a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806061:	00 
  806062:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806066:	48 01 d0             	add    rax,rdx
  806069:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80606c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806073:	ff 00 00 
  806076:	48 21 d0             	and    rax,rdx
  806079:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  80607d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806084:	e9 e4 00 00 00       	jmp    80616d <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  806089:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80608c:	48 98                	cdqe   
  80608e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806095:	00 
  806096:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80609a:	48 01 d0             	add    rax,rdx
  80609d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060a0:	83 e0 01             	and    eax,0x1
  8060a3:	48 85 c0             	test   rax,rax
  8060a6:	0f 84 bd 00 00 00    	je     806169 <copy_mmap+0x359>
  8060ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060af:	48 98                	cdqe   
  8060b1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8060b8:	00 
  8060b9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8060bd:	48 01 d0             	add    rax,rdx
  8060c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060c3:	25 80 00 00 00       	and    eax,0x80
  8060c8:	48 85 c0             	test   rax,rax
  8060cb:	0f 85 98 00 00 00    	jne    806169 <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8060d1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060d4:	48 98                	cdqe   
  8060d6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8060dd:	00 
  8060de:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8060e2:	48 01 d0             	add    rax,rdx
  8060e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8060e8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  8060ec:	b8 00 00 00 00       	mov    eax,0x0
  8060f1:	e8 41 b1 ff ff       	call   801237 <vmalloc>
  8060f6:	48 89 c2             	mov    rdx,rax
  8060f9:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  806100:	00 ff ff 
  806103:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  806107:	48 89 c1             	mov    rcx,rax
  80610a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80610d:	48 98                	cdqe   
  80610f:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  806116:	00 
  806117:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80611b:	48 01 f0             	add    rax,rsi
  80611e:	48 09 ca             	or     rdx,rcx
  806121:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  806124:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80612b:	ff 00 00 
  80612e:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  806132:	48 89 c1             	mov    rcx,rax
  806135:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806138:	48 98                	cdqe   
  80613a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806141:	00 
  806142:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806146:	48 01 d0             	add    rax,rdx
  806149:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80614c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806153:	ff 00 00 
  806156:	48 21 d0             	and    rax,rdx
  806159:	ba 00 10 00 00       	mov    edx,0x1000
  80615e:	48 89 ce             	mov    rsi,rcx
  806161:	48 89 c7             	mov    rdi,rax
  806164:	e8 a7 67 00 00       	call   80c910 <memcpy>
                    for(int k=0;k<512;k++)
  806169:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80616d:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  806174:	0f 8e 0f ff ff ff    	jle    806089 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  80617a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80617e:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  806185:	0f 8e ea fd ff ff    	jle    805f75 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  80618b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80618f:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  806196:	0f 8e ea fc ff ff    	jle    805e86 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  80619c:	90                   	nop
  80619d:	90                   	nop
  80619e:	c9                   	leave  
  80619f:	c3                   	ret    

00000000008061a0 <getpgrp>:

pid_t getpgrp(void){
  8061a0:	f3 0f 1e fa          	endbr64 
  8061a4:	55                   	push   rbp
  8061a5:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  8061a8:	48 8b 05 31 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f431]        # 4155e0 <current>
  8061af:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  8061b2:	5d                   	pop    rbp
  8061b3:	c3                   	ret    

00000000008061b4 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  8061b4:	f3 0f 1e fa          	endbr64 
  8061b8:	55                   	push   rbp
  8061b9:	48 89 e5             	mov    rbp,rsp
  8061bc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8061bf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8061c2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8061c6:	75 0c                	jne    8061d4 <getpgid+0x20>
        return current->gpid;
  8061c8:	48 8b 05 11 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f411]        # 4155e0 <current>
  8061cf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8061d2:	eb 49                	jmp    80621d <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8061d4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8061db:	eb 35                	jmp    806212 <getpgid+0x5e>
        if(task[i].pid==pid)
  8061dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061e0:	48 98                	cdqe   
  8061e2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8061e9:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8061ef:	8b 10                	mov    edx,DWORD PTR [rax]
  8061f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8061f4:	39 c2                	cmp    edx,eax
  8061f6:	75 16                	jne    80620e <getpgid+0x5a>
            return task[i].gpid;
  8061f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061fb:	48 98                	cdqe   
  8061fd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806204:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80620a:	8b 00                	mov    eax,DWORD PTR [rax]
  80620c:	eb 0f                	jmp    80621d <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80620e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806212:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  806216:	7e c5                	jle    8061dd <getpgid+0x29>
    }
    return -1;
  806218:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80621d:	5d                   	pop    rbp
  80621e:	c3                   	ret    

000000000080621f <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  80621f:	f3 0f 1e fa          	endbr64 
  806223:	55                   	push   rbp
  806224:	48 89 e5             	mov    rbp,rsp
  806227:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80622a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  80622d:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806231:	75 38                	jne    80626b <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  806233:	48 8b 05 a6 f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f3a6]        # 4155e0 <current>
  80623a:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80623d:	48 8b 05 9c f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f39c]        # 4155e0 <current>
  806244:	8b 00                	mov    eax,DWORD PTR [rax]
  806246:	39 c2                	cmp    edx,eax
  806248:	75 0a                	jne    806254 <setpgid+0x35>
            return -1;
  80624a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80624f:	e9 9d 00 00 00       	jmp    8062f1 <setpgid+0xd2>
        current->gpid=gid;
  806254:	48 8b 05 85 f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f385]        # 4155e0 <current>
  80625b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80625e:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  806261:	b8 00 00 00 00       	mov    eax,0x0
  806266:	e9 86 00 00 00       	jmp    8062f1 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  80626b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806272:	eb 72                	jmp    8062e6 <setpgid+0xc7>
        if(task[i].pid==pid)
  806274:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806277:	48 98                	cdqe   
  806279:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806280:	48 05 e0 84 40 00    	add    rax,0x4084e0
  806286:	8b 10                	mov    edx,DWORD PTR [rax]
  806288:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80628b:	39 c2                	cmp    edx,eax
  80628d:	75 53                	jne    8062e2 <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  80628f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806292:	48 98                	cdqe   
  806294:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80629b:	48 05 e8 84 40 00    	add    rax,0x4084e8
  8062a1:	8b 10                	mov    edx,DWORD PTR [rax]
  8062a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062a6:	48 98                	cdqe   
  8062a8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8062af:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8062b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8062b7:	39 c2                	cmp    edx,eax
  8062b9:	75 07                	jne    8062c2 <setpgid+0xa3>
                return -1;
  8062bb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8062c0:	eb 2f                	jmp    8062f1 <setpgid+0xd2>
            task[i].gpid=gid;
  8062c2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8062c5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8062c8:	48 63 d2             	movsxd rdx,edx
  8062cb:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8062d2:	48 81 c2 e4 84 40 00 	add    rdx,0x4084e4
  8062d9:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  8062db:	b8 00 00 00 00       	mov    eax,0x0
  8062e0:	eb 0f                	jmp    8062f1 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8062e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8062e6:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8062ea:	7e 88                	jle    806274 <setpgid+0x55>
        }
    }
    return -1;
  8062ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8062f1:	5d                   	pop    rbp
  8062f2:	c3                   	ret    

00000000008062f3 <setsid>:

pid_t setsid(void){
  8062f3:	f3 0f 1e fa          	endbr64 
  8062f7:	55                   	push   rbp
  8062f8:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  8062fb:	48 8b 15 de f2 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0f2de]        # 4155e0 <current>
  806302:	48 8b 05 d7 f2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f2d7]        # 4155e0 <current>
  806309:	8b 12                	mov    edx,DWORD PTR [rdx]
  80630b:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  80630e:	90                   	nop
  80630f:	5d                   	pop    rbp
  806310:	c3                   	ret    

0000000000806311 <getsid>:
pid_t getsid(pid_t pid){
  806311:	f3 0f 1e fa          	endbr64 
  806315:	55                   	push   rbp
  806316:	48 89 e5             	mov    rbp,rsp
  806319:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  80631c:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806320:	75 0c                	jne    80632e <getsid+0x1d>
        return current->sid;
  806322:	48 8b 05 b7 f2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f2b7]        # 4155e0 <current>
  806329:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80632c:	eb 49                	jmp    806377 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80632e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806335:	eb 35                	jmp    80636c <getsid+0x5b>
        if(task[i].pid==pid)
  806337:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80633a:	48 98                	cdqe   
  80633c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806343:	48 05 e0 84 40 00    	add    rax,0x4084e0
  806349:	8b 10                	mov    edx,DWORD PTR [rax]
  80634b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80634e:	39 c2                	cmp    edx,eax
  806350:	75 16                	jne    806368 <getsid+0x57>
            return task[i].sid;
  806352:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806355:	48 98                	cdqe   
  806357:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80635e:	48 05 e8 84 40 00    	add    rax,0x4084e8
  806364:	8b 00                	mov    eax,DWORD PTR [rax]
  806366:	eb 0f                	jmp    806377 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806368:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80636c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  806370:	7e c5                	jle    806337 <getsid+0x26>
    }
    return -1;
  806372:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  806377:	5d                   	pop    rbp
  806378:	c3                   	ret    

0000000000806379 <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  806379:	f3 0f 1e fa          	endbr64 
  80637d:	55                   	push   rbp
  80637e:	48 89 e5             	mov    rbp,rsp
  806381:	48 83 ec 20          	sub    rsp,0x20
  806385:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806388:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  80638b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80638e:	ba 00 00 00 00       	mov    edx,0x0
  806393:	be 02 00 00 00       	mov    esi,0x2
  806398:	89 c7                	mov    edi,eax
  80639a:	e8 27 01 00 00       	call   8064c6 <sys_ioctl>
    int sid= getsid(0);//获取session id
  80639f:	bf 00 00 00 00       	mov    edi,0x0
  8063a4:	e8 68 ff ff ff       	call   806311 <getsid>
  8063a9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    struct process* new_fgl=NULL;
  8063ac:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8063b3:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  8063b4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8063bb:	e9 85 00 00 00       	jmp    806445 <tcsetpgrp+0xcc>
        if(task[i].stat==ENDED)continue;
  8063c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8063c3:	48 98                	cdqe   
  8063c5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8063cc:	48 05 f8 84 40 00    	add    rax,0x4084f8
  8063d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8063d4:	83 f8 03             	cmp    eax,0x3
  8063d7:	74 67                	je     806440 <tcsetpgrp+0xc7>
        if(task[i].sid==sid){
  8063d9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8063dc:	48 98                	cdqe   
  8063de:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8063e5:	48 05 e8 84 40 00    	add    rax,0x4084e8
  8063eb:	8b 10                	mov    edx,DWORD PTR [rax]
  8063ed:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8063f0:	39 c2                	cmp    edx,eax
  8063f2:	75 4d                	jne    806441 <tcsetpgrp+0xc8>
            task[i].fg_pgid=pgid_id;
  8063f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063f7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8063fa:	48 63 d2             	movsxd rdx,edx
  8063fd:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  806404:	48 81 c2 ec 84 40 00 	add    rdx,0x4084ec
  80640b:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  80640d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806410:	48 98                	cdqe   
  806412:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806419:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80641f:	8b 10                	mov    edx,DWORD PTR [rax]
  806421:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806424:	39 c2                	cmp    edx,eax
  806426:	75 19                	jne    806441 <tcsetpgrp+0xc8>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  806428:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80642b:	48 98                	cdqe   
  80642d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806434:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80643a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80643e:	eb 01                	jmp    806441 <tcsetpgrp+0xc8>
        if(task[i].stat==ENDED)continue;
  806440:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  806441:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806445:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  806449:	0f 8e 71 ff ff ff    	jle    8063c0 <tcsetpgrp+0x47>
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
  80644f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806453:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
  806456:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80645a:	48 63 d2             	movsxd rdx,edx
  80645d:	48 83 c2 1a          	add    rdx,0x1a
  806461:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806466:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80646a:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  80646e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806472:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806475:	48 63 d2             	movsxd rdx,edx
  806478:	48 83 c2 1a          	add    rdx,0x1a
  80647c:	48 8b 74 d0 08       	mov    rsi,QWORD PTR [rax+rdx*8+0x8]
  806481:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806485:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806488:	48 63 d2             	movsxd rdx,edx
  80648b:	48 83 c2 1a          	add    rdx,0x1a
  80648f:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806494:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806498:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80649c:	b9 00 00 00 00       	mov    ecx,0x0
  8064a1:	ba 01 00 00 00       	mov    edx,0x1
  8064a6:	48 89 c7             	mov    rdi,rax
  8064a9:	41 ff d0             	call   r8
    ,TTY_CONNECT,0);
}
  8064ac:	90                   	nop
  8064ad:	c9                   	leave  
  8064ae:	c3                   	ret    

00000000008064af <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  8064af:	f3 0f 1e fa          	endbr64 
  8064b3:	55                   	push   rbp
  8064b4:	48 89 e5             	mov    rbp,rsp
  8064b7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  8064ba:	48 8b 05 1f f1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f11f]        # 4155e0 <current>
  8064c1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  8064c4:	5d                   	pop    rbp
  8064c5:	c3                   	ret    

00000000008064c6 <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  8064c6:	f3 0f 1e fa          	endbr64 
  8064ca:	55                   	push   rbp
  8064cb:	48 89 e5             	mov    rbp,rsp
  8064ce:	48 83 ec 10          	sub    rsp,0x10
  8064d2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8064d5:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8064d8:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  8064dc:	48 8b 05 fd f0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f0fd]        # 4155e0 <current>
  8064e3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8064e6:	48 63 d2             	movsxd rdx,edx
  8064e9:	48 83 c2 1a          	add    rdx,0x1a
  8064ed:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8064f2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064f6:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  8064fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8064fd:	48 63 d0             	movsxd rdx,eax
  806500:	48 8b 05 d9 f0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f0d9]        # 4155e0 <current>
  806507:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  80650a:	48 63 c9             	movsxd rcx,ecx
  80650d:	48 83 c1 1a          	add    rcx,0x1a
  806511:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  806516:	48 8b 05 c3 f0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f0c3]        # 4155e0 <current>
  80651d:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  806520:	48 63 c9             	movsxd rcx,ecx
  806523:	48 83 c1 1a          	add    rcx,0x1a
  806527:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  80652c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806530:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  806534:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  806538:	48 89 c7             	mov    rdi,rax
  80653b:	41 ff d0             	call   r8
    ,request,args);
  80653e:	90                   	nop
  80653f:	c9                   	leave  
  806540:	c3                   	ret    
  806541:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806548:	00 00 00 
  80654b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806550 <outb>:
  806550:	66 89 fa             	mov    dx,di
  806553:	66 89 f0             	mov    ax,si
  806556:	ee                   	out    dx,al
  806557:	e8 29 00 00 00       	call   806585 <io_delay>
  80655c:	c3                   	ret    

000000000080655d <outw>:
  80655d:	66 89 fa             	mov    dx,di
  806560:	66 89 f0             	mov    ax,si
  806563:	66 ef                	out    dx,ax
  806565:	90                   	nop
  806566:	90                   	nop
  806567:	90                   	nop
  806568:	c3                   	ret    

0000000000806569 <inb>:
  806569:	31 c0                	xor    eax,eax
  80656b:	66 89 fa             	mov    dx,di
  80656e:	ec                   	in     al,dx
  80656f:	90                   	nop
  806570:	90                   	nop
  806571:	90                   	nop
  806572:	c3                   	ret    

0000000000806573 <inw>:
  806573:	31 c0                	xor    eax,eax
  806575:	66 89 fa             	mov    dx,di
  806578:	66 ed                	in     ax,dx
  80657a:	90                   	nop
  80657b:	90                   	nop
  80657c:	90                   	nop
  80657d:	c3                   	ret    

000000000080657e <eoi>:
  80657e:	b0 20                	mov    al,0x20
  806580:	e6 a0                	out    0xa0,al
  806582:	e6 20                	out    0x20,al
  806584:	c3                   	ret    

0000000000806585 <io_delay>:
  806585:	90                   	nop
  806586:	90                   	nop
  806587:	90                   	nop
  806588:	90                   	nop
  806589:	c3                   	ret    

000000000080658a <turn_on_int>:
  80658a:	b0 f8                	mov    al,0xf8
  80658c:	e6 21                	out    0x21,al
  80658e:	e8 f2 ff ff ff       	call   806585 <io_delay>
  806593:	b0 af                	mov    al,0xaf
  806595:	e6 a1                	out    0xa1,al
  806597:	e8 e9 ff ff ff       	call   806585 <io_delay>
  80659c:	b8 00 70 10 00       	mov    eax,0x107000
  8065a1:	0f 01 18             	lidt   [rax]
  8065a4:	90                   	nop
  8065a5:	90                   	nop
  8065a6:	90                   	nop
  8065a7:	90                   	nop
  8065a8:	c3                   	ret    

00000000008065a9 <report_back_trace_of_err>:
  8065a9:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8065ae:	50                   	push   rax
  8065af:	68 b8 65 80 00       	push   0x8065b8
  8065b4:	83 c4 08             	add    esp,0x8
  8065b7:	c3                   	ret    

00000000008065b8 <bt_msg>:
  8065b8:	65 72 72             	gs jb  80662d <fill_desc+0x4e>
  8065bb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8065bc:	72 20                	jb     8065de <init_gdt+0x11>
  8065be:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8065bf:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8065c2:	72 73                	jb     806637 <fill_desc+0x58>
  8065c4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8065c7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eec245 <_knl_end+0x2ec245>

00000000008065cd <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8065cd:	f3 0f 1e fa          	endbr64 
  8065d1:	55                   	push   rbp
  8065d2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  8065d5:	66 b8 48 00          	mov    ax,0x48
  8065d9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  8065dc:	90                   	nop
  8065dd:	5d                   	pop    rbp
  8065de:	c3                   	ret    

00000000008065df <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  8065df:	f3 0f 1e fa          	endbr64 
  8065e3:	55                   	push   rbp
  8065e4:	48 89 e5             	mov    rbp,rsp
  8065e7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8065eb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8065ef:	89 d0                	mov    eax,edx
  8065f1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  8065f4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  8065f8:	48 8b 15 a9 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6da9]        # 80d3a8 <gdt>
  8065ff:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806602:	48 c1 e0 04          	shl    rax,0x4
  806606:	48 01 d0             	add    rax,rdx
  806609:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80660d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  806611:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806615:	48 c1 e8 10          	shr    rax,0x10
  806619:	48 89 c1             	mov    rcx,rax
  80661c:	48 8b 15 85 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d85]        # 80d3a8 <gdt>
  806623:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806626:	48 c1 e0 04          	shl    rax,0x4
  80662a:	48 01 d0             	add    rax,rdx
  80662d:	89 ca                	mov    edx,ecx
  80662f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  806632:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806636:	48 c1 e8 18          	shr    rax,0x18
  80663a:	48 89 c1             	mov    rcx,rax
  80663d:	48 8b 15 64 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d64]        # 80d3a8 <gdt>
  806644:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806647:	48 c1 e0 04          	shl    rax,0x4
  80664b:	48 01 d0             	add    rax,rdx
  80664e:	89 ca                	mov    edx,ecx
  806650:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  806653:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806657:	48 c1 e8 20          	shr    rax,0x20
  80665b:	48 89 c2             	mov    rdx,rax
  80665e:	48 8b 0d 43 6d 00 00 	mov    rcx,QWORD PTR [rip+0x6d43]        # 80d3a8 <gdt>
  806665:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806668:	48 c1 e0 04          	shl    rax,0x4
  80666c:	48 01 c8             	add    rax,rcx
  80666f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  806672:	48 8b 15 2f 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d2f]        # 80d3a8 <gdt>
  806679:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80667c:	48 c1 e0 04          	shl    rax,0x4
  806680:	48 01 d0             	add    rax,rdx
  806683:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806687:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80668a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80668e:	48 c1 e8 08          	shr    rax,0x8
  806692:	66 25 f0 00          	and    ax,0xf0
  806696:	48 8b 0d 0b 6d 00 00 	mov    rcx,QWORD PTR [rip+0x6d0b]        # 80d3a8 <gdt>
  80669d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8066a0:	48 c1 e2 04          	shl    rdx,0x4
  8066a4:	48 01 ca             	add    rdx,rcx
  8066a7:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  8066ab:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  8066af:	90                   	nop
  8066b0:	5d                   	pop    rbp
  8066b1:	c3                   	ret    

00000000008066b2 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  8066b2:	f3 0f 1e fa          	endbr64 
  8066b6:	55                   	push   rbp
  8066b7:	48 89 e5             	mov    rbp,rsp
  8066ba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8066bd:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8066c0:	89 c8                	mov    eax,ecx
  8066c2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  8066c6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  8066ca:	48 8b 05 d7 6c 00 00 	mov    rax,QWORD PTR [rip+0x6cd7]        # 80d3a8 <gdt>
  8066d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  8066d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8066d8:	48 c1 e0 04          	shl    rax,0x4
  8066dc:	48 89 c2             	mov    rdx,rax
  8066df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8066e3:	48 01 d0             	add    rax,rdx
  8066e6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8066e9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  8066ec:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8066ef:	48 c1 e0 04          	shl    rax,0x4
  8066f3:	48 89 c2             	mov    rdx,rax
  8066f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8066fa:	48 01 d0             	add    rax,rdx
  8066fd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806700:	c1 ea 10             	shr    edx,0x10
  806703:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  806706:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806709:	48 c1 e0 04          	shl    rax,0x4
  80670d:	48 89 c2             	mov    rdx,rax
  806710:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806714:	48 01 c2             	add    rdx,rax
  806717:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80671b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  80671f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806722:	48 c1 e0 04          	shl    rax,0x4
  806726:	48 89 c2             	mov    rdx,rax
  806729:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80672d:	48 01 c2             	add    rdx,rax
  806730:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  806734:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  806738:	90                   	nop
  806739:	5d                   	pop    rbp
  80673a:	c3                   	ret    

000000000080673b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80673b:	f3 0f 1e fa          	endbr64 
  80673f:	55                   	push   rbp
  806740:	48 89 e5             	mov    rbp,rsp
  806743:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  806746:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  806749:	89 d0                	mov    eax,edx
  80674b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  80674f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  806753:	90                   	nop
  806754:	5d                   	pop    rbp
  806755:	c3                   	ret    
  806756:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80675d:	00 00 00 

0000000000806760 <fill_desc>:
  806760:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  806765:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80676a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80676f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  806774:	be 00 60 00 00       	mov    esi,0x6000
  806779:	c1 e2 03             	shl    edx,0x3
  80677c:	01 d6                	add    esi,edx
  80677e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  806782:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  806787:	c1 e8 10             	shr    eax,0x10
  80678a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80678e:	c1 eb 10             	shr    ebx,0x10
  806791:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  806795:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  806799:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80679d:	c3                   	ret    

000000000080679e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80679e:	f3 0f 1e fa          	endbr64 
  8067a2:	55                   	push   rbp
  8067a3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  8067a6:	b8 00 00 00 00       	mov    eax,0x0
  8067ab:	e8 12 2c 00 00       	call   8093c2 <execute_request>
    do_req();
  8067b0:	b8 00 00 00 00       	mov    eax,0x0
  8067b5:	e8 87 d5 ff ff       	call   803d41 <do_req>
    if(!manage_proc_lock)
  8067ba:	8b 05 28 6b 00 00    	mov    eax,DWORD PTR [rip+0x6b28]        # 80d2e8 <manage_proc_lock>
  8067c0:	85 c0                	test   eax,eax
  8067c2:	75 0a                	jne    8067ce <clock_c+0x30>
    {
        manage_proc();
  8067c4:	b8 00 00 00 00       	mov    eax,0x0
  8067c9:	e8 31 dd ff ff       	call   8044ff <manage_proc>
    }
    //puts("1 disk req executed.");
  8067ce:	90                   	nop
  8067cf:	5d                   	pop    rbp
  8067d0:	c3                   	ret    
  8067d1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8067d8:	00 00 00 
  8067db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008067e0 <clock>:
  8067e0:	50                   	push   rax
  8067e1:	53                   	push   rbx
  8067e2:	51                   	push   rcx
  8067e3:	52                   	push   rdx
  8067e4:	57                   	push   rdi
  8067e5:	56                   	push   rsi
  8067e6:	41 50                	push   r8
  8067e8:	41 51                	push   r9
  8067ea:	41 52                	push   r10
  8067ec:	41 53                	push   r11
  8067ee:	41 54                	push   r12
  8067f0:	41 55                	push   r13
  8067f2:	41 56                	push   r14
  8067f4:	41 57                	push   r15
  8067f6:	e8 dc dc ff ff       	call   8044d7 <save_rsp>
  8067fb:	66 8c c0             	mov    ax,es
  8067fe:	50                   	push   rax
  8067ff:	66 8c d8             	mov    ax,ds
  806802:	50                   	push   rax
  806803:	66 b8 10 00          	mov    ax,0x10
  806807:	8e c0                	mov    es,eax
  806809:	8e d8                	mov    ds,eax

000000000080680b <clock.normal_part>:
  80680b:	b0 20                	mov    al,0x20
  80680d:	e6 a0                	out    0xa0,al
  80680f:	e6 20                	out    0x20,al
  806811:	e8 88 ff ff ff       	call   80679e <clock_c>
  806816:	58                   	pop    rax
  806817:	8e d8                	mov    ds,eax
  806819:	58                   	pop    rax
  80681a:	8e c0                	mov    es,eax
  80681c:	41 5f                	pop    r15
  80681e:	41 5e                	pop    r14
  806820:	41 5d                	pop    r13
  806822:	41 5c                	pop    r12
  806824:	41 5b                	pop    r11
  806826:	41 5a                	pop    r10
  806828:	41 59                	pop    r9
  80682a:	41 58                	pop    r8
  80682c:	5e                   	pop    rsi
  80682d:	5f                   	pop    rdi
  80682e:	5a                   	pop    rdx
  80682f:	59                   	pop    rcx
  806830:	5b                   	pop    rbx
  806831:	58                   	pop    rax
  806832:	48 cf                	iretq  

0000000000806834 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  806834:	f3 0f 1e fa          	endbr64 
  806838:	55                   	push   rbp
  806839:	48 89 e5             	mov    rbp,rsp
  80683c:	48 83 ec 30          	sub    rsp,0x30
  806840:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806844:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  806848:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80684f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  806856:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80685a:	be 00 10 00 00       	mov    esi,0x1000
  80685f:	48 89 c7             	mov    rdi,rax
  806862:	e8 49 19 00 00       	call   8081b0 <sys_open>
  806867:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  80686a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80686e:	79 0a                	jns    80687a <execute+0x46>
  806870:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806875:	e9 ba 00 00 00       	jmp    806934 <execute+0x100>
    //
    char *p=path;
  80687a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80687e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  806882:	eb 05                	jmp    806889 <execute+0x55>
  806884:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  806889:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80688d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806890:	84 c0                	test   al,al
  806892:	75 f0                	jne    806884 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  806894:	eb 05                	jmp    80689b <execute+0x67>
  806896:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  80689b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80689f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068a2:	3c 2f                	cmp    al,0x2f
  8068a4:	74 0a                	je     8068b0 <execute+0x7c>
  8068a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068aa:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8068ae:	77 e6                	ja     806896 <execute+0x62>
    if(p>path)
  8068b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068b4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8068b8:	76 2f                	jbe    8068e9 <execute+0xb5>
    {
        *p='\0';
  8068ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068be:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  8068c1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8068c5:	be 00 40 00 00       	mov    esi,0x4000
  8068ca:	48 89 c7             	mov    rdi,rax
  8068cd:	e8 de 18 00 00       	call   8081b0 <sys_open>
  8068d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8068d5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8068d9:	79 07                	jns    8068e2 <execute+0xae>
  8068db:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8068e0:	eb 52                	jmp    806934 <execute+0x100>
        *p='/';
  8068e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068e6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  8068e9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8068ec:	48 63 d0             	movsxd rdx,eax
  8068ef:	48 89 d0             	mov    rax,rdx
  8068f2:	48 c1 e0 02          	shl    rax,0x2
  8068f6:	48 01 d0             	add    rax,rdx
  8068f9:	48 c1 e0 03          	shl    rax,0x3
  8068fd:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  806904:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806907:	48 63 c8             	movsxd rcx,eax
  80690a:	48 89 c8             	mov    rax,rcx
  80690d:	48 c1 e0 02          	shl    rax,0x2
  806911:	48 01 c8             	add    rax,rcx
  806914:	48 c1 e0 03          	shl    rax,0x3
  806918:	48 05 60 06 40 00    	add    rax,0x400660
  80691e:	b9 99 6a 80 00       	mov    ecx,0x806a99
  806923:	48 89 c6             	mov    rsi,rax
  806926:	48 89 cf             	mov    rdi,rcx
  806929:	e8 d3 e3 ff ff       	call   804d01 <reg_proc>
  80692e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  806931:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  806934:	c9                   	leave  
  806935:	c3                   	ret    

0000000000806936 <sys_execve>:

int sys_execve(char *path,char **argv){
  806936:	f3 0f 1e fa          	endbr64 
  80693a:	55                   	push   rbp
  80693b:	48 89 e5             	mov    rbp,rsp
  80693e:	48 83 ec 30          	sub    rsp,0x30
  806942:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806946:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  80694a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  806951:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  806958:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80695c:	be 00 10 00 00       	mov    esi,0x1000
  806961:	48 89 c7             	mov    rdi,rax
  806964:	e8 47 18 00 00       	call   8081b0 <sys_open>
  806969:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80696c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806970:	79 0a                	jns    80697c <sys_execve+0x46>
  806972:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  806977:	e9 ad 00 00 00       	jmp    806a29 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  80697c:	48 8b 05 5d ec c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ec5d]        # 4155e0 <current>
  806983:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  80698a:	48 2d 60 06 40 00    	sub    rax,0x400660
  806990:	48 c1 f8 03          	sar    rax,0x3
  806994:	48 89 c2             	mov    rdx,rax
  806997:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  80699e:	cc cc cc 
  8069a1:	48 0f af c2          	imul   rax,rdx
  8069a5:	89 c7                	mov    edi,eax
  8069a7:	e8 9b 1d 00 00       	call   808747 <sys_close>

    void *retp= load_pe;
  8069ac:	48 c7 45 f0 cb 6a 80 	mov    QWORD PTR [rbp-0x10],0x806acb
  8069b3:	00 
    current->exef=&opened[fno];//改变执行文件
  8069b4:	48 8b 15 25 ec c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0ec25]        # 4155e0 <current>
  8069bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069be:	48 63 c8             	movsxd rcx,eax
  8069c1:	48 89 c8             	mov    rax,rcx
  8069c4:	48 c1 e0 02          	shl    rax,0x2
  8069c8:	48 01 c8             	add    rax,rcx
  8069cb:	48 c1 e0 03          	shl    rax,0x3
  8069cf:	48 05 60 06 40 00    	add    rax,0x400660
  8069d5:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  8069dc:	48 8b 05 fd eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ebfd]        # 4155e0 <current>
  8069e3:	48 89 c7             	mov    rdi,rax
  8069e6:	e8 23 f1 ff ff       	call   805b0e <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  8069eb:	48 8b 05 ee eb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ebee]        # 4155e0 <current>
  8069f2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  8069f9:	ff 00 00 
  8069fc:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  806a03:	48 8b 05 96 69 00 00 	mov    rax,QWORD PTR [rip+0x6996]        # 80d3a0 <tss>
  806a0a:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  806a0e:	48 2d a8 00 00 00    	sub    rax,0xa8
  806a14:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  806a18:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806a1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a20:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  806a24:	b8 00 00 00 00       	mov    eax,0x0
}
  806a29:	c9                   	leave  
  806a2a:	c3                   	ret    

0000000000806a2b <exec_call>:
int exec_call(char *path)
{
  806a2b:	f3 0f 1e fa          	endbr64 
  806a2f:	55                   	push   rbp
  806a30:	48 89 e5             	mov    rbp,rsp
  806a33:	48 83 ec 20          	sub    rsp,0x20
  806a37:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  806a3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a3f:	be 00 00 00 00       	mov    esi,0x0
  806a44:	48 89 c7             	mov    rdi,rax
  806a47:	e8 e8 fd ff ff       	call   806834 <execute>
  806a4c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  806a4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a52:	01 c0                	add    eax,eax
  806a54:	83 c0 05             	add    eax,0x5
  806a57:	c1 e0 03             	shl    eax,0x3
  806a5a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  806a5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a60:	89 c7                	mov    edi,eax
  806a62:	e8 2b dc ff ff       	call   804692 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  806a67:	90                   	nop
  806a68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a6b:	48 98                	cdqe   
  806a6d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806a74:	48 05 f0 84 40 00    	add    rax,0x4084f0
  806a7a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806a7d:	83 f8 03             	cmp    eax,0x3
  806a80:	75 e6                	jne    806a68 <exec_call+0x3d>
    return task[pi].exit_code;
  806a82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a85:	48 98                	cdqe   
  806a87:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806a8e:	48 05 00 85 40 00    	add    rax,0x408500
  806a94:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806a97:	c9                   	leave  
  806a98:	c3                   	ret    

0000000000806a99 <proc_start>:
int proc_start()
{
  806a99:	f3 0f 1e fa          	endbr64 
  806a9d:	55                   	push   rbp
  806a9e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806aa1:	8b 05 c5 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ebc5]        # 41566c <cur_proc>
  806aa7:	48 98                	cdqe   
  806aa9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806ab0:	48 05 e0 84 40 00    	add    rax,0x4084e0
  806ab6:	48 89 c7             	mov    rdi,rax
  806ab9:	e8 0d 00 00 00       	call   806acb <load_pe>
    //释放进程资源
    sys_exit(0);
  806abe:	bf 00 00 00 00       	mov    edi,0x0
  806ac3:	e8 11 e2 ff ff       	call   804cd9 <sys_exit>
}
  806ac8:	90                   	nop
  806ac9:	5d                   	pop    rbp
  806aca:	c3                   	ret    

0000000000806acb <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  806acb:	f3 0f 1e fa          	endbr64 
  806acf:	55                   	push   rbp
  806ad0:	48 89 e5             	mov    rbp,rsp
  806ad3:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  806ada:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806ae1:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  806ae8:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806aef:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  806af3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806afa:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806b01:	eb 28                	jmp    806b2b <load_pe+0x60>
        if(current->openf[i]==f)
  806b03:	48 8b 05 d6 ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ead6]        # 4155e0 <current>
  806b0a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806b0d:	48 63 d2             	movsxd rdx,edx
  806b10:	48 83 c2 1a          	add    rdx,0x1a
  806b14:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806b19:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  806b1d:	75 08                	jne    806b27 <load_pe+0x5c>
        {
            exefno=i;
  806b1f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806b22:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806b25:	eb 0a                	jmp    806b31 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806b27:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806b2b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806b2f:	7e d2                	jle    806b03 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806b31:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806b35:	75 0a                	jne    806b41 <load_pe+0x76>
  806b37:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806b3c:	e9 f1 06 00 00       	jmp    807232 <load_pe+0x767>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806b41:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  806b48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b4b:	ba 44 00 00 00       	mov    edx,0x44
  806b50:	48 89 ce             	mov    rsi,rcx
  806b53:	89 c7                	mov    edi,eax
  806b55:	e8 a5 1c 00 00       	call   8087ff <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  806b5a:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806b61:	48 89 c1             	mov    rcx,rax
  806b64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b67:	ba 00 00 00 00       	mov    edx,0x0
  806b6c:	48 89 ce             	mov    rsi,rcx
  806b6f:	89 c7                	mov    edi,eax
  806b71:	e8 e9 1d 00 00       	call   80895f <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806b76:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  806b7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b80:	ba 0c 01 00 00       	mov    edx,0x10c
  806b85:	48 89 ce             	mov    rsi,rcx
  806b88:	89 c7                	mov    edi,eax
  806b8a:	e8 70 1c 00 00       	call   8087ff <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806b8f:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  806b96:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  806b9a:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  806ba0:	c1 e8 0c             	shr    eax,0xc
  806ba3:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806ba6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ba9:	ba 00 00 00 00       	mov    edx,0x0
  806bae:	be 00 00 00 00       	mov    esi,0x0
  806bb3:	89 c7                	mov    edi,eax
  806bb5:	e8 a5 1d 00 00       	call   80895f <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  806bba:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  806bbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bc1:	ba 00 10 00 00       	mov    edx,0x1000
  806bc6:	48 89 ce             	mov    rsi,rcx
  806bc9:	89 c7                	mov    edi,eax
  806bcb:	e8 2f 1c 00 00       	call   8087ff <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  806bd0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806bd4:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  806bd8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  806bdc:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806be0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806be4:	48 01 d0             	add    rax,rdx
  806be7:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  806bee:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806bf5:	48 83 c0 04          	add    rax,0x4
  806bf9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806c00:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806c07:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  806c0a:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806c10:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  806c16:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  806c1c:	85 c0                	test   eax,eax
  806c1e:	0f 48 c2             	cmovs  eax,edx
  806c21:	c1 f8 0c             	sar    eax,0xc
  806c24:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  806c2a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806c31:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806c34:	89 c2                	mov    edx,eax
  806c36:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806c3a:	48 01 d0             	add    rax,rdx
  806c3d:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806c44:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806c4a:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806c50:	85 c0                	test   eax,eax
  806c52:	0f 48 c2             	cmovs  eax,edx
  806c55:	c1 f8 0a             	sar    eax,0xa
  806c58:	89 c1                	mov    ecx,eax
  806c5a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806c60:	99                   	cdq    
  806c61:	c1 ea 16             	shr    edx,0x16
  806c64:	01 d0                	add    eax,edx
  806c66:	25 ff 03 00 00       	and    eax,0x3ff
  806c6b:	29 d0                	sub    eax,edx
  806c6d:	01 c8                	add    eax,ecx
  806c6f:	85 c0                	test   eax,eax
  806c71:	0f 95 c0             	setne  al
  806c74:	0f b6 c0             	movzx  eax,al
  806c77:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806c7d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806c84:	48 c1 e8 15          	shr    rax,0x15
  806c88:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806c8e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806c95:	89 c0                	mov    eax,eax
  806c97:	48 05 0c 01 00 00    	add    rax,0x10c
  806c9d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806ca1:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ca8:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806cac:	0f b7 d0             	movzx  edx,ax
  806caf:	89 d0                	mov    eax,edx
  806cb1:	c1 e0 02             	shl    eax,0x2
  806cb4:	01 d0                	add    eax,edx
  806cb6:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806cb9:	05 50 01 00 00       	add    eax,0x150
  806cbe:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806cc4:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ccb:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  806cce:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  806cd4:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806cda:	99                   	cdq    
  806cdb:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806ce1:	89 d0                	mov    eax,edx
  806ce3:	85 c0                	test   eax,eax
  806ce5:	74 23                	je     806d0a <load_pe+0x23f>
  806ce7:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806ced:	99                   	cdq    
  806cee:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806cf4:	89 d1                	mov    ecx,edx
  806cf6:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806cfc:	29 c8                	sub    eax,ecx
  806cfe:	89 c2                	mov    edx,eax
  806d00:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  806d06:	01 d0                	add    eax,edx
  806d08:	eb 06                	jmp    806d10 <load_pe+0x245>
  806d0a:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806d10:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806d16:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806d1d:	eb 6b                	jmp    806d8a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  806d1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d23:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806d26:	25 00 00 00 02       	and    eax,0x2000000
  806d2b:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  806d31:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  806d38:	75 46                	jne    806d80 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  806d3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d3e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806d41:	89 c1                	mov    ecx,eax
  806d43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d46:	ba 00 00 00 00       	mov    edx,0x0
  806d4b:	48 89 ce             	mov    rsi,rcx
  806d4e:	89 c7                	mov    edi,eax
  806d50:	e8 0a 1c 00 00       	call   80895f <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806d55:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d59:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806d5c:	89 c2                	mov    edx,eax
  806d5e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d62:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806d65:	89 c1                	mov    ecx,eax
  806d67:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806d6b:	48 01 c8             	add    rax,rcx
  806d6e:	48 89 c1             	mov    rcx,rax
  806d71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d74:	48 89 ce             	mov    rsi,rcx
  806d77:	89 c7                	mov    edi,eax
  806d79:	e8 81 1a 00 00       	call   8087ff <sys_read>
  806d7e:	eb 01                	jmp    806d81 <load_pe+0x2b6>
            continue;
  806d80:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806d81:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806d85:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  806d8a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806d91:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806d95:	0f b7 c0             	movzx  eax,ax
  806d98:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806d9b:	7c 82                	jl     806d1f <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  806d9d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806da4:	48 05 90 00 00 00    	add    rax,0x90
  806daa:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  806db1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806db8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806dbb:	85 c0                	test   eax,eax
  806dbd:	0f 84 7b 02 00 00    	je     80703e <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  806dc3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806dca:	8b 10                	mov    edx,DWORD PTR [rax]
  806dcc:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806dd0:	01 d0                	add    eax,edx
  806dd2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  806dd8:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  806dde:	48 98                	cdqe   
  806de0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  806de4:	e9 47 02 00 00       	jmp    807030 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  806de9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ded:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806df0:	89 c2                	mov    edx,eax
  806df2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806df6:	48 01 d0             	add    rax,rdx
  806df9:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  806e00:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  806e07:	be af 50 81 00       	mov    esi,0x8150af
  806e0c:	48 89 c7             	mov    rdi,rax
  806e0f:	e8 9a 5d 00 00       	call   80cbae <strcmp>
  806e14:	85 c0                	test   eax,eax
  806e16:	75 09                	jne    806e21 <load_pe+0x356>
            {
                dllp=0x1c00000;
  806e18:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  806e1f:	eb 25                	jmp    806e46 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  806e21:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  806e28:	48 89 c7             	mov    rdi,rax
  806e2b:	e8 9b fc ff ff       	call   806acb <load_pe>
  806e30:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  806e36:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  806e3c:	89 c7                	mov    edi,eax
  806e3e:	e8 f1 03 00 00       	call   807234 <get_module_addr>
  806e43:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  806e46:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806e49:	48 98                	cdqe   
  806e4b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806e52:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806e55:	48 63 d0             	movsxd rdx,eax
  806e58:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  806e5f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806e63:	48 01 d0             	add    rax,rdx
  806e66:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  806e6d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806e74:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  806e7a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806e7d:	01 d0                	add    eax,edx
  806e7f:	89 c0                	mov    eax,eax
  806e81:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  806e88:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806e8f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806e92:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  806e98:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806e9f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  806ea2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ea5:	01 d0                	add    eax,edx
  806ea7:	89 c0                	mov    eax,eax
  806ea9:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  806eb0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806eb7:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  806eba:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ebd:	01 d0                	add    eax,edx
  806ebf:	89 c0                	mov    eax,eax
  806ec1:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  806ec8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806ecf:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806ed2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ed5:	01 d0                	add    eax,edx
  806ed7:	89 c0                	mov    eax,eax
  806ed9:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  806ee0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806ee7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806eea:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  806ef0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ef4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806ef7:	89 c2                	mov    edx,eax
  806ef9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806efd:	48 01 d0             	add    rax,rdx
  806f00:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  806f04:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f08:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806f0b:	89 c2                	mov    edx,eax
  806f0d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806f11:	48 01 d0             	add    rax,rdx
  806f14:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  806f18:	e9 00 01 00 00       	jmp    80701d <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  806f1d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f21:	8b 00                	mov    eax,DWORD PTR [rax]
  806f23:	85 c0                	test   eax,eax
  806f25:	79 43                	jns    806f6a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  806f27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f2b:	8b 00                	mov    eax,DWORD PTR [rax]
  806f2d:	25 ff ff ff 7f       	and    eax,0x7fffffff
  806f32:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  806f38:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  806f3e:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  806f44:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806f4b:	00 
  806f4c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806f53:	48 01 d0             	add    rax,rdx
  806f56:	8b 10                	mov    edx,DWORD PTR [rax]
  806f58:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806f5b:	01 d0                	add    eax,edx
  806f5d:	89 c2                	mov    edx,eax
  806f5f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f63:	89 10                	mov    DWORD PTR [rax],edx
  806f65:	e9 a9 00 00 00       	jmp    807013 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  806f6a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806f6e:	8b 00                	mov    eax,DWORD PTR [rax]
  806f70:	89 c0                	mov    eax,eax
  806f72:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806f79:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  806f80:	02 
                    int i=0;
  806f81:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  806f88:	eb 7a                	jmp    807004 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  806f8a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806f8d:	48 98                	cdqe   
  806f8f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806f96:	00 
  806f97:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  806f9e:	48 01 d0             	add    rax,rdx
  806fa1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806fa4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  806fab:	48 89 d6             	mov    rsi,rdx
  806fae:	48 89 c7             	mov    rdi,rax
  806fb1:	e8 f8 5b 00 00       	call   80cbae <strcmp>
  806fb6:	85 c0                	test   eax,eax
  806fb8:	75 46                	jne    807000 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  806fba:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806fbd:	48 98                	cdqe   
  806fbf:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806fc3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  806fca:	48 01 d0             	add    rax,rdx
  806fcd:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806fd0:	98                   	cwde   
  806fd1:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  806fd7:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  806fdd:	48 98                	cdqe   
  806fdf:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806fe6:	00 
  806fe7:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806fee:	48 01 d0             	add    rax,rdx
  806ff1:	8b 10                	mov    edx,DWORD PTR [rax]
  806ff3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ff6:	01 d0                	add    eax,edx
  806ff8:	89 c2                	mov    edx,eax
  806ffa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806ffe:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  807000:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  807004:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  807007:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  80700d:	0f 8c 77 ff ff ff    	jl     806f8a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  807013:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  807018:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80701d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807021:	8b 00                	mov    eax,DWORD PTR [rax]
  807023:	85 c0                	test   eax,eax
  807025:	0f 85 f2 fe ff ff    	jne    806f1d <load_pe+0x452>
            }
            impdes++;
  80702b:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  807030:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807034:	8b 00                	mov    eax,DWORD PTR [rax]
  807036:	85 c0                	test   eax,eax
  807038:	0f 85 ab fd ff ff    	jne    806de9 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80703e:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  807045:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  807046:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80704d:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  807053:	85 c0                	test   eax,eax
  807055:	0f 84 ec 00 00 00    	je     807147 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80705b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807062:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  807068:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80706c:	01 d0                	add    eax,edx
  80706e:	89 c0                	mov    eax,eax
  807070:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  807074:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807078:	48 83 c0 40          	add    rax,0x40
  80707c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  807080:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807084:	48 83 c0 02          	add    rax,0x2
  807088:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80708c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807093:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807097:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80709d:	e9 97 00 00 00       	jmp    807139 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  8070a2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070a6:	8b 10                	mov    edx,DWORD PTR [rax]
  8070a8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070ac:	01 d0                	add    eax,edx
  8070ae:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8070b4:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8070bb:	eb 5a                	jmp    807117 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8070bd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8070c1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8070c4:	66 85 c0             	test   ax,ax
  8070c7:	74 49                	je     807112 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8070c9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8070cd:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8070d0:	0f b7 d0             	movzx  edx,ax
  8070d3:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8070d9:	01 d0                	add    eax,edx
  8070db:	48 98                	cdqe   
  8070dd:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8070e4:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8070eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8070ed:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8070f3:	89 c2                	mov    edx,eax
  8070f5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070f9:	01 d0                	add    eax,edx
  8070fb:	89 c2                	mov    edx,eax
  8070fd:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  807104:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  807106:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80710b:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  807110:	eb 01                	jmp    807113 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  807112:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  807113:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  807117:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80711b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80711e:	c1 e8 02             	shr    eax,0x2
  807121:	89 c2                	mov    edx,eax
  807123:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  807126:	39 c2                	cmp    edx,eax
  807128:	77 93                	ja     8070bd <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  80712a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80712e:	05 00 10 00 00       	add    eax,0x1000
  807133:	48 98                	cdqe   
  807135:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  807139:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80713d:	8b 00                	mov    eax,DWORD PTR [rax]
  80713f:	85 c0                	test   eax,eax
  807141:	0f 85 5b ff ff ff    	jne    8070a2 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  807147:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80714e:	00 00 00 
  807151:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  807158:	00 00 00 
  80715b:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  807162:	00 00 00 00 
  807166:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80716d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  807171:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  807178:	ba 18 00 00 00       	mov    edx,0x18
  80717d:	48 89 c6             	mov    rsi,rax
  807180:	bf 00 00 00 01       	mov    edi,0x1000000
  807185:	e8 86 57 00 00       	call   80c910 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80718a:	8b 05 dc e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e4dc]        # 41566c <cur_proc>
  807190:	48 98                	cdqe   
  807192:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  807199:	48 05 00 85 40 00    	add    rax,0x408500
  80719f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8071a6:	8b 05 c0 e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e4c0]        # 41566c <cur_proc>
  8071ac:	48 98                	cdqe   
  8071ae:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8071b5:	48 05 00 85 40 00    	add    rax,0x408500
  8071bb:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  8071c2:	8b 05 a4 e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e4a4]        # 41566c <cur_proc>
  8071c8:	48 98                	cdqe   
  8071ca:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8071d1:	48 05 00 85 40 00    	add    rax,0x408500
  8071d7:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8071de:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8071e5:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8071ec:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8071f3:	be 00 00 00 00       	mov    esi,0x0
  8071f8:	bf 00 00 00 00       	mov    edi,0x0
  8071fd:	ff d0                	call   rax
  8071ff:	8b 15 67 e4 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0e467]        # 41566c <cur_proc>
  807205:	89 c1                	mov    ecx,eax
  807207:	48 63 c2             	movsxd rax,edx
  80720a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  807211:	48 05 00 85 40 00    	add    rax,0x408500
  807217:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
    return task[cur_proc].exit_code;
  80721a:	8b 05 4c e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e44c]        # 41566c <cur_proc>
  807220:	48 98                	cdqe   
  807222:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  807229:	48 05 00 85 40 00    	add    rax,0x408500
  80722f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  807232:	c9                   	leave  
  807233:	c3                   	ret    

0000000000807234 <get_module_addr>:

int get_module_addr(int mi)
{
  807234:	f3 0f 1e fa          	endbr64 
  807238:	55                   	push   rbp
  807239:	48 89 e5             	mov    rbp,rsp
  80723c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80723f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807242:	48 98                	cdqe   
  807244:	8b 04 c5 80 82 42 00 	mov    eax,DWORD PTR [rax*8+0x428280]
}
  80724b:	5d                   	pop    rbp
  80724c:	c3                   	ret    

000000000080724d <dispose_library>:
int dispose_library(int dlln)
{
  80724d:	f3 0f 1e fa          	endbr64 
  807251:	55                   	push   rbp
  807252:	48 89 e5             	mov    rbp,rsp
  807255:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  807258:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80725c:	78 09                	js     807267 <dispose_library+0x1a>
  80725e:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  807265:	7e 07                	jle    80726e <dispose_library+0x21>
  807267:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80726c:	eb 1d                	jmp    80728b <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80726e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807271:	48 98                	cdqe   
  807273:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80727a:	48 05 88 56 41 00    	add    rax,0x415688
  807280:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  807286:	b8 00 00 00 00       	mov    eax,0x0
}
  80728b:	5d                   	pop    rbp
  80728c:	c3                   	ret    

000000000080728d <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80728d:	f3 0f 1e fa          	endbr64 
  807291:	55                   	push   rbp
  807292:	48 89 e5             	mov    rbp,rsp
  807295:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  807299:	90                   	nop
  80729a:	5d                   	pop    rbp
  80729b:	c3                   	ret    

000000000080729c <sys_rmmod>:
int sys_rmmod(char *name)
{
  80729c:	f3 0f 1e fa          	endbr64 
  8072a0:	55                   	push   rbp
  8072a1:	48 89 e5             	mov    rbp,rsp
  8072a4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8072a8:	90                   	nop
  8072a9:	5d                   	pop    rbp
  8072aa:	c3                   	ret    
  8072ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008072b0 <_syscall>:
  8072b0:	55                   	push   rbp
  8072b1:	bd 00 80 10 00       	mov    ebp,0x108000
  8072b6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8072ba:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8072be:	50                   	push   rax
  8072bf:	53                   	push   rbx
  8072c0:	51                   	push   rcx
  8072c1:	52                   	push   rdx
  8072c2:	57                   	push   rdi
  8072c3:	56                   	push   rsi
  8072c4:	41 50                	push   r8
  8072c6:	41 51                	push   r9
  8072c8:	41 52                	push   r10
  8072ca:	41 53                	push   r11
  8072cc:	41 54                	push   r12
  8072ce:	41 55                	push   r13
  8072d0:	41 56                	push   r14
  8072d2:	41 57                	push   r15
  8072d4:	66 8c c0             	mov    ax,es
  8072d7:	50                   	push   rax
  8072d8:	66 8c d8             	mov    ax,ds
  8072db:	50                   	push   rax
  8072dc:	66 b8 10 00          	mov    ax,0x10
  8072e0:	8e c0                	mov    es,eax
  8072e2:	8e d8                	mov    ds,eax
  8072e4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8072e9:	41 53                	push   r11
  8072eb:	51                   	push   rcx
  8072ec:	49 87 ca             	xchg   r10,rcx
  8072ef:	e8 a6 92 ff ff       	call   80059a <syscall>
  8072f4:	4c 87 d1             	xchg   rcx,r10
  8072f7:	59                   	pop    rcx
  8072f8:	41 5b                	pop    r11
  8072fa:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  8072ff:	58                   	pop    rax
  807300:	8e d8                	mov    ds,eax
  807302:	58                   	pop    rax
  807303:	8e c0                	mov    es,eax
  807305:	41 5f                	pop    r15
  807307:	41 5e                	pop    r14
  807309:	41 5d                	pop    r13
  80730b:	41 5c                	pop    r12
  80730d:	41 5b                	pop    r11
  80730f:	41 5a                	pop    r10
  807311:	41 59                	pop    r9
  807313:	41 58                	pop    r8
  807315:	5e                   	pop    rsi
  807316:	5f                   	pop    rdi
  807317:	5a                   	pop    rdx
  807318:	59                   	pop    rcx
  807319:	5b                   	pop    rbx
  80731a:	58                   	pop    rax
  80731b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80731f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  807323:	5d                   	pop    rbp
  807324:	fb                   	sti    
  807325:	48 0f 07             	sysretq 

0000000000807328 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  807328:	f3 0f 1e fa          	endbr64 
  80732c:	55                   	push   rbp
  80732d:	48 89 e5             	mov    rbp,rsp
  807330:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  807334:	8b 05 5a 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2135a]        # 428694 <framebuffer+0x14>
  80733a:	89 c0                	mov    eax,eax
  80733c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  807340:	8b 05 52 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21352]        # 428698 <framebuffer+0x18>
  807346:	89 c0                	mov    eax,eax
  807348:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80734c:	0f b6 05 49 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21349]        # 42869c <framebuffer+0x1c>
  807353:	c0 e8 03             	shr    al,0x3
  807356:	0f b6 c0             	movzx  eax,al
  807359:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80735d:	8b 05 2d 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2132d]        # 428690 <framebuffer+0x10>
  807363:	89 c0                	mov    eax,eax
  807365:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  807369:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80736d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  807372:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  807376:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80737a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80737f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  807383:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807387:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80738e:	48 85 c0             	test   rax,rax
  807391:	48 0f 48 c2          	cmovs  rax,rdx
  807395:	48 c1 f8 0c          	sar    rax,0xc
  807399:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80739c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  8073a3:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  8073a4:	48 8b 05 dd 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc212dd]        # 428688 <framebuffer+0x8>
  8073ab:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8073af:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8073b6:	00 
  8073b7:	eb 2d                	jmp    8073e6 <init_framebuffer+0xbe>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8073b9:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8073bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8073c1:	ba 07 00 00 00       	mov    edx,0x7
  8073c6:	48 89 ce             	mov    rsi,rcx
  8073c9:	48 89 c7             	mov    rdi,rax
  8073cc:	e8 a1 9a ff ff       	call   800e72 <mmap>
        pp+=PAGE_SIZE;
  8073d1:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8073d8:	00 
        p+=PAGE_SIZE;
  8073d9:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8073e0:	00 
    for (size_t i = 0; i < pgc; i++)
  8073e1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8073e6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8073e9:	48 98                	cdqe   
  8073eb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8073ef:	7c c8                	jl     8073b9 <init_framebuffer+0x91>
    }
    
    
}
  8073f1:	90                   	nop
  8073f2:	90                   	nop
  8073f3:	c9                   	leave  
  8073f4:	c3                   	ret    

00000000008073f5 <init_font>:
void init_font(){
  8073f5:	f3 0f 1e fa          	endbr64 
  8073f9:	55                   	push   rbp
  8073fa:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8073fd:	48 c7 05 b8 12 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc212b8],0x80d728        # 4286c0 <boot_font>
  807404:	28 d7 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  807408:	48 8b 05 b1 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc212b1]        # 4286c0 <boot_font>
  80740f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  807412:	83 c0 07             	add    eax,0x7
  807415:	c1 e8 03             	shr    eax,0x3
  807418:	89 05 b2 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc212b2],eax        # 4286d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  80741e:	8b 05 ac 12 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc212ac]        # 4286d0 <font_width_bytes>
  807424:	c1 e0 03             	shl    eax,0x3
  807427:	89 05 9b 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2129b],eax        # 4286c8 <font_width>
    font_height = boot_font->height;
  80742d:	48 8b 05 8c 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2128c]        # 4286c0 <boot_font>
  807434:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807437:	89 05 8f 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2128f],eax        # 4286cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  80743d:	48 8b 05 7c 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2127c]        # 4286c0 <boot_font>
  807444:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807447:	89 c0                	mov    eax,eax
  807449:	48 05 28 d7 80 00    	add    rax,0x80d728
  80744f:	48 89 05 82 12 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21282],rax        # 4286d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  807456:	48 8b 05 63 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21263]        # 4286c0 <boot_font>
  80745d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  807460:	89 05 7e 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2127e],eax        # 4286e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  807466:	48 8b 05 53 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21253]        # 4286c0 <boot_font>
  80746d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  807470:	89 05 6a 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2126a],eax        # 4286e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  807476:	c7 05 30 12 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21230],0x0        # 4286b0 <fb_cursor_y>
  80747d:	00 00 00 
  807480:	8b 05 2a 12 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2122a]        # 4286b0 <fb_cursor_y>
  807486:	89 05 20 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21220],eax        # 4286ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80748c:	8b 05 02 12 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21202]        # 428694 <framebuffer+0x14>
  807492:	8b 0d 30 12 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21230]        # 4286c8 <font_width>
  807498:	ba 00 00 00 00       	mov    edx,0x0
  80749d:	f7 f1                	div    ecx
  80749f:	89 05 0f 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2120f],eax        # 4286b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8074a5:	8b 05 ed 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc211ed]        # 428698 <framebuffer+0x18>
  8074ab:	8b 35 1b 12 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2121b]        # 4286cc <font_height>
  8074b1:	ba 00 00 00 00       	mov    edx,0x0
  8074b6:	f7 f6                	div    esi
  8074b8:	89 05 fa 11 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc211fa],eax        # 4286b8 <max_ch_nr_y>
    font_size=1;
  8074be:	c7 05 f8 5e 00 00 01 	mov    DWORD PTR [rip+0x5ef8],0x1        # 80d3c0 <font_size>
  8074c5:	00 00 00 
}
  8074c8:	90                   	nop
  8074c9:	5d                   	pop    rbp
  8074ca:	c3                   	ret    

00000000008074cb <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8074cb:	f3 0f 1e fa          	endbr64 
  8074cf:	55                   	push   rbp
  8074d0:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8074d3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8074d7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8074db:	48 89 05 9e 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2119e],rax        # 428680 <framebuffer>
  8074e2:	48 89 15 9f 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2119f],rdx        # 428688 <framebuffer+0x8>
  8074e9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8074ed:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8074f1:	48 89 05 98 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21198],rax        # 428690 <framebuffer+0x10>
  8074f8:	48 89 15 99 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21199],rdx        # 428698 <framebuffer+0x18>
  8074ff:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  807503:	48 89 05 96 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21196],rax        # 4286a0 <framebuffer+0x20>
}
  80750a:	90                   	nop
  80750b:	5d                   	pop    rbp
  80750c:	c3                   	ret    

000000000080750d <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  80750d:	f3 0f 1e fa          	endbr64 
  807511:	55                   	push   rbp
  807512:	48 89 e5             	mov    rbp,rsp
  807515:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  807518:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  80751b:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  80751e:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  807521:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  807525:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  80752c:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  80752d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807530:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807533:	eb 64                	jmp    807599 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  807535:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  807538:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  80753b:	eb 4b                	jmp    807588 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80753d:	8b 15 4d 11 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2114d]        # 428690 <framebuffer+0x10>
  807543:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807546:	0f af c2             	imul   eax,edx
  807549:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  80754b:	0f b6 05 4a 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2114a]        # 42869c <framebuffer+0x1c>
  807552:	0f b6 c0             	movzx  eax,al
  807555:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807559:	8d 50 07             	lea    edx,[rax+0x7]
  80755c:	85 c0                	test   eax,eax
  80755e:	0f 48 c2             	cmovs  eax,edx
  807561:	c1 f8 03             	sar    eax,0x3
  807564:	48 98                	cdqe   
  807566:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807569:	48 05 00 00 00 40    	add    rax,0x40000000
  80756f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  807573:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807577:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  80757b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80757f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  807582:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  807584:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807588:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80758b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80758e:	01 d0                	add    eax,edx
  807590:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  807593:	7c a8                	jl     80753d <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  807595:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807599:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80759c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80759f:	01 d0                	add    eax,edx
  8075a1:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8075a4:	7c 8f                	jl     807535 <fill_rect+0x28>
        }
    }
}
  8075a6:	90                   	nop
  8075a7:	90                   	nop
  8075a8:	5d                   	pop    rbp
  8075a9:	c3                   	ret    

00000000008075aa <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8075aa:	f3 0f 1e fa          	endbr64 
  8075ae:	55                   	push   rbp
  8075af:	48 89 e5             	mov    rbp,rsp
  8075b2:	48 83 ec 30          	sub    rsp,0x30
  8075b6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8075b9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8075bc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8075bf:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8075c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8075c6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8075c9:	eb 5a                	jmp    807625 <draw_text+0x7b>
    {
        if(*str=='\n')
  8075cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075d2:	3c 0a                	cmp    al,0xa
  8075d4:	75 1c                	jne    8075f2 <draw_text+0x48>
        {
            y+=font_height*size;
  8075d6:	8b 15 f0 10 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc210f0]        # 4286cc <font_height>
  8075dc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8075df:	0f af d0             	imul   edx,eax
  8075e2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8075e5:	01 d0                	add    eax,edx
  8075e7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8075ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8075ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8075f0:	eb 2e                	jmp    807620 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8075f2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075f9:	0f be c8             	movsx  ecx,al
  8075fc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8075ff:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  807602:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807605:	89 c7                	mov    edi,eax
  807607:	e8 28 00 00 00       	call   807634 <draw_letter>
            tx+=size*font_width;
  80760c:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80760f:	8b 05 b3 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210b3]        # 4286c8 <font_width>
  807615:	0f af d0             	imul   edx,eax
  807618:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80761b:	01 d0                	add    eax,edx
  80761d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  807620:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  807625:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807629:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80762c:	84 c0                	test   al,al
  80762e:	75 9b                	jne    8075cb <draw_text+0x21>
    }
}
  807630:	90                   	nop
  807631:	90                   	nop
  807632:	c9                   	leave  
  807633:	c3                   	ret    

0000000000807634 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  807634:	f3 0f 1e fa          	endbr64 
  807638:	55                   	push   rbp
  807639:	48 89 e5             	mov    rbp,rsp
  80763c:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  80763f:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  807642:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  807645:	89 c8                	mov    eax,ecx
  807647:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  80764a:	48 8b 05 87 10 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21087]        # 4286d8 <glyph_table>
  807651:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  807655:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807659:	8b 05 85 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21085]        # 4286e4 <glyph_nr>
  80765f:	39 c2                	cmp    edx,eax
  807661:	73 13                	jae    807676 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  807663:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807667:	8b 05 73 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21073]        # 4286e0 <bytes_per_glyph>
  80766d:	0f af c2             	imul   eax,edx
  807670:	89 c0                	mov    eax,eax
  807672:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807676:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80767d:	e9 cb 00 00 00       	jmp    80774d <draw_letter+0x119>
        u8 mask = 1 << 7;
  807682:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  807686:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80768d:	e9 9c 00 00 00       	jmp    80772e <draw_letter+0xfa>
            int px=x+ch_x*size;
  807692:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  807695:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  807699:	89 c2                	mov    edx,eax
  80769b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80769e:	01 d0                	add    eax,edx
  8076a0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8076a3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8076a6:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8076aa:	89 c2                	mov    edx,eax
  8076ac:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8076af:	01 d0                	add    eax,edx
  8076b1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8076b4:	8b 15 d6 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20fd6]        # 428690 <framebuffer+0x10>
  8076ba:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8076bd:	0f af c2             	imul   eax,edx
  8076c0:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  8076c2:	0f b6 05 d3 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20fd3]        # 42869c <framebuffer+0x1c>
  8076c9:	0f b6 c0             	movzx  eax,al
  8076cc:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  8076d0:	8d 50 07             	lea    edx,[rax+0x7]
  8076d3:	85 c0                	test   eax,eax
  8076d5:	0f 48 c2             	cmovs  eax,edx
  8076d8:	c1 f8 03             	sar    eax,0x3
  8076db:	48 98                	cdqe   
  8076dd:	48 01 c8             	add    rax,rcx
  8076e0:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8076e6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  8076ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076ed:	c1 e8 03             	shr    eax,0x3
  8076f0:	89 c2                	mov    edx,eax
  8076f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8076f6:	48 01 d0             	add    rax,rdx
  8076f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076fc:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8076ff:	84 c0                	test   al,al
  807701:	74 0c                	je     80770f <draw_letter+0xdb>
                *ptr=-1;
  807703:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807707:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  80770d:	eb 0a                	jmp    807719 <draw_letter+0xe5>
            } else {
                *ptr=0;
  80770f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807713:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  807719:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  80771c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80771f:	83 e0 07             	and    eax,0x7
  807722:	85 c0                	test   eax,eax
  807724:	75 04                	jne    80772a <draw_letter+0xf6>
                mask = 1 << 7;
  807726:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  80772a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80772e:	8b 05 94 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f94]        # 4286c8 <font_width>
  807734:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807737:	0f 82 55 ff ff ff    	jb     807692 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  80773d:	8b 05 8d 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f8d]        # 4286d0 <font_width_bytes>
  807743:	89 c0                	mov    eax,eax
  807745:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807749:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80774d:	8b 05 79 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f79]        # 4286cc <font_height>
  807753:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  807756:	0f 82 26 ff ff ff    	jb     807682 <draw_letter+0x4e>
    }
}
  80775c:	90                   	nop
  80775d:	90                   	nop
  80775e:	5d                   	pop    rbp
  80775f:	c3                   	ret    

0000000000807760 <scr_up>:
//向上滚动一个像素
void scr_up(){
  807760:	f3 0f 1e fa          	endbr64 
  807764:	55                   	push   rbp
  807765:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807768:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80776f:	eb 71                	jmp    8077e2 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807771:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807778:	eb 57                	jmp    8077d1 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  80777a:	8b 15 10 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20f10]        # 428690 <framebuffer+0x10>
  807780:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807783:	0f af c2             	imul   eax,edx
  807786:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  807788:	0f b6 05 0d 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f0d]        # 42869c <framebuffer+0x1c>
  80778f:	0f b6 c0             	movzx  eax,al
  807792:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807796:	8d 50 07             	lea    edx,[rax+0x7]
  807799:	85 c0                	test   eax,eax
  80779b:	0f 48 c2             	cmovs  eax,edx
  80779e:	c1 f8 03             	sar    eax,0x3
  8077a1:	48 98                	cdqe   
  8077a3:	48 01 c8             	add    rax,rcx
  8077a6:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  8077ac:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  8077b0:	8b 05 da 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20eda]        # 428690 <framebuffer+0x10>
  8077b6:	89 c2                	mov    edx,eax
  8077b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077bc:	48 01 d0             	add    rax,rdx
  8077bf:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8077c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077c6:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  8077c8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  8077cd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077d1:	8b 15 bd 0e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20ebd]        # 428694 <framebuffer+0x14>
  8077d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077da:	39 c2                	cmp    edx,eax
  8077dc:	77 9c                	ja     80777a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  8077de:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8077e2:	8b 05 b0 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20eb0]        # 428698 <framebuffer+0x18>
  8077e8:	8d 50 ff             	lea    edx,[rax-0x1]
  8077eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077ee:	39 c2                	cmp    edx,eax
  8077f0:	0f 87 7b ff ff ff    	ja     807771 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  8077f6:	90                   	nop
  8077f7:	90                   	nop
  8077f8:	5d                   	pop    rbp
  8077f9:	c3                   	ret    

00000000008077fa <scr_down>:
void scr_down(){
  8077fa:	f3 0f 1e fa          	endbr64 
  8077fe:	55                   	push   rbp
  8077ff:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807802:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  807809:	eb 72                	jmp    80787d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80780b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807812:	eb 58                	jmp    80786c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807814:	8b 15 76 0e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20e76]        # 428690 <framebuffer+0x10>
  80781a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80781d:	0f af c2             	imul   eax,edx
  807820:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  807822:	0f b6 05 73 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e73]        # 42869c <framebuffer+0x1c>
  807829:	0f b6 c0             	movzx  eax,al
  80782c:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807830:	8d 50 07             	lea    edx,[rax+0x7]
  807833:	85 c0                	test   eax,eax
  807835:	0f 48 c2             	cmovs  eax,edx
  807838:	c1 f8 03             	sar    eax,0x3
  80783b:	48 98                	cdqe   
  80783d:	48 01 c8             	add    rax,rcx
  807840:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807846:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80784a:	8b 05 40 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e40]        # 428690 <framebuffer+0x10>
  807850:	89 c0                	mov    eax,eax
  807852:	48 f7 d8             	neg    rax
  807855:	48 89 c2             	mov    rdx,rax
  807858:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80785c:	48 01 d0             	add    rax,rdx
  80785f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807862:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807866:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807868:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80786c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80786f:	8b 05 3f 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e3f]        # 4286b4 <max_ch_nr_x>
  807875:	39 c2                	cmp    edx,eax
  807877:	72 9b                	jb     807814 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807879:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80787d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807880:	8b 05 32 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e32]        # 4286b8 <max_ch_nr_y>
  807886:	39 c2                	cmp    edx,eax
  807888:	72 81                	jb     80780b <scr_down+0x11>
        }

    }
}
  80788a:	90                   	nop
  80788b:	90                   	nop
  80788c:	5d                   	pop    rbp
  80788d:	c3                   	ret    

000000000080788e <print>:
void print(char* s){
  80788e:	f3 0f 1e fa          	endbr64 
  807892:	55                   	push   rbp
  807893:	48 89 e5             	mov    rbp,rsp
  807896:	48 83 ec 08          	sub    rsp,0x8
  80789a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  80789e:	e9 c4 00 00 00       	jmp    807967 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  8078a3:	8b 15 03 0e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20e03]        # 4286ac <fb_cursor_x>
  8078a9:	8b 05 05 0e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20e05]        # 4286b4 <max_ch_nr_x>
  8078af:	39 c2                	cmp    edx,eax
  8078b1:	77 0b                	ja     8078be <print+0x30>
  8078b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8078ba:	3c 0a                	cmp    al,0xa
  8078bc:	75 19                	jne    8078d7 <print+0x49>
        {
            fb_cursor_y+=1;
  8078be:	8b 05 ec 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20dec]        # 4286b0 <fb_cursor_y>
  8078c4:	83 c0 01             	add    eax,0x1
  8078c7:	89 05 e3 0d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20de3],eax        # 4286b0 <fb_cursor_y>
            fb_cursor_x=0;
  8078cd:	c7 05 d5 0d c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20dd5],0x0        # 4286ac <fb_cursor_x>
  8078d4:	00 00 00 
        }
        if(*s=='\n')continue;
  8078d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078db:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8078de:	3c 0a                	cmp    al,0xa
  8078e0:	74 7f                	je     807961 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  8078e2:	8b 05 d0 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20dd0]        # 4286b8 <max_ch_nr_y>
  8078e8:	8d 50 ff             	lea    edx,[rax-0x1]
  8078eb:	8b 05 bf 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20dbf]        # 4286b0 <fb_cursor_y>
  8078f1:	39 c2                	cmp    edx,eax
  8078f3:	77 0a                	ja     8078ff <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  8078f5:	c7 05 b1 0d c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20db1],0x0        # 4286b0 <fb_cursor_y>
  8078fc:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8078ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807903:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807906:	0f be d0             	movsx  edx,al
  807909:	8b 05 b1 5a 00 00    	mov    eax,DWORD PTR [rip+0x5ab1]        # 80d3c0 <font_size>
  80790f:	8b 35 9b 0d c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20d9b]        # 4286b0 <fb_cursor_y>
  807915:	8b 0d b1 0d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20db1]        # 4286cc <font_height>
  80791b:	0f af ce             	imul   ecx,esi
  80791e:	8b 35 9c 5a 00 00    	mov    esi,DWORD PTR [rip+0x5a9c]        # 80d3c0 <font_size>
  807924:	0f af ce             	imul   ecx,esi
  807927:	41 89 c8             	mov    r8d,ecx
  80792a:	8b 35 7c 0d c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20d7c]        # 4286ac <fb_cursor_x>
  807930:	8b 0d 92 0d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20d92]        # 4286c8 <font_width>
  807936:	0f af ce             	imul   ecx,esi
  807939:	8b 35 81 5a 00 00    	mov    esi,DWORD PTR [rip+0x5a81]        # 80d3c0 <font_size>
  80793f:	0f af ce             	imul   ecx,esi
  807942:	89 cf                	mov    edi,ecx
  807944:	89 d1                	mov    ecx,edx
  807946:	89 c2                	mov    edx,eax
  807948:	44 89 c6             	mov    esi,r8d
  80794b:	e8 e4 fc ff ff       	call   807634 <draw_letter>
        fb_cursor_x+=1;
  807950:	8b 05 56 0d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20d56]        # 4286ac <fb_cursor_x>
  807956:	83 c0 01             	add    eax,0x1
  807959:	89 05 4d 0d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20d4d],eax        # 4286ac <fb_cursor_x>
  80795f:	eb 01                	jmp    807962 <print+0xd4>
        if(*s=='\n')continue;
  807961:	90                   	nop
    for(;*s;s++){
  807962:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  807967:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80796b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80796e:	84 c0                	test   al,al
  807970:	0f 85 2d ff ff ff    	jne    8078a3 <print+0x15>
    }
}
  807976:	90                   	nop
  807977:	90                   	nop
  807978:	c9                   	leave  
  807979:	c3                   	ret    

000000000080797a <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  80797a:	f3 0f 1e fa          	endbr64 
  80797e:	55                   	push   rbp
  80797f:	48 89 e5             	mov    rbp,rsp
  807982:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807986:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  80798a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80798e:	48 c7 40 20 e0 d3 80 	mov    QWORD PTR [rax+0x20],0x80d3e0
  807995:	00 
    filp->f_ops=&framebuffer_fops;
  807996:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80799a:	48 c7 40 18 e0 d3 80 	mov    QWORD PTR [rax+0x18],0x80d3e0
  8079a1:	00 
    return 1;
  8079a2:	b8 01 00 00 00       	mov    eax,0x1
}
  8079a7:	5d                   	pop    rbp
  8079a8:	c3                   	ret    

00000000008079a9 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  8079a9:	f3 0f 1e fa          	endbr64 
  8079ad:	55                   	push   rbp
  8079ae:	48 89 e5             	mov    rbp,rsp
  8079b1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8079b5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  8079b9:	90                   	nop
  8079ba:	5d                   	pop    rbp
  8079bb:	c3                   	ret    

00000000008079bc <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  8079bc:	f3 0f 1e fa          	endbr64 
  8079c0:	55                   	push   rbp
  8079c1:	48 89 e5             	mov    rbp,rsp
  8079c4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8079c8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8079cc:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8079d0:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  8079d4:	90                   	nop
  8079d5:	5d                   	pop    rbp
  8079d6:	c3                   	ret    

00000000008079d7 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  8079d7:	f3 0f 1e fa          	endbr64 
  8079db:	55                   	push   rbp
  8079dc:	48 89 e5             	mov    rbp,rsp
  8079df:	48 83 ec 40          	sub    rsp,0x40
  8079e3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8079e7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8079eb:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  8079ef:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  8079f3:	b8 00 00 00 00       	mov    eax,0x0
  8079f8:	e8 3a 98 ff ff       	call   801237 <vmalloc>
  8079fd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  807a01:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807a05:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  807a0c:	01 10 00 
  807a0f:	48 89 c8             	mov    rax,rcx
  807a12:	48 f7 e2             	mul    rdx
  807a15:	48 89 c8             	mov    rax,rcx
  807a18:	48 29 d0             	sub    rax,rdx
  807a1b:	48 d1 e8             	shr    rax,1
  807a1e:	48 01 d0             	add    rax,rdx
  807a21:	48 c1 e8 0b          	shr    rax,0xb
  807a25:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  807a28:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<(c?c:1);i++){
  807a2f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807a36:	eb 46                	jmp    807a7e <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807a38:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a3b:	48 63 d0             	movsxd rdx,eax
  807a3e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807a42:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807a46:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a4a:	ba ff 0f 00 00       	mov    edx,0xfff
  807a4f:	48 89 ce             	mov    rsi,rcx
  807a52:	48 89 c7             	mov    rdi,rax
  807a55:	e8 b6 4e 00 00       	call   80c910 <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807a5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a5e:	48 05 ff 0f 00 00    	add    rax,0xfff
  807a64:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807a67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a6b:	48 89 c7             	mov    rdi,rax
  807a6e:	e8 1b fe ff ff       	call   80788e <print>
        p+=PAGE_4K_SIZE-1;
  807a73:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<(c?c:1);i++){
  807a7a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807a7e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807a82:	74 05                	je     807a89 <write_framebuffer+0xb2>
  807a84:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807a87:	eb 05                	jmp    807a8e <write_framebuffer+0xb7>
  807a89:	b8 01 00 00 00       	mov    eax,0x1
  807a8e:	3b 45 f8             	cmp    eax,DWORD PTR [rbp-0x8]
  807a91:	7f a5                	jg     807a38 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  807a93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a97:	48 89 c7             	mov    rdi,rax
  807a9a:	e8 27 98 ff ff       	call   8012c6 <vmfree>
    return 0;
  807a9f:	b8 00 00 00 00       	mov    eax,0x0
}
  807aa4:	c9                   	leave  
  807aa5:	c3                   	ret    

0000000000807aa6 <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  807aa6:	f3 0f 1e fa          	endbr64 
  807aaa:	55                   	push   rbp
  807aab:	48 89 e5             	mov    rbp,rsp
  807aae:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807ab2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807ab6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807aba:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807abe:	90                   	nop
  807abf:	5d                   	pop    rbp
  807ac0:	c3                   	ret    

0000000000807ac1 <path_walk>:
#include "log.h"
#include "mem.h"
#include "str.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  807ac1:	f3 0f 1e fa          	endbr64 
  807ac5:	55                   	push   rbp
  807ac6:	48 89 e5             	mov    rbp,rsp
  807ac9:	48 83 ec 70          	sub    rsp,0x70
  807acd:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807ad1:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
    char * tmpname = NULL;
  807ad5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807adc:	00 
    int tmpnamelen = 0;
  807add:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  807ae4:	48 8b 05 fd 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bfd]        # 4286e8 <root_sb>
  807aeb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807aee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  807af2:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807af9:	00 

    while(*name == '/')
  807afa:	eb 05                	jmp    807b01 <path_walk+0x40>
        name++;
  807afc:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
    while(*name == '/')
  807b01:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b08:	3c 2f                	cmp    al,0x2f
  807b0a:	74 f0                	je     807afc <path_walk+0x3b>

    if(!*name)
  807b0c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b13:	84 c0                	test   al,al
  807b15:	75 09                	jne    807b20 <path_walk+0x5f>
    {
        return parent;
  807b17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b1b:	e9 92 02 00 00       	jmp    807db2 <path_walk+0x2f1>
    }

    for(;;)
    {
        tmpname = name;
  807b20:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b24:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  807b28:	eb 05                	jmp    807b2f <path_walk+0x6e>
            name++;
  807b2a:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name && (*name != '/'))
  807b2f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b33:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b36:	84 c0                	test   al,al
  807b38:	74 0b                	je     807b45 <path_walk+0x84>
  807b3a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b41:	3c 2f                	cmp    al,0x2f
  807b43:	75 e5                	jne    807b2a <path_walk+0x69>
        tmpnamelen = name - tmpname;
  807b45:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807b49:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807b4d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807b50:	be 00 00 00 00       	mov    esi,0x0
  807b55:	bf 58 00 00 00       	mov    edi,0x58
  807b5a:	b8 00 00 00 00       	mov    eax,0x0
  807b5f:	e8 d3 96 ff ff       	call   801237 <vmalloc>
  807b64:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807b68:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b6c:	ba 58 00 00 00       	mov    edx,0x58
  807b71:	be 00 00 00 00       	mov    esi,0x0
  807b76:	48 89 c7             	mov    rdi,rax
  807b79:	e8 41 4e 00 00       	call   80c9bf <memset>

        path->name = vmalloc();
  807b7e:	b8 00 00 00 00       	mov    eax,0x0
  807b83:	e8 af 96 ff ff       	call   801237 <vmalloc>
  807b88:	48 89 c2             	mov    rdx,rax
  807b8b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b8f:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807b92:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807b95:	83 c0 01             	add    eax,0x1
  807b98:	89 c2                	mov    edx,eax
  807b9a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b9e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ba1:	be 00 00 00 00       	mov    esi,0x0
  807ba6:	48 89 c7             	mov    rdi,rax
  807ba9:	e8 11 4e 00 00       	call   80c9bf <memset>
        memcpy(path->name,tmpname,tmpnamelen);
  807bae:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807bb1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bb5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807bb8:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807bbc:	48 89 ce             	mov    rsi,rcx
  807bbf:	48 89 c7             	mov    rdi,rax
  807bc2:	e8 49 4d 00 00       	call   80c910 <memcpy>
        path->name_length = tmpnamelen;
  807bc7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bcb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807bce:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
  807bd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bd5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807bd9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807bdd:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807be1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807be5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807be9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  807bed:	48 89 d6             	mov    rsi,rdx
  807bf0:	48 89 c7             	mov    rdi,rax
  807bf3:	ff d1                	call   rcx
  807bf5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        if(path == NULL)
  807bf9:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807bfe:	75 3e                	jne    807c3e <path_walk+0x17d>
        {
            printf("can not find file or dir:%s\n",path->name);
  807c00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c07:	48 89 c6             	mov    rsi,rax
  807c0a:	bf b7 50 81 00       	mov    edi,0x8150b7
  807c0f:	b8 00 00 00 00       	mov    eax,0x0
  807c14:	e8 48 91 ff ff       	call   800d61 <printf>
            vmfree(path->name);
  807c19:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c1d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c20:	48 89 c7             	mov    rdi,rax
  807c23:	e8 9e 96 ff ff       	call   8012c6 <vmfree>
            vmfree(path);
  807c28:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c2c:	48 89 c7             	mov    rdi,rax
  807c2f:	e8 92 96 ff ff       	call   8012c6 <vmfree>
            return NULL;
  807c34:	b8 00 00 00 00       	mov    eax,0x0
  807c39:	e9 74 01 00 00       	jmp    807db2 <path_walk+0x2f1>
        }

//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
        path->parent = parent;
  807c3e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c42:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807c46:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
        //对于/dev这样的文件夹，lookup返回的就是链表里的dentry，data会一样
        list_add(&parent->subdirs_list,&path->child_node);
  807c4a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c4e:	48 83 c0 10          	add    rax,0x10
  807c52:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807c56:	48 83 c2 28          	add    rdx,0x28
  807c5a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807c5e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(entry->next==NULL)
  807c62:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c66:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c6a:	48 85 c0             	test   rax,rax
  807c6d:	75 58                	jne    807cc7 <path_walk+0x206>
  807c6f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c73:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  807c77:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807c7b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    new->next = entry->next;
  807c7f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c83:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807c87:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807c8b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  807c8f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807c93:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807c97:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  807c9a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807c9e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ca2:	48 85 c0             	test   rax,rax
  807ca5:	74 0f                	je     807cb6 <path_walk+0x1f5>
        new->next->prev = new;
  807ca7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807cab:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807caf:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807cb3:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807cb6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807cba:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807cbe:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  807cc2:	e9 9c 00 00 00       	jmp    807d63 <path_walk+0x2a2>
        struct List* p=entry;
  807cc7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807ccb:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        for(;p->next&&p->next!=p;p=p->next){
  807ccf:	eb 21                	jmp    807cf2 <path_walk+0x231>
            if(p->data==new->data)
  807cd1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807cd5:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807cd9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807cdd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807ce1:	48 39 c2             	cmp    rdx,rax
  807ce4:	74 7c                	je     807d62 <path_walk+0x2a1>
        for(;p->next&&p->next!=p;p=p->next){
  807ce6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807cea:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cee:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  807cf2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807cf6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cfa:	48 85 c0             	test   rax,rax
  807cfd:	74 0e                	je     807d0d <path_walk+0x24c>
  807cff:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d03:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d07:	48 39 45 b8          	cmp    QWORD PTR [rbp-0x48],rax
  807d0b:	75 c4                	jne    807cd1 <path_walk+0x210>
  807d0d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d11:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  807d15:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807d19:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    new->next = entry->next;
  807d1d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807d21:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807d25:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807d29:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  807d2d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807d31:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  807d35:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  807d38:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807d3c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d40:	48 85 c0             	test   rax,rax
  807d43:	74 0f                	je     807d54 <path_walk+0x293>
        new->next->prev = new;
  807d45:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807d49:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d4d:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807d51:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807d54:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807d58:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807d5c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  807d60:	eb 01                	jmp    807d63 <path_walk+0x2a2>
                return;
  807d62:	90                   	nop

        if(!*name)
  807d63:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d67:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d6a:	84 c0                	test   al,al
  807d6c:	74 2a                	je     807d98 <path_walk+0x2d7>
            goto last_component;
        while(*name == '/')
  807d6e:	eb 05                	jmp    807d75 <path_walk+0x2b4>
            name++;
  807d70:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name == '/')
  807d75:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d7c:	3c 2f                	cmp    al,0x2f
  807d7e:	74 f0                	je     807d70 <path_walk+0x2af>
        if(!*name)
  807d80:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d87:	84 c0                	test   al,al
  807d89:	74 10                	je     807d9b <path_walk+0x2da>
            goto last_slash;

        parent = path;
  807d8b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        tmpname = name;
  807d93:	e9 88 fd ff ff       	jmp    807b20 <path_walk+0x5f>
            goto last_component;
  807d98:	90                   	nop
  807d99:	eb 01                	jmp    807d9c <path_walk+0x2db>
            goto last_slash;
  807d9b:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  807d9c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807da0:	83 e0 01             	and    eax,0x1
  807da3:	48 85 c0             	test   rax,rax
  807da6:	74 06                	je     807dae <path_walk+0x2ed>
    {
        return parent;
  807da8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807dac:	eb 04                	jmp    807db2 <path_walk+0x2f1>
    }

    return path;
  807dae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  807db2:	c9                   	leave  
  807db3:	c3                   	ret    

0000000000807db4 <fill_dentry>:


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  807db4:	f3 0f 1e fa          	endbr64 
  807db8:	55                   	push   rbp
  807db9:	48 89 e5             	mov    rbp,rsp
  807dbc:	48 83 ec 40          	sub    rsp,0x40
  807dc0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  807dc4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807dc8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807dcc:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  807dd0:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
    struct dirent* dent = (struct dirent*)buf;
  807dd4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807dd8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if((unsigned long)buf < PAGE_4K_SIZE)
  807ddc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807de0:	48 3d ff 0f 00 00    	cmp    rax,0xfff
  807de6:	77 07                	ja     807def <fill_dentry+0x3b>
        return -EFAULT;
  807de8:	b8 eb ff ff ff       	mov    eax,0xffffffeb
  807ded:	eb 47                	jmp    807e36 <fill_dentry+0x82>

    memcpy(name,dent->d_name,namelen);
  807def:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807df3:	89 c2                	mov    edx,eax
  807df5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807df9:	48 8d 48 18          	lea    rcx,[rax+0x18]
  807dfd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e01:	48 89 ce             	mov    rsi,rcx
  807e04:	48 89 c7             	mov    rdi,rax
  807e07:	e8 04 4b 00 00       	call   80c910 <memcpy>
    dent->d_namelen = namelen;
  807e0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e10:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807e14:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    dent->d_type = type;
  807e18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e1c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807e20:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    dent->d_offset = offset;
  807e24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e28:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807e2c:	48 89 10             	mov    QWORD PTR [rax],rdx
    return sizeof(struct dirent) + namelen;
  807e2f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807e33:	83 c0 18             	add    eax,0x18
}
  807e36:	c9                   	leave  
  807e37:	c3                   	ret    

0000000000807e38 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  807e38:	f3 0f 1e fa          	endbr64 
  807e3c:	55                   	push   rbp
  807e3d:	48 89 e5             	mov    rbp,rsp
  807e40:	48 83 ec 30          	sub    rsp,0x30
  807e44:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  807e48:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807e4c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  807e50:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807e57:	00 

    for(p = &filesystem;p;p = p->next)
  807e58:	48 c7 45 f8 20 d4 80 	mov    QWORD PTR [rbp-0x8],0x80d420
  807e5f:	00 
  807e60:	eb 40                	jmp    807ea2 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  807e62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807e69:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807e6d:	48 89 d6             	mov    rsi,rdx
  807e70:	48 89 c7             	mov    rdi,rax
  807e73:	e8 36 4d 00 00       	call   80cbae <strcmp>
  807e78:	85 c0                	test   eax,eax
  807e7a:	75 1a                	jne    807e96 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  807e7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e80:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  807e84:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807e88:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e8c:	48 89 d6             	mov    rsi,rdx
  807e8f:	48 89 c7             	mov    rdi,rax
  807e92:	ff d1                	call   rcx
  807e94:	eb 18                	jmp    807eae <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  807e96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e9a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e9e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807ea2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807ea7:	75 b9                	jne    807e62 <mount_fs+0x2a>
        }
    return 0;
  807ea9:	b8 00 00 00 00       	mov    eax,0x0
}
  807eae:	c9                   	leave  
  807eaf:	c3                   	ret    

0000000000807eb0 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  807eb0:	f3 0f 1e fa          	endbr64 
  807eb4:	55                   	push   rbp
  807eb5:	48 89 e5             	mov    rbp,rsp
  807eb8:	48 83 ec 20          	sub    rsp,0x20
  807ebc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  807ec0:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807ec7:	00 

    for(p = &filesystem;p;p = p->next)
  807ec8:	48 c7 45 f8 20 d4 80 	mov    QWORD PTR [rbp-0x8],0x80d420
  807ecf:	00 
  807ed0:	eb 30                	jmp    807f02 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  807ed2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ed6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807ed9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807edd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ee0:	48 89 d6             	mov    rsi,rdx
  807ee3:	48 89 c7             	mov    rdi,rax
  807ee6:	e8 c3 4c 00 00       	call   80cbae <strcmp>
  807eeb:	85 c0                	test   eax,eax
  807eed:	75 07                	jne    807ef6 <register_filesystem+0x46>
            return 0;
  807eef:	b8 00 00 00 00       	mov    eax,0x0
  807ef4:	eb 32                	jmp    807f28 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  807ef6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807efa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807efe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807f02:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807f07:	75 c9                	jne    807ed2 <register_filesystem+0x22>

    fs->next = filesystem.next;
  807f09:	48 8b 15 28 55 00 00 	mov    rdx,QWORD PTR [rip+0x5528]        # 80d438 <filesystem+0x18>
  807f10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807f14:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  807f18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807f1c:	48 89 05 15 55 00 00 	mov    QWORD PTR [rip+0x5515],rax        # 80d438 <filesystem+0x18>

    return 1;
  807f23:	b8 01 00 00 00       	mov    eax,0x1
}
  807f28:	c9                   	leave  
  807f29:	c3                   	ret    

0000000000807f2a <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  807f2a:	f3 0f 1e fa          	endbr64 
  807f2e:	55                   	push   rbp
  807f2f:	48 89 e5             	mov    rbp,rsp
  807f32:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  807f36:	48 c7 45 f8 20 d4 80 	mov    QWORD PTR [rbp-0x8],0x80d420
  807f3d:	00 

    while(p->next)
  807f3e:	eb 41                	jmp    807f81 <unregister_filesystem+0x57>
        if(p->next == fs)
  807f40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f44:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f48:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  807f4c:	75 27                	jne    807f75 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  807f4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f52:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f56:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  807f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f5e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  807f62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807f66:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  807f6d:	00 
            return 1;
  807f6e:	b8 01 00 00 00       	mov    eax,0x1
  807f73:	eb 1e                	jmp    807f93 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  807f75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f79:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f7d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  807f81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f85:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f89:	48 85 c0             	test   rax,rax
  807f8c:	75 b2                	jne    807f40 <unregister_filesystem+0x16>
    return 0;
  807f8e:	b8 00 00 00 00       	mov    eax,0x0
}
  807f93:	5d                   	pop    rbp
  807f94:	c3                   	ret    

0000000000807f95 <root_lookup>:
//在parent inode下查找dest dentry
struct dir_entry* root_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry){
  807f95:	f3 0f 1e fa          	endbr64 
  807f99:	55                   	push   rbp
  807f9a:	48 89 e5             	mov    rbp,rsp
  807f9d:	48 83 ec 30          	sub    rsp,0x30
  807fa1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  807fa5:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    struct dir_entry* tmp= (struct dir_entry *) parent_inode->private_index_info;
  807fa9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807fad:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807fb1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    struct List* p= tmp->subdirs_list.next;
  807fb5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807fb9:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807fbd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  807fc1:	eb 47                	jmp    80800a <root_lookup+0x75>
        struct dir_entry* dp=p->data;
  807fc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807fc7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807fcb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        if(strcmp(dp->name,dest_dentry->name)==0){
  807fcf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807fd3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807fd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807fda:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807fdd:	48 89 d6             	mov    rsi,rdx
  807fe0:	48 89 c7             	mov    rdi,rax
  807fe3:	e8 c6 4b 00 00       	call   80cbae <strcmp>
  807fe8:	85 c0                	test   eax,eax
  807fea:	75 12                	jne    807ffe <root_lookup+0x69>
            vmfree(dest_dentry);
  807fec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807ff0:	48 89 c7             	mov    rdi,rax
  807ff3:	e8 ce 92 ff ff       	call   8012c6 <vmfree>
            return dp;
  807ff8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807ffc:	eb 24                	jmp    808022 <root_lookup+0x8d>
        }
        p=p->next;
  807ffe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808002:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808006:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  80800a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80800f:	75 b2                	jne    807fc3 <root_lookup+0x2e>
    }
    vmfree(dest_dentry);
  808011:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808015:	48 89 c7             	mov    rdi,rax
  808018:	e8 a9 92 ff ff       	call   8012c6 <vmfree>
    return NULL;
  80801d:	b8 00 00 00 00       	mov    eax,0x0
}
  808022:	c9                   	leave  
  808023:	c3                   	ret    

0000000000808024 <mount_rootfs>:
struct index_node_operations root_iops={
    .lookup=root_lookup
};
void mount_rootfs(){
  808024:	f3 0f 1e fa          	endbr64 
  808028:	55                   	push   rbp
  808029:	48 89 e5             	mov    rbp,rsp
  80802c:	48 83 ec 20          	sub    rsp,0x20
    root_sb=(struct super_block*)vmalloc();
  808030:	b8 00 00 00 00       	mov    eax,0x0
  808035:	e8 fd 91 ff ff       	call   801237 <vmalloc>
  80803a:	48 89 05 a7 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206a7],rax        # 4286e8 <root_sb>
    root_sb->root=root_sb+1;//紧凑跟在后面
  808041:	48 8b 15 a0 06 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc206a0]        # 4286e8 <root_sb>
  808048:	48 8b 05 99 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20699]        # 4286e8 <root_sb>
  80804f:	48 83 c2 18          	add    rdx,0x18
  808053:	48 89 10             	mov    QWORD PTR [rax],rdx
    root_sb->sb_ops=NULL;
  808056:	48 8b 05 8b 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2068b]        # 4286e8 <root_sb>
  80805d:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  808064:	00 
    struct index_node* ir=root_sb->root+1;
  808065:	48 8b 05 7c 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2067c]        # 4286e8 <root_sb>
  80806c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80806f:	48 83 c0 58          	add    rax,0x58
  808073:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    root_sb->root->dir_inode=ir;
  808077:	48 8b 05 6a 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2066a]        # 4286e8 <root_sb>
  80807e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808081:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808085:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    ir->sb=root_sb;
  808089:	48 8b 15 58 06 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20658]        # 4286e8 <root_sb>
  808090:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808094:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ir->attribute=FS_ATTR_DIR;
  808098:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80809c:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8080a3:	00 
    ir->file_size=0;
  8080a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080a8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    ir->inode_ops=&root_iops;//lookup函数是必要的
  8080af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080b3:	48 c7 40 28 40 d4 80 	mov    QWORD PTR [rax+0x28],0x80d440
  8080ba:	00 
    ir->f_ops=NULL;
  8080bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080bf:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8080c6:	00 
    ir->private_index_info=root_sb->root;
  8080c7:	48 8b 05 1a 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2061a]        # 4286e8 <root_sb>
  8080ce:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8080d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080d5:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    root_sb->root->name=ir+1;//紧凑跟在后面
  8080d9:	48 8b 05 08 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20608]        # 4286e8 <root_sb>
  8080e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8080e3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8080e7:	48 83 c2 38          	add    rdx,0x38
  8080eb:	48 89 10             	mov    QWORD PTR [rax],rdx
    strcpy(root_sb->root->name,"/");
  8080ee:	48 8b 05 f3 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc205f3]        # 4286e8 <root_sb>
  8080f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8080f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8080fb:	be df 50 81 00       	mov    esi,0x8150df
  808100:	48 89 c7             	mov    rdi,rax
  808103:	e8 06 49 00 00       	call   80ca0e <strcpy>
    root_sb->root->name_length=1;
  808108:	48 8b 05 d9 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc205d9]        # 4286e8 <root_sb>
  80810f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808112:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1
    root_sb->root->parent=root_sb->root;
  808119:	48 8b 15 c8 05 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc205c8]        # 4286e8 <root_sb>
  808120:	48 8b 05 c1 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc205c1]        # 4286e8 <root_sb>
  808127:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80812a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80812d:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_init(&root_sb->root->subdirs_list);
  808131:	48 8b 05 b0 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc205b0]        # 4286e8 <root_sb>
  808138:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80813b:	48 83 c0 28          	add    rax,0x28
  80813f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    list->prev = NULL;
  808143:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808147:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80814e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808152:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808159:	00 
}
  80815a:	90                   	nop
    list_init(&root_sb->root->child_node);
  80815b:	48 8b 05 86 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20586]        # 4286e8 <root_sb>
  808162:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808165:	48 83 c0 10          	add    rax,0x10
  808169:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    list->prev = NULL;
  80816d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808171:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808178:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80817c:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808183:	00 
}
  808184:	90                   	nop

}
  808185:	90                   	nop
  808186:	c9                   	leave  
  808187:	c3                   	ret    

0000000000808188 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  808188:	f3 0f 1e fa          	endbr64 
  80818c:	55                   	push   rbp
  80818d:	48 89 e5             	mov    rbp,rsp
  808190:	48 83 ec 10          	sub    rsp,0x10
  808194:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  808198:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80819c:	48 89 c7             	mov    rdi,rax
  80819f:	b8 00 00 00 00       	mov    eax,0x0
  8081a4:	e8 b8 8b ff ff       	call   800d61 <printf>
    return 0;
  8081a9:	b8 00 00 00 00       	mov    eax,0x0
}
  8081ae:	c9                   	leave  
  8081af:	c3                   	ret    

00000000008081b0 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8081b0:	f3 0f 1e fa          	endbr64 
  8081b4:	55                   	push   rbp
  8081b5:	48 89 e5             	mov    rbp,rsp
  8081b8:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  8081bf:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8081c6:	89 b5 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],esi
    char * path = NULL;
  8081cc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8081d3:	00 
    long pathlen = 0;
  8081d4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8081db:	00 
    long error = 0;
  8081dc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8081e3:	00 
    struct dir_entry * dentry = NULL;
  8081e4:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8081eb:	00 
    struct file * filp = NULL;
  8081ec:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8081f3:	00 
    struct file ** f = NULL;
  8081f4:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8081fb:	00 
    int fd = -1;
  8081fc:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  808203:	b8 00 00 00 00       	mov    eax,0x0
  808208:	e8 2a 90 ff ff       	call   801237 <vmalloc>
  80820d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    if(path == NULL)
  808211:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808216:	75 0c                	jne    808224 <sys_open+0x74>
        return -ENOMEM;
  808218:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80821f:	e9 21 05 00 00       	jmp    808745 <sys_open+0x595>
    memset(path,0,PAGE_4K_SIZE);
  808224:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808228:	ba 00 10 00 00       	mov    edx,0x1000
  80822d:	be 00 00 00 00       	mov    esi,0x0
  808232:	48 89 c7             	mov    rdi,rax
  808235:	e8 85 47 00 00       	call   80c9bf <memset>
    pathlen = strlen(filename);
  80823a:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  808241:	48 89 c7             	mov    rdi,rax
  808244:	e8 e4 49 00 00       	call   80cc2d <strlen>
  808249:	48 98                	cdqe   
  80824b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(pathlen <= 0)
  80824f:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  808254:	7f 18                	jg     80826e <sys_open+0xbe>
    {
        vmfree(path);
  808256:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80825a:	48 89 c7             	mov    rdi,rax
  80825d:	e8 64 90 ff ff       	call   8012c6 <vmfree>
        return -EFAULT;
  808262:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808269:	e9 d7 04 00 00       	jmp    808745 <sys_open+0x595>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  80826e:	48 81 7d d0 ff 0f 00 	cmp    QWORD PTR [rbp-0x30],0xfff
  808275:	00 
  808276:	7e 18                	jle    808290 <sys_open+0xe0>
    {
        vmfree(path);
  808278:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80827c:	48 89 c7             	mov    rdi,rax
  80827f:	e8 42 90 ff ff       	call   8012c6 <vmfree>
        return -ENAMETOOLONG;
  808284:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  80828b:	e9 b5 04 00 00       	jmp    808745 <sys_open+0x595>
    }
    strcpy(path,filename);
  808290:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  808297:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80829b:	48 89 d6             	mov    rsi,rdx
  80829e:	48 89 c7             	mov    rdi,rax
  8082a1:	e8 68 47 00 00       	call   80ca0e <strcpy>

    dentry = path_walk(path,0);
  8082a6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082aa:	be 00 00 00 00       	mov    esi,0x0
  8082af:	48 89 c7             	mov    rdi,rax
  8082b2:	e8 0a f8 ff ff       	call   807ac1 <path_walk>
  8082b7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    if(dentry == NULL){
  8082bb:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8082c0:	0f 85 70 02 00 00    	jne    808536 <sys_open+0x386>
        if(!flags&O_CREAT)
            return -ENOENT;
        //创建文件
        //找到上一级目录
        char* p=path+strlen(path)-1;
  8082c6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082ca:	48 89 c7             	mov    rdi,rax
  8082cd:	e8 5b 49 00 00       	call   80cc2d <strlen>
  8082d2:	48 98                	cdqe   
  8082d4:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  8082d8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082dc:	48 01 d0             	add    rax,rdx
  8082df:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(;*p!='/'&&p>path;p--);
  8082e3:	eb 05                	jmp    8082ea <sys_open+0x13a>
  8082e5:	48 83 6d e0 01       	sub    QWORD PTR [rbp-0x20],0x1
  8082ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8082ee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8082f1:	3c 2f                	cmp    al,0x2f
  8082f3:	74 0a                	je     8082ff <sys_open+0x14f>
  8082f5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8082f9:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8082fd:	77 e6                	ja     8082e5 <sys_open+0x135>
        *p='\0';
  8082ff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808303:	c6 00 00             	mov    BYTE PTR [rax],0x0
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
  808306:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80830a:	be 00 40 00 00       	mov    esi,0x4000
  80830f:	48 89 c7             	mov    rdi,rax
  808312:	e8 aa f7 ff ff       	call   807ac1 <path_walk>
  808317:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        if(parent==NULL)
  80831b:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  808320:	75 0c                	jne    80832e <sys_open+0x17e>
            return -ENOENT;//上级目录也不在
  808322:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  808329:	e9 17 04 00 00       	jmp    808745 <sys_open+0x595>
        //创建新的文件
        dentry=(struct dir_entry*)vmalloc();
  80832e:	b8 00 00 00 00       	mov    eax,0x0
  808333:	e8 ff 8e ff ff       	call   801237 <vmalloc>
  808338:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        list_init(&dentry->subdirs_list);
  80833c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808340:	48 83 c0 28          	add    rax,0x28
  808344:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    list->prev = NULL;
  80834b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808352:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808359:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808360:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808367:	00 
}
  808368:	90                   	nop
        list_init(&dentry->child_node);
  808369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80836d:	48 83 c0 10          	add    rax,0x10
  808371:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    list->prev = NULL;
  808378:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80837f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808386:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80838d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808394:	00 
}
  808395:	90                   	nop
        dentry->child_node.data=dentry;
  808396:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80839a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80839e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
        list_add(&parent->subdirs_list,&dentry->child_node);
  8083a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8083a6:	48 83 c0 10          	add    rax,0x10
  8083aa:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8083ae:	48 83 c2 28          	add    rdx,0x28
  8083b2:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
  8083b6:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    if(entry->next==NULL)
  8083ba:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8083be:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8083c2:	48 85 c0             	test   rax,rax
  8083c5:	75 58                	jne    80841f <sys_open+0x26f>
  8083c7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8083cb:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8083cf:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8083d3:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    new->next = entry->next;
  8083d7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8083db:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8083df:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083e3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8083e7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083eb:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8083ef:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8083f2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083f6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8083fa:	48 85 c0             	test   rax,rax
  8083fd:	74 0f                	je     80840e <sys_open+0x25e>
        new->next->prev = new;
  8083ff:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808403:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808407:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  80840b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80840e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808412:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  808416:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80841a:	e9 9c 00 00 00       	jmp    8084bb <sys_open+0x30b>
        struct List* p=entry;
  80841f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808423:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
        for(;p->next&&p->next!=p;p=p->next){
  808427:	eb 21                	jmp    80844a <sys_open+0x29a>
            if(p->data==new->data)
  808429:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80842d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  808431:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808435:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808439:	48 39 c2             	cmp    rdx,rax
  80843c:	74 7c                	je     8084ba <sys_open+0x30a>
        for(;p->next&&p->next!=p;p=p->next){
  80843e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808442:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808446:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  80844a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80844e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808452:	48 85 c0             	test   rax,rax
  808455:	74 0e                	je     808465 <sys_open+0x2b5>
  808457:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80845b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80845f:	48 39 45 90          	cmp    QWORD PTR [rbp-0x70],rax
  808463:	75 c4                	jne    808429 <sys_open+0x279>
  808465:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808469:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80846d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808471:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  808475:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808479:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80847d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808481:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  808485:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808489:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  80848d:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  808490:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808494:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808498:	48 85 c0             	test   rax,rax
  80849b:	74 0f                	je     8084ac <sys_open+0x2fc>
        new->next->prev = new;
  80849d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8084a1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084a5:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8084a9:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8084ac:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8084b0:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8084b4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8084b8:	eb 01                	jmp    8084bb <sys_open+0x30b>
                return;
  8084ba:	90                   	nop
        dentry->parent=parent;
  8084bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084bf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8084c3:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        dentry->dir_inode=dentry+1;//放在后面
  8084c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084cb:	48 8d 50 58          	lea    rdx,[rax+0x58]
  8084cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084d3:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
        dentry->dir_inode->file_size=0;
  8084d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084db:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8084df:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
  8084e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8084ea:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8084ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084f2:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8084f6:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
  8084fa:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        dentry->dir_inode->inode_ops=parent->dir_inode->inode_ops;
  8084fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808502:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  808506:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80850a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80850e:	48 8b 52 28          	mov    rdx,QWORD PTR [rdx+0x28]
  808512:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
        dentry->dir_ops=parent->dir_ops;
  808516:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80851a:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80851e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808522:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
        //这样的创建文件只能创建普通文件，设备文件要通过devman创建
        dentry->dir_inode->attribute=FS_ATTR_FILE;
  808526:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80852a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80852e:	48 c7 40 10 01 00 00 	mov    QWORD PTR [rax+0x10],0x1
  808535:	00 
    }
    vmfree(path);
  808536:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80853a:	48 89 c7             	mov    rdi,rax
  80853d:	e8 84 8d ff ff       	call   8012c6 <vmfree>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  808542:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808548:	25 00 40 00 00       	and    eax,0x4000
  80854d:	85 c0                	test   eax,eax
  80854f:	74 1e                	je     80856f <sys_open+0x3bf>
  808551:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808555:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808559:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80855d:	48 83 f8 02          	cmp    rax,0x2
  808561:	74 0c                	je     80856f <sys_open+0x3bf>
        return -ENOTDIR;
  808563:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  80856a:	e9 d6 01 00 00       	jmp    808745 <sys_open+0x595>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  80856f:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808575:	25 00 40 00 00       	and    eax,0x4000
  80857a:	85 c0                	test   eax,eax
  80857c:	75 1e                	jne    80859c <sys_open+0x3ec>
  80857e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808582:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808586:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80858a:	48 83 f8 02          	cmp    rax,0x2
  80858e:	75 0c                	jne    80859c <sys_open+0x3ec>
        return -EISDIR;
  808590:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  808597:	e9 a9 01 00 00       	jmp    808745 <sys_open+0x595>

    filp = (struct file *)vmalloc();
  80859c:	b8 00 00 00 00       	mov    eax,0x0
  8085a1:	e8 91 8c ff ff       	call   801237 <vmalloc>
  8085a6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    memset(filp,0,sizeof(struct file));
  8085aa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085ae:	ba 28 00 00 00       	mov    edx,0x28
  8085b3:	be 00 00 00 00       	mov    esi,0x0
  8085b8:	48 89 c7             	mov    rdi,rax
  8085bb:	e8 ff 43 00 00       	call   80c9bf <memset>
    filp->dentry = dentry;
  8085c0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085c4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8085c8:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  8085cc:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8085d2:	48 63 d0             	movsxd rdx,eax
  8085d5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085d9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
  8085dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085e1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8085e5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8085e9:	83 e0 04             	and    eax,0x4
  8085ec:	48 85 c0             	test   rax,rax
  8085ef:	74 0e                	je     8085ff <sys_open+0x44f>
        extern struct file_operations dev_dir_fops;
        filp->f_ops = &dev_dir_fops;	//////	find device file operation function
  8085f1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085f5:	48 c7 40 18 60 d3 80 	mov    QWORD PTR [rax+0x18],0x80d360
  8085fc:	00 
  8085fd:	eb 14                	jmp    808613 <sys_open+0x463>
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  8085ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808603:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808607:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80860b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80860f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  808613:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808617:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80861b:	48 85 c0             	test   rax,rax
  80861e:	74 33                	je     808653 <sys_open+0x4a3>
  808620:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808624:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808628:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80862b:	48 85 c0             	test   rax,rax
  80862e:	74 23                	je     808653 <sys_open+0x4a3>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  808630:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808634:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808638:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80863b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80863f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808643:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808647:	48 89 d6             	mov    rsi,rdx
  80864a:	48 89 c7             	mov    rdi,rax
  80864d:	ff d1                	call   rcx
  80864f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  808653:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808658:	74 18                	je     808672 <sys_open+0x4c2>
    {
        vmfree(filp);
  80865a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80865e:	48 89 c7             	mov    rdi,rax
  808661:	e8 60 8c ff ff       	call   8012c6 <vmfree>
        return -EFAULT;
  808666:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80866d:	e9 d3 00 00 00       	jmp    808745 <sys_open+0x595>
    }

    if(filp->mode & O_TRUNC)
  808672:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808676:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80867a:	25 00 02 00 00       	and    eax,0x200
  80867f:	48 85 c0             	test   rax,rax
  808682:	74 13                	je     808697 <sys_open+0x4e7>
    {
        filp->dentry->dir_inode->file_size = 0;
  808684:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808688:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80868c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808690:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  808697:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80869b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80869f:	25 00 04 00 00       	and    eax,0x400
  8086a4:	48 85 c0             	test   rax,rax
  8086a7:	74 19                	je     8086c2 <sys_open+0x512>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8086a9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8086ad:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8086b1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8086b5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8086b8:	48 89 c2             	mov    rdx,rax
  8086bb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8086bf:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8086c2:	48 8b 05 17 cf c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cf17]        # 4155e0 <current>
  8086c9:	48 05 d8 00 00 00    	add    rax,0xd8
  8086cf:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    for(i = 0;i < MAX_TASKS;i++)
  8086d3:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8086da:	eb 28                	jmp    808704 <sys_open+0x554>
        if(f[i] == NULL)
  8086dc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086df:	48 98                	cdqe   
  8086e1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8086e8:	00 
  8086e9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8086ed:	48 01 d0             	add    rax,rdx
  8086f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8086f3:	48 85 c0             	test   rax,rax
  8086f6:	75 08                	jne    808700 <sys_open+0x550>
        {
            fd = i;
  8086f8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086fb:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            break;
  8086fe:	eb 0a                	jmp    80870a <sys_open+0x55a>
    for(i = 0;i < MAX_TASKS;i++)
  808700:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808704:	83 7d e8 1f          	cmp    DWORD PTR [rbp-0x18],0x1f
  808708:	7e d2                	jle    8086dc <sys_open+0x52c>
        }
    if(i == MAX_TASKS)
  80870a:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
  80870e:	75 15                	jne    808725 <sys_open+0x575>
    {
        vmfree(filp);
  808710:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808714:	48 89 c7             	mov    rdi,rax
  808717:	e8 aa 8b ff ff       	call   8012c6 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80871c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  808723:	eb 20                	jmp    808745 <sys_open+0x595>
    }
    f[fd] = filp;
  808725:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808728:	48 98                	cdqe   
  80872a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  808731:	00 
  808732:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808736:	48 01 c2             	add    rdx,rax
  808739:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80873d:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  808740:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808743:	48 98                	cdqe   
}
  808745:	c9                   	leave  
  808746:	c3                   	ret    

0000000000808747 <sys_close>:

unsigned long sys_close(int fd)
{
  808747:	f3 0f 1e fa          	endbr64 
  80874b:	55                   	push   rbp
  80874c:	48 89 e5             	mov    rbp,rsp
  80874f:	48 83 ec 20          	sub    rsp,0x20
  808753:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  808756:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80875d:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80875e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808762:	78 06                	js     80876a <sys_close+0x23>
  808764:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808768:	7e 0c                	jle    808776 <sys_close+0x2f>
        return -EBADF;
  80876a:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808771:	e9 87 00 00 00       	jmp    8087fd <sys_close+0xb6>

    filp = current->openf[fd];
  808776:	48 8b 05 63 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ce63]        # 4155e0 <current>
  80877d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808780:	48 63 d2             	movsxd rdx,edx
  808783:	48 83 c2 1a          	add    rdx,0x1a
  808787:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80878c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  808790:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808794:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808798:	48 85 c0             	test   rax,rax
  80879b:	74 35                	je     8087d2 <sys_close+0x8b>
  80879d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8087a1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8087a5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8087a9:	48 85 c0             	test   rax,rax
  8087ac:	74 24                	je     8087d2 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  8087ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8087b2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8087b6:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8087ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8087be:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087c2:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8087c6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8087ca:	48 89 d6             	mov    rsi,rdx
  8087cd:	48 89 c7             	mov    rdi,rax
  8087d0:	ff d1                	call   rcx

    vmfree(filp);
  8087d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8087d6:	48 89 c7             	mov    rdi,rax
  8087d9:	e8 e8 8a ff ff       	call   8012c6 <vmfree>
    current->openf[fd] = NULL;
  8087de:	48 8b 05 fb cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cdfb]        # 4155e0 <current>
  8087e5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8087e8:	48 63 d2             	movsxd rdx,edx
  8087eb:	48 83 c2 1a          	add    rdx,0x1a
  8087ef:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  8087f6:	00 00 

    return 0;
  8087f8:	b8 00 00 00 00       	mov    eax,0x0
}
  8087fd:	c9                   	leave  
  8087fe:	c3                   	ret    

00000000008087ff <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  8087ff:	f3 0f 1e fa          	endbr64 
  808803:	55                   	push   rbp
  808804:	48 89 e5             	mov    rbp,rsp
  808807:	48 83 ec 30          	sub    rsp,0x30
  80880b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80880e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808812:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808816:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80881d:	00 
    unsigned long ret = 0;
  80881e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808825:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808826:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80882a:	78 06                	js     808832 <sys_read+0x33>
  80882c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808830:	7e 09                	jle    80883b <sys_read+0x3c>
        return -EBADF;
  808832:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808839:	eb 72                	jmp    8088ad <sys_read+0xae>
    if(count < 0)
  80883b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808840:	79 09                	jns    80884b <sys_read+0x4c>
        return -EINVAL;
  808842:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808849:	eb 62                	jmp    8088ad <sys_read+0xae>

    filp = current->openf[fd];
  80884b:	48 8b 05 8e cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cd8e]        # 4155e0 <current>
  808852:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808855:	48 63 d2             	movsxd rdx,edx
  808858:	48 83 c2 1a          	add    rdx,0x1a
  80885c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808861:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  808865:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808869:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80886d:	48 85 c0             	test   rax,rax
  808870:	74 37                	je     8088a9 <sys_read+0xaa>
  808872:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808876:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80887a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80887e:	48 85 c0             	test   rax,rax
  808881:	74 26                	je     8088a9 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  808883:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808887:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80888b:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  80888f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808893:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808897:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80889b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80889f:	48 89 c7             	mov    rdi,rax
  8088a2:	41 ff d0             	call   r8
  8088a5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8088a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8088ad:	c9                   	leave  
  8088ae:	c3                   	ret    

00000000008088af <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  8088af:	f3 0f 1e fa          	endbr64 
  8088b3:	55                   	push   rbp
  8088b4:	48 89 e5             	mov    rbp,rsp
  8088b7:	48 83 ec 30          	sub    rsp,0x30
  8088bb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8088be:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8088c2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8088c6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8088cd:	00 
    unsigned long ret = 0;
  8088ce:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8088d5:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8088d6:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8088da:	78 06                	js     8088e2 <sys_write+0x33>
  8088dc:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8088e0:	7e 09                	jle    8088eb <sys_write+0x3c>
        return -EBADF;
  8088e2:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8088e9:	eb 72                	jmp    80895d <sys_write+0xae>
    if(count < 0)
  8088eb:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8088f0:	79 09                	jns    8088fb <sys_write+0x4c>
        return -EINVAL;
  8088f2:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8088f9:	eb 62                	jmp    80895d <sys_write+0xae>

    filp = current->openf[fd];
  8088fb:	48 8b 05 de cc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ccde]        # 4155e0 <current>
  808902:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808905:	48 63 d2             	movsxd rdx,edx
  808908:	48 83 c2 1a          	add    rdx,0x1a
  80890c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808911:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  808915:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808919:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80891d:	48 85 c0             	test   rax,rax
  808920:	74 37                	je     808959 <sys_write+0xaa>
  808922:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808926:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80892a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80892e:	48 85 c0             	test   rax,rax
  808931:	74 26                	je     808959 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  808933:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808937:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80893b:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  80893f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808943:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808947:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80894b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80894f:	48 89 c7             	mov    rdi,rax
  808952:	41 ff d0             	call   r8
  808955:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808959:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80895d:	c9                   	leave  
  80895e:	c3                   	ret    

000000000080895f <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  80895f:	f3 0f 1e fa          	endbr64 
  808963:	55                   	push   rbp
  808964:	48 89 e5             	mov    rbp,rsp
  808967:	48 83 ec 20          	sub    rsp,0x20
  80896b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80896e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808972:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  808975:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80897c:	00 
    unsigned long ret = 0;
  80897d:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808984:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  808985:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808989:	78 06                	js     808991 <sys_lseek+0x32>
  80898b:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  80898f:	7e 09                	jle    80899a <sys_lseek+0x3b>
        return -EBADF;
  808991:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808998:	eb 78                	jmp    808a12 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  80899a:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  80899e:	78 06                	js     8089a6 <sys_lseek+0x47>
  8089a0:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  8089a4:	7e 09                	jle    8089af <sys_lseek+0x50>
        return -EINVAL;
  8089a6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8089ad:	eb 63                	jmp    808a12 <sys_lseek+0xb3>

    filp = current->openf[filds];
  8089af:	48 8b 05 2a cc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cc2a]        # 4155e0 <current>
  8089b6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8089b9:	48 63 d2             	movsxd rdx,edx
  8089bc:	48 83 c2 1a          	add    rdx,0x1a
  8089c0:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8089c5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  8089c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089cd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089d1:	48 85 c0             	test   rax,rax
  8089d4:	74 38                	je     808a0e <sys_lseek+0xaf>
  8089d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089da:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089de:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8089e2:	48 85 c0             	test   rax,rax
  8089e5:	74 27                	je     808a0e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  8089e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089eb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8089ef:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  8089f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8089f6:	48 63 d0             	movsxd rdx,eax
  8089f9:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8089fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a01:	48 89 ce             	mov    rsi,rcx
  808a04:	48 89 c7             	mov    rdi,rax
  808a07:	41 ff d0             	call   r8
  808a0a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808a0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808a12:	c9                   	leave  
  808a13:	c3                   	ret    

0000000000808a14 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  808a14:	f3 0f 1e fa          	endbr64 
  808a18:	55                   	push   rbp
  808a19:	48 89 e5             	mov    rbp,rsp
  808a1c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  808a20:	48 8b 05 b9 cb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cbb9]        # 4155e0 <current>
  808a27:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  808a2e:	48 2d d0 00 00 00    	sub    rax,0xd0
  808a34:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  808a38:	bf e8 50 81 00       	mov    edi,0x8150e8
  808a3d:	b8 00 00 00 00       	mov    eax,0x0
  808a42:	e8 1a 83 ff ff       	call   800d61 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  808a47:	90                   	nop
  808a48:	c9                   	leave  
  808a49:	c3                   	ret    

0000000000808a4a <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  808a4a:	f3 0f 1e fa          	endbr64 
  808a4e:	55                   	push   rbp
  808a4f:	48 89 e5             	mov    rbp,rsp
  808a52:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a56:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808a5a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a5d:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  808a61:	90                   	nop
  808a62:	5d                   	pop    rbp
  808a63:	c3                   	ret    

0000000000808a64 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  808a64:	f3 0f 1e fa          	endbr64 
  808a68:	55                   	push   rbp
  808a69:	48 89 e5             	mov    rbp,rsp
  808a6c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  808a70:	90                   	nop
  808a71:	5d                   	pop    rbp
  808a72:	c3                   	ret    

0000000000808a73 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  808a73:	f3 0f 1e fa          	endbr64 
  808a77:	55                   	push   rbp
  808a78:	48 89 e5             	mov    rbp,rsp
  808a7b:	48 83 ec 10          	sub    rsp,0x10
  808a7f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808a83:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  808a87:	bf f3 50 81 00       	mov    edi,0x8150f3
  808a8c:	b8 00 00 00 00       	mov    eax,0x0
  808a91:	e8 cb 82 ff ff       	call   800d61 <printf>
    switch(cmd)
  808a96:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808a9b:	74 09                	je     808aa6 <sys_reboot+0x33>
  808a9d:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  808aa2:	74 13                	je     808ab7 <sys_reboot+0x44>
  808aa4:	eb 22                	jmp    808ac8 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  808aa6:	be fe 00 00 00       	mov    esi,0xfe
  808aab:	bf 64 00 00 00       	mov    edi,0x64
  808ab0:	e8 9b da ff ff       	call   806550 <outb>
            break;
  808ab5:	eb 21                	jmp    808ad8 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  808ab7:	bf 00 51 81 00       	mov    edi,0x815100
  808abc:	b8 00 00 00 00       	mov    eax,0x0
  808ac1:	e8 9b 82 ff ff       	call   800d61 <printf>
            break;
  808ac6:	eb 10                	jmp    808ad8 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  808ac8:	bf 20 51 81 00       	mov    edi,0x815120
  808acd:	b8 00 00 00 00       	mov    eax,0x0
  808ad2:	e8 8a 82 ff ff       	call   800d61 <printf>
            break;
  808ad7:	90                   	nop
    }
    return 0;
  808ad8:	b8 00 00 00 00       	mov    eax,0x0
}
  808add:	c9                   	leave  
  808ade:	c3                   	ret    

0000000000808adf <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  808adf:	f3 0f 1e fa          	endbr64 
  808ae3:	55                   	push   rbp
  808ae4:	48 89 e5             	mov    rbp,rsp
  808ae7:	48 83 ec 30          	sub    rsp,0x30
  808aeb:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  808aef:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808af6:	00 
    long pathlen = 0;
  808af7:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808afe:	00 
    struct dir_entry * dentry = NULL;
  808aff:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808b06:	00 

    printf("sys_chdir\n");
  808b07:	bf 37 51 81 00       	mov    edi,0x815137
  808b0c:	b8 00 00 00 00       	mov    eax,0x0
  808b11:	e8 4b 82 ff ff       	call   800d61 <printf>
    path = (char *)vmalloc();
  808b16:	b8 00 00 00 00       	mov    eax,0x0
  808b1b:	e8 17 87 ff ff       	call   801237 <vmalloc>
  808b20:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  808b24:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808b29:	75 0c                	jne    808b37 <sys_chdir+0x58>
        return -ENOMEM;
  808b2b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  808b32:	e9 ca 00 00 00       	jmp    808c01 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  808b37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b3b:	ba 00 10 00 00       	mov    edx,0x1000
  808b40:	be 00 00 00 00       	mov    esi,0x0
  808b45:	48 89 c7             	mov    rdi,rax
  808b48:	e8 72 3e 00 00       	call   80c9bf <memset>
    pathlen = strlen(filename);
  808b4d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808b51:	48 89 c7             	mov    rdi,rax
  808b54:	e8 d4 40 00 00       	call   80cc2d <strlen>
  808b59:	48 98                	cdqe   
  808b5b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  808b5f:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808b64:	7f 18                	jg     808b7e <sys_chdir+0x9f>
    {
        vmfree(path);
  808b66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b6a:	48 89 c7             	mov    rdi,rax
  808b6d:	e8 54 87 ff ff       	call   8012c6 <vmfree>
        return -EFAULT;
  808b72:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808b79:	e9 83 00 00 00       	jmp    808c01 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  808b7e:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  808b85:	00 
  808b86:	7e 15                	jle    808b9d <sys_chdir+0xbe>
    {
        vmfree(path);
  808b88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b8c:	48 89 c7             	mov    rdi,rax
  808b8f:	e8 32 87 ff ff       	call   8012c6 <vmfree>
        return -ENAMETOOLONG;
  808b94:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  808b9b:	eb 64                	jmp    808c01 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  808b9d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808ba1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808ba5:	48 89 d6             	mov    rsi,rdx
  808ba8:	48 89 c7             	mov    rdi,rax
  808bab:	e8 5e 3e 00 00       	call   80ca0e <strcpy>

    dentry = path_walk(path,0);
  808bb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808bb4:	be 00 00 00 00       	mov    esi,0x0
  808bb9:	48 89 c7             	mov    rdi,rax
  808bbc:	e8 00 ef ff ff       	call   807ac1 <path_walk>
  808bc1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  808bc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808bc9:	48 89 c7             	mov    rdi,rax
  808bcc:	e8 f5 86 ff ff       	call   8012c6 <vmfree>

    if(dentry == NULL)
  808bd1:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  808bd6:	75 09                	jne    808be1 <sys_chdir+0x102>
        return -ENOENT;
  808bd8:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  808bdf:	eb 20                	jmp    808c01 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  808be1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808be5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808be9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808bed:	48 83 f8 02          	cmp    rax,0x2
  808bf1:	74 09                	je     808bfc <sys_chdir+0x11d>
        return -ENOTDIR;
  808bf3:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  808bfa:	eb 05                	jmp    808c01 <sys_chdir+0x122>
    return 0;
  808bfc:	b8 00 00 00 00       	mov    eax,0x0
}
  808c01:	c9                   	leave  
  808c02:	c3                   	ret    

0000000000808c03 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  808c03:	f3 0f 1e fa          	endbr64 
  808c07:	55                   	push   rbp
  808c08:	48 89 e5             	mov    rbp,rsp
  808c0b:	48 83 ec 30          	sub    rsp,0x30
  808c0f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808c12:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808c16:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808c1a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808c21:	00 
    unsigned long ret = 0;
  808c22:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808c29:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  808c2a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808c2e:	78 06                	js     808c36 <sys_getdents+0x33>
  808c30:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  808c34:	7e 09                	jle    808c3f <sys_getdents+0x3c>
        return -EBADF;
  808c36:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808c3d:	eb 72                	jmp    808cb1 <sys_getdents+0xae>
    if(count < 0)
  808c3f:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808c44:	79 09                	jns    808c4f <sys_getdents+0x4c>
        return -EINVAL;
  808c46:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808c4d:	eb 62                	jmp    808cb1 <sys_getdents+0xae>

    filp = current->openf[fd];
  808c4f:	48 8b 05 8a c9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c98a]        # 4155e0 <current>
  808c56:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808c59:	48 63 d2             	movsxd rdx,edx
  808c5c:	48 83 c2 1a          	add    rdx,0x1a
  808c60:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808c65:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  808c69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c6d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c71:	48 85 c0             	test   rax,rax
  808c74:	74 37                	je     808cad <sys_getdents+0xaa>
  808c76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c7a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c7e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808c82:	48 85 c0             	test   rax,rax
  808c85:	74 26                	je     808cad <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  808c87:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c8b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c8f:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  808c93:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808c97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c9b:	ba b4 7d 80 00       	mov    edx,0x807db4
  808ca0:	48 89 ce             	mov    rsi,rcx
  808ca3:	48 89 c7             	mov    rdi,rax
  808ca6:	41 ff d0             	call   r8
  808ca9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808cad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808cb1:	c9                   	leave  
  808cb2:	c3                   	ret    

0000000000808cb3 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  808cb3:	f3 0f 1e fa          	endbr64 
  808cb7:	55                   	push   rbp
  808cb8:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  808cbb:	0f b6 05 4b fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc4b]        # 42890d <k_shift>
  808cc2:	84 c0                	test   al,al
  808cc4:	0f 94 c0             	sete   al
  808cc7:	88 05 40 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc40],al        # 42890d <k_shift>
}
  808ccd:	90                   	nop
  808cce:	5d                   	pop    rbp
  808ccf:	c3                   	ret    

0000000000808cd0 <ctrl>:
void ctrl()
{
  808cd0:	f3 0f 1e fa          	endbr64 
  808cd4:	55                   	push   rbp
  808cd5:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  808cd8:	0f b6 05 2f fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc2f]        # 42890e <k_ctrl>
  808cdf:	84 c0                	test   al,al
  808ce1:	0f 94 c0             	sete   al
  808ce4:	88 05 24 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc24],al        # 42890e <k_ctrl>
}
  808cea:	90                   	nop
  808ceb:	5d                   	pop    rbp
  808cec:	c3                   	ret    

0000000000808ced <capslock>:
void capslock()
{
  808ced:	f3 0f 1e fa          	endbr64 
  808cf1:	55                   	push   rbp
  808cf2:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  808cf5:	0f b6 05 13 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc13]        # 42890f <k_capslock>
  808cfc:	84 c0                	test   al,al
  808cfe:	0f 94 c0             	sete   al
  808d01:	88 05 08 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc08],al        # 42890f <k_capslock>
}
  808d07:	90                   	nop
  808d08:	5d                   	pop    rbp
  808d09:	c3                   	ret    

0000000000808d0a <to_ascii>:
char to_ascii(char scan_code)
{
  808d0a:	f3 0f 1e fa          	endbr64 
  808d0e:	55                   	push   rbp
  808d0f:	48 89 e5             	mov    rbp,rsp
  808d12:	89 f8                	mov    eax,edi
  808d14:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  808d17:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808d1e:	e9 c7 00 00 00       	jmp    808dea <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  808d23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d26:	48 63 d0             	movsxd rdx,eax
  808d29:	48 89 d0             	mov    rax,rdx
  808d2c:	48 c1 e0 02          	shl    rax,0x2
  808d30:	48 01 d0             	add    rax,rdx
  808d33:	48 05 c2 52 81 00    	add    rax,0x8152c2
  808d39:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d3c:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  808d3f:	0f 85 a1 00 00 00    	jne    808de6 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  808d45:	0f b6 05 c3 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fbc3]        # 42890f <k_capslock>
  808d4c:	84 c0                	test   al,al
  808d4e:	74 55                	je     808da5 <to_ascii+0x9b>
  808d50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d53:	48 63 d0             	movsxd rdx,eax
  808d56:	48 89 d0             	mov    rax,rdx
  808d59:	48 c1 e0 02          	shl    rax,0x2
  808d5d:	48 01 d0             	add    rax,rdx
  808d60:	48 05 c0 52 81 00    	add    rax,0x8152c0
  808d66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d69:	3c 60                	cmp    al,0x60
  808d6b:	7e 38                	jle    808da5 <to_ascii+0x9b>
  808d6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d70:	48 63 d0             	movsxd rdx,eax
  808d73:	48 89 d0             	mov    rax,rdx
  808d76:	48 c1 e0 02          	shl    rax,0x2
  808d7a:	48 01 d0             	add    rax,rdx
  808d7d:	48 05 c0 52 81 00    	add    rax,0x8152c0
  808d83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d86:	3c 7a                	cmp    al,0x7a
  808d88:	7f 1b                	jg     808da5 <to_ascii+0x9b>
  808d8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d8d:	48 63 d0             	movsxd rdx,eax
  808d90:	48 89 d0             	mov    rax,rdx
  808d93:	48 c1 e0 02          	shl    rax,0x2
  808d97:	48 01 d0             	add    rax,rdx
  808d9a:	48 05 c1 52 81 00    	add    rax,0x8152c1
  808da0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808da3:	eb 54                	jmp    808df9 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  808da5:	0f b6 05 61 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fb61]        # 42890d <k_shift>
  808dac:	84 c0                	test   al,al
  808dae:	74 1b                	je     808dcb <to_ascii+0xc1>
  808db0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808db3:	48 63 d0             	movsxd rdx,eax
  808db6:	48 89 d0             	mov    rax,rdx
  808db9:	48 c1 e0 02          	shl    rax,0x2
  808dbd:	48 01 d0             	add    rax,rdx
  808dc0:	48 05 c1 52 81 00    	add    rax,0x8152c1
  808dc6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc9:	eb 2e                	jmp    808df9 <to_ascii+0xef>
            else return key_map[i].ascii;
  808dcb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808dce:	48 63 d0             	movsxd rdx,eax
  808dd1:	48 89 d0             	mov    rax,rdx
  808dd4:	48 c1 e0 02          	shl    rax,0x2
  808dd8:	48 01 d0             	add    rax,rdx
  808ddb:	48 05 c0 52 81 00    	add    rax,0x8152c0
  808de1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808de4:	eb 13                	jmp    808df9 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  808de6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808dea:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  808dee:	0f 8e 2f ff ff ff    	jle    808d23 <to_ascii+0x19>
        }

    return '\0';
  808df4:	b8 00 00 00 00       	mov    eax,0x0
}
  808df9:	5d                   	pop    rbp
  808dfa:	c3                   	ret    

0000000000808dfb <init_kb>:
int init_kb()
{
  808dfb:	f3 0f 1e fa          	endbr64 
  808dff:	55                   	push   rbp
  808e00:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  808e03:	bf 00 52 81 00       	mov    edi,0x815200
  808e08:	e8 94 a1 ff ff       	call   802fa1 <reg_device>
    reg_driver(&drv_keyboard);
  808e0d:	bf 60 51 81 00       	mov    edi,0x815160
  808e12:	e8 72 a4 ff ff       	call   803289 <reg_driver>
}
  808e17:	90                   	nop
  808e18:	5d                   	pop    rbp
  808e19:	c3                   	ret    

0000000000808e1a <key_proc>:
int key_proc()
{
  808e1a:	f3 0f 1e fa          	endbr64 
  808e1e:	55                   	push   rbp
  808e1f:	48 89 e5             	mov    rbp,rsp
  808e22:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("cli");
  808e26:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  808e27:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  808e2b:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  808e2f:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  808e33:	bf 60 00 00 00       	mov    edi,0x60
  808e38:	e8 2c d7 ff ff       	call   806569 <inb>
  808e3d:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  808e40:	8b 05 46 46 00 00    	mov    eax,DWORD PTR [rip+0x4646]        # 80d48c <key_bufq+0xc>
  808e46:	83 c0 01             	add    eax,0x1
  808e49:	8b 0d 41 46 00 00    	mov    ecx,DWORD PTR [rip+0x4641]        # 80d490 <key_bufq+0x10>
  808e4f:	99                   	cdq    
  808e50:	f7 f9                	idiv   ecx
  808e52:	8b 05 30 46 00 00    	mov    eax,DWORD PTR [rip+0x4630]        # 80d488 <key_bufq+0x8>
  808e58:	39 c2                	cmp    edx,eax
  808e5a:	74 32                	je     808e8e <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  808e5c:	48 8b 15 1d 46 00 00 	mov    rdx,QWORD PTR [rip+0x461d]        # 80d480 <key_bufq>
  808e63:	8b 05 23 46 00 00    	mov    eax,DWORD PTR [rip+0x4623]        # 80d48c <key_bufq+0xc>
  808e69:	48 98                	cdqe   
  808e6b:	48 01 c2             	add    rdx,rax
  808e6e:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  808e72:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  808e74:	8b 05 12 46 00 00    	mov    eax,DWORD PTR [rip+0x4612]        # 80d48c <key_bufq+0xc>
  808e7a:	83 c0 01             	add    eax,0x1
  808e7d:	8b 0d 0d 46 00 00    	mov    ecx,DWORD PTR [rip+0x460d]        # 80d490 <key_bufq+0x10>
  808e83:	99                   	cdq    
  808e84:	f7 f9                	idiv   ecx
  808e86:	89 d0                	mov    eax,edx
  808e88:	89 05 fe 45 00 00    	mov    DWORD PTR [rip+0x45fe],eax        # 80d48c <key_bufq+0xc>
    }

    if(scan1==0x48)
  808e8e:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  808e92:	75 0a                	jne    808e9e <key_proc+0x84>
        scr_up();
  808e94:	b8 00 00 00 00       	mov    eax,0x0
  808e99:	e8 c2 e8 ff ff       	call   807760 <scr_up>
    if(scan1==0x50)
  808e9e:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  808ea2:	75 0a                	jne    808eae <key_proc+0x94>
        scr_down();
  808ea4:	b8 00 00 00 00       	mov    eax,0x0
  808ea9:	e8 4c e9 ff ff       	call   8077fa <scr_down>
    switch (scan1)
  808eae:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  808eb2:	3d b6 00 00 00       	cmp    eax,0xb6
  808eb7:	74 41                	je     808efa <key_proc+0xe0>
  808eb9:	3d b6 00 00 00       	cmp    eax,0xb6
  808ebe:	7f 5e                	jg     808f1e <key_proc+0x104>
  808ec0:	3d aa 00 00 00       	cmp    eax,0xaa
  808ec5:	74 33                	je     808efa <key_proc+0xe0>
  808ec7:	3d aa 00 00 00       	cmp    eax,0xaa
  808ecc:	7f 50                	jg     808f1e <key_proc+0x104>
  808ece:	3d 9d 00 00 00       	cmp    eax,0x9d
  808ed3:	74 31                	je     808f06 <key_proc+0xec>
  808ed5:	3d 9d 00 00 00       	cmp    eax,0x9d
  808eda:	7f 42                	jg     808f1e <key_proc+0x104>
  808edc:	83 f8 3a             	cmp    eax,0x3a
  808edf:	74 31                	je     808f12 <key_proc+0xf8>
  808ee1:	83 f8 3a             	cmp    eax,0x3a
  808ee4:	7f 38                	jg     808f1e <key_proc+0x104>
  808ee6:	83 f8 36             	cmp    eax,0x36
  808ee9:	74 0f                	je     808efa <key_proc+0xe0>
  808eeb:	83 f8 36             	cmp    eax,0x36
  808eee:	7f 2e                	jg     808f1e <key_proc+0x104>
  808ef0:	83 f8 1d             	cmp    eax,0x1d
  808ef3:	74 11                	je     808f06 <key_proc+0xec>
  808ef5:	83 f8 2a             	cmp    eax,0x2a
  808ef8:	75 24                	jne    808f1e <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  808efa:	b8 00 00 00 00       	mov    eax,0x0
  808eff:	e8 af fd ff ff       	call   808cb3 <shift>
            break;
  808f04:	eb 19                	jmp    808f1f <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  808f06:	b8 00 00 00 00       	mov    eax,0x0
  808f0b:	e8 c0 fd ff ff       	call   808cd0 <ctrl>
            break;
  808f10:	eb 0d                	jmp    808f1f <key_proc+0x105>
        case 0x3a:
            capslock();
  808f12:	b8 00 00 00 00       	mov    eax,0x0
  808f17:	e8 d1 fd ff ff       	call   808ced <capslock>
            break;
  808f1c:	eb 01                	jmp    808f1f <key_proc+0x105>
        default:
            break;
  808f1e:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  808f1f:	b8 00 00 00 00       	mov    eax,0x0
  808f24:	e8 55 d6 ff ff       	call   80657e <eoi>
    asm volatile("leave\r\n iretq");
  808f29:	c9                   	leave  
  808f2a:	48 cf                	iretq  
}
  808f2c:	90                   	nop
  808f2d:	c9                   	leave  
  808f2e:	c3                   	ret    

0000000000808f2f <sys_analyse_key>:

char sys_analyse_key()
{
  808f2f:	f3 0f 1e fa          	endbr64 
  808f33:	55                   	push   rbp
  808f34:	48 89 e5             	mov    rbp,rsp
  808f37:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  808f3b:	8b 15 4b 45 00 00    	mov    edx,DWORD PTR [rip+0x454b]        # 80d48c <key_bufq+0xc>
  808f41:	8b 05 41 45 00 00    	mov    eax,DWORD PTR [rip+0x4541]        # 80d488 <key_bufq+0x8>
  808f47:	39 c2                	cmp    edx,eax
  808f49:	75 0a                	jne    808f55 <sys_analyse_key+0x26>
  808f4b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808f50:	e9 df 00 00 00       	jmp    809034 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  808f55:	8b 05 2d 45 00 00    	mov    eax,DWORD PTR [rip+0x452d]        # 80d488 <key_bufq+0x8>
  808f5b:	48 98                	cdqe   
  808f5d:	0f b6 80 00 87 42 00 	movzx  eax,BYTE PTR [rax+0x428700]
  808f64:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  808f67:	8b 05 1b 45 00 00    	mov    eax,DWORD PTR [rip+0x451b]        # 80d488 <key_bufq+0x8>
  808f6d:	83 c0 01             	add    eax,0x1
  808f70:	8b 0d 1a 45 00 00    	mov    ecx,DWORD PTR [rip+0x451a]        # 80d490 <key_bufq+0x10>
  808f76:	99                   	cdq    
  808f77:	f7 f9                	idiv   ecx
  808f79:	89 d0                	mov    eax,edx
  808f7b:	89 05 07 45 00 00    	mov    DWORD PTR [rip+0x4507],eax        # 80d488 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  808f81:	bf 96 54 81 00       	mov    edi,0x815496
  808f86:	b8 00 00 00 00       	mov    eax,0x0
  808f8b:	e8 d1 7d ff ff       	call   800d61 <printf>
    char res[33]={0};
  808f90:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808f97:	00 
  808f98:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808f9f:	00 
  808fa0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808fa7:	00 
  808fa8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808faf:	00 
  808fb0:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  808fb4:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  808fb8:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  808fbc:	be 10 00 00 00       	mov    esi,0x10
  808fc1:	48 89 c7             	mov    rdi,rax
  808fc4:	e8 59 7c ff ff       	call   800c22 <itoa>
    printf(res);
  808fc9:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  808fcd:	48 89 c7             	mov    rdi,rax
  808fd0:	b8 00 00 00 00       	mov    eax,0x0
  808fd5:	e8 87 7d ff ff       	call   800d61 <printf>
    if(c&FLAG_BREAK){
  808fda:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  808fde:	79 16                	jns    808ff6 <sys_analyse_key+0xc7>
        printf("\n");
  808fe0:	bf a1 54 81 00       	mov    edi,0x8154a1
  808fe5:	b8 00 00 00 00       	mov    eax,0x0
  808fea:	e8 72 7d ff ff       	call   800d61 <printf>
        return -1;
  808fef:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808ff4:	eb 3e                	jmp    809034 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  808ff6:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  808ffa:	83 e0 7f             	and    eax,0x7f
  808ffd:	89 c7                	mov    edi,eax
  808fff:	e8 06 fd ff ff       	call   808d0a <to_ascii>
  809004:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  809007:	bf a3 54 81 00       	mov    edi,0x8154a3
  80900c:	b8 00 00 00 00       	mov    eax,0x0
  809011:	e8 4b 7d ff ff       	call   800d61 <printf>
    putchar(c);
  809016:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80901a:	89 c7                	mov    edi,eax
  80901c:	e8 16 7d ff ff       	call   800d37 <putchar>
    printf("\n");
  809021:	bf a1 54 81 00       	mov    edi,0x8154a1
  809026:	b8 00 00 00 00       	mov    eax,0x0
  80902b:	e8 31 7d ff ff       	call   800d61 <printf>
    return c;
  809030:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809034:	c9                   	leave  
  809035:	c3                   	ret    

0000000000809036 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  809036:	f3 0f 1e fa          	endbr64 
  80903a:	55                   	push   rbp
  80903b:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80903e:	b8 00 00 00 00       	mov    eax,0x0
  809043:	e8 c4 09 00 00       	call   809a0c <hd_iterate>
    return 0;
  809048:	b8 00 00 00 00       	mov    eax,0x0
}
  80904d:	5d                   	pop    rbp
  80904e:	c3                   	ret    

000000000080904f <disk_int_handler_c>:

int disk_int_handler_c()
{
  80904f:	f3 0f 1e fa          	endbr64 
  809053:	55                   	push   rbp
  809054:	48 89 e5             	mov    rbp,rsp
  809057:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  80905b:	48 8b 05 fe 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225fe]        # 42b660 <running_req>
  809062:	48 85 c0             	test   rax,rax
  809065:	75 0a                	jne    809071 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  809067:	b8 01 00 00 00       	mov    eax,0x1
  80906c:	e9 bf 01 00 00       	jmp    809230 <disk_int_handler_c+0x1e1>
    }
    short *p=running_req->buf;
  809071:	48 8b 05 e8 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225e8]        # 42b660 <running_req>
  809078:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80907c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  809080:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  809087:	48 8b 05 d2 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225d2]        # 42b660 <running_req>
  80908e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809091:	83 f8 02             	cmp    eax,0x2
  809094:	74 0f                	je     8090a5 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  809096:	48 8b 05 c3 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225c3]        # 42b660 <running_req>
  80909d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8090a0:	83 f8 03             	cmp    eax,0x3
  8090a3:	75 07                	jne    8090ac <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  8090a5:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  8090ac:	48 8b 05 ad 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225ad]        # 42b660 <running_req>
  8090b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8090b5:	85 c0                	test   eax,eax
  8090b7:	75 50                	jne    809109 <disk_int_handler_c+0xba>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8090b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8090c0:	eb 22                	jmp    8090e4 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8090c2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8090c5:	0f b7 c0             	movzx  eax,ax
  8090c8:	89 c7                	mov    edi,eax
  8090ca:	e8 a4 d4 ff ff       	call   806573 <inw>
  8090cf:	89 c2                	mov    edx,eax
  8090d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090d5:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8090d9:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8090dd:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8090e0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8090e4:	48 8b 05 75 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22575]        # 42b660 <running_req>
  8090eb:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8090ee:	c1 e0 08             	shl    eax,0x8
  8090f1:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8090f4:	7c cc                	jl     8090c2 <disk_int_handler_c+0x73>
        }
        running_req->result=DISK_CHK_OK;
  8090f6:	48 8b 05 63 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22563]        # 42b660 <running_req>
  8090fd:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  809104:	e9 d8 00 00 00       	jmp    8091e1 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_WRITE)
  809109:	48 8b 05 50 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22550]        # 42b660 <running_req>
  809110:	8b 00                	mov    eax,DWORD PTR [rax]
  809112:	83 f8 01             	cmp    eax,0x1
  809115:	75 50                	jne    809167 <disk_int_handler_c+0x118>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  809117:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80911e:	eb 25                	jmp    809145 <disk_int_handler_c+0xf6>
            outw(port,*p++);
  809120:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809124:	48 8d 50 02          	lea    rdx,[rax+0x2]
  809128:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80912c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80912f:	0f b7 d0             	movzx  edx,ax
  809132:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809135:	0f b7 c0             	movzx  eax,ax
  809138:	89 d6                	mov    esi,edx
  80913a:	89 c7                	mov    edi,eax
  80913c:	e8 1c d4 ff ff       	call   80655d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  809141:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809145:	48 8b 05 14 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22514]        # 42b660 <running_req>
  80914c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80914f:	c1 e0 08             	shl    eax,0x8
  809152:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  809155:	7c c9                	jl     809120 <disk_int_handler_c+0xd1>
        running_req->result=DISK_CHK_OK;
  809157:	48 8b 05 02 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22502]        # 42b660 <running_req>
  80915e:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  809165:	eb 7a                	jmp    8091e1 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_CHECK)
  809167:	48 8b 05 f2 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224f2]        # 42b660 <running_req>
  80916e:	8b 00                	mov    eax,DWORD PTR [rax]
  809170:	83 f8 02             	cmp    eax,0x2
  809173:	75 34                	jne    8091a9 <disk_int_handler_c+0x15a>
    {
        char stat=inb(port+7);
  809175:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809178:	83 c0 07             	add    eax,0x7
  80917b:	0f b6 c0             	movzx  eax,al
  80917e:	89 c7                	mov    edi,eax
  809180:	e8 e4 d3 ff ff       	call   806569 <inb>
  809185:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  809188:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80918b:	0f b7 c0             	movzx  eax,ax
  80918e:	89 c7                	mov    edi,eax
  809190:	e8 de d3 ff ff       	call   806573 <inw>
  809195:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  809199:	48 8b 05 c0 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c0]        # 42b660 <running_req>
  8091a0:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8091a7:	eb 38                	jmp    8091e1 <disk_int_handler_c+0x192>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8091a9:	48 8b 05 b0 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224b0]        # 42b660 <running_req>
  8091b0:	8b 00                	mov    eax,DWORD PTR [rax]
  8091b2:	83 f8 03             	cmp    eax,0x3
  8091b5:	75 2a                	jne    8091e1 <disk_int_handler_c+0x192>
    {
        int stat=inb(port+7);
  8091b7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8091ba:	83 c0 07             	add    eax,0x7
  8091bd:	0f b6 c0             	movzx  eax,al
  8091c0:	89 c7                	mov    edi,eax
  8091c2:	e8 a2 d3 ff ff       	call   806569 <inb>
  8091c7:	0f b6 c0             	movzx  eax,al
  8091ca:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  8091cd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8091d0:	89 c6                	mov    esi,eax
  8091d2:	bf aa 54 81 00       	mov    edi,0x8154aa
  8091d7:	b8 00 00 00 00       	mov    eax,0x0
  8091dc:	e8 80 7b ff ff       	call   800d61 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8091e1:	48 8b 05 78 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22478]        # 42b660 <running_req>
  8091e8:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8091ef:	48 8b 05 6a 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2246a]        # 42b660 <running_req>
  8091f6:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8091fa:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809201:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  809204:	48 8b 05 5d 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2245d]        # 42b668 <running_devman_req>
  80920b:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  809212:	00 00 00 
    running_devman_req=NULL;
  809215:	48 c7 05 48 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22448],0x0        # 42b668 <running_devman_req>
  80921c:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  809220:	48 c7 05 35 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22435],0x0        # 42b660 <running_req>
  809227:	00 00 00 00 
    return 0;
  80922b:	b8 00 00 00 00       	mov    eax,0x0
}
  809230:	c9                   	leave  
  809231:	c3                   	ret    

0000000000809232 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  809232:	f3 0f 1e fa          	endbr64 
  809236:	55                   	push   rbp
  809237:	48 89 e5             	mov    rbp,rsp
  80923a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  80923d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809240:	48 63 d0             	movsxd rdx,eax
  809243:	48 89 d0             	mov    rax,rdx
  809246:	48 01 c0             	add    rax,rax
  809249:	48 01 d0             	add    rax,rdx
  80924c:	48 c1 e0 04          	shl    rax,0x4
  809250:	48 05 7c 89 42 00    	add    rax,0x42897c
  809256:	8b 00                	mov    eax,DWORD PTR [rax]
}
  809258:	5d                   	pop    rbp
  809259:	c3                   	ret    

000000000080925a <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80925a:	f3 0f 1e fa          	endbr64 
  80925e:	55                   	push   rbp
  80925f:	48 89 e5             	mov    rbp,rsp
  809262:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809265:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809268:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80926b:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  80926e:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  809272:	8b 05 1c 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2241c]        # 42b694 <tail>
  809278:	83 c0 01             	add    eax,0x1
  80927b:	48 63 d0             	movsxd rdx,eax
  80927e:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  809285:	48 c1 ea 20          	shr    rdx,0x20
  809289:	01 c2                	add    edx,eax
  80928b:	c1 fa 07             	sar    edx,0x7
  80928e:	89 c1                	mov    ecx,eax
  809290:	c1 f9 1f             	sar    ecx,0x1f
  809293:	29 ca                	sub    edx,ecx
  809295:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80929b:	29 c8                	sub    eax,ecx
  80929d:	89 c2                	mov    edx,eax
  80929f:	8b 05 eb 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223eb]        # 42b690 <head>
  8092a5:	39 c2                	cmp    edx,eax
  8092a7:	75 0a                	jne    8092b3 <request+0x59>
    {
        return -1;
  8092a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8092ae:	e9 0d 01 00 00       	jmp    8093c0 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8092b3:	8b 05 db 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223db]        # 42b694 <tail>
  8092b9:	48 63 d0             	movsxd rdx,eax
  8092bc:	48 89 d0             	mov    rax,rdx
  8092bf:	48 01 c0             	add    rax,rax
  8092c2:	48 01 d0             	add    rax,rdx
  8092c5:	48 c1 e0 04          	shl    rax,0x4
  8092c9:	48 8d 90 64 89 42 00 	lea    rdx,[rax+0x428964]
  8092d0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8092d3:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8092d5:	8b 05 b9 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223b9]        # 42b694 <tail>
  8092db:	48 63 d0             	movsxd rdx,eax
  8092de:	48 89 d0             	mov    rax,rdx
  8092e1:	48 01 c0             	add    rax,rax
  8092e4:	48 01 d0             	add    rax,rdx
  8092e7:	48 c1 e0 04          	shl    rax,0x4
  8092eb:	48 8d 90 60 89 42 00 	lea    rdx,[rax+0x428960]
  8092f2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8092f5:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8092f7:	8b 05 97 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22397]        # 42b694 <tail>
  8092fd:	48 63 d0             	movsxd rdx,eax
  809300:	48 89 d0             	mov    rax,rdx
  809303:	48 01 c0             	add    rax,rax
  809306:	48 01 d0             	add    rax,rdx
  809309:	48 c1 e0 04          	shl    rax,0x4
  80930d:	48 8d 90 68 89 42 00 	lea    rdx,[rax+0x428968]
  809314:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809317:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  809319:	8b 05 75 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22375]        # 42b694 <tail>
  80931f:	48 63 d0             	movsxd rdx,eax
  809322:	48 89 d0             	mov    rax,rdx
  809325:	48 01 c0             	add    rax,rax
  809328:	48 01 d0             	add    rax,rdx
  80932b:	48 c1 e0 04          	shl    rax,0x4
  80932f:	48 8d 90 6c 89 42 00 	lea    rdx,[rax+0x42896c]
  809336:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809339:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80933b:	8b 05 53 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22353]        # 42b694 <tail>
  809341:	48 63 d0             	movsxd rdx,eax
  809344:	48 89 d0             	mov    rax,rdx
  809347:	48 01 c0             	add    rax,rax
  80934a:	48 01 d0             	add    rax,rdx
  80934d:	48 c1 e0 04          	shl    rax,0x4
  809351:	48 05 7c 89 42 00    	add    rax,0x42897c
  809357:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  80935d:	8b 05 31 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22331]        # 42b694 <tail>
  809363:	48 63 d0             	movsxd rdx,eax
  809366:	48 89 d0             	mov    rax,rdx
  809369:	48 01 c0             	add    rax,rax
  80936c:	48 01 d0             	add    rax,rdx
  80936f:	48 c1 e0 04          	shl    rax,0x4
  809373:	48 8d 90 70 89 42 00 	lea    rdx,[rax+0x428970]
  80937a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80937e:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  809381:	8b 05 0d 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2230d]        # 42b694 <tail>
  809387:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80938a:	8b 05 04 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22304]        # 42b694 <tail>
  809390:	8d 50 01             	lea    edx,[rax+0x1]
  809393:	48 63 c2             	movsxd rax,edx
  809396:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80939d:	48 c1 e8 20          	shr    rax,0x20
  8093a1:	01 d0                	add    eax,edx
  8093a3:	c1 f8 07             	sar    eax,0x7
  8093a6:	89 d1                	mov    ecx,edx
  8093a8:	c1 f9 1f             	sar    ecx,0x1f
  8093ab:	29 c8                	sub    eax,ecx
  8093ad:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8093b3:	89 d0                	mov    eax,edx
  8093b5:	29 c8                	sub    eax,ecx
  8093b7:	89 05 d7 22 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc222d7],eax        # 42b694 <tail>
    return r;
  8093bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8093c0:	5d                   	pop    rbp
  8093c1:	c3                   	ret    

00000000008093c2 <execute_request>:
int execute_request(){
  8093c2:	f3 0f 1e fa          	endbr64 
  8093c6:	55                   	push   rbp
  8093c7:	48 89 e5             	mov    rbp,rsp
  8093ca:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8093ce:	48 8b 05 8b 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2228b]        # 42b660 <running_req>
  8093d5:	48 85 c0             	test   rax,rax
  8093d8:	74 6a                	je     809444 <execute_request+0x82>
    {
        running_req->time++;
  8093da:	48 8b 05 7f 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2227f]        # 42b660 <running_req>
  8093e1:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8093e4:	83 c2 01             	add    edx,0x1
  8093e7:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8093ea:	48 8b 05 6f 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2226f]        # 42b660 <running_req>
  8093f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8093f3:	83 f8 02             	cmp    eax,0x2
  8093f6:	74 0a                	je     809402 <execute_request+0x40>
            return 2;
  8093f8:	b8 02 00 00 00       	mov    eax,0x2
  8093fd:	e9 b4 01 00 00       	jmp    8095b6 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  809402:	48 8b 05 57 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22257]        # 42b660 <running_req>
  809409:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80940c:	83 f8 0a             	cmp    eax,0xa
  80940f:	7e 29                	jle    80943a <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  809411:	48 8b 05 48 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22248]        # 42b660 <running_req>
  809418:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  80941f:	48 8b 05 3a 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2223a]        # 42b660 <running_req>
  809426:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  80942d:	48 c7 05 28 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22228],0x0        # 42b660 <running_req>
  809434:	00 00 00 00 
  809438:	eb 0a                	jmp    809444 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80943a:	b8 02 00 00 00       	mov    eax,0x2
  80943f:	e9 72 01 00 00       	jmp    8095b6 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  809444:	8b 15 46 22 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22246]        # 42b690 <head>
  80944a:	8b 05 44 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22244]        # 42b694 <tail>
  809450:	39 c2                	cmp    edx,eax
  809452:	75 0a                	jne    80945e <execute_request+0x9c>
  809454:	b8 01 00 00 00       	mov    eax,0x1
  809459:	e9 58 01 00 00       	jmp    8095b6 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80945e:	8b 05 2c 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2222c]        # 42b690 <head>
  809464:	48 63 d0             	movsxd rdx,eax
  809467:	48 89 d0             	mov    rax,rdx
  80946a:	48 01 c0             	add    rax,rax
  80946d:	48 01 d0             	add    rax,rdx
  809470:	48 c1 e0 04          	shl    rax,0x4
  809474:	48 05 60 89 42 00    	add    rax,0x428960
  80947a:	48 89 05 df 21 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc221df],rax        # 42b660 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  809481:	8b 05 09 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22209]        # 42b690 <head>
  809487:	8d 50 01             	lea    edx,[rax+0x1]
  80948a:	48 63 c2             	movsxd rax,edx
  80948d:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  809494:	48 c1 e8 20          	shr    rax,0x20
  809498:	01 d0                	add    eax,edx
  80949a:	c1 f8 07             	sar    eax,0x7
  80949d:	89 d1                	mov    ecx,edx
  80949f:	c1 f9 1f             	sar    ecx,0x1f
  8094a2:	29 c8                	sub    eax,ecx
  8094a4:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8094aa:	89 d0                	mov    eax,edx
  8094ac:	29 c8                	sub    eax,ecx
  8094ae:	89 05 dc 21 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc221dc],eax        # 42b690 <head>
    running_req->stat=REQ_STAT_WORKING;
  8094b4:	48 8b 05 a5 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221a5]        # 42b660 <running_req>
  8094bb:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8094c2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8094c9:	48 8b 05 90 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22190]        # 42b660 <running_req>
  8094d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8094d2:	83 f8 03             	cmp    eax,0x3
  8094d5:	0f 84 ad 00 00 00    	je     809588 <execute_request+0x1c6>
  8094db:	83 f8 03             	cmp    eax,0x3
  8094de:	0f 8f bf 00 00 00    	jg     8095a3 <execute_request+0x1e1>
  8094e4:	83 f8 02             	cmp    eax,0x2
  8094e7:	0f 84 85 00 00 00    	je     809572 <execute_request+0x1b0>
  8094ed:	83 f8 02             	cmp    eax,0x2
  8094f0:	0f 8f ad 00 00 00    	jg     8095a3 <execute_request+0x1e1>
  8094f6:	85 c0                	test   eax,eax
  8094f8:	74 0a                	je     809504 <execute_request+0x142>
  8094fa:	83 f8 01             	cmp    eax,0x1
  8094fd:	74 3c                	je     80953b <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8094ff:	e9 9f 00 00 00       	jmp    8095a3 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  809504:	48 8b 05 55 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22155]        # 42b660 <running_req>
        r=async_read_disk(running_req->disk,\
  80950b:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  80950f:	48 8b 05 4a 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2214a]        # 42b660 <running_req>
        r=async_read_disk(running_req->disk,\
  809516:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  809519:	48 8b 05 40 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22140]        # 42b660 <running_req>
  809520:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  809523:	89 c6                	mov    esi,eax
  809525:	48 8b 05 34 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22134]        # 42b660 <running_req>
  80952c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80952f:	89 c7                	mov    edi,eax
  809531:	e8 a7 00 00 00       	call   8095dd <async_read_disk>
  809536:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809539:	eb 69                	jmp    8095a4 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80953b:	48 8b 05 1e 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2211e]        # 42b660 <running_req>
        r=async_write_disk(running_req->disk,\
  809542:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  809546:	48 8b 05 13 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22113]        # 42b660 <running_req>
        r=async_write_disk(running_req->disk,\
  80954d:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  809550:	48 8b 05 09 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22109]        # 42b660 <running_req>
  809557:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80955a:	89 c6                	mov    esi,eax
  80955c:	48 8b 05 fd 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220fd]        # 42b660 <running_req>
  809563:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809566:	89 c7                	mov    edi,eax
  809568:	e8 88 01 00 00       	call   8096f5 <async_write_disk>
  80956d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809570:	eb 32                	jmp    8095a4 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  809572:	48 8b 05 e7 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220e7]        # 42b660 <running_req>
  809579:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80957c:	89 c7                	mov    edi,eax
  80957e:	e8 aa 06 00 00       	call   809c2d <async_check_disk>
  809583:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809586:	eb 1c                	jmp    8095a4 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  809588:	48 8b 05 d1 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220d1]        # 42b660 <running_req>
  80958f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809592:	89 c7                	mov    edi,eax
  809594:	b8 00 00 00 00       	mov    eax,0x0
  809599:	e8 1a 00 00 00       	call   8095b8 <async_reset_disk>
  80959e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8095a1:	eb 01                	jmp    8095a4 <execute_request+0x1e2>
        break;
  8095a3:	90                   	nop
    }
    if(r==-1)return -1;
  8095a4:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8095a8:	75 07                	jne    8095b1 <execute_request+0x1ef>
  8095aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8095af:	eb 05                	jmp    8095b6 <execute_request+0x1f4>
    return 0;
  8095b1:	b8 00 00 00 00       	mov    eax,0x0
}
  8095b6:	c9                   	leave  
  8095b7:	c3                   	ret    

00000000008095b8 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8095b8:	f3 0f 1e fa          	endbr64 
  8095bc:	55                   	push   rbp
  8095bd:	48 89 e5             	mov    rbp,rsp
  8095c0:	48 83 ec 10          	sub    rsp,0x10
  8095c4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8095c7:	be 0c 00 00 00       	mov    esi,0xc
  8095cc:	bf f6 03 00 00       	mov    edi,0x3f6
  8095d1:	e8 7a cf ff ff       	call   806550 <outb>
    return 0;
  8095d6:	b8 00 00 00 00       	mov    eax,0x0
}
  8095db:	c9                   	leave  
  8095dc:	c3                   	ret    

00000000008095dd <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8095dd:	f3 0f 1e fa          	endbr64 
  8095e1:	55                   	push   rbp
  8095e2:	48 89 e5             	mov    rbp,rsp
  8095e5:	48 83 ec 30          	sub    rsp,0x30
  8095e9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8095ec:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8095ef:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8095f2:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8095f6:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8095fc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809603:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809607:	74 06                	je     80960f <async_read_disk+0x32>
  809609:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80960d:	75 06                	jne    809615 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  80960f:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809615:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809619:	74 06                	je     809621 <async_read_disk+0x44>
  80961b:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80961f:	75 07                	jne    809628 <async_read_disk+0x4b>
        slave_disk=1;
  809621:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  809628:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80962b:	0f b6 d0             	movzx  edx,al
  80962e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809632:	83 c0 02             	add    eax,0x2
  809635:	0f b7 c0             	movzx  eax,ax
  809638:	89 d6                	mov    esi,edx
  80963a:	89 c7                	mov    edi,eax
  80963c:	e8 0f cf ff ff       	call   806550 <outb>
    outb(port+3,lba&0xff);
  809641:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809644:	0f b6 d0             	movzx  edx,al
  809647:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80964b:	83 c0 03             	add    eax,0x3
  80964e:	0f b7 c0             	movzx  eax,ax
  809651:	89 d6                	mov    esi,edx
  809653:	89 c7                	mov    edi,eax
  809655:	e8 f6 ce ff ff       	call   806550 <outb>
    outb(port+4,(lba>>8)&0xff);
  80965a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80965d:	c1 e8 08             	shr    eax,0x8
  809660:	0f b6 d0             	movzx  edx,al
  809663:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809667:	83 c0 04             	add    eax,0x4
  80966a:	0f b7 c0             	movzx  eax,ax
  80966d:	89 d6                	mov    esi,edx
  80966f:	89 c7                	mov    edi,eax
  809671:	e8 da ce ff ff       	call   806550 <outb>
    outb(port+5,(lba>>16)&0xff);
  809676:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809679:	c1 e8 10             	shr    eax,0x10
  80967c:	0f b6 d0             	movzx  edx,al
  80967f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809683:	83 c0 05             	add    eax,0x5
  809686:	0f b7 c0             	movzx  eax,ax
  809689:	89 d6                	mov    esi,edx
  80968b:	89 c7                	mov    edi,eax
  80968d:	e8 be ce ff ff       	call   806550 <outb>
    char drv=slave_disk?0x10:0;
  809692:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809696:	74 07                	je     80969f <async_read_disk+0xc2>
  809698:	b8 10 00 00 00       	mov    eax,0x10
  80969d:	eb 05                	jmp    8096a4 <async_read_disk+0xc7>
  80969f:	b8 00 00 00 00       	mov    eax,0x0
  8096a4:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8096a7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8096aa:	c1 e8 18             	shr    eax,0x18
  8096ad:	83 e0 0f             	and    eax,0xf
  8096b0:	89 c2                	mov    edx,eax
  8096b2:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8096b6:	09 d0                	or     eax,edx
  8096b8:	83 c8 e0             	or     eax,0xffffffe0
  8096bb:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8096be:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8096c2:	0f b6 d0             	movzx  edx,al
  8096c5:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8096c9:	83 c0 06             	add    eax,0x6
  8096cc:	0f b7 c0             	movzx  eax,ax
  8096cf:	89 d6                	mov    esi,edx
  8096d1:	89 c7                	mov    edi,eax
  8096d3:	e8 78 ce ff ff       	call   806550 <outb>
    outb(port+7,DISK_CMD_READ);
  8096d8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8096dc:	83 c0 07             	add    eax,0x7
  8096df:	0f b7 c0             	movzx  eax,ax
  8096e2:	be 20 00 00 00       	mov    esi,0x20
  8096e7:	89 c7                	mov    edi,eax
  8096e9:	e8 62 ce ff ff       	call   806550 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8096ee:	b8 00 00 00 00       	mov    eax,0x0
}
  8096f3:	c9                   	leave  
  8096f4:	c3                   	ret    

00000000008096f5 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8096f5:	f3 0f 1e fa          	endbr64 
  8096f9:	55                   	push   rbp
  8096fa:	48 89 e5             	mov    rbp,rsp
  8096fd:	48 83 ec 30          	sub    rsp,0x30
  809701:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809704:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809707:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80970a:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80970e:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809714:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80971b:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80971f:	74 06                	je     809727 <async_write_disk+0x32>
  809721:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809725:	75 06                	jne    80972d <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  809727:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80972d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809731:	74 06                	je     809739 <async_write_disk+0x44>
  809733:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809737:	75 07                	jne    809740 <async_write_disk+0x4b>
        slave_disk=1;
  809739:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  809740:	bf f7 00 00 00       	mov    edi,0xf7
  809745:	e8 1f ce ff ff       	call   806569 <inb>
  80974a:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  80974d:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809751:	83 e0 01             	and    eax,0x1
  809754:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  809757:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80975b:	74 0a                	je     809767 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  80975d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809762:	e9 d5 00 00 00       	jmp    80983c <async_write_disk+0x147>
        }
        t&=0x88;
  809767:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  80976b:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  80976f:	74 02                	je     809773 <async_write_disk+0x7e>
    {
  809771:	eb cd                	jmp    809740 <async_write_disk+0x4b>
        if(t==0x8)break;
  809773:	90                   	nop
    }
    outb(port+2,sec_n);
  809774:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809777:	0f b6 d0             	movzx  edx,al
  80977a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80977e:	83 c0 02             	add    eax,0x2
  809781:	0f b7 c0             	movzx  eax,ax
  809784:	89 d6                	mov    esi,edx
  809786:	89 c7                	mov    edi,eax
  809788:	e8 c3 cd ff ff       	call   806550 <outb>
    outb(port+3,lba&0xff);
  80978d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809790:	0f b6 d0             	movzx  edx,al
  809793:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809797:	83 c0 03             	add    eax,0x3
  80979a:	0f b7 c0             	movzx  eax,ax
  80979d:	89 d6                	mov    esi,edx
  80979f:	89 c7                	mov    edi,eax
  8097a1:	e8 aa cd ff ff       	call   806550 <outb>
    outb(port+4,(lba>>8)&0xff);
  8097a6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8097a9:	c1 e8 08             	shr    eax,0x8
  8097ac:	0f b6 d0             	movzx  edx,al
  8097af:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8097b3:	83 c0 04             	add    eax,0x4
  8097b6:	0f b7 c0             	movzx  eax,ax
  8097b9:	89 d6                	mov    esi,edx
  8097bb:	89 c7                	mov    edi,eax
  8097bd:	e8 8e cd ff ff       	call   806550 <outb>
    outb(port+5,(lba>>16)&0xff);
  8097c2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8097c5:	c1 e8 10             	shr    eax,0x10
  8097c8:	0f b6 d0             	movzx  edx,al
  8097cb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8097cf:	83 c0 05             	add    eax,0x5
  8097d2:	0f b7 c0             	movzx  eax,ax
  8097d5:	89 d6                	mov    esi,edx
  8097d7:	89 c7                	mov    edi,eax
  8097d9:	e8 72 cd ff ff       	call   806550 <outb>
    char drv=slave_disk?0x10:0;
  8097de:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8097e2:	74 07                	je     8097eb <async_write_disk+0xf6>
  8097e4:	b8 10 00 00 00       	mov    eax,0x10
  8097e9:	eb 05                	jmp    8097f0 <async_write_disk+0xfb>
  8097eb:	b8 00 00 00 00       	mov    eax,0x0
  8097f0:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8097f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8097f6:	c1 e8 18             	shr    eax,0x18
  8097f9:	83 e0 0f             	and    eax,0xf
  8097fc:	89 c2                	mov    edx,eax
  8097fe:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  809802:	09 d0                	or     eax,edx
  809804:	83 c8 e0             	or     eax,0xffffffe0
  809807:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  80980a:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80980e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809812:	83 c0 06             	add    eax,0x6
  809815:	0f b7 c0             	movzx  eax,ax
  809818:	89 d6                	mov    esi,edx
  80981a:	89 c7                	mov    edi,eax
  80981c:	e8 2f cd ff ff       	call   806550 <outb>
    outb(port+7,DISK_CMD_WRITE);
  809821:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809825:	83 c0 07             	add    eax,0x7
  809828:	0f b7 c0             	movzx  eax,ax
  80982b:	be 30 00 00 00       	mov    esi,0x30
  809830:	89 c7                	mov    edi,eax
  809832:	e8 19 cd ff ff       	call   806550 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  809837:	b8 00 00 00 00       	mov    eax,0x0
}
  80983c:	c9                   	leave  
  80983d:	c3                   	ret    

000000000080983e <read_disk>:
int read_disk(driver_args* args)
{
  80983e:	f3 0f 1e fa          	endbr64 
  809842:	55                   	push   rbp
  809843:	48 89 e5             	mov    rbp,rsp
  809846:	48 83 ec 20          	sub    rsp,0x20
  80984a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80984e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809852:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809855:	48 98                	cdqe   
  809857:	48 89 c2             	mov    rdx,rax
  80985a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80985e:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809861:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809865:	8b 00                	mov    eax,DWORD PTR [rax]
  809867:	89 ce                	mov    esi,ecx
  809869:	89 c7                	mov    edi,eax
  80986b:	e8 ac 05 00 00       	call   809e1c <read_disk_asm>
  809870:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809873:	48 8b 05 e6 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21de6]        # 42b660 <running_req>
  80987a:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809881:	48 8b 05 d8 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21dd8]        # 42b660 <running_req>
  809888:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80988c:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809893:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  809896:	48 c7 05 bf 1d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21dbf],0x0        # 42b660 <running_req>
  80989d:	00 00 00 00 
    return ret;
  8098a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8098a4:	c9                   	leave  
  8098a5:	c3                   	ret    

00000000008098a6 <write_disk>:
int write_disk(driver_args* args)
{
  8098a6:	f3 0f 1e fa          	endbr64 
  8098aa:	55                   	push   rbp
  8098ab:	48 89 e5             	mov    rbp,rsp
  8098ae:	48 83 ec 20          	sub    rsp,0x20
  8098b2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8098b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098ba:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8098bd:	48 98                	cdqe   
  8098bf:	48 89 c2             	mov    rdx,rax
  8098c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098c6:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8098c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098cd:	8b 00                	mov    eax,DWORD PTR [rax]
  8098cf:	89 ce                	mov    esi,ecx
  8098d1:	89 c7                	mov    edi,eax
  8098d3:	e8 c4 05 00 00       	call   809e9c <write_disk_asm>
  8098d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8098db:	48 8b 05 7e 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d7e]        # 42b660 <running_req>
  8098e2:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8098e9:	48 8b 05 70 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d70]        # 42b660 <running_req>
  8098f0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8098f4:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8098fb:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8098fe:	48 c7 05 57 1d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21d57],0x0        # 42b660 <running_req>
  809905:	00 00 00 00 
    return ret;
  809909:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80990c:	c9                   	leave  
  80990d:	c3                   	ret    

000000000080990e <chk_result>:
int chk_result(int r)
{
  80990e:	f3 0f 1e fa          	endbr64 
  809912:	55                   	push   rbp
  809913:	48 89 e5             	mov    rbp,rsp
  809916:	48 83 ec 10          	sub    rsp,0x10
  80991a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  80991d:	90                   	nop
  80991e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809921:	48 63 d0             	movsxd rdx,eax
  809924:	48 89 d0             	mov    rax,rdx
  809927:	48 01 c0             	add    rax,rax
  80992a:	48 01 d0             	add    rax,rdx
  80992d:	48 c1 e0 04          	shl    rax,0x4
  809931:	48 05 7c 89 42 00    	add    rax,0x42897c
  809937:	8b 00                	mov    eax,DWORD PTR [rax]
  809939:	83 f8 03             	cmp    eax,0x3
  80993c:	75 e0                	jne    80991e <chk_result+0x10>
    if(disk_reqs[r].result==DISK_CHK_OK)
  80993e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809941:	48 63 d0             	movsxd rdx,eax
  809944:	48 89 d0             	mov    rax,rdx
  809947:	48 01 c0             	add    rax,rax
  80994a:	48 01 d0             	add    rax,rdx
  80994d:	48 c1 e0 04          	shl    rax,0x4
  809951:	48 05 80 89 42 00    	add    rax,0x428980
  809957:	8b 00                	mov    eax,DWORD PTR [rax]
  809959:	83 f8 01             	cmp    eax,0x1
  80995c:	75 07                	jne    809965 <chk_result+0x57>
        return 1;
  80995e:	b8 01 00 00 00       	mov    eax,0x1
  809963:	eb 14                	jmp    809979 <chk_result+0x6b>
    comprintf("disk err\n");
  809965:	bf c8 54 81 00       	mov    edi,0x8154c8
  80996a:	b8 00 00 00 00       	mov    eax,0x0
  80996f:	e8 29 2f 00 00       	call   80c89d <comprintf>
    return 0;
  809974:	b8 00 00 00 00       	mov    eax,0x0
}
  809979:	c9                   	leave  
  80997a:	c3                   	ret    

000000000080997b <disk_existent>:
int disk_existent(int disk)
{
  80997b:	f3 0f 1e fa          	endbr64 
  80997f:	55                   	push   rbp
  809980:	48 89 e5             	mov    rbp,rsp
  809983:	48 83 ec 10          	sub    rsp,0x10
  809987:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  80998a:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80998e:	74 5f                	je     8099ef <disk_existent+0x74>
  809990:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809994:	7f 6e                	jg     809a04 <disk_existent+0x89>
  809996:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80999a:	74 3e                	je     8099da <disk_existent+0x5f>
  80999c:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8099a0:	7f 62                	jg     809a04 <disk_existent+0x89>
  8099a2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8099a6:	74 08                	je     8099b0 <disk_existent+0x35>
  8099a8:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8099ac:	74 17                	je     8099c5 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8099ae:	eb 54                	jmp    809a04 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8099b0:	bf d2 54 81 00       	mov    edi,0x8154d2
  8099b5:	e8 1f 9a ff ff       	call   8033d9 <sys_find_dev>
  8099ba:	83 f8 ff             	cmp    eax,0xffffffff
  8099bd:	0f 95 c0             	setne  al
  8099c0:	0f b6 c0             	movzx  eax,al
  8099c3:	eb 45                	jmp    809a0a <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8099c5:	bf d6 54 81 00       	mov    edi,0x8154d6
  8099ca:	e8 0a 9a ff ff       	call   8033d9 <sys_find_dev>
  8099cf:	83 f8 ff             	cmp    eax,0xffffffff
  8099d2:	0f 95 c0             	setne  al
  8099d5:	0f b6 c0             	movzx  eax,al
  8099d8:	eb 30                	jmp    809a0a <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8099da:	bf da 54 81 00       	mov    edi,0x8154da
  8099df:	e8 f5 99 ff ff       	call   8033d9 <sys_find_dev>
  8099e4:	83 f8 ff             	cmp    eax,0xffffffff
  8099e7:	0f 95 c0             	setne  al
  8099ea:	0f b6 c0             	movzx  eax,al
  8099ed:	eb 1b                	jmp    809a0a <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8099ef:	bf de 54 81 00       	mov    edi,0x8154de
  8099f4:	e8 e0 99 ff ff       	call   8033d9 <sys_find_dev>
  8099f9:	83 f8 ff             	cmp    eax,0xffffffff
  8099fc:	0f 95 c0             	setne  al
  8099ff:	0f b6 c0             	movzx  eax,al
  809a02:	eb 06                	jmp    809a0a <disk_existent+0x8f>
        break;
  809a04:	90                   	nop
    }
    return 0;
  809a05:	b8 00 00 00 00       	mov    eax,0x0
}
  809a0a:	c9                   	leave  
  809a0b:	c3                   	ret    

0000000000809a0c <hd_iterate>:
int hd_iterate()
{
  809a0c:	f3 0f 1e fa          	endbr64 
  809a10:	55                   	push   rbp
  809a11:	48 89 e5             	mov    rbp,rsp
  809a14:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  809a1b:	41 b8 00 00 00 00    	mov    r8d,0x0
  809a21:	b9 01 00 00 00       	mov    ecx,0x1
  809a26:	ba 00 00 00 00       	mov    edx,0x0
  809a2b:	be 02 00 00 00       	mov    esi,0x2
  809a30:	bf 00 00 00 00       	mov    edi,0x0
  809a35:	e8 20 f8 ff ff       	call   80925a <request>
  809a3a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  809a3d:	41 b8 00 00 00 00    	mov    r8d,0x0
  809a43:	b9 01 00 00 00       	mov    ecx,0x1
  809a48:	ba 00 00 00 00       	mov    edx,0x0
  809a4d:	be 02 00 00 00       	mov    esi,0x2
  809a52:	bf 01 00 00 00       	mov    edi,0x1
  809a57:	e8 fe f7 ff ff       	call   80925a <request>
  809a5c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  809a5f:	41 b8 00 00 00 00    	mov    r8d,0x0
  809a65:	b9 01 00 00 00       	mov    ecx,0x1
  809a6a:	ba 00 00 00 00       	mov    edx,0x0
  809a6f:	be 02 00 00 00       	mov    esi,0x2
  809a74:	bf 02 00 00 00       	mov    edi,0x2
  809a79:	e8 dc f7 ff ff       	call   80925a <request>
  809a7e:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  809a81:	41 b8 00 00 00 00    	mov    r8d,0x0
  809a87:	b9 01 00 00 00       	mov    ecx,0x1
  809a8c:	ba 00 00 00 00       	mov    edx,0x0
  809a91:	be 02 00 00 00       	mov    esi,0x2
  809a96:	bf 03 00 00 00       	mov    edi,0x3
  809a9b:	e8 ba f7 ff ff       	call   80925a <request>
  809aa0:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  809aa3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809aaa:	e9 72 01 00 00       	jmp    809c21 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  809aaf:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809ab3:	74 3b                	je     809af0 <hd_iterate+0xe4>
  809ab5:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809ab9:	7f 3e                	jg     809af9 <hd_iterate+0xed>
  809abb:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809abf:	74 26                	je     809ae7 <hd_iterate+0xdb>
  809ac1:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809ac5:	7f 32                	jg     809af9 <hd_iterate+0xed>
  809ac7:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809acb:	74 08                	je     809ad5 <hd_iterate+0xc9>
  809acd:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  809ad1:	74 0b                	je     809ade <hd_iterate+0xd2>
  809ad3:	eb 24                	jmp    809af9 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  809ad5:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  809adc:	eb 25                	jmp    809b03 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  809ade:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  809ae5:	eb 1c                	jmp    809b03 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  809ae7:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  809aee:	eb 13                	jmp    809b03 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  809af0:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  809af7:	eb 0a                	jmp    809b03 <hd_iterate+0xf7>
        default:
            return -1;
  809af9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809afe:	e9 28 01 00 00       	jmp    809c2b <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  809b03:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809b06:	48 98                	cdqe   
  809b08:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  809b0c:	89 c7                	mov    edi,eax
  809b0e:	e8 fb fd ff ff       	call   80990e <chk_result>
  809b13:	85 c0                	test   eax,eax
  809b15:	0f 84 81 00 00 00    	je     809b9c <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  809b1b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809b1e:	89 c6                	mov    esi,eax
  809b20:	bf e2 54 81 00       	mov    edi,0x8154e2
  809b25:	b8 00 00 00 00       	mov    eax,0x0
  809b2a:	e8 32 72 ff ff       	call   800d61 <printf>
            //新硬盘
            device hd={
  809b2f:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  809b36:	b8 00 00 00 00       	mov    eax,0x0
  809b3b:	b9 15 00 00 00       	mov    ecx,0x15
  809b40:	48 89 d7             	mov    rdi,rdx
  809b43:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  809b46:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809b49:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  809b4f:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  809b56:	00 00 00 
  809b59:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  809b60:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  809b63:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  809b67:	7f 07                	jg     809b70 <hd_iterate+0x164>
  809b69:	b8 f0 01 00 00       	mov    eax,0x1f0
  809b6e:	eb 05                	jmp    809b75 <hd_iterate+0x169>
  809b70:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  809b75:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  809b7b:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  809b82:	48 89 c7             	mov    rdi,rax
  809b85:	e8 17 94 ff ff       	call   802fa1 <reg_device>
  809b8a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809b8d:	48 63 d2             	movsxd rdx,edx
  809b90:	89 04 95 80 b6 42 00 	mov    DWORD PTR [rdx*4+0x42b680],eax
  809b97:	e9 81 00 00 00       	jmp    809c1d <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  809b9c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809b9f:	48 98                	cdqe   
  809ba1:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  809ba5:	89 c7                	mov    edi,eax
  809ba7:	e8 62 fd ff ff       	call   80990e <chk_result>
  809bac:	85 c0                	test   eax,eax
  809bae:	75 6d                	jne    809c1d <hd_iterate+0x211>
        {
            switch (i)
  809bb0:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809bb4:	74 3e                	je     809bf4 <hd_iterate+0x1e8>
  809bb6:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  809bba:	7f 41                	jg     809bfd <hd_iterate+0x1f1>
  809bbc:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809bc0:	74 28                	je     809bea <hd_iterate+0x1de>
  809bc2:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  809bc6:	7f 35                	jg     809bfd <hd_iterate+0x1f1>
  809bc8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809bcc:	74 08                	je     809bd6 <hd_iterate+0x1ca>
  809bce:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  809bd2:	74 0c                	je     809be0 <hd_iterate+0x1d4>
  809bd4:	eb 27                	jmp    809bfd <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  809bd6:	48 c7 45 f8 d2 54 81 	mov    QWORD PTR [rbp-0x8],0x8154d2
  809bdd:	00 
  809bde:	eb 1d                	jmp    809bfd <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  809be0:	48 c7 45 f8 d6 54 81 	mov    QWORD PTR [rbp-0x8],0x8154d6
  809be7:	00 
  809be8:	eb 13                	jmp    809bfd <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  809bea:	48 c7 45 f8 da 54 81 	mov    QWORD PTR [rbp-0x8],0x8154da
  809bf1:	00 
  809bf2:	eb 09                	jmp    809bfd <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  809bf4:	48 c7 45 f8 de 54 81 	mov    QWORD PTR [rbp-0x8],0x8154de
  809bfb:	00 
  809bfc:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  809bfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c01:	48 89 c7             	mov    rdi,rax
  809c04:	e8 d0 97 ff ff       	call   8033d9 <sys_find_dev>
  809c09:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  809c0c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809c0f:	89 c7                	mov    edi,eax
  809c11:	e8 97 9e ff ff       	call   803aad <get_dev>
  809c16:	89 c7                	mov    edi,eax
  809c18:	e8 e3 9d ff ff       	call   803a00 <dispose_device>
    for(int i=0;i<1;i++)
  809c1d:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809c21:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809c25:	0f 8e 84 fe ff ff    	jle    809aaf <hd_iterate+0xa3>
        }

    }
}
  809c2b:	c9                   	leave  
  809c2c:	c3                   	ret    

0000000000809c2d <async_check_disk>:

int async_check_disk(int disk)
{
  809c2d:	f3 0f 1e fa          	endbr64 
  809c31:	55                   	push   rbp
  809c32:	48 89 e5             	mov    rbp,rsp
  809c35:	48 83 ec 20          	sub    rsp,0x20
  809c39:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  809c3c:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  809c42:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809c48:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809c4c:	74 06                	je     809c54 <async_check_disk+0x27>
  809c4e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809c52:	75 06                	jne    809c5a <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  809c54:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  809c5a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809c5e:	74 06                	je     809c66 <async_check_disk+0x39>
  809c60:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809c64:	75 06                	jne    809c6c <async_check_disk+0x3f>
        chkcmd=0xf0;
  809c66:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  809c6c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c70:	83 c0 02             	add    eax,0x2
  809c73:	0f b7 c0             	movzx  eax,ax
  809c76:	be 01 00 00 00       	mov    esi,0x1
  809c7b:	89 c7                	mov    edi,eax
  809c7d:	e8 ce c8 ff ff       	call   806550 <outb>
    outb(disknr+3,0);
  809c82:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c86:	83 c0 03             	add    eax,0x3
  809c89:	0f b7 c0             	movzx  eax,ax
  809c8c:	be 00 00 00 00       	mov    esi,0x0
  809c91:	89 c7                	mov    edi,eax
  809c93:	e8 b8 c8 ff ff       	call   806550 <outb>
    outb(disknr+4,0);
  809c98:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c9c:	83 c0 04             	add    eax,0x4
  809c9f:	0f b7 c0             	movzx  eax,ax
  809ca2:	be 00 00 00 00       	mov    esi,0x0
  809ca7:	89 c7                	mov    edi,eax
  809ca9:	e8 a2 c8 ff ff       	call   806550 <outb>
    outb(disknr+5,0);
  809cae:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809cb2:	83 c0 05             	add    eax,0x5
  809cb5:	0f b7 c0             	movzx  eax,ax
  809cb8:	be 00 00 00 00       	mov    esi,0x0
  809cbd:	89 c7                	mov    edi,eax
  809cbf:	e8 8c c8 ff ff       	call   806550 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  809cc4:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  809cc8:	0f b6 d0             	movzx  edx,al
  809ccb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ccf:	83 c0 06             	add    eax,0x6
  809cd2:	0f b7 c0             	movzx  eax,ax
  809cd5:	89 d6                	mov    esi,edx
  809cd7:	89 c7                	mov    edi,eax
  809cd9:	e8 72 c8 ff ff       	call   806550 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  809cde:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ce2:	83 c0 07             	add    eax,0x7
  809ce5:	0f b7 c0             	movzx  eax,ax
  809ce8:	be 90 00 00 00       	mov    esi,0x90
  809ced:	89 c7                	mov    edi,eax
  809cef:	e8 5c c8 ff ff       	call   806550 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  809cf4:	b8 00 00 00 00       	mov    eax,0x0
}
  809cf9:	c9                   	leave  
  809cfa:	c3                   	ret    

0000000000809cfb <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  809cfb:	f3 0f 1e fa          	endbr64 
  809cff:	55                   	push   rbp
  809d00:	48 89 e5             	mov    rbp,rsp
  809d03:	48 83 ec 18          	sub    rsp,0x18
  809d07:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  809d0b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  809d12:	eb 04                	jmp    809d18 <hd_do_req+0x1d>
  809d14:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809d18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809d1b:	48 98                	cdqe   
  809d1d:	8b 14 85 80 b6 42 00 	mov    edx,DWORD PTR [rax*4+0x42b680]
  809d24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d28:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  809d2e:	39 c2                	cmp    edx,eax
  809d30:	75 e2                	jne    809d14 <hd_do_req+0x19>
    switch (args->cmd)
  809d32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d36:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  809d3c:	83 f8 04             	cmp    eax,0x4
  809d3f:	74 72                	je     809db3 <hd_do_req+0xb8>
  809d41:	83 f8 04             	cmp    eax,0x4
  809d44:	0f 8f 96 00 00 00    	jg     809de0 <hd_do_req+0xe5>
  809d4a:	83 f8 02             	cmp    eax,0x2
  809d4d:	74 0a                	je     809d59 <hd_do_req+0x5e>
  809d4f:	83 f8 03             	cmp    eax,0x3
  809d52:	74 32                	je     809d86 <hd_do_req+0x8b>
  809d54:	e9 87 00 00 00       	jmp    809de0 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  809d59:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d5d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809d60:	48 98                	cdqe   
  809d62:	48 89 c6             	mov    rsi,rax
  809d65:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d69:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809d6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d70:	8b 10                	mov    edx,DWORD PTR [rax]
  809d72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809d75:	49 89 f0             	mov    r8,rsi
  809d78:	be 00 00 00 00       	mov    esi,0x0
  809d7d:	89 c7                	mov    edi,eax
  809d7f:	e8 d6 f4 ff ff       	call   80925a <request>
        break;
  809d84:	eb 61                	jmp    809de7 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  809d86:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d8a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809d8d:	48 98                	cdqe   
  809d8f:	48 89 c6             	mov    rsi,rax
  809d92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d96:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809d99:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d9d:	8b 10                	mov    edx,DWORD PTR [rax]
  809d9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809da2:	49 89 f0             	mov    r8,rsi
  809da5:	be 01 00 00 00       	mov    esi,0x1
  809daa:	89 c7                	mov    edi,eax
  809dac:	e8 a9 f4 ff ff       	call   80925a <request>
        break;
  809db1:	eb 34                	jmp    809de7 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  809db3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809db7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809dba:	48 98                	cdqe   
  809dbc:	48 89 c6             	mov    rsi,rax
  809dbf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dc3:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809dc6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dca:	8b 10                	mov    edx,DWORD PTR [rax]
  809dcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809dcf:	49 89 f0             	mov    r8,rsi
  809dd2:	be 02 00 00 00       	mov    esi,0x2
  809dd7:	89 c7                	mov    edi,eax
  809dd9:	e8 7c f4 ff ff       	call   80925a <request>
        break;
  809dde:	eb 07                	jmp    809de7 <hd_do_req+0xec>
    default:return -1;
  809de0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809de5:	eb 1e                	jmp    809e05 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  809de7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809deb:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  809df2:	00 00 00 
    running_devman_req=args;
  809df5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809df9:	48 89 05 68 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21868],rax        # 42b668 <running_devman_req>
    return 0;
  809e00:	b8 00 00 00 00       	mov    eax,0x0
  809e05:	c9                   	leave  
  809e06:	c3                   	ret    
  809e07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  809e0e:	00 00 

0000000000809e10 <disk_int_handler>:
  809e10:	e8 69 c7 ff ff       	call   80657e <eoi>
  809e15:	e8 35 f2 ff ff       	call   80904f <disk_int_handler_c>
  809e1a:	48 cf                	iretq  

0000000000809e1c <read_disk_asm>:
  809e1c:	55                   	push   rbp
  809e1d:	89 e5                	mov    ebp,esp
  809e1f:	66 ba f7 01          	mov    dx,0x1f7
  809e23:	31 c9                	xor    ecx,ecx
  809e25:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  809e2a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  809e2f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  809e34:	89 c6                	mov    esi,eax
  809e36:	66 ba f2 01          	mov    dx,0x1f2
  809e3a:	88 c8                	mov    al,cl
  809e3c:	ee                   	out    dx,al
  809e3d:	66 ba f3 01          	mov    dx,0x1f3
  809e41:	89 f0                	mov    eax,esi
  809e43:	ee                   	out    dx,al
  809e44:	66 ff c2             	inc    dx
  809e47:	c1 e8 08             	shr    eax,0x8
  809e4a:	ee                   	out    dx,al
  809e4b:	66 ff c2             	inc    dx
  809e4e:	c1 e8 08             	shr    eax,0x8
  809e51:	ee                   	out    dx,al
  809e52:	66 ff c2             	inc    dx
  809e55:	66 c1 e8 08          	shr    ax,0x8
  809e59:	24 0f                	and    al,0xf
  809e5b:	0c e0                	or     al,0xe0
  809e5d:	ee                   	out    dx,al
  809e5e:	66 ff c2             	inc    dx
  809e61:	b0 20                	mov    al,0x20
  809e63:	ee                   	out    dx,al

0000000000809e64 <read_disk_asm.wait>:
  809e64:	90                   	nop
  809e65:	ec                   	in     al,dx
  809e66:	24 88                	and    al,0x88
  809e68:	3c 08                	cmp    al,0x8
  809e6a:	75 f8                	jne    809e64 <read_disk_asm.wait>
  809e6c:	66 89 d7             	mov    di,dx
  809e6f:	89 c8                	mov    eax,ecx
  809e71:	66 b9 00 01          	mov    cx,0x100
  809e75:	66 f7 e1             	mul    cx
  809e78:	89 c1                	mov    ecx,eax
  809e7a:	66 ba f0 01          	mov    dx,0x1f0

0000000000809e7e <read_disk_asm.read>:
  809e7e:	66 ed                	in     ax,dx
  809e80:	66 67 89 03          	mov    WORD PTR [ebx],ax
  809e84:	83 c3 02             	add    ebx,0x2
  809e87:	e2 f5                	loop   809e7e <read_disk_asm.read>
  809e89:	c9                   	leave  
  809e8a:	b8 00 00 00 00       	mov    eax,0x0
  809e8f:	c3                   	ret    

0000000000809e90 <read_disk_asm.err_disk_reading>:
  809e90:	66 ba f1 01          	mov    dx,0x1f1
  809e94:	31 c0                	xor    eax,eax
  809e96:	66 ed                	in     ax,dx
  809e98:	89 ec                	mov    esp,ebp
  809e9a:	5d                   	pop    rbp
  809e9b:	c3                   	ret    

0000000000809e9c <write_disk_asm>:
  809e9c:	55                   	push   rbp
  809e9d:	89 e5                	mov    ebp,esp
  809e9f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  809ea4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  809ea9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  809eae:	50                   	push   rax
  809eaf:	66 ba f2 01          	mov    dx,0x1f2
  809eb3:	88 c8                	mov    al,cl
  809eb5:	ee                   	out    dx,al
  809eb6:	58                   	pop    rax
  809eb7:	66 ba f3 01          	mov    dx,0x1f3
  809ebb:	ee                   	out    dx,al
  809ebc:	c1 e8 08             	shr    eax,0x8
  809ebf:	66 ba f4 01          	mov    dx,0x1f4
  809ec3:	ee                   	out    dx,al
  809ec4:	c1 e8 08             	shr    eax,0x8
  809ec7:	66 ba f5 01          	mov    dx,0x1f5
  809ecb:	ee                   	out    dx,al
  809ecc:	c1 e8 08             	shr    eax,0x8
  809ecf:	24 0f                	and    al,0xf
  809ed1:	0c e0                	or     al,0xe0
  809ed3:	66 ba f6 01          	mov    dx,0x1f6
  809ed7:	ee                   	out    dx,al
  809ed8:	66 ba f7 01          	mov    dx,0x1f7
  809edc:	b0 30                	mov    al,0x30
  809ede:	ee                   	out    dx,al

0000000000809edf <write_disk_asm.not_ready2>:
  809edf:	90                   	nop
  809ee0:	ec                   	in     al,dx
  809ee1:	24 88                	and    al,0x88
  809ee3:	3c 08                	cmp    al,0x8
  809ee5:	75 f8                	jne    809edf <write_disk_asm.not_ready2>
  809ee7:	89 c8                	mov    eax,ecx
  809ee9:	66 b9 00 01          	mov    cx,0x100
  809eed:	66 f7 e1             	mul    cx
  809ef0:	89 c1                	mov    ecx,eax
  809ef2:	66 ba f0 01          	mov    dx,0x1f0

0000000000809ef6 <write_disk_asm.go_on_write>:
  809ef6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  809efa:	66 ef                	out    dx,ax
  809efc:	83 c3 02             	add    ebx,0x2
  809eff:	e2 f5                	loop   809ef6 <write_disk_asm.go_on_write>
  809f01:	89 ec                	mov    esp,ebp
  809f03:	5d                   	pop    rbp
  809f04:	c3                   	ret    

0000000000809f05 <DISK1_FAT32_read_FAT_Entry>:
#include "memory.h"
#include "proc.h"
#include "devman.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  809f05:	f3 0f 1e fa          	endbr64 
  809f09:	55                   	push   rbp
  809f0a:	48 89 e5             	mov    rbp,rsp
  809f0d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  809f14:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  809f1b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  809f21:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809f28:	ba 00 02 00 00       	mov    edx,0x200
  809f2d:	be 00 00 00 00       	mov    esi,0x0
  809f32:	48 89 c7             	mov    rdi,rax
  809f35:	e8 85 2a 00 00       	call   80c9bf <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  809f3a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809f41:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809f45:	89 c2                	mov    edx,eax
  809f47:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809f4d:	c1 e8 07             	shr    eax,0x7
  809f50:	01 d0                	add    eax,edx
  809f52:	89 c2                	mov    edx,eax
  809f54:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809f5b:	49 89 c0             	mov    r8,rax
  809f5e:	b9 01 00 00 00       	mov    ecx,0x1
  809f63:	be 00 00 00 00       	mov    esi,0x0
  809f68:	bf 00 00 00 00       	mov    edi,0x0
  809f6d:	e8 e8 f2 ff ff       	call   80925a <request>
  809f72:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  809f75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809f78:	89 c7                	mov    edi,eax
  809f7a:	e8 8f f9 ff ff       	call   80990e <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  809f7f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809f85:	83 e0 7f             	and    eax,0x7f
  809f88:	89 c0                	mov    eax,eax
  809f8a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  809f91:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809f97:	89 c6                	mov    esi,eax
  809f99:	bf f8 54 81 00       	mov    edi,0x8154f8
  809f9e:	b8 00 00 00 00       	mov    eax,0x0
  809fa3:	e8 b9 6d ff ff       	call   800d61 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  809fa8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809fae:	83 e0 7f             	and    eax,0x7f
  809fb1:	89 c0                	mov    eax,eax
  809fb3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  809fba:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  809fbf:	c9                   	leave  
  809fc0:	c3                   	ret    

0000000000809fc1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  809fc1:	f3 0f 1e fa          	endbr64 
  809fc5:	55                   	push   rbp
  809fc6:	48 89 e5             	mov    rbp,rsp
  809fc9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  809fd0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  809fd7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  809fdd:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  809fe3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809fea:	ba 00 02 00 00       	mov    edx,0x200
  809fef:	be 00 00 00 00       	mov    esi,0x0
  809ff4:	48 89 c7             	mov    rdi,rax
  809ff7:	e8 c3 29 00 00       	call   80c9bf <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  809ffc:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a003:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a007:	89 c2                	mov    edx,eax
  80a009:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a00f:	c1 e8 07             	shr    eax,0x7
  80a012:	01 d0                	add    eax,edx
  80a014:	89 c2                	mov    edx,eax
  80a016:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a01d:	49 89 c0             	mov    r8,rax
  80a020:	b9 01 00 00 00       	mov    ecx,0x1
  80a025:	be 00 00 00 00       	mov    esi,0x0
  80a02a:	bf 00 00 00 00       	mov    edi,0x0
  80a02f:	e8 26 f2 ff ff       	call   80925a <request>
  80a034:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  80a037:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a03a:	89 c7                	mov    edi,eax
  80a03c:	e8 cd f8 ff ff       	call   80990e <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  80a041:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a047:	83 e0 7f             	and    eax,0x7f
  80a04a:	89 c0                	mov    eax,eax
  80a04c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a053:	25 00 00 00 f0       	and    eax,0xf0000000
  80a058:	89 c6                	mov    esi,eax
  80a05a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  80a060:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a065:	89 c1                	mov    ecx,eax
  80a067:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a06d:	83 e0 7f             	and    eax,0x7f
  80a070:	89 c2                	mov    edx,eax
  80a072:	89 f0                	mov    eax,esi
  80a074:	09 c8                	or     eax,ecx
  80a076:	89 d2                	mov    edx,edx
  80a078:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80a07f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a086:	eb 61                	jmp    80a0e9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  80a088:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a08f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a093:	89 c1                	mov    ecx,eax
  80a095:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a09c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a0a0:	89 c2                	mov    edx,eax
  80a0a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a0a5:	48 98                	cdqe   
  80a0a7:	0f af c2             	imul   eax,edx
  80a0aa:	8d 14 01             	lea    edx,[rcx+rax*1]
  80a0ad:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a0b3:	c1 e8 07             	shr    eax,0x7
  80a0b6:	01 d0                	add    eax,edx
  80a0b8:	89 c2                	mov    edx,eax
  80a0ba:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a0c1:	49 89 c0             	mov    r8,rax
  80a0c4:	b9 01 00 00 00       	mov    ecx,0x1
  80a0c9:	be 01 00 00 00       	mov    esi,0x1
  80a0ce:	bf 00 00 00 00       	mov    edi,0x0
  80a0d3:	e8 82 f1 ff ff       	call   80925a <request>
  80a0d8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80a0db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0de:	89 c7                	mov    edi,eax
  80a0e0:	e8 29 f8 ff ff       	call   80990e <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  80a0e5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a0e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a0ec:	48 63 d0             	movsxd rdx,eax
  80a0ef:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a0f6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a0fa:	48 39 c2             	cmp    rdx,rax
  80a0fd:	72 89                	jb     80a088 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80a0ff:	b8 01 00 00 00       	mov    eax,0x1
}
  80a104:	c9                   	leave  
  80a105:	c3                   	ret    

000000000080a106 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  80a106:	f3 0f 1e fa          	endbr64 
  80a10a:	55                   	push   rbp
  80a10b:	48 89 e5             	mov    rbp,rsp
  80a10e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a112:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a116:	b8 01 00 00 00       	mov    eax,0x1
}
  80a11b:	5d                   	pop    rbp
  80a11c:	c3                   	ret    

000000000080a11d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80a11d:	f3 0f 1e fa          	endbr64 
  80a121:	55                   	push   rbp
  80a122:	48 89 e5             	mov    rbp,rsp
  80a125:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a129:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a12d:	b8 01 00 00 00       	mov    eax,0x1
}
  80a132:	5d                   	pop    rbp
  80a133:	c3                   	ret    

000000000080a134 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a134:	f3 0f 1e fa          	endbr64 
  80a138:	55                   	push   rbp
  80a139:	48 89 e5             	mov    rbp,rsp
  80a13c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80a140:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80a144:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80a148:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80a14c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a150:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a154:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a158:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a15c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a160:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a164:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a168:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a16c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a170:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a174:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a178:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80a17c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a180:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a183:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  80a187:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a18e:	00 
	int i,length = 0;
  80a18f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  80a196:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a19d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a19e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a1a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a1a5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a1a9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a1ad:	48 99                	cqo    
  80a1af:	48 f7 fe             	idiv   rsi
  80a1b2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a1b5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a1b9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a1bc:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a1c0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a1c4:	48 99                	cqo    
  80a1c6:	48 f7 f9             	idiv   rcx
  80a1c9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a1cd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a1d1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a1d5:	be 00 00 00 00       	mov    esi,0x0
  80a1da:	48 89 c7             	mov    rdi,rax
  80a1dd:	b8 00 00 00 00       	mov    eax,0x0
  80a1e2:	e8 50 70 ff ff       	call   801237 <vmalloc>
  80a1e7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80a1eb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a1f0:	75 0c                	jne    80a1fe <FAT32_read+0xca>
		return -EFAULT;
  80a1f2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80a1f9:	e9 f0 01 00 00       	jmp    80a3ee <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80a1fe:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a205:	eb 1e                	jmp    80a225 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a207:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a20b:	89 c2                	mov    edx,eax
  80a20d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a211:	89 d6                	mov    esi,edx
  80a213:	48 89 c7             	mov    rdi,rax
  80a216:	e8 ea fc ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80a21b:	89 c0                	mov    eax,eax
  80a21d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  80a221:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a225:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a228:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a22b:	7c da                	jl     80a207 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80a22d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a231:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a234:	48 89 c2             	mov    rdx,rax
  80a237:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a23b:	48 01 c2             	add    rdx,rax
  80a23e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a242:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a246:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a24a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a24d:	48 39 c2             	cmp    rdx,rax
  80a250:	76 2c                	jbe    80a27e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  80a252:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a256:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a25a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a25e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a261:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a265:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a268:	48 89 c1             	mov    rcx,rax
  80a26b:	48 89 d0             	mov    rax,rdx
  80a26e:	48 29 c8             	sub    rax,rcx
  80a271:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80a275:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a279:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80a27c:	eb 07                	jmp    80a285 <FAT32_read+0x151>
	else
		index = count;
  80a27e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a282:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  80a285:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a289:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a28d:	89 c2                	mov    edx,eax
  80a28f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a293:	be 00 00 00 00       	mov    esi,0x0
  80a298:	48 89 c7             	mov    rdi,rax
  80a29b:	e8 1f 27 00 00       	call   80c9bf <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a2a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2a4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a2a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2ac:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a2b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2b4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a2b8:	48 0f af c2          	imul   rax,rdx
  80a2bc:	48 01 c8             	add    rax,rcx
  80a2bf:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a2c3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2c7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a2cb:	89 c1                	mov    ecx,eax
  80a2cd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a2d1:	89 c2                	mov    edx,eax
  80a2d3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a2d7:	49 89 c0             	mov    r8,rax
  80a2da:	be 00 00 00 00       	mov    esi,0x0
  80a2df:	bf 00 00 00 00       	mov    edi,0x0
  80a2e4:	e8 71 ef ff ff       	call   80925a <request>
  80a2e9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80a2ec:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a2ef:	89 c7                	mov    edi,eax
  80a2f1:	e8 18 f6 ff ff       	call   80990e <chk_result>
  80a2f6:	85 c0                	test   eax,eax
  80a2f8:	75 1c                	jne    80a316 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80a2fa:	bf 28 55 81 00       	mov    edi,0x815528
  80a2ff:	b8 00 00 00 00       	mov    eax,0x0
  80a304:	e8 58 6a ff ff       	call   800d61 <printf>
			retval = -EIO;
  80a309:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  80a310:	ff 
			break;
  80a311:	e9 ba 00 00 00       	jmp    80a3d0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80a316:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a319:	48 63 d0             	movsxd rdx,eax
  80a31c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a320:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a324:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  80a328:	48 39 c2             	cmp    rdx,rax
  80a32b:	48 0f 4e c2          	cmovle rax,rdx
  80a32f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  80a332:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a336:	48 83 f8 1f          	cmp    rax,0x1f
  80a33a:	77 1f                	ja     80a35b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80a33c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a33f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a343:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a347:	48 01 c1             	add    rcx,rax
  80a34a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a34e:	48 89 c6             	mov    rsi,rax
  80a351:	48 89 cf             	mov    rdi,rcx
  80a354:	e8 b7 25 00 00       	call   80c910 <memcpy>
  80a359:	eb 1d                	jmp    80a378 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80a35b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a35e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a362:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a366:	48 01 c1             	add    rcx,rax
  80a369:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a36d:	48 89 c6             	mov    rsi,rax
  80a370:	48 89 cf             	mov    rdi,rcx
  80a373:	e8 98 25 00 00       	call   80c910 <memcpy>

		index -= length;
  80a378:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a37b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80a37e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a381:	48 98                	cdqe   
  80a383:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  80a387:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a38e:	00 
		*position += length;
  80a38f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a393:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a396:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a399:	48 98                	cdqe   
  80a39b:	48 01 c2             	add    rdx,rax
  80a39e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a3a2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  80a3a5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a3a9:	74 25                	je     80a3d0 <FAT32_read+0x29c>
  80a3ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3af:	89 c2                	mov    edx,eax
  80a3b1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a3b5:	89 d6                	mov    esi,edx
  80a3b7:	48 89 c7             	mov    rdi,rax
  80a3ba:	e8 46 fb ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80a3bf:	89 c0                	mov    eax,eax
  80a3c1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a3c5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a3ca:	0f 85 b5 fe ff ff    	jne    80a285 <FAT32_read+0x151>

	vmfree(buffer);
  80a3d0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a3d4:	48 89 c7             	mov    rdi,rax
  80a3d7:	e8 ea 6e ff ff       	call   8012c6 <vmfree>
	if(!index)
  80a3dc:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a3e0:	75 08                	jne    80a3ea <FAT32_read+0x2b6>
		retval = count;
  80a3e2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a3e6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80a3ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80a3ee:	c9                   	leave  
  80a3ef:	c3                   	ret    

000000000080a3f0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  80a3f0:	f3 0f 1e fa          	endbr64 
  80a3f4:	55                   	push   rbp
  80a3f5:	48 89 e5             	mov    rbp,rsp
  80a3f8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80a3ff:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  80a406:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a40d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a411:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  80a415:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a41c:	e9 8b 00 00 00       	jmp    80a4ac <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  80a421:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a428:	ba 00 02 00 00       	mov    edx,0x200
  80a42d:	be 00 00 00 00       	mov    esi,0x0
  80a432:	48 89 c7             	mov    rdi,rax
  80a435:	e8 85 25 00 00       	call   80c9bf <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80a43a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a441:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a445:	89 c2                	mov    edx,eax
  80a447:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a44a:	01 d0                	add    eax,edx
  80a44c:	89 c2                	mov    edx,eax
  80a44e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a455:	49 89 c0             	mov    r8,rax
  80a458:	b9 01 00 00 00       	mov    ecx,0x1
  80a45d:	be 00 00 00 00       	mov    esi,0x0
  80a462:	bf 00 00 00 00       	mov    edi,0x0
  80a467:	e8 ee ed ff ff       	call   80925a <request>
  80a46c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80a46f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a476:	eb 2a                	jmp    80a4a2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  80a478:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a47b:	48 98                	cdqe   
  80a47d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  80a484:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a489:	85 c0                	test   eax,eax
  80a48b:	75 11                	jne    80a49e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80a48d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a490:	c1 e0 07             	shl    eax,0x7
  80a493:	89 c2                	mov    edx,eax
  80a495:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a498:	01 d0                	add    eax,edx
  80a49a:	48 98                	cdqe   
  80a49c:	eb 22                	jmp    80a4c0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  80a49e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80a4a2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  80a4a6:	7e d0                	jle    80a478 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  80a4a8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a4ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a4af:	48 98                	cdqe   
  80a4b1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80a4b5:	0f 87 66 ff ff ff    	ja     80a421 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  80a4bb:	b8 00 00 00 00       	mov    eax,0x0
}
  80a4c0:	c9                   	leave  
  80a4c1:	c3                   	ret    

000000000080a4c2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a4c2:	f3 0f 1e fa          	endbr64 
  80a4c6:	55                   	push   rbp
  80a4c7:	48 89 e5             	mov    rbp,rsp
  80a4ca:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  80a4d1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  80a4d5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  80a4d9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  80a4e0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a4e7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a4eb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a4ef:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a4f3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a4f7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a4fb:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a4ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a503:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a507:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a50b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a50f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  80a513:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a517:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a51a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80a51e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80a525:	00 
	unsigned long sector = 0;
  80a526:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a52d:	00 
	int i,length = 0;
  80a52e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  80a535:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a53c:	00 
	long flags = 0;
  80a53d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a544:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a545:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a54c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a54f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a553:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a557:	48 99                	cqo    
  80a559:	48 f7 fe             	idiv   rsi
  80a55c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a55f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a566:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a569:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a56d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a571:	48 99                	cqo    
  80a573:	48 f7 f9             	idiv   rcx
  80a576:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a57a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a57e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a582:	be 00 00 00 00       	mov    esi,0x0
  80a587:	48 89 c7             	mov    rdi,rax
  80a58a:	b8 00 00 00 00       	mov    eax,0x0
  80a58f:	e8 a3 6c ff ff       	call   801237 <vmalloc>
  80a594:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  80a598:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a59d:	75 1a                	jne    80a5b9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80a59f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a5a3:	48 89 c7             	mov    rdi,rax
  80a5a6:	e8 45 fe ff ff       	call   80a3f0 <FAT32_find_available_cluster>
  80a5ab:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80a5af:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80a5b6:	00 
  80a5b7:	eb 2f                	jmp    80a5e8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  80a5b9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80a5c0:	eb 1e                	jmp    80a5e0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a5c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5c6:	89 c2                	mov    edx,eax
  80a5c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a5cc:	89 d6                	mov    esi,edx
  80a5ce:	48 89 c7             	mov    rdi,rax
  80a5d1:	e8 2f f9 ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80a5d6:	89 c0                	mov    eax,eax
  80a5d8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80a5dc:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80a5e0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a5e3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  80a5e6:	7c da                	jl     80a5c2 <FAT32_write+0x100>

	if(!cluster)
  80a5e8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a5ed:	75 18                	jne    80a607 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80a5ef:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5f3:	48 89 c7             	mov    rdi,rax
  80a5f6:	e8 cb 6c ff ff       	call   8012c6 <vmfree>
		return -ENOSPC;
  80a5fb:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80a602:	e9 13 03 00 00       	jmp    80a91a <FAT32_write+0x458>
	}

	if(flags)
  80a607:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a60c:	74 4d                	je     80a65b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80a60e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a612:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a616:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80a619:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a61d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a621:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a625:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a629:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a62d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80a631:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a635:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a639:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a63d:	48 89 c7             	mov    rdi,rax
  80a640:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  80a642:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a646:	89 c1                	mov    ecx,eax
  80a648:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a64c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80a651:	89 ce                	mov    esi,ecx
  80a653:	48 89 c7             	mov    rdi,rax
  80a656:	e8 66 f9 ff ff       	call   809fc1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80a65b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80a662:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  80a665:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a66a:	0f 85 91 00 00 00    	jne    80a701 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  80a670:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a674:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a678:	89 c2                	mov    edx,eax
  80a67a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a67e:	be 00 00 00 00       	mov    esi,0x0
  80a683:	48 89 c7             	mov    rdi,rax
  80a686:	e8 34 23 00 00       	call   80c9bf <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a68b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a68f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a693:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a697:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a69b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a69f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6a3:	48 0f af c2          	imul   rax,rdx
  80a6a7:	48 01 c8             	add    rax,rcx
  80a6aa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a6ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6b2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6b6:	89 c1                	mov    ecx,eax
  80a6b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a6bc:	89 c2                	mov    edx,eax
  80a6be:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a6c2:	49 89 c0             	mov    r8,rax
  80a6c5:	be 00 00 00 00       	mov    esi,0x0
  80a6ca:	bf 00 00 00 00       	mov    edi,0x0
  80a6cf:	e8 86 eb ff ff       	call   80925a <request>
  80a6d4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  80a6d7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80a6da:	89 c7                	mov    edi,eax
  80a6dc:	e8 2d f2 ff ff       	call   80990e <chk_result>
  80a6e1:	85 c0                	test   eax,eax
  80a6e3:	75 1c                	jne    80a701 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  80a6e5:	bf 58 55 81 00       	mov    edi,0x815558
  80a6ea:	b8 00 00 00 00       	mov    eax,0x0
  80a6ef:	e8 6d 66 ff ff       	call   800d61 <printf>
				retval = -EIO;
  80a6f4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80a6fb:	ff 
				break;
  80a6fc:	e9 95 01 00 00       	jmp    80a896 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80a701:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a704:	48 63 d0             	movsxd rdx,eax
  80a707:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a70b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a70f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  80a713:	48 39 c2             	cmp    rdx,rax
  80a716:	48 0f 4e c2          	cmovle rax,rdx
  80a71a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80a71d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a721:	48 83 f8 1f          	cmp    rax,0x1f
  80a725:	77 1f                	ja     80a746 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  80a727:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80a72a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80a72e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a732:	48 01 c1             	add    rcx,rax
  80a735:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a739:	48 89 ce             	mov    rsi,rcx
  80a73c:	48 89 c7             	mov    rdi,rax
  80a73f:	e8 cc 21 00 00       	call   80c910 <memcpy>
  80a744:	eb 1d                	jmp    80a763 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  80a746:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80a749:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80a74d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a751:	48 01 c1             	add    rcx,rax
  80a754:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a758:	48 89 ce             	mov    rsi,rcx
  80a75b:	48 89 c7             	mov    rdi,rax
  80a75e:	e8 ad 21 00 00       	call   80c910 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a763:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a767:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a76b:	89 c1                	mov    ecx,eax
  80a76d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a771:	89 c2                	mov    edx,eax
  80a773:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a777:	49 89 c0             	mov    r8,rax
  80a77a:	be 01 00 00 00       	mov    esi,0x1
  80a77f:	bf 00 00 00 00       	mov    edi,0x0
  80a784:	e8 d1 ea ff ff       	call   80925a <request>
  80a789:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80a78c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80a78f:	89 c7                	mov    edi,eax
  80a791:	e8 78 f1 ff ff       	call   80990e <chk_result>
  80a796:	85 c0                	test   eax,eax
  80a798:	75 1c                	jne    80a7b6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80a79a:	bf 88 55 81 00       	mov    edi,0x815588
  80a79f:	b8 00 00 00 00       	mov    eax,0x0
  80a7a4:	e8 b8 65 ff ff       	call   800d61 <printf>
			retval = -EIO;
  80a7a9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80a7b0:	ff 
			break;
  80a7b1:	e9 e0 00 00 00       	jmp    80a896 <FAT32_write+0x3d4>
		}

		index -= length;
  80a7b6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a7b9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80a7bc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a7bf:	48 98                	cdqe   
  80a7c1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  80a7c5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80a7cc:	00 
		*position += length;
  80a7cd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a7d4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a7d7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a7da:	48 98                	cdqe   
  80a7dc:	48 01 c2             	add    rdx,rax
  80a7df:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a7e6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  80a7e9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80a7ed:	0f 84 a2 00 00 00    	je     80a895 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a7f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7f7:	89 c2                	mov    edx,eax
  80a7f9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a7fd:	89 d6                	mov    esi,edx
  80a7ff:	48 89 c7             	mov    rdi,rax
  80a802:	e8 fe f6 ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80a807:	89 c0                	mov    eax,eax
  80a809:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80a80d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  80a814:	0f 
  80a815:	76 72                	jbe    80a889 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  80a817:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a81b:	48 89 c7             	mov    rdi,rax
  80a81e:	e8 cd fb ff ff       	call   80a3f0 <FAT32_find_available_cluster>
  80a823:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  80a827:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80a82c:	75 18                	jne    80a846 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80a82e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a832:	48 89 c7             	mov    rdi,rax
  80a835:	e8 8c 6a ff ff       	call   8012c6 <vmfree>
				return -ENOSPC;
  80a83a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80a841:	e9 d4 00 00 00       	jmp    80a91a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  80a846:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a84a:	89 c2                	mov    edx,eax
  80a84c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a850:	89 c1                	mov    ecx,eax
  80a852:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a856:	89 ce                	mov    esi,ecx
  80a858:	48 89 c7             	mov    rdi,rax
  80a85b:	e8 61 f7 ff ff       	call   809fc1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  80a860:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a864:	89 c1                	mov    ecx,eax
  80a866:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a86a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80a86f:	89 ce                	mov    esi,ecx
  80a871:	48 89 c7             	mov    rdi,rax
  80a874:	e8 48 f7 ff ff       	call   809fc1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  80a879:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a87d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  80a881:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80a888:	00 
		}

	}while(index);
  80a889:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80a88d:	0f 85 d2 fd ff ff    	jne    80a665 <FAT32_write+0x1a3>
  80a893:	eb 01                	jmp    80a896 <FAT32_write+0x3d4>
			break;
  80a895:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  80a896:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a89d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8a0:	48 89 c2             	mov    rdx,rax
  80a8a3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a8a7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a8ab:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a8af:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8b2:	48 39 c2             	cmp    rdx,rax
  80a8b5:	76 42                	jbe    80a8f9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  80a8b7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80a8be:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a8c1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a8c5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a8c9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a8cd:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80a8d0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a8d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a8d8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a8dc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a8e0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a8e4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80a8e8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a8ec:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a8f0:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a8f4:	48 89 c7             	mov    rdi,rax
  80a8f7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  80a8f9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a8fd:	48 89 c7             	mov    rdi,rax
  80a900:	e8 c1 69 ff ff       	call   8012c6 <vmfree>
	if(!index)
  80a905:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80a909:	75 0b                	jne    80a916 <FAT32_write+0x454>
		retval = count;
  80a90b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80a912:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  80a916:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80a91a:	c9                   	leave  
  80a91b:	c3                   	ret    

000000000080a91c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80a91c:	f3 0f 1e fa          	endbr64 
  80a920:	55                   	push   rbp
  80a921:	48 89 e5             	mov    rbp,rsp
  80a924:	48 83 ec 30          	sub    rsp,0x30
  80a928:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a92c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a930:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  80a934:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a938:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a93c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a940:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  80a944:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a94b:	00 

	switch(origin)
  80a94c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80a951:	74 21                	je     80a974 <FAT32_lseek+0x58>
  80a953:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80a958:	7f 4a                	jg     80a9a4 <FAT32_lseek+0x88>
  80a95a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a95f:	74 09                	je     80a96a <FAT32_lseek+0x4e>
  80a961:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  80a966:	74 20                	je     80a988 <FAT32_lseek+0x6c>
  80a968:	eb 3a                	jmp    80a9a4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80a96a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a96e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80a972:	eb 39                	jmp    80a9ad <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  80a974:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a978:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a97b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a97f:	48 01 d0             	add    rax,rdx
  80a982:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80a986:	eb 25                	jmp    80a9ad <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  80a988:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a98c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a990:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a994:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a997:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a99b:	48 01 d0             	add    rax,rdx
  80a99e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80a9a2:	eb 09                	jmp    80a9ad <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  80a9a4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80a9ab:	eb 50                	jmp    80a9fd <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80a9ad:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a9b2:	78 18                	js     80a9cc <FAT32_lseek+0xb0>
  80a9b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9bc:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a9c0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a9c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9c7:	48 39 c2             	cmp    rdx,rax
  80a9ca:	73 09                	jae    80a9d5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80a9cc:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  80a9d3:	eb 28                	jmp    80a9fd <FAT32_lseek+0xe1>

	filp->position = pos;
  80a9d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9d9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a9dd:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  80a9e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9e7:	48 89 c6             	mov    rsi,rax
  80a9ea:	bf b8 55 81 00       	mov    edi,0x8155b8
  80a9ef:	b8 00 00 00 00       	mov    eax,0x0
  80a9f4:	e8 68 63 ff ff       	call   800d61 <printf>

	return pos;
  80a9f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80a9fd:	c9                   	leave  
  80a9fe:	c3                   	ret    

000000000080a9ff <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80a9ff:	f3 0f 1e fa          	endbr64 
  80aa03:	55                   	push   rbp
  80aa04:	48 89 e5             	mov    rbp,rsp
  80aa07:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa0b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa0f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80aa13:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80aa17:	90                   	nop
  80aa18:	5d                   	pop    rbp
  80aa19:	c3                   	ret    

000000000080aa1a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80aa1a:	f3 0f 1e fa          	endbr64 
  80aa1e:	55                   	push   rbp
  80aa1f:	48 89 e5             	mov    rbp,rsp
  80aa22:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80aa26:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80aa2a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80aa2e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80aa32:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80aa36:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa3a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aa3e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa42:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80aa46:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80aa4a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa4e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aa52:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aa56:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa5a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80aa5e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80aa65:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80aa6c:	00 
	unsigned char * buf =NULL; 
  80aa6d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  80aa74:	00 
	char *name = NULL;
  80aa75:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aa7c:	00 
	int namelen = 0;
  80aa7d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  80aa84:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80aa8b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  80aa92:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80aa99:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80aaa0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80aaa7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80aaa8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80aaaf:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80aab0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aab4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aab8:	be 00 00 00 00       	mov    esi,0x0
  80aabd:	48 89 c7             	mov    rdi,rax
  80aac0:	b8 00 00 00 00       	mov    eax,0x0
  80aac5:	e8 6d 67 ff ff       	call   801237 <vmalloc>
  80aaca:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80aace:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aad2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aad5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  80aad8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80aadc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aadf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80aae3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80aae7:	48 99                	cqo    
  80aae9:	48 f7 fe             	idiv   rsi
  80aaec:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80aaef:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80aaf6:	eb 3a                	jmp    80ab32 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80aaf8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80aafb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aaff:	89 d6                	mov    esi,edx
  80ab01:	48 89 c7             	mov    rdi,rax
  80ab04:	e8 fc f3 ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80ab09:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80ab0c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  80ab13:	76 19                	jbe    80ab2e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  80ab15:	bf e0 55 81 00       	mov    edi,0x8155e0
  80ab1a:	b8 00 00 00 00       	mov    eax,0x0
  80ab1f:	e8 3d 62 ff ff       	call   800d61 <printf>
			return NULL;
  80ab24:	b8 00 00 00 00       	mov    eax,0x0
  80ab29:	e9 86 05 00 00       	jmp    80b0b4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80ab2e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80ab32:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ab35:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80ab38:	7c be                	jl     80aaf8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80ab3a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80ab3b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab3f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80ab43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ab46:	83 e8 02             	sub    eax,0x2
  80ab49:	89 c1                	mov    ecx,eax
  80ab4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab4f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab53:	48 0f af c1          	imul   rax,rcx
  80ab57:	48 01 d0             	add    rax,rdx
  80ab5a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80ab5e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab62:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab66:	89 c1                	mov    ecx,eax
  80ab68:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ab6c:	89 c2                	mov    edx,eax
  80ab6e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80ab72:	49 89 c0             	mov    r8,rax
  80ab75:	be 00 00 00 00       	mov    esi,0x0
  80ab7a:	bf 00 00 00 00       	mov    edi,0x0
  80ab7f:	e8 d6 e6 ff ff       	call   80925a <request>
  80ab84:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  80ab87:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80ab8a:	89 c7                	mov    edi,eax
  80ab8c:	e8 7d ed ff ff       	call   80990e <chk_result>
  80ab91:	85 c0                	test   eax,eax
  80ab93:	75 25                	jne    80abba <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  80ab95:	bf 08 56 81 00       	mov    edi,0x815608
  80ab9a:	b8 00 00 00 00       	mov    eax,0x0
  80ab9f:	e8 bd 61 ff ff       	call   800d61 <printf>
		vmfree(buf);
  80aba4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80aba8:	48 89 c7             	mov    rdi,rax
  80abab:	e8 16 67 ff ff       	call   8012c6 <vmfree>
		return NULL;
  80abb0:	b8 00 00 00 00       	mov    eax,0x0
  80abb5:	e9 fa 04 00 00       	jmp    80b0b4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80abba:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80abbe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80abc1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80abc5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80abc9:	48 99                	cqo    
  80abcb:	48 f7 f9             	idiv   rcx
  80abce:	48 89 d0             	mov    rax,rdx
  80abd1:	48 89 c2             	mov    rdx,rax
  80abd4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80abd8:	48 01 d0             	add    rax,rdx
  80abdb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80abdf:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80abe3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80abe6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80abea:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80abee:	48 99                	cqo    
  80abf0:	48 f7 f9             	idiv   rcx
  80abf3:	48 89 d0             	mov    rax,rdx
  80abf6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  80abf9:	e9 2f 04 00 00       	jmp    80b02d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80abfe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ac02:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80ac06:	3c 0f                	cmp    al,0xf
  80ac08:	0f 84 00 04 00 00    	je     80b00e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80ac0e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ac12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac15:	3c e5                	cmp    al,0xe5
  80ac17:	0f 84 f4 03 00 00    	je     80b011 <FAT32_readdir+0x5f7>
  80ac1d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ac21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac24:	84 c0                	test   al,al
  80ac26:	0f 84 e5 03 00 00    	je     80b011 <FAT32_readdir+0x5f7>
  80ac2c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ac30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac33:	3c 05                	cmp    al,0x5
  80ac35:	0f 84 d6 03 00 00    	je     80b011 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80ac3b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80ac42:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ac46:	48 83 e8 20          	sub    rax,0x20
  80ac4a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80ac4e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac52:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80ac56:	3c 0f                	cmp    al,0xf
  80ac58:	0f 85 2a 02 00 00    	jne    80ae88 <FAT32_readdir+0x46e>
  80ac5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac62:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac65:	3c e5                	cmp    al,0xe5
  80ac67:	0f 84 1b 02 00 00    	je     80ae88 <FAT32_readdir+0x46e>
  80ac6d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac74:	84 c0                	test   al,al
  80ac76:	0f 84 0c 02 00 00    	je     80ae88 <FAT32_readdir+0x46e>
  80ac7c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac83:	3c 05                	cmp    al,0x5
  80ac85:	0f 84 fd 01 00 00    	je     80ae88 <FAT32_readdir+0x46e>
		{
			j = 0;
  80ac8b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80ac92:	eb 1a                	jmp    80acae <FAT32_readdir+0x294>
			{
				j++;
  80ac94:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  80ac98:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac9f:	0f b6 c0             	movzx  eax,al
  80aca2:	83 e0 40             	and    eax,0x40
  80aca5:	85 c0                	test   eax,eax
  80aca7:	75 34                	jne    80acdd <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  80aca9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80acae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80acb2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80acb6:	3c 0f                	cmp    al,0xf
  80acb8:	75 24                	jne    80acde <FAT32_readdir+0x2c4>
  80acba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80acbe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acc1:	3c e5                	cmp    al,0xe5
  80acc3:	74 19                	je     80acde <FAT32_readdir+0x2c4>
  80acc5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80acc9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80accc:	84 c0                	test   al,al
  80acce:	74 0e                	je     80acde <FAT32_readdir+0x2c4>
  80acd0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80acd4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acd7:	3c 05                	cmp    al,0x5
  80acd9:	75 b9                	jne    80ac94 <FAT32_readdir+0x27a>
  80acdb:	eb 01                	jmp    80acde <FAT32_readdir+0x2c4>
					break;
  80acdd:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80acde:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80ace1:	89 d0                	mov    eax,edx
  80ace3:	01 c0                	add    eax,eax
  80ace5:	01 d0                	add    eax,edx
  80ace7:	c1 e0 02             	shl    eax,0x2
  80acea:	01 d0                	add    eax,edx
  80acec:	83 c0 01             	add    eax,0x1
  80acef:	be 00 00 00 00       	mov    esi,0x0
  80acf4:	89 c7                	mov    edi,eax
  80acf6:	b8 00 00 00 00       	mov    eax,0x0
  80acfb:	e8 37 65 ff ff       	call   801237 <vmalloc>
  80ad00:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  80ad04:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80ad07:	89 d0                	mov    eax,edx
  80ad09:	01 c0                	add    eax,eax
  80ad0b:	01 d0                	add    eax,edx
  80ad0d:	c1 e0 02             	shl    eax,0x2
  80ad10:	01 d0                	add    eax,edx
  80ad12:	83 c0 01             	add    eax,0x1
  80ad15:	89 c2                	mov    edx,eax
  80ad17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ad1b:	be 00 00 00 00       	mov    esi,0x0
  80ad20:	48 89 c7             	mov    rdi,rax
  80ad23:	e8 97 1c 00 00       	call   80c9bf <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80ad28:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ad2c:	48 83 e8 20          	sub    rax,0x20
  80ad30:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  80ad34:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80ad3b:	e9 37 01 00 00       	jmp    80ae77 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  80ad40:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80ad47:	eb 53                	jmp    80ad9c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80ad49:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ad4d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ad50:	48 63 d2             	movsxd rdx,edx
  80ad53:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80ad58:	66 83 f8 ff          	cmp    ax,0xffff
  80ad5c:	74 3a                	je     80ad98 <FAT32_readdir+0x37e>
  80ad5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ad62:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ad65:	48 63 d2             	movsxd rdx,edx
  80ad68:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80ad6d:	66 85 c0             	test   ax,ax
  80ad70:	74 26                	je     80ad98 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  80ad72:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ad76:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ad79:	48 63 d2             	movsxd rdx,edx
  80ad7c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80ad81:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ad84:	8d 50 01             	lea    edx,[rax+0x1]
  80ad87:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80ad8a:	48 63 d0             	movsxd rdx,eax
  80ad8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ad91:	48 01 d0             	add    rax,rdx
  80ad94:	89 ca                	mov    edx,ecx
  80ad96:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  80ad98:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80ad9c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  80ada0:	7e a7                	jle    80ad49 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  80ada2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80ada9:	eb 53                	jmp    80adfe <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80adab:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80adaf:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80adb2:	48 63 d2             	movsxd rdx,edx
  80adb5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80adba:	66 83 f8 ff          	cmp    ax,0xffff
  80adbe:	74 3a                	je     80adfa <FAT32_readdir+0x3e0>
  80adc0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80adc4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80adc7:	48 63 d2             	movsxd rdx,edx
  80adca:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80adcf:	66 85 c0             	test   ax,ax
  80add2:	74 26                	je     80adfa <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  80add4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80add8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80addb:	48 63 d2             	movsxd rdx,edx
  80adde:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80ade3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ade6:	8d 50 01             	lea    edx,[rax+0x1]
  80ade9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80adec:	48 63 d0             	movsxd rdx,eax
  80adef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80adf3:	48 01 d0             	add    rax,rdx
  80adf6:	89 ca                	mov    edx,ecx
  80adf8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80adfa:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80adfe:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  80ae02:	7e a7                	jle    80adab <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  80ae04:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80ae0b:	eb 5b                	jmp    80ae68 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80ae0d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ae11:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ae14:	48 63 d2             	movsxd rdx,edx
  80ae17:	48 83 c2 08          	add    rdx,0x8
  80ae1b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80ae20:	66 83 f8 ff          	cmp    ax,0xffff
  80ae24:	74 3e                	je     80ae64 <FAT32_readdir+0x44a>
  80ae26:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ae2a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ae2d:	48 63 d2             	movsxd rdx,edx
  80ae30:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80ae35:	66 85 c0             	test   ax,ax
  80ae38:	74 2a                	je     80ae64 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80ae3a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ae3e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80ae41:	48 63 d2             	movsxd rdx,edx
  80ae44:	48 83 c2 08          	add    rdx,0x8
  80ae48:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80ae4d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ae50:	8d 50 01             	lea    edx,[rax+0x1]
  80ae53:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80ae56:	48 63 d0             	movsxd rdx,eax
  80ae59:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ae5d:	48 01 d0             	add    rax,rdx
  80ae60:	89 ca                	mov    edx,ecx
  80ae62:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  80ae64:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80ae68:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80ae6c:	7e 9f                	jle    80ae0d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80ae6e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80ae72:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  80ae77:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80ae7a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80ae7d:	0f 8c bd fe ff ff    	jl     80ad40 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  80ae83:	e9 f5 01 00 00       	jmp    80b07d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  80ae88:	be 00 00 00 00       	mov    esi,0x0
  80ae8d:	bf 0f 00 00 00       	mov    edi,0xf
  80ae92:	b8 00 00 00 00       	mov    eax,0x0
  80ae97:	e8 9b 63 ff ff       	call   801237 <vmalloc>
  80ae9c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  80aea0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aea4:	ba 0f 00 00 00       	mov    edx,0xf
  80aea9:	be 00 00 00 00       	mov    esi,0x0
  80aeae:	48 89 c7             	mov    rdi,rax
  80aeb1:	e8 09 1b 00 00       	call   80c9bf <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  80aeb6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80aebd:	eb 74                	jmp    80af33 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80aebf:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80aec3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80aec6:	48 98                	cdqe   
  80aec8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80aecc:	3c 20                	cmp    al,0x20
  80aece:	74 6b                	je     80af3b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80aed0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80aed4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80aed8:	0f b6 c0             	movzx  eax,al
  80aedb:	83 e0 08             	and    eax,0x8
  80aede:	85 c0                	test   eax,eax
  80aee0:	74 29                	je     80af0b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80aee2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80aee6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80aee9:	48 98                	cdqe   
  80aeeb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80aeef:	8d 48 20             	lea    ecx,[rax+0x20]
  80aef2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80aef5:	8d 50 01             	lea    edx,[rax+0x1]
  80aef8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80aefb:	48 63 d0             	movsxd rdx,eax
  80aefe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af02:	48 01 d0             	add    rax,rdx
  80af05:	89 ca                	mov    edx,ecx
  80af07:	88 10                	mov    BYTE PTR [rax],dl
  80af09:	eb 24                	jmp    80af2f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80af0b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80af0f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80af12:	48 98                	cdqe   
  80af14:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80af18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80af1b:	8d 50 01             	lea    edx,[rax+0x1]
  80af1e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80af21:	48 63 d0             	movsxd rdx,eax
  80af24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af28:	48 01 d0             	add    rax,rdx
  80af2b:	89 ca                	mov    edx,ecx
  80af2d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80af2f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80af33:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  80af37:	7e 86                	jle    80aebf <FAT32_readdir+0x4a5>
  80af39:	eb 01                	jmp    80af3c <FAT32_readdir+0x522>
				break;
  80af3b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80af3c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80af40:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80af44:	0f b6 c0             	movzx  eax,al
  80af47:	83 e0 10             	and    eax,0x10
  80af4a:	85 c0                	test   eax,eax
  80af4c:	0f 85 27 01 00 00    	jne    80b079 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  80af52:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80af55:	8d 50 01             	lea    edx,[rax+0x1]
  80af58:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80af5b:	48 63 d0             	movsxd rdx,eax
  80af5e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af62:	48 01 d0             	add    rax,rdx
  80af65:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  80af68:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80af6f:	eb 74                	jmp    80afe5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80af71:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80af75:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80af78:	48 98                	cdqe   
  80af7a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80af7e:	3c 20                	cmp    al,0x20
  80af80:	74 6b                	je     80afed <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80af82:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80af86:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80af8a:	0f b6 c0             	movzx  eax,al
  80af8d:	83 e0 10             	and    eax,0x10
  80af90:	85 c0                	test   eax,eax
  80af92:	74 29                	je     80afbd <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80af94:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80af98:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80af9b:	48 98                	cdqe   
  80af9d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80afa1:	8d 48 20             	lea    ecx,[rax+0x20]
  80afa4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80afa7:	8d 50 01             	lea    edx,[rax+0x1]
  80afaa:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80afad:	48 63 d0             	movsxd rdx,eax
  80afb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afb4:	48 01 d0             	add    rax,rdx
  80afb7:	89 ca                	mov    edx,ecx
  80afb9:	88 10                	mov    BYTE PTR [rax],dl
  80afbb:	eb 24                	jmp    80afe1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80afbd:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80afc1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80afc4:	48 98                	cdqe   
  80afc6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80afca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80afcd:	8d 50 01             	lea    edx,[rax+0x1]
  80afd0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80afd3:	48 63 d0             	movsxd rdx,eax
  80afd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afda:	48 01 d0             	add    rax,rdx
  80afdd:	89 ca                	mov    edx,ecx
  80afdf:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80afe1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80afe5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80afe9:	7e 86                	jle    80af71 <FAT32_readdir+0x557>
  80afeb:	eb 01                	jmp    80afee <FAT32_readdir+0x5d4>
				break;
  80afed:	90                   	nop
		}
		if(x == 8)
  80afee:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80aff2:	0f 85 84 00 00 00    	jne    80b07c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80aff8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80affc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80afff:	48 63 d0             	movsxd rdx,eax
  80b002:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b006:	48 01 d0             	add    rax,rdx
  80b009:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80b00c:	eb 6e                	jmp    80b07c <FAT32_readdir+0x662>
			continue;
  80b00e:	90                   	nop
  80b00f:	eb 01                	jmp    80b012 <FAT32_readdir+0x5f8>
			continue;
  80b011:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b012:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80b016:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80b01b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b01f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b022:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b026:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b02a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80b02d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b030:	48 63 d0             	movsxd rdx,eax
  80b033:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b037:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b03b:	48 39 c2             	cmp    rdx,rax
  80b03e:	0f 8c ba fb ff ff    	jl     80abfe <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b044:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b047:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b04b:	89 d6                	mov    esi,edx
  80b04d:	48 89 c7             	mov    rdi,rax
  80b050:	e8 b0 ee ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80b055:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80b058:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80b05f:	77 05                	ja     80b066 <FAT32_readdir+0x64c>
		goto next_cluster;
  80b061:	e9 d5 fa ff ff       	jmp    80ab3b <FAT32_readdir+0x121>

	vmfree(buf);
  80b066:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b06a:	48 89 c7             	mov    rdi,rax
  80b06d:	e8 54 62 ff ff       	call   8012c6 <vmfree>
	return NULL;
  80b072:	b8 00 00 00 00       	mov    eax,0x0
  80b077:	eb 3b                	jmp    80b0b4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80b079:	90                   	nop
  80b07a:	eb 01                	jmp    80b07d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80b07c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80b07d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b081:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b084:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b088:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b08c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80b08f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b092:	48 63 d0             	movsxd rdx,eax
  80b095:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80b099:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80b09d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80b0a1:	41 b8 00 00 00 00    	mov    r8d,0x0
  80b0a7:	b9 00 00 00 00       	mov    ecx,0x0
  80b0ac:	48 89 c7             	mov    rdi,rax
  80b0af:	41 ff d1             	call   r9
  80b0b2:	48 98                	cdqe   
}
  80b0b4:	c9                   	leave  
  80b0b5:	c3                   	ret    

000000000080b0b6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80b0b6:	f3 0f 1e fa          	endbr64 
  80b0ba:	55                   	push   rbp
  80b0bb:	48 89 e5             	mov    rbp,rsp
  80b0be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b0c2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b0c6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b0c9:	90                   	nop
  80b0ca:	5d                   	pop    rbp
  80b0cb:	c3                   	ret    

000000000080b0cc <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80b0cc:	f3 0f 1e fa          	endbr64 
  80b0d0:	55                   	push   rbp
  80b0d1:	48 89 e5             	mov    rbp,rsp
  80b0d4:	48 83 ec 60          	sub    rsp,0x60
  80b0d8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80b0dc:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80b0e0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b0e4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0e8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80b0ec:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b0f0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b0f4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b0f8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80b0fc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80b103:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80b10a:	00 
	unsigned char * buf =NULL; 
  80b10b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80b112:	00 
	int i = 0,j = 0,x = 0;
  80b113:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b11a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b121:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80b128:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80b12f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80b130:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80b137:	00 
	struct index_node * p = NULL;
  80b138:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80b13f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b140:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b144:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b148:	be 00 00 00 00       	mov    esi,0x0
  80b14d:	48 89 c7             	mov    rdi,rax
  80b150:	b8 00 00 00 00       	mov    eax,0x0
  80b155:	e8 dd 60 ff ff       	call   801237 <vmalloc>
  80b15a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80b15e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b162:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b165:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b168:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b16c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b170:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b173:	83 e8 02             	sub    eax,0x2
  80b176:	89 c1                	mov    ecx,eax
  80b178:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b17c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b180:	48 0f af c1          	imul   rax,rcx
  80b184:	48 01 d0             	add    rax,rdx
  80b187:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:0x%x,sector:0x%x\r\n",cluster,sector);
  80b18b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b18f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b192:	89 c6                	mov    esi,eax
  80b194:	bf 38 56 81 00       	mov    edi,0x815638
  80b199:	b8 00 00 00 00       	mov    eax,0x0
  80b19e:	e8 be 5b ff ff       	call   800d61 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b1a3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b1a7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b1ab:	89 c1                	mov    ecx,eax
  80b1ad:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1b1:	89 c2                	mov    edx,eax
  80b1b3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b1b7:	49 89 c0             	mov    r8,rax
  80b1ba:	be 00 00 00 00       	mov    esi,0x0
  80b1bf:	bf 00 00 00 00       	mov    edi,0x0
  80b1c4:	e8 91 e0 ff ff       	call   80925a <request>
  80b1c9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80b1cc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80b1cf:	89 c7                	mov    edi,eax
  80b1d1:	e8 38 e7 ff ff       	call   80990e <chk_result>
  80b1d6:	85 c0                	test   eax,eax
  80b1d8:	75 25                	jne    80b1ff <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80b1da:	bf 60 56 81 00       	mov    edi,0x815660
  80b1df:	b8 00 00 00 00       	mov    eax,0x0
  80b1e4:	e8 78 5b ff ff       	call   800d61 <printf>
		vmfree(buf);
  80b1e9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b1ed:	48 89 c7             	mov    rdi,rax
  80b1f0:	e8 d1 60 ff ff       	call   8012c6 <vmfree>
		return NULL;
  80b1f5:	b8 00 00 00 00       	mov    eax,0x0
  80b1fa:	e9 f0 07 00 00       	jmp    80b9ef <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80b1ff:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b203:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80b207:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b20e:	e9 9d 05 00 00       	jmp    80b7b0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b213:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b217:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b21b:	3c 0f                	cmp    al,0xf
  80b21d:	0f 84 59 05 00 00    	je     80b77c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b223:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b227:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b22a:	3c e5                	cmp    al,0xe5
  80b22c:	0f 84 4d 05 00 00    	je     80b77f <FAT32_lookup+0x6b3>
  80b232:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b236:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b239:	84 c0                	test   al,al
  80b23b:	0f 84 3e 05 00 00    	je     80b77f <FAT32_lookup+0x6b3>
  80b241:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b245:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b248:	3c 05                	cmp    al,0x5
  80b24a:	0f 84 2f 05 00 00    	je     80b77f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b250:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b254:	48 83 e8 20          	sub    rax,0x20
  80b258:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80b25c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b263:	e9 88 01 00 00       	jmp    80b3f0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80b268:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b26f:	eb 6a                	jmp    80b2db <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80b271:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b275:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b278:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b27b:	7e 15                	jle    80b292 <FAT32_lookup+0x1c6>
  80b27d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b281:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b284:	48 63 d2             	movsxd rdx,edx
  80b287:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b28c:	66 83 f8 ff          	cmp    ax,0xffff
  80b290:	74 44                	je     80b2d6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80b292:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b296:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b299:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b29c:	0f 8f e0 04 00 00    	jg     80b782 <FAT32_lookup+0x6b6>
  80b2a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b2a6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b2a9:	48 63 d2             	movsxd rdx,edx
  80b2ac:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b2b1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b2b5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b2b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b2bb:	8d 50 01             	lea    edx,[rax+0x1]
  80b2be:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b2c1:	48 98                	cdqe   
  80b2c3:	48 01 f0             	add    rax,rsi
  80b2c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2c9:	66 98                	cbw    
  80b2cb:	66 39 c1             	cmp    cx,ax
  80b2ce:	0f 85 ae 04 00 00    	jne    80b782 <FAT32_lookup+0x6b6>
  80b2d4:	eb 01                	jmp    80b2d7 <FAT32_lookup+0x20b>
					continue;
  80b2d6:	90                   	nop
			for(x=0;x<5;x++)
  80b2d7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b2db:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80b2df:	7e 90                	jle    80b271 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80b2e1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b2e8:	eb 6a                	jmp    80b354 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80b2ea:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b2ee:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b2f1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b2f4:	7e 15                	jle    80b30b <FAT32_lookup+0x23f>
  80b2f6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b2fa:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b2fd:	48 63 d2             	movsxd rdx,edx
  80b300:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b305:	66 83 f8 ff          	cmp    ax,0xffff
  80b309:	74 44                	je     80b34f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80b30b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b30f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b312:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b315:	0f 8f 6a 04 00 00    	jg     80b785 <FAT32_lookup+0x6b9>
  80b31b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b31f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b322:	48 63 d2             	movsxd rdx,edx
  80b325:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b32a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b32e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b331:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b334:	8d 50 01             	lea    edx,[rax+0x1]
  80b337:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b33a:	48 98                	cdqe   
  80b33c:	48 01 f0             	add    rax,rsi
  80b33f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b342:	66 98                	cbw    
  80b344:	66 39 c1             	cmp    cx,ax
  80b347:	0f 85 38 04 00 00    	jne    80b785 <FAT32_lookup+0x6b9>
  80b34d:	eb 01                	jmp    80b350 <FAT32_lookup+0x284>
					continue;
  80b34f:	90                   	nop
			for(x=0;x<6;x++)
  80b350:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b354:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80b358:	7e 90                	jle    80b2ea <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80b35a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b361:	eb 72                	jmp    80b3d5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80b363:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b367:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b36a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b36d:	7e 19                	jle    80b388 <FAT32_lookup+0x2bc>
  80b36f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b373:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b376:	48 63 d2             	movsxd rdx,edx
  80b379:	48 83 c2 08          	add    rdx,0x8
  80b37d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b382:	66 83 f8 ff          	cmp    ax,0xffff
  80b386:	74 48                	je     80b3d0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80b388:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b38c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b38f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b392:	0f 8f f0 03 00 00    	jg     80b788 <FAT32_lookup+0x6bc>
  80b398:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b39c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b39f:	48 63 d2             	movsxd rdx,edx
  80b3a2:	48 83 c2 08          	add    rdx,0x8
  80b3a6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b3ab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b3af:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b3b2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b3b5:	8d 50 01             	lea    edx,[rax+0x1]
  80b3b8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b3bb:	48 98                	cdqe   
  80b3bd:	48 01 f0             	add    rax,rsi
  80b3c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b3c3:	66 98                	cbw    
  80b3c5:	66 39 c1             	cmp    cx,ax
  80b3c8:	0f 85 ba 03 00 00    	jne    80b788 <FAT32_lookup+0x6bc>
  80b3ce:	eb 01                	jmp    80b3d1 <FAT32_lookup+0x305>
					continue;
  80b3d0:	90                   	nop
			for(x=0;x<2;x++)
  80b3d1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b3d5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80b3d9:	7e 88                	jle    80b363 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80b3db:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b3df:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b3e2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b3e5:	0f 8d 14 04 00 00    	jge    80b7ff <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80b3eb:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b3f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b3f4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b3f8:	3c 0f                	cmp    al,0xf
  80b3fa:	75 0f                	jne    80b40b <FAT32_lookup+0x33f>
  80b3fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b400:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b403:	3c e5                	cmp    al,0xe5
  80b405:	0f 85 5d fe ff ff    	jne    80b268 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80b40b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80b412:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b419:	e9 f4 01 00 00       	jmp    80b612 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80b41e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b422:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b425:	48 98                	cdqe   
  80b427:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b42b:	0f b6 c0             	movzx  eax,al
  80b42e:	83 f8 7a             	cmp    eax,0x7a
  80b431:	0f 8f d0 01 00 00    	jg     80b607 <FAT32_lookup+0x53b>
  80b437:	83 f8 61             	cmp    eax,0x61
  80b43a:	0f 8d e6 00 00 00    	jge    80b526 <FAT32_lookup+0x45a>
  80b440:	83 f8 5a             	cmp    eax,0x5a
  80b443:	0f 8f be 01 00 00    	jg     80b607 <FAT32_lookup+0x53b>
  80b449:	83 f8 41             	cmp    eax,0x41
  80b44c:	0f 8d d4 00 00 00    	jge    80b526 <FAT32_lookup+0x45a>
  80b452:	83 f8 20             	cmp    eax,0x20
  80b455:	74 1a                	je     80b471 <FAT32_lookup+0x3a5>
  80b457:	83 f8 20             	cmp    eax,0x20
  80b45a:	0f 8c a7 01 00 00    	jl     80b607 <FAT32_lookup+0x53b>
  80b460:	83 e8 30             	sub    eax,0x30
  80b463:	83 f8 09             	cmp    eax,0x9
  80b466:	0f 87 9b 01 00 00    	ja     80b607 <FAT32_lookup+0x53b>
  80b46c:	e9 53 01 00 00       	jmp    80b5c4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80b471:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b475:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b479:	0f b6 c0             	movzx  eax,al
  80b47c:	83 e0 10             	and    eax,0x10
  80b47f:	85 c0                	test   eax,eax
  80b481:	75 50                	jne    80b4d3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80b483:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b487:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b48a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b48d:	48 98                	cdqe   
  80b48f:	48 01 d0             	add    rax,rdx
  80b492:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b495:	3c 2e                	cmp    al,0x2e
  80b497:	0f 84 70 01 00 00    	je     80b60d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b49d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b4a1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b4a4:	48 98                	cdqe   
  80b4a6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b4aa:	0f b6 d0             	movzx  edx,al
  80b4ad:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b4b1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b4b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b4b7:	48 98                	cdqe   
  80b4b9:	48 01 c8             	add    rax,rcx
  80b4bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b4bf:	0f be c0             	movsx  eax,al
  80b4c2:	39 c2                	cmp    edx,eax
  80b4c4:	0f 85 c1 02 00 00    	jne    80b78b <FAT32_lookup+0x6bf>
						{
							j++;
  80b4ca:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b4ce:	e9 3b 01 00 00       	jmp    80b60e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b4d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b4d7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b4da:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b4dd:	7d 32                	jge    80b511 <FAT32_lookup+0x445>
  80b4df:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b4e3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b4e6:	48 98                	cdqe   
  80b4e8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b4ec:	0f b6 d0             	movzx  edx,al
  80b4ef:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b4f3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b4f6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b4f9:	48 98                	cdqe   
  80b4fb:	48 01 c8             	add    rax,rcx
  80b4fe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b501:	0f be c0             	movsx  eax,al
  80b504:	39 c2                	cmp    edx,eax
  80b506:	75 09                	jne    80b511 <FAT32_lookup+0x445>
						{
							j++;
  80b508:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b50c:	e9 fd 00 00 00       	jmp    80b60e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80b511:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b515:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b518:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b51b:	0f 85 6d 02 00 00    	jne    80b78e <FAT32_lookup+0x6c2>
							continue;
  80b521:	e9 e8 00 00 00       	jmp    80b60e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80b526:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b52a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b52e:	0f b6 c0             	movzx  eax,al
  80b531:	83 e0 08             	and    eax,0x8
  80b534:	85 c0                	test   eax,eax
  80b536:	74 49                	je     80b581 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80b538:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b53c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b53f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b542:	0f 8d 49 02 00 00    	jge    80b791 <FAT32_lookup+0x6c5>
  80b548:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b54c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b54f:	48 98                	cdqe   
  80b551:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b555:	0f b6 c0             	movzx  eax,al
  80b558:	8d 50 20             	lea    edx,[rax+0x20]
  80b55b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b55f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b562:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b565:	48 98                	cdqe   
  80b567:	48 01 c8             	add    rax,rcx
  80b56a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b56d:	0f be c0             	movsx  eax,al
  80b570:	39 c2                	cmp    edx,eax
  80b572:	0f 85 19 02 00 00    	jne    80b791 <FAT32_lookup+0x6c5>
						{
							j++;
  80b578:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b57c:	e9 8d 00 00 00       	jmp    80b60e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b581:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b585:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b588:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b58b:	0f 8d 03 02 00 00    	jge    80b794 <FAT32_lookup+0x6c8>
  80b591:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b595:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b598:	48 98                	cdqe   
  80b59a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b59e:	0f b6 d0             	movzx  edx,al
  80b5a1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b5a5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b5a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b5ab:	48 98                	cdqe   
  80b5ad:	48 01 c8             	add    rax,rcx
  80b5b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b5b3:	0f be c0             	movsx  eax,al
  80b5b6:	39 c2                	cmp    edx,eax
  80b5b8:	0f 85 d6 01 00 00    	jne    80b794 <FAT32_lookup+0x6c8>
						{
							j++;
  80b5be:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b5c2:	eb 4a                	jmp    80b60e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b5c4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b5c8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b5cb:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b5ce:	0f 8d c3 01 00 00    	jge    80b797 <FAT32_lookup+0x6cb>
  80b5d4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b5d8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b5db:	48 98                	cdqe   
  80b5dd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b5e1:	0f b6 d0             	movzx  edx,al
  80b5e4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b5e8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b5eb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b5ee:	48 98                	cdqe   
  80b5f0:	48 01 c8             	add    rax,rcx
  80b5f3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b5f6:	0f be c0             	movsx  eax,al
  80b5f9:	39 c2                	cmp    edx,eax
  80b5fb:	0f 85 96 01 00 00    	jne    80b797 <FAT32_lookup+0x6cb>
					{
						j++;
  80b601:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80b605:	eb 07                	jmp    80b60e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80b607:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80b60b:	eb 01                	jmp    80b60e <FAT32_lookup+0x542>
							continue;
  80b60d:	90                   	nop
		for(x=0;x<8;x++)
  80b60e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b612:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80b616:	0f 8e 02 fe ff ff    	jle    80b41e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80b61c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b620:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b624:	0f b6 c0             	movzx  eax,al
  80b627:	83 e0 10             	and    eax,0x10
  80b62a:	85 c0                	test   eax,eax
  80b62c:	0f 85 d0 01 00 00    	jne    80b802 <FAT32_lookup+0x736>
		{
			j++;
  80b632:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80b636:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80b63d:	e9 2b 01 00 00       	jmp    80b76d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80b642:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b646:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b649:	48 98                	cdqe   
  80b64b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b64f:	0f b6 c0             	movzx  eax,al
  80b652:	83 f8 7a             	cmp    eax,0x7a
  80b655:	0f 8f 3f 01 00 00    	jg     80b79a <FAT32_lookup+0x6ce>
  80b65b:	83 f8 61             	cmp    eax,0x61
  80b65e:	7d 2e                	jge    80b68e <FAT32_lookup+0x5c2>
  80b660:	83 f8 5a             	cmp    eax,0x5a
  80b663:	0f 8f 31 01 00 00    	jg     80b79a <FAT32_lookup+0x6ce>
  80b669:	83 f8 41             	cmp    eax,0x41
  80b66c:	7d 20                	jge    80b68e <FAT32_lookup+0x5c2>
  80b66e:	83 f8 20             	cmp    eax,0x20
  80b671:	0f 84 c4 00 00 00    	je     80b73b <FAT32_lookup+0x66f>
  80b677:	83 f8 20             	cmp    eax,0x20
  80b67a:	0f 8c 1a 01 00 00    	jl     80b79a <FAT32_lookup+0x6ce>
  80b680:	83 e8 30             	sub    eax,0x30
  80b683:	83 f8 09             	cmp    eax,0x9
  80b686:	0f 87 0e 01 00 00    	ja     80b79a <FAT32_lookup+0x6ce>
  80b68c:	eb 7e                	jmp    80b70c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80b68e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b692:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b696:	0f b6 c0             	movzx  eax,al
  80b699:	83 e0 10             	and    eax,0x10
  80b69c:	85 c0                	test   eax,eax
  80b69e:	74 39                	je     80b6d9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80b6a0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b6a4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b6a7:	48 98                	cdqe   
  80b6a9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b6ad:	0f b6 c0             	movzx  eax,al
  80b6b0:	8d 50 20             	lea    edx,[rax+0x20]
  80b6b3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b6b7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b6ba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b6bd:	48 98                	cdqe   
  80b6bf:	48 01 c8             	add    rax,rcx
  80b6c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6c5:	0f be c0             	movsx  eax,al
  80b6c8:	39 c2                	cmp    edx,eax
  80b6ca:	0f 85 cd 00 00 00    	jne    80b79d <FAT32_lookup+0x6d1>
							{
								j++;
  80b6d0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80b6d4:	e9 90 00 00 00       	jmp    80b769 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b6d9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b6dd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b6e0:	48 98                	cdqe   
  80b6e2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b6e6:	0f b6 d0             	movzx  edx,al
  80b6e9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b6ed:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b6f0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b6f3:	48 98                	cdqe   
  80b6f5:	48 01 c8             	add    rax,rcx
  80b6f8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6fb:	0f be c0             	movsx  eax,al
  80b6fe:	39 c2                	cmp    edx,eax
  80b700:	0f 85 9a 00 00 00    	jne    80b7a0 <FAT32_lookup+0x6d4>
							{
								j++;
  80b706:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80b70a:	eb 5d                	jmp    80b769 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b70c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b710:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b713:	48 98                	cdqe   
  80b715:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b719:	0f b6 d0             	movzx  edx,al
  80b71c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b720:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b723:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b726:	48 98                	cdqe   
  80b728:	48 01 c8             	add    rax,rcx
  80b72b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b72e:	0f be c0             	movsx  eax,al
  80b731:	39 c2                	cmp    edx,eax
  80b733:	75 6e                	jne    80b7a3 <FAT32_lookup+0x6d7>
						{
							j++;
  80b735:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b739:	eb 2e                	jmp    80b769 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b73b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b73f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b742:	48 98                	cdqe   
  80b744:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b748:	0f b6 d0             	movzx  edx,al
  80b74b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b74f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80b752:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b755:	48 98                	cdqe   
  80b757:	48 01 c8             	add    rax,rcx
  80b75a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b75d:	0f be c0             	movsx  eax,al
  80b760:	39 c2                	cmp    edx,eax
  80b762:	75 42                	jne    80b7a6 <FAT32_lookup+0x6da>
						{
							j++;
  80b764:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80b768:	90                   	nop
			for(x=8;x<11;x++)
  80b769:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b76d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80b771:	0f 8e cb fe ff ff    	jle    80b642 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80b777:	e9 86 00 00 00       	jmp    80b802 <FAT32_lookup+0x736>
			continue;
  80b77c:	90                   	nop
  80b77d:	eb 28                	jmp    80b7a7 <FAT32_lookup+0x6db>
			continue;
  80b77f:	90                   	nop
  80b780:	eb 25                	jmp    80b7a7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80b782:	90                   	nop
  80b783:	eb 22                	jmp    80b7a7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80b785:	90                   	nop
  80b786:	eb 1f                	jmp    80b7a7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80b788:	90                   	nop
  80b789:	eb 1c                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b78b:	90                   	nop
  80b78c:	eb 19                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b78e:	90                   	nop
  80b78f:	eb 16                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b791:	90                   	nop
  80b792:	eb 13                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b794:	90                   	nop
  80b795:	eb 10                	jmp    80b7a7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80b797:	90                   	nop
  80b798:	eb 0d                	jmp    80b7a7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80b79a:	90                   	nop
  80b79b:	eb 0a                	jmp    80b7a7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80b79d:	90                   	nop
  80b79e:	eb 07                	jmp    80b7a7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80b7a0:	90                   	nop
  80b7a1:	eb 04                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b7a3:	90                   	nop
  80b7a4:	eb 01                	jmp    80b7a7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80b7a6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80b7a7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80b7ab:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80b7b0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80b7b3:	48 63 d0             	movsxd rdx,eax
  80b7b6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b7ba:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b7be:	48 39 c2             	cmp    rdx,rax
  80b7c1:	0f 8c 4c fa ff ff    	jl     80b213 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b7c7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b7ca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b7ce:	89 d6                	mov    esi,edx
  80b7d0:	48 89 c7             	mov    rdi,rax
  80b7d3:	e8 2d e7 ff ff       	call   809f05 <DISK1_FAT32_read_FAT_Entry>
  80b7d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80b7db:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80b7e2:	77 05                	ja     80b7e9 <FAT32_lookup+0x71d>
		goto next_cluster;
  80b7e4:	e9 7f f9 ff ff       	jmp    80b168 <FAT32_lookup+0x9c>

	vmfree(buf);
  80b7e9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b7ed:	48 89 c7             	mov    rdi,rax
  80b7f0:	e8 d1 5a ff ff       	call   8012c6 <vmfree>
	return NULL;
  80b7f5:	b8 00 00 00 00       	mov    eax,0x0
  80b7fa:	e9 f0 01 00 00       	jmp    80b9ef <FAT32_lookup+0x923>
				goto find_lookup_success;
  80b7ff:	90                   	nop
  80b800:	eb 01                	jmp    80b803 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80b802:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80b803:	be 00 00 00 00       	mov    esi,0x0
  80b808:	bf 38 00 00 00       	mov    edi,0x38
  80b80d:	b8 00 00 00 00       	mov    eax,0x0
  80b812:	e8 20 5a ff ff       	call   801237 <vmalloc>
  80b817:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80b81b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b81f:	ba 38 00 00 00       	mov    edx,0x38
  80b824:	be 00 00 00 00       	mov    esi,0x0
  80b829:	48 89 c7             	mov    rdi,rax
  80b82c:	e8 8e 11 00 00       	call   80c9bf <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80b831:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b835:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80b838:	89 c2                	mov    edx,eax
  80b83a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b83e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80b841:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b845:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b848:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b84c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b850:	48 01 d0             	add    rax,rdx
  80b853:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80b857:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b85b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b85f:	48 89 c1             	mov    rcx,rax
  80b862:	48 89 d0             	mov    rax,rdx
  80b865:	ba 00 00 00 00       	mov    edx,0x0
  80b86a:	48 f7 f1             	div    rcx
  80b86d:	48 89 c2             	mov    rdx,rax
  80b870:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b874:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80b878:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b87c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b880:	0f b6 c0             	movzx  eax,al
  80b883:	83 e0 10             	and    eax,0x10
  80b886:	85 c0                	test   eax,eax
  80b888:	74 07                	je     80b891 <FAT32_lookup+0x7c5>
  80b88a:	ba 02 00 00 00       	mov    edx,0x2
  80b88f:	eb 05                	jmp    80b896 <FAT32_lookup+0x7ca>
  80b891:	ba 01 00 00 00       	mov    edx,0x1
  80b896:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b89a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80b89e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b8a2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80b8a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b8aa:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80b8ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b8b2:	48 c7 40 20 00 d6 80 	mov    QWORD PTR [rax+0x20],0x80d600
  80b8b9:	00 
	p->inode_ops = &FAT32_inode_ops;
  80b8ba:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b8be:	48 c7 40 28 40 d6 80 	mov    QWORD PTR [rax+0x28],0x80d640
  80b8c5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80b8c6:	be 00 00 00 00       	mov    esi,0x0
  80b8cb:	bf 20 00 00 00       	mov    edi,0x20
  80b8d0:	b8 00 00 00 00       	mov    eax,0x0
  80b8d5:	e8 5d 59 ff ff       	call   801237 <vmalloc>
  80b8da:	48 89 c2             	mov    rdx,rax
  80b8dd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b8e1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80b8e5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b8e9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b8ed:	ba 20 00 00 00       	mov    edx,0x20
  80b8f2:	be 00 00 00 00       	mov    esi,0x0
  80b8f7:	48 89 c7             	mov    rdi,rax
  80b8fa:	e8 c0 10 00 00       	call   80c9bf <memset>
	finode = p->private_index_info;
  80b8ff:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b903:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b907:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80b90b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b90f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80b913:	0f b7 c0             	movzx  eax,ax
  80b916:	c1 e0 10             	shl    eax,0x10
  80b919:	89 c2                	mov    edx,eax
  80b91b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b91f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80b923:	0f b7 c0             	movzx  eax,ax
  80b926:	09 d0                	or     eax,edx
  80b928:	48 98                	cdqe   
  80b92a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80b92f:	48 89 c2             	mov    rdx,rax
  80b932:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b936:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80b939:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b93c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b940:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80b944:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b948:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80b94c:	48 c1 f8 05          	sar    rax,0x5
  80b950:	48 89 c2             	mov    rdx,rax
  80b953:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b957:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80b95b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b95f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80b963:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b967:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80b96b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b96f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80b973:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b977:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80b97b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b97f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80b983:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b987:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80b98b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b98f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80b993:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b997:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80b99b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b99f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80b9a3:	66 c1 e8 0c          	shr    ax,0xc
  80b9a7:	66 85 c0             	test   ax,ax
  80b9aa:	74 27                	je     80b9d3 <FAT32_lookup+0x907>
  80b9ac:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b9b0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b9b4:	83 e0 01             	and    eax,0x1
  80b9b7:	48 85 c0             	test   rax,rax
  80b9ba:	74 17                	je     80b9d3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80b9bc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b9c0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b9c4:	48 83 c8 04          	or     rax,0x4
  80b9c8:	48 89 c2             	mov    rdx,rax
  80b9cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b9cf:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80b9d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b9d7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b9db:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	vmfree(buf);
  80b9df:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b9e3:	48 89 c7             	mov    rdi,rax
  80b9e6:	e8 db 58 ff ff       	call   8012c6 <vmfree>
	return dest_dentry;	
  80b9eb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80b9ef:	c9                   	leave  
  80b9f0:	c3                   	ret    

000000000080b9f1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80b9f1:	f3 0f 1e fa          	endbr64 
  80b9f5:	55                   	push   rbp
  80b9f6:	48 89 e5             	mov    rbp,rsp
  80b9f9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b9fd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba01:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80ba04:	90                   	nop
  80ba05:	5d                   	pop    rbp
  80ba06:	c3                   	ret    

000000000080ba07 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80ba07:	f3 0f 1e fa          	endbr64 
  80ba0b:	55                   	push   rbp
  80ba0c:	48 89 e5             	mov    rbp,rsp
  80ba0f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba13:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba17:	90                   	nop
  80ba18:	5d                   	pop    rbp
  80ba19:	c3                   	ret    

000000000080ba1a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80ba1a:	f3 0f 1e fa          	endbr64 
  80ba1e:	55                   	push   rbp
  80ba1f:	48 89 e5             	mov    rbp,rsp
  80ba22:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba26:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba2a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80ba2e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80ba32:	90                   	nop
  80ba33:	5d                   	pop    rbp
  80ba34:	c3                   	ret    

000000000080ba35 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80ba35:	f3 0f 1e fa          	endbr64 
  80ba39:	55                   	push   rbp
  80ba3a:	48 89 e5             	mov    rbp,rsp
  80ba3d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba41:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba45:	90                   	nop
  80ba46:	5d                   	pop    rbp
  80ba47:	c3                   	ret    

000000000080ba48 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80ba48:	f3 0f 1e fa          	endbr64 
  80ba4c:	55                   	push   rbp
  80ba4d:	48 89 e5             	mov    rbp,rsp
  80ba50:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba54:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba58:	90                   	nop
  80ba59:	5d                   	pop    rbp
  80ba5a:	c3                   	ret    

000000000080ba5b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80ba5b:	f3 0f 1e fa          	endbr64 
  80ba5f:	55                   	push   rbp
  80ba60:	48 89 e5             	mov    rbp,rsp
  80ba63:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba67:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba6b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80ba6f:	90                   	nop
  80ba70:	5d                   	pop    rbp
  80ba71:	c3                   	ret    

000000000080ba72 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80ba72:	f3 0f 1e fa          	endbr64 
  80ba76:	55                   	push   rbp
  80ba77:	48 89 e5             	mov    rbp,rsp
  80ba7a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba7e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80ba82:	90                   	nop
  80ba83:	5d                   	pop    rbp
  80ba84:	c3                   	ret    

000000000080ba85 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80ba85:	f3 0f 1e fa          	endbr64 
  80ba89:	55                   	push   rbp
  80ba8a:	48 89 e5             	mov    rbp,rsp
  80ba8d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba91:	90                   	nop
  80ba92:	5d                   	pop    rbp
  80ba93:	c3                   	ret    

000000000080ba94 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80ba94:	f3 0f 1e fa          	endbr64 
  80ba98:	55                   	push   rbp
  80ba99:	48 89 e5             	mov    rbp,rsp
  80ba9c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80baa0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80baa4:	90                   	nop
  80baa5:	5d                   	pop    rbp
  80baa6:	c3                   	ret    

000000000080baa7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80baa7:	f3 0f 1e fa          	endbr64 
  80baab:	55                   	push   rbp
  80baac:	48 89 e5             	mov    rbp,rsp
  80baaf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bab3:	90                   	nop
  80bab4:	5d                   	pop    rbp
  80bab5:	c3                   	ret    

000000000080bab6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80bab6:	f3 0f 1e fa          	endbr64 
  80baba:	55                   	push   rbp
  80babb:	48 89 e5             	mov    rbp,rsp
  80babe:	48 83 ec 10          	sub    rsp,0x10
  80bac2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80bac6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80baca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bace:	48 89 c7             	mov    rdi,rax
  80bad1:	e8 f0 57 ff ff       	call   8012c6 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80bad6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bada:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80badd:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80bae1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bae5:	48 89 c7             	mov    rdi,rax
  80bae8:	e8 d9 57 ff ff       	call   8012c6 <vmfree>
	vmfree(sb->root->dir_inode);
  80baed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80baf1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80baf4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80baf8:	48 89 c7             	mov    rdi,rax
  80bafb:	e8 c6 57 ff ff       	call   8012c6 <vmfree>
	vmfree(sb->root);
  80bb00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bb04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bb07:	48 89 c7             	mov    rdi,rax
  80bb0a:	e8 b7 57 ff ff       	call   8012c6 <vmfree>
	vmfree(sb);
  80bb0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bb13:	48 89 c7             	mov    rdi,rax
  80bb16:	e8 ab 57 ff ff       	call   8012c6 <vmfree>
}
  80bb1b:	90                   	nop
  80bb1c:	c9                   	leave  
  80bb1d:	c3                   	ret    

000000000080bb1e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80bb1e:	f3 0f 1e fa          	endbr64 
  80bb22:	55                   	push   rbp
  80bb23:	48 89 e5             	mov    rbp,rsp
  80bb26:	48 83 ec 40          	sub    rsp,0x40
  80bb2a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80bb2e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80bb35:	00 
	struct FAT32_Directory * buf = NULL;
  80bb36:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80bb3d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80bb3e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bb42:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80bb46:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80bb4a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bb4e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bb52:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bb56:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80bb5a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80bb61:	00 

	if(finode->dentry_location == 0)
  80bb62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb66:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80bb6a:	48 85 c0             	test   rax,rax
  80bb6d:	75 14                	jne    80bb83 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80bb6f:	bf 8c 56 81 00       	mov    edi,0x81568c
  80bb74:	b8 00 00 00 00       	mov    eax,0x0
  80bb79:	e8 e3 51 ff ff       	call   800d61 <printf>
		return ;
  80bb7e:	e9 30 01 00 00       	jmp    80bcb3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80bb83:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb87:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80bb8b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb8f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80bb93:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80bb97:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb9b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bb9f:	48 0f af c2          	imul   rax,rdx
  80bba3:	48 01 c8             	add    rax,rcx
  80bba6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80bbaa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bbae:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bbb2:	be 00 00 00 00       	mov    esi,0x0
  80bbb7:	48 89 c7             	mov    rdi,rax
  80bbba:	b8 00 00 00 00       	mov    eax,0x0
  80bbbf:	e8 73 56 ff ff       	call   801237 <vmalloc>
  80bbc4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80bbc8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bbcc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bbd0:	89 c2                	mov    edx,eax
  80bbd2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbd6:	be 00 00 00 00       	mov    esi,0x0
  80bbdb:	48 89 c7             	mov    rdi,rax
  80bbde:	e8 dc 0d 00 00       	call   80c9bf <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80bbe3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bbe7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bbeb:	89 c1                	mov    ecx,eax
  80bbed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bbf1:	89 c2                	mov    edx,eax
  80bbf3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbf7:	49 89 c0             	mov    r8,rax
  80bbfa:	be 00 00 00 00       	mov    esi,0x0
  80bbff:	bf 00 00 00 00       	mov    edi,0x0
  80bc04:	e8 51 d6 ff ff       	call   80925a <request>
  80bc09:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80bc0c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80bc0f:	89 c7                	mov    edi,eax
  80bc11:	e8 f8 dc ff ff       	call   80990e <chk_result>
    fdentry = buf+finode->dentry_position;
  80bc16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc1a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bc1e:	48 c1 e0 05          	shl    rax,0x5
  80bc22:	48 89 c2             	mov    rdx,rax
  80bc25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc29:	48 01 d0             	add    rax,rdx
  80bc2c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80bc30:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bc34:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc37:	89 c2                	mov    edx,eax
  80bc39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc3d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80bc40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc47:	89 c2                	mov    edx,eax
  80bc49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc4d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80bc51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc55:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80bc59:	66 25 00 f0          	and    ax,0xf000
  80bc5d:	89 c2                	mov    edx,eax
  80bc5f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc63:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc66:	48 c1 e8 10          	shr    rax,0x10
  80bc6a:	09 c2                	or     edx,eax
  80bc6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc70:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80bc74:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bc78:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bc7c:	89 c1                	mov    ecx,eax
  80bc7e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bc82:	89 c2                	mov    edx,eax
  80bc84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc88:	49 89 c0             	mov    r8,rax
  80bc8b:	be 01 00 00 00       	mov    esi,0x1
  80bc90:	bf 00 00 00 00       	mov    edi,0x0
  80bc95:	e8 c0 d5 ff ff       	call   80925a <request>
  80bc9a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80bc9d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80bca0:	89 c7                	mov    edi,eax
  80bca2:	e8 67 dc ff ff       	call   80990e <chk_result>
	vmfree(buf);
  80bca7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bcab:	48 89 c7             	mov    rdi,rax
  80bcae:	e8 13 56 ff ff       	call   8012c6 <vmfree>
}
  80bcb3:	c9                   	leave  
  80bcb4:	c3                   	ret    

000000000080bcb5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80bcb5:	f3 0f 1e fa          	endbr64 
  80bcb9:	55                   	push   rbp
  80bcba:	48 89 e5             	mov    rbp,rsp
  80bcbd:	48 83 ec 50          	sub    rsp,0x50
  80bcc1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80bcc5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80bcc9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80bcd0:	00 
	struct FAT32_inode_info * finode = NULL;
  80bcd1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80bcd8:	00 
	struct FAT32_BootSector * fbs = NULL;
  80bcd9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80bce0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80bce1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80bce8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80bce9:	be 00 00 00 00       	mov    esi,0x0
  80bcee:	bf 18 00 00 00       	mov    edi,0x18
  80bcf3:	b8 00 00 00 00       	mov    eax,0x0
  80bcf8:	e8 3a 55 ff ff       	call   801237 <vmalloc>
  80bcfd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80bd01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd05:	ba 18 00 00 00       	mov    edx,0x18
  80bd0a:	be 00 00 00 00       	mov    esi,0x0
  80bd0f:	48 89 c7             	mov    rdi,rax
  80bd12:	e8 a8 0c 00 00       	call   80c9bf <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80bd17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd1b:	48 c7 40 08 a0 d6 80 	mov    QWORD PTR [rax+0x8],0x80d6a0
  80bd22:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80bd23:	be 00 00 00 00       	mov    esi,0x0
  80bd28:	bf 60 00 00 00       	mov    edi,0x60
  80bd2d:	b8 00 00 00 00       	mov    eax,0x0
  80bd32:	e8 00 55 ff ff       	call   801237 <vmalloc>
  80bd37:	48 89 c2             	mov    rdx,rax
  80bd3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd3e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80bd42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd46:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bd4a:	ba 60 00 00 00       	mov    edx,0x60
  80bd4f:	be 00 00 00 00       	mov    esi,0x0
  80bd54:	48 89 c7             	mov    rdi,rax
  80bd57:	e8 63 0c 00 00       	call   80c9bf <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80bd5c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80bd60:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80bd64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd68:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bd6c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80bd70:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd74:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bd77:	89 c2                	mov    edx,eax
  80bd79:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bd7d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80bd80:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd84:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80bd87:	89 c2                	mov    edx,eax
  80bd89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bd8d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80bd91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bd95:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80bd99:	0f b6 d0             	movzx  edx,al
  80bd9c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bda0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80bda4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bda8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80bdac:	0f b6 d0             	movzx  edx,al
  80bdaf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdb3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80bdb7:	0f b7 c0             	movzx  eax,ax
  80bdba:	0f af c2             	imul   eax,edx
  80bdbd:	48 63 d0             	movsxd rdx,eax
  80bdc0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bdc4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80bdc8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdcc:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80bdd0:	0f b7 d0             	movzx  edx,ax
  80bdd3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bdd7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80bddb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bddf:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80bde2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bde6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80bdea:	0f b7 c0             	movzx  eax,ax
  80bded:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80bdf0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdf4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80bdf7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdfb:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80bdff:	0f b6 c0             	movzx  eax,al
  80be02:	0f af c2             	imul   eax,edx
  80be05:	01 c8                	add    eax,ecx
  80be07:	89 c2                	mov    edx,eax
  80be09:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be0d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80be11:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be15:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80be18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be1c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80be20:	0f b7 c0             	movzx  eax,ax
  80be23:	01 d0                	add    eax,edx
  80be25:	89 c2                	mov    edx,eax
  80be27:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be2b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80be2f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be33:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80be36:	89 c2                	mov    edx,eax
  80be38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be3c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80be40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be44:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80be48:	0f b6 d0             	movzx  edx,al
  80be4b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be4f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80be53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be57:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80be5b:	0f b7 d0             	movzx  edx,ax
  80be5e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be62:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80be66:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be6a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80be6e:	0f b7 d0             	movzx  edx,ax
  80be71:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80be75:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80be79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be7d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80be80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be84:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80be88:	0f b7 d0             	movzx  edx,ax
  80be8b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be8f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80be93:	0f b7 c0             	movzx  eax,ax
  80be96:	89 c6                	mov    esi,eax
  80be98:	bf a8 56 81 00       	mov    edi,0x8156a8
  80be9d:	b8 00 00 00 00       	mov    eax,0x0
  80bea2:	e8 ba 4e ff ff       	call   800d61 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80bea7:	be 00 00 00 00       	mov    esi,0x0
  80beac:	bf 00 02 00 00       	mov    edi,0x200
  80beb1:	b8 00 00 00 00       	mov    eax,0x0
  80beb6:	e8 7c 53 ff ff       	call   801237 <vmalloc>
  80bebb:	48 89 c2             	mov    rdx,rax
  80bebe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bec2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80bec6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80beca:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80bece:	ba 00 02 00 00       	mov    edx,0x200
  80bed3:	be 00 00 00 00       	mov    esi,0x0
  80bed8:	48 89 c7             	mov    rdi,rax
  80bedb:	e8 df 0a 00 00       	call   80c9bf <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80bee0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bee4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80bee8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80beec:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80beef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bef3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80bef7:	0f b7 c0             	movzx  eax,ax
  80befa:	01 c8                	add    eax,ecx
  80befc:	49 89 d0             	mov    r8,rdx
  80beff:	b9 01 00 00 00       	mov    ecx,0x1
  80bf04:	89 c2                	mov    edx,eax
  80bf06:	be 00 00 00 00       	mov    esi,0x0
  80bf0b:	bf 00 00 00 00       	mov    edi,0x0
  80bf10:	e8 45 d3 ff ff       	call   80925a <request>
  80bf15:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80bf18:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80bf1b:	89 c7                	mov    edi,eax
  80bf1d:	e8 ec d9 ff ff       	call   80990e <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80bf22:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf26:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80bf2a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80bf30:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf34:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80bf38:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80bf3e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf42:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80bf46:	8b 00                	mov    eax,DWORD PTR [rax]
  80bf48:	89 c6                	mov    esi,eax
  80bf4a:	bf f0 56 81 00       	mov    edi,0x8156f0
  80bf4f:	b8 00 00 00 00       	mov    eax,0x0
  80bf54:	e8 08 4e ff ff       	call   800d61 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80bf59:	be 00 00 00 00       	mov    esi,0x0
  80bf5e:	bf 58 00 00 00       	mov    edi,0x58
  80bf63:	b8 00 00 00 00       	mov    eax,0x0
  80bf68:	e8 ca 52 ff ff       	call   801237 <vmalloc>
  80bf6d:	48 89 c2             	mov    rdx,rax
  80bf70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf74:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80bf77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf7e:	ba 58 00 00 00       	mov    edx,0x58
  80bf83:	be 00 00 00 00       	mov    esi,0x0
  80bf88:	48 89 c7             	mov    rdi,rax
  80bf8b:	e8 2f 0a 00 00       	call   80c9bf <memset>

	list_init(&sbp->root->child_node);
  80bf90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf97:	48 83 c0 10          	add    rax,0x10
  80bf9b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = NULL;
  80bf9f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bfa3:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80bfaa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80bfae:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80bfb5:	00 
}
  80bfb6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80bfb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bfbb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bfbe:	48 83 c0 28          	add    rax,0x28
  80bfc2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = NULL;
  80bfc6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bfca:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80bfd1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bfd5:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80bfdc:	00 
}
  80bfdd:	90                   	nop
	sbp->root->parent = sbp->root;
  80bfde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bfe2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bfe5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80bfe9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80bfec:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80bff0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bff4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bff7:	48 c7 40 50 80 d6 80 	mov    QWORD PTR [rax+0x50],0x80d680
  80bffe:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80bfff:	be 00 00 00 00       	mov    esi,0x0
  80c004:	bf 02 00 00 00       	mov    edi,0x2
  80c009:	b8 00 00 00 00       	mov    eax,0x0
  80c00e:	e8 24 52 ff ff       	call   801237 <vmalloc>
  80c013:	48 89 c2             	mov    rdx,rax
  80c016:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c01a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c01d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80c020:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c024:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c027:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c02a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80c02d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c031:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c034:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80c03b:	be 00 00 00 00       	mov    esi,0x0
  80c040:	bf 38 00 00 00       	mov    edi,0x38
  80c045:	b8 00 00 00 00       	mov    eax,0x0
  80c04a:	e8 e8 51 ff ff       	call   801237 <vmalloc>
  80c04f:	48 89 c2             	mov    rdx,rax
  80c052:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c056:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c059:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80c05d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c061:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c064:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c068:	ba 38 00 00 00       	mov    edx,0x38
  80c06d:	be 00 00 00 00       	mov    esi,0x0
  80c072:	48 89 c7             	mov    rdi,rax
  80c075:	e8 45 09 00 00       	call   80c9bf <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80c07a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c07e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c081:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c085:	48 c7 40 28 40 d6 80 	mov    QWORD PTR [rax+0x28],0x80d640
  80c08c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80c08d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c091:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c094:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c098:	48 c7 40 20 00 d6 80 	mov    QWORD PTR [rax+0x20],0x80d600
  80c09f:	00 
	sbp->root->dir_inode->file_size = 0;
  80c0a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0a7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c0ab:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80c0b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0b9:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c0bd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c0c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c0c8:	48 01 d0             	add    rax,rdx
  80c0cb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80c0cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0d3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c0d7:	48 89 c6             	mov    rsi,rax
  80c0da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0e1:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80c0e5:	48 89 d0             	mov    rax,rdx
  80c0e8:	ba 00 00 00 00       	mov    edx,0x0
  80c0ed:	48 f7 f6             	div    rsi
  80c0f0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80c0f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c0fb:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c0ff:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80c106:	00 
	sbp->root->dir_inode->sb = sbp;
  80c107:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c10b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c10e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c112:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c116:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80c11a:	be 00 00 00 00       	mov    esi,0x0
  80c11f:	bf 20 00 00 00       	mov    edi,0x20
  80c124:	b8 00 00 00 00       	mov    eax,0x0
  80c129:	e8 09 51 ff ff       	call   801237 <vmalloc>
  80c12e:	48 89 c2             	mov    rdx,rax
  80c131:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c135:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c138:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c13c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80c140:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c144:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c147:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c14b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c14f:	ba 20 00 00 00       	mov    edx,0x20
  80c154:	be 00 00 00 00       	mov    esi,0x0
  80c159:	48 89 c7             	mov    rdi,rax
  80c15c:	e8 5e 08 00 00       	call   80c9bf <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80c161:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c165:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c168:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c16c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c170:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80c174:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c178:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80c17b:	89 c2                	mov    edx,eax
  80c17d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c181:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80c184:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c188:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80c18f:	00 
	finode->dentry_position = 0; 
  80c190:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c194:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c19b:	00 
	finode->create_date = 0;
  80c19c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1a0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80c1a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1aa:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80c1b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1b4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80c1ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1be:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80c1c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80c1c8:	c9                   	leave  
  80c1c9:	c3                   	ret    

000000000080c1ca <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80c1ca:	f3 0f 1e fa          	endbr64 
  80c1ce:	55                   	push   rbp
  80c1cf:	48 89 e5             	mov    rbp,rsp
  80c1d2:	48 81 ec 20 04 00 00 	sub    rsp,0x420
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80c1d9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c1e0:	00 
	struct Disk_Partition_Table DPT = {0};
  80c1e1:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c1e8:	b8 00 00 00 00       	mov    eax,0x0
  80c1ed:	b9 40 00 00 00       	mov    ecx,0x40
  80c1f2:	48 89 d7             	mov    rdi,rdx
  80c1f5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80c1f8:	bf c0 d6 80 00       	mov    edi,0x80d6c0
  80c1fd:	e8 ae bc ff ff       	call   807eb0 <register_filesystem>
	
	memset(buf,0,512);
  80c202:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c209:	ba 00 02 00 00       	mov    edx,0x200
  80c20e:	be 00 00 00 00       	mov    esi,0x0
  80c213:	48 89 c7             	mov    rdi,rax
  80c216:	e8 a4 07 00 00       	call   80c9bf <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80c21b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c222:	49 89 c0             	mov    r8,rax
  80c225:	b9 01 00 00 00       	mov    ecx,0x1
  80c22a:	ba 00 00 00 00       	mov    edx,0x0
  80c22f:	be 00 00 00 00       	mov    esi,0x0
  80c234:	bf 00 00 00 00       	mov    edi,0x0
  80c239:	e8 1c d0 ff ff       	call   80925a <request>
  80c23e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80c241:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80c244:	89 c7                	mov    edi,eax
  80c246:	e8 c3 d6 ff ff       	call   80990e <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80c24b:	48 8d 95 e0 fd ff ff 	lea    rdx,[rbp-0x220]
  80c252:	48 8d 85 e0 fb ff ff 	lea    rax,[rbp-0x420]
  80c259:	48 89 d6             	mov    rsi,rdx
  80c25c:	ba 40 00 00 00       	mov    edx,0x40
  80c261:	48 89 c7             	mov    rdi,rax
  80c264:	48 89 d1             	mov    rcx,rdx
  80c267:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80c26a:	0f b6 85 a2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x25e]
  80c271:	0f b6 d0             	movzx  edx,al
  80c274:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c27a:	89 c6                	mov    esi,eax
  80c27c:	bf 38 57 81 00       	mov    edi,0x815738
  80c281:	b8 00 00 00 00       	mov    eax,0x0
  80c286:	e8 d6 4a ff ff       	call   800d61 <printf>

	memset(buf,0,512);
  80c28b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c292:	ba 00 02 00 00       	mov    edx,0x200
  80c297:	be 00 00 00 00       	mov    esi,0x0
  80c29c:	48 89 c7             	mov    rdi,rax
  80c29f:	e8 1b 07 00 00       	call   80c9bf <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80c2a4:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c2aa:	89 c2                	mov    edx,eax
  80c2ac:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c2b3:	49 89 c0             	mov    r8,rax
  80c2b6:	b9 01 00 00 00       	mov    ecx,0x1
  80c2bb:	be 00 00 00 00       	mov    esi,0x0
  80c2c0:	bf 00 00 00 00       	mov    edi,0x0
  80c2c5:	e8 90 cf ff ff       	call   80925a <request>
  80c2ca:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80c2cd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80c2d0:	89 c7                	mov    edi,eax
  80c2d2:	e8 37 d6 ff ff       	call   80990e <chk_result>

    //挂载新文件系统到/mnt
	struct super_block *fat32_sb= mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80c2d7:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c2de:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c2e5:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80c2ec:	48 89 c2             	mov    rdx,rax
  80c2ef:	48 89 ce             	mov    rsi,rcx
  80c2f2:	bf 32 57 81 00       	mov    edi,0x815732
  80c2f7:	e8 3c bb ff ff       	call   807e38 <mount_fs>
  80c2fc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    fat32_sb->root=dmnt;
  80c300:	48 8b 15 c1 c1 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfc1c1]        # 4084c8 <dmnt>
  80c307:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c30b:	48 89 10             	mov    QWORD PTR [rax],rdx
//    list_add_to_behind(&root_sb->root->subdirs_list,ddev);//把dev文件夹挂到新的rfs下
}
  80c30e:	90                   	nop
  80c30f:	c9                   	leave  
  80c310:	c3                   	ret    

000000000080c311 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=tty_do_req
};

long close_tty(struct index_node * inode,struct file * filp){
  80c311:	f3 0f 1e fa          	endbr64 
  80c315:	55                   	push   rbp
  80c316:	48 89 e5             	mov    rbp,rsp
  80c319:	48 83 ec 30          	sub    rsp,0x30
  80c31d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c321:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80c325:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c329:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c32d:	48 83 c0 18          	add    rax,0x18
  80c331:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80c335:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c339:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c33d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80c341:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c345:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c349:	48 83 c0 30          	add    rax,0x30
  80c34d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80c351:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c355:	48 89 c7             	mov    rdi,rax
  80c358:	e8 69 4f ff ff       	call   8012c6 <vmfree>
    vmfree((addr_t)bo);
  80c35d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c361:	48 89 c7             	mov    rdi,rax
  80c364:	e8 5d 4f ff ff       	call   8012c6 <vmfree>
    vmfree((addr_t)be);
  80c369:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c36d:	48 89 c7             	mov    rdi,rax
  80c370:	e8 51 4f ff ff       	call   8012c6 <vmfree>
    vmfree((addr_t)filp->private_data);
  80c375:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c379:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c37d:	48 89 c7             	mov    rdi,rax
  80c380:	e8 41 4f ff ff       	call   8012c6 <vmfree>
    return 0;
  80c385:	b8 00 00 00 00       	mov    eax,0x0
}
  80c38a:	c9                   	leave  
  80c38b:	c3                   	ret    

000000000080c38c <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80c38c:	f3 0f 1e fa          	endbr64 
  80c390:	55                   	push   rbp
  80c391:	48 89 e5             	mov    rbp,rsp
  80c394:	48 83 ec 20          	sub    rsp,0x20
  80c398:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c39c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80c3a0:	b8 00 00 00 00       	mov    eax,0x0
  80c3a5:	e8 8d 4e ff ff       	call   801237 <vmalloc>
  80c3aa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80c3ae:	b8 00 00 00 00       	mov    eax,0x0
  80c3b3:	e8 7f 4e ff ff       	call   801237 <vmalloc>
  80c3b8:	48 89 c2             	mov    rdx,rax
  80c3bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3bf:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80c3c3:	b8 00 00 00 00       	mov    eax,0x0
  80c3c8:	e8 6a 4e ff ff       	call   801237 <vmalloc>
  80c3cd:	48 89 c2             	mov    rdx,rax
  80c3d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3d4:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80c3d7:	b8 00 00 00 00       	mov    eax,0x0
  80c3dc:	e8 56 4e ff ff       	call   801237 <vmalloc>
  80c3e1:	48 89 c2             	mov    rdx,rax
  80c3e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3e8:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80c3ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3f0:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80c3f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c3fb:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80c402:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c406:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80c40d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c411:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80c418:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c41c:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80c423:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c427:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80c42e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c432:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80c439:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c43d:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80c444:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c448:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80c44f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c453:	48 c7 40 20 e0 d6 80 	mov    QWORD PTR [rax+0x20],0x80d6e0
  80c45a:	00 
    filp->f_ops=&tty_fops;
  80c45b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c45f:	48 c7 40 18 e0 d6 80 	mov    QWORD PTR [rax+0x18],0x80d6e0
  80c466:	00 
    filp->private_data=ntty;
  80c467:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c46b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c46f:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80c473:	b8 00 00 00 00       	mov    eax,0x0
}
  80c478:	c9                   	leave  
  80c479:	c3                   	ret    

000000000080c47a <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80c47a:	f3 0f 1e fa          	endbr64 
  80c47e:	55                   	push   rbp
  80c47f:	48 89 e5             	mov    rbp,rsp
  80c482:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c486:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80c48a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80c48e:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80c492:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c496:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c49a:	48 83 c0 18          	add    rax,0x18
  80c49e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c4a2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80c4a9:	eb 5a                	jmp    80c505 <read_tty+0x8b>
        if(b->rptr==b->size)
  80c4ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4af:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80c4b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4b6:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80c4b9:	39 c2                	cmp    edx,eax
  80c4bb:	75 0b                	jne    80c4c8 <read_tty+0x4e>
            b->rptr=0;
  80c4bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4c1:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        buf[i++]=b->data[b->rptr];
  80c4c8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4cc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c4cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4d3:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c4d6:	48 98                	cdqe   
  80c4d8:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80c4dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c4df:	8d 50 01             	lea    edx,[rax+0x1]
  80c4e2:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c4e5:	48 63 d0             	movsxd rdx,eax
  80c4e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c4ec:	48 01 c2             	add    rdx,rax
  80c4ef:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80c4f2:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80c4f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c4f8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c4fb:	8d 50 01             	lea    edx,[rax+0x1]
  80c4fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c502:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80c505:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c508:	48 98                	cdqe   
  80c50a:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80c50e:	77 9b                	ja     80c4ab <read_tty+0x31>
    }
}
  80c510:	90                   	nop
  80c511:	5d                   	pop    rbp
  80c512:	c3                   	ret    

000000000080c513 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80c513:	f3 0f 1e fa          	endbr64 
  80c517:	55                   	push   rbp
  80c518:	48 89 e5             	mov    rbp,rsp
  80c51b:	48 83 ec 40          	sub    rsp,0x40
  80c51f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c523:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80c527:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80c52b:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80c52f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c533:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c537:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c53b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80c542:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c546:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c549:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80c54c:	eb 5a                	jmp    80c5a8 <write_tty+0x95>
        if(b->wptr==b->size)
  80c54e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c552:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c555:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c559:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80c55c:	39 c2                	cmp    edx,eax
  80c55e:	75 0b                	jne    80c56b <write_tty+0x58>
            b->wptr=0;
  80c560:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c564:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80c56b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c56e:	8d 50 01             	lea    edx,[rax+0x1]
  80c571:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c574:	48 63 d0             	movsxd rdx,eax
  80c577:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c57b:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80c57f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c583:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c586:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c58a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c58d:	48 98                	cdqe   
  80c58f:	48 01 c2             	add    rdx,rax
  80c592:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80c595:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80c597:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c59b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c59e:	8d 50 01             	lea    edx,[rax+0x1]
  80c5a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c5a5:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80c5a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c5ab:	48 98                	cdqe   
  80c5ad:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80c5b1:	77 9b                	ja     80c54e <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80c5b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c5b7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c5ba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80c5bd:	48 98                	cdqe   
  80c5bf:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80c5c3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80c5c7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c5cb:	b9 00 00 00 00       	mov    ecx,0x0
  80c5d0:	48 89 c7             	mov    rdi,rax
  80c5d3:	e8 ff b3 ff ff       	call   8079d7 <write_framebuffer>
}
  80c5d8:	90                   	nop
  80c5d9:	c9                   	leave  
  80c5da:	c3                   	ret    

000000000080c5db <tty_do_req>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{
  80c5db:	f3 0f 1e fa          	endbr64 
  80c5df:	55                   	push   rbp
  80c5e0:	48 89 e5             	mov    rbp,rsp
  80c5e3:	48 83 ec 50          	sub    rsp,0x50
  80c5e7:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80c5eb:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80c5ef:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80c5f3:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80c5f7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80c5fb:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c5ff:	48 83 c0 30          	add    rax,0x30
  80c603:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c607:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80c60e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80c612:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c615:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80c619:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80c61d:	48 83 c0 08          	add    rax,0x8
  80c621:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c624:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int saved_wptr=b->wptr;
  80c628:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c62c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c62f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    int fd=-1;
  80c632:	c7 45 d8 ff ff ff ff 	mov    DWORD PTR [rbp-0x28],0xffffffff
    switch (cmd)
  80c639:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80c63e:	0f 84 df 00 00 00    	je     80c723 <tty_do_req+0x148>
  80c644:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80c649:	0f 87 fb 00 00 00    	ja     80c74a <tty_do_req+0x16f>
  80c64f:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80c654:	74 6a                	je     80c6c0 <tty_do_req+0xe5>
  80c656:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80c65b:	0f 84 91 00 00 00    	je     80c6f2 <tty_do_req+0x117>
  80c661:	e9 e4 00 00 00       	jmp    80c74a <tty_do_req+0x16f>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80c666:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c66a:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c66d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c671:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80c674:	39 c2                	cmp    edx,eax
  80c676:	75 0b                	jne    80c683 <tty_do_req+0xa8>
                    b->wptr=0;
  80c678:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c67c:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80c683:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c686:	8d 50 01             	lea    edx,[rax+0x1]
  80c689:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c68c:	48 63 d0             	movsxd rdx,eax
  80c68f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c693:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80c697:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c69b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c69e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6a2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c6a5:	48 98                	cdqe   
  80c6a7:	48 01 c2             	add    rdx,rax
  80c6aa:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80c6ad:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80c6af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6b3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c6b6:	8d 50 01             	lea    edx,[rax+0x1]
  80c6b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6bd:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80c6c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c6c3:	48 98                	cdqe   
  80c6c5:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
  80c6c9:	77 9b                	ja     80c666 <tty_do_req+0x8b>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80c6cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6cf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c6d2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80c6d5:	48 98                	cdqe   
  80c6d7:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80c6db:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80c6df:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80c6e3:	b9 00 00 00 00       	mov    ecx,0x0
  80c6e8:	48 89 c7             	mov    rdi,rax
  80c6eb:	e8 e7 b2 ff ff       	call   8079d7 <write_framebuffer>
        break;
  80c6f0:	eb 61                	jmp    80c753 <tty_do_req+0x178>
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
  80c6f2:	be c1 00 00 00       	mov    esi,0xc1
  80c6f7:	bf 56 57 81 00       	mov    edi,0x815756
  80c6fc:	e8 af ba ff ff       	call   8081b0 <sys_open>
  80c701:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80c704:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80c708:	75 09                	jne    80c713 <tty_do_req+0x138>
  80c70a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80c711:	eb 45                	jmp    80c758 <tty_do_req+0x17d>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80c713:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80c717:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c71b:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
  80c71e:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80c721:	eb 30                	jmp    80c753 <tty_do_req+0x178>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80c723:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80c727:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c72b:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80c72e:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80c731:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80c735:	75 09                	jne    80c740 <tty_do_req+0x165>
  80c737:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80c73e:	eb 18                	jmp    80c758 <tty_do_req+0x17d>
            sys_close(fd);
  80c740:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80c743:	89 c7                	mov    edi,eax
  80c745:	e8 fd bf ff ff       	call   808747 <sys_close>
    default:return -1;
  80c74a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80c751:	eb 05                	jmp    80c758 <tty_do_req+0x17d>
    }
    return 0;
  80c753:	b8 00 00 00 00       	mov    eax,0x0
}
  80c758:	c9                   	leave  
  80c759:	c3                   	ret    

000000000080c75a <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80c75a:	f3 0f 1e fa          	endbr64 
  80c75e:	55                   	push   rbp
  80c75f:	48 89 e5             	mov    rbp,rsp
  80c762:	48 83 ec 10          	sub    rsp,0x10
  80c766:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80c769:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c76c:	83 c0 01             	add    eax,0x1
  80c76f:	0f b7 c0             	movzx  eax,ax
  80c772:	be 00 00 00 00       	mov    esi,0x0
  80c777:	89 c7                	mov    edi,eax
  80c779:	e8 d2 9d ff ff       	call   806550 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80c77e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c781:	83 c0 03             	add    eax,0x3
  80c784:	0f b7 c0             	movzx  eax,ax
  80c787:	be 80 00 00 00       	mov    esi,0x80
  80c78c:	89 c7                	mov    edi,eax
  80c78e:	e8 bd 9d ff ff       	call   806550 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80c793:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c796:	0f b7 c0             	movzx  eax,ax
  80c799:	be 03 00 00 00       	mov    esi,0x3
  80c79e:	89 c7                	mov    edi,eax
  80c7a0:	e8 ab 9d ff ff       	call   806550 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80c7a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c7a8:	83 c0 01             	add    eax,0x1
  80c7ab:	0f b7 c0             	movzx  eax,ax
  80c7ae:	be 00 00 00 00       	mov    esi,0x0
  80c7b3:	89 c7                	mov    edi,eax
  80c7b5:	e8 96 9d ff ff       	call   806550 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80c7ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c7bd:	83 c0 03             	add    eax,0x3
  80c7c0:	0f b7 c0             	movzx  eax,ax
  80c7c3:	be 03 00 00 00       	mov    esi,0x3
  80c7c8:	89 c7                	mov    edi,eax
  80c7ca:	e8 81 9d ff ff       	call   806550 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80c7cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c7d2:	83 c0 02             	add    eax,0x2
  80c7d5:	0f b7 c0             	movzx  eax,ax
  80c7d8:	be 87 00 00 00       	mov    esi,0x87
  80c7dd:	89 c7                	mov    edi,eax
  80c7df:	e8 6c 9d ff ff       	call   806550 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80c7e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c7e7:	83 c0 04             	add    eax,0x4
  80c7ea:	0f b7 c0             	movzx  eax,ax
  80c7ed:	be 0b 00 00 00       	mov    esi,0xb
  80c7f2:	89 c7                	mov    edi,eax
  80c7f4:	e8 57 9d ff ff       	call   806550 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80c7f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c7fc:	83 c0 04             	add    eax,0x4
  80c7ff:	0f b7 c0             	movzx  eax,ax
  80c802:	be 0f 00 00 00       	mov    esi,0xf
  80c807:	89 c7                	mov    edi,eax
  80c809:	e8 42 9d ff ff       	call   806550 <outb>
}
  80c80e:	90                   	nop
  80c80f:	c9                   	leave  
  80c810:	c3                   	ret    

000000000080c811 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80c811:	f3 0f 1e fa          	endbr64 
  80c815:	55                   	push   rbp
  80c816:	48 89 e5             	mov    rbp,rsp
  80c819:	48 83 ec 20          	sub    rsp,0x20
  80c81d:	89 f8                	mov    eax,edi
  80c81f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80c822:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80c826:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80c829:	83 c0 05             	add    eax,0x5
  80c82c:	0f b6 c0             	movzx  eax,al
  80c82f:	89 c7                	mov    edi,eax
  80c831:	e8 33 9d ff ff       	call   806569 <inb>
  80c836:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80c839:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80c83d:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80c841:	74 e3                	je     80c826 <com_putchar+0x15>
    outb(com_base, ch);
  80c843:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80c847:	0f b6 d0             	movzx  edx,al
  80c84a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80c84d:	0f b7 c0             	movzx  eax,ax
  80c850:	89 d6                	mov    esi,edx
  80c852:	89 c7                	mov    edi,eax
  80c854:	e8 f7 9c ff ff       	call   806550 <outb>
}
  80c859:	90                   	nop
  80c85a:	c9                   	leave  
  80c85b:	c3                   	ret    

000000000080c85c <com_puts>:

void com_puts(char* s,int com_port){
  80c85c:	f3 0f 1e fa          	endbr64 
  80c860:	55                   	push   rbp
  80c861:	48 89 e5             	mov    rbp,rsp
  80c864:	48 83 ec 10          	sub    rsp,0x10
  80c868:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c86c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80c86f:	eb 1d                	jmp    80c88e <com_puts+0x32>
        com_putchar(*s,com_port);
  80c871:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c875:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c878:	66 98                	cbw    
  80c87a:	0f b7 c0             	movzx  eax,ax
  80c87d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80c880:	89 d6                	mov    esi,edx
  80c882:	89 c7                	mov    edi,eax
  80c884:	e8 88 ff ff ff       	call   80c811 <com_putchar>
    for(;*s;s++){
  80c889:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80c88e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c892:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c895:	84 c0                	test   al,al
  80c897:	75 d8                	jne    80c871 <com_puts+0x15>
    }
}
  80c899:	90                   	nop
  80c89a:	90                   	nop
  80c89b:	c9                   	leave  
  80c89c:	c3                   	ret    

000000000080c89d <comprintf>:
void comprintf(char* fmt,va_list args){
  80c89d:	f3 0f 1e fa          	endbr64 
  80c8a1:	55                   	push   rbp
  80c8a2:	48 89 e5             	mov    rbp,rsp
  80c8a5:	48 83 ec 20          	sub    rsp,0x20
  80c8a9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c8ad:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80c8b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c8b5:	48 89 c7             	mov    rdi,rax
  80c8b8:	e8 70 03 00 00       	call   80cc2d <strlen>
  80c8bd:	3d ff 03 00 00       	cmp    eax,0x3ff
  80c8c2:	7f 49                	jg     80c90d <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80c8c4:	b8 00 00 00 00       	mov    eax,0x0
  80c8c9:	e8 69 49 ff ff       	call   801237 <vmalloc>
  80c8ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80c8d2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80c8d6:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80c8da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8de:	48 89 ce             	mov    rsi,rcx
  80c8e1:	48 89 c7             	mov    rdi,rax
  80c8e4:	b8 00 00 00 00       	mov    eax,0x0
  80c8e9:	e8 6d 03 00 00       	call   80cc5b <sprintf>
    com_puts(tmp,PORT_COM1);
  80c8ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8f2:	be f8 03 00 00       	mov    esi,0x3f8
  80c8f7:	48 89 c7             	mov    rdi,rax
  80c8fa:	e8 5d ff ff ff       	call   80c85c <com_puts>
    vmfree(tmp);
  80c8ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c903:	48 89 c7             	mov    rdi,rax
  80c906:	e8 bb 49 ff ff       	call   8012c6 <vmfree>
  80c90b:	eb 01                	jmp    80c90e <comprintf+0x71>
        return;//一次性输出不了太长
  80c90d:	90                   	nop
  80c90e:	c9                   	leave  
  80c90f:	c3                   	ret    

000000000080c910 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80c910:	f3 0f 1e fa          	endbr64 
  80c914:	55                   	push   rbp
  80c915:	48 89 e5             	mov    rbp,rsp
  80c918:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c91c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80c920:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80c923:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c927:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80c92a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80c931:	eb 1b                	jmp    80c94e <memcpy+0x3e>
        *(dest)=*(src);
  80c933:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c937:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80c93a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c93e:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80c940:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80c945:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80c94a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80c94e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c951:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80c954:	77 dd                	ja     80c933 <memcpy+0x23>
    }
}
  80c956:	90                   	nop
  80c957:	90                   	nop
  80c958:	5d                   	pop    rbp
  80c959:	c3                   	ret    

000000000080c95a <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80c95a:	f3 0f 1e fa          	endbr64 
  80c95e:	55                   	push   rbp
  80c95f:	48 89 e5             	mov    rbp,rsp
  80c962:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c966:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80c96a:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80c96d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80c974:	eb 3a                	jmp    80c9b0 <memcmp+0x56>
    {
        if(*a!=*b)
  80c976:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c97a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80c97d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c981:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c984:	38 c2                	cmp    dl,al
  80c986:	74 1a                	je     80c9a2 <memcmp+0x48>
            return *a-*b;
  80c988:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c98c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c98f:	0f b6 d0             	movzx  edx,al
  80c992:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c996:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c999:	0f b6 c8             	movzx  ecx,al
  80c99c:	89 d0                	mov    eax,edx
  80c99e:	29 c8                	sub    eax,ecx
  80c9a0:	eb 1b                	jmp    80c9bd <memcmp+0x63>
        a++;
  80c9a2:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80c9a7:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80c9ac:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80c9b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c9b3:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80c9b6:	7c be                	jl     80c976 <memcmp+0x1c>
    }
    return 0;
  80c9b8:	b8 00 00 00 00       	mov    eax,0x0
}
  80c9bd:	5d                   	pop    rbp
  80c9be:	c3                   	ret    

000000000080c9bf <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80c9bf:	f3 0f 1e fa          	endbr64 
  80c9c3:	55                   	push   rbp
  80c9c4:	48 89 e5             	mov    rbp,rsp
  80c9c7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c9cb:	89 f0                	mov    eax,esi
  80c9cd:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80c9d0:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80c9d3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80c9da:	eb 16                	jmp    80c9f2 <memset+0x33>
        *(buf++)=value;
  80c9dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c9e0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c9e4:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80c9e8:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80c9ec:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80c9ee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80c9f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c9f5:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80c9f8:	72 e2                	jb     80c9dc <memset+0x1d>
    }
}
  80c9fa:	90                   	nop
  80c9fb:	90                   	nop
  80c9fc:	5d                   	pop    rbp
  80c9fd:	c3                   	ret    

000000000080c9fe <get_mem_size>:

u32 get_mem_size(){
  80c9fe:	f3 0f 1e fa          	endbr64 
  80ca02:	55                   	push   rbp
  80ca03:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80ca06:	8b 05 90 ec c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ec90]        # 42b69c <mem_end>
}
  80ca0c:	5d                   	pop    rbp
  80ca0d:	c3                   	ret    

000000000080ca0e <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80ca0e:	f3 0f 1e fa          	endbr64 
  80ca12:	55                   	push   rbp
  80ca13:	48 89 e5             	mov    rbp,rsp
  80ca16:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ca1a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80ca1e:	eb 1d                	jmp    80ca3d <strcpy+0x2f>
        *(dest++)=*(buf++);
  80ca20:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80ca24:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80ca28:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80ca2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ca30:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80ca34:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80ca38:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80ca3b:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80ca3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ca44:	84 c0                	test   al,al
  80ca46:	75 d8                	jne    80ca20 <strcpy+0x12>
    }
    *dest='\0';
  80ca48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ca4c:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80ca4f:	90                   	nop
  80ca50:	5d                   	pop    rbp
  80ca51:	c3                   	ret    

000000000080ca52 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80ca52:	f3 0f 1e fa          	endbr64 
  80ca56:	55                   	push   rbp
  80ca57:	48 89 e5             	mov    rbp,rsp
  80ca5a:	48 83 ec 30          	sub    rsp,0x30
  80ca5e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ca62:	89 f0                	mov    eax,esi
  80ca64:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80ca67:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80ca6c:	0f 84 9c 00 00 00    	je     80cb0e <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80ca72:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ca76:	48 89 c6             	mov    rsi,rax
  80ca79:	bf c0 b6 42 00       	mov    edi,0x42b6c0
  80ca7e:	e8 8b ff ff ff       	call   80ca0e <strcpy>
        char* ptr=strtokkee;
  80ca83:	48 c7 45 e8 c0 b6 42 	mov    QWORD PTR [rbp-0x18],0x42b6c0
  80ca8a:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80ca8b:	c7 05 2b ee c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1ee2b],0x0        # 42b8c0 <tokptr>
  80ca92:	00 00 00 
  80ca95:	eb 1c                	jmp    80cab3 <strtok+0x61>
  80ca97:	8b 05 23 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ee23]        # 42b8c0 <tokptr>
  80ca9d:	83 c0 01             	add    eax,0x1
  80caa0:	99                   	cdq    
  80caa1:	c1 ea 17             	shr    edx,0x17
  80caa4:	01 d0                	add    eax,edx
  80caa6:	25 ff 01 00 00       	and    eax,0x1ff
  80caab:	29 d0                	sub    eax,edx
  80caad:	89 05 0d ee c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ee0d],eax        # 42b8c0 <tokptr>
  80cab3:	8b 05 07 ee c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ee07]        # 42b8c0 <tokptr>
  80cab9:	48 98                	cdqe   
  80cabb:	0f b6 80 c0 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b6c0]
  80cac2:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80cac5:	74 13                	je     80cada <strtok+0x88>
  80cac7:	8b 05 f3 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1edf3]        # 42b8c0 <tokptr>
  80cacd:	48 98                	cdqe   
  80cacf:	0f b6 80 c0 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b6c0]
  80cad6:	84 c0                	test   al,al
  80cad8:	75 bd                	jne    80ca97 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80cada:	8b 05 e0 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ede0]        # 42b8c0 <tokptr>
  80cae0:	48 98                	cdqe   
  80cae2:	c6 80 c0 b6 42 00 00 	mov    BYTE PTR [rax+0x42b6c0],0x0
        tokptr=(tokptr+1)%512;
  80cae9:	8b 05 d1 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1edd1]        # 42b8c0 <tokptr>
  80caef:	83 c0 01             	add    eax,0x1
  80caf2:	99                   	cdq    
  80caf3:	c1 ea 17             	shr    edx,0x17
  80caf6:	01 d0                	add    eax,edx
  80caf8:	25 ff 01 00 00       	and    eax,0x1ff
  80cafd:	29 d0                	sub    eax,edx
  80caff:	89 05 bb ed c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1edbb],eax        # 42b8c0 <tokptr>
        return ptr;
  80cb05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cb09:	e9 9e 00 00 00       	jmp    80cbac <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80cb0e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80cb15:	8b 05 a5 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eda5]        # 42b8c0 <tokptr>
  80cb1b:	48 98                	cdqe   
  80cb1d:	48 05 c0 b6 42 00    	add    rax,0x42b6c0
  80cb23:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80cb27:	eb 20                	jmp    80cb49 <strtok+0xf7>
  80cb29:	8b 05 91 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed91]        # 42b8c0 <tokptr>
  80cb2f:	83 c0 01             	add    eax,0x1
  80cb32:	99                   	cdq    
  80cb33:	c1 ea 17             	shr    edx,0x17
  80cb36:	01 d0                	add    eax,edx
  80cb38:	25 ff 01 00 00       	and    eax,0x1ff
  80cb3d:	29 d0                	sub    eax,edx
  80cb3f:	89 05 7b ed c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ed7b],eax        # 42b8c0 <tokptr>
  80cb45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cb49:	8b 05 71 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed71]        # 42b8c0 <tokptr>
  80cb4f:	48 98                	cdqe   
  80cb51:	0f b6 80 c0 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b6c0]
  80cb58:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80cb5b:	74 13                	je     80cb70 <strtok+0x11e>
  80cb5d:	8b 05 5d ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed5d]        # 42b8c0 <tokptr>
  80cb63:	48 98                	cdqe   
  80cb65:	0f b6 80 c0 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b6c0]
  80cb6c:	84 c0                	test   al,al
  80cb6e:	75 b9                	jne    80cb29 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80cb70:	8b 05 4a ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed4a]        # 42b8c0 <tokptr>
  80cb76:	48 98                	cdqe   
  80cb78:	c6 80 c0 b6 42 00 00 	mov    BYTE PTR [rax+0x42b6c0],0x0
    tokptr=(tokptr+1)%512;
  80cb7f:	8b 05 3b ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed3b]        # 42b8c0 <tokptr>
  80cb85:	83 c0 01             	add    eax,0x1
  80cb88:	99                   	cdq    
  80cb89:	c1 ea 17             	shr    edx,0x17
  80cb8c:	01 d0                	add    eax,edx
  80cb8e:	25 ff 01 00 00       	and    eax,0x1ff
  80cb93:	29 d0                	sub    eax,edx
  80cb95:	89 05 25 ed c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ed25],eax        # 42b8c0 <tokptr>
    if(c)
  80cb9b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80cb9f:	74 06                	je     80cba7 <strtok+0x155>
        return ptr;
  80cba1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cba5:	eb 05                	jmp    80cbac <strtok+0x15a>
    else
        return (void*)0;
  80cba7:	b8 00 00 00 00       	mov    eax,0x0
}
  80cbac:	c9                   	leave  
  80cbad:	c3                   	ret    

000000000080cbae <strcmp>:
int strcmp(char *s1,char *s2)
{
  80cbae:	f3 0f 1e fa          	endbr64 
  80cbb2:	55                   	push   rbp
  80cbb3:	48 89 e5             	mov    rbp,rsp
  80cbb6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80cbba:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80cbbe:	eb 3c                	jmp    80cbfc <strcmp+0x4e>
		if(*s1>*s2)
  80cbc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cbc4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cbc7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cbcb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cbce:	38 c2                	cmp    dl,al
  80cbd0:	7e 07                	jle    80cbd9 <strcmp+0x2b>
			return 1;
  80cbd2:	b8 01 00 00 00       	mov    eax,0x1
  80cbd7:	eb 52                	jmp    80cc2b <strcmp+0x7d>
		else if(*s1<*s2)
  80cbd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cbdd:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cbe0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cbe4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cbe7:	38 c2                	cmp    dl,al
  80cbe9:	7d 07                	jge    80cbf2 <strcmp+0x44>
			return -1;
  80cbeb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80cbf0:	eb 39                	jmp    80cc2b <strcmp+0x7d>
		s1++;
  80cbf2:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80cbf7:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80cbfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cc00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cc03:	84 c0                	test   al,al
  80cc05:	74 0b                	je     80cc12 <strcmp+0x64>
  80cc07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cc0e:	84 c0                	test   al,al
  80cc10:	75 ae                	jne    80cbc0 <strcmp+0x12>
	}
	if(*s1==*s2)
  80cc12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cc16:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cc19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc1d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cc20:	38 c2                	cmp    dl,al
  80cc22:	75 07                	jne    80cc2b <strcmp+0x7d>
		return 0;
  80cc24:	b8 00 00 00 00       	mov    eax,0x0
  80cc29:	eb 00                	jmp    80cc2b <strcmp+0x7d>
}
  80cc2b:	5d                   	pop    rbp
  80cc2c:	c3                   	ret    

000000000080cc2d <strlen>:

int strlen(char *str)
{
  80cc2d:	f3 0f 1e fa          	endbr64 
  80cc31:	55                   	push   rbp
  80cc32:	48 89 e5             	mov    rbp,rsp
  80cc35:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80cc39:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80cc40:	eb 09                	jmp    80cc4b <strlen+0x1e>
  80cc42:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80cc47:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cc4b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cc4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cc52:	84 c0                	test   al,al
  80cc54:	75 ec                	jne    80cc42 <strlen+0x15>
    return l;
  80cc56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80cc59:	5d                   	pop    rbp
  80cc5a:	c3                   	ret    

000000000080cc5b <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80cc5b:	f3 0f 1e fa          	endbr64 
  80cc5f:	55                   	push   rbp
  80cc60:	48 89 e5             	mov    rbp,rsp
  80cc63:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80cc6a:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80cc71:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80cc78:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80cc7f:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80cc86:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80cc8d:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80cc94:	84 c0                	test   al,al
  80cc96:	74 20                	je     80ccb8 <sprintf+0x5d>
  80cc98:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80cc9c:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80cca0:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80cca4:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80cca8:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80ccac:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80ccb0:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80ccb4:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80ccb8:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ccbf:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80ccc6:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80cccd:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80ccd4:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80ccdb:	00 00 00 
    while (*pstr!='\n')
  80ccde:	eb 39                	jmp    80cd19 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80cce0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cce7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ccea:	3c 25                	cmp    al,0x25
  80ccec:	75 15                	jne    80cd03 <sprintf+0xa8>
  80ccee:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80ccf5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ccf8:	3c 25                	cmp    al,0x25
  80ccfa:	74 07                	je     80cd03 <sprintf+0xa8>
            argnum++;
  80ccfc:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80cd03:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cd0a:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80cd11:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80cd18:	01 
    while (*pstr!='\n')
  80cd19:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cd20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cd23:	3c 0a                	cmp    al,0xa
  80cd25:	75 b9                	jne    80cce0 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80cd27:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80cd2e:	00 00 00 
  80cd31:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80cd38:	00 00 00 
  80cd3b:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80cd3f:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80cd46:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80cd4d:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80cd54:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80cd5b:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80cd62:	e9 e2 01 00 00       	jmp    80cf49 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80cd67:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cd6e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cd71:	3c 25                	cmp    al,0x25
  80cd73:	0f 85 aa 01 00 00    	jne    80cf23 <sprintf+0x2c8>
  80cd79:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cd80:	48 83 c0 01          	add    rax,0x1
  80cd84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cd87:	84 c0                	test   al,al
  80cd89:	0f 84 94 01 00 00    	je     80cf23 <sprintf+0x2c8>
            pstr++;
  80cd8f:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80cd96:	01 
            if(*pstr=='x'){
  80cd97:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cd9e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cda1:	3c 78                	cmp    al,0x78
  80cda3:	75 64                	jne    80ce09 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80cda5:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80cdab:	83 f8 2f             	cmp    eax,0x2f
  80cdae:	77 23                	ja     80cdd3 <sprintf+0x178>
  80cdb0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80cdb7:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80cdbd:	89 d2                	mov    edx,edx
  80cdbf:	48 01 d0             	add    rax,rdx
  80cdc2:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80cdc8:	83 c2 08             	add    edx,0x8
  80cdcb:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80cdd1:	eb 12                	jmp    80cde5 <sprintf+0x18a>
  80cdd3:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80cdda:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80cdde:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80cde5:	8b 00                	mov    eax,DWORD PTR [rax]
  80cde7:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80cded:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80cdf3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80cdfa:	89 d6                	mov    esi,edx
  80cdfc:	48 89 c7             	mov    rdi,rax
  80cdff:	e8 4e 02 00 00       	call   80d052 <sprint_hex>
            if(*pstr=='x'){
  80ce04:	e9 38 01 00 00       	jmp    80cf41 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80ce09:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ce10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ce13:	3c 73                	cmp    al,0x73
  80ce15:	75 68                	jne    80ce7f <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80ce17:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ce1d:	83 f8 2f             	cmp    eax,0x2f
  80ce20:	77 23                	ja     80ce45 <sprintf+0x1ea>
  80ce22:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ce29:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ce2f:	89 d2                	mov    edx,edx
  80ce31:	48 01 d0             	add    rax,rdx
  80ce34:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ce3a:	83 c2 08             	add    edx,0x8
  80ce3d:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ce43:	eb 12                	jmp    80ce57 <sprintf+0x1fc>
  80ce45:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80ce4c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80ce50:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80ce57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ce5a:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80ce61:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80ce68:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ce6f:	48 89 d6             	mov    rsi,rdx
  80ce72:	48 89 c7             	mov    rdi,rax
  80ce75:	e8 5a 02 00 00       	call   80d0d4 <sprintn>
            if(*pstr=='x'){
  80ce7a:	e9 c2 00 00 00       	jmp    80cf41 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80ce7f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ce86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ce89:	3c 64                	cmp    al,0x64
  80ce8b:	75 66                	jne    80cef3 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80ce8d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ce93:	83 f8 2f             	cmp    eax,0x2f
  80ce96:	77 23                	ja     80cebb <sprintf+0x260>
  80ce98:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ce9f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80cea5:	89 d2                	mov    edx,edx
  80cea7:	48 01 d0             	add    rax,rdx
  80ceaa:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ceb0:	83 c2 08             	add    edx,0x8
  80ceb3:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ceb9:	eb 12                	jmp    80cecd <sprintf+0x272>
  80cebb:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80cec2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80cec6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80cecd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ced0:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80ced7:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80cede:	89 c2                	mov    edx,eax
  80cee0:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80cee7:	89 d6                	mov    esi,edx
  80cee9:	48 89 c7             	mov    rdi,rax
  80ceec:	e8 ad 00 00 00       	call   80cf9e <sprint_decimal>
            if(*pstr=='x'){
  80cef1:	eb 4e                	jmp    80cf41 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80cef3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cefa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cefd:	3c 63                	cmp    al,0x63
  80ceff:	75 02                	jne    80cf03 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80cf01:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80cf03:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cf0a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf0d:	0f be d0             	movsx  edx,al
  80cf10:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80cf17:	89 d6                	mov    esi,edx
  80cf19:	48 89 c7             	mov    rdi,rax
  80cf1c:	e8 3e 00 00 00       	call   80cf5f <sprintchar>
            if(*pstr=='x'){
  80cf21:	eb 1e                	jmp    80cf41 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80cf23:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cf2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf2d:	0f be d0             	movsx  edx,al
  80cf30:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80cf37:	89 d6                	mov    esi,edx
  80cf39:	48 89 c7             	mov    rdi,rax
  80cf3c:	e8 1e 00 00 00       	call   80cf5f <sprintchar>
    for(;*pstr!='\0';pstr++){
  80cf41:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80cf48:	01 
  80cf49:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80cf50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf53:	84 c0                	test   al,al
  80cf55:	0f 85 0c fe ff ff    	jne    80cd67 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80cf5b:	90                   	nop
  80cf5c:	90                   	nop
  80cf5d:	c9                   	leave  
  80cf5e:	c3                   	ret    

000000000080cf5f <sprintchar>:
void sprintchar(char *dist,char c)
{
  80cf5f:	f3 0f 1e fa          	endbr64 
  80cf63:	55                   	push   rbp
  80cf64:	48 89 e5             	mov    rbp,rsp
  80cf67:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80cf6b:	89 f0                	mov    eax,esi
  80cf6d:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80cf70:	eb 05                	jmp    80cf77 <sprintchar+0x18>
        dist++;
  80cf72:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80cf77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf7e:	84 c0                	test   al,al
  80cf80:	75 f0                	jne    80cf72 <sprintchar+0x13>
    *dist++=c;
  80cf82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf86:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80cf8a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80cf8e:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80cf92:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80cf94:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cf98:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80cf9b:	90                   	nop
  80cf9c:	5d                   	pop    rbp
  80cf9d:	c3                   	ret    

000000000080cf9e <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80cf9e:	f3 0f 1e fa          	endbr64 
  80cfa2:	55                   	push   rbp
  80cfa3:	48 89 e5             	mov    rbp,rsp
  80cfa6:	48 83 ec 30          	sub    rsp,0x30
  80cfaa:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80cfae:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80cfb1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80cfb8:	eb 65                	jmp    80d01f <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80cfba:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80cfbd:	48 63 c2             	movsxd rax,edx
  80cfc0:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80cfc7:	48 c1 e8 20          	shr    rax,0x20
  80cfcb:	c1 f8 02             	sar    eax,0x2
  80cfce:	89 d6                	mov    esi,edx
  80cfd0:	c1 fe 1f             	sar    esi,0x1f
  80cfd3:	29 f0                	sub    eax,esi
  80cfd5:	89 c1                	mov    ecx,eax
  80cfd7:	89 c8                	mov    eax,ecx
  80cfd9:	c1 e0 02             	shl    eax,0x2
  80cfdc:	01 c8                	add    eax,ecx
  80cfde:	01 c0                	add    eax,eax
  80cfe0:	89 d1                	mov    ecx,edx
  80cfe2:	29 c1                	sub    ecx,eax
  80cfe4:	89 c8                	mov    eax,ecx
  80cfe6:	83 c0 30             	add    eax,0x30
  80cfe9:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80cfec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cfef:	8d 50 01             	lea    edx,[rax+0x1]
  80cff2:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cff5:	48 98                	cdqe   
  80cff7:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80cffb:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80cfff:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80d002:	48 63 d0             	movsxd rdx,eax
  80d005:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80d00c:	48 c1 ea 20          	shr    rdx,0x20
  80d010:	c1 fa 02             	sar    edx,0x2
  80d013:	c1 f8 1f             	sar    eax,0x1f
  80d016:	89 c1                	mov    ecx,eax
  80d018:	89 d0                	mov    eax,edx
  80d01a:	29 c8                	sub    eax,ecx
  80d01c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80d01f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d022:	83 f8 0f             	cmp    eax,0xf
  80d025:	76 93                	jbe    80cfba <sprint_decimal+0x1c>
    }
    while(p>0)
  80d027:	eb 1f                	jmp    80d048 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80d029:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d02d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d030:	48 98                	cdqe   
  80d032:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80d037:	0f be d0             	movsx  edx,al
  80d03a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d03e:	89 d6                	mov    esi,edx
  80d040:	48 89 c7             	mov    rdi,rax
  80d043:	e8 17 ff ff ff       	call   80cf5f <sprintchar>
    while(p>0)
  80d048:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d04c:	7f db                	jg     80d029 <sprint_decimal+0x8b>
    }
}
  80d04e:	90                   	nop
  80d04f:	90                   	nop
  80d050:	c9                   	leave  
  80d051:	c3                   	ret    

000000000080d052 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80d052:	f3 0f 1e fa          	endbr64 
  80d056:	55                   	push   rbp
  80d057:	48 89 e5             	mov    rbp,rsp
  80d05a:	48 83 ec 20          	sub    rsp,0x20
  80d05e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80d062:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80d065:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80d06c:	eb 35                	jmp    80d0a3 <sprint_hex+0x51>
        unsigned char a=c%16;
  80d06e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d071:	83 e0 0f             	and    eax,0xf
  80d074:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80d077:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80d07b:	76 06                	jbe    80d083 <sprint_hex+0x31>
  80d07d:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80d081:	eb 04                	jmp    80d087 <sprint_hex+0x35>
        else a+='0';
  80d083:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80d087:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d08a:	8d 50 01             	lea    edx,[rax+0x1]
  80d08d:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d090:	48 98                	cdqe   
  80d092:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d096:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80d09a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d09d:	c1 e8 04             	shr    eax,0x4
  80d0a0:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80d0a3:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80d0a7:	7e c5                	jle    80d06e <sprint_hex+0x1c>
    }
    while(p>0)
  80d0a9:	eb 1f                	jmp    80d0ca <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80d0ab:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d0af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d0b2:	48 98                	cdqe   
  80d0b4:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80d0b9:	0f be d0             	movsx  edx,al
  80d0bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d0c0:	89 d6                	mov    esi,edx
  80d0c2:	48 89 c7             	mov    rdi,rax
  80d0c5:	e8 95 fe ff ff       	call   80cf5f <sprintchar>
    while(p>0)
  80d0ca:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d0ce:	7f db                	jg     80d0ab <sprint_hex+0x59>
    }
}
  80d0d0:	90                   	nop
  80d0d1:	90                   	nop
  80d0d2:	c9                   	leave  
  80d0d3:	c3                   	ret    

000000000080d0d4 <sprintn>:
void sprintn(char *dist,char *str)
{
  80d0d4:	f3 0f 1e fa          	endbr64 
  80d0d8:	55                   	push   rbp
  80d0d9:	48 89 e5             	mov    rbp,rsp
  80d0dc:	48 83 ec 10          	sub    rsp,0x10
  80d0e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d0e4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80d0e8:	eb 20                	jmp    80d10a <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80d0ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d0ee:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d0f2:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80d0f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d0f9:	0f be d0             	movsx  edx,al
  80d0fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d100:	89 d6                	mov    esi,edx
  80d102:	48 89 c7             	mov    rdi,rax
  80d105:	e8 55 fe ff ff       	call   80cf5f <sprintchar>
    while(*str!='\0')
  80d10a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d10e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d111:	84 c0                	test   al,al
  80d113:	75 d5                	jne    80d0ea <sprintn+0x16>
    }
  80d115:	90                   	nop
  80d116:	90                   	nop
  80d117:	c9                   	leave  
  80d118:	c3                   	ret    
  80d119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

000000000080d120 <create_zero>:
  80d120:	e8 4c 71 ff ff       	call   804271 <req_proc>
  80d125:	83 f8 ff             	cmp    eax,0xffffffff
  80d128:	74 0c                	je     80d136 <create_zero.retu>
  80d12a:	e8 0e 72 ff ff       	call   80433d <set_proc>
  80d12f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80d133:	83 c4 40             	add    esp,0x40

000000000080d136 <create_zero.retu>:
  80d136:	c3                   	ret    

000000000080d137 <fill_desc>:
  80d137:	55                   	push   rbp
  80d138:	48 89 e5             	mov    rbp,rsp
  80d13b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80d13f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80d143:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80d147:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80d14b:	be 8a d2 80 00       	mov    esi,0x80d28a
  80d150:	c7 04 25 8a d2 80 00 	mov    DWORD PTR ds:0x80d28a,0x0
  80d157:	00 00 00 00 
  80d15b:	c7 04 25 8e d2 80 00 	mov    DWORD PTR ds:0x80d28e,0x0
  80d162:	00 00 00 00 
  80d166:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80d16a:	c1 e9 10             	shr    ecx,0x10
  80d16d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80d172:	c1 ea 10             	shr    edx,0x10
  80d175:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80d179:	66 c1 ea 08          	shr    dx,0x8
  80d17d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80d181:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80d186:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80d18a:	c1 e1 08             	shl    ecx,0x8
  80d18d:	09 cf                	or     edi,ecx
  80d18f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80d193:	8b 14 25 8a d2 80 00 	mov    edx,DWORD PTR ds:0x80d28a
  80d19a:	67 89 10             	mov    DWORD PTR [eax],edx
  80d19d:	8b 14 25 8e d2 80 00 	mov    edx,DWORD PTR ds:0x80d28e
  80d1a4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80d1a8:	c9                   	leave  
  80d1a9:	c3                   	ret    

000000000080d1aa <switch_proc_asm>:
  80d1aa:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80d1b0:	66 89 04 25 c8 d1 80 	mov    WORD PTR ds:0x80d1c8,ax
  80d1b7:	00 
  80d1b8:	c7 04 25 c4 d1 80 00 	mov    DWORD PTR ds:0x80d1c4,0x0
  80d1bf:	00 00 00 00 

000000000080d1c3 <switch_proc_asm.ljmp>:
  80d1c3:	ea                   	(bad)  
  80d1c4:	00 00                	add    BYTE PTR [rax],al
  80d1c6:	00 00                	add    BYTE PTR [rax],al
  80d1c8:	00 00                	add    BYTE PTR [rax],al
  80d1ca:	c3                   	ret    

000000000080d1cb <switch_to_old>:
  80d1cb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80d1d0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80d1d4:	bf 3c d2 80 00       	mov    edi,0x80d23c
  80d1d9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80d1dd:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80d1e1:	89 c1                	mov    ecx,eax
  80d1e3:	83 e9 04             	sub    ecx,0x4
  80d1e6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80d1e9:	50                   	push   rax
  80d1ea:	89 f5                	mov    ebp,esi
  80d1ec:	83 c5 28             	add    ebp,0x28
  80d1ef:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d1f3:	50                   	push   rax
  80d1f4:	83 c5 04             	add    ebp,0x4
  80d1f7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d1fb:	50                   	push   rax
  80d1fc:	83 c5 04             	add    ebp,0x4
  80d1ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d203:	50                   	push   rax
  80d204:	83 c5 04             	add    ebp,0x4
  80d207:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d20b:	50                   	push   rax
  80d20c:	83 c5 04             	add    ebp,0x4
  80d20f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d213:	50                   	push   rax
  80d214:	83 c5 04             	add    ebp,0x4
  80d217:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d21b:	50                   	push   rax
  80d21c:	83 c5 04             	add    ebp,0x4
  80d21f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d223:	50                   	push   rax
  80d224:	83 c5 04             	add    ebp,0x4
  80d227:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d22b:	50                   	push   rax
  80d22c:	83 c5 04             	add    ebp,0x4
  80d22f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80d233:	0f 22 d8             	mov    cr3,rax
  80d236:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80d23a:	50                   	push   rax
  80d23b:	5c                   	pop    rsp

000000000080d23c <switch_to_old.leap>:
  80d23c:	ea                   	(bad)  
  80d23d:	00 00                	add    BYTE PTR [rax],al
  80d23f:	00 00                	add    BYTE PTR [rax],al
  80d241:	08 00                	or     BYTE PTR [rax],al

000000000080d243 <save_context>:
  80d243:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80d248:	83 c0 44             	add    eax,0x44
  80d24b:	b9 08 00 00 00       	mov    ecx,0x8
  80d250:	89 e7                	mov    edi,esp

000000000080d252 <save_context.loops>:
  80d252:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80d255:	67 89 10             	mov    DWORD PTR [eax],edx
  80d258:	83 c7 04             	add    edi,0x4
  80d25b:	83 e8 04             	sub    eax,0x4
  80d25e:	e2 f2                	loop   80d252 <save_context.loops>
  80d260:	5b                   	pop    rbx
  80d261:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80d266:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80d26a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80d26f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80d273:	c3                   	ret    

000000000080d274 <move_to_user_mode>:
  80d274:	66 b8 20 00          	mov    ax,0x20
  80d278:	8e d8                	mov    ds,eax
  80d27a:	8e c0                	mov    es,eax
  80d27c:	8e e8                	mov    gs,eax
  80d27e:	6a 20                	push   0x20
  80d280:	54                   	push   rsp
  80d281:	6a 18                	push   0x18
  80d283:	68 89 d2 80 00       	push   0x80d289
  80d288:	cf                   	iret   

000000000080d289 <move_to_user_mode.done>:
  80d289:	c3                   	ret    

000000000080d28a <desc>:
	...

000000000080d292 <ret_sys_call>:
  80d292:	58                   	pop    rax
  80d293:	8e d8                	mov    ds,eax
  80d295:	58                   	pop    rax
  80d296:	8e c0                	mov    es,eax
  80d298:	41 5f                	pop    r15
  80d29a:	41 5e                	pop    r14
  80d29c:	41 5d                	pop    r13
  80d29e:	41 5c                	pop    r12
  80d2a0:	41 5b                	pop    r11
  80d2a2:	41 5a                	pop    r10
  80d2a4:	41 59                	pop    r9
  80d2a6:	41 58                	pop    r8
  80d2a8:	5e                   	pop    rsi
  80d2a9:	5f                   	pop    rdi
  80d2aa:	5a                   	pop    rdx
  80d2ab:	59                   	pop    rcx
  80d2ac:	5b                   	pop    rbx
  80d2ad:	58                   	pop    rax

000000000080d2ae <tmp>:
  80d2ae:	48 0f 07             	sysretq 

000000000080d2b1 <ret_normal_proc>:
  80d2b1:	58                   	pop    rax
  80d2b2:	8e d8                	mov    ds,eax
  80d2b4:	58                   	pop    rax
  80d2b5:	8e c0                	mov    es,eax
  80d2b7:	41 5f                	pop    r15
  80d2b9:	41 5e                	pop    r14
  80d2bb:	41 5d                	pop    r13
  80d2bd:	41 5c                	pop    r12
  80d2bf:	41 5b                	pop    r11
  80d2c1:	41 5a                	pop    r10
  80d2c3:	41 59                	pop    r9
  80d2c5:	41 58                	pop    r8
  80d2c7:	5e                   	pop    rsi
  80d2c8:	5f                   	pop    rdi
  80d2c9:	5a                   	pop    rdx
  80d2ca:	59                   	pop    rcx
  80d2cb:	5b                   	pop    rbx
  80d2cc:	58                   	pop    rax
  80d2cd:	c3                   	ret    
