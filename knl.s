
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
  100093:	b8 18 08 80 00       	mov    eax,0x800818
  100098:	ea                   	(bad)  
  100099:	18 08                	sbb    BYTE PTR [rax],cl
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
  800194:	b8 0f 12 80 00       	mov    eax,0x80120f
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
  800217:	b8 64 69 80 00       	mov    eax,0x806964
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 d0 4a 80 00       	mov    eax,0x804ad0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 90 78 80 00       	mov    eax,0x807890
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 b0 54 80 00       	mov    eax,0x8054b0
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
  800291:	e8 aa 45 00 00       	call   804840 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 9b 45 00 00       	call   804840 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 8c 45 00 00       	call   804840 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 7d 45 00 00       	call   804840 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 6e 45 00 00       	call   804840 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 5f 45 00 00       	call   804840 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 50 45 00 00       	call   804840 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 41 45 00 00       	call   804840 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 71 45 00 00       	call   80487a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 b0 54 80 00       	mov    eax,0x8054b0
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 d0 04 00 00       	call   8007ee <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 bc 04 00 00       	call   8007ee <wrmsr>
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
  800350:	48 8b 15 c9 ad 00 00 	mov    rdx,QWORD PTR [rip+0xadc9]        # 80b120 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d a5 ad 00 00 	mov    rcx,QWORD PTR [rip+0xada5]        # 80b120 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 85 ad 00 00 	mov    rdx,QWORD PTR [rip+0xad85]        # 80b120 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 6d ad 00 00 	mov    rdx,QWORD PTR [rip+0xad6d]        # 80b120 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 50 ad 00 00 	mov    rdx,QWORD PTR [rip+0xad50]        # 80b120 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 36 ad 00 00 	mov    rdx,QWORD PTR [rip+0xad36]        # 80b120 <idt>
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
  80040d:	e8 5c 44 00 00       	call   80486e <eoi>
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
  800427:	e8 42 44 00 00       	call   80486e <eoi>
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
  800441:	e8 28 44 00 00       	call   80486e <eoi>
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
  80045b:	e8 0e 44 00 00       	call   80486e <eoi>
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
  800475:	e8 f4 43 00 00       	call   80486e <eoi>
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
  80048f:	e8 da 43 00 00       	call   80486e <eoi>
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
  8004a8:	e8 c1 43 00 00       	call   80486e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 e2 43 00 00       	call   804899 <report_back_trace_of_err>
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
  8004cd:	e8 9c 43 00 00       	call   80486e <eoi>
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
  8004e7:	e8 82 43 00 00       	call   80486e <eoi>
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
  800500:	e8 69 43 00 00       	call   80486e <eoi>
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
  800519:	e8 50 43 00 00       	call   80486e <eoi>
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
  800533:	e8 36 43 00 00       	call   80486e <eoi>
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
  80054d:	e8 1c 43 00 00       	call   80486e <eoi>
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
  800571:	e8 f8 42 00 00       	call   80486e <eoi>
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
  80058e:	e8 db 42 00 00       	call   80486e <eoi>
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
    switch (a)
  8005be:	83 7d ec 64          	cmp    DWORD PTR [rbp-0x14],0x64
  8005c2:	0f 87 24 02 00 00    	ja     8007ec <syscall+0x252>
  8005c8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005cb:	48 8b 04 c5 60 28 81 	mov    rax,QWORD PTR [rax*8+0x812860]
  8005d2:	00 
  8005d3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005d6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005d9:	48 98                	cdqe   
  8005db:	48 89 c7             	mov    rdi,rax
  8005de:	e8 ea 1d 00 00       	call   8023cd <reg_device>
  8005e3:	e9 04 02 00 00       	jmp    8007ec <syscall+0x252>
        case 1:return dispose_device(a);
  8005e8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005eb:	89 c7                	mov    edi,eax
  8005ed:	e8 3a 28 00 00       	call   802e2c <dispose_device>
  8005f2:	e9 f5 01 00 00       	jmp    8007ec <syscall+0x252>
        case 2:return reg_driver(a);
  8005f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005fa:	48 98                	cdqe   
  8005fc:	48 89 c7             	mov    rdi,rax
  8005ff:	e8 b1 20 00 00       	call   8026b5 <reg_driver>
  800604:	e9 e3 01 00 00       	jmp    8007ec <syscall+0x252>
        case 3:return dispose_driver(a);
  800609:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80060c:	48 98                	cdqe   
  80060e:	48 89 c7             	mov    rdi,rax
  800611:	e8 b4 28 00 00       	call   802eca <dispose_driver>
  800616:	e9 d1 01 00 00       	jmp    8007ec <syscall+0x252>
        case 4:return call_drv_func(a,b,c);
  80061b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80061e:	48 98                	cdqe   
  800620:	48 89 c2             	mov    rdx,rax
  800623:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800626:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800629:	89 ce                	mov    esi,ecx
  80062b:	89 c7                	mov    edi,eax
  80062d:	e8 a3 25 00 00       	call   802bd5 <call_drv_func>
  800632:	e9 b5 01 00 00       	jmp    8007ec <syscall+0x252>
        case 5:return req_page_at(a,b);
  800637:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80063a:	48 98                	cdqe   
  80063c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80063f:	89 d6                	mov    esi,edx
  800641:	48 89 c7             	mov    rdi,rax
  800644:	e8 28 11 00 00       	call   801771 <req_page_at>
  800649:	e9 9e 01 00 00       	jmp    8007ec <syscall+0x252>
        case 6:return free_page(a);
  80064e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800651:	48 98                	cdqe   
  800653:	48 89 c7             	mov    rdi,rax
  800656:	e8 23 0f 00 00       	call   80157e <free_page>
  80065b:	e9 8c 01 00 00       	jmp    8007ec <syscall+0x252>
        case 7:return reg_proc(a, b, c);
  800660:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800663:	48 98                	cdqe   
  800665:	48 89 c2             	mov    rdx,rax
  800668:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80066b:	48 98                	cdqe   
  80066d:	48 89 c1             	mov    rcx,rax
  800670:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800673:	48 98                	cdqe   
  800675:	48 89 ce             	mov    rsi,rcx
  800678:	48 89 c7             	mov    rdi,rax
  80067b:	e8 13 3b 00 00       	call   804193 <reg_proc>
  800680:	e9 67 01 00 00       	jmp    8007ec <syscall+0x252>
        case 8:del_proc(a);
  800685:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 cf 38 00 00       	call   803f5e <del_proc>
        case 10:chk_vm(a,b);
  80068f:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800692:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800695:	89 d6                	mov    esi,edx
  800697:	89 c7                	mov    edi,eax
  800699:	e8 ac 11 00 00       	call   80184a <chk_vm>
        case 11:return sys_open(a,b);
  80069e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a1:	48 98                	cdqe   
  8006a3:	48 89 c2             	mov    rdx,rax
  8006a6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006a9:	89 c6                	mov    esi,eax
  8006ab:	48 89 d7             	mov    rdi,rdx
  8006ae:	e8 93 58 00 00       	call   805f46 <sys_open>
  8006b3:	e9 34 01 00 00       	jmp    8007ec <syscall+0x252>
        case 12:return sys_close(a);
  8006b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006bb:	89 c7                	mov    edi,eax
  8006bd:	e8 9b 5b 00 00       	call   80625d <sys_close>
  8006c2:	e9 25 01 00 00       	jmp    8007ec <syscall+0x252>
        case 13:return sys_read(a,b,c);
  8006c7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006ca:	48 63 d0             	movsxd rdx,eax
  8006cd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006d0:	48 98                	cdqe   
  8006d2:	48 89 c1             	mov    rcx,rax
  8006d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006d8:	48 89 ce             	mov    rsi,rcx
  8006db:	89 c7                	mov    edi,eax
  8006dd:	e8 33 5c 00 00       	call   806315 <sys_read>
  8006e2:	e9 05 01 00 00       	jmp    8007ec <syscall+0x252>
        case 14:return sys_write(a,b,c);
  8006e7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006ea:	48 63 d0             	movsxd rdx,eax
  8006ed:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006f0:	48 98                	cdqe   
  8006f2:	48 89 c1             	mov    rcx,rax
  8006f5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006f8:	48 89 ce             	mov    rsi,rcx
  8006fb:	89 c7                	mov    edi,eax
  8006fd:	e8 c3 5c 00 00       	call   8063c5 <sys_write>
  800702:	e9 e5 00 00 00       	jmp    8007ec <syscall+0x252>
        case 15:return sys_lseek(a,b,c);
  800707:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80070a:	48 63 c8             	movsxd rcx,eax
  80070d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800710:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800713:	48 89 ce             	mov    rsi,rcx
  800716:	89 c7                	mov    edi,eax
  800718:	e8 58 5d 00 00       	call   806475 <sys_lseek>
  80071d:	e9 ca 00 00 00       	jmp    8007ec <syscall+0x252>
        case 16:return sys_tell(a);
  800722:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800725:	89 c7                	mov    edi,eax
  800727:	e8 02 15 00 00       	call   801c2e <sys_tell>
  80072c:	e9 bb 00 00 00       	jmp    8007ec <syscall+0x252>
        case 17:return reg_vol(a,b,c);
  800731:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800734:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  800737:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80073a:	89 ce                	mov    esi,ecx
  80073c:	89 c7                	mov    edi,eax
  80073e:	b8 00 00 00 00       	mov    eax,0x0
  800743:	e8 db 13 00 00       	call   801b23 <reg_vol>
  800748:	e9 9f 00 00 00       	jmp    8007ec <syscall+0x252>
        case 18:return free_vol(a);
  80074d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800750:	89 c7                	mov    edi,eax
  800752:	b8 00 00 00 00       	mov    eax,0x0
  800757:	e8 ab 13 00 00       	call   801b07 <free_vol>
  80075c:	e9 8b 00 00 00       	jmp    8007ec <syscall+0x252>
        case 19:return sys_execve(a);
  800761:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800764:	48 98                	cdqe   
  800766:	48 89 c7             	mov    rdi,rax
  800769:	e8 b1 43 00 00       	call   804b1f <sys_execve>
  80076e:	eb 7c                	jmp    8007ec <syscall+0x252>
        case SYSCALL_EXIT:return sys_exit(a);
  800770:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800773:	89 c7                	mov    edi,eax
  800775:	e8 f1 39 00 00       	call   80416b <sys_exit>
  80077a:	eb 70                	jmp    8007ec <syscall+0x252>
        case SYSCALL_CALL:return exec_call(a);
  80077c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80077f:	48 98                	cdqe   
  800781:	48 89 c7             	mov    rdi,rax
  800784:	e8 94 44 00 00       	call   804c1d <exec_call>
  800789:	eb 61                	jmp    8007ec <syscall+0x252>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  80078b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80078e:	89 c7                	mov    edi,eax
  800790:	e8 13 12 00 00       	call   8019a8 <sys_mkfifo>
  800795:	eb 55                	jmp    8007ec <syscall+0x252>
        case SYSCALL_MALLOC:return sys_malloc(a);
  800797:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80079a:	89 c7                	mov    edi,eax
  80079c:	e8 f4 3b 00 00       	call   804395 <sys_malloc>
  8007a1:	eb 49                	jmp    8007ec <syscall+0x252>
        case SYSCALL_FREE:return sys_free(a);
  8007a3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a6:	89 c7                	mov    edi,eax
  8007a8:	e8 8f 3d 00 00       	call   80453c <sys_free>
  8007ad:	eb 3d                	jmp    8007ec <syscall+0x252>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007af:	b8 00 00 00 00       	mov    eax,0x0
  8007b4:	e8 bf 62 00 00       	call   806a78 <sys_getkbc>
  8007b9:	0f be c0             	movsx  eax,al
  8007bc:	eb 2e                	jmp    8007ec <syscall+0x252>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007c1:	48 98                	cdqe   
  8007c3:	48 89 c7             	mov    rdi,rax
  8007c6:	e8 3a 20 00 00       	call   802805 <sys_find_dev>
  8007cb:	eb 1f                	jmp    8007ec <syscall+0x252>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(a,b,c);
  8007cd:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8007d0:	48 98                	cdqe   
  8007d2:	48 89 c2             	mov    rdx,rax
  8007d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d8:	48 98                	cdqe   
  8007da:	48 89 c1             	mov    rcx,rax
  8007dd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007e0:	89 c6                	mov    esi,eax
  8007e2:	48 89 cf             	mov    rdi,rcx
  8007e5:	e8 ad 20 00 00       	call   802897 <sys_operate_dev>
  8007ea:	eb 00                	jmp    8007ec <syscall+0x252>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");

}
  8007ec:	c9                   	leave  
  8007ed:	c3                   	ret    

00000000008007ee <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  8007ee:	f3 0f 1e fa          	endbr64 
  8007f2:	55                   	push   rbp
  8007f3:	48 89 e5             	mov    rbp,rsp
  8007f6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8007fa:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  8007fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800802:	48 c1 e8 20          	shr    rax,0x20
  800806:	48 89 c2             	mov    rdx,rax
  800809:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80080d:	89 c0                	mov    eax,eax
  80080f:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  800813:	0f 30                	wrmsr  
  800815:	90                   	nop
  800816:	5d                   	pop    rbp
  800817:	c3                   	ret    

0000000000800818 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800818:	f3 0f 1e fa          	endbr64 
  80081c:	55                   	push   rbp
  80081d:	48 89 e5             	mov    rbp,rsp
  800820:	48 83 ec 60          	sub    rsp,0x60
  800824:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800827:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  80082b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800832:	00 
    mbi=(struct multiboot_header*)addr;
  800833:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800837:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  80083b:	b8 00 00 00 00       	mov    eax,0x0
  800840:	e8 54 03 00 00       	call   800b99 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  800845:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800849:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80084c:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80084f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800853:	48 83 c0 08          	add    rax,0x8
  800857:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80085b:	e9 5b 02 00 00       	jmp    800abb <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800860:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800864:	8b 00                	mov    eax,DWORD PTR [rax]
  800866:	83 f8 08             	cmp    eax,0x8
  800869:	0f 87 39 02 00 00    	ja     800aa8 <main+0x290>
  80086f:	89 c0                	mov    eax,eax
  800871:	48 8b 04 c5 c8 2b 81 	mov    rax,QWORD PTR [rax*8+0x812bc8]
  800878:	00 
  800879:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  80087c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800880:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800883:	89 c7                	mov    edi,eax
  800885:	e8 ed 07 00 00       	call   801077 <set_high_mem_base>
			break;
  80088a:	e9 19 02 00 00       	jmp    800aa8 <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  80088f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800893:	48 83 c0 10          	add    rax,0x10
  800897:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80089b:	eb 37                	jmp    8008d4 <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  80089d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008a1:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8008a4:	89 c2                	mov    edx,eax
  8008a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008aa:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8008ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008b5:	48 89 ce             	mov    rsi,rcx
  8008b8:	48 89 c7             	mov    rdi,rax
  8008bb:	e8 ce 07 00 00       	call   80108e <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008c4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008c7:	89 c2                	mov    edx,eax
  8008c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008cd:	48 01 d0             	add    rax,rdx
  8008d0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008d8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008db:	89 c2                	mov    edx,eax
  8008dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008e1:	48 01 d0             	add    rax,rdx
  8008e4:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008e8:	72 b3                	jb     80089d <main+0x85>
            }

		}
		break;
  8008ea:	e9 b9 01 00 00       	jmp    800aa8 <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008f3:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008f7:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008fe:	40 
			set_framebuffer(*tagfb);
  8008ff:	48 83 ec 08          	sub    rsp,0x8
  800903:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800907:	ff 70 20             	push   QWORD PTR [rax+0x20]
  80090a:	ff 70 18             	push   QWORD PTR [rax+0x18]
  80090d:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800910:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800913:	ff 30                	push   QWORD PTR [rax]
  800915:	e8 57 4d 00 00       	call   805671 <set_framebuffer>
  80091a:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80091e:	b8 00 00 00 00       	mov    eax,0x0
  800923:	e8 b4 4b 00 00       	call   8054dc <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800928:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80092c:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800930:	0f b6 c0             	movzx  eax,al
  800933:	83 f8 02             	cmp    eax,0x2
  800936:	0f 84 5a 01 00 00    	je     800a96 <main+0x27e>
  80093c:	83 f8 02             	cmp    eax,0x2
  80093f:	0f 8f 5a 01 00 00    	jg     800a9f <main+0x287>
  800945:	85 c0                	test   eax,eax
  800947:	74 0e                	je     800957 <main+0x13f>
  800949:	83 f8 01             	cmp    eax,0x1
  80094c:	0f 84 15 01 00 00    	je     800a67 <main+0x24f>
  800952:	e9 48 01 00 00       	jmp    800a9f <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  800957:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80095b:	48 83 c0 22          	add    rax,0x22
  80095f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800963:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  80096a:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800971:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800978:	e9 d4 00 00 00       	jmp    800a51 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  80097d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800980:	48 89 d0             	mov    rax,rdx
  800983:	48 01 c0             	add    rax,rax
  800986:	48 01 c2             	add    rdx,rax
  800989:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80098d:	48 01 d0             	add    rax,rdx
  800990:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800994:	0f b6 c0             	movzx  eax,al
  800997:	ba ff 00 00 00       	mov    edx,0xff
  80099c:	89 d1                	mov    ecx,edx
  80099e:	29 c1                	sub    ecx,eax
  8009a0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009a3:	48 89 d0             	mov    rax,rdx
  8009a6:	48 01 c0             	add    rax,rax
  8009a9:	48 01 c2             	add    rdx,rax
  8009ac:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009b0:	48 01 d0             	add    rax,rdx
  8009b3:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009b7:	0f b6 d0             	movzx  edx,al
  8009ba:	b8 ff 00 00 00       	mov    eax,0xff
  8009bf:	29 d0                	sub    eax,edx
  8009c1:	89 ce                	mov    esi,ecx
  8009c3:	0f af f0             	imul   esi,eax
  8009c6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009c9:	48 89 d0             	mov    rax,rdx
  8009cc:	48 01 c0             	add    rax,rax
  8009cf:	48 01 c2             	add    rdx,rax
  8009d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009d6:	48 01 d0             	add    rax,rdx
  8009d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009dc:	0f b6 c8             	movzx  ecx,al
  8009df:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009e2:	48 89 d0             	mov    rax,rdx
  8009e5:	48 01 c0             	add    rax,rax
  8009e8:	48 01 c2             	add    rdx,rax
  8009eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ef:	48 01 d0             	add    rax,rdx
  8009f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009f5:	0f b6 c0             	movzx  eax,al
  8009f8:	0f af c1             	imul   eax,ecx
  8009fb:	01 c6                	add    esi,eax
  8009fd:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a00:	48 89 d0             	mov    rax,rdx
  800a03:	48 01 c0             	add    rax,rax
  800a06:	48 01 c2             	add    rdx,rax
  800a09:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a0d:	48 01 d0             	add    rax,rdx
  800a10:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a14:	0f b6 c8             	movzx  ecx,al
  800a17:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a1a:	48 89 d0             	mov    rax,rdx
  800a1d:	48 01 c0             	add    rax,rax
  800a20:	48 01 c2             	add    rdx,rax
  800a23:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a27:	48 01 d0             	add    rax,rdx
  800a2a:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a2e:	0f b6 c0             	movzx  eax,al
  800a31:	0f af c1             	imul   eax,ecx
  800a34:	01 f0                	add    eax,esi
  800a36:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a39:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a3c:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a3f:	73 0c                	jae    800a4d <main+0x235>
					{
						color = i;
  800a41:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a44:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a47:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a4a:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a4d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a51:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a55:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a59:	0f b7 c0             	movzx  eax,ax
  800a5c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a5f:	0f 82 18 ff ff ff    	jb     80097d <main+0x165>
					}
				}
			}
			break;
  800a65:	eb 40                	jmp    800aa7 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a67:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a6b:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a6f:	0f b6 c0             	movzx  eax,al
  800a72:	ba 01 00 00 00       	mov    edx,0x1
  800a77:	89 c1                	mov    ecx,eax
  800a79:	d3 e2                	shl    edx,cl
  800a7b:	89 d0                	mov    eax,edx
  800a7d:	8d 50 ff             	lea    edx,[rax-0x1]
  800a80:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a84:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a88:	0f b6 c0             	movzx  eax,al
  800a8b:	89 c1                	mov    ecx,eax
  800a8d:	d3 e2                	shl    edx,cl
  800a8f:	89 d0                	mov    eax,edx
  800a91:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a94:	eb 11                	jmp    800aa7 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a96:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a9d:	eb 08                	jmp    800aa7 <main+0x28f>

			default:
				color = 0xffffffff;
  800a9f:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800aa6:	90                   	nop
			}

			break;
  800aa7:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800aa8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800aac:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800aaf:	83 c0 07             	add    eax,0x7
  800ab2:	89 c0                	mov    eax,eax
  800ab4:	83 e0 f8             	and    eax,0xfffffff8
  800ab7:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800abb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800abf:	8b 00                	mov    eax,DWORD PTR [rax]
  800ac1:	85 c0                	test   eax,eax
  800ac3:	0f 85 97 fd ff ff    	jne    800860 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800ac9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800acd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800ad0:	83 c0 07             	add    eax,0x7
  800ad3:	89 c0                	mov    eax,eax
  800ad5:	83 e0 f8             	and    eax,0xfffffff8
  800ad8:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800adc:	b8 75 04 00 00       	mov    eax,0x475
  800ae1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ae4:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800ae7:	b8 00 00 00 00       	mov    eax,0x0
  800aec:	e8 aa 4a 00 00       	call   80559b <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800af1:	bf 88 2b 81 00       	mov    edi,0x812b88
  800af6:	e8 39 4f 00 00       	call   805a34 <print>
    init_int();
  800afb:	b8 00 00 00 00       	mov    eax,0x0
  800b00:	e8 fb f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b05:	bf a5 2b 81 00       	mov    edi,0x812ba5
  800b0a:	e8 25 4f 00 00       	call   805a34 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b0f:	b8 00 00 00 00       	mov    eax,0x0
  800b14:	e8 2c 08 00 00       	call   801345 <init_memory>
    init_com(PORT_COM1);
  800b19:	bf f8 03 00 00       	mov    edi,0x3f8
  800b1e:	e8 c1 9a 00 00       	call   80a5e4 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b23:	be f8 03 00 00       	mov    esi,0x3f8
  800b28:	bf b2 2b 81 00       	mov    edi,0x812bb2
  800b2d:	e8 fe 9b 00 00       	call   80a730 <com_puts>
	init_paging();
  800b32:	b8 00 00 00 00       	mov    eax,0x0
  800b37:	e8 30 05 00 00       	call   80106c <init_paging>
 	init_gdt();
  800b3c:	b8 00 00 00 00       	mov    eax,0x0
  800b41:	e8 77 3d 00 00       	call   8048bd <init_gdt>
    init_drvdev_man();
  800b46:	b8 00 00 00 00       	mov    eax,0x0
  800b4b:	e8 63 18 00 00       	call   8023b3 <init_drvdev_man>
    init_proc();
  800b50:	b8 00 00 00 00       	mov    eax,0x0
  800b55:	e8 44 27 00 00       	call   80329e <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b5a:	b8 00 00 00 00       	mov    eax,0x0
  800b5f:	e8 e1 5d 00 00       	call   806945 <init_kb>
//    init_disk();

    sti();
  800b64:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b65:	b8 00 00 00 00       	mov    eax,0x0
  800b6a:	e8 db 90 00 00       	call   809c4a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b6f:	c7 05 af a5 00 00 00 	mov    DWORD PTR [rip+0xa5af],0x0        # 80b128 <manage_proc_lock>
  800b76:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c=sys_getkbc();
  800b79:	b8 00 00 00 00       	mov    eax,0x0
  800b7e:	e8 f5 5e 00 00       	call   806a78 <sys_getkbc>
  800b83:	88 45 da             	mov    BYTE PTR [rbp-0x26],al
        if(c!=-1)
  800b86:	80 7d da ff          	cmp    BYTE PTR [rbp-0x26],0xff
  800b8a:	74 ed                	je     800b79 <main+0x361>
            putchar(c);
  800b8c:	0f be 45 da          	movsx  eax,BYTE PTR [rbp-0x26]
  800b90:	89 c7                	mov    edi,eax
  800b92:	e8 41 01 00 00       	call   800cd8 <putchar>
    {
  800b97:	eb e0                	jmp    800b79 <main+0x361>

0000000000800b99 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b99:	f3 0f 1e fa          	endbr64 
  800b9d:	55                   	push   rbp
  800b9e:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800ba1:	48 c7 05 54 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff454],0xb8000        # 400000 <video>
  800ba8:	00 80 0b 00 
    xpos=0;
  800bac:	c7 05 52 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff452],0x0        # 400008 <xpos>
  800bb3:	00 00 00 
    ypos=0;
  800bb6:	c7 05 4c f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff44c],0x0        # 40000c <ypos>
  800bbd:	00 00 00 
}
  800bc0:	90                   	nop
  800bc1:	5d                   	pop    rbp
  800bc2:	c3                   	ret    

0000000000800bc3 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800bc3:	f3 0f 1e fa          	endbr64 
  800bc7:	55                   	push   rbp
  800bc8:	48 89 e5             	mov    rbp,rsp
  800bcb:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800bcf:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bd2:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bd5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bd9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bdd:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800be0:	48 98                	cdqe   
  800be2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800be6:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bed:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bf1:	75 27                	jne    800c1a <itoa+0x57>
  800bf3:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800bf7:	79 21                	jns    800c1a <itoa+0x57>
    {
        *p++ = '-';
  800bf9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bfd:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c01:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c05:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c08:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c0d:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c10:	f7 d8                	neg    eax
  800c12:	48 98                	cdqe   
  800c14:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c18:	eb 0d                	jmp    800c27 <itoa+0x64>
    }
    else if (base == 'x')
  800c1a:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c1e:	75 07                	jne    800c27 <itoa+0x64>
        divisor = 16;
  800c20:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c27:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c2a:	48 63 c8             	movsxd rcx,eax
  800c2d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c31:	ba 00 00 00 00       	mov    edx,0x0
  800c36:	48 f7 f1             	div    rcx
  800c39:	48 89 d0             	mov    rax,rdx
  800c3c:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c3f:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c43:	7f 0a                	jg     800c4f <itoa+0x8c>
  800c45:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c48:	83 c0 30             	add    eax,0x30
  800c4b:	89 c1                	mov    ecx,eax
  800c4d:	eb 08                	jmp    800c57 <itoa+0x94>
  800c4f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c52:	83 c0 57             	add    eax,0x57
  800c55:	89 c1                	mov    ecx,eax
  800c57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c5b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c5f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c63:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c65:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c68:	48 63 f0             	movsxd rsi,eax
  800c6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c6f:	ba 00 00 00 00       	mov    edx,0x0
  800c74:	48 f7 f6             	div    rsi
  800c77:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c7b:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c80:	75 a5                	jne    800c27 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c86:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c89:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c8d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c95:	48 83 e8 01          	sub    rax,0x1
  800c99:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c9d:	eb 2b                	jmp    800cca <itoa+0x107>
    {
        char tmp = *p1;
  800c9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ca3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ca6:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800ca9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cad:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800cb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cb4:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800cb6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cba:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800cbe:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800cc0:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800cc5:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800cca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cce:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cd2:	72 cb                	jb     800c9f <itoa+0xdc>
    }
}
  800cd4:	90                   	nop
  800cd5:	90                   	nop
  800cd6:	5d                   	pop    rbp
  800cd7:	c3                   	ret    

0000000000800cd8 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800cd8:	f3 0f 1e fa          	endbr64 
  800cdc:	55                   	push   rbp
  800cdd:	48 89 e5             	mov    rbp,rsp
  800ce0:	48 83 ec 20          	sub    rsp,0x20
  800ce4:	89 f8                	mov    eax,edi
  800ce6:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800ce9:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800ced:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800cf0:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800cf4:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800cf8:	48 89 c7             	mov    rdi,rax
  800cfb:	e8 34 4d 00 00       	call   805a34 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d00:	c9                   	leave  
  800d01:	c3                   	ret    

0000000000800d02 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d02:	f3 0f 1e fa          	endbr64 
  800d06:	55                   	push   rbp
  800d07:	48 89 e5             	mov    rbp,rsp
  800d0a:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d11:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d18:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d1f:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d26:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d2d:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d34:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d3b:	84 c0                	test   al,al
  800d3d:	74 20                	je     800d5f <printf+0x5d>
  800d3f:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d43:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d47:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d4b:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d4f:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d53:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d57:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d5b:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d5f:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d66:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d6d:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d74:	08 
 
    while ((c = *format++) != 0)
  800d75:	e9 29 01 00 00       	jmp    800ea3 <printf+0x1a1>
    {
        if (c != '%')
  800d7a:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d81:	74 13                	je     800d96 <printf+0x94>
            putchar (c);
  800d83:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d8a:	89 c7                	mov    edi,eax
  800d8c:	e8 47 ff ff ff       	call   800cd8 <putchar>
  800d91:	e9 0d 01 00 00       	jmp    800ea3 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d96:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d9d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800da1:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800da8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dab:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800db1:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800db8:	83 f8 78             	cmp    eax,0x78
  800dbb:	74 26                	je     800de3 <printf+0xe1>
  800dbd:	83 f8 78             	cmp    eax,0x78
  800dc0:	0f 8f be 00 00 00    	jg     800e84 <printf+0x182>
  800dc6:	83 f8 75             	cmp    eax,0x75
  800dc9:	74 18                	je     800de3 <printf+0xe1>
  800dcb:	83 f8 75             	cmp    eax,0x75
  800dce:	0f 8f b0 00 00 00    	jg     800e84 <printf+0x182>
  800dd4:	83 f8 64             	cmp    eax,0x64
  800dd7:	74 0a                	je     800de3 <printf+0xe1>
  800dd9:	83 f8 73             	cmp    eax,0x73
  800ddc:	74 41                	je     800e1f <printf+0x11d>
  800dde:	e9 a1 00 00 00       	jmp    800e84 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800de3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dea:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dee:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800df5:	8b 10                	mov    edx,DWORD PTR [rax]
  800df7:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800dfe:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e05:	89 ce                	mov    esi,ecx
  800e07:	48 89 c7             	mov    rdi,rax
  800e0a:	e8 b4 fd ff ff       	call   800bc3 <itoa>
                p = buf;
  800e0f:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e16:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e1d:	eb 34                	jmp    800e53 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e1f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e26:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e2a:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e31:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e34:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e3b:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e42:	00 
  800e43:	75 0d                	jne    800e52 <printf+0x150>
                    p = "(null)";
  800e45:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812c10
  800e4c:	10 2c 81 00 
  800e50:	eb 22                	jmp    800e74 <printf+0x172>
 
string:
  800e52:	90                   	nop
                while (*p)
  800e53:	eb 1f                	jmp    800e74 <printf+0x172>
                    putchar (*p++);
  800e55:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e5c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e60:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e67:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e6a:	0f be c0             	movsx  eax,al
  800e6d:	89 c7                	mov    edi,eax
  800e6f:	e8 64 fe ff ff       	call   800cd8 <putchar>
                while (*p)
  800e74:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e7e:	84 c0                	test   al,al
  800e80:	75 d3                	jne    800e55 <printf+0x153>
                break;
  800e82:	eb 1f                	jmp    800ea3 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e84:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e8b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e8f:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e96:	8b 00                	mov    eax,DWORD PTR [rax]
  800e98:	0f be c0             	movsx  eax,al
  800e9b:	89 c7                	mov    edi,eax
  800e9d:	e8 36 fe ff ff       	call   800cd8 <putchar>
                break;
  800ea2:	90                   	nop
    while ((c = *format++) != 0)
  800ea3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800eaa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800eae:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800eb5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800eb8:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ebe:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800ec5:	0f 85 af fe ff ff    	jne    800d7a <printf+0x78>
            }
        }
    }
}
  800ecb:	90                   	nop
  800ecc:	90                   	nop
  800ecd:	c9                   	leave  
  800ece:	c3                   	ret    

0000000000800ecf <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ecf:	f3 0f 1e fa          	endbr64 
  800ed3:	55                   	push   rbp
  800ed4:	48 89 e5             	mov    rbp,rsp
  800ed7:	48 83 ec 40          	sub    rsp,0x40
  800edb:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800edf:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ee3:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ee6:	48 8b 15 53 a2 00 00 	mov    rdx,QWORD PTR [rip+0xa253]        # 80b140 <pml4>
  800eed:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ef1:	48 c1 e8 27          	shr    rax,0x27
  800ef5:	48 c1 e0 03          	shl    rax,0x3
  800ef9:	48 01 d0             	add    rax,rdx
  800efc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eff:	b0 00                	mov    al,0x0
  800f01:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f05:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f0c:	00 00 00 
  800f0f:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f13:	48 c1 e8 1e          	shr    rax,0x1e
  800f17:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f1a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f1d:	48 98                	cdqe   
  800f1f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f26:	00 
  800f27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f2b:	48 01 d0             	add    rax,rdx
  800f2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f39:	83 e0 01             	and    eax,0x1
  800f3c:	48 85 c0             	test   rax,rax
  800f3f:	75 45                	jne    800f86 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f41:	b8 00 00 00 00       	mov    eax,0x0
  800f46:	e8 cf 01 00 00       	call   80111a <vmalloc>
  800f4b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f53:	ba 00 10 00 00       	mov    edx,0x1000
  800f58:	be 00 00 00 00       	mov    esi,0x0
  800f5d:	48 89 c7             	mov    rdi,rax
  800f60:	e8 bb 98 00 00       	call   80a820 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f65:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f68:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f6c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f6f:	48 98                	cdqe   
  800f71:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f78:	00 
  800f79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f7d:	48 01 f0             	add    rax,rsi
  800f80:	48 09 ca             	or     rdx,rcx
  800f83:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f8a:	b0 00                	mov    al,0x0
  800f8c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f90:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f94:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f99:	48 c1 e8 15          	shr    rax,0x15
  800f9d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fa4:	00 
  800fa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fa9:	48 01 d0             	add    rax,rdx
  800fac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800faf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fb3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fb7:	83 e0 01             	and    eax,0x1
  800fba:	48 85 c0             	test   rax,rax
  800fbd:	75 4d                	jne    80100c <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fbf:	b8 00 00 00 00       	mov    eax,0x0
  800fc4:	e8 51 01 00 00       	call   80111a <vmalloc>
  800fc9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fcd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fd1:	ba 00 10 00 00       	mov    edx,0x1000
  800fd6:	be 00 00 00 00       	mov    esi,0x0
  800fdb:	48 89 c7             	mov    rdi,rax
  800fde:	e8 3d 98 00 00       	call   80a820 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fe3:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fe6:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fee:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800ff3:	48 c1 e8 15          	shr    rax,0x15
  800ff7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800ffe:	00 
  800fff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801003:	48 01 f0             	add    rax,rsi
  801006:	48 09 ca             	or     rdx,rcx
  801009:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  80100c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801010:	b0 00                	mov    al,0x0
  801012:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  801016:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801019:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80101d:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801023:	48 c1 ea 0c          	shr    rdx,0xc
  801027:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  80102e:	00 
  80102f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801033:	48 01 ca             	add    rdx,rcx
  801036:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80103a:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  80103d:	b8 00 00 00 00       	mov    eax,0x0
}
  801042:	c9                   	leave  
  801043:	c3                   	ret    

0000000000801044 <mdemap>:

stat_t mdemap(addr_t la)
{
  801044:	f3 0f 1e fa          	endbr64 
  801048:	55                   	push   rbp
  801049:	48 89 e5             	mov    rbp,rsp
  80104c:	48 83 ec 10          	sub    rsp,0x10
  801050:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801054:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801058:	ba 00 00 00 00       	mov    edx,0x0
  80105d:	48 89 c6             	mov    rsi,rax
  801060:	bf 00 00 00 00       	mov    edi,0x0
  801065:	e8 65 fe ff ff       	call   800ecf <mmap>
}
  80106a:	c9                   	leave  
  80106b:	c3                   	ret    

000000000080106c <init_paging>:
int init_paging()
{
  80106c:	f3 0f 1e fa          	endbr64 
  801070:	55                   	push   rbp
  801071:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801074:	90                   	nop
  801075:	5d                   	pop    rbp
  801076:	c3                   	ret    

0000000000801077 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801077:	f3 0f 1e fa          	endbr64 
  80107b:	55                   	push   rbp
  80107c:	48 89 e5             	mov    rbp,rsp
  80107f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801082:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801085:	89 05 cd a0 00 00    	mov    DWORD PTR [rip+0xa0cd],eax        # 80b158 <high_mem_base>
}
  80108b:	90                   	nop
  80108c:	5d                   	pop    rbp
  80108d:	c3                   	ret    

000000000080108e <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80108e:	f3 0f 1e fa          	endbr64 
  801092:	55                   	push   rbp
  801093:	48 89 e5             	mov    rbp,rsp
  801096:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80109a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80109e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8010a2:	8b 05 78 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff178]        # 400220 <mmap_t_i>
  8010a8:	48 63 d0             	movsxd rdx,eax
  8010ab:	48 89 d0             	mov    rax,rdx
  8010ae:	48 01 c0             	add    rax,rax
  8010b1:	48 01 d0             	add    rax,rdx
  8010b4:	48 c1 e0 03          	shl    rax,0x3
  8010b8:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8010bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010c3:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010c6:	8b 05 54 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff154]        # 400220 <mmap_t_i>
  8010cc:	48 63 d0             	movsxd rdx,eax
  8010cf:	48 89 d0             	mov    rax,rdx
  8010d2:	48 01 c0             	add    rax,rax
  8010d5:	48 01 d0             	add    rax,rdx
  8010d8:	48 c1 e0 03          	shl    rax,0x3
  8010dc:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010e7:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010ea:	8b 05 30 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff130]        # 400220 <mmap_t_i>
  8010f0:	8d 50 01             	lea    edx,[rax+0x1]
  8010f3:	89 15 27 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff127],edx        # 400220 <mmap_t_i>
  8010f9:	48 63 d0             	movsxd rdx,eax
  8010fc:	48 89 d0             	mov    rax,rdx
  8010ff:	48 01 c0             	add    rax,rax
  801102:	48 01 d0             	add    rax,rdx
  801105:	48 c1 e0 03          	shl    rax,0x3
  801109:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801110:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801114:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  801117:	90                   	nop
  801118:	5d                   	pop    rbp
  801119:	c3                   	ret    

000000000080111a <vmalloc>:
addr_t vmalloc()
{
  80111a:	f3 0f 1e fa          	endbr64 
  80111e:	55                   	push   rbp
  80111f:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801122:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801129:	eb 76                	jmp    8011a1 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80112b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801132:	eb 63                	jmp    801197 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801134:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801137:	48 98                	cdqe   
  801139:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801140:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801143:	be 01 00 00 00       	mov    esi,0x1
  801148:	89 c1                	mov    ecx,eax
  80114a:	d3 e6                	shl    esi,cl
  80114c:	89 f0                	mov    eax,esi
  80114e:	21 d0                	and    eax,edx
  801150:	85 c0                	test   eax,eax
  801152:	75 3f                	jne    801193 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801154:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801157:	48 98                	cdqe   
  801159:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801160:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801163:	be 01 00 00 00       	mov    esi,0x1
  801168:	89 c1                	mov    ecx,eax
  80116a:	d3 e6                	shl    esi,cl
  80116c:	89 f0                	mov    eax,esi
  80116e:	09 c2                	or     edx,eax
  801170:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801173:	48 98                	cdqe   
  801175:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80117c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80117f:	c1 e0 05             	shl    eax,0x5
  801182:	89 c2                	mov    edx,eax
  801184:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801187:	01 d0                	add    eax,edx
  801189:	83 c0 20             	add    eax,0x20
  80118c:	c1 e0 0c             	shl    eax,0xc
  80118f:	48 98                	cdqe   
  801191:	eb 14                	jmp    8011a7 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801193:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801197:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80119b:	7e 97                	jle    801134 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80119d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011a1:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011a5:	7e 84                	jle    80112b <vmalloc+0x11>
            }
        }
    }
}
  8011a7:	5d                   	pop    rbp
  8011a8:	c3                   	ret    

00000000008011a9 <vmfree>:

int vmfree(addr_t ptr)
{
  8011a9:	f3 0f 1e fa          	endbr64 
  8011ad:	55                   	push   rbp
  8011ae:	48 89 e5             	mov    rbp,rsp
  8011b1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011b9:	48 c1 e8 0c          	shr    rax,0xc
  8011bd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011c3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011c6:	85 c0                	test   eax,eax
  8011c8:	0f 48 c2             	cmovs  eax,edx
  8011cb:	c1 f8 05             	sar    eax,0x5
  8011ce:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011d4:	99                   	cdq    
  8011d5:	c1 ea 1b             	shr    edx,0x1b
  8011d8:	01 d0                	add    eax,edx
  8011da:	83 e0 1f             	and    eax,0x1f
  8011dd:	29 d0                	sub    eax,edx
  8011df:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011e2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011e5:	48 98                	cdqe   
  8011e7:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011ee:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011f1:	be 01 00 00 00       	mov    esi,0x1
  8011f6:	89 c1                	mov    ecx,eax
  8011f8:	d3 e6                	shl    esi,cl
  8011fa:	89 f0                	mov    eax,esi
  8011fc:	f7 d0                	not    eax
  8011fe:	21 c2                	and    edx,eax
  801200:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801203:	48 98                	cdqe   
  801205:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  80120c:	90                   	nop
  80120d:	5d                   	pop    rbp
  80120e:	c3                   	ret    

000000000080120f <page_err>:
void page_err(){
  80120f:	f3 0f 1e fa          	endbr64 
  801213:	55                   	push   rbp
  801214:	48 89 e5             	mov    rbp,rsp
  801217:	53                   	push   rbx
  801218:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  80121c:	fa                   	cli    
    print("page err\n");
  80121d:	bf 18 2c 81 00       	mov    edi,0x812c18
  801222:	e8 0d 48 00 00       	call   805a34 <print>
    unsigned long err_code=0,l_addr=0;
  801227:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80122e:	00 
  80122f:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801236:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801237:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80123b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80123f:	0f 20 d0             	mov    rax,cr2
  801242:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801246:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80124a:	83 e0 01             	and    eax,0x1
  80124d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801250:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801254:	75 27                	jne    80127d <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801256:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80125a:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801260:	48 89 c3             	mov    rbx,rax
  801263:	b8 00 00 00 00       	mov    eax,0x0
  801268:	e8 ad fe ff ff       	call   80111a <vmalloc>
  80126d:	ba 07 00 00 00       	mov    edx,0x7
  801272:	48 89 de             	mov    rsi,rbx
  801275:	48 89 c7             	mov    rdi,rax
  801278:	e8 52 fc ff ff       	call   800ecf <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  80127d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801281:	83 e0 02             	and    eax,0x2
  801284:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801287:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80128b:	74 0c                	je     801299 <page_err+0x8a>
  80128d:	bf 22 2c 81 00       	mov    edi,0x812c22
  801292:	e8 9d 47 00 00       	call   805a34 <print>
  801297:	eb 0a                	jmp    8012a3 <page_err+0x94>
    p=err_code&4;
  801299:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80129d:	83 e0 04             	and    eax,0x4
  8012a0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8012a3:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012a7:	75 0c                	jne    8012b5 <page_err+0xa6>
  8012a9:	bf 30 2c 81 00       	mov    edi,0x812c30
  8012ae:	e8 81 47 00 00       	call   805a34 <print>
  8012b3:	eb 0a                	jmp    8012bf <page_err+0xb0>
    p=err_code&16;
  8012b5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012b9:	83 e0 10             	and    eax,0x10
  8012bc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8012bf:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012c3:	74 0a                	je     8012cf <page_err+0xc0>
  8012c5:	bf 48 2c 81 00       	mov    edi,0x812c48
  8012ca:	e8 65 47 00 00       	call   805a34 <print>
    unsigned int addr=0;
  8012cf:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012d6:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  8012da:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8012dd:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8012e1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012e4:	89 c6                	mov    esi,eax
  8012e6:	bf 68 2c 81 00       	mov    edi,0x812c68
  8012eb:	b8 00 00 00 00       	mov    eax,0x0
  8012f0:	e8 0d fa ff ff       	call   800d02 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012f5:	48 8b 0d a4 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc071a4]        # 4084a0 <task>
  8012fc:	8b 05 2a 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1322a]        # 41452c <cur_proc>
  801302:	48 63 d0             	movsxd rdx,eax
  801305:	48 89 d0             	mov    rax,rdx
  801308:	48 01 c0             	add    rax,rax
  80130b:	48 01 d0             	add    rax,rdx
  80130e:	48 c1 e0 08          	shl    rax,0x8
  801312:	48 01 c8             	add    rax,rcx
  801315:	8b 00                	mov    eax,DWORD PTR [rax]
  801317:	83 f8 01             	cmp    eax,0x1
  80131a:	75 11                	jne    80132d <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  80131c:	bf 8a 2c 81 00       	mov    edi,0x812c8a
  801321:	b8 00 00 00 00       	mov    eax,0x0
  801326:	e8 d7 f9 ff ff       	call   800d02 <printf>
        asm volatile("jmp .");
  80132b:	eb fe                	jmp    80132b <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80132d:	b8 00 00 00 00       	mov    eax,0x0
  801332:	e8 37 35 00 00       	call   80486e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%esp \n iretq");
  801337:	fb                   	sti    
  801338:	c9                   	leave  
  801339:	83 c4 08             	add    esp,0x8
  80133c:	48 cf                	iretq  
}
  80133e:	90                   	nop
  80133f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801343:	c9                   	leave  
  801344:	c3                   	ret    

0000000000801345 <init_memory>:
void init_memory()
{
  801345:	f3 0f 1e fa          	endbr64 
  801349:	55                   	push   rbp
  80134a:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80134d:	8b 05 cd ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeecd]        # 400220 <mmap_t_i>
  801353:	83 e8 01             	sub    eax,0x1
  801356:	48 63 d0             	movsxd rdx,eax
  801359:	48 89 d0             	mov    rax,rdx
  80135c:	48 01 c0             	add    rax,rax
  80135f:	48 01 d0             	add    rax,rdx
  801362:	48 c1 e0 03          	shl    rax,0x3
  801366:	48 05 40 00 40 00    	add    rax,0x400040
  80136c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80136f:	8b 05 ab ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeeab]        # 400220 <mmap_t_i>
  801375:	83 e8 01             	sub    eax,0x1
  801378:	48 63 d0             	movsxd rdx,eax
  80137b:	48 89 d0             	mov    rax,rdx
  80137e:	48 01 c0             	add    rax,rax
  801381:	48 01 d0             	add    rax,rdx
  801384:	48 c1 e0 03          	shl    rax,0x3
  801388:	48 05 48 00 40 00    	add    rax,0x400048
  80138e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801391:	48 01 c8             	add    rax,rcx
  801394:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801398:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80139c:	48 c1 e8 0c          	shr    rax,0xc
  8013a0:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8013a3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8013a6:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013a9:	85 c0                	test   eax,eax
  8013ab:	0f 48 c2             	cmovs  eax,edx
  8013ae:	c1 f8 05             	sar    eax,0x5
  8013b1:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8013b4:	48 c7 05 61 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec61],0xc00000        # 400020 <page_map>
  8013bb:	00 00 c0 00 
    int* p=page_map;
  8013bf:	48 8b 05 5a ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec5a]        # 400020 <page_map>
  8013c6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8013ca:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013d1:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013d2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8013d9:	e9 91 00 00 00       	jmp    80146f <init_memory+0x12a>
        int cont=0;
  8013de:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8013e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013e8:	48 63 d0             	movsxd rdx,eax
  8013eb:	48 89 d0             	mov    rax,rdx
  8013ee:	48 01 c0             	add    rax,rax
  8013f1:	48 01 d0             	add    rax,rdx
  8013f4:	48 c1 e0 03          	shl    rax,0x3
  8013f8:	48 05 50 00 40 00    	add    rax,0x400050
  8013fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801401:	48 83 f8 01          	cmp    rax,0x1
  801405:	74 07                	je     80140e <init_memory+0xc9>
            cont=-1;
  801407:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80140e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801415:	eb 15                	jmp    80142c <init_memory+0xe7>
            *(p++)=cont;
  801417:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80141b:	48 8d 50 04          	lea    rdx,[rax+0x4]
  80141f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  801423:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801426:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801428:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80142c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80142f:	48 63 c8             	movsxd rcx,eax
  801432:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801435:	48 63 d0             	movsxd rdx,eax
  801438:	48 89 d0             	mov    rax,rdx
  80143b:	48 01 c0             	add    rax,rax
  80143e:	48 01 d0             	add    rax,rdx
  801441:	48 c1 e0 03          	shl    rax,0x3
  801445:	48 05 48 00 40 00    	add    rax,0x400048
  80144b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80144e:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801455:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80145c:	ff 00 00 
  80145f:	48 21 d0             	and    rax,rdx
  801462:	48 c1 e8 11          	shr    rax,0x11
  801466:	48 39 c1             	cmp    rcx,rax
  801469:	72 ac                	jb     801417 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  80146b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80146f:	8b 05 ab ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedab]        # 400220 <mmap_t_i>
  801475:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801478:	0f 8c 60 ff ff ff    	jl     8013de <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80147e:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801485:	eb 1d                	jmp    8014a4 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801487:	48 8b 15 92 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb92]        # 400020 <page_map>
  80148e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801491:	48 98                	cdqe   
  801493:	48 c1 e0 02          	shl    rax,0x2
  801497:	48 01 d0             	add    rax,rdx
  80149a:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8014a0:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8014a4:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8014a8:	7e dd                	jle    801487 <init_memory+0x142>
    }
}
  8014aa:	90                   	nop
  8014ab:	90                   	nop
  8014ac:	5d                   	pop    rbp
  8014ad:	c3                   	ret    

00000000008014ae <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8014ae:	f3 0f 1e fa          	endbr64 
  8014b2:	55                   	push   rbp
  8014b3:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014b6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8014bd:	e9 b0 00 00 00       	jmp    801572 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8014c2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8014c9:	e9 96 00 00 00       	jmp    801564 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8014ce:	48 8b 15 4b eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb4b]        # 400020 <page_map>
  8014d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014d8:	48 98                	cdqe   
  8014da:	48 c1 e0 02          	shl    rax,0x2
  8014de:	48 01 d0             	add    rax,rdx
  8014e1:	8b 10                	mov    edx,DWORD PTR [rax]
  8014e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014e6:	be 01 00 00 00       	mov    esi,0x1
  8014eb:	89 c1                	mov    ecx,eax
  8014ed:	d3 e6                	shl    esi,cl
  8014ef:	89 f0                	mov    eax,esi
  8014f1:	21 d0                	and    eax,edx
  8014f3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8014f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014f9:	c1 e0 05             	shl    eax,0x5
  8014fc:	89 c2                	mov    edx,eax
  8014fe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801501:	01 d0                	add    eax,edx
  801503:	c1 e0 0c             	shl    eax,0xc
  801506:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80150b:	7e 53                	jle    801560 <req_a_page+0xb2>
  80150d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801511:	75 4d                	jne    801560 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801513:	48 8b 15 06 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb06]        # 400020 <page_map>
  80151a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80151d:	48 98                	cdqe   
  80151f:	48 c1 e0 02          	shl    rax,0x2
  801523:	48 01 d0             	add    rax,rdx
  801526:	8b 10                	mov    edx,DWORD PTR [rax]
  801528:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80152b:	be 01 00 00 00       	mov    esi,0x1
  801530:	89 c1                	mov    ecx,eax
  801532:	d3 e6                	shl    esi,cl
  801534:	89 f0                	mov    eax,esi
  801536:	89 c6                	mov    esi,eax
  801538:	48 8b 0d e1 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeae1]        # 400020 <page_map>
  80153f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801542:	48 98                	cdqe   
  801544:	48 c1 e0 02          	shl    rax,0x2
  801548:	48 01 c8             	add    rax,rcx
  80154b:	09 f2                	or     edx,esi
  80154d:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  80154f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801552:	c1 e0 05             	shl    eax,0x5
  801555:	89 c2                	mov    edx,eax
  801557:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80155a:	01 d0                	add    eax,edx
  80155c:	48 98                	cdqe   
  80155e:	eb 1c                	jmp    80157c <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801560:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801564:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801568:	0f 8e 60 ff ff ff    	jle    8014ce <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80156e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801572:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801576:	0f 8e 46 ff ff ff    	jle    8014c2 <req_a_page+0x14>

            }
        }
    }
}
  80157c:	5d                   	pop    rbp
  80157d:	c3                   	ret    

000000000080157e <free_page>:

int free_page(char *paddr){
  80157e:	f3 0f 1e fa          	endbr64 
  801582:	55                   	push   rbp
  801583:	48 89 e5             	mov    rbp,rsp
  801586:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80158a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80158e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801594:	85 c0                	test   eax,eax
  801596:	0f 48 c2             	cmovs  eax,edx
  801599:	c1 f8 0c             	sar    eax,0xc
  80159c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80159f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015a2:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015a5:	85 c0                	test   eax,eax
  8015a7:	0f 48 c2             	cmovs  eax,edx
  8015aa:	c1 f8 05             	sar    eax,0x5
  8015ad:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8015b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015b3:	99                   	cdq    
  8015b4:	c1 ea 1b             	shr    edx,0x1b
  8015b7:	01 d0                	add    eax,edx
  8015b9:	83 e0 1f             	and    eax,0x1f
  8015bc:	29 d0                	sub    eax,edx
  8015be:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8015c1:	48 8b 15 58 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea58]        # 400020 <page_map>
  8015c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015cb:	48 98                	cdqe   
  8015cd:	48 c1 e0 02          	shl    rax,0x2
  8015d1:	48 01 d0             	add    rax,rdx
  8015d4:	8b 10                	mov    edx,DWORD PTR [rax]
  8015d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015d9:	be 01 00 00 00       	mov    esi,0x1
  8015de:	89 c1                	mov    ecx,eax
  8015e0:	d3 e6                	shl    esi,cl
  8015e2:	89 f0                	mov    eax,esi
  8015e4:	f7 d0                	not    eax
  8015e6:	89 c6                	mov    esi,eax
  8015e8:	48 8b 0d 31 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea31]        # 400020 <page_map>
  8015ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015f2:	48 98                	cdqe   
  8015f4:	48 c1 e0 02          	shl    rax,0x2
  8015f8:	48 01 c8             	add    rax,rcx
  8015fb:	21 f2                	and    edx,esi
  8015fd:	89 10                	mov    DWORD PTR [rax],edx
}
  8015ff:	90                   	nop
  801600:	5d                   	pop    rbp
  801601:	c3                   	ret    

0000000000801602 <check_page>:
int check_page(int num){
  801602:	f3 0f 1e fa          	endbr64 
  801606:	55                   	push   rbp
  801607:	48 89 e5             	mov    rbp,rsp
  80160a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80160d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801610:	8d 50 1f             	lea    edx,[rax+0x1f]
  801613:	85 c0                	test   eax,eax
  801615:	0f 48 c2             	cmovs  eax,edx
  801618:	c1 f8 05             	sar    eax,0x5
  80161b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  80161e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801621:	99                   	cdq    
  801622:	c1 ea 1b             	shr    edx,0x1b
  801625:	01 d0                	add    eax,edx
  801627:	83 e0 1f             	and    eax,0x1f
  80162a:	29 d0                	sub    eax,edx
  80162c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  80162f:	48 8b 15 ea e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9ea]        # 400020 <page_map>
  801636:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801639:	48 98                	cdqe   
  80163b:	48 c1 e0 02          	shl    rax,0x2
  80163f:	48 01 d0             	add    rax,rdx
  801642:	8b 10                	mov    edx,DWORD PTR [rax]
  801644:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801647:	be 01 00 00 00       	mov    esi,0x1
  80164c:	89 c1                	mov    ecx,eax
  80164e:	d3 e6                	shl    esi,cl
  801650:	89 f0                	mov    eax,esi
  801652:	21 d0                	and    eax,edx
  801654:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801657:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80165a:	5d                   	pop    rbp
  80165b:	c3                   	ret    

000000000080165c <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80165c:	f3 0f 1e fa          	endbr64 
  801660:	55                   	push   rbp
  801661:	48 89 e5             	mov    rbp,rsp
  801664:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801667:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80166a:	c1 e0 0c             	shl    eax,0xc
}
  80166d:	5d                   	pop    rbp
  80166e:	c3                   	ret    

000000000080166f <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80166f:	f3 0f 1e fa          	endbr64 
  801673:	55                   	push   rbp
  801674:	48 89 e5             	mov    rbp,rsp
  801677:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80167b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80167e:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801681:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801685:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80168c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801690:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801693:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801696:	89 c0                	mov    eax,eax
  801698:	25 00 f0 ff ff       	and    eax,0xfffff000
  80169d:	48 09 c2             	or     rdx,rax
  8016a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016a4:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8016a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016ab:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016ae:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8016b1:	48 98                	cdqe   
  8016b3:	48 09 c2             	or     rdx,rax
  8016b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016ba:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016bd:	90                   	nop
  8016be:	5d                   	pop    rbp
  8016bf:	c3                   	ret    

00000000008016c0 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8016c0:	f3 0f 1e fa          	endbr64 
  8016c4:	55                   	push   rbp
  8016c5:	48 89 e5             	mov    rbp,rsp
  8016c8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016cc:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016cf:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016e4:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016e7:	0c 81                	or     al,0x81
  8016e9:	89 c0                	mov    eax,eax
  8016eb:	48 09 c2             	or     rdx,rax
  8016ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016f2:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016f5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016f8:	25 00 00 00 c0       	and    eax,0xc0000000
  8016fd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801700:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801704:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801707:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80170a:	48 09 c2             	or     rdx,rax
  80170d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801711:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801714:	90                   	nop
  801715:	5d                   	pop    rbp
  801716:	c3                   	ret    

0000000000801717 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  801717:	f3 0f 1e fa          	endbr64 
  80171b:	55                   	push   rbp
  80171c:	48 89 e5             	mov    rbp,rsp
  80171f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801723:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801726:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  801729:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80172d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  801734:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801738:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80173b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80173e:	0d 81 10 00 00       	or     eax,0x1081
  801743:	48 98                	cdqe   
  801745:	48 09 c2             	or     rdx,rax
  801748:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80174c:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  80174f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801752:	25 00 00 c0 ff       	and    eax,0xffc00000
  801757:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80175a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80175e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801761:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801764:	48 09 c2             	or     rdx,rax
  801767:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80176b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80176e:	90                   	nop
  80176f:	5d                   	pop    rbp
  801770:	c3                   	ret    

0000000000801771 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801771:	f3 0f 1e fa          	endbr64 
  801775:	55                   	push   rbp
  801776:	48 89 e5             	mov    rbp,rsp
  801779:	48 83 ec 20          	sub    rsp,0x20
  80177d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801781:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801784:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801789:	75 18                	jne    8017a3 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80178b:	b8 00 00 00 00       	mov    eax,0x0
  801790:	e8 19 fd ff ff       	call   8014ae <req_a_page>
  801795:	89 c7                	mov    edi,eax
  801797:	e8 c0 fe ff ff       	call   80165c <get_phyaddr>
  80179c:	48 98                	cdqe   
  80179e:	e9 a5 00 00 00       	jmp    801848 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8017a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017a7:	89 c2                	mov    edx,eax
  8017a9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8017ac:	89 c6                	mov    esi,eax
  8017ae:	89 d7                	mov    edi,edx
  8017b0:	e8 52 01 00 00       	call   801907 <is_pgs_ava>
  8017b5:	85 c0                	test   eax,eax
  8017b7:	75 0c                	jne    8017c5 <req_page_at+0x54>
  8017b9:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8017c0:	e9 83 00 00 00       	jmp    801848 <req_page_at+0xd7>
    int pgni=base/4096;
  8017c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017c9:	48 c1 e8 0c          	shr    rax,0xc
  8017cd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017d3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017d6:	85 c0                	test   eax,eax
  8017d8:	0f 48 c2             	cmovs  eax,edx
  8017db:	c1 f8 05             	sar    eax,0x5
  8017de:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017e4:	99                   	cdq    
  8017e5:	c1 ea 1b             	shr    edx,0x1b
  8017e8:	01 d0                	add    eax,edx
  8017ea:	83 e0 1f             	and    eax,0x1f
  8017ed:	29 d0                	sub    eax,edx
  8017ef:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017f9:	eb 40                	jmp    80183b <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8017fb:	48 8b 15 1e e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe81e]        # 400020 <page_map>
  801802:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801805:	48 98                	cdqe   
  801807:	48 c1 e0 02          	shl    rax,0x2
  80180b:	48 01 d0             	add    rax,rdx
  80180e:	8b 10                	mov    edx,DWORD PTR [rax]
  801810:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801813:	be 01 00 00 00       	mov    esi,0x1
  801818:	89 c1                	mov    ecx,eax
  80181a:	d3 e6                	shl    esi,cl
  80181c:	89 f0                	mov    eax,esi
  80181e:	89 c6                	mov    esi,eax
  801820:	48 8b 0d f9 e7 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe7f9]        # 400020 <page_map>
  801827:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80182a:	48 98                	cdqe   
  80182c:	48 c1 e0 02          	shl    rax,0x2
  801830:	48 01 c8             	add    rax,rcx
  801833:	09 f2                	or     edx,esi
  801835:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801837:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80183b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80183e:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801841:	7c b8                	jl     8017fb <req_page_at+0x8a>
    }
    return 0;
  801843:	b8 00 00 00 00       	mov    eax,0x0

}
  801848:	c9                   	leave  
  801849:	c3                   	ret    

000000000080184a <chk_vm>:
int chk_vm(int base, int pgn)
{
  80184a:	f3 0f 1e fa          	endbr64 
  80184e:	55                   	push   rbp
  80184f:	48 89 e5             	mov    rbp,rsp
  801852:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801855:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801858:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80185f:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801860:	0f 20 d8             	mov    rax,cr3
  801863:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801867:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80186a:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801870:	85 c0                	test   eax,eax
  801872:	0f 48 c2             	cmovs  eax,edx
  801875:	c1 f8 15             	sar    eax,0x15
  801878:	48 98                	cdqe   
  80187a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801881:	00 
  801882:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801886:	48 01 d0             	add    rax,rdx
  801889:	8b 00                	mov    eax,DWORD PTR [rax]
  80188b:	89 c0                	mov    eax,eax
  80188d:	25 00 f0 ff ff       	and    eax,0xfffff000
  801892:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801896:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801899:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  80189f:	85 c0                	test   eax,eax
  8018a1:	0f 48 c2             	cmovs  eax,edx
  8018a4:	c1 f8 15             	sar    eax,0x15
  8018a7:	48 98                	cdqe   
  8018a9:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018b0:	00 
  8018b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b5:	48 01 d0             	add    rax,rdx
  8018b8:	8b 00                	mov    eax,DWORD PTR [rax]
  8018ba:	83 e0 01             	and    eax,0x1
  8018bd:	85 c0                	test   eax,eax
  8018bf:	74 38                	je     8018f9 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  8018c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018c4:	99                   	cdq    
  8018c5:	c1 ea 0b             	shr    edx,0xb
  8018c8:	01 d0                	add    eax,edx
  8018ca:	25 ff ff 1f 00       	and    eax,0x1fffff
  8018cf:	29 d0                	sub    eax,edx
  8018d1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018d7:	85 c0                	test   eax,eax
  8018d9:	0f 48 c2             	cmovs  eax,edx
  8018dc:	c1 f8 0c             	sar    eax,0xc
  8018df:	48 98                	cdqe   
  8018e1:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018e8:	00 
  8018e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018ed:	48 01 d0             	add    rax,rdx
  8018f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8018f2:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018f5:	85 c0                	test   eax,eax
  8018f7:	75 07                	jne    801900 <chk_vm+0xb6>
    {
        return -1;
  8018f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018fe:	eb 05                	jmp    801905 <chk_vm+0xbb>
    }
    return 0;
  801900:	b8 00 00 00 00       	mov    eax,0x0
}
  801905:	5d                   	pop    rbp
  801906:	c3                   	ret    

0000000000801907 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801907:	f3 0f 1e fa          	endbr64 
  80190b:	55                   	push   rbp
  80190c:	48 89 e5             	mov    rbp,rsp
  80190f:	48 83 ec 18          	sub    rsp,0x18
  801913:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801916:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801919:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80191c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801922:	85 c0                	test   eax,eax
  801924:	0f 48 c2             	cmovs  eax,edx
  801927:	c1 f8 0c             	sar    eax,0xc
  80192a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  80192d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801934:	eb 1e                	jmp    801954 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801936:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801939:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80193c:	01 d0                	add    eax,edx
  80193e:	89 c7                	mov    edi,eax
  801940:	e8 bd fc ff ff       	call   801602 <check_page>
  801945:	85 c0                	test   eax,eax
  801947:	74 07                	je     801950 <is_pgs_ava+0x49>
  801949:	b8 00 00 00 00       	mov    eax,0x0
  80194e:	eb 11                	jmp    801961 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801950:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801954:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801957:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80195a:	7c da                	jl     801936 <is_pgs_ava+0x2f>
    }
    return 1;
  80195c:	b8 01 00 00 00       	mov    eax,0x1

}
  801961:	c9                   	leave  
  801962:	c3                   	ret    

0000000000801963 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801963:	f3 0f 1e fa          	endbr64 
  801967:	55                   	push   rbp
  801968:	48 89 e5             	mov    rbp,rsp
  80196b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80196f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801973:	c6 05 c6 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8c6],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80197a:	c6 05 c0 e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8c0],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801981:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801985:	48 89 05 bc e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8bc],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  80198c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801990:	48 89 05 b9 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8b9],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801997:	c7 05 bf e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8bf],0x1        # 400260 <vols+0x20>
  80199e:	00 00 00 
    return 0;
  8019a1:	b8 00 00 00 00       	mov    eax,0x0
}
  8019a6:	5d                   	pop    rbp
  8019a7:	c3                   	ret    

00000000008019a8 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8019a8:	f3 0f 1e fa          	endbr64 
  8019ac:	55                   	push   rbp
  8019ad:	48 89 e5             	mov    rbp,rsp
  8019b0:	48 83 ec 20          	sub    rsp,0x20
  8019b4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8019b7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019be:	eb 38                	jmp    8019f8 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c3:	48 98                	cdqe   
  8019c5:	48 c1 e0 04          	shl    rax,0x4
  8019c9:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019cf:	8b 00                	mov    eax,DWORD PTR [rax]
  8019d1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019d4:	75 1e                	jne    8019f4 <sys_mkfifo+0x4c>
  8019d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019d9:	48 98                	cdqe   
  8019db:	48 c1 e0 04          	shl    rax,0x4
  8019df:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019e5:	8b 00                	mov    eax,DWORD PTR [rax]
  8019e7:	83 f8 01             	cmp    eax,0x1
  8019ea:	75 08                	jne    8019f4 <sys_mkfifo+0x4c>
            return i;
  8019ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019ef:	e9 a6 00 00 00       	jmp    801a9a <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019f4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019f8:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019fc:	7e c2                	jle    8019c0 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019fe:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801a05:	e9 81 00 00 00       	jmp    801a8b <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801a0a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a0d:	48 98                	cdqe   
  801a0f:	48 c1 e0 04          	shl    rax,0x4
  801a13:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a19:	8b 00                	mov    eax,DWORD PTR [rax]
  801a1b:	85 c0                	test   eax,eax
  801a1d:	75 68                	jne    801a87 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801a1f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a22:	48 98                	cdqe   
  801a24:	48 c1 e0 04          	shl    rax,0x4
  801a28:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a2e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a34:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a37:	48 98                	cdqe   
  801a39:	48 c1 e0 04          	shl    rax,0x4
  801a3d:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a44:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a47:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a49:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a4c:	48 98                	cdqe   
  801a4e:	48 c1 e0 04          	shl    rax,0x4
  801a52:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a58:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a5e:	b8 00 00 00 00       	mov    eax,0x0
  801a63:	e8 46 fa ff ff       	call   8014ae <req_a_page>
  801a68:	89 c7                	mov    edi,eax
  801a6a:	e8 ed fb ff ff       	call   80165c <get_phyaddr>
  801a6f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a72:	48 63 d2             	movsxd rdx,edx
  801a75:	48 c1 e2 04          	shl    rdx,0x4
  801a79:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a80:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a82:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a85:	eb 13                	jmp    801a9a <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a87:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a8b:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a8f:	0f 8e 75 ff ff ff    	jle    801a0a <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a95:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a9a:	c9                   	leave  
  801a9b:	c3                   	ret    

0000000000801a9c <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a9c:	f3 0f 1e fa          	endbr64 
  801aa0:	55                   	push   rbp
  801aa1:	48 89 e5             	mov    rbp,rsp
  801aa4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801aa7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801aae:	eb 4a                	jmp    801afa <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801ab0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ab3:	48 98                	cdqe   
  801ab5:	48 c1 e0 04          	shl    rax,0x4
  801ab9:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801abf:	8b 00                	mov    eax,DWORD PTR [rax]
  801ac1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ac4:	75 30                	jne    801af6 <sys_rmfifo+0x5a>
  801ac6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ac9:	48 98                	cdqe   
  801acb:	48 c1 e0 04          	shl    rax,0x4
  801acf:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ad5:	8b 00                	mov    eax,DWORD PTR [rax]
  801ad7:	83 f8 01             	cmp    eax,0x1
  801ada:	75 1a                	jne    801af6 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801adc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801adf:	48 98                	cdqe   
  801ae1:	48 c1 e0 04          	shl    rax,0x4
  801ae5:	48 05 68 1e 40 00    	add    rax,0x401e68
  801aeb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801af1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801af4:	eb 0f                	jmp    801b05 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801af6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801afa:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801afe:	7e b0                	jle    801ab0 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801b00:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b05:	5d                   	pop    rbp
  801b06:	c3                   	ret    

0000000000801b07 <free_vol>:
int free_vol(int voli)
{
  801b07:	f3 0f 1e fa          	endbr64 
  801b0b:	55                   	push   rbp
  801b0c:	48 89 e5             	mov    rbp,rsp
  801b0f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801b12:	c7 05 44 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe744],0x0        # 400260 <vols+0x20>
  801b19:	00 00 00 
    return 0;
  801b1c:	b8 00 00 00 00       	mov    eax,0x0
}
  801b21:	5d                   	pop    rbp
  801b22:	c3                   	ret    

0000000000801b23 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801b23:	f3 0f 1e fa          	endbr64 
  801b27:	55                   	push   rbp
  801b28:	48 89 e5             	mov    rbp,rsp
  801b2b:	48 83 ec 20          	sub    rsp,0x20
  801b2f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b32:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b35:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b39:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b40:	e9 d8 00 00 00       	jmp    801c1d <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b48:	48 63 d0             	movsxd rdx,eax
  801b4b:	48 89 d0             	mov    rax,rdx
  801b4e:	48 c1 e0 02          	shl    rax,0x2
  801b52:	48 01 d0             	add    rax,rdx
  801b55:	48 c1 e0 03          	shl    rax,0x3
  801b59:	48 05 60 02 40 00    	add    rax,0x400260
  801b5f:	8b 00                	mov    eax,DWORD PTR [rax]
  801b61:	85 c0                	test   eax,eax
  801b63:	0f 85 b0 00 00 00    	jne    801c19 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b6c:	48 63 d0             	movsxd rdx,eax
  801b6f:	48 89 d0             	mov    rax,rdx
  801b72:	48 c1 e0 02          	shl    rax,0x2
  801b76:	48 01 d0             	add    rax,rdx
  801b79:	48 c1 e0 03          	shl    rax,0x3
  801b7d:	48 05 60 02 40 00    	add    rax,0x400260
  801b83:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b89:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b8c:	48 63 d0             	movsxd rdx,eax
  801b8f:	48 89 d0             	mov    rax,rdx
  801b92:	48 01 c0             	add    rax,rax
  801b95:	48 01 d0             	add    rax,rdx
  801b98:	48 c1 e0 03          	shl    rax,0x3
  801b9c:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801ba3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ba6:	48 63 d0             	movsxd rdx,eax
  801ba9:	48 89 d0             	mov    rax,rdx
  801bac:	48 c1 e0 02          	shl    rax,0x2
  801bb0:	48 01 d0             	add    rax,rdx
  801bb3:	48 c1 e0 03          	shl    rax,0x3
  801bb7:	48 05 58 02 40 00    	add    rax,0x400258
  801bbd:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801bc0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bc3:	89 c7                	mov    edi,eax
  801bc5:	e8 3d 13 00 00       	call   802f07 <get_drv>
  801bca:	48 89 c2             	mov    rdx,rax
  801bcd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bd0:	48 63 c8             	movsxd rcx,eax
  801bd3:	48 89 c8             	mov    rax,rcx
  801bd6:	48 c1 e0 02          	shl    rax,0x2
  801bda:	48 01 c8             	add    rax,rcx
  801bdd:	48 c1 e0 03          	shl    rax,0x3
  801be1:	48 05 48 02 40 00    	add    rax,0x400248
  801be7:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bed:	48 63 d0             	movsxd rdx,eax
  801bf0:	48 89 d0             	mov    rax,rdx
  801bf3:	48 c1 e0 02          	shl    rax,0x2
  801bf7:	48 01 d0             	add    rax,rdx
  801bfa:	48 c1 e0 03          	shl    rax,0x3
  801bfe:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c05:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801c09:	48 89 c6             	mov    rsi,rax
  801c0c:	48 89 d7             	mov    rdi,rdx
  801c0f:	e8 5b 8c 00 00       	call   80a86f <strcpy>
            return i;
  801c14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c17:	eb 13                	jmp    801c2c <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801c19:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c1d:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801c21:	0f 8e 1e ff ff ff    	jle    801b45 <reg_vol+0x22>
        }
    }
    return -1;
  801c27:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c2c:	c9                   	leave  
  801c2d:	c3                   	ret    

0000000000801c2e <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801c2e:	f3 0f 1e fa          	endbr64 
  801c32:	55                   	push   rbp
  801c33:	48 89 e5             	mov    rbp,rsp
  801c36:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801c39:	48 8b 05 60 28 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc12860]        # 4144a0 <current>
  801c40:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801c43:	48 63 d2             	movsxd rdx,edx
  801c46:	48 83 c2 18          	add    rdx,0x18
  801c4a:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  801c4f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801c53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801c57:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801c5a:	5d                   	pop    rbp
  801c5b:	c3                   	ret    

0000000000801c5c <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801c5c:	f3 0f 1e fa          	endbr64 
  801c60:	55                   	push   rbp
  801c61:	48 89 e5             	mov    rbp,rsp
  801c64:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801c67:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c6e:	eb 3f                	jmp    801caf <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801c70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c73:	48 63 d0             	movsxd rdx,eax
  801c76:	48 89 d0             	mov    rax,rdx
  801c79:	48 01 c0             	add    rax,rax
  801c7c:	48 01 d0             	add    rax,rdx
  801c7f:	48 c1 e0 05          	shl    rax,0x5
  801c83:	48 05 60 06 40 00    	add    rax,0x400660
  801c89:	8b 00                	mov    eax,DWORD PTR [rax]
  801c8b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c8e:	75 1b                	jne    801cab <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801c90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c93:	48 63 d0             	movsxd rdx,eax
  801c96:	48 89 d0             	mov    rax,rdx
  801c99:	48 01 c0             	add    rax,rax
  801c9c:	48 01 d0             	add    rax,rdx
  801c9f:	48 c1 e0 05          	shl    rax,0x5
  801ca3:	48 05 60 06 40 00    	add    rax,0x400660
  801ca9:	eb 0f                	jmp    801cba <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801cab:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801caf:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801cb3:	7e bb                	jle    801c70 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801cb5:	b8 00 00 00 00       	mov    eax,0x0
}
  801cba:	5d                   	pop    rbp
  801cbb:	c3                   	ret    

0000000000801cbc <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801cbc:	f3 0f 1e fa          	endbr64 
  801cc0:	55                   	push   rbp
  801cc1:	48 89 e5             	mov    rbp,rsp
  801cc4:	48 83 ec 10          	sub    rsp,0x10
  801cc8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801ccc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cd0:	48 89 c7             	mov    rdi,rax
  801cd3:	e8 a0 04 00 00       	call   802178 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801cd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cdc:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ce0:	84 c0                	test   al,al
  801ce2:	75 07                	jne    801ceb <brelse+0x2f>
  801ce4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ce9:	eb 32                	jmp    801d1d <brelse+0x61>
    bh->b_count--;
  801ceb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cef:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801cf3:	8d 50 ff             	lea    edx,[rax-0x1]
  801cf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cfa:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801cfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d01:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801d05:	84 c0                	test   al,al
  801d07:	75 0f                	jne    801d18 <brelse+0x5c>
        vmfree(bh->b_data);
  801d09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d0d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d10:	48 89 c7             	mov    rdi,rax
  801d13:	e8 91 f4 ff ff       	call   8011a9 <vmfree>
    return 0;
  801d18:	b8 00 00 00 00       	mov    eax,0x0
}
  801d1d:	c9                   	leave  
  801d1e:	c3                   	ret    

0000000000801d1f <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801d1f:	f3 0f 1e fa          	endbr64 
  801d23:	55                   	push   rbp
  801d24:	48 89 e5             	mov    rbp,rsp
  801d27:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801d2e:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801d34:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801d3a:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801d40:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801d46:	89 d6                	mov    esi,edx
  801d48:	89 c7                	mov    edi,eax
  801d4a:	e8 78 02 00 00       	call   801fc7 <get_buf>
  801d4f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801d53:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801d58:	75 09                	jne    801d63 <bread+0x44>
  801d5a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801d61:	eb 75                	jmp    801dd8 <bread+0xb9>
    if(!bh->b_uptodate)
  801d63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d67:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801d6b:	84 c0                	test   al,al
  801d6d:	75 65                	jne    801dd4 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801d6f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801d75:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801d78:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801d7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d83:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d86:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801d8c:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801d93:	02 00 00 
        arg.lba=bh->b_blocknr;
  801d96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d9a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801d9e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801da4:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801dab:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801dae:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801db5:	48 89 c7             	mov    rdi,rax
  801db8:	e8 71 11 00 00       	call   802f2e <make_request>
  801dbd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801dc0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801dc3:	89 c7                	mov    edi,eax
  801dc5:	e8 77 14 00 00       	call   803241 <wait_on_req>
        clear_req(reqi);
  801dca:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801dcd:	89 c7                	mov    edi,eax
  801dcf:	e8 9d 14 00 00       	call   803271 <clear_req>
    }
    return bh;
  801dd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801dd8:	c9                   	leave  
  801dd9:	c3                   	ret    

0000000000801dda <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801dda:	f3 0f 1e fa          	endbr64 
  801dde:	55                   	push   rbp
  801ddf:	48 89 e5             	mov    rbp,rsp
  801de2:	48 83 ec 40          	sub    rsp,0x40
  801de6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801dea:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801dee:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801df1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801df5:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801df8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801dfb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801dff:	48 89 c7             	mov    rdi,rax
  801e02:	e8 80 01 00 00       	call   801f87 <get_according_bnr>
  801e07:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801e0a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801e0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e10:	89 d6                	mov    esi,edx
  801e12:	89 c7                	mov    edi,eax
  801e14:	e8 06 ff ff ff       	call   801d1f <bread>
  801e19:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801e1d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801e20:	ba 00 02 00 00       	mov    edx,0x200
  801e25:	39 d0                	cmp    eax,edx
  801e27:	0f 4f c2             	cmovg  eax,edx
  801e2a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801e2d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801e34:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801e37:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801e3b:	48 89 ce             	mov    rsi,rcx
  801e3e:	48 89 c7             	mov    rdi,rax
  801e41:	e8 2b 89 00 00       	call   80a771 <memcpy>
        len-=BLOCK_SIZE;
  801e46:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801e4d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e51:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801e54:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e57:	01 c2                	add    edx,eax
  801e59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e5d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  801e60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801e64:	48 89 c7             	mov    rdi,rax
  801e67:	e8 50 fe ff ff       	call   801cbc <brelse>
    }while(len>0);
  801e6c:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801e70:	7f 89                	jg     801dfb <vfs_read_file+0x21>
    return 0;
  801e72:	b8 00 00 00 00       	mov    eax,0x0
}
  801e77:	c9                   	leave  
  801e78:	c3                   	ret    

0000000000801e79 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  801e79:	f3 0f 1e fa          	endbr64 
  801e7d:	55                   	push   rbp
  801e7e:	48 89 e5             	mov    rbp,rsp
  801e81:	48 83 ec 40          	sub    rsp,0x40
  801e85:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801e89:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801e8d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801e90:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e94:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801e97:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801e9a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e9e:	48 89 c7             	mov    rdi,rax
  801ea1:	e8 e1 00 00 00       	call   801f87 <get_according_bnr>
  801ea6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  801ea9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801eac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801eaf:	89 d6                	mov    esi,edx
  801eb1:	89 c7                	mov    edi,eax
  801eb3:	e8 0f 01 00 00       	call   801fc7 <get_buf>
  801eb8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801ebc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801ebf:	ba 00 02 00 00       	mov    edx,0x200
  801ec4:	39 d0                	cmp    eax,edx
  801ec6:	0f 4f c2             	cmovg  eax,edx
  801ec9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  801ecc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801ecf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ed3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ed6:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  801eda:	48 89 ce             	mov    rsi,rcx
  801edd:	48 89 c7             	mov    rdi,rax
  801ee0:	e8 8c 88 00 00       	call   80a771 <memcpy>
        len-=BLOCK_SIZE;
  801ee5:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801eec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ef0:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801ef3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ef6:	01 c2                	add    edx,eax
  801ef8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801efc:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  801eff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f03:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  801f07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f0b:	48 89 c7             	mov    rdi,rax
  801f0e:	e8 a9 fd ff ff       	call   801cbc <brelse>
    }while(len>0);
  801f13:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801f17:	7f 81                	jg     801e9a <vfs_write_file+0x21>
    return 0;
  801f19:	b8 00 00 00 00       	mov    eax,0x0
}
  801f1e:	c9                   	leave  
  801f1f:	c3                   	ret    

0000000000801f20 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  801f20:	f3 0f 1e fa          	endbr64 
  801f24:	55                   	push   rbp
  801f25:	48 89 e5             	mov    rbp,rsp
  801f28:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801f2c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801f2f:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  801f32:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801f36:	74 35                	je     801f6d <vfs_seek_file+0x4d>
  801f38:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801f3c:	7f 3f                	jg     801f7d <vfs_seek_file+0x5d>
  801f3e:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  801f42:	74 08                	je     801f4c <vfs_seek_file+0x2c>
  801f44:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  801f48:	74 0e                	je     801f58 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  801f4a:	eb 31                	jmp    801f7d <vfs_seek_file+0x5d>
        f->ptr=offset;
  801f4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f50:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  801f53:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f56:	eb 26                	jmp    801f7e <vfs_seek_file+0x5e>
        f->ptr+=offset;
  801f58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f5c:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801f5f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f62:	01 c2                	add    edx,eax
  801f64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f68:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f6b:	eb 11                	jmp    801f7e <vfs_seek_file+0x5e>
        f->ptr=f->size;
  801f6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f71:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  801f74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f78:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f7b:	eb 01                	jmp    801f7e <vfs_seek_file+0x5e>
        break;
  801f7d:	90                   	nop
    }
    return f->ptr;
  801f7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f82:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  801f85:	5d                   	pop    rbp
  801f86:	c3                   	ret    

0000000000801f87 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  801f87:	f3 0f 1e fa          	endbr64 
  801f8b:	55                   	push   rbp
  801f8c:	48 89 e5             	mov    rbp,rsp
  801f8f:	48 83 ec 10          	sub    rsp,0x10
  801f93:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  801f97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f9b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  801f9e:	48 63 d0             	movsxd rdx,eax
  801fa1:	48 89 d0             	mov    rax,rdx
  801fa4:	48 c1 e0 02          	shl    rax,0x2
  801fa8:	48 01 d0             	add    rax,rdx
  801fab:	48 c1 e0 03          	shl    rax,0x3
  801faf:	48 05 58 02 40 00    	add    rax,0x400258
  801fb5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801fb8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  801fbc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fc0:	48 89 c7             	mov    rdi,rax
  801fc3:	ff d2                	call   rdx

}
  801fc5:	c9                   	leave  
  801fc6:	c3                   	ret    

0000000000801fc7 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  801fc7:	f3 0f 1e fa          	endbr64 
  801fcb:	55                   	push   rbp
  801fcc:	48 89 e5             	mov    rbp,rsp
  801fcf:	48 83 ec 20          	sub    rsp,0x20
  801fd3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801fd6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  801fd9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801fe0:	e9 b9 00 00 00       	jmp    80209e <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  801fe5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fe8:	48 98                	cdqe   
  801fea:	48 c1 e0 06          	shl    rax,0x6
  801fee:	48 05 90 26 40 00    	add    rax,0x402690
  801ff4:	0f b7 00             	movzx  eax,WORD PTR [rax]
  801ff7:	0f b7 c0             	movzx  eax,ax
  801ffa:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ffd:	0f 85 97 00 00 00    	jne    80209a <get_buf+0xd3>
  802003:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802006:	48 98                	cdqe   
  802008:	48 c1 e0 06          	shl    rax,0x6
  80200c:	48 05 88 26 40 00    	add    rax,0x402688
  802012:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802015:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802018:	48 98                	cdqe   
  80201a:	48 39 c2             	cmp    rdx,rax
  80201d:	75 7b                	jne    80209a <get_buf+0xd3>
        {
            repeat:
  80201f:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802020:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802023:	48 98                	cdqe   
  802025:	48 c1 e0 06          	shl    rax,0x6
  802029:	48 05 80 26 40 00    	add    rax,0x402680
  80202f:	48 89 c7             	mov    rdi,rax
  802032:	e8 41 01 00 00       	call   802178 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802037:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80203a:	48 98                	cdqe   
  80203c:	48 c1 e0 06          	shl    rax,0x6
  802040:	48 05 94 26 40 00    	add    rax,0x402694
  802046:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802049:	84 c0                	test   al,al
  80204b:	74 02                	je     80204f <get_buf+0x88>
                goto repeat;
  80204d:	eb d1                	jmp    802020 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80204f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802052:	48 98                	cdqe   
  802054:	48 c1 e0 06          	shl    rax,0x6
  802058:	48 05 90 26 40 00    	add    rax,0x402690
  80205e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802061:	0f b7 c0             	movzx  eax,ax
  802064:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802067:	75 30                	jne    802099 <get_buf+0xd2>
  802069:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80206c:	48 98                	cdqe   
  80206e:	48 c1 e0 06          	shl    rax,0x6
  802072:	48 05 88 26 40 00    	add    rax,0x402688
  802078:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80207b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80207e:	48 98                	cdqe   
  802080:	48 39 c2             	cmp    rdx,rax
  802083:	75 14                	jne    802099 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802085:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802088:	48 98                	cdqe   
  80208a:	48 c1 e0 06          	shl    rax,0x6
  80208e:	48 05 80 26 40 00    	add    rax,0x402680
  802094:	e9 dd 00 00 00       	jmp    802176 <get_buf+0x1af>
                continue;
  802099:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80209a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80209e:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8020a2:	0f 8e 3d ff ff ff    	jle    801fe5 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8020a8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8020af:	e9 b8 00 00 00       	jmp    80216c <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8020b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020b7:	48 98                	cdqe   
  8020b9:	48 c1 e0 06          	shl    rax,0x6
  8020bd:	48 05 94 26 40 00    	add    rax,0x402694
  8020c3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8020c6:	84 c0                	test   al,al
  8020c8:	0f 85 9a 00 00 00    	jne    802168 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8020ce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020d1:	48 98                	cdqe   
  8020d3:	48 c1 e0 06          	shl    rax,0x6
  8020d7:	48 05 93 26 40 00    	add    rax,0x402693
  8020dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8020e0:	84 c0                	test   al,al
  8020e2:	74 2e                	je     802112 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8020e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020e7:	48 98                	cdqe   
  8020e9:	48 c1 e0 06          	shl    rax,0x6
  8020ed:	48 05 80 26 40 00    	add    rax,0x402680
  8020f3:	48 89 c7             	mov    rdi,rax
  8020f6:	e8 1b 01 00 00       	call   802216 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8020fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020fe:	48 98                	cdqe   
  802100:	48 c1 e0 06          	shl    rax,0x6
  802104:	48 05 80 26 40 00    	add    rax,0x402680
  80210a:	48 89 c7             	mov    rdi,rax
  80210d:	e8 66 00 00 00       	call   802178 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802112:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802115:	48 98                	cdqe   
  802117:	48 c1 e0 06          	shl    rax,0x6
  80211b:	48 05 94 26 40 00    	add    rax,0x402694
  802121:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802124:	8d 50 01             	lea    edx,[rax+0x1]
  802127:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80212a:	48 98                	cdqe   
  80212c:	48 c1 e0 06          	shl    rax,0x6
  802130:	48 05 94 26 40 00    	add    rax,0x402694
  802136:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802138:	b8 00 00 00 00       	mov    eax,0x0
  80213d:	e8 d8 ef ff ff       	call   80111a <vmalloc>
  802142:	48 89 c2             	mov    rdx,rax
  802145:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802148:	48 98                	cdqe   
  80214a:	48 c1 e0 06          	shl    rax,0x6
  80214e:	48 05 80 26 40 00    	add    rax,0x402680
  802154:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802157:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80215a:	48 98                	cdqe   
  80215c:	48 c1 e0 06          	shl    rax,0x6
  802160:	48 05 80 26 40 00    	add    rax,0x402680
  802166:	eb 0e                	jmp    802176 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802168:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80216c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802170:	0f 8e 3e ff ff ff    	jle    8020b4 <get_buf+0xed>
        }
    }
}
  802176:	c9                   	leave  
  802177:	c3                   	ret    

0000000000802178 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802178:	f3 0f 1e fa          	endbr64 
  80217c:	55                   	push   rbp
  80217d:	48 89 e5             	mov    rbp,rsp
  802180:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802184:	90                   	nop
  802185:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802189:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80218d:	84 c0                	test   al,al
  80218f:	75 f4                	jne    802185 <wait_on_buf+0xd>
    
}
  802191:	90                   	nop
  802192:	90                   	nop
  802193:	5d                   	pop    rbp
  802194:	c3                   	ret    

0000000000802195 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802195:	f3 0f 1e fa          	endbr64 
  802199:	55                   	push   rbp
  80219a:	48 89 e5             	mov    rbp,rsp
  80219d:	48 83 ec 30          	sub    rsp,0x30
  8021a1:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  8021a4:	b8 00 00 00 00       	mov    eax,0x0
  8021a9:	e8 6c ef ff ff       	call   80111a <vmalloc>
  8021ae:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  8021b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8021b6:	49 89 c0             	mov    r8,rax
  8021b9:	b9 01 00 00 00       	mov    ecx,0x1
  8021be:	ba 00 00 00 00       	mov    edx,0x0
  8021c3:	be 20 00 00 00       	mov    esi,0x20
  8021c8:	bf 00 00 00 00       	mov    edi,0x0
  8021cd:	e8 21 4b 00 00       	call   806cf3 <request>
  8021d2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8021d5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8021d8:	89 c7                	mov    edi,eax
  8021da:	e8 c8 51 00 00       	call   8073a7 <chk_result>

    dpt_t* dpte=buf+0x1be;
  8021df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8021e3:	48 05 be 01 00 00    	add    rax,0x1be
  8021e9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8021ed:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8021f4:	eb 13                	jmp    802209 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8021f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021fa:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8021fd:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802200:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802205:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802209:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80220d:	7e e7                	jle    8021f6 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  80220f:	b8 00 00 00 00       	mov    eax,0x0
}
  802214:	c9                   	leave  
  802215:	c3                   	ret    

0000000000802216 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802216:	f3 0f 1e fa          	endbr64 
  80221a:	55                   	push   rbp
  80221b:	48 89 e5             	mov    rbp,rsp
  80221e:	48 83 ec 20          	sub    rsp,0x20
  802222:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802226:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80222a:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80222e:	0f b7 c0             	movzx  eax,ax
  802231:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802234:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802238:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80223c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80223f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802243:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802246:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802249:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80224c:	b9 00 02 00 00       	mov    ecx,0x200
  802251:	89 c7                	mov    edi,eax
  802253:	e8 02 00 00 00       	call   80225a <write_block>

}
  802258:	c9                   	leave  
  802259:	c3                   	ret    

000000000080225a <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  80225a:	f3 0f 1e fa          	endbr64 
  80225e:	55                   	push   rbp
  80225f:	48 89 e5             	mov    rbp,rsp
  802262:	48 83 ec 30          	sub    rsp,0x30
  802266:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802269:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80226c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802270:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802273:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802276:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802279:	89 d6                	mov    esi,edx
  80227b:	89 c7                	mov    edi,eax
  80227d:	e8 45 fd ff ff       	call   801fc7 <get_buf>
  802282:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802286:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802289:	ba 00 02 00 00       	mov    edx,0x200
  80228e:	39 d0                	cmp    eax,edx
  802290:	0f 4f c2             	cmovg  eax,edx
  802293:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802296:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802299:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80229d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8022a0:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8022a4:	48 89 ce             	mov    rsi,rcx
  8022a7:	48 89 c7             	mov    rdi,rax
  8022aa:	e8 c2 84 00 00       	call   80a771 <memcpy>
        len-=BLOCK_SIZE;
  8022af:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8022b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ba:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8022be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022c2:	48 89 c7             	mov    rdi,rax
  8022c5:	e8 f2 f9 ff ff       	call   801cbc <brelse>
    }while(len>0);
  8022ca:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8022ce:	7f a3                	jg     802273 <write_block+0x19>
    return 0;
  8022d0:	b8 00 00 00 00       	mov    eax,0x0
}
  8022d5:	c9                   	leave  
  8022d6:	c3                   	ret    

00000000008022d7 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8022d7:	f3 0f 1e fa          	endbr64 
  8022db:	55                   	push   rbp
  8022dc:	48 89 e5             	mov    rbp,rsp
  8022df:	48 83 ec 30          	sub    rsp,0x30
  8022e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8022e6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8022e9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8022ed:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8022f0:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022f3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022f6:	89 d6                	mov    esi,edx
  8022f8:	89 c7                	mov    edi,eax
  8022fa:	e8 20 fa ff ff       	call   801d1f <bread>
  8022ff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802303:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802306:	ba 00 02 00 00       	mov    edx,0x200
  80230b:	39 d0                	cmp    eax,edx
  80230d:	0f 4f c2             	cmovg  eax,edx
  802310:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802313:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802316:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80231a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80231d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802321:	48 89 ce             	mov    rsi,rcx
  802324:	48 89 c7             	mov    rdi,rax
  802327:	e8 45 84 00 00       	call   80a771 <memcpy>
        len-=BLOCK_SIZE;
  80232c:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802333:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802337:	48 89 c7             	mov    rdi,rax
  80233a:	e8 7d f9 ff ff       	call   801cbc <brelse>
    }while(len>0);
  80233f:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802343:	7f ab                	jg     8022f0 <read_block+0x19>
    return 0;
  802345:	b8 00 00 00 00       	mov    eax,0x0
}
  80234a:	c9                   	leave  
  80234b:	c3                   	ret    

000000000080234c <init_vfs>:

int init_vfs()
{
  80234c:	f3 0f 1e fa          	endbr64 
  802350:	55                   	push   rbp
  802351:	48 89 e5             	mov    rbp,rsp
  802354:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802358:	48 8b 05 21 61 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc06121]        # 408480 <dev_tree>
  80235f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802363:	eb 40                	jmp    8023a5 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802365:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802369:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80236f:	48 c1 f8 02          	sar    rax,0x2
  802373:	48 89 c2             	mov    rdx,rax
  802376:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80237d:	18 9c 8f 
  802380:	48 0f af c2          	imul   rax,rdx
  802384:	89 c7                	mov    edi,eax
  802386:	e8 0a fe ff ff       	call   802195 <scan_dev>
  80238b:	85 c0                	test   eax,eax
  80238d:	74 07                	je     802396 <init_vfs+0x4a>
  80238f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802394:	eb 1b                	jmp    8023b1 <init_vfs+0x65>
    for(;p;p=p->next)
  802396:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8023a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8023a5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8023aa:	75 b9                	jne    802365 <init_vfs+0x19>
    }

    return 0;
  8023ac:	b8 00 00 00 00       	mov    eax,0x0
}
  8023b1:	c9                   	leave  
  8023b2:	c3                   	ret    

00000000008023b3 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8023b3:	f3 0f 1e fa          	endbr64 
  8023b7:	55                   	push   rbp
  8023b8:	48 89 e5             	mov    rbp,rsp
}
  8023bb:	90                   	nop
  8023bc:	5d                   	pop    rbp
  8023bd:	c3                   	ret    

00000000008023be <load_driver>:
int load_driver(char *path)
{
  8023be:	f3 0f 1e fa          	endbr64 
  8023c2:	55                   	push   rbp
  8023c3:	48 89 e5             	mov    rbp,rsp
  8023c6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8023ca:	90                   	nop
  8023cb:	5d                   	pop    rbp
  8023cc:	c3                   	ret    

00000000008023cd <reg_device>:

int reg_device(device* dev)
{
  8023cd:	f3 0f 1e fa          	endbr64 
  8023d1:	55                   	push   rbp
  8023d2:	48 89 e5             	mov    rbp,rsp
  8023d5:	53                   	push   rbx
  8023d6:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8023da:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8023e1:	e9 42 01 00 00       	jmp    802528 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8023e6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023e9:	48 63 d0             	movsxd rdx,eax
  8023ec:	48 89 d0             	mov    rax,rdx
  8023ef:	48 c1 e0 02          	shl    rax,0x2
  8023f3:	48 01 d0             	add    rax,rdx
  8023f6:	48 c1 e0 02          	shl    rax,0x2
  8023fa:	48 01 d0             	add    rax,rdx
  8023fd:	48 c1 e0 03          	shl    rax,0x3
  802401:	48 05 90 2e 40 00    	add    rax,0x402e90
  802407:	8b 00                	mov    eax,DWORD PTR [rax]
  802409:	85 c0                	test   eax,eax
  80240b:	0f 85 13 01 00 00    	jne    802524 <reg_device+0x157>
        {
            devs[i]=*dev;
  802411:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802414:	48 63 d0             	movsxd rdx,eax
  802417:	48 89 d0             	mov    rax,rdx
  80241a:	48 c1 e0 02          	shl    rax,0x2
  80241e:	48 01 d0             	add    rax,rdx
  802421:	48 c1 e0 02          	shl    rax,0x2
  802425:	48 01 d0             	add    rax,rdx
  802428:	48 c1 e0 03          	shl    rax,0x3
  80242c:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802433:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802437:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80243a:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80243e:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802441:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802445:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802449:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80244d:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802451:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802455:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802459:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80245d:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802461:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802465:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802469:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80246d:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802471:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802475:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802479:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80247d:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802481:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802485:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802489:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80248d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802491:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802495:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802499:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80249d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8024a1:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8024a5:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8024a9:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8024ad:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8024b1:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8024b5:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8024bc:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8024c3:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8024ca:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8024d1:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8024d8:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8024df:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8024e6:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8024ed:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8024f4:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  8024fb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8024fe:	48 63 d0             	movsxd rdx,eax
  802501:	48 89 d0             	mov    rax,rdx
  802504:	48 c1 e0 02          	shl    rax,0x2
  802508:	48 01 d0             	add    rax,rdx
  80250b:	48 c1 e0 02          	shl    rax,0x2
  80250f:	48 01 d0             	add    rax,rdx
  802512:	48 c1 e0 03          	shl    rax,0x3
  802516:	48 05 90 2e 40 00    	add    rax,0x402e90
  80251c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802522:	eb 0e                	jmp    802532 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802524:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802528:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  80252c:	0f 8e b4 fe ff ff    	jle    8023e6 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802532:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802536:	75 0a                	jne    802542 <reg_device+0x175>
        return -1;
  802538:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80253d:	e9 6d 01 00 00       	jmp    8026af <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802542:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802549:	00 
  80254a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80254d:	48 63 d0             	movsxd rdx,eax
  802550:	48 89 d0             	mov    rax,rdx
  802553:	48 c1 e0 02          	shl    rax,0x2
  802557:	48 01 d0             	add    rax,rdx
  80255a:	48 c1 e0 02          	shl    rax,0x2
  80255e:	48 01 d0             	add    rax,rdx
  802561:	48 c1 e0 03          	shl    rax,0x3
  802565:	48 05 80 2e 40 00    	add    rax,0x402e80
  80256b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  80256f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802573:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802576:	83 f8 03             	cmp    eax,0x3
  802579:	74 3b                	je     8025b6 <reg_device+0x1e9>
  80257b:	83 f8 03             	cmp    eax,0x3
  80257e:	7f 4b                	jg     8025cb <reg_device+0x1fe>
  802580:	83 f8 01             	cmp    eax,0x1
  802583:	74 07                	je     80258c <reg_device+0x1bf>
  802585:	83 f8 02             	cmp    eax,0x2
  802588:	74 17                	je     8025a1 <reg_device+0x1d4>
  80258a:	eb 3f                	jmp    8025cb <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  80258c:	48 8b 05 ed 5e c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05eed]        # 408480 <dev_tree>
  802593:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802597:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  80259e:	00 
        break;
  80259f:	eb 34                	jmp    8025d5 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  8025a1:	48 8b 05 e0 5e c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ee0]        # 408488 <dev_tree+0x8>
  8025a8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8025ac:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  8025b3:	00 
        break;
  8025b4:	eb 1f                	jmp    8025d5 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  8025b6:	48 8b 05 d3 5e c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ed3]        # 408490 <dev_tree+0x10>
  8025bd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8025c1:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  8025c8:	00 
        break;
  8025c9:	eb 0a                	jmp    8025d5 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  8025cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8025d0:	e9 da 00 00 00       	jmp    8026af <reg_device+0x2e2>
    }
    if(!p){
  8025d5:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8025da:	75 2b                	jne    802607 <reg_device+0x23a>
        *pp=neo;
  8025dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8025e0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8025e4:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8025e7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025eb:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8025f2:	00 00 00 00 
  8025f6:	eb 3d                	jmp    802635 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8025f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8025fc:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802603:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802607:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80260b:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802612:	48 85 c0             	test   rax,rax
  802615:	75 e1                	jne    8025f8 <reg_device+0x22b>
        p->next=neo;
  802617:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80261b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80261f:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802626:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80262a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80262e:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802635:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802639:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802640:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802644:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802648:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80264b:	83 f8 04             	cmp    eax,0x4
  80264e:	74 3b                	je     80268b <reg_device+0x2be>
  802650:	83 f8 04             	cmp    eax,0x4
  802653:	7f 56                	jg     8026ab <reg_device+0x2de>
  802655:	83 f8 03             	cmp    eax,0x3
  802658:	74 21                	je     80267b <reg_device+0x2ae>
  80265a:	83 f8 03             	cmp    eax,0x3
  80265d:	7f 4c                	jg     8026ab <reg_device+0x2de>
  80265f:	83 f8 01             	cmp    eax,0x1
  802662:	74 07                	je     80266b <reg_device+0x29e>
  802664:	83 f8 02             	cmp    eax,0x2
  802667:	74 32                	je     80269b <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802669:	eb 40                	jmp    8026ab <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80266b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80266f:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802676:	00 00 00 
        break;
  802679:	eb 31                	jmp    8026ac <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80267b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80267f:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802686:	00 00 00 
        break;
  802689:	eb 21                	jmp    8026ac <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80268b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80268f:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802696:	00 00 00 
        break;
  802699:	eb 11                	jmp    8026ac <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  80269b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80269f:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  8026a6:	00 00 00 
        break;
  8026a9:	eb 01                	jmp    8026ac <reg_device+0x2df>
        break;
  8026ab:	90                   	nop
    }
    return i;
  8026ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8026af:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8026b3:	c9                   	leave  
  8026b4:	c3                   	ret    

00000000008026b5 <reg_driver>:


int reg_driver(driver *drv)
{
  8026b5:	f3 0f 1e fa          	endbr64 
  8026b9:	55                   	push   rbp
  8026ba:	48 89 e5             	mov    rbp,rsp
  8026bd:	53                   	push   rbx
  8026be:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  8026c2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8026c9:	e9 22 01 00 00       	jmp    8027f0 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8026ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026d1:	48 63 d0             	movsxd rdx,eax
  8026d4:	48 89 d0             	mov    rax,rdx
  8026d7:	48 c1 e0 02          	shl    rax,0x2
  8026db:	48 01 d0             	add    rax,rdx
  8026de:	48 c1 e0 05          	shl    rax,0x5
  8026e2:	48 05 80 58 40 00    	add    rax,0x405880
  8026e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8026ea:	85 c0                	test   eax,eax
  8026ec:	0f 85 fa 00 00 00    	jne    8027ec <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8026f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026f5:	48 63 d0             	movsxd rdx,eax
  8026f8:	48 89 d0             	mov    rax,rdx
  8026fb:	48 c1 e0 02          	shl    rax,0x2
  8026ff:	48 01 d0             	add    rax,rdx
  802702:	48 c1 e0 05          	shl    rax,0x5
  802706:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  80270d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802711:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802714:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802718:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80271b:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80271f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802723:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802727:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80272b:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80272f:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802733:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802737:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80273b:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80273f:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802743:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802747:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80274b:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80274f:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802753:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802757:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80275b:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80275f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802763:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802767:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80276b:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80276f:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802773:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802777:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80277b:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80277f:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802783:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802787:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80278b:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80278f:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802796:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80279d:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8027a4:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8027ab:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8027b2:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8027b9:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8027c0:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  8027c7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8027ca:	48 63 d0             	movsxd rdx,eax
  8027cd:	48 89 d0             	mov    rax,rdx
  8027d0:	48 c1 e0 02          	shl    rax,0x2
  8027d4:	48 01 d0             	add    rax,rdx
  8027d7:	48 c1 e0 05          	shl    rax,0x5
  8027db:	48 05 80 58 40 00    	add    rax,0x405880
  8027e1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8027e7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8027ea:	eb 13                	jmp    8027ff <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8027ec:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8027f0:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8027f4:	0f 8e d4 fe ff ff    	jle    8026ce <reg_driver+0x19>
        }
    }
    return -1;
  8027fa:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8027ff:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802803:	c9                   	leave  
  802804:	c3                   	ret    

0000000000802805 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802805:	f3 0f 1e fa          	endbr64 
  802809:	55                   	push   rbp
  80280a:	48 89 e5             	mov    rbp,rsp
  80280d:	48 83 ec 20          	sub    rsp,0x20
  802811:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802815:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80281c:	eb 6c                	jmp    80288a <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  80281e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802821:	48 63 d0             	movsxd rdx,eax
  802824:	48 89 d0             	mov    rax,rdx
  802827:	48 c1 e0 02          	shl    rax,0x2
  80282b:	48 01 d0             	add    rax,rdx
  80282e:	48 c1 e0 02          	shl    rax,0x2
  802832:	48 01 d0             	add    rax,rdx
  802835:	48 c1 e0 03          	shl    rax,0x3
  802839:	48 05 90 2e 40 00    	add    rax,0x402e90
  80283f:	8b 00                	mov    eax,DWORD PTR [rax]
  802841:	85 c0                	test   eax,eax
  802843:	74 41                	je     802886 <sys_find_dev+0x81>
  802845:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802848:	48 63 d0             	movsxd rdx,eax
  80284b:	48 89 d0             	mov    rax,rdx
  80284e:	48 c1 e0 02          	shl    rax,0x2
  802852:	48 01 d0             	add    rax,rdx
  802855:	48 c1 e0 02          	shl    rax,0x2
  802859:	48 01 d0             	add    rax,rdx
  80285c:	48 c1 e0 03          	shl    rax,0x3
  802860:	48 83 c0 10          	add    rax,0x10
  802864:	48 05 80 2e 40 00    	add    rax,0x402e80
  80286a:	48 8d 50 04          	lea    rdx,[rax+0x4]
  80286e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802872:	48 89 d6             	mov    rsi,rdx
  802875:	48 89 c7             	mov    rdi,rax
  802878:	e8 92 81 00 00       	call   80aa0f <strcmp>
  80287d:	85 c0                	test   eax,eax
  80287f:	75 05                	jne    802886 <sys_find_dev+0x81>
            return i;
  802881:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802884:	eb 0f                	jmp    802895 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802886:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80288a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80288e:	7e 8e                	jle    80281e <sys_find_dev+0x19>
    }
    return -1;
  802890:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802895:	c9                   	leave  
  802896:	c3                   	ret    

0000000000802897 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802897:	f3 0f 1e fa          	endbr64 
  80289b:	55                   	push   rbp
  80289c:	48 89 e5             	mov    rbp,rsp
  80289f:	48 83 ec 30          	sub    rsp,0x30
  8028a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8028a7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8028aa:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  8028ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  8028b5:	eb 67                	jmp    80291e <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  8028b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8028ba:	48 63 d0             	movsxd rdx,eax
  8028bd:	48 89 d0             	mov    rax,rdx
  8028c0:	48 c1 e0 02          	shl    rax,0x2
  8028c4:	48 01 d0             	add    rax,rdx
  8028c7:	48 c1 e0 02          	shl    rax,0x2
  8028cb:	48 01 d0             	add    rax,rdx
  8028ce:	48 c1 e0 03          	shl    rax,0x3
  8028d2:	48 05 90 2e 40 00    	add    rax,0x402e90
  8028d8:	8b 00                	mov    eax,DWORD PTR [rax]
  8028da:	85 c0                	test   eax,eax
  8028dc:	74 3c                	je     80291a <sys_operate_dev+0x83>
  8028de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8028e1:	48 63 d0             	movsxd rdx,eax
  8028e4:	48 89 d0             	mov    rax,rdx
  8028e7:	48 c1 e0 02          	shl    rax,0x2
  8028eb:	48 01 d0             	add    rax,rdx
  8028ee:	48 c1 e0 02          	shl    rax,0x2
  8028f2:	48 01 d0             	add    rax,rdx
  8028f5:	48 c1 e0 03          	shl    rax,0x3
  8028f9:	48 83 c0 10          	add    rax,0x10
  8028fd:	48 05 80 2e 40 00    	add    rax,0x402e80
  802903:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802907:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80290b:	48 89 d6             	mov    rsi,rdx
  80290e:	48 89 c7             	mov    rdi,rax
  802911:	e8 f9 80 00 00       	call   80aa0f <strcmp>
  802916:	85 c0                	test   eax,eax
  802918:	74 0c                	je     802926 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  80291a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80291e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802922:	7e 93                	jle    8028b7 <sys_operate_dev+0x20>
  802924:	eb 01                	jmp    802927 <sys_operate_dev+0x90>
            break;
  802926:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802927:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80292b:	75 0a                	jne    802937 <sys_operate_dev+0xa0>
  80292d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802932:	e9 9c 02 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
    switch (func) {
  802937:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  80293b:	0f 87 8d 02 00 00    	ja     802bce <sys_operate_dev+0x337>
  802941:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802944:	48 8b 04 c5 a8 2c 81 	mov    rax,QWORD PTR [rax*8+0x812ca8]
  80294b:	00 
  80294c:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80294f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802952:	48 63 d0             	movsxd rdx,eax
  802955:	48 89 d0             	mov    rax,rdx
  802958:	48 c1 e0 02          	shl    rax,0x2
  80295c:	48 01 d0             	add    rax,rdx
  80295f:	48 c1 e0 02          	shl    rax,0x2
  802963:	48 01 d0             	add    rax,rdx
  802966:	48 c1 e0 03          	shl    rax,0x3
  80296a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802970:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802973:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802977:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80297b:	48 89 c7             	mov    rdi,rax
  80297e:	ff d2                	call   rdx
  802980:	e9 4e 02 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802985:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802988:	48 63 d0             	movsxd rdx,eax
  80298b:	48 89 d0             	mov    rax,rdx
  80298e:	48 c1 e0 02          	shl    rax,0x2
  802992:	48 01 d0             	add    rax,rdx
  802995:	48 c1 e0 02          	shl    rax,0x2
  802999:	48 01 d0             	add    rax,rdx
  80299c:	48 c1 e0 03          	shl    rax,0x3
  8029a0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8029a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029a9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8029ad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8029b1:	48 89 c7             	mov    rdi,rax
  8029b4:	ff d2                	call   rdx
  8029b6:	e9 18 02 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  8029bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029be:	48 63 d0             	movsxd rdx,eax
  8029c1:	48 89 d0             	mov    rax,rdx
  8029c4:	48 c1 e0 02          	shl    rax,0x2
  8029c8:	48 01 d0             	add    rax,rdx
  8029cb:	48 c1 e0 02          	shl    rax,0x2
  8029cf:	48 01 d0             	add    rax,rdx
  8029d2:	48 c1 e0 03          	shl    rax,0x3
  8029d6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8029dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029df:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8029e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8029e7:	48 89 c7             	mov    rdi,rax
  8029ea:	ff d2                	call   rdx
  8029ec:	e9 e2 01 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8029f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029f4:	48 63 d0             	movsxd rdx,eax
  8029f7:	48 89 d0             	mov    rax,rdx
  8029fa:	48 c1 e0 02          	shl    rax,0x2
  8029fe:	48 01 d0             	add    rax,rdx
  802a01:	48 c1 e0 02          	shl    rax,0x2
  802a05:	48 01 d0             	add    rax,rdx
  802a08:	48 c1 e0 03          	shl    rax,0x3
  802a0c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a15:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802a19:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a1d:	48 89 c7             	mov    rdi,rax
  802a20:	ff d2                	call   rdx
  802a22:	e9 ac 01 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802a27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a2a:	48 63 d0             	movsxd rdx,eax
  802a2d:	48 89 d0             	mov    rax,rdx
  802a30:	48 c1 e0 02          	shl    rax,0x2
  802a34:	48 01 d0             	add    rax,rdx
  802a37:	48 c1 e0 02          	shl    rax,0x2
  802a3b:	48 01 d0             	add    rax,rdx
  802a3e:	48 c1 e0 03          	shl    rax,0x3
  802a42:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a48:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a4b:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802a4f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a53:	48 89 c7             	mov    rdi,rax
  802a56:	ff d2                	call   rdx
  802a58:	e9 76 01 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802a5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a60:	48 63 d0             	movsxd rdx,eax
  802a63:	48 89 d0             	mov    rax,rdx
  802a66:	48 c1 e0 02          	shl    rax,0x2
  802a6a:	48 01 d0             	add    rax,rdx
  802a6d:	48 c1 e0 02          	shl    rax,0x2
  802a71:	48 01 d0             	add    rax,rdx
  802a74:	48 c1 e0 03          	shl    rax,0x3
  802a78:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a7e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a81:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802a85:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a89:	48 89 c7             	mov    rdi,rax
  802a8c:	ff d2                	call   rdx
  802a8e:	e9 40 01 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802a93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a96:	48 63 d0             	movsxd rdx,eax
  802a99:	48 89 d0             	mov    rax,rdx
  802a9c:	48 c1 e0 02          	shl    rax,0x2
  802aa0:	48 01 d0             	add    rax,rdx
  802aa3:	48 c1 e0 02          	shl    rax,0x2
  802aa7:	48 01 d0             	add    rax,rdx
  802aaa:	48 c1 e0 03          	shl    rax,0x3
  802aae:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ab4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ab7:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802abb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802abf:	48 89 c7             	mov    rdi,rax
  802ac2:	ff d2                	call   rdx
  802ac4:	e9 0a 01 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802ac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802acc:	48 63 d0             	movsxd rdx,eax
  802acf:	48 89 d0             	mov    rax,rdx
  802ad2:	48 c1 e0 02          	shl    rax,0x2
  802ad6:	48 01 d0             	add    rax,rdx
  802ad9:	48 c1 e0 02          	shl    rax,0x2
  802add:	48 01 d0             	add    rax,rdx
  802ae0:	48 c1 e0 03          	shl    rax,0x3
  802ae4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802aea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802aed:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802af1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802af5:	48 89 c7             	mov    rdi,rax
  802af8:	ff d2                	call   rdx
  802afa:	e9 d4 00 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802aff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b02:	48 63 d0             	movsxd rdx,eax
  802b05:	48 89 d0             	mov    rax,rdx
  802b08:	48 c1 e0 02          	shl    rax,0x2
  802b0c:	48 01 d0             	add    rax,rdx
  802b0f:	48 c1 e0 02          	shl    rax,0x2
  802b13:	48 01 d0             	add    rax,rdx
  802b16:	48 c1 e0 03          	shl    rax,0x3
  802b1a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b20:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b23:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802b27:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b2b:	48 89 c7             	mov    rdi,rax
  802b2e:	ff d2                	call   rdx
  802b30:	e9 9e 00 00 00       	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802b35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b38:	48 63 d0             	movsxd rdx,eax
  802b3b:	48 89 d0             	mov    rax,rdx
  802b3e:	48 c1 e0 02          	shl    rax,0x2
  802b42:	48 01 d0             	add    rax,rdx
  802b45:	48 c1 e0 02          	shl    rax,0x2
  802b49:	48 01 d0             	add    rax,rdx
  802b4c:	48 c1 e0 03          	shl    rax,0x3
  802b50:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b56:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b59:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802b5d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b61:	48 89 c7             	mov    rdi,rax
  802b64:	ff d2                	call   rdx
  802b66:	eb 6b                	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802b68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b6b:	48 63 d0             	movsxd rdx,eax
  802b6e:	48 89 d0             	mov    rax,rdx
  802b71:	48 c1 e0 02          	shl    rax,0x2
  802b75:	48 01 d0             	add    rax,rdx
  802b78:	48 c1 e0 02          	shl    rax,0x2
  802b7c:	48 01 d0             	add    rax,rdx
  802b7f:	48 c1 e0 03          	shl    rax,0x3
  802b83:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b8c:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802b90:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b94:	48 89 c7             	mov    rdi,rax
  802b97:	ff d2                	call   rdx
  802b99:	eb 38                	jmp    802bd3 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802b9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b9e:	48 63 d0             	movsxd rdx,eax
  802ba1:	48 89 d0             	mov    rax,rdx
  802ba4:	48 c1 e0 02          	shl    rax,0x2
  802ba8:	48 01 d0             	add    rax,rdx
  802bab:	48 c1 e0 02          	shl    rax,0x2
  802baf:	48 01 d0             	add    rax,rdx
  802bb2:	48 c1 e0 03          	shl    rax,0x3
  802bb6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bbc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bbf:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802bc3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bc7:	48 89 c7             	mov    rdi,rax
  802bca:	ff d2                	call   rdx
  802bcc:	eb 05                	jmp    802bd3 <sys_operate_dev+0x33c>
    }
    return -1;
  802bce:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802bd3:	c9                   	leave  
  802bd4:	c3                   	ret    

0000000000802bd5 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802bd5:	f3 0f 1e fa          	endbr64 
  802bd9:	55                   	push   rbp
  802bda:	48 89 e5             	mov    rbp,rsp
  802bdd:	48 83 ec 10          	sub    rsp,0x10
  802be1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802be4:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802be7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802beb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bee:	48 63 d0             	movsxd rdx,eax
  802bf1:	48 89 d0             	mov    rax,rdx
  802bf4:	48 c1 e0 02          	shl    rax,0x2
  802bf8:	48 01 d0             	add    rax,rdx
  802bfb:	48 c1 e0 05          	shl    rax,0x5
  802bff:	48 05 80 58 40 00    	add    rax,0x405880
  802c05:	8b 00                	mov    eax,DWORD PTR [rax]
  802c07:	85 c0                	test   eax,eax
  802c09:	75 0a                	jne    802c15 <call_drv_func+0x40>
  802c0b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c10:	e9 15 02 00 00       	jmp    802e2a <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802c15:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802c19:	0f 87 06 02 00 00    	ja     802e25 <call_drv_func+0x250>
  802c1f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802c22:	48 8b 04 c5 08 2d 81 	mov    rax,QWORD PTR [rax*8+0x812d08]
  802c29:	00 
  802c2a:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802c2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c30:	48 63 d0             	movsxd rdx,eax
  802c33:	48 89 d0             	mov    rax,rdx
  802c36:	48 c1 e0 02          	shl    rax,0x2
  802c3a:	48 01 d0             	add    rax,rdx
  802c3d:	48 c1 e0 05          	shl    rax,0x5
  802c41:	48 05 88 58 40 00    	add    rax,0x405888
  802c47:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c4e:	48 89 c7             	mov    rdi,rax
  802c51:	ff d2                	call   rdx
  802c53:	e9 d2 01 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802c58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c5b:	48 63 d0             	movsxd rdx,eax
  802c5e:	48 89 d0             	mov    rax,rdx
  802c61:	48 c1 e0 02          	shl    rax,0x2
  802c65:	48 01 d0             	add    rax,rdx
  802c68:	48 c1 e0 05          	shl    rax,0x5
  802c6c:	48 05 90 58 40 00    	add    rax,0x405890
  802c72:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c75:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c79:	48 89 c7             	mov    rdi,rax
  802c7c:	ff d2                	call   rdx
  802c7e:	e9 a7 01 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802c83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c86:	48 63 d0             	movsxd rdx,eax
  802c89:	48 89 d0             	mov    rax,rdx
  802c8c:	48 c1 e0 02          	shl    rax,0x2
  802c90:	48 01 d0             	add    rax,rdx
  802c93:	48 c1 e0 05          	shl    rax,0x5
  802c97:	48 05 98 58 40 00    	add    rax,0x405898
  802c9d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ca0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ca4:	48 89 c7             	mov    rdi,rax
  802ca7:	ff d2                	call   rdx
  802ca9:	e9 7c 01 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802cae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cb1:	48 63 d0             	movsxd rdx,eax
  802cb4:	48 89 d0             	mov    rax,rdx
  802cb7:	48 c1 e0 02          	shl    rax,0x2
  802cbb:	48 01 d0             	add    rax,rdx
  802cbe:	48 c1 e0 05          	shl    rax,0x5
  802cc2:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802cc8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ccb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ccf:	48 89 c7             	mov    rdi,rax
  802cd2:	ff d2                	call   rdx
  802cd4:	e9 51 01 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802cd9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cdc:	48 63 d0             	movsxd rdx,eax
  802cdf:	48 89 d0             	mov    rax,rdx
  802ce2:	48 c1 e0 02          	shl    rax,0x2
  802ce6:	48 01 d0             	add    rax,rdx
  802ce9:	48 c1 e0 05          	shl    rax,0x5
  802ced:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802cf3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802cf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cfa:	48 89 c7             	mov    rdi,rax
  802cfd:	ff d2                	call   rdx
  802cff:	e9 26 01 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802d04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d07:	48 63 d0             	movsxd rdx,eax
  802d0a:	48 89 d0             	mov    rax,rdx
  802d0d:	48 c1 e0 02          	shl    rax,0x2
  802d11:	48 01 d0             	add    rax,rdx
  802d14:	48 c1 e0 05          	shl    rax,0x5
  802d18:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802d1e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d25:	48 89 c7             	mov    rdi,rax
  802d28:	ff d2                	call   rdx
  802d2a:	e9 fb 00 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802d2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d32:	48 63 d0             	movsxd rdx,eax
  802d35:	48 89 d0             	mov    rax,rdx
  802d38:	48 c1 e0 02          	shl    rax,0x2
  802d3c:	48 01 d0             	add    rax,rdx
  802d3f:	48 c1 e0 05          	shl    rax,0x5
  802d43:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802d49:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d4c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d50:	48 89 c7             	mov    rdi,rax
  802d53:	ff d2                	call   rdx
  802d55:	e9 d0 00 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802d5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d5d:	48 63 d0             	movsxd rdx,eax
  802d60:	48 89 d0             	mov    rax,rdx
  802d63:	48 c1 e0 02          	shl    rax,0x2
  802d67:	48 01 d0             	add    rax,rdx
  802d6a:	48 c1 e0 05          	shl    rax,0x5
  802d6e:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802d74:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d77:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d7b:	48 89 c7             	mov    rdi,rax
  802d7e:	ff d2                	call   rdx
  802d80:	e9 a5 00 00 00       	jmp    802e2a <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802d85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d88:	48 63 d0             	movsxd rdx,eax
  802d8b:	48 89 d0             	mov    rax,rdx
  802d8e:	48 c1 e0 02          	shl    rax,0x2
  802d92:	48 01 d0             	add    rax,rdx
  802d95:	48 c1 e0 05          	shl    rax,0x5
  802d99:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802d9f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802da2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802da6:	48 89 c7             	mov    rdi,rax
  802da9:	ff d2                	call   rdx
  802dab:	eb 7d                	jmp    802e2a <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802dad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802db0:	48 63 d0             	movsxd rdx,eax
  802db3:	48 89 d0             	mov    rax,rdx
  802db6:	48 c1 e0 02          	shl    rax,0x2
  802dba:	48 01 d0             	add    rax,rdx
  802dbd:	48 c1 e0 05          	shl    rax,0x5
  802dc1:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802dc7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802dca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dce:	48 89 c7             	mov    rdi,rax
  802dd1:	ff d2                	call   rdx
  802dd3:	eb 55                	jmp    802e2a <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802dd5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dd8:	48 63 d0             	movsxd rdx,eax
  802ddb:	48 89 d0             	mov    rax,rdx
  802dde:	48 c1 e0 02          	shl    rax,0x2
  802de2:	48 01 d0             	add    rax,rdx
  802de5:	48 c1 e0 05          	shl    rax,0x5
  802de9:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802def:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802df2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802df6:	48 89 c7             	mov    rdi,rax
  802df9:	ff d2                	call   rdx
  802dfb:	eb 2d                	jmp    802e2a <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  802dfd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e00:	48 63 d0             	movsxd rdx,eax
  802e03:	48 89 d0             	mov    rax,rdx
  802e06:	48 c1 e0 02          	shl    rax,0x2
  802e0a:	48 01 d0             	add    rax,rdx
  802e0d:	48 c1 e0 05          	shl    rax,0x5
  802e11:	48 05 e0 58 40 00    	add    rax,0x4058e0
  802e17:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e1e:	48 89 c7             	mov    rdi,rax
  802e21:	ff d2                	call   rdx
  802e23:	eb 05                	jmp    802e2a <call_drv_func+0x255>
    }
    return -1;
  802e25:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e2a:	c9                   	leave  
  802e2b:	c3                   	ret    

0000000000802e2c <dispose_device>:
int dispose_device(int dev){
  802e2c:	f3 0f 1e fa          	endbr64 
  802e30:	55                   	push   rbp
  802e31:	48 89 e5             	mov    rbp,rsp
  802e34:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  802e37:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802e3a:	48 63 d0             	movsxd rdx,eax
  802e3d:	48 89 d0             	mov    rax,rdx
  802e40:	48 c1 e0 02          	shl    rax,0x2
  802e44:	48 01 d0             	add    rax,rdx
  802e47:	48 c1 e0 02          	shl    rax,0x2
  802e4b:	48 01 d0             	add    rax,rdx
  802e4e:	48 c1 e0 03          	shl    rax,0x3
  802e52:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e58:	8b 00                	mov    eax,DWORD PTR [rax]
  802e5a:	83 f8 01             	cmp    eax,0x1
  802e5d:	74 07                	je     802e66 <dispose_device+0x3a>
  802e5f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e64:	eb 62                	jmp    802ec8 <dispose_device+0x9c>
    device* p=&devs[dev];
  802e66:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802e69:	48 63 d0             	movsxd rdx,eax
  802e6c:	48 89 d0             	mov    rax,rdx
  802e6f:	48 c1 e0 02          	shl    rax,0x2
  802e73:	48 01 d0             	add    rax,rdx
  802e76:	48 c1 e0 02          	shl    rax,0x2
  802e7a:	48 01 d0             	add    rax,rdx
  802e7d:	48 c1 e0 03          	shl    rax,0x3
  802e81:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e87:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  802e8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e8f:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  802e96:	48 85 c0             	test   rax,rax
  802e99:	74 1d                	je     802eb8 <dispose_device+0x8c>
  802e9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e9f:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  802ea6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802eaa:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  802eb1:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  802eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ebc:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  802ec3:	b8 00 00 00 00       	mov    eax,0x0
}
  802ec8:	5d                   	pop    rbp
  802ec9:	c3                   	ret    

0000000000802eca <dispose_driver>:
int dispose_driver(driver *drv){
  802eca:	f3 0f 1e fa          	endbr64 
  802ece:	55                   	push   rbp
  802ecf:	48 89 e5             	mov    rbp,rsp
  802ed2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  802ed6:	90                   	nop
  802ed7:	5d                   	pop    rbp
  802ed8:	c3                   	ret    

0000000000802ed9 <get_dev>:

device *get_dev(int devi)
{
  802ed9:	f3 0f 1e fa          	endbr64 
  802edd:	55                   	push   rbp
  802ede:	48 89 e5             	mov    rbp,rsp
  802ee1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  802ee4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ee7:	48 63 d0             	movsxd rdx,eax
  802eea:	48 89 d0             	mov    rax,rdx
  802eed:	48 c1 e0 02          	shl    rax,0x2
  802ef1:	48 01 d0             	add    rax,rdx
  802ef4:	48 c1 e0 02          	shl    rax,0x2
  802ef8:	48 01 d0             	add    rax,rdx
  802efb:	48 c1 e0 03          	shl    rax,0x3
  802eff:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  802f05:	5d                   	pop    rbp
  802f06:	c3                   	ret    

0000000000802f07 <get_drv>:
driver *get_drv(int drvi)
{
  802f07:	f3 0f 1e fa          	endbr64 
  802f0b:	55                   	push   rbp
  802f0c:	48 89 e5             	mov    rbp,rsp
  802f0f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  802f12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f15:	48 63 d0             	movsxd rdx,eax
  802f18:	48 89 d0             	mov    rax,rdx
  802f1b:	48 c1 e0 02          	shl    rax,0x2
  802f1f:	48 01 d0             	add    rax,rdx
  802f22:	48 c1 e0 05          	shl    rax,0x5
  802f26:	48 05 80 58 40 00    	add    rax,0x405880
}
  802f2c:	5d                   	pop    rbp
  802f2d:	c3                   	ret    

0000000000802f2e <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  802f2e:	f3 0f 1e fa          	endbr64 
  802f32:	55                   	push   rbp
  802f33:	48 89 e5             	mov    rbp,rsp
  802f36:	53                   	push   rbx
  802f37:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  802f3b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  802f42:	eb 23                	jmp    802f67 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  802f44:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f47:	48 63 d0             	movsxd rdx,eax
  802f4a:	48 89 d0             	mov    rax,rdx
  802f4d:	48 01 c0             	add    rax,rax
  802f50:	48 01 d0             	add    rax,rdx
  802f53:	48 c1 e0 06          	shl    rax,0x6
  802f57:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  802f5d:	8b 00                	mov    eax,DWORD PTR [rax]
  802f5f:	85 c0                	test   eax,eax
  802f61:	74 0c                	je     802f6f <make_request+0x41>
    for(;i<NR_REQS;i++)
  802f63:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802f67:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802f6b:	7e d7                	jle    802f44 <make_request+0x16>
  802f6d:	eb 01                	jmp    802f70 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  802f6f:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  802f70:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  802f74:	75 0a                	jne    802f80 <make_request+0x52>
  802f76:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802f7b:	e9 e7 01 00 00       	jmp    803167 <make_request+0x239>
    reqs[i]=*args;//放入数组
  802f80:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f83:	48 63 d0             	movsxd rdx,eax
  802f86:	48 89 d0             	mov    rax,rdx
  802f89:	48 01 c0             	add    rax,rax
  802f8c:	48 01 d0             	add    rax,rdx
  802f8f:	48 c1 e0 06          	shl    rax,0x6
  802f93:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  802f9a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802f9e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802fa1:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802fa5:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802fa8:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802fac:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802fb0:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802fb4:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802fb8:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802fbc:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802fc0:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802fc4:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802fc8:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802fcc:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802fd0:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802fd4:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802fd8:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802fdc:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802fe0:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802fe4:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802fe8:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802fec:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802ff0:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802ff4:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802ff8:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802ffc:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803000:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803004:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803008:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80300c:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803010:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803014:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803018:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80301c:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803023:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80302a:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803031:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803038:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80303f:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803046:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80304d:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803054:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80305b:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803062:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803069:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803070:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803077:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80307e:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803085:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80308c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803090:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803096:	48 63 d0             	movsxd rdx,eax
  803099:	48 89 d0             	mov    rax,rdx
  80309c:	48 c1 e0 02          	shl    rax,0x2
  8030a0:	48 01 d0             	add    rax,rdx
  8030a3:	48 c1 e0 02          	shl    rax,0x2
  8030a7:	48 01 d0             	add    rax,rdx
  8030aa:	48 c1 e0 03          	shl    rax,0x3
  8030ae:	48 05 80 2e 40 00    	add    rax,0x402e80
  8030b4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8030b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8030bc:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8030c3:	48 85 c0             	test   rax,rax
  8030c6:	75 27                	jne    8030ef <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8030c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030cb:	48 63 d0             	movsxd rdx,eax
  8030ce:	48 89 d0             	mov    rax,rdx
  8030d1:	48 01 c0             	add    rax,rax
  8030d4:	48 01 d0             	add    rax,rdx
  8030d7:	48 c1 e0 06          	shl    rax,0x6
  8030db:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8030e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8030e6:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8030ed:	eb 75                	jmp    803164 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8030ef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8030f3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8030fa:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8030fe:	eb 0f                	jmp    80310f <make_request+0x1e1>
  803100:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803104:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80310b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80310f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803113:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80311a:	48 85 c0             	test   rax,rax
  80311d:	75 e1                	jne    803100 <make_request+0x1d2>
        p->next=&reqs[i];
  80311f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803122:	48 63 d0             	movsxd rdx,eax
  803125:	48 89 d0             	mov    rax,rdx
  803128:	48 01 c0             	add    rax,rax
  80312b:	48 01 d0             	add    rax,rdx
  80312e:	48 c1 e0 06          	shl    rax,0x6
  803132:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803139:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80313d:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803144:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803147:	48 63 d0             	movsxd rdx,eax
  80314a:	48 89 d0             	mov    rax,rdx
  80314d:	48 01 c0             	add    rax,rax
  803150:	48 01 d0             	add    rax,rdx
  803153:	48 c1 e0 06          	shl    rax,0x6
  803157:	48 05 38 6d 40 00    	add    rax,0x406d38
  80315d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803164:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803167:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80316b:	c9                   	leave  
  80316c:	c3                   	ret    

000000000080316d <do_req>:
//取出一个申请并且执行
int do_req()
{
  80316d:	f3 0f 1e fa          	endbr64 
  803171:	55                   	push   rbp
  803172:	48 89 e5             	mov    rbp,rsp
  803175:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803179:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803180:	e9 ab 00 00 00       	jmp    803230 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803185:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803188:	48 98                	cdqe   
  80318a:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803191:	00 
  803192:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803196:	e9 86 00 00 00       	jmp    803221 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80319b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80319f:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8031a6:	48 85 c0             	test   rax,rax
  8031a9:	75 67                	jne    803212 <do_req+0xa5>
  8031ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031af:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8031b6:	48 85 c0             	test   rax,rax
  8031b9:	74 57                	je     803212 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8031bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031bf:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8031c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031ca:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8031d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031d5:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8031dc:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8031e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031e7:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8031ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031f2:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8031f8:	48 98                	cdqe   
  8031fa:	48 8b 14 c5 60 b1 80 	mov    rdx,QWORD PTR [rax*8+0x80b160]
  803201:	00 
  803202:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803206:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80320d:	48 89 c7             	mov    rdi,rax
  803210:	ff d2                	call   rdx
        for(;p;p=p->next)
  803212:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803216:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80321d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803221:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803226:	0f 85 6f ff ff ff    	jne    80319b <do_req+0x2e>
    for(int i=0;i<3;i++)
  80322c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803230:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803234:	0f 8e 4b ff ff ff    	jle    803185 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  80323a:	b8 00 00 00 00       	mov    eax,0x0
}
  80323f:	c9                   	leave  
  803240:	c3                   	ret    

0000000000803241 <wait_on_req>:


void wait_on_req(int reqi)
{
  803241:	f3 0f 1e fa          	endbr64 
  803245:	55                   	push   rbp
  803246:	48 89 e5             	mov    rbp,rsp
  803249:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80324c:	90                   	nop
  80324d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803250:	48 63 d0             	movsxd rdx,eax
  803253:	48 89 d0             	mov    rax,rdx
  803256:	48 01 c0             	add    rax,rax
  803259:	48 01 d0             	add    rax,rdx
  80325c:	48 c1 e0 06          	shl    rax,0x6
  803260:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803266:	8b 00                	mov    eax,DWORD PTR [rax]
  803268:	83 f8 03             	cmp    eax,0x3
  80326b:	75 e0                	jne    80324d <wait_on_req+0xc>
}
  80326d:	90                   	nop
  80326e:	90                   	nop
  80326f:	5d                   	pop    rbp
  803270:	c3                   	ret    

0000000000803271 <clear_req>:
void clear_req(int reqi)
{
  803271:	f3 0f 1e fa          	endbr64 
  803275:	55                   	push   rbp
  803276:	48 89 e5             	mov    rbp,rsp
  803279:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80327c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80327f:	48 63 d0             	movsxd rdx,eax
  803282:	48 89 d0             	mov    rax,rdx
  803285:	48 01 c0             	add    rax,rax
  803288:	48 01 d0             	add    rax,rdx
  80328b:	48 c1 e0 06          	shl    rax,0x6
  80328f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803295:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80329b:	90                   	nop
  80329c:	5d                   	pop    rbp
  80329d:	c3                   	ret    

000000000080329e <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80329e:	f3 0f 1e fa          	endbr64 
  8032a2:	55                   	push   rbp
  8032a3:	48 89 e5             	mov    rbp,rsp
  8032a6:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8032aa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8032b1:	eb 61                	jmp    803314 <init_proc+0x76>
        task[i].pid=-1;
  8032b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032b6:	48 63 d0             	movsxd rdx,eax
  8032b9:	48 89 d0             	mov    rax,rdx
  8032bc:	48 01 c0             	add    rax,rax
  8032bf:	48 01 d0             	add    rax,rdx
  8032c2:	48 c1 e0 08          	shl    rax,0x8
  8032c6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8032cc:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8032d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032d5:	48 63 d0             	movsxd rdx,eax
  8032d8:	48 89 d0             	mov    rax,rdx
  8032db:	48 01 c0             	add    rax,rax
  8032de:	48 01 d0             	add    rax,rdx
  8032e1:	48 c1 e0 08          	shl    rax,0x8
  8032e5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8032eb:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8032f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f4:	48 63 d0             	movsxd rdx,eax
  8032f7:	48 89 d0             	mov    rax,rdx
  8032fa:	48 01 c0             	add    rax,rax
  8032fd:	48 01 d0             	add    rax,rdx
  803300:	48 c1 e0 08          	shl    rax,0x8
  803304:	48 05 28 85 40 00    	add    rax,0x408528
  80330a:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803310:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803314:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803318:	7e 99                	jle    8032b3 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  80331a:	c7 05 08 12 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11208],0x0        # 41452c <cur_proc>
  803321:	00 00 00 
    current=task;
  803324:	48 c7 05 71 11 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc11171],0x4084a0        # 4144a0 <current>
  80332b:	a0 84 40 00 
    pidd=1;
  80332f:	c7 05 f7 11 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc111f7],0x1        # 414530 <pidd>
  803336:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803339:	b8 00 00 00 00       	mov    eax,0x0
  80333e:	e8 8d 02 00 00       	call   8035d0 <create_proc>
  803343:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803346:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803349:	48 63 d0             	movsxd rdx,eax
  80334c:	48 89 d0             	mov    rax,rdx
  80334f:	48 01 c0             	add    rax,rax
  803352:	48 01 d0             	add    rax,rdx
  803355:	48 c1 e0 08          	shl    rax,0x8
  803359:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80335f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803365:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803368:	83 c0 03             	add    eax,0x3
  80336b:	c1 e0 04             	shl    eax,0x4
  80336e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803371:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803374:	01 c0                	add    eax,eax
  803376:	83 c0 05             	add    eax,0x5
  803379:	c1 e0 03             	shl    eax,0x3
  80337c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  80337f:	68 00 00 80 00       	push   0x800000
  803384:	68 00 00 80 00       	push   0x800000
  803389:	68 00 00 80 00       	push   0x800000
  80338e:	68 00 00 80 00       	push   0x800000
  803393:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803399:	41 b8 00 00 80 00    	mov    r8d,0x800000
  80339f:	b9 00 00 80 00       	mov    ecx,0x800000
  8033a4:	ba 00 00 40 00       	mov    edx,0x400000
  8033a9:	be 00 00 40 00       	mov    esi,0x400000
  8033ae:	bf 00 00 40 00       	mov    edi,0x400000
  8033b3:	e8 c2 13 00 00       	call   80477a <set_tss>
  8033b8:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  8033bc:	48 8b 05 bd 7d 00 00 	mov    rax,QWORD PTR [rip+0x7dbd]        # 80b180 <tss>
  8033c3:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  8033c7:	48 89 c6             	mov    rsi,rax
  8033ca:	bf a8 06 00 00       	mov    edi,0x6a8
  8033cf:	e8 1a d4 ff ff       	call   8007ee <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8033d4:	be 08 00 00 00       	mov    esi,0x8
  8033d9:	bf 74 01 00 00       	mov    edi,0x174
  8033de:	e8 0b d4 ff ff       	call   8007ee <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8033e3:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8033ea:	00 20 00 
  8033ed:	48 89 c6             	mov    rsi,rax
  8033f0:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8033f5:	48 89 c7             	mov    rdi,rax
  8033f8:	e8 f1 d3 ff ff       	call   8007ee <wrmsr>
    //创建一个测试进程
    create_test_proc();
  8033fd:	b8 00 00 00 00       	mov    eax,0x0
  803402:	e8 03 00 00 00       	call   80340a <create_test_proc>
}
  803407:	90                   	nop
  803408:	c9                   	leave  
  803409:	c3                   	ret    

000000000080340a <create_test_proc>:
void create_test_proc(){
  80340a:	f3 0f 1e fa          	endbr64 
  80340e:	55                   	push   rbp
  80340f:	48 89 e5             	mov    rbp,rsp
  803412:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803416:	b8 00 00 00 00       	mov    eax,0x0
  80341b:	e8 33 02 00 00       	call   803653 <req_proc>
  803420:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803423:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803426:	48 63 d0             	movsxd rdx,eax
  803429:	48 89 d0             	mov    rax,rdx
  80342c:	48 01 c0             	add    rax,rax
  80342f:	48 01 d0             	add    rax,rdx
  803432:	48 c1 e0 08          	shl    rax,0x8
  803436:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80343c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803442:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803449:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80344d:	ba f2 b0 80 00       	mov    edx,0x80b0f2
  803452:	48 83 ec 08          	sub    rsp,0x8
  803456:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803459:	50                   	push   rax
  80345a:	6a 00                	push   0x0
  80345c:	52                   	push   rdx
  80345d:	6a 00                	push   0x0
  80345f:	6a 00                	push   0x0
  803461:	6a 00                	push   0x0
  803463:	68 58 7d 00 00       	push   0x7d58
  803468:	6a 10                	push   0x10
  80346a:	6a 10                	push   0x10
  80346c:	6a 10                	push   0x10
  80346e:	6a 10                	push   0x10
  803470:	41 b9 08 00 00 00    	mov    r9d,0x8
  803476:	41 b8 10 00 00 00    	mov    r8d,0x10
  80347c:	b9 00 00 00 00       	mov    ecx,0x0
  803481:	ba 00 00 00 00       	mov    edx,0x0
  803486:	be 00 00 00 00       	mov    esi,0x0
  80348b:	bf 00 00 00 00       	mov    edi,0x0
  803490:	e8 b7 02 00 00       	call   80374c <set_proc>
  803495:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803499:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80349c:	48 63 d0             	movsxd rdx,eax
  80349f:	48 89 d0             	mov    rax,rdx
  8034a2:	48 01 c0             	add    rax,rax
  8034a5:	48 01 d0             	add    rax,rdx
  8034a8:	48 c1 e0 08          	shl    rax,0x8
  8034ac:	48 05 68 86 40 00    	add    rax,0x408668
  8034b2:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  8034b9:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  8034c0:	00 
    str->rax=0;
  8034c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034c5:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  8034cc:	00 
    str->rbx=0;
  8034cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034d1:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  8034d8:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  8034d9:	ba b8 38 80 00       	mov    edx,0x8038b8
  8034de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034e2:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  8034e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ea:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  8034f1:	00 
    str->rsi=0;
  8034f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034f6:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  8034fd:	00 
    str->rdi=0;
  8034fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803502:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803509:	00 
    str->r15=0;
  80350a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80350e:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803515:	00 
    str->r14=0;
  803516:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80351a:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803521:	00 
    str->r13=0;
  803522:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803526:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  80352d:	00 
    str->r12=0;
  80352e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803532:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803539:	00 
    str->r11=0x200;
  80353a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80353e:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  803545:	00 
    str->r10=0;
  803546:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80354a:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803551:	00 
    str->r9=0;
  803552:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803556:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  80355d:	00 
    str->r8=0;
  80355e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803562:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803569:	00 
    str->rip=proc_zero;
  80356a:	ba b8 38 80 00       	mov    edx,0x8038b8
  80356f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803573:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  80357a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80357e:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803585:	08 00 00 00 
    str->rflags=0x00200206;
  803589:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80358d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  803594:	06 02 20 00 
    str->rsp=0x7e00;
  803598:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80359c:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  8035a3:	00 7e 00 00 
    str->ss=0x2b;
  8035a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8035ab:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  8035b2:	2b 00 00 00 
    str->ds=0x2b;
  8035b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8035ba:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  8035c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8035c5:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  8035cc:	00 

}
  8035cd:	90                   	nop
  8035ce:	c9                   	leave  
  8035cf:	c3                   	ret    

00000000008035d0 <create_proc>:
int create_proc()
{
  8035d0:	f3 0f 1e fa          	endbr64 
  8035d4:	55                   	push   rbp
  8035d5:	48 89 e5             	mov    rbp,rsp
  8035d8:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  8035dc:	b8 00 00 00 00       	mov    eax,0x0
  8035e1:	e8 6d 00 00 00       	call   803653 <req_proc>
  8035e6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  8035e9:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8035ed:	75 07                	jne    8035f6 <create_proc+0x26>
  8035ef:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035f4:	eb 5b                	jmp    803651 <create_proc+0x81>
    int currsp=0x9fc00-1;
  8035f6:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8035fd:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803601:	b9 b8 38 80 00       	mov    ecx,0x8038b8
  803606:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803609:	48 98                	cdqe   
  80360b:	48 83 ec 08          	sub    rsp,0x8
  80360f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803612:	52                   	push   rdx
  803613:	6a 00                	push   0x0
  803615:	51                   	push   rcx
  803616:	6a 00                	push   0x0
  803618:	6a 00                	push   0x0
  80361a:	6a 00                	push   0x0
  80361c:	50                   	push   rax
  80361d:	6a 10                	push   0x10
  80361f:	6a 10                	push   0x10
  803621:	6a 10                	push   0x10
  803623:	6a 10                	push   0x10
  803625:	41 b9 08 00 00 00    	mov    r9d,0x8
  80362b:	41 b8 10 00 00 00    	mov    r8d,0x10
  803631:	b9 00 00 00 00       	mov    ecx,0x0
  803636:	ba 00 00 00 00       	mov    edx,0x0
  80363b:	be 00 00 00 00       	mov    esi,0x0
  803640:	bf 00 00 00 00       	mov    edi,0x0
  803645:	e8 02 01 00 00       	call   80374c <set_proc>
  80364a:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  80364e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803651:	c9                   	leave  
  803652:	c3                   	ret    

0000000000803653 <req_proc>:
int req_proc(){
  803653:	f3 0f 1e fa          	endbr64 
  803657:	55                   	push   rbp
  803658:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80365b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803662:	eb 04                	jmp    803668 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803664:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803668:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80366b:	48 63 d0             	movsxd rdx,eax
  80366e:	48 89 d0             	mov    rax,rdx
  803671:	48 01 c0             	add    rax,rax
  803674:	48 01 d0             	add    rax,rdx
  803677:	48 c1 e0 08          	shl    rax,0x8
  80367b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803681:	8b 00                	mov    eax,DWORD PTR [rax]
  803683:	83 f8 ff             	cmp    eax,0xffffffff
  803686:	74 26                	je     8036ae <req_proc+0x5b>
  803688:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80368b:	48 63 d0             	movsxd rdx,eax
  80368e:	48 89 d0             	mov    rax,rdx
  803691:	48 01 c0             	add    rax,rax
  803694:	48 01 d0             	add    rax,rdx
  803697:	48 c1 e0 08          	shl    rax,0x8
  80369b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8036a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8036a3:	83 f8 03             	cmp    eax,0x3
  8036a6:	74 06                	je     8036ae <req_proc+0x5b>
  8036a8:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8036ac:	7e b6                	jle    803664 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8036ae:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8036b2:	7e 0a                	jle    8036be <req_proc+0x6b>
        return -1;
  8036b4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8036b9:	e9 8c 00 00 00       	jmp    80374a <req_proc+0xf7>
    task[num].pid=pidd++;
  8036be:	8b 05 6c 0e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10e6c]        # 414530 <pidd>
  8036c4:	8d 50 01             	lea    edx,[rax+0x1]
  8036c7:	89 15 63 0e c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10e63],edx        # 414530 <pidd>
  8036cd:	89 c1                	mov    ecx,eax
  8036cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d2:	48 63 d0             	movsxd rdx,eax
  8036d5:	48 89 d0             	mov    rax,rdx
  8036d8:	48 01 c0             	add    rax,rax
  8036db:	48 01 d0             	add    rax,rdx
  8036de:	48 c1 e0 08          	shl    rax,0x8
  8036e2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8036e8:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  8036ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036ed:	48 63 d0             	movsxd rdx,eax
  8036f0:	48 89 d0             	mov    rax,rdx
  8036f3:	48 01 c0             	add    rax,rax
  8036f6:	48 01 d0             	add    rax,rdx
  8036f9:	48 c1 e0 08          	shl    rax,0x8
  8036fd:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803703:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803709:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80370c:	48 63 d0             	movsxd rdx,eax
  80370f:	48 89 d0             	mov    rax,rdx
  803712:	48 01 c0             	add    rax,rax
  803715:	48 01 d0             	add    rax,rdx
  803718:	48 c1 e0 08          	shl    rax,0x8
  80371c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803722:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803728:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80372b:	48 63 d0             	movsxd rdx,eax
  80372e:	48 89 d0             	mov    rax,rdx
  803731:	48 01 c0             	add    rax,rax
  803734:	48 01 d0             	add    rax,rdx
  803737:	48 c1 e0 08          	shl    rax,0x8
  80373b:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803741:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803747:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80374a:	5d                   	pop    rbp
  80374b:	c3                   	ret    

000000000080374c <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  80374c:	f3 0f 1e fa          	endbr64 
  803750:	55                   	push   rbp
  803751:	48 89 e5             	mov    rbp,rsp
  803754:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803758:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80375c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803760:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803764:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803768:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  80376c:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  80376f:	48 63 d0             	movsxd rdx,eax
  803772:	48 89 d0             	mov    rax,rdx
  803775:	48 01 c0             	add    rax,rax
  803778:	48 01 d0             	add    rax,rdx
  80377b:	48 c1 e0 08          	shl    rax,0x8
  80377f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803785:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  803789:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80378d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803791:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=rbx;
  803798:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80379c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8037a0:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=rcx;
  8037a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037ab:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8037af:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=rdx;
  8037b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037ba:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8037be:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  8037c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037c9:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8037cd:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  8037d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037d8:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8037dc:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  8037e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037e7:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8037eb:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  8037f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037f6:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8037fa:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803801:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803805:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803809:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803810:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803814:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803818:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=rsp;
  80381f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803823:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803827:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=rbp;
  80382e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803832:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803836:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=rsi;
  80383d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803841:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803845:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=rdi;
  80384c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803850:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803854:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  80385b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80385f:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803866:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  80386a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80386e:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803872:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803879:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80387d:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803881:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803888:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80388c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803890:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803897:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80389b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80389f:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  8038a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8038aa:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  8038b1:	00 10 10 00 


}
  8038b5:	90                   	nop
  8038b6:	5d                   	pop    rbp
  8038b7:	c3                   	ret    

00000000008038b8 <proc_zero>:
void proc_zero()
{
  8038b8:	f3 0f 1e fa          	endbr64 
  8038bc:	55                   	push   rbp
  8038bd:	48 89 e5             	mov    rbp,rsp
//    asm volatile("mov $1,%rax\n"
//                 ".byte 0x48\n"
//                 "syscall");
    while(1);
  8038c0:	eb fe                	jmp    8038c0 <proc_zero+0x8>

00000000008038c2 <manage_proc>:
}
void manage_proc(){
  8038c2:	f3 0f 1e fa          	endbr64 
  8038c6:	55                   	push   rbp
  8038c7:	48 89 e5             	mov    rbp,rsp
  8038ca:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  8038ce:	8b 05 58 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c58]        # 41452c <cur_proc>
  8038d4:	83 f8 ff             	cmp    eax,0xffffffff
  8038d7:	74 39                	je     803912 <manage_proc+0x50>
        task[cur_proc].utime++;
  8038d9:	8b 15 4d 0c c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc10c4d]        # 41452c <cur_proc>
  8038df:	48 63 ca             	movsxd rcx,edx
  8038e2:	48 89 c8             	mov    rax,rcx
  8038e5:	48 01 c0             	add    rax,rax
  8038e8:	48 01 c8             	add    rax,rcx
  8038eb:	48 c1 e0 08          	shl    rax,0x8
  8038ef:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8038f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8038f7:	8d 48 01             	lea    ecx,[rax+0x1]
  8038fa:	48 63 d2             	movsxd rdx,edx
  8038fd:	48 89 d0             	mov    rax,rdx
  803900:	48 01 c0             	add    rax,rax
  803903:	48 01 d0             	add    rax,rdx
  803906:	48 c1 e0 08          	shl    rax,0x8
  80390a:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803910:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803912:	8b 05 14 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c14]        # 41452c <cur_proc>
  803918:	83 f8 ff             	cmp    eax,0xffffffff
  80391b:	74 4a                	je     803967 <manage_proc+0xa5>
  80391d:	8b 05 09 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c09]        # 41452c <cur_proc>
  803923:	48 63 d0             	movsxd rdx,eax
  803926:	48 89 d0             	mov    rax,rdx
  803929:	48 01 c0             	add    rax,rax
  80392c:	48 01 d0             	add    rax,rdx
  80392f:	48 c1 e0 08          	shl    rax,0x8
  803933:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803939:	8b 00                	mov    eax,DWORD PTR [rax]
  80393b:	83 f8 01             	cmp    eax,0x1
  80393e:	77 27                	ja     803967 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803940:	8b 05 e6 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10be6]        # 41452c <cur_proc>
  803946:	48 63 d0             	movsxd rdx,eax
  803949:	48 89 d0             	mov    rax,rdx
  80394c:	48 01 c0             	add    rax,rax
  80394f:	48 01 d0             	add    rax,rdx
  803952:	48 c1 e0 08          	shl    rax,0x8
  803956:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80395c:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80395e:	83 f8 01             	cmp    eax,0x1
  803961:	0f 84 21 01 00 00    	je     803a88 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803967:	8b 05 bf 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bbf]        # 41452c <cur_proc>
  80396d:	83 f8 ff             	cmp    eax,0xffffffff
  803970:	74 22                	je     803994 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803972:	8b 05 b4 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bb4]        # 41452c <cur_proc>
  803978:	48 63 d0             	movsxd rdx,eax
  80397b:	48 89 d0             	mov    rax,rdx
  80397e:	48 01 c0             	add    rax,rax
  803981:	48 01 d0             	add    rax,rdx
  803984:	48 c1 e0 08          	shl    rax,0x8
  803988:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80398e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803994:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  80399b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8039a2:	eb 4f                	jmp    8039f3 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  8039a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039a7:	48 63 d0             	movsxd rdx,eax
  8039aa:	48 89 d0             	mov    rax,rdx
  8039ad:	48 01 c0             	add    rax,rax
  8039b0:	48 01 d0             	add    rax,rdx
  8039b3:	48 c1 e0 08          	shl    rax,0x8
  8039b7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039bd:	8b 00                	mov    eax,DWORD PTR [rax]
  8039bf:	83 f8 ff             	cmp    eax,0xffffffff
  8039c2:	74 2b                	je     8039ef <manage_proc+0x12d>
  8039c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039c7:	48 63 d0             	movsxd rdx,eax
  8039ca:	48 89 d0             	mov    rax,rdx
  8039cd:	48 01 c0             	add    rax,rax
  8039d0:	48 01 d0             	add    rax,rdx
  8039d3:	48 c1 e0 08          	shl    rax,0x8
  8039d7:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039dd:	8b 00                	mov    eax,DWORD PTR [rax]
  8039df:	83 f8 01             	cmp    eax,0x1
  8039e2:	75 0b                	jne    8039ef <manage_proc+0x12d>
  8039e4:	8b 05 42 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b42]        # 41452c <cur_proc>
  8039ea:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8039ed:	75 0c                	jne    8039fb <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  8039ef:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039f3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039f7:	7e ab                	jle    8039a4 <manage_proc+0xe2>
  8039f9:	eb 01                	jmp    8039fc <manage_proc+0x13a>
                break;
  8039fb:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  8039fc:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a00:	0f 8f 85 00 00 00    	jg     803a8b <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  803a06:	8b 05 20 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b20]        # 41452c <cur_proc>
  803a0c:	48 63 d0             	movsxd rdx,eax
  803a0f:	48 89 d0             	mov    rax,rdx
  803a12:	48 01 c0             	add    rax,rax
  803a15:	48 01 d0             	add    rax,rdx
  803a18:	48 c1 e0 08          	shl    rax,0x8
  803a1c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a22:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803a28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a2b:	48 63 d0             	movsxd rdx,eax
  803a2e:	48 89 d0             	mov    rax,rdx
  803a31:	48 01 c0             	add    rax,rax
  803a34:	48 01 d0             	add    rax,rdx
  803a37:	48 c1 e0 08          	shl    rax,0x8
  803a3b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a41:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803a47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a4a:	48 63 d0             	movsxd rdx,eax
  803a4d:	48 89 d0             	mov    rax,rdx
  803a50:	48 01 c0             	add    rax,rax
  803a53:	48 01 d0             	add    rax,rdx
  803a56:	48 c1 e0 08          	shl    rax,0x8
  803a5a:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803a61:	8b 05 c5 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ac5]        # 41452c <cur_proc>
  803a67:	48 63 c8             	movsxd rcx,eax
  803a6a:	48 89 c8             	mov    rax,rcx
  803a6d:	48 01 c0             	add    rax,rax
  803a70:	48 01 c8             	add    rax,rcx
  803a73:	48 c1 e0 08          	shl    rax,0x8
  803a77:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a7d:	48 89 d6             	mov    rsi,rdx
  803a80:	48 89 c7             	mov    rdi,rax
  803a83:	e8 6b 0b 00 00       	call   8045f3 <switch_to>
    }
    return;
  803a88:	90                   	nop
  803a89:	eb 01                	jmp    803a8c <manage_proc+0x1ca>
            return;
  803a8b:	90                   	nop
}
  803a8c:	c9                   	leave  
  803a8d:	c3                   	ret    

0000000000803a8e <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803a8e:	f3 0f 1e fa          	endbr64 
  803a92:	55                   	push   rbp
  803a93:	48 89 e5             	mov    rbp,rsp
  803a96:	48 83 ec 20          	sub    rsp,0x20
  803a9a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803a9d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803aa0:	01 c0                	add    eax,eax
  803aa2:	83 c0 05             	add    eax,0x5
  803aa5:	c1 e0 03             	shl    eax,0x3
  803aa8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803aab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803aae:	89 05 78 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10a78],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803ab4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ab7:	89 c7                	mov    edi,eax
  803ab9:	e8 4c 75 00 00       	call   80b00a <switch_proc_asm>
}
  803abe:	90                   	nop
  803abf:	c9                   	leave  
  803ac0:	c3                   	ret    

0000000000803ac1 <switch_proc>:
void switch_proc(int pnr){
  803ac1:	f3 0f 1e fa          	endbr64 
  803ac5:	55                   	push   rbp
  803ac6:	48 89 e5             	mov    rbp,rsp
  803ac9:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803ad0:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803ad6:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803adc:	48 63 d0             	movsxd rdx,eax
  803adf:	48 89 d0             	mov    rax,rdx
  803ae2:	48 01 c0             	add    rax,rax
  803ae5:	48 01 d0             	add    rax,rdx
  803ae8:	48 c1 e0 08          	shl    rax,0x8
  803aec:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803af3:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803afa:	48 89 d6             	mov    rsi,rdx
  803afd:	ba 60 00 00 00       	mov    edx,0x60
  803b02:	48 89 c7             	mov    rdi,rax
  803b05:	48 89 d1             	mov    rcx,rdx
  803b08:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803b0b:	8b 05 1b 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a1b]        # 41452c <cur_proc>
  803b11:	48 63 d0             	movsxd rdx,eax
  803b14:	48 89 d0             	mov    rax,rdx
  803b17:	48 01 c0             	add    rax,rax
  803b1a:	48 01 d0             	add    rax,rdx
  803b1d:	48 c1 e0 08          	shl    rax,0x8
  803b21:	48 05 c0 01 00 00    	add    rax,0x1c0
  803b27:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b2d:	48 83 c0 04          	add    rax,0x4
  803b31:	48 89 c7             	mov    rdi,rax
  803b34:	e8 53 00 00 00       	call   803b8c <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803b39:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b3f:	89 05 e7 09 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc109e7],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803b45:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b4b:	01 c0                	add    eax,eax
  803b4d:	83 c0 05             	add    eax,0x5
  803b50:	c1 e0 03             	shl    eax,0x3
  803b53:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803b56:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b5c:	48 63 d0             	movsxd rdx,eax
  803b5f:	48 89 d0             	mov    rax,rdx
  803b62:	48 01 c0             	add    rax,rax
  803b65:	48 01 d0             	add    rax,rdx
  803b68:	48 c1 e0 08          	shl    rax,0x8
  803b6c:	48 05 c0 01 00 00    	add    rax,0x1c0
  803b72:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b78:	48 83 c0 04          	add    rax,0x4
  803b7c:	48 89 c6             	mov    rsi,rax
  803b7f:	bf 00 00 00 00       	mov    edi,0x0
  803b84:	e8 6a 0a 00 00       	call   8045f3 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803b89:	90                   	nop
  803b8a:	c9                   	leave  
  803b8b:	c3                   	ret    

0000000000803b8c <save_context>:
void save_context(TSS *tss)
{
  803b8c:	f3 0f 1e fa          	endbr64 
  803b90:	55                   	push   rbp
  803b91:	48 89 e5             	mov    rbp,rsp
  803b94:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803b98:	90                   	nop
  803b99:	5d                   	pop    rbp
  803b9a:	c3                   	ret    

0000000000803b9b <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803b9b:	f3 0f 1e fa          	endbr64 
  803b9f:	55                   	push   rbp
  803ba0:	48 89 e5             	mov    rbp,rsp
  803ba3:	48 83 ec 60          	sub    rsp,0x60
  803ba7:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803baa:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803bad:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803bb0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803bb6:	85 c0                	test   eax,eax
  803bb8:	0f 48 c2             	cmovs  eax,edx
  803bbb:	c1 f8 0c             	sar    eax,0xc
  803bbe:	89 c1                	mov    ecx,eax
  803bc0:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803bc3:	99                   	cdq    
  803bc4:	c1 ea 14             	shr    edx,0x14
  803bc7:	01 d0                	add    eax,edx
  803bc9:	25 ff 0f 00 00       	and    eax,0xfff
  803bce:	29 d0                	sub    eax,edx
  803bd0:	01 c8                	add    eax,ecx
  803bd2:	85 c0                	test   eax,eax
  803bd4:	0f 95 c0             	setne  al
  803bd7:	0f b6 c0             	movzx  eax,al
  803bda:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803bdd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803be4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803beb:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803bec:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803bf3:	00 
    pgind++;
  803bf4:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803bf9:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803c00:	e9 76 02 00 00       	jmp    803e7b <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803c05:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803c0c:	25 00 f0 ff ff       	and    eax,0xfffff000
  803c11:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803c15:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803c1c:	e9 44 02 00 00       	jmp    803e65 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803c21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803c28:	83 e0 01             	and    eax,0x1
  803c2b:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803c2e:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803c32:	0f 85 24 02 00 00    	jne    803e5c <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803c38:	b8 00 00 00 00       	mov    eax,0x0
  803c3d:	e8 6c d8 ff ff       	call   8014ae <req_a_page>
  803c42:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803c45:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803c49:	0f 85 dc 00 00 00    	jne    803d2b <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803c4f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803c52:	48 63 d0             	movsxd rdx,eax
  803c55:	48 89 d0             	mov    rax,rdx
  803c58:	48 01 c0             	add    rax,rax
  803c5b:	48 01 d0             	add    rax,rdx
  803c5e:	48 c1 e0 08          	shl    rax,0x8
  803c62:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803c68:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803c6b:	0f b7 c0             	movzx  eax,ax
  803c6e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803c71:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803c74:	48 63 d0             	movsxd rdx,eax
  803c77:	48 89 d0             	mov    rax,rdx
  803c7a:	48 01 c0             	add    rax,rax
  803c7d:	48 01 d0             	add    rax,rdx
  803c80:	48 c1 e0 08          	shl    rax,0x8
  803c84:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803c8a:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803c8e:	0f b7 c0             	movzx  eax,ax
  803c91:	c1 e0 10             	shl    eax,0x10
  803c94:	25 00 00 0f 00       	and    eax,0xf0000
  803c99:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803c9c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c9f:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803ca2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803ca5:	89 c1                	mov    ecx,eax
  803ca7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803caa:	48 63 d0             	movsxd rdx,eax
  803cad:	48 89 d0             	mov    rax,rdx
  803cb0:	48 01 c0             	add    rax,rax
  803cb3:	48 01 d0             	add    rax,rdx
  803cb6:	48 c1 e0 08          	shl    rax,0x8
  803cba:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803cc0:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803cc3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803cc6:	48 63 d0             	movsxd rdx,eax
  803cc9:	48 89 d0             	mov    rax,rdx
  803ccc:	48 01 c0             	add    rax,rax
  803ccf:	48 01 d0             	add    rax,rdx
  803cd2:	48 c1 e0 08          	shl    rax,0x8
  803cd6:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803cdc:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803ce0:	0f b7 c0             	movzx  eax,ax
  803ce3:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803ce6:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803ced:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803cf0:	c1 e8 10             	shr    eax,0x10
  803cf3:	83 e0 0f             	and    eax,0xf
  803cf6:	89 c2                	mov    edx,eax
  803cf8:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803cfb:	01 d0                	add    eax,edx
  803cfd:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803d00:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803d03:	89 c1                	mov    ecx,eax
  803d05:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803d08:	48 63 d0             	movsxd rdx,eax
  803d0b:	48 89 d0             	mov    rax,rdx
  803d0e:	48 01 c0             	add    rax,rax
  803d11:	48 01 d0             	add    rax,rdx
  803d14:	48 c1 e0 08          	shl    rax,0x8
  803d18:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803d1e:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803d22:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803d26:	e9 62 01 00 00       	jmp    803e8d <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  803d2b:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803d2e:	89 c7                	mov    edi,eax
  803d30:	e8 27 d9 ff ff       	call   80165c <get_phyaddr>
  803d35:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803d38:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803d3b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d3f:	ba 07 00 00 00       	mov    edx,0x7
  803d44:	89 ce                	mov    esi,ecx
  803d46:	48 89 c7             	mov    rdi,rax
  803d49:	e8 21 d9 ff ff       	call   80166f <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803d4e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d51:	c1 e0 0a             	shl    eax,0xa
  803d54:	89 c2                	mov    edx,eax
  803d56:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803d59:	01 d0                	add    eax,edx
  803d5b:	c1 e0 0c             	shl    eax,0xc
  803d5e:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  803d61:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  803d66:	75 09                	jne    803d71 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  803d68:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  803d6b:	89 05 c3 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107c3],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  803d71:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  803d75:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  803d79:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  803d7d:	0f 85 d9 00 00 00    	jne    803e5c <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803d83:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803d86:	48 63 d0             	movsxd rdx,eax
  803d89:	48 89 d0             	mov    rax,rdx
  803d8c:	48 01 c0             	add    rax,rax
  803d8f:	48 01 d0             	add    rax,rdx
  803d92:	48 c1 e0 08          	shl    rax,0x8
  803d96:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803d9c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803d9f:	0f b7 c0             	movzx  eax,ax
  803da2:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803da5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803da8:	48 63 d0             	movsxd rdx,eax
  803dab:	48 89 d0             	mov    rax,rdx
  803dae:	48 01 c0             	add    rax,rax
  803db1:	48 01 d0             	add    rax,rdx
  803db4:	48 c1 e0 08          	shl    rax,0x8
  803db8:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803dbe:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803dc2:	0f b7 c0             	movzx  eax,ax
  803dc5:	c1 e0 10             	shl    eax,0x10
  803dc8:	25 00 00 0f 00       	and    eax,0xf0000
  803dcd:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  803dd0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803dd3:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803dd6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803dd9:	89 c1                	mov    ecx,eax
  803ddb:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803dde:	48 63 d0             	movsxd rdx,eax
  803de1:	48 89 d0             	mov    rax,rdx
  803de4:	48 01 c0             	add    rax,rax
  803de7:	48 01 d0             	add    rax,rdx
  803dea:	48 c1 e0 08          	shl    rax,0x8
  803dee:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803df4:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803df7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803dfa:	48 63 d0             	movsxd rdx,eax
  803dfd:	48 89 d0             	mov    rax,rdx
  803e00:	48 01 c0             	add    rax,rax
  803e03:	48 01 d0             	add    rax,rdx
  803e06:	48 c1 e0 08          	shl    rax,0x8
  803e0a:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803e10:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803e14:	0f b7 c0             	movzx  eax,ax
  803e17:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  803e1a:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803e21:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803e24:	c1 e8 10             	shr    eax,0x10
  803e27:	83 e0 0f             	and    eax,0xf
  803e2a:	89 c2                	mov    edx,eax
  803e2c:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  803e2f:	01 d0                	add    eax,edx
  803e31:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803e34:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  803e37:	89 c1                	mov    ecx,eax
  803e39:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e3c:	48 63 d0             	movsxd rdx,eax
  803e3f:	48 89 d0             	mov    rax,rdx
  803e42:	48 01 c0             	add    rax,rax
  803e45:	48 01 d0             	add    rax,rdx
  803e48:	48 c1 e0 08          	shl    rax,0x8
  803e4c:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803e52:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  803e56:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803e5a:	eb 31                	jmp    803e8d <palloc+0x2f2>
                }
            }
            tblp++;
  803e5c:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  803e61:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  803e65:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  803e6c:	0f 8e af fd ff ff    	jle    803c21 <palloc+0x86>
        }
        pgind++;
  803e72:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e77:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  803e7b:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  803e82:	0f 8e 7d fd ff ff    	jle    803c05 <palloc+0x6a>
    }
    return NULL;
  803e88:	b8 00 00 00 00       	mov    eax,0x0
}
  803e8d:	c9                   	leave  
  803e8e:	c3                   	ret    

0000000000803e8f <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  803e8f:	f3 0f 1e fa          	endbr64 
  803e93:	55                   	push   rbp
  803e94:	48 89 e5             	mov    rbp,rsp
  803e97:	48 83 ec 10          	sub    rsp,0x10
  803e9b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  803e9e:	8b 05 88 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10688]        # 41452c <cur_proc>
  803ea4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803ea7:	89 d6                	mov    esi,edx
  803ea9:	89 c7                	mov    edi,eax
  803eab:	e8 eb fc ff ff       	call   803b9b <palloc>
}
  803eb0:	c9                   	leave  
  803eb1:	c3                   	ret    

0000000000803eb2 <proc_end>:
void proc_end()
{
  803eb2:	f3 0f 1e fa          	endbr64 
  803eb6:	55                   	push   rbp
  803eb7:	48 89 e5             	mov    rbp,rsp
  803eba:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  803ebe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  803ec1:	8b 05 65 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10665]        # 41452c <cur_proc>
  803ec7:	89 c7                	mov    edi,eax
  803ec9:	e8 90 00 00 00       	call   803f5e <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  803ece:	8b 05 58 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10658]        # 41452c <cur_proc>
  803ed4:	48 63 d0             	movsxd rdx,eax
  803ed7:	48 89 d0             	mov    rax,rdx
  803eda:	48 01 c0             	add    rax,rax
  803edd:	48 01 d0             	add    rax,rdx
  803ee0:	48 c1 e0 08          	shl    rax,0x8
  803ee4:	48 05 28 85 40 00    	add    rax,0x408528
  803eea:	8b 00                	mov    eax,DWORD PTR [rax]
  803eec:	83 f8 ff             	cmp    eax,0xffffffff
  803eef:	74 60                	je     803f51 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  803ef1:	8b 05 35 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10635]        # 41452c <cur_proc>
  803ef7:	48 63 d0             	movsxd rdx,eax
  803efa:	48 89 d0             	mov    rax,rdx
  803efd:	48 01 c0             	add    rax,rax
  803f00:	48 01 d0             	add    rax,rdx
  803f03:	48 c1 e0 08          	shl    rax,0x8
  803f07:	48 05 28 85 40 00    	add    rax,0x408528
  803f0d:	8b 00                	mov    eax,DWORD PTR [rax]
  803f0f:	89 c2                	mov    edx,eax
  803f11:	48 89 d0             	mov    rax,rdx
  803f14:	48 01 c0             	add    rax,rax
  803f17:	48 01 d0             	add    rax,rdx
  803f1a:	48 c1 e0 08          	shl    rax,0x8
  803f1e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f24:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  803f2a:	8b 05 fc 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc105fc]        # 41452c <cur_proc>
  803f30:	48 63 d0             	movsxd rdx,eax
  803f33:	48 89 d0             	mov    rax,rdx
  803f36:	48 01 c0             	add    rax,rax
  803f39:	48 01 d0             	add    rax,rdx
  803f3c:	48 c1 e0 08          	shl    rax,0x8
  803f40:	48 05 28 85 40 00    	add    rax,0x408528
  803f46:	8b 00                	mov    eax,DWORD PTR [rax]
  803f48:	89 c7                	mov    edi,eax
  803f4a:	e8 3f fb ff ff       	call   803a8e <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  803f4f:	eb 0a                	jmp    803f5b <proc_end+0xa9>
        switch_proc_tss(0);
  803f51:	bf 00 00 00 00       	mov    edi,0x0
  803f56:	e8 33 fb ff ff       	call   803a8e <switch_proc_tss>
}
  803f5b:	90                   	nop
  803f5c:	c9                   	leave  
  803f5d:	c3                   	ret    

0000000000803f5e <del_proc>:
void del_proc(int pnr)
{
  803f5e:	f3 0f 1e fa          	endbr64 
  803f62:	55                   	push   rbp
  803f63:	48 89 e5             	mov    rbp,rsp
  803f66:	48 83 ec 30          	sub    rsp,0x30
  803f6a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  803f6d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f70:	48 63 d0             	movsxd rdx,eax
  803f73:	48 89 d0             	mov    rax,rdx
  803f76:	48 01 c0             	add    rax,rax
  803f79:	48 01 d0             	add    rax,rdx
  803f7c:	48 c1 e0 08          	shl    rax,0x8
  803f80:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f86:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  803f8c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f8f:	48 63 d0             	movsxd rdx,eax
  803f92:	48 89 d0             	mov    rax,rdx
  803f95:	48 01 c0             	add    rax,rax
  803f98:	48 01 d0             	add    rax,rdx
  803f9b:	48 c1 e0 08          	shl    rax,0x8
  803f9f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803fa5:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  803fab:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  803fb0:	eb 63                	jmp    804015 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  803fb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fb9:	25 00 f0 ff ff       	and    eax,0xfffff000
  803fbe:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  803fc2:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  803fc9:	eb 30                	jmp    803ffb <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  803fcb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803fcf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fd2:	83 e0 01             	and    eax,0x1
  803fd5:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  803fd8:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  803fdc:	74 14                	je     803ff2 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  803fde:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803fe2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fe5:	25 00 f0 ff ff       	and    eax,0xfffff000
  803fea:	48 89 c7             	mov    rdi,rax
  803fed:	e8 8c d5 ff ff       	call   80157e <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  803ff2:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  803ff7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  803ffb:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804002:	7e c7                	jle    803fcb <del_proc+0x6d>
        }
        vmfree(tp);
  804004:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804008:	48 89 c7             	mov    rdi,rax
  80400b:	e8 99 d1 ff ff       	call   8011a9 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804010:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804015:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804019:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80401c:	83 e0 01             	and    eax,0x1
  80401f:	48 85 c0             	test   rax,rax
  804022:	75 8e                	jne    803fb2 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804024:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804028:	48 89 c7             	mov    rdi,rax
  80402b:	e8 79 d1 ff ff       	call   8011a9 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804030:	90                   	nop
  804031:	c9                   	leave  
  804032:	c3                   	ret    

0000000000804033 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804033:	f3 0f 1e fa          	endbr64 
  804037:	55                   	push   rbp
  804038:	48 89 e5             	mov    rbp,rsp
  80403b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80403e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804041:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804045:	75 0a                	jne    804051 <set_proc_stat+0x1e>
  804047:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80404c:	e9 8c 00 00 00       	jmp    8040dd <set_proc_stat+0xaa>
    int i=0;
  804051:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804058:	eb 04                	jmp    80405e <set_proc_stat+0x2b>
  80405a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80405e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804061:	48 63 d0             	movsxd rdx,eax
  804064:	48 89 d0             	mov    rax,rdx
  804067:	48 01 c0             	add    rax,rax
  80406a:	48 01 d0             	add    rax,rdx
  80406d:	48 c1 e0 08          	shl    rax,0x8
  804071:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804077:	8b 10                	mov    edx,DWORD PTR [rax]
  804079:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80407c:	39 c2                	cmp    edx,eax
  80407e:	75 da                	jne    80405a <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  804080:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804084:	75 07                	jne    80408d <set_proc_stat+0x5a>
  804086:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80408b:	eb 50                	jmp    8040dd <set_proc_stat+0xaa>
    task[i].stat=stat;
  80408d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804090:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804093:	48 63 c8             	movsxd rcx,eax
  804096:	48 89 c8             	mov    rax,rcx
  804099:	48 01 c0             	add    rax,rax
  80409c:	48 01 c8             	add    rax,rcx
  80409f:	48 c1 e0 08          	shl    rax,0x8
  8040a3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040a9:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8040ab:	8b 05 7b 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1047b]        # 41452c <cur_proc>
  8040b1:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8040b4:	75 22                	jne    8040d8 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  8040b6:	8b 05 70 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10470]        # 41452c <cur_proc>
  8040bc:	48 63 d0             	movsxd rdx,eax
  8040bf:	48 89 d0             	mov    rax,rdx
  8040c2:	48 01 c0             	add    rax,rax
  8040c5:	48 01 d0             	add    rax,rdx
  8040c8:	48 c1 e0 08          	shl    rax,0x8
  8040cc:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8040d2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8040d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8040dd:	5d                   	pop    rbp
  8040de:	c3                   	ret    

00000000008040df <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  8040df:	f3 0f 1e fa          	endbr64 
  8040e3:	55                   	push   rbp
  8040e4:	48 89 e5             	mov    rbp,rsp
  8040e7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8040eb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8040f2:	eb 6a                	jmp    80415e <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  8040f4:	8b 05 32 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10432]        # 41452c <cur_proc>
  8040fa:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8040fd:	48 63 ca             	movsxd rcx,edx
  804100:	48 63 d0             	movsxd rdx,eax
  804103:	48 89 d0             	mov    rax,rdx
  804106:	48 01 c0             	add    rax,rax
  804109:	48 01 d0             	add    rax,rdx
  80410c:	48 c1 e0 05          	shl    rax,0x5
  804110:	48 01 c8             	add    rax,rcx
  804113:	48 83 c0 18          	add    rax,0x18
  804117:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  80411e:	00 
  80411f:	48 85 c0             	test   rax,rax
  804122:	75 36                	jne    80415a <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804124:	8b 05 02 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10402]        # 41452c <cur_proc>
  80412a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80412d:	48 63 ca             	movsxd rcx,edx
  804130:	48 63 d0             	movsxd rdx,eax
  804133:	48 89 d0             	mov    rax,rdx
  804136:	48 01 c0             	add    rax,rax
  804139:	48 01 d0             	add    rax,rdx
  80413c:	48 c1 e0 05          	shl    rax,0x5
  804140:	48 01 c8             	add    rax,rcx
  804143:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804147:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80414b:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804152:	00 
            return 0;
  804153:	b8 00 00 00 00       	mov    eax,0x0
  804158:	eb 0f                	jmp    804169 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80415a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80415e:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804162:	7e 90                	jle    8040f4 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804164:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804169:	5d                   	pop    rbp
  80416a:	c3                   	ret    

000000000080416b <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  80416b:	f3 0f 1e fa          	endbr64 
  80416f:	55                   	push   rbp
  804170:	48 89 e5             	mov    rbp,rsp
  804173:	48 83 ec 10          	sub    rsp,0x10
  804177:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  80417a:	8b 05 ac 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103ac]        # 41452c <cur_proc>
  804180:	89 c7                	mov    edi,eax
  804182:	e8 d7 fd ff ff       	call   803f5e <del_proc>
    while(1)
        manage_proc();
  804187:	b8 00 00 00 00       	mov    eax,0x0
  80418c:	e8 31 f7 ff ff       	call   8038c2 <manage_proc>
  804191:	eb f4                	jmp    804187 <sys_exit+0x1c>

0000000000804193 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804193:	f3 0f 1e fa          	endbr64 
  804197:	55                   	push   rbp
  804198:	48 89 e5             	mov    rbp,rsp
  80419b:	53                   	push   rbx
  80419c:	48 83 ec 48          	sub    rsp,0x48
  8041a0:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  8041a4:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  8041a8:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  8041ac:	b8 00 00 00 00       	mov    eax,0x0
  8041b1:	e8 9d f4 ff ff       	call   803653 <req_proc>
  8041b6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  8041b9:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8041bd:	75 0a                	jne    8041c9 <reg_proc+0x36>
  8041bf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8041c4:	e9 c6 01 00 00       	jmp    80438f <reg_proc+0x1fc>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  8041c9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8041cd:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8041d0:	52                   	push   rdx
  8041d1:	6a 00                	push   0x0
  8041d3:	50                   	push   rax
  8041d4:	6a 00                	push   0x0
  8041d6:	6a 00                	push   0x0
  8041d8:	6a 00                	push   0x0
  8041da:	6a ff                	push   0xffffffffffffffff
  8041dc:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  8041e3:	00 
  8041e4:	6a 28                	push   0x28
  8041e6:	6a 28                	push   0x28
  8041e8:	6a 28                	push   0x28
  8041ea:	6a 28                	push   0x28
  8041ec:	41 b9 30 00 00 00    	mov    r9d,0x30
  8041f2:	41 b8 28 00 00 00    	mov    r8d,0x28
  8041f8:	b9 00 00 00 00       	mov    ecx,0x0
  8041fd:	ba 00 00 00 00       	mov    edx,0x0
  804202:	be 00 00 00 00       	mov    esi,0x0
  804207:	bf 00 00 00 00       	mov    edi,0x0
  80420c:	e8 3b f5 ff ff       	call   80374c <set_proc>
  804211:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, 0x0000fffffffffffful, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804215:	b8 00 00 00 00       	mov    eax,0x0
  80421a:	e8 fb ce ff ff       	call   80111a <vmalloc>
  80421f:	48 89 c1             	mov    rcx,rax
  804222:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804225:	48 63 d0             	movsxd rdx,eax
  804228:	48 89 d0             	mov    rax,rdx
  80422b:	48 01 c0             	add    rax,rax
  80422e:	48 01 d0             	add    rax,rdx
  804231:	48 c1 e0 08          	shl    rax,0x8
  804235:	48 05 40 85 40 00    	add    rax,0x408540
  80423b:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  80423f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804242:	48 63 d0             	movsxd rdx,eax
  804245:	48 89 d0             	mov    rax,rdx
  804248:	48 01 c0             	add    rax,rax
  80424b:	48 01 d0             	add    rax,rdx
  80424e:	48 c1 e0 08          	shl    rax,0x8
  804252:	48 05 40 85 40 00    	add    rax,0x408540
  804258:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  80425c:	b8 00 00 00 00       	mov    eax,0x0
  804261:	e8 b4 ce ff ff       	call   80111a <vmalloc>
  804266:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804269:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80426c:	48 63 d0             	movsxd rdx,eax
  80426f:	48 89 d0             	mov    rax,rdx
  804272:	48 01 c0             	add    rax,rax
  804275:	48 01 d0             	add    rax,rdx
  804278:	48 c1 e0 08          	shl    rax,0x8
  80427c:	48 05 40 85 40 00    	add    rax,0x408540
  804282:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804286:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  80428a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80428e:	ba 03 00 00 00       	mov    edx,0x3
  804293:	be 00 00 00 00       	mov    esi,0x0
  804298:	48 89 c7             	mov    rdi,rax
  80429b:	e8 20 d4 ff ff       	call   8016c0 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  8042a0:	b8 00 00 00 00       	mov    eax,0x0
  8042a5:	e8 70 ce ff ff       	call   80111a <vmalloc>
  8042aa:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  8042ae:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8042b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8042b6:	48 83 c0 18          	add    rax,0x18
  8042ba:	48 83 ca 07          	or     rdx,0x7
  8042be:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  8042c1:	b8 00 00 00 00       	mov    eax,0x0
  8042c6:	e8 e3 d1 ff ff       	call   8014ae <req_a_page>
  8042cb:	89 c7                	mov    edi,eax
  8042cd:	e8 8a d3 ff ff       	call   80165c <get_phyaddr>
  8042d2:	89 c1                	mov    ecx,eax
  8042d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8042d8:	48 05 f8 0f 00 00    	add    rax,0xff8
  8042de:	ba 06 00 00 00       	mov    edx,0x6
  8042e3:	89 ce                	mov    esi,ecx
  8042e5:	48 89 c7             	mov    rdi,rax
  8042e8:	e8 2a d4 ff ff       	call   801717 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  8042ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8042f0:	48 63 d0             	movsxd rdx,eax
  8042f3:	48 89 d0             	mov    rax,rdx
  8042f6:	48 01 c0             	add    rax,rax
  8042f9:	48 01 d0             	add    rax,rdx
  8042fc:	48 c1 e0 08          	shl    rax,0x8
  804300:	48 05 40 85 40 00    	add    rax,0x408540
  804306:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80430a:	48 89 c1             	mov    rcx,rax
  80430d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804310:	48 63 d0             	movsxd rdx,eax
  804313:	48 89 d0             	mov    rax,rdx
  804316:	48 01 c0             	add    rax,rax
  804319:	48 01 d0             	add    rax,rdx
  80431c:	48 c1 e0 08          	shl    rax,0x8
  804320:	48 05 d0 86 40 00    	add    rax,0x4086d0
  804326:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  804329:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80432c:	48 63 d0             	movsxd rdx,eax
  80432f:	48 89 d0             	mov    rax,rdx
  804332:	48 01 c0             	add    rax,rax
  804335:	48 01 d0             	add    rax,rdx
  804338:	48 c1 e0 08          	shl    rax,0x8
  80433c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804342:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804348:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80434b:	48 63 d0             	movsxd rdx,eax
  80434e:	48 89 d0             	mov    rax,rdx
  804351:	48 01 c0             	add    rax,rax
  804354:	48 01 d0             	add    rax,rdx
  804357:	48 c1 e0 08          	shl    rax,0x8
  80435b:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804362:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804366:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  80436a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80436d:	48 63 d0             	movsxd rdx,eax
  804370:	48 89 d0             	mov    rax,rdx
  804373:	48 01 c0             	add    rax,rax
  804376:	48 01 d0             	add    rax,rdx
  804379:	48 c1 e0 08          	shl    rax,0x8
  80437d:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804384:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804388:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  80438c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80438f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804393:	c9                   	leave  
  804394:	c3                   	ret    

0000000000804395 <sys_malloc>:

void * sys_malloc(int size)
{
  804395:	f3 0f 1e fa          	endbr64 
  804399:	55                   	push   rbp
  80439a:	48 89 e5             	mov    rbp,rsp
  80439d:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8043a0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8043a3:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8043a9:	85 c0                	test   eax,eax
  8043ab:	0f 48 c2             	cmovs  eax,edx
  8043ae:	c1 f8 0c             	sar    eax,0xc
  8043b1:	89 c1                	mov    ecx,eax
  8043b3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8043b6:	99                   	cdq    
  8043b7:	c1 ea 14             	shr    edx,0x14
  8043ba:	01 d0                	add    eax,edx
  8043bc:	25 ff 0f 00 00       	and    eax,0xfff
  8043c1:	29 d0                	sub    eax,edx
  8043c3:	01 c8                	add    eax,ecx
  8043c5:	85 c0                	test   eax,eax
  8043c7:	0f 95 c0             	setne  al
  8043ca:	0f b6 c0             	movzx  eax,al
  8043cd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8043d0:	8b 05 56 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10156]        # 41452c <cur_proc>
  8043d6:	48 63 d0             	movsxd rdx,eax
  8043d9:	48 89 d0             	mov    rax,rdx
  8043dc:	48 01 c0             	add    rax,rax
  8043df:	48 01 d0             	add    rax,rdx
  8043e2:	48 c1 e0 08          	shl    rax,0x8
  8043e6:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8043ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8043ee:	48 98                	cdqe   
  8043f0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8043f4:	eb 0c                	jmp    804402 <sys_malloc+0x6d>
        hp=hp->next;
  8043f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043fa:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8043fe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804402:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804406:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80440a:	48 85 c0             	test   rax,rax
  80440d:	74 16                	je     804425 <sys_malloc+0x90>
  80440f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804413:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804416:	85 c0                	test   eax,eax
  804418:	75 0b                	jne    804425 <sys_malloc+0x90>
  80441a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80441e:	8b 00                	mov    eax,DWORD PTR [rax]
  804420:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804423:	7e d1                	jle    8043f6 <sys_malloc+0x61>
    if(hp->pgn<n)
  804425:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804429:	8b 00                	mov    eax,DWORD PTR [rax]
  80442b:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80442e:	0f 8e 8d 00 00 00    	jle    8044c1 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804434:	8b 05 f2 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100f2]        # 41452c <cur_proc>
  80443a:	48 63 d0             	movsxd rdx,eax
  80443d:	48 89 d0             	mov    rax,rdx
  804440:	48 01 c0             	add    rax,rax
  804443:	48 01 d0             	add    rax,rdx
  804446:	48 c1 e0 08          	shl    rax,0x8
  80444a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804450:	8b 10                	mov    edx,DWORD PTR [rax]
  804452:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804455:	c1 e0 0c             	shl    eax,0xc
  804458:	01 d0                	add    eax,edx
  80445a:	3d ff ff ef 01       	cmp    eax,0x1efffff
  80445f:	7e 0a                	jle    80446b <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804461:	b8 00 00 00 00       	mov    eax,0x0
  804466:	e9 cf 00 00 00       	jmp    80453a <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  80446b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80446f:	8b 10                	mov    edx,DWORD PTR [rax]
  804471:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804474:	29 d0                	sub    eax,edx
  804476:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804479:	8b 05 ad 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100ad]        # 41452c <cur_proc>
  80447f:	48 63 d0             	movsxd rdx,eax
  804482:	48 89 d0             	mov    rax,rdx
  804485:	48 01 c0             	add    rax,rax
  804488:	48 01 d0             	add    rax,rdx
  80448b:	48 c1 e0 08          	shl    rax,0x8
  80448f:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804495:	8b 00                	mov    eax,DWORD PTR [rax]
  804497:	48 98                	cdqe   
  804499:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80449d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8044a4:	eb 13                	jmp    8044b9 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  8044a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8044aa:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8044ad:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8044b4:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8044b5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8044b9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044bc:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8044bf:	7c e5                	jl     8044a6 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  8044c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044c5:	8b 00                	mov    eax,DWORD PTR [rax]
  8044c7:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8044ca:	7d 59                	jge    804525 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  8044cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044d0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8044d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8044d7:	83 c0 01             	add    eax,0x1
  8044da:	c1 e0 0c             	shl    eax,0xc
  8044dd:	48 98                	cdqe   
  8044df:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8044e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8044e7:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8044eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8044f1:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8044f4:	8d 50 ff             	lea    edx,[rax-0x1]
  8044f7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8044fb:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8044fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804501:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804505:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804509:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80450d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804511:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804515:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804519:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80451d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804521:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804525:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804529:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804530:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804534:	48 05 00 10 00 00    	add    rax,0x1000
}
  80453a:	5d                   	pop    rbp
  80453b:	c3                   	ret    

000000000080453c <sys_free>:
int sys_free(int ptr)
{
  80453c:	f3 0f 1e fa          	endbr64 
  804540:	55                   	push   rbp
  804541:	48 89 e5             	mov    rbp,rsp
  804544:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804547:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80454a:	2d 00 10 00 00       	sub    eax,0x1000
  80454f:	48 98                	cdqe   
  804551:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804555:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804559:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804560:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804564:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804568:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80456c:	eb 2e                	jmp    80459c <sys_free+0x60>
    {
        if(p->alloc==0)
  80456e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804572:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804575:	85 c0                	test   eax,eax
  804577:	75 2c                	jne    8045a5 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804579:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80457d:	8b 10                	mov    edx,DWORD PTR [rax]
  80457f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804583:	8b 00                	mov    eax,DWORD PTR [rax]
  804585:	83 c0 01             	add    eax,0x1
  804588:	01 c2                	add    edx,eax
  80458a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80458e:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804590:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804594:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804598:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80459c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8045a1:	75 cb                	jne    80456e <sys_free+0x32>
  8045a3:	eb 01                	jmp    8045a6 <sys_free+0x6a>
            break;
  8045a5:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8045a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045aa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8045ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8045b2:	eb 2e                	jmp    8045e2 <sys_free+0xa6>
    {
        if(p->alloc==0)
  8045b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045b8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8045bb:	85 c0                	test   eax,eax
  8045bd:	75 2c                	jne    8045eb <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8045bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045c3:	8b 10                	mov    edx,DWORD PTR [rax]
  8045c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8045cb:	83 c0 01             	add    eax,0x1
  8045ce:	01 c2                	add    edx,eax
  8045d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045d4:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8045d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8045de:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8045e2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8045e7:	75 cb                	jne    8045b4 <sys_free+0x78>
  8045e9:	eb 01                	jmp    8045ec <sys_free+0xb0>
            break;
  8045eb:	90                   	nop
    }
    //合并完成
    return 0;
  8045ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8045f1:	5d                   	pop    rbp
  8045f2:	c3                   	ret    

00000000008045f3 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8045f3:	f3 0f 1e fa          	endbr64 
  8045f7:	55                   	push   rbp
  8045f8:	48 89 e5             	mov    rbp,rsp
  8045fb:	53                   	push   rbx
  8045fc:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804600:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804604:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804608:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  80460e:	48 c1 f8 08          	sar    rax,0x8
  804612:	48 89 c2             	mov    rdx,rax
  804615:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  80461c:	aa aa aa 
  80461f:	48 0f af c2          	imul   rax,rdx
  804623:	89 05 03 ff c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0ff03],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  804629:	8b 05 fd fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fefd]        # 41452c <cur_proc>
  80462f:	48 63 d0             	movsxd rdx,eax
  804632:	48 89 d0             	mov    rax,rdx
  804635:	48 01 c0             	add    rax,rax
  804638:	48 01 d0             	add    rax,rdx
  80463b:	48 c1 e0 08          	shl    rax,0x8
  80463f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804645:	48 89 05 54 fe c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fe54],rax        # 4144a0 <current>
    asm volatile("mov %%rsp,%0\r\n"
  80464c:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804650:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804654:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804658:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  80465c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804660:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804664:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804668:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  80466c:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804670:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804674:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  80467b:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 8046a6 <done>
  804682:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804689:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804690:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804696:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  80469d:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  8046a4:	eb 08                	jmp    8046ae <__switch_to>

00000000008046a6 <done>:
  8046a6:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  8046a7:	90                   	nop
  8046a8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8046ac:	c9                   	leave  
  8046ad:	c3                   	ret    

00000000008046ae <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  8046ae:	f3 0f 1e fa          	endbr64 
  8046b2:	55                   	push   rbp
  8046b3:	48 89 e5             	mov    rbp,rsp
  8046b6:	53                   	push   rbx
  8046b7:	48 83 ec 18          	sub    rsp,0x18
  8046bb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8046bf:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8046c3:	48 8b 05 b6 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ab6]        # 80b180 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8046ca:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8046ce:	48 8b 05 ab 6a 00 00 	mov    rax,QWORD PTR [rip+0x6aab]        # 80b180 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8046d5:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8046d9:	48 8b 05 a0 6a 00 00 	mov    rax,QWORD PTR [rip+0x6aa0]        # 80b180 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8046e0:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8046e4:	48 8b 05 95 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a95]        # 80b180 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8046eb:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8046ef:	48 8b 05 8a 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a8a]        # 80b180 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8046f6:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8046fa:	48 8b 05 7f 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a7f]        # 80b180 <tss>
  804701:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804705:	48 8b 05 74 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a74]        # 80b180 <tss>
  80470c:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804710:	48 8b 05 69 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a69]        # 80b180 <tss>
  804717:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80471b:	48 8b 05 5e 6a 00 00 	mov    rax,QWORD PTR [rip+0x6a5e]        # 80b180 <tss>
  804722:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804726:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80472a:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804731:	41 52                	push   r10
  804733:	41 51                	push   r9
  804735:	41 50                	push   r8
  804737:	57                   	push   rdi
  804738:	49 89 d9             	mov    r9,rbx
  80473b:	4d 89 d8             	mov    r8,r11
  80473e:	48 89 c7             	mov    rdi,rax
  804741:	e8 34 00 00 00       	call   80477a <set_tss>
  804746:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  80474a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80474e:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804752:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804756:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80475a:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804760:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804766:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  80476c:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  804772:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804773:	90                   	nop
  804774:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804778:	c9                   	leave  
  804779:	c3                   	ret    

000000000080477a <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  80477a:	f3 0f 1e fa          	endbr64 
  80477e:	55                   	push   rbp
  80477f:	48 89 e5             	mov    rbp,rsp
  804782:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804786:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80478a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80478e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804792:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804796:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  80479a:	48 8b 05 df 69 00 00 	mov    rax,QWORD PTR [rip+0x69df]        # 80b180 <tss>
  8047a1:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8047a5:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  8047a9:	48 8b 05 d0 69 00 00 	mov    rax,QWORD PTR [rip+0x69d0]        # 80b180 <tss>
  8047b0:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8047b4:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  8047b8:	48 8b 05 c1 69 00 00 	mov    rax,QWORD PTR [rip+0x69c1]        # 80b180 <tss>
  8047bf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8047c3:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  8047c7:	48 8b 05 b2 69 00 00 	mov    rax,QWORD PTR [rip+0x69b2]        # 80b180 <tss>
  8047ce:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8047d2:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  8047d6:	48 8b 05 a3 69 00 00 	mov    rax,QWORD PTR [rip+0x69a3]        # 80b180 <tss>
  8047dd:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8047e1:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  8047e5:	48 8b 05 94 69 00 00 	mov    rax,QWORD PTR [rip+0x6994]        # 80b180 <tss>
  8047ec:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8047f0:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  8047f4:	48 8b 05 85 69 00 00 	mov    rax,QWORD PTR [rip+0x6985]        # 80b180 <tss>
  8047fb:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8047ff:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804803:	48 8b 05 76 69 00 00 	mov    rax,QWORD PTR [rip+0x6976]        # 80b180 <tss>
  80480a:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80480e:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804812:	48 8b 05 67 69 00 00 	mov    rax,QWORD PTR [rip+0x6967]        # 80b180 <tss>
  804819:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  80481d:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804821:	48 8b 05 58 69 00 00 	mov    rax,QWORD PTR [rip+0x6958]        # 80b180 <tss>
  804828:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80482c:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804830:	90                   	nop
  804831:	5d                   	pop    rbp
  804832:	c3                   	ret    
  804833:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80483a:	00 00 00 
  80483d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000804840 <outb>:
  804840:	66 89 fa             	mov    dx,di
  804843:	66 89 f0             	mov    ax,si
  804846:	ee                   	out    dx,al
  804847:	e8 29 00 00 00       	call   804875 <io_delay>
  80484c:	c3                   	ret    

000000000080484d <outw>:
  80484d:	66 89 fa             	mov    dx,di
  804850:	66 89 f0             	mov    ax,si
  804853:	66 ef                	out    dx,ax
  804855:	90                   	nop
  804856:	90                   	nop
  804857:	90                   	nop
  804858:	c3                   	ret    

0000000000804859 <inb>:
  804859:	31 c0                	xor    eax,eax
  80485b:	66 89 fa             	mov    dx,di
  80485e:	ec                   	in     al,dx
  80485f:	90                   	nop
  804860:	90                   	nop
  804861:	90                   	nop
  804862:	c3                   	ret    

0000000000804863 <inw>:
  804863:	31 c0                	xor    eax,eax
  804865:	66 89 fa             	mov    dx,di
  804868:	66 ed                	in     ax,dx
  80486a:	90                   	nop
  80486b:	90                   	nop
  80486c:	90                   	nop
  80486d:	c3                   	ret    

000000000080486e <eoi>:
  80486e:	b0 20                	mov    al,0x20
  804870:	e6 a0                	out    0xa0,al
  804872:	e6 20                	out    0x20,al
  804874:	c3                   	ret    

0000000000804875 <io_delay>:
  804875:	90                   	nop
  804876:	90                   	nop
  804877:	90                   	nop
  804878:	90                   	nop
  804879:	c3                   	ret    

000000000080487a <turn_on_int>:
  80487a:	b0 f8                	mov    al,0xf8
  80487c:	e6 21                	out    0x21,al
  80487e:	e8 f2 ff ff ff       	call   804875 <io_delay>
  804883:	b0 af                	mov    al,0xaf
  804885:	e6 a1                	out    0xa1,al
  804887:	e8 e9 ff ff ff       	call   804875 <io_delay>
  80488c:	b8 00 70 10 00       	mov    eax,0x107000
  804891:	0f 01 18             	lidt   [rax]
  804894:	90                   	nop
  804895:	90                   	nop
  804896:	90                   	nop
  804897:	90                   	nop
  804898:	c3                   	ret    

0000000000804899 <report_back_trace_of_err>:
  804899:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80489e:	50                   	push   rax
  80489f:	68 a8 48 80 00       	push   0x8048a8
  8048a4:	83 c4 08             	add    esp,0x8
  8048a7:	c3                   	ret    

00000000008048a8 <bt_msg>:
  8048a8:	65 72 72             	gs jb  80491d <fill_desc+0x4e>
  8048ab:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8048ac:	72 20                	jb     8048ce <init_gdt+0x11>
  8048ae:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8048af:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8048b2:	72 73                	jb     804927 <fill_desc+0x58>
  8048b4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8048b7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea535 <_knl_end+0x2ea535>

00000000008048bd <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8048bd:	f3 0f 1e fa          	endbr64 
  8048c1:	55                   	push   rbp
  8048c2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  8048c5:	66 b8 48 00          	mov    ax,0x48
  8048c9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  8048cc:	90                   	nop
  8048cd:	5d                   	pop    rbp
  8048ce:	c3                   	ret    

00000000008048cf <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  8048cf:	f3 0f 1e fa          	endbr64 
  8048d3:	55                   	push   rbp
  8048d4:	48 89 e5             	mov    rbp,rsp
  8048d7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8048db:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8048df:	89 d0                	mov    eax,edx
  8048e1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  8048e4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  8048e8:	48 8b 15 99 68 00 00 	mov    rdx,QWORD PTR [rip+0x6899]        # 80b188 <gdt>
  8048ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048f2:	48 c1 e0 04          	shl    rax,0x4
  8048f6:	48 01 d0             	add    rax,rdx
  8048f9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8048fd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804901:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804905:	48 c1 e8 10          	shr    rax,0x10
  804909:	48 89 c1             	mov    rcx,rax
  80490c:	48 8b 15 75 68 00 00 	mov    rdx,QWORD PTR [rip+0x6875]        # 80b188 <gdt>
  804913:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804916:	48 c1 e0 04          	shl    rax,0x4
  80491a:	48 01 d0             	add    rax,rdx
  80491d:	89 ca                	mov    edx,ecx
  80491f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804922:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804926:	48 c1 e8 18          	shr    rax,0x18
  80492a:	48 89 c1             	mov    rcx,rax
  80492d:	48 8b 15 54 68 00 00 	mov    rdx,QWORD PTR [rip+0x6854]        # 80b188 <gdt>
  804934:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804937:	48 c1 e0 04          	shl    rax,0x4
  80493b:	48 01 d0             	add    rax,rdx
  80493e:	89 ca                	mov    edx,ecx
  804940:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804943:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804947:	48 c1 e8 20          	shr    rax,0x20
  80494b:	48 89 c2             	mov    rdx,rax
  80494e:	48 8b 0d 33 68 00 00 	mov    rcx,QWORD PTR [rip+0x6833]        # 80b188 <gdt>
  804955:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804958:	48 c1 e0 04          	shl    rax,0x4
  80495c:	48 01 c8             	add    rax,rcx
  80495f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804962:	48 8b 15 1f 68 00 00 	mov    rdx,QWORD PTR [rip+0x681f]        # 80b188 <gdt>
  804969:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80496c:	48 c1 e0 04          	shl    rax,0x4
  804970:	48 01 d0             	add    rax,rdx
  804973:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804977:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80497a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80497e:	48 c1 e8 08          	shr    rax,0x8
  804982:	66 25 f0 00          	and    ax,0xf0
  804986:	48 8b 0d fb 67 00 00 	mov    rcx,QWORD PTR [rip+0x67fb]        # 80b188 <gdt>
  80498d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804990:	48 c1 e2 04          	shl    rdx,0x4
  804994:	48 01 ca             	add    rdx,rcx
  804997:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80499b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80499f:	90                   	nop
  8049a0:	5d                   	pop    rbp
  8049a1:	c3                   	ret    

00000000008049a2 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  8049a2:	f3 0f 1e fa          	endbr64 
  8049a6:	55                   	push   rbp
  8049a7:	48 89 e5             	mov    rbp,rsp
  8049aa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8049ad:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8049b0:	89 c8                	mov    eax,ecx
  8049b2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  8049b6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  8049ba:	48 8b 05 c7 67 00 00 	mov    rax,QWORD PTR [rip+0x67c7]        # 80b188 <gdt>
  8049c1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  8049c5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8049c8:	48 c1 e0 04          	shl    rax,0x4
  8049cc:	48 89 c2             	mov    rdx,rax
  8049cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049d3:	48 01 d0             	add    rax,rdx
  8049d6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8049d9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  8049dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8049df:	48 c1 e0 04          	shl    rax,0x4
  8049e3:	48 89 c2             	mov    rdx,rax
  8049e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049ea:	48 01 d0             	add    rax,rdx
  8049ed:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8049f0:	c1 ea 10             	shr    edx,0x10
  8049f3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  8049f6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8049f9:	48 c1 e0 04          	shl    rax,0x4
  8049fd:	48 89 c2             	mov    rdx,rax
  804a00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a04:	48 01 c2             	add    rdx,rax
  804a07:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804a0b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804a0f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a12:	48 c1 e0 04          	shl    rax,0x4
  804a16:	48 89 c2             	mov    rdx,rax
  804a19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a1d:	48 01 c2             	add    rdx,rax
  804a20:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804a24:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804a28:	90                   	nop
  804a29:	5d                   	pop    rbp
  804a2a:	c3                   	ret    

0000000000804a2b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804a2b:	f3 0f 1e fa          	endbr64 
  804a2f:	55                   	push   rbp
  804a30:	48 89 e5             	mov    rbp,rsp
  804a33:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804a36:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804a39:	89 d0                	mov    eax,edx
  804a3b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804a3f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  804a43:	90                   	nop
  804a44:	5d                   	pop    rbp
  804a45:	c3                   	ret    
  804a46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804a4d:	00 00 00 

0000000000804a50 <fill_desc>:
  804a50:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804a55:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804a5a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804a5f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804a64:	be 00 60 00 00       	mov    esi,0x6000
  804a69:	c1 e2 03             	shl    edx,0x3
  804a6c:	01 d6                	add    esi,edx
  804a6e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804a72:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804a77:	c1 e8 10             	shr    eax,0x10
  804a7a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804a7e:	c1 eb 10             	shr    ebx,0x10
  804a81:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804a85:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804a89:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804a8d:	c3                   	ret    

0000000000804a8e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804a8e:	f3 0f 1e fa          	endbr64 
  804a92:	55                   	push   rbp
  804a93:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804a96:	b8 00 00 00 00       	mov    eax,0x0
  804a9b:	e8 bb 23 00 00       	call   806e5b <execute_request>
    do_req();
  804aa0:	b8 00 00 00 00       	mov    eax,0x0
  804aa5:	e8 c3 e6 ff ff       	call   80316d <do_req>
    if(!manage_proc_lock)
  804aaa:	8b 05 78 66 00 00    	mov    eax,DWORD PTR [rip+0x6678]        # 80b128 <manage_proc_lock>
  804ab0:	85 c0                	test   eax,eax
  804ab2:	75 0a                	jne    804abe <clock_c+0x30>
    {
        manage_proc();
  804ab4:	b8 00 00 00 00       	mov    eax,0x0
  804ab9:	e8 04 ee ff ff       	call   8038c2 <manage_proc>
    }
    //puts("1 disk req executed.");
  804abe:	90                   	nop
  804abf:	5d                   	pop    rbp
  804ac0:	c3                   	ret    
  804ac1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804ac8:	00 00 00 
  804acb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804ad0 <clock>:
  804ad0:	50                   	push   rax
  804ad1:	53                   	push   rbx
  804ad2:	51                   	push   rcx
  804ad3:	52                   	push   rdx
  804ad4:	57                   	push   rdi
  804ad5:	56                   	push   rsi
  804ad6:	41 50                	push   r8
  804ad8:	41 51                	push   r9
  804ada:	41 52                	push   r10
  804adc:	41 53                	push   r11
  804ade:	41 54                	push   r12
  804ae0:	41 55                	push   r13
  804ae2:	41 56                	push   r14
  804ae4:	41 57                	push   r15
  804ae6:	66 8c c0             	mov    ax,es
  804ae9:	50                   	push   rax
  804aea:	66 8c d8             	mov    ax,ds
  804aed:	50                   	push   rax
  804aee:	66 b8 10 00          	mov    ax,0x10
  804af2:	8e c0                	mov    es,eax
  804af4:	8e d8                	mov    ds,eax

0000000000804af6 <clock.normal_part>:
  804af6:	b0 20                	mov    al,0x20
  804af8:	e6 a0                	out    0xa0,al
  804afa:	e6 20                	out    0x20,al
  804afc:	e8 8d ff ff ff       	call   804a8e <clock_c>
  804b01:	58                   	pop    rax
  804b02:	8e d8                	mov    ds,eax
  804b04:	58                   	pop    rax
  804b05:	8e c0                	mov    es,eax
  804b07:	41 5f                	pop    r15
  804b09:	41 5e                	pop    r14
  804b0b:	41 5d                	pop    r13
  804b0d:	41 5c                	pop    r12
  804b0f:	41 5b                	pop    r11
  804b11:	41 5a                	pop    r10
  804b13:	41 59                	pop    r9
  804b15:	41 58                	pop    r8
  804b17:	5e                   	pop    rsi
  804b18:	5f                   	pop    rdi
  804b19:	5a                   	pop    rdx
  804b1a:	59                   	pop    rcx
  804b1b:	5b                   	pop    rbx
  804b1c:	58                   	pop    rax
  804b1d:	48 cf                	iretq  

0000000000804b1f <sys_execve>:
    return ind;
}
*/

int sys_execve(char *path)
{
  804b1f:	f3 0f 1e fa          	endbr64 
  804b23:	55                   	push   rbp
  804b24:	48 89 e5             	mov    rbp,rsp
  804b27:	48 83 ec 30          	sub    rsp,0x30
  804b2b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804b2f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804b36:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  804b3d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804b41:	be 00 10 00 00       	mov    esi,0x1000
  804b46:	48 89 c7             	mov    rdi,rax
  804b49:	e8 f8 13 00 00       	call   805f46 <sys_open>
  804b4e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804b51:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  804b55:	79 0a                	jns    804b61 <sys_execve+0x42>
  804b57:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b5c:	e9 ba 00 00 00       	jmp    804c1b <sys_execve+0xfc>
    //
    char *p=path;
  804b61:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804b65:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804b69:	eb 05                	jmp    804b70 <sys_execve+0x51>
  804b6b:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804b70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804b77:	84 c0                	test   al,al
  804b79:	75 f0                	jne    804b6b <sys_execve+0x4c>
    for(;*p!='/'&&p>path;p--);
  804b7b:	eb 05                	jmp    804b82 <sys_execve+0x63>
  804b7d:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804b82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804b89:	3c 2f                	cmp    al,0x2f
  804b8b:	74 0a                	je     804b97 <sys_execve+0x78>
  804b8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b91:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804b95:	77 e6                	ja     804b7d <sys_execve+0x5e>
    if(p>path)
  804b97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b9b:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804b9f:	76 2f                	jbe    804bd0 <sys_execve+0xb1>
    {
        *p='\0';
  804ba1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ba5:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  804ba8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804bac:	be 00 40 00 00       	mov    esi,0x4000
  804bb1:	48 89 c7             	mov    rdi,rax
  804bb4:	e8 8d 13 00 00       	call   805f46 <sys_open>
  804bb9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804bbc:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804bc0:	79 07                	jns    804bc9 <sys_execve+0xaa>
  804bc2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804bc7:	eb 52                	jmp    804c1b <sys_execve+0xfc>
        *p='/';
  804bc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bcd:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804bd0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bd3:	48 63 d0             	movsxd rdx,eax
  804bd6:	48 89 d0             	mov    rax,rdx
  804bd9:	48 c1 e0 02          	shl    rax,0x2
  804bdd:	48 01 d0             	add    rax,rdx
  804be0:	48 c1 e0 03          	shl    rax,0x3
  804be4:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804beb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bee:	48 63 c8             	movsxd rcx,eax
  804bf1:	48 89 c8             	mov    rax,rcx
  804bf4:	48 c1 e0 02          	shl    rax,0x2
  804bf8:	48 01 c8             	add    rax,rcx
  804bfb:	48 c1 e0 03          	shl    rax,0x3
  804bff:	48 05 60 06 40 00    	add    rax,0x400660
  804c05:	b9 93 4c 80 00       	mov    ecx,0x804c93
  804c0a:	48 89 c6             	mov    rsi,rax
  804c0d:	48 89 cf             	mov    rdi,rcx
  804c10:	e8 7e f5 ff ff       	call   804193 <reg_proc>
  804c15:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804c18:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804c1b:	c9                   	leave  
  804c1c:	c3                   	ret    

0000000000804c1d <exec_call>:

int exec_call(char *path)
{
  804c1d:	f3 0f 1e fa          	endbr64 
  804c21:	55                   	push   rbp
  804c22:	48 89 e5             	mov    rbp,rsp
  804c25:	48 83 ec 20          	sub    rsp,0x20
  804c29:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= sys_execve(path);
  804c2d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c31:	48 89 c7             	mov    rdi,rax
  804c34:	e8 e6 fe ff ff       	call   804b1f <sys_execve>
  804c39:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804c3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c3f:	01 c0                	add    eax,eax
  804c41:	83 c0 05             	add    eax,0x5
  804c44:	c1 e0 03             	shl    eax,0x3
  804c47:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804c4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c4d:	89 c7                	mov    edi,eax
  804c4f:	e8 3a ee ff ff       	call   803a8e <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804c54:	90                   	nop
  804c55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c58:	48 63 d0             	movsxd rdx,eax
  804c5b:	48 89 d0             	mov    rax,rdx
  804c5e:	48 01 c0             	add    rax,rax
  804c61:	48 01 d0             	add    rax,rdx
  804c64:	48 c1 e0 08          	shl    rax,0x8
  804c68:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804c6e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c71:	83 f8 03             	cmp    eax,0x3
  804c74:	75 df                	jne    804c55 <exec_call+0x38>
    return task[pi].exit_code;
  804c76:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c79:	48 63 d0             	movsxd rdx,eax
  804c7c:	48 89 d0             	mov    rax,rdx
  804c7f:	48 01 c0             	add    rax,rax
  804c82:	48 01 d0             	add    rax,rdx
  804c85:	48 c1 e0 08          	shl    rax,0x8
  804c89:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804c8f:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804c91:	c9                   	leave  
  804c92:	c3                   	ret    

0000000000804c93 <proc_start>:
int proc_start()
{
  804c93:	f3 0f 1e fa          	endbr64 
  804c97:	55                   	push   rbp
  804c98:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804c9b:	8b 05 8b f8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f88b]        # 41452c <cur_proc>
  804ca1:	48 63 d0             	movsxd rdx,eax
  804ca4:	48 89 d0             	mov    rax,rdx
  804ca7:	48 01 c0             	add    rax,rax
  804caa:	48 01 d0             	add    rax,rdx
  804cad:	48 c1 e0 08          	shl    rax,0x8
  804cb1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804cb7:	48 89 c7             	mov    rdi,rax
  804cba:	e8 0d 00 00 00       	call   804ccc <load_pe>
    //释放进程资源
    sys_exit(0);
  804cbf:	bf 00 00 00 00       	mov    edi,0x0
  804cc4:	e8 a2 f4 ff ff       	call   80416b <sys_exit>
}
  804cc9:	90                   	nop
  804cca:	5d                   	pop    rbp
  804ccb:	c3                   	ret    

0000000000804ccc <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  804ccc:	f3 0f 1e fa          	endbr64 
  804cd0:	55                   	push   rbp
  804cd1:	48 89 e5             	mov    rbp,rsp
  804cd4:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804cdb:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  804ce2:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804ce9:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  804cf0:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  804cf4:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  804cfb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804d02:	eb 28                	jmp    804d2c <load_pe+0x60>
        if(current->openf[i]==f)
  804d04:	48 8b 05 95 f7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f795]        # 4144a0 <current>
  804d0b:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804d0e:	48 63 d2             	movsxd rdx,edx
  804d11:	48 83 c2 18          	add    rdx,0x18
  804d15:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  804d1a:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  804d1e:	75 08                	jne    804d28 <load_pe+0x5c>
        {
            exefno=i;
  804d20:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804d23:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  804d26:	eb 0a                	jmp    804d32 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  804d28:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804d2c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  804d30:	7e d2                	jle    804d04 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  804d32:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804d36:	75 0a                	jne    804d42 <load_pe+0x76>
  804d38:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d3d:	e9 ee 06 00 00       	jmp    805430 <load_pe+0x764>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804d42:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  804d49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d4c:	ba 44 00 00 00       	mov    edx,0x44
  804d51:	48 89 ce             	mov    rsi,rcx
  804d54:	89 c7                	mov    edi,eax
  804d56:	e8 ba 15 00 00       	call   806315 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  804d5b:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  804d62:	48 89 c1             	mov    rcx,rax
  804d65:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d68:	ba 00 00 00 00       	mov    edx,0x0
  804d6d:	48 89 ce             	mov    rsi,rcx
  804d70:	89 c7                	mov    edi,eax
  804d72:	e8 fe 16 00 00       	call   806475 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804d77:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804d7e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d81:	ba 0c 01 00 00       	mov    edx,0x10c
  804d86:	48 89 ce             	mov    rsi,rcx
  804d89:	89 c7                	mov    edi,eax
  804d8b:	e8 85 15 00 00       	call   806315 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  804d90:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  804d97:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804d9b:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  804da1:	c1 e8 0c             	shr    eax,0xc
  804da4:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  804da7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804daa:	ba 00 00 00 00       	mov    edx,0x0
  804daf:	be 00 00 00 00       	mov    esi,0x0
  804db4:	89 c7                	mov    edi,eax
  804db6:	e8 ba 16 00 00       	call   806475 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804dbb:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  804dbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804dc2:	ba 00 10 00 00       	mov    edx,0x1000
  804dc7:	48 89 ce             	mov    rsi,rcx
  804dca:	89 c7                	mov    edi,eax
  804dcc:	e8 44 15 00 00       	call   806315 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804dd1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804dd5:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  804dd9:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804ddd:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  804de1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804de5:	48 01 d0             	add    rax,rdx
  804de8:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804def:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804df6:	48 83 c0 04          	add    rax,0x4
  804dfa:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804e01:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804e08:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804e0b:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  804e11:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  804e17:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804e1d:	85 c0                	test   eax,eax
  804e1f:	0f 48 c2             	cmovs  eax,edx
  804e22:	c1 f8 0c             	sar    eax,0xc
  804e25:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804e2b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804e32:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  804e35:	89 c2                	mov    edx,eax
  804e37:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804e3b:	48 01 d0             	add    rax,rdx
  804e3e:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804e45:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  804e4b:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804e51:	85 c0                	test   eax,eax
  804e53:	0f 48 c2             	cmovs  eax,edx
  804e56:	c1 f8 0a             	sar    eax,0xa
  804e59:	89 c1                	mov    ecx,eax
  804e5b:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  804e61:	99                   	cdq    
  804e62:	c1 ea 16             	shr    edx,0x16
  804e65:	01 d0                	add    eax,edx
  804e67:	25 ff 03 00 00       	and    eax,0x3ff
  804e6c:	29 d0                	sub    eax,edx
  804e6e:	01 c8                	add    eax,ecx
  804e70:	85 c0                	test   eax,eax
  804e72:	0f 95 c0             	setne  al
  804e75:	0f b6 c0             	movzx  eax,al
  804e78:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804e7e:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  804e85:	48 c1 e8 15          	shr    rax,0x15
  804e89:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  804e8f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804e96:	89 c0                	mov    eax,eax
  804e98:	48 05 0c 01 00 00    	add    rax,0x10c
  804e9e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  804ea2:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804ea9:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804ead:	0f b7 d0             	movzx  edx,ax
  804eb0:	89 d0                	mov    eax,edx
  804eb2:	c1 e0 02             	shl    eax,0x2
  804eb5:	01 d0                	add    eax,edx
  804eb7:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  804eba:	05 50 01 00 00       	add    eax,0x150
  804ebf:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  804ec5:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804ecc:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  804ecf:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  804ed5:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  804edb:	99                   	cdq    
  804edc:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  804ee2:	89 d0                	mov    eax,edx
  804ee4:	85 c0                	test   eax,eax
  804ee6:	74 23                	je     804f0b <load_pe+0x23f>
  804ee8:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  804eee:	99                   	cdq    
  804eef:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  804ef5:	89 d1                	mov    ecx,edx
  804ef7:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  804efd:	29 c8                	sub    eax,ecx
  804eff:	89 c2                	mov    edx,eax
  804f01:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804f07:	01 d0                	add    eax,edx
  804f09:	eb 06                	jmp    804f11 <load_pe+0x245>
  804f0b:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  804f11:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804f17:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804f1e:	eb 6b                	jmp    804f8b <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  804f20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f24:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  804f27:	25 00 00 00 02       	and    eax,0x2000000
  804f2c:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  804f32:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  804f39:	75 46                	jne    804f81 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  804f3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f3f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  804f42:	89 c1                	mov    ecx,eax
  804f44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f47:	ba 00 00 00 00       	mov    edx,0x0
  804f4c:	48 89 ce             	mov    rsi,rcx
  804f4f:	89 c7                	mov    edi,eax
  804f51:	e8 1f 15 00 00       	call   806475 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  804f56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f5a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  804f5d:	89 c2                	mov    edx,eax
  804f5f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f63:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  804f66:	89 c1                	mov    ecx,eax
  804f68:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804f6c:	48 01 c8             	add    rax,rcx
  804f6f:	48 89 c1             	mov    rcx,rax
  804f72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f75:	48 89 ce             	mov    rsi,rcx
  804f78:	89 c7                	mov    edi,eax
  804f7a:	e8 96 13 00 00       	call   806315 <sys_read>
  804f7f:	eb 01                	jmp    804f82 <load_pe+0x2b6>
            continue;
  804f81:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804f82:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804f86:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  804f8b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804f92:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804f96:	0f b7 c0             	movzx  eax,ax
  804f99:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  804f9c:	7c 82                	jl     804f20 <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  804f9e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804fa5:	48 05 90 00 00 00    	add    rax,0x90
  804fab:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  804fb2:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  804fb9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804fbc:	85 c0                	test   eax,eax
  804fbe:	0f 84 7b 02 00 00    	je     80523f <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  804fc4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  804fcb:	8b 10                	mov    edx,DWORD PTR [rax]
  804fcd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804fd1:	01 d0                	add    eax,edx
  804fd3:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  804fd9:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  804fdf:	48 98                	cdqe   
  804fe1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  804fe5:	e9 47 02 00 00       	jmp    805231 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  804fea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804fee:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  804ff1:	89 c2                	mov    edx,eax
  804ff3:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  804ff7:	48 01 d0             	add    rax,rdx
  804ffa:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805001:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  805008:	be 68 2d 81 00       	mov    esi,0x812d68
  80500d:	48 89 c7             	mov    rdi,rax
  805010:	e8 fa 59 00 00       	call   80aa0f <strcmp>
  805015:	85 c0                	test   eax,eax
  805017:	75 09                	jne    805022 <load_pe+0x356>
            {
                dllp=0x1c00000;
  805019:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805020:	eb 25                	jmp    805047 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805022:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805029:	48 89 c7             	mov    rdi,rax
  80502c:	e8 9b fc ff ff       	call   804ccc <load_pe>
  805031:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805037:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80503d:	89 c7                	mov    edi,eax
  80503f:	e8 ee 03 00 00       	call   805432 <get_module_addr>
  805044:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805047:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80504a:	48 98                	cdqe   
  80504c:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805053:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805056:	48 63 d0             	movsxd rdx,eax
  805059:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  805060:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805064:	48 01 d0             	add    rax,rdx
  805067:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80506e:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805075:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80507b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80507e:	01 d0                	add    eax,edx
  805080:	89 c0                	mov    eax,eax
  805082:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  805089:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805090:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805093:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805099:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8050a0:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8050a3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8050a6:	01 d0                	add    eax,edx
  8050a8:	89 c0                	mov    eax,eax
  8050aa:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8050b1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8050b8:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8050bb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8050be:	01 d0                	add    eax,edx
  8050c0:	89 c0                	mov    eax,eax
  8050c2:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8050c9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8050d0:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8050d3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8050d6:	01 d0                	add    eax,edx
  8050d8:	89 c0                	mov    eax,eax
  8050da:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8050e1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8050e8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050eb:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8050f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8050f5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050f8:	89 c2                	mov    edx,eax
  8050fa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8050fe:	48 01 d0             	add    rax,rdx
  805101:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805105:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805109:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80510c:	89 c2                	mov    edx,eax
  80510e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805112:	48 01 d0             	add    rax,rdx
  805115:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805119:	e9 00 01 00 00       	jmp    80521e <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  80511e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805122:	8b 00                	mov    eax,DWORD PTR [rax]
  805124:	85 c0                	test   eax,eax
  805126:	79 43                	jns    80516b <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805128:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80512c:	8b 00                	mov    eax,DWORD PTR [rax]
  80512e:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805133:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  805139:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80513f:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  805145:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80514c:	00 
  80514d:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805154:	48 01 d0             	add    rax,rdx
  805157:	8b 10                	mov    edx,DWORD PTR [rax]
  805159:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80515c:	01 d0                	add    eax,edx
  80515e:	89 c2                	mov    edx,eax
  805160:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805164:	89 10                	mov    DWORD PTR [rax],edx
  805166:	e9 a9 00 00 00       	jmp    805214 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80516b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80516f:	8b 00                	mov    eax,DWORD PTR [rax]
  805171:	89 c0                	mov    eax,eax
  805173:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  80517a:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  805181:	02 
                    int i=0;
  805182:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805189:	eb 7a                	jmp    805205 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80518b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80518e:	48 98                	cdqe   
  805190:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805197:	00 
  805198:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80519f:	48 01 d0             	add    rax,rdx
  8051a2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8051a5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  8051ac:	48 89 d6             	mov    rsi,rdx
  8051af:	48 89 c7             	mov    rdi,rax
  8051b2:	e8 58 58 00 00       	call   80aa0f <strcmp>
  8051b7:	85 c0                	test   eax,eax
  8051b9:	75 46                	jne    805201 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  8051bb:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8051be:	48 98                	cdqe   
  8051c0:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8051c4:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8051cb:	48 01 d0             	add    rax,rdx
  8051ce:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8051d1:	98                   	cwde   
  8051d2:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8051d8:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8051de:	48 98                	cdqe   
  8051e0:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8051e7:	00 
  8051e8:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8051ef:	48 01 d0             	add    rax,rdx
  8051f2:	8b 10                	mov    edx,DWORD PTR [rax]
  8051f4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051f7:	01 d0                	add    eax,edx
  8051f9:	89 c2                	mov    edx,eax
  8051fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8051ff:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805201:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805205:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805208:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  80520e:	0f 8c 77 ff ff ff    	jl     80518b <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  805214:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805219:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80521e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805222:	8b 00                	mov    eax,DWORD PTR [rax]
  805224:	85 c0                	test   eax,eax
  805226:	0f 85 f2 fe ff ff    	jne    80511e <load_pe+0x452>
            }
            impdes++;
  80522c:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805231:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805235:	8b 00                	mov    eax,DWORD PTR [rax]
  805237:	85 c0                	test   eax,eax
  805239:	0f 85 ab fd ff ff    	jne    804fea <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80523f:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805246:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  805247:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80524e:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  805254:	85 c0                	test   eax,eax
  805256:	0f 84 ec 00 00 00    	je     805348 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80525c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805263:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  805269:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80526d:	01 d0                	add    eax,edx
  80526f:	89 c0                	mov    eax,eax
  805271:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  805275:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805279:	48 83 c0 40          	add    rax,0x40
  80527d:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805281:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805285:	48 83 c0 02          	add    rax,0x2
  805289:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80528d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805294:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805298:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80529e:	e9 97 00 00 00       	jmp    80533a <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  8052a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052a7:	8b 10                	mov    edx,DWORD PTR [rax]
  8052a9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8052ad:	01 d0                	add    eax,edx
  8052af:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8052b5:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8052bc:	eb 5a                	jmp    805318 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8052be:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8052c2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8052c5:	66 85 c0             	test   ax,ax
  8052c8:	74 49                	je     805313 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8052ca:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8052ce:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8052d1:	0f b7 d0             	movzx  edx,ax
  8052d4:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8052da:	01 d0                	add    eax,edx
  8052dc:	48 98                	cdqe   
  8052de:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8052e5:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8052ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8052ee:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8052f4:	89 c2                	mov    edx,eax
  8052f6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8052fa:	01 d0                	add    eax,edx
  8052fc:	89 c2                	mov    edx,eax
  8052fe:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  805305:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805307:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80530c:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805311:	eb 01                	jmp    805314 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805313:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805314:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805318:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80531c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80531f:	c1 e8 02             	shr    eax,0x2
  805322:	89 c2                	mov    edx,eax
  805324:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805327:	39 c2                	cmp    edx,eax
  805329:	77 93                	ja     8052be <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  80532b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80532f:	05 00 10 00 00       	add    eax,0x1000
  805334:	48 98                	cdqe   
  805336:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80533a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80533e:	8b 00                	mov    eax,DWORD PTR [rax]
  805340:	85 c0                	test   eax,eax
  805342:	0f 85 5b ff ff ff    	jne    8052a3 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805348:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80534f:	00 00 00 
  805352:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805359:	00 00 00 
  80535c:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805363:	00 00 00 00 
  805367:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80536e:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805372:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805379:	ba 18 00 00 00       	mov    edx,0x18
  80537e:	48 89 c6             	mov    rsi,rax
  805381:	bf 00 00 00 01       	mov    edi,0x1000000
  805386:	e8 e6 53 00 00       	call   80a771 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80538b:	8b 05 9b f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f19b]        # 41452c <cur_proc>
  805391:	48 63 d0             	movsxd rdx,eax
  805394:	48 89 d0             	mov    rax,rdx
  805397:	48 01 c0             	add    rax,rax
  80539a:	48 01 d0             	add    rax,rdx
  80539d:	48 c1 e0 08          	shl    rax,0x8
  8053a1:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8053a7:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8053ae:	8b 05 78 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f178]        # 41452c <cur_proc>
  8053b4:	48 63 d0             	movsxd rdx,eax
  8053b7:	48 89 d0             	mov    rax,rdx
  8053ba:	48 01 c0             	add    rax,rax
  8053bd:	48 01 d0             	add    rax,rdx
  8053c0:	48 c1 e0 08          	shl    rax,0x8
  8053c4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8053ca:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8053d1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8053d8:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8053df:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8053e6:	be 00 00 00 00       	mov    esi,0x0
  8053eb:	bf 00 00 00 00       	mov    edi,0x0
  8053f0:	ff d0                	call   rax
  8053f2:	8b 15 34 f1 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0f134]        # 41452c <cur_proc>
  8053f8:	89 c1                	mov    ecx,eax
  8053fa:	48 63 d2             	movsxd rdx,edx
  8053fd:	48 89 d0             	mov    rax,rdx
  805400:	48 01 c0             	add    rax,rax
  805403:	48 01 d0             	add    rax,rdx
  805406:	48 c1 e0 08          	shl    rax,0x8
  80540a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805410:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805412:	8b 05 14 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f114]        # 41452c <cur_proc>
  805418:	48 63 d0             	movsxd rdx,eax
  80541b:	48 89 d0             	mov    rax,rdx
  80541e:	48 01 c0             	add    rax,rax
  805421:	48 01 d0             	add    rax,rdx
  805424:	48 c1 e0 08          	shl    rax,0x8
  805428:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80542e:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805430:	c9                   	leave  
  805431:	c3                   	ret    

0000000000805432 <get_module_addr>:

int get_module_addr(int mi)
{
  805432:	f3 0f 1e fa          	endbr64 
  805436:	55                   	push   rbp
  805437:	48 89 e5             	mov    rbp,rsp
  80543a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80543d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805440:	48 98                	cdqe   
  805442:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  805449:	5d                   	pop    rbp
  80544a:	c3                   	ret    

000000000080544b <dispose_library>:
int dispose_library(int dlln)
{
  80544b:	f3 0f 1e fa          	endbr64 
  80544f:	55                   	push   rbp
  805450:	48 89 e5             	mov    rbp,rsp
  805453:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805456:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80545a:	78 09                	js     805465 <dispose_library+0x1a>
  80545c:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805463:	7e 07                	jle    80546c <dispose_library+0x21>
  805465:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80546a:	eb 1d                	jmp    805489 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80546c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80546f:	48 98                	cdqe   
  805471:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805478:	48 05 48 45 41 00    	add    rax,0x414548
  80547e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805484:	b8 00 00 00 00       	mov    eax,0x0
}
  805489:	5d                   	pop    rbp
  80548a:	c3                   	ret    

000000000080548b <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80548b:	f3 0f 1e fa          	endbr64 
  80548f:	55                   	push   rbp
  805490:	48 89 e5             	mov    rbp,rsp
  805493:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805497:	90                   	nop
  805498:	5d                   	pop    rbp
  805499:	c3                   	ret    

000000000080549a <sys_rmmod>:
int sys_rmmod(char *name)
{
  80549a:	f3 0f 1e fa          	endbr64 
  80549e:	55                   	push   rbp
  80549f:	48 89 e5             	mov    rbp,rsp
  8054a2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8054a6:	90                   	nop
  8054a7:	5d                   	pop    rbp
  8054a8:	c3                   	ret    
  8054a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000008054b0 <_syscall>:
  8054b0:	55                   	push   rbp
  8054b1:	bd 00 80 10 00       	mov    ebp,0x108000
  8054b6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8054ba:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8054be:	41 53                	push   r11
  8054c0:	51                   	push   rcx
  8054c1:	49 87 ca             	xchg   r10,rcx
  8054c4:	e8 d1 b0 ff ff       	call   80059a <syscall>
  8054c9:	4c 87 d1             	xchg   rcx,r10
  8054cc:	59                   	pop    rcx
  8054cd:	41 5b                	pop    r11
  8054cf:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  8054d3:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  8054d7:	5d                   	pop    rbp
  8054d8:	fb                   	sti    
  8054d9:	48 0f 07             	sysretq 

00000000008054dc <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8054dc:	f3 0f 1e fa          	endbr64 
  8054e0:	55                   	push   rbp
  8054e1:	48 89 e5             	mov    rbp,rsp
  8054e4:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8054e8:	8b 05 66 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22066]        # 427554 <framebuffer+0x14>
  8054ee:	89 c0                	mov    eax,eax
  8054f0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8054f4:	8b 05 5e 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2205e]        # 427558 <framebuffer+0x18>
  8054fa:	89 c0                	mov    eax,eax
  8054fc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805500:	0f b6 05 55 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22055]        # 42755c <framebuffer+0x1c>
  805507:	c0 e8 03             	shr    al,0x3
  80550a:	0f b6 c0             	movzx  eax,al
  80550d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805511:	8b 05 39 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22039]        # 427550 <framebuffer+0x10>
  805517:	89 c0                	mov    eax,eax
  805519:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  80551d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805521:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805526:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80552a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80552e:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805533:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805537:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80553b:	48 c1 e8 0c          	shr    rax,0xc
  80553f:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805542:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805549:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  80554a:	48 8b 05 f7 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ff7]        # 427548 <framebuffer+0x8>
  805551:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805555:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80555c:	00 
  80555d:	eb 2d                	jmp    80558c <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80555f:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805563:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805567:	ba 07 00 00 00       	mov    edx,0x7
  80556c:	48 89 ce             	mov    rsi,rcx
  80556f:	48 89 c7             	mov    rdi,rax
  805572:	e8 58 b9 ff ff       	call   800ecf <mmap>
        pp+=PAGE_SIZE;
  805577:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  80557e:	00 
        p+=PAGE_SIZE;
  80557f:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805586:	00 
    for (size_t i = 0; i < pgc; i++)
  805587:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80558c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80558f:	48 98                	cdqe   
  805591:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805595:	72 c8                	jb     80555f <init_framebuffer+0x83>
    }
    
    
}
  805597:	90                   	nop
  805598:	90                   	nop
  805599:	c9                   	leave  
  80559a:	c3                   	ret    

000000000080559b <init_font>:
void init_font(){
  80559b:	f3 0f 1e fa          	endbr64 
  80559f:	55                   	push   rbp
  8055a0:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8055a3:	48 c7 05 d2 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21fd2],0x80b440        # 427580 <boot_font>
  8055aa:	40 b4 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8055ae:	48 8b 05 cb 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fcb]        # 427580 <boot_font>
  8055b5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8055b8:	83 c0 07             	add    eax,0x7
  8055bb:	c1 e8 03             	shr    eax,0x3
  8055be:	89 05 cc 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fcc],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8055c4:	8b 05 c6 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21fc6]        # 427590 <font_width_bytes>
  8055ca:	c1 e0 03             	shl    eax,0x3
  8055cd:	89 05 b5 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fb5],eax        # 427588 <font_width>
    font_height = boot_font->height;
  8055d3:	48 8b 05 a6 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fa6]        # 427580 <boot_font>
  8055da:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8055dd:	89 05 a9 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fa9],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8055e3:	48 8b 05 96 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21f96]        # 427580 <boot_font>
  8055ea:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8055ed:	89 c0                	mov    eax,eax
  8055ef:	48 05 40 b4 80 00    	add    rax,0x80b440
  8055f5:	48 89 05 9c 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21f9c],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  8055fc:	48 8b 05 7d 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21f7d]        # 427580 <boot_font>
  805603:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805606:	89 05 98 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f98],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  80560c:	48 8b 05 6d 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21f6d]        # 427580 <boot_font>
  805613:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805616:	89 05 84 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f84],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  80561c:	c7 05 4a 1f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21f4a],0x0        # 427570 <fb_cursor_y>
  805623:	00 00 00 
  805626:	8b 05 44 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f44]        # 427570 <fb_cursor_y>
  80562c:	89 05 3a 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f3a],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  805632:	8b 05 1c 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f1c]        # 427554 <framebuffer+0x14>
  805638:	8b 0d 4a 1f c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21f4a]        # 427588 <font_width>
  80563e:	ba 00 00 00 00       	mov    edx,0x0
  805643:	f7 f1                	div    ecx
  805645:	89 05 29 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f29],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  80564b:	8b 05 07 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f07]        # 427558 <framebuffer+0x18>
  805651:	8b 35 35 1f c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21f35]        # 42758c <font_height>
  805657:	ba 00 00 00 00       	mov    edx,0x0
  80565c:	f7 f6                	div    esi
  80565e:	89 05 14 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f14],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  805664:	c7 05 22 5b 00 00 01 	mov    DWORD PTR [rip+0x5b22],0x1        # 80b190 <font_size>
  80566b:	00 00 00 
}
  80566e:	90                   	nop
  80566f:	5d                   	pop    rbp
  805670:	c3                   	ret    

0000000000805671 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805671:	f3 0f 1e fa          	endbr64 
  805675:	55                   	push   rbp
  805676:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805679:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  80567d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805681:	48 89 05 b8 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21eb8],rax        # 427540 <framebuffer>
  805688:	48 89 15 b9 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21eb9],rdx        # 427548 <framebuffer+0x8>
  80568f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805693:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805697:	48 89 05 b2 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21eb2],rax        # 427550 <framebuffer+0x10>
  80569e:	48 89 15 b3 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21eb3],rdx        # 427558 <framebuffer+0x18>
  8056a5:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8056a9:	48 89 05 b0 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21eb0],rax        # 427560 <framebuffer+0x20>
}
  8056b0:	90                   	nop
  8056b1:	5d                   	pop    rbp
  8056b2:	c3                   	ret    

00000000008056b3 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8056b3:	f3 0f 1e fa          	endbr64 
  8056b7:	55                   	push   rbp
  8056b8:	48 89 e5             	mov    rbp,rsp
  8056bb:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8056be:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8056c1:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8056c4:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  8056c7:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8056cb:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  8056d2:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  8056d3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056d6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8056d9:	eb 64                	jmp    80573f <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  8056db:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8056de:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8056e1:	eb 4b                	jmp    80572e <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8056e3:	8b 15 67 1e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21e67]        # 427550 <framebuffer+0x10>
  8056e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056ec:	0f af c2             	imul   eax,edx
  8056ef:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  8056f1:	0f b6 05 64 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21e64]        # 42755c <framebuffer+0x1c>
  8056f8:	0f b6 c0             	movzx  eax,al
  8056fb:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8056ff:	8d 50 07             	lea    edx,[rax+0x7]
  805702:	85 c0                	test   eax,eax
  805704:	0f 48 c2             	cmovs  eax,edx
  805707:	c1 f8 03             	sar    eax,0x3
  80570a:	48 98                	cdqe   
  80570c:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80570f:	48 05 00 00 00 40    	add    rax,0x40000000
  805715:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805719:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80571d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805721:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805725:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805728:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80572a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80572e:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805731:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805734:	01 d0                	add    eax,edx
  805736:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805739:	7c a8                	jl     8056e3 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  80573b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80573f:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805742:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805745:	01 d0                	add    eax,edx
  805747:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80574a:	7c 8f                	jl     8056db <fill_rect+0x28>
        }
    }
}
  80574c:	90                   	nop
  80574d:	90                   	nop
  80574e:	5d                   	pop    rbp
  80574f:	c3                   	ret    

0000000000805750 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805750:	f3 0f 1e fa          	endbr64 
  805754:	55                   	push   rbp
  805755:	48 89 e5             	mov    rbp,rsp
  805758:	48 83 ec 30          	sub    rsp,0x30
  80575c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80575f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805762:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805765:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805769:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80576c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  80576f:	eb 5a                	jmp    8057cb <draw_text+0x7b>
    {
        if(*str=='\n')
  805771:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805775:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805778:	3c 0a                	cmp    al,0xa
  80577a:	75 1c                	jne    805798 <draw_text+0x48>
        {
            y+=font_height*size;
  80577c:	8b 15 0a 1e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21e0a]        # 42758c <font_height>
  805782:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805785:	0f af d0             	imul   edx,eax
  805788:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80578b:	01 d0                	add    eax,edx
  80578d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805790:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805793:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805796:	eb 2e                	jmp    8057c6 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805798:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80579c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80579f:	0f be c8             	movsx  ecx,al
  8057a2:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8057a5:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8057a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057ab:	89 c7                	mov    edi,eax
  8057ad:	e8 28 00 00 00       	call   8057da <draw_letter>
            tx+=size*font_width;
  8057b2:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8057b5:	8b 05 cd 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21dcd]        # 427588 <font_width>
  8057bb:	0f af d0             	imul   edx,eax
  8057be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057c1:	01 d0                	add    eax,edx
  8057c3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8057c6:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8057cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8057cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8057d2:	84 c0                	test   al,al
  8057d4:	75 9b                	jne    805771 <draw_text+0x21>
    }
}
  8057d6:	90                   	nop
  8057d7:	90                   	nop
  8057d8:	c9                   	leave  
  8057d9:	c3                   	ret    

00000000008057da <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  8057da:	f3 0f 1e fa          	endbr64 
  8057de:	55                   	push   rbp
  8057df:	48 89 e5             	mov    rbp,rsp
  8057e2:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  8057e5:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  8057e8:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  8057eb:	89 c8                	mov    eax,ecx
  8057ed:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  8057f0:	48 8b 05 a1 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21da1]        # 427598 <glyph_table>
  8057f7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  8057fb:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  8057ff:	8b 05 9f 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d9f]        # 4275a4 <glyph_nr>
  805805:	39 c2                	cmp    edx,eax
  805807:	73 13                	jae    80581c <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  805809:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  80580d:	8b 05 8d 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d8d]        # 4275a0 <bytes_per_glyph>
  805813:	0f af c2             	imul   eax,edx
  805816:	89 c0                	mov    eax,eax
  805818:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  80581c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805823:	e9 cb 00 00 00       	jmp    8058f3 <draw_letter+0x119>
        u8 mask = 1 << 7;
  805828:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  80582c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805833:	e9 9c 00 00 00       	jmp    8058d4 <draw_letter+0xfa>
            int px=x+ch_x*size;
  805838:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80583b:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  80583f:	89 c2                	mov    edx,eax
  805841:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805844:	01 d0                	add    eax,edx
  805846:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  805849:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80584c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805850:	89 c2                	mov    edx,eax
  805852:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  805855:	01 d0                	add    eax,edx
  805857:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80585a:	8b 15 f0 1c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21cf0]        # 427550 <framebuffer+0x10>
  805860:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805863:	0f af c2             	imul   eax,edx
  805866:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  805868:	0f b6 05 ed 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ced]        # 42755c <framebuffer+0x1c>
  80586f:	0f b6 c0             	movzx  eax,al
  805872:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  805876:	8d 50 07             	lea    edx,[rax+0x7]
  805879:	85 c0                	test   eax,eax
  80587b:	0f 48 c2             	cmovs  eax,edx
  80587e:	c1 f8 03             	sar    eax,0x3
  805881:	48 98                	cdqe   
  805883:	48 01 c8             	add    rax,rcx
  805886:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80588c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805890:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805893:	c1 e8 03             	shr    eax,0x3
  805896:	89 c2                	mov    edx,eax
  805898:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80589c:	48 01 d0             	add    rax,rdx
  80589f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058a2:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8058a5:	84 c0                	test   al,al
  8058a7:	74 0c                	je     8058b5 <draw_letter+0xdb>
                *ptr=-1;
  8058a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058ad:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  8058b3:	eb 0a                	jmp    8058bf <draw_letter+0xe5>
            } else {
                *ptr=0;
  8058b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058b9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  8058bf:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8058c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058c5:	83 e0 07             	and    eax,0x7
  8058c8:	85 c0                	test   eax,eax
  8058ca:	75 04                	jne    8058d0 <draw_letter+0xf6>
                mask = 1 << 7;
  8058cc:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8058d0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8058d4:	8b 05 ae 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21cae]        # 427588 <font_width>
  8058da:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8058dd:	0f 82 55 ff ff ff    	jb     805838 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  8058e3:	8b 05 a7 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ca7]        # 427590 <font_width_bytes>
  8058e9:	89 c0                	mov    eax,eax
  8058eb:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8058ef:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8058f3:	8b 05 93 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c93]        # 42758c <font_height>
  8058f9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8058fc:	0f 82 26 ff ff ff    	jb     805828 <draw_letter+0x4e>
    }
}
  805902:	90                   	nop
  805903:	90                   	nop
  805904:	5d                   	pop    rbp
  805905:	c3                   	ret    

0000000000805906 <scr_up>:
//向上滚动一个像素
void scr_up(){
  805906:	f3 0f 1e fa          	endbr64 
  80590a:	55                   	push   rbp
  80590b:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  80590e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805915:	eb 71                	jmp    805988 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  805917:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80591e:	eb 57                	jmp    805977 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  805920:	8b 15 2a 1c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21c2a]        # 427550 <framebuffer+0x10>
  805926:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805929:	0f af c2             	imul   eax,edx
  80592c:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  80592e:	0f b6 05 27 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21c27]        # 42755c <framebuffer+0x1c>
  805935:	0f b6 c0             	movzx  eax,al
  805938:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  80593c:	8d 50 07             	lea    edx,[rax+0x7]
  80593f:	85 c0                	test   eax,eax
  805941:	0f 48 c2             	cmovs  eax,edx
  805944:	c1 f8 03             	sar    eax,0x3
  805947:	48 98                	cdqe   
  805949:	48 01 c8             	add    rax,rcx
  80594c:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  805952:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805956:	8b 05 f4 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bf4]        # 427550 <framebuffer+0x10>
  80595c:	89 c2                	mov    edx,eax
  80595e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805962:	48 01 d0             	add    rax,rdx
  805965:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805968:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80596c:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  80596e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  805973:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805977:	8b 15 d7 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21bd7]        # 427554 <framebuffer+0x14>
  80597d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805980:	39 c2                	cmp    edx,eax
  805982:	77 9c                	ja     805920 <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  805984:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805988:	8b 05 ca 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bca]        # 427558 <framebuffer+0x18>
  80598e:	8d 50 ff             	lea    edx,[rax-0x1]
  805991:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805994:	39 c2                	cmp    edx,eax
  805996:	0f 87 7b ff ff ff    	ja     805917 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  80599c:	90                   	nop
  80599d:	90                   	nop
  80599e:	5d                   	pop    rbp
  80599f:	c3                   	ret    

00000000008059a0 <scr_down>:
void scr_down(){
  8059a0:	f3 0f 1e fa          	endbr64 
  8059a4:	55                   	push   rbp
  8059a5:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8059a8:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  8059af:	eb 72                	jmp    805a23 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8059b1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8059b8:	eb 58                	jmp    805a12 <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8059ba:	8b 15 90 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b90]        # 427550 <framebuffer+0x10>
  8059c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059c3:	0f af c2             	imul   eax,edx
  8059c6:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8059c8:	0f b6 05 8d 1b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21b8d]        # 42755c <framebuffer+0x1c>
  8059cf:	0f b6 c0             	movzx  eax,al
  8059d2:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8059d6:	8d 50 07             	lea    edx,[rax+0x7]
  8059d9:	85 c0                	test   eax,eax
  8059db:	0f 48 c2             	cmovs  eax,edx
  8059de:	c1 f8 03             	sar    eax,0x3
  8059e1:	48 98                	cdqe   
  8059e3:	48 01 c8             	add    rax,rcx
  8059e6:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8059ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  8059f0:	8b 05 5a 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b5a]        # 427550 <framebuffer+0x10>
  8059f6:	89 c0                	mov    eax,eax
  8059f8:	48 f7 d8             	neg    rax
  8059fb:	48 89 c2             	mov    rdx,rax
  8059fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a02:	48 01 d0             	add    rax,rdx
  805a05:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805a08:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a0c:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a0e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805a12:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805a15:	8b 05 59 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b59]        # 427574 <max_ch_nr_x>
  805a1b:	39 c2                	cmp    edx,eax
  805a1d:	72 9b                	jb     8059ba <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805a1f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a23:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805a26:	8b 05 4c 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b4c]        # 427578 <max_ch_nr_y>
  805a2c:	39 c2                	cmp    edx,eax
  805a2e:	72 81                	jb     8059b1 <scr_down+0x11>
        }

    }
}
  805a30:	90                   	nop
  805a31:	90                   	nop
  805a32:	5d                   	pop    rbp
  805a33:	c3                   	ret    

0000000000805a34 <print>:
void print(char* s){
  805a34:	f3 0f 1e fa          	endbr64 
  805a38:	55                   	push   rbp
  805a39:	48 89 e5             	mov    rbp,rsp
  805a3c:	48 83 ec 08          	sub    rsp,0x8
  805a40:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  805a44:	e9 c4 00 00 00       	jmp    805b0d <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805a49:	8b 15 1d 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b1d]        # 42756c <fb_cursor_x>
  805a4f:	8b 05 1f 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b1f]        # 427574 <max_ch_nr_x>
  805a55:	39 c2                	cmp    edx,eax
  805a57:	77 0b                	ja     805a64 <print+0x30>
  805a59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a5d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a60:	3c 0a                	cmp    al,0xa
  805a62:	75 19                	jne    805a7d <print+0x49>
        {
            fb_cursor_y+=1;
  805a64:	8b 05 06 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b06]        # 427570 <fb_cursor_y>
  805a6a:	83 c0 01             	add    eax,0x1
  805a6d:	89 05 fd 1a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21afd],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  805a73:	c7 05 ef 1a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21aef],0x0        # 42756c <fb_cursor_x>
  805a7a:	00 00 00 
        }
        if(*s=='\n')continue;
  805a7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a84:	3c 0a                	cmp    al,0xa
  805a86:	74 7f                	je     805b07 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  805a88:	8b 05 ea 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21aea]        # 427578 <max_ch_nr_y>
  805a8e:	8d 50 ff             	lea    edx,[rax-0x1]
  805a91:	8b 05 d9 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ad9]        # 427570 <fb_cursor_y>
  805a97:	39 c2                	cmp    edx,eax
  805a99:	77 0a                	ja     805aa5 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  805a9b:	c7 05 cb 1a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21acb],0x0        # 427570 <fb_cursor_y>
  805aa2:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805aa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805aa9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805aac:	0f be d0             	movsx  edx,al
  805aaf:	8b 05 db 56 00 00    	mov    eax,DWORD PTR [rip+0x56db]        # 80b190 <font_size>
  805ab5:	8b 35 b5 1a c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21ab5]        # 427570 <fb_cursor_y>
  805abb:	8b 0d cb 1a c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21acb]        # 42758c <font_height>
  805ac1:	0f af ce             	imul   ecx,esi
  805ac4:	8b 35 c6 56 00 00    	mov    esi,DWORD PTR [rip+0x56c6]        # 80b190 <font_size>
  805aca:	0f af ce             	imul   ecx,esi
  805acd:	41 89 c8             	mov    r8d,ecx
  805ad0:	8b 35 96 1a c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21a96]        # 42756c <fb_cursor_x>
  805ad6:	8b 0d ac 1a c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21aac]        # 427588 <font_width>
  805adc:	0f af ce             	imul   ecx,esi
  805adf:	8b 35 ab 56 00 00    	mov    esi,DWORD PTR [rip+0x56ab]        # 80b190 <font_size>
  805ae5:	0f af ce             	imul   ecx,esi
  805ae8:	89 cf                	mov    edi,ecx
  805aea:	89 d1                	mov    ecx,edx
  805aec:	89 c2                	mov    edx,eax
  805aee:	44 89 c6             	mov    esi,r8d
  805af1:	e8 e4 fc ff ff       	call   8057da <draw_letter>
        fb_cursor_x+=1;
  805af6:	8b 05 70 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a70]        # 42756c <fb_cursor_x>
  805afc:	83 c0 01             	add    eax,0x1
  805aff:	89 05 67 1a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21a67],eax        # 42756c <fb_cursor_x>
  805b05:	eb 01                	jmp    805b08 <print+0xd4>
        if(*s=='\n')continue;
  805b07:	90                   	nop
    for(;*s;s++){
  805b08:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  805b0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b11:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b14:	84 c0                	test   al,al
  805b16:	0f 85 2d ff ff ff    	jne    805a49 <print+0x15>
    }
}
  805b1c:	90                   	nop
  805b1d:	90                   	nop
  805b1e:	c9                   	leave  
  805b1f:	c3                   	ret    

0000000000805b20 <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  805b20:	f3 0f 1e fa          	endbr64 
  805b24:	55                   	push   rbp
  805b25:	48 89 e5             	mov    rbp,rsp
  805b28:	48 83 ec 50          	sub    rsp,0x50
  805b2c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  805b30:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  805b34:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  805b3b:	00 
    int tmpnamelen = 0;
  805b3c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  805b43:	48 8b 05 5e 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a5e]        # 4275a8 <root_sb>
  805b4a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b4d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  805b51:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  805b58:	00 

    while(*name == '/')
  805b59:	eb 05                	jmp    805b60 <path_walk+0x40>
        name++;
  805b5b:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  805b60:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b67:	3c 2f                	cmp    al,0x2f
  805b69:	74 f0                	je     805b5b <path_walk+0x3b>

    if(!*name)
  805b6b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b72:	84 c0                	test   al,al
  805b74:	75 09                	jne    805b7f <path_walk+0x5f>
    {
        return parent;
  805b76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b7a:	e9 1b 02 00 00       	jmp    805d9a <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  805b7f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b83:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  805b87:	eb 05                	jmp    805b8e <path_walk+0x6e>
            name++;
  805b89:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  805b8e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b92:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b95:	84 c0                	test   al,al
  805b97:	74 0b                	je     805ba4 <path_walk+0x84>
  805b99:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ba0:	3c 2f                	cmp    al,0x2f
  805ba2:	75 e5                	jne    805b89 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  805ba4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805ba8:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  805bac:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  805baf:	be 00 00 00 00       	mov    esi,0x0
  805bb4:	bf 48 00 00 00       	mov    edi,0x48
  805bb9:	b8 00 00 00 00       	mov    eax,0x0
  805bbe:	e8 57 b5 ff ff       	call   80111a <vmalloc>
  805bc3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  805bc7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805bcb:	ba 48 00 00 00       	mov    edx,0x48
  805bd0:	be 00 00 00 00       	mov    esi,0x0
  805bd5:	48 89 c7             	mov    rdi,rax
  805bd8:	e8 43 4c 00 00       	call   80a820 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  805bdd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805be0:	83 c0 01             	add    eax,0x1
  805be3:	be 00 00 00 00       	mov    esi,0x0
  805be8:	89 c7                	mov    edi,eax
  805bea:	b8 00 00 00 00       	mov    eax,0x0
  805bef:	e8 26 b5 ff ff       	call   80111a <vmalloc>
  805bf4:	48 89 c2             	mov    rdx,rax
  805bf7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805bfb:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  805bfe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c01:	83 c0 01             	add    eax,0x1
  805c04:	48 63 d0             	movsxd rdx,eax
  805c07:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c0e:	be 00 00 00 00       	mov    esi,0x0
  805c13:	48 89 c7             	mov    rdi,rax
  805c16:	e8 05 4c 00 00       	call   80a820 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  805c1b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c1e:	48 63 d0             	movsxd rdx,eax
  805c21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c25:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  805c28:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c2c:	48 89 ce             	mov    rsi,rcx
  805c2f:	48 89 c7             	mov    rdi,rax
  805c32:	e8 3a 4b 00 00       	call   80a771 <memcpy>
        path->name_length = tmpnamelen;
  805c37:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c3b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  805c3e:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  805c41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c45:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805c49:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  805c4d:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  805c51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c55:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805c59:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  805c5d:	48 89 d6             	mov    rsi,rdx
  805c60:	48 89 c7             	mov    rdi,rax
  805c63:	ff d1                	call   rcx
  805c65:	48 85 c0             	test   rax,rax
  805c68:	75 3e                	jne    805ca8 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  805c6a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c6e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c71:	48 89 c6             	mov    rsi,rax
  805c74:	bf 70 2d 81 00       	mov    edi,0x812d70
  805c79:	b8 00 00 00 00       	mov    eax,0x0
  805c7e:	e8 7f b0 ff ff       	call   800d02 <printf>
            vmfree(path->name);
  805c83:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c87:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c8a:	48 89 c7             	mov    rdi,rax
  805c8d:	e8 17 b5 ff ff       	call   8011a9 <vmfree>
            vmfree(path);
  805c92:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c96:	48 89 c7             	mov    rdi,rax
  805c99:	e8 0b b5 ff ff       	call   8011a9 <vmfree>
            return NULL;
  805c9e:	b8 00 00 00 00       	mov    eax,0x0
  805ca3:	e9 f2 00 00 00       	jmp    805d9a <path_walk+0x27a>
        }

        list_init(&path->child_node);
  805ca8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805cac:	48 83 c0 10          	add    rax,0x10
  805cb0:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  805cb4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805cb8:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  805cbc:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  805cbf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805cc3:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  805cc7:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805ccb:	90                   	nop
        list_init(&path->subdirs_list);
  805ccc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805cd0:	48 83 c0 20          	add    rax,0x20
  805cd4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  805cd8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805cdc:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  805ce0:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  805ce3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805ce7:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  805ceb:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805cef:	90                   	nop
        path->parent = parent;
  805cf0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805cf4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805cf8:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  805cfc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805d00:	48 83 c0 10          	add    rax,0x10
  805d04:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805d08:	48 83 c2 20          	add    rdx,0x20
  805d0c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  805d10:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  805d14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d18:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  805d1c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d20:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  805d24:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d28:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  805d2c:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  805d2f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805d33:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805d37:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  805d3b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805d3e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d42:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  805d46:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805d4a:	90                   	nop

        if(!*name)
  805d4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d52:	84 c0                	test   al,al
  805d54:	74 2a                	je     805d80 <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  805d56:	eb 05                	jmp    805d5d <path_walk+0x23d>
            name++;
  805d58:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  805d5d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d64:	3c 2f                	cmp    al,0x2f
  805d66:	74 f0                	je     805d58 <path_walk+0x238>
        if(!*name)
  805d68:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d6f:	84 c0                	test   al,al
  805d71:	74 10                	je     805d83 <path_walk+0x263>
            goto last_slash;

        parent = path;
  805d73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805d77:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  805d7b:	e9 ff fd ff ff       	jmp    805b7f <path_walk+0x5f>
            goto last_component;
  805d80:	90                   	nop
  805d81:	eb 01                	jmp    805d84 <path_walk+0x264>
            goto last_slash;
  805d83:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  805d84:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805d88:	83 e0 01             	and    eax,0x1
  805d8b:	48 85 c0             	test   rax,rax
  805d8e:	74 06                	je     805d96 <path_walk+0x276>
    {
        return parent;
  805d90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805d94:	eb 04                	jmp    805d9a <path_walk+0x27a>
    }

    return path;
  805d96:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  805d9a:	c9                   	leave  
  805d9b:	c3                   	ret    

0000000000805d9c <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  805d9c:	f3 0f 1e fa          	endbr64 
  805da0:	55                   	push   rbp
  805da1:	48 89 e5             	mov    rbp,rsp
  805da4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805da8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805dac:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  805db0:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  805db4:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  805db8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805dbc:	83 c0 18             	add    eax,0x18
}
  805dbf:	5d                   	pop    rbp
  805dc0:	c3                   	ret    

0000000000805dc1 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  805dc1:	f3 0f 1e fa          	endbr64 
  805dc5:	55                   	push   rbp
  805dc6:	48 89 e5             	mov    rbp,rsp
  805dc9:	48 83 ec 30          	sub    rsp,0x30
  805dcd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  805dd1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  805dd5:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  805dd9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805de0:	00 

    for(p = &filesystem;p;p = p->next)
  805de1:	48 c7 45 f8 a0 b1 80 	mov    QWORD PTR [rbp-0x8],0x80b1a0
  805de8:	00 
  805de9:	eb 40                	jmp    805e2b <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  805deb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805def:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805df2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805df6:	48 89 d6             	mov    rsi,rdx
  805df9:	48 89 c7             	mov    rdi,rax
  805dfc:	e8 0e 4c 00 00       	call   80aa0f <strcmp>
  805e01:	85 c0                	test   eax,eax
  805e03:	75 1a                	jne    805e1f <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  805e05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e09:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  805e0d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  805e11:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e15:	48 89 d6             	mov    rsi,rdx
  805e18:	48 89 c7             	mov    rdi,rax
  805e1b:	ff d1                	call   rcx
  805e1d:	eb 18                	jmp    805e37 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  805e1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e23:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e27:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  805e2b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805e30:	75 b9                	jne    805deb <mount_fs+0x2a>
        }
    return 0;
  805e32:	b8 00 00 00 00       	mov    eax,0x0
}
  805e37:	c9                   	leave  
  805e38:	c3                   	ret    

0000000000805e39 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  805e39:	f3 0f 1e fa          	endbr64 
  805e3d:	55                   	push   rbp
  805e3e:	48 89 e5             	mov    rbp,rsp
  805e41:	48 83 ec 20          	sub    rsp,0x20
  805e45:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  805e49:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805e50:	00 

    for(p = &filesystem;p;p = p->next)
  805e51:	48 c7 45 f8 a0 b1 80 	mov    QWORD PTR [rbp-0x8],0x80b1a0
  805e58:	00 
  805e59:	eb 30                	jmp    805e8b <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  805e5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e5f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805e62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e69:	48 89 d6             	mov    rsi,rdx
  805e6c:	48 89 c7             	mov    rdi,rax
  805e6f:	e8 9b 4b 00 00       	call   80aa0f <strcmp>
  805e74:	85 c0                	test   eax,eax
  805e76:	75 07                	jne    805e7f <register_filesystem+0x46>
            return 0;
  805e78:	b8 00 00 00 00       	mov    eax,0x0
  805e7d:	eb 32                	jmp    805eb1 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  805e7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e83:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e87:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  805e8b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805e90:	75 c9                	jne    805e5b <register_filesystem+0x22>

    fs->next = filesystem.next;
  805e92:	48 8b 15 1f 53 00 00 	mov    rdx,QWORD PTR [rip+0x531f]        # 80b1b8 <filesystem+0x18>
  805e99:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e9d:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  805ea1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ea5:	48 89 05 0c 53 00 00 	mov    QWORD PTR [rip+0x530c],rax        # 80b1b8 <filesystem+0x18>

    return 1;
  805eac:	b8 01 00 00 00       	mov    eax,0x1
}
  805eb1:	c9                   	leave  
  805eb2:	c3                   	ret    

0000000000805eb3 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  805eb3:	f3 0f 1e fa          	endbr64 
  805eb7:	55                   	push   rbp
  805eb8:	48 89 e5             	mov    rbp,rsp
  805ebb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  805ebf:	48 c7 45 f8 a0 b1 80 	mov    QWORD PTR [rbp-0x8],0x80b1a0
  805ec6:	00 

    while(p->next)
  805ec7:	eb 41                	jmp    805f0a <unregister_filesystem+0x57>
        if(p->next == fs)
  805ec9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ecd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805ed1:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805ed5:	75 27                	jne    805efe <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  805ed7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805edb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805edf:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  805ee3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ee7:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  805eeb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805eef:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  805ef6:	00 
            return 1;
  805ef7:	b8 01 00 00 00       	mov    eax,0x1
  805efc:	eb 1e                	jmp    805f1c <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  805efe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f02:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805f06:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  805f0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f0e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805f12:	48 85 c0             	test   rax,rax
  805f15:	75 b2                	jne    805ec9 <unregister_filesystem+0x16>
    return 0;
  805f17:	b8 00 00 00 00       	mov    eax,0x0
}
  805f1c:	5d                   	pop    rbp
  805f1d:	c3                   	ret    

0000000000805f1e <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  805f1e:	f3 0f 1e fa          	endbr64 
  805f22:	55                   	push   rbp
  805f23:	48 89 e5             	mov    rbp,rsp
  805f26:	48 83 ec 10          	sub    rsp,0x10
  805f2a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  805f2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f32:	48 89 c7             	mov    rdi,rax
  805f35:	b8 00 00 00 00       	mov    eax,0x0
  805f3a:	e8 c3 ad ff ff       	call   800d02 <printf>
    return 0;
  805f3f:	b8 00 00 00 00       	mov    eax,0x0
}
  805f44:	c9                   	leave  
  805f45:	c3                   	ret    

0000000000805f46 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  805f46:	f3 0f 1e fa          	endbr64 
  805f4a:	55                   	push   rbp
  805f4b:	48 89 e5             	mov    rbp,rsp
  805f4e:	48 83 ec 50          	sub    rsp,0x50
  805f52:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  805f56:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  805f59:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805f60:	00 
    long pathlen = 0;
  805f61:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  805f68:	00 
    long error = 0;
  805f69:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805f70:	00 
    struct dir_entry * dentry = NULL;
  805f71:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  805f78:	00 
    struct file * filp = NULL;
  805f79:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  805f80:	00 
    struct file ** f = NULL;
  805f81:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  805f88:	00 
    int fd = -1;
  805f89:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  805f90:	b8 00 00 00 00       	mov    eax,0x0
  805f95:	e8 80 b1 ff ff       	call   80111a <vmalloc>
  805f9a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  805f9e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  805fa3:	75 0c                	jne    805fb1 <sys_open+0x6b>
        return -ENOMEM;
  805fa5:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  805fac:	e9 aa 02 00 00       	jmp    80625b <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  805fb1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fb5:	ba 00 10 00 00       	mov    edx,0x1000
  805fba:	be 00 00 00 00       	mov    esi,0x0
  805fbf:	48 89 c7             	mov    rdi,rax
  805fc2:	e8 59 48 00 00       	call   80a820 <memset>
    pathlen = strlen(filename);
  805fc7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805fcb:	48 89 c7             	mov    rdi,rax
  805fce:	e8 bb 4a 00 00       	call   80aa8e <strlen>
  805fd3:	48 98                	cdqe   
  805fd5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  805fd9:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  805fde:	7f 18                	jg     805ff8 <sys_open+0xb2>
    {
        vmfree(path);
  805fe0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fe4:	48 89 c7             	mov    rdi,rax
  805fe7:	e8 bd b1 ff ff       	call   8011a9 <vmfree>
        return -EFAULT;
  805fec:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  805ff3:	e9 63 02 00 00       	jmp    80625b <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  805ff8:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  805fff:	00 
  806000:	7e 18                	jle    80601a <sys_open+0xd4>
    {
        vmfree(path);
  806002:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806006:	48 89 c7             	mov    rdi,rax
  806009:	e8 9b b1 ff ff       	call   8011a9 <vmfree>
        return -ENAMETOOLONG;
  80600e:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  806015:	e9 41 02 00 00       	jmp    80625b <sys_open+0x315>
    }
    strcpy(filename,path);
  80601a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80601e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806022:	48 89 d6             	mov    rsi,rdx
  806025:	48 89 c7             	mov    rdi,rax
  806028:	e8 42 48 00 00       	call   80a86f <strcpy>

    dentry = path_walk(path,0);
  80602d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806031:	be 00 00 00 00       	mov    esi,0x0
  806036:	48 89 c7             	mov    rdi,rax
  806039:	e8 e2 fa ff ff       	call   805b20 <path_walk>
  80603e:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  806042:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806046:	48 89 c7             	mov    rdi,rax
  806049:	e8 5b b1 ff ff       	call   8011a9 <vmfree>

    if(dentry == NULL)
  80604e:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806053:	75 0c                	jne    806061 <sys_open+0x11b>
        return -ENOENT;
  806055:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  80605c:	e9 fa 01 00 00       	jmp    80625b <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  806061:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806064:	25 00 40 00 00       	and    eax,0x4000
  806069:	85 c0                	test   eax,eax
  80606b:	74 1e                	je     80608b <sys_open+0x145>
  80606d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806071:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806075:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806079:	48 83 f8 02          	cmp    rax,0x2
  80607d:	74 0c                	je     80608b <sys_open+0x145>
        return -ENOTDIR;
  80607f:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806086:	e9 d0 01 00 00       	jmp    80625b <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  80608b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80608e:	25 00 40 00 00       	and    eax,0x4000
  806093:	85 c0                	test   eax,eax
  806095:	75 1e                	jne    8060b5 <sys_open+0x16f>
  806097:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80609b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80609f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8060a3:	48 83 f8 02          	cmp    rax,0x2
  8060a7:	75 0c                	jne    8060b5 <sys_open+0x16f>
        return -EISDIR;
  8060a9:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  8060b0:	e9 a6 01 00 00       	jmp    80625b <sys_open+0x315>

    filp = (struct file *)vmalloc();
  8060b5:	b8 00 00 00 00       	mov    eax,0x0
  8060ba:	e8 5b b0 ff ff       	call   80111a <vmalloc>
  8060bf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  8060c3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060c7:	ba 28 00 00 00       	mov    edx,0x28
  8060cc:	be 00 00 00 00       	mov    esi,0x0
  8060d1:	48 89 c7             	mov    rdi,rax
  8060d4:	e8 47 47 00 00       	call   80a820 <memset>
    filp->dentry = dentry;
  8060d9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060dd:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8060e1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  8060e5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8060e8:	48 63 d0             	movsxd rdx,eax
  8060eb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060ef:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  8060f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8060f7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8060fb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8060ff:	83 e0 04             	and    eax,0x4
  806102:	48 85 c0             	test   rax,rax
  806105:	74 0e                	je     806115 <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  806107:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80610b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806112:	00 
  806113:	eb 14                	jmp    806129 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  806115:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806119:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80611d:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  806121:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806125:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  806129:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80612d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806131:	48 85 c0             	test   rax,rax
  806134:	74 33                	je     806169 <sys_open+0x223>
  806136:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80613a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80613e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806141:	48 85 c0             	test   rax,rax
  806144:	74 23                	je     806169 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  806146:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80614a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80614e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806151:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806155:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806159:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80615d:	48 89 d6             	mov    rsi,rdx
  806160:	48 89 c7             	mov    rdi,rax
  806163:	ff d1                	call   rcx
  806165:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  806169:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  80616e:	74 18                	je     806188 <sys_open+0x242>
    {
        vmfree(filp);
  806170:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806174:	48 89 c7             	mov    rdi,rax
  806177:	e8 2d b0 ff ff       	call   8011a9 <vmfree>
        return -EFAULT;
  80617c:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806183:	e9 d3 00 00 00       	jmp    80625b <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  806188:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80618c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806190:	25 00 02 00 00       	and    eax,0x200
  806195:	48 85 c0             	test   rax,rax
  806198:	74 13                	je     8061ad <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  80619a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80619e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8061a2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8061a6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8061ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061b1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8061b5:	25 00 04 00 00       	and    eax,0x400
  8061ba:	48 85 c0             	test   rax,rax
  8061bd:	74 19                	je     8061d8 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8061bf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061c3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8061c7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8061cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061ce:	48 89 c2             	mov    rdx,rax
  8061d1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061d5:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8061d8:	48 8b 05 c1 e2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e2c1]        # 4144a0 <current>
  8061df:	48 05 c4 00 00 00    	add    rax,0xc4
  8061e5:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  8061e9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8061f0:	eb 28                	jmp    80621a <sys_open+0x2d4>
        if(f[i] == NULL)
  8061f2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8061f5:	48 98                	cdqe   
  8061f7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061fe:	00 
  8061ff:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806203:	48 01 d0             	add    rax,rdx
  806206:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806209:	48 85 c0             	test   rax,rax
  80620c:	75 08                	jne    806216 <sys_open+0x2d0>
        {
            fd = i;
  80620e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806211:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  806214:	eb 0a                	jmp    806220 <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  806216:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80621a:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80621e:	7e d2                	jle    8061f2 <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  806220:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  806224:	75 15                	jne    80623b <sys_open+0x2f5>
    {
        vmfree(filp);
  806226:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80622a:	48 89 c7             	mov    rdi,rax
  80622d:	e8 77 af ff ff       	call   8011a9 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  806232:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  806239:	eb 20                	jmp    80625b <sys_open+0x315>
    }
    f[fd] = filp;
  80623b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80623e:	48 98                	cdqe   
  806240:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806247:	00 
  806248:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80624c:	48 01 c2             	add    rdx,rax
  80624f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806253:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  806256:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806259:	48 98                	cdqe   
}
  80625b:	c9                   	leave  
  80625c:	c3                   	ret    

000000000080625d <sys_close>:

unsigned long sys_close(int fd)
{
  80625d:	f3 0f 1e fa          	endbr64 
  806261:	55                   	push   rbp
  806262:	48 89 e5             	mov    rbp,rsp
  806265:	48 83 ec 20          	sub    rsp,0x20
  806269:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  80626c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806273:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  806274:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806278:	78 06                	js     806280 <sys_close+0x23>
  80627a:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  80627e:	7e 0c                	jle    80628c <sys_close+0x2f>
        return -EBADF;
  806280:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  806287:	e9 87 00 00 00       	jmp    806313 <sys_close+0xb6>

    filp = current->openf[fd];
  80628c:	48 8b 05 0d e2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e20d]        # 4144a0 <current>
  806293:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806296:	48 63 d2             	movsxd rdx,edx
  806299:	48 83 c2 18          	add    rdx,0x18
  80629d:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8062a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8062a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062aa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8062ae:	48 85 c0             	test   rax,rax
  8062b1:	74 35                	je     8062e8 <sys_close+0x8b>
  8062b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8062bb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8062bf:	48 85 c0             	test   rax,rax
  8062c2:	74 24                	je     8062e8 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  8062c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062c8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8062cc:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8062d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8062d8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8062dc:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8062e0:	48 89 d6             	mov    rsi,rdx
  8062e3:	48 89 c7             	mov    rdi,rax
  8062e6:	ff d1                	call   rcx

    vmfree(filp);
  8062e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062ec:	48 89 c7             	mov    rdi,rax
  8062ef:	e8 b5 ae ff ff       	call   8011a9 <vmfree>
    current->openf[fd] = NULL;
  8062f4:	48 8b 05 a5 e1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e1a5]        # 4144a0 <current>
  8062fb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8062fe:	48 63 d2             	movsxd rdx,edx
  806301:	48 83 c2 18          	add    rdx,0x18
  806305:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  80630c:	00 00 

    return 0;
  80630e:	b8 00 00 00 00       	mov    eax,0x0
}
  806313:	c9                   	leave  
  806314:	c3                   	ret    

0000000000806315 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  806315:	f3 0f 1e fa          	endbr64 
  806319:	55                   	push   rbp
  80631a:	48 89 e5             	mov    rbp,rsp
  80631d:	48 83 ec 30          	sub    rsp,0x30
  806321:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806324:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806328:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80632c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806333:	00 
    unsigned long ret = 0;
  806334:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80633b:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  80633c:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806340:	78 06                	js     806348 <sys_read+0x33>
  806342:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  806346:	7e 09                	jle    806351 <sys_read+0x3c>
        return -EBADF;
  806348:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80634f:	eb 72                	jmp    8063c3 <sys_read+0xae>
    if(count < 0)
  806351:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806356:	79 09                	jns    806361 <sys_read+0x4c>
        return -EINVAL;
  806358:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80635f:	eb 62                	jmp    8063c3 <sys_read+0xae>

    filp = current->openf[fd];
  806361:	48 8b 05 38 e1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e138]        # 4144a0 <current>
  806368:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80636b:	48 63 d2             	movsxd rdx,edx
  80636e:	48 83 c2 18          	add    rdx,0x18
  806372:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  806377:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  80637b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80637f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806383:	48 85 c0             	test   rax,rax
  806386:	74 37                	je     8063bf <sys_read+0xaa>
  806388:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80638c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806390:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806394:	48 85 c0             	test   rax,rax
  806397:	74 26                	je     8063bf <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  806399:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80639d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8063a1:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  8063a5:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8063a9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8063ad:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8063b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8063b5:	48 89 c7             	mov    rdi,rax
  8063b8:	41 ff d0             	call   r8
  8063bb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8063bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8063c3:	c9                   	leave  
  8063c4:	c3                   	ret    

00000000008063c5 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  8063c5:	f3 0f 1e fa          	endbr64 
  8063c9:	55                   	push   rbp
  8063ca:	48 89 e5             	mov    rbp,rsp
  8063cd:	48 83 ec 30          	sub    rsp,0x30
  8063d1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8063d4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8063d8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8063dc:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8063e3:	00 
    unsigned long ret = 0;
  8063e4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8063eb:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8063ec:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8063f0:	78 06                	js     8063f8 <sys_write+0x33>
  8063f2:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8063f6:	7e 09                	jle    806401 <sys_write+0x3c>
        return -EBADF;
  8063f8:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8063ff:	eb 72                	jmp    806473 <sys_write+0xae>
    if(count < 0)
  806401:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806406:	79 09                	jns    806411 <sys_write+0x4c>
        return -EINVAL;
  806408:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80640f:	eb 62                	jmp    806473 <sys_write+0xae>

    filp = current->openf[fd];
  806411:	48 8b 05 88 e0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e088]        # 4144a0 <current>
  806418:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80641b:	48 63 d2             	movsxd rdx,edx
  80641e:	48 83 c2 18          	add    rdx,0x18
  806422:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  806427:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  80642b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80642f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806433:	48 85 c0             	test   rax,rax
  806436:	74 37                	je     80646f <sys_write+0xaa>
  806438:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80643c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806440:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806444:	48 85 c0             	test   rax,rax
  806447:	74 26                	je     80646f <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  806449:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80644d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806451:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  806455:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  806459:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80645d:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  806461:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806465:	48 89 c7             	mov    rdi,rax
  806468:	41 ff d0             	call   r8
  80646b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80646f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  806473:	c9                   	leave  
  806474:	c3                   	ret    

0000000000806475 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  806475:	f3 0f 1e fa          	endbr64 
  806479:	55                   	push   rbp
  80647a:	48 89 e5             	mov    rbp,rsp
  80647d:	48 83 ec 20          	sub    rsp,0x20
  806481:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806484:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806488:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  80648b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806492:	00 
    unsigned long ret = 0;
  806493:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80649a:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  80649b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80649f:	78 06                	js     8064a7 <sys_lseek+0x32>
  8064a1:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8064a5:	7e 09                	jle    8064b0 <sys_lseek+0x3b>
        return -EBADF;
  8064a7:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8064ae:	eb 78                	jmp    806528 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  8064b0:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8064b4:	78 06                	js     8064bc <sys_lseek+0x47>
  8064b6:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  8064ba:	7e 09                	jle    8064c5 <sys_lseek+0x50>
        return -EINVAL;
  8064bc:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8064c3:	eb 63                	jmp    806528 <sys_lseek+0xb3>

    filp = current->openf[filds];
  8064c5:	48 8b 05 d4 df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dfd4]        # 4144a0 <current>
  8064cc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8064cf:	48 63 d2             	movsxd rdx,edx
  8064d2:	48 83 c2 18          	add    rdx,0x18
  8064d6:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8064db:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  8064df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064e3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064e7:	48 85 c0             	test   rax,rax
  8064ea:	74 38                	je     806524 <sys_lseek+0xaf>
  8064ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064f0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064f4:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8064f8:	48 85 c0             	test   rax,rax
  8064fb:	74 27                	je     806524 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  8064fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806501:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806505:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  806509:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80650c:	48 63 d0             	movsxd rdx,eax
  80650f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  806513:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806517:	48 89 ce             	mov    rsi,rcx
  80651a:	48 89 c7             	mov    rdi,rax
  80651d:	41 ff d0             	call   r8
  806520:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  806524:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  806528:	c9                   	leave  
  806529:	c3                   	ret    

000000000080652a <sys_fork>:

unsigned long sys_fork()
{
  80652a:	f3 0f 1e fa          	endbr64 
  80652e:	55                   	push   rbp
  80652f:	48 89 e5             	mov    rbp,rsp
  806532:	48 83 ec 10          	sub    rsp,0x10
    TSS *regs = (TSS*)current->tss.rsp0 -1;
  806536:	48 8b 05 63 df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0df63]        # 4144a0 <current>
  80653d:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  806544:	48 83 e8 6c          	sub    rax,0x6c
  806548:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_fork\n");
  80654c:	bf 98 2d 81 00       	mov    edi,0x812d98
  806551:	b8 00 00 00 00       	mov    eax,0x0
  806556:	e8 a7 a7 ff ff       	call   800d02 <printf>
    //return do_fork(regs,0,regs->rsp,0);
}
  80655b:	90                   	nop
  80655c:	c9                   	leave  
  80655d:	c3                   	ret    

000000000080655e <sys_vfork>:

unsigned long sys_vfork()
{
  80655e:	f3 0f 1e fa          	endbr64 
  806562:	55                   	push   rbp
  806563:	48 89 e5             	mov    rbp,rsp
  806566:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  80656a:	48 8b 05 2f df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0df2f]        # 4144a0 <current>
  806571:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  806578:	48 2d d0 00 00 00    	sub    rax,0xd0
  80657e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  806582:	bf a2 2d 81 00       	mov    edi,0x812da2
  806587:	b8 00 00 00 00       	mov    eax,0x0
  80658c:	e8 71 a7 ff ff       	call   800d02 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  806591:	90                   	nop
  806592:	c9                   	leave  
  806593:	c3                   	ret    

0000000000806594 <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  806594:	f3 0f 1e fa          	endbr64 
  806598:	55                   	push   rbp
  806599:	48 89 e5             	mov    rbp,rsp
  80659c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8065a0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8065a4:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8065a7:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  8065ab:	90                   	nop
  8065ac:	5d                   	pop    rbp
  8065ad:	c3                   	ret    

00000000008065ae <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  8065ae:	f3 0f 1e fa          	endbr64 
  8065b2:	55                   	push   rbp
  8065b3:	48 89 e5             	mov    rbp,rsp
  8065b6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  8065ba:	90                   	nop
  8065bb:	5d                   	pop    rbp
  8065bc:	c3                   	ret    

00000000008065bd <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  8065bd:	f3 0f 1e fa          	endbr64 
  8065c1:	55                   	push   rbp
  8065c2:	48 89 e5             	mov    rbp,rsp
  8065c5:	48 83 ec 10          	sub    rsp,0x10
  8065c9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8065cd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  8065d1:	bf ad 2d 81 00       	mov    edi,0x812dad
  8065d6:	b8 00 00 00 00       	mov    eax,0x0
  8065db:	e8 22 a7 ff ff       	call   800d02 <printf>
    switch(cmd)
  8065e0:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8065e5:	74 09                	je     8065f0 <sys_reboot+0x33>
  8065e7:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  8065ec:	74 13                	je     806601 <sys_reboot+0x44>
  8065ee:	eb 22                	jmp    806612 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  8065f0:	be fe 00 00 00       	mov    esi,0xfe
  8065f5:	bf 64 00 00 00       	mov    edi,0x64
  8065fa:	e8 41 e2 ff ff       	call   804840 <outb>
            break;
  8065ff:	eb 21                	jmp    806622 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  806601:	bf c0 2d 81 00       	mov    edi,0x812dc0
  806606:	b8 00 00 00 00       	mov    eax,0x0
  80660b:	e8 f2 a6 ff ff       	call   800d02 <printf>
            break;
  806610:	eb 10                	jmp    806622 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  806612:	bf e0 2d 81 00       	mov    edi,0x812de0
  806617:	b8 00 00 00 00       	mov    eax,0x0
  80661c:	e8 e1 a6 ff ff       	call   800d02 <printf>
            break;
  806621:	90                   	nop
    }
    return 0;
  806622:	b8 00 00 00 00       	mov    eax,0x0
}
  806627:	c9                   	leave  
  806628:	c3                   	ret    

0000000000806629 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  806629:	f3 0f 1e fa          	endbr64 
  80662d:	55                   	push   rbp
  80662e:	48 89 e5             	mov    rbp,rsp
  806631:	48 83 ec 30          	sub    rsp,0x30
  806635:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  806639:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806640:	00 
    long pathlen = 0;
  806641:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806648:	00 
    struct dir_entry * dentry = NULL;
  806649:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806650:	00 

    printf("sys_chdir\n");
  806651:	bf f7 2d 81 00       	mov    edi,0x812df7
  806656:	b8 00 00 00 00       	mov    eax,0x0
  80665b:	e8 a2 a6 ff ff       	call   800d02 <printf>
    path = (char *)vmalloc();
  806660:	b8 00 00 00 00       	mov    eax,0x0
  806665:	e8 b0 aa ff ff       	call   80111a <vmalloc>
  80666a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  80666e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806673:	75 0c                	jne    806681 <sys_chdir+0x58>
        return -ENOMEM;
  806675:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80667c:	e9 ca 00 00 00       	jmp    80674b <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  806681:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806685:	ba 00 10 00 00       	mov    edx,0x1000
  80668a:	be 00 00 00 00       	mov    esi,0x0
  80668f:	48 89 c7             	mov    rdi,rax
  806692:	e8 89 41 00 00       	call   80a820 <memset>
    pathlen = strlen(filename);
  806697:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80669b:	48 89 c7             	mov    rdi,rax
  80669e:	e8 eb 43 00 00       	call   80aa8e <strlen>
  8066a3:	48 98                	cdqe   
  8066a5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8066a9:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8066ae:	7f 18                	jg     8066c8 <sys_chdir+0x9f>
    {
        vmfree(path);
  8066b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8066b4:	48 89 c7             	mov    rdi,rax
  8066b7:	e8 ed aa ff ff       	call   8011a9 <vmfree>
        return -EFAULT;
  8066bc:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8066c3:	e9 83 00 00 00       	jmp    80674b <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8066c8:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  8066cf:	00 
  8066d0:	7e 15                	jle    8066e7 <sys_chdir+0xbe>
    {
        vmfree(path);
  8066d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8066d6:	48 89 c7             	mov    rdi,rax
  8066d9:	e8 cb aa ff ff       	call   8011a9 <vmfree>
        return -ENAMETOOLONG;
  8066de:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8066e5:	eb 64                	jmp    80674b <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8066e7:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8066eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8066ef:	48 89 d6             	mov    rsi,rdx
  8066f2:	48 89 c7             	mov    rdi,rax
  8066f5:	e8 75 41 00 00       	call   80a86f <strcpy>

    dentry = path_walk(path,0);
  8066fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8066fe:	be 00 00 00 00       	mov    esi,0x0
  806703:	48 89 c7             	mov    rdi,rax
  806706:	e8 15 f4 ff ff       	call   805b20 <path_walk>
  80670b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  80670f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806713:	48 89 c7             	mov    rdi,rax
  806716:	e8 8e aa ff ff       	call   8011a9 <vmfree>

    if(dentry == NULL)
  80671b:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  806720:	75 09                	jne    80672b <sys_chdir+0x102>
        return -ENOENT;
  806722:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  806729:	eb 20                	jmp    80674b <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  80672b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80672f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806733:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806737:	48 83 f8 02          	cmp    rax,0x2
  80673b:	74 09                	je     806746 <sys_chdir+0x11d>
        return -ENOTDIR;
  80673d:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806744:	eb 05                	jmp    80674b <sys_chdir+0x122>
    return 0;
  806746:	b8 00 00 00 00       	mov    eax,0x0
}
  80674b:	c9                   	leave  
  80674c:	c3                   	ret    

000000000080674d <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  80674d:	f3 0f 1e fa          	endbr64 
  806751:	55                   	push   rbp
  806752:	48 89 e5             	mov    rbp,rsp
  806755:	48 83 ec 30          	sub    rsp,0x30
  806759:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80675c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806760:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  806764:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80676b:	00 
    unsigned long ret = 0;
  80676c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806773:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  806774:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806778:	78 06                	js     806780 <sys_getdents+0x33>
  80677a:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  80677e:	7e 09                	jle    806789 <sys_getdents+0x3c>
        return -EBADF;
  806780:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  806787:	eb 72                	jmp    8067fb <sys_getdents+0xae>
    if(count < 0)
  806789:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80678e:	79 09                	jns    806799 <sys_getdents+0x4c>
        return -EINVAL;
  806790:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  806797:	eb 62                	jmp    8067fb <sys_getdents+0xae>

    filp = current->openf[fd];
  806799:	48 8b 05 00 dd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dd00]        # 4144a0 <current>
  8067a0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8067a3:	48 63 d2             	movsxd rdx,edx
  8067a6:	48 83 c2 18          	add    rdx,0x18
  8067aa:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8067af:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  8067b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8067bb:	48 85 c0             	test   rax,rax
  8067be:	74 37                	je     8067f7 <sys_getdents+0xaa>
  8067c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8067c8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8067cc:	48 85 c0             	test   rax,rax
  8067cf:	74 26                	je     8067f7 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8067d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067d5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8067d9:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8067dd:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8067e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8067e5:	ba 9c 5d 80 00       	mov    edx,0x805d9c
  8067ea:	48 89 ce             	mov    rsi,rcx
  8067ed:	48 89 c7             	mov    rdi,rax
  8067f0:	41 ff d0             	call   r8
  8067f3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8067f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8067fb:	c9                   	leave  
  8067fc:	c3                   	ret    

00000000008067fd <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8067fd:	f3 0f 1e fa          	endbr64 
  806801:	55                   	push   rbp
  806802:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  806805:	0f b6 05 c1 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20fc1]        # 4277cd <k_shift>
  80680c:	84 c0                	test   al,al
  80680e:	0f 94 c0             	sete   al
  806811:	88 05 b6 0f c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20fb6],al        # 4277cd <k_shift>
}
  806817:	90                   	nop
  806818:	5d                   	pop    rbp
  806819:	c3                   	ret    

000000000080681a <ctrl>:
void ctrl()
{
  80681a:	f3 0f 1e fa          	endbr64 
  80681e:	55                   	push   rbp
  80681f:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  806822:	0f b6 05 a5 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20fa5]        # 4277ce <k_ctrl>
  806829:	84 c0                	test   al,al
  80682b:	0f 94 c0             	sete   al
  80682e:	88 05 9a 0f c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20f9a],al        # 4277ce <k_ctrl>
}
  806834:	90                   	nop
  806835:	5d                   	pop    rbp
  806836:	c3                   	ret    

0000000000806837 <capslock>:
void capslock()
{
  806837:	f3 0f 1e fa          	endbr64 
  80683b:	55                   	push   rbp
  80683c:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  80683f:	0f b6 05 89 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f89]        # 4277cf <k_capslock>
  806846:	84 c0                	test   al,al
  806848:	0f 94 c0             	sete   al
  80684b:	88 05 7e 0f c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20f7e],al        # 4277cf <k_capslock>
}
  806851:	90                   	nop
  806852:	5d                   	pop    rbp
  806853:	c3                   	ret    

0000000000806854 <to_ascii>:
char to_ascii(char scan_code)
{
  806854:	f3 0f 1e fa          	endbr64 
  806858:	55                   	push   rbp
  806859:	48 89 e5             	mov    rbp,rsp
  80685c:	89 f8                	mov    eax,edi
  80685e:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806861:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806868:	e9 c7 00 00 00       	jmp    806934 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  80686d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806870:	48 63 d0             	movsxd rdx,eax
  806873:	48 89 d0             	mov    rax,rdx
  806876:	48 c1 e0 02          	shl    rax,0x2
  80687a:	48 01 d0             	add    rax,rdx
  80687d:	48 05 82 2f 81 00    	add    rax,0x812f82
  806883:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806886:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  806889:	0f 85 a1 00 00 00    	jne    806930 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  80688f:	0f b6 05 39 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f39]        # 4277cf <k_capslock>
  806896:	84 c0                	test   al,al
  806898:	74 55                	je     8068ef <to_ascii+0x9b>
  80689a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80689d:	48 63 d0             	movsxd rdx,eax
  8068a0:	48 89 d0             	mov    rax,rdx
  8068a3:	48 c1 e0 02          	shl    rax,0x2
  8068a7:	48 01 d0             	add    rax,rdx
  8068aa:	48 05 80 2f 81 00    	add    rax,0x812f80
  8068b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068b3:	3c 60                	cmp    al,0x60
  8068b5:	7e 38                	jle    8068ef <to_ascii+0x9b>
  8068b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068ba:	48 63 d0             	movsxd rdx,eax
  8068bd:	48 89 d0             	mov    rax,rdx
  8068c0:	48 c1 e0 02          	shl    rax,0x2
  8068c4:	48 01 d0             	add    rax,rdx
  8068c7:	48 05 80 2f 81 00    	add    rax,0x812f80
  8068cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068d0:	3c 7a                	cmp    al,0x7a
  8068d2:	7f 1b                	jg     8068ef <to_ascii+0x9b>
  8068d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068d7:	48 63 d0             	movsxd rdx,eax
  8068da:	48 89 d0             	mov    rax,rdx
  8068dd:	48 c1 e0 02          	shl    rax,0x2
  8068e1:	48 01 d0             	add    rax,rdx
  8068e4:	48 05 81 2f 81 00    	add    rax,0x812f81
  8068ea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8068ed:	eb 54                	jmp    806943 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8068ef:	0f b6 05 d7 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ed7]        # 4277cd <k_shift>
  8068f6:	84 c0                	test   al,al
  8068f8:	74 1b                	je     806915 <to_ascii+0xc1>
  8068fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068fd:	48 63 d0             	movsxd rdx,eax
  806900:	48 89 d0             	mov    rax,rdx
  806903:	48 c1 e0 02          	shl    rax,0x2
  806907:	48 01 d0             	add    rax,rdx
  80690a:	48 05 81 2f 81 00    	add    rax,0x812f81
  806910:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806913:	eb 2e                	jmp    806943 <to_ascii+0xef>
            else return key_map[i].ascii;
  806915:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806918:	48 63 d0             	movsxd rdx,eax
  80691b:	48 89 d0             	mov    rax,rdx
  80691e:	48 c1 e0 02          	shl    rax,0x2
  806922:	48 01 d0             	add    rax,rdx
  806925:	48 05 80 2f 81 00    	add    rax,0x812f80
  80692b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80692e:	eb 13                	jmp    806943 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806930:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806934:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  806938:	0f 8e 2f ff ff ff    	jle    80686d <to_ascii+0x19>
        }

    return '\0';
  80693e:	b8 00 00 00 00       	mov    eax,0x0
}
  806943:	5d                   	pop    rbp
  806944:	c3                   	ret    

0000000000806945 <init_kb>:
int init_kb()
{
  806945:	f3 0f 1e fa          	endbr64 
  806949:	55                   	push   rbp
  80694a:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  80694d:	bf c0 2e 81 00       	mov    edi,0x812ec0
  806952:	e8 76 ba ff ff       	call   8023cd <reg_device>
    reg_driver(&drv_keyboard);
  806957:	bf 20 2e 81 00       	mov    edi,0x812e20
  80695c:	e8 54 bd ff ff       	call   8026b5 <reg_driver>
}
  806961:	90                   	nop
  806962:	5d                   	pop    rbp
  806963:	c3                   	ret    

0000000000806964 <key_proc>:
int key_proc()
{
  806964:	f3 0f 1e fa          	endbr64 
  806968:	55                   	push   rbp
  806969:	48 89 e5             	mov    rbp,rsp
  80696c:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  806970:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  806974:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  806978:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  80697c:	bf 60 00 00 00       	mov    edi,0x60
  806981:	e8 d3 de ff ff       	call   804859 <inb>
  806986:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  806989:	8b 05 3d 48 00 00    	mov    eax,DWORD PTR [rip+0x483d]        # 80b1cc <key_bufq+0xc>
  80698f:	83 c0 01             	add    eax,0x1
  806992:	8b 0d 38 48 00 00    	mov    ecx,DWORD PTR [rip+0x4838]        # 80b1d0 <key_bufq+0x10>
  806998:	99                   	cdq    
  806999:	f7 f9                	idiv   ecx
  80699b:	8b 05 27 48 00 00    	mov    eax,DWORD PTR [rip+0x4827]        # 80b1c8 <key_bufq+0x8>
  8069a1:	39 c2                	cmp    edx,eax
  8069a3:	74 32                	je     8069d7 <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8069a5:	48 8b 15 14 48 00 00 	mov    rdx,QWORD PTR [rip+0x4814]        # 80b1c0 <key_bufq>
  8069ac:	8b 05 1a 48 00 00    	mov    eax,DWORD PTR [rip+0x481a]        # 80b1cc <key_bufq+0xc>
  8069b2:	48 98                	cdqe   
  8069b4:	48 01 c2             	add    rdx,rax
  8069b7:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8069bb:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8069bd:	8b 05 09 48 00 00    	mov    eax,DWORD PTR [rip+0x4809]        # 80b1cc <key_bufq+0xc>
  8069c3:	83 c0 01             	add    eax,0x1
  8069c6:	8b 0d 04 48 00 00    	mov    ecx,DWORD PTR [rip+0x4804]        # 80b1d0 <key_bufq+0x10>
  8069cc:	99                   	cdq    
  8069cd:	f7 f9                	idiv   ecx
  8069cf:	89 d0                	mov    eax,edx
  8069d1:	89 05 f5 47 00 00    	mov    DWORD PTR [rip+0x47f5],eax        # 80b1cc <key_bufq+0xc>
    }

    if(scan1==0x48)
  8069d7:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8069db:	75 0a                	jne    8069e7 <key_proc+0x83>
        scr_up();
  8069dd:	b8 00 00 00 00       	mov    eax,0x0
  8069e2:	e8 1f ef ff ff       	call   805906 <scr_up>
    if(scan1==0x50)
  8069e7:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8069eb:	75 0a                	jne    8069f7 <key_proc+0x93>
        scr_down();
  8069ed:	b8 00 00 00 00       	mov    eax,0x0
  8069f2:	e8 a9 ef ff ff       	call   8059a0 <scr_down>
    switch (scan1)
  8069f7:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8069fb:	3d b6 00 00 00       	cmp    eax,0xb6
  806a00:	74 41                	je     806a43 <key_proc+0xdf>
  806a02:	3d b6 00 00 00       	cmp    eax,0xb6
  806a07:	7f 5e                	jg     806a67 <key_proc+0x103>
  806a09:	3d aa 00 00 00       	cmp    eax,0xaa
  806a0e:	74 33                	je     806a43 <key_proc+0xdf>
  806a10:	3d aa 00 00 00       	cmp    eax,0xaa
  806a15:	7f 50                	jg     806a67 <key_proc+0x103>
  806a17:	3d 9d 00 00 00       	cmp    eax,0x9d
  806a1c:	74 31                	je     806a4f <key_proc+0xeb>
  806a1e:	3d 9d 00 00 00       	cmp    eax,0x9d
  806a23:	7f 42                	jg     806a67 <key_proc+0x103>
  806a25:	83 f8 3a             	cmp    eax,0x3a
  806a28:	74 31                	je     806a5b <key_proc+0xf7>
  806a2a:	83 f8 3a             	cmp    eax,0x3a
  806a2d:	7f 38                	jg     806a67 <key_proc+0x103>
  806a2f:	83 f8 36             	cmp    eax,0x36
  806a32:	74 0f                	je     806a43 <key_proc+0xdf>
  806a34:	83 f8 36             	cmp    eax,0x36
  806a37:	7f 2e                	jg     806a67 <key_proc+0x103>
  806a39:	83 f8 1d             	cmp    eax,0x1d
  806a3c:	74 11                	je     806a4f <key_proc+0xeb>
  806a3e:	83 f8 2a             	cmp    eax,0x2a
  806a41:	75 24                	jne    806a67 <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  806a43:	b8 00 00 00 00       	mov    eax,0x0
  806a48:	e8 b0 fd ff ff       	call   8067fd <shift>
            break;
  806a4d:	eb 19                	jmp    806a68 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  806a4f:	b8 00 00 00 00       	mov    eax,0x0
  806a54:	e8 c1 fd ff ff       	call   80681a <ctrl>
            break;
  806a59:	eb 0d                	jmp    806a68 <key_proc+0x104>
        case 0x3a:
            capslock();
  806a5b:	b8 00 00 00 00       	mov    eax,0x0
  806a60:	e8 d2 fd ff ff       	call   806837 <capslock>
            break;
  806a65:	eb 01                	jmp    806a68 <key_proc+0x104>
        default:
            break;
  806a67:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  806a68:	b8 00 00 00 00       	mov    eax,0x0
  806a6d:	e8 fc dd ff ff       	call   80486e <eoi>
    asm volatile("leave \r\n iretq");
  806a72:	c9                   	leave  
  806a73:	48 cf                	iretq  
}
  806a75:	90                   	nop
  806a76:	c9                   	leave  
  806a77:	c3                   	ret    

0000000000806a78 <sys_getkbc>:

char sys_getkbc()
{
  806a78:	f3 0f 1e fa          	endbr64 
  806a7c:	55                   	push   rbp
  806a7d:	48 89 e5             	mov    rbp,rsp
  806a80:	48 83 ec 10          	sub    rsp,0x10
    if(key_bufq.tail==key_bufq.head)return -1;
  806a84:	8b 15 42 47 00 00    	mov    edx,DWORD PTR [rip+0x4742]        # 80b1cc <key_bufq+0xc>
  806a8a:	8b 05 38 47 00 00    	mov    eax,DWORD PTR [rip+0x4738]        # 80b1c8 <key_bufq+0x8>
  806a90:	39 c2                	cmp    edx,eax
  806a92:	75 07                	jne    806a9b <sys_getkbc+0x23>
  806a94:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a99:	eb 4e                	jmp    806ae9 <sys_getkbc+0x71>
    char c=key_buf[key_bufq.head];
  806a9b:	8b 05 27 47 00 00    	mov    eax,DWORD PTR [rip+0x4727]        # 80b1c8 <key_bufq+0x8>
  806aa1:	48 98                	cdqe   
  806aa3:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  806aaa:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
  806aad:	8b 05 15 47 00 00    	mov    eax,DWORD PTR [rip+0x4715]        # 80b1c8 <key_bufq+0x8>
  806ab3:	83 c0 01             	add    eax,0x1
  806ab6:	8b 0d 14 47 00 00    	mov    ecx,DWORD PTR [rip+0x4714]        # 80b1d0 <key_bufq+0x10>
  806abc:	99                   	cdq    
  806abd:	f7 f9                	idiv   ecx
  806abf:	89 d0                	mov    eax,edx
  806ac1:	89 05 01 47 00 00    	mov    DWORD PTR [rip+0x4701],eax        # 80b1c8 <key_bufq+0x8>
    if(c&FLAG_BREAK)return -1;
  806ac7:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  806acb:	79 07                	jns    806ad4 <sys_getkbc+0x5c>
  806acd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806ad2:	eb 15                	jmp    806ae9 <sys_getkbc+0x71>
    c= to_ascii(c&0x7f);
  806ad4:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  806ad8:	83 e0 7f             	and    eax,0x7f
  806adb:	89 c7                	mov    edi,eax
  806add:	e8 72 fd ff ff       	call   806854 <to_ascii>
  806ae2:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    return c;
  806ae5:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806ae9:	c9                   	leave  
  806aea:	c3                   	ret    

0000000000806aeb <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  806aeb:	f3 0f 1e fa          	endbr64 
  806aef:	55                   	push   rbp
  806af0:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806af3:	b8 00 00 00 00       	mov    eax,0x0
  806af8:	e8 8d 09 00 00       	call   80748a <hd_iterate>
    return 0;
  806afd:	b8 00 00 00 00       	mov    eax,0x0
}
  806b02:	5d                   	pop    rbp
  806b03:	c3                   	ret    

0000000000806b04 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806b04:	f3 0f 1e fa          	endbr64 
  806b08:	55                   	push   rbp
  806b09:	48 89 e5             	mov    rbp,rsp
  806b0c:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806b10:	48 8b 05 c9 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc239c9]        # 42a4e0 <running_req>
  806b17:	48 85 c0             	test   rax,rax
  806b1a:	75 0a                	jne    806b26 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  806b1c:	b8 01 00 00 00       	mov    eax,0x1
  806b21:	e9 a3 01 00 00       	jmp    806cc9 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806b26:	48 8b 05 b3 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc239b3]        # 42a4e0 <running_req>
  806b2d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806b31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806b35:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806b3c:	48 8b 05 9d 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2399d]        # 42a4e0 <running_req>
  806b43:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806b46:	83 f8 02             	cmp    eax,0x2
  806b49:	74 0f                	je     806b5a <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  806b4b:	48 8b 05 8e 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2398e]        # 42a4e0 <running_req>
  806b52:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806b55:	83 f8 03             	cmp    eax,0x3
  806b58:	75 07                	jne    806b61 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  806b5a:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806b61:	48 8b 05 78 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23978]        # 42a4e0 <running_req>
  806b68:	8b 00                	mov    eax,DWORD PTR [rax]
  806b6a:	85 c0                	test   eax,eax
  806b6c:	75 42                	jne    806bb0 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  806b6e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806b75:	eb 22                	jmp    806b99 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  806b77:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806b7a:	0f b7 c0             	movzx  eax,ax
  806b7d:	89 c7                	mov    edi,eax
  806b7f:	e8 df dc ff ff       	call   804863 <inw>
  806b84:	89 c2                	mov    edx,eax
  806b86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b8a:	48 8d 48 02          	lea    rcx,[rax+0x2]
  806b8e:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  806b92:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  806b95:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806b99:	48 8b 05 40 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23940]        # 42a4e0 <running_req>
  806ba0:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806ba3:	c1 e0 08             	shl    eax,0x8
  806ba6:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  806ba9:	7c cc                	jl     806b77 <disk_int_handler_c+0x73>
  806bab:	e9 ca 00 00 00       	jmp    806c7a <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806bb0:	48 8b 05 29 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23929]        # 42a4e0 <running_req>
  806bb7:	8b 00                	mov    eax,DWORD PTR [rax]
  806bb9:	83 f8 01             	cmp    eax,0x1
  806bbc:	75 42                	jne    806c00 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  806bbe:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806bc5:	eb 25                	jmp    806bec <disk_int_handler_c+0xe8>
            outw(port,*p++);
  806bc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806bcb:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806bcf:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806bd3:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806bd6:	0f b7 d0             	movzx  edx,ax
  806bd9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806bdc:	0f b7 c0             	movzx  eax,ax
  806bdf:	89 d6                	mov    esi,edx
  806be1:	89 c7                	mov    edi,eax
  806be3:	e8 65 dc ff ff       	call   80484d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806be8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806bec:	48 8b 05 ed 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ed]        # 42a4e0 <running_req>
  806bf3:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806bf6:	c1 e0 08             	shl    eax,0x8
  806bf9:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806bfc:	7c c9                	jl     806bc7 <disk_int_handler_c+0xc3>
  806bfe:	eb 7a                	jmp    806c7a <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806c00:	48 8b 05 d9 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238d9]        # 42a4e0 <running_req>
  806c07:	8b 00                	mov    eax,DWORD PTR [rax]
  806c09:	83 f8 02             	cmp    eax,0x2
  806c0c:	75 34                	jne    806c42 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806c0e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c11:	83 c0 07             	add    eax,0x7
  806c14:	0f b6 c0             	movzx  eax,al
  806c17:	89 c7                	mov    edi,eax
  806c19:	e8 3b dc ff ff       	call   804859 <inb>
  806c1e:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806c21:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c24:	0f b7 c0             	movzx  eax,ax
  806c27:	89 c7                	mov    edi,eax
  806c29:	e8 35 dc ff ff       	call   804863 <inw>
  806c2e:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806c32:	48 8b 05 a7 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238a7]        # 42a4e0 <running_req>
  806c39:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806c40:	eb 38                	jmp    806c7a <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806c42:	48 8b 05 97 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23897]        # 42a4e0 <running_req>
  806c49:	8b 00                	mov    eax,DWORD PTR [rax]
  806c4b:	83 f8 03             	cmp    eax,0x3
  806c4e:	75 2a                	jne    806c7a <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806c50:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c53:	83 c0 07             	add    eax,0x7
  806c56:	0f b6 c0             	movzx  eax,al
  806c59:	89 c7                	mov    edi,eax
  806c5b:	e8 f9 db ff ff       	call   804859 <inb>
  806c60:	0f b6 c0             	movzx  eax,al
  806c63:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806c66:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c69:	89 c6                	mov    esi,eax
  806c6b:	bf 56 31 81 00       	mov    edi,0x813156
  806c70:	b8 00 00 00 00       	mov    eax,0x0
  806c75:	e8 88 a0 ff ff       	call   800d02 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  806c7a:	48 8b 05 5f 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2385f]        # 42a4e0 <running_req>
  806c81:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806c88:	48 8b 05 51 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23851]        # 42a4e0 <running_req>
  806c8f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806c93:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806c9a:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806c9d:	48 8b 05 44 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23844]        # 42a4e8 <running_devman_req>
  806ca4:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  806cab:	00 00 00 
    running_devman_req=NULL;
  806cae:	48 c7 05 2f 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2382f],0x0        # 42a4e8 <running_devman_req>
  806cb5:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806cb9:	48 c7 05 1c 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2381c],0x0        # 42a4e0 <running_req>
  806cc0:	00 00 00 00 
    return 0;
  806cc4:	b8 00 00 00 00       	mov    eax,0x0
}
  806cc9:	c9                   	leave  
  806cca:	c3                   	ret    

0000000000806ccb <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806ccb:	f3 0f 1e fa          	endbr64 
  806ccf:	55                   	push   rbp
  806cd0:	48 89 e5             	mov    rbp,rsp
  806cd3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806cd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cd9:	48 63 d0             	movsxd rdx,eax
  806cdc:	48 89 d0             	mov    rax,rdx
  806cdf:	48 01 c0             	add    rax,rax
  806ce2:	48 01 d0             	add    rax,rdx
  806ce5:	48 c1 e0 04          	shl    rax,0x4
  806ce9:	48 05 fc 77 42 00    	add    rax,0x4277fc
  806cef:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806cf1:	5d                   	pop    rbp
  806cf2:	c3                   	ret    

0000000000806cf3 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806cf3:	f3 0f 1e fa          	endbr64 
  806cf7:	55                   	push   rbp
  806cf8:	48 89 e5             	mov    rbp,rsp
  806cfb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806cfe:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806d01:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806d04:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806d07:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806d0b:	8b 05 03 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23803]        # 42a514 <tail>
  806d11:	83 c0 01             	add    eax,0x1
  806d14:	48 63 d0             	movsxd rdx,eax
  806d17:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806d1e:	48 c1 ea 20          	shr    rdx,0x20
  806d22:	01 c2                	add    edx,eax
  806d24:	c1 fa 07             	sar    edx,0x7
  806d27:	89 c1                	mov    ecx,eax
  806d29:	c1 f9 1f             	sar    ecx,0x1f
  806d2c:	29 ca                	sub    edx,ecx
  806d2e:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806d34:	29 c8                	sub    eax,ecx
  806d36:	89 c2                	mov    edx,eax
  806d38:	8b 05 d2 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc237d2]        # 42a510 <head>
  806d3e:	39 c2                	cmp    edx,eax
  806d40:	75 0a                	jne    806d4c <request+0x59>
    {
        return -1;
  806d42:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806d47:	e9 0d 01 00 00       	jmp    806e59 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806d4c:	8b 05 c2 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc237c2]        # 42a514 <tail>
  806d52:	48 63 d0             	movsxd rdx,eax
  806d55:	48 89 d0             	mov    rax,rdx
  806d58:	48 01 c0             	add    rax,rax
  806d5b:	48 01 d0             	add    rax,rdx
  806d5e:	48 c1 e0 04          	shl    rax,0x4
  806d62:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  806d69:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806d6c:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806d6e:	8b 05 a0 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc237a0]        # 42a514 <tail>
  806d74:	48 63 d0             	movsxd rdx,eax
  806d77:	48 89 d0             	mov    rax,rdx
  806d7a:	48 01 c0             	add    rax,rax
  806d7d:	48 01 d0             	add    rax,rdx
  806d80:	48 c1 e0 04          	shl    rax,0x4
  806d84:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  806d8b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806d8e:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806d90:	8b 05 7e 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2377e]        # 42a514 <tail>
  806d96:	48 63 d0             	movsxd rdx,eax
  806d99:	48 89 d0             	mov    rax,rdx
  806d9c:	48 01 c0             	add    rax,rax
  806d9f:	48 01 d0             	add    rax,rdx
  806da2:	48 c1 e0 04          	shl    rax,0x4
  806da6:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  806dad:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806db0:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806db2:	8b 05 5c 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2375c]        # 42a514 <tail>
  806db8:	48 63 d0             	movsxd rdx,eax
  806dbb:	48 89 d0             	mov    rax,rdx
  806dbe:	48 01 c0             	add    rax,rax
  806dc1:	48 01 d0             	add    rax,rdx
  806dc4:	48 c1 e0 04          	shl    rax,0x4
  806dc8:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  806dcf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806dd2:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806dd4:	8b 05 3a 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2373a]        # 42a514 <tail>
  806dda:	48 63 d0             	movsxd rdx,eax
  806ddd:	48 89 d0             	mov    rax,rdx
  806de0:	48 01 c0             	add    rax,rax
  806de3:	48 01 d0             	add    rax,rdx
  806de6:	48 c1 e0 04          	shl    rax,0x4
  806dea:	48 05 fc 77 42 00    	add    rax,0x4277fc
  806df0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806df6:	8b 05 18 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23718]        # 42a514 <tail>
  806dfc:	48 63 d0             	movsxd rdx,eax
  806dff:	48 89 d0             	mov    rax,rdx
  806e02:	48 01 c0             	add    rax,rax
  806e05:	48 01 d0             	add    rax,rdx
  806e08:	48 c1 e0 04          	shl    rax,0x4
  806e0c:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  806e13:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806e17:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806e1a:	8b 05 f4 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc236f4]        # 42a514 <tail>
  806e20:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806e23:	8b 05 eb 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc236eb]        # 42a514 <tail>
  806e29:	8d 50 01             	lea    edx,[rax+0x1]
  806e2c:	48 63 c2             	movsxd rax,edx
  806e2f:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806e36:	48 c1 e8 20          	shr    rax,0x20
  806e3a:	01 d0                	add    eax,edx
  806e3c:	c1 f8 07             	sar    eax,0x7
  806e3f:	89 d1                	mov    ecx,edx
  806e41:	c1 f9 1f             	sar    ecx,0x1f
  806e44:	29 c8                	sub    eax,ecx
  806e46:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806e4c:	89 d0                	mov    eax,edx
  806e4e:	29 c8                	sub    eax,ecx
  806e50:	89 05 be 36 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc236be],eax        # 42a514 <tail>
    return r;
  806e56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806e59:	5d                   	pop    rbp
  806e5a:	c3                   	ret    

0000000000806e5b <execute_request>:
int execute_request(){
  806e5b:	f3 0f 1e fa          	endbr64 
  806e5f:	55                   	push   rbp
  806e60:	48 89 e5             	mov    rbp,rsp
  806e63:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806e67:	48 8b 05 72 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23672]        # 42a4e0 <running_req>
  806e6e:	48 85 c0             	test   rax,rax
  806e71:	74 6a                	je     806edd <execute_request+0x82>
    {
        running_req->time++;
  806e73:	48 8b 05 66 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23666]        # 42a4e0 <running_req>
  806e7a:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806e7d:	83 c2 01             	add    edx,0x1
  806e80:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806e83:	48 8b 05 56 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23656]        # 42a4e0 <running_req>
  806e8a:	8b 00                	mov    eax,DWORD PTR [rax]
  806e8c:	83 f8 02             	cmp    eax,0x2
  806e8f:	74 0a                	je     806e9b <execute_request+0x40>
            return 2;
  806e91:	b8 02 00 00 00       	mov    eax,0x2
  806e96:	e9 b4 01 00 00       	jmp    80704f <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806e9b:	48 8b 05 3e 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2363e]        # 42a4e0 <running_req>
  806ea2:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806ea5:	83 f8 0a             	cmp    eax,0xa
  806ea8:	7e 29                	jle    806ed3 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806eaa:	48 8b 05 2f 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2362f]        # 42a4e0 <running_req>
  806eb1:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806eb8:	48 8b 05 21 36 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23621]        # 42a4e0 <running_req>
  806ebf:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806ec6:	48 c7 05 0f 36 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2360f],0x0        # 42a4e0 <running_req>
  806ecd:	00 00 00 00 
  806ed1:	eb 0a                	jmp    806edd <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806ed3:	b8 02 00 00 00       	mov    eax,0x2
  806ed8:	e9 72 01 00 00       	jmp    80704f <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806edd:	8b 15 2d 36 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2362d]        # 42a510 <head>
  806ee3:	8b 05 2b 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2362b]        # 42a514 <tail>
  806ee9:	39 c2                	cmp    edx,eax
  806eeb:	75 0a                	jne    806ef7 <execute_request+0x9c>
  806eed:	b8 01 00 00 00       	mov    eax,0x1
  806ef2:	e9 58 01 00 00       	jmp    80704f <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806ef7:	8b 05 13 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23613]        # 42a510 <head>
  806efd:	48 63 d0             	movsxd rdx,eax
  806f00:	48 89 d0             	mov    rax,rdx
  806f03:	48 01 c0             	add    rax,rax
  806f06:	48 01 d0             	add    rax,rdx
  806f09:	48 c1 e0 04          	shl    rax,0x4
  806f0d:	48 05 e0 77 42 00    	add    rax,0x4277e0
  806f13:	48 89 05 c6 35 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc235c6],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806f1a:	8b 05 f0 35 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc235f0]        # 42a510 <head>
  806f20:	8d 50 01             	lea    edx,[rax+0x1]
  806f23:	48 63 c2             	movsxd rax,edx
  806f26:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806f2d:	48 c1 e8 20          	shr    rax,0x20
  806f31:	01 d0                	add    eax,edx
  806f33:	c1 f8 07             	sar    eax,0x7
  806f36:	89 d1                	mov    ecx,edx
  806f38:	c1 f9 1f             	sar    ecx,0x1f
  806f3b:	29 c8                	sub    eax,ecx
  806f3d:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806f43:	89 d0                	mov    eax,edx
  806f45:	29 c8                	sub    eax,ecx
  806f47:	89 05 c3 35 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc235c3],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  806f4d:	48 8b 05 8c 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2358c]        # 42a4e0 <running_req>
  806f54:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806f5b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806f62:	48 8b 05 77 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23577]        # 42a4e0 <running_req>
  806f69:	8b 00                	mov    eax,DWORD PTR [rax]
  806f6b:	83 f8 03             	cmp    eax,0x3
  806f6e:	0f 84 ad 00 00 00    	je     807021 <execute_request+0x1c6>
  806f74:	83 f8 03             	cmp    eax,0x3
  806f77:	0f 8f bf 00 00 00    	jg     80703c <execute_request+0x1e1>
  806f7d:	83 f8 02             	cmp    eax,0x2
  806f80:	0f 84 85 00 00 00    	je     80700b <execute_request+0x1b0>
  806f86:	83 f8 02             	cmp    eax,0x2
  806f89:	0f 8f ad 00 00 00    	jg     80703c <execute_request+0x1e1>
  806f8f:	85 c0                	test   eax,eax
  806f91:	74 0a                	je     806f9d <execute_request+0x142>
  806f93:	83 f8 01             	cmp    eax,0x1
  806f96:	74 3c                	je     806fd4 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806f98:	e9 9f 00 00 00       	jmp    80703c <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806f9d:	48 8b 05 3c 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2353c]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  806fa4:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806fa8:	48 8b 05 31 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23531]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  806faf:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806fb2:	48 8b 05 27 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23527]        # 42a4e0 <running_req>
  806fb9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806fbc:	89 c6                	mov    esi,eax
  806fbe:	48 8b 05 1b 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2351b]        # 42a4e0 <running_req>
  806fc5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806fc8:	89 c7                	mov    edi,eax
  806fca:	e8 a7 00 00 00       	call   807076 <async_read_disk>
  806fcf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806fd2:	eb 69                	jmp    80703d <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806fd4:	48 8b 05 05 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23505]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  806fdb:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806fdf:	48 8b 05 fa 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234fa]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  806fe6:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806fe9:	48 8b 05 f0 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234f0]        # 42a4e0 <running_req>
  806ff0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806ff3:	89 c6                	mov    esi,eax
  806ff5:	48 8b 05 e4 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234e4]        # 42a4e0 <running_req>
  806ffc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806fff:	89 c7                	mov    edi,eax
  807001:	e8 88 01 00 00       	call   80718e <async_write_disk>
  807006:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807009:	eb 32                	jmp    80703d <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  80700b:	48 8b 05 ce 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234ce]        # 42a4e0 <running_req>
  807012:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807015:	89 c7                	mov    edi,eax
  807017:	e8 8f 06 00 00       	call   8076ab <async_check_disk>
  80701c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80701f:	eb 1c                	jmp    80703d <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  807021:	48 8b 05 b8 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234b8]        # 42a4e0 <running_req>
  807028:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80702b:	89 c7                	mov    edi,eax
  80702d:	b8 00 00 00 00       	mov    eax,0x0
  807032:	e8 1a 00 00 00       	call   807051 <async_reset_disk>
  807037:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80703a:	eb 01                	jmp    80703d <execute_request+0x1e2>
        break;
  80703c:	90                   	nop
    }
    if(r==-1)return -1;
  80703d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807041:	75 07                	jne    80704a <execute_request+0x1ef>
  807043:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807048:	eb 05                	jmp    80704f <execute_request+0x1f4>
    return 0;
  80704a:	b8 00 00 00 00       	mov    eax,0x0
}
  80704f:	c9                   	leave  
  807050:	c3                   	ret    

0000000000807051 <async_reset_disk>:
int async_reset_disk(int disk)
{
  807051:	f3 0f 1e fa          	endbr64 
  807055:	55                   	push   rbp
  807056:	48 89 e5             	mov    rbp,rsp
  807059:	48 83 ec 10          	sub    rsp,0x10
  80705d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  807060:	be 0c 00 00 00       	mov    esi,0xc
  807065:	bf f6 03 00 00       	mov    edi,0x3f6
  80706a:	e8 d1 d7 ff ff       	call   804840 <outb>
    return 0;
  80706f:	b8 00 00 00 00       	mov    eax,0x0
}
  807074:	c9                   	leave  
  807075:	c3                   	ret    

0000000000807076 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  807076:	f3 0f 1e fa          	endbr64 
  80707a:	55                   	push   rbp
  80707b:	48 89 e5             	mov    rbp,rsp
  80707e:	48 83 ec 30          	sub    rsp,0x30
  807082:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807085:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807088:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80708b:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80708f:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807095:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80709c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8070a0:	74 06                	je     8070a8 <async_read_disk+0x32>
  8070a2:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070a6:	75 06                	jne    8070ae <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  8070a8:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8070ae:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070b2:	74 06                	je     8070ba <async_read_disk+0x44>
  8070b4:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8070b8:	75 07                	jne    8070c1 <async_read_disk+0x4b>
        slave_disk=1;
  8070ba:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  8070c1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8070c4:	0f b6 d0             	movzx  edx,al
  8070c7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070cb:	83 c0 02             	add    eax,0x2
  8070ce:	0f b7 c0             	movzx  eax,ax
  8070d1:	89 d6                	mov    esi,edx
  8070d3:	89 c7                	mov    edi,eax
  8070d5:	e8 66 d7 ff ff       	call   804840 <outb>
    outb(port+3,lba&0xff);
  8070da:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8070dd:	0f b6 d0             	movzx  edx,al
  8070e0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070e4:	83 c0 03             	add    eax,0x3
  8070e7:	0f b7 c0             	movzx  eax,ax
  8070ea:	89 d6                	mov    esi,edx
  8070ec:	89 c7                	mov    edi,eax
  8070ee:	e8 4d d7 ff ff       	call   804840 <outb>
    outb(port+4,(lba>>8)&0xff);
  8070f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8070f6:	c1 e8 08             	shr    eax,0x8
  8070f9:	0f b6 d0             	movzx  edx,al
  8070fc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807100:	83 c0 04             	add    eax,0x4
  807103:	0f b7 c0             	movzx  eax,ax
  807106:	89 d6                	mov    esi,edx
  807108:	89 c7                	mov    edi,eax
  80710a:	e8 31 d7 ff ff       	call   804840 <outb>
    outb(port+5,(lba>>16)&0xff);
  80710f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807112:	c1 e8 10             	shr    eax,0x10
  807115:	0f b6 d0             	movzx  edx,al
  807118:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80711c:	83 c0 05             	add    eax,0x5
  80711f:	0f b7 c0             	movzx  eax,ax
  807122:	89 d6                	mov    esi,edx
  807124:	89 c7                	mov    edi,eax
  807126:	e8 15 d7 ff ff       	call   804840 <outb>
    char drv=slave_disk?0x10:0;
  80712b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  80712f:	74 07                	je     807138 <async_read_disk+0xc2>
  807131:	b8 10 00 00 00       	mov    eax,0x10
  807136:	eb 05                	jmp    80713d <async_read_disk+0xc7>
  807138:	b8 00 00 00 00       	mov    eax,0x0
  80713d:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  807140:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807143:	c1 e8 18             	shr    eax,0x18
  807146:	83 e0 0f             	and    eax,0xf
  807149:	89 c2                	mov    edx,eax
  80714b:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80714f:	09 d0                	or     eax,edx
  807151:	83 c8 e0             	or     eax,0xffffffe0
  807154:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  807157:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  80715b:	0f b6 d0             	movzx  edx,al
  80715e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807162:	83 c0 06             	add    eax,0x6
  807165:	0f b7 c0             	movzx  eax,ax
  807168:	89 d6                	mov    esi,edx
  80716a:	89 c7                	mov    edi,eax
  80716c:	e8 cf d6 ff ff       	call   804840 <outb>
    outb(port+7,DISK_CMD_READ);
  807171:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807175:	83 c0 07             	add    eax,0x7
  807178:	0f b7 c0             	movzx  eax,ax
  80717b:	be 20 00 00 00       	mov    esi,0x20
  807180:	89 c7                	mov    edi,eax
  807182:	e8 b9 d6 ff ff       	call   804840 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  807187:	b8 00 00 00 00       	mov    eax,0x0
}
  80718c:	c9                   	leave  
  80718d:	c3                   	ret    

000000000080718e <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  80718e:	f3 0f 1e fa          	endbr64 
  807192:	55                   	push   rbp
  807193:	48 89 e5             	mov    rbp,rsp
  807196:	48 83 ec 30          	sub    rsp,0x30
  80719a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80719d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8071a0:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8071a3:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8071a7:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8071ad:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8071b4:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8071b8:	74 06                	je     8071c0 <async_write_disk+0x32>
  8071ba:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8071be:	75 06                	jne    8071c6 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  8071c0:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8071c6:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8071ca:	74 06                	je     8071d2 <async_write_disk+0x44>
  8071cc:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8071d0:	75 07                	jne    8071d9 <async_write_disk+0x4b>
        slave_disk=1;
  8071d2:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8071d9:	bf f7 00 00 00       	mov    edi,0xf7
  8071de:	e8 76 d6 ff ff       	call   804859 <inb>
  8071e3:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8071e6:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8071ea:	83 e0 01             	and    eax,0x1
  8071ed:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  8071f0:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8071f4:	74 0a                	je     807200 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8071f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8071fb:	e9 d5 00 00 00       	jmp    8072d5 <async_write_disk+0x147>
        }
        t&=0x88;
  807200:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  807204:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  807208:	74 02                	je     80720c <async_write_disk+0x7e>
    {
  80720a:	eb cd                	jmp    8071d9 <async_write_disk+0x4b>
        if(t==0x8)break;
  80720c:	90                   	nop
    }
    outb(port+2,sec_n);
  80720d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807210:	0f b6 d0             	movzx  edx,al
  807213:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807217:	83 c0 02             	add    eax,0x2
  80721a:	0f b7 c0             	movzx  eax,ax
  80721d:	89 d6                	mov    esi,edx
  80721f:	89 c7                	mov    edi,eax
  807221:	e8 1a d6 ff ff       	call   804840 <outb>
    outb(port+3,lba&0xff);
  807226:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807229:	0f b6 d0             	movzx  edx,al
  80722c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807230:	83 c0 03             	add    eax,0x3
  807233:	0f b7 c0             	movzx  eax,ax
  807236:	89 d6                	mov    esi,edx
  807238:	89 c7                	mov    edi,eax
  80723a:	e8 01 d6 ff ff       	call   804840 <outb>
    outb(port+4,(lba>>8)&0xff);
  80723f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807242:	c1 e8 08             	shr    eax,0x8
  807245:	0f b6 d0             	movzx  edx,al
  807248:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80724c:	83 c0 04             	add    eax,0x4
  80724f:	0f b7 c0             	movzx  eax,ax
  807252:	89 d6                	mov    esi,edx
  807254:	89 c7                	mov    edi,eax
  807256:	e8 e5 d5 ff ff       	call   804840 <outb>
    outb(port+5,(lba>>16)&0xff);
  80725b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80725e:	c1 e8 10             	shr    eax,0x10
  807261:	0f b6 d0             	movzx  edx,al
  807264:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807268:	83 c0 05             	add    eax,0x5
  80726b:	0f b7 c0             	movzx  eax,ax
  80726e:	89 d6                	mov    esi,edx
  807270:	89 c7                	mov    edi,eax
  807272:	e8 c9 d5 ff ff       	call   804840 <outb>
    char drv=slave_disk?0x10:0;
  807277:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  80727b:	74 07                	je     807284 <async_write_disk+0xf6>
  80727d:	b8 10 00 00 00       	mov    eax,0x10
  807282:	eb 05                	jmp    807289 <async_write_disk+0xfb>
  807284:	b8 00 00 00 00       	mov    eax,0x0
  807289:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80728c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80728f:	c1 e8 18             	shr    eax,0x18
  807292:	83 e0 0f             	and    eax,0xf
  807295:	89 c2                	mov    edx,eax
  807297:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  80729b:	09 d0                	or     eax,edx
  80729d:	83 c8 e0             	or     eax,0xffffffe0
  8072a0:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  8072a3:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  8072a7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8072ab:	83 c0 06             	add    eax,0x6
  8072ae:	0f b7 c0             	movzx  eax,ax
  8072b1:	89 d6                	mov    esi,edx
  8072b3:	89 c7                	mov    edi,eax
  8072b5:	e8 86 d5 ff ff       	call   804840 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8072ba:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8072be:	83 c0 07             	add    eax,0x7
  8072c1:	0f b7 c0             	movzx  eax,ax
  8072c4:	be 30 00 00 00       	mov    esi,0x30
  8072c9:	89 c7                	mov    edi,eax
  8072cb:	e8 70 d5 ff ff       	call   804840 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  8072d0:	b8 00 00 00 00       	mov    eax,0x0
}
  8072d5:	c9                   	leave  
  8072d6:	c3                   	ret    

00000000008072d7 <read_disk>:
int read_disk(driver_args* args)
{
  8072d7:	f3 0f 1e fa          	endbr64 
  8072db:	55                   	push   rbp
  8072dc:	48 89 e5             	mov    rbp,rsp
  8072df:	48 83 ec 20          	sub    rsp,0x20
  8072e3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8072e7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8072eb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8072ee:	48 98                	cdqe   
  8072f0:	48 89 c2             	mov    rdx,rax
  8072f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8072f7:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8072fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8072fe:	8b 00                	mov    eax,DWORD PTR [rax]
  807300:	89 ce                	mov    esi,ecx
  807302:	89 c7                	mov    edi,eax
  807304:	e8 93 05 00 00       	call   80789c <read_disk_asm>
  807309:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80730c:	48 8b 05 cd 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231cd]        # 42a4e0 <running_req>
  807313:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80731a:	48 8b 05 bf 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231bf]        # 42a4e0 <running_req>
  807321:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807325:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80732c:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80732f:	48 c7 05 a6 31 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc231a6],0x0        # 42a4e0 <running_req>
  807336:	00 00 00 00 
    return ret;
  80733a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80733d:	c9                   	leave  
  80733e:	c3                   	ret    

000000000080733f <write_disk>:
int write_disk(driver_args* args)
{
  80733f:	f3 0f 1e fa          	endbr64 
  807343:	55                   	push   rbp
  807344:	48 89 e5             	mov    rbp,rsp
  807347:	48 83 ec 20          	sub    rsp,0x20
  80734b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  80734f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807353:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807356:	48 98                	cdqe   
  807358:	48 89 c2             	mov    rdx,rax
  80735b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80735f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807362:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807366:	8b 00                	mov    eax,DWORD PTR [rax]
  807368:	89 ce                	mov    esi,ecx
  80736a:	89 c7                	mov    edi,eax
  80736c:	e8 ab 05 00 00       	call   80791c <write_disk_asm>
  807371:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  807374:	48 8b 05 65 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23165]        # 42a4e0 <running_req>
  80737b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807382:	48 8b 05 57 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23157]        # 42a4e0 <running_req>
  807389:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80738d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807394:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807397:	48 c7 05 3e 31 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2313e],0x0        # 42a4e0 <running_req>
  80739e:	00 00 00 00 
    return ret;
  8073a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8073a5:	c9                   	leave  
  8073a6:	c3                   	ret    

00000000008073a7 <chk_result>:
int chk_result(int r)
{
  8073a7:	f3 0f 1e fa          	endbr64 
  8073ab:	55                   	push   rbp
  8073ac:	48 89 e5             	mov    rbp,rsp
  8073af:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8073b2:	90                   	nop
  8073b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8073b6:	48 63 d0             	movsxd rdx,eax
  8073b9:	48 89 d0             	mov    rax,rdx
  8073bc:	48 01 c0             	add    rax,rax
  8073bf:	48 01 d0             	add    rax,rdx
  8073c2:	48 c1 e0 04          	shl    rax,0x4
  8073c6:	48 05 fc 77 42 00    	add    rax,0x4277fc
  8073cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8073ce:	83 f8 03             	cmp    eax,0x3
  8073d1:	75 e0                	jne    8073b3 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  8073d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8073d6:	48 63 d0             	movsxd rdx,eax
  8073d9:	48 89 d0             	mov    rax,rdx
  8073dc:	48 01 c0             	add    rax,rax
  8073df:	48 01 d0             	add    rax,rdx
  8073e2:	48 c1 e0 04          	shl    rax,0x4
  8073e6:	48 05 00 78 42 00    	add    rax,0x427800
  8073ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8073ee:	83 f8 01             	cmp    eax,0x1
  8073f1:	0f 94 c0             	sete   al
  8073f4:	0f b6 c0             	movzx  eax,al
}
  8073f7:	5d                   	pop    rbp
  8073f8:	c3                   	ret    

00000000008073f9 <disk_existent>:
int disk_existent(int disk)
{
  8073f9:	f3 0f 1e fa          	endbr64 
  8073fd:	55                   	push   rbp
  8073fe:	48 89 e5             	mov    rbp,rsp
  807401:	48 83 ec 10          	sub    rsp,0x10
  807405:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  807408:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80740c:	74 5f                	je     80746d <disk_existent+0x74>
  80740e:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807412:	7f 6e                	jg     807482 <disk_existent+0x89>
  807414:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  807418:	74 3e                	je     807458 <disk_existent+0x5f>
  80741a:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80741e:	7f 62                	jg     807482 <disk_existent+0x89>
  807420:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807424:	74 08                	je     80742e <disk_existent+0x35>
  807426:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  80742a:	74 17                	je     807443 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  80742c:	eb 54                	jmp    807482 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  80742e:	bf 74 31 81 00       	mov    edi,0x813174
  807433:	e8 cd b3 ff ff       	call   802805 <sys_find_dev>
  807438:	83 f8 ff             	cmp    eax,0xffffffff
  80743b:	0f 95 c0             	setne  al
  80743e:	0f b6 c0             	movzx  eax,al
  807441:	eb 45                	jmp    807488 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  807443:	bf 78 31 81 00       	mov    edi,0x813178
  807448:	e8 b8 b3 ff ff       	call   802805 <sys_find_dev>
  80744d:	83 f8 ff             	cmp    eax,0xffffffff
  807450:	0f 95 c0             	setne  al
  807453:	0f b6 c0             	movzx  eax,al
  807456:	eb 30                	jmp    807488 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  807458:	bf 7c 31 81 00       	mov    edi,0x81317c
  80745d:	e8 a3 b3 ff ff       	call   802805 <sys_find_dev>
  807462:	83 f8 ff             	cmp    eax,0xffffffff
  807465:	0f 95 c0             	setne  al
  807468:	0f b6 c0             	movzx  eax,al
  80746b:	eb 1b                	jmp    807488 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  80746d:	bf 80 31 81 00       	mov    edi,0x813180
  807472:	e8 8e b3 ff ff       	call   802805 <sys_find_dev>
  807477:	83 f8 ff             	cmp    eax,0xffffffff
  80747a:	0f 95 c0             	setne  al
  80747d:	0f b6 c0             	movzx  eax,al
  807480:	eb 06                	jmp    807488 <disk_existent+0x8f>
        break;
  807482:	90                   	nop
    }
    return 0;
  807483:	b8 00 00 00 00       	mov    eax,0x0
}
  807488:	c9                   	leave  
  807489:	c3                   	ret    

000000000080748a <hd_iterate>:
int hd_iterate()
{
  80748a:	f3 0f 1e fa          	endbr64 
  80748e:	55                   	push   rbp
  80748f:	48 89 e5             	mov    rbp,rsp
  807492:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  807499:	41 b8 00 00 00 00    	mov    r8d,0x0
  80749f:	b9 01 00 00 00       	mov    ecx,0x1
  8074a4:	ba 00 00 00 00       	mov    edx,0x0
  8074a9:	be 02 00 00 00       	mov    esi,0x2
  8074ae:	bf 00 00 00 00       	mov    edi,0x0
  8074b3:	e8 3b f8 ff ff       	call   806cf3 <request>
  8074b8:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8074bb:	41 b8 00 00 00 00    	mov    r8d,0x0
  8074c1:	b9 01 00 00 00       	mov    ecx,0x1
  8074c6:	ba 00 00 00 00       	mov    edx,0x0
  8074cb:	be 02 00 00 00       	mov    esi,0x2
  8074d0:	bf 01 00 00 00       	mov    edi,0x1
  8074d5:	e8 19 f8 ff ff       	call   806cf3 <request>
  8074da:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  8074dd:	41 b8 00 00 00 00    	mov    r8d,0x0
  8074e3:	b9 01 00 00 00       	mov    ecx,0x1
  8074e8:	ba 00 00 00 00       	mov    edx,0x0
  8074ed:	be 02 00 00 00       	mov    esi,0x2
  8074f2:	bf 02 00 00 00       	mov    edi,0x2
  8074f7:	e8 f7 f7 ff ff       	call   806cf3 <request>
  8074fc:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8074ff:	41 b8 00 00 00 00    	mov    r8d,0x0
  807505:	b9 01 00 00 00       	mov    ecx,0x1
  80750a:	ba 00 00 00 00       	mov    edx,0x0
  80750f:	be 02 00 00 00       	mov    esi,0x2
  807514:	bf 03 00 00 00       	mov    edi,0x3
  807519:	e8 d5 f7 ff ff       	call   806cf3 <request>
  80751e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  807521:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807528:	e9 72 01 00 00       	jmp    80769f <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  80752d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807531:	74 3b                	je     80756e <hd_iterate+0xe4>
  807533:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807537:	7f 3e                	jg     807577 <hd_iterate+0xed>
  807539:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80753d:	74 26                	je     807565 <hd_iterate+0xdb>
  80753f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807543:	7f 32                	jg     807577 <hd_iterate+0xed>
  807545:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807549:	74 08                	je     807553 <hd_iterate+0xc9>
  80754b:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80754f:	74 0b                	je     80755c <hd_iterate+0xd2>
  807551:	eb 24                	jmp    807577 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  807553:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80755a:	eb 25                	jmp    807581 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  80755c:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  807563:	eb 1c                	jmp    807581 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  807565:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  80756c:	eb 13                	jmp    807581 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  80756e:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  807575:	eb 0a                	jmp    807581 <hd_iterate+0xf7>
        default:
            return -1;
  807577:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80757c:	e9 28 01 00 00       	jmp    8076a9 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  807581:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807584:	48 98                	cdqe   
  807586:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80758a:	89 c7                	mov    edi,eax
  80758c:	e8 16 fe ff ff       	call   8073a7 <chk_result>
  807591:	85 c0                	test   eax,eax
  807593:	0f 84 81 00 00 00    	je     80761a <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  807599:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80759c:	89 c6                	mov    esi,eax
  80759e:	bf 84 31 81 00       	mov    edi,0x813184
  8075a3:	b8 00 00 00 00       	mov    eax,0x0
  8075a8:	e8 55 97 ff ff       	call   800d02 <printf>
            //新硬盘
            device hd={
  8075ad:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  8075b4:	b8 00 00 00 00       	mov    eax,0x0
  8075b9:	b9 15 00 00 00       	mov    ecx,0x15
  8075be:	48 89 d7             	mov    rdi,rdx
  8075c1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8075c4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8075c7:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  8075cd:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  8075d4:	00 00 00 
  8075d7:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  8075de:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  8075e1:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8075e5:	7f 07                	jg     8075ee <hd_iterate+0x164>
  8075e7:	b8 f0 01 00 00       	mov    eax,0x1f0
  8075ec:	eb 05                	jmp    8075f3 <hd_iterate+0x169>
  8075ee:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  8075f3:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  8075f9:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  807600:	48 89 c7             	mov    rdi,rax
  807603:	e8 c5 ad ff ff       	call   8023cd <reg_device>
  807608:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80760b:	48 63 d2             	movsxd rdx,edx
  80760e:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  807615:	e9 81 00 00 00       	jmp    80769b <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80761a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80761d:	48 98                	cdqe   
  80761f:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807623:	89 c7                	mov    edi,eax
  807625:	e8 7d fd ff ff       	call   8073a7 <chk_result>
  80762a:	85 c0                	test   eax,eax
  80762c:	75 6d                	jne    80769b <hd_iterate+0x211>
        {
            switch (i)
  80762e:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807632:	74 3e                	je     807672 <hd_iterate+0x1e8>
  807634:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807638:	7f 41                	jg     80767b <hd_iterate+0x1f1>
  80763a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80763e:	74 28                	je     807668 <hd_iterate+0x1de>
  807640:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807644:	7f 35                	jg     80767b <hd_iterate+0x1f1>
  807646:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80764a:	74 08                	je     807654 <hd_iterate+0x1ca>
  80764c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807650:	74 0c                	je     80765e <hd_iterate+0x1d4>
  807652:	eb 27                	jmp    80767b <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  807654:	48 c7 45 f8 74 31 81 	mov    QWORD PTR [rbp-0x8],0x813174
  80765b:	00 
  80765c:	eb 1d                	jmp    80767b <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80765e:	48 c7 45 f8 78 31 81 	mov    QWORD PTR [rbp-0x8],0x813178
  807665:	00 
  807666:	eb 13                	jmp    80767b <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  807668:	48 c7 45 f8 7c 31 81 	mov    QWORD PTR [rbp-0x8],0x81317c
  80766f:	00 
  807670:	eb 09                	jmp    80767b <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  807672:	48 c7 45 f8 80 31 81 	mov    QWORD PTR [rbp-0x8],0x813180
  807679:	00 
  80767a:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80767b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80767f:	48 89 c7             	mov    rdi,rax
  807682:	e8 7e b1 ff ff       	call   802805 <sys_find_dev>
  807687:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80768a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80768d:	89 c7                	mov    edi,eax
  80768f:	e8 45 b8 ff ff       	call   802ed9 <get_dev>
  807694:	89 c7                	mov    edi,eax
  807696:	e8 91 b7 ff ff       	call   802e2c <dispose_device>
    for(int i=0;i<1;i++)
  80769b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80769f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8076a3:	0f 8e 84 fe ff ff    	jle    80752d <hd_iterate+0xa3>
        }

    }
}
  8076a9:	c9                   	leave  
  8076aa:	c3                   	ret    

00000000008076ab <async_check_disk>:

int async_check_disk(int disk)
{
  8076ab:	f3 0f 1e fa          	endbr64 
  8076af:	55                   	push   rbp
  8076b0:	48 89 e5             	mov    rbp,rsp
  8076b3:	48 83 ec 20          	sub    rsp,0x20
  8076b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8076ba:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8076c0:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8076c6:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8076ca:	74 06                	je     8076d2 <async_check_disk+0x27>
  8076cc:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8076d0:	75 06                	jne    8076d8 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  8076d2:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  8076d8:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8076dc:	74 06                	je     8076e4 <async_check_disk+0x39>
  8076de:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8076e2:	75 06                	jne    8076ea <async_check_disk+0x3f>
        chkcmd=0xf0;
  8076e4:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  8076ea:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8076ee:	83 c0 02             	add    eax,0x2
  8076f1:	0f b7 c0             	movzx  eax,ax
  8076f4:	be 01 00 00 00       	mov    esi,0x1
  8076f9:	89 c7                	mov    edi,eax
  8076fb:	e8 40 d1 ff ff       	call   804840 <outb>
    outb(disknr+3,0);
  807700:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807704:	83 c0 03             	add    eax,0x3
  807707:	0f b7 c0             	movzx  eax,ax
  80770a:	be 00 00 00 00       	mov    esi,0x0
  80770f:	89 c7                	mov    edi,eax
  807711:	e8 2a d1 ff ff       	call   804840 <outb>
    outb(disknr+4,0);
  807716:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80771a:	83 c0 04             	add    eax,0x4
  80771d:	0f b7 c0             	movzx  eax,ax
  807720:	be 00 00 00 00       	mov    esi,0x0
  807725:	89 c7                	mov    edi,eax
  807727:	e8 14 d1 ff ff       	call   804840 <outb>
    outb(disknr+5,0);
  80772c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807730:	83 c0 05             	add    eax,0x5
  807733:	0f b7 c0             	movzx  eax,ax
  807736:	be 00 00 00 00       	mov    esi,0x0
  80773b:	89 c7                	mov    edi,eax
  80773d:	e8 fe d0 ff ff       	call   804840 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  807742:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  807746:	0f b6 d0             	movzx  edx,al
  807749:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80774d:	83 c0 06             	add    eax,0x6
  807750:	0f b7 c0             	movzx  eax,ax
  807753:	89 d6                	mov    esi,edx
  807755:	89 c7                	mov    edi,eax
  807757:	e8 e4 d0 ff ff       	call   804840 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80775c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807760:	83 c0 07             	add    eax,0x7
  807763:	0f b7 c0             	movzx  eax,ax
  807766:	be 90 00 00 00       	mov    esi,0x90
  80776b:	89 c7                	mov    edi,eax
  80776d:	e8 ce d0 ff ff       	call   804840 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  807772:	b8 00 00 00 00       	mov    eax,0x0
}
  807777:	c9                   	leave  
  807778:	c3                   	ret    

0000000000807779 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  807779:	f3 0f 1e fa          	endbr64 
  80777d:	55                   	push   rbp
  80777e:	48 89 e5             	mov    rbp,rsp
  807781:	48 83 ec 18          	sub    rsp,0x18
  807785:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  807789:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  807790:	eb 04                	jmp    807796 <hd_do_req+0x1d>
  807792:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807796:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807799:	48 98                	cdqe   
  80779b:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  8077a2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8077a6:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8077ac:	39 c2                	cmp    edx,eax
  8077ae:	75 e2                	jne    807792 <hd_do_req+0x19>
    switch (args->cmd)
  8077b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8077b4:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8077ba:	83 f8 04             	cmp    eax,0x4
  8077bd:	74 72                	je     807831 <hd_do_req+0xb8>
  8077bf:	83 f8 04             	cmp    eax,0x4
  8077c2:	0f 8f 96 00 00 00    	jg     80785e <hd_do_req+0xe5>
  8077c8:	83 f8 02             	cmp    eax,0x2
  8077cb:	74 0a                	je     8077d7 <hd_do_req+0x5e>
  8077cd:	83 f8 03             	cmp    eax,0x3
  8077d0:	74 32                	je     807804 <hd_do_req+0x8b>
  8077d2:	e9 87 00 00 00       	jmp    80785e <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  8077d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8077db:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8077de:	48 98                	cdqe   
  8077e0:	48 89 c6             	mov    rsi,rax
  8077e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8077e7:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8077ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8077ee:	8b 10                	mov    edx,DWORD PTR [rax]
  8077f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077f3:	49 89 f0             	mov    r8,rsi
  8077f6:	be 00 00 00 00       	mov    esi,0x0
  8077fb:	89 c7                	mov    edi,eax
  8077fd:	e8 f1 f4 ff ff       	call   806cf3 <request>
        break;
  807802:	eb 61                	jmp    807865 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  807804:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807808:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80780b:	48 98                	cdqe   
  80780d:	48 89 c6             	mov    rsi,rax
  807810:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807814:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807817:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80781b:	8b 10                	mov    edx,DWORD PTR [rax]
  80781d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807820:	49 89 f0             	mov    r8,rsi
  807823:	be 01 00 00 00       	mov    esi,0x1
  807828:	89 c7                	mov    edi,eax
  80782a:	e8 c4 f4 ff ff       	call   806cf3 <request>
        break;
  80782f:	eb 34                	jmp    807865 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807831:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807835:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807838:	48 98                	cdqe   
  80783a:	48 89 c6             	mov    rsi,rax
  80783d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807841:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807844:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807848:	8b 10                	mov    edx,DWORD PTR [rax]
  80784a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80784d:	49 89 f0             	mov    r8,rsi
  807850:	be 02 00 00 00       	mov    esi,0x2
  807855:	89 c7                	mov    edi,eax
  807857:	e8 97 f4 ff ff       	call   806cf3 <request>
        break;
  80785c:	eb 07                	jmp    807865 <hd_do_req+0xec>
    default:return -1;
  80785e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807863:	eb 1e                	jmp    807883 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  807865:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807869:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  807870:	00 00 00 
    running_devman_req=args;
  807873:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807877:	48 89 05 6a 2c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22c6a],rax        # 42a4e8 <running_devman_req>
    return 0;
  80787e:	b8 00 00 00 00       	mov    eax,0x0
  807883:	c9                   	leave  
  807884:	c3                   	ret    
  807885:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80788c:	00 00 00 
  80788f:	90                   	nop

0000000000807890 <disk_int_handler>:
  807890:	e8 d9 cf ff ff       	call   80486e <eoi>
  807895:	e8 6a f2 ff ff       	call   806b04 <disk_int_handler_c>
  80789a:	48 cf                	iretq  

000000000080789c <read_disk_asm>:
  80789c:	55                   	push   rbp
  80789d:	89 e5                	mov    ebp,esp
  80789f:	66 ba f7 01          	mov    dx,0x1f7
  8078a3:	31 c9                	xor    ecx,ecx
  8078a5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8078aa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8078af:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8078b4:	89 c6                	mov    esi,eax
  8078b6:	66 ba f2 01          	mov    dx,0x1f2
  8078ba:	88 c8                	mov    al,cl
  8078bc:	ee                   	out    dx,al
  8078bd:	66 ba f3 01          	mov    dx,0x1f3
  8078c1:	89 f0                	mov    eax,esi
  8078c3:	ee                   	out    dx,al
  8078c4:	66 ff c2             	inc    dx
  8078c7:	c1 e8 08             	shr    eax,0x8
  8078ca:	ee                   	out    dx,al
  8078cb:	66 ff c2             	inc    dx
  8078ce:	c1 e8 08             	shr    eax,0x8
  8078d1:	ee                   	out    dx,al
  8078d2:	66 ff c2             	inc    dx
  8078d5:	66 c1 e8 08          	shr    ax,0x8
  8078d9:	24 0f                	and    al,0xf
  8078db:	0c e0                	or     al,0xe0
  8078dd:	ee                   	out    dx,al
  8078de:	66 ff c2             	inc    dx
  8078e1:	b0 20                	mov    al,0x20
  8078e3:	ee                   	out    dx,al

00000000008078e4 <read_disk_asm.wait>:
  8078e4:	90                   	nop
  8078e5:	ec                   	in     al,dx
  8078e6:	24 88                	and    al,0x88
  8078e8:	3c 08                	cmp    al,0x8
  8078ea:	75 f8                	jne    8078e4 <read_disk_asm.wait>
  8078ec:	66 89 d7             	mov    di,dx
  8078ef:	89 c8                	mov    eax,ecx
  8078f1:	66 b9 00 01          	mov    cx,0x100
  8078f5:	66 f7 e1             	mul    cx
  8078f8:	89 c1                	mov    ecx,eax
  8078fa:	66 ba f0 01          	mov    dx,0x1f0

00000000008078fe <read_disk_asm.read>:
  8078fe:	66 ed                	in     ax,dx
  807900:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807904:	83 c3 02             	add    ebx,0x2
  807907:	e2 f5                	loop   8078fe <read_disk_asm.read>
  807909:	c9                   	leave  
  80790a:	b8 00 00 00 00       	mov    eax,0x0
  80790f:	c3                   	ret    

0000000000807910 <read_disk_asm.err_disk_reading>:
  807910:	66 ba f1 01          	mov    dx,0x1f1
  807914:	31 c0                	xor    eax,eax
  807916:	66 ed                	in     ax,dx
  807918:	89 ec                	mov    esp,ebp
  80791a:	5d                   	pop    rbp
  80791b:	c3                   	ret    

000000000080791c <write_disk_asm>:
  80791c:	55                   	push   rbp
  80791d:	89 e5                	mov    ebp,esp
  80791f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807924:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807929:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80792e:	50                   	push   rax
  80792f:	66 ba f2 01          	mov    dx,0x1f2
  807933:	88 c8                	mov    al,cl
  807935:	ee                   	out    dx,al
  807936:	58                   	pop    rax
  807937:	66 ba f3 01          	mov    dx,0x1f3
  80793b:	ee                   	out    dx,al
  80793c:	c1 e8 08             	shr    eax,0x8
  80793f:	66 ba f4 01          	mov    dx,0x1f4
  807943:	ee                   	out    dx,al
  807944:	c1 e8 08             	shr    eax,0x8
  807947:	66 ba f5 01          	mov    dx,0x1f5
  80794b:	ee                   	out    dx,al
  80794c:	c1 e8 08             	shr    eax,0x8
  80794f:	24 0f                	and    al,0xf
  807951:	0c e0                	or     al,0xe0
  807953:	66 ba f6 01          	mov    dx,0x1f6
  807957:	ee                   	out    dx,al
  807958:	66 ba f7 01          	mov    dx,0x1f7
  80795c:	b0 30                	mov    al,0x30
  80795e:	ee                   	out    dx,al

000000000080795f <write_disk_asm.not_ready2>:
  80795f:	90                   	nop
  807960:	ec                   	in     al,dx
  807961:	24 88                	and    al,0x88
  807963:	3c 08                	cmp    al,0x8
  807965:	75 f8                	jne    80795f <write_disk_asm.not_ready2>
  807967:	89 c8                	mov    eax,ecx
  807969:	66 b9 00 01          	mov    cx,0x100
  80796d:	66 f7 e1             	mul    cx
  807970:	89 c1                	mov    ecx,eax
  807972:	66 ba f0 01          	mov    dx,0x1f0

0000000000807976 <write_disk_asm.go_on_write>:
  807976:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80797a:	66 ef                	out    dx,ax
  80797c:	83 c3 02             	add    ebx,0x2
  80797f:	e2 f5                	loop   807976 <write_disk_asm.go_on_write>
  807981:	89 ec                	mov    esp,ebp
  807983:	5d                   	pop    rbp
  807984:	c3                   	ret    

0000000000807985 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  807985:	f3 0f 1e fa          	endbr64 
  807989:	55                   	push   rbp
  80798a:	48 89 e5             	mov    rbp,rsp
  80798d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  807994:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80799b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  8079a1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8079a8:	ba 00 02 00 00       	mov    edx,0x200
  8079ad:	be 00 00 00 00       	mov    esi,0x0
  8079b2:	48 89 c7             	mov    rdi,rax
  8079b5:	e8 66 2e 00 00       	call   80a820 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8079ba:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8079c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8079c5:	89 c2                	mov    edx,eax
  8079c7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8079cd:	c1 e8 07             	shr    eax,0x7
  8079d0:	01 d0                	add    eax,edx
  8079d2:	89 c2                	mov    edx,eax
  8079d4:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8079db:	49 89 c0             	mov    r8,rax
  8079de:	b9 01 00 00 00       	mov    ecx,0x1
  8079e3:	be 00 00 00 00       	mov    esi,0x0
  8079e8:	bf 00 00 00 00       	mov    edi,0x0
  8079ed:	e8 01 f3 ff ff       	call   806cf3 <request>
  8079f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  8079f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8079f8:	89 c7                	mov    edi,eax
  8079fa:	e8 a8 f9 ff ff       	call   8073a7 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  8079ff:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807a05:	83 e0 7f             	and    eax,0x7f
  807a08:	89 c0                	mov    eax,eax
  807a0a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  807a11:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807a17:	89 c6                	mov    esi,eax
  807a19:	bf 98 31 81 00       	mov    edi,0x813198
  807a1e:	b8 00 00 00 00       	mov    eax,0x0
  807a23:	e8 da 92 ff ff       	call   800d02 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  807a28:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807a2e:	83 e0 7f             	and    eax,0x7f
  807a31:	89 c0                	mov    eax,eax
  807a33:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807a3a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  807a3f:	c9                   	leave  
  807a40:	c3                   	ret    

0000000000807a41 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  807a41:	f3 0f 1e fa          	endbr64 
  807a45:	55                   	push   rbp
  807a46:	48 89 e5             	mov    rbp,rsp
  807a49:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  807a50:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  807a57:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  807a5d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  807a63:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807a6a:	ba 00 02 00 00       	mov    edx,0x200
  807a6f:	be 00 00 00 00       	mov    esi,0x0
  807a74:	48 89 c7             	mov    rdi,rax
  807a77:	e8 a4 2d 00 00       	call   80a820 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  807a7c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807a83:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a87:	89 c2                	mov    edx,eax
  807a89:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807a8f:	c1 e8 07             	shr    eax,0x7
  807a92:	01 d0                	add    eax,edx
  807a94:	89 c2                	mov    edx,eax
  807a96:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807a9d:	49 89 c0             	mov    r8,rax
  807aa0:	b9 01 00 00 00       	mov    ecx,0x1
  807aa5:	be 00 00 00 00       	mov    esi,0x0
  807aaa:	bf 00 00 00 00       	mov    edi,0x0
  807aaf:	e8 3f f2 ff ff       	call   806cf3 <request>
  807ab4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  807ab7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807aba:	89 c7                	mov    edi,eax
  807abc:	e8 e6 f8 ff ff       	call   8073a7 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  807ac1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807ac7:	83 e0 7f             	and    eax,0x7f
  807aca:	89 c0                	mov    eax,eax
  807acc:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807ad3:	25 00 00 00 f0       	and    eax,0xf0000000
  807ad8:	89 c6                	mov    esi,eax
  807ada:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  807ae0:	25 ff ff ff 0f       	and    eax,0xfffffff
  807ae5:	89 c1                	mov    ecx,eax
  807ae7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807aed:	83 e0 7f             	and    eax,0x7f
  807af0:	89 c2                	mov    edx,eax
  807af2:	89 f0                	mov    eax,esi
  807af4:	09 c8                	or     eax,ecx
  807af6:	89 d2                	mov    edx,edx
  807af8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  807aff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807b06:	eb 61                	jmp    807b69 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  807b08:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807b0f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b13:	89 c1                	mov    ecx,eax
  807b15:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807b1c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807b20:	89 c2                	mov    edx,eax
  807b22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b25:	48 98                	cdqe   
  807b27:	0f af c2             	imul   eax,edx
  807b2a:	8d 14 01             	lea    edx,[rcx+rax*1]
  807b2d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807b33:	c1 e8 07             	shr    eax,0x7
  807b36:	01 d0                	add    eax,edx
  807b38:	89 c2                	mov    edx,eax
  807b3a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807b41:	49 89 c0             	mov    r8,rax
  807b44:	b9 01 00 00 00       	mov    ecx,0x1
  807b49:	be 01 00 00 00       	mov    esi,0x1
  807b4e:	bf 00 00 00 00       	mov    edi,0x0
  807b53:	e8 9b f1 ff ff       	call   806cf3 <request>
  807b58:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  807b5b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807b5e:	89 c7                	mov    edi,eax
  807b60:	e8 42 f8 ff ff       	call   8073a7 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  807b65:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807b69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b6c:	48 63 d0             	movsxd rdx,eax
  807b6f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807b76:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807b7a:	48 39 c2             	cmp    rdx,rax
  807b7d:	72 89                	jb     807b08 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  807b7f:	b8 01 00 00 00       	mov    eax,0x1
}
  807b84:	c9                   	leave  
  807b85:	c3                   	ret    

0000000000807b86 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  807b86:	f3 0f 1e fa          	endbr64 
  807b8a:	55                   	push   rbp
  807b8b:	48 89 e5             	mov    rbp,rsp
  807b8e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807b92:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  807b96:	b8 01 00 00 00       	mov    eax,0x1
}
  807b9b:	5d                   	pop    rbp
  807b9c:	c3                   	ret    

0000000000807b9d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  807b9d:	f3 0f 1e fa          	endbr64 
  807ba1:	55                   	push   rbp
  807ba2:	48 89 e5             	mov    rbp,rsp
  807ba5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807ba9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  807bad:	b8 01 00 00 00       	mov    eax,0x1
}
  807bb2:	5d                   	pop    rbp
  807bb3:	c3                   	ret    

0000000000807bb4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  807bb4:	f3 0f 1e fa          	endbr64 
  807bb8:	55                   	push   rbp
  807bb9:	48 89 e5             	mov    rbp,rsp
  807bbc:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  807bc0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807bc4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  807bc8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  807bcc:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807bd0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807bd4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807bd8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bdc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807be0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807be4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807be8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807bec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bf0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807bf4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807bf8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  807bfc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807c00:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c03:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  807c07:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  807c0e:	00 
	int i,length = 0;
  807c0f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  807c16:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807c1d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807c1e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807c22:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c25:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807c29:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807c2d:	48 99                	cqo    
  807c2f:	48 f7 fe             	idiv   rsi
  807c32:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807c35:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807c39:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c3c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807c40:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807c44:	48 99                	cqo    
  807c46:	48 f7 f9             	idiv   rcx
  807c49:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807c4d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c51:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807c55:	be 00 00 00 00       	mov    esi,0x0
  807c5a:	48 89 c7             	mov    rdi,rax
  807c5d:	b8 00 00 00 00       	mov    eax,0x0
  807c62:	e8 b3 94 ff ff       	call   80111a <vmalloc>
  807c67:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  807c6b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807c70:	75 0c                	jne    807c7e <FAT32_read+0xca>
		return -EFAULT;
  807c72:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807c79:	e9 f0 01 00 00       	jmp    807e6e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  807c7e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807c85:	eb 1e                	jmp    807ca5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807c87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c8b:	89 c2                	mov    edx,eax
  807c8d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c91:	89 d6                	mov    esi,edx
  807c93:	48 89 c7             	mov    rdi,rax
  807c96:	e8 ea fc ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  807c9b:	89 c0                	mov    eax,eax
  807c9d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  807ca1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807ca5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807ca8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  807cab:	7c da                	jl     807c87 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  807cad:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807cb1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cb4:	48 89 c2             	mov    rdx,rax
  807cb7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807cbb:	48 01 c2             	add    rdx,rax
  807cbe:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807cc2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cc6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ccd:	48 39 c2             	cmp    rdx,rax
  807cd0:	76 2c                	jbe    807cfe <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  807cd2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807cd6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cda:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cde:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807ce1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ce5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ce8:	48 89 c1             	mov    rcx,rax
  807ceb:	48 89 d0             	mov    rax,rdx
  807cee:	48 29 c8             	sub    rax,rcx
  807cf1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  807cf5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807cf9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  807cfc:	eb 07                	jmp    807d05 <FAT32_read+0x151>
	else
		index = count;
  807cfe:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807d02:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  807d05:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d09:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d0d:	89 c2                	mov    edx,eax
  807d0f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807d13:	be 00 00 00 00       	mov    esi,0x0
  807d18:	48 89 c7             	mov    rdi,rax
  807d1b:	e8 00 2b 00 00       	call   80a820 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807d20:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d24:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807d28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d2c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807d30:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d34:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d38:	48 0f af c2          	imul   rax,rdx
  807d3c:	48 01 c8             	add    rax,rcx
  807d3f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807d43:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d47:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d4b:	89 c1                	mov    ecx,eax
  807d4d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807d51:	89 c2                	mov    edx,eax
  807d53:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807d57:	49 89 c0             	mov    r8,rax
  807d5a:	be 00 00 00 00       	mov    esi,0x0
  807d5f:	bf 00 00 00 00       	mov    edi,0x0
  807d64:	e8 8a ef ff ff       	call   806cf3 <request>
  807d69:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  807d6c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807d6f:	89 c7                	mov    edi,eax
  807d71:	e8 31 f6 ff ff       	call   8073a7 <chk_result>
  807d76:	85 c0                	test   eax,eax
  807d78:	75 1c                	jne    807d96 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  807d7a:	bf c8 31 81 00       	mov    edi,0x8131c8
  807d7f:	b8 00 00 00 00       	mov    eax,0x0
  807d84:	e8 79 8f ff ff       	call   800d02 <printf>
			retval = -EIO;
  807d89:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  807d90:	ff 
			break;
  807d91:	e9 ba 00 00 00       	jmp    807e50 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807d96:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807d99:	48 63 d0             	movsxd rdx,eax
  807d9c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807da0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807da4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  807da8:	48 39 c2             	cmp    rdx,rax
  807dab:	48 0f 4e c2          	cmovle rax,rdx
  807daf:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  807db2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807db6:	48 83 f8 1f          	cmp    rax,0x1f
  807dba:	77 1f                	ja     807ddb <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  807dbc:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807dbf:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807dc3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807dc7:	48 01 c1             	add    rcx,rax
  807dca:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807dce:	48 89 c6             	mov    rsi,rax
  807dd1:	48 89 cf             	mov    rdi,rcx
  807dd4:	e8 98 29 00 00       	call   80a771 <memcpy>
  807dd9:	eb 1d                	jmp    807df8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  807ddb:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807dde:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807de2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807de6:	48 01 c1             	add    rcx,rax
  807de9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807ded:	48 89 c6             	mov    rsi,rax
  807df0:	48 89 cf             	mov    rdi,rcx
  807df3:	e8 79 29 00 00       	call   80a771 <memcpy>

		index -= length;
  807df8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807dfb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  807dfe:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807e01:	48 98                	cdqe   
  807e03:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  807e07:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807e0e:	00 
		*position += length;
  807e0f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807e13:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807e16:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807e19:	48 98                	cdqe   
  807e1b:	48 01 c2             	add    rdx,rax
  807e1e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807e22:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  807e25:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807e29:	74 25                	je     807e50 <FAT32_read+0x29c>
  807e2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e2f:	89 c2                	mov    edx,eax
  807e31:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807e35:	89 d6                	mov    esi,edx
  807e37:	48 89 c7             	mov    rdi,rax
  807e3a:	e8 46 fb ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  807e3f:	89 c0                	mov    eax,eax
  807e41:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807e45:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807e4a:	0f 85 b5 fe ff ff    	jne    807d05 <FAT32_read+0x151>

	vmfree(buffer);
  807e50:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807e54:	48 89 c7             	mov    rdi,rax
  807e57:	e8 4d 93 ff ff       	call   8011a9 <vmfree>
	if(!index)
  807e5c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807e60:	75 08                	jne    807e6a <FAT32_read+0x2b6>
		retval = count;
  807e62:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807e66:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  807e6a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  807e6e:	c9                   	leave  
  807e6f:	c3                   	ret    

0000000000807e70 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  807e70:	f3 0f 1e fa          	endbr64 
  807e74:	55                   	push   rbp
  807e75:	48 89 e5             	mov    rbp,rsp
  807e78:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  807e7f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  807e86:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807e8d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807e91:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  807e95:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807e9c:	e9 8b 00 00 00       	jmp    807f2c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  807ea1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807ea8:	ba 00 02 00 00       	mov    edx,0x200
  807ead:	be 00 00 00 00       	mov    esi,0x0
  807eb2:	48 89 c7             	mov    rdi,rax
  807eb5:	e8 66 29 00 00       	call   80a820 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  807eba:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807ec1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ec5:	89 c2                	mov    edx,eax
  807ec7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807eca:	01 d0                	add    eax,edx
  807ecc:	89 c2                	mov    edx,eax
  807ece:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807ed5:	49 89 c0             	mov    r8,rax
  807ed8:	b9 01 00 00 00       	mov    ecx,0x1
  807edd:	be 00 00 00 00       	mov    esi,0x0
  807ee2:	bf 00 00 00 00       	mov    edi,0x0
  807ee7:	e8 07 ee ff ff       	call   806cf3 <request>
  807eec:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  807eef:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807ef6:	eb 2a                	jmp    807f22 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  807ef8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807efb:	48 98                	cdqe   
  807efd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  807f04:	25 ff ff ff 0f       	and    eax,0xfffffff
  807f09:	85 c0                	test   eax,eax
  807f0b:	75 11                	jne    807f1e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  807f0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807f10:	c1 e0 07             	shl    eax,0x7
  807f13:	89 c2                	mov    edx,eax
  807f15:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807f18:	01 d0                	add    eax,edx
  807f1a:	48 98                	cdqe   
  807f1c:	eb 22                	jmp    807f40 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  807f1e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807f22:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  807f26:	7e d0                	jle    807ef8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  807f28:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807f2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807f2f:	48 98                	cdqe   
  807f31:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  807f35:	0f 87 66 ff ff ff    	ja     807ea1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  807f3b:	b8 00 00 00 00       	mov    eax,0x0
}
  807f40:	c9                   	leave  
  807f41:	c3                   	ret    

0000000000807f42 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  807f42:	f3 0f 1e fa          	endbr64 
  807f46:	55                   	push   rbp
  807f47:	48 89 e5             	mov    rbp,rsp
  807f4a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  807f51:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  807f55:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  807f59:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807f60:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807f67:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807f6b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f6f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807f73:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807f77:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807f7b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807f7f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f83:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807f87:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f8b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f8f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  807f93:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f97:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f9a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  807f9e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  807fa5:	00 
	unsigned long sector = 0;
  807fa6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807fad:	00 
	int i,length = 0;
  807fae:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  807fb5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807fbc:	00 
	long flags = 0;
  807fbd:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807fc4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807fc5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fcc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807fcf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807fd3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807fd7:	48 99                	cqo    
  807fd9:	48 f7 fe             	idiv   rsi
  807fdc:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807fdf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fe6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807fe9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807fed:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807ff1:	48 99                	cqo    
  807ff3:	48 f7 f9             	idiv   rcx
  807ff6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807ffa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807ffe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808002:	be 00 00 00 00       	mov    esi,0x0
  808007:	48 89 c7             	mov    rdi,rax
  80800a:	b8 00 00 00 00       	mov    eax,0x0
  80800f:	e8 06 91 ff ff       	call   80111a <vmalloc>
  808014:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  808018:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80801d:	75 1a                	jne    808039 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80801f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808023:	48 89 c7             	mov    rdi,rax
  808026:	e8 45 fe ff ff       	call   807e70 <FAT32_find_available_cluster>
  80802b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80802f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808036:	00 
  808037:	eb 2f                	jmp    808068 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  808039:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808040:	eb 1e                	jmp    808060 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808046:	89 c2                	mov    edx,eax
  808048:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80804c:	89 d6                	mov    esi,edx
  80804e:	48 89 c7             	mov    rdi,rax
  808051:	e8 2f f9 ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  808056:	89 c0                	mov    eax,eax
  808058:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80805c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808060:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808063:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  808066:	7c da                	jl     808042 <FAT32_write+0x100>

	if(!cluster)
  808068:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80806d:	75 18                	jne    808087 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80806f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808073:	48 89 c7             	mov    rdi,rax
  808076:	e8 2e 91 ff ff       	call   8011a9 <vmfree>
		return -ENOSPC;
  80807b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808082:	e9 13 03 00 00       	jmp    80839a <FAT32_write+0x458>
	}

	if(flags)
  808087:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80808c:	74 4d                	je     8080db <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80808e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808092:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808096:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808099:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80809d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080a1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080a5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080a9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8080ad:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8080b1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080b5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080b9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080bd:	48 89 c7             	mov    rdi,rax
  8080c0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  8080c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080c6:	89 c1                	mov    ecx,eax
  8080c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8080cc:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  8080d1:	89 ce                	mov    esi,ecx
  8080d3:	48 89 c7             	mov    rdi,rax
  8080d6:	e8 66 f9 ff ff       	call   807a41 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  8080db:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8080e2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  8080e5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8080ea:	0f 85 91 00 00 00    	jne    808181 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  8080f0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8080f4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080f8:	89 c2                	mov    edx,eax
  8080fa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8080fe:	be 00 00 00 00       	mov    esi,0x0
  808103:	48 89 c7             	mov    rdi,rax
  808106:	e8 15 27 00 00       	call   80a820 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80810b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80810f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  808113:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808117:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80811b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80811f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808123:	48 0f af c2          	imul   rax,rdx
  808127:	48 01 c8             	add    rax,rcx
  80812a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80812e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808132:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808136:	89 c1                	mov    ecx,eax
  808138:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80813c:	89 c2                	mov    edx,eax
  80813e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808142:	49 89 c0             	mov    r8,rax
  808145:	be 00 00 00 00       	mov    esi,0x0
  80814a:	bf 00 00 00 00       	mov    edi,0x0
  80814f:	e8 9f eb ff ff       	call   806cf3 <request>
  808154:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  808157:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80815a:	89 c7                	mov    edi,eax
  80815c:	e8 46 f2 ff ff       	call   8073a7 <chk_result>
  808161:	85 c0                	test   eax,eax
  808163:	75 1c                	jne    808181 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  808165:	bf f8 31 81 00       	mov    edi,0x8131f8
  80816a:	b8 00 00 00 00       	mov    eax,0x0
  80816f:	e8 8e 8b ff ff       	call   800d02 <printf>
				retval = -EIO;
  808174:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80817b:	ff 
				break;
  80817c:	e9 95 01 00 00       	jmp    808316 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808181:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  808184:	48 63 d0             	movsxd rdx,eax
  808187:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80818b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80818f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  808193:	48 39 c2             	cmp    rdx,rax
  808196:	48 0f 4e c2          	cmovle rax,rdx
  80819a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80819d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8081a1:	48 83 f8 1f          	cmp    rax,0x1f
  8081a5:	77 1f                	ja     8081c6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  8081a7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8081aa:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  8081ae:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8081b2:	48 01 c1             	add    rcx,rax
  8081b5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8081b9:	48 89 ce             	mov    rsi,rcx
  8081bc:	48 89 c7             	mov    rdi,rax
  8081bf:	e8 ad 25 00 00       	call   80a771 <memcpy>
  8081c4:	eb 1d                	jmp    8081e3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  8081c6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8081c9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  8081cd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8081d1:	48 01 c1             	add    rcx,rax
  8081d4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8081d8:	48 89 ce             	mov    rsi,rcx
  8081db:	48 89 c7             	mov    rdi,rax
  8081de:	e8 8e 25 00 00       	call   80a771 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8081e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8081e7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081eb:	89 c1                	mov    ecx,eax
  8081ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8081f1:	89 c2                	mov    edx,eax
  8081f3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8081f7:	49 89 c0             	mov    r8,rax
  8081fa:	be 01 00 00 00       	mov    esi,0x1
  8081ff:	bf 00 00 00 00       	mov    edi,0x0
  808204:	e8 ea ea ff ff       	call   806cf3 <request>
  808209:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80820c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80820f:	89 c7                	mov    edi,eax
  808211:	e8 91 f1 ff ff       	call   8073a7 <chk_result>
  808216:	85 c0                	test   eax,eax
  808218:	75 1c                	jne    808236 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80821a:	bf 28 32 81 00       	mov    edi,0x813228
  80821f:	b8 00 00 00 00       	mov    eax,0x0
  808224:	e8 d9 8a ff ff       	call   800d02 <printf>
			retval = -EIO;
  808229:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  808230:	ff 
			break;
  808231:	e9 e0 00 00 00       	jmp    808316 <FAT32_write+0x3d4>
		}

		index -= length;
  808236:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808239:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80823c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80823f:	48 98                	cdqe   
  808241:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  808245:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80824c:	00 
		*position += length;
  80824d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808254:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808257:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80825a:	48 98                	cdqe   
  80825c:	48 01 c2             	add    rdx,rax
  80825f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808266:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  808269:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80826d:	0f 84 a2 00 00 00    	je     808315 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808273:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808277:	89 c2                	mov    edx,eax
  808279:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80827d:	89 d6                	mov    esi,edx
  80827f:	48 89 c7             	mov    rdi,rax
  808282:	e8 fe f6 ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  808287:	89 c0                	mov    eax,eax
  808289:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80828d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  808294:	0f 
  808295:	76 72                	jbe    808309 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  808297:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80829b:	48 89 c7             	mov    rdi,rax
  80829e:	e8 cd fb ff ff       	call   807e70 <FAT32_find_available_cluster>
  8082a3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  8082a7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  8082ac:	75 18                	jne    8082c6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  8082ae:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8082b2:	48 89 c7             	mov    rdi,rax
  8082b5:	e8 ef 8e ff ff       	call   8011a9 <vmfree>
				return -ENOSPC;
  8082ba:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  8082c1:	e9 d4 00 00 00       	jmp    80839a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  8082c6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8082ca:	89 c2                	mov    edx,eax
  8082cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082d0:	89 c1                	mov    ecx,eax
  8082d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082d6:	89 ce                	mov    esi,ecx
  8082d8:	48 89 c7             	mov    rdi,rax
  8082db:	e8 61 f7 ff ff       	call   807a41 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  8082e0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8082e4:	89 c1                	mov    ecx,eax
  8082e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082ea:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  8082ef:	89 ce                	mov    esi,ecx
  8082f1:	48 89 c7             	mov    rdi,rax
  8082f4:	e8 48 f7 ff ff       	call   807a41 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  8082f9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8082fd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  808301:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808308:	00 
		}

	}while(index);
  808309:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80830d:	0f 85 d2 fd ff ff    	jne    8080e5 <FAT32_write+0x1a3>
  808313:	eb 01                	jmp    808316 <FAT32_write+0x3d4>
			break;
  808315:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  808316:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80831d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808320:	48 89 c2             	mov    rdx,rax
  808323:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808327:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80832b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80832f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808332:	48 39 c2             	cmp    rdx,rax
  808335:	76 42                	jbe    808379 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  808337:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80833e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808341:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808345:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808349:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80834d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808350:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808354:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808358:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80835c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808360:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808364:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808368:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80836c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808370:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808374:	48 89 c7             	mov    rdi,rax
  808377:	ff d2                	call   rdx
	}

	vmfree(buffer);
  808379:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80837d:	48 89 c7             	mov    rdi,rax
  808380:	e8 24 8e ff ff       	call   8011a9 <vmfree>
	if(!index)
  808385:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  808389:	75 0b                	jne    808396 <FAT32_write+0x454>
		retval = count;
  80838b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808392:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  808396:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80839a:	c9                   	leave  
  80839b:	c3                   	ret    

000000000080839c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80839c:	f3 0f 1e fa          	endbr64 
  8083a0:	55                   	push   rbp
  8083a1:	48 89 e5             	mov    rbp,rsp
  8083a4:	48 83 ec 30          	sub    rsp,0x30
  8083a8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8083ac:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8083b0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  8083b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8083b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8083bc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8083c0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  8083c4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8083cb:	00 

	switch(origin)
  8083cc:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8083d1:	74 21                	je     8083f4 <FAT32_lseek+0x58>
  8083d3:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  8083d8:	7f 4a                	jg     808424 <FAT32_lseek+0x88>
  8083da:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8083df:	74 09                	je     8083ea <FAT32_lseek+0x4e>
  8083e1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  8083e6:	74 20                	je     808408 <FAT32_lseek+0x6c>
  8083e8:	eb 3a                	jmp    808424 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  8083ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8083ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8083f2:	eb 39                	jmp    80842d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  8083f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8083f8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8083fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8083ff:	48 01 d0             	add    rax,rdx
  808402:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808406:	eb 25                	jmp    80842d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  808408:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80840c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808410:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808414:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808417:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80841b:	48 01 d0             	add    rax,rdx
  80841e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808422:	eb 09                	jmp    80842d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  808424:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80842b:	eb 50                	jmp    80847d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80842d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808432:	78 18                	js     80844c <FAT32_lseek+0xb0>
  808434:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808438:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80843c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808440:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808443:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808447:	48 39 c2             	cmp    rdx,rax
  80844a:	73 09                	jae    808455 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80844c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  808453:	eb 28                	jmp    80847d <FAT32_lseek+0xe1>

	filp->position = pos;
  808455:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808459:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80845d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  808460:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808464:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808467:	48 89 c6             	mov    rsi,rax
  80846a:	bf 58 32 81 00       	mov    edi,0x813258
  80846f:	b8 00 00 00 00       	mov    eax,0x0
  808474:	e8 89 88 ff ff       	call   800d02 <printf>

	return pos;
  808479:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80847d:	c9                   	leave  
  80847e:	c3                   	ret    

000000000080847f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80847f:	f3 0f 1e fa          	endbr64 
  808483:	55                   	push   rbp
  808484:	48 89 e5             	mov    rbp,rsp
  808487:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80848b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80848f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  808493:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  808497:	90                   	nop
  808498:	5d                   	pop    rbp
  808499:	c3                   	ret    

000000000080849a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80849a:	f3 0f 1e fa          	endbr64 
  80849e:	55                   	push   rbp
  80849f:	48 89 e5             	mov    rbp,rsp
  8084a2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8084a6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8084aa:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8084ae:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  8084b2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8084b6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084ba:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8084be:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8084c2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8084c6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8084ca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084ce:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8084d2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8084d6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084da:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  8084de:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8084e5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  8084ec:	00 
	unsigned char * buf =NULL; 
  8084ed:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  8084f4:	00 
	char *name = NULL;
  8084f5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8084fc:	00 
	int namelen = 0;
  8084fd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  808504:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80850b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808512:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  808519:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808520:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808527:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808528:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80852f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808530:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808534:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808538:	be 00 00 00 00       	mov    esi,0x0
  80853d:	48 89 c7             	mov    rdi,rax
  808540:	b8 00 00 00 00       	mov    eax,0x0
  808545:	e8 d0 8b ff ff       	call   80111a <vmalloc>
  80854a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80854e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808552:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808555:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  808558:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80855c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80855f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808563:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808567:	48 99                	cqo    
  808569:	48 f7 fe             	idiv   rsi
  80856c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80856f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  808576:	eb 3a                	jmp    8085b2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808578:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80857b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80857f:	89 d6                	mov    esi,edx
  808581:	48 89 c7             	mov    rdi,rax
  808584:	e8 fc f3 ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  808589:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80858c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  808593:	76 19                	jbe    8085ae <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  808595:	bf 80 32 81 00       	mov    edi,0x813280
  80859a:	b8 00 00 00 00       	mov    eax,0x0
  80859f:	e8 5e 87 ff ff       	call   800d02 <printf>
			return NULL;
  8085a4:	b8 00 00 00 00       	mov    eax,0x0
  8085a9:	e9 86 05 00 00       	jmp    808b34 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  8085ae:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8085b2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8085b5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8085b8:	7c be                	jl     808578 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  8085ba:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8085bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8085bf:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8085c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8085c6:	83 e8 02             	sub    eax,0x2
  8085c9:	89 c1                	mov    ecx,eax
  8085cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8085cf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8085d3:	48 0f af c1          	imul   rax,rcx
  8085d7:	48 01 d0             	add    rax,rdx
  8085da:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8085de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8085e2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8085e6:	89 c1                	mov    ecx,eax
  8085e8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8085ec:	89 c2                	mov    edx,eax
  8085ee:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8085f2:	49 89 c0             	mov    r8,rax
  8085f5:	be 00 00 00 00       	mov    esi,0x0
  8085fa:	bf 00 00 00 00       	mov    edi,0x0
  8085ff:	e8 ef e6 ff ff       	call   806cf3 <request>
  808604:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  808607:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80860a:	89 c7                	mov    edi,eax
  80860c:	e8 96 ed ff ff       	call   8073a7 <chk_result>
  808611:	85 c0                	test   eax,eax
  808613:	75 25                	jne    80863a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  808615:	bf a8 32 81 00       	mov    edi,0x8132a8
  80861a:	b8 00 00 00 00       	mov    eax,0x0
  80861f:	e8 de 86 ff ff       	call   800d02 <printf>
		vmfree(buf);
  808624:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808628:	48 89 c7             	mov    rdi,rax
  80862b:	e8 79 8b ff ff       	call   8011a9 <vmfree>
		return NULL;
  808630:	b8 00 00 00 00       	mov    eax,0x0
  808635:	e9 fa 04 00 00       	jmp    808b34 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80863a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80863e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808641:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808645:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808649:	48 99                	cqo    
  80864b:	48 f7 f9             	idiv   rcx
  80864e:	48 89 d0             	mov    rax,rdx
  808651:	48 89 c2             	mov    rdx,rax
  808654:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808658:	48 01 d0             	add    rax,rdx
  80865b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80865f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808663:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808666:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80866a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80866e:	48 99                	cqo    
  808670:	48 f7 f9             	idiv   rcx
  808673:	48 89 d0             	mov    rax,rdx
  808676:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  808679:	e9 2f 04 00 00       	jmp    808aad <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80867e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808682:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808686:	3c 0f                	cmp    al,0xf
  808688:	0f 84 00 04 00 00    	je     808a8e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80868e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808692:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808695:	3c e5                	cmp    al,0xe5
  808697:	0f 84 f4 03 00 00    	je     808a91 <FAT32_readdir+0x5f7>
  80869d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8086a4:	84 c0                	test   al,al
  8086a6:	0f 84 e5 03 00 00    	je     808a91 <FAT32_readdir+0x5f7>
  8086ac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8086b3:	3c 05                	cmp    al,0x5
  8086b5:	0f 84 d6 03 00 00    	je     808a91 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  8086bb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8086c2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086c6:	48 83 e8 20          	sub    rax,0x20
  8086ca:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8086ce:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8086d2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8086d6:	3c 0f                	cmp    al,0xf
  8086d8:	0f 85 2a 02 00 00    	jne    808908 <FAT32_readdir+0x46e>
  8086de:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8086e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8086e5:	3c e5                	cmp    al,0xe5
  8086e7:	0f 84 1b 02 00 00    	je     808908 <FAT32_readdir+0x46e>
  8086ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8086f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8086f4:	84 c0                	test   al,al
  8086f6:	0f 84 0c 02 00 00    	je     808908 <FAT32_readdir+0x46e>
  8086fc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808700:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808703:	3c 05                	cmp    al,0x5
  808705:	0f 84 fd 01 00 00    	je     808908 <FAT32_readdir+0x46e>
		{
			j = 0;
  80870b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  808712:	eb 1a                	jmp    80872e <FAT32_readdir+0x294>
			{
				j++;
  808714:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  808718:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80871c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80871f:	0f b6 c0             	movzx  eax,al
  808722:	83 e0 40             	and    eax,0x40
  808725:	85 c0                	test   eax,eax
  808727:	75 34                	jne    80875d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  808729:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80872e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808732:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808736:	3c 0f                	cmp    al,0xf
  808738:	75 24                	jne    80875e <FAT32_readdir+0x2c4>
  80873a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80873e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808741:	3c e5                	cmp    al,0xe5
  808743:	74 19                	je     80875e <FAT32_readdir+0x2c4>
  808745:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808749:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80874c:	84 c0                	test   al,al
  80874e:	74 0e                	je     80875e <FAT32_readdir+0x2c4>
  808750:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808754:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808757:	3c 05                	cmp    al,0x5
  808759:	75 b9                	jne    808714 <FAT32_readdir+0x27a>
  80875b:	eb 01                	jmp    80875e <FAT32_readdir+0x2c4>
					break;
  80875d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80875e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  808761:	89 d0                	mov    eax,edx
  808763:	01 c0                	add    eax,eax
  808765:	01 d0                	add    eax,edx
  808767:	c1 e0 02             	shl    eax,0x2
  80876a:	01 d0                	add    eax,edx
  80876c:	83 c0 01             	add    eax,0x1
  80876f:	be 00 00 00 00       	mov    esi,0x0
  808774:	89 c7                	mov    edi,eax
  808776:	b8 00 00 00 00       	mov    eax,0x0
  80877b:	e8 9a 89 ff ff       	call   80111a <vmalloc>
  808780:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  808784:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  808787:	89 d0                	mov    eax,edx
  808789:	01 c0                	add    eax,eax
  80878b:	01 d0                	add    eax,edx
  80878d:	c1 e0 02             	shl    eax,0x2
  808790:	01 d0                	add    eax,edx
  808792:	83 c0 01             	add    eax,0x1
  808795:	89 c2                	mov    edx,eax
  808797:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80879b:	be 00 00 00 00       	mov    esi,0x0
  8087a0:	48 89 c7             	mov    rdi,rax
  8087a3:	e8 78 20 00 00       	call   80a820 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8087a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8087ac:	48 83 e8 20          	sub    rax,0x20
  8087b0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  8087b4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8087bb:	e9 37 01 00 00       	jmp    8088f7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  8087c0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8087c7:	eb 53                	jmp    80881c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8087c9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087cd:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8087d0:	48 63 d2             	movsxd rdx,edx
  8087d3:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8087d8:	66 83 f8 ff          	cmp    ax,0xffff
  8087dc:	74 3a                	je     808818 <FAT32_readdir+0x37e>
  8087de:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087e2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8087e5:	48 63 d2             	movsxd rdx,edx
  8087e8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8087ed:	66 85 c0             	test   ax,ax
  8087f0:	74 26                	je     808818 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  8087f2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087f6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8087f9:	48 63 d2             	movsxd rdx,edx
  8087fc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808801:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808804:	8d 50 01             	lea    edx,[rax+0x1]
  808807:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80880a:	48 63 d0             	movsxd rdx,eax
  80880d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808811:	48 01 d0             	add    rax,rdx
  808814:	89 ca                	mov    edx,ecx
  808816:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  808818:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80881c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  808820:	7e a7                	jle    8087c9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  808822:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808829:	eb 53                	jmp    80887e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80882b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80882f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808832:	48 63 d2             	movsxd rdx,edx
  808835:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80883a:	66 83 f8 ff          	cmp    ax,0xffff
  80883e:	74 3a                	je     80887a <FAT32_readdir+0x3e0>
  808840:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808844:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808847:	48 63 d2             	movsxd rdx,edx
  80884a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80884f:	66 85 c0             	test   ax,ax
  808852:	74 26                	je     80887a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  808854:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808858:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80885b:	48 63 d2             	movsxd rdx,edx
  80885e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808863:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808866:	8d 50 01             	lea    edx,[rax+0x1]
  808869:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80886c:	48 63 d0             	movsxd rdx,eax
  80886f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808873:	48 01 d0             	add    rax,rdx
  808876:	89 ca                	mov    edx,ecx
  808878:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80887a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80887e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  808882:	7e a7                	jle    80882b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  808884:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80888b:	eb 5b                	jmp    8088e8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80888d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808891:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808894:	48 63 d2             	movsxd rdx,edx
  808897:	48 83 c2 08          	add    rdx,0x8
  80889b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  8088a0:	66 83 f8 ff          	cmp    ax,0xffff
  8088a4:	74 3e                	je     8088e4 <FAT32_readdir+0x44a>
  8088a6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088aa:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8088ad:	48 63 d2             	movsxd rdx,edx
  8088b0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8088b5:	66 85 c0             	test   ax,ax
  8088b8:	74 2a                	je     8088e4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  8088ba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088be:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8088c1:	48 63 d2             	movsxd rdx,edx
  8088c4:	48 83 c2 08          	add    rdx,0x8
  8088c8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  8088cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8088d0:	8d 50 01             	lea    edx,[rax+0x1]
  8088d3:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8088d6:	48 63 d0             	movsxd rdx,eax
  8088d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8088dd:	48 01 d0             	add    rax,rdx
  8088e0:	89 ca                	mov    edx,ecx
  8088e2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  8088e4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8088e8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  8088ec:	7e 9f                	jle    80888d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  8088ee:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8088f2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  8088f7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8088fa:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8088fd:	0f 8c bd fe ff ff    	jl     8087c0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  808903:	e9 f5 01 00 00       	jmp    808afd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  808908:	be 00 00 00 00       	mov    esi,0x0
  80890d:	bf 0f 00 00 00       	mov    edi,0xf
  808912:	b8 00 00 00 00       	mov    eax,0x0
  808917:	e8 fe 87 ff ff       	call   80111a <vmalloc>
  80891c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  808920:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808924:	ba 0f 00 00 00       	mov    edx,0xf
  808929:	be 00 00 00 00       	mov    esi,0x0
  80892e:	48 89 c7             	mov    rdi,rax
  808931:	e8 ea 1e 00 00       	call   80a820 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  808936:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80893d:	eb 74                	jmp    8089b3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80893f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808943:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808946:	48 98                	cdqe   
  808948:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80894c:	3c 20                	cmp    al,0x20
  80894e:	74 6b                	je     8089bb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808950:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808954:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808958:	0f b6 c0             	movzx  eax,al
  80895b:	83 e0 08             	and    eax,0x8
  80895e:	85 c0                	test   eax,eax
  808960:	74 29                	je     80898b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808962:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808966:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808969:	48 98                	cdqe   
  80896b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80896f:	8d 48 20             	lea    ecx,[rax+0x20]
  808972:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808975:	8d 50 01             	lea    edx,[rax+0x1]
  808978:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80897b:	48 63 d0             	movsxd rdx,eax
  80897e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808982:	48 01 d0             	add    rax,rdx
  808985:	89 ca                	mov    edx,ecx
  808987:	88 10                	mov    BYTE PTR [rax],dl
  808989:	eb 24                	jmp    8089af <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80898b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80898f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808992:	48 98                	cdqe   
  808994:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  808998:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80899b:	8d 50 01             	lea    edx,[rax+0x1]
  80899e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8089a1:	48 63 d0             	movsxd rdx,eax
  8089a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089a8:	48 01 d0             	add    rax,rdx
  8089ab:	89 ca                	mov    edx,ecx
  8089ad:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  8089af:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8089b3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  8089b7:	7e 86                	jle    80893f <FAT32_readdir+0x4a5>
  8089b9:	eb 01                	jmp    8089bc <FAT32_readdir+0x522>
				break;
  8089bb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  8089bc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8089c0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8089c4:	0f b6 c0             	movzx  eax,al
  8089c7:	83 e0 10             	and    eax,0x10
  8089ca:	85 c0                	test   eax,eax
  8089cc:	0f 85 27 01 00 00    	jne    808af9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  8089d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8089d5:	8d 50 01             	lea    edx,[rax+0x1]
  8089d8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8089db:	48 63 d0             	movsxd rdx,eax
  8089de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089e2:	48 01 d0             	add    rax,rdx
  8089e5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  8089e8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  8089ef:	eb 74                	jmp    808a65 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  8089f1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8089f5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8089f8:	48 98                	cdqe   
  8089fa:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8089fe:	3c 20                	cmp    al,0x20
  808a00:	74 6b                	je     808a6d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808a02:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808a06:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808a0a:	0f b6 c0             	movzx  eax,al
  808a0d:	83 e0 10             	and    eax,0x10
  808a10:	85 c0                	test   eax,eax
  808a12:	74 29                	je     808a3d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808a14:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808a18:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a1b:	48 98                	cdqe   
  808a1d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808a21:	8d 48 20             	lea    ecx,[rax+0x20]
  808a24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a27:	8d 50 01             	lea    edx,[rax+0x1]
  808a2a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a2d:	48 63 d0             	movsxd rdx,eax
  808a30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a34:	48 01 d0             	add    rax,rdx
  808a37:	89 ca                	mov    edx,ecx
  808a39:	88 10                	mov    BYTE PTR [rax],dl
  808a3b:	eb 24                	jmp    808a61 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  808a3d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808a41:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a44:	48 98                	cdqe   
  808a46:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  808a4a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a4d:	8d 50 01             	lea    edx,[rax+0x1]
  808a50:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a53:	48 63 d0             	movsxd rdx,eax
  808a56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a5a:	48 01 d0             	add    rax,rdx
  808a5d:	89 ca                	mov    edx,ecx
  808a5f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  808a61:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808a65:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  808a69:	7e 86                	jle    8089f1 <FAT32_readdir+0x557>
  808a6b:	eb 01                	jmp    808a6e <FAT32_readdir+0x5d4>
				break;
  808a6d:	90                   	nop
		}
		if(x == 8)
  808a6e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  808a72:	0f 85 84 00 00 00    	jne    808afc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  808a78:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  808a7c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a7f:	48 63 d0             	movsxd rdx,eax
  808a82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a86:	48 01 d0             	add    rax,rdx
  808a89:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  808a8c:	eb 6e                	jmp    808afc <FAT32_readdir+0x662>
			continue;
  808a8e:	90                   	nop
  808a8f:	eb 01                	jmp    808a92 <FAT32_readdir+0x5f8>
			continue;
  808a91:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  808a92:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  808a96:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  808a9b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a9f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808aa2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808aa6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808aaa:	48 89 10             	mov    QWORD PTR [rax],rdx
  808aad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808ab0:	48 63 d0             	movsxd rdx,eax
  808ab3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808ab7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808abb:	48 39 c2             	cmp    rdx,rax
  808abe:	0f 8c ba fb ff ff    	jl     80867e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808ac4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808ac7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808acb:	89 d6                	mov    esi,edx
  808acd:	48 89 c7             	mov    rdi,rax
  808ad0:	e8 b0 ee ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  808ad5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808ad8:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  808adf:	77 05                	ja     808ae6 <FAT32_readdir+0x64c>
		goto next_cluster;
  808ae1:	e9 d5 fa ff ff       	jmp    8085bb <FAT32_readdir+0x121>

	vmfree(buf);
  808ae6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808aea:	48 89 c7             	mov    rdi,rax
  808aed:	e8 b7 86 ff ff       	call   8011a9 <vmfree>
	return NULL;
  808af2:	b8 00 00 00 00       	mov    eax,0x0
  808af7:	eb 3b                	jmp    808b34 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  808af9:	90                   	nop
  808afa:	eb 01                	jmp    808afd <FAT32_readdir+0x663>
		goto find_lookup_success;
  808afc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  808afd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b01:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b04:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808b08:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b0c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  808b0f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808b12:	48 63 d0             	movsxd rdx,eax
  808b15:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  808b19:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808b1d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  808b21:	41 b8 00 00 00 00    	mov    r8d,0x0
  808b27:	b9 00 00 00 00       	mov    ecx,0x0
  808b2c:	48 89 c7             	mov    rdi,rax
  808b2f:	41 ff d1             	call   r9
  808b32:	48 98                	cdqe   
}
  808b34:	c9                   	leave  
  808b35:	c3                   	ret    

0000000000808b36 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  808b36:	f3 0f 1e fa          	endbr64 
  808b3a:	55                   	push   rbp
  808b3b:	48 89 e5             	mov    rbp,rsp
  808b3e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808b42:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808b46:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808b49:	90                   	nop
  808b4a:	5d                   	pop    rbp
  808b4b:	c3                   	ret    

0000000000808b4c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  808b4c:	f3 0f 1e fa          	endbr64 
  808b50:	55                   	push   rbp
  808b51:	48 89 e5             	mov    rbp,rsp
  808b54:	48 83 ec 60          	sub    rsp,0x60
  808b58:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  808b5c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  808b60:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808b64:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808b68:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  808b6c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808b70:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b74:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b78:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  808b7c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808b83:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  808b8a:	00 
	unsigned char * buf =NULL; 
  808b8b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808b92:	00 
	int i = 0,j = 0,x = 0;
  808b93:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808b9a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808ba1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808ba8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808baf:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808bb0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808bb7:	00 
	struct index_node * p = NULL;
  808bb8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  808bbf:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808bc0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808bc4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808bc8:	be 00 00 00 00       	mov    esi,0x0
  808bcd:	48 89 c7             	mov    rdi,rax
  808bd0:	b8 00 00 00 00       	mov    eax,0x0
  808bd5:	e8 40 85 ff ff       	call   80111a <vmalloc>
  808bda:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  808bde:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808be2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808be5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808be8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808bec:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808bf0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808bf3:	83 e8 02             	sub    eax,0x2
  808bf6:	89 c1                	mov    ecx,eax
  808bf8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808bfc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c00:	48 0f af c1          	imul   rax,rcx
  808c04:	48 01 d0             	add    rax,rdx
  808c07:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  808c0b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808c0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808c12:	89 c6                	mov    esi,eax
  808c14:	bf d8 32 81 00       	mov    edi,0x8132d8
  808c19:	b8 00 00 00 00       	mov    eax,0x0
  808c1e:	e8 df 80 ff ff       	call   800d02 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  808c23:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808c27:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c2b:	89 c1                	mov    ecx,eax
  808c2d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808c31:	89 c2                	mov    edx,eax
  808c33:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808c37:	49 89 c0             	mov    r8,rax
  808c3a:	be 00 00 00 00       	mov    esi,0x0
  808c3f:	bf 00 00 00 00       	mov    edi,0x0
  808c44:	e8 aa e0 ff ff       	call   806cf3 <request>
  808c49:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  808c4c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808c4f:	89 c7                	mov    edi,eax
  808c51:	e8 51 e7 ff ff       	call   8073a7 <chk_result>
  808c56:	85 c0                	test   eax,eax
  808c58:	75 25                	jne    808c7f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  808c5a:	bf 00 33 81 00       	mov    edi,0x813300
  808c5f:	b8 00 00 00 00       	mov    eax,0x0
  808c64:	e8 99 80 ff ff       	call   800d02 <printf>
		vmfree(buf);
  808c69:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808c6d:	48 89 c7             	mov    rdi,rax
  808c70:	e8 34 85 ff ff       	call   8011a9 <vmfree>
		return NULL;
  808c75:	b8 00 00 00 00       	mov    eax,0x0
  808c7a:	e9 f0 07 00 00       	jmp    80946f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  808c7f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808c83:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  808c87:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808c8e:	e9 9d 05 00 00       	jmp    809230 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  808c93:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c97:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808c9b:	3c 0f                	cmp    al,0xf
  808c9d:	0f 84 59 05 00 00    	je     8091fc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  808ca3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ca7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808caa:	3c e5                	cmp    al,0xe5
  808cac:	0f 84 4d 05 00 00    	je     8091ff <FAT32_lookup+0x6b3>
  808cb2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cb6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cb9:	84 c0                	test   al,al
  808cbb:	0f 84 3e 05 00 00    	je     8091ff <FAT32_lookup+0x6b3>
  808cc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cc5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cc8:	3c 05                	cmp    al,0x5
  808cca:	0f 84 2f 05 00 00    	je     8091ff <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808cd0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cd4:	48 83 e8 20          	sub    rax,0x20
  808cd8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  808cdc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808ce3:	e9 88 01 00 00       	jmp    808e70 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  808ce8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808cef:	eb 6a                	jmp    808d5b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  808cf1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cf5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808cf8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808cfb:	7e 15                	jle    808d12 <FAT32_lookup+0x1c6>
  808cfd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808d01:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808d04:	48 63 d2             	movsxd rdx,edx
  808d07:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808d0c:	66 83 f8 ff          	cmp    ax,0xffff
  808d10:	74 44                	je     808d56 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  808d12:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d16:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d19:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d1c:	0f 8f e0 04 00 00    	jg     809202 <FAT32_lookup+0x6b6>
  808d22:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808d26:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808d29:	48 63 d2             	movsxd rdx,edx
  808d2c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808d31:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d35:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808d38:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d3b:	8d 50 01             	lea    edx,[rax+0x1]
  808d3e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808d41:	48 98                	cdqe   
  808d43:	48 01 f0             	add    rax,rsi
  808d46:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d49:	66 98                	cbw    
  808d4b:	66 39 c1             	cmp    cx,ax
  808d4e:	0f 85 ae 04 00 00    	jne    809202 <FAT32_lookup+0x6b6>
  808d54:	eb 01                	jmp    808d57 <FAT32_lookup+0x20b>
					continue;
  808d56:	90                   	nop
			for(x=0;x<5;x++)
  808d57:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808d5b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  808d5f:	7e 90                	jle    808cf1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  808d61:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808d68:	eb 6a                	jmp    808dd4 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  808d6a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d6e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d71:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d74:	7e 15                	jle    808d8b <FAT32_lookup+0x23f>
  808d76:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808d7a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808d7d:	48 63 d2             	movsxd rdx,edx
  808d80:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  808d85:	66 83 f8 ff          	cmp    ax,0xffff
  808d89:	74 44                	je     808dcf <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  808d8b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d8f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d92:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d95:	0f 8f 6a 04 00 00    	jg     809205 <FAT32_lookup+0x6b9>
  808d9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808d9f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808da2:	48 63 d2             	movsxd rdx,edx
  808da5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808daa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808dae:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808db1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808db4:	8d 50 01             	lea    edx,[rax+0x1]
  808db7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808dba:	48 98                	cdqe   
  808dbc:	48 01 f0             	add    rax,rsi
  808dbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc2:	66 98                	cbw    
  808dc4:	66 39 c1             	cmp    cx,ax
  808dc7:	0f 85 38 04 00 00    	jne    809205 <FAT32_lookup+0x6b9>
  808dcd:	eb 01                	jmp    808dd0 <FAT32_lookup+0x284>
					continue;
  808dcf:	90                   	nop
			for(x=0;x<6;x++)
  808dd0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808dd4:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  808dd8:	7e 90                	jle    808d6a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  808dda:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808de1:	eb 72                	jmp    808e55 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  808de3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808de7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808dea:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ded:	7e 19                	jle    808e08 <FAT32_lookup+0x2bc>
  808def:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808df3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808df6:	48 63 d2             	movsxd rdx,edx
  808df9:	48 83 c2 08          	add    rdx,0x8
  808dfd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808e02:	66 83 f8 ff          	cmp    ax,0xffff
  808e06:	74 48                	je     808e50 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  808e08:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e0c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808e0f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808e12:	0f 8f f0 03 00 00    	jg     809208 <FAT32_lookup+0x6bc>
  808e18:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808e1c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808e1f:	48 63 d2             	movsxd rdx,edx
  808e22:	48 83 c2 08          	add    rdx,0x8
  808e26:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  808e2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e2f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808e32:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e35:	8d 50 01             	lea    edx,[rax+0x1]
  808e38:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808e3b:	48 98                	cdqe   
  808e3d:	48 01 f0             	add    rax,rsi
  808e40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e43:	66 98                	cbw    
  808e45:	66 39 c1             	cmp    cx,ax
  808e48:	0f 85 ba 03 00 00    	jne    809208 <FAT32_lookup+0x6bc>
  808e4e:	eb 01                	jmp    808e51 <FAT32_lookup+0x305>
					continue;
  808e50:	90                   	nop
			for(x=0;x<2;x++)
  808e51:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808e55:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  808e59:	7e 88                	jle    808de3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  808e5b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e5f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808e62:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808e65:	0f 8d 14 04 00 00    	jge    80927f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  808e6b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808e70:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808e74:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808e78:	3c 0f                	cmp    al,0xf
  808e7a:	75 0f                	jne    808e8b <FAT32_lookup+0x33f>
  808e7c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808e80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e83:	3c e5                	cmp    al,0xe5
  808e85:	0f 85 5d fe ff ff    	jne    808ce8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  808e8b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  808e92:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808e99:	e9 f4 01 00 00       	jmp    809092 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  808e9e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ea2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ea5:	48 98                	cdqe   
  808ea7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808eab:	0f b6 c0             	movzx  eax,al
  808eae:	83 f8 7a             	cmp    eax,0x7a
  808eb1:	0f 8f d0 01 00 00    	jg     809087 <FAT32_lookup+0x53b>
  808eb7:	83 f8 61             	cmp    eax,0x61
  808eba:	0f 8d e6 00 00 00    	jge    808fa6 <FAT32_lookup+0x45a>
  808ec0:	83 f8 5a             	cmp    eax,0x5a
  808ec3:	0f 8f be 01 00 00    	jg     809087 <FAT32_lookup+0x53b>
  808ec9:	83 f8 41             	cmp    eax,0x41
  808ecc:	0f 8d d4 00 00 00    	jge    808fa6 <FAT32_lookup+0x45a>
  808ed2:	83 f8 20             	cmp    eax,0x20
  808ed5:	74 1a                	je     808ef1 <FAT32_lookup+0x3a5>
  808ed7:	83 f8 20             	cmp    eax,0x20
  808eda:	0f 8c a7 01 00 00    	jl     809087 <FAT32_lookup+0x53b>
  808ee0:	83 e8 30             	sub    eax,0x30
  808ee3:	83 f8 09             	cmp    eax,0x9
  808ee6:	0f 87 9b 01 00 00    	ja     809087 <FAT32_lookup+0x53b>
  808eec:	e9 53 01 00 00       	jmp    809044 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808ef1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ef5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808ef9:	0f b6 c0             	movzx  eax,al
  808efc:	83 e0 10             	and    eax,0x10
  808eff:	85 c0                	test   eax,eax
  808f01:	75 50                	jne    808f53 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  808f03:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f07:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808f0a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f0d:	48 98                	cdqe   
  808f0f:	48 01 d0             	add    rax,rdx
  808f12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f15:	3c 2e                	cmp    al,0x2e
  808f17:	0f 84 70 01 00 00    	je     80908d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808f1d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808f21:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808f24:	48 98                	cdqe   
  808f26:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808f2a:	0f b6 d0             	movzx  edx,al
  808f2d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f31:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f34:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f37:	48 98                	cdqe   
  808f39:	48 01 c8             	add    rax,rcx
  808f3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f3f:	0f be c0             	movsx  eax,al
  808f42:	39 c2                	cmp    edx,eax
  808f44:	0f 85 c1 02 00 00    	jne    80920b <FAT32_lookup+0x6bf>
						{
							j++;
  808f4a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f4e:	e9 3b 01 00 00       	jmp    80908e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808f53:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f57:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808f5a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808f5d:	7d 32                	jge    808f91 <FAT32_lookup+0x445>
  808f5f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808f63:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808f66:	48 98                	cdqe   
  808f68:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808f6c:	0f b6 d0             	movzx  edx,al
  808f6f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f73:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f76:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f79:	48 98                	cdqe   
  808f7b:	48 01 c8             	add    rax,rcx
  808f7e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f81:	0f be c0             	movsx  eax,al
  808f84:	39 c2                	cmp    edx,eax
  808f86:	75 09                	jne    808f91 <FAT32_lookup+0x445>
						{
							j++;
  808f88:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f8c:	e9 fd 00 00 00       	jmp    80908e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  808f91:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f95:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808f98:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808f9b:	0f 85 6d 02 00 00    	jne    80920e <FAT32_lookup+0x6c2>
							continue;
  808fa1:	e9 e8 00 00 00       	jmp    80908e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808fa6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808faa:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808fae:	0f b6 c0             	movzx  eax,al
  808fb1:	83 e0 08             	and    eax,0x8
  808fb4:	85 c0                	test   eax,eax
  808fb6:	74 49                	je     809001 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808fb8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fbc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808fbf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808fc2:	0f 8d 49 02 00 00    	jge    809211 <FAT32_lookup+0x6c5>
  808fc8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808fcc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808fcf:	48 98                	cdqe   
  808fd1:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808fd5:	0f b6 c0             	movzx  eax,al
  808fd8:	8d 50 20             	lea    edx,[rax+0x20]
  808fdb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fdf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808fe2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fe5:	48 98                	cdqe   
  808fe7:	48 01 c8             	add    rax,rcx
  808fea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808fed:	0f be c0             	movsx  eax,al
  808ff0:	39 c2                	cmp    edx,eax
  808ff2:	0f 85 19 02 00 00    	jne    809211 <FAT32_lookup+0x6c5>
						{
							j++;
  808ff8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808ffc:	e9 8d 00 00 00       	jmp    80908e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809001:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809005:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809008:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80900b:	0f 8d 03 02 00 00    	jge    809214 <FAT32_lookup+0x6c8>
  809011:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809015:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809018:	48 98                	cdqe   
  80901a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80901e:	0f b6 d0             	movzx  edx,al
  809021:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809025:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809028:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80902b:	48 98                	cdqe   
  80902d:	48 01 c8             	add    rax,rcx
  809030:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809033:	0f be c0             	movsx  eax,al
  809036:	39 c2                	cmp    edx,eax
  809038:	0f 85 d6 01 00 00    	jne    809214 <FAT32_lookup+0x6c8>
						{
							j++;
  80903e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809042:	eb 4a                	jmp    80908e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809044:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809048:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80904b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80904e:	0f 8d c3 01 00 00    	jge    809217 <FAT32_lookup+0x6cb>
  809054:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809058:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80905b:	48 98                	cdqe   
  80905d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809061:	0f b6 d0             	movzx  edx,al
  809064:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809068:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80906b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80906e:	48 98                	cdqe   
  809070:	48 01 c8             	add    rax,rcx
  809073:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809076:	0f be c0             	movsx  eax,al
  809079:	39 c2                	cmp    edx,eax
  80907b:	0f 85 96 01 00 00    	jne    809217 <FAT32_lookup+0x6cb>
					{
						j++;
  809081:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  809085:	eb 07                	jmp    80908e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  809087:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80908b:	eb 01                	jmp    80908e <FAT32_lookup+0x542>
							continue;
  80908d:	90                   	nop
		for(x=0;x<8;x++)
  80908e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809092:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  809096:	0f 8e 02 fe ff ff    	jle    808e9e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80909c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090a0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8090a4:	0f b6 c0             	movzx  eax,al
  8090a7:	83 e0 10             	and    eax,0x10
  8090aa:	85 c0                	test   eax,eax
  8090ac:	0f 85 d0 01 00 00    	jne    809282 <FAT32_lookup+0x736>
		{
			j++;
  8090b2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  8090b6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  8090bd:	e9 2b 01 00 00       	jmp    8091ed <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  8090c2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8090c6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8090c9:	48 98                	cdqe   
  8090cb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8090cf:	0f b6 c0             	movzx  eax,al
  8090d2:	83 f8 7a             	cmp    eax,0x7a
  8090d5:	0f 8f 3f 01 00 00    	jg     80921a <FAT32_lookup+0x6ce>
  8090db:	83 f8 61             	cmp    eax,0x61
  8090de:	7d 2e                	jge    80910e <FAT32_lookup+0x5c2>
  8090e0:	83 f8 5a             	cmp    eax,0x5a
  8090e3:	0f 8f 31 01 00 00    	jg     80921a <FAT32_lookup+0x6ce>
  8090e9:	83 f8 41             	cmp    eax,0x41
  8090ec:	7d 20                	jge    80910e <FAT32_lookup+0x5c2>
  8090ee:	83 f8 20             	cmp    eax,0x20
  8090f1:	0f 84 c4 00 00 00    	je     8091bb <FAT32_lookup+0x66f>
  8090f7:	83 f8 20             	cmp    eax,0x20
  8090fa:	0f 8c 1a 01 00 00    	jl     80921a <FAT32_lookup+0x6ce>
  809100:	83 e8 30             	sub    eax,0x30
  809103:	83 f8 09             	cmp    eax,0x9
  809106:	0f 87 0e 01 00 00    	ja     80921a <FAT32_lookup+0x6ce>
  80910c:	eb 7e                	jmp    80918c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80910e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809112:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809116:	0f b6 c0             	movzx  eax,al
  809119:	83 e0 10             	and    eax,0x10
  80911c:	85 c0                	test   eax,eax
  80911e:	74 39                	je     809159 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809120:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809124:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809127:	48 98                	cdqe   
  809129:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80912d:	0f b6 c0             	movzx  eax,al
  809130:	8d 50 20             	lea    edx,[rax+0x20]
  809133:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809137:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80913a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80913d:	48 98                	cdqe   
  80913f:	48 01 c8             	add    rax,rcx
  809142:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809145:	0f be c0             	movsx  eax,al
  809148:	39 c2                	cmp    edx,eax
  80914a:	0f 85 cd 00 00 00    	jne    80921d <FAT32_lookup+0x6d1>
							{
								j++;
  809150:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  809154:	e9 90 00 00 00       	jmp    8091e9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809159:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80915d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809160:	48 98                	cdqe   
  809162:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809166:	0f b6 d0             	movzx  edx,al
  809169:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80916d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809170:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809173:	48 98                	cdqe   
  809175:	48 01 c8             	add    rax,rcx
  809178:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80917b:	0f be c0             	movsx  eax,al
  80917e:	39 c2                	cmp    edx,eax
  809180:	0f 85 9a 00 00 00    	jne    809220 <FAT32_lookup+0x6d4>
							{
								j++;
  809186:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80918a:	eb 5d                	jmp    8091e9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80918c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809190:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809193:	48 98                	cdqe   
  809195:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809199:	0f b6 d0             	movzx  edx,al
  80919c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091a0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8091a3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8091a6:	48 98                	cdqe   
  8091a8:	48 01 c8             	add    rax,rcx
  8091ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091ae:	0f be c0             	movsx  eax,al
  8091b1:	39 c2                	cmp    edx,eax
  8091b3:	75 6e                	jne    809223 <FAT32_lookup+0x6d7>
						{
							j++;
  8091b5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  8091b9:	eb 2e                	jmp    8091e9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  8091bb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8091bf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8091c2:	48 98                	cdqe   
  8091c4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8091c8:	0f b6 d0             	movzx  edx,al
  8091cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091cf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8091d2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8091d5:	48 98                	cdqe   
  8091d7:	48 01 c8             	add    rax,rcx
  8091da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091dd:	0f be c0             	movsx  eax,al
  8091e0:	39 c2                	cmp    edx,eax
  8091e2:	75 42                	jne    809226 <FAT32_lookup+0x6da>
						{
							j++;
  8091e4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  8091e8:	90                   	nop
			for(x=8;x<11;x++)
  8091e9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8091ed:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  8091f1:	0f 8e cb fe ff ff    	jle    8090c2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  8091f7:	e9 86 00 00 00       	jmp    809282 <FAT32_lookup+0x736>
			continue;
  8091fc:	90                   	nop
  8091fd:	eb 28                	jmp    809227 <FAT32_lookup+0x6db>
			continue;
  8091ff:	90                   	nop
  809200:	eb 25                	jmp    809227 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  809202:	90                   	nop
  809203:	eb 22                	jmp    809227 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  809205:	90                   	nop
  809206:	eb 1f                	jmp    809227 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  809208:	90                   	nop
  809209:	eb 1c                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80920b:	90                   	nop
  80920c:	eb 19                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80920e:	90                   	nop
  80920f:	eb 16                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  809211:	90                   	nop
  809212:	eb 13                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  809214:	90                   	nop
  809215:	eb 10                	jmp    809227 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  809217:	90                   	nop
  809218:	eb 0d                	jmp    809227 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80921a:	90                   	nop
  80921b:	eb 0a                	jmp    809227 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80921d:	90                   	nop
  80921e:	eb 07                	jmp    809227 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  809220:	90                   	nop
  809221:	eb 04                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  809223:	90                   	nop
  809224:	eb 01                	jmp    809227 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  809226:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  809227:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80922b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  809230:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  809233:	48 63 d0             	movsxd rdx,eax
  809236:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80923a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80923e:	48 39 c2             	cmp    rdx,rax
  809241:	0f 8c 4c fa ff ff    	jl     808c93 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809247:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80924a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80924e:	89 d6                	mov    esi,edx
  809250:	48 89 c7             	mov    rdi,rax
  809253:	e8 2d e7 ff ff       	call   807985 <DISK1_FAT32_read_FAT_Entry>
  809258:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80925b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  809262:	77 05                	ja     809269 <FAT32_lookup+0x71d>
		goto next_cluster;
  809264:	e9 7f f9 ff ff       	jmp    808be8 <FAT32_lookup+0x9c>

	vmfree(buf);
  809269:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80926d:	48 89 c7             	mov    rdi,rax
  809270:	e8 34 7f ff ff       	call   8011a9 <vmfree>
	return NULL;
  809275:	b8 00 00 00 00       	mov    eax,0x0
  80927a:	e9 f0 01 00 00       	jmp    80946f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80927f:	90                   	nop
  809280:	eb 01                	jmp    809283 <FAT32_lookup+0x737>
		goto find_lookup_success;
  809282:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  809283:	be 00 00 00 00       	mov    esi,0x0
  809288:	bf 38 00 00 00       	mov    edi,0x38
  80928d:	b8 00 00 00 00       	mov    eax,0x0
  809292:	e8 83 7e ff ff       	call   80111a <vmalloc>
  809297:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80929b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80929f:	ba 38 00 00 00       	mov    edx,0x38
  8092a4:	be 00 00 00 00       	mov    esi,0x0
  8092a9:	48 89 c7             	mov    rdi,rax
  8092ac:	e8 6f 15 00 00       	call   80a820 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  8092b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092b5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8092b8:	89 c2                	mov    edx,eax
  8092ba:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8092be:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  8092c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8092c5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092c8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8092cc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8092d0:	48 01 d0             	add    rax,rdx
  8092d3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  8092d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8092db:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8092df:	48 89 c1             	mov    rcx,rax
  8092e2:	48 89 d0             	mov    rax,rdx
  8092e5:	ba 00 00 00 00       	mov    edx,0x0
  8092ea:	48 f7 f1             	div    rcx
  8092ed:	48 89 c2             	mov    rdx,rax
  8092f0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8092f4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  8092f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092fc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809300:	0f b6 c0             	movzx  eax,al
  809303:	83 e0 10             	and    eax,0x10
  809306:	85 c0                	test   eax,eax
  809308:	74 07                	je     809311 <FAT32_lookup+0x7c5>
  80930a:	ba 02 00 00 00       	mov    edx,0x2
  80930f:	eb 05                	jmp    809316 <FAT32_lookup+0x7ca>
  809311:	ba 01 00 00 00       	mov    edx,0x1
  809316:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80931a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80931e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809322:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  809326:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80932a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80932e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809332:	48 c7 40 20 40 b3 80 	mov    QWORD PTR [rax+0x20],0x80b340
  809339:	00 
	p->inode_ops = &FAT32_inode_ops;
  80933a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80933e:	48 c7 40 28 80 b3 80 	mov    QWORD PTR [rax+0x28],0x80b380
  809345:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  809346:	be 00 00 00 00       	mov    esi,0x0
  80934b:	bf 20 00 00 00       	mov    edi,0x20
  809350:	b8 00 00 00 00       	mov    eax,0x0
  809355:	e8 c0 7d ff ff       	call   80111a <vmalloc>
  80935a:	48 89 c2             	mov    rdx,rax
  80935d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809361:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  809365:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809369:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80936d:	ba 20 00 00 00       	mov    edx,0x20
  809372:	be 00 00 00 00       	mov    esi,0x0
  809377:	48 89 c7             	mov    rdi,rax
  80937a:	e8 a1 14 00 00       	call   80a820 <memset>
	finode = p->private_index_info;
  80937f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809383:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809387:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80938b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80938f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809393:	0f b7 c0             	movzx  eax,ax
  809396:	c1 e0 10             	shl    eax,0x10
  809399:	89 c2                	mov    edx,eax
  80939b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80939f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8093a3:	0f b7 c0             	movzx  eax,ax
  8093a6:	09 d0                	or     eax,edx
  8093a8:	48 98                	cdqe   
  8093aa:	25 ff ff ff 0f       	and    eax,0xfffffff
  8093af:	48 89 c2             	mov    rdx,rax
  8093b2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093b6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  8093b9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8093bc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093c0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  8093c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093c8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  8093cc:	48 c1 f8 05          	sar    rax,0x5
  8093d0:	48 89 c2             	mov    rdx,rax
  8093d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093d7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  8093db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093df:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  8093e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093e7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  8093eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ef:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  8093f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093f7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  8093fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ff:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  809403:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809407:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80940b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80940f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  809413:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809417:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80941b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80941f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809423:	66 c1 e8 0c          	shr    ax,0xc
  809427:	66 85 c0             	test   ax,ax
  80942a:	74 27                	je     809453 <FAT32_lookup+0x907>
  80942c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809430:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809434:	83 e0 01             	and    eax,0x1
  809437:	48 85 c0             	test   rax,rax
  80943a:	74 17                	je     809453 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80943c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809440:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809444:	48 83 c8 04          	or     rax,0x4
  809448:	48 89 c2             	mov    rdx,rax
  80944b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80944f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  809453:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809457:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80945b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80945f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809463:	48 89 c7             	mov    rdi,rax
  809466:	e8 3e 7d ff ff       	call   8011a9 <vmfree>
	return dest_dentry;	
  80946b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80946f:	c9                   	leave  
  809470:	c3                   	ret    

0000000000809471 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809471:	f3 0f 1e fa          	endbr64 
  809475:	55                   	push   rbp
  809476:	48 89 e5             	mov    rbp,rsp
  809479:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80947d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809481:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809484:	90                   	nop
  809485:	5d                   	pop    rbp
  809486:	c3                   	ret    

0000000000809487 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  809487:	f3 0f 1e fa          	endbr64 
  80948b:	55                   	push   rbp
  80948c:	48 89 e5             	mov    rbp,rsp
  80948f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809493:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809497:	90                   	nop
  809498:	5d                   	pop    rbp
  809499:	c3                   	ret    

000000000080949a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80949a:	f3 0f 1e fa          	endbr64 
  80949e:	55                   	push   rbp
  80949f:	48 89 e5             	mov    rbp,rsp
  8094a2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094a6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8094aa:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8094ae:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8094b2:	90                   	nop
  8094b3:	5d                   	pop    rbp
  8094b4:	c3                   	ret    

00000000008094b5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  8094b5:	f3 0f 1e fa          	endbr64 
  8094b9:	55                   	push   rbp
  8094ba:	48 89 e5             	mov    rbp,rsp
  8094bd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094c1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8094c5:	90                   	nop
  8094c6:	5d                   	pop    rbp
  8094c7:	c3                   	ret    

00000000008094c8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  8094c8:	f3 0f 1e fa          	endbr64 
  8094cc:	55                   	push   rbp
  8094cd:	48 89 e5             	mov    rbp,rsp
  8094d0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094d4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8094d8:	90                   	nop
  8094d9:	5d                   	pop    rbp
  8094da:	c3                   	ret    

00000000008094db <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  8094db:	f3 0f 1e fa          	endbr64 
  8094df:	55                   	push   rbp
  8094e0:	48 89 e5             	mov    rbp,rsp
  8094e3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094e7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8094eb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8094ef:	90                   	nop
  8094f0:	5d                   	pop    rbp
  8094f1:	c3                   	ret    

00000000008094f2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  8094f2:	f3 0f 1e fa          	endbr64 
  8094f6:	55                   	push   rbp
  8094f7:	48 89 e5             	mov    rbp,rsp
  8094fa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094fe:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809502:	90                   	nop
  809503:	5d                   	pop    rbp
  809504:	c3                   	ret    

0000000000809505 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  809505:	f3 0f 1e fa          	endbr64 
  809509:	55                   	push   rbp
  80950a:	48 89 e5             	mov    rbp,rsp
  80950d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809511:	90                   	nop
  809512:	5d                   	pop    rbp
  809513:	c3                   	ret    

0000000000809514 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  809514:	f3 0f 1e fa          	endbr64 
  809518:	55                   	push   rbp
  809519:	48 89 e5             	mov    rbp,rsp
  80951c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809520:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809524:	90                   	nop
  809525:	5d                   	pop    rbp
  809526:	c3                   	ret    

0000000000809527 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  809527:	f3 0f 1e fa          	endbr64 
  80952b:	55                   	push   rbp
  80952c:	48 89 e5             	mov    rbp,rsp
  80952f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809533:	90                   	nop
  809534:	5d                   	pop    rbp
  809535:	c3                   	ret    

0000000000809536 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  809536:	f3 0f 1e fa          	endbr64 
  80953a:	55                   	push   rbp
  80953b:	48 89 e5             	mov    rbp,rsp
  80953e:	48 83 ec 10          	sub    rsp,0x10
  809542:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  809546:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80954a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80954e:	48 89 c7             	mov    rdi,rax
  809551:	e8 53 7c ff ff       	call   8011a9 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  809556:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80955a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80955d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809561:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809565:	48 89 c7             	mov    rdi,rax
  809568:	e8 3c 7c ff ff       	call   8011a9 <vmfree>
	vmfree(sb->root->dir_inode);
  80956d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809571:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809574:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809578:	48 89 c7             	mov    rdi,rax
  80957b:	e8 29 7c ff ff       	call   8011a9 <vmfree>
	vmfree(sb->root);
  809580:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809584:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809587:	48 89 c7             	mov    rdi,rax
  80958a:	e8 1a 7c ff ff       	call   8011a9 <vmfree>
	vmfree(sb);
  80958f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809593:	48 89 c7             	mov    rdi,rax
  809596:	e8 0e 7c ff ff       	call   8011a9 <vmfree>
}
  80959b:	90                   	nop
  80959c:	c9                   	leave  
  80959d:	c3                   	ret    

000000000080959e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80959e:	f3 0f 1e fa          	endbr64 
  8095a2:	55                   	push   rbp
  8095a3:	48 89 e5             	mov    rbp,rsp
  8095a6:	48 83 ec 40          	sub    rsp,0x40
  8095aa:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  8095ae:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8095b5:	00 
	struct FAT32_Directory * buf = NULL;
  8095b6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8095bd:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  8095be:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095c2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8095c6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  8095ca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8095ce:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8095d2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8095d6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  8095da:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8095e1:	00 

	if(finode->dentry_location == 0)
  8095e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095e6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8095ea:	48 85 c0             	test   rax,rax
  8095ed:	75 14                	jne    809603 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  8095ef:	bf 2c 33 81 00       	mov    edi,0x81332c
  8095f4:	b8 00 00 00 00       	mov    eax,0x0
  8095f9:	e8 04 77 ff ff       	call   800d02 <printf>
		return ;
  8095fe:	e9 30 01 00 00       	jmp    809733 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  809603:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809607:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80960b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80960f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809613:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809617:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80961b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80961f:	48 0f af c2          	imul   rax,rdx
  809623:	48 01 c8             	add    rax,rcx
  809626:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80962a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80962e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809632:	be 00 00 00 00       	mov    esi,0x0
  809637:	48 89 c7             	mov    rdi,rax
  80963a:	b8 00 00 00 00       	mov    eax,0x0
  80963f:	e8 d6 7a ff ff       	call   80111a <vmalloc>
  809644:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  809648:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80964c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809650:	89 c2                	mov    edx,eax
  809652:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809656:	be 00 00 00 00       	mov    esi,0x0
  80965b:	48 89 c7             	mov    rdi,rax
  80965e:	e8 bd 11 00 00       	call   80a820 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809663:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809667:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80966b:	89 c1                	mov    ecx,eax
  80966d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809671:	89 c2                	mov    edx,eax
  809673:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809677:	49 89 c0             	mov    r8,rax
  80967a:	be 00 00 00 00       	mov    esi,0x0
  80967f:	bf 00 00 00 00       	mov    edi,0x0
  809684:	e8 6a d6 ff ff       	call   806cf3 <request>
  809689:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80968c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80968f:	89 c7                	mov    edi,eax
  809691:	e8 11 dd ff ff       	call   8073a7 <chk_result>
    fdentry = buf+finode->dentry_position;
  809696:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80969a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80969e:	48 c1 e0 05          	shl    rax,0x5
  8096a2:	48 89 c2             	mov    rdx,rax
  8096a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096a9:	48 01 d0             	add    rax,rdx
  8096ac:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  8096b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8096b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8096b7:	89 c2                	mov    edx,eax
  8096b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096bd:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  8096c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8096c7:	89 c2                	mov    edx,eax
  8096c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096cd:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  8096d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096d5:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  8096d9:	66 25 00 f0          	and    ax,0xf000
  8096dd:	89 c2                	mov    edx,eax
  8096df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8096e6:	48 c1 e8 10          	shr    rax,0x10
  8096ea:	09 c2                	or     edx,eax
  8096ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096f0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8096f4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096fc:	89 c1                	mov    ecx,eax
  8096fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809702:	89 c2                	mov    edx,eax
  809704:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809708:	49 89 c0             	mov    r8,rax
  80970b:	be 01 00 00 00       	mov    esi,0x1
  809710:	bf 00 00 00 00       	mov    edi,0x0
  809715:	e8 d9 d5 ff ff       	call   806cf3 <request>
  80971a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80971d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  809720:	89 c7                	mov    edi,eax
  809722:	e8 80 dc ff ff       	call   8073a7 <chk_result>
	vmfree(buf);
  809727:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80972b:	48 89 c7             	mov    rdi,rax
  80972e:	e8 76 7a ff ff       	call   8011a9 <vmfree>
}
  809733:	c9                   	leave  
  809734:	c3                   	ret    

0000000000809735 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  809735:	f3 0f 1e fa          	endbr64 
  809739:	55                   	push   rbp
  80973a:	48 89 e5             	mov    rbp,rsp
  80973d:	48 83 ec 50          	sub    rsp,0x50
  809741:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  809745:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  809749:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809750:	00 
	struct FAT32_inode_info * finode = NULL;
  809751:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809758:	00 
	struct FAT32_BootSector * fbs = NULL;
  809759:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809760:	00 
	struct FAT32_sb_info * fsbi = NULL;
  809761:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809768:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  809769:	be 00 00 00 00       	mov    esi,0x0
  80976e:	bf 18 00 00 00       	mov    edi,0x18
  809773:	b8 00 00 00 00       	mov    eax,0x0
  809778:	e8 9d 79 ff ff       	call   80111a <vmalloc>
  80977d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  809781:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809785:	ba 18 00 00 00       	mov    edx,0x18
  80978a:	be 00 00 00 00       	mov    esi,0x0
  80978f:	48 89 c7             	mov    rdi,rax
  809792:	e8 89 10 00 00       	call   80a820 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  809797:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80979b:	48 c7 40 08 e0 b3 80 	mov    QWORD PTR [rax+0x8],0x80b3e0
  8097a2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  8097a3:	be 00 00 00 00       	mov    esi,0x0
  8097a8:	bf 60 00 00 00       	mov    edi,0x60
  8097ad:	b8 00 00 00 00       	mov    eax,0x0
  8097b2:	e8 63 79 ff ff       	call   80111a <vmalloc>
  8097b7:	48 89 c2             	mov    rdx,rax
  8097ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097be:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  8097c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097c6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097ca:	ba 60 00 00 00       	mov    edx,0x60
  8097cf:	be 00 00 00 00       	mov    esi,0x0
  8097d4:	48 89 c7             	mov    rdi,rax
  8097d7:	e8 44 10 00 00       	call   80a820 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  8097dc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8097e0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  8097e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097ec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  8097f0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8097f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8097f7:	89 c2                	mov    edx,eax
  8097f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8097fd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  809800:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809804:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809807:	89 c2                	mov    edx,eax
  809809:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80980d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  809811:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809815:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  809819:	0f b6 d0             	movzx  edx,al
  80981c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809820:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  809824:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809828:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80982c:	0f b6 d0             	movzx  edx,al
  80982f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809833:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809837:	0f b7 c0             	movzx  eax,ax
  80983a:	0f af c2             	imul   eax,edx
  80983d:	48 63 d0             	movsxd rdx,eax
  809840:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809844:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  809848:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80984c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809850:	0f b7 d0             	movzx  edx,ax
  809853:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809857:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80985b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80985f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  809862:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809866:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80986a:	0f b7 c0             	movzx  eax,ax
  80986d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  809870:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809874:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  809877:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80987b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80987f:	0f b6 c0             	movzx  eax,al
  809882:	0f af c2             	imul   eax,edx
  809885:	01 c8                	add    eax,ecx
  809887:	89 c2                	mov    edx,eax
  809889:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80988d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  809891:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809895:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  809898:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80989c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  8098a0:	0f b7 c0             	movzx  eax,ax
  8098a3:	01 d0                	add    eax,edx
  8098a5:	89 c2                	mov    edx,eax
  8098a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098ab:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  8098af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098b3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8098b6:	89 c2                	mov    edx,eax
  8098b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098bc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  8098c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098c4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  8098c8:	0f b6 d0             	movzx  edx,al
  8098cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098cf:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  8098d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098d7:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  8098db:	0f b7 d0             	movzx  edx,ax
  8098de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098e2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  8098e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098ea:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  8098ee:	0f b7 d0             	movzx  edx,ax
  8098f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098f5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  8098f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098fd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  809900:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809904:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  809908:	0f b7 d0             	movzx  edx,ax
  80990b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80990f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809913:	0f b7 c0             	movzx  eax,ax
  809916:	89 c6                	mov    esi,eax
  809918:	bf 48 33 81 00       	mov    edi,0x813348
  80991d:	b8 00 00 00 00       	mov    eax,0x0
  809922:	e8 db 73 ff ff       	call   800d02 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  809927:	be 00 00 00 00       	mov    esi,0x0
  80992c:	bf 00 02 00 00       	mov    edi,0x200
  809931:	b8 00 00 00 00       	mov    eax,0x0
  809936:	e8 df 77 ff ff       	call   80111a <vmalloc>
  80993b:	48 89 c2             	mov    rdx,rax
  80993e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809942:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  809946:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80994a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80994e:	ba 00 02 00 00       	mov    edx,0x200
  809953:	be 00 00 00 00       	mov    esi,0x0
  809958:	48 89 c7             	mov    rdi,rax
  80995b:	e8 c0 0e 00 00       	call   80a820 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  809960:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809964:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  809968:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80996c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80996f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809973:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809977:	0f b7 c0             	movzx  eax,ax
  80997a:	01 c8                	add    eax,ecx
  80997c:	49 89 d0             	mov    r8,rdx
  80997f:	b9 01 00 00 00       	mov    ecx,0x1
  809984:	89 c2                	mov    edx,eax
  809986:	be 00 00 00 00       	mov    esi,0x0
  80998b:	bf 00 00 00 00       	mov    edi,0x0
  809990:	e8 5e d3 ff ff       	call   806cf3 <request>
  809995:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  809998:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80999b:	89 c7                	mov    edi,eax
  80999d:	e8 05 da ff ff       	call   8073a7 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  8099a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099a6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8099aa:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  8099b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099b4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8099b8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  8099be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099c2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8099c6:	8b 00                	mov    eax,DWORD PTR [rax]
  8099c8:	89 c6                	mov    esi,eax
  8099ca:	bf 90 33 81 00       	mov    edi,0x813390
  8099cf:	b8 00 00 00 00       	mov    eax,0x0
  8099d4:	e8 29 73 ff ff       	call   800d02 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  8099d9:	be 00 00 00 00       	mov    esi,0x0
  8099de:	bf 48 00 00 00       	mov    edi,0x48
  8099e3:	b8 00 00 00 00       	mov    eax,0x0
  8099e8:	e8 2d 77 ff ff       	call   80111a <vmalloc>
  8099ed:	48 89 c2             	mov    rdx,rax
  8099f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099f4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  8099f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8099fe:	ba 48 00 00 00       	mov    edx,0x48
  809a03:	be 00 00 00 00       	mov    esi,0x0
  809a08:	48 89 c7             	mov    rdi,rax
  809a0b:	e8 10 0e 00 00       	call   80a820 <memset>

	list_init(&sbp->root->child_node);
  809a10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a14:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a17:	48 83 c0 10          	add    rax,0x10
  809a1b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  809a1f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a23:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809a27:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809a2a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a2e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809a32:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809a36:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  809a37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a3b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a3e:	48 83 c0 20          	add    rax,0x20
  809a42:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  809a46:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a4a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809a4e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809a51:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809a55:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809a59:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809a5d:	90                   	nop
	sbp->root->parent = sbp->root;
  809a5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a62:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a65:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809a69:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  809a6c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  809a70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a77:	48 c7 40 40 c0 b3 80 	mov    QWORD PTR [rax+0x40],0x80b3c0
  809a7e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  809a7f:	be 00 00 00 00       	mov    esi,0x0
  809a84:	bf 02 00 00 00       	mov    edi,0x2
  809a89:	b8 00 00 00 00       	mov    eax,0x0
  809a8e:	e8 87 76 ff ff       	call   80111a <vmalloc>
  809a93:	48 89 c2             	mov    rdx,rax
  809a96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a9a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a9d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  809aa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809aa4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809aa7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809aaa:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  809aad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ab1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ab4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  809abb:	be 00 00 00 00       	mov    esi,0x0
  809ac0:	bf 38 00 00 00       	mov    edi,0x38
  809ac5:	b8 00 00 00 00       	mov    eax,0x0
  809aca:	e8 4b 76 ff ff       	call   80111a <vmalloc>
  809acf:	48 89 c2             	mov    rdx,rax
  809ad2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ad6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ad9:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  809add:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ae1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ae4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ae8:	ba 38 00 00 00       	mov    edx,0x38
  809aed:	be 00 00 00 00       	mov    esi,0x0
  809af2:	48 89 c7             	mov    rdi,rax
  809af5:	e8 26 0d 00 00       	call   80a820 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  809afa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809afe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b01:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b05:	48 c7 40 28 80 b3 80 	mov    QWORD PTR [rax+0x28],0x80b380
  809b0c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  809b0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b14:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b18:	48 c7 40 20 40 b3 80 	mov    QWORD PTR [rax+0x20],0x80b340
  809b1f:	00 
	sbp->root->dir_inode->file_size = 0;
  809b20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b27:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b2b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809b32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b36:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b39:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b3d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809b40:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809b44:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809b48:	48 01 d0             	add    rax,rdx
  809b4b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809b4f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809b53:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  809b57:	48 89 c6             	mov    rsi,rax
  809b5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b5e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b61:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  809b65:	48 89 d0             	mov    rax,rdx
  809b68:	ba 00 00 00 00       	mov    edx,0x0
  809b6d:	48 f7 f6             	div    rsi
  809b70:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  809b74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b78:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b7b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b7f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  809b86:	00 
	sbp->root->dir_inode->sb = sbp;
  809b87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b8b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b8e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b92:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809b96:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  809b9a:	be 00 00 00 00       	mov    esi,0x0
  809b9f:	bf 20 00 00 00       	mov    edi,0x20
  809ba4:	b8 00 00 00 00       	mov    eax,0x0
  809ba9:	e8 6c 75 ff ff       	call   80111a <vmalloc>
  809bae:	48 89 c2             	mov    rdx,rax
  809bb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bb5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809bb8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bbc:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  809bc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bc4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809bc7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bcb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bcf:	ba 20 00 00 00       	mov    edx,0x20
  809bd4:	be 00 00 00 00       	mov    esi,0x0
  809bd9:	48 89 c7             	mov    rdi,rax
  809bdc:	e8 3f 0c 00 00       	call   80a820 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  809be1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809be5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809be8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bf0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  809bf4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809bf8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  809bfb:	89 c2                	mov    edx,eax
  809bfd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c01:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  809c04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c08:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  809c0f:	00 
	finode->dentry_position = 0; 
  809c10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c14:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  809c1b:	00 
	finode->create_date = 0;
  809c1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c20:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  809c26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c2a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  809c30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c34:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  809c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c3e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  809c44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809c48:	c9                   	leave  
  809c49:	c3                   	ret    

0000000000809c4a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  809c4a:	f3 0f 1e fa          	endbr64 
  809c4e:	55                   	push   rbp
  809c4f:	48 89 e5             	mov    rbp,rsp
  809c52:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  809c59:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809c60:	00 
	struct Disk_Partition_Table DPT = {0};
  809c61:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809c68:	b8 00 00 00 00       	mov    eax,0x0
  809c6d:	b9 40 00 00 00       	mov    ecx,0x40
  809c72:	48 89 d7             	mov    rdi,rdx
  809c75:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  809c78:	bf 00 b4 80 00       	mov    edi,0x80b400
  809c7d:	e8 b7 c1 ff ff       	call   805e39 <register_filesystem>
	
	memset(buf,0,512);
  809c82:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809c89:	ba 00 02 00 00       	mov    edx,0x200
  809c8e:	be 00 00 00 00       	mov    esi,0x0
  809c93:	48 89 c7             	mov    rdi,rax
  809c96:	e8 85 0b 00 00       	call   80a820 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  809c9b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809ca2:	49 89 c0             	mov    r8,rax
  809ca5:	b9 01 00 00 00       	mov    ecx,0x1
  809caa:	ba 00 00 00 00       	mov    edx,0x0
  809caf:	be 00 00 00 00       	mov    esi,0x0
  809cb4:	bf 00 00 00 00       	mov    edi,0x0
  809cb9:	e8 35 d0 ff ff       	call   806cf3 <request>
  809cbe:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  809cc1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809cc4:	89 c7                	mov    edi,eax
  809cc6:	e8 dc d6 ff ff       	call   8073a7 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  809ccb:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  809cd2:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  809cd9:	48 89 d6             	mov    rsi,rdx
  809cdc:	ba 40 00 00 00       	mov    edx,0x40
  809ce1:	48 89 c7             	mov    rdi,rax
  809ce4:	48 89 d1             	mov    rcx,rdx
  809ce7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  809cea:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  809cf1:	0f b6 d0             	movzx  edx,al
  809cf4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809cfa:	89 c6                	mov    esi,eax
  809cfc:	bf d8 33 81 00       	mov    edi,0x8133d8
  809d01:	b8 00 00 00 00       	mov    eax,0x0
  809d06:	e8 f7 6f ff ff       	call   800d02 <printf>

	memset(buf,0,512);
  809d0b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809d12:	ba 00 02 00 00       	mov    edx,0x200
  809d17:	be 00 00 00 00       	mov    esi,0x0
  809d1c:	48 89 c7             	mov    rdi,rax
  809d1f:	e8 fc 0a 00 00       	call   80a820 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  809d24:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809d2a:	89 c2                	mov    edx,eax
  809d2c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809d33:	49 89 c0             	mov    r8,rax
  809d36:	b9 01 00 00 00       	mov    ecx,0x1
  809d3b:	be 00 00 00 00       	mov    esi,0x0
  809d40:	bf 00 00 00 00       	mov    edi,0x0
  809d45:	e8 a9 cf ff ff       	call   806cf3 <request>
  809d4a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  809d4d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809d50:	89 c7                	mov    edi,eax
  809d52:	e8 50 d6 ff ff       	call   8073a7 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  809d57:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809d5e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809d65:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  809d6c:	48 89 c2             	mov    rdx,rax
  809d6f:	48 89 ce             	mov    rsi,rcx
  809d72:	bf d2 33 81 00       	mov    edi,0x8133d2
  809d77:	e8 45 c0 ff ff       	call   805dc1 <mount_fs>
  809d7c:	48 89 05 25 d8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1d825],rax        # 4275a8 <root_sb>
}
  809d83:	90                   	nop
  809d84:	c9                   	leave  
  809d85:	c3                   	ret    

0000000000809d86 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  809d86:	f3 0f 1e fa          	endbr64 
  809d8a:	55                   	push   rbp
  809d8b:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809d8e:	48 8b 05 93 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20793]        # 42a528 <vpage_base>
  809d95:	48 05 a0 00 00 00    	add    rax,0xa0
  809d9b:	48 89 05 86 07 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20786],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809da2:	8b 05 88 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20788]        # 42a530 <page_boffset>
  809da8:	05 a0 00 00 00       	add    eax,0xa0
  809dad:	89 05 7d 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2077d],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  809db3:	48 8b 15 6e 07 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2076e]        # 42a528 <vpage_base>
  809dba:	48 8b 05 5f 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2075f]        # 42a520 <video_end>
  809dc1:	48 39 c2             	cmp    rdx,rax
  809dc4:	72 0e                	jb     809dd4 <scrdown+0x4e>
        vpage_base=video_base;
  809dc6:	48 8b 05 4b 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2074b]        # 42a518 <video_base>
  809dcd:	48 89 05 54 07 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20754],rax        # 42a528 <vpage_base>
    set_origin();
  809dd4:	b8 00 00 00 00       	mov    eax,0x0
  809dd9:	e8 6a 00 00 00       	call   809e48 <set_origin>
}
  809dde:	90                   	nop
  809ddf:	5d                   	pop    rbp
  809de0:	c3                   	ret    

0000000000809de1 <scrup>:
void scrup()
{
  809de1:	f3 0f 1e fa          	endbr64 
  809de5:	55                   	push   rbp
  809de6:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  809de9:	8b 05 41 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20741]        # 42a530 <page_boffset>
  809def:	85 c0                	test   eax,eax
  809df1:	75 24                	jne    809e17 <scrup+0x36>
    {
        page_boffset=0;
  809df3:	c7 05 33 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20733],0x0        # 42a530 <page_boffset>
  809dfa:	00 00 00 
        vpage_base=video_base;
  809dfd:	48 8b 05 14 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20714]        # 42a518 <video_base>
  809e04:	48 89 05 1d 07 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2071d],rax        # 42a528 <vpage_base>
        set_origin();
  809e0b:	b8 00 00 00 00       	mov    eax,0x0
  809e10:	e8 33 00 00 00       	call   809e48 <set_origin>
        return;
  809e15:	eb 2f                	jmp    809e46 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  809e17:	48 8b 05 0a 07 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2070a]        # 42a528 <vpage_base>
  809e1e:	48 2d a0 00 00 00    	sub    rax,0xa0
  809e24:	48 89 05 fd 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206fd],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809e2b:	8b 05 ff 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206ff]        # 42a530 <page_boffset>
  809e31:	2d a0 00 00 00       	sub    eax,0xa0
  809e36:	89 05 f4 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206f4],eax        # 42a530 <page_boffset>
    set_origin();
  809e3c:	b8 00 00 00 00       	mov    eax,0x0
  809e41:	e8 02 00 00 00       	call   809e48 <set_origin>
}
  809e46:	5d                   	pop    rbp
  809e47:	c3                   	ret    

0000000000809e48 <set_origin>:
void set_origin(void)
{
  809e48:	f3 0f 1e fa          	endbr64 
  809e4c:	55                   	push   rbp
  809e4d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809e50:	fa                   	cli    
    outb(port_reg_index,12);
  809e51:	8b 05 e9 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206e9]        # 42a540 <port_reg_index>
  809e57:	0f b7 c0             	movzx  eax,ax
  809e5a:	be 0c 00 00 00       	mov    esi,0xc
  809e5f:	89 c7                	mov    edi,eax
  809e61:	e8 da a9 ff ff       	call   804840 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  809e66:	8b 05 c4 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206c4]        # 42a530 <page_boffset>
  809e6c:	c1 e8 09             	shr    eax,0x9
  809e6f:	0f b6 d0             	movzx  edx,al
  809e72:	8b 05 cc 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206cc]        # 42a544 <port_reg_v>
  809e78:	0f b7 c0             	movzx  eax,ax
  809e7b:	89 d6                	mov    esi,edx
  809e7d:	89 c7                	mov    edi,eax
  809e7f:	e8 bc a9 ff ff       	call   804840 <outb>
    outb(port_reg_index,13);
  809e84:	8b 05 b6 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206b6]        # 42a540 <port_reg_index>
  809e8a:	0f b7 c0             	movzx  eax,ax
  809e8d:	be 0d 00 00 00       	mov    esi,0xd
  809e92:	89 c7                	mov    edi,eax
  809e94:	e8 a7 a9 ff ff       	call   804840 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  809e99:	8b 05 91 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20691]        # 42a530 <page_boffset>
  809e9f:	d1 e8                	shr    eax,1
  809ea1:	0f b6 d0             	movzx  edx,al
  809ea4:	8b 05 9a 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2069a]        # 42a544 <port_reg_v>
  809eaa:	0f b7 c0             	movzx  eax,ax
  809ead:	89 d6                	mov    esi,edx
  809eaf:	89 c7                	mov    edi,eax
  809eb1:	e8 8a a9 ff ff       	call   804840 <outb>
    asm volatile("sti");
  809eb6:	fb                   	sti    

}
  809eb7:	90                   	nop
  809eb8:	5d                   	pop    rbp
  809eb9:	c3                   	ret    

0000000000809eba <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  809eba:	f3 0f 1e fa          	endbr64 
  809ebe:	55                   	push   rbp
  809ebf:	48 89 e5             	mov    rbp,rsp
  809ec2:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  809ec6:	be 08 36 81 00       	mov    esi,0x813608
  809ecb:	bf b4 34 81 00       	mov    edi,0x8134b4
  809ed0:	e8 9a 09 00 00       	call   80a86f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  809ed5:	be 0d 36 81 00       	mov    esi,0x81360d
  809eda:	bf 74 35 81 00       	mov    edi,0x813574
  809edf:	e8 8b 09 00 00       	call   80a86f <strcpy>
    reg_driver(&drv_tty);
  809ee4:	bf 00 34 81 00       	mov    edi,0x813400
  809ee9:	e8 c7 87 ff ff       	call   8026b5 <reg_driver>
    reg_device(&dev_tty);
  809eee:	bf a0 34 81 00       	mov    edi,0x8134a0
  809ef3:	e8 d5 84 ff ff       	call   8023cd <reg_device>
    reg_device(&dev_stdout);
  809ef8:	bf 60 35 81 00       	mov    edi,0x813560
  809efd:	e8 cb 84 ff ff       	call   8023cd <reg_device>
    unsigned char *vp=0x20000;
  809f02:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  809f09:	00 
    if(*vp==0x7)
  809f0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f11:	3c 07                	cmp    al,0x7
  809f13:	75 36                	jne    809f4b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  809f15:	c7 05 15 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20615],0x0        # 42a534 <video_mode>
  809f1c:	00 00 00 
        video_base=0xb0000;
  809f1f:	48 c7 05 ee 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc205ee],0xb0000        # 42a518 <video_base>
  809f26:	00 00 0b 00 
        video_end=0xb8000-1;
  809f2a:	48 c7 05 eb 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc205eb],0xb7fff        # 42a520 <video_end>
  809f31:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  809f35:	c7 05 01 06 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc20601],0x3b4        # 42a540 <port_reg_index>
  809f3c:	03 00 00 
        port_reg_v=0x3b5;
  809f3f:	c7 05 fb 05 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc205fb],0x3b5        # 42a544 <port_reg_v>
  809f46:	03 00 00 
  809f49:	eb 61                	jmp    809fac <init_tty+0xf2>
    }else if(*vp<=0x3)
  809f4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f52:	3c 03                	cmp    al,0x3
  809f54:	77 36                	ja     809f8c <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  809f56:	c7 05 d4 05 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc205d4],0x1        # 42a534 <video_mode>
  809f5d:	00 00 00 
        video_base=0xb8000;
  809f60:	48 c7 05 ad 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc205ad],0xb8000        # 42a518 <video_base>
  809f67:	00 80 0b 00 
        video_end=0xc0000-1;
  809f6b:	48 c7 05 aa 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc205aa],0xbffff        # 42a520 <video_end>
  809f72:	ff ff 0b 00 
        port_reg_index=0x3d4;
  809f76:	c7 05 c0 05 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc205c0],0x3d4        # 42a540 <port_reg_index>
  809f7d:	03 00 00 
        port_reg_v=0x3d5;
  809f80:	c7 05 ba 05 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc205ba],0x3d5        # 42a544 <port_reg_v>
  809f87:	03 00 00 
  809f8a:	eb 20                	jmp    809fac <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809f8c:	c7 05 9e 05 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc2059e],0x2        # 42a534 <video_mode>
  809f93:	00 00 00 
        video_base=0xa0000;
  809f96:	48 c7 05 77 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20577],0xa0000        # 42a518 <video_base>
  809f9d:	00 00 0a 00 
        video_end=0xb0000-1;
  809fa1:	48 c7 05 74 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20574],0xaffff        # 42a520 <video_end>
  809fa8:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  809fac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fb0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fb3:	3c 01                	cmp    al,0x1
  809fb5:	77 0f                	ja     809fc6 <init_tty+0x10c>
  809fb7:	c7 05 7b 05 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2057b],0x28        # 42a53c <line_chs>
  809fbe:	00 00 00 
  809fc1:	e9 91 00 00 00       	jmp    80a057 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  809fc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fcd:	3c 03                	cmp    al,0x3
  809fcf:	76 0b                	jbe    809fdc <init_tty+0x122>
  809fd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fd5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fd8:	3c 07                	cmp    al,0x7
  809fda:	75 0c                	jne    809fe8 <init_tty+0x12e>
  809fdc:	c7 05 56 05 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc20556],0x50        # 42a53c <line_chs>
  809fe3:	00 00 00 
  809fe6:	eb 6f                	jmp    80a057 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  809fe8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fef:	3c 05                	cmp    al,0x5
  809ff1:	76 16                	jbe    80a009 <init_tty+0x14f>
  809ff3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ff7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ffa:	3c 09                	cmp    al,0x9
  809ffc:	74 0b                	je     80a009 <init_tty+0x14f>
  809ffe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a002:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a005:	3c 0d                	cmp    al,0xd
  80a007:	75 0c                	jne    80a015 <init_tty+0x15b>
  80a009:	c7 05 29 05 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc20529],0x140        # 42a53c <line_chs>
  80a010:	01 00 00 
  80a013:	eb 42                	jmp    80a057 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80a015:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a019:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a01c:	3c 06                	cmp    al,0x6
  80a01e:	74 16                	je     80a036 <init_tty+0x17c>
  80a020:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a024:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a027:	3c 0a                	cmp    al,0xa
  80a029:	74 0b                	je     80a036 <init_tty+0x17c>
  80a02b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a02f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a032:	3c 0d                	cmp    al,0xd
  80a034:	76 0c                	jbe    80a042 <init_tty+0x188>
  80a036:	c7 05 fc 04 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc204fc],0x280        # 42a53c <line_chs>
  80a03d:	02 00 00 
  80a040:	eb 15                	jmp    80a057 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80a042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a046:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a049:	3c 08                	cmp    al,0x8
  80a04b:	75 0a                	jne    80a057 <init_tty+0x19d>
  80a04d:	c7 05 e5 04 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc204e5],0xa0        # 42a53c <line_chs>
  80a054:	00 00 00 
    switch (*vp)
  80a057:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a05b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a05e:	0f b6 c0             	movzx  eax,al
  80a061:	83 f8 14             	cmp    eax,0x14
  80a064:	77 61                	ja     80a0c7 <init_tty+0x20d>
  80a066:	89 c0                	mov    eax,eax
  80a068:	48 8b 04 c5 18 36 81 	mov    rax,QWORD PTR [rax*8+0x813618]
  80a06f:	00 
  80a070:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80a073:	c7 05 cb 04 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc204cb],0x3e8        # 42a548 <vpage_size>
  80a07a:	03 00 00 
  80a07d:	eb 49                	jmp    80a0c8 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80a07f:	c7 05 bf 04 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc204bf],0x7d0        # 42a548 <vpage_size>
  80a086:	07 00 00 
  80a089:	eb 3d                	jmp    80a0c8 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80a08b:	c7 05 b3 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc204b3],0xfa00        # 42a548 <vpage_size>
  80a092:	fa 00 00 
  80a095:	eb 31                	jmp    80a0c8 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80a097:	c7 05 a7 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc204a7],0x1f400        # 42a548 <vpage_size>
  80a09e:	f4 01 00 
  80a0a1:	eb 25                	jmp    80a0c8 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80a0a3:	c7 05 9b 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2049b],0x7d00        # 42a548 <vpage_size>
  80a0aa:	7d 00 00 
  80a0ad:	eb 19                	jmp    80a0c8 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80a0af:	c7 05 8f 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2048f],0x36b00        # 42a548 <vpage_size>
  80a0b6:	6b 03 00 
  80a0b9:	eb 0d                	jmp    80a0c8 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80a0bb:	c7 05 83 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20483],0x4b000        # 42a548 <vpage_size>
  80a0c2:	b0 04 00 
  80a0c5:	eb 01                	jmp    80a0c8 <init_tty+0x20e>
    default:
        break;
  80a0c7:	90                   	nop
    }
    m_ptr=video_base;
  80a0c8:	48 8b 05 49 04 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20449]        # 42a518 <video_base>
  80a0cf:	48 89 05 4a 13 00 00 	mov    QWORD PTR [rip+0x134a],rax        # 80b420 <m_ptr>
    page_boffset=0;
  80a0d6:	c7 05 50 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20450],0x0        # 42a530 <page_boffset>
  80a0dd:	00 00 00 
    vpage_base=video_base;
  80a0e0:	48 8b 05 31 04 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20431]        # 42a518 <video_base>
  80a0e7:	48 89 05 3a 04 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2043a],rax        # 42a528 <vpage_base>
    vp++;
  80a0ee:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80a0f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0fa:	0f b6 c0             	movzx  eax,al
  80a0fd:	89 05 35 04 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20435],eax        # 42a538 <vpage>
    vp++;
  80a103:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80a108:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a10c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a110:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a114:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a117:	0f b6 c0             	movzx  eax,al
  80a11a:	89 05 34 04 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20434],eax        # 42a554 <stline>
    endline=*vp++;
  80a120:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a124:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a128:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a12c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a12f:	0f b6 c0             	movzx  eax,al
  80a132:	89 05 20 04 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20420],eax        # 42a558 <endline>
    videoy=*vp++;
  80a138:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a13c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a140:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a144:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a147:	0f b6 c0             	movzx  eax,al
  80a14a:	89 05 00 04 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20400],eax        # 42a550 <videoy>
    videox=*vp;
  80a150:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a154:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a157:	0f b6 c0             	movzx  eax,al
  80a15a:	89 05 ec 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc203ec],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80a160:	90                   	nop
  80a161:	c9                   	leave  
  80a162:	c3                   	ret    

000000000080a163 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80a163:	f3 0f 1e fa          	endbr64 
  80a167:	55                   	push   rbp
  80a168:	48 89 e5             	mov    rbp,rsp
  80a16b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80a16f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a173:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80a176:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80a179:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a17c:	05 00 c0 05 00       	add    eax,0x5c000
  80a181:	01 c0                	add    eax,eax
  80a183:	48 98                	cdqe   
  80a185:	48 89 05 94 12 00 00 	mov    QWORD PTR [rip+0x1294],rax        # 80b420 <m_ptr>
}
  80a18c:	90                   	nop
  80a18d:	5d                   	pop    rbp
  80a18e:	c3                   	ret    

000000000080a18f <tell_monitor>:
int tell_monitor()
{
  80a18f:	f3 0f 1e fa          	endbr64 
  80a193:	55                   	push   rbp
  80a194:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80a197:	48 8b 05 82 12 00 00 	mov    rax,QWORD PTR [rip+0x1282]        # 80b420 <m_ptr>
  80a19e:	48 8b 15 73 03 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20373]        # 42a518 <video_base>
  80a1a5:	48 29 d0             	sub    rax,rdx
  80a1a8:	48 89 c2             	mov    rdx,rax
  80a1ab:	48 c1 ea 3f          	shr    rdx,0x3f
  80a1af:	48 01 d0             	add    rax,rdx
  80a1b2:	48 d1 f8             	sar    rax,1
}
  80a1b5:	5d                   	pop    rbp
  80a1b6:	c3                   	ret    

000000000080a1b7 <del_ch>:
void del_ch()
{
  80a1b7:	f3 0f 1e fa          	endbr64 
  80a1bb:	55                   	push   rbp
  80a1bc:	48 89 e5             	mov    rbp,rsp
  80a1bf:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80a1c6:	48 8b 05 53 12 00 00 	mov    rax,QWORD PTR [rip+0x1253]        # 80b420 <m_ptr>
  80a1cd:	48 83 e8 02          	sub    rax,0x2
  80a1d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80a1d5:	b8 00 00 00 00       	mov    eax,0x0
  80a1da:	e8 b0 ff ff ff       	call   80a18f <tell_monitor>
  80a1df:	89 c2                	mov    edx,eax
  80a1e1:	48 63 c2             	movsxd rax,edx
  80a1e4:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80a1eb:	48 c1 e8 20          	shr    rax,0x20
  80a1ef:	c1 f8 05             	sar    eax,0x5
  80a1f2:	89 d1                	mov    ecx,edx
  80a1f4:	c1 f9 1f             	sar    ecx,0x1f
  80a1f7:	29 c8                	sub    eax,ecx
  80a1f9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80a1fc:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80a1ff:	89 c8                	mov    eax,ecx
  80a201:	c1 e0 02             	shl    eax,0x2
  80a204:	01 c8                	add    eax,ecx
  80a206:	c1 e0 04             	shl    eax,0x4
  80a209:	29 c2                	sub    edx,eax
  80a20b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80a20e:	eb 17                	jmp    80a227 <del_ch+0x70>
    {
        *p=*(p+2);
  80a210:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a214:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80a218:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a21c:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80a21e:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80a223:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a227:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80a22b:	7e e3                	jle    80a210 <del_ch+0x59>
    }
    driver_args args= {
  80a22d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80a234:	b8 00 00 00 00       	mov    eax,0x0
  80a239:	b9 18 00 00 00       	mov    ecx,0x18
  80a23e:	48 89 d7             	mov    rdi,rdx
  80a241:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80a244:	b8 00 00 00 00       	mov    eax,0x0
  80a249:	e8 41 ff ff ff       	call   80a18f <tell_monitor>
  80a24e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80a251:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80a257:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80a25e:	48 89 c7             	mov    rdi,rax
  80a261:	e8 fd fe ff ff       	call   80a163 <seek_tty>
    set_cur();
  80a266:	b8 00 00 00 00       	mov    eax,0x0
  80a26b:	e8 03 00 00 00       	call   80a273 <set_cur>
}
  80a270:	90                   	nop
  80a271:	c9                   	leave  
  80a272:	c3                   	ret    

000000000080a273 <set_cur>:
void set_cur()
{
  80a273:	f3 0f 1e fa          	endbr64 
  80a277:	55                   	push   rbp
  80a278:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80a27b:	fa                   	cli    
    outb(port_reg_index,14);
  80a27c:	8b 05 be 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc202be]        # 42a540 <port_reg_index>
  80a282:	0f b7 c0             	movzx  eax,ax
  80a285:	be 0e 00 00 00       	mov    esi,0xe
  80a28a:	89 c7                	mov    edi,eax
  80a28c:	e8 af a5 ff ff       	call   804840 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80a291:	48 8b 05 88 11 00 00 	mov    rax,QWORD PTR [rip+0x1188]        # 80b420 <m_ptr>
  80a298:	48 8b 15 79 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20279]        # 42a518 <video_base>
  80a29f:	48 29 d0             	sub    rax,rdx
  80a2a2:	48 c1 f8 09          	sar    rax,0x9
  80a2a6:	0f b6 d0             	movzx  edx,al
  80a2a9:	8b 05 95 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20295]        # 42a544 <port_reg_v>
  80a2af:	0f b7 c0             	movzx  eax,ax
  80a2b2:	89 d6                	mov    esi,edx
  80a2b4:	89 c7                	mov    edi,eax
  80a2b6:	e8 85 a5 ff ff       	call   804840 <outb>
    outb(port_reg_index,15);
  80a2bb:	8b 05 7f 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2027f]        # 42a540 <port_reg_index>
  80a2c1:	0f b7 c0             	movzx  eax,ax
  80a2c4:	be 0f 00 00 00       	mov    esi,0xf
  80a2c9:	89 c7                	mov    edi,eax
  80a2cb:	e8 70 a5 ff ff       	call   804840 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80a2d0:	48 8b 05 49 11 00 00 	mov    rax,QWORD PTR [rip+0x1149]        # 80b420 <m_ptr>
  80a2d7:	48 8b 15 3a 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2023a]        # 42a518 <video_base>
  80a2de:	48 29 d0             	sub    rax,rdx
  80a2e1:	48 d1 f8             	sar    rax,1
  80a2e4:	0f b6 d0             	movzx  edx,al
  80a2e7:	8b 05 57 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20257]        # 42a544 <port_reg_v>
  80a2ed:	0f b7 c0             	movzx  eax,ax
  80a2f0:	89 d6                	mov    esi,edx
  80a2f2:	89 c7                	mov    edi,eax
  80a2f4:	e8 47 a5 ff ff       	call   804840 <outb>
    asm volatile("sti");
  80a2f9:	fb                   	sti    
}
  80a2fa:	90                   	nop
  80a2fb:	5d                   	pop    rbp
  80a2fc:	c3                   	ret    

000000000080a2fd <read_tty>:

int read_tty(driver_args *args)
{
  80a2fd:	f3 0f 1e fa          	endbr64 
  80a301:	55                   	push   rbp
  80a302:	48 89 e5             	mov    rbp,rsp
  80a305:	48 83 ec 20          	sub    rsp,0x20
  80a309:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80a30d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a311:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a314:	48 98                	cdqe   
  80a316:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a31a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a31e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a321:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a324:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a32b:	eb 4a                	jmp    80a377 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80a32d:	48 8b 15 ec 10 00 00 	mov    rdx,QWORD PTR [rip+0x10ec]        # 80b420 <m_ptr>
  80a334:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a338:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a33c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a340:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a343:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80a345:	48 8b 05 d4 10 00 00 	mov    rax,QWORD PTR [rip+0x10d4]        # 80b420 <m_ptr>
  80a34c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80a352:	75 0d                	jne    80a361 <read_tty+0x64>
  80a354:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a358:	7e 07                	jle    80a361 <read_tty+0x64>
        {
            return 1;//读到尾了
  80a35a:	b8 01 00 00 00       	mov    eax,0x1
  80a35f:	eb 2d                	jmp    80a38e <read_tty+0x91>
        }
        m_ptr+=2;
  80a361:	48 8b 05 b8 10 00 00 	mov    rax,QWORD PTR [rip+0x10b8]        # 80b420 <m_ptr>
  80a368:	48 83 c0 02          	add    rax,0x2
  80a36c:	48 89 05 ad 10 00 00 	mov    QWORD PTR [rip+0x10ad],rax        # 80b420 <m_ptr>
    for(int i=0;i<len;i++)
  80a373:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a377:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a37a:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a37d:	7c ae                	jl     80a32d <read_tty+0x30>
    }
    set_cur();
  80a37f:	b8 00 00 00 00       	mov    eax,0x0
  80a384:	e8 ea fe ff ff       	call   80a273 <set_cur>
    return 0;
  80a389:	b8 00 00 00 00       	mov    eax,0x0
}
  80a38e:	c9                   	leave  
  80a38f:	c3                   	ret    

000000000080a390 <write_tty>:
int write_tty(driver_args *args)
{
  80a390:	f3 0f 1e fa          	endbr64 
  80a394:	55                   	push   rbp
  80a395:	48 89 e5             	mov    rbp,rsp
  80a398:	48 83 ec 30          	sub    rsp,0x30
  80a39c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80a3a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a3a4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a3a7:	48 98                	cdqe   
  80a3a9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a3ad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a3b1:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a3b4:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a3b7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a3be:	e9 0b 01 00 00       	jmp    80a4ce <write_tty+0x13e>
    {
        if(*src=='\n')
  80a3c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a3ca:	3c 0a                	cmp    al,0xa
  80a3cc:	75 50                	jne    80a41e <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80a3ce:	48 8b 05 4b 10 00 00 	mov    rax,QWORD PTR [rip+0x104b]        # 80b420 <m_ptr>
  80a3d5:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80a3db:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80a3de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a3e1:	89 c2                	mov    edx,eax
  80a3e3:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80a3e8:	48 0f af c2          	imul   rax,rdx
  80a3ec:	48 c1 e8 20          	shr    rax,0x20
  80a3f0:	c1 e8 07             	shr    eax,0x7
  80a3f3:	8d 50 01             	lea    edx,[rax+0x1]
  80a3f6:	89 d0                	mov    eax,edx
  80a3f8:	c1 e0 02             	shl    eax,0x2
  80a3fb:	01 d0                	add    eax,edx
  80a3fd:	c1 e0 05             	shl    eax,0x5
  80a400:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80a403:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a406:	05 00 80 0b 00       	add    eax,0xb8000
  80a40b:	89 c0                	mov    eax,eax
  80a40d:	48 89 05 0c 10 00 00 	mov    QWORD PTR [rip+0x100c],rax        # 80b420 <m_ptr>
            src++;
  80a414:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80a419:	e9 ac 00 00 00       	jmp    80a4ca <write_tty+0x13a>
        }else if(*src=='\0')
  80a41e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a422:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a425:	84 c0                	test   al,al
  80a427:	0f 84 af 00 00 00    	je     80a4dc <write_tty+0x14c>
            break;
        if(*src=='\b')
  80a42d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a431:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a434:	3c 08                	cmp    al,0x8
  80a436:	75 1e                	jne    80a456 <write_tty+0xc6>
        {
            m_ptr-=2;
  80a438:	48 8b 05 e1 0f 00 00 	mov    rax,QWORD PTR [rip+0xfe1]        # 80b420 <m_ptr>
  80a43f:	48 83 e8 02          	sub    rax,0x2
  80a443:	48 89 05 d6 0f 00 00 	mov    QWORD PTR [rip+0xfd6],rax        # 80b420 <m_ptr>
            *m_ptr=0;
  80a44a:	48 8b 05 cf 0f 00 00 	mov    rax,QWORD PTR [rip+0xfcf]        # 80b420 <m_ptr>
  80a451:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80a454:	eb 3e                	jmp    80a494 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80a456:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a45a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a45e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a462:	48 8b 05 b7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb7]        # 80b420 <m_ptr>
  80a469:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a46d:	48 89 0d ac 0f 00 00 	mov    QWORD PTR [rip+0xfac],rcx        # 80b420 <m_ptr>
  80a474:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a477:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80a479:	48 8b 05 a0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfa0]        # 80b420 <m_ptr>
  80a480:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a484:	48 89 15 95 0f 00 00 	mov    QWORD PTR [rip+0xf95],rdx        # 80b420 <m_ptr>
  80a48b:	0f b6 15 96 0f 00 00 	movzx  edx,BYTE PTR [rip+0xf96]        # 80b428 <m_color>
  80a492:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80a494:	48 8b 05 85 0f 00 00 	mov    rax,QWORD PTR [rip+0xf85]        # 80b420 <m_ptr>
  80a49b:	48 8b 0d 86 00 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc20086]        # 42a528 <vpage_base>
  80a4a2:	48 29 c8             	sub    rax,rcx
  80a4a5:	48 89 c2             	mov    rdx,rax
  80a4a8:	8b 05 9a 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2009a]        # 42a548 <vpage_size>
  80a4ae:	8b 0d 88 00 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20088]        # 42a53c <line_chs>
  80a4b4:	29 c8                	sub    eax,ecx
  80a4b6:	01 c0                	add    eax,eax
  80a4b8:	48 98                	cdqe   
  80a4ba:	48 39 c2             	cmp    rdx,rax
  80a4bd:	7c 0b                	jl     80a4ca <write_tty+0x13a>
  80a4bf:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a4c3:	7e 05                	jle    80a4ca <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80a4c5:	e8 bc f8 ff ff       	call   809d86 <scrdown>
    for(int i=0;i<len;i++)
  80a4ca:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a4ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4d1:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a4d4:	0f 8c e9 fe ff ff    	jl     80a3c3 <write_tty+0x33>
  80a4da:	eb 01                	jmp    80a4dd <write_tty+0x14d>
            break;
  80a4dc:	90                   	nop
        }
    }
    set_cur();
  80a4dd:	b8 00 00 00 00       	mov    eax,0x0
  80a4e2:	e8 8c fd ff ff       	call   80a273 <set_cur>
    return 0;
  80a4e7:	b8 00 00 00 00       	mov    eax,0x0
}
  80a4ec:	c9                   	leave  
  80a4ed:	c3                   	ret    

000000000080a4ee <cls>:

void cls(driver_args *args)
{
  80a4ee:	f3 0f 1e fa          	endbr64 
  80a4f2:	55                   	push   rbp
  80a4f3:	48 89 e5             	mov    rbp,rsp
  80a4f6:	48 83 ec 20          	sub    rsp,0x20
  80a4fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80a4fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a505:	eb 16                	jmp    80a51d <cls+0x2f>
    {
        vpage_base[i]=0;
  80a507:	48 8b 15 1a 00 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2001a]        # 42a528 <vpage_base>
  80a50e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a511:	48 98                	cdqe   
  80a513:	48 01 d0             	add    rax,rdx
  80a516:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80a519:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80a51d:	8b 05 25 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20025]        # 42a548 <vpage_size>
  80a523:	01 c0                	add    eax,eax
  80a525:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80a528:	7c dd                	jl     80a507 <cls+0x19>
    }
    m_ptr=vpage_base;
  80a52a:	48 8b 05 f7 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fff7]        # 42a528 <vpage_base>
  80a531:	48 89 05 e8 0e 00 00 	mov    QWORD PTR [rip+0xee8],rax        # 80b420 <m_ptr>
    set_cur();
  80a538:	b8 00 00 00 00       	mov    eax,0x0
  80a53d:	e8 31 fd ff ff       	call   80a273 <set_cur>
}
  80a542:	90                   	nop
  80a543:	c9                   	leave  
  80a544:	c3                   	ret    

000000000080a545 <set_color>:

void set_color(char color)
{
  80a545:	f3 0f 1e fa          	endbr64 
  80a549:	55                   	push   rbp
  80a54a:	48 89 e5             	mov    rbp,rsp
  80a54d:	89 f8                	mov    eax,edi
  80a54f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80a552:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80a556:	88 05 cc 0e 00 00    	mov    BYTE PTR [rip+0xecc],al        # 80b428 <m_color>
}
  80a55c:	90                   	nop
  80a55d:	5d                   	pop    rbp
  80a55e:	c3                   	ret    

000000000080a55f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80a55f:	f3 0f 1e fa          	endbr64 
  80a563:	55                   	push   rbp
  80a564:	48 89 e5             	mov    rbp,rsp
  80a567:	48 83 ec 10          	sub    rsp,0x10
  80a56b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80a56f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a573:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a579:	83 f8 0d             	cmp    eax,0xd
  80a57c:	74 45                	je     80a5c3 <tty_do_req+0x64>
  80a57e:	83 f8 0d             	cmp    eax,0xd
  80a581:	7f 53                	jg     80a5d6 <tty_do_req+0x77>
  80a583:	83 f8 0c             	cmp    eax,0xc
  80a586:	74 2d                	je     80a5b5 <tty_do_req+0x56>
  80a588:	83 f8 0c             	cmp    eax,0xc
  80a58b:	7f 49                	jg     80a5d6 <tty_do_req+0x77>
  80a58d:	83 f8 02             	cmp    eax,0x2
  80a590:	74 07                	je     80a599 <tty_do_req+0x3a>
  80a592:	83 f8 03             	cmp    eax,0x3
  80a595:	74 10                	je     80a5a7 <tty_do_req+0x48>
  80a597:	eb 3d                	jmp    80a5d6 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80a599:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a59d:	48 89 c7             	mov    rdi,rax
  80a5a0:	e8 58 fd ff ff       	call   80a2fd <read_tty>
        break;
  80a5a5:	eb 36                	jmp    80a5dd <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80a5a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5ab:	48 89 c7             	mov    rdi,rax
  80a5ae:	e8 dd fd ff ff       	call   80a390 <write_tty>
        break;
  80a5b3:	eb 28                	jmp    80a5dd <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80a5b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5b9:	48 89 c7             	mov    rdi,rax
  80a5bc:	e8 a2 fb ff ff       	call   80a163 <seek_tty>
        break;
  80a5c1:	eb 1a                	jmp    80a5dd <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80a5c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5c7:	48 89 c7             	mov    rdi,rax
  80a5ca:	b8 00 00 00 00       	mov    eax,0x0
  80a5cf:	e8 bb fb ff ff       	call   80a18f <tell_monitor>
        break;
  80a5d4:	eb 07                	jmp    80a5dd <tty_do_req+0x7e>
    default:return -1;
  80a5d6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a5db:	eb 05                	jmp    80a5e2 <tty_do_req+0x83>
    }
    return 0;
  80a5dd:	b8 00 00 00 00       	mov    eax,0x0
}
  80a5e2:	c9                   	leave  
  80a5e3:	c3                   	ret    

000000000080a5e4 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80a5e4:	f3 0f 1e fa          	endbr64 
  80a5e8:	55                   	push   rbp
  80a5e9:	48 89 e5             	mov    rbp,rsp
  80a5ec:	48 83 ec 10          	sub    rsp,0x10
  80a5f0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80a5f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a5f6:	83 c0 01             	add    eax,0x1
  80a5f9:	0f b7 c0             	movzx  eax,ax
  80a5fc:	be 00 00 00 00       	mov    esi,0x0
  80a601:	89 c7                	mov    edi,eax
  80a603:	e8 38 a2 ff ff       	call   804840 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80a608:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a60b:	83 c0 03             	add    eax,0x3
  80a60e:	0f b7 c0             	movzx  eax,ax
  80a611:	be 80 00 00 00       	mov    esi,0x80
  80a616:	89 c7                	mov    edi,eax
  80a618:	e8 23 a2 ff ff       	call   804840 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80a61d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a620:	0f b7 c0             	movzx  eax,ax
  80a623:	be 03 00 00 00       	mov    esi,0x3
  80a628:	89 c7                	mov    edi,eax
  80a62a:	e8 11 a2 ff ff       	call   804840 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80a62f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a632:	83 c0 01             	add    eax,0x1
  80a635:	0f b7 c0             	movzx  eax,ax
  80a638:	be 00 00 00 00       	mov    esi,0x0
  80a63d:	89 c7                	mov    edi,eax
  80a63f:	e8 fc a1 ff ff       	call   804840 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80a644:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a647:	83 c0 03             	add    eax,0x3
  80a64a:	0f b7 c0             	movzx  eax,ax
  80a64d:	be 03 00 00 00       	mov    esi,0x3
  80a652:	89 c7                	mov    edi,eax
  80a654:	e8 e7 a1 ff ff       	call   804840 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80a659:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a65c:	83 c0 02             	add    eax,0x2
  80a65f:	0f b7 c0             	movzx  eax,ax
  80a662:	be c7 00 00 00       	mov    esi,0xc7
  80a667:	89 c7                	mov    edi,eax
  80a669:	e8 d2 a1 ff ff       	call   804840 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80a66e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a671:	83 c0 04             	add    eax,0x4
  80a674:	0f b7 c0             	movzx  eax,ax
  80a677:	be 0b 00 00 00       	mov    esi,0xb
  80a67c:	89 c7                	mov    edi,eax
  80a67e:	e8 bd a1 ff ff       	call   804840 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80a683:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a686:	83 c0 04             	add    eax,0x4
  80a689:	0f b7 c0             	movzx  eax,ax
  80a68c:	be 1e 00 00 00       	mov    esi,0x1e
  80a691:	89 c7                	mov    edi,eax
  80a693:	e8 a8 a1 ff ff       	call   804840 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80a698:	b8 61 00 00 00       	mov    eax,0x61
  80a69d:	0f b6 d0             	movzx  edx,al
  80a6a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6a3:	0f b7 c0             	movzx  eax,ax
  80a6a6:	89 d6                	mov    esi,edx
  80a6a8:	89 c7                	mov    edi,eax
  80a6aa:	e8 91 a1 ff ff       	call   804840 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80a6af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6b2:	0f b6 c0             	movzx  eax,al
  80a6b5:	89 c7                	mov    edi,eax
  80a6b7:	e8 9d a1 ff ff       	call   804859 <inb>
  80a6bc:	0f b6 d0             	movzx  edx,al
  80a6bf:	b8 61 00 00 00       	mov    eax,0x61
  80a6c4:	0f be c0             	movsx  eax,al
  80a6c7:	39 c2                	cmp    edx,eax
  80a6c9:	75 17                	jne    80a6e2 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80a6cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6ce:	83 c0 04             	add    eax,0x4
  80a6d1:	0f b7 c0             	movzx  eax,ax
  80a6d4:	be 0f 00 00 00       	mov    esi,0xf
  80a6d9:	89 c7                	mov    edi,eax
  80a6db:	e8 60 a1 ff ff       	call   804840 <outb>
  80a6e0:	eb 01                	jmp    80a6e3 <init_com+0xff>
        return;
  80a6e2:	90                   	nop
}
  80a6e3:	c9                   	leave  
  80a6e4:	c3                   	ret    

000000000080a6e5 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80a6e5:	f3 0f 1e fa          	endbr64 
  80a6e9:	55                   	push   rbp
  80a6ea:	48 89 e5             	mov    rbp,rsp
  80a6ed:	48 83 ec 20          	sub    rsp,0x20
  80a6f1:	89 f8                	mov    eax,edi
  80a6f3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80a6f6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80a6fa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a6fd:	83 c0 05             	add    eax,0x5
  80a700:	0f b6 c0             	movzx  eax,al
  80a703:	89 c7                	mov    edi,eax
  80a705:	e8 4f a1 ff ff       	call   804859 <inb>
  80a70a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80a70d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80a711:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80a715:	74 e3                	je     80a6fa <com_putchar+0x15>
    outb(com_base, ch);
  80a717:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80a71b:	0f b6 d0             	movzx  edx,al
  80a71e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a721:	0f b7 c0             	movzx  eax,ax
  80a724:	89 d6                	mov    esi,edx
  80a726:	89 c7                	mov    edi,eax
  80a728:	e8 13 a1 ff ff       	call   804840 <outb>
}
  80a72d:	90                   	nop
  80a72e:	c9                   	leave  
  80a72f:	c3                   	ret    

000000000080a730 <com_puts>:

void com_puts(char* s,int com_port){
  80a730:	f3 0f 1e fa          	endbr64 
  80a734:	55                   	push   rbp
  80a735:	48 89 e5             	mov    rbp,rsp
  80a738:	48 83 ec 10          	sub    rsp,0x10
  80a73c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a740:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80a743:	eb 1d                	jmp    80a762 <com_puts+0x32>
        com_putchar(*s,com_port);
  80a745:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a749:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a74c:	66 98                	cbw    
  80a74e:	0f b7 c0             	movzx  eax,ax
  80a751:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a754:	89 d6                	mov    esi,edx
  80a756:	89 c7                	mov    edi,eax
  80a758:	e8 88 ff ff ff       	call   80a6e5 <com_putchar>
    for(;*s;s++){
  80a75d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80a762:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a766:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a769:	84 c0                	test   al,al
  80a76b:	75 d8                	jne    80a745 <com_puts+0x15>
    }
  80a76d:	90                   	nop
  80a76e:	90                   	nop
  80a76f:	c9                   	leave  
  80a770:	c3                   	ret    

000000000080a771 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80a771:	f3 0f 1e fa          	endbr64 
  80a775:	55                   	push   rbp
  80a776:	48 89 e5             	mov    rbp,rsp
  80a779:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a77d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a781:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80a784:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a788:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80a78b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a792:	eb 1b                	jmp    80a7af <memcpy+0x3e>
        *(dest)=*(src);
  80a794:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a798:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a79b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a79f:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80a7a1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80a7a6:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80a7ab:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a7af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a7b2:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80a7b5:	77 dd                	ja     80a794 <memcpy+0x23>
    }
}
  80a7b7:	90                   	nop
  80a7b8:	90                   	nop
  80a7b9:	5d                   	pop    rbp
  80a7ba:	c3                   	ret    

000000000080a7bb <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80a7bb:	f3 0f 1e fa          	endbr64 
  80a7bf:	55                   	push   rbp
  80a7c0:	48 89 e5             	mov    rbp,rsp
  80a7c3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a7c7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a7cb:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80a7ce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a7d5:	eb 3a                	jmp    80a811 <memcmp+0x56>
    {
        if(*a!=*b)
  80a7d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7db:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a7de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7e5:	38 c2                	cmp    dl,al
  80a7e7:	74 1a                	je     80a803 <memcmp+0x48>
            return *a-*b;
  80a7e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7ed:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7f0:	0f b6 d0             	movzx  edx,al
  80a7f3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a7f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7fa:	0f b6 c8             	movzx  ecx,al
  80a7fd:	89 d0                	mov    eax,edx
  80a7ff:	29 c8                	sub    eax,ecx
  80a801:	eb 1b                	jmp    80a81e <memcmp+0x63>
        a++;
  80a803:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80a808:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80a80d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a811:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a814:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80a817:	7c be                	jl     80a7d7 <memcmp+0x1c>
    }
    return 0;
  80a819:	b8 00 00 00 00       	mov    eax,0x0
}
  80a81e:	5d                   	pop    rbp
  80a81f:	c3                   	ret    

000000000080a820 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80a820:	f3 0f 1e fa          	endbr64 
  80a824:	55                   	push   rbp
  80a825:	48 89 e5             	mov    rbp,rsp
  80a828:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a82c:	89 f0                	mov    eax,esi
  80a82e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80a831:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80a834:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a83b:	eb 16                	jmp    80a853 <memset+0x33>
        *(buf++)=value;
  80a83d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a841:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a845:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a849:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80a84d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80a84f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a853:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a856:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80a859:	72 e2                	jb     80a83d <memset+0x1d>
    }
}
  80a85b:	90                   	nop
  80a85c:	90                   	nop
  80a85d:	5d                   	pop    rbp
  80a85e:	c3                   	ret    

000000000080a85f <get_mem_size>:

u32 get_mem_size(){
  80a85f:	f3 0f 1e fa          	endbr64 
  80a863:	55                   	push   rbp
  80a864:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80a867:	8b 05 ef fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcef]        # 42a55c <mem_end>
}
  80a86d:	5d                   	pop    rbp
  80a86e:	c3                   	ret    

000000000080a86f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80a86f:	f3 0f 1e fa          	endbr64 
  80a873:	55                   	push   rbp
  80a874:	48 89 e5             	mov    rbp,rsp
  80a877:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a87b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80a87f:	eb 1d                	jmp    80a89e <strcpy+0x2f>
        *(dest++)=*(buf++);
  80a881:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80a885:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a889:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80a88d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a891:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a895:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a899:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a89c:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80a89e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a8a2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8a5:	84 c0                	test   al,al
  80a8a7:	75 d8                	jne    80a881 <strcpy+0x12>
    }
    *dest='\0';
  80a8a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8ad:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a8b0:	90                   	nop
  80a8b1:	5d                   	pop    rbp
  80a8b2:	c3                   	ret    

000000000080a8b3 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80a8b3:	f3 0f 1e fa          	endbr64 
  80a8b7:	55                   	push   rbp
  80a8b8:	48 89 e5             	mov    rbp,rsp
  80a8bb:	48 83 ec 30          	sub    rsp,0x30
  80a8bf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a8c3:	89 f0                	mov    eax,esi
  80a8c5:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80a8c8:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a8cd:	0f 84 9c 00 00 00    	je     80a96f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80a8d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a8d7:	48 89 c6             	mov    rsi,rax
  80a8da:	bf 80 a5 42 00       	mov    edi,0x42a580
  80a8df:	e8 8b ff ff ff       	call   80a86f <strcpy>
        char* ptr=strtokkee;
  80a8e4:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80a8eb:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80a8ec:	c7 05 8a fe c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1fe8a],0x0        # 42a780 <tokptr>
  80a8f3:	00 00 00 
  80a8f6:	eb 1c                	jmp    80a914 <strtok+0x61>
  80a8f8:	8b 05 82 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe82]        # 42a780 <tokptr>
  80a8fe:	83 c0 01             	add    eax,0x1
  80a901:	99                   	cdq    
  80a902:	c1 ea 17             	shr    edx,0x17
  80a905:	01 d0                	add    eax,edx
  80a907:	25 ff 01 00 00       	and    eax,0x1ff
  80a90c:	29 d0                	sub    eax,edx
  80a90e:	89 05 6c fe c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fe6c],eax        # 42a780 <tokptr>
  80a914:	8b 05 66 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe66]        # 42a780 <tokptr>
  80a91a:	48 98                	cdqe   
  80a91c:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a923:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a926:	74 13                	je     80a93b <strtok+0x88>
  80a928:	8b 05 52 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe52]        # 42a780 <tokptr>
  80a92e:	48 98                	cdqe   
  80a930:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a937:	84 c0                	test   al,al
  80a939:	75 bd                	jne    80a8f8 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80a93b:	8b 05 3f fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe3f]        # 42a780 <tokptr>
  80a941:	48 98                	cdqe   
  80a943:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80a94a:	8b 05 30 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe30]        # 42a780 <tokptr>
  80a950:	83 c0 01             	add    eax,0x1
  80a953:	99                   	cdq    
  80a954:	c1 ea 17             	shr    edx,0x17
  80a957:	01 d0                	add    eax,edx
  80a959:	25 ff 01 00 00       	and    eax,0x1ff
  80a95e:	29 d0                	sub    eax,edx
  80a960:	89 05 1a fe c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fe1a],eax        # 42a780 <tokptr>
        return ptr;
  80a966:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a96a:	e9 9e 00 00 00       	jmp    80aa0d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80a96f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80a976:	8b 05 04 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe04]        # 42a780 <tokptr>
  80a97c:	48 98                	cdqe   
  80a97e:	48 05 80 a5 42 00    	add    rax,0x42a580
  80a984:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80a988:	eb 20                	jmp    80a9aa <strtok+0xf7>
  80a98a:	8b 05 f0 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdf0]        # 42a780 <tokptr>
  80a990:	83 c0 01             	add    eax,0x1
  80a993:	99                   	cdq    
  80a994:	c1 ea 17             	shr    edx,0x17
  80a997:	01 d0                	add    eax,edx
  80a999:	25 ff 01 00 00       	and    eax,0x1ff
  80a99e:	29 d0                	sub    eax,edx
  80a9a0:	89 05 da fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fdda],eax        # 42a780 <tokptr>
  80a9a6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a9aa:	8b 05 d0 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdd0]        # 42a780 <tokptr>
  80a9b0:	48 98                	cdqe   
  80a9b2:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a9b9:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a9bc:	74 13                	je     80a9d1 <strtok+0x11e>
  80a9be:	8b 05 bc fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdbc]        # 42a780 <tokptr>
  80a9c4:	48 98                	cdqe   
  80a9c6:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a9cd:	84 c0                	test   al,al
  80a9cf:	75 b9                	jne    80a98a <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80a9d1:	8b 05 a9 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fda9]        # 42a780 <tokptr>
  80a9d7:	48 98                	cdqe   
  80a9d9:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80a9e0:	8b 05 9a fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd9a]        # 42a780 <tokptr>
  80a9e6:	83 c0 01             	add    eax,0x1
  80a9e9:	99                   	cdq    
  80a9ea:	c1 ea 17             	shr    edx,0x17
  80a9ed:	01 d0                	add    eax,edx
  80a9ef:	25 ff 01 00 00       	and    eax,0x1ff
  80a9f4:	29 d0                	sub    eax,edx
  80a9f6:	89 05 84 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd84],eax        # 42a780 <tokptr>
    if(c)
  80a9fc:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80aa00:	74 06                	je     80aa08 <strtok+0x155>
        return ptr;
  80aa02:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa06:	eb 05                	jmp    80aa0d <strtok+0x15a>
    else
        return (void*)0;
  80aa08:	b8 00 00 00 00       	mov    eax,0x0
}
  80aa0d:	c9                   	leave  
  80aa0e:	c3                   	ret    

000000000080aa0f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80aa0f:	f3 0f 1e fa          	endbr64 
  80aa13:	55                   	push   rbp
  80aa14:	48 89 e5             	mov    rbp,rsp
  80aa17:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa1b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80aa1f:	eb 3c                	jmp    80aa5d <strcmp+0x4e>
		if(*s1>*s2)
  80aa21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa25:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80aa28:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa2c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa2f:	38 c2                	cmp    dl,al
  80aa31:	7e 07                	jle    80aa3a <strcmp+0x2b>
			return 1;
  80aa33:	b8 01 00 00 00       	mov    eax,0x1
  80aa38:	eb 52                	jmp    80aa8c <strcmp+0x7d>
		else if(*s1<*s2)
  80aa3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa3e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80aa41:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa45:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa48:	38 c2                	cmp    dl,al
  80aa4a:	7d 07                	jge    80aa53 <strcmp+0x44>
			return -1;
  80aa4c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80aa51:	eb 39                	jmp    80aa8c <strcmp+0x7d>
		s1++;
  80aa53:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80aa58:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80aa5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa64:	84 c0                	test   al,al
  80aa66:	74 0b                	je     80aa73 <strcmp+0x64>
  80aa68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa6f:	84 c0                	test   al,al
  80aa71:	75 ae                	jne    80aa21 <strcmp+0x12>
	}
	if(*s1==*s2)
  80aa73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa77:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80aa7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa7e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa81:	38 c2                	cmp    dl,al
  80aa83:	75 07                	jne    80aa8c <strcmp+0x7d>
		return 0;
  80aa85:	b8 00 00 00 00       	mov    eax,0x0
  80aa8a:	eb 00                	jmp    80aa8c <strcmp+0x7d>
}
  80aa8c:	5d                   	pop    rbp
  80aa8d:	c3                   	ret    

000000000080aa8e <strlen>:

int strlen(char *str)
{
  80aa8e:	f3 0f 1e fa          	endbr64 
  80aa92:	55                   	push   rbp
  80aa93:	48 89 e5             	mov    rbp,rsp
  80aa96:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80aa9a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80aaa1:	eb 09                	jmp    80aaac <strlen+0x1e>
  80aaa3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80aaa8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80aaac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aab0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aab3:	84 c0                	test   al,al
  80aab5:	75 ec                	jne    80aaa3 <strlen+0x15>
    return l;
  80aab7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80aaba:	5d                   	pop    rbp
  80aabb:	c3                   	ret    

000000000080aabc <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80aabc:	f3 0f 1e fa          	endbr64 
  80aac0:	55                   	push   rbp
  80aac1:	48 89 e5             	mov    rbp,rsp
  80aac4:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80aacb:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80aad2:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80aad9:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80aae0:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80aae7:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80aaee:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80aaf5:	84 c0                	test   al,al
  80aaf7:	74 20                	je     80ab19 <sprintf+0x5d>
  80aaf9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80aafd:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80ab01:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80ab05:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80ab09:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80ab0d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80ab11:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80ab15:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80ab19:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ab20:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80ab27:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ab2e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80ab35:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80ab3c:	00 00 00 
    while (*pstr!='\n')
  80ab3f:	eb 39                	jmp    80ab7a <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80ab41:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ab48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab4b:	3c 25                	cmp    al,0x25
  80ab4d:	75 15                	jne    80ab64 <sprintf+0xa8>
  80ab4f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80ab56:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab59:	3c 25                	cmp    al,0x25
  80ab5b:	74 07                	je     80ab64 <sprintf+0xa8>
            argnum++;
  80ab5d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80ab64:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ab6b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80ab72:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ab79:	01 
    while (*pstr!='\n')
  80ab7a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ab81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab84:	3c 0a                	cmp    al,0xa
  80ab86:	75 b9                	jne    80ab41 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80ab88:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80ab8f:	00 00 00 
  80ab92:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80ab99:	00 00 00 
  80ab9c:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80aba0:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80aba7:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80abae:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80abb5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80abbc:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80abc3:	e9 e2 01 00 00       	jmp    80adaa <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80abc8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80abcf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80abd2:	3c 25                	cmp    al,0x25
  80abd4:	0f 85 aa 01 00 00    	jne    80ad84 <sprintf+0x2c8>
  80abda:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80abe1:	48 83 c0 01          	add    rax,0x1
  80abe5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80abe8:	84 c0                	test   al,al
  80abea:	0f 84 94 01 00 00    	je     80ad84 <sprintf+0x2c8>
            pstr++;
  80abf0:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80abf7:	01 
            if(*pstr=='x'){
  80abf8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80abff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac02:	3c 78                	cmp    al,0x78
  80ac04:	75 64                	jne    80ac6a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80ac06:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ac0c:	83 f8 2f             	cmp    eax,0x2f
  80ac0f:	77 23                	ja     80ac34 <sprintf+0x178>
  80ac11:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ac18:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ac1e:	89 d2                	mov    edx,edx
  80ac20:	48 01 d0             	add    rax,rdx
  80ac23:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ac29:	83 c2 08             	add    edx,0x8
  80ac2c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ac32:	eb 12                	jmp    80ac46 <sprintf+0x18a>
  80ac34:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80ac3b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80ac3f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80ac46:	8b 00                	mov    eax,DWORD PTR [rax]
  80ac48:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80ac4e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80ac54:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ac5b:	89 d6                	mov    esi,edx
  80ac5d:	48 89 c7             	mov    rdi,rax
  80ac60:	e8 4e 02 00 00       	call   80aeb3 <sprint_hex>
            if(*pstr=='x'){
  80ac65:	e9 38 01 00 00       	jmp    80ada2 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80ac6a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ac71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac74:	3c 73                	cmp    al,0x73
  80ac76:	75 68                	jne    80ace0 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80ac78:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ac7e:	83 f8 2f             	cmp    eax,0x2f
  80ac81:	77 23                	ja     80aca6 <sprintf+0x1ea>
  80ac83:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ac8a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ac90:	89 d2                	mov    edx,edx
  80ac92:	48 01 d0             	add    rax,rdx
  80ac95:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ac9b:	83 c2 08             	add    edx,0x8
  80ac9e:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80aca4:	eb 12                	jmp    80acb8 <sprintf+0x1fc>
  80aca6:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80acad:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80acb1:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80acb8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80acbb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80acc2:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80acc9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80acd0:	48 89 d6             	mov    rsi,rdx
  80acd3:	48 89 c7             	mov    rdi,rax
  80acd6:	e8 5a 02 00 00       	call   80af35 <sprintn>
            if(*pstr=='x'){
  80acdb:	e9 c2 00 00 00       	jmp    80ada2 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80ace0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ace7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acea:	3c 64                	cmp    al,0x64
  80acec:	75 66                	jne    80ad54 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80acee:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80acf4:	83 f8 2f             	cmp    eax,0x2f
  80acf7:	77 23                	ja     80ad1c <sprintf+0x260>
  80acf9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ad00:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ad06:	89 d2                	mov    edx,edx
  80ad08:	48 01 d0             	add    rax,rdx
  80ad0b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ad11:	83 c2 08             	add    edx,0x8
  80ad14:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ad1a:	eb 12                	jmp    80ad2e <sprintf+0x272>
  80ad1c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80ad23:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80ad27:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80ad2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad31:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80ad38:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80ad3f:	89 c2                	mov    edx,eax
  80ad41:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ad48:	89 d6                	mov    esi,edx
  80ad4a:	48 89 c7             	mov    rdi,rax
  80ad4d:	e8 ad 00 00 00       	call   80adff <sprint_decimal>
            if(*pstr=='x'){
  80ad52:	eb 4e                	jmp    80ada2 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80ad54:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ad5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad5e:	3c 63                	cmp    al,0x63
  80ad60:	75 02                	jne    80ad64 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80ad62:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80ad64:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ad6b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad6e:	0f be d0             	movsx  edx,al
  80ad71:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ad78:	89 d6                	mov    esi,edx
  80ad7a:	48 89 c7             	mov    rdi,rax
  80ad7d:	e8 3e 00 00 00       	call   80adc0 <sprintchar>
            if(*pstr=='x'){
  80ad82:	eb 1e                	jmp    80ada2 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80ad84:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ad8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad8e:	0f be d0             	movsx  edx,al
  80ad91:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ad98:	89 d6                	mov    esi,edx
  80ad9a:	48 89 c7             	mov    rdi,rax
  80ad9d:	e8 1e 00 00 00       	call   80adc0 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80ada2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ada9:	01 
  80adaa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80adb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80adb4:	84 c0                	test   al,al
  80adb6:	0f 85 0c fe ff ff    	jne    80abc8 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80adbc:	90                   	nop
  80adbd:	90                   	nop
  80adbe:	c9                   	leave  
  80adbf:	c3                   	ret    

000000000080adc0 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80adc0:	f3 0f 1e fa          	endbr64 
  80adc4:	55                   	push   rbp
  80adc5:	48 89 e5             	mov    rbp,rsp
  80adc8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80adcc:	89 f0                	mov    eax,esi
  80adce:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80add1:	eb 05                	jmp    80add8 <sprintchar+0x18>
        dist++;
  80add3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80add8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80addc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80addf:	84 c0                	test   al,al
  80ade1:	75 f0                	jne    80add3 <sprintchar+0x13>
    *dist++=c;
  80ade3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ade7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80adeb:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80adef:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80adf3:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80adf5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adf9:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80adfc:	90                   	nop
  80adfd:	5d                   	pop    rbp
  80adfe:	c3                   	ret    

000000000080adff <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80adff:	f3 0f 1e fa          	endbr64 
  80ae03:	55                   	push   rbp
  80ae04:	48 89 e5             	mov    rbp,rsp
  80ae07:	48 83 ec 30          	sub    rsp,0x30
  80ae0b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ae0f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80ae12:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80ae19:	eb 65                	jmp    80ae80 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80ae1b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80ae1e:	48 63 c2             	movsxd rax,edx
  80ae21:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80ae28:	48 c1 e8 20          	shr    rax,0x20
  80ae2c:	c1 f8 02             	sar    eax,0x2
  80ae2f:	89 d6                	mov    esi,edx
  80ae31:	c1 fe 1f             	sar    esi,0x1f
  80ae34:	29 f0                	sub    eax,esi
  80ae36:	89 c1                	mov    ecx,eax
  80ae38:	89 c8                	mov    eax,ecx
  80ae3a:	c1 e0 02             	shl    eax,0x2
  80ae3d:	01 c8                	add    eax,ecx
  80ae3f:	01 c0                	add    eax,eax
  80ae41:	89 d1                	mov    ecx,edx
  80ae43:	29 c1                	sub    ecx,eax
  80ae45:	89 c8                	mov    eax,ecx
  80ae47:	83 c0 30             	add    eax,0x30
  80ae4a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80ae4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ae50:	8d 50 01             	lea    edx,[rax+0x1]
  80ae53:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ae56:	48 98                	cdqe   
  80ae58:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80ae5c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80ae60:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ae63:	48 63 d0             	movsxd rdx,eax
  80ae66:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80ae6d:	48 c1 ea 20          	shr    rdx,0x20
  80ae71:	c1 fa 02             	sar    edx,0x2
  80ae74:	c1 f8 1f             	sar    eax,0x1f
  80ae77:	89 c1                	mov    ecx,eax
  80ae79:	89 d0                	mov    eax,edx
  80ae7b:	29 c8                	sub    eax,ecx
  80ae7d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80ae80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ae83:	83 f8 0f             	cmp    eax,0xf
  80ae86:	76 93                	jbe    80ae1b <sprint_decimal+0x1c>
    }
    while(p>0)
  80ae88:	eb 1f                	jmp    80aea9 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80ae8a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80ae8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ae91:	48 98                	cdqe   
  80ae93:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80ae98:	0f be d0             	movsx  edx,al
  80ae9b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ae9f:	89 d6                	mov    esi,edx
  80aea1:	48 89 c7             	mov    rdi,rax
  80aea4:	e8 17 ff ff ff       	call   80adc0 <sprintchar>
    while(p>0)
  80aea9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80aead:	7f db                	jg     80ae8a <sprint_decimal+0x8b>
    }
}
  80aeaf:	90                   	nop
  80aeb0:	90                   	nop
  80aeb1:	c9                   	leave  
  80aeb2:	c3                   	ret    

000000000080aeb3 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80aeb3:	f3 0f 1e fa          	endbr64 
  80aeb7:	55                   	push   rbp
  80aeb8:	48 89 e5             	mov    rbp,rsp
  80aebb:	48 83 ec 20          	sub    rsp,0x20
  80aebf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80aec3:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80aec6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80aecd:	eb 35                	jmp    80af04 <sprint_hex+0x51>
        unsigned char a=c%16;
  80aecf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80aed2:	83 e0 0f             	and    eax,0xf
  80aed5:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80aed8:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80aedc:	76 06                	jbe    80aee4 <sprint_hex+0x31>
  80aede:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80aee2:	eb 04                	jmp    80aee8 <sprint_hex+0x35>
        else a+='0';
  80aee4:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80aee8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80aeeb:	8d 50 01             	lea    edx,[rax+0x1]
  80aeee:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80aef1:	48 98                	cdqe   
  80aef3:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80aef7:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80aefb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80aefe:	c1 e8 04             	shr    eax,0x4
  80af01:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80af04:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80af08:	7e c5                	jle    80aecf <sprint_hex+0x1c>
    }
    while(p>0)
  80af0a:	eb 1f                	jmp    80af2b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80af0c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80af10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80af13:	48 98                	cdqe   
  80af15:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80af1a:	0f be d0             	movsx  edx,al
  80af1d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af21:	89 d6                	mov    esi,edx
  80af23:	48 89 c7             	mov    rdi,rax
  80af26:	e8 95 fe ff ff       	call   80adc0 <sprintchar>
    while(p>0)
  80af2b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80af2f:	7f db                	jg     80af0c <sprint_hex+0x59>
    }
}
  80af31:	90                   	nop
  80af32:	90                   	nop
  80af33:	c9                   	leave  
  80af34:	c3                   	ret    

000000000080af35 <sprintn>:
void sprintn(char *dist,char *str)
{
  80af35:	f3 0f 1e fa          	endbr64 
  80af39:	55                   	push   rbp
  80af3a:	48 89 e5             	mov    rbp,rsp
  80af3d:	48 83 ec 10          	sub    rsp,0x10
  80af41:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80af45:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80af49:	eb 20                	jmp    80af6b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80af4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af4f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80af53:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80af57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af5a:	0f be d0             	movsx  edx,al
  80af5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af61:	89 d6                	mov    esi,edx
  80af63:	48 89 c7             	mov    rdi,rax
  80af66:	e8 55 fe ff ff       	call   80adc0 <sprintchar>
    while(*str!='\0')
  80af6b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80af72:	84 c0                	test   al,al
  80af74:	75 d5                	jne    80af4b <sprintn+0x16>
    }
  80af76:	90                   	nop
  80af77:	90                   	nop
  80af78:	c9                   	leave  
  80af79:	c3                   	ret    
  80af7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080af80 <create_zero>:
  80af80:	e8 ce 86 ff ff       	call   803653 <req_proc>
  80af85:	83 f8 ff             	cmp    eax,0xffffffff
  80af88:	74 0c                	je     80af96 <create_zero.retu>
  80af8a:	e8 bd 87 ff ff       	call   80374c <set_proc>
  80af8f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80af93:	83 c4 40             	add    esp,0x40

000000000080af96 <create_zero.retu>:
  80af96:	c3                   	ret    

000000000080af97 <fill_desc>:
  80af97:	55                   	push   rbp
  80af98:	48 89 e5             	mov    rbp,rsp
  80af9b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80af9f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80afa3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80afa7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80afab:	be ea b0 80 00       	mov    esi,0x80b0ea
  80afb0:	c7 04 25 ea b0 80 00 	mov    DWORD PTR ds:0x80b0ea,0x0
  80afb7:	00 00 00 00 
  80afbb:	c7 04 25 ee b0 80 00 	mov    DWORD PTR ds:0x80b0ee,0x0
  80afc2:	00 00 00 00 
  80afc6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80afca:	c1 e9 10             	shr    ecx,0x10
  80afcd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80afd2:	c1 ea 10             	shr    edx,0x10
  80afd5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80afd9:	66 c1 ea 08          	shr    dx,0x8
  80afdd:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80afe1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80afe6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80afea:	c1 e1 08             	shl    ecx,0x8
  80afed:	09 cf                	or     edi,ecx
  80afef:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80aff3:	8b 14 25 ea b0 80 00 	mov    edx,DWORD PTR ds:0x80b0ea
  80affa:	67 89 10             	mov    DWORD PTR [eax],edx
  80affd:	8b 14 25 ee b0 80 00 	mov    edx,DWORD PTR ds:0x80b0ee
  80b004:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80b008:	c9                   	leave  
  80b009:	c3                   	ret    

000000000080b00a <switch_proc_asm>:
  80b00a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80b010:	66 89 04 25 28 b0 80 	mov    WORD PTR ds:0x80b028,ax
  80b017:	00 
  80b018:	c7 04 25 24 b0 80 00 	mov    DWORD PTR ds:0x80b024,0x0
  80b01f:	00 00 00 00 

000000000080b023 <switch_proc_asm.ljmp>:
  80b023:	ea                   	(bad)  
  80b024:	00 00                	add    BYTE PTR [rax],al
  80b026:	00 00                	add    BYTE PTR [rax],al
  80b028:	00 00                	add    BYTE PTR [rax],al
  80b02a:	c3                   	ret    

000000000080b02b <switch_to_old>:
  80b02b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80b030:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80b034:	bf 9c b0 80 00       	mov    edi,0x80b09c
  80b039:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80b03d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80b041:	89 c1                	mov    ecx,eax
  80b043:	83 e9 04             	sub    ecx,0x4
  80b046:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80b049:	50                   	push   rax
  80b04a:	89 f5                	mov    ebp,esi
  80b04c:	83 c5 28             	add    ebp,0x28
  80b04f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b053:	50                   	push   rax
  80b054:	83 c5 04             	add    ebp,0x4
  80b057:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b05b:	50                   	push   rax
  80b05c:	83 c5 04             	add    ebp,0x4
  80b05f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b063:	50                   	push   rax
  80b064:	83 c5 04             	add    ebp,0x4
  80b067:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b06b:	50                   	push   rax
  80b06c:	83 c5 04             	add    ebp,0x4
  80b06f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b073:	50                   	push   rax
  80b074:	83 c5 04             	add    ebp,0x4
  80b077:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b07b:	50                   	push   rax
  80b07c:	83 c5 04             	add    ebp,0x4
  80b07f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b083:	50                   	push   rax
  80b084:	83 c5 04             	add    ebp,0x4
  80b087:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b08b:	50                   	push   rax
  80b08c:	83 c5 04             	add    ebp,0x4
  80b08f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80b093:	0f 22 d8             	mov    cr3,rax
  80b096:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80b09a:	50                   	push   rax
  80b09b:	5c                   	pop    rsp

000000000080b09c <switch_to_old.leap>:
  80b09c:	ea                   	(bad)  
  80b09d:	00 00                	add    BYTE PTR [rax],al
  80b09f:	00 00                	add    BYTE PTR [rax],al
  80b0a1:	08 00                	or     BYTE PTR [rax],al

000000000080b0a3 <save_context>:
  80b0a3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80b0a8:	83 c0 44             	add    eax,0x44
  80b0ab:	b9 08 00 00 00       	mov    ecx,0x8
  80b0b0:	89 e7                	mov    edi,esp

000000000080b0b2 <save_context.loops>:
  80b0b2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80b0b5:	67 89 10             	mov    DWORD PTR [eax],edx
  80b0b8:	83 c7 04             	add    edi,0x4
  80b0bb:	83 e8 04             	sub    eax,0x4
  80b0be:	e2 f2                	loop   80b0b2 <save_context.loops>
  80b0c0:	5b                   	pop    rbx
  80b0c1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80b0c6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80b0ca:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80b0cf:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80b0d3:	c3                   	ret    

000000000080b0d4 <move_to_user_mode>:
  80b0d4:	66 b8 20 00          	mov    ax,0x20
  80b0d8:	8e d8                	mov    ds,eax
  80b0da:	8e c0                	mov    es,eax
  80b0dc:	8e e8                	mov    gs,eax
  80b0de:	6a 20                	push   0x20
  80b0e0:	54                   	push   rsp
  80b0e1:	6a 18                	push   0x18
  80b0e3:	68 e9 b0 80 00       	push   0x80b0e9
  80b0e8:	cf                   	iret   

000000000080b0e9 <move_to_user_mode.done>:
  80b0e9:	c3                   	ret    

000000000080b0ea <desc>:
	...

000000000080b0f2 <ret_sys_call>:
  80b0f2:	58                   	pop    rax
  80b0f3:	8e d8                	mov    ds,eax
  80b0f5:	58                   	pop    rax
  80b0f6:	8e c0                	mov    es,eax
  80b0f8:	41 5f                	pop    r15
  80b0fa:	41 5e                	pop    r14
  80b0fc:	41 5d                	pop    r13
  80b0fe:	41 5c                	pop    r12
  80b100:	41 5b                	pop    r11
  80b102:	41 5a                	pop    r10
  80b104:	41 59                	pop    r9
  80b106:	41 58                	pop    r8
  80b108:	5e                   	pop    rsi
  80b109:	5f                   	pop    rdi
  80b10a:	5a                   	pop    rdx
  80b10b:	59                   	pop    rcx
  80b10c:	5b                   	pop    rbx
  80b10d:	58                   	pop    rax

000000000080b10e <tmp>:
  80b10e:	48 0f 07             	sysretq 
